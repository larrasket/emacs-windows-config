;;; other.el -*- lexical-binding: t; -*-


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
