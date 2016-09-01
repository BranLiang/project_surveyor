class ResultsController < ApplicationController
  def show
    @survey = survey_includes.find_by_id(params[:id])
  end

  private
    def survey_includes
      Survey.includes(:questions => :response_options,
                      :respondents => [:multi_responses, :range_responses]
                      )
    end
end
