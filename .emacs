;;http://www.emacswiki.org/emacs/DeletingWhitespace#toc3
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq
 python-shell-interpreter "ipython3"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; Outline-minor-mode key map
 (define-prefix-command 'cm-map nil "Outline-")
;; HIDE
 (define-key cm-map "q" 'hide-sublevels)    ; Hide everything but the top-level headings
 (define-key cm-map "t" 'hide-body)         ; Hide everything but headings (all body lines)
 (define-key cm-map "o" 'hide-other)        ; Hide other branches
 (define-key cm-map "c" 'hide-entry)        ; Hide this entry's body
 (define-key cm-map "l" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
 (define-key cm-map "d" 'hide-subtree)      ; Hide everything in this entry and sub-entries
;; SHOW
 (define-key cm-map "a" 'show-all)          ; Show (expand) everything
 (define-key cm-map "e" 'show-entry)        ; Show this heading's body
 (define-key cm-map "i" 'show-children)     ; Show this heading's immediate child sub-headings
 (define-key cm-map "k" 'show-branches)     ; Show all sub-headings under this heading
 (define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below
;; MOVE
 (define-key cm-map "u" 'outline-up-heading)                ; Up
 (define-key cm-map "n" 'outline-next-visible-heading)      ; Next
 (define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
 (define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
 (define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
 (global-set-key "\M-o" cm-map)

;; AucTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)
(setq-default TeX-master nil) ; Query for master file.

;; Use Skim as viewer, enable source <-> PDF sync
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
;; BELOW DOESNT WORK for sync -- need to \usepackage{pdfsync}
 (add-hook 'LaTeX-mode-hook (lambda ()
   (push
     '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
       :help "Run latexmk on file")
     TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))


;;(x-focus-frame nil)

 (defun darkbg ()
  "Switches to a dark room"
  (interactive)
  (when (featurep 'aquamacs)
    (color-theme-initialize)
    (color-theme-clarity)))

 (defun writeroom ()
  "Switches to a WriteRoom-like fullscreen style"
  (interactive)
  (when (featurep 'aquamacs)
    ;; switch to white on black
    ;;darkbg()
    ;; switch to Garamond 36pt
    (aquamacs-autoface-mode 0)
    (set-frame-font "-apple-garamond-medium-r-normal--36-360-72-72-m-360-iso10646-1")
    ;; switch to fullscreen mode
    (aquamacs-toggle-full-frame)))

 (defun iconify-or-deiconify-frame-fullscreen-even ()
   (interactive)
   (if (eq (cdr (assq 'visibility (frame-parameters))) t)
     (progn
       (if (frame-parameter nil 'fullscreen)
	   (aquamacs-toggle-full-frame))
 ;       (switch-to-buffer "*scratch*")
       (iconify-frame))
     (make-frame-visible)))
 (define-key global-map "\C-z" #'iconify-or-deiconify-frame-fullscreen-even)
(put 'downcase-region 'disabled nil)


;; markdown mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(setq markdown-enable-itex t)

(defun farm-server-setup ()
  (setq server-use-tcp t
	server-port 9999))
(farm-server-setup) ;; delete this line if using whiny aquamacs ...
(server-start)

(defun server-start-and-copy ()
  (interactive)
  (farm-server-setup)
  (server-start)
 (copy-file "~/.emacs.d/server/server" "/farm:~/.emacs.d/server/server" t))

;; add ess
(add-to-list 'load-path "~/.emacs.d/ess/lisp/")
(load "ess-site")

;;
(defun latex-word-count ()
  (interactive)
  (shell-command (concat "$HOME/lib/TeXcount/texcount.pl "
                         ; "uncomment then options go here "
                         (buffer-file-name))))
(define-key ess-mode-map "\C-cw" 'latex-word-count)


(defun wc (posBegin posEnd)
  "Print number of words and chars in region."
  (interactive "r")
  (message "Counting …")
  (save-excursion
    (let (wordCount)
      (setq wordCount 0)
      (goto-char posBegin)
      (while (and (< (point) posEnd)
                  (re-search-forward "\\sw+" posEnd t))
        (setq wordCount (1+ wordCount)))

      (message "Words: %d" wordCount)
      )))


(define-key global-map "\M-n K" 'ess-swv-knit)

(add-to-list 'load-path "~/.emacs.d/stan-mode/")
(require 'stan-mode)
;; Uncomment to activate yasnippet support (requires yasnippet)
;; (require 'stan-snippets)
;; Uncomment to activate flymake support (requires flymake)
;; (require 'stan-flymake)

;; Adapted with one minor change from Felipe Salazar at
;; http://www.emacswiki.org/emacs/EmacsSpeaksStatistics

(setq ess-ask-for-ess-directory nil)
(setq ess-local-process-name "R")
(setq ansi-color-for-comint-mode 'filter)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)
(defun my-ess-start-R ()
  (interactive)
  (if (not (member "*R*" (mapcar (function buffer-name) (buffer-list))))
      (progn
        (delete-other-windows)
        (setq w1 (selected-window))
        (setq w1name (buffer-name))
        (setq w2 (split-window w1 nil t))
        (R)
        (set-window-buffer w2 "*R*")
        (set-window-buffer w1 w1name))))
(defun my-ess-eval ()
  (interactive)
  (my-ess-start-R)
  (if (and transient-mark-mode mark-active)
      (call-interactively 'ess-eval-region)
    (call-interactively 'ess-eval-line-and-step)))
(add-hook 'ess-mode-hook
          '(lambda()
             (local-set-key [(shift return)] 'my-ess-eval)))
(add-hook 'inferior-ess-mode-hook
          '(lambda()
             (local-set-key [C-up] 'comint-previous-input)
             (local-set-key [C-down] 'comint-next-input)))
(add-hook 'Rnw-mode-hook
          '(lambda()
             (local-set-key [(shift return)] 'my-ess-eval)))

(ess-toggle-underscore nil)


;; Start a 'musings' note
;; emacs code after Tim Bray's ongoing
;; (defun muse (o) "Write a muse" (interactive "Mmuse name: ")
;;   (find-file (concat
;; 	            (format-time-string "~/musing/Date/20xx/%Y/%m/%d/") o ".mus"))
;;   (if (= (buffer-size) 0) (insert-file-contents "~/musing/.empty.xml"))
;;   (xml-mode)
;;   (search-forward "<cat>"))
;; (global-set-key (kbd "M-o") 'muse) ;; Meta + o

;; tabs -> spaces
(defun java-mode-untabify ()
   (save-excursion
     (goto-char (point-min))
     (if (search-forward "t" nil t)
         (untabify (1- (point)) (point-max))))
   nil)

 (add-hook 'java-mode-hook
           '(lambda ()
              (make-local-variable 'write-contents-hooks)
              (add-hook 'write-contents-hooks 'java-mode-untabify)))

 (add-hook 'html-mode-hook
           '(lambda ()
              (make-local-variable 'write-contents-hooks)
              (add-hook 'write-contents-hooks 'java-mode-untabify)))

 (add-hook 'cpp-mode-hook
           '(lambda ()
              (make-local-variable 'write-contents-hooks)
              (add-hook 'write-contents-hooks 'java-mode-untabify)))

 (add-hook 'stan-mode-hook
           '(lambda ()
              (make-local-variable 'write-contents-hooks)
              (add-hook 'write-contents-hooks 'java-mode-untabify)))


(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


(add-to-list 'load-path "~/.emacs.d/evil" )
(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map ";" "$")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((ess-noweb-default-code-mode . R-mode)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (set-frame-parameter frame
                                 'background-mode
                                 (if (display-graphic-p frame) 'light 'dark))
            (enable-theme 'solarized)))

(load-theme 'solarized-light)

(setq load-path
	(append '("polymode-20150105.931/")
	load-path))'
;;; ckwoly
(require 'poly-R)
(require 'poly-markdown)

;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
;;(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
;;(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

(defun ess-rmarkdown ()
   "Compile R markdown (.Rmd). Should work for any output type."
   (interactive)
   ; Check if attached R-session
   (condition-case nil
       (ess-get-process)
   (error
    (ess-switch-process)))
   (let* ((rmd-buf (current-buffer)))
     (save-excursion
       (let* ((sprocess (ess-get-process ess-current-process-name))
              (sbuffer (process-buffer sprocess))
              (buf-coding (symbol-name buffer-file-coding-system))
              (R-cmd
          (format "library(rmarkdown); rmarkdown::render(\"%s\")"
          buffer-file-name)))
    (message "Running rmarkdown on %s" buffer-file-name)
         (ess-execute R-cmd 'buffer nil nil)
         (switch-to-buffer rmd-buf)
         (ess-show-buffer (buffer-name sbuffer) nil)))))

(define-key polymode-mode-map "\M-np" 'ess-rmarkdown)

;; R-internals manual
;;; ESS
(add-hook 'ess-mode-hook
      (lambda ()
        (ess-set-style 'DEFAULT 'quiet)
        ;; Because
        ;;                                 DEF GNU BSD K&R C++
        ;; ess-indent-level                  2   2   8   5   4
        ;; ess-continued-statement-offset    2   2   8   5   4
        ;; ess-brace-offset                  0   0  -8  -5  -4
        ;; ess-arg-function-offset           2   4   0   0   0
        ;; ess-expression-offset             4   2   8   5   4
        ;; ess-else-offset                   0   0   0   0   0
        ;; ess-close-brace-offset            0   0   0   0   0
        (add-hook 'local-write-file-hooks
              (lambda ()
            (ess-nuke-trailing-whitespace)))))
(setq ess-nuke-trailing-whitespace-p 'ask)
;; or even
;;(setq ess-nuke-trailing-whitespace-p t)
