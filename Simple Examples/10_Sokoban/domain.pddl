;; =============================================================
;; Problem 10 : Sokoban
;; Level      : Medium
;; A warehouse robot pushes boxes onto goal squares.
;; It can only PUSH (never pull) and only one box at a time.
;; =============================================================
(define (domain sokoban)
  (:requirements :strips :typing)

  (:types cell direction)

  (:predicates
    (robot-at ?c - cell)                     ; robot stands on ?c
    (box-at ?c - cell)                       ; a box is on ?c
    (clear ?c - cell)                        ; ?c holds no robot and no box
    (adj ?c1 - cell ?c2 - cell ?d - direction) ; ?c2 is next to ?c1 in direction ?d
  )

  ;; Walk one step into a free cell
  (:action move
    :parameters (?from - cell ?to - cell ?d - direction)
    :precondition (and (robot-at ?from)
                       (clear ?to)
                       (adj ?from ?to ?d))
    :effect (and (robot-at ?to) (clear ?from)
                 (not (robot-at ?from)) (not (clear ?to)))
  )

  ;; Push the box in front of the robot one step further
  ;;   robot(?r) -> box(?b) -> free(?t)   all in direction ?d
  (:action push
    :parameters (?r - cell ?b - cell ?t - cell ?d - direction)
    :precondition (and (robot-at ?r)
                       (box-at ?b)
                       (clear ?t)
                       (adj ?r ?b ?d)
                       (adj ?b ?t ?d))
    :effect (and (robot-at ?b) (box-at ?t) (clear ?r)
                 (not (robot-at ?r)) (not (box-at ?b)) (not (clear ?t)))
  )
)
