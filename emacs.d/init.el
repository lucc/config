; .emacs file of luc

; NOTES
; M-x apropros
; M-x package-list-packages (needs internet)
;     then 'r' to update the list
;     'i' to mark for installation
;     'x' to install

; TODO
; folding mode


; DEPENDENCIES
; common lisp (needed for many other things.
(require 'cl)


; KEYBOARD
; map the cmd-key to meta (only in the gui, is caught by item)
(setq mac-command-modifier 'meta)
; use the alt-key to access the mac keyboard (letters like []{}~…)
(setq mac-option-modifier nil)
(global-set-key (kbd "M-<f1>") 'hippie-expand)


; APPEARENCE
; higlight the matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)
;(scroll-bar-mode -1)
(ignore-errors (tool-bar-mode -1))





; MODELINE
; display the current time in the modeline
(display-time-mode 1)



; FUNCTIONS
(defun luc-custom-set-window-size ()
  "Resize the current window to be exactly 80 chars wide"
  (interactive)
  (enlarge-window-horizontally (- 80 (window-width))))
;; ;notes:
;; (set-frame-position (selected-frame) 0 0)
;; (set-frame-width (selected-frame) 80)
;; (set-frame-height (selected-frame) 60)
;; ;(set-window-width (selected-window) 80)

(defun nstf ()
  (interactive)
  (ns-toggle-fullscreen))

;;;; FONT
;; (ignore-errors
;;  (flet ((set-font (font)
;;           (set-frame-font font)
;;           (add-to-list 'default-frame-alist `(font . ,font))))
;;    (case window-system
;;      (x   (set-font "Inconsolata-14"))
;;      ;(ns  (set-font "Inconsolata-14"))   ;or "Monaco-12"
;;      (ns  (set-font "Inconsolata-12"))
;;      ;(ns  (set-font "Menlo-11"))
;;      (w32 (set-font "Consolas-12")))))

(set-face-attribute
 'default nil
; :family "Inconsolata"
 :family "Menlo"
 :height 140
 :background "grey12"
 :foreground "White")



; minibuffer completition
(require 'ido)
(ido-mode 1)
;(require 'mcomplete)



;; ; display-time-day-and-date display-time-24hr-format display-time-format
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(display-time-format "%Y-%m-%d %R")
;;  '(inhibit-startup-screen t))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  ; '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "White" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Inconsolata"))))
;; )

; start the server
;(server-start)


(setq inhibit-startup-screen t)
(setq display-time-format "%Y-%m-%d %R")


(ignore-errors (load "auctex.el" nil t t))
(ignore-errors (load "preview-latex.el" nil t t))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(ignore-errors (require 'tex-site))


(savehist-mode 1)
(desktop-save-mode 1)
(setq desktop-path '("~/.emacs.d"))

  (global-set-key "%" 'match-paren)
    (defun match-paren (arg)
      "Go to the matching paren if on a paren; otherwise insert %."
      (interactive "p")
      (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
            ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
            (t (self-insert-command (or arg 1)))))


(setq explicit-shell-file-name "/bin/zsh")


(setq history-delete-duplicates t)


; start in fullscreen on mac os x
(ignore-errors (ns-toggle-fullscreen))




; REPOSITORY
(ignore-errors ; whx is this necessary/why does it produce an error at start up time??
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/")))

;(setq Info-default-directory-list 'nil)



; scheme stuff for minlog
(cond ((getenv "SCHEME") (setq scheme (getenv "SCHEME")))
      ((eq 0 (shell-command "which petite"))
       (setq scheme "petite"))
      ((eq 0 (shell-command "which mzscheme"))
       (if (string-match "v4." (shell-command-to-string "mzscheme --version"))
	   (setq scheme "mzscheme -l mzscheme -l r5rs -i --load")
	 (setq scheme "mzscheme --load")))
      ((eq 0 (shell-command "which guile"))
       (setq scheme "guile -l"))
      (t 'nil))
(defun scm ()
  (interactive)
  (run-scheme scheme))
