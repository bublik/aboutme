class Pinging
  require 'xmlrpc/client'  
  require 'pp' 
  
  attr_accessor :debug
  
  def initialize(site_name, site_url, site_update_page, site_rss_url, site_tags)
    self.debug = false
    @site_name = site_name
    @site_url = site_url
    @site_update_page = site_update_page
    @site_rss_url = site_rss_url
    @site_tags = site_tags
  end

  def  ping_all
=begin
    http://www.weblogs.com/api.html
    RPC endpoint:  http://rpc.weblogs.com/RPC2
    Method name:  weblogUpdates.ping OR weblogUpdates.extendedPing
    Parameters: (should be sent in the same order as listed below)
# http://blogs.feedburner.com/feedburner/archives/000478.html
  http://ping.feedburner.com

  http://www.weblogalot.com/Ping/  - unused
  http://ping.weblogalot.com/rpc.php

  http://topicexchange.com/doc/xmlrpc  - unused
  http://topicexchange.com/RPC2

  http://www.technorati.com/developers/ping/ - unused
  http://rpc.technorati.com/rpc/ping
  http://rpc.pingomatic.com
  http://api.my.yahoo.com/RPC2
  http://ping.rootblog.com/rpc.php
  http://ping.syndic8.com/xmlrpc.php
  http://ping.weblogalot.com/rpc.php
  http://rpc.newsgator.com
  http://rcs.datashed.net/RPC2
  http://rpc.weblogs.com/RPC2
=end

    self.ping_sites.collect do |ping_site|
      server = XMLRPC::Client.new(ping_site[0],ping_site[1] , 80)
      begin
        if @site_update_page.blank? || @site_rss_url.blank? || @site_tags.blank?
          result = server.call("weblogUpdates.ping", @site_name, @site_url)
        else
          result = server.call("weblogUpdates.extendedPing", @site_name, @site_url, @site_update_page, @site_rss_url, @site_tags)
        end
        pp result.inspect if self.debug
        [ping_site[0],true,result]
      rescue Exception => e # XMLRPC::FaultException
        state = "Error: #{e.message} #{e.backtrace.inspect}"
        pp state if self.debug
        [ping_site[0],false,state]
      end      
    end
  end
  
  def ping_sites
    @ping_sites=[
      ['blogsearch.google.com', '/ping/RPC2'],
      ['ping.feedburner.com','/'],
      ['rpc.pingomatic.com','/'],
      ['rpc.weblogs.com','/RPC2'],
      ['rpc.technorati.com','/rpc/ping'],
      ['ping.blogs.yandex.ru','/RPC2'],
      ['api.feedster.com','/ping']]
    #    ['www.blogoole.com','/ping'],
    #    ['topicexchange.com','/RPC2'],
    #    ['rcs.datashed.net','/RPC2'],
    #    ['www.snipsnap.org','/RPC2'],    
    #    ['ping.rootblog.com','/rpc.php'],    
  end


  #######http://www.google.com/help/blogsearch/pinging_API.html
  #included in *ping_all* method
  #  def google
  #=begin
  # logger.debug(pserver.inspect+cname.inspect+curl.inspect+cpage.inspect+crss.inspect)
  # server_uri = URI.parse(pserver)
  # path = server_uri.path
  #    #server = XMLRPC::Client.new("blogsearch.google.com", "/ping/RPC2", 80)
  #  client = XMLRPC::Client.new(server_uri.host, path, server_uri.port)
  #    #server.call("weblogUpdates.extendedPing", 'Rubyclub.com.ua new on site','http://rubyclub.com.ua/','http://rubyclub.com.ua/messages/show/190' ,'ht
  #  result=server.call("weblogUpdates.extendedPing", cname,curl,cpage ,crss)
  #  # => {"message"=>"Thanks for the ping.", "flerror"=>false}
  #=end
  #
  #    server = XMLRPC::Client.new("blogsearch.google.com", "/ping/RPC2", 80)
  #    begin
  #      result=server.call("weblogUpdates.extendedPing", @site_name, @site_url,@site_update_page,@site_rss_url,@site_tags)
  #      pp result.inspect  if self.debug
  #      return ['google.com',true,result]
  #    rescue Exception => e # XMLRPC::FaultException
  #      state="Error: #{e.message} #{e.backtrace.inspect}"
  #      pp state if self.debug
  #      return ['google.com',false,state]
  #    end
  #
  #  end
end
