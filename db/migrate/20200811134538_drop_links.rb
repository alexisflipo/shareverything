class DropLinks < ActiveRecord::Migration[6.0]
  def change
    drop_table :links
  end
end
