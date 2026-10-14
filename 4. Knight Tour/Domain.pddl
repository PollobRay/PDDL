(define (domain Knight_Tour)
    (:requirements :strips :negative-preconditions)

    (:predicates
        (at ?row ?col)              ; knight is at position (row, col)
        (visited ?row ?col)         ; position (row, col) has been visited
        (diff_by_one ?pos1 ?pos2)   ; difference between two rows/cols is one
        (diff_by_two ?pos1 ?pos2)   ; difference between two rows/cols is two
    )

    (:action move_2cols_1row        ; knight moves 2 columns and 1 row
        :parameters (?from_row ?from_col ?to_row ?to_col)
        :precondition (and
            (at ?from_row ?from_col)
            (diff_by_one ?from_row ?to_row)
            (diff_by_two ?from_col ?to_col)
            (not (visited ?to_row ?to_col))     ; each square is visited only once
        )
        :effect (and
            (not (at ?from_row ?from_col))
            (at ?to_row ?to_col)
            (visited ?to_row ?to_col)
        )
    )

    (:action move_2rows_1col        ; knight moves 2 rows and 1 column
        :parameters (?from_row ?from_col ?to_row ?to_col)
        :precondition (and
            (at ?from_row ?from_col)
            (diff_by_two ?from_row ?to_row)
            (diff_by_one ?from_col ?to_col)
            (not (visited ?to_row ?to_col))     ; each square is visited only once
        )
        :effect (and
            (not (at ?from_row ?from_col))
            (at ?to_row ?to_col)
            (visited ?to_row ?to_col)
        )
    )
)
