class RemoveMessagesReceivedColumnFromVictims < ActiveRecord::Migration
  def up
    remove_column :victims, :messages_received
  end

  def down
  end
end
