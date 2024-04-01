class Thank < ApplicationRecord
  belongs_to :user
  belongs_to :work_comment

  validates :user, uniqueness: {scope: :work_comment}
end
