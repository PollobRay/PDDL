(define (domain Four-Knight)
    (:requirements :strips)
    (:predicates
        (at ?knight ?col ?row)      ; knight is at position (col, row)
        (diff_by_one ?pos1 ?pos2)   ; difference between two cols/rows is one
        (diff_by_two ?pos1 ?pos2)   ; difference between two cols/rows is two
        (empty ?col ?row)           ; position (col, row) is empty
    )

    (:action move_knight_2col_1row      ; knight moves 2 columns and 1 row
        :parameters (?knight ?from_col ?from_row ?to_col ?to_row)
        :precondition (and
            (at ?knight ?from_col ?from_row)    ; knight must be at (from_col, from_row)
            (empty ?to_col ?to_row)             ; (to_col, to_row) must be empty
            (diff_by_two ?from_col ?to_col)     ; column difference must be 2
            (diff_by_one ?from_row ?to_row)     ; row difference must be 1
        )
        :effect (and
            (not (at ?knight ?from_col ?from_row))  ; knight leaves (from_col, from_row)
            (at ?knight ?to_col ?to_row)            ; knight is now at (to_col, to_row)
            (empty ?from_col ?from_row)             ; old position becomes empty
            (not (empty ?to_col ?to_row))           ; new position is occupied
        )
    )

    (:action move_knight_2row_1col      ; knight moves 1 column and 2 rows
        :parameters (?knight ?from_col ?from_row ?to_col ?to_row)
        :precondition (and
            (at ?knight ?from_col ?from_row)    ; knight must be at (from_col, from_row)
            (empty ?to_col ?to_row)             ; (to_col, to_row) must be empty
            (diff_by_one ?from_col ?to_col)     ; column difference must be 1
            (diff_by_two ?from_row ?to_row)     ; row difference must be 2
        )
        :effect (and
            (not (at ?knight ?from_col ?from_row))  ; knight leaves (from_col, from_row)
            (at ?knight ?to_col ?to_row)            ; knight is now at (to_col, to_row)
            (empty ?from_col ?from_row)             ; old position becomes empty
            (not (empty ?to_col ?to_row))           ; new position is occupied
        )
    )
)
