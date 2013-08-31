####
#
# bitcoind class
#
# Installs and configures bitcoind to run as a daemon
#
class bitcoind(
    $conf             = $bitcoind::params::conf,
    $pid_file         = $bitcoind::params::pid_file,
    $geneate          = $bitcoind::params::generate,
    $datadir          = $bitcoind::params::datadir,
    $dbcache          = $bitcoind::params::dbcache,
    $timeout          = $bitcoind::params::timeout,
    $proxy            = $bitcoind::params::proxy,
    $socks            = $bitcoind::params::socks,
    $tor              = $bitcoind::params::tor,
    $dns              = $bitcoind::params::dns,
    $port             = $bitcoind::params::port,
    $maxconnections   = $bitcoind::params::maxconnections,
    $addnode          = $bitcoind::params::addnode,
    $connect          = $bitcoind::params::connect,
    $seednode         = $bitcoind::params::seednode,
    $externalip       = $bitcoind::params::externalip,
    $onlynet          = $bitcoind::params::onlynet,
    $discover         = $bitcoind::params::discover,
    $irc              = $bitcoind::params::irc,
    $noirc            = $bitcoind::params::noirc,
    $checkpoints      = $bitcoind::params::checkpoints,
    $listen           = $bitcoind::params::listen,
    $bind             = $bitcoind::params::bind,
    $dnsseed          = $bitcoind::params::dnsseed,
    $banscore         = $bitcoind::params::banscore,
    $bantime          = $bitcoind::params::bantime,
    $maxreceivebuffer = $bitcoind::params::maxreceivebuffe,
    $maxsendbuffer    = $bitcoind::params::maxsendbuffer,
    $paytxfee         = $bitcoind::params::paytxfee,
    $testnet          = $bitcoind::params::testnet,
    $debug            = $bitcoind::params::debug,
    $debugnet         = $bitcoind::params::debugnet,
    $logtimestamps    = $bitcoind::params::logtimestamps,
    $shrinkdebugfile  = $bitcoind::params::shrinkdebugfile,
    $printtoconsole   = $bitcoind::params::printtoconsole,
    $rpcuser          = $bitcoind::params::rpcuser,
    $rpcpassword      = $bitcoind::params::rpcpassword,
    $rpcport          = $bitcoind::params::rpcport,
    $rpcallowip       = $bitcoind::params::rpcallowip,
    $rpcconnect       = $bitcoind::params::rpcconnect,
    $rpctimeout       = $bitcoind::params::rpctimeout,
    $blocknotify      = $bitcoind::params::blocknotify,
    $walletnotify     = $bitcoind::params::walletnotify,
    $upgradewallet    = $bitcoind::params::upgradewallet,
    $keypool          = $bitcoind::params::keypool,
    $rescan           = $bitcoind::params::rescan,
    $salvagewallet    = $bitcoind::params::salvagewallet,
    $checkblocks      = $bitcoind::params::checkblocks,
    $checklevel       = $bitcoind::params::checklevel,
    $txindex          = $bitcoind::params::txindex,
    $loadblock        = $bitcoind::params::loadblock,
    $reindex          = $bitcoind::params::reindex,
    $par              = $bitcoind::params::par,
)
{
    include bitcoind::params

    user { 'bitcoind':
        ensure  => present,
        comment => 'Bitcoin Daemon',
        system  => true,
        shell   => '/bin/bash',
    }

    service { 'bitcoind':
        ensure    => true,
        enable    => true, # enable on boot
        path      => '/etc/init.d'
    }

    file { "${bitcoind::params::datadir}":
        ensure => directory,
        owner  => 'root',
        group  => 'root',
        mode   => '0600',
    }

    file { "${bitcoind::params::datadir}/bitcoin.conf":
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        content => template('bitcoind/bitcoin.conf.erb'),
        notify  => Service['bitcoind'],
        require => [
            File[$bitcoind::params::datadir],
        ],
    }

    file { '/etc/init.d/bitcoind':
        mode    => '755',
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        content => template('bitcoind/bitcoind.erb'),
        notify  => Service['bitcoind'],
    }

}
