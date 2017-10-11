scriptencoding utf8
" Author: w0rp <devw0rp@gmail.com>
" Description: Draws error and warning signs into signcolumn

if !hlexists('ALEErrorSign')
    highlight link ALEErrorSign error
endif

if !hlexists('ALEStyleErrorSign')
    highlight link ALEStyleErrorSign ALEErrorSign
endif

if !hlexists('ALEWarningSign')
    highlight link ALEWarningSign todo
endif

if !hlexists('ALEStyleWarningSign')
    highlight link ALEStyleWarningSign ALEWarningSign
endif

if !hlexists('ALEInfoSign')
    highlight link ALEInfoSign ALEWarningSign
endif

if !hlexists('ALESignColumnWithErrors')
    highlight link ALESignColumnWithErrors error
endif

if !hlexists('ALESignColumnWithoutErrors')
    function! s:SetSignColumnWithoutErrorsHighlight() abort
        redir => l:output
            silent highlight SignColumn
        redir end

        let l:highlight_syntax = join(split(l:output)[2:])

        let l:match = matchlist(l:highlight_syntax, '\vlinks to (.+)$')

        if !empty(l:match)
            execute 'highlight link ALESignColumnWithoutErrors ' . l:match[1]
        elseif l:highlight_syntax isnot# 'cleared'
            execute 'highlight ALESignColumnWithoutErrors ' . l:highlight_syntax
        endif
    endfunction

    call s:SetSignColumnWithoutErrorsHighlight()
    delfunction s:SetSignColumnWithoutErrorsHighlight
endif

" Signs show up on the left for error markers.
execute 'sign define ALEErrorSign text=' . g:ale_sign_error
\   . ' texthl=ALEErrorSign linehl=ALEErrorLine'
execute 'sign define ALEStyleErrorSign text=' . g:ale_sign_style_error
\   . ' texthl=ALEStyleErrorSign linehl=ALEErrorLine'
execute 'sign define ALEWarningSign text=' . g:ale_sign_warning
\   . ' texthl=ALEWarningSign linehl=ALEWarningLine'
execute 'sign define ALEStyleWarningSign text=' . g:ale_sign_style_warning
\   . ' texthl=ALEStyleWarningSign linehl=ALEWarningLine'
execute 'sign define ALEInfoSign text=' . g:ale_sign_info
\   . ' texthl=ALEInfoSign linehl=ALEInfoLine'
sign define ALEDummySign

let s:error_priority = 1
let s:warning_priority = 2
let s:info_priority = 3
let s:style_error_priority = 4
let s:style_warning_priority = 5

function! ale#sign#GetSignName(sublist) abort
    let l:priority = s:style_warning_priority

    " Determine the highest priority item for the line.
    for l:item in a:sublist
        if l:item.type is# 'I'
            let l:item_priority = s:info_priority
        elseif l:item.type is# 'W'
            if get(l:item, 'sub_type', '') is# 'style'
                let l:item_priority = s:style_warning_priority
            else
                let l:item_priority = s:warning_priority
            endif
        else
            if get(l:item, 'sub_type', '') is# 'style'
                let l:item_priority = s:style_error_priority
            else
                let l:item_priority = s:error_priority
            endif
        endif

        if l:item_priority < l:priority
            let l:priority = l:item_priority
        endif
    endfor

    if l:priority is# s:error_priority
        return 'ALEErrorSign'
    endif

    if l:priority is# s:warning_priority
        return 'ALEWarningSign'
    endif

    if l:priority is# s:style_error_priority
        return 'ALEStyleErrorSign'
    endif

    if l:priority is# s:style_warning_priority
        return 'ALEStyleWarningSign'
    endif

    if l:priority is# s:info_priority
        return 'ALEInfoSign'
    endif

    " Use the error sign for invalid severities.
    return 'ALEErrorSign'
endfunction

" Read sign data for a buffer to a list of lines.
function! ale#sign#ReadSigns(buffer) abort
    redir => l:output
       silent execute 'sign place buffer=' . a:buffer
    redir end

    return split(l:output, "\n")
