<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class AuthController extends Controller
{
    //
    public function login(Request $request) {
        if($request->method() == 'POST') {
            // Bypass auth

                $user = User::select('id')->where('username', $request->username)->first();
            if ($user) { 
                Auth::loginUsingId($user->id); 
            }

            if(Auth::attempt($request->only('username', 'password'))) {
                $request->session()->regenerate(); 
                return redirect(url('/check'));
            }

            return redirect(url("/login"))->withErrors(["error" => "Wrong username or password !!!"]);
        }

        return view('login');

    }


    public function logout(Request $request) {
        $request->session()->invalidate();

        return redirect(url("/login"))->with(["info" => "See you"]);
    }
}
