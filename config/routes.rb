Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get "my_cocktails", to: "users#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cocktails#index'
  resources :cocktails, except: [:edit, :update] do
    resources :doses, only: [:new, :create, :destroy], shallow: true
  end
  mount Attachinary::Engine => "/attachinary"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cocktails, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
