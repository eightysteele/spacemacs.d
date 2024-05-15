(defconst mlir-mode-packages
  '(
    (mlir-mode :location (recipe :fetcher local))))

(defun mlir-mode/init-mlir-mode ()
  (use-package mlir-mode
    :ensure t
    :init
    (progn
      (let ((spacemacs-dir (getenv "SPACEMACSDIR")))
        (if spacemacs-dir
            (let ((package-el-path (expand-file-name "layers/mlir-mode/local/mlir-mode.el" spacemacs-dir))
                  (client-el-path (expand-file-name "layers/mlir-mode/local/mlir-lsp-client.el" spacemacs-dir)))
              (if (file-exists-p package-el-path)
                  (load package-el-path)
                (message "Warning: mlir-mode.el not found at %s" package-el-path))
              (if (file-exists-p client-el-path)
                  (progn
                    (load client-el-path)
                    (require 'mlir-lsp-client)
                    (lsp-mlir-setup))
                (message "Warning: mlir-lsp-client.el not found at %s" package-el-path)))
          (message "Warning: SPACEMACSDIR environment variable is not set")))
      (add-to-list 'auto-mode-alist '("\\.mlir\\'" . mlir-mode)))))

      ;;(require 'mlir-lsp-client)

(defun mlir-mode/pre-init-mlir-mode ()
  (spacemacs|use-package-add-hook mlir-mode
    :post-config
    (add-hook 'mlir-mode-hook #'lsp)))


