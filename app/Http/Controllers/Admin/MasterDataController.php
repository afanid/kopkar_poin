<?php


namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\ConfigPayment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class MasterDataController extends Controller
{
    private $isSuccess;
    private $exception;

    public function __construct()
    {
        $this->isSuccess = false;
        $this->exception = null;
    }

    public function index()
    {
        $data['main'] = ConfigPayment::where('name', 'main_payment')->first();
        $data['monthly'] = ConfigPayment::where('name', 'monthly_payment')->first();
        return view('admin.meta', $data);
    }

    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            ConfigPayment::updateOrCreate(
                ['name' => 'main_payment'],
                [
                    'paid_off_amount'   => preg_replace( '/[^0-9]/', '', $request->main_payment ),
                    'is_active'         => 1
                ]
            );

            ConfigPayment::updateOrCreate(
                ['name' => 'monthly_payment'],
                [
                    'paid_off_amount'   => preg_replace( '/[^0-9]/', '', $request->monthly_payment ),
                    'is_active'         => 1
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
