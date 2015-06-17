#!/usr/bin/env ruby
# Problem 19

=begin

  You are given the following information, but you may prefer to do some research for yourself.
  
  1 Jan 1900 was a Monday.
  Thirty days has September,
  April, June and November.
  All the rest have thirty-one,
  Saving February alone,
  Which has twenty-eight, rain or shine.
  And on leap years, twenty-nine.
  A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
  How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

=end

require 'date'

timer_start = Time.now

first = Date.new(1901,1,1)
last = Date.new(2000,12,31)

date_range = (first..last)

answer = date_range.find_all {
  |day|
  day.mday == 1 && day.wday == 0
}.count

puts "19. #{answer} (#{(Time.now - timer_start)*1000} ms)"
