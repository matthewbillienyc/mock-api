class CreatePopsicles < ActiveRecord::Migration
  def change
    create_table :popsicles do |t|
      t.string :flavor
      t.string :color
      t.string :rating
      t.string :shape
      t.string :serial_number
    end
  end
end
