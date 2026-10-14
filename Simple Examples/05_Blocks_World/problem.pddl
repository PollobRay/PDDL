;; The "Sussman Anomaly"
;; Initial:  C is on A; A and B are on the table.
;; Goal   :  A on B, B on C  (a single tower A-B-C).
(define (problem sussman-anomaly)
  (:domain blocks-world)

  (:objects A B C - block)

  (:init
    (on C A)
    (ontable A)
    (ontable B)
    (clear C)
    (clear B)
    (handempty)
  )

  (:goal (and (on A B)
              (on B C)))
)
