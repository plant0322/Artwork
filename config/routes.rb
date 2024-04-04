Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users
  root to: "homes#top"

  resources :works do
    resource :work_favorite, only: [:create, :destroy]
    resources :work_comments, only: [:create, :destroy] do
      resource :thank, only: [:create, :destroy]
    end
  end
    get "works_art" => "works#works_art", as: "works_art"
    get "works_making" => "works#works_making", as: "works_making"
    get "works_memo" => "works#works_memo", as: "works_memo"

  resources :users, only: [:show, :index, :edit, :update] do
    resource :reletionships, only: [:create, :destroy]
    get "followings" => "reletionships#followings", as: "followings"
    get "followers" => "reletionships#followers", as: "followers"
  end

    get "users/:id/users_art" => "users#users_art", as: "users_art"
    get "users/:id/users_making" => "users#users_making", as: "users_making"
    get "users/:id/users_memo" => "users#users_memo", as: "users_memo"

  resources :chats, only: [:show, :create, :destroy]
  resources :rooms, only: [:index]

  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
