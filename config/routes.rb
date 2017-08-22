Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

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
        put :process
        put :finalized
      end
    end
  end

  namespace :cashier do
    resources :orders
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
