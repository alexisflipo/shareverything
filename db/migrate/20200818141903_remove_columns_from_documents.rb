class RemoveColumnsFromDocuments < ActiveRecord::Migration[6.0]
  def change
    remove_column :documents, :filename, :string
    remove_column :documents, :content_type, :string
    remove_column :documents, :file_contents, :binary
  end
end
