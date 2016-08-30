module QuestionsHelper
  def store_referer
    session[:referer] = request.referer
  end

  def referer
    session.delete(:referer)
  end

  def survey_includes
    Survey.includes({:questions => :response_options}, :num_ranges)
  end

  def redirect_path_for_update question
    if question.has_no_options?
      redirect_to new_response_option_path(:question_id => question.id)
    else
      redirect_to choices_path(:survey_id => question.survey_id)
    end
  end
end
