Rails.application.routes.draw do
  scope 'complex_example' do
    resources :people, defaults: {format: :json}
  end
end
