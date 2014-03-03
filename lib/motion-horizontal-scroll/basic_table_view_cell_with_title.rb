class BasicTableViewCellWithTitle < BasicTableViewCell
  attr_accessor :title_label

  def after_frame_initialization
    setup_title_label
  end

  def setup_title_label
    label_frame = CGRectMake(15, CELL_HEIGHT - 55, 85, 50)
    self.title_label = UILabel.alloc.initWithFrame(label_frame)
    self.title_label.text = ""
    self.title_label.font = UIFont.boldSystemFontOfSize(12)
    self.title_label.numberOfLines = 2
    self.title_label.backgroundColor = UIColor.clearColor
    self.title_label.baselineAdjustment = UIBaselineAdjustmentAlignBaselines
    self.title_label.textAlignment = NSTextAlignmentCenter
    self.title_label.textColor = "#3d4040".to_color
    self.thumbnail.addSubview(self.title_label)
  end
  
  def set_title_label_text text
    self.title_label.text = text
    reset_title_label_frame
  end

  def reset_title_label_frame
    self.title_label.sizeToFit
    frame = self.title_label.frame
    frame.size.width = 85
    self.title_label.frame = frame
  end

end
