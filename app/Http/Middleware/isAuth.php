<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class isAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {

        if(!$request->user()) {
            return redirect(url('/login'))->withErrors(["error" => "Unauthenticated !!!"]);
        }
        
        return $next($request);
    }
}
