DEBUG = true
PATH = "../litecoin/"
BINARY = "src/litecoin-cli"

def command(line)
  puts line if DEBUG
  result = `#{line}`
  puts result if DEBUG
end

command("#{PATH}#{BINARY} getinfo")

commands = File.new("commands", "r")
commands.each do |line|
  line = line.rstrip
  next if line[0] == '='
  next if line == ""
  puts line
end
