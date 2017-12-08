class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :match_date
      t.references :user, index: true, foreign_key: true
      t.integer :opponent_id
      t.integer :user_score
      t.integer :opponent_score

      t.timestamps null: false
    end
  end
end
