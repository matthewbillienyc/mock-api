module MockAPI
  class Popsicles < Grape::API
    format :json

    resource :popsicles do
      desc 'summaries'
      get do
        # error!('Unauthorized', 401) unless headers.key_ignore_case_sensitive?('Logon-Id')
        Popsicle.get_all_summaries
      end

      desc 'popsicle details'
      get ':serialNumber' do
        # error!('Unauthorized', 401) unless headers.key_ignore_case_sensitive?('Logon-Id')
        Popsicle.find_by(serial_number: params[:serialNumber]).details
      end
    end
  end
end