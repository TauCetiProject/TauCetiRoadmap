# Banach space theory

Build the geometry and duality of Banach spaces, from weak compactness and bases to
approximation, tensor norms, summing operators and finite-dimensional geometry. The
depth milestones are James's theorem, Pietsch domination and factorization,
Grothendieck's inequality, local reflexivity and Dvoretzky's theorem. Each sits inside
a usable theory of spaces, operators and their constructions.

## Scope and conventions

Spaces are over `𝕜 = ℝ` or `ℂ`, expressed with `RCLike` where appropriate; completeness
is a hypothesis, not part of the meaning of normed space. In B7 the Banach–Mazur
distance, finite representability, local reflexivity, John's theorem and the projection
theorems are over `𝕜`; concentration of measure and Dvoretzky's theorem are over `ℝ`.
All duals are continuous duals `StrongDual 𝕜 E`; reflexivity means
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
scope. BanachAlgebras A1/A8 supplies the scalar/compact operator-algebra
comparisons used in B4's examples; its early compact layer is independent
of these tensor/AP constructions. B5 consumes SelfAdjointSpectralTheory Part B's generic scalar-measure
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
its norm, kernels, ranges and composition. For a bounded endomorphism of a
complex Banach space prove the Banach-transpose spectrum equals the original
spectrum, using Hahn–Banach and the inverse/closed-range comparison.
After B3’s classical-space duality comparison, for 1≤p<∞ and conjugate q, including p=1,q=∞, define the right and left shifts R_p,L_p on ℓᵖ
and prove `(R_p)*=L_q` and `(L_p)*=R_q` under the actual
dual identification `(ℓᵖ)*≃ℓᑫ` and its bilinear series pairing. The Hilbert adjoint instead conjugates the complex spectrum;
compare it with the transpose through the Riesz conjugate-linear map.
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

On bounded maps between normed spaces, consume native `PointwiseConvergenceCLM`
for SOT and `ContinuousLinearMapWOT` for pointwise weak convergence. Prove their
evaluation/dual-pairing criteria, norm⇒SOT⇒WOT and compatibility with the
Hilbert matrix-coefficient WOT used by VonNeumannAlgebras V1. On Banach
domains, convergent SOT or WOT sequences are norm bounded by uniform
boundedness; prove the SOT sequential product consequence and joint SOT
continuity on norm-bounded sets. A convergent net need not be norm bounded:
on an infinite-dimensional Banach space construct rank-one maps annihilating
each prescribed finite-dimensional subspace and with arbitrarily large norm,
using Hahn–Banach. Give an actual directed index and SOT limit. Also construct
SOT-null nets S_i,T_i with S_iT_i a fixed nonzero rank-one operator: choose
S_i annihilating the prescribed finite subspace, T_i with shrinking norm and
range in a separated complementary direction, and reciprocal scaling.
After B3's classical-space comparison, on c₀ construct forward/backward shift powers T_n,S_n and prove both WOT-null,
S_n SOT-null, S_nT_n=I and T_nS_n the SOT-null tail projection. Prove every
estimate using B3's c₀*=ℓ¹ comparison; the Hilbert specialization consumes
this generic topology, while ultraweak/ultrastrong theory remains V1's scope.
Construct a norm-one functional φ on ℓ∞ with φ(c₀)=0 and φ(1)=1
by Hahn–Banach on ℓ∞/c₀, proving the quotient norm of 1 is 1.
BanachAlgebras A3 consumes this single functional for its zero-matrix
rank-one example. On ℓ² with standard e_i, prove 0 lies in the weak
closure of `{e_m+m e_n : 1≤m<n}` but is no weak sequential limit from
that set. For a finite collection of functionals choose m with small
coordinates and then n with m times their coordinates small. Prove a
weakly convergent sequence is norm bounded; bounded m leaves finitely
many first-coordinate positions, and one survives on a subsequence,
contradicting convergence to 0. This vector example is separate from
V1's operator-topology example.
Construct its explicit weak-null net: index by finite sets F of continuous
linear functionals and integers k≥0, ordered by inclusion of F and increase
of k. Choose m<n by the finite-functional lemma so
`|f(e_m+m e_n)|<1/(k+1)` for every f∈F. Prove the chosen vectors tend
to zero in the native weak topology along this directed order.

Finite-dimensional norm equivalence does not extend to every metric agreeing
with usual convergence on affine lines. On ℝ² set f(0,0)=0 and
f(x,y)=x²y/(x⁴+y²) elsewhere. Prove f is continuous on every affine
line but f(t,t²)=1/2 for t≠0. The metric
`d(p,q)=‖p−q‖₂+|f(p)−f(q)|` has the usual topology on every
line and a different ambient topology. This is the precise qualification
of the introductory metric example.

## B2. Weak compactness and reflexivity

Prove the following with reusable intermediate separation, compactness and
subsequence lemmas.

* **Eberlein–Šmulian:** a subset of a normed space is weakly compact iff it is
  weakly sequentially compact. Also prove the relative version, where subsequential
  limits may lie in the ambient space. No separability assumption is allowed.
* **James:** for a nonempty norm-closed bounded convex subset `A` of a Banach space, weak
  compactness is equivalent to attainment on `A` of the supremum of `Re f` for every
  continuous linear functional `f`. Attainment includes existence of a finite
  maximum. Deduce reflexivity iff every functional attains its norm on the closed
  unit ball. Develop the separable reduction and finite norming sets needed in the
  proof; keep completeness as an explicit hypothesis of the theorem.
* **Reflexivity:** a Banach space is reflexive iff its closed unit ball is weakly
  compact. Establish invariance under bounded linear equivalence, inheritance by
  closed subspaces and quotients, and equivalence with reflexivity of the dual.
  Consume native `UniformConvexSpace` to prove Milman–Pettis: every
  complete uniformly convex normed space over ℝ or ℂ is reflexive.
  Develop its modulus of convexity, passage to closed subspaces and
  invariance of reflexivity under equivalent norms. Prove Clarkson's
  inequalities and the standard uniform convexity of Lᵖ, 1<p<∞;
  B5 consumes these results.
  First prove that a sequence of unit vectors maximizing the real part
  of a nonzero dual functional is Cauchy by uniform convexity; completeness
  gives norm attainment, then use the preceding James criterion.
* **Krein–Šmulian:** a convex subset of the dual of a Banach space is weak-star
  closed iff its intersection with every closed ball centered at zero is weak-star
  closed. Include the linear-subspace criterion using just the unit ball.
* **Bishop–Phelps:** for a Banach space, norm-attaining continuous linear
  functionals are norm dense in the dual. For a nonzero Banach space, support
  points are dense in the boundary of a nonempty closed convex set, and support
  functionals are norm dense in the dual when that set is also bounded.
  A support functional is nonzero and its real part attains its supremum on the
  set; a support point is such an attaining point. Treat the zero space separately.
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
Own the ambient basic-sequence form as well: if xₙ is basic in a Banach
space X, yₙ∈X need not lie in its closed span, and
`θ=Σ‖xₙ*‖‖xₙ−yₙ‖<1`, then xₙ↦yₙ extends to an isomorphism
`[xₙ]→[yₙ]` with norm≤1+θ and inverse norm≤(1−θ)⁻¹. Construct it as
the isometric inclusion plus `Σ xₙ*(·)(yₙ−xₙ)`, prove convergence,
the lower bound and closed range, and identify that range with [yₙ].

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
Consume BanachAlgebras A8’s finite nonzero-eigenvalue threshold theorem
(whose compact-operator layer is independent of B4), and choose the associated finite or countable
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

The tensor/AP layers precede B4.0's reflexive AP comparison. B4.C’s
generic complexification comparisons use only native complexification
and the AP definitions and precede the complex transport in B4.0; the
Bourgain–Delbaen operator theorem is separate from those comparisons.

### B4.C. Real and complex approximation comparisons

