womodule MockAPI
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
          @user = User.find(params[:id])
          @user.update(first_name: params[:first_name], last_name: params[:last_name])
        end

      desc 'create'
        params do
          requires :first_name, type: String
          requires :last_name, type: String
        end
        post do
          User.create(first_name: params[:first_name], last_name: params[:last_name])
        end
    end
  end
end
