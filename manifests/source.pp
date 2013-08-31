####
#
# Installs bitcoind from source
#
class bitcoind::source
{
    include bitcoind::params

    notify{"Starting build of bitcoind.... This may take a while": }
    notify{"NOTE:If you get an error at this stage, enlarge the swap file to 1GB. See - https://bitcointalk.org/index.php?topic=110627.0": }
    
    # 1GB SWAPFILE CODE
    #
    # sudo dd if=/dev/zero of=/swapfile bs=64M count=16
    # sudo mkswap /swapfile
    # sudo swapon /swapfile
    
    $repository = "git://github.com/bitcoin/bitcoin.git"
    $requires   = [
        "git",
        "build-essential",
        "libssl-dev",
        "libdb5.1-dev",
        "libdb++-dev",
        "libboost1.49-all-dev",
        "libboost1.49-dbg",
        "libboost-all-dev",
        "libminiupnpc5",
        "libminiupnpc-dev"
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
        logoutput => true,
        timeout   => 0,
    }

    exec { "copy binary":
        path      => "/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin:/usr/bin:/usr/sbin:/bin:/sbin:.",
        command   => "cp ${clone_path}/src/bitcoind ${install_path}",
        creates   => "${install_path}/bitcoind",
        logoutput => true
    }

}
