;;; Config layer: package configuration  -*- lexical-binding: t; -*-

(defconst config-packages
  '(
    ;;lsp-julia
    dockerfile-mode
    sh-mode
    ;;geiser
    smartparens
    orderless
    org
    org-roam
    org-fragtog
    ;;circe
    clojure))

;; org-fragtog
(defun config/init-org-fragtog ()
  :ensure t)

;; circe
;; (defun config/init-circe ()
;;   (use-package circe
;;     :ensure t
;;     :config
;;     (setq circe-network-options
;;           '(("Freenode"
;;              :tls t
;;              :nick "eighty"
;;              :sasl-username "my-nick"
;;              :sasl-password "my-password"
;;              :channels ("#emacs-circe"))))))

;; orderless
(defun config/init-orderless ()
  (use-package orderless
    :ensure t
    :config
    (setq orderless-component-separator "[ &]")
    :custom
    (completion-styles '(orderless basic))
    (completion-category-overrijdes '((file (styles basic partial-completion))))
    (advice-add 'company-capf--candidates :around 'config--just-one-face)))

;; geiser
;; (defun config/pre-init-geiser ()
;;   (spacemacs|use-package-add-hook geiser
;;     :pre-init
;;     (setq geiser-mit-binary "/usr/localbin/mit-scheme")
;;     (setq geiser-repl-current-project-function 'projectile-project-root)))

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
    :pre-init
    (setq org-startup-indented t)
    :post-config
    (add-hook 'org-mode-hook 'org-fragtog-mode)
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

;; julia-lsp
;; (defun config/pre-init-lsp-julia ()
;;   (spacemacs|use-package-add-hook lsp-julia
;;     :pre-init
;;     (setq lsp-julia-default-environment "~/.julia/environments/v1.10")))

;; clojure
(defun config/pre-init-clojure ()
  (spacemacs|use-package-add-hook clojure
    :post-config
    (add-hook 'clojure-mode-hook
              (lambda ()
                (sayid-setup-package)
                (local-set-key (kbd "M-<return>") 'config--clerk-show)
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
