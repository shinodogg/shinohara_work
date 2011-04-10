class AddWordToUsersQuizzes < ActiveRecord::Migration
  def self.up
    add_column :users_quizzes, :word, :string
  end

  def self.down
  end
end
