
# jr@oblique:  10/9/14


module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Gmaps"
    #base_title = ""
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  
end






