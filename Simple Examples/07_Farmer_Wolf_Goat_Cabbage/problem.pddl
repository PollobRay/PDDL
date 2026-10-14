;; Everyone starts on the left bank; everyone must reach the right bank.
(define (problem river-crossing-1)
  (:domain river-crossing)

  (:objects left right - bank)

  (:init
    (opposite left right) (opposite right left)
    (farmer-at left)
    (wolf-at left)
    (goat-at left)
    (cabbage-at left)
  )

  (:goal (and (farmer-at right)
              (wolf-at right)
              (goat-at right)
              (cabbage-at right)))
)
