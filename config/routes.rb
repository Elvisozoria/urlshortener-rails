Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'api/v1/urls/add/:original_url', to: 'urls#new'
  get 'api/v1/urls/add/', to: 'urls#new'
  get 'api/v1/urls/top', to: 'urls#top'
  get '/s/:shorten_url', to: 'urls#redirect', as: :redirect

end
