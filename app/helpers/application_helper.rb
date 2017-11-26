module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image_profile.png'
    end
    image_tag(img_url, alt: user.name)
  end

  def pict_img(topic)
    return image_tag(topic.pict) if topic.pict?

    unless topic.pict.blank?
      img_url = topic.image_url
    else
      img_url = ''
    end
    image_tag(img_url)
  end
end
