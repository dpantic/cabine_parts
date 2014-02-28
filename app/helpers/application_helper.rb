module ApplicationHelper
  

  def sortable(column, title = nil)
  	title ||= column.titleize
  	css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
    link_to "#{title} <i class='#{direction == "desc" ? "icon-arrow-down" : "icon-arrow-up"}'></i>".html_safe, {:sort => column, :direction => direction}, {:class => css_class}
  end


  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Cabin-Parts App"
    if page_title.empty?
      base_title
     else
      "#{base_title} | #{page_title}"
    end
  end
end
