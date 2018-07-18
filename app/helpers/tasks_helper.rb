module TasksHelper
	def task_due_date(task, show_date=false)
		due_date = task.due_date

		if due_date.nil?
			link_to 'Add due date', edit_task_path(task), class: 'subtle'
		elsif due_date < Time.now && !task.completed
			content_tag(:span, due_date, class: 'past-due', title: 'Task is past due')
		elsif due_date.today? && !task.completed
			content_tag(:span, due_date, class: 'coming-up', title: 'Task is due soon')
		else
			content_tag(:span, due_date)
		end
		
	end
end
