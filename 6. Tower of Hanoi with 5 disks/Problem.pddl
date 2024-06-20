(define (problem Tower_of_Hanoi_3disk_problem) 
    (:domain Tower_of_Hanoi_3disk)
    (:requirements :strips)   
    (:objects 
        disk1 disk2 disk3 disk4 disk5     
        tower1 tower2 tower3   
    )

    (:init

        (on disk5 tower1)  ;disk5 on tower 1
        (on disk4 disk5)    ; disk4 on disk5
        (on disk3 disk4)    ; disk3 on disk4
        (on disk2 disk3)    ; disk2 on disk3
        (on disk1 disk2)    ; disk1 on disk2
        (clear disk1)

        (clear tower2)
        (clear tower3)

        (small disk1 disk2)
        (small disk1 disk3)
        (small disk2 disk3)
        (small disk1 disk4)
        (small disk2 disk4)
        (small disk3 disk4)
        (small disk1 disk5)
        (small disk2 disk5)
        (small disk3 disk5)
        (small disk4 disk5)

        (small disk1 tower1)
        (small disk1 tower2)
        (small disk1 tower3)
        (small disk2 tower1)
        (small disk2 tower2)
        (small disk2 tower3)
        (small disk3 tower1)
        (small disk3 tower2)
        (small disk3 tower3)
        (small disk4 tower1)
        (small disk4 tower2)
        (small disk4 tower3)
        (small disk5 tower1)
        (small disk5 tower2)
        (small disk5 tower3)

    )

    (:goal (and
        (on disk5 tower3)
        (on disk4 disk5)
        (on disk3 disk4)
        (on disk2 disk3)
        (on disk1 disk2)
    ))
)
