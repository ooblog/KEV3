#!/bin/sh
script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
cd $script_dir

cp syntax/tsf.vim ~/.vim/syntax/tsf.vim
cp plugin/KEV3.vim ~/.vim/plugin/KEV3.vim
cp autoload/KEV3.vim ~/.vim/autoload/KEV3.vim
cp autoload/KEV3_kanmap.tsf ~/.vim/autoload/KEV3_kanmap.tsf
cp autoload/KEV3_kanchar.tsf ~/.vim/autoload/KEV3_kanchar.tsf
