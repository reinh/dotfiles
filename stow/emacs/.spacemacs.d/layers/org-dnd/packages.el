;;; packages.el --- org-dnd layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Rein Henrichs <reinh@Reins-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `org-dnd-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `org-dnd/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `org-dnd/pre-init-PACKAGE' and/or
;;   `org-dnd/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst org-dnd-packages
  '(
    (ox-dnd :location (recipe :fetcher github :repo "xeals/emacs-org-dnd"))
    (decide-mode :location local)
    ))

(defun org-dnd/pre-init-ox-dnd ()
  (spacemacs|use-package-add-hook org :post-config (require 'ox-dnd)))
(defun org-dnd/init-ox-dnd ())

(defun org-dnd/init-decide-mode ()
    (use-package decide-mode
      :defer t
      :commands decide-mode
      )
    )


;;; packages.el ends here
