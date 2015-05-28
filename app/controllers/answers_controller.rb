class AnswersController < ApplicationController

  def create
    @user = User.find_by(id: session[:user_id])
    if @user
      @question = Question.find(params[:question_id])
      @answer = @question.answers.new(answer_params)
      @answer.user_id = @user.id
      @answer.save
      if request.xhr?
        puts "HEYYyYYyYYyyyyyyy"
        render @answer, layout: false
      else
        redirect_to session[:current_url]
      end
    else
      redirect_to '/login'
    end
  end

  def edit
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
      @question = Question.find(params[:question_id])
      @answer = Answer.find(params[:id])
    else
      redirect_to "/login"
    end
  end

  def update
    @user = User.find_by(id: session[:user_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    redirect_to question_path(@question)
  end

  def destroy
      @user = User.find_by(id: session[:user_id])
      @question = Question.find(params[:question_id])
      @answer = Answer.find(params[:id])
      @answer.destroy
      redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
