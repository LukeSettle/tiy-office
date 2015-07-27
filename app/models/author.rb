class Author < ActiveRecord::Base
	has_many :pictures
	validates :name, presence: true, uniqueness: true
end
