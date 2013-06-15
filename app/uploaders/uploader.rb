class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process :resize_to_fill => [400,400]

  storage :file

  def store_dir
    "photos/"
  end
end
