module ServiceListeners
  class AttachmentPresentAtUnpublishUpdater
    def self.call(attachable: nil, value: false)
      Attachment.where(attachable: attachable.attachables).find_each do |attachment|
        next unless attachment.attachment_data
        attachment.attachment_data.update_attribute(:present_at_unpublish, value)
        puts "updated unpublish status to " + value.to_s
        puts attachment.attachment_data.inspect
      end
    end
  end
end
