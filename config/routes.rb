Rails.application.routes.draw do

  namespace :admin do
    get 'posts/edit'
    get 'posts/index'
    get 'posts/show'
  end
  namespace :admin do
    get 'users/edit'
    get 'users/index'
    get 'users/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'posts/edit'
    get 'posts/index'
    get 'posts/show'
  end
  namespace :public do
    get 'users/edit'
    get 'users/index'
    get 'users/show'
  end
  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  
  
  
  
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
