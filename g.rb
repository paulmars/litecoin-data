DEBUG = true
PATH = "../litecoin/"
BINARY = "src/litecoin-cli"

def run_command(c)
  puts c if DEBUG
  result = `#{c}`
  puts result if DEBUG
  result
end

def lite_cmd(c)
  run_command("#{PATH}#{BINARY} #{c}")
end

def block_header(hash)
  lite_cmd("getblockheader #{hash}")
end

def best_hash
  lite_cmd("getbestblockhash")
end

def best_header
  lite_cmd("getblockheader #{best_hash} true")
end

def best_block
  lite_cmd("getblock #{best_hash} true")
end

def block(hash, verbose)
  lite_cmd("getblock \"#{best_hash}\" #{verbose}")
end

# ./src/litecoin-cli getblock 9e139098833a67e2fb58f76f08d84ccda7cde5170060d8d21083fedd91e52b70 1
# ./src/litecoin-cli getblock 9e139098833a67e2fb58f76f08d84ccda7cde5170060d8d21083fedd91e52b70 2

first_block = block(best_hash, 2)
