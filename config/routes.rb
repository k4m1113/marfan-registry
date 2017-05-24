Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  resources :galleries do
    resources :attachments, only: [:create, :destroy]
  end
  # resources :visits do
  #   resources :heart_imagings
  #   resources :hospitalizations
  #   resources :symptoms
  #   resources :family_members
  #   resources :tests
  #   resources :medications
  #   resources :procedures
  #   resources :complications
  #   resources :diagnoses
  #   resources :vitals
  # end
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

  root "patients#index"

  put 'family_members' => 'family_members#make_patient'
end
