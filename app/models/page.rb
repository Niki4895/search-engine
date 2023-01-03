class Page < ApplicationRecord
    has_many :keywords, dependent: :destroy
end
