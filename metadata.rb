name             'opsworks-custom-cookbooks'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures aws-opsworks'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt'
depends 'yum'
depends 'imagemagick'
depends 'postfix'
depends 'td-agent'
depends 'webmin'
