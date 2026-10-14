;; Level map ( # wall, @ robot, $ box, . goal square ):
;;
;;      col: 1 2 3 4 5
;;         # # # # # # #
;;   row 1 # .       . #
;;   row 2 #   $   $   #
;;   row 3 #     @     #
;;         # # # # # # #
;;
;; Only floor cells are objects; cell names are c<row><col>.
;; Walls are simply cells that do not exist (no adj facts lead there).
(define (problem sokoban-2-boxes)
  (:domain sokoban)

  (:objects
    c11 c12 c13 c14 c15
    c21 c22 c23 c24 c25
    c31 c32 c33 c34 c35 - cell
    up down left right - direction
  )

  (:init
    (robot-at c33)
    (box-at c22) (box-at c24)
    ;; every floor cell without robot or box is clear
    (clear c11) (clear c12) (clear c13) (clear c14) (clear c15) (clear c21)
    (clear c23) (clear c25) (clear c31) (clear c32) (clear c34) (clear c35)
    ;; grid connectivity
    (adj c11 c12 right) (adj c12 c11 left) (adj c11 c21 down) (adj c21 c11 up)
    (adj c12 c13 right) (adj c13 c12 left) (adj c12 c22 down) (adj c22 c12 up)
    (adj c13 c14 right) (adj c14 c13 left) (adj c13 c23 down) (adj c23 c13 up)
    (adj c14 c15 right) (adj c15 c14 left) (adj c14 c24 down) (adj c24 c14 up)
    (adj c15 c25 down) (adj c25 c15 up) (adj c21 c22 right) (adj c22 c21 left)
    (adj c21 c31 down) (adj c31 c21 up) (adj c22 c23 right) (adj c23 c22 left)
    (adj c22 c32 down) (adj c32 c22 up) (adj c23 c24 right) (adj c24 c23 left)
    (adj c23 c33 down) (adj c33 c23 up) (adj c24 c25 right) (adj c25 c24 left)
    (adj c24 c34 down) (adj c34 c24 up) (adj c25 c35 down) (adj c35 c25 up)
    (adj c31 c32 right) (adj c32 c31 left) (adj c32 c33 right) (adj c33 c32 left)
    (adj c33 c34 right) (adj c34 c33 left) (adj c34 c35 right) (adj c35 c34 left)
  )

  (:goal (and (box-at c11) (box-at c15)))
)
