(define (domain missionaries_cannibals_domain)
    (:requirements :strips :typing)

    (:types side num)

    (:predicates
        (boat ?s - side)                    ; boat is at side s
        (opposite ?s1 - side ?s2 - side)    ; s1 and s2 are opposite river sides
        (missionaries ?s - side ?n - num)   ; there are n missionaries at side s
        (cannibals ?s - side ?n - num)      ; there are n cannibals at side s
        (plus1 ?n1 - num ?n2 - num)         ; n2 = n1 + 1
        (plus2 ?n1 - num ?n2 - num)         ; n2 = n1 + 2
        (safe ?m - num ?c - num)            ; m missionaries with c cannibals is safe
                                            ; (no missionaries, or missionaries >= cannibals)
    )

    ; ?m1 ?c1   : missionaries / cannibals at 'from' before the move   (?m1n ?c1n after)
    ; ?m2 ?c2   : missionaries / cannibals at 'to'   before the move   (?m2n ?c2n after)

    (:action move_one_missionary
        :parameters (?from ?to - side ?m1 ?m1n ?m2 ?m2n ?c1 ?c2 - num)
        :precondition (and
            (boat ?from) (opposite ?from ?to)
            (missionaries ?from ?m1) (plus1 ?m1n ?m1)
            (missionaries ?to ?m2) (plus1 ?m2 ?m2n)
            (cannibals ?from ?c1) (cannibals ?to ?c2)
            (safe ?m1n ?c1) (safe ?m2n ?c2)
        )
        :effect (and
            (not (boat ?from)) (boat ?to)
            (not (missionaries ?from ?m1)) (missionaries ?from ?m1n)
            (not (missionaries ?to ?m2)) (missionaries ?to ?m2n)
        )
    )

    (:action move_two_missionaries
        :parameters (?from ?to - side ?m1 ?m1n ?m2 ?m2n ?c1 ?c2 - num)
        :precondition (and
            (boat ?from) (opposite ?from ?to)
            (missionaries ?from ?m1) (plus2 ?m1n ?m1)
            (missionaries ?to ?m2) (plus2 ?m2 ?m2n)
            (cannibals ?from ?c1) (cannibals ?to ?c2)
            (safe ?m1n ?c1) (safe ?m2n ?c2)
        )
        :effect (and
            (not (boat ?from)) (boat ?to)
            (not (missionaries ?from ?m1)) (missionaries ?from ?m1n)
            (not (missionaries ?to ?m2)) (missionaries ?to ?m2n)
        )
    )

    (:action move_one_cannibal
        :parameters (?from ?to - side ?c1 ?c1n ?c2 ?c2n ?m1 ?m2 - num)
        :precondition (and
            (boat ?from) (opposite ?from ?to)
            (cannibals ?from ?c1) (plus1 ?c1n ?c1)
            (cannibals ?to ?c2) (plus1 ?c2 ?c2n)
            (missionaries ?from ?m1) (missionaries ?to ?m2)
            (safe ?m1 ?c1n) (safe ?m2 ?c2n)
        )
        :effect (and
            (not (boat ?from)) (boat ?to)
            (not (cannibals ?from ?c1)) (cannibals ?from ?c1n)
            (not (cannibals ?to ?c2)) (cannibals ?to ?c2n)
        )
    )

    (:action move_two_cannibals
        :parameters (?from ?to - side ?c1 ?c1n ?c2 ?c2n ?m1 ?m2 - num)
        :precondition (and
            (boat ?from) (opposite ?from ?to)
            (cannibals ?from ?c1) (plus2 ?c1n ?c1)
            (cannibals ?to ?c2) (plus2 ?c2 ?c2n)
            (missionaries ?from ?m1) (missionaries ?to ?m2)
            (safe ?m1 ?c1n) (safe ?m2 ?c2n)
        )
        :effect (and
            (not (boat ?from)) (boat ?to)
            (not (cannibals ?from ?c1)) (cannibals ?from ?c1n)
            (not (cannibals ?to ?c2)) (cannibals ?to ?c2n)
        )
    )

    (:action move_one_missionary_one_cannibal
        :parameters (?from ?to - side ?m1 ?m1n ?m2 ?m2n ?c1 ?c1n ?c2 ?c2n - num)
        :precondition (and
            (boat ?from) (opposite ?from ?to)
            (missionaries ?from ?m1) (plus1 ?m1n ?m1)
            (missionaries ?to ?m2) (plus1 ?m2 ?m2n)
            (cannibals ?from ?c1) (plus1 ?c1n ?c1)
            (cannibals ?to ?c2) (plus1 ?c2 ?c2n)
            (safe ?m1n ?c1n) (safe ?m2n ?c2n)
        )
        :effect (and
            (not (boat ?from)) (boat ?to)
            (not (missionaries ?from ?m1)) (missionaries ?from ?m1n)
            (not (missionaries ?to ?m2)) (missionaries ?to ?m2n)
            (not (cannibals ?from ?c1)) (cannibals ?from ?c1n)
            (not (cannibals ?to ?c2)) (cannibals ?to ?c2n)
        )
    )
)
