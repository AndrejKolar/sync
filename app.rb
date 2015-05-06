#!/usr/bin/env ruby

require "rubygems"
require "bundler/setup"

require 'escort'

require './sync_app'

Escort::App.create do |app|

  app.options do |opts|
    opts.opt :option1, "Option1", :short => '-o', :long => '--option1', :type => :string, :default => "option 1"
  end

  app.action do |options, arguments|
    Synchronize.start(options, arguments)
  end

end