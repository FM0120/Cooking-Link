Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  devise_for :users
  root to:'homes#top'
    resources :post_comments, only: [:new, :create, :index, :show, :destroy]
    resources :favorites,only: [:create,:destroy]
    resources :homes,only: [:index]
    resources :makeings,only: [:edit,:create,:destroy,:update]
    resources :recipes,only: [:index,:new,:show,:edit,:create,:update,:destroy]
    resources :relathionsips,only: [:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
