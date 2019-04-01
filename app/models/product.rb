class Product < ApplicationRecord
  def self.search(search_term)
    Product.where("name LIKE ?", "%#{search_term}%")
  end
  has_many :comments
  def highest_rating_comment
    comments.rating_desc.first
  end
  def average_rating
    comments.average(:rating).to_f
  end
  def create
  @product = Product.find(params[:product_id])
  @comment = @product.comments.new(comment_params)
  @comment.user = current_user
  @comment.save
  redirect_to product_path(@product)
end
end
