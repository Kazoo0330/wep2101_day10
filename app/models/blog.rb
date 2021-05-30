class Blog < ApplicationRecord
  validates :content, presence: true, length: { minimum: 10 }
  validates :title, presence: true
end
