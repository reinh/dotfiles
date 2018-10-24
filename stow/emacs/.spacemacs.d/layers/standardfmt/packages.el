;;; packages.el --- standardfmt layer packages file for Spacemacs.
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
;; added to `standardfmt-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `standardfmt/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `standardfmt/pre-init-PACKAGE' and/or
;;   `standardfmt/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst standardfmt-packages
  '(
    (standardfmt :location (recipe
                            :fetcher github
                            :repo jimeh/standardfmt.el))
    ))

;;; packages.el ends here
