class CreateMultiResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :multi_responses do |t|
      t.integer :respondent_id, null: false
      t.integer :question_id, null: false
      t.string  :answer, null: false

      t.timestamps
    end
    add_index :multi_responses, [:respondent_id, :question_id]
  end
end
