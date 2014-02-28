class ImageViewWithOverlay < UIImageView
  OVERLAY_VIEW_TAG = 100

  def touchesBegan(touches,withEvent: event)
    overlay = UIView.alloc.initWithFrame(self.bounds)
    overlay.tag = OVERLAY_VIEW_TAG
    overlay.alpha = 0.5
    overlay.backgroundColor = UIColor.blackColor
    self.addSubview(overlay)
    self.superview.touchesBegan(touches,withEvent: event)
  end 

  def touchesEnded(touches,withEvent: event)
    overlay = self.viewWithTag(OVERLAY_VIEW_TAG)
    unless overlay.nil? == true
      UIView.animateWithDuration(0.4, animations: lambda{
                                   overlay.alpha = 0
                                 },completion: lambda{|done|
                                   overlay.removeFromSuperview
                                 })
    end
    self.superview.touchesEnded(touches,withEvent: event)
  end  
  
  def touchesCancelled(touches,withEvent: event)
    overlay = self.viewWithTag(OVERLAY_VIEW_TAG)
    unless overlay.nil? == true
      UIView.animateWithDuration(0.4, animations: lambda{
                                   overlay.alpha = 0
                                 },completion: lambda{|done|
                                   overlay.removeFromSuperview
                                 })
    end
    self.superview.touchesCancelled(touches,withEvent: event)
  end
end
