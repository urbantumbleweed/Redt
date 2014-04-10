RedtApp::Application.routes.draw do

  root to: 'links#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout'=>'sessions#destroy'

  get '/links/most_recent' => 'links#most_recent', as: :most_recent_links

  resources :users do
    resources :links, shallow: :true
  end

  post "/links/:id/upvote" => 'links#upvote', as: :upvote
  post "/links/:id/downvote" => 'links#downvote', as: :downvote

end
