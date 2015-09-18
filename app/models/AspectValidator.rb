class AspectValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
        if value.queued_for_write[:original].present?
	  dimensions = Paperclip::Geometry.from_file(value.queued_for_write[:original].path)

	  ratio = options[:ratio]
          curratio = (dimensions.width/dimensions.height).round(2)
          STDOUT.write "Aspect Ratio is #{curratio}"

	  record.errors[attribute] << "Aspect Ratio must be #{ratio} : 1" unless curratio == ratio
        end
  end

end
