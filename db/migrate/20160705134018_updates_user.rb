class UpdatesUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :name
      t.column :address_id, :integer
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :birth_year, :datetime
    end
  end
end
