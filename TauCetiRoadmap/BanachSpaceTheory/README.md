# Banach space theory

Build the geometry and duality of Banach spaces, from weak compactness and bases to
approximation, tensor norms, summing operators and finite-dimensional geometry. The
depth milestones are James's theorem, Pietsch domination and factorization,
Grothendieck's inequality, local reflexivity and Dvoretzky's theorem. Each sits inside
a usable theory of spaces, operators and their constructions.

## Scope and conventions

Spaces are over `𝕜 = ℝ` or `ℂ`, expressed with `RCLike` where appropriate; completeness
is a hypothesis, not part of the meaning of normed space. The local geometry in B7
is over `ℝ`. All duals are continuous duals `StrongDual 𝕜 E`; reflexivity means
surjectivity of `NormedSpace.inclusionInDoubleDual`, not algebraic reflexivity.
Use `WeakSpace 𝕜 E` and `WeakDual 𝕜 E`, with explicit transport between topologies.
Weak convergence in a dual is different from weak-star convergence.

Operators are `ContinuousLinearMap`; subspaces and quotients use Mathlib's
`Submodule` and normed quotient constructions. A Banach subspace is closed.
Compactness and relative compactness must be distinguished: the latter means
compact closure in the stated ambient topology. A Schauder series converges along
initial segments; an unconditional series converges along the net of finite sets.
Use `SchauderBasis`, `UnconditionalSchauderBasis` and `SummationFilter` accordingly.

The prerequisites are Mathlib's Hahn–Banach theorem, Banach–Alaoglu theorem,
uniform boundedness, open mapping theorem, Bochner integration and finite-dimensional
linear algebra. Supply the additional constructions below in Tau Ceti. This roadmap
owns general Banach-space tensor norms and absolutely summing operators.
[Operator ideals](../OperatorTheory/OperatorIdeals/README.md) owns general approximation
numbers and finite-rank approximability, as well as Hilbert-space Schatten ideals,
trace norms and singular values; B4 owns the nuclear/trace-class comparison.
[Operator theory](../OperatorTheory/README.md) owns
the Hilbert-space spectral theory. C*-tensor norms are outside this Banach-space
scope. B5 consumes SelfAdjointSpectralTheory Part B's generic scalar-measure
integration, regularity and bounded continuous-approximation layer
(SA-B81–84 and SA-B58), which is independent
of PVMs, representations and this roadmap's bidual comparison.

## B1. Duality and weak topologies

Develop annihilators and preannihilators, order reversal, annihilators of sums and
intersections, and the double-annihilator theorem: `(Fᗮ)_⊥` is the norm closure
of a subspace `F ≤ E`, while `(G_⊥)ᗮ` is the weak-star closure of a subspace
`G ≤ E*`. For a
closed subspace `F ≤ E`, identify `(E/F)*` isometrically with `Fᗮ`, and `F*` with
`E*/Fᗮ`; construct restriction, quotient and inclusion maps and prove their naturality.
Develop the adjoint of a bounded map using `ContinuousLinearMap.precomp 𝕜 T`,
its norm, kernels, ranges and composition.
For a bounded operator between Banach spaces, with both domain and codomain
complete, prove the closed-range theorem: `range T` is norm closed iff
`range T*` is norm closed. Separate the unconditional identities
`ker T*=(range T)ᗮ`, `ker T=(range T*)_⊥`, and
`closure(range T)=(ker T*)_⊥` from the closed-range conclusion
`range T*=(ker T)ᗮ`. Give the incomplete-domain counterexample
`c₀₀⊂ℓ²` with its ℓ² norm: inclusion has dense proper range,
while its adjoint is surjective by extension to the completion.

Extend the existing canonical bidual embedding by its naturality under bounded
maps, Goldstine's theorem (its closed unit ball has weak-star dense image in the
bidual unit ball), and norming by the dual unit ball. Prove the bipolar theorem for
absolutely convex sets and the weak/norm closure agreement for convex sets; over
complex scalars convexity still means real convexity. Include the finite-convex-
combination form of Mazur's lemma for weakly convergent sequences.

Give weak and weak-star continuity criteria by evaluation, boundedness consequences
of weak boundedness, and the weak-star metrizability of a dual unit ball when the
predual is separable, reusing `WeakDual.metrizable_of_isCompact` and
`WeakDual.isSeqCompact_closedBall`. Specify an actual compatible metric from a dense sequence in
the predual unit ball and prove independence of the chosen sequence at the topology
level. Do not impose separability on Banach–Alaoglu or Goldstine.

## B2. Weak compactness and reflexivity

Prove the following with reusable intermediate separation, compactness and
subsequence lemmas.

