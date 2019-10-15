class CreateMatchups < ActiveRecord::Migration[5.2]
  def change
    create_table :matchups do |t|
      t.integer :round_id
      t.integer :number
      t.boolean :completed

      t.timestamps
    end
  end
end
