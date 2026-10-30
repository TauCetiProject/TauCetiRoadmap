# Roadmap: von Neumann algebras, factors, and modular theory

**Summary.** Starting from Mathlib's concrete `VonNeumannAlgebra`, abstract `WStarAlgebra`,
C*-algebra functional calculus and GNS construction, build a reusable theory of von Neumann
algebras: operator topologies and the bicommutant and Kaplansky theorems (Layer 1), corners,
tensor products and abelian algebras (Layers 2–3), preduals and normality (Layer 4), projection
comparison and the trace on finite factors (Layer 5), standard form and semifinite factors
(Layer 6), Hilbert modules, coupling constant and index (Layer 7), group algebras and crossed
products (Layers 8–9), Tomita–Takesaki theory and KMS states (Layer 10), weights, Connes
invariants and continuous cores (Layer 11), two projections, ultraproducts, central sequences and
Jordan reconstruction (Layer 12), and the classification of injective factors (Layer 13). The end
theorems are the bicommutant theorem, existence and uniqueness of the trace on a II₁ factor,
the Tomita–Takesaki theorem, Connes's classification of type III factors by `S(M)`, Dye's
theorem, and the equivalence of injectivity with hyperfiniteness together with the uniqueness of
the injective factors of types II₁, II∞, IIIλ (0<λ<1), III₀ (via the flow of weights) and III₁.

## Scope and ownership

This roadmap owns the von Neumann algebra theory listed above: concrete and abstract algebras,
their operator topologies, normal representations, projections, traces, modules and index,
crossed products, modular theory, weights, central sequences, normal Jordan maps, the finite
Gleason frame-function theorem used by the scalar Mackey–Gleason–Bunce–Wright theorem, and the
injective classification, with all their intermediate constructions. Layer k is cited as `Vk`,
and a named target inside it as `Vk.Name`.

It leaves the following to the named owners and consumes them by section.

* [OperatorTheory](../OperatorTheory/README.md) owns general Hilbert geometry
  (OrthogonalGeometry); the bounded modulus and polar decomposition (PolarDecomposition
  PD-A36–A45 and PD-B23–B36); the bounded Borel calculus of normal operators, projection-valued
  measures, the PVM null filter, cyclic multiplication models, control measures, measurable
  multiplicity and the classification of representations of `C(K)` and `C₀(X)` (the
  Hahn–Hellinger theorem), and essentially bounded PVM symbols (SelfAdjointSpectralTheory
  SA-B05–B13, SA-B26–B30, SA-B49–B57, SA-B85–B86); resolvents, Cayley transforms and spectral
  measures of self-adjoint `LinearPMap` operators (SA-D14–D28, SA-E01–E02); the trace-class and
  Hilbert–Schmidt ideals (OperatorIdeals OI-B29–B41); and general principal angles. V2, V4 and
  V10 add what is about algebras or is not stated there: membership of Borel-calculus values and
  polar factors in the generated von Neumann algebra, the canonical trace functional with its
  cyclicity and the trace-class duality, the inverse Cayley correspondence, the multiplier-form
  unbounded spectral theorem, polar decomposition of closed unbounded operators, affiliation,
  antilinear extensions and modular consequences. The supply runs in one direction at the level
  of targets: SA-B85–B86 consume V4.0.Fields, which uses no projection-valued-measure,
  normal-operator or multiplicity input, and every target here that consumes SA-B85–B86 comes
  after V4.0.Fields.
* [OneParameterSemigroups](../../Completed/OneParameterSemigroups/README.md) owns C₀ semigroups, generators and
  resolvents. Stone's theorem is consumed from Tau Ceti. Modular automorphism groups and their
  KMS characterization belong here.
* [BanachSpaceTheory](../BanachSpaceTheory/README.md) owns annihilators, quotient duals, adjoints,
  Goldstine and weak/weak-star duality (B1), Eberlein–Šmulian, James and Krein–Šmulian (B2)
  and Banach tensor products (B4). The operator-topology adapters on
  `B(H)` (sequence boundedness, bounded joint continuity of products and matrix-coefficient
  criteria) are not in B1; V1 owns them.
* [RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md) owns
  Peter–Weyl, and RepresentationTheory/SemisimpleAlgebras the finite-dimensional
  double-centralizer theorem.
* [AmenableGroups](../AmenableGroups/README.md) owns invariant means and Følner theory (Layers
  5–7) and, in its Layer 7, the `L¹` convolution algebra of a locally compact Hausdorff group
  with its translation continuity, approximate-identity kernels and Haar pushforward formulas.
  [GlobalNumberFields](../GlobalNumberFields/README.md) Layer 4 owns the finite-adele carrier, and
  [OptimalTransport](../OptimalTransport/README.md) Layers 2 and 8.2 Jankov–von Neumann
  uniformization and the finite-measure completion theorem. The Hecke-ring convolution, its
  structure constants and its commutativity criterion are consumed from Tau Ceti; Hecke operators
  on modular forms remain the scope of [ModularForms](../ModularForms/README.md).
* [BanachAlgebras](../BanachAlgebras/README.md) and CStarAlgebras are consumers of this roadmap
  (BanachAlgebras A7 consumes V11's closed double-dual embedding; CStarAlgebras consumes V0–V4,
  V12.J and V13a), so nothing here is taken from either. The `L²` left-regular representation of
  a locally compact group is owned here (V8.RegularL2); the unitization/character-space
  comparison and the Fourier uniqueness theorem on `L¹` that V11 needs are owned in V11; the
  spatial C*-norm on the algebraic tensor product of two concrete C*-algebras is owned in
  V13b.SpatialNorm. Pure-state and irreducible-GNS theory, operator spaces and completely bounded
  maps, C*-tensor norms other than the spatial norm, and the C*-algebraic consequences of
  semidiscreteness are left to CStarAlgebras.

Compact ergodic-action classification beyond SU(2) and direct-finiteness questions in positive
characteristic are outside this roadmap.

## Conventions

