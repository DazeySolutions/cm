
require_dependency 'AspectValidator.rb'
class Sermon < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { small: "100x100#", med: "250x250>", large: "600x600>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
