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
      get ':serial_number' do
        # error!('Unauthorized', 401) unless headers.key_ignore_case_sensitive?('Logon-Id')
        popsicle = Popsicle.where('popsicles.serial_number = ?', params[:serial_number])[0]
        popsicle.details
      end

      desc 'popsicle rating'
      params do
        requires(:rating, type: String)
        requires(:response_text, type: String)
        requires(:serial_number, type: String)
      end
      post 'rate' do
        popsicle = Popsicle.where('popsicles.serial_number = ?', params[:serial_number])[0]
        popsicle.response.update(rating: params[:rating], response_text: params[:response_text])
        popsicle.update(status: "R")
        { response: popsicle.response, status: popsicle.status }
      end
    end
  end
end