Use Mathlib's [`VonNeumannAlgebra`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/VonNeumannAlgebra/Basic.html#VonNeumannAlgebra)
for concrete algebras on a complete complex Hilbert space H, `H →L[ℂ] H` for bounded
operators, `StarSubalgebra`, `Set.centralizer`, `IsStarProjection`, and
[`WStarAlgebra`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/VonNeumannAlgebra/Basic.html#WStarAlgebra)
for abstract algebras. Concrete algebras are unital on their acting Hilbert space. Corners
act on the complete range of their projection, with that projection as identity. The crossed
product `M ⋊_α G` of a von Neumann algebra by an action of a locally compact group is the regular
crossed product constructed in V8, the von Neumann algebra generated on `L²(G,μ;H)` by `π_α(M)`
and `λ(G)`; it is distinct from the algebraic (Brauer-group) crossed products of ring theory.
A representation is a unital complex star algebra homomorphism; normality
is an additional property with the equivalences in V4. Maps, inclusions, unitary intertwiners,
and opposite algebras must have composition, restriction, transport, extensionality, and
coercion APIs. The inner product is conjugate-linear in its first variable and linear in its
second; vector functionals are `ω_ξ(x)=⟪ξ,xξ⟫` and matrix coefficients are `⟪η,xξ⟫`.
For φ∈M_* pin its bimodule actions by `(aφb)(x)=φ(bxa)`; all centralizing-sequence,
bicentralizer and Q-stability equations use this convention.

Projection equivalence p ~ q means there exists v in the algebra with `v*v=p` and `vv*=q`.
Subequivalence p ≼ q permits `vv* ≤ q`. This agrees with the conventional initial-to-final
orientation: on `M₂(ℂ)` the matrix unit `e₂₁` has `e₂₁* e₂₁ = e₁₁` and `e₂₁ e₂₁* = e₂₂`, so it
implements `e₁₁ ~ e₂₂`, and `e₁₂` implements `e₂₂ ~ e₁₁`. Algebraic multiplication is
composition of operators, with rightmost operator acting first. The normalized trace of a finite
factor satisfies τ(1)=1; semifinite traces and dimensions take values in `ℝ≥0∞`. The tracial L²
norm is `sqrt (τ(x*x))`. Nonzero corner traces are normalized by dividing by τ(p). A factor has
center exactly the complex scalar multiples of its identity and a nonzero identity. Infinite
factors and nonzero modules are explicitly required where a zero case would invalidate a
classification statement. Include zero Hilbert spaces and zero algebras, and all cardinalities
unless a stated theorem requires separability or sigma-finiteness. Finite scalar controls in the
separably acting abelian classification do not impose a faithful normal state on an arbitrary
abelian algebra.

Topologies on operator spaces are separate wrappers, so their instances cannot accidentally
replace the norm topology. Weak and strong mean WOT and SOT; ultraweak means pairing with
trace class; ultrastrong is generated by square-summable vector families. Strong-star and
ultrastrong-star also require convergence of adjoints. Normality means preservation of
suprema of bounded increasing nets of positive elements. Countable sequential
hyperfiniteness and factor classification require separable predual. Weight theory,
standard forms, and injectivity versus semidiscreteness have no σ-finiteness
or separable-predual restriction; finite-dimensional CP approximations there
are nets. Continuous-core flow classification is for factors with separable
predual. Earlier algebraic and net-based theory has no separability restriction.

## Exact supplier contracts

**From Mathlib.** `VonNeumannAlgebra`, `VonNeumannAlgebra.commutant`,
`VonNeumannAlgebra.centralizer_centralizer` and `WStarAlgebra`
(`Mathlib/Analysis/VonNeumannAlgebra/Basic.lean`); `StarSubalgebra.centralizer` and
`Set.centralizer`; `ContinuousLinearMapWOT` with `ContinuousLinearMapWOT.ext_inner`,
`ContinuousLinearMapWOT.tendsto_iff_forall_inner_apply_tendsto` and `ContinuousLinearMapWOT.continuous_iff`
(`Mathlib/Analysis/InnerProductSpace/WeakOperatorTopology.lean`); the pointwise-convergence copy
`H →Lₚₜ[ℂ] H`, `PointwiseConvergenceCLM.tendsto_iff_forall_tendsto` and
`ContinuousLinearMap.toPointwiseConvergenceCLM`
(`Mathlib/Topology/Algebra/Module/Spaces/PointwiseConvergenceCLM.lean`); `banach_steinhaus`
(`Mathlib/Analysis/Normed/Operator/BanachSteinhaus.lean`); the geometric Hahn–Banach separation
theorems `geometric_hahn_banach_closed_point` and `geometric_hahn_banach_compact_closed` of a
locally convex real topological vector space (`Mathlib/Analysis/LocallyConvex/Separation.lean`),
applied in the weak and weak-star topologies, which are locally convex by
`WeakBilin.locallyConvexSpace` (`Mathlib/Analysis/LocallyConvex/WeakDual.lean`), and in the WOT
and SOT of `B(H)`, which are locally convex by `ContinuousLinearMapWOT.instLocallyConvexSpace`
(`Mathlib/Analysis/LocallyConvex/WeakOperatorTopology.lean`) and by the `LocallyConvexSpace`
instance of `H →Lₚₜ[ℂ] H` built from `UniformConvergenceCLM.locallyConvexSpace`
(`Mathlib/Analysis/LocallyConvex/PointwiseConvergence.lean` and `StrongTopology.lean`), with the
continuity of scalar multiplication on `H →Lₚₜ[ℂ] H` that the separation theorems also require
taken from `UniformConvergenceCLM.continuousSMul` on finite sets (`Set.Finite.isVonNBounded`,
then `IsScalarTower.continuousSMul` for real scalars), since the pin states it as a theorem and
not as an instance; the commutative Gelfand duality
`gelfandStarTransform`, `gelfandTransform_isometry` and `gelfandTransform_bijective` under
`CommCStarAlgebra` (`Mathlib/Analysis/CStarAlgebra/GelfandDuality.lean`) and the compactness of
`characterSpace ℂ A` for a unital normed algebra (`Mathlib/Analysis/Normed/Algebra/Basic.lean`);
`Unitization.starLift` and `Unitization.fstHom`; the joint continuity
`MeasureTheory.Lp.instContinuousSMulDomMulAct` of the domain action on `Lp E p μ`, `1 ≤ p < ∞`,
of a monoid acting continuously by measure-preserving maps on a space with a locally finite
measure that is inner regular on finite-measure sets
(`Mathlib/MeasureTheory/Function/LpSpace/DomAct/Continuous.lean`), applied to a locally compact
group acting on itself with a regular left Haar measure; the C*-algebra classes, continuous
functional calculus and positive-operator order on `H →L[ℂ] H`; `PositiveLinearMap`,
`PositiveLinearMap.exists_norm_apply_le`, `PositiveLinearMap.GNS`, `gnsStarAlgHom` and
`gnsNonUnitalStarAlgHom` (`Mathlib/Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`);
`LinearMap.dualEmbedding_surjective`, `LinearMap.rightDualEquiv`, the RCLike `SeparatingDual`
instance and `SeparatingDual.eq_zero_of_forall_dual_eq_zero`; Banach–Alaoglu and
`Analysis/Convex/KreinMilman`; `lp` with `lp.instInnerProductSpace`; `SymAlg` and `IsCommJordan`;
`IsSimpleRing`; `CompletelyPositiveMap`, with its underlying complex linear map and positivity
of all finite `CStarMatrix` amplifications (`Mathlib/Analysis/CStarAlgebra/CompletelyPositiveMap.lean`);
`ErgodicSMul`, Haar measure and `PontryaginDual`; the Riesz–Markov–Kakutani
measure `RealRMK.rieszMeasure` with `RealRMK.integral_rieszMeasure`
(`Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean`) and `essSup`; the partial-map
adjoint `LinearPMap.adjoint`, `LinearPMap.adjoint_isClosed` and `LinearPMap.isSelfAdjoint_def`
(`Mathlib/Analysis/InnerProductSpace/LinearPMap.lean`). Each is used as stated at the
pin; none of them includes separability, a chosen faithful state or a nonzero identity.

**From Tau Ceti.** The Stone theorem in `TauCeti.Analysis.Semigroups.Group.Stone.Unbounded`;
the measurability lemmas `ContinuousOn.aestronglyMeasurable_of_measure_ne_top` and
`AEFinStronglyMeasurable.aestronglyMeasurable_smul`
(`TauCeti/MeasureTheory/Function/StronglyMeasurable/InnerRegular.lean`);
`ContRepresentation.integratedOperatorL1`
(`TauCeti/RepresentationTheory/Continuous/Integrated/Basic.lean`); the Pontryagin-dual
modules `TauCeti/Analysis/Fourier/Pontryagin/{DualEval,Continuity,Measure,Uniqueness,StronglyContinuous}`,
in particular the cyclic spectral theorem
`ContRepresentation.exists_pontryaginMeasureTransform_eq_inner` (a diagonal matrix coefficient
`g↦⟪ξ,π(g)ξ⟫` of a strongly continuous unitary representation of a locally compact abelian group
is the Fourier–Stieltjes transform of a finite inner regular measure on the Pontryagin dual) and
the uniqueness theorem
`MeasureTheory.FiniteMeasure.ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular`, with
the subalgebra extension theorem
`TauCeti.MeasureTheory.ext_of_forall_mem_subalgebra_integral_eq_of_innerRegular`
(`TauCeti/MeasureTheory/Measure/FiniteMeasureExt.lean`) behind it; and the Hecke-ring
convolution: the ring structure on `𝕋 Δ H R` with `HeckeCosetModule.single_mul_single`
(`TauCeti/NumberTheory/HeckeRing/Multiplication.lean`), the structure constants
`DoubleCoset.multiplicity` (`TauCeti/NumberTheory/HeckeRing/Multiplicity/Basic.lean`), and
`HeckeAntiInvolution`, `HeckeAntiInvolution.ofAmbient` and
`HeckeCosetModule.mul_comm_of_antiInvolution` (`TauCeti/NumberTheory/HeckeRing/Commutativity.lean`).
Each is used as stated at the pin.

**From TauCetiRoadmap.BanachSpaceTheory.** [B1](../BanachSpaceTheory/README.md#b1-duality-and-weak-topologies)
annihilators, quotient duals, adjoints and Goldstine, the weak/norm closure agreement for convex
sets, and the weak and weak-star continuity criteria by evaluation;
[B2](../BanachSpaceTheory/README.md#b2-weak-compactness-and-reflexivity) Krein–Šmulian and
James; [B4](../BanachSpaceTheory/README.md#b4-approximation-and-banach-tensor-products) the
quotient-norm nuclear operators with their nuclear norm, rank-one norm and series
representation, and the compact Schmidt series with its nuclear-norm identity on Hilbert pairs,
together with B4's isometric identification of the Hilbert nuclear operators with the
trace-class ideal of OperatorIdeals OI-B29–B30.

**From TauCetiRoadmap.OperatorTheory.** From
[PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md) Part A, the bounded
modulus `|x|=√(x†x)` of a bounded operator between complete complex Hilbert spaces with its
positivity, square, pointwise norm, kernel and norm laws (PD-A36–A45), and from Part B the
canonical polar partial isometry v with initial space the closure of `range |x|`, equal to
`(ker x)⊥`, final space the closure of `range x`, `v|x|=x`, the initial and final projection
formulas, the polar factor of `x†` equal to `v†`, and uniqueness among maps that vanish off the
initial space (PD-B23–B36). From
[SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md) Part B, for a
normal bounded operator a on an arbitrary complex Hilbert space: the Borel calculus
`borelCalculus a` with its agreement with the continuous calculus, star-homomorphism laws,
norm bound and almost-everywhere invariance (SA-B05–B13); its indicator spectral projections
(SA-B26–B30); the PVM null filter (SA-B49); the vector identity `‖f(a)ξ‖²=∫|f|²dμ_ξ` (SA-B52);
strong convergence under uniformly bounded pointwise convergent sequences of symbols (SA-B53);
the spectral commutant equality, that an operator commutes with a iff it commutes with every
bounded Borel integral (SA-B57); the cyclic multiplication models for unital representations of
`C(K)`, K compact metrizable, on arbitrary H, with, for separable H, the weighted finite control
μ satisfying `μ(B)=0 ↔ P(B)=0`, the measurable multiplicity, the classification of
representations of the same `C(K)` and of nondegenerate representations of `C₀(X)`, X
second-countable locally compact Hausdorff, by control class and multiplicity, and the
specialization to normal operators (SA-B85); and the essentially bounded symbol quotient with
norm the P-essential supremum and its comparison with Mathlib's `L∞` of a control measure
(SA-B86). From its Parts D and E, for a self-adjoint partial operator T on a complex Hilbert space:
the off-real lower bound, bijectivity of `T−z` onto H and `‖(T−z)⁻¹‖≤|Im z|⁻¹` for `Im z≠0`
(SA-D14–D19), the Cayley transform `U=(T−i)(T+i)⁻¹` with its unitarity and normality
(SA-D24–D28), and the spectral PVM obtained from the Cayley PVM, which gives no mass to the
point 1 (SA-E01–E02). From [OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md), the
nuclear gauge `ν(x)=∑ₙ aₙ(x)` and the trace-class ideal family (OI-B29–B31, OI-B23), and the
Hilbert–Schmidt energy, its basis independence, the Hilbert–Schmidt norm with its operator-norm
domination, adjoint invariance and ideal inequality, and the Hilbert–Schmidt family
(OI-B32–B41). Each is assumed for arbitrary complex Hilbert spaces, with separability only where
SA-B85–B86 state it.

**From TauCetiRoadmap.AmenableGroups.** [Layers 5–7](../AmenableGroups/README.md#layer-5-følner-criteria-for-arbitrary-discrete-groups)
invariant means, discrete Følner theory and abelian amenability, and from
[Layer 7](../AmenableGroups/README.md#layer-7-locally-compact-hausdorff-groups-and-haar-l), for an
arbitrary locally compact Hausdorff group with a regular left Haar measure μ: the Haar pushforward
and inversion formulas with the modular character, the `L¹` convolution
`(h*k)(x)=∫ h(y)k(y⁻¹x) dμ(y)` with its associativity and norm bounds, `L¹` continuity of
translations, and the nonnegative integral-one kernels `h_U` supported in shrinking identity
neighbourhoods U with `‖h*h_U−h‖₁→0` for every `h∈L¹` (a net built from compactly supported
continuous functions).

**From the other roadmaps named in the scope.** RepresentationTheory/CompactGroups (Peter–Weyl),
RepresentationTheory/SemisimpleAlgebras (finite double centralizer),
RepresentationTheory/LieHighestWeight (the rank-one Clebsch–Gordan decomposition for the SU(2)
application of V8), GlobalNumberFields Layer 4 (finite adeles), OptimalTransport Layers 2 and
8.2, and ArithmeticDirichletSeries Layer 9 (the implemented Wiener–Ikehara theorem used by
V10.AffineAP).

## How to read the build

Layers are built in the order V0–V13, with the following finer milestone order. V0 supplies
abstract C*-algebra states and GNS; V1 the operator topologies, bicommutant and Kaplansky
theorems; V2 corners, tensor products and the elementary abelian carriers; V3 type I algebras.
In V4, V4.Core precedes V4.PositivePredual, which precedes V4.Normality, and the other
normality/representation conclusions consume that one criterion. V4.0.Fields constructs
Hilbert and operator fields from countable fundamental sections and given measures,
independently of projection-valued measures, multiplication models and central decomposition.
In V8, V8.RegularL2 precedes
V8.LCHRegularNormalBridge and the compact-action and dense-translation targets. In V11 the
harmonic-analysis layer is built as V11.DoubleDualEmbedding, then V11.UnitizationCharacters and
V11.FourierUniqueness, then inversion, Plancherel and duality. V13b.SpatialNorm opens V13b.
V2.AbelianClassification and V2.AbelianRepresentationMultiplicity are applications after Fields
and SelfAdjointSpectralTheory SA-B85–B86, with V4.Normality when a normal representation is used;
only the elementary V2 carriers, the single-generator construction and the given-measure
multiplication/MASA theorem precede Fields. V4.0.Decomposition consumes Fields, V4.Normality and
SA-B85 and owns spectral/central reduction and measurable selection; V5's measurable
trivialization and the central-reduction applications consume Decomposition. V5 delivers
projection comparison and the trace of finite factors, V6 the standard form and semifinite
classification, V7 modules and index, V8–V9 group algebras, crossed products and discrete series.
In V10, ClosedOperators precedes Affiliation; TracialLp also consumes V6; ModularTheory
constructs the Tomita–Takesaki/natural-cone theory after Affiliation, V0/V1/V6, V2's infinite
tensor product, V4.Core/PositivePredual/Normality and V8's nonsingular crossed products; KMS
fixes the strip convention before Hecke uses it. AffineAP applies the implemented generic
Wiener–Ikehara, higher-prime-power and Abel-transfer APIs; AffineHecke constructs the
finite-adele corner from Hecke, GlobalNumberFields Layer 4 and V8; AffineType consumes that
model, AffineAP, KMS and V2/V6's full-corner comparison. These affine constructions have no V11
input. V11 consumes the completed V10 interfaces. In V12, V12.J.Maps precedes Dye, Enriched and
CentralSplitting, and V12.J.Frame precedes V12.J.Scalar; standard-form implementations
additionally consume V11. V13a (tensor-independent CP extension) precedes V13b
(semidiscreteness and classification).

## Layer 0: C*-algebra and state prerequisites

Consume Mathlib's complex CStarAlgebra, star algebra homomorphism, order and continuous
functional calculus APIs, including positivity, positive-square-root uniqueness,
positive/negative parts, spectral permanence, automatic contractivity/isometry of star
homomorphisms, positive-functional Cauchy–Schwarz and norm at one, and approximate units.
Use the native `PositiveLinearMap` carrier for complex positive functionals.
Consume `PositiveLinearMap.exists_norm_apply_le` and its
`ContinuousLinearMapClass` instance to identify them with positive elements of
the continuous dual. Define the shared state space by operator norm one; for
unital algebras prove equivalence with `φ(1)=1`. Supply evaluation, extensionality,
real convex combinations, affine pullback under unital star homomorphisms,
unitization/restriction and the comparison between the norm and weak-star
topologies. For a nonzero unital algebra prove the state space nonempty,
convex and weak-star compact using native Banach–Alaoglu and BanachSpaceTheory
B1's weak-dual comparison. Use Mathlib's `Analysis/Convex/KreinMilman`
theorem to identify the weak-star closed convex hull of the extreme states.
Do not impose this compactness statement on the norm-one state space of an
arbitrary nonunital algebra. V4 equips this carrier with normality and support APIs.
Use `PositiveLinearMap.GNS` and `gnsStarAlgHom` from
`Mathlib.Analysis.CStarAlgebra.GelfandNaimarkSegal` for the completed GNS construction.
Add the canonical cyclic vector, recovery of the functional, unitary uniqueness and
transport/restriction lemmas; prove state separation and construct the faithful direct-sum
representation (Gelfand–Naimark) from these representations (Peterson, Propositions 4.1.4–4.1.5,
p. 56, Theorem 4.1.6, p. 57, and Corollary 4.1.7, p. 58; the theorem is stated for unital
algebras; restrict a unitization representation to the closed span of A acting on its Hilbert
space and use the approximate unit to obtain the nondegenerate nonunital construction).
*Needs:* Mathlib `PositiveLinearMap`, `PositiveLinearMap.exists_norm_apply_le`, Banach–Alaoglu,
`Analysis/Convex/KreinMilman` and `PositiveLinearMap.GNS`; BanachSpaceTheory B1's weak-dual
comparison.

**Checks.**

- On ℂ the state space is the single functional `z↦z`; on ℂ² it is the segment
  `{(a,b)↦ta+(1−t)b : t∈[0,1]}` with extreme points the two coordinate evaluations, so the
  Krein–Milman identification returns the whole segment from its two endpoints.
- On `M₂(ℂ)` the functional `x↦x₁₂` is bounded but not positive (`x=[[1,−1],[−1,1]]≥0` has
  `x₁₂=−1`), so positivity is a separate condition; `tr/2` is a state and `tr` is positive of norm
  2, not a state.
- On the nonunital algebra `c₀` the norm-one positive functionals are `x↦Σ_n w_n x_n` with
  `w_n≥0`, `Σ w_n=1`; the sequence of point evaluations `δ_n` converges weak-star to 0, which has
  norm 0, so this state space is not weak-star compact: the compactness statement is confined to
  unital algebras as stated.
- The GNS space of `tr/2` on `M₂(ℂ)` is `M₂(ℂ)` with the Hilbert–Schmidt inner product, of
  dimension 4 and with cyclic vector 1; the GNS space of `x↦x₁₁` is ℂ² with cyclic vector `e₁`, so
  the GNS dimension separates the two states.
**V0.SeparableFaithful — separable carriers and the ℓ² refinement.** For a
separable complex C*-algebra A, possibly nonunital, construct a faithful
nondegenerate representation on a separable complete complex Hilbert space.
For A≠0, choose a countable norm-dense family b_n in A₊ and norm-one
positive functionals φ_n with φ_n(b_n)>‖b_n‖/2 whenever b_n≠0, using
V0's preceding state separation and faithful Gelfand–Naimark representation;
when b_n=0 choose a fixed state. Prove that these states jointly detect
nonzero positive elements. Form the norm-convergent positive series
ψ=Σ_n 2^(-n-1)φ_n, prove ‖ψ‖=1 and ψ(a*a)>0 for a≠0, and use the
native `PositiveLinearMap.GNS` and `gnsNonUnitalStarAlgHom` on this faithful
state. Prove separability from the dense image of A and the bound
‖[a]‖≤‖a‖. Prove faithfulness and nondegeneracy using the native positive
contractive approximate unit and the dense classes [a]; do not assume an
unimplemented canonical GNS cyclic-vector theorem. When A is unital, use
`gnsStarAlgHom` and retain unit preservation.

For A≠0, amplify this nonzero separable GNS carrier by the countable
Hilbert sum `lp (fun _ : ℕ => ψ.GNS) 2`, with diagonal action. Prove the
action bounded, star-preserving, faithful and nondegenerate, and unital
when A is unital. Prove this carrier is separable and infinite-dimensional,
choose a Hilbert basis indexed by ℕ, and transport the representation by
its unitary coefficient map to native `lp (fun _ : ℕ => ℂ) 2`.
Include the finite-dimensional nonzero GNS case in this amplification;
no infinite-dimensionality of A is assumed. For A=0 use the zero Hilbert
space: its zero representation is faithful and nondegenerate, and is
unital when the zero algebra is viewed as unital. The zero action on ℓ²
is faithful but degenerate and is not a unital representation of that
zero unital algebra. Do not claim a nondegenerate representation of
A=0 on nonzero ℓ². For nonzero A the faithful nondegenerate
representation on `lp (fun _ : ℕ => ℂ) 2` is
`exists_injective_nondegenerate_representation_lp`. It has no pure-state, irreducibility or
V12.J prerequisite. The separable faithful representation is Peterson, Corollary 4.1.7 and
its proof, p. 58; state separation is Propositions 4.1.4–4.1.5, p. 56. The countable
amplification and Hilbert-basis transport above give the ℓ² refinement, retaining A≠0.
*Needs:* Mathlib `PositiveLinearMap.GNS`, `gnsStarAlgHom`, `gnsNonUnitalStarAlgHom`, the C*-algebra
approximate unit and `lp`; the state separation and Gelfand–Naimark representation above.


Prove every nonzero C*-representation has operator norm one, also for
nonunital star homomorphisms, using their nonzero image and an approximate
unit. The zero representation has norm zero. For H≠0 and n≥1, the
diagonal amplification of B(H) on H^n has a cyclic vector precisely when
the vector's n coordinates are linearly independent; thus it is cyclic
iff dim H≥n. Prove the finite Gram/inverse construction and the closed
linear-relation obstruction. In particular two copies need not be noncyclic.
For C([0,1]) acting on ℓ² of the positive integers by f↦diag(f(1/n)), prove boundedness,
star laws, nonfaithfulness and cyclicity of (1/n)_n by continuous coordinate
bumps and finite-support density. Compute the norms of the integral,
evaluation at zero and the positive functional f↦∫_0^1 6t²f(t)dt:
they are 1,1,2, respectively; replacing 6 by3 gives a state. For n≥1
on M_n(ℂ) prove trace is positive of norm n and the normalized trace `tr/n` is a
state, with n=1 and the zero algebra handled separately.
*Needs:* the GNS and state APIs above; Mathlib `lp`, `ContinuousMap` on `[0,1]` and `Matrix.trace`.

### Examples

- C([0,1]) acting on ℓ² of the positive integers by `f↦diag(f(1/n))` is bounded and
  star-preserving, is not faithful (a bump supported strictly between 1/2 and 1 acts as zero),
  and has the cyclic vector `(1/n)_n`.
- The integral, evaluation at zero and `f↦∫_0^1 6t²f(t)dt` have norms 1, 1 and 2; with 3 in
  place of 6 the last is a state.
- On `M_n(ℂ)` the trace is positive of norm n and `tr/n` is a state; the diagonal amplification
  of B(H) on `Hⁿ` is cyclic exactly when `dim H≥n`.

### Dependencies

- Mathlib `CStarAlgebra`, continuous functional calculus, `PositiveLinearMap`,
  `PositiveLinearMap.GNS`, `gnsStarAlgHom`, `gnsNonUnitalStarAlgHom`, `lp`, Banach–Alaoglu and
  `Analysis/Convex/KreinMilman`.
- BanachSpaceTheory B1 (weak-dual comparison).

## Layer 1: Operator topologies and the bicommutant theorem

Use `ContinuousLinearMapWOT` and the existing SOT `PointwiseConvergenceCLM`
(`H →Lₚₜ[ℂ] H`), and develop compatible strong-star,
ultraweak, and ultrastrong wrappers. Own here the operator-topology adapters on `B(H)`,
which BanachSpaceTheory B1 does not supply. Prove that a SOT- or WOT-convergent sequence of
operators on a complete space is norm bounded, from `banach_steinhaus` (for WOT, apply it
twice, through the bounded sesquilinear coefficients `⟪η,T_nξ⟫`). Prove that multiplication is
jointly SOT continuous on norm-bounded sets and is not jointly continuous on the whole space,
by an unbounded net with `S_iT_i` not converging. Prove the matrix-coefficient comparison: a net
converges in Mathlib's WOT copy exactly when every `⟪η,T_iξ⟫` converges
(`ContinuousLinearMapWOT.tendsto_iff_forall_inner_apply_tendsto`), and SOT convergence (in
`H →Lₚₜ[ℂ] H`, via `PointwiseConvergenceCLM.tendsto_iff_forall_tendsto`) implies WOT
convergence. Test this on the rank-one projections `P_n` onto an orthonormal sequence `e_n`:
`P_n → 0` in WOT and SOT while `‖P_n‖ = 1`, so there is no norm convergence. Prove the extended
topologies' neighborhood and net criteria, Hausdorff
locally convex structure, vector-coefficient continuity, separate continuity of products,
WOT/ultraweak continuity of star. Prove equality of weak with ultraweak and strong with ultrastrong on norm-bounded
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
*Needs:* Mathlib `ContinuousLinearMapWOT`, `H →Lₚₜ[ℂ] H` and their net criteria, `banach_steinhaus`,
Banach–Alaoglu; Mathlib's `geometric_hahn_banach_closed_point` (with
`ContinuousLinearMapWOT.instLocallyConvexSpace` for the local convexity of the WOT, the
`LocallyConvexSpace` instance of `H →Lₚₜ[ℂ] H` built from `UniformConvergenceCLM.locallyConvexSpace`
together with `UniformConvergenceCLM.continuousSMul` on finite sets for the SOT, and this layer's
own locally convex structure for the ultraweak and ultrastrong wrappers); BanachSpaceTheory B1's
weak/norm
closure agreement for convex sets and its weak and weak-star continuity criteria by evaluation;
Layer 0's C*-structure on `B(H)`.

**Weak limits of projections.** On every infinite-dimensional complete complex
Hilbert space H, prove that the WOT closure of the orthogonal projections in
B(H) is exactly the positive contractions `0≤A≤1`; prove the same ultraweak
closure statement using bounded-set agreement. Construct the approximating
net, indexed by finite-dimensional subspaces F ordered by inclusion. Compress
A to `C=P_F A|_F`, choose an isometric copy of F in F⊥, and on their orthogonal
sum use the projection
`[[C,sqrt(C(1−C))],[sqrt(C(1−C)),1−C]]`, extended by zero on the remaining
orthogonal complement. Prove positivity of `C(1−C)`, the commuting-square-root
identities and idempotence/self-adjointness of this block operator. Its
compression to F equals C exactly. Hence every fixed pair of matrix
coefficients agrees with A once F contains the two test vectors, giving WOT
convergence without a separability assumption. Conversely, pass the positive
contraction inequalities through those coefficients to identify the closure.
Own this elementary block construction in V1; V12's general two-projection
classification consumes it and is not a prerequisite here.

Prove that the projections are SOT closed on every H, by bounded product
continuity and preservation of self-adjointness under WOT convergence. For
finite-dimensional H they are WOT closed too; when H≠0, `(1/2)I` is a positive
contraction outside that closure. In the zero space both sets are `{0}`.
For separable infinite-dimensional H extract an approximating sequence using
the bounded-ball metrizability proved above. The dimension hypothesis is necessary, as the
finite-dimensional case shows (compare Jones, *Von Neumann Algebras*, Chapter 3, p. 13, where the
weak-limit statement is made without it).
State the WOT closure theorem on Mathlib's WOT copy and positive-operator order as
`closure_isStarProjection_eq_positive_contractions`.
*Needs:* Mathlib `IsStarProjection`, the positive-operator order, the continuous functional calculus
for `sqrt(C(1−C))`, `H →WOT[ℂ] H`; the bounded-set agreement of WOT and ultraweak topologies above.

For every unital star subalgebra A of B(H), identify its WOT, SOT, ultraweak, and ultrastrong
closures with A''; the WOT form, `A''=A` exactly when A is closed in Mathlib's WOT copy, is
`double_commutant_iff_isClosed_image_ofCLM`. Consume the finite-dimensional double-centralizer theorem from
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
membership in the generated algebra. The unit-ball form, that the SOT closure of the closed
unit ball of a unital star subalgebra A is the closed unit ball of A'', is
`closure_unitBall_eq_unitBall_double_centralizer`.
*Needs:* Mathlib `VonNeumannAlgebra`, `VonNeumannAlgebra.centralizer_centralizer`, `StarSubalgebra`,
`ContinuousLinearMapWOT.ofCLM`, `ContinuousLinearMap.toPointwiseConvergenceCLM`, the continuous
functional calculus (the Kaplansky function `t↦2t/(1+t²)`); RepresentationTheory/SemisimpleAlgebras'
finite double centralizer; the topologies above.

**Checks.**

- The von Neumann algebra generated by the empty set is `ℂI` (its commutant is all of B(H)).
  The one generated by `{e₁₂}` on ℂ² is all of `M₂(ℂ)`: its star closure contains `e₂₁`, and
  `e₁₂e₂₁=e₁₁`. The plain double commutant of the set `{e₁₂}` without adjoints is
  `span{I,e₁₂}`, of dimension 2, which is the wrong model the generation API must exclude.
- For `A=ℂI` the unit balls of A and `A''=ℂI` coincide, so Kaplansky is an equality there; for
  the unital algebra of finite-rank operators plus scalars on ℓ², `A''=B(H)` and the SOT closure
  of the finite-rank-plus-scalar contractions is the whole unit ball of B(ℓ²).
- On `H=ℂ` the scalar `1/2` is a positive contraction that is not a limit of projections
  (the projections are `{0,1}`), so the infinite-dimensionality hypothesis of the projection
  closure theorem cannot be dropped; on ℓ² the rank-one projections `P_n` onto `e_n` tend to
  0 in WOT and SOT with `‖P_n‖=1`.

### Examples

- The backward shift powers converge SOT to 0 with norm 1, while forward shift powers converge
  only WOT; the rank-one family `T_n e₀=n^(-1/2)Σ_(k=1)^n e_k` converges WOT to zero with
  `‖T_n e₀‖=1`.
- The diagonal weights `n⁻²` give an ultraweakly continuous functional that is not WOT
  continuous, and the operators `e_m+m e_n` exhibit non-metrizability on all of B(H).
- In finite dimension the projections are WOT closed and `(1/2)I` lies outside their closure;
  in the zero space both sets are `{0}`.

### Dependencies

- Mathlib `ContinuousLinearMapWOT`, `H →Lₚₜ[ℂ] H`, `banach_steinhaus`, positive-operator order.
- Layer 0 (C*-algebra structure on concrete algebras).
- RepresentationTheory/SemisimpleAlgebras (finite-dimensional double centralizer).
- Mathlib `geometric_hahn_banach_closed_point`, `ContinuousLinearMapWOT.instLocallyConvexSpace`,
  `UniformConvergenceCLM.locallyConvexSpace` and `UniformConvergenceCLM.continuousSMul` (local
  convexity and scalar continuity of the WOT and SOT).
- BanachSpaceTheory B1 (weak/norm closure agreement for convex sets and the weak-star continuity
  criterion by evaluation on the predual side).

## Layer 2: Elementary algebra, corners, and tensors

For a nonunital concrete C*-algebra A, use Mathlib's nonunital continuous functional
calculus to identify the algebra generated by a positive element with continuous spectrum
functions vanishing at zero. Prove its support projection belongs to the strong closure of A
by `SOT-lim (a/‖a‖)^(1/n)` for a≠0, with zero-constant polynomial approximants.
*Needs:* Mathlib's nonunital continuous functional calculus; Layer 1's strong topology.

For a normal element a of a von Neumann algebra M, prove that every value of the Borel calculus
`borelCalculus a` (SelfAdjointSpectralTheory SA-B05), in particular every spectral projection,
lies in W*(a)⊆M: by SA-B57 it commutes with every operator commuting with a, hence with
`W*(a)′`, and the bicommutant theorem of V1 gives membership. For x∈M prove that the modulus
|x| (PolarDecomposition PD-A36) lies in W*(x*x) by the continuous calculus, and that the polar
partial isometry v (PD-B24) lies in M: for a unitary u∈M′, `uvu*` satisfies `uvu*|x|=x` and
vanishes on the orthogonal complement of the closure of `range |x|`, which u fixes, so
`uvu*=v` by the uniqueness PD-B36; M′ is spanned by its unitaries, so v∈M″=M. Prove
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
projection onto `closure span {xpξ : x∈M, ξ∈H}`. For every y∈M′, prove
`yp=0 ↔ y c(p)=0`; this is the central-support kernel theorem.
Construct pMp on pH and prove `(pMp)' = pM'p` on pH. If M is a
factor and p ≠ 0, prove pMp is a factor and the restriction map `M' → B(pH)` is a faithful
normal isomorphism onto its image. Include reducing-subspace correspondence and the
nonzero product theorem `ab ≠ 0` for nonzero a∈M, b∈M' when M is a factor. For a self-adjoint multiplicatively closed generating set S, prove pSp generates pMp
for p∈M or p∈M'; give a counterexample when multiplicative closure of S is removed.
For a factor and finite-dimensional linear subspaces V⊂M, W⊂M', prove multiplication
from the algebraic tensor product `V⊗W` onto the linear span VW is a linear isomorphism;
when V,W are star subalgebras prove the star algebra version.

Construct completed Hilbert tensor products by completing native normed
`TensorProduct ℂ H K` with its existing positive-definite product inner
product. Extend native `TensorProduct.mapL`, `commIsometry` and
`assocIsometry` to the completions, with their uniqueness on dense
algebraic tensors. Construct bounded-operator tensor maps; demand dense
elementary tensors, exact norm/product/adjoint formulas, associativity,
flip, and the identification with vector-valued L². No second null-quotient
inner-product carrier is introduced.

**V2.RectangularL2 — Hilbert tensors for arbitrary measures.** For arbitrary measurable spaces S,T and positive measures μ,ν, use the existing native `Measure.pi` on the dependent two-element family(S,T), transported to S×T by `MeasurableEquiv.piFinTwo`; denote this particular measure by κ in the following statements. This is the maximal rectangle-cover product obtained from native `OuterMeasure.pi`/`piPremeasure` and `Measure.pi_caratheodory` in `Mathlib/MeasureTheory/Constructions/Pi.lean` ([finite-product design](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/product%20measures/near/206288949)), not a new measure type or replacement for native `Measure.prod`. Prove the measurable-rectangle cover formula for its outer measure, `κ*(E)=inf{Σ_n μ(A_n)ν(B_n): E⊆⋃_n(A_n×B_n), A_n,B_n measurable}`, and the rectangle identity `κ(A×B)=μ(A)ν(B)` without σ-finiteness. Cover sets in `piPremeasure` can be replaced by their projected bounding rectangles and measurable envelopes with the same outer costs. For the rectangle lower bound integrate the one-variable inequality `ν(B)1_A(x)≤Σ_nν(B_n)1_(A_n)(x)` for any measurable rectangle cover of A×B; this uses countable additivity/monotone convergence, without assuming a Fubini theorem for κ. Consume the native Carathéodory measurability proof for the product σ-algebra. Measurable unions of the rectangle covers show this outer measure is already trimmed to that σ-algebra, matching the native measure’s associated outer measure.

Prove the unique complex-linear unitary `L²(μ)⊗̂L²(ν)≃ₗᵢ[ℂ]L²(κ)` sending f⊗g to the a.e. class of `(x,y)↦f(x)g(y)`, with its exact norm and inner-product formulas, bilinearity, dense range and uniqueness on elementary tensors. Include zero measures, empty carriers and zero L² factors, with no separability assumption on the measure spaces or Hilbert spaces. Prove that changing either representative on a marginal null set changes the product only on a κ-null cylinder. Construct the map first on finite-measure simple-function factors using rectangle pairings, then extend through the existing completed Hilbert tensor. For surjectivity prove that finite spans of indicators of rectangles with finite marginal measures are dense in L²(κ). If κ(E)<∞, choose a countable rectangle cover with total cost<κ(E)+ε, discard its zero-cost rectangles modulo a κ-null union, and take finite subunions of its positive finite-cost rectangles; these have finite marginal measures and approximate E in symmetric-difference measure. Use native `Lp.simpleFunc.denseRange` for p=2 to pass from finite-measure indicators to all L² classes. Identify the completed map with pointwise products by measurable representatives and a.e.-convergent subsequences; do not infer a pointwise formula from a merely abstract Hilbert-space isomorphism.

Prove naturality under measure-preserving measurable equivalences of the factors and compatibility with the Hilbert tensor flip and the coordinate swap. For any measure η let η̂ denote its completion on the completed σ-algebra of the same carrier. Construct the canonical unitary C_η:L²(η)≃ₗᵢ[ℂ]L²(η̂) induced by identity on original measurable representatives, and prove C_κ(U(f⊗g)) is the class of (x,y)↦f(x)g(y) in L²(κ̂). Also complete both marginals: let κ_c be the same native maximal product construction for μ̂,ν̂ on their product σ-algebra. Prove κ_c and κ have the same associated outer measure, and that the product of the completed marginal σ-algebras lies in the κ-completed σ-algebra. Construct the canonical identity-on-original-representatives unitary J:L²(κ)≃ₗᵢ[ℂ]L²(κ_c) and prove the commuting identity J∘U=U_c∘(C_μ⊗̂C_ν), where U_c is this same tensor unitary for the completed marginals. Identify both sides with the elementary-product class in their common measure completion. Use equality of marginal outer measures, the measurable-rectangle cover formula and null cylinders to prove these comparisons. These are a.e.-class statements; completeness of marginal σ-algebras does not imply completeness of their product σ-algebra. When μ,ν are σ-finite, prove κ equals native `μ.prod ν`, using `Measure.measurePreserving_piFinTwo`/`Measure.prod_eq`, and recover the usual product-L² unitary with that exact measure. Do not identify the two product conventions for arbitrary s-finite inputs: for μ=ν=∞ times Lebesgue measure on[0,1], the diagonal has maximal rectangle-cover measure∞ but native bind-product measure0. A different rectangle-consistent extension can give that diagonal finite positive measure. Under the maximal convention declared here the theorem holds for all measures with no separability condition, and the σ-finite models agree with native `Measure.prod`. This supplier is part of V2's existing completed-tensor/L² theory; downstream UO tensor operators consume it without a reverse dependency.
*Needs:* Mathlib `Measure.pi`, `MeasurableEquiv.piFinTwo`, `OuterMeasure.pi`, `Measure.pi_caratheodory`,
`Lp.simpleFunc.denseRange`, `Measure.measurePreserving_piFinTwo`, `Measure.prod_eq`; the completed
Hilbert tensor product above.

**Checks.**

- For μ=ν counting measure on ℕ, κ is counting measure on ℕ×ℕ and the unitary is the canonical
  `ℓ²(ℕ)⊗̂ℓ²(ℕ)≃ℓ²(ℕ×ℕ)`, `e_i⊗e_j↦e_(i,j)`.
- For μ=ν Lebesgue measure on [0,1], κ is Lebesgue measure on the square (both are σ-finite), the
  diagonal is κ-null, and `‖f⊗g‖=‖f‖₂‖g‖₂` is Fubini for `|f(x)g(y)|²`.
- For μ=ν=∞·Lebesgue on [0,1] the diagonal has rectangle-cover measure ∞ (every cover of the
  diagonal by rectangles `A_n×B_n` has `Σ μ(A_n)ν(B_n)=∞` unless all factors are null, which cannot
  cover it) but native bind-product measure 0, so the two product conventions differ exactly off
  the σ-finite case, and the theorem's convention must be declared.

For finite measures develop the measure algebra
modulo null sets with metric `μ(A△B)` and prove its separability is equivalent to
separability of L². For uncountable I and the fair coin product measure on `{0,1}^I`,
prove the centered coordinate functions form an uncountable orthogonal family, so L²
is nonseparable; prove ℓ²(I) is separable exactly when I is countable.
The finite-support inner-product space c₀₀([0,1]) is incomplete: give a Cauchy sequence of partial sums supported on
countably many distinct points with a square-summable, infinite-support
limit in ℓ²([0,1]). Identify its completion with ℓ²([0,1]). Define the
spatial tensor product `M ⊗̄ N` as the algebra generated by elementary operator tensors;
prove associativity and flip, and construct both canonical normal unital
star homomorphisms `ι_M(x)=x⊗1_N` and `ι_N(y)=1_M⊗y` without nonzero
hypotheses. Prove `ι_M` injective and isometric when N≠0 or M=0, and
`ι_N` injective and isometric when M≠0 or N=0. In the nonzero opposite
factor case, test on ξ⊗η for a unit vector in its acting Hilbert space
and use the elementary tensor norm to prove the lower norm bound; the
bounded tensor map gives the upper bound. State `M⊗̄0=0` and `0⊗̄N=0`
under the canonical zero-Hilbert-space identifications. When N=0 the
first map is the zero map M→0 and is injective only for M=0; treat the
other case symmetrically, including the unique maps and identity on the
zero algebra when both factors are zero. Construct vector-functional slice maps
with their norm, adjoint, elementary-tensor and separating-family lemmas. Prove the commutation theorem for
B(K) tensor factors here; the general commutation theorem is a V11 consequence. Prove the B(K) tensor splitting theorem for a von Neumann algebra
containing `1 ⊗ B(K)` and the factoriality of a tensor product of factors.
*Needs:* the completed Hilbert tensors and operator tensor maps above, Layer 1's generated algebras
and bicommutant theorem, Layer 1's ultraweak topology for the normality claims (normality is
the predicate defined in V4; V4 does not consume this statement).

For a sequence of complex Hilbert spaces `(H_n)` with specified unit vectors `ξ_n`, construct
its incomplete Hilbert tensor product `ITP(H,ξ)`. Form the algebraic direct limit of the finite
prefix Hilbert tensor products under the linear isometries `v↦v⊗ξ_(n+1)`, define its inner
product at a common finite stage, prove independence of stage and representative, then complete.
Prove the canonical prefix maps are linear isometries with dense union and that the all-reference
vector has norm one. This carrier depends on the reference-vector data; parenthesization alone
does not define a countable Hilbert tensor product.

Export the prefix/tail splitting unitary, associativity and reindexing coherence, and the
bounded local-operator maps, their exact norms, multiplication, adjoint and mutual commutation
at disjoint sites. Prove compatible factorwise unitaries `U_n:H_n≃ₗᵢ[ℂ]K_n` with
`U_n ξ_n=η_n` extend uniquely to a unitary `ITP(H,ξ)≃ₗᵢ[ℂ]ITP(K,η)`. Reindexing includes
the reference vectors; for identical pairs `(H,ξ)` obtain the finite site-permutation action.

State two separate reference-change results. First, for `ζ_n=U_nξ_n`, the literal raw prefix
vectors `Ω_m=ζ_1⊗⋯⊗ζ_m⊗η_(m+1)⊗⋯` in the η-component are Cauchy exactly when their
complex tail products tend uniformly to one: for every ε>0, eventually every finite tail product
`∏_(m<j≤l)⟨η_j,ζ_j⟩` differs from 1 by less than ε. Equivalently, only finitely many overlaps
vanish and the partial products after the last zero converge to a nonzero limit. Thus
`Σ|1−⟨ζ_n,η_n⟩|<∞` is sufficient but not necessary for raw-prefix convergence. A phase sequence
can give conditional product convergence, while `ζ_n=−η_n` at every site has zero
`Σ(1−|⟨ζ_n,η_n⟩|)` but alternating raw prefixes.

Second, define the *specified local-product representations* on the two incomplete products by
the represented local copies of each `B(H_n)`: an operator `A∈B(H_n)` acts at site n
on `ITP(H,ξ)`, and `U_nAU_n⁻¹∈B(K_n)` acts at site n on `ITP(K,η)`.
There exists a unitary intertwiner for all these local factors if and only if
`Σ_n(1−|⟨ζ_n,η_n⟩|)<∞`. After selecting phases `c_n∈𝕋` so that
`c_n⟨ζ_n,η_n⟩=|⟨ζ_n,η_n⟩|`, this is equivalent to
`Σ_n|1−c_n⟨ζ_n,η_n⟩|<∞` and to `Σ_n‖ζ_n−c_nη_n‖²<∞` (with inner product linear in the
second variable). Prove sufficiency by phase-rescaling the truncations so each finite-prefix reference overlap is nonnegative, then use the tail-product estimate,
then extend isometrically on dense finite-excitation tensors and construct the inverse. For
necessity, approximate the image of the source reference vector by a finite-excitation vector
through site N; projecting onto the target reference lines on each finite tail `(N,M]` forces
`∏_(N<j≤M)|⟨ζ_j,η_j⟩|²→1` uniformly in M. Since `−log r≥1−r` for `0<r≤1`, this implies
the stated summability. Prove uniqueness of the intertwiner up to a unit scalar by showing the
commutant of all local factors is scalar: each reference projection fixes the reference vector,
and the finite-excitation vectors are dense. More explicitly, let `R_N=∏_(n≤N)P_(ξ_n)` be the product of the first N local reference-line projections; then `TΩ∈⋂_N ran R_N=ℂΩ`. These projections decrease to the vacuum-line projection, whereas the projections onto finite-excitation prefix spaces increase to the identity. The finite-excitation vectors force T to be that scalar on a dense subspace. This theorem is specifically about these local
representations and their factorwise identification; it does not classify arbitrary abstract
isomorphisms of von Neumann closures. It is phase-adjusted component equivalence, not convergence
of the raw prefix vectors. Consumers must state which conclusion they use.
Do not assert that arbitrary factorwise unitaries have an infinite product on this component.
For a topological group G and strongly continuous unitary representations U_n:G→U(H_n) fixing each reference ξ_n, prove that the compatible product unitaries define a strongly continuous unitary representation on ITP(H,ξ). Prove continuity first on each dense finite-prefix cylinder and then on every vector by the uniform norm-one bound; include compact topological groups acting by compatible reference-fixing factor unitaries; this covers compact product-torus actions when those hypotheses hold. Prove separability when every `H_n` is separable, and the compatibility of finite-cylinder
projections, their commuting local embeddings and their normal-state pairings. Von Neumann
product-algebra and modular-theory constructions consume this Hilbert carrier; they are distinct
from its definition. TypeAHeckeAlgebras H3 consumes it for the repeated standard-form Hilbert
space `K⊗K̄` and its density-vector reference, and owns that application's von Neumann product
state, modular action, shift and first-site analysis.
*Needs:* the completed Hilbert tensors and bounded operator tensor maps above; Mathlib
`LinearIsometry`, direct limits (the algebraic colimit is built here), infinite products of complex
numbers for the tail-product criteria; no modular-theory input.

**Checks.**

- `M_m(ℂ)⊗̄M_n(ℂ)=M_(mn)(ℂ)` on `ℂ^m⊗ℂ^n`, `ℓ∞(ℕ)⊗̄ℓ∞(ℕ)=ℓ∞(ℕ×ℕ)` on `ℓ²(ℕ×ℕ)`, `M⊗̄ℂ≅M`, and
  `M⊗̄0=0`; the algebraic tensor product `M⊙N` is a weakly dense star subalgebra, and the next
  check shows it is not weakly closed when both factors are infinite-dimensional.
- In `B(ℓ²)⊗̄B(ℓ²)=B(ℓ²⊗̂ℓ²)` the flip unitary `ξ⊗η↦η⊗ξ` is `Σ_(i,j) e_(ij)⊗e_(ji)` strongly,
  not a finite sum of elementary tensors, so the weak closure in the definition is not redundant;
  the commutant of `B(ℓ²)⊗1` is `1⊗B(ℓ²)`.
- For `H_n=ℂ²` and `ξ_n=e₁` at every site, `ITP(H,ξ)` is separable with orthonormal basis the
  finite-excitation vectors; with `ζ_n=e₂` one has `Σ_n(1−|⟨ζ_n,η_n⟩|)=Σ_n 1=∞`, so the components for
  the references `(e₁)` and `(e₂)` admit no unitary intertwining their local representations;
  for `⟨ζ_n,e₁⟩=cos(1/n)` the sum `Σ(1−cos(1/n))≈Σ 1/(2n²)` converges and the components are
  equivalent, while for `cos(1/√n)` it diverges like `Σ 1/(2n)` and they are not.
- `ζ_n=−e₁` has `Σ(1−|⟨ζ_n,e₁⟩|)=0`, so the components are equivalent, while the raw prefixes
  `Ω_m=(−1)^m e₁⊗e₁⊗⋯` alternate and do not converge: the two reference-change statements are
  different theorems.

For σ-finite measure spaces realize native L∞ as multiplication operators
on L² and prove its commutant is itself, with a.e.-class independence and
the exact essential-supremum operator norm. For abelian algebras on
separable H construct a single bounded self-adjoint generator a by a
convergent ternary-weight projection series. These given-measure and
generator targets are elementary V2 inputs and precede Fields. Prove
the measure-theoretic classification of separable nonatomic probability
measure algebras by the Lebesgue interval independently of the operator
algebra comparison below.
*Needs:* Mathlib `L∞`, `essSup` and `Lp` multiplication; Layer 1's projections; the finite
measure algebra above.

**V2.AbelianClassification — after Fields and SA-B85–B86.** For an abelian
M on separable H, choose the preceding generator a, so M=W*(a).
Consume SelfAdjointSpectralTheory SA-B85's control measure μ on K=σ(a) for the
continuous-calculus representation of a, its spectral projections P_a and its
equivalence `μ(B)=0 ↔ P_a(B)=0` for Borel B. For H≠0 normalize
the finite nonzero control to a probability measure. For H=0 use the
zero measure and the unique isomorphism of zero algebras; do not claim
a probability control or choose a unit vector there. Consume SA-B86's
P-essentially bounded symbol quotient, its norm equality and its comparison
with Mathlib's L∞(K,μ), with norm `essSup_μ|f|`.
VNA owns its comparison with this concrete generated algebra: construct

```
Φ_a : L∞(K,μ) ≃⋆ₐ[ℂ] W*(a),       Φ_a([f]) = f(a),
‖Φ_a([f])‖ = essSup_μ |f|.
```

Require compatibility with continuous and bounded Borel calculus,
`Φ_a([1_B])=P_a(B)`, the projection/measure-algebra correspondence and
normality. The representative is an actual bounded Borel version of
the a.e. class; SA-B49's P-null comparison and SA-B86 supply descent and
injectivity, not a new symbol or measure carrier. Prove onto-ness rather
than putting it in a premise. For T∈W*(a), V1's Kaplansky theorem and
bounded-set SOT metrizability give uniformly bounded continuous-calculus
approximants f_n(a)→T strongly. SA-B85's weighted control and SA-B52's
vector L² identity `‖f(a)ξ‖²=∫|f|²dμ_ξ` make f_n Cauchy in L²(μ): control finitely many cyclic
vectors and then the summable uniformly bounded tail. A subsequence
converges μ-a.e. to a bounded Borel version f with the same uniform
bound. P-null equivalence and SA-B53's bounded convergence give
f_n(a)→f(a) strongly along that subsequence, so T=Φ_a([f]). Increasing
bounded nonnegative symbols/projections and their vector integrals give
normality, and the indicator laws identify the projection lattice.
This is the algebra-membership/range theorem on the SA-B05 Borel
calculus, not a second scalar-control or spectral construction. Changing generators or control choices gives the induced normal
star isomorphism through M and its projection lattice; preserve the
measure class, not an arbitrary pointwise representative.

Only after this isomorphism apply the measure-algebra classification:
classify the separably acting abelian algebras abstractly as ℓ∞ of a
finite/countable atomic set, a nonatomic L∞[0,1] part, or their direct
sum, with either part allowed to vanish. Retain the zero algebra
separately. This is not the classification of arbitrary-cardinality
abelian algebras by one separable probability model.
*Needs:* SelfAdjointSpectralTheory SA-B05, SA-B49, SA-B52–B53 and SA-B85–B86 (Borel calculus,
P-null comparison, vector L² identity, bounded convergence, control measure, essentially bounded
symbols), the single-generator construction above, V1's Kaplansky theorem and bounded-set metrizability, Mathlib
`L∞(K,μ)` and `essSup`; V4.Normality wherever normality is asserted.

**V2.AbelianLocalizable — arbitrary cardinalities.** Retain the general
abelian model by disjoint sigma-finite corners, without imposing a
faithful normal state on all M. Using V4.Normality's support/normal
functional APIs, take a maximal orthogonal family of nonzero supports
z_i of normal positive vector functionals in an arbitrary faithful
concrete abelian M. Prove z_i central, their supremum1, and each z_iM
has a faithful normal state by restriction and normalization. For each
corner, consume Mathlib's unital commutative Gelfand duality
(`gelfandTransform_isometry`, `gelfandTransform_bijective`,
`gelfandStarTransform` under `CommCStarAlgebra`) with C(X_i), and that
state's cyclic faithful normal GNS representation. X_i may be nonmetrizable.
Consume V0/GNS, V4.Normality's normal-image theorem, Mathlib's
Riesz–Markov–Kakutani measure `RealRMK.rieszMeasure` for the state on C(X_i), and the
preceding given-finite-measure multiplication/MASA theorem. Its finite Radon Riesz measure μ_i
and continuous-function L² density identify the cyclic GNS carrier with
L²(μ_i). Bounded continuous approximations to bounded measurable symbols,
together with the normal image's strong closedness, prove that this
corner image is all L∞(μ_i). Prove the isometric normal star comparison
on this actual GNS carrier, not merely a Hilbert-space isomorphism.
This is the corner/GNS-to-algebra comparison; the Gelfand transform and
Riesz measure are consumed, not rebuilt.

Complete the finite component measures and take their disjoint union
with all componentwise measurable sets and measure `μ(E)=∑'_i μ_i(E_i)`.
Prove this space strictly localizable and construct the normal isometric
star isomorphisms `M≃∏_i z_iM≃L∞(μ)`, where the product is the uniformly
bounded product, with norm the supremum of component norms. Prove the
component/a.e.-class and projection comparisons, choice/reindexing and
common-universe-lift transport. The empty family gives the zero algebra
and zero measure. Uncountable counting measure models ℓ∞(I); do not
replace it by a faithful finite control. This general target uses no
standard-Borel or countable-multiplicity conclusion for its arbitrary
X_i or index set.
*Needs:* V4.Normality's supports and normal functionals, V0's GNS, Mathlib `gelfandStarTransform`,
`RealRMK.rieszMeasure` and `RealRMK.integral_rieszMeasure`, the given-measure MASA theorem above;
the strictly localizable disjoint union is built here.

**V2.AbelianRepresentationMultiplicity — terminal application.** For
normal representations of the separably acting abelian algebras on
separable Hilbert spaces, consume SelfAdjointSpectralTheory SA-B85's cyclic
multiplication model, control measure class, measurable multiplicity and
classification of representations of the same `C(K)` by control class and
multiplicity, with V4.Normality and the preceding Φ_a comparison. Own
restriction to the C*-algebra generated by a and comparison with its normal
extension, and use V4.Normality to recover the given representation from that
restriction: two normal representations of M=W*(a) on separable Hilbert spaces
are unitarily equivalent iff their restrictions to `C(σ(a))` have equivalent
control measures and equal multiplicities almost everywhere, and the control
class of a normal representation is absolutely continuous with respect to the
class of μ in V2.AbelianClassification. Include the identity representation of
L∞[0,1] on `L²[0,1]` (multiplicity 1), its amplification on `L²[0,1]⊗ℂ²`
(multiplicity 2, not equivalent to the first) and the zero representation (zero
control). V4.0.Decomposition consumes SA-B85 for its central-reduction and
direct-integral applications. For representations on arbitrary Hilbert spaces
retain SA-B85's orthogonal cyclic-sum description and V4.Normality's
amplification API, without a separable measurable-multiplicity assertion.
Elementary V2 carriers, completed tensors, projection lattice, membership,
generator and given-measure MASA APIs consumed by Fields remain independent of
these later classification applications.
*Needs:* SelfAdjointSpectralTheory SA-B85, V4.Normality, V2.AbelianClassification's Φ_a.

**V2.NonmodularProjectionLattice.** On H=ℓ²⊕ℓ² let
D(x)_n=x_n/(n+1), y_n=1/(n+1), A=ℓ²⊕0, B=graph D and C=ℓ²⊕ℂy.
Prove these subspaces closed, D injective with dense range and y∉range D.
Then A<C, B∧C=0 and A∨B=H, so the modular law fails. Transport it to
ℓ² by the unitary interleaving the two standard bases at even/odd indices.
This elementary Hilbert/projection result is consumed by V5.LatticeFinite.
*Needs:* Mathlib `lp`, closed graphs of bounded operators and the lattice of closed subspaces.

### Examples

- The separably acting abelian von Neumann algebras are `ℓ∞` of a finite or countable atomic
  set, `L∞[0,1]`, or a direct sum of the two; uncountable counting measure gives `ℓ∞(I)`.
- On `ℓ²⊕ℓ²`, the subspaces `ℓ²⊕0`, the graph of `D(x)_n=x_n/(n+1)` and `ℓ²⊕ℂy` with
  `y_n=1/(n+1)` violate the modular law (V2.NonmodularProjectionLattice).
- The support projection of a positive `a≠0` is the SOT limit of `(a/‖a‖)^(1/n)`.
- In `ℓ∞` acting diagonally on `ℓ²`, `x=diag(x_n)` has modulus `diag(|x_n|)` and polar part
  `diag(x_n/|x_n|)`, with 0 where `x_n=0`; both lie in `ℓ∞`, and the polar part is a
  non-unitary partial isometry as soon as some `x_n=0`.
- For a the multiplication by t on `L²[0,1]`, `W*(a)` is the multiplication algebra `L∞[0,1]`;
  the spectral projection `1_[0,1/2](a)∈W*(a)` has infinite rank and every one-point set has
  spectral projection 0, so `W*(a)` has no minimal projection.

### Dependencies

- Layers 0 and 1.
- Mathlib nonunital continuous functional calculus.
- OperatorTheory PolarDecomposition PD-A36–A45 and PD-B23–B36, and SelfAdjointSpectralTheory
  SA-B05–B13 and SA-B57, for the membership results.
- SelfAdjointSpectralTheory SA-B05, SA-B49, SA-B52–B53 and SA-B85–B86, Layer 1's Kaplansky
  theorem and bounded-set metrizability, Mathlib `L∞` and `essSup`, and V4.Normality for
  V2.AbelianClassification and V2.AbelianRepresentationMultiplicity.
- Mathlib's commutative Gelfand duality and `RealRMK.rieszMeasure` for V2.AbelianLocalizable.

## Layer 3: Type I and finite-dimensional algebras

Define minimal, finite, infinite, properly infinite, and abelian projections. Prove the
minimal-corner criterion `pMp = ℂp` for nonzero projections p. In a factor any two nonzero projections have a nonzero
connecting corner: for nonzero projections p,q construct a unitary u∈M with `puq≠0`; polar decomposition of this corner gives nonzero equivalent subprojections. This does not assert p∼q for arbitrary nonzero p,q.
Construct matrix units from orthogonal equivalent projections, with their representation,
corner and tensor-product APIs. Prove a factor with a minimal projection is spatially
`B(K) ⊗ 1_L` and classify type I_n and type I_∞ on separable spaces. Treat arbitrary
cardinality in the basic type I classification. Give the commutant and multiplicity.
*Needs:* Layers 1–2 (corners, projections, PolarDecomposition PD-B24–B36 for the connecting corner,
completed tensors), Mathlib `Matrix` and `IsStarProjection`.

**Checks.**

- In `M₂(ℂ)` every rank-one projection is minimal (`pMp=ℂp`) and abelian, and 1 is finite; in
  `B(ℓ²)` the rank-one projections are minimal, the finite-rank projections are finite, and 1 is
  properly infinite (it is equivalent to the projection onto the even coordinates and to the one
  onto the odd coordinates, which are orthogonal).
- In `ℓ∞(ℕ)` every projection is abelian but only the point projections `δ_n` are minimal; in
  `L∞[0,1]` every projection is abelian and none is minimal (a set of positive measure splits into
  two of positive measure), so abelian does not imply minimal.
- In `M₂(ℂ)⊕ℂ` the projections `e₁₁⊕0` and `0⊕1` are minimal but not equivalent (their central
  supports `1⊕0` and `0⊕1` differ), and `1⊕0` is neither minimal nor abelian.
- The inclusion `M₂⊕ℂ⊂M₅⊕M₃` given by `(x,c)↦(diag(x,x,c),diag(x,c))` has multiplicity matrix
  `[[2,1],[1,1]]` (rows `M₅,M₃`, columns `M₂,ℂ`), and the dimension formula reads `2·2+1·1=5`,
  `1·2+1·1=3`.

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
 For a group Γ, subgroup Η and commutative coefficient ring R, prove the algebraic group-ring formula on native `MonoidAlgebra R Γ`: as a left `MonoidAlgebra R Η`-module it is free on any chosen representatives g_i of the disjoint sets Ηg_i, at arbitrary index. Construct the linear equivalence with the finitely supported direct sum of copies of R[Η], prove uniqueness coefficient by coefficient, and recover rank `[Γ:Η]` in the finite-index case over a nonzero ring. V8 owns the distinct bounded group-von-Neumann and completed L² comparisons; an infinite coset expansion is not an algebraic group-ring expression.
*Needs:* RepresentationTheory/SemisimpleAlgebras's finite-dimensional structure theory, Mathlib
`MonoidAlgebra`, `Matrix.trace`, `Module.Free`; Layer 1's bicommutant theorem for the
infinite-dimensional trace statement.

Apply the finite-dimensional C*-classification to prove every complex
two-dimensional C*-algebra is C², so there is no nonisomorphic pair in
dimension2. Prove every three-dimensional one is C³ and cannot be a
C*-subalgebra of M₂(ℂ): three nonzero orthogonal projections require
rank at least3, even without a unital inclusion. Exhibit C⁴ and M₂(ℂ)
as the smallest equal-dimensional nonisomorphic pair, using commutativity
and the classification in dimensions1–3.
*Needs:* the finite-dimensional classification above.


### Examples

- A factor with a minimal projection is spatially `B(K)⊗1_L`; `M_n(ℂ)` is of type I_n and
  `B(ℓ²)` of type I∞.
- `ℓ∞(ℕ)` and `L∞[0,1]` are abelian, hence of type I, the first atomic and the second diffuse.
- In a factor two nonzero projections have a nonzero connecting corner, but need not be
  equivalent (a rank-one and a rank-two projection in `M₃(ℂ)`).

### Dependencies

- Layers 1 and 2; OperatorTheory PolarDecomposition PD-B24–B36.

## Layer 4: Preduals, normality, and normal representations

**V4.Core — duality and the easy normality direction.**
Use trace class S₁(H) as the trace-class ideal of OperatorIdeals OI-B29–B30, with trace norm
`‖x‖₁=ν(x)=∑ₙ aₙ(x)`, identified with the Hilbert nuclear operators by BanachSpaceTheory B4, and
the Hilbert–Schmidt class S₂(H,K) and norm ‖·‖₂ of OI-B32–B41. Define the canonical trace
`Tr(x)=∑⟨e_i,xe_i⟩` in [0,∞] on positive operators and prove that a bounded x is trace class iff
`Tr|x|<∞`, with `Tr|x|=‖x‖₁` (B4's Schmidt series and the modulus PD-A36; Reed–Simon I,
§VI.6). Prove basis independence
of positive extended trace, cyclicity of trace-class products and Hilbert–Schmidt pairings,
`‖φ_h‖ = ‖h‖₁`, and the unitary identification of Hilbert–Schmidt operators H→K with
`K ⊗̄ conjugate(H)`. Identify `B(H)` isometrically with the dual of trace class by the pairing
`(x,h) ↦ Tr(xh)`. For an ultraweakly closed linear subspace V, construct its predual as the
trace-class quotient by the annihilator, prove annihilator closure, quotient completeness,
the dual identification and weak-star/ultraweak agreement. Denote the ultraweakly
continuous linear functionals by M_* and identify them isometrically with this
quotient. Prove intrinsic uniqueness of the von Neumann predual and
the equivalence with Mathlib's WStarAlgebra definition (Sakai's theorem).
Consume BanachSpaceTheory B2's generic Krein–Šmulian theorem for the dual
of a Banach space with its specified weak-star pairing: a convex set is
weak-star closed iff its intersections with all centered closed balls
are weak-star closed, including its linear-subspace unit-ball criterion.
The predual here is complete by the trace-class/closed-annihilator quotient
construction, or the Banach predual in the abstract WStarAlgebra input.
Own the W*-algebra specialization: weak-star closedness of the positive
cone, separate weak-star continuity of multiplication before representation,
predual uniqueness and a faithful ultraweakly continuous concrete
representation inducing the given predual. These algebra/order and
representation conclusions are separate targets, not consequences of
merely restating the generic criterion. In the
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
*Needs:* BanachSpaceTheory B1 (annihilators, quotient duals), B2 (Krein–Šmulian), B4 (nuclear
operators, Schmidt series, rank-one norm, identification with trace class); OperatorTheory
OperatorIdeals OI-B29–B41 and PolarDecomposition PD-A36; Mathlib
`LinearMap.dualEmbedding_surjective`, `LinearMap.rightDualEquiv`, `SeparatingDual`, `WStarAlgebra`;
Reed–Simon I §VI.6 is the source for the canonical trace and the trace-class duality.

**Checks.**

- `diag(1/n²)` on ℓ² is trace class with `‖·‖₁=Tr=π²/6`; `diag(1/n)` is Hilbert–Schmidt
  (`Σ 1/n²<∞`) and compact but not trace class (`Σ 1/n=∞`), so `S₁⊊S₂⊊K(H)`.
- The rank-one operator `u⊗v*:ξ↦⟨v,ξ⟩u` has `‖u⊗v*‖₁=‖u‖‖v‖` and `Tr(u⊗v*)=⟨v,u⟩`; the functional
  `x↦⟨e₁,xe₁⟩` on `B(H)` is the pairing with `h=e₁⊗e₁*`, of trace norm 1.
- On the zero space and in finite dimension every operator is trace class and `‖x‖₁` is the sum
  of the singular values; the unilateral shift has `|S|=1`, so `Σ⟨|S|e_i,e_i⟩=∞` and S is not
  trace class, although every matrix coefficient is bounded.

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
*Needs:* V0's state carrier, the predual of V4.Core, Mathlib's order on `B(H)`.

**V4.PositivePredual — positive spanning and the self-adjoint base norm.**
For every complex W*-algebra M, with no trace, separability or sigma-finiteness
hypothesis, prove that every self-adjoint member of M_* is a difference
of positive members of M_*, and every member of M_* is a complex
linear combination of four positive normal functionals (Peterson's notes, Theorem 4.3.3,
p. 62, the Jordan decomposition `φ=φ₊−φ₋` with `‖φ‖=‖φ₊‖+‖φ₋‖`, and Corollary 4.3.4, p. 63).
On the real
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
the general predual result consumed by V12.J for typeIII and mixed algebras.

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
input. V12.J uses it for its scalar-extension and positive-map comparisons;
Enriched's predual-adjoint construction establishes its own normality directly.
*Needs:* V4.Core (trace-class quotient predual, faithful ultraweakly continuous representation),
V0's positive functionals, Mathlib's positive order, Cauchy–Schwarz for positive functionals and
Riesz representation on `H`; Peterson, Theorem 4.3.3 and Corollary 4.3.4, pp. 62–63, is the source.

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
separating vectors (`IsCyclic`: the orbit Mξ is dense; `IsSeparating`: xξ=0 forces x=0
in M), cyclicity for M iff separation for M' (`isCyclic_iff_isSeparating_commutant`, with no
separability), and normal faithful
representations preserving the intrinsic predual. Include positive-functional
domination and the Radon–Nikodym operator in the commutant for a dominated
vector functional. Prove state-preserving automorphisms are canonically
unitarily implementable in GNS. Prove every normal star homomorphism is
represented by amplification, reducing projection and spatial identification
of its image, with kernel a central summand.
*Needs:* V4.Core, V4.PositivePredual, V0's GNS, Layer 1's topologies and Kaplansky theorem, Mathlib
orthogonal projections for the Radon–Nikodym operator in the commutant.

**Faithful C*-states and normal GNS extensions.** Distinguish a faithful state
on a C*-algebra, faithfulness of its GNS representation, and faithfulness of
the vector state on the generated von Neumann algebra. Construct the following
counterexample to preservation of the first property under that extension.

Let `A=C([0,1],M₂(ℂ))`. Choose pairwise distinct points `x_n` such that the
even and odd subsequences are each dense, put `w_n=2^(−n−1)`, and let `v_n`
be the first standard basis vector for even n and the second for odd n.
Construct `φ(a)=Σ_n w_n⟨v_n,a(x_n)v_n⟩`. Prove absolute convergence,
positivity, `φ(1)=1` and faithfulness: `φ(a*a)=0` makes each corresponding
column vanish on a dense subset, so both continuous columns vanish everywhere.
On `H=⨁₂_nℂ²` define `π(a)=diag(a(x_n))` and
`Ω=(sqrt(w_n)v_n)_n`. Prove this bounded unital star representation has
vector state φ. Identify its strong closure with the bounded product
`∏_n M₂(ℂ)` acting diagonally, using continuous disjoint bump functions to
interpolate every finite coordinate list with the same operator-norm bound,
then finite-support vector approximation. Show Ω is cyclic for this product
and hence for π(A); use V0's GNS uniqueness to identify this model with GNS.
The projection supported at coordinate0 onto the line orthogonal to v₀
is nonzero and annihilates Ω. Thus the normal vector-state extension to
`π(A)''` is not faithful although φ and π are faithful.

Retain the separate finite-matrix distinction: for n≥2 the state `a↦a₁₁`
on M_n is not faithful, while its defining GNS representation is faithful.
For a faithful normal state on an already given von Neumann algebra, prove
its GNS cyclic vector is separating for the represented image; the C*-state
counterexample above does not remove that normality hypothesis.
*Needs:* V0's GNS uniqueness, Layer 1's generated algebras, Mathlib `ContinuousMap` bump functions,
`lp` direct sums and `Matrix`.

**V4.0 — Measurable fields, spectral representation and central decomposition.**

**V4.0.Fields — Hilbert and operator fields.** For standard
σ-finite measure spaces construct measurable fields of
separable Hilbert spaces from countable fundamental sections, measurable
sections, square-integrable sections modulo almost-everywhere equality,
and their complete direct-integral Hilbert space. Construct measurable
essentially bounded operator fields modulo fibrewise a.e. equality, with
the essential-supremum norm, and prove the decomposable-operator
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
of density versions. If two countable fundamental families generate the
same measurable-section structure, construct the canonical unitary between
their direct integrals induced by the identity on measurable sections.
Prove independence of section versions, equality of norms, identity and
composition laws, and compatibility with diagonal multipliers, bounded
a.e.-operator-field classes, adjoints, the rectangular-map comparison and
the stated measure-change unitaries. No assertion identifies arbitrary
fundamental families defining different measurable structures. Prove these by
measurable Gram–Schmidt on fundamental sections, scalar integration and
Hilbert completion; this sublayer has no PVM, normal-operator or central-
decomposition input. SelfAdjointSpectralTheory SA-B85 consumes it.
*Needs:* Mathlib measurable functions into separable Hilbert spaces, `MeasureTheory.Lp`,
Radon–Nikodym derivatives, `gramSchmidt`; V2's completed tensors for constant fields; no
projection-valued-measure or normal-operator input.

**V4.0.Decomposition — spectral and central decomposition.** Consume
V4.0.Fields, V4.Normality and SelfAdjointSpectralTheory SA-B85.
For X second-countable locally compact Hausdorff and a nondegenerate
representation of C₀(X) on separable H, consume SA-B85's diagonal
representation, measurable multiplicity and change-of-measure unitary.

For a separably acting von Neumann algebra disintegrate over a chosen
central abelian algebra; over the full center the fibers are factors
almost everywhere. Construct measurable algebra fields from countable
operator generators, direct-integral commutants and centers, and the
uniqueness/transport of the decomposition. Prove decomposition of normal
functionals as integrable fields with their norm formula, and
`(∫⊕M(γ))⊗̄B(K)≃∫⊕(M(γ)⊗̄B(K))` for separable K.
Consume analytic-set and completion-measurability theory and
Jankov–von Neumann uniformization from [OptimalTransport, Layers 2
and 8.2](../OptimalTransport/README.md). Prove Lusin–Novikov
uniformization for Borel relations with countable sections, its
countable-partial-map enumeration and measurable null-set transport.
V11 and FactorRigidity R6 consume this selection layer.
Build Polish structures on
unitary groups and finite matrix-unit systems using strong-star
convergence on bounded sets; construct the Borel spaces of countably
generated algebra fields and spatial isomorphisms. V5 constructs measurable trivialization after projection comparison. Disintegrate representations
of separable C*-algebras commuting with the diagonal algebra. This
reduction theory is restricted to separable Hilbert spaces/standard
σ-finite bases; arbitrary representations retain V4.Normality's amplification
API. OperatorAlgebraDynamics D5 consumes V4.0.Fields, SA-B85’s diagonal C₀ representation and V4.0.Decomposition’s reduction of separable C*-representations commuting with the diagonal
and adds groupoid representation/disintegration, while V13 adds the
injectivity/AFD applications.
*Needs:* V4.0.Fields, V4.Normality, SelfAdjointSpectralTheory SA-B85; OptimalTransport Layers 2
and 8.2 (analytic sets, Jankov–von Neumann uniformization, finite-measure completion); Mathlib
Polish spaces, `Measure` on standard Borel spaces and the one-point compactification
(`OnePoint`).

**Checks.**

- On ℂ² with `M=M₂(ℂ)` every nonzero vector is cyclic and none is separating (`e₁₂e₁=0`), while
  for the commutant `ℂI` every nonzero vector is separating, as the cyclic/separating duality
  requires.
- For the diagonal algebra on ℂ², `(1,1)` is cyclic and separating while `(1,0)` is neither, so
  "cyclic" cannot be replaced by "nonzero".
- On the zero Hilbert space the vector 0 is both cyclic and separating for the zero algebra;
  on a nonzero space the vector 0 is neither.

### Examples

- For the vector state `φ(a)=a₁₁` on `M_n(ℂ)` acting on ℂⁿ, n≥2, the GNS vector is cyclic but
  the state is not faithful, so the vector `e₁` is not separating.
- `B(H)` is the dual of the trace-class operators, and `ℓ∞(I)` of `ℓ¹(I)` for every index set
  I, with no separability assumption.

### Dependencies

- Layers 0–3.
- BanachSpaceTheory B1, B2 and B4; OperatorTheory OperatorIdeals OI-B29–B41 and
  PolarDecomposition PD-A36 for the trace class and trace norm.
- Mathlib `LinearMap.dualEmbedding_surjective`, `LinearMap.rightDualEquiv`, `SeparatingDual`.
- SelfAdjointSpectralTheory SA-B85 and OptimalTransport Layers 2 and 8.2 for V4.0.Decomposition.

## Layer 5: Projection comparison and finite factors

Define `ProjectionEquivalent M p q` (p, q projections of M and some v∈M with `v*v=p`,
`vv*=q`) and `ProjectionSubequivalent M p q` (the same with `vv*≤q`).
Prove equivalence is an equivalence relation, subequivalence is well-defined on the quotient,
transitive and antisymmetric there, and respects orthogonal sums, corners, amplification,
and limits. Prove the projection Schröder–Bernstein theorem (`equivalent_of_subequivalent`:
p≼q and q≼p give p∼q) by orthogonal partial-isometry sums and the general central comparison theorem; specialize to total comparison in factors.
Prove there is a central projection z such that zM is finite and
(1−z)M is properly infinite. Prove the halving lemma for a properly
infinite projection p: split p into two orthogonal subprojections each
equivalent to p. Iterate to obtain a countable orthogonal sequence
p_n≤p with p_n∼p, with implementing partial isometries, and prove
p_n tends ultraweakly to zero. Include corner and central-summand
compatibilities; no countable decomposability assumption is imposed here.
For σ-finite properly infinite M strengthen the splitting to countably
many equivalent projections with sum 1. Construct isometries v_n with
`v_n*v_m=δ_(n,m)1` and `Σv_nv_n*=1` strongly, and the normal
isomorphism M≃M⊗̄B(ℓ²) with its corner and matrix-unit formulas.
Use the ultraweakly closed ideal classification from V2 to prove a nonzero normal trace on a factor is faithful
(the comparison theory: Anantharaman–Popa, §2.4, pp. 35–40; Peterson, §3.2, pp. 44–48).
*Needs:* Layer 2's projection lattice, polar-part membership (PolarDecomposition PD-B24) and ultraweakly closed ideals; Mathlib
`IsStarProjection` and the positive order; Zorn's lemma for the exhaustions.

Define `IsFactor M` (nonzero identity and scalar centre), `IsFinite M` (every isometry of M is
unitary) and `IsTypeIIOne M`: a finite factor without minimal projections, that is, every
nonzero projection of M has a nonzero proper subprojection in M. Define `IsTracialState M τ` for
a linear functional τ on M by `τ(1)=1`, `τ(x*x)≥0` and `τ(xy)=τ(yx)`.
First prove **V5.Dixmier**: the norm-closed convex hull of unitary
conjugates of an element of a finite von Neumann algebra meets its
center in a unique element D(x) (Dixmier's property: Peterson, Theorem 4.8.2, p. 75;
Anantharaman–Popa, Theorem 6.4.1, p. 93). Prove that this assignment constructs
the faithful normal center-valued trace and its scalar specialization (Peterson, Theorem 4.7.10,
p. 72; Anantharaman–Popa, Theorem 6.4.4, p. 95),
hence existence
and uniqueness of the faithful normal normalized trace on a II₁
factor, independently of the trace-range theorem (Anantharaman–Popa, Theorems 6.3.4 and 6.3.5,
pp. 91–92). Prove uniqueness in the stronger form
`tracialState_unique`: a factor has at most one tracial state, with no normality assumed. On a
finite factor every tracial state is constant on the Dixmier hull of x and so equals τ(D(x));
on an infinite factor the halving lemma writes 1 as the sum of two projections equivalent to 1,
so `τ(1)=2τ(1)` and there is no tracial state. Existence of a faithful tracial state on a II₁
factor is `exists_faithful_tracialState`; the README's trace is moreover normal.
With this trace, identify projection equivalence and order with
trace equality and inequality. Prove the small-projection theorem
before the range argument: split a nonminimal projection into two
nonzero parts, choose one of trace at most half, and iterate. Thus
arbitrarily small positive traces exist without assuming that every
value is attained. Then obtain every trace value in [0,1] (the dimension function, Anantharaman–Popa, Theorem
6.2.8, p. 88), continuous
splitting, matrix subfactors of every positive order and unitary
equivalence of equivalent projections in a finite factor.
Prove the alternative small-trace increment argument for a II₁ factor:
for 0≤r≤1 take a projection q maximal subject to τ(q)≤r, using
normality on chain suprema. If τ(q)<r, use the preceding
small-projection theorem to choose nonzero e with τ(e)<r−τ(q);
V3's factor connector in (1−q)Me and the polar part (PD-B24) with V2's membership give
nonzero f≤1−q equivalent to a subprojection of e. Then
0<τ(f)≤τ(e)<r−τ(q), so q+f contradicts maximality. Handle r=0,1
directly. Trace
range is not an input to trace existence. Derive the unique-trace
factoriality criterion under normal faithful tracial hypotheses.
Prove algebraic simplicity of II₁ factors using the following explicit projection
extraction. For a nonzero positive a∈M set ε=‖a‖/2>0 and define the bounded
nonnegative Borel function f_ε on ℝ by f_ε(t)=0 for t<ε and
f_ε(t)=1/t for t≥ε. It is smooth on either side of its single
jump, with 0≤f_ε≤1/ε. Consume SelfAdjointSpectralTheory SA-B05 and V2's membership result to prove
f_ε(a)∈M and a f_ε(a)=1_[ε,∞)(a), a projection. Prove it is nonzero:
otherwise the spectral calculus gives ‖a‖≤ε, a contradiction. For a nonzero
two-sided algebraic ideal I choose x∈I∖{0}; then x* x∈I is nonzero
positive and this construction gives a nonzero projection in I. Use the
finite-factor projection comparison explicitly: for the obtained projection p,
choose n≥1 with 1/n≤τ(p), split1 into n orthogonal projections q_i of
trace1/n, and choose partial isometries v_i with v_i*v_i=q_i and
v_i v_i*≤p. Then q_i=v_i* p v_i∈I, so 1=Σ_i q_i∈I and I=M.
No norm closure or star-invariance of I is assumed; this is `isSimpleRing_of_isTypeIIOne`. Prove that every nonzero finite-dimensional complex
von Neumann algebra A embeds unitally and normally into every II₁ factor: write A as a finite
direct sum of matrix blocks, partition the identity into nonzero corners, and split each corner
into the required number of equivalent projections to obtain matrix units (Anantharaman–Popa,
Corollary 2.4.11, p. 39, Proposition 4.1.6, p. 61, and the matrix-unit construction in the
proof of Proposition 2.4.13, p. 39; the latter construction only uses equivalence and
orthogonality of the chosen projections). Prove a concrete diffuse factor contains no nonzero compact operator, by finite-rank
spectral projection extraction and the minimal-projection criterion.
*Needs:* the comparison theory above, SelfAdjointSpectralTheory SA-B05 (for `f_ε(a)`), V2's membership results,
V3's connecting corner, Mathlib `IsSimpleRing`; the sources named at each claim.

Prove a unital star homomorphism between II₁ factors is injective, and a surjective one
is a normal isomorphism, strongly continuous on norm-bounded sets.
*Needs:* the algebraic simplicity and unique trace above; Layer 1's Kaplansky theorem.

Using V4.0.Fields' measurable fields and V4.0.Decomposition's Polish selection spaces, prove measurable
trivialization: when almost every factor fiber is abstractly isomorphic
to a fixed separably acting factor N, first amplify the representation
by `H↦H⊗ℓ²` and `M↦M⊗1`, leaving the abstract algebra unchanged.
Prove faithful normal representations of a factor on separable spaces
with properly infinite commutant are unitarily equivalent. This supplies
spatial isomorphisms between the amplified fibers and a fixed amplified
representation of N. Select their measurable unitary implementers and
conclude an abstract isomorphism `M≃Z(M)⊗̄N`. Replace the σ-finite
base measure by an equivalent probability measure before consuming
OptimalTransport's finite-measure completion theorem. Pass through the
completed base measure and choose Borel representatives modulo null sets;
pointwise existence alone does not supply the selected field.
*Needs:* V4.0.Fields, V4.0.Decomposition's Polish selection spaces and measurable selection,
OptimalTransport's finite-measure completion theorem, V4.Normality's representation theory, the
comparison theory above (properly infinite commutants).

**V5.LatticeFinite — finiteness and projection modularity.** Own the exact
all-cardinality theorem `P(M) is modular ↔ M is finite`, and its corner form
`[0,p] is modular ↔ p is Murray–von Neumann finite`. For finite M consume the
faithful center-valued trace constructed above; prove
`T(p∨q)+T(p∧q)=T(p)+T(q)` by the partial-isometry comparison. For a≤c,
compute equal center-valued traces of `a∨(b∧c)` and `(a∨b)∧c`; their order
and trace faithfulness force equality. No faithful scalar tracial state is
assumed on an arbitrary finite algebra.

For a nonfinite algebra use the nonzero properly-infinite central summand.
Iterate halving to obtain orthogonal p_n equivalent to its unit, then absorb
the orthogonal remainder into p_1 by projection Schröder–Bernstein so their
sum is the unit. The resulting normal matrix-unit embedding of B(ℓ²)
preserves all projection joins, meets and complements. Embed the
V2.NonmodularProjectionLattice witness in this properly-infinite corner.
This is the single generic modularity/finiteness owner.
*Needs:* the center-valued trace above, the halving lemma and projection Schröder–Bernstein,
V2.NonmodularProjectionLattice; Mathlib `IsModularLattice`.

**Checks.**

- `M₂(ℂ)` on ℂ² is a factor; the diagonal algebra on ℂ² is not (`diag(1,0)` is central and not
  scalar); the zero algebra on the zero space is not a factor, which the condition `1≠0`
  enforces.
- The zero algebra has only the zero map into a II₁ factor R; it is not unital since
  `f(1)=f(0)=0≠1_R`. For A=ℂ the scalar embedding is unital. For `A=ℂ⊕M₂(ℂ)`,
  use complementary corners of trace 1/2 and 1/2, and split the second into two equivalent
  projections of trace 1/4; their units sum to `1_R`, so this embedding is unital.
- `M_n(ℂ)` is finite, and `B(ℓ²)` is not: the unilateral shift S has `S*S=1` and `SS*≠1`.
- `M_n(ℂ)` is not of type II₁ (rank-one projections are minimal) and `B(ℓ²)` is not finite; the
  hyperfinite factor R is of type II₁.
- In `M₂(ℂ)`, `e₁₁≼1` (take `v=e₁₁`) but `e₁₁≁1`; in `B(ℓ²)`, `1∼1−e₀e₀*` through the shift
  although the two projections differ, so Schröder–Bernstein holds only up to equivalence.
- On `M₂(ℂ)` the state `x↦x₁₁` is not tracial (`e₁₂e₂₁=e₁₁` and `e₂₁e₁₂=e₂₂`); on the
  nonfactor `ℂ⊕ℂ` every `t·pr₁+(1−t)·pr₂`, `t∈[0,1]`, is a tracial state, so uniqueness needs
  the factor hypothesis.

### Examples

- `M_n(ℂ)` has the unique tracial state `tr/n`; `B(ℓ²)` has none, since 1 is the sum of two
  projections equivalent to 1.
- The hyperfinite II₁ factor R attains every trace value in [0,1], and contains `M_n(ℂ)` unitally
  for every n≥1.

### Dependencies

- Layers 2–4; V2's ultraweakly closed ideal classification; SelfAdjointSpectralTheory SA-B05.
- V4.0.Fields, V4.0.Decomposition and OptimalTransport for measurable trivialization.

## Layer 6: Tracial standard form and semifinite factors

For arbitrary finite von Neumann algebras define faithful normal finite
traces on the positive cone and their bounded linear extensions, including
nonfactor algebras. Define normal semifinite traces by additivity, positive
homogeneity, monotone-supremum preservation and `τ(x*x)=τ(xx*)`, with
faithfulness a separate property. Semifiniteness means ultraweak density
of the finite-trace ideal; prove its equivalent projection criterion that
every nonzero projection majorizes a nonzero finite-trace projection.
Construct a faithful normal semifinite trace on every semifinite algebra (for factors:
Peterson, Theorem 4.9.4, p. 78; the general definitions: Anantharaman–Popa, Definitions
8.3.1–8.3.2, pp. 124–125).
Use the central finite/properly-infinite splitting of V5. On a finite
algebra with center-valued trace T, take a maximal orthogonal family
of supports z_i of normal traces `ω_i∘T`, prove these supports central
and summing to one, and sum their faithful normal tracial states on
z_iM. This directly constructs the trace without a general weight API;
on semifinite infinite pieces choose a finite projection e of full
central support and exhaust 1 by orthogonal e_i≼e, using central
partitions when necessary. Sum the transferred corner traces. Prove
existence of a faithful normal tracial state on a nonzero finite algebra exactly
when it is σ-finite. Retain normal semifinite tracial weights for arbitrary
finite algebras, including the zero trace on the zero algebra.
Prove finite-trace projection exhaustion, restriction, corner and tensor
comparisons. These tracial-weight definitions precede V10's Lp construction;
V11 builds general nontracial weights in the same vocabulary.
*Needs:* V5's central splitting and center-valued trace, V4.Normality's normal functionals and
supports, the type decomposition below for the semifinite pieces, Mathlib `ℝ≥0∞`.

For a faithful normal tracial state τ construct L²(M,τ) as the
GNS completion, left and right actions, their norm bounds, the dense
canonical map, tracial inner product, conjugation `J(xΩ)=x*Ω`, and `JMJ=M'`
(Anantharaman–Popa, §7.1, pp. 97–100; Peterson, §4.5, pp. 66–68). Prove completeness
of the operator unit ball for the L² metric and its strong-topology equivalence on bounded
sets. Construct the hyperfinite tensor model from the compatible algebras `M_(2^n)(ℂ)` and
product trace; prove its GNS closure is a II₁ factor.
*Needs:* V0's GNS, V4.Normality, V5's trace, Mathlib `Matrix` for the `M_(2^n)(ℂ)` tower.

For an arbitrary faithful normal semifinite trace construct L² from
the finite square-integrable ideal with inner product ⟨x,y⟩=τ(x*y). Build its
left/right actions and `JΛ_τ(x)=Λ_τ(x*)`; the unit vector Ω
is present only when τ(1)<∞. Prove the commutant and finite-corner
approximation identities for this general trace representation.
*Needs:* the semifinite trace above and V0's GNS on the square-integrable ideal.

Define type II∞ as a factor with finite diffuse nonzero projections and infinite
identity. Prove finite joins of finite projections are finite, then prove a separably acting infinite factor with a finite diffuse nonzero
corner is an amplification of that corner by B(ℓ²). Construct and characterize the faithful
normal semifinite trace, independent of a matrix decomposition up to positive scalar, with
additivity, homogeneity, unitary invariance, monotone continuity and `Tr(x*x)=Tr(xx*)`.
For a σ-finite concrete semifinite factor prove its trace on positive elements admits
a sum of vector-functionals with an orthogonal family, via finite-trace projection
exhaustion and the finite-functional density operators of V4.Normality. For a σ-finite type II∞ factor, identify projection
equivalence classes with [0,∞] using its chosen faithful normal semifinite
trace, and characterize finite projections by finite trace, and prove all infinite projections in a separable II∞ factor are equivalent. Develop
the complete type decomposition by central projections and characterize type III by absence
of nonzero finite projections (Peterson, Theorem 3.3.1 and Corollary 3.3.2, pp. 49–50, and
Theorem 3.3.9, p. 52, for the commutant; the trace comparison of projections: Peterson,
Proposition 4.9.5, p. 79; Anantharaman–Popa, Corollary 8.3.5 and Propositions 8.3.6 and 8.3.8,
pp. 126–127). Type I traces, finite traces and semifinite traces must use
the same positive-cone vocabulary. For V4.0.Decomposition central decompositions prove
each type-I/II/III central projection is diagonal and its measurable
support consists almost everywhere of fibers of that type. Include
the type-Iₙ and II₁/II∞ subdivisions.
*Needs:* V5's comparison theory and halving lemma, V3's type I classification, V4.Normality's
density operators, V4.0.Decomposition for the fibrewise statement, Mathlib `ℝ≥0∞`.

**Checks.**

- On `B(ℓ²)` the canonical trace has `Tr(p)=rank p`, is semifinite (finite-rank projections
  increase to 1) and not finite (`Tr(1)=∞`); it is unique up to a positive scalar, so a definition
  normalizing `Tr(1)=1` would admit no trace here.
- On `R_(0,1)=R⊗̄B(ℓ²)` with `Tr=τ⊗Tr`, `Tr(1⊗e₀₀)=1`, `Tr(p⊗e₀₀)=τ(p)` and `Tr(p⊗1)=∞` for
  `τ(p)=1/2`; the trace values of projections fill `[0,∞]`, whereas `B(ℓ²)` gives `ℕ∪{∞}` and `R`
  gives `[0,1]`: this is the II∞/I∞/II₁ distinction in the definition.
- The zero functional on a nonzero algebra is a normal semifinite trace that is not faithful;
  `x↦‖x‖` is faithful on positive elements but not additive (`‖e₁₁+e₂₂‖=1≠2`), so additivity is
  not implied by the other clauses.
- `M₂(ℂ)⊗̄B(ℓ²)=B(ℂ²⊗ℓ²)` has minimal projections and is of type I∞, not II∞, although its
  identity is infinite; `R` has finite identity and is II₁, not II∞: the two clauses of the II∞
  definition exclude these two cases respectively.

Write `R_(0,1)=R⊗̄B(ℓ²)` for the hyperfinite type II∞ model, with
product trace normalized by a rank-one projection in the B(ℓ²) factor.

**V6.FullCornerType — finiteness and full-corner type III.** For r≤p,
prove r is finite in pMp iff it is finite in M: any partial isometry
witnessing equivalence to a subprojection of r lies in rMr⊆pMp.
For c(p)=1, every nonzero projection q has qMp≠0 by V2's
central-support/kernel comparison. Polar decomposition then gives a
nonzero subprojection of p equivalent to a subprojection of q.
Consequently M has a nonzero finite projection iff pMp does.
For nonzero M and full p, deduce M is type III iff pMp is type III;
combine V2's corner-factor theorem with injectivity on the center under
z↦zp to prove factoriality in both directions. This is a projection/
corner theorem before V11; it does not identify finite with infinite
semifinite corners. V10.AffineType consumes this comparison.
*Needs:* V2's central-support/kernel theorem, corner-factor theorem and polar-part membership (PolarDecomposition PD-B24); the
finite-projection definitions above.

**V6.LatticeTypes — internal projection-logic type criteria.** Consume
V5.LatticeFinite and V3's abelian/minimal-projection classification. A nonzero
projection e is abelian exactly when the interval [0,e] is Boolean. For
arbitrary M prove typeI iff every nonzero projection dominates a nonzero
abelian projection. Existence of one atom is a typeI criterion only for a
factor; ℂ⊕R_II1 has an atomic center and an atom but is not typeI. When the
center is atomic, M is typeI iff every minimal central summand has an atom.

Recover the logic center by `q=(q∧z)∨(q∧z')` for every q. In a nonzero factor,
prove the lattice criteria: typeI iff an atom exists; typeII₁ iff the lattice
is atomless and modular; typeII∞ iff it is atomless and nonmodular but some
nonzero interval [0,p] is modular; typeIII iff every nonzero interval is
nonmodular. These are consequences of the actual type definitions, not a
replacement notion of finiteness. Recover typeI_n, for n≥1, by n orthogonal atoms
joining to the identity, and retain V6's infinite-cardinality refinements.
For a nonzero central projection z, prove zM is homogeneous typeI₂ iff z=e∨f for
two orthogonal abelian projections e,f with central supports both z. Thus
the typeI₂ central part is the supremum of those nonzero central projections,
and is zero when there are none; it is recognizable from the lattice. For
each n≥1, generalize the criterion on a nonzero central part z to n
full-central-support abelian orthogonal summands for homogeneous I_n. Prove every projection orthoisomorphism transports these central parts,
using the lattice criteria before invoking Dye. Also recover every nonfactor
central type part intrinsically. Let z_I be the supremum of central supports
of nonzero Boolean-interval projections, z_sf the supremum of central
supports of nonzero modular-interval projections, and z_fin the greatest
central z with [0,z] modular. Prove
`z_III=1−z_sf`, `z_II1=z_fin∧(1−z_I)` and
`z_IIinf=z_sf∧(1−z_I)∧(1−z_fin)`. Within z_I identify each nonzero homogeneous
I_κ central part z, for nonzero cardinals κ, by a family of κ orthogonal
abelian projections of central support z joining to z. Prove the finite
and infinite cardinal cases and uniqueness of κ for each such nonzero
part. Treat the zero central part separately, with no homogeneous
multiplicity assigned to it. On a factor κ is the cardinality of any
maximal orthogonal atom family. Derive these characterizations from V3/V6's
actual central decomposition. No state reconstruction is an input.
*Needs:* V5.LatticeFinite, V3's abelian and minimal projections, the central type decomposition
above; Mathlib `IsModularLattice` and Boolean algebras.


### Examples

- `B(ℓ²)` with its canonical trace is a semifinite factor of type I∞.
- `R_(0,1)=R⊗̄B(ℓ²)` is the hyperfinite type II∞ factor, with product trace normalized by a
  rank-one projection of `B(ℓ²)`.

### Dependencies

- Layers 2–5, with V4.Core's canonical trace of B(H).

## Layer 7: Hilbert modules, coupling dimension, and index

**V7.StandardAmplifications — normal modules at arbitrary cardinality.** For a
finite factor N with its faithful normal normalized trace τ, define a normal
Hilbert N-module to be a complete complex Hilbert space H and a normal unital
star representation of N on H. Include the zero Hilbert space. Build closed
submodules, bounded intertwiners, adjoints, unitary equivalence, orthogonal
Hilbert sums and commuting left/right actions; a right action is a left action
of N^op. Reuse native bounded complex linear maps, linear isometries,
`IsStarProjection`, commutants and `lp (fun j : J => G) 2`, where
G=L²(N,τ) is V6's tracial GNS space. Write this last space as S_J and construct
its canonical unitary with `G ⊗̂ ℓ²(J)`, its coordinate maps ι_j:G→S_J and
the diagonal normal left N-action. All index types J and orthogonal-sum
index types are arbitrary; N finite does not imply G separable.

Consume V4.Normality's normal-functional vector decomposition and normal
representation amplification, V6's faithful standard left/right actions,
and V2's completed tensors. Own the following explicit standard-model
adapter. Decompose H as an orthogonal sum of cyclic reducing N-submodules
using a maximal orthogonal family of cyclic subspaces. For a unit cyclic
vector η_i, V4 represents its normal positive functional on the faithful
standard G by a square-summable family ξ_(i,n) in G. The rule
`xη_i ↦ (xξ_(i,n))_n` is isometric on the dense cyclic orbit, since both
inner products are the same functional evaluated at x*y. Extend it to the
closed cyclic submodule, then sum these isometries. This constructs an
N-linear isometry `U:H→S_J`, with J=I×ℕ for a set I of cyclic summands;
the zero module may use J=∅. One can choose I with cardinality at most that
of the underlying H by choosing distinct unit vectors in its orthogonal
summands. Thus an actual set of amplification coordinates suffices, not a
proper class or a fixed countable bound. When H is separable, I is countable
and this construction gives a countable amplification.

State these constructions universe-polymorphically (the standard-amplification model of a normal
module: Anantharaman–Popa, Proposition 8.2.2, p. 124). For two given models
lift their carriers and index types to a common sufficiently large universe
and use the disjoint sum of the lifted index sets. Construct the canonical
isometries for these lifts and prove all action, trace and dimension
comparisons below invariant under them. Do not assume that every index type
lives in one fixed small universe or replace a large Hilbert basis by ℕ.
*Needs:* V4.Normality's vector decomposition and amplification, V6's standard left and right
actions, V2's completed tensors, Mathlib `lp (fun j : J => G) 2`.

**V7.AmplificationTrace — the normalized product trace.** (The canonical trace on the commutant
of a tracial module: Anantharaman–Popa, Proposition 8.4.2, p. 128.) For every J identify
the commutant of the left N-action on S_J with
`A_J=N^op ⊗̄ B(ℓ²(J))`, using the right standard action
`ρ(b^op)(xΩ)=xbΩ`. This identification is an early matrix-amplification
consequence of V2 and V6, before the group examples of V8 or general standard
forms of V11: the coefficient `T_ij=ι_i* T ι_j` of a commuting operator
lies in the standard commutant, and its finite matrix compressions recover T
strongly. Prove the converse, membership, multiplication, adjoint, coordinate
and normality laws. The empty amplification acts on zero and is treated as
the zero algebra, not a nonzero factor.

For a positive bounded T∈A_J define

```
Tr_J(T) = ∑' j : J, τ_op(T_jj)
        = sup {∑ j∈F, τ_op(T_jj) : F⊆J finite},
```

where `τ_op(ρ(b^op))=τ(b)`. Use the nonnegative value of the normalized
trace on each positive diagonal coefficient, with values in `ℝ≥0∞`.
Construct this normal faithful semifinite tracial weight in V6's existing
positive-cone vocabulary; do not introduce a second weight carrier. Prove
additivity, nonnegative homogeneity, monotone-net continuity, faithfulness
and `Tr_J(T*T)=Tr_J(TT*)`. For the last identity, compress a column of T to
finite coordinate sets, apply normality of τ_op to the increasing sums
`∑_i T_ij* T_ij`, and interchange the two nonnegative extended sums over i,j;
the finite trace identity exchanges each `T_ij* T_ij` with `T_ij T_ij*`.
No countable enumeration of J or interchange with a nonmonotone limit is
used. For semifiniteness put P_F=∑_(j∈F)ι_jι_j*. The positive operators
`T^(1/2) P_F T^(1/2) ≤ T` increase strongly to T and have finite trace
equal to `Tr_J(P_F T P_F)≤|F|‖T‖`. This is an increasing finite-trace
approximation from below; P_F T P_F itself need not be below T.

For ξ∈ℓ²(J) define the positive rank-one operator
`θ_ξ(v)=⟨ξ,v⟩ξ`, including θ_0=0. Prove
`Tr_J(b⊗θ_ξ)=τ_op(b)‖ξ‖²` for positive b∈N^op. For ‖ξ‖=1,
θ_ξ is the rank-one orthogonal projection, so its amplification
normalization is1 when b=1.
In particular `Tr_J(1)=∑'_(j∈J)1`, equal to |J| for finite J and ∞ for
infinite J, and `Tr_∅(0)=0`. Prove agreement on finite matrix corners
with the normalized N^op trace times the **unnormalized** matrix trace,
and agreement with V6's tracial tensor/corner comparisons. This fixes the
product trace even when the amplification is not sigma-finite.

For an injection f:J→K construct the coordinate zero-padding N-linear
isometry V_f:S_J→S_K. The nonunital corner map `T↦V_f T V_f*` preserves
Tr on all positive T; prove this from its diagonal coefficients. Establish
identity/composition, disjoint-union block sums and all reindexing/lift
laws. This is extension by zero, not the generally trace-multiplying map
T↦T⊗1. For an arbitrary N-linear unitary between standard amplifications,
prove positive-trace invariance by applying the preceding tracial identity
to its off-diagonal block times T^(1/2) in the common disjoint-sum
amplification. Deduce independence of an orthonormal basis in the
amplification Hilbert space. This argument uses the diagonal construction
and zero-padding laws, not a prior dimension-invariance theorem.
*Needs:* V6's tracial GNS and `JMJ=M′`, V2's matrix amplification and tensors, V6's
semifinite-trace vocabulary, Mathlib `ENNReal.tsum_comm`.

**V7.Dimension — embedding and index-set independence.** (Anantharaman–Popa, Definition 8.5.4,
p. 133; Jones, Chapter 10, pp. 61–66.) For a normal module
H and an N-linear isometry U:H→S_J, prove that `p_U=UU*` is the
orthogonal **range** projection and belongs to A_J. The adjoint of an
intertwiner is an intertwiner by the star laws. Define

```
dim_N(H) = Tr_J(p_U) ∈ ℝ≥0∞.
```

Prove independence of both U and J before using this definition elsewhere.
Given V:H→S_K, put both models in S_(J⊔K) by zero-padding. The
off-diagonal operator W=VU* is N-linear, with
`W*W=p_U` and `WW*=p_V` in their respective blocks. Thus it is a
partial isometry in A_(J⊔K); the tracial identity and the proved
zero-padding invariance equate the two traces. For a unitary module map
Q:H→H', use VQU* to prove unitary invariance. Include empty index types,
zero modules and universe lifts. Give identity/composition/restriction
and extensionality APIs so consumers do not depend on the chosen U or J.

Construct the induced normal faithful semifinite trace on the commutant
of any given module: transport the restricted weight on p_U A_J p_U
through T↦UTU*. The same common-amplification argument proves this
weight independent of U,J, on every positive bounded commutant operator,
not only on1; its value at1 is dim_N(H). When that value is finite and
nonzero, normalize by it for the commutant's tracial state. There is no
normalization by ∞ and no such state on the zero algebra.
*Needs:* V7.AmplificationTrace, V7.StandardAmplifications, V2's partial isometries.

**V7.SumsAndCorners — dimension laws.** For every set-indexed family of
normal modules (H_i), construct the normal action on its orthogonal Hilbert
sum and prove

```
dim_N(⨁_i H_i) = ∑' i, dim_N(H_i).
```

Choose models S_(J_i), use the canonical N-linear unitary between their
orthogonal sum and S_(Σ_i J_i), and apply block-diagonal trace and
nonnegative extended-sum associativity. Include zero summands, an empty
family and nonseparable sums. More generally prove that the induced trace
of every positive commutant operator T on this sum is the extended sum of
the induced traces of its positive diagonal compressions
`ι_i* T ι_i`; T need not be block diagonal. Derive it from the same
standard models and the arbitrary nonnegative matrix-sum formula. On a
closed submodule and its orthogonal
complement prove dimension additivity and monotonicity; dimension0 is
equivalent to the zero Hilbert space. Do not subtract ∞ or infer equality
of infinite-dimensional submodules from equality of their scalar dimensions.
For a bounded module intertwiner, its polar partial isometry identifies
the orthogonal complement of its kernel with the closure of its range;
deduce the corresponding extended dimension sum and comparison laws.

Retain standard-module dimension1 and
`dim_N(L²(N)q)=τ(q)` for projections q∈N. For nonzero p∈N prove
`dim_(pNp)(pH)=dim_N(H)/τ(p)` with normalized trace τ(p)^(-1)τ on pNp;
the standard corner identification sends
`aΩ_(pNp)↦τ(p)^(-1/2)aΩ_N` into pL²(N)p. Prove this rescaling and
the general module comparison by the standard models and projection
comparison of V5. When both acting factors are finite and H≠0, retain
the commutant-corner formula with its normalized commutant trace, the
reciprocal dimensions, and the original vector-support formula
`dim_N(H)=τ_N(q_ξ)/τ_(N')(p_ξ)` for ξ≠0, where p_ξ projects onto
closure(Nξ) and q_ξ onto closure(N'ξ) (the Murray–von Neumann coupling constant:
Anantharaman–Popa, pp. 135–136; Jones, Chapter 10). Prove its vector independence;
the two support projections lie in different algebras. Retain the
cyclic/separating-vector criteria at dimension≤1/≥1, with the zero module
and the stated finite-commutant hypotheses handled separately where used.
These finite-factor statements use V4–V6 and the present trace/comparison
construction; they do not consume V10's later Lp theory or V11.
*Needs:* V7.Dimension and V7.AmplificationTrace, V5's projection comparison, V6's corner traces,
V4–V6 for the finite-commutant statements.

**V7.CountableAndTypeI — agreement and classification scope.** For a
separable normal module, compare its countable standard model with the
arbitrary model and prove the dimensions equal, with the same rank-one
normalization. This recovers the preceding countable sum and corner laws.
Classify separable modules of a fixed finite factor by their attainable
dimensions; do not assert scalar classification of arbitrary nonseparable
modules. For N of type II₁ with separable predual, retain realization of
every dimension in [0,∞] by separable modules. For nonzero separable
modules prove the commutant type II₁ exactly when dimension is finite,
and type II∞ exactly when dimension is infinite (Anantharaman–Popa, Propositions 8.5.5, 8.6.1
and 8.6.2, p. 134). The zero module is separate.

For N=M_m(ℂ), m≥1, construct every normal module as `ℂ^m⊗K` and prove
`dim_N(H)=d_ℂ(K)/m` and N'=B(K), where d_ℂ(K) is the extended sum of1
over an orthonormal Hilbert basis of K, not finite-dimensional `finrank`
applied to an infinite-dimensional space. Prove basis independence, the
finite value k, the infinite value∞ and the zero value0. For separable H,
retain attainable dimensions `{k/m:k∈ℕ}∪{∞}`, commutant type I_k for
0<dim K=k<∞ and type I∞ for infinite-dimensional separable K. Retain
the full arbitrary-cardinality multiplicity Hilbert space in the general
module equivalence; the common value∞ does not identify distinct uncountable
multiplicities. Prove compatibility with all preceding finite-factor
dimension, corner and direct-sum APIs.
*Needs:* V7.Dimension, V7.SumsAndCorners, V3's type I classification, V6's II∞ characterization.

**V7.Index — unrestricted normal inclusions.** For a unital inclusion of
II₁ factors N⊆M as von Neumann algebras, restrict the standard normal
M-action on L²(M) to N and define `[M:N]=dim_N L²(M)` using the
arbitrary-amplification dimension just constructed. No separable-predual
or countable-generation premise is added. The normalized trace of M
restricts to that of N. Prove invariance under normal trace-preserving
isomorphisms of inclusions, index≥1 and index1 iff N=M. For the last
claims the closed copy L²(N)⊂L²(M) has dimension1; add its orthogonal
complement and use faithfulness of dimension, without subtracting ∞.

Construct the trace-preserving normal conditional expectation E_N:M→N
directly from the L² projection, with norm1, positivity, complete positivity,
bimodularity and uniqueness (Umegaki's theorem: Peterson, Theorem 6.2.2, p. 98;
Anantharaman–Popa, §9.1, pp. 139–143; Hiai, Theorem 6.4). To show the projected vector y is a bounded
element of N, use right-N equivariance: on the dense NΩ,
`‖ya‖₂≤‖x‖‖a‖₂`. Its bounded left multiplication commutes with the
right standard action, hence lies in N by V6; its value at Ω is y.
Positive matrix/vector coefficients give positivity and the matrix versions;
faithfulness of the finite trace proves normality on increasing bounded
positive nets. This construction precedes the modular expectation theorem.

For a finite-index N⊆M prove the restriction-of-scalars law
`dim_N(H)=[M:N] dim_M(H)` for every normal M-module H. On the
commutant of L²(M) the induced N-module trace has finite value [M:N]
at1; restrict it to the right M^op action and use uniqueness of its
normalized trace. The matrix and arbitrary-sum formulas then identify
its restriction on M^op⊗̄B(ℓ²(J)) with [M:N] times the standard
product trace, yielding the formula on each representing range projection.
Deduce multiplicativity for nested finite-index inclusions. This proof
uses the present dimension/commutant trace, not a later basic construction
or Connes-fusion engine. Prove `[N⊗̄M_n:N]=n²` for n≥1 by the n²
orthogonal standard summands, and for `M_m⊂M_(mk)` identify dimension
with the free left-module rank k², m,k≥1.

For every index set I prove `dim_N(S_I)=∑'_(i∈I)1` directly from its
identity range projection, and transport this value along any supplied
N-linear unitary. This general corollary has no group-theoretic input.
*Needs:* V7.Dimension, V6's standard form and `JMJ=M′`, V5's trace, V4.Normality; the induced
commutant trace of V7.Dimension for the restriction-of-scalars law.

**V7.GroupApplications — after the V8 models.** V8.SubgroupCosets constructs
its actual arbitrary-index coset unitary without a dimension input. When
L(Η) is a factor, it consumes the preceding corollary: dimension is the finite subgroup index
when finite and∞ when infinite. Its dimension/index comparison and the
following test are applications, not prerequisites of V7's general
construction or index laws. After V8's group-factor and tensor models,
for the separable hyperfinite factor R and an uncountable free group F_I,
prove the inclusion R⊂R⊗̄L(F_I) has index∞ on the actual amplification
L²(R)⊗̂ℓ²(F_I); no isometry into a separable amplification is required.
Retain V9's finite formal-degree/covolume and commuting-action applications
with their stated hypotheses. This layer owns elementary dimension, index
and bimodule theory; Subfactors continues to own its basic constructions,
finite bases and later towers.
*Needs:* V8.SubgroupCosets's coset unitary, V8's group factors and tensor models,
V7.Dimension's identity-range corollary.


**Checks.**

- The zero module has dimension 0, and an empty index type gives the zero model `S_∅`.
- Over `N=M₂(ℂ)` with its normalized trace, `L²(N,τ)` has dimension 1 and the defining module
  ℂ² has dimension 1/2; a dimension normalized by the unnormalized trace would give 2 and 1.
- Over `N=ℂ`, `ℓ²(I)` for an uncountable set I has dimension ∞ and admits no N-linear isometry
  into the separable model `S_ℕ`, so the index set J must be allowed to be uncountable.

### Examples

- For `N=M_m(ℂ)`, m≥1, every normal module is `ℂ^m⊗K`, of dimension `dim K/m`.
- For a subgroup of finite index, `[L(Γ):L(Γ₀)]=[Γ:Γ₀]`.

### Dependencies

- Layers 2, 4 and 6.

## Layer 8: Group algebras, actions, and discrete crossed products

For arbitrary discrete Γ construct left/right regular representations on ℓ²(Γ), the group
von Neumann algebra, its mutual-commutant theorem, faithful normal canonical trace, Fourier
coefficients, ℓ² norm formula and uniqueness of coefficients (Peterson, Theorem 5.1.3 and
Proposition 5.1.4, p. 83; Anantharaman–Popa, §1.3, pp. 5–12). A coefficient function denotes
an operator only when the associated convolution operator is bounded. Identify `L(ℤ)` with
`L∞(𝕋)` by Fourier transform and `L(ℤ/n)` with its cyclic matrix model. Prove the center
criterion and factoriality iff every nonidentity conjugacy class is infinite (Peterson, Theorem
5.1.6, p. 84); prove free
nonabelian groups are ICC and supply every projection trace in their factors using the
infinite cyclic subgroup. For subgroup inclusions Γ₀⊂Γ with Γ₀ infinite and both groups ICC (every nonidentity conjugacy class infinite), identify
`[L(Γ):L(Γ₀)]=[Γ:Γ₀]` by the coset decomposition of the normal module. Establish finiteness, direct finiteness `ab=1 ⇒ ba=1`, and the coefficient embedding of the group algebra. Prove direct finiteness of F[Γ] for
every characteristic-zero field F by descending the finitely many coefficients to a
finitely generated subfield admitting an embedding into ℂ, and using the complex group
von Neumann algebra.
*Needs:* Layer 1's bicommutant theorem, Mathlib `lp`, `MonoidAlgebra`, `fourierBasis` on `L²(𝕋)`,
`Matrix` for `L(ℤ/n)`; V5's trace and comparison; V7 for the index identity; field embeddings
(`IsAlgClosed` lifting) for the direct-finiteness descent.

**Checks.**

- `L(ℤ/2)` on `ℓ²(ℤ/2)=ℂ²` is the algebra of circulant matrices `[[a,b],[b,a]]≅ℂ²` with
  `τ=a`; `L(ℤ)≅L∞(𝕋)` with `u_1↦z` and `τ(f)=∫f`; both are abelian, so neither is a factor, as the
  ICC criterion predicts for abelian Γ≠1.
- In `F₂=⟨a,b⟩` the conjugates `b^n a b^(−n)` are pairwise distinct, so the class of a is
  infinite and `L(F₂)` is a factor; the indicator of an arc of length `2πt` in
  `L(⟨a⟩)≅L∞(𝕋)⊂L(F₂)` is a projection of trace t, so every value in [0,1] is attained and the
  factor is diffuse, hence II₁.
- The coefficient function of `Σ_(n≥1)2^(−n)u_n∈L(ℤ)` is `2^(−n)`, square summable with
  `ℓ²`-norm² `Σ 4^(−n)=1/3`, while a finite combination of group unitaries has finite support:
  coefficient functions, not finite sums, describe the elements.

**V8.SubgroupCosets — algebraic, bounded and completed comparisons.** For arbitrary discrete Γ and subgroup Η, use the coset unitary `ℓ²(Γ)≃⨁_iℓ²(Η)` to construct the faithful normal inclusion `L(Η)↪L(Γ)`. Construct the trace-preserving normal conditional expectation `E_Η:L(Γ)→L(Η)` by compressing to `ℓ²(Η)` and the mutual-commutant identification, with Fourier coefficient truncation, complete positivity, bimodularity and uniqueness. For chosen representatives of Ηg_i and finite index d, prove the exact finite expansion `x=Σ_(i=1)^d E_Η(xu_(g_i)*)u_(g_i)` for every x∈L(Γ), and its coefficient uniqueness. Thus L(Γ) is a free algebraic left L(Η)-module of rank d in this finite-index setting. First verify the identity on the group ring and extend each finite normal coefficient map to all x; do not infer it from formal infinite sums. At arbitrary index, prove instead the onto Hilbert-module unitary `L²(L(Γ))≃⨁_i L²(L(Η))` given by its coset coordinates, including uncountable orthogonal Hilbert sums. The coefficient family is square-summable and its finite partial sums converge in L²; no operator-norm or algebraically finite expansion is asserted. When L(Η) is a factor, compare with V7's normal module dimension, yielding `[Γ:Η]` at finite index and ∞ at infinite index under the scalar extended-dimension convention. For a possibly nonseparable coset module, construct this dimension on the actual amplification `L²(L(Η))⊗̂ℓ²(I)` using V6’s product semifinite trace on `L(Η)^op⊗̄B(ℓ²(I))`: the range projection is1 and its trace is the extended sum `Σ_(i∈I)1`. This supplies the required arbitrary-index dimension comparison without classifying nonseparable modules by that scalar alone. For Η={1}, Γ=ℤ, the uniformly convergent bounded function `Σ_(n≥1)2^(-n)z^n` in L(ℤ)=L∞(𝕋) is not a finite linear combination of coset unitaries. This distinguishes the infinite-index completed result from V3's algebraic group-ring basis.
*Needs:* the group von Neumann algebra above, V7.AmplificationTrace and V7.Dimension, V6's product
trace, Mathlib `lp` reindexing along coset representatives.

Define normal group actions, fixed-point algebras, inner/outer automorphisms, spatial
implementation, and proper outerness by vanishing intertwiners. Prove equivalence of proper
outerness and outerness for factors. Include the Pauli Klein-four action on M₂ with no
honest unitary implementation on ℂ², the innerness of automorphisms of B(H), the outer
free-group generator interchange, and strong-star continuity of translations on L∞(ℝ)
with failure of norm continuity. For countable groups acting nonsingularly on standard
σ-finite measure spaces, construct the L∞ automorphism and Radon–Nikodym unitary,
measure-class and cocycle formulas, using Mathlib `ErgodicSMul`; ergodicity iff scalar fixed functions, essential freeness
iff proper outerness, and freeness of ergodic abelian actions whose induced action on L∞ is faithful.
*Needs:* Layer 1's topologies, V4.Normality, Mathlib `ErgodicSMul`, Radon–Nikodym derivatives and
`Lp` multiplication; Peterson, §5.2, pp. 87–92, and Anantharaman–Popa, §1.4, pp. 12–18, are the
sources.

**V8.RegularL2 — the left-regular representation of a locally compact group.** For every
locally compact Hausdorff group G with a regular left Haar measure μ, define left translation
`(λ_s f)(r)=f(s⁻¹r)` on `L²(G,μ)` as `Lp.compMeasurePreserving` of the measure-preserving map
`r↦s⁻¹r`. Prove that each λ_s is unitary, `λ_(st)=λ_sλ_t`, `λ_1=1`, and that `s↦λ_s f` is
norm continuous for every f, by specializing Mathlib's
`MeasureTheory.Lp.instContinuousSMulDomMulAct`: G is an R1 Borel space, left multiplication is a
continuous measure-preserving action, and a regular Haar measure is locally finite and inner
regular on finite-measure sets. Prove the same translation continuity on `L^p(G,μ)` for every
1≤p<∞, in particular on `L¹`; V8.LCHRegularNormalBridge and V11 consume it. For f∈L¹(G,μ)
define the integrated operator `λ(f)=∫f(s)λ_s dμ(s)` strongly, as the Bochner integral of the
norm-continuous orbit `s↦λ_sξ` against f on a σ-compact carrier of f (AmenableGroups Layer 7's
localization), through `ContRepresentation.integratedOperatorL1` where its hypotheses apply, and
prove `‖λ(f)‖≤‖f‖₁`. Prove `λ(f)λ(g)=λ(f*g)` for Layer 7's convolution,
`λ_sλ(f)=λ(L_sf)` with `(L_sf)(r)=f(s⁻¹r)`, and the adjoint formula `λ(f)*=λ(f*)` with
`f*(s)=c(s)·conj(f(s⁻¹))`, where `c=Measure.modularCharacter` is Layer 7's right-translation
factor, `∫f(xg)dμ(x)=c(g)∫f dμ`, and Layer 7's inversion formula `d(μ∘inv)=c dμ` is the
substitution used. Prove nondegeneracy: for Layer 7's kernels h_U, `λ(h_U)ξ→ξ` for every
ξ∈L², from `‖λ(h_U)ξ−ξ‖≤∫h_U(s)‖λ_sξ−ξ‖dμ(s)` and strong continuity. Prove faithfulness of
λ on L¹: if λ(f)=0 then `f*h_U=λ(f)h_U=0` in L² for every U, hence almost everywhere, and
`‖f‖₁=lim_U‖f*h_U‖₁=0`. For abelian G prove `λ(f)λ(g)=λ(g)λ(f)` from
commutativity of convolution, so the norm closure of λ(L¹(G)) is a commutative C*-algebra, the
reduced group C*-algebra C*_r(G), nonunital when G is not discrete. Prove compatibility with the
discrete case, where μ is counting measure and λ_s is the permutation unitary of ℓ²(G) of the
group von Neumann algebra above, and that the von Neumann algebra generated by λ(G) equals the one
generated by λ(L¹(G)) (the kernels h_U recover each λ_s strongly). Include the trivial group,
where L²=ℂ and λ(f)=f(1), and f=0, where λ(0)=0.
*Needs:* Mathlib `Lp.compMeasurePreserving`, `Lp.instContinuousSMulDomMulAct`, Haar measure and
`Measure.modularCharacter`; AmenableGroups Layer 7 (σ-compact localization of `L¹` functions,
convolution, inversion formula, kernels h_U); Tau Ceti `ContRepresentation.integratedOperatorL1`;
the group von Neumann algebra of this layer for the discrete comparison.

**Checks.**

- For G=ℤ with counting measure, λ_1 is the bilateral shift and λ(f) is convolution by f, unitarily
  multiplication by `f̂(z)=Σ_n f(n)zⁿ` on L²(𝕋). For `f=δ_(−1)+iδ_0+δ_1`, `f̂(e^(iθ))=2cos θ+i`
  has supremum modulus √5, so `‖λ(f)‖=√5<3=‖f‖₁`: the bound `‖λ(f)‖≤‖f‖₁` is not an equality,
  and a definition making λ an isometry of `L¹` would be wrong.
- For G=ℝ with Lebesgue measure, `s↦λ_s` is not norm continuous: after the Fourier transform λ_s
  is multiplication by `e^(isξ)`, so `‖λ_s−1‖=sup_ξ|e^(isξ)−1|=2` for every s≠0; strong
  continuity is the right notion. For `0<ε≤1/2`, the kernel `h_ε=(2ε)⁻¹1_[−ε,ε]` and `f=1_[0,1]` give
  `‖λ(h_ε)f−f‖₂²=ε/3` (the difference is `(r+ε)/(2ε)` on `[−ε,0]`, `(r−ε)/(2ε)` on `[0,ε]`,
  and symmetrically at 1), which tends to 0 as the nondegeneracy statement requires.
  Each of these four disjoint ramps contributes ε/12, giving 1/12 at ε=1/4. At ε=1 the
  convolution equals 1/2 on [0,1], with linear tails on [−1,0] and [1,2], so the error is
  `1/4+1/12+1/12=5/12`, not 1/3; the small-radius hypothesis cannot be dropped.
- The adjoint convention is pinned on the affine group `{(a,b):a>0,b∈ℝ}`, `(a,b)(α,β)=(aα,aβ+b)`,
  with left Haar measure `da db/a²`: right translation by `g=(α,β)` multiplies the measure by
  `1/α`, so `c(α,β)=α` and `f*(α,β)=α·conj(f(1/α,−β/α))`; on a unimodular group (ℝ, ℤ, a compact
  group) `f*(s)=conj(f(s⁻¹))`, and the formula with `c(s⁻¹)` in place of `c(s)` would make
  `λ(f)*≠λ(f*)` on this group.

**V8.LCHRegularNormalBridge.** Before the compact-action application, supply the regular normal-action construction for every locally compact Hausdorff group G, a nonzero regular left Haar measure μ, an arbitrary concrete von Neumann algebra M⊂B(H), and an action α by normal star automorphisms with each orbit g↦α_g(x) ultraweakly continuous. No second-countability, sigma-compactness, sigma-finiteness or separability assumption is imposed on G, H or M. Prove that this continuity is equivalent to pointwise strong-star continuity, using the positive-vector norm identities for α_g(x)*α_g(x)=α_g(x*x). The zero Hilbert-space/zero-algebra case is treated separately; nonzero-vector faithfulness arguments apply to the nonzero case.

First prove that the predual representation β_g(ω)=ω∘α_(g⁻¹) is norm-continuous on every orbit in M_*. Its initial continuity is weak continuity against (M_*)*=M, and each β_g is isometric. Own the following proof adapter here, consuming Mathlib's geometric Hahn–Banach separation and BanachSpaceTheory B2's exact James criterion, rather than assuming an unproved weak-to-strong continuity principle. A compact set of weakly continuous orbit values is weakly compact. Its norm-closed convex hull is weakly compact: every continuous linear functional attains its real-part supremum on the original compact set and hence on that hull, so James applies in the Banach space M_*. For a nonnegative C_c kernel, finite partitions controlling a finite family of scalar evaluations give convex-combination approximants to its normalized weak integral; weak compactness gives the barycentre in M_* and separation gives uniqueness. Split a complex kernel into its four nonnegative real/imaginary parts. This defines the smoothed vectors without first assuming Bochner measurability of the unsmoothed orbit. Their translation estimate is bounded by ‖ω‖ times the L¹ difference of translated kernels. Consume V8.RegularL2's `L¹` translation continuity (Mathlib's domain-action continuity) and AmenableGroups Layer 7's neighbourhood-indexed kernels h_U. Thus smoothed vectors have norm-continuous orbits and converge weakly to ω. The vectors with norm-continuous orbit form a norm-closed linear subspace (the action is isometric), hence a weakly closed subspace by Hahn–Banach; conclude that this subspace is all of M_*. After this argument the predual integrals may be taken as genuine Bochner integrals.

Let A_c={x∈M : g↦α_g(x) is norm continuous}. Prove it is an invariant unital C*-subalgebra. For f∈C_c(G), define x_f by the adjoint of the bounded predual integral, equivalently ω(x_f)=∫f(g)ω(α_g(x))dμ(g) for every ω∈M_*. Prove ‖x_f‖≤‖f‖₁‖x‖ and ‖α_h(x_f)−x_f‖≤‖L_h f−f‖₁‖x‖, where L_h f(r)=f(h⁻¹r). The chosen normalized kernels shrinking to the identity give x_(u_U)→x ultraweakly, so A_c is ultraweakly dense in M. This same bridge supplies the following compact-action predual-continuity and smoothing claims; for compact G its normalized Haar average is the predual-adjoint average already specified there.

Construct K=L²(G,μ;H) and its unitary identification with L²(G,μ)⊗̂H without a separability assumption. On actual almost-everywhere classes define (π_α(x)f)(r)=α_(r⁻¹)(x)f(r) and (λ_s f)(r)=f(s⁻¹r). Prove representative independence, linearity and the bound ‖π_α(x)f‖₂≤‖x‖‖f‖₂. Consume Tau Ceti's native [`ContinuousOn.aestronglyMeasurable_of_measure_ne_top` and `AEFinStronglyMeasurable.aestronglyMeasurable_smul`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/MeasureTheory/Function/StronglyMeasurable/InnerRegular.lean#L45-L92). Use their actual `InnerRegularCompactLTTop`, Borel/R1 source and pseudo-metrizable target hypotheses on finite-measure restrictions; do not impose global sigma-finiteness or duplicate these native measurability proofs. After orbit norm continuity has been established, reuse [`ContRepresentation.integratedOperatorL1` and its vector formula](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Continuous/Integrated/Basic.lean#L104-L229) wherever their scalar-weight representation hypotheses apply, transporting multiplicative/additive notation. Its definition allows a noncommutative `AddGroup`; do not import its separate convolution theorem's `AddCommGroup`, `SFinite` and `SecondCountableTopologyEither` restrictions into that definition. Own the combined L²-vector/predual-coefficient measurability and normal-extension adapter using these primitives: every Bochner L² vector is supported, modulo a Haar-null set, on a countable union of compact sets. Obtain this from its finite-measure level sets {‖f‖≥1/n} and Radon inner approximation, with compact exhaustions up to null sets; this is a localization for that vector, not a claim that G is sigma-compact or its Haar measure sigma-finite. On these compact carriers the continuous H-valued orbit images of the countably many values approximating f are separable. Combine their strong measurability with simple-vector approximation to prove strong measurability of r↦α_(r⁻¹)(x)f(r). Use finite-carrier localization for each pair of vectors when required; no equality between a product sigma-algebra and an uncountable product's full Borel sigma-algebra is assumed.

Prove π_α is a unital star homomorphism and is faithful. For x≠0 choose ξ with xξ≠0; continuity gives a neighbourhood of the identity on which ‖α_(r⁻¹)(x)ξ‖ is bounded below. Choose a compact subset of this neighbourhood with positive finite Haar measure, and test on 1_C ξ. Prove normality by an actual predual map: with the conjugate-first inner product set ω_(ξ,η)(y)=⟨ξ,yη⟩, form ρ_(f,h)(r)=β_r(ω_(f(r),h(r))). Establish strong measurability in M_* using the norm-continuous predual action, the continuous bilinear/sesquilinear vector-functional map and the compact-carrier localization; prove ‖ρ_(f,h)(r)‖≤‖f(r)‖‖h(r)‖ and hence L¹ integrability by Cauchy–Schwarz. Its Bochner integral is the normal functional x↦⟨f,π_α(x)h⟩. V4's concrete predual and normality criteria then give ultraweak continuity of π_α and a von Neumann image. Do not interchange an arbitrary increasing net with a scalar Haar integral as a replacement for this predual construction.

Consume V8.RegularL2 for the left-regular unitary representation and its strong continuity, tensoring with H. Prove λ_s π_α(x) λ_s*=π_α(α_s(x)). Prove that π_α is the unique normal representation of M extending its restriction to the ultraweakly dense C*-subalgebra A_c. Define M⋊_αG as the von Neumann algebra generated by π_α(M) and λ(G), and prove it is generated already by π_α(A_c) and the integrated operators `∫f(s)λ_s dμ(s)`, f∈C_c(G): the chosen group kernels recover the group operators, and the ultraweak density of A_c gives the full coefficient algebra. This construction does not depend on V11's later duality. The identification of M⋊_αG with the weak closure of the regular C*-crossed product is owned by OperatorAlgebraDynamics D1, which consumes this layer.

For two faithful normal concrete realizations of the same W*-algebra and action, construct the canonical normal isomorphism of these regular crossed products matching every coefficient π_α(x) and group unitary λ_s. Prove independence using V4's normal amplification/reducing-projection/spatial representation theorem and the induced intertwiners on the corresponding L² spaces, and prove composition and uniqueness on the generated von Neumann algebra. Prove compatibility with the existing discrete construction and with the later second-countable construction. This is a regular crossed product, with the stated comparison for regular representations; it does not assert a universal normal quotient map for every covariant pair. Record the obstruction already for M=ℂ and G=ℤ: a character unitary would demand a normal point-evaluation map L∞(𝕋)→ℂ, which does not exist for nonatomic Haar measure. OperatorAlgebraDynamics D1 retains the full C*-universal property. All second-countability assumptions on V11's subsequent dual-action, Takesaki-duality and dual-weight theorems remain as written.
*Needs:* V8.RegularL2, AmenableGroups Layer 7 (kernels h_U, σ-compact localization),
Mathlib's geometric Hahn–Banach separation (`geometric_hahn_banach_closed_point`),
BanachSpaceTheory B2 (James), V4's predual and normality criteria,
V4.Normality's amplification/spatial representation theorem, Tau Ceti's measurability lemmas and
`ContRepresentation.integratedOperatorL1`, Mathlib Haar measure and Bochner integration.

**V8.CompactErgodicActions.** For an arbitrary compact Hausdorff topological group G, its normalized regular Haar probability, a nonzero unital complex C*-algebra A and an action by star automorphisms such that every orbit `g↦α_g(a)` is norm continuous, construct the Haar conditional expectation E onto A^G. Prove positivity, complete positivity, unitality, contractivity, bimodularity over A^G, and faithfulness. If A^G=ℂ1, write E(a)=φ(a)1 and prove φ is the unique invariant state, is faithful, and is tracial. No separability, metrizability or second-countability hypothesis is imposed on G or A.

Consume CompactGroups' arbitrary compact-group Peter–Weyl/Schur orthogonality and finite-dimensional unitary representation conventions. Construct the isotypic Haar projections on A and their matrix-coefficient versions, spectral subspaces, their multiplication/star relations and a norm-dense finite-orbit star algebra. Build the multiplicity spaces and invariant inner products; prove the ergodic finite-multiplicity bound `multiplicity(π)≤dim π`, conjugate-representation and positive pairing identities, and deduce φ(ab)=φ(ba) first on this algebra and then by norm continuity. These constructions generalize the existing V8 finite-multiplicity/spectral-subspace work; SU(2)'s stronger type-I classification remains its own subsequent specialization, with its existing suppliers.

For a normal action on a nonzero W*-algebra M continuous pointwise ultraweakly, own the bridge to this C*-theorem. Establish the corresponding continuity on the predual (norm-continuity of each pulled-back normal-functional orbit), and construct Haar averaging as the adjoint of its bounded predual average. Prove this expectation is normal and faithful, and that its range is M^G. Do not justify normality by interchanging an arbitrary increasing net with a scalar Haar integral. Prove that the norm-continuous elements form an invariant unital C*-algebra A_c which is ultraweakly dense in M: weak-star Haar convolutions against continuous scalar kernels lie in A_c, with norm-translation bound `‖α_h(x_f)−x_f‖≤‖L_h f−f‖₁‖x‖`; normalized kernels near the identity converge ultraweakly to x. Use the exact native Haar translation convention in that formula. Apply the C*-result to A_c, whose fixed algebra is scalar when M is ergodic, and use V1's bounded strong-star/Kaplansky approximation and V4's normal functional calculus to extend the trace identity to M. Under M^G=ℂ1, conclude that M has a faithful normal invariant tracial state and is finite. Include normalization, uniqueness and restriction/transport compatibility. The predual-continuity and averaging bridge are owned targets here, not assumed implemented APIs.

See Høegh-Krohn–Landstad–Størmer, [*Compact ergodic groups of automorphisms*, Annals of Mathematics114(1981),75–86](https://doi.org/10.2307/1971377).

For a second-countable compact group acting ergodically, prove existence of a faithful
normal invariant trace, using spectral subspaces and Haar averaging; develop finite
multiplicity and matrix-coefficient orthogonality APIs for those spectral subspaces. Prove
that SU(2) admits no ergodic action on a II₁ factor, by Wassermann's SU(2) spectral-subspace classification. Consume the SU(2) irreducibles
from RepresentationTheory/CompactGroups and the rank-one Clebsch–Gordan decomposition
from RepresentationTheory/LieHighestWeight; identify their compact group specialization.
Construct spectral multiplicity spaces, their conjugate intertwiners,
positivity/dimension bounds and the resulting type-I decomposition of every ergodic
SU(2) action.
*Needs:* RepresentationTheory/CompactGroups (Peter–Weyl, Schur orthogonality),
RepresentationTheory/LieHighestWeight (rank-one Clebsch–Gordan), V1's Kaplansky theorem, V4's
normal functional calculus and predual, the regular normal bridge above; Høegh-Krohn–Landstad–Størmer
(1981) and Wassermann (1988, 1989) are the sources.

Construct the discrete crossed product on `ℓ²(Γ,H)` by
`(π(x)f)(g)=α_(g⁻¹)(x)f(g)` and `(u_h f)(g)=f(h⁻¹g)`. Prove faithfulness and normality of π,
covariance `u_hπ(x)u_h*=π(α_h(x))`, algebraic crossed-product density, coefficient extraction
and uniqueness, adjoint coefficient `α_g(x_(g⁻¹)*)`, and convolution product for finite
sums. Construct the faithful normal conditional expectation extracting the identity
coefficient; establish bimodularity, positivity, trace extension for invariant finite or
semifinite traces, and relative commutant computations. For trace-preserving actions identify the algebraic
crossed-product trace GNS space with `ℓ²(Γ,L²(M,τ))`, prove left multiplication bounds,
and identify the generated algebra with its regular concrete realization. Prove the free-ergodic factor
criterion, outer-action factor criterion, and the MASA result for an essentially free
abelian-base action.
*Needs:* the group von Neumann algebra and actions above, V4.Normality, V5–V6 traces, Mathlib
`lp`; Peterson, §5.2, and Anantharaman–Popa, §§1.4 and 5.2, pp. 12–18 and 67–70, are the
sources.

**Checks.**

- For `ℤ/2` acting on ℂ² by the flip, `ℂ²⋊ℤ/2≅M₂(ℂ)` with `π(a,b)=diag(a,b)` and u the flip
  matrix (a free transitive action on two points gives type I₂); for the trivial action on ℂ,
  `ℂ⋊ℤ/2=L(ℤ/2)≅ℂ²`, so the crossed product of a factor by a non-outer action need not be a
  factor.
- `Ad(u)` for a unitary u∈M is inner, hence not properly outer; the flip of ℂ² is outer and
  properly outer (no element of the abelian algebra intertwines it); the Klein four-group action
  on `M₂(ℂ)` by `Ad(σ₁),Ad(σ₂),Ad(σ₃)` is inner element by element yet admits no unitary
  representation of the group implementing it (`σ₁σ₂=iσ₃`), so proper outerness is a property of
  each element and spatial implementation one of the whole action.
- For Γ=ℤ acting on ℝ by translation the indicator of `⋃_n[n,n+1/2)` is invariant and not
  scalar, so density of the subgroup in V8.DenseTranslations cannot be dropped; for Γ=ℚ the
  action is ergodic.

**V8.DenseTranslations — the locally compact dense-subgroup model.** For a Hausdorff locally compact topological group G with its Borel sigma-algebra, a regular left Haar measure μ and a countable dense subgroup Γ, define the left action by `α_γ(f)(x)=f(γ⁻¹x)`. Prove measure preservation and `ErgodicSMul Γ G μ` (`ergodicSMul_dense_subgroup`), equivalently that every Γ-invariant L∞ class is scalar. This includes noncompact and nonmetrizable G; neither finite total Haar mass nor second countability is a premise. Derive sigma-compactness from a compact identity neighborhood K and the countable cover `G=⋃_(γ∈Γ)γK`, and hence sigma-finiteness of μ. Consume native topological-group and locally-finite-measure implications where available, and prove the dense-subgroup adapters.

For the ergodicity proof consume native `MeasureTheory.Lp.instContinuousSMulDomMulAct` for the norm-continuity of left translations on L¹, explicitly adapting its domain-action convention to `λ_gφ(x)=φ(g⁻¹x)`. Prove the L¹/L∞ integral pairing, its bound and separation, and `∫φ(x)α_g(f)(x)dμ=∫φ(gy)f(y)dμ`. Thus `g↦α_g(f)` is weak-star continuous and its stabilizer is closed; Γ-invariance and density imply invariance under every g∈G. For an invariant null-measurable event choose a Borel representative A, prove the restricted measure `ν=μ|_A` is inner regular, finite on compacts and left invariant, and apply native regular/inner-regular Haar uniqueness to obtain `ν=cμ` for a finite nonnegative scalar c. Own the restricted-measure, pairing-separation and equality-of-density lemmas yielding A null or conull, including ν=0. These are explicit adapters on the existing Haar/Lp/ergodic carriers. No simultaneous pointwise representative for all g or product-Borel equality is presumed. The finite-measure native dense-stabilizer and minimal-action theorems remain applicable in their own scope; they are not the noncompact-Haar proof.

The compact model is Jones, §11.2, p. 73 (the paragraph preceding Example 11.2.17), and
Γ=ℚ⊂(ℝ,+) is Example 11.2.21, pp. 73–74. That example suggests the locally compact
generalization; the L¹-continuity and restricted-Haar argument above supplies it without
assuming metrizability. Its inputs are the pinned translation-continuity instance in
Mathlib `MeasureTheory/Function/LpSpace/DomAct/Continuous.lean` and regular Haar uniqueness in
`MeasureTheory/Measure/Haar/Unique.lean`. Recover these two examples through the same target. Under the earlier standard-measure-space hypotheses, consume V8's existing crossed-product and type criteria for their algebra models; do not infer standard Borelness or a nonmetrizable crossed-product classification from countable density alone.
*Needs:* Mathlib `ErgodicSMul`, Haar uniqueness (`isMulLeftInvariant_eq_smul_of_innerRegular`),
`Lp.instContinuousSMulDomMulAct`, the `L¹`/`L∞` pairing; V8.RegularL2; the crossed-product type
criteria of this layer for the algebra models.

**V8.BernoulliArbitraryDiscrete.** For every infinite discrete group Γ, with no countability assumption, let S be a finite set with its full powerset sigma-algebra and weights p_s≥0 summing to1, with at least two strictly positive weights; zero-weight points are allowed. Use its finite atomic probability measure μ and consume native `MeasureTheory.Measure.infinitePi (fun _ : Γ ↦ μ)` on the cylinder/product sigma-algebra, rather than reconstructing that measure. Consume [`infinitePi_pi`, `eq_infinitePi`, and `infinitePi_map_piCongrLeft`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Probability/ProductMeasure.lean) for finite cylinders, uniqueness and reindexing, and [`ProbabilityTheory.iIndepFun_infinitePi`](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Probability/Independence/InfinitePi.lean) for the measurable coordinate family; separately a.e.-measurable coordinates do not by themselves supply an a.e.-measurable uncountable joint map. Define the left Bernoulli shift `α_g(x)(h)=x(g⁻¹h)` and prove measurability, measure preservation, the action law and the induced normal star action on the actual L∞ quotient. Construct the finite-cylinder L² subspaces and prove their union dense by the product-sigma-algebra approximation theorem. Choose an orthonormal basis of the finite-base L² with constant vector1; the products of its nonconstant basis vectors at finitely many coordinates, together with1, form an orthonormal Hilbert basis of the product L². Prove orthonormality by finite-cylinder independence and completeness by cylinder density; no countable global basis is asserted.

The finite-subset Hilbert-basis argument is Jones, Example 11.2.17, p. 73; the finite-base
version uses the same argument with labels from a basis orthogonal to the constant function.
For every nonempty finite labelled support, its translation stabilizer is finite: fixing one support point injects the stabilizer into the finite support. Thus its orbit is infinite. An invariant square-summable coefficient family is constant on each orbit, so every nonconstant coefficient vanishes; invariant L² vectors are scalar and the action is ergodic. Equivalently, for cylinder events controlled by finite F, choose g outside FF⁻¹; the events and their g-translates are independent. Use finite-cylinder approximation to extend this mixing/ergodicity argument to all measurable events.

For every fixed g≠1 construct an explicitly product-measurable null set Z_g containing its pointwise fixed set. If g has infinite order use the equal-coordinate conditions on one countably infinite orbit; if it has finite order r>1 use a countable family of disjoint r-cycles, whose equal-coordinate probability is `Σ_i p_i^r<1`. Construct the countable witness coordinates explicitly and let the finite-product probability tend to zero. The full pointwise fixed set is an uncountable intersection when Γ is uncountable and is not presumed measurable on the raw product sigma-algebra: containment in Z_g proves outer measure zero, and it is measurable/null in the measure completion. Derive proper outerness of the L∞ automorphism directly from the same countable coordinate tests and the measurable null envelope, without needing raw fixed-set measurability. Distinguish this per-element measure-algebra assertion from existence of one common conull free set for an uncountable group; no uncountable union of null sets is taken.

Consume the existing arbitrary-discrete-group regular crossed-product, coefficient, expectation and free/ergodic factor APIs for this action; the invariant probability gives its faithful normal trace. Prove the base is diffuse and obtain a type II₁ crossed product without a separable-predual assertion. Recover the existing countable standard-space Bernoulli examples and fair-coin finite-subset basis as special cases. This does not expand V8's separate standard-measure-space measure-to-type criterion beyond its stated hypotheses.

Do not identify the product sigma-algebra with the full product-topology Borel sigma-algebra for uncountable Γ. If a compact-product Haar presentation is used, prove its measure/completion/Lp comparison separately through finite cylinders and regularity before transporting any statement. The probability-product construction already suffices for this full arbitrary-discrete-group theorem.
*Needs:* Mathlib `Measure.infinitePi`, `infinitePi_pi`, `eq_infinitePi`, `infinitePi_map_piCongrLeft`,
`ProbabilityTheory.iIndepFun_infinitePi`; the crossed-product, expectation and free/ergodic factor
APIs of this layer; V5's trace.

Work out these examples with freeness, ergodicity, and factor type proved rather than merely
named: translation of ℤ on ℤ (B(ℓ²ℤ)); irrational rotations; restricted direct sum of a finite
abelian group on its compact product; dense countable subgroup translations on a compact
group; Bernoulli shifts of countably infinite groups with nondegenerate finite base;
SL₂(ℤ) on 𝕋² and ℝ²; PSL₂(ℤ) on the projective real line; rational translations of ℝ;
positive rational affine transformations of ℝ; biased two-point product flips giving Powers
factors. Include the finite-support tensor identification for two-point product flips.
For each nonsingular example prove whether an equivalent invariant σ-finite measure exists.
For essentially free ergodic actions of countable groups on standard σ-finite measure
spaces prove the following measure-to-type criterion, using invariant measures equivalent
to the original measure: atomic transitive actions give type I; an equivalent finite
invariant measure on a nonatomic space gives II₁; an equivalent infinite σ-finite
invariant measure on a nonatomic space with no equivalent finite invariant measure gives
II∞; absence of an equivalent invariant σ-finite measure gives III.
For the modular-group action examples develop the continued-fraction coding of the
PSL₂(ℤ) boundary action, its ergodicity and its obstruction to an equivalent invariant
σ-finite measure. For SL₂(ℤ) on ℝ² establish Moore's ergodicity theorem in the needed
SL₂(ℝ)/SL₂(ℤ) homogeneous-space specialization using the horocycle flow, including
Mautner's phenomenon, disintegration and the invariant-vector argument.
Prove invariant-density uniqueness under ergodicity and the semifinite-trace restriction
argument using weakly compact bounded trace sublevels. For positive finite-L² elements,
prove the weakly closed convex hull of conjugates by unitaries in the base MASA has a
unique L²-norm minimizer, identify it with the coefficient expectation E, and prove
`τ(E(x)*E(x))≤τ(x*x)`. Use this to produce nonzero finite-trace base projections in the
semifinite-trace restriction argument. Prove a crossed product of a II∞ factor by an automorphism scaling its trace by
λ≠1 is type III. Prove every bounded matrix with the discrete crossed-product covariance
coefficient form belongs to the crossed product (without claiming arbitrary Fourier
operator sums converge strongly). Prove the lower-semicontinuity
lemmas for norms and extended traces needed by that argument.
*Needs:* the crossed products above, V6's semifinite traces and type criteria, Mathlib `ErgodicSMul`
and continued fractions (`GenContFract`) for the boundary coding; the horocycle flow and Mautner
phenomenon are built here on RepresentationTheory's unitary representations.

For a free group on an uncountable generator set, prove its group algebra and standard-form
commutant are II₁ factors on a nonseparable Hilbert space. Prove the commutant of an arbitrary
Hilbert-space amplification is the spatial tensor product of the original commutant with
B(K). For a separable-predual finite factor, finite-trace submodules of an uncountable standard
amplification have separable range; deduce that this amplification has no nonseparable submodule with finite commutant. These examples carry no blanket separability
assumption from the classification milestones.
*Needs:* the group factors above, V2's tensors, V7.Dimension.

### Examples

- `L(ℤ)≅L∞(𝕋)` by Fourier transform and `L(ℤ/n)` is the cyclic matrix model.
- The bounded function `Σ_(n≥1)2^(-n)z^n` lies in `L(ℤ)` but is not a finite combination of
  group unitaries.
- `ℚ` acting on ℝ by translation is ergodic for Lebesgue measure.

### Dependencies

- Layers 1–7.
- AmenableGroups Layer 7; Mathlib `Lp.instContinuousSMulDomMulAct` for V8.RegularL2.
- Tau Ceti `ContRepresentation.integratedOperatorL1` and the strongly measurable lemmas.

## Layer 9: Lattice modules and discrete series

Consume Mathlib's fundamental domains `MeasureTheory.IsFundamentalDomain`, the class
`HasFundamentalDomain` and `MeasureTheory.covolume`
(`Mathlib/MeasureTheory/Group/FundamentalDomain.lean`), the quotient Haar measure
`QuotientMeasureEqMeasurePreimage` with
`IsFundamentalDomain.QuotientMeasureEqMeasurePreimage_HaarMeasure`, and the unfolding formula
`QuotientGroup.integral_eq_integral_automorphize` (`Mathlib/MeasureTheory/Measure/Haar/Quotient.lean`):
for a countable subgroup Γ of a locally compact group G with a right-invariant Haar measure and a
fundamental domain D, `∫_G f=∫_(G/Γ)∑_(γ∈Γ)f(γg)` for integrable f whose automorphization is
strongly measurable. Define a lattice as a discrete subgroup of finite covolume in a unimodular
second-countable locally compact group, prove Weil's formula for nonnegative measurable
functions from the integrable case by monotone truncation, and prove a lattice is uniform
exactly when its quotient is compact. Work out ℤ⊂ℝ,
the integer Heisenberg subgroup of the real upper-unitriangular 3×3 group (Lebesgue Haar
measure, compact quotient and covolume one), and the finite-covolume nonuniform lattice
SL₂(ℤ)⊂SL₂(ℝ). Prove the decomposition `L²(G) ≃ ℓ²(Γ) ⊗ L²(D)`, and normality of the
restricted representations used here. For square-integrable irreducible unitary representations
construct coefficient maps into L²(G), prove their Schur orthogonality, define formal degree
d_π relative to Haar measure, and prove the normalized coefficient map is an isometry
(Goodman–de la Harpe–Jones, *Coxeter Graphs and Towers of Algebras*, §3.3, pp. 142–148).
For an ICC lattice compute its range-projection trace and prove
`dim_(LΓ) H_π = d_π · covol(Γ)` (Goodman–de la Harpe–Jones, §3.3); prove covariance under Haar
rescaling.
*Needs:* Mathlib's fundamental-domain, covolume and quotient-Haar declarations named above, Haar
measure on `SL₂(ℝ)` and on the Heisenberg group; V8's group factors and V7.Dimension for
`dim_(LΓ)`; RepresentationTheory's unitary representations of locally compact groups and Schur's
lemma for the irreducibility and orthogonality statements.

Carry this out for holomorphic discrete series on the upper half-plane: weighted Bergman
spaces, closedness of holomorphic L² functions, reproducing kernels, automorphy factors,
unitarity, irreducibility, square integrability and formal degree. For PSL₂(ℝ) use even
integer weight n≥2, the inverse-matrix convention making it a representation, and a fixed
Haar normalization; compute the modular-lattice fundamental domain and finite coupling
constant. State the constant via d_π times covolume so its normalization is explicit.
For commuting free measure-preserving countable actions Γ,Λ with finite positive-measure
fundamental domains D,E, develop `M_(Γ,Λ)={u_Γ,L∞(X)^Λ}''` and prove its commutant is
`M_(Λ,Γ)`. When induced actions on the opposite quotients are essentially free and ergodic
on nonatomic quotients, prove both are II₁ and compute
`dim_(M_(Γ,Λ)) L²(X)=μ(D)/μ(E)` with normalized traces. For pairs of lattices H,K in G,
prove the specialization `M(K,G/H)'=M(H,K\G)` with left/right translations distinguished;
when these are finite factors prove `dim_(M(K,G/H)) L²(G)=covol(K)/covol(H)`. For G=ℝ, H=ℤ and K=θℤ with irrational θ>0 compute dimension θ and commutant dimension
1/θ. Compare K=(1+θ)ℤ: its quotient action agrees under the generator identification,
but its physical L²(ℝ) module has dimension 1+θ, so these representations are not
unitarily equivalent. Prove the Haar-rescaling invariance of each covolume ratio.
*Needs:* the lattice theory above, V7.Dimension and V7.SumsAndCorners, V8's crossed products and
commutant computations, Mathlib's weighted Bergman spaces (built here on `MeasureTheory.Lp` and
holomorphic functions on the upper half-plane) and `UpperHalfPlane`; Goodman–de la Harpe–Jones,
§3.3, for the discrete-series formal degree and the coupling-constant computations.

**Checks.**

- For G=ℝ, Γ=ℤ with Lebesgue measure, `D=[0,1)` has covolume 1 and Weil's formula is
  `∫_ℝ f=∫_0^1 Σ_n f(x+n)dx`; for Γ=θℤ the covolume is θ, and multiplying Haar measure by c
  multiplies every covolume by c.
- For compact G with normalized Haar measure every irreducible π is square integrable with
  `d_π=dim π`, by Schur orthogonality `∫|⟨π(g)ξ,η⟩|²dg=‖ξ‖²‖η‖²/dim π`; for G=𝕋 the characters
  `z^n` have formal degree 1.
- For G=ℝ no irreducible unitary representation is square integrable (its characters are not in
  `L²`), so the discrete series is empty and no formal degree is defined; for `PSL₂(ℝ)` and even
  weight n≥2, in the normalization with `d_n=(n−1)/(4π)` and `covol(PSL₂(ℤ))=π/3`, the module
  `H_n` over `L(PSL₂(ℤ))` has dimension `(n−1)/12`. For c>0 and μ′=cμ, the orthogonality
  integral multiplies by c, so `d′_n=d_n/c` and `covol′=c·covol`. At n=2 and c=2 these
  become `d′_2=1/(8π)` and `covol′=2π/3`, whose product is still 1/12.

### Examples

- `ℤ⊂ℝ` with Lebesgue measure, and the integer Heisenberg subgroup of the real
  upper-unitriangular group, are lattices with Weil's formula checked explicitly.

### Dependencies

- Layers 7 and 8.
- RepresentationTheory (unitary representations of locally compact groups).

## Layer 10: Affiliated operators and Tomita–Takesaki theory

**V10.ClosedOperators — pre-tracial closed-operator calculus.**
Use Mathlib's `LinearPMap.adjoint`, `LinearPMap.adjoint_isClosed` and
`LinearPMap.isSelfAdjoint_def`. For a self-adjoint T consume SelfAdjointSpectralTheory
SA-D14–D19 (`T−λ` is a bijection of its domain onto H for λ∉ℝ, with `‖(T−λ)⁻¹‖≤|Im λ|⁻¹`) and
SA-D24–D28 (the Cayley transform `U=(T−i)(T+i)⁻¹` is unitary), and SA-E02, by which 1 is not an
eigenvalue of U. Prove the inverse correspondence: a unitary U for which 1 is not an eigenvalue is the Cayley
transform of exactly one self-adjoint operator, `T=i(1+U)(1−U)⁻¹` on the domain `range(1−U)`
(Rudin, *Functional Analysis*, Thm 13.19). Extend this to arbitrary densely
defined closed operators T: self-adjointness/positivity of T*T and TT*, equality of domains
D(T)=D((T*T)^(1/2)), polar partial isometry with initial/final spaces the closures of
range |T| and range T, uniqueness and `T=(TT*)^(1/2)v`. Supply the graph-core results
needed in the proof. Work out the derivative on L²[0,1] with absolutely continuous H¹
domain, zero left endpoint, both zero endpoints, and periodic endpoint conditions.
Fix `Tf=f'`: prove spectrum ∅ for the zero-left-endpoint domain, ℂ for the unrestricted
and both-zero-endpoint domains, and `2πiℤ` for the periodic domain; compute all adjoints
and resolvents with their actual domains. Prove the multiplier-form spectral theorem:
decompose an arbitrary self-adjoint operator into cyclic reducing summands, each unitarily
L² of a finite scalar spectral measure with the operator acting as multiplication by a
real measurable f on domain `{g : ∫|fg|²<∞}` (Reed–Simon I, Thm VIII.4). Apply the
cyclic multiplication model of SelfAdjointSpectralTheory SA-B85 to the Cayley transform U, whose
spectral measure gives no mass to the point 1 (SA-E01–E02), and pull the coordinate back to the
real line along the inverse Cayley map; prove the unbounded multiplier/domain
transport by spectral truncation. For separable H combine the countably many
summands into its one finite measure space; retain the
direct-sum form without separability. Extend the adjoint and
closed-graph machinery to conjugate-linear partial maps using the conjugate Hilbert space;
prove graph orthogonality, closure and polar-decomposition statements with domains explicit.
*Needs:* Mathlib `LinearPMap.adjoint`, `LinearPMap.adjoint_isClosed`, `LinearPMap.isSelfAdjoint_def`;
SelfAdjointSpectralTheory SA-D14–D28, SA-E01–E02 and SA-B85; PolarDecomposition PD-A36 and
PD-B23–B36 for the bounded transform in the unbounded polar decomposition; the conjugate Hilbert space;
Reed–Simon I, Theorems VIII.3–VIII.4, and Rudin, Theorem 13.19, are the sources.

**Checks.**

- For T the multiplication by t on `L²(ℝ)`, `T±i` are bijective onto `L²(ℝ)`, the resolvent at λ
  is multiplication by `(t−λ)⁻¹` with norm `|Im λ|⁻¹`, and the Cayley transform is multiplication
  by `(t−i)/(t+i)`, a unitary whose spectrum is the whole circle and for which 1 is not an
  eigenvalue (the symbol never equals 1).
- For `T=diag(λ_n)` bounded self-adjoint on ℓ², the Cayley transform is `diag((λ_n−i)/(λ_n+i))`
  and the inverse formula `T=i(1+U)(1−U)⁻¹` recovers the λ_n; for `T=0` it gives `U=−1`.
- `Tf=f′` on `L²[0,1]`: the zero-left-endpoint domain gives spectrum ∅ (the resolvent is Volterra
  integration), the unrestricted and both-endpoint domains give ℂ (every λ is an eigenvalue of T or
  of its adjoint), and the periodic domain gives `2πiℤ`, so the domain is part of the data.

**V10.Affiliation — self-adjoint affiliated operators and PVMs.**
Consume V10.ClosedOperators, V2 and V4.Normality for the following pre-tracial comparison.
Define affiliation of a densely defined operator T with M by commutation with every unitary
of M' on its invariant domain. Prove the closure of a closable affiliated operator remains affiliated;
for densely defined closed operators characterize affiliation by
membership of the graph projection in `M₂(M)`, and by polar partial-isometry and spectral
projection membership. Develop functional calculus, truncation cores and affiliated products
needed below, always specifying closures and dense domains rather than assuming arithmetic
of unbounded operators is everywhere defined. In this affiliated calculus own
the spectral multiplier product rule: for Borel φ,ψ the actual composition
φ(T)ψ(T) has domain Dom(ψ(T))∩Dom((φψ)(T)) and agrees there with
(φψ)(T). Prove it through V10.ClosedOperators' multiplier/domain model.
For a nonzero positive self-adjoint T affiliated with M, in particular
M=B(H), choose ε>0 with e_ε=1_[ε,∞)(T)≠0 from its spectral PVM.
Define f_ε(t)=0 for t<ε and f_ε(t)=1/t for t≥ε, independently
of V5's trace theory. Prove f_ε(T)∈M, f_ε(T)H⊆Dom(T), and
the actual everywhere-defined composition T f_ε(T)=e_ε. The domain
inclusion follows from ∫t²|f_ε(t)|²dμ_ξ(t)≤‖ξ‖² for every ξ;
apply the just-proved product rule. This is not a formal product of
unbounded operators.
*Needs:* V10.ClosedOperators, V2's projection lattice and `M₂(M)`, V4.Normality.

**Checks.**

- Multiplication by t on `L²(ℝ)` is affiliated with `M=L∞(ℝ)`: it commutes with every unitary of
  `M′=L∞(ℝ)` on its domain; its spectral projections are the multiplications by `1_B`, in M, and
  its bounded transform is multiplication by `t/√(1+t²)`, in M.
- For that T and ε>0, `f_ε(T)` is multiplication by `f_ε(t)`, bounded by `1/ε`, maps `L²` into the
  domain of T, and `T f_ε(T)` is multiplication by `1_[ε,∞)(t)`, everywhere defined, as the product
  rule states; for `T=0` one has `e_ε=0` and `f_ε(T)=0`.
- The derivative on `L²[0,1]` with zero left endpoint is affiliated with `B(L²)` but not with
  `L∞[0,1]`: it does not commute with multiplication by t on its domain (`(tf)′=f+tf′`).

**V10.TracialLp — tracial measurable operators and densities.** Consume
V10.ClosedOperators, V10.Affiliation, V4.Normality and V6's tracial L²/commutant
construction. For a faithful normal semifinite trace τ, construct
noncommutative Lᵖ(M,τ), 1≤p<∞,
from τ-measurable affiliated operators: spectral τ-measurability, closed strong sums and
products, the p-norm, dense bounded finite-trace elements, completeness, Hölder inequality,
adjoints and bounded left/right multiplication. Identify L² with the GNS completion and
L¹ isometrically with M_* via `a↦(x↦τ(xa))`. Prove the tracial
Radon–Nikodym theorem first: on finite-trace corners compare a positive
normal functional ω with ω+τ, use V4.Normality's dominated density k, and
construct h=k(1−k)⁻¹ by spectral truncation on its support in the
commutant of the GNS representation of ω+τ. Transport the density through
the isometry `xΩ_τ↦x(1−k)^(1/2)ξ_(ω+τ)` and V6's tracial
`JMJ=M′` identification to obtain an operator affiliated with the
finite-trace corner algebra itself. Glue
compatible corner densities along finite-trace exhaustion; prove
uniqueness, positivity, integrability and ‖ω‖=τ(h). For general integrable h,
prove `‖x↦τ(xh)‖=τ(|h|)` by Hölder and V10.ClosedOperators' polar
decomposition of h and V10.Affiliation's membership of its polar partial
isometry in M. Consume V4.PositivePredual's four-positive-term
decomposition for surjectivity of this isometric predual identification.
*Needs:* V10.ClosedOperators, V10.Affiliation, V4.Normality's dominated density, V4.PositivePredual,
V6's tracial L² and `JMJ=M′`; Anantharaman–Popa, §§7.2–7.4, pp. 101–117, and Hiai, §5, are the
sources for the affiliated algebra and the predual as L¹.


**V10.ModularTheory — Tomita–Takesaki and the natural cone.**
Consume V10.Affiliation, V4.Core, V4.PositivePredual, V4.Normality, V0,
V1 and V6. Consume V2's infinite-tensor-product carrier and V8's nonsingular
crossed products, Radon–Nikodym implementations and factor criteria for
the product-state and group-measure-space comparisons below.
For cyclic separating Ω construct closable antilinear maps `S₀(xΩ)=x*Ω`,
`F₀(x'Ω)=x'*Ω`, prove their closures satisfy `S*=F`, and prove the graph characterization
using affiliated operators. Construct `S=JΔ^(1/2)` with J antiunitary involution, Δ positive
self-adjoint with trivial kernel, `JΔJ=Δ⁻¹`, `ΔΩ=Ω`, and the corresponding F decomposition.
Prove the predual regularization lemma: for faithful normal state φ, λ>0 and ψ∈M_*
with `|ψ(y*x)|≤sqrt(φ(x*x)) sqrt(φ(y*y))`, obtain a∈M of norm ≤1/2 such that
`ψ(x)=λφ(ax)+λ⁻¹φ(xa)` for every x. Develop the bounded regularization lemma solving
the `λS+λ⁻¹F` relation, joint graph-core
approximation, the spectral-window dense core, and the `1/(2 cosh πt)` Fourier integral
identity used to pass from these relations to the modular theorem. Prove `JMJ=M'` and
`Δ^(it) M Δ^(-it)=M`, with strong-star continuity, group law and normality (Tomita's theorem:
Hiai, Theorem 2.2; Takesaki II, Chapter VI). Construct the natural cone `P=closure {Δ^(1/4)xΩ : x∈M, x≥0}` and prove complex self-duality,
in the convention `P={η∈H:for every ξ∈P, ⟨ξ,η⟩ is real and nonnegative}`.
Use this convention for natural cones throughout V11. Prove
pointwise fixation by J and `xJxJ(P)⊆P`. Prove every normal positive functional has a unique
representing vector in P, normal automorphisms have unique cone-preserving unitary
implementations, and every normal star isomorphism between algebras in standard form
has a unique implementing unitary preserving J and P (Hiai, Theorems 3.12 and 3.13). Develop these objects before the spatial derivative in V11.
Prove the
finite-dimensional density-matrix formulas and the tracial specialization.
*Needs:* V10.Affiliation and V10.ClosedOperators (closed antilinear maps), V4.Core,
V4.PositivePredual, V4.Normality, V0, V1, V6; V2's infinite tensor product and V8's nonsingular
crossed products for the examples; Mathlib complex analysis for the `1/(2cosh πt)` integral;
Hiai, §§2–3, and Takesaki II, Chapters VI and IX, are the sources.

**V10.FiniteComplexPowers — complex powers and their star locus.** On the same
finite-dimensional algebra `M=∏_k M_(n_k)(ℂ)` and faithful state
`φ(x)=Tr_M(hx)`, with every n_k≥1, h positive invertible and
Tr_M(h)=1, construct the complex powers by the finite spectral formula
`h^z=Σ_(μ∈spec h) exp(z log μ)e_μ`. Use the real logarithm of the
strictly positive eigenvalues, so the formula has no logarithm-branch
choice. Prove independence of diagonalization and compatibility with
unitary changes of matrix coordinates, central summands and state-preserving
star isomorphisms. Define the actual complex algebra automorphisms
`β_z(x)=h^z x h^(−z)`, prove β_0=id, β_(z+w)=β_z∘β_w,
β_z⁻¹=β_(−z), and entire dependence on z for each x. On the finite GNS
space prove `Δ^z L_x Δ^(−z)=L_(β_z(x))`; the real modular parameter
is `σ_t^φ=β_(it)`. These β_z use the complex exponent directly; they
are distinct from writing the analytic continuation of σ with the same
parameter name.

Prove `β_z(x)*=β_(−conj z)(x*)` and the exact criterion
`β_z is a star automorphism ↔ h^(2 Re z)∈Z(M)`.
Consequently, if h is noncentral, this holds exactly when Re z=0.
If h is central, equivalently φ is tracial, every β_z is the identity
and every z satisfies it. Include one-dimensional and commutative
summands and the trace state; do not impose the noncentral conclusion
on these cases. In the GNS algebra model also prove
`S L_x S=R_(x*)` and hence `SMS=JMJ=M′`, with the bounded antilinear
operators and actual left/right actions in this finite-dimensional case.
For `h=diag(2/3,1/3)` in M₂, β_1 sends e₁₂ to 2e₁₂ and e₂₁ to
e₂₁/2 and is not star preserving; for the normalized trace all β_z=id.
This is the operator-valued complex-time comparison in addition to the
entire scalar KMS function already specified.

Consume native `Complex.cpow` for the scalar spectral powers,
`Matrix.diagonal` and the existing finite-dimensional spectral calculus.
For the underlying algebra automorphisms use the units/conjugation action
and `MulSemiringAction.toAlgEquiv`; on the imaginary axis compare with
native `Unitary.conjStarAlgAut`. No new complex-power or inner-automorphism
carrier is required. The star locus is exactly the centrality criterion above; the description
"star automorphism iff z∈iℝ" is its specialization to noncentral h.
*Needs:* Mathlib `Complex.cpow`, `Matrix.diagonal`, the Hermitian spectral theorem
(`Matrix.IsHermitian.spectral_theorem`), `MulSemiringAction.toAlgEquiv`, `Unitary.conjStarAlgAut`;
V10.ModularTheory's finite-dimensional density formulas.

**Checks.**

- For `h=diag(2/3,1/3)` in M₂(ℂ), `β_1(e₁₂)=2e₁₂` and `β_1(e₁₂)*=2e₂₁≠β_1(e₂₁)=e₂₁/2`, so
  β_1 is not star preserving; a definition with `h^(−z) x h^z` would give `e₁₂/2` instead.
- A non-diagonal density is an admissible input: for `h=[[1/2,1/6],[1/6,1/2]]`, with trace 1
  and spectrum `{2/3,1/3}` on the eigenvectors `(1,±1)/√2`, compute
  `h^(−1)=[[9/4,−3/4],[−3/4,9/4]]` and `β_1(e₁₁)=[[9/8,−3/8],[3/8,−1/8]]`. Its adjoint
  `[[9/8,3/8],[−3/8,−1/8]]` equals `β_(−1)(e₁₁)`, as `β_z(x)*=β_(−conj z)(x*)` predicts, and
  differs from `β_1(e₁₁)`; the same values result after diagonalizing h, which tests
  coordinate independence.
- For central h, that is h scalar on each matrix block (for example `h=I/n` on `M_n(ℂ)`, the
  normalized trace), every `β_z` is the identity, so every z lies in the star locus; a criterion stated as
  `Re z=0` alone would wrongly exclude `z=1` here.

Compute J, Δ and modular automorphisms for faithful product states on infinite tensor
products of finite matrix algebras. Identify every such ITPFI algebra with the nonsingular
crossed product of its product diagonal algebra by the restricted direct sum of the finite
cyclic permutation groups. Prove ergodicity by the finite-coordinate tail 0–1 law
for these faithful product measures, and deduce factoriality by V8. Compute the nonsingular group-measure-space
modular data after choosing a probability measure in the measure class,
in terms of Radon–Nikodym derivatives.
*Needs:* V2's incomplete tensor product, V8's nonsingular crossed products and Radon–Nikodym
unitaries, V10.ModularTheory; Mathlib product measures.

**V10.KMS — strip characterization and finite-dimensional entire extension.**
Consume V10.ModularTheory and its modular action convention.
Prove the KMS characterization for an arbitrary strongly continuous φ-preserving
normal automorphism group α: for the convention `σ_t(x)=Δ^(it)xΔ^(-it)`, F is bounded
continuous on `0≤Im z≤1`, holomorphic inside, `F(t)=φ(α_t(x)y)` and
`F(t+i)=φ(yα_t(x))`. Prove α=σ^φ iff it satisfies this condition (Hiai, Theorem 2.14; Takesaki II, Theorem VIII.1.2). Establish existence and uniqueness for faithful normal states;
construct analytic elements by smoothing, prove strip approximation and uniqueness using
Stone's theorem and common spectral cores. Supply the required scalar/vector strip
Phragmén–Lindelöf and Fourier smoothing estimates here from Mathlib complex analysis.
Prove the stronger finite-dimensional statement for every finite-dimensional
M, including a direct sum of matrix blocks. With Tr_M the sum of the
unnormalized block traces, use the finite-dimensional density theorem to
write each faithful state uniquely as `φ(x)=Tr_M(hx)` with invertible
`h∈M₊` and Tr_M(h)=1. Prove invariance and the entire extension
`F(z)=Tr_M(h h^(iz)x h^(-iz)y)`, with the two stated boundary equations
for `α=σ^φ`. Prove this using finite spectral sums and cyclicity; strip
holomorphy in the general theorem does not replace the entire conclusion.
Define the centralizer, prove equality with the modular fixed algebra and the commutation
identity `φ(xy)=φ(yx)`, and prove it is a finite algebra with trace φ.
*Needs:* V10.ModularTheory, Tau Ceti's Stone theorem, Mathlib complex analysis (the strip
Phragmén–Lindelöf and Fourier smoothing estimates are built here from the maximum modulus
principle and `Real.fourierIntegral`), the finite-dimensional density theorem above.

