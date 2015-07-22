Rails.application.routes.draw do
   root 'pictures#home'
   resources 'pictures'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
end
