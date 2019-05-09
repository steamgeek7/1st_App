class Product < ApplicationRecord
  validates :name, presence: true
    def self.search(search_term)
      Product.where("name LIKE ?", "%#{search_term}%")
    end
      has_many :comments
      def highest_rating_comment
        comments.rating_desc.first.rating
      end
      def average_rating
        comments.average(:rating).to_f
      end
end
