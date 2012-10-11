# -*- coding: utf-8 -*-
require 'json'
require 'net/http'
require 'singleton'

module FacilitiesHelper

  class FacilityParser

    def parse
      resp = Net::HTTP.get_response(URI.parse(@url))
      data = JSON.parse(resp.body)

      process data
    end

    def process(data)
    end

    def newFacility(name, fac_type, addr, tel, lat, lon)
      a = Facility.new
      a[:name] = name
      a[:fac_type] = fac_type
      a[:addr] = addr
      a[:tel] = tel
      a[:lat] = lat
      a[:lon] = lon
      return a
    end

    def get_coord(tw_address, iter=1)
      args = "/maps/api/geocode/json?address=" + URI::encode(tw_address) + "&sensor=false"
      response = Net::HTTP.get_response("maps.googleapis.com",args)
      begin
        json = JSON.parse(response.body)
        coord = json["results"][0]["geometry"]["location"]

        return coord["lat"], coord["lng"]

      rescue => ex
        puts "#{tw_address}: #{ex.message} attempt:#{iter}"
        unless iter > 4        # retry after 1 sec, maximum of 5 retries
          sleep 1
          get_coord(tw_address, iter+1)
        end
      end
    end
  end

  class SportCenterParser < FacilityParser
    include Singleton

    def initialize
      @url = "http://data.taipei.gov.tw/opendata/apply/json/NUFCMDM1OUUtRjNBQS00ODMxLUJCMzgtOTc1N0JERTkyMTEy"
    end

    def process(data)
      data.select {|x| x["addr"].size > 5 }.collect do |x|
        lat, lon = get_coord(x["addr"])
        newFacility(x["name"], "Sport", x["addr"], x["tel"], lat, lon)
      end
    end
  end

  class SchoolParser < FacilityParser
    include Singleton

    def initialize
      @url = "http://data.taipei.gov.tw/opendata/apply/json/NzYzQUQ1NzUtRjQzMC00QTJBLUEwRjYtNjg0OTIyQTJDM0FF"
    end

    def process(data)
      data.collect do |x|
        lat, lon = get_coord(x["school_addr"])
        newFacility(x["school_name"], "School", x["school_addr"], "0000", lat, lon)
      end
    end
  end

  class HospitalParser < FacilityParser
    include Singleton

    def initialize
      @url = "http://data.taipei.gov.tw/opendata/apply/json/MjQyOTI0NTctNjk4OC00MzYxLUFDNjgtREJGQkZEMDYxRkQ3"
    end

    def process(data)
      data.collect do |x|
        fac_type = x["name"].include?("消防") ? "FireStation" : "Hospital"
        lat, lon = get_coord(x["poi_addr"])
        newFacility(x["name"], fac_type, x["poi_addr"], x["tel"], lat, lon)
      end
    end
  end

  class PoliceParser < FacilityParser
    include Singleton

    def initialize
      @url = "http://data.taipei.gov.tw/opendata/apply/json/NDdDMjFGMTEtQTI3OC00Qzg2LUJFQzAtMTg1QTMwMEQ1MjI2"
    end

    def process(data)
      data.select {|x| x["poi_addr"].size > 8 }.collect do |x|
        lat, lon = get_coord(x["poi_addr"])
        newFacility(x["name"], "Police", x["poi_addr"], "0000", lat, lon)
      end
    end
  end
end
