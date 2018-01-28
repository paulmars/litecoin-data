DEBUG = true
PATH = "../litecoin/"
BINARY = "src/litecoin-cli"

def command(line)
  puts line
  result = `#{line}`
  puts result if DEBUG
end

command("#{PATH}#{BINARY} getmininginfo")
