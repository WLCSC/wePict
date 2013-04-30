module ApplicationHelper
	def current_user  
		if session[:user_id]
			current_user ||= User.find(session[:user_id])
		else
			current_user = nil
			nil
		end
	end

	def tabify list
		r = '<ul class="custom nav nav-tabs">'
		active = true
		list.each_pair do |li, str|
			if content_for? li
				r << "
				"
				if active
					r << '<li class="active"><a data-toggle="tab" href="#'+li.to_s+'">'+str+'</a></li>'
					active = false
				else
					r << '<li><a data-toggle="tab" href="#'+li.to_s+'">'+str+'</a></li>'
				end
			end
		end
		r << '</ul>'
		r << "

		"
		r << '<div class="tab-content" style="border: thin inset black; margin-top: 0px; background-color: #fff; padding: 5px;">'
		list.each_pair do |li, str|
			if content_for? li
				if !active
					r << '<div class="tab-pane active" id="'+li.to_s+'">'
					active = true
				else
					r << '<div class="tab-pane" id="'+li.to_s+'">'
				end
				r << "
				"
				r << content_for(li)
				r << "
				"
				r << '</div>'
				r << "
				"
			end
		end
		r << '</div>'
		r.html_safe
	end

	def twitterized_type(type)
		case type
		when :alert
			"warning"
		when :error
			"error"
		when :notice
			"info"
		when :success
			"success"
		else
			type.to_s
		end
	end

	def time_delta time
		if time < Time.now
			distance_of_time_in_words_to_now(time) + " ago"
		else
			distance_of_time_in_words_to_now(time) + " from now"
		end
	end

	def truthy_thumb(value)
		if value=="*"
			i('star').html_safe
		elsif value
			i('thumbs-up').html_safe
		else
			i('thumbs-down').html_safe
		end
	end

	def i(c,w=false)
		('<i class="icon-' + c + (w ? " icon-white " : '') + '"></i>').html_safe
	end

	def markdown(text)
		sanitize(BlueCloth::new(text).to_html)
	end

	def nice_date d
		d.strftime("%A, %B %d, %Y")
	end

	def nice_datetime d
		d.strftime("%I:%M %p %m-%d-%Y")
	end

	def pills_for collection, klass = nil
		buffer = '<ul class="nav nav-pills ' + (klass ? klass : '') + '">' + "\n"
		collection.each do |item|
			buffer << '<li>' + link_to(item.display, item) + '</li>' + "\n"
		end
		buffer << '</ul>'
		buffer.html_safe
	end

end
