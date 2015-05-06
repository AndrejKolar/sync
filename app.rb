#!/usr/bin/env ruby

require "rubygems"
require "bundler/setup"

require 'escort'

require './synchronize'

Escort::App.create do |app|

  app.options do |opts|
    opts.opt :server, "server", :short => '-s', :long => '--server', :type => :string, :default => "andrejkolar.synology.me"
    opts.opt :account, "account", :short => '-a', :long => '--account', :type => :string, :default => "admin"
    opts.opt :local_folder, "local folder", :short => '-l', :long => '--local', :type => :string, :default => "/Users/andrejkolar/Downloads/"
    opts.opt :remote_folder, "remote_folder", :short => '-r', :long => '--remote', :type => :string, :default => "/Watch/"
  end

  app.action do |options, arguments|
    Synchronize.start(options, arguments)
  end

end