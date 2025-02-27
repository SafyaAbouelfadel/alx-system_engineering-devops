# Changes phpp to php in a file that caused 500 server error

exec { 'modify_file':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/bin/:/bin/',
}
