Bitcoind
========

## Description

This module will manage the requirements for installing and keeping bitcoin up
to date.

## Usage

You must include either the source or the ppa builds. I recommend the ppa build
as building from source takes longer and is still a little janky.

    class { 'bitcoind::ppa': }

You will need to install this on ubuntu, I will try to add more ways at a later
date, but for right now I'm trying to get this up and running for use in my projects

Next you will need to include the class itself with some parameters.

    class { 'bitcoind':
        testnet     => true,
        rpcuser     => 'really_long_username',
        rpcpassword => 'no_short_password_here',
    }
