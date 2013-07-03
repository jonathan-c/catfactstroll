class AddMessagesReceivedToVictims < ActiveRecord::Migration
  def change
    add_column :victims, :messages_received, :integer
  end
end
