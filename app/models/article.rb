class Article < ApplicationRecord
    belongs_to :category
    validates :title, :content, :catetgory_id, presence:true
end
