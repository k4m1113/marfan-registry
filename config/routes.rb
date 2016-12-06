Rails.application.routes.draw do
  resources :visits do
    member do
      get 'report'
    end
    resources :hospitalizations
    resources :symptoms
  end
  resources :clinicians
  resources :patients
  resources :hospitalizations
  resources :symptoms
  resources :relationships

  root "pages#main"
end
