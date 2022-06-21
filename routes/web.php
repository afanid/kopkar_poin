<?php
use App\Http\Controllers\Admin\MainPaymentController;
use App\Http\Controllers\Admin\MasterDataController;
use App\Http\Controllers\Admin\MonthlyPaymentController;
use App\Http\Controllers\Admin\OtherPaymentController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\PointController;
use App\Http\Controllers\Admin\WalletController;
use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\User\AnggotaController;



use Illuminate\Support\Facades\Auth;

Route::get('/', function () {
    return redirect()->route('login.index');
});

Route::get('/login', [AuthController::class, 'login'])->name('login.index');
Route::post('/login', [AuthController::class, 'login']);
Route::get('/logout', [AuthController::class, 'logout'])->name('logout');


Route::get('/check', function () {
    if (Auth::user()->roles->name == 'user') {
        return redirect()->route('user.dashboard');
    }

    if (Auth::user()->roles->name == 'admin') {
        return redirect()->route('admin.dashboard');
    }
})->middleware('role:user,admin');

// sample route with company and user role
Route::get('/check-multi', function () {
    filterMenu();
})->middleware('role:user');

Route::group(['as' => 'admin.', 'middleware' => 'role:admin'], function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    Route::group(['prefix' => 'meta', 'as' => 'meta.'], function () {
        Route::get('/', [MasterDataController::class, 'index'])->name('index');
        Route::get('/datatables', [MasterDataController::class, 'datatables'])->name('ajax.data');
        Route::get('/show/{id?}', [MasterDataController::class, 'show'])->name('show');
        Route::post('/store', [MasterDataController::class, 'store'])->name('store');
        Route::post('/destroy/{id?}', [MasterDataController::class, 'destroy'])->name('destroy');
    });

    Route::group(['prefix' => 'user', 'as' => 'user.'], function () {
        Route::get('/manage-user', [UserController::class, 'index'])->name('index');
        Route::get('/datatables', [UserController::class, 'datatables'])->name('ajax');
        Route::get('/show/{id?}', [UserController::class, 'show'])->name('show');
        Route::post('/store', [UserController::class, 'store'])->name('store');
        Route::post('/destroy/{id?}', [UserController::class, 'destroy'])->name('destroy');

        Route::group(['prefix' => 'wallet', 'as' => 'wallet.'], function () {
            Route::get('/', [WalletController::class, 'index'])->name('index');
            Route::get('/datatables', [WalletController::class, 'datatables'])->name('ajax');
            Route::get('/show/{id?}', [WalletController::class, 'show'])->name('show');
        });
    });
    Route::group(['prefix' => 'point', 'as' => 'point.'], function () {
        Route::get('/manage-user', [PointController::class, 'index'])->name('index');
        // Route::get('/datatables', [PointController::class, 'datatables'])->name('ajax');
        // Route::get('/show/{id?}', [PointController::class, 'show'])->name('show');
        // Route::post('/store', [PointController::class, 'store'])->name('store');
        // Route::post('/destroy/{id?}', [PointController::class, 'destroy'])->name('destroy');
        // Route::post('/simpan-poin', [PointController::class, 'simpanpoin']);
        // Route::post('/list-poin', [PointController::class, 'listpoin']);
        Route::get('get-poin-transaksi', [PointController::class, 'getpointransaksi']);
        Route::get('datapoin', [PointController::class, 'datapoin']);
        Route::get('get-table-poin', [PointController::class, 'gettablepoin']);
        Route::post('edit-poin-transaksi', [PointController::class, 'editpointransaksi']);
        Route::get('hapus-poin-transaksi', [PointController::class, 'hapuspointransaksi']);


        Route::group(['prefix' => 'wallet', 'as' => 'wallet.'], function () {
            Route::get('/', [WalletController::class, 'index'])->name('index');
            Route::get('/datatables', [WalletController::class, 'datatables'])->name('ajax');
            Route::get('/show/{id?}', [WalletController::class, 'show'])->name('show');
        });
    });

    Route::group(['prefix' => 'payment', 'as' => 'payment.'], function () {
        Route::group(['prefix' => 'main', 'as' => 'main.'], function () {
            Route::get('/', [MainPaymentController::class, 'index'])->name('index');
            Route::get('/datatables', [MainPaymentController::class, 'datatables'])->name('ajax');
            Route::get('/show/{id?}', [MainPaymentController::class, 'show'])->name('show');
            Route::post('/store', [MainPaymentController::class, 'store'])->name('store');
            Route::post('/destroy/{id?}', [MainPaymentController::class, 'destroy'])->name('destroy');
        });

        Route::group(['prefix' => 'monthly', 'as' => 'monthly.'], function () {
            Route::get('/', [MonthlyPaymentController::class, 'index'])->name('index');
            Route::get('/datatables', [MonthlyPaymentController::class, 'datatables'])->name('ajax');
            Route::get('/show/{id?}', [MonthlyPaymentController::class, 'show'])->name('show');
            Route::post('/store', [MonthlyPaymentController::class, 'store'])->name('store');
            Route::post('/destroy/{id?}', [MonthlyPaymentController::class, 'destroy'])->name('destroy');
        });

        Route::group(['prefix' => 'other', 'as' => 'other.'], function () {
            Route::get('/', [OtherPaymentController::class, 'index'])->name('index');
            Route::get('/datatables', [OtherPaymentController::class, 'datatables'])->name('ajax');
            Route::get('/show/{id?}', [OtherPaymentController::class, 'show'])->name('show');
            Route::post('/store', [OtherPaymentController::class, 'store'])->name('store');
            Route::post('/destroy/{id?}', [OtherPaymentController::class, 'destroy'])->name('destroy');
        });
    });
});
Route::group(['prefix' => 'user', 'as' => 'user.', 'middleware' => 'role:user'], function () {
	Route::get('/dashboard', [AnggotaController::class, 'dashboard'])->name('dashboard');
    Route::get('/poin-user', [AnggotaController::class, 'poinuser'])->name('poinuser');
    Route::get('/get-table-poin', [AnggotaController::class, 'gettablepoin']);
    Route::get('/get-table-poin/{id_poin}', [AnggotaController::class, 'gettablepoindetail']);




    Route::get('/payment/list', [AnggotaController::class, 'payment'])->name('payment.main.index');
    Route::get('/payment/monthly/list', [AnggotaController::class, 'paymentmonthly'])->name('payment.monthly.index');
    Route::get('/payment/other/list', [AnggotaController::class, 'paymentother'])->name('payment.other.index');


    

    Route::get('/keuangan-user', [AnggotaController::class, 'keuanganuser'])->name('keuangan'); 




});
 