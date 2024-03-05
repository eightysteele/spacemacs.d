;;; Config Layer: config for layer variables  -*- lexical-binding: t; -*-

(global-prettify-symbols-mode 1)

;;; Org-roam
(defvar config__org-roam-path "~/.config/org-roam-data"
  "Local path to where org-roam writes out files.")

(global-visual-line-mode t)

(setq ob-mermaid-cli-path "/home/eighty/.config/nvm/versions/node/v21.5.0/bin/mmdc")

(setq org-startup-indented t)

(setq org-startup-with-latex-preview t)

(setq auto-fill-mode t)

(setq-default git-magit-status-fullscreen t)

;;(define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
