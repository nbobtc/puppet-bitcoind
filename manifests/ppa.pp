####
#
# This will install bitcoind with the ppa repository
#
class bitcoind::ppa
{
    include bitcoind::params

    ####
    #
    # ppa repository
    #
    $repository = "ppa:bitcoin/bitcoin"

    ####
    #
    # Add ppa repository
    #
    exec { "add-apt-repository ppa:bitcoin/bitcoin":
        path      => "/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin:/usr/bin:/usr/sbin:/bin:/sbin:.",
        command   => "add-apt-repository -y ${repository}",
        logoutput => true,
        notify    => Exec['update apt-get for bitcoin'],
    }

    exec { "update apt-get for bitcoin": 
        path      => "/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin:/usr/bin:/usr/sbin:/bin:/sbin:.",
        command   => "apt-get update",
        logoutput => false,
        require   => Exec['add-apt-repository ppa:bitcoin/bitcoin'],
    }

    package { "python-software-properties":
        ensure  => present,
        before  => Exec["add-apt-repository ppa:bitcoin/bitcoin"]
    }

}