For any real Banach space X, consume
`TauCeti.Analysis.Normed.Module.Complexification`’s actual
`TauCeti.Complexification X`, with its Taylor norm
`‖x+iy‖=sup_θ‖cos(θ)x−sin(θ)y‖`, native scalar action, complete-space
instances, `ofRealLI`, `reCLM`, `imCLM`, `equivProd`, and
`ContinuousLinearMap.complexify` with its exact operator norm. Prove
compactness under complexification, and equivalence of AP, λ-BAP for
λ≥1, and MAP for X and this complexification, using real inclusion/projection
and native complexify. Build the real/complex strong-dual comparison
and prove preservation and reflection of reflexivity. In particular
construct the bounded complex-linear equivalence between
`StrongDual ℂ (TauCeti.Complexification X)` and
`TauCeti.Complexification (StrongDual ℝ X)` by real/imaginary parts and
`φ(x+iy)=g(x)−h(y)+i(h(x)+g(y))` (`exists_complexificationStrongDualEquiv`,
an equivalence whose value on `g+ih` is this φ); pin the norm bounds rather than
asserting an isometry of their different dual norms.
### B4.0. An explicit failure of the approximation property

Prove Grothendieck’s reflexive comparison: a reflexive real or complex
Banach space X with AP has MAP, hence BAP. Pin the norm comparison as follows.
Write A(X) for the operator-norm closure of finite-rank endomorphisms and
identify it isometrically with `X ⊗ε X*` by
`x⊗f ↦ (y↦f(y)x)`. Define the contractive trace-pairing map
`Θ_X : X* ⊗π X → (X ⊗ε X*)*` by
`Θ_X(f⊗x)(y⊗g)=f(y)g(x)`, extending through the specified completions.
Prove the metric criterion `MAP(X) ↔ ∀u, ‖Θ_X u‖=‖u‖π`. The direction
from isometry to MAP is compact-open separation: on bounded sets the
compact-open dual of L(X) is given by trace pairing with `X* ⊗π X`, and
`|⟨u,id⟩| ≤ ‖u‖π`. The direction from MAP to isometry also needs that the
unit ball of L(X) norms `X* ⊗π X` under trace pairing; the dual of
`X* ⊗π X` is L(X,X**), so for reflexive X this is immediate from `J_X`,
and for general X it is B7's local reflexivity, so state and prove the
general-X direction in B7. The reflexive theorem below uses only the
direction from isometry to MAP.
The codomain has the dual of the injective-tensor norm; injectivity alone
is the AP comparison and does not yield the norm-one approximation bound.

Use the integral/nuclear route to the reflexive-case isometry. Construct its
finite-measure density prerequisite here: for a reflexive real Banach space Y,
a finite positive measure μ, and a native `VectorMeasure α Y` m with
`m.variation univ < ∞` and `m.variation ≪ μ`, construct an integrable Bochner
density h with `m = μ.withDensityᵥ h`. Prove a.e. uniqueness and
`m.variation s = ∫⁻ a in s, ‖h a‖ₑ ∂μ` for every measurable s.
Use finite-partition averages of m, scalar Radon–Nikodym domination of their
norms, uniform integrability and the weak-compactness criterion in Bochner
L¹(Y); construct that criterion from reflexivity and weak compactness of
all set-integral ranges before extracting a weak cluster point. Recover m
on every measurable set by partitions containing that set. Treat zero-measure
atoms by zero and use the separable essential range of Bochner functions for
a.e. uniqueness; do not assume Y itself separable. For complex target spaces
use the underlying real Banach space and prove compatibility with complex
scalar multiplication. This uses B1’s weak compactness, Hahn–Banach and bidual
comparisons and the early B5 scalar-measure/Bochner layer, independently of
the present AP-to-MAP conclusion and the later Enflo/BD constructions.

