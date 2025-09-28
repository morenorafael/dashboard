<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::group([
    'prefix' => 'components',
    'as' => 'components.',
    'middleware' => 'auth',
], function () {
    Route::get('alerts', fn () => Inertia::render('Components/Alerts'))->name('alerts');
    Route::get('tabs', fn () => Inertia::render('Components/Tabs'))->name('tabs');
    Route::get('form', fn () => Inertia::render('Components/Form'))->name('form');
});
