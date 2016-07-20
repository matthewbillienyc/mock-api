module MockAPI
  class Notes < Grape::API
    format :json

    resource :notes do
      
      desc 'create note'
      params do
        requires :popsicle_serial_number, type: String
        requires :importance, type: String
        requires :text, type: String
      end
      post do
        note = Note.new(popsicle_serial_number: params[:popsicle_serial_number], importance: params[:importance], text: params[:text])
        if note.save
          { status: 'success' }
        else
          { status: 'failure' }
        end
      end

      desc 'get notes for popsicle'
      get ':popsicle_serial_number' do
        notes = Note.where("notes.popsicle_serial_number = ?", params[:popsicle_serial_number])
        notes.map do |note|
          {
             text: note.text,
            importance: note.importance
          }
        end
      end
    end
  end
end