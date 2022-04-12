<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\MainPayment;
use App\Models\Roles;
use App\Models\User;
use App\Models\Point;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Yajra\DataTables\DataTables;
use Carbon\Carbon;

class PointController extends Controller
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
        return view('admin.point.index');
    }

    public function datatables()
    {
        $user = User::where('role_id', '!=', Roles::where('name', 'admin')->first()->id)->get();
        return DataTables::of($user)->make();
    }

    public function show($id)
    {
        $data['user'] = User::find($id);
        return response()->json($data);
    }

    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $data = User::updateOrCreate(
                ['id' => $request->id],
                [
                    'role_id'           => Roles::where('name', 'user')->first()->id,
                    'email'             => $request->email,
                    'username'          => $request->username,
                    'password'          => $request->password ?? Hash::make('anggota312'),
                    'registered_at'     => $request->registered_at,
                    'status'            => $request->status,
                    'member_id'         => $request->member_id,
                    'name'              => $request->name,
                    'phone_number'      => $request->phone_number,
                    'address'           => $request->address,
                    'tmt'               => $request->tmt,
                ]
            );
            if ($request->file("file")) {
                $file_video = $request->file("file");
                $nameVideo = time() . "_" . $file_video->getClientOriginalName();
                $pathVideo = 'memento/' . $nameVideo;
                $aws =  AwsClient::upload($request->file("file"), $pathVideo);
            }
            DB::commit();
            $this->isSuccess = true;
        } catch (\Exception $e) {
            DB::rollBack();

            $this->exception = App::environment('local') ? $e->getMessage() : "Terjadi kesalahan!";
        }

        return response()->json([
            "status"    => $this->isSuccess ?? false,
            "code"      => $this->isSuccess ? 200 : 600,
            "message"   => $this->isSuccess ? "Success!" : ($this->exception ?? "Unknown error(?)"),
            "data"      => $this->isSuccess ? $data : [],
        ], 201);
    }

    public function destroy($id)
    {
        DB::beginTransaction();
        try {
            $data = User::findOrFail($id);
            $data->delete();

            DB::commit();
            $this->isSuccess = true;
        } catch (Exception $e) {
            DB::rollBack();
            $this->exception = $e->getMessage();
        }

        return response()->json([
            "status"    => $this->isSuccess ?? false,
            "code"      => $this->isSuccess ? 200 : 600,
            "message"   => $this->isSuccess ? "Success!" : ($this->exception ?? "Unknown error(?)"),
            "data"      => $this->isSuccess ? $data : [],
        ], 201);
    }

    public function simpanpoin(Request $request)
    {
    }
    public function listpoin(Request $request)
    {

        $cek = MainPayment::whereDate('created_at', Carbon::now())->get();
        $hasilpoin = array();
        if ($cek) {
            $i = 0;
            foreach ($cek as $key) {

                // fungsi perhitungan poin di nominal 10.000 mendapat 1 point
                if (@$key->amount >= 10000) {
                    $nominal = ceil(@$key->amount / 10000);
                    $hasilpoin[$i] = array('id_pay' => $key->id, 'user_id' => $key->user_id, 'jml_poin' => $nominal);
                    $i++;
                }
            }
            foreach ($hasilpoin as $ky) {
                for ($i = 0; $i <= $ky['jml_poin']; $i++) {
                    $cek_ = DB::table('poin')->where('id_mainpay', $ky['id_pay'])->count();
                    if (!$cek_ || $cek_ <= $ky['jml_poin']) {
                        DB::table('poin')->insert(['id_mainpay' => $ky['id_pay'], 'user_id' => $ky['user_id']]);
                    }
                }
            }
        }


        $usert_db = DB::table('poin')->select('user_id', DB::raw('count(id_poin) as jmlPoin'))
            ->groupBy('user_id')->get();
        $i = 0;
        foreach ($usert_db as $y) {
            $s = DB::table('users')->select('name')->where('id', 'like', $y->user_id)->first();
            $usert_db[$i]->name = @$s->name;
            $i++;
        }
        return response()->json([
            "status"    => $usert_db
        ]);
    }
}
