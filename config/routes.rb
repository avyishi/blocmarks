Blocmarks::Application.routes.draw do
  resources :bookmarks
  resources :likes

  devise_for :users
  
  root :to => "site#index"
end
