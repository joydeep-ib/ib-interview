class Interview < ApplicationRecord
    has_and_belongs_to_many :participants
end
