# == Schema Information
#
# Table name: fixpoint_attachments
#
#  id          :bigint           not null, primary key
#  photo       :string
#  fixpoint_id :bigint
#  fixed       :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class FixpointAttachment < ApplicationRecord
  belongs_to :fixpoint

  mount_uploader :photo, PhotoUploader
end
