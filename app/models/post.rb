class Post < ApplicationRecord
  validates :title, :body, :user_id, presence: true
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  scope :recent, -> { order(created_at: :desc) }
  scope :latest, -> (number) { recent.limit(number) }
  scope :published, -> { where.not(published_at: nil) }
  scope :drafts, -> { where(published_at: nil) }
  scope :featured, -> { where(featured: true) }
end
