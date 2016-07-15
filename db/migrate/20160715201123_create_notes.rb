class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :popsicle_serial_number
      t.string :text
      t.string :importance
    end
  end
end
