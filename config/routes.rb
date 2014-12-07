Blocmarks::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #resources :users, only: [:show, :update]
  resources :topics do
    resources :bookmarks, except: [:new, :create]
  end

   resources :bookmarks do 
    resources :likes, only: [:create, :destroy]
  end
  resources :likes, :users
  
  #devise_scope :user do
    #get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end


  get 'welcome/about'

  root to: 'site#index'

  post :incoming, to: 'incoming#create'
end
