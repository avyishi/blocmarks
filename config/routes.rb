Blocmarks::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :bookmarks
  resources :likes

  
  
  root :to => "site#index"

  post :incoming, to: 'incoming#create'
end
