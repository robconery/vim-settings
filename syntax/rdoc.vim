"
" specky: syntax highlighting for 'rdoc' output
" $Id: rdoc.vim 46 2008-08-12 16:24:10Z mahlon $


" Separator lines
"
syntax match rdocSpeckyLines /^------\+\s\?/ contains=rdocSpeckyTarget,rdocSpeckyMultiples
highlight link rdocSpeckyLines Comment

" The class/method that we're reading
"
syntax match rdocSpeckyTarget / .\+/hs=s+1 contained
highlight link rdocSpeckyTarget Underlined

" When there are multiple matches to choose from.
" This is only output by fri.
"
syntax match rdocSpeckyMultiples / Multiple choices/hs=s+1 contained
highlight link rdocSpeckyMultiples WarningMsg

" Secondary headers
"
syntax region rdocSpeckyHeader start="^\S\+.\+:$\n-\+" end="-$" keepend contains=rdocSpeckyHeaderLine
highlight link rdocSpeckyHeader Question

" Secondary header lines
"
syntax match rdocSpeckyHeaderLine /^-\+$/ contained 
highlight link rdocSpeckyHeaderLine NonText

" Remove the formatting characters from the display
"
highlight link rdocSpeckySpecials NonText

" _word_ --> italic
"
syntax region rdocSpeckyItalic matchgroup=rdocSpeckySpecials start=" _" end="_"
highlight link rdocSpeckyItalic Special

" *word* --> bold
"
syntax region rdocSpeckBold matchgroup=rdocSpeckySpecials start=" \*" end="\*"
highlight link rdocSpeckyBold Constant

" +word+ --> typewriter
"
syntax region rdocSpeckyType matchgroup=rdocSpeckySpecials start=" +" end="+"
highlight link rdocSpeckyType Identifier

let b:current_syntax = "rdoc"

