(load "mushroom.scm") ; Load procedures for loading mushroom data
(load "dtree.scm")    ; Load decision-tree routines

; Load the attributes list for mushrooms
(define mushroom-attributes
  (load-mushroom-attributes "mushroom-attribs.txt"))
; Load all the mushroom examples (labels with attribute association lists)
(define mushroom-examples
  (load-mushroom-examples "mushrooms.txt" mushroom-attributes))

(define extract-attribute-names
  (lambda (attributes)
    (map car attributes)))

(define extract-attribute-value
  (lambda (attributes key)
    (cdr (assoc key attributes))))

(define poisonous-count
  (lambda (examples)
    (cdr (assoc #\p (label-counts examples)))))

(define edible-count
  (lambda (examples)
    (cdr (assoc #\e (label-counts examples)))))
(define attribute-count
  (lambda (examples key)
    (cdr (assoc key (label-counts examples)))))

(define examples-stalk-e
  (filter-examples-by-attribute-value mushroom-examples "stalk-shape" #\e))
(define examples-stalk-t
  (filter-examples-by-attribute-value mushroom-examples "stalk-shape" #\t))

(define examples-gill-b
  (filter-examples-by-attribute-value mushroom-examples "gill-size" #\b))
(define examples-gill-n
  (filter-examples-by-attribute-value mushroom-examples "gill-size" #\n))
(define decision-stump
  (cons "gill-size"
        (list (cons #\b (plurality-value examples-gill-b))
              (cons #\n (plurality-value examples-gill-n)))))