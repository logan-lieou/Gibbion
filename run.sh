case $1 in
	'build')
		lex ./src/apelang.l
		mv ./lex.yy.c ./lex/lex.yy.c
		cc ./lex/lex.yy.c -ll && mv ./a.out ./build/out
	;;
	'test')
		./build/out < ./test/file.txt
	;;
esac