**Checks.**

- For `M=M₂(ℂ)`, `φ=Tr(h·)` with `h=diag(2/3,1/3)`, `x=e₁₂`, `y=e₂₁`: `σ_t(e₁₂)=2^(it)e₁₂`,
  `F(z)=Tr(h h^(iz)xh^(−iz)y)=(2/3)2^(iz)`, so `F(t)=(2/3)2^(it)=φ(σ_t(x)y)` and
  `F(t+i)=(1/3)2^(it)=φ(yσ_t(x))`: the boundary identities hold with the stated strip
  `0≤Im z≤1`; the opposite sign convention `σ_t(x)=Δ^(−it)xΔ^(it)` would exchange the two
  boundary values.
- For a tracial state, `σ_t=id`, `F` is constant and the KMS condition reduces to `φ(xy)=φ(yx)`.
- Uniqueness: on `M₂(ℂ)` the only state with KMS condition for `α_t=Ad(diag(2^(it),1))`
  is `φ=Tr(h·)` with `h=diag(2/3,1/3)`, since the condition on `x=e₁₂`, `y=e₂₁` forces
  `h₁₁/h₂₂=2`.

**V10.Hecke — discrete pairs and operator conventions.** Consume
V10.ModularTheory and V10.KMS before computing Δ, J and σ. For an arbitrary
discrete Hecke pair (G,H), use Mathlib's `IsHeckeTriple ⊤ H H` and
`𝕋 ⊤ H ℂ`; almost normality supplies finite coset decompositions of every
double coset. No countability assumption is imposed on G or its coset
spaces. Put `L(g)=[H:H∩gHg⁻¹]` and `R(g)=L(g⁻¹)`.
Use complex H–H-biinvariant functions with finite double-coset support.
Consume Tau Ceti's Hecke-ring convolution, with its structure constants
`DoubleCoset.multiplicity` and the basis product `HeckeCosetModule.single_mul_single`
(`TauCeti/NumberTheory/HeckeRing/Multiplication.lean`, `Multiplicity/Basic.lean`).
For `HgH=⊔_i a_iH`, `HhH=⊔_j b_jH`, prove its structure constant
`m(g,h;d)=#{(i,j):a_i b_jH=dH}` equals
`(1_(HgH)⋆1_(HhH))(d)`, where
`(a⋆b)(g)=Σ_(Hk∈H\G) a(gk⁻¹)b(k)`.
This fixes the product on the shared ring carrier; finite quotient
support is not finite support on G when H is infinite.

