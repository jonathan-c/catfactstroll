class SetVictimAttributeToDefaultToFalse < ActiveRecord::Migration
  def up
    remove_column :victims, :premium_subscription
    add_column :victims, :premium_subscription, :boolean, default: false
  end

  def down
  end
end
