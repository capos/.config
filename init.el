(server-start)

(require 'hippie-exp)
(require 'package)

(add-to-list 'package-archives             
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backups"))))

(menu-bar-mode 0)

(global-font-lock-mode t)
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (global-set-key "\C-u" 'c-electric-delete)
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 2))

(setq kill-whole-line t) 
(setq c-hungry-delete-key t)

(add-hook 'c-mode-common-hook
          '(lambda ()
             (turn-on-auto-fill)
             (setq fill-column 80)
             (setq comment-column 60)
             (modify-syntax-entry ?_ "w")       ; now '_' is not considered a word-delimiter
             (c-set-style "ellemtel")           ; set indentation style
             (local-set-key [(control tab)]     ; move to next tempo mark
                            'tempo-forward-mark)
             ))
(global-set-key "\C-o" 'dabbrev-expand)
(global-set-key "`" 'other-window)
(global-set-key "\M-g" 'goto-line)

(transient-mark-mode)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(debug-on-error t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 20) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (set-background-color "black"))))
 '(transient-mark-mode t))
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . linux-c-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . linux-c-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
(autoload 'javascript-mode "javascript" nil t)

;; Background.

(set-background-color "black")
(set-face-background 'default "black")
(set-face-background 'region "black")
(set-face-foreground 'default "white")
(set-face-foreground 'region "gray60")
(set-foreground-color "white")
(set-cursor-color "red")

(add-hook 'octave-mode-hook
	  (lambda()
	    (setq octave-auto-indent 1)
	    (setq octave-blink-matching-block 1)
	    (setq octave-block-offset 8)
	    (setq octave-send-line-auto-forward 0)
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		(font-lock-mode 1))))
