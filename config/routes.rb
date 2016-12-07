require 'Nwpadmin'
Rails.application.routes.draw do


  resources :attendances
  resources :meetings
  resources :individuals, :has_many => :household_members
  resources :cohorts
  resources :assessments
  resources :organizations
  constraints(Nwpadmin) do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    get '/report' => 'users#report'
  end

  match '/check_code',      to: 'individuals#check_code',        via: 'post'

  devise_for :users

  root 'static_pages#home'
  get 'static_pages/home'

  get 'static_pages/help'

  get 'individual/assign' => 'individuals#assign_cohort', :as => 'assign_cohort'
  get 'individual/assign_to_cohort' => 'individuals#assign_individual_to_cohort', :as => 'assign_individual_to_cohort'
  get 'individual/remove_from_cohort' => 'individuals#remove_individual_from_cohort', :as => 'remove_individual_from_cohort'
  get 'individual/demographics' => 'individuals#demographics', :as => 'individual_demographics'


  #constraints(Nwpadmin) do
#    get '/report' => 'users#report'
 # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
