# put the /:user_id route here, have it return the same hash for errbody, use the data_helper.rb file for dummy data
module MockAPI
  class Accounts < Grape::API
    format :json

    resource :accounts do
      desc 'show'
        params do
        end

        get ":id" do
          @account= DataHelper.get_account_info_by_user(params[:id])
        end

    end
  end
end
