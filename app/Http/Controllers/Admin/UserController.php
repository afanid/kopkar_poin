<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Roles;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Yajra\DataTables\DataTables;

class UserController extends Controller
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
        return view('admin.user.index');
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
                    'password'          => $request->password ?? Hash::make($request->password),
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
}
