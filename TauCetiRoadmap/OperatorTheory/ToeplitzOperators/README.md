# Toeplitz operators, symbols and finite sections

Develop the Hardy-space model of Toeplitz operators and its matrix model,
their symbol and Fredholm theory, and the stability of finite sections.
The library should support bounded measurable symbols, continuous scalar
symbols and the operator algebras of their discretizations. This README is
definitive; `Suggested.lean` contains selected interfaces.

## Carriers, conventions and suppliers

Use native `UnitAddCircle` with `AddCircle.haarAddCircle`, whose mass is 1,
and `MeasureTheory.Lp ℂ 2` and `Lp ℂ ∞` for the Hilbert space and symbols.
Use Mathlib's `fourierBasis`, `fourierCoeff` and Fourier expansion.
The monomial e_n is exp(2πint), and
`hat(a)(n)=∫a(t)exp(−2πint)dt`. Inner products are conjugate linear first.
The Hardy space is the closed native submodule spanned by e_n for n≥0;
P is its native orthogonal projection. Operators use `ContinuousLinearMap`.

For a symbol a set `T_a=P M_a|H²`. In the basis e_0,e_1,… its (i,j) entry
is hat(a)(i−j). A matrix written with entries c_(j−i) therefore uses
`c_n=hat(a)(−n)`. Prove this dictionary, including the reflection a(t)↦a(−t),
so the forward shift T_z has Fredholm index −1.

