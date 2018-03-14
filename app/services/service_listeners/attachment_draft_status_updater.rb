module ServiceListeners
  class AttachmentDraftStatusUpdater
    attr_reader :attachment_data

    def initialize(attachment_data)
      @attachment_data = attachment_data
    end

    def update!
      return unless attachment_data.present?
      draft = attachment_data.draft?
      enqueue_job(attachment_data.file, draft)
      if attachment_data.pdf?
        enqueue_job(attachment_data.file.thumbnail, draft)
      end
    end

  private

    def enqueue_job(uploader, draft)
      legacy_url_path = uploader.asset_manager_path
      AssetManagerUpdateAssetWorker.perform_async(legacy_url_path, draft: draft)
    end
  end
end