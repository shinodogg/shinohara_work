class AddColumnUsesQuizzes < ActiveRecord::Migration
  def self.up
    add_column :users_quizzes, :answer, :string, :limit => 1
  end

  def self.down
  end
end
