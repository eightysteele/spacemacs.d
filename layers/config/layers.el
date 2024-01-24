;;; Config Layer: layer declarations and dependencies -*- lexical-binding: t; -*-

(configuration-layer/declare-layer-dependencies
 '(
   yaml
   markdown
   csv
   (julia :variables
          julia-backend 'lsp)
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
            clojure-enable-linters '(clj-kondo joker)
            clojure-backend 'cider
            clojure-enable-clj-refactor t
            clojure-enable-fancify-symbols t)
   (markdown :variables markdown-live-preview-engine 'vmd)
   (docker :variables docker-dockerfile-backend 'lsp)
   (scheme :variables scheme-implementations '(mit))
   (org :variables org-enable-roam-support t)
   (python :variables
           python-backend 'lsp
           python-lsp-server 'pylsp
           python-formatter 'lsp
           python-format-on-save t
           python-sort-imports-on-save t)))
