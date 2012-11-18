" java compile
map <F9> :call CompileJava()<CR>
func! CompileJava()
	:w
	:!javac "%"
endfunc
" run class
map <F10> :call RunClass()<CR>
func! RunClass()
	:!java -cp "%:p:h" "%:t:r"
endfunc
