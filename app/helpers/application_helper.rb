module ApplicationHelper
  def page_title(title, sep=" | ")
    content_for :page_title, title.present? ? [title, sep].join('') : nil
  end

  def ensure_url(url)
    url = "http://#{url}" unless url[/\Ahttp:\/\//] || url[/\Ahttps:\/\//]
    url
  end

  def developers_string(hash)
    arrays = []
    hash.each do |key, value|
      if value.blank?
        arrays << key
      else
        arrays << link_to(key, ensure_url(value))
      end
    end
    arrays.join(', ').html_safe
  end
end
