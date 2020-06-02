Rails.application.routes.draw do


  get  'mypage', to: 'users#me'
  get  'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  root 'top#index'

  resources :users
  


end
