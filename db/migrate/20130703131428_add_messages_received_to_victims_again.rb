class AddMessagesReceivedToVictimsAgain < ActiveRecord::Migration
  def change
    add_column :victims, :messages_received, :integer, default: 0
  end
end
