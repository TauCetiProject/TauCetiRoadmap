<a id="perko-braid-source"></a>
## Page206: literal braid signs and the mirror calculation

The main source `ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`,
physical page206, gives the first word
`σ₂⁻² σ₁⁻³ σ₂⁻¹ σ₁ σ₂⁻¹ σ₁⁻²`.
Its displayed reflection calculation reads

```text
α = σ₂⁻² σ₁³ σ₂ σ₁⁻¹ σ₂ σ₁⁻²
  = σ₂² σ₁³ σ₂ σ₁⁻¹ σ₂ σ₁⁻¹ (σ₂ σ₂⁻¹) σ₁
  = σ₂² σ₁³ σ₂ σ₁⁻¹ σ₁⁻¹ (σ₁ σ₂ σ₁) σ₂⁻¹ σ₁
  = σ₂² σ₁³ σ₂² σ₁ σ₂⁻¹ σ₁.
```

The two consecutive `σ₁⁻¹` factors in the third line are an uncertain
reading; do not use that line as a relation certificate. The first alpha
line's two negative outer exponents are visible, with no clear overwritten
correction. Its exponent sum is0, whereas sign-negation of the initial
word has sum8; therefore the displayed chain cannot be an equality as
written. The last word is also printed beside the other knot diagram,
introduced as “The word is”; γ is our label, not the source's notation.

