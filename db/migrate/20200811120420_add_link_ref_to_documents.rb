class AddLinkRefToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_reference :documents, :link, null: false, foreign_key: true
  end
end
