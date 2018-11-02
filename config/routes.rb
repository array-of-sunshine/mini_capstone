Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/products' => 'products#index'
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'

    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'

    post '/orders' => 'orders#create'
    get '/orders' => 'orders#index'

    post '/carted_products' => 'carted_products#create'
    get '/carted_products' => 'carted_products#index'
    delete '/carted_products/:id' => 'carted_products#destroy'
  end
end

# the user's caretd_products are filtered
# by the user and by the status


# 4 situations i need to test

# correct user_id (1), correct status ('carted') => PASS
# incorrect user_id, correct status => fail
# correct user_id, incorrect status => fail +
# incorrect user_id, incorrect status => fail
