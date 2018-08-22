# encoding: utf-8
# Carrierwave uploader for docuemnts.
class DocumentUploader < CarrierWave::Uploader::Base

  storage CONFIG[:storage].to_sym

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def root
    Rails.root.join 'public/'
  end

  def fog_public
    false
  end

  def fog_authenticated_url_expiration
    1.year # in seconds from now,  (default is 1.year)
  end
end
