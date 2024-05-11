class Loan < ApplicationRecord
    belongs_to :user

    has_one_attached :national_id_image
end
