module MockAPI
  class Root < Grape::API
    prefix 'mockapi'
    mount MockAPI::Users
    mount MockAPI::Cases
  end
end
