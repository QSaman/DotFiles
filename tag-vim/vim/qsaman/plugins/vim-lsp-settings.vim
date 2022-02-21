" Since pyright doesn't support highlighting function parameters (signature help),
" both pyslp and pyright are enabled. But pylsp is only  used for highlighting
" parameters
" Settings references:
" pyright: https://github.com/microsoft/pyright/blob/main/docs/settings.md and https://github.com/fannheyward/coc-pyright
" pylsp: https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md

let s:pylsp_workspace_config_light = {
	\'pylsp':
	\{
		\'plugins':
		\{
			\'pydocstyle': {'enabled': v:false},
			\'jedi_completion': {'enabled': v:false, 'include_params': v:true, 'include_class_objects': v:false},
			\'jedi_definition': {'enabled': v:false, 'follow_imports': v:false, 'follow_builtin_imports': v:false},
			\'jedi_hover': {'enabled': v:false},
			\'jedi_references': {'enabled': v:false},
			\'jedi_symbols': {'enabled': v:false, 'all_scopes': v:false, 'include_import_symbols': v:false},
			\'mccabe': {'enabled': v:false},
			\'pycodestyle': {'enabled': v:false},
			\'pyflakes': {'enabled': v:false},
			\'rope_completion': {'enabled': v:false},
			\'yapf': {'enabled': v:false},
		\}
	\},
\}

let s:pylsp_workspace_config = s:pylsp_workspace_config_light
let g:lsp_settings_filetype_python = ['pyright-langserver', 'pylsp']

" Uncomment to enable pylsp only:
" let s:pylsp_workspace_config = {}
" let g:lsp_settings_filetype_python = ['pylsp']

let g:lsp_settings = {
	\'pylsp':
	\{
		\'workspace_config': s:pylsp_workspace_config,
	\},
	\'pyright-langserver':
	\{
		\'workspace_config':
		\{
			\'python':
			\{
				\'analysis': {'autoImportCompletions': v:true, 'autoSearchPaths': v:true},
			\},
		\}
	\}
\}
