class CreateMatchups < ActiveRecord::Migration[5.2]
  def change
    create_table :matchups do |t|
      t.integer :bracket_id
      t.integer :number
      t.integer :competitor_id_1
      t.integer :competitor_id_2
      t.boolean :completed

      t.timestamps
    end
  end
end
