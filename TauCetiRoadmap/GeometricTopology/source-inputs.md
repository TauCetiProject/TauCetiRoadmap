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
