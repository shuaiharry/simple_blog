SimpleBlog::Application.routes.draw do
  root :to => "blog#index"
  match ':controller(/:action(/:id))(.:format)'
end
