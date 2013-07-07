; .emacs file of luc {{{1

; NOTES {{{1
; M-x apropros
; M-x package-list-packages (needs internet)
;     then 'r' to update the list
;     'i' to mark for installation
;     'x' to install

; TODO {{{1
; folding mode


; dependencies {{{1

; common lisp (needed for many other things).
(require 'cl)

; the emacs library directory.  Why do I have to add this here?
(add-to-list 'load-path "~/.emacs.d")

; repository {{{2
; this has to be early for the installed packages to be found
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
	       '("elpa" . "http://elpa.gnu.org"))
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize))

; user defined functions {{{1
(defun luc-custom-set-window-size ()
  "Resize the current window to be exactly 80 chars wide"
  (interactive)
  (enlarge-window-horizontally (- 80 (window-width))))

(defun nstf ()
  (interactive)
  (ns-toggle-fullscreen))

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))))

(defun scm ()
  (interactive)
  (run-scheme scheme))


; keyboard {{{1

; map the cmd-key to meta (only in the gui, is caught by iterm)
(setq mac-command-modifier 'meta)

; use the alt-key to access the mac keyboard (letters like []{}~…)
(setq mac-option-modifier nil)

; jump over braces like in vim
(global-set-key "%" 'match-paren)

;(global-set-key (kbd "M-<f1>") 'hippie-expand)
;(global-set-key (kbd "TAB") 'hippie-expand)

; other autocomplete method
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (require 'auto-complete-config)
;; (ac-config-default)


; appearence {{{1
; higlight the matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)
;(scroll-bar-mode -1)

; do not display the toolbar
(ignore-errors (tool-bar-mode -1))

;; ;notes:
;; (set-frame-position (selected-frame) 0 0)
;; (set-frame-width (selected-frame) 80)
;; (set-frame-height (selected-frame) 60)
;; ;(set-window-width (selected-window) 80)


; modeline {{{2
; display the current time in the modeline
(display-time-mode 1)


; font {{{2
; from matthias benkard
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
 :height 120
 ;:background "grey12"
 ;:foreground "White"
 )


; solarized theme {{{2
;(add-to-list 'load-path "~/.emacs.d/color-theme")
;(add-to-list 'load-path "~/.emacs.d/color-theme/themes")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(add-to-list 'load-path "~/.emacs.d/solarized")
(require 'color-theme-solarized)
;(setq solarized-termcolors 256)
(color-theme-solarized-dark)


; minibuffer completition {{{1
;(ido-save-directory-list-file "~/.emacs.d/ido.last")
(require 'ido)
(ido-mode t)
;(require 'mcomplete)


; something ??? {{{1
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

; start the server {{{1
;(server-start)

; several options {{{1
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

;(setq Info-default-directory-list 'nil)

(setq explicit-shell-file-name "/usr/local/bin/zsh")

(setq history-delete-duplicates t)

; start in fullscreen on mac os x
(ignore-errors (ns-toggle-fullscreen))




; scheme stuff for minlog {{{1
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

; vim: foldmethod=marker
