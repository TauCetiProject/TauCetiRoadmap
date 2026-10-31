# Alexander profiles through thirteen crossings: finite candidate inputs

The definitive specification is [the profile stage](../README.md#alexander-profiles-through13).
Its domain is the certified nontrivial-prime, mirror/reversal-forgotten
catalogue through thirteen crossings. Names below use the Atlas/Knotscape
`Kcnj` convention: c crossings, nonalternating index j. Each signed DT
word is an external finite candidate input. Construct its native planar
code and actual geometric realization and prove its catalogue identity;
a table label, polynomial value or DT parity check alone proves none of those.

## Historical literals and the correction target

Knot Theory physical p. 179 states “12 965”, “5639”, “14” Alexander-trivial
prime knots, and “1000 pairs” left after finite-group tests. A Luna reread
confirms the digit 14; it is not a correction of a misread 19. Retain these
literal assertions. In the specified cumulative prime quotient, the exact
targets are 12965 rows, 5639 distinct normalized Alexander polynomials,
3056 singleton polynomial fibers, 25400 unordered equal-polynomial pairs,
and 19 unit-polynomial rows, listed below. The unit rows number 2 at 11,
2 at 12 and 15 at 13; there are none at smaller crossings. The unknot is excluded.
The historical “1000” lacks a specified filter key, pair list and rounding
convention; the README defines separate reproducible keys and requires
all their exact outputs without assigning an unsupported 1000 equality.

## Nineteen unit-polynomial candidates

All nineteen saved Atlas Alexander fields literally equal `1`. These are
candidate values for the native normalized geometric Δ; proving that
comparison on every actual row is required. Normalization means inversion
symmetry and Δ(1)=1, not merely determinant 1. The sign of a DT entry is
part of the input; a single global mirror is allowed in the stated quotient.

| Atlas/Knotscape name | Signed DT word |
|---|---|
| `K11n34` | `4 8 12 2 -16 -18 6 -20 -22 -14 -10` |
| `K11n42` | `4 8 12 2 -18 -20 6 -10 -22 -14 -16` |
| `K12n313` | `4 10 12 -20 -16 2 -22 -8 -24 -14 -6 -18` |
| `K12n430` | `4 10 -14 -22 -16 2 20 -24 -8 -6 12 -18` |
| `K13n65` | `4 8 10 14 2 -20 -18 6 -22 -26 -24 -16 -12` |
| `K13n71` | `4 8 10 14 2 -22 -20 6 -12 -24 -16 -26 -18` |
| `K13n866` | `4 8 14 2 -18 -24 -20 6 -22 -26 -16 -12 -10` |
| `K13n1019` | `4 8 14 2 -22 -18 -24 6 -12 -10 -26 -16 -20` |
| `K13n1496` | `4 10 12 -16 2 8 -22 -6 -26 -24 -14 -20 -18` |
| `K13n1756` | `4 10 14 -16 2 -20 -24 22 -12 -26 -8 6 -18` |
| `K13n1757` | `4 10 14 -16 2 -20 -24 22 -12 -26 8 -6 -18` |
| `K13n3871` | `6 8 14 16 4 -18 -24 2 -22 -12 -26 -10 -20` |
| `K13n3872` | `6 8 14 16 4 -24 -20 2 -22 -10 -26 -18 -12` |
| `K13n3897` | `6 8 16 14 4 -18 -22 2 -24 -12 -26 -10 -20` |
| `K13n3934` | `6 8 20 22 4 -16 -26 -10 -24 -14 2 -12 -18` |
| `K13n3936` | `6 8 20 22 4 -24 -18 -10 -26 -14 2 -16 -12` |
| `K13n3938` | `6 8 22 20 4 -16 -26 -10 -24 -12 2 -14 -18` |
| `K13n4582` | `6 10 -22 12 -16 2 26 20 -8 24 -4 14 18` |
| `K13n4591` | `6 -10 -22 14 -2 18 8 26 24 12 16 -4 20` |

## Independent data calibration and its limits

The [Knot Atlas take-home database](https://katlas.org/wiki/Take_Home_Database)
provides these four RDF snapshots. The SHA-256 hashes pin the compressed
candidate data used for the finite checks:

| File | SHA-256 | Prime Alexander rows retained |
|---|---|---:|
| [Rolfsen.rdf.gz](https://katlas.org/Data/Rolfsen.rdf.gz) | `350d430583b5ad91530a837baaea4e1525bd247a12d7b077d2f262ddb6943c4c` | 249 |
| [Knots11.rdf.gz](https://katlas.org/Data/Knots11.rdf.gz) | `475f90d7c0fb8b59a1d3cae27b615ee1659ecf9565a2155f7fa8f39511195b3d` | 552 |
| [Knots12.rdf.gz](https://katlas.org/Data/Knots12.rdf.gz) | `6196d6312c7a4c9ea246bb49f568d809fc510b9bf5f62c1ed2763f49c4811f22` | 2176 |
| [Knots13.rdf.gz](https://katlas.org/Data/Knots13.rdf.gz) | `63ab77593c1ed725d599cf0da0b1bd13600a0fc38a74c2d61bfb5f6b804d2ad5` | 9988 |

The Rolfsen snapshot includes the unknot, which is removed here. Parsing
all remaining coefficients with complete term consumption, checking
inversion symmetry and normalizing at 1 gives the numerical targets above.
As a separate cross-check, all 2977 prime rows through twelve crossings
agree with the available Conway fields after the exact substitution
`z²=t+t⁻¹−2`; the thirteen-crossing snapshot has no Conway fields.
The polynomial-fiber histogram has 5639 fibers, total size 12965 and
`Σ choose(fiber size,2)=25400`. A thirteen-entry coefficient vector on
[−6, 6] is sufficient only after the README's support-bound proof.

These are calculations on external candidate data. They do not prove
catalogue completeness, distinctness, primeness, crossing minima or the
geometric invariant of any row. The actual native diagram, matrix/Fox,
polynomial and finite-representation certificates and the certified
catalogue bijection are the README's mathematical requirements.
