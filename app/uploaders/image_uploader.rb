class ImageUploader < Shrine
	plugin :store_dimensions

	plugin :validation_helpers
	plugin :remove_invalid
	plugin :versions
	plugin :cached_attachment_data
	plugin :processing
	include ImageProcessing::MiniMagick

	process(:store) do |io,context|
		{
			original: io,
			small: resize_to_fill(io.download , 80, 100),
			medium: resize_to_limit(io.download, 800 , 600)

		}
	end

	Attacher.validate do 
		validate_max_size 5 * 1024 * 1024
		validate_mime_type_inclusion %w[image/jpeg image/png image/gif]
		validate_extension_inclusion %w[jpg jpeg png gif]
	end


end