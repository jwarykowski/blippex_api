[![Gem Version](https://badge.fury.io/rb/blippex_api.png)](http://badge.fury.io/rb/blippex_api)
[![Build Status](https://travis-ci.org/jonathanchrisp/blippex_api.png?branch=master)](https://travis-ci.org/jonathanchrisp/blippex_api)
[![Dependency Status](https://gemnasium.com/jonathanchrisp/blippex_api.png)](https://gemnasium.com/jonathanchrisp/blippex_api)
[![Code Climate](https://codeclimate.com/github/jonathanchrisp/blippex_api.png)](https://codeclimate.com/github/jonathanchrisp/blippex_api)
[![Coverage Status](https://coveralls.io/repos/jonathanchrisp/blippex_api/badge.png?branch=master)](https://coveralls.io/r/jonathanchrisp/blippex_api?branch=master)

# blippex_api
A ruby wrapper for the blippex search engine made bythe people, forthe people.

You can find out more about the Blippex API [here](https://archify.atlassian.net/wiki/display/blippexAPI/api.blippex.org).

## Documentation
* Original documenation: <https://archify.atlassian.net/wiki/display/blippexAPI/api.blippex.org>
* Gem documentation: <http://rubydoc.info/gems/blippex_api>

## Getting Started
In order to be able to send API requests you'll first need to install the `blippex_api` gem.

```ruby
gem install blippex_api
```

Once you have completed the steps above, you can now create an instance of a `BlippexAPI::Client`:

```ruby
require 'blippex_api'
api = BlippexAPI::Client.new
```

If you now look at your `BlippexAPI` object instance it will be similar to the following:

```ruby
<BlippexAPI::Client:0x007fe9a23055f0
@adapter=:net_http,
@api_endpoint="https://api.blippex.org/",
@user_agent="BlippexAPI Ruby Gem 1.0.0">
```

## Example requests
Now that you have an `BlippexAPI::Client` instance you can now make requests.

### info endpoint

```ruby
api.info
```

The response is returned within a `Hashie::Mash` instance.

```ruby
{
  "total_page_count"=>5654101,
  "total_pageview_count"=>8662559,
  "yesterday_page_count"=>55708,
  "yesterday_pageview_count"=>67842,
  "search_count_history"=> [
    {
      "date"=>"2013-09-24T00:00:00+00:00",
      "value"=>"83115"
    },
    {
      "date"=>"2013-09-23T00:00:00+00:00",
      "value"=>"70182"
    }
  ]
}
```

### search endpoint

```ruby
api.search :q => 'Lakers', :w => 20, :d => 2, :highlight => 1, :limit => 1, :offset => 1
```

As above, the response is returned within a `Hashie::Mash` instance.

```ruby
{
  "request"=> {
    "days"=>2,
    "weight"=>20,
    "limit"=>1,
    "offset"=>1,
    "query"=>"Lakers"
    },
    "total"=>31,
    "hits_displayed"=>1,
    "results"=> [
      {
        "_id"=>"1d431326999324b8eccb85b7399553f4",
        "_source"=>"Blippex",
        "url"=>"http://about.me/claresayas",
        "last_seen_at"=>"2013-09-24T15:17:25-07:00",
        "language"=>"en",
        "title"=>"Clare Sayas (claresayas) on about.me",
        "highlight"=>
          " of the community managers for EdelmanSV.\nOn a mission to help entrepreuners find their voice and advance the field of public engagement.\n<mark>Lakers</mark> fan, film/tv enthusiast, relentless home",
        "score"=> {
          "score_raw_elasticsearch"=>0,
          "score_raw_dwell"=>4.3298473876598,
          "sum_time_spend"=>38,
          "sum_visits"=>3,
          "score_clean_elasticsearch"=>0,
          "score_clean_dwell"=>0.86449725527946,
          "score_final"=>0.69159780422356
        }
      }
    ],
    "total_pages_in_db"=>5687567
}

```

### ratelimitstatus endpoint

```ruby
api.rate_limit_status
```

As above, the response is returned within a `Hashie::Mash` instance.

```ruby
{
  "ip"=>"00.0.000.00",
  "data"=> {
    "info"=> {
      "remaining"=>997,
      "reset"=>1380136296,
      "limit"=>1000
    },
    "search"=> {
      "remaining"=>3587,
      "reset"=>1380136296,
      "limit"=>3600
    }
  }
}
```

To find out more information about `Hashie` please visit the following link: <https://github.com/intridea/hashie>.

## Tests
There are a number of unit tests which are included as part of this project, please run:

```ruby
rspec spec
```

Please note that a number of tests still need to be added so I don't currently have complete coverage, subject to workload these will be slowly added over the next few months.

## Feedback
I would be more than happy to recieve feedback, please email me at: jonathan.chrisp@gmail.com.
