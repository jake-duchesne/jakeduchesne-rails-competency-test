class Article < ApplicationRecord
    validates_presence_of :title

    belongs_to :category
    belongs_to :user
end
