<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Auth;

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

    public function payment(Request $request)
	{
		$main_peyment=DB::table('main_payments')->where('user_id',Auth::user()->id)->get();
		
		$config_payments=DB::table('config_payments')->where('name','main_payment')->where('is_active','1')->first(); 
		$ttl=0;
		foreach ($main_peyment as $key) 
		{
			$ttl+=$key->amount;
		}
		$status=$ttl>=@$config_payments->paid_off_amount?'LUNAS':'BELUM LUNAS';
	 return view('user.payment',compact('main_peyment','config_payments','status'));
	}
	public function paymentmonthly(Request $request)
	{
		$main_peyment=DB::table('monthly_payments')->where('user_id',Auth::user()->id)->orderBy('payment_month','ASC')->get();
		 
		$ttl=0;
		foreach ($main_peyment as $key) 
		{
			$ttl+=$key->amount;
		} 
	 return view('user.paymentmonthly',compact('main_peyment','ttl'));
	}

	public function paymentother(Request $request)
	{
		$main_peyment=DB::table('other_payments')->where('user_id',Auth::user()->id)->orderBy('payment_month','ASC')->get();
		 
		$ttl=0;
		foreach ($main_peyment as $key) 
		{
			$ttl+=$key->amount;
		} 
	 return view('user.paymentother',compact('main_peyment','ttl'));
	}
public function keuanganuser(Request $request)
	{
		$other_payments=DB::table('other_payments')->where('user_id',Auth::user()->id)->sum('amount');
		$main_payments=DB::table('main_payments')->where('user_id',Auth::user()->id)->sum('amount');
		$monthly_payments=DB::table('monthly_payments')->where('user_id',Auth::user()->id)->sum('amount');
		
	 return view('user.keuangan',compact('other_payments','main_payments','monthly_payments'));
	}

	 public function gettablepoin(Request $request)
	{
	 $get_member=DB::table('users')->where('id',Auth::user()->id)->first();

	 $getpoin=DB::table('tb_poin_fandi')->where('id_user',@$get_member->member_id)->where('status','aktif')->orderBy('tanggal_poin','DESC')->paginate(20);
	  print json_encode(array('getpoin' => $getpoin));


	}
	 public function gettablepoindetail(Request $request)
	{
		$detail_trk=DB::table('tb_poin_fandi')
		->select('tb_poin_fandi.*','tb_belanja.atribut')
		->leftJoin('tb_belanja','tb_belanja.no_trax','=','tb_poin_fandi.id_transaksi')

		->where('tb_poin_fandi.id_poin',@$request->id_poin)
		->first();
		@$detail_trk->atribut=@unserialize(@$detail_trk->atribut)?@unserialize(@$detail_trk->atribut):array();  
	 return view('user.poinuserdetail',compact('detail_trk'));

	}


}
