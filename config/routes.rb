Rails.application.routes.draw do
  scope 'complex_example' do
    resources :personas, defaults: {format: :json}
  end
end
