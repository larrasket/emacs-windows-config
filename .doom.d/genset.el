;;; genset.el -*- lexical-binding: t; -*-
(provide 'genset)

(setq-default fill-column 92)
(setq c-default-style "linux"
      c-basic-offset 4)
(setq org-roam-directory "~/roam")
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 12))
(custom-theme-set-faces! 'doom-tomorrow-night
  '(default :background "#121212"))
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "brave-browser-nightly")
(org-babel-do-load-languages 'org-babel-load-languages '((csharp . t)))
(setq treemacs-position 'right)
(setq dired-sidebar-refresh-on-special-commands 't)
(setq user-full-name "Salh Jabr"
      user-mail-address "jabr@emailasso.net")
(setq fill-column 92)



(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_)
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))


;; bi

(setq bidi-paragraph-direction 'left-to-right)
   (setq-default bidi-paragraph-direction 'left-to-right)
    (defun bidi-direction-toggle ()
      (interactive "")
      (setq bidi-display-reordering t)
      (if (equal bidi-paragraph-direction 'right-to-left)
          (setq bidi-paragraph-direction 'left-to-right)
        (setq bidi-paragraph-direction 'right-to-left))
      (message "%s" bidi-paragraph-direction))

(add-hook 'prog-mode-hook 'real-auto-save-mode)
(setq real-auto-save-interval 5) ;; in seconds

(yas-global-mode 1)
(add-hook 'yas-minor-mode(lambda()
                           (yas-activate-extra-mode 'fundamental-mode)))


;; modline
(setq doom-modeline-height 8)
(setq doom-modeline-bar-width 2)
(setq doom-modeline-icon (display-graphic-p))
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon nil)
(setq doom-modeline-buffer-modification-icon nil)
(setq doom-modeline-unicode-fallback nil)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-enable-word-count nil)


;; themes

(custom-theme-set-faces! 'doom-homage-black
  '(default :background "#121212"))
(custom-theme-set-faces! 'doom-one
  '(default :background "#121212"))
(custom-theme-set-faces! 'doom-one-light
  '(default :background "#ffffff"))



;; (custom-theme-set-faces! 'kaolin-aurora
;;   '(default :background "#121221"))
;;
;;
;;
;; (setq doom-theme 'kaolin-dark)
;; (setq doom-theme 'leuven)
;; (setq doom-theme 'doom-acario-light)
;; (setq doom-theme 'doom-badger)
;; (setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'default)
;; (setq doom-theme 'kaolin-galaxy)
;; (setq doom-theme 'habamax)
(setq doom-theme 'humanoid-dark)



;; IVY

(require 'ivy-posframe)
(setq ivy-posframe-height-alist '((swiper . 20)
                                  (t      . 40)))
(setq ivy-posframe-display-functions-alist
      '((swiper          . ivy-display-function-fallback)
        (complete-symbol . ivy-posframe-display-at-point)
        (counsel-M-x     . ivy-posframe-display-at-frame-top-center)
        (t               . ivy-posframe-display)))
(ivy-posframe-mode 1)
(setq ivy-posframe-parameters
      '((left-fringe . 8)
        (right-fringe . 8)))



(setq display-buffer-alist
      `(("*compilation*" . ((name . "*compilation*")
                            ,@default-frame-alist))))

(defun open-popup-on-side-or-below (buffer &optional alist)
  (+popup-display-buffer-stacked-side-window-fn
   buffer (append `((side . ,(if (one-window-p)
                                 'right
                               'bottom)))
                  alist)))

(set-popup-rule! "\\*compilation\\*" :side 'bottom :width 2.5)




(setq display-line-numbers-type 'relative)
(menu-bar--display-line-numbers-mode-relative)
(menu-bar-mode)





(setq large-file-warning-threshold nil)


(add-hook! 'artist-mode-hook
  (defun seanfarley//turnoff-line-mode ()
    (setq display-line-number-mode -1)))


(setq fancy-splash-image "/home/ghd/me/me.jpg")

(setq all-the-icons-color-icons nil)




(setq auto-save-visited-mode t)
