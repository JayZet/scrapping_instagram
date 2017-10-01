require 'watir'
require 'pry'
require 'rb-readline'
require 'awesome_print'
require 'selenium-webdriver'
require_relative 'credentials'

username = $username
password = $password
like_counter = 0
num_of_rounds = 0
MAX_LIKES = 100

browser = Watir::Browser.new :chrome, switches: ['--incognito']
browser.goto "instagram.com/accounts/login"

ap "Masuk achh"
browser.text_field(:name => "username").set "#{username}"
browser.text_field(:name => "password").set "#{password}"

# klik tombol login

browser.button(:class => '_qv64e _gexxb _4tgw8 _njrw0').click
sleep(2)

while true

  5.times do |i|
    browser.driver.execute_script("window.scrollBy(0,document.body.scrollHeight)")
    sleep(3)
  end
  if browser.span(:class => "coreSpriteHeartOpen" ).exists?
    browser.spans(:class => "coreSpriteHeartOpen").each {|val|
      val.click
      like_counter += 1
  }
  ap "foto yang di like #{like_counter}"

  else
    ap "gada yang bisa di like, maaf :("
  end

  num_of_rounds += 1

  puts "=====#{like_counter / num_of_rounds} like per round (on avaerage)"
  break if like_counter >= MAX_LIKES
  sleep(30)
end


Pry.start(binding)