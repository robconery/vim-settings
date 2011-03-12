"
" specky: syntax highlighting for the 'spec' script output
" $Id: specrun.vim 67 2009-04-20 00:57:06Z mahlon $
"

if has("folding")
  setlocal foldmethod=syntax
endif

" Command line as it was called, inserted by Specky
"
syntax match specSpeckyCmd /^Output of: .*/
highlight link specSpeckyCmd Question
"syntax match WarningMsg /\.\./

" Plain output block (...P..F...)
"
syntax region specPlain start="^[\.PF]\+" end="^$" contains=specFailedPlain,specPendingPlain
highlight link specPlain MoreMsg

" Passed specs (specdoc output)
"
syntax match specPassed /^- .*/ contains=specFailed,specPending
highlight link specPassed MoreMsg

" Pending specs (specdoc output)
"
syntax match specPending /.*PENDING: .*)$/ contained
highlight link specPending Function
"
" (Plain output)
syntax match specPendingPlain /P/ contained
highlight link specPendingPlain Function

" Failed specs (specdoc output)
"
syntax match specFailed /.*\(FAILED\|ERROR\) - \d\+)/ contained
highlight link specFailed WarningMsg
"
" (Plain output)
syntax match specFailedPlain /F/ contained
highlight link specFailedPlain WarningMsg

" Warning details
"
syntax region specFailedDetails start="^\d\+)" end="^$" fold
highlight link specFailedDetails WarningMsg

" Pending specs
"
syntax region specPendingDetails start="^Pending:" end="^$" fold
highlight link specPendingDetails Function

" Timing information
"
syntax match specTimedRun /^Finished in.*/
highlight link specTimedRun Question

" Status summary
"
syntax match specExamplesTotal /^\d\+ examples, .\+/ contains=specTotalFailed,specNoFailures,specTotalPending
highlight link specExamplesTotal Special
"
syntax match specTotalFailed /\d\+ failure\%[s]/ contained
highlight link specTotalFailed WarningMsg
"
syntax match specTotalPending /\d pending/ contained
highlight link specTotalPending Function
"
syntax match specNoFailures /0 failures/ contained
highlight link specNoFailures MoreMsg


let b:current_syntax = "specrun"

