require 'rest-client'
require 'zlib'
require 'json'


module Ireporter

class Reporter 


# Constants initialization
VERSION = '2.2'
URL_SALES = 'https://reportingitc-reporter.apple.com/reportservice/sales/v1'
URL_FINANCE = 'https://reportingitc-reporter.apple.com/reportservice/finance/v1'

DATE_TYPE_DAILY = "Daily"
DATE_TYPE_WEEKLY = "Weekly"
DATE_TYPE_MONTHLY = "Monthly"
DATE_TYPE_YEARLY = "Yearly"


#constructor

def initialize(username,password,accesstoken)
  @username = username
  @password = password
  @accesstoken = accesstoken 
end

 def get_status (service)
 
   command = "[p=Reporter.properties, "+service+".getStatus]"
   url = service == 'Sales' ? URL_SALES : URL_FINANCE

   parameters = build_json_request(command)

   response = post_request(parameters,url)
 
    if response.headers[:"errormsg"]
     raise "error fetching status"
    else response.headers[:"filename"]
     return response.body
    end
 end


 def get_vendor()

  command = '[p=Reporter.properties, Sales.getVendors]'

  parameters = build_json_request(command)
  response = post_request(parameters,URL_SALES)

  if response.headers[:"errormsg"]
     raise "vendor number not found"
   else response.headers[:"filename"]
     return response.body.chomp
    end
 end

def generate_token

  command = '[p=Reporter.properties, Sales.generateToken]'

  parameters = build_json_request(command)
  response = post_request(parameters,URL_SALES)
  service_request_id = response.headers[:service_request_id]

  opt_param = "&isExistingToken=Y&requestId=" + service_request_id
  parameters = build_json_request(command) + opt_param
  response = post_request(parameters,URL_SALES)

  if response.headers[:"errormsg"]
   raise "token error"
 else response.headers[:"filename"]
   return response.body.chomp
 end
end

def view_token

  command = '[p=Reporter.properties, Sales.viewToken]'

  parameters = build_json_request(command)
  response = post_request(parameters,URL_SALES)

  if response.headers[:"errormsg"]
   raise "token error"
 else response.headers[:"filename"]
   return response.body.chomp
 end
end

def delete_token

  command = '[p=Reporter.properties, Sales.deleteToken]'

  parameters = build_json_request(command)
  response = post_request(parameters,URL_SALES)

  if response.headers[:"errormsg"]
   raise "token error"
 else response.headers[:"filename"]
   return response.body.chomp
 end
end

def get_sales_report(datetype,reportdate)


  datetype  ||= DATE_TYPE_DAILY
  reportdate  ||= (Time.now-60*60*24).strftime("%Y%m%d")

  vendorNumber=get_vendor().chomp

  command = '[p=Reporter.properties, Sales.getReport, '+vendorNumber+',Sales,Summary,'+datetype+','+reportdate+']'
  parameters = build_json_request(command)

  response = post_request(parameters,URL_SALES)


   if response.headers[:"errormsg"]
     raise ITunesConnectError.new response.headers[:"errormsg"]
    elsif response.headers[:"filename"]
     Zlib::GzipReader.new(StringIO.new(response.body)).read
    else
     raise "no data returned from itunes: #{response.body}"
    end
end


def build_json_request(command)

  request_data = { :userid => @username ,:queryInput => command, :version => VERSION,:password => @password, :accesstoken => @accesstoken}
  #Convert request paramters in JSON format 
  request_data=request_data.to_json 

  return 'jsonRequest='+ request_data
end


 def post_request(parameters,url)

  RestClient.post( url, parameters, headers = {:Accept => 'text/html,image/gif,image/jpeg; q=.2, */*; q=.2'} )
 end

 # Wrap data into Array
 def wrap(report)
   lines = report.split("\n")
   header = lines.shift 
   lines.collect do |line|
    provider, country, sku, developer, title, version, product_type_id, units, developer_proceeds, begin_date, end_date, currency, country_code, currency_of_proceeds, apple_id, customer_price, promo_code, parent_id, subscription, period = line.split("\t")
    {
     :provider => provider.strip, 
     :country => country.strip, 
     :sku => sku.strip, 
     :developer => developer.strip, 
     :title => title.strip, 
     :version => version.strip, 
     :product_type_id => product_type_id.strip, 
     :units => units.to_i, 
     :developer_proceeds => developer_proceeds.to_f, 
     :begin_date => Date.strptime(begin_date.strip, '%m/%d/%Y'), 
     :end_date => Date.strptime(end_date.strip, '%m/%d/%Y'), 
     :currency => currency.strip, 
     :country_code => country_code.strip, 
     :currency_of_proceeds => currency_of_proceeds.strip, 
     :apple_id => apple_id.to_i, 
     :customer_price => customer_price.to_f, 
     :promo_code => promo_code.strip, 
     :parent_id => parent_id.strip, 
     :subscription => subscription.strip, 
     :period => period
    }
   end
  end    
 

 private :build_json_request,:post_request
end # class end

end #module end