(defconst bazel-packages
  '((bazel :location (recipe :fetcher local))))

(defun bazel/init-emacs-bazel-mode ()
  (use-package bazel
    :defer t
    :init
    (progn
      (let ((spacemacs-dir (getenv "SPACEMACSDIR")))
        (if spacemacs-dir
            (let ((bazel-el-path (expand-file-name "layers/bazel/emacs-bazel-mode/bazel.el" spacemacs-dir)))
              (if (file-exists-p bazel-el-path)
                  (load bazel-el-path)
                (message "Warning: bazel.el not found at %s" bazel-el-path)))
          (message "Warning: SPACEMACSDIR environment variable is not set")))
      (add-to-list 'auto-mode-alist '("\\.bazel\\'" . bazel-mode))
      (add-to-list 'auto-mode-alist '("BUILD\\'" . bazel-mode)))))