On ℓ²(H\G), with cosets Hg, define
`(λ(f)ξ)(Hg)=Σ_(Hk) f(gk⁻¹)ξ(Hk)` and prove
`λ(a)λ(b)=λ(a⋆b)`. Almost normality gives finite row and column
sums and `‖λ(1_(HgH))‖≤√(L(g)R(g))`; extend from finitely
supported vectors, which are dense for every cardinality. Develop the
adjoint, quasi-regular action and operator-closure APIs. The closure of
the double-coset vectors is ℓ²(H\G)^H for the right H action;
δ_H is cyclic and separating there. Put `w_g=λ(1_(HgH))δ_H` and
prove `‖w_g‖²=R(g)`, `Δw_g=(L(g)/R(g))w_g`.

On ℓ²(G/H), with cosets gH, define
`(T_fξ)(xH)=Σ_(kH) f(k⁻¹x)ξ(kH)`. Prove representative
independence, boundedness and the complex-linear inversion comparison
`(Iξ)(Hg)=ξ(g⁻¹H)`, `f∨(g)=f(g⁻¹)`,
`I T_f I⁻¹=λ(f∨)`. With
`(f⋄h)(x)=Σ_(kH) f(k⁻¹x)h(k)`, prove
`T_fT_h=T_(f⋄h)`, `f⋄h=h⋆f` and
`(f⋄h)∨=f∨⋆h∨` by the actual finite intersection counts.
Thus λ represents the shared ⋆ ring, while f↦T_f is its
antirepresentation; inversion gives the indicated homomorphism from
⋄ to ⋆. In both operator conventions the adjoint is
`f*(g)=conj(f(g⁻¹))`.
For `v_g=T_(1_(HgH))δ_H`, prove
`‖v_g‖²=L(g)`, `Δv_g=(R(g)/L(g))v_g`,
`Jv_g=√(L(g)/R(g))v_(g⁻¹)` and
`σ_t^φ(T_(1_(HgH)))=(R(g)/L(g))^(it)T_(1_(HgH))`.

