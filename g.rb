require 'json'
require 'awesome_print'
require 'fileutils'

DEBUG = false
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
  lite_cmd("getblock \"#{hash}\" #{verbose}")
end

BLOCK_DATA_DIR = "block_data"
FileUtils.mkdir_p(BLOCK_DATA_DIR)

block_name = best_hash

while(true) do
  puts block_name

  block_raw_data = block_raw(block_name, 2)

  block_file = File.new("#{BLOCK_DATA_DIR}/#{block_name}", 'w')
  block_file << block_raw_data
  block_file.close

  json_data = JSON.parse(block_raw_data)
  block_name = json_data["previousblockhash"]
end

