(define (problem BLOCKS-5-0)
    (:domain BLOCKS)
    (:objects
        A B C D E
    )
    (:init
        (ontable E)
        (ontable A)
        (ontable B)
        (ontable C)
        (on D C)

        (clear E)
        (clear A)
        (clear B)
        (clear D)
        (handempty)
    )
    (:goal (and
        (ontable A)
        (on C A)
        (on E C)
        (clear E)

        (ontable D)
        (on B D)
        (clear B)
        (handempty)
    ))
)
