-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2024 at 10:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipe_site`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` int(11) NOT NULL,
  `id_users` int(20) NOT NULL,
  `id_recipes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `id_users`, `id_recipes`) VALUES
(12, 5, 637876),
(13, 5, 716342),
(14, 5, 637184);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `summary` longtext NOT NULL,
  `instructions` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `ingredients` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `summary`, `instructions`, `image`, `ingredients`) VALUES
(637184, 'Carrot Cake Pancakes', 'Carrot Cake Pancakes might be a good recipe to expand your breakfast recipe box. One portion of this dish contains about <b>4g of protein</b>, <b>5g of fat</b>, and a total of <b>143 calories</b>. This recipe serves 12 and costs 25 cents per serving. If you have cinnamon, ground nutmeg, baking powder, and a few other ingredients on hand, you can make it. 2 people have made this recipe and would make it again. It is a good option if you\'re following a <b>lacto ovo vegetarian</b> diet. From preparation to the plate, this recipe takes roughly <b>45 minutes</b>. <b>Easter</b> will be even more special with this recipe. It is brought to you by Foodista. Taking all factors into account, this recipe <b>earns a spoonacular score of 20%</b>, which is rather bad. <a href=\"https://spoonacular.com/recipes/carrot-cake-pancakes-1239201\">Carrot Cake Pancakes</a>, <a href=\"https://spoonacular.com/recipes/carrot-cake-pancakes-626569\">Carrot Cake Pancakes</a>, and <a href=\"https://spoonacular.com/recipes/carrot-cake-pancakes-543603\">Carrot Cake Pancakes</a> are very similar to this recipe.', '\"Peel and grate the carrots. If you end up having more than 1 cup of grated carrots from the 3-4 medium carrots, thats OK, this recipe can easily handle up to 1.5 cups of grated carrots.\\nMicrowave the grated carrots for 3 minutes on medium, or until the carrots are soft and partially cooked.\\nMix together the dry ingredients in a large bowl  flour, baking powder, salt, and spices.\\nWhisk together the wet ingredients in a bowl until well combined  melted butter, sugar, egg, milk, and vanilla extract.\\nAdd the wet ingredients to the dry ingredients and whisk together until almost combined.\\nAdd the grated carrots and raisins\\/walnuts if youre using those. Stir until everything is combined, but do not overmix!\\nHeat some oil or butter in a skillet. Use heaping tablespoons (or an ice cream scoop!) to add the pancake batter to the pan. Cook about 2-3 minutes on medium\\/low heat, or until little bubbles start forming at the surface. Flip each pancake, and cook about 2-3 minutes on the other side, or until the inside is fully cooked.\\nServe warm with butter, syrup, powdered sugar  whatever you want!\"', 'https://img.spoonacular.com/recipes/637184-556x370.jpg', '[{\"id\":11124,\"aisle\":\"Produce\",\"image\":\"sliced-carrot.png\",\"consistency\":\"SOLID\",\"name\":\"carrots\",\"nameClean\":\"carrot\",\"original\":\"1 cup grated carrots (about 3-4 medium carrots)\",\"originalName\":\"grated carrots (about 3-4 medium carrots)\",\"amount\":1,\"unit\":\"cup\",\"meta\":[\"grated\",\"( 3-4 medium carrots)\"],\"measures\":{\"us\":{\"amount\":1,\"unitShort\":\"cup\",\"unitLong\":\"cup\"},\"metric\":{\"amount\":128,\"unitShort\":\"g\",\"unitLong\":\"grams\"}}},{\"id\":93824,\"aisle\":\"Baking\",\"image\":\"flour.png\",\"consistency\":\"SOLID\",\"name\":\"flour\",\"nameClean\":\"white whole wheat flour\",\"original\":\"1 1\\/2 cups white whole wheat flour\",\"originalName\":\"white whole wheat flour\",\"amount\":1.5,\"unit\":\"cups\",\"meta\":[\"whole wheat\",\"white\"],\"measures\":{\"us\":{\"amount\":1.5,\"unitShort\":\"cups\",\"unitLong\":\"cups\"},\"metric\":{\"amount\":180,\"unitShort\":\"g\",\"unitLong\":\"grams\"}}},{\"id\":18369,\"aisle\":\"Baking\",\"image\":\"white-powder.jpg\",\"consistency\":\"SOLID\",\"name\":\"baking powder\",\"nameClean\":\"baking powder\",\"original\":\"1 tablespoon baking powder\",\"originalName\":\"baking powder\",\"amount\":1,\"unit\":\"tablespoon\",\"meta\":[],\"measures\":{\"us\":{\"amount\":1,\"unitShort\":\"Tbsp\",\"unitLong\":\"Tbsp\"},\"metric\":{\"amount\":1,\"unitShort\":\"Tbsp\",\"unitLong\":\"Tbsp\"}}},{\"id\":2047,\"aisle\":\"Spices and Seasonings\",\"image\":\"salt.jpg\",\"consistency\":\"SOLID\",\"name\":\"salt\",\"nameClean\":\"table salt\",\"original\":\"1\\/2 teaspoon salt\",\"originalName\":\"salt\",\"amount\":0.5,\"unit\":\"teaspoon\",\"meta\":[],\"measures\":{\"us\":{\"amount\":0.5,\"unitShort\":\"tsps\",\"unitLong\":\"teaspoons\"},\"metric\":{\"amount\":0.5,\"unitShort\":\"tsps\",\"unitLong\":\"teaspoons\"}}},{\"id\":2010,\"aisle\":\"Spices and Seasonings\",\"image\":\"cinnamon.jpg\",\"consistency\":\"SOLID\",\"name\":\"cinnamon\",\"nameClean\":\"cinnamon\",\"original\":\"1 teaspoon cinnamon\",\"originalName\":\"cinnamon\",\"amount\":1,\"unit\":\"teaspoon\",\"meta\":[],\"measures\":{\"us\":{\"amount\":1,\"unitShort\":\"tsp\",\"unitLong\":\"teaspoon\"},\"metric\":{\"amount\":1,\"unitShort\":\"tsp\",\"unitLong\":\"teaspoon\"}}},{\"id\":2025,\"aisle\":\"Spices and Seasonings\",\"image\":\"ground-nutmeg.jpg\",\"consistency\":\"SOLID\",\"name\":\"ground nutmeg\",\"nameClean\":\"nutmeg\",\"original\":\"1\\/4 teaspoon ground nutmeg\",\"originalName\":\"ground nutmeg\",\"amount\":0.25,\"unit\":\"teaspoon\",\"meta\":[],\"measures\":{\"us\":{\"amount\":0.25,\"unitShort\":\"tsps\",\"unitLong\":\"teaspoons\"},\"metric\":{\"amount\":0.25,\"unitShort\":\"tsps\",\"unitLong\":\"teaspoons\"}}},{\"id\":1022001,\"aisle\":\"Spices and Seasonings\",\"image\":\"allspice-ground.jpg\",\"consistency\":\"SOLID\",\"name\":\"ground allspice\",\"nameClean\":\"ground allspice\",\"original\":\"pinch of ground allspice\",\"originalName\":\"pinch of ground allspice\",\"amount\":1,\"unit\":\"pinch\",\"meta\":[],\"measures\":{\"us\":{\"amount\":1,\"unitShort\":\"pinch\",\"unitLong\":\"pinch\"},\"metric\":{\"amount\":1,\"unitShort\":\"pinch\",\"unitLong\":\"pinch\"}}},{\"id\":1001,\"aisle\":\"Milk, Eggs, Other Dairy\",\"image\":\"butter-sliced.jpg\",\"consistency\":\"SOLID\",\"name\":\"butter\",\"nameClean\":\"butter\",\"original\":\"4 tablespoons butter, melted\",\"originalName\":\"butter, melted\",\"amount\":4,\"unit\":\"tablespoons\",\"meta\":[\"melted\"],\"measures\":{\"us\":{\"amount\":4,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"},\"metric\":{\"amount\":4,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"}}},{\"id\":1123,\"aisle\":\"Milk, Eggs, Other Dairy\",\"image\":\"egg.png\",\"consistency\":\"SOLID\",\"name\":\"egg\",\"nameClean\":\"egg\",\"original\":\"1 egg\",\"originalName\":\"egg\",\"amount\":1,\"unit\":null,\"meta\":[],\"measures\":{\"us\":{\"amount\":1,\"unitShort\":null,\"unitLong\":null},\"metric\":{\"amount\":1,\"unitShort\":null,\"unitLong\":null}}},{\"id\":1077,\"aisle\":\"Milk, Eggs, Other Dairy\",\"image\":\"milk.png\",\"consistency\":\"LIQUID\",\"name\":\"milk\",\"nameClean\":\"milk\",\"original\":\"1 1\\/2 cups milk\",\"originalName\":\"milk\",\"amount\":1.5,\"unit\":\"cups\",\"meta\":[],\"measures\":{\"us\":{\"amount\":1.5,\"unitShort\":\"cups\",\"unitLong\":\"cups\"},\"metric\":{\"amount\":366,\"unitShort\":\"ml\",\"unitLong\":\"milliliters\"}}},{\"id\":19334,\"aisle\":\"Baking\",\"image\":\"dark-brown-sugar.png\",\"consistency\":\"SOLID\",\"name\":\"turbinado\",\"nameClean\":\"golden brown sugar\",\"original\":\"3 tablespoons turbinado or other brown sugar\",\"originalName\":\"turbinado or other brown sugar\",\"amount\":3,\"unit\":\"tablespoons\",\"meta\":[],\"measures\":{\"us\":{\"amount\":3,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"},\"metric\":{\"amount\":3,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"}}},{\"id\":19334,\"aisle\":\"Baking\",\"image\":\"light-brown-sugar.jpg\",\"consistency\":\"SOLID\",\"name\":\"turbinado\",\"nameClean\":\"golden brown sugar\",\"original\":\"3 tablespoons turbinado or other brown sugar\",\"originalName\":\"turbinado or other brown sugar\",\"amount\":3,\"unit\":\"tablespoons\",\"meta\":[],\"measures\":{\"us\":{\"amount\":3,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"},\"metric\":{\"amount\":3,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"}}},{\"id\":2050,\"aisle\":\"Baking\",\"image\":\"vanilla-extract.jpg\",\"consistency\":\"LIQUID\",\"name\":\"vanilla extract\",\"nameClean\":\"vanilla extract\",\"original\":\"1 teaspoon vanilla extract\",\"originalName\":\"vanilla extract\",\"amount\":1,\"unit\":\"teaspoon\",\"meta\":[],\"measures\":{\"us\":{\"amount\":1,\"unitShort\":\"tsp\",\"unitLong\":\"teaspoon\"},\"metric\":{\"amount\":1,\"unitShort\":\"tsp\",\"unitLong\":\"teaspoon\"}}},{\"id\":9299,\"aisle\":\"Produce\",\"image\":\"raisins.jpg\",\"consistency\":\"SOLID\",\"name\":\"optional: raisins\",\"nameClean\":\"raisins\",\"original\":\"Optional: 1\\/2 cup raisins or crushed walnuts\\/pecans (or a combination)\",\"originalName\":\"Optional: raisins or crushed walnuts\\/pecans (or a combination)\",\"amount\":0.5,\"unit\":\"cup\",\"meta\":[\"crushed\",\"(or a combination)\"],\"measures\":{\"us\":{\"amount\":0.5,\"unitShort\":\"cups\",\"unitLong\":\"cups\"},\"metric\":{\"amount\":72.5,\"unitShort\":\"g\",\"unitLong\":\"grams\"}}}]'),
(637876, 'Chicken 65', 'Chicken 65 could be just the <b>gluten free</b> recipe you\'ve been looking for. This hor d\'oeuvre has <b>121 calories</b>, <b>19g of protein</b>, and <b>3g of fat</b> per serving. For <b>$1.15 per serving</b>, this recipe <b>covers 11%</b> of your daily requirements of vitamins and minerals. This recipe serves 6. Head to the store and pick up salt, chili powder, yogurt, and a few other things to make it today. 6 people have made this recipe and would make it again. It is brought to you by Foodista. From preparation to the plate, this recipe takes approximately <b>45 minutes</b>. Overall, this recipe earns a <b>not so spectacular spoonacular score of 39%</b>. Similar recipes are <a href=\"https://spoonacular.com/recipes/i-aint-chicken-chicken-crispy-roasted-chicken-breasts-with-orange-and-cardamom-1243251\">I Ain\'t Chicken Chicken: Crispy Roasted Chicken Breasts with Orange and Cardamom</a>, <a href=\"https://spoonacular.com/recipes/i-aint-chicken-chicken-crispy-roasted-chicken-breasts-with-orange-and-cardamom-1230059\">I Ain\'t Chicken Chicken: Crispy Roasted Chicken Breasts with Orange and Cardamom</a>, and <a href=\"https://spoonacular.com/recipes/i-aint-chicken-chicken-crispy-roasted-chicken-breasts-with-orange-and-cardamom-1224321\">I Ain\'t Chicken Chicken: Crispy Roasted Chicken Breasts with Orange and Cardamom</a>.', '\"<ol><li>Take a large bowl mix in the ginger and garlic paste, yogurt, red chilly powder, turmeric powder, and salt.<\\/li><li>Mix well to from smooth and thick paste, add the chicken pieces to the masala paste and  marinaded for 4 hours.<\\/li><li>Heat enough oil in a pan to deep fry the marinaded chicken pieces. Deep fry the chicken pieces in batches till crisp and golden color.<\\/li><li>Note: The taste of the Chicken 65 depends mainly on the amount of time it gets marinated in the masala, it is best to marinate the chicken pieces the day before.<\\/li><\\/ol>\"', 'https://img.spoonacular.com/recipes/637876-556x370.jpg', '[{\"id\":5062,\"aisle\":\"Meat\",\"image\":\"chicken-breasts.png\",\"consistency\":\"SOLID\",\"name\":\"chicken breast\",\"nameClean\":\"chicken breast\",\"original\":\"500 grams boneless chicken breast\",\"originalName\":\"boneless chicken breast\",\"amount\":500,\"unit\":\"grams\",\"meta\":[\"boneless\"],\"measures\":{\"us\":{\"amount\":1.102,\"unitShort\":\"lb\",\"unitLong\":\"pounds\"},\"metric\":{\"amount\":500,\"unitShort\":\"g\",\"unitLong\":\"grams\"}}},{\"id\":2009,\"aisle\":\"Spices and Seasonings\",\"image\":\"chili-powder.jpg\",\"consistency\":\"SOLID\",\"name\":\"chili powder\",\"nameClean\":\"chili powder\",\"original\":\"2-3 tsp chili powder\",\"originalName\":\"chili powder\",\"amount\":2,\"unit\":\"tsp\",\"meta\":[],\"measures\":{\"us\":{\"amount\":2,\"unitShort\":\"tsps\",\"unitLong\":\"teaspoons\"},\"metric\":{\"amount\":2,\"unitShort\":\"tsps\",\"unitLong\":\"teaspoons\"}}},{\"id\":10111215,\"aisle\":\"Ethnic Foods\",\"image\":\"garlic-paste.png\",\"consistency\":\"SOLID\",\"name\":\"ginger and garlic paste\",\"nameClean\":\"garlic paste\",\"original\":\"4 tbsp Ginger and Garlic paste\",\"originalName\":\"Ginger and Garlic paste\",\"amount\":4,\"unit\":\"tbsp\",\"meta\":[],\"measures\":{\"us\":{\"amount\":4,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"},\"metric\":{\"amount\":4,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"}}},{\"id\":2047,\"aisle\":\"Spices and Seasonings\",\"image\":\"salt.jpg\",\"consistency\":\"SOLID\",\"name\":\"salt\",\"nameClean\":\"table salt\",\"original\":\"\\u00bd tbsp. salt\",\"originalName\":\"salt\",\"amount\":0.5,\"unit\":\"tbsp\",\"meta\":[],\"measures\":{\"us\":{\"amount\":0.5,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"},\"metric\":{\"amount\":0.5,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"}}},{\"id\":2043,\"aisle\":\"Spices and Seasonings\",\"image\":\"turmeric.jpg\",\"consistency\":\"SOLID\",\"name\":\"turmeric powder\",\"nameClean\":\"turmeric\",\"original\":\"1\\/4 tsp Turmeric powder\",\"originalName\":\"Turmeric powder\",\"amount\":0.25,\"unit\":\"tsp\",\"meta\":[],\"measures\":{\"us\":{\"amount\":0.25,\"unitShort\":\"tsps\",\"unitLong\":\"teaspoons\"},\"metric\":{\"amount\":0.25,\"unitShort\":\"tsps\",\"unitLong\":\"teaspoons\"}}},{\"id\":1116,\"aisle\":\"Milk, Eggs, Other Dairy\",\"image\":\"plain-yogurt.jpg\",\"consistency\":\"SOLID\",\"name\":\"yogurt\",\"nameClean\":\"yogurt\",\"original\":\"4 tbsp yogurt\",\"originalName\":\"yogurt\",\"amount\":4,\"unit\":\"tbsp\",\"meta\":[],\"measures\":{\"us\":{\"amount\":4,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"},\"metric\":{\"amount\":4,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"}}}]'),
(716342, 'Chicken Suya', 'The recipe Chicken Suya can be made <b>in roughly 45 minutes</b>. This recipe serves 1 and costs $1.67 per serving. One serving contains <b>564 calories</b>, <b>44g of protein</b>, and <b>35g of fat</b>. This recipe from Afrolems requires suya spice, chicken, chilli powder, and seasoning cubes. It works well as a main course. 56 people have made this recipe and would make it again. It is a good option if you\'re following a <b>gluten free, dairy free, whole 30, and ketogenic</b> diet. Overall, this recipe earns a <b>solid spoonacular score of 79%</b>. If you like this recipe, you might also like recipes such as <a href=\"https://spoonacular.com/recipes/suya-nigerian-chicken-skewers-113497\">Suya (Nigerian Chicken Skewers)</a>, <a href=\"https://spoonacular.com/recipes/suya-swordfish-6571\">Suya Swordfish</a>, and <a href=\"https://spoonacular.com/recipes/i-aint-chicken-chicken-crispy-roasted-chicken-breasts-with-orange-and-cardamom-1224321\">I Ain\'t Chicken Chicken: Crispy Roasted Chicken Breasts with Orange and Cardamom</a>.', '\"Heat the oven to 500 F.Wash and season the chicken with the Suya spice, chilli powder, seasoning cubes, salt and drizzle the oil over it.Place the chicken in the oven and grill for 40 minutes. Check the chicken occasionally and flip on both sides so it can cook properly.Serve hot garnished with the onions and tomato and a bit of suya spice sprinkled over the chicken.\"', 'https://img.spoonacular.com/recipes/716342-556x370.jpg', '[{\"id\":1032027,\"aisle\":\"Spices and Seasonings\",\"image\":\"seasoning.png\",\"consistency\":\"SOLID\",\"name\":\"suya spice\",\"nameClean\":\"seasoning mix\",\"original\":\"1.5 Tablespoons of Suya Spice\",\"originalName\":\"Suya Spice\",\"amount\":1.5,\"unit\":\"Tablespoons\",\"meta\":[],\"measures\":{\"us\":{\"amount\":1.5,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"},\"metric\":{\"amount\":1.5,\"unitShort\":\"Tbsps\",\"unitLong\":\"Tbsps\"}}},{\"id\":5006,\"aisle\":\"Meat\",\"image\":\"whole-chicken.jpg\",\"consistency\":\"SOLID\",\"name\":\"chicken\",\"nameClean\":\"whole chicken\",\"original\":\"1 pound Chicken\",\"originalName\":\"Chicken\",\"amount\":1,\"unit\":\"pound\",\"meta\":[],\"measures\":{\"us\":{\"amount\":1,\"unitShort\":\"lb\",\"unitLong\":\"pound\"},\"metric\":{\"amount\":217.724,\"unitShort\":\"g\",\"unitLong\":\"grams\"}}},{\"id\":2009,\"aisle\":\"Spices and Seasonings\",\"image\":\"chili-powder.jpg\",\"consistency\":\"SOLID\",\"name\":\"chilli powder\",\"nameClean\":\"chili powder\",\"original\":\"1 teaspoon of chilli powder\",\"originalName\":\"chilli powder\",\"amount\":1,\"unit\":\"teaspoon\",\"meta\":[],\"measures\":{\"us\":{\"amount\":1,\"unitShort\":\"tsp\",\"unitLong\":\"teaspoon\"},\"metric\":{\"amount\":1,\"unitShort\":\"tsp\",\"unitLong\":\"teaspoon\"}}},{\"id\":4582,\"aisle\":\"Oil, Vinegar, Salad Dressing\",\"image\":\"vegetable-oil.jpg\",\"consistency\":\"LIQUID\",\"name\":\"cooking spoon groundnut oil\",\"nameClean\":\"cooking oil\",\"original\":\"1 cooking spoon groundnut oil\",\"originalName\":\"cooking spoon groundnut oil\",\"amount\":1,\"unit\":null,\"meta\":[],\"measures\":{\"us\":{\"amount\":1,\"unitShort\":null,\"unitLong\":null},\"metric\":{\"amount\":1,\"unitShort\":null,\"unitLong\":null}}},{\"id\":99186,\"aisle\":\"Meat\",\"image\":\"diced-ham.jpg\",\"consistency\":\"SOLID\",\"name\":\"seasoning cubes\",\"nameClean\":\"diced ham\",\"original\":\"Seasoning cubes\",\"originalName\":\"Seasoning cubes\",\"amount\":1,\"unit\":\"serving\",\"meta\":[],\"measures\":{\"us\":{\"amount\":1,\"unitShort\":\"serving\",\"unitLong\":\"serving\"},\"metric\":{\"amount\":1,\"unitShort\":\"serving\",\"unitLong\":\"serving\"}}},{\"id\":11282,\"aisle\":\"Produce\",\"image\":\"brown-onion.png\",\"consistency\":\"SOLID\",\"name\":\"onions and tomatoes\",\"nameClean\":\"onion\",\"original\":\"Onions and Tomatoes for Garnishing\",\"originalName\":\"Onions and Tomatoes for Garnishing\",\"amount\":1,\"unit\":\"serving\",\"meta\":[\"for garnishing\"],\"measures\":{\"us\":{\"amount\":1,\"unitShort\":\"serving\",\"unitLong\":\"serving\"},\"metric\":{\"amount\":1,\"unitShort\":\"serving\",\"unitLong\":\"serving\"}}},{\"id\":2047,\"aisle\":\"Spices and Seasonings\",\"image\":\"salt.jpg\",\"consistency\":\"SOLID\",\"name\":\"salt\",\"nameClean\":\"table salt\",\"original\":\"Salt to taste\",\"originalName\":\"Salt to taste\",\"amount\":1,\"unit\":\"serving\",\"meta\":[\"to taste\"],\"measures\":{\"us\":{\"amount\":1,\"unitShort\":\"serving\",\"unitLong\":\"serving\"},\"metric\":{\"amount\":1,\"unitShort\":\"serving\",\"unitLong\":\"serving\"}}}]');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('UWtSiP4SMRkdwGsjk9MTBKRcyMWSW7R64kge2Ye7', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoid2xlT1JGRFJDUWhWMTdtWEpTSUg4aE05S3JpTnBLOVRVNmxmSlh5eiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWNpcGVfc2VhcmNoIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTt9', 1716173227);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Katarina', 'katarina@gmail.com', NULL, '$2y$12$vltZPonoi6a6bClVo74MI.TW3TWaHw811Ei7kyF16rpYawpCO22bi', NULL, '2024-05-18 20:59:41', '2024-05-18 20:59:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `id_recipes` (`id_recipes`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=716343;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`id_recipes`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favourites_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
