class HorizontalTableContainerCell < UITableViewCell
  include ControlVariables
  
  attr_accessor :horizontal_table_view, :items_list, :delegate, :vertical_row_offset

  def tableView(table_view, numberOfRowsInSection: section)
    self.items_list.count
  end
  
  def tableView(table_view, cellForRowAtIndexPath: index_path)
    cell = get_reusable_cell table_view
    current_item = self.items_list[index_path.row]
    self.delegate.set_item_details_for_horizontal_scroll_cell cell, current_item
    cell.selectionStyle = UITableViewCellSelectionStyleNone
    cell
  end

  def tableView(table_view, willDisplayCell: cell, forRowAtIndexPath: index_path)
    cell.backgroundColor = UIColor.clearColor
  end
  
  def tableView(table_view, didSelectRowAtIndexPath: index_path)
    self.delegate.horizontal_scroll_cell_selected(self.items_list[index_path.row], index_path.row) if self.delegate
  end

  def set_dimensions_with_row_offset
    @scroll_view = setup_background_scroll_view
    self.backgroundColor = UIColor.clearColor
    self.horizontal_table_view = setup_horizontal_tableview
    @scroll_view.addSubview(self.horizontal_table_view)
    self.addSubview @scroll_view
  end

  def setup_background_scroll_view
    scroll_view = UIScrollView.alloc.initWithFrame(get_wrapping_scroll_view_frame)
    scroll_view.contentSize = CGSizeMake(Device.screen.width, CELL_HEIGHT + vertical_row_offset)
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

  def get_origin_before_transformation
    [60 - vertical_row_offset, -60 + vertical_row_offset]
  end
  
  def get_wrapping_scroll_view_frame
    [[0,0],[Device.screen.width, CELL_HEIGHT + vertical_row_offset]]
  end

  def get_horizontal_table_view_frame
    [get_origin_before_transformation, [CELL_HEIGHT + vertical_row_offset, Device.screen.width]]
  end

  def reload_content
    self.horizontal_table_view.reloadData
  end

  def get_reusable_cell table_view
    cell = table_view.dequeueReusableCellWithIdentifier(BasicTableViewCellWithTitle.name)
    if cell.nil?
      cell = BasicTableViewCellWithTitle.alloc.initWithFrame(CGRectMake(0, 0, CELL_WIDTH, CELL_HEIGHT + vertical_row_offset))
    end
    cell
  end
  
end
