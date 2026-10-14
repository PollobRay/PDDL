(define (domain Transport)
    (:requirements :strips :typing)

    (:types
        locatable location num
        package vehicle - locatable
        truck airplane - vehicle
    )

    (:predicates
        (at ?x - locatable ?loc - location)                 ; package/vehicle x is at loc
        (on ?pac - package ?veh - vehicle)                  ; package is inside vehicle
        (movable ?veh - vehicle ?from ?to - location)       ; vehicle can go from 'from' to 'to'
        (capacity ?veh - vehicle ?n - num)                  ; vehicle has room for n more packages
        (next ?n1 ?n2 - num)                                ; n2 = n1 + 1
    )

    (:action load
        :parameters (?pac - package ?veh - vehicle ?loc - location ?n1 ?n2 - num)
        :precondition (and
            (at ?pac ?loc)
            (at ?veh ?loc)
            (capacity ?veh ?n2)         ; vehicle must have free space
            (next ?n1 ?n2)
        )
        :effect (and
            (not (at ?pac ?loc))
            (on ?pac ?veh)
            (not (capacity ?veh ?n2))   ; decrease capacity by one
            (capacity ?veh ?n1)
        )
    )

    (:action unload
        :parameters (?pac - package ?veh - vehicle ?loc - location ?n1 ?n2 - num)
        :precondition (and
            (at ?veh ?loc)
            (on ?pac ?veh)
            (capacity ?veh ?n1)
            (next ?n1 ?n2)
        )
        :effect (and
            (not (on ?pac ?veh))
            (at ?pac ?loc)
            (not (capacity ?veh ?n1))   ; increase capacity by one
            (capacity ?veh ?n2)
        )
    )

    (:action drive                      ; truck moves within a city
        :parameters (?veh - truck ?from ?to - location)
        :precondition (and
            (at ?veh ?from)
            (movable ?veh ?from ?to)
        )
        :effect (and
            (not (at ?veh ?from))
            (at ?veh ?to)
        )
    )

    (:action fly                        ; airplane moves between city airports
        :parameters (?veh - airplane ?from ?to - location)
        :precondition (and
            (at ?veh ?from)
            (movable ?veh ?from ?to)
        )
        :effect (and
            (not (at ?veh ?from))
            (at ?veh ?to)
        )
    )
)
