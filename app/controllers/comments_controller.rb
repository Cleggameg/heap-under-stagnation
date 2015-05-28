class CommentsController < ApplicationController
  # def new
  #   @question = Question.find(params[:id])
  #   @question.comments.new
  # end

  def create
    if session[:user_id]
      @user ||= User.find_by(id: session[:user_id])
      @question = Question.find(params[:question_id])
      @comment = @question.comments.new(comment_params)
      @comment.save
      if request.xhr?
        render @comment, layout: false
      else
        redirect_to session[:current_url]
      end
    else
      redirect_to "/login"
    end
  end

  def answer_create
    if session[:user_id]
      @user ||= User.find_by(id: session[:user_id])
      @question = Question.find(params[:question_id])
      @answer = Answer.find(params[:answer_id])
      @comment = @answer.comments.new(comment_params)
      @comment.save
      if request.xhr?
        puts "^^^^^^^^^^^^^^^^^"
        puts "hello"
        render @comment, layout: false
      else
      puts "******************"
      puts session[:current_url]
      redirect_to session[:current_url]
      end
    else
      redirect_to "/login"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

end
