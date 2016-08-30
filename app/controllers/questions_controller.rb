class QuestionsController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @question = Question.new
  end



end
