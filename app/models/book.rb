class Book < ApplicationRecord
    belongs_to :user
    # userはN:1の1の方なので単数系？
    
    validates :title, presence: true
    validates :body, presence: true, length: { maximum: 200 }
    
    
end
