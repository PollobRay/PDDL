;; Robot starts in the kitchen and must reach the bedroom.
;;
;;   +---------+---------+
;;   | kitchen | hall    |
;;   +---------+---------+
;;   | bathroom| bedroom |
;;   +---------+---------+
;; Doors: kitchen-hall, hall-bedroom, kitchen-bathroom
(define (problem robot-nav-1)
  (:domain robot-navigation)

  (:objects kitchen hall bedroom bathroom - room)

  (:init
    (robot-at kitchen)
    ;; doors work in both directions, so we list both
    (connected kitchen hall)     (connected hall kitchen)
    (connected hall bedroom)     (connected bedroom hall)
    (connected kitchen bathroom) (connected bathroom kitchen)
  )

  (:goal (robot-at bedroom))
)
