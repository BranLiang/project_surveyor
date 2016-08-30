class CreateSurveyQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_questions do |t|
      t.integer :survey_id, null: false
      t.integer :question_id, null: false

      t.timestamps
    end
    add_index :survey_questions, [:survey_id, :question_id]
  end
end
