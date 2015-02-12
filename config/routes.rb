Rails.application.routes.draw do
  resources :articles, except: [:show, :destroy]
  root to: 'articles#index'
end
