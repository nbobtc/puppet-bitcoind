####
#
# These are all the parameters that bitcoind
# will use
#
# Reference
#   * https://en.bitcoin.it/wiki/Running_bitcoind
#
class bitcoind::params
{

    # Specify configuration file (default: bitcoin.conf)
    $conf = 'bitcoin.conf'

    # Specify pid file (default: bitcoind.pid)
    $pid_file = '/var/run/bitcoin.pid'

    # Generate or not to generate coins
    $geneate = false

    # Specify data directory
    $datadir = '/etc/bitcoin'

    # Set database cache size in megabytes (default: 25)
    $dbcache = 25

    # Specify connection timeout in milliseconds (default: 5000)
    $timeout = 5000

    # Connect through socks proxy
    $proxy = false

    # Select the version of socks proxy to use (4-5, default: 5)
    $socks = 5

    # Use proxy to reach tor hidden services (default: same as -proxy)
    $tor = false

    # Allow DNS lookups for -addnode, -seednode and -connect
    $dns = false

    # Listen for connections on <port> (default: 8333 or testnet: 18333)
    $port = 8333

    # Maintain at most <n> connections to peers (default: 125)
    $maxconnections = 125

    # Add a node to connect to and attempt to keep the connection open
    $addnode = []

    # Connect only to the specified node(s)
    $connect = []

    # Connect to a node to retrieve peer addresses, and disconnect
    $seednode = []

    # Specify your own public address
    $externalip = false

    # Only connect to nodes in network <net> (IPv4, IPv6 or Tor)
    $onlynet = 'IPv4'

    # Discover own IP address (default: 1 when listening and no -externalip)
    $discover = true

    # Find peers using internet relay chat (default: 0)
    $irc   = false
    $noirc = true

    # Only accept block chain matching built-in checkpoints (default: 1)
    $checkpoints = true

    # Accept connections from outside (default: 1 if no -proxy or -connect)
    $listen = true

    # Bind to given address and always listen on it. Use [host]:port notation for IPv6
    $bind = false

    # Find peers using DNS lookup (default: 1 unless -connect)
    $dnsseed = true

    # Threshold for disconnecting misbehaving peers (default: 100)
    $banscore = 100

    # Number of seconds to keep misbehaving peers from reconnecting (default: 86400)
    $bantime = 86400

    # Maximum per-connection receive buffer, <n>*1000 bytes (default: 5000)
    $maxreceivebuffer = 5000

    # Maximum per-connection send buffer, <n>*1000 bytes (default: 1000)
    $maxsendbuffer = 1000

    # Fee per KB to add to transactions you send
    $paytxfee = 0.00

    # Use the test network
    $testnet = false

    # Output extra debugging information. Implies all other -debug* options
    $debug = false

    # Output extra network debugging information
    $debugnet = false

    # Prepend debug output with timestamp
    $logtimestamps = true

    # Shrink debug.log file on client startup (default: 1 when no -debug)
    $shrinkdebugfile = true
    
    # Send trace/debug info to console instead of debug.log file
    $printtoconsole = false
    
    # Username for JSON-RPC connections
    $rpcuser = false
    
    # Password for JSON-RPC connections
    $rpcpassword = false
    
    # Listen for JSON-RPC connections on <port> (default: 8332 or testnet: 18332)
    $rpcport = 8332
    
    # Allow JSON-RPC connections from specified IP address
    $rpcallowip = []
    
    # Send commands to node running on <ip> (default: 127.0.0.1)
    $rpcconnect = '127.0.0.1'

    $rpctimeout = 30
    
    # Execute command when the best block changes (%s in cmd is replaced by block hash)
    $blocknotify = false
    
    # Execute command when a wallet transaction changes (%s in cmd is replaced by TxID)
    $walletnotify = false
    
    # Upgrade wallet to latest format
    $upgradewallet = false
    
    # Set key pool size to <n> (default: 100)
    $keypool = 100
    
    # Rescan the block chain for missing wallet transactions
    $rescan = false
    
    # Attempt to recover private keys from a corrupt wallet.dat
    $salvagewallet = false
    
    # How many blocks to check at startup (default: 288, 0 = all)
    $checkblocks = 288
    
    # How thorough the block verification is (0-4, default: 3)
    $checklevel = 3
    
    # Maintain a full transaction index (default: 0)
    $txindex = false
    
    # Imports blocks from external blk000??.dat file
    $loadblock = false
    
    # Rebuild blockchain index from current blk000??.dat files
    $reindex = false

    # Set the number of script verification threads (1-16, 0=auto, default: 0)
    $par = 0

}
