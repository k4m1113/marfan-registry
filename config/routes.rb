Rails.application.routes.draw do
  resources :visits do
    member do
      get 'report'
    end
  end

  resources :patients do
    resources :dissections
    resources :hospitalizations
    resources :symptoms
    resources :family_members
    resources :tests
  end

  resources :dissections
  resources :clinicians
  resources :hospitalizations
  resources :symptoms
  resources :family_members
  resources :tests

  root "pages#main"

  put 'family_members' => 'family_members#make_patient'
end
