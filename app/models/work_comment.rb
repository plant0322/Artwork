class WorkComment < ApplicationRecord
  belongs_to :user
  belongs_to :work

  has_many :thanks, dependent: :destroy

  def thanks_by?(user)
    thanks.exists?(user_id: user.id)
  end
end
