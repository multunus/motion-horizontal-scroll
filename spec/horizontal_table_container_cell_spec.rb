describe HorizontalTableContainerCell do
  before do
    horizontal_row = HorizontalTableContainerCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: self.class.name)
    horizontal_row.delegate = self
    horizontal_row.vertical_row_offset = 0
    @cell = horizontal_row.set_dimensions_with_row_offset      
    @cell.items_list = [Model.new(:name => "test_name_1", :image_url => "test_url_1"), Model.new(:name => "test_name_2", :image_url => "test_url_2")]
  end

  it "should have transparent background" do
    @cell.backgroundColor.should == UIColor.clearColor
  end

  it "should set up a scroll view to hold the table" do
    scroll_view = @cell.instance_variable_get(:@scroll_view)
    scroll_view.class.should == UIScrollView
    scroll_view.backgroundColor.should == UIColor.clearColor
  end

  it "should set up the horizontal table view" do
    @cell.horizontal_table_view.class.should == UITableView
    @cell.horizontal_table_view.backgroundColor.should == UIColor.clearColor
    @cell.horizontal_table_view.delegate.should == @cell
  end

  it "should return the right origin for the rotation transformation" do
    @cell.get_origin_before_transformation.should == [60,-60]
  end

  it "should return the frame for the wrapping scroll view" do
    @cell.get_wrapping_scroll_view_frame.should == [[0,0],[320,207]]
  end

  it "should return the frame for the inner horizontal table view" do
    @cell.get_horizontal_table_view_frame.should == [[60,-60],[207,320]]
  end

  it "should return a cell for the table view" do
    returned_cell = @cell.get_reusable_cell(@cell.horizontal_table_view)
    returned_cell.class.should == BasicTableViewCellWithTitle
  end
end
