(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark))))
(setq path-to-ctags "/usr/local/bin/exctags") ;;
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name \"*.[ch]\" | etags -" dir-name)))
(setq default-tab-width 8)
(setq-default c-basic-offset 8)
(setq-default indent-tabs-mode t)
(setq lua-indent-level 8)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(defun irc ()
  "Connect to irc"
  (interactive)
  (erc-tls :server "znc.ru" :port 25
	   :nick "Peter" :password "passw")
  (erc-tls :server "znc.ru" :port 25
	   :nick "Peter" :password "passw")
  )

(setq user-mail-address "p_kosyh@factor-ts.ru")
(setq user-full-name "Peter Kosyh")
(setq gnus-select-method
            '(nnmaildir "mail" (directory "~/Mail"))
	    mail-sources '((maildir :path "~/Mail/" :subdirs ("cur" "new")))
	    mail-source-delete-incoming nil
)
 ;; arbitrary name after "nnmaildir+"
(setq gnus-message-archive-group "nnmaildir+mail:outbox")
(setq message-sendmail-envelope-from 'header)
(setq  mail-envelope-from 'header)
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "/usr/local/bin/msmtp")
(setq message-sendmail-envelope-from 'header)
(setq gnus-thread-sort-functions '(gnus-thread-sort-by-most-recent-date))
(require 'erc-image)
(add-to-list 'erc-modules 'image)
(erc-update-modules)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))
(defadvice dired-readin
  (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))
(require 'dired+)
(setq scroll-step 1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(require 'emms-setup)
(emms-standard)
(emms-default-players)
(setf tls-checktrust t)
(setq gnus-use-full-window nil)
(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'meta))
(add-to-list 'write-file-functions 'delete-trailing-whitespace)
(setq speedbar-show-unknown-files t)
(setq dired-dwim-target t)
(scroll-bar-mode -1)

(custom-set-faces
 '(default ((t (:family "Terminus" :height 140))))
 '(variable-pitch ((t (:family "Liberation Sans" :height 140)))))

(copy-face 'default 'fixed-pitch)

(defun fixed-pitch-mode ()
  (buffer-face-mode -1))

(defun variable-pitch-mode ()
  (buffer-face-mode t))

(defun toggle-pitch (&optional arg)
  "Switch between the `fixed-pitch' face and the `variable-pitch' face"
  (interactive)
  (buffer-face-toggle 'variable-pitch))

;; enable buffer-face mode to provide buffer-local fonts
(buffer-face-mode)
(add-hook 'eww-mode-hook 'variable-pitch-mode)
