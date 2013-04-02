####
#
# bitcoind class
#
# Installs and configures bitcoind to run as a daemon
#
class bitcoind(
    $rpcuser     = undef,
    $rpcpassword = undef,
)
{
    include bitcoind::params

    user { 'bitcoind':
        ensure  => present,
        comment => 'Bitcoin Daemon',
        system  => true,
        shell   => '/bin/bash',
    }

    package { 'bitcoind':
        ensure => installed,
    }

    service { 'bitcoind':
        ensure    => false,
        enable    => true, # enable on boot
        path      => '/etc/init.d',
        subscribe => Package['bitcoind'],
    }

    file { "${bitcoind::params::datadir}":
        ensure => directory,
        owner  => 'root',
        group  => 'root',
    }

    file { "${bitcoind::params::datadir}/bitcoin.conf":
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        content => template('bitcoind/bitcoin.conf.erb'),
        notify  => Service['bitcoind'],
        require => [
            File[$bitcoind::params::datadir],
            Package['bitcoind'],
        ],
    }

    file { '/etc/init.d/bitcoind':
        mode    => '755',
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        content => template('bitcoind/bitcoind.erb'),
        notify  => Service['bitcoind'],
        require => Package['bitcoind'],
    }

}
