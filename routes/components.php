<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::group([
    'prefix' => 'components',
    'as' => 'components.',
], function () {
    Route::get('alerts', fn() => Inertia::render('Components/Alerts'))->name('alerts');
});