* **Eberlein–Šmulian:** a subset of a normed space is weakly compact iff it is
  weakly sequentially compact. Also prove the relative version, where subsequential
  limits may lie in the ambient space. No separability assumption is allowed.
* **Reflexivity:** a Banach space is reflexive iff its closed unit ball is weakly
  compact. Establish invariance under bounded linear equivalence, inheritance by
  closed subspaces and quotients, and equivalence with reflexivity of the dual.
* **James:** for a nonempty weakly closed subset `A` of a Banach space, weak
  compactness is equivalent to attainment on `A` of the supremum of `|f|` for every
  continuous linear functional `f`. Attainment includes existence of a finite
  maximum. Deduce reflexivity iff every functional attains its norm on the closed
  unit ball. Develop the separable reduction and finite norming sets needed in the
  proof; keep completeness as an explicit hypothesis of the theorem.
* **Krein–Šmulian:** a convex subset of the dual of a Banach space is weak-star
  closed iff its intersection with every closed ball centered at zero is weak-star
  closed. Include the linear-subspace criterion using just the unit ball.
* **Bishop–Phelps:** for a Banach space, norm-attaining continuous linear
  functionals are norm dense in the dual. For a nonzero Banach space, support
  points are dense in the boundary of a nonempty closed convex set, and support
  functionals are norm dense in the dual when that set is also bounded.
  A support functional is nonzero and its real part attains its supremum on the
  set; a support point is such an attaining point. Treat the zero space separately.
* **Milman–Pettis:** every uniformly convex Banach space is reflexive. Develop the
  modulus of convexity, passage to closed subspaces and invariance of reflexivity
  under equivalent norms. Include the standard uniform convexity estimates for
  `Lᵖ`, `1 < p < ∞`.

For a bounded operator, weak compactness means relative weak compactness of the
image of the unit ball. For `T : E →L[𝕜] F` with `E` normed and `F` Banach,
prove the Gantmacher criterion
`T**(E**) ⊆ J_F(F)`, weak compactness iff weak compactness of the adjoint, stability
under sums and bounded compositions, and compact implies weakly compact.
Use the identity on an infinite-dimensional reflexive space to separate the two.

## B3. Schauder bases and classical spaces

The basis-constant, perturbation, duality and convergence results in this
milestone concern Banach spaces. Coordinate and finite-projection identities
retain the weaker hypotheses of Mathlib's basis API.

Extend Mathlib's basis and coordinate maps with coefficient uniqueness, basis
constants, equivalent norms making a basis monotone, subsequences and block bases
as bases of their closed spans, and equivalence of bases by two-sided inequalities
on finite linear combinations. Build the induced continuous linear equivalence of
closed spans. Prove the small perturbation theorem: if `(bₙ)` is a Schauder basis
and `∑ ‖bₙ*‖ ‖bₙ−cₙ‖ < 1`, then `(cₙ)` is an equivalent basis, via the bounded
invertible operator sending `bₙ` to `cₙ`. Give its norm and inverse-norm estimates.

A basis is shrinking when its coordinate functionals span a norm-dense subspace of
the dual. It is boundedly complete when every scalar sequence with bounded initial
partial sums gives a norm-convergent series. Develop the dual basic sequence on its
closed span, the shrinking/boundedly-complete duality, and James's basis criterion:
a Banach space with a Schauder basis is reflexive iff that basis is both shrinking
and boundedly complete. Do not equate an ordinary Schauder expansion with `tsum`
using the unconditional filter.

Use `UnconditionalSchauderBasis ℕ 𝕜 E` for sequence-indexed unconditional
bases; construct its conversions with a `SchauderBasis` whose expansion also
converges along `SummationFilter.unconditional ℕ`. Reuse
`SchauderBasis.nnnormProjBound` and `UnconditionalSchauderBasis.nnnormProjBound`
as basis constants. For unconditional bases, give the equivalent uniform bound on finite coordinate
projections and on signed coordinate multipliers, suppression and permutation
invariance, and extension of bounded scalar multipliers. Construct the canonical
bases of `c₀` and `ℓᵖ`, `1 ≤ p < ∞`, identify `c₀* = ℓ¹` and `(ℓᵖ)* = ℓᑫ` for
`1 < p < ∞`, and identify `(ℓ¹)* = ℓ∞`. Use Mathlib's sequence-space models and
give isometric equivalences rather than introducing competing spaces.
Use `C₀(ℕ,𝕜)` (`ZeroAtInftyContinuousMap`) for `c₀`, and `lp` for `ℓᵖ`;
prove the dual identifications using the corresponding scalar integral/series
pairings, including `lp.dualPairing` at conjugate exponents.

