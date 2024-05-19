<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $recipe['title'] }}</title>
    <link href="https://fonts.googleapis.com/css2?family=Homemade+Apple&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="{{asset('dist/css/tabler.min.css?1674944402')}}" rel="stylesheet"/>
    <link href="{{asset('dist/css/tabler-flags.min.css?1674944402')}}" rel="stylesheet"/>
    <link href="{{asset('dist/css/tabler-payments.min.css?1674944402')}}" rel="stylesheet"/>
    <link href="{{asset('dist/css/tabler-vendors.min.css?1674944402')}}" rel="stylesheet"/>
    <link href="{{asset('dist/css/demo.min.css?1674944402')}}" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        html, body {
        font-family: 'Roboto', sans-serif;
        background: #fff3e0;
        height: 100%;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column; /* Ensures vertical layout */
        justify-content: flex-start; /* Aligns content to the top */
        align-items: center; /* Centers content horizontally */
        background-image: url('https://www.transparenttextures.com/patterns/lined-paper.png');
        }
        .navbar {
            width: 100%;
            margin: 0;
            position: relative; /* Ensures it is not affected by other elements */
            left: 0; /* Aligns to the far left */
            right: 0;
            background-color: #F5AF41;
        }
        .recipe-card {
            width: 80%;
            max-width: 600px;
            background: #ffffffe0;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-top: 20px; /* Added space between nav and card */
        }
        .recipe-image {
            width: 100%;
            max-width: 300px; /* Adjusted width */
            height: auto;
            border-radius: 5px;
            display: block;
            margin: 10px auto;
        }
        .recipe-title {
            font-family: 'Homemade Apple', cursive;
            font-size: 24px;
            color: #ff7043;
            margin-top: 0;
        }
        .recipe-summary {
            font-size: 16px;
            color: #666;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .ingredients, .instructions {
            margin-top: 20px;
        }
        .ingredients ul, .instructions ul {
            padding-left: 20px;
        }
        .ingredients li, .instructions li {
            margin-bottom: 10px;
        }
        h2 {
            font-family: 'Homemade Apple', cursive;
            color: #ff7043;
            font-size: 20px;
        }
        #slikasave{
            height:30px;
        }
        .headrecipe{
            display:flex;
        }
        .butsl{
            height:30px;
            padding: 0;           /* Removes padding inside the button */
            border: none;         /* Removes the border */
            background: none;     /* Optional: removes any background styling */
            cursor: pointer; 
            display: inline-block; /* Keeps button's size to its content */
            overflow: hidden;  
        }
        .butsl img {
            display: block;       /* Removes any space below the image */
            width: 100%;          /* Makes the image fill the button */
            height: auto;         /* Keeps the aspect ratio of the image */
        }

        .navbar-brand img {
            max-height: 40px; /* Logo size */
        }

        .nav-link {
            margin-right: 10px; /* Space between links */
        }


    </style>
</head>

<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/">
            <img src="/images/logorf.png" width="30" height="30" alt="Logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="/recipe_search">Search Recipes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/recipes/favourites">Favourites</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        {{ Auth::user()->name }}
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="{{ route('logout') }}"
                           onclick="event.preventDefault();
                                     document.getElementById('logout-form').submit();">
                            Logout
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            @csrf
                        </form>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <div class="recipe-card">
        <img src="{{ $recipe['image'] }}" alt="Image of {{ $recipe['title'] }}" class="recipe-image">
        <div class="headrecipe"><h1 class="recipe-title">{{ $recipe['title'] }}      </h1> <button type="button" class="btn btn-pill butsl" onclick="save()"><img id="slikasave" src="/images/save_positive.jpg"></button></div>
        <p class="recipe-summary">{!! $recipe['summary'] !!}</p>

        <div class="ingredients">
            <h2>Ingredients</h2>
            <ul>
                @foreach ($recipe['extendedIngredients'] as $ingredient)
                    <li>{{ $ingredient['original'] }}</li>
                @endforeach
            </ul>
        </div>

        <div class="instructions">
            <h2>Instructions</h2>
            {!!$recipe['instructions']!!}
        </div>
    </div>
</body>
</html>
<script>
    const image = document.getElementById('slikasave');

    image.onmouseover = function() {
        this.src = '/images/save_negative.jpg';  
    };

image.onmouseout = function() {
    this.src = '/images/save_positive.jpg';  
};

function save() {
    var imaRecept=@json($ima_recept);
    var imaFavorit=@json($ima_favorit);
    if (imaFavorit) {
        alert("You have already saved this recipe.");
    }
    else {
        if (!imaRecept) {
            var idR=@json($recipeId);
            var title = @json($recipe['title']);
            var summary = @json($recipe['summary']);
            var instr = @json($recipe['instructions']);
            var ingredients = @json($recipe['extendedIngredients']);
            var image = @json($recipe['image']);
            fetch('/add_recipe', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'  
            },
            body: JSON.stringify({
                recept_id: idR,
                recept_title: title,
                recept_summary: summary,
                recept_instructions : instr,
                recept_ingredients: ingredients,
                recept_image: image

            })
            })
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
            })
            .catch((error) => {
                console.error('Error:', error);
            });
            fetch('/add_favourites', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'  
            },
            body: JSON.stringify({
                recept_id: idR

            })
            })
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
            })
            .catch((error) => {
                console.error('Error:', error);
            });
        }
        else {
            var idR=@json($recipeId);
            fetch('/add_favourites', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'  
            },
            body: JSON.stringify({
                recept_id: idR

            })
            })
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
            })
            .catch((error) => {
                console.error('Error:', error);
            });
        }
    }
}

</script>