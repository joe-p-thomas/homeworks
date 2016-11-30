# == Schema Information
#
# Table name: houses
#
#  id         :integer          not null, primary key
#  address    :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class House < ActiveRecord::Base

end
