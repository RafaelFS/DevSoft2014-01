# Este arquivo é executado corretamente na sua máquina virtual (Vagrant)?
# E no servidor remoto da Infosimples?

# Se, em algum dos casos, o arquivo não puder ser executado, qual é o problema?
# Corrija o problema alterando este arquivo, se for o caso.

# Para executar no servidor remoto, executar os seguintes comandos:
# $ ssh {username}@server.devsoft.infosimples.com
# $ ruby /home/shared/ex6.2.rb

puts 'Olá, mundo!'
puts "O encoding padrão de arquivos em Ruby (versão #{RUBY_VERSION}) é #{__ENCODING__}!"

# Qual é o encoding padrão em cada versão do Ruby?
# Na versão 2.1.1 (local), o encoding padrão é UTF-8
# Na versão 1.9.3 (servidor remoto), o encoding padrão é US-ASCII