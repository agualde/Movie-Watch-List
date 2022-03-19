Rails.application.routes.draw do
  root to: 'lists#index'
  resources :bookmarks, only: [:destroy]
  resources :movies, only: [:index, :show]
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only:  [:new, :create] do
      resources :movies, only: [:index, :show]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
