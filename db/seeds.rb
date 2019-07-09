# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
image_url = "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/"

counter = 101
while counter <= 151 do
  species_request = PokeApi.get(pokemon_species: counter)
  pokemon_request = PokeApi.get(pokemon: counter)
  name = species_request.name.capitalize
  pokedex_number = counter

  japanese_descriptions = [
    10, 11, 12, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
    35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
    50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62,
    63, 64, 65, 66, 67, 68, 72, 73, 74, 75, 76, 79, 80,
    81, 82, 86, 87, 88, 89, 90, 91, 92, 93, 94, 96, 97,
    102, 103, 104, 105, 108, 113, 115, 118, 119, 120, 121,
    122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132,
    133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143,
    147, 148, 149]
  if japanese_descriptions.include?(counter)
    description = species_request.flavor_text_entries[2].flavor_text
  else
    description = species_request.flavor_text_entries[1].flavor_text
  end

  pokemon_type = ''
  PokeApi.get(pokemon: counter).types.each do |type_collection|
    pokemon_type << " #{type_collection.type.name}"
  end

  height = pokemon_request.height.to_i
  weight = pokemon_request.weight.to_i

  if counter <= 9
    img_url =  "#{image_url}00#{counter}.png"
  elsif counter <= 99
    img_url = "#{image_url}0#{counter}.png"
  else
    img_url = "#{image_url}#{counter}.png"
  end

  Pokemon.create(name: name, pokedex_number: pokedex_number, description: description, pokemon_type: pokemon_type, height: height, weight: weight, img_url: img_url)
  counter += 1
end

5.times do
  username = Faker::Name.first_name
  Trainer.create(username: username)
end

10.times do
  name = Faker::JapaneseMedia::DragonBall.character
  trainer = Trainer.all.sample
  Team.create(name: name, trainer: trainer)
end

30.times do
  team = Team.all.sample
  pokemon = Pokemon.all.sample
  PokemonTeam.create(team: team, pokemon: pokemon)
end
