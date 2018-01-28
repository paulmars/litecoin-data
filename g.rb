DEBUG = true
PATH = "../litecoin/"
BINARY = "src/litecoin-cli"

def run_command(c)
  puts c if DEBUG
  result = `#{c}`
  puts result if DEBUG
  result
end

def run_litecoin_command(c)
  run_command("#{PATH}#{BINARY} #{c}")
end

commands = File.new("commands", "r")
commands.each do |line|
  line = line.rstrip
  next if line[0] == '='
  next if line == ""
  command = line.split(" ")[0]

  next if command == "gettxoutsetinfo"

  result = run_litecoin_command(command)
  next if result == ""
  output = File.new("./examples/#{command}", 'w')
  output << result
  output.close
end
