module ApplicationHelper
	def back_link(override= :back)
		link_to('<i class="back-arrow"></i>'.html_safe, override, class: 'back-link')
	end
end
