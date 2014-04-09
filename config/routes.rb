RedtApp::Application.routes.draw do

  root to: 'links#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout'=>'sessions#destroy'

  resources :users
  resources :links


end
