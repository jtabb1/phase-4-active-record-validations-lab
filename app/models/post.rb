class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :title_must_be_clickbait

  def title_must_be_clickbait
    unless title && title.match?(/Top \d+|Won't Believe|Secret|Guess/)
      errors.add(:title, "Title does not adhere to the clickbait standard set.")
    end
  end

end
