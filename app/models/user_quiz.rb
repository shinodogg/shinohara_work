class UserQuiz < ActiveRecord::Base
  set_table_name "users_quizzes"
  validates_presence_of :user_id, :quiz_id, :answer
  cattr_reader :per_page
  @@per_page =10 
end
