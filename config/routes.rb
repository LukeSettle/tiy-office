Rails.application.routes.draw do
   root 'home#index'
   resources 'pictures'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
end
