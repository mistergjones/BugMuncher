# helper method
# predicate method
def logged_in? # return a boolean
    # !!session[:user_id]
    if session[:eng_id] # -> convert to a boolean 
      true
    else
      false
    end
  end
  
  # potential going crash if you use it when you are not logged in
  def current_engineer
    find_one_engineer_by_id(session[:eng_id])
  end