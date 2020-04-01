<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Contracts\Auth\Factory as Auth;

class Authenticate
{
    /**
     * The authentication guard factory instance.
     *
     * @var \Illuminate\Contracts\Auth\Factory
     */
    protected $auth;

    /**
     * Create a new middleware instance.
     *
     * @param \Illuminate\Contracts\Auth\Factory $auth
     */
    public function __construct(Auth $auth)
    {
        $this->auth = $auth; 
    }

    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure                 $next
     * @param string|null              $guard
     *
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if ($this->auth->guard($guard)->guest()) {
            return response('Unauthorized.', 401);
        }

        //$response = $next($request);
        return $next($request);

        // $newToken = Auth::guard($guard)->refresh();
        // response->header('New-Token', $newToken);
        //
        // if (Auth::guard($guard)->check() && method_exists(Auth::guard($guard), ‘refresh’))
        // {
        //   // Refresh the token, and place it in the headers for the user to pick up at the front end.
        //   $response->headers->set(‘Authorization’, ‘Bearer ‘ . Auth::guard($guard)->refresh());
        // }
        // return $response;
    }
}
