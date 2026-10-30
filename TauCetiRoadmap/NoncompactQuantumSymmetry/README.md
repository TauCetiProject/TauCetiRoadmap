# Roadmap: noncompact quantum symmetry and particle representations

**Summary.** Develop the measurable and unitary representation theory needed to pass from spacetime symmetry to particle models. The central theorem is the locally compact imprimitivity theorem with its correctly normalized induced Hilbert-space model; the semidirect-product theorem then classifies regular irreducibles through dual orbits, stabilizers, and their projective representations. Apply this machinery with fixed conventions to Euclidean, Galilei, Poincaré, and de Sitter examples, and prove the domain and differentiability results that connect group representations to observables.

## Scope and ownership

Consume, without duplicating their core constructions:

- AutomorphicFormsOnReductiveGroups §2.1 for the topology-free finite-orbit-span predicate, submodule and elementary equivariant-map API, and its strongly continuous compact-group Banach density theorem. These two early interfaces have no automorphic, globalization or NQS analytic prerequisite; M0 owns the further Hilbert multiplicity, completed-tensor and smooth/analytic comparisons.

- [OperatorAlgebraDynamics D1](../OperatorAlgebraDynamics/README.md#d1-covariant-representations-and-full-crossed-products) for covariant pairs, integrated forms, group C*-algebras and continuous actions; [D3](../OperatorAlgebraDynamics/README.md#d3-induction-and-imprimitivity) for Green imprimitivity, modular normalization, induction in stages and interior tensor induction.
- OperatorAlgebraDynamics D3 supplies the equivalence between module and Hilbert-space induction for closed subgroups. HilbertModules H3 supplies interior tensor products, correspondence induction and the Rieffel correspondence; H5 supplies C₀(X)-algebras, their fibres and continuous Hilbert fields. H5 also supplies the small unitary dual as pure states modulo equivalence of their cyclic GNS representations; M0a retains the separable GCR/factor-type-I comparison.
- AffineLieAlgebras A1 owns finite-dimensional complex Whitehead vanishing for its current-algebra classification. P.4 extends that result to finite-dimensional semisimple Lie algebras and modules over every characteristic-zero field, including the real forms used here; it does not redevelop the complex current-algebra application.
- CStarAlgebras for full group C*-algebras and type-I hypotheses; OperatorAlgebraDynamics D5 for Haar-system groupoid convolution/disintegration; VonNeumannAlgebras V2 for completed Hilbert tensors. M3 consumes Layer P.5's free-particle position, momentum and Fourier core; the other Layer P interfaces are named below and at their uses.
- [VonNeumannAlgebras V4.Normality](../VonNeumannAlgebras/README.md#v4-preduals-normality-and-normal-representations) for normal representations; V4.0.Fields for measurable Hilbert fields, rectangular decomposable-map transport and change of measure consumed by M1/M2/M4/M5/M6; V4.0.Decomposition, via SelfAdjointSpectralTheory SA-B85, for the separable `C₀(X)` spectral representation and central decomposition consumed by M2.TypeIDisintegration, M2.ParameterizedRefinement and M3’s mass-sector decomposition; V11 for Pontryagin duality, Haar normalization and Plancherel.
- [RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md) for compact little groups and Peter–Weyl; LieGroups and [LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md) for Lie groups, Lie algebras, highest weights and compact-fiber data. These are not noncompact unitary-dual classifications.
- Mathlib's `LieAlgebra.HasTrivialRadical.instIsKilling` (`Mathlib/Algebra/Lie/CartanCriterion.lean`, Cartan's criterion over a characteristic-zero domain) with `LieAlgebra.IsSemisimple.instHasTrivialRadical`, and Tau Ceti's `TauCeti.exists_isCompl_of_isKilling` (`TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean`, Weyl's complete reducibility over a field of characteristic zero for a finite-dimensional Lie algebra with nondegenerate Killing form and a finite-dimensional module), from which Layer P.4 proves the degree-one and degree-two Whitehead lemmas; Tau Ceti's `TauCeti.FactorSet` (`TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean`) and `TauCeti.isProjectiveRepEquivExtensionHom` (`TauCeti/RepresentationTheory/ProjectiveRepresentation/Extension.lean`) for the algebra of factor sets, their extensions, rescaling and projective linearization, consumed by Layer P.3.
- Layer P below owns the projective-symmetry prerequisites: rays, the unitary–antiunitary group and Wigner's theorem (P.1); strong-operator Polish groups, coefficient and quotient Borel structures, the local section of `U(H)→PU(H)` and Pettis's theorem (P.2); normalized locally continuous multipliers and their topological extensions (P.3); finite-dimensional Lie smoothing, differentiation, integration and the real Whitehead lemmas (P.4); free-particle position and momentum (P.5); and the permutation projectors of completed tensor powers (P.6). This roadmap proves these and the noncompact measurable and induced-representation results named here.
- Tau Ceti's pinned Lorentzian Clifford/Spin equivalence in `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/ThreeOne.lean` and Hermitian-vector model in `TauCeti/LinearAlgebra/CliffordAlgebra/RealForm/ThreeOne.lean` for the `Spin(3,1)≃SL(2,ℂ)` / Lorentz cover interface. The group-action and orbit proofs remain targets here.

The analytic operator domains and self-adjoint spectral calculus are supplied by OperatorTheory/SelfAdjointSpectralTheory and OperatorTheory/UnboundedOperators. RelativisticQuantumFieldTheory RQFT0–RQFT2 owns field-side Lorentzian coordinate/Fourier conventions, exact solution carriers, causal Green operators, Lorentz-spinor and classical-to-quantum field bridges; NQS M4 owns the group/metric/cover and Lorentz-representation conventions; RQFT3–RQFT10 own operator-valued distributions, Wightman/Haag–Kastler axioms, spin-statistics, Shale implementability, perturbative renormalization and scattering. LocalVariationalFieldTheory LVF1–LVF6 owns finite-order Euler–Lagrange/Noether theory, stress-energy and classical momentum/current constructions. These field and variational roadmaps own the listed field applications; M0–M6 do not consume RQFT field constructions. Their common Lorentz/Spin and operator inputs are the pinned native and supplier APIs above. Layer P is consumed by M1 (P.1–P.3), M2 (P.2), M3 (P.3–P.5), M4 (P.1–P.4), M5.Coding (P.2) and M6 (P.6); it consumes no M-layer. M1/M2/M4/M5 also consume HilbertModules H3, and M5 consumes HilbertModules H5. RQFT2 and RQFT3 consume M2/M4 for the named noncompact representation data; RQFT11 consumes M4 for the helicity models it names. This fixes the milestone direction of the shared field applications. No field theorem follows merely from a unitary representation of spacetime symmetry.

## Conventions

All Hilbert spaces are complex. Locally compact groups are Hausdorff; measurable Mackey theory uses second-countable locally compact groups and standard Borel spaces. Representations are strongly continuous unitary representations unless expressly projective or antiunitary. Hilbert inner products are conjugate-linear in the first variable. A left Haar measure is fixed, with modular function convention from OperatorAlgebraDynamics D1–D3. An induced representation is formed with the square-root Radon–Nikodym/modular factor dictated by that convention; no formula may silently assume a unimodular group or an invariant quotient measure. A Borel multiplier is normalized and satisfies the continuous or Borel 2-cocycle identity as specified; cohomologous multipliers give equivalent twisted data only through an explicit Borel/continuous coboundary.

For right Hilbert A-modules use HilbertModules' native opposite-algebra convention:
`CStarModule Aᵐᵒᵖ E`, with right multiplication by a represented by
`MulOpposite.op a • x` and A-valued inner product obtained by `MulOpposite.unop`.
No separability or countable-generation hypothesis is imposed on these module contracts
unless the consuming theorem states it.

## Exact supplier contracts

### From Mathlib

Use `ContRepresentation` for homomorphisms into continuous linear operators; it does not
assert continuity of vector orbits. Use `Projectivization`, `LinearIsometryEquiv`,
`LieModule.Cohomology.oneCochain`, `LieModule.Cohomology.d₁₂`,
`LieModule.Cohomology.twoCocycle`, `MeasureTheory.Lp`, native RN derivatives and
`PontryaginDual` for the carriers and conventions specified below.
M6 consumes `ProbabilityTheory.Kernel.rnDeriv`,
`ProbabilityTheory.Kernel.measurable_rnDeriv`,
`ProbabilityTheory.Kernel.rnDeriv_eq_rnDeriv_measure` and
`ProbabilityTheory.Kernel.withDensity_rnDeriv_eq`
(Mathlib `Probability/Kernel/RadonNikodym.lean`) for jointly measurable
RN densities of finite kernels on countably generated label spaces. It consumes
`ProbabilityTheory.Kernel.condKernel` and `ProbabilityTheory.Kernel.disintegrate`
(Mathlib `Probability/Kernel/Disintegration/StandardBorel.lean` and `Basic.lean`)
for conditional probability kernels: the conditioned factor is countably generated,
the other factor is nonempty standard Borel, and the input kernel is finite.
These supply the scalar parameterized kernel theory; M6 constructs the
representation-specific effective supports, normalized pair kernels and subtree fields.


### From Tau Ceti

Use `ContRepresentation.IsUnitary` for inner-product preservation, keeping
strong orbit continuity separate. P.3 consumes `TauCeti.FactorSet` and
`TauCeti.isProjectiveRepEquivExtensionHom`; P.4 consumes
`TauCeti.exists_isCompl_of_isKilling` with finite-dimensional Lie algebra and module
over a characteristic-zero field. M4 uses the native real Clifford/Hermitian
comparison named in Scope and ownership.

### From TauCetiRoadmap.HilbertModules

H3 supplies the balanced Hausdorff-completed interior tensor, its associator,
correspondence induction, ideal-kernel identity and Rieffel spectrum transport.
H5 supplies the central nondegenerate C₀(X)-action, quotient fibres, upper
semicontinuous norms, continuous Hilbert-field reconstruction from generating
sections, and the small pure-state/GNS unitary dual with its kernel topology. These contracts use the right-module convention above and retain zero
modules, non-full modules and degenerate left actions where specified in H3.

### Hilbert-module contract checks

- For the standard module B and a nondegenerate left action on F, the unitary B⊗_B F→F sends b⊗η to bη; for the zero left action the tensor is zero after quotienting the null space.
- For the M₂(ℂ)–ℂ imprimitivity module ℂ², induction sends a one-dimensional representation to dimension two, and the Rieffel correspondence sends the two ideals to the two ideals. The non-full ℂ⊕0 module over ℂ⊕ℂ instead kills the second-coordinate character.
- The right-module convention gives ⟨ξ,ηb⟩=⟨ξ,η⟩b and ⟨ξb,η⟩=b*⟨ξ,η⟩; in B=M₂(ℂ), ξ=E₁₁, η=E₁₂ and b=E₂₂ give E₁₂ in the first identity, whereas the reversed convention ⟨ξ,η⟩=ξη* gives zero on these inputs.
- Over a point the fibre is A; over [0,1], A=C₀([0,1))⊕ℂ has the section (0,1) with norms 0 for t<1 and 1 at t=1, so upper semicontinuity alone does not imply continuity.
- The small dual is empty for A=0, a singleton for A=ℂ and two points for
  A=ℂ⊕ℂ with kernels 0⊕ℂ and ℂ⊕0. Equal Hilbert dimension does not identify
  those two characters.
- The trivial M₂(ℂ) field over ℝ has section exp(−x²)E₁₁ with norm exp(−x²). Constant scalar sections generate the usual continuous field, while adjoining the indicator of [0,∞) violates norm continuity at zero.

### From the other named roadmaps

The following additional supplier interfaces are consumed by their named targets.
Their generic theories remain in the supplying roadmaps.

| Supplier | Interface consumed here | First consumer |
| --- | --- | --- |
| PseudodifferentialOperators P5/P6 | Local interior distributional elliptic regularity and Sobolev estimates | M0’s smooth/elliptic-vector bridge |
| RiemannianGeometry R1/R2/R4, [HopfRinow](../HopfRinow/README.md) | Symmetric-space curvature, Jacobi/Hessian comparison, Cartan–Hadamard and complete closed-ball compactness | M0’s Cartan/maximal-compact argument |
| [SpinRepresentations Layer7](../RepresentationTheory/SpinRepresentations/README.md) | Compact spin/Clifford fibers and spin-weight data | M0’s compact-type comparison |
| InductionRestriction 2.1 | Almost-conjugacy and permutation representations | M1’s finite-quotient deck models |
| LieGroupoidsPoisson G0 item0, [OperatorAlgebraDynamics D5](../OperatorAlgebraDynamics/README.md#d5-haar-groupoids-convolution-and-disintegration) | Topological groupoid, Haar convolution, full completion and disintegration | M5’s deformation groupoid |
| CStarAlgebras C1/C2 | C1 ideal/approximate-unit APIs; C2 separable prime⇒primitive, primitive ideals, hull-kernel topology and separable second countability, pure-state/GNS, nonzero irreducibility⇔scalar commutant, Kadison transitivity with its norm bound and quotient-norm lower semicontinuity | M0a.TypeIComparison first; M2.TypeIDisintegration and M2.RectangularField; M5’s labelled dual topology |
| UnboundedOperators UO-B04/B05 | Strongly commuting joint PVM and multiparameter Stone theorem | M4’s joint translation spectrum |
| [RepresentationTheory/SchurWeyl Layers 3–5](../RepresentationTheory/SchurWeyl/README.md) | Complete complex Specht models and dimensions; CompactGroups Layers 1/4 supply unitarization/coefficient orthogonality; M6 owns the arbitrary-Hilbert tensor bridge | M6.FiniteTree Young fields |
| MetaplecticAutomorphicForms Layer 0, 0.1–0.13 | Bilinear Heisenberg extension `E_B` of a scalar-valued bilinear form, its inverse, commutator and centre formulas, the half-alternating specialization, the isometry action on `E_B` and its joint continuity | M5.AffineG5’s scalar-centre η-Heisenberg group |
| LaguerreJacobi A/B contract | Weighted Laguerre polynomials and complete normalized radial basis, with M5’s explicit parameter/unitary adapter | M5’s conformal radial model |

## How to read the build

Layer 0 constructs the group C*-algebra comparisons. Layer 1 (P) supplies
projective-symmetry prerequisites, followed by the type-I comparison (Layer 2,
M0a) and smooth/compact-type bridges (Layer 3, M0). Layers 4 and 5 (M1/M2)
construct induction and measurable irreducible classification; Layers 6–8
(M3–M5) apply them to particle groups and contractions. Layer 9 (M6) constructs
pair decompositions and finite-tree recoupling, inducting from smaller child
blocks to their parent. Each named target's inputs and proof-route dependencies
are retained at its statement; changing the route does not change the target.

## Layer 0: shared group C*-algebra and weak-support comparisons

Before the applications, define `σ≺ρ` by `kerρ⊆kerσ` for integrated
representations of the full group C*-algebra, and
`Supp(ρ)={σ irreducible:σ≺ρ}`. Compare this with coefficient weak
containment and the hull-kernel topology through D1's universal integrated
representations. Own the following comparisons here.

For a closed subgroup H≤G construct the nondegenerate strictly continuous
map `C*(H)→M(C*(G))` from its canonical multiplier unitaries. Prove
weak containment passes to restriction: if the extension of ρ annihilates
a multiplier y, then yx lies in kerρ for every x∈C*(G); kernel inclusion
and nondegeneracy imply the extension of σ also annihilates y. Prove
inflation preserves weak containment through the corresponding quotient
C*-map. If `ρ_t=U_t⁻¹ρU_t` converges pointwise strongly to π, prove
`kerρ⊆kerπ`: dominated convergence gives strong convergence of integrated
L¹ functions and their C*-norm density extends this to every algebra element.

For a continuous action of H on locally compact abelian N construct
`C*(N⋊H)≃C*(N)⋊H≃C₀(N̂)⋊H` from D1's universal covariant pairs,
comparing both integrated forms. Construct the abelian Fourier C*-map
using V11's character/Fourier conventions and CStarAlgebras' commutative
Gelfand theorem. Pin the action modulus by `μ_N(hA)=δ(h)μ_N(A)`;
the semidirect left Haar measure is `δ(h)⁻¹ dn dh`. The M4 Lorentz
action has |det h|=1, hence δ=1. Prove the Fourier conjugation uses
`h·χ(n)=χ(h⁻¹n)`. For each model orbit identify H/Hχ with that orbit
as an equivariant homeomorphism by the σ-compact-group open-mapping
argument, and identify its induced integrated representation with the
covariant pair of orbitwise multiplication and the induced H-action.
The orbit-homeomorphism assertion requires a locally compact orbit (in
particular a locally closed orbit in the dual); state that hypothesis in
the open-mapping argument. These are comparison targets, not assumed consequences of the abstract
crossed-product notation.

### Examples

For the trivial group, C*(G)=ℂ and the nonzero trivial representation has support {1}. For an abelian dilation h:x↦2x on ℝ, δ(h)=2 and the dual action sends frequency ξ to ξ/2.

### Dependencies

OperatorAlgebraDynamics D1/D3; CStarAlgebras C1/C2; VonNeumannAlgebras V11. The kernel-inclusion and Fourier comparisons of this layer are inputs to M1–M6.

## Layer 1: P — Rays, operator groups and locally continuous multipliers

This layer owns the projective-symmetry prerequisites that M1–M6 consume:
ray spaces and the unitary–antiunitary group (P.1), the strong-operator Polish
groups, their Borel structures, local sections and Pettis's theorem (P.2),
normalized locally continuous multipliers and the topological extensions they
classify (P.3), the finite-dimensional Lie smoothing, differentiation,
integration and Whitehead interfaces (P.4), the free-particle position and
momentum operators (P.5), the permutation sectors of completed tensor powers
(P.6). Its
only inputs are Mathlib, Tau Ceti and the named sections of LieGroups,
SelfAdjointSpectralTheory, VonNeumannAlgebras and CStarAlgebras; it consumes
no M-layer.

### P.1 Rays and the unitary–antiunitary group

For a nonzero complex Hilbert space H let `P(H)` be its unit sphere modulo the
scalar circle 𝕋, with transition probability `p([ξ],[η])=|⟨ξ,η⟩|²`; it is well
defined because both arguments are phase invariant. Let `U(H)` be native
`unitary (H →L[ℂ] H)`, and let `UA(H)` be the group of surjective real-linear
isometries of H that are either complex linear or conjugate linear, the
conjugate-linear ones being native semilinear `H ≃ₗᵢ⋆[ℂ] H`. Prove that the
grade `ε:UA(H)→ℤ/2` (0 on unitaries, 1 on antiunitaries) is well defined and a
homomorphism: on H≠0 a map that is both linear and conjugate linear sends iξ to
both iTξ and −iTξ, hence is zero. The scalars 𝕋·Id are central in U(H) and
normal, not central, in UA(H): `A z A⁻¹ = z̄` for odd A. Put `PU(H)=U(H)/𝕋` and
`PUA(H)=UA(H)/𝕋`; both act on `P(H)` preserving p.

Define `rayTransitionProbability` on native `Projectivization ℂ H` by
`‖⟨p.rep,q.rep⟩‖²/(‖p.rep‖²‖q.rep‖²)`; the representatives are nonzero, so
the denominator is positive. Scaling either representative by a nonzero complex
number leaves this value unchanged, identifying it with the unit-sphere quotient
probability above. Prove symmetry, values in [0,1], value one exactly for equal
rays, and value zero exactly for orthogonal rays.

**Checks.**

- On ℂ², the rays of e₁ and e₂ have probability 0, while a ray with itself has probability 1.
- The rays of e₁ and e₁+e₂ have probability 1/2; using 2e₁ and i(e₁+e₂) gives 4/(4·2)=1/2.
- On ℂ the only ray has probability 1; the zero vector has no projective class, excluding a 0/0 input.

Prove `wigner_reconstruction`, Wigner's theorem in this form: every bijection of `P(H)` preserving p is
induced by an element of `UA(H)` (Freed2012Wigner Theorem 8). For arbitrary, possibly
nonseparable H, extend the ray-isometry argument from finite-dimensional spans:
orthogonality preservation identifies the corresponding projective spans; fix
phases on an orthonormal basis and one common linear/conjugate-linear choice on
the two-dimensional spans, check compatibility on three-dimensional spans, and
extend the resulting isometry by density. Surjectivity of the ray bijection makes
the range all of H. Freed2012Wigner states the separable case; this finite-span
extension is part of the target here. The one-dimensional case has just one ray.
Prove the
faithful-ray comparison: when `dim H ≥ 2` the kernel of `UA(H)→Aut(P(H),p)` is
exactly 𝕋·Id, so `PUA(H)≅Aut(P(H),p)` and the grade of an inducing operator is
determined by the ray map (Freed2012Wigner, sequence (7)). The proof is
elementary: an element fixing every ray scales each vector of an orthonormal
pair `e₁,e₂` by one common phase, and an antiunitary λ·(conjugation) sends the
ray of `e₁+ie₂` to the ray of `e₁−ie₂`. The hypothesis `dim H ≥ 2` is necessary,
see the Checks.

*Needs:* Mathlib `unitary`, `LinearIsometryEquiv`, `Projectivization` only as a
comparison carrier.

- For `dim H ≥ 2`, the ray action identifies `PUA(H)` with the group of
  transition-probability-preserving bijections of `P(H)`, and `PU(H)` with the
  image of the even part.
- The grade of a product is the sum of the grades, and conjugating a scalar by
  an odd element conjugates the scalar.

**Checks.**

- For `H=ℂ`, `P(H)` is one point, `UA(ℂ)` is 𝕋 together with 𝕋·(complex
  conjugation), and `PUA(ℂ)≅ℤ/2` acts trivially: the comparison is not injective
  and the ray map does not determine the grade. A statement without `dim H ≥ 2`
  is false here.
- For `H=ℂ²`, `P(H)` is the Bloch sphere with `[ξ]↦(2Re(ξ̄₁ξ₂),2Im(ξ̄₁ξ₂),|ξ₁|²−|ξ₂|²)`;
  coordinatewise conjugation acts by `(x,y,z)↦(x,−y,z)`, of determinant −1, so
  the antiunitary component maps onto `O(3)∖SO(3)` and `PU(2)` onto `SO(3)`
  (Freed2012Wigner Example 10). A model that let antiunitaries act by rotations
  would fail this determinant.
- The quaternionic structure `J(a,b)=(−b̄,ā)` on ℂ² is odd with `J²=−Id`, while
  coordinatewise conjugation C has `C²=+Id`; both induce involutions of the
  Bloch sphere, so `J²` and `C²` are invisible on rays and recorded only by the
  multipliers of P.3.

### P.2 Strong-operator Polish groups, Borel structures and Pettis's theorem

Let H be a nonzero separable complex Hilbert space. Give `U(H)` the strong
operator topology, the subspace topology from native `PointwiseConvergenceCLM`
(`H →Lₚₜ[ℂ] H`). Prove that on `U(H)` the strong and weak operator topologies
agree and that `U(H)` is a Polish topological group (Kechris1995 §9.B). Fix a
conjugation C (an antiunitary involution, coordinatewise conjugation in a
Hilbert basis); then `UA(H)=U(H)⊔U(H)C`, and give it the topology of two copies
of `U(H)`. Prove that `U↦CUC` is a continuous automorphism of `U(H)`, that this
makes `UA(H)≅U(H)⋊C₂` a Polish group, that a second conjugation `C′=(C′C)C`
gives the same topology, and that ε is continuous. Since 𝕋·Id is closed and
normal, `PU(H)` and `PUA(H)` are Polish groups, and their quotient Borel
structures are the Borel structures of the quotient topologies by native
`QuotientGroup.borelSpace` (Mathlib `MeasureTheory/Constructions/Polish/Basic.lean`).

Prove the coefficient description of these Borel structures, which M1, M2 and
M5.Coding use. Fix an orthonormal basis `(e_i)`. The coefficients
`U↦⟨e_i,Ue_j⟩` are continuous and separate the points of `U(H)`, so the
identity from the Polish space `U(H)` to `U(H)` with the coefficient σ-algebra
is a measurable injection into a countably separated space, hence a measurable
embedding by native `Measurable.measurableEmbedding` (Lusin–Souslin): the two
σ-algebras coincide. On `UA(H)` use the grade together with the coefficients;
on `PU(H)` and `PUA(H)` use the grade and the phase-invariant products
`⟨e_i,Ue_j⟩·conj⟨e_k,Ue_l⟩`, which separate classes because a nonzero entry
`⟨e_k,Ue_l⟩` recovers U from V up to the unimodular factor
`conj⟨e_k,Ve_l⟩/conj⟨e_k,Ue_l⟩`.

Construct the explicit local section consumed by M1. For a unit vector ξ, the
set `W_ξ={[U] : ⟨ξ,Uξ⟩≠0}` is an open identity neighbourhood in `PU(H)`, and in
`PUA(H)` for the same formula, and

```
s_ξ([U]) = (conj⟨ξ,Uξ⟩ / |⟨ξ,Uξ⟩|) · U
```

is well defined (replacing U by zU multiplies the prefactor by z̄), continuous,
satisfies `s_ξ(1)=Id`, and has `⟨ξ,s_ξ([U])ξ⟩>0`.

Prove `continuous_of_measurable_hom`, Pettis's theorem: every Borel homomorphism between Polish groups is
continuous (Kechris1995 Theorem 9.10), by the Pettis lemma that `AA⁻¹` is an
identity neighbourhood for a non-meagre set A with the Baire property, applied
to the preimages of a countable cover by translates of a small neighbourhood.
M1 and M2 cite this as the Banach–Pettis theorem. Mathlib's
`AddMonoidHom.continuous_of_measurable`
(`MeasureTheory/Measure/Haar/NormedSpace.lean`) covers only locally compact
normed additive groups mapping to real normed spaces and does not apply to
`PU(H)`. Deduce that a continuous homomorphism from a connected topological
group to `PUA(H)` lands in `PU(H)`, because ε is continuous to the discrete
group ℤ/2; M4 consumes this for the connected Lorentz and Poincaré components.

*Needs:* P.1; Mathlib `PointwiseConvergenceCLM`, `PolishSpace`,
`QuotientGroup.borelSpace`, `Measurable.measurableEmbedding` and the Baire
category theorem.

- `U(H)`, `UA(H)`, `PU(H)` and `PUA(H)` are Polish groups for separable H≠0,
  their Borel structures are generated by the stated coefficient functions, and
  the quotient Borel structures of `PU(H)` and `PUA(H)` are their Borel
  structures.
- `s_ξ` is a continuous normalized section of `U(H)→PU(H)` over `W_ξ`.
- A Borel homomorphism between Polish groups is continuous.

**Checks.**

- On ℂ² with `U=diag(i,−1)`: `s_{e₁}([U])=diag(1,i)` and `s_{e₂}([U])=diag(−i,1)`,
  which differ by the phase i, as two sections of one class must; a section
  formula without the conjugate in the prefactor would give `diag(−1,−i)` and
  `⟨e₁,s(U)e₁⟩=−1<0`.
- The swap `[[0,1],[1,0]]` lies outside `W_{e₁}`, and no single continuous
  section covers `PU(2)≅SO(3)`: otherwise `U(2)` would be homeomorphic to
  `𝕋×SO(3)`, but `π₁(U(2))=ℤ` while `π₁(𝕋×SO(3))=ℤ×ℤ/2`.
- Every Borel character of ℝ is `t↦exp(ict)`; a Hamel-basis additive map f
  gives a discontinuous character `exp(if)`, which is not Borel, so the
  measurability hypothesis cannot be dropped.

### P.3 Locally continuous multipliers and topological extensions

Let G be a topological group with a continuous grading `ε:G→ℤ/2` (ε=0 in the
ungraded case), acting on 𝕋 by `g·z=z` for even g and `g·z=z̄` for odd g;
write `𝕋_ε`. A *normalized locally continuous multiplier* is a map
`ω:G×G→𝕋` with `ω(1,g)=ω(g,1)=1`, the twisted cocycle identity

```
ω(g,h) ω(gh,k) = (g·ω(h,k)) ω(g,hk),
```

continuity on some neighbourhood of (1,1), and, for every g, continuity near 1
of the conjugation function `h ↦ ω(g,h) ω(ghg⁻¹,g)⁻¹`. The cocycle identity is
the one forced by `U_gU_h=ω(g,h)U_(gh)` when odd `U_g` are antiunitary. Its
coboundaries are `δb(g,h)=b(g)(g·b(h))b(gh)⁻¹` for `b:G→𝕋` with `b(1)=1` and b
continuous near 1. Prove that every δb satisfies both continuity conditions
(the computation before Neeb2004 Proposition II.6, read with continuous in
place of smooth), and define `H²_lc(G,𝕋_ε)` as the quotient. Prove that the
conjugation condition is automatic for connected G, since G is then generated
by any identity neighbourhood (Neeb2004 Proposition II.6, last sentence).

Use Tau Ceti's algebraic extension rather than a second construction. With
the `MulDistribMulAction` of G on `Circle` through ε, a normalized multiplier
is a `TauCeti.FactorSet G Circle`: its cocycle field is Mathlib's
`groupCohomology.IsMulCocycle₂`, which is the displayed identity, and its
single normalization `α(1,1)=1` implies both normalizations above by
`TauCeti.FactorSet.map_one_fst` and `map_one_snd`. Its group
`TauCeti.FactorSet.Extension` is `𝕋×G` with
`(z,g)(w,h)=(z(g·w)ω(g,h),gh)`, and `TauCeti.FactorSet.canonicalSection_mul`
is `σ(g)σ(h)=ω(g,h)σ(gh)`, the convention `U_gU_h=ω(g,h)U_(gh)` of M1. Export
the forgetful adapter from M1's normalized Borel multipliers to
`TauCeti.FactorSet G Circle` with the trivial action, and its graded variant
with the action through ε; transport cohomologous multipliers by
`TauCeti.FactorSet.rescaleEquiv` and `nonempty_groupExtensionEquiv`, and
coefficient changes by `TauCeti.FactorSet.map`. In the ungraded linear case
compare, through `Circle→ℂˣ`, with Tau Ceti's
`isProjectiveRepEquivExtensionHom`
(`TauCeti/RepresentationTheory/ProjectiveRepresentation/Extension.lean`).
The adapters are algebraic; the topology of an extension built from a merely
Borel multiplier is M1's Mackey–Weil reconstruction, never the product
topology.

Prove the topological extension theorem for Hausdorff G. For a normalized
locally continuous multiplier ω there is a unique group topology on `TauCeti.FactorSet.Extension`
for which the inclusion of 𝕋 is a topological embedding (𝕋 with its usual
topology) onto a closed subgroup, the projection to G is continuous and open,
and the canonical section is continuous on an identity neighbourhood.
Hausdorffness of G is necessary, not a convenience: a continuous open
surjective homomorphism with closed kernel identifies G with the quotient of
E by a closed normal subgroup, which is T1 and hence Hausdorff. In Lean the
hypothesis is carried as `[T2Space G]`, which `[IsTopologicalGroup G]` does not
supply. Conversely every extension `1→𝕋_ε→E→G→1` of topological groups with
G Hausdorff, 𝕋 embedded topologically and open projection, in which odd elements conjugate 𝕋 by z↦z̄ and which admits a
section continuous near 1 with σ(1)=1, is isomorphic to one of these, and two
multipliers give isomorphic extensions exactly when they differ by a
coboundary. Hence, for Hausdorff G, `H²_lc(G,𝕋_ε)` classifies extensions that are locally
trivial principal 𝕋-bundles (Neeb2004 Proposition II.6, whose proof applies
verbatim with continuous for smooth; for connected G, WagemannWockel2015
Remark I.3). In degree one, a crossed homomorphism is a map `f:G→𝕋_ε` with
`f(gh)=f(g)(g·f(h))`, and the principal ones are `f_z(g)=(g·z)z⁻¹` for z∈𝕋.
Prove that a crossed homomorphism continuous near 1 is continuous
(WagemannWockel2015 Remark I.4), so that the locally continuous 1-cocycles
`Z¹_lc(G,𝕋_ε)` are exactly the continuous crossed homomorphisms, and define
`H¹_lc(G,𝕋_ε)=Z¹_lc(G,𝕋_ε)/B¹(G,𝕋_ε)`, with `B¹` the principal crossed
homomorphisms (WagemannWockel2015 Remark I.3). For the trivial grading every
`f_z` is 1, so `H¹_lc(G,𝕋)` is the group of continuous characters `G→𝕋`; this
is the form P.4 uses. For second-countable G,
prove the countable patching construction: given a section σ continuous on an
open identity neighbourhood V with σ(1)=1, cover G by countably many translates
`g_nV` with `g₀=1`, choose lifts `ĝ_n` with `ĝ₀=1`, and on the Borel piece
`g_nV∖⋃_(m<n)g_mV` put `σ(g)=ĝ_nσ(g_n⁻¹g)`; the result is a Borel section that
agrees with the original one on V.

*Needs:* Tau Ceti `TauCeti.FactorSet` and `isProjectiveRepEquivExtensionHom`;
Mathlib `groupCohomology.IsMulCocycle₂`; P.1 for the operator realization.

- For Hausdorff G, a normalized locally continuous multiplier determines a
  topological extension, unique up to isomorphism, with a section continuous near 1, and
  every such extension arises this way.
- Cohomologous multipliers give isomorphic extensions, and conversely.
- The Borel-multiplier and graded-multiplier adapters to `TauCeti.FactorSet`
  preserve the cocycle, the normalization and the rescaling relation.

**Checks.**

- G=ℤ/2 with the odd grading: a normalized multiplier is fixed by `ω(t,t)`,
  and the identity at `(t,t,t)` gives `ω(t,t)=conj ω(t,t)`, so `ω(t,t)=±1`;
  `δb(t,t)=b(t)conj(b(t))=1`, so `H²=ℤ/2`, detected by `C²=+Id` versus `J²=−Id`
  from P.1. With the even grading `δb(t,t)=b(t)²` reaches every value and
  `H²=0`; a convention ignoring the grade would conflate the two.
- G=ℝ² with `ω_θ((a,b),(a′,b′))=exp(iθ(ab′−a′b)/2)`: lifts have commutator
  `ω_θ(x,y)ω_θ(y,x)⁻¹=exp(iθ(ab′−a′b))`, which no coboundary changes, so
  θ≠0 gives a nontrivial class of a simply connected group; simple
  connectivity alone never kills a multiplier.
- `H¹` keeps the principal quotient. For G=ℤ/2={1,t} with the odd grading,
  `f(t²)=f(t)·conj(f(t))=1` holds for every `f(t)∈𝕋`, so `Z¹≅𝕋`; the principal
  `f_z(t)=z̄/z=z⁻²` reaches every point of 𝕋 because squaring is surjective, so
  `H¹=0`. With the even grading `Z¹={f : f(t)²=1}≅ℤ/2` and `B¹=1`, so `H¹=ℤ/2`.
  Identifying `H¹` with `Z¹` would give 𝕋 in the odd case.
- Hausdorffness of G cannot be dropped: for `G=ℚ×C₂`, with `C₂` indiscrete,
  ε=0 and ω≡1, the cocycle conditions hold but no extension has 𝕋 closed and
  open projection onto G, since `{1}` is not closed in G.
- For a discrete G every map is continuous near 1, so `H²_lc` is the abstract
  `H²(G,𝕋_ε)`; for G=ℤ/2×ℤ/2 ungraded the commutator pairing gives the
  nontrivial class realized by the Pauli matrices σ_x,σ_z.

### P.4 Smoothing, differentiation, integration and Whitehead lemmas

Let G be a finite-dimensional real Lie group with a continuous grading ε, and
`𝕋_ε=ℝ_ε/ℤ` with the induced action on ℝ by ±1. A *locally smooth* multiplier
is a normalized locally continuous one that is smooth near (1,1) and whose
conjugation functions are smooth near 1 (Neeb's `Z²_ss`); coboundaries are
`δb` with b smooth near 1.

- **Smoothing.** Prove that the inclusion induces an isomorphism
  `H²_ss(G,𝕋_ε)≅H²_lc(G,𝕋_ε)`. Route: WagemannWockel2015 Proposition I.7 gives
  the isomorphism of locally smooth and locally continuous cohomology for
  finite-dimensional G and coefficients a/Γ, hence a locally smooth `f_s`
  cohomologous to a given ω and injectivity. The conjugation functions of
  `f_s` are continuous near 1 because those of ω and of δb are; conjugation by
  the lift of g is then a continuous automorphism of the Lie group extension of
  the identity component, hence smooth by LieGroups Layer 2's automatic
  smoothness, which makes the conjugation functions of `f_s` smooth near 1.
- **Lie extension.** For a locally smooth ω, prove that the extension of P.3 is
  a Lie group extension of G by 𝕋, that every Lie group extension arises so
  (Neeb2004 Proposition II.6), and that its Lie algebra is `g⊕_(Dω)ℝ` with
  bracket `[(x,a),(y,b)]=([x,y], x·b−y·a+Dω(x,y))`, where Dω is the
  antisymmetrization of the second derivative at (1,1) of a real logarithm of
  ω in a chart (Neeb2004 Lemma II.7 and the definition before it).
- **Integration.** For connected simply connected G with trivial grading prove
  that differentiation gives an isomorphism `H²_lc(G,𝕋)≅H²(g,ℝ)`. A
  finite-dimensional Lie group has `π₂(G)=0`, so the period obstructions of
  Neeb2004 Theorem VII.2 vanish once `π₁(G)=0` (WagemannWockel2015 Remark V.14
  states the 2-connected case of this differentiation isomorphism). In
  particular `H²_lc(ℝⁿ,𝕋)` is the space of alternating bilinear forms on ℝⁿ. For
  connected G in general record Neeb2004 Theorem VII.2's exact sequence
  `H¹(G̃,𝕋)→Hom(π₁(G),𝕋)→H²_lc(G,𝕋)→H²(g,ℝ)`, whose first term is the group of
  continuous characters of the universal cover; M3 and M4 use it for the SO(3)
  and SO₀(3,1) spin classes.
- **Whitehead lemmas.** Let K be a field of characteristic zero (ℝ in every
  use below), g a finite-dimensional semisimple Lie algebra over K and V a
  finite-dimensional g-module. Write `(δv)(x)=x·v` for the degree-zero
  coboundary and use Mathlib's `d₁₂`, `(d₁₂f)(x,y)=x·f(y)−y·f(x)−f([x,y])`, and
  `d₂₃` with its kernel `LieModule.Cohomology.twoCocycle`
  (`Mathlib/Algebra/Lie/Cochain.lean`). Prove that every 1-cocycle is `δv` for
  some v∈V and every 2-cocycle is `d₁₂f` for some linear f:g→V, that is
  `H¹(g,V)=0` and `H²(g,V)=0`, stated as `whitehead_one` and
  `whitehead_two` (Weibel1994 Corollaries 7.8.10 and 7.8.12, pp.245–246).
  This is the characteristic-zero field extension of the complex case owned
  by AffineLieAlgebras A1. Route,
  using only complete reducibility: g has trivial radical, hence nondegenerate
  Killing form by Mathlib's Cartan criterion, so Tau Ceti's
  `TauCeti.exists_isCompl_of_isKilling` complements every submodule of a
  finite-dimensional g-module. For a 1-cocycle f, the space `V⊕K` with
  `x·(v,t)=(x·v+t f(x),0)` is a g-module (the cocycle identity is exactly the
  bracket compatibility); a complement of `V⊕0` is a line spanned by some
  `(v₀,1)`, and it is killed by g because g maps everything into `V⊕0`, so
  `f=δ(−v₀)`. For a 2-cocycle c, give `Hom(g,V)` the module structure
  `(x·φ)(z)=x·φ(z)−φ([x,z])` and put `φ_c(x)=c(x,·)`; the cocycle identity
  says `d₁₂φ_c=−ι∘c`, where `ι(v)(z)=z·v` is a g-module map `V→Hom(g,V)`
  with kernel the invariants `V^g`. Split `V=V^g⊕V′` by complete
  reducibility, so that c splits accordingly. On `V′`, ι is injective;
  an equivariant projection p of `Hom(g,V′)` onto `ι(V′)` gives
  `c=d₁₂(−ι⁻¹∘p∘φ_c)`. On `V^g`, ι vanishes, so `φ_c` is a 1-cocycle with
  values in the dual module, hence `φ_c=δλ` by the degree-one lemma, and then
  `c(x,z)=−λ([x,z])=(d₁₂λ)(x,z)`. M3 consumes the scalar degree-two lemma for
  so(3) and the degree-one lemma for the dual of the Galilei radical; M4
  consumes the scalar degree-two lemma for so(3,1).

*Needs:* P.3; LieGroups Layers 2 and 5 (automatic smoothness, simply connected
covers); Mathlib Lie cochains, `LieAlgebra.IsSemisimple.instHasTrivialRadical`
and `LieAlgebra.HasTrivialRadical.instIsKilling`; Tau Ceti
`TauCeti.exists_isCompl_of_isKilling` (Whitehead lemmas).

**Checks.**

- For the Galilei mass cocycle `τ(g₁,g₂)=v₁·R₁a₂+(t₂/2)|v₁|²` of M3,
  `Dτ((v,a,t),(v′,a′,t′))=v·a′−v′·a`: the quadratic term has vanishing mixed
  second derivative at the identity. Hence `[K_i,T_j]=δ_ij M`, the bracket M3
  pins; the opposite extension law `(z₁+z₂−τ(g₁,g₂),g₁g₂)` gives
  `[K_i,T_j]=−δ_ij M`, which is the mass −m sector.
- `H²(ℝ²,ℝ)=ℝ` and the P.3 class `ω_θ` differentiates to `θ(ab′−a′b)`: the
  abelian algebra is not semisimple and the Whitehead lemma does not apply.
- SO(3) has `H²(so(3),ℝ)=0` and `π₁=ℤ/2`, so `H²_lc(SO(3),𝕋)≅Hom(ℤ/2,𝕋)≅ℤ/2`,
  the spin class; SL(2,ℝ) has `H²(sl(2,ℝ),ℝ)=0` but `π₁=ℤ`, so
  `H²_lc(SL(2,ℝ),𝕋)≅𝕋`, the first map being injective because the universal
  cover is perfect. The integration isomorphism needs `π₁(G)=0`.
- On so(3)=(ℝ³,×) with the adjoint module, the 1-cocycle `f(x)=x×a` is
  `δa`, since `x·a=x×a`; and `ι(v)(z)=z×v` vanishes only at v=0, so ι is
  injective, as the degree-two route needs when `V^g=0`.
- Semisimplicity is needed in degree one: for the one-dimensional abelian
  algebra ℝ acting trivially on V=ℝ, `f=id` is a 1-cocycle while every `δv`
  is 0, so `H¹=ℝ`; correspondingly the module `ℝ⊕ℝ` with x acting by
  `(v,t)↦(xt,0)` is the extension the degree-one route builds, and `ℝ⊕0` has
  no invariant complement there.
- For the scalar degree-two route on so(3) with trivial coefficients ℝ, the
  2-cocycle `c(x,z)=⟨a,x×z⟩` is `d₁₂λ` with `λ(w)=−⟨a,w⟩`, since
  `(d₁₂λ)(x,z)=−λ(x×z)=⟨a,x×z⟩`; on abelian ℝ² the cocycle `ab′−a′b` has no
  such λ because every bracket vanishes, matching `H²(ℝ²,ℝ)=ℝ` above.

### P.5 Free-particle position and momentum

On `L²(ℝ³)` with ℏ>0, define position `X_j` as multiplication by `x_j` on its
maximal domain and momentum `P_j` as the self-adjoint generator of the
translation group `(T_aψ)(x)=ψ(x−a)`, normalized by `T_a=exp(−ia·P/ℏ)` in
SelfAdjointSpectralTheory's Stone convention. With
`(F_ℏψ)(p)=(2πℏ)^(−3/2)∫exp(−ip·x/ℏ)ψ(x)dx`, unitary by VonNeumannAlgebras V11's
Plancherel theorem, prove `F_ℏX_jF_ℏ⁻¹=iℏ∂_(p_j)` and `F_ℏP_jF_ℏ⁻¹=` multiplication
by `p_j`, that Schwartz space is a common invariant core on which
`P_j=−iℏ∂_j`, and `[X_j,P_k]=iℏδ_jk` there. Prove that the same formulas hold
componentwise on `L²(ℝ³;V)` for a finite-dimensional Hilbert space V, which is
the form M3 consumes.

*Needs:* SelfAdjointSpectralTheory (Stone's theorem, multiplication
operators); VonNeumannAlgebras V11 (Plancherel); Mathlib `SchwartzMap` and
`VectorFourier.fourierIntegral`, whose character is rescaled to the ℏ
normalization above.

**Checks.**

- `F_ℏ(T_aψ)(p)=exp(−ip·a/ℏ)F_ℏψ(p)`, which is the sign `T_a=exp(−ia·P/ℏ)`;
  the opposite Fourier sign gives `exp(+ia·P/ℏ)` and reverses M3's translation
  character.
- For the Gaussian `ψ(x)=π^(−3/4)exp(−|x|²/2)` and ℏ=1, `F_1ψ=ψ`, and
  `(X₁P₁−P₁X₁)ψ=iψ` by direct differentiation.
- Multiplication by `x_j` is unbounded and not defined on all of L²: the
  vector `(1+|x|²)^(−1)` is square integrable while `x₁(1+|x|²)^(−1)` is not,
  so the maximal domain is a proper dense subspace.

### P.6 Permutation sectors of completed tensor powers

For a Hilbert space H and n≥0, on the completed tensor power `H^(⊗̂n)` of
VonNeumannAlgebras V2 define `U_σ(⊗_i v_i)=⊗_i v_(σ⁻¹i)`, the completion of Tau
Ceti's `PiTensorProduct.reindexRepresentation`. Prove `U_σU_τ=U_(στ)`,
unitarity, and that `P₊=(1/n!)Σ_σU_σ` and `P₋=(1/n!)Σ_σ sgn(σ)U_σ` are
orthogonal projections commuting with every `W^(⊗n)` for W unitary on H;
define `Symⁿ(H)` and `Λⁿ(H)` as their ranges. For n=2 these are `(Id±Σ)/2`
for the completed flip Σ, whose ±1 eigenspaces are `Sym²` and `Λ²`. M6 owns
every further tensor decomposition; this item supplies only the projectors.

*Needs:* VonNeumannAlgebras V2; Tau Ceti
`PiTensorProduct.reindexRepresentation`.

**Checks.**

- For n=0 and n=1 the symmetric group is trivial, `P₊=P₋=Id`, and
  `Symⁿ=Λⁿ`; a definition by `P₋=Id−P₊` would give `Λ¹=0`.
- For `dim H=d` finite, `dim Sym²=d(d+1)/2` and `dim Λ²=d(d−1)/2`; for d=1,
  `Λ²=0`, and `Λⁿ=0` for n>d.
- The left action convention: with `(U_τv)_i=v_(τ⁻¹i)`,
  `(U_σU_τv)_i=v_((στ)⁻¹i)`; the right-action formula `v_(σi)` would give
  `U_σU_τ=U_(τσ)`, which differs for the transpositions (12),(23) of S₃.

### Examples

The spin class of SO(3) is the pushout of `SU(2)→SO(3)` by the nontrivial
character of `{±1}`: through P.2 a projective representation of SO(3) on
`ℂ²` has a locally continuous lift near 1 by `s_ξ`, its multiplier is
locally continuous in the sense of P.3, and P.4 identifies its class with the
nonzero element of `Hom(π₁(SO(3)),𝕋)`.

### Dependencies

P.1 → P.2 → P.3 → P.4; P.5 and P.6 depend only on their
named suppliers. M1 consumes P.1–P.3 and HilbertModules H3, M2 consumes P.2 and HilbertModules H3, M3
consumes P.3–P.5, M4 consumes P.1–P.4 and HilbertModules H3, M5.Coding consumes P.2, M5
consumes HilbertModules H3 and HilbertModules H5, and M6 consumes P.6. No item of this layer consumes an
M-layer.

## Layer 2: M0a — Separable GCR and factor-type-I comparison

### M0a.1 TypeIComparison — the separable GCR/factor-type-I bridge

For separable C*-algebras own the Glimm–Sakai equivalence between: every
factor representation generating a spatial type-I von Neumann factor;
every irreducible image containing the compacts (GCR); a composition series
with liminal subquotients; and injectivity of the class-to-primitive-kernel
map. Here the composition series is an ordinal-indexed increasing family
(I_α)_(α≤β), with I₀=0, I_β=A, limit I_λ=closure(⋃_(α<λ)I_α), and each
I_(α+1)/I_α liminal. Specify both irreducible-image and composition-series conditions,
rather than identifying them through the word postliminal. Own both
directions, including the hard factor-type-I-to-GCR direction. Prove the
GCR same-kernel lemma and the class/kernel Fell–hull-kernel homeomorphism
here. For GCR⇒factor-type-I, a factor representation ρ has prime kernel J;
C2's separable prime⇒primitive theorem supplies an irreducible π with this
kernel. GCR gives `K(H_π)⊆π(A)`. Define `I=π⁻¹(K(H_π))`; this
containment makes `I/J≃K(H_π)` onto. It acts nondegenerately under ρ,
since its support is nonzero central in the factor. Put M=ρ(A)″=ρ(I)″.
For a rank-one projection e in I/J≃K(H_π), faithfulness on A/J gives
ρ(e)≠0. The rank-one corner e(I/J)e=ℂe and strong density imply
`ρ(e)Mρ(e)=ℂρ(e)`. Thus ρ(e) is minimal in M, and V3's existing
minimal-projection spatial theorem makes M type I. To identify the
amplification, use the rank-one matrix units e_ij of K(H_π):
`e_i⊗ξ↦ρ(e_i0)ξ` extends to an onto unitary
`H_π⊗ρ(e)H_ρ≃H_ρ`, since the finite diagonal sums form an approximate
unit for I/J and ρ(I) is nondegenerate. It intertwines I/J, and its
nondegenerate extension to A/J intertwines ρ with π⊗1. The matrix-unit,
corner and tensor APIs are those already owned by V3. This direction
uses no hard converse.
Own the same-kernel and composition-series implications separately, and
the hard Glimm implications factor-type-I⇒GCR, kernel injectivity⇒GCR
and GCR⇒liminal composition series. M0's CCR application, M2's
semidirect-product type-I comparison, M2.TypeIDisintegration's GCR/factor
and Borel-dual comparisons, M2.RectangularField's kernel topology, and
M5's GCR fiber comparison consume this one M0a owner. This algebraic bridge uses C1, C2 and V3; it has no M0, induction, irreducible-disintegration or semidirect-product prerequisite.

### Examples

For A=ℂ⊕ℂ, the two irreducible kernels are distinct and each image is ℂ=K(ℂ); a direct sum containing both has two-point support. For A=0 both dual and primitive space are empty.

### Dependencies

CStarAlgebras C1/C2; VonNeumannAlgebras V3/V4; HilbertModules H3. HilbertModules H5 supplies the small dual; TypeIComparison precedes M2 disintegration.

## Layer 3: M0 — Smooth vectors, compact types and semisimple representation bridges

Use native `ContRepresentation ℂ G H` and
`ContRepresentation.IsUnitary`, with the additional explicit
strong-continuity condition `∀ v, Continuous (fun g ↦ π g v)`.
Topological irreducibility means H is nonzero and the only **closed** invariant
complex submodules are 0 and H. Use native `Subrepresentation`, its
underlying submodule and `ContRepresentation.subrepresentation` for
restrictions; this Hilbert-space condition is distinguished from algebraic
`Representation.IsIrreducible`. Prove strong-continuity transport to native
subrepresentations by the subtype topology; the native operator-norm-continuity
lemma requires a stronger hypothesis. Consume CompactGroups for finite-dimensional
compact irreducibles, characters and Peter–Weyl density, LieGroups for the Lie
algebra/exponential and enveloping differential operators, LieHighestWeight
for PBW, and UO-E03 for the analytic-vector operator criterion.

Own the extension of Peter–Weyl to arbitrary strongly continuous unitary Hilbert
representations of compact K. With Haar(K)=1, define
`P_τv=d_τ∫_K conjugate(χ_τ(k))π(k)v dk` by **vector-valued** Bochner integration,
then prove boundedness and construct the continuous linear operator. No operator-norm
continuity or Bochner integrability into B(H) is assumed. Prove self-adjointness,
idempotence, `P_τP_σ=0` for inequivalent types, strong convergence of finite-subset
sums to1, and `H_τ≅τ⊗Hom_K(τ,H)`. Normalize the multiplicity Hilbert product by
`⟨A,B⟩=tr(A*B)/d_τ`, so the evaluation `v⊗A↦Av` is isometric; prove
basis independence, positivity, completeness and the completed-tensor comparison
using VNA V2. Prove compact-type projections preserve the
Gårding space by compact-measure convolution of its test functions. Consume the topology-free algebraic prefix of AutomorphicFormsOnReductiveGroups §2.1: its `IsGFinite`, `gFiniteSubmodule`, addition, scalar, invariance and equivariant-map APIs are the common owner. Here `IsKFinite π K v` abbreviates that predicate on `(π.restrict K.subtype).toRepresentation`; prove the orbit-span identification by the native restriction formula and use the shared addition theorem. NQS owns the Hilbert isotypic-projector, multiplicity, completed-tensor and smooth/analytic-vector comparisons above and below, rather than a second primitive compact-finiteness definition. The compact-finite density input is the compact Banach theorem of the same section; these two early interfaces introduce no automorphic/globalization prerequisites. K-finite vectors
are exactly the algebraic sum of the H_τ, including infinite multiplicity before
admissibility is proved. For strongly continuous π and a compact subgroup K
as in M0, admissible means every H_τ, equivalently every multiplicity
space Hom_K(τ,H), is finite-dimensional. The admissibility condition
bundles π's orbit continuity with this multiplicity condition; its uses here
always take this compact K. Build the finite-carrier/unitary-intertwiner
comparison with `ContIntertwiningMap`; all finite-dimensional compact unitary models
are transported to native `EuclideanSpace ℂ (Fin d)`. The native `ContRepresentation`
structure is only a monoid homomorphism into continuous linear maps; it does not itself
assert that `g ↦ π g v` is continuous. In every use of a strongly continuous unitary
representation, carry and prove this orbit-continuity property explicitly, including for
restricted representations and compact-type comparisons.

Define a `(𝔤_ℂ,K)`-module by a complex Lie-module action and a locally finite K
representation whose action on each finite-dimensional K-stable subspace is continuous
(hence smooth), their Ad(K)-compatibility and equality of that differentiated K-action
with the restricted 𝔨-action on those subspaces. Use native Lie/module/representation carriers. Its
infinitesimal equivalence is an isomorphism of these K-finite modules. For connected
K prove a U(𝔤_ℂ)-isomorphism is automatically K-equivariant by integration on finite
K-orbit spaces; do not identify the full Gårding space with the K-finite space.

1. For every strongly continuous unitary representation of a finite-dimensional
   Lie group, construct the dense invariant Gårding space by integrated
   `C_c∞(G)` functions and the smooth-vector submodule. Build the derived Lie
   action, mixed-word domains and the complexified enveloping-algebra action,
   with `X*=-X` for real Lie algebra elements. Prove the integration by parts,
   convolution and π(g)-transport laws on those domains. Construct the positive
   auxiliary Nelson operator `N=1−Σdπ(X_i)²`; prove essential self-adjointness,
   graph cores for its powers and enveloping-operator Sobolev bounds. Pin
   Nelson's Theorem3 comparison as a **sufficient one-way statement**:
   if v∈⋂_m dom(N̄^m) and `Σ_m ‖N̄^m v‖s^m/m!<∞` for some s>0, then
   `g↦π(g)v` is analytic in Hilbert norm in LieGroups' BCH analytic charts.
   Prove the shift/sign comparison with `ΣX_i²`, the density of such vectors,
   and norm convergence of the local orbit power series. Own the analytic
   domination/ordered-commutator estimates of Nelson Lemma6.2 and Corollary3.2,
   including the factorially weighted sum over all Lie-algebra words; a
   uniform bound by `c^k‖N̄^(k/2)v‖` is not asserted. This does not identify
   group-analytic vectors with N-analytic vectors. Define a complex enveloping
   element of order m to be elliptic when its scalar homogeneous principal
   symbol is nonzero at every nonzero real covector. Consume
   PseudodifferentialOperators P5/P6's local interior distributional regularity
   and cutoff Sobolev estimates on G for that symbol, and prove their
   representation-vector/weak matrix-coefficient adapters here. Fix the
   differential dictionary: `R_X f(g)=d/dt|₀ f(exp(tX)g)` is right invariant,
   and `dπ(X)π(f)=π(−R_X f)` for left Haar and left integrated action.
   The assignment X↦−R_X transports the enveloping Lie/involution laws;
   prove its sign/order comparison with the source's right-invariant algebra.
   For power cores use symmetry and ellipticity of N^m and self-adjoint
   maximality to identify the closure with N̄^m. Prove Nelson–Stinespring Theorem2.2
   on the Gårding domain: for an elliptic enveloping element L, the closure
   of dπ(L*) is the adjoint of dπ(L). In particular symmetric elliptic L
   is essentially self-adjoint. Prove its Corollary2.4 separately: if L is
   symmetric elliptic and dπ(M*M) commutes with dπ(L) on this domain, the
   same adjoint-closure identity holds for M. Own the elliptic estimates,
   resolvent and spectral-commutation argument that passes from the common
   domain to the closures. For a symmetric central Z the displayed
   commutation hypothesis follows from centrality; the corollary proves
   essential self-adjointness of dπ(Z), without asserting that arbitrary
   symmetric enveloping elements have this property. Prove the general covariance
   `π(g)dπ(Z)π(g)⁻¹=dπ(Ad(g)Z)` on the Gårding core. For Z fixed by Ad(G),
   hence for every central Z when G is connected, prove π(g) transports
   the Gårding core and dπ(Z), hence transports its closure and commutes
   with its spectral projections. After this closure theorem, use spectral
   cutoffs and the commutation/domain estimates to construct dense vectors
   `E_Z([−n,n])π(f)w`, f∈C_c∞(G), analytic for that particular operator,
   with UO-E03's factorial bounds. These remain Gårding vectors because
   the spectral cutoff commutes with π(f); prove their dense span.
   This consequence is not used circularly to prove the closure theorem.
   Consume VNA's commutant and SAST spectral calculus to prove the
   bounded unitary Schur lemma for topologically irreducible π; deduce that
   these Ad(G)-fixed central closures are scalars. Split an Ad(G)-fixed central element into
   its Hermitian real and imaginary parts and construct the resulting
   infinitesimal character.
2. For a connected semisimple G with finite center and maximal compact K,
   prove Harish-Chandra admissibility: every irreducible unitary π has finite
   K-multiplicities, with `dim H_τ ≤ C_π (dim τ)²`.
   First own the general Cartan structure theorem in this scope: construct
   an involution θ of 𝔤 with positive form `−B_𝔤(X,θY)`. Integrate it
   explicitly on Ad(G) and apply LieGroups Layer9's semisimple specialization:
   that supplier proves connectedness, compactness, maximality of its fixed
   subgroup and the decomposition, without assuming maximality first.
   Lift the involution through the finite central cover as described below.
   Consume the resulting Layer9 decomposition `K×𝔭≃G` and derive its deformation
   retraction to K. Prove conjugacy of maximal compact subgroups by the
   following symmetric-space fixed-point argument, owned here. Consume
   RiemannianGeometry R1's reductive-complement construction and completeness
   for the invariant metric from B|𝔭. The symmetry induced by θ identifies
   its Levi–Civita connection with the canonical symmetric-space connection;
   prove that equality using the symmetry and the metric/torsion characterization.
   compute `R(X,Y)Z=−[[X,Y],Z]` in R1's convention, so
   `⟨R(X,Y)Y,X⟩=B([X,Y],[X,Y])≤0`.
   Prove `G/K≃𝔭` from the Cartan diffeomorphism and hence simple connectedness.
   Consume R2's Jacobi/exponential comparison, R4.1 with κ=0 and
   R4.4's Cartan–Hadamard theorem. Own here the squared-distance consequence:
   off p, `Hess(½r²)=dr⊗dr+r Hess r≥g`; extend across p using smoothness
   of squared distance in the global exponential coordinates. For a compact subgroup L minimize
   `x↦∫_L d(x,l·o)² dl`: prove properness and strict convexity from that
   bound, existence by complete finite-dimensional closed-ball compactness,
   and uniqueness, consuming HopfRinow's complete closed-ball compactness.
   Haar invariance makes the minimizer L-fixed, so L lies
   in a conjugate of K; maximality gives equality for maximal compact L.
   Transport the construction to the given K and prove compatibility with
   finite central covers. Here 𝔭 is
   the minus-eigenspace and `𝔨=Lie(K)` the plus-eigenspace. Build the
   involution from a compatible compact real form, with the following
   compatibility targets owned here. Consume LieGroups Layer7's
   Lie-algebra compact-real-form construction and its conjugation τ,
   including the positive Hermitian form `H_τ(X,Y)=−B_ℂ(X,τY)`
   (linear in X) and its realification/Killing comparisons. This auxiliary
   form uses the supplier’s first-linear convention; for the native
   second-linear inner product use `⟨X,Y⟩_τ=H_τ(Y,X)=−B_ℂ(τX,Y)`.
   Transport adjoints, positivity and self-adjointness through this identity.
   Let σ be conjugation defining 𝔤. On the realification of 𝔤_ℂ put
   ω=στ and ρ=ω². Prove ω self-adjoint for the positive form defined by τ
   and ρ positive; ω itself need not be positive. Prove positive spectral
   powers of ρ preserve brackets by the product law for its eigenspaces.
   With φ=ρ^(1/4), prove τ′=φτφ⁻¹ commutes with σ, so
   θ=τ′|𝔤 is the required positive Cartan involution. Compare with
   [Knapp, Chapter VI, Lemma6.15, Theorem6.16 and Corollary6.18](https://www.math.stonybrook.edu/~aknapp/books/green/file4.pdf).
   Own the adjoint-group comparison in this scope: prove ker Ad=Z(G) for
   connected G, and `Ad(G)=Int(𝔤)=Aut(𝔤)₀` using the semisimple derivation
   theorem and generation by exponentials. Aut(𝔤) is a closed matrix
   subgroup by its bracket equations; its identity component is closed,
   so LieGroups Layer2 supplies the Lie-group structure. Prove
   `θ exp(ad X) θ⁻¹=exp(ad θX)`, hence conjugation by θ preserves
   this adjoint group and defines its smooth involution. Prove G→Ad(G)
   a smooth surjective local diffeomorphism with finite kernel Z(G), hence
   a finite covering homomorphism. Consume Layer9's
   polar decomposition there and lift the Cartan data through the
   finite central cover G→Ad(G), with its kernel Z(G).
   Prove the adjoint involution fixes
   the fundamental-group/deck data using its deformation retraction to the
   fixed subgroup, so it lifts to the chosen finite cover. Consume
   LieGroups Layer5's covering/lift construction; the lift is a continuous
   homomorphism, hence smooth by LieGroups Layer2's automatic smoothness
   theorem. Export here the lifting criterion in terms
   of the image subgroup of π₁ using path lifting and endpoint independence.
   Prove the lifted map fixes the identity, is a homomorphism and squares
   to the identity by uniqueness of lifts on connected G and G×G.
   Apply Layer9
   directly to this lifted involution on G for connectedness, compactness,
   maximality of G^θ and the decomposition; identify its fixed subgroup with
   the preimage of the adjoint fixed subgroup using those decompositions.
   Finite center need not make G
   itself a faithful matrix group. LieGroups Layer9 consumes Cartan data;
   this general existence/comparison is an M0 target before that use.
   Pin `B_𝔤` as the Killing form of the **real** Lie algebra 𝔤. Use bases
   orthonormal for `−B_𝔤|𝔨` and `B_𝔤|𝔭`, not the Killing form of 𝔨
   considered as a separate Lie algebra. The central Casimir is
   `C=−ΣX_i²+ΣY_j²`; with `Δ_K=−ΣX_i²`, the positive comparison is
   `N=1−ΣX_i²−ΣY_j²=1−C+2Δ_K`. Prove these identities before admissibility.

   Own the symmetric-pair invariant and harmonic API needed for the algebraic
   proof. Identify polynomial functions on 𝔭_ℂ with its symmetric algebra
   through the nondegenerate Killing form. Consume LieGroups Layer9's maximal
   abelian 𝔞⊂𝔭, restricted roots and W=N_K(𝔞)/Z_K(𝔞); define invariant
   restriction using those carriers and prove
   `S(𝔭_ℂ)^K≅S(𝔞_ℂ)^W`. Prove polynomiality and the Kostant–Rallis
   separation `S(𝔭_ℂ)≅S(𝔭_ℂ)^K⊗H`, with H the joint kernel of the
   positive-degree invariant constant-coefficient differential operators.
   Prove graded/K-equivariant multiplication, finite K-multiplicity of H
   with a uniform `dim H_τ≤C(dim τ)²` bound, and the comparison with the
   coordinate representation of a regular semisimple K-orbit. Prove the
   invariant ring is finite over the restrictions of the leading symbols
   of `Z(U(𝔤_ℂ))`; equality/surjectivity of these restrictions is not assumed.
   Derive this finiteness through injective restriction to 𝔞, characteristic-
   polynomial invariants of the adjoint action and integrality of its
   coordinate functions over the restricted invariant algebra; prove the
   corresponding graded finite-module statement. Consume LieHighestWeight's PBW
   filtered/symmetric-algebra comparison and its Harish-Chandra center map through
   S(𝔥); it does not supply the symmetric-pair invariant theory.
   Consume Layer7's `pbwSymmetrization`, its permutation-average formula,
   `pbwSymmetrization_symbol`, `pbwSymmetrization_mem_center_iff` and filtered
   associated-center/invariant comparison, specialized to 𝔤_ℂ. This β is
   linear, not an algebra homomorphism. Own only the symmetric-pair bridge:
   use the Killing identification on all of 𝔤_ℂ, proving restriction of
   invariant polynomial functions to 𝔭_ℂ agrees with symmetric-algebra
   projection along 𝔨_ℂ. Define the 𝔭-degree filtration, prove the PBW
   vector-space factorization `β(S(𝔭_ℂ))⊗U(𝔨_ℂ)≃U(𝔤_ℂ)`, and prove
   `symbol_𝔭(β(f))=Res(f)` for the homogeneous adjoint invariants used above.
   These definitions, restriction maps and leading-symbol identities are M0
   targets before applying the algebraic admissibility theorem.

   Prove the resulting algebraic theorem: a finitely generated `(𝔤_ℂ,K)`
   module that is Z-finite has finite K-multiplicities with such a uniform
   bound. Z-finite means each vector's central-algebra orbit is finite-dimensional;
   for a finitely generated module prove equivalence to annihilation by a
   cofinite central ideal. Use PBW, harmonic separation and the finite module
   over the restricted central symbols, including finite generators and tensor
   multiplicity bounds; PBW or a scalar central character alone does not prove
   admissibility.

   Close the analytic bootstrap **without assuming π already admissible**.
   Item1 makes the center scalar for irreducible π and connected G. For a
   K-finite Gårding vector the displayed Cartan N is scalar on each of its
   finitely many compact types, so item1's one-way N-analytic criterion makes
   it group-analytic. This lemma applies before item3. Choose such a nonzero
   v using the compact projections and form `M=U(𝔤_ℂ)span(K·v)`. Prove M is
   finitely generated, K-locally finite, smooth, Z-finite and algebraically
   admissible by the preceding theorem. Prove its Hilbert closure G-invariant
   by the analytic power series; irreducibility makes that closure all H.
   Since P_τM is finite-dimensional and dense in H_τ, they are equal. This
   gives the claimed bound and the native continuous-intertwiner comparison. The group-theoretic instances used here are
   `(SL(2,ℝ),SO(2))`, `(SL(2,ℂ),SU(2))` with SL(2,ℂ) a real Lie group,
   and `(Spin₀(4,1),Spin(4))`. For the last pair use native
   `CliffordAlgebra.realCliffordSpinGroup 4 1`, with
   `CliffordAlgebra.realCliffordSpinGroupZero 4` as compact
   model. Native `realCliffordForm 4 1` is the negative of M5's ambient form;
   the same linear action preserves both. Consume SpinRepresentations Layer7's
   inherited topology/cover comparisons and its identity-component image
   theorem in indefinite signature. For its normalization comparison,
   timelike means native-negative, equivalently M5-positive: verify that
   norm-one even Clifford products have even timelike-reflection parity
   and even total reflection parity in that supplier's image theorem.
   Its `spinPQ p q` and native `CliffordAlgebra.realCliffordSpinGroup p q`
   both abbreviate `CliffordAlgebra.spinGroup (TauCeti.realCliffordForm p q)`;
   export their identity-on-elements comparison with the inherited topology.
   Prove the native group connected:
   its identity component covers connected SO₀(4,1), and both kernel elements
   lie in the connected compact Spin(4) subgroup. Its identity component is
   therefore the whole native carrier. Prove the maximal-compact inclusion
   and Lie-group adapters, including the signature/permutation and
   opposite-form even-Clifford comparisons for the compact model. The
   native positive-definite Spin(n) inclusion is not an indefinite-signature
   inclusion theorem. Supply the latter through the quadratic embedding
   and inherited-topology comparisons in SpinRepresentations Layer7,
   rather than inventing a
   separate Spin carrier. Construct all three Cartan decompositions from
   LieGroups and verify connectedness, finite center and maximal compactness.

   **M0.RealLorentzExport — concrete real Lie and Killing carriers.** For the `(SL(2,ℂ),SU(2))` example, use the finite-dimensional boundaryless real Lie-group structure supplied by LieGroups Layers0–3 and prove connectedness of SL(2,ℂ), for example by its SU(2)/positive-Hermitian polar decomposition. Identify its actual native `LeftInvariantDerivation I (Matrix.SpecialLinearGroup (Fin 2) ℂ)` with `RealSl2C := RestrictScalars ℝ ℂ (LieAlgebra.SpecialLinear.sl (Fin 2) ℂ)` by a real LieEquiv. Consume the LieRing/LieAlgebra restriction instances from `Mathlib.Algebra.Lie.BaseChange`. The existing derivation–tangent comparison is linear, under its finite-dimensional real, T2 and identity-interior hypotheses; verify those hypotheses for the constructed matrix-group model and prove the matrix bracket comparison needed for this LieEquiv. Prove `B_ℝ(X,Y)=8 Re(trace(XY))` on RealSl2C and its nondegeneracy, giving finite dimension and the actual `LieAlgebra.IsKilling ℝ` instance. Transport the form, finite dimension and Killing instance onto `LeftInvariantDerivation` itself using native `LieAlgebra.killingForm_of_equiv_apply` and `LieEquiv.isKilling`. An instance on the trace-zero matrix carrier alone is not the exported instance on the group's derivation carrier.

   Also construct the ordinary connected Lorentz group on `V_η=(Fin 1⊕Fin 3)→ℝ`, with `η=LieAlgebra.Orthogonal.indefiniteDiagonal (Fin 1) (Fin 3) ℝ` and `Q_η(x)=xᵀηx`. Consume native `TauCeti.QuadraticMap.specialOrthogonalGroup Q_η` and `specialOrthogonalToGeneralLinear`; identify its coordinate image in `Matrix.GeneralLinearGroup (Fin 1⊕Fin 3) ℝ` exactly with `AᵀηA=η`, `det A=1`, with the inherited topology. Take its identity component, denoted `SO₀(3,1)` in M4's convention, and give it the boundaryless real LieGroup structure from LieGroups2. This is the indefinite Gram matrix, not the standard positive-definite `Matrix.specialOrthogonalGroup` or the weightedSumSquares-one comparison. Identify its `LeftInvariantDerivation` by a real LieEquiv with native `LieAlgebra.Orthogonal.so' (Fin 1) (Fin 3) ℝ`; prove `B(X,Y)=2 trace(XY)` and nondegeneracy. Export finite dimension and `IsKilling ℝ` on both this matrix Lie algebra and the ordinary group's actual derivation carrier, using the same native equivalence-transport lemmas.

   Construct the smooth congruence homomorphism from SL(2,ℂ) on the native real Hermitian-matrix submodule, using `H(x)=[[x⁰+x¹,x²−ix³],[x²+ix³,x⁰−x¹]]`, with `det H(x)=η(x,x)`. Own the single signed continuous linear equivalence `Q_N:(Fin 4→ℝ)≃L[ℝ]V_η`, whose time-first coordinates are `x=(p₃,p₂,−p₁,p₀)` and whose inverse is `(x³,−x²,x¹,x⁰)`. Prove form preservation and `H(Q_N p)=realCliffordThreeOneVectorEquivHermitian p`, whose off-diagonal is `−p₁−ip₀`. Thus the +--- ordinary-group coordinates agree with M4's native time-last `diag(−1,−1,−1,+1)` convention and its negative-realCliffordForm determinant law. Prove the congruence homomorphism's real derivative is `X:H↦XH+HX†`, that it induces the stated Lie-algebra equivalence, that its group kernel is `{±I}`, and that its image is the identity component: connectedness puts the image there, and its locally invertible derivative makes it an open subgroup, hence all of that component. Prove the local two-sheeted cover charts and the smooth Lie-group quotient comparison `SL(2,ℂ)/{±I}≃SO₀(3,1)`, compatible with the Killing and derivation identifications. Transporting this same action back by Q_N is exactly M4's native Hermitian action, also compared with `TauCeti.realSpinThreeOneEquivSpecialLinear_action`; no second Lorentz-action convention is introduced. These finite-dimensional exports use only the native algebra/matrix inputs and LieGroups0–3/local quotient charts, not Layer P.4, the Gårding/admissibility theorems or a representation classification. M4's multiplier computation and other finite-dimensional Lorentz consumers use the exported actual carriers/instances downstream. The arbitrary connected semisimple finite-center scope of item2 remains unchanged.

3. Use the shared algebraic compact-finite predicate and submodule from
   AutomorphicFormsOnReductiveGroups §2.1 on the restricted representation.
   Consume its sum/scalar/equivariant-map API and compact Banach density
   theorem; prove their native continuous-restriction and Hilbert-intertwiner
   comparisons and identify the submodule with the algebraic sum of compact
   isotypic spaces. For the
   connected semisimple finite-center G and maximal compact K of item2,
   prove for every admissible unitary π that these vectors are smooth, analytic in the
   Hilbert norm and stable under the derived complexified Lie algebra and K.
   Smoothness follows by applying compact-type projections to Gårding vectors
   and finite-dimensionality. Use item2's already proved Cartan identity.
   On a finite K-isotypic space Δ_K is scalar and C is a finite-dimensional
   Hermitian operator preserving it; C need not be scalar for a general
   admissible π. Thus N is bounded there. Prove its power estimates and use
   item1's elliptic analytic-vector comparison to obtain Hilbert-norm
   analytic orbit maps. Construct the compatible `(𝔤_ℂ,K)`-module and prove that
   closed invariant Hilbert subspaces correspond to its algebraic submodules,
   by intersection with K-finite vectors and Hilbert closure. Prove the
   inverse laws, including the finite-isotypic closure argument and invariance
   under exponentials. Deduce topological irreducibility iff this module is
   irreducible. For irreducible unitary π,ρ prove infinitesimal equivalence
   yields a unitary group intertwiner: construct the invariant Hermitian
   comparison, use its polar decomposition and analytic-vector integration,
   and prove the converse. No bounded extension of an arbitrary algebraic
   intertwiner is assumed.
   **Unitarization and integration.** For an admissible `(𝔤_ℂ,K)`-module with
   a positive-definite invariant Hermitian form, construct its Hilbert
   completion and the strongly continuous unitary K-action. The real Lie
   algebra acts by skew-symmetric operators on the dense invariant algebraic
   K-finite domain. The Cartan formula above makes N a finite-dimensional
   Hermitian operator on each finite isotypic summand. Prove every algebraic
   vector is N-analytic and apply UO-E03 to its dense domain, then Nelson's
   Theorem5 to integrate the real Lie action to the simply connected group.
   For a nonfaithful Lie action apply that operator theorem to its image
   `𝔤/ker ρ`: choose a basis adapted to the kernel and its Killing-orthogonal
   ideal complement, prove θ-stability and that the zero summands leave the
   represented sum of squares unchanged, then pull back along LieGroups'
   simply connected quotient homomorphism. Treat the zero image/trivial
   representation directly. Verify all product domains, real linearity, brackets and basis sum-of-squares
   hypotheses; LieGroups' finite-dimensional Lie integration alone does not
   integrate these unbounded Hilbert operators. Prove uniqueness and agreement
   with the given K-action. Use the Cartan deformation to K and the represented
   period lattice to prove descent to the chosen finite-center G; prove this
   for each of the three group instances. Show the resulting K-finite module
   is the original module. For semidefinite forms first quotient the radical
   and prove stability/admissibility. M4/M5 must check these hypotheses for
   every separately metrized induced subquotient before calling it a unitary
   representation, including boundary and discrete/limit constituents.

4. Prove that these three groups are CCR. For f∈C_c∞(G), let P_R be the sum
   of compact K-types with nonnegative Δ_K-eigenvalue λ_τ≤R, **including λ_τ=0**.
   Prove there are finitely many such K-types by the compact highest-weight
   Casimir formula and lattice bounds.
   By admissibility P_R has finite rank. Prove
   `‖(1−P_R)π(f)‖ ≤ (1+R)⁻¹‖π((1+Δ_K)f)‖`
   from the compact spectral decomposition and the derived-convolution law;
   `(1+Δ_K)f` uses the right-invariant test-function derivatives fixed in item1,
   so π(f) is compact. Use density of C_c∞(G) in the full group C*-algebra and
   prove that an irreducible C*-algebra of compact operators equals K(H).
   Thus every irreducible group-algebra image is K(H). TypeIComparison's GCR-to-factor direction
(CCR implies GCR) proves that every factor representation generates a type-I
factor for these separable group C*-algebras; it feeds the little-group type-I hypotheses in M2
   and the direct-integral uses in M6. No Glimm converse is required for this step.
   Transport CCR to the finite central quotients SO₀(1,2), SO₀(3,1) and
   SO₀(4,1): normalized integration over the finite kernel makes pushforward
   onto C_c of the quotient surjective, so an irreducible representation of
   the quotient and its pullback have identical integrated images.

The proof-route sources are Harish-Chandra's
[*Representations of Semisimple Lie Groups II*](https://doi.org/10.1073/pnas.37.6.362)
and [*III: Characters*](https://doi.org/10.1073/pnas.37.6.366), together with
[*Representations of a semisimple Lie group on a Banach space I*](https://doi.org/10.1090/S0002-9947-1953-0056610-2)
as the expanded Banach-space reference. The Hilbert proof specified here uses
the explicit compact decomposition, symmetric-pair algebra and Nelson criteria.
For the algebraic admissibility proof see N. R. Wallach, *Real Reductive Groups I*
(1988), §§3.4.1–3.4.10, including the restricted central-symbol identity and
finite invariant quotient; [Kostant–Rallis (1971)](https://doi.org/10.2307/2373470)
supplies the symmetric-pair theorem. [Roe Goodman's *The Kostant–Rallis Theorem*](https://sites.math.rutgers.edu/~goodman/pub/cunytalk.pdf),
§9 Theorem12, states harmonic separation and multiplicity `dim τ^M`; M0 owns
its proof and the filtered/tensor estimates, not merely its invocation.
For the preliminary quasi-simple and unitary-equivalence statements see
[*Representations of a Semisimple Lie Group on a Banach Space*, PNAS37(3),170–173](https://doi.org/10.1073/pnas.37.3.170).
Nelson's [*Analytic Vectors*](https://doi.org/10.2307/1970331), Theorem3,
Corollary3.2, Lemma6.2 and Theorem5, supplies the one-way Laplacian and
unbounded-operator integration route, with descent proved here.
Nelson–Stinespring's
[*Representation of Elliptic Operators in an Enveloping Algebra*](https://doi.org/10.2307/2372913)
supplies Theorem2.2 and Corollary2.4's elliptic/central closure route; every domain/analytic comparison above
is an owned target. M4 and M5 consume this bridge before their noncompact
unitary-dual exhaustion proofs.

### Examples

The trivial representation has one trivial compact type with multiplicity one. A direct sum of infinitely many trivial representations has the same compact label with infinite multiplicity, so compact-finiteness alone is not admissibility.

### Dependencies

P.1–P.4; RepresentationTheory/CompactGroups and LieGroups; AutomorphicFormsOnReductiveGroups §2.1; PseudodifferentialOperators P5/P6; RiemannianGeometry R1/R2/R4; HopfRinow. Each numbered bridge states the additional analytic inputs its route uses.

## Layer 4: M1 — Systems of imprimitivity and induction

**M1.Core — induction and measurable transport.** This layer extends from this heading through the finite-index graded Clifford theorem immediately before M2. It contains the quotient/induced-model constructions, M1.BorelRealization and the finite-index graded theorem, and consumes VNA V3’s minimal-projection, spatial type-I factor and commutant APIs. The induced decompositions themselves require no type-I hypothesis; the finite-index graded Clifford theorem separately assumes that its normal subgroup L is type I. This layer precedes M2.TypeIDisintegration. Irreducible refinement of induced decompositions is the separate M2.InducedRefinement clause.

Consume Layer P.1 for projective Hilbert-space/ray carriers, Wigner's theorem and the unitary/antiunitary alternative, and Layer P.3 for the locally continuous lift/cocycle comparison. M1 owns the standard-Borel quotient selector and induced-model transport. Consume Layer P.2's Polish U/PU/UA/PUA groups, coefficient-generated unitary/graded Borel structures (including grade for UA), quotient Polish Borel structures for PU/PUA, and Pettis's theorem before any Borel-to-continuous bridge below.

Here a type-I lcsc group means that every factor representation generates
a spatial type-I von Neumann algebra, in VNA V3's factor carrier. Compare
the projection definition: a nonzero abelian projection in a factor has
an abelian factor corner, hence corner ℂp and is minimal; V3 then gives
the spatial `B(K)⊗1_M` model and its commutant. M2 and the finite-index
theorem below use this same definition. The elementary Borel multiplier change-of-section identity follows from the defined cocycle and is not duplicated as a second Layer P theorem.

For a second-countable locally compact group `G` acting continuously on a Polish space `X` with its Borel sigma algebra, define a system of imprimitivity `(U,E)` on a separable complex Hilbert space: `U` is strongly continuous and unitary, `E` is a normalized projection-valued measure, and `U_g E(B) U_g⁻¹ = E(gB)`. Prove direct sums, reducing subspaces, intertwiners, unitary equivalence, and covariance under Borel equivariant maps. State the exact topology/measurability assumptions for each construction.

For a transitive space `X=G/H`, with H closed and a quasi-invariant measure class, prove Mackey's imprimitivity equivalence: every such system is unitarily equivalent to induction of a representation of H, and conversely. Construct the quotient bundle and measurable sections and prove independence from their choice. For a locally sectioned central extension consume Layer P.3’s countable local-section patching construction of a Borel section. Distinguish that local continuous section from the general Borel selector for a standard-Borel quotient; prove the selector by countable nested balls if the consumed API supplies only a universally measurable selection.

Fix left cosets and `g_*μ(B)=μ(g⁻¹B)`. For a Borel section `s:X→G`, put `k_s(g,x)=s(x)⁻¹ g s(g⁻¹x)∈H`. On `L²(X,μ;K)` define `(U_gF)(x)=r_g(x)^(1/2)π(k_s(g,x))F(g⁻¹x)`, where `r_g=d(g_*μ)/dμ`. Prove `r_{gh}(x)=r_g(x)r_h(g⁻¹x)` and `k_s(gh,x)=k_s(g,x)k_s(h,g⁻¹x)`, which give representation law, unitarity and covariance. Equivalently use a rho-function `ρ:G→(0,∞)` satisfying `ρ(gh)=Δ_H(h)Δ_G(h)⁻¹ρ(g)` for `g∈G`, `h∈H`, with its quotient measure; the resulting Radon–Nikodym derivative is the single square-root factor above, not an additional modular multiplier. Prove that every nonzero σ-finite quasi-invariant Borel measure on this transitive lcsc quotient belongs to the quotient Haar class. Construct a version `(g,x)↦r_g(x)` that is jointly Borel and equals the actual RN derivative almost everywhere for each fixed g, with `0<r_g(x)<∞` almost everywhere. A continuous positive rho-function and the quotient formula give such a version; transport it to any equivalent σ-finite measure by the stated density change. Separate Borel representatives for individual g do not supply this joint measurability. Use the jointly Borel version for the strong-continuity proof, and prove the L² operator is unchanged by replacing each fixed-g version on a null set. Replacing `μ` by an equivalent measure `μ′=wμ`, with Borel `w` and `0<w<∞` almost everywhere, gives `r_g^{μ′}(x)=r_g^μ(x)w(g⁻¹x)/w(x)`, and `J:L²(μ′)→L²(μ)`, `JF=w^(1/2)F`, is a unitary intertwiner. Replacing the Borel section by `s′=s b`, for a Borel map `b:X→H`, is intertwined by `F(x)↦π(b(x)⁻¹)F(x)`. Pin the projective convention `U_gU_h=ω(g,h)U_{gh}` to match Layer P.3. Prove strong continuity from the chosen lcsc data and representation. Show how this model agrees with D3 Green induction after the H3 correspondence-to-Hilbert-space comparison, including both modular functions. Include the one-point space, `H=G`, `X=G`, and compact quotient as normalization cases. Every quotient integration identity is stated for `f∈L¹(G)` or nonnegative measurable `f` (using monotone convergence); no unrestricted signed function is presumed integrable.

### M1.BorelRealization — equivariant Polish models and transport

Own the following theorem for every Polish topological group `G` (hence every
Hausdorff lcsc group), every standard Borel measurable space `X`, and every
native `MulAction G X`, with `[MeasurableSpace G] [BorelSpace G]`, whose
action map is jointly Borel, expressed by native
`MeasurableSMul₂ G X`. Construct a Polish `G`-space `Y` with native
`ContinuousSMul G Y` and an equivariant `MeasurableEquiv X Y`, with Y carrying
its Borel measurable structure. Equivalently choose a Polish topology on the
same underlying X with exactly its original sigma algebra and continuous
action. No topology or continuity of the original X-action is an input.
Native `MeasurableSMul G X` is only separate measurability and is not this
hypothesis. `upgradeStandardBorel` alone chooses no action-compatible topology.

The headline `exists_polishTopology_continuousSMul` states this realization.
M1 owns the descriptive-set prerequisites and complete realization proof,
rather than assuming a named realization theorem. Use the Vaught transforms
`A^(ΔU)={x | {g∈U | g•x∈A} is nonmeagre in U}` for nonempty open U in a
countable basis of G. Own the Montgomery–Novikov category-quantifier theorem
for Borel subsets of G×X, with the category argument proving
these transforms Borel. Use Baire-property localization and its closure
under complements/countable unions. Prove complement/countable-union and translation
identities. Construct a countable Boolean family F closed under these
transforms. Start with a compatible Polish topology and its countable base.
At each finite stage add the current topology's countable base, Boolean
operations and Vaught transforms of sets already added. Use native
`MeasurableSet.isClopenable` and countable Polish refinement to make the
added sets clopen with unchanged Borel structure; include a countable base
of this refinement at the next stage. Apply native `PolishSpace.iInf` to
the increasing sequence of refinements (Mathlib orders topologies in the
reverse of inclusion of open sets). Prove its topology equals that generated
by F: every stage base lies in F and every member of F is clopen at some
later stage. The initial Polish topology is the common coarser Hausdorff
topology required by `PolishSpace.iInf`. Use native
`MeasureTheory.borel_eq_borel_of_le` at each finer-Polish comparison.
This auxiliary topology is Polish and separates X;
its Boolean sets need not be open in the final topology and the action is not
asserted continuous for that auxiliary topology. For the distinct final
topology generated by its Vaught transforms, prove separation explicitly:
if x,y have identical transform memberships, the orbit preimages of each
A∈F agree modulo meagre sets, by the Baire property and countable open
basis of G. Outside the countable union of their meagre differences,
g•x and g•y agree on all separating A∈F, hence x=y. Prove regularity,
second countability, joint continuity and the strong-Choquet property. Own the separable metrizable
strong-Choquet criterion and the required winning-strategy construction if
no native supplier exists; the native Baire theorem does not imply that
criterion. Compare the two standard Borel structures by the measurable
identity bijection and Lusin–Souslin to obtain equality of sigma algebras.
Consume native `StandardBorelSpace`, compatible Polish refinement,
`MeasurableSet.isClopenable`, countable Polish refinement, Baire/meagre-set
and `MeasurableEquiv` APIs for their actual statements. This is the
[Becker–Kechris Theorem 1.1 and §4](https://arxiv.org/html/math/9304208)
proof route; completing the Vaught-family and strong-Choquet arguments is an
owned theorem obligation, not a consequence of refining a single measurable
map to a continuous map. These prerequisites belong here and create no new
Layer P or M2 supplier cycle.

For the resulting equivariant Borel isomorphism `f:X≃ᵐY`, transport every
normalized PVM by `E_Y(B)=E_X(f⁻¹(B))` on the same Hilbert carrier and keep
the same strongly continuous U. Prove countable SOT additivity, normalization,
`U_g E_Y(B) U_g⁻¹=E_Y(gB)`, and inverse transport. This gives an equivalence
of covariant-system categories, preserving intertwiners, unitary equivalence,
direct sums and reducing subspaces. For each nonzero sigma-finite
quasi-invariant measure μ on X, set `ν=f_*μ`; prove nonzeroness,
sigma-finiteness, equivalence-of-measures and quasi-invariance transport,
`g_*ν=f_*(g_*μ)`, and
`r_g^ν(y)=r_g^μ(f⁻¹(y))` almost everywhere for each g. A jointly Borel RN
version transports jointly by the same formula. The native L² composition
unitary `J:L²(X,μ;K)≃ₗᵢ[ℂ]L²(Y,ν;K)`,
`(JF)(y)=F(f⁻¹(y))`, transports the PVM, section/isotropy data when supplied,
and the single-RN-square-root induced action; prove equality on AE classes.
Changing an equivalent measure subsequently uses the existing density
intertwiner, not an extra modular factor. In a transitive application prove
the actual Borel identification with G/H and its closed stabilizer separately.
The general covariant system (a strongly continuous unitary representation together with a covariant projection-valued measure from OperatorTheory/SelfAdjointSpectralTheory) uses a jointly measurable native action and an arbitrary complete Hilbert space; it requires neither a topology on X nor Hilbert separability. Its continuous Polish and separable induction/disintegration specializations use the chosen realization. The `InducedModelData` inputs refer to this chosen continuous realization. Do not require the original Borel action to have been
continuous or claim preservation of an originally specified physical topology.
This transport supplies no smooth orbit quotient, type-I hypothesis,
Mackey exhaustion, or generic curved-spacetime classification by itself.

### M1.MeasuredTensor — measured subgroup, tensor and stages interfaces

Work with Hausdorff second-countable locally compact groups, closed subgroups and strongly continuous unitary representations on separable complex Hilbert spaces, including zero spaces. Use left cosets and `g_*μ(B)=μ(g⁻¹B)`. On a quotient `G/H` fix a nonzero σ-finite quasi-invariant measure in its quotient Haar class and a Borel section s. Put `k_s(g,x)=s(x)⁻¹gs(g⁻¹x)` and `r_g=d(g_*μ)/dμ`. Supply a jointly Borel positive finite version of r (almost everywhere for each fixed g), its cocycle identity and the induced action
```
(U_g F)(x) = r_g(x)^(1/2) σ(k_s(g,x)) F(g⁻¹x).
```

For the acceptance test, `InducedModelData` bundles the equivariant quotient
homeomorphism, nonzero sigma-finite quasi-invariant measure, measurable section
and strongly continuous isometric fibre representation. Its
`InducedModelData.isotropy` is k_s, `InducedModelData.rnDerivative` is the native
RN derivative r, and `InducedModelData.sectionAction` is the displayed formula.
The abbreviation `inducedHilbertSpace` is native `MeasureTheory.Lp K 2 μ`.
The theorem `InducedModelData.exists_inducedRepresentation` constructs the isometric strongly
continuous group action on this L² space with the displayed almost-everywhere
formula. Group inverses make these isometries onto, hence unitary.

- The quotient homeomorphism in the datum fixes the topology and the actual
  left cosets. The section is a measurable right inverse, and isotropy takes
  values in H with its section-change and cocycle laws.
- The RN derivative is taken from g_*μ relative to μ, not its inverse; its
  change-of-variables and cocycle identities are almost-everywhere identities.
- The section action descends to L² classes and preserves their norm; the
  theorem also supplies the group law and strong continuity. Zero fibre spaces
  are allowed, but μ=0 is excluded by the datum.

**Checks (the datum, isotropy, RN derivative, L² carrier and section action).**

- For H=G and a one-point quotient of mass 1, take s(*)=1: isotropy is g,
  r_g=1, L² is the fibre K, and the action is σ(g). In S₃, replacing the
  section by a=(12) changes the isotropy of g=(123) to a⁻¹ga=(132),
  so the section-change formula cannot omit the conjugation.
- For G=C₂, H={1}, K=ℂ and quotient atom masses (1,4), isotropy is 1,
  r_s=(4,1/4), L² has norm squared |F(0)|²+4|F(1)|², and
  U_s(F)=(2F(1),F(0)/2). The vector (1,0) has norm squared 1 both
  before and after action, whereas an inverse RN factor would give 16.
- For G=S₃, H=⟨(12)⟩, trivial fibre ℂ and counting measure on the
  three left cosets, the quotient has three points, r_g=1, L² has
  dimension 3 and the section action is the coset permutation. The zero
  fibre gives dimension 0 and the unique zero-space action; replacing the
  transitive quotient by a trivial three-point action violates equivariance.


Construct it from a continuous positive rho-function satisfying `ρ(gh)=Δ_H(h)Δ_G(h)⁻¹ρ(g)`, then transport to an equivalent measure. This is one RN square root, without a second modular multiplier. For `μ′=wμ`, `0<w<∞` almost everywhere, derive `r_g^{μ′}(x)=r_g^μ(x)w(g⁻¹x)/w(x)` and the unitary `L²(μ′)→L²(μ)`, `F↦w^{1/2}F`. For `s′=s b`, use `F(x)↦σ(b(x)⁻¹)F(x)`. Prove the representation law, unitarity, strong continuity and independence of these choices on AE classes. Every quotient integration identity is for nonnegative measurable or integrable functions.

For closed H,L≤G, let σ be such an H-representation. Assume the L-action on G/H is **regular measured**: on a conull invariant Borel domain X₀ there is a Borel surjection `q:X₀→Q` onto a standard Borel space whose fibers are exactly its L-orbits, with Borel representatives `g_qH` and Borel choices `g_q∈G`. Replace the quotient measure by an equivalent probability before pushing it forward to ν on Q. Define `L_q=L∩g_qHg_q⁻¹` and `σ_q(l)=σ(g_q⁻¹lg_q)`. Construct the measurable stabilizer, quotient-measure and induced-representation fields and the unitary
```
Res_L^G Ind_H^G σ ≃ ∫_Q^⊕ Ind_(L_q)^L σ_q dν(q).
```
Prove the conditional orbit measures lie in the quotient Haar class on `L/L_q` for ν-almost every q. A concrete proof first disintegrates the equivalent probability, then averages each conditional measure with one strictly positive L¹ Haar density on L. The averaged conditional is in the orbit Haar class; the averaged total is equivalent to the original measure with the same Q marginal. Equivalence/uniqueness of disintegrations gives the required class comparison. Do not infer an all-group common null set from separate fixed-g assertions, or push an infinite Haar measure to Q and assume the pushforward σ-finite.

For a continuous lcsc action on a Polish space with all orbits locally closed, supply the regular quotient above: closures of distinct orbits differ; saturations of a countable open basis give countably many invariant Borel sets separating classes. Prove the following selector lemma in this M1 interface: for a continuous Polish-group action and an invariant Borel subspace with countably separated orbit relation, there is a Borel transversal (Burgess); use its separating family, shrinking basis/tree construction and Borel membership induction. The unique-transversal-point relation then has a Borel selector, and Lusin–Souslin identifies its class code with a standard Borel quotient. When applying this to closed-coset/pair actions, lift representatives by the Borel selectors of the closed subgroup quotients. M1.BorelRealization supplies the continuous Polish model when the original action is only jointly Borel; it supplies no smooth orbit quotient by itself.

For closed H₁,H₂≤G and separable strongly continuous unitary σᵢ, assume the diagonal action on `(G/H₁)×(G/H₂)` has that regular measured quotient. Identify it with the measured double-coset parameter Q for `H₁\G/H₂`, with representatives `(H₁,g_qH₂)`. Push an equivalent probability in the product quotient Haar class to ν. Set `J_q=H₁∩g_qH₂g_q⁻¹` and `θ_q(j)=σ₁(j)⊗σ₂(g_q⁻¹jg_q)`. Prove
```
(Ind_(H₁)^G σ₁) ⊗̂ (Ind_(H₂)^G σ₂) ≃ ∫_Q^⊕ Ind_(J_q)^G θ_q dν(q),
```
for the diagonal G-action. Construct the exterior-tensor/induction unitary for G×G, and apply the preceding restriction theorem to its closed diagonal. On L² models the exterior unitary sends `F⊗G` to `(x,y)↦F(x)⊗G(y)`; prove isometry by scalar Fubini and dense range by rectangle/simple-section density on the σ-finite product spaces. It is a completed Hilbert tensor, not merely an algebraic tensor and not an irreducibility assertion. Construct the transported systems of imprimitivity, associativity and naturality on bounded intertwiners. Atomic quotient classes give actual direct sums with the atom weights/densities; general classes give Hilbert direct integrals. These subgroup/tensor decompositions need no type-I hypothesis.

For the closed-subgroup fields occurring here, construct the parameterized Haar/quotient data rather than make independent choices at each q. Reuse native `ClosedSubgroup G`; construct its standard Borel closed-set coding for lcsc G and the required countable Borel dense subgroup sections and normalize each Haar measure by its integral against one fixed nonnegative compactly supported function positive at the identity. Prove this Haar field Borel by countable compact-support integral tests, the Borel graph of invariance and uniqueness of the normalization; dense subgroup sections promote the countable invariance tests to the full subgroup. Supply Borel coset selectors, modular ratios and rho-functions on the resulting subgroup bundles. Restricted countable compact-support vector sections give measurable Gram matrices and dense induced fundamental sections. Prove the induction-in-stages unitaries below jointly measurable by their coefficient/norm tests on these sections, including when the closed subgroups vary as J_q and K_q. The variable-subgroup field construction is owned here; the fixed-subgroup theorem alone does not imply it.

For closed J≤K≤G prove induction in stages `Ind_K^G(Ind_J^Kσ)≃Ind_J^Gσ`, with the unitary quotient/bundle identifications and this same single-RN normalization, consuming OperatorAlgebraDynamics D3's induction in stages and HilbertModules H3's induction in steps through interior tensor products. For fixed closed H≤G and a measurable field of separable H-representations `σ_t` over a standard Borel σ-finite base, construct the induced field and `Ind_H^G(∫⊕σ_t)≃∫⊕Ind_H^Gσ_t`. Supply the jointly measurable coefficient fields and the field-Fubini unitary on fundamental sections, norm identity, onto property and naturality; this is not an assumption that independent pointwise choices form a measurable field. VNA V4's actual measurable-field/decomposable-map clauses supply their generic carriers, and native finite-measure `Measure.condKernel` supplies scalar disintegration after equivalent-probability replacement. The measurable orbit/induction comparisons remain M1-owned. Generic finite/algebraic Mackey subgroup APIs supply subgroup/intersection identities only, not these lcsc Hilbert direct-integral theorems.

#### Subgroup, tensor and direct-integral construction details

Own the measurable Mackey subgroup theorem here, before its M4 and M6
applications. Let H and L be closed subgroups of a second-countable locally
compact G, and let σ be a strongly continuous unitary H-representation on a
separable Hilbert space. Give G/H its quotient Haar measure class. Assume the
L-orbit relation on G/H is regular in the following explicit measured sense:
a conull invariant Borel subset admits a Borel map to a standard Borel Q whose
fibers are the L-orbits, and a Borel choice of orbit representatives `g_q H`.
Choose a probability measure equivalent to the quotient Haar class before
pushing to Q; its pushforward ν is the quotient measure class used below.
Disintegrate over Q, construct the measurable field of closed stabilizers
`L_q=L∩g_q H g_q⁻¹`, and prove that the conditional orbit measures belong to
the quotient Haar class on `L/L_q` almost everywhere. Construct the measurable
field of inducing representations `σ_q(l)=σ(g_q⁻¹ l g_q)` and prove

```
Res_L^G Ind_H^G σ ≃ ∫_Q^⊕ Ind_(L_q)^L σ_q dν(q).
```

The equivalence is a unitary intertwiner, including the corresponding
systems of imprimitivity. Construct it on compactly supported/measurable
sections, prove its norm identity and density, and extend to the completed
Hilbert spaces. Every induced model uses M1's single square-root RN factor;
all changes of conditional measure, quotient representative and Borel section
are transported by the already specified unitary changes of model. Do not
push an infinite Haar measure to Q and silently assume that pushforward is
σ-finite. Prove that replacing the equivalent probability does not change
ν's measure class or the resulting representation. No type-I hypothesis is
needed for this decomposition into induced representations. The separate irreducible refinement is owned by M2.InducedRefinement.

For closed H₁,H₂≤G and separable strongly continuous unitary σᵢ of Hᵢ,
prove the measurable tensor-product theorem. Assume the diagonal G-action on
`(G/H₁)×(G/H₂)` has the same regular measured quotient, identified with
`H₁\G/H₂` by the representative pair `(H₁,g_q H₂)`; define ν by pushing an
equivalent probability in the product quotient Haar class. Put
`J_q=H₁∩g_q H₂g_q⁻¹` and
`θ_q(j)=σ₁(j)⊗σ₂(g_q⁻¹jg_q)`. Prove

```
(Ind_(H₁)^G σ₁) ⊗ (Ind_(H₂)^G σ₂)
  ≃ ∫_Q^⊕ Ind_(J_q)^G θ_q dν(q),
```

where the action on the left is the diagonal action. Derive it by the
subgroup theorem for the diagonal in G×G and the exterior tensor/induction
unitary, not by identifying a diagonal tensor product with an irreducible
exterior product. Construct those comparison unitaries, their associativity
and their naturality on bounded intertwiners. Consume D3 induction in stages
(HilbertModules H3 for its interior-tensor form) and V4.0.Fields measurable Hilbert fields; this milestone owns the measurable
double-coset disintegration and subgroup theorem, which those suppliers do
not assert. Countable atomic quotient measures give direct sums with their
actual atom multiplicities; they are not the general conclusion. The
reference is Mackey, *Induced Representations of Locally Compact Groups I*,
[Ann. Math.55 (1952),101–139](https://doi.org/10.2307/1969423), subgroup and
tensor-product theorems; the displayed conventions fix the version required
here.

### Induction and measurable direct integrals

For a fixed closed H≤G in M1’s lcsc scope, a standard-Borel parameter space
(T,ν) with σ-finite measure, and a measurable field of separable strongly
continuous unitary H-representations σ_t on K_t, construct the induced
measurable field and prove
`Ind_H^G(∫_T^⊕σ_t dν) ≃ ∫_T^⊕Ind_H^Gσ_t dν`.
Use one nonzero quasi-invariant quotient measure on G/H and M1’s single
RN-square-root model on both sides. Prove the jointly measurable operator
fields and the Fubini unitary
`L²(G/H;∫_T^⊕K_t)≃∫_T^⊕L²(G/H;K_t)` on measurable fundamental sections,
its norm identity, dense range and intertwining. Prove naturality under
measurable unitary fields and equivalent parameter/quotient measures.
Own this induction/direct-integral comparison before M6 reorders induced
spectral fields; V4.0.Fields supplies the generic measurable Hilbert fields; the displayed Fubini unitary and its norm/density comparison are constructed here from scalar Tonelli/Fubini.

### Finite quotient spaces and almost-conjugate deck subgroups

Let `G` be a second-countable unimodular locally compact group and let `Γ ◁ Γ₀ ≤ G` be
lattices with finite quotient `Q=Γ₀/Γ`. For `H≤Q`, write `Γ_H` for its inverse image in `Γ₀`.
Give `Γ\G` its right-regular `G`-action and its finite left deck action by `Q`; these actions
commute. Use the quotient measures induced by one fixed Haar measure on `G`. Prove that left
translation by `Γ₀` preserves the quotient measure, using normalization of `Γ` and unimodularity
of `G`. The deck representation on functions is `(q·f)(Γx)=f(q⁻¹·Γx)`; prove it is unitary
and commutes with the right-regular `G` representation. For the finite
cover `p_H:Γ\G→Γ_H\G`, prove the measure formula
`∫_(Γ\G) f∘p_H = |H| ∫_(Γ_H\G) f`, and the normalized pullback
`J_H f=|H|^(−1/2) f∘p_H` is a unitary from `L²(Γ_H\G)` onto
`L²(Γ\G)^H`. Prove it intertwines the right-regular `G` actions. Establish the formula first for
compactly supported functions and then extend by density; identify the quotient measure
normalization explicitly so no invariant-measure assumption is smuggled in. Inversion converts
these right-quotient conventions to the `G/Γ` convention used by the general induced model.

For almost-conjugate subgroups `H₁,H₂≤Q`, consume
InductionRestriction Layer 2.1,
`Gassmann.almostConjugate_iff_permutation_equiv`, to identify almost-conjugacy with isomorphism
of the complex permutation representations `ℂ[Q/H₁]` and `ℂ[Q/H₂]` as `Q`-modules.
Equip each permutation module with the ℓ² inner product for which its coset basis is
orthonormal, transported to `EuclideanSpace ℂ (Q ⧸ H)`; prove the left-coset action is unitary.
For the resulting equivariant linear isomorphism `T`, prove `T*T` commutes with `Q`, and
unitarize it by `U=T(T*T)^(−1/2)`. Prove the inverse square root exists and commutes with `Q`,
so `U` is an equivariant unitary between these specified permutation Hilbert spaces. For every
unitary representation of finite `Q` on a Hilbert space `V`, construct a unitary
`V^H₁≃V^H₂` from this permutation-module intertwiner. Consume IR's underlying linear
Hom/invariants equivalence through `Rep.indResAdjunction` and `TauCeti.indTrivialIso`, and
prove its isometric normalization here: identify `V^H` with
`Hom_Q(ℂ[Q/H],V)` with Hilbert–Schmidt inner product
`⟨φ,ψ⟩_HS=Σ_(c∈Q/H)⟨φ(δ_c),ψ(δ_c)⟩`. Send `v∈V^H` to the equivariant
map `δ_(qH)↦[Q:H]^(−1/2)q·v`; the inverse is `[Q:H]^(1/2)` times evaluation at the identity
coset. Prove these are inverse isometries, and use precomposition with the inverse of the
unitarized permutation intertwiner to obtain the unitary between the two Hom spaces.
Prove that this unitary `W:V^H₁→V^H₂` commutes with the restrictions of every bounded
operator on `V` commuting with `Q`. In particular it sends each isotypic component
`V_π^H₁` onto `V_π^H₂`, where `V_π^H=range(P_π)∩V^H`, by commuting with the central character projection
`P_π=(dim π/|Q|)Σ_q conjugate(χ_π(q))·q`. Apply this to `V=L²(Γ\G)` and export the composite
`J_H₂⁻¹ ∘ W ∘ J_H₁ : L²(Γ_H₁\G)→L²(Γ_H₂\G)` as a unitary intertwining the two
right-regular `G` representations. This is the generic finite-index lattice-quotient adapter consumed by
FuchsianOrbifolds L9. It proves neither scalar Laplace isospectrality nor any spectral theorem.

For projective data, define normalized Borel multipliers `ω:G×G→𝕋`, twisted unitary representations, central extensions, Borel sections and their cocycles. Verify the section-change formula by direct substitution in the cocycle definition, and prove its induced-model fiberwise intertwiner as above; consume Layer P.3's locally continuous extension comparison where that extra topology is present. Use the central extension `E_ω=𝕋×_ωG` with `(z,g)(w,h)=(zwω(g,h),gh)`, so its canonical lifts obey `U_gU_h=ω(g,h)U_{gh}`. Lift H to `E_ω`, induce the genuine representation with central character z ↦ z on the extension using the same single RN square root, then descend the selected Borel lifts; prove the resulting system is ω-projective in exactly that direction. Establish the twisted imprimitivity theorem with explicit multiplier restriction/transport on H; distinguish a genuine representation of the central extension from an `ω`-representation. Own the Mackey–Weil converse for a normalized Borel circle cocycle on a
second-countable locally compact group: construct the central standard-Borel
group, its invariant measure and the locally compact second-countable group
topology with that Borel structure, and prove uniqueness and the continuous
kernel/projection comparisons. Supply the measurable-group reconstruction
lemma, rather than assert that the product topology makes a merely Borel
cocycle continuous. Prove its comparison with the locally sectioned extension
construction whenever that additional hypothesis holds.

For a continuous open surjective homomorphism q:E→G of Polish groups with
closed central kernel𝕋, prove existence of a normalized Borel section: the
closed fibers form a Borel closed-valued multifunction because q is open;
prove its Borel selection using countable nested balls in a complete compatible
metric. Supply this selection lemma here if the consumed uniformization API
only provides a universally measurable selector. Define the section multiplier
and prove its Borel cocycle and phase-change laws. If the extension has local
continuous sections, compare its Borel cocycle with Layer P.3's locally continuous
extension convention. A global continuous section exists exactly when this
principal circle bundle is trivial; prove the section/trivialization comparison.
A genuine continuous representation lift further requires triviality of its
multiplier class. Never infer either lift merely from a trivial-looking Lie
algebra cocycle.

### Borel multipliers and locally continuous extension cocycles

For every normalized Borel circle multiplier ω on a second-countable
locally compact group L, own its comparison with Layer P.3's H²_lc convention.
Fix a left Haar measure and construct the twisted regular representation
on the separable Hilbert space H=L²(L):

```
(λ_g^ω f)(x)=ω(g,g⁻¹x)f(g⁻¹x).
```

Prove unitarity and `λ_g^ω λ_h^ω=ω(g,h)λ_(gh)^ω` from left invariance
and the cocycle law. Prove that g↦λ_g^ω is strong-Borel: use countable
dense vectors, Borel representatives, joint measurability of the displayed
formula and measurability of its scalar matrix-coefficient integrals.
Consequently its projective map L→PU(H) is a Borel homomorphism and is
continuous by Layer P.2's Pettis theorem. Consume Layer P.2's local
continuous section of U(H)_s→PU(H) to obtain a lift v_g continuous on
an identity neighborhood and normalized by v_1=Id; outside that
neighborhood use the Borel lift λ_g^ω. This gives a global Borel lift.
For a unit vector ξ define the Borel phase b by

```
v_g=b(g)λ_g^ω,
b(g)=⟨λ_g^ω ξ,v_g ξ⟩,
ω′(g,h)=b(g)b(h)b(gh)⁻¹ω(g,h).
```

Prove ω′ is continuous near (1,1), after shrinking the neighborhood
so g,h,gh lie in the continuous chart. Verify the full Layer P.3 convention:
for each fixed g the ratio
`ω′(g,h)/ω′(ghg⁻¹,g)` is continuous for h near1. It is the phase
in `v_g v_h v_g⁻¹=ratio·v_(ghg⁻¹)`, so continuity follows by keeping
h and ghg⁻¹ in the identity chart. Thus every Borel multiplier is
Borel-cohomologous to an explicitly locally continuous cocycle, with
its conjugation-continuity condition. No continuity of the original
Borel phase b is asserted. Apply Layer P.4's smoothing and locally smooth
extension theory only after this comparison. Prove the corresponding
Borel group isomorphism with the pullback extension of the continuous
projective map is topological by Layer P.2's Pettis theorem.

Prove the generic perfect-character lemma: if L is a connected
finite-dimensional Lie group with perfect Lie algebra, every Borel
character L→𝕋 is trivial. Layer P.2 gives continuity; LieGroups Layer2
gives automatic smoothness, and Layer3 gives faithfulness on connected groups. Its derivative
vanishes on all commutators and hence on the perfect Lie algebra, so the
character is1. M4 applies this lemma only after constructing its connected
group and proving perfectness; no M4 example is an M1 prerequisite.

### Graded projective imprimitivity and finite-index Clifford theory

Let G be second-countable locally compact Hausdorff, with a continuous
grading `ε:G→ℤ/2`. Write `s(g)=(-1)^ε(g)` and let `z^s` mean z for s=1,
complex conjugation for s=−1. A normalized Borel graded multiplier obeys

```
ω(g,h)ω(gh,k) = ω(h,k)^s(g) ω(g,hk),
ω(1,g)=ω(g,1)=1.
```

A lifted operator U_g is unitary for ε(g)=0 and antiunitary for ε(g)=1,
with `U_gU_h=ω(g,h)U_(gh)`. A Borel phase change has coboundary
`δ_εb(g,h)=b(g)b(h)^s(g)b(gh)⁻¹`. Distinguish a fixed-multiplier
representation up to complex-linear unitary intertwining from its
projective ray homomorphism, and state explicitly when a further phase
change is part of an equivalence. A character can change a fixed-lift
parity label without changing the ray map; those are different categories.

Construct the graded circle extension

```
E_(ε,ω)=𝕋×G,
(z,g)(w,h)=(z w^s(g) ω(g,h),gh).
```

The circle is central in the even subgroup; an odd lift conjugates it.
It is not a central extension of the whole graded group. Prove the
Borel/lcsc reconstruction and local-section comparisons, using the
graded product Haar measure and M1's measurable-group reconstruction.
Representations of this extension with phase action z↦zId correspond
to the stated graded multiplier representations. Prove automatic
continuity of the Borel projective UA homomorphism and of the genuine
extension representation under the lcsc/separable hypotheses; do not
require a globally continuous operator lift on G.

For H closed in G and X=G/H, define a graded system of imprimitivity
(U,P) with normalized PVM P and covariance
`U_g P(B) U_g⁻¹=P(gB)`. Morphisms are bounded complex-linear
intertwiners of both U and P; reducing subspaces are closed complex
subspaces invariant under all these operators. Prove the graded
imprimitivity equivalence with the ε|H-graded representations of H
with multiplier `ω|_(H×H)`, using quasi-invariant measure class
and the single square-root RN factor from M1. Include irreducibility of the system, direct sums,
change of measure, section and cocycle representatives, induction in
stages, and the comparison with the ordinary theorem when ε=0.

One concrete carrier is the associated bundle for the inverse image
of H in E_(ε,ω), induced from a genuine graded representation τ with
circle character z↦z. Its identifications are
`[gh,v]=[g,τ(h)v]`. Regard it as a complex Hilbert bundle by

```
λ[g,v]=[g,λ^s(g)v],
⟨[g,v],[g,w]⟩=⟨v,w⟩^s(g).
```

Prove these formulas are independent of the representative. Left
translation is ε-graded on the fibers; combined with the RN factor
it gives the graded operators on square-integrable sections. This
construction accounts for conjugate Hilbert fibers whenever an odd
coset representative is used; do not tensor semilinear maps as if
one were complex-linear.

When ε is nonzero, write G⁺=kerε. Prove the exhaustive two cases:
`H∩(G∖G⁺)≠∅` iff `G=G⁺H` iff G⁺ acts transitively on X. In this
case a Borel selector can be chosen in G⁺ and the fiber isotropy map
has the same grade as g. If H⊆G⁺, X has exactly two G⁺-orbits; the
induced Hilbert space has the corresponding two summands and odd
operators exchange them, with the conjugate-fiber convention just
specified. The condition “G⁺ not transitive and H contains an odd
element” is impossible for X=G/H.

Own the graded Schur theorem for this equivalence convention. For a
graded representation U on a nonzero complex Hilbert space let D be the
norm-closed real *-algebra of bounded complex-linear operators commuting with every U_g. Prove that a closed
complex invariant subspace is reducing, so irreducibility is equivalent
to D having only the orthogonal projections0,1. Conjugation by an
antiunitary preserves adjoints and real Borel functional calculus;
therefore every self-adjoint element of D is a real scalar in the
irreducible case. For T≠0 in D, deduce
`T*T=TT*=‖T‖²Id`, so D is a real C*-division algebra. Prove the
trichotomy D≃ℝ,ℂ orℍ as real *-algebras. An elementary proof uses
skew-adjoint I,J: their anticommutator is a real scalar and defines
the inner product on the skew-adjoint subspace. Two orthogonal unit
skew elements generate I,J,IJ, a quaternionic triple. An element
orthogonal to all three would anticommute with I,J,IJ, but anticommuting
with I and J forces it to commute with IJ, so it is zero. The
skew-adjoint dimension is therefore0,1 or3, yielding ℝ,ℂ orℍ.

Compute all three commutants on the finite models. A real structure
on ℂ has commutant ℝ; the quaternionic structure on ℂ² has
commutant ℍ. For `W_A=diag(1,−1)` and
`W_B=[[0,d],[1,0]]◦complexConjugation`, d=±1, the commutant is
`{diag(a,conj a):a∈ℂ}≃ℂ` as a real algebra. In particular
`diag(i,−i)` is a nonscalar complex-linear self-intertwiner of this
irreducible graded model. Do not identify graded irreducibility with
a real-scalar commutant. The ordinary complex Schur lemma applies
to an underlying unitary irreducible π, which is a different assertion.

Also own the finite-index graded Clifford theorem needed by M4.
Let L be any second-countable locally compact type-I group and let
F be finite, acting continuously by automorphisms α. Representations
act on separable complex Hilbert spaces. Give L⋊F the grading ε
pulled back from F and a fixed multiplier ω inflated from F. On
the set of unitary irreducible equivalence classes of L use

```
f·[π]=[conjugate^ε(f)(π∘α_(f⁻¹))].
```

For an orbit representative π let F_π be its stabilizer. Choose
ε(f)-semilinear isometries V_f, f∈F_π, with
`V_f π(l) V_f⁻¹=π(α_f(l))`, and define κ_π by
`V_f V_h=κ_π(f,h)V_(fh)`. Ordinary complex Schur for π proves
these products are scalar, and associativity gives the graded cocycle
law. For every irreducible ε|F_π-graded multiplier representation W
of F_π with multiplier `ω|F_π/κ_π`, construct

```
(l,f) ↦ (π(l)V_f) ⊗ W_f
```

on H_π⊗M_W, then use finite graded induction to L⋊F. Both tensor
maps have the same grade, so this tensor is balanced over ℂ and
has that grade. Prove irreducibility and equivalence exactly by
orbit transport and equivalence of the transported finite data.
Changing V_f rephases the compensating W. Prove the finite
multiplicity classification with its actual squares and commutants.
For a nonzero multiplicity vector, the complex span of its finite
F_π orbit is invariant even under anti-linear operators; irreducibility
therefore makes M_W finite-dimensional. These are graded multiplier
representations rather than an ordinary-character classification.

Prove pointwise exhaustion directly through the finite center,
without a measurable-unitary-dual hypothesis. For an irreducible
full graded U write `M=U(L)″` and `Z=center(M)`. Conjugation by
U_f acts genuinely on Z, even when it is conjugate-linear on
complex scalars. It preserves the real self-adjoint part and all
projections. An invariant central projection commutes with U and
is0 or1. Real spectral calculus then makes every invariant
self-adjoint central element a real scalar. For a nonzero central
projection p let

```
E(p)=|F|⁻¹ Σ_(f∈F) U_f p U_f⁻¹ = λ_p Id.
```

Positivity and the identity summand give `p≤|F|E(p)`, hence
`λ_p≥1/|F|`. An orthogonal family of nonzero central projections
therefore has at most |F| members. Prove Z is a finite atomic
commutative von Neumann algebra, with at most |F| minimal projections;
F acts transitively on them since an orbit sum is an invariant
projection. Each central block of U|L is a factor representation.
The type-I hypothesis and
[VonNeumannAlgebras V3](../VonNeumannAlgebras/README.md#v3-type-i-and-finite-dimensional-algebras)
give its spatial form `π(l)⊗Id` on H_π⊗M_π with π an ordinary
irreducible. Construct π from that spatial form, including its
strong continuity, rather than invoke a disintegration over the dual.

Show that distinct minimal central blocks have inequivalent π labels:
an equivalence would give a nonzero off-diagonal L-intertwiner,
contradicting centrality of the block projections in U(L)″. Thus
F permutes exactly one orbit of distinct connected labels and its
block stabilizer is F_π. On one block, extract the same-grade finite
multiplicity operators W_f from U_f and V_f by the spatial commutant
identity `(π(L)⊗1)′=1⊗B(M_π)`. Also prove its rectangular form
`Hom_L(π⊗1_(M₁),π⊗1_(M₂))=1⊗B(M₁,M₂)` for distinct
multiplicity spaces, by embedding an intertwiner as an off-diagonal block
in the commutant on `H_π⊗(M₁⊕M₂)`. Use this form in both grades.
In the odd case first pass through
`conjugate(H_π)⊗conjugate(M_π)` so the comparison is complex-linear;
never form the unbalanced tensor of one anti-linear and one linear
map. The full stabilizer commutant is `1⊗D_W`; its projection
criterion proves the required irreducibility equivalence. Finite
induction recovers U and proves exhaustion for every L in the
stated generality. No Glimm theorem or generic standard-Borel dual
is presumed in this pointwise theorem.

For measurable M4 families, construct the standard Borel parameter
space directly from its explicit normalized connected labels, their
stated Weyl/endpoint identifications and its concrete induced models.
Prove the F action and the model intertwiners are Borel on that
parameter space. Use a Borel lexicographic order on its countable
union of finite real/discrete coordinate charts to select the least
member of each finite F orbit. The least-representative subset is
Borel and standard, and the resulting quotient map is Borel with
exactly the finite orbits as fibers. Construct the corresponding
measurable Hilbert fields by explicit countable fundamental sections.
This is the M4-specific measurable comparison, separate from the
pointwise finite-center exhaustion. M4 proves the model's type-I
hypothesis by M2 before applying the general theorem.

### Examples

For H=G the quotient is a point, k_s(g,*)=g for s(*)=1 and r_g=1, so induction returns σ. For H={1} and left Haar measure, k_s=1 and r_g=1, giving left translation on L²(G).

### Dependencies

P.1–P.3; Layer 0; OperatorAlgebraDynamics D1/D3; HilbertModules H3; VonNeumannAlgebras V3 and V4.0.Fields. M1.MeasuredTensor precedes M2.InducedRefinement; no type-I hypothesis is added to the intermediate induced decomposition.

## Layer 5: M2 — Regular Mackey machine

Let `G=N⋊H` be second-countable locally compact with N locally compact abelian. Use native Mathlib `PontryaginDual N` with its compact-open topology and circle-valued character carrier. Pin the dual action `h·χ(n)=χ(h⁻¹·n)` and the V11 Fourier/Pontryagin conventions. For the regular-action theorem assume a standard Borel orbit space Q, a Borel quotient map `q:N̂→Q` whose fibers are precisely the H-orbits, and a Borel section `s:Q→N̂` with `q∘s=id`. These are explicit hypotheses; in every model application prove them from its orbit parameters and chosen representatives. Prove that this smooth quotient implies regular embedding in Mackey's measure-class sense and that every ergodic invariant measure class is concentrated on one orbit. For irreducible exhaustion require `G` and all stabilizers second-countable locally compact and `N̂` standard Borel; prove the normal subgroup's metric-smooth/type-I hypotheses using its abelian character dual. The split untwisted classification uses ordinary little-group representations. For a specified global twist, using this character dual requires an explicit coboundary trivialization of its restriction to N; give its extension and little-group obstruction data. If that restriction is nontrivial, instead construct the actual projective normal-subgroup dual and establish its metric-smooth/type-I and regular-embedding hypotheses before applying the twisted theorem; ordinary characters are not its representation labels. Prove exhaustion under these regularity hypotheses, without a type-I requirement on little groups. Separately prove Mackey's sufficient type-I criterion under the regular-action/smooth-quotient hypotheses stated above, including standard-Borel N̂ and the regular embedding. In the untwisted case, if each stabilizer algebra is type I then G is type I. For a specified `ω`, prove the mandatory fixed-central-weight criterion M2.FixedTwistTypeI below for `C*(G,ω)`; do not replace its hypotheses by type I of the whole extension `E_ω`. State any all-central-weights conclusion separately: type I of one fiber `C*(G,ω)` alone does not show the whole extension group is type I. Do not apply this implication outside those hypotheses. Use M1's factor-representation definition of type I and its comparison with VNA V3's spatial type-I carrier. Consume the GCR-to-factor-type-I direction of TypeIComparison for separable group C*-algebras; M0's CCR hypothesis implies GCR. This is the implication consumed from M0's CCR result; HilbertModules H3's irreducible-image convention and VNA's factor carrier are compared in this direction. A converse is not used to prove the little-group hypotheses. Use type I where required by direct-integral disintegration and uniqueness in M6 and by the product theorem below. Mackey1958 Theorems8.1,8.4,9.1 and9.3 supply the proof route with these distinct hypotheses. For each χ construct the closed stabilizer `Hχ`. In the ordinary split semidirect product, χ extends genuinely to `N⋊Hχ` by `χ̃(n,h)=χ(n)`, because every h in Hχ fixes χ; prove the extension law explicitly. Thus the little-group datum for genuine representations is an ordinary genuine unitary representation of Hχ and its multiplier is trivial (up to the chosen coboundary). Do not assign arbitrary projective data here. Reserve nontrivial multipliers for a separately specified global twist/central extension or genuinely nonsplit extension, and give its cocycle, section, and restriction/transport data.

**M2.FixedTwistTypeI — the regular Mackey criterion at one central weight.** Fix a normalized Borel multiplier `ω` on the lcsc second-countable `G=N⋊H` above and construct its Mackey–Weil lcsc circle extension `p:E_ω→G` by M1. Use the convention `(z,g)(w,h)=(zwω(g,h),gh)` and the weight-one sector, in which the central `z` acts as `z·1`; its C*-algebra is `C*(G,ω)`. Put `M=p⁻¹(N)`, a closed normal subgroup. Construct the actual normal-subgroup projective dual `X=ĤM_1`: unitary-equivalence classes of irreducible strongly continuous representations `ρ` of M with `ρ(z)=z·1`, equivalently the irreducible `ω|_(N×N)`-projective representations of N via the Borel coordinate lift. Assume the weight-one ideal `J_1(M)` of `C*(M)` is type I, and supply its metric-smooth standard-Borel dual and a Borel field of concrete separable irreducible models with separating measurable matrix coefficients. These are explicit normal-subgroup hypotheses; do not infer them from commutativity of N when its restricted multiplier is nontrivial. No condition on the other central weights of M is imposed.

Construct the jointly Borel conjugation action of `E_ω` on X, prove that it factors through H, and use this actual transported projective-dual action. Require a Borel quotient `q:X→Q` onto a standard-Borel Q, with precisely the H-orbits as fibers, and a Borel representative section. Prove the regular embedding in the measure-class form used by the factor-imprimitivity argument: every ergodic invariant measure class on X is concentrated on one orbit. Require each stabilizer `H_ρ≤H` to be closed (hence lcsc second-countable), the stabilizer subgroup/quotient data to be Borel, and Borel sections for `E_ρ→E_ρ/M≅H_ρ`, where `E_ρ` is the inverse image of `H_ρ` in E; write `p_ρ:E_ρ→H_ρ` for this quotient map. Construct the Borel stabilizer intertwiners on the concrete ρ-models rather than presupposing a genuine extension. Their projective extension `V_ρ` satisfies `V_ρ|_M=ρ` and `V_ρ(e)V_ρ(f)=α_ρ(ē,f̄)V_ρ(ef)`, with `α_ρ` a normalized Borel circle multiplier on `H_ρ`. Prove this descent and its independence, up to coboundary and unitary/orbit transport, from the section and intertwiner choices. The relevant little algebra is therefore `C*(H_ρ,α_ρ⁻¹)`: an `α_ρ⁻¹`-projective τ makes `V_ρ⊗(τ∘p_ρ)` genuine on `E_ρ`. Require that algebra to be type I for every orbit representative; equivalently for every ρ after proving the transport comparison. Use M1's topology on its cocycle extension, so Borel coordinate lifts are not asserted globally continuous.

Under exactly these fixed-weight hypotheses, prove that `C*(G,ω)` is type I in M1/VNA's factor sense: every nondegenerate factor representation generates a spatial type-I von Neumann factor, including the arbitrary-H convention via the separable cyclic reduction and amplification comparison. Own the factor version of regular Mackey imprimitivity, not merely irreducible exhaustion: decompose restriction to `J_1(M)` into the concrete ρ-models; factor centrality makes the orbit-quotient spectral algebra scalar, so regularity concentrates the measure class on one orbit; identify its system of imprimitivity and multiplicity commutant with induction of `V_ρ⊗τ`. Prove the resulting factor/type comparison with the relevant twisted little algebra, including the induced multiplicity amplification. Its type-I hypothesis then forces the original factor type I. Prove quasi-invariant measures, RN unitaries, measurable fundamental sections and independence of those choices using M1's existing induction interfaces; do not infer this factor conclusion solely from a list of irreducibles. If `ω|_(N×N)=δb`, explicitly trivialize it, identify `ρ((z,n))=zb(n)χ(n)` with ordinary characters, and compute the transported H-action and stabilizer obstruction, including cross-cocycle terms. It agrees with the usual inverse-pullback character action only after proving that additional comparison; a trivial restriction alone does not remove a possible affine cross term. This recovers the untwisted split criterion with trivial obstruction, without imposing untwisted character labels in the general fixed-twist theorem.

Separately, prove the all-central-weights criterion: if the analogous normal-projective regularity and twisted-little-algebra hypotheses hold at every integer weight k, then `E_ω` is type I. Prove `C*(E_ω)≅⊕_(k∈ℤ)^{c₀}J_k(E_ω)` using the compact central circle and its spectral projections, with `J_k(E_ω)≅C*(G,ω^k)` in the displayed multiplication convention; type I is equivalent to type I of every summand. No all-k assumption enters M2.FixedTwistTypeI. Prove its genuinely twisted fixed-central-character product analogue consumed by the product adapter below; that adapter's whole-extension sufficient branch remains available and is not a substitute for the fixed-twist Mackey criterion.

Under the stated regular-action hypotheses, prove that induction of `χ̃⊗τ` from `N⋊Hχ` to `N⋊H` is irreducible, that equivalence is exactly orbit transport plus equivalence of the transported genuine τ: for χ₂=h·χ₁, prove `Hχ₂=hHχ₁h⁻¹` and define `τ₁^h(k)=τ₁(h⁻¹kh)` on Hχ₂, then state the unitary intertwiner condition with τ₂, and that these exhaust irreducibles. Prove the exact regularity, separability and Borel-section hypotheses in each application; establish type I separately for the uses that require it. The irreducible regular Mackey classification above does not require G or
its little groups to be type I. Product decomposition and unique direct-integral
claims retain their stated type-I hypotheses; the orbit classification retains
its smooth quotient and Borel-section hypotheses. Prove the tensor-product theorem for irreducibles of `G₁×G₂` when both factors are second-countable and at least one is type I, for irreducible strongly continuous unitary representations on separable Hilbert spaces; prove the exterior tensor product is irreducible and every irreducible of the product is such a product. Explain that type-I disintegration is used for the converse, and do not claim the result for two non-type-I factors.

Also own the GCR orbit criterion before the model applications: under the
regular-action/Borel hypotheses above, assume every momentum orbit locally
closed and each little-group irreducible integrated image contains a nonzero
compact operator. Prove the induced irreducible image contains nonzero
compacts, using D1's invariant-ideal/subquotient exactness and D3's Green
imprimitivity on each orbit layer, with explicit compact operators from
localized slices and the little-group compact operators. Prove transport to
the ambient crossed product. Export this criterion for recursive application
to little groups as well as to M5's Poincaré fiber; no later-milestone
construction is required to prove it.

For product groups, extend the genuine tensor-product theorem to projective data only by an explicit cochain comparison. Define the cross-multiplier obstruction to be the class of `ω` in Moore’s normalized Borel cohomology `H²_Bor(G₁×G₂,𝕋)` modulo the image of the two factor-inflation maps; the adapter applies exactly when this class has a factorwise-product representative (equivalently, when the displayed cochain `b` exists). With `U_gU_h=ω(g,h)U_{gh}` and normalized factors `ω₁,ω₂`, assume a normalized Borel `b:G₁×G₂→𝕋` satisfies `ω(g,h)=δb(g,h)ω₁(g₁,h₁)ω₂(g₂,h₂)`, where `δb(g,h)=b(g)b(h)b(gh)⁻¹`. Rephase `U_g` to `b(g)⁻¹U_g`; its multiplier is then the factorwise product. Realize each twisted representation as a genuine representation of its central extension `E_{ωᵢ}`, and the product representation on `E_{ω₁}×E_{ω₂}` with central character `(z₁,z₂)↦z₁z₂`. Take each `ωᵢ` to be a normalized Borel multiplier and give `E_{ωᵢ}` the unique lcsc topology with its specified standard-Borel group structure supplied by M1's Mackey–Weil reconstruction. Require the genuine extension representations to be strongly continuous on separable Hilbert spaces. The set-theoretic coordinate lift `g↦(1,g)` and its operator-valued realization are only Borel in general; their global continuity is not a hypothesis. When local continuous sections exist, prove the comparison with Layer P.3's locally continuous convention. Identify `(E_(ω₁)×E_(ω₂))/{(z,z⁻¹):z∈𝕋}` with `E_(ω₁⊠ω₂)` as topological groups, using the explicit Borel group map, quotient Borel structure and uniqueness of the Mackey–Weil lcsc topology. The cochain `b` defines a Borel group isomorphism between the two cocycle extensions; prove it is a topological isomorphism by Layer P.2's Pettis theorem for Borel homomorphisms between lcsc groups, and transport continuity through that isomorphism. Do not require a Borel rephasing of coordinate lifts to become a globally strongly continuous unitary-valued map on the base group. The extension-product theorem applies when at least one genuine extension group C*-algebra `C*(E_{ωᵢ})` is type I. A type-I fixed-central-character twisted fiber `C*(Gᵢ,ωᵢ)` is an alternative only after proving the corresponding fixed-central-character product theorem directly; it does not by itself imply that `C*(E_{ωᵢ})` is type I. Type I of the untwisted `C*(Gᵢ)` is not sufficient. In Dooley pp.16–17, the group is `G₁×ℝ`; the ℝ factor supplies the trivial multiplier class `H²(ℝ,𝕋)=0`, and its circle central extension is abelian and type I. The separate p.28 `G×SU(3)` example uses compact `SU(3)`, whose compact central extension is type I; A nontrivial cross-multiplier class obstructs this reduction. This adapter is an M2 theorem consumed by those examples, not merely an application-side assumption.

**TransformationTypes.HeisenbergShear.** Work out the action of additive
ℝ on X=ℝ² given by t·(a,b)=(a+tb,b), with coefficient action by inverse
pullback. For b≠0 the orbit is ℝ×{b} and its stabilizer is zero; for
b=0 every point (a,0) is fixed, with stabilizer ℝ. Prove these orbit
and stabilizer formulas and closedness of every orbit. The irreducible
images below prove that this algebra is CCR. For b≠0, restriction to the
horizontal orbit followed by D3's translation-kernel isomorphism gives
a surjection `C₀(ℝ²)⋊ℝ→K(L²(ℝ))`; identify its kernel with the
crossed product of the functions vanishing on that orbit. At (a,0),
identify the quotient with C*(ℝ) and its further character quotients,
including every stabilizer frequency τ∈ℝ. Prove that these are all
irreducibles, with distinct b≠0 and distinct pairs (a,τ) giving
inequivalent models. For M2's regular Mackey theorem construct the
standard Borel orbit space `(ℝ\{0})⊔ℝ`: the quotient sends (a,b) to b
in the first summand when b≠0 and to a in the second when b=0. Its
representative section sends b to (0,b) and a to (a,0). Prove both maps
Borel and that their fibers and representatives are precisely the stated
orbits. Verify M2's lcsc, standard-Borel, stabilizer and regularity
hypotheses. Use M1's induction and M2's untwisted split classification
under the Fourier/crossed-product comparison below to prove exhaustion;
V11 gives all characters of the zero-orbit stabilizer ℝ. The nonzero-orbit
images are K(L²(ℝ)), and the fixed-point models are one-dimensional,
so every irreducible image consists of compact operators.

Construct the same algebra from the native `TauCeti.HeisenbergGroup ℝ`
and its product topology. Its native coordinates (x,y,z) have law
`(x,y,z)(x′,y′,z′)=(x+x′,y+y′,z+z′+xy′)` and correspond to the
upper triangular matrix with entries x at (1,2), y at (2,3), z at (1,3).
Use normal coordinates n=(r,s) and acting coordinate t, with
`α_t(r,s)=(r,s−tr)`. Construct the topological group isomorphism from
`ℝ²⋊_αℝ` to this native carrier by
`((r,s),t)↦(x=r,y=t,z=s+rt)`, and prove its inverse and matrix law.
Use the positive characters `χ_(a,b)(r,s)=exp(i(ar+bs))`; inverse
pullback gives exactly the preceding dual shear. Compare both universal
pairs to obtain
`C*(HeisenbergGroup ℝ)≅C₀(ℝ²)⋊ℝ`, including the Haar/Fourier
normalization through V11. For b≠0 give the induced model explicitly:

```
(π_b((r,s),t)ξ)(u)=exp(i b(ur+s))ξ(u−t).
```

Prove its representation law, unitarity, strong continuity and central
character exp(i b s). For b=0 the models are the characters
`((r,s),t)↦exp(i(ar+τt))`. Identify all primitive kernels and their
quotient maps with those of the shear algebra above. This is a worked
comparison with the existing native group and M1/M2's induction
theorems; no additional general Kirillov classification is assumed.

**M2.TypeIDisintegration — irreducible decomposition and its Borel base.**

Own the following general theorem, independently of the split semidirect-product
classification above. First for every separable GCR C*-algebra A and every
nondegenerate representation of A on a separable complex Hilbert space H,
construct a standard Borel unitary dual Â, a measurable field of
irreducible representations `π_ζ:A→B(H_ζ)` representing its distinct classes,
a sigma-finite Borel measure μ on Â, nonzero when H≠0, a measurable multiplicity
`m:Â→{0,1,2,…,∞}`, positive μ-almost everywhere, and a unitary
`H≃∫^⊕(H_ζ⊗ℓ²(m(ζ)))dμ(ζ)` intertwining the represented algebra.
Use zero measure for H=0; outside the essential support the multiplicity may
be set to zero. A finite measure equivalent to μ may be chosen, but no Haar
or Plancherel normalization is implicit. Prove uniqueness of the measure class
and multiplicity almost everywhere; describe changes of representative field
and equivalent measures by the V4.0.Fields field unitary and density formulas.
Two representations of A are unitarily equivalent exactly when these
spectral data agree. Do not assert pointwise uniqueness of the field or measure.

Use HilbertModules H5's small unitary-dual carrier (pure states modulo unitary
equivalence of cyclic GNS representations), CStarAlgebras C2's pure-state/GNS,
primitive-kernel and separable primitive-space results, VNA V3's spatial
type-I factors, V4.0.Fields' measurable fields and V4.0.Decomposition's central reduction. Consume
TypeIComparison for the GCR kernel homeomorphism. Construct Borel codes
on the countable union of standard finite-dimensional Hilbert spaces and
ℓ², from a countable dense star subalgebra and its matrix coefficients.
Prove nondegenerate representation coding standard Borel, unitary
conjugation jointly Borel and its irreducible subset Borel. Define Mackey
structure as the quotient sigma algebra of those irreducible codes.

Own this precise selection route. Norm superlevel tests give a countable
invariant Borel family separating inequivalent irreducible codes, by GCR
kernel injectivity and second countability of Prim(A). In each dimension
restrict the jointly Borel unitary-conjugation action to the standard Borel
space Irr_n itself and apply M1.BorelRealization there, then consume M1.MeasuredTensor's countably separated action selector in the following exact form:
for a continuous Polish-group action on a Polish space, a countably
separated orbit relation on an invariant Borel subset has a Borel
transversal. The graph of the unique equivalent representative in that
transversal is Borel because the countable separating family makes the
relation Borel. Singleton-fiber uniformization gives its Borel selector map.
Identify the transversal
with the class set and take the countable union over dimensions. This
gives a measure-independent Borel representative field on all of Â.
Compare [Burgess, Pacific J. Math.80(1979),333–336](https://doi.org/10.2140/pjm.1979.80.333)
for the selector construction. A universally measurable Jankov–von Neumann
selector and countable-fiber Lusin–Novikov do not supply this theorem.

Own Blackwell–Mackey in the exact form used: every countable separating
Borel family on a countably separated analytic Borel space generates its
sigma algebra. Prove the quotient Mackey structure analytic and its
separating norm-superlevel family Fell-Borel; this theorem identifies
Mackey and Fell Borel structures. For the reverse inclusion prove the
norm-superlevel sets {[π]:||π(a)||>1}, a∈A, form a hull-kernel base:
inside the complement of hull(I), choose and rescale a∈I detected by π.
C2 lower semicontinuity and the class/kernel homeomorphism give openness.
Second countability makes each open a countable union of such sets; the
uniform bound | ||π(a)||−||π(a′)|| |≤||a−a′|| passes from the countable
dense family to every a. Thus Fell-Borel⊆σ(S)=Mackey as well.
The transversal identification makes
the space standard Borel, even when the Fell topology is non-Hausdorff.
Separability of Prim(A) alone and arbitrary quotient selection do not
give this result. Finally TypeIComparison supplies the same theorem
from the factor-type-I hypothesis. General non-type-I duals are outside
this conclusion.

For existence, apply V4.0.Decomposition's central decomposition to `π(A)″`, identify its
almost-everywhere type-I factor fibers, and construct measurable minimal
projections/matrix units and spatial identifications to split each fiber into
an irreducible represented algebra and its multiplicity. Own the required
measurable selection/trivialization argument here using V4.0.Decomposition's actual
analytic-set/uniformization and measurable-algebra-field suppliers and V3's
matrix-unit model. The code-to-dual map, its injectivity on central fibers
up to null sets, and the identification of the resulting measure class with
the central spectral measure must be proved; arbitrary factor decompositions
do not by themselves give the asserted inequivalent-irreducible field.
Use V4.0.Decomposition’s uniqueness of central reduction and V3’s spatial type-I multiplicity for the
uniqueness theorem. None of these descriptive-set comparison or measurable
trivialization obligations is declared implemented by a prototype signature.

For each Hausdorff second-countable locally compact type-I group G, consume
OperatorAlgebraDynamics D1's full group C*-algebra, separability and
nondegenerate integrated-representation correspondence to apply this theorem
to `A=C*(G)`. Prove the factor definitions agree and recover measurable fields
of strongly continuous native `ContRepresentation`s with native unitarity;
strong continuity of the recovered fiber representations is part of the
integrated-representation comparison. Identify its dual Borel structure with
the actual G-dual's Mackey and Fell Borel structures. M5's explicit label
charts must prove their Borel comparison to this base; the countable Fell
neighborhood tables are additional topological results, not the definition
of this measurable base. The general theorem supplies existence/uniqueness
to the product theorem and M6's decompositions, including atom and multiplicity
claims. A given measurable-field graph theorem below needs neither this
existence theorem nor irreducible or pairwise inequivalent fibers.

**M2.RectangularField — central diagonal and field Schur.**

For a separable type-I C*-algebra A use M2.TypeIDisintegration's standard
Borel field π_c of pairwise inequivalent nonzero irreducibles. For measurable
separable multiplicities M_c and a sigma-finite measure μ on its effective
support, prove that the represented von Neumann algebra of
π=∫⊕(π_c⊗1_(M_c))dμ contains the diagonal L∞(μ), and identify

```
π(A)″ = ∫⊕(B(H_c)⊗1_(M_c))dμ,
π(A)′ = ∫⊕(1_(H_c)⊗B(M_c))dμ.
```

Use CStarAlgebras' ideal/approximate-unit API, C2's second countability
of Prim(A), TypeIComparison's kernel homeomorphism, and
M2.TypeIDisintegration's equality of canonical Mackey and Fell Borel structures.
Thus a countable Fell-open base generates exactly the stated label sigma algebra. For each open dual set U, its corresponding ideal I_U
has a sequential positive contractive approximate unit. Its represented
strong limit is exactly the central projection 1_U: the irreducible image
of I_U acts nondegenerately when c∈U and vanishes otherwise. A countable
open base and a monotone-class argument give every diagonal L∞ operator
in π(A)″. Pointwise irreducibility alone is not this argument.
Apply V4.0.Fields's decomposability criterion to the commutant. Consume
C2's equivalence of nonzero irreducibility with scalar commutant for the
nondegenerate C*-representation π_c. Own its Hilbert tensor adapter here:
compress an operator commuting with π_c(A)⊗1 against a countable orthonormal
basis of the separable multiplicity space; every matrix entry is scalar on
H_c. The bounded scalar matrix gives exactly1⊗X, with the same norm;
conversely each such operator commutes. Apply the same argument to the
off-diagonal corner on H_c⊗(M₁⊕M₂) for rectangular multiplicities. This
works for the stated general separable type-I C*-algebra, without replacing
it by a group algebra or consuming M1's group-only lemma. Together with the
converse commutation test it proves the displayed algebra identities.

For two multiplicity fields over a common μ, prove a bounded A-intertwiner
between their direct integrals is uniquely ∫⊕(1_(H_c)⊗X_c)dμ with an
essentially bounded measurable rectangular field X_c. Apply the preceding
central-support construction to their direct-sum representation, obtaining
intertwining of the same diagonal L∞ actions, before invoking V4.0.Fields's
rectangular decomposability theorem. Then use a common conull set for a
countable dense star subalgebra and the preceding C2-based rectangular tensor adapter. Prove the norm,
adjoint, composition and unitary-if-and-only-if-fiberwise-unitary statements.
For equivalent root measures first apply V4.0.Fields's square-root RN transport.
The zero representation uses zero measure. For lcsc type-I groups consume
D1's integrated correspondence with A=C*(G). This theorem requires type I,
the canonical inequivalent irreducible field and separability; it is distinct
from M2.DerivedDI, which requires none of those hypotheses for a given field.

### M2.MeasuredRefinement — fixed-algebra and fixed-group irreducible refinement

Own this precise interface before M6. For a separable complex C*-algebra A that is type I in the factor-representation sense of M0a, construct a standard Borel unitary dual Â, a Borel field of nonzero inequivalent irreducible models `π_c:A→B(H_c)` on standard finite-dimensional spaces or ℓ², and for each nondegenerate representation π on a separable Hilbert space a σ-finite measure μ and measurable separable multiplicity field M_c with an onto intertwiner
```
H_π ≃ ∫_Â^⊕ (H_c ⊗̂ M_c) dμ(c).
```
When H_π≠0 choose μ an equivalent probability and M_c nonzero μ-almost everywhere. Use zero measure for H_π=0, including A=0. Prove uniqueness of the measure class and multiplicity dimension μ-almost everywhere, and the representation-equivalence criterion, with no pointwise uniqueness of models or measures.

M0a supplies GCR, same-kernel and Fell–primitive-kernel comparisons; CStarAlgebras C1/C2 supply ideal/approximate-unit, primitive-space, pure-state/GNS and scalar-commutant APIs. Code nondegenerate representations on the countable standard Hilbert models by a countable dense star subalgebra and coefficients; prove the coding space standard Borel, irreducible subset Borel and unitary conjugation jointly Borel. Use M1.BorelRealization on that Borel action. GCR kernel injectivity and a countable primitive-space/norm-superlevel family separate the irreducible orbits; M1's countably separated action selector then gives a Borel transversal and representative field. Prove the quotient Mackey sigma algebra equals its canonical Fell Borel structure, using Lusin–Souslin on the selected standard Borel transversal’s countable separating norm-test code, and proving both Borel inclusions. Universal measurability alone is not this global Borel field. For existence consume VNA V4’s actual full-center factor reduction, measurable algebra fields and selection spaces, split the almost-everywhere type-I factor using measurable minimal projections/matrix units, and prove the code-to-dual and multiplicity-field comparisons. Use central-reduction uniqueness and the spatial type-I multiplicity theorem for uniqueness. Construct these comparison and selection theorems in M2.

For a fixed A as above, a standard Borel probability base `(Q,ν)` and a measurable field π_q of nondegenerate representations on separable H_q, let `Q_eff={q:dim H_q>0}` and prove it Borel from fundamental sections. Construct spectral kernels μ_q on Â, probability for ν-almost every q∈Q_eff and zero off Q_eff, jointly measurable separable multiplicities M_(q,c), and measurable onto intertwiners
```
H_q ≃ ∫_Â^⊕ (H_c ⊗̂ M_(q,c)) dμ_q(c)
```
for ν-almost every q, with M_(q,c) nonzero μ_q-almost everywhere on Q_eff. Own joint measurability and a common conull set for this supplied family, rather than applying single-representation existence independently at each q.

Handle the zero-total/empty-dual case directly before any conditional-kernel nonemptiness assumption; all field assertions are on one common ν-conull set. One precise construction Borelly embeds Q in the compact Cantor cube K using a countable separating Borel algebra, with Borel image/inverse by Lusin–Souslin. On `C(K)⊗min A≃C(K,A)` represent a finite sum by `[q↦Σ_i f_i(q)π_q(a_i)]`; the norm is bounded by `sup_k‖Σ_i f_i(k)a_i‖`, so this specific representation extends by CStarAlgebras C5’s vector-valued function comparison. Prove every nondegenerate irreducible of C(K,A) is `ev_k⊗π_c`, its dual is Borelly `K×Â`, and C(K,A) is type I: in any factor representation the central multiplier C(K) acts by a character k, and the representation factors through evaluation and a type-I factor representation of A. Apply the single-algebra theorem to this represented C(K,A), retaining the Q label. The countable code and a faithful normalized measurable countable vector-state sum on each nonzero H_q give a joint control measure λ on `Q_eff×Â` with Q marginal exactly `ν|Q_eff`; first prove support on the coded Q image, then transport any equivalent control measure by its positive RN density. Native finite-measure scalar disintegration yields `λ(dq,dc)=ν(dq)μ_q(dc)`. The global onto intertwiner preserves the labelled Q-diagonal; VNA V4’s generic decomposability criterion, applied to the off-diagonal corner on the direct-sum input/output field for rectangular maps, and field Fubini recover the displayed onto intertwiners for ν-almost every q. Prove uniqueness preserving that labelled diagonal, and transport under code, model, base-measure and vector-state changes. A nonzero σ-finite base is first replaced by an equivalent probability and transported back; a zero base measure is handled as the zero direct integral.

For the unlabelled total representation, put `barμ=(pr_c)_*λ`. If λ≠0 disintegrate `λ(dq,dc)=barμ(dc)α_c(dq)` and set `N_c=∫_Q^⊕M_(q,c)dα_c(q)`. Prove
```
∫_Q^⊕ π_q dν(q) ≃ ∫_Â^⊕ (π_c ⊗ 1_(N_c)) dμ̄(c).
```
Its final multiplicity is `dim N_c`, not a naive scalar sum over q; diffuse q-fibers contribute their L² multiplicity. If λ=0 use the zero representation and zero measure directly. State final uniqueness only in measure class and almost-everywhere multiplicity dimension. For a fixed lcsc type-I group G take `A=C*(G)` using D1’s integrated correspondence. Derive C*(G) separable from D1’s L¹ norm bound and dense integrated C_c span, with a countable compact exhaustion and rational compact-support approximants on the lcsc G; do not claim the arbitrary-group D1 scope already states separability. Recover strongly continuous unitary group representations from the algebra fields. Apply this fixed-G measured-family theorem to M1's q-indexed induced G-representations. It requires type I only at this irreducible-refinement step, not at M1's intermediate induced decomposition; it asserts no general selection theorem for varying little groups.

The general fixed-algebra interface above and the following group specialization share M2.TypeIDisintegration and M2.RectangularField as their single decomposition owners. Prove that the C(K,A) construction and the full-centre group construction below give equivalent labelled spectral data by the stated uniqueness; neither creates a second measurable-field carrier.

**M2.ParameterizedRefinement — measured families of type-I representations.**
For a second-countable locally compact type-I group L, a standard Borel probability base (Q,ν), and a measurable field of strongly continuous L-representations π_q on separable Hilbert spaces, let `Q_eff={q:dim H_q>0}`; prove this set Borel using the Gram fundamental sections. Construct a joint standard Borel field of irreducible models H_c, measurable multiplicities M_(q,c), spectral kernels μ_q and a measurable field of onto intertwiners `H_q≃∫⊕H_c⊗M_(q,c)dμ_q(c)`, for ν-almost every q. On Q_eff use probability μ_q and nonzero multiplicities μ_q-almost everywhere; off Q_eff use the zero measure. Pin the coefficient Borel structures and fundamental sections from V4.0.Fields. The joint control measure `ν(dq)μ_q(dc)` has Q-marginal `ν|Q_eff`; if that measure is zero, the total representation is zero and the construction is direct. Compare the total direct integral by field Fubini. Own the joint measurability and conull-set theorem here, rather than applying a single-representation existence theorem independently at each q.

Write Π for the total representation, `A₀=Π(C*(L))″`, and D for its labelled Q-diagonal. First apply M2.TypeIDisintegration to Π, obtaining the canonical irreducible label c and its multiplicity field N_c. M2.RectangularField puts the full c-diagonal in A₀ and identifies `A₀=∫⊕B(H_c)⊗1_(N_c)`, `A₀′=∫⊕1_(H_c)⊗B(N_c)`. Since D commutes with A₀, its operators are measurable decomposable multiplicity operators in this model. Use a countable separating Borel algebra on Q to embed Q Borelly in the compact metrizable Cantor cube K={0,1}^ℕ, with Borel image and measurable inverse by Lusin–Souslin. The multiplication representation ι of the separable C(K), with a fixed countable dense *-subalgebra, generates D. In each c-fibre let D_c be the abelian von Neumann algebra generated by its countable multiplicity operators. Prove, using V4.0.Decomposition’s algebra-field and commutant formulas, that the joint algebra

```
𝓜=(A₀∪ι(C(K)))″=∫⊕(B(H_c)⊗D_c),
Z(𝓜)=∫⊕(1_(H_c)⊗D_c)=Z(A₀)∨D.
```

Apply V4.0.Decomposition to 𝓜 over its **full centre**. Cantor-code the canonical c-label by M2.RectangularField’s countable separating dual projections {1_U}, obtaining a compact cube K′. Own the joint unital *-homomorphism
`j:C(K′×K,ℂ)→⋆ₐ[ℂ]B(H_Π)` from the commuting central coded projections,
BEFORE applying SA-B85. Write p_n=1_(U_n) for the dual-code coordinate
projections and q_n=ι(1_(k_n=1)) for the Q-code coordinate projections.
These are pairwise commuting self-adjoint projections in Z(𝓜). For finite
coordinate sets F,G and binary words ε,η, form the Boolean atoms
`e_(ε,η)=∏_(n∈F)p_n^(ε_n) ∏_(n∈G)q_n^(η_n)`, where
`p^(1)=p`, `p^(0)=1−p` (and likewise for q). Prove these atoms are
orthogonal projections summing to1, including zero atoms. Send a cylinder
function f to `Σ_(ε,η) f(ε,η)e_(ε,η)`. Prove independence of the finite
coordinate presentation, unital *-homomorphism laws and the norm bound
`||Σ f(ε,η)e_(ε,η)||≤max_(ε,η)|f(ε,η)|` by orthogonality. Cylinder functions
separate points of K′×K; Stone–Weierstrass and completeness extend this
contractive map uniquely to j. This is the Cantor-coded construction owned
here, not an assumed joint spectral theorem. Consume CStarAlgebras C5's
`C(K′)⊗min C(K)≃C(K′×K)` and its elementary-tensor/naturality comparison
for the resulting joint map; the finite-cylinder norm proof supplies its
continuous extension without assuming that an arbitrary commuting pair
already has a minimal-tensor extension. Its restrictions recover the
p_n calculus and ι(C(K)). Since the two coordinate families generate
Z(A₀)∨D, prove `j(C(K′×K))″=Z(𝓜)`; j need not be injective.
Apply SA-B85's general compact model to this NQS-owned joint representation.
SA supplies its single-representation spectral/multiplicity comparison;
the joint measurability, labelled kernels and conull-set comparisons below
remain owned here. Prove that, after removal of a null set, these countable coordinates give a Borel injection of the full-centre base into the canonical dual × Q_eff, with Borel inverse on its image by Lusin–Souslin. The resulting 𝓜-fibres are factors almost everywhere. Keep the canonical c-label through the central inclusion Z(A₀)⊂Z(𝓜) and the countable dual-label projections of M2.RectangularField. Keep the q-label through ι(C(K)); prove that its spectral measure is supported on the coded Q_eff. The displayed algebra identity and V3’s spatial type-I representation theorem show that the restricted L-representation on each joint fibre is exactly `π_c⊗1_(M_(q,c))`, with measurable multiplicity obtained by V4.0.Fields. Prove this isotypic-fibre lemma, the labelled (q,c) comparison and the onto intertwiner as part of this theorem; merely decomposing over D would recover the original π_q and would not refine it. No simultaneous pointwise normal representation of all L∞(Q,ν) is required: diffuse diagonal functions may become point evaluations after central disintegration.

Choose a measurable faithful countable vector-state sum on each nonzero input H_q, normalized to mass one, and integrate it against ν|Q_eff. Its pushforward under the joint central spectral comparison gives a control measure with Q-marginal exactly ν|Q_eff; any initial equivalent control measure is transported to this one by its positive RN density. Disintegrate this joint measure over ν. The joint onto intertwiner preserves the labelled Q-diagonal; field Fubini and V4.0.Fields’s rectangular decomposability theorem therefore recover measurable onto fibre intertwiners for ν-almost every q. Prove their L-intertwining and recovered strong continuity using countable dense integrated-algebra and coefficient tests. Prove uniqueness in joint measure class and multiplicity fields **preserving the labelled Q-diagonal**. Construct transport under changes of vector-state normalization, equivalent base measure, code or irreducible models. A sigma-finite ν is first replaced by an equivalent probability and then transported back. No common exceptional set is asserted over unrelated bases or all external parameter tuples, and no decomposition at every exceptional q is asserted.

**M2.InducedRefinement — terminal type-I refinement.**

This is a derived measured-family result. *Needs:* M1.MeasuredTensor for the
measurable induced field; M2.ParameterizedRefinement for its jointly labelled
irreducible refinement; M2.RectangularField for uniqueness; VonNeumannAlgebras
V4.0.Fields/Decomposition for the actual direct integrals. The external
induction-in-stages ingredient is Echterhoff2010 Remark 5.10(2), p.20, and
Theorem 7.10, p.38; those results alone do not supply parameterized refinement.

Apply this measured-family theorem to M1's subgroup decomposition with **L type I**, and to its tensor-product decomposition with **G type I**, retaining the stated regular measured orbit quotient, separability and strong continuity of the inducing representations σ. Construct the measurable irreducible refinement of the q-indexed induced representations, the total unitary intertwiner and joint measure-class/almost-everywhere multiplicity uniqueness. This adds explicit hypotheses only to the irreducible refinement: M1.Core's decomposition into induced representations retains its theorem without any type-I hypothesis.

**M2.DerivedDI — closed derived operators in Lie-group disintegrations.**

For a connected finite-dimensional real Lie group and any measurable field of strongly continuous unitary representations `π_ζ` on separable Hilbert spaces over a standard Borel sigma-finite measure space `(T,μ)`, form its actual direct-integral representation `π=∫^⊕π_ζ dμ(ζ)` using V4.0.Fields. Own the following operator comparison, consuming M0's common Gårding/core and central-closure theorems. Neither irreducibility, pairwise inequivalence, a dual-space base nor type I is required for this given-field theorem. Let `T_u` be the closure of dπ(u) on the Gårding core, for each fixed complex enveloping element u. Prove, rather than infer from a formal matrix action,

```
T_u = ∫^⊕ [closure(dπ_ζ(u)|Gårding)] dμ(ζ),
dom T_u = {v: v_ζ∈dom T_(u,ζ) a.e.,
                 ∫(||v_ζ||²+||T_(u,ζ)v_ζ||²)dμ<∞}.
```

Choose a countable C_c∞ test family dense with all compact-support derivative seminorms and measurable fundamental sections ξ_j(ζ) of the full fibers H_ζ. When a separate decomposition supplies `π_ζ=σ_ζ⊗1_(M_ζ)`, also prove that the fiber Gårding closure is the graph closure of the algebraic tensor operator T_(u,ζ)^σ⊗1, using graph-norm density of finite multiplicity tensors and the integrated L¹ bounds; this tensor adapter is separate from the general given-field hypothesis. M0's differential dictionary gives `dπ_ζ(u)π_ζ(φ)=π_ζ(D_uφ)`, with D_X=−R_X and the actual enveloping order. The graph sections `(π_ζ(φ_n)ξ_j,π_ζ(D_uφ_n)ξ_j)` are measurable and graph-total in each fiber closure. Their norms are bounded by the L¹ norms of φ_n,D_uφ_n times ||ξ_j||. Measurable graph Gram–Schmidt, finite-measure/norm cutoffs and measurable scalar coefficients therefore give a graph-dense family of global Gårding vectors: each is π(φ_n) applied to an L² section. Prove both graph inclusions and the displayed domain equality. Choose one common conull set for the countable enveloping words used here. Approximate identity convolution also shows that every smooth vector lies in dom T_u and has its actual derived value there; no tensor admissibility is assumed.

For a Hermitian central Z, M0 identifies T_Z and its fiber closures as self-adjoint. In the general given-field case retain their operator-valued direct integral. If the field is irreducible, or a separately supplied irreducible field with multiplicity as in M2.TypeIDisintegration, M0 identifies each corresponding fiber closure as q_Z(ζ)Id. Prove q_Z measurable through the graph/spectral comparison; only in this additional case is the displayed equality the scalar central spectral closure `T_Z=∫^⊕q_Z(ζ)Id`, including its domains and spectral projections. A bounded commutant operator preserves the Gårding core and commutes with its integrated/derived operators. Its unitary elements therefore transport the closed central operator, putting its spectral projections in π(G)″; M0's π(G)-covariance also puts them in π(G)′. Hence T_Z is affiliated with the centre of π(G)″. Prove the same comparison for Z^n and its equality with T_Z^n by self-adjoint maximality. This is a Lie-group adapter of M2 consuming M0; it does not make M0 depend on M2.

### Examples

For the shear t·(a,b)=(a+tb,b), b=1 has orbit ℝ×{1} and trivial stabilizer; b=0 fixes each (a,0) and has stabilizer ℝ. Keeping that second branch recovers every character labelled by (a,τ).

### Dependencies

P.2; M0a.TypeIComparison; M0; M1; CStarAlgebras C1/C2/C5; HilbertModules H3; VonNeumannAlgebras V3 and V4.0.Fields/Decomposition; SelfAdjointSpectralTheory SA-B85. ParameterizedRefinement follows TypeIDisintegration and RectangularField.

## Layer 6: M3 — Euclidean, Galilei and Bargmann models

Define both `G_E=ℝ⁴⋊SO(3)` and its double cover `G̃_E=ℝ⁴⋊SU(2)`, with the covering action rotating the first three coordinates and fixing time. Use spatial/time characters `χ_(p,E)(a,t)=exp(i(−p·a+Et)/ℏ)` and physical
evolution at time t equal to the active symmetry at −t. Classify their genuine
representations separately by M2. At zero spatial momentum the stabilizers are respectively SO(3) and SU(2): the ordinary group has integer spin j, while the cover permits j∈(1/2)ℕ, with central −I acting as (−1)^(2j). At nonzero spatial momentum choose `(0,0,r,ε)`, r>0, ε∈ℝ. The stabilizers are SO(2) and its circle double cover inside SU(2). Parameterize the ordinary character by `e^(inφ)`, n∈ℤ, and the cover by
`e^(inθ)` where φ=2θ; its helicity is n/2 and central character is (−1)^n. Prove these orbit/stabilizer and induced Hilbert-space identifications, and exactly which cover representations descend to G_E. Consume Layer P.3's locally continuous circle-extension classification, Layer P.4's computation `H²_lc(SO(3),𝕋)≅ℤ/2` and its SU(2) pushout for the projective SO(3) sector, transported through M1; half-integer spin is not a genuine SO(3) label and no global continuous section is assumed.
First prove `H²_lc(G̃_E,𝕋)=0`: use Layer P.4's smoothing and Whitehead lemmas to remove
rotation and mixed cocycle blocks; the remaining alternating forms on
ℝ³⊕ℝ have no SO(3)-invariant vectors, so their invariant2-form space is zero.
Integrate on the simply connected cover and prove period uniqueness. Thus the
ordinary Euclidean group's only extra ray-extension datum is Layer P.4's SO(3) spin class;
a general translation multiplier cannot be extended rotation-covariantly here. Prove the systems-of-imprimitivity comparison and distinguish these Euclidean/time-translation groups from the inhomogeneous Lorentz group.

Compare M1's spatially localized model
`L²(ℝ³;V_j)` with Layer P.5's position/momentum operators and Fourier transform.
With fixed time character ε, prove that this is an irreducible covariant
system for the Euclidean spatial action and irreducible rotation datum, while
its underlying unitary group representation is reducible. Decompose its
momentum realization over radii r>0 and the SO(2) or covering-circle characters
in the restriction of V_j, with radial measure r²dr up to the stated Haar
normalization; the origin has zero Lebesgue measure. Use these actual little-group
labels, rather than identifying the whole localized model with a zero-momentum
irreducible labelled only by (j,ε). Derive angular momentum as orbital plus the
differentiated spin action, with Layer P.5's common Schwartz core and sign conventions.

**Galilei multiplication, multipliers and the Bargmann extension.**

The coordinate law and mass cocycle are derived from the displayed affine action
and rotational preservation of the Euclidean pairing. *Needs:* P.3's extension
construction and P.4's Lie comparison (Neeb2004 Proposition II.6 and Lemma II.7);
M1 for the induced representation. No external classification table is used to
infer this coordinate identity.

Fix ℏ>0,
spatial vectors a,v∈ℝ³ and R∈SO(3), with the SU(2) covering variant treated
separately. Set g=(R,v,a,t) acting on spacetime by
`(x,s)↦(Rx+vs+a,s+t)`, with left composition
`g₁g₂=(R₁R₂,v₁+R₁v₂,a₁+R₁a₂+t₂v₁,t₁+t₂)`.
Construct this topological Lie group and its rotation cover. In particular boosts
do not commute with time translations. Prove also that the proper Galilei
group has trivial center and its rotation cover has center {±1}; neither
has the central ℝ factor required by an abstract direct product with ℝ. Define
`τ(g₁,g₂)=v₁·R₁a₂+(t₂/2)|v₁|²` and prove normalization and the additive
2-cocycle identity by rotational dot-product invariance. Define the real central
extension `(z₁,g₁)(z₂,g₂)=(z₁+z₂+τ(g₁,g₂),g₁g₂)`; its mass-m character is
`z↦exp(imz/ℏ)`, and its quotient multiplier is `ω_m=exp(imτ/ℏ)`.
Prove these group, topology, section and representation comparisons using M1;
this extension has a global continuous section, separately from Layer P.4's SO(3)
spin circle extension. The circle extension at a fixed m is the pushout by
that central character.

Own the Galilei-specific cohomology computation
`H²_lc(G̃_G,𝕋)≅ℝ`, with Layer P.3's precise locally continuous extension convention.
Use Layer P.4's local-exponent smoothing and smooth Lie-extension comparison, not
just regularity of a homomorphism between already constructed Lie groups.
Remove rotation/rotation cocycle terms using its scalar degree2 Whitehead
lemma, then rotation/radical mixed terms using its degree1 lemma for the
finite-dimensional radical dual. The remaining rotation-invariant alternating
forms on boosts⊕translations⊕time are exactly the multiples of the boost/
translation dot pairing. Verify the radical cocycle equation and show a
coboundary cannot change this pairing. This is a self-contained block-cochain
proof, not an assumption of the connected classification from a source table.
Prove integration and uniqueness using the simply connected rotation cover
and the explicit Bargmann extension, including all period conditions.
Every class is represented by exactly one globally continuous ω_m; prove the
comparison with H²_cont is an isomorphism here (a locally continuous phase
whose coboundary is globally continuous is itself globally continuous).
For the proper group
with SO(3) rotations, use the locally continuous extension convention of Layer P.3:
the mass parameter and the independent two-valued spin-cover class give its
full circle-extension classification. Prove the rotation-cover descent and
kernel-character test; do not represent a nontrivial spin class by a globally
continuous section. The Lie brackets `[K_i,T_j]=δ_ij M` and `[K_i,S]=T_i`,
where T,S are spatial/time translation generators, prove the mass extension
is nonsplit and fix its normalization.

**Full genuine irreducible classification.** Split the real Bargmann group as
`N⋊H`, with `N=ℝ_z×ℝ³_a×ℝ_t` abelian and `H=ℝ³_v⋊SO(3)`, or its SU(2)
variant. Prove the normal-subgroup conjugation
`α_(R,v)(z,a,t)=(z+v·Ra+(|v|²/2)t,Ra+vt,t)`.
With characters `χ_(m,p,E)=exp(i(mz−p·a+Et)/ℏ)`, M2's inverse dual action is
`(R,v)·(m,p,E)=(m,Rp+mv,E+(Rp)·v+(m/2)|v|²)`.
Prove this topological Pontryagin comparison, the regular Borel orbit quotient
and explicit sections in every branch below. Classify the little groups by
M2 and the compact suppliers, proving induction, inequivalence and exhaustion.
Prove the proper Bargmann group and its rotation cover are type I by M2:
the SO(3)/SU(2), E(2) and E(3) stabilizers are type I, the latter two by
M2 again with their smooth radius orbits and compact stabilizers. This is
the hypothesis used by M6's Galilei direct-integral uniqueness.
For arbitrary separable strongly continuous unitary representations, use the
central ℝ spectral PVM and V4.0.Decomposition disintegration to obtain a measurable mass-sector
decomposition; an irreducible has one scalar mass. Distinguish that decomposition
from further irreducible disintegration, whose type-I hypotheses must be checked.

| Mass/momentum branch | Orbit labels and stabilizer | Complete little-group labels |
| --- | --- | --- |
| m≠0 | U=E−|p|²/(2m)∈ℝ; representative (m,0,U); SO(3) or SU(2) stabilizer. | Spin j∈ℕ₀ for SO(3), j∈½ℕ₀ for SU(2). Thus genuine irreducibles have independent labels (m,U,j), including either sign of m. |
| m=0, |p|=r>0 | Representative (0,r e₂,0); energy varies through all ℝ along the orbit. Stabilizer ℝ²_transverse boosts⋊SO(2), or the covered rotation circle. | Zero transverse-boost covector: circle character/helicity s∈ℤ or ½ℤ. Nonzero transverse covector radius κ>0: trivial stabilizer for SO(2), and kernel {±1} with either central character for its circle cover. |
| m=0, p=0 | E∈ℝ is fixed; representative (0,0,E); stabilizer all H. | Zero boost-dual covector: SO(3)/SU(2) spin j. Nonzero boost-dual covector radius κ>0: SO(2)/covered-circle character s∈ℤ or ½ℤ. In both cases E is independent. |

Here e₂ is the last spatial basis vector in zero-based coordinates. For each
boost little group parameterize its abelian boost characters by
`v↦exp(ik·v/ℏ)`; use M3's preceding ordinary/covered-circle character enumeration
for the rotation labels. Prove the
orbit measures and induced Hilbert models in each row and the Borel sections
for the repeated E(2)/E(3) little-group problems. For the cover, prove exactly
which half-integral characters/spins and nonzero transverse-covector central
characters descend. An independent U or E distinguishes genuine Bargmann
representations. Multiplication by `exp(i c t/ℏ)` changes that energy constant
and leaves the ray action unchanged; state this separate equivalence when
classifying projective actions. Mass/spin labels alone are not a classification
of genuine irreducible Bargmann representations.

**Momentum model, domains and time reversal.** For m≠0 construct on
`L²(ℝ³;𝒱_j,d³p)` the genuine action
`(Π_(m,U,j)(z;R,v,a,t)ψ)(p)=exp(i(mz+(U+|p|²/(2m))t−p·a)/ℏ)
 D_j(R)ψ(R⁻¹(p−mv))`.
Prove its product law, unitarity, strong continuity and equality to the M2
induced model; do not infer irreducibility just from the displayed phase.
On the invariant 𝒱_j-valued Schwartz core use `P_iψ=p_iψ`,
`X_i=iℏ∂_(p_i)`, `V_i=P_i/m`, `H=|P|²/(2m)+U` and `K_i=mX_i`.
Writing T_a, S_t and B_v for the respective one-parameter subgroups, pin
`Π(T_a)=exp(−ia·P/ℏ)`, `Π(S_t)=exp(itH/ℏ)` and
`Π(B_v)=exp(iv·K/ℏ)`; physical evolution is Π(S_(−t)).
The momentum Fourier transform is
`(F_ℏψ)(p)=(2πℏ)^(−3/2)∫exp(−ip·x/ℏ)ψ(x)dx`.
Prove it sends Layer P.5's position to iℏ∂_p and its physical momentum −iℏ∂_x
to multiplication by p, as Layer P.5 states for general ℏ. Prove `[X_i,V_j]=iℏδ_ij/m`,
`[K_i,P_j]=iℏmδ_ij` and `[K_i,H]=iℏP_i` on that core.
In the positive Stone convention `dΠ(X)=iX̂/ℏ`, prove the bracket rule
`[X̂,Ŷ]=−iℏ[X,Y]^` from the derived representation, compatibly with
M0's −R_X dictionary. Its generator table is `K_i↦K_i`, `T_i↦−P_i`,
`S↦H`, `M↦m Id`; this table gives precisely the physical commutators above.
Consume Layer P.5, SAST and UO for the closed observables and prove the core/domain and
self-adjoint realization comparisons; a formal commutator is not a closure result.

Construct the antiunitary compact-spin structure J_j on 𝒱_j commuting with D_j
and satisfying `J_j²=(−1)^(2j)`. Prove uniqueness up to a unit phase:
for any other such antiunitary J′, `J′J_j⁻¹` is a complex-linear
unitary commuting with irreducible D_j, hence scalar by complex Schur.
With `Aψ(p)=J_jψ(−p)`, prove
`AΠ_(m,U,j)(g)A⁻¹=Π_(−m,−U,j)(g)` in these specified models.
Define time reversal on the extension by
`θ(z;R,v,a,t)=(−z;R,−v,a,−t)` and prove its automorphism law and
`Π_(m,U,j)(θg)=Π_(−m,−U,j)(g)`; thus A also implements this automorphism
on the fixed model, with `θ²=id` and `A²=(−1)^(2j)`.
Fix this zero-shift lift of time reversal: the alternatives
`θ_λ(z;g)=(−z+λt;R,−v,a,−t)` give internal energy `−U+mλ` instead.
State the central-character reversal and internal-energy sign alongside the
mass sign; complex conjugation gives the corresponding antiunitary equivalence
for every genuine class after choosing its equivalent displayed model. Retain “negative mass describes an antiparticle”
as an interpretation of the source model; it is not an equivalence theorem
for arbitrary choices of the genuine labels.

Use [Brennich (1970), printed pp.138–140,144–146](https://www.numdam.org/item/AIHPA_1970__13_2_137_0/)
for the displayed multiplication, multiplier and class list, with the source's
ℏ=1 normalization translated explicitly. Its connected list cites earlier
Inönü–Wigner/Lévy-Leblond work; the block-cochain and M2 proofs specified here
provide the actual classification route. Distinguish its
ray-equivalence conventions from the genuine fixed-central-character targets.

### Examples

With rotations identity, g=(v=e₁,a=0,t=0), h=(v=0,a=e₁,t=0) and k=(v=0,a=3e₁,t=0), the mass-cocycle equation reads 1+3=0+4=4. A pure boost e₁ followed by a unit time translation has displacement e₁; reversing the order has displacement 0, distinguishing the Galilei group from a direct product.

### Dependencies

P.3–P.5; M0–M2; RepresentationTheory/CompactGroups and LieHighestWeight; OperatorTheory/UnboundedOperators and SelfAdjointSpectralTheory. The coordinate cocycle precedes its extension classification and the massive and mass-zero induced models.

## Layer 7: M4 — Poincaré and Lorentz representations

Use the connected cover `ℝ⁴⋊SL(2,ℂ)`, with the verified action on Hermitian 2×2 matrices and kernel `{±I}`. Pin the Lorentz bilinear form as `q(p)=−p₀²−p₁²−p₂²+p₃²` (signature `diag(−1,−1,−1,+1)`). Define mass squared as the self-adjoint joint-calculus operator `q(P)`; define a real mass observable only on its nonnegative spectral sector. Translate any source expression with the opposite quadratic sign by an explicit signature conversion, never by changing labels silently.

Use zero-based finite coordinates in prototypes: indices0,1,2 are space and index3 is
time. Set c=1, fix ℏ>0 and the pairing
`⟨p,a⟩_η=−p₀a₀−p₁a₁−p₂a₂+p₃a₃`.
In this pairing, χ_ξ, q(p) and the native Hermitian matrix, subscript labels
`p_j,a_j` denote the native contravariant vector coordinates `p^j,a^j`.
Covariant components are used only when explicitly η-lowered, as in `P_ν` below.
Identify the translation dual by
`χ_p(a)=exp(i⟨p,a⟩_η/ℏ)` in native `Circle`; prove this is a topological group
isomorphism from additive momentum space to the native Pontryagin dual.
For the positive `2π` character convention `χ_ξ(a)=exp(2πiΣξⱼaⱼ)`, the coordinates
are `ξ=(−p₀,−p₁,−p₂,p₃)/(2πℏ)`; give the Fourier-kernel/sign comparison with V11.
If U's native joint Stone generators are Aⱼ with `U(a)=exp(iΣaⱼAⱼ)`, define physical
`P^j=−ℏA_j` for j<3 and `P^3=H=ℏA_3`, with their joint domains and PVM transport.
These are contravariant components; define `P_ν=Σ_μ η_{νμ}P^μ`, so
`P_i=−P^i` for i<3 and `P_3=P^3`. With translation coordinates `a^ν`,
`U(a)=exp(iΣ_ν a^νP_ν/ℏ)=exp(i(−Σ_{j<3}a^jP^j+a^3H)/ℏ)`.
The quadratic q(P) and momentum-orbit representatives use the contravariant components.
Here U is the active spacetime symmetry action. Physical Schrödinger evolution
by t is `U(−t e₃)=exp(−itH/ℏ)`, agreeing with the physical evolution convention `e^(−itH/ℏ)`; it is not the positive-time active symmetry operator U(t e₃).
Use the actual Lorentz generators `J_{μν}` from the Lie algebra action of `SL(2,ℂ)` on Hermitian matrices and define, for orientation `e₀∧e₁∧e₂`, physical angular momentum on M0's common core by `Ĵ₀=iℏ dU(J₁₂)`, `Ĵ₁=iℏ dU(J₂₀)` and `Ĵ₂=iℏ dU(J₀₁)`, with the Stone self-adjoint closures. Fix the six matrices intrinsically in the native Hermitian model: let `B_i` be the image of the i-th spatial basis vector under `realCliffordThreeOneVectorEquivHermitian` (so `B_0=σ_y`, `B_1=−σ_x`, `B_2=σ_z`), and set `J_{12}=−iB_0/2`, `J_{20}=−iB_1/2`, `J_{01}=−iB_2/2`, `J_{i3}=B_i/2`. Prove that `X↦JX+XJ†` transports to `L_{ρσ}e_ν=η_{νσ}e_ρ−η_{νρ}e_σ`, and use the homomorphism derived-action convention `dU([X,Y])=[dU(X),dU(Y)]`. These six matrices and the translation dictionary above determine the commutator signs before comparing with the source. With zero-based indices 0,1,2 spatial and 3 time, set `ε^{0123}=+1`, `η=diag(−1,−1,−1,+1)`, `P^3=H`, `P_i=−P^i` for i<3, `M_{ij}=ε_{ijk}Ĵ_k` for `ε_{012}=+1`, and `M_{i3}=K_i=iℏdU(J_{i3})` on the common invariant smooth-vector core. Extend the generators antisymmetrically: `J_{σρ}=−J_{ρσ}`, `J_{μμ}=0`, `M_{σρ}=−M_{ρσ}` and `M_{μμ}=0`, in particular `M_{3i}=−K_i`. Define the ordered Pauli–Lubanski operators there by
`W^μ=(1/2)ε^{μνρσ}P_ν M_{ρσ}`.
The pinned Poincaré commutator gives
`[P_ν,M_{ρσ}]=iℏ(η_{νρ}P_σ−η_{νσ}P_ρ)`; contracting with `ε^{μνρσ}` is zero (each metric contraction repeats an antisymmetric index), so reversing the product order gives the same operator on this core. Expanding the definition yields `W^3=Σ_{i<3}Ĵ_iP^i` and `W^i=HĴ_i−Σ_{j,k<3}ε_{ijk}P^jK_k` for i<3. For either null orbit put `P^μ=(0,0,ε_E r,ε_E r)`, r>0, ε_E∈{+1,−1}; the zero-translation-character little-group label is `ℓ∈ℤ` with character `exp(iℓθ/2)` on `r_θ=diag(exp(iθ/2),exp(−iθ/2))`. Prove directly in `SL(2,ℂ)` that `r_θ=exp(−θJ_{01})` by exponentiating `−θJ_{01}=iθσ_z/2`; do not infer the lift from its Lorentz image. Derive `L(r_θ)(x_0,x_1,x_2,x_3)=(x_0 cosθ+x_1 sinθ,−x_0 sinθ+x_1 cosθ,x_2,x_3)`. For the little-group character ζ_ℓ this gives the fiber infinitesimal operator `iℏ dζ_ℓ(J_{01})=(ℏℓ/2)Id`; the induced common-core operator identity below is a separate comparison, not point evaluation on an L² class. This pins the rotation direction used by the label. Prove `W^μ=κP^μ` with the invariant coefficient `κ=ℏℓ/2`. Thus the physical helicity, defined as `W^3/|P|=Ĵ·P/|P|`, is `λ_phys=ε_E κ=ε_E ℏℓ/2`; keep κ distinct from this branch-dependent helicity and retain both energy orientations. The identities hold on the stated core before proving the corresponding closure/domain statements. For the ordinary Poincaré group (the quotient by the covering center), a finite-helicity character descends exactly when ℓ is even. A nonzero-radius continuous-spin model descends exactly when the central stabilizer character is trivial, equivalently when the central element `−I` acts as `+1`; keep the other central-character sector for the covered group.

Use the **native** `realCliffordThreeOneVectorEquivHermitian`, whose matrix is
`[[p₃+p₂, −p₁−i p₀], [−p₁+i p₀,p₃−p₂]]`; its determinant is q(p), the negative
of native `realCliffordForm 3 1`. Define L(A) by transporting `X↦AXA†` through this
equivalence. Prove η-invariance, future-cone preservation and the dual-action identity
`χ_p(L(A)⁻¹a)=χ_{L(A)p}(a)`. These comparisons justify using Lorentz vector coordinates
as character labels. Choose representatives `(0,0,0,±m)` for timelike orbits with m>0,
`(0,0,r_sp,0)` for spacelike orbits with r_sp>0, `(0,0,1,1)` and its negative for the two
null orbits, and zero. The reference null energy1 is a representative choice, not an
invariant distinguishing different nonzero null orbits. Compute each stabilizer in the
native Hermitian model. For the spacelike stabilizer fix
`C₀=((1+i)/2)[[1,i],[1,−i]]∈SU(2)` and
`k_t=[[cos t,−sin t],[sin t,cos t]]`. Prove
`C₀ SL(2,ℝ) C₀⁻¹=SU(1,1)` and
`C₀ k_t C₀⁻¹=δ(0,2t)`. This conjugacy determines the signed compact weights
and both discrete-series orientations; prove the orbit measures/Borel sections required by M2.

**M4.SL2R — fixed weight generators and Casimir.**

Pin these enveloping elements in the preceding exact C₀/k_t convention. In the real sl(2,ℝ) basis put

```
J=[[0,−1],[1,0]]=d/dt|₀ k_t,
A=diag(1,−1),  B=[[0,1],[1,0]],
H_K=−iJ,  E_+=(A−iB)/2,  E_−=−(A+iB)/2.
```

Transport by Ad(C₀) into the complexified real SU(1,1) algebra; their displayed matrix images are respectively `H_K=diag(1,−1)`, `E_+=[[0,1],[0,0]]`, `E_−=[[0,0],[−1,0]]`. Use the native complexification/enveloping action and its unitary involution X*=−X for real X∈𝔤 (not the defining matrix adjoint), with H_K*=H_K, E_+*=E_−, `[H_K,E_±]=±2E_±` and `[E_−,E_+]=H_K`. Define the central element and primitive coproduct exactly by

```
q_B=½(E_−E_++E_+E_−)−H_K²/4
   =E_−E_+−H_K(H_K+2)/4=(J²−A²−B²)/4,
Δ(q_B)=q_B⊗1+1⊗q_B+E_−⊗E_++E_+⊗E_−−½H_K⊗H_K.
```

Prove centrality/involution and these identities in U(𝔤_ℂ), then apply M0's derived action and irreducible central-closure theorem. This fixes the matrix, factor and sign giving M4's scalar q_B values and the tensor Jacobi coefficients; it is not just a choice of generator names.

H_K denotes the compact-weight generator throughout this block; the
physical Hamiltonian is H=P³. M5 and M6 consume these fixed elements.

Positive energy means `spectrum(H)⊆[0,∞)`. Prove which induced models satisfy it by the
joint translation PVM: future timelike and future null sectors do; past and spacelike
sectors do not. The zero translation orbit has H=0 and admits every unitary Lorentz
little-group representation under this condition alone. State any further restriction
to the trivial zero-orbit/vacuum model explicitly in its application. Relate the
closed-forward-cone spectral condition to these orbit choices; positivity of H alone
does not identify a nonzero mass or a chosen spin.

Prove the full-spacetime localization obstruction in these carriers. For a nonzero representation Hilbert space,
a normalized PVM on ℝ⁴ covariant under all translations makes its translation
system an induction from the trivial subgroup by the H={1} case above. Hence the
translation representation is a multiple of the regular representation and its
joint spectrum is all of ℝ⁴. Use M4's pairing and Stone-generator comparison to
show its energy spectrum is ℝ, excluding a nonnegative-energy representation.
This obstruction concerns a sharp PVM on all spacetime; the spatial localization
systems at a fixed time have their separately specified covariance group.

Prove the decomposition into six orbit types for the dual action: future/past timelike nonzero orbits, spacelike nonzero orbits, future/past nonzero lightlike orbits, and the zero orbit. Compute stabilizers for chosen cover representatives: `SU(2)` for timelike, `SL(2,ℝ)` (equivalently `SU(1,1)`) for spacelike, `Δ≅ℂ⋊(ℝ/4πℤ)` for nonzero null, and `SL(2,ℂ)` at zero. Record orbit topology and measurable sections. M2 then supplies irreducibility, inequivalence and exhaustion under its exact hypotheses. Give the actual little-group duals used in the classification. For `SU(2)`, use highest weights `j∈½ℕ₀`. For `SL(2,ℝ)≅SU(1,1)`, use normalized induction from the upper triangular minimal parabolic with compact subgroup `K=SO(2)`: put `a_r=diag(r,r⁻¹)`, r>0, `M={±I}` and `n_x=[[1,x],[0,1]]`. Use `δ_P(a_r)=r²` and the inducing character `χ_(e_par,ν)((−I)^j a_r n_x)=(−1)^(e_parj)r^ν`, e_par∈{0,1}. The normalized character is `δ_P^(1/2)χ=(−1)^(e_parj)r^(1+ν)`, equivalently `δ_P^(1/2+ν/2)` on A, and induced functions satisfy `f(gp)=δ_P(p)^(−1/2)χ(p)⁻¹f(g)`. Relate Bargmann’s Casimir label by `q_B=(1−ν²)/4`. The principal family has ν∈iℝ with ν∼−ν; the complementary family is e_par=0 and 0<|ν|<1, with ν=0 counted as the spherical principal member. Fix center action `(-1)^e_par`. Give discrete series D_n^±, n≥2, and both limits D_1^±, with center action `(-1)^n`; include the trivial representation (center +1). In the fixed k_t circle, D_n^+ has weights n+2ℕ₀ and D_n^− has −n−2ℕ₀. Compact induction always uses `f(gk)=χ(k)⁻¹f(g)`, so its D^(sign n) constituent has the same sign as χ_n(k_t)=exp(int); changing to the dual covariance would reverse that sign. Prove irreducibility, equivalences and endpoint composition from the normalized intertwining operators: at ν=0 the odd induced representation is reducible and its Hilbert completion is the direct sum of D_1^+ and D_1^-; prove the even member I_(0,0) is irreducible, the spherical unitary principal endpoint. At the complementary-series boundary |ν|=1 identify the trivial constituent and every other constituent/subquotient, rather than identifying the whole induced module with the trivial representation. Give any further reducibility points of nonunitary continuation only if used in a proof, and distinguish them from the unitary dual. Prove that the resulting irreducible list exhausts the SL(2,ℝ) unitary dual, using M0's admissible-module and unitary-equivalence bridge. These details are required for the spacelike little-group classification; a family name or Casimir does not settle endpoint composition.

For the null stabilizer use
`δ(w,θ)=[[e^(iθ/2),w e^(−iθ/2)],[0,e^(−iθ/2)]]`, θ∈ℝ/4πℤ.
Its product is `(w,θ)(w′,θ′)=(w+e^(iθ)w′,θ+θ′)`, so the action on ℂ is
`w′↦e^(iθ)w′`. Prove that it fixes the chosen rank-one null Hermitian matrix;
θ=2π is central −I. Translate a source coordinate φ with diagonal e^(iφ) by θ=2φ,
including the resulting `e^(2iφ)` action. At zero translation character list rotation
characters exp(iℓθ/2), ℓ∈ℤ, with central value (−1)^ℓ at θ=2π. For a nonzero ℂ-character
`w↦exp(i Re(conj(ζ)w))` with |ζ|=r>0, give its circular orbit, rotation stabilizer {0,2π},
both stabilizer characters and induced models. These nonzero-radius induced models are
the continuous-spin representations; distinguish them from the zero-radius helicity
models and prove the Mackey equivalences. This ℂ belongs to the Lorentz little group;
its character parameter is separate from the spacetime χ_p normalization.

For both rank-one groups, use the smooth normalized induced space of `F∈C∞(G)` satisfying the displayed right-covariance law, equivalently smooth sections of its associated complex line bundle over G/P. Its compact picture is `C∞(K/M)` with the prescribed M-character covariance. State the corresponding Fréchet topology; normalized intertwiners act on these spaces before Hilbert completion in the principal/complementary invariant forms. At a reducibility point distinguish the algebraic K-finite module, smooth Fréchet kernel/quotient and completed unitary constituent, and prove their comparison rather than assigning one Hilbert space to all three.

**M4.P — SL(2,ℝ) Plancherel and compact-line induction.**

For G=SL(2,ℝ), K=SO(2) and the preceding fixed conjugacy, prove the full Plancherel theorem consuming M0's smooth/admissible-module comparisons and M1's Hilbert induction carriers. Fix the Haar measure and normalized model matrices, define the transform on compactly supported smooth left and right K-finite functions by the integrated operators π(f), and prove inversion, the Hilbert–Schmidt norm identity, its L² extension and surjectivity onto the stated measurable operator field. Prove the principal densities are positive and equivalent to dν for ν>0, and every discrete formal degree is positive; determine their scalar constants from that fixed Haar normalization. Establish the trace/character inversion and density estimates before using Parseval, then prove dense range by the corresponding test-operator fields. The measure is supported on principal and discrete families; complementary/trivial and ν=0 limit representations have no atoms. Compare [Lang, *SL₂(ℝ)*, Chapter VIII, pp.163–177](https://doi.org/10.1007/978-1-4612-5142-2_8), including its preceding trace calculations, by an explicit inducing-parameter, Haar and Casimir dictionary. Harish-Chandra's1952 note supplies historical context, not an assumed proof of the transform.

For Haar probability dk on K, define the right-character projection
`P_n^R f(g)=∫_K χ_n(k)f(gk)dk`; prove its range is exactly
`f(gk)=χ_n(k)⁻¹f(g)` and its bounded extension to L²(G).
Prove compatibility of Plancherel with these projections and hence, for every n∈ℤ,
`Ind_K^Gχ_n ≃ ∫_(ν>0)^⊕I_(n mod2,iν)dν ⊕ ⊕_(2≤l≤|n|,l≡n mod2)D_l^(sign n)`.
The discrete sum is empty at n=0. This is the Hilbert space of sections with `f(gk)=χ_n(k)⁻¹f(g)`, not the opposite-covariance space. Principal/discrete compact weights occur once. Under M4's normalized induction, prove `q_B=(1+ν²)/4` for I_(e,iν) and `q_B=l(2−l)/4` for D_l^±. M6 consumes this named unitary/measure comparison, including its measurable fundamental sections; a dual list alone supplies no Plancherel theorem.

**M4.Lorentz — normalized Lorentz principal and complementary carriers.**

For the zero orbit, normalize SL(2,ℂ)'s principal and complementary series separately. Put `a_t=diag(e^(t/2),e^(−t/2))`, `m_θ=diag(e^(iθ),e^(−iθ))`, `N≅ℂ`, and `δ_P(a_t)=e^(2t)`. Define `χ_(m,λ)(m_θ a_t n_z)=e^(imθ)e^(λt)` and use the same right-covariant induction convention `f(gp)=δ_P(p)^(−1/2)χ(p)⁻¹f(g)`. Gel'fand–Naimark’s literal character for `diag(ζ⁻¹,ζ)`, `ζ=r e^(iφ)`, is `r^(iρ_GN)e^(−inφ)`; evaluate `ζ=e^(−t/2−iθ)` to obtain `m=n`, `λ=−iρ_GN/2`. Prove the function-action/intertwiner comparison separately from this character identity. Use minimal-parabolic principal labels (m,λ) with m∈ℤ, λ=iρ, ρ∈ℝ, Weyl equivalence (m,ρ)∼(−m,−ρ), and center character (−1)^m. State normalized induction and the equivalence relation. The complementary series is only m=0; use the real parameter s in the definite Weyl half 0<s<1, not the principal-series symbol ρ. Identify endpoint limits: s=0's spherical principal member and s=1's trivial subquotient, specifying for each whether the induced module is irreducible, reducible, or has the stated constituent. Use [Gel'fand–Naimark (1947), §8 Eqs.187–188,194 and the p457 footnote](https://www.mathnet.ru/eng/im3007), with complementary literal character `r^(ρ_GN)` and real exponent `ρ_GN=2s`. Substituting `r=e^(−t/2)` gives λ=−s; do not substitute this real exponent into the principal character r^(iρ_GN). Pin the left induced action as `π(g)F(x)=F(g⁻¹x)` and the big-cell section `g_z=[[z,−1],[1,0]]`. For `g=[[a,b],[c,d]]` derive the spherical noncompact-picture action
`π_λ(g)φ(z)=|a−cz|^(−2−2λ)φ((dz−b)/(a−cz))`.
Fix once `J_alt=[[0,1],[−1,0]]` and its aliases `Q_flip=Q_sp=Q_zero=J_alt` throughout M4; the later stabilizer and zero-orbit formulas consume this same matrix. Put `α(g)=(g⁻¹)ᵀ=J_alt g J_alt⁻¹`. Prove that
`π_s(α(g))φ(z)=|bz+d|^(−2−2s)φ((az+c)/(bz+d))`
is precisely the source Eq.188; conjugation by π_s(J_alt) gives its equivalence
with our positive λ=s model. The literal complementary diagonal character has λ=−s,
whereas Eq.188's operator realization compares to λ=+s through this automorphism/intertwiner.
This operator comparison fixes the inducing
model independently of the literal diagonal-character identity above.
Transport the source Eq.187 invariant form, with kernel
`C|z−w|^(−2+2s)`, C>0, to this model, and prove positivity for 0<s<1.

**M4.Riesz — the complementary Lorentz Fourier carrier.**

Consume VonNeumannAlgebras V11's shared Haar/Plancherel layer and native `FourierTransform.fourierCLE` on native Schwartz Fourier-pair instances, `SchwartzMap.integral_inner_fourier_fourier` and `TemperedDistribution` Fourier/derivative adapters. Prove the sign/dual-evaluation comparison with V11's positive-character convention. Use the fixed transform `f̂(ξ)=∫exp(−2πi Re(conj(ξ)z))f(z)d²z`.
For the preceding positive complementary invariant kernel
`C|z−w|^(−2+2s)`: prove its Fourier quadratic form is
`c_s∫|f̂(ξ)|²|ξ|^(−2s)d²ξ`, where
`c_s=C π^(1−2s) Γ(s)/Γ(1−s)>0`. Derive the multiplier from
`|z|^(−2+2s)=Γ(1−s)⁻¹∫_(t>0)t^(−s)exp(−t|z|²)dt`
and the Fourier transform of the Gaussian, first on `C_c∞(ℂ)` with the required Fubini bounds. Prove this test space is dense in M4’s positive complementary completion: cut off its smooth compact-picture vectors in the noncompact chart and use their `|z|^(−2−2s)` decay and the locally integrable Riesz kernel to justify convergence of the quadratic form. Prove the Fourier image is dense in `L²(ℂ,|ξ|^(−2s)d²ξ)` by smooth frequency cutoffs away from zero, inverse Schwartz transforms and position cutoffs. Thus both completions agree, rather than assuming compact tests already exhaust the original model.
This is the shared model-specific Riesz/Fourier and completed-carrier
adapter, owned here before full graded models and M6 restrictions.

**M4.Angular — angular homogeneous distributions and normalized Weyl kernels.**

Own the angular extension of M4.Riesz on the same native Schwartz/tempered
Fourier carriers and V11's shared Plancherel normalization. Put k=|m| and
`P_m(z)=conj(z)^k` for m≥0, `P_m(z)=z^k` for m<0; these are harmonic
homogeneous polynomials. For −1<Reλ<0 prove the exact distribution identity

```
a_(m,λ)(ξ)=|ξ|^(2λ)phase(ξ)^(−m)=P_m(ξ)|ξ|^(2λ−k),
F⁻¹ a_(m,λ)=γ_(m,λ) T_(m,λ),
T_(m,λ)(z)=|z|^(−2−2λ)phase(z)^(−m),
γ_(m,λ)=i^k π^(−1−2λ) Γ((k+2+2λ)/2)/Γ((k−2λ)/2).
```

Powers of positive radii use the real logarithm. Prove the harmonic Gaussian
identity `F⁻¹(P_m exp(−πt|·|²))=i^k t^(−k−1)P_m exp(−π|·|²/t)`.
Insert the Mellin Gaussian integral for `|ξ|^(−2β)`,
β=(k−2λ)/2, and substitute u=π|z|²/t to obtain the displayed Gamma
constant. Justify the test-function Fubini bounds on the strip. This fixes
both the 2π factor and the inverse-transform phase, rather than importing
a differently normalized Hecke–Bochner formula.

Construct the meromorphic S′-valued families a and T on all λ∈ℂ by polar
coordinates and subtraction of the Taylor jet of each Schwartz test at0.
Prove weak holomorphic dependence off the poles, uniqueness of continuation,
the exact poles/residues, the finite-part/logarithmic scaling laws at poles,
and the Fourier identity as an identity of meromorphic distributions.
For m≥0 the poles of T occur at λ=k/2+j, j∈ℕ₀, with residues
`−π(−1)^k ∂_z^(k+j)∂_(conj z)^j δ₀/((k+j)!j!)`;
for m<0 interchange ∂_z and ∂_(conj z). The poles of a occur at
λ=−1−k/2−j and have the same derivative expressions with the opposite
sign. Prove these formulas from the angular Taylor coefficients, and
interpret values at poles as specified finite parts, not arbitrary extensions.

The reciprocal-Gamma zeros in γ at λ=k/2+j do not make its product with
T zero: T has a pole there. The continued product is exactly

```
F⁻¹[P_m(ξ)|ξ|^(2j)]
 = P_m((2πi)⁻¹∂) (−Δ/(4π²))^j δ₀.
```

Include all such delta-derivative limits and the numerator poles on the
opposite lattice. Only on the principal unitary range λ=iρ is the sole
exception (m,ρ)=(0,0), giving F⁻¹1=δ₀; all its other kernels have the
nonzero displayed coefficient. Check the normalizations
`γ_(0,−s)=1/r_s`, `r_s=π^(1−2s)Γ(s)/Γ(1−s)`,
`F⁻¹a_(1,−1/2)=i/z`, and `F⁻¹a_(2,0)=−pv(1/z²)/π`.
Establish Möbius covariance on convergent test-function charts first and
then continue the distribution identity with all local terms retained.
Prove the smooth intertwiner, distributional convolution and completed
unitary multiplier agree on their actual common domains. The angular
continuation and these model comparisons are owned by M4; the shared
Fourier/Plancherel carrier remains with its suppliers.

**M4.Endpoints — Lorentz endpoint sequences and classification.**

At s=1, Eq.194 is `C|∫φ(z)d²z|²`: prove that integration is invariant,
its kernel is the zero-integral submodule, and the Hilbert quotient is trivial.
Construct the separately metrized zero-integral submodule and prove its
equivalence to the principal member `(m,ρ)=(2,0)` in the source footnote.
For the opposite boundary λ=−1 construct the trivial constant submodule,
its quotient and the contragredient/intertwiner comparison; prove that the
nontrivial quotient is the same principal member. Give the exact invariant
submodule/quotient sequences on the specified smooth induced-function
spaces, endpoint forms and their radicals, and both boundary intertwiner
kernels/images. Prove the interior λ∼−λ equivalence and its degeneration
at the boundary, and the full irreducible classification and exhaustion.

**M4.ParticleLabels — little-group data and energy branches.**

Derive which little-group data yield massive spin, helicity, and continuous-spin models. Separate the two null-orbit time orientations and impose positive energy as an additional spectral restriction.

**M4.TypeI — null and Poincaré type-I/GCR comparisons.**

Prove the null little group Δ is type I by M2's criterion: its translation
dual has circle orbits and the origin, with compact closed stabilizers and
explicit Borel representatives. Also prove its irreducible images contain
nonzero compact operators by M2's orbit-slice GCR criterion,
applied here to these locally closed circles and the origin: their stabilizers
are finite or compact and their irreducible integrated images are compact.
This supplies GCR directly, without a type-I-to-GCR inference.
Transport type I and GCR to the ordinary null little group
E(2)=Δ/{±1}: pull back its factor and irreducible representations and use
the surjective finite-kernel C_c pushforward to compare their integrated images.
Together with compact SU(2) and M0's
SL(2,ℝ)/SL(2,ℂ) results, apply M2 to prove the connected Poincaré group and
its cover are type I. These are the hypotheses consumed by M6's Poincaré
direct-integral uniqueness and by the de Sitter contraction spectrum.

Determine the exact weak support of each finite-helicity null irreducible
`ρ_(ε_E,ℓ)`, with ε_E its energy orientation and Δ-character `exp(iℓθ/2)`:
`Supp ρ = {ρ} ∪ {inflate π_(ℓ,iν) : ν∈ℝ}`,
where π is this layer's normalized SL(2,ℂ) principal series, inflation
makes translations trivial, and `(m,ν)∼(−m,−ν)` is its Weyl equivalence.
Here `m_φ=δ(0,2φ)`, so ζ_ℓ(m_φ)=exp(iℓφ). The principal support
set depends on |ℓ| and is unchanged by ℓ↦−ℓ, while its explicit Mellin
intertwiner retains the signed character. For the ordinary quotient retain
precisely even ℓ. In particular prove that the zero-orbit part has no
supplementary or trivial terms, or principal terms with |m|≠|ℓ|;
the spherical principal endpoint ν=0 remains in the displayed family.
Use the following proof route, including its intermediate comparisons:

- Read off from the orbit model the subgroup identity
  `Res_H Ind_(NΔ)^(N⋊H)(χ⊗ζ_ℓ)=Ind_Δ^Hζ_ℓ`.
  Restrict to H=SL(2,ℂ) and consume M1/D3 induction in stages through
  `Δ=MN⊂P=MAN`. The radial null-cone measure is proportional to
  `E dE dΩ`; `x=log E`, `g(x,ω)=e^x f(e^x,ω)` gives its unitary
  Mellin transform with Lebesgue frequency measure. Prove the resulting
  direct integral is the full principal family with fixed label m=ℓ,
  using the pinned normalized induction and character, not a guessed
  physical-helicity sign. Establish that this parameter family is closed
  in the full H-dual and its relative topology is the usual real parameter
  topology modulo Weyl. After this layer's SL(2,ℂ) classification, prove
  the two consumed assertions of
  [Fell (1961), §V, Theorem5.1](https://doi.org/10.1007/BF02545788):
  the principal subset is closed in the full dual, and its parametrization
  by `Z₁={(m,q):m≥0 integer,q∈ℝ,q≥0 if m=0}` is a homeomorphism.
  Build the compact-K-type operator field from the normalized induced
  coefficients, prove its continuity/norm and kernel-separation properties,
  and derive those topology assertions by Fell's operator-field argument.
  Match Fell's actual noncompact-picture operators with ours, including
  their inverse Möbius actions, to prove the frequency conversion ν=−q/2;
  comparing an operator multiplier directly with an inducing character
  does not establish that dictionary.
  For the disintegration do not assume induction commutes with a direct
  integral: diagonalize the commuting unitary right A-action by the radial
  Fourier transform and compute each H-action fiber explicitly. Use one
  fixed compact-picture Hilbert space of U(1)-covariant L² sections on
  SU(2), with ν↦π_ν(g) strongly continuous. Prove
  ν↦‖π_ν(a)‖ lower semicontinuous for every a∈C*(H). Lebesgue full
  support then gives `ker(∫π_ν dν)=∩_ν kerπ_ν`; with the proved closed
  parametrization this identifies the entire weak support, not just a.e. fibers.
- Construct the homogeneous helicity-line-bundle radial transport and prove
  `D_t f(p)=t⁻¹f(p/t)` unitary for the degree2 null-cone measure, commuting
  with H, and `D_t⁻¹ρ(a,h)D_t=ρ(ta,h)`. As t→0 prove strong convergence
  to the inflated H-restriction uniformly on compact group subsets, using
  compactness of the H-orbit of a fixed vector over compact H-sets. This
  proves every displayed zero-orbit principal member weakly contained in ρ.
- For the converse, the integrated orbit model annihilates the ideal
  `C₀(N̂∖(O_ε_E∪{0}))⋊H`. Identify the corresponding group C*-quotient
  as `B=C₀(O_ε_E∪{0})⋊H` and its invariant-open-orbit ideal as
  `I=C₀(O_ε_E)⋊H`, using D1's full crossed-product exactness and the
  translation Fourier transform. Consume D3's Green imprimitivity for
  `C₀(H/Δ)⋊H` and HilbertModules H3's Rieffel ideal and representation transport: under
  this equivalence ρ|I corresponds to the one-dimensional character ζ_ℓ.
  An irreducible representation of B either restricts nontrivially and
  nondegenerately to I, or factors through B/I=C*(H); prove this ideal
  dichotomy directly. Prove the character's maximal kernel excludes every other nonzero-orbit irreducible,
  and use uniqueness of extension of a nondegenerate ideal representation
  to B to recover ρ. For a zero-orbit inflation, restriction to H and
  weak-containment preservation under restriction force its H-label into
  the closed principal family just computed.

Compare the Mellin realization with
[Banerjee (2018), §4](https://arxiv.org/abs/1801.10171), including its
rotation-action convention; record any confirmed phase/weight sign mismatch
as a source discrepancy, retaining the independent M4 character convention.
This weak-support theorem is about a fixed
Poincaré irreducible; M5 must separately prove its de Sitter family upper
bound before using this support as an exact contraction row.

Own the Lorentz multiplier specialization of Layer P.4's smoothing,
integration and Whitehead lemmas: `H²_lc(SO₀(3,1),𝕋)≅ℤ/2`, using its semisimple Lie algebra,
π₁=ℤ/2 and the simply connected SL(2,ℂ) cover. Its nontrivial circle
extension is `(SL(2,ℂ)×𝕋)/⟨(−I,−1)⟩`; prove the pushout and absence of
a global continuous section by restriction to the SO(3) maximal compact.
Distinguish the literal two-component SO(3,1): prove its decomposition as
SO₀(3,1)×{±I₄}, its unitary circle-extension classification (again ℤ/2,
using absence of connected-component characters and trivial circle H² of the
cyclic component group), and its separate unitary/antiunitary ray alternatives. In the antiunitary
component case compute `H²(ℤ/2,𝕋_conjugation)≅ℤ/2`: for its unique
nonidentity element t, the normalized value ω(t,t) is ±1 and is unchanged by a coboundary,
recording the square of the antiunitary PT lift. Prove the mixed terms
vanish using the absence of connected Lorentz characters, and compare
this sign with the independent spin-extension class.
The spin extension does not make an unsupported claim about globally continuous
multipliers on either component group.

Prove that the represented translation quadratic polynomial on the Gårding domain has closure equal to the joint-calculus q(P): the latter is self-adjoint and extends the polynomial action, so M0's essential-self-adjointness/core comparison and maximality identify the two. Include the physical ℏ/sign conversion above in this equality.

Define parity and time reversal as automorphisms of the covered group and define their implementation on rays. Prove the unitary/antiunitary alternatives with the ray-space hypotheses; do not use the false inference that every group element has a square root. Give the explicit counterexample `−[[1,1],[0,1]]∈SL(2,ℂ)` and prove directly that it has no square root. Show a Euclidean spacetime group enlarged by time reversal can act antiunitarily. Consume M0's single Gårding/derived-action and central closure API. For each Hermitian Casimir polynomial C, pin its ordering, involution and scalar normalization, verify M0's elliptic-commutation hypothesis and transport its self-adjoint closure to the induced model. Give the actual orbit-coordinate differential formulas and domain comparisons. Construct C-analytic vectors with explicit bounds `‖Cⁿv‖ ≤ C_v R_vⁿ n!` using M0's post-closure spectral-cutoff/core estimates, and compute Casimir values on that common domain. The Lie-algebra matrix units are not an operator-domain argument.

**M4.SpatialLocalization — fixed-time covariant localization.** Use the connected covered Poincaré group `G_P=ℝ⁴⋊SL(2,ℂ)` and its fixed-time spatial subgroup `G_sp=ℝ³⋊SU(2)`, embedded with zero time translation. Let R(u) be the spatial restriction of M4's Hermitian Lorentz action, with its existing comparison to the M3 rotation carrier. Prove the continuous spatial subgroup embedding and write `(a,u)(b,v)=(a+R(u)b,uv)` and `(a,u)·x=a+R(u)x` on the standard Borel space `X=G_sp/SU(2)≃ℝ³`. For a strongly continuous unitary representation ρ on a complete complex Hilbert space H, define spatial sharp localizability by existence of a normalized SAST projection-valued measure P on X with `ρ(g)P(E)ρ(g)⁻¹=P(g·E)` for every g and Borel E. This definition requires neither boost covariance of one PVM on X nor a PVM on all of spacetime. It is the fixed-time spatial version used here of the one-particle Wightman localizability problem.

Prove the exact criterion, with no Hilbert-cardinality restriction: such a pair (ρ,P) exists iff `ρ≃Ind_(SU(2))^(G_sp)σ` for a strongly continuous unitary SU(2)-representation σ. On `L²(ℝ³,dx;K_σ)` give its canonical pair explicitly by `T_σ(a,u)f(x)=σ(u)f(R(u)⁻¹(x−a))` and `P_σ(E)f=1_E f`. Prove unitarity, strong continuity, normalization, strong countable additivity and covariance, and construct the inducing unitary as a unitary of both group and PVM data. Lebesgue measure is invariant, so this formula has no additional RN/modular factor; changes to an equivalent quotient measure consume M1's single square-root density transport. The zero Hilbert space is the σ=0 case; nonzero selected particle models below have nonzero H.

M1's general imprimitivity theorem is stated for separable Hilbert spaces. Own the following bounded spatial extension of that theorem, rather than silently applying it to arbitrary H. Consume OperatorAlgebraDynamics D1 for the integrated covariant representation, its L¹ norm bound, full crossed product, recovery of the pair and nondegenerate multiplier extensions. For this action prove `A_sp=C₀(ℝ³)⋊G_sp` separable: construct countably many dense coefficient functions and a countable precompact Borel ring covering G_sp; rational finite-range compactly supported coefficient-valued simple functions are L¹-dense by finite-Haar compact truncation and regularity, and D1's norm bound and compact-support density give a countable dense image in A_sp. Use CStarAlgebras' existing representation/approximate-unit vocabulary; no new crossed-product or PVM carrier is introduced.

Integrating a normalized PVM gives a nondegenerate C₀(X)-representation. Decompose its nondegenerate A_sp-representation into an arbitrary orthogonal Hilbert sum of cyclic reducing summands. Each is separable by the countable dense algebra. Prove the reducing projections commute with the recovered coefficient and group multiplier actions by the nondegenerate multiplier extension; use spectral uniqueness/bounded Borel approximation to show they also reduce P. Apply separable M1 on each summand. Assemble their inducing representations and pair intertwiners by the actual unitary `⊕_i L²(X;K_i)≃L²(X;⊕_i K_i)`: first on finite-component functions, then by density of Bochner L² simple functions and finite-coordinate approximations to their finitely many values. Do not interchange an uncountable sum and an integral without this argument. Conversely, construct the displayed canonical pair for arbitrary σ using finite simple-tensor density and the unitary norm-one bound for continuity. This retains the all-H criterion without claiming that M1's separable statement already supplies it.

The selected irreducible Poincaré orbit models, and their finite sums below, are separable by their explicit lcsc induced carriers (or cyclicity and separability of the group C*-algebra); retain that hypothesis in the measurable-field comparison, without restricting the preceding arbitrary-H criterion. For each selected positive-energy Poincaré model `π≃Ind_H^{G_P}τ`, compute `Res_{G_sp}π` by the explicit spatial restriction adapter below, retaining orbit measures, multiplicities and stabilizer representations, and apply the criterion to that restriction whether or not it is irreducible. State the resulting classification as an exact target: massive models of mass m>0 and spin j restrict to the Euclidean induced model with fiber `D_j`; a finite direct sum of positive-energy massless finite-helicity models is localizable iff its `Spin(2)` weight multiset is the restriction of a finite-dimensional unitary `SU(2)` representation. Thus helicity zero and the doubled ±1/2 pair are localizable, while a single nonzero helicity and the photon pair ±1 are not (every `SU(2)` module containing weight ±1 also contains weight 0). The massless continuous-spin models are not localizable, in either central-character sector of the covered Poincaré group. Use `Spin(2)=SU(2)∩Δ`, the spatial-direction stabilizer of the null representative, with `δ(0,θ)` for θ modulo 4π and inducing label `h_ind=ℓ/2`, character `exp(i h_ind θ)`. Keep M4's physical helicity dictionary `λ=ε_E ℏℓ/2`; the localization classification is invariant under reversal of all weight signs. The restricted little-group fiber has each inducing weight `h_ind∈ℤ` once in the sector where −I acts as +1, and each `h_ind∈ℤ+1/2` once in the sector where −I acts as −1. The diagonal boost a_t commutes with this Spin(2), so the same rotation-fiber decomposition holds on every nonzero radial momentum orbit. Prove the two decompositions from the induced little-group model, including their multiplicities. A unitary `SU(2)` representation decomposes as a Hilbert direct sum of finite-dimensional spin-j irreducibles. Central-character compatibility restricts j to nonnegative integers or positive half-odd integers respectively. Unbounded spins would force infinite multiplicity of weight 0 in the first sector or weight 1/2 in the second, since each such irreducible contains that weight once. Bounded spins cannot supply the unbounded required weights. Prove this obstruction using the restriction criterion, which allows arbitrary unitary K-representations. For the fiber-comparison step, first prove every Euclidean representation intertwiner intertwines the translation PVMs by spectral uniqueness. The criterion allows arbitrary unitary σ; an equivalence with the separable Poincaré model forces σ separable, since its Euclidean induced space contains an isometric copy of σ as constant fiber sections times a normalized indicator of a finite positive-volume annulus. Prove that elementary embedding before invoking measurable fields. After transporting both translation momentum spectral measures to their common Lebesgue measure class on `ℝ³\{0}`, apply V4.0.Fields' early two-field decomposable-map and measure-change interface, then M1's transitive imprimitivity uniqueness on almost every radial sphere, to obtain equality of the Spin(2) fiber representations with their full multiplicities. Obtain a common full-measure radial set first for a countable dense rotation subgroup, then extend to all rotations by strong continuity. These are the momentum PVMs fixed by the translation representation, not a claim that an arbitrary group intertwiner preserves a chosen localization PVM. This M4 adapter uses the early V4.0.Fields/M1 interfaces, not the later M6 tensor-decomposition theorem. The multiplicity of weight 0, respectively 1/2, is exactly one, so any candidate SU(2) module is one copy of one spin representation, which cannot supply the unbounded required weights. Both sectors and their multiplicities follow from M4's own stabilizer construction. [Iverson–Mack (1970)](https://doi.org/10.1103/PhysRevD.2.2326) records the half-odd-integer sector's physical application; it is not the proof of this localization obstruction. Treat zero-momentum representations separately: the translation-trivial model is not equivalent to induction over all of ℝ³. Prove the double-coset decomposition and these fiber identifications under the stated positive-energy and orbit hypotheses. This is a one-particle localization theorem, not a local quantum field theory.

Own the following spatial restriction adapter on M1's normalized induced carriers. Reuse native `ContRepresentation.restrict` and `IsUnitary.restrict` for precomposition with the subgroup homomorphism; prove strong orbit continuity by composition with its continuous inclusion. In the massive case choose the rotation-equivariant positive standard boost `b_m(p)=sqrt(X(p,E_m(p))/m)` in the existing Hermitian model, where p∈ℝ³ and `E_m(p)=sqrt(m²+|p|²)`, so `b_m(R(u)p)=u b_m(p)u⁻¹` and the spatial rotation cocycle is u itself. For a null four-momentum `(p,E)=(rω,r)`, r>0, choose the Borel rotation section `k(ω)` of `SU(2)/Spin(2)` and `s(p)=k(ω)a_(log r)` sending the fixed null representative to p. The diagonal boost commutes with Spin(2), so the rotation cocycle is the compact-induction cocycle of the restricted little-group representation on every radius. Prove the Borel quotient/section identities, the actual polar-measure disintegration and the norm/density identities of these restriction unitaries. On a null radial sphere a supplied Spin(2)-intertwiner `C:K_τ≃K_σ` gives the fiber gauge `F(k(ω))↦σ(k(ω))C F(k(ω))`, converting compact induction to the σ-valued rotation model. Verify section independence and equivariance. This is the specific M4 restriction calculation, not an assumption of an unstated general subgroup theorem or the later M6 tensor decomposition. The explicit radial quotient and unitary constructions are proved here from the existing induction formulas; no general subgroup theorem is assumed for this step.

For every admitted selected particle model above, export a specified unitary `W:H_π≃L²(ℝ³;K_σ)` intertwining its spatial restriction with T_σ, and define its supplied localization by `P_π(E)=W⁻¹P_σ(E)W`. Construct W from the Mackey restriction/fiber equivalence, the actual positive square-root density change from the chosen momentum orbit measure to Lebesgue measure, and the scalar Plancherel unitary `ℱ_ℏ f(p)=(2πℏ)^(−3/2)∫exp(−ip·x/ℏ)f(x)dx`, initially on Schwartz vectors and extended by V11's Plancherel theorem, then componentwise to the finite spin fiber. Use its inverse to pass from momentum to the displayed position model. The null momentum origin is a null set in those models. Retain the physical translation character `exp(−ip·a/ℏ)` of M4; derive the Fourier sign and density normalization from it, rather than replacing the orbit measure by an unnormalized formula. The finite-helicity criterion is constructive: a matching SU(2) module and its Spin(2) fiber unitary give W and hence P_π. Zero-translation models on nonzero H are excluded: translation covariance would identify projections of disjoint translates of every bounded set, forcing those projections to vanish and then P(X)=0, contrary to normalization.

Export unitary transport of the full covariant pair `(ρ,P)↦(VρV⁻¹,VPV⁻¹)`, and the induction section/measure-change and spin-fiber intertwiners as intertwiners of both data. Preserve the freedom in the supplied inducing unitary/localization choice: arbitrary intertwiners of the spatial group representation need not preserve an independently chosen position PVM. In particular the earlier translation-PVM uniqueness argument concerns momentum. The supplied pair transport is the exported interface; normal states on the generated abelian von Neumann algebra, their event laws, real-Borel marginal pushforwards and simultaneous state transport are not part of this roadmap and are not prerequisites for constructing this system. Keep M4's existing full-spacetime normalized sharp-PVM/positive-energy obstruction separate and unchanged; no field-locality or local-net theorem follows from spatial localization.

### Full four-component Poincaré multiplier representations

Define the covered extended group intrinsically as
`P_ext=(ℝ⁴⋊SL(2,ℂ))⋊F`, with `F=⟨S,T | S²=T²=1, ST=TS⟩≅C₂×C₂`.
Here S reverses the three spatial coordinates and T reverses time,
in M4's spatial-first, time-last signature. Both act on SL(2,ℂ)
by `A↦(A†)⁻¹`, whose restriction to SU(2) is the identity; ST acts
trivially on SL(2,ℂ) and as −Id on translations. Prove these are
compatible automorphisms of the connected semidirect product and
supply the semidirect-product reassociation. Do not substitute the
ordinary Lorentz group for its cover in this definition.

In these full-group tables ε:F→ℤ/2 always denotes the grading;
ε_E∈{±1} denotes energy orientation, ξ_S a reflection sign, and
t_F(S^uT^v)=v mod2, r_F(S^uT^v)=u+v mod2; use their 0/1 representatives in matrix exponents. Write F_E=ker(ε+t_F) for
the energy-preserving component subgroup. Compact subgroups retain K;
pointwise complex conjugation is C_conj. The M5 ambient signature
entries ε_a and the antisymmetric tensor ε^(μνρσ) are separate indexed
objects, not energy labels.

Every continuous grading factors through F. For each of its four
gradings classify normalized Borel multipliers up to graded Borel
coboundary. Prove that every Borel character of the connected
covered group L is trivial and that `H²_Borel(L,𝕋)=0`. Use M1's
twisted-regular comparison to represent each Borel class by Layer P.3's
locally continuous extension cocycle, then consume its smoothing
and integration. Prove the Poincaré Lie algebra is perfect and has
vanishing central second cohomology (including the absent
Lorentz-invariant alternating 2-form on translations), and use
simple connectedness of L to split the resulting smooth extension.
M1's Borel-to-locally-continuous comparison carries that splitting
back to the original Borel class. After that perfectness proof apply M1's generic perfect-character lemma
to conclude that every Borel character of L is trivial. A splitting over L is therefore unique;
conjugating it by any component lift preserves it.
Deduce that inflation gives
`H²(F,𝕋_ε)≃H²_Borel(P_ext,𝕋_ε)`, with the chosen multiplier trivial on
L and on all cross terms. For injectivity, a Borel cochain
trivializing an inflated multiplier restricts to a Borel character
of L, hence is1 there; the normalized cross equations then make it
constant on each L coset, so it descends to a cochain of F. This
is a theorem about this covered extension, not a claim that the
ordinary connected Poincaré group has trivial spin multiplier class.

Use the following normalization of F. Begin with lifts in the
abstract graded circle extension E_(ε,ω), so no operator realization
is assumed. For trivial grading choose lifts A over S and B over T,
and normalize A²=B²=1 by kernel-circle phases. Then BA=cAB with
c∈{±1}, giving exactly two multiplier classes. For a nonzero grading
choose A over the nonidentity element of kerε and B over an odd
generator, using this fixed basis:

| (ε(S),ε(T)) | A | B |
| --- | --- | --- |
| (0,1) | S | T |
| (1,0) | T | S |
| (1,1) | ST | S |

Normalize the even lift by A²=1. The odd lift conjugates kernel
phases, so its square is B²=β∈{±1}, and BA=cAB with c∈{±1}.
Both signs are unchanged by any remaining kernel-phase choice.
The other odd lift AB has square cβ. With F coordinates
`A^aB^b`, a,b∈{0,1}, use representatives

```
ω_(c,β)((a,b),(a′,b′)) = c^(b a′) β^(b b′).
```

The all-unitary representatives have β=1. Prove the graded cocycle
law, the reduction of every cocycle to these representatives and
inequivalence of the signs. Thus there are two classes for the
trivial grading and four for each nonzero grading, fourteen in all.
This counts grading/multiplier classes, not fourteen irreducible
representations or fourteen ray actions.

The translation PVM transforms under the **graded** momentum action

```
p ↦ (-1)^ε(g) Λ(g)p.
```

Prove it from the N-character `exp(i⟨p,a⟩_η/ℏ)` and conjugation
of scalars by odd operators. Use the dictionary's time-orientation character t_F, with t_F(S)=0 and t_F(T)=1. A future nonzero timelike or null
connected orbit is preserved exactly by `ker(ε+t_F)`. Consequently
the full group preserves a single such future orbit only for
`ε(S)=0, ε(T)=1`. For the other three gradings future and past
connected orbits are paired. All spacelike and zero connected
momentum orbits remain in scope; spacelike orbits admit no real
mass square root. Translation-trivial zero-orbit models are also
positive-energy (H=0) and are not excluded by this nonzero-shell
statement.

For every connected irreducible in M4's complete list, use M1's
finite-index graded Clifford theorem: compute the actual finite
F-action on its energy/orbit and little-group labels, its stabilizer
F_π, the semilinear V_f and their κ_π cocycle, and classify the finite
multiplier representations of F_π with multiplier ω/κ_π. Construct
the induced full-group model and prove inequivalence/exhaustion.
This includes both timelike signs, spacelike principal/discrete/limit
little-group families, both null signs with finite-helicity and
continuous-spin central sectors, and every Lorentz label at zero
translation momentum. A chosen physical restriction of that list
is stated in its application, not used to remove these cases.
Give the ordinary-group descent and the projective spin-extension
comparison separately; killing the covering center requires its
actual character to be trivial.

### Ordinary quotient and graded spin pushout

Keep the covered extended group `P_ext` above and define the ordinary
full group `P_ord=P_ext/⟨z⟩`, where `z=(0,−I,1_F)`.
Prove that z is central, even, fixed by every component automorphism,
and has order2. Use Layer P.2's topological graded operator group
`UA(H)=U(H)_s⋊C₂` (after choosing a conjugation) and
`PUA(H)=UA(H)/𝕋`; kernel phases are conjugated by odd operators.
These are the graded operator quotients, with Layer P.1's dimension
hypotheses retained when identifying their faithful action on rays.

Own a reusable discrete-central-quotient theorem before applying
it to the tables. If an even discrete central kernel Z acts by a
character χ in a graded operator model, compatibility requires
`χ(k)=χ(k)^((-1)^ε(g))` for every g,k. Thus an odd element forces
the central character to be real-valued; in the present order2
kernel this is automatic. Normalize the covered model as above:
its restriction to the connected cover L is genuine and its
multiplier is the fixed continuous inflation ω of F. Write
`χ_η(z)=η∈{±1}`. With f,g the component labels, form the actual
topological group

```
(u,x)(v,y)=(u v^((-1)^ε(f)) ω(f,g),xy),
E_(η,ω)=(𝕋×_(ε,ω)P_ext)/{(χ_η(k)⁻¹,k):k∈⟨z⟩}.
```

Use native `Circle`, actual group structures and native normal-subgroup
quotients for these carriers. Prove the subgroup being divided out
is closed and normal by the semilinear character condition; prove
the quotient map to P_ord has kernel 𝕋 and local continuous sections.
Prove the graded pushout universal property for ω=1, with the
required conjugation of circle phases. For general ω identify
E_(η,ω) as the Baer sum of that spin pushout and the inflated
finite-component extension, and prove the corresponding universal
property for compatible ω-projective lifts. This circle kernel is central for ε=0; for nonzero
grading odd elements conjugate it, so this is a graded circle
extension, not a central extension of the entire group. Over the
connected ordinary group it is the trivial circle extension for
η=+1 and the spin pushout for η=−1. In particular restriction of
the latter to rotations is
`(SU(2)×𝕋)/⟨(−I,−1)⟩≅U(2)`.
On the standard complement `{(0,I,f):f∈F}`, the finite-component
c,β relations remain exactly those already fixed above; do not replace them by the effective fiber multiplier
ω/κ_π.

For a nonzero representation space and a covered fixed-ω model U
with `U(z)=η Id`, prove
`[u,x]↦uU(x)` is a strongly continuous genuine graded
representation of E_(η,ω), of circle weight1. Prove the converse
and transport this correspondence through M1's induction maps.
The ray homomorphism factors continuously through P_ord exactly
when the covering kernel acts by scalars. An irreducible full
graded model has one η: the ±1 eigenspaces of U(z) are invariant.
M1's connected summands and their finite multiplicity spaces
retain this same η, because every component fixes z and conjugates
only its already real scalar value. Multiplicity doubling of a spin module or
pairing its connected orbit branches never cancels that scalar.
A direct sum of both central signs has no ordinary ray descent
on its full projective Hilbert space.

For a normalized global Borel section s of the finite cover,
locally continuous near1, put
`k(g,h)=s(g)s(h)s(gh)⁻¹∈⟨z⟩`. The ordinary projective model has

```
Ω_(η,ω)(g,h)=ω(f(g),f(h)) χ_η(k(g,h)).
```

Prove the graded cocycle law and the section-change law
`Ω'=b(g)b(h)^((-1)^ε(g))b(gh)⁻¹Ω`,
where `b(g)=χ_η(a(g))` for `s'(g)=a(g)s(g)`;
arbitrary operator phase changes obey the same law. Construct
the Borel section from countably many local cover charts while
retaining its local continuity near1. Prove the graded extension
topology/local-conjugation comparison using M1's graded circle-extension
block; Layer P.3 supplies its central restriction over L. A Borel cocycle does not give a topological group with
the naive product topology. For η=−1 no global continuous phase
lift or globally continuous cocycle representative exists in this
extension class: its rotation restriction is the nontrivial spin
circle bundle. For η=+1 the covered operators descend to a global
strongly continuous fixed-ω lift on the ordinary group.

Using the covered classification and the absence of Borel
characters of L, prove completeness and inequivalence of the
ordinary locally continuous/Borel graded extension classes:
the independent invariants are η and the existing finite
c,β signs. Restriction recovers η, and after that spin pushout
is removed the remaining class inflates uniquely from F.
There are four classes for ε=0 (η,c), and eight for each nonzero
grading (η,c,β), twenty-eight in all. These count extension
classes, not irreducibles or ray maps. Fixed-multiplier
complex-linear equivalence remains the convention in the tables.
Prove the exact coarser projective-equivalence criterion for two
canonical covered models U,V: their ordinary ray maps are
complex-linearly unitarily equivalent iff their η,c,β agree and
`V(x)=b(f(x)) WU(x)W⁻¹` for a unitary W and a graded1-cocycle b
of F. On L the phase ratio is a character and hence1, so no
additional connected labels are identified. For ε=0 these b have
b(A),b(B)∈{±1}; for nonzero ε they have b(A)∈{±1} and arbitrary
b(B)∈𝕋. Apply this finite rephasing action to each table, including
its possible stabilizers. In particular pairs of massive/null
models differing only by displayed even reflection signs are
identified by the corresponding b(A), or also b(B) in grading (0,0).
Apply this also to the spacelike and zero-translation tables. For their
explicit F-stabilizers all free even reflection-sign choices lie in
one such rephasing orbit; the connected-label orbit, extension class
and derived multiplicity remain fixed. Do not count these free sign
choices as distinct ray models.

Distinguish three descent assertions. If η=+1, the chosen operators
descend with the same finite multiplier ω. If η=−1, only their ray
map descends, with the nontrivial spin factor in Ω. A genuine
ordinary graded group representation, possibly after an allowed
phase change, exists precisely for η=+1 and trivial finite class:
c=+1 for ε=0, and c=β=+1 for a nonzero grading. Normalize any
claimed change against the genuine connected-cover lift; its
uniqueness follows from the absence of connected-cover
characters. Setting U(z) to1 by an arbitrary phase while changing
its connected multiplier does not remove the spin obstruction.

Read the actual central sign from every already-defined connected
label, and prove the same value on all its full F-orbit members:

| Connected family | η at z=−I |
| --- | --- |
| Timelike spin j, either energy orientation | `(−1)^(2j)` |
| Spacelike principal `I_(e_par,ν)` | `(−1)^e_par` |
| Spacelike complementary, trivial | +1 |
| Spacelike `D_n^±`, n≥2, and both n=1 limits | `(−1)^n` |
| Null finite helicity `h=ℓ/2`, either energy orientation | `(−1)^ℓ` |
| Null continuous spin `C_(ε_E,ρ,e)` | `exp(2πie)` |
| Zero-orbit Lorentz principal `(m,ρ)` | `(−1)^m` |
| Zero-orbit Lorentz complementary, trivial | +1 |

Endpoint submodules/quotients inherit the center of their
parent induced module; the stated zero-orbit boundary member
(m,ρ)=(2,0) has η=+1. Likewise compact-line induction from χ_n
has η=(−1)^n on every constituent. Prove ordinary genuine
connected descent by η=+1 and keep all η=−1 labels in the
ordinary projective spin sector. This contract applies to all
four gradings and every massive, spacelike, null and zero-orbit
row; it neither replaces the full spacelike/zero
finite-intertwiner tables nor removes any of their cases.

**Massive spin/reflection acceptance table in the normalization above.**
Let m>0, j∈½ℕ₀ and `ν_j=(-1)^(2j)`. Each connected massive model
has the spin-j module D_j. Consume
[M3's compact-spin antiunitary structure](#layer-6-m3--euclidean-galilei-and-bargmann-models):
J_j commutes with SU(2), satisfies J_j²=ν_j and is unique up to phase.
Its square is unchanged by that phase. With the reference choice
V_f=J_j^ε(f), the displayed κ_j is unchanged; arbitrary intertwiner
phase choices give cohomologous cocycles. At a rest momentum,
the full graded momentum stabilizer is
`SU(2)×F_E`, `F_E=ker(ε+t_F)`. The reflection automorphisms restrict to
the identity on SU(2), and the spin semilinear cocycle is
`κ_j(f,h)=ν_j^(ε(f)ε(h))` on F_E. Thus its multiplicity data have
multiplier ω/κ_j. Prove the following exhaustive table for these
nonzero timelike models; all labels distinguish fixed-multiplier
representations under complex-linear unitary equivalence.

- For ε=0 and either c, F_E={1,S}. There are two models for each
  (m,j), labelled by future-branch parity ξ_S=±1, each containing one
  future and one past connected spin-j model. Use the same spatial
  pullback reference on the past shell as on the future shell:
  `(S_±ψ)(p)=ψ(Sp)`. The unitary time-reflection reference from
  future to past is `(T_(+→−)ψ)(p)=ψ(Tp)`, with spin identity.
  Verify `T_(+→−)π_+(l)=π_-(α_T(l))T_(+→−)` and that it commutes with the
  two spatial pullback references. Ordinary Schur on each connected model
  makes the actual off-diagonal U_T a scalar multiple of this
  reference. Hence the past parity is cξ_S from TS=cST. Neither
  model has only future energy support.
- For ε(S)=0, ε(T)=1, F_E=F. Each energy orientation is independently
  allowed; future models satisfy the positive-energy condition.
  The following counts are for each energy orientation. If c=1 and
  β=ν_j, there are two undoubled models, parity ξ_S=±1.
  If c=1 and β=−ν_j, there are two models, parity ξ_S=±1, each with
  connected spin multiplicity2. If c=−1, for either β there is one
  model with connected spin multiplicity2; S has opposite parity
  on its two spin copies and antiunitary T exchanges them.
- For ε(S)=1, ε(T)=0, F_E={1,ST}. The stabilizing antiunitary has
  square δ=cβ. There is one model per (m,j) for each fixed (c,β),
  with one future and one past branch, spin multiplicity1 on each
  branch if δ=ν_j and multiplicity2 if δ=−ν_j. There is no further
  unitary parity label in F_E.
- For ε(S)=ε(T)=1, F_E={1,T}; its antiunitary square is again δ=cβ
  in the basis A=ST, B=S. The same multiplicity1/2 rule applies,
  with future and past paired and no further parity label in F_E.

Construct the finite multiplicity models explicitly. In the full
F_E=F graded case, put d=βν_j. If c=1,d=1 use a one-dimensional
real structure with A=ξ_S. If c=1,d=−1 use a two-dimensional
quaternionic structure with A=ξ_SId. If c=−1 use

```
W_A=diag(1,−1),
W_B=[[0,d],[1,0]] ◦ complexConjugation.
```

This has W_B²=d and W_BW_A=−W_AW_B and is irreducible. For an odd
C₂ stabilizer, square+1 has the one-dimensional real model and
square−1 the two-dimensional quaternionic model; tensor with J_j
as M1 specifies. Prove irreducibility/exhaustion from the A-eigenspaces
and their antiunitary interchange. Antiunitary squares cannot be
changed by a scalar phase. Doubling a half-integral spin does not
kill the covering center: it still acts as −Id, so genuine descent
to the ordinary group requires integral j.

For explicit massive momentum intertwiners use the rotation-free
positive Hermitian boost B_p from rest, so `B_(Sp)=B_p⁻¹` and
`σ(B_p)=B_p⁻¹`, σ(A)=(A†)⁻¹. Spatial parity pulls sections back
by p↦Sp with spin identity; antiunitary time reversal uses the
same pullback and J_j. The former squares to1, the latter toν_j,
and they commute in this reference spin model. Antiunitary ST
acts pointwise by J_j. Verify these statements against the actual
Wigner rotation and N phase, then tensor with the compensating
finite multiplicity data and apply M1 induction. This fixes the
spin/reflection table in the displayed c,β normalization.

Parthasarathy, [*Projective Unitary Antiunitary Representations of
Locally Compact Groups*, CMP15 (1969),305–328](https://doi.org/10.1007/BF01645530),
§§3–5, is a reference for graded imprimitivity and the covered
extended-group/massive classification. The semidirect-product
comparison above is the Lemma5.1, p.323 comparison cited in Dooley
p.23. For each source cocycle, compute its grading, lift squares
and commutator, normalize them by the preceding recipe, and give
an explicit cochain whenever the resulting class agrees with the
stated source label. Compare the massive assignments by their
actual operator relations and connected multiplicities. If a source
formula or assignment conflicts with those relations, identify the
specific failed identity and state the corrected formula as a
confirmed source discrepancy. The displayed c,β relations remain
the definitions; a source label alone supplies neither a cocycle
formula nor a spin/multiplicity constraint.

### Null models of the full graded extended Poincaré group

Use the covered full group, grading ε, finite multiplier signs c,β and
canonical F bases fixed above. Distinguish the energy orientation
`ε_E∈{+1,−1}` from the grading. At reference energy r₀>0 take
`p_(ε_E,r₀)=(0,0,ε_E r₀,ε_E r₀)` and the exact M4 null lift

```
δ(w,θ)=[[exp(iθ/2), w exp(−iθ/2)],[0,exp(−iθ/2)]],
θ∈ℝ/4πℤ.
```

Use the common dictionary `H_(ε_E,h)=ρ_(ε_E,2h)=F_h^ε_E`.
Write `H_(ε_E,h)` for the connected finite-helicity model with
`h=h_ind=ℓ/2∈½ℤ` and little character exp(ihθ). Its central value
is `η_h=(-1)^(2h)`. Its invariant Pauli–Lubanski coefficient is
`κ_PL=ℏh`, while its physical helicity is `ε_E ℏh`. These two labels
are not interchangeable on the past branch.

Write `C_(ε_E,ρ,e)` for a connected continuous-spin model, with
little translation character `w↦exp(i Re(conj ζ w))`, |ζ|=ρ>0,
and covering-center parity e∈{0,½}, `η_e=exp(2πie)∈{±1}`. The
parameter ρ belongs to the little ℂ and has no implicit spacetime
χ_p or ℏ normalization. Prove the conversion to the physical
Pauli–Lubanski radius

```
q(W)=−varrho² Id,    varrho=ℏ r₀ ρ.
```

Under a change of null reference energy r₀↦exp(t)r₀, the transported
little radius is ρ↦exp(−t)ρ, so varrho is independent of that
choice. The prescribed representative r₀=1 has varrho=ℏρ.
Continuous spin has no single scalar helicity h: its circle weights
are e+ℤ, each once. It does not satisfy a scalar identity W=κ_PL P.
Derive the displayed quadratic identity on M0's smooth invariant
core and transport its closure by the Casimir theorem; do not evaluate
an L² equivalence class at one momentum.

**Exact F-action on connected null labels.** For f=S^uT^v use
the global dictionary's t_F and r_F. Prove

```
f·H_(ε_E,h) = H_((−1)^(ε(f)+t_F(f)) ε_E,
                   (−1)^(ε(f)+r_F(f)) h),
f·C_(ε_E,ρ,e) = C_((−1)^(ε(f)+t_F(f)) ε_E,ρ,e).
```

Thus physical finite helicity flips under S and is unchanged under T,
regardless of which of those elements is antiunitary. The invariant
coefficient ℏh transforms as in the first formula. No radius rescaling
occurs for these fixed F reflections at the chosen reference energy.

The following little-group calculation fixes the intertwiners and
cocycles used in the tables. Put

```
z=−I,
a_S=(Q_flip,S),   a_T=(Q_flip,T),   a_ST=(I,ST).
```

Prove `Q_flip²=z`, `σ(Q_flip)=Q_flip`, and
`Q_flip σ(δ(w,θ)) Q_flip⁻¹=δ(conj w,−θ)`, where σ(A)=(A†)⁻¹. The elements
a_S and a_T square to z, commute, and multiply to z a_ST;
a_ST squares to1 and conjugates Δ trivially. They belong to the
stabilizer of p_(ε_E,r₀) exactly for the components preserving that
energy branch in the graded action. This is the actual null
stabilizer geometry; replacing its squares by1 would lose η_h/e.
For every such graded stabilizer element l verify
`χ_p(l·n)=χ_p(n)^((-1)^ε(l))`. This makes the genuine normal
character times its graded little representation a representation
of the semidirect stabilizer, with exactly the multiplier inflated
from F. Transport these fiber maps through M1's graded induced
model and the translation PVM to obtain the full connected-model
intertwiners and their scalar cocycles; prove the comparison rather
than assuming that a fiber calculation evaluates an L² class.

For a finite-helicity fiber, complex conjugation C_conj on ℂ is an
antiunitary intertwiner for `δ↦δ(conj w,−θ)`, with C_conj²=1. A unitary
intertwiner for that automorphism exists within one h fiber only
when h=0. An antiunitary intertwiner for the identity automorphism
also exists within that fiber only when h=0. It follows that the
reference full-T intertwiner, whenever T stabilizes H_(ε_E,h), has
square η_h: the geometric lift a_T squares to z. Prove this using
the induced-model comparison, not a massive-spin analogy.

For continuous spin use the circle-section carrier with
`f(φ+2π)=η_e f(φ)` and

```
(T^Δ_(ρ,e)(w,θ)f)(φ)
  = exp(iρ Re(exp(−iφ)w)) f(φ−θ).
```

The three explicit maps

```
(Rf)(φ)=f(−φ),
(J_C f)(φ)=conj(f(π−φ)),
(J_0 f)(φ)=conj(f(φ−π))
```

satisfy R²=1, J_C²=1 and J_0²=η_e. R is unitary and implements
`δ↦δ(conj w,−θ)`; J_C is antiunitary and implements the same
automorphism; J_0 is antiunitary and commutes with Δ. Moreover
`J_C R=η_e R J_C` and `J_C R=J_0`. Choose u_e=1 for η_e=1 and
u_e=i for η_e=−1. Then `A₀=u_e R`, `B₀=J_C` obey

```
A₀²=η_e,   B₀²=1,   B₀A₀=A₀B₀.
```

Relative to the geometric a_S,a_T lifts, the normalized full-F
reference cocycle therefore has c_ref=1, β_ref=η_e. For the ST
odd stabilizer its reference square is J_0²=η_e. For the T odd
stabilizer its reference square is also η_e after division by the
geometric central square z. Prove these comparisons and all
quasi-periodic boundary/norm identities. They are the required
continuous-spin cocycle calculation.

**Nonzero finite helicity, h≠0.**

This graded table is derived from the preceding null-orbit transport and the
M1 graded finite-index Clifford theorem. *Needs:* M4's connected null models,
the displayed geometric lift squares and M1's real/quaternionic odd-C₂ models;
the connected orbit classification uses Mackey1958 Theorems 8.1 and 9.1.
These external theorems supply the connected induction ingredient, not this
graded multiplicity table.

The following table gives the full
F orbit, its stabilizer F_H of the connected model and the connected
multiplicity n in each orbit member. Each row is one irreducible
fixed-multiplier model for each displayed orbit and the fixed c,β;
there is no extra reflection sign when F_H is trivial or odd C₂.

| Grading (ε(S),ε(T)) | Full connected-label orbit | F_H | Multiplicity n |
| --- | --- | --- | --- |
| (0,0), all unitary | {(ε_E,h),(ε_E,−h),(−ε_E,h),(−ε_E,−h)} | {1} | 1 |
| (0,1), S unitary/T antiunitary | {(ε_E,h),(ε_E,−h)} | {1,T} | 1 if β=η_h, and2 if β=−η_h |
| (1,0), S antiunitary/T unitary | {(ε_E,h),(ε_E,−h),(−ε_E,h),(−ε_E,−h)} | {1} | 1 |
| (1,1), both antiunitary | {(ε_E,h),(−ε_E,h)} | {1,T} | 1 if cβ=η_h, and2 if cβ=−η_h |

In the first and third rows choose h>0 and ε_E=+1 as orbit representatives.
In the second choose h>0 and keep ε_E as an independent orientation.
In the fourth h is a signed nonzero parameter and the orbit contains
both orientations; choose ε_E=+1. The finite multiplicity in the odd-C₂
rows is the real one-dimensional or quaternionic two-dimensional
representation with square βη_h, respectively cβη_h. Apply M1's
graded finite induction to give the actual full-group operators and
prove these models exhaust the stated h≠0 sector. In particular the
physical positive-energy row contains both +h and −h; a single
nonzero helicity cannot implement unitary spatial parity by itself.

**Helicity zero.** This is a separate fiber, not obtained by substituting
h=0 into the orbit sizes just displayed. For (0,0) the orbit is the
future/past pair, with multiplicity1 and two reflection labels ξ_S=±1; the past label is cξ_S.
For (0,1) each energy orientation is independently allowed: c=1,β=1
gives two reflection labels and multiplicity1; c=1,β=−1 gives two
reflection labels and multiplicity2; c=−1, either β, gives one model
with multiplicity2 and opposite reflection labels on its two copies.
For (1,0) and (1,1), the orbit is the future/past pair with no further
reflection sign, multiplicity1 if cβ=1 and2 if cβ=−1. Derive these
from the scalar Δ fiber, whose center and reference antiunitary square
are both+1.

**Continuous spin, ρ>0, both center sectors.** Its stabilizer is the
whole energy-preserving subgroup `F_E=ker(ε+t_F)`. The radius ρ and e
are fixed throughout each full orbit. Use the following complete table:

- For (0,0), every model contains both energy orientations, each once;
  there are two future-branch reflection labels ξ_S=±1. With the
  reference A₀ fixed as above, the past reflection label is cξ_S.
- For (0,1), each energy orientation is independently allowed. If
  c=1,β=η_e there are two reflection labels and connected multiplicity1.
  If c=1,β=−η_e there are two reflection labels and multiplicity2.
  If c=−1 there is one model for either β, with multiplicity2 and
  opposite reflection labels on its two connected copies.
- For (1,0), F_E={1,ST}; its desired odd square is cβ and its reference
  square is η_e. Both energy orientations occur. There is one model,
  multiplicity1 on each branch if cβ=η_e and2 otherwise.
- For (1,1), F_E={1,T}; the same cβ versus η_e multiplicity rule holds,
  with both energy orientations and one model.

In the (0,1) row the effective finite data are A²=1,
B²=βη_e, BA=cAB, so use the explicit real/quaternionic and swapped
A-eigenspace models already specified. The term reflection label
means the sign multiplying the chosen intertwiner of the connected
continuous-spin model; it is not a claim that S acts by a scalar on
its circle fiber. Prove irreducibility, inequivalence and exhaustion
with the fixed multiplier held constant. Explain separately the
coarser equivalence that permits a character rephasing of the ray map.

The only nonzero null models supported entirely at positive energy
have grading (0,1). Keep the past models separately in that grading,
and keep the paired energy branches in all other gradings. Genuine
ordinary-group descent requires h∈ℤ in the finite-helicity rows or
e=0 in the continuous-spin rows; multiplicity2 does not change the
covering-center value. The projective ordinary-group spin pushout,
spacelike labels and zero-translation Lorentz labels retain their
separate full contracts; these null tables do not discharge them.

### Spacelike models of the full graded extended Poincaré group

Fix a nonzero spacelike radius r>0 and M4's positive-axis representative
`p_r=(0,0,r,0)`. Write `S_(r;τ)` for the connected model with little
representation τ of `H=SU(1,1)=C₀ SL(2,ℝ) C₀⁻¹`. Use exactly M4's fixed
C₀ and k_t, so `C₀ k_t C₀⁻¹=diag(exp(it),exp(−it))` and D_n^+
has positive compact weights n+2ℕ₀. Put η=τ(−I)∈{±1}. The full
connected momentum orbit is fixed by every F component, for every
grading; F may still permute its inequivalent little labels. Its
energy spectrum is ℝ, so none of these nonzero spacelike models
is supported at positive energy.

**Actual stabilizer geometry.** Put

```
z=−I,  k=diag(i,−i),
σ(A)=(A†)⁻¹,  O(h)=Q_sp h Q_sp⁻¹  (h∈H).
```

Prove `Q_sp²=k²=z`, `Q_sp k=z k Q_sp`, `σ(Q_sp)=Q_sp`, `σ(k)=k`, and
`σ|H=Ad(k)`. For `f=S^uT^v`, put `a(f)=u+ε(f) mod2` and use
the dictionary's r_F. The following are lifts in the actual graded
momentum stabilizer, rather than a presumed split copy of F:

```
b_f=(Q_sp^a(f) k^(−r_F(f)), f),
Ad(b_f)|H=O^a(f),
b_f b_g=z^γ(f,g) b_(fg),
γ(f,g)=r_F(f)a(g)+a(f)a(g)+r_F(f)r_F(g) mod2,
b_f²=z^(a(f)+r_F(f)+a(f)r_F(f)),
b_f b_g = z^(a(f)r_F(g)+r_F(f)a(g)) b_g b_f.
```

The square formula is for these order-two components; the displayed
product factor is the actual central element of H. Pin the orientation by
proving

```
C₀⁻¹ Q_sp C₀=−i[[0,1],[1,0]],  C₀⁻¹ k C₀=k_(π/2).
```

Thus O sends the real Lie basis
`J=[[0,−1],[1,0]], H₀=diag(1,−1), X=[[0,1],[1,0]]`
to `−J,−H₀,X`. Verify the character compatibility
`χ_p(b_f n b_f⁻¹)=χ_p(n)^((-1)^ε(f))` before graded induction.
The central squares and commutators above must be included in
the fiber-to-full-model cocycle comparison.

**Explicit two-sided little carriers and semilinear structures.**
The two-sided irreducible families are

```
I_(e,iρ): ρ>0, e∈{0,1};   I_(0,0);
C_s: 0<s<1, e=0;
```

with η=(−1)^e. These labels do not include the reducible odd
principal endpoint I_(1,0), whose constituents are D_1^±. Use the
normalized inducing convention already fixed in M4. On the
K-finite vectors choose an orthonormal basis v_m, m∈e+2ℤ, with
`dτ(J)v_m=i m v_m` and

```
L₊=(dτ(H₀)−i dτ(X))/2,   L₋=L₊*,
L₊v_m=A_m v_(m+2),       L₋v_m=A_(m−2) v_(m−2),
A_m=½√((m+1)²−ν²)>0,
ν=iρ for principal, ν=0 for I_(0,0), ν=s for C_s.
```

Derive this gauge from the normalized induced model and its
invariant positive form, including the complementary-series
completion. The commutation relations and the fixed Casimir give
`(dτ(J)²−dτ(H₀)²−dτ(X)²)/4=(1−ν²)/4` on this core.
Prove the basis comparison, integration and core statements by
M0; in addition the displayed positive ladder coefficients give
analytic finite-support vectors and integrate, with the 2π compact
period enforcing descent from the universal cover to SL(2,ℝ).
The matching to the normalized induced family is still required.
Define, conjugate-linearly for J₀,

```
R v_m=v_(−m),
J₀ v_m=(−1)^((m−e)/2) v_(−m),
C=R J₀.
```

Prove R implements O, J₀ commutes with τ, C implements O
antiunitarily, and

```
R²=1,  J₀²=η,  J₀R=η R J₀,  C²=1.
```

These identities follow from `A_(−m−2)=A_m` and the alternating
phase, and extend by norm continuity from the K-finite core. They
are not assigned from a compact-spin or null model. For the trivial
little representation use R=1 and J₀=C=complex conjugation, η=1;
this is still a nonzero spacelike momentum model.

All these little labels are fixed by F. For each of them choose
fiber intertwiners for b_S,b_T as follows:

| Grading | X_S | X_T |
| --- | --- | --- |
| (0,0) | R | 1 |
| (0,1) | R | C |
| (1,0) | J₀ | 1 |
| (1,1) | J₀ | C |

For all f choose `X_f=R^a(f) J₀^ε(f)`, which agrees with the table.
Its scalar product factor is
`η^(ε(f)a(g)+ε(f)ε(g))`. Therefore the raw full reference cocycle is

```
κ_raw(f,g)=η^(ε(f)a(g)+ε(f)ε(g)+γ(f,g)).
```

Each X_f has the required grade and implements O^a(f). Transport
these maps through M1's graded induced carrier and translation
PVM. If `X_f²=λ_f`, the corresponding full-component reference
square is `λ_f/η^(a(f)+r_F(f)+a(f)r_F(f))`. Its commutator likewise
includes division by `η^(a(f)r_F(g)+r_F(f)a(g))`. Prove this induced
comparison using b_f b_g and the actual H action, rather than
sampling a fiber of an L² equivalence class.

With the canonical A,B basis of the full finite-multiplier theorem,
normalize each even reference square to1. For η=−1 the needed
even rephase is multiplication by i; for η=1 it is1. Choose the
ordered AB intertwiner as V_A V_B. The resulting reference class
κ_τ has these exact normalized signs:

| Grading | Reference signs |
| --- | --- |
| (0,0) | c_ref=η, both even generator squares1 |
| (0,1) | c_ref=1, β_ref=η |
| (1,0) | c_ref=η, β_ref=1 |
| (1,1) | c_ref=η, β_ref=1 |

For example before this rephase the reference S,T squares and
commutator (T S versus S T) are respectively
`(η,η,η)`, `(η,η,η)`, `(1,η,1)`, `(1,η,1)` in the four rows.
In the last row the even ST square is η. Rephasing an even lift
by i changes its commutation sign with an odd lift; retain that
conjugation when obtaining the displayed c_ref. Give the actual
normalized cocycle `κ_τ(A^aB^b,A^a′B^b′)
=c_ref^(b a′) β_ref^(b b′)` after the corresponding Borel rephase.
The reference cocycle depends on η, not on ρ,s or r.

**Fixed-multiplier multiplicity table for the two-sided and trivial
little families.** Each entry below applies separately to every
listed connected label, with F_π=F. All reflection labels refer to
signs relative to the fixed intertwiners, not scalar actions on the
little carrier. For grading (0,0), if c=η there are four models,
with multiplicity1 and the two independent A,B signs; if c=−η
there is one model with multiplicity2. For nonzero grading put

```
(c_eff,β_eff)=(c,βη)        for (0,1),
(c_eff,β_eff)=(cη,β)        for (1,0) and (1,1).
```

If c_eff=1 and β_eff=1 there are two models (A sign ±), each
with connected multiplicity1. If c_eff=1 and β_eff=−1 there are
two models (A sign ±), each with multiplicity2. If c_eff=−1
there is one model for either β_eff, with multiplicity2. Use
M1's explicit real, quaternionic and swapped-eigenspace finite
models for the multiplier ω/κ_τ. Construct the full graded
operators, and prove irreducibility, inequivalence and exhaustion
with the multiplier held fixed. In fixed-multiplier equivalence retain all A- and B-sign labels.
Under the spin-pushout section's coarser ray convention, the two
independent signs in grading (0,0) merge, so its four c=η models
give one ray class. The even-T sign in the discrete rows also merges:
use b(B) in grading (0,0) and b(A) in grading (1,0).

**Discrete and limit little families.**

This is a derived graded extension table. *Needs:* M4.SL2R's signed ladder
models, the preceding aligned geometric lifts, and M1's graded finite-index
Clifford theorem. Its connected-series input is Bargmann1947, pp.568–640,
with the fixed weight/Casimir dictionary of M4.SL2R; the finite odd-stabilizer
squares are computed below, rather than attributed to the connected source.

For each n≥1 keep both
D_n^±, where n=1 means the two limits, not a two-sided irreducible
principal endpoint. Their center is η_n=(−1)^n. O and complex
conjugation each exchange the two signs, so for every grading

```
f·S_(r;D_n^σ)=S_(r;D_n^((-1)^u σ)),  f=S^uT^v.
```

The full connected-label orbit is exactly the two signs, and
F_π={1,T}. Choose D_n^+ as representative, retaining M4's
positive K weights. In its positive-chain basis v_(n+2j), j≥0,
the same positive ladder formula with ν=n−1 has the boundary
coefficient zero. The antiunitary
`C_n v_(n+2j)=(−1)^j v_(n+2j)` implements O and has square1.
It gives the actual anti-T fiber map. If T is odd its aligned lift
is b_T=(Q_sp k⁻¹,T), with b_T²=z; hence the full T-reference square
is η_n. If T is even the aligned lift is b_T=(k⁻¹,T); choose its
unitary fiber map1 and normalize the resulting even full T square
η_n to1. This derivation includes n=1 and the fixed discrete-series
orientation.

| Grading | Finite stabilizer and outcome for each r,n |
| --- | --- |
| (0,0) | T even: two models, each D_n^+ and D_n^− occurring once |
| (0,1) | T odd: one model, multiplicity1 on each sign if β=η_n, otherwise2 |
| (1,0) | T even: two models, each sign once |
| (1,1) | T odd: one model, multiplicity1 on each sign if cβ=η_n, otherwise2 |

The two even-T models are its normalized character signs ± on
the chosen positive D_n^+ block. The table holds for both allowed
c and, when present, both β; c does not affect the first or third
row's counts. The odd-T rows use the unique real or quaternionic
odd-C₂ multiplicity representation with square βη_n or cβη_n.
There is no additional S sign, since S exchanges the two connected
blocks. Construct S between these blocks by finite induction; its
square and relation to T are then exactly the prescribed finite
multiplier, including c. Prove the induced-model and cocycle
comparisons in these rows rather than extending a massive formula.

Give the measurable-family comparison on these explicit label
charts: r>0, principal ρ>0/e, the spherical endpoint, complementary
0<s<1, discrete n/sign, both limits and the trivial little label.
The ladder phases, coefficients and finite data above are Borel;
construct countable fundamental sections and the induced-field
comparison. The discrete quotient selects the positive sign;
all other little labels have singleton F orbits. Center action on
every connected block is η or η_n, so genuine ordinary-group
descent requires e=0 or n even; the trivial little family descends.
Finite multiplicity does not change that center action. This is
not the projective spin-pushout comparison for the ordinary full
group. Keep that comparison, every zero-translation Lorentz family,
and the primary cocycle-label/source comparison as separate full
obligations. The spacelike tables do not remove complementary,
endpoint, limit or trivial cases from M4 or its tensor/contraction
targets, and make no positive real mass square root on q<0.

### Zero-translation Lorentz models of the full graded group

Keep every zero-translation Lorentz input in M4. Translations act as1,
so the actual component action on SL(2,ℂ) is σ^r_F(f),
`σ(g)=(g†)⁻¹`, with r_F from the global dictionary; there is no nonzero
momentum aligner. Use the canonical A,B,c,β convention of the full
finite-multiplier theorem. All the models below have translation
Hamiltonian0 and satisfy the positive-energy condition H≥0, for every
grading. They are not nonzero massless one-particle shells.

**Actual normalized principal carrier.** Write Π_(m,ρ) for M4's
principal representation with λ=iρ, m∈ℤ, ρ∈ℝ and
`(m,ρ)∼(−m,−ρ)`. On L²(ℂ,d²z), with the existing right covariance
and big-cell section, derive the full m-dependent action

```
(π_(m,λ)(g)φ)(z)
 = |a−cz|^(−2−2λ) phase(a−cz)^(−m)
   φ((dz−b)/(a−cz)),   g=[[a,b],[c,d]],
phase(w)=w/|w|.
```

It is an almost-everywhere formula; the isolated pole is not a point
value of an L² vector. Compare the normalized compact induction with
Haar probability by the section
`k_z=(1+|z|²)^(−1/2)[[z,−1],[1,conj z]]`: the isometry to the
Lebesgue carrier is
`φ(z)=π^(−1/2)(1+|z|²)^(−1−iρ)F(k_z)`, including the prescribed
right M-character for m. Use the unitary Euclidean Fourier transform
`φ̂(ξ)=∫ exp(−2πi Re(conj ξ z))φ(z)d²z`, as in M4.Riesz.
Let C_conj be pointwise conjugation, Dφ(z)=φ(conj z), and define

```
a_(m,λ)(ξ)=|ξ|^(2λ) phase(ξ)^(−m),
A_(m,λ)=Fourier⁻¹ M_(a_(m,λ)) Fourier,
J_(m,ρ)=A_(m,iρ) C_conj.
```

On the principal unitary range λ=iρ, values at ξ=0 are immaterial. Prove
A_(m,iρ) is the unitary intertwiner from π_(−m,−iρ) to π_(m,iρ),
using M4.Angular's exactly normalized inverse Fourier distribution and
Möbius covariance. Within this unitary range its kernel is a nonzero multiple
of `|z|^(−2−2iρ)phase(z)^(−m)` except at (m,ρ)=(0,0), where it isδ₀
and A=1. At other meromorphic parameters use the continuation and local
delta-derivative values specified in M4.Angular; do not multiply a zero
Gamma coefficient by an unextended singular kernel. The normalized symbol gives
`A_(−m,−iρ) A_(m,iρ)=1`; extend an inverse identity outside this range
only on the smooth/distributional domains where its products are defined.

Pointwise C_conj sends the principal parameters to (−m,−ρ), so
J_(m,ρ) commutes with the actual principal representation. Directly

```
(J_(m,ρ)φ)̂(ξ)
 = |ξ|^(2iρ) phase(ξ)^(−m) conj(φ̂(−ξ)),
J_(m,ρ)²=η_m Id,   η_m=(−1)^m.
```

Prove this from `a(ξ)conj(a(−ξ))=η_m`, independently of a compact,
spacelike or null Frobenius–Schur formula. This includes ρ=0 and
(m,ρ)=(0,0), which remains an irreducible spherical principal
member, not the trivial Lorentz representation.

Use the fixed `Q_zero=J_alt` from M4.Lorentz, so
σ=Ad(Q_zero)∘complexConjugation,
Q_zero²=−I and σ(Q_zero)=Q_zero. Prove

```
D π_(m,λ)(g) D = π_(−m,λ)(conj g),
L_(m,ρ)=π_(−m,iρ)(Q_zero) D,
L_(m,ρ) π_(m,iρ)(g) L_(m,ρ)⁻¹
  =π_(−m,iρ)(σ(g)),
L_(−m,ρ)L_(m,ρ)=η_m Id,
J_(−m,ρ)L_(m,ρ)=L_(m,ρ)J_(m,ρ).
```

Consequently every principal class is self-conjugate and

```
f·[Π_(m,ρ)]=[Π_((−1)^r_F(f) m,ρ)]
```

for every grading. The σ orbit is a singleton exactly when mρ=0.
Use the Weyl quotient before counting these finite orbits.
The Weyl intertwiner A transports J by the phase η_m;
`u_m A_(m,iρ)`, with u_m=1 for even m and i for odd m, transports
J exactly. At the fixed axes it also transports the R below.
Supply these phase comparisons in the quotient-field construction.

**Generic principal pair, mρ≠0.** Choose representatives m>0,ρ>0
for the full F orbits. Each orbit has the two inequivalent
connected labels `[Π_(m,ρ)]` and `[Π_(−m,ρ)]`, the latter also
`[Π_(m,−ρ)]`. Its stabilizer is `{1,ST}`. On that stabilizer use
V_1=1 and V_ST=1 if ε(ST)=0, or J_(m,ρ) if ε(ST)=1.
Its reference cocycle is η_m on the odd generator square and
trivial when that generator is even. The exact fixed-multiplier
outcomes are:

| Grading | Models for each m>0,ρ>0 |
| --- | --- |
| (0,0) | two models, multiplicity1 on each connected label |
| (0,1) | one model, multiplicity1 on each label if cβ=η_m, otherwise2 |
| (1,0) | one model, multiplicity1 on each label if cβ=η_m, otherwise2 |
| (1,1) | two models, multiplicity1 on each connected label |

For (0,0), the actual ST square is c; its two even reflection
labels are `±sqrt(c)` with sqrt(1)=1 and sqrt(−1)=i. For (1,1),
ST is the canonical even A, normalized square1, with labels ±1.
The odd-ST rows have no extra reflection sign and use the unique
real or quaternionic odd-C₂ multiplicity carrier with square
cβη_m. The orbit pair is not replaced by one representative model.

Construct actual block operators as follows. In (0,0),(0,1),(1,0),
the canonical even A exchanges the two blocks; use L_(m,ρ) and
its inverse so A²=1. Put Y=AB over ST. On the chosen block set
Y=ξ_S sqrt(c) in (0,0), or Y=J_(m,ρ)⊗W in the odd-ST rows, where
W has the same odd grade and W²=cβη_m. On the second block use
`Y_−=c L Y_+ L⁻¹`, with L tensored with the linear multiplicity
identity. Define B=AY. Then B²=β and BA=cAB. In (1,1) put
`A=diag(ξ_S,cξ_S)`, ξ_S=±1, and let odd B exchange the two blocks via
`T_swap=L_(m,ρ)J_(m,ρ)` forward and βT_swap⁻¹ backward. These give A²=1,
B²=β and BA=cAB. Include the connected block action and choose
ordered A^aB^b products to realize exactly the prescribed ω.
The tensor J⊗W in the odd rows is balanced because both maps have
the same grade; do not form J⊗a linear identity.

**Fixed principal axes.** Use the nonoverlapping charts
`m=0,ρ≥0` and `m>0,ρ=0`. The first has η=1; the second has
η=η_m. Their stabilizer is all F. Construct a normalized unitary
R implementing σ and commuting with J as follows:

```
m=0:        R=π_(0,iρ)(Q_zero) D;
ρ=0,m>0:    R=u_m π_(m,0)(Q_zero) A_(m,0) D.
```

In the second formula the unnormalized R₀ has R₀²=η_m and
`J R₀=η_m R₀ J`; the factor u_m gives R²=1 and JR=RJ.
In the first formula R²=1 and JR=RJ directly from the radial
Fourier symbol. Prove all these identities on the normalized
carriers and then by bounded extension; at the common origin
the formulas agree. Thus the full reference intertwiners

```
V_f=R^r_F(f) J^ε(f),
κ(f,g)=η^(ε(f)ε(g))
```

are explicit, with κ=1 for the all-unitary grading. In every
nonzero grading their canonical reference signs are
`c_ref=1, β_ref=η`. The axes do not inherit the generic pair count.
For grading (0,0), c=1 gives four models (the two A,B signs),
each with multiplicity1; c=−1 gives one model with multiplicity2.
For any nonzero grading, put β_eff=βη. If c=1,β_eff=1 there are
two models (A sign ±), each with multiplicity1. If c=1,β_eff=−1
there are two models (A sign ±), each with multiplicity2. If c=−1
there is one model for either β_eff, with multiplicity2. These
are fixed-multiplier equivalence counts, relative to the displayed
R,J; permitting character rephasings gives a separate ray quotient.
Use the explicit finite real/quaternionic/swapped-eigenspace
carriers for ω/κ and the same-grade tensor construction.

**Complementary and trivial Lorentz inputs.** For every 0<s<1 use
M4's positive λ=s realization and actual invariant form
`C_ker(s)∬conj(φ(z))φ(w)|z−w|^(−2+2s)d²z d²w`, C_ker(s)>0. Its Fourier norm is
`c_s∫|φ̂(ξ)|²|ξ|^(−2s)d²ξ`, with `c_s=C_ker(s)π^(1−2s)Γ(s)/Γ(1−s)` from M4.Riesz.
Pointwise C_conj is antiunitary, commutes with π_s and has square1.
`R=π_s(Q_zero)D` is unitary in this completion, implements σ, has
square1 and commutes with C_conj. Verify this also on the compact
carrier: `φ(z)=(1+|z|²)^(−1−s)f(n_z)` on S². Its positive form
has real chordal-distance kernel `B_s|n−n′|^(−2+2s)`, B_s>0;
C_conj is pointwise conjugation and R is antipodal pullback
`f(n)↦f(−n)`. Thus both norm and covariance identities hold on
the actual compact and noncompact completions. The source Eq.188
inner-automorphism comparison in M4 transports these operators.

Every complementary label and the trivial Lorentz label has a
singleton F orbit, full stabilizer F, η=1 and reference κ=1.
Use exactly the preceding fixed-axis multiplicity table with η=1,
for all fourteen finite grading/multiplier classes. For the trivial
input take R=1 and J=complex conjugation on ℂ. The spherical
principal member, the complementary interior and this trivial
input remain distinct representations.

**Endpoint carrier crosswalk.** At s=0 the properly normalized
positive form gives Π_(0,0), with the already stated R,J. At λ=1,
the invariant integration quotient is trivial, with C_conj descending
to scalar conjugation and R to1. On the zero-integral submodule
use its separate invariant norm `∫|ξ|^(−2)|φ̂(ξ)|²d²ξ` and the
explicit isometry

```
(U₊φ)̂(ξ)=i ξ⁻¹ φ̂(ξ),
U₊: (zero-integral λ=1 submodule completion) ≃ Π_(2,0).
```

It is a scalar multiple of the inverse ∂_(conj z) operator. Its
chain rule proves intertwining because π_(2,0) has holomorphic
factor (a−cz)⁻²; verify the smooth section boundary conditions and
range by the Cauchy transform. At λ=−1, constants form the trivial
submodule. Give its quotient the separate homogeneous Dirichlet
norm `‖conj(ξ) φ̂‖²_(L²)`, with multiplication understood in native tempered distributions: φ may have a constant term, so φ̂ may containδ₀ and its pointwise square is not defined. Prove `F(∂_zφ)=πi conj(ξ)φ̂`, where `∂_z=(∂_x−i∂_y)/2`; hence this norm is `π^(−2)‖∂_zφ‖²_(L²)`. The map
`(U₋φ)̂(ξ)=i conj ξ φ̂(ξ)`, equivalently `U₋=(1/π)∂_z`,
intertwines this quotient completion with Π_(2,0). Prove kernel,
surjectivity and the exact smooth submodule/quotient sequences.
For both signs the displayed phases give exactly

```
U_± C_conj U_±⁻¹=J_(2,0),
U_± [π_(0,±1)(Q_zero)D] U_±⁻¹=R_(2,0).
```

Derive these from `phase(ξ)^(−2)=conj ξ/ξ`, rather than assigning
an endpoint reflection sign. Hence these nontrivial endpoint
constituents use the fixed principal-axis table with m=2, while
the trivial constituents use the trivial table. Do not identify
the entire endpoint induced module with either constituent.
The interior complementary norm and its endpoint quotient and
separate submodule norms have different roles; no unsupported
continuity of their completed Hilbert fields is presumed.

Prove irreducibility, inequivalence and exhaustion of all these
full models with M1's finite-center/finite-induction theorem and
M4's connected classification. Construct the Borel fields directly
on the generic m>0,ρ>0 pair charts, the two fixed-axis charts,
0<s<1 and the isolated trivial chart, using the explicit Fourier
multipliers and normalized endpoint maps. Genuine ordinary-group
descent requires m even in principal rows; complementary/trivial
rows have center1. Multiplicity does not change this character.
The projective ordinary-group spin pushout is a separate comparison.
Keep all M5 contraction/dual-topology and M6 tensor families and
all primary printed cocycle-label comparisons at their full scope;
these zero-translation finite tables do not discharge them.

### Examples

For time-last signature (−,−,−,+), momenta (0,0,0,m), (0,0,r,r) and (0,0,r,0) have squares m², 0 and −r². At the null label h=1/2 the covering center is −1, whereas h=0 has center +1.

### Dependencies

P.1–P.4; M0–M3; HilbertModules H3; VonNeumannAlgebras V4.0.Fields and V11; UnboundedOperators UO-B04/B05. Connected carriers precede graded extension tables, endpoint comparisons and localization.

## Layer 8: M5 — de Sitter dual, contractions and kinematics

Choose the connected group `G=SO₀(4,1)` with quadratic form `diag(−1,−1,−1,−1,+1)` on `ℝ⁵`, and its universal cover `G̃=Spin₀(4,1)→G` with kernel `{±1}`. Treat both central characters: univalent representations of `G` (the kernel acts trivially) and bivalent representations of `G̃` (the kernel acts by `−1`). Fix curvature radius `R>0`. The source uses the overall-opposite embedding signature `diag(+1,+1,+1,+1,−1)`; give the explicit sign conversion on vectors, Lie algebra generators, and quadratic generators. The source's `O(4,1)` denotes the disconnected full orthogonal group, whereas its `G` is the identity component and `G̃` its universal cover; keep these groups distinct.

**Dooley p.29 metric, chart and ambient-sign comparison.** Fix `R>0` and source spacetime coordinates `x=(x₁,x₂,x₃,x₄)`. The source transcription of p.29 reads `|ds|²=φ_src²(dx₁²+dx₂²+dx₃²−dx₄²)`; thus its metric multiplier is the square of φ_src. Use that read signature `η_src=diag(+1,+1,+1,−1)`, `u=η_src(x,x)` and `z=u/(4R²)`. Preserve its provisional `φ_src=(1−z)⁻¹` and explicit faint-fraction uncertainty. The same page writes the ambient form `Q_+(y)=y₁²+y₂²+y₃²+y₄²−y₅²` and calls the radius locus a sphere. Neither that terminology nor the faint glyphs establish a global chart or the claimed pullback metric. Keep the provisional literal reading distinct from the geometric comparison below; the faint glyphs do not justify a more definite transcription.

Own the following fixed geometric comparison using the existing manifold/quadratic-form suppliers. Put `ι(x)=(x₁,x₂,x₃,0,x₄)` and `n=(0,0,0,1,0)`. On `U_+={x:1+z≠0}`, define
`Ω_+(x)=(1+z)⁻¹` and
`F_+(x)=Ω_+(x)ι(x)+R(1−z)/(1+z)n`.
Prove that `F_+` is a smooth diffeomorphism onto
`V_+={y:Q_+(y)=R², y₄≠−R}`, with inverse
`x=2R(y₁,y₂,y₃,y₅)/(R+y₄)`, and prove
`F_+^*(dy₁²+dy₂²+dy₃²+dy₄²−dy₅²)=Ω_+²η_src`.
The excluded subset is the entire hyperplane section `y₄=−R`, not merely its pole point. Prove U_+ has exactly three connected components: `1+z>0`, and `1+z<0` with x₄ positive or negative. Their images are respectively `y₄>−R`, and `y₄<−R` with y₅ negative or positive; F_+ reverses the time sign on the latter two components. State the actual open domain rather than identifying this chart with all of `ℝ⁴`. Identify the full de Sitter quadric, its induced Lorentz signature, connectedness and topology `ℝ×S³`; the chart is an open part of that quadric. Translate its form to M5’s `diag(−1,−1,−1,−1,+1)` by the explicit coordinate dictionary `Y=(y₁,y₂,y₃,y₄,y₅)` with native indices0–4 and global negation `Q_M5=−Q_+`. Its basepoint is `R e₃`. The source spacetime components correspond to M4 indices0,1,2,3 through ambient indices0,1,2,4. At zero, `dF_+=ι`; M5’s coefficient translation a has tangent `−ι(a)`, so the geometric local coordinate is `x=−a` to first order. Carry this tangent dictionary into the differential-generator comparison; it does not assert a global group homomorphism or an exact finite-coordinate exponential identity.

Also compute what the provisional minus-denominator factor actually supplies. With `Q_−(y)=y₁²+y₂²+y₃²−y₄²−y₅²`, on `U_−={x:1−z≠0}` put `Ω_−=(1−z)⁻¹` and
`F_−(x)=Ω_−ι(x)+R(1+z)/(1−z)n`.
Prove `Q_−(F_−(x))=−R²`, that this is a smooth diffeomorphism onto `{y:Q_−(y)=−R²,y₄≠−R}` with the same inverse formula, and that `F_−^*Q_−=Ω_−²η_src`. This is the other ambient signature `(3,2)`; it is not the `Q_+` de Sitter embedding. Thus, conditional on the read p.29 signature and provisional minus factor being literal together with the printed `(4,1)` embedding, record the explicit sign incompatibility under these fixed coordinates. Compare the separately recorded p.25 internal quadratic-sign discrepancy; neither a global convention change nor a corrected model silently changes the p.29 glyph. Keep it separate from uncertainty in the original handwriting and from the chosen corrected de Sitter model. In the native spacetime form `q_M4=−u`, the adopted de Sitter factor is equivalently `(1−q_M4/(4R²))⁻¹`, so a global form sign and coordinate convention must accompany every occurrence of the minus sign.

Derive the chart identities, pullback metric, inverse-domain claims and local flat limit in M5: as `R→∞`, `Ω_+→1` and the rescaled generators recover the pinned M4 translation convention on their common core. Use the actual chart chain rule to compare the literal p30 differential expressions with M5’s signature-weighted matrix generators. Preserve the uncertain p30 `x²` term instead of inventing a corrected transcription. These geometry and source-normalization results precede the Casimir/contraction comparisons and remain mandatory alongside all M5 unitary families, full dual topologies and all-sequence limit tables. They introduce no separate generic pseudo-Riemannian or spectral supplier.

Build the Lie algebra generators and commutators, the two algebraically independent central generators, and their closures on Gårding vectors. Use Dixmier's normalization: define `Ω` from Eq.(12), printed p.12, and `Ω′` from its enveloping-algebra formula on printed p.28; the scalar evaluation tables are on pp.27–28. Prove the exact conversion from the course's `I₁,I₂` (physical Dooley p.30) to these generators, including every factor of `R`, `i`, and the signature sign. Record the scalar values in Dixmier's convention as part of the classification data:

- `π_{p,0}`: `Ω=−p²−p+2`, `Ω′=0`, for integral `p≥1`;
- `π^{±}_{p,q}`: `Ω=−p²−p+2−q²+q`, `Ω′=(p²+p)(q²−q)`, for `p∈{1/2,1,3/2,…}` and `q=p,p−1,…` down to `1` when p is integral and `1/2` when p is half-integral;
- `ν_{0,σ}`: `Ω=2+σ`, `Ω′=0`, for real `σ>−2`;
- `ν_{p,σ}`: `Ω=−p²−p+2+σ`, `Ω′=−(p²+p)σ`, for integral `p≥1, σ>0`, and for half-integral `p∈{1/2,3/2,…}, σ>1/4`.

Also include the trivial representation separately. Prove these families are unitary, irreducible, pairwise inequivalent, and exhaustive for `G̃`; state which descend to `G` (integral p) and which are genuinely bivalent (half-integral p), and prove the `π^+_{p,q}`/`π^-_{p,q}` distinction and equivalences under the outer automorphism. Do not discard the non-spherical `p>0` continuous families, either sign of the discrete families, the half-integral central-character families, or the excluded strict-boundary values. For `σ=−2`, `σ=0`, `σ=1/4`, and the omitted integral `q=0` endpoint (distinguishing the separately listed `π_{p,0}`), determine from the explicit K-type coefficient positivity/vanishing recurrences whether the limit is reducible, an included subquotient, or absent; list all irreducible constituents and their central characters. For half-integral p the q-lattice ends at 1/2 and has no q=0 member. Reconcile Dixmier's corrected ranges with Takahashi's notation by a proved parameter dictionary, preserving the corrections Dixmier makes to the earlier Newton/Thomas tables. The spherical `p=0` family is a worked acceptance case within this complete classification, not a replacement for the other families.

Use [CompactGroups](../RepresentationTheory/CompactGroups/README.md) for the compact `Spin(4)` representation/K-type API and [LieGroups](../RepresentationTheory/LieGroups/README.md) for the group and Lie-algebra carriers; the induced realization, orbit measure, and quotient modular factor are M1 targets, while the K-type recurrences and all noncompact classification steps are owned here. For a common proof model, realize each family in the `K=Spin(4)`-type decomposition indexed by `Γ⊂(½ℕ₀)²`; derive the allowed lattice Γ from its parameters and central character. Prove positivity of the ladder-coefficient squares, irreducibility from the connected K-type graph, and equivalence/non-equivalence from Γ together with the two Casimir values. For each family, give the normalized-induction realization whenever available and prove its equivalence to the K-type model; for discrete or limit cases not realized by the same induction, construct the subquotient from the stated reducibility point. This supplies concrete proofs rather than invoking a classification theorem by name. Compute both Casimir closures and eigenvalues using M0's common smooth-vector domain, Hermitian/elliptic-commutation checks and central closure theorem; prove transport to the displayed K-type model. Give the resulting analytic-vector estimates for these differential operators through M0's spectral-cutoff/core API.

Use zero-based ambient indices a,b∈{0,1,2,3,4} and `ε=(−1,−1,−1,−1,+1)`.
Pin `J_ab=ε_b E_ab−ε_a E_ba` and `[A,B]=AB−BA`, with E_ab the matrix unit.
Take the de Sitter basepoint `R e₃` on `Q(x)=−R²`, so its stabilizer acts on
`e₃^⊥` with Lorentz signature. Identify M4's zero-based coordinates by
`j(0)=0,j(1)=1,j(2)=2,j(3)=4`: the last retained coordinate is time, corresponding
to M4's p₃. Put `L_μν=J_(jμ,jν)`, `P_μ^(R)=J_(jμ,3)/R`. Prove
`[P_μ^(R),P_ν^(R)]=+R⁻²L_μν` and the Lorentz/translation mixed brackets from
these matrices, then structure-constant convergence to the Poincaré brackets.
The fundamental tangent vector of P_μ at R e₃ is −e_(jμ). Define M4's
translation coordinate a by the Lie-algebra coefficient
`v(a)=Σ_μ a_μ J_(jμ,3)`, so its geometric tangent displacement at e₃ is
`−Σ_μ a_μ e_(jμ)`. Prove v is H-equivariant for M4's Lorentz action.
Use the coefficient a, rather than that displacement, in the zero-fiber
characters; the source-to-M4 coordinate permutation then preserves the
null-cone energy orientation. Contracting around the positive
ambient axis would instead give compact SO(4) stabilizer and Euclidean symmetry. Give local exponential-chart identifications, not a global group homomorphism.
The coefficient convention's geometric displacement is −a. Compare with
active geometric translations through `(a,A)↦(−a,A)`: it exchanges
`ρ_(ε_E,ℓ)` with `ρ_(−ε_E,ℓ)` and reverses physical helicity. Carry the
chosen convention through every contraction row, including the principal
two-sheet model's sheet assignment.

**Intrinsic contraction space.** Own the deformation-to-the-normal-cone group bundle
`DNC(G,H)` for the closed point stabilizer H=Stab(R e₃), for any R>0.
Prove H is connected (the de Sitter quadric is ℝ×S³ and simply connected)
and its preimage in the cover is SL(2,ℂ). The stabilizer of the unoriented
line ℝe₃ also contains parity and is not used here. Its
fiber at r>0 is G and at r=0 is `(𝔤/𝔥)⋊H`, with the quotient identified with M4's
translation space by the coefficient map v above. The zero-fiber law is
`(a,h)(b,k)=(a+h·b,hk)`. Use base [0,∞) with its subspace topology and r=1/R on positive fibers.
Choose the Ad(H)-invariant complement `𝔪=span{J_(a,3):a≠3}` to identify
𝔤/𝔥 with actual Lie-algebra vectors, then use chart
`(v,h,r)↦(exp_G(rv)h,r)`. Restrict this map to
`{(v,h,r):r‖v‖<c}` for a fixed Euclidean norm and sufficiently small c>0,
with the entire zero fiber included; no global exponential injectivity is
asserted. Obtain c from the local product diffeomorphism 𝔪×H→G near {0}×H,
and prove chart injectivity using the quotient slice in G/H.
Prove independence of the complement by the
transition maps. Consume LieGroupoidsPoisson G0 item0's topological
unit/arrow/operation interface. If using its smooth layer, first construct
DNC over ℝ and restrict to the nonnegative base; no boundaryless atlas on
[0,∞) is assumed. Prove the overlap, multiplication/inverse and
Hausdorff second-countable topology, and the zero-fiber semidirect-product law.
Construct this for both G and its cover; the zero fibers are the ordinary connected
Poincaré group and M4's SL(2,ℂ) cover. Prove the two-sheet cover and central-character
transport across r. Supply a continuous Haar system: with a fixed normalization it
is `r^(−4)dg` for r>0 and the quotient Lebesgue/Haar density on the zero fiber.
Prove the density Jacobian and compact-support integration continuity; the Lorentz
quotient action has determinant1 and both groups here are unimodular.

Consume OperatorAlgebraDynamics D5 for Haar-groupoid convolution, full completion,
disintegration and unit-space multipliers, and HilbertModules H5 for C₀(base)-algebras,
their fibres and the upper semicontinuity of fibre norms. Own the central C₀(base) action and evaluation
comparison `A_r≅C*(G_r)` for `A=C*(DNC(G,H))`, with kernel the closed ideal generated
by functions vanishing at r. Prove evaluation surjectivity and this full-norm quotient
identity. Prove any stronger continuous-field property used; it is not supplied merely
by a group bundle's topology. Define intrinsic irreducible cluster limits by the Fell
topology on the irreducible spectrum of this single A, identifying its r-fiber with
`G_r`'s unitary dual. Pin the coefficient/neighborhood or positive-functional definition
and its equivalence with the C*-representation definition. Treat possible non-Hausdorff
multiple limits explicitly. Radius-dependent arbitrary Hilbert isometries do not define
this topology.

**Specified model limits.** In addition, use the displayed normalized induced or K-type
realizations to construct designated continuous Hilbert fields/common dense cores for
model convergence, using HilbertModules H5's Hilbert-field reconstruction.
Name each model's generating continuous sections and structural V_R; a K-type
list alone does not supply them. The mandatory standalone models are
M5.UniformZeroModel for its evaluated Poincaré-to-zero-principal rows,
M5.StructuralModelComposition for every positive-to-zero-principal row, including
mixed A/B/scalar-endpoint sequences,
M5.PrincipalTwoSheet, M5.MasslessDilation, and the trivial-family coefficient
field. Construct every one of these models with its prescribed scope; they are
not conditional on whether a model is available. Every other intrinsic full-table
row must still be proved directly from representations of A, with any separately
specified model also constructed. For isometries V_R supplied by those structural realizations require
uniform-on-compact convergence of local matrix coefficients and prove extension from
that core. Define admissible changes by `V'_R=T_R V_R W`, where T_R is a
unitary intertwiner between the chosen R-fiber models and W is a fixed unitary
in the limiting representation's commutant; prove invariance by transporting
coefficients. For a fixed unitary intertwiner U:ρ≃ρ′ between equivalent
limit models also allow `V′_R=T_R V_R U⁻¹` and prove the transported statement
on the new limit Hilbert space. For varying W_R require strong convergence W_R→W and the same
commutant condition at the limit, and prove the required compact-uniform estimates. Prove the implication to the intrinsic Fell cluster statement through
compactly supported DNC test-function sections and the Haar-system comparison. A
reducible direct-sum/direct-integral model limit supplies its constituent Fell points;
Fell topology alone does not determine multiplicities or a unique reducible Hilbert
model. Use the shared definition of Supp(ρ), the weak support in Â; for
a direct integral this is the topological support, not just its almost-everywhere
chosen fibers. Prove the model/coefficient lower inclusion `Supp(ρ)⊆Lim π_R`,
where Lim means convergence of the entire sequence in Â, and `Lim⊆Clust`,
where Clust is the set of subsequential limits. A model theorem alone does not
exclude other clusters. For an exact row prove a separate upper inclusion,
for example `limsup_R ‖π_R(f)‖≤‖ρ(f)‖` for every f∈C_c(DNC), extended to A
by norm density, yielding `Clust⊆Supp(ρ)` by kernel containment. If that bound
fails, give the actual additional cluster points and their exclusion/completeness
argument; never infer the exact cluster set just from the selected model.
Retain Lim, Clust and each model decomposition separately in the full table.
Prove A separable from the second-countable DNC Haar groupoid: construct a
countable I-norm dense family of compactly supported chart functions and
pass to its full C*-completion through OperatorAlgebraDynamics D5.
Prove A is type I by factoring each factor representation through the scalar
central C₀(base) character and its corresponding type-I fiber; do not infer
this just from the topology of the bundle. Own the topology/comparison of Â with Prim(A). First prove every fiber
is GCR: its irreducible images contain nonzero compact operators. For r>0
use M0's CCR theorem. For the Poincaré fiber apply M2's GCR criterion
to the induced realizations: its momentum orbits are locally closed
(the null cones are not closed), and the listed little-group irreducibles
are GCR. Construct compact operators by localized orbit slices and compact
little-group operators. Each irreducible representation of A factors through
a fiber, so A is GCR. Apply TypeIComparison’s generic
GCR same-primitive-kernel theorem and hull-kernel/Fell comparison to this
separable algebra, obtaining Â≃Prim(A). No CCR claim is made for the Poincaré fiber.
Consume CStarAlgebras C2's second countability of Prim(A) and lower
semicontinuity of `P↦‖a+P‖`; use the latter in the upper-bound/kernel
argument. Export a first-countable neighborhood basis. Sequences then
suffice for the table; retain nets only for separately proved generalizations.

**M5.LittleDual — full SL(2,ℝ) and SL(2,ℂ) dual topologies.** M5 owns the following
full-dual homeomorphisms, explicit bases and arbitrary-sequence criteria.
Consume M4's normalized models, irreducible list, Weyl equivalences and endpoint
submodule/quotient identifications; M4's selected principal-subset comparison
retains its existing narrower ownership. All topologies here are the full
unitary-dual Fell topologies, before their use in the full Poincaré or DNC dual.
The Δ/E(2) dual and its continuous-spin-radius→0 transitions remain in the
parent M5 scope; neither is discharged by this two-group clause.

**M5.Coding — measurable coefficient transport.** For the parameter families below, use their specified separable Hilbert models and countable fundamental sections to construct the parameter-to-representation coefficient codes. Prove measurability in Layer P.2's coefficient-generated Borel structures and compatibility with the stated measurable unitary changes of model. Consume V4.0.Fields for these fields. This sublayer owns the coefficient transport; the full Fell-topology, endpoint and arbitrary-sequence comparisons remain M5.LittleDual's targets below.

For SL(2,ℝ) use these nonredundant abbreviations for M4's labels:

```
E_t=I_(0,it), t≥0;       O_t=I_(1,it), t>0;
C_s=I_(0,s), 0<s<1;      D_n^±, n≥1;       1.
```

Here D_1^± are the two limits of discrete series; the reducible odd member at t=0 is
not another irreducible label. Weyl identifies ±t and ±s before choosing
these ranges. The central characters are +1 on E,C,1, −1 on O, and
(−1)^n on D_n^±. Give a countable global basis consisting exactly of the
following sets, with rational endpoints and rational radii 0<r<1:

| Kind | Membership |
| --- | --- |
| Even principal interior | `{E_t:a<t<b}`, 0≤a<b |
| Odd principal | `{O_t:a<t<b}`, 0≤a<b |
| Complementary interior | `{C_s:a<s<b}`, 0≤a<b≤1 |
| Spherical principal endpoint | `{E_t:0≤t<r} ∪ {C_s:0<s<r}` |
| Each odd limit D_1^σ | `{D_1^σ} ∪ {O_t:0<t<r}`, separately for σ=± |
| Each x∈{1,D_2^+,D_2^−} | `{x} ∪ {C_s:1−r<s<1}`, separately for each x |
| Remaining discrete points | `{D_n^σ}`, n≥3, σ=± |

Thus C_s as s↑1 converges to all three of 1,D_2^+,D_2^−;
O_t as t↓0 converges to both D_1^±. The three upper endpoints
remain distinct, as do the two odd limits. D_2^± are not isolated in
the full dual. There are no other cross-family or escaping-label limits.
The two center sectors are open and closed; the ordinary PSL(2,ℝ)
answer is exactly the even sector with its relative topology.

For SL(2,ℂ), define P_(m,ω) directly as M4's normalized induction
from its character χ_(m,iω) on P=MAN, with
χ_(m,λ)(m_θa_tn)=exp(imθ)exp(λt) and δ_P(a_t)=exp(2t).
Define C_s to be M4's positive-λ=s spherical complementary completion,
0<s<1, in the Eq.188 operator realization and M4.Riesz comparison.
Use the canonical Weyl representatives

```
P_0(t)=P_(0,t), t≥0;      P_m(ω)=P_(m,ω), m≥1, ω∈ℝ;
C_s as just defined, 0<s<1;       1.
```

An original label with m<0 becomes P_(−m)(−ω); for m=0 replace ω by
|ω|. All principal points, including P_0(0) and P_2(0), are irreducible;
P_0(0) is not 1. Center action on P_m is (−1)^m, and is +1 on C,1.
Give this countable global basis, again with rational endpoints and 0<r<1:

| Kind | Membership |
| --- | --- |
| Spherical principal interior | `{P_0(t):a<t<b}`, 0≤a<b |
| Principal branch m≥1, m≠2 | `{P_m(ω):a<ω<b}`, a<b |
| Principal branch m=2 away from zero | `{P_2(ω):a<ω<b}`, a<b and 0∉(a,b) |
| Complementary interior | `{C_s:a<s<b}`, 0≤a<b≤1 |
| Spherical principal endpoint | `{P_0(t):0≤t<r} ∪ {C_s:0<s<r}` |
| The existing principal point P_2(0) | `{P_2(ω):|ω|<r} ∪ {C_s:1−r<s<1}` |
| Trivial point | `{1} ∪ {C_s:1−r<s<1}` |

In particular C_s as s↑1 has exactly the two limits 1 and P_2(0).
These are distinct inseparable points; P_2(0) also receives its ordinary
principal-branch limits ω→0. C_s as s↓0 has exactly limit P_0(0).
Consume M4's closed-principal-subset theorem and its parameter
homeomorphism; the full topology computed here restricts to that same
parameter topology modulo Weyl. The two center sectors are open and closed; the full
ordinary Lorentz dual is the even sector. A limit does not identify the
endpoint smooth induced module with a unitary direct sum of its constituents.

Export exact convergence and cluster criteria for every sequence with varying
labels, allowing arbitrary mixing of the displayed families. The following
explicit scalar tables are a convenient common form. For a fixed target x put
`d_x(y)=∞` unless specified below. This is a local neighborhood gauge, not a
metric or an operator test. For an interior principal or complementary target,
set d equal to the absolute difference of its real parameters on the same
branch, with the discrete branch label exactly equal; use positive-radius
intervals small enough to avoid its endpoint or special point: in
particular a P_2(ω₀) target with ω₀≠0 uses an interval avoiding the interior
special point ω=0. At each isolated
D_n^σ, n≥3, put d_x(x)=0. At the remaining targets use:

| Group and target x | Finite values of d_x(y) |
| --- | --- |
| SL(2,ℝ), E_0 | d(E_t)=t; d(C_s)=s |
| SL(2,ℝ), D_1^σ | d(D_1^σ)=0; d(O_t)=t |
| SL(2,ℝ), x∈{1,D_2^+,D_2^−} | d(x)=0; d(C_s)=1−s |
| SL(2,ℂ), P_0(0) | d(P_0(t))=t; d(C_s)=s |
| SL(2,ℂ), P_2(0) | d(P_2(ω))=|ω|; d(C_s)=1−s |
| SL(2,ℂ), 1 | d(1)=0; d(C_s)=1−s |

For either group prove, for every label sequence y_k and every target x,

```
y_k → x                 ↔ d_x(y_k) → 0,
x is a cluster point    ↔ ∀j≥1, ∀N, ∃k≥N, d_x(y_k)<1/j
                        ↔ liminf_k d_x(y_k)=0.
```

Cluster means accumulation of the sequence's tails, including an infinitely
repeated point, equivalently the limit of a subsequence. These conditions
compute the entire limit and cluster sets. They do not require eventual
membership in one incoming family: for example principal and complementary
terms can alternate at the spherical endpoint. A sequence alternating distinct
upper endpoint labels does not converge to either merely because their
neighborhoods intersect. Integer branch equality and the displayed center
congruences are part of membership, not asymptotic conditions on a Casimir.

Prove the homeomorphisms with the full Fell dual, rather than declaring the
label bases to be that topology. Own the following model-specific bridges in M5.

**Little-group spectra and countability.** For each H∈{SL(2,ℝ),SL(2,ℂ)},
prove H is locally compact and second countable from its finite-dimensional
matrix Lie-group topology. Construct a countable L¹-dense family of compactly
supported smooth functions using a countable precompact chart exhaustion and
rational smooth bump approximations. Its ℚ(i)-linear span is dense in
C*(H), by the full integrated norm bound and C_c∞ density; hence C*(H) is
separable. Consume M0 item4's CCR theorem and TypeIComparison’s
generic GCR same-primitive-kernel/Fell comparison for these group algebras. The irreducible
class→kernel map is then bijective and, by the shared weak-support/hull-kernel
comparison, a homeomorphism with Prim(C*(H)). Consume CStarAlgebras C2's
second countability of Prim for a separable C*-algebra. Thus both actual full
Fell duals are second countable and first countable. This is separate from
M5's proof that the DNC algebra is separable, and does not invoke an M2
parameterization of a little-group dual.

**M5.LittleDual.CoefficientSequence.** Consume the shared group-C* coefficient
weak-containment and hull-kernel comparison, and prove the following lemma
for every fixed lcsc group H, with its full group-C* integrated comparison.
No type-I or irreducibility-coding assumption is needed for the lemma.
Apply it in particular to both groups above, Δ and the Poincaré cover G₀.
For irreducibles π_j,π,

```
π_j → π  ⇔  for every strictly increasing k:ℕ→ℕ,
                π ≺ ⊕_r π_(k(r)).
```

The right side uses kernel inclusion for the actual integrated direct sum.
Its equivalence with convergence follows from closure of each subsequence's
set of classes: if convergence fails, an infinite subsequence lies in a
closed complement of a neighborhood of π. Conversely every neighborhood of
π meets every tail of any subsequence of a convergent sequence.
In particular, if v is a normalized nonzero vector of irreducible π and
normalized v_j∈H_(π_j) satisfy
`⟨v_j,π_j(g)v_j⟩→⟨v,π(g)v⟩` uniformly on compact g-sets, then π_j→π.
Prove this sufficiency by cyclicity of v: finite linear combinations of
π(h)v are dense, and the one coefficient determines the finite Gram and
translated-coefficient matrices of those combinations. Approximate each
finite vector test and apply the shared coefficient comparison along every
subsequence. Do not infer convergence merely from weak containment in one
fixed direct sum or from one central scalar. Export this named lemma for
all these fixed-group comparisons; the DNC algebra has its separate fiber proof.

**Compact eigenforms, consuming M4's positive completions.** On SL(2,ℝ)'s
even compact vectors e_n of weights n=±2j, identify the eigenvalues of the
already owned M4 complementary form, normalized at the constant vector:
`a_0(s)=1`, `a_(±2j)(s)=∏_(k=1)^j(2k−1−s)/(2k−1+s)`.
Here weight n means dπ(H_K)e_n=n e_n for M4.SL2R’s H_K=−iJ,
equivalently π(k_t)e_n=exp(int)e_n. In the compact function picture
with left translation, this vector is proportional to exp(−int), not
exp(int); its Fourier index is the negative of its representation weight.
Use this same e_n convention for the endpoint vectors e_(±2) below
and the explicit intertwiner with D_2^±.
Derive the adjacent ratio from M4.SL2R and its two-sided orthonormal gauge,
and prove the intertwiner comparison with that gauge. Consume M4's positivity,
Hilbert completion, group action and integration; do not construct another
interior complementary representation here. On SL(2,ℂ)'s spherical SU(2)
spin-l summand identify the corresponding normalized eigenvalue
`a_l(s)=∏_(k=1)^l(k−s)/(k+s)`, a_0=1, from M4's normalized intertwiner.
Consume M4.Riesz's positivity, density and completed Fourier carrier.
M5 owns only this compact-eigenvalue and normalization comparison, as follows.

Use probability Haar measure on K/M, stereographic area
`d²z/[π(1+|z|²)²]`, and compact-to-noncompact map
`V_sF(z)=π^(-1/2)(1+|z|²)^(-1−s)F(κ_zM)` in the spherical model.
For M4's positive kernel constant C>0, fixed along the family, prove that its
unnormalized form gives the constant compact vector squared norm `Cπ/s`.
Use K-invariance and the radial Beta integral
`∫_ℂ |w|^(-2+2s)(1+|w|²)^(-1−s)d²w=π/s`, followed by
`∫_ℂ(1+|z|²)^(-2)d²z=π`; include the displayed π^(-1/2) factors.
Thus multiply M4's form by `s/(Cπ)` to obtain a_0=1. Its Fourier density is

```
c̄_s |ξ|^(-2s)d²ξ,
c̄_s = [s/(Cπ)] c_s
     = π^(-2s) Γ(1+s)/Γ(1−s),
c_s = C π^(1−2s) Γ(s)/Γ(1−s).
```

Prove this identity and the unitary completed-carrier comparison using
M4.Riesz; if its chosen positive constant varies with s, use that same C(s)
in both numerator and denominator. In particular c̄_s→1 as s↓0, whereas
c_s for fixed C diverges like Cπ/s. A raw M4 Fourier norm must not be
identified with a_0=1 without this rescaling. No new positivity theorem or
competing weighted-L² carrier is introduced by this comparison.

**Separate SL(2,ℝ) upper-endpoint forms.** As s↑1, for j≥1 prove the exact
limits `a_(±2j)(s)/(1−s)→1/(2j)`; the analogous SL(2,ℂ) limit is
`a_l(s)/(1−s)→1/[l(l+1)]` for l≥1. As s↓0 all weights tend to1.
M5 explicitly owns the following missing SL(2,ℝ) endpoint construction,
rather than attributing its separate forms to M4. In the ν=+1 smooth
normalized induced representation, integration is an invariant trivial
quotient. Its K-finite positive and negative chains have weights
`2+2ℕ₀` and `−2−2ℕ₀`. Prove their separate Lie/group invariance using the
endpoint covariance and vanishing connecting coefficients, and construct on
each the positive-definite invariant Hermitian form with orthogonal weights
`b_(±2j)=1/(2j)`. Check the boundary coefficient and every adjacent skew-adjoint
ladder relation; the positive-chain ratio is `b_(n+2)/b_n=n/(n+2)`.
Prove algebraic irreducibility from the nonvanishing internal ladder graph,
admissibility, the real skew-symmetry identities and the represented compact
periods. Apply M0 item3's positive-form completion, analytic integration,
descent and infinitesimal-to-unitary equivalence theorem. Give the explicit
normalized basis intertwiner with M4's existing D_2^+ or D_2^− module,
respectively, and its unitary group extension. Also prove the smooth-action
comparison on these chains, so an endpoint matrix coefficient computed in
the smooth induced action is the coefficient of that completed D_2 model.
These two separately metrized chains are not an asserted unitary direct-sum
decomposition of the whole endpoint smooth induced module.
For SL(2,ℂ), consume M4's already owned separately metrized zero-integral
submodule and its intertwiner with P_2(0); identify its invariant form, up to
the stated positive normalization, with b_l=1/[l(l+1)]. M5 owns this compact
form comparison; M4 remains the owner of that submodule's unitarization and
P_2(0) equivalence. The unrescaled integration quotient gives1 in both groups.

**Endpoint coefficients and the named Fell comparison.** Use one normalized
cyclic vector per endpoint constituent, together with
M5.LittleDual.CoefficientSequence. In a diagonal compact form, for a fixed
compact basis vector e of squared norm a(s)>0,

```
⟨e/√a(s), π_s(g)e/√a(s)⟩_s
   = the e-coordinate of π_s(g)e.
```

For higher-dimensional compact types choose a fixed unit compact vector and
its scalar matrix coordinate in the orthogonal spin-l block. Prove the
coordinate formula with the chosen inner-product convention. The smooth
compact-picture action and this coordinate are jointly continuous in (s,g),
including s=0,1, uniformly for g in a compact set: prove it directly from
the positive smooth Iwasawa multiplier, compact action and integration over
compact K, with a bound on its first s derivative on each such set. This is
a statement about fixed compact vectors and coordinate functionals, not
uniform equivalence of all completed norms or an unbounded-vector limit.
For D_2^± take e_(±2), normalize its s<1 vector, and compare its limiting
coordinate with the separate endpoint form above. For SL(2,ℂ) P_2(0) take a
fixed spin1 vector and use the consumed endpoint module/form comparison.
For the trivial quotient take the constant compact vector; invariant
integration makes its endpoint coordinate1. For s↓0 take that constant
vector in the spherical principal model. All target vectors are nonzero
and cyclic in their irreducible completed models. The named lemma proves
every corresponding Fell convergence, along every subsequence.
On each fixed principal branch use the fixed compact L² section model and
jointly continuous imaginary Iwasawa multiplier. At the odd SL(2,ℝ) t=0
point, consume M4's actual D_1^+⊕D_1^− Hilbert splitting and take its weight
+1 or −1 vector respectively. No uniform Sobolev-tail or constant-leakage
claim is needed in this cyclic-coordinate route. Coefficients serve only
the proof; none defines a basis set or a gauge value.

**Ordered central coordinates and exclusions.** Own the central-convolution
continuity proof using M0's scalar central action/closures and its fixed
right-invariant test derivatives, plus C2's lower semicontinuity of
integrated norms. For a central z and f∈C_c∞(H), denote by D_z f the test
derivative fixed so that `π(D_z f)=χ_z(π)π(f)` on the integrated model.
If π_j→π and π(f)≠0, lower semicontinuity bounds ‖π_j(f)‖ away from0,
so `|χ_z(π_j)|≤‖D_zf‖/‖π_j(f)‖`. For a scalar cluster c, the integrated
identity for `(z−c)f` and the same lower semicontinuity give c=χ_z(π).
This proves scalar convergence without assuming Casimir continuity; first
countability above then gives continuity. Use the Hermitian real/imaginary
central combinations for M0's closure theorem, and recover complex coordinates
by linear combination rather than calling a complex central element self-adjoint.
For SL(2,ℝ) use q_B from M4.SL2R:
`(1+t²)/4`, `(1−s²)/4`, `n(2−n)/4`, `0` on principal, complementary,
D_n and1. For SL(2,ℂ), fix the ordered complex-linear isomorphism

```
𝔩_ℝ⊗_ℝℂ → sl₂(ℂ)⊕sl₂(ℂ),
X⊗c ↦ (cX,c bar(X)),
```

with the original complex-linear factor first and the conjugate factor
second. Compute on the fixed Cartan matrices H=diag(1,−1), H/2 and iH
before evaluating the normalized inducing character. Put H_alg=diag(1,−1), E_alg=E₁₂, F_alg=E₂₁, with
[H_alg,E_alg]=2E_alg, [H_alg,F_alg]=−2F_alg and [E_alg,F_alg]=H_alg.
For their copies (H_i,E_i,F_i) in the two ordered factors define

```
Ω_i=H_i²/4+(E_iF_i+F_iE_i)/2.
```

The actual noncompact action gives, with u=λ+m/2 and v=λ−m/2,

```
dπ(H₁)=−2z∂_z−(1+u),   dπ(E₁)=−∂_z,
dπ(F₁)=z²∂_z+(1+u)z,
```

and the conjugate-variable formulas with v in the second factor.
Derive them by the displayed ordered complexification before evaluating Ω;
they imply dπ(Ω₁)=(u²−1)/4 and dπ(Ω₂)=(v²−1)/4.
Thus the shifted central elements are 4Ω₁+1 and 4Ω₂+1, with scalars
u² and v². These Ω_i have the standard algebraic sl₂ normalization;
in the real split factor M4.SL2R’s fixed E_−=−F_alg gives q_B=−Ω,
so its opposite Casimir sign must not be silently transferred here.
The enveloping involution from real X*=−X satisfies H₁*=−H₂,
E₁*=−E₂, F₁*=−F₂ and Ω₁*=Ω₂. Consequently Ω₁+Ω₂ and
i(Ω₁−Ω₂) are Hermitian. On principal λ=iω their real scalars are
m²/8−ω²/2−1/2 and −mω/2, respectively; on C_s they are
(s²−1)/2 and0, and on1 both are0. Consume M0's central closures
for precisely these Hermitian elements. This pins the ordered shifted scalars as
`(u²,v²)=((λ+m/2)²,(λ−m/2)²)`, `(s²,s²)` on C_s and `(1,1)` on1.
Prove the enveloping involution and Hermitian-combination comparison used
above. Swapping the two factors is not permitted: it reverses ω on m≥1
branches and need not preserve the dual point.
Presence of each fixed compact K-type is open: if π contains τ, choose
a∈C*(H) with `P_τπ(a)≠0` and use `p_τa∈C*(H)` and integrated-norm
lower semicontinuity. Combine these facts with M4's exact K-type supports
to exclude every branch omitted from the tables. In particular weights
±1 select the corresponding odd limits, weights ±2 select D_2^±, and
weight0 selects1 at SL(2,ℝ)'s upper boundary; spin0 selects1 and spin1
selects P_2(0) at SL(2,ℂ)'s upper boundary. Preserve the center distinctions,
including the possible central-coordinate coincidence P_1(0),C_(1/2).
The sufficient coefficient limits, necessary central/K-type exclusions and
first countability prove equality with the displayed rational label bases.
Export all mixed-sequence and tail-cluster criteria above.

**Explicit little-dual Borel charts and the generic M2 base.** Give each label set
the Borel σ-algebra of its now-proved full Fell topology. Prove it is exactly
the ordinary countable-disjoint-union Borel structure of the displayed real
parameter branches and discrete labels: each branch is Borel, singleton
special points are closed, and the explicit rational bases are Borel in
those parameters in both directions. Thus this is a standard Borel space.
Identify these explicit labels and their model representatives with
M2.TypeIDisintegration’s actual Mackey/Fell Borel base. M2 owns the
generic existence and comparison theorem; M5 owns the following concrete
label chart, coefficient section and model-level compatibility proof.
Use Layer P.2's coefficient
Borel structures to code separable strongly continuous unitary H-representations
on ℂ^d and ℓ²(ℕ), with their irreducible part and class map q.
For each fixed dimension d∈{1,2,…,∞}, define Rep_d(H) to be the
strongly continuous homomorphisms H→U(ℋ_d). Its Borel structure is
generated by evaluation π↦π(g) at a fixed countable dense subgroup D≤H.
Choose a compact exhaustion (K_j) of the lcsc H and D meeting every K_j
densely (enlarge D by countable dense subsets of the K_j if needed).
The compact-open topology for Layer P.2's strong unitary metric is Polish:
continuous maps H→U(ℋ_d) form a Polish space under uniform convergence
on the K_j, and the homomorphism/identity equations cut out a closed
subspace. Evaluation is continuous, and every compact-open metric ball
is Borel from its suprema over D∩K_j; hence its Borel σ-algebra is
exactly the stated evaluation structure. Restrict it to Irr_d(H), proved
Borel by the countable criterion below, and take the countable disjoint
union over finite d and d=∞. This is the standard Mackey coding on the
actual fixed Hilbert carriers, with no extra Borel structure on Rep
assumed from Layer P.2 alone. Here the Mackey
structure on classes means the quotient Borel structure: U is measurable
exactly when q⁻¹(U) is Borel in that irreducible-representation coding.
Supply those coding tests explicitly. With a countable dense sequence in
the radius2 ball of C*(H) and a fixed Hilbert orthonormal basis (e_i),
irreducibility is equivalent to this countable strong-approximation condition:
for every i,j, every N≥max(i,j) (bounded by the dimension in a finite carrier),
and every rational ε>0, some element of that sequence satisfies
`‖π(a)e_k−δ_(jk)e_i‖<ε` for all k≤N. Prove the criterion using C2's Kadison transitivity for the bounded
strong approximations of rank-one matrix units. Conversely a commuting
projection commutes with those strong limits and hence with every matrix
unit, so it is scalar; this elementary commutant argument proves irreducibility. The uniform radius2 bound
extends convergence from basis vectors to all vectors. These countable tests
are Borel by matrix entries and the norm bound. Do not infer any of this
from M2's split-semidirect orbit-space hypothesis on N̂/H.
Construct a Borel section s from the explicit label set to that coding,
using M4's normalized compact models, the orthonormalized eigenforms above,
and fixed countable compact-basis enumerations; treat discrete/endpoint
irreducibles by their actual separate models. Show the resulting operator
matrix entries are Borel in the labels and the group variable.
Consume M2.TypeIDisintegration's group/C*-algebra coding comparison and
generic Mackey=Fell Borel theorem. The label homeomorphism above gives
label-Borel=Fell-Borel. Prove q∘s equals that label identification; the
explicit matrix-entry section and its integrated representation then identify
the chosen M4 models with the supplied Mackey base. The generic two-inclusion
proof and selector remain owned by M2.

This little-group theorem supplies inputs to the full M5 basis below. M5
also owns the full de Sitter fiber topology, every within-Poincaré transition
between varying momentum orbits and little labels, the Δ/E(2) boundary
transitions, and all positive-radius to zero-radius DNC transitions and
their complete sequence/cluster tables. The two little-group bases alone
do not discharge any of those larger tables.

**M5.LorentzTemperedSupport — the precise reduced-support input.**

For L=SL(2,ℂ) own the following almost-L² criterion: a strongly continuous
unitary representation is weakly contained in λ_L exactly when there is
a dense vector subspace whose matrix coefficients belong to L^(2+ε)(L)
for every ε>0. Prove the L-special regular-norm/coefficient comparison,
including its application to reducible representations. In the reverse
direction prove the compact-finite bound by the spherical function
`a_t=diag(e^(t/2),e^(−t/2))`, with hyperbolic-distance coordinate t,
and `Ξ(a_t)=t/sinh t`, with its continuous value1 at t=0; Cartan Haar has
density proportional to sinh²t. In the forward direction use the dense
coefficient condition, Hölder/tensor-power estimates and positive-functional
approximation to obtain the reduced integrated-norm bound. This analytic
criterion is owned here, with [Benoist–Kobayashi, Proposition2.6 and
Lemma3.2](https://arxiv.org/html/1706.10131) as the precise comparison.

Compute `Supp λ_L` to be precisely M4's principal subset, including frequency0.
Each principal normalized induction is tempered: its minimal parabolic is
amenable (compact M times solvable AN), its inducing unitary character is
weakly contained in the parabolic regular representation, and M1/D3 induction
preserves weak containment and identifies induction of the regular with λ_L.
For C_s, 0<s<1, derive from its spherical compact-picture coefficient a
nonzero e^((s−1)t) leading term. It dominates Ξ(a_t)∼2te^(−t),
contradicting the tempered compact-finite bound; the constant trivial
coefficient does so as well. Their L^(2+ε) divergence alone does not
contradict existence of some other dense coefficient subspace. The
compact-finite bound and M4 exhaustion exclude these remaining families. Use M4's full-Fell-closed
principal parametrization when taking supports and closures.

**M5.CompactInductionSupport — one Lorentz compact-support adapter.**

This support formula is a derived result. *Needs:* M5.LorentzTemperedSupport,
M4's compact-type lattice, CompactGroups Layer 4 coefficient orthogonality,
CStarAlgebras C2.AnnHull and HilbertModules H3; the external induction/ideal
comparison is Echterhoff2010 equation (5.4), p.20, and Proposition 5.16, p.23.
The compact-isotype/annihilator argument below supplies the additional
Lorentz-specific equality, without assuming a Plancherel formula.



For K=SU(2), spin j∈½ℕ₀, prove
`Supp Ind_K^L D_j={P_m(ω):|m|≤2j,m≡2j mod2}`, all frequencies modulo the
pinned Weyl representatives. Consume CStarAlgebras C2.AnnHull from its pure ideal owner; no
Morita corner theorem or Lorentz Plancherel transform is assumed.
For A_r=C*_r(L), put `e_j=(2j+1)∫_K Tr(D_j(k⁻¹))u_k dk`, the
compact character projection in M(A_r), obtained by strictly integrating the
canonical K unitaries; it need not belong to A_r. Consume C1's multiplier
extension: for every nondegenerate π write π(e_j) for π̄(e_j). Then
I_j=closure(span A_r e_j A_r) is an ideal in A_r. Prove the actual right-K-isotype unitary

```
Ind_K^L D_j ⊗ D_j*  ≃  (right K-spin-j isotype in L²(L)),
F⊗ell ↦ [g↦√(dim D_j) ell(F(g))].
```

Fix Haar(K)=1 and `F(gk)=D_j(k)⁻¹F(g)`. Schur orthogonality proves the
norm, range and direct-sum multiplicity dim D_j. Right K acts on D_j*, while
left L acts on the induced factor. If labels use D_j on the right instead,
pin the actual SU(2) self-duality `e_m*↦(−1)^(j−m)e_(−m)`; half-spin
self-duality is symplectic, not an unmentioned identification with the same basis.

Let ρ_j be the left regular action on this isotype, the L² closure of
`{b*e_j:b∈C_c∞(L)}`. Prove `ker ρ_j=Ann(I_j)` in A_r with both implications.
If ρ_j(a)=0, bounded right convolution by every compact test c commutes with
λ(a), so `λ(a)λ(b*e_j)c=0` on a dense set. Faithfulness of λ on A_r gives
`a b e_j=0` for every b, hence aI_j=0. Conversely aI_j=0 implies a b e_j=0;
a right L² approximate identity gives `λ(a)(b*e_j)=0`, hence ρ_j(a)=0.
Include density/closure and nonunital approximate-identity arguments. This is
an actual L² isotype kernel equality, not just faithfulness on an abstract
Hilbert module. C2.AnnHull gives

```
Supp ρ_j=hull Ann(I_j)=closure{π∈Supp λ_L:π(e_j)≠0}.
```

It proves both support inclusions. M5.LorentzTemperedSupport and M4's compact
type lattice make the last set precisely the already closed principal band.
No Lorentz Plancherel transform or noncompact Frobenius theorem is needed.

Both Poincaré and de Sitter restrictions consume this single adapter.

**M5.NullLittleDual — the complete covered planar little dual.**

This topology is derived from M2's orbit classification and the coefficient
limits below. *Needs:* M4's covered planar group and its explicit induced models,
Layer 0's weak-support comparison, OperatorAlgebraDynamics D1/D3 and
HilbertModules H3. The external orbit and Morita inputs are Echterhoff2010
Theorem 7.41(i), p.51, and Proposition 5.11, p.21; the zero-radius neighborhood
comparison remains the theorem proved here.



Use M4's actual `Δ=ℂ⋊(ℝ/4πℤ)` and M2's irreducible list. Its labels are
the characters `ζ_ℓ(δ(w,θ))=exp(iℓθ/2)`, ℓ∈ℤ, and `T_(ρ,e)` for
ρ>0, e∈{0,1/2}, with the translation character
`exp(i Re(conj(ζ)w))`, |ζ|=ρ. The covering center is (−1)^ℓ or exp(2πie).
Prove its full Fell topology has the following rational countable basis:

| target type | basic neighborhoods |
| --- | --- |
| positive radius, fixed e | `{T_(ρ,e):a<ρ<b}`, rational 0≤a<b |
| character ζ_ℓ | `{ζ_ℓ} ∪ {T_(ρ,e):0<ρ<b}`, rational b>0, 2e≡ℓ mod2 |

No other character enters the latter set. On each center sector, every
positive-radius sequence tending to0 converges to every matching character;
a sequence of character labels converges only by eventual equality. A mixed
sequence converges to ζ_ℓ exactly when its character terms are eventually
ζ_ℓ and its remaining positive radii tend to0 with eventually matching center.
At a positive-radius target it is eventually of that radius family with
ordinary radius convergence. Export all tail/subsequence cluster criteria
by these bases, without assuming eventual membership in a single family.

For the positive-radius stratum use D1 open-invariant-set exactness, the
translation Fourier transform, D3 Green imprimitivity and HilbertModules H3's Rieffel
spectrum transport; the orbit radius gives the ordinary (0,∞) factor and
the two stabilizer characters give the discrete center factor. At radius0
realize all T_(ρ,e) on one circle carrier with compact weights ℓ∈2e+2ℤ.
As ρ→0 its translation factor tends to1 uniformly on compact w, with
error at most ρ|w|; the limit is the direct sum of those characters.
M5.LittleDual.CoefficientSequence gives each lower inclusion. For the upper
inclusions, compact circle projections isolate each character label,
the central element isolates its center, and the translation C₀(ℂ) spectral
calculus forces ρ→0 at a character and ordinary radius convergence at a
positive target. Establish cofinality and openness using these operator
tests and the just-proved model limits. The ordinary E(2) quotient is the
relative center+1 part: e=0 and even ℓ. This is the little-group topology;
the Poincaré null-orbit stratum separately uses its induced-model adapter.

**M5.InducedLorentzSupport — exact Lorentz support at a spacelike orbit.**

Fix `L=SL(2,ℂ)`, `H_s=C₀SL(2,ℝ)C₀⁻¹=SU(1,1)` in M4’s native Hermitian model, and every actual M4 little irreducible τ. Use normalized Hilbert induction on M1’s carrier.

For this auxiliary comparison fix the unit-radius reference L Haar measure:
its quotient by `dh_ref:=d²b dθ/(2π)` on H_s is μ_(s,1).
This reference subgroup Haar is exactly M6’s physical unit-2+1-shell
normalization. The ambient L Haar is fixed at unit reference radius, instead
of M6's input-radius rescaling. Keep that ambient measure and use
`dh_aux=½dh_ref=d²b dθ/(4π)` on H_s. The auxiliary quotient is twice the physical
unit spacelike measure: with dΩ the ordinary area on S², it is
`cosh²t dt dΩ`, while `μ_(s,1)=½cosh²t dt dΩ`.
The carrier map from the physical quotient to this auxiliary quotient
is `f↦f/√2`; prove its covariance and norm identity using M1.
These explicit positive Haar/quotient changes affect no weak support.

Write
`J(τ)=Ind_(H_s)^L τ` and `Supp_L J(τ)={π∈L̂:π≺J(τ)}`,
where weak containment is the full-group-C* kernel convention, not occurrence as a Hilbert summand.

Use M5.LittleDual’s unique Lorentz principal labels `P_0(t)`, t≥0, and `P_m(ω)`, m≥1, ω∈ℝ, defined directly by M4’s normalized induction. Thus `(m,ω)∼(−m,−ω)` and the covering center acts by `(−1)^m`. In particular P_0(0) and P_2(0) are principal irreducibles, not trivial. Define the following **explicit full-Fell-closed subsets**:

```
A_e = {P_0(t):t≥0, e=0}
      ∪ {P_m(ω):m≥1, m≡e mod2, ω∈ℝ},              e∈{0,1};
B_n = {P_m(ω):m≥n, m≡n mod2, ω∈ℝ},             n≥1;
Q   = {P_0(t):t≥0} ∪ {P_(2k)(0):k=1,2,…}.
```

Prove the exact table:

| M4 little τ | Full Fell support of J(τ) |
|---|---|
| I_(e,iν), ν>0, both e | A_e |
| even principal endpoint I_(0,0) | A_0 |
| complementary I_(0,s), 0<s<1 | A_0 |
| D_n^+, D_n^−, n≥2 | B_n, for either sign |
| limits D_1^+, D_1^− | B_1=A_1, for either sign |
| trivial 1_H | Q |

An excluded reducible induced endpoint is resolved into its actual irreducible constituents before applying the table. No complementary or trivial Lorentz label occurs in any row. Every frequency0 point displayed above is part of **weak support**, whether or not it has an atom in a chosen direct integral. Do not replace Q by all even principal labels. The actual discrete constituents in J(1_H) are relative discrete constituents of L/H_s, not group discrete series of SL(2,ℂ).

Own the following support proof in M5, consuming the named M1/M4/M0/UO/compact inputs without introducing competing generic induction, Casimir or spectral carriers.

1. **Compact exclusion for discrete/limit τ.** Prove the K-restriction comparison for K=SU(2): in the coordinates `p(t,k)=(cosh(t)k·e₂,sinh(t))` on L/H_s, a diagonal boost commutes with `K∩H_s=Spin(2)` and the invariant quotient density is `cosh²(t)dt dΩ`. Hence
`Res_K J(τ) ≃ L²(ℝ,cosh²(t)dt) ⊗ Ind_(Spin(2))^K Res_(Spin(2))τ`.
A D_n^σ input has no K-spin j<n/2, including n=1. Every P_m(ω) contains its lowest K-spin |m|/2. Use compact character projections as integrated bounded operators to show that absent K-types are absent even from weak support. This gives B_n as an upper bound, not just a multiplicity assertion.

2. **All lower inclusions from an actual subgroup/Hilbert limit.** For every compact τ weight n, prove `Ind_Δ^L η_n≺J(τ)`, where `η_n(δ(w,θ))=exp(inθ/2)`. Put `a_u=diag(e^(u/2),e^(−u/2))` and `H_u=a_uH_sa_u⁻¹`. Its following global coordinates converge, uniformly on compact w,θ, to M4’s δ(w,θ):

```
h_u(w,θ) = [[e^(iθ/2)√(1+e^(−2u)|w|²),  w e^(−iθ/2)],
            [e^(−2u)bar(w)e^(iθ/2),       e^(−iθ/2)√(1+e^(−2u)|w|²)]].
```

Give H_s Haar density `d²b dθ/(4π)` in the coordinates `[[e^(iθ/2)√(1+|b|²),b],[bar(b),e^(−iθ/2)√(1+|b|²)]]`. Normalize H_u Haar as `e^(2u)(Ad a_u)_*dh`, so the displayed coordinates have density exactly `d²w dθ/(4π)`. Prove local weak convergence to Δ Haar and the converse bounded-sequence statement establishing the entire Chabauty limit Δ. Under pullback into H_s, h_u tends to the compact rotation. For a unit weight vector v_n its τ coefficient therefore tends to η_n; prove this uniformly on compact parameters.

Make the induced conclusion on actual Hilbert vectors. For `f∈C_c(L)` define `T_(H,τ)(f,v)(x)=∫_H f(xh)τ(h)v dh`. Its squared norm and polarized inner product are given by

```
⟨T(f,v),T(g,w)⟩
  = ∫_L ∫_H conj(f(x)) g(xh) ⟨v,τ(h)w⟩ dh dx.
```

Prove this by Weil integration and Fubini; compact support supplies absolute convergence. Replace g by its left translate to obtain coefficient formulas. The explicit H_u coordinates and uniformly bounded compact supports prove convergence of these Gram matrices and coefficients, uniformly for the L-variable in compact sets. The scalar Δ sections T(f,1) span a dense subspace of Ind_Δη_n. Conjugation and the quotient/Haar scalar change identify every J_u with J(τ); with the chosen Haar normalization the unitary is `F(x)↦e^uF(xa_u)`. Thus finite families of actual induced Hilbert vectors give the asserted weak containment. No invariant-vector reciprocity or distributional embedding is assumed.

M4’s owned radial Mellin theorem gives `Supp_L Ind_Δη_n={P_(|n|)(ω):ω∈ℝ}` with the spherical ω≥0 convention. It includes frequency0 by its operator-kernel/full-support argument. Union over the actual compact τ weights gives every A_e and B_n lower inclusion. The compact weight set is e+2ℤ for the two-sided families, ±(n+2ℕ₀) for D_n^± and {0} for trivial; the last case needs the additional calculation below.

3. **Scalar exceptional row, evaluated rather than left as a relative Plancherel request.** Identify J(1_H) with L² of the unit spacelike hyperboloid, quotient measure `cosh²t dt dΩ`. With integer angular K-spin l, multiplication by cosh t is the unitary from its radial space to L²(dt). The orbital quadratic Lorentz Casimir becomes

```
C_l = d²/dt² − 1 + l(l+1)sech²t = −H_l−1,
H_l = −d²/dt² − l(l+1)sech²t.
```

The orbital pseudoscalar Casimir is zero. Prove these differential identities and their M0 closure/core comparison, with M2.DerivedDI supplying the reducible joint-central spectral field and compact-type comparison. Normalize C so that its scalar on P_m(ω) is `m²/4−1−ω²`; derive this from M4’s induced action. The pseudoscalar scalar is a nonzero fixed multiple of mω, with its ordering/sign dictionary checked on the same core.

Use the actual closed first-order operators `A_l=d/dt+l tanh t`, domain H¹(ℝ), and their adjoints. On H²(ℝ) prove
`A_l* A_l=H_l+l²`, `A_l A_l*=H_(l−1)+l²`.
The free H_0 Fourier transform is onto. For l≥1 the polar isometry
`U_l=A_l*(H_(l−1)+l²)^(-1/2)` is unitary onto `(ker A_l)^⊥` and intertwines H_(l−1),H_l; `ker A_l=ℂ sech^l t`. Hence, inductively, H_l has exactly simple eigenvalues `−k²`, 1≤k≤l, and purely absolutely continuous [0,∞) of multiplicity2; zero is not an L² eigenvalue and there is no additional singular part. The unit ground vector is
`[Γ(l+1/2)/(√πΓ(l))]^(1/2) sech^l t`.
For 1≤k≤l the normalized bound vector is
`[Γ(k+1/2)/(√πΓ(k))]^(1/2) ∏_(j=k+1)^l(j²−k²)^(−1/2) A_l*⋯A_(k+1)*sech^k t`.
The empty product is1. Derive each factor from
`‖A_j*f‖²=(j²−k²)‖f‖²` on the −k² eigenspace of H_(j−1).
These give every bound vector, not a finite numerical exhaustion test.

The C=k²−1 spectral subspace has precisely angular K-spins l≥k, once each; joint central values and M4’s full dual identify it with P_(2k)(0), once. The C=−1−ω² continuous field has P_0(ω) with multiplicity2, ω>0, in Lebesgue measure class. Therefore own the actual relative decomposition

```
J(1_H) ≃ 2 ∫_(ω>0)^⊕ P_0(ω) dω  ⊕  ⊕_(k≥1) P_(2k)(0).
```

Prove the measurable spectral/K-type comparisons and norm-preserving intertwiners just described. Its full-Fell support is Q by M5.LittleDual’s closed principal topology; P_0(0) enters support but is not an atom. This does not identify P_2(0) with the trivial Lorentz representation.

4. **Common exact upper bound, after the scalar calculation.** The preceding
onto decomposition and M5.LorentzTemperedSupport prove L²(L/H_s) tempered.
The continuous C-values are −1−ω²; the relative discrete C-values are k²−1.
They exclude all complementary values s²−1∈(−1,0), and the k=1 summand
has only angular spins l≥1, so cannot contain the trivial representation
despite its shared value C=0. Thus this argument uses both central and
compact-type data, rather than an unstated general ρ criterion.

Own the following precise Herz comparison for this L and any closed H:
if `Ind_H^L 1≺λ_L`, then `Ind_H^L τ≺λ_L` for every strongly continuous
unitary H-representation τ. On M1’s induced carrier set |F|(x)=‖F(x)‖;
its single RN square root and the unitary fiber action give
`|⟨Ind τ(g)F,F′⟩|≤⟨Ind 1(g)|F|,|F′|⟩`.
Prove this first for bounded compactly supported sections by Cauchy–Schwarz
inside the quotient integral. For such sections the right side is dominated
by a constant times the scalar coefficient of the indicator of a compact
K-invariant set. It is K-finite; the preceding almost-L²/Ξ bound makes it
L^(2+ε) for every ε>0. Density and M5.LorentzTemperedSupport’s criterion
give the claimed weak containment. This is the specialized statement and
proof of [Benoist–Kobayashi, Lemma3.2](https://arxiv.org/html/1706.10131).
Apply it to H_s and all τ to get J(τ)≺λ_L. The covering center and the
reduced principal support now give the common exact upper exclusion used
in every table row. The scalar row was proved without this all-τ upper
bound, so the proof order is acyclic.

5. **Varying little parameters and uniformity.** Pointwise equality of these support sets is not a uniform Poincaré contraction theorem. Export the following quantitative ingredient from M4’s orthonormal weight ladders. For a unit vector in a fixed finite compact-weight window |n|≤N and parameter ν (ν=iρ principal, ν=s complementary, ν=n₀−1 discrete/limit), each noncompact generator on that window has norm at most `√((N+3)²+|ν|²)`. The small noncompact factor in the pulled-back h_u has length `asinh(e^(−u)|w|)≤e^(−u)|w|`. Hence the coefficient/Hilbert-vector error on compact |w|≤W is bounded by a fixed basis-normalization constant times
`W e^(−u)√((N+3)²+|ν|²)`.
Prove this with the spectral/Duhamel estimate on M0’s analytic finite-weight vectors, keeping complementary norms orthonormalized. Thus a varying family with a common weight window has the same induced Hilbert convergence whenever this expression tends to zero. For compact principal-parameter sets and all complementary parameters 0<s<1 this is uniform. Unbounded principal frequency requires a rate; a lower support argument for each fixed frequency does not supply it. For discrete D_n, a fixed target compact weight only exists when n≤|weight|; n→∞ excludes every fixed Lorentz principal target through compact projections, independently of its chirality.

For the Poincaré zero-orbit application, first prove at fixed τ that translation characters tend uniformly to1 on every compact-support induced section as the spacelike radius tends to0; the limiting L-representation is J(τ). For varying τ use actual common sections/vector convergence or the quantified estimate and compact-support translation error, not an exchange of unquantified limits. In a boost-to-fixed-null chart e^(−u) is of order the spacelike radius; record the corresponding radius×ladder-size condition only in that chart. This clause does not assert a complete necessary-and-sufficient varying-parameter Poincaré boundary table; that remains the separate total M5 topology target. The all-τ tempered upper exclusion and compact-weight exclusions are uniform consequences available immediately.

**M5.PoincareDual — the entire connected zero-fiber dual.** Own the
following full Poincaré-dual comparison, including every changing momentum
orbit. Consume M5.LittleDual as a theorem supplier for the full little duals,
and M4's fixed normalized induced models and finite-helicity weak support.
This is a separate theorem from the de Sitter fiber and DNC cross-fiber tables.
Use the nonredundant labels

```
M_(ε_E,m,j)=P_(m,j)^ε_E,  ε_E=±1, m>0, j∈½ℕ₀;
S_(r;τ), r>0, τ∈SL(2,ℝ)^;
H_(ε_E,h)=F_h^ε_E, h∈½ℤ;
C_(ε_E,ρ,e), ρ>0, e∈{0,½};
Z_Λ, Λ∈SL(2,ℂ)^.
```

Here ε_E is the energy orientation, distinct from a unitary/antiunitary grading.
For continuous spin use the invariant parameter
`ρ=varrho/ℏ=r₀ρ_little`, where r₀ is the chosen null reference energy
and ρ_little is the radius in its actual w-character. The displayed labels
use r₀=1, so their ρ equals M4's little radius at that reference. Under
`r₀↦λr₀`, the transported little radius is `ρ_little↦λ⁻¹ρ_little`;
prove this comparison and invariance of ρ. Thus a(m,j), b(r,t) and the
null parameter compared below all equal physical PL radius divided byℏ,
not a bare little radius at an arbitrary reference. Keep both energy orientations.
For little labels write E_t=I_(0,it), t≥0; O_t=I_(1,it), t>0;
C_s=I_(0,s), 0<s<1; D_n^σ, n≥1, σ=±; and1.
For zero Lorentz labels write P_0(t), t≥0, and P_M(ω), M≥1, ω∈ℝ,
in the canonical Weyl representatives of M5.LittleDual; also C_s and1.
These C_s symbols are little labels; C_(ε_E,ρ,e) always has its three indices.

The covering-center characters are respectively (−1)^(2j), η_τ,
(−1)^(2h), exp(2πie) and η_Λ. The two sectors are open and closed;
the ordinary connected group has precisely the +1 sector and its relative
topology. All gauges below are ∞ on a source with the wrong center.
Define the scalar functions, directly in labels,

```
a(m,j)=m√(j(j+1)),    b(r,t)=r√(1+t²)/2.
```

Give a local neighborhood gauge d_x(y) in [0,∞] for every target x.
Unlisted source families have value∞. These are membership formulas,
not operator tests and not a global metric. For a positive-mass target
M_(ε_E*,m*,j*) put d=|m−m*| on sources M with ε_E=ε_E*, j=j*.
For a positive spacelike target S_(r*;τ*) put
`d=max(|r−r*|,d^R_(τ*)(τ))` on spacelike sources, using M5.LittleDual's
explicit real-little-dual gauge. For a nonzero-null target use:

| Target | Source y and conditions | d_x(y) |
| --- | --- | --- |
| H_(ε_E*,h*) | M_(ε_E*,m,j), j≥|h*| | max(m,a(m,j)) |
| H_(ε_E*,h*) | S_(r;E_t) or S_(r;O_t), matching parity | max(r,b(r,t)) |
| H_(ε_E*,h*) | S_(r;C_s), h*∈ℤ | r |
| H_(ε_E*,h*) | S_(r;D_n^σ), σ ε_E* 2h*≥n and 2h*≡n mod2 | r |
| H_(ε_E*,0) | S_(r;1) | r |
| H_(ε_E*,h*) | H_(ε_E*,h*) | 0 |
| H_(ε_E*,h*) | C_(ε_E*,ρ,e), e≡h* modℤ | ρ |
| C_(ε_E*,ρ*,e*) | M_(ε_E*,m,j), matching parity | max(m,|a(m,j)−ρ*|) |
| C_(ε_E*,ρ*,e*) | S_(r;E_t) or S_(r;O_t), matching parity | max(r,|b(r,t)−ρ*|) |
| C_(ε_E*,ρ*,e*) | C_(ε_E*,ρ,e*) | |ρ−ρ*| |

Parity for a massive source means 2j≡2h* or 2e* mod2; for a principal
spacelike source its e_par is the same integer residue. The discrete
spacelike condition uses the actual positive-axis representative and fixed
compact weights. In particular its sign reverses on the past null branch;
replace neither h* by physical helicity nor ε_E* by a grading.

For a zero target Z_Λ, the value on every zero source Z_Λ′ is the full
Lorentz-little-dual gauge `d^C_Λ(Λ′)`, with the following additional sources
when Λ=P_M(ω), M≥1, or Λ=P_0(t). In this table set M=0 for P_0(t).

| Source y and conditions | d_(Z_Λ)(y) |
| --- | --- |
| M_(ε_E,m,j), 2j≥M, matching parity, either ε_E | max(m,a(m,j)) |
| S_(r;E_t′) or S_(r;O_t′), matching parity | max(r,b(r,t′)) |
| S_(r;C_s), M even | r |
| S_(r;D_n^σ), n≤M, n≡M mod2, either σ | r |
| S_(r;1), M=0 or (M≥2 even and ω=0) | r |
| H_(ε_E,h), 2|h|=M, either ε_E | 0 |
| C_(ε_E,ρ,e), 2e≡M mod2, either ε_E | ρ |

For a zero complementary or trivial target, there are no additional
nonzero-momentum sources. This exclusion includes every spacelike little
family, even the complementary and trivial ones. The two principal axes
P_0(0) and P_2(0) retain the incoming zero-complementary tails in
M5.LittleDual; do not remove those tails from d^C.

For each target, prove that `{y:d_x(y)<δ}` for sufficiently small δ>0
is a neighborhood basis in the full dual. Use δ<1; at positive mass or
spacelike radius also use δ<m*/2 or r*/2; at a continuous-spin target use
δ<ρ*/4; at P_0(t*) with t*>0 use δ<t*/2; at P_M(ω*) with ω*≠0 use
δ<|ω*|/2. The latter restriction applies to every M, because the spacelike
trivial row singles out ω=0 even when M≠2. Choose rational radii and
rational centers in all real-parameter interior charts, with every discrete
label and endpoint center retained. Prove this is a countable global basis.
Its membership uses exactly the displayed maxima, absolute values, square
roots, inequalities and integer congruences. No coefficient, norm, integrated
representation or unspecified Fell-open set may define a membership test.

Export the entire arbitrary mixed-sequence table in the following evaluated
form, with d given family by family above and by M5.LittleDual:

```
Lim(y_k)   = {x : ∀b≥1, ∃N, ∀k≥N, d_x(y_k)<1/b},
Clust(y_k) = {x : ∀b≥1, ∀N, ∃k≥N, d_x(y_k)<1/b}.
```

Cluster means accumulation of tails, equivalently a subsequential limit.
These formulas apply without eventual-family, bounded-spin, bounded-frequency,
energy-orientation or monotonicity assumptions. For example a constant
H_(ε_E,h) has in its closure every Z_(P_(2|h|)(ω)), with the m=0 Weyl
half-line convention when h=0, in addition to itself. State the specialization orientation explicitly:
`Z_(P_M(ω)) ≺ H_(ε_E,h)` when M=2|h| means
`ker H_(ε_E,h) ⊆ ker Z_(P_M(ω))`, hence every open neighborhood of the
zero target contains that same finite-null point. Consume M4’s single
homogeneous-dilation/Mellin weak-support theorem; there is no additional
null energy-radius label required to tend to zero. A constant
C_(ε_E,ρ,e), with invariant ρ>0, has no zero-orbit limit by the continuous
central value −q(W)/ℏ²=ρ². Changing its reference energy does not change
that invariant or remove the obstruction. Thus neither a disjoint union
topology nor T1 separation may be imposed on the full Poincaré dual;
M2 supplies GCR here, and no CCR conclusion is made.

Own the proof bridges needed for this explicit table. On normalized orbit
sections the action is M1's induced action with the actual quotient measure,
unitary little action and one Radon–Nikodym square root. Use the invariant
shell measures in local positive/past-energy charts and prove their transport
from M1. With a_u=diag(exp(u/2),exp(−u/2)), e^u=2/m or2/r, the boosted
representatives are exactly

```
timelike: (0,0,1−m²/4,1+m²/4),
spacelike:(0,0,1+r²/4,1−r²/4).
```

They approach the fixed future null representative; give the past aligner
using the fixed Q_flip and the inverse boost, which reverses the spacelike
compact weight. For α=m/2 or r/2, respectively, use actual stabilizer sections

```
[[ exp(iθ/2)√(1∓α²|w|²), w exp(−iθ/2)],
 [ ∓α²conj(w)exp(iθ/2), exp(−iθ/2)√(1∓α²|w|²) ]].
```

The upper minus choice is the boosted SU(2), on each compact w-set for small
α; the lower plus choice is the boosted SU(1,1). These converge to M4's
actual δ(w,θ), including θ modulo4π and the center. Compute products and
Haar/quotient density convergence on compact charts, rather than replacing
these sections by homomorphisms. The scaled ladder coefficient below is the positive magnitude after the
fixed Stone factor for the complex null translation combination; its
continuous-spin value is ρ. A single real translation generator has
adjacent Fourier coefficient magnitude ρ/2. Prove this factor2 and phase
comparison with M4’s actual δ(w,θ) action before using the ladders.
After undoing the boost, the compact weight
h to h+1 scaled ladder coefficient is
`m√(j(j+1)−h(h+1))` in SU(2), and
`(r/2)√((2h+1)²+t²)` in a spacelike principal model.
Prove the finite-window contractions and uniform analytic-vector estimates,
then integrate them on compact null-group sets. At nonzero limiting radius
they give the actual Δ continuous-spin circle carrier with all weights e+ℤ;
at zero radius each available fixed compact weight gives its helicity character.
The complementary coefficients are uniformly bounded on fixed weight windows
for 0<s<1, and the discrete/limit windows are available exactly under the
stated signed weight conditions. Prove the induced coefficient convergence
using compactly supported quotient sections and these actual density/RN
comparisons. This bridge belongs to M5, not to a general unproved assertion
that Mackey labels carry a guessed quotient topology.

For the upper bounds, derive continuity of the Poincaré central coordinates
q(P) and q(W) by the smooth central-convolution argument of M5.LittleDual,
using M0's common core. The normalized second coordinate `−q(W)/ℏ²` is

```
m²j(j+1); r²(1+t²)/4; r²(1−s²)/4;
r²n(2−n)/4; 0; 0; ρ²; 0
```

on massive, spacelike principal, spacelike complementary, spacelike D_n,
spacelike1, finite-null, continuous-null, and zero labels respectively.
The energy-spectrum cones give the energy exclusions. Prove the localized
helicity operator `W³/|P_space|` on momentum sets away from zero has spectra
ℏ{−j,…,j}, ℏ(e_par/2+ℤ), ℏℤ,
ℏσ(n/2+ℕ₀), and{0} in the corresponding timelike/spacelike models;
its finite-null value is ε_Eℏh. Transport the fiber calculation, self-adjoint
closure and spectral inequalities from the actual induced carriers.
Pass these spectral constraints through coefficient convergence after smooth
convolution and momentum localization. This yields the finite-weight upper
bounds and the discrete sign; a quadratic Casimir alone does not yield them.
For q>0 and q<0 use OperatorAlgebraDynamics D1’s full crossed-product
exactness for the corresponding open invariant translation sets. In each
energy sheet or spacelike stratum the radius is an inert (0,∞) coordinate.
Own the generator-preserving comparison
`C₀((0,∞)×L/K)⋊L≃C₀(0,∞)⊗(C₀(L/K)⋊L)` for the actual K=SU2 or H_s:
use the full universal property, D1’s tensor comparison, CStarAlgebras C5’s
nuclear commutative factor and HilbertModules H5's trivial-field fibres.
Prove `widehat(C₀(X)⊗B)≃X×B̂` by factoring the central C₀(X) character,
then the fiber representation, with both topology directions from elementary
tensor norm tests. D3 Green imprimitivity and HilbertModules H3's Rieffel
homeomorphism identify the remaining spectrum with K̂. These named inputs
give the displayed product topologies. On each nonzero null energy orbit,
the same D1/D3/HilbertModules H3 comparison gives the relative topology of Δ̂ computed
in M5.NullLittleDual. The closed translation-zero quotient excludes zero
sources from nonzero targets.

For all zero targets consume M5.InducedLorentzSupport’s full all-τ
tempered-induction theorem and its scalar-Darboux/Herz proof. Timelike compact
and null amenable stabilizers likewise give tempered Lorentz restrictions.
Restriction and weak containment exclude every zero complementary/trivial
limit from all nonzero sources. Use M2.DerivedDI for the reducible central
and compact-type comparisons, without a later M6 prerequisite.
For massive zero-principal upper bounds consume M5.CompactInductionSupport:
`Supp Ind_(SU2)^L D_j={P_M(ω):M≤2j,M≡2j mod2}` in the canonical
nonnegative-index Weyl representatives. A spacelike D_n has no compact L-types
below spin n/2; use this for its zero-principal bound. Use M4's exact
finite-null weak support and its compact minimum type to handle arbitrary
varying helicities, including unbounded ones. For fixed finite-null
specialization consume M4’s homogeneous bundle dilation, its compact-uniform
strong convergence and its actual induction-in-stages/Mellin transform.
They already give the fixed m=2h principal support, every frequency and the
Weyl endpoint, and the kernel inclusion stated above. M5 consumes this
theorem rather than assigning its proof a second owner.
For continuous spin, right A dilation changes the nontrivial little N-character
and invariant-radius label under the translation automorphism; it is not an
equivalence of the same positive-ρ Poincaré representation.
Once the fixed specialization is proved, every sequence converging
to that finite-null point also converges to its zero-principal specialization;
this follows directly from the displayed kernel inclusion and imposes no
additional rate restriction. Every nonexceptional zero-principal lower row
factors through some such finite-null point with 2|h|=M: choose a permitted
spin/compact weight from its finite-null row. This proves those lower rows
with the displayed gauge alone. For arbitrary mixed source families only
finitely many choices (ε_E,h), h=±M/2, are needed; every neighborhood of
the zero target contains all those finite-null points. Apply the finite-null
cofinal bounds to each of the finitely many cases and take their common
tail. The scalar-spacelike exceptional row below
has its independent Darboux proof.

**M5.UniformZeroModel — structural section refinement.** Own, in addition,
the following uniform diagonal model comparison for these zero-principal
rows. This is an unconditional standalone structural-model theorem for all
the incoming Poincaré families and limits specified below: construct the
normalized sections and prove their simultaneous Lorentz and translation
estimates. The intrinsic lower rows do not require this extra construction.
For the Poincaré model set
`δ_k=max(m_k,a(m_k,j_k))` for massive sources,
`δ_k=max(r_k,b(r_k,t_k))` for spacelike principal sources,
`δ_k=r_k` for S_(r_k,C_s), 0<s<1, and S_(r_k,D_n^±), 1≤n≤M,
for target P_M(ω), and also for S_(r_k;1) when M=0; put
`δ_k=ρ_k` for continuous-null sources. When δ_k→0 put

```
η_k=δ_k^(1/2),    R_k=δ_k^(−1/4),
E∈[η_k/R_k,η_k R_k],
δ_k/(η_k/R_k)=δ_k^(1/4)→0,   η_k R_k=δ_k^(1/4)→0.
```

For finite-null sources use δ_k=1/(k+1). Center a normalized smooth
Mellin wave profile at logη_k with logarithmic width logR_k and frequency
fixed by M4's signed principal-frequency dictionary. Prove compact-uniform
Lorentz coefficient convergence as the width tends to∞. Prove that the
finite-window little contraction and the shell-density/RN estimates hold
uniformly over the entire displayed energy interval and its images under
compact Lorentz sets: their small parameter is bounded by a constant times
`δ_k/(η_k/R_k)`. Spacetime translation errors are bounded by a constant
times `η_k R_k/ℏ`. Thus the same normalized wave profiles realize the required
zero Lorentz representation while both errors vanish. Include varying j,t,
complementary endpoints and both energy orientations in these uniform bounds.
For a fixed zero-principal target the selected helicity window is fixed,
so the discrete condition n≤M bounds n. Export the sections and all errors
as the outputs of this standalone structural-model theorem, without making
them an extra rate
hypothesis in the already evaluated intrinsic zero-principal rows.

For the exceptional spacelike trivial zero row consume the entire onto
scalar hyperboloid/Darboux transform and central/K-type comparison of
M5.InducedLorentzSupport. Its exact support is
`{P_0(t):t≥0} ∪ {P_(2k)(0):k≥1}`. On the physical quotient
transported by the explicit auxiliary-Haar unitary there, translation
phases converge to1 as r→0 on compactly supported sections. This proves
the lower inclusion; the r-independent Lorentz restriction proves the
upper inclusion. This row includes the relative principal atoms and
cannot be replaced by only the null-helicity closure.

Prove the gauge sets are open and cofinal using these lower/upper bounds
and second countability of the actual full spectrum. Specifically G₀’s
full group algebra is the zero-fiber quotient A₀ of the separable DNC
algebra A above. Its irreducible spectrum is the closed subspace of Â
annihilating the evaluation ideal; the preceding GCR kernel comparison
and C2 countability therefore make G₀’s actual dual second countable.
Use M5.LittleDual.CoefficientSequence with H=G₀ for each fixed-group
coefficient implication, then prove the mixed sequence/cluster formulas. These targets compute the full connected zero
fiber. They do not discharge the separate full de Sitter topology or any
positive-to-zero DNC transition.

**M5.DeSitterFiber — explicit positive-fiber topology and bounded DNC results.**
This clause owns the positive-fiber topology and fixed-label restriction
adapters. M5.DeSitterNullZero and M5.DeSitterRemainingTransitions own the
computed total cross-fiber table and its analytic proof obligations; the full
labelled classification consumes these separate owners.
Here L denotes the set of limits of the whole incoming sequence, and C
the set of limits of its subsequences, as formalized in the total DNC
classification below. Write P_(m,ω)=P_m(ω) for m>0,
P_(0,ω)=P_0(|ω|), and C_s for M5.LittleDual’s Lorentz labels;
negative m is used only modulo its stated Weyl equivalence.

Use `K=Spin(4)=SU(2)×SU(2)`, with type `(a,b)` and alternative coordinates
`N=a+b`, `M=a−b`. Both N,M lie in `p+ℤ`, `N≥|M|`; the covering center acts
by `(−1)^(2N)`. The compact types have multiplicity one. Pin the following lattices:

| de Sitter label | Spin(4) lattice |
| --- | --- |
| `ν_(p,σ)` | `N≥p`, `−p≤M≤p`, `N−p,M−p∈ℤ` |
| `π_(p,0)`, integer p≥1 | `N≥p`, `M=0`, N integral |
| `π^±_(p,q)` | `N≥p`, `q≤±M≤p`, `N−p,M−p∈ℤ` |
| trivial | `(N,M)=(0,0)` |

Normalize the de Sitter parabolic by `H₀=J_(3,4)` in the ambient matrix
convention, `a_t=exp(tH₀)` and `ρ_G=3/2`. Write M_par and N_par for the parabolic subgroups, keeping them distinct from the compact-type lattice coordinates M,N above. Let V_p be the spin-p M_par=Spin(3) module. The compact-picture induced action is
`I_(p,λ)(g)f(k)=a(g⁻¹k)^(−λ−ρ_G)f(k(g⁻¹k))`, with the spin-p M_par action
included in the right covariance. Normalize Haar measure on K and its
M_par=Spin(3) subgroup to mass1. On K/M_par=S³ use the resulting probability measure.
For `barN_i=J_i4−J_i3`, `N_i=−J_i3−J_i4`, and
`bar n_x=exp(Σ_i x_i barN_i)`, own the explicit Bruhat-cell restriction
intertwiner with the noncompact model. In `bar n_x=k(x)a_(t(x))n(x)` with n(x)∈N_par, prove
`t(x)=log(1+|x|²)` and
`k(x)e3=(2x,1−|x|²)/(1+|x|²)`; define k(x) as the unique smooth Iwasawa K-component in the Spin group.
For any other local section of K→K/M_par, prove its M_par-valued transition with
this component and the resulting right-covariance law. Restriction of the induced section is
`F(x)=(1+|x|²)^(−λ−3/2)f(k(x))`. Prove the pulled-back S³ probability density
is `(4/π²)(1+|x|²)^(−3)dx`. Consequently on the principal axis the map
`f↦(2/π)F` is unitary onto `L²(ℝ³,V_p;dx)`. For real parameters and endpoint
subquotients transport the actual invariant eigenform through restriction and
prove its comparison with the Fourier eigenform; the principal L² identity
alone is not the complementary-series norm comparison.

Pin all ten noncompact derived operators. With `E_x=Σ_jx_j∂_j`, Hermitian
spin matrices satisfying `[S_i,S_j]=iε_ijkS_k`, and
`T_ij=iε_ijkS_k`, require

```
barN_i=−∂_i,
N_i=|x|²∂_i−2x_i(E_x+λ+3/2)+2Σ_j x_jT_ji,
J_ij=−T_ij+x_j∂_i−x_i∂_j                  (0≤i<j≤2),
J_i3=−(barN_i+N_i)/2,  J_i4=(barN_i−N_i)/2,
J_34=E_x+λ+3/2.
```

Prove the Schwartz inclusion into the induced smooth model, polynomial-growth
bounds for every derivative, and its continuous inclusion in tempered
distributions. Use the unitary negative-kernel Fourier transform
`Fhat(ξ)=(2π)^(−3/2)∫exp(−ix·ξ)F(x)dx`, extended to tempered distributions.
With `E_ξ=Σ_jξ_j∂_(ξ_j)`, prove its actual intertwining identities

```
barN_i ↦ −iξ_i,
J_ij ↦ −T_ij+ξ_j∂_(ξ_i)−ξ_i∂_(ξ_j),
J_34 ↦ −(E_ξ−λ+3/2),
N_i ↦ −i[ξ_iΔ_ξ−2(E_ξ−λ+3/2)∂_(ξ_i)−2Σ_jT_ji∂_(ξ_j)].
```

Derive these identities on Schwartz sections and extend on the owned tempered
and smooth domains. Include half-integral p by the actual Spin lift, and prove
the induced intertwiners descend to every admitted invariant subspace/quotient
and extend unitarily for its specified positive Hilbert form. The integer-spin
formulas are compared with
[Arends–Bang-Jensen–Frahm, §§2.1–2.2](https://arxiv.org/html/2406.11349);
the half-spin extension and the normalizations above are targets here.

Prove the actual induced-action and central operator dictionary
`Δ=3/2+λ`, `σ=1/4−λ²`; choose λ=iν, ν≥0, on the principal axis and
λ≥0 on the real Weyl half. Thus the scalar complementary interval is
`0<λ<3/2`, the integer p≥1 interval is `0<λ<1/2`, and there is no
half-integer complementary interval. At λ=0 retain the integer principal
member and resolve the half-integer reducibility point. The strict Dixmier
ranges above remain unchanged; a reducible induced module is not a new label.

Own the compact ladder adapter, including its Spin lift. For integer p use the
normalized eigenform comparison in [Arends–Bang-Jensen–Frahm,
§1.2, (1.4)–(1.5), observations A–C](https://arxiv.org/html/2406.11349).
For `α=(N,M)` the two forward-edge parameters are `c_N=N+3/2` and
`c_M=M+1/2`. Derive the edge operators from the compact induced action,
prove their parameter-independent compact Clebsch–Gordan factors are nonzero
on every allowed interior edge, and prove
`(c+λ) A_(α+e)(λ)=(c−λ) A_α(λ)` for invariant-form eigenvalues.
After normalizing by the positive eigenform, a real complementary edge has
squared scalar factor `c²−λ²`; principal edges have factor `c+iν` before
phase changes. Use M0 for the Hilbert completion, smooth/analytic core and
integration. Prove uniform finite-window analytic-vector bounds near every
unitary endpoint, then compact-uniform coefficient convergence. Do not apply
an integer identity involving |M| to half-integer weights: the signed gamma
ratio at M=−1/2 differs by a minus sign from the ratio at M=+1/2. Derive the
Spin coefficient recurrence and positive principal norm directly, using
[the half-spin compact lattices in Basile et al., §4.1,
(4.8)–(4.10)](https://arxiv.org/html/2401.02007) as a comparison, not a
supplier of a half-spin complementary norm.

Prove the following complete list of nonconstant finite positive-fiber
endpoint limit sets. Each displayed constituent is a limit of the full
one-parameter approach, and there are no other cluster points.

| approach with p fixed | full irreducible endpoint set |
| --- | --- |
| `ν_(0,σ)`, σ↓−2 (`λ↑3/2`) | `{1, π_(1,0)}` |
| `ν_(p,σ)`, integer p≥1, σ↓0 (`λ↑1/2`) | `{π_(p,0), π^+_(p,1), π^-_(p,1)}` |
| `ν_(p,σ)`, half-integer p, σ↓1/4 (`ν↓0`) | `{π^+_(p,1/2), π^-_(p,1/2)}` |
| σ→σ₀ in the allowed open interval | `{ν_(p,σ₀)}` |

At σ=1/4 for integer p, including p=0, the complementary and principal
realizations join at the same irreducible point. No additional cut occurs.
Every `π^±_(p,q)` above the smallest q for its parity is isolated.
The separately named `π_(p,0)` is one constituent, not a q=0 signed pair.

Give this actual countable basis for the de Sitter dual. Write
`𝓘₀=(-2,∞)`, `𝓘_p=(0,∞)` for integer p≥1, and `𝓘_p=(1/4,∞)`
for half-integer p. The coordinate on 𝓘_p is σ in ν_(p,σ). At an interior
point use all rational open intervals contained in its 𝓘_p. For a discrete
or trivial point b, put b together with independent rational endpoint tails
for exactly these incidences:

```
𝓘₀ at −2:             1, π_(1,0)
𝓘_p at 0, p integer:  π_(p,0), π^+_(p,1), π^-_(p,1)
𝓘_p at 1/4, p half:   π^+_(p,1/2), π^-_(p,1/2).
```

A tail with endpoint e and rational δ>0 is `{ν_(p,σ):e<σ<e+δ}`.
The radii for the two incidences at `π_(1,0)` are independent. If b has no
incidence its singleton is a basis member. Multiply these sets by rational
open intervals in r>0 for the positive part of the DNC space. Prove this
basis agrees with Fell topology, rather than defining its members by norms
or coefficients. For upper exclusion, a fixed compact type present at a
limit must eventually occur, so p is eventually bounded. A subsequence then
has fixed p. If its discrete labels occur infinitely often, fixed p leaves
only finitely many such labels; pass to a constant subsequence. M0’s CCR
theorem and M2’s same-kernel comparison make its irreducible weak support
a singleton, so it has no different limit. For continuous labels,
unbounded |Ω| forces all smooth integrated operators to vanish
by `‖π(f)‖≤|Ω|^(−k)‖Ω^k f‖₁`. At a finite parameter endpoint use the
finite-multiplicity compact extraction lemma: convergence of the normalized
finite-window matrices and compact-type projection of approximating states
exclude every irreducible outside the displayed limiting direct sum.
Own this lemma with the shared coefficient/Fell comparison; a mere strong
limit without the compact extraction argument is not an upper proof.

**DNC normalizer constraint.**

This is a derived symmetry constraint. *Needs:* M5's concrete deformation
groupoid and its automorphism-induced maps, M4's orbit/cover dictionary, and
Layer 0's coefficient–Fell comparison (Echterhoff2010 Lemma 5.15, p.23).
The two matrices A and B below compute the action on the normal bundle;
no classification of contraction limits is an input to this constraint.

Let w lift the ambient rotation by π in
`span(e₀,e₃)`. It normalizes H̃, acts on retained Lorentz coordinates by
`A=diag(−1,1,1,1)` and on the normal translation space by `B=−A`.
Conjugation defines a continuous DNC automorphism. It acts innerly on each
positive fiber, so for every arbitrary positive-label sequence both L and C
are invariant under its zero-fiber action β. Prove this action on the M4 labels:

| zero-fiber label | β action |
| --- | --- |
| timelike `(ε_E,m,j)` | `(−ε_E,m,j)` |
| finite-helicity `(ε_E,ℓ)` | `(−ε_E,−ℓ)` |
| continuous spin `(ε_E,ρ,e)` | `(−ε_E,ρ,e)` |
| spacelike `(r_sp,τ)` | `(r_sp,τ)` up to the fixed little-group equivalences |
| zero-orbit `P_(m,ω)` | `P_(m,−ω)` for canonical m>0; m=0 folds by Weyl |
| zero-orbit `C_s`, or trivial | unchanged |

At the native null representative `(0,0,ε_Er,ε_Er)`, B sends it directly to
its negative and Ad(A) negates J₀₁, proving the stated ℓ sign. Thus physical
helicity `ε_Eℏℓ/2` is preserved. For the Lorentz row reduce A modulo a
connected spatial rotation to parity, lift it by `g↦(g†)⁻¹`, and evaluate
its action on m_θ and a_t. Do not select only one energy branch in an
intrinsic limit set when its β partner is distinct.

**Shared compact-subgroup exclusion.** The constant compact subgroup of
all DNC fibers is `K₀=Spin(3)⊂H̃`, diagonally embedded in Spin(4).
Its spin J occurs in `(N,M)` exactly for `|M|≤J≤N`, with unit steps.
Consequently a nontrivial continuous de Sitter label has all J of its
center parity starting at 0 or1/2; `π_(p,0)` has all integral J;
`π^±_(p,q)` has exactly all J≥q of its parity; the trivial label has
only J=0. Own the compact-projection presence-open lemma in this fixed
subgroup, through the DNC multiplier maps and M0’s vector-valued projections.
If `d_n=π^±_(p_n,q_n)` and q_n→∞, then for every r_n→0,
`L=C=∅`. For an arbitrary mixed sequence, a particular target b can belong
to L only if each K₀ type of b eventually occurs in d_n; for C the same
condition is required along its convergent subsequence. Center parity must
match eventually along that sequence. These are necessary conditions, not a
replacement table for the remaining cases.

**M5.UniformLorentzUpper — constant-subgroup support through DNC.**

Let L=H̃=SL(2,ℂ) be the constant Lorentz subgroup of the covered DNC
bundle, and A its already defined full groupoid C*-algebra. Construct the
nondegenerate multiplier homomorphism `ι_L:C*(L)→M(A)` from the constant
subgroup `(h,r)↦(h,r)`. On compactly supported sections its integrated
left/right convolutions use the same fixed L Haar measure. Prove their
full-norm bound, multiplier identities, strict continuity on the group
unitaries and nondegeneracy using D5’s integrated/disintegrated full-norm
comparison and approximate identities. Evaluation at every fiber must
intertwine this map with the actual subgroup inclusion, so the extended
fiber representation of ι_L is precisely the Lorentz restriction. This
owns the constant-H multiplier comparison used below, including at r=0.

For any full-Fell-closed set F⊆L̂ put `I_F=∩_(Λ∈F)ker Λ` in C*(L) and
`J_F=closure(span A ι_L(I_F) A)` in A. Prove the following uniform upper
lemma for nets, hence for every sequence and its subsequences: if the
Lorentz restrictions of all sufficiently late incoming representations
have weak support contained in F, every DNC limit ρ in the zero fiber
satisfies `Supp_L Res_L ρ⊆F`. Indeed each incoming representation
annihilates J_F, whose hull is closed in Â. A limit therefore annihilates
J_F too. A two-sided approximate identity of A and nondegeneracy show
that its multiplier extension annihilates ι_L(I_F), yielding the stated
restriction kernel inclusion. No convergence of the restrictions as
Hilbert models, bounded positive-fiber labels, or uniform choice of
approximating vectors is required. Empty tails and eventually excluded
center sectors are interpreted through the same kernel criterion.

**M5.ScalarLorentzBranching — owned scalar Hilbert transform.**
Own the n=3,m=2 scalar restriction theorem, using Möllers–Oshima §§2–4 as
comparison formulas rather than an imported unproved result. This is one scalar
owner, consumed by the fixed/moving zero-orbit rows and exceptional-atom tail
adapter; it supplies no spinning branching theorem. Put S=σ_MO=2λ, with
S∈iℝ∪(0,3)∪{2P+1:P≥1}. The Fourier input carrier is
`L²(ℝ²_x×ℝ_y,(|x|²+y²)^(−ReS/2)dxdy)`, with its actual scalar induced or
unitarizable-submodule action. Prove its onto comparison with the existing
native compact completion. The scalar μ=0 inducing fiber at λ=P+1/2 must not
be replaced by spin P.

Pin the subgroup position before using these coordinates. Native H̃ fixes e3,
whereas the common-parabolic scalar transform fixes the transverse e2 axis.
Let c lift `exp((π/2)J_(2,3))`; then c e3=−e2, c e2=e3 and
`cH̃c⁻¹=Stab(e2)`. Take x=(ξ0,ξ1), y=ξ2 in that conjugated noncompact
picture. The actual intertwiner π_d(c), followed by this explicit conjugacy,
transports the theorem back to native H̃. Compute the retained Lorentz basis,
Cartan parameter and compact periods under this map; the scalar m0 principals,
C_s and P_(2L)(0) labels are preserved with the displayed normalized parameters.
Do not identify the common-parabolic subgroup with native H̃ without this
inner conjugacy. Its covering lift is part of the owned adapter.

Normalize the O(1) harmonics by φ_0(±1)=1/√2 and φ_1(y)=y/√2, using counting
area measure on S⁰. Only k=0,1 occur, μ=2k+1. Write y=r_y sign(y) and
`t=r_y²/|x|²`. The radial source measure is exactly
`(1/2)|x|^(−ReS+μ)t^(μ/2−1)(1+t)^(−ReS/2)dxdt`. Set

```
F_(S,μ)(t,τ)=₂F₁((μ−S+τ)/4,(μ−S−τ)/4;μ/2;−t),
G(x,τ)=|x|^(−(S−τ−μ)/2)
       ∫₀∞ F_(S,μ)(t,τ)f(x,t)t^(μ/2−1)(1+t)^(−S/2)dt.
```

Prove this transform is unitary onto the direct integral of the exact carriers
`L²(ℝ²,(1/2)|x|^(−Reτ)dx)`. Its inverse integrates
`|x|^((S−τ−μ)/2)F_(S,μ)(t,τ)G(x,τ)` against the following measure. On
τ=2iω, ω>0, the density is

```
D_(λ,k)(ω)=1/(4π) ·
 | Γ((2k+1−2λ+2iω)/4) Γ((2k+1+2λ+2iω)/4)
   /[Γ(iω)Γ(k+1/2)] |².
```

For real S>0 each j≥0 with τ_j=S−μ−4j>0 contributes one atom of mass

```
[(S−μ)/2−2j] Γ(S/2−j)Γ(μ/2+j)
 /[j! Γ(μ/2)² Γ((S−μ)/2−j+1)].
```

There is no atom at equality τ_j=0, no singular continuous part and no further
spectrum. Density is positive on every ω>0; frequency0 remains a weak-support
point. Prove the norm identity, dense domain, bounded extension, inverse,
completeness, Borel field and actual connected-cover intertwining; a formal
hypergeometric eigenfunction or a citation of the scalar branching paper is
not this Hilbert theorem.

Use this explicit proof route. Put
`D_(S,μ)=t(1+t)∂_t²+[((μ−S+2)t+μ)/2]∂_t`.
With t=sinh²(u/2), conjugate `−D_(S,μ)−(S−μ)²/16` by
`sinh(u/2)^((μ−1)/2)cosh(u/2)^((1−S)/2)`. Its eigenvalue is −τ²/16.
For μ=1 and3 the resulting
self-adjoint half-line Schrödinger expression is the same:
`−d²/du²−(S²−1)sech²(u/2)/16`, with Neumann and Dirichlet conditions at0,
respectively. Prove these are the actual regular endpoint conditions selected
by the smooth even/odd original carrier; infinity is limit-point. After
u=2v the potential is `−l(l+1)sech²v`, l=λ−1/2. Consume the already owned
integer Darboux identities for l=P, and own the general regular/Jost solutions,
Wronskians, their resolvent Green kernel, Stone jump, pole residues and zero
threshold estimates. Derive the displayed gamma density/masses and prove the
resolvent expansion is complete. For imaginary λ the potential is repulsive and has no bound state.
For real −1/2<l<1 there is one even bound state
exactly when l>0, and no odd one; for integer P the levels are P−n>0,
n=0,…,P−1, alternating parity. Zero-energy solutions are not L² and give no
extra atom. Do not import an unowned general Kodaira theorem at the Neumann
μ=1 endpoint. M0 owns the actual self-adjoint/smooth/analytic comparisons;
this M5 clause owns this special transform and its boundary/completeness proof.
The source Bessel identity (Möllers–Oshima Lemma2.2) is an explicit differential
calculation to prove here; with M0's dense analytic cores it integrates the
intertwining of the opposite unipotent generators and hence the full connected
H̃ action. Include the Spin cover and central descent comparison.

Pin the entire target dictionary by normalized induction, not Casimir names:
`τ_MO=2iω ↦ P_0(ω)`, `τ_MO=2s`,0<s<1, `↦ C_s`, and scalar submodule
`τ_MO=2L`, integer L≥1, `↦ P_(2L)(0)`. Thus a scalar complementary atom is
s=λ−1/2, and for π_(P,0) the source atoms have L=P−k−2j>0, exactly1,…,P,
each once. On connected H̃ the two O(1) types k=0,1 give two equivalent
principal continuous integrals; do not double an atom or retain a transverse
O(1) label as an additional connected Lorentz label.

Own the model scalar conversions. The source unitary Fourier transform is
`F_d u(x)=(2π)^(−d/2)∫e^(−ix·z)u(z)dz`; M4.Riesz uses e^(−2πiξ·z).
For d=2, `F_2u(x)=(2π)⁻¹ û(x/(2π))`. The source principal half-L² fiber maps
to M4's principal position carrier by `(1/√2)F_2⁻¹`. For C_s with M4.Riesz's
actual positive constant c_s the unitary to its position carrier is
`[2c_s(2π)^(2s)]^(−1/2)F_2⁻¹`. Prove this by change of variables, including
Fourier sign/dual convention. For each scalar submodule P_(2L)(0), construct
the normalized minimal-spin-L basis intertwiner with the actual M4 model
by matching its noncompact Lie-algebra ladders on every compact type,
then extend it unitarily by M0. Infinitesimal characters alone do not give
this intertwiner. This fixes the atom-carrier normalization
without an unspecified rescaling of the displayed spectral measure.

**Fixed-label zero-translation rows.** Let Z denote the zero-translation
Poincaré labels. For every fixed de Sitter irrep d and every r_n→0 prove

```
L(r_n,d)∩Z = C(r_n,d)∩Z
           = {inflate(τ): τ∈Supp(Res_H̃ π_d)}.
```

For the upper direction consume M5.UniformLorentzUpper with the fixed
closed set F=Supp(Res_H̃ π_d). For the lower direction take finite
coefficient approximants on increasing compact subsets of H̃, and choose
the approximation index slowly enough that the finitely many π_d vectors
also satisfy the compact-uniform translation error for exp(r_n v).
Spell out that diagonalization and its error bound. This theorem computes
only the Z part; moving vectors may still produce nonzero null targets.

Evaluate it in the following fixed-label rows, with the LittleDual labels
and aliases pinned above and frequency0 included as a weak-support point:

| fixed de Sitter input | exact Lorentz zero-orbit support |
| --- | --- |
| principal `I_(p,iν)` (all integer p; half p with ν>0) | `P_(m,ω)` with `|m|≤2p`, `m≡2p mod2`, all ω modulo Weyl; no complementary/trivial |
| scalar complementary `ν_(0,1/4−λ²)`, 0<λ<3/2 | all `P_(0,ω)`, plus `C_(λ−1/2)` exactly when λ>1/2; no trivial |
| `π_(p,0)`, integer p≥1 | all `P_(0,ω)` and exactly `P_(2k,0)`, 1≤k≤p; no complementary/trivial |
| spinning complementary, integral p≥1, 0<λ<1/2 | all `P_(m,ω)`, `|m|≤2p`, `m≡2p mod2`, all ω modulo Weyl; no complementary/trivial |
| `π^±_(p,q)`, including actual q=1/2 labels | all `P_(m,ω)`, `2q≤|m|≤2p`, `m≡2p mod2`, all ω modulo Weyl; no complementary/trivial |
| trivial | trivial only |

For principal inputs prove the actual Hilbert restriction
`Res_H̃ I_(p,iν)≃Ind_(SU2)^H̃ D_p ⊕ Ind_(SU2)^H̃ D_p`:
the boundary S³ has two open H̃ hemispheres with compact stabilizer SU2;
the equator is null for the principal norm. The phase and measure cocycles
are removed by M1’s measurable Mackey subgroup theorem on the two-point
conull open-orbit quotient, with its Radon–Nikodym model comparison.
Consume M5.CompactInductionSupport’s single reduced-projection-ideal
adapter to obtain exactly `|m|≤2p` with m≡2p mod2, all frequencies.
The hemispherical comparison and that earlier adapter give the full
restriction support without a second compact-support theorem owner.

The scalar complementary and π_(P,0) rows consume the owned
M5.ScalarLorentzBranching transform above, including its exact continuous
densities, residue masses, inverse/completeness and connected-cover comparison.
Its source doubled parameter τ_MO equals2s for M4 C_s and2L for the
separately normalized scalar submodule P_(2L)(0). No scalar source theorem
is imported as a proof, or extended to spinning families without their proof.

Apply M5.UniformLorentzUpper to every moving exceptional source π_(p,0), integer p≥1,
with any r>0. The completed scalar restriction table gives

```
Supp_L Res_L π_(p,0)
 = {P_0(t):t≥0} ∪ {P_(2k)(0):1≤k≤p} ⊆ Q,
Q={P_0(t):t≥0} ∪ {P_(2k)(0):k≥1}.
```

M5.InducedLorentzSupport and M4’s principal topology prove Q is full-Fell
closed. Thus every zero-fiber cluster of any such varying p,r has Lorentz
restriction weak support in Q. If the cluster is S_(a;τ), a>0, its Lorentz
restriction is the actual J(τ) computed in M5.InducedLorentzSupport.
Every nontrivial little τ has an A_e or B_n support containing a
non-spherical principal P_m(ω) with m≥1 and ω≠0, which is absent from Q.
Consequently a spacelike cluster in this source family must have τ=1.
In particular q_B=0 does not allow the two D_2^± alternatives here.
Likewise M4’s finite-null Lorentz support is the full fixed-|2h| principal
line: a finite-null cluster must have h=0. For a zero-translation cluster
Z_Λ the lemma requires Λ∈Q. These are upper exclusions for arbitrary
moving-label paths, including mixed p subsequences, not existence or rate
criteria for the remaining allowed targets. Their coefficient lower bounds
and all other DNC rows remain part of the total all-sequence table.

The full M5 DNC basis and all-sequence table remain mandatory analytic
theorems. M5.DeSitterNullZero and M5.DeSitterRemainingTransitions below give
their fixed computed membership specification, with all completion, uniform
coefficient, upper exclusion and topology proof obligations. Preserve the
principal two-sheet and conformal massless structural models and their source
qualifications, all other M5 clauses, all tensors and PUA scope.

**M5.DeSitterNullZero — moving-label finite-null and zero-orbit targets.**
Prove the following all-sequence finite-helicity null and zero-translation
parts of the positive-to-zero DNC table together with their analytic bridges.
The massive, spacelike and continuous-spin target families and full DNC basis
are specified in M5.DeSitterRemainingTransitions; the existing positive-fiber
topology, tensor and PUA targets retain their full scope.

Use the native ambient generators and r=1/R of M5.DeSitterFiber. For a nontrivial
de Sitter label d put the following inducing data and central values:

| d | μ | λ | s=1/4−λ² | Ω | Ω′ |
| --- | --- | --- | --- | --- | --- |
| ν_(p,σ) | p | i√(σ−1/4) if σ≥1/4, √(1/4−σ) otherwise | σ | 2+s−μ(μ+1) | −μ(μ+1)s |
| π_(P,0), integral P≥1 | 0 | P+1/2 | −P(P+1) | 2−P(P+1) | 0 |
| π^±_(p,q) | p | q−1/2 | −q(q−1) | 2−q(q−1)−p(p+1) | p(p+1)q(q−1) |

The strict parameter ranges and reducibility identifications remain those
already fixed. Put Ω=Ω′=0 on the trivial label. Own the native central-operator
calculation from the pinned ambient matrices:
`Ω=Σ_(a<b) ε_aε_b J_ab²`, `W_a=(1/8)ε_abcde J^bc J^de`,
`Ω′=Σ_a ε_a W_a²`, ε=(−1,−1,−1,−1,+1). Prove the complete induced differential operators satisfy all native so(4,1)
brackets and that Ω,Ω′ commute with every generator. Compute every derivative
coefficient of Ω and Ω′, prove that all their positive-order terms vanish,
and derive their zero-order values on the full induced module. Verify that
these act by `9/4−λ²−μ(μ+1)` and `(λ²−1/4)μ(μ+1)`. Their smooth DNC sections
r²Ω and r²Ω′ limit to the native q(P)/ℏ² and q(W)/ℏ⁴ operators. Own the scalar
central-convolution continuity argument through M0 and C2, including exclusion
of unbounded scalar subsequences. Thus every finite-null or zero-orbit limit
requires `Q_null(r,d)=|r²Ω(d)|+|r²Ω′(d)|→0` along its limiting sequence.

**Finite-null labels.** Define the physical-helicity set in units of ℏ:

| d | H(d) |
| --- | --- |
| ν_(p,σ) | {−p,−p+1,…,p} |
| π_(P,0) | {0} |
| π^+_(p,q) | {q,q+1,…,p} |
| π^-_(p,q) | {−p,…,−q} |
| trivial | ∅ |

For either target energy orientation ε_E and the actual M4 character label ℓ,
put `h_K(ε_E,ℓ)=ε_Eℓ/2`, the physical helicity in units of ℏ, and
`e_(h_K)(r,d)=Q_null(r,d)` if h_K∈H(d), and `e_(h_K)(r,d)=∞` otherwise.
For every arbitrary sequence r_n>0→0 and arbitrary mixed labels d_n, prove

```
(ε_E,ℓ) ∈ L(r_n,d_n)  ⇔  e_(h_K)(r_n,d_n)→0,
(ε_E,ℓ) ∈ C(r_n,d_n)  ⇔  liminf_n e_(h_K)(r_n,d_n)=0.
```

In particular all fixed nontrivial inputs have exactly the displayed helicities
on both branches, paired by `(ε_E,ℓ)↦(−ε_E,−ℓ)`. There is no contribution from
the trivial input. Center parity is part of H(d), not an extra omitted sector.
These conditions cover unbounded p, q, |λ|, arbitrary endpoint approaches and
mixed sequences with exactly the displayed membership tests.

Own the following F-picture/Spin adapter. Starting with Arends–Bang-Jensen–Frahm
§§2.1–2.2 and §3.3, derive the actual half-spin version on the finite Spin(3)
fiber; use its positive eigenform and actual Hilbert completion. Translate the
source signed labels by the native W₄ eigenvalue: a Fourier fiber weight f is
physical helicity −f, and equals −M in the high-frequency compact comparison.
Translate the source signed constituents by this W₄/compact comparison. On an admitted
helicity line put ρ=|k|, u=k/ρ, `S(u)=f`,
`C_i=dσ(u e_iᵗ−e_i uᵗ)`, `D_i=∂_i+C_i/ρ`, and

```
κ_f=μ(μ+1)−f²−s=2−f²−Ω,
t_±=f(f±1),
A_±²=[μ(μ+1)−t_±][s+t_±]
     =−Ω′+t_±(2−Ω)−t_±².
```

An absent neighbor has A=0. Prove the covariant Bessel-operator splitting with
diagonal intrinsic helicity operator
`T_(f,i)=ρu_iΣ_jD_j²−2(Euler+1)D_i−2if(u×D)_i`, independent of μ,λ,
diagonal potential
κ_f u_i/ρ and normalized adjacent-line factors of magnitude A_±. This is an
operator identity on smooth compact annuli, including the endpoint submodules;
positivity/completion is consumed from M0 and M5.DeSitterFiber.
For ρ in a fixed compact annulus and Q_null→0 set

```
E_(r,f)(ρ)=√(ρ²−r²κ_f),
φ'_(r,f)(ρ)=(ε_E/r)(√(1−r²κ_f/ρ²)−1).
```

For r and Q_null sufficiently small on that fixed annulus the square root is
positive; use `|r²κ_f|≤(2+f²)r²+|r²Ω|` to choose the common threshold.
Fix φ(ρ_*)=0. With positive Fourier
form eigenvalue a_f, the isometric line embedding from d³k/ρ is

```
(U_r g)(ξ)=r^(3/2−λ)|rξ|^(λ−1/2)
          exp(iε_E|ξ|+iφ_(r,f)(|rξ|)) a_f^(−1/2) g(rξ).
```

Use a_f=1 on the principal norm. Interpret g as a section of the helicity line
bundle; use local frames plus the intrinsic connection, not a global frame.
The diagonal boost becomes
`ε_E E_(r,f)D_i+ε_E r²κ_f u_i/(2ρE_(r,f))+(ir/2)T_(f,i)`;
time translation becomes `iε_E E_(r,f)+r(Euler+1)`, and adjacent-line errors
are bounded by C rA_±. For spatial translation use the exact source-space
identity on the admitted line domain

```
dπ(rJ_i3)U_rg = U_r(ik_i g)+r dπ(J_i4)U_rg.
```

Here `J_i4` is the retained Lorentz boost of the pinned ambient basis; the
identity follows from `J_i3=J_i4−barN_i` and the Fourier/dilation identity
`r dπ(barN_i)U_rg=−U_r(ik_i g)`. Estimate the last term using the displayed
diagonal boost and its adjacent-line bounds, retaining its full source-space
codomain rather than inverting a single-line embedding. Prove the resulting
compact-annulus generator bound

```
C_g [r+|r²Ω|+√(|r²Ω′|+C_f|r²Ω|+C_f r²)].
```

It is uniform in μ,λ and all boundary rates for fixed target f. Prove membership
in the actual smooth core, uniform bounds along compact target flows, and the
Duhamel/product-chart argument giving compact-uniform group coefficients.
The phase may diverge; its exact cancellation proves the estimate.
Consume Specified model limits' DNC coefficient lower-inclusion comparison:
integrate these compact-uniform coefficient families against compactly supported
DNC test sections, using the actual Haar system, polarization and norm density.
M5.LittleDual.CoefficientSequence applies only to fixed-group comparisons;
it does not replace this varying-fiber step.

Own the exact unitary comparison of this intrinsic line model with M4's
actual ρ_(ε_E,ℓ), before using its label. The momentum map is
`p(k)=(−ℏk,ε_Eℏ|k|)`, and f=−h_K. On a sphere patch let R_v∈Spin(3)
send e2 to v and use the M4/M1 Wigner section
`b(k)=R_(−ε_Eu) a_log(ℏ|k|/r0)`, with r0=1. Send the source unit frame
`D_μ(R_(−ε_Eu))e_(ℓ/2)` to the associated-bundle frame [b(k),1].
At the base direction `k/|k|=−ε_Ee2`, `S_2=−ε_Ef=ℓ/2`.
Compute `r_θ=exp(−θJ01)` in the actual SL2C matrices, so this frame has
character exp(iℓθ/2). Verify all patch transitions and the full M1 Wigner
cocycle, including the radial A factors; the Spin center is (−1)^ℓ.
Push d³k/|k| forward by p and compare it with M4's fixed null-orbit measure
μ_ε. Multiply by the square root of the actual Radon–Nikodym derivative.
For the convention μ_ε=d³p/(2|p|) this factor is √2/ℏ; derive the factor
from M4's chosen normalization. Prove
unitarity onto, all translation phases, all six Lorentz derived operators
and their common-core identity, and apply M0 integration. This supplies an
actual completed-model intertwiner, not only an infinitesimal character or
one little-group value.

For the helicity upper bound own the continuous subgroup-bundle multiplier
comparison for `E=ℝ³⋊Spin(3)`: at r>0 send (x,k) to exp(r barN(x))k, with
`barN_i=J_i4−J_i3`, and at0 send it to exp(−P(x))k. Prove these are injective
homomorphisms onto closed subgroup fibers, with the same Spin(3), and prove
joint smoothness through0 in the actual DNC charts. Construct
`ι_E:C*(E)→M(A)` on compact tests by integrated left translation. Prove
`‖ι_E(f)‖≤‖f‖_(C*(E))` using D5's disintegration and the full-group norm,
the *-homomorphism law, strict extension, and nondegeneracy from an E
approximate identity acting on compact DNC tests. For every r≥0 prove the
fiber identity `ev_r(ι_E(f)a)=ι_(E,r)(f)ev_r(a)`. Include r=0 explicitly:
ι_(E,0) is the actual spatial Euclidean subgroup exp(−P(x))k in G₀.
Every nondegenerate fiber representation therefore restricts to the integrated
E representation via its strict multiplier extension.

Corollary4.2 of the cited F-picture source gives the nonzero Euclidean orbit
helicities, after the Spin/sign adapter, exactly −H(d). For the fixed target
h_K define `F_(h_K)=Ê∖((0,∞)×{−h_K})`, including every zero-momentum Spin(3)
point. Prove F_(h_K) is full-Fell-closed: the positive-radius Euclidean dual
is open, its stabilizer-character coordinate is discrete, and its boundary
at radius0 lies entirely in the included Spin(3) stratum. The missing-component
ideal I_E(F_(h_K)) has an element z_E detected by the target E restriction,
which has full radial support. For an input missing h_K its E restriction
annihilates this ideal. Choose a∈A with
`π̄₀(ι_E(z_E)a)≠0`, using nondegeneracy. The fiber identity makes
`π_n(ι_E(z_E)a)=0` on every missing-helicity subsequence; C2 lower
semicontinuity contradicts convergence to the target. Thus h_K is admitted
eventually on a convergent sequence. This is the explicit closed-hull detection
argument for this nonconstant subgroup bundle. It consumes the uniform-hull
proof pattern, not an unproved identification with the constant-H bundle.

**Fixed H̃ restriction support proofs.** The single completed fixed-label
table above includes the spinning complementary and both signed discrete rows,
including the actual q=1/2 labels and frequency0. Neither of these rows has a
complementary or trivial Lorentz constituent. Prove them as follows.
Consume M5.CompactInductionSupport and M5.LorentzTemperedSupport; do not create
new owners for their reduced-support or compact-projection-ideal theorems.

For spinning complementary prove the compact invariant norm equivalent, for
each fixed (p,λ), to the actual spin-bundle H^(−λ)(S³) norm. With equator
coordinate t and the native conformal multiplier D, prove `t'=t/D` and the
exact H̃-equivariance of `Tg=|t|^(−λ)g` from the λ=0 unitary model. Include the
spin cocycle, smooth bundle metric, compact-density and modular factors; a
scalar multiplier formula alone is insufficient. Prove the codimension-one
fractional Hardy inequality for 0<λ<1/2 by local charts and its Hilbert dual.
It makes T bounded L²→H^(−λ); prove injectivity in distributions and dense
range from smooth sections off the equator. Polar decomposition then gives
an actual H̃-unitary equivalence with the λ=0 restriction. No uniform Hardy
constant near λ=1/2 is asserted or used in the moving-label lower bound.

For signed discrete use its actual norm equivalent to H^(−λ), λ=q−1/2, on
its compact strip. Equator-supported Hilbert distributions have finite normal
jets of orders j<λ−1/2=q−1. Prove this strict condition, including the logarithmic
divergence at equality and absence of other supported Hilbert vectors. Their
associated H̃ inducing exponents are q−1−j>0. The nonzero Spin(2) weights have
nonreal Hermitian pseudoscalar; the scalar jet's possible unitary pieces have
minimum compact spin ≤q−1−j<q. The input contains only compact spins≥q, so the
closed equator-supported Hilbert subspace is zero. Own the resulting measurable
rigged-Hilbert disintegration lemma on the open hemispheres: countable test
sections and nuclear Sobolev regularization give actual nonzero fiber maps into
distributions almost everywhere, with domain continuity. The elliptic H̃
Casimir on H̃/SU(2) upgrades them to smooth eigensections; prove the relevant
elliptic estimates before evaluation at the base point. Compact evaluation
then forces spin p in the Lorentz fiber, hence |m|≤2p; compact spin presence
forces |m|≥2q and excludes complementary/trivial. The reverse inclusion follows
from the finite-null row and M4's finite-helicity zero-orbit weak support.
Generalized vectors without these Hilbert/disintegration/elliptic bridges do
not prove this support statement.

**Uniform exceptional atoms.** For π_(P,0), integral P≥l≥1, the Lorentz atom
P_(2l,0) has a minimal compact-spin-l vector, in compact coordinates
`(t,n)∈(−1,1)×S²`, proportional to
`(1−t²)^(−(l+1)/2) δ^(P−l)(t)Y_l(n)`.
Use compact volume `(1−t²)^(1/2)dt dΩ`. Prove its actual Hilbert membership,
H̃ intertwining and normalization. Its compact N=P+2k probabilities are
`w_k/Z_(P,l)`, k≥0, zero at all other N, where

```
w_k=(P+2k+1) Γ(P+2k−l+1)/Γ(P+2k+l+2)
    ·Γ(k+1/2)/Γ(k+1) ·Γ(P+k+1)/Γ(P+k+3/2),
Z_(P,l)=√π Γ(l)Γ(P−l+1)/[2Γ(l+1/2)Γ(P+l+1)].
```

Derive this from normalized S³ Gegenbauer harmonics and the actual regularized
form Γ(N+1−P)/Γ(N+P+2). The normalization is the Rogers–Dougall 5F4 identity
(DLMF16.4.9) with a=P+1, b=(P−l+1)/2, c=(P−l+2)/2, d=1/2; its excess is l>0.
Prove, using finite gamma products and Gautschi bounds,
`Prob(N>CP)≤C_l(C−1)^(−2l)` for C≥3, uniformly P≥l, including P=l=1.
Pin the exact real-Killing normalization before using M0: in the native
5×5 model `B_𝔤(X,Y)=3Tr(XY)`, so the ten J_ab are orthogonal with
`B_𝔤(J_ab,J_ab)=−6ε_aε_b`. Consequently
`C_M0=−Ω/6`, `Δ_K=C_K/6`, where `C_K=−Σ_(0≤a<b≤3)J_ab²`, and the
unscaled positive sum of squares is
`N_G=1+Ω+2C_K=6N_M0−5`. Prove these algebraic form identities and the
positive operator/core comparison; in particular `N_M0≤N_G≤6N_M0`.
On compact (N,M)=(N,0), C_K=N(N+2), so on π_(P,0)
`N_G=3−P(P+1)+2N(N+2)`, N≥P≥1. It is diagonal in the actual K types
and uniformly comparable to 1+P²+N². Use this positive N_G in the closed-form,
Ad-transport and fractional-power comparisons below.
For each 0<a<min(1,l), M0's Nelson form comparison, its compact-H̃ Ad-transport
bound, Loewner–Heinz and spectral calculus then give

```
‖(π_(P,0)(exp(rX))−1)π_(P,0)(h)v_(P,l)‖
   ≤ C_(X,l,compact h) (rP)^a.
```

Use the atom's fractional domains for this estimate.
Cyclic H̃-translates prove survival uniformly exactly when rP→0; necessity is
the central condition. Consume M5.ScalarLorentzBranching as the
owner of existence/multiplicity; this clause owns the explicit norm/tail adapter.

**Every moving zero-orbit row.** Use M4's canonical principal representative
P_(m,ω), m≥0; ω≥0 if m=0, ω∈ℝ if m>0. Define A_m(d) by

```
ν_(p,σ):  0≤m≤2p and m≡2p mod2;
π^±_(p,q): 2q≤m≤2p and m≡2p mod2;
π_(P,0):  m=0;
trivial:  false.
```

Put B_(m,ω)(d) true precisely for m=2l>0, ω=0 and d=π_(P,0) with P≥l.
Set η_(m,ω)(d)=0 when A_m or B_(m,ω) holds. Otherwise, only for the target
P_(2,0), set `η=3/2−√(1/4−σ)` when d=ν_(0,σ), −2<σ<0; set η=∞ in every
other case. Then prove the total mixed-sequence formulas

```
P_(m,ω) ∈ L  ⇔  Q_null(r_n,d_n)+η_(m,ω)(d_n)→0,
P_(m,ω) ∈ C  ⇔  liminf_n [Q_null(r_n,d_n)+η_(m,ω)(d_n)]=0.
```

For target C_s, 0<s<1, put
`η_s(d)=|√(1/4−σ)−(s+1/2)|` if d=ν_(0,σ), −2<σ<0, and ∞ otherwise.
For the Lorentz trivial target put η_1(d)=0 for the de Sitter trivial label,
`η_1(d)=3/2−√(1/4−σ)` on that same scalar interval, and ∞ otherwise. In both
cases membership in L means η(d_n)→0 and membership in C means liminf η=0.
These latter conditions already imply Q_null→0. There are no other zero-orbit rows.

For upper bounds consume M5.UniformLorentzUpper's single constant-H̃
multiplier/closed-hull lemma, the completed support table and M5.LittleDual's
full Fell topology. For each target and δ>0, form the full-Fell-closed union
of the restriction supports with η≥δ; the table and LittleDual endpoint rules
show that it excludes the target. Apply the consumed uniform lemma to this
closed set, rather than requiring convergence of the restriction Hilbert models. In particular complementary
C_s as s↑1 has exactly the extra Lorentz limits {1,P_(2,0)}, whereas all principal
families are closed and their m coordinate is discrete. For lower bounds A_m
uses the proved finite-null row followed by M4's finite-helicity weak support;
B uses the uniform exceptional-atom estimate. The scalar interior uses a
fixed-parameter H̃ coefficient approximation, continuous compact finite-window
forms and diagonalization. At σ↓−2 use M5.DeSitterFiber's separately metrized
π_(1,0) and trivial endpoints, fixed compact finite-window vectors and a uniform
Nelson bound for exp(rX); this proves joint (r,σ) convergence with no relative
rate restriction. Explain the diagonal finite-vector estimates for arbitrary
mixed sequences. Keep the source, algebraic calculations, analytic theorem
targets and established native proofs distinct.

**M5.DeSitterRemainingTransitions — every remaining target and a computed full basis.**
Prove the following fixed all-sequence transition rows, consuming the preceding
native F/Spin, central, finite-null and zero-orbit adapters, including their
Hilbert completions, common domains and compact-uniform coefficient estimates.
All existing de Sitter labels, strict ranges, endpoint constituents, both center
sectors and energy branches remain. Let r_n>0→0 with arbitrary mixed d_n. Write
L for whole-sequence limits and C for subsequential limits as in the total table.

For a massive target M_(ε_E,m,j), m>0, define e=∞ off the continuous principal
source family with p=j, and `e=|r√(σ−1/4)−m/ℏ|` on that family. Then
`M∈L ⇔ e(r_n,d_n)→0`, `M∈C ⇔ liminf e(r_n,d_n)=0`. Integer principal ν=0
is allowed as a source label; the limiting condition itself excludes it on a
massive tail. The same condition holds for each ε_E separately, so both branches
occur. Central necessity forces p bounded, then p=j eventually; spinning
complementary, signed discrete, scalar exceptional and trivial inputs cannot
produce q(P)>0. This is an eventual-source conclusion, not an assumption imposed
on the arbitrary sequence.

For a continuous-spin target C_(ε_E,ρ,e), at M4 reference energy r0=1, define

```
e_CS(r,d)=rp+rν+|r√(p(p+1))√(ν²+1/4)−ρ/ℏ|,
ν=√(σ−1/4),
```

on continuous principal inputs with p≡e mod1, and ∞ otherwise. Prove membership
in L iff e_CS→0, and in C iff liminf e_CS=0. These conditions force p,ν→∞.
They retain both center sectors and both energies. In native units
r²Ω′→−ρ²/ℏ², since M4 fixes q(W)=−ℏ²ρ² at r0=1. Do not drop this ℏ conversion.
Only principal inputs can have q(P)→0 and this nonzero negative quartic value;
q=1/2 discrete limits instead have r²Ω′=−r²p(p+1)/4 and cannot satisfy both.

For a spacelike target S_(a;τ), physical a>0, put l(d)=p on continuous/signed
discrete inputs, l(d)=P on π_(P,0), and0 on trivial. Define χ_τ(d) by this
complete table; unlisted cases have value∞:

| spacelike little target τ | source d and χ_τ(d) |
| --- | --- |
| E_t=I_(0,it), t≥0 | continuous integer p≥1: `|σ−(1+t²)/4|` |
| O_t=I_(1,it), t>0 | continuous half-integer p: the same value |
| C_s=I_(0,s), 0<s<1 | continuous integer p≥1: `|σ−(1−s²)/4|` |
| D_n^χ, n≥1 | `π_(p,n/2)^χ`:0; additionally n=1 on continuous half p: `σ−1/4`; n=2 on continuous integer p≥1:σ |
| 1 | π_(P,0):0; continuous integer p≥1:σ |

Prove `S_(a;τ)∈L ⇔ |rl(d_n)−a/ℏ|+χ_τ(d_n)→0`, and membership in C iff the
liminf of this joint nonnegative error is0. The D1 rows are both limits. The
D2 rows and trivial are the three distinct even complementary-endpoint targets;
the scalar exceptional source contributes only trivial, not D2±. Consume
M5.UniformLorentzUpper's scalar-source exclusion for this distinction.
Consume and extend M5.DeSitterNullZero's noncompact E=ℝ³⋊Spin(3)
subgroup-bundle multiplier, with its full norm, strict extension, fiber0 and
closed-hull comparison. Own the following spacelike restriction calculation
on both energy patches. For E's character momentum k=−p_space/ℏ, identify
its direction stabilizer by the rotation r_θ=exp(−θJ01) transported to k/|k|.
In the source Fourier frame dJ01=−iS_2, hence r_θ acts by exp(ifθ);
the E-orbit weight is f. In the spacelike Wigner frame the actual little
compact weight is m_K=−2f. Thus conventional signed little helicities
χ(n₀/2+ℕ₀) correspond to E weights −χ(n₀/2+ℕ₀), with no energy-sign
change. Prove the frame comparison, including the overlap cocycles, directly
from the fixed Wigner sections; export these exact E spectra:

| spacelike τ | E weights, at every character radius ρ>a/ℏ |
| --- | --- |
| E_t or C_s | ℤ |
| O_t | ℤ+1/2 |
| D_(n₀)^χ, including n₀=1 | −χ(n₀/2+ℕ₀) |
| 1 | {0} |

The orbit measure has full radial support ρ∈[a/ℏ,∞); its two energy patches
have positive measure above threshold, and the threshold is a support point,
not an additional constituent. Derive the restriction by translation-PVM
uniqueness and M1's orbit disintegration, not a compact Spin3-type test.
For any missing E weight f₀, use the closed complement of its positive-radius
component and the detecting ideal element from the existing E multiplier
owner. Each allowed target weight has full radial support above threshold,
so the same C2 closed-hull exclusion forces f₀ to occur eventually in the
source E-weight set −H(d_n). Since a π^χ source has E weights of sign −χ,
this excludes S_(a;D_(n₀)^(−χ)) and the weight0 trivial target. At the even
endpoint, continuous sources contain both signs and0, so this exclusion
retains all three targets. This proves the required spacelike chirality
upper bound using E, which is noncompact. Scalar p=0 continuous inputs are absent from every spacelike row.
All higher discrete q, limits,
complementary parameters and principal parities are retained.

Own the full upper calculation. For continuous sources set x=r²p(p+1), y=σ.
The central equations give `x−r²y→(a/ℏ)²` and
`xy→(a/ℏ)²q_B(τ)`, so x stays positive, y stays bounded and tends to q_B(τ).
For signed discrete put z=q(q−1); then `x+r²z→(a/ℏ)²`,
`xz→−(a/ℏ)²q_B(τ)`. Since p≥q, an unbounded q would make the quartic diverge;
q is bounded and its discrete values, center and compact weights give precisely
the table. Scalar exceptional has q_B0 but the consumed uniform Lorentz lemma
selects only1. For massive and continuous-spin targets similarly derive the
stated source/parameter conditions from both central equations and compact
parity; central values alone do not distinguish endpoint constituents.

**Uniform lower models and the chart lemma.** Use M5.DeSitterNullZero's exact
line isometries, with f=−physical helicity, κ_f=μ(μ+1)−f²−s and
`E_(r,f)=√(ρ_k²−r²κ_f)`. On fixed compact momentum annuli the WKB-corrected radial
phase has `φ'=(ε_E/r)(√(1−r²κ_f/ρ_k²)−1)`. The exact boost diagonal is
`ε_E E_(r,f)D_i+ε_Er²κ_f u_i/(2ρ_k E_(r,f))+(ir/2)T_(f,i)`;
adjacent magnitudes are rA_±/(2ρ_k), with M5.DeSitterNullZero's A formula.
On each fixed weight window adjacent radial phase differences tend to0.

In the massive regime p=j, `E_(r,f)→√(ρ_k²+(m/ℏ)²)` and
`rA_±→(m/ℏ)√(j(j+1)−f(f±1))`. Own the actual normalized-basis intertwiner
with M4's finite-spin Wigner-induced model. The carrier d³k/ρ_k is the unitary
rescaling by √(ρ_k/E) of d³k/E; its half-divergence term has the negative sign
shown by κ→−m²/ℏ². Fixed fiber phases identify both energy gauges.

In continuous spin, E_(r,f)→ρ_k and rA_±→ρ/ℏ. At the actual null base
|k|=r0/ℏ, compute the little matrices `N_re=−K_1−B_0`, `N_im=−K_0+B_1`.
Their limit shifts give `i(ρ/(ℏ|k|))cosθ` and its sine partner. Thus the
actual w-character radius is ρ/r0, exactlyρ at r0=1, with both center parities.
This pins the factor2 through the native Δ matrices, rather than identifying
radius solely from a quartic scalar.

In a spacelike chart ρ_k>a/ℏ+δ, `E_(r,f)→√(ρ_k²−(a/ℏ)²)` and
`rA_±→(a/ℏ)√(s+f(f±1))`. The actual little compact weight is m_K=−2f.
Compare the normalized ladder with M4.SL2R; q_B=s and the allowed chains give
exactly the principal/complementary/discrete/limit/trivial guides above.
At σ→0 or odd ν→0 the separating edge coefficients vanish. This proves all
endpoint lower rows without a relative σ/r or ν/r condition. For π_(P,0),
μ=0, f0 is the only line, κ=P(P+1) and there is no adjacent coupling: rP→a/ℏ
gives the scalar little1 model. The positive half-divergence agrees with the
same √(ρ_k/E) density comparison. No μ=P spinning surrogate is allowed here.

Fix the actual local Wigner sections, so the little-model comparison is an
explicit calculation. Let R_v∈Spin(3) send e2 to v on a smooth sphere patch,
and a_t=diag(e^(t/2),e^(−t/2)). For massive a=m/ℏ use
`R_(−ε_Eu)a_χ`, sinhχ=ρ_k/a. For spacelike a=a_phys/ℏ use
`R_(−u)a_χ`, sinhχ=ε_E√(ρ_k²−a²)/a. For null use
`R_(−ε_Eu)a_log(ℏρ_k/r0)`. Differentiate the exact M1 Wigner cocycle and
Radon–Nikodym square root on these sections. In the massive case the rest
magnetic weight is −ε_E f; for ε_E=+ use the fixed Weyl rotation
w=exp(πB_1) and `D_j(w)e_m=(−1)^(j−m)e_(−m)`, fixing its phase. In the
spacelike case the compact weight is m_K=−2f. Normalize each connected little
weight chain at one basis vector and recursively match the source factor
c+λ (with its positive form ratio) to M4's fixed E_± coefficients; the finite
product of these unit complex phases is the basis intertwiner. At a zero edge
normalize each surviving chain separately. This compares actual matrices and
completed norms, not only Casimirs or unitary-dual names.
On overlaps of sphere patches R_v, prove that the two Wigner sections differ
by the actual stabilizer cocycle and that the normalized chain intertwiners
transform by exactly that unitary. Use DeSitterNullZero's intrinsic line-bundle
connection and the recursively fixed fiber phases; derivatives acquire its
connection transformation law. Glue local sections with a smooth partition
of unity in the associated bundle, comparing overlap coefficients with those
unitaries. The phase and density factors are radial and agree on overlaps.
This supplies sphere-patch gluing independently of the turning-set chart lemma.

On a fixed finite weight window |f|≤L and compact annulus (with a fixed
positive distance from the spacelike turning set), prove the following concrete
error bounds for each generator and finitely many target derivatives:

```
massive: C_j [r+|rν−m/ℏ|];
continuous spin: C_L [r+e_CS+1/p+1/ν];
spacelike continuous: C_L [r+|r√(p(p+1))−a/ℏ|+√|σ−q_B(τ)|+1/p];
spacelike signed fixed q: C_L [r+|r√(p(p+1))−a/ℏ|+1/p];
spacelike scalar exceptional: C [r+|r√(P(P+1))−a/ℏ|].
```

The spacelike continuous bound applies to each selected endpoint constituent;
the vanishing separating edge is bounded by the displayed square-root term.
Constants depend on the fixed target/window/chart, not incoming labels or
boundary rates. Weighted tail domination below upgrades these finite-window
bounds to the actual smooth target flows.

For infinite target fibers use smooth compact-weight rapidly decaying vectors,
not only finite tests. On admitted source |f|≤p the original positive product
gives `rA_f≤C(1+|f|)` in the stated regimes; also `rf²≤(rp)|f|`. Away from
the turning set all exact phase terms and momentum derivatives have uniform
polynomial weight bounds. Truncation to |f|≤p, target weight-moment estimates
under compact little actions, and dominated weighted Sobolev convergence give
the actual generator error and boundary-tail control. Prove the completed Spin
isometries, common smooth domains and integration via M0; comparing finite
windows alone does not establish this infinite-fiber theorem.

Own a local-to-global Fell coefficient lemma so the spacelike energy-zero
surface is handled explicitly. Use a cyclic target vector compactly supported
inside the connected chart U={energy>0} of the spacelike orbit. Its stabilizer
SL2R is connected. If p,hp lie in U, lift a path in U and then a path in the
stabilizer to obtain h(t) from1 to h with h(t)p∈U; a small neighborhood of p
stays in the chart throughout. Finite compact partitions reduce every overlap
coefficient to such paths, where the uniform local Duhamel proof applies.
Refine disjoint endpoint momentum pieces into small patches so each pair has
a separating real normal generator
v·rΠ. Fourier functional calculus and the translation estimate give its smooth
spectral cutoffs on embedded vectors; exact H covariance gives the cutoffs
after π(h). Disjoint spectral intervals force the cross coefficient to0.
Prove the uniform finite partitions and domain/cutoff estimates. This computes
coefficients on arbitrary compact H sets without running a single WKB chart
through its turning point or assuming an unproved global Airy gluing. Apply
the same lemma to a massive chart avoiding its rest point; null compact flows
map each compact annulus into an enlarged compact annulus bounded away
from0 and∞. Take every generator, phase and Sobolev constant on that enlarged
annulus and its finite product-chart images. Together with the actual little-model comparisons,
this proves the lower directions of every displayed row.

**Computed full DNC basis.** Let g_b(y) be exactly the preceding explicit
Poincaré scalar gauge for flat target b and flat source y, with its pinned
LittleDual endpoint gauges. Define finite flat proxy lists with the following
nonnegative thresholds. A null proxy H_(ε,εh_K) uses physical helicity h_K; the second
index is M4's inducing weight, so the past index is reversed.

| positive source d | proxy lists and threshold for each list |
| --- | --- |
| continuous σ>0, spin p | list A: if σ>1/4, both M_(ε,ℏr√(σ−1/4),p); if0<σ≤1/4, all H_(ε,εh_K), h_K=−p,…,p. Threshold rp. If p>0 also list B: S_(ℏr√(p(p+1));τ_σ), threshold `1/(p+1)+r√max(σ−1/4,0)` |
| scalar continuous −2<σ≤0 | H_(+,0),H_(−,0), plus Z_(C_(√(1/4−σ)−1/2)) when σ<0; threshold 0 |
| π_(p,q)^χ | list A: H_(ε,εh_K), all h_K∈H(d), ε=±, threshold rp. List B: S_(ℏr√(p(p+1));D_(2q)^χ), threshold 1/(p+1) |
| π_(P,0) | list A: H_(±,0) and Z_(P_(2l,0)),1≤l≤P, threshold rP. List B: S_(ℏr√(P(P+1));1), threshold 1/(P+1) |
| trivial | Z_1, threshold 0 |

Here τ_σ is E_(2√(σ−1/4)) for integer p and σ≥1/4, O_(2√(σ−1/4)) for
half p (strict σ>1/4), and C_(2√(1/4−σ)) for0<σ<1/4. In every list ε runs
over both branches. Define only the proof-bookkeeping scalar

```
p_b(r,d)=r+min_lists [threshold+min_(y in that finite list)g_b(y)].
```

All minima are finite lists with explicit integer bounds; empty lists have∞.
No operator, coefficient or unspecified Fell-open set defines membership.
The thresholds ensure each approximation is used in precisely a valid asymptotic
regime. In particular a single scalar spacelike proxy at every fixed P would
wrongly add infinitely many zero atoms; the finite low list preserves l≤P.
The mass proxy uses rν, not r√σ, so it really tends to the correct null list
at the odd positive-fiber endpoint.

For the required closed-form membership, eliminate the finite-list minima as
follows. Put N_b(d)=0 for a finite-null target precisely when its physical
helicity lies in H(d); for a zero-principal target precisely when the already
explicit A_m(d) or B_(m,ω)(d) holds; put N_b(d)=∞ otherwise. These are the
preceding fixed integer interval/congruence tests, with no minimization left.
Let ε_b be the target energy when it has one, and+ otherwise. For σ>0 put
ν_+=√max(σ−1/4,0) and

```
L_b(r,d)=g_b(M_(ε_b,ℏrν_+,p)) if ν_+>0,
         N_b(d) otherwise.
```

Define q_b only by the following closed-form table:

| d | q_b(r,d) |
| --- | --- |
| continuous σ>0 | `r+min(rp+L_b, 1/(p+1)+rν_++g_b(S_(ℏr√(p(p+1));τ_σ)))`; omit the second term when p=0 |
| π_(p,q)^χ | `r+min(rp+N_b, 1/(p+1)+g_b(S_(ℏr√(p(p+1));D_(2q)^χ)))` |
| π_(P,0) | `r+min(rP+N_b, 1/(P+1)+g_b(S_(ℏr√(P(P+1));1)))` |
| scalar continuous −2<σ≤0 | `r+T_b(√(1/4−σ)−1/2)` |
| trivial | r if b is zero trivial, ∞ otherwise |

For 0<s<1, T_b(s)=0 on finite-null h_K=0 and every zero P_0(ω);
T_b(s)=1−s on zero P_2(0) and zero trivial; T_b(s)=|s−s_*| on zero C_(s_*);
and T_b(s)=∞ on every other target. At s=0 retain only the first zero case,
and put∞ elsewhere. Here P_0(ω) uses its canonical ω≥0. Thus q has at most
one binary minimum; every other operation is an explicitly substituted scalar
g_b entry, absolute value, square root or fixed integer test. The proxy lists
are proof bookkeeping. They do not give a second definition of q_b: in
general p_b≠q_b. Prove their sublevel equality {p_b<δ}={q_b<δ} for every
admissible δ specified below, by the displayed scalar gauges and incidence
tests. For example at Z_(P_(2l)(ω_*)), ω_*≠0, a scalar exceptional low proxy
has finite cost at least |ω_*|, while N_b=∞; δ<|ω_*|/2 excludes it in both
sublevels. No operator or decomposition oracle defines membership.

For every arbitrary sequence r_n→0, prove `b∈L ⇔ q_b(r_n,d_n)→0` and
`b∈C ⇔ liminf q_b(r_n,d_n)=0`, by all the computed rows and the existing
Poincaré table. On a selected mass threshold rp→0, its q(P) error vanishes; on a
selected high-spin threshold p→∞ and rν_+→0, the spacelike q(P) error vanishes.
The quartic and compact-weight conditions agree with every target row.
Take subsequences to handle switching lists or families; no bounded-spin or
eventual-family hypothesis is introduced.

Let R_b be the minimum of1 and the applicable flat bounds
m*/2, r*/2, ρ*/4, t*/2 and |ω*|/2 stated in M5.PoincareDual, together
with half the distance to every excluded endpoint or special point in its
M5.LittleDual interior chart. Thus include t*/2 for an even-principal
little target with t*>0, and min(s*,1−s*)/2 for complementary interior
centers. Omit bounds whose coordinate is absent or whose endpoint is the
retained center itself. All retained centers use the endpoint gauge, not
an interior chart crossing that endpoint. For rational
0<δ<min(1/4,R_b), put

```
U_(b,δ)={zero y:g_b(y)<δ}
        ∪{positive(r,d):r<δ and q_b(r,d)<δ}.
```

Prove these and the existing positive-fiber product neighborhoods form the
full DNC topology. At a positive-fiber endpoint each selected endpoint proxy
is a flat limit of incoming proxies whose threshold tends to the endpoint threshold. For π_(1,0), its high
threshold 1/2 is excluded by δ<1/4; its low F0/P2 proxies are supplied by the scalar
C_s endpoint. For every integer p≥2, include explicitly the endpoint
ν_(p,σ)→π_(p,0) as σ↓0. The incoming low branch contains every scalar
endpoint proxy: h_K=0 and all P_(2l)(0),1≤l≤p, since A_(2l) holds there.
The high branch has C_(2√(1/4−σ))→1, with the same limiting threshold 1/(p+1).
Together these prove openness at π_(p,0), without treating it as a flat
little-dual endpoint. The odd ν→0 threshold rν tends to0; it need not be bounded
by its endpoint value. The universal cost r makes the trivial endpoint compatible.
At zero y with g_b(y)<δ, any actual convergent positive sequence selects, from
q_y→0, flat proxies approaching y with threshold →0, so q_b<δ eventually. Zero terms
use the flat basis. Consume the preceding DNC construction's actual separability, fiberwise GCR,
M2 same-kernel/Fell comparison and C2 primitive-space second-countability
proofs, which already make this dual first countable; do not introduce a
second owner or an unowned extension-permanence theorem. Sequential openness thus
proves each U open. Conversely, at a zero point b, if no sufficiently small U_(b,δ) lies in
an actual Fell neighborhood O of b, choose z_n∈U_(b,δ_n)∖O with δ_n↓0.
The fixed-b L theorem (and the flat theorem on zero terms) gives z_n→b,
a contradiction. This proves cofinality in the needed direction, independently
of a guessed topology on labels.

Own the center-perturbation lemma before restricting centers to rationals.
In each fixed discrete-label interior flat chart retain the sign/parity and
exclude the exceptional zero values of t or ω; keep all such zero and endpoint
labels as separate chart centers. Use its displayed real coordinate distance
|b−b′|_chart (maximum in product charts). On a compact subchart prove

```
g_b(y) ≤ g_(b′)(y)+C|b−b′|_chart,
q_b(r,d) ≤ q_(b′)(r,d)+C|b−b′|_chart,
```

and the reverse inequalities, on all source labels, in the extended sense.
Use a finite local Lipschitz constant C for the actual chart coordinates,
computed term by term on that compact subchart; C need not be1. For example,
|σ−(1+t²)/4| has target-coordinate constant at most T/2 for |t|,|t′|≤T,
and |rl−a/ℏ| has constant1/ℏ in a. If a nonlinear gauge parameter itself is
used as coordinate, its absolute-value term has constant1, but transport back
to t or a with the displayed bound. In maximum-coordinate product charts,
add constants for sums and take their maximum for min/max operations. Verify source-incidence tests are unchanged within
the subchart, including N_b, and apply the triangle inequality termwise to
L_b, T_b and the spacelike g_b term; min and max preserve the same bound.
For Lorentz principal ω≠0 do not cross ω=0, and for scalar/spacelike
complementary charts stay inside0<s<1. Endpoints and all discrete centers
are retained separately. Prove the same lemma for flat g first from
M5.LittleDual/PoincareDual's formulas. It implies that for any b and any
small U_(b,δ), a sufficiently nearby rational center b′ and rational δ′
can be chosen with b∈U_(b′,δ′)⊆U_(b,δ), keeping every admissible-radius
bound strict. This gives rational-center refinement; at retained endpoints
only rational radii are needed. Positive-fiber product charts have the same
coordinate argument. Every proxy has the source covering-center character,
so the two sectors are open and closed; q_b≥r gives continuity of the base
map. Thus the resulting countable family is a basis of the actual Fell
topology. This completes the fixed labelled basis/table specification for
all target families; all analytic estimates and supplier comparisons stated
above remain mandatory proof targets, not established native results.

Export the entire mixed-fiber tail table explicitly: set D_b(z)=g_b(z) on
the zero fiber and D_b(r,d)=q_b(r,d) on positive fibers. For every sequence
of arbitrary labels, its zero-fiber L set is exactly {b:D_b(z_n)→0}, and
its zero-fiber C set exactly {b:liminf D_b(z_n)=0}. Positive-fiber limits
are exactly r_n→r_*>0 with eventual positive labels and convergence by the
fixed de Sitter incidence basis; clusters use the joint subsequence criterion.
No eventual choice of family, sign, center, proxy list or parameter rate is
imposed on the original sequence.

**M5.StructuralModelComposition — uniform positive-to-zero sections.**
Consume M5.UniformZeroModel and M5.DeSitterNullZero, including the
completed WKB maps and the joint scalar endpoint estimates. Own normalized
positive-fiber coefficient sections for every zero-principal row, including
arbitrary mixtures. First, on a sequence with A_M(d_n) eventually and
Q_null→0, choose h_(K,n) from {−M/2,+M/2}∩H(d_n) and either permitted
energy ε_n. This finite choice exists by the explicit A_M interval/parity test.
Construct sections converging to the actual M4 target P_M(ω), with no extra
rate condition. This finite-null composition applies only on this A part.

Fix a countable dense core of smooth target vectors, compact DNC coordinate
exhaustions K_J, and for each permitted pair (ε,h) the normalized finite-null
Mellin wave-profile map V_J^(ε,h) from M5.UniformZeroModel into F^ε_(εh).
There are at most four such pairs, since h∈{−M/2,+M/2}; identify duplicates
when M=0. Use one energy interval [a_J,b_J] containing all their supports
and its compact Lorentz images. Choose their widths, centers and smooth
cutoffs so that b_J→0 and every logarithmic width tends to∞. Write err_J
for the maximum of their zero-target coefficient errors on the first J
vectors and K_J; this finite maximum tends to0. For each fixed J prove the
positive-fiber WKB/completed-carrier map U_(n,J)^(ε,h) on those very wave profiles, including
their actual derivatives, fiber weights and density factors, satisfies

`max_(u,v≤J;g∈K_J)|⟨π_(r_n,d_n)(g)U_(n,J)^(ε_n,h_(K,n)) V_J^(ε_n,h_(K,n)) u,
  U_(n,J)^(ε_n,h_(K,n)) V_J^(ε_n,h_(K,n)) v⟩
 −⟨F^(ε_n)_(ε_n h_(K,n))(g)V_J^(ε_n,h_(K,n)) u,
  V_J^(ε_n,h_(K,n)) v⟩|≤B_(n,J)`,

where B_(n,J) is the maximum of the explicitly computed finite-window
estimates from M5.DeSitterNullZero over the permitted (ε,h) pairs at n.
For each fixed J each of the finitely many estimates tends to0 on its
applicable source subsequence, hence B_(n,J)→0. Include the wave-profile pair in
the domain of each U map; no map between different null carriers is implicit. Include the normalization/Gram
errors in B_(n,J); normalize exactly on each finite-dimensional core span.
Compute B_(n,J) on [a_J,b_J] and its K_J images, rather than substituting a
fixed-annulus constant into a growing-window claim. The finite choice of
(ε_n,h_(K,n)) allows one common bound. Taking a nondecreasing core/compact
exhaustion, choose integers N_J≥J recursively so that N_J>N_(J−1) and
B_(n,j)<2^(−J) for every n≥N_J and j≤J. Put
J(n)=max({J:N_J≤n}∪{1}) on the eventual tail and use
U_(n,J(n))^(ε_n,h_(K,n)) V_(J(n))^(ε_n,h_(K,n)).
Then J(n)→∞, the positive-to-null error tends to0 on each fixed compact/core
set, the Mellin error err_(J(n)) tends to0, and the translation error is at most
C_K b_(J(n))/ℏ. Prove extension to all vectors by the isometry and contraction
bounds. No input rate is added: N_J is chosen after the given sequence and its
finite-window estimates, not prescribed as an additional inequality on labels.

Use polarization and normalized Gram corrections on the nested finite spans to
supply a compatible family of coefficient sections; apply HilbertModules H5's
reconstruction to the pullback DNC field over the convergent-sequence base.
Prove continuity of the sections at the limit with the displayed estimates,
and continuity at its isolated source points directly. This does not assert a
single uniform identification for all sequences or an ambient continuous field
without proof. Export the actual section maps, norm identities, common core,
compact-uniform errors and constituent multiplicities. For all other named
mandatory models, retain their own stated field/base and identifications.

For a general sequence satisfying Q_null+η_(M,ω)→0, partition its indices
in the following fixed priority order: A_M(d_n); then B_(M,ω)(d_n) with A_M
false; then the remaining scalar endpoint indices. On the first part use the
construction above. On the second part M=2l>0, ω=0 and d_n=π_(P_n,0), P_n≥l;
Q_null→0 implies r_nP_n→0, so use the uniform exceptional-atom sections of
M5.DeSitterNullZero. On the last part necessarily (M,ω)=(2,0),
d_n=ν_(0,σ_n), σ_n→−2, so use that clause's joint scalar endpoint lower
construction. Every infinite part has its own subsequence exhaustion and
slow diagonal; finite parts impose no limiting constraint. On each nested
finite target span normalize its Gram matrix exactly and combine the three
families by their index partition. For each fixed core/compact test, each
infinite part's error tends to0, hence so does the whole sequence's error.
Apply the same pullback-field reconstruction over the convergent-sequence
base. No common nonzero helicity is asserted on B or scalar endpoint terms.
This partitioned structural model is mandatory on all mixed rows, while the
finite-null factorization alone has the stated eventual-A hypothesis.
For each cluster (C) row take any subsequence along which the joint
nonnegative error tends to0 and apply exactly this A/B/scalar-endpoint
partition and section construction to that convergent subsequence. No
partition, energy, helicity or family need be eventual on the original
sequence; the whole-sequence (L) result and subsequence (C) result retain
their distinct quantifiers.

**Complete labelled dual and its topology.** Determine the Fell topology of
`Â` for the full algebra `A=C*(DNC(G̃,H̃))` constructed above. Fix its underlying
label set before constructing its topology. Let `D` be exactly the de Sitter
irreducible list in this milestone: the trivial label; `π_(p,0)` with integral
p≥1; `π^±_(p,q)` with the displayed integral or half-integral p,q lattices;
`ν_(0,σ)` for σ>−2; and `ν_(p,σ)` in the displayed strict ranges.
Use the already proved identifications of reducibility constituents with these
irreducible labels; an excluded parameter value is not itself a new irreducible.
Let `P` be M4's full, nonredundant Poincaré label set: both timelike energy
orientations with m>0 and every SU(2) spin; every spacelike orbit parameter
and every unitary SL(2,ℝ) little-group label; both null energy orientations,
all integer rotation-character labels and both central-character sectors of
nonzero-radius continuous spin; and the zero orbit with every unitary
SL(2,ℂ) label. Quotient these labels by exactly the equivalences proved in
M4 and the de Sitter classification. Define
`X=((0,∞)×D) ⊔ ({0}×P)`, with base coordinate r=1/R on the first summand.
Split X into the two subsets on which the covering center acts as +1 or −1.
The ordinary-group answer is the +1 subset, with its relative topology.

Construct an explicit countable basis `B_k⊆X`, k∈ℕ, and prove that the label
bijection `X→Â`, sending `(r,d)` to `π_d∘ev_r` and `(0,b)` to `ρ_b∘ev_0`,
is a homeomorphism. Give the basis membership conditions family by family
in the real and discrete labels above, including the conditions for a
positive-radius label to lie in a neighborhood of each zero-radius label.
These conditions must be closed-form expressions in the listed real/discrete labels: r,p,q,σ, the timelike m,j, spacelike radius and SL(2,ℝ) labels, null ℓ/ρ/center label and zero-orbit SL(2,ℂ) labels. Specify every scalar function, inequality, congruence and label equivalence used. Neither operator norms nor matrix coefficients nor integrated representations may define the membership functions, even for a fixed countable family of test sections; they may be used only to prove the label formulas. Prove that they form a basis, that the base
map is continuous, and that the two central-character subsets are open and
closed. Compute the full positive-fiber de Sitter dual topology and the full zero-fiber Poincaré dual topology as part of this M5 target. M4 supplies the irreducible labels, selected null weak-support identities and the principal SL(2,ℂ) subset topology; it does not supply the full fiber topologies. Own the full SL(2,ℝ) and SL(2,ℂ) little-group dual topologies and their endpoint identifications needed here, the de Sitter reducibility-boundary topology, and every varying-orbit transition in the Poincaré dual, including timelike m→0, spacelike radius→0, continuous-spin radius→0 and null/zero-orbit limits with varying little-group labels. Recover these fiber topologies from the explicit total-space basis and prove compatibility with the independently constructed fiber Fell topologies. The displayed set-theoretic disjoint union does not prescribe a disjoint-union topology.

The basis formula and homeomorphism are the topological classification
target. Defining `B_k` by pulling back unspecified Fell neighborhoods,
by testing arbitrary elements of A, or by naming the set of parameters
whose representations converge does not give the required parameter-space
answer. Use compactly supported DNC sections and their integrated operators
to prove the comparison with the computed basis. Own the simultaneous
small-r and varying-label estimates needed for this comparison, deriving
them from this milestone's normalized induced/K-type models and their
explicit coefficients. Prove both the neighborhood lower statements and
the exclusions, including at every reducibility boundary. Matching the two
Casimir scalars supplies checks on these estimates, rather than the basis.

**All-sequence contraction classification.** From that explicit basis compute
two set-valued functions `L,C` on every sequence `(r_n,d_n)` with r_n>0,
r_n→0 and arbitrary d_n∈D. Their values are subsets of P. Prove, for every
such sequence and every b∈P,
`b∈L ⇔ (π_(d_n)∘ev_(r_n))→(ρ_b∘ev_0)` and
`b∈C ⇔ ∃ strictly increasing k:ℕ→ℕ,
  (π_(d_(k n))∘ev_(r_(k n)))→(ρ_b∘ev_0)`.
Define exactly what the full-family table displays. For each zero-fiber label b set `N_j(b)=⋂_{k≤j,b∈B_k}B_k`, using X for an empty intersection. Prove these are a nested neighborhood basis at b. For each of the six target orbit families and its little-group label ranges, expand membership `(r_n,d_n)∈N_j(b)` into the computed closed-form scalar inequalities and congruences. The row for L is exactly `∀j ∃N ∀n≥N, (r_n,d_n)∈N_j(b)` in that expanded parameter form; the row for C is exactly `∀j ∀N ∃n≥N, (r_n,d_n)∈N_j(b)`. Prove the latter is equivalent to a strictly increasing convergent subsequence by the nested countable basis. This family-by-family expansion, including emptiness, is the table; it introduces no further open-ended selection of regimes. The quantified basis tests alone, before the label functions and their expanded conditions have been computed, do not supply the table.
Include empty values explicitly. Retain different limits of one sequence
when the topology is non-Hausdorff, and distinguish L from C.

The quantifiers include fixed labels, unbounded spin, every approach to a
strict reducibility boundary, simultaneous changes of family, and arbitrary
oscillation. Compute the principal frequency/σ dictionary from the inducing
operator and prove invariance under the signed-frequency Weyl equivalence;
the sign selects a realization of the same dual point. The table must
resolve bounded and unbounded p,q,σ, finite nonzero and zero scaled mass,
infinite scales, and mixed scales that retain little-group data, including
`p/R`, `q/R`, `σ/R²`, `Ω/R²`, `Ω′/R²`, `λ/R`,
`p|λ|/R` and `pq/R`. It must give a total answer on the entire sequence
domain above; a finite list of these diagnostics is not an assumption that
they separate all paths. In particular retain all complementary and
non-spherical continuous families, both discrete signs, every boundary
constituent, both center sectors, continuous-spin possibilities, both energy
orientations and zero-momentum Lorentz representations.

Keep the intrinsic sets L,C separate from the structural-model conclusions.
For every mandatory model named in Specified model limits, and every
additional structural model constructed, give its direct sum or direct integral,
multiplicities, measure class, generating continuous sections, common core and
identifications, and apply the lower/upper comparison above with exactly the
hypotheses established for that model. Give the mandatory models' location in
the computed full-family table; their model
decompositions alone do not determine its other entries. All geometric,
Casimir, source-normalization and G₅/kinematical targets in this milestone
remain in force.

Give the trivial-family row explicitly for both ordinary and covered groups.
For every sequence R_n→∞, the one-dimensional trivial representation of G
or G̃ has `Lim=Clust={1}` on the zero Poincaré fiber. Its specified model is
ℂ with identity action, with multiplicity1, zero translation orbit and trivial
Lorentz little-group representation; the covering center acts trivially.
Construct its continuous coefficient on the whole DNC group bundle. For each
compactly supported convolution section f, Haar-system continuity gives
`π_(R_n)(f)=∫_(G_(1/R_n)) f → ∫_(G_0) f=1_(G_0)(f)`.
Extend this scalar-character convergence to A by norm density and contractivity.
It supplies the lower inclusion and the exact norm upper bound above; use
the kernel argument to exclude every other irreducible cluster point.

**M5.PrincipalTwoSheet.** As a concrete principal-series acceptance case, prove
[Primet (1983), §2, printed pp.13,15–16](https://www.numdam.org/item/PDML_1983___6D_A1_0/)
for the ordinary SO₀(1,4) group with SO(3) inducing type u. In the source convention
`χ_λ(a_t)=exp(iλt)`, fix source mass magnitude m>0 and `λ_r=−m/r`, r→0. In its fixed
two-sheeted mass-hyperboloid L² realization, under the displayed rescaling, prove the
local action tends to `ρ⁺_(m,u)⊕ρ⁻_(m,u₁)` where `u₁(k)=u(wkw)`. The source's statement
is pointwise almost everywhere in the hyperboloid variable and uniform on compact
group-variable sets for continuous L² vectors. Derive any Hilbert-norm/core convergence
needed here from actual integral bounds or weak convergence plus norm preservation;
a.e. convergence alone is not that assertion. Prove u₁≃u for SO(3), retaining the two
opposite time orbits. Derive the signature/tangent, parabolic-parameter, ℏ and Dixmier
family dictionary from the induced operators before applying the case to ν_(p,σ).
The source does not cover half-integral Spin types, complementary/discrete/boundary
families or all intrinsic Fell limits; these remain full-table targets above. The
mass magnitude is a source inducing parameter, distinct from Dixmier's spin label p.

**M5.MasslessDilation.** As a second specified-model acceptance theorem, build the four-dimensional
massless conformal-extension/restriction contraction of
[Angelopoulos–Laoues (1998), Theorem2.5 and Propositions2.6,3.1–3.2](https://arxiv.org/abs/hep-th/9806100).
Start from each M4 null-orbit irreducible with energy orientation ε_E∈{+1,−1},
Δ rotation-character label ℓ∈ℤ and trivial action of its translation plane;
this excludes continuous-spin data. Set s=|ℓ|/2. Distinguish the signed
Spin(2) inducing label `h_ind=ℓ/2` from the Spin(4) second highest weight
`h_K(ε_E,ℓ)∈{−s,s}` defined by the compact generators below. Both are zero
when s=0. Compute the latter function from the actual extended operators,
proving `h_K(ε_E,ℓ)=ε_Eℓ/2` in the coefficient convention by the argument below;
a choice of source Cartan square roots alone is not that
module comparison. Construct its unitary extension
to the universal cover of SO₀(2,4), by the source's remaining differential
generators in Eq.(2.50), with the source real/skew/self-adjoint normalization
translated to M0/M4. Own this selected conformal Lie-algebra/operator construction,
its invariant dense analytic domain, adjoint/commutator identities and integration.
Construct the ε_E=−1 model as the complex conjugate of the ε_E=+1 model
with label −ℓ. Prove this restricts to the required M4 model, and compare
its differential generators with the source realization explicitly.
Supply the universal-conformal-cover adapter separately from M0's finite-center
compact-K theorem: use 𝔨=so(2)⊕so(4), the real Killing form and
`N=1−C+2Δ_𝔨`, compute the conformal C scalar on the Eq.(2.50) module,
and prove finite-dimensional joint H₀/Spin(4) weight spaces. These weight
spaces replace finite isotypic spaces for the noncompact preimage
K̃=ℝ×Spin(4). Prove their algebraic sum dense in the original M4 null-cone
Hilbert space, by the explicit radial/angular eigenfunction expansion and its
completeness, before using it as an analytic core. For angular completeness
consume CompactGroups' Peter–Weyl theorem on SU(2) and project to the
specified U(1)-covariant sections. Separate the actual H₀ radial equation,
compute its change of variable, parameter and normalization, and identify
its eigenfunctions with the Laguerre function basis from
LaguerreJacobi A–B.
That required supplier owns the polynomials, Rodrigues/orthogonality,
finite exponential moment and Hilbert-basis comparison. Use radial
`x=2E` and the unitary `g(x)=f(x/2)√x/2` from L²(E dE) to L²(dx),
and prove the operator reduction has Laguerre parameter α=2j+1 for
each angular type j. M5 owns the
model-specific unitary radial/angular comparison, not a second generic
Laguerre basis theorem.
Prove the sum-of-squares analytic bounds and apply Nelson's
Theorem5 directly to integrate on the simply connected conformal group.
No compactness of K̃ or unproved conformal-group representation theorem is assumed.
Prove the period/descent statement from its compact types, distinguishing the
universal cover from a finite twofold quotient. In the source H₀-angle
normalization the kernel over SO(2)×SO(4) is 2πℤ×{±1}. Compute the
characters of (2π,1), (0,−1), (2π,−1) and (4π,1) from the joint weights,
and identify the actual descended quotient. Restrict to the de Sitter
subgroup covering SO₀(1,4) and prove irreducibility.

In the target orthogonal highest-weight coordinates its Spin(4) types are
`(s+k,h_K)` for k∈ℕ₀, each with multiplicity1. Compare with the compact supplier's
SU(2)×SU(2) coordinates
`(j_L,j_R)=((s+k+h_K)/2,(s+k−h_K)/2)`.
Use K=Spin(4) over the stabilizer of e₄ and orient its negative Euclidean
space by e₀∧e₁∧e₂∧e₃. Identify J_ab with e_a∧e_b there. Fix the
self-dual left basis
`L=((J₀₁+J₂₃)/2,(J₀₂−J₁₃)/2,(J₀₃+J₁₂)/2)` and anti-self-dual right basis
`R=((J₀₁−J₂₃)/2,(J₀₂+J₁₃)/2,(−J₀₃+J₁₂)/2)`.
Prove both have cyclic su(2) brackets and commute with each other; integrate
these ordered bases to the fixed Spin(4)≃SU(2)_L×SU(2)_R map. The orthogonal
weight planes are `T₁=J₀₁=L₁+R₁`, `T₂=J₂₃=L₁−R₁`; define the real weights
by −i times the derived compact generators, with dominant coordinates
a≥|h_K| for (T₁,T₂). Translate the source's Spin(4) weight vector to
these coordinates through its chosen Cartan roots and positive chamber.
The inducing Spin(2) label and the second Spin(4) coordinate belong to
different representations; their numerical equality is not assumed.
For the conformal embedding take ambient form diag(−1,−1,−1,−1,+1,+1)
on e₀,…,e₅ and embed de Sitter by fixing e₅. Map the source's ordered
coordinates (x₋₁,x₀,x₁,x₂,x₃,x₄) to (x₁,x₂,x₃,x₄,x₀,x₋₁);
compare its generators by these matrices, including the compact time
rotation J₅₄. Distinguish the source
second weight from h_ind, the Δ rotation character ℓ/2 at each of M4's two
null representatives, and physical helicity J·P/|P|. The null stabilizer's
transverse rotation is `X₁₂↦J₀₁=T₁`, whereas `X₃₄↦J₂₃=T₂` is the other
compact plane. For `i dS(X₁₂)=h_ind` and `m_θ=exp(−θJ₀₁)`, the inducing
character is `exp(ih_ind θ)`, giving h_ind=ℓ/2. With the physical Stone
rotation convention the helicity is `λ=ε_E ℏℓ/2`.
Prove the target weight dictionary without identifying these two Cartan planes:
put `B=(J₁₂,J₂₀,J₀₁)` and `Π=(J₀₃,J₁₃,J₂₃)`. In the enveloping
algebra prove `Σ_k B_kΠ_k=Σ_i L_i²−Σ_i R_i²`; on the type (a,h_K)
its derived action is `−h_K(a+1)`. The conformal translations are
`T_k=J_(k,5)+Π_k`. For `W=exp(πJ₅₄)`, prove Ad(W) fixes B and Π
and negates J_(k,5). On the common conformal analytic core transport
`J·P=λ|P|` by U(W), obtaining the same equation for
`P′_k=iℏ dU(Π_k−J_(k,5))`. Adding gives
`−2ℏ²dU(Σ_k B_kΠ_k)=λ(|P|+|P′|)`.
The null-cone |P| is injective and both terms on the right are nonnegative.
Evaluate this identity on a nonzero compact-type vector to obtain
`sign h_K=sign(ε_Eℓ)`; with |h_K|=s this gives h_K=ε_Eℓ/2, including the
scalar case separately. Retain all common-core and closure justifications.
Translate the source's signed weight vector through its Cartan convention
and this computed module comparison, including the energy-dependent map
from its inducing representation; do not silently identify its two labels.
At h_K=0 the two signs give one scalar tower, not two copies. Compute the de Sitter
cover kernel on these types, obtaining `(−1)^(2s)`, and prove the actual compact
embedding and native Spin-cover comparisons used for this inference. The source's
conformal Casimirs at n=4 are C''=s² and C=3(s²−1); they are not the Dixmier
normalization. Compute the de Sitter ladder operators and Ω,Ω′ directly before
identifying these restrictions with the full M5 classification, including s=0.
Construct the complex-conjugation comparison of the M4 models
`(ε_E,ℓ)↦(−ε_E,−ℓ)` and the chosen conformal extensions above. Spin(4) types are
self-conjugate, so prove `h_K(−ε_E,−ℓ)=h_K(ε_E,ℓ)` as a consistency condition
on the computed dictionary. Prove these conjugate-pair de Sitter restrictions
are equivalent, by comparison on the differential operators; their compact types are self-conjugate
and the real Hermitian central generators have unchanged real eigenvalues.
Apply the proved K-type/ladder classification, or construct the actual
`(𝔤,K)` intertwiner and use M0's unitary bridge. Equality of Casimir values
alone is insufficient. Retain both specified contraction fields for this
single radius-dependent class and prove
`Supp(ρ_(+,ℓ))∪Supp(ρ_(−,−ℓ))⊆Lim`, including zero-momentum points in the closure
of those supports. Its exact upper bound must cover their joint support,
for example by ρ₊⊕ρ₋. Prove any further exclusion needed for the full row;
the two models alone do not exclude other cluster points. Equivalently, for
fixed target weight h_K the two fields have labels `(+,2h_K)` and
`(−,−2h_K)`, and both physical helicities equal ℏh_K. For fixed nonzero
ℓ, the two energy signs with the same ℓ have opposite target weights
and disjoint compact-type towers, hence inequivalent de Sitter restrictions.

On the fixed null-cone Hilbert space the source's unitary dilation is
`(Z_αφ)(x)=α φ(αx)`, α>0. With source de Sitter generators
`Y_μ=(P_μ−P̂_μ)/2` for its S₄⁺=SO₀(1,4) subgroup, its rescaling Φ_α fixes
Lorentz generators and sends
Y_μ to α(2−α)Y_μ. State conjugations on the invariant space of conformal
analytic vectors, and construct a dense invariant domain containing the
K̃-finite analytic vectors and their conformal translates. Prove invariance
under Z_α; the K̃-finite algebraic domain alone need not be dilation-invariant.
Prove on this domain
`Z_α⁻¹ d(P_μ)Z_α=α⁻¹d(P_μ)` and
`Z_α⁻¹ d(P̂_μ)Z_α=α d(P̂_μ)`, hence
`Z_α⁻¹d(Φ_αY_μ)Z_α=(1−α/2)(d(P_μ)−α²d(P̂_μ))→d(P_μ)`.
The source's other plus-sign choice belongs to SO₀(2,3), separately from this
SO₀(1,4) theorem.
Identify this basis, tangent sign and parameter with the DNC radius convention;
Z_α need not itself converge. The source proves this derived-operator limit.
For the stronger group/model limit required here, prove convergence of every
finite generator word on the common domain and uniform bounds
`‖A_(α,i₁)⋯A_(α,i_n)v‖≤C_v (2B)^n n!`, uniformly for 0<α≤1.
Each rescaled generator is a sum of at most two fixed conformal generators
with coefficients bounded by1. Expand into at most 2^n words and use the
fixed conformal analytic-word bounds. Use exponential series only for small
generator parameters with a positive radius common to a dense subspace:
on the algebraic sum of the joint weight spaces use the fixed finite set
`{P_μ,P̂_μ,L_μν}` and prove each generator shifts the level by a bounded amount, has uniformly
finite branching and has block norm at level k at most C(1+k).
Derive `‖word_n v‖≤C_v B^n n!` with one B independent of the starting
finite set of levels, absorbing its polynomial-in-n factor into C_v and
a fixed exponential enlargement of B. Thus the rescaled bound uses 2B and
series converge for |t|<1/(2B). N-entire vectors alone are not asserted
to be entire for the noncompact Lie generators. Extend strong
convergence to arbitrary compact parameter intervals by subdividing into
finitely many such pieces and using unitarity; finite products and the local
DNC charts then give uniform-on-compact group coefficient convergence. Then apply the DNC/Fell comparison proved above. These additional
steps supply the upgrade; generator convergence alone is not group convergence.
This theorem supplies specified massless helicity models in both energy
orientations. All other full-family regimes and the exact named-family
dictionary remain separate targets of the complete contraction table.

Before using Casimirs, pin source generators J_ab, signature and commutators, transcribe the course I₁,I₂ and Dixmier Ω,Ω′ definitions, then derive their conversion in the enveloping algebra with all R, i and signature factors. Prove flat Casimir convergence on the common core. A matching pair of central characters is only a necessary check. Keep literal Dooley p.30 claims beside corrected normalization and prove the full
source dictionaries and contraction regimes as targets with their stated hypotheses.

### M5.AffineG5 — the chosen affine group and central extension

Retain the source's additional 15-dimensional affine kinematical `G₅` containment/contraction statements as source claims. Define the following chosen concrete group and contraction separately; matching names does not identify it with the historical group or establish its proper-time scaling conventions. Record Dooley p.29's names separately from the primary authors J. J. Aghassi, P. Roman and R. M. Santilli, [Physical Review D 1, 2753](https://doi.org/10.1103/PhysRevD.1.2753) and [Journal of Mathematical Physics](https://doi.org/10.1063/1.1665396). The chosen contraction below is an explicit mathematical construction; source proper-time scaling conventions require their own comparison. Let `W=ℝ^{3,1}` have source convention `η=diag(1,1,1,−1)`. When comparing with M4's zero-based time-last `η_M4=diag(−1,−1,−1,+1)`, map the spatial-first indices and record the global negation `η_G₅=−η_M4`; a coordinate permutation alone does not produce this sign change. Since `O(η)=O(−η)`, the orthogonal group and M4's `SO₀(3,1)` cover are unchanged, while inverse-metric, index-raising and quadratic-Casimir signs must be translated using the global negation. Put `V=W⊕ℝe₅` with form `η⊕(−1)`, and write the affine transformation on `W×ℝ` as
```
            ⎛ Λ  b  a ⎞
M(Λ,a,b,σ) = ⎜ 0  1  σ ⎟ ,   Λ ∈ SO₀(3,1),  a,b ∈ W,  σ ∈ ℝ.
            ⎝ 0  0  1 ⎠
```
Use matrix multiplication as the composition convention `g₂g₁=g₂∘g₁`. Derive
```
(Λ₂Λ₁, a₂+Λ₂a₁+b₂σ₁, b₂+Λ₂b₁, σ₂+σ₁)
```
and
```
M(Λ,a,b,σ)⁻¹ = M(Λ⁻¹, −Λ⁻¹a+Λ⁻¹bσ, −Λ⁻¹b, −σ).
```
Check the action, identity, inverses and dimension `6+4+4+1=15`. Identify its normal 9-dimensional affine radical and Lorentz quotient. The Poincaré subgroup has `b=0,σ=0`; the Galilei subgroup has `Λ=diag(R,1), a=(𝐚,0), b=(𝐯,0)`, with `σ` the time translation on the extra affine coordinate and the fourth coordinate of `W` inert. The affine group called `ISO(3,2)` in the source is `ℝ^{3,2}⋊O(3,2)`, not `O(3,2)`; do not identify it with this `G₅` or a de Sitter group. The connected Lie algebra of `G₅` has a 9-dimensional solvable radical and quotient `𝔰𝔬(3,1)`, so it cannot contain either 10-dimensional simple algebra `𝔰𝔬(3,2)` or `𝔰𝔬(4,1)` as a Lie subalgebra: its intersection with the solvable radical would be an ideal in that simple algebra, hence zero, forcing an injection into the six-dimensional quotient. Preserve the source claim of containing a de Sitter group separately from this obstruction.

For the contraction, define `L_μ∈𝔰𝔬(3,2)` by `L_μe₅=e_μ`, `L_μe_ν=η_{μν}e₅`; let `P_μ,S` be translations by `e_μ,e₅`, and `J_{μν}=[L_μ,L_ν]`. In the affine Lie algebra with bracket `[(A,u),(B,v)]=([A,B],Av−Bu)`, verify `[L_μ,S]=P_μ`, `[L_μ,P_ν]=η_{μν}S`, `[L_μ,L_ν]=J_{μν}`. On the fixed real 15-dimensional vector space `E=𝔰𝔬(η)⊕W_Q⊕W_P⊕ℝS`, for each `t>0` define the invertible linear map `D_t:E→𝔦𝔰𝔬(3,2)` by `J↦J`, `Q_μ↦tL_μ`, `P_μ↦tP_μ`, `S↦S`. Pull back the affine bracket by `D_t`: `[x,y]_t=D_t⁻¹[D_tx,D_ty]`. Derive `[Q_μ,S]_t=P_μ`, `[Q_μ,P_ν]_t=t²η_{μν}S`, `[Q_μ,Q_ν]_t=t²J_{μν}`, the unchanged Lorentz action on both W copies, and the other vanishing brackets. Extend these polynomial structure coefficients to `t=0` on the same vector space; prove Jacobi and identify the limiting Lie algebra with `Lie(G₅)`. This is a Lie-algebra contraction of `ISO₀(3,2)=ℝ^{3,2}⋊SO₀(3,2)`, not a global group limit or subgroup identification. At `t=0` the abstract Q/P basis vectors remain independent; no assertion treats vanishing scaled matrices inside the original matrix algebra as a basis. For the central extension, own the semidirect-product construction over the Heisenberg group and the normalized cocycle
```
c(g₂,g₁) = ½ (η(a₂+σ₁b₂, Λ₂b₁) − η(Λ₂a₁, b₂)),
```
derived from the alternating form `ω((a₂,b₂),(a₁,b₁))=η(a₂,b₁)−η(a₁,b₂)`.
The Heisenberg law `(x₂,z₂)(x₁,z₁)=(x₂+x₁,z₂+z₁+ω(x₂,x₁)/2)` on `W⊕W` with
centre ℝ is MetaplecticAutomorphicForms 0.1 for the real bilinear form
`B((a,b),(a′,b′))=(η(a,b′)−η(a′,b))/2=ω/2`, with its centre from 0.5–0.6.
Prove here that the shear `(a,b)↦(a+σb,b)` and the diagonal Lorentz action
preserve `ω` (the shear changes ω by `σ(η(b₂,b₁)−η(b₁,b₂))=0` because η is
symmetric), so that both act on it through the isometry action of
MetaplecticAutomorphicForms 0.7–0.8, jointly continuously by 0.13.
Use the factorization `g=S(σ)H(a,b)Λ` to derive the displayed cocycle. Prove
normalization and `c(g₃,g₂)+c(g₃g₂,g₁)=c(g₂,g₁)+c(g₃,g₂g₁)`;
for each fixed real `κ`, use phase `exp(iκc)` in the central group law.
Its infinitesimal normalization is `[P_μ,Q_ν]=η_{μν}Z`, alongside `[Q_μ,S]=P_μ`. Pull back the Lorentz factor through `SL(2,ℂ)→SO₀(3,1)`, keeping its `{±I}` kernel distinct from the phase center. This is an affine contraction with a central-extension target, not a subgroup identification or an assertion about an unspecified proper-time rescaling.

Use the product manifold and the displayed smooth law/inverse to obtain the connected unextended real Lie group G₅. Prove its nine-dimensional radical is connected and two-step nilpotent, and identify it as the entire solvable radical using the semisimple Lorentz quotient. For the normalized real central extension, prove that its radical is three-step nilpotent: its successive commutator ideals are `span{P_μ,Z}`, `ℝZ` and zero, using `[Q_μ,S]=P_μ` and `[P_μ,Q_ν]=η_{μν}Z`. Prove the Poincaré/Galilei subgroup embeddings into unextended G₅ and the law comparisons, not just their set descriptions. In the circle central extension the infinitesimal central bracket is scaled by κ: its radical has the same three-step Lie-algebra series when κ≠0, while κ=0 gives the unextended two-step radical plus the central circle. The displayed real central-extension normalization has coefficient1.

Reuse native matrix multiplication/commutator and `LieAlgebra.so'` or `skewAdjointMatricesLieSubalgebra`, with the explicit coordinate equivalence for η and `η⊕(−1)`; use `SemidirectProduct` for the Heisenberg/shear/Lorentz constructions after supplying their action homomorphisms. TauCeti’s scalar `HeisenbergGroup ℝ`, its product-topology API and three-dimensional `heisenberg ℝ` calibrate the one-coordinate normalization; they do not supply this 9-dimensional η-pairing group. The bilinear extension with one scalar centre is MetaplecticAutomorphicForms Layer 0, not `HeisenbergGroup (ℝ⁴)`, whose centre has the wrong dimension; this section owns only the η specialization and its coordinate comparison. LieGroups supplies matrix Lie groups, differentials and covering transport; Consume M1’s normalized central-extension, section and coboundary interface, on the Layer P projective carriers it already uses; the generic Weyl algebra remains D8-owned.

### M5.KinematicClassification — ordered rotation-equivariant kinematics

Construct the following precise real kinematical classification and its actual generator, transport and global-group APIs. This is a specified class, not the class of all ten-dimensional Lie groups. Its noncompactness premise is the explicit boost-image condition below. A physical causal order is separate structure; it is not supplied by the name of a group.

Fix the real ten-dimensional vector space with basis `J_i,K_i,P_i` for i=1,2,3 and H, with Levi-Civita convention ε_123=1. The J_i span the standard so(3), K and P are each its standard three-dimensional module and H its trivial module: `[J_i,J_j]=ε_ijk J_k`, `[J_i,K_j]=ε_ijk K_k`, `[J_i,P_j]=ε_ijk P_k`, `[J_i,H]=0`. Require spatial parity `(J,K,P,H)↦(J,-K,-P,H)` and time reversal `(J,K,P,H)↦(J,-K,P,-H)` to be Lie-algebra automorphisms. First prove that every such bracket has constants A,B,a,b,c with `[K_i,K_j]=A ε_ijkJ_k`, `[P_i,P_j]=B ε_ijkJ_k`, `[K_i,P_j]=c δ_ijH`, `[K_i,H]=aP_i`, `[P_i,H]=bK_i`. Prove Jacobi is equivalent to A=-ac and B=bc, with no additional relation on a,b,c; supply every vanishing/degenerate parameter branch.

Use native real vector, dot/cross product and LieAlgebra carriers. On triples (j,k,p,h), explicitly construct the bracket whose components against (j',k',p',h') are

`j×j' - ac(k×k') + bc(p×p')`,
`j×k' - j'×k + b(h'p-hp')`,
`j×p' - j'×p + a(h'k-hk')`,
`c(k·p'-p·k')`.

Prove bilinearity, alternation, Jacobi, exact basis brackets, independence of the ten coordinates and the universal transport from the preceding generator description. No guessed Prop-valued class replaces any bracket condition.

The group-level noncompactness hypothesis means that, in a connected real Lie group integrating this algebra, every image `{exp(tK_i):t∈R}` is a noncompact one-parameter subgroup; rotation covariance then gives every nonzero boost direction. Consume LieGroups Layers4–5's actual Lie integration, simplyconnected covers and integration of homomorphisms. Prove this condition is equivalent to ac>=0: if ac<0, the rotation/boost algebra is compact so4, integrates through compact Spin4 and makes each boost periodic; if ac>0, its adjoint contains a hyperbolic block; if ac=0, it has a nonzero nilpotent block from rotations to boosts. In the latter two cases prove the adjoint one-parameter map proper/unbounded, giving a closed noncompact boost subgroup. Include the fact that this excludes compact boost images, not an unsupported claim about arbitrary Lie-algebra elements.

Specify equivalence by SO3-equivariant isomorphisms preserving the rotation subalgebra and the named parity/time gradings and the ordered boost/translation roles. After a common spatial rotation, their form is `J'=J,K'=kK,P'=pP,H'=hH`, k,p,h nonzero real. Prove the transformed parameters are `a'=kh a/p`, `b'=ph b/k`, `c'=kp c/h`. Under ac>=0, classify uniquely into these eleven ordered cases:

| a | c | b | Kinematical family |
|---|---|---|---|
|1|1|+1|de Sitter|
|1|1|-1|anti-de Sitter|
|1|1|0|Poincare|
|1|0|+1|expanding Newton–Hooke|
|1|0|-1|oscillating Newton–Hooke|
|1|0|0|Galilei|
|0|1|+1|Euclidean para-Poincare|
|0|1|-1|Lorentzian para-Poincare|
|0|1|0|Carroll|
|0|0|1|para-Galilei|
|0|0|0|static|

Prove exhaustion and inequivalence under the specified ordered equivalence, not only existence of these bracket tables. For ac>0 the normalized b sign is sign(bc); for a≠0,c=0 it is sign(ab); for a=0,c≠0 it is sign(bc). For a=c=0 every nonzero b normalizes to1. Prove these facts from the displayed rescaling rules, with all zero branches retained. Exhibit the abstract isomorphism from Lorentzian para-Poincare to Poincare and from para-Galilei to Galilei, explaining why neither respects the ordered boost/translation distinction. Do not identify eleven kinematical structures with eleven abstract Lie-algebra isomorphism classes or turn the primary paper's eight named families into eight abstract isomorphism classes. Before identifying this normal form with M5’s fixed generators or Casimirs, supply the exact matrix dictionary. For b=±1 put η=diag(1,1,1,−1,b) on zero-based coordinates0–4 and M_uv=η_v E_uv−η_u E_vu. The basis J=(−M12,−M20,−M01), K_i=M_i3, P_i=M_i4, H=−M34 realizes a=c=1 and the displayed b. Prove linear independence, η-skewness and every bracket. Its signatures are(4,1) and(3,2), respectively. For b=1 let C carry normal-form axes(0,1,2,3,4) to M5 axes(0,1,2,4,3). Then C transports η to −diag(−1,−1,−1,−1,+1), and C M_uv C⁻¹=−J_(C(u),C(v)) in M5’s existing notation. Consequently normal J=(J12,J20,J01), K_i=−J_i4, P_i=−J_i3 and H=J43 in that notation. At curvature radius R, rescale normal P,H by1/R: these are −P_i^(R) for spatial i and +P_3^(R) for time; a=c=1 and b=R⁻². Prove this transport, retain M5’s coefficient-versus-geometric displacement convention, and use M0’s actual skew/self-adjoint differential conversion for representations instead of dropping an i or ℏ. This dictionary precedes any comparison with the fixed I₁,I₂,Ω,Ω′. Construct simplyconnected group models for all eleven and describe connected global groups as their quotients by discrete central subgroups, with the exact condition for the parity/time automorphisms to descend. Name the spacetime stabilizer algebra generated by J,K separately; classify any ineffectivity kernel rather than assuming every pair acts effectively.

Construct the rotation-preserving contractions from the two de Sitter families, taken together, to these eleven structures by explicit parameter-dependent diagonal basis changes and entrywise limits of the ten-dimensional bracket. A single parent does not yield the opposite-sign Newton–Hooke or para-Poincare branch by real diagonal scalings. For t>0 use K′=t^rK K, P′=t^rP P, H′=t^rH H and leave J fixed. The exponents of the transformed a,b,c are (rK+rH−rP,rP+rH−rK,rK+rP−rH). Use respective weights (rK,rP,rH)=(0,0,0), (0,1,1), (1,1,0), (1,2,1), (1,0,1), (1,1,2), (2,1,1), (1,1,1) for the de Sitter parents, Poincare, Newton–Hooke, Galilei, para-Poincare, Carroll, para-Galilei and static families. Retain both parent signs where the limiting b is nonzero; when a=c=0 either nonzero b has the same ordered normal form. Prove the whole finite family of brackets converges and record the limiting basis/group versus spacetime distinction. The static and para-Galilei branches remain included. The classification's third premise is the noncompact boost predicate defined above; no undefined causality predicate is an input. A comparison with a physical causal order requires its own explicit homogeneous-spacetime/event-order definition and is not inferred merely from a group name.

**Basic theory, global models and phase cuts.** Use the fixed product vector space `(Fin 3 → ℝ) × (Fin 3 → ℝ) × (Fin 3 → ℝ) × ℝ`, with its ordinary componentwise addition and real scalar action. The displayed bracket is an actual polynomial function of all three parameters and both operands. Construct its bilinear map and compatible `LieRing`/`LieAlgebra ℝ` by extending these same additive/module parents after proving the alternating/Jacobi laws. Export coordinate and basis evaluations, extensionality, parity/time involutions and their commuting/action identities, the rotation homomorphism, parameter equality/transport and the ten-vector basis. The SO(3)-equivariant tensor reduction is proved here by the standard coordinate rotations, or their differentiated generator equations, and the dot/cross identities; it does not assume the noncompact unitary dual, Peter–Weyl exhaustion or a new generic classification engine.

For nonzero k,p,h, define the actual linear equivalence `D(j,K,P,H)=(j,kK,pP,hH)`, inverse obtained by reciprocal scalars. Prove that it intertwines the primed bracket with the unprimed one exactly when the displayed three rescaling equations hold. Prove identity, composition, inverse and parameter-transport laws. For strict SO(3)-equivariance with the fixed action, the maps fix J and scale each of the other named joint parity/time eigenspaces. A simultaneous spatial rotation is handled by its explicitly conjugated isotropy action, not called a commuting SO(3)-equivariant scalar map. Build the normal-form assignment and its witness isomorphism on each zero/sign branch, then prove uniqueness in the specified ordered class. Retain the role-swapping abstract isomorphisms as separate maps, including their failure to preserve the named gradings.

Construct the following simply connected models and the actual differentiated basis isomorphisms. For a=c=1,b=1 use the simply connected cover of SO₀(4,1), with the preceding matrix dictionary. For a=c=1,b=−1 use the universal cover of SO₀(3,2); its Spin double cover is not assumed to be simply connected. For a=c=1,b=0 use SL(2,ℂ) acting on the four translation coordinates (P,H), with the actual M4 dictionary. Use LieGroups’ SU(2)/SO(3) worked example, built from its Layers0–5 independently of later compact structure, for the actual normalized rotation double-cover map and its kernel {±1}. For every c=0 normal form use `(SU(2)×ℝ)⋉ℝ⁶`: rotations act diagonally on (K,P), and the H-parameter acts by `exp(tD_(a,b))`, where `D_(a,b)(k,p)=(−b p,−a k)`. This includes Newton–Hooke, Galilei, para-Galilei and static, including the nilpotent and zero D cases. The actor-first notation `G⋉N` here means the native normal-first carrier `N ⋊[φ] G`, with `(n,g)(n′,g′)=(n+φ(g)n′,gg′)` for an additive N; use its multiplicative type copy when required by `SemidirectProduct`. Use the additive group of ℝ⁶ with this law; prove the commuting rotation/time actions and every differentiated bracket. Periodic action of the time factor does not turn its simply connected ℝ factor into a circle.

For a=0,c=1,b=1 use `Spin(4)⋉ℝ⁴` on (K,H), and for b=−1 use `SL(2,ℂ)⋉ℝ⁴` on those same named coordinates. Specify the standard vector actions by `P_i(K_j)=−δ_ij H`, `P_i(H)=b K_i` and the displayed J rotations; prove their integration and real linear/matrix comparisons. Thus the first action preserves `‖K‖²+H²`, the second `‖K‖²−H²`, with the signs and ordered roles fixed. For a=0,c=1,b=0 use `SU(2)⋉N`, where N has coordinates (k,p,h) and law `(k,p,h)(k′,p′,h′)=(k+k′,p+p′,h+h′+(k·p′−p·k′)/2)`. Construct the scalar-centred seven-dimensional Heisenberg group with this law and rotations on its two vector coordinates; it is not `HeisenbergGroup (ℝ³)` with a vector-valued centre. Prove associativity, inverses, smoothness, simple connectedness and every Lie-basis comparison. These are model-specific applications of the existing LieGroups integration/cover API, not a second Lie III theorem.

For each model compute its actual centre, discrete central quotients, quotient projection/differential and isomorphism/descent APIs, preserving a specified central subgroup D and its parity/time stability. An isomorphism classification of quotients must include the action of automorphisms on D; different D are not automatically distinct abstract groups. Construct the connected subgroup generated by (J,K) in each displayed model, prove it closed there, and identify its Lie algebra. For its smooth homogeneous space consume SmoothBundlesConnections B1.4: the closed subgroup structure is LieGroups Layer2 and the proper free right action gives the actual quotient/principal projection and tangent comparison. Export the resulting homogeneous-space projection, action, stabilizer and kernel-of-action as the actual normal core. Compute its connected infinitesimal and remaining discrete/global ineffectivity, including the boost ideal in static and para-Galilei. Do not infer closedness of an arbitrary immersed subgroup or effectivity of a pair from its dimension. Descending a global homogeneous model requires the specified central quotient/stabilizer data; it is distinct from classifying the abstract algebra.

The finite algebraic reduction and normal forms are earlier than the unitary-family and Casimir comparisons elsewhere in M5. Use LieGroups Layer0–1 for the actual exponential/adjoint comparison, its early Layer2 SU(2) model for compact boosts, Layer5's topological cover construction before Layer4's finite-dimensional Lie III, and then Layer4 homomorphism integration/Layer5 connected-source descent. M0 is used only for the later skew/self-adjoint observable comparison. The classification uses these finite-dimensional prerequisites. Conversely the diagonal algebra contractions above do not supply the group/DNC/Fell convergence the other M5 targets separately construct.

**Source comparison.** Bacry and Lévy-Leblond, [Possible Kinematics, J. Math. Phys. 9 (1968), 1605–1614](https://doi.org/10.1063/1.1664490), §II, impose isotropy, the stated parity/time automorphisms and noncompact one-parameter boost subgroups. Their eight named families comprise eleven kinematics; the ordered classification above retains the boost/translation distinction. Their discussion of temporal order also requires a chosen spacetime interpretation. Preserve the literal Dooley p.31 assertion and p.32 bibliography entry3 separately from this precise conditional theorem; the p.34 bibliography remains in its actual physical order with all surname/number/group uncertainties. Compare the historical Bacry–Lévy-Leblond hypotheses, family labels and physical cases only through their actual statement, distinguishing ordered structures, abstract Lie algebras, chosen global groups and effective spacetimes. No unspecified causality predicate or bibliographic label is a premise or a theorem proved by the normal-form table. Any causal-order comparison must give its actual event space, relation, invariance and interpretation before using it. Keep source physical interpretations and extra assigned content distinct from the mathematical classification.

Apply M5’s fixed `I₁,I₂` to `Ω,Ω′` conversion to the classified de Sitter representations and their flat mass/spin limits, retaining the literal course formulas beside the corrected convention.

### Examples

For the DNC normalizer, A=diag(−1,1,1,1) and B=−A send (0,0,r,r) to (0,0,−r,−r). The labels (ε_E,ℓ) and (−ε_E,−ℓ) therefore have the same physical helicity ε_Eℏℓ/2.

### Dependencies

P.2; M0–M4; HilbertModules H3/H5; LieGroupoidsPoisson G0 item0; OperatorAlgebraDynamics D5; CStarAlgebras C1/C2; VonNeumannAlgebras V4.0.Fields. The concrete groupoid and fixed-group topology precede DNC comparisons and all-sequence classification.

## Layer 9: M6 — Tensor products and source acceptance cases

### M6.MeasuredPair — the exact semidirect tensor interface

Let `G=N⋊H` be Hausdorff lcsc with N abelian, and use M2's actual continuous dual action `h·χ(n)=χ(h⁻¹·n)`. Fix two characters χᵢ with closed stabilizers Hᵢ, separable strongly continuous genuine unitary τᵢ of Hᵢ, and Mackey models `ρᵢ=Ind_(N⋊Hᵢ)^G(χᵢ⊗τᵢ)`. Give each `H/Hᵢ` its quotient Haar class. Assume or prove the regular measured diagonal quotient of `(H/H₁)×(H/H₂)` required by M1.MeasuredTensor; identify its standard Borel parameter Q with the measured double cosets `H₁\H/H₂`, with Borel representatives h_q and quotient measure class ν obtained from an equivalent probability in the product class. No type-I hypothesis is required for the following intermediate formula. For `x_q=χ₁(h_q·χ₂)` (product of N-characters, written as x₁+h_q·x₂ in real coordinates) define
```
J_q = H₁ ∩ h_q H₂ h_q⁻¹,   β_q(j) = τ₁(j) ⊗ τ₂(h_q⁻¹ j h_q),
K_q = H_(x_q),   Σ_q = Ind_(J_q)^(K_q) β_q.
```
Prove J_q≤K_q and construct the measurable fields and unitary intertwiners
```
ρ₁ ⊗̂ ρ₂ ≃ ∫_Q^⊕ Ind_(N⋊J_q)^G (x_q ⊗ β_q) dν(q)
        ≃ ∫_Q^⊕ Ind_(N⋊K_q)^G (x_q ⊗ Σ_q) dν(q).
```
Derive the first equality by M1's measured tensor theorem for `N⋊Hᵢ`; its double-coset space reduces to `H₁\H/H₂` and intersection to `N⋊J_q`. Derive the second by induction in stages: x_q extends genuinely to N⋊K_q, and the action modulus of K_q on N cancels in the ratio `Δ_(N⋊J_q)/Δ_(N⋊K_q)`, leaving precisely the K_q/J_q quotient RN factor. Prove the exterior/diagonal comparison and the translation PVM: on the product orbit base its momentum map is character multiplication. In Bargmann's real central extension use the full labels `(m,p,E)` on `N=ℝ_z×ℝ³_a×ℝ_t` with M3's fixed ℏ; all three labels add. Spatial momentum alone is insufficient. Poincaré uses the full four-momentum label. Genuine representations, fixed-central-character projective descents and cover/period restrictions remain distinct models.

For M3 Euclidean/Bargmann models and all six M4 momentum-orbit types, prove regularity on the entire pair space (or explicitly retained conull invariant strata), including every mass sign, zero-mass branch, spacelike, mixed-sign, linearly dependent and null-proportional pairs. A concrete finite-dimensional proof uses Gram matrices **and linear-relation kernels** of ordered vector configurations. For a nondegenerate real quadratic ambient space of Witt index min(n₊,n₋) at most one, prove the following needed extension adapter: split a degenerate span as a regular complement U plus its radical R (dimension at most one). For a nonzero radical basis r choose `w∈U⊥` with `B(r,w)=1`, put `r′=w−B(w,w)r/2`, and match the resulting regular hyperbolic completions on both sides. Then native regular-subspace Witt extension applies. Ambient nondegeneracy is required for this adapter; the native theorem does not already extend arbitrary degenerate spans.

A full orthogonal-group orbit of an ordered configuration T is exactly its fixed Gram matrix and fixed relation kernel `ker T`; the latter is the closed condition `T|ker T₀=0` plus the open maximal-rank condition on the quotient. This proves the orbit locally closed. Identify that locally compact orbit with its homogeneous quotient by the lcsc σ-compact open-mapping argument. The proper identity-component orbits are then open by the homogeneous orbit-map submersion and split the finite-component full orbit into clopen suborbits. Use spatial pairs in Euclidean ℝ³; Lorentz pairs in ℝ^(3,1); and Bargmann triples `(e,x₁,x₂)` in ℝ⁵ with
```
Q(m,p,E) = 2mE − |p|²,   B((m,p,E),(m′,p′,E′)) = mE′ + Em′ − p·p′,   e = (0,0,1).
```
Here `B(x,x)=Q(x)` and native `Q.polarBilin=2B`. M3's boost/rotation action is the identity component of the orthogonal stabilizer of e; its spin cover has the same orbits. Thus the same configuration argument supplies every pair stratum. For example proportional null pairs with different ratios have the same zero Gram matrix and different relation kernels, so Gram data alone do not separate them. M1's countable-basis/selector construction gives a standard Borel quotient and representatives; supply their actual Borel sections and conditional Haar/density comparisons, not only an invariant list. Transport a selected pair to `(x₁,h_q·x₂)` using the fixed homogeneous-space sections. Keep all degenerate strata in this construction even when a particular orbit-measure product assigns them zero mass; do not infer absence from the joint spectral support.

When a chosen sum-orbit representative is required, use M2's regular-action Borel quotient/section and the closed-subgroup orbit selectors to choose a Borel k_q carrying x_q to it, and transport K_q, Σ_q and the induced model by that element. For irreducible refinement assume G type I and retain M2's regular-action hypotheses for the Mackey label interpretation; apply M2.MeasuredRefinement to the **fixed-G field** of full induced integrands, not a hypothetical general jointly measurable decomposition of varying little groups K_q. Prove the translation-PVM comparison forces the refined irreducibles into the sum orbit for ν-almost every q, then use M2's actual Mackey equivalence to interpret their little-group labels. Prove the Borel label comparison, spectral kernels, measure classes and full multiplicity fields, and collapse repeated irreducible labels with M2's final field-Fubini formula. Being type I does not force every closed subgroup K_q or J_q to be type I; apply any little-group type-I result only with its actual model proof. The displayed Σ_q formula alone is not an irreducible decomposition.

M6 owns these semidirect/model specializations; M1 owns the generic measured subgroup/tensor/stages interfaces and M2 the fixed-algebra/group type-I refinement. Develop the pair-table, endpoint/atom, cover/descent, source-correction, exchange-sector and further finite-product targets in their respective M6 milestones.

For the diagonal action on completed Hilbert tensor products, consume M1's
measurable subgroup/tensor-product theorem and M2's type-I irreducible
refinement. First construct the exterior-product/diagonal-restriction unitary
and the translation PVM, whose momentum map is addition. Prove M1’s regular measured double-coset hypothesis for the diagonal H-action on each pair of the M3/M4 character orbits used below, including spacelike, mixed-sign and zero-orbit pairs: construct a conull invariant Borel domain, a standard-Borel quotient and explicit Borel representatives. Own its real-algebraic/semialgebraic stratification and measurable-section argument, retaining degenerate Gram/linearly-dependent and null proportionality strata instead of assuming generic Gram invariants separate all pairs. Supply the conditional orbit Haar-class and density comparisons before invoking M1. For every pair of
M3 or M4 Mackey models for the same abelian-normal-subgroup decomposition
`G=N⋊H`, use their full N-character labels x₁,x₂. For the Bargmann group
these labels include the phase-center mass and time energy as well as spatial
momentum; for Poincaré they are the four-momentum labels. Addition below is
multiplication of the two N-characters, written additively in these real dual
coordinates. For h in the measured double-coset quotient
`H_(x₁)\H/H_(x₂)` of the diagonal H-action on O₁×O₂, put

```
x(h)=x₁+h·x₂,
J(h)=H_(x₁)∩hH_(x₂)h⁻¹,
β_h=Res_(J(h)) τ₁ ⊗ Res_(J(h)) τ₂^h,
Σ_h=Ind_(J(h))^(H_(x(h))) β_h.
```

Choose a Borel element carrying x(h) to M2's representative of its sum orbit
and transport Σ_h by that element. Induction in stages identifies the
integrand with the Mackey model induced from that sum momentum and Σ_h.
The quotient measure class is the pushforward of an equivalent probability
in the product orbit-measure class. Prove the conditional measure and
measurable-field identifications, including noncompact little groups, rather
than invoking the notation as an irreducible decomposition. Where Σ_h is
reducible, its full type-I disintegration, with measure class and multiplicity,
is required; the intermediate formula alone does not discharge that step.
This formula applies to every mass sign, every zero-mass row of M3, and all
six M4 momentum-orbit types. A source's physical positive-energy restriction
does not remove any of those representation models.

For every finite ordered n-particle product, M6.PairField and M6.FiniteTree
below own the jointly Borel pair kernels, explicit iterated tree measures,
recoupling overlaps and measurable permutation/Young fields. Their proof
consumes M0/M1/M2, Layer P.6, V2, V4.0.Fields, CompactGroups, SchurWeyl,
D1 and CStarAlgebras as specified there; the pairwise tables and all
endpoint/atom ranges remain their analytic inputs.

Use the following concrete equalities as acceptance targets. They concern
ordered, distinguishable tensor factors; exchanging two different factors is transported by the tensor flip unitary. For identical inputs also construct the symmetric and antisymmetric restrictions using Layer P.6’s projectors. Prove that the swap is decomposable under the displayed irreducible decomposition, compute its involution on each multiplicity space and the ranks of its ±1 projectors. For identical nonzero-mass Bargmann or future massive Poincaré spin-j inputs, its partial-wave eigenvalue on (l,S) is `(-1)^(l+2j−S)`; prove this from spherical-harmonic parity and the compact spin Clebsch–Gordan flip. Thus retain exactly the even or odd exponent for the chosen sector. The remaining identical M3 and nonzero-null M4 exchange sectors below compute the actual induced flip, its compact/circle normalizer action, and all two-factor selection rules; the fixed three-factor compact example also pins a recoupling and permutation comparison. No physical spin-statistics law is inferred from choosing a permutation sector. Here `D_j` denotes the compact spin-j module,
and an integral is a Hilbert direct integral. Measures below specify classes;
a concrete unitary must supply the positive density for its chosen orbit
normalizations and the resulting square-root change of measure.

**Euclidean/time-translation groups.** Use M3's `ℝ⁴⋊SU(2)` and its SO(3)
quotient. Write `Z_(E,j)` for zero spatial momentum and `Eucl_(r,E,h)` for
radius r>0 and covered-circle weight h∈½ℤ, meaning the character
`θ↦exp(ihθ)` with θ modulo4π. This θ is the physical rotation
angle, twice the covered diagonal-circle coordinate used in M3. Time energy adds in every row. For two
nonzero radii prove

```
Eucl_(r₁,E₁,h₁) ⊗ Eucl_(r₂,E₂,h₂)
 ≃ ∫_(|r₁-r₂|,r₁+r₂)^⊕
       (⊕_(h-(h₁+h₂)∈ℤ) Eucl_(r,E₁+E₂,h)) r dr.
```

Each displayed weight occurs once almost everywhere. The collinear endpoint
orbits have zero product measure, so neither endpoint contributes an atom,
including r=0 when r₁=r₂; the joint translation spectrum still contains the
endpoints. Prove this from the cosine angle quotient (Lebesgue class) and
`r²=r₁²+r₂²+2r₁r₂ cosθ`; the pair stabilizer is the covering center. Prove

```
Z_(E₁,j) ⊗ Eucl_(r,E₂,h)
 ≃ ⊕_(a=-j,-j+1,…,j) Eucl_(r,E₁+E₂,h+a),
Z_(E₁,j₁) ⊗ Z_(E₂,j₂)
 ≃ ⊕_(J=|j₁-j₂|,…,j₁+j₂) Z_(E₁+E₂,J).
```

The SO(3) formulas are precisely the descending sectors: integer j and h,
and all integer output h in the first row. Include the scalar/fixed-energy
and spatial-only restrictions. Compare these irreducible formulas with the
reducible localized L²(ℝ³;D_j) model of M3; Dooley p.21's tensor statement
must not turn that localized representation into a single irreducible.

**Nonzero Bargmann input masses, including zero total mass.** Let
`A_(m,U,j)` be M3's genuine irreducible, m≠0, and set U₀=U₁+U₂. Define

```
N_J(j₁,j₂) = #{(l,S) : l∈ℕ₀,
  S=|j₁-j₂|,|j₁-j₂|+1,…,j₁+j₂,
  J=|l-S|,|l-S|+1,…,l+S}.
```

For M=m₁+m₂≠0 and μ=m₁m₂/M prove

```
A_(m₁,U₁,j₁) ⊗ A_(m₂,U₂,j₂)
 ≃ ∫_(r>0)^⊕ ⊕_J
       (A_(M,U₀+r²/(2μ),J) ⊗ ℂ^(N_J(j₁,j₂))) r² dr.
```

Prove finiteness of each N_J and its parity condition. The unitary starts
with total momentum P=p₁+p₂ and relative momentum
`k=(m₂p₁-m₁p₂)/M`; then decompose L²(S²) into orbital spins and couple
D_(j₁)⊗D_(j₂). This includes negative μ and hence the lower half-line of
internal energies; do not impose positive input masses silently.

When m₂=−m₁≠0, the total-momentum-zero set has product Lebesgue measure
zero. For r=|P|>0 the sum momentum is the M3 zero-mass, nonzero-momentum
orbit, and the stabilizer is the transverse-boost E(2) group (or its cover).
Fourier transform in the transverse relative momentum. Prove that only
nonzero transverse-boost covector radii κ>0 occur, in Lebesgue measure class
`dr dκ`, with central character `(-1)^(2j₁+2j₂)` in the covered group and
constant multiplicity `(2j₁+1)(2j₂+1)`. Thus the output is the direct integral
of precisely M3's `(m=0,r>0,κ>0)` classes with those multiplicities; neither
the κ=0 helicity classes nor the p=0 classes contribute an atom. Derive the
phase, Jacobian and genuine unitary from M3's action, including the fact that
U₀ is absorbed in the free energy coordinate of this orbit. This statement
is different from substituting M=0 in the preceding formula, which divides
by M. Tensor pairs involving a zero-mass input have the separate fourteen-cell
classification below, with its explicit Euclidean restriction/induction
adapters; they are not obtained by dividing by a vanishing total mass.

### Bargmann tensor products with zero-mass input factors

Use precisely M3's real central extension, its SU(2) rotation cover and its
SO(3) quotient. The normal character is
`χ_(m,p,E)(z,a,t)=exp(i(mz−p·a+Et)/ℏ)`; the boost-dual character of a
little group is `v↦exp(ik·v/ℏ)`. All tensor factors here are ordered and
are genuine separable representations of this same extension. Define local
names for the five M3 families:

| Name | M3 labels |
| --- | --- |
| `A_(m,U,j)` | m≠0, internal energy U∈ℝ, rotation spin j. |
| `B_(r,h)` | m=0, spatial momentum radius r>0, zero transverse-boost covector, direction-circle weight h∈½ℤ. |
| `C_(r,κ,e)` | m=0, spatial momentum radius r>0, nonzero transverse-boost covector radius κ>0, covering-center parity e∈{0,½}. |
| `D_(E,j)` | m=0, p=0, scalar energy E∈ℝ, zero boost-dual covector, rotation spin j. |
| `E_(E,κ,s)` | m=0, p=0, scalar energy E∈ℝ, nonzero boost-dual radius κ>0, direction-circle weight s∈½ℤ. |

Circle weights use the physical angle θ modulo4π in the covered group,
with character exp(ihθ); this is twice M3's covered diagonal-circle
coordinate. The element −I has character exp(2πih), and in C it has
character exp(2πie). For a half-integer a, write `[a]` for its class in
{0,½} moduloℤ. For the ordinary group retain only integer spins and weights
and e=0. The E-family name is a representation label, and its first
subscript E is its independent scalar time energy. There is no energy
parameter for B or C: their N-orbit already contains every E∈ℝ.

Put `Wt(j)={−j,−j+1,…,j}` and define the finite integer

```
Q_J(j,s) = #{a∈Wt(j) : J≥|s+a| and J−|s+a|∈ℕ₀}.
```

A symbol `V^d` means a Hilbert direct sum of d copies, with `d=∞` meaning
countably infinitely many copies (multiplicity space ℓ²(ℕ)). Every integral
below specifies Lebesgue measure class in its displayed positive/real
parameters; prove the positive density and square-root transport for the
chosen invariant orbit measures. Absent endpoint atoms are part of each
claim, rather than a claim that an endpoint is absent from closed spectral
support. Output spin sums range over J∈½ℕ₀ with their displayed multiplicity or
parity condition. Prove the following fourteen identities; exchanging the
two ordered factors is transported by the tensor flip. Construct the parameterized irreducible fields as Borel label maps, prove their injectivity and cross-family inequivalence from M3, and apply M3’s type-I theorem with M2.TypeIDisintegration’s spectral-data uniqueness, with its V4.0.Decomposition input. Derive each intrinsic multiplicity function and absence of atoms in those label fields from that uniqueness, in addition to constructing the displayed unitary equivalence.

**One nonzero mass and one zero mass.** For m≠0, all U,E∈ℝ and r,κ>0,

```
A_(m,U,j) ⊗ D_(E,k)
 ≃ ⊕_(J=|j−k|,|j−k|+1,…,j+k) A_(m,U+E,J),
A_(m,U,j) ⊗ E_(E,κ,s)
 ≃ ⊕_J A_(m,U+E,J)^(Q_J(j,s)),
A_(m,U,j) ⊗ B_(r,h)
 ≃ ∫_(V∈ℝ)^⊕ ⊕_J A_(m,V,J)^(Q_J(j,h)) dV,
A_(m,U,j) ⊗ C_(r,κ,e)
 ≃ ∫_(V∈ℝ)^⊕ ⊕_(J−j−e∈ℤ)
       A_(m,V,J)^((2j+1)(2J+1)) dV.
```

In the first two lines the internal energy is fixed. In the last two lines
it has all of ℝ as its measure-class support, since the zero-mass input
has a free energy coordinate. This distinction cannot be removed by
identifying genuine representations up to a scalar time character. The
boost-dual radius κ, and the fixed input momentum radius r in the last
two lines, affect the chosen intertwiner but not these output counts.

**Both momenta zero.** For all E₁,E₂∈ℝ and κ₁,κ₂>0,

```
D_(E₁,j₁) ⊗ D_(E₂,j₂)
 ≃ ⊕_(J=|j₁−j₂|,…,j₁+j₂) D_(E₁+E₂,J),
D_(E₁,j) ⊗ E_(E₂,κ,s)
 ≃ ⊕_(a∈Wt(j)) E_(E₁+E₂,κ,s+a),
E_(E₁,κ₁,s₁) ⊗ E_(E₂,κ₂,s₂)
 ≃ ∫_(|κ₁−κ₂|<η<κ₁+κ₂)^⊕
       (⊕_(s−s₁−s₂∈ℤ) E_(E₁+E₂,η,s)) dη.
```

The energy is always E₁+E₂. The third formula is the three-dimensional
Euclidean nonzero-sphere tensor formula for the boost subgroup; every
listed s has multiplicity1 almost everywhere. No η=0 term occurs when
κ₁=κ₂, and neither collinear endpoint contributes an atom.

**One nonzero momentum and one zero momentum.** For all r,κ,η>0,

```
B_(r,h) ⊗ D_(E,j)
 ≃ ⊕_(a∈Wt(j)) B_(r,h+a),
C_(r,κ,e) ⊗ D_(E,j)
 ≃ C_(r,κ,[e+j])^(2j+1),
B_(r,h) ⊗ E_(E,η,s)
 ≃ ∫_(0<κ<η)^⊕ C_(r,κ,[h+s])^2 dκ,
C_(r,κ,e) ⊗ E_(E,η,s)
 ≃ ∫_(max(κ−η,0)<ζ<κ+η)^⊕ C_(r,ζ,[e+s])^∞ dζ.
```

The fixed scalar E is absorbed by a translation of the free energy
coordinate in the B/C orbit, with its explicit unitary change of variable.
The last two lines have only nonzero transverse-boost radius outputs;
there is no additional B-family atom. The first two formulas retain the
zero/nonzero transverse-radius distinction and are not limits of the last
two formulas obtained by substituting a forbidden input radius0.

**Both momenta nonzero.** Put `I_R=(|r₁−r₂|,r₁+r₂)`. For r₁,r₂>0 and
κ₁,κ₂>0,

```
B_(r₁,h₁) ⊗ B_(r₂,h₂)
 ≃ ∫_(R∈I_R, ζ>0)^⊕ C_(R,ζ,[h₁+h₂])^2 dR dζ,
B_(r₁,h) ⊗ C_(r₂,κ,e)
 ≃ ∫_(R∈I_R, ζ>0)^⊕ C_(R,ζ,[h+e])^∞ dR dζ,
C_(r₁,κ₁,e₁) ⊗ C_(r₂,κ₂,e₂)
 ≃ ∫_(R∈I_R, ζ>0)^⊕ C_(R,ζ,[e₁+e₂])^∞ dR dζ.
```

The endpoint momentum configurations are collinear and have zero product
orbit measure. In particular the total-momentum-zero set for r₁=r₂
produces no D/E-family atom. The transverse-radius-zero B-family also
produces no atom in these three rows. Prove the multiplicity2 in B⊗B;
the input h labels survive exactly
through their total covering-center parity. Nonzero input transverse
radii give countably infinite multiplicity through the non-atomic
conditional spectral fiber described below.

**Required two- and three-dimensional Euclidean adapters.** Let
`F₂=ℝ²⋊Spin(2)` and `F₃=ℝ³⋊SU(2)`, with their ordinary quotients. Write
`T_(κ,e)` for a nonzero-radius F₂ irreducible, `χ_h^rot` for its
translation-trivial weight, and `S_(η,s)` for a nonzero-radius F₃
irreducible. Own the following concrete restriction and induction
calculations before using the table:

1. `Res_(SU(2)) S_(η,s) ≃ ⊕_(J≥|s|,J−|s|∈ℕ₀) D_J`; each spin occurs
   once. Tensoring by D_j and using circle reciprocity gives Q_J(j,s).
2. For a unit n, fix the plane-boost subgroup `F₂=ℝ²_(n⊥)⋊Spin(2)_n⊂F₃`,
   `Res_(F₂) S_(η,s) ≃ ∫_(0<κ<η)^⊕ T_(κ,[s])^2 dκ`. In the
   sphere model project a boost-dual sphere of radiusη onto the plane;
   the two signs of the remaining coordinate give the multiplicity2.
   In B⊗E and C⊗E take n to be the direction of the nonzero B/C representative momentum. The invariant sphere measure on each sheet has positive radial
   density proportional to `κ/√(η²−κ²)`.
3. `χ_h^rot⊗T_(κ,e)≃T_(κ,[h+e])` and
   `T_(a,e₁)⊗T_(b,e₂)≃∫_(|a−b|<κ<a+b)^⊕T_(κ,[e₁+e₂])^2 dκ`.
   For the second formula the two noncollinear relative angles with
   the same resultant radius give the multiplicity2. A positive radial
   density is proportional to
   `κ/√(((a+b)²−κ²)(κ²−(a−b)²))`; both endpoints have no atoms.
4. For a unit vector w in the boost plane let `L=ℝw`. Include the
   covering center Z={±I} in the inducing subgroup in the covered
   case, and use its prescribed character exp(2πie). For
   `χ_λ(tw)=exp(iλt/ℏ)`, prove
   `Ind_(L×Z)^(F₂)(χ_λ⊗χ_e) ≃ ∫_(κ>|λ|)^⊕ T_(κ,e)^2 dκ`.
   In the ordinary case omit Z. Fourier transform the transverse
   quotient coordinate: in coordinates `(t,θ)` the boost-dual vector
   is `R_θ(t,λ)`, so κ²=t²+λ². The branches t>0 and t<0 each
   produce one copy; the radial density is proportional to
   `κ/√(κ²−λ²)`. This includes λ=0 and still gives multiplicity2.
   The κ=|λ| set has no atom. Construct the unitary on induced
   equivariant sections and use the single RN convention of M1.
5. The restriction of `T_(a,e)` to L×Z is the direct integral of
   χ_λ⊗χ_e over `−a<λ<a`, with multiplicity2 and density proportional
   to `1/√(a²−λ²)`. This is the two-sheet cosine map on its circle
   model. For two such factors the sum-λ conditional fiber is
   non-atomic almost everywhere and hence isomorphic to ℓ²(ℕ),
   in Lebesgue class on `−a−b<λ<a+b`.

For the final three table rows fix a noncollinear pair p₁,p₂ and total
P=p₁+p₂. The subgroup preserving both momenta and energies is the boost
line `ℝw`, `w=(p₁×p₂)/|p₁×p₂|`, together with the covering center. The
stabilizer of `(m=0,P,E=0)` is F₂ on the plane P⊥. The two energy
coordinates are independently translated by boosts before their sum is
fixed, since p₁,p₂ are linearly independent. Prove this gives the stated
common boost line, with no additional scalar character arising from an
unspecified normal-subgroup multiplier. In B⊗B its character is λ=0.
In B⊗C it has the arcsine spectral λ-field in item5. In C⊗C use the
sum of the two such fields. Apply item4 and then disintegrate the
parameters: for each output ζ>0, B⊗C contains a non-atomic λ-interval
`|λ|<min(ζ,κ)`, and C⊗C contains the non-atomic interval `|λ|<min(ζ,κ₁+κ₂)`.
Their multiplicity spaces are separable infinite-dimensional; B⊗B
has only the two branches in item4. Prove the radial momentum quotient
has Lebesgue class on I_R using the cosine angle.

For C⊗E use item2 and the F₂ tensor formula of item3. At output ζ,
the remaining parameter κ′ ranges over the nonempty open interval
`(0,η)∩(|κ−ζ|,κ+ζ)`. It is nonempty exactly on the stated support;
its non-atomic conditional measure gives the countably infinite
multiplicity. Establish the Fubini/coarea identities and measurable fundamental sections for every iterated field above, including line induction and B⊗C, C⊗C and C⊗E, using M1’s induction/direct-integral comparison. Prove the conditional measure classes and the measurability of the identifications with ℓ²(ℕ). All changes of equivalent densities use their square-root unitaries. Prove ordinary/covered descent and the displayed endpoint-null statements. As scalar normalization cases, D_(E,0)⊗A shifts U to U+E; D_(E,0)⊗D and D_(E,0)⊗E shift the fixed scalar energy by E; D_(E,0)⊗B and D_(E,0)⊗C give the same irreducible class after translating its free energy coordinate.

**Positive-energy Poincaré examples.** Write `P_(m,j)^+` for mass m>0 and
`F_h^+` for a future finite-helicity model with inducing weight h=ℓ/2;
write `C_(ρ,e)^+`, ρ>0 and e∈{0,½}, for a future continuous-spin model,
whose Spin(2) weights are e+ℤ, each once. Use physical helicity ℏh only
in this future branch, as M4 specifies. Prove

```
P_(m₁,j₁)^+ ⊗ P_(m₂,j₂)^+
 ≃ ∫_(M>m₁+m₂)^⊕ ⊕_J
       (P_(M,J)^+ ⊗ ℂ^(N_J(j₁,j₂))) dM,
F_(h₁)^+ ⊗ F_(h₂)^+
 ≃ ∫_(M>0)^⊕ ⊕_(J≥|h₁-h₂|, J-|h₁-h₂|∈ℕ₀) P_(M,J)^+ dM.
```

There is no mass-threshold atom. In the first row use rest-frame relative
momentum and partial waves, and prove the massive two-body invariant measure
is equivalent to dM on this open interval. In the second row the common
stabilizer of two back-to-back null momenta is Spin(2), with character
h₁−h₂; prove that sign from M4's chosen lifts and use compact Frobenius
reciprocity. For one massive and one finite-helicity factor, M>m and the
multiplicity of spin J is
`#{a=-j,-j+1,…,j : J≥|a-h| and J-|a-h|∈ℕ₀}` in the same dM class.

For one continuous-spin factor and one finite-helicity factor, prove the
output M>0 has all J with `J-(e+h)∈ℤ`, each with multiplicity2J+1. For one
massive spin-j factor and one continuous-spin factor, the output M>m has
all J with `J-(j+e)∈ℤ`, each with multiplicity `(2j+1)(2J+1)`. For two
continuous-spin factors, all M>0 and J with `J-(e₁+e₂)∈ℤ` occur with
countably infinite multiplicity. In these three statements the measure class
is dM. Prove them by restricting the explicit little-group circle models
to the common Spin(2), retaining every weight and its multiplicity, then
inducing to SU(2). Do not replace a continuous-spin fiber by one fixed
helicity or omit its second central-character sector. The zero/collinear
null-pair set is null for product orbit measure and supplies no extra
massless summand. The radii ρ affect the explicit intertwiner although they
do not change these multiplicity counts.

### Past-energy, mixed massive and zero-momentum tensor formulas

Continue with ordered distinguishable factors. Write `P_(m,j)^ε_E`,
`F_h^ε_E` and `C_(κ,e)^ε_E` for the massive, finite-helicity and continuous-spin
M4 models on energy branch ε_E∈{+1,−1}. Here h=ℓ/2 is the inducing weight,
not the branch-dependent physical helicity ε_E ℏh. The continuous-spin radius κ
is the M4 little-group character radius `|ζ|` for
`w↦exp(i Re(conj(ζ)w))`; keep its explicit dictionary with any physical
Pauli–Lubanski radius separate. Write `S_(r;τ)` for the spacelike model with
representative `(0,0,r,0)`, r>0, and SL(2,ℝ) little representation τ.
Write `Z_Λ` for the zero-momentum model inflated from a Lorentz
representation Λ of SL(2,ℂ). All direct integrals below specify measure
classes. Prove the positive densities and square-root measure transports
for the fixed M1 orbit/Haar normalizations.

**Past/past.** The group automorphism `ι(a,A)=(−a,A)` sends momentum p
to −p, fixes every Lorentz stabilizer, and keeps its inducing representation.
Prove its transport agrees with M4's branch labels; in particular it preserves
h and changes the physical helicity sign. Pull back the whole positive-energy
table by ι. Explicitly, with the same N_J and with
`R_J(j,h)=#{a∈Wt(j):J≥|a−h|, J−|a−h|∈ℕ₀}`, prove

```
P_(m₁,j₁)^− ⊗ P_(m₂,j₂)^−
 ≃ ∫_(M>m₁+m₂)^⊕ ⊕_J (P_(M,J)^−)^(N_J(j₁,j₂)) dM,
F_(h₁)^− ⊗ F_(h₂)^−
 ≃ ∫_(M>0)^⊕ ⊕_(J≥|h₁−h₂|, J−|h₁−h₂|∈ℕ₀) P_(M,J)^− dM,
P_(m,j)^− ⊗ F_h^−
 ≃ ∫_(M>m)^⊕ ⊕_J (P_(M,J)^−)^(R_J(j,h)) dM,
C_(κ,e)^− ⊗ F_h^−
 ≃ ∫_(M>0)^⊕ ⊕_(J−e−h∈ℤ) (P_(M,J)^−)^(2J+1) dM,
P_(m,j)^− ⊗ C_(κ,e)^−
 ≃ ∫_(M>m)^⊕ ⊕_(J−j−e∈ℤ)
       (P_(M,J)^−)^((2j+1)(2J+1)) dM,
C_(κ₁,e₁)^− ⊗ C_(κ₂,e₂)^−
 ≃ ∫_(M>0)^⊕ ⊕_(J−e₁−e₂∈ℤ) (P_(M,J)^−)^∞ dM.
```

Every spin sum is over J∈½ℕ₀. The threshold/null exceptional sets have
no atoms, with the same measure and multiplicity proofs transported by ι.
This uses the translation-inversion automorphism; it does not silently
identify this operation with an arbitrary choice of a parity/time-reversal
or antiunitary lift.

**Opposite-energy massive inputs.**

This is a derived tensor table. *Needs:* M6.MeasuredPair's regular orbit
formula, M4.P's compact-line induction and Plancherel normalization (Lang,
Chapter VIII, pp.163–177), and M4.ParticleLabels. The orbit, measure and weight
calculations below supply the signs, thresholds and multiplicities; Lang's
formula does not itself assert the Poincaré tensor identity.

Put Δ_m=m₁−m₂ and
`d=(2j₁+1)(2j₂+1)`, and let `e_par∈{0,1}` be `2(j₁+j₂) modulo2`.
For integer n define

```
w_n=#{(a,b)∈Wt(j₁)×Wt(j₂):2(a+b)=n},
A_l=Σ_(n≥l, n−l∈2ℕ₀) w_n  (l≥2).
```

The sums are finite, w_n=w_(−n), and w_n vanishes unless n≡e_par modulo2.
Use M4's fixed C₀, k_t and D_l^± orientation, with its proved
`C₀ k_t C₀⁻¹=δ(0,2t)` conjugacy.
Thus the common Spin(2) character with physical weight a+b becomes the
SL(2,ℝ) compact character `χ_n(k_t)=exp(int)` with n=2(a+b).
Let `I_(e_par,iν)`, ν>0, be M4's normalized SL(2,ℝ) principal series.
Use the signed discrete-series labels already fixed in M4.

Prove the complete opposite-massive identity

```
P_(m₁,j₁)^+ ⊗ P_(m₂,j₂)^−
 ≃ [∫_(0<M<|Δ_m|)^⊕ ⊕_J
          (P_(M,J)^(sign Δ_m))^(N_J(j₁,j₂)) dM]
   ⊕ ∫_(r>0)^⊕ [
          ∫_(ν>0)^⊕ (S_(r;I_(e_par,iν)))^d dν
          ⊕ ⊕_(l≥2) (S_(r;D_l^+) ⊕ S_(r;D_l^−))^(A_l)
       ] dr.
```

For Δ_m=0 the timelike bracket is empty. The l-sum is finite: A_l=0 for
l>2(j₁+j₂) or l of the wrong parity. There are no complementary,
trivial or limit-discrete-series atoms in the displayed spacelike refinement,
and no null or zero-momentum direct summand. These statements concern the
irreducible direct-integral measure, not absence from Fell weak support.

Own the exact quotient calculation. For future unit velocities u,v write
`p₁=m₁u`, `p₂=−m₂v`, and `u·v=cosh t`, t≥0. Then
`q(p₁+p₂)=m₁²+m₂²−2m₁m₂cosh t`.
The generic pair stabilizer is Spin(2). At q>0 the sum has branch
sign Δ_m and `0<M<|Δ_m|`; at q<0 every r=√(−q)>0 occurs. The t=0
collinear orbit is null for the quotient measure. For Δ_m≠0 the q=0
orbit has t=|log(m₁/m₂)| and is also null; for Δ_m=0, q=0 occurs
only at the zero-sum collinear pair. Cartan disintegration has t-measure
class `sinh²t dt`, equivalent to `dq` away from t=0; hence the two
open ranges above have classes dM and dr. Give the exact density for the
chosen sum-orbit measure, rather than mistaking a Haar quotient measure
for `d³P/(2|P₃|)` without its mass-dependent factor.

The timelike little-group refinement is
`Ind_(Spin(2))^(SU(2))(Res D_(j₁)⊗Res D_(j₂))`.
Compact reciprocity gives N_J, including its equality with the explicit
weight count `Σ_(|n|≤2J, n≡2J mod2)w_n`. Consume M4.P’s noncompact adapter
for the spacelike part: for every n∈ℤ,

```
Ind_(SO(2))^(SL(2,ℝ)) χ_n
 ≃ ∫_(ν>0)^⊕ I_(n mod2,iν) dν
   ⊕ ⊕_(2≤l≤|n|, l≡n mod2) D_l^(sign n).
```

The last sum is empty for n=0. Use M4.P’s Plancherel unitary, right compact-character projection, positive densities/formal degrees and fixed discrete orientation. The principal densities have class dν on ν>0 and there is no atom at ν=0. Its normalized inducing factor is `r^(1+iν)`, its principal Casimir is `(1+ν²)/4`, and its discrete value is `l(2−l)/4`. Combining the ±n weights gives the equal discrete multiplicities A_l above.

Also compute the joint translation-PVM support. For Δ_m≠0 it is
`{p:q(p)≤0} ∪ {p:0<q(p)≤Δ_m², sign(p₃)=sign Δ_m}`;
for Δ_m=0 it is `{p:q(p)≤0}`. Use M4's time coordinate p₃. Although the actual nonzero-null sum at q=0 for unequal masses
has branch sign Δ_m, both null orientations lie in the closed PVM support
through the spacelike sector. This topological closure gives no new atom.
Transport reversed ordered factors with the tensor flip.

**A zero-momentum Lorentz factor.** For every M4 model X, including
spacelike and zero-momentum Lorentz models, prove `Z_triv⊗X≃X` and
its tensor-flipped identity. Denote M4's Lorentz principal family
by `Λ_(m,iω)`, m∈ℤ, ω∈ℝ modulo its proved Weyl equivalence, and its
complementary family by `Λ_s`, 0<s<1. For nontrivial Λ put

```
b(Λ)=|m|/2, e(Λ)=[m/2]       for Λ=Λ_(m,iω),
b(Λ)=0,     e(Λ)=0           for Λ=Λ_s,
T_J(b,j)=#{l∈b+ℕ₀: |J−j|≤l≤J+j and J−l−j∈ℤ}.
```

For every m₀>0 and ε_E∈{+1,−1}, prove

```
Z_Λ ⊗ P_(m₀,j)^ε_E ≃ ⊕_J (P_(m₀,J)^ε_E)^(T_J(b(Λ),j)).
```

Each count is finite; it is nonzero exactly when J+j≥b and
J−b−j∈ℤ. For J≥b+j with that parity it is 2j+1. Prove the compact
branching first: `Res_(SU(2)) Λ_(m,iω)=⊕_(l∈|m|/2+ℕ₀)D_l`, and
`Res_(SU(2))Λ_s=⊕_(l∈ℕ₀)D_l`, each once. Use the compact induced
picture, positivity of the complementary invariant form and compact
reciprocity; then apply M1’s measurable tensor-product theorem with its first subgroup equal to G (the one-point quotient, intersection J equal to the second subgroup), and the Clebsch–Gordan rule. This tensor identity applies to any unitary Λ, including the complementary model; it does not require Λ to be a unitary-parabolic-induced representation.
The output mass and energy branch stay fixed. If Λ is trivial, this tensor
product is exactly the original massive representation, not the b=0
nontrivial-family formula.

For every nontrivial Λ, h∈½ℤ, κ₀>0 and e₀∈{0,½}, prove

```
Z_Λ ⊗ F_h^ε_E
 ≃ ∫_(κ>0)^⊕ C_(κ,[e(Λ)+h])^ε_E dκ,
Z_Λ ⊗ C_(κ₀,e₀)^ε_E
 ≃ ∫_(κ>0)^⊕ (C_(κ,[e(Λ)+e₀])^ε_E)^∞ dκ.
```

There is no finite-helicity atom. Own the explicit null-little-group
restriction behind these formulas:
`Res_ΔΛ≃∫_(κ>0)^⊕T^Δ_(κ,e(Λ)) dκ`, each once, where T^Δ is the
nonzero-plane-character Δ representation. In the principal noncompact
model derive
`Λ_(m,iω)(δ(w,θ))f(z)=exp(−imθ/2)f(exp(−iθ)(z−w))`.
Use the unitary Fourier convention
`f̂(ξ)=∫exp(−2πi Re(conj(ξ)z))f(z)d²z`. Translation by w gives
M4's character at `ζ=−2πξ`, so κ=2π|ξ|; prove this rescaling and
its Jacobian. Polar coordinates give radial measure class κ dκ, and the
angular action has exactly the center character e(Λ).
Consume M4.Riesz's Fourier quadratic-form and both completion/density
comparisons. Multiplication by `√c_s |ξ|^(−s)` gives the same Δ model;
prove that the actual Δ action is transported by this map. No ξ=0
point mass is introduced.

Use the explicit covered-group isomorphism `Δ→F₂=ℝ²⋊Spin(2)`, `(w,θ)↦((Re w,Im w),θ)`, choosing the oriented orthonormal plane frame for which the rotation is multiplication by e^(iθ). The F₂ character is `exp(i k·v/ℏ)`, whereas T^Δ uses `exp(i Re(conj ζ w))`; prove `k=ℏ(Re ζ,Im ζ)` and `κ_(F₂)=ℏκ_Δ`. Transport the existing planar tensor unitary and its radius intervals by this dictionary. Use M1’s same one-point tensor identity followed by its induction/direct-integral comparison and the explicit Fubini unitary for the κ fields.

Tensoring a T^Δ-model by a rotation character shifts its center parity.
For two nonzero T^Δ-radii a,κ₀, the existing planar Euclidean tensor adapter
has radius κ in `(|a−κ₀|,a+κ₀)` with multiplicity2. At a fixed output
κ>0 the remaining a-interval is `(|κ−κ₀|,κ+κ₀)`, with non-atomic
positive measure, so its multiplicity space is separable infinite-dimensional.
This proves the second formula and its measure class, rather than deriving
infinite multiplicity merely from infinite-dimensional input spaces.
If Λ is trivial, both null tensor products are the original null model.
The formulas hold on either energy branch and descend exactly in the
center-compatible ordinary-group sectors.

### Opposite-energy tensor products with null inputs

Use the preceding M4/M6 labels and M4's fixed C₀, k_t and D_l^±
orientation. Here h is the finite-helicity inducing weight, whose physical
helicity on branch ε_E is ε_E ℏh. Write [x]∈{0,½} for a half-integer
moduloℤ. All
integrals specify measure classes, with the corresponding positive densities
and square-root transport included in the required unitary.

For local notation define the following completely specified spacelike
representation, for r>0 and e∈{0,½}:

```
T^sp_(r,e) = [∫_(ν>0)^⊕ S_(r;I_(2e,iν)) dν]
           ⊕ ⊕_(l≥2, l−2e∈2ℤ)
                    (S_(r;D_l^+) ⊕ S_(r;D_l^−)).
```

Every listed component in T^sp has multiplicity1. Thus (T^sp)^∞ denotes countably
infinite multiplicity in each listed component. No complementary, trivial or
limit-discrete-series atom is included. This notation expands to an actual
fixed principal/discrete table, rather than an unspecified little-group
decomposition. For every countable input weight sum in these spacelike
tensor rows, use M1's induction/direct-integral comparison with counting
parameter measure and its Fubini unitary. Transport M4.P's actual measurable
fundamental sections by C₀, so these counts define Hilbert direct-integral
unitaries, including the infinite multiplicity fields.

**A massive input and an opposite null input.** For ε_E∈{+1,−1}, m>0,
j∈½ℕ₀ and h∈½ℤ, put e=[j+h] and define finite counts

```
B_(l,+)^ε_E(j,h)
 = #{a∈Wt(j): 2(a−ε_Eh)≥l and 2(a−ε_Eh)−l∈2ℤ},
B_(l,−)^ε_E(j,h)
 = #{a∈Wt(j): 2(a−ε_Eh)≤−l and 2(a−ε_Eh)−l∈2ℤ}.
```

For l≥2, these counts vanish for l>2(j+|h|) or the wrong parity.
With the preceding R_J(j,h), prove

```
P_(m,j)^ε_E ⊗ F_h^(−ε_E)
 ≃ [∫_(0<M<m)^⊕ ⊕_J (P_(M,J)^ε_E)^(R_J(j,h)) dM]
   ⊕ ∫_(r>0)^⊕ [
        ∫_(ν>0)^⊕ (S_(r;I_(2e,iν)))^(2j+1) dν
        ⊕ ⊕_(l≥2) [
             (S_(r;D_l^+))^(B_(l,+)^ε_E(j,h))
             ⊕ (S_(r;D_l^−))^(B_(l,−)^ε_E(j,h))
           ]
      ] dr.
```

The discrete multiplicities need not be equal. They exchange when ε_E changes
sign, by a↦−a. For the continuous-spin input κ>0, e_c∈{0,½}, prove

```
P_(m,j)^ε_E ⊗ C_(κ,e_c)^(−ε_E)
 ≃ [∫_(0<M<m)^⊕ ⊕_(J−j−e_c∈ℤ)
           (P_(M,J)^ε_E)^((2j+1)(2J+1)) dM]
   ⊕ ∫_(r>0)^⊕ T^sp_(r,[j+e_c])^∞ dr.
```

All spin sums range over J∈½ℕ₀. The continuous-spin radius affects the
intertwiner but not these counts. Tensor flip supplies reversed ordered
factors. These two identities include both possible assignments of the
massive and null energy signs.

Prove their exact geometry and measures. In the future-massive rest frame
put `p₁=(0,0,0,m)` and `p₂=(0,0,E,−E)`, E>0, for a past
null input. Then `q(p₁+p₂)=m²−2mE`. The timelike range is
0<M<m on the massive input's energy branch; the spacelike range is every
r>0. The quotient has E-measure class E dE, so q has Lebesgue class
on (−∞,m²), with no atom at q=0. Relative to the fixed H/Spin(2)
Haar quotient its density in q is proportional to m²−q. Give the
sum-orbit measure conversion explicitly. The threshold q=m² is approached
only when the null input tends to zero, and has no atom. The q=0 image is
a nonzero null orbit on branch ε_E, not a zero momentum pair. The opposite
assignment follows by translation inversion and the fixed representative
transport.

For the discrete-sign calculation, at a spacelike sum use M4's positive
spatial representative `(0,0,r,0)`. A past null vector pointing in the
positive spatial direction is obtained from its fixed past representative
by the π-rotation lift `u=[[0,1],[−1,0]]`. Prove u reverses
the direction axis and `u δ(0,θ)u⁻¹=δ(0,−θ)`, so the transported
character is exp(−ihθ).
The massive spin contributes a∈Wt(j). Hence the spacelike common-circle
weights are a−h for ε_E=+1 and a+h for ε_E=−1, giving exactly B^ε_E.
Boosts along the direction axis commute with this circle. In the timelike
sector the possible axis reversal does not affect the compact spin count:
the multisets {|a−h|:a∈Wt(j)} and {|a+h|:a∈Wt(j)} coincide.
Apply M4.P's compact-induction Plancherel adapter, transported by C₀
from K⊂SL(2,ℝ) to Spin(2)⊂SU(1,1), weight by weight. For a continuous-spin input its circle weights are
exactly e_c+ℤ, once each; after coupling spin j every allowed circle
weight has multiplicity2j+1. Compact induction to SU(2) gives the finite
timelike count. In SL(2,ℝ), each principal and each admissible one-sided
discrete chain meets infinitely many such weights, giving countably infinite
spacelike multiplicity. No additional noncompact branching theorem is used
in these rows.

The closed joint translation-PVM support of either massive/null tensor is

```
{p:q(p)≤0} ∪ {p:0<q(p)≤m² and sign(p₃)=ε_E}.
```

It includes both null orientations and zero through the spacelike closure,
although the actual q=0 sum has branch ε_E. There is no null or zero-momentum
direct summand. The equality of closed support with the closure of the sum
image is proved using the full-support product orbit measure and continuous
momentum addition; it does not assert a Fell weak-support classification.

**Two opposite-energy null inputs.** For h₁,h₂∈½ℤ put
n=2(h₁−h₂), an integer, and e=[h₁+h₂]. Prove

```
F_(h₁)^+ ⊗ F_(h₂)^−
 ≃ ∫_(r>0)^⊕ [
        ∫_(ν>0)^⊕ S_(r;I_(2e,iν)) dν
        ⊕ ⊕_(2≤l≤|n|, l≡n mod2) S_(r;D_l^(sign n))
      ] dr.
```

For n=0 the discrete sum is empty. Every listed constituent has
multiplicity1. For e₁,e₂∈{0,½}, κ₁,κ₂>0 and h∈½ℤ, prove

```
F_h^+ ⊗ C_(κ₂,e₂)^− ≃ ∫_(r>0)^⊕ T^sp_(r,[h+e₂])^∞ dr,
C_(κ₁,e₁)^+ ⊗ F_h^− ≃ ∫_(r>0)^⊕ T^sp_(r,[e₁+h])^∞ dr,
C_(κ₁,e₁)^+ ⊗ C_(κ₂,e₂)^−
 ≃ ∫_(r>0)^⊕ T^sp_(r,[e₁+e₂])^∞ dr.
```

Reversing the ordered factors preserves the representation by tensor flip.
After tensor flip, F_(h₁)^−⊗F_(h₂)^+ has future label h₂ and
past label h₁, so the first row applies with n replaced by −n.
Prove that translation inversion followed by restoration of the positive
spatial representative gives the same exchange of discrete signs. The remaining infinite-multiplicity
rows are unchanged except for the transported energy labels.

Own the common-orbit calculation: write p₁=u, p₂=−v with u,v
future nonzero null. Then `q(p₁+p₂)=−2u·v≤0`, with strict
inequality off the collinear set. For every r>0 use the pair
`p₁=(0,0,r/2,r/2)`, `p₂=(0,0,r/2,−r/2)` over the
spacelike sum `(0,0,r,0)`. Its common stabilizer is the fixed Spin(2)
and the entire generic pair orbit is H/Spin(2). Prove the quotient
measure has Lebesgue class dr: disintegrate the two degree-two cone
measures, or compute the positive coarea Jacobian. Relative to a fixed
H/Spin(2) Haar quotient simultaneous scaling gives density proportional
to r³dr; transport to the chosen sum-orbit measure before constructing
the final unitary. The collinear set has product measure zero; its sums
can be future null, past null or zero, but give no direct summand.
The closed joint translation-PVM support is exactly `{p:q(p)≤0}`.

At this base pair the future finite-helicity weight is h₁ and the past
weight is −h₂, yielding n. One continuous-spin circle model has every
compatible weight once, so its tensor with one fixed weight gives all
circle weights once. Two continuous-spin models have each compatible
circle weight countably infinitely often. Applying the explicit
M4.P compact-induction formula, transported by C₀ and combined with
M1's counting-measure induction comparison, gives exactly the counts above:
one infinite circle chain already contributes infinitely many copies of
every principal representation and each compatible discrete series. Limits,
complementary series, trivial and zero-momentum models do not acquire atoms
from this calculation. Keep this absence-of-atoms assertion distinct from
closed momentum support and from Fell weak support. All center parities and
the exact ordinary-group descending sectors must be transported through
the common-circle intertwiner.

**Orbit measures for the spacelike×massive and spacelike×null rows.** Retain physical input `μ_(s,r₀)=δ(q(P)+r₀²)d⁴P`, and physical timelike output `d³P/(2|P₃|)` on its fixed branch and spacelike output `μ_(s,r)=δ(q(P)+r²)d⁴P`. Fix K Haar probability and the input `H_s/K` unit 2+1 shell measure `ν_in=d²u/(2|u₃|)`, with compatible H_s Haar. The resulting G/K Weil measure is fixed by this physical input. To use unit-scaled output orbits `μ_(t,M)/M²` and `μ_(s,r)/r²`, the forced output little-quotient measures are

```
SU(2)/K:  (2πr₀²) times sphere probability,
H_s/K:    ν_out=r₀²ν_in.
```

In the second line the group and quotient are literally the same H_s/K as at the input, but their roles have different normalized measures; do not reuse ν_in silently. Relative to an r₀-independent reference G Haar built with μ_(s,1), the input-normalized G Haar is r₀² times that reference. Keep this factor when assembling parameterized r₀ fields.

Derive the compact constant independently from the invariant frame measure `I=δ(q(p)+r₀²)δ(q(v)−1)δ(p·v)d⁴p d⁴v` on a fixed time orientation. Spacelike-first integration gives `μ_(s,r₀)ν_in=r₀ I`; timelike-first integration gives `I=μ_(t,1)(r₀/2)dΩ`, so the compact mass is `r₀(r₀/2)4π=2πr₀²`. The quadratic-shell scaling `μ_(s,r₀)=r₀²μ_(s,1)` on the abstract G/H_s quotient gives ν_out. Prove both changes of quotient order and their positive square-root transports. For compact induction compare to the fixed probability convention by `f↦√(2πr₀²)f`; for output H_s induction compare to M4.P's input-Haar convention by `f↦r₀f`. These are little-carrier unitaries, with no further multiplication of the outer density by the same constants.

The outer density remains `D_m(q)|dq|/(4r₀²)` (m=0 gives D_0=|q+r₀²|). Against unit-scaled sum orbits its M/r densities are `M D_m(M²)/(2r₀²)` and `r D_m(−r²)/(2r₀²)`; rewriting the same coarea measure against physical sum orbits divides them by M² or r², as displayed below. As an independent timelike check, direct rest-frame convolution of the two physical input shell measures has density `πD_m(q)/(2q)` against d⁴P, hence `(π/2)D_m(q)dq` against the unit timelike orbit. This equals the outer density times the forced compact mass. Noncompact little quotients remain in the Weil field; do not assert a locally finite momentum pushforward after integrating an infinite hyperboloid fiber. All displayed irreducible dM/dr measure classes and square-root transports are retained.

### A spacelike input tensor a massive input

Fix the spacelike input radius r₀>0 and its full M4 little-group
irreducible τ of SL(2,ℝ). Fix m>0, j∈½ℕ₀ and massive energy
branch ε_E∈{+1,−1}. The input is `S_(r₀;τ)⊗P_(m,j)^ε_E`;
tensor flip supplies the reversed ordering. Use the preceding common circle
`C₀k_tC₀⁻¹=δ(0,2t)` and its discrete-series orientation.
The following three rows cover every unitary irreducible τ, including
all complementary and endpoint constituents individually.

**Compact restrictions and finite counts.**

These are derived compact restrictions and weight counts. *Needs:*
M4.SL2R's explicit compact ladders and positive completions, M4.P (Lang,
Chapter VIII, pp.163–177) for induction of the resulting compact characters,
and M6.MeasuredPair for the tensor decomposition. The restrictions include
the individual D₁ limits; no reducible principal endpoint is counted as one
irreducible input.

Prove these restrictions from
M4's normalized compact/ladder models, with every listed K-character once:

```
Res_K I_(η,iω) = ⊕_(n∈η+2ℤ) χ_n,
Res_K I_(0,s)  = ⊕_(n∈2ℤ) χ_n                 (0<s<1),
Res_K D_l^σ   = ⊕_(b≥0) χ_(σ(l+2b))           (l≥1),
Res_K 1       = χ_0.
```

Here K=SO(2), η∈{0,1}, ω≥0 and `(η,ω)≠(1,0)` in the
irreducible principal list; I_(0,0) is included. D_1^± are the limits
of discrete series, while D_l^± for l≥2 are the discrete series.
Endpoint induced modules are not substituted for these irreducible
constituents. For the complementary row use positivity of its diagonal
invariant form and density of the compact finite-type domain, rather than
treating a nonunitary induced Hilbert norm as invariant.

For integers l≥1 and L≥2 define finite counts V_J(l,j) and E_L(l,j).
Set V_J=0 unless `J−j−l/2∈ℤ`; when that parity holds, put

```
V_J(l,j)
 = Σ_(a∈Wt(j)) max(0,
       J−a−l/2−max(0,−J−a−l/2)+1).
```

Each summand is then an integer. Equivalently it counts pairs
`a∈Wt(j), b∈ℕ₀` with `|l/2+b+a|≤J`. It is nonzero exactly
when `J+j≥l/2` with that parity. For `J≥j+l/2` it equals
`(2j+1)(J−l/2+1)`. Set E_L=0 unless `L−l−2j∈2ℤ`;
when that parity holds, put

```
E_L(l,j)=Σ_(a∈Wt(j)) max(0,1−a−(l+L)/2).
```

Equivalently, if `k=j−(l+L)/2∈ℕ₀`, then
`E_L(l,j)=(k+1)(k+2)/2`; otherwise it is zero. Thus it vanishes
for L>2j−l. Finally put

```
A_L(j)=j−L/2+1 if j−L/2∈ℕ₀, and 0 otherwise,
V_J^0(j)=2min(J,j)+1 if J−j∈ℤ, and 0 otherwise.
```

The first count is also `#{a∈Wt(j):2a≥L and 2a−L∈2ℤ}`.

All spin sums below have J∈½ℕ₀, and all output discrete sums have
integer L≥2. A power∞ means countably infinite multiplicity.
Every integral specifies its measure class; construct the exact positive
density and square-root measure transport for the chosen Haar conventions.

**Principal or complementary spacelike input.** If τ is I_(η,iω),
put e=[j+η/2]. If τ is a complementary I_(0,s), put e=[j]. Prove

```
S_(r₀;τ) ⊗ P_(m,j)^ε_E
 ≃ [∫_(M>0)^⊕ ⊕_(J−e∈ℤ)
          (P_(M,J)^ε_E)^((2j+1)(2J+1)) dM]
   ⊕ ∫_(r>0)^⊕ [
          ∫_(ν>0)^⊕ (S_(r;I_(2e,iν)))^∞ dν
          ⊕ ⊕_(L≥2, L−2e∈2ℤ)
                      (S_(r;D_L^+) ⊕ S_(r;D_L^−))^∞
       ] dr.
```

The entire principal continuous parameter and the complementary parameter
of the input affect its intertwiner but not these output measures/counts.
This assertion follows from the displayed compact restrictions, rather
than identifying principal and complementary SL(2,ℝ) representations.

**Discrete or limit-discrete spacelike input.** For τ=D_l^σ,
l≥1, σ∈{+1,−1}, put e=[j+l/2]. Prove

```
S_(r₀;D_l^σ) ⊗ P_(m,j)^ε_E
 ≃ [∫_(M>0)^⊕ ⊕_J (P_(M,J)^ε_E)^(V_J(l,j)) dM]
   ⊕ ∫_(r>0)^⊕ [
          ∫_(ν>0)^⊕ (S_(r;I_(2e,iν)))^∞ dν
          ⊕ ⊕_(L≥2, L−2e∈2ℤ) (S_(r;D_L^σ))^∞
          ⊕ ⊕_(L≥2) (S_(r;D_L^(−σ)))^(E_L(l,j))
       ] dr.
```

Thus the same-chirality discrete outputs are unbounded in L and have
infinite multiplicity. Opposite-chirality outputs form the explicit finite
list L≤2j−l, with finite multiplicities E_L. No output D_1 limit,
complementary or trivial atom is added. This includes l=1 inputs as
stated, without treating their input limit label as square-integrable.
The spacelike output chirality σ is the same for both massive energy
signs; changing ε_E alone does not reverse the fixed spacelike axis.

**Trivial spacelike little representation.** For τ=1, put e=[j]. Prove

```
S_(r₀;1) ⊗ P_(m,j)^ε_E
 ≃ [∫_(M>0)^⊕ ⊕_J (P_(M,J)^ε_E)^(V_J^0(j)) dM]
   ⊕ ∫_(r>0)^⊕ [
          ∫_(ν>0)^⊕ (S_(r;I_(2e,iν)))^(2j+1) dν
          ⊕ ⊕_(L≥2) (S_(r;D_L^+) ⊕ S_(r;D_L^−))^(A_L(j))
       ] dr.
```

Here the finite L-list has L≤2j. This input is a spacelike momentum
model with trivial SL(2,ℝ) fiber, not the zero-momentum trivial
Poincaré representation.

**Pair geometry and all energy branches.** Let q(p_s)=−r₀²,
q(p_m)=m² and s=p_s·p_m. The projection of the massive vector into
p_s^⊥ is `v=p_m+(s/r₀²)p_s`, and
`q(v)=m²+s²/r₀²>0`. It has the same time orientation as p_m.
Consequently its stabilizer in the spacelike little group is always the
compact K=SO(2), for every s∈ℝ. There is no change to a noncompact
common subgroup at a timelike/spacelike output transition.

The sum invariant is `q=m²−r₀²+2s`, so every q∈ℝ occurs.
To fix circle embeddings choose

```
p_s=(0,0,r₀,0),
p_m=(0,0,−s/r₀, ε_E√(m²+s²/r₀²)).
```

The common stabilizer is the native diagonal circle. The total spatial
component before the final axial boost is
`(m²+r₀²−q)/(2r₀)`, which is positive whenever q<0.
Thus the axial boost sending a spacelike sum to `(0,0,√(−q),0)`
commutes with this circle and requires no axis reversal. For q>0 an
axial boost gives the timelike representative on branch ε_E, for all M>0.
At q=0 the actual sum is nonzero null on branch ε_E; zero total momentum
is impossible for these two input causal types. Prove these statements
and the transitivity of the pair orbit at each s, with its single
H/Spin(2) orbit and explicit measurable representative transport.

For the measure calculation fix p_s as above and put
`v=p_m+(s/r₀²)p_s`, `a=√(m²+s²/r₀²)`. Its 2+1 mass-shell
measure scales as `d²v/(2|v₃|)=a d²u/(2|u₃|)`; the transverse
coordinate has `|dp_(m,2)|=|ds|/r₀`. Hence in the preceding common
Weil normalization the outer density is exactly

```
a ds/r₀ = √((q−m²+r₀²)²+4m²r₀²) dq/(4r₀²).
```

At m=0 this reduces to the null-row density. Write the numerator as
D_m(q). The timelike and spacelike densities against the intermediate
unit-scaled sum orbits are `M D_m(M²)dM/(2r₀²)` and
`r D_m(−r²)dr/(2r₀²)`; against the physical output carriers they
are `D_m(M²)dM/(2r₀²M)` and `D_m(−r²)dr/(2r₀²r)`.
Prove the consistent Weil comparisons for both quotient orders. All
are positive on their open ranges, hence have classes dM/dr; q=0
has no atom. There are no null
or zero-momentum direct summands. The closed joint translation-PVM
support is exactly

```
{p:q(p)≤0} ∪ {p:q(p)>0 and sign(p₃)=ε_E}.
```

Both null orientations and zero belong to this support through spacelike
closure, despite the one-branch actual null image. This is a PVM support
statement, distinct from a full Fell weak-support computation.

**Little-group refinement and counts.** Restrict τ to its actual compact
stabilizer, tensor with `Res_(Spin(2))D_j`, and send a weight n of τ
and physical spin weight a to the SO(2) integer n+2a. The output
refinements are compact induction to SU(2) when q>0 and M4.P’s
`Ind_K^(SL(2,ℝ))χ_(n+2a)` Plancherel adapter, transported by C₀, when q<0.
For a two-sided input chain, each allowed output compact weight has
multiplicity2j+1. For a one-sided input chain, each fixed output compact
weight has at most2j+1 occurrences, with an unbounded tail on the input
chirality side. Compact SU(2) reciprocity gives V_J. Every principal
series and every same-chirality discrete chain meets infinitely many
weights of that tail, giving the stated countable infinite multiplicities.
For an opposite-chirality discrete chain the equation is, after a↦−a
when needed, `b+c=−a−(l+L)/2` with b,c∈ℕ₀. Counting its solutions
gives exactly E_L, including its finite support bound. The finite input
chain for τ=1 gives V_J^0 and A_L directly.

Use M1's induction/direct-integral comparison with counting parameter
measure and its Fubini unitary, together with M4.P's measurable
fundamental sections transported by C₀, to construct these fields from the counted
K-types. Output principal parameters use M4's normalized `r^(1+iν)`
convention and no ν=0 atom. The exact product covering-center character
is e in each row. Prove ordinary-group descent and the consistent outer
transport: translation inversion sends the spacelike input to the negative
axis; restoring its positive representative swaps D_l^+ and D_l^− in
both input and output, while also changing the massive energy sign.
This does not alter the fixed-axis formulas above.

### A spacelike input and a null input

Use M4's actual spacelike carrier `S_(r₀;τ)`, r₀>0, and its fixed
`C₀ k_t C₀⁻¹=δ(0,2t)` circle. Use M4.P's already owned compact-induction
unitary and M6's fixed `T^sp_(r,e)` field. The following rows include every
SL(2,ℝ) irreducible τ in M4: principal `I_(η,iω)` with η∈{0,1}, ω≥0,
excluding the reducible odd member (η,ω)=(1,0); complementary `I_(0,s)`,
0<s<1; both `D_l^σ`, l≥1, σ∈{+1,−1}, including the two limits l=1;
and the trivial representation. The even principal endpoint is included.
Reducible endpoint modules are first resolved into M4's actual unitary
constituents; they are not added as new irreducibles. Write e_τ=[η/2]
for a principal, e_τ=0 for a complementary or trivial input, and e_τ=[l/2]
for D_l^σ. Brackets mean reduction of a half-integer moduloℤ to {0,½}.

Here ε_E∈{+1,−1} is the null energy branch. The finite-helicity label h∈½ℤ
is the inducing weight, with physical helicity ε_E ℏh; the continuous-spin
labels are κ>0 and e_c∈{0,½}, as in M4. Every spin sum below is over
J∈½ℕ₀. Every infinite multiplicity is countably infinite. Ordered-factor
reversal follows by the tensor flip.

**Finite helicity; two-sided compact weights.** For τ principal or
complementary, put e=[e_τ+h]. Prove

```
S_(r₀;τ) ⊗ F_h^ε_E
 ≃ [∫_(M>0)^⊕ ⊕_(J−e∈ℤ) (P_(M,J)^ε_E)^(2J+1) dM]
   ⊕ ∫_(r>0)^⊕ T^sp_(r,e)^∞ dr.
```

This includes the even principal endpoint. Its continuous inducing parameter
changes the intertwiner, but not these multiplicities.

**Finite helicity; one-sided compact weights.** For τ=D_l^σ, l≥1,
put e=[l/2+h] and, for a half-integer u, define the fixed counts

```
V_J(u) = max(0, J−u−max(0,−J−u)+1)  if J−u∈ℤ, and 0 otherwise,
B_L(u) = k+1 if k=−u−L/2∈ℕ₀, and 0 otherwise  (L≥2),
u_t = u_< = l/2−σε_Eh,       u_> = l/2+σε_Eh.
```

These are integers on their stated domains. Equivalently, when J−u∈ℤ
and u≤J, `V_J(u)=min(2J+1,J−u+1)`, and it is zero otherwise.
Define the explicitly expanded spacelike field

```
A_(r;σ,e,u)
 = [∫_(ν>0)^⊕ (S_(r;I_(2e,iν)))^∞ dν]
   ⊕ ⊕_(L≥2, L−2e∈2ℤ) [
           (S_(r;D_L^σ))^∞ ⊕ (S_(r;D_L^(−σ)))^(B_L(u)) ].
```

A zero multiplicity means the summand is omitted. Prove the complete row

```
S_(r₀;D_l^σ) ⊗ F_h^ε_E
 ≃ [∫_(M>0)^⊕ ⊕_J (P_(M,J)^ε_E)^(V_J(u_t)) dM]
   ⊕ ∫_(0<r<r₀)^⊕ A_(r;σ,e,u_<) dr
   ⊕ ∫_(r>r₀)^⊕ A_(r;σ,e,u_>) dr.
```

The opposite-orientation discrete tail is finite: B_L(u)=0 unless
L≤−2u and the center parity matches. Since u_<+u_>=l>0, this tail
can occur on at most one of the two open r-regions. The same-orientation
discrete chain and principal field have infinite multiplicity on both.
The input limits l=1 are included; output D_1^± still have no atom.

**Finite helicity; trivial spacelike little representation.** Put e=[h]
and, for c∈½ℤ, define

```
Q_(r,c) = [∫_(ν>0)^⊕ S_(r;I_(2e,iν)) dν]
           ⊕ ⊕_(2≤L≤2|c|, L−2c∈2ℤ) S_(r;D_L^(sign c)).
```

Its discrete sum is empty when c=0. Each listed component has multiplicity1.
Prove

```
S_(r₀;1) ⊗ F_h^ε_E
 ≃ [∫_(M>0)^⊕ ⊕_(J≥|h|, J−|h|∈ℕ₀) P_(M,J)^ε_E dM]
   ⊕ ∫_(0<r<r₀)^⊕ Q_(r,−ε_Eh) dr
   ⊕ ∫_(r>r₀)^⊕ Q_(r,+ε_Eh) dr.
```

Thus a nonempty finite discrete tail reverses orientation at r₀. In
particular h=0 has only the even principal field in the spacelike part;
|h|=½ also has no discrete tail.

**Continuous spin; every spacelike little representation.** For every
κ>0, e_c∈{0,½}, put e=[e_τ+e_c] and define d_τ=1 if τ=1 and
d_τ=∞ for every other irreducible τ, including D_1^±. Prove

```
S_(r₀;τ) ⊗ C_(κ,e_c)^ε_E
 ≃ [∫_(M>0)^⊕ ⊕_(J−e∈ℤ)
                       (P_(M,J)^ε_E)^(d_τ(2J+1)) dM]
   ⊕ ∫_(r>0)^⊕ T^sp_(r,e)^∞ dr.
```

Here ∞ times a positive finite integer is ∞. The continuous-spin radius
κ changes the intertwiner, but not the listed supports or multiplicities.
There is no finite opposite-orientation exception in this row.

**Geometry, measure and signed-circle proof.**

This is the direct orbit/coarea derivation of the preceding tensor formulas.
*Needs:* M4's Lorentz bilinear form and little-group embeddings,
M6.MeasuredPair, and M4.P's fixed compact-line normalization (Lang,
Chapter VIII, pp.163–177). For connected orbit exhaustion the external
input is Mackey1958 Theorem 9.1; the displayed representatives and null-set
calculation establish this particular signed-circle geometry.

Write p_s for the spacelike
momentum, p_n for the null momentum, and s=p_s·p_n. For every s≠0 use

```
p_s=(0,0,r₀,0),
p_n=(0,0,−s/r₀, ε_E|s|/r₀),
q(p_s+p_n)=−r₀²+2s.
```

The projection `v=p_n+(s/r₀²)p_s` into p_s^⊥ has
`q(v)=s²/r₀²>0` and time orientation ε_E. Hence the generic common
stabilizer is the actual compact Spin(2), not a noncompact Cartan subgroup.
The pair orbit at each s≠0 is H/Spin(2), H=SL(2,ℂ). Timelike sums have
all M>0 and branch ε_E. Spacelike sums have every r>0, with
0<r<r₀ corresponding to s>0 and r>r₀ to s<0.

At s=0 the projection is nonzero null. In the fixed C₀ coordinates
its common stabilizer is
`C₀{±[[1,t],[0,1]]:t∈ℝ}C₀⁻¹`; take
`p_n=ε_E(0,−1,0,1)` to verify this statement. This exceptional orbit is
product-measure zero: for fixed p_s, s=0 imposes the coordinate plane
p_(n,2)=0 in the cone measure `d³p_n/(2|p_(n,3)|)`, which is absolutely
continuous in its three spatial coordinates away from zero. Apply Fubini
over the spacelike orbit. A null base set remains null for every separable
internal representation fiber. Thus r=r₀ contributes no atom and needs
no unproved unipotent restriction formula to justify these rows.

Own the exact measure comparison, rather than using a formal pushforward
of an infinite measure. Normalize the projected future/past unit
2+1 mass-shell measure by `d²u/(2|u₃|)` on H_s/Spin(2), and choose the
H/H_s and H/Spin(2) Haar quotient measures compatibly by Weil's formula.
Disintegrating the displayed cone measure at p_(n,2)=−s/r₀ gives exactly
`(|s|/r₀²) ds` times that fixed H_s/Spin(2) measure. Thus on the generic
pair orbits the outer density is
`|q+r₀²| dq/(4r₀²)`.
Against the preceding intermediate unit-scaled output orbits this is
`M(M²+r₀²)dM/(2r₀²)` in the timelike sector and
`r|r₀²−r²|dr/(2r₀²)` in the spacelike sector. Against the physical
output shells the densities instead are `(M²+r₀²)dM/(2r₀²M)` and
`|r₀²−r²|dr/(2r₀²r)`, with the M^(−2), r^(−2) comparison
factors already fixed above. A change of overall Haar normalization
also contributes its single fixed constant. Both versions have the
displayed dM/dr classes on their open ranges; construct the exact
positive square-root transport. These are disintegrations over H/Spin(2),
not a claim that the ordinary pushforward of the infinite product
measure is locally finite.

The spacelike sum has positive direction-axis coordinate in this canonical
pair. Axis-preserving boosts commute with δ(0,θ). The null momentum's
spatial sign is −sign(s), whereas its fixed branch-ε_E representative has
spatial sign ε_E. The π-rotation lift from the preceding opposite-null rows
therefore transports its finite character to physical circle weight
`c=−ε_E sign(s) h`. In the timelike sector c=−ε_Eh; in the two
spacelike regions c=−ε_Eh and +ε_Eh respectively. Prove this by conjugating
the actual matrices, with `C₀ k_t C₀⁻¹=δ(0,2t)`, before assigning
any discrete orientation. The τ compact weights are, once each,
`e_τ+ℤ` for the two-sided families, `σ(l/2+ℕ₀)` for D_l^σ,
and {0} for the trivial representation. The finite-helicity circle weights
are these weights shifted by c. SU(2) compact reciprocity counts weights
between −J and J, giving precisely the timelike rows and V_J. Applying
M4.P's adapter, transported by C₀, to the integer compact character
n=2w gives the stated principal and discrete rows: for D_l^σ, a D_L^(−σ) copy occurs for exactly
`b∈ℕ₀` with `b≤−u−L/2`, giving B_L; the same-orientation tail
and the principal count are infinite. In the trivial case the single
weight is c, giving Q with its actual signed tail.

A continuous-spin Δ model restricts to the circle with each weight in
e_c+ℤ exactly once. Tensoring it with τ yields each compatible circle
weight once for τ=1, and countably infinitely often for every nontrivial
τ. Compact reciprocity gives its timelike row; M4.P gives (T^sp)^∞ in
all spacelike cases. This uses no additional noncompact subgroup-branching
formula. Establish measurable sections and intertwiners using M1 and the
already fixed M4.P carrier transported by C₀, including the signed
representative transport. For each countable weight sum use M1's
induction/direct-integral comparison with counting parameter measure and
its Fubini unitary, with M4.P's measurable fundamental sections
transported by C₀. This applies to every finite-helicity and continuous-spin
row in this subsection.

In every row the closed joint translation-PVM support is exactly

```
{p:q(p)≤0} ∪ {p:q(p)>0 and sign(p₃)=ε_E}.
```

At q=0 the actual sums are nonzero null on branch ε_E, but this single
quotient value has no atom. Zero total momentum is impossible for a
spacelike and a nonzero null input. Both null orientations and zero lie
in the closed PVM support through closure of the spacelike sector; they
supply no direct summand. There are no complementary, trivial, ν=0 or
limit-discrete atoms in the displayed spacelike refinements. Keep these
measure assertions distinct from the closed PVM support and from a full
Fell weak-support calculation, which is not supplied by this table.
The tensor descends through the covering center exactly when its displayed
e is zero; record separately any requirement that each input itself descend.

### M6.C — the complementary×complementary SL(2,ℝ) tensor adapter

For every 0<t,v<1 put γ=t+v−1. In M4's right-induction,
Casimir and signed compact-weight conventions, prove the complete identity

```
I_(0,t)⊗I_(0,v)
 ≃ [∫_(ν>0)^⊕ I_(0,iν) ρ₀(ν)dν]
   ⊕ [∫_(ν>0)^⊕ I_(0,iν) ρ₁(ν)dν]
   ⊕ ⊕_(L≥2, L∈2ℤ) (D_L^+⊕D_L^−)
   ⊕ { I_(0,γ) if γ>0; 0 if γ≤0 }.
```

Each displayed discrete or complementary constituent occurs once. There are
exactly two even principal channels; the following fixed cyclic normalization
gives their actual positive densities, rather than an unspecified measure.
For δ∈{0,1} set

```
p⁰=(a,b,c,d)=((1+t+v)/4,(1−t−v)/4,(1+t−v)/4,(1−t+v)/4),
p^δ=p⁰+(δ/2,δ/2,δ/2,δ/2),
H₀(p)=∏_(i<j)Γ(p_i+p_j)/Γ(Σ_i p_i),
ρ_δ(ν)= [1/(8πH₀(p^δ))]
         |∏_(i=1)^4 Γ(p_i^δ+iν/4)/Γ(iν/2)|²,  ν>0.
```

The densities are equivalent to dν on ν>0. They are Clebsch–Gordan
spectral densities fixed by the unit compact-weight vectors below; they are
not a new normalization of the Haar Plancherel transform in M4.P. The two
principal integrals can be written as multiplicity2 with Lebesgue measure
by their explicit positive square-root density transport. The discrete and
complementary summands use counting measure and unit extremal/zero-weight
vectors. There is no trivial, odd-center, ν=0 or limit-discrete atom,
including at t+v=1. There is no other complementary spectrum, discrete
or continuous. All signed even discrete families L≥2 are present; none
is discarded at the threshold.

Consume M2.DerivedDI’s actual closed-derived graph decomposition, central
affiliation, spectral projections and power-domain comparison, built from
M0’s common Gårding core and V4.0.Fields for a given decomposable representation. For an irreducible spectral field consume M2.TypeIDisintegration, including its V4.0.Decomposition input. Own the following
SL(2,ℝ) weight/extremal-kernel specialization here.

Compact-weight projections `P_m=(2π)⁻¹∫_0^(2π)e^(−imt)π(k_t)dt` decompose fiberwise by the integrated-operator identity. The closures T_(E_±) shift their domains from weight m to m±2; establish the projection/core comparison and the corresponding decomposable kernels. In M4's irreducible ladder carriers the finite K-support vectors are graph cores for E_±: coefficients grow at most linearly, smooth K-Fourier truncations converge in their graph norms, and approximate-identity Gårding vectors approximate each finite K-vector in that graph norm. For m=L>0 the joint space `P_LH∩ker T_(E_−)` therefore has fibers only at D_L^+, where it is the lowest line tensored with M_(D_L^+). Principal/complementary lowering coefficients never vanish; another D_l^+ at weight L has nonzero lowering unless l=L; negative discrete/trivial fibers have no positive extremal weight. Include the D_1 limits in this verification before applying the even-centre restriction. The analogous highest kernel at −L has fibers only at D_L^−.

Own the following spectral proof, using the actual primary text
[Groenevelt, *The Wilson function transform*, §2 Eqs.2.1–2.3](https://arxiv.org/html/math/0306424v1#S2)
for the recurrence, orthogonality measure and residue prescription.

Consume M4.SL2R’s fixed weight generators, unitary enveloping involution,
central q_B and primitive coproduct before deriving the tensor Jacobi coefficients.

The unitary complementary compact basis has integer weights n∈2ℤ and
`E_+e_n=α_t(n)e_(n+2)`, `E_−e_n=α_t(n−2)e_(n−2)`,
where `α_t(n)=½√((n+1)²−t²)>0`, `E_+*=E_−` and
`H_K e_n=ne_n`. These give
`q_B=E_−E_+−H_K(H_K+2)/4=(1−t²)/4`.
On total weight zero use `f_k=e_(2k)⊗e_(−2k)`, k∈ℤ. The
tensor Casimir has diagonal and positive neighboring coefficients

```
B_k=2k²+1/2−(t²+v²)/4,
A_k=√[((k+1/2)²−t²/4)((k+1/2)²−v²/4)].
```

It commutes on its finite core with k↦−k. Use the even basis
`u₀=f₀`, `u_n=(f_n+f_(−n))/√2`, n≥1, and the odd basis
`z_n=(f_(n+1)−f_(−n−1))/√2`, n≥0. Their half-line Jacobi
matrices are `1/4+4J_W(p⁰)` and `1/4+4J_W(p¹)`, respectively.
Define that polynomial basis explicitly. With S=Σp and (u)_j the finite
rising product, put

```
W_n(x²;p)=(a+b)_n(a+c)_n(a+d)_n
  × Σ_(j=0)^n [(-n)_j(n+S−1)_j Π_(h=0)^(j−1)((a+h)²+x²)]
                 /[(a+b)_j(a+c)_j(a+d)_j j!],
H_n(p)= n! Π_(i<j)Γ(n+p_i+p_j)/[(2n+S−1)Γ(n+S−1)]  (n≥1).
```

Use [DLMF18.25.4–5](https://dlmf.nist.gov/18.25#E4) for the positive-parameter Wilson measure and norm: its h_n=2πH_n after x=y². For b≤0 prove the same norm with Groenevelt’s residue/endpoint continuation above. Use the displayed H₀ at n=0, including the removable S=1 value. The norm-one polynomial
is `(-1)^n W_n√(H₀/H_n)` for the normalized measure below; it has
positive leading coefficient. Here J_W is multiplication by x² in this
basis. Prove its recurrence and squared norms, not just its name. Check the even first off-diagonal:
it is √2 A₀. Since Σp⁰=1 identically on the whole (t,v) square, the Wilson recurrence coefficient at n=0
must be evaluated as `(a+b)(a+c)(a+d)/(a+b+c+d)`, which is twice
the incorrectly canceled bulk expression. This boundary value is part of
the adapter, not a convention left to the implementation.

For clarity, the normalized Wilson measure is
`(2πH₀(p))⁻¹|∏Γ(p_i+ix)/Γ(2ix)|²dx` on x>0,
plus its prescribed positive residue atoms. Its parameters have every
pairwise sum positive. Only b can be negative: −1/4<b<1/4, with b<0 exactly when γ>0;
therefore there is precisely one residue atom x²=−b² when γ>0.
The odd parameters are all positive. Since `q_B=1/4+4x²` and ν=4x,
this gives exactly the displayed densities and the single complementary
label γ. In the even cyclic measure its atom has mass

```
p_(t,v)= Γ((t+v)/2)Γ(t/2)Γ(v/2)
          /[√π Γ((t+v−1)/2)Γ((1+t)/2)Γ((1+v)/2)],  t+v>1.
```

The weight-zero vector u₀ maps to √p_(t,v) times the unit complementary
zero-weight vector. This probability weight is not its multiplicity.
At t+v=1, b=0: use the removable quotient
`Γ(ix)/Γ(2ix)→2`, and prove the orthogonality/norm limits by a uniform
near-zero bound `x²/(b²+x²)≤1` as b↓0 and uniform Stirling bounds
at infinity. The resulting measure is absolutely continuous, with finite
positive ρ₀(0); there is no residue atom. This is a dominated endpoint
proof, not a guess from strict-inequality formulas or finite matrices.

Use M2.DerivedDI to justify the actual nonnegative Casimir on total weight zero. Its fiber projection is zero on every signed discrete/limit representation, while the remaining even principal/complementary/trivial labels have q_B≥0. Each f_k is analytic for the product group from M0's compact-finite analytic vectors in the two factors, hence smooth for its diagonal restriction. Approximate-identity Gårding convolution and the central-power closure comparison put f_k in every dom(T_(q_B)^n) with value exactly the finite Jacobi power. Group analyticity here is not an assertion of analyticity for the second-order Casimir.

The explicit Wilson measures in q=1/4+4x², including their allowed residue atom, are supported in q>0; Stirling’s bound gives `∫exp(η√q)dμ<∞` for 0<η<π. For polynomial completeness, use Cauchy–Schwarz to give an orthogonal L² function's measure an exponential √q moment with a smaller exponent, push symmetrically to ±√q, and apply Fourier-strip analyticity and uniqueness. For each actual scalar spectral measure at u₀,z₀, the nonnegative cosh series and Tonelli transfer the same finite bound from its identical moments; `e^(η√q)≤2cosh(η√q)` then gives the exponential moment. The same strip argument makes those measures unique. For the off-diagonal complex spectral measure, obtain exponential integrability of its variation from the two diagonal spectral measures by Cauchy–Schwarz. Its moments vanish by the reflection identity on the finite Jacobi powers, so it is zero. This proves orthogonality of the actual cyclic channels without assuming that a formal reflection already commutes with an unspecified self-adjoint Jacobi extension.

Positive off-diagonal Jacobi coefficients put every u_n,z_n in the polynomial spans of the two cyclic vectors. Thus their closures fill the total-weight-zero space. In the type-I field, every irreducible with this weight has it once, and q_B is injective on the chosen principal and complementary Weyl halves; q=0 corresponds to the trivial fiber and q=1/4 to the principal endpoint there. The two actual scalar channels therefore determine the representation multiplicities and exclude every further complementary field, trivial or endpoint atom. Discrete q=0 at D_2 is treated separately by its nonzero extremal weight, not confused with a zero-weight trivial fiber.

The remaining irreducibles have one-sided signed weights. For each even
L≥2, a lowest-weight vector at total weight L has coefficients a_k,
k∈ℤ, along weights `(2k,L−2k)`, satisfying

```
a_(k+1)=−α_v(L−2k−2)a_k/α_t(2k),   a₀=1.
```

All recurrence coefficients are nonzero, so the weak weight-L lowering equation has a one-dimensional solution space. Both tails have `|a_k|∼const·|k|^(−L/2)`. For even L≥2 its ℓ² solution v_L is nonzero. Finite smooth cutoffs χ(k/N)v_L converge in norm, and their lowering commutator has squared norm `O(N^(1−L))`, which tends to zero even at L=2. Finite tensor K-vectors are smooth and lie in the closure domain by the preceding Gårding comparison, so this proves `v_L∈P_LH∩ker T_(E_−)`. No estimate for E_+ or a second-order cutoff is inferred from this first-order bound.

By the decomposable extremal-kernel lemma this nonzero space is exactly the lowest line of the D_L^+ fiber tensored with its multiplicity. Its one-dimensionality proves that the fiber is an atom of multiplicity1. Normalize that atom to counting measure by its square-root measure transport. Under the actual M2 unitary decomposition choose the unit multiplicity vector corresponding to v_L/||v_L||, and map `w∈D_L^+` to the inverse decomposed section `w⊗η_L` supported at that atom. This is the genuine isometric G-intertwining embedding and proves existence without assuming the original tensor admissible or the uncut recurrence vector smooth. The embedded vector is then smooth/analytic by its D_L^+ model, and its raising ladder has squared norms `n!(L)_n`. The fixed outer reflection in the two complementary carriers gives the D_L^− embedding; its highest-kernel computation likewise proves multiplicity1. This argument includes L=2 without using unproved termwise E_+ cancellation.

A concrete exact squared norm
for a₀=1, with r=L/2, is

```
N_L² = Γ((1−t)/2)Γ((1+t)/2)
        Γ(r+(1−v)/2)Γ(r+(1+v)/2)Γ(2r−1)
       /[Γ(r+(v−t)/2)Γ(r−(t+v)/2)
         Γ(r+(t+v)/2)Γ(r+(t−v)/2)].
```

Derive it from the positive bilateral coefficient sum using
[Dougall's bilateral formula, DLMF16.4.17](https://dlmf.nist.gov/16.4.E17),
with the explicit substitution
`a=(1−v)/2−r`, `b=(1+v)/2−r`, `c=(1−t)/2`, `d=(1+t)/2`.
The recurrence gives `|a_k|²=(a)_k(b)_k/((c)_k(d)_k)` for every k∈ℤ;
the source condition c+d−a−b>1 is exactly L=2r>1. Substitution into
its gamma quotient gives the displayed r-form, with all arguments positive.
Normalize by N_L in the actual atomic embedding above. The center is +1, so odd L and both D_1 limits
cannot occur. The full M4 dual, the zero-weight spectral calculation and
these extremal-vector kernels exhaust the tensor, not merely its Casimir
support. Construct the measurable principal intertwiners from the zero-weight
Wilson maps and the normalized raising/lowering operators, first on compact
ν-support away from zero and then by density. Include their Hilbert
unitarity and the two signed discrete embeddings as part of M6.C.

### A zero-momentum Lorentz input and a spacelike input

Use M4's full Lorentz labels Λ_(m,iω), m∈ℤ, ω∈ℝ modulo the
proved Weyl equivalence, Λ_s for 0<s<1, and 1. Fix r₀>0 and
every actual spacelike little irreducible τ: the principal families including
the even endpoint, the complementary family, both D_l^σ with l≥1
including both limits, and 1. Work in H_s=C₀SL(2,ℝ)C₀⁻¹ using
M4's signed K circle. The one-point case of M1 gives

```
Z_Λ ⊗ S_(r₀;τ) ≃ Ind_(ℝ⁴⋊H_s)^P (χ_(p_s) ⊗ (Res_(H_s)Λ ⊗ τ)).
```

Use M1's induction/direct-integral comparison with counting measure for
all weight sums and its Fubini unitary for the ν fields; transport M4.P's
measurable fundamental sections by C₀ throughout.
The input spacelike radius stays exactly r₀. This identity is the reduction,
not the requested final refinement. The following fixed rows perform that
refinement in the specified cases. Every ν-integral has class dν on ν>0;
include positive-density square-root transport in the unitary. For e∈{0,½},
use the already fixed T^sp_(r₀,e) field, now at a single fixed radius, and define

```
U_(r₀;σ,e)
 = [∫_(ν>0)^⊕ (S_(r₀;I_(2e,iν)))^∞ dν]
   ⊕ ⊕_(L≥2, L−2e∈2ℤ) (S_(r₀;D_L^σ))^∞,
W_(r₀) = ∫_(ν>0)^⊕ (S_(r₀;I_(0,iν)))^2 dν.
```

Here ∞ means countably infinite multiplicity. There is no r-integral:
the radial measure is the single atom δ_(r₀). No complementary/trivial,
ν=0 or limit-discrete atom is hidden in T^sp, U or W.

**Principal Lorentz input, all spacelike inputs.** Own the actual branching

```
Res_(H_s) Λ_(m,iω)
 ≃ Ind_K^(SL(2,ℝ))χ_m ⊕ Ind_K^(SL(2,ℝ))χ_(−m)
 ≃ [∫_(ν>0)^⊕ (I_(m mod2,iν))^2 dν]
   ⊕ ⊕_(2≤L≤|m|, L≡m mod2) (D_L^+ ⊕ D_L^−).
```

The finite discrete sum is empty for |m|<2. Use the two open half-planes
of ℂP¹ under the real subgroup: their stabilizers are K, and the
associated line characters are χ_m and χ_(−m). The real projective
line has zero principal-model area measure. Normalized induction gives the
invariant half-plane carrier after multiplication by |Im z|^(1+iω)
and the explicit line-bundle frame transport. At z=±i the k_t eigenvalues
on (z,1) are e^(±it), fixing the signs. Transport the subgroup through
C₀. This proves independence from ω at the restriction level, not just
at the level of a compact-type count. Consume M4.P to refine each line.

Write e_τ for τ's physical half-integer center class and put
`e=[m/2+e_τ]`. If τ is principal or complementary, prove

```
Z_(Λ_(m,iω)) ⊗ S_(r₀;τ) ≃ T^sp_(r₀,e)^∞.
```

For τ=D_l^σ, l≥1, put

```
E_L(m,l)=k+1 if k=(|m|−l−L)/2∈ℕ₀, and 0 otherwise.
```

Prove

```
Z_(Λ_(m,iω)) ⊗ S_(r₀;D_l^σ)
 ≃ U_(r₀;σ,[m/2+l/2])
   ⊕ ⊕_(L≥2) (S_(r₀;D_L^(−σ)))^(E_L(m,l)).
```

The last sum is finite and automatically has the correct center parity;
it is empty unless |m|≥l+2. Both input limit series l=1 are included.
For τ=1, prove

```
Z_(Λ_(m,iω)) ⊗ S_(r₀;1)
 ≃ [∫_(ν>0)^⊕ (S_(r₀;I_(m mod2,iν)))^2 dν]
   ⊕ ⊕_(2≤L≤|m|, L≡m mod2)
                         (S_(r₀;D_L^+) ⊕ S_(r₀;D_L^−)).
```

Do not derive these rows by tensoring the irreducible branching table term
by term with an unspecified SL(2,ℝ) tensor product. Apply M1's tensor
identity first:
`(Ind_K χ_(±m))⊗τ ≃ Ind_K(χ_(±m)⊗Res_Kτ)`.
Then use τ's actual signed circle weights and M4.P. Two-sided weights
give (T^sp)^∞. For D_l^σ the two shifted chains have weights
`σ(l+2b)±m`, b∈ℕ₀; counting the opposite D_L^(−σ) condition gives
exactly E_L, while the principal and same-orientation counts are infinite.
A trivial τ gives the two single compact lines.

**Complementary Lorentz restriction.** Own a separate noncompact branching
adapter, not an inference from the SU(2) or Δ restrictions:

```
Res_(H_s) Λ_s
 ≃ [∫_(ν>0)^⊕ (I_(0,iν))^2 dν]
   ⊕ { I_(0,2s−1)  if 1/2<s<1;  0 if 0<s≤1/2 }.
```

There is no atom at s=1/2, ν=0, and no discrete/limit/trivial atom.
Compare [Möllers–Oshima, arXiv:1209.2312v3, Theorem 4.1 and the measure `dm_(σ,μ)` defined before Corollary 3.5](https://arxiv.org/abs/1209.2312v3)
(§3.5, p.26 of arXiv v3),
with source n=2, m=1, σ_source=2s. The degree k=0,1 harmonics
on ℝ¹ give two continuous channels, μ=2k+1; higher harmonics vanish.
Their disconnected orthogonal-group signs restrict to the same even
principal family of the connected double cover. Only k=0 has an atom,
with parameter 2s−1>0. Prove the group-cover/parameter and Hilbert-model
comparisons, the source hypergeometric-transform unitary and its dense-domain
extension, before consuming this adapter. Its density is positive for ν>0;
transport that measure `dm_(σ,μ)` (§3.5, display before Corollary 3.5)
including its atom weight and normalizations. The source's
strict discrete index range excludes an atom at s=1/2.

For τ=1 this immediately gives the complete row

```
Z_(Λ_s) ⊗ S_(r₀;1)
 ≃ W_(r₀) ⊕ { S_(r₀;I_(0,2s−1)) if s>1/2; 0 otherwise }.
```

For a principal τ, with e=e_τ, prove for every 0<s<1

```
Z_(Λ_s) ⊗ S_(r₀;τ) ≃ T^sp_(r₀,e)^∞.
```

For every D_l^σ, l≥1, prove for every 0<s<1

```
Z_(Λ_s) ⊗ S_(r₀;D_l^σ) ≃ U_(r₀;σ,[l/2]).
```

For every complementary τ=I_(0,v), 0<v<1, put γ=2s+v−2 and prove
for all 0<s<1 the complete fixed row

```
Z_(Λ_s) ⊗ S_(r₀;I_(0,v))
 ≃ T^sp_(r₀,0)^∞ ⊕ { S_(r₀;I_(0,γ)) if γ>0; 0 if γ≤0 }.
```

The complementary atom occurs once exactly when 2s+v>2. At equality
there is no extra atom. Consume M6.C above for s>1/2, with t=2s−1;
its entire principal/discrete part is quasi-contained in the regular representation (normally absolutely continuous with respect to the full Plancherel measure, including its discrete atoms) and is absorbed by (T^sp)^∞. For s≤1/2 there is no complementary restriction
atom to tensor. This closes the full zero-Lorentz×spacelike fixed table,
including every threshold and superthreshold sequence; its explicit
branching and unitary adapter proofs remain mandatory.

Own the absorption argument used in these complementary rows. The continuous
part of the restriction is two copies of Ind_K χ_0 by M4.P. Its tensor
with τ is therefore the explicit T/U/W field obtained from Res_Kτ.
For s>1/2 put t=2s−1. A tempered τ has K-finite coefficients in
L^q for every q>2, and I_(0,t) has them in L^p for every
p>2/(1−t). Choose finite p,q with 1/p+1/q>1/2. Prove the dense
L²-coefficient criterion showing their tensor is quasi-contained in the
regular representation; compare [Repka, 1976, §3 Proposition](https://doi.org/10.1090/S0002-9904-1976-14223-1).
Quasi-containment here means normal Plancherel absolute continuity, not
merely Fell weak containment. It excludes extra complementary/trivial,
ν=0 and limit atoms. A separable such field is absorbed by the displayed
infinite principal/discrete field, using its measurable multiplicity spaces.
For D_l^σ also exclude opposite discrete atoms: a highest-weight vector
of D_L^− in I_(0,t)⊗D_l^+ has expansion along weights
`(−L−l−2b,l+2b)`, b≥0. Applying the raising operator at b=0
forces its first coefficient to vanish, since the complementary raising
coefficient never vanishes for 0<t<1. Induction forces all coefficients
to vanish. Use weak derived-action tests against analytic compact-weight
vectors to justify this recursion on the Hilbert carrier; a bounded
intertwiner preserves smooth vectors. Reverse signs for D_l^−. This
works for the input limits too. As an independent cross-check of M6.C, for two complementary inputs with t+v<1 the same L^p criterion applies, since the limiting reciprocal exponents sum
to (2−t−v)/2>1/2; the full (T^sp)^∞ field absorbs the result.

For the trivial Lorentz input, `Z_1⊗S_(r₀;τ)=S_(r₀;τ)` for every τ.
All zero/spacelike tensors have closed translation-PVM support exactly
`{p:q(p)=−r₀²}` with the full fixed-radius spacelike orbit measure.
They have no timelike, null or zero-momentum translation summand. These
translation claims do not compute full Fell support. Output center classes
are [m/2+e_τ] for a principal Lorentz input and e_τ for a complementary
or trivial Lorentz input; descent is exactly center class zero. Tensor flip
supplies reversed ordered factors. Keep all other spacelike-input pairs and
all nontrivial zero-Lorentz×zero-Lorentz pairs in M6's full scope.

### Two spacelike inputs: the complete Gram-stratified table

Fix every a,b>0 and actual M4 SL(2,ℝ) little irreducibles τ₁,τ₂.
The input is `S_(a;τ₁)⊗S_(b;τ₂)`. Write e_i∈{0,½} for their
physical compact-weight center classes and e=[e₁+e₂]. Use the following
exhaustive input types: B denotes any irreducible principal or complementary
representation with two-sided compact weights; D_l^σ has l≥1 and
σ∈{+1,−1}, including both limits l=1; and 1 denotes trivial. The even
principal endpoint belongs to B; resolve the reducible odd principal endpoint
into D_1^+⊕D_1^− first. No unitary boundary constituent or sign is omitted.
The inducing parameters of B affect intertwiners but not the counts below.

Use the preceding fully expanded `T^sp_(r,e)` field and, for r>0, define

```
U^sp_(r;σ,e)
 = [∫_(ν>0)^⊕ (S_(r;I_(2e,iν)))^∞ dν]
   ⊕ ⊕_(L≥2, L−2e∈2ℤ) (S_(r;D_L^σ))^∞,
V^sp_r = ∫_(ν>0)^⊕ (S_(r;I_(0,iν)))^2 dν,
H^sp_r = V^sp_r ⊕ ⊕_(L≥2, L∈2ℤ)(S_(r;D_L^+)⊕S_(r;D_L^−)).
```

Every multiplicity in H's discrete sum is one. All infinite multiplicities
are countable. These are actual principal/discrete fields, with no hidden
complementary, trivial, ν=0 or limit atom. Put d=|a−b|, A=a+b,
and δ=sign(a−b) when a≠b. The inner interval 0<r<d is empty if a=b,
so δ is never used at zero. Prove the full tensor identity

```
S_(a;τ₁)⊗S_(b;τ₂)
 ≃ ⊕_(ε_E∈{+1,−1}) ∫_(M>0)^⊕ ⊕_J (P_(M,J)^ε_E)^(m_J) dM
   ⊕ ∫_(0<r<d)^⊕ X_r^in dr
   ⊕ ∫_(d<r<A)^⊕ X_r^mid dr
   ⊕ ∫_(r>A)^⊕ X_r^out dr.
```

Every spin sum is over J∈½ℕ₀. In the following exhaustive table a spin
count is zero unless J−e∈ℤ; the additional displayed inequalities are
also required. The table specifies both ordered inputs. In a D/1 row let
χ_D=+1 if the D factor is first and χ_D=−1 if it is second.

| Little inputs | m_J on each timelike branch | X_r^in | X_r^mid | X_r^out |
| --- | --- | --- | --- | --- |
| B and 1, either order | 2J+1 | (T^sp_(r,e))^∞ | (T^sp_(r,e))^∞ | (T^sp_(r,e))^∞ |
| B and any nontrivial input, either order | ∞ | (T^sp_(r,e))^∞ | (T^sp_(r,e))^∞ | (T^sp_(r,e))^∞ |
| D_l^σ and 1, either order | J−l/2+1 if J−l/2∈ℕ₀, else0 | U^sp_(r;δχ_Dσ,e) | (T^sp_(r,e))^∞ | U^sp_(r;σ,e) |
| D_(l₁)^σ and D_(l₂)^σ | ∞ | (T^sp_(r,e))^∞ | (T^sp_(r,e))^∞ | U^sp_(r;σ,e) |
| D_(l₁)^σ and D_(l₂)^(−σ) | (k+1)(k+2)/2 if k=J−(l₁+l₂)/2∈ℕ₀, else0 | U^sp_(r;δσ,e) | (T^sp_(r,e))^∞ | (T^sp_(r,e))^∞ |
| 1 and 1 | 1 for J∈ℕ₀, else0 | V^sp_r | H^sp_r | V^sp_r |

Both massive energy branches occur for every M>0 with the same displayed
count. There is no radial atom at r=d or r=A, and no null or
zero-momentum translation summand. The case d=0 retains its entire middle
interval (0,2a); it is not a deleted boundary case. Tensor flip must carry
the table to itself: δ changes sign and χ_D or σ in the opposite-sign
D/D row changes accordingly, preserving the inner discrete orientation.

**Actual Gram strata and common subgroups.** Let s=p₁·p₂ and choose
p₁=(0,0,a,0). Then p_(2,2)=−s/a and
`v=p₂+(s/a²)p₁∈p₁^⊥` has `q(v)=s²/a²−b²`.
Write D=s²−a²b². The sum invariant is `q=−a²−b²+2s`.
Use the actual native Hermitian matrices and M4's C₀ conjugacy to prove:

| Gram stratum | Pair orbits and representatives | Common subgroup |
| --- | --- | --- |
| abs(s)>ab | Two, labelled η=±1: p₂=(0,0,−s/a,η√D/a) | K=Spin(2), with C₀k_tC₀⁻¹=δ(0,2t) |
| abs(s)<ab | One: p₂=(√(a²b²−s²)/a,0,−s/a,0) | MA=C₀{±diag(e^u,e^(−u)):u∈ℝ}C₀⁻¹ |
| s=±ab, v≠0 | Two nonzero-null projection orbits, either time orientation | MN=C₀{±[[1,x],[0,1]]:x∈ℝ}C₀⁻¹ |
| s=±ab, v=0 | The collinear pair p₂=−(s/a²)p₁ | The full H_s=C₀SL(2,ℝ)C₀⁻¹ |

Here M={±I} is retained in every subgroup. There is no center-only
common stabilizer for a base pair of nonzero spacelike vectors; two
independent vectors leave a one-dimensional connected stabilizer, and
collinear vectors leave H_s. The center-only induction used below is an
induction-in-stages refinement of the MA carrier, not a new Gram stratum.
For the hyperbolic row, `C₀diag(1,−1)C₀†=σ_x`; hence its split boosts
fix both the native σ_z and σ_y spacelike directions. For the null row
use v=η(0,−1,0,1), up to positive scale, and verify its rank-one
Hermitian stabilizer as displayed.

For s>ab the compact circle acts on the two input little carriers with
integer weights n₁−n₂; the second input's spatial axis is reversed.
Timelike sums have s>(a²+b²)/2 and energy branch η, giving one pair
orbit per displayed massive branch. Spacelike sums in this positive-s region
have 0<r<d and two pair orbits η=±1. Restoring the positive spatial
sum representative reverses the circle exactly when a<b, so the actual
spacelike compact weights are δ(n₁−n₂). For s<−ab, all sums are
spacelike with r>A, two pair orbits η=±1, and compact weights n₁+n₂.
The middle MA stratum has d<r<A, one pair orbit, and only spacelike
sums. Prove every sign by the π-rotation lift and axial boosts in M4's
actual matrices. The two compact pair orbits contribute a factor2 where
counts are finite; this is the multiplicity2 in V^sp, and must not be
lost by identifying the η labels over a spacelike sum.

Own the circle counts explicitly. B has weights 2e_B+2ℤ once;
D_l^σ has σ(l+2ℕ₀) once; 1 has weight0 once. Use their sum
or difference as just specified. A two-sided chain coupled to a nontrivial
chain has each compatible weight infinitely often. Two same-sign D chains
have a one-sided sum, with multiplicity k+1 at level k, and a two-sided
difference with infinite multiplicities. Opposite-sign D chains exchange
these two cases. SU(2) reciprocity counts physical weights n/2 in [−J,J],
giving the finite arithmetic and triangular counts in the table. M4.P's
signed compact-induction unitary gives U^sp or T^sp, weight by weight.
One-sided input chains are unbounded, so every compatible same-orientation
D_L occurs infinitely often; no finite cutoff in L is introduced.

**M6.A — restriction to the actual split subgroup.** For each M4 irreducible
τ put d_A(τ)=2 for B and d_A(τ)=1 for D_l^±, including l=1.
For every nontrivial τ, prove as a unitary MA representation

```
Res_(MA)τ ≃ (Ind_M^(MA)χ_(e_τ))^(d_A(τ)),
χ_(e_τ)(−I)=exp(2πi e_τ).
```

M6.A itself owns the one-dimensional Riesz/Fourier Hilbert comparison used here. Pin the real big-cell section `g_x=[[x,−1],[1,0]]`. From right covariance derive, for g=[[a,b],[c,d]],

```
(I_(e_par,ν)(g)f)(x)
 = sign(a−cx)^(e_par)|a−cx|^(−1−ν)f((dx−b)/(a−cx)),
I_(e_par,ν)(a_r)f(x)=r^(−1−ν)f(x/r²).
```

For 0<v<1 put `r_v=2Γ(v)cos(πv/2)(2π)^(−v)>0`. With the e^(−2πixξ) Fourier convention, prove the multiplier identity `Fourier(|x|^(−1+v))=r_v|ξ|^(−v)` by damping e^(−ε|x|), the cosine–Gamma integral and convergence in tempered distributions. M6.A owns both completion comparisons: compact-picture smooth cutoffs are dense in the invariant kernel norm, and compact frequency cutoffs away from0 are dense in `L²(ℝ,|ξ|^(−v)dξ)`. Use inverse Fourier Schwartz vectors and position cutoffs to prove onto this weighted space, including the compact-chart tail estimates; a distributional Fourier formula alone is insufficient. For position kernel `C_v|x−y|^(−1+v)`, the exact isometry is `f↦√(C_v r_v)f̂`, not an unspecified normalization of f̂. Prove compatibility with M4's compact norm and the norm-one compact-zero vector below. The principal L² model and the discrete Fourier–Laplace/Hardy completions, including l=1, are also M6.A's actual unitary restrictions, with density and domain comparisons before their use in induction.

Thus its A-character measure is Lebesgue on every ξ∈ℝ; there is no
point character or one-sided frequency omission. Prove the actual transforms:
for a principal noncompact model use the positive/negative x charts,
`g_±(u)=e^(u/2)f(±e^u)`, and the Mellin Fourier convention
`ĝ_M(ζ)=(2π)^(−1/2)∫e^(−iζu)g(u)du`. Each frequency rescaling by2
includes its factor 1/√2. Identify L²(du) with the chosen regular
L²(du/π) carrier by g↦√πg. The action
of a_(e^h) is `e^(−iωh)g_±(u−2h)`; the frequency substitution
ξ=−ω−2ζ removes the parameter and gives two regular A carriers.
For I_(0,v), normalize the compact-zero chart vector
`π^(−1/2)(1+x²)^(−(1+v)/2)` to norm1. Its invariant kernel has
coefficient `C_v=B(v/2,1/2)^(−1)`; compute the intertwiner on this
vector at x=0 to obtain that beta constant. Consume M6.A's owned
one-dimensional completion above, with `F_v=√(C_v r_v)f̂`.
The log coordinates `g_±(u)=e^((1−v)u/2)F_v(±e^u)` turn
its unitary A action into `g_±(u+2h)`. Use the same Mellin/rescaling
and L²(du/π) transports as in the principal row.
For D_l^+, use the Fourier–Laplace model on positive frequencies with
norm `∫_(0<ξ)|φ(ξ)|²ξ^(1−l)dξ`; its action is
`φ(ξ)↦e^((2−l)h)φ(e^(2h)ξ)`.
Then `g(u)=e^((2−l)u/2)φ(e^u)` translates by +2h. The lower
holomorphic/negative-frequency model gives D_l^−. For l>1 the upper
half-plane norm is `2^(l−1)/Γ(l−1)∫|F(x+iy)|²y^(l−2)dxdy`
with `F(z)=(2π)^(−1/2)∫_(0<ξ)e^(iξz)φ(ξ)dξ`; for l=1 use
the Hardy boundary norm. The upper lowest vector
`√(2^lΓ(l)/(2π))(z+i)^(−l)` has norm1 and compact weight+l;
the lower `(z−i)^(−l)` model has weight−l. Compare these actual
unitary models and their norm-one extremal vectors with M4 before consuming them.
The trivial restriction is χ_0 at A-frequency0, not this regular formula.

If at least one input is nontrivial, the tensor of the two MA restrictions
is a positive finite or countably infinite multiple of Ind_M^(MA)χ_e:
when both are nontrivial use (ξ₁,ξ₂)↦(ξ₁+ξ₂,ξ₁), with its non-atomic
Lebesgue multiplicity fiber. Induction in stages gives Ind_M^(SL(2,ℝ))χ_e.
This is the central-character part of the full regular representation.
M4.P's full Plancherel transform gives each compatible principal and discrete
representation with multiplicity dim(H_π)=∞. It therefore gives exactly
(T^sp_(r,e))^∞ in the middle stratum for every such pair, with no
additional complementary, trivial or limit atom. This normal Plancherel
argument is stronger than a weak-containment assertion.

**M6.H — the sole zero-frequency hyperbolic induction needed here.**
For both trivial inputs, prove instead

```
Ind_(MA)^(SL(2,ℝ))1
 ≃ [∫_(ν>0)^⊕ (I_(0,iν))^2 dν]
    ⊕ ⊕_(L≥2, L∈2ℤ)(D_L^+⊕D_L^−).
```

Use the single open ordered-pair orbit of the real projective line and
M1's measurable tensor-product theorem, with the following explicit
open-orbit measure unitary, to identify this carrier with
`I_(0,0)⊗I_(0,0)`. In its noncompact L²(ℝ²,dxdy) picture the explicit
unitary is `f(x,y)↦|x−y|f(x,y)` into the invariant quotient measure
`dxdy/(x−y)²`; the diagonal is null. The normalized parabolic modular
factors cancel on MA, so the inducing character is exactly trivial.
Both factors are M4's irreducible even principal endpoint, rather than
complementary representations at an unspecified boundary.
Extend M6.C's actual Wilson argument to this explicit endpoint: α₀(n)>0
for even n, and the even/odd zero-weight channels have Wilson parameters
(1/4,1/4,1/4,1/4) and (3/4,3/4,3/4,3/4), respectively.
They are strictly positive, so there is no residue atom. Their exact
cyclic densities are M6.C's gamma formula with these two parameter tuples,
ν=4x and H₀=π³, π³/128 respectively. The nonnegative-Casimir moment
comparison and signed extremal-vector argument prove completeness and the
multiplicity-one discrete list, including absence of ν=0/limit/trivial
atoms. This endpoint extension is proved explicitly; M6.C's open
complementary parameter range alone does not imply it. Thus the middle
trivial/trivial field is exactly H^sp, while compact reciprocity gives
V^sp in the two outer intervals.

**Orbit measures, exceptional sets and PVM support.** Fix the input orbit
measures `μ_a=δ(q(p)+a²)d⁴p`, `μ_b=δ(q(p)+b²)d⁴p` in the native
coordinates. Choose K Haar probability, the H_s/K measure
`d²u/(2|u₃|)` on each unit timelike 2+1 shell, and compatible H_s
Haar. Give MA its compatible Haar measure making H_s/MA the unit
spacelike measure `δ(q_(2,1)(u)+1)d³u`; with u=log r and M Haar
probability this is `du/π` on A. Choose H/H_s Haar quotient to be μ_1
on the unit spacelike orbit, where H=SL(2,ℂ). These choices fix the
reference Haar. The input μ_a is a² times that fixed H/H_s quotient.

Here H/H_s is the unit quotient μ_1, so the shared preceding **Orbit measures for the spacelike×massive and spacelike×null rows** comparison specializes at reference radius r₀=1: the compatible H/SU(2) quotient is the unit-scaled timelike measure and SU(2)/K has total mass2π, while the output H_s/K retains its stated unit measure. This is a reference-Haar specialization, not a replacement of the physical input radius a by1. The physical input factor μ_a=a²μ_1 remains explicit and cancels the a^(−2) conditional factor below. Equivalently using the physical-input Haar a²dh would put mass2πa² on SU(2)/K and divide the outer pair density by a²; the same product measure results. Thus no additional a² is inserted into the displayed table.

Disintegrate the second input at p_(2,2)=−s/a. Its projected 2+1
shell has scale √|D|/a, so its conditional density is
`√|D| ds/a²` times the relevant unit H_s/J quotient, separately on each
η branch when D>0. Multiplication by the first input's a² factor gives
exactly

```
√|s²−a²b²| ds × dμ_(H/J)
```

on each generic pair orbit. This is symmetric in a,b. Equivalently the
q-density is `¼√|(q+A²)(q+d²)|dq`; its radial versions are

```
½ M√[(M²+A²)(M²+d²)] dM,
½ r√|(A²−r²)(d²−r²)| dr.
```

There is one copy on each middle pair orbit and on each of the two elliptic η orbits. These positive densities are equivalent to the displayed dM/dr on the open ranges. Their sum-orbit factors are `μ_(t,M)/M²` and `μ_(s,r)/r²`; the compact little quotient has mass2π and the hyperbolic quotient has its fixed unit measure just specified. Relative to the physical output carriers, the radial densities are exactly

```
[√((M²+A²)(M²+d²))/(2M)]dM,
[√|(A²−r²)(d²−r²)|/(2r)]dr.
```

These are parameter-dependent M^(−2)/r^(−2) changes of orbit carrier, with their positive square-root transports. They are separate from a fixed Haar scalar such as the compact mass2π. If the compact little carrier is converted to sphere probability, include f↦√(2π)f there, without multiplying the outer density by2π again. Consume the shared Wilson measure comparison for every change of quotient order. The formulas are a pair-orbit disintegration; they do not assert local finiteness of the naive pushforward of an infinite product measure.

Prove the exceptional sets are null independently of their displayed
vanishing density. For fixed p₁, s=±ab cuts the smooth three-dimensional
spacelike orbit by the coordinate level p_(2,2)=∓b. Away from v=0
this is a regular codimension-one submanifold; v=0 adds only the collinear
point. Both are null for the smooth orbit measure. Apply σ-finite Fubini.
The nonzero-null total q=0 also has quotient measure zero: it lies in a
single generic s-level for a≠b, and in the just-proved degenerate stratum
for a=b. Zero total occurs only for a=b and p₂=−p₁, already null.
Internal separable little-carrier multiplicities do not turn a null base
set into a direct summand.

Every timelike mass and both orientations occur, and the three spacelike
ranges exhaust all r>0 up to their non-atomic boundaries. The closed joint
translation-PVM support is therefore all of ℝ⁴. Nonzero null sums of both
orientations occur even though they have no atom. When a≠b, zero is a
limit of sums rather than an actual sum; it still belongs to closed support.
Keep this support assertion distinct from irreducible direct-integral atoms
and a full Fell weak-support classification. The tensor descends through
the covering center exactly when e=0; retain both center sectors otherwise.

**Identical spacelike inputs: exact exchange sectors.**

These exchange sectors are derived from the ordered table and the literal
completed flip. *Needs:* P.6, M6.MeasuredPair, M6.H's Wilson transform and
M4.P's compact-line density. The Wilson-polynomial recurrence/measure ingredient is
Groenevelt, §2 equations (2.1)–(2.3) (arXiv:math/0306424v1); the exchange eigenspaces and the mod-four
selection below are additional conclusions of the ordered-pair calculation.



Fix a>0 and every actual irreducible M4 little representation τ. Write
η_τ=τ(−I)∈{+1,−1}, and let s_X∈{+1,−1} denote the eigenvalue of
Layer P.6's completed tensor flip Σ; s_X=+1 gives Sym² and s_X=−1 gives Λ².
This s_X is an exchange sign, distinct from energy orientation ε_E and
from the ordered table’s discrete chirality σ (written ζ here). Both exchange sectors have covering center+1,
so their massive spins J are nonnegative integers.

Define the following middle fields, with every displayed discrete
multiplicity one:

```
H^(+)_r = [∫_(ν>0)^⊕ S_(r;I_(0,iν)) dν]
          ⊕ ⊕_(L≥4, L≡0 mod4)(S_(r;D_L^+)⊕S_(r;D_L^−)),
H^(−)_r = [∫_(ν>0)^⊕ S_(r;I_(0,iν)) dν]
          ⊕ ⊕_(L≥2, L≡2 mod4)(S_(r;D_L^+)⊕S_(r;D_L^−)),
V^(1)_r = ∫_(ν>0)^⊕ S_(r;I_(0,iν)) dν.
```

The principal measures in H^(+) and H^(−) are the positive cyclic
Wilson densities ρ₀ and ρ₁ of M6.H respectively, transported to the
written dν class by their positive square-root unitaries. V^(1) uses
M4.P's spherical compact-induction density and its same measure-class
transport. Do not equate these different positive densities without
that unitary. For nontrivial τ put

```
b_J^s_X(τ) = ∞       if J≥1,
          ∞       if J=0 and s_X=η_τ,
          0       if J=0 and s_X≠η_τ.
```

All ∞ multiplicities are countable. With the same radial measures and
physical/output-carrier transports as the ordered identical-input table,
compute

```
(S_(a;τ) ⊗ S_(a;τ))_(Σ=s_X)
 ≃ ⊕_(ε_E=±1) ∫_(M>0)^⊕ ⊕_(J∈ℕ₀)
       (P_(M,J)^ε_E)^(m_J^s_X) dM
   ⊕ ∫_(0<r<2a)^⊕ Y_r^s_X dr
   ⊕ ∫_(r>2a)^⊕ Z_r^s_X dr.
```

| Identical little input τ | m_J^s_X | Y_r^s_X, 0<r<2a | Z_r^s_X, r>2a |
| --- | --- | --- | --- |
| Every irreducible principal/complementary B | b_J^s_X(τ) | (T^sp_(r,0))^∞ | (T^sp_(r,0))^∞ |
| Every D_l^ζ, l≥1, ζ=±1, including both limits | b_J^s_X(τ) | (T^sp_(r,0))^∞ | U^sp_(r;ζ,0) |
| 1 | 1 if (−1)^J=s_X, else0 | H^(s_X)_r | V^(1)_r |

Here T^sp and U^sp are the already fully expanded ordered-table fields;
there is no complementary, trivial, principal-frequency0 or limit atom
in these refinements. The odd principal endpoint is resolved as
D_1^+⊕D_1^− before applying this irreducible table. If its entire reducible
Hilbert carrier is desired, use
Sym²(A⊕B)=Sym²A⊕(A⊗B)⊕Sym²B and
Λ²(A⊕B)=Λ²A⊕(A⊗B)⊕Λ²B with the existing opposite-chirality
ordered A⊗B table. No endpoint constituent is deleted.

Prove the table by the following actual normalizer and fiber actions,
not by declaring the unknown answer to be TΣT*. In the massive rest
frame write p₁=(0,0,k,ε_E M/2), p₂=(0,0,−k,ε_E M/2),
k=√(a²+M²/4). Put b_h=diag(e^(h/2),e^(−h/2)) with
sinh h=ε_E M/(2a), and u=J_alt=[[0,1],[−1,0]]. Choose the two
input frames h₁=b_h and h₂=ub_h. Then uh₁=h₂, uh₂=zh₁, z=−I,
and the common circle acts by τ(k_t)⊗τ(k_t^(−1)) after M4's fixed
C₀ conjugacy. In the actual induced SU(2)/K model the flip is

```
(Σf)(g)=η_τ Π f(gu),
```

where Π swaps the two input fibers. This is a unitary involution and
commutes with left SU(2). In spin J's reciprocity multiplicity basis
(n₁,n₂), m=(n₁−n₂)/2, |m|≤J, it is

```
(n₁,n₂) ↦ η_τ (−1)^(J+m) (n₂,n₁).
```

Use the actual SU(2) polynomial basis, in which
u v_m=(−1)^(J+m)v_(−m), to fix this sign. At J=0 only diagonal
pairs occur and every such pair has eigenvalue η_τ. For every J≥1,
each nontrivial chain has infinitely many adjacent weight pairs; each
pair with m=±1 supplies one vector of each exchange sign. This proves
b_J^s_X. For τ=1 only m=0 remains, giving (−1)^J on the one copy.
The signed rapidity h proves the same conclusion on both energy branches.

For the middle range put P=(0,0,r,0),
p₁=(c/2,0,r/2,0), p₂=(−c/2,0,r/2,0), c=√(4a²−r²).
The actual swapping element is w_X=C₀ k_(π/2) C₀⁻¹=diag(i,−i)
in H_s; w_X²=z. The common subgroup is MA, and w_X inverts A.
Take h₁ to be the spatial rotation about the native e₁ axis sending
(0,0,a,0) to p₁, and h₂=w_Xh₁. Its axis makes h₁ commute with
the common split subgroup; consequently its two input transports are
a_u and a_u^(−1). Thus the ordered coefficient is
ρ_A(a_u)=τ(a_u)⊗τ(a_u^(−1)), and the actual flip is
η_τ ΠR_(w_X). If N=MA∪w_XMA, its s_X eigenspace is exactly

```
Ind_N^(H_s) ρ_s_X,
ρ_s_X|_(MA)=ρ_A,   ρ_s_X(w_X)=s_X η_τ Π.
```

Give N/MA its two-point probability measure and H_s/N the pushforward
of the fixed H_s/MA measure; with this compatible Weil convention the
identity from s_X-equivariant sections to Ind_N sections is isometric.
Verify all relations, including w_X²=z, center action+1 and
w_X a_u w_X^(−1)=a_(−u). For nontrivial τ use M6.A's actual unitary
MA restriction, with finite multiplicity d_A=2 for B and 1 for D.
In its two Fourier–Mellin variables put
x=ξ₁−ξ₂, y=(ξ₁+ξ₂)/2, whose Jacobian has absolute value1.
A multiplies by exp(iux), and w_X acts by
s_X η_τ f(−x,y,j,i). The set x=0 is null. A unitary gauge on x<0
removes the constant involution s_X η_τ times the swap of finite
multiplicity indices. The remaining y carrier is infinite dimensional;
choose a fixed Hermite basis to identify it with ℂ²⊗ℓ² and obtain
explicitly

```
ρ_s_X ≃ (Ind_M^N 1)^∞.
```

The regular N/M carrier's two finite components and its reflected
Fourier coordinate give this equivalence. Use the inherited A Haar and
two-point probability; converting its two value coordinates to standard
orthonormal ℂ² divides them by √2. The fixed Hermite-basis absorption
then gives an actual unitary. Retain the √2 coordinate factors when
absorbing the finite components into the infinite y multiplicity.
Induction in stages then gives (Ind_M^(H_s)1)^∞, and M4.P gives
exactly (T^sp_(r,0))^∞ for each s_X. This fixes both counts by actual
normalizer geometry, rather than an unspecified exchange operator.
For τ=1, N acts by its two reflection characters; identify the quotient
with M6.H's ordered projective-line pair. Right w_X is endpoint swap,
and the unitary f(x,y)↦|x−y|f(x,y) commutes with it. Hence the
zero-weight even Wilson channel is symmetric and the odd channel is
antisymmetric, each with one principal component. In the actual
D_L^+ lowest vector, L=2r_L≥2, the endpoint lowering recurrence is

```
a_(k+1)=−|2r_L−2k−1| a_k/|2k+1|.
```

Reflection k↦r_L−k has eigenvalue (−1)^r_L: for even r_L evaluate
at its fixed integer; for odd r_L evaluate the two adjacent central
indices, whose ratio is−1. No coefficient vanishes. Raising commutes
with Σ and the closed extremal-kernel embedding is M6.H's, so this
sign holds on the entire D_L^+ constituent. The commuting conjugation
that gives D_L^− gives the same sign there. This proves H^(s_X), not
only its principal part, and excludes a spurious residue atom.

In the outer range use P=(0,0,r,0) and
p₁=(P+w_(rel,η))/2, p₂=(P−w_(rel,η))/2,
w_(rel,η)=(0,0,0,η√(r²−4a²)). The two timelike orientations η of the
relative vector are distinct pair orbits and are exchanged by Σ.
Choose the minus-branch input frames to be the plus-branch frames
in opposite order. The exact action on their induced fibers is
(F₊,F₋)↦(ΠF₋,ΠF₊). Each s_X eigenspace is isometric to one whole
ordered orbit through F↦(F,s_XΠF)/√2. The common K weights on that
orbit are n₁+n₂. The ordered compact reciprocity counts give precisely
the outer column above: one principal field for τ=1, unchanged infinite
principal/discrete counts for B, and unchanged one-chirality infinite
counts for D. This is why halving the ordered multiplicity2 matters
only in the finite trivial row.

These are restrictions of the same physical pair-orbit measures, not
new Haar conventions. Each paired-orbit eigenspace uses its explicit
1/√2 unitary and one orbit's radial density, with no extra factor2 or
1/2. The empty inner interval, all r=0,2a and M=0 non-atomic boundaries,
all source little representations and all physical measure comparisons
remain as in the ordered table. Both exchange sectors still have full
closed translation-PVM support ℝ⁴. This is a named proof target using
the existing M1/M4.P/M6.A/M6.H analytic suppliers, not a claim that
their native implementations have been completed.

### Two zero-momentum Lorentz factors: the fixed SL(2,ℂ) tensor table

Use M4's genuine connected Lorentz models on separable complex Hilbert
spaces. Write `P_(m,ω)=Λ_(m,iω)`, m∈ℤ, ω∈ℝ, with
`(m,ω)∼(−m,−ω)`; write `C_s=Λ_s`, 0<s<1, and 1 for the
trivial representation. Include every principal frequency0 input,
in particular P_(0,0), which is not the trivial representation.
For a unique full input label set one may take ω>0 with all m,
together with ω=0,m≥0. Do not use a reducible boundary smooth
induced module as an irreducible input: at s=1 use individually its trivial Hilbert quotient and the
separately metrized zero-integral submodule P_(2,0), without
asserting that the whole boundary smooth module is a unitary
direct sum. At s=0 the model is P_(0,0).

For d∈{0,1} fix the completely specified multiplicity-one output

```
R_d = ⊕_(n∈d+2ℤ) ∫_(ν>0)^⊕ Z_(P_(n,ν)) dμ_n(ν),
dμ_n(ν) = (n²/4+ν²)/(4π⁴) dν.
```

The ν>0 choice removes Weyl duplication; each μ_n has Lebesgue
class there. The omitted frequency0 labels are in the closure
of this parameter set and carry no atom in R_d. Prove all ordered
pairs by the following table and the completed Hilbert tensor flip:

| First Lorentz factor | Second Lorentz factor | Zero-momentum output |
| --- | --- | --- |
| 1 | any Λ | Z_Λ |
| any Λ | 1 | Z_Λ |
| P_(m,ω) | P_(m′,ω′) | R_((m+m′) mod2) |
| P_(m,ω) | C_s | R_(m mod2) |
| C_s | P_(m,ω) | R_(m mod2) |
| C_s | C_t, s+t≤1 | R_0 |
| C_s | C_t, s+t>1 | R_0 ⊕ Z_(C_(s+t−1)) |

Every principal component listed in R_d has multiplicity1; the
single complementary atom, when present, also has multiplicity1.
There are no other complementary or trivial atoms, and no extra
principal frequency0 atom in any nontrivial×nontrivial row.
The threshold is strict: s+t=1 does not add P_(0,0).
A trivial input instead leaves its partner as a single
representation, including a frequency0 principal or a complementary
one. All outputs have exactly zero translation momentum; this is
a Lorentz tensor theorem, not a momentum-orbit disintegration.
The covering-center value is (−1)^d on R_d and +1 on the
complementary atom. Ordinary connected-group descent means
total central sign+1; odd input central signs are retained for
the covered and ordinary projective sectors.

Own the following normalized complex Clebsch–Gordan transform
here as a named analytic supplier, rather than replacing this
fixed table by an unspecified spectral decomposition. Use the
completion of the native algebraic Hilbert tensor product from
VonNeumannAlgebras and the actual native `Lp`/V4.0.Fields direct-integral
carriers. The output R_d can be realized as
`L²({n∈d+2ℤ}×(0,∞)×ℂ, μ_d⊗d²z)`, where
`μ_d=Σ_(n∈d+2ℤ)δ_n⊗μ_n`, using counting measure in n
and the displayed density in ν, and M4's principal action in
each ℂ fiber. Construct the unitary as a complex
`LinearIsometryEquiv` intertwining the native
`ContRepresentation` actions, with
`ContRepresentation.IsUnitary` and strong orbit
continuity, not a predicate promising an unnamed transform.

Fix `d²z=dx dy` and
`f̂(ξ)=∫exp(−2πi Re(conj ξ z))f(z)d²z`.
For C_s choose the Riesz normalization

```
C_s^norm = π^(2s−1) Γ(1−s)/Γ(s),
‖f‖_s² = ∫|f̂(ξ)|² |ξ|^(−2s)d²ξ.
```

Thus its position kernel is
`C_s^norm |z−w|^(−2+2s)`; consume M4.Riesz’s dense-domain
and completion comparison with this explicit positive normalization. Other positive
kernel constants are transported by the explicit scalar
square-root unitary.

Pin the full noncompact-picture dictionary before importing a
kernel. For `g=[[a,b],[c,d]]`, derive from M4's right covariance

```
(P_(m,ω)(g)f)(z)
 = |a−cz|^(−2−2iω)
   ((a−cz)/|a−cz|)^(−m) f((dz−b)/(a−cz)).
```

In the complex-power pair notation `[z]^A=z^A₊ conj(z)^A₋`,
where A₊−A₋∈ℤ and the two exponents are not complex conjugates,
put `A(m,ω)=(−m/2−iω,m/2−iω)` and
`A(C_s)=(−s,−s)`.
M4's action is precisely the source action T_A precomposed with
`g↦(g⁻¹)ᵀ=J_alt g J_alt⁻¹`. Verify this dictionary also against
the fixed null rotation restriction, not only the spherical
m=0 action. On compact smooth tests define

```
W_(A₁,A₂,A₃)(z₁,z₂,z₃)
 = [z₂−z₁]^(−(1+A₁+A₂+A₃)/2)
   [z₃−z₁]^(−(1+A₁−A₂−A₃)/2)
   [z₂−z₃]^(−(1−A₁+A₂−A₃)/2),
(P_(A₁,A₂|A₃)F)(z₃)
 = ∫_(ℂ²) W_(A₁,A₂,A₃)(z₁,z₂,z₃)F(z₁,z₂)d²z₁d²z₂.
```

Here 1 means the pair (1,1). Prove single-valuedness exactly for
the displayed total center parity, covariance, local integrability
on the stated unitary parameter ranges and the needed continuous
extension from tests. For both principal inputs put q₁₂(n,ν)=1.
For one complementary input C_s and principal input P_(m,ω), put

```
q₁₂(n,ν)
 = π^(−2s) |
     Γ((1+s+|m+n|/2+i(ω+ν))/2) /
     Γ((1−s+|m+n|/2+i(ω+ν))/2)
   |².
```

For two complementary inputs, S=s+t, put

```
q₁₂(n,ν)
 = π^(−2S) |
     Γ((1+S+|n|/2+iν)/2) /
     Γ((1−S+|n|/2+iν)/2)
   |².
```

These are finite and strictly positive on ν>0 in their allowed
parity classes.

For continuation use meromorphic four-gamma products, not absolute-value notation. Put

```
q_mer(z,k,w)=π^(−2z)
 Γ((1+z+k+iw)/2)Γ((1+z+k−iw)/2)
 /[Γ((1−z+k+iw)/2)Γ((1−z+k−iw)/2)].
```

The mixed coefficient is `q_mer(s,|m+n|/2,ω+ν)` and the double-complementary coefficient is `q_mer(s+t,|n|/2,ν)`. On their real unitary ranges these equal the positive q₁₂ displayed above. Continue s,t and the frequency variables within each fixed integer sector by these products. For z purely imaginary and k,w real, q_mer is a unit-modulus phase, generally not1.

Pin the identity to be continued on dense smooth tests. Let `R_z=Fourier⁻¹|ξ|^(−2z)Fourier`. For 0<z<1 consume
M4.Riesz's positive completed Fourier carrier. For general complex z
consume instead M4.Angular's meromorphic S′ family, with m=0 and λ=−z:
its convolution kernel is γ_(0,−z)T_(0,−z)=c_z|·|^(−2+2z),
c_z=π^(2z−1)Γ(1−z)/Γ(z). At poles use its specified finite parts and
local terms. On the Fourier-cutoff core away from0, R_(−z) is its inverse;
prove the required meromorphic/domain extension through M4.Angular,
rather than treating a nonintegrable inverse kernel as an ordinary integral.
In particular R_u⁻¹=R_(−u) uses γ_(0,u)T_(0,u), 0<u<1.
R_z intertwines the input with parameter A=(-z,-z) to A=(z,z). Write P_(s,t|A) for P with input parameters (-s,-s),(-t,-t), and let `B_(s,t)(F,G)=∫_(ℂ²)F·(R_s⊗R_t)G` be complex bilinear, without conjugating parameters. The continued completeness identity, with the contour/residue prescription below, is

```
B_(s,t)(F,G)
 = Σ_(n∈2ℤ) ∫_(ν>0) [dμ_n(ν)/q_mer(s+t,|n|/2,ν)]
      ∫_ℂ (P_(s,t|A(n,ν))F)(z)
            (P_(s,t|−A(n,ν))G)(z)d²z
   + the crossing-residue bilinear form.
```

For a mixed input B=A(m,ω), use `B_s^mix(F,G)=∫F·(R_s⊗1)G`, with F in the (s,B) test carrier and G in the (s,−B) test carrier, and replace the two P terms by P_(s,B|A)F and P_(s,−B|−A)G; its denominator is q_mer(s,|m+n|/2,ω+ν). On the imaginary s,t starting lines these identities include the actual unitary input Weyl maps R_s,R_t, not the L² identity operator. Obtain them from the principal bilinear completeness formula by inserting those maps and proving the star-triangle conversions

```
P_(−s,−t|−A)(R_s⊗R_t)=q_mer(s+t,|n|/2,ν)^(−1)P_(s,t|−A),
P_(−s,−B|−A)(R_s⊗1)=q_mer(s,|m+n|/2,ω+ν)^(−1)P_(s,−B|−A),
```

with every complex-power orientation phase in the fixed W convention.
Pin the oriented complex star-triangle identity used for these conversions.
For exponent pairs α,β,γ with integer angular differences, put
𝔞(α)=Γ(1−α₋)/Γ(α₊) and require α+β+γ=(2,2). With 1=(1,1),

```
∫_ℂ d²w / ([z₁−w]^α [z₂−w]^β [z₃−w]^γ)
 = π 𝔞(α)𝔞(β)𝔞(γ)
   [z₂−z₁]^(γ−1)[z₁−z₃]^(β−1)[z₃−z₂]^(α−1).
```

This is the orientation of [Derkachov–Spiridonov, Eq.51, with Eq.49](https://arxiv.org/html/1711.07073).
First prove it for distinct external points in its convergence domain
Reα₊+Reα₋<2, and the analogous inequalities for β,γ, with the
uniqueness condition; then continue meromorphically with the same
branch/local-term prescription. Reversing any difference contributes
(−1)^(α₊−α₋), or its corresponding exponent; it is not discarded.
For the mixed conversion, the actual W convolution has
α=(1+s−B−A)/2, β=(1+s+B+A)/2, γ=1−s.
Reorienting its output into W contributes (−1)^k, k=(m+n)/2∈ℤ.
Its coefficient is c_sπ(−1)^k𝔞(α)𝔞(β)𝔞(γ).
For k≥0 put x=(1−s−k+i(ω+ν))/2 and
y=(1+s−k−i(ω+ν))/2. Then x+y=1−k and Gamma reflection gives
Γ(x)/Γ(y)=(−1)^kΓ(x+k)/Γ(y+k); the two signs cancel.
The k<0 computation exchanges the two components and gives |k|.
This proves the displayed q_mer(s,|k|,ω+ν)^(−1) coefficient.
For the double conversion, the two scalar steps give the inverse of
q_mer(s,|n|/2,ν+it)q_mer(t,|n|/2,ν−is).
Their four-Gamma products telescope exactly to q_mer(s+t,|n|/2,ν);
the two input-order reversals have cancelling integer phases.
These are identities of the specified meromorphic operators on their
common test domains, with the convergence/regularization proof retained.
At positive real complementary parameters set G=conj(F), in the respective dual principal carrier for the mixed case; the bilinear left side is precisely the input Riesz norm. This specifies the continuation problem and does not continue an unweighted principal L² norm with q set to1. Prove the Gram coefficient by applying the inverse
Riesz operators to the input adjoint kernel and evaluating the
complex beta/star-triangle identities, including the integer
orientation phases. Define the continuous transform as
`T F(n,ν)=q₁₂(n,ν)^(−1/2)P_(A₁,A₂|A(n,ν))F`
into the displayed μ field. [Derkachov–Spiridonov,
equations17,22,28–30](https://arxiv.org/html/1711.07073#S3) supplies
comparison formulas for principal inputs only. The complex Clebsch–Gordan
supplier defined here owns
their proof in the fixed conventions, including both principal identities
TT*=T*T=Id; the reference does not import a native proof or establish
the complementary Hilbert continuation.
Prove the Weyl folding of their full-frequency formula, including
its second delta term, rather than interpreting that redundancy
as multiplicity2. Prove the q-normalized Weyl comparison also
for the complementary input ranges.

For S>1 set u=S−1 and fix

```
K(s,t)=π Γ(1−s)Γ(1−t)Γ(u) /
           (Γ(s)Γ(t)Γ(1−u)).
```

In the normalized Fourier carriers define the atom isometry J by
`(Jv)^̂(ξ,η)=K(s,t)^(−1/2)v̂(ξ+η)`.
Prove that it belongs to the completed tensor carrier, using
`∫|ξ|^(−2s)|ζ−ξ|^(−2t)d²ξ
  =K(s,t)|ζ|^(−2u)`.
Its adjoint is the explicit coisometry

```
(QF)^̂(ζ)=K(s,t)^(−1/2)|ζ|^(2u)
         ∫|ξ|^(−2s)|ζ−ξ|^(−2t)F̂(ξ,ζ−ξ)d²ξ.
```

Prove QJ=Id and covariance, first on dense domains and then by
continuity; J is a diagonal distributional embedding, not point
evaluation on an L² class. For S≤1 this convolution integral
diverges at infinity (logarithmically at S=1); this alone excludes
only that bounded diagonal embedding, so still prove completeness
and absence of every other atom.

Make the sole residue operator explicit. For u=s+t−1>0 let `c_z=π^(2z−1)Γ(1−z)/Γ(z)`, `D F(z)=F(z,z)` on smooth kernels, and `P_−=P_(A(C_s),A(C_t)|A(C_u))`, `P_+=P_(A(C_s),A(C_t)|(u,u))`. Prove as meromorphic distribution identities, then on their Hilbert dense domains,

```
R_u^(−1)D(R_s⊗R_t)=P_−,       Q=K(s,t)^(−1/2)P_−,
P_+=K(s,t)^(−1)(|·|^(−2+2u)*P_−)
   =(c_s c_t)^(−1)R_u P_−,     c_s c_t=K(s,t)c_u.
```

First prove `|·|^(−2+2u)*P_−=K(s,t)P_+` by the scalar star-triangle with exponents (1−u,t,s), all strictly between0 and1 and summing to2; this gives an absolutely convergent entry route on compact smooth tests. Multiply by c_u and use c_s c_t=Kc_u to obtain R_u P_−=D(R_s⊗R_t), then apply M4.Angular’s normalized inverse Riesz distribution R_(−u). Equivalently, for the first displayed identity the inverse scalar star-triangle exponents are (1+u,1−s,1−t); their sum is2. Its coefficient `πΓ(−u)Γ(s)Γ(t)/[Γ(1+u)Γ(1−s)Γ(1−t)]` times c_(−u)c_s c_t is exactly1. The second follows by expanding W at output pair (u,u), where its z₂−z₁ exponent is0. These fix the operator constants independently of a formal PP* assertion. The crossed density has `2πi Res_(ν=−iu)[ν²/(4π⁴q_mer(s+t,0,ν))]=c_u`, with the contour orientation fixed accordingly. For the single C_u carrier define the complex bilinear form
`B_u(f,g)=∫_ℂ f(z)(R_u g)(z)d²z`, first on the common test domain
and then by its positive Riesz completion; it is distinct from B_s^mix.
Its bilinear kernel contribution is therefore

```
c_u ∫(P_−F)(P_+G)d²z
 = K(s,t)^(−1)∫(P_−F)R_u(P_−G)d²z
 = B_u(QF,QG).
```

Thus its Hilbert operator is exactly JQ. The distribution D is not asserted bounded on an arbitrary L² carrier; the already specified Fourier Q gives the bounded completed extension. This derivation still requires the owned distribution regularization and contour theorem to justify moving the contour and taking the residue.

Own the minimal analytic theorem `T*T=Id` off the complementary-atom row and `T*T=Id−JQ` in that row, with Q=J* and QJ=Id as above, together with onto R_d. Then T, or (T,Q) when S>1, is the required unitary. TT*=Id follows from onto and the partial-isometry identity. TJ=0 and QT*=0 are adjoint corollaries of T*T=Id−JQ and QJ=Id, not additional independent obligations.

For the onto step, R_d has pairwise inequivalent irreducible fibers on ν>0 with multiplicity1; use the actual type-I/measurable-field commutant comparison to identify its bounded commutant with L∞(μ_d). The isometry, or the partial isometry on kerQ, has closed invariant range, so its range projection is multiplication by 1_E for a measurable set E. Prove that the distributional kernel P_(A₁,A₂|A(n,ν)) is nonzero for almost every fiber, by choosing smooth tests supported away from its collision sets where W is nonzero. A countable dense test family makes this a measurable conull assertion. If E's complement had positive measure, every such fiber transform would vanish there, a contradiction. Hence E is conull and T is onto. The contour/completeness proof must first give bounded extension and the stated initial projection, so nonvanishing is not being used to assume surjectivity.

Own the parameter-continuation/contour and distribution estimates proving the bilinear completeness identity above, initially on collision-avoiding smooth tests, with a common regularization and its removal in the appropriate distribution topology. Unfold the ν>0 field to the full Weyl contour with its factor1/2 and its normalized output Weyl operator, move the contour with uniform strip/Stirling bounds and local collision estimates, compute every crossing, and fold back without doubling multiplicity. Prove the resulting positive norm identity, dense-domain extension and measurable field comparisons, including principal frequency0, the limit s=0 and the exact S=1 threshold. In the double-complementary continuation possible crossings are `S=1+|n|/2+2r`, r∈ℕ₀; n even and S<2 leave only n=0,r=0. Mixed poles do not cross for 0<s<1. Use the explicit residue operator above, not just atom existence. At S=1,n=0 the raw continuous density is dν/π²; prove the endpoint limit with no extra point mass. A formal meromorphic intertwiner alone does not prove this Hilbert theorem. Construct Borel fields and measurable fundamental sections and use type-I uniqueness for the stated measures and multiplicities. These remain named analytic targets, distinct from an established native proof.

**Identical zero-translation Lorentz inputs: exact exchange sectors.**

For each identical pair below consume Layer P.6's completed tensor flip Σ and
orthogonal projectors `(Id+Σ)/2`, `(Id−Σ)/2`, defining Sym² and Λ² of
the actual Hilbert representation. Put

```
R_[a;4] = ⊕_(n∈a+4ℤ) ∫_(ν>0)^⊕ Z_(P_(n,ν)) dμ_n(ν),
```

with the same μ_n and output principal models as above. These formulas
use the integer parameter a modulo4, not a change of Haar normalization.
Compute the full symmetric and antisymmetric decompositions:

| Identical input Z_Λ | Sym²(Z_Λ) | Λ²(Z_Λ) |
| --- | --- | --- |
| Λ=P_(m,ω) | R_[2m;4] | R_[2m+2;4] |
| Λ=C_s, 0<s≤1/2 | R_[0;4] | R_[2;4] |
| Λ=C_s, 1/2<s<1 | R_[0;4] ⊕ Z_(C_(2s−1)) | R_[2;4] |
| Λ=1 | Z_1 | 0 |

Every displayed continuous component and the sole complementary atom
has multiplicity1. No frequency0 point atom is introduced at s=1/2.
Here 0 is the zero Hilbert representation. Both sectors have covering
center+1; retain the two possible input-center signs in the principal
row through 2m modulo4.

Prove the exchange formula in the fixed complex Clebsch–Gordan gauge,
rather than inferring sectors from the ordered multiplicities. If A is
the common input parameter and A₃=A(n,ν), write
`α=−(1+2A+A₃)/2`, `β=−(1−A₃)/2`. The kernel is
`[z₂−z₁]^α[z₃−z₁]^β[z₂−z₃]^β`. Swapping z₁,z₂ reverses
all three differences after commuting the last two scalar factors.
For an integer angular degree write ΔB=B₊−B₋, and prove
`[−z]^B=(−1)^(ΔB)[z]^B`. The total exchange exponent is

```
Δα+2Δβ = −ΔA+ΔA₃/2
          = m−n/2       for A=A(m,ω),
          = −n/2        for A=A(C_s).
```

The identical-input output parity is n∈2ℤ, so every exponent is an
integer. Variable exchange in the compact-test integral gives
`P_(A,A|A₃)Σ=(−1)^(m−n/2)P_(A,A|A₃)` in the principal row,
and `(−1)^(n/2)` in the complementary row. Prove it first on the
collision-avoiding dense tests and on the convergent kernels, then
on the regularized distributions and completed carriers of the
preceding analytic supplier. Its positive scalar q normalization
does not change this identity. The sign is unchanged by output
Weyl folding `(n,ν)↦(−n,−ν)` for even n, and by changing the
input Weyl representative `(m,ω)↦(−m,−ω)`.

In the complementary-atom row the actual embedding satisfies
`(Jv)^hat(ξ,η)=K(s,s)^(−1/2)vhat(ξ+η)`. It is fixed by Σ, so
the atom lies only in Sym². Transport the two projectors by the
unitary T, or (T,Q), to the stated parameter restrictions and atom.
This computes all identical zero-Lorentz exchange sectors. The remaining
identical M3 and nonzero-null M4 sectors are computed next. The full
finite-n associativity, recoupling and permutation-sector comparisons
remain M6 theorem targets, with their full input ranges retained.

**The remaining identical M3 and nonzero-null M4 exchange sectors.**

Use Layer P.6's actual completed flip Σ and its orthogonal eigenspaces
s_X=+1 (Sym²) and s_X=−1 (Λ²). All identical-input products below
have covering center+1. Keep every real energy, half-integer input weight,
both continuous-spin centers and both Poincaré energy branches. Output spins
and covered-circle weights in this section are integers. The displayed measures
and their concrete positive densities are inherited from the ordered tensor
suppliers above; taking an eigenspace introduces no new Haar convention.

For a compact input spin j put N=2j∈ℕ₀ and

```
T_J(N)=Σ_(S=0)^N min(J,S)
      = N(N+1)/2                    if J≥N,
      = JN−J(J−1)/2                 if 0≤J<N,
M_J^(s_X)(j)=T_J(N)+(N+1)·1_{s_X=(−1)^(J+N)}.
```

These are finite multiplicities for J∈ℕ₀. They refine the existing
partial-wave count for every identical A_(m,U,j), m≠0, and every
identical P_(m,j)^ε_E, m>0, ε_E=±1:

```
(A_(m,U,j)⊗A_(m,U,j))_(Σ=s_X)
 ≃ ∫_(k>0)^⊕ ⊕_(J∈ℕ₀)
       A_(2m,2U+k²/m,J)^(M_J^(s_X)(j)) k²dk,
(P_(m,j)^ε_E⊗P_(m,j)^ε_E)_(Σ=s_X)
 ≃ ∫_(M>2m)^⊕ ⊕_(J∈ℕ₀)
       (P_(M,J)^ε_E)^(M_J^(s_X)(j)) dM.
```

For each coupled internal spin S=0,…,N, orbital l runs through
|J−S|,…,J+S. The phase (−1)^(l+2j−S) starts at
(−1)^(J+N), and alternates over 2min(J,S)+1 entries. Thus that sign
has min(J,S)+1 entries, the opposite sign min(J,S). Summing proves the
closed formula, including j=0,J=0. Equal input mass gives relative momentum
(p₁−p₂)/2 for either sign of the Bargmann mass, so negative m has the
same exchange rule and internal-energy half-line 2U+k²/m. Identical
nonzero masses never have zero total mass; the existing opposite-mass table
is retained. Translation inversion commutes with Σ and proves the past
massive formula with the same inducing spin. No threshold atom is added.

For Euclidean/time-translation inputs and their covered-circle convention,
prove

```
(Z_(E,j)⊗Z_(E,j))_(Σ=s_X)
 ≃ ⊕_(0≤J≤2j, J∈ℕ₀, (−1)^(2j−J)=s_X) Z_(2E,J),
(Eucl_(r,E,h)⊗Eucl_(r,E,h))_(Σ=s_X)
 ≃ ∫_(0<R<2r)^⊕
       ⊕_(a∈ℤ, (−1)^(a+2h)=s_X) Eucl_(R,2E,a) R dR.
```

Every listed multiplicity is 1. The zero-radius irreducibles are the separate
Z row, not substitution of r=0 into the sphere formula. At r>0 the
R=0 and R=2r collinear sets carry no atoms. For a positive spatial sum,
choose mirror pair representatives about its axis and a spin lift u_X of
rotation by π around that axis. With input frames h₂=u_Xh₁,
u_Xh₂=zh₁, z=−I. The exact induced flip is η_h R_(u_X),
η_h=exp(2πih), on the center-induced circle carrier. Its integer output
character a gives R_(u_X)=(−1)^a; hence the stated sign. The compact
Z row is the actual SU(2) Clebsch–Gordan flip (−1)^(2j−J).

For all M3 zero-mass Bargmann families, with exactly the labels of the
fourteen-cell ordered table, compute the following exhaustive diagonal rows:

| Identical input | s_X exchange sector |
| --- | --- |
| D_(E,j) | ⊕_(0≤J≤2j, J∈ℕ₀, (−1)^(2j−J)=s_X) D_(2E,J) |
| E_(E,κ,s), κ>0 | ∫_(0<ζ<2κ)^⊕ ⊕_(a∈ℤ, (−1)^(a+2s)=s_X) E_(2E,ζ,a) dζ |
| B_(r,h), r>0 | ∫_(0<R<2r, ζ>0)^⊕ C_(R,ζ,0) dR dζ |
| C_(r,κ,e), r,κ>0, e∈{0,½} | ∫_(0<R<2r, ζ>0)^⊕ C_(R,ζ,0)^∞ dR dζ |

The E and B rows have multiplicity 1 everywhere displayed; ∞ is countable.
The D row has its displayed compact multiplicity 1. The E row is exactly
the Euclidean sphere calculation for the boost-dual sphere, with fixed
energy 2E. B/C have a free energy coordinate on their N-orbit; do not
introduce a new fixed 2E parameter there. Their r=0 models are the separate
D/E rows, and zero transverse radius is the separate B row, not an
irreducible C_(r,0,e). The κ=0 boundary of E is likewise treated by the
actual zero-covector compact irreducibles. No collinear endpoint, R=0,
ζ=0 or extra D/E/B-family atom is introduced. These mass-zero
representations give the genuine Galilei quotient as well; for the ordinary
SO(3) rotation quotient restrict to integer input spins/weights and e=0.
All covered center signs remain in the covered formulas. Choosing an
exchange sector asserts no physical spin-statistics law.

Prove the noncompact B/C rows on their actual normalizer carrier. At each
noncollinear equal-radius pair with fixed sum (P,E=0), choose equal individual
energies 0 and mirror spatial momenta. The common subgroup is L×Z,
L=ℝw_B with w_B=(p₁×p₂)/|p₁×p₂|; Z={±I}. The swap is the π rotation
u_X around P, with u_X²=z and u_X v u_X⁻¹=−v on L. The two input
frames h₁,h₂=u_Xh₁ transport this line to opposite little boost lines.
Consequently the coefficient is τ(v)⊗τ(−v) and the induced flip is
η_τ ΠR_(u_X), η_τ=τ(z), with Π swapping the two input fibers.
Put N_B=(L×Z)∪u_X(L×Z), retaining u_X²=z. Its s_X extension is

```
ρ_(s_X)|_L=τ(v)⊗τ(−v),   ρ_(s_X)(u_X)=s_X η_τ Π,
```

and the eigenspace is Ind_(N_B)^(F₂)ρ_(s_X), with the compatible
N_B/(L×Z) probability measure and pushforward quotient. Prove this
section identification is isometric; it is not an unknown conjugated swap.

For B, τ is the one-dimensional rotation character and the line character is 0.
In the actual line-induced model choose section coordinates (y,θ) with
translation R_θ(yv₀) transverse to L. Right u_X acts by
(y,θ)↦(−y,θ+π). Fourier transformation in y therefore sends
(t,θ)↦(−t,θ+π), preserving the actual boost-dual vector R_θ(tv₀).
At fixed ζ=|t|>0 the two t signs are interchanged. In a common angular
fiber coordinate the flip is (F₊,F₋)↦η_h(F₋,F₊), so
F↦(F,s_Xη_hF)/√2 gives one entire C_(R,ζ,0) field in each sector.
The quotient’s central character is +1 and θ has its inherited 4π lift;
the possible 2π shift in this identification acts trivially there. This
computes the two ordered copies as one per sign without losing their measure.

For C use its actual circle model. Restriction to either boost line has
arcsine spectrum λ_i∈(−κ,κ), two sheets and no atom. In
λ=λ₁−λ₂, y=(λ₁+λ₂)/2 the line has character exp(iλv/ℏ),
while u_X exchanges the input variables, hence λ↦−λ, with the finite-sheet
swap and η_e. The λ=0 set is null. Its conditional y interval has positive
length for almost every |λ|<2κ, so its Hilbert multiplicity is infinite.
A unitary gauge on λ<0 removes the fixed sign/sheet swap. Decompose on
λ>0 into Ind_(L×Z)^(N_B)(χ_λ⊗1) with those explicit multiplicity fibers.
Induction in stages and the proved line adapter give ζ>λ and two planar
sheets; for every ζ>0 the remaining interval
0<λ<min(ζ,2κ) is nonempty and non-atomic. Thus each exchange sector
has exactly countable infinite C multiplicity, with no zero-radius character
atom. For the Borel conditional fields, use the actual arcsine density
a_κ(x)=1/(π√(κ²−x²)) and its two finite sheets. The conditional y
interval is (−κ+|λ|/2,κ−|λ|/2), with positive density
a_κ(y+λ/2)a_κ(y−λ/2). Its affine parametrization by (0,1) and
the square root of the resulting positive density give an explicit Borel
unitary to the fixed L²(0,1) carrier, retaining its finite sheet labels.
On either transverse Fourier sheet the ζ adapter has
abs(dt/dζ)=ζ/√(ζ²−λ²) for ζ>|λ|. After that adapter use the same
affine parametrization of (0,min(ζ,2κ)) and its resulting positive
conditional coarea density. This constructs
the measurable countably infinite multiplicity fields without discarding
any positive-measure subset. Boundary density singularities occur on null
endpoints and create no atomic components.

For nonzero-null Poincaré inputs use M4's inducing h and κ, keeping its
physical helicity ε_Eℏh and Pauli–Lubanski-radius dictionary separate. Put
η_h=exp(2πih), η_e=exp(2πie). For every ε_E=±1 compute

```
(F_h^ε_E⊗F_h^ε_E)_(Σ=s_X)
 ≃ ∫_(M>0)^⊕
       ⊕_(J∈ℕ₀, (−1)^(J+2h)=s_X) P_(M,J)^ε_E dM,
(C_(κ,e)^ε_E⊗C_(κ,e)^ε_E)_(Σ=s_X)
 ≃ ∫_(M>0)^⊕ ⊕_(J∈ℕ₀)
       (P_(M,J)^ε_E)^(c_J^(s_X)(e)) dM,

c_J^(s_X)(e)=∞    if J≥1,
              ∞    if J=0 and s_X=η_e,
              0    if J=0 and s_X≠η_e.
```

Every displayed finite-helicity component has multiplicity 1. In particular h=0
is included; it does not mean zero momentum. Both continuous-spin centers,
e=0 and ½, are retained. There is no massless or zero-momentum direct
summand: their collinear/zero-total configurations are null for the ordered
product measure, also after bounded eigenspace restriction. The radial
threshold M=0 carries no atom. The output branch is ε_E throughout.

Pin the actual swapping lift to fix the sign. In a sum rest frame put
p₁=(0,0,ε_E M/2,ε_E M/2), p₂=(0,0,−ε_E M/2,ε_E M/2).
Take b=diag(√(M/2),1/√(M/2)), h₁=b, h₂=J_alt b. Then
J_alt h₁=h₂, J_alt h₂=zh₁. The common Spin(2) acts on
τ⊗τ with weights a−b, since the second circle is reversed. The exact flip
on the actual SU(2)/Spin(2) induction carrier is η_τ ΠR_(J_alt).
Use u v_m=(−1)^(J+m)v_(−m) in the fixed polynomial SU(2) model;
on a reciprocity vector labelled (a,b), m=a−b, this is

```
(a,b) ↦ η_τ (−1)^(J+m)(b,a),   |m|≤J.
```

For F_h only a=b=h occurs, giving η_h(−1)^J. For C_(κ,e),
a,b range over e+ℤ once. J=0 has only the infinitely many diagonal
pairs with sign η_e; every J≥1 has infinitely many adjacent pairs with
m=±1, each giving one vector per sign. This proves all the c_J counts
rather than inferring them from infinite input dimension. The lift has square
z, not 1, and θ retains period 4π. Translation inversion commutes with this
flip, preserving h/e, so the past formula has the same inducing-label sign;
no extra physical-helicity ε_E sign is inserted. The κ-dependent boost/little
translation transports remain in the explicit unitary even though κ does not
change the count. No finite-helicity class is obtained by substituting κ=0
in an irreducible continuous-spin formula. A reducible zero-translation circle
carrier, when used, is the direct sum of its actual finite weights and must
use Sym²/Λ² of a direct sum with its mixed ordered terms.

For the null compact multiplicity fields, enumerate a,b in e+ℤ and
use the displayed diagonal vectors and normalized ± eigenvectors on each
paired (a,b),(b,a) block. These are countable fixed Borel frames; their
independence of M makes the radial direct-integral restriction measurable.

All measures here are restrictions of the ordered actual unitaries. The only
two-sheet reduction is the displayed 1/√2 isometry; Fourier/parity restriction
or pairing of orthonormal compact multiplicity vectors changes no radial
normalization. Prove all these formulas first on compactly supported sections
and finite circle-weight sums, then through their isometric completions and
Borel direct-integral fields. Preserve the existing spacelike and zero-Lorentz
exchange suppliers and all endpoint distinctions. These are explicit theorem
targets; their named analytic suppliers and native implementations are not
asserted already complete.

**A fixed three-factor recoupling/permutation acceptance case.**

As a concrete finite-n comparison beyond two-factor parity, own the following
actual completed compact example for both Z_(E,½) and D_(E,½) of M3.
Their threefold product has energy 3E and compact spin module

```
D_(½)^(⊗3) ≃ D_(3/2)⊗1_(S₃) ⊕ D_(½)⊗Std_(S₃).
```

Thus Sym³ is exactly the spin3/2 summand, Λ³ is 0, and the central Young-(2,1)
isotypic sector is spin1/2 with its actual two-dimensional permutation multiplicity.
Pin the gauge by the orthonormal spin+½ highest-weight vectors in the three
weight words a=|++−⟩, b=|+−+⟩, c=|−++⟩:

```
e₀=(b−c)/√2,
e₁=√(2/3)a−(b+c)/√6,
f₀=(a−b)/√2,
f₁=√(2/3)c−(a+b)/√6.
```

The e basis couples the first two factors first; the f basis couples the
last two first in the stated literal gauge. Direct inner products give

```
[f₀ f₁]=[e₀ e₁] F,
F=[[-1/2,−√3/2],[√3/2,−1/2]],
Π₁₂=[[-1,0],[0,1]],
Π₂₃=[[1/2,√3/2],[√3/2,−1/2]].
```

Prove this on the actual Hilbert tensor basis and propagate by the compact
lowering intertwiner to the whole spin1/2 summand. Verify F*F=Id,
Π₁₂²=Π₂₃²=Id and the braid relation; Π₂₃=FΠ₁₂F*. The orthogonal
spin3/2 module is totally symmetric. This derives the stated sector
multiplicities and recoupling matrix without an unspecified conjugated flip.

This fixed compact example does not discharge the full finite-n requirement.
For every finite ordered n-tuple retain the actual Hilbert associators, Fubini
and reassociation comparisons for all M3/M4 labels, including every continuous
label/endpoint. Distinct-factor permutations are unitaries between the permuted
ordered carriers; for identical inputs and their equal-label stabilizers retain
all permutation sectors on the actual carrier. Construct the actual
measurable recoupling kernels and their densities between each iterated
irreducible field, prove pentagon/coherence and the Coxeter permutation
relations, and compute the irreducible fields and multiplicity spaces of the
symmetric, antisymmetric and other Young sectors. An abstract S_n projector,
an uncomputed TΣT* or this one compact matrix is not that general calculation.

**M6.PairField and M6.FiniteTree — normalized subtree kernels and Young fields.**

Here G is one fixed Hausdorff second-countable locally compact type-I group
used for the genuine strongly continuous complex-unitary M3/M4 tensor tables,
including their genuine covering and central-extension groups. Use M2's
canonical Borel irreducible label space 𝓛 and actual carriers H_a. All real
mass/energy signs, cover centers, zero/null/spacelike labels, principal,
complementary, discrete, limit and atom branches of those tables remain inputs.

**M6.TensorCoherence.** VNA V2 supplies the binary completed tensor product,
its dense elementary tensors, bounded maps, associator and ordinary flip.
M6 owns the following finite-ary adapter. Compare native PiTensorProduct over
Fin n with the algebraic left-comb tensor by its universal multilinear map.
Transfer the product inner product, prove positivity and the elementary norm
formula, complete, and construct the onto isometry to the iterated binary
Hilbert completion by induction and elementary-tensor density. Use the scalar
tensor unit for n=0 and the given H for n=1. Construct maps for every planar
binary tree and every mixed-factor reindexing by their literal elementary
formula. Prove uniqueness by density, and hence all associator/shuffle,
pentagon, inverse and mixed-object composition identities. These finite-ary
bridges are owned here, not assumed consequences of V2's binary API.

For identical powers identify Layer P.6's permutation action with the particular
left action `U_σ(⊗_i v_i)=⊗_i v_(σ⁻¹i)` on that carrier; prove its group law
and its dense algebraic comparison with the actual native
`PiTensorProduct.reindexRepresentation`. SchurWeyl's finite-dimensional tensor
action is not an infinite-dimensional Hilbert completion theorem. For mixed
inputs reindexing is a unitary between permuted ordered tensor objects;
endomorphism actions occur for the equal-label stabilizer, or after the fixed
grouping comparison for the product of identical-block symmetric groups.

**M6.PairField.** For each ordered pair a,b construct the joint Borel
sigma-finite label kernel ν_(a,b), countably generated measurable nonzero
multiplicity M_(a,b)^c. Explicitly restrict ν_(a,b) to the jointly Borel
effective support E={(a,b,c):M_(a,b)^c≠0} before normalization; Borelness
comes from the positive rank of its countable Gram fundamental family.
Outside E set the kernel measure to0. The tensor of two nonzero irreducibles
is nonzero, so this restricted kernel is not zero. Construct the onto CG unitary

```
C_(a,b): H_a ⊗̂ H_b ≃ ∫⊕(H_c ⊗̂ M_(a,b)^c)dν_(a,b)(c).
```

Its inverse, fixed phase, coordinate kernel K_(a,b)^(c,u), physical density
and atoms are exactly the already owned ordered suppliers. These are compact
SU(2) CG; Euclidean sphere/coarea; Bargmann relative-momentum, circle and
boost-line; massive/null/mixed/spacelike Mackey refinements; M4.P's SL(2,ℝ)
Plancherel normalization; M6.A restrictions and M6.H induction/Wilson;
and the zero-Lorentz complex CG, M4.Riesz carrier and Angular meromorphic
completion. M2.DerivedDI supplies the closed-generator comparison. Prove
joint Borel dependence on a,b,c on a countable fundamental family, including
moving support and atoms, then extend by these actual unitary bounds.
V4.0.Fields supplies measurable Gram–Schmidt and measurable operator fields.

- The effective ordered-pair field gives an onto intertwiner with nonzero
  multiplicity almost everywhere; changing the measure class uses its specified
  positive square-root density.
- The effective support is Borel in all three labels; atoms and continuous
  branches have the physical densities prescribed by the pair tables.

**Checks (effective pair field).**

- For SU(2), spin 0 tensor spin j has one output j with multiplicity one;
  the carrier dimensions are 1·(2j+1)=2j+1.
- Spin 1/2 tensor spin 1/2 has outputs 0 and 1, both once: 2·2=1+3.
  A single spin-1 output would lose one dimension.
- A spurious positive-mass label with zero multiplicity contributes the zero
  Hilbert fibre and must be removed before normalization. An entirely zero
  field has effective measure zero and no probability normalization; it is
  excluded here by the nonzero irreducible inputs, rather than assigned Z=0⁻¹.

The normalization theorem holds for **every chosen admissible uniform Borel exhaustion**; it is not a canonical model-coordinate choice. Own existence of such an exhaustion, not merely individual sigma-finiteness:
F_k⊂(𝓛×𝓛)×𝓛 are increasing Borel sets whose sections F_k(a,b) have finite
ν_(a,b)-measure for every a,b and cover its effective support up to a null
set. Construct one using the explicit countable density/atom charts by truncating coordinates, discrete indices and density levels; other admissible jointly Borel exhaustions, including the ordered atomic diagnostic below, are equally allowed. Let E_k be their disjoint
layers and m_k(a,b)=ν_(a,b)(E_k(a,b)). With
Z_(a,b)=∑_(k:m_k>0)2^(-(k+1)), set
w_(a,b)=2^(-(k+1))/(Z_(a,b)m_k) on E_k where m_k>0 and set w=1 on
the remaining ν_(a,b)-null subset of the effective support. The restriction
already assigns zero measure to its complement; thus Z_(a,b)>0 and
ν̃_(a,b)=w_(a,b)ν_(a,b) is a jointly Borel
probability kernel, and K̃=w^(-1/2)K is its exact analysis normalization.
Do not change any model-coordinate measure m_c or physical input Haar measure.

- The normalized pair kernel has total mass one and the same null sets on
  effective support; multiplying the analysis kernel by w⁻¹ᐟ² preserves its norm.
- Empty exhaustion layers contribute zero to Z; every positive layer has finite
  mass, so its denominator Z m_k is positive and finite.
- Different admissible exhaustions give equivalent kernels, related by the
  positive density ratio and the change-of-normalization unitary below.

**Checks (pair probability normalization).**

- One atom of mass 3 in E₀ gives Z=1/2, w=1/3, normalized mass 1 and
  analysis factor √3; the squared norm is 3 on either measure.
- Two atoms of masses 1 and 3 in the same E₀ give Z=1/2 and w=1/4,
  hence probabilities (1/4,3/4). If each instead occupies its own ordered
  layer E₀,E₁, Z=3/4 and w=(2/3,1/9), giving (2/3,1/3).
  Thus the exhaustion matters: singleton-layer probabilities need not depend
  on the physical masses, although their densities do.
- Three counting-measure atoms in ordered singleton layers have Z=7/8,
  w=(4/7,2/7,1/7) and probabilities (4/7,2/7,1/7).
- Removing an ineffective atom of mass 3 leaves a mass-1 effective atom,
  whose normalized probability is 1; normalizing before removal instead
  leaves total effective mass 1/4. An empty layer m_k=0 is skipped, never divided by.

Use the native finite-kernel RN and conditional-kernel contracts in Exact
supplier contracts for the probability kernels below. On equivalent kernels their
RN densities are positive and finite almost everywhere for each fixed parameter;
the common leaf tuple is the parameter, not a choice of a separate version for
each tuple. At a null conditioning point use the native conditional version;
no common exceptional set is asserted for uncountably many leaf tuples.

**One common measure at every subtree root.**

This is a derived finite-block construction, not an independently cited
recoupling theorem. *Needs:* M6.PairField's effective-support probability
kernels; M2.TypeIDisintegration's type-I uniqueness; M2.RectangularField;
VonNeumannAlgebras V4.0.Fields; and the native finite-kernel RN/disintegration
contracts. The induction uses only smaller child blocks. The external
induction compatibility used in PairField is Echterhoff2010 Remark 5.10(2),
p.20; probability normalization and the finite-average identity are proved here.

Fix n indexed leaves and their
labels. For each nonempty finite index block B define a probability μ̄_B
inductively on |B|, independently of its tree and leaf ordering. For a
singleton i put μ̄_(i)=δ_(a_i). For every ordered nonempty bipartition
B=J⊔K form

```
P_(J,K)(da,db,dc)=μ̄_J(da) μ̄_K(db) ν̃_(a,b)(dc),
ρ_(J,K)=(root c)_* P_(J,K),
μ̄_B = (2^|B|−2)^(-1) ∑_(J⊔K=B, J,K≠∅) ρ_(J,K),
r_(J,K)^B(c)=dρ_(J,K)/dμ̄_B(c),
P_(J,K)=ρ_(J,K)(dc) κ_(J,K)^c(da,db).
```

The finite average alone gives ρ_(J,K)≪μ̄_B and
0≤r_(J,K)^B≤2^|B|−2 almost everywhere; no type-I uniqueness is needed
for this direction. For the converse at block size k, first use the induction hypothesis for every proper block D: μ̄_D is a probability, each M_(T,D) is nonzero μ̄_D-almost everywhere and every Ĉ_(T,D) is onto. Combine those child maps, the onto pair C̃ and field Fubini to realize the same tensor object over each ρ_(J,K), with nonzero multiplicity ρ_(J,K)-almost everywhere. Only now apply M2.TypeIDisintegration's type-I spectral uniqueness. It makes all these root measures equivalent, hence `r_(J,K)^B>0` μ̄_B-almost everywhere. The average is therefore equivalent to each; no parent Ĉ or parent nonzero-multiplicity assertion is used in this converse step. Prove all displayed kernels and r jointly
Borel in the original leaf tuple by these native kernel contracts. Permuting the
indexed leaves just reindexes the finite average. No forward reference to an
already normalized parent is used: both children are strictly smaller blocks.

- For |B|≥2, each root marginal and their finite average are probabilities;
  the RN density r is bounded above by 2^|B|−2.
- The conditional kernel κ disintegrates the ordered child-label joint measure
  over its root marginal. Its null-conditioning values do not affect the field.
- After the smaller-block onto theorem, type-I uniqueness makes every r
  positive almost everywhere, and permutations of the indexed leaves preserve μ̄_B.

**Checks (common root measure).**

- A singleton has μ̄=δ_a of mass 1 and no bipartition; the averaging
  denominator 2^|B|−2 would be zero, so the singleton clause is essential.
- Two trivial inputs have two ordered bipartitions, both with marginal δ_0;
  dividing their sum by 2 gives μ̄=δ_0, of mass 1 rather than 2.
- For the three SU(2) leaves (1/2,1/2,1), with uniform probabilities on each
  pair support, one unordered split has marginal (1/6,2/3,1/6) on spins
  (0,1,2) and the other two have (1/4,1/2,1/4). Averaging the six ordered
  splits gives μ̄=(2/9,5/9,2/9), rather than either individual marginal.

**Checks (root RN density).**

- The two trivial inputs give r=1; the node's √r factor is also 1.
- In the first split of the three-leaf example, r=(3/4,6/5,3/4), all ≤6;
  multiplication by μ̄ gives (1/6,2/3,1/6). Replacing r by its reciprocal
  would give mass (4/3)(2/9)=8/27 at root 0 instead of 1/6.
- The other two splits give r=(9/8,9/10,9/8). Their root-0 norm transport
  is (9/8)(2/9)=1/4; omitting the internal factor leaves 2/9.

**Checks (conditional child-label kernel).**

- For two trivial inputs κ^0=δ_(0,0); integrating it against δ_0 recovers
  the joint unit atom at (0,0,0).
- For the first three-leaf split conditioned on root 1, the intermediate
  spin of the (1/2,1/2) pair has probabilities (3/4,1/4) on (0,1):
  raw masses (1/2,1/6) sum to 2/3. Uniform conditional weights would give
  raw masses (1/3,1/3), contradicting the joint law.
- In the same split, root 0 has κ=δ_1 and marginal mass 1/6, so its
  intermediate-spin-1 joint mass is 1/6 and its spin-0 joint mass is 0.
  At a root of marginal mass 0, any conditional probability contributes 0;
  there is no pointwise uniqueness assertion there.

At a tree node B with children J,K use the actual bounded node unitary
obtained from C̃_(a,b), disintegration by κ_(J,K)^c and multiplication by
√r_(J,K)^B(c). Thus every internal vertex, not only the global root, has
its specified RN factor. Recursively the multiplicity is

```
M_(T,B)^c = ∫⊕_(a,b)
   M_(T_J,J)^a ⊗̂ M_(T_K,K)^b ⊗̂ M_(a,b)^c  dκ_(J,K)^c(a,b),
Ĉ_(T,B): ⊗̂_(i∈B)H_(a_i) ≃ ∫⊕_c H_c⊗̂M_(T,B)^c dμ̄_B(c).
```

Use a fixed postorder for all multiplicity factors and the ordinary commutor
to move the new factor there. For n=0 use the trivial G module ℂ separately.
The node analysis kernel has exactly √r_(J,K)^B(c)K̃_(a,b)^c; hence the
full coefficient has the product of √r_v and w_v^(-1/2) over all internal
vertices. The scalar path probability Q_T is μ̄_B at the root followed by the
conditional κ at each vertex. If Q_raw,T is the postorder product of the
ν̃ kernels at fixed leaves and Q_phys,T the corresponding physical ν product,
prove by node disintegration and induction the exact identities
`dQ_raw,T=(∏_v r_v)dQ_T` and
`dQ_phys,T=(∏_v r_v/w_v)dQ_T`. Thus the displayed analysis factors
give exactly the original pair-measure norm on elementary sections. V4.0.Fields's fundamental
sections and scalar Tonelli/disintegration give the local field-Fubini isometry; density
of conditional fundamental sections gives onto. This M6 adapter and the
onto pair unitaries prove each Ĉ_(T,B) onto by induction. Prove at this step that M_(T,B) is nonzero μ̄_B-almost everywhere, completing the size-k induction hypothesis. Start with singleton carriers and the onto effective-support pair theorem. Construct all common measures, positive densities and conditional kernels, then all size-k trees, before passing to local overlaps/grafting, pentagon/cherry/Coxeter relations and Young fields.

**Change of normalization.** For two admissible choices w,w′, put `t_(a,b)(c)=w′_(a,b)(c)/w_(a,b)(c)` on their common effective support, with arbitrary positive null-set values. Then `ν̃′=tν̃` and multiplication by t^(-1/2) is the pair analysis unitary, so `C̃′=t^(-1/2)C̃`. Using the native RN/disintegration contracts and finite-block induction above, prove the coherent comparison for the entire construction, not just the global root.

Inductively write `h_D=dμ̄′_D/dμ̄_D`, with h_i=1. At B=J⊔K set `f_(J,K)(a,b,c)=h_J(a)h_K(b)t_(a,b)(c)` and `k_(J,K)(c)=∫f_(J,K)(a,b,c)dκ_(J,K)^c(a,b)`. Prove `ρ′_(J,K)=k_(J,K)ρ_(J,K)`, `h_B=(2^|B|−2)^(-1)Σ_(J,K)k_(J,K)r_(J,K)^B`, `r′_(J,K)^B=k_(J,K)r_(J,K)^B/h_B`, and `κ′_(J,K)^c=(f_(J,K)/k_(J,K))κ_(J,K)^c`. All densities are positive finite almost everywhere in their stated kernels; every version is jointly Borel in the leaf labels.

Construct the measurable decomposable field of recursive fibre unitaries `W_(T,B)^c:M_(T,B)^c≃M′_(T,B)^c` from the child W maps and multiplication by `(k_(J,K)/f_(J,K))^(1/2)` in the conditional direct integral, retaining the pair multiplicity factor by identity. On the full analysis space the unitary is `U_(T,B)=h_B^(-1/2)(1_(H_c)⊗W_(T,B)^c)`, and prove `Ĉ′_(T,B)=U_(T,B)Ĉ_(T,B)`. Prove unit, composition and inverse laws for successive normalization changes using RN chain rules. For each fixed leaf tuple the fibre identities hold μ̄_B-almost everywhere in the relevant source measure class, and the resulting direct-integral operator identities are exact. Equivalent measures transport these conull statements; no common exceptional set is asserted over all leaf tuples. Thus all these models are measure-equivalent and coherently unitarily equivalent, while the fixed physical Haar and model-coordinate measures are unchanged.

- Normalization transport preserves the original physical pair measure and
  intertwines the two analysis maps; its source and target use ν̃ and ν̃′.
- Recursive transport uses the displayed conditional densities at every node;
  equal choices give identity, and successive changes compose by density ratios.

**Checks (change of normalization).**

- Equal exhaustions give t=1, h=1, k=1 and identity transport at every node.
- For atoms of masses (1,3), changing from one layer to separate singleton
  layers changes probabilities (1/4,3/4) to (2/3,1/3). The density ratio
  is t=(8/3,4/9), so the analysis factors are (√(3/8),3/2);
  their squared norms on the two atom indicators are respectively
  (3/8)(2/3)=1/4 and (9/4)(1/3)=3/4.
- Reversing that change gives t⁻¹=(3/8,9/4). The two successive analysis
  factors multiply to 1 on each atom, whereas using t¹ᐟ² in both directions
  of the original change fails the preceding norm identities.

**Local overlap and grafting naturality.** For three unchanged blocks J,K,L
with root labels a,b,d and union B, a left intermediate p and a right
intermediate q, the two local kernels are

```
L_p^c(z;x,y,t) = √r_(JK,L)^B(c) ∫
  K̃_(p,d)^c(z;h,t) √r_(J,K)^(JK)(p) K̃_(a,b)^p(h;x,y) dm_p(h),
R_q^c(z;x,y,t) = √r_(J,KL)^B(c) ∫
  K̃_(a,q)^c(z;x,k) √r_(K,L)^(KL)(q) K̃_(b,d)^q(k;y,t) dm_q(k).
```

Retain every multiplicity index and the indicated κ path measures. For
reducible blocks keep a,b,d as unchanged measurable parameters with their
common μ̄_J,μ̄_K,μ̄_L, and carry the child multiplicities by identity.
The local comparison kernel is the weak overlap
`∫R_q^c(z;x,y,t) overline(L_p^(c′)(z′;x,y,t)) dm_a(x)dm_b(y)dm_d(t)`
with those parameter measures and conditional path laws. M2.RectangularField
proves its completed root-diagonal form `1_(H_c)⊗F_(J,K,L)^c`.
Extract F by compression against one measurable root unit section; do not
take an infinite trace or evaluate a root delta distribution on its diagonal.

Define the composites first by the bounded pair operators. Own the exact
kernel-domain bridge: each pair supplier gives a jointly Borel countable
fundamental family in its actual dense linear kernel test domain, with its kernel formula
and Plancherel bound. For the first transformed section g_p use the finite
orthogonal projections P_N(p,d) onto the Gram–Schmidt span of this family
in H_p⊗̂H_d, tensored with identity on earlier multiplicities; use finite
multiplicity sums before completion. Then P_Ng lies in that test domain, ∥P_N∥≤1 and P_Ng→g
in the direct-integral L² norm. Compute the second pair kernel on P_Ng
and take the L²/weak rigged-kernel limit. This supplies a composition formula
without assuming that the first transform lands in an unproved second test
domain. For each supplier prove its stronger unregularized nested formula
only on the actual mapped test class where its domain/integrability lemma
holds. For Riesz/meromorphic suppliers include their residue and boundary
limits before asserting that identity. A common original dense model test
domain does not imply a dense intersection of unrelated transformed domains.

For the overlap take finite-rank original-carrier cutoffs J_N→1 and the
finite sum ∑_(k≤N)(C_R e_k) overline((C_L e_k)), with C_L e_k and
C_R e_k defined by the bounded composites and the just proved test-projection
limits. Prove strong operator and weak rigged-kernel convergence and joint
Borel field transport. A finite cutoff need not be root-diagonal. No product
of undefined distributions is a definition of the local move.

The essential coherence theorem is grafting naturality: the displayed local
F, inserted at any internal subtree with identity on untouched factors,
is exactly the global comparison between the two recursively constructed
Ĉ trees. Its proof uses the same μ̄_B on both subtree roots, the actual
conditional κ and every vertex RN factor, then field-Fubini on fundamental
sections and completion. Consequently local moves are isometric in the
parent conditional measures. If one instead uses raw postorder pair measures,
the local insertion has the additional factor √(dμ_S/dμ_S′)(c_v); it
cannot be discarded or absorbed into a global-root-only density. The recursive
normalization above uses the chosen admissible exhaustion; the coherent comparison above transports the theorem to every other admissible choice.

For this separate compact diagnostic specialize the general theorem to G=SU(2), independently of the fixed M3/M4 group above. As a weighted internal-move acceptance case take spins
(½,½,1,½), counting CG label measures and the layer exhaustion with F₀
containing all relevant spins up to 3. Its equivalent pair probabilities are
uniform. For the first three leaves compute the raw root marginals
μ_L(0,1,2)=(1/6,2/3,1/6) and μ_R(0,1,2)=(1/4,1/2,1/4).
The conditional local move grafted without the internal measure adapter
has norm ratios (3/2,3/4,3/2). At global spin½ the two four-leaf raw
root masses are both 1/2 while internal spins 0 and 1 both occur, so a global
root factor cannot repair those different ratios. The chosen recursion gives
μ̄_(1,2,3)=(2/9,5/9,2/9) and
μ̄_(1,2,3,4)(½,3/2,5/2)=(10/21,3/7,2/21).
Compute the local three-block CG overlap independently of the full four-block
comparison and prove its normalized graft is weighted-isometric and equals
the directly iterated four-block CG transform. This is a local naturality
test, not a comparison defined by global conjugation.

In the same separate G=SU(2) specialization, as a second finite diagnostic use five leaves (½,½,1,½,½) and the
non-root move ((((01)2)3)4)→(((01)(23))4), whose first child (01) is
reducible. On each ordered compact pair support order admissible c increasingly
when a≤b and decreasingly when a>b. Put the first output in F₀, the second
in F₁\F₀ and all remaining outputs in F₂\F₁, omitting empty layers.
Use the same displayed 2^(-(k+1))/(Z m_k) rule. For three outputs the
probabilities are (4/7,2/7,1/7) in that ordered list; for two they are
(2/3,1/3). Thus ν̃_(1,½)≠ν̃_(½,1). Compute every common subtree measure,
κ and inner √r, and obtain the local move from independent three-block
highest-weight/ladder overlaps for each unchanged spin0 or1 of (01).
Compare its graft with the independently iterated five-body CG maps.
Also interchange (23) with (32) inside that tree, retaining both ordered
pair RN factors. Verify weighted isometry and agreement with the literal
tensor flip, and exhibit the nonzero norm defect if those node RN factors
are omitted. These exact finite diagnostics test this normalization;
they do not prove the general measurable or noncompact theorem.

Prove local F unitarity and its conditional-measure orthogonality/completeness.
The grafting identity identifies all products along tree paths with the same
global completed comparison, yielding path independence and the four-block
pentagon. That conclusion alone, written as a product of globally conjugated
unitaries, is not a test of the local grafting formula.

For a cherry interchange use the pair overlap with K̃_(b,a)(z;y,x) and
conjugate K̃_(a,b)(z′;x,y), including the two node √r factors into the
same μ̄_(J∪K). This includes the RN comparison between ν̃_(a,b) and
ν̃_(b,a). Recouple to the cherry with the computed local F, interchange,
and recouple back. Prove the mixed-object source/target composition and,
for internal identical-block actions, all involution, distant-commutation
and braid identities by the same grafting naturality and elementary tensor
formulas. Preserve every two-factor sign and multiplicity computed above.

**Young fields.** For a true identical power use M2.RectangularField to
obtain `U_σ=∫⊕1_(H_c)⊗u_T^c(σ)dμ̄(c)` in each tree. The preceding
local compositions compute u_T^c; finite-group relations hold on a common
conull set. Consume SchurWeyl Layers 3–5 for the complete finite-dimensional
Specht list and dimensions, CompactGroups Layer 1 for finite-group
unitarization and Layer 4 for coefficient orthogonality, and M0 for the
arbitrary-Hilbert compact isotypic/Hom normalization. The concrete finite
models are native `TauCeti.spechtModuleℂ` with
`TauCeti.existsUnique_nonempty_iso_spechtModuleℂ`; prove the identification of the
chosen orthonormal matrices with these complete complex models, consuming native `TauCeti.instSimpleSpechtModuleℂ` for their simplicity and `TauCeti.spechtModuleℂ_iso_iff` for pairwise inequivalence, not inferring either solely from the completeness statement. Choose orthonormal
Specht matrices D_θ and define

```
E_ij^θ = (d_θ/n!) ∑_(σ∈S_n) D_θ(σ⁻¹)_ji U_σ,
P_θ = ∑_i E_ii^θ = (d_θ/n!)∑_σ χ_θ(σ⁻¹)U_σ.
```

Prove `(E_ij^θ)*=E_ji^θ`, cross-shape matrix-unit multiplication,
`∑_θP_θ=1`, central orthogonality and the full Specht factor. The minimal
multiplicity carrier is `K_θ^c=range(E_11^θ(c))`; its measurable orthonormal
frame is V4.0.Fields Gram–Schmidt on projected fundamental sections s_k. Its exact
finite/infinite dimension is
`m_θ(c)=sup_r rank([⟨E_11s_i,E_11s_j⟩]_(i,j≤r))`, measurable by finite
Gram minors. These entries are the finite Specht sums and the specified
local CG overlaps, not an unknown projector-rank request. Construct the onto
unitary `P_θH^(⊗̂n)≃∫⊕H_c⊗̂(V_θ⊗K_θ^c)dμ̄(c)` by
`e_i⊗v↦E_i1^θ(c)v`. Equivalently K_θ is the intertwiner Hom carrier
with squared norm HS²/d_θ. No infinite-multiplicity trace is taken.
The row/column shapes recover Layer P.6's Symⁿ/Λⁿ, with their n=0,1 coincidence.

Tree changes conjugate these matrix units by the computed F. Specht gauge
change gives an explicit unitary of the multiplicity carriers, not their
literal equality: if `e′_i=∑_a e_a S_ai`, then
`E′_ij=∑_(a,b)S_ai overline(S_bj)E_ab`, and
`W=∑_a S_a1E_a1` satisfies `W*W=E_11`, `WW*=E′_11` and restricts to
`K_θ≃K′_θ`. Prove measurability and the compatible full-isotypic comparison.
Apply the same construction to each identical block of a mixed tuple.

**Normalization transport for overlaps and Young fields.** For the two trees T_L,T_R with common leaf block B put `W_L^c=W_(T_L,B)^c` and `W_R^c=W_(T_R,B)^c`, the preceding change-of-normalization fields on their multiplicity spaces. These symbols denote tree-normalization transport; the Specht-gauge partial isometry above has a different role. Prove `F′^c=W_R^c F^c (W_L^c)⁻¹`. The operators E_ij^θ on the unchanged tensor carrier remain the same. Their decomposed multiplicity-fibre matrix units satisfy `e′_(ij,T)^θ(c)=W_(T,B)^c e_(ij,T)^θ(c)(W_(T,B)^c)⁻¹`, equivalently conjugation by `1_(H_c)⊗W_(T,B)^c` on the full fibres. The map W_(T,B)^c sends `K_(θ,T)^c=range(e_(11,T)^θ(c))` onto its primed counterpart. In the full direct-integral comparison the factors h_B^(-1/2) cancel because the unprimed and primed root measures each depend on B, not its tree. For each fixed leaf tuple these are almost-everywhere fibre identities in the equivalent root measure classes and exact direct-integral operator identities, with no exceptional set common to all tuples.

The literal three-spin-half example and weighted four-factor internal-move
example are concrete acceptance cases. The full finite-n theorem retains
all n, labels, endpoint/atom cases, analytic pair completions, kernel-domain
bridges, local naturality, coherence and measurable Young-field proofs;
finite compact checks and well-typed target signatures do not prove them.
All connected M6 tensor input families have the explicit tables above. Their named analytic transforms, completion and measurable-field comparisons, exact multiplicities and measure transports are required theorem targets. Retain all principal/complementary/discrete/limit and endpoint little representations, exact measures and multiplicities in these families. The zero-orbit SL(2,ℂ) tensor theorem is the separately normalized analytic target above. No positive real mass square root is assigned on negative q. These families remain in the complete table.
The massive positive-energy partial-wave
formula can be compared with [Harshman–Licata,
hep-ph/0407299,§III](https://arxiv.org/html/hep-ph/0407299#S3); translation
coordinates, energy sign and the measure density are transported to M4's
conventions. M1 supplies the general theorem; the calculations and all
little-group refinements just specified belong to this milestone.

Source claims are acceptance cases, not authority for omitted assumptions. Preserve the following literal/corrected distinctions: (a) `ℝ⁴` has nontrivial continuous multiplier classes, represented by alternating bilinear forms; (b) M4's connected SO₀(3,1) has a nontrivial locally continuous spin circle-extension class, with its full two-component comparison proved separately; (c) the square-root argument excluding antiunitary ray actions fails for the explicit determinant-one matrix in M4; (d) mass is a real square root only on the nonnegative mass-squared sector; (e) a Euclidean spacetime group enlarged by time reversal may be represented antiunitarily; (f) conjugate genuine Bargmann classes have the simultaneous label reversal (m,U,j)↦(−m,−U,j), with M3's explicit realization and fixed time-reversal lift, while antiparticle language is interpretive; (g) the continuous multiplier of `ℝ` is cohomologically trivial under the normalized continuous convention and yields a lift. Layer P owns the translation-multiplier and connected-ray-component facts in (a),
(c) and (g); this milestone consumes them as source tests rather than creating
second owners. The literal assertions and their mathematical comparisons are stated
separately here and in the acceptance table below.

Record these additional Dooley acceptance cases with their exact owners:

| Physical page | Literal statement or notation | Required comparison and owner |
| --- | --- | --- |
| 16, bibliography33 | Spacetime localization is attributed to “Mackey [31]”. | Entry31 names Wightman. M4 proves the normalized full-spacetime PVM obstruction under translation covariance and positive energy, separately from spatial localization. |
| 16–17 | Irreducible σ-representations of G₁×ℝ factor, and Galilei is such a product. | M2 owns the genuine product theorem and its cohomologous-factorwise adapter. The extension-product route requires `C*(E_{ωᵢ})` type I for at least one factor. A type-I twisted fiber `C*(Gᵢ,ωᵢ)` suffices only with a separately proved fixed-central-character product theorem; type I of untwisted group algebras is not enough. A nontrivial cross-multiplier class obstructs the adapter. M3 proves boosts fail to commute with time translations, so the Galilei group is not this direct product. |
| 17 | φ(t)=e^(itH)φ and ∂_tφ=iHφ. | M4 distinguishes positive-time active symmetry from physical evolution at inverse time; the physical convention e^(−itH) is recovered with ℏ=1. |
| 20 | (1/i)(y∂_x−x∂_y), and H multiplication by E. | M3's localized Euclidean model computes the positive Stone rotation generator as the negative of physical (Q×P)_z, with the spin term included for nonzero j; fixed time character gives H=E. |
| 19 | Rotation labels include j=1/4,3/4,… and half-integer genuine SO(3) types. | Layer P.4's spin class and M3's compact stabilizers give integer genuine SO(3) types and half-integer SU(2) types; dimension2j+1 excludes quarter labels. |
| 20 | All Euclidean irreducibles have labels (j,E), followed by an L²(ℝ³) localized model. | M3 retains both zero and nonzero momentum orbits and their distinct stabilizers, and decomposes the reducible underlying localized representation. |
| 22 | Mass/spin particle labels, boost x↦x−v_D t, and the faint (1/m)T=X_iV_i−V_iX_i. | M3 uses v=−v_D, pins [X_i,V_j]=iℏδ_ij/m on its common core, and preserves the uncertain source T glyph rather than identifying it silently with iℏ. Genuine class labels include internal energy; the corresponding scalar time-character shift leaves a ray action unchanged. |
| 23 | A* is “inverse transpose”; full E(3,1) has square roots. | M4's Hermitian action uses conjugate transpose A†. Its connected component uses Layer P.2's connected ray-component theorem; the disconnected full group has separate parity/time-reversal implementations. The displayed SL(2,ℂ) counterexample disproves the square-root premise even in the connected cover. |
| 24 | The displayed union of representative branches contains zero in overlapping branches. | M4 gives positive timelike/spacelike parameters and a separate zero branch. Repetition within a set union is harmless; only treating the overlapping branches as disjoint labelled representatives would fail injectivity. |
| 25 | P₁²+P₂²+P₃²−P₄² is said to equal the positive timelike c of p24. | M4 proves the left side is −q(P)=−c in the pinned convention. This is an internal sign error, not a change that can preserve both printed equations. |
| 25,27 | Period2π diagonal coordinate is mixed with a period4π null-group action e^(iθ/2). | M4 proves the conversion θ=2φ, the action e^(iθ) and stabilizer {0,2π}; retain the literal parameter mismatch. |
| 26 | Timelike/null energy spectra are open intervals; the SU(2) index starts at 1, followed by a spin-0 entry. | M4’s joint PVM gives closed spectra [m,∞), (−∞,−m], [0,∞), (−∞,0], and includes spin 0. Preserve the literal label relation `r=2s`, `d=r+1`, `m=s−k` for `0≤k≤r`, including `r=0`; the prose index starting at 1 conflicts with the later spin-0 case. The omitted endpoint can be a spectral value without an eigenvector. Spacelike mass squared is negative and has no real mass square root; calling the discarded spacelike cases “anti-particles” supplies no representation theorem. |
| 29 | The pseudo-Euclidean radius-R locus is called a sphere; O(3,2) is called “inhomogeneous de Sitter”. | M5’s fixed metric/chart and ambient-sign comparison proves the explicit stereographic domain, inverse and pullback metric alongside the full de Sitter quadric and its induced signature/topology; preserve the faint source factor separately. Distinguish the anti-de Sitter orthogonal group O(3,2) from an affine semidirect extension; no group is identified by this literal name. |
| 30 | J_ab and contractions omit signature factors. | M5's pinned matrix units, signature and commutators supply the actual Lorentz/de Sitter generators and the ordered enveloping/Casimir comparison. |

Preserve faint or overwritten glyphs as source uncertainties. None of these
comparisons authorizes filling an indeterminate facing scan with invented content.

### Examples

The three-leaf and five-leaf SU(2) calculations above test conditional measures,
internal RN factors and local grafting. The one-atom, unequal-atom and ordered
three-atom PairField Checks distinguish effective support and probability normalization.

### Dependencies

P.6; M0 compact multiplicities; M1.MeasuredTensor; M2.TypeIDisintegration,
RectangularField, ParameterizedRefinement and DerivedDI; the complete M3/M4
models; VonNeumannAlgebras V2 and V4.0.Fields; SchurWeyl Layers 3–5;
CompactGroups Layers 1/4; native finite-kernel RN and disintegration.
The order is ordered pair transforms → effective-support normalization →
smaller-block measures and onto maps → parent maps → local grafting → Young fields.

## Downstream consumers

RelativisticQuantumFieldTheory RQFT2/RQFT3 uses the M2/M4 noncompact representation
models and RQFT11 uses the named helicity models. Those field applications consume
this roadmap's group representations and operator comparisons in the direction
specified in Scope and ownership.

## References

Dooley, *Mathematical Foundations of Quantum Mechanics*: all 34 physical pages are acceptance context. Its source-specific entries are: Mackey theorem and multiplier discussion (physical pp. 16–20), Euclidean and Galilei groups (pp. 20–23), Poincaré orbits and little groups (pp. 23–28), de Sitter and kinematical classification (pp. 29–31), and bibliographic claims (pp. 32–34). The source-specific comparisons above state the hypotheses and corrections required for these acceptance cases.

Grundling, *Mathematics of Quantum Mechanics notes* (225 physical pages). Its operator, Stone, compact rotation and tensor examples support the operator/compact suppliers: physical pp.122–140 have basic operator theory, pp.170–182 have Stone and self-adjoint extensions, and pp.211–225 have angular momentum, hydrogen, tensors, Weyl relations and rotation generators. The readable material supplies no Galilei, Poincaré, Lorentz or Mackey classification premise here; those targets use the Dooley notes and the named primary representation-theory sources. The faint facing halves of physical pp.222–225 remain indeterminate and carry no invented assertion. The indeterminate passages supply no additional theorem premise.

Primary representation-theory references for the noncompact assertions are G. W. Mackey, [“Imprimitivity for Representations of Locally Compact Groups I,” *PNAS* 35 (1949), 537–545](https://doi.org/10.1073/pnas.35.9.537) and [“Unitary Representations of Group Extensions I,” *Acta Mathematica* 99 (1958), 265–311](https://doi.org/10.1007/BF02392428); V. Bargmann, [“Irreducible Unitary Representations of the Lorentz Group,” *Annals of Mathematics* 48 (1947), 568–640](https://doi.org/10.2307/1969129), with its q/K-weight normalization translated in M4; I. M. Gel'fand–M. A. Naimark, [“Unitary representations of the Lorentz group,” *Izv. Akad. Nauk SSSR Ser. Mat.* 11 (1947), 411–504](https://www.mathnet.ru/eng/im3007), especially §8 and the p457 endpoint footnote; V. Bargmann, [“On Unitary Ray Representations of Continuous Groups,” *Annals of Mathematics* 59 (1954), 1–46](https://doi.org/10.2307/1969831); R. Takahashi, [“Sur les représentations unitaires des groupes de Lorentz généralisés,” *Bull. Soc. Math. France* 91 (1963), 289–433](https://doi.org/10.24033/bsmf.1598); J. Dixmier, [“Représentations intégrables du groupe de De Sitter,” *Bull. Soc. Math. France* 89 (1961), 9–41](https://doi.org/10.24033/bsmf.1558); and H. Bacry–J.-M. Lévy-Leblond, [“Possible Kinematics,” *J. Math. Phys.* 9 (1968), 1605–1614](https://doi.org/10.1063/1.1664490). Wightman's primary localization discussion is [“On the Localizability of Quantum Mechanical Systems,” *Rev. Mod. Phys.* 34 (1962), 845](https://doi.org/10.1103/RevModPhys.34.845). These sources identify the classification problems; the chosen topology, cover, signature and operator domains are fixed by this README.

Layers P.3 and P.4 cite Neeb2004 = K.-H. Neeb, [“Abelian extensions of infinite-dimensional Lie groups,” *Travaux Mathématiques* 15 (2004), 69–194](https://arxiv.org/abs/math/0402303) (arXiv:math/0402303); WagemannWockel2015 = F. Wagemann and C. Wockel, [“A cocycle model for topological and Lie group cohomology,” *Trans. Amer. Math. Soc.* 367 (2015), 1871–1909](https://arxiv.org/abs/1110.3304) (arXiv:1110.3304); and Weibel1994 = C. A. Weibel, *An Introduction to Homological Algebra*, Cambridge Studies in Advanced Mathematics 38, Cambridge University Press, 1994, §7.8 (cited by section, for Whitehead's lemmas).

The HilbertModules H3/H5 contracts use Echterhoff2010 = S. Echterhoff, [“Crossed products, the Mackey–Rieffel–Green machine and applications”](https://arxiv.org/abs/1006.4975) (arXiv:1006.4975v4; numbering and pages refer to this version), and DixmierDouady1963 = J. Dixmier and A. Douady, [“Champs continus d’espaces hilbertiens et de C*-algèbres,” *Bull. Soc. Math. France* 91 (1963), 227–284](https://doi.org/10.24033/bsmf.1596).

Freed2012Wigner = D. S. Freed, [“On Wigner's theorem”](https://arxiv.org/abs/1112.2133v3),
Theorem 8, sequence (7) and Example 10 (arXiv v3; the numbering agrees with
Geometry & Topology Monographs 18 (2012), pp.83–89). Kechris1995 = A. S. Kechris,
[Classical Descriptive Set Theory](https://doi.org/10.1007/978-1-4612-4190-4),
§9.B and Theorem 9.10. Whitehead's two locators in Weibel1994 are
Corollaries 7.8.10 and 7.8.12, pp.245–246.
