Rails.application.routes.draw do
  
  resources :spectacles, only: %i[create index destroy]
end
