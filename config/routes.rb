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

  namespace :chef do
    resources :orders, only: [:index] do
      collection do
        put :finished
      end
    end
  end

  namespace :cashier do
    resources :orders
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
