<x-app-layout class="body">
    
                
        <div class="fdiv">
                    <h1 class="naslov">~ People's favourites ~</h1>
                    <div class="w3-row-padding w3-padding-16 w3-center" id="food">
                    @for($i = 0; $i < count($favourites); $i++)
                    <div class="w3-quarter bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-l">
                        <img src="{{ $favourites[$i]->image }}" style="width:100%">
                        <h3><a class="recipe_link" href="{{route('recipes.display',['id'=>$favourites[$i]->id])}}">{{$favourites[$i]->name}}</a></h3>
                    </div>
                    @if($i%3==2 && $i!=count($favourites)-1)
                    </div>
                    <div class="w3-row-padding w3-padding-16 w3-center" id="food">
                    @elseif($i==count($favourites)-1)
                    </div>
                    @endif
                    @endfor
</div>

            
    
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <style>
        .fdiv{
            margin-left:200px;
        }
        .body{
            background-image:url('/images/kitchen.jpg');
        }
        body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
        .w3-bar-block .w3-bar-item {padding:20px}
        .w3-quarter{
            margin-left:20px
        }
        #naslov{
        }
    </style>
</x-app-layout>
