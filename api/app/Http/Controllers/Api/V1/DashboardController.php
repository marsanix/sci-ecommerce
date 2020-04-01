<?php
namespace App\Http\Controllers\Api\V1;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;
use App\Models\Jwt;

class DashboardController extends BaseController
{
    private $pendaftaran;

    public function __construct(Request $request) {
        
        // return $this->response->errorUnauthorized();
        /********** START CHECK TOKEN IS NOT TIPU-TIPU **********/
        // $token = \Auth::getToken();
        // list($headb64, $bodyb64, $cryptob64) = explode('.', $token);
        // $payload = json_decode(base64_decode($bodyb64));
        // $Jwt = Jwt::where([
        //                 ['sub', '=', $payload->sub],
        //                 ['jti', '=', $payload->jti],
        //                 ['token', '=', $token],                      
        //                 ['ip_address', '=', $request->ip()],                      
        //                 ['user_agent', '=', $request->server->get('HTTP_USER_AGENT')],                      
        //             ])->first();     
        // if(!$Jwt) {
        //     Log::debug('ATTACT_TOKEN: '. json_encode($Jwt));            
        //     \Auth::logout();
        //     return $this->response->errorUnauthorized();
        // }
        /********** END CHECK TOKEN IS NOT TIPU-TIPU **********/

    }

    public function get(Request $request)
    { 
                
    }
   
}