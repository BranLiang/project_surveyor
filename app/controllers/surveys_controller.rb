class SurveysController < ApplicationController
  def index
    @surveys = Survey.all.order(:id).reverse_order
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(whilt_list_params)
    if @survey.save
      flash[:success] = ["Survey: \"#{@survey.title}\" has been successfully saved"]
      redirect_to choices_path(:survey_id => @survey.id)
    else
      flash[:danger] = @survey.errors.full_messages
      render :new
    end
  end

  def destroy
    survey = Survey.find_by_id(params[:id])
    if survey && survey.destroy
      flash[:success] = ["Survey has been deleted"]
      redirect_to root_path
    else
      flash[:danger] = survey.errors.full_messages
      redirect_to root_path
    end
  end

  private
    def whilt_list_params
      params.require(:survey).permit(:title, :description)
    end
end
