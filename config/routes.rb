Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/items/:id/", to: "items#show"

  get "/manufacturers/", to: "manufacturers#index"

  get "/projects/:id/", to: "projects#show"

end
