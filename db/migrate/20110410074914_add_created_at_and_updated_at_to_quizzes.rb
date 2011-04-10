class AddCreatedAtAndUpdatedAtToQuizzes < ActiveRecord::Migration
  def self.up
    add_timestamps(:quizzes)
  end

  def self.down
  end
end
