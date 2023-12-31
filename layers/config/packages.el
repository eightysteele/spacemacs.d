;;; Config layer: package configuration  -*- lexical-binding: t; -*-

(defconst config-packages
  '(
    dockerfile-mode
    sh-mode
    geiser
    smartparens
    orderless
    org org-roam
    writeroom-mode
    circe
    clojure))

;; circe
(defun config/init-circe ()
  (use-package circe
    :ensure t
    :config
    (setq circe-network-options
          '(("Freenode"
             :tls t
             :nick "eighty"
             :sasl-username "my-nick"
             :sasl-password "my-password"
             :channels ("#emacs-circe"))))))

;; writeroom-mode
(defun config/init-writeroom-mode ()
  (use-package writeroom-mode
    :ensure t
    :hook
    (writeroom-mode-enable . (lambda ()
                               (visual-fill-column-mode 1)
                               (visual-line-mode 1)))
    (writeroom-mode-disable . (lambda ()
                                (visual-fill-column-mode -1)
                                (visula-line-mode -1)))))

;; orderless
(defun config/init-orderless ()
  (use-package orderless
    :ensure t
    :config
    (setq orderless-component-separator "[ &]")
    :custom
    (completion-styles '(orderless basic))
    (completion-category-overrides '((file (styles basic partial-completion))))
    (advice-add 'company-capf--candidates :around 'config--just-one-face)))

;; geiser
(defun config/pre-init-geiser ()
  (spacemacs|use-package-add-hook geiser
    :pre-init
    ;;(setq geiser-mit-binary "/Users/ads/bin/mit-scheme")
    (setq geiser-repl-current-project-function 'projectile-project-root)))

;; org-roam
(defun config/pre-init-org-roam ()
  (spacemacs|use-package-add-hook org-roam
    :post-init
    (org-roam-db-autosync-mode)
    :pre-init
    (setq org-roam-directory config__org-roam-path)
    (setq org-roam-completion-everywhere t)))

;; sh-mode
(defun config/pre-init-sh-mode ()
  (spacemacs|use-package-add-hook sh-mode
    :post-config
    (add-hook 'sh-mode-hook #'lsp)))

;; org
(defun config/pre-init-org ()
  (spacemacs|use-package-add-hook org
    :post-config
     (add-hook 'org-mode-hook
              (lambda ()
                (local-set-key (kbd "C-M-i") 'completion-at-point)))))

;; dockerfile-mode
(defun config/pre-init-dockerfile-mode ()
  (spacemacs|use-package-add-hook dockerfile-mode
    :post-config
    (add-hook 'dockerfile-mode-hook
              (lambda ()
                (local-set-key (kbd "C-c C-b") 'config--docker-build-with-target)))))
;; clojure
(defun config/pre-init-clojure ()
  (spacemacs|use-package-add-hook clojure
    :post-config
    (add-hook 'clojure-mode-hook
              (lambda ()
                (local-set-key (kbd "C-M-<return>") 'config--clerk-show)
                (visual-line-mode t)
                (visual-fill-column-mode t)))
    (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hook-clojure-mode)
    :pre-init
    (setq clojure-enable-sayid t)))

;; smartparens
(defun config/pre-init-smartparens ()
  (spacemacs|use-package-add-hook smartparens
    :post-init
    ;; disable paraedit bindings with smartparens
    (sp-use-paredit-bindings)))

;; racket-mode
(defun config/pre-init-racket-mode ()
  (spacemacs|use-package-add-hook racket-mode
    :post-init
    (turn-on-smartparens-strict-mode)
    (config--enable-pretty-lambdas)))
