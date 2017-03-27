class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find do |customer|
      name.downcase == customer.full_name.downcase
    end
  end

  def self.find_all_by_first_name(name)
    @@all.select do |customer|
      name.downcase == customer.first_name.downcase
    end
  end

  def self.all_names
    @@all.map do |customer|
      customer.full_name
    end
  end

  def add_review(restaurant, content)
    Review.new(self, restaurant, content)
  end
end

# john = Customer.new("john", "smith")
# johnny = Customer.new("john", "smith")
# Jane = Customer.new("Jane", "Smith")
#
# candy = Restaurant.new("candy shop")
# gum = Restaurant.new("gum shop")
