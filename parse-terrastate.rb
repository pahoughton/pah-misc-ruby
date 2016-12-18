#!/usr/bin/env ruby
# 2016-12-12 (cc) <paul4hough@gmail.com>
#
require 'json'
require 'yaml'

jdata = JSON.parse(File.read(File.join(ENV['HOME'],'terraform.tfstate')))
jdata['modules'].each { |mod|
  #puts mod.to_yaml
  if mod['resources']
    #puts "res:#{resources}"
    mod['resources'].each { |res,opts|
      num  = res.sub('openstack_compute_instance_v2.pcecompute.','')
      uuid = opts['primary']['id']
      ip   = opts['primary']['attributes']['access_ip_v4']
      puts "num: #{num}\n  ip:#{ip}\n  uuid:#{uuid}"+opts.to_yaml
    }
  end
}

# puts jdata.to_yaml
