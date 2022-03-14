<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\OtherPayment;
use App\Models\Roles;
use App\Models\User;
use App\Models\Wallet;
use App\Models\YearlyLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\DataTables;

class OtherPaymentController extends Controller
{
    private $isSuccess;
    private $exception;

    public function __construct()
    {
        $this->isSuccess = false;
        $this->exception = null;
    }
    public function index(Request $request)
    {
        return view('admin.payment.other.index');
    }

    public function datatables()
    {
        $user = User::with(['otherPayment' => function($q){
                    $q->where('payment_year', date('Y'));
                }])
                ->where('role_id', '!=', Roles::where('name', 'admin')->first()->id)
                ->get();

        return DataTables::of($user)
            ->addColumn('other_total', function($user) {
                return YearlyLog::where('year', date('Y'))->where('user_id', $user->id)->first()->total_other ?? 0;
            })
            ->addColumn('last_year_1', function($user) {
                return YearlyLog::where('year', '<=', (date('Y')-1))->where('user_id', $user->id)->sum('total_other') ?? 0;
            })
            ->addColumn('total_all', function($user) {
                return YearlyLog::where('user_id', $user->id)->sum('total_other') ?? 0;
            })
            ->make();

    }

    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $request->amount = preg_replace( '/[^0-9]/', '', $request->amount );

            $isCreated = OtherPayment::where([
                'user_id' => $request->user_id,
                'payment_year' => $request->payment_year,
                'payment_month' => 1,
                'payment_month' => 2,
                'payment_month' => 3,
                'payment_month' => 4,
                'payment_month' => 5,
                'payment_month' => 6,
                'payment_month' => 7,
                'payment_month' => 8,
                'payment_month' => 9,
                'payment_month' => 10,
                'payment_month' => 11,
                'payment_month' => 12,
            ])->count();

            if ($isCreated == 0){
                for ($i = 0; $i < 12; $i++){
                    OtherPayment::updateOrCreate(
                        [
                            'user_id'           => $request->user_id,
                            'payment_month'     => ($i+1),
                            'payment_year' => $request->payment_year,
                        ],
                        [
                            'amount'            => 0,
                        ]
                    );
                }
            }

            $otherPayment = OtherPayment::updateOrCreate(
                [
                    'user_id'           => $request->user_id,
                    'payment_month'     => $request->payment_month,
                    'payment_year' => $request->payment_year,
                ],
                [
                    'amount'            => $request->amount,
                    'paid_at'           => $request->paid_at,
                ]
            );

            $otherTotal = OtherPayment::where('user_id', $request->user_id)->sum('amount');

            $logYear = YearlyLog::where(['user_id'   => $request->user_id, 'year'   => date('Y', strtotime($request->paid_at))])->first();
            YearlyLog::updateOrCreate(
                [
                    'user_id'   => $request->user_id,
                    'year'      => $request->payment_year
                ],
                [
                    'total_other'    => ($logYear->total_other ?? 0) + $request->amount,
                ]
            );

            $wallet = Wallet::where('user_id', $request->user_id)->first();
            Wallet::updateOrCreate(
                [
                    'user_id'   => $request->user_id,
                ],
                [
                    'other'      => $otherTotal,
                    'total'     => $wallet ? ($otherTotal + $wallet->main + $wallet->monthly) : $otherTotal
                ]
            );

            DB::commit();
            $this->isSuccess = true;
        } catch (\Exception $e) {
            DB::rollBack();
            $this->exception = $e;
        }

        return response()->json([
            "status"    => $this->isSuccess ?? false,
            "code"      => $this->isSuccess ? 200 : 600,
            "message"   => $this->isSuccess ? "Success!" : ($this->exception ?? "Unknown error(?)"),
        ], 201);
    }
}
