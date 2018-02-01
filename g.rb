require 'json'
require 'awesome_print'

DEBUG = true
PATH = "../litecoin/"
BINARY = "src/litecoin-cli"

def run_command(c)
  ap c if DEBUG
  result = `#{c}`
  # ap result if DEBUG
  result
end

def lite_cmd(c)
  run_command("#{PATH}#{BINARY} #{c}")
end

def best_hash
  lite_cmd("getbestblockhash").rstrip
end

def block(hash, verbose)
  JSON.parse(lite_cmd("getblock \"#{best_hash}\" #{verbose}"))
end

ap first_block = block(best_hash, 2)

