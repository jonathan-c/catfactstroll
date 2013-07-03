class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.string :number
      t.boolean :premium?

      t.timestamps
    end
  end
end
