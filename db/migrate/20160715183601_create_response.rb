class CreateResponse < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :popsicle_id
      t.string :response_text
      t.integer :rating
    end
  end
end
