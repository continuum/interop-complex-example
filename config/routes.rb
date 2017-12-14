Rails.application.routes.draw do
  scope 'complex_example' do
    resources :personas, defaults: {format: :json}

    get 'monitor', to: 'monitor#status', defaults: {format: :json}
  
    get 'logs', to: 'traceability#logs', defaults: {format: :json}
  end
  
end
