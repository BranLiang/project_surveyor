class MultiplesController < ApplicationController
  def new
    @question_params = params[:question]
    @response_num = params[:response_num]
    @question = Question.new
    @survey = Survey.find(params[:survey_id])
    @question.response_options.build
  end
end
