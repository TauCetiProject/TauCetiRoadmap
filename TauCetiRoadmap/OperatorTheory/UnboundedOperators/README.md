# Roadmap: unbounded operators on Hilbert space

**Summary.** Build the reusable domain and spectral calculus for closed, densely defined operators on complex Hilbert spaces, and the closed-form representation and real spectral restriction over real Hilbert spaces. The central carrier is Mathlib's `LinearPMap`; domains, closures, adjoints, restrictions, sums, products, and tensor operators remain explicit. The roadmap completes the unbounded spectral operations that the self-adjoint spectral theory needs, then develops normal operators, spectral type, symmetric extensions, analytic vectors, compact perturbations, and tensor sums.

## Scope and ownership

This sub-roadmap consumes [SelfAdjointSpectralTheory](../SelfAdjointSpectralTheory/README.md) (SAST) Part A for Stone's theorem, Part B for the bounded Borel calculus and PVM carrier (implemented at the Tau Ceti pin as `TauCeti.ProjValMeasure`), Part C for `LinearPMap` graph/adjoint operations, Part D for resolvents, and Part E for the unbounded spectral PVM `P_A` (SA-E01), its resolvent formula (SA-E05), and the generated group/Stone uniqueness (SA-E26, SA-E29, SA-E43). Use the existing `P_A`; UO-A01 builds the unbounded spectral integral and its domains. It extends those APIs; it does not define a second `LinearPMap`, PVM, bounded Borel symbol, or Stone group. UO-A01 owns the unbounded spectral integral; H6 owns the scalar unbounded continuous calculus. UO-A08 compares H6’s unbounded continuous calculus with UO-A01, and UO-A02a compares VNA V10’s affiliated-operator functional calculus with it, after the independent APIs are constructed. UO-A07 owns the V10 cyclic multiplier identification and square-integrability domains, which A08 consumes rather than duplicating. The essential spectrum of a partial operator and its perturbation theory (Weyl's theorem, relatively compact and analytic perturbations, Kato's `L²+L∞` theorem; §§3.2 and 5.4–5.7) are owned here; OperatorKTheory §8.4 owns the Fredholm essential spectrum of bounded operators, which §3.2 compares with it. GeneralizedCohomology G5.5-RealHilbert owns the conjugation of its Hilbert complexification `RealHilbertComplexification H` and the unbounded complexification of real partial operators; §4.7 owns the identification of that synonym with Tau Ceti's `WithLp 2 (TauCeti.Complexification H)` and consumes both constructions through it.

