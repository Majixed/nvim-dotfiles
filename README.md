## Windows issues
`telescope-fzf-native.nvim` must be compiled manually after install (MinGW).

Powershell:
```sh
cd ~/AppData/Local/nvim-data/lazy/telescope-fzf-native.nvim
cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -G "MinGW Makefiles"
cmake --build build --config Release
cmake --install build --prefix build
```
