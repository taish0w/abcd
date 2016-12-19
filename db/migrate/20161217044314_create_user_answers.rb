class CreateUserAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_answers do |t|
      t.integer :question_no
      t.integer :ans_num
      t.string :user
      t.string :ans_sec
      t.timestamp :ans_time

      t.timestamps
    end
  end
end
