module MockAPI
  class Addresses < Grape::API
    format :json

    resource :addresses do
      desc 'index'
        params do
          # parameters go here
        end
        get do
          Address.all
        end

      desc 'show'
        params do

        end
        get ':id' do
          Address.find(params[:id])
        end


      desc 'update'
        params do
          requires :address_line_1, type: String
          requires :address_line_2, type: String
          requires :city, type: String
          requires :state, type: String
          requires :zip_code, type: Integer
        end
        put ":id" do
          @ad = Address.find(params[:id])
          @ad.update(address_line_1: params[:address_line_1], address_line_2: params[:address_line_2], city: params[:city], state: params[:state], zip_code: params[:zip_code])
        end

      desc 'create'
        params do
          requires :description, type: String
          requires :user_id, type: Integer
        end
        post do
          Address.create(address_line_1: params[:address_line_1], address_line_2: params[:address_line_2], city: params[:city], state: params[:state], zip_code: params[:zip_code])
        end
    end
  end
end
