module ApplicationHelper
  def page_title(title, sep=" | ")
    content_for :page_title, title.present? ? [title, sep].join('') : nil
  end
end
