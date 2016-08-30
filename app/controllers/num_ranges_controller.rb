class NumRangesController < ApplicationController
  def new
    @survey = Survey.find(params[:survey_id])
    @num_range = NumRange.new
  end

  def create
    @survey = Survey.find_by_id(params[:num_range][:survey_id])
    @num_range = NumRange.new(white_list_params)
    if @num_range.save
      flash[:success] = ["Number Range Question ID: #{@num_range.id} has been created"]
      redirect_to choices_path(:survey_id => @survey.id)
    else
      flash.now[:danger] = @num_range.errors.full_messages
      render :new
    end
  end

  def destroy
    store_referer
    question = NumRange.find_by_id(params[:id])
    if question && question.destroy
      flash[:success] = ["Number range question ID: #{question.id} has been deleted"]
      redirect_to referer
    else
      flash[:danger] = question.errors.full_messages
      redirect_to referer
    end
  end

  private
    def white_list_params
      params.require(:num_range).permit(:survey_id,
                                        :text,
                                        :minimum,
                                        :maximum,
                                        :required)
    end

    def store_referer
      session[:referer] = request.referer
    end

    def referer
      session.delete(:referer)
    end
end
