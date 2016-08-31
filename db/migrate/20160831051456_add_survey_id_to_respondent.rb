class AddSurveyIdToRespondent < ActiveRecord::Migration[5.0]
  def change
    add_column :respondents, :survey_id, :integer, null: false
    add_index :respondents, :survey_id
  end
end
