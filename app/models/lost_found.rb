class LostFound < ActiveRecord::Base
  attr_accessible :approved, :description, :title, :user_id
  
  belongs_to :user
end
