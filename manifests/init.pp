class qa-apache {
        package { 'apache2' :
                ensure => 'present',
        }

        file { '/var/www':
                ensure => directory,
        }

        file { '/etc/apache2/apache2.conf':
                ensure => file,
                owner => 'root',
                group => 'root',
                source => 'puppet:///modules/qa-apache/apache2.conf',
                require =>Package['apache2'],
        }

        file { '/var/www/html/index.html':
                ensure => file,
                source => 'puppet:///modules/qa-apache/index.html',
        }

        service { 'apache2':
                ensure => running,
                subscribe => File['/etc/apache2/apache2.conf'],
        }
}

