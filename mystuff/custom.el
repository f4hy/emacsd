(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it uP, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   [zenburn-bg zenburn-red zenburn-green zenburn-yellow zenburn-blue zenburn-magenta zenburn-cyan zenburn-fg])
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("e6fca0aa3f94451ed1fc06b1f022ded9f4a20ad5bd64e14fc568cd73b7cd1e49" "d34d39005154228bd6c65f7293a8e29b6f50c71d5a5652fd65e4a22406f575cd" "fef3defd7269ee8c9559e15b08d11cf2aac5bc75" "5600dc0bb4a2b72a613175da54edb4ad770105aa" "0174d99a8f1fdc506fa54403317072982656f127" "86adc18aa6fb3ea0a801831f7b0bc88ed5999386" default)))
 '(ede-project-directories (quote ("/home/bfahy/fitcode")))
 '(fringe-mode (quote (0)) nil (fringe))
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/org/tasks.org")))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(sml/inactive-background-color "dim gray")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(iswitchb-mode t)

;; (require 'ido)                      ; ido is part of emacs
;; (ido-mode t)                        ; for both buffers and files
;; (setq
;;    ido-ignore-buffers               ; ignore these guys
;;    '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido")
;;    ido-work-directory-list '("~/" "~/Desktop" "~/Documents")
;;    ido-case-fold  t                 ; be case-insensitive
;;    ido-use-filename-at-point nil    ; don't use filename at point (annoying)
;;    ido-use-url-at-point nil         ;  don't use url at point (annoying)
;;    ido-enable-flex-matching t       ; be flexible
;;    ido-max-prospects 6              ; don't spam my minibuffer
;;    ido-confirm-unique-completion t) ; wait for RET, even with unique completion

;; (custom-set-faces
;;  '(default ((t (:inherit nil :stipple nil :background "black" :foreground "#00ff00" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 117 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(delete-selection-mode 0)                ;dont delete the selection with a keypress!!



(autoload 'magit-status "magit" nil t)
(add-hook 'f90-mode-hook
          (lambda () (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))

(global-set-key (kbd "C-c j") 'just-one-space)
(global-set-key (kbd "C-c f") 'fixup-whitespace)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)

(global-set-key [f5] 'query-replace)
(global-set-key [f6] 'recompile)
(global-set-key [f7] 'hippie-expand)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key [C-tab] 'other-window)
(defun select-previous-window ()
  "Switch to the previous window"
  (interactive)
  (select-window (previous-window)))
(global-set-key [C-S-iso-lefttab] 'select-previous-window)
(global-set-key [C-M-tab] 'next-buffer)

(global-set-key [C-M-S-iso-lefttab] 'previous-buffer)
(global-set-key [f8] 'ispell)
(global-set-key [f9] 'magit-status)

(setq require-final-newline t)
(tool-bar-mode -1)

(autoload 'pkgbuild-mode "pkgbuild-mode.el" "PKGBUILD mode." t)
(setq auto-mode-alist (append '(("/PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

(require 're-builder)
(setq reb-re-syntax 'string)

(require 'tramp)
(setq tramp-default-method "ssh")


;; (autoload 'python-mode "python-mode.el" "Python mode." t)
;; (setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-c8" 'pep8)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-ck" 'delete-trailing-whitespace)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-cp" 'pylint)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-c\C-c" 'flycheck-mode)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-c`" 'next-error)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-ch" 'flymake-start-syntax-check)))
(add-hook 'python-mode-hook '(lambda () (add-hook 'before-save-hook 'delete-trailing-whitespace)))

(global-set-key "\M- " 'hippie-expand)

(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)


(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)


;; (defadvice package-compute-transaction
;;   (before
;;    package-compute-transaction-reverse (package-list requirements)
;;    activate compile)
;;   "reverse the requirements"
;;   (setq requirements (reverse requirements))
;;   (print requirements))

;; (defadvice package-download-tar
;;   (after package-download-tar-initialize activate compile)
;;   "initialize the package after compilation"
;;   (package-initialize))

;; (defadvice package-download-single
;;   (after package-download-single-initialize activate compile)
;;   "initialize the package after compilation"
;;   (package-initialize))


(setq c-default-style "k&r")
(defun my-make-CR-do-indent ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-make-CR-do-indent)

;; (define-key c-mode-base-map "\C-m" 'c-context-line-break)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


;; no overwrite mode
(put 'overwrite-mode 'disabled t)
(define-key global-map [(insert)] nil)

;; automagic make scripts executable
(add-hook 'after-save-hook
        #'(lambda ()
        (and (save-excursion
               (save-restriction
                 (widen)
                 (goto-char (point-min))
                 (save-match-data
                   (looking-at "^#!"))))
             (not (file-executable-p buffer-file-name))
             (shell-command (concat "chmod u+x " buffer-file-name))
             (message
              (concat "Saved as script: " buffer-file-name)))))


;; (load-theme 'solarized-dark)
(load-theme 'darkokai t)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/tasks.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("n" "Notes" entry (file+headline "~/org/notes.org" "Notes")
         "* %?\n %i\n  %a")))

; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(setq auto-mode-alist
      (append '(("\\.\\(plt\\|gnuplot\\)$" . gnuplot-mode)) auto-mode-alist))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
