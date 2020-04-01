<?php

// create token
$api->post('auth', [
    'as' => 'authorizations.store',
    'uses' => 'AuthController@store',
]);

// login
$api->post('login', [
    'as' => 'authorizations.login',
    'uses' => 'AuthController@login',
]);

// register
$api->post('register', [
    'as' => 'authorizations.register',
    'uses' => 'AuthController@register',
]);

// refresh jwt token
$api->put('authorizations/current', [
    'as' => 'authorizations.update',
    'uses' => 'AuthController@update',
]);
