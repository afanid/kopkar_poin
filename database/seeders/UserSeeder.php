<?php

namespace Database\Seeders;

use App\Models\ConfigPayment;
use App\Models\MainPayment;
use App\Models\Roles;
use App\Models\User;
use Faker\Factory;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $main_amount = new ConfigPayment();
        $main_amount->name = 'main_payment';
        $main_amount->paid_off_amount = 500000;
        $main_amount->save();

        $main_amount = new ConfigPayment();
        $main_amount->name = 'monthly_payment';
        $main_amount->paid_off_amount = 50000;
        $main_amount->save();

        $roles = ['admin', 'user'];

        foreach($roles as $item) {
            $dbrole = new Roles();
            $dbrole->name = $item;
            $dbrole->save();
        }

        $role = Roles::where('name', 'admin')->first();

        $user = new User();
        $user->role_id = $role->id;
        $user->username = 'admin';
        $user->password = Hash::make('kopkar312');
        $user->name = 'Superadmin';
        $user->phone_number = '0895334623006';
        $user->status = true;
        $user->registered_at = now();
        $user->save();
    }
}
