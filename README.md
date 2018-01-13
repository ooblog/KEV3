# 漢字直接入力＆漢字直接検索Vimプラグイン「KanEditVim」ver3(準備中)。


## KEV超ザックリ説明。

漢字直接入力(漢直)Vimプラグインです(開発中)。  
KEVは約２ストローク(鍵盤切替時のスペース入力はSandSすなわちシフト扱い)のかな入力で、漢字変換を用いず直接漢字などが入力できます(予定)。  
独自のかな配列(括弧の位置がUSキーボードとJISキーボードでズレます)を用いる事で、USキーボード買ったのにJISキーボード設定のままみたいな混在環境でも日本語入力できます。  

&#35;!	あいうえおかきくけこ〜
&#35;!	さしすせそたちつてと「」
&#35;!	なにぬねのやゆよわをん
&#35;!	まみむめもらりるれろ
&#35;!	ぁぃぅぇぉがぎぐげごゔ
&#35;!	ざじずぜぞだじづでど『』
&#35;!	はひふへほゃゅょっ、。
&#35;!	ばびぶべぼぱぴぷぺぽ
&#35;!	アイウエオカキクケコー
&#35;!	サシスセソタチツテト・…
&#35;!	ナニヌネノワヲヤユヨン
&#35;!	マミムメモラリルレロ
&#35;!	ァィゥェォガギグゲゴヴ
&#35;!	ザジズゼゾダヂヅデド！？
&#35;!	ハヒフヘホャュョッ，．
&#35;!	バビブベボパピプペポ


## 既存のIMEおよびその他の漢直系日本語入と違う所。

漢字入力だけではなく漢字検索機能があります。  
Vimの機能でも一文字検索は存在しますが(fコマンドなど)同じ一行内移動です。しかも半角限定。  
KEVの漢直検索ならモードの切替無しに(厳密には&lt;C-o&gt;/を用いて)複数行間を一文字検索できます。しかも全角前提。  
IMEを起動しないのでモード切替時に全角半角キーを押す手間が不要。  
そのモード切替自体も「map &lt;silent&gt; &lt;Space&gt;&lt;Space&gt; a」「imap &lt;silent&gt; &lt;Space&gt;&lt;Space&gt; &lt;Esc&gt;」でEscもCtrlも不使用。ホームポジションが崩れるのを予防。  


## 操作一覧予定表(ToDo)。

☑&lt;Space&gt;&lt;Space&gt;	Vimの挿入モード切替  
☑&lt;Space&gt;&lt;Enter&gt;	半角スペース入力  
☑a-z	文字入力/字引漢直(単漢字辞書kanchar.tsf)  
☑A-Z	一文字検索下方向(&lt;C-o&gt;/)  
☑&lt;S-Space&gt;	一文字検索上方向(&lt;C-o&gt;?)  
☐&lt;Space&gt;a-z	鍵盤変更/清濁変更/かなカタ変更(漢直鍵盤kanmap.tsf)  
☐&lt;Space&gt;A-Z	字引項目を設定(単漢字辞書kanchar.tsf)  
☐&lt;Space&gt;&lt;S-Space&gt;	字引項目の解除  
☐&lt;Space&gt;&lt;S-Enter&gt;a-z		漢直鍵盤上書き編集(漢直鍵盤kanmap.tsf)  


## 拡張子TSFってTSVと何が違うの？

TSFはプログラミング言語「TSF_Tab-Separated-Forth」の拡張子です。  
詳しくは「[https://github.com/ooblog/TSF3KEV](https://github.com/ooblog/TSF3KEV "ooblog/TSF3KEV: プログラミング言語「TSF_Tab-Separated-Forth」開発準備(ver3草案)。")」などを参考。  
当初はTSFでエディタから作る予定だったけどVim版作った方が速かったのでVimプラグインとして独立。  


## ライセンス・著作権など。

&#35;! -- Copyright (c) 2016-2018 ooblog --  
&#35;! License: MIT　https://github.com/ooblog/KEV3/blob/master/LICENSE  
