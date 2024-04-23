module ApplicationHelper
  include Pagy::Frontend

  def fa_solid(icon:)
    tag.i(class: "fa-solid fa-#{icon}")
  end
end
