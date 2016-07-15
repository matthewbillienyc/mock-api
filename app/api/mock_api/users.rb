module MockAPI
  class Users < Grape::API
    format :json

    resource :users do
      desc 'index'
        params do
          # parameters go here
        end
        get do

          User.all
        end

      desc 'show'
        params do

        end
        get ':id' do
          User.find(params[:id])
        end

      desc 'update'
        params do
          requires :first_name, type: String
          requires :last_name, type: String
        end
        put ":id" do
          user = User.find(params[:id])
          user.update(first_name: params[:first_name], last_name: params[:last_name])
          return { id: user.id, first_name: user.first_name, last_name: user.last_name }
        end

      desc 'create'
        params do
          requires :email, type: String
          requires :password, type: String
          requires :password_confirmation, type: String
          requires :first_name, type: String
          requires :last_name, type: String
        end
        post do
          User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
        end

      desc 'logon'
        params do
          requires :email, type: String
          requires :password, type: String
        end
        post 'logon' do
          user = User.find_by(email: params[:email])
          byebug
          if user && user.authenticate(params[:password])
            { status: 'success', role: user.role }
          else
            { status: 'failure' }
          end
        end
    end
  end
end
