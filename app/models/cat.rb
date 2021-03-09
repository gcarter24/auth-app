class Cat < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true
  validates :size, presence: true
end
