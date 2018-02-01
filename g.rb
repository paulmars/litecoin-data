require 'json'
require 'awesome_print'

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

def best_hash
  lite_cmd("getbestblockhash").rstrip
end

def block_raw(hash, verbose)
  lite_cmd("getblock \"#{best_hash}\" #{verbose}")
end

# def block(hash, verbose)
#   JSON.parse(block_raw(hash, verbose))
# end

first_block = block_raw(best_hash, 2)

