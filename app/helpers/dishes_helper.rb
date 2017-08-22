module DishesHelper
  def circle_img(url, size = 300)
    content_tag(:div, '', class: 'circle cover', style: "height: #{size}px;
          width: #{size}px; background-image: url(#{url});
          box-shadow: 0px 1px 5px #3f51b5;")
  end
end
