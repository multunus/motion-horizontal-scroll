class ScreenController < UIViewController
  include AppConstants

  attr_accessor :items

  def viewDidLoad
    super
    self.items = []
    self.view.backgroundColor = UIColor.whiteColor
    @table_view = UITableView.alloc.initWithFrame([[0, STATUS_BAR_HEIGHT],[Device.screen.width, Device.screen.height - STATUS_BAR_HEIGHT]], style: UITableViewStylePlain)
    @table_view.delegate = self
    @table_view.dataSource = self
    self.view.addSubview(@table_view)
    fetch_data
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    cell = table_view.dequeueReusableCellWithIdentifier(self.class.name)
    unless cell
      cell = create_new_horizontal_scroll_cell index_path.row
    end
    cell.reload_content
    cell
  end

  def create_new_horizontal_scroll_cell row_number
    horizontal_row = HorizontalTableContainerCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: self.class.name)
    horizontal_row.delegate = self
    horizontal_row.vertical_row_offset = VERTICAL_ROW_OFFSET
    cell = horizontal_row.set_dimensions_with_row_offset      
    cell.items_list = extract_subset_of_data row_number
    cell.selectionStyle = UITableViewCellSelectionStyleNone
    cell
  end

  def extract_subset_of_data row_number
    start_index = ITEMS_PER_ROW * row_number
    end_index = start_index + ITEMS_PER_ROW - 1
    self.items[start_index..end_index]
  end
  
  def horizontal_scroll_cell_selected(item, index)
    App.alert "#{item.name} at index #{index}"
  end

  def set_item_details_for_horizontal_scroll_cell cell, item
    cell.set_title_label_text item.name
    cell.set_thumbnail_image_with_url item.image_url, "img.jpeg"
  end

  def tableView(table_view, heightForRowAtIndexPath: index_path)
    ROW_HEIGHT
  end

  def tableView(table_view, numberOfRowsInSection: section)
    get_row_count
  end

  def get_row_count
    return 1 if self.items.nil?
    (self.items.count.to_f/5).ceil
  end

  def numberOfSectionsInTableView(table_view)
    NUMBER_OF_SECTIONS
  end

  def fetch_data
    generate_sample_models "city"
    generate_sample_models "transport"
    generate_sample_models "cats"
    @table_view.reloadData
  end

  def generate_sample_models category
    5.times do |n|
      model = Model.new
      model.name = "#{category} #{n}"
      model.image_url = "http://lorempixel.com/130/207/#{category}/#{n}"
      self.items << model
    end    
  end
end
