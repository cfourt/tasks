module TasksHelper
	def task_due_date(task, show_date=false)
		due_date = task.due_date

		if due_date.nil?
			link_to 'Add due date', edit_task_path(task), class: 'subtle'
		elsif due_date < Time.now && !task.completed
			content_tag(:span, due_date, class: 'text-danger', title: 'Task is past due')
		elsif due_date.today? && !task.completed
			content_tag(:span, due_date, class: 'text-warning', title: 'Task is due soon')
		else
			content_tag(:span, due_date)
		end
		
	end

	def task_completed(task)
		if task.completed?
			"<span class='p-1 bg-success'><p class='text-white'><i class='fas fa-check'></i>Completed!</p></span>".html_safe
		else
			"<span class=''><p class='text-body'>Not complete</p></span>".html_safe
		end
	end
end
