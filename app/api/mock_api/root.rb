module MockAPI
  class Root < Grape::API
    prefix 'mockapi'
    mount MockAPI::Users
    mount MockAPI::Cases
    mount MockAPI::Accounts
    mount MockAPI::Popsicles
  end
end
