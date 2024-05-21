<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RecipeController;
use Illuminate\Support\Facades\DB;

Route::get('/', function () {
    return view('auth.login');
});

Route::get('/dashboard', function () {
    $favourites = DB::table('favourites')
    ->selectRaw('recipes.id as id, recipes.name as name, recipes.image as image')
    ->join('recipes','recipes.id','=','favourites.id_recipes')
    ->get();
    return view('dashboard',['favourites'=>$favourites]);
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';


Route::get('/recipe_search', function(){
    return view('recipes.search');
})->name('recipe_search');

Route::get('/recipes/search',[RecipeController::class,'search'])->name('recipes.search');
Route::get('/recipes/display/{id}',[RecipeController::class,'display'])->name('recipes.display');

Route::post('/add_favourites',[RecipeController::class,'addToFavourites']);
Route::post('/add_recipe',[RecipeController::class,'addToRecipes']);

Route::get('/recipes/favourites',[RecipeController::class,'displayFavourites']);