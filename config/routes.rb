Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'api/v1/urls/add/:url', to: 'urls#new'
  get 'api/v1/urls/add/:url', to: 'urls#new'
  get 'api/v1/urls/top', to: 'urls#top'
  get '/s/:short', to: 'urls#show'

end