Prove Schur's theorem for `ℓ¹`. Exhibit the unit-vector sequence in `c₀` as weakly
null but not norm null, the nonreflexivity of `c₀` and `ℓ¹`, and reflexivity of `ℓᵖ`
for `1 < p < ∞`. These examples also distinguish shrinking from bounded completeness.
Construct the Haar basis of `Lᵖ([0,1])`, `1 ≤ p < ∞`, with the constant first
vector, unnormalized ±1 functions on successive dyadic intervals, and increasing
dyadic levels. Its initial projections are averages on the successively refined
dyadic atom partitions; construct these contractions, their composition law and
convergence on `Lᵖ`, first on dense step functions. For unconditionality, prove
the scalar Bellman estimates for `p > 2` and
`Φ_p(x,y)=(x+y)^(p−1)((p−1)x−y)`, for `x,y ≥ 0`:
`((p−1)^(p−1)/p^(p−2))Φ_p(x,y) ≤ (p−1)^p x^p−y^p`, and
`Φ_p(|x+a|,|y+εa|)+Φ_p(|x−a|,|y−εa|) ≥ 2Φ_p(|x|,|y|)`
for real `x,y,a` and `ε=±1`. Integrate the midpoint inequality inductively
over each split dyadic atom to obtain the signed-transform bound `p−1`.
Use orthogonality at `p=2` and finite-atom Hölder duality at conjugate
`q>2` for `1<p<2`. Thus the real Haar sign-transform bound is
`max(p,p/(p−1))−1`. Deduce the complex bound twice that value by real/imaginary
parts, and hence unconditionality over both fields.

## B4. Approximation and Banach tensor products

The approximation-property equivalences and stability results below concern
Banach spaces. Algebraic tensor norms are defined for normed spaces; completed
tensor/operator identifications, nuclear operators and scalar-unit isometries
use Banach factors. In particular the target `F` is complete in the operator
identifications involving `E* ⊗ε F` and `E* ⊗π F`.

Define the approximation property by uniform approximation of the identity on
each norm-compact subset by bounded finite-rank operators. The `λ`-bounded
approximation property adds `‖T‖ ≤ λ`; BAP means such a finite `λ` exists and MAP
means `λ = 1`. Prove MAP implies BAP implies AP. Under a bounded linear
equivalence `U`, transport `λ`-BAP to `λ‖U‖‖U⁻¹‖`-BAP; AP and BAP
are invariant under these equivalences, while MAP is preserved by isometric
equivalences. For a bounded projection `P` onto a closed subspace, prove
inheritance of AP and transport `λ`-BAP to `λ‖P‖`-BAP. Prove BAP from
a Schauder basis with its basis constant. Prove MAP for
`c₀`, `ℓᵖ` and `Lᵖ([0,1])`, `1 ≤ p < ∞`, using the explicit projections.

Prove Grothendieck's equivalence: `E` has AP iff every compact operator `F → E`
from every Banach space is an operator-norm limit of finite-rank operators. Include
the compact-disk construction and the fact that a relatively norm-compact set is
contained in the closed convex hull of a null sequence.

Use distinct normed type synonyms of Mathlib's binary `TensorProduct 𝕜 E F`
for the projective and injective norms, and
`UniformSpace.Completion` for the completed
tensors. Give norm-preserving pure-tensor comparisons with the finite-family
`PiTensorProduct` interfaces. On the algebraic tensor product define the projective norm by the infimum of
`∑ ‖xᵢ‖ ‖yᵢ‖` over finite decompositions and the injective norm by
`sup {|∑ f(xᵢ)g(yᵢ)| : ‖f‖ ≤ 1, ‖g‖ ≤ 1}`. Prove they are norms over `ℝ` and `ℂ`,
the elementary-tensor equality, and `ε ≤ π`. Construct their completions, their
dense algebraic embeddings, the maps induced by bounded maps in both variables,
and symmetry, associativity and scalar-unit isometries with coherence on pure
tensors. The injective tensor product preserves isometric embeddings; the
projective tensor product preserves metric quotient maps.

