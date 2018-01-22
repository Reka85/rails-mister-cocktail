Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cocktails#index'
  resources :cocktails, only: [:show, :new, :create] do
    resources :doses, only: [:new, :create, :destroy], shallow: true
  end
  mount Attachinary::Engine => "/attachinary"

end
