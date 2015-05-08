#!/usr/bin/env ruby

require "rubygems"
require "bundler/setup"

require 'escort'

require './synchronize'

Escort::App.create do |app|
  app.version "1.0.0"
  app.summary "Sync"
  app.description "Fast folder sync via ftp"
  app.config_file ".sync_config", :autocreate => true

  app.options do |opts|
    opts.opt :server, "server", :short => '-s', :long => '--server', :type => :string, :default => "andrejkolar.synology.me"
    opts.opt :account, "account", :short => '-a', :long => '--account', :type => :string, :default => "admin"
    opts.opt :local_folder, "local folder", :short => '-l', :long => '--local', :type => :string, :default => "/Users/andrejkolar/Downloads/"
    opts.opt :remote_folder, "remote_folder", :short => '-r', :long => '--remote', :type => :string, :default => "/Watch/"
    opts.opt :extension, "extension", :short => '-e', :long => '--extension', :type => :string, :default => ".torrent"
  end

  app.action do |options, arguments|
    Synchronize.start(options, arguments)
  end

end