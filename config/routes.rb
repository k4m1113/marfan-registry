Rails.application.routes.draw do
  root 'patients#index'

  resources :clinicians
  resources :complications
  resources :diagnoses
  resources :dissections
  resources :family_members
  resources :heart_measurements
  resources :hospitalizations
  resources :images
  resources :medications
  resources :patients
  resources :procedures
  resources :symptoms
  resources :tests
  resources :topics
  resources :vitals
  resources :visits

  resources :visits do
    member do
      get 'report'
    end
  end

  get 'auth/familysearch/complete', to: 'visits#index'
  put 'family_members' => 'family_members#make_patient'

end