Prove the norm-preserving universal property of the completed projective tensor
product for bounded bilinear maps into a Banach space, and its dual identification
with bounded bilinear forms. Prove that every completed projective tensor is a
norm-convergent series `∑ xₙ⊗yₙ` with `∑ ‖xₙ‖‖yₙ‖ < ‖u‖π+ε` for each
`ε>0`, by successive finite-tensor approximations. Identify the injective completion `E* ⊗ε F` with the
operator-norm closure of finite-rank maps `E → F`. Construct the canonical map
`E* ⊗π F → (E →L[𝕜] F)` and its range with quotient norm: nuclear operators.
Prove completeness, rank-one norm, the ideal inequality and the series
representation `T x = ∑ fₙ(x)yₙ` with `∑ ‖fₙ‖‖yₙ‖ < ∞`; the nuclear norm is the
infimum over those representations. Use the range submodule of the canonical map
as the underlying algebraic carrier, with a separate normed type synonym carrying
the quotient norm and a contractive forgetful map into bounded operators.
Prove the kernel closed. Reuse OperatorIdeals OI-A01 and
OI-A25–OI-A28 for approximation numbers and finite-rank approximability.
Connect AP to tensors: a Banach space `E` has AP iff
`F ⊗π E → F ⊗ε E` is injective for every Banach `F`. Prove that
`E* ⊗π F → (E →L[𝕜] F)` is injective if `E*` or `F` has AP; distinguish
this hypothesis-dependent tensor identification from the always-defined
quotient-norm nuclear carrier. Build the finite-rank tensor approximation and
separation/compact-set arguments for these comparisons.
Keep the nuclear norm distinct from operator norm. On Hilbert pairs, construct
its isometric identification with OperatorIdeals OI-B29–OI-B30's trace-class
gauge. Construct the compact Schmidt series from the existing compact
self-adjoint theorem, reusing Mathlib's
`ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` and
Tau Ceti's `exists_hilbertBasis_forall_hasEigenvector` in
`TauCeti.Analysis.InnerProductSpace.Spectrum`. For compact `T:H→K` on
complete real or complex Hilbert spaces, apply these to `T†T`. Order the
positive eigenvalues `λ_j` with multiplicity and put `s_j=√λ_j`.
Prove only finitely many eigenvalues exceed
any positive threshold, and choose the associated finite or countable
orthonormal families `(e_j),(f_j)`, with `f_j=s_j⁻¹T e_j` and
`s_j>0` nonincreasing, tending to zero in the infinite-rank case. Prove
`Tx=∑ s_j⟪e_j,x⟫f_j`, vanishing on ker T, and operator-norm convergence
of its finite truncations. Zero-pad the singular-value sequence in the
finite-rank case and prove `s_n=a_n(T)` with the zero-based OI convention:
the rank-n truncation gives the upper bound and, below the rank, a kernel
vector on an (n+1)-dimensional singular span gives the lower bound;
at or above finite rank both sides are zero. A finite trace-class
gauge implies compactness by the OI approximation-number criterion.
The summable Schmidt series gives the nuclear-norm upper bound. For the
reverse inequality, use OI's gauge subadditivity and rank-one norm on
partial nuclear sums, operator-norm continuity of each `a_n`, and Fatou
for the series of approximation numbers. This also pins the rank-one norms.

Identify `(E ⊗ε F)*` with integral bilinear forms: those forms whose induced
linear functional on algebraic tensors is bounded for `ε`, with norm the least
such bound. Prove evaluation, completeness, rank-one formulas, and bounded
functoriality in both factors. Compare currying into `F*` and the forgetful map
to bounded bilinear forms; do not conflate the integral and ordinary bilinear norms.

## B5. Function spaces and weak compactness

This milestone uses Banach spaces and finite measure spaces. For compact Hausdorff
`K` with its Borel measurable structure, develop the Banach-space duality between `C(K,𝕜)` and
finite regular scalar Borel measures, with the total-variation norm, evaluation
measures and the weak-star topology. Use the submodule of
`MeasureTheory.VectorMeasure K 𝕜` with finite regular variation, normed by
`(ν.variation Set.univ).toReal`; compare with native `SignedMeasure` and
`ComplexMeasure`. Use native `VectorMeasure.variation_smul` for scalar
closure and norm homogeneity, with SA-B83's regularity comparisons.
Construct the norm and Dirac maps; write
`M(K)` for this normed measure submodule. Consume `VectorMeasure.integral`
for its integration pairing, using `ContinuousLinearMap.mul ℝ 𝕜`
over any `RCLike 𝕜`. Consume
SelfAdjointSpectralTheory SA-B81–82's 𝕜-linearity and scalar-integral
comparison, SA-B83’s finite absolute-continuity regularity lemma, and
SA-B84’s generic scalar-measure uniqueness for injectivity. Prove this normed
dual identification, continuous-function evaluation and the variation norm. Use
`VectorMeasure.variation`, native scalar Radon–Nikodym
derivatives and `RealRMK.rieszMeasure`. Construct positive and negative parts
of real bounded functionals using `Λ⁺(f)=sup{Λ(g):0≤g≤f}` for `f≥0`;
prove additivity, boundedness and extension to a positive linear functional.
Apply RMK to those parts. For general RCLike-valued functionals, restrict to real-valued
functions and represent their real and imaginary parts. Reconstruct the
measure using SA-B81 and extend from real tests using 𝕜-linearity. Build the
Radon–Nikodym density construction below before proving norm equality: at
ν=|μ| it gives μ=ν.withDensityᵥ h and ‖h‖=1 ν-a.e. The integral bound proves
‖Λ_μ‖≤ν(K). For the reverse inequality, choose a measurable representative of
conj(h) bounded by one everywhere, apply SA-B58 to approximate it in L¹(ν)
by continuous functions with the same bound, and use SA-B82's pairing identity.
Their integrals against μ tend to ν(K), hence ν(K)≤‖Λ_μ‖. This uses only
native signed Radon–Nikodym theory and SA-B81–84/58, independently of the dual
identification. Prove surjectivity by the RMK parts construction, then transport
completeness from the strong dual through this onto linear isometry. Export the
resulting isometric dual equivalence and its weak-star evaluation laws.
For nonempty `K`, prove that the extreme points of its dual unit ball are
exactly `λδ_x`, `|λ|=1`, by splitting variation on measurable sets and
using regularity; handle empty spaces separately.
Prove the Banach–Stone theorem in its operator form: a surjective linear
isometry `C(K,𝕜) → C(L,𝕜)` is `f ↦ h · (f ∘ φ)`, where `φ : L ≃ₜ K` and
`h : C(L,𝕜)` has pointwise modulus one; include uniqueness and the converse.
Construct `φ` and `h` from the adjoint action on extreme Dirac functionals,
with `h=T1`, and prove continuity of `φ` via evaluation of continuous functions.

