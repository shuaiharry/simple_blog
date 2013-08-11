SimpleBlog::Application.routes.draw do
  devise_for :users

  root :to => "blog#index"
  match ':controller(/:action(/:id))(.:format)'
end
