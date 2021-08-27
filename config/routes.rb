Rails.application.routes.draw do
  resources :canciones
  resources :temporada_capitulos
  root "welcome#index"
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
