<?php

namespace App\Http\Middleware;

use Closure;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class Roles
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next, ...$roles)
    {

        if($request->user()) {
            $user = $request->user();
        } else {
            if($request->ajax()){
                return response()->json(['status' => 'error'], 401);
            }
            return redirect(url('login'))->withErrors(["error" => "Unauthenticated !!!"]);
        }

        if(!$user->status) {
            if($request->ajax()){
                return response()->json(['status' => 'error'], 401);
            }

            return redirect(url('/login'))->withErrors(["error" => "User inactive!!!"]);
        }

        $userRole = $user->roles->name;


        if(is_array($roles)) {
            foreach($roles as $role) {
                if($userRole == $role) {
                    return $next($request);
                }
            }
        }

        if($request->ajax()){
            return response()->json(['status' => 'error'], 401);
        }
        return redirect(url('/login'))->withErrors(["error" => "Unauthorized!!!"]);

    }
}
