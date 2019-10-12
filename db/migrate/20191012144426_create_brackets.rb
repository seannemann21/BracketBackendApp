class CreateBrackets < ActiveRecord::Migration[5.2]
  def change
    create_table :brackets do |t|
      t.integer :creator_id

      t.timestamps
    end
  end
end
