module ApplicationHelper

  def auth_token
    "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'/>".html_safe
  end

  def input_hidden(type)
    if type == :update
      "<input type='hidden' name='_method' value='patch'>".html_safe
    elsif type == :destroy
      "<input type='hidden' name='_method' value='delete'>".html_safe
    end
  end
end
