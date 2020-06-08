Rails.application.routes.draw do


  get  'mypage', to: 'users#me'
  get  'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'mygroup', to: 'groups#mygroup'
  get 'adduser/:id', to: 'groups#add_user'
  post  'addgroup', to: 'groups#add_group'

  root 'top#index'

  resources :users


  resources :groups do
    resources :posts, only: %i[new create show]
  end


  end
  


