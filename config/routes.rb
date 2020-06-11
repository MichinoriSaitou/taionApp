Rails.application.routes.draw do


  get  'mypage', to: 'users#me'
  get  'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'mygroup', to: 'groups#mygroup'
  get 'addgroup', to: 'group_users#new'
  post  'addgroup', to: 'group_users#create'

  root 'top#index'

  resources :users


  resources :groups do
    resources :posts, only: %i[new create edit update]
  end

  

  end


  