For a finite measure `μ`, prove the Dunford–Pettis weak compactness criterion:
a subset of `L¹(μ)` is relatively weakly compact iff it is norm bounded and its
integrals `∫_A ‖f‖ dμ` are uniformly absolutely continuous with respect to `μ`:
for every `ε>0` there is `δ>0` such that `μ(A)≤δ` implies all these integrals
are at most `ε`. Relate this to native `UnifIntegrable` at exponent 1, and the
bounded version to `UniformIntegrable`; transport representatives of `Lp`
classes explicitly. Relate this
to the uniform tail-integral criterion. Build the truncation, Radon–Nikodym and
weak-closure arguments, and prove weak sequential completeness of `L¹(μ)`.

An operator is completely continuous if weakly convergent sequences have
norm-convergent images. Prove equivalence to taking weakly compact sets to
norm-compact sets. The Dunford–Pettis property of a space means that every weakly
compact operator from it to any Banach space is completely continuous. Prove the
criterion `fₙ(xₙ) → 0` when both sequences are weakly null in the space and its
dual, and prove the property for `C(K)` and `L¹(μ)`. Supply the connecting
constructions: for a weakly null sequence of regular scalar measures `(νₙ)`,
form the finite regular measure `ν=∑ 2^(−n−1)|νₙ|`. Prove that
for every finite regular positive ν `g↦ν.withDensityᵥ g` is an
isometric embedding `L¹(ν)→M(K)` with closed range, consuming native
`Measure.variation_withDensityᵥ` and SA-B82's pairing identity
`⟨f,ν.withDensityᵥ g⟩=∫fg dν`. For ℂ, identify the generic density below with native
`ComplexMeasure.rnDeriv` using SA-B81’s real/imaginary compatibility;
consume native `integrable_rnDeriv`. For ℝ consume native
`SignedMeasure.absolutelyContinuous_iff_withDensityᵥ_rnDeriv_eq` and
`SignedMeasure.totalVariation_eq_variation`. For general RCLike 𝕜,
for `[SigmaFinite ν]` and `|μ|≪ν`, construct the integrable density
`h=rnDeriv(re μ,ν)+I·rnDeriv(im μ,ν)` from SA-B81’s signed parts.
Prove `μ=ν.withDensityᵥ h` using their absolute continuity and SA-B81’s
reconstruction, and specialize to the same native ℝ and ℂ derivatives.
Consume `Integrable.withDensityᵥ_eq_iff` for a.e.-uniqueness and
`Measure.variation_withDensityᵥ` for
`|μ|=ν.withDensity (fun x=>‖h x‖ₑ)` under these same hypotheses; for μ∈M(K), ν=|μ| is finite by definition, hence σ-finite;
prove |h|=1 ν-a.e. Use these derivatives to transfer weak
nullity to the densities in the displayed dominating-measure construction.
Uniform integrability of those densities and bounded convergence of the weakly
null continuous functions then prove the `C(K)` sequence criterion.
Construct the isometric duality `(L¹(μ))*≃L∞(μ)` by the integral pairing,
with indicator tests and Radon–Nikodym densities giving surjectivity and the
essential-bound norm equality. Reuse native scalar `Lp 𝕜 ∞ μ` star and
the Hölder `HSMul` product at exponents ∞,∞,∞ for pointwise multiplication,
construct its unit, and prove its commutative C*-algebra laws over
`ℂ`. Reuse Mathlib's `gelfandStarTransform` to identify it with `C(K_μ,ℂ)`;
construct the real-linear isometries
`selfAdjoint (Lp ℂ ∞ μ) ≃ Lp ℝ ∞ μ` and
`selfAdjoint C(K_μ,ℂ) ≃ C(K_μ,ℝ)` for the real version.
Prove the function-space comparison preserves absolute values and finite
square functions. Treat the zero measure
separately. Prove that DPP of `X*` implies DPP of `X` using the canonical
bidual embedding and the sequence criterion, and apply this to `L¹(μ)`.
Include an infinite-dimensional
Hilbert space as a counterexample. Weak-star null functionals cannot replace
weakly null functionals in the criterion: in `c₀`, the unit vectors are weakly
null and their coordinate functionals are weak-star null, with pairing always 1.
Prove that `c₀` has DPP from B3's Schur property of `c₀*=ℓ¹` and the
sequence criterion, so it supplies the claimed counterexample.

