set encoding=utf-8
scriptencoding utf-8
let s:KEV3_scriptdir = expand('<sfile>:p:h')

if !exists('g:loaded_KEV3')
    finish
endif
let g:loaded_KEV3 = 1

"「KanEditVim3」の起動。
function! KEV3#KEV3boot()
call KEV3setup('[『',']』','-〜','-ー')
"call KEV3setup('[！',']？','-〜','-ー') "US
"call KEV3setup('[『',']』','-〜','-ー') "JIS
endfunction

"「KanEditVim3」の初期化。鍵盤読込。
function! KEV3setup(KEV3_inputkey,KEV3_findkey,KEV3_hiraganakey,KEV3_katakanakey)
    let s:KEV3_inputESCs = {"\t":"<Tab>",' ':"<Space>",'<':"<lt>",'\':"<Bslash>",'|':"<Bar>",'-':"<Minus>",'.':"<Point>"}
    let s:KEV3_menuESCs = "\t\\:|< >.-"
    let s:KEV3_findESCs = ".*[]^%/\?~$"
    let s:KEV3_kanmapkeysX = ["1あ","2い","3う","4え","5お","6か","7き","8く","9け","0こ","-〜","qさ","wし","eす","rせ","tそ","yた","uち","iつ","oて","pと","[「","]」","aな","sに","dぬ","fね","gの","hや","jゆ","kよ","lわ",";を",":ん","zま","xみ","cむ","vめ","bも","nら","mり",",る",".れ","/ろ"]
    let s:KEV3_kanmapkeysY = s:KEV3_kanmapkeysX[:]
    let s:KEV3_kanmapkeysY += ["1ぁ","2ぃ","3ぅ","4ぇ","5ぉ","6が","7ぎ","8ぐ","9げ","0ご","-ゔ","qざ","wじ","eず","rぜ","tぞ","yだ","uじ","iづ","oで","pど","[『","]』","aは","sひ","dふ","fへ","gほ","hゃ","jゅ","kょ","lっ",";、",":。","zば","xび","cぶ","vべ","bぼ","nぱ","mぴ",",ぷ",".ぺ","/ぽ"]
    let s:KEV3_kanmapkeysY += ["1ア","2イ","3ウ","4エ","5オ","6カ","7キ","8ク","9ケ","0コ","-ー","qサ","wシ","eス","rセ","tソ","yタ","uチ","iツ","oテ","pト","[・","]…","aナ","sニ","dヌ","fネ","gノ","hヤ","jユ","kヨ","lワ",";ヲ",":ン","zマ","xミ","cム","vメ","bモ","nラ","mリ",",ル",".レ","/ロ"]
    let s:KEV3_kanmapkeysY += ["1ァ","2ィ","3ゥ","4ェ","5ォ","6ガ","7ギ","8グ","9ゲ","0ゴ","-ヴ","qザ","wジ","eズ","fゼ","tゾ","yダ","uヂ","iヅ","oデ","pド","[！","]？","aハ","sヒ","dフ","fヘ","gホ","hャ","jュ","kョ","lッ",";，",":．","zバ","xビ","cブ","vベ","bボ","nパ","mピ",",プ",".ペ","/ポ"]
    let s:KEV3_inputkeys = ['1','2','3','4','5','6','7','8','9','0','-','q','w','e','r','t','y','u','i','o','p','[',']','a','s','d','f','g','h','j','k','l',';',':','z','x','c','v','b','n','m',',','.','/']
    let s:KEV3_findkeys = ['!','"','#','$','%','&',"'",'(',')','~','=','Q','W','E','R','T','Y','U','I','O','P','{','}','A','S','D','F','G','H','J','K','L','+','*','Z','X','C','V','B','N','M','<','>','?']
    let s:KEV3_kanmapkeyI = count(s:KEV3_kanmapkeysY,a:KEV3_inputkey) ? a:KEV3_inputkey : "[『"
    let s:KEV3_kanmapkeyH = count(s:KEV3_kanmapkeysY,a:KEV3_hiraganakey) ? a:KEV3_hiraganakey : s:KEV3_kanmapkeyI
    let s:KEV3_kanmapkeyK = count(s:KEV3_kanmapkeysY,a:KEV3_katakanakey) ? a:KEV3_katakanakey : s:KEV3_kanmapkeyI
    let s:KEV3_kanmapkeyF = count(s:KEV3_kanmapkeysY,a:KEV3_findkey) ? a:KEV3_findkey : "]』"
    let s:KEV3_kanmapkeyD = "　"
    call KEV3pullmenu(1)
    let s:KEV3_kanmapfilepath = s:KEV3_scriptdir . "/KEV3_kanmap.tsf"
    let s:KEV3_kanmap = {}
    :if filereadable(s:KEV3_kanmapfilepath)
        :for s:kanmapfileline in readfile(s:KEV3_kanmapfilepath)
            let s:kanmaplinelist = (stridx(s:kanmapfileline,"\t") >= 0) ? split(s:kanmapfileline,"\t") : [kanmapfileline]
            :if count(s:KEV3_kanmapkeysY,s:kanmaplinelist[0])
                let s:KEV3_kanmap[s:kanmaplinelist[0]] = s:kanmaplinelist[1:]
                :if len(s:kanmaplinelist) < len(s:KEV3_kanmapkeysX)
                    let s:KEV3_kanmap[s:kanmaplinelist[0]] += s:KEV3_inputkeys[(len(s:KEV3_kanmapkeysX)-len(s:kanmaplinelist)):(len(s:KEV3_inputkeys))]
                :endif
                :if s:kanmaplinelist[0] == s:KEV3_kanmapkeyI
                    let s:KEV3_inputkeys = s:KEV3_kanmap[s:kanmaplinelist[0]]
                :endif
                :if s:kanmaplinelist[0] == s:KEV3_kanmapkeyF
                    let s:KEV3_findkeys = s:KEV3_kanmap[s:kanmaplinelist[0]]
                :endif
            :endif
        :endfor
    :endif
    map <silent> <Space><Space> a
    vmap <silent> <Space><Space> <Esc>
    imap <silent> <Space><Space> <Esc>
    imap <silent> <Space><Enter> <C-V><Space>
    execute "imap <silent> <Space><Tab> <C-o><Plug>(KEV3map" . s:KEV3_kanmapkeyH . ")"
    execute "imap <silent> <Space><S-Tab> <C-o><Plug>(KEV3map" . s:KEV3_kanmapkeyK . ")"
    :for s:inputkey in range(len(s:KEV3_kanmapkeysY))
        execute "noremap <Plug>(KEV3map" . s:KEV3_kanmapkeysY[s:inputkey] . ") :call KEV3mapdaku('" . s:KEV3_kanmapkeysY[s:inputkey] . "')<Enter>"
    :endfor
    let s:KEV3_menuid = 10000
    let s:KEV3_menumap = "【鍵盤"
    let s:KEV3_menumapid = s:KEV3_menuid+0
    let s:KEV3_menudic = "文字"
    let s:KEV3_menudicid = s:KEV3_menuid+1
    let s:KEV3_menuhelp = "&KEV3】"
    let s:KEV3_menuhelpid = s:KEV3_menuid+2
    execute "amenu  <silent> " . (s:KEV3_menuhelpid) . ".01 " . s:KEV3_menuhelp . ".KEV3_README\\.mdを開く(&R) <Plug>(KEV3readme)"
    execute "noremap <Plug>(KEV3readme) :call KEV3help('KEV3_README.md')<Enter>"
    execute "amenu  <silent> " . (s:KEV3_menuhelpid) . ".10 " . s:KEV3_menuhelp . ".-sep_find- :"
    execute "amenu  <silent> " . (s:KEV3_menuhelpid) . ".11 " . s:KEV3_menuhelp . ".ファイル履歴を開く(&H) <Plug>(KEV3filer)"
    execute "noremap <Plug>(KEV3filer) :call KEV3filer()<Enter>"
    execute "amenu  <silent> " . (s:KEV3_menuhelpid) . ".50 " . s:KEV3_menuhelp . ".-sep_dic- :"
    execute "amenu  <silent> " . (s:KEV3_menuhelpid) . ".51 " . s:KEV3_menuhelp . ".漢直鍵盤KEV3_kanmap\\.tsfを開く <Plug>(KEV3kanmap)"
    execute "noremap <Plug>(KEV3kanmap) :call KEV3help('KEV3_kanmap.tsf')<Enter>"
    execute "amenu  <silent> " . (s:KEV3_menuhelpid) . ".52 " . s:KEV3_menuhelp . ".単漢字辞書KEV3_kanchar\\.tsfを開く <Plug>(KEV3char)"
    execute "noremap <Plug>(KEV3char) :call KEV3help('KEV3_kanchar.tsf')<Enter>"
    execute "amenu  <silent> " . (s:KEV3_menuhelpid) . ".55 " . s:KEV3_menuhelp . ".KanEditVim本体KEV3\\.vimを開く <Plug>(KEV3source)"
    execute "noremap <Plug>(KEV3source) :call KEV3help('KEV3.tsf')<Enter>"
    execute "amenu  <silent> " . (s:KEV3_menuhelpid) . ".90 " . s:KEV3_menuhelp . ".-sep_filer- :"
    execute "amenu  <silent> " . (s:KEV3_menuhelpid) . ".91 " . s:KEV3_menuhelp . ".USキーボード" . ((s:KEV3_kanmapkeyI=='[！')&&(s:KEV3_kanmapkeyF==']？')?"✓":"で再開") . " <Plug>(KEV3setupUS)"
    execute "noremap <Plug>(KEV3setupUS) :call KEV3setup('[！',']？','-〜','-ー')<Enter>"
    execute "amenu  <silent> " . (s:KEV3_menuhelpid) . ".91 " . s:KEV3_menuhelp . ".JISキーボード" . ((s:KEV3_kanmapkeyI=='[『')&&(s:KEV3_kanmapkeyF==']』')?"✓":"で再開") . " <Plug>(KEV3setupJIS)"
    execute "noremap <Plug>(KEV3setupJIS) :call KEV3setup('[『',']』','-〜','-ー')<Enter>"
    execute "amenu  <silent> " . (s:KEV3_menuhelpid) . ".99 " . s:KEV3_menuhelp . ".KEV3終了(「call\\ KEV3#KEV3boot()」で再開) <Plug>(KEV3exit)"
    execute "noremap <Plug>(KEV3exit) :call KEV3exit()<Enter>"
    call KEV3pushmenu()
endfunction

"鍵盤変更(清濁平片)。
function! KEV3mapdaku(KEV3_keyX)
    let s:KEV3_kanmapkeyI = a:KEV3_keyX
    call KEV3pullmenu(0)
    call KEV3pushmenu()
endfunction

"鍵盤変更(直接指定)。
function! KEV3mapdirect(KEV3_keyX)
    let s:KEV3_kanmapkeyI = a:KEV3_keyX
    call KEV3pullmenu(0)
    call KEV3pushmenu()
endfunction

"メニューの撤去。
function! KEV3pullmenu(KEV3_exit)
    :if !a:KEV3_exit
        execute "aunmenu  <silent> " . s:KEV3_menumap
        execute "iunmenu  <silent> " . s:KEV3_menudic
"        execute "iunmenu  <silent> " . s:KEV3_menuhelp  #ウィンドウサイズが変わる恐れがあるので右端メニューは消さない。
    :else
        :if exists("s:KEV3_menumap")
            execute "aunmenu  <silent> " . s:KEV3_menumap
            unlet! s:KEV3_menumap
        :endif
        :if exists("s:KEV3_menudic")
            execute "iunmenu  <silent> " . s:KEV3_menudic
            unlet! s:KEV3_menudic
        :endif
        :if exists("s:KEV3_menuhelp")
            execute "aunmenu  <silent> " . s:KEV3_menuhelp
            unlet! s:KEV3_menuhelp
        :endif
    :endif
endfunction

"メニューなどの構築。
function! KEV3pushmenu()
    let s:KEV3_menumap = escape("【" . s:KEV3_kanmapkeyI,s:KEV3_menuESCs)
    let s:KEV3_menudic = escape("〔" . s:KEV3_kanmapkeyD . "〕",s:KEV3_menuESCs)
    :for s:inputkey in range(len(s:KEV3_kanmapkeysX))
        let s:dicchar = s:KEV3_kanmap[s:KEV3_kanmapkeyI][s:inputkey]
"        let s:dicchar = len(s:dicchar) ? "　" : KEV3kancharpeekL(s:dicchar,s:KEV3_kanmapkeyD)
        let s:dicchar = len(s:dicchar) ? s:dicchar : "　"
        let s:dicVchar = " "
        :for s:Vchar in split(s:dicchar, '\zs')
            let s:dicVchar = s:dicVchar . printf("<C-V>U%08x",char2nr(s:Vchar))
        :endfor
        execute "imap <silent> " . s:KEV3_inputkeys[s:inputkey] . s:dicVchar
        let s:Fchar = escape(substitute(s:dicchar,"|","<bar>","g"),s:KEV3_menuESCs)
        execute "imap <silent> " . s:KEV3_findkeys[s:inputkey] . " <C-o>/" . s:Fchar . "<Enter>"
        let s:Mchar = s:KEV3_kanmapkeysX[s:inputkey]
        execute "imap <silent> <Space>" . s:KEV3_inputkeys[s:inputkey] . " <C-o><Plug>(KEV3map" . s:Mchar . ")"
    :endfor
    execute "imap <silent> <S-Space> <C-o>?<Enter>"

    execute "imenu  <silent> " . (s:KEV3_menudicid) . ".95 " . s:KEV3_menumap . ".-sep_exist- :"
    execute "imenu  <silent> " . (s:KEV3_menudicid) . ".89 " . s:KEV3_menudic . ".-sep_chardic- :"
endfunction

"「KanEditVim3」の撤去(helpコマンド類は残す)。
function! KEV3exit()
    call KEV3pullmenu(1)
    vunmap <silent> <Space><Space>
    unmap <silent> <Space><Space>
    iunmap <silent> <Space><Space>
    iunmap <silent> <Space><Enter>
    iunmap <silent> <Space><Tab>
    iunmap <silent> <Space><S-Tab>
    :for s:inputkey in range(len(s:KEV3_kanmapkeysX))
        execute "iunmap <silent> " . s:KEV3_inputkeys[s:inputkey]
        execute "iunmap <silent> " . s:KEV3_findkeys[s:inputkey]
    :endfor
    iunmap <silent> <S-Space>
endfunction

"履歴などからファイルを開く簡易ファイラー。
function! KEV3filer()
    cd $HOME
    let s:dirline = expand('%:p:h')
    execute "cd " . s:dirline
    let s:filelines = ["",s:dirline] + v:oldfiles
    let s:filelabels = ["ファイル履歴(01でフォルダ選択)※履歴はウィンドウの高さに合わせます。"]
    :for s:labelno in range(1,len(s:filelines)-2)
         let s:filelabels = s:filelabels + [ printf("%02d",s:labelno) . ":" . s:filelines[s:labelno] ]
    :endfor
    let s:filechoice = inputlist(s:filelabels[:max([1,min([&lines-2,len(s:filelabels)])])])
    :while 0 < s:filechoice && s:filechoice < len(s:filelines)
        echo "\n"
        :if isdirectory(s:filelines[s:filechoice])
            execute "cd " . s:filelines[s:filechoice]
            let s:dirline = getcwd()
        :elseif filereadable(s:filelines[s:filechoice])
            execute "enew"
            execute "e " . s:filelines[s:filechoice]
            :break
        :else
            echo "リーダブルではないファイルです「" . s:filelines[s:filechoice] . "」"
        :endif
        let s:filelines = ["",".."] + split(expand("./*"),"\n")
        let s:filelabels = ["「" . s:dirline . "」(01で親フォルダ選択)※ファイルクリックはズレるので注意。"]
        :for s:labelno in range(1,len(s:filelines)-1)
             let s:filelabels = s:filelabels + [ printf("%02d",s:labelno) . ":" . s:filelines[s:labelno] ]
        :endfor
        let s:filechoice = inputlist(s:filelabels)
    :endwhile
endfunction

"ヘルプファイル読込を想定。
function! KEV3help(KEV3_text)
    let s:KEV3_helpfilepath = s:KEV3_scriptdir . "/" . a:KEV3_text
    :if !filereadable(s:KEV3_helpfilepath)
        let s:KEV3_helpfilepath = s:KEV3_scriptdir . "/KEV3.vim"
    :endif
    :if filereadable(s:KEV3_helpfilepath)
        execute "enew"
        execute "e " . s:KEV3_helpfilepath . " | :se ro"
    :endif
endfunction

finish

"#! -- Copyright (c) 2016-2018 ooblog --
"#! License: MIT　https://github.com/ooblog/TSF3KEV/blob/master/LICENSE
