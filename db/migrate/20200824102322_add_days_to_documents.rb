class AddDaysToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :days, :integer
  end
end
