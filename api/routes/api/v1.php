<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
 */
$api = app('Dingo\Api\Routing\Router');

$api->version('v1', [
    'namespace' => 'App\Http\Controllers\Api\V1'
], function ($api) {

    include (__DIR__ . '/auth.php');
    include (__DIR__ . '/part.php');

    // need authentication
    $api->group(['middleware' => ['api.auth']], function ($api) {
        // logout
        $api->delete('logout', [
            'as' => 'authorizations.logout',
            'uses' => 'AuthController@destroy',
        ]);
        $api->delete('authorizations/current', [
            'as' => 'authorizations.logout',
            'uses' => 'AuthController@destroy',
        ]);

        include (__DIR__ . '/dashboard.php');

    });
});