## B6. Summing operators and Grothendieck's inequality

The operator-ideal completeness and series characterizations below use Banach
source and target spaces; finite-family inequalities retain normed-space scope.

For real `1 ≤ p < ∞`, define the weak `p`-norm of a finite family `(xᵢ)` as
`sup_{‖f‖≤1} (∑ |f(xᵢ)|ᵖ)^(1/p)`. A bounded operator is absolutely `p`-summing
if `(∑ ‖Txᵢ‖ᵖ)^(1/p)` is bounded by a constant times that weak norm; `πₚ(T)`
is the least constant. Bundle the operators satisfying this finite-family
inequality as an underlying submodule of `E →L[𝕜] F`. Use a separate normed
type synonym `Π_p(E,F)` carrying the `π_p` norm, with a contractive
forgetful inclusion into the operator-norm carrier. Construct the Banach operator ideal, with rank-one norm,
`‖T‖ ≤ πₚ(T)`, completeness, ideal inequality and inclusion `π_q(T) ≤ π_p(T)`
for `p ≤ q`. For `p = 1`, prove the characterization by taking unconditionally
convergent series to absolutely convergent series.

Prove Pietsch domination: `πₚ(T) ≤ C`, for `C ≥ 0`, iff there is a regular Borel
probability measure `ν` on the weak-star compact dual unit ball such that
`‖Tx‖ ≤ C (∫ |f(x)|ᵖ dν(f))^(1/p)` for all `x`. Include the separating-convex-sets
argument constructing `ν`, measurability of evaluations, and factorization through
the closure of the canonical image of `E` in `Lᵖ(ν)` when the target `F` is
complete, with factor norm at most `C`. For normed incomplete targets,
construct the factor on the canonical image itself.
Do not assert extension of this factor to all `Lᵖ(ν)` with arbitrary codomain.
Use the closed dual unit ball as a subtype of `WeakDual 𝕜 E`, with the inherited
compact topology and its Borel measurable structure, for the carrier of `ν`.

Prove the real and complex Grothendieck inequalities with finite universal
constants `κ_ℝ=8` and `κ_ℂ=16`: for any finite scalar matrix `a`, the supremum of
`|∑ aᵢⱼ ⟨uᵢ,vⱼ⟩|` over Hilbert unit-ball vectors is bounded by `κ_𝕜` times the
supremum of `|∑ aᵢⱼ sᵢtⱼ|` over scalar unit balls. First use finite-dimensional
Euclidean vectors; pass from any Hilbert space to their finite-dimensional
linear span. For real scalars, construct a finite independent Gaussian model
of that span and prove `𝔼g⁴=3(𝔼g²)²`. Handle the zero matrix, then normalize
the nonzero scalar matrix bound to one. Define `Γ(a)` as the supremum over
all real inner-product spaces; prove that it equals the supremum in
`ℝ^(m+n)` for an m-by-n matrix, so it applies also to truncated Gaussian
functions and error vectors in `L²(γ_N)`. It is initially bounded by
`∑|aᵢⱼ|`. For truncations at `M>0`, prove the squared tail bound
`‖u−u^M‖₂²≤3/(16M²)` and the absorption inequality
`Γ(a)≤M²+Γ(a)√3/(2M)`. Taking `M=2` proves the real bound with `κ_ℝ`.
For complex scalars, use realification, split real and imaginary
parts of the coefficient matrix, and rotate the total sum by a unit scalar
to obtain the bound with `κ_ℂ=2κ_ℝ`. Construct the compact-space bilinear-form version
by finite partitions of unity and passage to the limit;
these chosen constants carry no optimality claim. Derive
`π₂(T) ≤ κ_𝕜 ‖T‖` for `T : C(K) → L¹(μ)` with finite `μ`, using
B5's `L∞≃C(K_μ)` and its square-function comparison in the integral
bilinear form `(f,g)↦∫Tf·g`. Also derive `π₁(T) ≤ κ_𝕜 ‖T‖`
for `T : L¹(μ) → H`, with `H` a Hilbert
space. First prove the weighted finite-atom case by applying the matrix
inequality to normalized columns of `T` and vectors norming its images;
extend from simple functions by density. Reuse B5's integral/dual pairing.

