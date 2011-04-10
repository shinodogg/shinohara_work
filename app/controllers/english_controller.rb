class EnglishController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_mail

  def get_mail
    @login = current_user[:email]
  end

  def study
    @quiz = Quiz.order("RANDOM()").first
    @quiz.answer = nil
  end

  def answer
    # TODO セッションのクイズIDとhiddenのクイズIDを比べる
    # TODO answerに正しい値が入ってるかどうかバリデーションする
    @user_quiz = UserQuiz.new(params[:user_quiz])
    @user_quiz.user_id = current_user.id
    @quiz = Quiz.find(@user_quiz.quiz_id)
    if @user_quiz.answer == @quiz.answer
      @user_quiz.result = true
    else
      @user_quiz.result = false
    end
    @user_quiz.save
    @contentArray = getAnswerContentArray(@quiz.question)
  end

  def user_result
    @user_quizzes = UserQuiz.where(:user_id = current_user[:id])
  end

  def quiz_result
    @quiz_users = UserQuiz.where(:quiz_id = current_user[:id])
  end



  def help
  end

  private

  def getAnswerContentArray(arg)
    require 'net/http'
    require 'rexml/document'
    Net::HTTP.version_1_2
    Net::HTTP.start('services.aonaware.com', 80) {|http|
      response = http.get("/DictService/DictService.asmx/DefineInDict?dictId=wn&word=" + arg)
      doc = REXML::Document.new response.body
      str = doc.elements['/WordDefinition/Definitions/Definition/WordDefinition'].get_text.to_s
      strArray = str.split("\n")
      returnStr = ""
      strArray.each { |element|
        returnStr = returnStr + element.strip + "\r\n"
     }
    }
  end
end
