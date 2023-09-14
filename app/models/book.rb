class Book < ApplicationRecord
    has_one_attached :image
    belongs_to :user, dependent: :destroy
    # userはN:1の1の方なので単数系？
    
    
end
