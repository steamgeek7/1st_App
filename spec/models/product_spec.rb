require 'rails_helper'
  describe Product do
    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "something@yeah.com", password: "yurp34") }

    it "returns the average rating of all comments" do
        expect(@average.rating).to eq "3"
    expect(Product.new(description: "Nice bike")).not_to be_valid
    end



    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end
  end
