;;; Config Layer: layer declarations and dependencies -*- lexical-binding: t; -*-

(configuration-layer/declare-layer-dependencies
 '(
   (shell :variables
          shell-default-shell 'eshell
          shell-default-position 'top
          shell-default-height 70
          shell-enable-smart-eshell t
          spacemacs-vterm-history-file-location "~/.bash_history"
          shell-default-term-shell "/bin/bash"
          multi-term-program "/bin/bash")
   lsp
   (shell-scripts :variables
                  shell-scripts-backend 'lsp
                  shell-scripts-lsp-server 'bash-language-server
                  shell-scripts-format-on-save t)
   (clojure :variables
            clojure-enable-linters '(clj-kondo joker))
   (markdown :variables markdown-live-preview-engine 'vmd)
   (docker :variables docker-dockerfile-backend 'lsp)
   (scheme :variables scheme-implementations '(mit))
   (org :variables org-enable-roam-support t)))
