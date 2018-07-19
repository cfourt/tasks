module ApplicationHelper
	def back_link
		link_to('<i class="back-arrow"></i>'.html_safe, :back, class: 'back-link')
	end
end
