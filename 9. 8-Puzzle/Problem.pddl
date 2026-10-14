(define (problem puzzle_8_problem)
    (:domain puzzle_8_domain)

    (:objects
        pos_1 pos_2 pos_3           ; board positions
        pos_4 pos_5 pos_6
        pos_7 pos_8 pos_9

        tile_1 tile_2 tile_3 tile_4 tile_5 tile_6 tile_7 tile_8
    )

    (:init
        (at tile_1 pos_1)
        (at tile_2 pos_2)
        (at tile_3 pos_3)

        (at tile_4 pos_4)
        (at tile_5 pos_5)
        (at tile_6 pos_6)

        (blank pos_7)
        (at tile_7 pos_8)
        (at tile_8 pos_9)

        ; vertical neighbours
        (adjacent pos_1 pos_4) (adjacent pos_4 pos_1)
        (adjacent pos_2 pos_5) (adjacent pos_5 pos_2)
        (adjacent pos_3 pos_6) (adjacent pos_6 pos_3)
        (adjacent pos_4 pos_7) (adjacent pos_7 pos_4)
        (adjacent pos_5 pos_8) (adjacent pos_8 pos_5)
        (adjacent pos_6 pos_9) (adjacent pos_9 pos_6)

        ; horizontal neighbours
        (adjacent pos_1 pos_2) (adjacent pos_2 pos_1)
        (adjacent pos_2 pos_3) (adjacent pos_3 pos_2)
        (adjacent pos_4 pos_5) (adjacent pos_5 pos_4)
        (adjacent pos_5 pos_6) (adjacent pos_6 pos_5)
        (adjacent pos_7 pos_8) (adjacent pos_8 pos_7)
        (adjacent pos_8 pos_9) (adjacent pos_9 pos_8)
    )

    (:goal (and
        (at tile_1 pos_1)
        (at tile_2 pos_2)
        (at tile_3 pos_3)

        (at tile_4 pos_4)
        (at tile_5 pos_5)
        (at tile_6 pos_6)

        (at tile_7 pos_7)
        (at tile_8 pos_8)
        (blank pos_9)
    ))
)
