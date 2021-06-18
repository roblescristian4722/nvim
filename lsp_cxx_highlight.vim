"This file goes on
"./autoload/plugged/vim-lsp-cxx-highlight/syntax/lsp_cxx_highlight.vim
" Its used to change C/C++ syntax highlight

" Default syntax
" Customizing:
" to change the highlighting of a group add this to your vimrc.
"
" E.g. Change Preprocessor skipped regions to red bold text
" hi LspCxxHlSkippedRegion cterm=Red guifg=#FF0000 cterm=bold gui=bold
"
" E.g. Change Variables to be highlighted as Identifiers
" hi link LspCxxHlSymVariable Identifier


" Preprocessor Skipped Regions:
"
" This is used for false branches of #if or other preprocessor conditions
hi default link LspCxxHlSkippedRegion Comment

" This is the first and last line of the preprocessor regions
" in most cases this contains the #if/#else/#endif statements
" so it is better to let syntax do the highlighting.
hi default link LspCxxHlSkippedRegionBeginEnd Normal


" Syntax Highlighting:
"
" Custom Highlight Groups
hi default LspCxxHlGroupEnumConstant ctermfg=Magenta guifg=#AD7FA8 cterm=none gui=none
hi default LspCxxHlGroupNamespace ctermfg=White guifg=#61C1AE cterm=none gui=none
hi default LspCxxHlGroupMemberVariable ctermfg=White guifg=#90C8EF
hi default LspCxxHlSymVariable ctermfg=White guifg=#90C8EF
hi default LspCxxHlSymField ctermfg=White guifg=#90C8EF

" Type
hi default LspCxxHlSymClass ctermfg=Blue guifg=#61C1AE
hi default LspCxxHlSymStruct ctermfg=Blue guifg=#61C1AE
hi default LspCxxHlSymEnum ctermfg=Blue guifg=#61C1AE
hi default LspCxxHlSymTypeAlias ctermfg=Blue guifg=#61C1AE
hi default LspCxxHlSymTypeParameter ctermfg=Blue guifg=#61C1AE
hi default LspCxxHlSymTemplateParameter ctermfg=Blue guifg=#61C1AE

hi default link LspCxxHlSymUnknown Normal

" Type
hi default link LspCxxHlSymClass Type
hi default link LspCxxHlSymStruct Type
hi default link LspCxxHlSymEnum Type
hi default link LspCxxHlSymTypeAlias Type
hi default link LspCxxHlSymTypeParameter Type

" Function
hi default link LspCxxHlSymFunction Function
hi default link LspCxxHlSymMethod Function
hi default link LspCxxHlSymStaticMethod Function
hi default link LspCxxHlSymConstructor Function

" EnumConstant
hi default link LspCxxHlSymEnumMember LspCxxHlGroupEnumConstant

" Preprocessor
hi default link LspCxxHlSymMacro Macro

" Namespace
hi default link LspCxxHlSymNamespace LspCxxHlGroupNamespace

" Variables
hi default link LspCxxHlSymVariable Normal
hi default link LspCxxHlSymParameter Normal
hi default link LspCxxHlSymField LspCxxHlGroupMemberVariable

" clangd-only groups
" A static member variable
hi default link LspCxxHlSymUnknownStaticField Normal
" Seems to be when a type alias refers to a primitive
hi default link LspCxxHlSymPrimitive Type
" Equivalent to TypeAlias
hi default link LspCxxHlSymTypedef Type
" Equivalent to TypeParameter
hi default link LspCxxHlSymTemplateParameter Type
" Equivalent to EnumMember
hi default link LspCxxHlSymEnumConstant LspCxxHlGroupEnumConstant
" A type dependent on a template
" E.g. T::A, A would be a dependent type
hi default link LspCxxHlSymDependentType Type
" A name dependent on a template, usually a function but can also be a variable?
hi default link LspCxxHlSymDependentName Function
" C++20 concepts, maybe type is sufficient for now...
hi default link LspCxxHlSymConcept Type

