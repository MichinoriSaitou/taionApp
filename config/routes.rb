Rails.application.routes.draw do


  
  get  'mypage', to: 'users#me'
  get  'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'mygroup', to: 'groups#mygroup'
  get 'adduser', to: 'groups#add_user'


  root 'top#index'

  resources :users
  resources :groups, only: %i[new create show]
  


end
