class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :score
      t.references :user

      t.timestamps
    end
    add_index :scores, :user_id
  end
end
