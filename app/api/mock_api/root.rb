module MockAPI
  class Root < Grape::API
    prefix 'mockapi'
    mount MockAPI::Users
  end
end
