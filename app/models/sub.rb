# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  completed    :boolean
#  completed_at :datetime
#  due_date     :datetime
#  task_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base
  belongs_to :task
end
