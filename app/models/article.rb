class Article < ApplicationRecord
	require 'active_storage_validations'

	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings
	
	has_one_attached :image
    validates :image, attached: true,
                    content_type: ['image/png', 'image/jpg', 'image/jpeg']

	def tag_list
		tags.join(", ")
	end

	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
		self.tags = new_or_found_tags
	end
end
