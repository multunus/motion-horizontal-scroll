class HorizontalTableContainerCell < UITableViewCell
  include ControlVariables
  
  attr_accessor :horizontal_table_view, :items_list

  def tableView(table_view, numberOfRowsInSection: section)
    items_count = items_list.count
  end
  
  def tableView(table_view, cellForRowAtIndexPath: index_path)
    cell = get_reusable_cell table_view
    current_item = items_list[index_path.row]
    set_item_details_for_cell cell, current_item
    cell.selectionStyle = UITableViewCellSelectionStyleNone
    cell
  end

  def tableView(table_view, willDisplayCell: cell, forRowAtIndexPath: index_path)
    cell.backgroundColor = UIColor.clearColor
  end
  
  def tableView(table_view, didSelectRowAtIndexPath: index_path)

  end

  def setDimensionsWithRowOffset()
    @scroll_view = setup_background_scroll_view
    self.backgroundColor = UIColor.clearColor
    self.horizontal_table_view = setup_horizontal_tableview
    @scroll_view.addSubview(self.horizontal_table_view)
    self.addSubview @scroll_view
  end

  def setup_background_scroll_view
    scroll_view = UIScrollView.alloc.initWithFrame(get_wrapping_scroll_view_frame)
    scroll_view.contentSize = CGSizeMake(Device.screen.width, CELL_HEIGHT + get_row_offset)
    scroll_view.bounces = true
    scroll_view.alwaysBounceHorizontal = true
    scroll_view.backgroundColor = UIColor.clearColor
    scroll_view
  end

  def setup_horizontal_tableview
    horizontal_table_view = UITableView.alloc.initWithFrame(get_horizontal_table_view_frame)
    horizontal_table_view.transform = CGAffineTransformMakeRotation( - (Math::PI * 0.5))
    horizontal_table_view.rowHeight = CELL_WIDTH
    horizontal_table_view.showsVerticalScrollIndicator = false
    horizontal_table_view.showsHorizontalScrollIndicator = false
    horizontal_table_view.backgroundColor = UIColor.clearColor
    horizontal_table_view.separatorStyle = UITableViewCellSeparatorStyleSingleLine
    horizontal_table_view.separatorColor = UIColor.clearColor
    horizontal_table_view.dataSource = self
    horizontal_table_view.bounces = true
    horizontal_table_view.delegate = self
    horizontal_table_view.alwaysBounceVertical = true
    horizontal_table_view
  end

  def get_cell_frame
    [[0, 0], [CELL_WIDTH, CELL_HEIGHT + get_row_offset]]
  end
  
  def get_origin_before_transformation
    [60 - get_row_offset, -60 + get_row_offset]
  end
  
  def get_wrapping_scroll_view_frame
    [[0,0],[Device.screen.width, CELL_HEIGHT + get_row_offset]]
  end

  def get_horizontal_table_view_frame
    [get_origin_before_transformation, [CELL_HEIGHT + get_row_offset, Device.screen.width]]
  end

  def reloadContent
    self.horizontal_table_view.reloadData
  end

  def get_reusable_cell table_view
    cell = table_view.dequeueReusableCellWithIdentifier(BasicTableViewCellWithTitle.name)
    if cell.nil?
      cell = BasicTableViewCellWithTitle.alloc.initWithFrame(CGRectMake(0, 0, CELL_WIDTH, CELL_HEIGHT + get_row_offset))
    end
    cell
  end

  def set_item_details_for_cell cell, item
    cell.set_title_label_text item.name
  end
  
  def get_row_offset
    0
  end
  
end
