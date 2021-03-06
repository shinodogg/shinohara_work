class UserQuiz < ActiveRecord::Base
  set_table_name "users_quizzes"
  # TODO より詳細なバリデーション
  validates_presence_of :user_id, :quiz_id, :answer
  cattr_reader :per_page
  @@per_page =10 

  scope :quiz, lambda {|quiz_id| where 'quiz_id = ?', quiz_id}
  scope :true, where('result =?', true)
  scope :false, where('result =?', false)
end
