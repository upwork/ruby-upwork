Ruby bindings for Upwork API
============

[![License](http://img.shields.io/packagist/l/upwork/php-upwork.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![Gem Version](https://badge.fury.io/rb/upwork-api.svg)](http://badge.fury.io/rb/upwork-api)
[![Build Status](https://travis-ci.org/upwork/ruby-upwork.svg)](https://travis-ci.org/upwork/ruby-upwork)
[![Stories in Ready](http://badge.waffle.io/upwork/ruby-upwork.png)](http://waffle.io/upwork/ruby-upwork)

# Upwork::Api

This project provides a set of resources of Upwork API from http://developers.upwork.com
 based on OAuth 1.0a.

# Features
These are the supported API resources:

* My Info
* Custom Payments
* Hiring
* Job and Freelancer Profile
* Search Jobs and Freelancers
* Organization
* MC
* Time and Financial Reporting
* Metadata
* Snapshot
* Team
* Workd Diary
* Activities

# License

Copyright 2015 Upwork Corporation. All Rights Reserved.

ruby-upwork is licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## SLA
The usage of this API is ruled by the Terms of Use at:

    https://developers.upwork.com/api-tos.html

# Application Integration
To integrate this library you need to have:

* Ruby >= 1.9.3
* OAuth Extension installed (use `gem install oauth`)

## Installation

Add this line to your application's Gemfile:

    gem 'upwork-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install upwork-api

## Usage

1.
Follow instructions from the `Installation` section.

2.
Open `myapp.rb` and type the `consumer_key` and `consumer_secret` that you previously got from the API Center.
***That's all. Run your app as `ruby myapp.rb` and have fun.***'
