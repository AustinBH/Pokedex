# Our Pokedex API

We are currently in the process of deploying our API and will appropriately update this once we have done so.

## Database

  * Setup
    - Our database is setup using postgres so if you want to clone this repo down you will need to ren rails db:setup to start
    - Our seed file requires some work if you want to seed your database with all 807 pokemon.
    - Because we are seeding using the [PokeAPI](https://pokeapi.co/) and the [Poke API V2 Gem](https://github.com/rdavid1099/poke-api-v2) you will need to manually change the while loop in our seeds file.
    - The API supports 100 requests per minute so we recommend seeding 50-75 pokemon at one time.
    
   * Active Version
    - Once we have deployed our version of the API, we will be sure to include a link to it here.

## Using the API
  
  * Routes
    - All of the routes for our API are available to view pokemon specific information.
    - You can also view information about individual pokemon.
    - We do support 3 different filtering options at this time.
      - Pokemon Type
      - Pokemon Name
      - Pokemon Generation (I, II, III, etc.)
