Rails.application.routes.draw do
  resources :visits

  root "visits#new"
end
