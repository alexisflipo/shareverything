class DropSendersTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :senders
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
