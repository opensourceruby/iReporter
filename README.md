# Ireporter

This gem is alternative to  **iTunes Connect Reporter** a java library used to fetch sales and finance reports.

This gem is written considering requirement of Rails app, but can be used as a regular ruby gem.



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ireporter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ireporter

## Usage

Create a reporter object

```
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

And then wrap it inside Array

```
reporterObj.wrap(report_data)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nakshay/ireporter. 


## Contributors

Akshay Naik

Rushikesh Kawadkar


## Contributors

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

