class Event < ApplicationRecord

    has_many :registrations 

    belongs_to :user

    scope :past, -> {where("date < ?", Time.now).order("date")}
    scope :upcoming, -> {where("date > ?", Time.now).order("date")}
    
end
