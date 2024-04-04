class Work < ApplicationRecord
  belongs_to :user
  has_many :work_favorites, dependent: :destroy
  has_many :work_comments, dependent: :destroy
  has_many :view_counts, dependent: :destroy

  has_one_attached :work_image

  validates :title, presence: true, if: :state_art?
  validates :work_image, presence: true, if: :state_art?
  validates :body, presence: true
  validates :state, presence: true

  def state_art?
    state == 'art'
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Work.where(body: content)
    else
      Work.where('body LIKE?', '%' + content + '%')
    end
  end

  def get_work_image(width, height)
    if work_image.attached?
      work_image.variant(resize_to_fit: [width, height]).processed
    else
      ''
    end
  end

  def work_favorited_by?(user)
    work_favorites.exists?(user_id: user.id)
  end

end
