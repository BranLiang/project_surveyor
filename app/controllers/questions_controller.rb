class QuestionsController < ApplicationController
  include QuestionsHelper

  def new
    @survey = survey_includes.find_by_id(params[:survey_id])
    @question = Question.new
  end

  def create
    @survey = survey_includes.find_by_id(params[:question][:survey_id])
    @question = Question.new(white_list_params)
    if @survey && @question.save
      flash[:success] = ["Multi select Question ID: #{@question.id} is created"]
      redirect_to new_response_option_path(:question_id => @question.id)
    else
      flash.now[:danger] = @question.errors.full_messages
      render :new
    end
  end

  def edit
    @question = Question.find_by_id(params[:id])
    @survey = Survey.includes(:questions, :num_ranges).find_by_id(@question.survey_id)
  end

  def update
    @question = Question.find_by_id(params[:id])
    if @question && @question.update(white_list_params)
      flash[:success] = ["Options for question ID: #{@question.id} has been updated."]
      redirect_path_for_update @question
    else
      flash[:danger] = @question.errors.full_messages
      redirect_to new_response_option_path(:question_id => @question.id)
    end
  end

  def destroy
    store_referer
    question = Question.find_by_id(params[:id])
    if question && question.destroy
      flash[:success] = ["Multiple selection question ID: #{question.id} has been deleted"]
      redirect_to referer
    else
      flash[:danger] = question.errors.full_messages
      redirect_to referer
    end
  end

  private
    def white_list_params
      params.require(:question).permit(:survey_id,
                                       :text,
                                       :options,
                                       :multi_select,
                                       :required,
                                       {
                                         :response_options_attributes => [
                                           :text
                                         ]
                                         })
    end




end
