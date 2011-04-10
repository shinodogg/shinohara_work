class UserQuiz < ActiveRecord::Base
  set_table_name "users_quizzes"
#  has_many User
#  has_many Quiz
  validates_presence_of :user_id, :quiz_id, :answer
end
