;; EDK uses the new python.el from
;; https://github.com/fgallina/python.el
(require 'python)

(elpy-enable)

(provide 'python-config)


;; (add-hook 'python-mode-hook 'my/python-mode-hook)

(add-hook 'find-file-hooks 'maybe-load-template)
(defun maybe-load-template ()
  (interactive)
  (when (and
         (string-match "\\.py$" (buffer-file-name))
         (eq 1 (point-max)))
    (insert-file "~/.emacs.d/templates/template.py")))
