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
generators. Supply an embedded genus-`k` spanning surface and the actual
one-crossing-change unknotting sequence. Only after that identification and these
witnesses may the span lower bound and nontriviality give `g=k` and `u=1`.
A different knot with the same Seifert matrix does not discharge this obligation.

## Problem20 and every problem30 pictured occurrence

`KP-E020` asks for linking numbers of the four illustrated Hopf, King Solomon,
Whitehead and Borromean links. `KP-E030` asks for three-coloring decisions for the
four links of question20 and its pictured diagrams; the existing description has
six pictured occurrences, four above and two below. Keep **every occurrence** and
the reference to all four earlier links. It remains unresolved whether the six
include the earlier four or are six additional examples: do not choose a total of
six or ten distinct diagrams.

For each occurrence obtain the exact signed crossing/component/arc data, the
correspondence to its source picture and any named link, every coloring equation,
and the generated-subgroup certificate where required. The page6 continuation
requires Whitehead nonsplitting from its actual three-coloring count; linking
number0 or a guessed drawing is not a substitute. Preserve its superscript
footnote marker after “number”: no corresponding footnote text is currently
specified.

State the course's splitting convention explicitly. Comparing its half-space
representative with a locally flat separating-sphere definition uses the **GT4
coloring split-comparison**: Layer2 bicollar/Brown Schoenflies, comparison3g's
dimension≤3 relative Moise/smoothing, and Layer3 supported isotopy extension, with
their actual category/collar hypotheses. This is not a generic unsupported
splitting equivalence.

## Mixed-cycle labels and indexed doubling

At `KM-P177-B009/B010/B012`, the legible outer labels include `(45)(123)` and
`(35)(124)`. They do not specify the crowded interior labels or the complete
oriented knot diagram. Preserve the mandatory `S₅` example: recover its complete
data, verify all crossing equations and the actual generated subgroup. Neither
invented intermediate labels nor a different labeled diagram settles the source
example.

At `KM-P106-B004–B007`, the construction starts with consistent3-cycle labels,
uses two transpositions on doubled strands and corrects bottom mismatches by
twists. Pin the permutation multiplication order, every local label equation,
finite twist correction, and transitivity/generation comparison for the **actual
indexed source pattern**. The printed claim uses a connected sum of `k`
`(2,5)`-torus knots and the index `S_(3+2k)`; retain that index and all family/bridge
conclusions as source obligations until the exact pattern is checked. A generic
3-cycle factorization or generic colorability result does not supply that input.

## Remaining input holds and resolution criteria

| Required input | What would resolve its hold |
| --- | --- |
| Page76 repeated oriented band/closure family, marked crossing and `2k` basis correspondence | An intrinsic signed band/diagram table or a defining source giving every attaching/crossing/orientation choice and the basis map; then actual matrix, surface and unknotting comparisons. |
| Problem20/30 pictured data and occurrence relationship | Exact signed crossing/component codes with picture correspondences, and clarification of whether the six pictures include or augment the four earlier links; retain every occurrence meanwhile. |
| Problem30 missing footnote and splitting convention | The footnote's actual text, or explicit source qualification that it remains unavailable, and the precise splitting convention/category needed for the stated comparison. |
| Page177 mixed `S₅` example | Complete interior labels and oriented crossing data, with crossing and generated-subgroup certificates. |
| Page106 indexed doubling/bridge pattern | An actual indexed diagram/construction with multiplication order, twist corrections, source-index comparison and the generation/bridge proof. |

These holds retain the full original programme. The note supplies explicit
algebraic inputs and source locators, not the missing geometry, source proof,
native implementation or completed theorem. Operational recovery records may
exist elsewhere; no private file is a prerequisite for understanding this note.
