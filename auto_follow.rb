require 'watir'
require 'pry'
require 'rb-readline'
require 'awesome_print'

require_relative 'credentials'

username = $username
password = $password

users = ["justinbieber", "awkarin", "rezaoktovian"]

# buka browser, kemudian login ke instagram
browser = Watir::Browser.new :chrome, switches: ['--incognito']
browser.goto "instagram.com/accounts/login"

# mengisi form username dan password, injek info
ap "Masuk achh"
browser.text_field(:name => "username").set "#{username}"
browser.text_field(:name => "password").set "#{password}"

# klik tombol login

browser.button(:class => '_qv64e _gexxb _4tgw8 _njrw0').click
sleep(2)
# jika tidak follow, maka akan memfollow
while true
  users.each { |val|
    # mengarah ke halaman user 
    browser.goto "instagram.com/#{val}/"
    if browser.button(:class => '_qv64e _gexxb _r9b8f _njrw0').exists?
      ap "Mengikuti #{val}"
      browser.button(:class => '_qv64e _gexxb _r9b8f _njrw0').click

    elsif browser.button(:class => '_qv64e _t78yp _r9b8f _njrw0').exists?
     ap "Batal mengikuti #{val}"
      browser.button(:class => '_qv64e _t78yp _r9b8f _njrw0').click
    end
  }
  puts "===============#{Time.now}=============="
  sleep(30)
end

Pry.start(binding)
