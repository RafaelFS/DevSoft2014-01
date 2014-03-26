
if [ "$1" = "grep" ]; then
	echo "Acha um certo padrao textual no arquivo"
elif [ "$1" = "ls" ]; then
	echo "Lista todo o conteudo do diretorio atual"
elif [ "$1" = "ln" ]; then
	echo "Cria um link (um atalho) entre arquivos "
elif [ "$1" = "pwd" ]; then
	echo "Imprime o diretorio atual"
elif [ "$1" = "chmod" ]; then
	echo "Modifica as permissoes do arquivo (quem pode ver, editar e executar o arquivo"
elif [ "$1" = "cat" ]; then
	echo "Concatena um arquivo e o envia para o standard output"
elif [ "$1" = "tail" ]; then
	echo "Imprime as ultimas linhas de um arquivo. A quantidade de linhas pode ser modificada"
elif [ "$1" = "head" ]; then
	echo "Imprime as ultimas linhas de um arquivo. A quantidade de linhas pode ser modificada"
elif [ "$1" = "sort" ]; then
	echo "Organiza as linhas de um arquivo texto"
elif [ "$1" = "rm" ]; then
	echo "Remove o arquivo ou diretorio desejado"
fi
