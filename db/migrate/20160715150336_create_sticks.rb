class CreateSticks < ActiveRecord::Migration
  def change
    create_table :sticks do |t|
      t.string :wood_type
      t.string :color
      t.integer :centimeters
    end
  end
end
