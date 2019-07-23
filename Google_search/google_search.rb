require 'launchy'

def check_if_user_gave_input
  abort("search: missing input") if ARGV.empty?
end

def make_url
   search_input = "https://www.google.com/search?q=#{ARGV.join("+")}"
   return search_input
end


def search(make_url)
  Launchy.open(make_url)
end


def perform
check_if_user_gave_input
search(make_url)
end

perform