<?php

use App\Models\User;
use Illuminate\Database\Seeder;
use Carbon\Carbon;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Fill a lot of users
        // factory(User::class, 10)->create();

        User::truncate();
        $data = [];

        array_push($data, [
            'name'       => 'Superadmin',
            'email'      => 'admin@demo.com',
            'password'   => app('hash')->make('123456'),
            'group_id'   => '-1',
            'birthdate'  => Carbon::now('Asia/Jakarta')->addMinutes(config('jwt.ttl'))->toDateTimeString(),
            'active'     => 1
        ]);

        array_push($data, [
            'name'       => 'user',
            'email'      => 'user@demo.com',
            'password'   => app('hash')->make('123456'),
            'group_id'       => '1',
            'birthdate'  => Carbon::now('Asia/Jakarta')->addMinutes(config('jwt.ttl'))->toDateTimeString(),
            'active'     => 1
        ]);

        User::insert($data);
    }
}
