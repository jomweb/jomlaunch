class User < ActiveRecord::Base
  include ActiveModel::Transitions
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true

	state_machine do
    state :active
    state :suspended
  end
end