[The braid-calculation target](README.md#perko-braid-calculation) gives the
correct sign-negated word and a direct valid Artin-relation calculation.
The finite planar codes, marked-cut reading order and pictured-slide
comparisons on pp203–206 remain required geometric targets. The source's
“Perko pair” terminology and later chirality assertion are not validated
by the word equality. All literal inputs and uncertainties remain distinct
from the corrected mathematical statement.

<a id="braid29-source"></a>
## Exercise29: five strands and the two proposed6₃ answers

Problem29 on physical page5 of *Knot Theory – problems.pdf*
(`06c19def0f01d6e74a1ee99bd448bd3731e101377deddb5aa573943898afb3b1`)
explicitly asks for a five-string braid in(a), identifies the closure of
`(σ₁⁻¹σ₂σ₃⁻¹)²σ₃³` in(b), and requests a braid for6₃ in(c).
The solution on main-source physical page208
(`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`)
has five drawn strands and uses σ₄; it contains no visible four-strand
prose. The older Markdown's four-strand description was a transcription
error, not a source assertion.

The two written29(c) words read
`σ₁⁻²σ₂⁻²σ₁⁻¹σ₂⁻¹` and `σ₂⁻²σ₁σ₂⁻¹σ₁²`, followed by
“are both correct.” The first word's σ₂ exponent is negative; the old
Markdown dropped this minus. The second word's middle σ₁ has no written
exponent. Preserve these literal readings, separately from the invalid
answer claim. The first closure has determinant5 and the second13, so
both cannot be6₃. The [complete exercise target](README.md#braid-exercise-29)
constructs the native-word and geometric comparisons and specifies the
exact Jones polynomials; a knot-table label or invariant agreement alone
is not a geometric certificate. Part(b)'s visible answer is6₁, without
a handedness convention. Its actual closure has the reciprocal of the
Atlas representative's Jones polynomial. The target therefore specifies
the mirror comparison, retaining the source label without identifying
the two chiral representatives.

<a id="problem67-surface-source"></a>
## Problem 67 and the main four-band example

Physical problem page 11 has source identity
`06c19def0f01d6e74a1ee99bd448bd3731e101377deddb5aa573943898afb3b1`;
main pp. 182–187 have source identity
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`.
The [four-band target](README.md#gt4-problem67-seifert) retains their literal
matrix, including its bottom-right entry −2. Problem 67 and main p. 183 match
in curve labels/order, rightward lower-arc arrows and visible attachment,
wavy-band and crossover positions. This line-art comparison does not prove
ambient isotopy or supply a complete signed ribbon presentation. Neither
figure gives a notation key for the wavy marks, exact twist counts/signs,
a formal cyclic attaching order, or consistent signed ribbon crossings.
Recover and compare the actual finite embedded data rather than fitting a
surface to the printed matrix.

Neither figure marks a positive normal. Main p. 185 chooses the front of the
disc as top, takes x* just above F, and defines V_ij=lk(x_i,x_j*). Its
three-curve illustration is not explicitly the four-band drawing. Compare
this general convention with the marked four-band model before using it;
Problem 67 alone does not choose that side. Main p. 186 gives V₂₂=−5, the
full matrix and the overcrossing-only linking rule, whose signed convention
must be pinned by the geometric linking comparison.

The main p. 182 label literally reads “our 52 crossing knot”; the position of
2 does not establish whether 5₂ is intended. It does not certify a table
identification. Its polynomial line has cubic coefficient +272, whereas
the determinant of its displayed matrix has coefficient −272. Preserve that
literal reading separately from the corrected algebraic computation; the
positive-cubic expression is not symmetric after the stated normalization.
The matrix arithmetic and conditional knot conclusions do not resolve these
source labels or complete the required geometric comparison.


<a id="skein-source-conventions"></a>
## Skein signs and the source's complex substitutions

The main *Knot Theory* source
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`, physical p192,
writes A₊−A₋=(1−t)A₀ “up to units” and ∇₊−∇₋=−z∇₀. Its pictured Alexander triple is
labelled L₋,L₊,L₀ from left to right. These signs are literal source data, rather than a
reason to change the roadmap's native positive-crossing convention. The integral Conway
contract supplies the marked crossing/Seifert and variable conversions, including the
compatible raw determinant equation.

On p199 the first Jones line has a visible plus between its first two terms. After
“s=1/t,” a mark in the next line is overwritten and remains unresolved. Retain those
readings separately from the native Jones skein identity; variable inversion alone does
not reconcile a plus and a minus. The same page's HOMFLY relation is lP₊+l⁻¹P₋+mP₀=0,
and its unlink factor is μ=−m⁻¹(l+l⁻¹), with value μ^(q−1) for q≥1 circles.

P200 writes the Jones substitution (l,m)=(it⁻¹,i(t¹ᐟ²−t⁻¹ᐟ²)) and the Conway
substitution ∇(z)=P(i,iz). Both second arguments have positive i as written. For a fixed
native crossing and square-root convention these yield the component phase (−1)^(μ−1)
relative to the roadmap's standard invariants. The ordinary-variable Conway sign is
reversed, and the Jones phase agrees with changing the half-variable branch. The
two-component unlink and positive Hopf link distinguish these conventions; knot examples
alone do not. Construct the explicit local drawing adapter before assigning the source's
pictured link to a native oriented code. The contract preserves the source formulas
while pinning the modern coefficient maps and their integral descent.


<a id="mirror-blind-source"></a>
## Page198: mirror-blind HOMFLY and a nonzero signature

The main *Knot Theory* source
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`, physical p198, gives
the9₄₂ mirror pair with equal HOMFLY and says a signature proves chirality. A fresh
verified-Luna reading confirms ρ=(−2l⁻²−3−2l²)+(l⁻²+4+l²)m²−m⁴: the middle glyph is4,
not the older transcript's+l. The figure-eight line is ρ=−l⁻²−1−l²+m² and its label
is4₁. The source contains no extra9₄₂ picture fixing a handed representative. The
roadmap pins one by a native braid and retains the Atlas-to-native mirror/slot
dictionary as a proof target.

The direct matrix uses Collins's corrected2013 paper, Definition2.10, Lemma3.1 and
§§3.1–3.4. Its positive-push-second convention and local entry diagrams were read only
by Luna. The six intervals are from the original declared word, without rebraiding.
Every basis and push-off comparison remains required, including the signed zero-entry
cases. The source's distant-column test in step4 must use the absolute integer column
difference, covering both column orders.

An exploratory Spherogram2.4.1 call first rebraids this link and returns a
different6-by-6 matrix. That software result and a trefoil calibration are not the
geometric certificate for the literal matrix in the roadmap. The stated matrix instead
follows the direct marked Collins cycles, with an exact rational congruence. Its
canonical surface has genus3; that count is not an assertion that the knot's minimum
genus is3.

<a id="marked-crossing-changes"></a>
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

<a id="page22-recorded-cofactor"></a>
### Page22: the recorded cofactor

The first eight recorded rows determine the following cofactor after
row9 and column9 are deleted, apart from the overwritten row8 column7.
Retain that entry as z, with no assertion about its literal glyph:

```text
M(t,z) =
[  0,   0,   0,  -1,    t,  0,    0,    0 ]
[ -1, 1-t,   0,   0,    0,  0,    0,    0 ]
[1-t,   0,   t,  -1,    0,  0,    0,    0 ]
[  t,  -1,   0, 1-t,    0,  0,    0,    0 ]
[  0,   t,  -1,   0,    0,  0,  1-t,    0 ]
[  0,   0, 1-t,   0,    0,  t,   -1,    0 ]
[  0,   0,   0,   0,  1-t,  0,   -1,    t ]
[  0,   0,   0,   0,   -1,  t,    z,  1-t ]
```

Prove the exact polynomial identity
`det M(t,z)=Q(t)+z(−2t⁴+3t⁵−2t⁶)`, naturally over every commutative
coefficient ring. In particular `det M(−1,z)=45−7z`.
The full recorded eighth row has ninth entry0, so its row sum is z.
A meridionally specialized Fox relation row has sum0: the fundamental Fox
identity gives `(t−1)Σ_j a_j=0`, and ℤ[t,t⁻¹] is a domain. Consequently
any actual Alexander row matching the other recorded entries forces z=0.
This deduction uses the row relation, not the printed Q as an interpolation
condition. No entry of the unreadable ninth row is needed to calculate this
particular cofactor.

All these conclusions are conditional on the remaining recorded entries
matching the actual arc relations. The current monochrome diagram does not
yield a reliable complete crossing code; neither this algebraic consistency
nor the printed Q identifies the changed knot. Recover and compare the
actual presentation and crossing correspondence required above. The literal
source entries and their uncertainty remain distinct from the conditional
row-sum deduction. [MarkedAlexanderMinorTargets.lean](MarkedAlexanderMinorTargets.lean)
states this matrix calculation on native matrix and coefficient carriers.

<a id="hard-unknot-source"></a>
## Problem17: crossing increase and the projection carrier

Problem17 on physical p3 of *Knot Theory – problems.pdf*, source
`06c19def0f01d6e74a1ee99bd448bd3731e101377deddb5aa573943898afb3b1`, asks for an unknot
movie and says every reduction must exceed7 crossings. Main *Knot Theory.pdf*, source
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`, physical pp206–207,
shows sketches and argues that no decreasing typeI/II or typeIII move is initially
available. Its generic move panels do not enumerate supports of the pictured diagram.

A verified-Luna reading finds seven apparent intersection sites in the problem drawing
but cannot certify a full signed crossing code, all over/under assignments,
rotation/outer-face data or crossing correspondence with the main-note sketches. Recover
those finite inputs and replay the unknot movie before using the geometric or
crossing-count conclusions. Preserve the literal7 claim as a verification target; do not
substitute another hard-unknot diagram or read a complete move graph from the generic
panels.

The exercise does not explicitly distinguish compact-plane moves from moves on S²
through infinity. Their peak barriers may differ. The finite graph contract keeps both
carriers, retains spherical region placement when forgetting the marked infinity point,
and requires the actual source-convention comparison. A planar obstruction alone proves
no spherical obstruction. Local absence of decreasing/typeIII moves forces the first
genuine move to increase; a general absence of nonincreasing paths is weaker than a
bounded-peak certificate.

<a id="jones-table109-source"></a>
## The four Jones examples on physical page109

The main source is *Knot Theory.pdf*,
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`. A focused
verified-Luna reading confirms the four table labels3₁,4₁,9₄₁ and9₄₂, with
“Non-Alternating” aligned to9₄₂. The9₄₁ formula wraps onto its own second line; no arrow
transfers it to another row. The literal entries in the ordinary knot variable are

```text
3₁: −t⁻⁴+t⁻³+t⁻¹;
4₁: t⁻²−t⁻¹+1−t+t²;
9₄₁: −t⁻¹³+t⁻¹²−t⁻¹¹+t⁻¹⁰−t⁻⁹+t⁻⁸−t⁻⁷+t⁻⁶+t⁻⁴;
9₄₂: −t⁻⁵+2t⁻⁴−2t⁻³+3t⁻²−3t⁻¹+3+c t+t².
```

Only c is materially overwritten; it may read−2 but remains unresolved as a source
glyph. The fourth row's extreme coefficients and endpoints−5,2 are clear. Normalization
conditionally forcing c=−2 is not a visual reading and does not correct the rest of that
row. The page has no drawn9₄₁ or9₄₂ diagram fixing another representative.

The complete table target compares every row with actual native knot models and their
marked code dictionaries. The9₄₁ row has absolute value9 at−1 instead of49 for the
declared native model. The9₄₂ row has span7 for every c, while the independently
constructed model has span6. Neither mismatch is repaired by mirroring, reversing the
knot orientation or a monomial-unit convention. The third expression's equality with the
Jones value of a signed two-strand nine-letter closure is a separate computation, not
grounds to replace the literal9₄₁ label by9₁. The earlier source198 mirror-blind example
and this erroneous table retain distinct source obligations.

<a id="homfly-constructions-source"></a>
## The four HOMFLY constructions, physical pp.86–88

The main source is *Knot Theory.pdf*, SHA256
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`, reproducing Freyd,
Yetter, Hoste, Lickorish, Millett and Ocneanu, *A new polynomial invariant of knots and
links*, Bull. Amer. Math. Soc.12(2)(1985),239–246, DOI10.1090/S0273-0979-1985-15361-3.
The [primary PDF](https://www.math.ucdavis.edu/~egorskiy/MAT280-s18/HOMFLY.pdf) has
SHA256 `bf76c6c1bda967e5f0cf46ef7d498d916b281a8fd59fe8fac88f68c21d26a06d`. A fresh
verified-Luna comparison of primary printed 241 and course 86 confirms the scalar
generator is the empty word `[ ]₁`, and S4 is `[u a a v]_n→−x⁻¹y[uv]_n−x⁻¹z[u a v]_n`:
two a's on the left, zero and one in the two right-hand words. Earlier `[1]₁` and
triple-a transcriptions were errors in our transcript, not printed source errors. The
final focused S4 reread supersedes the reader's initial mistaken second-right-hand
transcription.

Printed242 states the separate full-word cyclicity lemma `T([uv]_k)=T([vu]_k)`; the old
course 87 self-equality is a transcription failure. The full FY specification
distinguishes typed module relations from collected-form normalization, owns the 21
parametric rule-pair families, and does not assume that each intermediate form has only
one redex. Hoste and Lickorish–Millett retain their distinct first-under diagram
inductions and all pointing/order independence arguments. Crossing-nonincreasing
simplifications within their special induction cases do not supply a global such path
between arbitrary isotopic diagrams. Ocneanu's algebraic trace remains independent of
the geometric invariant; the source 88 analytic corrections have their existing Hecke
owner.

<a id="flyping-source"></a>
## The spherical flyping theorem and Figure6.23

*Knot Theory.pdf*, SHA256
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`, physical pp98–99,
gives the alternating connected-sum argument, a local flype picture, and Exercise6.13
asking for a flype sequence between the two projections in Figure6.23. Verified Luna's
focused reread confirms that small crossing gaps encode over/under: absence of signs or
arrows does not mean the diagrams are bare shadows. Its earlier contrary claim is
superseded. Both endpoints have one component, but that reading does not certify their
complete crossing counts, Gauss/PD words, cyclic slot orders or the local
supports/intermediate diagrams of a solution. The complete native endpoint recovery and
supported flype movie remain required targets, rather than an inferred standard-knot
replacement.

For the theorem use [Menasco–Thistlethwaite, *The Tait flyping conjecture*, Bull.
AMS25(1991),403–412](https://www.researchgate.net/publication/240487410_The_Tait_flyping_conjecture),
DOI10.1090/S0273-0979-1991-16083-0, Theorem1, and [*The classification of alternating
links*, Annals138(1993),113–171](https://annals.math.princeton.edu/1993/138-1/p03),
DOI10.2307/2946636. The original prime theorem factors a specified oriented pair
homeomorphism up to pair isotopy; the source's composite-knot endpoint extension needs
the separate factor-attachment bridge. The announcement sketches its rigid-vertex A/B/C
induction; full pattern recovery, C attaching hypotheses and the exhaustive alternative
are proof obligations, not supplied by the announcement's outline.

[Kindred, *A geometric proof of the flyping theorem*, arXiv2008.06490v3,
§§2.1–2.2](https://arxiv.org/html/2008.06490v3#S2.SS2) supplies a precise independent
convention comparison: the entire-flype operation reverses both sphere orientation and
crossing information. It preserves ambient S³ orientation and differs from a bare
mirror. Its geometric endpoint proof is not substituted for the original
prescribed-pair-map theorem. Spherical constant-crossing flype movies do not imply
general plane/outerface or nonalternating crossing-nonincreasing movies.

<a id="small-prime-seifert-inputs"></a>
## Problem49: the fourteen standard PD inputs

*Knot Theory.pdf*, SHA256
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`, physical p117, asks
for surfaces, their genera and minimum-genus comparisons for every prime knot with fewer
than eight crossings. Its handwritten assignment annotation selects7₁,7₃,7₅,7₇; that
subset does not replace the full original exercise. The following literal Knot Atlas
standard PD lists fix the chosen representative per conventional mirror-forgotten row.
Label each tuple in the displayed order, use its four entries in cyclic order with the
first/third pair under, orient the arc labels cyclically1,…,2n, and retain every global
mirror adapter to a different named-model convention. All labels occur exactly twice.
The native matching pairs their two half-edge occurrences, and the over-pair bit is
true.

| Row/source | Ordered PD crossing tuples |
| --- | --- |
| [3_1](https://katlas.org/wiki/3_1) | `(1,4,2,5) (3,6,4,1) (5,2,6,3)` |
| [4_1](https://katlas.org/wiki/4_1) | `(4,2,5,1) (8,6,1,5) (6,3,7,4) (2,7,3,8)` |
| [5_1](https://katlas.org/wiki/5_1) | `(1,6,2,7) (3,8,4,9) (5,10,6,1) (7,2,8,3) (9,4,10,5)` |
| [5_2](https://katlas.org/wiki/5_2) | `(1,4,2,5) (3,8,4,9) (5,10,6,1) (9,6,10,7) (7,2,8,3)` |
| [6_1](https://katlas.org/wiki/6_1) | `(1,4,2,5) (7,10,8,11) (3,9,4,8) (9,3,10,2) (5,12,6,1) (11,6,12,7)` |
| [6_2](https://katlas.org/wiki/6_2) | `(1,4,2,5) (5,10,6,11) (3,9,4,8) (9,3,10,2) (7,12,8,1) (11,6,12,7)` |
| [6_3](https://katlas.org/wiki/6_3) | `(4,2,5,1) (8,4,9,3) (12,9,1,10) (10,5,11,6) (6,11,7,12) (2,8,3,7)` |
| [7_1](https://katlas.org/wiki/7_1) | `(1,8,2,9) (3,10,4,11) (5,12,6,13) (7,14,8,1) (9,2,10,3) (11,4,12,5) (13,6,14,7)` |
| [7_2](https://katlas.org/wiki/7_2) | `(1,4,2,5) (3,10,4,11) (5,14,6,1) (7,12,8,13) (11,8,12,9) (13,6,14,7) (9,2,10,3)` |
| [7_3](https://katlas.org/wiki/7_3) | `(6,2,7,1) (10,4,11,3) (14,8,1,7) (8,14,9,13) (12,6,13,5) (2,10,3,9) (4,12,5,11)` |
| [7_4](https://katlas.org/wiki/7_4) | `(6,2,7,1) (12,6,13,5) (14,8,1,7) (8,14,9,13) (2,12,3,11) (10,4,11,3) (4,10,5,9)` |
| [7_5](https://katlas.org/wiki/7_5) | `(1,4,2,5) (3,10,4,11) (5,12,6,13) (7,14,8,1) (13,6,14,7) (11,8,12,9) (9,2,10,3)` |
| [7_6](https://katlas.org/wiki/7_6) | `(1,4,2,5) (3,8,4,9) (5,12,6,13) (9,1,10,14) (13,11,14,10) (11,6,12,7) (7,2,8,3)` |
| [7_7](https://katlas.org/wiki/7_7) | `(1,4,2,5) (5,10,6,11) (3,9,4,8) (9,3,10,2) (11,14,12,1) (7,13,8,12) (13,7,14,6)` |

Use these standard diagrams for the Seifert-surface exercise. Minimum braid words are
different input presentations; their canonical band-surface genera need not equal the
table genus. The5₂ minimum braid has six crossings on three strands, giving genus2,
while its standard PD has five crossings and four Seifert circles, giving genus1. All
fourteen standard PDs have connected planar realizations, and oriented smoothing gives
the stated circle counts. Independent dart-permutation and signed Wirtinger/Fox
calculations reproduce the circle counts and the full normalized Alexander/Conway data.
Those finite calculations do not implement the embedded disc/band, H₁-basis, push-off or
named-knot realization comparisons, which remain required roadmap targets. The
all-prime-under8 completeness corollary uses the separate late small-knot classification
after these early row results; fourteen is not a count of mirror-sensitive oriented
types.

<a id="signature-function-inputs"></a>
## Problem78: finite exceptional set and the full-circle average

*Knot Theory.pdf*, SHA256
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`, physical p122
Problem78, asks for nonsingularity of `(1−ω)V+(1−ω⁻¹)Vᵀ` away from Alexander roots and
deduces piecewise constancy. Its first statement needs `ω≠1`: a positive-sized H(1) is
zero although normalized Δ(1)=1. The empty determinant is1. Its finite-jump wording must
allow equal side values and an isolated raw exceptional value. The signature function is
constant on the complementary open arcs of the finite candidate set `{1}∪{unit Alexander
roots}`; it need not jump at every candidate.

The determinant and raw S-equivalence results already exist in native
`TauCeti.KnotTheory.TristramLevine.Alexander` and `.SEquivalence`. The reusable
additional targets are nonsingular Hermitian inertia stability, angular side values and
their integer mean, presentation/geometric descent, the slice-disk integral metabolizer,
and the separate genus-h surface/intersection-form comparison. [Conway
§§2.1–2.4](https://arxiv.org/html/1903.04477v1#S2) fixes the raw/averaged distinction.
The knot specialization of [Powell §§3–5](https://arxiv.org/html/1605.06833v3#S3) fixes
the surface-exterior, zero-surgery signature defect and twisted dimension proof.
Rational-function matrices are evaluated only away from denominators and determinant
roots; angular sides supply exceptional values, without claiming a field homomorphism
ℚ(t)→ℂ at algebraic t.

The exact algebraic regression is `A=[[0,−1],[1,1]]`, `V=[[0₂,A],[Aᵀ−I₂,I₂]]`. It has
standard symplectic skew part, a primitive top-half Seifert-isotropic summand and
normalized Alexander polynomial `(t−1+t⁻¹)²`. At `(1+i√3)/2` its off-diagonal Hermitian
block `A−ωI₂` has rank1 and bottom block is I₂, giving inertia(2,1,1) by its Schur
complement. Both nearby nonsingular signatures are0, but the raw root value is+1. This
is a matrix test, not an identified slice knot. For the native trefoil, at that root H
has determinant0 and trace−2, so raw signature−1; its side values0,−2 also average−1.
That coincidence at a trefoil root is not a general root-value definition. Nullity at1
belongs to a chosen matrix size, not a presentation-invariant knot nullity.

Mathlib's finite Hermitian spectrum and native Hermitian signature are the carriers. A
bounded local/API search and open Mathlib PR searches for Hermitian eigenvalues and
eigenvalue continuity found no matching inertia-continuity theorem; PR42931 concerns
simultaneous diagonalization/generalized eigenvalues. The producer develops the missing
results using those carriers. This does not move work to Mathlib or require waiting for
it.

<a id="two-strand-alexander-inputs"></a>
## Problems79 and the p155 two-strand family

*Knot Theory.pdf*, SHA256
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`, physical p122
Problem79, gives the cinquefoil relator `xyxyxy⁻¹x⁻¹y⁻¹x⁻¹y⁻¹`. It is the equality
xyxyx=yxyxy; its signed Fox row is (F₅,−F₅), F₅=1−t+t²−t³+t⁴. The maps a=xyxyx,b=xy and
x=b⁻²a,y=a⁻¹b³ identify the presentation with a²=b⁵, preserving the total-linking
homomorphism. Actual diagram, basepoint and meridian comparisons remain required.

Physical p155 draws the repeated two-strand twisting pattern and a schematic cyclic
Alexander matrix, then the explicit tridiagonal cofactor and the even/odd rational
expressions. The banded cofactor has diagonal1−t, superdiagonalt, subdiagonal−1. Its
empty n1 determinant is1; n0 is the unlink and has no negative-sized minor. Coincident
modular indices are added at n1/2. The exact identity (1+t)F_n=1−(−t)^n includes t=−1,
where F_n(−1)=n; no division at that parameter is permitted. The full source-to-native
upward-strand/slot/orientation dictionary remains a geometric producer, rather than an
inference from the schematic drawing.

The existing companion's normalized expression s^(1−n)F_n(s²) uses the negative Conway
skein: its coherent positive Hopf value is−z. The definitive standard Conway theory
instead has Δ₊−Δ₋=zΔ₀, so the actual positive-link invariant is
C_n=(−1)^(n−1)s^(1−n)F_n(s²), with C₂=+z and C_(n+2)=zC_(n+1)+C_n. The old expression
remains an explicit opposite-skein branch, differing by (−1)^(μ−1). Both current root
and public standard Conway definitions use the plus skein; the old two-strand
paragraph/doc was inconsistent with them. The superdiagonal Seifert matrix
V=−I+superdiagonal1 gives det(s⁻¹V−sVᵀ) with exactly the standard sign.

The native unreduced Burau corner minor is−tF_n for positive powers, and t(−t)^(−m)F_m
for σ₁^(−m), m>0. These are Laurent-unit multiples, not literal F_n. The native PD
AlexanderModule and coker of the transpose of the Fox row matrix are unreduced,
isomorphic to Λ⊕Λ/(F_n). Actual H₁ of the infinite cyclic cover is the augmentation
kernel Λ/(F_n). For even n use the total-linking homomorphism π→ℤ sending every positive
meridian to1; abelianization itself is ℤ². Knot-only commutator comparisons do not apply
to that link branch. Individual component reversal changes the coefficient system:
coherent L₄ has Conway z³+2z, while the component-reversed annular model has−2z.

The finite signed-word, matrix determinant, Burau and Seifert computations independently
agree for n through12 (and signed Fox/Conway/mirror indices−10,…,12). Finite coloring
counts over moduli1,…,12 match m*gcd(m,|n|). These checks do not supply the ambient
isotopies, group/presentation maps, geometric surface/basis or infinite-cyclic-chain
comparisons required by the roadmap. Generic Fox and PD/Fitting theory is consumed from
the existing signed-Fox producer; no matching generic Fox-calculus implementation was
found in the bounded native/Mathlib/open-PR search.

<a id="small-knot-group-inputs"></a>
## Problem80: prime two-generator presentations and the composite correction

*Knot Theory.pdf*, SHA256
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`, physical p122
Problem80, literally asks for two-generator presentations and Alexander polynomials of
each knot with fewer than eight crossings. The prime-under8 rows all have such
presentations. The unrestricted wording is false: a six-crossing trefoil#trefoil diagram
has a group requiring3 ordinary abstract generators. The public contract therefore
includes this explicit obstruction, the unknot and correct larger composite
presentations, preserving the original request rather than silently restricting it to
primes.

The fourteen standard native PD inputs and their prior independent Fox polynomials
remain those of the4.4.6 dictionary. Primary Knot Atlas Conway strings
are3,22,5,32,42,312,2112,7,52,43,313,322,2212,21112 in that order. The explicit
right-nested positive continued fraction gives raw
denominators1,2,1,2,2,3,5,1,2,3,4,5,8,8, with
numerators3,5,5,7,9,11,13,7,11,13,15,17,19,21. In particular [21112]=21/8. For the
marked Schubert word replace an even q₀ by odd q*=q₀+p, allowing p<q*<2p. The resulting
odd denominators are1,7,1,9,11,3,5,1,13,3,19,5,27,29. This arithmetic and matching
polynomials do not prove any native-PD/rational-diagram equivalence, its mirror signs or
meridional paths; all are explicit required targets.

For ε_i=(−1)^floor(iq*/p), W=b^ε₁a^ε₂⋯a^ε_(p−1) and R=aWb⁻¹W⁻¹, the exact specialized
Fox row is(P,−P), P=Σ_(i=0)^(p−1)(−1)^i t^s_i. Writing e=Σ ε_i, the normalized symmetric
polynomial is t^(−e/2)P. The exact h=e/2 values are1,0,2,−1,0,1,0,3,−1,2,−1,2,−1,0. All
fourteen reproduce the already independently computed native-PD polynomial. The actual
cover module is Λ/(P); native PD AlexanderModule is the unreduced Λ⊕Λ/(P), with its
shifted Fitting indices. No generic cyclicity claim for all knot modules is made.

[Hoste, Theorem1 and §4](https://arxiv.org/html/1907.03812#S2) gives the walk/Fox proof
with reversed parameter names and a strict smaller-numerator range. If q*>p, fold to
q′=2p−q*, negating ε and replacing P(t) by P(t⁻¹)=t^(−e)P(t). His ε₀=1 gives raw tP in
range and t^(1−e)P after folding. These are explicit Laurent-unit/index/marked-diagram
adapters. His general two-variable link formulas are not additional prerequisites for
this knot-group unit.

The order18 quotient uses actual native SemidirectProduct, with translations F₃² and
parityC₂ acting by inversion. The t,a,b images are three reflections with translation
parts0,e₁,e₂; at and bt produce basis translations. All18 elements have explicit
preimage words. Pairs of translations miss C₂ and may generate order9; pairs with a
reflection generate at most6. This proves failure of two ordinary generators, rather
than only of two meridians. T#F retains its separate amalgamated three-generator
presentation; it is not assigned the same quotient without proof. Whole4.10
classification is not a supplier of the early marked presentation, and only the final
all-input exhaustion consumes7.5's existing complete bounded diagram certificates.


<a id="trefoil-mirror-group-inputs"></a>
## Page123: prime groups and the trefoil mirror

*Knot Theory.pdf*, source SHA-256
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`,
physical p123 says “all prime knots have different knot groups” without
stating a quotient convention. Its overwritten connected-sum corollary
remains uncertain in the Luna transcript; this group example does not
resolve that glyph. The [marked trefoil comparison](README.md#gt4-trefoil-mirror-groups)
corrects the mirror-sensitive reading using two actual prime knots with
isomorphic unmarked groups and unequal Jones polynomials. After allowing
ambient reflection and knot reversal, the separate
[prime-exterior theorem](README.md#gt8-prime-knot-group-rigidity) supplies
the precise recognition statement. Neither assertion identifies oriented
peripheral markings from an arbitrary abstract group isomorphism.

The chosen T₊ is the positive two-strand braid closure, with native Jones
polynomial t+t³−t⁴. Native Laurent exponents are in t^(1/2), so its code
value is T2+T6−T8. Its reflection has the inverse-variable polynomial.
The presentation automorphism in TrefoilMirrorTargets sends the two
positive meridian generators to their inverses; it is not inversion of
every group element. The geometric reflection sends (μ₊,λ₊) to
(μ₋⁻¹,λ₋). The words zμ⁻⁶ and z⁻¹μ⁶ require the specified zero-linking
boundary push-offs, not just their zero exponent sums.

[Friedl, *Topology*, Lemma7.3](https://friedl.app.uni-regensburg.de/papers/2024_knot-theory-final.pdf)
records these meridian/longitude sign laws. Native PD/Jones mirror,
whole-orientation reversal and trefoil chirality calculations are existing
inputs; their realized-knot and peripheral comparisons remain geometric
roadmap targets. The existing native-presentation companion is unchanged.


<a id="shrinking-local-knot-inputs"></a>
## Page140: continuous families and knot equivalence

*Knot Theory.pdf*, source SHA-256
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`,
physical p140 warns that a homotopy which remains a knot at every time
can tighten a trefoil to the unknot, and then turns to polygonal knots.
The handwritten adjective in its alternative differentiability condition
is uncertain. The [explicit local family](README.md#gt4-shrinking-local-knot)
pins the distinction: f₀ is a smooth unknot, every f_t for t>0 is a smooth
trefoil, and the parametrized family is jointly C⁰-continuous. No time
slice is collapsed or allowed to self-intersect.

The long-arc rescaling t·a(s/t) matches the fixed straight collars and
satisfies the uniform displacement bound2t. At s=tu₀ its derivative is
a′(u₀), giving a fixed positive C¹ gap from the limiting straight arc.
Thus this C⁰ path is not a continuous path in the C∞ embedding topology
used by3.3’s extension theorem. The local formula does not by itself
construct the long trefoil, the ambient straightening or the closed-circle
family; those are explicit geometric outputs. The existing
ShrinkingKnotTargets companion states the Euclidean/calculus targets with
two honest admissions and remains unchanged.

[Bode, *Knotted fields and real algebraic links*, §2.1,
Definitions2.2–2.4](https://research-information.bris.ac.uk/ws/portalfiles/portal/172921010/Final_Copy_2018_09_25_Bode_B_PhD.pdf)
distinguishes continuous knot isotopy from smooth isotopy and ambient
isotopy. The roadmap retains its geometric ambient equivalence and the
actual hypotheses of its smooth and C∞-continuous extension theorems.


<a id="five-two-coloring-inputs"></a>
## Pages147–151: the full5₂ coloring calculation and Smith theorem

*Knot Theory.pdf*, source SHA-256
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`,
physical pp147–148 gives the literal five-row matrix reproduced in the
[complete worked contract](README.md#gt4-five-two-coloring). The displayed
rows, in source x₁,…,x₅ order, have over/under triples
`(1;2,3),(3;1,4),(4;1,5),(5;2,4),(2;3,5)`. These underarc pairs are
unordered and do not supply the source drawing's full cyclic crossing
slots, orientations or plane placement. Their realized comparison is an
explicit target, not certified by the matrix or a determinant alone.

For the fixed Atlas5₂ PD input already used by the fourteen-surface
library, arc sets `{2,3},{6,7},{8,9},{4,5},{1,10}` and crossing rows
`(5,2,1,3,4)` recover this exact integer matrix. This is an independently
checked finite equation dictionary to an existing comparison model. It
retains the separate geometric task of identifying the literal drawing,
including any mirror/orientation adapter.

The P,Q matrices in the contract give PAQ=diag(1,1,1,7,0), with detP=−1
and detQ=1; they are supplied certificates rather than a claim that the
source printed them. Every signed4×4 cofactor is−7. The all-ring solution
is `(c,c+a,c−a,c−2a,c−4a)`, with7a=0 and unique c=x₁,a=x₂−x₁. The
native companion already proves the finite Smith identity and both unit
determinants; its general all-ring kernel formula is one honest theorem
admission. The companion stays unchanged.

P148's normalization x₂=1,x₁=α is an affine translation of colors; it
does not divide by a nonzero color. In the fixed matrix order the
remaining coordinates are `2α−1,3α−2,5α−4`, with `7(α−1)=0`.
The pictured placement of the source's arc labels still requires the
marked diagram comparison. For prime p, nonconstant solutions exist
exactly at p=7. Composite moduli instead use gcd(m,7); modulus1 has one
full coloring and no nonconstant coloring.

Pp149–151 supply the marked-sector row dependency, arbitrary deleted
row/column comparisons and diagram invariance. Those are already owned
by4.7's general checkerboard/cofactor producer. P151's Smith theorem is
rectangular and permits zero diagonal entries: the full5×5 matrix is
singular, so native nonsingular-square Smith existence alone cannot be
applied to it. The independent integer-presentation prefix of4.7.1 owns
the rectangular/singular adapter, invariant-factor comparisons and
terminating Euclidean algorithm, using the existing PID and matrix APIs.


<a id="reversed-fraction-inputs"></a>
## Pages162–164: coefficient order and the missing outermost zero

*Knot Theory.pdf*, source SHA-256
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`,
physical p162 excludes0 and∞ from a rational-tangle coefficient word;
p163 then permits integer coefficients. P163 explicitly evaluates
cf(a₁,…,a_n) with a_n outermost. Its written canonical-positive rule
uses all a_i>0 and a₁≠1; its negative rule puts the exceptional−1
restriction on a_n. These literal rules are not silently adopted as a
complete normalization of every nonzero rational.

The [continued-fraction contract](README.md#rational-tangle-continued-fractions)
allows an outermost zero: cf([2,0])=1/2, and cf([−2,0])=−1/2.
Strictly positive entries yield values≥1 and omit all positive slopes
below1. For length≥2 the uniqueness restriction is on the innermost
coefficient a₁, with |a₁|≥2; single-entry±1 remain valid. The ordinary
outermost-first native continued fraction uses the reversed list.
Zero has normal word[0]; infinity has the separate empty normal word.
The unrestricted signed word[0,0] also evaluates to∞, so ordinary field
inversion0⁻¹=0 cannot be used at intermediate zero slopes.

P164 also says a rational tangle has at least one knot closure. The
marked endpoint-parity producer proves N is a knot iff p is odd and D
iff q is odd for a primitive pair(p,q), including0 and∞. It does not
extend this conclusion to arbitrary algebraic tangles with extra circles.

P163's cf([2,1,1])=5/3 is correct; its second overwritten example is
unresolved and arithmetically inconsistent as transcribed. P164's two
words [3,2,−4] and [−3,−1,−1,−3] both evaluate to−25/7. Their geometric
tangle identification remains an actual relative-move target. The native
arithmetic companion proves these finite evaluations and consumes
Mathlib's rational termination theorem; the full canonical uniqueness
statement is one honest admission.

[Kauffman–Lambropoulou, *On the classification of rational tangles*,
§§2–4](https://arxiv.org/html/math/0311499#S3) uses the outermost-first
order, allows its outermost coefficient0, and chooses an odd-length
normal form. It explicitly declares crossing types opposite to Conway's.
The roadmap requires both the numeric normalization comparison and the
marked port/height/crossing adapter. The primary's tangle theorem is not
a certificate for a guessed source drawing or an unconverted Atlas word.


<a id="permutation-label-source"></a>
## Page177: all three permutation-labeling examples

*Knot Theory.pdf*, source SHA-256
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`,
physical p177 first gives the trefoil's three transposition labels and
three displayed conjugation equations. It then asks for S₄ labels, with
a crowded diagram whose complete crossing/arc data are not authenticated.
The lower example has the legible outer labels a=(45)(123), b=(35)(124)
and handwritten “5”, but no secure subscript or complete interior labels.
The [full worked specification](README.md#permutation-label-examples)
retains all three literal diagram comparisons.

The legible S₅ pair has a³=(45), b³=(35) and ab=(13425), with products
read right to left. The five-cycle plus a³ proves full generation via
native prime-cycle/swap theory. The cubes alone fix1,2 and generate only
the six-element symmetric subgroup on3,4,5. This clarifies the obscured
parenthetical generation argument without claiming a literal statement
about which intermediate words the source intended.

The same pair satisfies (ab)²a=b(ab)² and the positive Hurwitz action
H⁵(a,b)=(a,b), so it gives a concrete coloring of the native standard
T(2,5) closure once the actual group/diagram maps are supplied. This
independent calibration does not identify the source's handwritten “5”
as5₁ or5₂ or authenticate its pictured crossing relations. The original
interior labels and signed plane code remain required source inputs.

The S₄ trefoil calibration uses4-cycles s=(1234),t=(1243), with
u=sts⁻¹=(1423), sts=tst and s²t=(14). The connected adjacent-swap
criterion gives S₄ generation. The transposition-label bridge obstruction
does not apply to this4-cycle labeling.

The complete class-restricted calculations give9/6,30/24 and140/120
full/generating incoming pairs for the S₃ trefoil, S₄ trefoil and S₅
cinquefoil rows, respectively. Each row has one constant and one generating
conjugation orbit; fixed-first-color fibers have sizes3/2,5/4 and7/6.
These are independent finite calibration targets, not numbers printed on
p177. The existing native generation proof is retained, and the companion
adds proved finite three-/five-crossing and S₄ generation certificates.
Full orbit/count proofs and all realized/literal diagram comparisons
remain required roadmap outputs.


<a id="ten-crossing-presentation-source"></a>
## Pages180–181: seven eliminations and an unreadable relation connector

*Knot Theory.pdf*, SHA-256
`ea4ad43f0788c1949274f3869045793f193a562f1c6f35cb05307c302e7185fa`,
p180 advertises a ten-crossing knot, three initial directed arcs x,y,z,
seven propagation marks1–7 and three residual marks r₁,r₂,r₃. P181 says
this gives three generators with two relations. That is a presentation-size
claim, not a claim that either number is minimal. The
[worked reduction](README.md#ten-crossing-wirtinger-elimination) requires
all arc substitutions, the planar redundancy witness and actual native
group maps.

A fresh Luna-only inspection of p180 on1 November confirms the words
u=yx⁻¹zxy⁻¹, v=yx⁻¹z⁻¹xy⁻¹ and w=xyx⁻¹. The handwritten connector
between (u) and (v) cannot confidently be identified. The earlier
transcription normalized it as multiplication; that interpretation is
not securely literal. This qualification supersedes any earlier assertion
in this note or its finite-conjugacy discussion that the source has a
literal inconsistent r₁. Only the conditional statement is certified:
if the equation is interpreted as uv=w, then v=u⁻¹ and it forces y=1,
incompatible with the positive-meridian homomorphism to ℤ.

The short arc labels yxy⁻¹, yzy⁻¹, z⁻¹yz and yx⁻¹zxy⁻¹ are legible.
Two longer lower labels are tentative. The page does not give formulas
for r₂ or r₃. Crowded marks obscure local incidences, and complete signed
over/under and cyclic-traversal data are not authenticated. No printed
knot-table label identifies the sketch. The required reconstruction is
therefore distinct from independently supplied6₁/9₄₆ inputs and any
standard ten-crossing model. Conditional algebra alone certifies neither
the source's crossing relation nor the pictured knot.

The inspected page image SHA-256 is
`a22ced247bb10acde4e5952169c609a0795fb965074fde69bb6fef99b222ac33`.
The new reading preserves the historical transcript and corrects its
attribution through this explicit qualification. Images were inspected
only by verified gpt-6-luna; all other agents consumed Markdown.


<a id="problem64-literal-inputs"></a>
## Exercise64: two distinct two-seed presentation inputs

*Knot Theory — problems*, SHA-256
`06c19def0f01d6e74a1ee99bd448bd3731e101377deddb5aa573943898afb3b1`,
physical p11 asks to complete two labelings and find a single relation
in each. Preserve both pictured occurrences. Each has x on its upper-left
arc, y on its upper-right arc and a right-pointing arrow on x. The
[worked reduction targets](README.md#ten-crossing-wirtinger-elimination)
require complete finite signed input, all arc words, an explicit residual
normal-closure comparison and native inverse presentation maps for each.

Luna's1 November reading and focused broken-line-convention reread could
not authenticate either complete component trace. On the left, four
hook-shaped interior marks lack secure transverse-overarc pairings;
their number is not certified as a crossing count. On the right, the
central diagonal meeting and the lower/side open endpoints do not give
secure branch continuations. No knot-table name, braid/PD word or single
relator is inferred. The obstruction is the unresolved local pairing,
not the absence of printed crossing signs: ordinary underpass gaps and
coherent orientations determine signs when the underlying strokes are
clear. The source's requested one-relation calculations remain required.

The inspected p11 image SHA-256 is
`e4ffb13ce34913aa42de43ca7ea3cbacfee93b38e55b22bcdd246bd5e2d3b319`.
Only verified gpt-6-luna inspected images and returned Markdown. Exercise65's
general redundancy statement is already supplied by the planar once-each
relator identity; it does not identify either exercise64 diagram.
