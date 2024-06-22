(define (domain puzzle_8_domain)

    (:requirements :strips )


    (:predicates 
        (at ?tile ?val)         ;value at tile

        (blank ?tile)

        (up ?from_tile ?to_tile)
        (down ?from_tile ?to_tile)
        (left ?from_tile ?to_tile)
        (right ?from_tile ?to_tile)
    )

    (:action move_up
        :parameters (?from ?val ?to)
        :precondition (and 
            (at ?from ?val)
            (blank ?to)
            (up ?from ?to)
        )
        :effect (and 
            (not (at ?from ?val))
            (at ?to ?val)
            (not (blank ?to))
            (blank ?from)
        )
    )

    (:action move_down
        :parameters (?from ?val ?to)
        :precondition (and 
            (at ?from ?val)
            (blank ?to)
            (down ?from ?to)
        )
        :effect (and 
            (not (at ?from ?val))
            (at ?to ?val)
            (not (blank ?to))
            (blank ?from)
        )
    )

     (:action move_left
        :parameters (?from ?val ?to)
        :precondition (and 
            (at ?from ?val)
            (blank ?to)
            (left ?from ?to)
        )
        :effect (and 
            (not (at ?from ?val))
            (at ?to ?val)
            (not (blank ?to))
            (blank ?from)
        )
    )
     
     (:action move_right
        :parameters (?from ?val ?to)
        :precondition (and 
            (at ?from ?val)
            (blank ?to)
            (right ?from ?to)
        )
        :effect (and 
            (not (at ?from ?val))
            (at ?to ?val)
            (not (blank ?to))
            (blank ?from)
        )
    )
    
)