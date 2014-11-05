Blocmarks::Application.routes.draw do
  devise_for :users
  resources :bookmarks
  resources :likes

  
  
  root :to => "site#index"

  post :incoming, to: 'incoming#create'
end
