DEBUG = true
PATH = "../litecoin/"
BINARY = "src/litecoin-cli"

def command(line)
  puts line if DEBUG
  result = `#{line}`
  puts result if DEBUG
end

command("#{PATH}#{BINARY} help > ./commands")
