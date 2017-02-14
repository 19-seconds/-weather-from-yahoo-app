Rails.application.routes.draw do
  get "/forecasts", to: 'forecasts#index'
end
