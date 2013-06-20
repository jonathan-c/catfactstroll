class RemoveToAndFromAttributes < ActiveRecord::Migration
  def up
    remove_column :catfacts, :to
    remove_column :catfacts, :from
  end

  def down
  end
end
