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
