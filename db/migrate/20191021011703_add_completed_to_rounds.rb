class AddCompletedToRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :completed, :boolean
  end
end
