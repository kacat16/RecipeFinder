<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Homemade+Apple&family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        html, body {
            font-family: 'Open Sans', arial, sans-serif;
            
            height: 100%;  /* Full height of the viewport */
            margin: 0;
            padding: 0;
            background-image:url("/images/kitchen.jpg");
            background-size: cover;
            overflow: auto; /* Ensures no scrollbars interfere */
        }
        .navbar-brand img {
            max-height: 40px; /* Logo size */
        }

        .nav-link {
            margin-right: 10px; /* Space between links */
        }
        
        .navbar {
            width: 100%;
            margin: 0;
            position: relative; /* Ensures it is not affected by other elements */
            left: 0; /* Aligns to the far left */
            right: 0;
            background-color: #F5AF41;
        }

        .linka {
            color: #fff3e0;
            font-family: 'Poppins'

        }
    </style>
    <title>Recipe Search Results</title>
</head>
<body>
<!-- Navigation Bar -->
<nav id="navig" class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="/">
            <img src="/images/logorf.png" width="30" height="30" alt="Logo">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link linka" href="/recipe_search">Search Recipes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link linka" href="/recipes/favourites">Favourites</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle linka" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
<div class="projcard-container">
    <h1>Recipes</h1>
    @foreach ($recipes as $recipe)
        <div class="projcard projcard-customcolor" style="--projcard-color: #F5AF41;">
        <div class="projcard-innerbox">
            <img src="{{ $recipe['regularInfo']['image'] }}" alt="Image of {{ $recipe['regularInfo']['title'] }}" class="projcard-img" />
            <div class="projcard-textbox">
            <div class="projcard-title"><a class="linka" href="{{route('recipes.display',$recipe['regularInfo']['id'])}}">{{ $recipe['regularInfo']['title'] }}</a></div>
            <div class="projcard-bar"></div>
            <div class="projcard-description">
            @if(!empty($recipe['furtherInfo']['summary']))
                {!! $recipe['furtherInfo']['summary'] !!}
            @endif
            </div>
            @if(!empty($recipe['furtherInfo']['extendedIngredients']))
            <div class="projcard-tagbox">
                @foreach ($recipe['furtherInfo']['extendedIngredients'] as $ingredient)
                <span class="projcard-tag">{{ $ingredient['original'] }}</span>
                @endforeach
            </div>
            @endif
            </div>
        </div>
        </div>
    @endforeach
