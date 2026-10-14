;; Positions are named p<row><col>:
;;    p11 p12 p13
;;    p21 p22 p23
;;    p31 p32 p33
;;
;;   Initial        Goal
;;   2 8 3          1 2 3
;;   1 6 4          8 _ 4
;;   7 _ 5          7 6 5
(define (problem eight-puzzle-1)
  (:domain eight-puzzle)

  (:objects
    t1 t2 t3 t4 t5 t6 t7 t8          - tile
    p11 p12 p13 p21 p22 p23 p31 p32 p33 - position
  )

  (:init
    ;; board layout
    (at t2 p11) (at t8 p12) (at t3 p13)
    (at t1 p21) (at t6 p22) (at t4 p23)
    (at t7 p31) (empty p32) (at t5 p33)

    ;; horizontal neighbours
    (adjacent p11 p12) (adjacent p12 p11) (adjacent p12 p13) (adjacent p13 p12)
    (adjacent p21 p22) (adjacent p22 p21) (adjacent p22 p23) (adjacent p23 p22)
    (adjacent p31 p32) (adjacent p32 p31) (adjacent p32 p33) (adjacent p33 p32)
    ;; vertical neighbours
    (adjacent p11 p21) (adjacent p21 p11) (adjacent p21 p31) (adjacent p31 p21)
    (adjacent p12 p22) (adjacent p22 p12) (adjacent p22 p32) (adjacent p32 p22)
    (adjacent p13 p23) (adjacent p23 p13) (adjacent p23 p33) (adjacent p33 p23)
  )

  (:goal (and
    (at t1 p11) (at t2 p12) (at t3 p13)
    (at t8 p21)             (at t4 p23)
    (at t7 p31) (at t6 p32) (at t5 p33)))
)
