class CreateNumRanges < ActiveRecord::Migration[5.0]
  def change
    create_table :num_ranges do |t|
      t.text     :text, null: false
      t.integer  :minimum, null: false
      t.integer  :maximum, null: false
      t.boolean  :required, null: false
      t.integer  :survey_id, null: false

      t.timestamps
    end
    add_index :num_ranges, :survey_id
  end
end
