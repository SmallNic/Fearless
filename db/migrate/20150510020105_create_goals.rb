class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :details
      t.datetime :deadline
      t.boolean :isAchieved
      t.references :journey, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
