"Execure go import when saving file
let g:go_fmt_command = "goimports"

" Run linter when saving file
let g:go_metalinter_autosave = 1

" Change screen division method at GoRun and GoTest
let g:go_term_mode = 'split'

" Convert to camel case
let g:go_addtags_transform = "camelcase"

" Key mapping
augroup GoMapping
	autocmd!
	autocmd FileType go nmap <leader>r <Plug>(go-run)
	autocmd FileType go nmap <leader>r <Plug>(go-test)
	autocmd FileType go nmap <leader>r <Plug>(go-converage-toggle)
augroup END
