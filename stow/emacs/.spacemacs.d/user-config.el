;; [[file:~/.spacemacs.d/spacemacs.org::*spacemacs.org][spacemacs.org:2]]
(server-start)

(setq create-lockfiles nil)

(setq org-journal-dir "~/org/journal/")
(setq org-refile-targets '((org-agenda-files :maxlevel . 1)))
(setq org-outline-path-complete-in-steps nil) ; Refile in a single go
(setq org-refile-use-outline-path 'file)      ; Show full paths for refiling
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-log-into-drawer t)

(with-eval-after-load 'org (setq org-startup-indented nil))

(mac-auto-operator-composition-mode)

(with-eval-after-load 'org
  (setq org-confirm-babel-evaluate nil)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell      . t)
     (js         . t)
     (http       . t)
     (emacs-lisp . t)
     (clojure    . t)
     (python     . t)
     (dot        . t)
     (ditaa      . t)
     (ruby       . t)
     (plantuml   . t)
     )))

;; JS indentation
(setq-default
 ;; js2-mode
 js2-basic-offset 2
 ;; web-mode
 css-indent-offset 2
 web-mode-markup-indent-offset 2
 web-mode-css-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-attr-indent-offset 2)

(setq standardfmt-command "standard")


;; Magit
(global-git-commit-mode t)

;; Code folding
(add-hook 'ruby-mode-hook
          (lambda () (hs-minor-mode)))

(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
                `(ruby-mode
                  ,(rx (or "def" "class" "module" "do" "{" "[")) ; Block start
                  ,(rx (or "}" "]" "end"))                       ; Block end
                  ,(rx (or "#" "=begin"))                        ; Comment start
                  ruby-forward-sexp nil)))
;; spacemacs.org:2 ends here

;; [[file:~/.spacemacs.d/spacemacs.org::*Find%20this%20file][Find this file:1]]
(defun spacemacs/find-config-file ()
  (interactive)
  (find-file (concat dotspacemacs-directory "/spacemacs.org")))

(spacemacs/set-leader-keys "fec" 'spacemacs/find-config-file)
;; Find this file:1 ends here
