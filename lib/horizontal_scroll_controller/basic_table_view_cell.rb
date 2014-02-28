class BasicTableViewCell < UITableViewCell
  include ControlVariables

  attr_accessor :thumbnail, :model

  def initWithFrame(frame)
    if super
      self.thumbnail = ImageViewWithOverlay.alloc.initWithFrame(CGRectMake(15, 23, 115, 145))
      self.thumbnail.userInteractionEnabled = true
      self.thumbnail.opaque = true
      apply_shadow_to_thumbnail
      self.contentView.addSubview(thumbnail)
      self.backgroundColor = CELL_BACKGROUND_COLOR
      self.selectedBackgroundView = UIView.alloc.initWithFrame(self.thumbnail.frame)
      self.selectedBackgroundView.backgroundColor = HORIZONTAL_VIEW_SELECTED_BACKGROUND_COLOR
      self.transform = CGAffineTransformMakeRotation(Math::PI * 0.5)
      after_frame_initialization
    end
    self
  end
  
  def after_frame_initialization

  end

  def apply_shadow_to_thumbnail
    path = UIBezierPath.bezierPathWithRect(self.thumbnail.bounds)
    shadow_radius = 3
    make_shadow_with_path(self.thumbnail, "black", 0.4, shadow_radius, CGSizeMake(2,2), path, false)
  end

  def set_thumbnail_image image
    self.thumbnail.image = UIImage.imageNamed(image)
  end

  def set_thumbnail_image_with_url image_url, placeholder
    self.thumbnail.setImageWithURL(NSURL.URLWithString(image_url), placeholderImage: UIImage.imageNamed(placeholder))
  end

  def make_shadow_with_path(view, color, opacity, radius, offset, bezier_path, rasterize)
    view.layer.shouldRasterize = rasterize
    view.layer.shadowColor = color.to_color.CGColor
    view.layer.masksToBounds = false
    view.layer.shadowOffset = offset
    view.layer.shadowOpacity = opacity
    view.layer.shadowRadius = radius
    view.layer.shadowPath = bezier_path.CGPath
    view.layer.rasterizationScale = UIScreen.mainScreen.scale
  end
end
