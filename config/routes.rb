Blocmarks::Application.routes.draw do
 

  get 'topics/index'

  get 'topics/new'

  get 'topics/show'

  get 'hashtags/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :bookmarks do
    resources :likes, only: [:create, :destroy]
  end

  resources :likes, :users
  
  #devise_scope :user do
    #get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end

  get 'welcome/bookmarks'
  get 'welcome/about'
  
  
  root to: 'welcome#index'

  post :incoming, to: 'incoming#create'
end
