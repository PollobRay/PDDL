;; =============================================================
;; Problem 2 : Vacuum Cleaner World
;; Level     : Very basic
;; A vacuum robot moves along a row of cells and sucks up dirt.
;; =============================================================
(define (domain vacuum-world)
  (:requirements :strips :typing)

  (:types cell)

  (:predicates
    (vacuum-at ?c - cell)          ; the vacuum is on cell ?c
    (adjacent ?c1 - cell ?c2 - cell) ; ?c1 and ?c2 are neighbours
    (dirty ?c - cell)              ; cell ?c has dirt
    (clean ?c - cell)              ; cell ?c is clean
  )

  ;; Move to a neighbouring cell
  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and (vacuum-at ?from)
                       (adjacent ?from ?to))
    :effect (and (vacuum-at ?to)
                 (not (vacuum-at ?from)))
  )

  ;; Suck the dirt in the current cell
  (:action suck
    :parameters (?c - cell)
    :precondition (and (vacuum-at ?c)
                       (dirty ?c))
    :effect (and (clean ?c)
                 (not (dirty ?c)))
  )
)
