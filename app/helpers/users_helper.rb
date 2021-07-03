module UsersHelper

  # 引数で与えられたユーザーのGravatar画像を返す
  def gravatar_for(user, options = { size: 80 })
    size         = options[:size]
    if user.icon.attached?
      image_tag(user.icon, alt: user.name, class: "user-img")
    else
      image_tag("img/Develotter_icon.png", alt: user.name, class: "user-img")
    end
  end
end