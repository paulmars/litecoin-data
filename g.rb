DEBUG = true

def command(line)
  result = `#{line}`
  puts result if DEBUG
end

command('./src/litecoin-cli getmininginfo')
