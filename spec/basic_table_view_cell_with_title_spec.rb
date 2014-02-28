describe BasicTableViewCellWithTitle do
  before do
    @cell = BasicTableViewCellWithTitle.alloc.initWithFrame(CGRectMake(0, 0, 130, 207))
  end

  it "should set up the title label" do
    @cell.setup_title_label
    @cell.thumbnail.subviews.last.class.should == UILabel
  end

  it "should set the title label text" do
    @cell.set_title_label_text "title"
    @cell.title_label.text.should == "title"
  end

  it "should set the title label frame width on reset" do
    @cell.title_label.text = "title"
    @cell.reset_title_label_frame
    @cell.title_label.frame.size.width.should == 85
  end
end
