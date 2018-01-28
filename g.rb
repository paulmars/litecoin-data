DEBUG = true

def command(line)
  result = `#{line}`
  puts result if DEBUG
end

command('../litecoin/src/litecoin-cli getmininginfo')
