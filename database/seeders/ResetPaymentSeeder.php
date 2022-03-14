<?php

namespace Database\Seeders;

use App\Models\MainPayment;
use App\Models\MonthlyPayment;
use App\Models\OtherPayment;
use App\Models\User;
use App\Models\Wallet;
use App\Models\YearlyLog;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ResetPaymentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        try {
            DB::beginTransaction();
            User::where('main_payment_status', 1)->update(['main_payment_status' => 0]);
            MainPayment::truncate();
            MonthlyPayment::truncate();
            OtherPayment::truncate();
            Wallet::truncate();
            YearlyLog::truncate();
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            dd($e->getMessage());
        }

    }
}
