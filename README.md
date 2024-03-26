## Windows issues
### PowerShell

If using a PowerShell version earlier than 7, `telescope-fzf-native.nvim` must be compiled manually after install.

Example with MinGW:
```sh
cd ~/AppData/Local/nvim-data/lazy/telescope-fzf-native.nvim
cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -G "MinGW Makefiles"
cmake --build build --config Release
cmake --install build --prefix build
```
