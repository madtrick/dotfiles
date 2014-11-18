let s:N1 = [ '#141413' , '#aeee00' , 232 , 154 ] " blackestgravel & lime
let s:N2 = [ '#f4cf86' , '#45413b' , 222 , 238 ] " dirtyblonde    & deepgravel
let s:N3 = [ '#8cffba' , '#242321' , 121 , 235 ] " saltwatertaffy & darkgravel
let s:N4 = [ '#666462' , 241 ]                   " mediumgravel

let s:I1 = [ '#141413' , '#0a9dff' , 232 , 39  ] " blackestgravel & tardis
let s:I2 = [ '#f4cf86' , '#005fff' , 222 , 27  ] " dirtyblonde    & facebook
let s:I3 = [ '#0a9dff' , '#242321' , 39  , 235 ] " tardis         & darkgravel

let s:V1 = [ '#141413' , '#ffa724' , 232 , 214 ] " blackestgravel & orange
let s:V2 = [ '#000000' , '#fade3e' , 16  , 221 ] " coal           & dalespale
let s:V3 = [ '#000000' , '#b88853' , 16  , 137 ] " coal           & toffee
let s:V4 = [ '#c7915b' , 173 ]                   " coffee

let s:PA = [ '#f4cf86' , 222 ]                   " dirtyblonde
let s:RE = [ '#ff9eb8' , 211 ]                   " dress

let s:IA = [ s:N2[1] , s:N3[1] , s:N2[3] , s:N3[3] , '' ]

let g:airline#themes#badwolf_custom#palette = {}

let g:airline#themes#badwolf_custom#palette.accents = {
      \ 'red': [ '#ff2c4b' , '' , 196 , '' , '' ]
      \ }

let g:airline#themes#badwolf_custom#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#badwolf_custom#palette.normal_modified = {
      \ 'airline_b': [ s:N2[0]   , s:N4[0]   , s:N2[2]   , s:N4[1]   , ''     ] ,
      \ 'airline_c': [ s:V1[1]   , s:N2[1]   , s:V1[3]   , s:N2[3]   , ''     ] }


"
" The following color palettes have been copied from the solarized theme
"
let s:ansi_colors = get(g:, 'solarized_termcolors', 16) != 256 && &t_Co >= 16 ? 1 : 0
let s:tty         = &t_Co == 8
let s:base3 = {'t': s:ansi_colors ?  15 : (s:tty ? '7' : 230), 'g': '#fdf6e3'}
let s:red   = {'t': s:ansi_colors ?   1 : (s:tty ? '1' : 160), 'g': '#dc322f'}
let s:NW    = [s:base3, s:red, '']

"
" The following color configuration for the warning section of airline
" has been copied from the solarized theme
"
" The lines below (where the warning colors are applied to other modes)
" have been copied from the solarized theme too
"
let g:airline#themes#badwolf_custom#palette.normal.airline_warning = [
      \ s:NW[0].g, s:NW[1].g, s:NW[0].t, s:NW[1].t, s:NW[2]]
let g:airline#themes#badwolf_custom#palette.normal_modified.airline_warning =
      \ g:airline#themes#badwolf_custom#palette.normal.airline_warning


let g:airline#themes#badwolf_custom#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#badwolf_custom#palette.insert_modified = {
      \ 'airline_c': [ s:V1[1]   , s:N2[1]   , s:V1[3]   , s:N2[3]   , ''     ] }
let g:airline#themes#badwolf_custom#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , s:PA[0]   , s:I1[2]   , s:PA[1]   , ''     ] }
let g:airline#themes#badwolf_custom#palette.insert.airline_warning =
      \ g:airline#themes#badwolf_custom#palette.normal.airline_warning
let g:airline#themes#badwolf_custom#palette.insert_modified.airline_warning =
      \ g:airline#themes#badwolf_custom#palette.normal.airline_warning


let g:airline#themes#badwolf_custom#palette.replace = copy(airline#themes#badwolf_custom#palette.insert)
let g:airline#themes#badwolf_custom#palette.replace.airline_a = [ s:I1[0] , s:RE[0] , s:I1[2] , s:RE[1] , '' ]
let g:airline#themes#badwolf_custom#palette.replace_modified = g:airline#themes#badwolf_custom#palette.insert_modified
let g:airline#themes#badwolf_custom#palette.replace.airline_warning =
      \ g:airline#themes#badwolf_custom#palette.normal.airline_warning
let g:airline#themes#badwolf_custom#palette.replace_modified.airline_warning =
      \ g:airline#themes#badwolf_custom#palette.normal.airline_warning


let g:airline#themes#badwolf_custom#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#badwolf_custom#palette.visual_modified = {
      \ 'airline_c': [ s:V3[0]   , s:V4[0]   , s:V3[2]   , s:V4[1]   , ''     ] }
let g:airline#themes#badwolf_custom#palette.visual.airline_warning =
      \ g:airline#themes#badwolf_custom#palette.normal.airline_warning
let g:airline#themes#badwolf_custom#palette.visual_modified.airline_warning =
      \ g:airline#themes#badwolf_custom#palette.normal.airline_warning


let g:airline#themes#badwolf_custom#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#badwolf_custom#palette.inactive_modified = {
      \ 'airline_c': [ s:V1[1]   , ''        , s:V1[3]   , ''        , ''     ] }

