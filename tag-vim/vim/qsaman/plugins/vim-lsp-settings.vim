" Since pyright doesn't support highlighting function parameters (signature help),
" both pyslp and pyright are enabled. But pylsp is only  used for highlighting
" parameters
let g:lsp_settings_filetype_python = ['pylsp', 'pyright-langserver']
" Settings references:
" pyright: https://github.com/microsoft/pyright/blob/main/docs/settings.md and https://github.com/fannheyward/coc-pyright
 let g:lsp_settings = {
	\'pylsp':
	\{
		\'workspace_config':
		\{
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
