class CreateSenders < ActiveRecord::Migration[6.0]
  def change
    create_table :senders do |t|
      t.string :email
      t.string :recipient
      t.text :message
      t.string :url
      t.integer :days
      t.string :username

      t.timestamps
    end
  end
end
