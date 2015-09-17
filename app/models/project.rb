class Project < ActiveRecord::Base
  include ActiveModel::Transitions

  mount_uploader :logo, LogoUploader

  CATEGORIES = {
    'open-source' => 'Sumber Terbuka',
    'community'   => 'Komuniti',
    'personal'    => 'Peribadi',
    'commercial'  => 'Komersial'
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
end
