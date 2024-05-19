<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Auth;

use Illuminate\Support\Facades\DB;
use App\Models\Favourite;
use App\Models\Recipe;


class RecipeController extends Controller
{   
    public function displayFavourites() {
        $user_id = Auth::user()->id;
        $recip=DB::table('recipes')
        ->selectRaw('recipes.id as id, recipes.name as title, recipes.summary as summary, recipes.instructions as instructions, recipes.ingredients as ingredients, recipes.image as image')
        ->join('favourites','favourites.id_recipes','=','recipes.id')
        ->where('favourites.id_users',$user_id)
        ->get();
        $recipes=[];

        foreach ($recip as $recipe) {
            \Log::info('Ingrediens:'. $recipe->ingredients);
            $ingred = json_decode($recipe->ingredients,true);
            $r=['regularInfo'=>['image'=>$recipe->image, 'title'=>$recipe->title, 'id'=>$recipe->id], 'furtherInfo'=>['summary'=>$recipe->summary,'image'=>$recipe->image, 'title'=>$recipe->title, 'extendedIngredients'=>$ingred,'instructions'=>json_decode($recipe->instructions)]];
            array_push($recipes,$r);
        }
        session(['recipesLast' => $recipes]);
        return view('recipes.index', ['recipes' => $recipes]);

    }


    public function addToRecipes(Request $request) {
        $user_id = Auth::user()->id;
        $recipe_id = (int)$request->input('recept_id');
        $recipe_title = (string)$request->input('recept_title');
        $recipe_summary =(string)$request->input('recept_summary');
        $ingredients=[];
        $recipe_ingredients = json_encode($request->input('recept_ingredients'));
        $recipe_instructions =json_encode($request->input('recept_instructions'));
        $recipe_image = (string)$request->input('recept_image');
        $recept = new Recipe();
        $recept->id = $recipe_id;
        $recept->name = $recipe_title;
        $recept->summary = $recipe_summary;
        $recept->ingredients = $recipe_ingredients;
        $recept->instructions=$recipe_instructions;
        $recept->image = $recipe_image;
        $recept->save();
        return response()->json(['success' => true]);
    }

    public function addToFavourites(Request $request) {
        $user_id = Auth::user()->id;
        $recipe_id = (int)$request->input('recept_id');
        $favourite = new Favourite();
        $favourite->id_users = $user_id;
        $favourite->id_recipes = $recipe_id;
        $favourite->save();
        return response()->json(['success' => true]);
    }

    public function search(Request $request)
    {
        $query = $request->input('query');
        $apiKey = env('SPOONACULAR_API_KEY');
        $response = Http::get("https://api.spoonacular.com/recipes/complexSearch", [
            'query' => $query,
            'apiKey' => $apiKey,
            'addRecipeInformation' => true,
        ]);
        if ($response->successful()) {
            \Log::info('API Response: ', ['response' => $response->json()]);
            $recipes_info = $response->json()['results'];
        } else {
            \Log::info('API Response failed');
            $recipes_info = []; // Handle the error appropriately
            abort(404); // Or another appropriate response
        }
        $recipes=[];
        foreach ($recipes_info as $r) {
            $recipe = ['regularInfo'=>$r];
            $id = $r['id'];
            $res =  Http::get("https://api.spoonacular.com/recipes/{$id}/information", [
                'apiKey' => $apiKey
            ]);
            if ($res->successful()) {
                $recipe['furtherInfo'] = $res->json();
            } else {
                $recipe = []; // Handle the error appropriately
                abort(404); // Or another appropriate response
            }
            array_push($recipes,$recipe);
        }
        session(['recipesLast' => $recipes]);
        return view('recipes.index', ['recipes' => $recipes]);
    }
    public function display($id) {

        $user_id = Auth::user()->id;

        $result=[];
        $recipesLast = session('recipesLast');
        foreach($recipesLast as $recipe) {
            if ($recipe['regularInfo']['id']==$id) {
                $result = $recipe['furtherInfo'];
                break;
            }
        }
        $recipe_from_base = DB::table('recipes')
        ->selectRaw('recipes.id as id')
        ->where('recipes.id',$id)
        ->get();
        $i = count($recipe_from_base);
        $imaUBaziRecept=false;
        $imaUBaziFavorit=false;
        if ($i) {
            $imaUBaziRecept=true;
            $favs = DB::table('favourites')
            ->selectRaw('favourites.id as id')
            ->where('favourites.id_recipes',$id)
            ->where('favourites.id_users',$user_id)
            ->get();
            if (count($favs)){
                $imaUBaziFavorit=true;
            }
        }

        return view('recipes.display', ['recipe' => $result, 'recipeId'=>$id, 'ima_recept'=>$imaUBaziRecept, 'ima_favorit'=>$imaUBaziFavorit]);
    }
}
