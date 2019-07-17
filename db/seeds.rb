# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
image_url = "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/"

# You need to iterate through 806 Pokemon. The PokeApi can only take 100
# requests per minute so break it up into chunks.

counter = 43
while counter <= 45 do
  # species_request = PokeApi.get(pokemon_species: counter)
  # pokemon_request = PokeApi.get(pokemon: counter)
  evolution_request = PokeApi.get(evolution_chain: 18)
  # if counter == 29
  #   name = 'Nidoran ♀'
  # elsif counter == 32
  #   name = 'Nidoran ♂'
  # else
  #   name = species_request.name.capitalize
  # end
  # pokedex_number = counter
  #
  # # This is set to filter all of the pokemon info from the api that have
  # # german descriptions before japanese ones.
  # japanese_descriptions = [
  #   10, 11, 12, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
  #   35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
  #   50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62,
  #   63, 64, 65, 66, 67, 68, 72, 73, 74, 75, 76, 79, 80,
  #   81, 82, 86, 87, 88, 89, 90, 91, 92, 93, 94, 96, 97,
  #   102, 103, 104, 105, 108, 113, 115, 118, 119, 120, 121,
  #   122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132,
  #   133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143,
  #   147, 148, 149, 163, 164, 165, 166, 167, 168, 169, 170,
  #   171, 172, 173, 174, 177, 178, 179, 180, 181, 182, 185,
  #   186, 187, 188, 189, 190, 196, 197, 198, 199, 200, 204,
  #   205, 206, 209, 210, 212, 214, 215, 222, 223, 224, 225,
  #   226, 227, 228, 229, 233, 235, 238, 239, 240, 241, 242,
  #   246, 247, 248, 278, 279, 283, 284, 296, 297, 299, 302,
  #   303, 309, 310, 318, 319, 320, 321, 324, 327, 328, 329,
  #   330, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348,
  #   349, 350, 351, 352, 353, 354, 357, 359, 361, 362, 366,
  #   367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 408,
  #   409, 410, 411, 422, 423, 424, 425, 426, 427, 428, 429,
  #   430, 439, 440, 443, 444, 445, 446, 447, 448, 456, 457,
  #   458, 461, 462, 463, 466, 467, 470, 471, 474, 476, 478,
  #   506, 507, 508, 524, 525, 526, 546, 547, 548, 549, 550,
  #   551, 552, 553, 559, 560, 564, 565, 566, 567, 568, 569,
  #   570, 571, 572, 573, 582, 583, 584, 587, 592, 593, 594,
  #   605, 606, 619, 620, 621, 622, 623, 624, 625, 627, 628,
  #   629, 630, 636, 637, 661, 662, 663, 667, 668, 669, 670,
  #   671, 674, 675, 676, 686, 687, 690, 691, 692, 693, 696,
  #   697, 698, 699, 700, 701, 702, 703, 704, 705, 706, 707,
  #   708, 709, 714, 715, 718, 722, 723, 724, 725, 726, 727,
  #   728, 729, 730, 731, 732, 733, 734, 735, 736, 737, 738,
  #   739, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749,
  #   750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760,
  #   761, 762, 763, 764, 765, 766, 767, 768, 769, 770, 771,
  #   772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782,
  #   783, 784, 785, 786, 787, 788, 789, 790, 791, 792, 793,
  #   794, 795, 796, 797, 798, 799, 800, 801, 802, 803, 804,
  #   805, 806, 807]
  #
  # if japanese_descriptions.include?(counter)
  #   description = species_request.flavor_text_entries[2].flavor_text
  # else
  #   description = species_request.flavor_text_entries[1].flavor_text
  # end
  #
  specific_pokemon = Pokemon.find(counter)

  if evolution_request.chain.evolves_to[0].species.name == specific_pokemon.name.downcase
    previous_pokemon = Pokemon.find(counter-1)
    evolution_tree = {evolves_into: [
      {name: evolution_request.chain.evolves_to[0].evolves_to[0].species.name,
      trigger: evolution_request.chain.evolves_to[0].evolves_to[0].evolution_details[0].trigger.name,
      min_level: evolution_request.chain.evolves_to[0].evolves_to[0].evolution_details[0].min_level
      }
      ],
      evolves_from: [
        {name: previous_pokemon.name,
        trigger: evolution_request.chain.evolves_to[0].evolution_details[0].trigger.name,
        min_level: evolution_request.chain.evolves_to[0].evolution_details[0].min_level
        }]}
  elsif evolution_request.chain.evolves_to[0].evolves_to[0].species.name == specific_pokemon.name.downcase
    previous_pokemon = Pokemon.find(counter-1)
    earliest_pokemon = Pokemon.find(counter-2)
    evolution_tree = {evolves_into: [],
      evolves_from: [
        {name: previous_pokemon.name,
        trigger: evolution_request.chain.evolves_to[0].evolves_to[0].evolution_details[0].trigger.name,
        min_level: evolution_request.chain.evolves_to[0].evolves_to[0].evolution_details[0].min_level
        },
        {name: earliest_pokemon.name,
        trigger: evolution_request.chain.evolves_to[0].evolution_details[0].trigger.name,
        min_level: evolution_request.chain.evolves_to[0].evolution_details[0].min_level
        }
      ]}
  else
    evolution_tree = {evolves_into: [
      {name: evolution_request.chain.evolves_to[0].species.name,
      trigger: evolution_request.chain.evolves_to[0].evolution_details[0].trigger.name,
      min_level: evolution_request.chain.evolves_to[0].evolution_details[0].min_level},
      {name: evolution_request.chain.evolves_to[0].evolves_to[0].species.name,
      trigger: evolution_request.chain.evolves_to[0].evolves_to[0].evolution_details[0].trigger.name,
      min_level: evolution_request.chain.evolves_to[0].evolves_to[0].evolution_details[0].min_level}
      ],
      evolves_from: [
      ]}
  end

  #
  #
  # if counter < 152
  #   generation = "1"
  # elsif counter < 252 && counter > 151
  #   generation = "2"
  # elsif counter < 387 && counter > 251
  #   generation = "3"
  # elsif counter < 494 && counter > 386
  #   generation = "4"
  # elsif counter < 650 && counter > 493
  #   generation = "5"
  # elsif counter < 722 && counter > 649
  #   generation = "6"
  # else
  #   generation = "7"
  # end
  #
  # pokemon_type = ''
  # PokeApi.get(pokemon: counter).types.each do |type_collection|
  #   pokemon_type << " #{type_collection.type.name}"
  # end
  #
  # height = pokemon_request.height.to_i
  # weight = pokemon_request.weight.to_i
  #
  # if counter <= 9
  #   img_url =  "#{image_url}00#{counter}.png"
  # elsif counter <= 99
  #   img_url = "#{image_url}0#{counter}.png"
  # else
  #   img_url = "#{image_url}#{counter}.png"
  # end

  specific_pokemon.update(evolution_tree: evolution_tree)
  counter += 1
end

# 5.times do
#   username = Faker::Name.first_name
#   Trainer.create(username: username)
# end
#
# 10.times do
#   name = Faker::JapaneseMedia::DragonBall.character
#   trainer = Trainer.all.sample
#   Team.create(name: name, trainer: trainer)
# end
#
# 30.times do
#   team = Team.all.sample
#   pokemon = Pokemon.all.sample
#   PokemonTeam.create(team: team, pokemon: pokemon)
# end
