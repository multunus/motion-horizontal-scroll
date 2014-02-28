describe BasicTableViewCell do

  before do
    @cell = BasicTableViewCell.alloc.initWithFrame(CGRectMake(0, 0, 130, 207))
  end

  it "should initialize and apply image overlay" do
    @cell.thumbnail.class.should == ImageViewWithOverlay
    @cell.thumbnail.userInteractionEnabled = true
    @cell.thumbnail.opaque = true
  end

end
