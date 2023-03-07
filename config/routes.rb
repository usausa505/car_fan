Rails.application.routes.draw do

  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

 scope module: :public do
  root to: 'homes#top'
  get "/about"=>"homes#about"
  get 'relationships/followings'
  get 'relationships/followers'
  get "search" => "searches#search"
  
  resources :posts, only: [:index, :show, :edit, :create, :destroy, :update] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:index,:show,:edit,:update] do
    # 以下フォロー機能の実装
    resource :relationships, only: [:create, :destroy] 
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resource :users,only: [] do
    get "my_page"=>"users#show"
    get "information/edit"=>"users#edit"
    patch "information"=>"users#update"
    get "confirm_withdraw"=>"users#confirm_withdraw"
    patch "withdraw"=>"users#withdraw"
  end
end
  
  
  
  
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :posts, only: [:show, :index, :edit, :destroy] # destroyは不適切な投稿を削除するためのモノ
    resources :users, only: [:show, :index, :edit, :update]　# updateはユーザーの利用状況を更新するためのモノ
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
