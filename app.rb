#!/usr/bin/env ruby

require "rubygems"
require "bundler/setup"

require 'escort'

require './synchronize'

Escort::App.create do |app|
  app.version "1.0.0"
  app.summary "Sync"
  app.description "Fast folder sync via ftp from the command line"
  app.config_file ".sync_config", :autocreate => true

  app.options do |opts|
    opts.opt :server, "server", :short => '-s', :long => '--server', :type => :string, :default => "CHANGE_DEFAULT"
    opts.opt :account, "account", :short => '-a', :long => '--account', :type => :string, :default => "CHANGE_DEFAULT"
    opts.opt :local_folder, "local folder", :short => '-l', :long => '--local', :type => :string, :default => "CHANGE_DEFAULT"
    opts.opt :remote_folder, "remote_folder", :short => '-r', :long => '--remote', :type => :string, :default => "CHANGE_DEFAULT"
    opts.opt :extension, "extension", :short => '-e', :long => '--extension', :type => :string, :default => "CHANGE_DEFAULT"
  end

  app.action do |options, arguments|
    Synchronize.start(options, arguments)
  end

end
