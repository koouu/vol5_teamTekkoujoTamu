Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms_of_service', to: 'static_pages#terms_of_service'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
