class CreateCompetitors < ActiveRecord::Migration[5.2]
  def change
    create_table :competitors do |t|
      t.string :name

      t.timestamps
    end
  end
end
