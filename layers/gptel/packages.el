(defconst gptel-packages
  `(gptel))

(defun gptel/init-gptel ()
  (use-package gptel
    :ensure t
    :init
    (setq gptel-api-key "sk-proj-oEUsbnokfxyZrw1jGOoFT3BlbkFJUTGlyUsg6bPSjhlmLCWV")))

