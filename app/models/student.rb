class Student < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phoneno, presence: true
end
