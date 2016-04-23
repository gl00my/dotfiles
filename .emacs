(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Terminus" :foundry "xos4" :slant normal :weight normal :height 143 :width normal)))))
(setq path-to-ctags "/usr/local/bin/exctags") ;;
(setq c-basic-offset 8)

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
  
(setq lua-indent-level 8)

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
