Rails.application.routes.draw do
  root "calculator#index"
  get "calculator", to: "calculator#index"
end