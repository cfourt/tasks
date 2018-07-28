class Task < ActiveRecord::Base

	validates :title, presence: true,
                    length: { minimum: 2 }

    has_many :subs, dependent: :destroy
end
