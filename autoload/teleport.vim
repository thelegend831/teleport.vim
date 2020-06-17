" Invoked by :Z ...
func! teleport#(...) abort
  let l:search = join(a:000, ' ')
  let l:match = teleport#api#query(l:search)

  " Error state. Assume it was already echoed.
  if l:match is# 'ERROR' | return | endif

  " No luck. Alert the user.
  if l:match is# v:null
    call teleport#print#error('No matches:')
    call teleport#print#(' ', l:search)
    return v:null
  endif

  " Open the most probable match in the current pane.
  execute 'edit ' . fnameescape(l:match)
endfunc
