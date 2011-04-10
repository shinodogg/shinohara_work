class AddCreatedAtAndUpdatedAtToUsersQuizzes < ActiveRecord::Migration
  def self.up
    add_timestamps(:users_quizzes)
  end

  def self.down
  end
end
