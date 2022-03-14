<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\Roles;
use App\Models\User;
use App\Models\YearlyLog;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class WalletController extends Controller
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
        return view('admin.user.wallet');
    }

    public function datatables()
    {
        $user = User::with('wallet')
            ->where('role_id', '!=', Roles::where('name', 'admin')->first()->id)
            ->get();

        return DataTables::of($user)->make();

    }
}
