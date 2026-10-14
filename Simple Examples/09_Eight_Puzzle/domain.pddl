;; =============================================================
;; Problem 9 : 8-Puzzle (sliding tiles)
;; Level     : Medium
;; Eight numbered tiles on a 3x3 board with one empty square.
;; A tile can slide into the empty square next to it.
;; =============================================================
(define (domain eight-puzzle)
  (:requirements :strips :typing)

  (:types tile position)

  (:predicates
    (at ?t - tile ?p - position)               ; tile ?t is on square ?p
    (empty ?p - position)                      ; square ?p is the blank
    (adjacent ?p1 - position ?p2 - position)   ; squares share an edge
  )

  ;; Slide tile ?t from ?from into the empty neighbouring square ?to
  (:action slide
    :parameters (?t - tile ?from - position ?to - position)
    :precondition (and (at ?t ?from)
                       (empty ?to)
                       (adjacent ?from ?to))
    :effect (and (at ?t ?to)
                 (empty ?from)
                 (not (at ?t ?from))
                 (not (empty ?to)))
  )
)