## B7. Local theory and Euclidean sections

Define Banach–Mazur distance between nonzero finite-dimensional real normed
spaces of equal dimension as `inf ‖T‖‖T⁻¹‖`. Prove symmetry, multiplicative
triangle inequality, invariance under isometry and distance one iff isometry.
Define finite representability using arbitrarily small distortion embeddings of
each finite-dimensional subspace; prove transitivity and inheritance by subspaces.

Prove local reflexivity: for finite-dimensional `F ≤ E**`, `G ≤ E*` and `ε > 0`,
there is a linear embedding `T : F → E` with distortion at most `1+ε`, preserving
every pairing with `G` and satisfying `T(J_E x) = x` whenever `J_E x ∈ F`.
Make the two-sided `(1−ε,1+ε)` norm bounds for `0 < ε < 1` the primary
existence statement. Derive any requested distortion bound by choosing a
smaller tolerance. Conversely derive this existence statement from the
distortion theorem by adjoining a nonzero `J_E x₀` to `F`, so both `T` and
its inverse on its range have norm at least one; handle the zero space
separately. This compares existence statements with changed data and tolerance.
Develop the
finite-system separation and norm approximation lemmas used in its proof.
Deduce finite representability of `E**` in `E`.

Use native `ConvexBody` with explicit symmetry and nonempty-interior conditions.
Develop symmetric convex bodies in finite-dimensional Euclidean spaces, polar
bodies, ellipsoids, volume and change of variables. Prove John's ellipsoid theorem
and its contact-point decomposition for symmetric bodies with nonempty interior.
In the position where the maximal-volume inscribed ellipsoid is the Euclidean
unit ball, construct contact points `u_i∈∂K∩S^(n−1)` and positive weights
`c_i` with `∑ c_i(u_i⊗u_i)=I` and `∑ c_i=n`, for `n≥1`; here
`u_i⊗u_i` denotes the rank-one map `x↦⟨u_i,x⟩u_i`. Derive
`d(E,ℓ²_n) ≤ √n` and the Kadec–Snobar projection theorem: every `n`-dimensional
subspace of a real Banach space admits a projection of norm at most `√n`.

Prove Dvoretzky's theorem: for every `k ≥ 1` and `ε > 0` there is `N` such that
every real normed space of dimension at least `N` has a `k`-dimensional subspace
at Banach–Mazur distance less than `1+ε` from `ℓ²_k`. Deduce that `ℓ²` is finitely
representable in every infinite-dimensional real Banach space. Build the sphere
concentration and net estimates used for this: normalized spherical measure,
rotation invariance, a bound `2 exp(−c n t²/L²)` about a median for real
`L`-Lipschitz functions on `Sⁿ⁻¹` with its Euclidean distance, for `n ≥ 2`, `L > 0`
and `t > 0`, with `c=1/(1024π²)`. Prove the mean-centered estimate
`σ{|f−∫f dσ|>t} ≤ 4 exp(−n t²/(32π²L²))` and the bound
`|median(f)−∫f dσ| ≤ √(32π² log 8) L/√n`.
Reuse B6's finite Gaussian model. Prove its radial/directional
independence and the normalized direction's spherical distribution, and construct
normalized Haar rotations on the orthogonal group and the map `U↦Ux`
pushing Haar probability to spherical probability. Use the normalization of
Mathlib's `Measure.toSphere` for the latter. Supply the Gaussian
exponential-moment and interpolation estimates and the smooth approximation
of Lipschitz functions used in concentration. For a centered Lipschitz
spherical function, use the valid bound `|f| ≤ 2L` in the radial-extension
argument and propagate the resulting constants. Also construct a finite `η`-net of
`Sᵏ⁻¹` of size at most `(1+2/η)^k`, for `η > 0`.
Make the dimension-growth step explicit. In John's position for an
`n`-dimensional space, `n ≥ 4`, construct a Dvoretzky–Rogers orthonormal
basis with `‖e_j‖ ≥ 2^(−n/(n−j+1))`. Pass to the span `Y` of the first
`m = ⌊n/2⌋` vectors, whose norms are at least `1/4`. Prove
`𝔼 max_{j≤m}|g_j| ≥ (1/100)√(log m)` for independent standard Gaussians,
using a scalar tail estimate at `s=(1/4)√(log m)` and independence.
Use the elementary Rademacher convexity inequality
`max_j ‖v_j‖ ≤ 𝔼_ε ‖∑ ε_j v_j‖` to deduce
`θ_Y = ∫_{S^(m−1)} ‖x‖ dσ ≥ (1/400)√(log m/m)`.
Prove the random-rotation/net lemma: for `0 < η < 1/3` and
`k ≤ 10⁻⁶ m θ_Y² η²/log(3/η)`, a `k`-dimensional subspace has norm between
`(1−η)θ_Y‖x‖₂` and `(1+η)θ_Y‖x‖₂`. This yields the logarithmic
dimension bound and the qualitative theorem. For a requested `ε > 0`, use
`η = min(ε/4,1/4)` and the threshold
`N = max(4, ⌈exp(10¹² k η⁻² log(3/η))⌉)`.
Verify this constant from the preceding estimates and `log⌊n/2⌋≥(log n)/3`
for `n≥4`, without an optimality claim.