endfunction

" Given a list of lines for sign output, return a List of [line, id, group]
function! ale#sign#ParseSigns(line_list) abort
    " Matches output like :
    " line=4  id=1  name=ALEErrorSign
    " строка=1  id=1000001  имя=ALEErrorSign
    " 行=1  識別子=1000001  名前=ALEWarningSign
    " línea=12 id=1000001 nombre=ALEWarningSign
    " riga=1 id=1000001, nome=ALEWarningSign
    let l:pattern = '\v^.*\=(\d+).*\=(\d+).*\=(ALE[a-zA-Z]+Sign)'
    let l:result = []
    let l:is_dummy_sign_set = 0

    for l:line in a:line_list
        let l:match = matchlist(l:line, l:pattern)

        if len(l:match) > 0
            if l:match[3] is# 'ALEDummySign'
                let l:is_dummy_sign_set = 1
            else
                call add(l:result, [
                \   str2nr(l:match[1]),
                \   str2nr(l:match[2]),
                \   l:match[3],
                \])
            endif
        endif
    endfor

    return [l:is_dummy_sign_set, l:result]
endfunction

function! ale#sign#FindCurrentSigns(buffer) abort
    let l:line_list = ale#sign#ReadSigns(a:buffer)

    return ale#sign#ParseSigns(l:line_list)
endfunction

" Given a loclist, group the List into with one List per line.
function! s:GroupLoclistItems(buffer, loclist) abort
    let l:grouped_items = []
    let l:last_lnum = -1

    for l:obj in a:loclist
        if l:obj.bufnr != a:buffer
            continue
        endif

        " Create a new sub-List when we hit a new line.
        if l:obj.lnum != l:last_lnum
            call add(l:grouped_items, [])
        endif

        call add(l:grouped_items[-1], l:obj)
        let l:last_lnum = l:obj.lnum
    endfor

    return l:grouped_items
endfunction

function! s:UpdateLineNumbers(buffer, current_sign_list, loclist) abort
    let l:line_map = {}
    let l:line_numbers_changed = 0

    for [l:line, l:sign_id, l:name] in a:current_sign_list
        let l:line_map[l:sign_id] = l:line
    endfor

    for l:item in a:loclist
        if l:item.bufnr == a:buffer
            let l:lnum = get(l:line_map, get(l:item, 'sign_id', 0), 0)

            if l:lnum && l:item.lnum != l:lnum
                let l:item.lnum = l:lnum
                let l:line_numbers_changed = 1
            endif
        endif
    endfor

    " When the line numbers change, sort the list again
    if l:line_numbers_changed
        call sort(a:loclist, 'ale#util#LocItemCompare')
    endif
endfunction

function! s:BuildSignMap(current_sign_list, grouped_items) abort
    let l:sign_map = {}
    let l:sign_offset = g:ale_sign_offset

    for [l:line, l:sign_id, l:name] in a:current_sign_list
        let l:sign_info = get(l:sign_map, l:line, {
        \   'current_id_list': [],
        \   'current_name_list': [],
        \   'new_id': 0,
        \   'new_name': '',
        \   'items': [],
        \})

        " Increment the sign offset for new signs, by the maximum sign ID.
        if l:sign_id > l:sign_offset
            let l:sign_offset = l:sign_id
        endif

        " Remember the sign names and IDs in separate Lists, so they are easy
        " to work with.
        call add(l:sign_info.current_id_list, l:sign_id)
        call add(l:sign_info.current_name_list, l:name)

        let l:sign_map[l:line] = l:sign_info
    endfor

    for l:group in a:grouped_items
        let l:line = l:group[0].lnum
        let l:sign_info = get(l:sign_map, l:line, {
        \   'current_id_list': [],
        \   'current_name_list': [],
        \   'new_id': 0,
        \   'new_name': '',
        \   'items': [],
        \})

        let l:sign_info.new_name = ale#sign#GetSignName(l:group)
        let l:sign_info.items = l:group

        let l:index = index(
        \   l:sign_info.current_name_list,
        \   l:sign_info.new_name
        \)

        if l:index >= 0
            " We have a sign with this name already, so use the same ID.
            let l:sign_info.new_id = l:sign_info.current_id_list[l:index]
        else
            " This sign name replaces the previous name, so use a new ID.
            let l:sign_info.new_id = l:sign_offset + 1
            let l:sign_offset += 1
        endif

        let l:sign_map[l:line] = l:sign_info
    endfor

    return l:sign_map
