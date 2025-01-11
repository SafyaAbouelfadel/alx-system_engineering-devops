#install flack from pip3 using puppet

package {'install_flask':
ensure   => '2.1.0',
name     => 'flask'    ,
provider => pip3,
}


package {'install_werkzeug':
ensure   => '2.1.1',
name     => 'Werkzeug'    ,
provider => pip3,
}
