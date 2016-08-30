class ChoicesController < ApplicationController
  def index
    @survey = Survey.includes(:questions).find(params[:survey_id])
  end

  def choose
    survey_id = params[:survey_id]
    choice = params[:question_type]
    case choice
    when "multi"
      redirect_to new_question_path(:survey_id => survey_id)
    when "num_range"
      redirect_to new_num_range_path(:survey_id => survey_id)
    else
      flash[:dander] = ["Invalid question type!"]
      redirect_to root_path
    end
  end


end
