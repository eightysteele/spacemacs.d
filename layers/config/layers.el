;;; Config Layer: layer declarations and dependencies -*- lexical-binding: t; -*-

(configuration-layer/declare-layer-dependencies
 '(
   frames-only
   bazel
   javascript
   html
   yaml
   markdown
   csv
   pdf
   mermaid
   (c-c++ :variables
          c-c++-backend 'lsp-clangd
          ;;c-c++-lsp-enable-semantic-highlight 'rainbow
          ;;c-c++-dap-adapters '(dap-lldb dap-cpptools)
          ;;c-c++-enable-clang-format-on-save t
          ;;c-c++-enable-google-style t
          ;;c-c++-enable-google-newline t
          ;;c-c++-enable-auto-newline t
          ;;c-c++-adopt-subprojects t
          c-c++-default-mode-for-headers 'c++-mode)
   (treemacs :variables
             treemacs-use-follow-mode 'tag
             treemacs-use-filewatch-mode t
             treemacs-use-scope-type 'Perspectives
             treemacs-use-git-mode 'deferred)
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
   (org :variables
        org-enable-roam-support t
        org-enable-reveal-js-support t
        org-enable-roam-ui t
        org-enable-modern-support t)
   (python :variables
           python-backend 'lsp
           python-lsp-server 'pylsp
           python-formatter 'lsp
           python-format-on-save t
           python-sort-imports-on-save t)))
