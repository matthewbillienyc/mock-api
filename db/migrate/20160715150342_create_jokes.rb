class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.string :question
      t.string :punchline
      t.integer :dirtiness
      t.integer :funniness
      t.string :author
    end
  end
end
