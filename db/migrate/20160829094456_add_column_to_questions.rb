class AddColumnToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :question_type, :string, null: false
  end
end
