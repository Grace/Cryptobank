require 'json'
require 'httparty'
require 'cryptobank/version'
require 'cryptobank/error'

module Cryptobank # Implements Bitcoin API JSON-RPC to communicate with bitcoind

      HEADERS = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }.freeze

      attr_writer :host, :port, :user, :password

      def host
        @host || 'localhost'
      end

      def port
        @port || 8332
      end

      def user
        @user || 'rpcuser'
      end

      def password
        @password || 'rpcpassword'
      end

      def configure
        yield self
      end

      # addmultisigaddress
      def add_multisig_address(minimum_number_of_sigs, key_or_addresses, account = '')
        payload = {
          method: 'addmultisigaddress'
        }
        payload[:params] = [minimum_number_of_sigs.to_int, key_or_addresses.to_string, account.to_string]
        request(payload)
      end

      # addnode
      def add_node
        raise NotImplementedError
      end

      # backupwallet
      def backup_wallet
        raise NotImplementedError
      end

      # createmultisig
      def create_multisig
        raise NotImplementedError
      end

      # createrawtransaction
      def create_raw_transaction
        raise NotImplementedError
      end

      # decoderawtransaction
      def decode_raw_transaction
        raise NotImplementedError
      end

      # dumpprivkey
      def dump_priv_key
        raise NotImplementedError
      end

      # encryptwallet
      def encrypt_wallet
        raise NotImplementedError
      end

      # getaccount
      # A P2PKH or P2SH Bitcoin address belonging either to a specific account or the default account (“”)
      # returns a base58 string
      def account(bitcoin_address)
        payload = {
          method: 'getaccount'
        }
        payload[:params] = [bitcoin_address.to_string]
        request(payload)
      end

      # getaddednodeinfo
      def added_node_info
        raise NotImplementedError
      end

      # getbalance
      # There are additional parameters on the RPC docs to be implemented https://bitcoin.org/en/developer-reference#getbalance
      def balance(account = nil)
        payload = {
          method: 'getbalance'
        }
        payload[:params] = [account] unless account.nil?
        request(payload)
      end

      # getbestblockhash
      def best_block_hash
        raise NotImplementedError
      end

      # getblock
      def block(verbosity = nil)
        payload = {
          method: 'getblock'
        }
        payload[:params] = [template_request] unless verbosity.nil?
        request(payload)
      end

      # getblockhash
      def block_hash
        payload = {
          method: 'getblockhash'
        }
        request(payload)
      end

      # getblockcount
      def block_count
        payload = {
          method: 'getblockcount'
        }
        request(payload)
      end

      # getblocktemplate
      def block_template(template_request = nil)
        payload = {
          method: 'getblocktemplate'
        }
        payload[:params] = [template_request] unless template_request.nil?
        request(payload)
      end

      # getconnectioncount
      def connection_count
        payload = {
          method: 'getconnectioncount'
        }
        request(payload)
      end

      # getdifficulty
      def difficulty
        payload = {
          method: 'getdifficulty'
        }
        request(payload)
      end

      # getgenerate
      def generate
        payload = {
          method: 'getgenerate'
        }
        request(payload)
      end

      def get_account_addresses(account)
        payload = {
          method: 'getaddressesbyaccount'
        }
        payload[:params] = [account]
        request(payload)
      end

      # gethashespersec
      def hashes_per_sec
        raise NotImplementedError
      end

      # getinfo
      def info
        payload = {
          method: 'getwalletinfo'
        }
        request(payload)
      end

      # getmempoolinfo
      def memory_pool_info
        payload = {
          method: 'getmempoolinfo'
        }
        request(payload)
      end
    end

    # getmininginfo
    def mining_info
      payload = {
        method: 'getmininginfo'
      }
      request(payload)
    end

    # getnewaddress
    def new_address(account = nil)
      payload = {
        method: 'getnewaddress'
      }
      payload[:params] = [account] unless account.nil?
      request(payload)
    end

    # getpeerinfo
    def peer_info
      payload = {
        method: 'getpeerinfo'
      }
      request(payload)
    end

    # getrawchangeaddress
    def raw_change_address
      payload = {
        method: 'getrawchangeaddress'
      }
      request(payload)
    end

    # getrawmempool
    def raw_mem_pool(verbose_format = false)
      payload = {
        method: 'getrawmempool'
      }
      payload[:params] = [1] if verbose_format?
      request(payload)
    end

    # getrawtransaction
    # The TXID of the transaction to get, encoded as hex in RPC byte order
    def raw_transaction(txid)
      payload = {
        method: 'getrawtransaction'
      }
      payload[:params] = [txid]
      request(payload)
    end

    # getreceivedbyaddress
    '''The getreceivedbyaddress RPC returns the total amount received by the specified address in transactions with the specified number of confirmations. It does not count coinbase transactions.'''
    def received_by_address(address)
      payload = {
        method: 'getreceivedbyaddress'
      }
      payload[:params] = [address]
      request(payload)
    end

    # gettransaction
    def transaction(txid)
      payload = {
        method: 'gettransaction',
        params: [txid]
      }

      request(payload)
    end

    # gettxout
    def tx_out
      raise NotImplementedError
    end

    # gettxoutsetinfo
    def tx_out_set_info
      raise NotImplementedError
    end

    # getwork
    def work
      raise NotImplementedError
    end

    # help
    def help
      raise NotImplementedError
    end

    # importprivkey
    def import_priv_key
      raise NotImplementedError
    end

    # keypoolrefill
    def keypool_refill
      raise NotImplementedError
    end

    # listaccounts
    def list_accounts(minconf = nil)
      payload = {
        method: 'listaccounts'
      }

      payload[:params] = [minconf] unless minconf.nil?

      request(payload)
    end

    # listaddressgroupings
    def list_address_groupings
      raise NotImplementedError
    end

    # listreceivedbyaccount
    def list_received_by_account
      raise NotImplementedError
    end

    # listreceivedbyaddress
    def list_received_by_address
      raise NotImplementedError
    end

    # listsinceblock
    def list_since_block
      raise NotImplementedError
    end

    # listtransactions
    def list_transactions(account = nil, count = nil, from = nil)
      payload = {
        method: 'listtransactions'
      }
      unless account.nil?
        payload[:params] = [account]
        payload[:params] << count unless count.nil?
        payload[:params] << from unless from.nil?
      end
      request(payload)
    end

    # listunspent
    def list_unspent
      raise NotImplementedError
    end

    # listlockunspent
    def list_lock_unspent
      raise NotImplementedError
    end

    # lockunspent
    def lock_unspent
      raise NotImplementedError
    end

    # move
    def move
      raise NotImplementedError
    end

    # sendfrom
    def send_from
      raise NotImplementedError
    end

    # sendmany
    def send_many
      raise NotImplementedError
    end

    # sendrawtransaction
    def send_raw_transaction
      raise NotImplementedError
    end

    # sendtoaddress
    def send_to_address(address, amount, comment = nil, comment_to = nil)
      payload = {
        method: 'sendtoaddress',
        params: [address, amount]
      }
      payload[:params] << comment unless comment.nil?
      payload[:params] << comment_to unless comment_to.nil?
      request(payload)
    end

    # setaccount
    def account=(_)
      raise NotImplementedError
    end

    # setgenerate
    def generate=(_)
      raise NotImplementedError
    end

    # settxfee
    def tx_fee=(_)
      raise NotImplementedError
    end

    # signmessage
    def sign_message
      raise NotImplementedError
    end

    # signrawtransaction
    def sign_raw_transaction
      raise NotImplementedError
    end

    # stop
    def stop
      raise NotImplementedError
    end

    # submitblock
    def submit_block
      raise NotImplementedError
    end

    # validateaddress
    def validate_address(address)
      payload = {
        method: 'validateaddress',
        params: [address]
      }

      request(payload)
    end

    # verifymessage
    def verify_message
      raise NotImplementedError
    end

    # walletlock
    def wallet_lock
      raise NotImplementedError
    end

    # walletpassphrase
    def wallet_passphrase
      raise NotImplementedError
    end

    # walletpassphrasechange
    def wallet_passphrase_change
      raise NotImplementedError
    end

    def valid_address?(address)
      validate_address(address)['isvalid']
    end

    private

    def request(payload)
      response = HTTParty.post(url, body: payload.to_json, headers: HEADERS)
      raise Error, response.message unless response.code == 200
      JSON.parse(response.body)['result']
    end

    def url
      "http://#{user}:#{password}@#{host}:#{port}"
    end
  # end
end
