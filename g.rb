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


