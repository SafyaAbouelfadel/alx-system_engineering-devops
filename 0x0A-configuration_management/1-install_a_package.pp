#install flack from pip3 using puppet

package { 'Python3.8':
   ensure   => '3.8.10',
   provider => 'pip3',
}

package { 'Flack':
   ensure   => '2.1.0',
   provider => 'pip3',
}

package { 'Werkzeug':
   ensure   => '2.1.1',
   provider => 'pip3',
   require  => Package['Flask'],
}
