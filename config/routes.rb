Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'search' => 'serches#search'

  resources :users, only: [:index, :edit, :create, :destroy, :update] do
    resources :relathionsips, only: [:create, :destroy, :followers, :followings]
    get 'followings' => 'relathionsips#followings', as: 'followings'
    get 'followers' => 'relathionsips#followers', as: 'followers'
    resources :recipes, only: [:index]
  end

  resources :recipes do
    collection do
      get 'rank'
    end
  end

  resources :homes, only: [:top]
  resources :recipes, only: [:index, :new, :show, :edit, :create, :update, :destroy] do
    resources :makings, only: [:edit, :create, :destroy, :update]
    resources :post_comments, only: [:new, :create, :index, :show, :destroy]
    resource :favolites, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
