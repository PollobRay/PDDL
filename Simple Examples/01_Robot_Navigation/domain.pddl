;; =============================================================
;; Problem 1 : Robot Navigation
;; Level     : Very basic
;; A robot moves between rooms that are connected by doors.
;; =============================================================
(define (domain robot-navigation)
  (:requirements :strips :typing)

  (:types room)

  (:predicates
    (robot-at ?r - room)                 ; the robot is in room ?r
    (connected ?from - room ?to - room)  ; a door leads from ?from to ?to
  )

  ;; Move the robot from one room to a connected room
  (:action move
    :parameters (?from - room ?to - room)
    :precondition (and (robot-at ?from)
                       (connected ?from ?to))
    :effect (and (robot-at ?to)
                 (not (robot-at ?from)))
  )
)
