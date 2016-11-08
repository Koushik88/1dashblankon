<?php

namespace App\Http\Middleware;

use Closure;
use Config;
use Request;

class RedirectIfAuthenticated {
	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @param  string|null  $guard
	 * @return mixed
	 */
	public function handle($request, Closure $next, $guard = null) {
		if (isset($_SESSION["token"])) {
			Config::set('database.connections.dynamic_mysql.database', $_SESSION["dynamic_db_name"]);
			return $next($request);
		} else {
			return redirect()->route('login');
		}
		// if (Auth::guard($guard)->check()) {
		// 	return redirect('/home');
		// }
		// return $next($request);
	}
}
