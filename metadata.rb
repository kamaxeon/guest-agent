name             'guest-agent'
maintainer       'Israel Santana'
maintainer_email 'isantana@inerza.com'
license          'All rights reserved'
description      'Installs/Configures guest-agent'
long_description 'Installs/Configures guest-agent'
version          '0.1.0'

supports 'ubuntu', '= 12.04'
supports 'ubuntu', '= 14.04'
supports 'centos', '= 5.10'
supports 'centos', '= 6.4'
supports 'centos', '= 6.5'
supports 'centos', '= 6.6'
supports 'centos', '= 7.0'

depends 'apt'
depends 'yum'
depends 'yum-epel'
depends 'selinux'

