class LogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png svg)
  end

  version :thumb do
  	process resize_to_fill: [200, 200]
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path([version_name, "jomweb-logo.svg"].compact.join('_'))
  end
end
