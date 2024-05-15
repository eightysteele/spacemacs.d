(defconst tablegen-mode-packages
  '(
    (tablegen-mode :location (recipe :fetcher local))))

(defun tablegen-mode/init-tablegen-mode ()
  (use-package tablegen-mode
    :ensure t
    :init
    (progn
      (let ((spacemacs-dir (getenv "SPACEMACSDIR")))
        (if spacemacs-dir
            (let ((package-el-path (expand-file-name "layers/tablegen-mode/local/tablegen-mode.el" spacemacs-dir))
                  (client-el-path (expand-file-name "layers/tablegen-mode/local/tblgen-lsp-client.el" spacemacs-dir)))
              (if (file-exists-p package-el-path)
                  (load package-el-path)
                (message "Warning: tablegen-mode.el not found at %s" package-el-path))
              (if (file-exists-p client-el-path)
                  (progn
                    (load client-el-path)
                    (require 'tblgen-lsp-client)
                    (lsp-tblgen-setup))
                (message "Warning: tblgen-lsp-client.el not found at %s" package-el-path)))
          (message "Warning: SPACEMACSDIR environment variable is not set")))
      (add-to-list 'auto-mode-alist '("\\.td\\'" . tablegen-mode)))))

      ;;(require 'mlir-lsp-client)

(defun tablegen-mode/pre-init-tablegen-mode ()
  (spacemacs|use-package-add-hook tablegen-mode
    :post-config
    (add-hook 'tablegen-mode-hook #'lsp)))


