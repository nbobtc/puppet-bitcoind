####
#
# bitcoind class
#
# Installs and configures bitcoind to run as a daemon
#
class bitcoind
{
    $repository = "git://github.com/bitcoin/bitcoin.git"
    $requires   = [
        "git",
        "build-essential",
        "libssl-dev",
        "libdb4.8-dev",
        "libboost1.48-dev",
        "libminiupnpc8",
        "libminiupnpc-dev",
    ]
    $clone_path = "/opt/bitcoin"
    $install_path = "/usr/bin"

    package { $requires:
        ensure => present,
    }

    file { $clone_path:
        ensure => directory,
    }

    exec { "git clone bitcoin":
        path      => "/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin:/usr/bin:/usr/sbin:/bin:/sbin:.",
        command   => "git clone ${repository} ${clone_path}",
        creates   => "${clone_path}/.git",
        logoutput => true
    }

    exec { "make bitcoin":
        path      => "/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin:/usr/bin:/usr/sbin:/bin:/sbin:.",
        command   => "make -f makefile.unix",
        creates   => "${clone_path}/src/bitcoind",
        cwd       => "${clone_path}/src",
        logoutput => true
    }

    exec { "copy binary":
        path      => "/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin:/usr/bin:/usr/sbin:/bin:/sbin:.",
        command   => "cp ${clone_path}/src/bitcoind ${install_path}",
        creates   => "${install_path}/bitcoind",
        logoutput => true
    }

}
