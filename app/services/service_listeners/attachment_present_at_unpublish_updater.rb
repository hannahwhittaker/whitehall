module ServiceListeners
  class AttachmentPresentAtUnpublishUpdater
    def self.call(attachable: nil)
      Attachment.where(attachable: attachable.attachables).find_each do |attachment|
        next unless attachment.attachment_data
        attachment.attachment_data.update_column(:present_at_unpublish, true)
      end
    end
  end
end
