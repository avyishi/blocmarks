Blocmarks::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :bookmarks
  resources :likes

  #devise_scope :user do
   # get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end

  
  
  root :to => "site#index"

  post :incoming, to: 'incoming#create'
end
