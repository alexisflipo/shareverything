class RemoveDaysFromDocuments < ActiveRecord::Migration[6.0]
  def change
    remove_column :documents, :days, :integer
  end
end
