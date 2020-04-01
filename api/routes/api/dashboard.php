<?php

$api->get('dashboard', [
    'as' => 'dashboard.get',
    'uses' => 'DashboardController@get',
]);