Consume [HilbertModules H6](../../HilbertModules/README.md#h6-closed-module-operators-and-regularity) for the scalar Hilbert-space adjoint, graph norm, core, sum and composition foundations, and the von Neumann decomposition of `dom S*` with its boundary form and unitary classification of self-adjoint extensions. This roadmap proves the further spectral and analytic consequences of that API; it does not recopy H6's classification. Consume VonNeumannAlgebras V10.ClosedOperators' cyclic multiplier-form representation of self-adjoint operators and its domain `{g : ∫ |fg|² < ∞}`, and V10.Affiliation's spectral multiplier product rule. Consume VonNeumannAlgebras V2's completed Hilbert tensor products and V2.RectangularL2's arbitrary-measure realization. V2–V5 provide the bounded projection, commutant, representation, and finite-dimensional operator background where used; this roadmap does not redo those algebras.

The boundary with physical quantum models is explicit: this roadmap owns generic operator and spectral theorems and the reusable examples listed below. Measurement and outcome laws and their domains, quantum logic, a Fock-operator domain API, and the physical position/momentum, oscillator, angular-momentum, hydrogen and state-probability models are outside this roadmap; a roadmap for them consumes the generic domain and spectral results below. OperatorAlgebraDynamics D8 owns the CCR/CAR/Weyl algebras, regular representations, basic field operators, and Fock carriers. SAST remains the owner of bounded Borel calculus, the self-adjoint spectral PVM construction, resolvents, and the unitary-group/Stone correspondence. The [PDE roadmap](../../PDE/README.md) owns weak-derivative Sobolev spaces and trace theory; its concrete derivative examples may consume the generic extension theory here.

BanachSpaceTheory B5 owns Hilbert dimension (the cardinality of a Hilbert basis, independent of the basis) and the unitary classification of complete inner-product spaces by it; §4.1 consumes both for the deficiency cardinals and does not prove them again. §2.4's geometric acceptance target reads the Euler characteristic, integral homology and genus of the completed surface of Nelson's example off its cell structure, through Tau Ceti's cellular homology and its comparison with singular homology. This roadmap owns only that translation surface, its completion, orientation and cell structure, and the computation of its invariants; it neither owns nor uses general surface topology (the manifold boundary, triangulations, the classification of compact surfaces).

## Conventions

Use the convention `U(t)=exp(itA)` for the Stone group of a self-adjoint `A`, and `R_A(z)=(zI-A)⁻¹` as in SAST. Inner products are conjugate-linear in the first variable. For the unbounded Borel calculus, the operator assigned to `f` has domain `{x : ∫ |f|² dμˣ < ∞}`. Every sum or product statement below includes its natural composition domain or its closure; no unbounded expression is treated as an everywhere-defined algebraic operation.

**Graph/adjoint comparisons.** Consume the existing H6 scalar graph/adjoint API and native `LinearPMap.IsFormalAdjoint`, `adjoint_graph_eq_graph_adjoint` and `adjoint_isClosed`. For A=iI on nonzero H, `A**=iI` while `overline(A*)=(closure A)*=−iI`; the identities are `closure A=A**` and `(closure A)*=A*=A***` for densely defined closable A. The pairing `⟨Aφ,ψ⟩=⟨φ,A*ψ⟩` is the defining adjoint identity, satisfied by iI, and does not assert symmetry; the symmetry criterion is `⟨Aφ,ψ⟩=⟨φ,Aψ⟩` for all φ,ψ∈D(A), equivalently A⊆A*, and equivalently a real diagonal quadratic form by polarization. For a closed densely defined N, to prove D(N*N) graph-dense in D(N), take graph-orthogonality to `graph(N|D(N*N))` and test ξ∈D(N*N), using surjectivity of 1+N*N; whole-graph orthogonality with ξ∈D(N) alone does not establish this step. These are comparisons with H6/V10's existing theory, not replacement graph or normal-operator libraries. Native `LinearMap.IsSymmetric.continuous` already supplies the everywhere-defined Hellinger–Toeplitz theorem.

## Exact supplier contracts

**From Mathlib.** Use `LinearPMap` and its graph, `IsClosed`, `IsClosable`,
closure, `IsFormalAdjoint` and adjoint from `Mathlib/LinearAlgebra/LinearPMap.lean`,
`Mathlib/Topology/Algebra/Module/LinearPMap.lean` and
`Mathlib/Analysis/InnerProductSpace/LinearPMap.lean`. The adjoint pairing is used
only for dense domains; closure denotes the graph closure only after closability
is proved. A submodule S of the domain is a graph core of A, `LinearPMap.HasCore A S`, when the
closure of the restriction of A to S is A. `HilbertBasis.repr` from `Mathlib/Analysis/InnerProductSpace/l2Space.lean`
is an isometric identification with ℓ², not a Hamel basis. `MeasureTheory.Lp`
and `MeasureTheory.MemLp` supply a.e. classes and product integrability without
a σ-finiteness assumption. The positive/signed Radon–Nikodym and absolute-continuity
inputs below retain their stated measure hypotheses. `IsCoercive.continuousLinearEquivOfBilin`
from `Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean` is the real Lax–Milgram theorem: for
a complete real inner-product space `V` and a coercive bounded bilinear form `B : V →L[ℝ] V →L[ℝ] ℝ`
it upgrades `B♯ = InnerProductSpace.continuousLinearMapOfBilin B`, the map with
`⟪B♯ v, w⟫ = B v w` (`IsCoercive.continuousLinearEquivOfBilin_apply`), to a continuous linear
equivalence `V ≃L[ℝ] V`. Its inverse, composed with the inverse Riesz map
`(InnerProductSpace.toDual ℝ V).symm`, sends a continuous functional ℓ to the unique u with
`B u w = ℓ w` for all w. It is stated for real scalars only.
`banach_steinhaus` from `Mathlib/Analysis/Normed/Operator/BanachSteinhaus.lean` is the uniform
boundedness principle used for strongly convergent operator sequences.

**From Tau Ceti.** Use `LinearPMap.IsResolventAt`,
`LinearPMap.resolventSet` and `LinearPMap.resolvent` from
`TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean`: `IsResolventAt A z R`
says that the continuous linear `R` takes values in the domain and inverts `zI−A` on both
sides, `resolventSet A` is the set of `z` admitting such an `R`, and `resolvent A z` is that
inverse, specified only on the resolvent set. §4.2 and §5.3 state their resolvent
conclusions through these declarations; Layer 5 obtains membership from
self-adjointness and nonreal parameters. Analyticity of the resolvent in the spectral
parameter on the resolvent set is `TauCeti.LinearPMap.analyticAt_resolvent` from `TauCeti/Analysis/Normed/Operator/Resolvent/Analytic.lean`.
The spectrum `LinearPMap.spectrum` of a partial operator is the complement of its resolvent set
(same `Resolvent/Basic.lean`). The shift `x↦c•x−Ax` on `dom A` is the linear map
`LinearPMap.smulSub c A : A.domain →ₗ[R] E` (`TauCeti/LinearAlgebra/LinearPMap/SmulSub.lean`),
defined as `c • A.domain.subtype - A.toFun`; its kernel `ker(cI−A)` and range `ran(cI−A)` are the
eigenspaces and ranges of §§3.2 and 5.5. The Stone group of a self-adjoint partial operator A is
Tau Ceti's `TauCeti.Semigroups.StronglyContinuousGroup` (`TauCeti/Analysis/Semigroups/Group/Basic.lean`),
a C₀-group of real-linear operators, which is unitary
(`TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary`: each `U(t)` preserves the complex inner
product, hence is complex-linear) and has the complex-linear generator
`TauCeti.Semigroups.StronglyContinuousGroup.complexGenerator`
(`TauCeti/Analysis/Semigroups/Group/Unitary.lean`); by Stone's theorem
`IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`
(`TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean`) a self-adjoint A has exactly one
unitary C₀-group with complex generator `i•A`, the group `U(t)=exp(itA)`, and conversely
`LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul` makes every A with
`i•A` such a generator self-adjoint. §2.3 and §6.3 state their group conclusions through these
declarations. The self-adjoint resolvent results of SelfAdjointSpectralTheory
are implemented in `TauCeti/Analysis/InnerProductSpace/LinearPMap/Resolvent.lean`: every nonreal
scalar is a resolvent point of a self-adjoint partial operator
(`IsSelfAdjoint.mem_resolventSet_of_im_ne_zero`, SA-D17), its spectrum lies in the real axis
(`IsSelfAdjoint.spectrum_subset_im_eq_zero`, SA-D18), and the adjoint of its resolvent at z is
its resolvent at `conj z` (`IsSelfAdjoint.adjoint_resolvent`, SA-D20), an instance of
`LinearPMap.IsFormalAdjoint.adjoint_resolvent_eq`: for formally adjoint A and B with
`z∈ρ(A)` and `conj z∈ρ(B)`, `R_A(z)†=R_B(conj z)`. In
`TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean`,
`LinearPMap.IsFormalAdjoint.norm_smul_sub_sq` is the identity
`‖cx−Ax‖²=(Im c)²‖x‖²+‖(Re c)x−Ax‖²` for symmetric A (Teschl (2009), (2.44), p.66), and
`LinearPMap.IsFormalAdjoint.isClosed_range_smul_sub` gives the closed range of a nonreal shift of
a closed symmetric A. In the same file, for densely defined A,
`LinearPMap.exists_adjoint_apply_eq_of_inner_smul_sub_eq_zero` says that a vector y orthogonal to
the range of `cI−A` lies in `dom A†` with `A†y=conj(c)·y`; and von Neumann's criterion (SA-A21) is
`LinearPMap.isSelfAdjoint_of_surjective_addSub`: on a complete complex Hilbert space, a symmetric
partial operator A for which `x↦Ax+ix` and `x↦Ax−ix` are surjective from `dom A` onto H is
self-adjoint, density of `dom A` being derived from the first surjectivity
(`LinearPMap.dense_domain_of_surjective_add_I`). Relative boundedness is `LinearPMap.IsRelativelyBounded V A a b`
(`TauCeti/Analysis/Normed/Operator/LinearPMap/RelativeBound.lean`): `dom A⊆dom V` and
`‖Vx‖≤a‖x‖+b‖Ax‖` on `dom A`, the coefficient of `‖Ax‖` written second. The Kato–Rellich theorem
is `IsSelfAdjoint.add_of_isRelativelyBounded`
(`TauCeti/Analysis/InnerProductSpace/LinearPMap/KatoRellich.lean`, SA-C55): for self-adjoint A,
symmetric V and `IsRelativelyBounded V A a b` with `b<1`, the sum `A+V`, whose domain is
`dom A`, is self-adjoint, over any `RCLike` field. A closed subspace U reduces A,
`LinearPMap.IsReducing A U` (`TauCeti/Analysis/InnerProductSpace/LinearPMap/Reducing.lean`),
when the orthogonal projection onto U preserves `dom A` and U and its orthogonal complement are
invariant; `LinearPMap.IsReducing.isSelfAdjoint_restrict` makes the reduced part of a
self-adjoint operator self-adjoint. `LinearPMap.HasCore.of_graph_subset_closure`
(`TauCeti/Topology/Algebra/Module/LinearPMap/GraphCore.lean`) makes a submodule of the domain of a
closed A a graph core once the graph of A lies in the closure of the graph of the restriction.
The Hilbert complexification of a real inner-product space X is the type synonym
`WithLp 2 (TauCeti.Complexification X)` of `TauCeti/Analysis/InnerProductSpace/Complexification.lean`,
whose complex inner product `WithLp.instComplexificationInnerProductSpace` gives `x+iy` the norm
`√(‖x‖²+‖y‖²)`; it is complete for complete X (`WithLp.instComplexificationCompleteSpace`), the
real inclusion is isometric (`WithLp.complexification_norm_toLp_ofReal`), and a bounded real
operator T complexifies to `ContinuousLinearMap.complexifyL2 T`, compatibly with composition
(`ContinuousLinearMap.complexifyL2_comp`) and adjoints (`ContinuousLinearMap.adjoint_complexifyL2`),
preserving and reflecting self-adjointness (`ContinuousLinearMap.isSelfAdjoint_complexifyL2_iff`).
The fixed vectors of a conjugate-linear involution K form the real subspace `TauCeti.realPoints K`
(`TauCeti/LinearAlgebra/Complex/Conjugation.lean`).
The projection-valued-measure carrier is `TauCeti.ProjValMeasure X H` from
`TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Basic.lean` (SelfAdjointSpectralTheory SA-B14 and
SA-B21): on an arbitrary measurable space `X` and complex Hilbert space `H`, its fields are `proj`
(the projection of each measurable set), `diag` (finite diagonal measures with
`⟪ξ,P(B)ξ⟫=(P.diag ξ B).toReal`), `proj_univ` (`P(X)=1`) and `proj_inter` (`P(B∩C)=P(B)P(C)`).
Its API at the pin: the bounded integral `TauCeti.ProjValMeasure.integral`, a unital
star-algebra homomorphism on `TauCeti.BoundedBorelFunction X` (`ProjValMeasure/Integral.lean`,
SA-B44), with `TauCeti.ProjValMeasure.norm_sq_integral_apply` (SA-B52); the polarized complex
measures `TauCeti.ProjValMeasure.polarizedComplexMeasure`, with value `⟪ψ,P(B)ξ⟫` on `B`
(`ProjValMeasure/Polarization.lean`, SA-B40), and
`TauCeti.ProjValMeasure.integral_polarizedComplexMeasure_eq_inner_integral`, the matrix elements
of the bounded integral through the pairing `ContinuousLinearMap.mul ℝ ℂ`
(`ProjValMeasure/MatrixElement.lean`, SA-B45); the reindexing `TauCeti.ProjValMeasure.map`
(`ProjValMeasure/Map.lean`, SA-B25) with the change of variables
`TauCeti.ProjValMeasure.integral_map` (SA-B51), the null filter `TauCeti.ProjValMeasure.ae`
(`ProjValMeasure/Null.lean`, SA-B49), and in `ProjValMeasure/DominatedConvergence.lean` the
almost-everywhere invariance `TauCeti.ProjValMeasure.integral_congr_ae` (SA-B50) and the bounded
dominated-convergence theorem
`TauCeti.ProjValMeasure.tendsto_integral_apply_filter_of_dominated_convergence` (SA-B53). Layers 1–3 state their spectral-measure conclusions on this
carrier. The spectral measure of a given unbounded self-adjoint operator (SA-E01) is not at the pin.
The geometric example uses `TauCeti.riemannianVolume` in §2.3, with its manifold
hypotheses, and in §2.4 the finite-CW Euler–Poincaré theorem
`TauCeti.finsum_finrank_singularHomology_of_finite_cwComplex`, the cellular–singular
comparison `TauCeti.cellularSingularHomologyIsoUniv`
(`TauCeti/AlgebraicTopology/Cellular/Comparison.lean`: for a CW structure on the whole of a
Hausdorff space, cellular homology is singular homology once the inclusion of the
`(n + 1)`-skeleton induces an isomorphism on `Hₙ`, an instance for finite-dimensional
complexes), and the incidence numbers `TauCeti.cellularIncidence_zero` (a `1`-cell has
boundary the difference of its endpoints) and `TauCeti.cellularIncidence_eq_inv_cellLocalClass`
(a `2`-cell's incidence numbers are the local degrees of its attaching map).

**From TauCetiRoadmap.SelfAdjointSpectralTheory.** Parts A–E supply the
normalized PVM with its diagonal and polarized measures (SA-B14, SA-B21, SA-B40) and the
bounded integral with its matrix elements (SA-B44, SA-B45), with their API SA-B49–B53
(implemented at the Tau Ceti pin, above) and SA-B54–B57, von Neumann's self-adjointness
criterion (SA-A21), cyclic models (SA-B85), graph cores (SA-C39, Mathlib's `LinearPMap.HasCore`),
Kato–Rellich (SA-C55), nonreal resolvents, reality of the spectrum and resolvent adjoints (SA-D17,
SA-D18, SA-D20; SA-A21, SA-C55 and these three are implemented at the Tau Ceti pin, above),
unbounded spectral PVM (SA-E01) with its resolvent formula (SA-E05) and its uniqueness among
real PVMs satisfying that formula (SA-E44), and Stone identification (SA-E26, SA-E29,
SA-E43). The unbounded integral of arbitrary Borel symbols is Layer 1 here.

**From TauCetiRoadmap.BanachSpaceTheory.** B5 supplies Hilbert dimension and the unitary
classification for complete inner-product spaces over `[RCLike 𝕜]`: for Hilbert bases
`b : HilbertBasis ι 𝕜 H` and `c : HilbertBasis κ 𝕜 H` of one space the lifted cardinals of
`ι` and `κ` agree (`hilbertBasis_lift_mk_eq`), and for Hilbert bases of complete spaces `H`
and `K` a linear isometric equivalence `H ≃ₗᵢ[𝕜] K` exists exactly when the lifted index
cardinals agree (`nonempty_linearIsometryEquiv_iff_lift_mk_eq`). §4.1 uses them at `𝕜 = ℂ`
for the deficiency spaces, with no separability or finite-dimensionality assumption.

**From TauCetiRoadmap.HilbertModules.** H6 supplies closed scalar operator
adjoints, graph domains, the deficiency decomposition and the bijection between
self-adjoint extensions and deficiency-space unitaries, including existence iff
such a unitary exists. Its hypotheses are closedness, density and symmetry. H7 supplies the
interval example built on that H6 deficiency API: the deficiency indices `(1,1)` of `−i d/dt` on
`H₀¹([0,1])` and the parametrization of its self-adjoint extensions `D_λ`, `λ∈𝕋`, by the
condition `α₊=λα₋` on the coefficients along normalized deficiency vectors (consumed in §4.6).

**From TauCetiRoadmap.VonNeumannAlgebras.** V2 supplies completed Hilbert tensors
and bounded tensor maps, the Hilbert space being the completion of Mathlib's inner-product
tensor product (`UniformSpace.Completion (H ⊗[ℂ] K)`, from `TensorProduct.instInnerProductSpace`
and `UniformSpace.Completion.innerProductSpace`); V2.RectangularL2 supplies their arbitrary-measure L²
realization using the maximal rectangle-cover product. V10.ClosedOperators
supplies multiplier-form realization with the full second-moment domain, the spectral
representation `⟪ξ,Tη⟫=∫t dμ^T_(ξ,η)(t)` of a self-adjoint T for its own spectral measure on the
domain `{η : ∫t² dμ^T_η<∞}` (consumed in §1.2), and the
general closed-operator polar decomposition. V10.Affiliation supplies the affiliated-operator
functional calculus with its truncation cores and the spectral multiplier product rule
(consumed in §1.2a and §1.3). Separability is used only for the
single finite-measure cyclic model. V2–V5 supply bounded projections and commutants.

**From the other named suppliers.** PolarDecomposition PD-B23–PD-B34 supplies
bounded rectangular polar factors (initial space PD-B29, final space PD-B32).
BanachAlgebras A2 (Layer 2, §2.1) supplies bounded Riesz idempotents. PDE A1 and A3
(§§1.1, 1.3) supply weak Sobolev derivatives with their interval endpoint traces and the
Bessel-potential comparison; PDE A4 and A6 (§§1.4, 1.6) supply the Sobolev embeddings and
local Rellich compactness used in §5.7. OperatorKTheory §8.4 defines the essential spectrum of a
bounded operator T on a Hilbert space as the set of λ for which `T−λ` is not Fredholm; §3.2
compares it with this roadmap's `essentialSpectrum` of a partial operator.
For a complete real inner-product space H, the Hilbert complexification `H_ℂ`, its isometric
real inclusion `ι_H` and the transport of bounded operators are Tau Ceti's
`WithLp 2 (TauCeti.Complexification H)` and `ContinuousLinearMap.complexifyL2` (above).
GeneralizedCohomology G5.5-RealHilbert works on its own Hilbert synonym
`RealHilbertComplexification H` of `TauCeti.Complexification H`, with the inner product
`⟨x+iy,x′+iy′⟩=(x,x′)+(y,y′)+i((x,y′)−(y,x′))`; on it, it supplies the antilinear isometric
conjugation `J(x+iy)=x−iy` and the unbounded complexification `D_ℂ(x+iy)=Dx+iDy` of a densely
defined real `LinearPMap` D on the complexified domain, with graph and closure transport and
`(D_ℂ)†=(D†)_ℂ` including equality of domains. Tau Ceti's
`WithLp.instComplexificationInnerProductSpace` gives `H_ℂ` the same inner-product formula, and
§4.7 proves that the identity of the underlying `TauCeti.Complexification H` is a complex-linear
isometric equivalence between the two synonyms; J and `D_ℂ` are used on `H_ℂ` through it, and
nothing else of G5.5 is assumed about `H_ℂ`. The coercive solution map over `[RCLike 𝕜]`, the
`J`-commutation and uniqueness properties of the complexified self-adjoint operator and the real
spectral restriction are §4.7 targets; VariationalMethods 5.1 consumes them and supplies nothing
here.
LieGroups Layers 2 and 5 supply the matrix groups and SU(2) covering example.

## How to read the build

Layers 1–3 build unbounded integration, normal/joint calculus and spectral types.
Layer 4 applies H6's extension classifier and develops closed forms; its form
representation needs Layer 1, Mathlib's real Lax–Milgram theorem, Tau Ceti's Hilbert
complexification and GeneralizedCohomology's conjugation and unbounded complexification (carried to it by §4.7's identification of the two synonyms),
independently of Layers 2–3. Layer 5 develops cores, analytic vectors and perturbations. Layer 6 uses the
joint calculus on completed tensor products. The UO-A through UO-F identifiers
name the corresponding targets inside these six layers; the worked examples
apply them with their actual domains.

##### Milestone names and dependency order

The targets are grouped into five milestones, which other roadmaps cite by name and which follow the layer order:

- UO1 is Layer 1 (UO-A01–UO-A08, with UO-A02a).
- UO2 is Layers 2–3 (UO-B01–UO-B05, UO-B03a and UO-C01–UO-C05).
- UO3 is Layer 4 and §§5.2–5.3 (UO-D01–UO-D07, with UO-D01a, and UO-E02–UO-E03).
- UO4 is §5.1 and §§5.4–5.7 (UO-E01, UO-E04, UO-E04a, UO-E05 and UO-E06).
- UO5 is Layer 6 (UO-F01–UO-F04).

A target needs only what its *Needs:* line names, which can be less than all earlier milestones: §4.7, for instance, needs Layer 1 but not Layers 2–3.

## Layer 1: unbounded Borel calculus and spectral correspondences

Let `P` be a normalized PVM on a measurable space `X`, on the carrier `TauCeti.ProjValMeasure X H` (`X=ℝ` for the spectral measure `P_A` of SA-E01, `X=ℂ` in §2.2 and `X=ℝⁿ` in §§2.5–2.6), and `μˣ=P.diag x`, so `μˣ(B)=⟪x,P(B)x⟫`. For a measurable `f:X→ℂ`, construct the spectral integral `f[P]` on exactly
`{x : ∫ ‖f(λ)‖² ∂μˣ < ∞}` by truncating `f` and taking graph limits of the bounded SAST integrals. Prove that its domain is a dense linear subspace, that `f[P]` is closed, and that
`‖f[P]x‖²=∫ |f|² ∂μˣ`. Establish uniqueness from matrix coefficients and the corresponding polarized integral identity. Show that bounded symbols recover SAST's integral without changing its definition.

### 1.1 Spectral-integral domain and action (UO-A01)

Define the unbounded integral using the SAST PVM and diagonal scalar measures; prove its exact domain, linearity, action on spectral cutoffs, and norm-square identity (Teschl (2009), §3.1: the domain (3.25), the cutoffs (3.26) and the graph limit (3.27), p.91, and Theorem 3.2, p.92). Teschl states the construction for PVMs on `ℝ` in a separable space (his standing assumption, §1.2, p.42); it uses no property of the measurable space and no separability, and is carried out here for every `X` and every H. For x in the domain and every y, prove that f is integrable for the variation of the polarized measure `μ_(y,x)=P.polarizedComplexMeasure y x`, with `∫|f| d|μ_(y,x)|≤‖y‖(∫|f|² dμˣ)^(1/2)` from `|μ_(y,x)|(B)≤‖P(B)y‖‖P(B)x‖`, and that `⟪y,f[P]x⟫=∫ f dμ_(y,x)`; with the domain this characterizes `f[P]`. The headline `existsUnique_spectralIntegral` states existence and uniqueness of the partial operator with this domain and these matrix elements, together with density, closedness, the norm-square identity and the adjoint clause of §1.2.

*Needs:* Mathlib Lp and scalar integration; Tau Ceti's `TauCeti.ProjValMeasure` API (SelfAdjointSpectralTheory SA-B14, SA-B21, SA-B40, SA-B44–B45 and SA-B49–B53); HilbertModules H6 graph closure.

**API.**

- The domain is the maximal second-moment subspace, dense in H.
- The integral is closed and its norm square is the second moment.
- Bounded symbols and spectral cutoffs agree with the bounded calculus.

**Checks.**

- On the zero Hilbert space every projection and integral is zero; the norm identity is 0=0. An empty `X` forces `H=0`, since then `I=P(X)=P(∅)=0`.
- For P supported at 0,1, x=(1,2) and f=(2,i), f[P]x=(2,2i) and the squared norm is 8=4+4; omitting conjugation fails this norm identity.
- For counting measure on positive integers, f(n)=n and xₙ=1/n give Σ|xₙ|²=π²/6 but Σ|f(n)xₙ|²=∞, excluding x from the maximal domain.

### 1.2 Adjoint and normality (UO-A02)

Prove `f[P]* = conjugate(f)[P]` with equality of domains, and prove `f[P]` is normal (Teschl (2009), Theorem 3.2, (3.29), p.92); `existsUnique_spectralIntegral` states the adjoint clause (the adjoint has the same domain and the matrix elements of `conj f`). For `f` real P-almost everywhere, prove self-adjointness. Conversely, every self-adjoint partial operator A equals `id[P_A]`, with equality of domains and actions (Teschl Theorem 3.7, p.96). This is not proved again here: VonNeumannAlgebras V10.ClosedOperators proves `⟪ξ,Aη⟫=∫t dμ^A_(ξ,η)(t)` on the domain `{η : ∫t² dμ^A_η<∞}` for its own spectral measure of A, and SelfAdjointSpectralTheory SA-E44 identifies that measure with `P_A`, because it satisfies the resolvent formula SA-E05: the bounded integral of `(z−s)⁻¹` maps into the domain and inverts `zI−A`, using `μ_(y,g[P]x)=g·μ_(y,x)` for bounded g (Teschl (2009), (3.23), p.91). With that identification the domain and the matrix elements of A are those that characterize `id[P_A]` in §1.1. Prove only this transport.

*Needs:* §1.1; SelfAdjointSpectralTheory SA-E01, SA-E05 and SA-E44; VonNeumannAlgebras V10.ClosedOperators spectral representation; HilbertModules H6 adjoint pairing.

### 1.2a Affiliated-calculus comparison (UO-A02a)

For self-adjoint A affiliated with a represented von Neumann algebra M (every self-adjoint operator is affiliated with `B(H)`) and a real-axis Borel symbol f, prove that VonNeumannAlgebras V10.Affiliation's affiliated-operator functional calculus `f(A)` equals `f[P_A]`, with equality of actual domains and actions in that representation. A route: both operators are closed; on `ran P_A({|f|≤n})` both act as the bounded calculus of `f·1_{|f|≤n}`, for `f[P_A]` by the cutoff construction of §1.1 and for V10's calculus because its spectral measure of A is `P_A` (§1.2); the union over n is a graph core for `f[P_A]` by the graph limit of §1.1 and for V10's `f(A)` by its truncation cores. This identification transports V10.Affiliation's product rule to §1.3. It adds no second calculus carrier and no V10-to-UO dependency.

*Needs:* §1.1–§1.2; VonNeumannAlgebras V10.ClosedOperators (spectral measure and cyclic multiplier model) and V10.Affiliation (affiliated calculus and truncation cores).

### 1.3 Sum and product laws (UO-A03)

For Borel `f,g`, prove `(f+g)[P]` extends the sum on `dom f[P] ∩ dom g[P]`, and identify the action there. The spectral sum may have the larger domain `dom (f+g)[P]`; do not assert equality of these domains without a hypothesis (Teschl (2009), Lemma 3.5, (3.38), p.94). The product law
  `dom(f[P]g[P]) = dom g[P] ∩ dom((fg)[P])`
  with `f[P]g[P]=(fg)[P]` on that domain is planned by VonNeumannAlgebras V10.Affiliation as the spectral multiplier product rule of its affiliated calculus (every self-adjoint operator is affiliated with `B(H)`); transport it to SAST's `P_A` through UO-A02a (§1.2a) rather than proving it again (Teschl Lemma 3.5, (3.39), p.94, is the same law). Own here the scalar-multiple, conjugation, positivity, inverse-symbol and iterated-product corollaries, each with explicit domain equalities.

*Needs:* §1.1–§1.2 and §1.2a; VonNeumannAlgebras V10.Affiliation product rule; HilbertModules H6 natural sum/composition domains.

### 1.4 Pushforward and recovery (UO-A04)

Prove `P_{f(A)}(B)=P_A(f⁻¹(B))` for real Borel f (Teschl (2009), (3.67), p.101; the injective recovery is Lemma 3.11, p.101). For a real Borel g, prove `A=g(f(A))` as actual partial operators exactly when `P_A({λ : g(f(λ))≠λ})=0`; in that case prove `P_A(B)=P_{f(A)}(g⁻¹(B))` for every Borel B. State the domain equalities through the second-moment calculus. If a finite scalar control measure μ is given, translate this condition to μ-almost everywhere equality. For separable H, construct such a finite control measure from a countable total family of vectors and prove that existence of a Borel g with this recovery property is equivalent to f being injective on a μ-full Borel set. Supply the standard-Borel inverse-on-image argument, consuming native measurable-equivalence APIs and proving any missing Lusin–Souslin adapter here. For a general nonseparable H use PVM-nullness directly; a finite scalar control measure is not assumed to exist.

*Needs:* §1.1–§1.3; SelfAdjointSpectralTheory SA-E01; native standard-Borel measurable equivalences and scalar measure uniqueness.

### 1.5 Spectral families (UO-A05)

Following Teschl (2009), §3.1, equation (3.14) and the inverse construction on p.89, give the right-continuous increasing projection family `E_A(t)=P_A((−∞,t])`, endpoint limits, interval differences and inverse construction of its PVM. Prove equivalence of spectral families and normalized real PVMs, and compatibility with `P_A` from SAST.

*Needs:* SelfAdjointSpectralTheory bounded PVM and SA-E01; scalar Lebesgue–Stieltjes measure and polarization.

**API.**

- Each E(t) is an orthogonal projection and E(s)≤E(t) for s≤t.
- Right continuity and the limits 0 and I are strong-operator limits.
- The inverse PVM is uniquely determined by P((a,b])=E(b)−E(a).

**Checks.**

- On H=0 the identity is zero, so both endpoint limits and every increment are 0.
- For A=aI on ℂ and a<b, E(a)=E(b)=I: P((a,b])=0 but P([a,b])=I. A left-continuous convention gives the wrong atom.
- For A=diag(0,1), E(1)−E(0)=diag(0,1), the projection of (0,1]; treating the increment as a scalar loses an eigenspace.

### 1.6 Support, spectrum and truncation core (UO-A06)

Prove `supp P_A=σ(A)` in the spectral-support sense (Teschl (2009), Theorem 3.8 and Corollary 3.9, p.97); consume SAST SA-E08 for `P_A(B)=0` on Borel resolvent regions. Give the natural spectral truncations as a graph core of `A`; prove `⋃ₙ ran P_A({|f|≤n})` is a graph core for `f(A)` on its domain, using the finite second spectral moment that defines that domain.

*Needs:* §1.1–§1.3; SelfAdjointSpectralTheory SA-E08; HilbertModules H6 graph cores.

### 1.7 Multiplier model (UO-A07)

Consume V10.ClosedOperators' cyclic multiplier-form theorem to identify `f(A)` with multiplication by `f` on each cyclic summand, including the full square-integrability domain (Teschl (2009), Lemma 3.3, p.92, and Lemma 3.4, p.93). Prove the intertwining identities for adjoints, products, sums and spectral projections under those unitaries. Consume that cyclic-sum multiplier representation and its single finite-measure model under its stated separability hypotheses. Do not reconstruct V10's direct-integral decomposition. The L² headline `existsUnique_maximal_multiplier` states existence and uniqueness of this closed densely defined maximal operator on every measurable space and every measure; realness means star(f)=f almost everywhere for that measure. Its domain is expressed by native `MemLp`, including strong measurability of the product representative. For a measurable multiplier represented by a function `h : X → ℂ` on the existing complex `Lᵖ(μ;ℂ)` carrier, make its maximal domain exactly `{u ∈ Lᵖ : h·u ∈ Lᵖ}` and prove the domain and operator action are unchanged when either the multiplier or the input representative is changed on a null set; for the self-adjointness theorem restrict to the Hilbert space `L²(μ)` and real-valued measurable `h`, prove density of the maximal domain by the cutoffs `1_{|h|≤n}u`, and state the measurable-space hypotheses. For scalar a.e. classes on a space with measurable singletons, point evaluation at `x` is representative-independent exactly when `μ({x})>0`; do not conflate it with the a.e.-defined multiplier action.

*Needs:* Mathlib Lp, MemLp and dominated convergence; VonNeumannAlgebras V10.ClosedOperators for the cyclic-model comparison; §1.1–§1.3 for intertwining.

**API.**

- The maximal L² domain is precisely the native MemLp condition on f·x.
- Changes on null sets preserve the domain and action.
- The realization is closed and dense; real symbols almost everywhere give self-adjointness.

**Checks.**

- For f=0, every L² class is in the domain and the output is 0; a proper-domain zero operator is excluded.
- For f=i on a one-point probability space, the domain is ℂ and the action is ix; its adjoint is −iI, so realness cannot be dropped.
- For f(n)=n on counting measure, xₙ=1/n is excluded while xₙ=1/n² is included, with weighted squared norm π²/6.

### 1.8 Calculus comparison adapters (UO-A08)

Prove H6's unbounded continuous calculus agrees with UO-A01 for continuous symbols, with equality of actual domains and actions. UO-A07 already owns the spectral-integral identification with V10's cyclic multiplier models and their square-integrability domains; cite it rather than duplicate that comparison. The comparison with VonNeumannAlgebras V10.Affiliation's affiliated-operator functional calculus is UO-A02a (§1.2a). Add no second calculus carrier and no V10-to-UO dependency.

For the unbounded Borel calculus the following hold on actual domains. The unbounded-symbol dominated-convergence majorant is `|Uψ|²|h∘f|`, integrable by Cauchy–Schwarz for ψ∈D(h(A)); D(A) alone does not imply h(A)ψ exists. For A=M_x and h(x)=x², `ψ(x)=(1+|x|)^(−2)` is in D(A) but not D(A²). A bounded spectral cutoff makes h(A) bounded there when h is bounded on the window (in particular for continuous or polynomial h), not for every Borel h: on L²[−1,1], h(x)=1/|x| for x≠0 and h(0)=0 remains unbounded after the whole-window cutoff. For complex h the result is `I(h)*=I(conj h)` with the matching domains; self-adjointness requires h to be real P_A-almost everywhere, explicitly P_A({λ:Im h(λ)≠0})=0, equivalently h is real μ_x-almost everywhere for every diagonal scalar spectral measure μ_x(B)=⟨x,P_A(B)x⟩. This is not a Lebesgue-a.e. premise or a premise on only one vector. The constant h=i controls the false inference from equal domains to equal actions, while the intended real-coordinate spectral integral remains self-adjoint.

In a uniqueness argument for spectral PVMs, compact-interval polynomial density identifies the measures only after equality of their polynomial test integrals is established; merely writing the same cutoff-polynomial p(A) does not yet identify two unknown PVM-dependent cutoffs. Consume SAST's existing spectral-PVM uniqueness/Stone or unique-resolvent route, rather than building a second PVM. For a spectral family, `E(b)=E(a)` gives `P((a,b])=0`, not necessarily `P([a,b])=0` when there is an atom at a. If (a,b) contains no spectrum and λ∈(a,b), the lower bound `‖(A−λ)x‖≥min(λ−a,b−λ)‖x‖` on dom A still holds because the endpoints are at the gap distance; surjectivity of A−λ additionally uses the self-adjoint range-perpendicular/kernel argument and closed range.


**Multiplier and Borel-calculus comparisons.** In the adjoint computation for Q=M_x, do not assert xφ∈L² or that the difference with Q*φ lies in its adjoint domain before proving it. Test first against bounded-support L² vectors to obtain xφ=Q*φ locally a.e.; then the L² representing vector gives global domain membership. This consumes A07's maximal real-multiplier theorem. In the fixed SAST convention `R(z)=(zI−A)⁻¹`, `(A+i)⁻¹=−R(−i)` and `(A−i)⁻¹=−R(i)`. For the chosen model `U(A+i)⁻¹U⁻¹=M_F`, injectivity and the finite scalar model give F≠0 a.e. and f=F⁻¹−i. For the converse, if u,fu∈L², set `v=(f+i)u=F⁻¹u∈L²`; then `M_Fv=u`, which proves the transported domain equality. The product `M_F M_(F⁻¹+i)` is multiplication by `1+iF`, not the identity. To test reality of f, choose positive-measure sets with |f| bounded and Im f bounded away from0, of each sign. Their indicators lie in D(M_f), allowing the symmetric quadratic-form test; merely being in ambient L² is insufficient.

For self-adjointness of a function of A use the already stated real-PVM-a.e. condition, not pointwise reality on allℝ, and the product domain `D(f(A)g(A))=D(g(A))∩D((fg)(A))`. For a nonconstant complex polynomial p of true degree d, prove `D(p(A))=D(A^d)` by the two scalar growth bounds comparing `1+|p(t)|²` with `1+|t|^(2d)`, and identify the polynomial sum on that domain. A constant polynomial has full domain H. Do not retain dummy zero high-degree partial-operator terms: for unbounded self-adjoint A, the natural expression `I+0•A` has domain D(A), while the constant spectral polynomial1 gives I on all H. This uses native scalar multiplication's actual-domain convention rather than pretending its zero multiple is total.

Own the exact spectral essential-image formula for every complex Borel symbol h in this existing calculus (the real case is Teschl (2009), Lemma 3.12, p.101, and Theorem 3.18, p.105):
`σ(h(A))={z∈ℂ:∀ε>0, P_A({t:|h(t)−z|<ε})≠0}`.
Outside this set use a bounded reciprocal symbol and prove both inverse identities and its image in D(h(A)); inside it use normalized vectors in the nonzero bounded-symbol windows to prove failure of bounded invertibility. For the maximal real measurable multiplier on a σ-finite base, specialize this to the usual measure-essential-range condition `∀ε>0, μ({x:|h(x)−z|<ε})>0`; use finite positive pieces for its test vectors. This is the exact spectrum formula, not closure of raw pointwise range. On L²[0,1] the multiplier `h=1_{ {0} }` is zero, with spectrum{0}, although its raw range is{0,1}. Null-set modifications must not change the operator or its spectrum. The represented PVM formula uses `M_(χ_Δ∘f)=M_(χ_(f⁻¹Δ))` on M, not an uncomposed real-axis indicator on the wrong carrier.

Simple functions on finitely many bounded intervals vanish outside a bounded set and cannot approximate1 uniformly onℝ. Consume SAST SA-B39's arbitrary Borel finite-range uniform approximation, or first approximate on compact spectral windows and then pass to strong limits using finite diagonal scalar measures. Do not assert operator-norm convergence from bounded pointwise cutoff convergence. In the multiplier representation the base integral is against μ on M; the scalar spectral measure μψ onℝ is related by the proven pushforward/matrix-coefficient identity, not silently identified with that base measure.

Write the mixed-calculus identity with its domains. For ψ∈D(f(A)) and φ∈D(g(A)), prove the scalar formula `⟨f(A)ψ,g(A)φ⟩=∫conj(f)g dμ_(ψ,φ)` and the integrability estimate `∫|f g|d|μ_(ψ,φ)|≤‖f(A)ψ‖‖g(A)φ‖`, by simple spectral sums and moment truncation. If also φ∈D((conj(f)g)(A)), prove the strong form `⟨f(A)ψ,g(A)φ⟩=⟨ψ,(conj(f)g)(A)φ⟩`. The extra product moment is needed for the displayed operator vector, rather than hidden in the phrase “where this makes sense”. These are domain statements on the existing PVM, scalar measures and calculus, not another integration theory.

**Spectral-family and Stone comparisons.** Consume A05/C01 and SAST's existing spectral PVM and native Stone carrier adapters. For a<b, make the interval endpoints explicit: `P((a,b])=E(b)−E(a)`, `P((a,b))=E(b−)−E(a)`, `P([a,b])=E(b)−E(a−)` and `P([a,b))=E(b−)−E(a−)`. E is constant on each spectral gap, not one common value on the entire resolvent complement. A closed-window formula `P([a,b])=E(b)−E(a)` agrees with these in the Q=M_x Lebesgue example because its endpoint atoms vanish; the generic difference is the half-open window. An atom at the left endpoint, for example A=(λ−ε)I on nonzero H, distinguishes them. The normalized Q-window vectors have exact residual norm squared1/(3n²). The Cauchy/nonzero-limit eigenvector criterion is C01's; closedness gives an actual nonzero eigenvector, so it is not replaced by bare approximate vectors. C04 owns a common-domain bounded difference with arbitrarily small norm and its staircase pure-point decomposition, not an operator-norm space containing an unbounded A.

For the positive Stone convention `U(t)=e^(itA)`, the self-adjoint action is `Aψ=−i lim_(t→0)(U(t)ψ−ψ)/t`; the native complex generator is iA. The sinc expression `|(e^(itλ)−1)/t|` converges pointwise to |λ|, but its oscillations do not supply one monotonicity neighborhood for an unbounded spectral parameter. From convergence of the Hilbert difference quotients, bound their squared norms and apply Fatou along nonzero t_n→0 to get `∫λ²dμ_ψ≤liminf_n∫|(e^(it_nλ)−1)/t_n|²dμ_ψ<∞`. This proves domain inclusion. On D(A), use `|(e^(itλ)−1)/t|≤|λ|` and domination by4λ² for the derivative error to prove the reverse inclusion and action. This is a proof route, not a request to rebuild `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` or SAST's Stone adapter. For norm continuity of the group consume native `StronglyContinuousSemigroup.continuousAt_zero_iff_domain_eq_top` and `.continuous_iff_domain_eq_top` on the positive-time half, then the inverse group; boundedness follows by the native closed graph theorem. The single-convolution set `{∫φ(t)U(t)x dt : φ∈C_c^∞(ℝ), x∈H}` is total; its linear span is the invariant linear core. Smooth compact time convolution is H-valued Bochner integration, with a common compact majorant for small translation quotients. Deficiency scalar ODEs on that span and equality on a dense set are valid comparisons with the implemented theorem.

**Measure and Lp supplier adapters (owned by UO-A01/UO-A07).** Use Mathlib's existing measurable-space, Borel-space, measure, `SFinite`/`SigmaFinite`, `SimpleFunc`, `AEEqFun`, `Lp`, positive Radon–Nikodym, and signed-vector-measure carriers. Do not introduce parallel measure or equivalence-class types. For positive measures, the native `Measure.HaveLebesgueDecomposition ν μ` concerns first argument ν relative to reference μ; consume its general instance under `[SFinite ν] [SigmaFinite μ]`, and do not treat decomposition existence as absolute continuity. With that class, use `Measure.absolutelyContinuous_iff_withDensity_rnDeriv_eq` in the exact orientation `ν ≪ μ ↔ μ.withDensity (ν.rnDeriv μ)=ν`, equivalently vanishing of `ν.singularPart μ`. Keep the absolute-continuity hypothesis explicit in Radon–Nikodym reconstruction. State positive densities as `ℝ≥0∞`-valued. For a signed measure `s`, use the native real-valued vector-measure density `withDensityᵥ` against the `ENNReal` vector measure of a σ-finite reference `μ`, with the exact hypothesis `s ≪ᵥ μ.toENNRealVectorMeasure`; do not state a signed RN theorem without that reference-measure condition.

For absolute continuity consume native `AbsolutelyContinuousOnInterval`, its epsilon-delta characterization, a.e. differentiability, derivative interval integrability and fundamental theorem from the individual AbsolutelyContinuous/DerivIntegrable/AbsolutelyContinuousFun modules. The displayed native FTC statements are real-valued; derive the complex-valued formulas by Re/Im and their finite-component reconstruction, rather than claiming a broader native theorem. For the positive Borel measure example fix Lebesgue λ and a locally finite ν. Define the signed cumulative F based at0 and prove `ν≪λ` iff F is absolutely continuous on every compact interval, using RN's locally integrable density and native indefinite-integral AC in one direction, then interval increments/measure uniqueness in the other. The null-set inclusion is the one from λ to ν: λ-null sets must be ν-null. For finite ν, also prove the global uniform-AC conclusion from its L¹ RN density. The local-finiteness/locality qualifiers matter: ν with density1/x on(0,1) is absolutely continuous but makes ν((0,x]) infinite for x>0; the locally finite density2|x| gives F(x)=x|x|, locally AC but not globally uniformly AC, as the intervals[n,n+1/n] show. Do not infer FTC merely from a.e. differentiability and integrability of the derivative; the AC hypothesis or an actual indefinite-integral representation is needed.

In the interval derivative example, `AC[0,1]` with an L² derivative is the existing H¹ space with its unique continuous representative; it is not all AC functions. Its minimal two-zero-trace domain is H¹_0, dense because it contains C_c∞(0,1), not because it contains every polynomial. Consume PDE weak derivatives/traces and UO-D05/V10's interval model. For the+i derivative on that minimal domain the full adjoint is+i derivative on H¹. In its reverse-inclusion proof, ξ=A*φ∈L² and h(x)=∫₀ˣξ give h−iφ orthogonal to all mean-zero L² vectors, because `{ψ′:ψ∈H¹_0}` is exactly that hyperplane. Hence φ=c−ih and iφ′=ξ. Periodic and quasiperiodic self-adjoint domains come from the existing boundary classification; their negative-translation groups use the requisite continued representatives. The minimal two-zero-trace domain is not invariant under those circle translations. These are sign, representative and proof adapters on the existing interval derivative and measure carriers.

For integral tests of equality prove the qualified versions: one equality `∫ (u−v) dμ = 0` does not imply `u=v` almost everywhere, and convergence of signed integrals does not imply `L¹` convergence. Use `AEEqFun`'s a.e. quotient; an integral characterization of equality tests integrals on every measurable finite-measure set and states its exponent and local-integrability hypotheses. `eLpNorm` is the Lp norm/gauge, with absolute value and exponent in the integrand; a signed integral is not a norm. Do not infer integrability of every continuous function from Borelness of the measure (for example, the constant one is not integrable for Lebesgue measure on ℝ).

The positive and signed density adapters are interfaces to Mathlib's measure theory, not a second measure library. In the Euclidean position application a physical-model consumer uses the full-support and ball-volume facts: for a continuous representative on `ℝ^N`, `N≥1`, prove uniqueness in its `L²(volume)` class and the normalized formula `vol(B_R)⁻¹ ∫_{B_R} f(x) dx → f(0)`. The unnormalized integral tending to zero follows from Cauchy–Schwarz and `vol(B_R)→0` but does not characterize the point value. This application belongs to such a consumer, not to a new generic UO measure milestone.

**Acceptance examples.** Exact norm of `A P_A([−α,α])` as the essential supremum of `|λ|` on that spectral window (zero when the projection is zero); self-adjoint operators agreeing on a dense subspace versus the uniqueness of a self-adjoint operator vanishing on a dense subspace; Borel reindexing of point and continuous spectrum; continuous spectral-family transport under a continuous function; and spectral projections of a diagonal multiplication operator.

*Needs:* §1.1–§1.3 and §1.7; HilbertModules H6 continuous calculus.

### Examples

The scalar atom, the two-atom diagonal and the maximal multiplier in §§1.1, 1.5 and 1.7 distinguish endpoints, null sets and proper domains.

### Dependencies

Mathlib scalar measure/Lp theory; Tau Ceti's `TauCeti.ProjValMeasure`; SelfAdjointSpectralTheory Parts B–E; HilbertModules H6; VonNeumannAlgebras V10 for the representation converse of §1.2, the comparison of §1.2a, the product rule of §1.3 and the cyclic models of §1.7.

## Layer 2: normal operators and joint spectral theory

A normal unbounded operator is a closed densely defined complex-linear partial operator `N` with `dom N=dom N*` and `‖Nx‖=‖N*x‖` on that domain (equivalently, equality of the closed products `N*N=NN*` with their actual domains). Build its complex PVM and Borel calculus on `ℂ`, agreeing with Part A for self-adjoint operators viewed on the real axis. With B02's normal spectral PVM `P_N` and `μ_N^x(B)=⟨x,P_N(B)x⟩`, define the **closed** real and imaginary parts by

`Re N=∫_ℂ Re(z) dP_N(z)`, `dom(Re N)={x:∫_ℂ |Re z|² dμ_N^x<∞}`,

`Im N=∫_ℂ Im(z) dP_N(z)`, `dom(Im N)={x:∫_ℂ |Im z|² dμ_N^x<∞}`.

Prove they are self-adjoint and strongly commute through the two marginal PVMs, and prove `dom N=dom(Re N)∩dom(Im N)` from `|z|²=|Re z|²+|Im z|²`. Recover `N=Re N+i Im N` on exactly this intersection. Also prove that these spectral operators are the closures of the natural algebraic parts `(N+N*)/2` and `(N−N*)/(2i)`, each initially defined on `dom N`. The spectral cutoffs `P_N({|z|≤n})x` lie in `dom N` and converge in each coordinate graph norm for every x in that coordinate's own moment domain; this supplies the two closure comparisons without equating the initial domains to their possibly larger closures. As a domain regression, for unbounded self-adjoint A and `N=iA`, the algebraic real part is zero on `dom A`, while `Re N` is zero on all H and `Im N=A`.

### 2.1 Normal operator API (UO-B01)

Develop closedness, scalar multiplication, adjoints, resolvents, restrictions to reducing subspaces (Tau Ceti's `LinearPMap.IsReducing`, with self-adjoint reduced parts by `LinearPMap.IsReducing.isSelfAdjoint_restrict`), kernels, eigenspaces, and the polar decomposition of a closed normal operator, specializing VNA V10's general polar decomposition. Identify V10's `|T|=(T*T)^(1/2)` with the UO-A01 spectral square root by uniqueness of positive square roots and equality of their actual domains; then prove the normal-operator domain equalities. Prove the closed symmetric normal criterion: a closed symmetric operator is normal exactly when it is self-adjoint (normality as in Teschl (2009), p.91, after (3.27); the polar decomposition of a closed operator as in Teschl Problem 3.11, p.99).

*Needs:* HilbertModules H6 closed adjoints; VonNeumannAlgebras V10 polar decomposition; §1.1–§1.3 for the square-root comparison.

**API.**

- Normality includes closedness and equality of adjoint domains.
- The spectral real and imaginary parts have their separate coordinate-moment domains.
- Their intersection is the domain of N and their sum reconstructs N there.

**Checks.**

- For N=diag(1,i), N*N=NN*=I, Re N=diag(1,0) and Im N=diag(0,1).
- For N=iM_n on ℓ², Re N is total zero, whereas the algebraic real part has domain D(M_n); xₙ=1/n distinguishes the domains.
- For N=[[0,1],[0,0]], N*N=diag(0,1) and NN*=diag(1,0), rejecting a nonnormal operator.

### 2.2 Normal spectral theorem (UO-B02)

Construct the normalized PVM on `ℂ`, prove the square-integrability domain and the spectral integral theorem, and derive the real/imaginary marginal PVMs. The scalar control measures and cyclic multiplication models consume V10. The headline `existsUnique_projValMeasure_of_normal` states that a closed densely defined N with `dom N*=dom N` and `‖Nx‖=‖N*x‖` there has exactly one normalized PVM `P_N` on `ℂ` (a `TauCeti.ProjValMeasure ℂ H`) with `dom N={x : ∫|z|² dμ_N^x<∞}` and `⟪y,Nx⟫=∫ z dμ_(y,x)` for the polarized measures; by §1.1 this says `N=z[P_N]`.

*Needs:* §2.1; §1.1–§1.3 on `X=ℂ`; VonNeumannAlgebras V10 cyclic models.

### 2.3 Strong commutation (UO-B03)

For self-adjoint `A,B`, prove equivalence of (i) commuting spectral projections `P_A(Ω)`, `P_B(Ω′)` for all Borel sets, (ii) commuting resolvents `R_A(z)`, `R_B(w)` at one pair of resolvent points `z∈ρ(A)`, `w∈ρ(B)`, equivalently at every such pair, and (iii) commuting Stone groups `exp(isA)` and `exp(itB)` for every `s,t` (Teschl (2009), Lemma 4.5, p.116, (4.24)–(4.25), Lemma 4.9 and Problem 4.2, p.117, and (5.5), p.126). Teschl's (4.24) also asks for commutation of `R_A(conj z)` with `R_B(w)`; it follows from commutation at z by Fuglede's theorem (Mathlib's `IsStarNormal.commute_star_right`), since `R_A(z)` is a bounded normal operator with adjoint `R_A(conj z)` (SA-D20). A and B **strongly commute** when these equivalent conditions hold. The headline `commute_resolvent_iff_commute_stoneGroup` states (ii)⇔(iii) at an arbitrary pair `z∈ρ(A)`, `w∈ρ(B)`, real points of the resolvent sets included, for the unitary C₀-groups U and V of Tau Ceti with complex generators `i•A` and `i•B` (so `U(s)=exp(isA)`, `V(t)=exp(itB)`, and A, B are self-adjoint by Stone's theorem); form (i) needs the spectral measures `P_A`, `P_B` of SA-E01. A route for (ii)⇔(iii): apply Teschl's Lemma 4.9, p.117, which characterizes commutation of a bounded operator with a self-adjoint operator through its group, first to the bounded operator `R_B(w)` and A, then to each `exp(isA)` and B, with Fuglede's theorem supplying the conjugate parameters. Its inputs are these. `R_A(z)` is the bounded integral of `s↦(z−s)⁻¹` against `P_A` (§1.2, from SA-E05 at a nonreal z; at a real resolvent point `P_A` vanishes on a neighbourhood of z by SA-E08, so the symbol is bounded where `P_A` lives). The Stone group is `U(s)=e^(is·)[P_A]`: these bounded integrals form a unitary C₀-group with complex generator `i•A` (§1.1 and dominated convergence), and Tau Ceti's Stone theorem makes that group unique. A bounded operator C that commutes with `R_A(z)` and `R_A(conj z)` commutes with every bounded Borel `f[P_A]`, in particular with every `P_A(Ω)` and every `U(s)` (Teschl Lemma 4.5, p.116): the ∗-algebra generated by `s↦(z−s)⁻¹` is dense in the continuous functions on σ(A) vanishing at infinity (Teschl Lemma 4.4, p.115, the Stone–Weierstrass theorem `ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints` on the one-point compactification of σ(A); one resolvent point, real or not, suffices because `λ↦(z−λ)⁻¹` is injective on σ(A)), and a bounded Borel f is reached from that algebra vector by vector. For x∈H, approximate f by continuous compactly supported `f_n` in `L²(μ_A^x+μ_A^(Cx))`, the sum of the two finite diagonal measures (`MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`; the sum is regular by `MeasureTheory.Measure.Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`). Then `TauCeti.ProjValMeasure.norm_sq_integral_apply` gives both `f_n[P_A]x→f[P_A]x` and `f_n[P_A]Cx→f[P_A]Cx`, so `Cf[P_A]x=lim Cf_n[P_A]x=lim f_n[P_A]Cx=f[P_A]Cx`. Approximation in `L²(μ_A^x)` alone, as in Teschl's proof of Lemma 4.5, leaves the second limit open; the bound `μ_A^(Cx)≤‖C‖²μ_A^x`, which follows from the continuous case through `‖g[P_A]Cx‖=‖Cg[P_A]x‖`, would also close it. Conversely, a bounded operator commuting with every `U(s)` commutes with the Fourier integrals `J_f` of the next paragraph, whose symbols include all Schwartz functions and are therefore dense in those continuous functions, hence with `R_A(z)`. None of these proofs uses Teschl's standing assumption that Hilbert spaces are separable (§1.2, p.42). A common invariant graph core with `AB=BA` is still insufficient. Verify Nelson's Section 10 construction below: it gives two self-adjoint closures whose restrictions to the same invariant domain are essentially self-adjoint (hence the domain is a graph core for each), commute there, and have noncommuting Stone groups. The twisted-cylinder example is a separate, simpler dense-invariant-domain contrast; it is not a common graph core for both operators.

Fix the Fourier comparison explicitly. With `F_-f(λ)=∫exp(−2πitλ)f(t)dt` and the positive Stone group, define `J_f x=∫f(t)exp(+i2πtA)xdt` as an H-valued Bochner integral for f∈L¹(ℝ). Prove `‖J_f‖≤‖f‖₁` and `J_f=(F_-f)(−A)`; using exp(−i2πtA) instead gives (F_-f)(A). Use scalar spectral-measure Fubini and the existing bounded calculus; operator-norm Bochner measurability of an unbounded-generator group in B(H) is not assumed. In the commutation proof, simple-function approximation of a bounded Borel symbol at a vector x is against `μ_A^x+μ_A^(Cx)`, for the bounded operator C of the commutant step, so that it converges at x and at Cx together, or is by uniformly bounded pointwise approximants, which converge strongly at every vector; exponentials are not Lebesgue-L¹ functions. The generic commutation and norm-square endpoints remain B03/A01. The generator domain is the derivative-limit domain, and the self-adjoint action is `Aψ=−i lim_(t→0)(U(t)ψ−ψ)/t`. The single-convolution set is total; use its linear span for a linear core.


**Nelson's common-core counterexample.** Construct the translation surface of *Analytic Vectors*, §10, pp. 604–606, explicitly as follows. Let `M₁=[0,3]²\(1,2)²` and remove its twelve integer-coordinate points other than the four outer corners to get `M₂`. On its boundary identify by translations:

- `(0,y)~(3,y)` for `y∈(0,1)∪(2,3)`;
- `(0,y)~(1,y)` and `(3,y)~(2,y)` for `y∈(1,2)`;
- `(x,0)~(x,3)` for `x∈(0,1)∪(2,3)`;
- `(x,0)~(x,1)` and `(x,3)~(x,2)` for `x∈(1,2)`;
- the four outer corners are all identified.

**Exact-domain and common-core comparisons.** The proper-common-core counterexamples are B03's. A commutator of self-adjoint operators need not be densely defined; give a simple explicit witness on the existing ℓ²(ℕ) carrier: let A be the maximal self-adjoint diagonal n, let φ be the normalized sequence proportional to1/(n+1), and let B be its rank-one orthogonal projection. Then φ∉D(A), B is bounded self-adjoint, `D(AB)=φ⊥`, `D(BA)=D(A)`, and the common commutator domain `D(A)∩φ⊥` is not dense in H.

For the stronger hypothesis that the full intersection `D=D(A)∩D(B)` is dense and invariant under both operators, prove: for two closed symmetric A,B, if this exact intersection is dense and invariant under A and B, then both A and B are everywhere defined and bounded, even without AB=BA. Equip D with the complete norm `‖x‖_D=‖x‖+‖Ax‖+‖Bx‖`, obtained from its closed triple graph in H³; the incomplete inherited ambient norm is not used. Invariance and closedness make A_D,B_D:D→D have closed graphs. Consume native `LinearMap.continuous_of_isClosed_graph`/`ContinuousLinearMap.ofIsClosedGraph` to obtain a finite C≥0 with `‖A²x‖+‖B²x‖≤C(‖x‖+‖Ax‖+‖Bx‖)`. Put y²=‖Ax‖²+‖Bx‖². Symmetry and Cauchy–Schwarz give `y²≤C‖x‖²+√2 C‖x‖y`; Young gives `y²≤2(C+C²)‖x‖²`. Extend both restrictions boundedly from dense D to H, and use closedness to put their full graphs in A,B, proving the conclusion. If they also commute on D they therefore commute strongly. The existing Nelson example has a proper common invariant graph core, not this invariant full intersection; do not use it to refute the stronger theorem or weaken the correct B03 warning.

WOT and SOT coincide as relative topologies on the unitary group when the limit is unitary: `‖(V−U)x‖²=2‖x‖²−2Re⟨Vx,Ux⟩` gives the reverse implication. A bilateral-shift sequence may converge WOT to0 outside that group and does not contradict it. In finite-dimensional H all three operator topologies coincide; in infinite dimension an unbounded-generator unitary group is strongly continuous but not norm continuous, giving strictness with a unitary limit. Boundedness of SOT/WOT-convergent sequences is Mathlib's `banach_steinhaus` (uniform boundedness); the distinction from arbitrary nets is recorded here. For joint spectral measures of commuting families use B03's existing H-valued Fourier integration/strong approximation argument and B04/B05's joint PVM and smoothing span. Merely saying rectangles generate the Borel sets supplies uniqueness, not the missing countable-additive extension proof; consume that actual joint-PVM construction. With the positive Stone convention, the negative translations `U(t)f(x)=f(x−t)` have generators+i∂_j, distinct from the usual physical momentum−i∂_j. The fixed-axis pullback f(R_θx) is a one-parameter group, because the rotations `R_θ` about one axis commute; a full rotation action uses its declared inverse/active convention, since f(Rx) reverses multiplication order.

For the B03 operator example, prove the regular quotient is a Hausdorff, second-countable smooth surface with the displayed translation atlas and descended flat Riemannian metric. Supply its `RiemannianBundle` and `IsContinuousRiemannianBundle` instances, the Borel measurable-space structure with `BorelSpace M`, and `LindelofSpace` from second countability, together with the smooth-manifold instance required by native `TauCeti.riemannianVolume`. Prove the translation-chart orientation and area form `dx∧dy` descend, with its positive measure agreeing with the descended flat Riemannian volume. Translation charts have Gram determinant one, so use the native chart-volume characterization `eq_riemannianVolume_iff` to identify that measure with Lebesgue measure transported from `int M₁`, after removing the finitely many glued boundary arcs and punctures, which are null. Keep completion and genus in the separate UO-B03a acceptance target below. On `H=L²(M,dx dy)` put `D=C_c^∞(M)` and use the chart fields `X₀=∂ₓ`, `Y₀=∂ᵧ`. Prove D dense and invariant, integration-by-parts skew-symmetry and `X₀Y₀=Y₀X₀` there. Own Nelson Lemma 10.1's flow criterion: for a smooth divergence-free field, if the **closures** `E_t,E_(-t)` of the sets where the respective partial flows are undefined are null for some `t>0`, then its restriction to `C_c^∞` is essentially skew-adjoint. Prove this from the measure-preserving partial flows and their contraction extensions. For each `(a,b)`, show those exceptional closures for `aX₀+bY₀` are finite unions of straight segments leading to the removed vertices, in both time directions for each finite t; include vertical directions and the zero field. Thus every real linear combination is essentially skew-adjoint on D. Put `X=cl(X₀)`, `Y=cl(Y₀)`, `A=−iX`, `B=−iY`; prove these are self-adjoint and D is a graph core for each. Their Stone groups are `e^(itA)=e^(tX)` and `e^(isB)=e^(sY)`. Fix the pullback convention `e^(tX)u=u∘φ_t^x`, so supports move by `φ_(-t)^x`, and likewise for Y. Under the pullback convention fixed here, the positive-exponential products `e^Xe^Yu` and `e^Ye^Xu` each have support in `(2,3)×(2,3)`; `(3,3)` is the regular corner of that target square. The distinct-support witness uses inverse flows: for a nonzero smooth u compactly supported in `(0,1)²`, calculate that `e^(-X)e^(-Y)u` is supported in `(0,1)×(1,2)`, while `e^(-Y)e^(-X)u` is supported in `(1,2)×(0,1)`. The nonzero images have disjoint supports, so these groups and hence their spectral PVMs do not commute. This supplies the common invariant graph-core counterexample with essential self-adjointness proved from the flow criterion.

*Needs:* SelfAdjointSpectralTheory SA-D17 and SA-D20; SA-E01 for `P_A` (form (i), and the bounded functions `f[P_A]` of the route); SA-E05 and SA-E08 for the resolvent as a bounded spectral integral; SA-E26 and SA-E43; Tau Ceti's unitary C₀-groups and Stone's theorem `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`; Mathlib's Fuglede theorem `IsStarNormal.commute_star_right`; for Teschl's Lemmas 4.4–4.5, Mathlib's Stone–Weierstrass theorem `ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints` and compactly supported approximation `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le` against the regular measure `μ_A^x+μ_A^(Cx)` (`MeasureTheory.Measure.Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`), with Tau Ceti's `TauCeti.ProjValMeasure.norm_sq_integral_apply`; §1.1–§1.2; for the counterexamples and comparisons, Mathlib's closed graph theorem `LinearMap.continuous_of_isClosed_graph`, `banach_steinhaus`, `RiemannianBundle` and `IsContinuousRiemannianBundle`, Tau Ceti's `TauCeti.riemannianVolume` with `eq_riemannianVolume_iff`, PDE integration by parts for the flow example, and the translation-surface construction in this section.

**API.**

- Strong commutation of self-adjoint A and B is commutation of `R_A(z)` and `R_B(w)` at one pair of resolvent points; it then holds at every pair, and at `conj z` by Fuglede's theorem.
- It is equivalent to `exp(isA)exp(itB)=exp(itB)exp(isA)` for all real s and t (`commute_resolvent_iff_commute_stoneGroup`) and to commutation of all spectral projections `P_A(Ω)` and `P_B(Ω′)`.
- For bounded self-adjoint B it is ordinary commutation of B with `R_A(z)`, since `B=w−R_B(w)⁻¹`; commutation of A and B on a common invariant graph core does not imply it.

**Checks.**

- For the Pauli matrices X and Z on ℂ², `(iI−X)(iI+X)=−2I` gives `R_X(i)=−(iI+X)/2`, and likewise for Z, so `R_X(i)R_Z(i)−R_Z(i)R_X(i)=(XZ−ZX)/4`, with `XZ−ZX=[[0,−2],[2,0]]≠0`; on the group side `exp(iπX/2)=iX` and `exp(iπZ/2)=iZ` give the products `−XZ≠−ZX`. Both forms fail, as the equivalence requires.
- For A=diag(0,1) and the real resolvent point z=1/2, `R_A(1/2)=diag(2,−2)`, which commutes with every diagonal matrix and with no non-diagonal one: with B=diag(2,3) both forms hold, while with B=X, `diag(2,−2)X≠X diag(2,−2)` and `exp(iπA)=Z` does not commute with `exp(iπX/2)=iX`. So one real resolvent point already decides strong commutation, as the headline's arbitrary pair `z∈ρ(A)`, `w∈ρ(B)` allows.
- For A=B, `R_A(z)` and `R_A(w)` commute by the resolvent identity and `exp(isA)` and `exp(itA)` commute; on the zero Hilbert space both forms hold trivially. Nelson's surface below gives self-adjoint A, B commuting on a common invariant graph core whose groups do not commute, so by the equivalence their resolvents do not commute either: commutation on a core is not strong commutation.
- The commutant step of the route needs its approximants to converge at x and at Cx. For A=diag(0,1), x=e₁ and the vector e₂=Xx, `μ_A^x=δ₀` and `μ_A^(e₂)=δ₁`; the constants `f_n≡0` tend to `1_{1}` in `L²(δ₀)`, yet `f_n[P_A]e₂=0≠e₂=1_{1}[P_A]e₂`, so approximating against `μ_A^x` alone fails at the second vector. For the commuting `C=diag(2,3)` and x=(1,1), `μ_A^x=δ₀+δ₁` and `μ_A^(Cx)=4δ₀+9δ₁`; continuous `f_n` with `f_n(0)=0` and `f_n(1)=1` converge to `1_{1}` in `L²(μ_A^x+μ_A^(Cx))`, and `C·1_{1}[P_A]x=(0,3)=1_{1}[P_A]Cx`.

### 2.4 Completion and genus acceptance for Nelson’s model (UO-B03a)

This is a separate geometric acceptance target, not a prerequisite for the operator-theoretic B03 result. Prove the metric completion adds exactly one point: the twelve removed vertices form one equivalence class, while the four outer corners give a regular point. Show the added point has cone angle `14π`, with a topological disk chart given in polar coordinates about it by `(r, θ) ↦ (r, θ/7)`, and that the orientation extends across it. Prove the completed surface M is compact, Hausdorff, connected and second-countable, and give it the boundaryless topological atlas on `EuclideanSpace ℝ (Fin 2)` formed by the translation charts away from the added point and this disk chart. Translation charts change by translations, so the translation-chart orientation, extended across the added point, makes M a compact connected oriented topological surface without boundary.

Construct its finite CW structure with eight faces, sixteen edges and two vertices: the 2-cells are the open unit squares of `M₁`, the 1-cells are its eight interior unit edges and the eight classes of glued boundary edges, and the 0-cells are the added point and the class of the outer corners. Its cellular Euler characteristic is `2−16+8=−6`. Consume native `TauCeti.finsum_finrank_singularHomology_of_finite_cwComplex` (`TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean`), constructing the required finite CW instance on M, to identify `−6` with the alternating sum of the dimensions of the singular homology of M with rational coefficients.

Compute the integral cellular chain complex `ℤ⁸ → ℤ¹⁶ → ℤ²` of this structure. Orient each square by the translation charts and each edge in its coordinate direction; let p be the added point and q the regular point. Twelve of the sixteen edges are loops at p and the other four join p and q, so by `TauCeti.cellularIncidence_zero` the boundary map `∂₁` has image `ℤ·(q − p)`, of rank one with invariant factor `1`. By `TauCeti.cellularIncidence_eq_inv_cellLocalClass`, `∂₂` sends each square to the signed sum of its four edges. Because the identifications are translations, every edge class occurs exactly twice among these boundaries, with opposite signs; for the four squares adjacent to the hole the two occurrences lie in the same square, whose boundary is then the difference of its two remaining sides. So the kernel of `∂₂` is spanned by the sum of the eight squares, which are connected across edges. Ordering the squares around the ring, the interior edge shared by the k-th and (k+1)-th square occurs only in their two boundaries; for k = 1, …, 7 these rows and the first seven squares give a bidiagonal minor of `∂₂` with diagonal entries `±1`. Hence `∂₂` has rank seven with all invariant factors `1`, and the cellular homology is `ℤ`, `ℤ⁸`, `ℤ` in degrees 0, 1, 2. Native `TauCeti.cellularSingularHomologyIsoUniv` (`TauCeti/AlgebraicTopology/Cellular/Comparison.lean`), for this finite-dimensional complex with integer coefficients, identifies it with the integral singular homology: `H₁(M; ℤ) ≅ ℤ⁸` and `H₂(M; ℤ) ≅ ℤ`. Define the genus of M as half the rank of `H₁(M; ℤ)`; it is `4`, and `χ(M) = 2 − 2·4` agrees with the cell count. The cell structure computes every invariant, and the orientation is the extended translation-chart orientation: no triangulation of M and no classification of surfaces is used.

**API.**

- The regular quotient of `M₂` by the translations of §2.3 is a Hausdorff, second-countable smooth surface with a translation atlas and the descended flat metric; its Riemannian volume `TauCeti.riemannianVolume` is Lebesgue measure transported from the interior of `M₁`, and the chart fields `X₀=∂ₓ`, `Y₀=∂ᵧ` are well defined, divergence free and commute.
- Its metric completion M adds exactly one point, the class of the twelve removed vertices, with cone angle `14π` and topological disk chart `(r,θ)↦(r,θ/7)` in polar coordinates about it; the class of the four outer corners is a regular point of angle `2π`. M is a compact, connected, oriented topological surface without boundary, oriented by the extended translation-chart orientation.
- M has a finite CW structure with two 0-cells, sixteen 1-cells and eight 2-cells; its integral cellular and singular homology is `ℤ`, `ℤ⁸`, `ℤ` in degrees 0, 1, 2, its Euler characteristic is `−6`, and its genus, half the rank of `H₁(M; ℤ)`, is 4.

**Checks.**

- Before the boundary identifications, `M₁` is a closed annulus with sixteen vertices, twenty-four unit edges and eight squares, so `χ = 16 − 24 + 8 = 0`; a cell count that forgets the gluing gets `0` instead of `−6`, which read as a closed surface would give genus 1.
- Flat Gauss–Bonnet confirms the count: the regular point has angle `4·π/2 = 2π`, the added point `8·4·π/2 − 2π = 14π`, and `Σ(2π − θ) = 0 + (2π − 14π) = −12π = 2π·(−6)`.
- The regular quotient before completion is M minus the added point: it is not compact, its integral homology has ranks `1, 8, 0`, and its Euler characteristic is `−7 = −6 − 1`. Applying `χ = 2 − 2g` to it instead of to M gives `g = 9/2`, so the completion is what makes the genus formula apply; the ranks of M itself are `1, 8, 1`, with `1 − 8 + 1 = −6`.
- The square `[1,2]×[0,1]` has its bottom and top edges identified by `(x,0)~(x,1)`, so its cellular boundary is the difference of its two vertical sides; a boundary map that keeps the glued pair as two distinct edges, or counts the identified class with the same sign twice, makes the sum of the eight squares fail to be a cycle and gives `H₂ = 0`.
- With `𝔽₂` coefficients the cellular homology has dimensions `1, 8, 1`, equal to the integral ranks; a `2`-torsion class in `H₁(M; ℤ)`, which an orientation-reversing identification would produce, would raise the `𝔽₂` dimensions of `H₁` and `H₂` by one each.

**Separate dense-domain contrast.** On `H=L²(S¹×(0,1),dβ/(2π)dy)`, represent the circle coordinate by its Borel angle `β∈[0,2π)`. Let `A=−i∂_β` with periodic `H¹(S¹)` domain and let B be the fiber operator `−i∂ᵧ` with `u(β,1)=e^{iβ}u(β,0)`. The unitary gauge `u(β,y)=e^{iβy}v(β,y)` identifies each fiber with periodic v; Fourier series in y identify B with the self-adjoint real multiplier `2πn+β` on `L²(S¹×ℤ)`, using UO-A07. This avoids assuming a theory of measurable fields of unbounded operators. The dense subspace `D₀=C∞(S¹)⊗C_c∞(0,1)` is invariant under both and `AB=BA` there. For `|s|<1`, extend a fiber function by `u(β,y+m)=e^{imβ}u(β,y)` for integer m; then `(e^{isB}u)(β,y)=e^{imβ}u(β,y+s−m)`, where for almost every y, m is the unique integer with `y+s−m∈(0,1)` (the boundary values form a null set). The x-translation group is `(e^{itA}u)(β,y)=u(β+t mod 2π,y)`. On the open set where `m≠0`, the two orders differ by `e^{imt}`; a nonzero smooth test function supported there proves failure of strong commutation. `D₀` is not a graph core for B and remains a contrast to Nelson's common-core example.

*Needs:* The explicit gluing in §2.3; Tau Ceti's `finsum_finrank_singularHomology_of_finite_cwComplex`, `cellularSingularHomologyIsoUniv`, `cellularIncidence_zero` and `cellularIncidence_eq_inv_cellLocalClass`.

### 2.5 Joint PVM and joint calculus (UO-B04)

For a finite family of pairwise strongly commuting self-adjoint operators, construct the unique joint PVM on `ℝⁿ` with each `P_{A_j}` as a marginal (the pairwise statement is Teschl (2009), Problem 4.2, p.117; the joint measure is constructed here). Strong commutation is Teschl's (4.24), p.117: resolvents commute at one nonreal parameter of each operator and at its conjugate. Commuting resolvents `R_{A_j}(i)R_{A_k}(i)=R_{A_k}(i)R_{A_j}(i)` for all j,k suffice, because `R_{A_j}(i)` is normal with adjoint `R_{A_j}(−i)` and Fuglede's theorem moves the commutation to the conjugate parameter. The headline `existsUnique_jointProjValMeasure` states, under that hypothesis, that there is exactly one normalized PVM P on `ℝⁿ` (a `TauCeti.ProjValMeasure (Fin n → ℝ) H`) with `dom A_j={x : ∫|t_j|² dμˣ<∞}` and `⟪y,A_j x⟫=∫ t_j dμ_(y,x)` for every j; by §1.1 this says `A_j=t_j[P]`, and the marginals of P are the `P_{A_j}`. For n=0 the space `ℝ⁰` is a point and P is its unique PVM. Integrate coordinate and Borel functions with their full domains. Prove joint spectral subspaces reduce every coordinate operator and give the common spectral-cut core.

*Needs:* §1.1–§1.3 and §2.3; scalar measure extension and polarization; VonNeumannAlgebras V2 bounded projections.

**API.**

- Rectangle projections are the products of the marginal projections.
- The joint PVM is normalized and strongly countably additive.
- Joint integrals have the exact joint second-moment domain and reproduce marginal operators.

**Checks.**

- On ℂ² let A=diag(0,1), B=diag(2,3); the joint atoms are (0,2),(1,3), each of rank one.
- For A=B=M_n, the joint sum is 2M_n and its moment is 4Σn²|xₙ|²; a product of unrelated marginal scalar measures gives the wrong support.
- For Pauli X,Z, XZ=−ZX≠0; their projection families cannot be marginals of a joint PVM.

### 2.6 Multiparameter Stone theorem (UO-B05)

For a strongly continuous unitary representation of `ℝⁿ`, construct the unique joint PVM and strongly commuting generators, with the sign fixed by `U(t)=exp(i Σ t_j A_j)`. The headline `existsUnique_projValMeasure_of_unitary_representation` states the measure part: for `U:ℝⁿ→B(H)` with unitary values, `U(s+t)=U(s)U(t)` and `t↦U(t)x` continuous for every x, there is exactly one normalized PVM P on `ℝⁿ` with `⟪y,U(t)x⟫=∫ exp(i Σ t_j s_j) dμ_(y,x)(s)`; the generators are then `A_j=s_j[P]` by §1.1. For n=1 and `A=diag(0,1)` on `ℂ²` the measure has atoms at 0 and 1 and `⟪e₂,U(t)e₂⟫=e^(it)`; the opposite sign `exp(−i Σ t_j s_j)` would put the atom at −1. Prove the converse and the common dense invariant domain of smooth vectors (the one-parameter theorem is Teschl (2009), Theorem 5.2, p.124, in the opposite sign convention; the joint PVM of §2.5 supplies the induction on n).

*Needs:* §2.3 and §2.5; SelfAdjointSpectralTheory SA-E43 and its single-parameter Stone theorem.

### Examples

The diagonal normal matrix and Pauli pair distinguish normality from commutation. The Nelson surface and twisted cylinder distinguish a common graph core from an arbitrary dense invariant subspace.

### Dependencies

Layer 1; HilbertModules H6 closed adjoints for §2.1; VonNeumannAlgebras V10 polar decomposition and cyclic models for §§2.1–2.2, and V2 bounded projections for §2.5; SelfAdjointSpectralTheory Stone/resolvent contracts SA-D17, SA-D20, SA-E01, SA-E05, SA-E08, SA-E26 and SA-E43; for §2.3, Tau Ceti's unitary C₀-groups and Stone's theorem, Mathlib's Fuglede theorem `IsStarNormal.commute_star_right`, its Stone–Weierstrass theorem, compactly supported L² approximation and regularity of finite Borel measures on ℝ, and, for Nelson's surface, Mathlib's Riemannian bundles, Tau Ceti's Riemannian volume and PDE integration by parts; Tau Ceti's finite-CW Euler–Poincaré theorem, cellular incidence numbers and cellular–singular comparison only for §2.4.

## Layer 3: spectrum, spectral types, and pure-point approximation

For a closed densely defined operator T, define the point spectrum by noninjectivity of T−λ, the continuous spectrum by injectivity with dense but non-surjective range, and the residual spectrum by injectivity with non-dense range. These three sets are pairwise disjoint; together with the resolvent they partition ℂ. Prove the range criteria under this convention. For self-adjoint T, use `(ran(T−λ))⊥=ker(T−λ̄)` to prove the residual spectrum is empty (for densely defined T the inclusion `(ran(λI−T))⊥⊆ker(T*−λ̄)` is Tau Ceti's `LinearPMap.exists_adjoint_apply_eq_of_inner_smul_sub_eq_zero`, the reverse inclusion is the adjoint pairing, and `T*=T`); consume SAST SA-D18, Tau Ceti's `IsSelfAdjoint.spectrum_subset_im_eq_zero`, for reality of the spectrum.

**API.**

- For closed densely defined T on a complete space, the resolvent set and the point, continuous and residual spectra are pairwise disjoint and cover ℂ: an injective T−λ with range all of H has a bounded inverse by the closed graph theorem, so the continuous spectrum is the set of λ for which T−λ is injective with dense range that is not closed.
- For densely defined T, λ in the residual spectrum of T implies conj λ in the point spectrum of T*: a nonzero vector orthogonal to the range of T−λ is an eigenvector of T* for conj λ.
- For self-adjoint T the residual spectrum is empty and the spectrum is real.

**Checks.**

- For the backward shift on ℓ²(ℕ), the point spectrum is the open unit disc (eigenvectors `(1,z,z²,…)`), the continuous spectrum is the unit circle and the residual spectrum is empty; for its adjoint, the forward shift, the open disc is residual spectrum (injective, range orthogonal to the eigenvector of the backward shift at the conjugate point), the circle is continuous spectrum and the point spectrum is empty. The partition is not preserved by taking adjoints.
- For the zero operator on ℂ, the point spectrum is {0} and the other two parts are empty. For the zero operator restricted to the finite-support sequences of ℓ², a nonclosed operator, every λ≠0 is in the continuous spectrum (injective, with the dense proper range of finite-support sequences) and 0 is in the point spectrum, so the spectrum is all of ℂ.
- For the self-adjoint multiplier M_x on L²(0,1), the spectrum is [0,1] and equals the continuous spectrum: no λ is an eigenvalue, every λ∈[0,1] has dense nonclosed range, and every λ∉[0,1] is a resolvent point because `M_x−λ` has the bounded inverse `(x−λ)⁻¹`. A definition of residual spectrum omitting injectivity would wrongly place each eigenvalue of a diagonal operator with nondense range, such as 0 for `diag(0,1,1,…)`, in the residual spectrum as well.

**Closed-adjoint spectrum comparison.** For closed densely defined A on a complete complex Hilbert space, prove `ρ(A*)={conj z:z∈ρ(A)}` and `σ(A*)={conj z:z∈σ(A)}`. At z∈ρ(A), with SAST's existing `R_A(z)=(zI−A)⁻¹` convention, prove `R_(A*)(conj z)=R_A(z)*` with both inverse identities on the actual operator domains. Consume native partial-operator resolvent/domain identities and the existing Hilbert-adjoint API; use `A**=A` for the converse. Once `conj z∈ρ(A*)` is proved, the resolvent identity is Tau Ceti's `LinearPMap.IsFormalAdjoint.adjoint_resolvent_eq` for the formally adjoint pair A, A*. This is the general closed-adjoint comparison, while SA-D20, Tau Ceti's `IsSelfAdjoint.adjoint_resolvent`, remains its self-adjoint specialization. Closedness cannot be dropped: A=0 restricted to the finite-support sequences in ℓ²(ℕ) has σ(A)=ℂ whereas A*=0 on all H has σ(A*)={0}.

### 3.1 Approximate eigenvectors and spectral projections (UO-C01)

Relate `λ∈σ(A)` to normalized approximate eigenvectors and to nonzero spectral mass in every neighborhood; characterize point spectrum by a nonzero atom `P_A({λ})` and continuous spectrum by absence of an atom with every neighborhood carrying nonzero mass (Teschl (2009), Lemma 2.16, p.76; Theorem 3.8, p.97; Problem 3.10, p.99).

For `f(x)=x` when x<1 and `f(x)=2x` when x≥1, prove `f⁻¹({1})=∅`, so 1 is not an eigenvalue of `f(Q)` for any self-adjoint Q, and the gap (1,2) in the range of f excludes `σ_c(f(Q))=ℝ\{1}`. For a symbol with point spectrum {1} and continuous spectrum ℝ\{1} take Q=M_x on L²(ℝ,dx) and `g(x)=x` for x<0, `g(x)=1` for 0≤x≤1, and `g(x)=x−1` for x>1. Prove the essential image is ℝ, `g⁻¹({1})=[0,1]∪{2}` and every other level set is empty or a singleton; hence `σ(g(Q))=ℝ`, `σ_p(g(Q))={1}`, `σ_c(g(Q))=ℝ\{1}` and `σ_r(g(Q))=∅`. In particular0 has no level set but every neighborhood has nonzero spectral mass. Prove `|g−id|≤1` and `D(g(Q))=D(Q)` with a bounded difference.

Approximate eigenvectors do not characterize point spectrum: multiplication by x on L²(ℝ) has no eigenvectors, but normalized shrinking-interval indicators around every real λ have `‖(Q−λ)u_n‖→0`. A nonzero singleton PVM atom characterizes eigenvalues; approximate vectors characterize the whole self-adjoint spectrum. A Cauchy sequence `ψ_n→ψ≠0` in D(A) with `‖(A−λ)ψ_n‖→0` does characterize an eigenvalue of a closed A: closedness gives `ψ∈D(A)` and `Aψ=λψ`.

*Needs:* §1.1, §1.5 and §1.6; SelfAdjointSpectralTheory SA-D17–SA-D18.

### 3.2 Essential spectrum (UO-C02)

Define essential spectrum both as spectrum after deleting isolated eigenvalues of finite multiplicity and as failure of Fredholmness of `A−λ` with its closed domain/range data. Prove equivalence for self-adjoint `A`, stability under unitary equivalence, and the spectral-projection characterization using finite rank on compact intervals away from the essential spectrum. The first definition and the spectral-projection form are Teschl's (Teschl (2009), p.145: the discrete and essential spectrum and their spectral-projection descriptions (6.27)–(6.28)), with the Weyl criterion (Lemma 6.17, p.145) and invariance under compact and resolvent-compact perturbations (Lemma 6.18 and Theorem 6.19, p.146). The Fredholm characterization is proved here from (6.28) and Lemma 6.17. If `P_A((λ−ε,λ+ε))` has finite rank, `A−λ` is boundedly invertible on the complementary spectral subspace, so its kernel is finite-dimensional and its range is closed of finite codimension. Conversely, if `A−λ` is Fredholm it is bounded below on the orthogonal complement of its finite-dimensional kernel, which an orthonormal singular Weyl sequence contradicts. For nonreal λ both conditions hold, since `A−λ` is invertible. The definitions `discreteSpectrum` and `essentialSpectrum` apply to every complex partial operator A: `discreteSpectrum A` is the set of isolated points of `LinearPMap.spectrum A` that are eigenvalues with finite-dimensional eigenspace `ker(λI−A)`, the kernel of Tau Ceti's shift `LinearPMap.smulSub λ A`, and `essentialSpectrum A` is the complement of `discreteSpectrum A` in the spectrum. The headline `notMem_essentialSpectrum_iff` states the Fredholm characterization for self-adjoint A on a complete space: λ lies outside `essentialSpectrum A` exactly when the shift `LinearPMap.smulSub λ A : dom A→H`, `x↦λx−Ax`, has finite-dimensional kernel and closed range of finite codimension. For a bounded self-adjoint T, regarded as a total partial operator, prove that `essentialSpectrum` of T is OperatorKTheory §8.4's Fredholm essential spectrum of T on `H →L[ℂ] H`, a different declaration on the bounded carrier: by the headline both are the set of λ for which `T−λ` is not Fredholm.

*Needs:* §3.1; HilbertModules H6 closed range; finite-dimensional projection/range theory; OperatorKTheory §8.4 for the bounded comparison.

**API.**

- For self-adjoint operators the Fredholm and isolated-finite-eigenvalue definitions agree (`notMem_essentialSpectrum_iff`).
- Unitary conjugacy preserves the essential spectrum.
- Finite-rank local spectral windows characterize its complement.

**Checks.**

- For diag(0,1) on ℂ² the essential spectrum is empty; both eigenvalues have finite multiplicity.
- For 0 on infinite-dimensional ℓ² the essential spectrum is {0}; the eigenspace has infinite dimension.
- For the diagonal 1/n on ℓ² the essential spectrum is {0}; 0 is not an eigenvalue but every neighborhood has infinite-rank projection.
- For the self-adjoint diagonal on ℓ² whose eigenvalues enumerate ℚ, each once, the spectrum is ℝ and no eigenvalue is isolated, so the essential spectrum is ℝ, and each `A−q`, q∈ℚ, has nonclosed range, so it is not Fredholm. Dropping isolation from the discrete spectrum would give the nonclosed set ℝ∖ℚ instead.

### 3.3 Pure-point/absolutely-continuous/singular decomposition (UO-C03)

For every self-adjoint `A`, split H into the mutually orthogonal reducing subspaces (in the sense of Tau Ceti's `LinearPMap.IsReducing`) generated by atomic, absolutely continuous, and singular-continuous scalar spectral measures (Teschl (2009), §3.3: Lemma 3.14, p.103, Lemma 3.15, p.104, Theorem 3.17, (3.83) and Lemma 3.19, p.105). The subspaces depend only on the spectral measure. For every normalized PVM P on `ℝ`, prove that `H_pp={x : P.diag x is carried by a countable set}`, `H_ac={x : P.diag x ≪ Lebesgue}` and `H_sc={x : P.diag x is singular to Lebesgue measure and has no atoms}` are closed subspaces, mutually orthogonal, invariant under every `P(B)`, with sum H: `μ^(x+y)≤2(μˣ+μʸ)` gives the subspaces, `|‖P(B)x‖−‖P(B)y‖|≤‖x−y‖` closedness, `μ^(P(B)x)=1_B μˣ` invariance, a Borel set carrying one measure and null for the other orthogonality, and the Lebesgue decomposition of each `μˣ` the sum. The headline `exists_spectralType_decomposition` states this on `TauCeti.ProjValMeasure ℝ H`, with no separability and no control measure; for `P=P_A` the three subspaces reduce A by SA-E06 and SA-E07. In the finite-control-measure case, prove independence of the chosen control measure, restriction self-adjointness, direct-sum reconstruction, and the corresponding spectral-set relations. In the general case, whether or not H is separable and whether or not a finite control measure is available, construct the reducing subspaces directly from all scalar spectral measures and prove the operator decomposition without assuming such a measure. Distinguish singular-continuous spectrum from the broader continuous spectrum. First supply the scalar-measure construction for a σ-finite Borel measure `ρ` on ℝ: prove `{x | ρ({x})>0}` is countable; set `A={x | ρ({x})>0}`, `ρ_pp=ρ.restrict A`, and `ρ_cont=ρ.restrict Aᶜ`. Prove `ρ_pp=Σ_{x∈A}ρ({x})·dirac(x)`, positivity, `ρ=ρ_pp+ρ_cont`, and uniqueness of this split. Prove that every measure-theoretic atom of a σ-finite Borel measure on ℝ is concentrated on a singleton: reduce to a finite positive piece and use a countable separating family of rational cuts. Deduce that `ρ_cont` is atomless. This restriction construction avoids ambiguous subtraction of infinite masses. Combine it with Mathlib's native Lebesgue decomposition of the s-finite `ρ` relative to σ-finite Lebesgue measure to obtain the unique `pp + ac + singular-continuous` split, with `singular-continuous` explicitly atomless and singular. σ-finiteness is needed for countably many atoms: counting measure on ℝ is Borel and has an atom at every point. For arbitrary H, define the three closed reducing subspaces by the types of all their scalar spectral measures, construct their orthogonal projections, and prove these projections commute with every `P_A(B)`, preserve the actual operator domain and give the direct-sum reconstruction. When a finite scalar control measure exists, in particular for separable H, identify the three projections as `P_A(B_pp)`, `P_A(B_ac)` and `P_A(B_sc)` for a Borel partition modulo PVM-null sets obtained from that measure's decomposition. The general reducing projections need not each be one Borel value of the PVM. As a required distinction, on `ℓ²(ℝ) ⊕ L²(ℝ,dx)` take the direct sum of the diagonal coordinate operator and multiplication by the real coordinate, with their square-moment domains. Prove its pure-point subspace is `ℓ²(ℝ)⊕0` and that its projection cannot equal `P_A(B)` for any Borel B: including every coordinate eigenvector forces B=ℝ, which also retains the continuous summand. This is the operator spectral-type theorem, not a second generic measure-theory roadmap.

For the spectral types, prove explicitly `H_pp=closure(span(⋃_λ ker(A−λ)))`. The closure of the union alone is not `H_pp`: diag(0,1) on ℂ² has two closed eigenspace axes whose union omits (1,1). Use the singleton-projection expansion of each pure-point vector for the closed span. Prove `σ(A_pp)=closure(σ_p(A))` and `σ(A)=σ(A_pp)∪σ(A_ac)∪σ(A_sc)`, with empty restriction spaces contributing empty spectra; these restriction spectra can overlap. The inclusion `σ_c(A)⊆σ(A_ac)∪σ(A_sc)` is false: the rational diagonal of the Worked examples has H_pp=H, H_ac=H_sc=0 and σ_c(A)=ℝ\ℚ. Topological continuous spectrum is not the spectrum of the continuous-measure summands. A vector-dependent scalar-measure partition does not by itself give a global PVM value for a type projection; apply the existing finite-control-measure qualification and arbitrary-H construction above.

*Needs:* §1.1 and §3.1; Tau Ceti's `TauCeti.ProjValMeasure`; SelfAdjointSpectralTheory SA-E06 and SA-E07; Mathlib positive Lebesgue decomposition; VonNeumannAlgebras V2 orthogonal projection calculus.

**API.**

- The three spectral types give orthogonal reducing subspaces and preserve the operator domain.
- Their orthogonal sum is H and reconstructs A on the sum of the component domains.
- A finite control measure gives Borel type projections; the arbitrary-H construction uses all vector measures.

**Checks.**

- For diag(0,1), H_pp=ℂ² and the other two subspaces are zero; the union of the two axes omits (1,1), while their span contains it.
- For M_x on L²([0,1],dx), H_ac=H and the atomic and singular-continuous parts are zero. For the atomless Cantor measure the same model instead has H_sc=H.
- For the rational diagonal on ℓ², H_pp=H but σ_c=ℝ\ℚ; pure-point measure type does not eliminate continuous-spectrum points.

### 3.4 Staircase pure-point approximation (UO-C04)

For every self-adjoint `A`, use countably-valued Borel grid functions `fₙ:ℝ→ℝ` with `|fₙ(t)−t|≤1/(n+1)` for all t and put `Aₙ=fₙ(A)`. Prove their pure-point decomposition by the countably many grid level projections. Then `dom Aₙ=dom A`; the difference has a bounded extension `Bₙ=(fₙ−id)(A)` with `‖Bₙ‖≤1/(n+1)`, and `Aₙ=A+Bₙ` on their common domain. Prove the resolvents converge in operator norm locally uniformly off the real axis (in particular at `±i`); this is norm-resolvent convergence, not operator-norm convergence of unbounded operators themselves (Teschl (2009), Lemma 6.34, p.155, and Theorem 6.31, p.154). Also prove `‖exp(itAₙ)−exp(itA)‖≤|t|/(n+1)` by the bounded-difference/Duhamel estimate, hence operator-norm convergence uniformly on compact time intervals. For each bounded continuous `φ:ℝ→ℂ`, prove strong convergence `φ(A_n)x→φ(A)x` for every `x`; for `φ∈C₀(ℝ)`, strengthen this to operator-norm convergence using norm-resolvent convergence and continuous functional calculus. Do not claim uniform-norm convergence for arbitrary `φ∈C_b(ℝ)` (or convergence in the uniform norm of the functional calculus).

The grid `s(t)=m/ε` on `[m/ε,(m+1)/ε)` has error below 1/ε, not below ε (ε=1/10, t=1 gives error 1). For a tolerance ε choose a grid mesh δ<ε or the sequence above; then D(A_δ)=D(A) and A_δ−A extends boundedly; no operator-norm space of unbounded A is asserted.

*Needs:* §1.1–§1.4; SelfAdjointSpectralTheory resolvent identity, bounded calculus and SA-E43.

### 3.5 Diagonal spectrum calculations (UO-C05)

Develop the reusable point/continuous/residual spectrum API for multiplication and diagonal operators, including countable sequences with accumulation points and Borel reindexing of a total eigenbasis. Supply explicit formulas for kernels, ranges, adjoints and inverse domains. For a diagonal operator the spectral set is the closure of the eigenvalue image; do not require a countable eigenvalue set to map directly onto an arbitrary uncountable closed set (Teschl (2009), Theorem 2.21, p.78, and Lemma 3.12, p.101).

  Precisely, for a self-adjoint A with a total orthonormal eigenbasis and countably infinitely many **distinct** eigenvalues `λ_n`, and every nonempty closed `F⊆ℂ`, choose a nonempty countable dense subset D of F and construct a Borel `g:ℝ→ℂ` with `{g(λ_n):n∈ℕ}=D`. Enumerate the distinct eigenvalues; assign their values by a surjection onto D and set g=d₀∈D outside that countable set. Prove measurability and use the existing A PVM to construct g(A) on its exact square-moment domain. Prove it is closed normal, with `σ(g(A))=cl(D)=F`, `σ_p(g(A))=D`, `σ_c(g(A))=F\D` and `σ_r(g(A))=∅`. Construct the eigenprojections and their possibly repeated multiplicities, the pushforward PVM, finite spectral truncation graph cores and reciprocal resolvents off F. If a real-valued g and self-adjoint g(A) are required, restrict F to a nonempty closed subset of ℝ. The distinct-eigenvalue hypothesis prevents a function of A from assigning different values inside one eigenspace.

  Treat the remaining cases explicitly. With exactly m>0 distinct eigenvalues and a total eigenbasis on nonzero H, the possible spectral sets of g(A) are exactly the nonempty finite F⊆ℂ of cardinality at most m; the point spectrum is F and the continuous/residual spectra are empty. On the zero Hilbert space the spectrum and all three spectral subsets are empty. The zero operator on a nonzero space instead has spectral/point set{0}. Retain the general multiplication/diagonal operator API and the separate prescribed-domain and rational diagonal examples of the Worked examples; this realization theorem does not narrow them.

*Needs:* §1.4, §1.7, §3.1; Mathlib countable dense subsets of closed subsets of ℂ.

### Examples

The rational diagonal has pure-point measure type and nonempty continuous spectrum. The Cantor-measure multiplier separates singular-continuous from absolutely continuous type.

### Dependencies

Layer 1; HilbertModules H6 closed ranges; SelfAdjointSpectralTheory SA-D17–SA-D18 for §3.1, SA-E06 and SA-E07 for §3.3, and the resolvent identity, bounded calculus and SA-E43 for §3.4; for §3.3, Tau Ceti's `TauCeti.ProjValMeasure`, native scalar Lebesgue decomposition and VonNeumannAlgebras V2 orthogonal projection calculus, with no separability assumption for the general reducing-subspace split; Mathlib's countable dense subsets for §3.5; OperatorKTheory §8.4 only for the bounded comparison of §3.2.

## Layer 4: symmetric operators, deficiency and boundary data

Consume H6's Hilbert-space API for `dom S* = dom S ⊕ N₊ ⊕ N₋`, the boundary form, the Cayley partial isometry, and classification of self-adjoint extensions by unitaries `N₊→N₋`. Extend it into a full reusable scalar operator theory. All orthogonal complements and decompositions use the graph inner product on `dom S*`; the two deficiency spaces are `ker(S*−i)` and `ker(S*+i)` with signs pinned throughout.

### 4.1 Deficiency functions on half-planes (UO-D01)

For closed densely defined symmetric S, prove `dim_H ker(S*−z)` is constant on each open half-plane and invariant under the resolvent/Cayley identifications; `dim_H` is BanachSpaceTheory B5's Hilbert dimension, the cardinality of a Hilbert basis, which B5 proves independent of the basis. Define n₊,n₋ as the Hilbert dimensions of `N₊=ker(S*−i)` and `N₋=ker(S*+i)`. Import HilbertModules H6’s existence criterion for closed densely defined symmetric S: a self-adjoint extension exists iff its deficiency Hilbert spaces N₊,N₋ are unitarily isomorphic (Teschl (2009), Theorem 2.26, p.82, and Lemma 2.27, p.83; the surjectivity criterion below is Lemma 2.3, p.63). B5's unitary classification turns this into the cardinal criterion: a self-adjoint extension exists iff n₊=n₋, including infinite cardinals; the unitary criterion itself is an H6 input and the classification a B5 input. Use `finrank` only in the finite-dimensional case. Use SAST SA-A21, Tau Ceti's `LinearPMap.isSelfAdjoint_of_surjective_addSub`, for the sufficient criterion that a symmetric operator with both `S+i` and `S−i` surjective is self-adjoint, with no separate density hypothesis; use SA-D17, Tau Ceti's `IsSelfAdjoint.mem_resolventSet_of_im_ne_zero`, for the converse resolvent/surjectivity statement for self-adjoint S. State the closed symmetric hypotheses and prove the resulting equivalence.

*Needs:* BanachSpaceTheory B5 Hilbert dimension and unitary classification; PolarDecomposition PD-B29 and PD-B32; HilbertModules H6 unitary extension criterion; SelfAdjointSpectralTheory SA-A21 and SA-D17 (Tau Ceti's `LinearPMap.isSelfAdjoint_of_surjective_addSub` and `IsSelfAdjoint.mem_resolventSet_of_im_ne_zero`).

**API.**

- For a closed densely defined symmetric operator, the two deficiency cardinals are constant in their respective half-planes.
- A self-adjoint extension exists exactly when the two deficiency cardinals are equal, with no finiteness assumption.
- S is self-adjoint exactly when both deficiency cardinals are zero, equivalently when `S+i` and `S−i` are both surjective.

**Checks.**

- For S=2I on ℂ, `ker(S*∓i)=ker(2∓i)=0`, so the pair is (0,0) and S is its own unique self-adjoint extension.
- For `S=−i d/dx` on `H₀¹(0,1)`, `S*u=iu` gives `u=e^{−x}` and `S*u=−iu` gives `u=e^{x}`, both in `L²(0,1)`: the pair is (1,1) and self-adjoint extensions exist. On `H₀¹(0,∞)` only `e^{−x}` is square-integrable, the pair is (1,0) and there is none, although the zero space embeds isometrically in a line: equality cannot be replaced by an injection.
- The direct sum of countably many copies of interval momentum and one half-line momentum has pair `(ℵ₀+1, ℵ₀+0)=(ℵ₀,ℵ₀)`, so it has self-adjoint extensions; a criterion through `finrank` or a difference of indices does not apply.

### 4.2 Spectrum alternatives (UO-D01a)

For a closed symmetric S, prove the spectrum is either all of `ℂ`, the closed upper half-plane, the closed lower half-plane, or a subset of `ℝ`; prove `S` is self-adjoint iff its spectrum is contained in `ℝ` (Teschl (2009), Theorem 2.18, p.77), and every eigenvalue is real (Teschl Lemma 2.20, p.77). The four-way alternative is proved here. For nonreal z the identity `‖(S−z)x‖²=‖(S−Re z)x‖²+(Im z)²‖x‖²` (Teschl (2009), (2.44), in the proof of Lemma 2.7, p.66; Tau Ceti's `LinearPMap.IsFormalAdjoint.norm_smul_sub_sq`) makes `S−z` injective with closed range (`LinearPMap.IsFormalAdjoint.isClosed_range_smul_sub`), so z is a resolvent point exactly when `ker(S*−z̄)=0`: a vector orthogonal to `ran(zI−S)` lies in `ker(S*−z̄)` by Tau Ceti's `LinearPMap.exists_adjoint_apply_eq_of_inner_smul_sub_eq_zero`, and the reverse inclusion is the adjoint pairing. By §4.1 that dimension is n₋ on the open upper half-plane and n₊ on the open lower half-plane, and the spectrum is closed. State this for the closed operator and the partial-operator spectrum convention fixed by SAST. The headline `resolventSet_alternatives_of_isClosed_symmetric` states the alternative and the self-adjointness criterion for a closed densely defined symmetric S on a complex Hilbert space through Tau Ceti's `LinearPMap.resolventSet`: z lies in it when `zI−S` has a bounded two-sided inverse with values in the domain, `LinearPMap.IsResolventAt`. The four alternatives read: the resolvent set is empty, exactly the open lower half-plane, exactly the open upper half-plane, or contains every nonreal point.

**Checks.**

- For S=2I on ℂ and z=i, `R=(i−2)⁻¹` satisfies `(i−2)R=1`; the resolvent set is `ℂ∖{2}`, the fourth alternative, and S is self-adjoint.
- For half-line momentum `−i d/dx` on `H₀¹(0,∞)`, `ker(S*−z̄)` is spanned by `e^{iz̄x}`, of modulus `e^{(Im z)x}`, which is square-integrable exactly when `Im z<0`. The resolvent set is the open upper half-plane, the third alternative, matching n₋=0; pairing n₊ with the upper half-plane instead would put it in the lower half-plane.
- For interval momentum on `H₀¹(0,1)` every `e^{iz̄x}` is square-integrable, so no nonreal z is a resolvent point; since the resolvent set is open it contains no real point either, and it is empty, the first alternative.

In the four spectrum-set alternatives the nonreal spectrum of a closed symmetric operator is residual spectrum. A nonreal shift of a closed symmetric operator is injective with closed range; if it is spectral its range is proper and therefore not dense, so it belongs to residual spectrum under Layer 3's disjoint convention. For the Hilbert-dimension comparison in the deficiency proof, use the bounded restriction `P_N|M:M→N` between closed Hilbert subspaces with M∩N⊥={0}. Its polar factor is isometric on all M because its initial space is (ker T)⊥=M, with final space closure(range T)⊆N. This supplies the Hilbert-cardinal inequality; a bare algebraic injection is not substituted for this argument. Use [Polar Decomposition PD-B23–34's complete-space bounded rectangular stage](../PolarDecomposition/README.md), specifically PD-B29's initial-space identity and PD-B32's final-space identity, together with BanachSpaceTheory B5's basis independence of Hilbert dimension: the isometry carries a Hilbert basis of M to an orthonormal family in N, which extends to a Hilbert basis of N.

*Needs:* §4.1; SelfAdjointSpectralTheory resolvent theory; HilbertModules H6 closed symmetric range estimates.

### 4.3 Extensions by partial isometries (UO-D02)

Use H6's decomposition to prove the bijection between closed symmetric extensions `T` of S and partial isometries from a closed subspace of `N₊` to `N₋`; state the domain and action formula (Teschl (2009), Theorem 2.25, p.81, and Theorem 2.26, p.82). If U is the partial isometry, state the deficiency spaces as orthogonal complements `N₊(T)=N₊⊖dom U` and `N₋(T)=N₋⊖ran U`, and prove the cardinal-dimension identities `dim_H N₊=dim_H(dom U)+dim_H N₊(T)` and `dim_H N₋=dim_H(ran U)+dim_H N₋(T)`. Do not use cardinal subtraction; use `finrank` only when the relevant spaces are finite-dimensional. Characterize maximal symmetric extensions by maximality of the initial or final deficiency subspace, and characterize when a maximal symmetric operator has no self-adjoint extension.

In the zero extension of a partial isometry U, the complement of the initial space is the orthogonal complement `I(U)⊥`; the set difference `K₊\I(U)` would not do, since with `I(U)=ℂe₁` vanishing on both e₂ and e₁+e₂ contradicts Ue₁≠0. The integer decrement of the deficiency dimension holds under a finite initial dimension. Finite deficiency dimensions admit the stated integer decrement, while infinite Hilbert defects use the orthogonal-complement/cardinal-sum identities already specified above; no general cardinal subtraction is introduced.

The equivalence `ker(S*−i)=0 ⟺ ker(S*+i)=0` is not a self-adjointness criterion: minimal interval momentum has deficiency(1,1), so both sides are false and the equivalence holds although the operator is not self-adjoint; the criterion is UO-D01's, both kernels zero. Unequal indices exclude self-adjoint extensions but do not make the operator maximal symmetric. For closed symmetric S, prove S itself is maximal symmetric iff N₊=0 or N₋=0. As a counterexample to maximality under unequal indices, take the direct sum of minimal interval momentum(1,1) and minimal half-line momentum(1,0), with the −i∂ convention of UO-D05: indices are(2,1), and a nonzero partial isometry pairing one deficiency dimension gives a proper symmetric extension, still with no self-adjoint extension. Use UO-D02's orthogonal-complement cardinal identities; do not introduce cardinal subtraction.
For the graph-domain decomposition consume H6's existing scalar graph-domain decomposition and UO-D01/D02/D04's deficiency and boundary classifiers. Graph closure of D(A) inside D(A*) gives D(closure A). Keep Hilbert-basis cardinal deficiency dimensions separate from finite-dimensional finrank, and graph orthogonality separate from ambient H orthogonality.

In the closedness proof for the deficiency spaces, ψ_n+iA*ψ→0 and ψ_n→ψ imply `ψ+iA*ψ=0`, hence A*ψ=iψ and iA*ψ=−ψ. For the decomposition, a vector ξ graph-orthogonal to D(A) satisfies−A*ξ∈D(A*) and−(A*)²ξ=ξ, so ξ∈D((A*)²). The required factorization is `((A*)²+I)ξ=(A*+i)(A*−i)ξ=0`, with the square `(A*)²`, not the double adjoint `A**`. Set η=(A*−i)ξ. It lies in K_minus=ker(A*+i). For ψ∈K_minus the scalar identity gives `⟨ψ,η⟩=−i⟨ψ,ξ⟩_graph=0`. Taking ψ=η proves η=0; then ξ∈K_plus and its graph orthogonality to K_plus kills ξ. Membership in K_plus and orthogonality to the different K_minus would not be that zero criterion. This proof confirms the already-owned decomposition; it is not a new extension theory. On each deficiency summand the graph inner product is twice the ambient inner product. In the extension-domain bijection, the mixed boundary terms vanish by adjoint identities with a D(A) component, not merely by graph orthogonality. A bounded partial-isometry formulation on all K_plus means the map is zero off its closed initial space; equivalently use UO-D02's isometry from that closed initial subspace into K_minus. Keep initial and final spaces distinct.

*Needs:* HilbertModules H6 deficiency decomposition and Cayley correspondence; §4.1.

### 4.4 Conjugations (UO-D03)

If a conjugation J preserves `dom S` and commutes with S, prove the deficiency spaces are antiunitarily identified and n₊=n₋ (Teschl (2009), Theorem 2.28, p.83); transport the extension parameter and characterize the J-invariant self-adjoint extensions. Use the boundary form rather than informal endpoint intuition.

*Needs:* HilbertModules H6 adjoint/domain transport; §4.1 and §4.3.

**API.**

- A conjugation is an antilinear isometric involution.
- Commutation with the symmetric operator includes preservation of its actual domain.
- It interchanges the deficiency spaces and characterizes the invariant extension parameters.

**Checks.**

- For A=2I on ℂ, Jz=conj z has J²=I and AJ=JA.
- For A=i∂ on the split line, Jψ(x)=conj ψ(−x) gives both AJψ and JAψ equal to −i conj ψ′(−x).
- Plain conjugation gives +i conj ψ′ versus −i conj ψ′, so it anticommutes and fails the commuting-conjugation condition.

### 4.5 Deficiency quotient and boundary conditions (UO-D04)

Consume H6's graph-inner-product decomposition `dom S* = dom S ⊕ N₊ ⊕ N₋` and its abstract boundary form. Define the canonical quotient `B_S=dom S*/dom S` with quotient graph norm; define `G(x,y)=⟨S*x,y⟩−⟨x,S*y⟩`, conjugate-linear in x and linear in y under Mathlib's convention. Prove it descends to the quotient, is continuous and nondegenerate there, and is skew-Hermitian. Put `h_S=(i/2)G`; prove `h_S` is Hermitian and under the deficiency decomposition has `h_S(x,y)=⟨x₊,y₊⟩−⟨x₋,y₋⟩`, where these inner products are the ambient Hilbert-space inner products on the deficiency vectors. The graph inner product is used for the orthogonal decomposition and quotient graph norm; it gives a factor of two on each deficiency summand and is not the inner product in this displayed boundary form. Identify the quotient with `N₊⊕N₋`; in the finite-dimensional case its `finrank` is `finrank N₊ + finrank N₋`. Characterize closed symmetric extensions as closed isotropic subspaces of this quotient and self-adjoint extensions as closed subspaces W satisfying `W=W^{⊥_G}` (equivalently, graphs of surjective isometries/unitaries `N₊→N₋`). Maximal isotropic subspaces classify maximal symmetric extensions and need not be self-orthogonal; prove the distinction, including unequal indices and an infinite-dimensional isometry with proper range. Only in the finite balanced deficiency case does maximal isotropy alone imply the self-adjoint condition. Treat endpoint traces for the concrete regular expression `−u″` on `[0,1]` as a separate model: take the maximal domain `H²(0,1)` and the minimal operator domain `H₀²(0,1)` (the graph closure of `C_c∞(0,1)`); use the boundary vector `(u(0),u′(0),u(1),u′(1))` (Teschl (2009), Lemma 9.4, p.184, and Theorem 9.6, p.187, in the regular case). Prove trace graph-continuity and Green's formula identify its kernel with the minimal domain, then identify trace boundary subspaces with the canonical quotient. Derive separated and periodic/coupled conditions only in this trace model; abstract deficiency coordinates are not silently called endpoint values.

**Coupled endpoint transfer adapter.** In D04's regular `−u″` model put `v_j(u)=(u(j),u′(j))` and `J=[[0,−1],[1,0]]`. Use the existing H² trace/Green map to prove the restriction `v₁=Cv₀`, for a complex2×2 matrix C, is symmetric iff `C*JC=J`; then it is self-adjoint. Surjectivity of the four endpoint traces, proved by cubic interpolation, makes the criterion necessary, and the two-dimensional isotropic graph in the four-dimensional boundary space makes it sufficient. This classifies precisely the transfer-graph extensions, not every extension: the Dirichlet domain is not such a graph. For `C=[[a,b],[c,d]]` the identity is equivalent to `conj(a)c` and `conj(b)d` real and `conj(a)d−conj(c)b=1`. The valid examples `C=iI`, of determinant −1, and `C=[[1,1],[0,1]]`, with `conj(b)d=1` real and nonzero, show that neither `ad−bc=1` nor purely imaginary coefficient products are necessary. D04's full quotient/U(2) classifier remains the owner of all extensions. The whole pair of constraints, not the kernel of each constraint, is the relevant isotropic domain.

**Separated endpoint and finite-parameter comparisons.** For the same regular H² model, impose `u(1)=0` and `k u(0)+λ u′(0)+μ u′(1)=0`, with complex k,λ,μ. Prove this domain is self-adjoint exactly when `μ=0`, `(k,λ)≠(0,0)` and `k conj(λ)∈ℝ`. If μ≠0, arbitrary endpoint0 pairs extend to the two constraints by choosing u′(1), so the Green form is not identically zero; if μ=0, test its restriction to the endpoint0 line and use rank2/self-orthogonality. Dirichlet `(k,λ,μ)=(1,0,0)` and mixed Neumann-at-0/Dirichlet-at-1 `(0,1,0)` are self-adjoint members of this separated family.

For the finite-dimensional U(2) parameter use native `Matrix.unitaryGroup (Fin 2) ℂ` and `Matrix.specialUnitaryGroup (Fin 2) ℂ`. Consume only [LieGroups' matrix-subgroup and SU(2)/SO(3) construction](../../RepresentationTheory/LieGroups/README.md), with its Layers2/5 finite-dimensional hypotheses, for the generic group/cover interfaces. Prove the finite parameter comparison here: `U↦(det U,diag((det U)⁻¹,1)U)` is a homeomorphism `U(2)≅𝕋×SU(2)`, inverse `(z,S)↦diag(z,1)S`. The matrices `[[a,b],[−conj b,conj a]]`, `|a|²+|b|²=1`, identify SU(2) with S³ and give U(2) its connected real4-manifold parameter model. This homeomorphism is not asserted to be a direct-product group isomorphism. The group homomorphism `(z,S)↦zS` instead has kernel `{(1,I),(−1,−I)}` and identifies its quotient with U(2). U(2) is connected, and `U(2)/ℤ₂` is four-dimensional, so it is not SU(2); the SU(2) double cover of SO(3) is a separate statement. These parameter comparisons neither classify every boundary domain as a transfer graph nor import a downstream quantum or noncompact-representation theorem.

For the adjoint of the clamped second derivative, let `ξ=A*φ` and `g(x)=∫₀ˣ∫₀ᵗξ(s)dsdt`. Its orthogonality calculation gives φ+g affine, hence `φ=affine−g` and `φ″=−ξ`. This consumes the existing H² adjoint/PDE theorem without rebuilding the adjoint carrier.

**Extension and boundary comparisons.** Consume H6's decomposition, UO-D01–D05 and [Polar Decomposition PD-B23–34](../PolarDecomposition/README.md). With `|A|=(A*A)^(1/2)` the bounded polar order is `A=U|A|`, not `|A|U`. On ℂ², `Ae₁=0,Ae₂=e₁` has U=A and |A|=diag(0,1), so `|A|U=0` while `U|A|=A`. In the extension-domain formula restrict the deficiency parameter to I(U). U=0 with a nonzero unrestricted plus-deficiency vector would give an imaginary eigenvalue and a nonsymmetric extension. The closed initial-space isometry follows by applying boundary isotropy to differences and using completeness in the graph norm. Its shifted ranges are `ran(A_U+i)=ran(A+i)⊕I(U)` and `ran(A_U−i)=ran(A−i)⊕F(U)`. Use the existing complement/cardinal-sum identities rather than subtracting infinite cardinals. The maximal-symmetry criterion, one deficiency space zero, is that of §4.3.

For the+i interval derivative set `C=√(2/(e²−1))`, `φ₊=Ceˣ`, `φ₋=eCe^(−x)`. These unit defect vectors give the endpoints `αC(1+γe)` and `αC(e+γ)`. Prove `β=(e+γ)/(1+eγ)` and its inverse `γ=(β−e)/(1−βe)`; denominators are nonzero for unit phases and both maps preserve the circle. Subtracting the two defect vectors then gives an H¹_0 remainder, proving equality with the existing phase-boundary domain. For the+i half-line derivative the defects are(0,1), opposite to D05's−i convention; only the nonzero positive exponential fails L². The scalar ODE assertions use AC representatives, not continuity plus an a.e. derivative alone. Conjugation arguments consume D03's antiunitary deficiency identification; for a nonclosed symmetric operator apply the extension classifier to its closure. Real locally L² Schrödinger potentials on an open set map C_c∞ into L² and give symmetry/conjugation commutation by integration by parts, hence extension existence. This does not replace E06's stronger three-dimensional essential-self-adjointness criterion.

Make the notion of a boundary value precise using D04's existing Hilbert quotient `B_A=D(A*)/D(A)` with the quotient of the Hilbert graph norm. Prove pullback identifies continuous complex-linear functionals on B_A isometrically with graph-continuous boundary values vanishing on D(A). Equip their space with its dual Hilbert structure; the Riesz representing-vector map is conjugate-linear under the declared convention. Its Hilbert-basis dimension is `dim_H N₊+dim_H N₋`; use finrank only when both defects are finite. A finite plus defect alone does not make the other finite. Every closed extension quotient is the common kernel of its continuous annihilator. In the finite balanced(n,n) case prove self-adjoint extension quotients are exactly common kernels of n independent quotient-dual functionals whose WHOLE common kernel is boundary-isotropic. Such a kernel has dimension n and is boundary-self-orthogonal. Constraint lists related by invertible row recombination define the same extension. A single nonzero functional kernel has dimension2n−1 and cannot be isotropic for n>1. In the interval example kerβ₀ alone is nonsymmetric, but kerβ₀∩kerβ₁=H¹_0 is symmetric. In the n=1 example a single unit-phase trace constraint defines a self-adjoint extension. These are explicit dual/presentation adapters to D04 and PDE traces, not a second boundary carrier.

*Needs:* HilbertModules H6 boundary form; §4.3–§4.4; PDE Sobolev traces and Green formula; LieGroups Layers 2 and 5 for finite matrix parameters.

**API.**

- The Green form descends to the graph-norm quotient and is continuous and nondegenerate.
- Closed symmetric extensions correspond to closed isotropic subspaces.
- Self-adjointness requires equality with the Green orthogonal complement, not maximal isotropy alone.

**Checks.**

- For a unit x₊∈ker(S*−i), G(x₊,x₊)=−2i and (i/2)G=1. For a unit x₋∈ker(S*+i), the corresponding values are 2i and −1.
- In the balanced finite (1,1) case, the line spanned by (1,exp(iθ)) has boundary value 1−1=0 and equals its orthogonal complement.
- For indices (1,0), the boundary Hermitian form is positive definite: the maximal isotropic space is 0 but its orthogonal complement is the whole nonzero boundary space.

### 4.6 Resolvent and spectrum examples (UO-D05)

For `S=−i d/dx` on `L²(0,∞)` with domain `H₀¹(0,∞)`, prove the deficiency indices are `(1,0)`, no self-adjoint extension exists, and the spectrum is the closed lower half-plane (Teschl (2009), Problem 2.27, p.84, in the `+i` sign). For the same expression on `L²(0,1)` with minimal domain `H₀¹(0,1)`, consume HilbertModules H7's deficiency indices `(1,1)` and its parametrization of the self-adjoint extensions `D_λ`, `λ∈𝕋`, by `α₊=λα₋`; do not prove them again. Prove here that, for the positive normalized deficiency vectors `φ₊=Ce·e^{−x}` spanning `ker(S*−i)` and `φ₋=Ce^{x}` spanning `ker(S*+i)`, `C=√(2/(e²−1))`, the domain of `D_λ` is `{u∈H¹(0,1) : u(1)=e^{iθ}u(0)}` with `e^{iθ}=(λ+e)/(1+eλ)`: the vector `λφ₊+φ₋` has `u(0)=C(1+eλ)≠0` and `u(1)=C(λ+e)`, and both domains contain `H₀¹(0,1)` with codimension one in `H¹(0,1)`. The map `λ↦(λ+e)/(1+eλ)` is a bijection of the unit circle. Prove that the spectrum of the realization with `u(1)=e^{iθ}u(0)` is `{θ+2πk:k∈ℤ}`, the eigenfunctions being `e^{i(θ+2πk)x}`. At `λ=1` the condition is periodic, `θ=0`, and the spectrum `2πℤ` is `−i` times V10's spectrum `2πiℤ` for `Tf=f′` with periodic domain; at `λ=−1` it is antiperiodic, with spectrum `π+2πℤ`. Compute the minimal/maximal adjoints and the resolvents on their actual domains; consume V10’s interval derivative calculations after multiplying the expression by `−i`. These generic examples exercise the H6 classification through H7's interval example; the split-line derivative and the endpoint-zero interval derivative of the Worked examples are further acceptance cases, with their domains stated exactly.

*Needs:* §4.1, §4.3 and §4.5; HilbertModules H7 interval example (indices and `D_λ`); VonNeumannAlgebras V10 interval derivatives; PDE H¹ traces and weak ODEs.

### 4.7 Closed forms and the Friedrichs extension (UO-D06)


The representation theorem follows the closed-form argument of Teschl (2009), Theorem 2.13, pp.71–72, with the real case obtained by the stated complexification adapter. Work uniformly over `[RCLike 𝕜]`, for Hilbert spaces H and V over 𝕜. For a dense
subspace V of H and a Hermitian sesquilinear form q, conjugate-linear in the
first slot, require `RCLike.re (q(u,u))≥γ‖u‖_H²`. Define closedness by completeness in
`(RCLike.re (q(u,u))+α‖u‖_H²)^(1/2)`, α>−γ. Construct its Hilbert form-domain carrier and
continuous injective dense inclusion j into H; prove independence of α and
unitary, restriction and finite-sum transport. Conversely a complete Hilbert V,
bounded Hermitian form q, continuous injective dense j, and a quantitative shifted coercive
bound give precisely this closed-form model. Compactness of j is not required.
Own the coercive solution map over `[RCLike 𝕜]`: for the shifted form
`q_α(u,v)=q(u,v)+α⟨j u,j v⟩` with `RCLike.re q_α(u,u)≥c‖u‖²`, `c>0`, prove that every
continuous linear functional ℓ on V is `q_α(u,·)` for a unique `u∈V`, that `ℓ↦u` is
conjugate-linear with `‖u‖≤c⁻¹‖ℓ‖`, and in particular that every `h∈H` gives a unique u with
`q_α(u,v)=⟨h,j v⟩` for all v, `h↦u` being `𝕜`-linear and bounded by `c⁻¹‖j‖`. At `𝕜=ℝ` the
map `ℓ↦u` is the inverse of Mathlib's `IsCoercive.continuousLinearEquivOfBilin` for the bilinear
form `q_α`, composed with the inverse Riesz map `(InnerProductSpace.toDual ℝ V).symm` (for
V=ℝ, `q_α(u,v)=2uv` and `ℓ(v)=6v`, the equivalence is `v↦2v`, the Riesz vector of ℓ is 6, and
its inverse gives u=3 with `q_α(3,v)=6v`, while the equivalence itself would give 12);
for general `𝕜` regard V as a real Hilbert space through `InnerProductSpace.rclikeToReal`,
apply the real theorem to the coercive real bilinear form `RCLike.re q_α` and the functional
`RCLike.re ℓ`, and recover the `𝕜`-valued identity from its real part by testing against
`I•v` as well as v, since `q_α(u,I•v)=I q_α(u,v)` and `ℓ(I•v)=I ℓ(v)`. Use this solution map to
construct the unique self-adjoint partial operator A over `[RCLike 𝕜]`, the headline
`existsUnique_selfAdjoint_of_closed_form`:
`j(u)∈dom A` iff there exists h∈H with `q(u,v)=⟨h,j(v)⟩` for every v∈V, and
then `A j(u)=h`. Prove density, closedness, the lower bound, both adjoint inclusions,
and the resolvent estimate from shifted coercivity. Over ℂ identify the form
domain with `dom((A−γ)^(1/2))` by UO-A01's spectral calculus; prove the form
identity and both norm/domain comparisons. For a real form, prove that
complexification of its represented operator is the D06 operator of the
complexified form, with equal actual domains and actions, using Tau Ceti's Hilbert
complexification, GeneralizedCohomology G5.5-RealHilbert's unbounded complexification
transported along the identification e_H of the real spectral restriction below, and the
graph characterization; the complexified form is
`q_ℂ(u+Iu′,v+Iv′)=q(u,v)+q(u′,v′)+I(q(u,v′)−q(u′,v))` on the complexified form
domain, Hermitian and conjugate-linear in its first slot. Obtain the real
square-root form/domain identity through this comparison and the real spectral
restriction below. These targets require no compactness.

**D06 real unbounded spectral restriction.** For a real densely defined
self-adjoint A on a complete real inner-product space H, let
`H_ℂ=WithLp 2 (TauCeti.Complexification H)` be Tau Ceti's Hilbert complexification with its
isometric real inclusion `ι_H:H→H_ℂ`. Prove that the map `z↦WithLp.toLp 2 z`, the identity of
the common underlying type `TauCeti.Complexification H`, is a complex-linear isometric
equivalence e_H from GeneralizedCohomology G5.5-RealHilbert's `RealHilbertComplexification H`
onto `H_ℂ`: it is complex-linear because both synonyms keep the complex module structure of
`TauCeti.Complexification H`, it is isometric because both carry the inner product
`⟨x+iy,x′+iy′⟩=(x,x′)+(y,y′)+i((x,y′)−(y,x′))`, and it sends G5.5's real embedding of x to
`ι_H x`. Let J be the transport `e_H∘J_G∘e_H⁻¹` of G5.5-RealHilbert's antilinear isometric
conjugation J_G; it is an antilinear isometric involution of `H_ℂ` acting by `J(x+Iy)=x−Iy`.
Prove that `Fix J`, Tau Ceti's `TauCeti.realPoints J`, is `ι_H(H)`. Take for `A_ℂ` the transport
along e_H of G5.5-RealHilbert's unbounded complexification of A (its graph is the image of
G5.5's graph under `e_H×e_H`): the partial operator with domain `ι_H(dom A)+I•ι_H(dom A)` and
action `A_ℂ(ι_H x+I•ι_H y)=ι_H(Ax)+I•ι_H(Ay)`. G5.5's closure transport and adjoint identity
`(A_ℂ)†=(A†)_ℂ`, with equal domains, carry over along the unitary e_H and make it densely
defined, closed and self-adjoint. Prove here
that J preserves its domain with `JA_ℂ=A_ℂJ`, and that it is the only J-commuting self-adjoint
operator whose restriction to `Fix J` is the transport of A. For every real-valued
Borel f, prove J preserves the actual domain of `f[P_(A_ℂ)]` and commutes
with its action there: the scalar spectral measures of x and Jx agree, and
the square-moment condition is J-invariant. Define the real spectral restriction of A by f
as the restriction of that partial operator to `Fix J`, transported along
ι_H. Its actual domain is `{x:H | ι_H(x)∈dom f[P_(A_ℂ)]}` and its action
is uniquely determined by `ι_H(f_R x)=f[P_(A_ℂ)](ι_H x)`. Prove density, closedness and real self-adjointness. For each Borel B define the restricted real projection map by `P_R(B)=π_R∘(P_{A_ℂ}(B)).restrictScalars ℝ∘ι_H`; its diagonal scalar measure is exactly `P_{A_ℂ}.diag (ι_H x)`. Prove the second-moment formula
`dom(f_R)={x | ∫⁻ λ, ‖f(λ)‖ₑ² ∂(P_{A_ℂ}.diag (ι_H x))<⊤}`
and compatibility with the restricted bounded calculus `g↦π_R∘(g[P_{A_ℂ}]).restrictScalars ℝ∘ι_H` for bounded real Borel g. These maps are concrete restrictions, not a new real `ProjValMeasure` instance. Use SAST SA-E01 for the complexified operator's spectral PVM and UO-A01–A03 for its unbounded integral. The restricted projections `P_R` and the restricted bounded calculus are constructed here; Tau Ceti supplies the complexified Hilbert space, the inclusion `ι_H` and the transport of bounded maps, G5.5-RealHilbert the conjugation and the unbounded complexification on its own synonym, and the identification e_H above carries them to J and `A_ℂ` on `H_ℂ`.
For a real form with lower bound γ, take `f(t)=sqrt(max 0 (t−γ))`, define
B_R=f_R, and prove
`ι_H(j(V))=dom((A_ℂ−γ)^(1/2))∩Fix J`, hence `dom B_R=j(V)`.
Prove `q(u,v)−γ inner (j u) (j v)=inner (B_R(j u)) (B_R(j v))`
and the corresponding norm identities. The notation `(A−γ)^(1/2)` over ℝ
means this constructed B_R.

The generic real-shift self-adjointness criterion is a target of this section. State and prove the closed-form representation, including its square-root domain/form identification, over `[RCLike 𝕜]`; for 𝕜=ℝ, obtain the square-root statement by the G5.5-RealHilbert complexification and the real spectral restriction defined above. Select the represented closed-form operator by the unique representation theorem, with its graph as the canonical domain/action specification. Prove a witness-independence lemma: for fixed form domain, inclusion and form, every admissible coercive shift and coercivity/closedness witness selects the same partial operator, by uniqueness of its representing relation. For a densely defined symmetric partial operator A on a real or complex Hilbert space and real shift α, surjectivity of A+αI on its actual domain suffices to prove A is self-adjoint. Prove the bridge to the native `cI−A` convention: surjectivity of `x↦(−α)•x−Ax` is equivalent by negating the output to surjectivity of `x↦Ax+α•x`; leave the SAST core criterion in its stated `zI−A` convention. Include the form-solution specialization where the inverse S:H→H is bounded and symmetric, with its quantitative norm bound. Prove A⊆A* using the native partial-adjoint pairing. For y∈dom A*, choose x∈dom A with (A+αI)x=(A*+αI)y; then y−x lies in ker(A*+αI), which is orthogonal to ran(A+αI) by the adjoint pairing. Surjectivity forces y=x. State the native scalar and pairing hypotheses explicitly.

For `[RCLike 𝕜]` and a densely defined semibounded symmetric S, prove
closability of `q_S(u,v)=⟨Su,v⟩`, construct its form completion, and obtain the
Friedrichs extension S_F by that representation (Teschl (2009), Theorem 2.12, p.70,
through Lemma 2.10, p.68). Prove the real case through
complexification and restriction of the conjugation-fixed operator and form. The headline
`friedrichs_extension_extremal` states existence and extremality: a densely defined
symmetric partial operator S with `γ‖x‖²≤RCLike.re⟨Sx,x⟩` on its domain has a self-adjoint
extension S_F, `S≤S_F` in the graph order, satisfying the same bound on `dom S_F`, such that
every self-adjoint T with `S≤T` and the same bound on `dom T` satisfies
`T.resolvent t ≤ S_F.resolvent t` in the Loewner order for every real `t<γ`, in Tau Ceti's
convention `R(t)=(tI−·)⁻¹`; the form-domain clauses below are stated only here. Prove it extends S, preserves its lower
bound, is uniquely specified by this form completion, and compare its form core
with operator graph cores: these are distinct density conditions. Prove the
form-order/resolvent-order extremal property among self-adjoint extensions with
the same lower bound: `T≤S_F` in form order means `dom q_(S_F)⊆dom q_T` and
`q_T[u]≤q_(S_F)[u]` on that smaller form domain. Equivalently,
`(S_F−λ)⁻¹≤(T−λ)⁻¹` for every real λ below the common lower bound, that is
`R_T(λ)≤R_(S_F)(λ)` for `R(λ)=(λI−·)⁻¹`, since `R(λ)=−(·−λ)⁻¹`.
Teschl's Theorem 2.12 gives existence and uniqueness only. For complex separable H and lower
bound 0 the extremal property is Krein's theorem as stated in Eckhardt–Gesztesy–Nichols–Teschl
(arXiv:1208.4677v3, Theorem 12.1 and (12.8), p.54), which applies to `S−γ` and its extensions
`T−γ`. It is proved here over `[RCLike 𝕜]` without separability, by a route that uses only the
closed-form theory of this section. The closed form `q_T` of T is the closure of `u↦⟨u,Tu⟩` on
`dom T`, and it represents T, because its represented operator is a self-adjoint extension of T
and a self-adjoint operator has no proper symmetric extension. On `dom S⊆dom T` the form `q_T`
agrees with `q_S`, so the closure of `dom S` in the form norm of `q_T` is `dom q_(S_F)`, and
`q_T=q_(S_F)` there: this is the form-order statement, with equality on the smaller domain.
For real `λ<γ` and h∈H, the representation theorem applied to the shifted form
`q_T−λ‖·‖²`, which is coercive since `γ−λ>0`, gives
`⟨h,(T−λ)⁻¹h⟩=sup_(u∈dom q_T)(2Re⟨h,u⟩−q_T[u]+λ‖u‖²)`, attained at `u=(T−λ)⁻¹h`, and the
same formula for S_F has its supremum over the smaller set `dom q_(S_F)`, on which the
two forms agree. Hence `⟨h,(S_F−λ)⁻¹h⟩≤⟨h,(T−λ)⁻¹h⟩`.
Prove `dom S⊆dom T` and `dom S⊆dom S_F`; the form-domain comparison does
not assert an inclusion between `dom T` and `dom S_F`. For `[RCLike 𝕜]` and a Hermitian sesquilinear form perturbation b on the same
form domain put `q_α(u,v)=q(u,v)+α⟨j(u),j(v)⟩`, α>−γ. With
`‖b(u,u)‖≤a RCLike.re (q_α(u,u))+c‖j(u)‖_H²`, 0≤a<1 and c≥0, prove the closed semibounded sum-form theorem and its represented operator over 𝕜;
do not identify that operator with the algebraic operator sum without its domain
theorem.

*Needs:* Mathlib RCLike, continuous sesquilinear forms and Hilbert adjoints; Mathlib `IsCoercive.continuousLinearEquivOfBilin`, `InnerProductSpace.toDual` and `InnerProductSpace.rclikeToReal` for the coercive solution map; Tau Ceti's `WithLp 2 (TauCeti.Complexification H)` and `ContinuousLinearMap.complexifyL2` for the Hilbert complexification and its inclusion; GeneralizedCohomology G5.5-RealHilbert for the conjugation and the unbounded complexification on `RealHilbertComplexification H`; §1.1–§1.3 and SelfAdjointSpectralTheory SA-E01 for square roots.

**API.**

- Closedness is completeness in any positive shifted form norm; changing the shift preserves the form-domain topology.
- The graph characterization determines the represented self-adjoint operator independently of coercivity witnesses.
- The Friedrichs operator comes from form completion and the square-root theorem identifies its form domain.
- The identity of the underlying complexification is a complex-linear isometric equivalence from G5.5's Hilbert synonym onto Tau Ceti's L² complexification; it carries G5.5's conjugation to an antilinear isometric involution whose fixed space is the image of the real inclusion.

**Checks.**

- For V=H=ℂ, j=id and q(u,v)=2 conj(u)v, α=0,c=2 gives A=2I. At u=1,v=i both sides of q(u,v)=⟨Au,v⟩ are 2i.
- For q=0 with j=id, α=c=1 satisfies coercivity and represents total zero; α=2,c=1 gives the same operator.
- For j=2id on ℂ and q(u,v)=conj(u)v, the represented operator is A=(1/4)I: ⟨A(2u),2v⟩=conj(u)v. Taking A=I would multiply the pairing by 4.
- For H=ℝ both complexification synonyms give `⟨i·1,1⟩=−i` (the formula's imaginary part is `(0,0)−(1,1)=−1`), so the identity map preserves the inner product; the transported conjugation sends x+iy to x−iy and fixes exactly `{y=0}`, the image of ℝ. The real-linear isometry x+iy↦x−iy, a plausible wrong identification, is not complex-linear: it sends `i·1` to `−i`, not to `i` times the image `1` of 1.
- For S=−d²/dx² on `C_c∞(0,1)` and γ=0, S_F is the Dirichlet realization and the Neumann realization T is another nonnegative self-adjoint extension. For the constant function 1 and t=−1, `⟨1,R_T(−1)1⟩=−1` (1 spans `ker T`), while `R_(S_F)(−1)1=−u` with `−u″+u=1`, `u(0)=u(1)=0`, `u(x)=1−cosh(x−1/2)/cosh(1/2)`, so `⟨1,R_(S_F)(−1)1⟩=−(1−2tanh(1/2))≈−0.076`. Thus `R_T(−1)≤R_(S_F)(−1)` holds at this vector, and the reversed order, which a `(·−t)⁻¹` resolvent convention would produce, fails there. The variational formula of the route reproduces both values: over `H¹(0,1)` the supremum of `2∫u−∫|u′|²−∫|u|²` is attained at u=1 and equals 1, and over `H₀¹(0,1)` it is attained at the Dirichlet solution above and equals `∫u=1−2tanh(1/2)≈0.076`.

### 4.8 Singular differential expressions and endpoint domains (UO-D07)


Build the scalar Sturm–Liouville expression `τu=w⁻¹(−(pu′)′+qu)` on an open
interval, with real measurable p,q,w, p,w>0 a.e. and `p⁻¹,q,w∈L¹_loc`.
Its maximal domain consists of `u∈L²(w dx)` with `u,pu′∈AC_loc` and
`τu∈L²(w dx)`.
Prove local integral-equation existence/uniqueness, Green's formula, density,
the minimal closure of compactly supported maximal-domain functions, and
`T_min*=T_max` (Teschl (2009), Theorem 9.1, p.182, and Lemma 9.4, p.184). Prove Weyl's
limit-point/limit-circle alternative, spectral-parameter
independence, endpoint deficiency counts, and graph-continuous boundary functionals
using solution Wronskians (Teschl Theorem 9.6, p.187, and Theorem 9.9, p.191). Identify self-adjoint boundary conditions through
UO-D04. For semibounded expressions compare the principal-solution boundary
condition with UO-D06's Friedrichs realization, including singular endpoints.
[Eckhardt–Gesztesy–Nichols–Teschl, arXiv:1208.4677v3, Theorem 2.2, §§3–6 and 11](https://arxiv.org/abs/1208.4677v3)
provide the scalar proof route; their broader distributional-potential model
is not needed to state this coefficient class.

Include the half-line Hardy inequality `∫|u′|²≥¼∫|u/r|²` and its sharpness for
`u∈C_c∞(0,∞)`. For `−u″+(ν²−¼)u/r²−bu/r`, ν≥0, prove semiboundedness by
factorization; classify zero as limit-circle for `0≤ν<1` and limit-point for `ν≥1`, identify the Friedrichs origin condition, and prove limit-point behavior at infinity,
and distinguish the critical ν=0 form completion from separately subtracting
two possibly infinite integrals. Prove failure of a lower bound when the
inverse-square coefficient is below −¼ by rescaled compact tests.
For `Ju′+V(r)u` on two-component L², with `J=[[0,−1],[1,0]]` and locally
integrable Hermitian V, build the analogous maximal/minimal, Green-boundary and
endpoint classification API by its first-order integral system and UO-D04.
Use [Weidmann, *Spectral Theory of Ordinary Differential Operators*,
LNM1258 (1987), §§3–6](https://doi.org/10.1007/BFb0077960) for the minimal/maximal,
deficiency and Weyl endpoint proof route, with the displayed Dirac-system
coefficient hypotheses stated at every specialization.
The Coulomb coefficients, Frobenius traces, distinguished Dirac domain and spectral
quantization belong to a physical-model roadmap consuming these operator/endpoint
constructions; they are outside this roadmap. A Dirac operator is not assigned a Friedrichs
extension by the semibounded scalar theorem.

**API.**

- The minimal operator is closed, densely defined and symmetric, and its adjoint is the maximal operator. For f and g in the maximal domain the endpoint limits of `W_x(conj g,f)` exist, where `W_x(u,v)=p(uv′−u′v)(x)`, and Green's formula `⟨g,τf⟩−⟨τg,f⟩=W_a(conj g,f)−W_b(conj g,f)` holds for the inner product of `L²(w dx)`.
- At each endpoint, either every solution of `(τ−z)u=0` is square integrable near it for every complex z (limit circle), or for every nonreal z the solutions square integrable near it form a line (limit point); which case holds does not depend on z.
- The deficiency indices of the minimal operator are equal, since complex conjugation preserves its domain and commutes with τ (p, q and w are real), and they equal the number of limit-circle endpoints, 0, 1 or 2.

**Checks.**

- For `p=w=1`, `q=0` on `(0,1)`, the functions `f(x)=x²` and `g=1` are in the maximal domain, with `⟨g,τf⟩=∫₀¹(−2)dx=−2`, `⟨τg,f⟩=0`, `W_0(1,x²)=0` and `W_1(1,x²)=2`, so `W_0−W_1=−2` as Green's formula requires; the reversed order of the endpoint terms, as printed in Teschl (2009), (9.4) and (9.7), p.182, gives `+2`.
- For `p=w=1`, `q=0` on `(0,1)` the maximal domain is `H²(0,1)` and the minimal domain is `H₀²(0,1)`; both endpoints are regular, hence limit circle, and `T_min` has deficiency indices (2,2).
- For `p=w=1`, `q=0` on `(0,∞)` the endpoint 0 is regular and ∞ is limit point, because for z∉[0,∞) only one of the two solutions `exp(±√(−z) x)` is square integrable near ∞; the deficiency indices are (1,1) and the self-adjoint realizations are the separated conditions at 0.
- For `p=w=1`, `q=(ν²−¼)/r²` on `(0,∞)`, the solutions at z=0 are `r^(1/2±ν)`: for ν=1/2 they are 1 and r, both square integrable near 0, so 0 is limit circle; for ν=3/2 they are r² and r⁻¹, and r⁻¹ is not square integrable near 0, so 0 is limit point. The coefficient `p=1_(0,1/2)` on `(0,1)` is excluded from the class because `p⁻¹` is not locally integrable.

*Needs:* §4.5 and §4.7; PDE local weak derivatives and integration; local integral-equation construction stated here.

### Examples

The interval and half-line momentum examples give (1,1) and (1,0); the boundary and closed-form checks distinguish maximal isotropy, self-adjointness and representation.

### Dependencies

HilbertModules H6, and H7's interval example for §4.6; BanachSpaceTheory B5 Hilbert dimension for §4.1; SelfAdjointSpectralTheory SA-A21, SA-D17 and the resolvent theory for §§4.1–4.2; Layer 1 and SelfAdjointSpectralTheory SA-E01 for square roots; PolarDecomposition PD-B23–PD-B34; LieGroups Layers 2 and 5 for the matrix parameters of §4.5; VonNeumannAlgebras V10 interval derivatives and PDE traces and weak derivatives for the endpoint models of §§4.5–4.8; Mathlib's real Lax–Milgram theorem, Tau Ceti's Hilbert complexification and GeneralizedCohomology G5.5-RealHilbert's conjugation and unbounded complexification for the real case.

## Layer 5: cores, analytic vectors and perturbations

A vector `x` is C-infinity for A when it lies in every iterated domain. It is analytic when there is `r>0` such that `Σ ‖Aⁿx‖ rⁿ/n!` converges. Analytic vectors are always defined relative to an operator and its actual iterated domains. A dense invariant subspace does not become a core without a graph-density proof.

### 5.1 Graph cores, common domains, and the bounded-commutator obstruction (UO-E01)

Using SAST SA-C39's graph-core definition, which for closed A is Mathlib's `LinearPMap.HasCore`, prove D is a core for closed A exactly when it is dense in `dom A` for the graph norm, and likewise for A* (Tau Ceti's `LinearPMap.HasCore.of_graph_subset_closure` is the direction from graph density to the core). For closed symmetric A and nonreal z, prove D⊆dom A is graph-dense in `dom A` iff `(A−z)D` is norm-dense in `ran(A−z)`: the estimate (2.44) in the proof of Teschl (2009), Lemma 2.7, p.66 (Tau Ceti's `LinearPMap.IsFormalAdjoint.norm_smul_sub_sq`) makes `A−z` a linear homeomorphism from `dom A` with its graph norm onto `ran(A−z)`. If D is dense in H and both `(A−i)D` and `(A+i)D` are dense in H, prove the closure of the restriction is self-adjoint by the range criterion for essential self-adjointness (Teschl (2009), Lemma 2.7, p.66); maximality then makes D a core for A. The invariant-domain criterion below is Teschl (2009), Corollary 5.3, p.125. Also prove the unitary-group criterion for self-adjoint A: if dense D⊆dom A is invariant under every `exp(itA)`, differentiating on D and graph approximation makes D a core. Prove compatibility with graph closure, sums on intersection domains, and restrictions to reducing subspaces. On a nonzero Hilbert space H, prove there are no bounded P,Q with `PQ−QP=cI` for `c≠0` by iterating `PQⁿ−QⁿP=ncQⁿ⁻¹`; derive `n!|c|ⁿ≤(2‖P‖)ⁿ‖Qⁿ‖≤(2‖P‖‖Q‖)ⁿ` (with the nilpotent case giving an immediate contradiction at the first vanishing power), contradicting factorial growth. For a measurable kernel K between σ-finite measure spaces, define the maximal integral-operator domain by a.e. absolute convergence and an L² output. Prove the conjugate-transpose-kernel adjoint inclusion by Fubini under explicit integrability hypotheses. For Hilbert–Schmidt kernels and for Schur kernels, prove boundedness, density of the stated test domain, and equality with the bounded adjoint given by the conjugate-transpose kernel; state the row/column integral or product-L² hypotheses. Do not assert an unconditional kernel-adjoint equality for an arbitrary measurable kernel.

#### UO-E01 integral counterexample

Jones, *Von Neumann Algebras*, 13 November 2015, pp.86–87, Exercises 12.1.11(ii) and 12.1.15: On complex L²(ℝ) with Lebesgue measure, construct the partial linear operator `I:L²(ℝ) →ₗ.[ℂ] ℂ` with actual domain `{f∈L²(ℝ): f is integrable}` and action `If=∫_ℝ f`. Prove representative independence and density of this L¹∩L² domain; do not use the Bochner integral's default value outside its integrable domain to make I total. For each integer n≥1 put `f_n=n⁻¹1_[0,n]`; prove `f_n∈D(I)`, `‖f_n‖₂=1/√n→0` and `If_n=1`. Deduce that I is not closable and, using linearity and domain density, that the topological closure of its graph is all `L²(ℝ)×ℂ`. Compute the Hilbert adjoint on its actual domain: `D(I*)={0}` and `I*(0)=0`. This supplies a densely defined operator with nondense adjoint domain, including the zero-domain case between two Hilbert spaces. Consume H6's scalar graph/adjoint theory and native `LinearPMap.IsClosable`, graph closure and `LinearPMap.adjoint`; do not introduce a second partial-operator carrier. The headline `integralOperator_counterexample` states the density, the full graph closure, the zero adjoint domain and the non-closability for every partial operator from the carrier `L2`, Mathlib's `Lp ℂ 2` for Lebesgue measure on ℝ, to ℂ whose domain is exactly the integrable classes and whose action is the Bochner integral there; these two conditions determine I, and the construction above provides it.

**Absolute-pairing kernel domain and composition adapter.** On the existing complex L²(ℝ) carrier, for measurable K define the positive absolute-kernel integral `P_K f(x)=∫|K(x,y)|f(y)dy` on nonnegative inputs and the solid linear domain `D_abs(K)={f∈L²:P_K|f|∈L²}`. Prove this is exactly the set of f∈L² with finite absolute double pairing against every L² test, with a.e. absolute row convergence and the L² output condition; it need not equal the larger maximal-output domain permitted by cancellation. Prove the L² dual criterion used here: a nonnegative measurable q with `∫q|g|<∞` for every g∈L² belongs to L². An assumed unbounded positive functional would give nonnegative g_n of norms≤2^(−n) and values≥1, whose L² sum contradicts monotone convergence. If K_y=K(.,y) belongs to L² for a.e. y, prove D_abs(K) dense: bounded inputs supported in `[−n,n]∩{y:‖K_y‖₂≤n}` satisfy `‖P_K|f|‖₂≤n‖f‖₁`, and these sets exhaust a.e. Use measurability, Tonelli and the existing Bochner/Minkowski norm estimate, not a global HS assumption.

**API.**

- `D_abs(K)` is a linear subspace of L², solid (if f is in it and `|g|≤|f|` almost everywhere then g is in it), and contained in the maximal integral-operator domain: for f in it the row integrals converge absolutely almost everywhere and `|∫K(x,y)f(y)dy|≤P_K|f|(x)` puts the output in L².
- f lies in `D_abs(K)` exactly when `∫∫|K(x,y)φ(x)f(y)|dxdy<∞` for every φ∈L², by Tonelli and the dual criterion.
- If almost every column `K_y` lies in L², then `D_abs(K)` is dense in L².

**Checks.**

- For the zero kernel `D_abs(0)=L²`; for the positive rank-one kernel `K(x,y)=u(x)conj(u(y))` with u∈L², `P_K|f|=|u|·⟨|u|,|f|⟩` lies in L² for every f, so again `D_abs(K)=L²` and the restriction is the bounded rank-one operator.
- For the weighted block kernel `K=Σ n·1_(I_n)(x)1_(I_n)(y)` on disjoint unit intervals, `ψ=Σ n⁻¹s_n` lies in L² and in the adjoint domain of the D_abs restriction, but `P_K|ψ|=1` on every I_n, so ψ∉D_abs(K): the solid domain is a proper subspace of the domain of the self-adjoint maximal operator.
- For the unit-block kernel `K=Σ 1_(I_n)(x)1_(I_n)(y)` on disjoint intervals of length n, `u_n=1_(I_n)/√n` lies in D_abs(K) with `A_K u_n=n u_n`, so D_abs membership carries no uniform bound; a definition demanding a bounded restriction would exclude these kernels.

For a measurable N prove the following equivalence: its absolute double pairing is finite for every L² pair iff P_N is an everywhere-defined bounded order-preserving integral operator. After the dual criterion gives P_N f∈L² for every nonnegative f, prove boundedness by a positive-series contradiction: if unbounded, choose f_n≥0 with norm≤2^(−n) and `‖P_N f_n‖₂≥n`; their sum f gives `P_N f≥P_N f_n` for all n, contradicting P_N f∈L². Derive the uniform absolute-pairing bound, boundedness of the complex N-operator with norm≤‖P_N‖, and its bounded conjugate-transpose adjoint by absolute Fubini. Order preserving means that nonnegative real functions have nonnegative real images; it does not assert Hilbert-space/C*-positivity or self-adjointness. Preserve the existing HS/Schur special cases and exact norm/positivity examples. Boundedness of the complex N-operator alone is insufficient: realize normalized Sylvester-Hadamard matrices of orders2^k as block-constant kernels on disjoint unit intervals. The signed block operator has norm1, but the absolute-kernel block norms are2^(k/2). Nonnegative normalized constant block inputs of amplitudes2^(−k/4) give two L² vectors with infinite absolute double pairing. Thus the all-pairing assumption supplies the needed regularity; boundedness of the N-operator does not. Neither boundedness nor the all-pairing condition implies a.e. L² rows or columns of N: the Schur kernel `|x−y|^(−α)` on `[0,1]²`, with `1/2≤α<1` and any diagonal value, has bounded absolute integral operator but non-L² sections. Keep the composition's L²-column hypothesis on K explicit.

For a.e. L² columns K_y and such a bounded order-preserving majorant P_N, define `M(x,z)=∫N(x,y)K(y,z)dy` a.e., zero on the exceptional null set. Prove joint measurability/a.e. absolute convergence from the column hypothesis, P_N's full domain and Tonelli. For f∈D_abs(K), the triple absolute integral is bounded by the L² function `P_N(P_K|f|)`, so Fubini proves the kernel formula for BA on exactly its stated composition domain D_abs(K). The maximal M-kernel operator may properly extend it; do not silently equate domains. For an explicit witness take disjoint unit intervals I_n and `K(x,y)=Σ_(n≥1)n·1_(I_n)(x)1_(I_n)(y)`, whose maximal operator has proper domain, and B=0. Then BA is zero on D(A), while its zero kernel has maximal domain all L². Symmetry of K alone does not make the D_abs restriction self-adjoint or its domain maximal: for this same real symmetric block kernel, let s_n equal +1 and −1 on the two halves of I_n and zero outside I_n, and put `ψ=Σ n^(−1)s_n`. Then ψ∈L², every signed row integral is zero, but `P_K|ψ|=1` on every I_n, hence ψ∉D_abs(K). The range on D_abs consists of block-constant functions, orthogonal to ψ, so ψ lies in its adjoint domain with adjoint action zero. So symmetry does not supply the absolute-Fubini condition, while the maximal weighted block operator is self-adjoint. Under the stated a.e. L²-column hypothesis on K, also prove the exact adjoint theorem: the operator on D_abs(K) has adjoint equal to the maximal conjugate-transpose kernel operator. For any φ∈L² the transpose integral b(y) exists absolutely a.e. by column Cauchy–Schwarz and satisfies `|b(y)|≤n‖φ‖₂` on E_n; every L² input supported there lies in D_abs(K). Testing an adjoint representing vector against all such inputs identifies it with b on each E_n and hence globally. Conversely b∈L² gives the adjoint identity against every D_abs input by its absolute-pairing condition. Outside these explicit column and test-domain hypotheses the general conclusion remains the existing Fubini adjoint inclusion; this equality does not assert D_abs=D_max or self-adjointness for symmetric kernels. These results use E01's same integral carrier and H6's actual composition domain.

**Unbounded absolute-pairing restrictions.** The restriction to D_abs(K) need not be bounded. On pairwise disjoint intervals I_n of length n, the Borel kernel `K(x,y)=Σ_(n≥1)1_(I_n)(x)1_(I_n)(y)` is bounded by1 and has a.e. L² columns, but for the unit vectors `u_n=1_(I_n)/√n` one has `u_n∈D_abs(K)` and `A_Ku_n=n u_n`. Thus the restriction, and its maximal transpose adjoint under the column theorem above, are unbounded. Absolute-integrability membership is not a uniform norm estimate. The existing HS/finite-Schur and all-pairing bounds remain unchanged. Pointwise bounded kernels do not by themselves satisfy the section/Fubini hypotheses of the composition theorem.

The transpose integral is `∫conj(K(y,x))φ(y)dy`, not `∫K(y,x)φ(y)dy`; Hermitian symmetry identifies that conjugated kernel with K(x,y), not the unconjugated one. For disjoint unit intervals I,J, take `u=1_I+i1_J` and `K(x,y)=u(x)conj(u(y))`. This is the existing bounded positive rank-one model, yet K(y,x)≠K(x,y) on the cross rectangles. With φ=1_J, the correct adjoint value on I is −i and the unconjugated transpose gives +i. This uses E01’s kernel/adjoint carrier, not an additional realization.

**Kernel positivity and exact norm adapter.** For an arbitrary measurable kernel the adjoint question needs hypotheses. On L²(ℝ), `K(x,y)=1_[0,1](y)` gives a constant output; its maximal L²-output domain is the proper closed hyperplane `1_[0,1]⊥`, so arbitrary measurability does not even ensure density for a unique Hilbert adjoint. For the bounded branch require Hilbert–Schmidt K∈L²(ℝ²), or the following unweighted Schur hypotheses: K is measurable and there are finite a,b≥0 with ∫|K(x,y)|dy≤a for a.e. x and ∫|K(x,y)|dx≤b for a.e. y. In the Schur branch prove ‖A_K‖≤√(ab). In either branch prove that for every f∈L²(ℝ) the row integral converges absolutely for a.e. x, gives an L² output and therefore defines the maximal integral on all L². Under these hypotheses prove the absolute Fubini pairing identity and compare its quadratic double integral with native `ContinuousLinearMap.isPositive_iff_complex`: positivity is equivalent to that value being real and nonnegative for every input; it suffices to test a dense linear subspace because the bounded quadratic form is continuous. A Hermitian kernel gives the already stated bounded self-adjointness identity.

Give the exact norm as `‖A_K‖=sup_{‖f‖₂≤1}(∫|∫K(x,y)f(y)dy|²dx)^(1/2)`, and distinguish it from the generally nonsharp HS/Schur upper bounds. Supply a concrete exact-norm realization: for u,v∈L²(ℝ), `K(x,y)=u(x)conj(v(y))` represents native `InnerProductSpace.rankOne ℂ u v`, so `‖A_K‖=‖u‖₂‖v‖₂`, including zero vectors. For v=u prove positivity and norm ‖u‖₂². For two orthonormal u₁,u₂, the sum of their positive rank-one kernels gives an orthogonal projection with operator norm1 and HS-kernel norm√2, explicitly showing why the bound is not an exact norm formula. This realizes native positivity/rank-one APIs in the existing kernel carrier; it does not assert an arbitrary measurable-kernel adjoint or build a second integral-operator library.

*Needs:* HilbertModules H6 and SelfAdjointSpectralTheory SA-C39 graph cores; §4.1 for deficiency-zero tests; Mathlib Tonelli, Fubini and Lp for kernel examples.

### 5.2 Analytic-vector calculus (UO-E02)

Prove closure of analytic vectors under linear combinations on a common invariant subspace, eigenvectors are analytic, and analytic vectors are C-infinity (analytic vectors as in Flato–Simon–Snellman–Sternheimer (1972), introduction, p.424). Establish exponential power-series identities and invariance of the analytic domain on its convergence interval.

*Needs:* HilbertModules H6 iterated domains; native norm-summable series; §1.1 for the spectral exponential comparison.

**API.**

- Analyticity quantifies a positive radius in the actual iterated domains.
- Finite linear combinations retain a smaller common positive radius.
- The exponential norm series converges within that radius and agrees with the spectral action.

**Checks.**

- For A=2I and x=1, the norm series is Σ2ⁿrⁿ/n!=exp(2r), finite for every r.
- For the zero operator the series is ‖x‖; the n=0 term prevents every bound from having arbitrarily small C.
- For M_n and xₙ=1/n, x∈ℓ² but x∉D(M_n), so even the first iterate is unavailable; ambient density alone cannot imply analyticity.

### 5.3 Nelson essential self-adjointness and strong commutation (UO-E03)

`CommonInvariantDomain` bundles the actual operators, a dense linear subspace contained in all their domains, and invariance. `CommonInvariantDomain.action` is their induced linear action on that subspace; `CommonInvariantDomain.restricted` is the partial operator with exactly that subspace as domain. `MixedWordAnalyticBound` is the positive-constant factorial estimate for every ordered word on a fixed vector. The headline `nelson_essential_selfAdjoint` states self-adjointness of every restricted closure on a complete complex Hilbert space, with symmetry and a bound for every vector explicit. With pairwise commuting actions, `nelson_resolvent_commute` gives, at arbitrary nonreal parameters z,w, bounded two-sided inverses R of `zI−cl(Sᵢ|D)` and S of `wI−cl(Sⱼ|D)` in the sense of Tau Ceti's `LinearPMap.IsResolventAt` (values in the domain of the closure, inverse on both sides), and R and S commute. By `LinearPMap.IsResolventAt.unique` they are the resolvents of the two closures.

For symmetric S, require a dense invariant D⊂⋂ₙdom(Sⁿ), symmetry on D, and for every x∈D constants Cₓ,Rₓ>0 with `‖Sⁿx‖≤CₓRₓⁿ n!`; prove essential self-adjointness of S|D. For a finite family S₁,…,S_k, use a common dense invariant D contained in every mixed-word domain, require pairwise commutation on D and a joint analytic estimate, for example `‖S₁^{n₁}⋯S_k^{n_k}x‖≤CₓRₓ^{|n|}|n|!` for every multi-index. Prove the joint integration theorem with these hypotheses: set `ρ(e_i)=iS_i|D`, use the mixed-word factorial estimates to build local exponentials on D and prove their multiplication/commutation on a positive convergence neighborhood for each analytic vector and the finitely many combinations being compared, then integrate the abelian Lie-algebra representation to a strongly continuous unitary representation of the simply connected group ℝ^k by the Flato–Simon–Snellman–Sternheimer integrability theorem: a representation of a real Lie algebra by skew-symmetric operators on a dense invariant domain of vectors analytic for each basis representative integrates to a unique unitary representation of the simply connected group (Flato–Simon–Snellman–Sternheimer (1972), Hypothesis (C), p.428, and Theorem 1, p.430). The mixed-word bound makes every x∈D analytic for each single S_i (take the words in one letter), which is exactly Hypothesis (C) for `ρ(e_i)=iS_i|D`; it does not make x analytic for `Σ S_i²` (the word bound gives `‖(ΣS_i²)ⁿx‖≤C(kR²)ⁿ(2n)!`, and `(2n)!/n!` is unbounded), so Nelson's Laplacian-based joint theorem is not the route. Identify the coordinate generators with the self-adjoint closures `cl(S_i|D)` by the single-operator analytic-vector theorem (Nelson (1959), Lemma 5.1: a symmetric operator with a dense set of analytic vectors in its domain is essentially self-adjoint), and obtain strong commutation and the joint PVM from the spectral/Stone supplier. The estimates quantify every x∈D with its own positive C_x,R_x and every ordered word; after proving commutation on invariant D they agree with the displayed multi-index formulation. Represent ordered compositions through `CommonInvariantDomain.applyWord`; prove this evaluates the corresponding iterated partial-operator action, and apply the estimate to each word without storing a duplicate action field. Prove that these hypotheses yield strongly commuting self-adjoint closures and a joint PVM; merely commuting on an unspecified common domain is insufficient. The integrability theorem uses no hypothesis beyond density, invariance, skew-symmetry of `iS_i|D`, the abelian commutation on D and analyticity of each vector for each S_i.

**Analytic-vector adapters.** Consume E02's actual power domains and E03's invariant-domain theorem. From any dense SET of analytic vectors construct `D=span{A^mψ:m≥0, ψ in that set}`. If `‖A^kψ‖≤M k! r^(−k)`, then for fixed m and0<ρ<r the series for A^mψ is bounded by `M r^(−m)Σ_n((n+m)!/n!)(ρ/r)^n`, which converges. Thus D is dense, invariant, and every vector has a positive analytic radius and factorial estimate; the original input set need not be linear or invariant. Finite sums use the minimum of finitely many smaller radii. Eigenvectors are entire analytic. Spectral windows P([−a,a])H give a dense invariant union of entire analytic vectors for every self-adjoint operator.

For the exponential identity at |z|<r, absolute summability of the term norms gives a Cauchy series. In the multiplier model identify its L² limit with e^(zf)ψ by an almost-everywhere convergent subsequence of the partial sums, and only then infer maximal exponential-domain membership. Bounded partial sums alone would not suffice. The inverse-image sum contains the multiplier powers T_f^n. Convergence at t=0 is not an analytic hypothesis; the positive radius is.

Give a restriction example on the existing generic multiplier/derivative carrier, without a dependency on any physical-model roadmap. Use UO-A07 and H6 unitary transport to realize P as the inverse-Fourier conjugate of the maximal real multiplier2πξ, and PDE's weak/Bessel agreement to identify P=−i∂ with domain H¹(ℝ). Let `g_a(x)=exp(−|x−a|)`, D their finite complex span, and A=P|D. Each g_a lies in H¹. Prove `(1−∂²)g_a=2δ_a` weakly and the graph-pairing identity `⟨h,g_a⟩+⟨h′,g_a′⟩=2conj(h(a))`, first for C_c∞ and then by PDE's H¹ C_c∞ density and continuous point trace. Derive the trace bound `|h(a)|²≤2‖h‖₂‖h′‖₂≤‖h‖₂²+‖h′‖₂²` on tests from the fundamental theorem, and extend by H¹ approximation; the same uniform-in-a bound gives the continuous representative. A graph-orthogonal h vanishes at every point, so D is a graph core and A is essentially self-adjoint. For distinct a_j the derivative of Σc_jg_(a_j) has jump−2c_j at a_j, while every D-vector has a continuous representative. If Aψ∈D every jump vanishes, hence ψ=0. Thus D(A²)={0}, so A has no nonzero C-infinity or analytic vectors although its self-adjoint closure does. No closure-domain vector is silently transferred to a restriction's iterated domain.

For a deficiency proof of Nelson's theorem, prove the direct-sum adjoint of A⊕(−A) by testing each coordinate; its deficiency spaces have cardinals n₊+n₋ in opposite orders, and zero defects of the doubled operator force both original defects zero. For a symmetric B with balanced defects choose a self-adjoint extension S of its closure. An analytic B-vector remains analytic for S, with S^nψ=B^nψ, and e^(itS) preserves all its power norms. Thus `F(z)=⟨φ,e^(izS)ψ⟩` is holomorphic on the connected strip |Imz|<r by local norm-series expansions around every real point. If φ∈ker(B*+i), then `⟨φ,B^nψ⟩=i^n⟨φ,ψ⟩` and `F^(n)(0)=(−1)^nF(0)`. The identity theorem gives F(t)=e^(−t)F(0) for all real t; unitarity and t→−∞ force F(0)=0. Density kills that deficiency space, and balanced defects kill the other. This uses the existing Nelson/deficiency/spectral owners.

*Needs:* §5.2; §4.1 and HilbertModules H6 for the deficiency proof; §2.3 and §2.5 for the joint-PVM conclusion; SelfAdjointSpectralTheory SA-E43 for group identification.

**API.**

- The common-domain action and restriction are determined by the supplied partial operators.
- The empty word is the input and [i,j] applies j first, then i; all intermediate vectors stay in the domain.
- The positive mixed-word constants can depend on x; symmetry is explicit, and pairwise commutation is required for the joint conclusion.

**Checks.**

- For k=1, S=2I and x=1, C=R=2 give 2ⁿ≤2·2ⁿn!. At n=0,1,2 the two sides are (1,2),(2,4),(4,16), and the closure is 2I.
- For S=iI the word norms are all 1 and C=R=1 works; nevertheless ⟨i,1⟩=−i≠i=⟨1,i⟩, so symmetry excludes it.
- For Pauli X,Z and x=e₁, the words [X,Z] and [Z,X] give e₂ and −e₂. Both are bounded and analytic, but commutation fails; their resolvents at i also fail to commute.
- For k=0 there are no operator conclusions, while the empty-word bound still requires ‖x‖≤C. For a proper dense invariant domain the restriction retains that domain until closure is taken.

### 5.4 Kato–Rellich and relatively compact perturbations (UO-E04)

Consume SAST SA-C55, implemented as Tau Ceti's `IsSelfAdjoint.add_of_isRelativelyBounded`, for the Kato–Rellich conclusion: a symmetric V with `dom A⊆dom V` and A-bound `b<1`, in Tau Ceti's lettering `‖Vx‖≤a‖x‖+b‖Ax‖`, preserves self-adjointness of self-adjoint A on `dom A` (Teschl (2009), Theorem 6.4, p.135). Prove Weyl's theorem: self-adjoint A and B whose resolvents differ by a compact operator at one point of `ρ(A)∩ρ(B)` have the same essential spectrum (Teschl (2009), Theorem 6.19, p.146). Then call V A-compact when `dom A⊆dom V` and `V(A−i)⁻¹` is compact, equivalently `V R_A(i)` in the convention `R_A(z)=(zI−A)⁻¹`; prove that an A-compact V has A-bound zero (Teschl (2009), Lemma 6.22, p.148), so that `A+V` is self-adjoint on `dom A` for symmetric V, that A-compactness passes to `A+V` (Lemma 6.23, p.148), and that the resolvent difference `R_(A+V)(z)−R_A(z)` is compact, which gives invariance of the essential spectrum by Weyl's theorem. Prove the bounded compact case as a corollary and keep point/discrete eigenvalue motion separate from essential-spectrum invariance.

*Needs:* Tau Ceti's `IsSelfAdjoint.add_of_isRelativelyBounded` (SelfAdjointSpectralTheory SA-C55) and `LinearPMap.resolvent`; Mathlib `IsCompactOperator`; §3.2; HilbertModules H6 graph norm; compact-operator norm limits.

**API.**

- Weyl's theorem (`essentialSpectrum_eq_of_isCompactOperator_resolvent_sub`): self-adjoint operators whose resolvents at one common resolvent point differ by a compact operator have equal essential spectra; Tau Ceti's resolvent is the negative of Teschl's, which does not affect compactness.
- Relative compactness uses the actual graph-domain map followed by a resolvent.
- A symmetric A-compact perturbation is self-adjoint on the original domain and has the essential spectrum of A (`isSelfAdjoint_add_and_essentialSpectrum_eq`).

**Checks.**

- For A=0 and a rank-one orthogonal projection V on ℓ², V(A−i)⁻¹=iV is compact and both essential spectra are {0}.
- For A=0 and V=I on ℓ², V(A−i)⁻¹=iI is not compact and the essential spectrum moves from {0} to {1}.
- For V=0 the relative-compact map is 0 and the operator and spectrum remain exactly those of A.

### 5.5 Local analytic perturbation and isolated spectral branches (UO-E04a)

On a complete complex Hilbert space let A be self-adjoint and let B be a symmetric complex-linear partial operator with D(A)⊆D(B) and explicit finite a,b≥0 satisfying `‖Bx‖≤a‖x‖+b‖Ax‖` on D(A), Tau Ceti's `IsRelativelyBounded B A a b`. Define T(z)=A+zB on exactly D(A), a holomorphic family of type (A) (Kato (1995), Chapter VII, §2). For sufficiently small complex z prove closedness and equivalence of its graph norm with A's graph norm; for real t with |t|b<1 prove self-adjointness by Tau Ceti's `IsSelfAdjoint.add_of_isRelativelyBounded` (SA-C55). Consume `LinearPMap.IsResolventAt`, `resolvent` and `analyticAt_resolvent`, with the convention R_A(w)=(wI−A)⁻¹; the latter existing analyticity is in w, not a perturbation theorem in z. For a compact resolvent contour Γ prove continuity and a finite uniform bound M for ‖BR_A(w)‖ on Γ, and for |z|M<1 prove the actual-domain inverse formula `R_(T(z))(w)=R_A(w)(I−zBR_A(w))⁻¹`. Include the graph-domain-valued inverse and its locally uniformly convergent Neumann series, operator-norm holomorphy in z, `∂_z R_(T(z))(w)=R_(T(z))(w) B R_(T(z))(w)` and the contour differentiation formulas. Prove local adjoint compatibility T(z)*=T(conj z), the resolvent adjoint identity, unitary-conjugacy naturality and independence of the Riesz projection under contour deformations separating the same spectral component. All compositions with B use the proved graph-domain inverse.

For an isolated real eigenvalue λ₀ of finite multiplicity m≥1 choose a positively oriented circle Γ around λ₀ meeting and enclosing no other spectrum of A; the separation of the spectrum by Γ and its Riesz projection are Kato's (Kato (1995), Chapter VII, §1). Construct `P(z)=(2πi)⁻¹∮_Γ R_(T(z))(w)dw`, prove it is a bounded idempotent with rank m for small z (including the case where the complementary spectral subspace is zero), and prove the exact spectral decomposition inside/outside Γ, invariance of D(A), `range P(z)⊆D(A)`, commutation on that domain and holomorphy as H→D(A) in the A-graph norm. Consume [BanachAlgebras A2](../../BanachAlgebras/README.md#layer-2-holomorphic-functional-calculus) (Layer 2, §2.1) for bounded Riesz idempotents and their spectral corners. Supply the bridge through a fixed bounded resolvent `(w_*I−T(z))⁻¹`, with w_* outside Γ and in all the local resolvent sets, using the spectral change μ=(w_*−λ)⁻¹ away from0; identify its bounded Riesz idempotent with the displayed unbounded contour integral. Do not construct a second Banach-algebra holomorphic calculus.

For m=1 and a unit u₀∈ker(A−λ₀), prove the unique eigenvalue λ(z) inside Γ and a nonvanishing eigenvector v(z) are holomorphic locally, with v(z)∈D(A) graph-norm holomorphically, λ(0)=λ₀ and v(0)=u₀. One may use v(z)=P(z)u₀ and the complex-linear functional x↦⟨u₀,x⟩ to recover λ(z); shrink the neighborhood to keep its denominator nonzero. For real t prove λ(t) is real and v(t)/‖v(t)‖ is a real-analytic unit eigenvector (Kato (1995), Chapter VII, §3, for selfadjoint holomorphic families), and prove `λ′(0)=⟨u₀,Bu₀⟩` here by differentiating `⟨u₀,(T(z)−λ(z))v(z)⟩=0` at z=0: the term `⟨u₀,(A−λ₀)v′(0)⟩=⟨(A−λ₀)u₀,v′(0)⟩` vanishes by symmetry, and `⟨u₀,v(0)⟩=1`. Do not require unit normalization to be holomorphic for complex z. The headline `exists_analytic_eigenvalue_branch` states the complex-parameter part: if λ₀ is an isolated point of the spectrum of A whose eigenspace is spanned by the unit vector u₀, there are r>0 and functions λ and v, holomorphic on `|z|<r` (v as an H-valued function), with λ(0)=λ₀, v(0)=u₀, `λ′(0)=⟨u₀,Bu₀⟩`, and v(z)∈D(A), v(z)≠0 and `Av(z)+zBv(z)=λ(z)v(z)` for `|z|<r`.

For m>1 also build the finite-multiplicity real-parameter layer: transport P(t)H real-analytically to the fixed m-dimensional initial eigenspace, using an orthonormal frame obtained from `P(t)|_(P(0)H)` and its positive Gram-matrix inverse square root. Prove the finite-dimensional Rellich theorem that a one-real-parameter real-analytic Hermitian matrix family admits local real-analytic eigenvalues and a real-analytic orthonormal eigenbasis (Kato (1995), Chapter II, §6); use it to produce m real-analytic eigenvalue/eigenvector branches for T(t), counted with multiplicity and without imposing increasing eigenvalue order through crossings, with graph-norm-analytic eigenvectors. Include the degenerate first-derivative comparison with the eigenvalues of `P(0)B|_(P(0)H)`. Keep this local real-parameter theorem distinct from global analyticity of the full spectral set or branch claims for arbitrary non-self-adjoint analytic families. These local theorems describe how an isolated eigenvalue of A moves under the perturbation tB. The headline `exists_realAnalytic_eigenvalue_branches` states the branch theorem for every finite multiplicity m, m=1 included: if λ₀ is an isolated point of the spectrum of A with m-dimensional eigenspace `ker(λ₀I−A)`, the kernel of `LinearPMap.smulSub λ₀ A`, there are r,δ>0 and functions `λ_k:ℝ→ℝ` and `v_k:ℝ→H`, k<m, real analytic on `(−r,r)`, with `λ_k(0)=λ₀`, such that for `|t|<r` the `v_k(t)` are orthonormal vectors of D(A) with `Av_k(t)+tBv_k(t)=λ_k(t)v_k(t)`, the spectrum of `A+tB` in the disc of radius δ about λ₀ is `{λ_k(t)}`, and every eigenvector of `A+tB` for an eigenvalue in that disc lies in the span of the `v_k(t)`. Both headlines record analyticity of the eigenvectors as H-valued functions; their graph-norm analyticity is the further target above.

*Needs:* §5.4; Tau Ceti unbounded resolvent identities; BanachAlgebras A2 bounded Riesz idempotents; finite-dimensional Hermitian matrix theory for the Rellich branch.

**API.**

- The perturbed operator uses the fixed domain D(A); local resolvents take values in this graph domain.
- The separating Riesz projection has constant finite rank and depends holomorphically on the parameter.
- Real-parameter eigenbranches are real analytic, without an ordering requirement across crossings, and exhaust the spectrum near λ₀ with its eigenvectors (`exists_realAnalytic_eigenvalue_branches`).
- At multiplicity one the branch is holomorphic in the complex parameter with `λ′(0)=⟨u₀,Bu₀⟩` (`exists_analytic_eigenvalue_branch`).

**Checks.**

- For A=2I,B=3I on ℂ, R_(T(z))(w)=1/(w−2−3z) and its z derivative is 3/(w−2−3z)², fixing the positive derivative sign.
- For T(t)=diag(t,−t), the analytic branches are t and −t; increasing order instead gives −|t|,|t| and fails analyticity at 0.
- For B=0 the contour projection is constant. If the enclosed eigenspace is all H, its complement is zero and the projection is I, not an excluded case.
- For A=diag(0,1) and B=[[1,1],[1,0]] on ℂ², with λ₀=0 and u₀=e₁, the eigenvalue of A+zB near 0 is `λ(z)=((1+z)−√(1−2z+5z²))/2=z−z²+O(z³)`, so `λ′(0)=1=⟨e₁,Be₁⟩`; the second-order term `−z²=|B₁₂|²z²/(0−1)` comes from the other eigenvalue, and the family A−zB would give `λ′(0)=−1`.

### 5.6 Worked cores (UO-E05)

For the one-dimensional harmonic oscillator, prove the finite Hermite span consists of analytic vectors and is a graph core; prove Schwartz space is a graph core. Prove `C_c∞(ℝ)` is an operator graph core for this oscillator as well. With a fixed smooth compactly supported χ equal to1 near0, put `χ_R(x)=χ(x/R)` and show for Schwartz ψ that `H(χ_Rψ)−χ_RHψ=−2χ_R′ψ′−χ_R″ψ`. The L² errors are bounded by `2C/R·‖ψ′‖₂+C/R²·‖ψ‖₂`, and dominated convergence controls the cutoff of ψ and Hψ. Combine this with the Schwartz graph core by diagonal approximation; no analytic-vector premise on compactly supported functions is used. For `−d²/dx²` on `L²(ℝ)`, prove Schwartz and `C_c∞(ℝ)` are graph cores. For the free Laplacian on `L²(ℝ³)`, prove `C_c∞(ℝ³)` is a graph core. For the Dirichlet Laplacian on `L²(0,1)` in the position representation, with operator domain `H²(0,1)∩H₀¹(0,1)`, prove the finite sine span `span{sin(nπx):n≥1}` consists of analytic vectors and is a graph core, using the sine-series second-derivative norm. Distinguish these properties: Schwartz space is a graph core and contains total analytic subsets such as the Hermite functions, but not every Schwartz vector is analytic. No nonzero compactly supported smooth function is analytic for the free Laplacian; prove compact-support graph-core claims by Fourier approximation, not analytic vectors. In the interval model prove `C_c∞(0,1)` is a form core in `H₀¹` but its graph closure has domain `H₀²`, which also imposes zero first-derivative traces; it is not an operator core for the Dirichlet realization (the one-dimensional oscillator and its Hermite span are Teschl (2009), §8.3, pp.178–179; Theorem 8.5, p.179, is the three-dimensional statement). Physical spectral and probability interpretations are outside this roadmap.

*Needs:* §5.1–§5.3; completed OrthogonalL2Bases Parts A and D; PDE Fourier/Sobolev comparison and smooth cutoffs.

### 5.7 Three-dimensional L²+L∞ potentials (UO-E06)

On `L²(ℝ³)`, realize the nonnegative free Laplacian `−Δ` as the Fourier conjugate of multiplication by `4π²|ξ|²` in the `e^(−2π i x·ξ)` convention, with domain `H²(ℝ³)` and `C_c∞(ℝ³)` as a graph core. Prove the Fourier identity and domain agreement with the PDE Bessel-potential operator. First prove the Gagliardo–Nirenberg estimate `‖u‖∞ ≤ C‖u‖₂^(1/4)‖Δu‖₂^(3/4)` on H²: split `‖û‖₁` at radius R, use Plancherel and Cauchy–Schwarz on the inner and outer regions, and optimize R; handle u=0 separately. For real `V=V₂+V∞` with `V₂∈L²(ℝ³)`, `V∞∈L∞(ℝ³)`, deduce `‖V₂u‖₂ ≤ ε‖Δu‖₂+Cε‖u‖₂` by Young's inequality and `‖V∞u‖₂≤‖V∞‖∞‖u‖₂`; apply the relative-bound theorem on `H²` and prove graph-norm equivalence on the common domain; this transfers the `C_c∞` core and yields the claimed essential self-adjointness (Teschl (2009), Lemma 10.1, p.221, and Theorem 10.2, p.222, there with the bounded part vanishing at infinity; a bounded part that does not vanish has relative bound zero by `‖V∞u‖₂≤‖V∞‖∞‖u‖₂`). The headline `isSelfAdjoint_closure_neg_laplacian_add_potential` states this essential self-adjointness: for real `V₂∈L²(ℝ³)` and `V∞∈L∞(ℝ³)`, the partial operator on `L²(ℝ³)` whose domain is the classes of smooth compactly supported functions f, acting by `−Δf+(V₂+V∞)f` with Mathlib's Laplacian `Δ`, has a self-adjoint closure. Its smoothness index is `(⊤ : ℕ∞)`: at the Mathlib pin `ContDiff ℝ ⊤` means analytic, and an analytic function with compact support on ℝ³ is zero. For relative compactness assume additionally `V∞(x)→0` essentially at infinity (compact support suffices). Truncate V₂ and V∞ outside large balls; use local Rellich plus compactness of `H²` into `C⁰` on bounded subdomains to prove compactness of truncated multiplication-resolvent factors, and the L² tail of V₂ and L∞ tail of V∞ for the operator-norm remainder. This is an `ℝ³` theorem: for n≥4 a potential in `L²(ℝⁿ)` need not be `−Δ`-bounded, and the statement is not extended to `ℝⁿ`. The essential self-adjointness and relative-compactness targets carry these exact decomposition and decay hypotheses; the Coulomb application and the radial and hydrogen calculations belong to a physical-model consumer outside this roadmap.

*Needs:* §5.4 and §5.6; PDE A1 and A3 (§§1.1, 1.3), Sobolev embeddings (A4, §1.4) and local Rellich compactness (A6, §1.6); Mathlib's Laplacian `InnerProductSpace.instLaplacian`, native Fourier and Young inequalities.

### Examples

The scalar 2I example satisfies Nelson’s estimate; iI fails symmetry and the Pauli pair fails commutation. Jones’s integral functional and the kernel examples test closability and actual domains.

### Dependencies

Layers 1, 3 and 4, and Layer 2's strong commutation and joint PVM for §5.3; HilbertModules H6; SelfAdjointSpectralTheory SA-C39, SA-E43 and SA-C55, the latter with Tau Ceti's relative bounds as `IsSelfAdjoint.add_of_isRelativelyBounded`; Tau Ceti's `LinearPMap.resolvent` and its resolvent identities; Mathlib Lp, Tonelli–Fubini, `IsCompactOperator`, Fourier, Young's inequality and the Laplacian; BanachAlgebras A2 for perturbation contours; the completed OrthogonalL2Bases Parts A and D for §5.6; PDE A1, A3, A4 and A6 for differential cores and §5.7.

## Layer 6: closed tensor operators and self-adjoint sums

Use V2's completed Hilbert tensor product and bounded tensor maps. Start with dense algebraic tensor domains and identify their closures; make no inference that a tensor sum or product is self-adjoint merely because its factors are.

### 6.1 Tensor operators (UO-F01)

For closed densely defined operators A and B, construct the closure of the algebraic tensor operator `A⊙B` on `dom A ⊙ dom B`, prove it is closable, identify its adjoint as the closure of `A*⊙B*` for all closed densely defined A and B, and establish domain, graph-norm, kernel and range lemmas. The self-adjoint case and its spectrum are Teschl (2009), Theorem 4.14 and Problem 4.5, p.121, which also cover §6.2–§6.3. A route for the adjoint identity in general: write `A=U|A|` and `B=V|B|` by VonNeumannAlgebras V10's closed-operator polar decomposition, so that `A*=|A|U*` and `B*=|B|V*` with `dom|A|=dom A` and `dom|B|=dom B`; Theorem 4.14 for the real polynomial `λ₁λ₂`, on the smaller domain `dom|A|²⊙dom|B|²` as in §6.2, makes the closure of the symmetric operator `|A|⊙|B|` on `dom A⊙dom B` self-adjoint; the partial isometry `U⊗V` is isometric on the closure of the range of `|A|⊙|B|`, so the closure of `A⊙B` is `(U⊗V)·cl(|A|⊙|B|)`, whose adjoint is `cl(|A|⊙|B|)(U⊗V)*`; this is the closure of `A*⊙B*`, by graph approximation on `ker(U⊗V)*` and on the image under `U⊗V` of elementary tensors from the initial space. Prove the corresponding one-sided operators `A⊗I` and `I⊗B` are closed on their natural graph domains.

**One-sided closed tensor eigenspace adapter.** For closed densely defined A on K use the SAME natural closed `I_H⊗A` constructed in F01. Relative to any Hilbert basis of H identify H⊗̂K with square-summable K-coordinates(x_i), and prove its domain is exactly `x_i∈D(A)` with `Σ_i(‖x_i‖²+‖Ax_i‖²)<∞`, acting coordinatewise. Prove this by finite coordinate cutoffs and graph closure of the algebraic tensor operator. Deduce, for every complex λ, `ker(I_H⊗A−λ)=H⊗̂ker(A−λ)`: closedness makes the factor kernel closed; eigen-coordinates give graph sum `(1+|λ|²)Σ_i‖x_i‖²`. Include arbitrary basis cardinals and zero factors. Do not assert this completed-space equality on the raw algebraic tensor domain or for an unspecified closure of a merely densely defined nonclosed factor. Consume V2's completed product basis and V2.RectangularL2: for arbitrary marginal measures use the maximal rectangle-cover product given by native Measure.pi transported through MeasurableEquiv.piFinTwo, with the a.e. elementary-product unitary, rectangle density and null-cylinder representative independence proved there. No separability or σ-finiteness is required for that convention. Under σ-finite marginals consume its proved equality with native Measure.prod and recover the Euclidean product realization for Lebesgue measures. Separability alone does not identify arbitrary rectangle-consistent extensions or turn the native bind product into the maximal product.

For analytic independent factor vectors the binomial norm-series estimate bounds the tensor-sum analytic series by the product of the two factor series at a radius below both. Finite elementary-tensor sums retain a common smaller radius. This proves the analytic-vector tensor lemma. Its later arbitrary factor graph-core domain instead uses the existing independent polynomial/power-core adapter with degree1 in each factor and F02's full joint(s+t)-moment closure. No analytic premise on every Coulomb C_c∞ vector is inferred. Transport the resulting core by the stated coordinate unitary. These are adapters on the existing tensor carrier and factor-core theorem.

*Needs:* HilbertModules H6 closed graphs; VonNeumannAlgebras V2 completed Hilbert tensors and V2.RectangularL2; VonNeumannAlgebras V10.ClosedOperators polar decomposition for the general adjoint identity.

**API.**

- The tensor operator is the graph closure on the dense algebraic tensor domain.
- Its adjoint is the closed tensor of the factor adjoints.
- One-sided operators act coordinatewise in any Hilbert basis with the summed graph-moment domain.

**Checks.**

- For A=2I,B=3I on ℂ, the product is 6I and the sum is 5I.
- For a zero factor the tensor Hilbert space is zero, every graph is {(0,0)}, and the spectrum is empty.
- For I⊗M_n, coordinates xₙ=1/n fail the weighted squared sum Σ1; xₙ=1/n² give Σ1/n²<∞. The algebraic finite-support domain is properly smaller than the closed domain.

### 6.2 Joint-PVM tensor calculus (UO-F02)

For self-adjoint A and B on complete complex Hilbert spaces, construct the product PVM `P_(A,B)` on `ℝ²` and its scalar measures `μ_(A,B)^x(C)=inner x (P_(A,B)(C) x)` for Borel C; define `S` as the graph closure of the algebraic tensor sum `A⊙I+I⊙B` on `dom A ⊙ dom B`, and `P` as the closure of `A⊙B`. Identify S and P as the spectral integrals of `s+t` and `st`, with domains `{x:∫|s+t|² dμ_(A,B)^x<∞}` and `{x:∫|st|² dμ_(A,B)^x<∞}`. Prove self-adjointness and the algebraic tensor-core claims. The natural sum `(A⊗I)+(I⊗B)` on the intersection domain can be a proper restriction of S; prove its closure is S, without identifying its unclosed domain with the full `s+t` moment domain. The headlines `existsUnique_tensorSum` and `existsUnique_tensorProd` state, on V2's carrier `UniformSpace.Completion (H ⊗[ℂ] K)` and for all complete H and K (zero spaces included), that the algebraic operator on the span of the elementary tensors `a⊗b`, `a∈dom A`, `b∈dom B`, has exactly one self-adjoint closure, together with the spectrum formula of §6.3 (Teschl (2009), Theorem 4.14, p.121: the closure is self-adjoint already from the smaller domain `dom A² ⊙ dom B²` used there for the product, and a closed symmetric extension of a self-adjoint operator is that operator).

**API.**

- The product PVM `P_(A,B)` is a normalized PVM on ℝ² whose value on a rectangle `B₁×B₂` is `P_A(B₁)⊗P_B(B₂)`; its marginals are the spectral measures of the closed one-sided operators `A⊗I` and `I⊗B`.
- S and P are self-adjoint and are the spectral integrals of s+t and st for `P_(A,B)` on their full moment domains; the algebraic tensor domain `dom A⊙dom B` is a graph core of each.
- The closure of the natural sum `(A⊗I)+(I⊗B)` on its intersection domain is S, which can properly extend that sum.

**Checks.**

- For A=2I and B=3I on ℂ the joint PVM is the atom at (2,3), so S=5I and P=6I; a joint measure placing the atoms of A and B at different points would give the wrong sum.
- For a zero factor the tensor Hilbert space is zero, the joint PVM takes values in the zero space, and S and P are the zero operators on it.
- For `A=M_n` and `B=−M_n` on `ℓ²⊗̂ℓ²`, the vector `x=Σ n⁻¹ e_n⊗e_n` lies in `dom S`: its joint measure sits on the diagonal atoms (n,−n), where s+t=0. It lies neither in `dom(A⊗I)∩dom(I⊗B)` (Σ n²·n⁻² diverges) nor in `dom P` (Σ n⁴·n⁻² diverges), so S properly extends the intersection-domain sum and the s+t moment domain is not the st moment domain.

*Needs:* §6.1; §2.5; §1.1–§1.3.

### 6.3 Tensor spectra and evolution (UO-F03)

For the closed realizations S and P of UO-F02, prove `σ(S)=closure(σ(A)+σ(B))` and `σ(P)=closure(σ(A)σ(B))` (Teschl (2009), (4.43)–(4.44), p.121), deriving them from the joint PVM support. No nonzero-space hypothesis is needed: if H or K is zero, the tensor space is zero, both sides are empty, and so is the spectrum of the zero factor. Prove `exp(itS)=exp(itA)⊗exp(itB)` by the joint calculus. The headline `stoneGroup_tensorSum_apply_tmul` states it on elementary tensors, for all complete H and K: if S is the closed tensor sum, given as in `existsUnique_tensorSum` by its action on `a⊗b`, `a∈dom A`, `b∈dom B`, and as the closure of its restriction to their span, and U, V, W are Tau Ceti's unitary C₀-groups with complex generators `i•A`, `i•B` and `i•S`, then `W(t)(a⊗b)=U(t)a⊗V(t)b` for every real t and all a∈H, b∈K; elementary tensors span a dense subspace, so this determines W(t). A route that avoids the product PVM: `U(t)⊗V(t)` extends to a unitary C₀-group on the completed tensor product whose generator extends `i(A⊙I+I⊙B)` on `dom A⊙dom B`; that subspace is dense and invariant under the group, hence a core for its generator (Teschl (2009), Corollary 5.3, p.125), so the generator is `i•S` and the two groups agree by the uniqueness in Stone's theorem. For A=2I and B=3I on ℂ, `W(t)=e^(5it)` and `e^(2it)a⊗e^(3it)b=e^(5it)(a⊗b)`; the convention `exp(−itA)` on one factor only would give `e^(it)`. Establish finite n-fold closed sums by the product PVM, with domain `{x:∫_(ℝⁿ)|t₁+⋯+tₙ|² dμ_(A₁,…,Aₙ)^x<∞}`, and prove their group factorization by induction.

**Independent real-polynomial tensor/power-core adapter.** For finitely many independent complete complex Hilbert factors H_j and self-adjoint A_j, write a real polynomial as `q(t)=Σ_α c_α t^α` with finitely many multi-indices. Choose d_j at least the highest exponent of variable j and a linear graph core D_j for A_j^(d_j); for d_j=0 require only density. Use the existing product PVM and joint Borel calculus to define the self-adjoint q-operator on exactly `{x:∫_(ℝⁿ)|q(t)|²dμ_x(t)<∞}`. Prove its restriction to the algebraic tensor of the D_j is essentially self-adjoint and has this closure. No invariance or analytic-vector premise on D_j is required. The full domain is the q-moment domain, which can be larger than separate highest-power moment domains because of cancellations.

Prove the core statement by rectangular joint spectral cutoffs, finite elementary-tensor approximation on each rectangle, then per-factor A_j^(d_j) graph approximation using `|q(t)|²≤C∏_j(1+|t_j|^(2d_j))` and the lower-power bounds. For nonzero factors prove `σ(q)=closure(q(∏_jσ(A_j)))` from the product PVM support; the image itself need not be closed. If any H_j=0, the tensor Hilbert space is0 and the operator spectrum is∅. Constant q uses d_j=0 and gives its scalar operator; with no factors declare the tensor unit ℂ and take that constant branch. The raw spectral sum can miss0: use independent diagonals n and −n+1/n, n≥1. The raw product for spectra ℕ₊ and {0}∪{1/n:n≥1} is ℚ_≥0, whereas the closed tensor product spectrum is [0,∞). Existing F03 already supplies binary sum/product closures. Do not extend the separate-core conclusion to an arbitrary strongly commuting family without a joint-core argument; F04's analytic criterion retains its separate scope.

*Needs:* §6.2; §1.6; SelfAdjointSpectralTheory SA-E43; Tau Ceti's unitary C₀-groups and Stone's theorem `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` for the group factorization, with §5.1's unitary-group core criterion for its route through the tensor group; factor graph-core approximation for the polynomial case.

### 6.4 Nelson tensor-sum criterion (UO-F04)

If A and B are essentially self-adjoint on invariant analytic-vector cores, prove the algebraic tensor core consists of joint analytic vectors for the sum under explicit growth bounds; conclude essential self-adjointness of the tensor sum by the single-operator analytic-vector theorem (Nelson (1959), Lemma 5.1, as in §5.3) and identify its closure with UO-F02 (Teschl (2009), Theorem 4.14, p.121). Cover finite direct sums and tensor powers.

*Needs:* §5.2–§5.3; §6.1–§6.2; elementary-tensor density from VonNeumannAlgebras V2.

### Examples

Scalar tensor factors give sum 5 and product 6. Independent unbounded diagonals require the closure of the spectral image and the full joint-moment domain.

### Dependencies

HilbertModules H6 closed graphs for §6.1; VonNeumannAlgebras V2 completed tensors and V2.RectangularL2; VonNeumannAlgebras V10 polar decomposition for the adjoint identity of §6.1; Layers 1–2 joint calculus; SelfAdjointSpectralTheory SA-E43 and Tau Ceti's unitary C₀-groups with Stone's theorem for the group factorization of §6.3; Layer 5 analytic vectors for §6.4, and §5.1's unitary-group core criterion for one route to §6.3's group factorization.

## Downstream consumers

VariationalMethods 5.1 specializes §4.7's unique represented operator to compact form
pairs: its compact-pair operator is the represented operator on the same inclusion, form
and shift data, its domain and action are read off the §4.7 graph characterization, and it
consumes the witness-independence lemma, the real-shift self-adjointness criterion and the
coercive solution map of §4.7 (its 2.3 energy-space forcing maps are built on that solution
map). Roadmaps for physical quantum models (measurement and state probabilities, Fock
models, Coulomb and Dirac Hamiltonians) consume Layers 1–6 and §4.8's endpoint theory as
generic operator theory and add their own carriers; none is a supplier here. These
consumers add no hypotheses to the generic targets here.

## Worked examples

These examples validate distinct APIs; each remains an individual target rather than being replaced by a generic keyword checklist.

| Example | Owner and acceptance target |
|---|---|
| A self-adjoint differential operator that is not a multiplication operator in its given representation, and a Borel f with `σ_p(f(A))=ℤ_+`, `σ_c(f(A))=(−∞,0]` | UO-A02/A04/A07/C01/C05; use the full-line momentum witness and exact symbol specified below, and the independent Dirichlet example |
| `(fg)(A) ⊇ f(A)g(A)` with `dom(f(A)g(A))=dom g(A)∩dom(fg)(A)` | UO-A03, including equality on the natural domain |
| `[A,B]=iC*C` on a dense domain and eigenvectors of A | UO-E01 acceptance proof, with explicit common-domain hypotheses; derive `Cψ=0` from the expectation identity |
| Exact norm on a spectral window; recovery of `P_A` from `P_{f(A)}` | UO-A04/A06 |
| Uniqueness on a dense subspace; norm convergence `exp(itA)→1` for bounded A | UO-A02 and SAST Part A respectively |
| `+iψ′` on the two half-lines with both zero traces, a commuting reflected conjugation, adjoint permitting a jump, deficiency indices and all extensions | UO-D02/D03/D05 plus H6; the explicit `Jψ(x)=conj ψ(−x)`, maximal domain, signs and boundary conditions are specified below; the measurement interpretation is outside this roadmap |
| Invariant-domain cores, two explicit invariant dense position domains, the positive dilation group, its maximal generator domain and empty point spectrum | UO-E01 and SAST Stone, with the exact C_c∞/Schwartz and logarithmic-coordinate comparisons below |
| An integral operator with measurable kernel K: the domain `{ψ∈L²:Aψ∈L²}` and the absolute-pairing domain `{ψ∈L²:Aψ∈L² and ∫∫|K(x,y)φ(x)ψ(y)| dxdy<∞ for every φ∈L²}`, with an a.e. column-L² hypothesis, adjoint/composition and Fubini conditions | UO-E01 states the a.e. convergence requirements, compares these domains with its maximal integral domain, and proves the appropriately qualified adjoint/composition results; a Fubini-restricted domain is not silently called maximal. For self-adjointness of A, the criterion is kernel symmetry `K(x,y)=conj K(y,x)` together with `dom A=dom A*`; conjugate-transpose Fubini alone gives only an adjoint inclusion, so prove domain equality under explicit hypotheses rather than treating kernel symmetry alone as sufficient |
| The cylinder operator `ix∂θ` on `Span{φ(θ)ξ(x): φ∈C∞(𝕋), ξ∈L²(ℝ), xξ∈L²(ℝ)}`, where `ξ∈L²(ℝ)` is needed for each generator to lie in the Hilbert space: its closure, diagonalization, spectrum, PVM, one-parameter group and conjugated multiplication B | UO-A/C for spectral calculus; use SAST Part A for the one-parameter Stone group (UO-B05 is the multiparameter theorem); physical interpretation is outside this roadmap |
| Two closed operators N,R on one domain with R−N not closable; adjoint-of-sum and adjoint-of-product inclusions | H6 sum/product API plus UO-E01; prove the fully specified example below, including the sequence `e_n/n` |
| Spectral family of continuous `f(A)`; under separability, unboundedness and `σ(A)=σ_p(A)`, the eigenvalue set is countable and unbounded, the accumulation points of its Borel image are classified, and spectrum ℝ is realized | UO-A04/A05/C05; the premise derivation and explicit rational-image symbol are specified below |
| Clamped second derivative, exact adjoint domain and `(2,2)` deficiency indices/`U(2)` extensions | UO-D02/D04/D05, consuming H6 and explicit endpoint traces |
| Failure of symmetric domain invariance under an extension group, analytic vectors on extensions, and every self-adjoint extension of an index-(1,1) operator commuting with a fixed commuting conjugation | UO-D03/E02/E03, with the explicit rank-one identities and deficiency labels below |
| A bounded B commuting with A, the C∞-domain equalities, and analytic vectors for AB and A+B | UO-E02 owns the domain-qualified hypotheses, product/binomial bounds and B=0 case below |
| Bounded inverse of a self-adjoint operator; adjoints of products, bounded and unbounded | H6's closed operator and composition API, and UO-A02 for inverse spectral calculus |
| The backward shift `A(x₁,x₂,…)=(x₂,x₃,…)`: its norm, adjoint, kernels/range, positivity and self-adjointness of `A*A`, and all three spectra of A | UO-C01/C05: prove `‖A‖=1`, `A*` is the forward shift, `ker A=ℂe₁`, `ker A*={0}`, `ran A*=e₁⊥`, and `A*A=I−P_(ℂe₁)` is positive self-adjoint. Compute `σ_p(A)={z:|z|<1}`, `σ_c(A)={z:|z|=1}`, `σ_r(A)=∅`; these are the spectra of A, not of `A*A` |
| The endpoint-zero `C¹(0,1)` domain for `+i d/dx` without a derivative-L² condition, its adjoint and one self-adjoint extension | UO-D02/D04/D05; prove the expression is not L²-valued on that full domain, then use the explicit derivative-L² restriction, H₀¹ closure, H¹ adjoint and periodic extension below |
| `−d²/dx²` on `C_c∞(ℝ)`, adjoint and essential self-adjointness | UO-D01 supplies the deficiency-zero criterion; identify the adjoint as the maximal `H²(ℝ)` operator using the PDE weak-derivative supplier, then solve `−u″=±iu` and show neither deficiency equation has a nonzero L² solution. UO-E01/E05 supply the graph-density/Fourier proof that `C_c∞(ℝ)` is an operator core. Do not route compact support through an analytic-vector criterion |
| Measurable kernel operator, adjoint, self-adjointness, positivity, boundedness and norm | H6 adjoint API and UO-E01's kernel-operator domain example |
| A complex diagonal sequence on `D₃={x∈ℓ²:Σ n⁶|x_n|²<∞}`, with finite accumulation points precisely `±i` and `sup_n |λ_n/n³|<∞`, together with the closedness condition A=Ā | UO-B01/C05: prove the displayed restriction is closable but is never closed under these hypotheses. Identify its maximal diagonal closure and compute the closure’s point/continuous/residual spectra as specified below |
| The spectrum realization `σ_p(A)=ℚ`, `σ_c(A)=ℝ\ℚ` on ℓ² | UO-C05 owns the explicit self-adjoint maximal rational diagonal below |

### The split-line derivative and its commuting conjugation

The operator is `Bψ=iψ′`, with the `+i` sign, on the functions that are
absolutely continuous on each half-line with L² derivative and tend to0 at0
from each side, that is, with two zero traces:
`dom B=H₀¹((−∞,0))⊕H₀¹((0,∞))` in the orthogonal half-line
decomposition of `L²(ℝ)`. Prove equivalence with these local AC and
L²-derivative conditions, density, closedness and symmetry. The adjoint is
`B*ψ=iψ′` on the exact domain `H¹((−∞,0))⊕H¹((0,∞))`, with independent
traces and no requirement of absolute continuity across0. Prove the
half-line limits at infinity vanish and derive the boundary form by
integration by parts.

Explicitly construct the conjugation
`(Jψ)(x)=conj(ψ(−x))`. Prove it is an antiunitary involution, swaps the two
half-lines, preserves both zero traces and satisfies `BJψ=JBψ` on dom B:
both sides equal `−i conj(ψ′(−x))`. Plain pointwise conjugation instead
anticommutes with `+i∂`; it is not a commuting conjugation.
Apply UO-D03 and H6 to obtain equal deficiency indices and existence of
self-adjoint extensions. In the convention
`N₊=ker(B*−i)` and `N₋=ker(B*+i)`, compute
`N₊=span{1_(−∞,0)(x)e^x}` and
`N₋=span{1_(0,∞)(x)e^(−x)}`, so `(n₊,n₋)=(1,1)`.
Classify all self-adjoint extensions by the maximal-domain trace condition
`ψ(0+)=exp(iθ)ψ(0−)`, `0≤θ<2π`, and prove these exhaust the boundary-form
classification. The jump at0 permitted in the adjoint domain remains explicit. This
`+i` example is transported by a sign change from the generic UO-D05
`−i` convention, without silently identifying their deficiency labels.

With the two zero traces, minimal-domain pieces glue to `H¹(ℝ)` with trace0 and to an absolutely continuous representative on every compact interval crossing0. Prove this by joining the two AC primitives, or by cancellation of the weak-derivative boundary term. The permitted jump and lack of global AC concern the maximal adjoint domain, not this minimal domain.

### An endpoint-zero interval domain and an L²-valued restriction

The domain of `f∈L²(0,1)∩C¹(0,1)` with endpoint
values0 and no `f′∈L²` condition does not define an
L²-valued operator `Af=if′` on every listed function. Prove this using
`f(x)=x(1−x)sin(1/x)`: it has continuous zero endpoint values and is C¹
on the open interval, while
`f′(x)=(1−2x)sin(1/x)−(1−x)cos(1/x)/x` is not L² near0. The bounded
first term cannot cancel the latter's divergent squared integral, as the
substitution `u=1/x` shows.

Adopt the explicit restriction adding `f′∈L²(0,1)`, with endpoint values
interpreted as traces of its continuous representative. Prove this domain
lies in `H₀¹(0,1)` and contains `C_c∞(0,1)`; use weak/strong derivative
agreement and Sobolev graph density to show its graph closure is the
closed minimal operator `A_min=i∂` on `H₀¹(0,1)`. Prove density and
symmetry of the restriction, and identify its adjoint, equal to
`A_min*`, as `i∂` on `H¹(0,1)` without endpoint constraints. The
restriction and its closure are not self-adjoint. For the requested one
self-adjoint extension, choose `A_per=i∂` on
`{f∈H¹(0,1):f(1)=f(0)}` and prove self-adjointness by the boundary form
or the periodic Fourier basis. The action is `+i∂` throughout;
UO-D05's generic `−i∂` example is related by negation.

### Two closed operators whose difference is not closable

On a separable Hilbert space with orthonormal basis `(e_n)_(n≥1)`, put
`h=Σ_(n≥2)e_n/n`,
`D={x∈H:Σ_(n≥2)n⁴|⟨e_n,x⟩|²<∞}`,
`Nx=Σ_(n≥2)n²⟨e_n,x⟩e_n` and
`Rx=Nx+⟨h,Nx⟩e₁`, both on D. Prove h exists in H, D is dense, and
N is closed by its maximal diagonal description, with eigenvalue0 on e₁.
Let `T=I+(y↦⟨h,y⟩e₁)`. Since `h⊥e₁`, its rank-one summand squares
to0 and T has bounded inverse `I−(y↦⟨h,y⟩e₁)`. Prove `R=TN` is
closed by this bounded invertibility. For `n≥2`, the vectors `x_n=e_n/n`
lie in D and tend to0, while `(R−N)x_n=e₁`. Thus R−N on D is not
closable. This is a concrete counterexample, and it shows
the failure of closed operators on a fixed domain to form a linear space;
the generic H6 sum and product inclusions remain separate targets.

### Pure-point hypotheses and image accumulation

Assume that A is unbounded self-adjoint on separable H and
`σ(A)=σ_p(A)=Λ`. Prove Λ is countable by choosing mutually orthogonal
unit eigenvectors for distinct eigenvalues and using separability. Prove
Λ is unbounded: bounded spectrum would, by the PVM moment-domain theorem,
make A everywhere defined and bounded. Hence Λ has countably infinitely
many distinct members. Since the PVM is supported on the countable set Λ,
prove its eigenspaces are total; this discharges the total-eigenbasis
hypothesis used by UO-C05, without assuming that hypothesis from a label.

For a real Borel h, prove `σ_p(h(A))=h(Λ)` and
`σ(h(A))=closure(h(Λ))`, with zero residual spectrum. If z is a finite
accumulation point of h(Λ), then z is in the point spectrum exactly when
`z∈h(Λ)`; otherwise it is in the continuous spectrum. State this using
the full moment domain and the coordinate eigenspace PVM, so repeated
values and multiplicities are retained. To realize spectrum ℝ, enumerate the distinct
eigenvalues `λ_n` and the rationals `q_n`, define the real Borel symbol
`g(λ_n)=q_n` and g=0 off Λ, and prove
`σ(g(A))=ℝ`, `σ_p(g(A))=ℚ`, `σ_c(g(A))=ℝ\ℚ`, `σ_r(g(A))=∅`.
This is the real-symbol instance of C05's closure-of-image construction;
it does not require a countable image to equal all of ℝ.

The eigenvalue-image identity `σ_p(h(A))=h(Λ)` holds, but h(A) can have eigenvectors that are not eigenvectors of A. On `ℓ²(ℕ₊)` let A be the maximal diagonal `Ae_n=ne_n` and take h=0; the separability, unboundedness and `σ(A)=σ_p(A)` premises hold, while e₁+e₂ is an h(A)-eigenvector and is not an A-eigenvector. Prove the precise eigenspace identity `ker(h(A)−z)=⊕̂_(λ∈Λ,h(λ)=z)ker(A−λ)` by A04’s level projection and total pure-point support. Thus fibers can merge and create new eigenvectors while `σ_p(h(A))=h(Λ)` stays correct. Use countable PVM support to justify the strong singleton-projection sum I; the raw span of eigenspaces must be replaced by its closure.

### Deficiency labels and the rank-one conjugation conclusion

Use the adopted convention `N₊=ker(A*−i)`, `N₋=ker(A*+i)`, with
extension action `A_U(x+x₊+Ux₊)=Ax+i x₊−i Ux₊` for
`U:N₊→N₋`. These N-labels fix all deficiency computations and extension formulas.
For the clamped second derivative prove
`dom A*=H²(0,1)` and `A*φ=−φ″` as in UO-D04; with `ξ=A*φ` the
relation is `φ″=−ξ`.

Suppose the closed symmetric A has indices `(1,1)`
and the conjugation J preserves dom A and commutes with A. Prove every
self-adjoint extension A_U commutes with this fixed J, including domain
invariance. Choose a unit e∈N₊ and put f=Je∈N₋, so Jf=e. Every
unitary has `Ue=exp(iθ)f`; compute `JU=U*J` on N₊ and `UJ=JU*`
on N₋. Insert these identities into the domain/action formula above,
using J's antilinearity, to prove `J(dom A_U)=dom A_U` and
`JA_U=A_UJ`. This universal rank-one conclusion goes beyond
the generic UO-D03 characterization of J-invariant extensions.

**Extension groups and analytic vectors.** For the extension decomposition use a closed densely defined symmetric A; for a merely symmetric operator first use its graph closure. Prove that no self-adjoint extension group preserves D(A) for every t when A has nonzero deficiency. Under the contrary invariance, choose nonzero φ∈N₋ and ψ∈D(A) with nonzero pairing; Stone differentiability and the adjoint identity give `h′(t)=−h(t)` for `h(t)=⟨φ,exp(itA_U)ψ⟩`, contradicting its unitary bound as t→−∞.

If x∈D(A²) and `0≠y∈N₊`, prove `x+y+Uy∉D(A_U²)`: its action has deficiency components iy and −iUy, whereas the extension graph requires `U(iy)=iUy`. So the action does not lie in D(A_U). The inclusion is `C∞(A)⊆D(A²)`, and it is strict: for the maximal self-adjoint diagonal `Ae_n=ne_n` on ℓ²(ℕ₊), `x_n=1/n³` lies in D(A²) but not D(A³). An A-analytic base vector is a special case of the stated D(A²) premise; the added vector therefore fails smoothness and analyticity for A_U.

For chosen dense analytic sets D_i of the factors, use E03's already specified invariant hull `span{A_i^n x:n≥0,x∈D_i}` and smaller-radius estimates. Their direct-sum/tensor spans give a dense analytic family, which need not contain every analytic vector: take the total zero operators on infinite-dimensional H_i and choose D_i to be finite-support vectors. Density in dom(A_i), or in the tensor-sum domain, for the ambient Hilbert norm holds. A graph-norm conclusion needs F01/F02's separate core proof and does not follow just by repeating elementary-tensor norm approximation. Agreement with a diagonal extension on a dense domain does not give essential self-adjointness; the closures are F02's joint-moment closures.

### Bounded commutants and analytic vectors

Let A be symmetric and B bounded, commuting in the bounded-commutant sense
`B(dom A)⊆dom A` and `A(Bx)=B(Ax)` for every `x∈dom A`.
The analytic-vector conclusions below do not require B self-adjoint.
Define the natural product on `dom(AB)={x∈H:Bx∈dom A}` and the sum on
`dom(A+B)=dom A`. Under these assumptions, commutation is an equality of
actions on dom A; it is not asserted to be equality of these partial
operators on identical domains.

Prove by induction that B preserves every `dom Aⁿ`, commutes with Aⁿ
there, and preserves `D∞=⋂ₙdom Aⁿ`. On D∞ prove
`(AB)ⁿx=BⁿAⁿx` and
`(A+B)ⁿx=Σ_(j=0)^n binom(n,j) B^(n−j)A^j x`, including the required
iterated-domain inclusions. For `t>0`, if
`M_t=Σ_(n≥0) tⁿ‖Aⁿx‖/n!<∞` and `b=‖B‖`, take
`s=t/max(1,b)>0`. Prove
`Σ sⁿ‖(AB)ⁿx‖/n!≤M_t` and
`Σ sⁿ‖(A+B)ⁿx‖/n!≤exp(sb) Σ s^j‖A^j x‖/j!≤exp(sb)M_t`.
The latter estimate follows from the binomial expansion and the
nonnegative double series, with its reindexing justified. Thus every
A-analytic vector is analytic for AB and A+B. Handle B=0 directly or
with this positive denominator; do not divide by `‖B‖` at0.

Prove
`dom((A+B)ⁿ)=dom(Aⁿ)` for every natural n under these same bounded
commutant hypotheses, and hence `C∞(A+B)=C∞(A)`. Prove the iterated
domain equality by induction, using the binomial expression and the fact
that all its lower-order terms already lie in dom A; equivalently reverse
the comparison with `A=(A+B)−B`, since B preserves dom A and commutes
with A+B there. B need not be self-adjoint for this algebraic domain
equality.

The equality `C∞(A)=C∞(AB)` fails under this bounded-commutant
hypothesis. On `ℓ²(ℕ_{≥1})` let A be the maximal
self-adjoint diagonal with eigenvalues n and let B=0. Then B preserves
dom A and commutes there, but the natural AB is the everywhere-defined
zero operator, so `C∞(AB)=H`, whereas `C∞(A)≠H` (the sequence `1/n`
is in H and not even in dom A). If `AB=BA` is read instead as equality of partial operators including their
natural domains, then this B=0 example fails that hypothesis for unbounded
A, since `dom AB=H` and `dom BA=dom A`; the counterexample concerns the
bounded-commutant hypothesis only.


### Invariant position domains and the dilation generator

Consume UO-E01's theorem: if A is self-adjoint, a dense linear
`D⊆dom A` invariant under every `exp(itA)` is an operator graph core, so
A restricted to D is essentially self-adjoint. On
`Qψ(x)=xψ(x)`, `dom Q={ψ∈L²(ℝ):xψ∈L²(ℝ)}`, take the actual subspaces
`D₁=C_c∞(ℝ)` and `D₂=Schwartz(ℝ)`. Prove both are dense in L², contained
properly in dom Q and invariant under `exp(itQ)ψ(x)=exp(itx)ψ(x)` for
every real t. Prove D₁ and D₂ are distinct: a Gaussian belongs to D₂ but
not D₁. The indicator of [0,1] belongs to dom Q but has no smooth
representative, so each inclusion is proper. Prove the needed multiplier
smoothness/Schwartz estimates, then apply that theorem to obtain both graph cores.

For the dilation group, choose the continuous **positive** amplitude `h(x,t)=exp(t/2)` and
set `U_tψ(x)=exp(t/2)ψ(exp(t)x)`. Prove its unitary norm identity by change
of variables, identity/inverse/group laws and strong continuity, first on
compactly supported test functions and then by density. Unitarity fixes the
modulus exp(t/2); positivity fixes this chosen amplitude. Do not assert that
unitarity determines every continuous complex amplitude: constant phases
`exp(ict)` already give further group choices.

Define the unitary logarithmic-coordinate map
`V:L²(ℝ,dx)→L²(ℝ,dy)⊕L²(ℝ,dy)` by
`(V_±ψ)(y)=exp(y/2)ψ(±exp(y))`, with the positive and negative half-lines
as separate summands and the point0 discarded only as a null set. Prove V
is onto and intertwines U_t with simultaneous translations `v_±(y+t)`.
In the positive Stone convention, its self-adjoint generator is
`A=V⁻¹((−i∂_y)⊕(−i∂_y))V`, on the exact maximal domain
`V⁻¹(H¹(ℝ)⊕H¹(ℝ))`. On `C_c∞(ℝ\{0})` differentiate to obtain
`Aψ=−i(xψ′+ψ/2)`. Prove this test domain is dense, symmetric for that
expression, and an operator graph core by its exact logarithmic image
`C_c∞(ℝ)⊕C_c∞(ℝ)`. No endpoint-gluing condition is imposed at0.
Use the translation/momentum comparison to prove A is unbounded,
`σ(A)=σ_c(A)=ℝ` and `σ_p(A)=σ_r(A)=∅`. The Sobolev/weak-derivative comparison is supplied by PDE A1–A3
(§§1.1–1.3), with the actual native Fourier/Bessel carriers as inputs.

### A differential operator and mixed spectral calculus

The example is an unbounded self-adjoint differential operator that is
not a multiplication operator in its given representation, with its spectrum,
diagonalization, spectral resolution and one-parameter unitary group, together
with a Borel f with `σ_p(f(A))=ℤ_+` and `σ_c(f(A))=(−∞,0]`.

Choose the full-line momentum operator on `L²(ℝ,dx)` in the position
representation, `P=(h/(2πi))d/dx` in units `h=2π`, so `ℏ=1` and
`P=−i d/dx`. Prove its maximal operator domain is PDE A1's (§1.1)
weak-derivative Sobolev space `H¹(ℝ)`, identified with the native Bessel-potential carrier by PDE A3 (§1.3), and its action is the weak
derivative multiplied by−i. Use PDE's weak-derivative/Fourier characterization,
UO-A07 and SAST's spectral/Stone interface to prove self-adjointness and
essential self-adjointness on Schwartz space and `C_c∞(ℝ)`. Prove that P is
not a multiplication operator in this position representation, for example
from its noncommutation with a smooth bounded nonconstant position multiplier
on `C_c∞`. No Fourier-diagonal operator is being excluded by this condition.

With the unitary Fourier transform `Fψ(ξ)=∫exp(−2πiξx)ψ(x)dx`, prove
`FPF⁻¹=M_(2πξ)` with equality of domains. Define the spectral-coordinate
unitary `Gψ(λ)=(2π)^(−1/2)Fψ(λ/(2π))` from `L²(dx)` to `L²(dλ)`;
prove `GPG⁻¹=M_λ`. Give
`P_P(B)=G⁻¹M_(1_B)G`, `E_P(t)=P_P((−∞,t])`,
`σ(P)=σ_c(P)=ℝ`, `σ_p(P)=σ_r(P)=∅`, and
`exp(itP)ψ(x)=ψ(x+t)`, in the standing positive Stone convention.
Physical
state probabilities and dynamics remain outgoing physical-model consumers, not
prerequisites for these generic operator proofs.

Fix `ℤ_+={1,2,3,…}` and define the real Borel symbol

```
f(λ)=λ                    if λ<0,
f(λ)=floor(λ)+1           if λ≥0.
```

Prove Borel measurability and identify the actual domain and action:
`dom f(P)={ψ:∫|f(λ)|²|Gψ(λ)|²dλ<∞}` and
`G(f(P)ψ)=f·Gψ`. The bound `|f(λ)−λ|≤1` also gives
`dom f(P)=dom P=H¹(ℝ)`; prove it using the bounded-difference domain comparison.
For each integer k≥1, prove
`ker(f(P)−k)=G⁻¹L²([k−1,k),dλ)` is nonzero (indeed infinite-dimensional).
Here the interval L² space is embedded in `L²(ℝ,dλ)` by extension by zero.
For every λ≤0 the level set of f at λ has Lebesgue measure zero, while every
neighborhood of λ has preimage of positive measure. Include λ=0: the level
set is empty, but negative values approach it. Thus prove
`σ_p(f(P))=ℤ_+`, `σ_c(f(P))=(−∞,0]`, `σ_r(f(P))=∅`, and
`σ(f(P))=(−∞,0]∪ℤ_+`. Prove the resolvent exists at every point outside
that closed set by its bounded reciprocal multiplier. Give the PVM
`P_(f(P))(B)=P_P(f⁻¹(B))`, its spectral family and its Stone group as the
Fourier multiplier `exp(itf)`. Explicitly distinguish this continuous-to-point
spectral collapse on positive-length intervals from a pure-point starting
operator: a Dirichlet-interval operator cannot meet this f requirement,
since the closure of its eigenvalue image ℤ_+ contains no negative half-line.
With 0 in `ℤ_+` the two requested spectral sets would intersect at0,
contradicting the disjoint point/continuous definitions; hence
`ℤ_+={1,2,3,…}`.

The independent Dirichlet-interval example: for `−d²/dx²` on
`H²(0,1)∩H₀¹(0,1)`, construct its normalized sine diagonalization, PVM,
spectral family, Stone group and full Borel calculus with actual domains.
This also consumes UO-E05's analytic sine span and graph-core calculation.
It remains a required example alongside the momentum witness.

**The cylinder domain and closure.** The condition xξ∈L² alone does not ensure ξ∈L²: ξ(x)=x^(−1/2)1_(0,1)(x) is a
counterexample. Take
`D₀=Span{φ(θ)ξ(x):φ∈C^∞(𝕋), ξ∈L²(ℝ), xξ∈L²(ℝ)}⊆L²(𝕋×ℝ)`.
Define `A₀ψ=ix∂θψ` on D₀; all following core and closure statements concern
this Hilbert-space operator. Use normalized circle measure and
Fourier modes `e^(inθ)`, `n∈ℤ`. The Fourier unitary sends A₀ to
`u_n(x)↦−nx u_n(x)`. Prove its closure is the self-adjoint
maximal multiplier with domain
`{u:Σ_(n∈ℤ)∫_ℝ n²x²|u_n(x)|² dx<∞}`. Finite Fourier sums with smooth
compactly supported x-coefficients lie in D₀ and are a graph
core. Construct its PVM by multiplication by `1_E(−nx)`, compute its spectrum
`ℝ`, and distinguish the zero eigenspace (the n=0 Fourier summand) from the
continuous spectrum `ℝ\{0}`; its residual spectrum is empty. In the convention
`U(t)=exp(it cl(A₀))`, prove `U(t)ψ(θ,x)=ψ(θ−tx,x)` and, for
`(Bψ)(θ,x)=e^(iθ)ψ(θ,x)`, prove `U(t)BU(−t)=e^(−itx)B`.


Compare the equivalent negative modes `E_n=e^(−inθ)/√(2π)` for Lebesgue dθ: their real multiplier is +nx. The adopted normalized-circle positive modes above instead use −nx, related by n↦−n and the measure-normalization unitary. Both give the same `θ−tx` group and conjugated B. The product Fourier/Hermite ONB is a Hilbert basis, not an A₀-eigenbasis, since Qφ_k is generally not a scalar multiple of φ_k. Keep graph-core/closure arguments separate from ambient ONB density.

The adjoint acts linearly on coefficients, `A*φ=Σ b_nk nE_nQφ_k` for `φ=Σ b_nk E_nφ_k` in the maximal Fourier-fiber moment domain; conjugated coefficients would make it antilinear, giving −iE₁Qφ₀ instead of +iE₁Qφ₀ for φ=iE₁φ₀ with Qφ₀≠0; any displayed triple quadratic coefficient sum must be justified as a form/graph limit, without unrestricted rearrangement. Bounded multiplication B is not unitarily conjugate to the unbounded integer diagonal.
**Prescribed domain versus maximal diagonal closure.** For every
sequence in the table's hypotheses put
`M_λ x=(λ_n x_n)` on `D_max={x∈ℓ²:Σ|λ_n x_n|²<∞}`. Prove M_λ is closed,
densely defined and normal, with adjoint the conjugate multiplier. The growth
bound gives `D₃⊆D_max`; finite-support sequences lie in D₃ and approximate every
x∈D_max in graph norm. Hence `cl(A)=M_λ`. Select indices n_j→∞ for a subsequence
λ_(n_j)→i, and set `x_(n_j)=n_j^(−3)`, with other coordinates zero. Then
x,M_λx∈ℓ² but `Σ n⁶|x_n|²=∞`; its finite truncations are in D₃ and converge
in graph norm. This proves the stated A cannot satisfy A=Ā. With
`Λ={λ_n:n≥1}`, compute for the meaningful closed comparison
`σ(M_λ)=cl(Λ)=Λ∪{i,−i}`, `σ_p(M_λ)=Λ`,
`σ_c(M_λ)={i,−i}\Λ`, and `σ_r(M_λ)=∅`. Allow either accumulation point to
also occur as an actual eigenvalue. Construct the coordinate PVM and prove the
resolvent formula on the complement of cl(Λ), including its range in D_max;
do not infer these closed-normal conclusions from the incompatible assumption
on the original restricted domain.

**Rational point spectrum and irrational continuous spectrum.**
Adopt a bijective enumeration `q:ℕ≃ℚ` and regard each q_n as real. On
`ℓ²(ℕ;ℂ)` define `A_q x=(q_n x_n)` with its maximal domain
`D_q={x:Σ_n |q_n|²|x_n|²<∞}`. Prove this is densely defined, closed and
self-adjoint, and that the finite-support vectors form an operator graph core.
Construct its normalized coordinate PVM
`P(B)x=(1_B(q_n)x_n)_n` and its spectral family. Prove
`σ(A_q)=ℝ`, `σ_p(A_q)=ℚ`, `σ_c(A_q)=ℝ\ℚ`, `σ_r(A_q)=∅`,
and `ker(A_q−q_n)=ℂe_n`. For an irrational λ, rational approximations give
normalized coordinate approximate eigenvectors; the kernel is zero and the
range is dense but not surjective. Outside ℝ give the reciprocal diagonal
resolvent and prove its range lies in D_q. The spectrum is the closure of
this dense rational eigenvalue set; a total eigenbasis does not imply that
the spectral set has no continuous-spectrum points. This is a self-adjoint realization of the request.

### Introductory domain examples and adjoint rules

On `L²(0,1)`, let L₁ be the complex polynomial span and L₂ the finite span of `exp(inx)`, n∈ℤ. Prove both dense: use native `polynomialFunctions.topologicalClosure` on `[0,1]` for real and imaginary parts and `ContinuousMap.toLp_denseRange` with finite Lebesgue measure. For L₂ extend an orthogonal vector by zero to a period-2π circle and use native `fourierBasis` with normalized Haar measure `dx/(2π)`; prove the interval/circle norm and Fourier-coefficient comparison. The integer exponentials restricted to `(0,1)` are not an orthogonal family. Prove `L₁∩L₂=ℂ1`; the intersection is not `{0}`. An elementary proof first upgrades a.e. equality of the continuous representatives, then differentiates the polynomial/trigonometric identity and applies `∏_(n≠0 in the finite frequency set)(∂−in)`; this annihilates its exponential derivative and has nonzero constant term, so its action on a nonzero polynomial derivative has nonzero leading coefficient. Thus the polynomial is constant. Prove finite integer exponentials linearly independent on the interval by differentiating at an interior point and using the Vandermonde determinant at their distinct frequencies. Define A as differentiation on L₁ and define B on all of L₂ by `B(exp(inx))=n²exp(inx)`. Compute `D(A+B)=ℂ1`, `(A+B)|_(ℂ1)=0`, and `D(AB)=ker B=ℂ1`, `AB=0` there: a finite trigonometric B-image that is a polynomial must be constant, and that B-image has zero constant Fourier coefficient. These sums and compositions are not densely defined. The general warning about two dense linear subspaces with zero intersection remains true: `C_c∞(0,1)` and L₁ provide such a pair, since a polynomial vanishing on a nonempty boundary interval is zero.

For scalar multiples, sums and products consume H6's actual partial-operator domains and the native Hilbert adjoint. Prove `(λA)*=conj(λ)A*` with equality of domains for densely defined A and λ≠0. When λ=0, native `LinearPMap.smul_domain` retains D(A); its adjoint is the total zero operator, whereas `0•A*` retains D(A*). For the self-adjoint diagonal `Ae_n=ne_n` on its maximal domain in `ℓ²({1,2,…})`, `x_n=1/n` witnesses D(A)≠H, so the partial-operator equality `(λA)*=conj(λ)A*` fails at λ=0. For densely defined A and B, prove `(A+B)*` extends `A*+B*` when D(A)∩D(B) is dense, and `(BA)*` extends `A*B*` when D(BA) is dense, using their actual natural domains. Do not use the native adjoint's default zero action for nondense operators as the Hilbert adjoint pairing theorem. The bounded perturbation identity `(A+λI)*=A*+conj(λ)I` holds on the correct domains for every λ. For closed densely defined A prove it is bounded on its domain iff A* is bounded on its domain; closedness makes the bounded extensions total and yields the usual equal norms. The symmetry identity uses A on both sides, and `(closure A)*=A*` for closable A. The closed normal criterion remains UO-B01's existing theorem with equality of actual product domains.

### Square-root weighted shift and its closure

On the existing complex `ℓ²(ℕ)` carrier, let a₀ act on finite-support sequences by `(a₀x)_n=√(n+1)x_(n+1)`. Prove this domain is dense and invariant and a₀ is unbounded using `a₀e_n=√n e_(n−1)` for n≥1 and `a₀e_0=0`. Using coordinate tests and H6's scalar adjoint, identify `a₀*` with the maximal forward shift `(a†x)_0=0`, `(a†x)_n=√n x_(n−1)` for n≥1, with domain `D_+={x:Σ_n(n+1)|x_n|²<∞}`. Prove a₀ is closable and its closure a is the maximal backward shift with domain `D_-={x:Σ_n n|x_n|²<∞}`. Finite truncations converge in each graph norm, giving the actual closures and mutual adjoints. The equality `D_-=D_+` holds because these weighted sums differ by `‖x‖²`; domain equality does not mean action equality or normality.

Prove the two products have the same domain `D(N)={x:Σ_n n²|x_n|²<∞}` and actions `a†a=N`, `aa†=N+I`. Thus a is not normal, already witnessed by `ae_0=0` and `a†e_0=e_1`. Distinguish this from a₀, which is not even closed: finite truncations of `x_n=(n+1)^(−3/2)` converge in its graph norm to an infinite-support vector. This is the generic sequence-space example consumed by a physical-model roadmap's one-mode Hermite-coordinate comparison, not a second physical oscillator or Fock carrier.

### Spectrum, adjoint and cyclic-decomposition comparisons

The spectrum depends on the domain, as V10.ClosedOperators' existing derivative examples show on `L²(0,1)`: the expression `Tf=f′` on H¹ with zero left trace has spectrum∅, the unrestricted H¹ domain has spectrumℂ, and periodic H¹ has spectrum `2πiℤ`. These are closed operators with different actual domains. Consume that existing example rather than introducing a duplicate extension classification. A bounded inverse in the closure convention means an inverse identity on D(A) whose closure is the total I; SAST's native resolvent uses its actual domain/range identities. For the Neumann-series expansion of the resolvent about z₀, factor the bounded series as `R(z₀)(I+(z−z₀)R(z₀))⁻¹` before composing with zI−A, so its image lies in D(A). The left inverse identity holds on H and the right one on D(A). The zero Hilbert space has every parameter in its resolvent and needs no division by a zero inverse norm.

The self-adjointness criterion needs both kernels `ker(A*∓i)` to vanish, equivalently both ranges `ran(A±i)` to be all of H; one of the two does not suffice (§4.3). In the reverse inclusion `dom A*⊆dom A` for symmetric A with `ran(A+λ)=ran(A+conj λ)=H`, choose for φ∈dom A* a vector η∈dom A with `(A+conj λ)η=(A*+conj λ)φ`; then `(A*+conj λ)(φ−η)=0`, so `φ−η` is orthogonal to `ran(A+λ)` and is zero. The two shifts used are conjugate to each other. Layer 3's closed-adjoint comparison already supplies conjugate resolvent/spectrum equality. Prove `{conj λ : λ∈σ_p(A)}⊆σ_p(A*)∪σ_r(A*)` from `(ran(A*−conj λ))⊥=ker(A−λ)`, using `A**=A`: a nonzero A-eigenvector makes that adjoint range nondense, so the conjugate parameter is in the adjoint point or residual spectrum. For closed densely defined A, prove the stronger continuous-spectrum equality `σ_c(A*)=conj(σ_c(A))`: injectivity and dense range pass to the opposite adjoint kernels, and an adjoint resolvent point would contradict the existing full-spectrum comparison.

The diagonalization `U*AU=D` gives `f(A)=U f(D) U*`, not `U*f(D)U`. Native finite-dimensional symmetric diagonalization and the existing continuous calculus supply the true theorem. For a self-adjoint A, unit expectations need not tend to +‖A‖ and +‖A‖ need not lie in σ(A): A=−I on nonzero H. The correct self-adjoint norm formula is `max_(λ∈σ(A))|λ|=‖A‖`; at least one of±‖A‖ occurs, and positivity gives the positive endpoint. Consume native CFC isometry for the polynomial norm theorem; its application to the positive operator p(A)*p(A) remains valid.

For cyclic decompositions, consume SAST SA-B85's orthogonal cyclic reducing decomposition of a self-adjoint operator, arbitrary indexing for arbitrary H, and its countable/summably weighted one-finite-measure model for separable H. Its proof needs invariance of the orthogonal complement. Self-adjointness cannot be dropped for ordinary polynomial-cyclic summands. On ℂ⁴ set `T(x₁,x₂,x₃,x₄)=(x₂+x₄,x₃,0,0)`. Prove `T³=0`, `T²≠0` and `ker T∩ker T*=0`. Every polynomial orbit has dimension≤3. An orthogonal invariant cyclic decomposition must have a summand of dimension≥3 because T²≠0; it cannot have a four-dimensional cyclic summand, so the remaining one-dimensional reducing summand would lie in both kernels, a contradiction. Keep this distinct from the existing general star-cyclic representation decomposition, which uses a different cyclicity notion. Prove the Gaussian is cyclic for bounded Q on[-1,1] using its bounded continuous reciprocal and polynomial density; this is not the unbounded whole-line model. In the construction of the scalar spectral measures from positive functionals, positivity of the vector functional precedes use of a positive scalar measure: approximate the continuous square root of each nonnegative test function by polynomials. The whole complex dual represents complex measures, not only positive measures.

Further acceptance tests, rather than separate quantum-mechanics deliverables, are weighted shifts and their adjoints and non-normality; multiplication spectra and the harmonic oscillator; joint spectra and commuting groups; deficiency and boundary examples; analytic vectors; tensor sums; and the Weyl relations. The generic operator identities and tensor-sum criteria belong here; physical eigenfunctions, representation conventions, and probabilities belong to physical-model roadmaps outside this one.

## References

- Vaughan F. R. Jones, *Von Neumann Algebras*, 13 November 2015,
  [author's institutional copy](https://cdn.vanderbilt.edu/t2-my/my-prd/wp-content/uploads/sites/3392/2020/10/vonNeumann2015.pdf),
  §12.1, Exercises 12.1.11(ii), 12.1.15, pp.86–87; §12.2, Theorem 12.2.6.
- Edward Nelson, *Analytic Vectors*, Annals of Mathematics 70 (1959), 572–615,
  [DOI](https://doi.org/10.2307/1970331), §10, pp.604–606 for the common-core
  counterexample and Lemma 10.1; Lemma 5.1 (a symmetric operator with a dense set
  of analytic vectors is essentially self-adjoint) is the single-operator step of
  §5.3 and §6.4. The published text is paywalled and is cited by locator only.
- Moshé Flato, Jacques Simon, Henri Snellman and Daniel Sternheimer, *Simple facts
  about analytic vectors and integrability*, Annales scientifiques de l'École Normale
  Supérieure (4) 5 (1972), 423–434, [DOI](https://doi.org/10.24033/asens.1233),
  open at Numdam; introduction, p.424 (analytic vectors for a basis), Hypothesis (C), p.428, and
  Theorem 1, p.430 (integration of a Lie-algebra representation on a dense invariant
  domain of vectors analytic for each basis representative), used in §5.3.
- Jonathan Eckhardt, Fritz Gesztesy, Roger Nichols and Gerald Teschl,
  *Weyl–Titchmarsh Theory for Sturm–Liouville Operators With Distributional
  Potentials*, [arXiv:1208.4677v3](https://arxiv.org/abs/1208.4677v3),
  Hypothesis 2.1 and Theorem 2.2, §§3–6 and 11, and Theorem 12.1 with (12.8), p.54
  (Krein's extremal characterization of the Friedrichs extension, in a complex separable
  Hilbert space, used in §4.7). These are preprint locators; §4.8 takes the real s=0, r=w,
  p>0 specialization.
- Tosio Kato, *Perturbation Theory for Linear Operators*, Classics in Mathematics,
  Springer, 1995, [DOI](https://doi.org/10.1007/978-3-642-66282-9); Chapter II, §6
  (perturbation of symmetric operators in finite dimension, Rellich's theorem) and
  Chapter VII, §§1–3 (analytic families and the separation of the spectrum, holomorphic
  families of type (A), selfadjoint holomorphic families), used in §5.5. The text is
  paywalled and is cited by section only.
- Joachim Weidmann, *Spectral Theory of Ordinary Differential Operators*,
  Lecture Notes in Mathematics 1258 (1987),
  [DOI](https://doi.org/10.1007/BFb0077960), §§3–6.
- Gerald Teschl, *Mathematical Methods in Quantum Mechanics: With Applications
  to Schrödinger Operators*, Graduate Studies in Mathematics 99,
  [author’s authorized online edition](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf),
  version 12 February 2009; §1.2, p.42 (the standing assumption that Hilbert spaces are
  separable); §3.1, equation (3.14) and p.89 (spectral families),
  Theorem 2.13, pp.71–72 (closed-form representation). Further locators used
  above: Lemma 2.3, p.63, and Lemma 2.7, p.66 (range criteria); Lemma 2.10, p.68,
  and Theorem 2.12, p.70 (Friedrichs extension); Lemma 2.16, p.76, Theorem 2.18,
  Lemma 2.20, p.77, and Theorem 2.21, p.78 (spectrum of symmetric operators);
  Theorems 2.25–2.26, pp.81–82, Lemma 2.27 and Theorem 2.28, p.83 (Cayley
  transform, defect indices, conjugations); Problem 2.27, p.84; §3.1, (3.25)–(3.29)
  and Theorem 3.2, pp.91–92, Lemmas 3.3–3.5, pp.92–94, Theorem 3.7, p.96, Theorem 3.8
  and Corollary 3.9, p.97, Problems 3.10–3.11, p.99 (unbounded Borel calculus);
  (3.23), p.91; (3.67), Lemmas 3.11–3.12, p.101, Lemmas 3.14–3.15, pp.103–104, Theorems 3.17–3.18, (3.83) and
  Lemma 3.19, p.105 (spectral mapping and spectral types); Lemma 4.4, p.115, Lemma 4.5, p.116,
  (4.24)–(4.25), Lemma 4.9 and Problem 4.2, p.117 (commutation), Theorem 4.14, (4.43)–(4.44) and
  Problem 4.5, p.121 (tensor products); Theorem 5.2, p.124, Corollary 5.3, p.125, and (5.5),
  p.126 (Stone, invariant cores, commuting groups); Theorem 6.4, p.135, (6.27)–(6.28) and Lemma 6.17, p.145, Lemma 6.18 and Theorem 6.19, p.146,
  Lemmas 6.22–6.23, p.148, Theorem 6.31, p.154, Lemma 6.34, p.155 (perturbations,
  essential spectrum, resolvent convergence); §8.3, pp.178–179, with Theorem 8.5, p.179 (harmonic oscillator);
  (9.4)–(9.7) and Theorem 9.1, p.182, Lemma 9.4, p.184, Theorem 9.6, p.187, Theorem 9.9, p.191
  (Sturm–Liouville minimal/maximal operators, Green's formula and Weyl's alternative).
