class AddVictimIdToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :victim_id, :integer
  end
end
