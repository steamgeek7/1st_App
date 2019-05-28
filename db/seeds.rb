PLACEHOLDER_IMAGE = "https://via.placeholder.com/600x400"
COLORS = ["red", "green", "blue", "pink", "purple", "orange", "black", "white"]
LOREM = [
  "Lorem ipsum dolor amet shabby chic pitchfork gastropub vegan taxidermy VHS raclette small batch tacos meditation keytar vape fashion axe. Tofu authentic man braid deep v. Wolf iPhone chillwave twee. Hella DIY vexillologist tacos air plant, actually tbh subway tile street art viral raclette YOLO raw denim. Cornhole cloud bread 90's, franzen bitters schlitz neutra bushwick poke artisan. Affogato tbh green juice church-key pour-over.",
  "Chicharrones pickled you probably haven't heard of them put a bird on it lyft readymade. Fashion axe 3 wolf moon chicharrones butcher quinoa, man bun beard tacos YOLO post-ironic yuccie before they sold out master cleanse godard vegan. Celiac artisan fashion axe polaroid selvage meggings narwhal ramps typewriter lyft occupy poutine venmo. Lo-fi pour-over craft beer, asymmetrical raw denim hella helvetica crucifix taiyaki vegan paleo tumeric green juice drinking vinegar normcore. Synth asymmetrical bespoke literally. Meggings church-key gluten-free vice enamel pin, iceland farm-to-table. Pabst hoodie pinterest green juice kickstarter schlitz sartorial raw denim swag man braid.",
  "Succulents echo park trust fund farm-to-table etsy leggings 90's, art party shoreditch green juice hoodie fixie woke pork belly coloring book. Pork belly paleo snackwave, wayfarers tumeric vexillologist freegan gluten-free. Deep v crucifix post-ironic occupy try-hard 3 wolf moon tote bag normcore, gentrify pinterest. Subway tile yuccie direct trade austin readymade copper mug tbh taiyaki beard tacos cray raclette kinfolk. Shabby chic mumblecore umami brunch, drinking vinegar pop-up yuccie health goth vexillologist tote bag salvia banjo roof party kitsch. Chicharrones kale chips +1 echo park, forage 90's cornhole humblebrag.",
  "Farm-to-table hella enamel pin, seitan tote bag iPhone hammock mumblecore tilde. 90's flexitarian palo santo taiyaki asymmetrical tacos blue bottle craft beer whatever master cleanse coloring book. Tumblr locavore meh organic pabst YOLO portland lyft before they sold out. Beard umami single-origin coffee distillery thundercats raw denim whatever.",
  "Edison bulb 3 wolf moon venmo prism hot chicken thundercats sustainable. Selvage tofu raclette pour-over bushwick try-hard. Cray bespoke ennui lumbersexual. Tousled selvage bushwick meggings vinyl cornhole chia godard farm-to-table. Brooklyn bicycle rights succulents hoodie ramps activated charcoal. Meh ugh selfies, readymade vape mumblecore knausgaard before they sold out cray biodiesel hell of gastropub. Ethical swag copper mug selfies, hell of bicycle rights forage distillery authentic letterpress dreamcatcher truffaut selvage small batch ramps."
]

# How many comments should be generated on every seeded product?
COMMENT_COUNT = 20

# How many seeded product samples do you want?
PRODUCT_SEED_COUNT = 3

def generate_lorem
  LOREM.sample
end

def random_rating # random price between 10 ~ 100.
  [1,2,3,4,5].sample
end

def random_price # random price between 10 ~ 100.
  rand(1..10)*10
end

def random_color
  COLORS.sample
end


def generate_comments(num)
  comments = []
  num.times do
    comments.push({user: USER, rating: random_rating, body: generate_lorem})
  end
  comments
end

USER = User.create!(first_name: "user", last_name: "foo", email: "user@email.com", password: "password")

1.upto(PRODUCT_SEED_COUNT) do |i|
  product = Product.new(name:"seed-generated product ##{i}", description: generate_lorem, image_url: PLACEHOLDER_IMAGE, color: random_color, price: random_price)
  product.comments.build(generate_comments(COMMENT_COUNT))
  product.save!
end

Order.create(user_id: 1, product_id: 1, total: 1000.00)
Order.create(user_id: 1, product_id: 2, total: 5000.0)
