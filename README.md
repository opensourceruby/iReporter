# Ireporter

This gem is the Ruby alternative to  **iTunes Connect Reporter** written in java library used to fetch sales and finance reports.
Ireporter allows fetching data into string and also be wrapped in Arrays without downloading and extracting zip files.
This gem is written considering requirement of Rails app, but can be used as a regular ruby gem.


Currently gem allows to get the status of Sales and Finance reports, fetch the vendor number and extracts the sales reports.
We are still working on extracting Financial report feature and will be added in next release.



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ireporter', '~> 0.1.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ireporter

## Usage

Create a reporter object

```
require 'ireporter'
reporterObj= Ireporter::Reporter.new('user id','password')
```

And use below awesome methods, and see the Magic happen.

Get the status of services (Sales and Finance) 

```
reporterObj.get_status('Sales')
reporterObj.get_status('Finance')

```

Fetch the sales report

```
report_data=reporterObj.get_sales_report('daily','20160818')
```

And then wrap it in the Array

```
array = reporterObj.wrap(report_data)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nakshay/ireporter. 


## Contributors

**Akshay Naik**

**Rushikesh Kawadkar**


## License

The MIT License (MIT)

Copyright (c) 2017 Akshay Naik

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

