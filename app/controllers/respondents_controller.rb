class RespondentsController < ApplicationController
  def new
    @survey = Survey.includes(:questions => :response_options).find_by_id(params[:survey_id])
    @respondent = Respondent.new
    @respondent.multi_responses.build
    @respondent.range_responses.build
  end

  def create
    @survey = Survey.includes(:questions => :response_options).find_by_id(params[:respondent][:survey_id])
    @respondent = Respondent.new(white_list_params)
    if @respondent.save
      flash[:success] = ["Thanks for your participation! Cheers!"]
      redirect_to root_path
    else
      flash.now[:danger] = @respondent.errors.full_messages
      render :new
    end
  end

  private
    def white_list_params
      params.require(:respondent).permit(:name,
                                        :survey_id,
                                        {
                                         :multi_responses_attributes => [
                                           :question_id,
                                           :response_option_ids,
                                           :response_option_ids => []
                                         ]
                                         })
    end
end
