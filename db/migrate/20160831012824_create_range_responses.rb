class CreateRangeResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :range_responses do |t|
      t.integer :num_range_id,  null: false
      t.integer :respondent_id, null: false
      t.integer :anwser

      t.timestamps
    end
    add_index :range_responses, [:num_range_id, :respondent_id]
  end
end
