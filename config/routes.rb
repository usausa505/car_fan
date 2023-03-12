Rails.application.routes.draw do

  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
    #to以降の見方：publicというcontrollerファイルの、sessionという名前の、guest_sign_inメソッドを参照するという意味
    #例えばpulicの部分をusersと記述してしまうと、存在しないファイルを参照するためエラーが生じるので注意！
  end

  scope module: :public do
    root to: 'homes#top'
    get "/about"=>"homes#about"
    get "search" => "searches#search"

    resources :posts, only: [:index, :show, :edit, :create, :destroy, :update] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    resources :users, only: [:index,:edit,:update] do
      get "my_page"=>"users#show"
      # 以下フォロー機能の実装
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    resource :users, only: [] do
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
    get "search" => "searches#search"
    resources :posts, only: [:show, :index, :edit, :destroy] # destroyは不適切な投稿を削除するためのモノ
    resources :users, only: [:index,:show,:edit,:update] # updateはユーザーステータスを変更するためのモノ
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
