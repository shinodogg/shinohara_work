class EnglishController < ApplicationController
  before_filter :authenticate_user!, :except => [:help]
  before_filter :get_mail, :except => [:help]

  def get_mail
    @login = current_user[:email]
  end

  def study
    @quiz = Quiz.order("RANDOM()").first
    @quiz.answer = nil
    @user_quiz = UserQuiz.new
  end

  def retry
    @quiz = Quiz.find(params[:quiz_id])
    @quiz.answer = nil
    @user_quiz = UserQuiz.new
    render :action => "study"
  end

  def answer
    @user_quiz = UserQuiz.new(params[:user_quiz])
    @user_quiz.user_id = current_user.id
    @quiz = Quiz.find(@user_quiz.quiz_id)
    if @user_quiz.answer == @quiz.answer
      @user_quiz.result = true
    else
      @user_quiz.result = false
    end
    @user_quiz.word = @quiz.question
    unless @user_quiz.save
      render :action => "study"
    end
    # @contentArray = getAnswerContentArray(@quiz.question)
  end

  def user_result
    @user_quizzes = UserQuiz.paginate :conditions => ['user_id = ?', current_user.id], :page => params[:page], :order => 'created_at DESC'
  end

  def quiz_result
    @quiz = Quiz.find(params[:quiz_id])
    @true_count = UserQuiz.quiz(params[:quiz_id]).true.size
    @false_count = UserQuiz.quiz(params[:quiz_id]).false.size
    @total_count = @true_count + @false_count
  end

  def total_result
    @true_count = UserQuiz.true.size
    @false_count = UserQuiz.false.size
    @total_count = @true_count + @false_count
  end

  def help
  end

  def wordnet
    @wordnet = getAnswerContentArray(params[:question])
    respond_to do |format|
        format.js
    end
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
      str.gsub!(/\n/, '<br>')
    }
  end
end
