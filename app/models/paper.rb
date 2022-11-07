class Paper < ApplicationRecord
    has_and_belongs_to_many :authors
    validates :title, presence: true, length: { minimum: 1 }
    validates :venue, presence: true, length: {minimum: 1}
    validates :year, presence: true, length: {minimum: 1}, numericality: { only_integer: true }
    scope :year, ->(year) { where("year == ?", year) if year.present?}
end
