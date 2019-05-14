Rails.application.routes.draw do
  root 'simple_pages#landing_page'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  root 'simple_pages#landing_page'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'payments/thank_you'
  post 'simple_pages/thank_you'

  resources :products do
    resources :comments
  end

  resources :users, except: [:index]
  resources :payments, only: [:create]
  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'simple_pages/thank_you'
  mount ActionCable.server => '/cable'
end
