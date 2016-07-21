module EventsHelper
	def gravatar_for(event)
    gravatar_id = Digest::MD5::hexdigest(event.name.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: event.name, class: "gravatar")
  end
end
