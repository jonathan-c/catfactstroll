class CreateCatfacts < ActiveRecord::Migration
  def change
    create_table :catfacts do |t|
      t.string :to
      t.string :message
      t.string :from

      t.timestamps
    end
  end
end
