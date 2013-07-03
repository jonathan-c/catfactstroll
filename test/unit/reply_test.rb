# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  from       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  victim_id  :integer
#

require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
