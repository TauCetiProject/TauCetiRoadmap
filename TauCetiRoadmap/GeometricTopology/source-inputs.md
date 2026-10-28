# Course-source inputs for the knot examples

This note defines the source-specific inputs consumed by **GT4: Colourings and
finite integral presentations** and **GT4: Embedded surfaces, ordinary genus and
satellite families**. It is part of this roadmap. The complete construction and
proof targets remain mandatory; the unresolved diagram and identity data below
are input holds, not permission to replace an example by a generic existence
theorem.

## Source identities and paragraph index

Physical pages refer to the named course documents, not printed book pagination.
The hashes identify the documents; they do not assert that the remaining pictures
or source assertions have been verified.

| Document | Source identity | Physical pages and exact identifiers |
| --- | --- | --- |
| *Knot Theory.pdf* | `ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa` | Pages73–76: `KM-P073-B004–B007/B009`, `KM-P074-B004–B016`, `KM-P075-B004–B008/B010`, `KM-P076-B004–B006/B009`. |
| *Knot Theory.pdf* | Same identity | Page106: `KM-P106-B004–B007`; page177: `KM-P177-B009/B010/B012`. |
| *Knot Theory - problems.pdf* | `06c19def0f01d6e74a1ee99bd448bd3731e101377deddb5aa573943898afb3b1` | Physical-page4 problem20: `KP-E020`; physical-page5 problem30 and physical-page6 continuation: `KP-E030`. |

The identifiers locate particular source assertions or examples. They do not
certify a knot diagram from a matrix or turn unreadable labels into specified
input. The explicit arrays and descriptions here make the algebraic tasks usable
without a private transcript, repository-root request, or evidence-directory link.

## Marked crossing changes

The source diagram is physical-page1 problem4 of *Knot Theory - problems.pdf*.
In *Knot Theory.pdf*, pages20–22 contain a worked unknotting change followed
by a different marked crossing change and an incomplete Alexander matrix.
The latter calculation prints

```text
Q(t) = t² − 5t³ + 10t⁴ − 13t⁵ + 10t⁶ − 5t⁷ + t⁸,
Δ_Q(t) = −t⁻⁵Q(t),    Δ_Q(1) = 1,    |Δ_Q(−1)| = 45.
```

