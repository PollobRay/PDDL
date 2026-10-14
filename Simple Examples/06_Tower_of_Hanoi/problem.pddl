;; Three discs (d1 smallest, d3 largest) on peg1.
;; Goal: same stack on peg3.
(define (problem hanoi-3)
  (:domain hanoi)

  (:objects
    peg1 peg2 peg3 - peg
    d1 d2 d3       - disc
  )

  (:init
    ;; the stack on peg1:  d1 on d2 on d3 on peg1
    (on d3 peg1) (on d2 d3) (on d1 d2)
    (clear d1) (clear peg2) (clear peg3)

    ;; size relation: every disc fits on any peg ...
    (smaller d1 peg1) (smaller d1 peg2) (smaller d1 peg3)
    (smaller d2 peg1) (smaller d2 peg2) (smaller d2 peg3)
    (smaller d3 peg1) (smaller d3 peg2) (smaller d3 peg3)
    ;; ... and on any larger disc
    (smaller d1 d2) (smaller d1 d3)
    (smaller d2 d3)
  )

  (:goal (and (on d3 peg3) (on d2 d3) (on d1 d2)))
)
