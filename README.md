# Ireporter ![](http://ruby-gem-downloads-badge.herokuapp.com/ireporter?type=total)

Ireporter is an Ruby alternative to  **iTunes Connect Reporter** a java library provided by Apple, which is used to fetch sales and finance reports.
Ireporter takes username and password for iTunes Connector and makes JSON request to get the response from ITC, unlike Apple's Reporter Ireporter removes the overhead of unzipping the archive file to get the data form text file, instead it gives the data in string data type, which can be wrapped into Array of hashses using Ireporter's wrap method. Later on can be converted in to JSON and other formats using ruby methods for conversion as per convenience.

This gem is written considering requirement of Rails app, but can be used as a regular ruby gem.


Currently Ireporter allows to fetch the status of Sales and Finance reports, fetch the vendor number and extracts the sales reports.
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

include Ireporter 

reporterObj= Reporter.new('user id','password')

```

And use below awesome methods, and see the Magic happen.

Get the status of services (Sales and Finance) 

```
reporterObj.get_status('Sales')
reporterObj.get_status('Finance')

```

Fetch the sales report

```
report_data=reporterObj.get_sales_report(Reporter::DATE_TYPE_DAILY,'20160818')
```

Date types 

```
DATE_TYPE_DAILY    (YYYYMMDD)
DATE_TYPE_WEEKLY   (YYYYMMDD) => DD should be Sunday of the Week
DATE_TYPE_MONTHLY  (YYYYMM)
DATE_TYPE_YEARLY   (YYYY)

```

And then wrap it in the Array

```
array = reporterObj.wrap(report_data)
```

## Contributing

You can help us to make the iReporter better.
Bug reports and pull requests are welcome on GitHub at https://github.com/nakshay/ireporter. 


## Maintained by. 

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

