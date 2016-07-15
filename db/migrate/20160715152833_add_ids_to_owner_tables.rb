class AddIdsToOwnerTables < ActiveRecord::Migration
  def change
    add_column :popsicles, :company_id, :integer
    add_column :sticks, :popsicle_id, :integer
    add_column :jokes, :stick_id, :integer
  end
end
