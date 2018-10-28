class ArticleUpload < ApplicationRecord
  belongs_to :article
  mount_uploader :attachment, ArticleUploader
  
end
