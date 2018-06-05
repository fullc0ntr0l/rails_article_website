# app/models/article.rb
class Article < ActiveRecord::Base
  attr_accessible :content, :name, :title

  validates :name, presence: true
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 255 }
  validates :content, presence: true,
                      length: { minimum: 10 }

  has_many :comments, dependent: :destroy
end
