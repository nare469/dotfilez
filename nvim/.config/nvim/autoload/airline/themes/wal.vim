" Normal mode
let s:N1 = [ 0, 0, 231 , 55  ]
let s:N2 = [ 0, 0, 231 , 98  ]
let s:N3 = [ 0, 0, 59  , 255 ]

" Insert mode
let s:I1 = [ '#ffffff' , '#ffffff' , 231 , 27  ]
let s:I2 = [ '#ffffff' , '#00afff' , 231 , 39  ]
let s:I3 = [ '#333333' , '#efefef' , 59  , 255 ]

" Visual mode
let s:V1 = [ '#121212' , '#ff5f00' , 233 , 202 ]
let s:V2 = [ '#121212' , '#ffaf00' , 233 , 214 ]
let s:V3 = [ '#333333' , '#efefef' , 59  , 255 ]

" Replace mode
let s:R1 = [ '#ffffff' , '#ff0000' , 231 , 196 ]
let s:R2 = [ '#ffffff' , '#ff5f5f' , 231 , 203 ]
let s:R3 = [ '#333333' , '#efefef' , 59  , 255 ]

let g:airline#themes#wal#palette = {}
let g:airline#themes#wal#palette.normal  = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#wal#palette.insert  = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#wal#palette.visual  = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#wal#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

" Inactive mode
let s:IN1 = [ '#9e9e9e' , '#9e9e9e' , 247 , 247 ]
let s:IN2 = [ '#efefef' , '#efefef' , 255 , 255 ]

let s:IA = [ s:IN1[1] , s:IN2[1] , s:IN1[3] , s:IN2[3] , '' ]
let g:airline#themes#wal#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" Tabline
let g:airline#themes#wal#palette.tabline = {
      \ 'airline_tab':     [ '#ffffff' , '#5f00af' , 231 , 55  , '' ],
      \ 'airline_tabsel':  [ '#ffffff' , '#875fd7' , 231 , 98  , '' ],
      \ 'airline_tabtype': [ '#ffffff' , '#875fd7' , 231 , 98  , '' ],
      \ 'airline_tabfill': [ '#ffffff' , '#121212' , 231 , 16  , '' ],
      \ 'airline_tabmod':  [ '#ffffff' , '#ff5f5f' , 231 , 203 , '' ]
      \ }
