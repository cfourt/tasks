module TasksHelper
	def task_due_date(task)
		due_date = task.due_date
		output = time_ago_in_words(task.due_date) unless task.due_date.blank?

		if due_date.nil?
			link_to 'Add due date', edit_task_path(task), class: 'subtle'
		elsif due_date < Time.now && !task.completed
			task.past_due = true
			content_tag(:span, output + ' ago', class: 'danger', title: 'Task is past due')
		elsif due_date < (1.day.from_now) && !task.completed
			content_tag(:span, 'in ' + output, class: 'warning', title: 'Task is due soon')
		else
			content_tag(:span, output)
		end
		
	end

  def task_due_date_icon(task)
    due_date = task.due_date
    output = time_ago_in_words(task.due_date) unless task.due_date.blank?

    if due_date.nil?
      link_to 'Add due date', edit_task_path(task), class: 'subtle'
    elsif due_date < Time.now && !task.completed
      task.past_due = true
      content_tag(:span, fa_icon('fa-calendar-exclamation', 'Due ' + output + ' ago'), class: 'danger', title: 'Task is past due')
    elsif due_date < (1.day.from_now) && !task.completed
      content_tag(:span, fa_icon('fa-calendar-alt', 'Due in ' + output), class: 'warning', title: 'Task is due soon')
    else
      content_tag(:span, output)
    end
    
  end

	def task_completed(task)
		if task.completed?
			"<p class='text-success'><i class='fas fa-check pr-1'></i>Completed!</p>".html_safe
		else
			"<span class=''><p class='text-body'>Not complete</p></span>".html_safe
		end
	end

	def fa_icon(names, label='', options={})
    	icon = if names.present?
             options = options.merge(class: %w'far' + Array(names))
             content_tag(:i, '', options)
           end
    	safe_join([icon, label.presence].compact, ' ')
  	end

	def fa_icon_right(label, names, options={})
		icon = if names.present?
		         options = options.merge(class: %w'far' + Array(names))
		         content_tag(:i, '', options)
		       end
		safe_join([label.presence, icon].compact, ' ')
	end
end
