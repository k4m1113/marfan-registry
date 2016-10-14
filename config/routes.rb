Rails.application.routes.draw do
  resources :visits
  resources :clinicians
  resources :patients
  resources :hospitalizations
  resources :symptoms
  resources :family_members

  root "patients#new"
end
