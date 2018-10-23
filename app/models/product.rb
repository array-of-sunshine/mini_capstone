class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def is_discounted?
    # return true if price is low
    # if price < 10
    #   return true
    # else
    #   return false
    # end
    # return false if price is high
    price < 10
  end

  def tax
    tax_rate = 0.09
    price * tax_rate
  end

  def total
    price + tax
  end
end
