Rails.application.routes.draw do
  root 'contracts#index'
  resources :contracts
  get 'generate_bill', to: 'contracts#generate_bill'

end
