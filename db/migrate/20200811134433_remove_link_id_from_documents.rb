class RemoveLinkIdFromDocuments < ActiveRecord::Migration[6.0]
  def change
    remove_column :documents, :link_id, :bigint
  end
end
