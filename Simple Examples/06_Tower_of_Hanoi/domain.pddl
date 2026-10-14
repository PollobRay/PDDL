;; =============================================================
;; Problem 6 : Tower of Hanoi
;; Level     : Intermediate
;; Move a stack of discs from the first peg to the third peg.
;; Only one disc moves at a time, and a larger disc may never
;; be placed on a smaller disc.
;; =============================================================
(define (domain hanoi)
  (:requirements :strips :typing)

  ;; Both pegs and discs are "places" a disc can sit on
  (:types place     - object
          peg disc  - place)

  (:predicates
    (on ?d - disc ?p - place)        ; disc ?d sits directly on ?p
    (clear ?p - place)               ; nothing is on top of ?p
    (smaller ?d - disc ?p - place)   ; disc ?d may be put on ?p
  )

  (:action move
    :parameters (?d - disc ?from - place ?to - place)
    :precondition (and (on ?d ?from)
                       (clear ?d)
                       (clear ?to)
                       (smaller ?d ?to))
    :effect (and (on ?d ?to)
                 (clear ?from)
                 (not (on ?d ?from))
                 (not (clear ?to)))
  )
)
