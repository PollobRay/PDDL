;; =============================================================
;; Problem 5 : Blocks World
;; Level     : Basic / Intermediate
;; A robot arm stacks and unstacks blocks on a table.
;; =============================================================
(define (domain blocks-world)
  (:requirements :strips :typing)

  (:types block)

  (:predicates
    (on ?x - block ?y - block)  ; block ?x is directly on block ?y
    (ontable ?x - block)        ; block ?x is on the table
    (clear ?x - block)          ; nothing is on top of ?x
    (handempty)                 ; the arm holds nothing
    (holding ?x - block)        ; the arm holds block ?x
  )

  ;; Lift a clear block from the table
  (:action pick-up
    :parameters (?x - block)
    :precondition (and (clear ?x) (ontable ?x) (handempty))
    :effect (and (holding ?x)
                 (not (ontable ?x)) (not (clear ?x)) (not (handempty)))
  )

  ;; Put the held block on the table
  (:action put-down
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and (ontable ?x) (clear ?x) (handempty)
                 (not (holding ?x)))
  )

  ;; Put the held block ?x on top of a clear block ?y
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (on ?x ?y) (clear ?x) (handempty)
                 (not (holding ?x)) (not (clear ?y)))
  )

  ;; Lift a clear block ?x from the top of block ?y
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and (holding ?x) (clear ?y)
                 (not (on ?x ?y)) (not (clear ?x)) (not (handempty)))
  )
)
