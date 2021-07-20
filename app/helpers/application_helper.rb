module ApplicationHelper
  def nl2br(str)
    return sanitize(str).gsub("\n", '<br>').html_safe
  end
end
