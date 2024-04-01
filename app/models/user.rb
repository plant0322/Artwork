class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :works, dependent: :destroy
  has_many :work_favorites, dependent: :destroy
  has_many :work_comments, dependent: :destroy

  has_many :reletionships, class_name: "Reletionship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_reletionships, class_name: "Reletionship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_reletionships, source: :follower
  has_many :followings, through: :reletionships, source: :followed

  def follow(user)
    reletionships.create(followed_id: user.id)
  end

  def unfollow(user)
    reletionships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  has_one_attached :profile_image

  validates :name_id, uniqueness: true

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
