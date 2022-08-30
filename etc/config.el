;; org keywords


(after! org
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"  ; A task that needs doing & is ready to do
           "PROJ(p)"  ; A project, which usually contains other tasks
           "LOOP(r)"  ; A recurring task
           "STUDY(s)"  ; A task that is in progress
           "WORK(w)"  ; Something external is holding up this task
           "HOLD(h)"  ; This task is paused/on hold because of me
           "IDEA(i)"  ; An unconfirmed and unapproved task or notion
           "READ(b)"  ; To Read
           "CHECK(c)"  ; To Read
           "|"
           "DONE(d)"  ; Task successfully completed
           "KILL(k)") ; Task was cancelled, aborted or is no longer applicable
          (sequence
           "[ ](T)"   ; A task that needs doing
           "[-](S)"   ; Task is in progress
           "[?](W)"   ; Task is being held up or paused
           "|"
           "[X](D)")  ; Task was completed
          (sequence
           "|"
           "OKAY(o)"
           "YES(y)"
           "NO(n)"))
        org-todo-keyword-faces
        '(("[-]"  . +org-todo-active)
          ("STUDY" . "LightBlue")
          ("[?]"  . +org-todo-onhold)
          ("WORK" . "#86ba96")
          ("HOLD" . +org-todo-onhold)
          ("PROJ" . +org-todo-project)
          ("NO"   . +org-todo-cancel)
          ("READ" . "#98be65")
          ("CHECK" . "#fc791c")
          ("KILL" . +org-todo-cancel))))




;; Settings
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





;; (setq display-line-numbers-type t)
(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_)
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))




