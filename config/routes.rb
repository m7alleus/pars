Pars::Application.routes.draw do

  root to: 'sites#index'

  devise_for :users

  resources :sites, only: [:index, :create]

end
