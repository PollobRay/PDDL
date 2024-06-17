(define (domain Four-Knight)
    (:requirements :negative-preconditions )
    (:predicates
        (at ?knight ?pos1 ?pos2)              ; a kight position defined by col and row
        (diff_by_one ?pos1 ?pos2)   ; two col or row difference is one or not indication
        (diff_by_two ?pos1 ?pos2)   ; two col or row difference is two or not indication
        (empty ?col ?row)           ; a position is empty or not indication
        )
    
    (:action move_knight_2col_1row     ;move knight as knight move 2 column and 1 row
        :parameters (?knight ?from_col ?from_row ?to_col ?to_row)
        :precondition (and (at ?knight ?from_col ?from_row)                 ; knight must at from_col from_row position
                            (empty ?to_col ?to_row)                 ; to_col to_row must be empty to move a knight
                            (diff_by_two ?from_col ?to_col)         ; must diffence between from and to column is 2
                            (diff_by_one ?from_row ?to_row)         ; must difference between from and to row is 1
        )
        :effect (and (not (at ?knight ?from_col ?from_row))         ; not at from_col from_row position
                    (at ?knight ?to_col ?to_row)                    ; now at to_col and to_row position
                    (empty ?from_col ?from_row)             ; making empty from_col from_row position
                    (not (empty ?to_col ?to_row))           ; making not empty to_col to_row position
        )
    )

    (:action move_knight_2row_1col                  ;move knight as knight move 1 column and 2 row
        :parameters (?knight ?from_col ?from_row ?to_col ?to_row)
        :precondition (and (at ?knight ?from_col ?from_row)                 ; knight must at from_col from_row position
                            (empty ?to_col ?to_row)                 ; to_col to_row must be empty to move a knight
                            (diff_by_one ?from_col ?to_col)         ; must diffence between from and to column is 1
                            (diff_by_two ?from_row ?to_row)         ; must difference between from and to row is 2
        )
        :effect (and (not (at ?knight ?from_col ?from_row))         ; not at from_col from_row position
                    (at ?knight ?to_col ?to_row)                    ; now at to_col and to_row position
                    (empty ?from_col ?from_row)             ; making empty from_col from_row position
                    (not (empty ?to_col ?to_row))           ; making not empty to_col to_row position 
        )
    )
    
)
