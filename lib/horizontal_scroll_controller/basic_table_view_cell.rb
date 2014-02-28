class BasicTableViewCell < UITableViewCell
  include ControlVariables

  attr_accessor :thumbnail, :model

  def initWithFrame(frame)
    if super
      self.thumbnail = UIView.alloc.initWithFrame(CGRectMake(15, 23, 115, 145))
      self.thumbnail.userInteractionEnabled = true
      self.thumbnail.opaque = true
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

  def set_thumbnail_image image
    self.thumbnail.image = UIImage.imageNamed(image)
  end

  def set_thumbnail_image_with_url image_url, placeholder
    self.thumbnail.setImageWithURL(NSURL.URLWithString(image_url), placeholderImage: UIImage.imageNamed(placeholder))
  end

end