[CStarAlgebras C8](../../CStarAlgebras/README.md#c8-quasidiagonality-and-representation-approximation)
owns the unilateral-shift algebra and its exact sequence
`0→K(ℓ²)→T→C(𝕋)→0`. Compare the Hardy model with that same algebra.
[OperatorKTheory K4](../../OperatorKTheory/README.md#k4-fredholm-indices-and-extensions)
owns the Calkin/Atkinson comparison and compact-perturbation theorem; consume native
`ContinuousLinearMap.IsFredholm`, index composition, finite-rank perturbation
and `index_continuousOn_isFredholm`. [BanachSpaceTheory B5](../../BanachSpaceTheory/README.md#b5-function-spaces-and-weak-compactness)
supplies the scalar L∞ C*-structure. Mathlib supplies the circle Fourier,
orthogonal projection, complex Poisson and Jensen formulas. T1 builds the
remaining disk-boundary Hardy comparison; it does not specify a second
general Hardy-space theory on arbitrary domains.

Follow the [Hardy-space design discussion](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/Hardy%20Spaces/near/588721731)
for the analytic harmonic-majorant model. Build its unit-disk p=2 comparison
with this native closed submodule in Tau Ceti, following that design's
harmonic-majorant definition. Use the resulting Mathlib carrier if Mathlib supplies it.

## T1. Hardy space, multipliers and kernels

Prove the negative-Fourier-coefficient characterization of H², construct its
ℕ-indexed Hilbert basis and isometric comparison to native
`lp (fun _ : ℕ => ℂ) 2` by `hardyBasis.repr`, and give the projection
coefficient formula. Prove completeness and the orthogonal splitting into
nonnegative and negative modes. Consume native `ContinuousLinearMap.holderL`
for bounded multiplication by an L∞ symbol on L²; develop its norm, adjoint,
linearity, products and constants. Identify continuous symbols with their
L∞ classes, including equality of norms from full Haar support.

For x∈H² construct the holomorphic disk function
`F_x(w)=Σ_(n≥0)hat(x)(n)w^n`. Prove local uniform convergence, holomorphy,
the bound `|F_x(w)|≤‖x‖/sqrt(1−|w|²)`, and radial L² convergence to x.
Construct the unit-disk p=2 Hardy space of holomorphic F for which |F|²
admits a real harmonic majorant. Give vector-space and norm/completeness
APIs, defining norm squared as the infimum of majorants' values
at 0. Prove F_x is
the Poisson extension of x and the Poisson extension of |x|² is its
harmonic majorant by positivity and Cauchy–Schwarz. Prove its pointwise
minimality by the Poisson representation of any majorant on each r-disk,
the L¹ convergence `|F_x(r·)|²→|x|²` and uniform convergence of the
rescaled Poisson kernels on fixed interior points. Conversely
use mean value to bound all radial L² means by any majorant's value at 0;
Parseval then gives square-summable Taylor coefficients and the boundary
element x. Prove the isometric equivalence and equality of norm squared,
least majorant at 0 and supremum of radial L² means. Construct the reproducing kernels
and their normalized versions. Use native Jensen/Poisson theory to prove
that a nonzero H² boundary function is nonzero almost everywhere: factor its
zero at the origin, bound the negative part of log|F_x| and take an a.e.
convergent subsequence of the radial L² approximants. Fatou's lemma for
log⁻ proves logarithmic integrability and boundary uniqueness. Prove the
transport between native `circleAverage`/`circleMap` and the normalized
AddCircle Haar integral used here. Prove L¹ Fourier uniqueness by Fejér
means and their L¹ approximation, and the integrable product/coefficient
formulas for two L² functions; these are prerequisites of Coburn's proof.

## T2. Bounded symbols and Toeplitz matrices

Construct the bounded complex-linear symbol map a↦T_a. Prove its matrix
formula, `T_a†=T_(bar a)`, constants and `‖T_a‖=‖a‖∞`; derive injectivity.
Prove the Brown–Halmos criterion `S†TS=T` for the forward shift S iff
T is T_a for a unique L∞ symbol. On finitely supported vectors a sequence
(c_n)_(n∈ℤ) defines the matrix c_(j−i); prove it extends boundedly to ℓ²(ℕ)
iff it has such a symbol. Give the equivalent uniform bound on all leading
finite square compressions. Pass from these bounds to the bilateral Laurent
operator by translated finite supports, then identify the Laurent multiplier
under the native Fourier unitary. Own the multiplier criterion
`‖a p‖₂≤C‖p‖₂` for all trigonometric polynomials implies a∈L∞ with
‖a‖∞≤C, first for a∈L², by density, truncation and indicator approximation.
This also proves the symbol norm equality.

Define the Hankel operator `H_a=(1−P)M_a|H²`, with the actual orthogonal
complement as codomain. Prove
`T_a T_b−T_(ab)=−H_(bar a)† H_b`, using the ambient projection splitting.
For analytic b or coanalytic a the corresponding Hankel term vanishes;
prove the product identities and construct the H∞ multiplier comparison.
For continuous symbols prove the semicommutator compact by uniform
trigonometric approximation and finite-rank Laurent-polynomial calculations.
Do not make compression a multiplicative map on arbitrary symbols.

For every finite r≥1 use `PiLp 2 (fun _ : Fin r => HardySpace)` for the
block Hardy space. Compare it with the closed nonnegative-mode subspace of
`Lp (EuclideanSpace ℂ (Fin r)) 2 haarAddCircle` and with the vector-valued
ℓ² carrier. Matrix symbols use `Lp (EuclideanSpace ℂ (Fin r) →L[ℂ]
EuclideanSpace ℂ (Fin r)) ∞ haarAddCircle`, with its operator norm.
Construct the block multiplier and compression, its matrix Fourier-entry
formula, linearity, adjoint, isometry and block Brown–Halmos criterion.
On these operator-valued L∞ classes construct product by native Hölder
multiplication and the constant unit, and reuse native `Lp` star for the
pointwise adjoint; prove the C*-laws,
continuous-symbol embedding with exact sup operator norm and the
vector-valued multiplier criterion. Give product Fourier coefficients as
ordered convolution under the required L²/L¹ hypotheses, first on finite
Fourier sums and then by scalar native norm convergence on each finite
matrix entry.
Construct the block Hankel operator into the actual orthogonal complement
of the block Hardy subspace. Prove `T_(AB)=T_A T_B` when B is analytic
or A is coanalytic. Prove the block semicommutator formula and
compactness for continuous
matrix symbols by finite matrix entries and trigonometric approximation.
Use the same scalar projections and coefficient conventions on every block.

## T3. The shift algebra and Fredholm symbols

Compare C*(S) in the Hardy model with C8's shift algebra through the ℓ²
unitary and `AddCircle.toCircle`'s identification with native `_root_.Circle`.
Pin the symbol of S as the identity coordinate z and the symbol of T_a
as a transported along that identification. From C8's exact sequence deduce
every element has a unique expression T_a+K with a continuous and K compact.
For continuous a derive `‖T_a‖essential=‖a‖∞` and
`σ_essential(T_a)=a(𝕋)` in the same Calkin carrier.

For continuous a, prove T_a is Fredholm iff a is nowhere zero and
`index(T_a)=−wind(a,0)`. Define winding using native `Circle.degree`
in `TauCeti.Topology.Circle.Degree`: normalize a by its pointwise modulus
and pull back along `[0,1]→UnitAddCircle` to a loop in `_root_.Circle`.
For piecewise-C¹ symbols prove its cast to ℂ equals
`TauCeti.Contour.windingNumber γ 0 1 0`, where γ(t)=a(t mod 1) on
[0,1]. Prove degree 0 is equivalent to
a continuous logarithm by circle-cover lifting, and construct a nowhere-zero
homotopy from a to z^k when its degree is k. Prove homotopy invariance
through the native Fredholm-family theorem. Use the integer-power monomial
models to pin the sign, and include compact perturbations T_a+K.

Consume C1's spectral permanence for C*(S)/K inside the Calkin algebra
in the essential-spectrum computation. Prove Coburn's alternative for nonzero L∞ scalar a:
`ker(T_a)=0` or `ker(T_a†)=0`, by T1's boundary uniqueness and the Hardy
product argument. Deduce that a scalar Toeplitz operator of Fredholm index 0
is invertible. Hence continuous T_a is invertible iff a is nowhere zero
and its winding number is 0. For T_a+K its Fredholm index remains the
symbol index; compute `T_1−projection(span e_0)`, which has index 0 and
is not invertible.

Identify the block shift algebra with the finite matrix algebra over C8's
scalar algebra, acting on the pinned block Hilbert space. Construct its
symbol map to continuous operator-valued circle functions, kernel the
block compact operators, norm/adjoint/quotient and spectral-permanence
comparisons. All block identifications are targets here; C8 supplies the
scalar extension used for their entries. For a continuous matrix symbol
prove Fredholmness iff it is pointwise invertible and index equals minus
the winding of its determinant. Own the determinant index proof: approximate
uniformly by matrix Laurent polynomials through nowhere-singular symbols,
use Fredholm-family and determinant-degree homotopy invariance, and multiply
by z^m to obtain a polynomial matrix Q. Prove det Q≠0 in ℂ[z], then consume `Matrix.exists_mulVec_eq_zero_iff`
and `LinearMap.finrank_range_of_inj` for injectivity and image rank r. Consume
the polynomial PID instance and `Submodule.smithNormalFormOfRankEq`
for this full-rank image, reindexing its full-rank embedding to get the
diagonal form. Transport its image basis back to the domain
and use `Module.Basis.toMatrix` and inverse-basis identities to obtain
Q=U D V with explicit unimodular factors and polynomial inverses.
The nonzero constant det U and det V make ∏d_i a constant multiple
of det Q; prove each Smith entry d_i is nowhere zero on the circle. Prove U, V, U⁻¹ and V⁻¹ are bounded analytic multipliers with constant
determinants; T_U and T_V have inverses T_(U⁻¹) and T_(V⁻¹).
Own the finite Hilbert-product theorem: a block-diagonal bounded
operator on `PiLp 2 (fun i:Fin r=>H_i)` is Fredholm iff each component
is Fredholm, and its index is the sum of their indices. Construct the
bounded block-diagonal map on PiLp and use
`isFredholm_iff_exists_isQuasiInverse`: sum component quasi-inverses,
and recover each via its coordinate inclusion/projection. Prove kernel
and cokernel product identifications, closed range and dimension formulas.
The diagonal polynomial factors then use the scalar index theorem;
finite direct-sum index additivity gives index mr for z^(−m)I_r, and
T2's analytic product identities account for the z^(−m) factor. Build the
matrix-polynomial, Smith/Toeplitz and determinant comparisons explicitly.
Do not apply scalar Coburn to block symbols.

## T4. Bounded products and stability

For n∈ℕ use the Euclidean operator algebra on ℂ^(n+1), with its operator
norm and finite identity. Use native `lp (fun n => FiniteOperator n) ∞`
and `lp.inftyCStarRing` for bounded families. Consume
[CStarAlgebras C5](../../CStarAlgebras/README.md#c5-c-tensor-products-and-operator-space-tensor-products)'s
norm-null ideal and quotient and
[C1](../../CStarAlgebras/README.md#c1-ideals-hereditary-subalgebras-and-multipliers)'s
quotient C*-norm and spectral permanence, with their evaluation/star/unit APIs.
Prove that the quotient class is invertible iff A_n are eventually invertible
with uniformly bounded inverse norms. Construct both directions explicitly,
allowing arbitrary finitely many initial values and using Neumann estimates.
This criterion applies to all bounded matrix families, before Toeplitz structure.
State the same criterion for an arbitrary ℕ-family of nonzero finite-dimensional
Hilbert spaces with their operator algebras. In particular, block sections
use `EuclideanSpace ℂ (Fin (n+1) × Fin r)`, r≥1, and its operator-norm
bounded product and norm-null quotient, with identity at every n.
Compare r=1 block coordinates with the scalar sequence carrier through
`hardyBasis.repr` and the unique fiber coordinate. Identify the r=1 block
finite section with `finiteSection (sequenceOperator T)` under the native
`Fin (n+1) × Fin 1 ≃ Fin (n+1)` equivalence and the unique-index `PiLp`
isometries.

For a bounded T on native ℓ² define its finite sections by the first n+1
coordinates; their identity is I_(n+1). Transport to HardySpace using
`hardyBasis.repr`. Prove the norm bound and strong convergence of the
zero extensions `P_nTP_n→T` and their adjoints to T†. Define condition number on invertible
sections as `κ(A_n)=‖A_n‖‖A_n⁻¹‖`. Prove convergence of finite-section
solutions for stable sections when the limiting operator is invertible.
The unitary that swaps successive coordinate pairs has singular odd-sized
sections, showing that invertibility of T alone does not establish stability.

## T5. Continuous Toeplitz finite sections

Let P_n select the first n+1 coordinates and W_n reverse those coordinates,
zero on the complement. Construct the norm-closed finite-section algebra
generated by `(P_n T_a P_n)_n` for continuous a and norm-null families.
Prove its representation formula
`A_n=P_n(T_a+K)P_n+W_n L W_n+G_n`, with compact K,L and ‖G_n‖→0.
This is an equation after the finite matrix's zero extension
`E_n(A_n)=J_n A_n J_n†` to ℓ², with J_n the first-n+1 coordinate
isometry; prove compression/extension are mutually inverse on that corner.
Define the classical Hankel operator C_a on ℓ² with entries hat(a)(i+j+1).
Pin the flip J:(H²)⊥→H² by e_(−n−1)↦e_n, so `J H_a=C_(a(−t))`.
Prove Widom's finite-product identity
`T_n(ab)=T_n(a)T_n(b)+P_n C_a C_(b(−t)) P_n+W_n C_(a(−t)) C_b W_n`.
Prove W_n→0 weakly, `‖K W_n L‖→0` for compact K,L and
`W_n P_n K P_n W_n→0` strongly for compact K. These give closure
of the representation formula under multiplication together with
`‖K(I−P_n)‖→0`, `‖(I−P_n)K‖→0`, `W_n²=P_n` and
`W_n T_n(a) W_n=T_n(a(−t))`. Prove existence by
Laurent-polynomial products and closure, uniqueness of
a,K,L, and the actual strong-limit homomorphisms
`W(A)=T_a+K`, `W_reflected(A)=T_(a(−t))+L`.
Define them as the strong limits of E_n(A_n) and
W_n E_n(A_n) W_n respectively, and prove multiplicativity from strong limits and uniform norm bounds,
and star-preservation from the corresponding strong adjoint limits.
For R=limsup‖A_n‖ prove `‖a‖∞≤R`, `‖T_a+K‖≤R`,
`‖T_(a(−t))+L‖≤R`, and consequently `‖K‖,‖L‖≤2R`.
These estimates make the representation class norm closed. Construct the
independent compact boundary remainders from the shift-product defects,
first finite matrix units at each end and then their norm closures; this
proves every compatible pair lies in the pair map's image.

Identify the quotient by norm-null families with the pairs in the shift
algebra having these compatible reflected symbols. Prove the pair map
injective. Apply C1 spectral permanence both to this quotient's embedding
in T4's bounded-product quotient and to the shift algebra in B(H²);
this proves the pair image inverse closed and detects all
finite-section obstructions. Deduce stability iff both limiting operators
are invertible. For pure continuous scalar Toeplitz sections, obtain stability
iff a is nowhere zero with winding number 0 by T3. Give uniform inverse bounds
and convergence of the computed solutions. For matrix-valued continuous
symbols use the pinned block Hilbert carrier and the first n+1 block
projection. Pin reflection by `(W_n x)_(i,α)=x_(n−i,α)` for i≤n and
zero otherwise: it reverses block positions and preserves the fiber index α.
Use the block finite carrier and bounded-product quotient from T4
and T2/T3's block APIs. Prove Widom's identity in ordered matrix products,
the block compact remainder representation, both strong-limit homomorphisms,
closedness/uniqueness and the same quotient comparison. Prove stability requiring
both matrix Toeplitz limit operators invertible; determinant winding alone
does not replace those conditions.

## T6. Explicit checks and ordering

Compute shifts, adjoints, constant symbols and Laurent monomials in both
index conventions. For the block symbol diag(z,z̄), prove determinant 1 and
winding 0 but `T_A=S⊕S†` is not invertible, despite Fredholm index 0; its
pure finite sections are singular. This supplies the determinant-winding
counterexample to stability. For the symmetric coefficients `c_n=1/(|n|+1)`, prove
the L² function with these Fourier coefficients is not essentially bounded,
using the finite constant-vector logarithmic lower bound, and leading compression norms
are unbounded; the matrix therefore has no bounded ℓ² extension. For
`c_0=0`, `c_n=sgn(n)/(|n|+1)` when n≠0, compare the bilateral kernel
with 1/n. Its ℓ¹ difference has norm 2, and the discrete Hilbert-transform
multiplier has norm π; prove the Toeplitz compression bound π+2.

T1 precedes T2. T3 consumes T2 and the existing C8/K4 suppliers. T4's bounded-product/quotient criterion is independent; its Hardy and block
transports consume T1/T2.
T5 consumes T2–T4 and proves the
finite-section algebra structure before its stability theorem. T6 uses these
APIs for complete examples. Give every carrier identity, coercion,
extensionality, restriction, transport and continuity lemmas before its uses.

## References

- E. Park, [*Toeplitz operators*](https://faculty.tcu.edu/richardson/Seminars/EftonToeplitz_2016.pdf),
  for the Hardy model, symbol extension, index and Coburn alternative.
- Böttcher and Silbermann, *Analysis of Toeplitz Operators* and
  *Introduction to Large Truncated Toeplitz Matrices*, for finite-section
  algebras and the two-limit stability theorem.
- Conway, *A Course in Functional Analysis*, second edition, for the Hilbert,
  Hardy and shift conventions.
