class RedoingEveryMigration < ActiveRecord::Migration
  def up

    create_table :victims do |t|
      t.string :phone

      t.timestamps
    end

    add_column :victims, :premium_subscription, :boolean, default: false
  end

  def down
  end
end
