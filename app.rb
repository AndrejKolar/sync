#!/usr/bin/env ruby

require "rubygems"
require "bundler/setup"

require 'escort'
require './sync_app'

Escort::App.create do |app|
  app.action do |options, arguments|
   # MyApp::ExampleCommand.new(options, arguments).execute
  end
end