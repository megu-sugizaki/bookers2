class Book < ApplicationRecord
    belongs_to :user, dependent: :destroy
    # userはN:1の1の方なので単数系？
    
    validates :title, presence: true
    validates :body, presence: true
    
    
end
