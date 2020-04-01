<?php

return [
    'timezone' => 'Asia/Jakarta',
    'providers' => [
        /*
        * Package Service Providers...
        */
        Intervention\Image\ImageServiceProvider::class,
    ],
    'aliases' => [
        'Image' => Intervention\Image\Facades\Image::class,
    ]

];