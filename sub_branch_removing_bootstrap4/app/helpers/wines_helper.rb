module WinesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_wines_path
    elsif action_name == 'edit'
      wine_path
    end
  end  
end
