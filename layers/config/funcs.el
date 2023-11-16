;;; Config layer: funcs  -*- lexical-binding: t; -*-

(defun config--clerk-show ()
  (interactive)
  (when-let
      ((filename
        (buffer-file-name)))
    (save-buffer)
    (cider-interactive-eval
     (concat "(nextjournal.clerk/show! \"" filename "\")"))))

(defun config--handle-writeroom-local-effects (flag)
  "Setup word wraps and folded lines on writeroom-mode toggle."
  (if flag
      (progn
        (toggle-word-wrap 1)
        (toggle-truncate-lines))
    (progn
      (toggle-word-wrap)
      (toggle-truncate-lines 1))))

(defun config--enable-pretty-lambdas ()
  "Make them beautiful!"
  (setq prettify-symbols-alist '(("lambda" . 955))))

(defun config--just-one-face (fn &rest args)
  "Optimization for orderless."
  (let ((orderless-match-faces [completions-common-part]))
    (apply fn args)))

(defun config--send-script-region-to-bash-shell (start end)
  "Send the current region to an existing or new shell buffer running Bash."
  (interactive "r")
  (let ((command (buffer-substring start end))
        (shell-buffer (get-buffer "*shell*")))
    (if shell-buffer
        ;; If an existing shell buffer is found, use it
        (progn
          (pop-to-buffer shell-buffer)
          (goto-char (point-max))
          (insert command)
          (comint-send-input))
      ;; If no shell buffer is found, create a new one
      (progn
        (split-window-below)  ;; Change to `split-window-right` for a vertical split
        (other-window 1)
        (shell)
        (let ((new-shell-buffer (current-buffer)))
          (with-current-buffer new-shell-buffer
            (sleep-for 0.5)  ;; Wait for the shell to start
            (insert "bash")  ;; Start Bash REPL
            (comint-send-input)
            (sleep-for 0.5)  ;; Wait for Bash to start
            (goto-char (point-max))
            (insert command)
            (comint-send-input)))))))
