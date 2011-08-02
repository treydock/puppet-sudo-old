class sudo::base {

  package {"sudo":
    ensure => installed,
  }

  file {"/etc/sudoers":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 440,
	content => template("sudo/sudoers.erb"),
  }

    #
    # Use the #includedir directive to manage sudoers.d, version >= 1.7.2
    # 
    file {"/etc/sudoers.d":
      ensure  => directory,
      owner   => root,
      group   => root,
      mode    => 755,
      purge   => true,
      recurse => true,
    }

}
