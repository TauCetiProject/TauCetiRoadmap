# Roadmap: arithmetic statistics, counting fields and Selmer distributions

**Summary.** Arithmetic statistics studies arithmetic objects in families rather than one at a time. The members of a family are ordered by a height, and one asks how they are distributed. With what density do fields of a given kind occur? How do their class groups behave on average? How do Selmer groups behave on average across a family?

This series of roadmaps develops that subject in Lean. It builds arithmetic families with heights and integral orbit dictionaries, and it proves uniform counting and sieve estimates. It also treats statistics of fields and of class groups, and averages of Selmer groups. Alongside these it develops probabilistic tools and quadratic probability models, and it studies distributions over function fields and statistics of a geometric kind.

This page is the entry point of the series and states no theorem of its own. The work is carried out in eight roadmaps, [ArithmeticStatisticsPartI](../ArithmeticStatisticsPartI/README.md) to [ArithmeticStatisticsPartVIII](../ArithmeticStatisticsPartVIII/README.md), which sit beside this one in Tau Ceti. The headline theorems of the series are those of the parts. This page uses no object from them; it only arranges them. Each part's README states its targets, its conventions and its references, and each part states its headline theorems in Lean.

The first three parts set up the families and the means of counting them. Part I treats the families themselves, with their heights and their local specifications, the conditions a family imposes one place at a time. Part II builds the integral orbit dictionaries. These describe the arithmetic objects through integral orbits, orbits of a group action defined over the integers. Part III proves uniform counts of such orbits, together with sieves.

The next three parts turn to probability and to the arithmetic results. Part IV provides the probabilistic tools: probability on finite groups, matrix laws and tools for computing moments. Part V treats statistics of fields and of their class groups. Part VI computes Selmer averages, together with arithmetic applications.

The last two parts concern the quadratic and the geometric models. Part VII builds quadratic probability models, together with applications to twists. Part VIII treats distributions over function fields and statistics of a geometric kind.

## Scope and ownership

The series consists of the following eight roadmaps. Each part's README states its targets, its conventions, its supplier contracts and its references; its `Suggested.lean` states its headline theorems.

| Part | Mathematical scope |
| --- | --- |
| [I](../ArithmeticStatisticsPartI/README.md) | Families, heights and local specifications. |
| [II](../ArithmeticStatisticsPartII/README.md) | Integral orbit dictionaries. |
| [III](../ArithmeticStatisticsPartIII/README.md) | Uniform orbit counts and sieves. |
| [IV](../ArithmeticStatisticsPartIV/README.md) | Finite groups, matrix laws and moment tools. |
| [V](../ArithmeticStatisticsPartV/README.md) | Fields and class-group statistics. |
| [VI](../ArithmeticStatisticsPartVI/README.md) | Selmer averages and arithmetic applications. |
| [VII](../ArithmeticStatisticsPartVII/README.md) | Quadratic probability models and twist applications. |
| [VIII](../ArithmeticStatisticsPartVIII/README.md) | Function-field distributions and geometric statistics. |

## Exact supplier contracts

The prerequisites are the eight parts [ArithmeticStatisticsPartI](../ArithmeticStatisticsPartI/README.md), [ArithmeticStatisticsPartII](../ArithmeticStatisticsPartII/README.md), [ArithmeticStatisticsPartIII](../ArithmeticStatisticsPartIII/README.md), [ArithmeticStatisticsPartIV](../ArithmeticStatisticsPartIV/README.md), [ArithmeticStatisticsPartV](../ArithmeticStatisticsPartV/README.md), [ArithmeticStatisticsPartVI](../ArithmeticStatisticsPartVI/README.md), [ArithmeticStatisticsPartVII](../ArithmeticStatisticsPartVII/README.md) and [ArithmeticStatisticsPartVIII](../ArithmeticStatisticsPartVIII/README.md); this page uses no object from them.
