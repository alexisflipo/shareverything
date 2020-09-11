class CreateDocuments2 < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :email
      t.string :recipient
      t.text :message
      t.string :url
      t.integer :days
      t.string :username
      t.references :sender, null: false, foreign_key: true
    end
  end
end
