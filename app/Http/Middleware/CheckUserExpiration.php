<?php

namespace App\Http\Middleware;

use Carbon\Carbon;
use Closure;
use Filament\Facades\Filament;
use Filament\Notifications\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Symfony\Component\HttpFoundation\Response;

class CheckUserExpiration
{
    public function handle(Request $request, Closure $next)
    {
        if (Auth::check()) {
            $user = Auth::user();
            if ($user->membership_end_date && Carbon::parse($user->membership_end_date)->isPast()) {

                Filament::auth()->logout();
                $request->session()->invalidate();
                $request->session()->regenerateToken();
                Notification::make()
                    ->title('Tu membresía ha expirado.')
                    ->body('Comunícate con tu proveedor.')
                    ->danger()
                    ->send();

                return redirect('/');
            }
        }
        return $next($request);
    }
}