Using B4’s integral-bilinear-form carrier, define the integral endomorphism
ideal on X* and its norm by currying the above trace-pairing dual. Construct
the isometric comparison `A(X)* ≃ I(X*)`. For reflexive X, use scalar
weak-star-dual-ball factorization, the scalar Riesz representation and the
reflexive-target density theorem just assigned to obtain
`I(X*) ≃ N(X*)` with equality of integral and nuclear ideal norms. Give the
actual finite-rank/simple-density approximations and their norm bounds, not
just an algebraic identification. Under AP identify `X* ⊗π X` isometrically
with N(X) through its quotient-norm nuclear map. If u represents T, prove
that Θ_X(u) corresponds to the transpose T′. The canonical reflexive
isometry `J_X : X ≃Lᵢ X**` gives
`T=J_X⁻¹ ∘ T′′ ∘ J_X`; the nuclear ideal inequalities and the two
contractive canonical maps yield
`ν(T) ≤ ν(T′′) ≤ ν(T′) ≤ ν(T)`.
Consequently `‖Θ_X u‖=ν(T′)=ν(T)=‖u‖π`, first on the defining comparisons
and then on the completions, and the metric criterion supplies MAP.
Keep zero spaces in scope by using contractive maps rather than requiring
a map’s norm to equal one. AP without reflexivity still gives no uniform
bound on the approximating finite-rank operators. This fixes the
trace-pairing convention for the integral/nuclear comparison of
[Daws, §2.3, Theorems 2.3.14 and 2.3.23](https://matthewdaws.github.io/files/thesis.pdf)
(printed pp.43–47); the assigned theorem here is the reflexive case.

Construct Enflo’s separable reflexive real counterexample as a closed
subspace of the native `lp (fun m=>C(K_m,ℝ)) 2`, with finite discrete
K_m. Prove reflexivity of this countable ℓ² sum through its dual ℓ²
identification; the finite fibers have supremum norms and the sum need
not be a Hilbert space. Set K_(m,i)=(ZMod2)^(Fin(2n_m)) and
K_m=⨿_(i=1)^k_m K_(m,i), with each copy finite and discrete.
Build Walsh functions on `(ZMod 2)^(Fin (2n))`,
the degree-(n−1)/(n+1) layers, their equal binomial dimensions, permutation
and translation isometries, and the averaged diagonal/normalized-trace
comparison. Construct the incident block families M_m of Enflo’s 1973
paper, satisfying all six of its finite-support, multiplicity, overlap
and equidistribution conditions. Pin
t_m=binomial(2n_m,n_m−1)=binomial(2n_m,n_m+1), and distinguish
the independent generating set M_m from its closed span.
M_(m,i) is its t_m-element subset supported in the ith current block;
N_(m,j) is its t_(m+1)-element subset with nonzero component in the jth
next block. Set σ(e)=#{j:e∈N_(m,j)}, the next-block multiplicity.
Use parameters a,γ with
`1<a<γ` and `a<(γ+2)/(γ+1)`,
`n_m=⌊a^m⌋`, `k_m=⌊4^(γa^m)⌋` beyond a sufficiently large initial
cutoff. Build the cyclic incidence enumeration and prove simultaneous
satisfaction of these conditions from explicit binomial exponential bounds
and floor/error estimates. Pin the quantitative overlap conditions as
`|N_(m,i)∩N_(m,j)|≤2t_(m+1)/n_(m+1)` for i≠j and
`|N_(m,j)∩M_(m,i)|≤min(t_(m+1)/n_(m+1),t_m/n_m)`, and
`Σ_e |1/(k_mt_m)−σ(e)/(k_(m+1)t_(m+1))|≤1/n_(m+1)`.
The pairwise spacing bound μ>n_(m+1) in the cyclic construction gives
at most `1+2⌊(t_(m+1)−1)/(n_(m+1)+1)⌋` intersection points;
prove this is at most `2t_(m+1)/n_(m+1)` beyond the specified cutoff
using the binomial growth bound. This stronger condition is the input
to the trace comparison; it also implies the bound
`t_(m+1)²/n_(m+1)` once t_(m+1)≥2.
For the averaging vector x corresponding to Uf in
span(N_(m,j)∪M_(m+1,j)), set |||x|||=‖x|_(K_(m+1,j))‖∞
and prove its local-to-ambient estimate ‖x‖≤2|||x|||. Prove the Krawtchouk
bound |F_(n−1)(a)|=|F_(n+1)(a)|≤binomial(2n,n−1)/n for
0<|a|<2n, using the coefficient integral of
(1−z)^|a|(1+z)^(2n−|a|). These are the precise Walsh estimates
used by the averaged trace comparison.

Prove the coordinate property
`‖∑_j c_j e_j‖≥‖c_k e_k‖` on the generating independent family;
finite-rank operators can be approximated by finite-expansion finite-rank
operators on that family. For Te_i=Σ_j a_ji e_j define
Tr̃(M,T)=|M|⁻¹Σ_(e_i∈M) a_ii on a nonempty finite generating subset.
Define its unnormalized trace as the same sum without the factor |M|⁻¹.
Prove |Tr̃(M,T)|≤‖T|_(span M)‖ and the corresponding unnormalized
bound with factor |M|, the telescoping trace estimate and trace decay for
finite-rank maps. Write the triangle split with first term
`|k_(m+1)Tr̃(M_m,T)−Σ_jTr̃(N_(m,j),T)|` and second term
`|Σ_jTr̃(N_(m,j),T)−Σ_jTr̃(M_(m+1,j),T)|`. Prove its two bounds
`‖T‖/n_(m+1)` and `4‖T‖/n_(m+1)` after dividing by k_(m+1),
using the local-to-ambient norm comparison. The resulting adjacent trace
bound is `5‖T‖/n_(m+1)`. Derive Enflo’s quantitative theorem: there are
finite-dimensional subspaces E_m with dim E_m≥2 and dim E_m→∞,
and a finite C such that
`‖(I−T)|_(E_m)‖≥1−C‖T‖/log(dim E_m)` for every bounded finite-rank T.
This excludes BAP; reflexivity and the preceding theorem exclude AP.
Derive failure of a Schauder basis from B4’s basis⇒BAP implication,
rather than using lack of a basis to infer failure of AP.

Transport the example to a complex Banach space by the normed
complexification constructed in B4.C; prove reflexivity is preserved and
that complex AP would imply real AP by real inclusion/projection. By
this milestone’s compact-approximation equivalence, construct a compact
S:F→E not approximable by finite-rank maps. On F⊕E construct the compact
endomorphism `(x,y)↦(0,Sx)` and prove it also cannot be approximated by
finite-rank endomorphisms, using its coordinate inclusions and projections.
This gives the operator-on-one-space counterexample as well as the
more general between-spaces failure.

### B4.1. Bourgain–Delbaen spaces and the scalar-plus-compact example

Construct the Argyros–Haydon real Banach space X_K as the closed span of
its biorthogonal vectors in native bounded functions `lp (fun _ : Γ=>ℝ) ∞`.
Build the generic Bourgain–Delbaen construction first: countably many
finite rank layers Γ_q, triangular `d_γ*=e_γ*−c_γ*` in native ℓ¹(Γ),
its basis projections and biorthogonal vectors, compatible finite-coordinate
extension maps i_q, their norm bound `(1−2θ)⁻¹` for θ<1/2, and the
finite-dimensional decomposition. Prove finite-coordinate recovery, the
closed-span description, projection identities and ℒ∞ finite-dimensional
models. Identify the dual with ℓ¹ when the decomposition is shrinking;
a triangular ℓ¹ basis alone does not give this identification.

Prove the finite blocking lemma of Maurey (part i) and James (part ii) in
Argyros–Haydon Lemma 2.2: for N=n^k unit vectors, the uniform signed-sum
lower bound (n−ε)^k yields successive combinations equivalent to the
ℓ¹_n basis with constant (1−ε)⁻¹; the uniform signed-sum upper bound
(1+ε)^k yields ℓ∞_n combinations with constant 1+ε. Prove the
successive-support constructions and constants, then use these in the
primal and dual finite-average arguments. Establish the rational-coordinate
reduction of Lemmas 7.1–7.2 with its perturbation/error bounds before
applying the operator-distance construction.

Construct the mixed-Tsirelson norming sets on finite-support functions,
their completion and implicit-norm comparison, successive-block and
finite-average estimates. For X_K use the finite rational nets, weight,
rank, age and injective odd-weight coding of Argyros–Haydon Definition 4.4;
use the positively indexed base sequences
`M_j=2^(2^j)` and `N_j=2^(2^(j²+1))`, `j≥1`, or an increasing
subsequence `m_j=M_(s(j))`, `n_j=N_(s(j))` with strictly increasing
`s : ℕ+ → ℕ+`. Thus the first base pair is `(4,16)`; no index-zero
weight is used. Prove `m₁≥4`, `n₁≥16`, `m_(j+1)≥m_j²` and
`n_(j+1)≥m_(j+1)²(4n_j)^(2^(j+1))` for every `j≥1`,
including their inheritance by every such subsequence. These are the
parameters used in Assumption 2.3 and the Lemma 2.4 average estimates.
Prove recursive finiteness, the
evaluation-analysis formula, all even-weight extensions and the odd-weight
tree comparison. Develop rapidly increasing sequences (RIS), local support,
bounded and increasing local-weight splittings, the basic inequality and
finite-average upper/lower estimates. Prove that annihilation on all bounded
RIS implies annihilation on every bounded block sequence. Here finite block
support and range refer to the BD basis/FDD; an ambient bounded function
on Γ can have infinite pointwise support. Define local support only after
restriction to a finite Γ_q, and prove its relation with FDD projections.
Use this to prove
shrinking, the ℓ¹ dual identification and the block compactness criterion.

Build ℓ¹ averages, exact pairs and dependent sequences; prove the near-pair
criterion for hereditary indecomposability, with HI quantifying over
infinite-dimensional subspaces (finite-dimensional spaces satisfy it
vacuously). Prove every infinite-dimensional closed subspace Y contains
seminormalized vectors y_k∈Y with Σ_k‖y_k−x_k‖ arbitrarily small, where (x_k)
is a seminormalized C-RIS of finitely supported rational-coordinate blocks.
First use the gliding hump to approximate a basic sequence in Y by blocks u_j
with summable errors to the vectors v_j∈Y. In [u_j] construct the ℓ¹ averages of Lemma 6.2,
then obtain an RIS through Lemma 6.4/Corollary 6.5; rational approximation
must preserve their bounds with the chosen slack. Transfer each finite
average x_k=Σ c_j u_j to Σ c_j v_j∈Y using the coefficient bound
`Σ|c_j|‖u_j−v_j‖≤(2K/inf‖u_j‖)‖x_k‖Σ_(j in its block)‖u_j−v_j‖`.
Here set y_k=Σ c_j v_j; these are the RIS approximants in Y,
distinct from the original gliding-hump vectors v_j. Prescribe the
start of each RIS support arbitrarily far out; allow every C>2 and
rational approximants with the same range and explicit slack.
Local-weight splitting does not preserve proximity to Y and is not this
construction. The blocks themselves need not lie in Y. Apply B3's ambient small-
perturbation theorem to obtain U:closure(span x_k)≃closure(span y_k)
with Ux_k=y_k. For bounded real T:Y→X_K apply the rational-block
estimates to T∘U. Prove `dist(Ty_k,ℝy_k)→0`, transferring the estimates
through U and its summable errors. Extend the
exact-pair/dependent-sequence estimates to operators with this domain,
and interleave RIS in Y to prove one common real λ. Prove
T−λ inclusion:Y→X_K is strictly singular: a subspace on which it is
bounded below would contain such a perturbed seminormalized RIS, contradicting
the estimate. Prove uniqueness of λ. This real subspace theorem is a
property of this construction, not a consequence of real HI alone.
For operators on all X_K prove the
quantitative contradiction using `‖z‖≤48C/m²`,
`‖Tz‖≥δ/(4m)` and `m>256C‖T‖/δ`: these imply
`‖Tz‖≥δm‖z‖/(192C)>‖T‖‖z‖`. Prove the
associated scalars converge to one common λ by pairing and interleaving RIS;
the block compactness criterion then gives `T=λI+K`, K compact. Supply
uniqueness, linearity, multiplicativity and the norm bound of T↦λ.
This is a theorem about operators on all of X_K, not an assertion that
strictly singular operators on arbitrary subspaces are compact.

Apply B4.C to X_K to obtain a complexification with dual isomorphic to ℓ¹(Γ,ℂ).
Decompose the real and imaginary parts of every complex-linear operator
on this space into their real scalar-plus-compact forms to prove its
complex scalar-plus-compact theorem. Retain hereditary indecomposability
as a proved property of the real construction; it is not inferred for
an arbitrary complexification.

Identify the real and complex operator-algebra quotient by compact
operators with the corresponding scalar field, with quotient-norm equality
and a bounded scalar projection. Derive countability of every operator’s
spectrum on the complex model, using BanachAlgebras A8’s compact eigenvalue-threshold
theorem. Thus not every nonempty compact subset of ℂ can be realized on
this particular infinite-dimensional Banach space. Construct a nontrivial
closed invariant subspace for each operator on the complex model, applying A8’s compact-commutation
theorem for nonscalar operators and an invariant line for scalar operators.
For the real model, consume A8's real compact-commutation invariant-subspace
theorem (its compact case is Aronszajn–Smith), again handling scalar operators
by a line. No real hyperinvariance statement is inferred from the complex
hyperinvariant theorem.
For a blocking l_(n−1)+1<l_n and finite-dimensional
F_n⊆⊕_(l_(n−1)<k<l_n)M_k, prove the closed sum W is reflexive and
W* is hereditarily indecomposable. Build its dual FDD, the quotient
X_K*→W*, block-supported Hahn–Banach lifts, dual exact pairs and
dependent sequences, and their quantitative HI estimates. Derive a
conditional basis (d_n*) of ℓ¹ and k₁<k₂<… such that
ℓ¹/closure(span{d_n*:n∈M}) is HI whenever M⊆ℕ contains
infinitely many intervals (k_p,k_(p+1)]. Pin the dual-lifting lemma
with coefficient 4m_(2j) and its norm/error bound, deriving it from
the coordinate net rather than the inconsistent coefficient in its proof.
State its low-coordinate annihilation after the restriction/quotient
R:X_K*→W*, with the supplied ℓ¹ dual comparison. It is not a claim
that the corresponding raw ℓ¹ functional has zero low-coordinate projection.

Construct infinite Ramsey for finite colourings of [ℕ]^k, its nested
subsequence diagonalization and rational coefficient nets. Use these to
prove the Brunel–Sucheston spreading-model existence theorem with uniform
finite-pattern limits. Build spreading models of normalized weakly null basic sequences,
their domination relations and Krivine sets: for a subsymmetric spreading
basis and every n,ε, the ℓᵖ_n comparison must use successive blocks
with one common finite coefficient pattern, with two-sided bounds
(1+ε)⁻¹ and 1+ε. Unrestricted block finite representability does not
replace this identically distributed condition. Prove James's ℓ¹ blocking
lemma for a subsymmetric basis equivalent to ℓ¹: for every n≥1 and
ε>0 there exist normalized successive blocks with one common finite
coefficient pattern whose first n terms are (1+ε)-equivalent to
the ℓ¹_n basis. Thus 1 belongs to its
Krivine set. Prove Elton near-unconditionality and the bounded-oscillation
subsequence theorem over real scalars: for a normalized weakly null sequence and fixed
d,D≥1, obtain a basic subsequence and C≤8d+ε such that
`‖Σ_(i∈F) a_i x_i‖≤C‖Σ_i a_i x_i‖` whenever the finite set F has
coefficient oscillation≤D and a successive Schreier decomposition into
blocks of oscillation≤d. Construct the finite-colouring/open-Ramsey
selection and Matching Lemma used in Dilworth–Odell–Schlumprecht–Zsak,
*Partial Unconditionality*, Theorems 2.1–2.2. Index these sequences by
positive integers, identifying them with native ℕ by n↦n+1, so a single
nonempty Schreier block always satisfies 1≤min F. Prove open/closed
Ramsey for the product topology on infinite subsets: every infinite L
has infinite M⊆L with [M]^ω contained in a given open or closed set
or its complement. Own these auxiliary results:
a thin family means no pair is related by proper initial segment. Prove
the support-specialized witness selection below makes its family {A_M}
thin; for a thin
family A and finite colour set S_k at each minimum k, stabilize a colouring
on each equal-minimum fibre after an infinite restriction. For continuous
assignments of n successive nonempty finite blocks F_j^M⊆M, construct
L,M with corresponding blocks comparable by initial-segment order ≺ and
`L∩M=union_j(F_j^L∩F_j^M)`. The variable-block Schreier version assumes
a continuous finite thin witness A_M, block count n_M≤min A_M=min F_1^M,
and union_j F_j^M⊆A_M, with identical decompositions when A_M agrees;
prove equal block counts
and the same matching conclusion. Here ≺ is not numerical successive-set <.
For a witness relation with nonempty values in a disjoint union of sets Ω_r,
whose level-r choices depend only on the first r membership coordinates,
construct a continuous selection into the discrete witness set by the first
nonempty level and a fixed well-order there. For the thin-family
application require each witness a∈Ω_r to have nonempty finite support
A(a) with max A(a)=r, and require eligibility for M to mean exactly
A(a)⊆M together with a fixed witness condition independent of M.
Set A_M=A(φ(M)) for the least-level selected witness. If A_L is an
initial segment of A_M, then φ(L) is eligible for M, so least-level
selection gives r(M)≤r(L). Inclusion gives r(L)≤r(M); equal
maxima and the initial-segment relation force A_L=A_M. Thus {A_M}
is thin under these extra support hypotheses. If A_L=A_M=A,
each selected witness is eligible for the other infinite set at the same
level max A; the fixed well-order forces φ(L)=φ(M). Hence their
decompositions F_j^M, read off the selected witness φ(M), are identical,
as required by the variable-block
Schreier lemma. General continuous selection alone is not claimed to
imply thinness. Finally, for continuous
`f:[ℕ]^ω→c₀` in the pointwise topology such that every sequence in its
image has a cluster point in c₀, prove every ε>0 and infinite M
admit infinite N⊆M with `Σ_(i∈N\P)|f(P)(i)|≤ε` for every infinite
P⊆N. Prove this tail lemma by Ramsey thinning and the c₀ cluster-point
contradiction. These are the actual thin-family stabilization, Schreier
Matching, continuous-selection and c₀-tail inputs to the bounded-oscillation
proof. At d=D=2 a single block
gives AOST's uniform dyadic-band estimate (36) with C=16+ε independent
of the band index. Prove the (D,d) property passes to subsequences,
using preservation of Schreier admissibility under k_i≥i; ordinary near-unconditional constants depending on
the threshold alone do not establish that uniform bound.
Prove Androulakis–Odell–Schlumprecht–Tomczak-
Jaegermann Theorem 5.4 over real scalars: if X contains two normalized weakly null basic
sequences, the first with spreading model not equivalent to ℓ¹ and the
second with 1 in its spreading model's Krivine set, then there are a
closed subspace Y⊆X and bounded T:Y→X such that T−λ inclusion is
noncompact for every scalar λ. Build the successive-block domination,
Schreier unconditionality and bounded sequence-map extension used in
that proof. Pin its cardinality families G_n={F:#F≤M_n}, the small
coefficient supremum norm sup_n δ_n Σ_(i∈F)|a_i| and the two
Lemmas 5.2/5.3 upper/lower domination constructions. Keep the lower
estimate's 1/9 constant, rescaling the resulting y_i by 9 to obtain
the normalized domination before defining T(y_i)=x_(m_i).
State the quantitative inputs before the sequence-map extension: the
Brunel–Sucheston thinning compares a sequence with its spreading model
within factor 2 on every finite pattern supported on F⊆[n,∞) with
|F|≤n2ⁿ. Prove Odell's 3-Schreier suppression bound for a weakly null
basic subsequence on S₁={F:|F|≤min F}, using the finite-pattern
functional-witness Ramsey thinning and weak-null tail estimates. For the
integers K_n first replace them by max_(m≤n) K_m, then
reindex by k_i≥iK_i; derive the bound 3 for
families |F|≤nK_n with n<min F. This is the actual stronger Schreier
input, distinct from fixed-cardinality N^(≤n) unconditionality.
In Lemma 5.3 construct `y_j=Σ_n δ_n w_j^(M_n)` with norm-convergent
series. For |G|≤M_n use only its level-M_n family, whose finite groups
are 3-equivalent to ℓ¹; the second suppression factor 3 gives
`‖y+Σa_jy_j‖≥(δ_n/9)Σ_(j∈G)|a_j|`. Require the supporting family F
to satisfy |F|≤M_nK_(M_n) and M_n<min F. Keep M_n in both the
construction and the lower estimate; the source's lower display w_j^n
does not provide this M_n-wise bound.
Prove the basic interleaving selection under these construction hypotheses,
so x_(m_i)−λy_i is seminormalized and weakly null for every scalar λ.
Apply the RIS and rank-layer sum sequences in X_K: the rank-layer sums
are uniformly bounded by the extension-map norm and weakly null as
bounded blocks of the shrinking FDD. Prove their ℓ¹ spreading-model
lower bound and normalized upper bound before applying Theorem 5.4, and
combine with the HI scalar-plus-strictly-singular theorem for maps
Y→X_K, to obtain a strictly singular noncompact map.
For the stronger endomorphism instance, first construct the universal
mixed-Tsirelson basis e_i for Assumption 2.3, its 1-subsymmetry and weak
nullity, using norming-tree bounds and the shrinking/averaging estimates.
Prove the RIS upper estimate `‖Σ a_i x_i‖≤10C‖Σ a_i e_i‖_T` and,
from Lemma 2.4, the n_j-average bound≤10C/m_j; this shows the RIS
spreading model is not ℓ¹-equivalent. Apply Lemma 5.2 to e_i before
choosing the AH domain, then Lemma 5.3 to the rank-layer sequence.
It produces vectors z_i such that `‖Σ a_i e_i‖_T≤C₀‖Σ a_i z_i‖`;
1-subsymmetry removes the subsequence indices on e_i. Set Y=closure(span z_i).
Choose cutoffs r_i with `‖P_(≤r_i)z_i‖≥(1/2)inf_j‖z_j‖`, then
normalized y_i∈Y approximating a C-RIS x_i with summable errors,
each x_i supported beyond r_i. The z_i supplied by Lemma 5.3 may be
infinite sums, so no finite-support hypothesis is imposed on them. The estimate
`‖Σ a_i y_i‖≤10CC₀‖Σ a_i z_i‖+(Σ‖y_i−x_i‖)sup|a_i|`, together
with bounded coefficient functionals for z_i, proves the map z_i↦y_i
extends to a bounded endomorphism of Y. The uniformly bounded FDD
projections P_(≤r_i) show y_i−λz_i is eventually seminormalized for every λ≠0,
since P_(≤r_i)x_i=0 and the approximation errors tend to 0;
for λ=0 use normalization. Prove z_i is weakly null: each fixed-level
(w_j^(M_n))_j is a bounded block sequence of the shrinking FDD, the
levels have one uniform norm bound, and Σδ_n<∞ controls the infinite
series tails uniformly. Thus every scalar
perturbation is noncompact. Subtract the scalar supplied by the real
subspace theorem to obtain a strictly singular noncompact endomorphism.
This argument constructs the domain after universal domination; it does
not assume the original rank-layer sums dominate every RIS.
For the finite rank-layer lower bound use minF≥2j, #F<2n_(2j), and
choose a separated subset of at most n_(2j) coordinates carrying at
least one-quarter of the absolute coefficient sum; prove the sign
selection and evaluation-analysis estimate.
Construct a continuum almost-disjoint family of parameter subsequences, all satisfying
Assumption 2.3; use the positively indexed base sequence fixed above
and increasing subsequences, with the inherited initial-index and growth
estimates. Construct their Bourgain–Delbaen spaces;
prove every operator between distinct members is compact, with their
incomparable ℓ¹-predual weak-star topologies.

Prove the weakly-unconditionally-Cauchy criterion: a Banach space
contains no copy of c₀ iff every series with uniformly bounded signed
finite partial sums converges unconditionally. Prove Rosenthal's ℓ∞
operator lemma: if S:ℓ∞→Z is bounded and inf_n‖S e_n‖>0, some
infinite-coordinate restriction is bounded below and embeds ℓ∞.
Use these in the operator-space lemma: if X*,Y contain no c₀,
W(X,Y)=K(X,Y), and K(X,Y) is separable, then K(X,Y) contains no c₀.
An assumed c₀ operator sequence extends by its unconditional sums on
X** to ℓ∞→W(X,Y); adjoint sums in X* prove weak*-to-weak continuity.
Rosenthal's lemma contradicts separability. Instantiate for X=Y=X_K:
weakly compact operators are compact by scalar-plus-compact and
nonreflexivity; the shrinking basis/AP and separable dual imply K(X_K)
is separable by finite-rank density. The HI property excludes c₀ in X_K,
and the Schur property excludes c₀ in X_K*≃ℓ¹. This route is adapted
from Emmanuele's operator-space argument.

In bounded/compact operator spaces construct complemented rank-one
copies of X_K and X_K*. The preceding lemma and L(X_K)=K(X_K)⊕ℝI
prove neither operator space contains a copy of c₀. Prove the
compact-operator/injective-tensor identification and unconditionalization
of a basic sequence. Show `(e_γ*⊗d_γ)` spans a reflexive space with an
unconditional basis: establish the two-sided operator/unconditionalized
norm bounds and first prove James's unconditional-basis dichotomy: a nonreflexive
Banach space with an unconditional basis contains c₀ or ℓ¹, with a
block-subsequence realization. Exclude both ℓ¹ and c₀ skipped-block
sequences using
the RIS estimates. Supply the c₀ case as well as the displayed ℓ¹ proof.

A1/A8’s needed quotient/compact layers are independent of B4’s tensor and
approximation targets.

## B5. Function spaces and weak compactness

For `𝕜=ℝ` or `ℂ` and any index type S, use the native Hilbert space
`lp (fun _ : S => 𝕜) 2`, with `lp.completeSpace` and its existing inner
product. The source's first-linear pairing `Σ x_s conjugate(y_s)` is
native `⟪y,x⟫`; use the native convention in the coefficient maps below.
Inside it construct the submodule D_S of finitely supported
vectors, and the linear identification with `S→₀𝕜` given by finite sums
of `lp.single 2 s a`. D_S carries the inherited ℓ² norm. Consume
`lp.hasSum_single` to prove D_S dense, and identify its normed completion
isometrically with this same native lp space, including the extension and
uniqueness maps. Prove every lp vector has countable support by the finite
level sets `{s:‖x_s‖≥1/n}`, n≥1; countable support alone is not the
square-summability condition.

For infinite S choose distinct s_n and use the partial sums of
`Σ_n 2^(−(n+1)) • lp.single 2 s_n 1` to show D_S is not complete:
the ambient limit has infinite support. For finite S prove D_S is the whole
space. For distinct s,t the coordinate unit vectors have distance √2;
prove this makes lp(S,𝕜,2) nonseparable when S is uncountable. In the
countable case use finite supports with rational coefficients (Gaussian
rational coefficients over ℂ) to construct a countable dense set. Thus
lp(S,𝕜,2) is separable exactly when S is countable. This corrects the
source's finitely supported `[0,1]` example: its complete Hilbert space
is lp on the uncountable interval index set. It is distinct from the
Lebesgue/a.e. carrier L²([0,1],𝕜); no point-evaluation on that L² is inferred.

For a complete real or complex inner-product space consume native
`exists_hilbertBasis` and `HilbertBasis.repr`. Prove it is separable iff
the index type of a Hilbert basis is countable, using the same separated
unit-vector and finite-sum arguments. For a separable infinite-dimensional
space, prove that index type countably infinite, choose an equivalence
with ℕ and reindex the basis. Construct the
resulting linear isometric equivalence with lp(ℕ,𝕜,2), with coefficient
map `x↦(⟪b_n,x⟫)_n` and inverse `c↦Σ_n c_n • b_n`, including convergence
and both inverse identities. For two such spaces, compose their coefficient
maps to obtain the unitary equivalence; state its dependence on the chosen
bases and preserve the actual scalar field. Finite-dimensional and zero
spaces use their finite/empty bases separately. The following explicit
Fourier equivalence remains a specified choice, with its own formulas.

Prove the arbitrary-cardinality classification as well. For Hilbert bases
`b : HilbertBasis ι 𝕜 H` and `c : HilbertBasis κ 𝕜 H`, prove
`Cardinal.lift (#ι) = Cardinal.lift (#κ)` in a common universe. For each j,
the coefficients of c_j in b have countable support. Prove that their union
over j covers ι: an omitted b_i would be orthogonal to every c_j and hence
zero. If κ is infinite this gives `#ι≤#κ·ℵ₀=#κ`; reverse the argument
when both indices are infinite and use cardinal antisymmetry. If either index
is finite, use `HilbertBasis.toOrthonormalBasis` and finite-dimensional
orthonormal-family bounds to prove both finite with equal cardinality.
Include empty indices and the zero space. Define the resulting basis-independent
cardinal as the Hilbert dimension; it agrees with `finrank` in finite
dimension. Its definition uses complete orthonormal bases; do not substitute
algebraic Hamel dimension (`Module.rank`) in the infinite-dimensional case.

For complete H and K over the same field and chosen Hilbert bases indexed
by ι and κ, prove `Nonempty (H ≃ₗᵢ[𝕜] K)` iff their index cardinals agree,
with universe lifts as above. Given an index equivalence e, construct the
coordinate-reindexing isometry of the native lp spaces and compose it with
the two `HilbertBasis.repr` maps; prove the resulting unitary sends b_i to
c_(e i). Conversely transport a Hilbert basis along a unitary and use basis
cardinality invariance. Deduce that the Hilbert dimension of lp(S,𝕜,2) is
`#S`, and that separable spaces are classified by dimension 0, a positive
finite integer, or ℵ₀. In particular the assertion that all separable Hilbert
spaces are isomorphic requires equal dimension; ℝ and ℝ², or ℂ and ℂ²,
are counterexamples over their respective fields.

[HilbertBasisSuggested.lean](HilbertBasisSuggested.lean) records suggested
forms for basis equivalence and the basis-preserving unitary statements.
This Hilbert-basis layer uses only native inner-product and cardinal APIs
and the lp support lemmas above, independently of the later measure-duality
and spectral applications in B5.

Construct the explicit complex unitary `ℓ²(ℕ,ℂ)≃L²([0,1],ℂ)` using native
`fourierBasis` on UnitAddCircle, its a.e. unit-interval/Haar comparison,
`HilbertBasis.repr` and a fixed enumeration ℕ≃ℤ. For the real unitary
`ℓ²(ℕ,ℝ)≃L²([0,1],ℝ)`, construct the orthonormal trigonometric
basis indexed by ℕ: index 0 is the constant 1, index 2n−1 is
`√2 cos(2πnt)` and index 2n is `√2 sin(2πnt)` for n≥1. Prove
orthonormality and completeness by comparison with the complex Fourier
basis, then use its real `HilbertBasis.repr`. Values at interval
endpoints are not invariants of L² classes. Prove completeness with the
specified norms for the ten examples c₀, C₀(ℝ), C¹[0,1], C²[0,1],
Lip[0,1], C^(0,α)[0,1] (0<α<1), W^(1,1)(0,1), weighted ℓ¹,
B(ℓ²) and L¹[0,1]⊕₁L²[0,1]. Use sup/derivative-sup sums for C^k,
sup plus Lipschitz/Hölder seminorm for Lip/C^(0,α), and
`‖u‖_1+‖u'‖_1` on PDE Lane A item1's weak W^(1,1) carrier. Prove the
closed weak-derivative graph/completeness and its absolutely-continuous
representative comparison on this interval.
Distinguish the smooth C¹ carrier with its L¹ graph norm from this complete
weak W^(1,1) carrier. On smooth C¹[0,1] prove differentiation to L¹ is
unbounded for the L¹ domain norm, using tⁿ with norms 1/(n+1) and 1.
Differentiation to the sup-norm range is also unbounded for the L¹ graph
domain norm, by continuous triangular derivative bumps and their primitives.
Prove the valid FTC bound `‖f‖∞≤‖f‖₁+‖f′‖₁`, which controls f,
not f′. Smooth approximations to |t−1/2| prove C¹ is incomplete with
its sup norm and its L¹ norm; prove the graph-L¹ norm completion is
the weak W^(1,1) space, while the usual sup/derivative-sup C¹ norm is complete.
Full C^(0,α) is complete;
B5 owns the interval little Hölder space h^(0,α)[0,1] as the
C^(0,α)-norm closure of C¹[0,1], and proves it consists exactly of
functions with vanishing small-scale Hölder modulus. Construct its
closed-subspace Banach structure and compare with the boundaryless PDO P5
carriers only where those hypotheses apply.
Use positive weights for weighted ℓ¹ and the sum norm for the product.
On these actual carriers compute the operator norms: derivative
C¹[0,1]→C[0,1] has norm 1 (upper bound and oscillatory witnesses),
Volterra on C[0,1] has norm 1, and for `φ∈L∞[0,1]` the
induced multiplication operator on Lᵖ[0,1] has norm equal to the
essential supremum `‖φ‖∞` for every 1≤p≤∞, and the bilateral shift on ℓᵖ(ℤ) and
half-period composition on Lᵖ[0,1], for every 1≤p≤∞, have norm 1.
Prove the half-period map is measure preserving
and its induced operator is an isometric involution on a.e. classes.

This milestone uses arbitrary measure spaces for Lᵖ, 1<p<∞, and
finitely additive global-L∞ duality, σ-finite spaces for the native-global L¹/L∞ duality,
the separately constructed local-Haar L∞ endpoint below for arbitrary regular Haar measure,
and finite regular measures for the compact-space Riesz comparison. For compact Hausdorff
`K` with its Borel measurable structure, develop the Banach-space duality between `C(K,𝕜)` and
finite regular scalar Borel measures, with the total-variation norm, evaluation
measures and the weak-star topology. Use the submodule of
`MeasureTheory.VectorMeasure K 𝕜` with finite regular variation, normed by
`(ν.variation Set.univ).toReal`; compare with native `SignedMeasure` and
`ComplexMeasure`. Use native `VectorMeasure.variation_smul` for scalar
closure and norm homogeneity, with SA-B83's regularity comparisons.
For the signed measure δ₀−δ₁ on [0,1], with A={0,1}, prove
|μ(A)|=0 but the supremum of |μ(K)| over compact K⊆A is 1 (and so is the supremum of μ(K)).
Thus unsigned inner regularity cannot be applied to signed/complex values;
use the positive variation measure and the preceding regularity comparison.

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
Extend this finite-regular-variation measure space to every locally compact
Hausdorff Borel space X, using the same native scalar vector-measure carrier
and norm, and prove completeness without assuming X compact or σ-compact.
Let X⁺=OnePoint X. Extend measures by zero at infinity along the canonical
open embedding X→X⁺ and prove this is a linear isometry from M(X) onto
`{ν∈M(X⁺) : ν({∞})=0}`. Construct its inverse by restriction to X;
prove both maps preserve regular total variation, the total-variation norm
and the integration pairing for compactly supported continuous functions.
Use compact approximation for the zero extension's regularity and the
singleton variation identity for the restriction: ν({∞})=0 implies
|ν|({∞})=0. The singleton evaluation ν↦ν({∞}) is bounded by ‖ν‖,
so its kernel is closed in the already complete compact-space M(X⁺).
Transport completeness through this isometry. Include empty and already
compact X, and compare with the preceding M(K) construction when X=K.

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
Construct the isometric duality `(L¹(μ))*≃L∞(μ)` for σ-finite μ by the integral pairing,
with indicator tests and Radon–Nikodym densities giving surjectivity and the
essential-bound norm equality. For 1<p<∞ and q=p/(p−1), on native
scalar Lp spaces over an arbitrary measure μ prove the isometric linear
duality `(Lᵖ(μ))*≃L^q(μ)` by φ_g(f)=∫fg, bilinear without conjugation.
Consume B2's Clarkson inequalities and `UniformConvexSpace` instances;
B2's norm-attainment theorem and the derivative of the p-norm identify
every functional with g=‖φ‖|f|^(p−2)conjugate(f) at a normalized
maximizing f. At f=0 the pointwise expression is zero. Prove the
differentiation/domination, Hölder and exact-norm statements on actual
a.e. classes; this proof requires no σ-finiteness. Include zero measure
and zero functional and uniqueness almost everywhere.
**B5.LocalHaarDual — the local-null Haar endpoint.** For a locally compact Hausdorff topological group G with its Borel measurable space and a nonzero regular left Haar measure μ, and scalars 𝕜=ℝ or ℂ, construct the following separate Banach space. A Borel function is locally essentially bounded if one finite bound works almost everywhere on every finite-μ-measure Borel set. Identify two such functions when they agree almost everywhere on every such set. Define the norm as the infimum of the common bounds, and prove that the bound at this infimum holds locally, using the countable bounds M+1/n on each test set. Call the resulting normed quotient `LocalHaarLInfinity 𝕜 μ`. Its integral pairing is bilinear, without conjugation, `⟨[g],f⟩=∫f g dμ` for native `MeasureTheory.Lp 𝕜 1 μ`. Construct the linear isometric equivalence
`LocalHaarLInfinity 𝕜 μ ≃ₗᵢ[𝕜] NormedSpace.Dual 𝕜 (MeasureTheory.Lp 𝕜 1 μ)`.
Define addition, scalar multiplication, conjugation, pointwise multiplication and constants on the quotient and prove their representative independence. Supply the norm bounds, unit norm1, complex C*-identity and the real lattice/absolute-value comparisons by finite-test restrictions or the component model below. The zero class is exactly local nullity. Give bounded restriction maps, the displayed bilinear pairing/evaluation equations, and its order/positivity compatibility for real scalars. Prove compatibility with positive Haar rescaling and group/coset transport; keep the rescaled L¹ norm and integral pairing factors explicit. These are basic APIs of the introduced carrier, not a second harmonic or invariant-mean theory.

No sigma-compactness, sigma-finiteness, countability of the dual or second countability of G is a standing hypothesis. This extends the preceding sigma-finite endpoint with a different carrier; it does not identify arbitrary native global `Lp 𝕜 ∞ μ` with this dual.

Use the following explicit decomposition and gluing proof. Choose a symmetric compact identity neighbourhood and let H be the union of its finite powers, an open sigma-compact subgroup. H is also closed. Index the disjoint open left cosets by a set J; no quotient-group structure or normality is assumed. Choose representatives and transport the restricted measure on each coset to H by left translation. Each restricted measure μ_j is sigma-finite. Consume only the early raw Haar support/localization and Baire/null-envelope contract of AmenableGroups7.1, with its actual locally finite and finite-set compact-inner-regular hypotheses, not its later global-L∞ means, smoothing conclusion or amenability theorem. Its finite-level-set compact approximation puts each integrable function, modulo a global null set, on a countable union of compacts; each compact meets finitely many open cosets. Apply the same argument to a finite-measure Borel test set. This gives the precise countable-coset concentration needed below without declaring G sigma-compact or taking an arbitrary uncountable union of null sets.

Construct restriction as a linear isometric equivalence from `Lp 𝕜 1 μ` to the native dependent `lp (fun j ↦ Lp 𝕜 1 μ_j) 1`, with norm the sum of the component norms. In the inverse direction the summable norm family has countable nonzero support; choose Borel representatives only for those components, glue on their countable union of clopen cosets and put zero elsewhere. Prove integrability, both inverse laws and the sum-of-norms formula. Native `lp.hasSum_single` supplies convergence of finite-coordinate sums. This is an actual restriction/extension construction on a.e. classes, not a presumed uncountable product-measure identity.

Restriction on the local quotient gives an isometry to the native bounded family `lp (fun j ↦ Lp 𝕜 ∞ μ_j) ∞`. Prove the local norm is the supremum of the component norms. For the reverse inequality, first concentrate each finite-measure test set on countably many cosets modulo a null set, then use only the countable union of its component exceptions. For surjectivity the bounded component family requires a genuine globally Borel representative; an arbitrary uncountable pasting of Borel functions is not that proof. Here is a uniform-complexity construction. On each coset choose a compact exhaustion and form a finite regular measure
`ν_j=Σ_n 2^(-n-1)/(1+μ_j(K_n)) · (μ_j.restrict K_n)`.
Show it is equivalent to μ_j; prove its finite regularity by finite-prefix compact approximation and a summable tail bound. For a common bound M, use finite-measure bounded-continuous-function density to approximate a representative of the component in L¹(ν_j) by a sequence of continuous functions. Clip to the closed scalar ball of radius M; clipping has error at most twice the original error when the target has norm at most M. Choose summable L¹ errors. Tonelli for the nonnegative error series on this finite measure proves convergence to the desired representative ν_j-a.e., hence μ_j-a.e. Every approximant is continuous and bounded by the same M. Treat M=0 separately.

For each natural n, paste the n-th continuous approximants over all clopen cosets. The result is a globally continuous function bounded by M: continuity is local on the disjoint open cover. Form the global pointwise real limsup, and in the complex case the real and imaginary limsups, then apply the radial clipping map to the resulting scalar: leave z unchanged when ‖z‖≤M and otherwise send it to (M/‖z‖)•z. The real and imaginary limsups are each bounded by M; radial clipping, rather than separately clipping coordinates, restores the complex norm bound M. These are Borel functions because limsup uses only countably many operations. On each coset the result agrees μ_j-a.e. with that component. The earlier countable-coset concentration on each finite-measure test set proves the required local-a.e. comparison. No assertion that the union of all component null sets is globally null is made. This proves surjectivity of the quotient-to-family map and completeness of the local quotient. It also proves that the version defined using locally Borel functions gives the same local quotient: on each sigma-finite coset a locally Borel function is Borel, and the same representative construction applies.

Apply the preceding sigma-finite L¹ duality separately on each coset. Reuse the existing native `ContinuousLinearMap.lpPairing` (Holder.lean) for the scalar integral maps and `lp.dualPairing` (lpHolder.lean) for the uniformly bounded dependent-family pairing, with exponents ∞ and1, actual Hölder-conjugacy and scalar/completeness hypotheses. Their bounded-map constructors alone do not assert endpoint surjectivity. Identify the dual of the dependent ℓ¹ sum with the uniformly bounded family of component duals: restriction to the component inclusions has norm bounded by the original functional, and summing the component pairings gives the inverse with bound M times the sum of norms. The finite-coordinate sums are dense, so these maps are inverse; single-coordinate tests give the exact norm. Composing these explicit isometries proves the displayed local-Haar dual theorem. Recover its inverse by the integral pairing, not merely by an abstract isomorphism. Prove independence of representatives, the chosen open subgroup and its coset representatives by equality of this pairing with every L¹ test. This also supplies the canonical comparison maps between different decompositions.

Construct the natural contractive surjection `Lp 𝕜 ∞ μ →L[𝕜] LocalHaarLInfinity 𝕜 μ`, with kernel exactly the globally represented classes that vanish locally. The Borel gluing above supplies a globally bounded representative for every local class. Under the additional hypothesis `SigmaFinite μ`, use a countable finite-measure exhaustion to prove local nullity equals global nullity and upgrade this map to the isometric equivalence with native global `Lp 𝕜 ∞ μ`. Do not assert injectivity or norm equality for the global-to-local map at arbitrary Haar generality. State the same comparison for completed Haar conventions via Borel a.e. representatives, with its actual null ideals explicit.

Prove that left translations descend to linear isometries of the local quotient and satisfy
`⟨L_x g,f⟩=⟨g,L_(x⁻¹) f⟩`, where `L_x f(y)=f(x⁻¹y)`. The integral is well defined by the L¹ countable-coset localization and the local bound. For bounded continuous functions the supremum norm equals the local essential norm, since any strict pointwise lower bound persists on an open set containing a compact subset of positive finite Haar mass. These facts supply the source local weak-star and continuous-representative interfaces used by A7. They add no local-dual prerequisite to AmenableGroups7's already stated global-carrier mean theorem. The B5 sigma-finite endpoint and native/raw Haar contract precede this new unit; later source translations consume it.

Construct `(L∞(μ))*` as bounded-variation finitely additive charges on
the measurable sets, vanishing on μ-null sets. Use native
`MeasureTheory.AddContent 𝕜 {s | MeasurableSet s}` for finite additivity,
with the subtype normalization `ν s = 0` for every nonmeasurable `s`,
bounded variation and annihilation of measurable μ-null sets. Prove
extensionality on measurable sets for this normalized subtype. Define total variation
by suprema over finite measurable partitions. Give its normed linear space,
completeness, positivity, Jordan real/imaginary parts, uniform simple-function
integration and the isometric dual correspondence ν(E)=φ(1_E).
Prove representative independence by null-set annihilation and bounded
simple-function approximation. Develop the Yosida–Hewitt decomposition
into countably additive and purely finitely additive parts and its band
projection; for σ-finite μ identify the countably additive part with L¹(μ)
through the already supplied Radon–Nikodym comparison. Exhibit a purely
finitely additive component on counting measure using B1's Hahn–Banach
functional on ℓ∞/c₀. Reuse native scalar `Lp 𝕜 ∞ μ` star and
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

**B6.Cotype2 — Gaussian comparison and the finite-Hilbert summing bound.**
For a finite family y in a real Banach space Y, put
`R₂(y)=(E_ε‖Σ ε_i y_i‖²)^(1/2)` on the uniform finite sign cube and
`G₂(y)=(E_g‖Σ g_i y_i‖²)^(1/2)` for independent real standard Gaussians.
Define a cotype-2 bound C≥1 by `√(Σ‖y_i‖²)≤C R₂(y)` for every finite
y. Supply reindexing, zero-padding, homogeneity, closed-subspace and bounded-
isomorphism transport, Hilbert cotype with C=1, and finite Hilbert-direct-sum
bounds. Use these same definitions on the underlying real space of a complex
Banach space. Construct the shared finite Gaussian model here, before its
use in this argument and Grothendieck's inequality below; prove the required
Banach-valued integrability and sign/Gaussian law comparisons.

Prove Gaussian weak-2 domination: if `Σ|f(x_i)|²≤Σ|f(y_j)|²` for every
real continuous functional f, then `G₂(x)≤G₂(y)`. Construct the finite
Euclidean contraction relating the coefficient maps, its orthogonal dilation,
and the rotational-invariance/Jensen argument. A Rademacher cotype bound C
gives the Gaussian cotype bound with the same C by applying it to Gaussian-
weighted families and integrating. Deduce for `U:ℓ₂ⁿ(ℝ)→Y` that
`π₂(U)≤C G₂(Ue_i)`: every weak-2-unit family in ℓ₂ⁿ is dominated by its
orthonormal basis, so apply the preceding comparison before taking the
2-summing supremum.

Choose t=t(C)>0 with `C(E[g² 1_{|g|>t}])^(1/2)≤1/2`. Split each Gaussian
into its bounded and tail parts. Sign contraction bounds the bounded sum by
`t R₂(y)`; the 2-summing/Pietsch bound and the tail covariance bound its
L² norm by `C(E[g² 1_{|g|>t}])^(1/2)G₂(y)`. Absorption proves
`G₂(y)≤2t(C)R₂(y)` and hence `π₂(U)≤2C t(C)R₂(Ue_i)`.
For complex-linear U, pass to its realification and the real orthonormal basis
`(e_i,i e_i)`: compare the real and complex weak-2 norms and use the Gaussian
triangle inequality to obtain `π₂(U)≤4C t(C)R₂(Ue_i)`.
All constants are independent of n and Y apart from its declared C. Treat
empty families and the zero space, and retain the separate Gaussian-cotype
hypothesis version of the first bound. This is Pisier, *Factorization of
Linear Operators and Geometry of Banach Spaces*, §3, Lemma3.5,
Proposition3.7, Lemma3.8 and Theorem3.9 (pp33–37). It uses neither a
noncommutative Khintchine theorem nor a predual cotype assertion.

Prove the real and complex Grothendieck inequalities with finite universal
constants `κ_ℝ=8` and `κ_ℂ=16`: for any finite scalar matrix `a`, the supremum of
`|∑ aᵢⱼ ⟨uᵢ,vⱼ⟩|` over Hilbert unit-ball vectors is bounded by `κ_𝕜` times the
supremum of `|∑ aᵢⱼ sᵢtⱼ|` over scalar unit balls. First use finite-dimensional
Euclidean vectors; pass from any Hilbert space to their finite-dimensional
linear span. For real scalars, reuse the finite independent Gaussian model
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

Define the Banach–Mazur distance between nonzero finite-dimensional normed
`𝕜`-spaces of equal dimension as `inf ‖T‖‖T⁻¹‖` over `𝕜`-linear isomorphisms. Prove
symmetry, the multiplicative triangle inequality, invariance under isometry and distance
one iff isometry.
Define finite representability using arbitrarily small distortion embeddings of
each finite-dimensional subspace; prove transitivity and inheritance by subspaces.

Prove local reflexivity over `𝕜`: for finite-dimensional `F ≤ E**`, `G ≤ E*` and `ε > 0`,
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
Deduce finite representability of `E**` in `E`. Deduce also that for every
real or complex Banach space E and every u in `E* ⊗π E` (completed),
`‖u‖π` equals the supremum of `|⟨u,S⟩|` over S in the unit ball of L(E).
Since the dual of `E* ⊗π E` is L(E,E**), this is the density of
`J_E ∘ S`, S in the unit ball of L(E), in the unit ball of L(E,E**) for
the topology of trace pairing with `E* ⊗π E`; prove that density from local
reflexivity on finite tensors, then pass to the completion by truncating a
nuclear representation of u. With B4.0's trace-pairing map `Θ_E` this proves the
direction from MAP to `‖Θ_E u‖=‖u‖π` of B4.0's metric criterion for general E.

Use native `ConvexBody` with explicit symmetry and nonempty-interior conditions.
Develop symmetric convex bodies in finite-dimensional Euclidean spaces, polar
bodies, ellipsoids, volume and change of variables. Prove John's ellipsoid theorem
and its contact-point decomposition for symmetric bodies with nonempty interior.
In the position where the maximal-volume inscribed ellipsoid is the Euclidean
unit ball, construct contact points `u_i∈∂K∩S^(n−1)` and positive weights
`c_i` with `∑ c_i(u_i⊗u_i)=I` and `∑ c_i=n`, for `n≥1`; here
`u_i⊗u_i` denotes the rank-one map `x↦⟨u_i,x⟩u_i`.
State and prove the same for the closed unit ball `K` of a norm on a
finite-dimensional inner product space `E` over `𝕜` of dimension `n ≥ 1`: among the
`𝕜`-ellipsoids `T(B)`, the images of the Euclidean unit ball `B` under `𝕜`-linear
automorphisms `T` with `T(B) ⊆ K`, one has maximal `|det T|`; in the position where
`B` itself is that ellipsoid, construct contact points `u_i`, unit vectors with
`Re ⟨x, u_i⟩ ≤ ‖x‖_K` for all `x`, and positive weights `c_i` with
`∑ c_i(u_i⊗u_i)=I` and `∑ c_i=n`. For `𝕜 = ℝ` this is the symmetric-body statement
above. Derive `d(E,ℓ²_n) ≤ √n` over `𝕜` and the Kadec–Snobar projection theorem:
every subspace of dimension at most `n` of a normed `𝕜`-space is the range of a
projection of norm at most `√n`. Prove the Garling–Gordon projection theorem, its
dual: every closed subspace `M` of codimension at most `n` of a normed `𝕜`-space `X`
is, for every `ε > 0`, the kernel of a projection of norm at most `√n + ε`. Run
John's decomposition on the finite-dimensional dual `(X/M)*`, represent its contact
points by vectors `w_i ∈ X/M` of norm at most `1`, lift them to `x_i ∈ X` of norm less
than `1 + ε'`, and set `P y = ∑ c_i φ_i(π y) x_i` with the contact functionals `φ_i`;
the lift of the quotient norm is the sole source of `ε`.

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
* Pietsch, *Eigenvalues and s-Numbers*, 1.5.5 (Kadec–Snobar) and 1.7.17
  (Garling–Gordon); D. J. H. Garling and Y. Gordon, *Relations between some constants
  associated with finite dimensional Banach spaces*, Israel J. Math. **9** (1971),
  346–361.
* Garrido–Jaramillo, [*Variations on the Banach–Stone theorem*](https://matematicas.unex.es/~extracta/Vol-17-3/17J3Mari.pdf),
  §2, Theorems 2 and 4: the real weighted-composition theorem and Arens–Kelley
  extreme points. The complex version uses the variation splitting and phase
  arguments specified in B5.

Mathlib's `Analysis.Normed.Module.Bases` already supplies generalized Schauder
bases, finite projections and projection bounds. Follow the designs discussed in
[Extending Functional Analysis Coverage on Zulip](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/Extending%20Functional%20Analysis%20Coverage)
for bases, the bipolar theorem and uniform convexity.

Tensor-product spelling requires care: the `injectiveSeminorm` in the pinned
Mathlib is not the classical `ε` norm above. Define the injective norm as the least
reasonable crossnorm and keep the projective API compatible between binary and
finite-family tensors. Define the nuclear operators `E → F` as the range of the
completion map from `F ⊗π E*`; the tensor symmetry identifies this with the ordering
used in B4.
Build every needed missing result in Tau Ceti with these interfaces; adopt
Mathlib's implementation when available.


B4.0 uses Enflo, [*A counterexample to the approximation problem in Banach
spaces*](https://doi.org/10.1007/BF02392270), Acta Mathematica 130 (1973),
309–317, for the explicit Walsh/incidence construction and quantitative
trace obstruction. B4.1 uses Argyros–Haydon, [*A hereditarily indecomposable
ℒ∞-space that solves the scalar-plus-compact problem*](https://arxiv.org/abs/0903.3921),
Sections 2–9, for blocking, the real construction, basis/decomposition estimates and
operator theorem; its complexification is the comparison specified here.

- Androulakis–Odell–Schlumprecht–Tomczak-Jaegermann, [*On the structure of the spreading models of a Banach space*](https://arxiv.org/abs/math/0305082), Theorem 5.4, for the subspace-operator construction.
- Emmanuele, *Answer to a question by M. Feder about K(X,Y)*, Rev. Mat. Univ. Complut. Madrid 6 (1993), 263–266, for the compact-operator-space argument.
