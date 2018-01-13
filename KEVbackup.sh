#!/bin/sh
script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
cd $script_dir

cp ~/.vim/syntax/tsf.vim syntax/tsf.vim
cp ~/.vim/plugin/KEV3.vim plugin/KEV3.vim
cp ~/.vim/autoload/KEV3.vim autoload/KEV3.vim
cp ~/.vim/autoload/KEV3_kanmap.tsf autoload/KEV3_kanmap.tsf
cp ~/.vim/autoload/KEV3_kanchar.tsf autoload/KEV3_kanchar.tsf
