Rails.application.routes.draw do
  mount MockAPI::Root => '/'
end
