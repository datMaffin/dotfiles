" reset to default highlight options
highlight clear

" reset highlighting (help: syntax-reset)
if exists("syntax_on")
    syntax reset
endif

" set the color scheme name
let colors_name = "bionik"

" common highlighting groups:
"
" From: sbf5.com
" | Key     | Possible Values           |
" |---------|---------------------------|
" | term    | bold, underline, reverse, |
" |---------| italic, none              |
" | cterm   |                           | 
" |---------|                           |
" | gui     |                           |
" |---------|---------------------------|
" | ctermfg | red, yellow, green, blue, |
" |---------| magenta, cyan, white,     |
" | ctermbg | black, gray               |
" |---------|---------------------------|
" | guifg   | All of the above colors,  |
" |---------| plus many more; you may   |
" | guibg   | also use the #rrggbb      |
"
" Somehow bold: see (:help cterm-colors)
" boldness in cterm and gui after the colors (because of reasons)

"                   term            ctermfg             ctermbg             guifg           guibg           cterm           gui
" Syntax (:help group-name)
hi Comment                          ctermfg=DarkGreen                       guifg=#30A030           

if &background == "dark"
    hi Normal                                                               guifg=#FFFFFF   guibg=#1E201E
    hi Constant     term=bold       ctermfg=LightGray                       guifg=#C0C0C0                   cterm=bold      gui=bold
    hi Identifier                   ctermfg=LightGray                       guifg=#C0C0C0
    hi Statement                    ctermfg=DarkBlue                        guifg=#7070E0                   cterm=bold      gui=bold
else
    hi Normal                                                                               guibg=#FFFFFF
    hi Constant                     ctermfg=Black                           guifg=#000000                   cterm=bold      gui=bold
    hi Identifier                   ctermfg=Black                           guifg=#000000
    hi Statement                    ctermfg=DarkBlue                        guifg=#0000C0                   cterm=bold      gui=bold
endif

hi PreProc                          ctermfg=DarkYellow                      guifg=#B0B000
hi Type             term=bold       ctermfg=DarkCyan                        guifg=#20A0A0                   cterm=bold      gui=bold 
hi Special                          ctermfg=DarkMagenta                     guifg=#C000C0
hi Underlined       term=underline                                                                          cterm=underline gui=underline
hi Error                            ctermfg=LightGray   ctermbg=DarkRed     guifg=#C0C0C0   guibg=#E02020
hi String                           ctermfg=DarkRed                         guifg=#E02020
hi Character                        ctermfg=DarkRed                         guifg=#E02020
hi Number                           ctermfg=DarkRed                         guifg=#E02020

" Vim features (:help highlight-groups) or (:help hl-...)
if &background == "dark"
    hi LineNr                       ctermfg=LightGray   ctermbg=Black       guifg=#C0C0C0   guibg=#000000
    hi CursorLineNr                 ctermfg=White                           guifg=#FFFFFF
    hi ColorColumn                                      ctermbg=LightGray                   guibg=#504040   

    hi Visual                                                                               guibg=#000000                   gui=reverse
else
    hi LineNr                       ctermfg=Black       ctermbg=LightGray   guifg=#000000   guibg=#C0C0C0
    hi CursorLineNr                 ctermfg=Black                           guifg=#000000
    hi ColorColumn                                      ctermbg=LightGray                   guibg=#C0C0C0   

    hi Visual                                                                               guibg=#FFFFFF                   gui=reverse
endif

hi IncSearch        term=reverse                                                                            cterm=reverse   gui=reverse
hi Folded                           ctermfg=Black       ctermbg=DarkCyan    guifg=#000000   guibg=#008080
hi FoldColumn                       ctermfg=LightGray   ctermbg=DarkCyan    guifg=#C0C0C0   guibg=#008080
hi Search                                               ctermbg=LightGray                   guibg=#C0C0C0
hi Directory                                                                guifg=#7070E0

if &background == "dark"
    " pretty much random stuff which was not easy to spot in a dark environment in
    " :hi
    hi StatusLine                   ctermfg=LightGray                                                       cterm=reverse,bold
    hi StatusLineNC                 ctermfg=LightGray
    hi ModeMsg                      ctermfg=LightGray
    hi VisualNOS                    ctermfg=LightGray
    hi PmenuSel                     ctermfg=LightGray
    hi Pmenu                                                                guifg=#103090   guibg=#D0E0D0
    hi PmenuThumb                                                           guifg=#000000
    hi TabLineSel                   ctermfg=LightGray
    hi Ignore                       ctermfg=LightGray                       guifg=#C0C0C0
    hi EndOfBuffer                                                          guifg=#3050B0
endif
