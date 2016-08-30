class QuestionsController < ApplicationController
  def new
    @survey = Survey.includes(:questions => :response_options).find(params[:survey_id])
    @question = Question.new
  end

  def create
    @survey = Survey.find_by_id(params[:question][:survey_id])
    @question = Question.new(white_list_params)
    if @survey && @question.save
      flash[:success] = ["Multi select Question ID: #{@question.id} is created"]
      redirect_to new_response_option_path(:question_id => @question.id)
    else
      flash.now[:danger] = @question.errors.full_messages
      render :new
    end
  end

  def update
    @question = Question.find_by_id(params[:id])
    if @question && @question.update(white_list_params)
      flash[:success] = ["Options for question ID: #{@question.id} has been created"]
      redirect_to choices_path(:survey_id => @question.survey_id)
    else
      flash[:danger] = @question.errors.full_messages
      redirect_to new_response_option_path(:question_id => @question.id)
    end
  end

  def destroy
    store_referer
    question = Question.find_by_id(params[:id])
    if question && question.destroy
      flash[:success] = ["question ID: #{question.id} has been deleted"]
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

    def store_referer
      session[:referer] = request.referer
    end

    def referer
      session.delete(:referer)
    end


end
