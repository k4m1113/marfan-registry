Rails.application.routes.draw do
  resources :visits
  resources :clinicians
  resources :patients

  root "patients#new"
end
