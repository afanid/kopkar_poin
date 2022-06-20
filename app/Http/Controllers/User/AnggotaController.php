<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
class AnggotaController extends Controller
{
    //
    public function dashboard()
	{
		 return view('user.dashboard');
	}
	public function poinuser(Request $request)
	{
	 return view('user.poinuser');
	}

    public function pembayaranuser(Request $request)
	{
	 return view('user.poinuser');
	}

}
