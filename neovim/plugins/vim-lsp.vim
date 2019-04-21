" go
if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

" Key mapping
nmap <silent> <Leader>d :LspDefinition<CR>
nmap <silent> <Leader>p :LspHover<CR>
nmap <silent> <Leader>r :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>
nmap <silent> <Leader>s :split \| :LspDefinition <CR>
nmap <silent> <Leader>v :vsplit \| :LspDefinition <CR>
