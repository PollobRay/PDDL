(define (problem map_coloring_problem) 
    (:domain map_coloring)
    (:requirements :strips :typing :negative-preconditions)

    (:objects 
        WA NT Q NSW V SA T  - region    ;Variable
        red green blue       - color   ;Domain
    )

    (:init
        (adjacent WA NT)
        (adjacent WA SA)

        (adjacent NT WA)
        (adjacent NT SA)
        (adjacent NT Q)

        (adjacent SA WA)
        (adjacent SA NT)
        (adjacent SA Q)
        (adjacent SA NSW)
        (adjacent SA V)

        (adjacent Q NT)
        (adjacent Q SA)
        (adjacent Q NSW)

        (adjacent NSW Q)
        (adjacent NSW SA)
        (adjacent NSW V)

        (adjacent V SA)
        (adjacent V NSW)

        (clear WA)      ;means no color
        (clear NT)
        (clear Q)
        (clear NSW)
        (clear V)
        (clear SA)
        (clear T)

    )

    (:goal (and
        (not (clear WA))  ; colored
        (not (clear NT))
        (not (clear Q))
        (not (clear NSW))
        (not (clear V))
        (not (clear SA))
        (not (clear T))
    ))
)
