class ResponseOptionsController < ApplicationController
  def new
    questions = Question.includes(:survey)
    @question = questions.find_by_id(params[:question_id])
    @question.response_options.build
    @survey = @question.survey
  end
end
