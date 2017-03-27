class Restaurant
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find do |restaurant|
      restaurant.name.downcase == name.downcase
    end
  end

  def reviews
    Review.all.select do |review|
      review.restaurant == self
    end
  end

  def customers
    Review.all.map do |review|
      if review.restaurant == self
        review.customer
      end
    end
  end

end
