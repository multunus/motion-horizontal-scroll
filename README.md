iOS (RubyMotion) Horizontal Scroll Controller
============================

[![Code Climate](https://codeclimate.com/github/multunus/motion-horizontal-scroll.png)](https://codeclimate.com/github/multunus/motion-horizontal-scroll)

This is a horizontal scroll controller for iOS, that mimics the Pulse UI. The basic functionality is borrowed from a [codebase](https://github.com/Bodacious/HorizontalScrollingTablesInRubyMotion) and it is the reason why we were able to come up with this gem, so hats off to the authors! Also, a ton of thanks to [lorempixel](http://lorempixel.com/) from where we have pulled in images to feed the sample app.

![Animated GIF of Sample Implementation](http://dl.dropboxusercontent.com/s/ja22eokvwmji46j/horizontal_scroll_sample_app.gif)

Below is a description of how you can integrate and use this gem in your codebase.

### Add to Gemfile

```ruby
gem "motion-horizontal-scroll"
```

### How to use it

I have included a sample app for reference. To execute it, clone the repo to your local folder and run the following:

```ruby
bundle install
rake
```

Nevertheless, the basic setup for a single row can be achieved as follows:

```ruby
horizontal_row = HorizontalTableContainerCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: <REUSE_IDENTIFIER>)
horizontal_row.delegate = <DELEGATE>
horizontal_row.vertical_row_offset = <VERTICAL_ROW_OFFSET>
cell = horizontal_row.set_dimensions_with_row_offset      
cell.items_list = <DATA ARRAY>
cell.selectionStyle = UITableViewCellSelectionStyleNone
cell
```

###Supplying the title and image

The data required for a single cell has two properties, namely a name and an image. The name is the title that appears underneath the image in the cell. The image itself can be fed in two formats:

1. An instance of UIImage with initialized with an image.

2. A URL to an image along with a placeholder image; this requires either the gem *afmotion* or the pod *AFNetworking*. The pod on its own may be insufficient, but there's a category called UIImageView+AFNetworking that can start an asynchronous download of an image when given an NSURLRequest.

###Available delegate methods
#### Cell Selection
This refers to a callback that indicates a particular cell has been tapped. The syntax of the method for the same is as follows:
```ruby
horizontal_scroll_cell_selected(item, index)
```
#### Setting Cell Details
The specifics of a cell that need to be set are the title and image. The delegate method for setting cell details is:
```ruby
set_item_details_for_horizontal_scroll_cell(cell, item)
```
To set the cell title, you can use the following method:
```ruby
cell.set_title_label_text text
```
To set the image, there are two possible methods based on the format as specified above.

* The first method involves directly providing an instance of UIImage:
```ruby
cell.set_thumbnail_image image      # image is an instance of UIImage
```

* And the second is probably the method that would be more commonly used for apps that use images pulled from a network. This would require the ```setImageWithURL``` method for the ```UIImageView``` class which can be availed by installing the ```afmotion``` gem (in Objective-C, this would be available in the ```UIImageView+AFNetworking``` category). The two arguments it takes are the URL to the image and the name of a locally available placeholder image. The syntax is:
```ruby
cell.set_thumbnail_image_with_url image_url, placeholder      # image_url is a URL in form of a string and the placeholder is a local image that can take the place of the image until it loads
