class ChangeNumberToPhone < ActiveRecord::Migration
  def up
    change_column :victims, :number, :phone
  end

  def down
  end
end
