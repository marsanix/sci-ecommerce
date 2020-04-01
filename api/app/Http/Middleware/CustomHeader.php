<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
//use Illuminate\Contracts\Auth\Factory as Auth;
//use JWTAuth;
use App\Models\Authorization;
use Illuminate\Contracts\Auth\Factory as Auth;
use App\Models\Jwt;
use Illuminate\Support\Facades\Log;

class CustomHeader
{

    protected $auth;

    public function __construct(Auth $auth)
    {
        $this->auth = $auth;
    }

    public function handle($request, Closure $next, $guard = null)
    {

        // Log::debug('$request: '.$request);    

        /********** START CHECK TOKEN IS NOT TIPU-TIPU **********/        
        $token = $request->server->get('HTTP_AUTHORIZATION');
        // Log::debug('CustomHeader->Token: '.$token);
        // Log::debug('HTTP_USER_AGENT: '.$request->server->get('HTTP_USER_AGENT'));
        if(!empty($token)) {
            $token = str_replace("Bearer ", "", $token);        
            list($headb64, $bodyb64, $cryptob64) = explode('.', $token);
            $payload = json_decode(base64_decode($bodyb64));
            $Jwt = Jwt::where([
                            ['sub', '=', $payload->sub],
                            ['jti', '=', $payload->jti],
                            ['token', '=', $token],                      
                            // ['ip_address', '=', $request->ip()],                      
                            ['user_agent', '=', $request->server->get('HTTP_USER_AGENT')],                      
                        ])->first();    
            if(!$Jwt) {
                Log::info('ATTACT_TOKEN: '. $token.', IP: '.$request->ip().', UserAgent: '.$request->server->get('HTTP_USER_AGENT'));     

                $payload = json_decode(base64_decode($bodyb64));
                $Jwt = Jwt::where([
                    ['sub', '=', $payload->sub],
                    ['jti', '=', $payload->jti],
                    ['token', '=', $token],                      
                ])->first();    
                if($Jwt) {
                    $Jwt->delete();
                }    

                \Auth::logout();
                return $this->response->errorUnauthorized('force_delete_token');
            }
        }        
        /********** END CHECK TOKEN IS NOT TIPU-TIPU **********/

        // $response->header('Access-Control-Expose-Headers', 'Authorization'); // not use
        
        $response = $next($request);
        

        return $response;
    }
}
