;; Three cells in a row:  [ A ] - [ B ] - [ C ]
;; Vacuum starts in A. Cells A and C are dirty, B is clean.
(define (problem vacuum-1)
  (:domain vacuum-world)

  (:objects A B C - cell)

  (:init
    (vacuum-at A)
    (adjacent A B) (adjacent B A)
    (adjacent B C) (adjacent C B)
    (dirty A)
    (clean B)
    (dirty C)
  )

  (:goal (and (clean A)
              (clean B)
              (clean C)))
)