Own the full-space/radial comparison. The left G-action on ℓ²(G/H)
commutes with every T_f and δ_H is G-cyclic, since its translates are
all coset basis vectors. Consequently δ_H is separating for
`M_full={T_f}''`; its vector state is faithful and normal on M_full.
Its M_full-cyclic closure is the left-H-fixed radial subspace, the
closed span of the double-coset vectors. Prove restriction to that
reducing subspace is a faithful normal *-isomorphism onto the radial
operator algebra: its possible central kernel annihilates δ_H, hence
is zero. Prove the GNS unitary `[a]↦aδ_H` onto the radial subspace
and its compatibility with I. Transfer factoriality and type between
the full-space and radial algebras. Countability may be assumed
explicitly in separable examples; no cyclicity on the full space is
asserted for the Hecke action itself.

Prove the equivalence of finite-index-intersection and finite-coset
definitions of a Hecke pair. For finite G identify the Hecke algebra
with the averaging corner of the right group algebra; include GL_n
over a finite field with its upper-triangular subgroup and flag-variety
cosets. Keep the shared intersection-count coefficients.
For (SL₂(ℚ),SL₂(ℤ)), first prove almost normality. For g choose
N≥1 clearing denominators of both g and g⁻¹; conjugating the principal
congruence subgroup Γ(N²) by either matrix lies in SL₂(ℤ). Its finite
index therefore proves the required commensurator/IsHeckeTriple condition.
Prove commutativity by transpose, which preserves SL₂(ℤ). Apply positive
Smith normal form to Ng. If both integral changes of basis have determinant
−1, multiply them on the appropriate sides by diag(−1,1); this preserves
the positive diagonal and makes both determinants1. Divide by N to prove
transpose fixes each rational double coset. Consume Tau Ceti's
`HeckeAntiInvolution.ofAmbient` and
`HeckeCosetModule.mul_comm_of_antiInvolution` (`TauCeti/NumberTheory/HeckeRing/Commutativity.lean`)
with ambient submonoid ⊤ and ℂ coefficients. Clearing denominators proves this double-coset fact;
it is not asserted to define a ring map from an integral monoid.
Keep this arithmetic pair distinct from the type-A Hecke tower.
*Needs:* Tau Ceti's Hecke-ring modules (`IsHeckeTriple`, the ring `𝕋 ⊤ H ℂ`,
`HeckeCosetModule.single_mul_single`, `DoubleCoset.multiplicity`, `HeckeAntiInvolution.ofAmbient`,
`HeckeCosetModule.mul_comm_of_antiInvolution`), V10.ModularTheory and V10.KMS, Mathlib `lp` on
coset spaces and Smith normal form over ℤ (`Basis.SmithNormalForm`); V1's bicommutant theorem
and V4.Normality for the radial restriction.

**V10.AffineHecke — the canonical type-III example.** Use slope-first
coordinates `G={(α,b):α∈ℚ_(>0), b∈ℚ}` for the rational affine
semidirect product, with `(α,b)(γ,c)=(αγ,b+αc)` and action
`x↦αx+b`; H is `{(1,k):k∈ℤ}`. The slope is α>0.
For α=m/n in lowest terms prove L=m, R=n. The gH/T modular ratio
is α⁻¹, whereas the Hg/λ ratio is α.
Identify the Bost–Connes matrix pair by the group isomorphism
`M(α,b)=[[1,b/α],[0,1/α]]`, and put Γ=M(G), Γ₀=M(H).
Define λ_BC on ℓ²(Γ₀\Γ) by the Hg kernel
`(λ_BC(F)η)(Γ₀x)=Σ_(Γ₀k)F(xk⁻¹)η(Γ₀k)`.
Define its gH companion ρ_BC on ℓ²(Γ/Γ₀) by
`(ρ_BC(F)η)(xΓ₀)=Σ_(kΓ₀)F(k⁻¹x)η(kΓ₀)`.
Thus λ_BC represents the shared ⋆ product, whereas ρ_BC represents ⋄
and is an antirepresentation of ⋆. Verify multiplication, H, both coset
counts and both convolution conventions. The lower diagonal entry of M is α⁻¹. Basis transport gives
`T_f↦ρ_BC(f∘M⁻¹)`; composing with coset inversion gives
`T_f↦λ_BC((f∘M⁻¹)∨)`. In particular
`s_n↦n^(-1/2)ρ_BC(1_(Γ₀diag(1,1/n)Γ₀))`
and `s_n↦n^(-1/2)λ_BC(1_(Γ₀diag(1,n)Γ₀))`.
Rational translations change sign only in the latter Hg transport.
Use these explicit maps for every source generator/state/flow comparison.

Own the following specific normal model and its comparison in this
milestone. Consume GlobalNumberFields Layer4's finite-adele carrier
and arithmetic embeddings. Use the native `A_f=FiniteAdeleRing (𝓞 ℚ) ℚ` and its integral
compact-open subring Zhat. Prove the placewise comparison with
`∏_p ℤ_p` and normalize additive Haar measure by m(Zhat)=1.
Prove A_f is locally compact and second countable; use its standard
Borel σ-algebra and σ-finite Haar measure. Use the countable group
Q=ℚ_(>0) acting on A_f by x↦qx,
`β_q(f)(x)=f(x/q)` and `m(qA)=q⁻¹m(A)`.
Using V8 construct `N=L∞(A_f,m)⋊_β Q`, its canonical expectation
E and implementers U_q. Put `p=1_Zhat`. The corner state is
`ψ(x)=∫_Zhat E(x) dm` on pNp. Prove it is faithful and normal.
Construct the dual pairing `(ℚ/ℤ)^=Zhat` from the compatible
finite cyclic Fourier pairings; write its characters χ_r on Zhat, interpreting pχ_r as their zero
extension to A_f.
This finite-cyclic construction and its function-algebra density are
owned here and require no V11 harmonic-analysis or type invariant.

Put `e(r)=T_(1_(H(1,r)H))` for r∈ℚ/ℤ and
`s_n=n^(-1/2)T_(1_(H(n,0)H))` for positive integers n.
For α=m/n in lowest terms, prove the exact double-coset normal form
`T_(1_(H(α,b)H))=√(mn) s_m e(nb mod ℤ)s_n*`.
Check multiplication and adjoints by the shared finite intersection counts.
Prove the unitary ℚ/ℤ relations for e(r), the isometry/semigroup laws
for s_n, and the full covariance/reordering relations
`s_n*e(r)s_n=e(nr)`,
`s_ne(r)s_n*=(1/n)Σ_(nt=r)e(t)`,
`e(r)s_n=s_n e(nr)` and, for gcd(m,n)=1,
`s_n*s_m=s_m s_n*`. Derive the general reordering by cancelling
gcd(m,n); this proves the finite monomial span is a star algebra.
For E_r=pχ_r and S_n=pU_np prove every one of these relations,
including S_n*S_n=p and S_nS_n*=1_(nZhat), using covariance and
finite-cyclic Fourier sums. Prove pNp is generated by their images.
Define Φ on the double-coset basis by the displayed coprime normal form
with e,s replaced by E,S. Prove Φ preserves every product structure
constant and the adjoint, by the finite-count calculation and those
corner relations. This constructs the algebraic star homomorphism;
no universal-presentation completeness is assumed.
Verify `φ(s_m e(r)s_n*)=δ_(m,n)δ_(r,0)/n=ψ(S_m E_r S_n*)`.
Using multiplicativity/adjoints and the monomial product expansion,
prove every cross identity `ψ(Φ(x)*Φ(y))=φ(x*y)` on the full
algebraic span, in particular on each pair of double-coset basis elements.
These identities give the GNS isometry. Corner generation, Kaplansky density
and normality of the GNS representation give dense vector range; extend
to a unitary intertwining all left multiplications, then
to the norm closures and the state-preserving normal star-isomorphism
from the radial Hecke algebra onto pNp. Its full-space version uses
V10.Hecke's separately proved faithful radial restriction.
Prove p has central support 1 (the rational dilates of Zhat cover A_f).
*Needs:* V10.Hecke, GlobalNumberFields Layer 4 (`FiniteAdeleRing (𝓞 ℚ) ℚ`, its compact-open
subring), V8's crossed products and expectation, Mathlib Haar measure on `A_f`, finite cyclic
characters (`ZMod`, `AddChar`), V0's GNS uniqueness and V1's Kaplansky theorem.

**V10.AffineAP — arithmetic progression asymptotics and prime pairs.**
For a modulus d≥1 and a reduced residue class a₀ modulo d, own the adapter
`π_(d,a₀)(x) ~ x/(ϕ(d)log x)`, where π counts rational primes
p≤x in that class and ϕ is Euler's totient. Consume the implemented
`TauCeti.LSeries.wienerIkehara` from
`TauCeti.NumberTheory.LSeries.WienerIkehara.SharpCutoff`, as recorded in
[ArithmeticDirichletSeries Layer9](../../Completed/ArithmeticDirichletSeries/README.md).
Use Mathlib's actual `ArithmeticFunction.vonMangoldt.residueClass`,
`continuousOn_LFunctionResidueClassAux`,
`eqOn_LFunctionResidueClassAux` and half-plane von-Mangoldt summability.
For the nonnegative residue-class coefficient supply its actual
`LSeriesHasSum` on Re s>1, a separately defined continuous boundary
remainder on Re s≥1, and the equality with residue 1/ϕ(d).
The native theorem gives the normalized partial-sum limit.
Specialize the prime-ideal counts to K=ℚ and
`S={𝔭:absNorm(𝔭)≡a₀ mod d}`. Own the rational-prime/prime-ideal
bijection, norm/logarithmic-weight and inclusive-cutoff comparisons.
Express the residue-class von-Mangoldt sum as this prime theta sum
plus the terms p^k≡a₀ mod d with k≥2, and bound that latter weight by
Tau Ceti's standard higher-prime-power weight. Consume
`higherPrimePowerTheta_isBigO` and
`primePowerSummatory_isLittleO_of_le_higherPrimePowerWeight`
from `TauCeti.NumberTheory.ArithmeticDirichletSeries.HigherPrimePowers`
to remove that contribution. On the corresponding prime set over ℚ,
consume `primeCount_sub_mul_logIntegral_isLittleO` and
`primeCount_asymptotic_of_primeTheta` from
`TauCeti.NumberTheory.ArithmeticDirichletSeries.Transfer`, with the
positive residue, and `TauCeti.Real.logIntegral_isEquivalent_div_log`.
These are applications
of implemented generic Tauberian/removal/Abel APIs, not new owners of
those theorems. Mathlib's nonsummability of Σ(log p)/p in a progression
alone proves neither the asymptotic nor divergence of Σ1/p.

Derive the precise prime-pair lemma: for every modulus d≥1 and 0<η<1/4, outside
any finite prime set choose pairwise disjoint prime pairs (p_j,q_j),
both primes ≡1 mod d, with `|q_j/p_j−2|<η` and `Σ_j1/p_j=∞`.
For sufficiently small δ>0 use disjoint blocks X=B^k, B>2(1+δ),
pair primes in [X,(1+δ)X] with equally many primes in
[2X,2(1+δ)X]. The AP asymptotic supplies ≥c_(d,δ) X/log X
pairs in each sufficiently large block; their reciprocal contribution
is ≥c'_(d,δ)/log X, whose block sum diverges. This explicit estimate
is an owned prerequisite, not a claim that infinitude supplies it.
*Needs:* Tau Ceti `TauCeti.LSeries.wienerIkehara`, Mathlib `ArithmeticFunction.vonMangoldt.residueClass`
and the `LFunctionResidueClassAux` declarations, the Tau Ceti higher-prime-power and transfer
declarations named above; ArithmeticDirichletSeries Layer 9.

**V10.AffineType — Haar return, ergodicity and type III.** Consume
V10.AffineAP, V10.AffineHecke, GlobalNumberFields Layer4, V8,
V6.FullCornerType and V10.KMS. Work on the constructed (A_f,m),
Zhat, crossed product N and full corner pNp, not an unnamed model.
For a finite-prime cylinder C=b₀+d Zhat use the tail valuation events
`E_j^0={(v_(p_j),v_(q_j))=(0,1)}` and
`E_j^1={(v_(p_j),v_(q_j))=(1,0)}` from the AP prime pairs.
At the first active pair put
`A_j=C∩E_j^0∩⋂_(i<j)(E_i^0∪E_i^1)^c` and define B_j with E_j^1.
Multiplication by τ_j=p_j/q_j maps A_j bijectively to B_j, preserves
earlier valuation tests and C, and has Haar Jacobian τ_j⁻¹=q_j/p_j.
Independence and reciprocal divergence make ⋃A_j and ⋃B_j partition C
modulo null sets, with `m(⋃A_j)≥m(C)/(3+η)`. The piecewise map has
Jacobian in (2−η,2+η). For an arbitrary measurable set A of positive
finite measure choose a high-density cylinder; prove
`m(⋃A_j∩A∩T⁻¹A)≥m(C)/(3+η)−εm(C)−εm(C)/(2−η)>0`
for sufficiently small ε. Using cylinder approximation and
`A_f=⋃_(n≥1)n⁻¹Zhat`, deduce some τ∈Q with
`|τ⁻¹−2|<η` and `m(A∩τ⁻¹A)>0`. Reduce arbitrary η>0 to
min(η/2,1/8); supply all approximation and countable-union steps.