## Sources and API alignment

* Megginson, *An Introduction to Banach Space Theory*: §§2.6–2.11 (Goldstine
  2.6.26, Krein–Šmulian 2.7.11, Eberlein–Šmulian 2.8.6, James 2.9.3–2.9.4,
  Bishop–Phelps 2.11.14), §3.4 (AP equivalence 3.4.32), §4.4 (basis criterion
  4.4.15), §5.2 (Milman–Pettis 5.2.15).
* Albiac–Kalton, *Topics in Banach Space Theory*: Chapters 1–5 (bases and
  function spaces), §6.1 (Haar basis 6.1.3, scalar Bellman estimates
  6.1.5–6.1.6, unconditionality 6.1.7), Chapter 8 (Grothendieck 8.1.1,
  compact-space form 8.1.3, Pietsch 8.2.8), §12.2
  (local reflexivity 12.2.4), §12.3 and Chapter 13 (Dvoretzky 12.3.13,
  John 13.1.5, Kadec–Snobar 13.1.7), §§13.2–13.3 (concentration,
  mean-norm estimate 13.3.2, Dvoretzky–Rogers 13.3.5,
  Gaussian maximum 13.3.6 and logarithmic Dvoretzky bound 13.3.7).
* Runde, *Lectures on Amenability*, Appendix B.2: injective/projective tensor
  norms, completions, functoriality and the projective universal property.
* Ryan, [*Introduction to Tensor Products of Banach Spaces*](https://doi.org/10.1007/978-1-4471-3903-4),
  Chapters 2–4: completed projective series, nuclear operators, injective duality
  and approximation/tensor comparisons.
* Ball, [*An Elementary Introduction to Modern Convex Geometry*](https://math.uchicago.edu/~shmuel/AAT-readings/Combinatorial%20Geometry%2C%20Concentration%2C%20Real%20Algebraic%20Geometry/ball.pdf),
  Lecture 3, Theorem 3.1: John's ellipsoid and the contact-point decomposition.
* Garrido–Jaramillo, [*Variations on the Banach–Stone theorem*](https://matematicas.unex.es/~extracta/Vol-17-3/17J3Mari.pdf),
  §2, Theorems 2 and 4: the real weighted-composition theorem and Arens–Kelley
  extreme points. The complex version uses the variation splitting and phase
  arguments specified in B5.

Mathlib's `Analysis.Normed.Module.Bases` already supplies generalized Schauder
bases, finite projections and projection bounds. Follow the designs discussed in
[Extending Functional Analysis Coverage on Zulip](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/Extending%20Functional%20Analysis%20Coverage)
and [PR #34209](https://github.com/leanprover-community/mathlib4/pull/34209).
For the bipolar theorem and uniform convexity use the shape of
[PR #26345](https://github.com/leanprover-community/mathlib4/pull/26345) and
[PR #28693](https://github.com/leanprover-community/mathlib4/pull/28693).

Tensor-product spelling requires care: the `injectiveSeminorm` in the pinned
Mathlib is not the classical `ε` norm above. Follow `leastCrossnorm` and the
projective API in [PR #33969](https://github.com/leanprover-community/mathlib4/pull/33969),
including compatibility of binary and finite-family tensors. Follow the nuclear
operator design in [PR #42197](https://github.com/leanprover-community/mathlib4/pull/42197),
whose `ContinuousLinearMap.nuclearOperators` uses the range of the completion map
from `F ⊗π E*`; the tensor symmetry identifies this with the ordering used in B4.
Build every needed missing result in Tau Ceti with these interfaces; adopt
Mathlib's implementation when available.
