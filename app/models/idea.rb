class Idea < ApplicationRecord
	# validate the presence of the datas in the given fields in the database
	  validates :description, :author, presence: true
end
	