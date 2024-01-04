Rails.application.routes.draw do
  root to: 'home#top'
  get "home/about"=> "home#about", as: "about"

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  resources :items, only: [:new, :create, :edit, :show, :index]

  devise_for :users

  # resources public, only: [:create, :index, :show, :edit, :update, :destroy]
  # resources :admin, only: [:create, :new, :destroy]

  # patch 'books/:id' => 'books#update', as: 'update_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
