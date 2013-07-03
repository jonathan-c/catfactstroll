# == Schema Information
#
# Table name: catfacts
#
#  id         :integer          not null, primary key
#  message    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CatfactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
