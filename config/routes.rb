Rails.application.routes.draw do
  get 'passengers/index'
  get 'passengers/show'
  get 'passengers/edit'
  get 'passengers/create'
  get 'passengers/new'
  get 'passengers/destroy'
  get 'passengers/update'
  get 'drivers/index'
  get 'drivers/show'
  get 'drivers/edit'
  get 'drivers/create'
  get 'drivers/new'
  get 'drivers/destroy'
  get 'drivers/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
