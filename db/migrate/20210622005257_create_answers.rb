class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text answer
      t.boolean right_answer
      t.integer question_id

      t.timestamps
    end
  end
end
