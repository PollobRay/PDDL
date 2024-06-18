(define (domain Knight_Tour)
    (:requirements ::negative-preconditions)

    (:predicates
        (at ?row ?col)
        (visited ?row ?col)
        (diff_by_one ?pos1 ?pos2)
        (diff_by_two ?pos1 ?pos2)
    )

    (:action move_2cols_1row
        :parameters (?from_col ?from_row ?to_col ?to_row)
        :precondition (and 
                    (at ?from_row ?from_col)
                    (diff_by_two ?from_col ?to_col)
                    (diff_by_one ?from_row ?to_row)
                    (not (visited ?to_row ?to_col))
        )
        :effect (and 
                (at ?to_row ?to_col)
                (visited ?to_row ?to_col)
                (not (at ?from_row ?from_col))
        )
    )

    (:action move_2rows_1col
        :parameters (?from_col ?from_row ?to_col ?to_row)
        :precondition (and 
                    (at ?from_row ?from_col)
                    (diff_by_two ?from_row ?to_row)
                    (diff_by_one ?from_col ?to_col)
                    (not (visited ?to_row ?to_col))
        )
        :effect (and 
                (at ?to_row ?to_col)
                (visited ?to_row ?to_col)
                (not (at ?from_row ?from_col))
        )
    )
    
)