</div>
</body>
</html>
<style>
.projcard-container {
  margin: 50px 0;
}
.projcard-container,
.projcard-container * {
  box-sizing: border-box;
}
.projcard-container {
  margin-left: auto;
  margin-right: auto;
  width: 1000px;
}
.projcard {
  position: relative;
  width: 100%;
  height: 300px;
  background: rgba(0,0,0,0.5);
  margin-bottom: 40px;
  border-radius: 10px;
  border: 2px solid #ddd;
  font-size: 18px;
  overflow: hidden;
  
  font-family: 'Poppins';
  color: #ffffff;
  cursor: pointer;
  box-shadow: 0 4px 21px -12px rgba(0, 0, 0, .66);
  transition: box-shadow 0.2s ease, transform 0.2s ease;
}
.projcard:hover {
  box-shadow: 0 34px 32px -33px rgba(0, 0, 0, .18);
  transform: translate(0px, -3px);
}
.projcard::before {
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-image: linear-gradient(to left, rgba(245,175,65,0), rgba(245,175,65,1));
  opacity: 0.07;
}
.projcard:nth-child(2n)::before {
  background-image: linear-gradient(to right, rgba(245,175,65,0), rgba(245,175,65,1));
}
.projcard-innerbox {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  
  font-family: 'Poppins';
  color: #ffffff;
  
  background: transparent;
}
.projcard-img {
background: transparent;
  position: absolute;
  height: 300px;
  width: 400px;
  top: 0;
  left: 0;
  transition: transform 0.2s ease;
}
.projcard:nth-child(2n) .projcard-img {
  left: initial;
  background: transparent;
  right: 0;
}
.projcard:hover .projcard-img {
  transform: scale(1.05) rotate(1deg);
}
.projcard:hover .projcard-bar {
  width: 70px;
}
.projcard-textbox {
    
  color: #ffffff;
  position: absolute;
  top: 7%;
  font-family: 'Poppins';
  bottom: 7%;
  left: 410px;
  width: calc(100% - 470px);
  font-size: 17px;
}
.projcard:nth-child(2n) .projcard-textbox {
  left: initial;
  right: 410px;
}
.projcard-textbox::before,
.projcard-textbox::after {
  content: "";
  position: absolute;
  display: block;
  background: transparent;
  top: -20%;
  left: -55px;
  height: 140%;
  width: 60px;
  transform: rotate(8deg);
}
.projcard:nth-child(2n) .projcard-textbox::before {
  display: none;
}
.projcard-textbox::after {
  display: none;
  left: initial;
  right: -55px;
}
.projcard:nth-child(2n) .projcard-textbox::after {
  display: block;
}
.projcard-textbox * {
  position: relative;
}
.projcard-title {
  font-family: 'Voces', 'Open Sans', arial, sans-serif;
  font-size: 24px;
}
.projcard-subtitle {
  font-family: 'Voces', 'Open Sans', arial, sans-serif;
  color: #888;
}
.projcard-bar {
  left: -2px;
  width: 50px;
  height: 5px;
  margin: 10px 0;
  border-radius: 5px;
  background-color: #424242;
  transition: width 0.2s ease;
}
.projcard-blue .projcard-bar { background-color: #0088FF; }
.projcard-blue::before { background-image: linear-gradient(-70deg, #0088FF, transparent 50%); }
.projcard-blue:nth-child(2n)::before { background-image: linear-gradient(-250deg, #0088FF, transparent 50%); }
.projcard-red .projcard-bar { background-color: #D62F1F; }
.projcard-red::before { background-image: linear-gradient(-70deg, #D62F1F, transparent 50%); }
.projcard-red:nth-child(2n)::before { background-image: linear-gradient(-250deg, #D62F1F, transparent 50%); }
.projcard-green .projcard-bar { background-color: #40BD00; }
.projcard-green::before { background-image: linear-gradient(-70deg, #40BD00, transparent 50%); }
.projcard-green:nth-child(2n)::before { background-image: linear-gradient(-250deg, #40BD00, transparent 50%); }
.projcard-yellow .projcard-bar { background-color: #F5AF41; }
.projcard-yellow::before { background-image: linear-gradient(-70deg, #F5AF41, transparent 50%); }
.projcard-yellow:nth-child(2n)::before { background-image: linear-gradient(-250deg, #F5AF41, transparent 50%); }
.projcard-orange .projcard-bar { background-color: #FF5722; }
.projcard-orange::before { background-image: linear-gradient(-70deg, #FF5722, transparent 50%); }
.projcard-orange:nth-child(2n)::before { background-image: linear-gradient(-250deg, #FF5722, transparent 50%); }
.projcard-brown .projcard-bar { background-color: #C49863; }
.projcard-brown::before { background-image: linear-gradient(-70deg, #C49863, transparent 50%); }
.projcard-brown:nth-child(2n)::before { background-image: linear-gradient(-250deg, #C49863, transparent 50%); }
.projcard-grey .projcard-bar { background-color: #424242; }
.projcard-grey::before { background-image: linear-gradient(-70deg, #424242, transparent 50%); }
.projcard-grey:nth-child(2n)::before { background-image: linear-gradient(-250deg, #424242, transparent 50%); }
.projcard-customcolor .projcard-bar { background-color: var(--projcard-color); }
.projcard-customcolor::before { background-image: linear-gradient(-70deg, var(--projcard-color), transparent 50%); }
.projcard-customcolor:nth-child(2n)::before { background-image: linear-gradient(-250deg, var(--projcard-color), transparent 50%); }
.projcard-description {
  z-index: 10;
  font-size: 15px;
  
  font-family: 'Poppins';
  color: #ffffff;
  height: 125px;
  overflow: hidden;
  
  max-height: 125px;  
  overflow: auto; 
  margin: 10px 0;    
  padding-right: 15px;
  pointer-events: auto;
  width: 100%;

}
.projcard-tagbox {
  position: absolute;
  bottom: 3%;
  font-size: 14px;
  cursor: default;
  user-select: none;
  pointer-events: auto;

  overflow-y: auto;  /* Enable vertical scrolling */
  max-height: 50px;
}
.projcard-tag {
  display: inline-block;
  background: #F5AF41;
  color: #fff3e0;
  border-radius: 3px 0 0 3px;
  line-height: 26px;
  padding: 0 10px 0 23px;
  position: relative;
  margin-right: 20px;
  cursor: default;
  user-select: none;
  transition: color 0.2s;
}
.projcard-tag::before {
  content: '';
  position: absolute;
  background: #fff;
  border-radius: 10px;
  box-shadow: inset 0 1px rgba(0, 0, 0, 0.25);
  height: 6px;
  left: 10px;
  width: 6px;
  top: 10px;
}
.projcard-tag::after {
  content: '';
  position: absolute;
  border-bottom: 13px solid transparent;
  border-left: 10px solid #F5AF41;
  border-top: 13px solid transparent;
  right: -10px;
  top: 0;
}
</style>
<script>

    function displayInfo($id) {
        window.location.href = '/recipes/display/'+id;
    }
</script>