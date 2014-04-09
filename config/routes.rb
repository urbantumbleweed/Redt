RedtApp::Application.routes.draw do

  root to: 'links#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout'=>'sessions#destroy'


  resources :users do
    resources :links, shallow: :true
  end

  post "/links/:id/upvote" => 'links#upvote', as: :upvote
  post "/links/:id/downvote" => 'links#downvote', as: :downvote

end
