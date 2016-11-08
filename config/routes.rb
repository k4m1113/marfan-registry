Rails.application.routes.draw do
  resources :visits do
    member do
      get 'report'
    end
    resources :hospitalizations
    resources :symptoms
    resources :family_members
  end
  resources :clinicians
  resources :patients
  resources :hospitalizations
  resources :symptoms
  resources :family_members

  root "pages#main"
end
