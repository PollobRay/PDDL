(define (problem Knight_Tour_problem)
    (:domain Knight_Tour)
    (:objects
        n1 n2 n3 n4 n5
    )
    
    (:init
        (at n1 n1)
        (visited n1 n1)

        (diff_by_one n1 n2)
        (diff_by_one n2 n1)
        (diff_by_one n2 n3)
        (diff_by_one n3 n2)
        (diff_by_one n3 n4)
        (diff_by_one n4 n3)
        (diff_by_one n4 n5)
        (diff_by_one n5 n4)

        (diff_by_two n1 n3)
        (diff_by_two n3 n1)
        (diff_by_two n3 n5)
        (diff_by_two n5 n3)
        (diff_by_two n2 n4)
        (diff_by_two n4 n2)
    )
    (:goal (and
        (visited n1 n1)
        (visited n1 n2)
        (visited n1 n3)
        (visited n1 n4)
        (visited n1 n5)

        (visited n2 n1)
        (visited n2 n2)
        (visited n2 n3)
        (visited n2 n4)
        (visited n2 n5)

        (visited n3 n1)
        (visited n3 n2)
        (visited n3 n3)
        (visited n3 n4)
        (visited n3 n5)

        (visited n4 n1)
        (visited n4 n2)
        (visited n4 n3)
        (visited n4 n4)
        (visited n4 n5)

        (visited n5 n1)
        (visited n5 n2)
        (visited n5 n3)
        (visited n5 n4)
        (visited n5 n5)
    ))

)