echo "Building YCM"
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --omnisharp-completer --gocode-completer \
      --tern-completer --racer-completer
echo "DONE"