(with-eval-after-load 'org
  ;; Allow multiple line Org emphasis markup.
  ;; http://emacs.stackexchange.com/a/13828/115
  (setcar (nthcdr 4 org-emphasis-regexp-components) 20) ;Up to 20 lines, default is just 1
  ;; Below is needed to apply the modified `org-emphasis-regexp-components'
  ;; settings from above.
  (org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components))













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












;; hooks

(add-hook 'dired-mode-hook 'org-download-enable)
(add-hook 'dired-mode-hook(lambda () (solaire-mode -1)))
(add-hook 'neotree-mode-hook(lambda () (solaire-mode -1)))


;; C++


(defun my-cpp-mode-setup ()
  (lsp)
  (company-mode)
  (flycheck-mode)
  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4))

(add-hook 'c++-mode-hook 'my-csharp-mode-setup t)
(add-hook 'c-mode-hook 'my-csharp-mode-setup t)



(defun compileandrun()
(interactive)
(save-buffer)
(compile (concat "g++ "  (file-name-nondirectory (buffer-file-name)) " -o "
(file-name-sans-extension   (file-name-nondirectory (buffer-file-name))) " && ./"
(file-name-sans-extension  (file-name-nondirectory (buffer-file-name))) " && rm "
(file-name-sans-extension  (file-name-nondirectory (buffer-file-name)))
) t  ) (other-window t)
(end-of-add-hook 'c++-mode))



(defun sharprun()
(interactive)
(save-buffer)
(compile (concat "dotnet run") t  ) (other-window t)
(end-of-add-hook 'csharp-mode))



(defun gorun()
(interactive)
(save-buffer)
(compile (concat "go run .") t  ) (other-window t)
(end-of-add-hook 'go-mode))



(defun rungo()
(interactive)
(save-buffer)
(compile (concat "go run "  (file-name-nondirectory (buffer-file-name))
;; (file-name-sans-extension  (file-name-nondirectory (buffer-file-name)))
) t  )
(other-window t)
;; (+debugger/start)
(end-of-add-hook 'go-mode))


(defun compiledep()
(interactive)
(save-buffer)
(compile (concat "g++ "  (file-name-nondirectory (buffer-file-name)) " -g -o "
(file-name-sans-extension  (file-name-nondirectory (buffer-file-name)))
) t  )
(other-window t)
;; (+debugger/start)
(end-of-add-hook 'c++-mode))


(add-hook 'c++-mode-hook
          (lambda () (local-set-key (kbd "C-c C-c") 'compileandrun)))

(add-hook 'csharp-mode-hook
          (lambda () (local-set-key (kbd "C-c C-c") 'sharprun)))


(add-hook 'go-mode-hook
          (lambda () (local-set-key (kbd "C-c C-c") 'gorun)))


(add-hook 'go-mode-hook
          (lambda () (local-set-key (kbd "<f2>") 'rungo)))



(add-hook 'c++-mode-hook
          (lambda () (local-set-key (kbd "M-<f5>") 'compiledep)))


(add-hook 'lsp-mode-hook
          (lambda ()
             (add-hook 'after-save-hook 'lsp-format-buffer nil 'make-it-local)))



(require 'org-download)
(add-hook 'dired-mode-hook 'org-download-enable)
(require 'real-auto-save)
(add-hook 'prog-mode-hook 'real-auto-save-mode)
(setq real-auto-save-interval 5) ;; in seconds


(yas-global-mode 1)
(add-hook 'yas-minor-mode(lambda()
                           (yas-activate-extra-mode 'fundamental-mode)))
(add-hook 'sage-shell-after-prompt-hook #'sage-shell-view-mode)












;; hugo
(setq easy-hugo-basedir "~/blog/")
(setq HUGO_BASE_DIR "~/blog/")
(setq org-hugo-base-dir "~/blog/")
(setq easy-hugo-url "/")
(setq easy-hugo-default-ext ".org")
(setq org-startup-folded t)












;; else








;; modline
(setq doom-modeline-height 8)
(setq doom-modeline-bar-width 2)
(setq doom-modeline-icon (display-graphic-p))
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-buffer-modification-icon t)
(setq doom-modeline-unicode-fallback nil)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-enable-word-count t)














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
;; (setq doom-theme 'habamax)
(setq doom-theme 'kaolin-galaxy)
;; (load-theme 'habamax)














;; sql

(require 'ejc-sql)
(ejc-create-connection
 "q"
 :classpath "[/home/ghd/.m2/repository/postgresql/postgresql/9.3-1102.jdbc41/postgresql-9.3-1102.jdbc41.jar]"
 :password ""
 :user "postgres"
 :port "5432"
 :host "localhost"
 :dbname "postgres"
 :dbtype "postgresql")


(ejc-create-connection
 "q"
 :classpath "[/home/ghd/.m2/repository/postgresql/postgresql/9.3-1102.jdbc41/postgresql-9.3-1102.jdbc41.jar]"
 :password ""
 :user "postgres"
 :port "5432"
 :host "localhost"
 :dbname "postgres"
 :dbtype "postgresql")



(ejc-create-connection
 "ms"
 :classpath "[/home/ghd/.m2/repository/com/microsoft/sqlserver/mssql-jdbc/6.2.2.jre8/mssql-jdbc-6.2.2.jre8.jar]"
 :password "010203Aa"
 :user "sa"
 :port "1433"
 :host "localhost"
 :dbname "ss"
 :dbtype "sqlserver")





(require 'ejc-autocomplete)
(add-hook 'ejc-sql-minor-mode-hook
          (lambda ()
            (auto-complete-mode t)
            (ejc-ac-setup)))
(require 'ejc-company)

(push 'ejc-company-backend company-backends)
(add-hook 'ejc-sql-minor-mode-hook
          (lambda ()
            (company-mode t)))
(setq ejc-complete-on-dot t)


(setq sql-connection-alist
      '((pool-a
         (sql-product 'postgresql)
         (sql-server "localhost")
         (sql-user "postgresql")
         (sql-password "")
         (sql-database "dvdrental ")
         (sql-port 5433))))











;; LaTeX

(defun my-tex ()
  (interactive)
  (save-buffer)
  (TeX-command "LaTeX" 'TeX-master-file -1))
(defun aftaa () (add-hook 'after-save-hook 'my-tex))
(add-hook 'LaTeX-mode-hook #'aftaa)
(defun JH/remove-electric-indent-mode ()
  (electric-indent-local-mode -1))
(setq LaTeX-indent-environment-list '())
(setq LaTeX-indent-level 0)
(setq LaTeX-item-indent 0)
(setq LaTeX-left-right-indent-level 0)
(setq TeX-brace-indent-level 0)
(add-hook 'LaTeX-mode-hook 'JH/remove-electric-indent-mode)
(add-hook 'tex-mode-hook 'JH/remove-electric-indent-mode)
(setq TeX-brace-indent-level 4)
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))
(setq shell-command-switch "-ic")








(use-package exec-path-from-shell
   :if (memq window-system '(mac ns))
   :ensure t
   :config
   (exec-path-from-shell-initialize))











;; Csharp

(defun my-csharp-mode-setup ()
  (lsp)
  (company-mode)
  (flycheck-mode)
  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)



(setq org-tree-slide-skip-outline-level 4)
(setq term-default-fg-color "#FFFFFF") (setq term-default-bg-color "#FFFFFF")














;; LSP

(setq lsp-enable-symbol-highlighting t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-show-with-cursor t)
(setq lsp-ui-doc-show-with-mouse t)
(setq lsp-lens-enable t)
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-enable t)
(setq lsp-modeline-code-actions-enable t)
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-eldoc-enable-hover t)
(setq lsp-modeline-diagnostics-enable t)
(setq lsp-signature-auto-activate t) ;; you could manually request them via `lsp-signature-activate`
(setq lsp-signature-render-documentation t)
(setq lsp-completion-show-detail t)
(setq lsp-completion-show-kind t)
(setq quickrun-focus-p nil)






























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
                            ,@default-frame-alist
                            (left . (- 1))
                            (top . 0)))))

(defun open-popup-on-side-or-below (buffer &optional alist)
  (+popup-display-buffer-stacked-side-window-fn
   buffer (append `((side . ,(if (one-window-p)
                                 'right
                               'bottom)))
                  alist)))

(set-popup-rule! "\\*compilation\\*" :side 'bottom :width 2.5)













;; keys

(global-set-key [f3] 'toggle-maximize-buffer)
(global-set-key (kbd "C-<=>") 'text-scale-increase)
(global-set-key (kbd "C-<->") 'text-scale-decrease)
(global-set-key (kbd "C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<down>") 'shrink-window)
(global-set-key (kbd "C-<up>") 'enlarge-windor)
(global-set-key (kbd "M-n") 'make-frame)
(global-set-key (kbd "M-z") 'flycheck-list-errors) (global-set-key (kbd "M-w") 'eww-search-words)
(global-set-key (kbd "M-f") 'org-footnote-action)


(map! :leader
      :desc "move to jorunal"
      "j" #'org-journal-new-entry)
(map! :leader
      :desc "run vterm"
      "t t" 'vterm)
(map! :leader
      :desc "run mail"
      "m m" 'mu4e)
(map! :leader
      :desc "watch var"
      "o w" 'dap-ui-expressions-add)
(map! :leader
      :desc "open-ajenda"
      "a" #'org-agenda)

(map! :leader
      :desc "insert date"
      "d" #'org-schedule)


(map! :leader
      :desc "show errors"
      "e" #'flycheck-list-errors)

(map! :leader
      :desc "evaluate latex"
      "l e" #'TeX-command-master "LaTex")

(map! :leader
      :desc "open leetcode"
      "l l" #'leetcode)



(map! :leader
      :desc "roam graph"
      "r g" #'org-roam-graph)


(map! :leader
      :desc "add tag"
      "r t" #'org-roam-tag-add)



(map! :leader
      :desc "switch to raom buffer"
      "r b" #'org-roam-buffer-toggle)


(map! :leader
      :desc "capture"
      "r c" #'org-roam-capture)


(map! :leader
      :desc "insert"
      "r i" #'org-roam-node-insert)


(map! :leader
      :desc "find file"
      "r f" #'org-roam-node-find)

;; (map! :leader
;;       :desc "find ref"
;;       "r e" #'org-roam-capture-to-n)

(map! :leader
      :desc "roam"
      "r r" #'org-roam-buffer-display-dedicated)

(defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

;; need another one for python stuff, since this gets re-bound


(global-set-key (kbd "<f8>") 'org-tree-slide-mode)
(global-set-key [f6] (lambda () (interactive) (neotree-project-dir) (lsp-treemacs-symbols) (evil-window-next) ))
(global-set-key (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)
(global-set-key (kbd "<f11>") 'org-tree-slide-move-next-tree)
(global-set-key (kbd "<f12>") 'org-tree-slide-move-previous-tree)
(global-set-key (kbd "M-RET") 'lsp-execute-code-action)


;; debug

(global-set-key [f5] '+debugger/start)
(global-set-key (kbd "C-<f5>")'+debugger/quit)
(global-set-key [f11] 'dap-step-in)
(global-set-key [f12] 'lsp-goto-implementation)
(global-set-key [f9] 'dap-breakpoint-toggle)










;; language tool

(setq languagetool-language-tool-jar
      "~/.languagetool/languagetool-commandline.jar")
(setq languagetool-default-language "en-GB")
(global-set-key (kbd "C-c l c") 'languagetool-check)
(global-set-key (kbd "C-q") 'org-agenda-open-link)
(global-set-key (kbd "C-;") 'iedit-mode)
(global-set-key (kbd "C-c l d") 'langrrgetool-clear-buffer)
(global-set-key (kbd "C-c l p") 'languagetool-correct-at-point)
(global-set-key (kbd "C-c l b") 'languagetool-correct-buffer)
(global-set-key (kbd "C-c l l") 'languagetool-set-language)
(global-set-key (kbd "C-c l l") 'languagetool-set-language)
(global-set-key (kbd "C-c x") 'org-latex-preview)





;; Trigger completion immediately.

(setq display-line-numbers-type 'relative)
(menu-bar--display-line-numbers-mode-relative)
(menu-bar-mode)


(add-hook 'pdf-view-mode-hook
          (lambda () (local-set-key (kbd "<f2>") #'pdf-annot-add-text-annotation)))
(add-hook 'pdf-view-mode-hook
          (lambda () (local-set-key (kbd "<f3>") #'pdf-annot-add-underline-markup-annotation)))




(setq org-journal-date-format "%A, %d %B %Y")
(setq org-journal-file-format "%Y%m%d.org")
(setq org-journal-enable-agenda-integration t)

(setq org-directory "/mnt/disk/leet")
(setq org-agenda-files '("/mnt/disk/leet"))
(setq org-journal-dir "/mnt/disk/leet/journal")
(add-to-list 'org-agenda-files org-journal-dir)


(use-package! awqat
  :commands (awqat-display-prayer-time-mode
             awqat-times-for-day)
  :config
  (setq calendar-latitude 30.0
        calendar-longitude 31.2
        awqat-mode-line-format " 🕌 ${prayer} (${hours}h${minutes}m) "))
(awqat-display-prayer-time-mode)
(global-wakatime-mode)

(setq neo-smart-open t)
(setq neo-theme (if (display-graphic-p) 'icons 'icons))
(setq doom-themes-neotree-file-icons 'nil)











(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/roam"))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))
    (defun cm/deft-parse-title (file contents)
    "Parse the given FILE and CONTENTS and determine the title.
  If `deft-use-filename-as-title' is nil, the title is taken to
  be the first non-empty line of the FILE.  Else the base name of the FILE is
  used as title."
      (let ((begin (string-match "^#\\+[tT][iI][tT][lL][eE]: .*$" contents)))
	(if begin
	    (string-trim (substring contents begin (match-end 0)) "#\\+[tT][iI][tT][lL][eE]: *" "[\n\t ]+")
	  (deft-base-filename file))))

    (advice-add 'deft-parse-title :override #'cm/deft-parse-title)

    (setq deft-strip-summary-regexp
	  (concat "\\("
		  "[\n\t]" ;; blank
		  "\\|^#\\+[[:alpha:]_]+:.*$" ;; org-mode metadata
		  "\\|^:PROPERTIES:\n\\(.+\n\\)+:END:\n"
		  "\\)"))











(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(setq leetcode-prefer-language "cpp")
(setq leetcode-prefer-sql "mysql")
(setq leetcode-save-solutions t)
(setq leetcode-directory "/home/ghd/leet/ps/lc")





































(defun execute-c++-program ()
  (interactive)
  (defvar foo)
  (setq foo (concat "g++ " (buffer-name) " && ./a.out" ))
  (shell foo))



(add-hook 'org-mode-hook 'turn-on-auto-fill)


;
(add-hook 'after-init-hook #'global-flycheck-mode) (add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
              (display-buffer-reuse-window
               display-buffer-in-side-window)
              (side            . bottom)
              (reusable-frames . visible)
              (window-height   . 0.18)))

 (defun my-flymd-browser-function (url)
   (let ((browse-url-browser-function 'browse-url-firefox))
     (browse-url url)))
 (setq flymd-browser-open-function 'my-flymd-browser-function)


(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)



















(setq large-file-warning-threshold nil)



(add-hook! 'artist-mode-hook
  (defun seanfarley//turnoff-line-mode ()
    (setq display-line-number-mode -1)))


(setq fancy-splash-image "/home/ghd/me/me.jpg")

(setq all-the-icons-color-icons nil)




(setq auto-save-visited-mode t)





;; (add-hook 'auto-save-hook 'org-save-all-org-buffers)
(setq pdf-view-midnight-colors '("#ABB2BF" . "#282C35"))
(setq sr-speedbar-right-side nil)
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")
(setq sr-speedbar-max-width 40)
(setq imenu-list-size 43)
(setq twittering-allow-insecure-server-cert t)
(icomplete-mode)
(setq latex-run-command "pdflatex")


(defun enable-doom-modeline-icons (_frame)
  (setq doom-modeline-icon t))

(add-hook 'after-make-frame-functions
          #'enable-doom-modeline-icons)






;; Store Org-link in eww-mode buffer
(add-hook 'org-store-link-functions 'org-eww-store-link)
(defun org-eww-store-link ()
  "Store a link to the url of a eww buffer."
  (when (eq major-mode 'eww-mode)
    (org-store-link-props
     :type "eww"
     :link (if (< emacs-major-version 25)
	       eww-current-url
	     (eww-current-url))
     :url (url-view-url t)
     :description (if (< emacs-major-version 25)
		      (or eww-current-title eww-current-url)
		    (or (plist-get eww-data :title)
			  (eww-current-url))))))

;; Some auxiliary functions concerning links in eww buffers
(defun org-eww-goto-next-url-property-change ()
  "Move cursor to the start of next link if exists.  Else no
move.  Return point."
  (goto-char
   (or (next-single-property-change (point) 'shr-url)
       (point))))

(defun org-eww-has-further-url-property-change-p ()
  "Return t if there is a next url property change else nil."
  (save-excursion
    (not (eq (point) (org-eww-goto-next-url-property-change)))))

(defun org-eww-url-below-point ()
  "Return the url below point if there is an url; otherwise, return nil."
  (get-text-property (point) 'shr-url))

(defun org-eww-copy-for-org-mode ()
  "Copy current buffer content or active region with `org-mode' style links.
This will encode `link-title' and `link-location' with
`org-make-link-string', and insert the transformed test into the kill ring,
so that it can be yanked into an Org-mode buffer with links working correctly.

Further lines starting with a star get quoted with a comma to keep
the structure of the org file."
  (interactive)
  (let* ((regionp (org-region-active-p))
         (transform-start (point-min))
         (transform-end (point-max))
         return-content
         link-location link-title
         temp-position out-bound)
    (when regionp
      (setq transform-start (region-beginning))
      (setq transform-end (region-end))
      ;; Deactivate mark if current mark is activate.
      (if (fboundp 'deactivate-mark) (deactivate-mark)))
    (message "Transforming links...")
    (save-excursion
      (goto-char transform-start)
      (while (and (not out-bound)                 ; still inside region to copy
                  (org-eww-has-further-url-property-change-p)) ; there is a next link
        ;; store current point before jump next anchor
        (setq temp-position (point))
        ;; move to next anchor when current point is not at anchor
        (or (org-eww-url-below-point)
	    (org-eww-goto-next-url-property-change))
	(assert (org-eww-url-below-point) t
                "program logic error: point must have an url below but it hasn't")
	(if (<= (point) transform-end)  ; if point is inside transform bound
	    (progn
	      ;; get content between two links.
	      (if (< temp-position (point))
		  (setq return-content (concat return-content
					       (buffer-substring
						temp-position (point)))))
	      ;; get link location at current point.
	      (setq link-location (org-eww-url-below-point))
	      ;; get link title at current point.
	      (setq link-title
		    (buffer-substring
		     (point)
		     (org-eww-goto-next-url-property-change)))
              ;; concat `org-mode' style url to `return-content'.
              (setq return-content (concat return-content
                                           (org-make-link-string
                                            link-location link-title))))
	  (goto-char temp-position)     ; reset point before jump next anchor
	  (setq out-bound t)            ; for break out `while' loop
	  ))
      ;; add the rest until end of the region to be copied
      (if (< (point) transform-end)
          (setq return-content
                (concat return-content
                        (buffer-substring (point) transform-end))))
      ;; quote lines starting with *
      (org-kill-new
       (with-temp-buffer
	 (insert return-content)
	 (goto-char 0)
	 (while (re-search-forward "^\*" nil t)
	   (replace-match ",*"))
	 (buffer-string)))
      (message "Transforming links...done, use C-y to insert text into Org-mode file"))))

;; Additional keys for eww-mode

(defun org-eww-extend-eww-keymap ()
  (define-key eww-mode-map "\C-c\C-x\M-w" 'org-eww-copy-for-org-mode)
  (define-key eww-mode-map "\C-c\C-x\C-w" 'org-eww-copy-for-org-mode))

(when (and (boundp 'eww-mode-map)
           (keymapp eww-mode-map)) ; eww is already up.
  (org-eww-extend-eww-keymap))

(add-hook
 'eww-mode-hook
 (lambda () (org-eww-extend-eww-keymap)))

(provide 'org-eww)
















(add-hook 'company-mode-hook 'company-box-mode)








(defun xah-open-in-external-app (&optional @fname)
  "Open the current file or dired marked files in external app.
When called in emacs lisp, if @fname is given, open that.
URL `http://xahlee.info/emacs/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2019-11-04 2021-02-16"
  (interactive)
  (let* (
         ($file-list
          (if @fname
              (progn (list @fname))
            (if (string-equal major-mode "dired-mode")
                (dired-get-marked-files)
              (list (buffer-file-name)))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda ($fpath)
           (shell-command (concat "PowerShell -Command \"Invoke-Item -LiteralPath\" " "'" (shell-quote-argument (expand-file-name $fpath )) "'")))
         $file-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (concat "open " (shell-quote-argument $fpath))))  $file-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda ($fpath) (let ((process-connection-type nil))
                            (start-process "" nil "xdg-open" $fpath))) $file-list))))))




(add-hook 'dired-mode-hook
          (lambda () (local-set-key (kbd "C-c C-c") #'xah-open-in-external-app)))











;; email






(after! mu4e
  ;; load package to be able to capture emails for GTD
  (require 'org-mu4e)
  ;; do not use rich text emails
  (remove-hook! 'mu4e-compose-mode-hook #'org-mu4e-compose-org-mode)
  ;; ensure viewing messages and queries in mu4e workspace
  ;; instead of displaying the fallback buffer (dashboard) after quitting mu4e, switch to last active buffer in workspace
  ;; attach files to messages by marking them in dired buffer
  (require 'gnus-dired)
  (setq gnus-dired-mail-mode 'mu4e-user-agent)
  (add-hook! 'dired-mode-hook #'turn-on-gnus-dired-mode)
  ;; disable line wrapping when viewing headers
  ;; configure mu4e options
  (setq mu4e-confirm-quit nil ; quit without asking
        mu4e-attachment-dir "~/Downloads"
        mu4e-maildir (expand-file-name "~/email/mbsyncmail")
        mu4e-get-mail-command "mbsync nameaccount"
        mu4e-user-mail-address-list '("jabr@emailasso.net" "ghd@keemail.me")
	    user-mail-address "jabr@emailasso.net"
	    user-full-name "Salh Jabr")
  (setq message-send-mail-function 'smtpmail-send-it
	smtpmail-stream-type 'ssl
	smtpmail-default-smtp-server "mail.mailo.com"
	smtpmail-smtp-server "mail.mailo.com"
	smtpmail-smtp-service 465)
  ;; add custom actions for messages
  (add-to-list 'mu4e-view-actions
	       '("View in browser" . mu4e-action-view-in-browser) t))







(mu4e-alert-set-default-style 'libnotify)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)











(setq mu4e-html2text-command "w3m -T text/html" ; how to hanfle html-formatted emails
      mu4e-update-interval 300                  ; seconds between each mail retrieval
      mu4e-headers-auto-update t                ; avoid to type `g' to update
      mu4e-view-show-images t                   ; show images in the view buffer
      mu4e-compose-signature-auto-include nil   ; I don't want a message signature
      mu4e-use-fancy-chars t)                   ; allow fancy icons for mail threads



;; Revert Doom-emacs fast index settings back to default
(with-eval-after-load 'mu4e
  (setq
    mu4e-index-cleanup t      ;; do a full cleanup check
    mu4e-index-lazy-check nil))    ;; consider up-to-date dirs




(setq org-roam-capture-templates
      '(("m" "main" plain
         "%?"
         :if-new
         (file+head "main/${slug}.org" "#+title: ${title}\n#+filetags: \n- tags :: ")
         :immediate-finish t
         :unnarrowed t)
        ("p" "People" plain
         "%?"
         :if-new
         (file+head "main/${slug}.org" "#+title: ${title}\n#+filetags: People\n- tags :: ")
         :immediate-finish t
         :unnarrowed t)
        ("s" "saved" plain "%?"
         :if-new
         (file+head "saved/${slug}.org" "#+title: ${title}\n#+filetags: \n- tags :: [[roam:saved things]]")
         :immediate-finish t
         :unnarrowed t)
        ("c" "contemplations" plain "%?"
         :if-new
         (file+head "contemplations/${slug}.org" "#+title: ${title}\n#+filetags: \n- tags :: [[roam:Contemplation]]")
         :immediate-finish t
         :unnarrowed t)
        ("q" "quotes" plain "%?"
         :if-new
         (file+head "quotes/${slug}.org" "#+title: ${title}\n#+filetags: \n- tags :: [[roam:Quotes]]")
         :immediate-finish t
         :unnarrowed t)
        ("l" "literature" plain "%?"
         :if-new
         (file+head "literature/${slug}.org" "#+title: ${title}\n#+filetags: \n")
         :immediate-finish t
         :unnarrowed t)
        ("h" "history" plain "%?"
         :if-new
         (file+head "everything/${slug}.org" "#+title: ${title}\n#+filetags: History \n- tags :: ")
         :immediate-finish t
         :unnarrowed t)

        ("k" "knowledge" plain "%?"
         :if-new
         (file+head "everything/${slug}.org" "#+title: ${title}\n#+filetags: \n- tags :: ")
         :immediate-finish t
         :unnarrowed t)))


(cl-defmethod org-roam-node-type ((node org-roam-node))
  "Return the TYPE of NODE."
  (condition-case nil
      (file-name-nondirectory
       (directory-file-name
        (file-name-directory
         (file-relative-name (org-roam-node-file node) org-roam-directory))))
    (error "")))

(setq org-roam-node-display-template
      (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))





(use-package org-upcoming-modeline
  :after org
  :load-path "~/gits/org-upcoming-modeline"
  :config
  (org-upcoming-modeline-mode))









(use-package org-upcoming-modeline
  :ensure t
  :custom
  (alert-define-style 'notifications)
  (org-wild-notifier-alert-time '(1 10 30)))

(org-wild-notifier-mode 1)











;; (add-to-list 'org-roam-capture-templates
;;              '("p" "project" plain
;;                (function org-roam--capture-get-point) "%?"
;;                :file-name "project/%<%Y-%m-%dT%H%M%S>"
;;                :head "#+title: ${title}\n#+created: %<%Y-%m-%dT%H%M%S>"
;;                :unnarrowed t))
;; (setq org-roam-dailies-directory "journal/")
;; (setq org-roam-dailies-capture-templates
;;       '(("d" "default" entry "%A, %d %B %Y""
;;          :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))
;; (setq org-journal-enable-encryption 't)
;; (setq org-journal-encrypt-journal 't)

;; (use-package org-alert :ensure t)
;; (org-alert-enable)
;; (setq alert-default-style 'notification)
;; (setq org-alert-interval 200
;;         org-alert-notify-cutoff 10
;;         org-alert-notify-after-event-cutoff 10)
;; (setq alert-default-style 'libnotify)
;; (setq mail-user-agent 'mu4e-user-agent)
;; (setq org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \\n:t"
;; 	org-msg-startup "hidestars indent inlineimages"
;; 	org-msg-greeting-fmt "\nHi%s,\n\n"
;; 	;; org-msg-recipient-names '(("jeremy.compostella@gmail.com" . "Jérémy"))
;; 	org-msg-greeting-name-limit 3
;; 	org-msg-default-alternatives '((new		. (text html))
;; 				       (reply-to-html	. (text html))
;; 				       (reply-to-text	. (text)))
;; 	org-msg-convert-citation t
;; 	org-msg-signature "

;;  Regards,
;;  /Salh Jabr/,
;; ")
;; ;; The command used to get your emails (adapt this line, see section 2.3):
;; (setq mu4e-get-mail-command "mbsync --config ~/.emacs.d/.mbsyncrc nameaccount")
;; ;; Further customization:
;; ;; SMTP settings:
;; (setq send-mail-function 'smtpmail-send-it)    ; should not be modified
;; (setq smtpmail-smtp-server "mail.mailo.com") ; host running SMTP server
;; (setq smtpmail-smtp-service 465)               ; SMTP service port number
;; (setq smtpmail-stream-type 'ssl)          ; type of SMTP connections to use


;; (setq mu4e-drafts-folder "/Drafts")
;; (setq mu4e-sent-folder   "/Sent")
;; (setq mu4e-trash-folder  "/Trash")

;;; org-eww.el ends here

;; (global-set-key [M-q] 'org-agenda-open-link)
;;(add-hook 'sql-mode-hook
          ;;(lambda () (local-set-key (kbd "<f3>") #'ejc-connect-interactive)))
;;(add-hook 'sql-mode-hook
          ;;(lambda () (local-set-key (kbd "<f2>") #'ejc-connect)))
;; (add-hook 'c++-mode-hook
;;           (lambda () (local-set-key (kbd "<f2>") #'quickrun-shell)))
;; ;; (add-hook 'org-mode-hook
;;           ;; (lambda () (local-set-key (kbd "<c-q>") #'org-agenda-open-link)))
;; (add-hook 'c-mode-hook
;;           (lambda () (local-set-key (kbd "<f2>") #'quickrun-shell)))

;; (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
;; (require 'eaf)
;; (require 'eaf-browser)
;; (require 'eaf-pdf-viewer)
;; (add-hook 'org-journal-mode-hook
;;           (lambda ()
;;             (add-hook 'auto-save-hook 'org-save-all-org-buffers nil nil)
;;             (real-auto-save-mode nil)
;;             (auto-save-mode nil)))

;(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
;(require 'eaf)
;; (add-hook 'org-agenda-mode-hook
;;           (lambda ()
;;             (add-hook 'auto-save-hook 'org-save-all-org-buffers nil t)
;;             (auto-save-mode)))


;(setq
;send-mail-function 'smtpmail-send-it
;message-send-mail-function 'smtpmail-send-it
;user-mail-address "salehmu@mailru"
;smtpmail-starttls-credentials '(("smtp.mail.ru" "465" nil nil))
;smtpmail-auth-credentials (expand-file-name "~/.authinfo")
;smtpmail-default-smtp-server "smtp.mail.ru"
;smtpmail-smtp-server "smtp.mail.ru"
;smtpmail-smtp-service 465
;smtpmail-debug-info t
;starttls-extra-arguments nil
;starttls-gnutls-program "/usr/bin/gnutls-cli"
;starttls-extra-arguments nil
;starttls-use-gnutls t
;)



;(with-eval-after-load 'ox
 ;;(require 'ox-hugo))
 ;;
 ;;
 ;;
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)

;; (use-package delve
;;   :after (org-roam)
;;   ;; this is necessary if use-package-always-defer is true
;;   :demand t
;;   :bind
;;   ;; the main entry point, offering a list of all stored collections
;;   ;; and of all open Delve buffers:
;;   (("<f12>" . delve))
;;   :config
;;   ;; set meaningful tag names for the dashboard query
;;   (setq delve-dashboard-tags '("Tag1" "Tag2"))
;;   ;; optionally turn on compact view as default
;;   (add-hook #'delve-mode-hook #'delve-compact-view-mode)
;;  ;; turn on delve-minor-mode when Org Roam file is opened:
;;   (delve-global-minor-mode))
;; (use-package! vulpea
;;   :hook ((org-roam-db-autosync-mode . vulpea-db-autosync-enable)))



;;;; org



;; (setq org-hide-emphasis-markers t)
;;   (font-lock-add-keywords 'org-mode
;;                           '(("^ *\\([-]\\) "
;;                              (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;;   (use-package org-bullets
;;     :config
;;     (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;   (let* ((variable-tuple
;;           (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
;;                 ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                 ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                 ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                 ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                 (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;          (base-font-color     (face-foreground 'default nil 'default))
;;          (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

;;     (custom-theme-set-faces
;;      'user
;;      `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;      `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;      `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;      `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;      `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
;;      `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
;;      `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
;;      `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
;;      `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))


;;   (custom-theme-set-faces
;;    'user
;;    '(variable-pitch ((t (:family "ETBembo" :height 180 :weight thin))))
;;    '(fixed-pitch ((t ( :family "Fira Code Retina" :height 160)))))

;;   (add-hook 'org-mode-hook 'variable-pitch-mode)

;;   (custom-theme-set-faces
;;    'user
;;    '(org-block ((t (:inherit fixed-pitch))))
;;    '(org-code ((t (:inherit (shadow fixed-pitch)))))
;;    '(org-document-info ((t (:foreground "dark orange"))))
;;    '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
;;    '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
;;    '(org-link ((t (:foreground "royal blue" :underline t))))
;;    '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;    '(org-property-value ((t (:inherit fixed-pitch))) t)
;;    '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;    '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
;;    '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
;;    '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
;; (setq org-wild-notifier-alert-time '10)
;;



;; (dap-mode 1)
;; (dap-tooltip-mode 1)
;; (tooltip-mode 1)
;; (dap-ui-controls-mode 1)
;; (require 'dap-netcore)
;; (require 'dap-cpptools)
;; (require 'dap-lldb)

;; (setq dap-netcore-download-url "https://github.com/Samsung/netcoredbg/releases/download/2.0.0-895/netcoredbg-linux-amd64.tar.gz")




;;  (defun the-cpp-mode-setup ()
;;  (setq dap-lldb-debug-program '("/usr/bin/lldb-vscode"))

;;  (dap-register-debug-template
;;     "C++ LLDB dap"
;;     (list :type "lldb-vscode"
;;           ;; :cwd nil
;;           ;; :args nil
;;           :request "launch"
;;           :cwd "${workspaceFolder}"
;;           :program "${fileBasenameNoExtension}"))


;; (dap-register-debug-template
;;   "NetCoreDbg::Launch"
;;   (list :type "coreclr"
;;         :request "launch"
;;         :cwd "${workspaceFolder}"
;;         :mode "launch"
;;         :program "dlol/Debug/net6.0/${fileBasenameNoExtension}.dll"
;;         :name "NetCoreDbg::Shibi"))

;; (dap-register-debug-template
;;   "cpptools::Run Configuration"
;;   (list :type "cppdbg"
;;         :request "launch"
;;         :name "cpptools::Run Configuration"
;;         :MIMode "gdb"
;;         :program "${fileBasenameNoExtension}"
;;         :cwd "${workspaceFolder}"))


;;  (defun dap-debug-create-or-edit-json-template ()
;;      "Edit the C++ debugging configuration or create + edit if none exists yet."
;;      (interactive)
;;      (let ((filename (concat (lsp-workspace-root) "/launch.json"))
;;  	  (default "~/.doom/default-launch.json"))
;;        (unless (file-exists-p filename)
;;  	(copy-file default filename))
;;        (find-file-existing filename)))
;;    )

;; (add-hook 'c++-mode-hook 'the-cpp-mode-setup t)
;; (add-hook 'c-mode-hook 'the-cpp-mode-setup t)
;; (setq dap-auto-configure-features '(sessions locals controls tooltip)) ;


;; (add-hook 'dired-mode-hook
;;           (lambda ()
;;             (org-roam-mode 0)
;;             ))

;; (use-package deft
;; :after org
;; ;; :config
;; ;;   (setq deft-extensions '("org")
;; ;;         deft-directory org-roam-directory
;; ;;         deft-recursive t
;; ;;         deft-strip-summary-regexp ":PROPERTIES:\n\\(.+\n\\)+:END:\n"
;; ;;         deft-use-filename-as-title t)
;; :custom
;; (deft-recursive t)
;; (deft-use-filter-string-for-filename t)
;; (deft-default-extension "org")
;; (deft-directory "~/roam/"))


;; tabs

;; (global-set-key (kbd "M-[")  'centaur-tabs-backward)
;; (global-set-key (kbd "M-]") 'centaur-tabs-forward)
;; (global-set-key (kbd "M-t") 'centaur-tabs--create-new-tab)
;; (add-hook 'dired-mode-hook 'centaur-tabs-local-mode)
;; (add-hook 'dired-sidebar-mode 'centaur-tabs-local-mode)
;; (add-hook 'org-agenda-mode-hook 'centaur-tabs-local-mode)
;; (centaur-tabs-mode t)
;; ;; (setq centaur-tabs-set-icons t)
;; (setq centaur-tabs-set-modified-marker t)

;;     (defun centaur-tabs-buffer-groups ()
;;       "`centaur-tabs-buffer-groups' control buffers' group rules.

;;     Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
;;     All buffer name start with * will group to \"Emacs\".
;;     Other buffer group by `centaur-tabs-get-group-name' with project name."
;;       (list
;; 	(cond
;; 	 ((or (string-equal "*" (substring (buffer-name) 0 1))
;; 	      (memq major-mode '(magit-process-mode
;; 				 magit-status-mode
;; 				 magit-diff-mode
;; 				 magit-log-mode
;; 				 magit-file-mode
;; 				 magit-blob-mode
;; 				 magit-blame-mode
;; 				 )))
;; 	  "Emacs")
;; 	 ((derived-mode-p 'prog-mode)
;; 	  "Editing")
;; 	 ((derived-mode-p 'dired-mode)
;; 	  "Dired")
;; 	 ((memq major-mode '(helpful-mode
;; 			     help-mode))
;; 	  "Help")
;; 	 ((memq major-mode '(org-mode
;; 			     org-agenda-clockreport-mode
;; 			     org-src-mode
;; 			     org-agenda-mode
;; 			     org-beamer-mode
;; 			     org-indent-mode
;; 			     org-bullets-mode
;; 			     org-cdlatex-mode
;; 			     org-agenda-log-mode
;; 			     diary-mode))
;; 	  "OrgMode")
;; 	 (t
;; 	  (centaur-tabs-get-group-name (current-buffer))))))

;; ;; (setq centaur-tabs-gray-out-icons 'buffer)


;; (defun centaur-tabs-hide-tab (x)
;;   "Do no to show buffer X in tabs."
;;   (let ((name (format "%s" x)))
;;     (or
;;      ;; Current window is not dedicated window.
;;      (window-dedicated-p (selected-window))

;;      ;; Buffer name not match below blacklist.
;;      ;; (string-prefix-p "*epc" name)
;;      ;; (string-prefix-p "*helm" name)
;;      ;; (string-prefix-p "*Helm" name)
;;      ;; (string-prefix-p "*Compile-Log*" name)
;;      ;; (string-prefix-p "*lsp" name)
;;      ;; (string-prefix-p "*company" name)
;;      ;; (string-prefix-p "*Flycheck" name)
;;      ;; (string-prefix-p "*tramp" name)
;;      ;; (string-prefix-p " *Mini" name)
;;      ;; (string-prefix-p "*help" name)
;;      ;; (string-prefix-p "*straight" name)
;;      ;; (string-prefix-p " *temp" name)
;;      ;; (string-prefix-p "*Help" name)
;;      ;; (string-prefix-p "*mybuf" name)
;;      ;; (string-prefix-p "*leetcode*" name)
;;      (string-prefix-p "*doom*" name)
;;      (string-prefix-p "*scratch*" name)
;;      (string-prefix-p "*Messages*" name)
;;      (string-prefix-p "*LSP Symbols List*" name)
;;      (string-prefix-p "*omnisharp*" name)

;;      ;; Is not magit buffer.
;;      (and (string-prefix-p "magit" name)
;; 	  (not (file-name-extension name)))
;;      )))

;; Indent
;;
;;

;; (add-hook 'prog-mode-hook 'highlight-indentation-mode)

;; (require 'highlight-indentation)
;; (set-face-background 'highlight-indentation-face "#e3e3d3")

;; (set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

;; (add-hook 'org-agenda-mode-hook
;;           (lambda ()
;;             (add-hook 'auto-save-hook 'org-save-all-org-buffers nil t)
;;             (auto-save-mode)))
;; (add-hook 'pdf-tools-enabled-hook 'pdf-view-themed-minor-mode)
