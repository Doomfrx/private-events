class Event < ApplicationRecord

    has_many :registrations 

    belongs_to :user

    scope :past, -> {where("date < ?", Time.now).order("date")}
    scope :upcoming, -> {where("date > ?", Time.now).order("date")}

    validates :name, presence: true
    validates :location, presence: true
    validates :description, presence: true
    
end
