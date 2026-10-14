# PDDL Lab: 10 Planning Problems (basic to medium)

Each folder contains:
- `domain.pddl`: the domain (types, predicates, actions)
- `problem.pddl`: one problem instance (objects, initial state, goal)
- `solution_plan.txt`: an optimal plan found with A* + LM-cut
- `NN_Name.pdf`: an illustrated explanation covering the problem story, initial and goal state pictures,
  the formulation step by step, a picture of every plan step, how to run it, lab exercises, and the full source

| # | Folder | Level | New PDDL ideas | Plan length |
|---|--------|-------|----------------|-------------|
| 1 | 01_Robot_Navigation | Very basic | domain vs problem, types, one action, static vs fluent facts | 2 |
| 2 | 02_Vacuum_Cleaner | Very basic | two actions, conjunctive goals, dirty/clean instead of negation | 4 |
| 3 | 03_Gripper | Basic | several types, 3-parameter actions, grounding, resources | 11 |
| 4 | 04_Monkey_and_Banana | Basic | 0-ary predicates, objects moving together | 4 |
| 5 | 05_Blocks_World | Basic / Intermediate | classic benchmark, interacting subgoals (Sussman anomaly) | 6 |
| 6 | 06_Tower_of_Hanoi | Intermediate | type hierarchy, rules as static facts | 7 |
| 7 | 07_Farmer_Wolf_Goat_Cabbage | Intermediate | safety constraints in plain STRIPS | 7 |
| 8 | 08_Logistics | Intermediate / Medium | deep type hierarchy, generic actions, multi-vehicle | 15 |
| 9 | 09_Eight_Puzzle | Medium | grids via adjacency, large state spaces, heuristics | 5 |
| 10 | 10_Sokoban | Medium | directional adjacency, 4-parameter actions, dead ends | 11 |

All domains use only `:strips :typing`, so they run on any planner.

## Running
- Online: https://editor.planning.domains (paste domain + problem, press Solve)
- pyperplan: `pip install pyperplan`, then `pyperplan -s astar -H lmcut domain.pddl problem.pddl`
- Fast Downward: `fast-downward.py domain.pddl problem.pddl --search "astar(lmcut())"`
