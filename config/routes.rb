Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  namespace :v1 do
    get 'teams' => 'teams#index'
    post 'teams' => 'teams#create'
    get 'teams/:id' => 'teams#show'
    delete 'teams/:id' => 'teams#destroy'
    get 'trainers' => 'trainers#index'
    get 'trainers/:id' => 'trainers#show'
    post 'trainers' => 'trainers#create'
    delete 'trainers/:id' => 'trainers#destroy'
    get 'pokemon' => 'pokemon#index'
    get 'pokemon/:id' => 'pokemon#show'
    post 'pokemon_teams' => 'pokemon_teams#create'
    delete 'pokemon_teams' => 'pokemon_teams#destroy'
  end
  namespace :v2 do
    get 'pokemon' => 'pokemon#index'
    get 'pokemon/:id' => 'pokemon#show'
  end
end
