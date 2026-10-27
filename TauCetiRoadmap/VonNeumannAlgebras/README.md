# Von Neumann algebras: operator foundations and measurable fields

Build the concrete and abstract operator-algebra, state, topology, corner,
tensor, type-I, predual and measurable-field foundations below. The
measurable-field construction uses given measures and fields, not spectral
representation or central disintegration.

Use native `VonNeumannAlgebra`, `WStarAlgebra`, `StarSubalgebra`,
`Set.centralizer`, `IsStarProjection` and `H →L[ℂ] H` on complete complex
Hilbert spaces. Concrete algebras are unital on their acting Hilbert space;
corners act on the complete projection range with that projection as unit.
Representations are unital complex star-algebra homomorphisms, with
normality an additional property. Build composition, restriction, transport,
extensionality and coercion APIs for maps and intertwiners.
The inner product is conjugate-linear in its first variable;
`ω_ξ(x)=⟪ξ,xξ⟫` and `(aφb)(x)=φ(bxa)`. Projection equivalence is oriented
by `v*v=p`, `vv*=q`; subequivalence permits `vv*≤q`.
A factor has nonzero identity and scalar centre. Include zero Hilbert spaces,
zero algebras and all cardinalities unless a theorem states separability.

Consume [OperatorTheory](../OperatorTheory/README.md)'s OrthogonalGeometry,
PolarDecomposition, bounded Borel/PVM calculus through SelfAdjointSpectralTheory
SA-B84, and OperatorIdeals' trace-class/Hilbert–Schmidt theory. The measurable
field target below does not use a cyclic multiplication theorem.
Consume RepresentationTheory/SemisimpleAlgebras' finite double-centralizer
input for V1 and native C*-functional calculus/GNS for V0.
Consume [BanachSpaceTheory B1](../BanachSpaceTheory/README.md#b1-duality-and-weak-topologies)
for annihilator and quotient theory and BanachSpaceTheory B2 for Krein–Šmulian. For V4.Core's weak-star continuous-dual
input, consume native `LinearMap.dualEmbedding_surjective` and
`LinearMap.rightDualEquiv` at `topDualPairing ℂ B`. Obtain right separation
from the native RCLike `SeparatingDual` instance and
`SeparatingDual.eq_zero_of_forall_dual_eq_zero`.
V4.Core precedes V4.PositivePredual, then V4.Normality. V4.0.Fields is
constructed from countable fundamental sections, scalar integration and
Hilbert completion independently of normal-operator diagonalization.

## V0. C*-algebra and state prerequisites

Consume Mathlib's complex CStarAlgebra, star algebra homomorphism, order and continuous
functional calculus APIs, including positivity, positive-square-root uniqueness,
positive/negative parts, spectral permanence, automatic contractivity/isometry of star
homomorphisms, positive-functional Cauchy–Schwarz and norm at one, and approximate units.
Use `PositiveLinearMap.GNS` and `gnsStarAlgHom` from
`Mathlib.Analysis.CStarAlgebra.GelfandNaimarkSegal` for the completed GNS construction.
Add the canonical cyclic vector, recovery of the functional, unitary uniqueness and
transport/restriction lemmas; prove state separation and construct the faithful direct-sum
representation (Gelfand–Naimark) from these representations.
Use the existing bounded positive-functional carrier; define states by norm one,
prove the positive-functional norm-at-one identity and develop convex sums,
restriction and Cauchy–Schwarz. Normality is added in V4. Include the zero
functional and zero algebra, which has no state with this norm-one convention.

## V1. Operator topologies and the bicommutant theorem

Use `ContinuousLinearMapWOT` and the existing SOT `PointwiseConvergenceCLM`
(`H →Lₚₜ[ℂ] H`), and develop compatible strong-star,
ultraweak, and ultrastrong wrappers. Prove their neighborhood and net criteria, Hausdorff
locally convex structure, vector-coefficient continuity, separate continuity of products,
WOT/ultraweak continuity of star, and joint SOT continuity of products on norm-bounded
sets. Exhibit failure of joint SOT continuity on all B(H). Prove equality of weak with ultraweak and strong with ultrastrong on norm-bounded
sets; exhibit their differences on the whole infinite-dimensional operator space. Construct an
ultraweak functional φ that is not WOT continuous using the diagonal weights n⁻².
For separable infinite-dimensional H direct finite-dimensional subspaces F by inclusion;
choose unit η_F⊥F and let `T_F=φ(P_(η_F))⁻¹ P_(η_F)`. Prove φ is faithful positive,
`T_F→0` SOT and `φ(T_F)=1`, so the rank-one net does not converge ultrastrongly. For infinite-dimensional H use operators `e_m + m e_n`, m≠n, where e_n are the
rank-one projections onto an orthonormal sequence, to exhibit zero in the ultrastrong closure without a sequence
from this set converging WOT to zero; prove none of WOT/SOT/ultraweak/ultrastrong is
metrizable on the whole B(H). For separable H prove all are metrizable on the norm unit
ball and separable on B(H); when H is infinite-dimensional prove its operator-norm
topology is nonseparable. Include powers of the backward unilateral
shift (SOT convergence to zero with norm one), contrast forward powers, and the rank-one
family `T_n e₀=n^(-1/2)∑_(k=1)^n e_k`, vanishing on other basis vectors, which converges
WOT to zero but has `‖T_n e₀‖=1`. Characterize WOT/SOT continuous linear
functionals as finite sums of matrix coefficients and ultraweak/ultrastrong ones as
absolutely convergent square-summable vector pairings. Establish the shared continuous-dual
and closed-convex-set results by locally convex separation, including the hypotheses on
subspaces. Prove weak compactness of the operator unit ball.

For every unital star subalgebra A of B(H), identify its WOT, SOT, ultraweak, and ultrastrong
closures with A''. Consume the finite-dimensional double-centralizer theorem from
RepresentationTheory/SemisimpleAlgebras and prove its operator-space specialization and the
simultaneous-vector amplification argument. Give each concrete algebra subtype its canonical complete normed star algebra and
CStarAlgebra instances, compatible with `toStarSubalgebra`. Supply generated-algebra constructors, leastness,
monotonicity, intersections, closure, commutant reversal, and lattice operations. Prove a unital star subalgebra is a von Neumann algebra exactly
when its norm unit ball is WOT compact. For
nonunital star algebras, separate the common annihilator and prove their closure is unital
on its essential subspace. Show this gives the correct supported algebra on H rather than
silently adjoining the identity on the annihilator. Prove Kaplansky density for the unit
ball and its self-adjoint and positive parts, with matrix amplification and strong-star
forms; establish the useful criterion that bounded strong approximants suffice to prove
membership in the generated algebra.

## V2. Elementary algebra, corners, and tensors

For a nonunital concrete C*-algebra A, use Mathlib's nonunital continuous functional
calculus to identify the algebra generated by a positive element with continuous spectrum
functions vanishing at zero. Prove its support projection belongs to the strong closure of A
by `SOT-lim (a/‖a‖)^(1/n)` for a≠0, with zero-constant polynomial approximants.

Bounded Borel functions and spectral projections of self-adjoint elements lie in M;
modulus and polar-decomposition partial isometries of arbitrary elements lie in M. Prove
M is generated by its projections and by its unitaries; prove every element is a
complex linear combination of at most four unitaries. For a unital C*-algebra A whose
von Neumann closure is M, prove U(A) is strong-star dense in U(M): construct a bounded
self-adjoint logarithm h∈M of each unitary with spectrum in [−π,π], apply Kaplansky to
uniformly bounded self-adjoint approximants in A, and prove strong continuity of the
exponential on that bounded set by power-series approximation. Build the logarithm from
the bounded self-adjoint Borel calculi of the commuting real and imaginary parts of u. Prove Vigier's monotone convergence
theorem with identification of the supremum and SOT limit. Construct the complete lattice
of projections, meet by intersection of ranges, join by closed span, complement, support,
range and kernel projections, central support, and compatibility with increasing limits.
Prove Kaplansky's parallelogram law `p∨q-p ~ q-p∧q` using the polar decomposition of
`(1-p)q`; prove the version with p,q interchanged. Prove `p∧q=SOT-lim (pq)^n=SOT-lim (pqp)^n`.
Supply zero/one, orthogonality, inclusion, conjugation, functional-calculus, and transport
lemmas for all these operations. Prove ultraweakly closed left ideals are precisely Mp,
and ultraweakly closed two-sided ideals correspond to central projections, with uniqueness
and inclusion correspondence.

For a projection p in M, prove its central support c(p) is the orthogonal
projection onto `closure span {xpξ : x∈M, ξ∈H}`. For y∈M′ prove
`yp=0 ↔ y c(p)=0`; this is the central-support kernel theorem.
Construct pMp on pH and prove `(pMp)' = pM'p` on pH. If M is a
factor and p ≠ 0, prove pMp is a factor and the restriction map `M' → B(pH)` is a faithful
normal isomorphism onto its image. Include reducing-subspace correspondence and the
nonzero product theorem `ab ≠ 0` for nonzero a∈M, b∈M' when M is a factor. For a self-adjoint multiplicatively closed generating set S, prove pSp generates pMp
for p∈M or p∈M'; give a counterexample when multiplicative closure of S is removed.
For a factor and finite-dimensional linear subspaces V⊂M, W⊂M', prove multiplication
from the algebraic tensor product `V⊗W` onto the linear span VW is a linear isomorphism;
when V,W are star subalgebras prove the star algebra version.

Construct completed Hilbert tensor products as the completion of Mathlib's
inner-product space `TensorProduct ℂ H K` (`Mathlib.Analysis.InnerProductSpace.TensorProduct`,
whose inner product is already positive definite with `‖x⊗y‖=‖x‖‖y‖`, so no null
quotient is taken). Extend `TensorProduct.mapL`, `TensorProduct.commIsometry` and
`TensorProduct.assocIsometry` to the completion to obtain the bounded-operator tensor
maps, flip and associativity; demand dense elementary tensors, norm/product/adjoint
formulas, and the identification with vector-valued L². For finite measures develop the measure algebra
modulo null sets with metric `μ(A△B)` and prove its separability is equivalent to
separability of L². For uncountable I and the fair coin product measure on `{0,1}^I`,
prove the centered coordinate functions form an uncountable orthogonal family, so L²
is nonseparable; prove ℓ²(I) is separable exactly when I is countable. Define the
spatial tensor product `M ⊗̄ N` as the algebra generated by elementary operator tensors;
prove associativity and flip. Construct the canonical maps `x ↦ x⊗1_K` from M and
`y ↦ 1_H⊗y` from N as normal unital star homomorphisms into `M ⊗̄ N`, with no
nonzero hypothesis. Prove the left map is injective, hence isometric, when K≠0,
and the right map when H≠0. If K=0 then `H ⊗̂ K=0` and `M ⊗̄ N=0`, so the left map
is zero and is injective only when H=0 as well; for M=ℂ on H=ℂ and N=0 on K=0 it is
the zero map ℂ→0. State `M ⊗̄ 0=0` and `0 ⊗̄ N=0` explicitly. Construct vector-functional slice maps
with their norm, adjoint, elementary-tensor and separating-family lemmas. Prove the commutation theorem for
B(K) tensor factors here; Prove the B(K) tensor splitting theorem for a von Neumann algebra
containing `1 ⊗ B(K)` and the factoriality of a tensor product of factors.

For σ-finite measure spaces realize L∞ as multiplication operators on L² and prove
its commutant is itself. For abelian algebras on separable H construct a single
self-adjoint generator by a convergent ternary-weight projection series.

For a normal operator a on a separable Hilbert space H, with spectral PVM P_a and
`W*(a)` the von Neumann algebra generated by a, construct a finite positive Borel
measure μ on σ(a) with `μ(B)=0 ↔ P_a(B)=0` for every Borel B, and prove that the
bounded Borel calculus descends to an isometric unital star-algebra isomorphism
`L∞(σ(a),μ) ≅ W*(a)`, `[f] ↦ f(a)`: the value is independent of the bounded Borel
representative, the norm of f(a) is the μ-essential supremum of f, the map agrees
with the continuous functional calculus on `C(σ(a))`, sends the class of an
indicator `1_B` to P_a(B), and is onto `W*(a)` (Houdayer, Theorem 3.4, p. 13;
Peterson, Corollary 2.8.7, p. 38). For H≠0, μ may be normalized to a probability measure;
for H=0, σ(a) is empty, μ is the zero measure and both sides are the zero algebra.
A route: choose a countable maximal family of unit vectors ξ_n with H the orthogonal
sum of the closures of `W*(a)ξ_n` and positive summable weights w_n (the family is empty when H=0), put
`μ=Σ w_n μ_(ξ_n)` with μ_ξ the diagonal measures of P_a, and obtain the null-set
equivalence from positivity and totality. The kernel of f ↦ f(a) is the μ-null
symbols by the vector norm-square identity, and the essential-norm identity follows
from the spectral projections of `{|f|>c}`. For onto-ness, V1's Kaplansky density
and metrizability of bounded sets give a uniformly bounded sequence of
continuous-calculus values f_n(a) converging strongly to a given T∈W*(a); the
vector norm-square identity makes (f_n) Cauchy in `L²(μ)`, an almost-everywhere
convergent subsequence has an essentially bounded Borel limit f, and bounded
sequential convergence identifies T=f(a). *Needs:* SelfAdjointSpectralTheory SA-B05–B11,
SA-B30, SA-B46, SA-B49–B53; V1 Kaplansky density and bounded metrizability; Mathlib
`MeasureTheory.Lp`. It uses neither SelfAdjointSpectralTheory SA-B85–B86 nor V4.0.Fields.

Prove the classification of separable nonatomic probability measure algebras by the
Lebesgue interval. Classify the abelian von Neumann algebras on separable H
abstractly as ℓ∞ of a finite/countable atomic set, a nonatomic L∞[0,1] part, or their
direct sum (Peterson, Theorem 2.8.9, pp. 38–39): by the single self-adjoint generator and the
comparison above, such an algebra is `L∞(σ(a),μ)`; split μ into its atomic and
nonatomic parts, normalize the nonatomic part to a probability measure, and apply the
measure-algebra classification through the induced star isomorphism of L∞. The zero
algebra is ℓ∞ of the empty set.

## V3. Type I and finite-dimensional algebras

Define minimal, finite, infinite, properly infinite, and abelian projections. Prove the
minimal-corner criterion `pMp = ℂp` for nonzero projections p. In a factor any two nonzero projections have a nonzero
connecting corner, with a unitary connector; derive nonzero equivalent subprojections.
Construct matrix units from orthogonal equivalent projections, with their representation,
corner and tensor-product APIs. Prove a factor with a minimal projection is spatially
`B(K) ⊗ 1_L` and classify type I_n and type I_∞ on separable spaces. Treat arbitrary
cardinality in the basic type I classification. Give the commutant and multiplicity.

Classify finite-dimensional von Neumann algebras acting on possibly infinite-dimensional H
as finite direct sums of matrix algebras with multiplicity Hilbert spaces. Classify unital
inclusions by their nonnegative integer multiplicity matrices; show the matrix block formula
for dimensions, composition by matrix multiplication, and the bipartite Bratteli graph.
Prove the matrix-entry formula using ranks of compressed minimal projections; work out
`M₂⊕ℂ ⊂ M₅⊕M₃` and the general construction realizing every admissible inclusion matrix.
Prove every algebraic complex linear trace on finite-dimensional B(H) is a scalar multiple
of matrix trace. For infinite-dimensional H prove B(H) has no nonzero algebraic linear
trace, with no continuity or positivity assumption, by its algebraic commutator-span
identity. Also give elementary proofs of the WOT-continuous and positive cases. For a spatial inclusion of type-I factors `N⊂N⊗M_k` with finite k, prove the larger
algebra is a free left N module of rank k², including N=B(K) for infinite-dimensional K.
 For a subgroup Η of a group Γ, prove that the algebraic complex group ring
`ℂ[Γ]` is a free left `ℂ[Η]`-module with basis the group elements g in a set of
representatives of the right cosets Ηg, hence of rank the index [Γ:Η] (Jones, §4.5,
p. 29). This concerns the group rings, not the group von Neumann algebras: for Η
trivial and Γ=ℤ with U=λ(1), `(2−U)⁻¹=Σ_(n≥0) 2^(−n−1) Uⁿ` converges in norm in L(ℤ)
but sends δ₀ to a vector of infinite support, so it is not a finite combination of
the coset unitaries.

## V4. Preduals, normality, and normal representations

**V4.Core — duality and the easy normality direction.**
Use the trace-class and Hilbert–Schmidt spaces from OperatorIdeals. Prove basis independence
of positive extended trace, cyclicity of trace-class products and Hilbert–Schmidt pairings,
`‖φ_h‖ = ‖h‖₁`, and the unitary identification of Hilbert–Schmidt operators H→K with
`K ⊗̄ conjugate(H)`. Identify `B(H)` isometrically with the dual of trace class by the pairing
`(x,h) ↦ Tr(xh)`. For an ultraweakly closed linear subspace V, construct its predual as the
trace-class quotient by the annihilator, prove annihilator closure, quotient completeness,
the dual identification and weak-star/ultraweak agreement. Denote the ultraweakly
continuous linear functionals by M_* and identify them isometrically with this
quotient. Prove intrinsic uniqueness of the von Neumann predual and
the equivalence with Mathlib's WStarAlgebra definition (Sakai's theorem),
consuming [BanachSpaceTheory B2](../BanachSpaceTheory/README.md#b2-weak-compactness-and-reflexivity)'s
Krein–Šmulian theorem and owning its W*-algebra specialization, weak-star closedness of the
positive cone and separate weak-star continuity of multiplication before representation, including a faithful ultraweakly continuous concrete
representation inducing the given predual for each abstract W*-algebra. In the
quotient-dual argument consume native `LinearMap.dualEmbedding_surjective`
and `LinearMap.rightDualEquiv` for P:=`topDualPairing ℂ B`, where B is the
Banach predual (first trace class S₁(H), then its indicated quotient).
Use `WeakDual ℂ B = WeakBilin P`; right separation follows from the native
RCLike `SeparatingDual` instance and
`SeparatingDual.eq_zero_of_forall_dual_eq_zero`. The resulting linear
equivalence identifies every continuous linear functional on the weak-star
space B* uniquely with evaluation at b∈B, with no reflexivity hypothesis.
Own the pairing and transport specialization: ev_b(φ)=φ(b), and for bounded
T:B→L[ℂ]C, its weak-star continuous transpose satisfies
`ev_b ∘ T* = ev_(Tb)`. Consume BanachSpaceTheory B1's existing annihilator
and quotient theory. Own the following
separability proof in V4 for separable H. Consume
[BanachSpaceTheory B4](../BanachSpaceTheory/README.md#b4-approximation-and-banach-tensor-products)'s
compact Schmidt expansion, its zero-based singular-value/approximation-number
comparison and its isometric Hilbert nuclear/trace-class identification.
Truncate the resulting trace-class singular/nuclear expansion to finite rank
with trace-norm error bounded by the summable tail, and use B4's rank-one norm formula
‖u⊗v*‖₁=‖u‖‖v‖ in this trace-class comparison. Approximate the finitely
many vectors by rational complex combinations in a countable orthonormal
basis; the rank-one formula controls the error. Thus finite matrices
with rational complex coefficients form a countable trace-norm dense
set. Deduce separability of the quotient predual of every ultraweakly
closed complex linear subspace V of B(H). Include finite-dimensional
and zero H; no separability premise enters the general trace-class or
quotient-duality construction. Specialize to concrete algebras. For group algebras of groups with at least two elements produce a nonzero trace-class
annihilator to demonstrate that restrictions are not injective.

Consume V0's positive-functional and state carriers, convex operations and
norm-at-one comparison. Define normality of a bounded positive functional by
preservation of bounded increasing positive nets. Define the analogous net
predicates for positive maps and star homomorphisms. Prove that ultraweak
continuity implies these normality predicates, and that a positive member of
M_* is completely additive on arbitrary orthogonal projection families. Prove
also that a normal positive functional is completely additive by applying its
net property to the finite partial sums of each orthogonal family. The
converse for bounded positive functionals is owned only by V4.PositivePredual;
V4.Normality then derives the map/representation consequences from it.
Define countable decomposability (sigma-finiteness) by countability of every
orthogonal family of nonzero projections. The zero algebra satisfies this
definition. Define faithfulness of a positive functional by
`φ(x)=0, x≥0 ⇒ x=0`. The zero algebra has no state, by V0's norm-one definition.

**V4.PositivePredual — positive spanning and the self-adjoint base norm.**
For every complex W*-algebra M, with no trace, separability or sigma-finiteness
hypothesis, prove that every self-adjoint member of M_* is a difference
of positive members of M_*, and every member of M_* is a complex
linear combination of four positive normal functionals. On the real
self-adjoint predual prove the exact norm formula

```
||φ|| = inf {a(1)+b(1) : a,b∈M_*^+, φ=a−b}.
```

Consume V4.Core's faithful ultraweakly continuous concrete representation
inducing the given predual and its isometric trace-class quotient. Use that quotient norm:
for every ε>0 lift φ to trace-class h with ||h||₁<||φ||+ε, replace h by
(h+h*)/2 for self-adjoint φ, whose trace norm is no larger. Rename this
Hermitian lift h, retaining ||h||₁<||φ||+ε, and restrict its trace-class positive parts
h_+,h_- to M. Prove these restrictions positive and normal, their difference
φ, and their masses sum to ||h||₁. The triangle inequality gives the reverse
bound and ε↓0 the formula; no norm-attaining lift is presumed. Real and
imaginary parts give four positive terms. Include the zero algebra. This is
the general predual result, including typeIII and mixed algebras.

For every already given bounded positive functional φ, prove equivalence of
ultraweak continuity, preservation of bounded increasing positive nets and
complete orthogonal additivity of its projection restriction. Prove that
countable decomposability is equivalent to existence of a faithful normal
positive functional; for M≠0 it is equivalent to existence of a faithful normal
state. For M=0 the zero functional supplies the first equivalence and there is
no state. For countable decomposability ⇒ a faithful normal positive
functional, in V4.Core's representation choose a countable
maximal orthogonal family of nonzero cyclic projections `[M′ξ_n]∈M`,
choosing each ξ_n of norm1, and
sum strictly positive summable multiples of their vector functionals; the sum
is faithful. Prove the converse using positivity on nonzero orthogonal
projections. On a countably decomposable algebra countable additivity suffices.

Own the following all-cardinality vector-domination proof. In V4.Core's
faithful ultraweakly continuous representation inducing the given predual, for each nonzero projection q choose ξ∈qH
with ||ξ||²>φ(q). A Zorn-maximal orthogonal family of nonzero f≤q satisfying
φ(f)≥ω_ξ(f) has sum f₀<q, by complete additivity. Put e=q−f₀. Maximality
gives φ(p)≤ω_ξ(p) for every projection p≤e. Spectral-step approximation
inside this fixed corner gives φ(exe)≤ω_ξ(exe) for x≥0. Cauchy–Schwarz gives
`|φ(xe)|²≤φ(1)||xeξ||²`, so Riesz representation expresses x↦φ(xe) as
a vector coefficient, hence as an element of M_*. A maximal orthogonal family
of such e_i sums to1. For e_F=Σ_(i∈F)e_i over finite F, φ(·e_F) lies in M_* and

```
||φ−φ(·e_F)||≤φ(1)^(1/2)φ(1−e_F)^(1/2)→0.
```

The isometric predual is norm closed, so φ∈M_* and is ultraweakly continuous.
Use V4.Core for the converse normality/complete-additivity implications. Deduce
ultraweak continuity iff preservation of increasing projection nets; the
increasing-positive-net condition is the normality predicate already defined.
Spectral-step approximation here is confined to a fixed corner: spectral
projections of an increasing noncommuting positive net need not increase.
This existing-functional theorem has no typeI₂ exclusion or charge-extension
input.

**V4.Normality — consequences of the positive criterion.**
Consume V4.Core and V4.PositivePredual. Identify M_* with the complex linear
span of bounded positive normal functionals; use the criterion once for the
hard normal-to-ultraweak direction. Derive ultraweak continuity iff normality
for positive maps and star homomorphisms by composition with positive target
predual functionals and their separation. Consume V4.Core's faithfulness
predicate; own the tracial predicate, closure, support projections and normal
restriction APIs.
Prove a normal representation has von Neumann image, normal quotient/corner
behavior, and that a normal positive functional on a concrete algebra is a
countable sum of vector functionals with square-summable vectors. Derive normal
GNS, cyclic-vector uniqueness, the concrete vector-state GNS identification
for φ(a)=a₁₁ on M_n(ℂ) with its defining representation on ℂⁿ, faithful-state
separating vectors, cyclicity for M iff separation for M', and normal faithful
representations preserving the intrinsic predual. Include positive-functional
domination and the Radon–Nikodym operator in the commutant for a dominated
vector functional. Prove state-preserving automorphisms are canonically
unitarily implementable in GNS. Prove every normal star homomorphism is
represented by amplification, reducing projection and spatial identification
of its image, with kernel a central summand.

**V4.0 — Measurable fields, spectral representation and central decomposition.**

**V4.0.Fields — Hilbert and operator fields.** For standard
σ-finite measure spaces construct measurable fields of
separable Hilbert spaces from countable fundamental sections, measurable
sections, square-integrable sections modulo almost-everywhere equality,
and their complete direct-integral Hilbert space. If every member of one
fundamental family is measurable for another, prove the two families define the
same measurable sections, the same square-integrable sections and the same direct
integral, by measurable Gram–Schmidt on the first family and expansion of the
coefficients of the second in the resulting orthonormal sections. Construct measurable
essentially bounded operator fields, taken modulo almost-everywhere equality, and prove the decomposable-operator
criterion: commutation with the diagonal L∞ algebra. Identify essentially
bounded operator fields with decomposable operators as an isometric
*-algebra isomorphism. For two fields over the same base, prove a bounded
map between their direct integrals intertwines the diagonal L∞ actions
iff it is induced by a measurable essentially bounded field of maps.
Derive this from the one-space result on their direct sum and its
off-diagonal corner. Prove the decomposable map is unitary iff its
fibre maps are unitary almost everywhere; prove composition/adjoint and
change-of-measure laws. For equivalent sigma-finite measures μ,ν on the
same standard base construct the onto field unitary f↦√(dμ/dν)f, with its
inverse, chain law and diagonal-intertwining formulas. If μ≪λ, put the
transported fibre equal to zero where dμ/dλ=0; the same formula gives an
onto unitary from the μ-direct integral to that zero-extended λ-field.
Prove measurability, inverse on positive-density fibres and independence
of density versions. Prove these by
measurable Gram–Schmidt on fundamental sections, scalar integration and
Hilbert completion; this sublayer has no PVM, normal-operator or central-
decomposition input.

## References

- C. Houdayer, *An invitation to von Neumann algebras*, graduate course notes,
  author's page.
- J. Peterson, *Notes on von Neumann algebras*, Vanderbilt University lecture notes,
  2013, author's page.
- V. F. R. Jones, *Von Neumann algebras*, lecture notes, 2009, author's page.
