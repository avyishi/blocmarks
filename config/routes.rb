Blocmarks::Application.routes.draw do
  resources :bookmarks

  devise_for :users
  
  root :to => "site#index"
end
