class ChoicesController < ApplicationController
  def index
    @survey = Survey.find(params[:survey_id])
  end

  def choose
    survey_id = params[:survey_id]
    choice = params[:question_type]
    case choice
    when "multi"
      redirect_to new_question_path(:survey_id => survey_id)
    when "num_range"
      flash[:danger] = ["Not functioning now!"]
      redirect_to root_path
    else
      flash[:dander] = ["Invalid question type!"]
      redirect_to root_path
    end
  end

  
end
