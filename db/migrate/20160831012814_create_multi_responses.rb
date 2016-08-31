class CreateMultiResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :multi_responses do |t|
      t.integer :respondent_id, null: false, index: true
      t.integer :question_id, null: false,   index: true
      t.integer :response_option_id, null: false, index: true

      t.timestamps
    end
  end
end
