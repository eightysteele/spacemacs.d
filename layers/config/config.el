;;; Config Layer: config for layer variables  -*- lexical-binding: t; -*-

(global-prettify-symbols-mode 1)

;;; Org-roam
(defvar config__org-roam-path
  (concat (getenv "XDG_CONFIG_HOME") "/emacs/org-roam/org-roam-data")
  "Local path to where org-roam writes out files.")

(global-visual-line-mode t)

;;setq ob-mermaid-cli-path "/home/eighty/.config/nvm/versions/node/v21.5.0/bin/mmdc")

(setq org-startup-indented t)

(setq org-startup-with-latex-preview t)

(setq auto-fill-mode t)

(setq-default git-magit-status-fullscreen t)

;;(define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)

(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))

(setq lsp-clients-clangd-executable "/usr/local/bin/clangd")

;; Not needed with bazel gen of compile_commands.json?
;; (setq lsp-clients-clangd-args
;;      '("--query-driver=/usr/local/bin/clangd,/usr/bin/gcc,/usr/bin/g++"))
