class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.text :fear
      t.text :details
      t.datetime :deadline
      t.boolean :isAchieved
      t.integer :num_supporters
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
