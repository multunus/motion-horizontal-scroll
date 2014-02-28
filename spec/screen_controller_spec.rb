describe ScreenController do
  before do
    @screen = ScreenController.new
    @items = [Model.new(:name => "test_name_1", :image_url => "test_url_1"), Model.new(:name => "test_name_2", :image_url => "test_url_2")]
    @screen.items = @items
  end

  it "should create a new horizontal scroll cell" do
    cell = @screen.create_new_horizontal_scroll_cell 0
    cell.class.should == HorizontalTableContainerCell
    cell.items_list.count.should == @items.count
  end

  it "should extract the required subset of data" do
    items = @screen.extract_subset_of_data 0
    items.count.should == 2
  end

  it "should have the right number of rows" do
    @screen.get_row_count.should == 1
  end
end
