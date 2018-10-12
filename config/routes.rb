Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/all_products' => 'products#everything'
    get '/first_product' => 'products#first'
    get '/second_product' => 'products#second'
  end
end
