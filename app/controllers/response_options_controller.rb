class ResponseOptionsController < ApplicationController
  def new
    questions = Question.includes(:response_options)
    @question = questions.find_by_id(params[:question_id])
    @question.response_options.build
    survey = Survey.includes(:questions => :response_options)
    @survey = survey.find_by_id(@question.survey_id)
  end

end
