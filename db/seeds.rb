# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
image_url = "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/"

counter = 1
while counter <= 50 do
  name = Faker::Games::Pokemon.name
  pokedex_number = counter
  description = Faker::ChuckNorris.fact
  pokemon_type = Faker::Games::Pokemon.move
  height = Faker::Number.number(2)
  weight = Faker::Number.number(3)
  if counter <= 9
    img_url =  "#{image_url}00#{counter}.png"
  else
    img_url = "#{image_url}0#{counter}.png"
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
