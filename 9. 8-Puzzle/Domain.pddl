(define (domain puzzle_8_domain)
    (:requirements :strips)

    (:predicates
        (at ?tile ?pos)                 ; tile is at board position pos
        (blank ?pos)                    ; board position pos is blank
        (adjacent ?from ?to)            ; from and to are neighbours (up/down/left/right)
    )

    (:action move                       ; slide tile from its position into the blank neighbour
        :parameters (?tile ?from ?to)
        :precondition (and
            (at ?tile ?from)
            (blank ?to)
            (adjacent ?from ?to)
        )
        :effect (and
            (not (at ?tile ?from))
            (at ?tile ?to)
            (not (blank ?to))
            (blank ?from)
        )
    )
)
