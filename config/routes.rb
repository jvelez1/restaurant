Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    unauthenticated do
      root 'welcome#index', as: :unauthenticated_root
    end
  end

  resources :chefs do
    resources :dishes
  end

  namespace :admin do
    resources :orders, only: [:index, :show] do
      member do
        get :report
      end
      collection do
        get :report
        get :cash_flow
      end
    end
  end

  namespace :chef do
    resources :orders, only: [:index] do
      collection do
        put :to_process
        put :finalized
      end
    end
  end

  namespace :cashier do
    resources :orders
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
