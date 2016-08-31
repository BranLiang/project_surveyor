class CreateMultiResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :multi_responses do |t|

      t.timestamps
    end
  end
end
