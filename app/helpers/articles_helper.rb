module ArticlesHelper

  def article_image(article, options = { size: 75 })
    gravatar_id = Digest::MD5::hexdigest(current_user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url)
  end
end