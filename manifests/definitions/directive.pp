define sudo::directive (
  $ensure=present,
  $content="",
  $source=""
) {

  # sudo skipping file names that contain a "."
  $dname = regsubst($name, '\.', '-', 'G')

    file {"/etc/sudoers.d/${dname}":
      ensure  => $ensure,
      owner   => root,
      group   => root,
      mode    => 0440,
      content => $content ? {
        ""      => undef,   
        default => $content,
      },
      source  => $source ? {
        ""      => undef,  
        default => $source,
      },
      require => Package["sudo"],
    }
}
