class Meal < ApplicationRecord
    
    validates_presence_of :mealName, :message => 'Please Enter a Meal   '
    validates :mealName, length: {minimum: 2}
    
        validates_presence_of :description, :message => 'Please Enter a description   '
    validates :description, length: {minimum: 2}
    
        validates_presence_of :image_url, :message => 'Please Enter an image file name   '
    validates :image_url, length: {minimum: 2}
    
        validates_presence_of :category, :message => 'Please Enter a Category   '
    validates :category, length: {minimum: 2}
    
end