Pages201–202 label crossings of an eleven-crossing diagram A, B and C.
The text asserts that reversing A gives the unknot, and reversing B or C
leaves a nontrivial knot. For B it displays a nonconstant 3-colouring and
asserts a decomposition `3₁ # 6₃`, whose determinant would be `3·13=39`.
The [Knot Atlas's 6₃ entry](https://katlas.org/wiki/6_3) gives the normalized
polynomial `t²−3t+5−3t⁻¹+t⁻²` and determinant13. Use an actual named-knot
presentation and the Alexander computation to certify this value locally;
the table is a reference value, not the geometric identification.
The page21 circled crossing has no established A/B/C correspondence. Do not
identify that change with B, or assign both determinant45 and determinant39
to the same realized knot. The unreadable/overwritten page22 matrix entries
must be recovered from the actual diagram and its arc relations. Q is a
literal source polynomial, not a certified invariant of that diagram.

The complete targets are the actual diagram realizations, crossing
correspondences, finite unknotting/connected-sum movies, 3-colouring and
Alexander computations. Determine whether different marked changes account
for the different values; otherwise identify and correct the source error
by those geometric and algebraic computations. Neither fitting a missing
matrix entry to Q nor replacing the drawn knot by an arbitrary knot with
that polynomial supplies the required comparison.

## Two distinct Seifert matrices and the general template

Use the source convention `V_ij = lk(x_i,x_j^+)`: the **second** curve receives the
positive push-off. The page73–74 example uses six marked circles. Its matrix is

```text
V74 = [  1  0  0  0  0  0
        -1  0 -1  0  0  0
         0 -1  0  0  0  0
         0  0 -1 -1 -1  0
         0  0  0 -1  0  0
         0  0  0  0 -1  1 ].
```

The separate page75 size-six template is

```text
V3  = [  1  0  0  0  0  0
        -1  0 -1  0  0  0
         0 -1  0  0  0  0
         0  0 -1  0 -1  0
         0  0  0 -1  0  0
         0  0  0  0 -1  1 ].
```

Thus `V74 = V3 - E44`, with fourth diagonal entries respectively `-1` and `0`.
Keep both examples. In particular, an older uncertain transcription of the
page74 polynomial array cannot override the matrix definition above: derive
`V74 - t V74ᵀ` entry by entry from it. The corrected array differs from that older
transcription at `(4,5)`, `(5,4)` and `(5,6)`, whose corrected entries are
respectively `-1+t`, `-1+t` and `t`. These are transcript corrections, not source
errors; no geometric identification follows from correcting them.

For every integer `k≥1`, define the page75 algebraic template `V_k` on **1-based**
indices of size `2k` by

```text
(V_k)11 = (V_k)(2k,2k) = 1;
(V_k)(i,i-1) = -1                 for 2 ≤ i ≤ 2k;
(V_k)(i,i+1) = -1                 for even i with 2 ≤ i < 2k;
all other entries = 0.
```

The algebraic deliverable includes a tridiagonal-continuant proof, including
`k=1`, of

```text
det(V_k - t V_kᵀ) = (-1)^(k-1) (1-t)^(2k) + t^k.
det(V74 - t V74ᵀ) = 1-5t+11t²-13t³+11t⁴-5t⁵+t⁶.
det(V3  - t V3ᵀ)  = 1-6t+15t²-19t³+15t⁴-6t⁵+t⁶.
```

The nonzero extreme coefficients give span `2k` for the general template. This
does **not** identify the page76 boundary knot. For the literal source family,
construct its oriented band/closure diagram for each `k`, mark the crossing to
change, mark all `2k` basis curves, compute their actual linking matrix, and
compare with this template. Explain the printed “`k` bands” versus `2k` basis
generators. If “bands” counts ordinary one-handles in a connected presentation
with `d≥1` discs and `b=k` bands, its first Betti number is `k−d+1≤k`;
this cannot give the claimed rank `2k` for `k≥1`. Specify the actual meaning
and attachment data rather than silently treating each band as a handle pair.
Supply an embedded genus-`k` spanning surface and the actual
one-crossing-change unknotting sequence. Only after that identification and these
witnesses may the span lower bound and nontriviality give `g=k` and `u=1`.
A different knot with the same Seifert matrix does not discharge this obligation.

## Problem20 and every problem30 pictured occurrence

`KP-E020` asks for linking numbers of the four illustrated Hopf, King Solomon,
Whitehead and Borromean links. `KP-E030` asks for three-coloring decisions for the
four links of question20 and its pictured diagrams; the existing description has
six pictured occurrences, four above and two below. The printed prompt says
“Consider the four links of question20 and the following links”: there are
four page4 occurrences and six additional page5 occurrences, ten in total.
Keep **every occurrence**. This does not assert ten distinct link types;
identify repeated types only by explicit diagram comparisons.

For each occurrence obtain the exact signed crossing/component/arc data, the
correspondence to its source picture and any named link, every coloring equation,
and the generated-subgroup certificate where required. The page6 continuation
requires Whitehead nonsplitting from its actual three-coloring count; linking
number0 or a guessed drawing is not a substitute. Preserve its superscript
footnote marker after “number”: no corresponding footnote text is currently
specified.

### Two recovered Fox systems

Use the following location and arc markings on the actual problem20 drawings.
The pictures have no component orientations; the traversal choices below fix
arc names. Fox3 equations are independent of reversing those traversals.
Every row means `2·over = under-in + under-out` in Z/3.

For **King Solomon's knot**, the pictured link has two components H and V,
with four crossings K1 upper-left, K2 upper-right, K3 lower-right and K4
lower-left. H traverses K1,K2,K3,K4 and V traverses K4,K1,K2,K3 cyclically.
Cut H at K1,K3 and V at K2,K4. Let h1 run K1 through K2 to K3, h2 run
K3 through K4 to K1, v1 run K4 through K1 to K2, and v2 run K2 through K3
to K4. The crossing data are:

| Crossing | Overarc | Under-in | Under-out |
| --- | --- | --- | --- |
| K1 | v1 | h2 | h1 |
| K2 | h1 | v1 | v2 |
| K3 | v2 | h1 | h2 |
| K4 | h2 | v2 | v1 |

In column order h1,h2,v1,v2 the integral Fox rows are
`[-1,-1,2,0]`, `[2,0,-1,-1]`, `[-1,-1,0,2]`, `[0,2,-1,-1]`.
Identify this system with the coloring space of the realized source diagram;
prove its kernel modulo3 is exactly the constant functions, of cardinality3.
Construct the oriented crossing-sign comparison for the linking-number
calculation separately; no signed linking value is inferred from absent arrows.

For the **Whitehead link**, use W1 upper-left, W2 lower-left, W3 central,
W4 upper-right and W5 lower-right. The outer oval component V traverses
W1,W2,W5,W4 cyclically. The winding component H traverses
W1,W3(over diagonal),W5,W4,W3(under curved branch),W2. W3 is its self-crossing.
Cut V at W2,W4 and H at W1,W3's under-visit,W5. Let v1 run W2 through W5
to W4, v2 run W4 through W1 to W2; let h1 run W1 through W3's over-visit
to W5, h2 run W5 through W4 to W3's under-visit, and h3 run that under-visit
through W2 to W1. The crossing data are:

| Crossing | Overarc | Under-in | Under-out |
| --- | --- | --- | --- |
| W1 | v2 | h3 | h1 |
| W2 | h3 | v2 | v1 |
| W3 | h1 | h2 | h3 |
| W4 | h2 | v1 | v2 |
| W5 | v1 | h1 | h2 |

In column order h1,h2,h3,v1,v2 the integral Fox rows are
`[-1,0,-1,0,2]`, `[0,0,2,-1,-1]`, `[2,-1,-1,0,0]`,
`[0,2,0,-1,-1]`, `[-1,-1,0,2,0]`. Identify this system with the
coloring space of the realized source diagram. Its kernel modulo3 is
exactly the constant functions, of cardinality3; thus it has no nonconstant
three-coloring. For a split two-component link, a separated diagram admits
nine distinct assignments of independent constant colors to its components.
Transport them injectively through the Reidemeister coloring bijections.
Consequently the count3 proves Whitehead nonsplitting. No nonconstant
coloring is needed for this obstruction.

[Problem20FoxTargets.lean](Problem20FoxTargets.lean) proves the two literal
matrix-kernel and cardinality calculations. The diagram-to-matrix comparison
and the geometric splitting argument remain the corresponding README targets.
The Hopf and Borromean crossing data and all six page5 diagrams still require
their own source correspondences and calculations.

State the course's splitting convention explicitly. Comparing its half-space
representative with a locally flat separating-sphere definition uses the **GT4
coloring split-comparison**: Layer2 bicollar/Brown Schoenflies, comparison3g's
dimension≤3 relative Moise/smoothing, and Layer3 supported isotopy extension, with
their actual category/collar hypotheses. This is not a generic unsupported
splitting equivalence.

## Mixed-cycle labels and indexed doubling

At `KM-P177-B009/B010/B012`, the legible outer labels are
`a=(45)(123)` and `b=(35)(124)`, with right-to-left composition. Their generation
certificate is explicit: `a³=(45)`, `b³=(35)` and `ab=(13425)`.
Mathlib's `Equiv.Perm.closure_prime_cycle_swap` applies to the full five-cycle
`ab` and the transposition `a³`; thus `⟨a,b⟩=S₅`. Cubing both labels alone
produces the subgroup on letters3,4,5 and fixes1,2, so it is not by itself
an S₅ generation argument. The native finite certificate is in
[KnotMixedCycleTargets.lean](KnotMixedCycleTargets.lean), with source letters1–5
encoded by `Fin 5` entries0–4.

The outer labels do not specify the crowded interior labels or the complete
oriented knot diagram. Recover that actual crossing/arc data and verify every
conjugation equation. Once a valid coloring containing these two labels is
established, the preceding certificate proves its labels generate S₅. Neither
invented intermediate labels nor a different labeled diagram settles the source
example; the diagram-coloring assertion remains distinct from group generation.

At `KM-P106-B004–B007`, the printed claim uses k copies of T(2,5) and
S_(3+2k), with a consistent transitive3-cycle coloring and some double obtained
by adding twists. The [indexed construction](README.md#indexed-cinquefoil-doubles)
fixes the positive braid σ₁⁵⋯σ_k⁵, cycles(123) and(3,2j+2,2j+3), their
right-to-left factor pairs and the N−1-edge transposition tree. It also
specifies the four-crossing cable blocks, full-twist orbit and finite choice
of a marked Whitehead double, with every clasp/port, framing and bridge
comparison a mandatory proof target. These intrinsic data supply the
mathematical construction; a generic colorability theorem is insufficient.

Figure7.12 on physical page105 has no orientation markers or signed
framing/twist count, and does not specify
all over/under data in its short joining detail. Page106 states no composition
convention and says only that twists correct the mismatch. Thus no unique
signed double is asserted to have been recovered from the drawing. The
explicit choice above realizes the source's existential construction and
retains its exact k and symmetric-group indices; its geometric and coloring
proofs remain work to build.

## Remaining input holds and resolution criteria

| Required input | What would resolve its hold |
| --- | --- |
| Page76 repeated oriented band/closure family, marked crossing and `2k` basis correspondence | An intrinsic signed band/diagram table or a defining source giving every attaching/crossing/orientation choice and the basis map; then actual matrix, surface and unknotting comparisons. |
| Problem20/30 remaining pictured data | Signed linking-number comparisons, the Hopf/Borromean Fox data, and all six additional page5 diagram codes and calculations. The two systems above supply the King Solomon/Whitehead Fox inputs; the ten occurrence positions are fixed, while repeated link types need explicit comparisons. |
| Problem30 missing footnote and splitting convention | The footnote's actual text, or explicit source qualification that it remains unavailable, and the precise splitting convention/category needed for the stated comparison. |
| Page177 mixed `S₅` example | Complete interior labels and oriented crossing data, with crossing and generated-subgroup certificates. |
| Page106 indexed doubling/bridge construction | The explicit indexed braid/cycles/cable and finite-twist targets are specified above and in the README. Build their realized clasp/port equations, framing comparison and bridge proof; the schematic source fixes no unique signed twist variant. |

These holds retain the full original programme. The note supplies explicit
algebraic inputs and source locators, not the missing geometry, source proof,
native implementation or completed theorem. Operational recovery records may
exist elsewhere; no private file is a prerequisite for understanding this note.


<a id="torus-symmetry-source"></a>
## Torus-knot symmetry exercise and signed braid notation

The problem source `06c19def0f01d6e74a1ee99bd448bd3731e101377deddb5aa573943898afb3b1`,
physical page1 problem6, asks for the coordinate-swap and single/double-sign comparisons
for coprime torus knots. The main notes
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`, physical page23,
use the flat-torus slope p/q and write the negative-p braid as
`(σ_(p−1)⁻¹⋯σ₁⁻¹)^q` for p<0. Preserve that literal index. The mathematical
braid interpretation uses a=|p| positive strands and the reversed inverse word
`(σ_(a−1)⁻¹⋯σ₁⁻¹)^q`; it has no negative strand count. Keep the source's
single-p-sign mirror conclusion, compared with the fixed single-q-sign mirror
by the orientation-reversal/invertibility construction in
[GT4's torus model](README.md#gt4-torus-models). The square-torus coordinate swap
requires the actual ambient S³ isotopy given there. This note records source
wording and the precise corrected target; it is not a diagram-identity certificate.


<a id="five-one-presentation-source"></a>
## Problem79: the cinquefoil presentation

Physical page13 of *Knot Theory - problems.pdf* asks for the knot group of
`5₁` with relator `xyxyxy⁻¹x⁻¹y⁻¹x⁻¹y⁻¹` and its Alexander polynomial.
The signed word is `(x,+),(y,+),(x,+),(y,+),(x,+),(y,−),(x,−),(y,−),(x,−),(y,−)`.
In particular, there are five positive letters followed by five negative
letters, and the relator equation is `xyxyx=yxyxy`.

The [worked group/Fox target](README.md#five-one-group-fox)
uses the positive braid `σ₁⁵` and the torus model `T(2,5)` to fix the geometric
representative, while keeping both generator maps and the meridional
specialization explicit. `FiveOneTargets.lean` supplies this literal word,
native presented groups, the inverse-generator-map target, and exact Laurent
Fox calculations. Its raw-word formula still requires the stated comparison
with generic group-ring Fox differentiation and the geometric Wirtinger/PD
module. An abstract presentation alone does not choose a chirality.


<a id="problem67-surface-source"></a>
## Problem67: the marked four-band surface

Physical page11 of *Knot Theory - problems.pdf* (source identity
`06c19def0f01d6e74a1ee99bd448bd3731e101377deddb5aa573943898afb3b1`)
prints the four-by-four array [specified in GT4](README.md#gt4-problem67-seifert)
and labels curves x₁,…,x₄ from left to right. Their lower-arc arrows point
right. These mark the curve orientations, but no positive normal or push-off
is drawn, and the finite signed band/attachment/crossing description is not
specified in the print. Recover that geometric description and its convention
comparison; fitting twists to the diagonal entries or realizing an unrelated
surface with this matrix does not identify the pictured source surface.
The literal matrix computations and the conditional genus/signature
consequences are distinct from that still-required marked geometric comparison.


<a id="problem80-source"></a>
## Problem80: two-generator scope

Physical page13 of *Knot Theory - problems.pdf* (source identity
`06c19def0f01d6e74a1ee99bd448bd3731e101377deddb5aa573943898afb3b1`)
asks for two-generator presentations for “each knot with less than eight
crossings,” without a printed prime restriction. The
[explicit two-trefoil composite and quotient](README.md#problem80-composite-generators)
show why that wording cannot include every composite knot: it has a
six-crossing diagram but its group needs three ordinary generators.
The prime-table task remains, together with the required larger composite
presentations. This is a mathematical scope correction, not a claim that
the source itself stated the prime qualification.
