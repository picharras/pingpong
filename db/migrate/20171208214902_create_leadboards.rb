class CreateLeadboards < ActiveRecord::Migration
  def change
    create_table :leadboards do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :score, default: 0
      t.integer :games, default: 0

      t.timestamps null: false
    end
  end
end
