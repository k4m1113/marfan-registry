Rails.application.routes.draw do
  resources :visits

  resources :patients

  root "patients#new"
end
