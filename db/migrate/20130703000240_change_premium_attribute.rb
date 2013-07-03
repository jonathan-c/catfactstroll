class ChangePremiumAttribute < ActiveRecord::Migration
  def up
    rename_column :victims, :premium?, :premium_subscription
  end

  def down
    rename_column :victims, :premium_subscription, :premium?
  end
end
