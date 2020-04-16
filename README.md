
## Installation

```bash
cd
mv .vim .vim-old
git clone git@github.com:mattsoftware/vim_config.git .vim
ln -s .vim/vimrc .vimrc
cd .vim
git submodule init
git submodule update

npm install -g instant-markdown-d prettier

pushd bundle/tern_for_vim/
npm install
popd
```

