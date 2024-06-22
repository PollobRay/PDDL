(define (problem puzzle_8_problem)
    (:domain puzzle_8_domain)

    (:objects
        tile_1 tile_2 tile_3
        tile_4 tile_5 tile_6
        tile_7 tile_8 tile_9

        val_1 val_2 val_3 val_4 val_5 val_6 val_7 val_8 
    )

    (:init
        (at tile_1 val_1)
        (at tile_2 val_2)
        (at tile_3 val_3)

        (at tile_4 val_4)
        (at tile_5 val_5)
        (at tile_6 val_6)
        
        (blank tile_7)
        (at tile_8 val_7)
        (at tile_9 val_8)

        (up tile_4 tile_1)
        (up tile_5 tile_2)
        (up tile_6 tile_3)
        (up tile_7 tile_4)
        (up tile_8 tile_5)
        (up tile_9 tile_6)

        (down tile_1 tile_4)
        (down tile_2 tile_5)
        (down tile_3 tile_6)
        (down tile_4 tile_7)
        (down tile_5 tile_8)
        (down tile_6 tile_9)

        (left tile_2 tile_1)
        (left tile_3 tile_2)
        (left tile_5 tile_4)
        (left tile_6 tile_5)
        (left tile_8 tile_7)
        (left tile_9 tile_8)

        (right tile_1 tile_2)
        (right tile_2 tile_3)
        (right tile_4 tile_5)
        (right tile_5 tile_6)
        (right tile_7 tile_8)
        (right tile_8 tile_9)
    )

    (:goal (and
        (at tile_1 val_1)
        (at tile_2 val_2)
        (at tile_3 val_3)

        (at tile_4 val_4)
        (at tile_5 val_5)
        (at tile_6 val_6)

        (at tile_7 val_7)
        (at tile_8 val_8)
        (blank tile_9)
    ))
    
)
