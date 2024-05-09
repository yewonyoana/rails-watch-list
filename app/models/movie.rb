class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  validate :has_no_bookmarks

  private

  def has_no_bookmarks
    if bookmarks.any?
      errors.add(:base, "Cannot destory a movie as it has associated bookmarks")
      throw(:abort)
    end
  end
end
