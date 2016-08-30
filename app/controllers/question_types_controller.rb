class QuestionTypesController < ApplicationController
  def new
    type = params[:question][:question_type]
    if type == "multi"
      redirect_to new_survey_multiple_choice_path(params[:survey_id])
    else
      flash[:danger] = ["Something wrong"]
      redirect_to root_path
    end
  end
end
