require 'Nwpadmin'
Rails.application.routes.draw do


  resources :individuals
  resources :cohorts
  resources :assessments
  resources :organizations
  constraints(Nwpadmin) do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    get '/report' => 'users#report'
  end

  devise_for :users

  root 'static_pages#home'
  get 'static_pages/home'

  get 'static_pages/help'

  #constraints(Nwpadmin) do
#    get '/report' => 'users#report'
 # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