Prove essential freeness off the null point0 and separately prove ergodicity.
Use the probability Hilbert space `L²(Zhat,m|Zhat)`. For a finite prime
set F let Q_F≤Q be the subgroup it generates. Write almost every x
uniquely as `x=a_v y`, with
`a_v=∏_(p∈F)p^(v_p)`, y∈Y_F={v_p(y)=0 for p∈F}, and independent
valuation weights `w_v=∏_(p∈F)(1−1/p)p^(−v_p)`.
Prove the measure decomposition with normalized Haar restriction on Y_F.
Define the orthogonal projection P_F onto functions constant on the
partial Q_F-orbits by
`(P_F f)(a_v y)=Σ_u w_u f(a_u y)`.
For a finite-conductor character χ of Zhatˣ, extend its Dirichlet
character by0 at conductor primes. Its multiplier is the actual expectation
`α_F=E[χ(a_v)]=∏_(p∈F)(1−1/p)/(1−χ(p)/p)`.
Prove `P_F χ=α_F χ∘y_F`. More generally for
`f_(k,χ)(x)=1_(kZhat)(x)χ(x/k)` and F containing the prime factors
of k and the conductor, prove `P_F f_(k,χ)=(α_F/k)χ∘y_F`.
On each finite quotient ℤ/Nℤ with N≥1, stratify by k=gcd(x,N) and expand
functions on the resulting unit groups modulo N/k in their characters.
For a character induced from conductor f, express the extra unit restrictions
on x∈kZhat as ∏_(p|N/k, p∤f)(1−1_(pZhat)(x/k)). Expand with coefficients
μ(e), for squarefree products e of those extra primes, and use
χ(e) f_(ke,χ)(x)=1_(keZhat)(x)χ(x/k). This gives the stated tests, including
the principal character of conductor1 and the zero-residue stratum. This proves their span is dense in L²(Zhat). For nontrivial χ choose a
reduced class a₀ with Reχ(a₀)<1. AffineAP and Abel summation give
reciprocal-prime divergence there; the logarithm estimate makes α_F→0.
For trivial χ the projected tests are constant with their Haar means.
Uniform boundedness of the projections proves P_F converges strongly to
projection onto the constants. A Q-invariant measurable set has invariant
indicator on Zhat, hence measure0 or1 there; rational dilates cover A_f,
so the full action is ergodic. Orbit density is not used as a substitute.

If an equivalent invariant σ-finite measure exists, its density h is finite
and positive a.e., with `h(τx)=τ h(x)`. Take a common conull set since Q
is countable, and a positive finite-measure subset with c≤h≤(1+ε)c.
The return lemma with τ⁻¹ near2 contradicts the endpoint ratio bound,
for example with ε=η=1/10. Thus no such invariant measure exists.
Apply V8's free-ergodic measure-to-type theorem to N, then
V6.FullCornerType and the actual radial/full-space isomorphisms to prove
pNp, the radial algebra and M_full are type-III factors. No finer type is
inferred from one modular eigenvalue set.
The concrete model follows Laca–Raeburn's finite-adele corner and
Neshveyev's Haar/β=1 construction; the source endpoint is
Bost–Connes Theorem5(a) at β=1. Identify the canonical β=1 state with φ
through the full multiplicative/moment/GNS comparison above. For
`σ_t^BC(s_n)=n^(it)s_n`, prove `σ_t^φ=σ_(-t)^BC` in V10.KMS's
positive-strip convention, using the explicitly declared ρ_BC/λ_BC
transport. Hecke operators on modular forms remain ModularForms' scope.
*Needs:* V10.AffineAP, V10.AffineHecke, V10.KMS, V6.FullCornerType, V8's measure-to-type criterion
and crossed products, GlobalNumberFields Layer 4; Mathlib Dirichlet characters and `ZMod` units;
Bost–Connes Theorem 5, Laca–Raeburn and Neshveyev are the sources (References).

### Examples

- For `h=diag(2/3,1/3)` on `M₂(ℂ)`, `σ_t(e₁₂)=2^(it)e₁₂`, and `β_1` is not star preserving.
- Infinite tensor products of finite matrix algebras with faithful product states (ITPFI
  factors) have explicit `J`, `Δ` and modular groups.

### Dependencies

- Layers 0–8.
- Mathlib `LinearPMap.adjoint` and `LinearPMap.adjoint_isClosed`; SelfAdjointSpectralTheory
  SA-D14–D28, SA-E01–E02 and SA-B85, and PolarDecomposition, for V10.ClosedOperators; Tau Ceti `TauCeti.Analysis.Semigroups.Group.Stone.Unbounded`.
- Tau Ceti's Hecke-ring modules for V10.Hecke; GlobalNumberFields Layer 4 for V10.AffineHecke;
  ArithmeticDirichletSeries Layer 9 and the Tau Ceti Tauberian/transfer declarations named in
  V10.AffineAP.

## Layer 11: Weights, Connes invariants, and continuous cores

