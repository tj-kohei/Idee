module IdeasHelper
  def add_glyphicon_to_category(idea)
    if idea.category == "web"
      '<span class="glyphicon glyphicon-globe">' + idea.category_i18n + '</span>'
    elsif idea.category == "mobile"
      '<span class="glyphicon glyphicon-phone">' + idea.category_i18n + '</span>'
    elsif idea.category == "desk_top"
      '<span class="glyphicon glyphicon-home">' + idea.category_i18n + '</span>'
    end
  end
end
