#!/usr/bin/env bash
echo "🪛 Installing VSCode Extensions:"
echo "--------------------------------"
code --extensions-dir=.vscode-extensions --install-extension donjayamanne.python-environment-manager
code --extensions-dir=.vscode-extensions --install-extension github.copilot
code --extensions-dir=.vscode-extensions --install-extension github.copilot-chat
code --extensions-dir=.vscode-extensions --install-extension kevinrose.vsc-python-indent
code --extensions-dir=.vscode-extensions --install-extension ms-python.black-formatter
code --extensions-dir=.vscode-extensions --install-extension ms-python.debugpy
code --extensions-dir=.vscode-extensions --install-extension ms-python.python
code --extensions-dir=.vscode-extensions --install-extension ms-python.vscode-pylance
code --extensions-dir=.vscode-extensions --install-extension ms-toolsai.jupyter
code --extensions-dir=.vscode-extensions --install-extension ms-toolsai.jupyter-keymap
code --extensions-dir=.vscode-extensions --install-extension ms-toolsai.jupyter-renderers
code --extensions-dir=.vscode-extensions --install-extension ms-toolsai.vscode-jupyter-cell-tags
code --extensions-dir=.vscode-extensions --install-extension ms-toolsai.vscode-jupyter-slideshow
code --extensions-dir=.vscode-extensions --install-extension njpwerner.autodocstring
code --extensions-dir=.vscode-extensions --install-extension waderyan.gitblame
code --extensions-dir=".vscode-extensions" .
