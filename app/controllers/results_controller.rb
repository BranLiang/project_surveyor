class ResultsController < ApplicationController
  def show
    @survey = Survey.find_by_id(params[:id])
  end
end
