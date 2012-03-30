DilIe::Application.routes.draw do
  resources :definitions
  resources :bibls
  resources :part_of_speeches
  resources :entries do
    post 'search', on: :collection 
  end
  resources :columns
  resources :lines

  match '/search' => 'entries#search', :as => :search, :via => :post
  match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get
  match '/browse' => 'columns#index', :as => :browse, :via => :get
  match '/bibliography' => 'bibls#index', :as => 'bibliography', :via => :get
  root :to => 'columns#show', :id => '1'
end
