class CreateCompetitorMatchups < ActiveRecord::Migration[5.2]
  def change
    create_table :competitor_matchups do |t|
      t.integer :competitor_id
      t.integer :matchup_id

      t.timestamps
    end
  end
end
