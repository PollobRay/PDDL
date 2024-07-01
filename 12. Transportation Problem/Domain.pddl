(define (domain Transport)
    (:requirements :strips :conditional-effects :negative-preconditions :equality)

    (:predicates 
        (at ?veh ?loc)
        (empty ?veh)
        (loaded ?veh)
        (on ?pac ?veh)
 
        (package ?pac)
        (vehicle ?veh)
        (location ?loc)
        (truck ?veh)
        (airplace ?veh)
        (movable ?veh ?from ?to)

        ;defines capacities 3
        (n3 ?veh)
        (n2 ?veh)
        (n1 ?veh)
        (n0 ?veh)
    )

    (:action load
        :parameters (?pac ?veh ?loc)
        :precondition (and 
            (package ?pac)
            (vehicle ?veh)
            (location ?loc)

            (at ?pac ?loc)
            (at ?veh ?loc)
            (empty ?veh)
        )
        :effect (and 
            (not (at ?pac ?loc))
            (loaded ?veh)
            (on ?pac ?veh)

            ;condition for capacities
            (when (n3 ?veh) (and (n2 ?veh) (not(n3 ?veh)))) ;decrease capacity by one
            (when (n2 ?veh) (and (n1 ?veh) (not(n2 ?veh)))) ;decrease capacity by one
            (when (n1 ?veh) (and (n0 ?veh) (not(n1 ?veh)) (not (empty ?veh)))) ;decrease capacity by one
            
        )
    )

    (:action unload
        :parameters (?pac ?veh ?loc)
        :precondition (and 
            (package ?pac)
            (vehicle ?veh)
            (location ?loc)

            (at ?veh ?loc)
            (loaded ?veh)
            (on ?pac ?veh)

        )
        :effect (and 
            (not (on ?pac ?veh))
            (at ?pac ?loc)
            (empty ?veh)

            (when (n2 ?veh) (and (n3 ?veh) (not(n2 ?veh)))) ;increase capacity by one
            (when (n1 ?veh) (and (n2 ?veh) (not(n1 ?veh)))) ;increase capacity by one
            (when (n0 ?veh) (and (n1 ?veh) (not(n0 ?veh)))) ;increase capacity by one

        )
    )

    (:action move    ;action of truck
        :parameters (?veh ?from ?to)
        :precondition (and
            (truck ?veh)
            (location ?from)
            (location ?to)
            
            (at ?veh ?from)
            (movable ?veh ?from ?to)
         )
        :effect (and 
            (not (at ?veh ?from))
            (at ?veh ?to)
        )
    )
    
    (:action fly            ;action by airplane
        :parameters (?veh ?from ?to )
        :precondition (and 
            (airplace ?veh)
            (location ?from)
            (location ?to)

            (movable ?veh ?from ?to)
            (at ?veh ?from)
        )
        :effect (and 
            (not (at ?veh ?from))
            (at ?veh ?to)
        )
    )

)