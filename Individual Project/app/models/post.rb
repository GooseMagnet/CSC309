class Post < ActiveRecord::Base
	acts_as_votable

	validates :title,  presence: true
	validates :description, presence: true
	validates :tags, presence: true

end
