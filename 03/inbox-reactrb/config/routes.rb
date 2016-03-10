Rails.application.routes.draw do
  mount ReactiveRecord::Engine => "/rr"
  devise_for :users
  root to: 'pages#home'
  resources :conversations, only: :index
end
