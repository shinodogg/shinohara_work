class CreateUsersQuizzes < ActiveRecord::Migration
  def self.up
    create_table "users_quizzes", :force => true do |t|
      t.column :user_id,                   :integer
      t.column :quiz_id,                   :integer
      t.column :result,                    :boolean
     end
  end

  def self.down
    drop_table "users_quizzes"
  end
end
