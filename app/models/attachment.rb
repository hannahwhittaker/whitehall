class Attachment < ActiveRecord::Base
  mount_uploader :name, AttachmentUploader
  has_many :documents
end