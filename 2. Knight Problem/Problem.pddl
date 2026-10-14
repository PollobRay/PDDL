(define (problem Four-Knight3x3problem) 
    (:domain Four-Knight)
    (:objects 
        pos1 pos2 pos3                        ; positions on the chess board, 1 to 3
        knight1 knight2 knight3 knight4       ; 4 knights
    )

    (:init
        (at knight1 pos1 pos3)                ; knight1 is at col 1 row 3 on upper left position
        (at knight2 pos3 pos3)                ; knight2 is at col 3 row 3 on upper right position
        (at knight3 pos1 pos1)                ; knight3 is at col 1 row 1 on lower left position
        (at knight4 pos3 pos1)                ; knight4 is at col 3 row 1 on lower right position

        (empty pos1 pos2)                     ; position (col 1, row 2) is empty
        (empty pos2 pos1)                     ; position (col 2, row 1) is empty
        (empty pos2 pos2)                     ; position (col 2, row 2) is empty
        (empty pos2 pos3)                     ; position (col 2, row 3) is empty
        (empty pos3 pos2)                     ; position (col 3, row 2) is empty
        
        (diff_by_one pos1 pos2)
        (diff_by_one pos2 pos1)
        (diff_by_one pos2 pos3)
        (diff_by_one pos3 pos2)

        (diff_by_two pos1 pos3)
        (diff_by_two pos3 pos1)
        )

    (:goal (and
        (at knight1 pos3 pos1)                ; knight1 should end at col 3 row 1 
        (at knight2 pos1 pos1)                ; knight2 should end at col 1 row 1 
        (at knight3 pos3 pos3)                ; knight3 should end at col 3 row 3 
        (at knight4 pos1 pos3)                ; knight4 should end at col 1 row 3 
    ))
)
