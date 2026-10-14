;; Four balls are in room A. Move all of them to room B.
;; The robot has a left and a right gripper (2 balls per trip).
(define (problem gripper-4-balls)
  (:domain gripper)

  (:objects
    roomA roomB         - room
    ball1 ball2 ball3 ball4 - ball
    left right          - gripper
  )

  (:init
    (robot-at roomA)
    (free left) (free right)
    (at ball1 roomA) (at ball2 roomA)
    (at ball3 roomA) (at ball4 roomA)
  )

  (:goal (and (at ball1 roomB) (at ball2 roomB)
              (at ball3 roomB) (at ball4 roomB)))
)
