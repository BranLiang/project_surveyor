class RespondentsController < ApplicationController
  def new
    @survey = Survey.includes(:questions => :response_options).find_by_id(params[:survey_id])
    @respondent = Respondent.new
    @respondent.multi_responses.build
    @respondent.range_responses.build
  end
end