Define faithful normal semifinite weights on the positive cone, domains `n_φ` and `m_φ`,
GNS construction, support, semifiniteness, normal limits, scalar rescaling and restriction.
Prove every von Neumann algebra admits such a weight, without σ-finiteness:
take a maximal family of nonzero normal positive functionals with orthogonal
supports p_i, prove their supports sum to 1, and define the weight by the
supremum of finite subsums. Prove normality and faithfulness; finite sums
of the p_i have finite weight and increase to 1, giving semifiniteness.
Develop the associated full left Hilbert algebra from `n_φ∩n_φ*`, its
commutant Hilbert algebra and the dense Tomita algebra of analytic vectors.
Establish closability of the involution, modular polar decomposition,
the preclosedness and fullness arguments of VI.1, and Gaussian
regularization/common-core arguments. Construct the commutant and full
closure 𝔄'' of a left Hilbert algebra and prove `R_l(𝔄'')=R_l(𝔄)`.
Prove Tomita's theorem
for full left Hilbert algebras: the polar conjugation exchanges the left
and right represented algebras, and Δ^(it) preserves the left algebra.
Then construct the canonical n.s.f. weight on the left von Neumann
algebra from the norm of its left-bounded vectors (Takesaki II VII.2.5).
Identify its GNS full Hilbert algebra with 𝔄''; starting from a weight
prove the two constructions recover that weight (VII.2.6).
Prove the weight modular condition on n_φ∩n_φ*, with its integrable
strip boundary functions and domain estimates, and uniqueness of σ^φ
among normal weight-preserving flows satisfying it. Define the weight
centralizer as the modular fixed algebra and prove its equivalent
commutation/domain characterization. The restriction is a normal tracial
weight; define strict semifiniteness by semifiniteness of that restriction
and prove its criteria, rather than asserting it for every n.s.f. weight.
Own **CentralizerCornerRestriction**: for an n.s.f. weight θ and a projection
p fixed by σ^θ, the restriction θ_p to pMp is n.s.f., and
`σ_t^(θ_p)(x)=σ_t^θ(x)` for x∈pMp. In the weight GNS representation,
construct its isometry onto `pJ_θpJ_θ H_θ` on the core
`Λ_(θ_p)(pap)↦Λ_θ(pap)`. Prove the right-multiplication bounds,
density and analytic-core closure using the preceding full Hilbert algebra;
the projection reduces J_θ and Δ_θ, so the restricted Tomita polar
decomposition gives the claimed modular action. Include p=0 and θ(p)=∞.
This lemma precedes spatial derivatives, relative modular operators and
Radon–Nikodym perturbations. Compare Takesaki, *Theory of Operator Algebras II*,
Theorem VIII.2.6, as used for the centralizer corner in
[Hiai Remark 13.18](https://arxiv.org/html/2004.02383#S13.Thmthm18).
The state version is compared with V10; no state-based regularization
lemma is assumed for an unbounded weight.
*Needs:* V10.ModularTheory and V10.Affiliation, V4.Normality's supports and normal functionals,
V6's tracial weights, Tau Ceti's Stone theorem; Takesaki II, VI.1, VII.1–VII.2 and Theorem
VIII.2.6, and Hiai, Remark 13.18, are the sources.

**Checks.**

- On `B(ℓ²)` the canonical trace is an n.s.f. weight with `n_Tr` the Hilbert–Schmidt operators,
  `m_Tr` the trace class, and `σ^Tr=id`; on `M₂(ℂ)` with `φ=Tr(h·)`, `h=diag(2/3,1/3)`, the
  cocycle is `(Dφ:DTr)_t=h^(it)=diag((2/3)^(it),(1/3)^(it))` and `σ^φ_t=Ad(h^(it))∘σ^Tr_t`.
- The weight `φ(x)=Σ_n n·x_nn` on `ℓ∞(ℕ)` is normal, faithful and semifinite (finitely supported
  positive elements have finite weight and are dense), but not bounded; the weight that is ∞ on
  every nonzero positive element is normal and faithful but not semifinite.
- `CentralizerCornerRestriction` on `M₂(ℂ)` with the weight above and `p=e₁₁` (fixed by `σ^φ`)
  gives `θ_p=(2/3)·id` on `pMp=ℂ`, with trivial modular group, as the formula requires.

Construct tensor-product n.s.f. weights on spatial von Neumann tensors
from the algebraic tensor product of their full left Hilbert algebras,
its left-Hilbert-algebra completion and full closure, then the
canonical weight just constructed. Do not assume the algebraic tensor
product already full. Prove the finite-weight positive-simple-tensor
formula and its extension by monotone approximation.
Prove faithful semifiniteness, associativity, restriction and scalar-rescaling
laws, the GNS tensor-product identification, and
`σ_t^(φ⊗ψ)=σ_t^φ⊗σ_t^ψ`, with the corresponding modular-operator
and conjugation formulas. Include finite matrix traces and the semifinite
trace on B(H); use 0·∞=0 in the extended-positive evaluation formula.
*Needs:* the full left Hilbert algebras above, V2's spatial tensor product, V6's traces.

Construct the standard form for every von Neumann algebra from this GNS
representation: a Hilbert space H, conjugation J and natural cone
`P=closure {Δ_φ^(1/4)Λ_φ(x) : x∈m_φ⁺}`. Prove these vectors lie
in the required fractional-power domain and identify this cone with
the closure of ξJξ for ξ in the Tomita algebra. Prove P is complex self-dual in V10’s pairing convention,
with `JMJ=M′`, `JzJ=z*` for central z, `Jξ=ξ` on P, and
`xJxJ(P)⊆P`. Prove every normal positive functional is represented by
a unique vector in P, with
`‖ξ−η‖²≤‖ω_ξ−ω_η‖≤‖ξ−η‖‖ξ+η‖`.
Prove existence and uniqueness of the unitary implementing a normal *-isomorphism
while preserving J and P, including compatibility of the implementing
unitaries on σ-finite corners and extension over their directed union.
Identify the form with V10's cyclic-separating construction when a
faithful normal state exists. Construct canonical L²(M) from the
weight-associated spaces and these compatible unitaries, with functorial
standard implementations and the canonical bimodule action
`xξy=xJy*Jξ`. Prove its normality, commutation and adjoint laws.
Prove the general tensor commutation theorem `(M⊗̄N)′=M′⊗̄N′`
using these standard forms, V4.Normality's faithful representation amplifications
and full/cyclic commutant-projection reductions; include arbitrary
representations and Hilbert-space multiplicities. A faithful normal state is not an assumption
of this general standard-form theorem.
*Needs:* the weight GNS construction above, V10.ModularTheory's natural cone, V4.Normality's
amplification, V2's commutation theorem for `B(K)` factors; Takesaki II, IX.1.2 and
IX.1.13–IX.1.18, and Hiai, §3 (Theorems 3.12–3.13), are the sources.

Define the extended positive cone of N using additive homogeneous lower-semicontinuous
functions on N_*⁺, and operator-valued weights M⁺→N̂⁺ by additivity, positive homogeneity,
normality and `T(n*xn)=n*T(x)n`. Develop faithful/semifinite domains, composition with
scalar weights and the canonical dual operator-valued weight for a crossed product.
Compare general-weight modular theory with V10 and V6's tracial weights.
Build relative modular operators and Connes's spatial derivative.
For a normal semifinite weight φ on M and an n.s.f. weight Ψ on M′,
construct the positive self-adjoint operator D=dφ/dΨ on the
representation Hilbert space by the closure of
`q(ξ)=φ(R_ξ R_ξ*)` on Ψ-bounded vectors with finite form value.
It is not generally affiliated with M. Prove the form
closability/domain theorem, monotone and scalar laws, representation
covariance, and the exact support identity `s(D)=e=s(φ)`.
For faithful φ, prove the full-algebra implementation identities
`D^(it)xD^(−it)=σ_t^φ(x)` for x∈M and
`D^(−it)yD^(it)=σ_t^Ψ(y)` for y∈M′, and reciprocal commutant
spatial-derivative identity `dΨ/dφ=D^(−1)`.
For nonfaithful φ, restrict D to eH and φ to the faithful normal
semifinite weight φ_e on eMe. Let c(e) be the central support of e.
Use V2's central-support projection/kernel theorem to construct the
normal *-isomorphism `M′c(e)≃M′e` induced by y↦ye;
for y∈M′₊ define the n.s.f. reference weight
`Ψ_e(ye)=Ψ(y c(e))` on M′e. Prove well-definedness, faithfulness,
normality and semifiniteness through this central-summand isomorphism.
Consume V2's compressed-commutant theorem to identify the commutant
of eMe on eH with M′e, and prove
`D_e=D|_(eH)=dφ_e/dΨ_e`. Then prove
`D_e^(it)xD_e^(−it)=σ_t^(φ_e)(x)` for x∈eMe.
On H use supported imaginary powers, equal to 0
on (1−e)H, so `D^(it)D^(−it)=e`. Prove the supported commutant
identity `D^(−it)yD^(it)=σ_t^Ψ(y)e` for y∈M′. Construct a normal
semifinite φ₀ with support 1−e, so φ′=φ+φ₀ is n.s.f. and e lies in
its centralizer. Apply CentralizerCornerRestriction to identify the
modular action of φ′ on eMe with σ^(φ_e). Prove the
spatial-derivative additive-form law and its
orthogonal-support consequence
`e(dφ′/dΨ)^(it)=(dφ/dΨ)^(it)` by the positive closed-form sum;
use the faithful implementation to obtain the supported identity.
*Needs:* V2's central-support/kernel and compressed-commutant theorems, CentralizerCornerRestriction
above, closed positive forms (built here on V10.ClosedOperators); Hiai, §8 (operator valued
weights) and §13 (spatial derivatives), are the sources.

Own **RelativeModularComparison** with numerator-first convention
`Δ_(φ,ψ)`, for normal semifinite φ and faithful n.s.f. ψ.
Use the general-weight standard form constructed above from full left
Hilbert algebras, including its cone and cone-preserving uniqueness.
For any normal semifinite α with support f, first realize the faithful
weight α_f on fMf in the standard corner
`(qH, J|_(qH), qP)`, where q=fJfJ. Prove the projection-standard-form
theorem, including cone self-duality and the representation a↦aq of fMf,
as in [Hiai Proposition 3.8](https://arxiv.org/html/2004.02383#S3.Thmthm8).
Use cone-preserving uniqueness to construct the unitary
`V_f:H_(α_f)≃qH`, with `V_f π_(α_f)(a)η=a V_fη` for a∈fMf.
Construct the balanced pre-Hilbert quotient and completion of
`(Mf)⊙_(fMf)H_(α_f)` with inner product
`⟨xf⊗η,yf⊗ζ⟩=⟨η,π_(α_f)(fx*yf)ζ⟩`.
Prove balancing, positivity and isometries onto H_α and JfJH respectively:
`xf⊗Λ_(α_f)(a)↦Λ_α(xa)` and `xf⊗η↦xV_fη`.
For the first density statement, take z∈n_α and A=fz*zf.
For `p_n=1_[1/n,∞)(A)`, prove p_n≤nA and α_f(p_n)<∞, and
`‖Λ_α(z)−Λ_α(zfp_n)‖²=α_f(A(f−p_n))→0`.
For the second, let r be the projection onto `closure span MqH`.
Prove r∈M′ and r≤JfJ. For d=JfJ−r prove fd=0;
V2's central-support kernel theorem gives d c(f)=0, while
`d≤JfJ≤c(f)`, so d=0. Thus the generated subspace is JfJH.
Obtain an isometry `U_α:H_α→H` with range JfJH and exact intertwining
`U_α π_α(x)=xU_α` for x∈M; include α=0.
For faithful ψ, U_ψ is unitary onto H and satisfies
`U_ψ J_ψ=J U_ψ` and `U_ψ(P_ψ)=P`. These are the faithful
standard-form transport laws; no modular conjugation for a nonfaithful
GNS representation is presumed.

Put `Ψ_ψ(y)=ψ(Jy*J)` on M′₊. Construct the commutant GNS unitary
`W_ψ Λ_(Ψ_ψ)(JxJ)=J U_ψΛ_ψ(x)` for x∈n_ψ.
Using recovery of the weight from its full Hilbert algebra, prove that
the Ψ_ψ-bounded vectors are exactly `U_ψΛ_ψ(n_ψ)` and that
`R_(U_ψΛ_ψ(x)) W_ψ*=x`, including the converse bounded-vector
criterion. Define the conjugate-linear relative Tomita operator on
`C=U_ψΛ_ψ(n_ψ∩n_φ*)`, where `n_φ*={x : x*∈n_φ}`, by
`S₀(U_ψΛ_ψ(x))=U_φΛ_φ(x*)`.
Prove C is dense: `n_φ* n_ψ⊆n_ψ∩n_φ*`; from semifiniteness and
V1's Kaplansky density theorem derive a uniformly bounded net
`a_i∈n_φ∩n_φ*` tending strongly to 1. For b∈n_ψ, the bounded normal
positive functional `ψ_b(c)=ψ(b*cb)` on M₊ gives
`‖Λ_ψ(a_i b)−Λ_ψ(b)‖²=ψ_b((a_i−1)*(a_i−1))→0`.
Prove S₀ well-defined. The bounded-vector identification gives exactly
C as the finite-value domain of the spatial form q and
`q(ξ)=‖S₀ξ‖²=φ(R_ξR_ξ*)`.
Use closability of q to prove closability of S₀: if ξ_n→0 and
S₀ξ_n is Cauchy, then q(ξ_n−ξ_m)→0, hence q(ξ_n)→0.
Set S=closure S₀ and Δ_(φ,ψ)=S*S. Prove equality of graph and form
norms on C, `‖ξ‖²+‖S₀ξ‖²=‖ξ‖²+q(ξ)`; their completions in H give
`Dom S=Dom q̄=Dom Δ_(φ,ψ)^(1/2)`.
Conclude `Δ_(φ,ψ)=dφ/dΨ_ψ` by equality of their closed forms,
with exact commutant-weight transport. These are owned construction
and comparison targets for general semifinite weights.

Include the Hilbert–Schmidt M₂ example ψ=Tr, φ(x)=Tr(px),
p=diag(1,0), and Jx=x*: `U_φΛ_φ(x)=xp`, with range Hp=`JpJ H`;
`Sx=x*p`, `S*S=L_p`. In particular S(e₁₂)=e₂₁ lies in Hp,
and the spatial derivative D=L_p has support p and restricts to pH.
Its supported conjugation sends 1 to p≠1 and fixes the unit of pMp.
[Hiai §12](https://arxiv.org/html/2004.02383#S12) and
[Proposition 13.6](https://arxiv.org/html/2004.02383#S13.Thmthm6) give the positive-functional convention and comparison; they do not
supply the general-weight GNS construction. In
[§13](https://arxiv.org/html/2004.02383#S13), Proposition 13.14 is the
additivity law, Proposition 13.16 the support law, Theorem 13.17 the
implementation theorem, and Remark 13.18 the supported-power and
supported-cocycle comparison.
*Needs:* the general-weight standard form and cone uniqueness above, V1's Kaplansky theorem,
V2's central-support kernel theorem, the spatial derivative above; Hiai, Proposition 3.8, §12,
Propositions 13.6, 13.14, 13.16, Theorem 13.17 and Remark 13.18.

First for two faithful n.s.f. weights φ and ψ, construct the faithful
balanced weight `Φ(x)=φ(x₁₁)+ψ(x₂₂)` on M⊗M₂. Prove its two
diagonal matrix-unit projections lie in its centralizer, and apply
CentralizerCornerRestriction to identify their modular actions with
σ^φ and σ^ψ. Define the canonical Connes cocycle
`u_t=(Dφ:Dψ)_t` as the unique (1,2) coefficient satisfying
`σ_t^Φ(1⊗e₁₂)=u_t⊗e₁₂`.
Prove unitarity, strong continuity, the cocycle identity,
`σ_t^φ=Ad(u_t)∘σ_t^ψ`, chain rule, covariance and state/weight
comparisons (Hiai, Theorem 7.6; Takesaki II, Chapter VIII, §3). Prove the spatial ratio theorem
`u_t=(dφ/dΨ)^(it)(dψ/dΨ)^(−it)` for any common n.s.f.
commutant reference Ψ by the block spatial-form comparison. Since the
balanced coefficient is defined without Ψ, the ratio is reference
independent. The modular action equation alone permits central unitary
phase groups; the balanced coefficient specifies the canonical cocycle.

For normal semifinite nonfaithful φ and faithful n.s.f. ψ, the same
balanced weight has support s=diag(e,1), where e=s(φ). Construct its
faithful reduction Φ_s on s(M⊗M₂)s. Prove e⊗e₁₁ and 1⊗e₂₂ lie
in its centralizer and use CentralizerCornerRestriction to identify
their modular actions with σ^(φ_e) and σ^ψ. Define
`u_t=(Dφ:Dψ)_t` as the unique (1,2) coefficient of
`σ_t^(Φ_s)(e⊗e₁₂)=u_t⊗e₁₂`.
Prove `u_0=e`, strong continuity,
`u_tu_t*=e`, `u_t*u_t=σ_t^ψ(e)`,
`u_(s+t)=u_s σ_s^ψ(u_t)` and
`σ_t^(φ_e)(x)=u_t σ_t^ψ(x)u_t*` for x∈eMe.
Prove the supported spatial ratio theorem
`u_t=(dφ/dΨ)^(it)(dψ/dΨ)^(−it)` using supported numerator powers:
identify the reduced balanced spatial form with the direct sum of
D_e and dψ/dΨ, including the commutant-reference transport on the
reduced representation. This comparison proves reference independence.
For a faithful n.s.f. intermediate χ prove
`(Dφ:Dψ)_t=(Dφ:Dχ)_t(Dχ:Dψ)_t`.
Include φ=0, and construct the resulting supported partial-isometry
and balanced-weight comparisons.
Define Out(M) as automorphisms modulo inner ones. Using faithful n.s.f.
weights, construct the canonical homomorphism ℝ→Out(M) and prove
weight independence.
*Needs:* CentralizerCornerRestriction, the spatial derivative and RelativeModularComparison above,
V2's matrix amplification `M⊗M₂`; Hiai, §§7.2 and 12.2.

For a faithful n.s.f. base weight φ, prove the Pedersen–Takesaki theorem (Hiai, Theorem 9.4):
a normal semifinite ψ invariant under σ^φ is uniquely φ_h for a
positive operator h affiliated with the weight centralizer, with
`φ_h(x)=lim_(ε↓0) φ(h_ε^(1/2)xh_ε^(1/2))`,
`h_ε=h(1+εh)⁻¹`, including supports and nonfaithful ψ.
For h with support 1 prove `(Dφ_h:Dφ)_t=h^(it)`; for general h
use its supported powers and the preceding partial-isometry convention.
Apply CentralizerCornerRestriction to the centralizer projection s(h)
for the modular restriction on the support corner.
Compare the Pedersen–Takesaki theorem's trace specialization with V10's tracial Radon–Nikodym density; extend from
finite functionals to normal semifinite weights by monotone exhaustion. Prove
Kadison–Sakai innerness of bounded von Neumann-algebra derivations,
and that a modular flow is implemented by a strongly continuous
one-parameter unitary group in M exactly when M is semifinite.
Construct the trace from the density/inner modular implementation.
Thus nontrivial outer modular action rules out semifiniteness.
*Needs:* the cocycles and spatial derivatives above, V10.TracialLp's tracial Radon–Nikodym
theorem, V10.Affiliation; Mathlib `Derivation`; Hiai, §9, and Takesaki II, Chapter VIII, §3, are
the sources; the Kadison–Sakai theorem is Sakai, *C*-algebras and W*-algebras*, Theorem 4.1.6
(cited by locator).

For an n.s.f. weight φ and a unital von Neumann subalgebra N⊆M,
prove Takesaki's conditional-expectation theorem (for a faithful normal state: Hiai, Theorem
6.6; for a faithful normal semifinite weight: Takesaki II, Theorem IX.4.2, cited by locator): if
N is σ^φ-invariant
and φ|N is semifinite, the GNS projection constructs the unique normal
φ-preserving expectation E:M→N, which commutes with σ^φ. Prove
the converse, restriction/support and composition laws. Specialize to
states and to traces, obtaining expectations onto every subalgebra of
a finite tracial algebra. NoncommutativeIntegration I4 consumes this
theorem and owns its Lp inclusions and contractive projections.
*Needs:* the weight GNS and modular groups above, V7.Index's trace-preserving expectation as the
tracial case, V10.KMS's centralizer.

Define T(M) as the kernel of the canonical homomorphism ℝ→Out(M),
and S(M) as the intersection of modular spectra over faithful
normal semifinite weights. Prove the weight formulation is representation independent;
for σ-finite type III factors prove its relation to the state formulation. For factors prove `0∈S(M)` iff type
III, `S(M)\{0}` is a closed subgroup of positive reals, and the exhaustive III₀, III_λ,
III₁ alternatives: `{0,1}`, `{0}∪λ^ℤ` for 0<λ<1, and `[0,∞)` respectively. Construct
Powers factors R_λ. For state-preserving product automorphisms
⊗Ad(u_k), prove innerness iff `Σ_k(1−|φ_k(u_k)|)<∞`, after
phase normalization; prove the implementing infinite tensor product
and the necessity argument from finite-prefix expectations. Apply this
to their modular product automorphisms, and compute
`T(R_λ)=(2π/log λ)ℤ` and `S(R_λ)={0}∪λ^ℤ`. Develop the unbounded spectral API needed for these intersections. Build Arveson spectra
of normal flows from L¹ Fourier annihilator ideals, the Connes spectrum as the
intersection over nonzero invariant corners. Prove its closed-subgroup
property for modular actions on factors and its identification with
log(S(M)\{0}). Retain the separate criterion `0∈S(M)` iff the factor
is type III: `Γ(σ^φ)={0}` holds for both semifinite and type III₀ factors. For the ITPFI and ratio-set development use countable products of
finite matrix algebras with faithful normalized states, the
separable-predual class used in classification. Use eigenvalue lists with multiplicities.
Define its Araki–Woods asymptotic ratio set by disjoint finite coordinate
blocks I_n, disjoint matched eigenvalue sublists K_n¹,K_n² in each block,
and bijections f_n:K_n¹→K_n², with all denominator eigenvalues positive,
`Σ_n Σ_(λ∈K_n¹)λ=∞` and
`max_(λ∈K_n¹)|f_n(λ)/λ−x|→0`.
Develop prefix/eigenbasis independence, closedness and the nonzero
multiplicative group law, and prove its algebraic invariance by product
state comparisons. Distinguish it from the finite-coordinate ratio set
r̂ and from the subgroup generated by one-coordinate ratios. Prove product-state representation equivalence and coordinate regrouping.
First construct binary-product block extraction and then the general
absorption theorem: for ITPFI factors M,N, with arbitrary finite type-I
coordinate factors in N, `r̂(N)⊆r_∞(M,Ω)` implies `M≃M⊗̄N`.
Construct the cutdown, partial isometries, repeated coordinate blocks
and amplification returning from the corner. Prove the general
finite-coordinate extraction and regrouping step of Araki–Woods Lemma7.5;
binary absorption alone does not suffice for arbitrary matrix products.
Deduce absorption of R_λ when λ and its powers are in r_∞(M,Ω).
*Needs:* the cocycles and `Out(M)` above, V10.ModularTheory, V2's incomplete tensor product and
V8's product automorphisms, V4.Normality; Connes 1973, §3 (the invariants S and T) and §3.6.1,
Araki–Woods, Definition 3.2, Lemmas 5.4 and 7.5 and Theorem 7.6, are the sources.

**Checks.**

- `S(B(H))={1}` and `T(B(H))=ℝ` for H≠0 (the modular group of the trace is trivial), so `0∉S`
  and the factor is not of type III; for `R_λ`, `S={0}∪λ^ℤ` and `T=(2π/log λ)ℤ`, and `0∈S`.
- For `R_λ` the modular spectrum of the product state is `λ^ℤ∪{0}` on the nose, so the
  intersection over all weights is not smaller than one weight's spectrum here, whereas on a III₀
  factor single weights have spectra larger than `S(M)={0,1}`: the intersection in the definition
  is not redundant.
- The asymptotic ratio set of the Powers state with eigenvalue list `(1/(1+λ),λ/(1+λ))` is
  `{0}∪λ^ℤ`; for the one-coordinate ratio the subgroup generated is `λ^ℤ` already, but for the
  `M₃` product with `ρ=diag(1,λ,μ)/(1+λ+μ)` and irrational `log λ/log μ` the ratio set is `[0,∞)`,
  which the subgroup generated by one-coordinate ratios (`λ^ℤμ^ℤ`, countable) is not.

Define Connes's property L_μ for 0≤μ≤1/2: for each normal state φ
and ε>0 there is a partial isometry u with `u²=0`,
`uu*+u*u=1` and
`|μ φ(ux)−(1−μ)φ(xu)|≤ε‖x‖` for every x∈M.
Prove the spectral consequence `μ/(1−μ)∈S(M)` for factors and
0<μ<1/2 (Connes3.5.4). For an ITPFI factor and 0<λ<1 prove
`λ∈S(M)` iff `λ∈r_∞(M,Ω)`, equivalently absorption of R_λ:
use product-density-matrix block partial bijections for the S-to-ratio
implication, the preceding absorption theorem for ratio-to-absorption,
and `L_(λ/(1+λ))` for absorption-to-S. For type-III ITPFI factors
extend the equality to all nonzero values by reciprocal and closed-group
laws; retain the finite/semifinite alternatives of the Araki–Woods
convention. Do not assert this equality for arbitrary factors. In
particular, for an ITPFI III₁ factor deduce `r_∞(M,Ω)=[0,∞)`
from `S(M)=[0,∞)`.
Define R_∞ as `⊗_ℕ(M₃,Tr(ρ·))`,
`ρ=diag(1,λ,μ)/(1+λ+μ)` with 0<λ,μ<1 and irrational
logλ/logμ. Compute its ratio set and S invariant by the matched-block
divergent-mass criterion. Use general two-sided absorption to identify
all separable-predual ITPFI III₁ factors with this model, including
products with arbitrary finite matrix coordinate sizes. Prove the Powers
and dense-ratio M₃ product computations, including divergent mass.
*Needs:* the ratio-set and absorption theory above; Connes 1973, 3.5.4 (property `L_μ`), and
Araki–Woods, Theorem 7.6.

For arbitrary locally compact Hausdorff abelian G, develop the shared
harmonic-analysis layer using Mathlib `PontryaginDual` and Tau Ceti
`Analysis/Fourier/Pontryagin/{DualEval,Continuity,Measure,Uniqueness,StronglyContinuous}`.
Write `dual G` for the Pontryagin dual with its compact-open topology and `ev:G→dual(dual G)`,
`ev(g)(γ)=γ(g)`, for evaluation. Construct the dual Haar normalization and the
positive-character Fourier transform `f̂(γ)=∫f(x)γ(x)dμ(x)` on C_c and L¹, and use
V8.RegularL2's commutative reduced group C*-algebra `C*_r(G)`, the norm closure of
`λ(L¹(G))` on L²(G). The targets below are built in the order stated; the embedding and
uniqueness targets consume no Fourier inversion theorem.

**V11.DoubleDualEmbedding — point separation and the closed embedding.** Own the following
inversion-free theorem: ev is an injective continuous group
homomorphism, a topological embedding, and has closed image. Continuity: for compact K⊆dual G
and ε>0, the set of g with `|γ(g)−1|<ε` for every γ∈K is an identity neighbourhood of G,
by joint continuity of evaluation on `dual G×G` and compactness of K. For the converse
inclusion apply Tau Ceti's cyclic spectral theorem
`ContRepresentation.exists_pontryaginMeasureTransform_eq_inner` to V8.RegularL2's left-regular
representation λ (transported between the multiplicative group G and its additive form) and a
vector ξ: there is a finite inner regular measure ν on dual G with `⟨ξ,λ_gξ⟩=∫γ(g)dν(γ)`
for every g. For an open identity neighbourhood U choose a compact identity neighbourhood V
with `VV⁻¹⊆U` and `ξ=μ(V)^(−1/2)1_V`, so that `p(g)=⟨ξ,λ_gξ⟩` satisfies `p(1)=1=ν(dual G)`
and `p(g)=0` for g∉U (the supports V and gV are disjoint). Choose K⊆dual G compact with
`ν(dual G∖K)<ε`, 0<ε<1/3. If `|γ(g)−1|<ε` on K then
`|p(g)−1|≤∫_K|γ(g)−1|dν+2ν(dual G∖K)<3ε<1`, so p(g)≠0 and g∈U. Hence the pulled-back
compact-open neighbourhoods of ev(1) form a neighbourhood base at 1, and ev is a topological
embedding onto its image. Injectivity: if γ(g)=1 for every γ then `p(g)=1=‖ξ‖‖λ_gξ‖` for
every unit ξ, so `λ_gξ=ξ` for every ξ∈L²(G); for g≠1 choose a compact identity neighbourhood
V with `gV∩V=∅` (Hausdorffness), for which `λ_g1_V=1_(gV)≠1_V` since μ(V)>0; so g=1. Closed
image: ev(G) is a locally compact subgroup of the Hausdorff group dual(dual G); a locally
compact dense subset of a Hausdorff space is open in it, so ev(G) is an open, hence closed,
subgroup of its closure, and equals it. No character space of C*_r(G), unitization, Fourier
uniqueness or double-dual surjectivity enters this proof.
*Needs:* V8.RegularL2; Tau Ceti `ContRepresentation.exists_pontryaginMeasureTransform_eq_inner`
and `PontryaginDual.continuous_coe_eval_const`; Mathlib `PontryaginDual` (compact-open topology,
evaluation continuity) and regular Haar measure.

**V11.UnitizationCharacters — the nonunital Gelfand spectrum.** For a commutative nonunital
C*-algebra A (here C*_r(G)), let Ω⁺ be the character space of `Unitization ℂ A`, compact by
Mathlib, with the augmentation character `∞=Unitization.fstHom`, and Ω the nonzero characters of
A. Prove that restriction to A is a bijection from `Ω⁺∖{∞}` onto Ω, with inverse
`χ↦((c,a)↦c+χ(a))`, and a homeomorphism for the weak-star topologies; that Ω is locally compact
Hausdorff and Ω⁺ is its one-point compactification exactly when A has no unit (when A is unital,
∞ is isolated); and that for a∈A the Gelfand transform of `(0,a)` vanishes at ∞ and satisfies
`‖a‖=sup_Ω|â|`, by the native isometry of the unital Gelfand transform. Include A=0, where Ω is
empty and Ω⁺={∞}. For A=C*_r(G) prove that `φ↦γ_φ`, `γ_φ(x)=φ(λ(L_xf))/φ(λ(f))` for any f with
φ(λ(f))≠0, is a well-defined continuous injective map Ω→dual G: well defined and multiplicative
by `λ(L_xf)=λ_xλ(f)`, continuous by V8.RegularL2's translation continuity (for compact K⊆G the
set `{λ(L_xf):x∈K}` is norm compact, so weak-star convergence of characters is uniform on it).
Prove `φ(λ(g))=ĝ(γ_φ)` for every g∈L¹, from `g*f=∫g(x)L_xf dμ(x)` as a Bochner integral in L¹
and `φ(λ(g))φ(λ(f))=φ(λ(g*f))`; this gives injectivity of φ↦γ_φ and identifies the Gelfand
transform of λ(g) on Ω with ĝ∘γ. Its surjectivity is proved after Plancherel below.
*Needs:* Mathlib `characterSpace` compactness, `Unitization.starLift`, `Unitization.fstHom`,
`gelfandStarTransform` and `gelfandTransform_isometry`; V8.RegularL2.

**V11.FourierUniqueness — on finite measures and on L¹.** Own the uniqueness theorem that
inversion uses. For finite inner regular positive measures ρ₁,ρ₂ on G, if `∫γ dρ₁=∫γ dρ₂` for
every γ∈dual G then ρ₁=ρ₂: apply Tau Ceti's
`TauCeti.MeasureTheory.ext_of_forall_mem_subalgebra_integral_eq_of_innerRegular` to the star
subalgebra of bounded continuous functions spanned by the characters, which is conjugation
closed (conj γ is a character) and separates the points of G by V11.DoubleDualEmbedding. For
f∈L¹(G,μ) with f̂=0 prove f=0 a.e.: `conj(f̂(γ))=(conj f)^(conj γ)`, so the transform of
conj f vanishes too and the real and imaginary parts u,v of f have û=v̂=0; writing `u=u⁺−u⁻`,
the finite measures u⁺μ and u⁻μ are inner regular (they are supported, up to null sets, on
AmenableGroups Layer 7's σ-compact carriers, where μ is inner regular) and have equal transforms,
so u⁺=u⁻ a.e. and u=0 a.e.; likewise v. Include f=0 and the trivial group. The complex-measure
version by Jordan decomposition is not an input here.
*Needs:* Tau Ceti `ext_of_forall_mem_subalgebra_integral_eq_of_innerRegular`;
V11.DoubleDualEmbedding; AmenableGroups Layer 7's σ-compact localization.

**Checks.**

- On G=ℤ, dual G=𝕋 and ev(n)(z)=zⁿ; the compact-open neighbourhoods of ev(0) pulled back to ℤ
  contain {0} once K=𝕋 and ε<2 (|zⁿ−1|<ε for all z forces n=0), so the embedding is discrete, as
  it must be. On G=𝕋, dual G=ℤ with the discrete topology and ev(z)(n)=zⁿ; a compact K⊆ℤ is
  finite, and the pulled-back neighbourhoods `{z:|zⁿ−1|<ε, n∈K}` are the usual neighbourhoods
  of 1, so the embedding is a homeomorphism onto a closed image.
- For G=ℝ, `ξ=1_[0,1]` and ν the measure on dual ℝ≃ℝ with density `(sin(t/2)/(t/2))²/(2π)`, the
  identity `⟨ξ,λ_gξ⟩=max(1−|g|,0)=∫e^(igt)dν(t)` is the Bochner representation of the
  triangle function; the density is nonnegative and integrates to 1, so ν is a probability, as
  `p(1)=1` in the proof requires.
- Uniqueness needs inner regularity of the measures, not only finiteness: it is applied to u⁺μ
  with u⁺∈L¹, and the σ-compact carrier of u⁺ is where that regularity is proved; the statement
  is not asserted for arbitrary finite Borel measures on a nonmetrizable G.

Consume V11.FourierUniqueness before constructing inversion on its integrable domain, for
f∈L¹ with f̂∈L¹(dual G), `f(x)=∫f̂(γ)conj(γ(x))dγ` a.e. for the dual Haar measure normalized by
this identity, and Fourier–Plancherel on L², the unitary `F:L²(G)≃L²(dual G)` with
`Fλ(f)F*=M_f̂`; deduce `‖λ(f)‖=sup|f̂|`, hence that every evaluation `f̂↦f̂(γ)` is a
character of C*_r(G), completing the homeomorphism `Ω≃dual G` of V11.UnitizationCharacters and
identifying the Fourier transform with the Gelfand transform. Prove the evaluation map
`G→dual(dual G)` a topological group isomorphism (surjectivity after inversion), its
naturality, and Fourier/Haar rescaling compatibilities. Give compact-support density and local
σ-finite integration arguments for groups without a global σ-finite Haar measure. This
harmonic-analysis layer is independent of the countability assumption on the normal
crossed-product construction and supplies Dynamics D4's arbitrary-LCA Takai duality.
*Needs:* V11.DoubleDualEmbedding, V11.UnitizationCharacters, V11.FourierUniqueness,
V8.RegularL2; Mathlib `PontryaginDual` and Haar measure; AmenableGroups Layer 7.

Construct crossed products by second-countable locally compact groups with
pointwise strong-star continuous normal actions on `L²(G,H)`, Haar and
measurability control, independence of faithful representation and covariant
integrated forms. Prove discrete compatibility with V8. For second-countable
locally compact abelian G use the preceding harmonic-analysis layer,
construct dual actions and prove Takesaki duality
`(M ⋊ G) ⋊ dual G ≃ M ⊗̄ B(L²G)` (Hiai, Theorem 10.7; Takesaki II, Theorem X.2.3). Prove the dual-action fixed-point theorem
`(M⋊G)^(dual G)=M` with its coefficient inclusion, first on Fourier
coefficients and then on arbitrary bounded operators. Include the
normalized averaging corner for finite abelian G.
*Needs:* V8.LCHRegularNormalBridge, V8.RegularL2, the harmonic-analysis layer above,
V4.Normality, V2's spatial tensor product; Hiai, §10, and Takesaki II, Chapter X, are the sources.

Prove the dual-weight modular formulas for M⋊_σ^φℝ:
`σ_t^(φ̂)(π(x))=π(σ_t^φ(x))` and `σ_t^(φ̂)(u_s)=u_s`,
so `σ_t^(φ̂)=Ad(u_t)`. Construct h_φ by h_φ^(it)=u_t;
the density/cocycle theorem then makes φ̂_(h_φ⁻¹) a trace.
Construct the continuous core `M ⋊_σ ℝ`, its faithful normal semifinite trace, the dual
trace-scaling action, independence of weight by a cocycle isomorphism preserving the canonical
trace and dual action, and the flow of weights
on its center. Fix dual characters `χ_s(t)=exp(i s t)` and dual action `θ_s(u_t)=exp(i s t)u_t`,
so the core trace scales by `Tr∘θ_s=exp(s)Tr`. Fix its normalization by
`h_φ^(it)=u_t` and `φ̂(x)=Tr(h_φ x)` on the weight domain.
Normalize the dual operator-valued weight by
`T(x)=∫_ℝ θ_s(x) ds`, with ordinary Lebesgue ds on the dual
parameter and dual pairing exp(ist); use dt/(2π) on the original
parameter for the compatible Fourier inversion convention. Prove
compatibility with dual Haar rescaling and the resulting canonical
trace. The original dt/(2π) normalizes integrated Fourier forms,
while T uses the specified dual ds. Prove the flow of weights is ergodic
when M is a factor, and prove type III₁ has one-point
flow, III_λ has transitive circle flow of least positive period `|log λ|`, and III₀ has
properly ergodic nontransitive flow. Prove the semifinite factor
case is the translation flow on ℝ, and that this list recovers the
factor type from its flow. Prove the bridge
`Γ(σ^φ)=ker(θ|_(Z(core)))` with the chosen dual pairing, and
for a nonzero type III algebra, prove its core is semifinite
and properly infinite, with no nonzero type-I central summand and
no nonzero finite central summand. Here type II∞ for this algebra
means these properties and does not assert that the core is a factor.
For type III factors, prove the core is a factor
exactly in type III₁, using the preceding center/flow description;
then it is a type II∞ factor. Treat the zero algebra separately,
whose core is zero. Define flows on standard measure algebras, conjugacy
modulo null sets, ergodicity, transitivity and nonsingularity. For flow realization,
construct countable nonsingular measured equivalence relations on standard probability
spaces, their Radon–Nikodym cocycles, untwisted regular groupoid
von Neumann algebras with Cartan expectation, Maharam extensions and
associated flows. Define the full pseudogroup of measurable nonsingular
partial bijections with graph in R, and the full group [R] of conull
automorphisms with graph in R, all modulo null sets. Construct composition,
inverses, restrictions, pushforward of measures and transport of fiber
functions `f^φ` by reindexing arrows. Give [R] its uniform metric
`d(S,T)=μ{x:Sx≠Tx}` on the probability base and prove [R] is closed
in the nonsingular automorphism group for this metric. Prove the
modulus-cocycle identities needed for orbit equivalence. FactorRigidity R6 specializes
this API to p.m.p. relations. Define hyperfinite measured relations by increasing
finite subrelations modulo invariant null sets. Prove compatibility
with the smooth/type-I exhaustion formulation. For an exhaustion
`R=⋃ₙRₙ`, prove `[R]=closure(⋃ₙ[Rₙ])` in the uniform metric:
restrict a given full-group map to arrows lying in Rₙ and extend the
resulting partial permutations measurably on each finite Rₙ-class;
the measure of the discarded set tends to zero. Construct the
single-transformation presentation from compatible finite orbit
orderings, measurable successor maps and a conull limiting exhaustion;
prove the converse for nonsingular transformations by measurable
marker partitions and finite orbit intervals. Include finite orbit
components and aperiodic components separately. R7 of FactorRigidity
consumes this relation API and owns its p.m.p. cost theory. Prove the modular spectrum/ratio-set and
continuous-core/associated-flow identifications. Prove every properly ergodic flow admits
a free nonsingular ergodic ℤ-transformation with that associated flow, giving
a III₀ factor. Construct a measurable cross-section with positive
return time, its suspension and modulus cocycle; supply the nonsingular
odometer/skew-product construction realizing the prescribed flow and
verify its associated-flow calculation. Prove the discrete decomposition of III_λ
factors by first constructing a faithful n.s.f. periodic weight of
infinite multiplicity with factorial centralizer and
`σ_(T₀)=id`, `T₀=−2π/logλ`. The circle flow gives an inner
modular period T₀. Start with a faithful n.s.f. weight ψ of infinite
total value, write `σ_(T₀)^ψ=Ad(b)` with b∈Z(M_ψ), choose bounded
invertible positive h∈Z(M_ψ) with h^(iT₀)=b, and perturb to ψ_h⁻¹.
Average its periodic modular action to prove strict semifiniteness;
use the discrete spectrum/compact duality to prove the centralizer
factorial. Its infinite total trace makes it infinite; exclude type I∞
using the nontrivial λ-scaling automorphism, since automorphisms of
type-I factors are inner and preserve the semifinite trace. Conclude
it is II∞. Prove its semifinite centralizer
and eigen-isometry Fourier decomposition,
as a II∞ crossed product by a trace-scaling ℤ action, and specify equivalence by cocycle conjugacy: β_n=Ad(w_n)∘ηα_nη⁻¹ with
`w_(n+m)=w_n(ηα_nη⁻¹)(w_m)`; prove this gives isomorphic crossed products.
*Needs:* the crossed products and dual actions above, the Connes cocycles, V6's semifinite traces,
V4.0.Decomposition's measurable selection, the measured equivalence relations of this layer;
Connes–Takesaki 1977, Takesaki II, Chapter XII, §1, and Haagerup 1979, Theorems 1.2–1.3, are the
sources.

**Checks.**

- For `M=ℂ` the core is `L(ℝ)≅L∞(ℝ)` by Fourier transform, `u_t↦(σ↦e^(itσ))`, `h_φ(σ)=e^σ`,
  `Tr(f)=∫f(σ)e^(−σ)dσ`, and `θ_s` is translation by s, so `Tr∘θ_s=e^s Tr`; with the dual
  character `exp(−ist)` instead the scaling would read `e^(−s)`: this pins the sign convention.
- For a semifinite factor with trace τ the core is `M⊗̄L∞(ℝ)`, its center `L∞(ℝ)`, and the flow of
  weights is translation on ℝ; for `R_λ` the center of the core is `L∞(ℝ/(log λ)ℤ)` and the flow
  is periodic with least period `|log λ|`.
- The zero algebra has zero core; a nonzero type III algebra has a core with no finite central
  summand (a finite summand would give a finite-trace corner of M).

For separable-predual type III factors define infinite multiplicity
of an n.s.f. weight by proper infiniteness of its centralizer. Prove
the equivalent tensor presentation ψ⊗Tr on P⊗̄B(ℓ²), using
countable matrix units in that centralizer.
Weights are unitarily equivalent when related by an inner automorphism.
A dominant weight has infinite multiplicity and is equivalent to every
positive scalar multiple of itself. Construct one from the dual of the
semifinite trace in the continuous decomposition: pass from the core
N to N⋊_θℝ, take the dual trace weight, and transport through
Takesaki duality and V5's properly infinite stabilization. Prove its
centralizer identifies with N and its scalar-rescaling equivalences;
prove uniqueness up to unitary equivalence using measurable implementing
unitaries and tensor-weight absorption. For a trace-scaling action prove
`N′∩(N⋊_θℝ)=Z(N)` by the Fourier/translation-masa calculation.
For type III₁ this gives the scalar relative commutant used in V13.
Include the weight-comparison/support and integrability theory of
Takesaki II XII.4.4,4.18–4.21: construct the center-valued support
in the balanced-weight algebra, its order/comparison theorem, and
identify integrability with continuity of its translated support.
*Needs:* the continuous decomposition and Takesaki duality above, V5's properly infinite
stabilization, V4.0.Decomposition's measurable selection; Takesaki II, XII.4.4 and 4.18–4.21, and
Connes–Takesaki 1977.

### Examples

- The Powers factors `R_λ`, 0<λ<1, have `T(R_λ)=(2π/log λ)ℤ` and `S(R_λ)={0}∪λ^ℤ`.
- On `M₂(ℂ)` with `ψ=Tr` and `φ=Tr(p·)` the Connes cocycle and spatial derivative are explicit.

### Dependencies

- Layers 4, 6, 8 and 10, with V8.RegularL2 for the harmonic-analysis layer.
- AmenableGroups Layer 7.
- Tau Ceti `TauCeti/Analysis/Fourier/Pontryagin` modules and
  `TauCeti.MeasureTheory.ext_of_forall_mem_subalgebra_integral_eq_of_innerRegular`.

## Layer 12: Two projections, ultraproducts, and central sequences

For two self-adjoint projections p,q on H, put `M={p,q}''`, the unital von Neumann algebra they generate. All generated-algebra and pMp statements in this paragraph refer to this M, with pMp acting on pH and unit p. Give the four intersection summands and the general-position remainder. Prove
`(p-q)²` is central in the generated algebra and the span over its abelian generated
algebra of `1,p,q,pq,qp` is a star algebra. Prove pMp is abelian and generated by pqp,
construct the general-position partial-isometry equivalence and matrix units, and prove
the matrix-unit consequences of the parallelogram law from V2.
On the general-position remainder prove the generated algebra is `B ⊗̄ M₂` for B abelian and a positive contraction
b with trivial endpoint kernels, and identify
`p=diag(1,0)`, `q=[[b,sqrt(b(1-b))],[sqrt(b(1-b)),1-b]]`.
Prove the endpoint and degenerate-summand versions, classify representations of
the infinite dihedral group `C₂*C₂ ≃ ℤ⋊C₂` using its spectral involution, and derive the
same decomposition from the self-adjoint unitaries `2p-1`, `2q-1`. Own the generated-algebra
classification here; general principal angles are not part of this roadmap (Jones, §7.3, p. 46,
for the two-projection exercises).
*Needs:* V2's projection lattice, parallelogram law and polar-part membership (PolarDecomposition PD-B24), V2's spatial tensor
`B⊗̄M₂`, V3's matrix units.

For a von Neumann algebra M define an operator-norm-bounded sequence (x_n)
to be predual-centralizing when `‖x_n φ−φx_n‖_(M_*)→0` for every φ∈M_*,
using the fixed bimodule actions. Define `Ct(M)` by requiring
`α(x_n)−x_n→0` in the σ-strong* topology for every such sequence. Prove
its subgroup, inner-automorphism inclusion and normal-isomorphism transport
laws. For a faithful normal tracial state, prove equivalence of this
centralizing condition with `‖[x_n,a]‖₂→0` for every a∈M, and equivalence
of the bounded σ-strong* and L² zero-convergence conditions. Use this
definition also for `R_(0,1)` in V13. See
[Connes, §II](https://alainconnes.org/wp-content/uploads/automorphismes.pdf).
*Needs:* V4's predual bimodule actions and strong-star topology, V6's tracial L².

For every von Neumann algebra with a faithful normal tracial state,
define bounded central sequences and their L² convergence and triviality predicates.
For a type II₁ factor define property Γ by existence of a sequence of trace-zero
central unitaries. For separable II₁ factors, prove Dixmier's equivalence with
existence of a nontrivial bounded central sequence and with the usual finite-set
approximation formulation (Anantharaman–Popa, §15.2, pp. 261–266; Jones, §§16.1–16.2,
p. 107). These property Γ equivalences are factor statements;
they are not asserted for arbitrary tracial algebras.
*Needs:* V6's tracial L² and bounded-set topology, V5's trace; the ultraproduct below for the
Dixmier equivalence.

Verify this scope on M=R⊕ℂ, where R is V6's hyperfinite II₁ tensor model and
τ(x,c)=(1/4)τ_R(x)+(3/4)c. Let u_n be diag(1,−1) in the nth tensor factor
and1 elsewhere. Prove (u_n,0) is a bounded central sequence with squared L²
distance at least1/4 from every central element, while every unitary (v,z)
has |τ(v,z)|≥1/2. Thus even nontriviality modulo the center does not give a
trace-zero unitary in an arbitrary tracial algebra. Keep this distinction from
the factor theorem. Construct the tracial ultraproduct
`M^ω = ℓ∞(M)/{lim_ω ‖x_n‖₂=0}` for a free ultrafilter (Anantharaman–Popa, §5.4, pp. 75–77), its trace and constant embedding,
prove the ideal is norm closed and two-sided, quotient norm and bounded representative
lemmas, unit-ball L² completeness, and that it is a finite von Neumann algebra. Prove the converse
tracial reconstruction criterion used here: an operator-norm-bounded
unit ball complete in its faithful L² metric yields a finite normal
von Neumann representation. If M is a II₁ factor, prove M^ω is a II₁ factor: use the
Dixmier conjugacy estimate coordinatewise to rule out nonscalar
central elements, and constant trace-splitting projections for diffuseness. Define
`M_ω=M'∩M^ω`, prove its relation to sequences and invariance under isomorphism, and distinguish
ordinary central sequences from ultrafilter centrality. Construct noncommuting tail
sequences in R. Use finite-prefix expectations and matrix-unit
commutation to prove `R_ω′∩R^ω=R`, and deduce the scalar center
and diffuseness of R_ω, hence its II₁ factoriality.
*Needs:* V6's tracial L² completeness of the unit ball and hyperfinite tensor model, V5.Dixmier,
V5's comparison, Mathlib `Ultrafilter` limits.

**Checks.**

- In `R=⊗M₂(ℂ)` the unitaries `u_n=diag(1,−1)` at site n form a central sequence with `τ(u_n)=0`
  (they commute with every operator supported on the first `n−1` sites), so R has property Γ;
  they define a nonscalar element of `R_ω` with `‖u_n‖₂=1`.
- The sequence of orthogonal projections `e_n` with `τ(e_n)=1/n` maps to 0 in `M^ω`
  (`‖e_n‖₂²=1/n→0`) although `‖e_n‖=1`, and the constant sequences embed isometrically, so the
  ideal is the `L²`-null one, not the norm-null one.
- On `R⊕ℂ` with `τ(x,c)=(1/4)τ_R(x)+(3/4)c`, central elements are `(λ,z)` and
  `‖(u_n,0)−(λ,z)‖₂²=(1/4)(1+|λ|²)+(3/4)|z|²≥1/4`, while a unitary `(v,z)` has
  `|τ(v,z)|≥(3/4)|z|−(1/4)|τ_R(v)|≥1/2`: a nontrivial central sequence without a trace-zero
  central unitary, as the scope statement requires.
- For `x=u_a∈L(F₂)`, `‖x−τ(x)1‖₂=1` and `‖[u_a,u_b]‖₂=√2` (`ab≠ba` are orthogonal group elements),
  consistent with the estimate `1≤14√2`; for x=1 both sides vanish.

For an ICC group with `1∉Δ` and `Γ={1}∪Δ∪αΔα⁻¹` and three disjoint conjugates
Δ,βΔβ⁻¹,γΔγ⁻¹, prove the estimate (Jones, Theorem 16.3.1, p. 108)
`‖x-τ(x)1‖₂ ≤ 14 max(‖[x,u_α]‖₂,‖[x,u_β]‖₂,‖[x,u_γ]‖₂)`.
Supply the ℓ² coefficient estimate, a verified reduced-word partition for every finite-rank
free group of rank ≥2, and deduce its factor lacks Γ and is not R. These ultrapower and central-sequence APIs precede the V12 flow/automorphism classification; V12.J is a separate Jordan reconstruction submilestone.
*Needs:* V8's group factors and Fourier coefficients, the central-sequence definitions above,
Mathlib `FreeGroup` reduced words.

### 12.J Projection logic, normal Jordan maps and reconstruction

**V12.J.Maps — the normal Jordan map API.** Consume V2, V4.Normality and
V4.PositivePredual.
Use the native `IsStarProjection` subtype P(M), its V2 complete lattice and
complement p↦1−p, native `OrderIso`, and complex `LinearMap`/`LinearEquiv`.
Use native `SymAlg`/`IsCommJordan` and `SymAlg.sym_mul_sym` for the symmetrized
product, with comparison to the original associative C*-algebra carrier. Native
SymAlg multiplication requires `Invertible (2 : M)`; supply the inverse
`algebraMap ℂ M (1/2)` using `Invertible.map` from the nonzero scalar2,
transport `Invertible.map (algebraMap ℂ M) (2:ℂ)` to `(2:M)`
using native `Invertible.copy` and the algebraMap numeral equality. The
source scalar instance supplies inverse1/2.
A Jordan *-map is complex linear, star preserving and preserves squares of
self-adjoint elements; equivalently it preserves `(xy+yx)/2`. Develop the
identity, composition, inverse, extensionality on projections, boundedness,
positivity, unit, normality and transport APIs before reconstruction. Build
any needed bundled map by extending the native linear-map carrier, rather
than replacing native WStarAlgebra, IsStarProjection or OrderIso. Specialize
V4.Normality's normal-positive-map API and ultraweak-continuity equivalence
to Jordan *-maps, and add equivalence with preservation of arbitrary
orthogonal projection sums, using V4.PositivePredual and normal-functional
separation. These inputs have no typeI₂ or charge-extension hypothesis; this
map API and Enriched do not consume Scalar. No separability or σ-finiteness is imposed on this net-based layer.
*Needs:* V2's projection lattice, V4.Normality, V4.PositivePredual; Mathlib `SymAlg`, `IsCommJordan`,
`Invertible`, `OrderIso`.

**Checks.**

- The identity of M is a unital normal Jordan *-map and a *-homomorphism.
- The transpose on `M₂(ℂ)` is a unital normal Jordan *-automorphism that is not multiplicative:
  `(e₁₂e₂₁)ᵀ=e₁₁` while `e₁₂ᵀe₂₁ᵀ=e₂₁e₁₂=e₂₂`; so a Jordan *-map API that silently assumed
  multiplicativity would reject it.
- The zero map preserves squares, adjoints and linearity but not the unit, so unitality is a
  separate hypothesis in Dye's theorem and in the normal-map API.

**V12.J.Frame — the finite Gleason theorem.** Own the finite-dimensional frame-function
theorem. A frame function of weight w on a complex Hilbert space of dimension n is a function
f on the unit sphere of `ℂⁿ` whose sum over every orthonormal basis is the same real number w;
no probability normalization is assumed. For n≥3 prove that every bounded nonnegative frame
function is `v↦⟪v,Tv⟫` for a unique positive Hermitian T, and that `Tr T=w` (Gleason, *Measures
on the closed subspaces of a Hilbert space*, J. Math. Mech. 6 (1957), pp. 885–893).
Either route is admissible: the harmonic route on the complex sphere `S^(2n−1)` with
phase-invariant functions, its averaging operator over orthonormal frames and the resulting
identification of the constant and Hermitian-quadratic kernels; or the real `S²` route through
Legendre-polynomial expansion, followed by an explicit transfer of the real quadratic form from
every real orthonormal triple to a Hermitian form on `ℂ³` and polarization for the off-diagonal
entries. Either route proves the regularity it uses; boundedness alone is not continuity.
Prove `w≥0`; for w>0 the normalized function `f/w` is a probability frame function, and for
w=0 nonnegativity forces f=0 and T=0. In dimension 0 the empty basis forces w=0, and in
dimension 1 every frame function is `v↦w|v|²`, which is induced by `T=w`. In dimension 2 the
theorem fails: for the rank-one projection with unit Bloch vector n put
`f(n)=1/2+(1/4)sgn(n₃)` (with `sgn 0=0`); antipodal rays sum to 1, but f is not
`⟪v,Tv⟫` for any T, since such a function is affine in the Bloch vector. *Needs:* Mathlib's
finite-dimensional inner product spaces, `Matrix.PosSemidef` and Hermitian matrices; Layer 2's
projection and closed-subspace APIs.

**Checks.**

- The signed reduction used by V12.J.Scalar, in dimension 3: `f(v)=|v₁|²−1/2` has frame sum
  `1−3/2=−1/2` and is bounded below by `−1/2`; adding `1/2` gives `|v₁|²`, of weight 1, induced
  by `diag(1,0,0)`; subtracting `(1/2)I` recovers `diag(1/2,−1/2,−1/2)`, whose trace is the
  original weight `−1/2`.
- The weight is not assumed to be 1: `f(v)=2|v₁|²+|v₂|²` on `ℂ³` has weight 3 and is induced by
  `diag(2,1,0)`, of trace 3.
- The dimension-two function above is not induced: for `T=(aI+b₁σ₁+b₂σ₂+b₃σ₃)/2` the induced
  function is `Tr(T p(n))=(a+⟨b,n⟩)/2`, and agreement with f at `n=(0,0,±1)` (values 3/4 and
  1/4) and at `(±1,0,0)`, `(0,±1,0)` (value 1/2) forces `1/2+n₃/4`, whose value at `n=(1/√2,0,1/√2)` is
  `1/2+1/(4√2)≈0.677`, whereas `f=3/4` there.

**V12.J.Scalar.** Own the scalar Mackey–Gleason–Bunce–Wright extension theorem: if M has no
nonzero typeI₂ central summand, μ:P(M)→ℂ satisfies μ(p+q)=μ(p)+μ(q) for pq=0,
and `∀p, ‖μ(p)‖≤C` for a stated C≥0, there is a unique bounded complex-linear
functional extending μ. Prove the uniform estimate `‖φ‖≤4C`, positivity and
`‖φ‖=φ(1)` for positive μ, and normality of a positive extension iff μ is
completely orthogonally additive. For σ-finite M prove countable additivity
suffices; do not identify these notions on arbitrary M. The signed scalar
proof includes the bounded quasi-linear extension, matricial corner/patching,
properly-infinite approximate-additivity and finite-II₁ signed-measure
arguments, and central-summand assembly. For the signed finite-dimensional input use
V12.J.Frame: if a real frame function is bounded by C, add C to make it nonnegative (in
dimension n its weight rises by n·C), apply V12.J.Frame and subtract C·Id; split complex
functions into real and imaginary parts. Prove the frame constants and phase/ray compatibility
in this reduction. This sublayer follows V12.J.Frame, V0–V6 and V4.PositivePredual. This is the
only generic von Neumann charge-extension owner.
*Needs:* V12.J.Frame, V0–V6 (matrix units, corners, type decomposition, the II₁ trace),
V4.PositivePredual; Bunce–Wright, *The Mackey–Gleason problem*, is the source.



**V12.J.Dye lattice input.** Consume V6.LatticeTypes for the purely lattice
center and I₂-central-part transport before Dye reconstruction. This neither
uses a state extension nor depends on the Jordan theorem it supports. It is
an input to Dye, not to V12.J.Scalar.
*Needs:* V6.LatticeTypes.

**V12.J.Dye.** Consume V12.J.Maps. Prove Dye's extension theorem in the following exact form
(the AW*-algebra generalization, without the normality conclusion, is Hamhalter,
arXiv:1408.4597, Theorem 4.3, p. 14; normality and uniqueness are proved here). For nonzero complex
von Neumann algebras M,N, if M has no typeI₂ central summand and
α:P(M)≃P(N) preserves orthogonality in both directions, there is a unique
normal unital Jordan *-isomorphism Φ:M→N with Φ(p)=α(p). Derive the order,
complement and arbitrary-supremum laws from the orthoisomorphism. Pull back
normal positive functionals through α, apply the preceding scalar extension
and its complete-additivity normality criterion, and use V4.PositivePredual's positive spanning and exact self-adjoint
base-norm formula to construct the bounded predual map, then V4.Core duality
for its adjoint. Positive masses at1 are preserved; difference-decomposition
independence comes from uniqueness of scalar extension. Complexification
has the explicit bound at most twice the self-adjoint bound, sufficient
for the adjoint. Orthogonal spectral-step approximation
proves square preservation; order/spectral norm and projection density prove
injectivity and surjectivity. Prove identity/composition/inverse compatibility
and the resulting group isomorphism between projection orthoautomorphisms
and normal Jordan *-automorphisms. The target N need not be assumed separately
free of typeI₂; the earlier lattice criterion supplies this consequence.

Keep the typeI₂ summand in the theory. Any projection orthoisomorphism carries
central projections and the typeI₂ central part to their counterparts. Its
restriction off that part has the unique extension above. The centers of the
typeI₂ parts determine an abstract Jordan isomorphism via M₂(Z), but that map
need not extend the given orthoisomorphism. On M₂(ℂ), use the nonextendible antipodal
example V12.J.Bloch below. On the scalar/abelian part use the Boolean projection
isomorphism and bounded spectral approximation, with no dimension-two exclusion.
Treat the zero algebra separately, where the projection lattice is a singleton
and there is no normalized state.
*Needs:* V12.J.Maps, V12.J.Scalar, V4.PositivePredual, V4.Core duality, the lattice input above,
V12.J.Bloch for the type I₂ counterexample; Hamhalter, Theorem 4.3.


**V12.J.Bloch — the type I₂ boundary example.** In M₂(ℂ) write the rank-one projection with
unit Bloch vector n=(x,y,z) as `p(n)=(I+xσ₁+yσ₂+zσ₃)/2`, with
`σ₁=!![0,1;1,0]`, `σ₂=!![0,−i;i,0]`, `σ₃=!![1,0;0,−1]`; then `p(n)p(m)=0` exactly when
m=−n. The map `(x,y,z)↦(x,y,2z)/sqrt(x²+y²+4z²)` is a bijection of the unit sphere commuting
with n↦−n, so it induces an orthoautomorphism α of P(M₂(ℂ)) fixing 0 and I. Prove that α
does not extend to a Jordan *-automorphism: every Jordan *-automorphism of M₂(ℂ) acts on Bloch
vectors by an orthogonal map of ℝ³, and α is not orthogonal. Also prove that α pulls the Born
state `ω(p(n))=(1+z)/2` back to `p(n)↦ω(α(p(n)))`, which agrees with that Born state at the
three coordinate axes but not at `n=(1/√2,0,1/√2)`, so it is a non-Born frame function.
*Needs:* Mathlib `Matrix`, V12.J.Maps.

**Checks.**

- At `n=(1/√2,0,1/√2)` the image is `(1,0,2)/√5`, so the pulled-back value is
  `(1+2/√5)/2≈0.947`, whereas the Born state `(1+z)/2` gives `(1+1/√2)/2≈0.854`.
- The axes are fixed: `(0,0,±1)↦(0,0,±1)` and `(±1,0,0)↦(±1,0,0)`, so axis values alone
  cannot detect the failure.
- The map is not orthogonal: `(1/√2,0,1/√2)` and `(1/√2,0,−1/√2)` are orthogonal, but their
  images `(1,0,2)/√5` and `(1,0,−2)/√5` have inner product `−3/5`.


**V12.J.Enriched.** Consume V12.J.Maps. For all nonzero M,N, including arbitrary typeI₂ central summands, prove the
enriched comparison theorem: an affine bijection β:S_n(M)→S_n(N) of their full
normal state spaces extends uniquely to an order isomorphism of the real
self-adjoint preduals by
`T(tω)=tβ(ω)` (t≥0), then by positive differences, consuming V4.PositivePredual without a
tracial hypothesis. Prove independence of the
difference decomposition, base-norm isometry and bounded complexification.
Its adjoint J:N→M is normal, unital and an order isomorphism. Prove that
the extreme points of the effect interval [0,1] are exactly projections, using
positive-square-root/compression identities for one direction and a nonzero
continuous spectral perturbation supported inside (0,1) for the other. Thus
J and J⁻¹ carry projections to projections. Linearity carries orthogonal
finite projection sums to such sums; bounded spectral-step approximation then
proves square preservation.
Thus Φ=J⁻¹ is the unique normal Jordan *-isomorphism with
`β(ω)=ω∘Φ⁻¹`. No continuity assumption on β is needed; prove the resulting
norm continuity rather than assuming it. If a logic orthoisomorphism α is
also supplied and `β(ω)(α(p))=ω(p)` for all ω,p, prove Φ(p)=α(p) by normal-state
separation. Prove that a bijection β satisfying all these evaluation identities
is automatically affine, by evaluating every convex mixture on α(P(M)).
This restores extension of the given map on typeI₂ precisely
with the full affine state/evaluation hypothesis, not by dropping its summand.
*Needs:* V12.J.Maps, V4.PositivePredual, V4.Core duality, Mathlib's continuous functional calculus
for the spectral perturbation.

**V12.J.CentralSplitting.** Consume V12.J.Maps. Prove a normal Jordan *-isomorphism splits over central projections into a
*-isomorphism and a complex-linear *-anti-isomorphism. The splitting is not
unique on an abelian summand. Prove transport of centers, central support,
Murray–von Neumann projection equivalence/finiteness, and the complete type
decomposition from V6. It gives classification of projection/state operational
presentations up to Jordan isomorphism, not a choice of associative orientation
or a classification of all factors. A general nonfactor action can have
different multiplicative/antimultiplicative behavior on central pieces; it
need not have one global C₂ grading. Spatial *-implementations in standard
form consume V11 separately; the Jordan conclusion alone does not assert a
unitary/antiunitary normalizer in an arbitrary original representation.
*Needs:* V12.J.Maps, V2's central projections and central support, V5's equivalence and finiteness
transport, V6's type decomposition.


Maps and Enriched precede and do not consume Scalar or V12.J.Frame; only the
bare-projection Dye route consumes Scalar and its finite-frame input.
They add no V12.J prerequisite to V0. Use SymAlg only to compare Jordan multiplication
on the existing associative W*-carrier, not to replace that carrier.
The scalar endpoint is [Bunce–Wright, *The Mackey-Gleason Problem*](https://arxiv.org/abs/math/9204228).
The [Dye/Gleason extension formulation](https://arxiv.org/abs/1408.4597)
provides a statement-level comparison; the constructions above remain
explicit Tau Ceti proof targets.


### Examples

- Two projections in general position are `diag(1,0)` and
  `[[b,sqrt(b(1−b))],[sqrt(b(1−b)),1−b]]` over an abelian algebra.
- `R⊕ℂ` with `τ=(1/4)τ_R⊕(3/4)` has a nontrivial central sequence but no trace-zero unitary;
  the free group factors `L(F_n)`, n≥2, lack property Γ and are not R.
- `R_ω′∩R^ω=R`, and `R_ω` is a II₁ factor.

### Dependencies

- Layers 1–6 and 11; V6.LatticeTypes for Dye.
- Mathlib `SymAlg`, `IsCommJordan`, `Matrix.PosSemidef`.

## Layer 13: Hyperfiniteness and injective classification

### 13.1 Tensor-independent CP and extension foundations (V13a)

Develop positive and completely positive maps on concrete operator algebras,
their matrix-order laws, boundedness, amplifications, unitization and
point-ultraweak compactness. A concrete operator system is a unital
self-adjoint linear subspace of B(H) with its inherited matrix positive
cones. Construct its CP-map and restriction APIs. Prove Arveson's
completely positive extension theorem for inclusions of concrete operator
systems and B(K)-valued CP maps, using matrix-order separation and
scalar/vector functional extension (Arveson, *Subalgebras of C*-algebras*, Acta Math. 123
(1969), Theorem 1.2.3). Prove Tomiyama's theorem, `tomiyama`, for a possibly nonunital
complex C*-algebra A, a possibly nonunital star subalgebra S, and a bounded complex linear
map P:A→A with P(A)⊆S, P(s)=s for every s∈S, and ‖P‖=1. Then P is positive,
`P(axb)=aP(x)b` for every a,b∈S and x∈A, and P is completely positive, expressed by a
`CompletelyPositiveMap A A` whose underlying linear map is P. The range and fixing conditions
imply P²=P and S=ker(1−P), so S is automatically norm closed; no unitality or normality is
assumed (Hiai, Theorem 6.5, pp. 55–56; Tomiyama, Proc. Japan Acad. 33 (1957), Theorem 1,
pp. 608–609, for the unital ambient case; Peterson, Theorem 6.2.1, p. 98, for the unital
inclusion case). Define injectivity by CP extension and prove its
equivalence to a contractive projection B(H)→M, of norm one when M≠0, for a faithful normal
representation; such a projection need not be normal. Prove injectivity
passes to expected subalgebras, corners and type-I amplifications by
extending and compressing these projections. This layer uses V0–V3, V4.Core and V4.Normality for
concrete representations, positive functionals and matrix algebras; it
does not use C*-tensor norms, nuclearity or semidiscreteness.
*Needs:* V0–V3, V4.Core, V4.Normality; Mathlib `CompletelyPositiveMap`, `CStarMatrix`, matrix
positivity and Banach–Alaoglu for point-ultraweak compactness.

**Checks.**

- `B(H)` is injective (the identity projection), and `ℓ∞(ℕ)⊂B(ℓ²)` is injective through the
  diagonal expectation `x↦diag(⟨e_n,xe_n⟩)`, a norm-one projection; it is normal here, although
  the definition does not require normality.
- The map `x↦x₁₁e₁₁+x₂₂e₂₂` on `M₂(ℂ)` is a norm-one projection onto the diagonal subalgebra and
  is completely positive, as Tomiyama's theorem predicts; `x↦x₁₁e₁₁+x₂₂e₂₂+x₁₂e₂₁` is not a
  projection onto a subalgebra and is not positive. For diagonal a=diag(2,3), b=diag(5,7),
  and x=[[1,2],[3,4]], both E(axb) and aE(x)b equal diag(10,84). At every matrix level E
  is the sum of the two positive compressions by `1⊗e₁₁` and `1⊗e₂₂`. The zero map has norm
  0, while transpose has range M₂ but sends e₁₂ to e₂₁, so fails the fixing hypothesis.
- Nonunital subalgebras are included: `P(x)=e₁₁xe₁₁` maps M₂ onto ℂe₁₁, has norm 1 and
  fixes its range although P(1)=e₁₁≠1; for c₀ the identity has norm 1 and is completely
  positive. On the zero algebra every linear map has norm 0, so no norm-one projection exists.
- Arveson's hypothesis is complete positivity, not positivity: the transpose of `M₂(ℂ)` is a
  positive unital map whose amplification sends the positive matrix `Σ_(i,j) e_(ij)⊗e_(ij)` to
  the flip, which has eigenvalue −1, so it is not completely positive and the theorem does not
  apply to it.
- Extensions are not unique: the state `(a,b)↦(a+b)/2` of the diagonal subalgebra of `M₂(ℂ)`
  extends to `Tr(ρ·)` for every `ρ=[[1/2,c],[conj c,1/2]]` with `|c|≤1/2`; the theorem asserts
  existence only.

### 13.2 Semidiscreteness, approximation and classification (V13b)

This layer consumes V13a and opens with the spatial tensor norm it needs.

**V13b.SpatialNorm — the spatial C*-norm on an algebraic tensor product.** For concrete
C*-algebras A⊆B(H) and B⊆B(K), using V2's completed Hilbert tensor `H⊗̂K` and its bounded
operator tensor maps, define the spatial norm on the algebraic tensor product A⊙B by
`‖Σᵢ aᵢ⊗bᵢ‖_min=‖Σᵢ aᵢ⊗bᵢ‖_(B(H⊗̂K))`. Prove that the map A⊙B→B(H⊗̂K) is injective (for
linearly independent bᵢ, test on vectors ξ⊗η and separate the aᵢ by vector functionals of B),
so this is a norm, that it is a C*-norm (`‖xy‖≤‖x‖‖y‖`, `‖x*x‖=‖x‖²`), and that
`‖a⊗b‖_min=‖a‖‖b‖`. Define `A⊗_min B` as the norm closure of the image, a C*-subalgebra of
`B(H⊗̂K)`. Prove representation independence (Takesaki I, Theorem IV.4.9): for faithful
representations π₁ of A on H₁ and π₂ of B on H₂, `‖(π₁⊗π₂)(x)‖=‖x‖_min` for every x∈A⊙B.
Route: for a faithful representation π of a C*-algebra, the weak-star closed convex hull of the
vector states ω_ζ∘π is the whole state space (a state ρ outside it would be separated by a
self-adjoint a with `ρ(a)>sup_ζ⟨ζ,π(a)ζ⟩=max σ(π(a))=max σ(a)`, which no state satisfies);
write `‖(π₁⊗π₂)(x)‖²` as the supremum of `ω(x*x)` over the positive functionals ω on A⊙B that
are weak-star limits of vector functionals of π₁⊗π₂ on elementary tensors, and prove that this
set of functionals, hence the supremum, is determined by the state spaces of A and B alone
through V2's slice maps and polarization, so that it is the same for `(π₁,π₂)` and for the given
inclusions. Prove the slice maps: for a positive functional ψ of B, `R_ψ(a⊗b)=ψ(b)a` extends to
a bounded map `A⊗_min B→A` with `‖R_ψ‖≤‖ψ‖`, by realizing ψ as a vector functional of the
faithful representation `π_B⊕π_ψ` of B and using representation independence. If A≠0, testing
elementary tensors with a fixed norm-one a∈A gives `‖R_ψ‖=‖ψ‖`; if A=0, R_ψ has norm zero.
For arbitrary ψ∈B*, obtain a bounded extension by its four-term decomposition into positive
functionals. Symmetrically, for a positive functional φ of A, `L_φ:A⊗_min B→B` has norm at
most ‖φ‖, equal to ‖φ‖ when B≠0 and zero when B=0; extend to arbitrary φ∈A* by decomposition. Prove isometric
functoriality for inclusions `A₀⊆A`, `B₀⊆B`: `A₀⊗_min B₀⊆A⊗_min B` isometrically. Quotient
behaviour (exactness) is not asserted here. For a von Neumann algebra M⊆B(H) with commutant M′
this gives the concrete `M⊗_min M′⊆B(H)⊗_min M′⊆B(H⊗̂H)` used below, with the same norm on
`M⊙M′` whichever of the two completions it is read in.
*Needs:* V2's completed Hilbert tensors, bounded operator tensor maps and vector-functional
slice maps; V0's states and GNS; Mathlib's continuous functional calculus and spectral
permanence for `max σ(a)`; Mathlib's geometric Hahn–Banach separation
(`geometric_hahn_banach_closed_point` in the weak-star topology of `A*`); BanachSpaceTheory B1's
weak-star continuity criterion by evaluation (the separating functional is evaluation at an
element of A).

**Checks.**

- For `(A,B,ψ)=(0,ℂ,id)`, the slice map has norm 0 while ‖ψ‖=1; for
  `(ℂ,ℂ,id)` both norms are 1; for ψ=0 both are 0. Exchanging the factors gives the same
  three tests for L_φ and shows why its equality requires B≠0.
- In `M₂(ℂ)⊙M₂(ℂ)=M₄(ℂ)`, `u=e₁₂⊗e₁₂+e₂₁⊗e₂₁` exchanges `e₁⊗e₁` and `e₂⊗e₂` and kills the
  other two basis vectors, so `u*u` is a rank-two projection and `‖u‖_min=1`, whereas the sum of
  the elementary-tensor norms is 2: the spatial norm of a sum is not the sum of cross norms.
- The spatial norm is a cross norm, not a Hilbert–Schmidt pairing: `‖1⊗1‖_min=1` in
  `M₂(ℂ)⊙M₂(ℂ)`, whereas the Hilbert–Schmidt norms would give `‖1‖₂‖1‖₂=2`.
- For a compact Hausdorff X represented faithfully on `ℓ²(X)` (X as a set) by multiplication,
  `C(X)⊗_min C(X)=C(X×X)` with the supremum norm: for continuous `f:X→[0,1]` attaining both 0
  and 1, `‖f⊗1−1⊗f‖_min=sup_(x,y)|f(x)−f(y)|=1`, computed on the eigenvectors `δ_x⊗δ_y`.
- Representation independence is a statement about norms, not operators: `A=ℂ²` acting on ℂ²
  diagonally and on ℂ³ with the first coordinate doubled gives different operators
  `(π₁⊗id)(x)` for `x=(1,0)⊗e₁₁+(0,1)⊗e₂₂∈A⊙M₂(ℂ)`, but both are projections, of norm 1.

For separable-predual algebras define hyperfiniteness by increasing finite-dimensional
subalgebras whose union generates M, with equivalent finite-set approximation criteria.
For finite algebras prove the bounded L² formulation, stability under corners and tensor
products, and the precise unital/nonunital approximation comparisons. Develop quantitative L²
perturbation lemmas on uniformly operator-norm-bounded approximate projections, partial
isometries and matrix units: for each n and ε>0 obtain δ>0 so adjoint, multiplication and
unit errors below δ imply exact matrix units within ε in L². Include nearby-unitary
conjugacy and dyadic trace adjustments. Prove approximate finite-set dyadic matrix
containment, nested containment by unitary perturbation, and uniqueness of the hyperfinite
II₁ factor R by trace-preserving intertwining (Anantharaman–Popa, §11.2, pp. 185–190). Identify
`L(S_∞)` with R.
*Needs:* V6's tracial L² and hyperfinite model, V5's trace and comparison, V3's matrix units,
V8's group factors for `L(S_∞)`.

**Checks.**

- `R=⊗M₂(ℂ)` is hyperfinite through `M_(2^n)(ℂ)`; `L(ℤ)≅L∞(𝕋)` through the dyadic step
  functions `ℓ∞(2^n)`; `B(ℓ²)` through `A_n={x : x=P_nxP_n+λ(1−P_n)}≅M_n(ℂ)⊕ℂ`, whose union is
  weakly dense; the zero algebra is hyperfinite with the trivial sequence.
- `L(F₂)` is not hyperfinite: it has no property Γ (the ICC estimate of V12), while every
  hyperfinite II₁ factor is R and has Γ.
- Semidiscreteness is point-ultraweak, not norm: on `ℓ∞(ℕ)` the contractive CP maps
  `x↦(x_1,…,x_N,0,…)` factor through `ℂ^N⊂M_N(ℂ)` and converge to the identity coordinatewise,
  but for `x=(1,1,1,…)` the norm distance is 1 for every N.

Use V13a's CP extension, projection and injectivity permanence results.
Prove tensor products of semidiscrete algebras semidiscrete by tensoring
normal matrix CP maps and bounded ultraweak approximation; deduce
injectivity of their spatial tensor products after the equivalence.
Prove hyperfinite algebras injective by finite-dimensional CP extension
and point-ultraweak compactness. These permanence results precede their
use in the approximation and central-reduction arguments. Define semidiscreteness by normal finite-matrix
completely positive contractive factorizations approximating the identity point-ultraweakly.
Prove the equivalent unital formulation for nonzero unital algebras and
the upgrade to pointwise σ-strong* convergence by convex combinations. Prove
injectivity iff semidiscreteness for arbitrary von Neumann algebras by the
reductions below. Prove the commuting-representation minimal-norm criterion
(Takesaki III XV.3, Theorem 3.1 and Definition 3.5; Anantharaman–Popa, §§10.2–10.3, pp. 161–172,
and Peterson, §6.3, pp. 100–104, for the finite case): for every concrete
von Neumann algebra M⊆B(H), with no separability hypothesis, injectivity
and semidiscreteness are equivalent to
`‖Σᵢ xᵢyᵢ‖≤‖Σᵢ xᵢ⊗yᵢ‖_min` for finite xᵢ∈M,yᵢ∈M′.
Equivalently multiplication extends to a unital star homomorphism
`M⊗_min M′→B(H)`. First prove semidiscreteness implies the
min-norm inequality by the finite-matrix factorization bound. Prove the
inequality implies injectivity by extending multiplication to
`B(H)⊗_min M′` with V13a's Arveson theorem and using the
M′-bimodularity of the extension. Independently prove that the inequality
implies normal finite-matrix CP approximation by CP separation, with
the equivalent norm approximation on the predual. Explicitly factor
the latter through `M_n(ℂ)_*` with its trace norm, not M_n with
operator norm. Passing to the Banach adjoint/predual maps exchanges
the operator-norm matrix stage with its trace-norm dual. Use the
Banach weak topology `σ(M_*,M)` when applying
convex weak-closure/norm-closure comparison. Construct the positive
tensor-state/CP-map correspondence, its complete-order range and the
normal matrix-factorization closure lemmas needed for this separation.
These implications
precede the crossed-product restriction argument. Only the converse
from injectivity to the min-norm inequality and semidiscreteness uses
the finite/semifinite/type-III reductions below.
In V11's standard form identify M′ with
Mᵒᵖ by `yᵒᵖ↦Jy*J`, and transport the criterion to M⊙Mᵒᵖ; this is the
form used by the crossed-product restriction argument below. First, for finite algebras construct hypertraces on B(L²M)
extending τ and central under M, prove the Powers–Størmer inequality
`‖a^(1/2)-b^(1/2)‖₂²≤‖a-b‖₁` for positive L¹ elements, and prove Connes's finite-rank
Følner criterion: finite subsets of the left action admit nonzero finite-rank projections
whose Hilbert–Schmidt commutators divided by their Hilbert–Schmidt norms are arbitrarily
small, with normalized compressed traces approximating τ. Derive finite-dimensional
CP approximations through normal finite-matrix maps: prove the
spatial-norm continuity of the commuting left/right multiplication
representation on M⊙Mᵒᵖ, and use CP separation/extension to obtain
semidiscrete maps. Prove semidiscreteness stable under type-I
amplification, by finite-rank matrix compressions and tensoring the CP
factorizations. This is the finite trace criterion. Consume invariant means, discrete Følner theory,
abelian amenability (including ℝ with its discrete topology) and locally
compact amenability from [AmenableGroups, Layers 5–7](../AmenableGroups/README.md#layer-5-følner-criteria-for-arbitrary-discrete-groups).
Prove their operator-algebra averaging implications: injectivity of
group algebras and nonsingular crossed products of injective bases. Establish the Rokhlin tower theorem for aperiodic invertible probability-preserving
maps and use it to construct finite-dimensional approximants for ergodic ℤ crossed products.
Include polynomial-growth groups as amenable examples.
*Needs:* V13a, V13b.SpatialNorm, V11's standard form (`M′≃Mᵒᵖ`), V4's predual and the weak
topology `σ(M_*,M)`, V6's L² (Powers–Størmer), AmenableGroups Layers 5–7, V8's crossed products,
Mathlib's trace norm on `M_n(ℂ)_*`; the sources named at the criterion.

Before using the finite theorem in the general reduction, prove
semidiscrete II₁ factors with separable predual hyperfinite by
Haagerup 1985 §§3–5. Rebalance faithful matrix states to rational
eigenvalue weights by finite block amplification, constructing reverse
ucp maps and their Schwarz/state-norm estimates. Obtain trace-preserving
normal ucp factorizations in both directions. For a trace-preserving
ucp map T out of a matrix subfactor and every δ>0 construct a Kraus
family with `Σa_i*a_i=Σa_i a_i*=1` and
`‖T(x)−Σa_i*xa_i‖≤δ‖x‖` on that subfactor. Use relative-commutant
Dixmier averaging and exact normalization of the two sums; the return
map itself is approximated rather than required to equal that Kraus sum.

Prove the δ-related tuple theorem: for every n,ε>0 some δ>0
ensures that unitary tuples u_k,v_k satisfying
`Σ_i‖a_i u_k−v_k a_i‖₂²<δ` for such a family are simultaneously
L²-close after one unitary conjugation. Construct the exact intertwiners
in a tracial ultrapower, compare the two diagonal projections on every
central projection of their tuple commutant, and descend the unitary
to a representative. Use polar decomposition of the matrix contractions,
this theorem and the CP factorizations to obtain approximants inside
an actual finite-dimensional subfactor of M. Prove the local-to-nested
criterion by approximate matrix-unit conjugacy and a summable error
schedule, obtaining an increasing dense sequence of actual matrix
subalgebras of M.
*Needs:* V12's tracial ultrapower, V5.Dixmier's averaging in relative commutants, V2's polar
decomposition, the CP factorizations above; Haagerup 1985, Theorem 2.2, Lemmas 3.1–3.4,
Proposition 3.5, Theorem 4.2, Proposition 5.2 and Theorem 5.3; Anantharaman–Popa, §11.1.

For separable properly infinite semidiscrete algebras prove the
Haagerup 1985 §2 local approximation theorem: embed the finite matrix
factor, implement its ucp return map as `x↦v*xv` for an isometry v,
approximate v σ-strongly by unitaries, and conjugate the finite matrix
factor to approximate the prescribed operators in
`‖x‖_φ#=sqrt(φ(x*x+xx*)/2)`. Prove the Elliott–Woods local-to-nested
matrix criterion, with state seminorms and exact containment correction.
This argument includes properly infinite algebras with center.
*Needs:* V5's properly infinite isometries, V1's Kaplansky theorem, V4's normal states and their
seminorms; Haagerup 1985, §2.

Handle separable finite nonfactor algebras by Takesaki III XVI.1.9's
stabilization/reduction: the preceding finite trace criterion makes M
semidiscrete, hence M⊗̄B(ℓ²) semidiscrete. Its properly infinite
approximation gives an AF C*-algebra A with `A''=M⊗̄B(ℓ²)`.
Disintegrate its separable representation by V4.0.Decomposition, proving the fiber
amplifications are AFD. Compare their II∞ factors with R⊗̄B(ℓ²),
pass injectivity to finite corners and apply the II₁ factor theorem.
Use V5's measurable trivialization to reassemble the type-II₁ part as
`Z(M_II₁)⊗̄R`, and the analogous II∞ part as
`Z(M_II∞)⊗̄R⊗̄B(ℓ²)`. Prove the finite type-I summand AFD by
central simple-function approximation on its countable matrix-size
strata; it is not identified with a diffuse R tensor factor.
Prove the finite-algebra injective/hyperfinite equivalence with its
separable-predual hypothesis. Type-III classification is not an input
to any of these approximation arguments.
*Needs:* the finite trace criterion and the properly infinite theorem above, V4.0.Decomposition,
V5's measurable trivialization, V6's type decomposition; Takesaki III, XVI.1.9.

Establish the general injectivity/semidiscreteness theorem before using
factor classification. Use the injectivity permanence proved above. Prove semidiscreteness passes from
the von Neumann crossed product by ℝ to its coefficient algebra, using
the commuting-representation tensor norm characterization and CP separation.
In a finite algebra with a faithful normal tracial state, approximate a finite set
inside its generated separable-predual subalgebra; the trace-preserving
expectation makes that subalgebra injective. Apply the finite theorem and
compose its approximations with this expectation. Pass to semifinite
algebras using finite-trace corners. For a σ-finite injective type III
algebra M, its modular core N is semifinite. Use Takesaki duality
`N⋊ℝ≃M⊗̄B(L²ℝ)`, injectivity of this amplification, and an expectation
onto N obtained by averaging the second dual action over ℝ with the
discrete topology. Thus N is injective and semidiscrete, and the
crossed-product restriction theorem gives semidiscreteness of M.
For arbitrary M, construct an increasing net of σ-finite projections
with supremum 1 from finite joins of supports of normal states, and
pass the CP approximations of the injective corners to M. Account for
the complementary unit with a normal state when making the approximants
unital. Conversely obtain an expectation from the semidiscrete CP nets
by extension and point-ultraweak compactness. No sequential approximation
or factor classification is assumed in this general equivalence.
*Needs:* V13a's permanence, V13b.SpatialNorm's criterion, V11's continuous decomposition and
Takesaki duality, V7.Index's trace-preserving expectation, AmenableGroups Layer 6 (ℝ with the
discrete topology is amenable), V4.Normality's supports; Runde, 6.4.14 and 6.4.24–6.4.25, and
Takesaki III, XV.3.

Using V11's general standard form and J-conjugation, prove that M is
injective iff its commutant is injective in any faithful normal
representation. Supply invariance under normal spatial isomorphisms,
type-I amplification and full corners when changing representations.
*Needs:* V11's standard form and `J`; V13a's injectivity permanence.

Now combine the general injectivity/semidiscreteness equivalence with
the classification-independent finite and properly infinite approximation
theorems to prove injective iff hyperfinite for all separable-predual
algebras. Prove the reverse implication by finite-dimensional expectations,
CP extension and weak compactness. Prove injectivity stable under
amenable locally compact second-countable crossed products, using
semidiscrete maps and interval Følner averages for ℝ; deduce their
hyperfiniteness when separable. This full equivalence precedes the
AFD factor classification below. Deduce every infinite-dimensional
**factor** subalgebra of R is isomorphic to R: its normal trace-preserving
expectation gives injectivity, and the finite classification identifies it.
*Needs:* every preceding item of this layer; AmenableGroups for amenable crossed products;
V7.Index's expectation for the subfactor corollary.

For countable nonsingular measured equivalence relations R on standard
probability spaces define amenability by a positive unital invariant
mean `P:L∞(R,m)→L∞(X,μ)`, covariant under all relation partial
isomorphisms. Construct Reiter-kernel finite-set approximations directly
from this mean by predual convex separation, retaining quasi-invariance
and the Radon–Nikodym cocycle. Prove injectivity of the untwisted
regular algebra equivalent to this amenability: restrict a norm-one
projection on B(L²R) to the arrow-function multiplication algebra,
use the Cartan masa for its range and Tomiyama bimodularity for
covariance. In reverse, average bounded measurable random-operator
matrix coefficients by the mean; prove measurability, boundedness,
range, positivity, idempotence and norm one, then compose with a
projection onto the decomposable type-I algebra. No measurable
quotient space of nonsmooth classes is assumed.
*Needs:* V11's measured equivalence relations, Cartan expectation and Radon–Nikodym cocycles,
V13a's Tomiyama theorem, V4's predual separation; Connes–Feldman–Weiss, Definitions 5–6 and
Proposition 7.

Prove Connes–Feldman–Weiss hyperfiniteness without an ergodicity
hypothesis. Exhaust R by sets with bounded source/range fibers and
bounded logarithmic module. From the invariant mean use L¹ convex
separation and level-set thresholding to obtain local finite-subrelation
Følner bounds. Select disjoint finite neighborhoods on a positive
measure set. A maximal disjoint-support construction exhausts the
base and gives finite subrelations approximating each bounded set.
Choose summable boundary/tail errors; their eventual intersections
form an increasing finite-subrelation cover of R modulo null sets.
Prove the reverse implication by finite-class averaging and compactness.
Consume V11's single-transformation comparison. These are measured
principal-relation theorems, with the untwisted operator-algebra
comparison just stated.
*Needs:* the amenability definition above, V11's single-transformation comparison and hyperfinite
relations; Connes–Feldman–Weiss, Lemmas 8–9 and Theorem 10; Anantharaman–Popa, §12.5,
pp. 208–212, for the probability-preserving case.

Prove uniqueness of the injective II∞ factor and, for each 0<λ<1,
the injective III_λ factor, via the trace-scaling outer conjugacy and discrete
decomposition, using the cocycle-crossed-product isomorphism of V11. Prove injective III₀ factors classified by conjugacy
of their flows of weights, with every properly ergodic flow realized.
Prove injective III₁ uniqueness by ordinary bicentralizer triviality
and the product-state criterion below. Construct all models and prove
classification exhaustive. Develop these prerequisites before applying
the classification assertions.
*Needs:* every preceding item of this layer and V11's discrete and continuous decompositions.


- Define approximate innerness by pointwise predual-norm closure of inner
  automorphisms and centrally trivial automorphisms by bounded central
  sequences. Put the pointwise predual-norm Polish topology on Aut(R)
  and Aut(R_(0,1)); prove Borel/continuous evaluation, composition,
  inverse and trace-module maps for V4.0.Decomposition's selection and the III₀
  cocycles. Prove `closure(Int(R))=Aut(R)` by conjugating the two
  unital embeddings of each dyadic matrix subfactor, then using its
  dense union. Prove `Ct(R)=Int(R)` and `Ct(R_(0,1))=Int(R_(0,1))`.
  Prove `ker(mod:Aut(R_(0,1))→ℝ₊*)=closure(Int(R_(0,1)))`
  by finite-trace corners and approximate matrix-unit conjugacy.
  Define the outer period as the least positive n with αⁿ inner,
  infinity when absent, with a crosswalk to the source label 0. Define
  the scalar obstruction by α(u)=ζu when αⁿ=Ad(u), and prove its
  independence and ζⁿ=1. Construct the periodic models s_n^ζ.
  Prove the noncommutative Rokhlin tower theorem for centrally free
  powers on R_ω: obtain cyclic projection partitions with finite-set
  commutation and arbitrarily small L² errors. Prove stability of the
  induced aperiodic automorphism on R_ω, solving its unitary cocycle
  equation by tower sums and diagonalization. Build tensor-factor
  absorption, approximate intertwining and the periodic obstruction
  comparison; prove Connes's outer-conjugacy classification by period
  and scalar obstruction. Outer conjugacy here includes an inner
  perturbation and is distinct from ordinary conjugacy.
  For R⊗̄B(ℓ²) prove trace-module classification and the cocycle-removal
  theorem upgrading fixed nonunit trace modulus λ to ordinary
  conjugacy. Supply the central sequence/stability and successive
  finite-corner intertwining used in Takesaki XVII.3.12 and the
  Connes–Takesaki stability upgrade.
  *Needs:* V12's central sequences and ultrapower `R_ω`, V4.0.Decomposition's Polish structures,
  V11's trace-scaling automorphisms; Connes 1975 (outer conjugacy), Connes, *Periodic
  automorphisms*, Theorems 5.1 and 6.2, and Takesaki III, XVII.3.12.
- For III₀, use the already proved AFD equivalence and V11's continuous
  decompositions. Identify the semifinite core as `Z(core)⊗̄R_(0,1)`.
  Disintegrate its dual flow into measurable automorphism cocycles
  on R_(0,1), and compute their trace modules from global trace scaling
  and the Radon–Nikodym cocycle on the center. A flow conjugacy gives
  the same fiber modules. Prove the measurable cohomology correction:
  equal-module cocycles can be matched modulo approximately inner
  automorphisms, choose measurable unitary corrections and eliminate
  the circle-valued 2-cocycle on a cross-section. Construct the
  Rokhlin/coboundary and measurable-selection arguments of
  Takesaki XIII.3.26,3.29,3.34, including the action and null-set
  coherence. Prove automatic continuity of measurable unitary 1-cocycles
for these strongly continuous ℝ-actions, after changing null-set
representatives, and apply it to the Borel corrections. Prove the resulting cocycle-conjugate core actions have
  isomorphic crossed products, giving the forward classification.
  The converse is V11's functorial flow transport.
  Consume V11's measurable cross-sections, nonsingular suspensions
  and free odometer/skew-product realization of properly ergodic flows.
  Prove these relation models AF by their finite-subgroupoid exhaustion. Prove Krieger's orbit-equivalence theorem for these ergodic
  AF groupoids through full-group closure and modulus cohomology,
  as in Takesaki XVIII.2.1–2.7. Show each AFD III₀ factor has this
  abelian ℤ-crossed-product presentation. For general III₀ factors
  build a faithful lacunary weight of infinite multiplicity from a
  lacunary flow cross-section, its semifinite centralizer and discrete
  ℤ-decomposition, retaining its nonconstant central trace cocycle.
  *Needs:* the AFD equivalence above, V11's continuous decomposition, flows, cross-sections and
  odometer realization, the Rokhlin tower of this layer; Takesaki III, XIII.3.26, 3.29, 3.34 and
  XVIII.2.1–2.7.
- For a faithful normal state φ define the asymptotic centralizer as uniformly bounded
  sequences x_n with `‖x_nφ-φx_n‖_(M_*)→0`, and the bicentralizer B(M,φ) as elements a
  for which `[a,x_n]→0` in the σ-strong topology for every such sequence.
  Use this ordinary bicentralizer, distinct from the asymptotic bicentralizer.
  Prove it is a von Neumann subalgebra, develop unit/scalar/product/adjoint
  closure and state/isomorphism transport, and prove equivalence with the
  strong-star commutator formulation using adjoint closure. Establish
  Haagerup's convex criterion: membership of a is equivalent to
  `⋂_(δ>0) closure_σweak conv {u*au : u unitary, ‖uφ−φu‖≤δ}={a}`;
  triviality is equivalent to these convex sets meeting ℂ1.
  For separable-predual III₁ factors prove triviality for one faithful normal state
  iff triviality for every such state. Supply Connes–Størmer transitivity
  for type III₁ factors with separable predual: for faithful normal
  states φ,ψ and ε>0 some unitary u satisfies ‖uφu*−ψ‖<ε.
  Prove this norm-closed inner-orbit theorem and its
  asymptotic-centralizer comparison; the subalgebras themselves are transported by the state-comparison
  maps rather than identified literally. Prove Haagerup's theorem
  B(M,φ)=ℂ1 for injective III₁ factors with separable predual.
  Consume V11's dominant weights. For type III₁ their centralizers
  are II∞ with scalar relative commutant;
  identify the injective centralizer with R_(0,1), and average over its
  increasing compact matrix-unitary groups. Develop modular spectral-
  window estimates, the canonical standard-form bimodule action,
  and the orthogonal projection/partition argument passing centralizer
  averaging to the ordinary state bicentralizer (Haagerup 1987 §2).
  This triviality theorem retains injectivity.

  For an injective III₁ factor with separable predual, use bicentralizer
  triviality for every faithful normal state to prove M≃R_∞. Construct
  the continuous core's finite-trace II₁ cutdowns from spectral intervals
  of h_φ. Normalize the dual operator-valued weight on the corner to a
  ucp map T₀:R→M; prove exact modular covariance, faithful φ∘T₀ with
  a bounded invertible diffuse trace density, and φ-norm cutdown
  approximation. Partition that density into equal-trace spectral
  pieces; choose a type-I subfactor containing them and approximating
  the finite set. Conditional expectation and polar decomposition
  produce matrix unitaries. The logarithm/step-density estimate gives,
  for arbitrary ε,δ>0, a ucp map T:M_m→M, faithful ψ=φ∘T,
  unitary finite-set approximation and
  `‖σ_t^φ∘T−T∘σ_t^ψ‖≤δ|t|` for every t.

  After V11's ITPFI uniqueness, construct an expected R_∞ subfactor
  in every separable-predual III₁ factor. Present R_∞ as a binary
  matrix product with faithful component states. Iterate Connes–Størmer
  state approximation in the relative commutant to insert commuting
  M₂ factors, obtaining states that factor exactly over each finite
  head and differ by summable norm errors. Their normal limit can
  lose faithfulness: use component eigenvalue-ratio bounds to prove
  its support e commutes with every inserted factor. Compress to eMe,
  identify the generated product factor with R_∞, prove its modular
  invariance, apply V11's expectation theorem and transport through
  eMe≃M. Build a Q-stable faithful normal state on R_∞ from
  `⊗_(m≥2)(R_(1/m),φ_(1/m))`, and pull it back along the expectation.
  Q-stability means that for every m there are isometries u_i with
  orthogonal ranges summing to 1 and `φu_i=m⁻¹u_iφ`.
  Develop rational-eigenvalue approximation and modular-invariant
  finite matrix realization for this state.

  Prove almost-unitary equivalence in a normal Hilbert M-bimodule:
  for each n,ε some δ>0 makes tuples of unit vectors ξ_k,η_k with
  `Σa_i*a_i=Σa_i a_i*=1` and
  `Σ_i‖a_iξ_k−η_k a_i‖²<δ` conjugate within ε by one unitary.
  Prove the theorem uniformly over normal bimodules by bounded
  functional-calculus truncation, finite-family torus randomization,
  bidual unitary selection and Kaplansky descent. For uniformity build
  the Hilbert-space ultraproduct of a sequence of counterexamples and
  its bounded product-C*-algebra actions, which need not be normal.
  Prove quotient inner product, completeness, coordinate norm and
  action identities; reduce n-tuples to one vector in a direct sum.
  Include the finite-family version with both sums≤1 and arbitrarily
  σ-strongly close to 1. Bicentralizer averaging in the commutant of a
  modular-invariant matrix factor supplies such families; append the
  state vector to the tuples to control the conjugating unitary's
  effect on φ. Construct approximating matrix factors F for which
  `‖φ−φ|_F⊗φ|_(F′∩M)‖<ε` as well as strong-star operator
  approximation. Prove the Connes–Woods product criterion for properly
  infinite factors with separable predual.
  Insert the next finite type-I factor in a minimal matrix corner of
  the preceding one, identify that properly infinite corner with M,
  and extend the corrected matrix units to get exact nested tensor
  factors. Choose summable state errors with total below 1 and prove
  the UHF representations of the resulting product state and the
  original factorial state are quasi-equivalent: prove the sufficient
  norm-distance bound below one using support projections in the bidual.
  The faithful original normal GNS representation has closure M by
  strong density of the matrix union; the induced normal isomorphism
  identifies the product-representation closure abstractly with M.
  Prove the corresponding standard-form unitary comparison separately. Prove
  the converse by finite-head expectations. Consume V11's ITPFI
  III₁ uniqueness and the concrete R_∞ model constructed there.
  The product approximants and ITPFI uniqueness give M≃R_∞.
  *Needs:* V11's dominant weights, ITPFI uniqueness and the `R_∞` model, V4's predual norms,
  V12's ultraproducts (the Hilbert-space version is built here), V2's incomplete tensor product;
  Haagerup 1987, §§1–2, Haagerup 2016, Theorems 1.1–1.2, 2.8, 3.1, 4.2, 5.1 and Lemmas 5.4–5.6,
  Connes–Størmer 1978, Connes–Woods 1985, §7, and Haagerup 1989, §2.



### Examples

- `M⊗̄B(ℓ²)` is semidiscrete when M is, and its properly infinite approximation gives an AF
  algebra with weak closure `M⊗̄B(ℓ²)`.
- The Powers–Størmer inequality `‖h^(1/2)−k^(1/2)‖₂²≤‖h−k‖₁` holds for positive trace-class
  h and k.
- Groups of polynomial growth are amenable, so their group von Neumann algebras are injective.

### Dependencies

- Layers 4–12, with V2's completed Hilbert tensors and bounded operator tensor maps for
  V13b.SpatialNorm.
- AmenableGroups Layers 5–7.

## Downstream consumers

- [OperatorTheory/SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md)
  SA-B85 consumes V4.0.Fields' measurable fields and change-of-measure unitaries.
- [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md) consumes V0–V4, V8 and V11.
- [BanachAlgebras](../BanachAlgebras/README.md) A7 consumes V11's closed double-dual embedding.
- [TypeAHeckeAlgebras](../TypeAHeckeAlgebras/README.md) H3 consumes V2's reference-vector
  infinite tensor product.
- CStarAlgebras consumes V0–V4 and V12.J; its C3–C4 consume V13a; its C5 consumes
  V13b.SpatialNorm's spatial norm, its representation independence, slice maps and inclusion
  functoriality, and adds the maximal norm and the comparison of C*-norms; its C6–C9 consume the
  semidiscreteness theorems of V13b.

## References

- Michael Reed and Barry Simon, *Methods of Modern Mathematical Physics I*, §VI.6 for the
  canonical trace, `Tr|x|=‖x‖₁` and the trace-class duality (V4.Core), Theorems VIII.3–VIII.4 for self-adjointness
  and the multiplier-form spectral theorem (V10.ClosedOperators).
- Walter Rudin, *Functional Analysis*, Theorem 13.19, for the inverse Cayley correspondence of
  V10.ClosedOperators.
- Vaughan F. R. Jones, [*Von Neumann Algebras*](https://math.berkeley.edu/~vfr/VonNeumann2009.pdf),
  lecture notes (2009): Chapter 3, p. 13, for the weak-limit remark on projections (V1); §7.3 for
  the two-projection exercises (V12); Chapter 10, pp. 61–66, for `dim_M H` (V7); §§16.1–16.3 and
  Theorem 16.3.1, pp. 107–108, for central sequences, property Γ and the ICC estimate (V12).
- Jesse Peterson, [*Notes on von Neumann algebras*](https://math.vanderbilt.edu/peters10/teaching/spring2013/vonNeumannAlgebras.pdf)
  (2013): Theorem 3.3.1, Corollary 3.3.2 and Theorem 3.3.9 (type decomposition, V6); Theorem
  4.3.3 and Corollary 4.3.4 (V4.PositivePredual); Theorems 4.7.10, 4.8.2 and 4.9.4 and
  Proposition 4.9.5 (V5–V6); §§4.5 and 5.1–5.2 (V6, V8); Theorems 6.2.1 and 6.2.2 (V7.Index, 13.1);
  §6.3 (13.2).
- Claire Anantharaman and Sorin Popa, [*An introduction to II₁ factors*](https://www.math.ucla.edu/~popa/Books/IIun.pdf),
  draft book on the second author's page: §§1.3–1.4 and 2.4; Theorems 6.2.8, 6.3.4, 6.3.5, 6.4.1
  and 6.4.4 (V5); §7.1 and §§7.2–7.4 (V6, V10.TracialLp); Propositions 8.2.2, 8.3.3, 8.3.6, 8.3.8,
  8.4.2, 8.5.5, 8.6.1 and 8.6.2 and Definitions 8.3.1, 8.3.2 and 8.5.4 (V6–V7); §9.1 (V7.Index);
  §5.4 and §15.2 (V12); §§10.2–10.3, 11.1–11.2 and 12.5 (V13).
- Fumio Hiai, [*Lectures on selected topics in von Neumann algebras*](https://arxiv.org/abs/2004.02383):
  Theorem 2.2 (Tomita), Theorem 2.14 (KMS characterization), Proposition 3.8 and Theorems
  3.12–3.13 (standard form), §5, Theorem 6.5, pp. 55–56 (Tomiyama), Theorem 6.6 (Takesaki's expectation theorem), Theorem 7.6
  (Connes cocycles), §8, Theorem 9.4 (Pedersen–Takesaki), Theorem 10.7 (Takesaki duality), §12 and
  §13 (relative modular operators and spatial derivatives).
- William Arveson, *Subalgebras of C*-algebras*, Acta Math. 123 (1969), 141–224, Theorem 1.2.3,
  for the completely positive extension theorem of 13.1.
- Jun Tomiyama, *On the projection of norm one in W*-algebras*, Proc. Japan Acad. 33 (1957),
  608–612, Theorem 1, for the norm-one projection theorem of 13.1.
- Walter Rudin, *Fourier Analysis on Groups*, §§1.5–1.7, for Fourier inversion, Plancherel and
  Pontryagin duality (V11); Gerald B. Folland, *A Course in Abstract Harmonic Analysis*, 2nd ed.,
  §4.4, for Bochner's theorem, which Tau Ceti's cyclic spectral theorem implements.
- Jean-Benoît Bost and Alain Connes, *Hecke algebras, type III factors and phase transitions with
  spontaneous symmetry breaking in number theory*, Selecta Math. (N.S.) 1 (1995), 411–457,
  Theorem 5, for the β=1 endpoint of V10.AffineType; Marcelo Laca and Iain Raeburn, *A semigroup
  crossed product arising in number theory*, J. London Math. Soc. (2) 59 (1999), for the
  finite-adele corner model; Sergey Neshveyev, *Ergodicity of the action of the positive rationals
  on the group of finite adeles*, J. Funct. Anal. (2002), for the Haar ergodicity route.
- Shôichirô Sakai, *C*-algebras and W*-algebras*, Theorem 4.1.6, for the Kadison–Sakai derivation
  theorem of V11.
- Takesaki II XII.1.1 and Haagerup, *Lᵖ-spaces associated with an arbitrary
  von Neumann algebra* (1979), Theorems1.2–1.3, for the core normalization
  and the positive/negative dual-parameter crosswalk.
- Antony Wassermann, [*Ergodic actions of compact groups on operator algebras: I*](https://annals.math.princeton.edu/1989/130-2/p02), for compact spectral subspaces; [Part III: Classification for SU(2)](https://doi.org/10.1007/BF01394336), Invent. Math. 93 (1988), 309–354, for the SU(2) type-I theorem.
- Alain Connes, [*Outer conjugacy classes of automorphisms of factors*](https://www.numdam.org/item/ASENS_1975_4_8_3_383_0/), for the trace-scaling classification; the full conjugacy assertion for fixed nonunit scaling is part of V13.
- Connes, [*Une classification des facteurs de type III*](https://www.numdam.org/item/ASENS_1973_4_6_2_133_0/),
  §3.6.1, pp.203–205, for the elementwise S/asymptotic-ratio-set
  comparison for Araki–Woods factors and its block construction.
- Takesaki, *Theory of Operator Algebras I–III*, for weights, modular theory and classification;
  Volume I, Theorem IV.4.9, for the representation independence of the spatial C*-norm
  (V13b.SpatialNorm);
  volume III XV.3, Theorem3.1 and Definition3.5, for the concrete
  commuting-representation minimal-norm criterion and semidiscreteness;
  Volume I IV.8.16,8.18,8.20–8.21,8.25,8.34 builds separable reduction; Volume III
  XVI.1.9,1.22–1.23 proves the classification-independent AFD theorem,
  XIII.3.26,3.29,3.34 supplies measurable cohomology reduction,
  XVII.3.12 supplies trace-scaling conjugacy, and XVIII.1.1,2.1–2.9
  supplies the AFD III_λ/III₀ classification. In Volume II, VII.2.7 constructs a faithful normal semifinite weight on every
  von Neumann algebra, and IX.1.2, IX.1.13–IX.1.18 give the natural cone,
  standard-form axioms, uniqueness and canonical L² space.
  XII.1–4 supplies continuous/discrete decompositions and dominant weights.
  Runde, *Lectures on Amenability*, 6.4.14,6.4.24–6.4.25, gives the
  unrestricted injectivity/semidiscreteness reduction used before classification.
  Goodman–de la Harpe–Jones, *Coxeter Graphs and Towers of Algebras*, §3.3, pp. 142–148, for the
  discrete-series formal degree and the coupling constants of V9.
- Connes–Takesaki, [*The flow of weights on factors of type III*](https://doi.org/10.2748/tmj/1178240493),
  Tôhoku Math. J. 29 (1977), 473–575, for continuous decomposition,
  dominant weights and the flow comparison; use Takesaki II XII for
  the book development.
- Araki–Woods, [*A Classification of Factors*](https://doi.org/10.2977/prims/1195195263),
  Definition 3.2, Lemmas 5.4,7.5 and Theorem 7.6, for matched-block
  ratios, absorption and ITPFI III₁ uniqueness.
- Connes–Woods, [*Approximately Transitive Flows and ITPFI Factors*](https://doi.org/10.1017/S0143385700002868),
  §7, for the product property, exact matrix-corner nesting and the
  UHF product-representation comparison.
- Haagerup, [*The injective factors of type IIIλ, 0<λ<1*](https://msp.org/pjm/1989/137-2/pjm-v137-n2-p03-s.pdf),
  §2, for uniform almost-unitary equivalence in normal bimodules,
  including its Hilbert-ultraproduct uniformity argument.
- Connes–Størmer, [*Homogeneity of the State Space of Factors of Type III₁*](https://doi.org/10.1016/0022-1236(78)90085-X),
  for norm-approximate state conjugacy; Haagerup 2016 Theorem 2.4
  and Lemma 4.4 give the form and expected-subfactor application used here.
- Connes–Feldman–Weiss, [*Amenable equivalence relations are generated
  by a single transformation*](https://archives.ihes.fr/document/M_80_31.pdf),
  Definitions 5–6, Proposition 7, Lemmas 8–9 and Theorem 10, for
  invariant means, the regular-algebra projection and finite-subrelation
  cover. V11 separately develops the hyperfinite/single-transformation
  comparison used in the headline.
- Connes, [*Periodic automorphisms of the hyperfinite factor of type II₁*](https://alainconnes.org/wp-content/uploads/szego.pdf),
  Theorem 5.1 and Theorem 6.2, for invariant matrix approximation and
  outer-period/obstruction classification.
- Mathlib's `Analysis/VonNeumannAlgebra/Basic`, `Analysis/InnerProductSpace/WeakOperatorTopology`, `Analysis/LocallyConvex/WeakOperatorTopology`, and C*-algebra/continuous-functional-calculus files determine the foundational vocabulary.
- The bicommutant theorem is stated on Mathlib's `ContinuousLinearMapWOT` wrapper, with the
  finite diagonal amplification of V1 as its proof route.
- Finite-dimensional positive functionals are written as `x↦Tr(hx)` with a positive density
  matrix h (V0, V10). The pinned Mathlib has no density-matrix or finite Hilbert–Schmidt
  declarations; the density-matrix correspondence is a V10 target, and the Hilbert–Schmidt
  norm is the V4.Core target.
- Andrew Gleason, *Measures on the closed subspaces of a Hilbert space*, J. Math. Mech. 6
  (1957), pp. 885–893, for the finite frame-function theorem of V12.J.Frame.
- Uffe Haagerup, [*Connes’ bicentralizer problem and uniqueness of the
  injective factor of type III₁*](https://doi.org/10.1007/BF02392257),
  Acta Math. 158 (1987), 95–148, §§1–2, especially Proposition1.3,
  Corollary1.5, Theorem2.3 and Corollary2.4, for the ordinary bicentralizer
  and the separable injective III₁ uniqueness theorem.
- Haagerup, [*A new proof of the equivalence of injectivity and
  hyperfiniteness for factors on a separable Hilbert space*](https://doi.org/10.1016/0022-1236(85)90002-3),
  Theorem2.2, Lemmas3.1–3.4, Proposition3.5, Theorem4.2,
  Proposition5.2 and Theorem5.3, for actual matrix-subfactor approximants.
- Haagerup, [*On the uniqueness of the injective III₁ factor*](https://arxiv.org/abs/1606.03156),
  Theorems1.1–1.2,2.8,3.1,4.2,5.1 and Lemmas5.4–5.6,
  for the state-controlled product criterion and ITPFI bridge.
  Connes, [*Factors of type III₁, property L′_λ and closure of inner
  automorphisms*](https://jot.theta.ro/jot/archive/1985-014-001/1985-014-001-011.html),
  J. Operator Theory 14 (1985),189–211, gives the original bicentralizer
  characterization; the proof route specified here is the direct product route.
- Relevant Lean design discussions include [naming in operator algebras](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/naming%20in%20operator%20algebras) and [Double commutant theorem](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/Double%20commutant%20theorem). Use Mathlib's concrete/abstract split and topology wrappers, with the interface conventions above. Supply the required missing results here or in their explicitly cited prerequisite owner.


