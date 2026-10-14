; Blocks World with two rooms: a robot gripper moves blocks between the tables of two rooms

(define (domain BLOCKS-two-rooms)
    (:requirements :strips :typing :equality :negative-preconditions :conditional-effects)

    (:types
        room
        object
        block table - object
    )

    (:constants
        Table1 Table2 - table       ; Table1 is in room1, Table2 is in room2
    )

    (:predicates
        (at ?x - object ?r - room)  ; object x is in room r
        (on ?x - block ?y - object) ; block x is on block/table y
        (handempty)                 ; robot hand is empty
        (holding ?x - block)        ; robot is holding x
        (clear ?x - object)         ; nothing is on x (a table is always clear)
        (at_room ?r - room)         ; robot is in room r
    )

    (:action pick-up
        :parameters (?obj - block ?from - object ?room - room)
        :precondition (and
            (at_room ?room)         ; robot must be in the room
            (at ?obj ?room)         ; obj must be in the room
            (at ?from ?room)        ; from must be in the room
            (on ?obj ?from)         ; obj must be on from
            (handempty)             ; robot hand must be empty
            (clear ?obj)            ; obj must be clear
        )
        :effect (and
            (not (at ?obj ?room))   ; obj is carried, not in the room
            (not (on ?obj ?from))   ; obj is no longer on from
            (not (handempty))       ; robot hand is no longer empty
            (holding ?obj)          ; robot is now holding obj
            (not (clear ?obj))      ; obj is not clear while held
            (clear ?from)           ; from is now clear (a table stays clear)
        )
    )

    (:action put-down
        :parameters (?obj - block ?to - object ?room - room)
        :precondition (and
            (at_room ?room)         ; robot must be in the room
            (at ?to ?room)          ; to must be in the room
            (holding ?obj)          ; robot must be holding obj
            (clear ?to)             ; to must be clear
        )
        :effect (and
            (at ?obj ?room)         ; obj is now in the room
            (on ?obj ?to)           ; obj is on to
            (clear ?obj)            ; obj is now clear
            (handempty)             ; robot hand is now empty
            (not (holding ?obj))    ; robot is no longer holding obj
            (when (and (not (= ?to Table1)) (not (= ?to Table2)))
                (not (clear ?to)))  ; when to is a block, it is no longer clear
        )
    )

    (:action move
        :parameters (?from_room - room ?to_room - room)
        :precondition (and
            (at_room ?from_room)            ; robot must be in from_room
            (not (= ?from_room ?to_room))
        )
        :effect (and
            (not (at_room ?from_room))
            (at_room ?to_room)
        )
    )
)
