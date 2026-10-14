;; =============================================================
;; Problem 3 : Gripper
;; Level     : Basic
;; A robot with two hands (grippers) carries balls between rooms.
;; =============================================================
(define (domain gripper)
  (:requirements :strips :typing)

  (:types room ball gripper)

  (:predicates
    (robot-at ?r - room)            ; robot is in room ?r
    (at ?b - ball ?r - room)        ; ball ?b is in room ?r
    (free ?g - gripper)             ; gripper ?g is empty
    (carry ?b - ball ?g - gripper)  ; gripper ?g holds ball ?b
  )

  (:action move
    :parameters (?from - room ?to - room)
    :precondition (robot-at ?from)
    :effect (and (robot-at ?to)
                 (not (robot-at ?from)))
  )

  (:action pick
    :parameters (?b - ball ?r - room ?g - gripper)
    :precondition (and (at ?b ?r)
                       (robot-at ?r)
                       (free ?g))
    :effect (and (carry ?b ?g)
                 (not (at ?b ?r))
                 (not (free ?g)))
  )

  (:action drop
    :parameters (?b - ball ?r - room ?g - gripper)
    :precondition (and (carry ?b ?g)
                       (robot-at ?r))
    :effect (and (at ?b ?r)
                 (free ?g)
                 (not (carry ?b ?g)))
  )
)