endfunction

function! ale#sign#GetSignCommands(buffer, was_sign_set, sign_map) abort
    let l:command_list = []
    let l:is_dummy_sign_set = a:was_sign_set

    " Set the dummy sign if we need to.
    " The dummy sign is needed to keep the sign column open while we add
    " and remove signs.
    if !l:is_dummy_sign_set && (!empty(a:sign_map) || g:ale_sign_column_always)
        call add(l:command_list, 'sign place '
        \   .  g:ale_sign_offset
        \   . ' line=1 name=ALEDummySign buffer='
        \   . a:buffer
        \)
        let l:is_dummy_sign_set = 1
    endif

    " Place new items first.
    for [l:line_str, l:info] in items(a:sign_map)
        if l:info.new_id
            " Save the sign IDs we are setting back on our loclist objects.
            " These IDs will be used to preserve items which are set many times.
            for l:item in l:info.items
                let l:item.sign_id = l:info.new_id
            endfor

            if index(l:info.current_id_list, l:info.new_id) < 0
                call add(l:command_list, 'sign place '
                \   . (l:info.new_id)
                \   . ' line=' . l:line_str
                \   . ' name=' . (l:info.new_name)
                \   . ' buffer=' . a:buffer
                \)
            endif
        endif
    endfor

    " Remove signs without new IDs.
    for l:info in values(a:sign_map)
        for l:current_id in l:info.current_id_list
            if l:current_id isnot l:info.new_id
                call add(l:command_list, 'sign unplace '
                \   . l:current_id
                \   . ' buffer=' . a:buffer
                \)
            endif
        endfor
    endfor

    " Remove the dummy sign to close the sign column if we need to.
    if l:is_dummy_sign_set && !g:ale_sign_column_always
        call add(l:command_list, 'sign unplace '
        \   . g:ale_sign_offset
        \   . ' buffer=' . a:buffer
        \)
    endif

    return l:command_list
endfunction

" This function will set the signs which show up on the left.
function! ale#sign#SetSigns(buffer, loclist) abort
    if !bufexists(str2nr(a:buffer))
        " Stop immediately when attempting to set signs for a buffer which
        " does not exist.
        return
    endif

    " Find the current markers
    let [l:is_dummy_sign_set, l:current_sign_list] =
    \   ale#sign#FindCurrentSigns(a:buffer)

    " Update the line numbers for items from before which may have moved.
    call s:UpdateLineNumbers(a:buffer, l:current_sign_list, a:loclist)

    " Group items after updating the line numbers.
    let l:grouped_items = s:GroupLoclistItems(a:buffer, a:loclist)

    " Build a map of current and new signs, with the lines as the keys.
    let l:sign_map = s:BuildSignMap(l:current_sign_list, l:grouped_items)

    let l:command_list = ale#sign#GetSignCommands(
    \   a:buffer,
    \   l:is_dummy_sign_set,
    \   l:sign_map,
    \)

    " Change the sign column color if the option is on.
    if g:ale_change_sign_column_color && !empty(a:loclist)
        highlight clear SignColumn
        highlight link SignColumn ALESignColumnWithErrors
    endif

    for l:command in l:command_list
        silent! execute l:command
    endfor

    " Reset the sign column color when there are no more errors.
    if g:ale_change_sign_column_color && empty(a:loclist)
        highlight clear SignColumn
        highlight link SignColumn ALESignColumnWithoutErrors
    endif
endfunction
