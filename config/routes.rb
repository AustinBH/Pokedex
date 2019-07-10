Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'teams' => 'teams#index'
  post 'teams' => 'teams#create'
  get 'teams/:id' => 'teams#show'
  delete 'teams/:id' => 'teams#destroy'
  get 'trainers' => 'trainers#index'
  get 'trainers/:id' => 'trainers#show'
  post 'trainers' => 'trainers#create'
  get 'pokemon' => 'pokemon#index'
  get 'pokemon/:id' => 'pokemon#show'
  post 'pokemon_teams' => 'pokemon_teams#create'
  delete 'pokemon_teams' => 'pokemon_teams#destroy'
end
