module LilHelpers
  def page_title
    page_title = "Crafty Blues: "
    if current_resource.data.title
      page_title << current_resource.data.title
    else
      page_title << "handmade music"
    end
    page_title
  end

  def title
    if current_resource.data.title
      title = current_resource.data.title
    else
      title = "Missing a title!"
    end
    title
  end

  # Calculate the years for a copyright
  def copyright_years(start_year)
    end_year = Date.today.year
    if start_year == end_year
      "\#{start_year}"
    else
      "\#{start_year}&#8211;\#{end_year}"
    end
  end

  def active?(part)
     "active" if (current_resource.data.selected == part) or Regexp.new(part).match(request.path)
  end

  def aside?
    if current_resource.data.aside
      partial "layouts/partials/#{current_resource.data.aside}"
    end
  end
  def asideClass?
    if current_resource.data.aside
      asideClass = " hasAside"
    else
      asideClass = " noAside"
    end
    asideClass
  end
end
