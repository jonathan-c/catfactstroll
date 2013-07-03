# == Schema Information
#
# Table name: victims
#
#  id                   :integer          not null, primary key
#  phone                :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  premium_subscription :boolean          default(FALSE)
#

require 'test_helper'

class VictimTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
