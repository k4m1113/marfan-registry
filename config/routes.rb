Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  get 'auth/familysearch/complete', to: 'visits#index'

  resources :visits

  resources :visits do
    member do
      get 'report'
    end
  end

  resources :patients
  resources :topics
  resources :clinicians
  resources :hospitalizations
  resources :symptoms
  resources :family_members
  resources :tests
  resources :vitals
  resources :procedures
  resources :diagnoses
  resources :medications
  resources :complications
  resources :images
  resources :heart_measurements

  root "patients#index"

  put 'family_members' => 'family_members#make_patient'
end
