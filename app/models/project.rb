class Project < ActiveRecord::Base
  CATEGORIES = [
    'open-source',
    'community',
    'personal',
    'commercial'
  ]

  validates :name, :description,
            :developer_name,
            :submitter_name, :submitter_email, :submitter_phone,
            :category, :state, presence: true
end
