;; Monkey is at the door, box is at the window,
;; bananas hang from the ceiling in the middle of the room.
(define (problem monkey-banana-1)
  (:domain monkey-banana)

  (:objects door window middle - location)

  (:init
    (monkey-at door)
    (on-floor)
    (box-at window)
    (banana-at middle)
  )

  (:goal (has-banana))
)
