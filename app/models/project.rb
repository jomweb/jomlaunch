class Project < ActiveRecord::Base
  include ActiveModel::Transitions

  mount_uploader :logo, LogoUploader

  CATEGORIES = {
    'open-source' => 'Sumber Terbuka',
    'community'   => 'Komuniti',
    'personal'    => 'Peribadi',
    'commercial'  => 'Komersil'
  }

  validates :name, :description,
            :developer_name,
            :submitter_name, :submitter_email, :submitter_phone,
            :category, :state, presence: true
  validates :category, inclusion: {in: CATEGORIES.keys }
  validates :submitter_email, format: {with: Devise.email_regexp}

  state_machine do
    state :submitted
    state :selected
  end

  def developer_names
    developer_name.split(',').map(&:strip)
  end

  def developer_urls
    developer_url.split(',').map(&:strip)
  end

  def developers
    hash = Hash.new
    developer_names.each_with_index do |name, index|
      hash[name] = developer_urls[index].blank? ? '' : developer_urls[index]
    end
    hash
  end
end
