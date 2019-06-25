# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  completed    :boolean
#  completed_at :datetime
#  due_date     :datetime
#  past_due     :boolean
#

class Task < ActiveRecord::Base
	validates :title, presence: true,
                    length: { minimum: 2 }
  has_many :subs, dependent: :destroy
  accepts_nested_attributes_for :subs
end
