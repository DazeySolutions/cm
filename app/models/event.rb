require_dependency 'AspectValidator.rb'
class Event < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { small: "205x86", med: "255x106", large: "330x138" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
