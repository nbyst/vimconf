let [s:i,s:t]=[0,system("curl -L -s http://hackertyper.net/text.txt")]
fun! s:hacker_typing()
	let c=s:t[s:i]
	let s:i=s:i+1
	retu c
endfun
new|on!|setl ft=c noci noai nosi cink= |imapc
for c in range(1,255)|exe "inoremap <buffer> <expr> <char-".c."> <SID>hacker_typing()"|endfor
star!
