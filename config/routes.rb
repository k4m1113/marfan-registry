Rails.application.routes.draw do
  resources :visits do
    member do
      get 'report'
    end
  end

  resources :patients do
    resources :heart_imagings
    resources :hospitalizations
    resources :symptoms
    resources :family_members
    resources :tests
    resources :medications
    resources :procedures
    resources :complications
    resources :diagnoses
    resources :vitals
  end

  resources :topics

  resources :clinicians
  resources :hospitalizations
  resources :symptoms
  resources :family_members
  resources :tests

  root "pages#main"

  put 'family_members' => 'family_members#make_patient'
end
