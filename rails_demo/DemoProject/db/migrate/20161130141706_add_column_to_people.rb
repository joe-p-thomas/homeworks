class AddColumnToPeople < ActiveRecord::Migration
  def change
    add_column :people, :species, :string
  end
end
