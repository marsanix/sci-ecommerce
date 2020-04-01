<?php

$api->get('parts/search', [
    'as' => 'parts.search',
    'uses' => 'PartController@search',
]);