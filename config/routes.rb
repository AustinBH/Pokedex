Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'teams' => 'teams#index'
  get 'teams/:id' => 'teams#show'
  get 'trainers' => 'trainers#index'
  get 'trainers/:id' => 'trainers#show'
  get 'pokemon' => 'pokemons#index'
  get 'pokemon/:id' => 'pokemons#show'
end
