class Work < ApplicationRecord
  belongs_to :user

  has_one_attached :work_image

  validates :title, presence: true, if: :state_art?
  validates :work_image, presence: true, if: :state_art?
  validates :body, presence: true

  def state_art?
    state == 'art'
  end

end
