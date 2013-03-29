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
        path    => "/usr/bin",
        command => "git clone ${repository} ${clone_path}",
        creates => "${clone_path}/.git",
    }

    exec { "make bitcoin":
        path    => "/usr/bin",
        command => "make -f makefile.unix",
        creates => "${clone_path}/src/bitcoind",
        cwd     => "${clone_path}/src",
    }

    exec { "copy binary":
        path    => "/usr/bin",
        command => "cp ${clone_path}/src/bitcoind ${install_path}",
        creates => "${install_path}/bitcoind",
    }

}
