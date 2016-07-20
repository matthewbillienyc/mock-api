class AddStatusToPopsicles < ActiveRecord::Migration
  def change
    add_column :popsicles, :status, :string, default: "U"
  end
end
