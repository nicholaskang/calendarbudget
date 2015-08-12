Rails.application.routes.draw do

  devise_for :users
  root to:                         'forecasts#index'
  get     "/"                   => 'forecasts#index'
  get     "/forecasts"          => 'forecasts#index'
  get     "/forecasts/new"      => 'forecasts#new'
  post    "/forecasts"          => 'forecasts#create'
  get     "/forecasts/:id"      => 'forecasts#show'
  get     "/forecasts/:id/edit" => 'forecasts#edit'
  patch   "/forecasts/:id"      => 'forecasts#update'
  delete  "/forecasts/:id"      => 'forecasts#destroy'

  namespace :api do
    namespace :v1 do
      resources :forecasts
      resources :incomes
      resources :expenses
      resources :income_types
      resources :expense_types
      resources :frequencies
      resources :starting_balances
    end
  end

end