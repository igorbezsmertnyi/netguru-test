Rails.application.routes.draw do
  devise_for :users

  root "home#welcome"
  resources :genres, only: :index do
    member do
      get "movies"
    end
  end

  resources :movies, only: %i[index show] do
    member do
      get :send_info
    end
    collection do
      get :export
    end

    resources :comments, only: %i[create destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :movies, only: %i[index show]
    end
  end
end
