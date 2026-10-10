# Roadmap: adelic algebraic groups and arithmetic quotients

The adeles let one study the real geometry of an algebraic group and its congruence conditions in
a single locally compact group. This roadmap develops that passage for affine groups over number
fields: the topology on their adelic points, Haar and Tamagawa measures, arithmetic quotients,
reduction theory, approximation, and changes of level. It starts from Mathlib's restricted products
and Tau Ceti's convolution groups of Hopf-algebra points and ends at the theorems that automorphic
forms, Hecke correspondences and arithmetic locally symmetric spaces consume: finiteness of class
numbers, finite volume and compactness criteria for `G(F)\G(𝔸_F)^1`, strong approximation, neat
levels, quaternion norms and compact abelian Fourier limits. Its main reusable objects are
restricted products of Haar measures, the Harish-Chandra logarithm, quotient integration, adelic
heights, fixed-compact Siegel sets and neat levels.

`Suggested.lean` proposes signatures using the existing Lean vocabulary. This document specifies
the mathematics; the suggested forms are aids to choosing names and interfaces. A condition
requiring a supplier's algebraic or analytic language remains a mathematical condition, including
in the checks.

## Scope and ownership

The roadmap owns:

- the shared measure theory of restricted products (Layer AA.0): the Borel structure of a
  restricted product, the product measures on its level subgroups, their directed supremum
  `∏ʳ μ i`, the convergent rescaling that absorbs non-unit local volumes, and the normalized Haar
  measures on the adeles and ideles of a number field. This layer is written for countable
  families of second countable locally compact groups so that function-field applications can
  use it unchanged;
- the adelic points of an affine algebraic `F`-group with their evaluation topology, integral
  models, the restricted-product comparison, the discreteness of the rational diagonal, Weil
  restriction and the concrete groups `G_a`, `G_m`, `GL_n`, unimodularity and compact open levels
  (Layer AA.1);
- rational characters, the Harish-Chandra map `H_G`, the split component `A_G(ℝ)^0` and the
  norm-one subgroup, right-Haar quotient integration, rational quotient measures,
  gauge forms and finite-image Artin convergence factors; Tamagawa measures and scalar
  transport with the Artin and discriminant supplier theorems of AA.2.4–2.5
  (Layer AA.2);
- the generic adelic reduction theory: rational parabolics and Iwasawa integration, real Siegel
  coordinates for one fixed maximal compact, primitive `GL_n` and closed-orbit reduction, adelic
  Siegel sets, finiteness of class numbers, finite volume and compactness criteria, algebraic
  heights, cusps and the Orr–Schnell containment of subgroup Siegel sets (Layer AA.3);
- weak and strong approximation with their torsor and arithmetic-closure bridges, neat elements
  and neat compact open levels, level quotients with their covering and fibre formulas, Hecke
  correspondences, volumes under level change, reductive abelianization, quaternion norms,
  idele classes modulo squares and Fourier limits on compact abelian groups (Layer AA.4);
- the analytic identification of the `GL_2` level quotients over `ℚ` with quotients of the upper
  half-plane by congruence groups, together with its behaviour under change of level, and the
  `GL_1` and definite-quaternion checks of the centre, determinant, measure and stabilizer
  conventions (Layer AA.5).

Locally symmetric spaces, Shimura data and Shimura varieties build on the neat levels of AA.4
and add their own geometric applications. Automorphic forms on reductive groups use the adelic
groups, measures and reduction theory of this roadmap; their representation and spectral theory
lie outside it. The compact abelian Fourier results apply to a specified compact quotient;
constructing a quaternion residual quotient and identifying arithmetic torus images in it lies
outside this scope. The comparison of the `GL_2` quotients with algebraic modular curves lies
outside this roadmap.

Mathlib supplies restricted-product carriers and topologies, finite and probability product
measures, Haar uniqueness, the modular character, fundamental-domain integration, double cosets,
and action groupoids. Tau Ceti supplies convolution groups of Hopf-algebra points,
their coefficient maps, concrete `GL_n` and `G_m` comparisons, algebraic centres, geometric
characters and cotangent/adjoint constructions. This roadmap extends those objects rather than
defining substitutes. In particular, an algebraic equivalence does not by itself supply a
homeomorphism or an identity of pushed measures.

Algebraic structure belongs to the
[Reductive groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md)
and to **ReductiveGroupsPartII**. ReductiveGroups supplies the finite-dimensional
comodule/tensor dictionary (layer 1), closed subgroups and quotients with affineness of `G/H` for
reductive `H` (layer 3; the closed-orbit embedding `H\G ↪ V` is derived in AA.3.3 from layers 1
and 3), character lattices of groups of multiplicative type (layer 4), the centre, derived group
and simply connected covers (layer 6), rational parabolics, Levi decompositions and relative
roots (layer 7). ReductiveGroupsPartII supplies, in RG2.0, the finite-type affine evaluation
topology and compact open local subgroups; in RG2.0a, coefficient-natural Weil restriction, its
tower maps and tensor comparison; in RG2.1, the valuation map of the maximal split central torus
at the finite places (the torus itself is ReductiveGroups, layers 6–7); in RG2.3, reductive
integral models, hyperspecial subgroups and Lang's theorem with Hensel lifting; in RG2.4, the
local decompositions and integration, the Iwasawa decomposition `G(F_v) = K_v P(F_v)` with
`K_v ∩ P(F_v) = P(𝒪_v)` for an arbitrary parabolic and a hyperspecial `K_v`
(`iwasawa-parabolic-integral`), and the Kneser–Tits theorem over a local field
(`kneser-tits-local`). Quasi-splitness at almost all places (AA.4.2,
*isotropic-almost-everywhere*) is proved in this roadmap from those inputs.

The
[Global number fields roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GlobalNumberFields/README.md)
supplies places and the product formula (layer 0), weak approximation (layer 1), finite adeles
(layer 4), full adeles and the discrete rational diagonal (layer 5), additive strong
approximation and idele norm structure (layer 6), and scalar extension of adeles (layer 8).
NumberFieldArithmetic, layer 4, supplies the discriminant identities used in scalar Jacobians.
RepresentationTheory/LieGroups, layer 9, supplies Cartan and Iwasawa theory; simultaneous
self-adjointness of a nested chain is proved in AA.3.3. GlobalQuadraticForms, layer 5,
supplies local and global quadratic isotropy. Chebotarev, layer 10, supplies the density input
for approximation obstructions. ClassFieldTheory, layers 11–12, supplies quadratic idele
characters, reciprocity and the global norm-index theorem. LFunctions #248 supplies
finite-order Hecke analysis through ThetaSeries #286; AA supplies Artin induction and assembly. RepresentationTheory/CompactGroups,
layer 5, supplies compact abelian Fourier theory, and its layer 0 supplies the Haar probability
measure of a compact group; on a compact open factor `B_i` it is the restriction of a local Haar
measure normalized as in AA.0. AlgebraicTopology, stages 5–6, supplies the integral cohomology
of products of circles. LocalFieldsRamification, layer 0, supplies the local-field input for the
distance of `p`-adic roots of unity from one (AA.4.3). SmoothRepresentationsOfLocalGroups supplies ring-valued Haar measures (SR.1.1)
; the arbitrary-characteristic local modulus is supplied by RG2.4,
`LocalIntegration.modularCharacter_eq_adjointModulus`. IntegralLattices, 2F–2G, supplies
Minkowski reduction for integral lattices. The
[Fuchsian orbifolds roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/FuchsianOrbifolds/README.md)
supplies the coarse quotient Riemann surface `Γ\ℍ` of a Fuchsian group (layers 0–1), its cusp
compactification and the maps induced by conjugation and finite-index inclusions (layer 4), and
degree theory for finite holomorphic maps (layer 5); AA.5 identifies the `GL_2` components with
these quotients for its congruence groups.

Tau Ceti already provides the topological splitting of finitely many factors of a restricted
product (`awayDecomposition`, module `Topology/Algebra/RestrictedProduct/Away/Decomposition`) and
the homeomorphism of the infinite adeles with the mixed space
(`InfiniteAdeleRing.homeomorphMixedSpace`, module `NumberTheory/NumberField/Global/Adeles/Basic`);
AA.0 consumes both and adds only their measure clauses. The
[restricted-products roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/RestrictedProducts/README.md)
specifies the completed topological interfaces; the pinned declarations and their measure
extensions are listed below.

The supplier contracts include positive convergent products of reals with summable error: Mathlib
`Real.multipliable_one_add_of_summable`, `Real.rexp_tsum_eq_tprod` and
`Multipliable.prod_mul_tprod_compl` (the summable-series-and-logarithm reading of
[Sutherland], §23.3, p. 6). Integral points of a model are compact open in `G(F_v)`:
ReductiveGroupsPartII, RG2.0.3 (integral points compact open). Closed subgroups give closed
embeddings of adelic points, and `(G × G′)(𝔸_F) ≃ G(𝔸_F) × G′(𝔸_F)`: ReductiveGroupsPartII,
RG2.0.1 (functoriality of the point topology, for every topological ring), with Tau Ceti
`quotientPointsSubgroup` and `TauCeti.AffineGroup.Product.pointsMulEquiv` — the closed-subgroup
statement is [Conrad], Proposition 2.1, p. 2, with Tau Ceti
`TauCeti.CommHopfAlgCat.quotientPointsSubgroup` and `NumberField.AdeleRing.instT2Space` over the
RG2.0 topology, the closed-image clause being [Conrad], Example 2.3, p. 3; the product statement
is [Conrad], Proposition 2.1, proof, p. 2, with `TauCeti.AffineGroup.Product.pointsMulEquiv`.
Volumes of commensurable compact open subgroups, `μ(U)/μ(U′) = [U : U ∩ U′]/[U′ : U ∩ U′]`
([Borel], §1.7, p. 8): SmoothRepresentationsOfLocalGroups, SR.1.1 (ring-valued Haar measures) and
Mathlib `Subgroup.index_mul_measure`, applied with AA.1.5 and AA.0.2 through
`MeasureTheory.Subgroup.index_mul_measure`. A division ring has no unipotent unit other than `1`
([Milne], §3, Example 3.4, p. 34, in the setting of Mathlib `QuaternionAlgebra`): Mathlib
`IsNilpotent.eq_zero`. The `GL_1` class number, `F^×\𝔸_{F,f}^×/Ô^× ≃ Cl(𝒪_F)` ([Borel],
Proposition 2.2, p. 11, with Mathlib `NumberField.classNumber`): Tau Ceti
`IsDedekindDomain.FiniteAdeleRing.quotientEquivClassGroup` (with `integralUnits`), also
GlobalNumberFields, layer 4, consumed through AA.1.4 and AA.3.4.

The following Tau Ceti and roadmap statements are the local or algebraic halves of targets that
remain here, which add only the adelic or measure clause: `restrictedProductCongr` and
`restrictedProductCongrRight` with their continuity (AA.0.3); the point topology, its local
compactness, functoriality, centre and the `G_a`, `G_m`, `GL_n` identifications of RG2.0 at
`R = 𝔸_F` (AA.1); the Weil-restriction point adjunction of RG2.0a with GlobalNumberFields'
`adeleBaseChangeEquiv` (AA.1.4); local unimodularity and the local Iwasawa factorization and
integration formula of RG2.4.4 (AA.1.5, AA.3.1); the modulus character of a local parabolic,
RG2.4 `LocalIntegration.modularCharacter_eq_adjointModulus` (AA.2.2); Mathlib's `QuotientGroup` instances and
`inducedMeasure` for normal subgroups, and `QuotientGroup.integral_eq_integral_automorphize` for
discrete ones (AA.2.2–AA.2.3); Tau Ceti `exists_isFundamentalDomain_of_properlyDiscontinuousSMul`
(AA.2.3); Minkowski reduction for integral lattices, IntegralLattices 2F–2G (AA.3.2); the local
Kneser–Tits input of RG2.4.4 (AA.4.2); Tau Ceti `log_unitFiltration_injective` (AA.4.3); Tau Ceti
`DoubleCoset.quotientMapOfLELeft`, `cosetToOrbitRelMapFiber_surjective`,
`finite_fiber_orbitRel_map_of_isFiniteRelIndex` and `HeckeCoset.degree_eq_relIndex`
(AA.4.4–AA.4.5); `IdeleClassGroup.isCompact_normOne`, `ideleClassNorm_surjective`,
`unitsCongruenceSubgroup_finiteIndex`, Mathlib `isPretransitiveGL2R` and FuchsianOrbifolds
layer 4 (AA.5). Tau Ceti's `ideleNorm`, `ratFundamentalDomain`, `weakApproximation_denseRange`
and `FiniteAdeleRing.denseRange_algebraMap` are the idele norm, the fundamental domain
`[0,1) × ∏ ℤ_p` and the `G_a` cases of approximation used below.

## Conventions

- **Groups and points.** `F` is a number field and `𝒪_F` its ring of integers. An affine
  algebraic `F`-group `G` is represented by a finite-type commutative Hopf `F`-algebra `H`.
  Coordinate morphisms are contravariant; `G(R)` is the existing convolution group of
  `F`-algebra maps `H → R`. Affine points carry the evaluation topology, and every homogeneous
  or double quotient carries the quotient topology. Finite exceptional sets contain the infinite
  places; integral-model indices refer to their finite part. Smoothness, connectedness,
  reductivity and simple connectedness are hypotheses where stated, not assumptions on every
  affine group.
- **Adeles and normalizations.** `𝔸_F`, `𝔸_{F,f}`, `F_∞` and `𝔸_F^S` are the full adeles, the
  finite adeles, the product of the infinite completions and the adeles away from `S`. Absolute
  values satisfy the product formula; at complex places the ordinary modulus is squared.
  Additive measures are normalized by `vol(𝒪_v) = 1`, `dx` at real places and `2 dx dy` at
  complex places. Ordinary multiplicative idele Haar measure has `vol(𝒪_v^×) = 1`; the form
  measure `|dx/x|` instead gives that subgroup volume `1 − q_v⁻¹`.
- **Modular characters and parabolic coordinates.** Mathlib's modular character `Δ` is fixed by
  `(right multiplication by g)_* μ_left = Δ(g) μ_left`. For mutually inversion-normalized Haar
  measures, `dμ_left = Δ⁻¹ dμ_right`. Integration on `H\G` uses right Haar measures on `H` and
  `G`, with `Δ_G` restricted to `H` equal to `Δ_H`. For a parabolic `P = N ⋊ M` put
  `δ_P(m) = |det(Ad(m) | Lie N)|_𝔸`; then `Δ_P(nm) = δ_P(m)`, left Haar measure in `(n, m)`
  coordinates is `δ_P(m)⁻¹ dn dm` and right Haar measure is `dn dm`. These conventions also govern
  the inversion bridge to Mathlib's right-coset unfolding.
- **Characters and the split centre.** For connected reductive `G`, `X*_F(G)` is the
  rational-character lattice and `a_G = Hom_ℤ(X*_F(G), ℝ)`. `A_G` is the largest `ℚ`-split central
  torus of `Res_{F/ℚ} G`, and `A_G(ℝ)^0` its positive real part. Its dimension is the
  rational-character rank; it need not be the whole archimedean centre. `G(𝔸)^1 = ker H_G`.
  Identifying `G(𝔸)^1` with `G(𝔸)/A_G(ℝ)^0` transports the quotient measure; it does not
  identify `G(𝔸)^1` with `G(F_∞)^1 × G(𝔸_f)`.
- **Gauge forms.** A gauge form is a nonzero invariant top-degree form,
  obtained from the top exterior power of the identity cotangent space. Basis-dependent scalar
  Jacobians at individual places are retained until the global discriminant identity is applied.
- **Siegel sets and neatness.** For real Siegel sets the maximal compact `K` is fixed throughout a
  comparison. Cartan compatibility is part of subgroup containment. Neatness is defined through a
  faithful algebraic representation, a closed immersion, at one fixed embedding `F → ℂ`; it is
  independent of that embedding. It differs from applying neatness after restriction of scalars
  to `ℚ`. A neat level means that every rational intersection `G(F) ∩ xUx⁻¹` is neat.
- **Standing analytic inputs.** The targets below include their intermediate mathematical
  bridges, and these bridges are mathematical prerequisites of the corresponding statements, not
  implicit consequences of the rank-one examples. Gauge measures require nonarchimedean analytic
  charts and change of variables, finite-field order estimates, and positivity and induction for
  the Artin leading coefficient. Approximation
  requires the `p`-adic analytic closed-subgroup theorem, Borel density, local torsor vanishing
  and the simply connected Hasse principle. Arithmetic closures over general number fields need
  native-field Lie algebras and exclusion of graphs linking distinct completions;
  `ℚ_p`-Zariski density alone is insufficient. Reduction requires general-dimensional
  Hermite–Minkowski reduction, finite overlap, closed-orbit weight bounds and a
  geometry-of-numbers count for rational coordinates; discreteness and compactness alone do not
  give a polynomial counting estimate. Parabolic integration must include Levi and unipotent
  factors and disconnected reductive cases where stated. Cholesky bounds, separation of deep
  parabolic ends and reductive subgroup pullback are separate bridges.
- **Locators.** Throughout the layers, a source locator attaches to the precise target beside
  it. The bibliography fixes the editions; arXiv page numbers and journal page numbers are
  distinguished. Derivations from a source's special case are identified as such. Local notation
  in a target supplements these standing conventions.

The unvalued relative-root core is `AlgebraicRelativeRoots` in
ReductiveGroupsPartII, refining ReductiveGroups layer 7.
`GeometricRoots.Character`, `AlgebraicRelativeRoots.Root`, and
`relativeWeightSpace` here use that core's characters and counit-derivation weight
spaces. `RelativeRootData.rootEquiv` identifies its finite support with the same
root subtype by the identity on characters. AA adds positive systems, `a_P`,
logarithms and reduction interfaces; RG2 adds valuations and buildings.
`Reduction.localModulus_eq_rg2` compares the products on the identical torus,
positive-root set, absolute value and point, with the same weight multiplicities.

**Checks.** `localModulus_same_data` compares these two local moduli on the shared
carrier; the empty positive set gives one and a single weight of multiplicity two
contributes the square (`localModulus_empty`, `localModulus_singleton`).

## Exact supplier contracts

| Object | Exact supplier and file | Use here |
|---|---|---|
| Relative roots and weights | RG2 `AlgebraicRelativeRoots.Character`, `.Root`, `.weightSpace`, `.localModulus`; `ReductiveGroupsPartII/Suggested.lean` | Shared algebraic carriers extending ReductiveGroups layer 7; AA adds reduction data. |
| Geometric torsors and classes | SchemeAndStackFoundations #779, §§1.15, 2.3: `Torsor.baseChange`, `Torsor.trivial_iff_section`, `Torsor.hom_isIso`, `torsorClasses G := NonabelianH1 (fppfTopology.over S) h_G`, `torsorClasses.mk_eq_one_iff` | AA.4.1 owns the affine coordinate comparison, its naturality and the class-set Hasse statement; no second geometric torsor owner. |
| Finite-image Artin factors | AA.2.4 owns `FiniteImageArtin.localFactor`, `localFactor_induction`, `leadingCoeff_nonzero`, `characterLeadingCoeff_pos` | Determinants on inertia invariants and the nonzero leading coefficient at one. Chebotarev layer 10 supplies Dirichlet density only. |
| Linear Haar scaling | [MassFormula #226, Layer 2](https://github.com/0stellensatz/TauCetiRoadmap/blob/c4f7f7be6186fcf26cc8a7ef678b5c5e90a53cee/TauCetiRoadmap/MassFormula/README.md) | One generic DVR lattice-index theorem (`q^length`) and linear Haar image law `μ(M A)=|det M| μ(A)`; arbitrary measurable sets require regular Haar measure. AA owns completion, nonlinear charts, gauge forms, extension-basis Jacobians and the global discriminant. |
| Rational tuple heights | [ArithmeticHeights #287, §0.1](https://github.com/rwst/TauCetiRoadmap/blob/b8aec35b6cd8e68031df1038a2cae63088be4a17/TauCetiRoadmap/ArithmeticHeights/Suggested.lean): `NumberField.arakelovMulHeight`, `arakelovMulHeight_eq`, `arakelovMulHeight_pow_finrank`, `arakelovMulHeight_rpow_comp` | The relative finite-sup/archimedean-ℓ² height of the entry tuple of `(ρ(g),ρ(g)⁻¹)` agrees with `Reduction.height` on rational points. AA retains adelic properness and quantitative counting. |
| Finite-order Hecke analysis | [LFunctions #248, layers 5–6](https://github.com/roed-math/TauCetiRoadmap/blob/e632e3a41fc257fce7b0d9938d48507b962f4fbb/TauCetiRoadmap/LFunctions/Suggested.lean): `PrimitiveRayClassCharacter`, `heckeLFunctionC`, `heckeLFunctionC_eq`, `heckeLFunctionC_induced`, `heckeLFunctionC_eq_primitive`, `eulerCorrection`, `heckeLFunction_ne_zero_of_one_le_re` | GlobalNumberFields supplies ray class carriers; ArithmeticDirichletSeries supplies ideal series; ThetaSeries #286 supplies Poisson/Mellin analysis. AA uses the nonzero germ at one for nontrivial primitive finite-order characters. |
| One-dimensional Artin–Hecke comparison | ClassFieldTheory reciprocity, with arithmetic Frobenius, plus AA `FiniteImageArtin.oneDimensional_eq_hecke` | For a finite-order Galois character χ, choose its primitive ray class character with value χ(Frob_v) at unramified v. Match conductor primes using inertia invariants. For a larger modulus multiply the primitive function by #248's `eulerCorrection`; state equality on `Re s > 1` and of meromorphic germs, including ramified factors. |

| Trace discriminants and lattice indices | `NumberField.discr_eq_of_integralBasis`, `TauCeti/NumberTheory/NumberField/Discriminant/OfIntegralBasis.lean`; `Algebra.discr_of_matrix_vecMul`, `Mathlib/RingTheory/Discriminant.lean`; `AddSubgroup.index_eq_natAbs_det`, `Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean` | The local lattice covolumes and archimedean determinants in AA.2.5. |

| Scheme centralizers, normalizers and character evaluation | `TauCetiRoadmap.ReductiveGroupsPartII.BruhatTits.GeometricRoots.characterValue`, `characterValue_coe`, `centralizer`, `normalizer`, `centralizerIdeal`, `centralizerIdeal_points_iff`; `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean` | AA.3.1 spells the same contracts on the unbundled coordinate algebra `H` and the pinned `quotientPointsSubgroup`. The root-ray helper additionally accepts non-root characters and uses the pinned dynamic contraction subgroups. |
| Arithmetic level carrier | `TauCetiRoadmap.AdelicAlgebraicGroups.Neat.rationalLevelAt`; `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` | `Reduction.levelArithmetic` only reverses argument order; the arithmetic discreteness and component results consume the same subgroup. |
| Algebraically closed central-simple splitting | Mathlib `IsSimpleRing.exists_algEquiv_matrix_of_isAlgClosed`, `Mathlib/RingTheory/SimpleModule/IsAlgClosed.lean`; `Algebra.IsCentral`, `Mathlib/Algebra/Central/Defs.lean`; `Module.Basis.baseChange`, `Mathlib/LinearAlgebra/TensorProduct/Basis.lean`. | `divisionNormOne_compact` uses this matrix splitting and the extended regular basis; its reduced-norm-one Hopf ideal and compact arithmetic quotients are the additional targets. |
| Semialgebraic sets | `TauCeti.IsSemialgebraic`, `TauCeti.isSemialgebraic_def`; `TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean` | AA.3.2 uses this exact polynomial set algebra on matrix-entry coordinates; the new assertions concern the horospherical graph, windows and reduced forms. |
| Adjoint weight spaces | `Derivation.adjointWeightSpace`, `Derivation.mem_adjointWeightSpace_iff_universalPointAction`, `Derivation.isInternal_adjointWeightSpace`; `TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean` | `relativeWeightSpace` instead realizes the geometric weight space inside counit derivations for a Hopf-ideal split torus; the supplier uses the cotangent dual and a specified split-torus coordinate map. |
| Derived subgroup | `TauCeti.CommHopfAlgCat.derivedDefiningIdeal`; `TauCeti/Algebra/AlgebraicGroup/Derived/Basic.lean`; `TauCetiRoadmap.ReductiveGroupsPartII.ZExtension.derivedIdeal`, `TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean` | `roots_empty_iff_derived_anisotropic` specifies the derived Hopf ideal by this universal property (largest ideal killed by every algebra-valued commutator) and tests all rational cocharacters; no independent derived-subgroup definition. |
| Geometric identity component | `TauCeti.HopfAlgebra.identityComponentHopfIdeal`; `TauCeti/Algebra/AlgebraicGroup/Connected/Comultiplication.lean` | This supplier assumes an algebraically closed field. `exists_identityComponentIdeal` gives the number-field descent by the largest geometrically connected closed subgroup; the disconnected finite-volume criterion uses that ideal. |
| Constant-form matrix subgroup | `TauCeti.ConstantForm.definingHopfIdeal`, `TauCeti.ConstantForm.mem_definingPointsSubgroup_iff`; `TauCeti/Algebra/AlgebraicGroup/ConstantForm/Basic.lean` | `twistedOrthogonal` specifies the determinant-one restriction of this equation for the explicit rational form in AA.3.7; it does not define another general orthogonal-group construction. |
| Connected reductivity | `TauCeti.reductiveCommHopfAlgProperty`; `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean` | `ReductiveComponents` drops connectedness in characteristic zero for the Borel–Harish-Chandra statements. |
| Homogeneous quotient sheaf | `TauCeti.CommHopfAlgCat.fppfHomogeneousQuotient`; `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean` | `SiegelGeometry.AffineQuotient` adds an affine faithfully flat realization with exact scheme fibres. Inversion identifies the supplier’s `G/H` convention with `H\G` here. |
| Matrix points | `TauCeti.GeneralLinear.pointsMulEquiv`, `TauCeti.AlgHom.mapDomain`; `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/FunctorOfPoints.lean`, `TauCeti/Algebra/AlgebraicGroup/Hopf/Map.lean` | `SiegelGeometry.matrixPoints` is their composition for a specified coordinate representation, not a separate point construction. |
| Quaternion reduced norm | `QuaternionAlgebra.normForm`, `QuaternionAlgebra.normForm_apply`; `TauCeti/Algebra/Quaternion/NormForm.lean` | The norm-image theorems use this quadratic form directly. |
| Idele norm | `TauCeti.GlobalNumberFields.ideleNorm`, `TauCeti.GlobalNumberFields.continuous_ideleNorm`, `TauCeti.GlobalNumberFields.ideleNorm_unitEmbedding`; `TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Basic.lean` | `NumberField.ideleNorm` only changes the codomain to `ℝ` for logarithms; multiplicativity and positivity come from the supplier's homomorphism into positive units. |
| Compact norm-one idele classes | `TauCeti.GlobalNumberFields.IdeleClassGroup.isCompact_normOne`; `TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Compact.lean` | Supplies the compactness assertion in Layer 5 directly. |
| Finite-factor decomposition | `TauCeti.awayDecomposition`, `TauCeti.continuous_awayDecomposition`, `TauCeti.continuous_awayDecomposition_symm`; `TauCeti/Topology/Algebra/RestrictedProduct/Away/Decomposition.lean` | `splitFinite` bundles these as a topological group equivalence on finset-indexed factors; the new assertion is measure compatibility. |
| Restricted-product coordinate maps | `TauCeti.restrictedProductCongr_apply`; `TauCeti/Topology/Algebra/RestrictedProduct/Congr/Basic.lean`. `TauCeti.awayDecomposition_fst`, `TauCeti.awayDecomposition_snd`, `TauCeti.awayDecomposition_symm_apply_of_mem`, `TauCeti.awayDecomposition_symm_apply_of_notMem`; `TauCeti/Topology/Algebra/RestrictedProduct/Away/Decomposition.lean` | Supply the coordinate formulas of the bundled topological equivalences. |
| Modular character under conjugation | `MeasureTheory.Measure.modularCharacter`; `Mathlib/MeasureTheory/Group/ModularCharacter.lean`, with `map_mul` and `map_inv` | Its commutative codomain makes conjugation invariance a general homomorphism identity. |
| Measurable fundamental domains | `MeasureTheory.Measure.exists_isFundamentalDomain_of_properlyDiscontinuousSMul`; `TauCeti/MeasureTheory/Group/ProperlyDiscontinuous.lean` | Apply to the countable discrete rational subgroup acting freely by translation; its Borel domain supplies the existence statement directly. |
| Exponential tail integral | `integral_exp_mul_Ioi`; `Mathlib/Analysis/SpecialFunctions/ImproperIntegrals.lean` | Finite-product integration gives the relative-chamber integral. |
| Change of double-coset level | `DoubleCoset.quotientMapOfLELeft`; `TauCeti/GroupTheory/DoubleCoset/Map.lean` | The level map here changes the right subgroup; its defining equation sends the class of `g` to the class of the same `g`. |


All names in this section are part of the dependency contract. Each is cited again in the
*Needs* clause of the target that consumes it.

### From Mathlib

Restricted products: `RestrictedProduct.topologicalSpace_eq_iSup`,
`RestrictedProduct.isOpenEmbedding_inclusion_principal`,
`RestrictedProduct.isOpenEmbedding_structureMap`, `RestrictedProduct.continuous_dom`,
`RestrictedProduct.mapAlong_continuous`, `RestrictedProduct.locallyCompactSpace_of_group`,
`RestrictedProduct.isTopologicalGroup`, `RestrictedProduct.unitsEquiv`,
`RestrictedProduct.evalRingHom`. Measure theory: `MeasureTheory.Measure.haarMeasure`,
`MeasureTheory.Measure.IsHaarMeasure`, `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.pi_pi`,
`MeasureTheory.Measure.infinitePi`, `MeasureTheory.Measure.infinitePi_map_restrict`,
`MeasureTheory.Measure.prod`, `MeasureTheory.integral_prod`,
`MeasureTheory.Measure.isMulLeftInvariant_eq_smul`, `MeasureTheory.Measure.modularCharacter`,
`MeasureTheory.Measure.map_right_mul_eq_modularCharacterFun_smul`,
`MeasureTheory.Subgroup.index_mul_measure`, `Subgroup.index_mul_measure`,
`MeasureTheory.IsFundamentalDomain`, `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`,
`MeasureTheory.QuotientMeasureEqMeasurePreimage`, `QuotientGroup.integral_eq_integral_automorphize`,
`RealRMK.integral_rieszMeasure`, `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`,
`MeasureTheory.Lp`, `MonoidHom.isOpenMap_of_sigmaCompact`, and the general theory of locally
compact groups, quotient topologies and summable series. Number fields: `NumberField.AdeleRing`,
`IsDedekindDomain.FiniteAdeleRing`, `NumberField.IdeleGroup`, `NumberField.IdeleClassGroup`,
`NumberField.mixedEmbedding.volume_fundamentalDomain_stdBasis`, `NumberField.mixedEmbedding.norm`,
`NumberField.prod_abs_eq_one`,
`Nat.Primes.not_summable_one_div`, `Real.rexp_tsum_eq_tprod`,
`Multipliable.prod_mul_tprod_compl`, `NumberField.dedekindZeta_residue`,
`NumberField.dedekindZeta_residue_pos`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`,
`NumberField.classNumber`, `NumberField.Units.rank`, `NumberField.Units.unitLattice_rank`,
`NumberField.Units.instZLattice_unitLattice`, `Set.integer`, `QuaternionAlgebra`,
`IsNilpotent.eq_zero`, `Real.multipliable_one_add_of_summable`, finite presentation and
localization. Hopf and linear algebra: `AlgHom.prod`, `GroupLike`, `GroupLike.instCommGroup`, `Subgroup.index_pi`,
`IsGroupLikeElem.map`, the convolution monoid on `WithConv (C →ₐc[R] A)`,
`AddMonoidAlgebra.mapDomainBialgHom`, `Algebra.TensorProduct.cancelBaseChange`,
`Ideal.Cotangent`, `Bialgebra.counitAlgHom`, `exteriorPower.ιMulti`, `exteriorPower.map`,
`Module.evalEquiv`, `TensorProduct.lid`, `Subgroup.index_prod`, `Subgroup.isClosed_of_isDiscrete`.
Double cosets, actions and quotients: `DoubleCoset.Quotient`, `DoubleCoset.eq`,
`CategoryTheory.ActionCategory`, `CategoryTheory.ActionCategory.stabilizerIsoEnd`, `ProperlyDiscontinuousSMul`, `isOpenMap_quotient_mk'_mul`,
`isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`,
`t2Space_of_properlyDiscontinuousSMul_of_t2Space`. Modular groups and the upper half-plane:
`ModularGroup.exists_smul_mem_fd`, `UpperHalfPlane.glAction`, `UpperHalfPlane.moebius_im`,
`UpperHalfPlane.denom_ne_zero_of_im`, `UpperHalfPlane.coe_smul`, `Matrix.GeneralLinearGroup.det`,
`isPretransitiveGL2R`, `CongruenceSubgroup.Gamma`, `CongruenceSubgroup.Gamma0`,
`CongruenceSubgroup.Gamma1`, `Subgroup.IsArithmetic`, `Subgroup.IsArithmetic.conj`,
`Subgroup.IsArithmetic.properlyDiscontinuous`, `Subgroup.IsArithmetic.discreteTopology`.

Mathlib has no measure on a restricted product, no evaluation topology on the adelic points of a
Hopf algebra, no Harish-Chandra map, no Tamagawa measure, no Siegel sets and no neatness; each is
built here on the carriers listed above.

### From Tau Ceti

Hopf-algebra points and coordinates: `TauCeti.HopfAlgebra.points`,
`TauCeti.HopfAlgebra.mapPoints`, `TauCeti.HopfAlgebra.pointsFunctor`,
`TauCeti.CommHopfAlgCat.pointsFunctor`, `TauCeti.CommHopfAlgCat.baseChangePointsMulEquiv`,
`TauCeti.CommHopfAlgCat.quotientPointsSubgroup` (also cited as `quotientPointsSubgroup`),
`TauCeti.AffineGroup.Product.pointsMulEquiv`, `TauCeti.CommHopfAlgCat.centerDefiningIdeal`,
`TauCeti.CommHopfAlgCat.centerPointsSubgroup_eq_center`,
`TauCeti.CommHopfAlgCat.geometricCharacterGroup`,
`TauCeti.CommHopfAlgCat.instGeometricCharacterGroupGaloisAction`,
`TauCeti.CommHopfAlgCat.isMulTorsionFree_geometricCharacterGroup`,
`TauCeti.geometricallyReducedCommHopfAlgProperty`,
`TauCeti.geometricallyConnectedCommHopfAlgProperty`,
`TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`, `TauCeti.Bialgebra.CotangentSpace`,
`Derivation.adjointPointRepresentation`, `Derivation.adjointAction`. Concrete groups:
`TauCeti.GeneralLinear.pointsMulEquiv`, `TauCeti.GeneralLinear.pointsMulEquiv_determinantPoints`,
`TauCeti.GeneralLinear.determinantCoordinateMap`, `TauCeti.GeneralLinear.determinantGroupLike`,
`TauCeti.MultiplicativeGroup.pointsMulEquiv`, `TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue`.
Parabolics: `TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.unipotent`,
`TauCeti.Cocharacter.leviDecompositionMulEquiv`. Their modules are
`Algebra/AlgebraicGroup/Dynamic/Parabolic.lean` and
`Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Basic.lean`; the latter's
`leviDecompositionMulEquiv_apply` pins multiplication of the unipotent and Levi factors.
`TauCeti.Cocharacter.levi` is the centralizer factor in the same dynamic API.
`TauCeti.splitTorusCommHopfAlgProperty` comes from
`Algebra/AlgebraicGroup/SplitTorus/Basic.lean`; `RootPairing` is Mathlib's abstract root carrier.
AA.3.1 adds its realization in counit derivations, with characters and the rational normalizer
quotient of the specified maximal split torus. `ReductiveGroupsPartII` supplies the point
and Weil-restriction carriers; its abstract valued root data, apartments and parahorics remain
local suppliers, rather than replacements for this adjoint realization.
These are point-functor decompositions. The algebraic Levi data of AA.3.1 additionally
specify closed subgroup schemes by Hopf ideals and their unipotence and reductivity.
Global number fields:
`IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion`,
`NumberField.AdeleRing.instT2Space`, `TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup`,
`TauCeti.GlobalNumberFields.isClosed_principalSubgroup`,
`TauCeti.GlobalNumberFields.normalizedAbsValue`,
`TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`,
`TauCeti.GlobalNumberFields.weakApproximation_denseRange`,
`TauCeti.dedekindZeta_eulerProduct_hasProd`,
`IsDedekindDomain.FiniteAdeleRing.quotientEquivClassGroup`, `QuaternionAlgebra.normForm`,
`Matrix.SpecialLinearGroup.map_intCast_zmod_surjective`. Reduction and levels: `TauCeti.cholesky`,
`TauCeti.cholesky_mul_transpose`, `HeckeCoset.degree_eq_relIndex`,
`DoubleCoset.quotientMapOfLELeft`, `IsQuotientCoveringMap.isCoveringMap_of_comp`,
`exists_isFundamentalDomain_of_properlyDiscontinuousSMul`, `log_unitFiltration_injective`,
`awayDecomposition`, `InfiniteAdeleRing.homeomorphMixedSpace`.

### From TauCetiRoadmap.ReductiveGroups

Layer 1 (finite-dimensional comodules and the tensor dictionary), layer 3 (closed subgroups and
quotients, affineness of `G/H` for reductive `H`), layer 4 (character lattices of groups of
multiplicative type), layer 6 (centre, derived group, simply connected covers) and layer 7
(rational parabolics, Levi decompositions, relative roots, maximal split tori and relative Weyl
groups). Cartier's theorem, that every affine group in characteristic zero is smooth and
geometrically reduced, is a standing input of that roadmap and is assumed here wherever
`rational-characters-free` is applied.

### From TauCetiRoadmap.ReductiveGroupsPartII

RG2.0 (the finite-type affine evaluation topology over any topological ring, its local
compactness and functoriality, compact open local subgroups, and RG2.0.3, integral points
compact open); RG2.0a (coefficient-natural Weil restriction with its point adjunction, tower maps
and tensor comparison); RG2.1 (the valuation map of the maximal split central torus at the finite
places); RG2.3 (reductive integral models, `reductive-model`, which is local over a discrete
valuation ring and gives that a group with a reductive `𝒪_v`-model is unramified, hence
quasi-split at `v`; hyperspecial subgroups, `hyperspecial-vertices`; Lang's theorem with Hensel
lifting); RG2.4 (local unimodularity, the local Iwasawa factorization and integration formula of
RG2.4.4, `iwasawa-parabolic-integral`, and the local Kneser–Tits theorem, `kneser-tits-local`).

### From TauCetiRoadmap.GlobalNumberFields

Layer 0 (places and the product formula), layer 1 (weak approximation for `G_a`), layer 4 (finite
adeles), layer 5 (full adeles and the discrete rational diagonal), layer 6 (additive strong
approximation, the idele norm and its structure, `IdeleClassGroup.normOne`, and the compactness
of `C_F^1`), and layer 8 (scalar extension of adeles,
`adeleBaseChangeEquiv`, with its local factors).

### From other roadmaps

NumberFieldArithmetic, layer 4 (discriminant identities). RepresentationTheory/LieGroups, layer 9
(Cartan and Iwasawa theory). RepresentationTheory/CompactGroups, layer 0 (Haar probability on a
compact group) and layer 5 (compact abelian Fourier theory). GlobalQuadraticForms, layer 5 (local
and global quadratic isotropy). Chebotarev, layer 10 (the density input for approximation
obstructions only). LFunctions #248, layers 5–6, consumes ThetaSeries #286 for
finite-order Hecke continuation and nonvanishing; AA assembles finite-image Artin functions. ClassFieldTheory, layers 11–12
(quadratic idele characters, reciprocity, the global norm-index theorem). AlgebraicTopology,
stages 5–6 (integral cohomology of products of circles). LocalFieldsRamification, layer 0
(the input for the distance of `p`-adic roots of unity from one).
SmoothRepresentationsOfLocalGroups, SR.1.1; RG2.4 local integration. IntegralLattices, 2F–2G. FuchsianOrbifolds,
layers 0, 1, 4 and 5.

### Analytic and integral dependencies

AA.2.4 builds the finite reductive-group order formula from [Dudas–Michel],
Propositions 7.12(iii) and 7.14, pp. 27–28. AA.4.2 builds the `ℚ_p`-analytic
closed-subgroup input of [Platonov–Rapinchuk–Rapinchuk], Theorem 3.12, p. 136. The integral
models in AA.4.6 and *isotropic-almost-everywhere* require reductive fibres after
inverting finitely many primes. These inputs need the generality specified at each use.

## How to read the build

`README.md` is normative; `Suggested.lean` pins names and signatures for the central objects and
is not exhaustive. The layers are built in order. AA.0 is the Borel structure and the Haar
measures of a restricted product and of the adeles and ideles; everything measure-theoretic later
is an instance of it. AA.1 puts the evaluation topology on the adelic points of a Hopf algebra,
compares them with a restricted product of local groups through an integral model, and
establishes the discrete rational diagonal, Weil restriction, the concrete groups, unimodularity
and compact open levels. AA.2 separates the positive split centre from the norm-one subgroup
through the character lattice, develops right-Haar quotient integration, applies it to rational
and central quotients, and fixes the Tamagawa normalization through gauge forms and convergence
factors. AA.3 is reduction theory: rational parabolics and Iwasawa integration, real Siegel
coordinates for a fixed maximal compact, the primitive `GL_n` and closed-orbit reductions, their
adelic consequences (finite class sets, finite volume, compactness), heights, cusps and subgroup
orbit maps. AA.4 is approximation, neatness, level quotients, Hecke maps and the residual
quotient. AA.5 works the conventions out on `GL_1`, `GL_2` over `ℚ` and definite quaternion
groups. In *Needs* clauses, `AA.k.n` is a subsection of this roadmap, a slug in italics such as
*level-measure* is the target of that name, and roadmap layers are cited as in the supplier
contracts.

## Layer 0: restricted products of Haar measures

For the measure targets let `ι` be countable, `G_i` second countable locally compact Hausdorff
groups, and `B_i` open subgroups compact at almost every index. Measures `μ_i` are left Haar
unless a target explicitly allows general measures. Purely topological finite-splitting results
allow arbitrary index sets. Use the restricted-product carrier and topology already in Mathlib.
Build its Borel structure from countably many open principal pieces, put probability measures on
the compact tails, and glue compatible level measures. The convergent rescaling construction
handles the non-unit local volumes needed for Tamagawa measure.

### 0.1 Borel structure and local normalization

- **The restricted product of countably many second countable groups is second countable.** Let
  `ι` be countable, let each `G i` be a second countable topological group and each `B i` an open
  subgroup of `G i`. Prove that `Πʳ i, [G i, B i]` is second countable, and consequently that its
  Borel σ-algebra is generated by the boxes `Π i, C i` with `C i` open in `G i` and `C i = B i`
  for all but finitely many `i` ([Sutherland], §23.3, p. 6). *Needs:* Mathlib
  `RestrictedProduct.topologicalSpace_eq_iSup`, `RestrictedProduct.isOpenEmbedding_inclusion_principal`.
- **Borel structure on a restricted product.** For the data of AA.0, define
  `RestrictedProduct.borelSpace`: `Πʳ i, [G i, B i]` carries the Borel σ-algebra and is a
  `BorelSpace`. Prove `RestrictedProduct.measurable_eval` (each coordinate map `x ↦ x i` is
  measurable), `RestrictedProduct.measurableSet_box` (for Borel `C i` with `C i = B i` for all but
  finitely many `i`, the box `{x | ∀ i, x i ∈ C i}` is measurable),
  `RestrictedProduct.measurable_inclusion` (the inclusion of each principal piece
  `Πʳ i, [G i, B i]_[𝓟 S]` is measurable) and `RestrictedProduct.borel_eq_generateFrom_boxes` (for
  countable `ι` the Borel σ-algebra is generated by the boxes with open factors). With it the
  restricted product is a Borel space in which every open subgroup `U_S`, every such box and
  every inclusion of a principal piece is measurable ([Sutherland], §23.3, p. 6). *Needs:* AA.0.1;
  Mathlib `RestrictedProduct.topologicalSpace_eq_iSup`.

  **Checks.**
  - The set `{x | ∀ i, x i ∈ B i}` is measurable.
  - For `ι = ℕ`, `G i = ℤ/4` and `B i = 2ℤ/4`, the singleton `{0}` is neither open nor a box with
    cofinitely trivial factors, but it is measurable: it is the decreasing intersection over `n`
    of the boxes with factor `{0}` at the indices below `n` and `B i` elsewhere.
  - A σ-algebra generated by the open subgroups `U_S` and their cosets alone would not contain
    that singleton; a definition built from them fails this test.
- **Normalized local Haar measures.** For a number field `K` and a finite place `v`, prove that
  there is a unique additive Haar measure `μ_v` on `K_v` with `μ_v(𝒪_v) = 1`, and that for
  `a ∈ K_v^×`, `map (a · ·) μ_v = |a|_v⁻¹ • μ_v` with `|a|_v = q_v^{−v(a)}` ([Sutherland], §23.3,
  p. 6). *Needs:* Tau Ceti `IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion`;
  Mathlib `MeasureTheory.Measure.haarMeasure`, `MeasureTheory.Subgroup.index_mul_measure`.

### 0.2 Compatible measures on principal pieces

- **Product measure on a level subgroup.** (*level-measure*) Let `S ⊂ ι` be finite with `B i`
  compact and `μ i (B i) = 1` for `i ∉ S`, where `μ i` is a left Haar measure on `G i`. On
  `U_S = Π_{i∈S} G i × Π_{i∉S} B i` define `RestrictedProduct.levelMeasure`, the measure `μ_S`,
  as the product of the finite product measure `Measure.pi (fun i : S => μ i)` and the infinite
  product measure `infinitePi (fun i : ι∖S => μ i restricted to B i)`, each factor a probability
  measure on the compact group `B i`. Prove `RestrictedProduct.levelMeasure_box` (`μ_S` of a box
  with factors `C i` for `i ∈ S` and `B i` for `i ∉ S` is `∏_{i∈S} μ i (C i)`),
  `RestrictedProduct.levelMeasure_isHaar` (`μ_S` is a left Haar measure on the topological group
  `U_S`) and `RestrictedProduct.levelMeasure_univ_compact` (if every `B i` is compact and
  `μ i (B i) = 1` for all `i`, then `μ_∅` is a probability measure) ([Sutherland], §23.3, p. 6;
  [Borel], §5.5, p. 21). *Needs:* Mathlib `MeasureTheory.Measure.pi`,
  `MeasureTheory.Measure.infinitePi`, `MeasureTheory.Measure.prod`,
  `RestrictedProduct.isOpenEmbedding_structureMap`,
  `RestrictedProduct.isOpenEmbedding_inclusion_principal`; AA.0.1.

  **Checks.**
  - For `S = ∅` and `μ i (B i) = 1` for all `i`, `μ_∅ (univ) = 1`.
  - For `S = {i₀}` and a measurable `C ⊆ G i₀`, `μ_S {x | x i₀ ∈ C} = μ i₀ (C)` even when
    `μ i₀ (B i₀) ≠ 1`: for `G i₀ = ℤ/4` with counting measure, `B i₀ = 2ℤ/4` and `C = {0}` the
    value is `1`.
  - A construction that also normalized the factors in `S` would give `1/2` in that example;
    the level measure does not renormalize the exceptional factors.
- **Compatibility of level measures.** For finite `S ⊆ S'` as in *level-measure*, with
  `μ i (B i) = 1` for `i ∉ S`, prove that the restriction of `μ_{S'}` to the open subgroup
  `U_S ⊂ U_{S'}` equals `μ_S` ([Borel], §5.5, p. 21). *Needs:* AA.0.2; Mathlib
  `MeasureTheory.Measure.infinitePi_map_restrict`, `MeasureTheory.Measure.pi_pi`.
- **Directed suprema of compatible measures.** Let `X` be a measurable space, `(U_S)` a countable
  directed family of measurable sets covering `X`, and `ν_S` measures with `ν_S` supported on
  `U_S` and `ν_{S'}|_{U_S} = ν_S` for `S ⊆ S'`. Prove that `E ↦ sup_S ν_S(E ∩ U_S)` is a measure
  `ν` on `X` with `ν|_{U_S} = ν_S` for every `S`, and that it is the unique measure with this
  property ([Borel], §5.5, p. 21). *Needs:* Mathlib measure theory.
- **Restricted product of Haar measures.** (*restricted-haar-product*) Given left Haar measures
  `μ i` on `G i` with `μ i (B i) = 1` for all but finitely many `i`, define
  `RestrictedProduct.haarProduct`, the measure `μ = ∏ʳ μ i` on `Πʳ i, [G i, B i]` given
  `hμ : ∀ᶠ i in cofinite, μ i (B i) = 1`, as the supremum of the directed family of measures
  `(U_S ↪ Πʳ)_* μ_S`. Prove that it is the unique Borel measure whose restriction to each open
  subgroup `U_S` (for `S` finite and containing the finitely many `i` with `μ i (B i) ≠ 1` or
  `B i` not compact) is `μ_S`: `RestrictedProduct.haarProduct_restrict_level` (for admissible
  finite `S`, the restriction of `∏ʳ μ i` to `U_S` is `μ_S`),
  `RestrictedProduct.haarProduct_eq_of_restrict` (a Borel measure whose restriction to every
  admissible `U_S` is `μ_S` equals `∏ʳ μ i`), `RestrictedProduct.haarProduct_box` (`∏ʳ μ i` of a
  box `Π i, C i` with `C i = B i` cofinitely equals `∏ᶠ i, μ i (C i)`),
  `RestrictedProduct.haarProduct_isHaarMeasure` (`∏ʳ μ i` is a left Haar measure) and
  `RestrictedProduct.haarProduct_smul` (for positive finite real `c_i` equal to `1` cofinitely,
  rescaling `μ_i` by `c_i` rescales the product by `∏ᶠ c_i`) (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189; [Borel],
  §5.5, p. 21). *Needs:* AA.0.2; AA.0.1.

  **Checks.**
  - If `μ i (B i) = 1` for every `i`, then `∏ʳ μ i` of `{x | ∀ i, x i ∈ B i}` is `1`.
  - If some factor has infinite total mass (as `μ_p` on `ℚ_p`), then `∏ʳ μ i` has infinite total
    mass; it is not an infinite product of probability measures.
  - One exceptional integral factor of mass `2` gives integral-box mass `2`; two exceptional factors of masses `2` and `3` give `6` (the two examples following `haarProduct_compact_open_box`).

- **Restriction of the restricted product measure to a level.** For every finite `S` containing
  the exceptional indices, prove `(∏ʳ μ i).restrict U_S = (U_S ↪ Πʳ)_* μ_S`, and that `∏ʳ μ i`
  is the unique measure with this property (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189). *Needs:* AA.0.2.

  **Checks.**
  - At the empty level, restriction is the pushforward of the integral-level probability
    (`RestrictedProduct.restrict_empty`).
  - At a singleton exceptional level whose integral box has mass `2`, both sides of the
    restriction/pushforward identity give that box mass `2`, without division by `2`
    (`restrict_singleton`).
  - For a finite index set and the full level, the restriction disappears and the pushforward
    is the whole product measure (`restrict_all`).


  **Checks.**
  - `box univ = univ`, a box with one empty factor is empty, and the integral box equals
    the empty level (`box_univ`, `box_empty_factor`, `box_integral`).
  - `levelSubgroup univ = ⊤`; at a singleton level only that coordinate is unrestricted;
    an element outside one integral subgroup is rejected by the empty level
    (`level_all`, `level_singleton`, `level_reject`).

- **Measure of a box.** For Borel sets `C i ⊂ G i` with `C i = B i` for all but finitely many
  `i`, prove `∏ʳ μ i (Π i, C i) = ∏ᶠ i, μ i (C i)`, the product being finite because almost all
  factors equal `1` (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189). *Needs:* AA.0.2; Mathlib
  `MeasureTheory.Measure.pi_pi`.
- **The restricted product measure is a Haar measure.** Prove that `∏ʳ μ i` is a left Haar
  measure on the locally compact group `Πʳ i, [G i, B i]`, and that if every `μ i` is also right
  invariant then `∏ʳ μ i` is right invariant (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189). *Needs:* AA.0.2;
  Mathlib `RestrictedProduct.locallyCompactSpace_of_group`, `RestrictedProduct.isTopologicalGroup`,
  `MeasureTheory.Measure.IsHaarMeasure`.


  **Checks.**
  - Left translation by any restricted-product element preserves the actual measure
    (`haar_left_translation`).
  - Every compact set has finite mass (`haar_compact_finite`), even when the entire group
    has infinite mass.
  - Every nonempty open set has positive mass (`haar_open_positive`); in particular the
    normalized integral box has mass `1`, whereas the zero measure fails this condition.

### 0.3 Products, transport and changes of normalization

- **Change of local normalizations.** If `μ′_i = c_i μ_i`, where `0 < c_i < ∞` and `c_i = 1`
  outside a finite set, prove that the normalized restricted Haar products satisfy
  `∏ʳ μ′_i = (∏ᶠ c_i) ∏ʳ μ_i` ([Rosengarten], §1, p. 2). An infinitely rescaled family needs the
  separately stated convergent-product construction below; finite rescaling alone gives no such
  theorem. *Needs:* AA.0.2.
- **Changing the restricting subgroups at finitely many places.** Let `B' i ≤ G i` be open
  subgroups with `B' i = B i` for all but finitely many `i`. Prove that the identity on
  `Π i, G i` restricts to an isomorphism of topological groups
  `Πʳ i, [G i, B i] ≃ₜ* Πʳ i, [G i, B' i]`, under which `∏ʳ μ i` corresponds to `∏ʳ μ i` (the
  normalization condition being cofinite); thus the restricted product and its measure depend
  only on the `B i` up to finitely many indices ([Conrad], Theorem 3.6, p. 6). *Needs:* AA.0.2;
  Mathlib `RestrictedProduct.topologicalSpace_eq_iSup`, `RestrictedProduct.continuous_dom`.
- **Fubini for restricted product measures.** Under the finite splitting, prove that `∏ʳ_ι μ i`
  corresponds to `(Measure.pi (fun i : S => μ i)).prod (∏ʳ_{ι∖S} μ i)`, hence that for `f`
  integrable on `Πʳ i, [G i, B i]` for `∏ʳ μ i`,

  ```text
  ∫ f ∂(∏ʳ μ i) = ∫_{Π_{i∈S} G i} ∫_{Πʳ_{ι∖S}} f(x_S, x^S) dμ^S dμ_S
  ```

  ([Borel], §5.5, p. 21). *Needs:* AA.0.3; AA.0.2; Mathlib
  `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`, `MeasureTheory.integral_prod`.
- **Integral of a factorizable function.** Let `f i : G i → ℂ` be integrable, with `f i` the
  indicator of `B i` for all but finitely many `i`. Prove that `f(x) = ∏ i, f i (x i)` is a
  well-defined integrable function on `Πʳ i, [G i, B i]` and that
  `∫ f ∂(∏ʳ μ i) = ∏ᶠ i, ∫ f i ∂μ i` (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189). *Needs:* AA.0.3; AA.0.2.

  **Checks.**
  - With no factors, the integral of the empty product over the one-point group is `1`
    (`RestrictedProduct.factorizable_empty`).
  - On one copy of `C₂` with counting measure, the constant function `2` has integral `4`
    (`factorizable_one`).
  - On two copies of `C₂`, constants `2` and `3` have product integral `4 · 6 = 24`
    (`factorizable_two`). These finite measures are sigma-finite and the functions integrable;
    probability normalization would incorrectly give `2` and `6` in the last two cases.

- **Restricted products of unimodular groups are unimodular.** If every `G i` is unimodular
  (`modularCharacter G i = 1`), prove that `Πʳ i, [G i, B i]` is unimodular; more generally the
  modular character of the restricted product is `x ↦ ∏ᶠ i, Δ_{G i}(x i)`, a finite product
  because `x_i` belongs to `B_i` at almost every index and those `B_i` are compact at almost every
  index ([Borel], §5.5, p. 21). *Needs:* AA.0.2; Mathlib `MeasureTheory.Measure.modularCharacter`.
- **Functoriality of restricted product measures.** Let `φ i : G i ≃ₜ* G' i` be isomorphisms of
  topological groups with `φ i (B i) = B' i` for all but finitely many `i`. Prove that the
  induced isomorphism `Φ = RestrictedProduct.map φ` of restricted products satisfies
  `Φ_*(∏ʳ μ i) = ∏ʳ (φ i)_* μ i` ([Rosengarten], Lemma 3.5, p. 26). *Needs:* AA.0.2; Mathlib
  `RestrictedProduct.mapAlong_continuous`, `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.
- **Convergent restricted products of local Haar measures.** Let `ι` be countable, each `G_i` a
  second countable locally compact Hausdorff group with a left Haar measure `μ_i`, `B_i ≤ G_i`
  open subgroups, and `S ⊂ ι` finite with `B_i` compact for every `i ∉ S`. Put
  `a_i = μ_i(B_i) ∈ (0, ∞)` for `i ∉ S`, suppose `∑_{i∉S} |a_i − 1| < ∞`, and let
  `C_S = ∏_{i∉S} a_i > 0`. Define `RestrictedProduct.convergentHaarProduct` as `C_S` times the
  normalized restricted Haar product of `μ_i` for `i ∈ S` and `a_i⁻¹ μ_i` for `i ∉ S`. Prove
  `RestrictedProduct.convergentHaarProduct_independent_exceptionalSet` (enlarging the finite
  exceptional set leaves the measure unchanged, so the construction is independent of `S`),
  `RestrictedProduct.convergentHaarProduct_isHaarMeasure` (the convergent product is a nonzero
  Haar measure) and `RestrictedProduct.convergentHaarProduct_box` (if `C_i = B_i` off finite
  `T ⊃ S`, its box mass is `(∏_{i∈T} μ_i(C_i)) · ∏_{i∉T} a_i`) (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189;
  Mathlib summable series and logarithms supply the convergence). *Needs:* AA.0.2; AA.0.3; Mathlib
  summable series and logarithms.

  **Checks.**
  - When every `a_i = 1` the measure equals `haarProduct`, including its integral box of mass `1`.
  - For `SL_2` good factors `a_v = 1 − q_v⁻²`, the integral box mass is their positive infinite
    product, strictly less than `1` for a nonempty tail; eventual equality to `1` is unnecessary.
  - Rescaling exactly one normalized factor by `c > 0` multiplies the whole measure by `c` (`convergentHaarProduct_single_rescale`).


  **Checks.**
  - The helper `normalizedFamily` leaves a factor in the exceptional set unchanged
    (`normalized_exceptional`).
  - A factor whose integral subgroup has mass `1` is unchanged even in the tail
    (`normalized_unit`).
  - A tail factor of mass `2` becomes `(1/2)μ`, while the global product retains the compensating
    factor `2` (`normalized_mass_two`).

- **Independence under finite changes of integral subgroups.** With `ι` countable, each `G_i` a
  second countable locally compact Hausdorff group with a left Haar measure `μ_i`,
  `B_i, B′_i ≤ G_i` open subgroups, `S ⊂ ι` finite with `B_i = B′_i` compact for every `i ∉ S`,
  and `∑_{i∉S} |μ_i(B_i) − 1| < ∞`, prove that changing the compact open `B_i` at finitely many
  indices transports the convergent Haar product to the same measure on the canonically
  identified restricted product (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189). *Needs:* AA.0.3.


  **Checks.**
  - On one copy of `C₄`, the identity change preserves counting measure of total mass `4`
    (`RestrictedProduct.change_identity`).
  - Changing its restricting subgroup from `C₄` to `{1}` still transports counting measure
    of mass `4` (`change_one`).
  - On two copies, changing both restricting subgroups from `C₄` to `{1}` preserves mass `16`
    (`change_two`). The exceptional set is the full finite index set in these examples;
    normalizing the changed subgroups would give the wrong masses.

### 0.4 Adeles and ideles

- **Normalized Haar measure on the finite adeles.** (*finite-adele-haar*) For a number field `K`,
  define `NumberField.finiteAdeleHaar`, the measure `μ_f` on `𝔸_{K,f} = FiniteAdeleRing (𝓞 K) K`,
  as the restricted product of the additive Haar measures `μ_v` on `K_v` normalized by
  `μ_v(𝒪_v) = 1`, where each `K_v` is a nonarchimedean local field and `𝒪_v` its compact open
  valuation ring. Prove `NumberField.finiteAdeleHaar_integers` (`finiteAdeleHaar (∏_v 𝒪_v) = 1`),
  `NumberField.finiteAdeleHaar_isAddHaar` (it is an additive Haar measure) and
  `NumberField.finiteAdeleHaar_smul` (for a finite idele `a`,
  `map (a * ·) finiteAdeleHaar = (∏_v |a_v|_v)⁻¹ • finiteAdeleHaar`) (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189).
  *Needs:* AA.0.2; Mathlib `IsDedekindDomain.FiniteAdeleRing`; Tau Ceti
  `IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion`;
  GlobalNumberFields, layer 4; AA.0.1.

  **Checks.**
  - For a nonzero ideal `𝔞` of `𝓞 K`, the closure of `𝔞` in `∏_v 𝒪_v` has measure
    `(Ideal.absNorm 𝔞)⁻¹`.
  - `finiteAdeleHaar` is not a finite measure: `𝔸_{K,f}` is a disjoint union of infinitely many
    translates of `∏_v 𝒪_v`.
  - For a prime above `2` in `ℚ`, the box with factor `2ℤ₂` and integral factors elsewhere has mass `1/2` (`finiteAdeleHaar_rat_twoZ2`).

- **Normalized Haar measure on the adeles.** For a number field `K`, define
  `NumberField.adeleHaar`, the measure `μ_𝔸` on `𝔸_K = K_∞ × 𝔸_{K,f}`, as the product of the
  measure on `K_∞ = ∏_{w|∞} K_w` given by Lebesgue measure at real places and twice Lebesgue
  measure at complex places with the finite-adele measure of *finite-adele-haar*. Prove
  `NumberField.adeleHaar_isAddHaar` (it is an additive Haar measure), `NumberField.adeleHaar_prod`
  (it is the product of the archimedean measure and `finiteAdeleHaar`) and
  `NumberField.adeleHaar_infinite_eq_mixed` (the archimedean factor is `2^{r₂}` times the
  transport of the mixed-space volume) (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189). *Needs:* AA.0.4; Mathlib
  `NumberField.AdeleRing`, `NumberField.mixedEmbedding.volume_fundamentalDomain_stdBasis`,
  `MeasureTheory.Measure.prod`; AA.0.1.

  **Checks.**
  - For `K = ℚ` the set `[0,1) × ∏_p ℤ_p` has measure `1`.
  - The product of the mixed-space fundamental parallelotope of `𝓞_K` (transported to `K_∞`)
    with `∏_v 𝒪_v` is a fundamental domain for `K` in `𝔸_K` and has measure `|d_K|^{1/2}`: the
    archimedean factor is `2^{r₂}` times the mixed volume `2^{−r₂} |d_K|^{1/2}`.
  - So `vol(𝔸_K/K) = |d_K|^{1/2}`, which differs from the self-dual value `1` (the self-dual
    normalization) whenever `|d_K| > 1`; omitting the factor `2` at complex places would give
    `2^{−r₂} |d_K|^{1/2}`.
- **Normalized Haar measure on the ideles.** For a number field `K`, define
  `NumberField.ideleHaar`, the measure `d^×x` on the idele group `𝔸_K^×`, as the restricted
  product, through the topological isomorphism `𝔸_K^× ≅ Πʳ v, [K_v^×, 𝒪_v^×]` (finite part) times
  `∏_{w|∞} K_w^×`, of the Haar measures `d^×x_v` with `vol(𝒪_v^×) = 1` at finite places, `dx/|x|`
  at real places and `2 dx dy/(x² + y²)` at complex places. Prove `NumberField.ideleHaar_isHaar`
  (it is a Haar measure on the idele group) and `NumberField.ideleHaar_units` (`ideleHaar` of
  `∏_v 𝒪_v^×` times a box at infinity is the archimedean volume of the box) ([Sutherland], §23.3,
  p. 6; [Rosengarten], §1, p. 2). The archimedean factor `NumberField.infiniteIdeleHaar` is fixed
  by `NumberField.infiniteIdeleHaar_eq_withDensity`: carried to `K_∞`, it is the additive measure
  `infiniteAdeleHaar` (`dx`, `2 dx dy`) restricted to the units with density `∏_w |x_w|_w⁻¹`, the
  normalized absolute value being squared at complex places (Mathlib
  `NumberField.mixedEmbedding.norm`). Without this equation `ideleHaar_units` would only tie
  `ideleHaar` to an archimedean measure left unspecified. *Needs:* AA.0.2; Mathlib
  `NumberField.IdeleGroup`, `RestrictedProduct.unitsEquiv`, `NumberField.mixedEmbedding.norm`;
  GlobalNumberFields, layer 6.

  **Checks.**
  - For `K = ℚ`, `ideleHaar (∏_p ℤ_p^× × [1, e]) = 1`.
  - At a finite place, the measure `|dx/x|_v` built from the additive normalization gives
    `𝒪_v^×` volume `1 − q_v⁻¹`, so `ideleHaar` is the product of `(1 − q_v⁻¹)⁻¹ |dx/x|_v`.
  - For `K = ℚ`, the set with `x_2 ∈ 1 + 4ℤ_2`, `x_p ∈ ℤ_p^×` for odd `p` and `x_∞ ∈ [1, e]` has
    `ideleHaar` mass `(1 − 2⁻¹)⁻¹ · 4⁻¹ = 1/2`; without the factor at `2` it would be `1/4`.
  - At the complex place of an imaginary quadratic field the annulus `1 ≤ |z| ≤ e` has
    `infiniteIdeleHaar` mass `2 · 2π · log e = 4π`; the density `dx dy/(x² + y²)` would give `2π`
    (`infiniteIdeleHaar_annulus`).
- **Products of form measures need convergence factors.** For `K = ℚ` and `ω = dx/x` on `G_m`,
  prove that the local measures `|ω|_p` built from the additive normalization `μ_p(ℤ_p) = 1` give
  `vol(ℤ_p^×) = 1 − p⁻¹`, and that `∏_p (1 − p⁻¹)` diverges to `0`. Hence the family `|ω|_p` does
  not satisfy the normalization hypothesis of *restricted-haar-product* (cofinitely volume `1`),
  and no rescaling by a single constant makes it do so; the Tamagawa measure of `G_m` uses the
  convergence factors `λ_p = (1 − p⁻¹)⁻¹`. The analogous statement for a number field `K` uses the
  pole of the Dedekind zeta function at `s = 1` ([Rosengarten], §1, p. 2; [Borel], §5.5, p. 21).
  *Needs:* AA.0.4; Mathlib `Nat.Primes.not_summable_one_div`; AA.0.2.

### Examples

**Checks.** With all local integral masses one, the integral box has mass one. With
one exceptional mass two and all others one it has mass two; with exceptional masses
two and three it has mass six. The last two values distinguish cofinite normalization
from normalization at every place and fix the direction of rescaling.

The integral box `{x | ∀ i, x i ∈ B i}` has `haarProduct` mass `1` when every local integral subgroup has mass one,
and the `ℤ/4` examples of AA.0.1 and AA.0.2 separate the Borel σ-algebra from the σ-algebra of
the open subgroups and the level measure from a fully normalized product. For `K = ℚ`,
`[0,1) × ∏_p ℤ_p` has `adeleHaar` mass `1` and `∏_p ℤ_p^× × [1, e]` has `ideleHaar` mass `1`;
`vol(𝔸_K/K) = |d_K|^{1/2}` for every number field; and the divergence of `∏_p (1 − p⁻¹)` shows
that the form measures `|dx/x|_p` are not a restricted product of Haar measures.

### Dependencies

Mathlib's restricted products, product and Haar measures, and number-field adeles; Tau Ceti's
nonarchimedean local fields at finite places; GlobalNumberFields, layers 4 and 6, for the finite
adeles and the ideles.

## Layer 1: adelic points of algebraic groups

Equip Hopf-algebra points with their evaluation topology and compare points over the adelic
algebra with a restricted product of local groups. Finite presentation controls the choice of
integral model. Preserve coefficient naturality, topology and the actual rational diagonal through
every comparison.

### 1.1 Affine points and integral models

- **Adelic points of an affine algebraic group.** For a finitely generated commutative Hopf
  algebra `H` over a number field `F`, define `AdelicPoints H := WithConv (H →ₐ[F] 𝔸_F)`, the
  group `G(𝔸_F)` of `F`-algebra maps `H → 𝔸_F` under convolution
  (`TauCeti.HopfAlgebra.points H 𝔸_F`), with `AdelicPoints.instTopologicalSpace`, the
  affine-points topology induced from `𝔸_F^H` by evaluation (the weakest topology making every
  evaluation `h ↦ x(h)` continuous), and `AdelicPoints.instIsTopologicalGroup`. Likewise
  `G(𝔸_{F,f})`, `G(F_∞) = G(F ⊗_ℚ ℝ)` and `G(F_v)`. Define `AdelicPoints.diagonal`, the diagonal
  `ι : G(F) →* AdelicPoints H` given by `mapPoints` along `algebraMap F 𝔸_F`, and
  `AdelicPoints.proj`, the continuous homomorphism `p_v : AdelicPoints H →* G(F_v)` given by
  `mapPoints` along the projection `𝔸_F → F_v`. Prove `AdelicPoints.continuous_eval` (for `h ∈ H`,
  `x ↦ x h` is continuous `AdelicPoints H → 𝔸_F`) and `AdelicPoints.proj_diagonal`
  (`proj v (diagonal g)` is the image of `g` in `G(F_v)`). Define `AdelicPoints.finiteEmbed`, the
  finite-supported homomorphism `G(𝔸_f) → G(𝔸)`, `x ↦ (1, x)`, under the canonical
  archimedean/finite splitting — an embedding of point groups, not a ring inclusion with
  archimedean coordinate zero — with `AdelicPoints.finiteEmbed_finite` (the finite projection of
  `finiteEmbed x` equals `x`) and `AdelicPoints.finiteEmbed_infinite` (the infinite projection of
  `finiteEmbed x` equals `1`) ([Conrad], Proposition 2.1, p. 2; [Arthur], §2, p. 11). *Needs:*
  Tau Ceti `TauCeti.HopfAlgebra.points`, `TauCeti.HopfAlgebra.mapPoints`,
  `TauCeti.HopfAlgebra.pointsFunctor`; Mathlib `NumberField.AdeleRing`,
  `IsDedekindDomain.FiniteAdeleRing`, `RestrictedProduct.evalRingHom`; ReductiveGroupsPartII,
  RG2.0; GlobalNumberFields, layer 4.

  **Checks.**
  - For `H = F[T]` with additive comultiplication, `AdelicPoints H ≃ₜ+ 𝔸_F`
    (`AdelicPoints.ga_topological`, using the multiplicative type synonym; see *ga-adelic*).
  - For `H = F[T, T⁻¹]` the topology is not the subspace topology of `𝔸_F`: the inversion map is
    not continuous for the subspace topology on `𝔸_F^×`.
  - For the trivial coordinate Hopf algebra `H = F`, `AdelicPoints F F` is a subsingleton (`AdelicPoints.trivial_group`).

- **Integral models over S-integers.** For finitely generated `H` and a finite set `S` of places
  of `F` containing the archimedean ones, define `IntegralModel`: an integral model of `H` away
  from `S` is a finitely presented commutative Hopf algebra `𝓗` over the `S`-integers `𝒪_{F,S}`
  together with a specified isomorphism of Hopf algebras `F ⊗_{𝒪_{F,S}} 𝓗 ≅ H` (`S` is finite and
  all infinite places are understood to be included). For `v ∉ S` define
  `IntegralModel.localPoints`, the subgroup `𝓗(𝒪_v) = Hom_{𝒪_{F,S}}(𝓗, 𝒪_v) ⊂ G(F_v)`, and
  `IntegralModel.enlarge`, the base-changed model over `𝒪_{F,S′}` for `S ⊆ S′`, with
  `localPoints` unchanged at `v ∉ S′` and coordinate algebra `𝒪_{F,S′} ⊗_{𝒪_{F,S}} 𝓗`, by a Hopf
  isomorphism under which the generic-fibre identifications agree
  (`IntegralModel.enlarge_coordinate`). The second clause is needed: the product of
  `𝓗` with the non-reduced group scheme `𝒪_{F,S′}[ε]/(ε^p, pε)` (`ε` primitive, `p` a prime outside
  `S′`) has the same generic fibre and the same `𝒪_v`-points, since `ε` is `p`-torsion, but its fibre
  at `p` is not reduced, so `IsReductive.enlarge` would fail for it. Prove `IntegralModel.localPoints_injective`: the map
  `𝓗(𝒪_v) → G(F_v)` induced by the injection `𝒪_v → F_v` is injective ([Conrad], Remark 3.5 and
  §3, p. 6). *Needs:* Tau Ceti `TauCeti.HopfAlgebra.points`,
  `TauCeti.CommHopfAlgCat.baseChangePointsMulEquiv`; Mathlib `Set.integer`.

  **Checks.**
  - For the standard model of `GL_n`, `localPoints v = GL_n(𝒪_v)` (invertible determinant), not
    all integral matrices with nonzero determinant.
  - For `G_a` (`H = F[T]`) and the model `𝒪_{F,S}[X]` identified with `H` by `X ↦ cT`, where
    `c ∈ 𝒪_{F,S}` is nonzero, `localPoints v` is `{a ∈ F_v : c·a ∈ 𝒪_v} = c⁻¹𝒪_v`.
  - For `c = p` and `v | p` (`v ∉ S`) this is `p⁻¹𝒪_v ⊋ 𝒪_v`, so the integral points depend on the
    specified Hopf identification and not only on the abstract Hopf algebra.
- **Spreading Hopf structure and its identities.** Prove that a finitely presented affine
  `F`-algebra with Hopf structure descends to a finitely presented Hopf algebra over `𝒪_{F,S}`
  after enlarging finite `S`, and that a prescribed finite collection of Hopf morphisms and
  their identities descends simultaneously; the integral generic-fibre identifications are Hopf
  isomorphisms ([Conrad], Theorem 3.4(1)–(2), pp. 5–6; Remark 3.5, p. 6). *Needs:* Mathlib finite
  presentation and localization.
- **Spreading out.** Prove that every finitely generated commutative Hopf algebra `H` over `F`
  has an integral model away from some finite set `S` of places ([Conrad], Theorem 3.4(1), p. 5).
  *Needs:* AA.1.1.
- **Reductive models outside finitely many places.** Define `IntegralModel.IsReductive M` by
  `Algebra.Smooth` over the S-integer base and Tau Ceti's
  `reductiveCommHopfAlgProperty` on every field-valued fibre `k ⊗ M.coordinate`.
  The generic fibre is the specified Hopf algebra through `M.baseChangeIso`.
  Prove `IntegralModel.IsReductive.generic`, `IntegralModel.IsReductive.enlarge`, and
  `IntegralModel.exists_reductive`: a finite-type connected reductive `F`-group has such a
  model for some finite `S`. Prove `IntegralModel.standardGLn_isReductive` in every rank
  ([Conrad RGS], Definition 3.1.1, p. 81; Corollary 3.1.11, pp. 88–89).
  *Needs:* AA.1.1; Tau Ceti's field-valued reductivity predicate; Mathlib `Algebra.Smooth`.

  **Checks.**
  - The rank-zero general linear model is reductive (`reductive_rank_zero`).
  - The rank-one model is the smooth multiplicative group with torus fibres
    (`reductive_rank_one`).
  - No integral model of `G_a` is reductive (`additive_not_reductive`): its specified
    generic fibre is a nontrivial connected unipotent group.
  - Enlarging the standard `GL_n` model keeps it reductive (`enlarge_standard_reductive`); the
    non-reduced twist described above keeps the local points and fails this.

- **Uniqueness of integral models up to enlarging S.** For finitely generated `H`, prove that
  two integral models `𝓗`, `𝓗′` of `H` (away from `S` and `S′`) become isomorphic, compatibly
  with their identifications with `H`, after base change to `𝒪_{F,S″}` for some finite
  `S″ ⊇ S ∪ S′`; consequently `𝓗(𝒪_v) = 𝓗′(𝒪_v)` inside `G(F_v)` for all but finitely many `v`
  ([Conrad], Theorem 3.4(3), p. 5). *Needs:* AA.1.1.

`PrimitiveThickening.relations_hopf` verifies all three Hopf-ideal conditions:
`Δ(ε)=ε⊗1+1⊗ε`, `counit(ε)=0`, and `S(ε)=−ε`. The intermediate
binomial coefficients in `Δ(ε^p)` are divisible by the prime `p`, and each
mixed monomial is killed by `pε`; this is a direct binomial calculation.

**Checks.**

- `relations_hopf_prime_three` — both defining relations vanish under primitive
  comultiplication at `p=3`.
- `relations_old_square_zero_rejected_three` — for `𝔽₃[ε]/ε²`, the proposed
  comultiplication gives `Δ(ε²)=2ε⊗ε≠0`; hence the square-zero integral example
  cannot carry that Hopf structure at `p=3`.
- `relations_generic_fibre`, `relations_integral_points`,
  `relations_special_fibre_nonreduced` — after inverting `p` the algebra is the base
  field; torsion-free integral points kill `ε`; in characteristic `p`, `ε` is a
  nonzero nilpotent. These point and fibre properties accompany the Hopf-ideal test.

### 1.2 Restricted-product realization

- **Points over a product of rings.** For a commutative Hopf algebra `H` over `F` and
  commutative `F`-algebras `R₁`, `R₂` (and more generally a finite product), prove
  `WithConv (H →ₐ[F] R₁ × R₂) ≃* WithConv (H →ₐ[F] R₁) × WithConv (H →ₐ[F] R₂)`, naturally and as
  topological groups for the affine-points topology ([Conrad], Proposition 2.1, proof, p. 2).
  *Needs:* AA.1.1; Mathlib `AlgHom.prod`.
- **Finite adeles as a directed union of S-adeles.** For finite sets `S` of finite places, prove
  that the `S`-adeles `𝔸_{F,S} = ∏_{v∈S} F_v × ∏_{v∉S} 𝒪_v` are open subrings of `𝔸_{F,f}`
  forming a directed union, and that every `F`-algebra map `H → 𝔸_{F,f}` from a finitely
  generated `H` with integral model `𝓗` restricts to a map of models `𝓗 → 𝔸_{F,S}` for `S`
  large: `G(𝔸_{F,f}) = ⋃_S 𝓗(𝔸_{F,S})`; the integral generic-fibre identifications are Hopf
  isomorphisms ([Conrad], Remark 3.5, p. 6). *Needs:* AA.1.1; Mathlib
  `RestrictedProduct.isOpenEmbedding_inclusion_principal`.
- **The restricted-product bijection on S-adelic points.** For a fixed affine finitely presented
  model `𝓗` over `𝒪_{F,S}` whose generic-fibre identification is a Hopf isomorphism, prove that
  the evaluation map from its `S′`-adelic points to `∏_{v∈S′} G(F_v) × ∏_{v∉S′} 𝓗(𝒪_v)`, for
  finite `S′ ⊃ S`, is a bijection. This is a set and group statement; the topology is proved
  separately ([Conrad], Theorem 3.6, p. 6). *Needs:* AA.1.1; AA.1.2; ReductiveGroupsPartII, RG2.0.
- **Topology of the restricted-product comparison.** Prove that the bijection
  `G(𝔸_{F,f}) → ∏ʳ_v [G(F_v), B_v]` induced by coordinate projections is a homeomorphism: on each
  `S`-integral principal piece it is the product homeomorphism of affine points, and the
  principal pieces are open on both sides; the integral generic-fibre identifications are Hopf
  isomorphisms ([Conrad], Theorem 3.6, pp. 7–8; §4, p. 9). *Needs:* AA.1.2; ReductiveGroupsPartII,
  RG2.0; Mathlib `RestrictedProduct.topologicalSpace_eq_iSup`.
- **Adelic points as a restricted product.** (*restricted-product-comparison*) Let `H` be
  finitely generated and `𝓗` an integral model of `H` away from `S`. Prove that
  `x ↦ (p_v(x))_v` is an isomorphism of topological groups
  `G(𝔸_{F,f}) ≃ₜ* Πʳ v, [G(F_v), B_v]`, where `B_v = 𝓗(𝒪_v)` for `v ∉ S` and `B_v = G(F_v)` for
  the finitely many finite `v ∈ S`, and that `G(𝔸_F) ≃ₜ* G(F_∞) × G(𝔸_{F,f})` ([Conrad],
  Theorem 3.6, p. 6; [Borel], §1.2, p. 7). *Needs:* AA.1.1; Mathlib
  `RestrictedProduct.topologicalSpace_eq_iSup`; AA.0.3; ReductiveGroupsPartII, RG2.0; AA.1.2.
- **Independence of the model and of the exceptional set.** For finitely generated `H`, prove
  that the topological group structure on `Πʳ v, [G(F_v), 𝓗(𝒪_v)]` obtained from
  *restricted-product-comparison* does not depend on the integral model `𝓗` or on `S`: for two
  models the identity of `G(𝔸_{F,f})` corresponds to the canonical isomorphism
  `restrictedProductCongr` of Tau Ceti, and enlarging `S` does not change it ([Conrad],
  Theorem 3.6, p. 6). *Needs:* AA.1.2; AA.1.1; AA.0.3.
- **Adelic groups are locally compact.** For finitely generated `H`, prove that `G(𝔸_F)`,
  `G(𝔸_{F,f})` and `G(F_∞)` are second countable, locally compact, Hausdorff topological groups
  ([Borel], §1.2, p. 7). *Needs:* AA.1.2; Mathlib `RestrictedProduct.locallyCompactSpace_of_group`;
  AA.0.1; ReductiveGroupsPartII, RG2.0; GlobalNumberFields, layer 5.
- **Splitting off finitely many places.** For finitely generated `H` and a finite set `S` of
  places, prove `G(𝔸_F) ≃ₜ* G(F_S) × G(𝔸_F^S)`, with `G(F_S) = ∏_{v∈S} G(F_v)` and `G(𝔸_F^S)` the
  adelic points away from `S`; in particular `G(𝔸_F) ≃ₜ* G(F_∞) × G(𝔸_{F,f})`. The diagonal
  `G(F)` maps to the pair of diagonals ([Borel], §1.2, p. 7). *Needs:* AA.1.2; AA.0.3.

### 1.3 Rational points and functoriality

- **Rational points are discrete in the full adeles.** For finitely generated `H`, prove that
  the diagonal `G(F) → G(𝔸_F)` is injective, that its image is a discrete subgroup, and that the
  image is closed ([Conrad], Example 2.3, p. 3; [Borel], §1.2, p. 7). *Needs:* AA.1.1; Tau Ceti
  `TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup`,
  `TauCeti.GlobalNumberFields.isClosed_principalSubgroup`; Mathlib `Subgroup.isClosed_of_isDiscrete`;
  Tau Ceti `NumberField.AdeleRing.instT2Space`; ReductiveGroupsPartII, RG2.0.
- **Discreteness in the finite adeles alone.** For finitely generated `H`, prove that `G(F)` is
  discrete in `G(𝔸_{F,f})` if and only if `G(F) ∩ U` is finite for one (equivalently every)
  compact open subgroup `U ⊂ G(𝔸_{F,f})`. In particular `G_a(F) = F` is not discrete in
  `𝔸_{F,f}`, `SL_2(ℚ)` is not discrete in `SL_2(𝔸_{ℚ,f})` because `SL_2(ℤ)` is infinite, and `ℚ^×`
  is discrete in `𝔸_{ℚ,f}^×` because `ℚ^× ∩ ∏_p ℤ_p^× = {±1}` ([Borel], §1.8, p. 9). *Needs:*
  AA.1.3; AA.1.2.
- **Functoriality of adelic points.** For finitely generated `H` and a homomorphism of affine
  algebraic groups `φ : G → G′` over `F` (a Hopf algebra map `φ* : H′ → H`), define
  `AdelicPoints.map φ : AdelicPoints H →* AdelicPoints H′`, `x ↦ x ∘ φ*`. Prove
  `AdelicPoints.continuous_map`, `AdelicPoints.map_id` (`AdelicPoints.map (id) = id`),
  `AdelicPoints.map_comp` (`AdelicPoints.map (φ ∘ ψ) = AdelicPoints.map ψ ∘ AdelicPoints.map φ`,
  contravariance on Hopf algebras), `AdelicPoints.map_diagonal` (`map φ (diagonal g) = diagonal
  (φ g)`) and `AdelicPoints.proj_map` (`proj v ∘ map φ = φ_v ∘ proj v`). Under
  *restricted-product-comparison* it is the restricted product of the local maps `φ_v`, which
  send `𝓗(𝒪_v)` into `𝓗′(𝒪_v)` for almost all `v` ([Borel], §1.3, p. 7). *Needs:* AA.1.1; Tau
  Ceti `TauCeti.CommHopfAlgCat.pointsFunctor`; AA.1.2; Mathlib
  `RestrictedProduct.mapAlong_continuous`; Tau Ceti `TauCeti.GeneralLinear.determinantCoordinateMap`,
  `TauCeti.GeneralLinear.pointsMulEquiv_determinantPoints`.

  **Checks.**
  - For `GL_1`, the adelic determinant point map corresponds under the canonical `GL_1`-to-units
    identification to the identity on the idele group; explicitly its `G_m` unit is the
    one-by-one matrix determinant.
  - For `G_m` over `ℚ` the image `(𝔸_ℚ^×)²` of the squaring map is closed and has infinite
    index.
  - That image is not open: every basic identity neighbourhood allows arbitrary units at almost
    all odd primes, including nonsquare units. Thus the adelic squaring map need not be
    surjective or open.
- **The centre on adelic points.** For finitely generated `H`, let `Z ⊂ G` be the centre
  (`centerDefiningIdeal`). Prove that `Z(𝔸_F)` is a closed subgroup of `G(𝔸_F)` contained in the
  centre of `G(𝔸_F)`, and that `Z(F) = Z(𝔸_F) ∩ G(F)` ([Borel], §1.6, p. 8). *Needs:* AA.1.3; Tau
  Ceti `TauCeti.CommHopfAlgCat.centerDefiningIdeal`,
  `TauCeti.CommHopfAlgCat.centerPointsSubgroup_eq_center`.

### 1.4 Restriction of scalars and concrete groups

- **Local factors of restriction of scalars.** For `E/F` finite and `G_E` affine over `E`, prove
  that under *base-change-adelic* the projection to `F_v` corresponds to
  `Res(F_v) ≃ ∏_{w|v} G_E(E_w)`, and that for almost all `v` the integral points of a model of
  `Res` correspond to `∏_{w|v} 𝓗_E(𝒪_w)`. The Weil restriction and the completion/adelic
  base-change maps are the natural adjunction and canonical tensor-product maps; arbitrary point
  equivalences are excluded, and the integral generic-fibre identifications are Hopf
  isomorphisms ([Borel], §1.4, p. 8). *Needs:* AA.1.4; GlobalNumberFields, layer 8;
  ReductiveGroupsPartII, RG2.0a.
- **Naturality of adelic restriction of scalars.** Let `k ⊆ F ⊆ E` be number fields with `E/F`
  and `F/k` finite, `G_E` an affine algebraic group over `E` (a finite-type commutative Hopf
  `E`-algebra) with morphisms `G_E → G′_E` over `E`, `Res_{E/F}` with its natural point adjunction
  `Res_{E/F}G(R) ≃ G(E ⊗_F R)` from RG2.0a, and the canonical continuous isomorphism
  `E ⊗_F 𝔸_F ≅ 𝔸_E` with its local factors from GlobalNumberFields layer 8. Prove that the adelic
  comparison commutes with every algebraic group morphism, the diagonal `F → 𝔸_F`, projections
  to `F_v`, and the canonical tensor associator for towers `E/F/k` ([Conrad], Examples 2.4 and
  4.2, pp. 3 and 9–10). *Needs:* AA.1.4; ReductiveGroupsPartII, RG2.0a; GlobalNumberFields,
  layer 8.
- **Restriction of scalars on adelic points.** (*base-change-adelic*) For a finite extension
  `E/F` of number fields and an affine algebraic group `G_E` over `E`, with `Res = Res_{E/F} G_E`,
  define `AdelicPoints.resEquiv`, an isomorphism of topological groups `Res(𝔸_F) ≃ₜ* G_E(𝔸_E)`,
  and prove `AdelicPoints.resEquiv_diagonal` (it carries the diagonal of `Res(F) = G_E(E)` to the
  diagonal of `G_E(E)`), `AdelicPoints.resEquiv_natural` (naturality in homomorphisms
  `G_E → G′_E`) and `AdelicPoints.resEquiv_trans` (in a tower `F ⊂ E ⊂ L`, `resEquiv` for `L/F`
  is the composite of those for `L/E` and `E/F`). The Weil restriction and the completion/adelic
  base-change maps are the natural adjunction and canonical tensor-product maps; arbitrary point
  equivalences are excluded, and the integral generic-fibre identifications are Hopf
  isomorphisms ([Conrad], Example 4.2, p. 10; [Arthur], §2, p. 11).
  The general commutative-ring tower interface retains finite/projective instances for
  `k′/k`, `k″/k′`, and `k″/k` (the last follows mathematically by transitivity).
  `WeilRestriction.compHopfEquiv : Res_{E/F} Res_{L/E} H ≃ Res_{L/F} H` used in `resEquiv_trans` is
  fixed by `WeilRestriction.compHopfEquiv_pointsMulEquiv`: on `R`-points both sides give the same
  `L`-algebra map out of `H`, through `L ⊗_E (E ⊗_F R) ≃ L ⊗_F R` (Mathlib
  `Algebra.TensorProduct.cancelBaseChange`). A Hopf isomorphism twisted by an automorphism of the
  group (inversion on `G_m`) satisfies every other clause but would make `resEquiv_trans` false.
  *Needs:* AA.1.1; ReductiveGroupsPartII, RG2.0a; GlobalNumberFields, layer 8; Mathlib
  `Algebra.TensorProduct.cancelBaseChange`.

  **Checks.**
  - For `G_E = G_m`, `resEquiv` is `(E ⊗ 𝔸_F)^× ≃ 𝔸_E^×`.
  - `Res_{E/F}(G_E)` is not the base change of `G_E`: for `E = ℚ(i)`, `Res G_m(ℚ) = ℚ(i)^×` while
    `G_m(ℚ) = ℚ^×`.
  - For `E = F`, the map on coefficient values is the tensor unit equivalence `F ⊗_F 𝔸_F ≃ 𝔸_F` (`resEquiv_self`).
  - For the tower `ℚ ⊂ ℚ ⊂ ℚ` and `G_m`, the tower isomorphism is the identity on points up to the
    unit equivalences (`compHopfEquiv_trivial_tower`); the inversion-twisted isomorphism sends the
    point `2` to `1/2` and fails.

- **The additive group.** (*ga-adelic*) For `G = G_a` (`H = F[T]` with `T` primitive), prove
  `G(𝔸_F) ≃ₜ+ 𝔸_F`, that the diagonal is `algebraMap F 𝔸_F`, and that
  *restricted-product-comparison* recovers `FiniteAdeleRing` as a restricted product ([Arthur],
  §2, p. 11). *Needs:* AA.1.1; Mathlib `NumberField.AdeleRing`, `IsDedekindDomain.FiniteAdeleRing`.
- **The multiplicative group and the ideles.** For `G = G_m`, prove
  `G(𝔸_F) ≃ₜ* NumberField.IdeleGroup (𝓞 F) F = 𝔸_F^×` with the units topology, and that under
  *restricted-product-comparison* the finite part is `Πʳ v, [F_v^×, 𝒪_v^×]` via
  `RestrictedProduct.unitsEquiv` ([Borel], §1.3, p. 7). *Needs:* AA.1.1; Tau Ceti
  `TauCeti.MultiplicativeGroup.pointsMulEquiv`; Mathlib `NumberField.IdeleGroup`,
  `RestrictedProduct.unitsEquiv`; GlobalNumberFields, layer 6.
- **The general linear group.** For `G = GL_n` with `n ≥ 1`, prove
  `G(𝔸_F) ≃ₜ* GL_n(𝔸_F) = (Matrix (Fin n) (Fin n) 𝔸_F)ˣ` with the units topology, and that its
  finite part is the restricted product `Πʳ v, [GL_n(F_v), GL_n(𝒪_v)]` ([Arthur], §2, p. 11).
  Both comparisons are the matrix of coordinates, `AdelicPoints.glnEquiv_apply` and
  `AdelicPoints.glnFiniteEquiv_apply`. *Needs:* AA.1.1; Tau Ceti
  `TauCeti.GeneralLinear.pointsMulEquiv`; AA.1.2; AA.1.4.

  **Checks.**
  - The inverse transpose `g ↦ (gᵀ)⁻¹` is also an isomorphism of topological groups
    `G(𝔸_{F,f}) ≃ GL_n(𝔸_{F,f})`; at `n = 1` it is inversion and differs from the comparison at
    every finite idele of order greater than two (`glnFiniteEquiv_not_inverse`).

### 1.5 Unimodularity and compact open levels

- **The modular character on compact and central elements.** For a locally compact group `G`,
  prove that the modular character `Δ : G → ℝ_{>0}` is a homomorphism trivial on every compact
  subgroup and on the centre of `G` ([Borel], §5.5, p. 20). *Needs:* Mathlib
  `MeasureTheory.Measure.modularCharacter`,
  `MeasureTheory.Measure.map_right_mul_eq_modularCharacterFun_smul`.
- **Weyl orbit products lie in the split centre up to finite index.** Let `A` be a maximal split
  torus of a connected reductive group over a field and `W` its relative Weyl group. For
  `a ∈ A(E)`, prove that the product `∏_{w∈W} w(a)` lies in `(Z(G) ∩ A)(E)` up to an element of
  a finite group; in particular some power of it lies in the split centre ([Borel], §5.5, p. 20).
  *Needs:* ReductiveGroups, layer 7; ReductiveGroupsPartII, RG2.1.
- **Local unimodularity of reductive groups.** For a connected reductive group `G` over a local
  field `E` of characteristic `0`, prove that the locally compact group `G(E)` is unimodular
  ([Borel], §5.5, p. 20). *Needs:* Mathlib `MeasureTheory.Measure.modularCharacter`;
  ReductiveGroupsPartII, RG2.4; RepresentationTheory/LieGroups, layer 9; AA.1.5.
- **Adelic groups of reductive groups are unimodular.** For a connected reductive group `G` over
  a number field `F`, prove that `G(𝔸_F)`, `G(𝔸_{F,f})` and `G(F_∞)` are unimodular ([Borel],
  §5.5, p. 20). *Needs:* AA.1.5; AA.0.3; AA.1.2.
- **Compact open subgroups and product levels.** For finitely generated `H`, prove that every
  compact open subgroup `U ⊂ G(𝔸_{F,f})` contains a product subgroup `∏_v U_v` with
  `U_v ⊂ G(F_v)` compact open and `U_v = 𝓗(𝒪_v)` for all but finitely many `v`, and is contained
  in such a product; and that any two compact open subgroups are commensurable ([Borel], §1.7,
  p. 8). *Needs:* AA.1.2; AA.0.1; ReductiveGroupsPartII, RG2.0.
- **Conjugation changes a level at finitely many places.** For finitely generated `H`,
  `g ∈ G(𝔸_{F,f})` and an integral model `𝓗`, prove that `g_v ∈ 𝓗(𝒪_v)` for all but finitely
  many `v`; hence for a product level `U = ∏_v U_v`, the conjugate `gUg⁻¹ = ∏_v g_v U_v g_v⁻¹`
  agrees with `U` at all but finitely many `v`, and `g` can be written as `g_B · u` with `g_B`
  supported on a finite set `B` of places and `u ∈ ∏_v 𝓗(𝒪_v)` ([Borel], §1.2, p. 7). *Needs:*
  AA.1.2; AA.1.5.

### Examples

`G_a(𝔸_F)` is `𝔸_F` and `G_m(𝔸_F)` is the idele group, with their finite parts the restricted
products of AA.0; the `GL_n` finite part is `Πʳ v, [GL_n(F_v), GL_n(𝒪_v)]`. The model `𝒪_{F,S}[X]`
with `X ↦ pT` shows that integral points depend on the Hopf identification. `ℚ^×` is discrete in
`𝔸_{ℚ,f}^×` while `SL_2(ℚ)` is not discrete in `SL_2(𝔸_{ℚ,f})`. The adelic squaring map of `G_m`
over `ℚ` has closed image of infinite index that is not open. `Res_{ℚ(i)/ℚ} G_m(ℚ) = ℚ(i)^×`.

### Dependencies

Layer AA.0; Tau Ceti's Hopf-algebra points and concrete-group comparisons;
ReductiveGroupsPartII, RG2.0, RG2.0a, RG2.1 and RG2.4; GlobalNumberFields, layers 4, 5, 6 and 8;
RepresentationTheory/LieGroups, layer 9; ReductiveGroups, layer 7.

## Layer 2: characters, quotient measures and Tamagawa measures

The character lattice separates the positive split centre from the norm-one subgroup. Develop
right-Haar quotient integration before applying it to rational quotients. Gauge forms
and convergence factors then fix a global normalization which respects the product formula and
restriction of scalars.

### 2.1 Characters, logarithms and the split centre

- **F-rational characters.** For `G = Spec H` an affine algebraic group over `F` with `H`
  finitely generated, define `RationalCharacter H := GroupLike F H`, the commutative group
  `X*_F(G)` of homomorphisms `G → G_m` defined over `F`, realized as the group-like elements
  `χ ∈ H` (`Δχ = χ ⊗ χ`, `ε(χ) = 1`) under multiplication; `RationalCharacter.apply` is the
  action on points, `χ x := x χ ∈ Rˣ` for a point `x : H →ₐ[F] R`. Prove
  `RationalCharacter.apply_mul` (`χ (x * y) = χ x * χ y` for the convolution product),
  `RationalCharacter.equivHom` (`RationalCharacter H ≃*` the bialgebra maps `F[T,T⁻¹] → H` under
  Mathlib's convolution product on `WithConv (F[T,T⁻¹] →ₐc[F] H)`, with
  `RationalCharacter.equivHom_apply_T`: the map attached to `χ` sends `T` to `χ`),
  `RationalCharacter.toGeometric_val` (the base change of `χ` to an algebraic closure is
  `1 ⊗ χ ∈ F̄ ⊗_F H`), `RationalCharacter.toGeometric_injective` (base change injects rational
  characters into Tau Ceti's geometric character group), `RationalCharacter.free` (for
  finite-type smooth geometrically reduced and geometrically connected `G`, the rational
  character group is free abelian of finite rank) and `RationalCharacter.toGeometric_range` (over
  a field `F` of characteristic zero, in particular a number field, the image of rational
  characters in the geometric character group is exactly the subgroup fixed by
  `Field.absoluteGaloisGroup F`); so `X*_F(G)` is equivalently the Galois-fixed subgroup of the
  geometric character group `X*(G_{F̄})` ([Arthur], §3, p. 16; [Borel], §1.3, p. 7). The two
  value equations are part of the specification: inversion `χ ↦ χ⁻¹` composed with the correct
  maps gives an injective `toGeometric` with the same Galois-fixed range, and a multiplicative
  bijection onto the bialgebra maps, so injectivity, range and multiplicativity alone do not fix
  either map. *Needs:* Mathlib `GroupLike`, `GroupLike.instCommGroup`, the convolution monoid on
  `WithConv (C →ₐc[R] A)` (`Mathlib/RingTheory/Bialgebra/Convolution.lean`); Tau Ceti
  `TauCeti.CommHopfAlgCat.geometricCharacterGroup`,
  `TauCeti.CommHopfAlgCat.instGeometricCharacterGroupGaloisAction`,
  `TauCeti.GeneralLinear.determinantGroupLike`, `TauCeti.GeneralLinear.pointsMulEquiv_determinantPoints`.

  **Checks.**
  - For `n ≥ 1`, `X*_F(GL_n) ≃ ℤ` and the actual generic determinant is sent to `1`, so every
    character is its unique integral power.
  - For `G_m`, the tautological character `T` corresponds to the identity map of `F[T,T⁻¹]`
    (`equivHom_tautological`), and `toGeometric T = 1 ⊗ T ≠ 1 ⊗ T⁻¹`
    (`toGeometric_not_inverse`); the inversion-twisted maps fail both.
  - For `E = ℚ(i)`, the rational characters of `Res_{E/ℚ} G_m` have rank `1`, not the rank `2` of
    the geometric character group.
  - The rational character group of `SL_n` is trivial, including `n = 0` and `n = 1` (`RationalCharacter.sln_trivial`).

- **Rational characters form a lattice.** (*rational-characters-free*) For `G = Spec H` affine
  algebraic over `F` with `H` finitely generated, `G` geometrically connected, smooth and
  geometrically reduced (automatic in characteristic zero by Cartier's theorem, a standing input
  of the Reductive groups roadmap), prove that `X*_F(G)` is a free abelian group of finite rank,
  and that for connected reductive `G`, restriction of `F`-rational characters to the identity
  component of the centre is injective with finite cokernel ([Borel], Lemma 5.9, p. 22; [Arthur],
  §5, p. 24). *Needs:* AA.2.1; Tau Ceti
  `TauCeti.CommHopfAlgCat.isMulTorsionFree_geometricCharacterGroup`; ReductiveGroups, layer 4; Tau
  Ceti `TauCeti.geometricallyReducedCommHopfAlgProperty`,
  `TauCeti.geometricallyConnectedCommHopfAlgProperty`.
- **The real vector space a_G.** For `G = Spec H` affine algebraic over `F` with `H` finitely
  generated and `G` geometrically connected, define
  `RealCharacterSpace H = Hom_ℤ(Additive X*_F(G), ℝ)`, the finite-dimensional real vector space
  `a_G`, with scalar multiplication on the codomain and the finite-dimensional topology from
  *rational-characters-free*; its dual is `a_G^* = X*_F(G) ⊗_ℤ ℝ` and its complexification
  `a_{G,ℂ}^* = X*_F(G) ⊗ ℂ`. Define `RealCharacterSpace.pairing`, the pairing
  `a_G × X*_F(G) → ℝ`, and `RealCharacterSpace.map`, the linear map `a_G → a_{G′}` given by a
  coordinate Hopf map `H′ → H` by precomposition with character pullback. Prove
  `RealCharacterSpace.finrank` (`finrank ℝ a_G` is the rank of `X*_F(G)`),
  `RealCharacterSpace.map_apply` (`map φ a χ′ = a (φ χ′)`, the pulled-back character being
  group-like by Mathlib `IsGroupLikeElem.map`), `RealCharacterSpace.map_id` (the map induced by
  the identity coordinate Hopf map is the identity on `a_G`) and `RealCharacterSpace.map_comp`
  (for coordinate Hopf maps `φ : H′ → H` and `ψ : H″ → H′`, `map(φ∘ψ) = map(ψ)∘map(φ)`)
  ([Arthur], §3, p. 16). Functoriality alone does not fix `map`: conjugating it by rescalings of
  the spaces `a_G` (by `2` on `a_{G_m}`, by `1` elsewhere) preserves `map_id` and `map_comp` and
  breaks `AdelicPoints.logHeight_map` for the diagonal `G_m → G_m²`. *Needs:* AA.2.1; Mathlib `IsGroupLikeElem.map`.

  **Checks.**
  - For `GL_n` with `n ≥ 1`, the rational character lattice is `ℤ·det` and `a_G` has real
    dimension `1`.
  - For `E = ℚ(i)` and `G = Res_{E/ℚ} G_m`, `finrank a_G = 1`, not `2`.
  - For `SL_n`, the real character space is zero (`RealCharacterSpace.sln_zero`).
  - For the squaring map of `G_m` (coordinate map `T ↦ T²`), `map` is multiplication by `2` on
    `a_{G_m} ≅ ℝ` (`map_square`).
  - For the diagonal `G_m → G_m²`, the first coordinate character of `G_m²` pulls back to `T`, so
    `map a` takes the value `a(T)` on it (`map_diagonal`); the functor conjugated by the rescaling
    `2` on `a_{G_m}` and `1` on `a_{G_m²}` satisfies `map_id` and `map_comp` and gives `a(T)/2`.

- **The Harish-Chandra map H_G.** For `G = Spec H` affine algebraic over `F` with `H` finitely
  generated and `G` geometrically connected, define `AdelicPoints.logHeight`, the continuous
  homomorphism `H_G : AdelicPoints H →* Multiplicative a_G` (an additive map to `a_G`) with
  `⟨H_G(x), χ⟩ = log ‖χ(x)‖` for `χ ∈ X*_F(G)`, where `χ(x) = χ_𝔸(x) ∈ 𝔸_F^×` and `‖·‖` is the
  idele norm `∏_v |·|_v`. Prove `AdelicPoints.logHeight_apply`
  (`⟪logHeight x, χ⟫ = Real.log ‖χ x‖`), `AdelicPoints.continuous_logHeight`,
  `AdelicPoints.logHeight_diagonal` (`logHeight (diagonal g) = 0`, the product formula),
  `AdelicPoints.logHeight_map` (`logHeight ∘ map φ = a(φ) ∘ logHeight`) and
  `AdelicPoints.logHeight_compact` (`logHeight` vanishes on every compact subgroup) ([Arthur], §3,
  p. 16). *Needs:* AA.2.1; AA.1.3; AA.1.4; GlobalNumberFields, layer 6; Tau Ceti
  `TauCeti.GlobalNumberFields.normalizedAbsValue`.

  **Checks.**
  - For `G = G_m`, `logHeight` is the logarithm of the idele norm.
  - `logHeight` is not computed from the archimedean component alone: for `F = ℚ`, the ideles `1`
    and (`p` at the place `p`, `1` elsewhere) have the same archimedean component but norms `1`
    and `p⁻¹`.
  - For `SL_n`, every value of `logHeight` is `1` in the multiplicative type tag, hence `0` in `a_G` (`logHeight_sln`).
  - The actual Hopf algebra `ℚ[ℤ^(ℕ)] = AddMonoidAlgebra ℚ (ℕ →₀ ℤ)` is not finite type,
    and its `logHeight` is not continuous for the specified module topology
    (`logHeight_infinite_rank`). Give the `n`th generator the positive archimedean value
    `exp 1`, every other generator value `1`, and all finite values `1`. These adelic points
    tend to the identity because every polynomial uses finitely many generators. Their
    logarithms are the coordinate vectors `e_n`. A linear functional on the character dual
    sending every `e_n` to `1` extends from their span and is continuous for `moduleTopology`,
    so these logarithms do not tend to zero. This is a failure on a specified Hopf carrier,
    not a conclusion inferred merely from infinite dimension. The topology fact is
    Mathlib `IsModuleTopology.continuous_of_linearMap`
    (`Topology/Algebra/Module/ModuleTopology.lean`).

- **H_G vanishes on rational points.** For `G = Spec H` affine algebraic over `F` with `H`
  finitely generated, prove `H_G(g) = 0` for `g ∈ G(F)` ([Arthur], §3, p. 16). *Needs:* AA.2.1; Tau
  Ceti `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`; Mathlib
  `NumberField.prod_abs_eq_one`.
- **The norm-one subgroup G(𝔸)^1.** For `G = Spec H` affine algebraic over `F` with `H` finitely
  generated and `G` geometrically connected, define `AdelicPoints.normOne`,
  `normOne H : Subgroup (AdelicPoints H) := logHeight.ker`, so that
  `G(𝔸_F)^1 = ker H_G = ⋂_{χ ∈ X*_F(G)} ker ‖χ‖`. Prove `AdelicPoints.isClosed_normOne`,
  `AdelicPoints.normOne_normal`, `AdelicPoints.diagonal_mem_normOne` (`diagonal g ∈ normOne`),
  `AdelicPoints.mem_normOne_iff` (`x ∈ normOne` iff `‖χ x‖ = 1` for every rational character `χ`)
  and `AdelicPoints.normOne_eq_top_of_no_characters` (if `X*_F(G) = 0` then `normOne = ⊤`); it
  is a closed normal subgroup containing `G(F)`, every compact subgroup and the commutator
  subgroup ([Arthur], §3, p. 16; [Borel], §5.8, p. 22). *Needs:* AA.2.1.

  **Checks.**
  - For `G_m`, `normOne` is the kernel of the idele norm of GlobalNumberFields layer 6; its image
    in the idele class group is that layer's `IdeleClassGroup.normOne`.
  - `normOne` is not `G(F_∞)^1 × G(𝔸_f)`: for `GL_1(𝔸_ℚ)` the idele (`p_∞ = p`, `p_p = p`, `1`
    elsewhere) has norm `1` but its archimedean component has `|p|_∞ ≠ 1`.
  - For `SL₂`, the norm-one subgroup is the full adelic group (`normOne_sl2`).

- **The split component A_G.** For a connected reductive group `G` over `F`, let
  `G₁ = Res_{F/ℚ} G`; `A_G` is the largest `ℚ`-split torus in the centre of `G₁`. Define
  `SplitComponent`, the subgroup `A_G(ℝ)^0` of `AdelicPoints H` (supported at the archimedean
  places), the identity component of the real points of `A_G` inside
  `G₁(ℝ) = G(F ⊗ ℝ) = G(F_∞) ⊂ G(𝔸_F)`, isomorphic to `(ℝ_{>0})^k` with `k = rank X*_F(G)`. Prove
  `SplitComponent.logHeight_equiv` (`logHeight` restricts to an isomorphism of topological groups
  `A_G(ℝ)^0 ≃ a_G`), `SplitComponent.central` (`A_G(ℝ)^0` is central in `G(𝔸)`) and
  `SplitComponent.inter_normOne` (`A_G(ℝ)^0 ∩ G(𝔸)^1 = {1}`) ([Arthur], §3, pp. 15–16; [Borel],
  §1.5, Proposition, p. 8). These clauses do not determine the subgroup. For `G = G_m × T¹` over
  `ℚ`, with `T¹` the norm-one torus of a real quadratic field (anisotropic over `ℚ`, split over
  `ℝ`), the graph `{(t, φ(t))}` of a nontrivial homomorphism `φ : ℝ_{>0} → T¹(ℝ)^0` is central,
  archimedean, meets `G(𝔸)^1` trivially and is carried isomorphically onto `a_G` by `H_G`, but it is
  not `A_G(ℝ)^0 = ℝ_{>0} × {1}`. The defining clause is
  `AdelicPoints.SplitComponent.eq_maximalCentralSplit`: if the Hopf ideal `I` cuts out the maximal
  central `F`-split torus `S` of `G`, then `A_G(ℝ)^0` consists of the archimedean points of `S` at
  which every character of `S` takes one positive real value `t` at all archimedean places
  (the maximal `ℚ`-split torus of `Res_{F/ℚ} S` has the real points of `S` with real scalar
  character values). For `G_m` this is `AdelicExamples.GL1.map_splitComponent`. *Needs:* AA.2.1;
  AA.1.4; AA.1.3; Tau Ceti `TauCeti.HopfIdeal.IsCentral`, `TauCeti.splitTorusCommHopfAlgProperty`.

  **Checks.**
  - For `GL_n`, `a_G` is one-dimensional and `SplitComponent` (the positive real scalars at `∞`
    for `F = ℚ`) is homeomorphic to `ℝ`.
  - For `G_m` over a number field `F`, `a_G` and `SplitComponent` are one-dimensional, whereas
    `(F ⊗ ℝ)^×_{>0}` has dimension `r₁ + r₂`: for `F` real quadratic the anti-diagonal direction
    is not split over `ℚ`.
  - For a connected reductive group with no rational characters, the split component is trivial (`SplitComponent.semisimple_trivial`).


  **Checks.**
  - In a real quadratic field (exactly two infinite places, both real), the idele with infinite
    components `2` and `1/2` and finite component `1` has norm `1` and lies outside
    `SplitComponent` (`SplitComponent.real_quadratic_antidiagonal`): its character value is not a
    scalar. This tests the subgroup, not just its dimension; the one-place subgroup
    `{(t, 1)}`, which passes the group-theoretic clauses, fails `map_splitComponent`.

- **H_G on the split centre.** (*log-height-split-centre-iso*) For a connected reductive group
  `G` over `F`, prove that the restriction of `H_G` to `A_G(ℝ)^0` is an isomorphism of
  topological groups onto `a_G`; in particular `H_G` is surjective ([Arthur], (5.1), p. 24).
  *Needs:* AA.2.1.
- **G(𝔸) = G(𝔸)^1 × A_G(ℝ)^0.** (*split-centre-decomposition*) For a connected reductive group
  `G` over `F`, prove that multiplication `G(𝔸_F)^1 × A_G(ℝ)^0 → G(𝔸_F)` is an isomorphism of
  topological groups ([Arthur], §3, p. 16). *Needs:* AA.2.1.
- **Two normalizations of the quotient.** (*quotient-norm-one-comparison*) For a connected
  reductive group `G` over `F`, prove that the inclusion `G(𝔸_F)^1 → G(𝔸_F)` induces a
  homeomorphism `G(F)\G(𝔸_F)^1 ≃ G(F)\G(𝔸_F)/A_G(ℝ)^0`, equivariant for `G(𝔸_F)^1` acting on the
  right. It is a theorem, not a definitional identity, and it fails if `A_G(ℝ)^0` is replaced by
  a larger central subgroup such as `Z(F_∞)^0` ([Arthur], §6, p. 30). *Needs:* AA.2.1; AA.1.3.


  **Checks.**
  - The identity norm-one class maps to the identity split quotient class
    (`normOneQuotient_identity`).
  - For `x ∈ G(𝔸)^1` and `a ∈ A_G(ℝ)^0`, the representatives `x` and `xa` give the same image
    (`normOneQuotient_split`).
  - Over a real quadratic field, the `(2,1/2)` idele with finite part `1` is nontrivial modulo
    rational points in the norm-one quotient, but becomes trivial after quotienting by the
    entire infinite centre (`normOneQuotient_larger_centre`).

### 2.2 Parabolic modulus and homogeneous integration

- **Modulus character of a parabolic.** For a finite-type affine `F`-group `P` with
  finite-dimensional identity cotangent space, define `Parabolic.modulus F H` as the idele
  norm of the determinant of its adjoint action on the scalar extension of its Lie algebra
  to `𝔸_F`. In particular, for a parabolic `P = M_P N_P` of a connected reductive group,
  the Levi adjoint determinant is one, so this is
  `δ_P(p) = ‖det(Ad(p) | Lie N_P)‖`. The determinant is the unit-valued determinant of
  `Derivation.adjointAction`, not an arbitrary character supplied as data. Prove
  `Parabolic.modulus_rational` (value `1` on rational points by the product formula) and
  `Parabolic.modulus_reductive` (identically `1` when `P` itself is connected reductive)
  ([Arthur], §5, p. 25). *Needs:* AA.2.1; Tau Ceti `Derivation.adjointAction`;
  Mathlib `LinearEquiv.det`; the idele norm of GlobalNumberFields.

  **Checks.**
  - The trivial group has modulus `1` (`Parabolic.modulus_trivial`).
  - `G_m` has modulus `1` on every idele; the modulus is not the tautological character
    (`modulus_gm`).
  - On `O(GL₂)/(X₁₀)`, with finite components the identity, the real matrices `diag(2,1)`
    and `diag(1,2)` have moduli `2` and `1/2`, but both ambient determinants have norm `2`
    (`modulus_borel_two`, `modulus_borel_reverse`).
- **Modular function of P(𝔸).** For a parabolic `P` of a connected reductive `G` over a number
  field `F`, prove that Mathlib's modular character (`map (·p) μ_l = Δ(p) μ_l`) on `P(𝔸_F)` is
  `δ_P`; with mutually inversion-normalized left and right Haar measures,
  `dμ_l(p) = δ_P(p)⁻¹ dμ_r(p)`. For a proper parabolic `δ_P` is nontrivial; for `P = G` it is `1`
  ([Arthur], §5, p. 25). The signature `Parabolic.modularCharacter_eq_modulus` states it for every
  finite-type `F`-group with finite-dimensional identity cotangent space: Mathlib's modular
  character of `P(𝔸_F)` is `Parabolic.modulus`, the idele norm of the adjoint determinant.
  *Needs:* AA.2.2; AA.1.5; AA.1.3; Tau Ceti `TauCeti.Cocharacter.leviDecompositionMulEquiv`;
  Mathlib `MeasureTheory.Measure.modularCharacter`; AA.0.3.

  The nonarchimedean input is RG2 `LocalIntegration.modularCharacter_eq_adjointModulus`
  over every nonarchimedean local field, together with `parabolic_adjointDet_eq_radical`.
  AA owns `Parabolic.exists_singlePlace` and `Parabolic.modulus_singlePlace`: a point
  supported at a finite place has exactly the local adjoint modulus after scalar extension.
  Multiplication gives the finite-support product comparison; continuity and the integral
  compact-open subgroups give the restricted-product statement. Archimedean factors use
  the real/complex analytic change of variables. SR consumes the RG2 theorem directly
  and changes coefficients under its residue-cardinality invertibility hypotheses.
  No square root occurs here; a choice of square root belongs to normalized induction.

  **Checks.**
  - `modulus_singlePlace_upper` and `modulus_singlePlace_opposite` put `diag(3,1)`
    at a residue-cardinality-three place of ℚ, with every other coordinate the identity:
    their adelic moduli are `1/3` and `3`. The general `modulus_singlePlace_local`
    example compares the local Haar modular character after base change. RG2's
    `adjointModulus_q3_upper`, `adjointModulus_q3_opposite`,
    `adjointModulus_f3Laurent_upper`, and `adjointModulus_f3Laurent_opposite`
    check these same local numbers in both characteristics.

  - For the upper triangular Borel of `GL₂/ℚ`, the real point `diag(2, 1)` has modular character
    `2` (`modularCharacter_borel_two`), not `1/2`: right translation by it doubles left Haar
    measure, as `(a, x) ↦ (2a, x)` does for `da dx/a²` in the coordinates `n(x) diag(a, 1)`.
- **Topology of a closed homogeneous quotient.** For a second countable locally compact
  Hausdorff topological group `G` and a closed subgroup `H ≤ G` acting by left multiplication,
  with `H\G` the orbit space with the quotient topology and `q : G → H\G` the projection, prove
  that `H\G` is locally compact, Hausdorff and second countable, that `q` is open, and that over
  each compact subset of `H\G` there is a compact subset of `G` whose image contains it
  ([Arthur], §1, pp. 7–9; [BHV], Appendix B.1, Lemma B.1.1, pp. 343–344). *Needs:* Mathlib
  locally compact groups and quotient topology.
- **Continuity and support of fibre averaging.** (*fibre-average-continuous*) For `G` a second
  countable locally compact Hausdorff group, `H ≤ G` closed with a right Haar measure `dh`, and
  `f ∈ C_c(G, ℝ)`, prove that `P f(Hg) = ∫_H f(hg) dh` is a continuous compactly supported function
  on `H\G`, with support contained in `q(support f)`, and that `P` preserves positivity
  ([Arthur], §1, pp. 7–9; [BHV], Appendix B.1, Lemma B.1.2, p. 344). *Needs:* AA.2.2.
- **A cutoff over a compact part of the quotient.** For `G` a second countable locally compact
  Hausdorff group, `H ≤ G` closed with a right Haar measure `dh`, `P` the fibre average of
  *fibre-average-continuous* and `C ⊂ H\G` compact, prove that there is `β ∈ C_c(G, ℝ)`, `β ≥ 0`,
  with `Pβ = 1` on `C` ([Arthur], §1, pp. 7–9; [BHV], Appendix B.1, Lemma B.1.2 and its proof,
  p. 344). *Needs:* AA.2.2.
- **Averaging over a closed subgroup is surjective on compact supports.** For a closed subgroup
  `H` of a locally compact Hausdorff group `G` and a right Haar measure `dh` on `H`, prove that
  `P : C_c(G) → C_c(H\G)`, `(Pf)(Hg) = ∫_H f(hg) dh`, is surjective, and that every `f ≥ 0` in
  `C_c(H\G)` is `Pφ` for some `φ ≥ 0` ([Arthur], §1, p. 7; [BHV], Appendix B.1, Lemma B.1.2 and
  its proof, p. 344). *Needs:* AA.2.2.
- **The right-Haar exchange identity.** For `G` a second countable locally compact Hausdorff
  group, `H ≤ G` closed, `dg` and `dh` right Haar measures on `G` and `H` with `Δ_G(h) = Δ_H(h)`
  for `h ∈ H` in the Mathlib `modularCharacter` convention, and `f, β ∈ C_c(G, ℝ)`, prove

  ```text
  ∫_G β(g) Pf(Hg) dg = ∫_G f(g) Pβ(Hg) dg
  ```

  ([Arthur], §1, pp. 7–9; [BHV], Appendix B.1, Lemma B.1.3, pp. 344–346). *Needs:* AA.2.2;
  Mathlib `MeasureTheory.Measure.modularCharacter`, `MeasureTheory.integral_prod`.
- **Weil's functional is well defined under the modular condition.** For `G` locally compact
  Hausdorff, `H` a closed subgroup, `dg` and `dh` right Haar measures and `Δ_G|_H = Δ_H` in
  Mathlib's modular-character convention, prove that for `f ∈ C_c(G)`, `Pf = 0` implies
  `∫_G f dg = 0`; hence `Pf ↦ ∫_G f dg` is a well-defined positive `G`-invariant functional on
  `C_c(H\G)` ([Arthur], §1, p. 9; [BHV], Appendix B.1, Lemma B.1.3, pp. 344–346). *Needs:* AA.2.2.
- **Invariant measure on a coset space.** (*quotient-measure*) Let `G` be a second countable
  locally compact Hausdorff group, `H ≤ G` a closed subgroup with `Δ_G` restricted to `H` equal
  to `Δ_H`, and `dg`, `dh` right Haar measures; invariance means the right `G`-action on `H\G`.
  Define `QuotientMeasure.measure`, the measure `dġ` on the right coset space `H\G` given `dg`,
  `dh` and the modular condition, and prove `QuotientMeasure.integral_eq`
  (`∫_G f dg = ∫_{H\G} ∫_H f(hg) dh dġ` for `f ∈ C_c(G)`), `QuotientMeasure.invariant` (invariance
  under the right action of `G`), `QuotientMeasure.unique` (any `G`-invariant Radon measure on
  `H\G` is a scalar multiple) and `QuotientMeasure.smul_left` (replacing `dh` by `c • dh`
  replaces `dġ` by `c⁻¹ • dġ`); so `dġ` is the unique `G`-invariant Radon measure with the
  integral identity ([Platonov–Rapinchuk–Rapinchuk], Theorem 3.64, pp. 189–190;
  use inversion to pass from the book's left action on `G/H` to our right action
  on `H\G`). *Needs:* AA.2.2; Mathlib
  `RealRMK.integral_rieszMeasure`, `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`,
  `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.
  **Checks.** The source quotient carries its Borel sigma algebra. On a two-point
  discrete space, the identity from the trivial sigma algebra to the full sigma algebra
  is not measurable; an arbitrary measurable-space instance does not suffice.

  **Checks.**
  - For `H = ⊥` with its normalized counting measure, the quotient measure transported to `G`
    equals `dg`.
  - For `G = SL_2(ℝ)` and `H` its upper triangular Borel, `Δ_G|_H ≠ Δ_H`; the canonical
    homogeneous quotient `ℙ¹(ℝ)` has no nonzero invariant Radon measure.
  - For the upper triangular Borel in `SL₂(ℝ)`, the modular characters disagree; its quotient admits no nonzero invariant Radon measure (`QuotientMeasure.borel_no_invariant`).

- **Tonelli extension of quotient integration.** For `G` a second countable locally compact
  Hausdorff group, `H ≤ G` closed, `dg`, `dh` right Haar measures with `Δ_G|_H = Δ_H`, `dġ` the
  quotient measure of *quotient-measure* and `f : G → [0, ∞]` Borel, prove that fibre integration
  is measurable on `H\G` and that `∫_G f = ∫_{H\G} ∫_H f(hg) dh`, valid in `[0, ∞]` ([Arthur],
  §1, pp. 7–9). *Needs:* AA.2.2.
- **Weil's formula for integrable functions.** In the setting of *quotient-measure*, for
  `f ∈ L¹(G)`, prove that `h ↦ f(hg)` is integrable on `H` for almost every `Hg`, that
  `Hg ↦ ∫_H f(hg) dh` is integrable on `H\G`, and that `∫_G f dg = ∫_{H\G} ∫_H f(hg) dh dġ`
  ([Arthur], §1, p. 9). *Needs:* AA.2.2.
- **Quotient measures in stages.** For `G` a second countable locally compact Hausdorff group,
  closed subgroups `H₁ ≤ H₂ ≤ G`, and right Haar measures on `G`, `H₂`, `H₁` with `Δ_G = Δ_{H₂}`
  on `H₂` and `Δ_{H₂} = Δ_{H₁}` on `H₁`, prove that the quotient measure on `H₁\G` is the product
  of those on `H₂\G` and `H₁\H₂`: `∫_{H₁\G} f = ∫_{H₂\G} ∫_{H₁\H₂} f(hg) dh dg` ([Arthur], §1,
  p. 9). *Needs:* AA.2.2.

  **Checks.**
  - In `{1} ≤ C₂ ≤ C₄` with counting measures, the intermediate quotient masses are `2`
    and `2`, and the final quotient has mass `4` (`QuotientMeasure.stages_unit`).
  - Multiplying the middle Haar measure by `2` changes the two masses to `1` and `4`;
    their product remains `4` (`stages_rescaled_middle`).
  - Also multiplying the bottom Haar measure by `3` gives masses `1` and `4/3`,
    and final mass `4/3` (`stages_rescaled_bottom`). The inner bottom measure is transported
    by `subgroupOfEquiv`; scaling the middle measure cancels, scaling the bottom does not.

- **Inversion between left and right quotient conventions.** For `G` second countable locally
  compact Hausdorff and unimodular, `Γ` a countable discrete subgroup, and a normalized Haar
  measure `μ` that is left and right invariant, prove that inversion sends `Γg` to `g⁻¹Γ`, giving
  a homeomorphism `Γ\G ≃ G/Γ` that preserves the correspondingly normalized quotient measures,
  and that it carries left-orbit unfolding to Mathlib's right `Γ.op`-orbit unfolding; use the
  fundamental-domain quotient measures and the integrability/measurability hypotheses of
  Mathlib's theorem ([Arthur], §1, p. 7). *Needs:* Mathlib
  `QuotientGroup.integral_eq_integral_automorphize`,
  `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`,
  `MeasureTheory.QuotientMeasureEqMeasurePreimage`.

### 2.3 Rational quotients

- **Borel fundamental domains for countable discrete subgroups.** For a countable discrete
  subgroup of a second countable locally compact Hausdorff group, use
  `MeasureTheory.Measure.exists_isFundamentalDomain_of_properlyDiscontinuousSMul`
  (`TauCeti/MeasureTheory/Group/ProperlyDiscontinuous.lean`). Translation is free, so its
  free-locus hypothesis is automatic. With the Borel sigma algebra, the supplied measurable
  domain is Borel. The construction by first occurrence in a countable cover meets every orbit.
- **Fundamental domains for rational points.** For `G = Spec H` affine algebraic over `F` with
  `H` finitely generated, and `G(𝔸_F)` (resp. `G(𝔸_F)^1`) unimodular — for instance `G` connected
  reductive, by AA.1.5 and *split-centre-decomposition*, so that Haar measure is invariant under
  left translation by `G(F)` — prove that `G(F)` acting on `G(𝔸_F)` (or `G(𝔸_F)^1`) by left
  translation admits a Borel fundamental domain, and that the quotient measure on
  `G(F)\G(𝔸_F)` equals the pushforward of the restriction of Haar measure to any measurable
  fundamental domain, independently of the choice (existence is the preceding Tau Ceti supplier;
  the quotient-measure identity is Mathlib's
  `IsFundamentalDomain.quotientMeasure_eq`, with unimodularity supplying left invariance). *Needs:*
  AA.1.3; AA.1.2; Mathlib `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`,
  `MeasureTheory.QuotientMeasureEqMeasurePreimage`; AA.2.2; AA.2.3.
- **The measure on the automorphic quotient.** For connected reductive `G` with a Haar measure
  `dx` on `G(𝔸_F)` and Lebesgue measure on `a_G` (normalized by the lattice dual to `X*_F(G)`),
  define `AutomorphicQuotient.measure`, the measure on `[G]^1 = G(F)\G(𝔸_F)^1` attached to `dx`:
  the quotient (*quotient-measure*) of the measure on `G(𝔸)^1` induced via
  *split-centre-decomposition*; and `AutomorphicQuotient.measure_split`, its transport to
  `G(F)A_G(ℝ)^0\G(𝔸_F)` by *quotient-norm-one-comparison*. Prove
  `AutomorphicQuotient.invariant` (right `G(𝔸)^1`-invariance),
  `AutomorphicQuotient.smul_haar` (scaling `dx` by `c` scales the quotient measure by `c`) and the
  normalization `AutomorphicQuotient.measure_mul_volume`: with `λ` the Haar measure on `a_G` giving
  the fundamental domains of `AutomorphicQuotient.integralLattice = Hom(X*_F(G), ℤ)` mass one, a
  measurable `A ⊆ G(𝔸)^1` meeting each `G(F)`-orbit at most once and a measurable `E ⊆ a_G`
  satisfy `dx(A · (H_G|_{A_G(ℝ)^0})⁻¹(E)) = vol([A]) · λ(E)` ([Borel], Theorem 5.8, p. 22).
  Invariance and linearity in `dx` also hold for `c(G) · vol` with a constant depending only on
  `G`; the normalization fixes the constant. *Needs:* AA.2.1; AA.2.2; AA.2.3; AA.1.5.

  **Checks.**
  - For `G` without rational characters (for instance semisimple `G`), `G(𝔸)^1 = G(𝔸)`, so the
    measure lives on `G(F)\G(𝔸)`.
  - For `GL_1`, the norm-one quotient has finite volume while the split component `ℝ_{>0}` is
    not compact, so `ℚ^×\𝔸^×` has infinite volume.
  - For `GL₁/ℚ`, the normalized idele measure gives the norm-one quotient total mass `1` (`AutomorphicQuotient.gl1_rat`).
  - The lattice condition fixes the scale of `λ`: doubling `λ` gives a fundamental domain mass
    `2` (`lattice_normalization_scale`). Over a quadratic field the positive scalar `t` has
    `H_G(t) = 2 log t`, so `λ` corresponds to `2 dt/t` on `A_{G_m}(ℝ)^0`, not `dt/t`.

### 2.4 Gauge forms and Tamagawa normalization

- **Invariant top-degree forms.** For a field `k` and a smooth affine algebraic group `G` of
  dimension `d` over `k` with coordinate Hopf algebra `H`, define `GaugeForm`, the top
  exterior-power line `ω_G = ∧^d_k (𝔪_ε/𝔪_ε²)` of the cotangent module `(ker ε)/(ker ε)²` at the
  identity, the space of left-invariant top-degree differential forms; a gauge form is a nonzero
  vector in it. Prove `GaugeForm.finrank_eq_one` (for smooth `G`, `finrank k (GaugeForm H) = 1`),
  `GaugeForm.baseChange` (`GaugeForm` commutes with base change `k → k′`, through the canonical
  map `GaugeForm.baseChange_tmul_ιMulti`: `c ⊗ (dh₁ ∧ ⋯ ∧ dh_d) ↦ c • (d(1 ⊗ h₁) ∧ ⋯ ∧ d(1 ⊗ h_d))`;
  both sides are lines, so a linear equivalence alone could be any rescaling of it) and
  `GaugeForm.rightTranslate` (right pullback by `g` acts on the left-invariant top-form line by
  `det(Ad(g))⁻¹`) ([Rosengarten], §1, p. 2). *Needs:* Tau Ceti `TauCeti.Bialgebra.CotangentSpace`,
  `Derivation.adjointPointRepresentation`; Mathlib `Ideal.Cotangent`, `Bialgebra.counitAlgHom`,
  `exteriorPower.ιMulti`; Tau Ceti `Derivation.adjointAction`; Mathlib `Module.evalEquiv`,
  `TensorProduct.lid`, `exteriorPower.map`.

  **Checks.**
  - For `G_m` the cotangent space at `1` is one-dimensional, spanned by the class of `T − 1`, so
    `GaugeForm` is spanned by `dT/T`.
  - For the upper triangular Borel of `GL_2`, right pullback by `diag(a,d)` multiplies a
    left-invariant gauge form by `(a/d)⁻¹`; for `a/d ≠ 1` it is not invariant.
  - For the trivial group, the degree-zero exterior power has dimension `1`, so the top-form line is the scalar field (`GaugeForm.trivial_group`).


  **Checks.**
  - On the concrete Hopf quotient `O(GL₂)/(X₁₀)`, `diag(2,1)` has adjoint determinant `2`,
    cotangent determinant `1/2` and right pullback `ω ↦ (1/2)ω` (`GaugeForm.borel_diag_two`).
  - `diag(1,2)` reverses these factors: `1/2`, `2` and `ω ↦ 2ω`
    (`borel_diag_reversed`). Thus pullback uses the inverse determinant.
  - The upper unipotent `[[1,1],[0,1]]` has both determinants `1` and fixes every invariant
    top form (`borel_unipotent`). These examples also check `adjointLinearEquiv` and
    `rightCotangent` on the named group, using the identity cotangent of the quotient Hopf algebra.
  - Along `ℚ → ℝ`, `1 ⊗ dT/T` for `G_m` goes to the class of `1 ⊗ T` itself
    (`GaugeForm.baseChange_gm`); the rescaled equivalence `2 • baseChange` would send it to twice
    that class.

- **The Haar measure of a gauge form over a local field.** For a nondiscrete locally
  compact field `K` of characteristic zero, a smooth affine algebraic `K`-group `G` of
  dimension `d`, and a nonzero left-invariant top form `ω` defined over `K`, construct
  `GaugeForm.analyticMeasure`: in a chart with `ω = f dx₁ ∧ ⋯ ∧ dx_d`, integrate
  `|f|_K` against the product additive Haar measure. Prove chart independence, left
  invariance and the change-of-variables formula. Use `vol(𝒪_K) = 1` at nonarchimedean
  fields, `dx` over `ℝ`, and `2 dx dy` over `ℂ`, with normalized absolute value
  `|z|_ℂ = z̄z`. [Platonov–Rapinchuk–Rapinchuk], Theorem 3.71, p. 196, and its
  construction on pp. 192–196 supply this statement under the standing characteristic-zero
  hypothesis of §3.1, p. 125. Their complex additive measure is `dx dy`; our measure
  is consequently `2^d` times theirs over `ℂ`.

  Prove `|cω| = |c|_K • |ω|` and, for every `g ∈ G(K)`,
  `Measure.map (· * g) |ω| = |det Ad(g)|_K • |ω|`.
  A scalar multiplies a top form once, regardless of `d`: the exponent `d`
  printed in the scalar-rescaling sentence of the proof of Theorem 5.22, p. 315,
  is incompatible with the chart construction and is not used here.
  The latter translation identity is a consequence of change of variables and
  `R_g^*ω = det Ad(g)⁻¹ • ω`; pullback and measure pushforward have reciprocal factors.
  The representative `analyticMeasure` signatures use arbitrary characteristic-zero
  nonarchimedean local fields. For a number field `F`, finite `v` and `G/F`, retain
  `GaugeForm.localMeasure` as the specialization to the scalar extension of `ω` to `F_v`,
  and prove `localMeasure_eq_analyticMeasure` through the point adjunction. The existing `localMeasure_isHaar`,
  `localMeasure_smul` and `localMeasure_rightTranslate` signatures are the corresponding
  specialization (the last takes rational `g`). At the archimedean places the product
  `GaugeForm.archimedeanMeasure ω = ∏_{w|∞} |ω|_w` on `G(F ⊗ ℝ)` carries
  `archimedeanMeasure_isHaar`, `archimedeanMeasure_smul` (a scalar `c ∈ F` multiplies it by
  `∏_w |c|_w`, squared at complex places) and `archimedeanMeasure_ga` (for `G_a` it is
  `infiniteAdeleHaar`). These clauses determine the measures attached to `G_a` and to `G_m`; for
  a general group the constant is fixed by the chart construction or by Weil's formula below, which
  has a signature only for `GL_n` at finite places. *Needs:* AA.2.4; ReductiveGroupsPartII, RG2.0, point topology and
  analytic charts.

  **Checks.**
  - For `G_a` with coordinate `T`, the image of `localMeasure dT` under `x ↦ x(T)` is the
    standard Haar measure of `F_v` (`𝒪_v` of volume `1`).
  - `localMeasure (dT/T)` on `ℚ_p^×` is not the normalized idele measure of AA.0.4: they differ
    by the factor `1 − p⁻¹ ≠ 1`.
  - For `G_m`, the actual mass of integral units is `1 − q_v⁻¹`, in particular `1/2` when `q_v = 2` (`localMeasure_gm_units`; the numerical specialization is `localMeasure_q_two`).

  - For `G_a/ℂ` and `ω = dz`, the unit square has mass `2`; for `G_a²/ℂ`
    the product square has mass `4`. These are `complex_volume_one` and
    `complex_volume_two`; replacing `2 dx dy` by `dx dy` would give `1` in both cases.
  - The square `[0,2] × [0,2]` has mass `8` (`complex_volume_scaled`), four times the
    unit square's mass. The real segment `[0,1] × {0}` has mass zero
    (`complex_volume_degenerate`). Both test `GaugeForm.complexCoordinateMeasure` itself.

- **Weil's volume formula for integral points.** Let `𝓗` be a smooth affine group scheme of
  relative dimension `d` over `𝒪_v` with residue field `k_v` of order `q_v`, and `ω` a gauge form
  of the generic fibre that extends to a generator of the invariant top forms of `𝓗`. Prove
  `|ω|_v(𝓗(𝒪_v)) = #𝓗(k_v) · q_v^{−d}` ([Gordon], §2.1, equation (1), p. 3). For the standard
  model of `GL_n` and the wedge of the coordinate classes `d(X_ij − δ_ij)` this is the signature
  `GaugeForm.localMeasure_gln_integral`; it fixes the scale of `localMeasure` on `GL_n`, which the
  scaling and translation clauses leave open. *Needs:* AA.2.4; AA.1.1.

  **Checks.**
  - For `GL₂` at `q_v = 2`, `|ω|_v(GL₂(𝒪_v)) = 6/16 = 3/8` (`localMeasure_gln_two`); a measure
    normalized by `vol(GL₂(𝒪_v)) = 1` satisfies the other clauses and gives `1`.
- **Convergence factors from the character module.** (*convergence-factors*) For `G = Spec H`
  affine algebraic over `F` with `H` finitely generated and `G` connected, let
  `X = X*(G_{F̄}) ⊗ ℂ` with its continuous finite-image Galois action. The local Artin
  factor is `L_v(X,s) = det(1 − q_v^{−s} Frob_v | X^{I_v})⁻¹`.
  The split specialization is
  `Tamagawa.splitLocalFactor F v r s = (1 − q_v^{−s})^{−r}` and
  `Tamagawa.splitLeadingCoeff F r = (dedekindZeta_residue F)^r`.
  AA owns the general supplier `FiniteImageArtin`: for a continuous finite-image
  complex representation of the absolute Galois group, `localFactor` uses inertia
  invariants; `localFactor_induction` includes ramified places.
  `globalL_eq_eulerProduct` identifies the Euler product on `Re s > 1`;
  `leadingCoeff_nonzero` proves that `(s−1)^r L(X,s)` has a finite nonzero limit,
  where `r = dim X^Gal`. For a character lattice, `characterLeadingCoeff_pos`
  proves positivity of this real limit. These targets feed
  `Tamagawa.characterLocalFactor`, `characterLeadingCoeff`, and
  `measure_eq_product_artin`. The split formulas remain specializations, with
  `characterLocalFactor_split` and `characterLeadingCoeff_split`.
  Brauer induction reduces this construction to finite-order Hecke characters.
  Consume the two contracts in the table above, including `heckeLFunctionC_eq_primitive`
  and `heckeLFunction_ne_zero_of_one_le_re`; the analytic dependency is
  AA → LFunctions #248 → ThetaSeries #286, with GlobalNumberFields and
  ArithmeticDirichletSeries providing the carriers. The analytic hypotheses of
  `leadingCoeff_nonzero` are precisely that Hecke/reciprocity contract.
  AA constructs finite-image representations, inertia invariants, induction and their
  determinant identities. General Artin coefficients need not be completely multiplicative
  and do not inhabit `UnitaryIdealWeight`.
  Use arithmetic Frobenius throughout; if a reciprocity API uses geometric Frobenius,
  compose its reciprocity map with inversion before forming the Hecke character.
  A one-dimensional unramified factor is
  `(1 − χ(Frob_v) q_v^(−s))⁻¹`. At conductor primes with nontrivial inertia the
  one-dimensional invariant space is zero and the factor is one. For a larger ray modulus,
  #248's `eulerCorrection` deletes precisely its additional factors; compare germs at poles,
  not totalized point values. Brauer induction and the zeta residue then give the limit:
  [Marzec–Neururer], Definition 5.11 and Remark 5.12, p. 62; Theorem 5.14,
  pp. 62–64; Theorem 5.20 and Corollary 5.21, p. 67. Integral character lattices
  give positive real factors for real `s > 1`, hence a positive nonzero leading coefficient.
  A partial Euler product has the full leading coefficient multiplied by the deleted
  factors' inverses at one; restoring those factors recovers the full coefficient.
  *Needs:* Tau Ceti `TauCeti.CommHopfAlgCat.geometricCharacterGroup`,
  `TauCeti.CommHopfAlgCat.instGeometricCharacterGroupGaloisAction`; AA.2.1;
  Mathlib `NumberField.dedekindZeta_residue_pos`,
  `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`;
  Tau Ceti `TauCeti.dedekindZeta_eulerProduct_hasProd`; the Hecke/reciprocity contracts above.

  **Checks.**
  - `artin_trivial_zeta` identifies the rank-one trivial determinant Euler product with
    Dedekind zeta. `globalL_trivial_eq_zeta` is the general meromorphic-germ target.
  - `artin_quadratic_hecke` identifies the nontrivial character of ℚ(i)/ℚ with the
    primitive character χ₄, hence with #248's `oddPrimitiveModFour` under reciprocity.
    Its factor at 2 is one. `artin_hecke_imprimitive` raises modulus 4 to 12 and obtains
    the correction `1 + 3^(−s)`. These are specializations of `oneDimensional_eq_hecke`.
    `artin_arithmetic_frobenius_cubic` distinguishes eigenvalue ζ from ζ⁻¹ for a
    nontrivial cube root of unity: at q=2 and s=1 the factors are distinct.
  - `artin_induced_gaussian_zeta` identifies `Ind_{ℚ(i)}^ℚ 1 = 1 ⊕ χ₄` with ζ_{ℚ(i)}
    on the convergence half-plane and as meromorphic germs. The general target
    `globalL_induced_trivial_eq_zeta` is `L_F(Ind_E^F 1,s)=ζ_E(s)` for every finite
    separable extension, using the ramified induction identity at every place.
    The existing `localFactor_ramified_gaussian` still checks the inertia-fixed line at 2.

  - Rank zero gives `splitLocalFactor F v 0 s = 1`, including at `s = 1`
    (`splitLocalFactor_rank_zero`).
  - For a place of residue cardinality `2`, rank one at `s = 1` gives `2`
    (`splitLocalFactor_rank_one`), as for `G_m`.
  - At the same place rank two gives `4`, as for `G_m²`
    (`splitLocalFactor_rank_two`). This interface applies only to trivial Galois action.
  - `splitLeadingCoeff F 0 = 1` (`splitLeadingCoeff_rank_zero`);
    `splitLeadingCoeff F 1 = dedekindZeta_residue F` (`splitLeadingCoeff_rank_one`);
    `splitLeadingCoeff F 2` is the square of that residue (`splitLeadingCoeff_rank_two`).
    The local rank-two factor and double-pole coefficient both use the exponent `2`.
- **Orders of connected reductive groups over finite fields.** For a connected reductive
  group `H/𝔽_q`, choose a Frobenius-stable Borel pair `(B,T)` over the algebraic closure.
  Put `W = W(H,T)`, `N = #Φ⁺` and let `F*` act on `X*(T)`. Prove
  `#H(𝔽_q) = q^N · #T(𝔽_q) · ∑_{w∈W^F} q^{ℓ(w)}` and
  `#T(𝔽_q) = |det(F* − 1 | X*(T) ⊗ ℚ)|`.
  Use absolute Weyl-group length. These are [Dudas–Michel], Proposition 7.12(iii),
  p. 27, and the character-lattice cokernel argument in Proposition 7.14, p. 28;
  the absolute value makes the determinant the lattice index. Build this input here
  from ReductiveGroups, layer 7 (Lang and Bruhat decomposition).

  **Checks.** Split rank one at `q = 2` gives `|2 − 1| = 1`; nonsplit rank one
  gives `|−2 − 1| = 3`, not `−3` (`finite_torus_split`, `finite_torus_nonsplit`).
  For split `SL₂/𝔽₂`, the formula gives `2 · 1 · (1 + 2) = 6`
  (`finite_reductive_sl2`).

- **Absolute convergence of the corrected volumes.** For connected reductive `G` with an
  integral model `𝓗` smooth with connected reductive fibres away from `S` (`𝓗` reductive over
  `𝒪_{F,S}`), prove that the product `∏_{v∉S} λ_v #𝓗(k_v) q_v^{−d}` converges absolutely, and that
  for every such `G` the corrected factors are `1 + O(q_v^{−2})`, with a constant
  independent of `v`; for semisimple `G`, `λ_v = 1`. Derive this from the preceding
  order formula: writing `F* = qθ`, the `q⁻¹` coefficient of the normalized torus
  order is `−tr θ` on `X*(T)`, while the Bruhat sum contributes the trace on the
  simple-root span. The difference is minus the trace on `X*(H)`, cancelled by
  `L_v(X*(G),1)`. Higher coefficients are uniformly bounded by the fixed root datum.
  Sum `q_v⁻²` using the Dedekind zeta Euler product at `2`. This is a derivation,
  not an assertion of [Rosengarten], §3, p. 25. *Needs:* AA.2.4;
  AA.1.1 (`IntegralModel.exists_reductive`); ReductiveGroups, layer 7;
  `TauCeti.dedekindZeta_eulerProduct_hasProd`.
- **Tamagawa measure.** For `G = Spec H` affine algebraic over `F` with `H` finitely generated,
  `G` smooth connected of dimension `d`, `ρ_G` existing by *convergence-factors*, finite and
  strictly positive, and the product of corrected integral volumes absolutely convergent and
  nonzero, define `Tamagawa.measure G : Measure (AdelicPoints H)`,
  `τ_G = |d_F|^{−d/2} ρ_G⁻¹` times the convergent Haar product of `μ_v = λ_v |ω|_v`. At finite
  `v`, `λ_v = L_v(X*(G_{F̄}) ⊗ ℂ, 1)`, including ramified inertia invariants; at infinite `v`,
  `λ_v = 1`. Use the specified additive normalizations `dx`, `2 dx dy` and `vol(𝒪_v) = 1`.
  Connected reductive groups satisfy the separate convergence target above. If the geometric
  character lattice is zero, `λ_v = ρ_G = 1`, but the gauge integral masses still need the
  convergent-product construction. Prove `Tamagawa.measure_isHaar`,
  `Tamagawa.measure_eq_product_artin` for every connected reductive group,
  with `characterLocalFactor` and `characterLeadingCoeff`;
  `Tamagawa.measure_eq_product` is its split-character specialization (on a product of finitely many local sets and almost all `𝓗(𝒪_v)`
  it is `|d_F|^{−d/2} ρ_G⁻¹ ∏ λ_v |ω|_v(C_v)`; the signature covers groups whose geometric
  characters are all rational, `RationalCharacter.toGeometric` surjective, where
  `λ_v = Tamagawa.splitLocalFactor F v r 1` and `ρ_G = Tamagawa.splitLeadingCoeff F r`, with the
  archimedean factor `GaugeForm.archimedeanMeasure`), `Tamagawa.measure_ga` (for `G_a` it is
  `|d_F|^{−1/2} • adeleHaar`) and `Tamagawa.measure_res` (compatibility with restriction of
  scalars, *tamagawa-restriction-scalars*). The Haar-product construction is
  [Platonov–Rapinchuk–Rapinchuk], proof of Theorem 5.22, p. 315; the canonical
  Artin and scalar-restriction normalizations use the named suppliers in
  *convergence-factors* and AA.2.5. [Gordon], equation (48), p. 32, checks the
  imaginary-quadratic restriction torus, not the general normalization theorem. *Needs:* AA.2.4; AA.0.2; AA.0.3;
  AA.0.4.

  **Checks.**
  - For `G_a` over `ℚ`, `Tamagawa.measure` of the `ℚ\𝔸` fundamental domain `[0,1) × ℤ̂` is `1`.
  - For `G_m` the naive product `∏ |dT/T|_p` does not give a nonzero Haar measure on `𝔸^×`: the volumes `1 − p⁻¹`
    have product `0` because `Σ_p 1/p` diverges; `Tamagawa.measure` uses `λ_v = (1 − q_v⁻¹)⁻¹` and
    `ρ = Res ζ_F`.
  - For the trivial group and any nonzero form, the measure is the unit point mass (`Tamagawa.measure_trivial`).
  - For `G_m`, `λ_v · |dT/T|_v(𝒪_v^×) = (1 − q_v⁻¹)⁻¹ (1 − q_v⁻¹) = 1` at every finite place
    (`splitLocalFactor_cancels_gm`), so the integral factors in `measure_eq_product` are `1`; with
    `λ_v = 1` their product over all `v` would be `0`.
  - Over an imaginary quadratic field, scaling the form by `2` scales the archimedean factor by
    `|2|_ℂ = 4` (`archimedeanMeasure_complex_scalar`); the measure `dx dy` at the complex place
    would also give `4`, but a factor `|c|` instead of `|c|²` would give `2`.

- **Independence of the gauge form.** For `G = Spec H` affine algebraic over `F` with `H`
  finitely generated, prove that `τ_G` does not depend on the gauge form `ω`: replacing `ω` by
  `cω` with `c ∈ F^×` multiplies each `|ω|_v` by `|c|_v`, and `∏_v |c|_v = 1` ([Rosengarten], §1,
  p. 2). *Needs:* AA.2.4; Tau Ceti `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`;
  AA.0.3.
- **Corrected volumes for GL_n and SL_n.** For `n ≥ 1` and the standard models of `GL_n` and `SL_n` over
  `𝒪_F` and their standard gauge forms, prove that at every finite place `v`,
  `λ_v · #GL_n(k_v) q_v^{−n²} = ∏_{i=2}^{n} (1 − q_v^{−i})` with `λ_v = (1 − q_v^{−1})^{−1}`, and
  `#SL_n(k_v) q_v^{−(n²−1)} = ∏_{i=2}^{n} (1 − q_v^{−i})`; both products over `v` converge
  absolutely (derive from the preceding order formula; [Platonov–Rapinchuk–Rapinchuk],
  Example 5.23, p. 316, computes the `SL₂/ℚ` case). *Needs:* AA.2.4.
  **Checks.** At `q = 2`, `#GL₂(𝔽₂) = 6`, so the corrected volume is
  `2 · 6/16 = 3/4`. In rank zero the group has one element and dimension zero;
  the GL correction would give `2`, whereas the empty product is `1`. Thus the
  displayed corrected GL formula requires `n ≥ 1`. There is no field of cardinality one.

- **Tamagawa number.** For connected reductive `G`, define `Tamagawa.number G : ℝ≥0∞`,
  `τ(G) = vol(G(F)\G(𝔸_F)^1)` for the measure on `G(𝔸)^1` induced by `τ_G` and the Lebesgue
  measure on `a_G` normalized by the lattice `Hom(X*_F(G), ℤ)` (through
  *split-centre-decomposition* and *log-height-split-centre-iso*), with counting measure on
  `G(F)`, as an element of `[0, ∞]`. Prove `Tamagawa.number_pos` (`Tamagawa.number G > 0`) and
  `Tamagawa.number_res` (`Tamagawa.number (Res_{E/F} G) = Tamagawa.number G`); its finiteness is
  AA.3.4 ([Rosengarten], §1, p. 3). *Needs:* AA.2.4; AA.2.3; AA.2.1.

  **Checks.**
  - For the trivial group `τ = 1`.
  - `τ(G_m) = 1`: with the convergence factors `λ_v = (1 − q_v^{−1})^{−1}` of the preceding
    bullet, the gauge form `dx/x`, the archimedean normalisations of the Conventions and the
    measure `[F:ℚ] dt/t` on the diagonal scalar parameter of `A_{G_m}(ℝ)^0 = ℝ_{>0}`, the volume of
    `F^×\𝔸_F^1` is `1` (Weil; this is the residue formula
    `res_{s=1} ζ_F = 2^{r₁}(2π)^{r₂} h R / (w |d_F|^{1/2})` in measure-theoretic form). For
    `F = ℚ(i)` (`r₂ = 1`, `|d_F| = 4`, `h = R = 1`, `w = 4`) the residue is `π/4` and the idele
    volume of `F^×\𝔸_F^1` is `π/2`, so `τ = (1/2)(4/π)(π/2) = 1`; omitting `|d_F|^{−1/2}` gives `2`
    and omitting the factor `2` at the complex place gives `1/2` (`number_gm_gaussian`). Over `ℚ`
    neither omission changes the value, so `ℚ` alone does not test these conventions; omitting the
    convergence factors gives the zero measure over every field.
  - `vol(G_m(F)\G_m(𝔸)) = ∞` because the split component `ℝ_{>0}` is not compact; `τ` uses the
    norm-one quotient.

**Checks.** For the diagonal positive scalar `t` in `G_m/F`, the idele norm is
`t^[F:ℚ]`. At degree two, `t = 2` gives norm `4` and logarithm `2 log 2`.
Consequently the lattice-normalized logarithmic measure is `2 dt/t` in this case.

### 2.5 Scalar Jacobians and restriction of scalars

The linear measure input in the next target is MassFormula #226, Layer 2:
for a complete discretely valued field with finite residue field, use its lattice
index and regular-Haar scaling laws, extending integral invertible matrices to
arbitrary invertible matrices by a scalar denominator. Pushforward has inverse
absolute determinant. AA additionally compares the additive measures of a finite
extension and a chosen base-field basis, then handles nonlinear analytic charts,
gauge forms and the global discriminant; these are not supplied by the linear law.

- **Finite-place scalar Jacobian for a chosen basis.** (*restriction-finite-jacobian*) For
  `E/F` a finite extension of number fields of degree `n`, `v` a finite place of `F`, `β` an
  `F`-basis of `E` read as `β : F_v^n ≃ E ⊗ F_v ≅ ∏_{w|v} E_w`, and Haar measures on `F_v` and
  every `E_w` giving the valuation rings volume `1`, let `L_{β,v} = ∑_j 𝒪_v β_j`. Prove
  `j_{β,v} = vol_{∏ E_w}(L_{β,v})⁻¹`; in particular `j_{β,v} = 1` when `β` is an `𝒪_v`-basis of
  `∏_{w|v} 𝒪_w`. Derive this from uniqueness of additive Haar measure
  ([Platonov–Rapinchuk–Rapinchuk], Theorem 3.60, p. 186): the basis map sends the
  unit box of mass one to `L_{β,v}`, which fixes the reciprocal factor. *Needs:* AA.0.1; AA.1.4.
- **Archimedean scalar Jacobian for a chosen basis.** (*restriction-infinite-jacobian*) For
  `E/F` a finite extension of number fields of degree `n`, `v` an infinite place of `F`, and `β`
  an `F`-basis of `E` read as the real-linear map `F_v^n → E ⊗ F_v ≅ ℝ^a × ℂ^b` (`F_v = ℝ`) or
  `ℂ^n` (`F_v = ℂ`), with measures `dx` on `ℝ` and `2 dx dy` on `ℂ` on both sides: if `F_v = ℝ`
  and `E ⊗ F_v = ℝ^a × ℂ^b`, let `D_{β,v}` be the real determinant of the basis map in real and
  imaginary coordinates and prove `j_{β,v} = 2^{−b} |D_{β,v}|⁻¹`; if `F_v = ℂ`, prove
  `j_{β,v} = |det_ℂ β|^{−2}`. This is the ordinary real change-of-variables
  calculation in the chart construction preceding [Platonov–Rapinchuk–Rapinchuk],
  Theorem 3.71, pp. 192–196, with the `2 dx dy` convention above: the target has
  `b` extra factors of two in the real-place case; at a complex place both sides
  have `n` such factors and they cancel.
  *Needs:* AA.0.4; AA.1.4.
- **Global scalar Jacobian and absolute discriminants.** For `E/F` a finite extension of number
  fields of degree `n`, an `F`-basis `β` of `E`, `j_{β,v}` as defined in
  *restriction-finite-jacobian* and *restriction-infinite-jacobian*, and `d ≥ 0`, prove that the
  positive factors `j_{β,v}` equal `1` at almost all finite `v` and that
  `∏_v j_{β,v} = |d_F|^{[E:F]/2} |d_E|^{−1/2}`; thus `|d_F|^{−nd/2} ∏_v j_{β,v}^d = |d_E|^{−d/2}`.
  This is `ScalarJacobian.global_product`, deduced from the two local Jacobians.
  Use `NumberField.discr_eq_of_integralBasis` to identify the integral trace
  determinant, `Algebra.discr_of_matrix_vecMul` for the square of a basis-change
  determinant, and `AddSubgroup.index_eq_natAbs_det` on global ℤ-lattices
  after clearing denominators. Decompose their finite quotient into its primary
  parts to obtain the local lattice indices; no local integer ring is assumed
  finite over ℤ. At real places the embedding determinant has
  the factor `2^b` already present in the complex Haar normalization. Multiply
  these equalities and use
  `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one` on the nonzero
  basis-change determinant to remove the choice of basis. Thus no arbitrary
  basis is assumed integral at every place. This is an owned deduction from
  these exact APIs, not a generalization of the quadratic-torus calculation.
  *Needs:* the preceding finite and infinite Jacobians; NumberFieldArithmetic,
  layer 4; the exact trace, index and product-formula suppliers above.

- **Gauge forms under restriction of scalars.** For `E/F` finite and `ω_E` a gauge form, choose
  an `F`-basis `β` of `E` and an `E`-basis of the cotangent space dual to `ω_E`, and let `ω_β`
  be the `F`-top form dual to the ordered `F`-basis `β_j e_i` of the restricted cotangent space.
  At `v`, transport `|ω_β|_v` to `G_E(∏_{w|v} E_w)` and prove that it equals
  `j_{β,v}^d ∏_{w|v} |ω_E|_w`, where `j_{β,v}` is defined by
  `(β-coordinates)_* μ_{F_v}^{[E:F]} = j_{β,v} ∏_{w|v} μ_{E_w}`. It depends on `β` and is not an
  unspecified square root of a local discriminant. This is a chartwise deduction
  from the preceding local Jacobians and [Platonov–Rapinchuk–Rapinchuk],
  Theorem 3.71, p. 196; it does not use a general scalar-restriction assertion
  from [Rosengarten], §1, p. 2. *Needs:* AA.2.4;
  AA.1.4; GlobalNumberFields, layer 0; AA.2.5.
- **Inductivity of the convergence factors.** For a finite separable `E/F` and a finite-image
  complex Galois representation `X` over `E`, prove that the induced representation satisfies
  `L_v(Ind X, s) = ∏_{w|v} L_w(X, s)` at every finite `v`, including ramified `v` with inertia
  invariants; consequently their global Euler products coincide for `Re(s) > 1` and their leading
  coefficients coincide whenever the stated nonzero limits at `s = 1` exist.
  This is `FiniteImageArtin.localFactor_induction`, proved using the
  decomposition-group double cosets and the determinant on the inertia-fixed
  cyclic blocks of length `f(w/v)`. [Marzec–Neururer], Proposition 5.10, pp. 61–62,
  and Theorem 5.14(iv), pp. 63–64. *Needs:* AA.2.4, finite-image Artin factors.

  **Checks.** For `ℚ(i)/ℚ` at `2`, inertia swaps the two basis vectors of
  `Ind 1`. Its invariant space is the diagonal line, Frobenius is identity
  there, and both factors are `(1−2^{−s})⁻¹`; using the full two-dimensional
  space incorrectly squares the factor (`localFactor_ramified_gaussian`).
  Rank-zero inertia invariants give factor one (`localFactor_zero`).
  A residue-degree-two block has determinant `1−z²`, not `(1−z)²`
  (`localFactor_residue_degree_two`).

- **Tamagawa measures and restriction of scalars.** (*tamagawa-restriction-scalars*) Let `E/F`
  be a finite extension of number fields and `G_E` a connected reductive `E`-group of dimension
  `d`, with the Artin leading coefficients and Haar products having the existence and
  convergence proved in the named inputs. Prove that the canonical topological group isomorphism
  `Res_{E/F} G_E(𝔸_F) → G_E(𝔸_E)`, together with the induced character-space map and its
  integral-lattice Lebesgue normalization, transports Tamagawa measures and norm-one quotient
  measures; in particular the Tamagawa numbers agree. The extension to connected nonreductive
  groups requires the Levi/unipotent integration input of AA.3. This is an owned
  deduction from the preceding three comparisons; its inputs are `FiniteImageArtin.localFactor_induction`,
  `leadingCoeff_nonzero`, `ScalarJacobian.global_product` and
  `Tamagawa.measure_eq_product_artin`.
  [Gordon], equation (48), p. 32, is a quadratic-torus Check only. The signatures are
  `Tamagawa.measure_res` (`resEquiv` carries `τ_{Res G_E}` to `τ_{G_E}`) and `Tamagawa.number_res`,
  for arbitrary nonzero gauge forms on the two sides, which is legitimate because `τ` does not
  depend on the form (`Tamagawa.measure_smul` and the one-dimensional top-form line).
  *Needs:* AA.2.4; AA.1.4; GlobalNumberFields, layer 0; NumberFieldArithmetic, layer 4; AA.2.5.

  **Checks.**
  - `τ(Res_{E/F} G_m) = τ(G_m) = 1` although `Res_{E/F} G_m` has dimension `[E : F]`
    (`number_res_gm`). Without the factors `|d|^{−d/2}` the two sides would be multiplied by
    `|d_F|^{[E:F]/2}` and `|d_E|^{1/2}`, which are `1` and `2` for `ℚ(i)/ℚ`.

### Examples

`X*_F(GL_n) ≃ ℤ`, generated by the determinant, and `a_{GL_n}` is one-dimensional; for
`Res_{ℚ(i)/ℚ} G_m` the rational rank is `1` while the geometric rank is `2`. The norm-one idele
`(p, p, 1, …)` separates `G(𝔸)^1` from `G(F_∞)^1 × G(𝔸_f)`. `ℙ¹(ℝ) = B\SL_2(ℝ)` has no invariant
Radon measure, while `H = ⊥` recovers Haar measure. `localMeasure (dT/T)` on `ℚ_p^×` differs from
the idele normalization by `1 − p⁻¹`, `Tamagawa.measure` of `[0,1) × ℤ̂` for `G_a/ℚ` is `1`, and
`splitLocalFactor F v 1 1` is `2` at residue cardinality `2`, and rank two gives `4`.

### Dependencies

Layers AA.0 and AA.1; Mathlib's group-like elements, modular character, Riesz representation,
fundamental domains, `L²` spaces, exterior powers and Dedekind zeta residues; Tau Ceti's geometric
characters with their Galois action, cotangent spaces, adjoint representation, dynamic parabolics
and Euler product; ReductiveGroups, layer 4; ReductiveGroupsPartII, RG2.0 and RG2.1;
GlobalNumberFields, layers 0 and 6; NumberFieldArithmetic, layer 4; LFunctions #248, layers 5–6 (ThetaSeries #286);
ClassFieldTheory reciprocity; Chebotarev, layer 10;
RepresentationTheory/CompactGroups, layer 5.

## Layer 3: reduction and arithmetic quotients

Begin with rational parabolic data, real Siegel coordinates and the primitive `GL_n` and
closed-orbit reductions. Their adelic consequences give finite class sets, finite volume and
compactness criteria. Heights quantify growth; the fixed-`K` real theory controls cusps and
subgroup orbit maps.

### 3.1 Rational parabolics and Iwasawa integration

- **Algebraic Levi decompositions.** For a finite-type commutative Hopf algebra `H/F`
  and a Hopf ideal `P` cutting out a closed subgroup, define `Reduction.LeviDecomposition F H P`.
  Its Hopf ideals `N` and `M` contain `P`; the corresponding closed subgroups are smooth
  unipotent and connected reductive, respectively. On every commutative `F`-algebra `R`,
  `N(R)` is normal in `P(R)` and each `p ∈ P(R)` has a unique expression `n m`.
  These point groups are `TauCeti.CommHopfAlgCat.quotientPointsSubgroup`, so the multiplication
  equation is in the original group `G(R)`. For `char F = 0` and geometrically connected
  `P`, prove `Reduction.exists_leviDecomposition` ([Borel], §1.13, p. 11).
  This structure records algebraic subgroups; the dynamic point decomposition above remains
  the supplier for cocharacter parabolics. *Needs:* Tau Ceti Hopf ideals and quotient points.

  **Checks.**
  - For `G_m`, `N` is the identity and `M` the whole group (`Reduction.levi_torus`).
  - For `G_a` in characteristic zero, `N` is the whole group and `M` the identity
    (`Reduction.levi_additive`).
  - For `GL_2`, `M` is the whole group and `N` the identity (`Reduction.levi_gl2`).

- **Relative roots with their adjoint realization.** For a connected reductive `F`-group
  represented by `H`, construct `Reduction.RelativeRootData F H`. Its maximal split torus
  `S₀` is a Hopf ideal with the existing `TauCeti.splitTorusCommHopfAlgProperty`; maximality
  reverses the ideal order. Set `X = X*(S₀) = Additive (RationalCharacter F (H/S₀))` and
  `X_* = Hom(X, ℤ)`. The lattice is finite free. In the actual adjoint module
  `Derivation F H (CounitAlgebra F H F̄)`, define
  `g_χ = {v : Ad(s)v = χ(s)v for every s ∈ S₀(F̄)}` and require the internal direct sum
  `Lie(G) ⊗ F̄ = ⨁_χ g_χ`. The finite root set is characterized by
  `χ ∈ Φ ↔ χ ≠ 0 ∧ g_χ ≠ 0`; put `m_χ = dim_F̄ g_χ`.
  The zero weight is the Lie algebra of `Z_G(S₀)`. It need not be nonzero when `G = 1`.

  The Weyl group is the actual quotient `N_G(S₀)(F)/Z_G(S₀)(F)`, using normalizers and
  centralizers that test the subgroup scheme on every coefficient algebra. Its faithful
  action on `X` is pinned by `(wχ)(s) = χ(n⁻¹sn)`. A `RootPairing` has these very roots,
  with pairing given by evaluation against `X_*`; its reflections are realized in the
  rational Weyl quotient, act by `χ ↦ χ − ⟨χ,α∨⟩α`, and generate that quotient.
  Thus the roots form a crystallographic root system in their span; reducedness is not
  imposed. Choose linearly independent simple roots `Δ₀ ⊂ Φ`; the positive roots are exactly
  the roots that are nonnegative integral sums of `Δ₀`, and every root has exactly one sign.
  Prove existence for every maximal split torus, Weyl invariance of multiplicities and
  `multiplicity_pos_iff` away from zero. These are realization conditions, not a free choice
  of an unrelated abstract root pairing. Sources: [Borel–Tits](https://www.numdam.org/item/PMIHES_1965__27__55_0.pdf),
  §5.3, p. 96 and §5.8, p. 98; [Platonov–Rapinchuk–Rapinchuk], §2.1.14, pp. 75–76.
  The latter's §2.1.11 is the regular-semisimple section, not the relative-root locator.
  *Needs:* Tau Ceti split tori, Hopf quotient points, counit derivations and adjoint action;
  Mathlib `RootPairing` and `DirectSum.IsInternal`.

  **Checks.** Each label names a Lean `example`.
  - `relative_gln`: the diagonal torus of split `GL_n` has roots `e_i − e_j`, `i ≠ j`,
    multiplicity one and Weyl group `Equiv.Perm (Fin n)`, including `n = 0,1`.
  - `relative_torus`: `G_m` has no roots, trivial Weyl group and zero-weight dimension one;
    `relative_trivial` instead has zero-weight dimension zero.
  - `relative_sl2`: the diagonal torus of `SL₂` has roots `±α`, both with multiplicity one.
  - `relative_su3`: for a quadratic field extension `E/F` in characteristic zero with
    nontrivial involution, the special unitary group of the antidiagonal Hermitian form
    has roots `±α, ±2α`, multiplicities `2,1`, and Weyl group of order two. This includes
    an unramified quadratic extension of a nonarchimedean local field. Its carrier is cut
    out inside `Res_{E/F} GL₃` by `det A = 1` and `τ(A)ᵀ J A = J`, using the sibling
    roadmap's coefficient-natural Weil restriction. `SU3.identity`, `SU3.diagonal`, and
    `SU3.not_scalar` distinguish this group from all of `Res GL₃`.

  **Checks for the realization maps.** `character_zero` gives the constant unit,
  `character_inverse` gives reciprocal evaluation, and `character_nontrivial` detects
  every nonzero character on geometric points. `centralizer_torus` gives the whole torus;
  `centralizer_gl2` and `centralizer_gl3` give the maximal torus itself, with Weyl orders
  two and six. `rootGroup_upper` is the upper additive subgroup of GL₂;
  `rootGroup_sign` gives trivial intersection of opposite rays; `rootGroup_double`
  retains the same contraction ray on doubling (this helper is a ray group, not the
  smaller long-root group in a nonreduced system). `rootGroup_zero` computes the
  unconstrained zero-character intersection as the whole group; zero is excluded from
  the root set and from every use as a root subgroup.

- **Minimal rational parabolics and standard parabolics.** For a connected reductive group `G`
  over `F`, fix a minimal `F`-parabolic `P_0 ⊂ G` with Levi decomposition `P_0 = M_0 N_0`, `M_0`
  the centralizer of a maximal `F`-split torus `S_0`: define `Reduction.MinimalParabolic`, the
  structure `P_0, M_0, N_0, S_0` with the Levi decomposition. A standard parabolic is an
  `F`-parabolic `P ⊇ P_0`; it has a unique Levi component `M_P ⊇ M_0`, unipotent radical `N_P`,
  and split component `A_P = A_{M_P}`: define `Reduction.StandardParabolic`, the finite type of
  standard parabolics with `M_P`, `N_P`, `A_P`. Prove `Reduction.standardParabolic_equiv_subsets`
  (`StandardParabolic ≃ Finset Δ_0`, the subsets of the simple relative roots),
  `Reduction.exists_unique_standard_conj` (every `F`-parabolic is `G(F)`-conjugate to a unique
  standard parabolic) and `Reduction.StandardParabolic.le_iff` (`P ≤ P′` iff the corresponding
  subsets satisfy `Δ_0^P ⊆ Δ_0^{P′}`, with the convention that the subset lists the simple roots
  of `M_P`); so the standard parabolics are finite in number ([Arthur], §4, p. 22). *Needs:*
  ReductiveGroups, layer 7; Tau Ceti `TauCeti.Cocharacter.parabolic`,
  `TauCeti.Cocharacter.unipotent`, `TauCeti.Cocharacter.leviDecompositionMulEquiv`; AA.2.1.

  The defining equations hold on **every** coefficient algebra: for a regular dominant
  cocharacter of `S₀`, `P₀(R) = Cocharacter.parabolic R λ`,
  `N₀(R) = Cocharacter.unipotent R λ`, and `M₀(R) = Cocharacter.levi R λ`.
  Moreover `M₀ = Z_G(S₀)`. The cocharacter's pullback sends `χ` to `T^{⟨χ,λ⟩}` and
  has strictly positive pairing with every simple root. **Checks:** `dominant_factors`
  kills the torus ideal; `dominant_positive` gives a positive Laurent exponent on each
  simple character; `dominant_nontrivial` excludes the constant cocharacter when roots exist. The subset for `P` consists of
  the simple roots whose negative root-ray group is contained in `P`, on every algebra.
  Here the root-ray group is the intersection of the cocharacter contraction groups with
  positive pairing against that root; in a nonreduced system it includes the double root.
  `StandardParabolic.decomposition` is the unique Levi decomposition containing `M₀`.
  Borel–Tits §5.9, p. 98 and §§5.12, 5.14, p. 99 give the positive-system and conjugacy
  classification. The order is subgroup inclusion, hence reverse inclusion of Hopf ideals.

  **Checks.**
  - A torus has one standard parabolic (`parabolic_torus`).
  - For `GL_2/ℚ` there are exactly two standard parabolics: the upper Borel and `GL_2`
    (`parabolic_gl2`).
  - For `GL_3` there are `4` standard parabolics (`parabolic_gl3`).
  - For `GL_2` over `ℚ` the lower triangular Borel is a parabolic that is not standard; it is
    conjugate to the standard one by the Weyl element (`parabolic_lower_borel`).
- **Relative chambers and the spaces a_P.** For a connected reductive group `G` over `F` and
  standard `P`, define `Reduction.aP`, the real vector space `a_P = a_{M_P}` (AA.2.1), with
  `a_0 = a_{P_0}`; for `P_1 ⊆ P_2`, `Reduction.aPProjection`, the canonical linear projection
  `a_{P_1} → a_{P_2}` dual to restriction of rational characters, whose kernel is the relative
  space `a_{P_1}^{P_2}`; `Reduction.rho`, `ρ_P = (1/2) ∑_{α∈Φ_P} (dim 𝔫_α) α ∈ (a_P^G)^*`;
  `Reduction.simpleRoots`, `Δ_P ⊂ (a_P^G)^*`, the restrictions of `Δ_0 ∖ Δ_0^P`, a basis; and
  `Reduction.positiveChamber`, `a_P^+ = {H | ∀ α ∈ Δ_P, 0 < α H}`. The roots `Φ_P` of `(P, A_P)`
  lie in `(a_P^G)^*`. Prove `Reduction.aP_decomp`: for `P₁ ≤ P₂`, restriction of rational
  characters induces the canonical projection `π : a_{P₁} → a_{P₂}` and
  `a_{P₁} ≃ₗ a_{P₂} × ker π`, with the splitting induced by the split centres (the split exact
  sequences `a_{P_1} = a_{P_2} ⊕ a_{P_1}^{P_2}` and dually); the kernel is `0` for `P₁ = P₂`
  ([Arthur], §5, p. 24; [Arthur], §5, p. 25). *Needs:* AA.3.1; AA.2.1; ReductiveGroupsPartII,
  RG2.1; ReductiveGroups, layer 7.

  For algebraic Levi data `D`, the carrier equation is
  `Reduction.aP F H D = RealCharacterSpace F (H ⧸ D.M.toIdeal)`.
  Restriction along a specified inclusion of Levi groups, with coordinate map
  `i : O(M₂) → O(M₁)`, is `Reduction.LeviDecomposition.characterMap D E i`;
  `characterMap_apply` fixes it by `(characterMap i a)(χ) = a(i(χ))`.
  For standard parabolics the map `i` must be the inclusion determined by `M₀`;
  an arbitrary algebraic homomorphism does not specify `aPProjection`.
  `leviInclusion_mk` and `restrictToSplit_mk` send the class of a coordinate function to
  its class in the smaller quotient. `rootCoordinates_iff` uniquely specifies the lift
  `a_P → Hom(X,ℝ)`: it agrees with evaluation on restricted Levi characters and vanishes
  on the simple Levi roots. `rootFunctional P α` evaluates that lift on `α`;
  `simpleRoots_independent` gives linear independence and `simpleRoots_span` gives
  spanning when `G` has no rational characters. `simpleRoots` removes duplicate restrictions, and `rho` is the multiplicity-weighted
  half-sum of positive roots (Levi roots restrict to zero).
  `aPInclusion_coordinates` fixes the splitting; `aP_decomp_apply` is
  `a ↦ (πa, a − inclusion(πa))`.

  **Checks for the splitting.**
  - `projection_identity`: the identity projection and inclusion are identities.
  - `projection_gl2`: the Borel-to-group projection is `(a,d) ↦ a+d`, and its central
    lift is `z ↦ (z/2,z/2)`; the factor one half cannot be omitted.
  - `projection_full_semisimple`: for full `SL₂`, the target character space is zero.

  **Checks for the character-space carrier.**
  - For `G_m`, its dimension is one (`Reduction.aP_torus`).
  - For `G_a` in characteristic zero, its Levi character space is zero
    (`Reduction.aP_additive`).
  - For the full `SL_2`, its character space is zero (`Reduction.aP_sl2`).

  **Checks for restriction of characters.**
  - The identity inclusion induces a map with zero kernel
    (`Reduction.LeviDecomposition.characterMap_identity`).
  - The square map on `G_m` doubles a nonzero real character coordinate and is not
    the identity (`Reduction.LeviDecomposition.characterMap_square`).
  - A homomorphism pulling every character back to `1` induces the zero map
    (`Reduction.LeviDecomposition.characterMap_trivial`).

  **Checks for roots and chambers.**
  - For a torus, `P = G`, `a_P = a_G`, the relative space is zero and `Δ` is empty
    (`chamber_torus`).
  - For the Borel of `GL_2`, `ρ = (1/2)(e_1 − e_2)` (`chamber_gl2`).
  - For `GL_3`, `a_0^+` is cut out by the two simple roots; positivity of `e_1 − e_3` alone does
    not imply membership (`chamber_gl3`).
- **Admissible maximal compact subgroup of G(𝔸).** For a connected reductive group `G` over `F`,
  define `Reduction.AdmissibleCompact`: a maximal compact subgroup `K = ∏_v K_v` of `G(𝔸_F)` is
  admissible relative to `M_0` if `K_v = 𝓗(𝒪_v)` is hyperspecial for all but finitely many `v`,
  each `K_v` is a special maximal compact subgroup in good position relative to `M_0` at finite
  `v` and a maximal compact subgroup of `G(F_v)` at archimedean `v`. Prove
  `G(F_v) = P_0(F_v) K_v` at every place (`AdmissibleCompact.finite_iwasawa` and
  `AdmissibleCompact.infinite_iwasawa`). Define `Reduction.AdmissibleCompact.toSubgroup`, the compact subgroup `∏_v K_v` of
  `G(𝔸)`, and prove `Reduction.AdmissibleCompact.isCompact` and
  `Reduction.AdmissibleCompact.exists` (an admissible `K` exists for every minimal parabolic
  data) ([Arthur], §4, p. 23; [Arthur], §4, p. 24). *Needs:* AA.1.1; AA.1.2;
  ReductiveGroupsPartII, RG2.3 (reductive-model, hyperspecial-vertices); ReductiveGroupsPartII,
  RG2.4 (iwasawa-parabolic-integral); RepresentationTheory/LieGroups, layer 9.

  In `AdmissibleCompact`, good position is the equation
  `K_v ∩ P = (K_v ∩ N_P)(K_v ∩ M_P)` for every standard `P`. The finite-place special
  condition is expressed intrinsically: a local maximal split torus contains `S₀`, and
  each element of its rational relative Weyl group has a normalizer representative in
  `K_v`. Compare this characterization with special points of the RG2 apartment.
  The almost-everywhere condition uses `IntegralModel.IsReductive`, including smoothness
  and reductive fibres, and equality with that model's integral points. The global
  subgroup is the intersection of the comaps of all these local subgroups.

  **Checks.**
  - For `GL_n` over `ℚ`, `O(n) × ∏_p GL_n(ℤ_p)` is admissible (`admissible_gln`).
  - For the trivial group, the compact is the whole group (`admissible_trivial`).
  - A proper subgroup of any larger compact subgroup fails maximality
    (`admissible_not_proper`).
  - The Iwahori subgroup (upper triangular modulo `p`) is a proper subgroup of `GL_2(ℤ_p)`, so a
    product of Iwahori subgroups is not maximal compact and not admissible
    (`admissible_not_iwahori`, including residue characteristic two).
- **Adelic Iwasawa factorization.** For connected reductive `G/F`, minimal-parabolic data and
  an admissible `K`, prove that multiplication
  `N_P(𝔸) × M_P(𝔸)^1 × A_P(ℝ)^0 × K → G(𝔸)` is surjective and open for each standard `P`, and
  that at almost all finite places it restricts to the integral Iwasawa factorization; this
  integrality permits assembling local choices into restricted-product elements ([Arthur], §4,
  pp. 23–24). *Needs:* AA.3.1; AA.2.1; ReductiveGroupsPartII, RG2.3 (reductive-model);
  ReductiveGroupsPartII, RG2.4 (iwasawa-parabolic-integral); RepresentationTheory/LieGroups,
  layer 9.
- **Parabolic Haar Jacobian.** For `F` a number field, `G` a connected reductive group over
  `F`, `P = N_P ⋊ M_P` an `F`-parabolic with its Levi decomposition on `𝔸`-points, and `dn`, `dm`
  Haar measures on `N_P(𝔸)` and the unimodular `M_P(𝔸)`, write `P = N ⋊ M` and
  `δ_P(m) = |det(Ad(m) | Lie N)|_𝔸`. Prove that with left Haar measures `dn`, `dm`, the measure
  `δ_P(m)^{−1} dn dm` in coordinates `(n, m)` is a left Haar measure of `P(𝔸)`; that Mathlib's
  modular character of `P(𝔸)` (`map (·p) μ_l = Δ_P(p) μ_l`, equivalently
  `map (p·) μ_r = Δ_P(p)^{−1} μ_r` for `μ_r` the inversion image of `μ_l`) is `Δ_P(nm) = δ_P(m)`;
  and that `dn dm` is a right Haar measure in the same coordinates ([Arthur], §4, p. 21).
  *Needs:* AA.2.2.
- **Iwasawa integration through the compact factor.** For `F` a number field, `G` a connected
  reductive group over `F`, `P = N ⋊ M` a standard `F`-parabolic, `K` admissible with `dk` its
  Haar probability measure, and `dn`, `dm` Haar measures on `N(𝔸)`, `M(𝔸)` with
  `vol(N(𝒪_v)) = vol(M(𝒪_v)) = 1` at almost all `v`, prove that the functional

  ```text
  f ↦ ∫_K ∫_M ∫_N f(nmk) δ_P(m)^{−1} dn dm dk
  ```

  on compactly supported continuous `f` is a positive functional invariant under right
  translation by `G(𝔸)` (left `P`-invariance and right `K`-invariance are immediate); since
  `G(𝔸)` is unimodular it is the Haar measure of `G(𝔸)`. Equivalently use the compact
  homogeneous space `(P ∩ K)\K`, whose measure is quasi-invariant under `G` with the parabolic
  Radon–Nikodym cocycle. No invariant measure on `P\G` is asserted ([Arthur], §4, pp. 21–23).
  *Needs:* AA.3.1; AA.0.3; ReductiveGroupsPartII, RG2.4; RepresentationTheory/LieGroups, layer 9;
  AA.1.5.
- **Adelic Iwasawa decomposition and integration formula.** For a connected reductive group `G`
  over `F`, admissible `K` and standard `P`, prove
  `G(𝔸_F) = P(𝔸_F)K = N_P(𝔸) M_P(𝔸)^1 A_P(ℝ)^0 K`, and for `f ∈ L¹(G(𝔸))`,

  ```text
  ∫_{G(𝔸)} f(x) dx = ∫_K ∫_{M_P(𝔸)} ∫_{N_P(𝔸)} f(nmk) δ_P(m)^{−1} dn dm dk
  ```

  for compatible Haar measures ([Arthur], §4, p. 24). *Needs:* AA.3.1.
- **The map H_P.** For a connected reductive group `G` over `F`, standard `P` and admissible `K`,
  define `Reduction.HP P : AdelicPoints H → a_P`, `H_P(nmk) = H_{M_P}(m)` for `n ∈ N_P(𝔸)`,
  `m ∈ M_P(𝔸)`, `k ∈ K`, and write `H_0 = H_{P_0}`. Prove `Reduction.HP_nmk`
  (`HP (n * m * k) = logHeight_{M_P} m`), `Reduction.HP_left_P` (`HP (p * x) = HP p + HP x` for
  `p ∈ P(𝔸)`), `Reduction.continuous_HP` and `Reduction.HP_rational`
  (`HP (diagonal γ * x) = HP x` for `γ ∈ P(F)`) ([Arthur], §4, p. 24). *Needs:* AA.3.1; AA.2.1.

  The equation `HP_nmk` pins the function on the whole adelic group by Iwasawa
  surjectivity, and includes its normalization at the identity. The dependence on `K`
  is explicit in Lean.

  **Checks.**
  - `HP_gl2_diagonal`: for the upper Borel and `O₂(ℝ)·∏ GL₂(ℤ_p)`, the simple-root
    coordinate of `H_P(diag(y,1))` is `log y`, with `y > 0` at infinity and finite
    component one. The full vector is `(log y,0)`, not a scalar.
  - `HP_gl2_weyl`: the orthogonal Weyl representative has height zero.
  - `HP_gl2_not_hom`: `w diag(2,1)` has simple-root height `−log 2`; additivity on
    the whole group would give `log 2`.
  - `HP_compact`, `HP_split`, `HP_rational_parabolic`: compact factors have zero height,
    the split logarithm is retained, and rational parabolic translation leaves it unchanged.
  - For `x` in `P(𝔸)`, the pairing of `HP x` with each rational character `χ` of `P` is
    `log ‖χ(x)‖`; for `GL_2` and the Borel, `HP (diag(a, d)) = (log ‖a‖, log ‖d‖)`.
  - `HP` is not a homomorphism on `G(𝔸)`: for `GL_2`, `HP(w) = 0` for the Weyl element `w ∈ K`,
    but `HP` of a product of upper and lower unipotents can be nonzero.

**Checks for local coefficient comparison.** `baseChange_identity` preserves one;
`baseChange_scalar` evaluates the inverse comparison by `a⊗h ↦ a·g(h)`;
`baseChange_injective` retains distinct points. These pin `localBaseChangePoints` in
addition to its evaluation equation on `1⊗h`.

The adelic integration normalization is fixed by a measure equation, not by an unspecified
choice of Haar measure. Put `leviModulus P m = exp(2ρ_P(H_M(m)))`. The map
`parabolicProduct` is `(n,m) ↦ nm` into the represented parabolic; its pushforward of
`δ⁻¹ dn dm` is left Haar and its pushforward of `dn dm` is right invariant.
`iwasawaMeasure P K dn dm dk` is the pushforward of `δ⁻¹ dn dm dk` by `(n,m,k) ↦ nmk`.
For Haar `dn,dm` and Haar probability `dk`, it is Haar on G; `iwasawa_integral` uses this
precise normalization and `iwasawa_integral_right_invariant` supplies G-invariance.
`adelic_iwasawa_open` adds openness to surjectivity; `integral_iwasawa` factors
`K_v ∩ P(F_v) = (K_v ∩ N_P(F_v))(K_v ∩ M_P(F_v))` at each good place and supplies the
integral-factor statement at places outside the model's exceptional set.
`integral_levi_factors` states the nontrivial extraction criterion: for `n ∈ N(F_v)`
and `m ∈ M(F_v)`, `nm ∈ G(𝒪_v)` if and only if both factors are integral.

**Checks for the Jacobian and measures.**

- `jacobian_torus`: δ=1; `jacobian_gl2`: at root logarithm log 2, δ=2 and density=1/2;
  `jacobian_inverse`: δ is positive and inversion gives its reciprocal.
- `parabolicProduct_identity`: (1,1) maps to one; `parabolicProduct_unique`: multiplication
  is bijective; `parabolicProduct_noncommuting`: reversing two noncommuting factors changes it.
- `iwasawa_zero_measure`: zero input gives zero; `iwasawa_scaling`: doubling dn doubles
  the output; `iwasawa_identity_mass`: three Dirac masses at one give the Dirac mass at one.
- `realMatrix_one`, `realMatrix_injective`, `realMatrix_surjective`: evaluating the infinite
  points of GL₂/ℚ at its real place preserves one and is bijective onto GL₂(ℝ).

**Checks for the parabolic product and integral intersection.**
`parabolicProduct_gl2_order` computes
`[[1,1],[0,1]] [[2,0],[0,1]] = [[2,1],[0,1]]`, whereas reversing the factors gives
`[[2,2],[0,1]]`. `integral_parabolic_not_compact` uses the determinant-one Weyl matrix
`[[0,−1],[1,0]]`: it belongs to `GL₂(ℤ_p)` but is not upper triangular. Thus the
integral factorization has `K_v ∩ P` on the left, not all of `K_v`.

### 3.2 Real Siegel coordinates and reduced positive forms

- **Horospherical decomposition for a fixed maximal compact.** Let `G` be connected semisimple
  over `ℚ`, `G = G(ℝ)^+`, `K ⊂ G` a maximal compact subgroup with Cartan involution `θ`, and `𝐏`
  a `ℚ`-parabolic with unipotent radical `𝐍_P` and Levi quotient `𝐋_P`. With `S_P` the split
  centre of `𝐋_P`, `A_P = S_P(ℝ)^0` and `M_P` the real points of `⋂_{χ∈X*(𝐋_P)} ker χ²`, prove
  that there is a unique `θ`-stable real Levi lift of `(𝐋_P)_ℝ`, giving `P = N_P A_P M_P` and the
  diffeomorphism `N_P × A_P × ((M_P ∩ G) K) → G` (`M_P` itself can leave `G(ℝ)^+`: for `PGL_2`
  it contains `diag(−1, 1)`). Define `RealSiegel.HoroData`, the structure `N_P, A_P, M_P K`, the
  homeomorphism `horoDecomp : G ≃ₜ N_P × A_P × (M_P K)` for fixed `K` and `𝐏`, and the simple
  roots. Prove `RealSiegel.horoDecomp_left_mul` (left multiplication by `p_0 = n_0 a_0 m_0` acts
  by `(n, a, m) ↦ (n_0 · (a_0 m_0) n (a_0 m_0)⁻¹, a_0 a, m_0 m)`), `RealSiegel.horoDecomp_conj`
  (conjugation by `g ∈ G(ℚ)` carries the decomposition for `(𝐏, K)` to that for
  `(g𝐏g⁻¹, gKg⁻¹)`) and `RealSiegel.horoDecomp_change_K` (for `K′ = uKu⁻¹` with `u ∈ N_P` and
  the Levi lifts identified by conjugation by `u`, the `A`-coordinate satisfies
  `a_{K′}(g) = a_K(gu)`, equivalently `H_{P,K′}(g) = H_{P,K}(gu)`; it need not equal `a_K(g)`)
  ([BKT], §2.2, p. 8; [BKT], (2.2), p. 8). *Needs:* AA.3.1; RepresentationTheory/LieGroups,
  layer 9; Tau Ceti `TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.leviDecompositionMulEquiv`.

  **Checks.**
  - For `SL_2(ℝ)`: `(x, a, ±k) ↦ n(x) diag(√a, 1/√a)(±k)`.
  - In `SL₂(ℝ)`, take `u = n(1)`, `k = [[0, −1], [1, 0]] ∈ SO(2)`. The upper-half-plane height of
    `ki` is `1` whereas that of `k(1 + i)` is `1/2`. Thus `a_K(k) = 1` but `a_{uKu⁻¹}(k) = 1/2` under
    the parameter `diag(√a, 1/√a)`.
- **Simple roots of P and truncated tori.** `Φ(A_P, N_P)` is the set of characters of `A_P` on
  `Lie N_P`; define `RealSiegel.HoroData.simpleRoots`, `Δ(A_P, N_P) = {α_1, …, α_r}` as a `Finset`
  of positive characters of `A_P`, the unique set of `dim A_P` linearly independent roots of
  which every root is a nonnegative integral combination. For `t > 0` define
  `RealSiegel.truncatedTorus`, `A_{P,t} = {a ∈ A_P : a^α > t for all α ∈ Δ(A_P, N_P)}`, and
  `RealSiegel.cornerCoord`, `e_P(a) = (a^{−α_1}, …, a^{−α_r}) : A_P ≃ (Fin r → ℝ_{>0})`. Prove
  that `e_P` is a semialgebraic diffeomorphism and `RealSiegel.cornerCoord_truncated`
  (`e_P '' A_{P,t} = Set.pi univ (fun _ => Ioo 0 t⁻¹)`, that is `e_P(A_{P,t}) = (0, 1/t)^r`)
  ([BKT], §2.2, p. 8; §2.3, equation (2.4), p. 9). *Needs:* AA.3.2; ReductiveGroups, layer 7.

  **Checks.**
  - For `SL_2` and the Borel, `Δ = {α}` with `diag(a, a⁻¹)^α = a²`.
  - For the Borel of `SL_3` the root `α_1 + α_2` is positive but not simple; truncating by it
    alone does not give `A_{P,t}`.
- **Siegel set for a fixed maximal compact.** For a `ℚ`-parabolic `𝐏`, a fixed maximal compact
  `K ⊂ G = G(ℝ)^+`, `t > 0` and bounded (relatively compact open semialgebraic) `U ⊂ N_P`,
  `W ⊂ M_P K`, define `RealSiegel.siegelSet 𝐏 K U t W : Set G`, the Siegel set
  `𝔖 = U × A_{P,t} × W ⊂ G` in horospherical coordinates associated to `𝐏` and `K`; for a
  connected compact `M ⊂ K`, a Siegel set of `G/M` associated to `K` is the image of such a set
  (`RealSiegel.siegelSet_quotient`). The set carrier itself permits arbitrary `U,W` and
  arbitrary quotient subgroup; `siegelSet_semialgebraic` adds the semialgebraic hypotheses
  in a faithful matrix realization. `semialgebraic_window_enlargement` enlarges any
  relatively compact pair to relatively compact open semialgebraic windows, and therefore
  supplies these choices in the translation and finite-covering conclusions.
  `K` is fixed once and for all (BKT Definition 2.5 as
  corrected by the 2023 erratum). Prove `RealSiegel.mem_siegelSet` (membership in horospherical
  coordinates) and `RealSiegel.siegelSet_mono` (monotone in `U`, `W` and antitone in `t`)
  ([BKT], Definition 2.3, p. 8; [BKT erratum], §1.1, p. 1). *Needs:* AA.3.2.

  **Checks.**
  - For `SL_2` and `K = SO(2)`, the image in `ℍ` is `{x + iy : x ∈ U, y > t}`.
  - Siegel sets for different `K` are not interchangeable: for `SL_2`, `P` upper triangular and
    `x ≠ i` in `ℍ`, a Siegel set `B_N B_A K_x` is not contained in finitely many
    `SL_2(ℤ)`-translates of Siegel sets for `K_i` (erratum §1.6.1).
- **Translating and conjugating Siegel sets.** Prove that for `g ∈ G(ℚ)`, `g𝔖g⁻¹` is a Siegel
  set associated to `g𝐏g⁻¹` and `gKg⁻¹`; for `g ∈ G`, `𝔖g` is contained in a Siegel set for `𝐏` and `g⁻¹Kg`;
  and for `g ∈ 𝐏(ℝ)`, `g𝔖` is contained in a Siegel set for `𝐏` and `K` (exactly, for the sets `U a A_{>0} W`
  of the erratum; for Definition 2.3's `A_{P,t}`, up to containment). Consequently, for
  `γ ∈ 𝐆(ℚ)^+`, `γ𝔖` is contained in a Siegel set associated to `γ𝐏γ⁻¹` and the same `K`
  ([BKT], Lemma 2.4, p. 8; [BKT erratum], Remark 1.1(1), p. 2). *Needs:* AA.3.2.
- **Reduced positive forms.** For a finite-dimensional `ℚ`-vector space `V` with an ordered
  basis `e = (e_i)` of `V_ℚ` (integral bases of `V_ℤ` in BKT), `C > 0` and a positive definite
  symmetric form `b` on `V_ℝ`, define `RealSiegel.IsReduced e C b : Prop` for the positive
  definite matrix `b` in the basis `e`: `b` is `(e, C)`-reduced if (1) `|b(e_i, e_j)| < C b(e_i, e_i)`
  for all `i, j`; (2) `b(e_i, e_i) < C b(e_j, e_j)` for `i < j`; (3) `∏_i b(e_i, e_i) < C det(b)`, the
  Gram determinant in `e`. Prove `RealSiegel.IsReduced.mono`
  (`IsReduced e C b → C ≤ C′ → IsReduced e C′ b`), `RealSiegel.IsReduced.smul`
  (`IsReduced e C b ↔ IsReduced e C (λ • b)` for `λ > 0`), `RealSiegel.IsReduced.cholesky` (for
  fixed dimension `n` and `C > 0` there is a constant `R(n, C) > 0` such that every `C`-reduced
  positive Gram matrix `b = Nᵀ diag(d) N` with `N` unit upper triangular and `d_i > 0` satisfies
  `|N_ij| ≤ R` for `i < j` and `d_i ≤ R d_{i+1}` for `0 ≤ i < n − 1`; the bound is uniform over
  `b`) and `RealSiegel.IsReduced.of_cholesky_bounds` (for fixed `n` and `R > 0` there is
  `C(n, R) > 1` such that every positive Gram matrix `b = Nᵀ diag(d) N` with `N` unit upper
  triangular, positive pivots `d_i`, `|N_ij| ≤ R` above the diagonal and `d_i ≤ R d_{i+1}` for
  `i < n − 1` is `C`-reduced) ([BKT], Definition 4.11, p. 17). *Needs:* Tau Ceti `TauCeti.cholesky`.

  The uniform Cholesky bounds are owned deductions from that definition, not
  claims stated in Definition 4.11. Writing `b_i = B_ii`, use
  `d_i ≤ b_i`, `∏ d_i = det B` and `∏ b_i < C det B` to obtain `b_i/C < d_i`.
  The triangular recursion for `N_ij` and `b_k < C b_i` for `k < i` then bound
  all entries by induction on `i`; `d_i/d_{i+1} < C²`. Conversely, bounded `N`
  and adjacent pivot ratios bound `b_i/d_i` by a finite geometric sum depending
  only on `n,R`, which supplies all three reducedness inequalities after enlarging `C`.
  Rank zero uses the empty product and requires `C > 1` for reducedness.

  **Checks.**
  - The identity matrix of size `n` is `(std, 2)`-reduced.
  - `diag(4, 1)` is not `(std, 2)`-reduced (condition (2) fails) although `diag(1, 4)` is.
  - In dimension one, every positive matrix is reduced for `C > 1` (`IsReduced_dim_one`).

- **Scalar invariance of reduced forms.** For a positive definite real symmetric `n × n` matrix
  `B` (the Gram matrix of `b` in the basis `e`), `C > 0` and real `a > 0`, prove that `B` is
  `(e, C)`-reduced iff `aB` is `(e, C)`-reduced; consequently determinant normalization preserves
  reducedness ([BKT], §4.5, Definition 4.11, pp. 17–18 (arXiv v2)). *Needs:* AA.3.2.
  **Checks.**
  - At `C = 2`, both one-dimensional forms `[1]` and `2[1]` are reduced
    (`IsReduced_positive_scale`).
  - The zero multiple of `[1]` is not reduced (`IsReduced_zero_scale`).
  - The multiple `−[1]` is not reduced (`IsReduced_negative_scale`).

- **The set T_{e,C} of reduced forms.** Define `RealSiegel.reducedSet e C : Set (PosDefMatrix n)`,
  `T_{e,C} = {b ∈ X : b is (e, C)-reduced} ⊂ X`, the space of positive definite forms on `V_ℝ`.
  Prove `RealSiegel.reducedSet_semialgebraic` in matrix-entry coordinates, `RealSiegel.reducedSet_mono` (monotone in `C`) and
  `RealSiegel.reducedSet_smul_basis` (`reducedSet (g • e) C = g • reducedSet e C`, that is
  `T_{ge,C} = g·T_{e,C}` for `g ∈ GL(V_ℚ)`) ([BKT], §4.5, p. 18 (arXiv v2); JAMS p. 933). *Needs:*
  AA.3.2; Tau Ceti `TauCeti.cholesky_mul_transpose`.

  **Checks.**
  - `1 ∈ reducedSet std 2`.
  - `diag(1, 4) ∈ reducedSet std 2` but its inverse `diag(1, 1/4)` is not.
  - In dimension one and `C > 1`, the reduced set is exactly the set of positive definite matrices (`reducedSet_dim_one`).

- **Reduced forms and Siegel sets.** `SiegelGeometry.reduced_matrixDomain`, `reduced_specialLinear`, `gram_fiber` and `matrixDomain_triple`. For a lattice `V_ℤ` in `V_ℚ`, an ordered integral basis `e`
  and `C > 0`, prove that the set of `(e, C)`-reduced positive definite forms lies in the image
  of a `GL_n(ℝ)` Siegel set in `GL_n(ℝ)/O(n)`, and that each such Siegel set has reduced-form
  image for some `C`. Restricting to Gram determinant one gives the corresponding statement for
  `SL_n(ℝ)/SO(n)`; for `n>0`, normalize an arbitrary form `B` by `det(B)^{−1/n} B`. Rank zero is a point. Rational bases are
  handled by the matching rational change of basis ([BKT], §4.5, p. 18 (arXiv v2); JAMS p. 933).
  *Needs:* AA.3.2; Tau Ceti `TauCeti.cholesky`, `TauCeti.cholesky_mul_transpose`.
- **Lower bound by diagonal entries.** Let `B` be a positive definite real symmetric `n × n`
  matrix with diagonal `d_k = B_kk` and `D ≥ 1` with `∏_k d_k ≤ D det B`. Prove that for every
  real vector `a` and every `k`, `aᵀ B a ≥ a_k² d_k / D`. This is an owned
  quantitative lemma supporting [BKT], Definition 4.11 and its following paragraph,
  pp. 17–18: the cofactor formula and Hadamard inequality give
  `(B⁻¹)_kk ≤ D/d_k`; Cauchy–Schwarz for the `B` inner product gives the result. *Needs:* Tau Ceti `TauCeti.cholesky_mul_transpose`.
- **Transferring off-diagonal bounds to another basis.** Let `B` be the Gram matrix in an
  ordered basis `e′` of a positive definite form `b` with `|B_ab| ≤ C′ d_a` for all `a, b`, with
  `d_a ≤ C′ d_b` for `a < b`, and `∏ d_a ≤ C′ det B` (`C′ ≥ 1`). For a fixed basis
  `e_i = ∑_a A_ai e′_a` put `k_i = max{a : A_ai ≠ 0}`, `m_i = |A_{k_i,i}|`, `L_i = ∑_a |A_ai|`. Prove
  `|b(e_i, e_j)| ≤ C′³ L_i L_j m_i⁻² b(e_i, e_i)` for all `i, j`.
  This quantitative bound is our deduction supporting [BKT], Definition 4.11,
  pp. 17–18: summing the entry bounds gives `C′² L_i L_j d_{k_i}`;
  the preceding lower bound gives `b(e_i,e_i) ≥ m_i² d_{k_i}/C′`. *Needs:* AA.3.2.
- **Basis change with determinant control.** Let `e`, `e′` be bases of `V_ℚ` (`m = dim V`) and
  `C, C′ ≥ 1`. Prove that if `b` is `(e′, C′)`-reduced and `∏_i b(e_i, e_i) ≤ C det(b in e)`, then
  `b` is `(σe, C″)`-reduced for the ordering `σ` of `e` that sorts the values `b(e_i, e_i)`, with
  `C″` depending only on `C`, `C′` and the change-of-basis matrix; hence `b` lies in one of the
  `m!` sets `T_{σe,C″}`. The sorting permutation is part of the conclusion ([BKT], §4.5, p. 18
  (arXiv v2); JAMS p. 933). `exists_perm_isReduced` requires `C″>1` and
  monotonicity of the permuted diagonal. **Check:** `sorted_diagonal` uses `diag(4,1)`:
  it is 5-reduced but unsorted; swapping the two basis vectors sorts it.
  *Needs:* AA.3.2.

The real carriers use the identity component of the existing infinite points over `ℚ`.
`realN` is the unipotent subgroup there. `realA` and `realM` are the conjugates by
`u ∈ N(ℝ)` of the rational Levi's positive split component and real norm-one subgroup.
`realMK` is their residual product with the fixed `K`. `HoroData` requires a continuous
involutive group automorphism with fixed subgroup `K`, inversion on `A`, preservation of
`M`, and a coordinate homeomorphism whose inverse is **multiplication**. Its logarithm
`aLog` is pinned on every element of `A` by `HoroData.aLog_spec`, using the Levi's rational
characters. `horoDecomp_smooth` gives smooth local extensions of its three coordinates
in every faithful rational matrix realization; the inverse is matrix multiplication.
`horoDecomp_semialgebraic` places the four-block graph `(g,n,a,m)` in the polynomial
set algebra. Thus regularity is a conclusion about the actual coordinates.
`cornerCoord_smooth` and `cornerCoord_semialgebraic`, together with the pinned
homeomorphism below, give the stated smooth semialgebraic corner chart. The formula for `cornerCoord` is
`a ↦ (exp(−α(aLog a)))_α`. Both `cornerCoord_truncated` and
`cornerCoord_homeomorphism` assume `X*(G)=0`; the latter pins the homeomorphism into
the positive orthant by its value on every element. Central split directions cannot be
recovered from root coordinates. **Check:** `corner_central_kernel` takes `G=G_m`:
`A=ℝ_{>0}` has distinct elements, but every corner tuple is empty.

**Checks for these definitions and translations.** All labels below are Lean `example`s.

| Interface | Checks |
|---|---|
| `realN`, `realA`, `realM`, `realMK`, `HoroData`, `horoDecomp`, `aLog` | `horo_identity`: N=A=1 and log=0 at one; `horo_compact`: N=A=1 on K; `horo_split`: a split element retains its A-coordinate |
| Fixed compact dependence | `sl2_change_K`: the Weyl element sends `i` to height 1 but `1+i` to height 1/2; `horoDecomp_change_K` identifies this with the new compact's coordinate |
| `simpleRoots`, `truncatedTorus`, `cornerCoord` | `truncation_wall`: at t=1 the identity is excluded if roots exist, corner tuple=1; `truncation_rank_zero`: no inequalities and an empty tuple; `truncation_scale`: root value 2 gives corner coordinate 1/2 and membership at t=1 |
| `siegelSet`, `siegelSet_quotient` | `siegel_empty_window`: empty U gives empty set; `siegel_identity`: strict wall excludes one; `siegel_rank_zero`: unrestricted residual window gives the whole connected group; the quotient is the literal image under the quotient map |
| Translation | `translate_identity`: no change at one; `translate_unipotent`: left N-translation moves exactly the N-window; `translate_compact`: unrestricted MK-window absorbs right K-translation |

`horoDecomp_conj` and `siegelSet_conj` compare actual rationally conjugate Hopf-ideal
parabolics and conjugate compacts. The three coordinates conjugate separately, and the
conjugate Siegel set uses the conjugated windows with the same threshold. Right translation
and parabolic left translation are stated as containment with a possibly smaller positive
common threshold. Different root coordinates can require different shifts, so exact equality
requires the root-by-root translated cones in the erratum's convention.

**Checks for the quotient Siegel set.** `RealSiegel.quotient_empty` says an empty
window has empty image; `quotient_trivial` says quotient by the identity subgroup
preserves membership; `quotient_full` says a nonempty Siegel set maps onto the
one-point quotient by the whole group. These check the literal-image definition
independently of any fundamental-domain assertion.

### 3.3 Primitive reduction and closed orbits

Use `SiegelGeometry.Points F B R = WithConv (B →ₐ[F] R)` for a finite-type affine
Hopf group with coordinate algebra `B`. A rational representation is a coordinate
bialgebra map `r : O(GL_n) → B`; `matrixPoints r R` is evaluation followed by
`GeneralLinear.pointsMulEquiv`. A closed embedding means `r` is surjective.
`realComparison` identifies `InfinitePoints ℚ B` with `Points ℚ B ℝ` by evaluation
at the unique real place, using that place's completion equivalence. These are the
AA.1 and RG2.0 point carriers, with their existing topologies.

**Checks.** `SiegelGeometry.points_trivial`, `points_gm`, `points_dual` respectively
make the trivial group's points a singleton, retain the nontrivial element of order
two in `G_m(ℝ)`, and retain nontrivial `G_a` points over the dual numbers.
`matrixPoints_identity`, `matrixPoints_trivial`, `matrixPoints_faithful` give the
supplier's `GL_n` identification, the constant identity representation of the trivial
group, and injectivity for a closed embedding. `realComparison_one`,
`realComparison_rational`, `realComparison_injective` test the identity, the rational
diagonal and equality of infinite points.

`SiegelGeometry.matrixDomain n u t` is the full real domain

```
Σ_n(u,t) = {v diag(a) k : v upper unitriangular, |v_ij| ≤ u (i<j),
                        a_i>0, a_i/a_(i+1) ≥ t, kᵀk=1}.
```

Theorems about reduction use `u,t>0`. Both determinant signs occur through `O(n)`.
This is [Orr], §2.1, p. 5; inversion converts [Platonov–Rapinchuk–Rapinchuk],
§4.2, pp. 205–208, from `KAU` with right arithmetic action to this `UAK` domain.
`gram g = (g⁻¹)ᵀg⁻¹` records the Gram matrix of the columns of `g⁻¹`.
`gram_posDef` and `gram_fiber` say that these are positive forms and that equal
forms mean `h=gk` for an orthogonal `k`. `reduced_matrixDomain` states cofinality
with `RealSiegel.reducedSet` in both directions, changing the positive constants.
`matrixDomain_triple` identifies this exact set with a domain of the triple defined
in AA.3.7, with its standard orthogonal compact. [BKT], §4.5, pp. 17–18.

**Checks.** `domain_zero` is a singleton domain in rank zero; `domain_sign` gives
all of `GL_1(ℝ)`, including negative scalars. In `domain_sl2`,
`g=[[√y,x/√y],[0,1/√y]]`, `y>0`, lies in `Σ_2(u,t)` exactly when `|x|≤u` and
`y≥t`; its upper half-plane coordinate is `x+iy`.
`gram_identity` gives the identity form; `gram_lattice` gives `[[1,1],[1,5]]`
from columns `(1,0),(1,2)` of `g⁻¹`; `gram_diagonal` gives
`diag(a⁻²,a²)` from `g=diag(a,a⁻¹)`, `a≠0`.

`ReductiveComponents F B`, for a characteristic-zero field, requires smoothness and
that every normal smooth unipotent subgroup of the geometric fibre is trivial.
It allows finite component groups. `reductiveComponents_of_reductive` relates it
to the supplier's connected reductive property. [Borel], §5.3, p. 19.

**Checks.** `redComponents_torus` admits `G_m`; `redComponents_finite` admits `μ₂`
in characteristic zero; `redComponents_additive` excludes `G_a`.

For a Hopf ideal `I` defining `H⊆G`, `AffineQuotient I` consists of a finite-type
commutative coordinate algebra `A`, a faithfully flat map `π:A→O(G)` and a
coefficient-natural right action of `G`. Its pinning equations, for every `F`-algebra
`R`, are

```
σ_R(g)=g∘π;  σ_R(g)=σ_R(h) ↔ gh⁻¹∈H(R);
x·1=x;  (x·g)·h=x·(gh);  σ_R(g)·h=σ_R(gh).
```

Thus `AffineQuotient.points R = (A →ₐ[F] R)` also defines rational and adelic points.
Faithful flatness supplies local lifts; it does not assert that every rational
quotient point lifts rationally. `affineQuotient_exists` assumes
`ReductiveComponents` for both groups. `closed_orbit_realization` uses a surjection
`F[X₁,…,X_n]→A` and the equation `j(x·g)=ρ(g⁻¹)j(x)`. This is a closed immersion;
faithful flatness and the fibre equation identify its geometric image with the
closed orbit of `j(σ(1))` and its scheme stabilizer with `H`.
[BHC], §3.8, p. 501; [Borel], §5.3, pp. 19–20, includes disconnected groups.

**Checks.** `quotient_full` makes `G\G` a point. `quotient_trivial` makes the
projection for the identity subgroup bijective on every coefficient algebra.
`quotient_square` supplies a quotient coordinate pulling back to `T²` on `G_m`
and a rational quotient point taking value `2` that cannot lift to `G_m(ℚ)`.

`ClosedOrbit n m` has a rational algebraic `GL_n` representation, a real vector `w`,
and two hypotheses: its complex orbit is the common zero locus of a set of complex
polynomials, and its real stabilizer is transpose-stable. Its `act g` is `ρ(g)w`.
For a rational basis `b`, `ClosedOrbit.lattice b` consists exactly of the real
vectors `∑_j z_j b_j` with integer coefficients. The compact weight-bound and
lattice-finiteness theorems assume this carrier, positive `u,t`, and this full
rational lattice; the latter also allows a fixed rational left translate `cΣ`.
No boundedness or finiteness of the orbit intersection is a carrier axiom.
[BHC], §§5.3–5.4, pp. 504–506.

**Checks.** `orbit_zero` admits the zero orbit; `orbit_standard_nonclosed` excludes
the punctured affine line; `orbit_identity` gives `act 1=w`.
`act_zero` fixes the zero vector; `act_hyperbola` evaluates weights `+1,−1` at
`(1,1)` as `(a,a⁻¹)`, fixing the left-action convention.
`lattice_zero` is `{0}` in dimension zero; `lattice_integral` gives integer
coordinates in the standard basis; `lattice_half` contains `1/2` but excludes
`1/4` for the basis vector `1/2`.

`primitiveRegion r a u t C` is the inverse image in the actual `AdelicPoints ℚ B`
of `⋃_{c∈C} c(Σ_n(u,t)a × GL_n(ℤ̂))`, using `realComparison` and
`IntegralModel.standardGLn.integralLevel`. Its reduction theorem assumes a closed
embedding, `ReductiveComponents`, `det a=1`, transpose-stability of `aG(ℝ)a⁻¹`,
positive `u,t`, and the real covering `GL_n(ℝ)=GL_n(ℤ)Σ_n(u,t)`.
[Borel], Theorem 4.5, pp. 17–18.

**Checks.** `primitive_empty` gives the empty region for `C=∅`;
`primitive_identity` includes the identity for `C={1}`, `a=1`, `u≥0`, `t≤1`;
`primitive_full_group` makes membership for `G=GL_n`, `a=1`, `C={1}` equivalent
to membership of the real component in `Σ_n(u,t)` and of the finite component
in the standard integral level.

- **Reduction for GL_n(ℝ).** `SiegelGeometry.matrixDomain_reduction` and `RealSiegel.exists_reduced_GLZ`. (*gln-real-reduction*) For `n ≥ 1`, prove that there are `C > 0`
  and a standard Siegel set `𝔖 ⊂ GL_n(ℝ)` (with respect to `O(n)` and the upper triangular
  Borel) such that `GL_n(ℝ) = GL_n(ℤ)·𝔖`; equivalently every positive definite form is
  `GL_n(ℤ)`-equivalent to an `(e, C)`-reduced form for the standard basis `e`
  ([Platonov–Rapinchuk–Rapinchuk], Theorem 4.12, pp. 206–208, and Theorem 4.20,
  p. 220). The book uses a right arithmetic action and `KAU` coordinates;
  apply inversion to obtain our left action and `UAK` convention. This also
  reverses the simple-root ratios; do not carry the book's truncation sign
  unchanged into our coordinates. *Needs:* AA.3.2; Mathlib `ModularGroup.exists_smul_mem_fd`.
- **GLₙ finite class number one over ℚ.** For `n ≥ 1` over the ground field `ℚ` (`ℤ` a PID; over
  a number field the double coset set is the class group), prove
  `GL_n(𝔸_{ℚ,f}) = GL_n(ℚ) GL_n(ℤ̂)`, and that the rational intersection with `GL_n(ℤ̂)` is
  `GL_n(ℤ)` ([Borel], §2.1–2.2, pp. 11–12; §4.4, p. 17). *Needs:* AA.1.4; AA.1.1.
- **Adelic reduction for GL_n over ℚ.** For `n ≥ 1` and a standard Siegel domain `𝔖` of
  `GL_n(ℝ)` with `GL_n(ℝ) = GL_n(ℤ)·𝔖` (*gln-real-reduction*), prove
  `GL_n(𝔸_ℚ) = GL_n(ℚ) · (𝔖 × GL_n(ℤ̂))` ([Borel], Lemma 4.4, p. 17). *Needs:* AA.3.3.
- **Real GLₙ Siegel overlap.** `SiegelGeometry.matrixDomain_overlap`. For `n ≥ 1`, an integer `d ≥ 1` and a standard Siegel domain `Σ`
  of `GL_n(ℝ)` in the left-quotient convention of *gln-real-reduction*, prove that the set of
  `γ ∈ GL_n(ℚ)` with `γ, γ⁻¹ ∈ d^{−1} M_n(ℤ)` and `γΣ ∩ Σ ≠ ∅` is finite; the same holds for two
  fixed rational translates of such domains, with `c_1, c_2 ∈ GL_n(ℚ)` fixed and the overlap
  condition `γc_1Σ ∩ c_2Σ ≠ ∅` ([Borel], §3.1 Lemma, p. 14; §3.3, p. 15). *Needs:* AA.3.3.
- **Simultaneous self-adjointness.** `SiegelGeometry.simultaneous_selfAdjoint`. For `n ≥ 1` and a finite nested chain
  `G_1 ⊃ G_2 ⊃ ⋯ ⊃ G_m` (`m ≥ 1`) of reductive real algebraic subgroups of `GL_n(ℝ)`, prove that
  one `a ∈ SL_n(ℝ)` makes every `a G_i(ℝ) a⁻¹` stable under transpose ([BHC], Theorem 1.9,
  p. 492). *Needs:* RepresentationTheory/LieGroups, layer 9.
- **Reductive homogeneous spaces as closed orbits.** `SiegelGeometry.affineQuotient_exists` and `AffineQuotient.closed_orbit_realization`. For a field `F` of characteristic `0`, a
  reductive (not necessarily connected) linear algebraic group `G` over `F` and a reductive
  closed `F`-subgroup `H ⊂ G`, prove that `H\G` is affine and has a `G`-equivariant closed
  immersion into a finite-dimensional rational `G`-representation, taking the identity coset to
  `w ∈ V(F)` with stabilizer `H`, and that the orbit of `w` is closed ([BHC], §3.8, p. 501; [Borel], §5.3, pp. 19–20 for disconnected groups). *Needs:* ReductiveGroups, layer 3; ReductiveGroups, layer 6.
- **Closed-orbit weight bounds in a real Siegel domain.** `SiegelGeometry.ClosedOrbit.compact_weight_bound`. (*closed-orbit-weight-bound*) Let
  `V` be a finite-dimensional rational representation of `GL_n` over `ℚ`, `w ∈ V(ℝ)` with closed
  `GL_n(ℂ)`-orbit and transpose-stable stabilizer in `GL_n(ℝ)`, `Γ ⊂ V(ℚ)` a lattice, and let
  `GL_n(ℝ)` act on the left with `Σ = ω·A_t·O(n)` a standard real Siegel domain for the upper
  triangular Borel and `O(n)` in the left-quotient convention of *gln-real-reduction* (BHC §5.3
  uses the equivalent right action `v·g = g⁻¹·v` and the inverse domain `O(n)·A_t⁻¹·ω⁻¹`). Prove
  that there is a compact `Q ⊂ GL_n(ℝ)` such that `Σ·w ∩ Γ ⊂ Q·w`; in particular the norms of
  these lattice points are uniformly bounded ([BHC], §5.3–5.4, pp. 504–506). *Needs:* AA.3.3.
- **Closed-orbit lattice finiteness.** `SiegelGeometry.ClosedOrbit.lattice_finite`. Under the hypotheses of *closed-orbit-weight-bound*
  (rational `GL_n`-representation `V` over `ℚ`, `w ∈ V(ℝ)` with closed orbit and
  transpose-stable stabilizer, `Γ ⊂ V(ℚ)` a lattice, `Σ` a left-convention standard Siegel
  domain), prove that `Σ·w ∩ Γ` is finite, and that the same holds for any other lattice of
  `V(ℚ)`, in particular after replacing `Σ` by `c·Σ` for fixed `c ∈ GL_n(ℚ)`, since
  `c·Σ·w ∩ Γ = c·(Σ·w ∩ c⁻¹Γ)` ([BHC], Lemma 5.4, pp. 505–506). *Needs:* AA.3.3.
- **Compact finite parts give bounded denominators.** For `F` a number field, `G` a linear
  algebraic group over `F` with a rational representation `ρ : G → GL(V)` over `F`, `w ∈ V(F)`
  and compact `C ⊂ G(𝔸_{F,f})`, prove that there is a fractional `𝒪_F`-lattice `L ⊂ V(F)` such
  that `wρ(C) ∩ V(F) ⊂ L`; likewise (for `G = GL_n` and `ρ` the identity) a compact `C` bounds
  denominators of all entries of `g` and `g⁻¹` for `g ∈ C ∩ GL_n(F)` ([Borel], Lemma 4.3, p. 17).
  In a rational basis, `Reduction.compact_finite_orbit_denominators` supplies a nonzero
  `d ∈ 𝒪_F` with `d v_i ∈ 𝒪_F` for every rational vector in `wρ(C)`; the lattice can
  therefore be chosen as `d⁻¹𝒪_F^n`. `Reduction.compact_finite_denominators` simultaneously
  clears all entries of `ρ(γ)` and `ρ(γ)⁻¹` for rational `γ` whose finite diagonal lies in `C`.
  *Needs:* AA.1.2; AA.1.5.
- **Reduction for reductive subgroups of GL_n.** `SiegelGeometry.reductive_subgroup_reduction`. Let `G ⊂ GL_n` be reductive over `ℚ` with
  `a(G(ℝ))a⁻¹` self-adjoint for some `a ∈ SL_n(ℝ)` (the self-adjoint embedding), and let `𝔖` be
  the left-quotient standard Siegel domain of *gln-real-reduction*. Prove that there are
  finitely many `c_i ∈ GL_n(ℚ)` such that `Ω = ⋃_i (c_i·(𝔖a × GL_n(ℤ̂)) ∩ G(𝔸))` satisfies
  `G(𝔸) = G(ℚ)·Ω` and `{γ ∈ G(ℚ) : γΩ ∩ Ω ≠ ∅}` is finite, and that the finite projection of `Ω`
  has compact closure (Borel §4.5 states the inverse set `⋃_i (a⁻¹𝔖⁻¹·GL_n(ℤ̂)·c_i⁻¹ ∩ G(𝔸))` for right
  quotients) ([Borel], Theorem 4.5, p. 17). *Needs:* AA.3.3.
- **Rational points on closed orbits.** `SiegelGeometry.AffineQuotient.rational_orbits`. For `F` a number field, `G` a reductive `F`-group (not
  necessarily connected), `H ⊂ G` a reductive `F`-subgroup and `σ : G → H\G`, prove that
  `σ_𝔸(G(𝔸)) ∩ (H\G)(F)` is a finite union of `G(F)`-orbits ([Borel], Theorem 5.4, p. 20).
  *Needs:* AA.3.3; AA.1.4.

### 3.4 Adelic reduction and arithmetic quotients

- **Adelic Siegel sets.** For a connected reductive group `G` over `F`, admissible `K`,
  `T_1 ∈ a_0` and a compact subset `ω ⊂ N_0(𝔸) M_0(𝔸)^1`, define
  `Reduction.siegelSet T₁ ω : Set (AdelicPoints H)`, the Siegel set

  ```text
  𝔖(T_1, ω) = {p a k : p ∈ ω, a ∈ A_0(ℝ)^0, k ∈ K, β(H_0(a) − T_1) > 0 for all β ∈ Δ_0}.
  ```

  Prove `Reduction.mem_siegelSet` (`x ∈ siegelSet T₁ ω` iff `x = p a k` with the stated
  conditions), `Reduction.siegelSet_mono` (antitone in `T₁`, coordinatewise for `Δ_0`, and
  monotone in `ω`), `Reduction.siegelSet_mul_K` (`siegelSet T₁ ω * K = siegelSet T₁ ω`) and
  `Reduction.siegelSet_center` (stability under `A_G(ℝ)^0`) ([Arthur], §8, p. 37). *Needs:* AA.3.1.

  **Checks.**
  - In the real split-torus case, there are no root inequalities; with the whole compact
    residual factor the Siegel set is the whole real torus. Adelic compact windows need
    not give the whole adelic torus: for `G_m/ℚ`, `ω = {1}` and the usual maximal compact,
    a finite idele with nonzero valuation lies outside `ω A_G K`.
  - The modular fundamental domain is contained in `|x| < 1`, `y > 1/2`
    (`Reduction.sl2_fd_in_siegel_strip`), while `3i/4` belongs to that strip but not to
    the fundamental domain (`Reduction.sl2_strip_not_fd`).
  - `sl2_closed_critical_cover`: `|x| ≤ 1/2`, `y ≥ √3/2` covers every modular orbit.
    With the strict convention of this roadmap, `sl2_open_critical_fails` excludes the
    elliptic boundary orbit at `1/2 + i√3/2`; `sl2_open_subcritical_cover` supplies covering
    for `0 < t < √3/2`. The same scalar quotient check applies to `GL₂/ℚ` with its standard
    compact. Changing a strict threshold to the critical value is not legitimate.
  - For `SL_2/ℚ`, some Siegel set with compact `ω` meets every `SL_2(ℚ)`-orbit in `SL_2(𝔸)` (at
    `∞` it contains the standard fundamental domain of `SL_2(ℤ)`).
  - For `SL₂/ℚ` choose the finite factor `SL₂(ℤ̂)`, real `N`-window `[−1, 1]`, and `A`-parameter
    `y > 1/2`. Both the identity and `n(1)` lie in this Siegel set; their ratio is a nontrivial
    rational element. Thus this specified Siegel set cannot be a fundamental domain with
    disjoint rational translates (`Reduction.sl2_strip_overlap` checks the real coordinates).
- **Siegel sets cover G(F)\G(𝔸).** For a connected reductive group `G` over `F` and admissible
  `K`, prove that there are `T_1` and `ω` such that `G(𝔸_F) = G(F) 𝔖(T_1, ω)`
  (Borel–Harish-Chandra) ([Arthur], Theorem 8.1, p. 37; [Borel], Theorem 4.6, p. 18). *Needs:*
  AA.3.4; AA.3.2; AA.1.4; Mathlib `ModularGroup.exists_smul_mem_fd`; AA.3.3.
- **Siegel property.** For a connected reductive group `G` over `F`, admissible `K` and a Siegel
  set `𝔖 = 𝔖(T_1, ω)`, prove that `{γ ∈ G(F) : γ𝔖 ∩ 𝔖 ≠ ∅}` is finite (the finiteness condition
  of a fundamental set, [Borel], Definition 4.1, p. 17, which the Siegel-set fundamental sets of
  [Borel], Theorem 4.6, p. 18 satisfy; the real-group form is [BKT], Proposition 2.7(2), p. 9,
  stated in AA.3.6, which depends on this subsection and is not an input to it). *Needs:*
  AA.3.4; AA.3.3; AA.1.4.
- **Finiteness of class numbers.** (*class-number-finite*) For every linear algebraic group `G`
  over `F` and every compact open subgroup `U ⊂ G(𝔸_{F,f})`, prove that the double coset space
  `G(F)\G(𝔸_{F,f})/U` is finite; equivalently `G(𝔸_F) = ⋃_{i=1}^h G(F) x_i G(F_∞) U` for finitely
  many `x_i` ([Borel], Theorem 5.1, p. 19; [Milne], Lemma 5.12, p. 57). *Needs:* AA.1.5; AA.1.4;
  AA.3.4; AA.1.2; AA.3.3.
- **Unipotent groups have class number one.** For a unipotent group `N` over `F` and compact
  open `U ⊂ N(𝔸_f)`, prove `N(𝔸_f) = N(F)U` ([Borel], Corollary 2.5, p. 13). *Needs:*
  GlobalNumberFields, layer 6; AA.1.3.
- **Class numbers of semidirect products.** If `G = H ⋉ N` over `F` with `N` unipotent, prove
  that every double coset `G(F)\G(𝔸_f)/U` meets `H(𝔸_f)`, and that `G(F)\G(𝔸_f)/U` is finite if
  `H(F)\H(𝔸_f)/(U ∩ H(𝔸_f))` is finite for all compact open `U` ([Borel], Proposition 2.7, p. 13).
  The general signature is `semidirect_meets_finite_doubleCoset`: it assumes a normal
  smooth unipotent Hopf subgroup `N` and bijectivity of `N(R)×H(R)→G(R)` on every
  coefficient algebra. No reductivity of the complement is assumed.
  `levi_meets_finite_doubleCoset` is its Levi specialization. The induced surjection
  from the complement's double cosets gives the finiteness implication.
  *Needs:* AA.3.4; AA.1.3.
- **Arithmetic subgroups attached to a level.** For any affine algebraic group `G` over the number field `F`,
  compact open `U ⊂ G(𝔸_{F,f})` and `x ∈ G(𝔸_{F,f})`, define
  `Reduction.levelArithmetic x U : Subgroup (G(F)) := G(F) ∩ x U x⁻¹`, `Γ_{x,U}`, viewed in
  `G(F_∞)` through the diagonal. Prove `Reduction.levelArithmetic_discrete` (its image in
  `G(F_∞)` is discrete), `Reduction.levelArithmetic_conj`
  (`levelArithmetic (γ x u) U = γ (levelArithmetic x U) γ⁻¹` for `γ ∈ G(F)`, `u ∈ U`) and
  `Reduction.levelArithmetic_commensurable` (for `U′ ≤ U`, `levelArithmetic x U′` has finite
  index in `levelArithmetic x U`); for all `x, x′` and compact open `U, U′` the groups `Γ_{x,U}`
  and `Γ_{x′,U′}` are commensurable (`Reduction.levelArithmetic_commensurable_pair`) ([Milne], Lemma 5.13, p. 57). *Needs:* AA.1.3; AA.1.5; AA.1.2.

  **Checks.**
  - For `GL_2/ℚ`, `levelArithmetic 1 GL_2(ℤ̂) = GL_2(ℤ)`.
  - `levelArithmetic x U` depends on `x` and not only on `U`: for `GL_2/ℚ` and `x = diag(p, 1)` at
    the place `p`, `levelArithmetic x GL_2(ℤ̂) = diag(p,1) GL_2(ℤ) diag(p,1)⁻¹ ≠ GL_2(ℤ)`.
  - For `GL₁/ℚ`, the level `ℤ̂^×` gives rational arithmetic group `{±1}`; the
    principal congruence level of modulus `3` gives `{1}` (`levelArithmetic_trivial_group`).

- **Component decomposition of a level quotient.** For any affine algebraic group `G` over the number field `F`,
  compact open `U` and representatives `x_1, …, x_h` of `G(F)\G(𝔸_{F,f})/U`
  (*class-number-finite*), prove that `[g_∞] ↦ [(g_∞, x_i)]` induces a homeomorphism
  `⊔_i Γ_{x_i,U}\G(F_∞) ≃ G(F)\G(𝔸_F)/U`, equivariant for the right action of `G(F_∞)`; the
  archimedean factor and the split centre are retained, and the finite set `G(F)\G(𝔸_f)/U` is in
  general not the whole quotient ([Milne], Lemma 5.13, p. 57; [Arthur], §2, p. 13). *Needs:*
  AA.3.4; AA.1.2. `componentHomeomorph_right` supplies the right-action equation
  through the two induced quotient maps.
  **Checks:** `component_identity` retains the finite representative at the base point;
  `component_distinct` separates different class indices; `component_same` identifies
  points within a component exactly by the arithmetic left action.
- **Exponential integrability on the relative chamber.** For `r ≥ 0`, `a₀^G` a real vector
  space of dimension `r` with a Haar (Lebesgue) measure, `β_1, …, β_r` a basis of its dual,
  `c_1, …, c_r > 0` with `2ρ = Σ c_i β_i`, and `T ∈ a₀^G`, prove `Reduction.integral_exp_chamber` in independent root coordinates: the integral of
  `exp(−2ρ(H))` over `β_i(H) > β_i(T)` is finite. For `r = 0` the domain is the zero-dimensional
  point and has the chosen finite Haar mass. In the coordinates `x_i = β_i(H)`,
  the integral is `J ∏_i exp(−c_i β_i(T))/c_i`, where `J > 0` is the Haar Jacobian.
  This follows from Mathlib `integral_exp_mul_Ioi` and finite-product integration
  (`Mathlib/Analysis/SpecialFunctions/ImproperIntegrals.lean`, `integral_exp_mul_Ioi`). *Needs:* AA.3.1.
  **Checks.**
  - In rank zero, coordinate Lebesgue measure gives integral `1` (`chamber_rank_zero`);
    a Haar measure with point mass `J` gives `J`.
  - On `x > 0`, `∫ exp(−x) dx = 1`, whereas `∫ exp(−2x) dx = 1/2`
    (`chamber_rates`); the rate belongs in the denominator.
  - On `x > log 2`, `∫ exp(−x) dx = 1/2` (`chamber_shift`), fixing the sign of
    the truncation parameter.

- **Siegel sets in G(𝔸)^1 have finite measure.** For `G` connected reductive, `ω` compact and
  an adelic Siegel set `𝔖 = 𝔖(T₁, ω)`, prove that the measure of `𝔖 ∩ G(𝔸)^1` is finite
  (an owned deduction from `integral_exp_chamber` and the Iwasawa Jacobian,
  using the Siegel sets of [Arthur], §8, Theorem 8.1, p. 37).
  *Needs:* AA.3.4; AA.3.1; AA.2.2.
- **Finite volume of G(F)\G(𝔸)^1.** For every connected linear algebraic group `G/F`,
  prove that `G(F)\G(𝔸_F)^1` has finite positive volume for the invariant quotient measure: [Platonov–Rapinchuk–Rapinchuk],
  Theorem 5.24, pp. 318–321, treats every connected linear algebraic group.
  Supply its characteristic-zero Levi decomposition (`Reduction.exists_leviDecomposition`),
  compact unipotent adelic quotient (`Reduction.unipotent_adelicQuotient_compact`) and product
  integration as owned inputs. The general signature is
  `Reduction.exists_finite_invariant_normOne_measure`; `Reduction.finite_volume`
  retains the specified normalization in the reductive case. *Needs:* AA.3.4; AA.2.3; AA.2.1; AA.2.2; AA.3.1.
- **Tamagawa numbers are finite.** For connected reductive `G`, prove that the Tamagawa number
  `τ(G)` of AA.2.4 is finite and positive ([Rosengarten], §1, p. 3). *Needs:* AA.3.4; AA.2.4.
- **When G(F)\G(𝔸) has finite volume.** For a linear algebraic group `G` over `F`, prove that
  `G(F)\G(𝔸_F)` carries a nonzero `G(𝔸)`-invariant Radon measure of finite volume iff
  `X*_F(G°) = 0` (`finite_volume_iff_identityComponent`), with `G°` represented by
  the largest geometrically connected closed subgroup: its Hopf ideal is minimal among
  those with geometrically connected quotient. `exists_identityComponentIdeal` supplies
  that ideal; `finite_volume_iff` is the connected specialization.
  [Platonov–Rapinchuk–Rapinchuk], Theorem 5.22(2), pp. 314–316.
  **Checks:** `identity_component_connected` gives ideal zero for connected `G`;
  `identity_component_finite` gives no characters for the identity component of any
  finite characteristic-zero group; `identity_component_torus` retains the nonzero
  characters of `G_m`. *Needs:* AA.3.4; AA.2.1.
- **Anisotropic groups have compact quotients.** For connected reductive `G` over `F` whose
  derived group is `F`-anisotropic (equivalently, `G` has no proper `F`-parabolic subgroup),
  prove that `G(F)\G(𝔸_F)^1` is compact ([Borel], Theorem 5.8, p. 22; [Arthur], §4, p. 21).
  *Needs:* AA.3.4; AA.3.1; ReductiveGroups, layer 7.
- **Isotropic groups have noncompact quotients.** For connected reductive `G` over `F` with a
  proper `F`-parabolic subgroup, prove that `G(F)\G(𝔸_F)^1` is not compact; precisely,
  `G(F)\G(𝔸)^1` is compact iff `G(F)` has no nontrivial unipotent element iff `G^der` is
  `F`-anisotropic ([Borel], Theorem 5.8, p. 22; [Arthur], §4, p. 21). *Needs:* AA.3.1; AA.1.3;
  ReductiveGroups, layer 7; AA.2.1.
- **Cocompact arithmetic groups contain no unipotents.** Let `G` be connected reductive over
  `ℚ` and `Γ = G(ℚ) ∩ U` for a compact open `U ⊂ G(𝔸_f)`. Prove that if `Γ\G(ℝ)` is compact then
  `Γ` contains no nontrivial unipotent element ([BKT], Remarks 1.4(1), p. 5). *Needs:* AA.3.4.
- **S-arithmetic subgroups are lattices.** Let `G` be connected reductive over `F` with
  `X*_F(G)=0` (in particular, connected semisimple), `S` a
  finite set of places containing the archimedean ones, and `U^S ⊂ G(𝔸_F^S)` compact open.
  Prove that `Γ_S = G(F) ∩ G(F_S)U^S` is a lattice in `G(F_S) = ∏_{v∈S} G(F_v)`, cocompact iff `G`
  is `F`-anisotropic ([Rapinchuk], §2.6, p. 16; [Borel], Introduction, p. 6; §8, pp. 26–30).
  *Needs:* AA.3.4; AA.1.2; AA.1.3.
- **Finitely many G(𝒪)-orbits on rational flags.** For `F` a number field, `G` connected
  reductive over `F` (Borel 7.3 allows any connected `G`; the consumers need only reductive `G`)
  and `P` parabolic over `F`, prove that `(G/P)(F)` is a finite union of orbits of an arithmetic
  subgroup; equivalently `G(F) = ⋃_{i∈I} Γ x_i P(F)` with `I` finite ([Borel], Lemma 7.2 and
  Theorem 7.3, p. 25). *Needs:* AA.3.4; AA.3.1.
- **Arithmetic quotients have finite volume.** (*arithmetic-quotient-finite-volume*) For
  connected reductive `G` over `F` and `Γ = G(F) ∩ U` with `U ⊂ G(𝔸_{F,f})` compact open, prove
  that `Γ\(G(F_∞)/A_G(ℝ)^0)` has finite invariant volume ([Borel], Theorem 5.6, p. 21). *Needs:*
  AA.3.4; AA.2.1.
- **Arithmetic quotients of anisotropic groups are compact.** For `G` connected reductive, in
  the setting of *arithmetic-quotient-finite-volume*, prove that `Γ\(G(F_∞)/A_G(ℝ)^0)` is compact
  iff `G^der` is `F`-anisotropic; for `H = SL_1(D)` with `D` a central division algebra of degree
  `≥ 2` over `F`, `H(F)\H(𝔸_F)` and `Γ\H(F_∞)` are compact ([Borel], Theorem 5.6(ii), p. 21).
  The general division-algebra signature `divisionUnits_compact` assumes connected
  reductivity, no rational characters, a closed matrix embedding, and a rational basis
  identifying every rational matrix with left multiplication by a unit of a
  finite-dimensional division algebra. It concludes compactness of both full quotients.
  For `SL₁(D)`, the left regular embedding and semisimplicity provide these hypotheses;
  nilpotence of `a−1` in a division algebra forces `a=1`.
  *Needs:* AA.3.4.

**Checks for the window carrier.** `window_identity` includes one;
`window_height_zero` has zero H_P throughout; `window_excludes_split` excludes any
positive split component with nonzero logarithm. The subgroup inclusions in these
formulas are the original quotient-coordinate pullbacks, `subgroupEmbed`.

The `Reduction.siegelSet` carrier allows arbitrary windows; compactness and
`ω ⊆ windowSubgroup P = N_P(𝔸) M_P(𝔸)^1` are explicit hypotheses of the reduction theorems.
`siegel_covering`, `siegel_finite_overlap` and `siegel_finite_measure` use the minimal
standard parabolic (`P.ideal = P₀.ideal`); no covering or finiteness is assumed as input.
The last measures the set in the **norm-one subgroup**, not its ambient Haar measure.
`roots_empty_iff_derived_anisotropic` identifies empty roots with the absence of
nontrivial `F`-cocharacters in the actual derived Hopf quotient.
`compactSpace_normOneQuotient_iff_roots_empty` identifies the anisotropic-derived case;
`compactSpace_normOneQuotient_iff_no_proper_parabolic` uses the actual dynamic parabolic
predicate. `rational_flags_finite` is finiteness of the arithmetic/parabolic double cosets.

**Checks for the adelic set definition.** `siegel_empty` gives the empty set for an empty
window. `siegel_boundary` puts one in the singleton-window set exactly when every simple
root evaluates negatively on T. `siegel_torus` gives `A K ≠ G_m(𝔸)` for the singleton
window, detecting the finite idele valuations that root inequalities alone miss.

For the S-arithmetic target, `SArithmetic.Points S` is the product of all infinite factors
and the finite factors indexed by S. `projection` and `diagonalS` evaluate precisely
these factors. `arithmetic S U` consists of rational points whose finite components
outside S agree with some element of the compact open finite level U; this is the
projection of U to the away-S factors. `discrete`, `finite_covolume`, and `compact_iff`
state the lattice and anisotropy assertions. Finite covolume and compactness require
`X*_F(G)=0`, which includes the semisimple setting in the target.

**Checks.** `SArithmetic.empty` recovers `levelArithmetic 1 U`;
`SArithmetic.inverting_prime` admits the GL₁ rational element p when S contains p but
excludes it at the ordinary integral level; `SArithmetic.trivial` is the whole trivial group.

For a finite-dimensional **central** division algebra `D/F`, the target
`divisionNormOne_compact` constructs `SL₁(D)` as a Hopf-ideal quotient of the
left regular `GL_n`. A splitting isomorphism `D⊗F̄≃M_d(F̄)` pins its geometric
points: left multiplication by a unit whose determinant in `M_d` is one.
Characteristic zero makes this geometric equation determine the subgroup scheme.
The target supplies semisimplicity and compactness of both the full adelic quotient
and every compact-open-level arithmetic quotient at infinity. The splitting
isomorphism is supplied by Mathlib's algebraically closed Wedderburn theorem;
the descended Hopf ideal and arithmetic conclusion are owned here.
[Platonov–Rapinchuk–Rapinchuk], §2.3.1, pp. 90–91, Proposition 2.29,
Example 4.46, pp. 252–253, and Theorem 5.24.

**Checks.** `normOne_degree_one` gives the identity group for `D=F`;
`normOne_split_two` gives reduced norm one on `diag(2,1/2)` after splitting;
`normOne_not_regular_det` distinguishes reduced norm `−1` on `diag(−1,1)`
from determinant `1` of left multiplication on `M₂`. The latter determinant
cannot replace the reduced norm in the defining equation.

### 3.5 Algebraic heights

- **Rational-point Arakelov comparison.** `Reduction.height_diagonal_relative` identifies
  the adelic height on `g ∈ G(F)` with #287's relative `NumberField.arakelovMulHeight`
  of the tuple indexed by `Bool × Fin m × Fin m`, containing the entries of
  `ρ(g)` and `ρ(g)⁻¹`. Its finite factors use normalized `|π_v|=N(v)⁻¹`; at infinity
  they use the ℓ² norm to exponent `mult(v)`. For `d=[F:ℚ]`, the absolute
  Arakelov height is `height(Δg)^(1/d)`, equivalently the adelic height is the
  d-th power of the absolute height. For `m=0`, the empty tuple and the adelic
  representation both have height one. Consume #287's extension-power comparison;
  do not introduce a separate rational tuple-height definition. This is a comparison
  of the displayed formulas in #287 §0.1 and `height_eq`, not a Northcott counting bound.

  **Checks.** `height_diagonal_rank_zero` gives one. `height_diagonal_identity_two`
  gives relative height `2^[F:ℚ]` for the two-dimensional identity and absolute
  height two, including over quadratic F. `height_diagonal_scalar_two` gives
  `sqrt(17)` for the rational GL₁ point 2: the tuple `(2,1/2)` has archimedean
  factor `sqrt(17)/2` and 2-adic factor 2.

- **Local polynomial comparison for algebraic heights.** Define `Reduction.finiteHeight`
  as the maximum of the normalized absolute values of entries of r(g) and its inverse;
  define `Reduction.infiniteHeight` as their combined Hilbert–Schmidt norm to the
  archimedean multiplicity. Both are one in rank zero. The signatures are
  `finiteHeight_polynomial_comparison` and `infiniteHeight_polynomial_comparison`.
  **Checks:** `localHeight_rank_zero` gives one; `localHeight_identity` gives one at
  finite places and `sqrt(2m)^mult` at infinity; `localHeight_inverse` is unchanged by
  inversion. These local formulas agree with the factors in `height_eq`.
 For `F` a number field, `G` an affine
  algebraic group over `F`, closed immersions `σ : G → GL_m` and `τ : G → GL_{m′}` over `F`, and
  local norms as in *adelic-height* applied to `σ ⊕ σ^∨` and `τ ⊕ τ^∨` (dual-augmented norms),
  prove that there are integers `N ≥ 1` and positive `c_v`, with `c_v = 1` at almost all finite
  places, such that `‖τ(g)‖_v ≤ c_v ‖σ(g)‖_v^N`; the statement includes inverse coordinates
  ([Arthur], §13, p. 70). *Needs:* AA.1.1; AA.1.5.
- **Properness of dual-augmented adelic height.** For `F` a number field, `G` an affine
  algebraic group over `F`, `σ : G → GL_n` a closed immersion over `F`, `r` containing `σ ⊕ σ^∨`,
  and local norms normalized as in *adelic-height*, prove that the product height of
  *adelic-height* has compact sublevel sets: at infinity it bounds both `σ(g)` and `σ(g)⁻¹`; at
  finite `v` its value is `≥ 1` and, when not integral in both directions, is `≥ q_v`. A height
  bound therefore allows only finitely many exceptional finite places ([Arthur], §13, p. 70).
  *Needs:* AA.1.2; AA.1.3; AA.3.5.
- **Polynomial count of rational coordinates.** For a number field `F`, an integer `d ≥ 1`,
  absolute values normalized for the product formula (`|·|_v = |·|^{[F_v:ℝ]}` at archimedean
  `v`) and `R ≥ 1`, prove that the number of `a ∈ F^d` with
  `∏_v max(1, |a₁|_v, …, |a_d|_v) ≤ R` is at most `C R^N`, for constants `C, N` depending only on
  `F, d` ([Arthur], §13, p. 70). *Needs:* GlobalNumberFields, layer 6.
- **Height functions on G(𝔸).** (*adelic-height*) For a connected reductive group `G` over `F`,
  choose a faithful `F`-algebraic representation `r : G → GL_m` containing a representation and
  its dual (and, if needed, a trivial summand), so the resulting height is proper and each local
  norm is at least `1`; arbitrary abstract faithful point representations do not suffice. Define
  `Reduction.height r : AdelicPoints H → ℝ`, `‖x‖_r = ∏_v ‖r(x)_v‖_v`, using the entrywise maximum
  of normalized absolute values at finite `v` and the Hilbert–Schmidt norm raised to the
  archimedean multiplicity `[F_v:ℝ]` at infinity; in the Lean signature `height r` already uses
  `r ⊕ r^∨`, and `Reduction.height_eq` is this formula in positive rank (the inequalities below are
  also satisfied by `height²` or any power, so they do not fix the function). Prove
  `Reduction.height_mul_le`
  (`height (x * y) ≤ height x * height y`), `Reduction.height_inv_le`
  (`∃ C N, height x⁻¹ ≤ C * height x ^ N`), `Reduction.isCompact_height_le`
  (`{x | height x ≤ t}` is compact for a suitable `r`) and `Reduction.card_rational_height_le`
  (the sublevel set in `G(F)` is finite and `#{γ ∈ G(F) | height γ ≤ t} ≤ C t^N`), using the proper-height and counting results of this
  subsection ([Arthur], §13, p. 70). *Needs:* AA.1.1; AA.1.5; AA.1.3; AA.1.4; AA.3.5.

  Arthur's formulas (13.2)–(13.4), p. 70, use a matrix height over `ℚ`.
  The number-field version here is an owned extension via restriction of scalars;
  adjoining the dual fixes inversion symmetry, and normalized local absolute values
  supply the stated exponents. These normalizations are part of `height_eq`, rather
  than a quotation of Arthur's chosen embedding.

  **Checks.**
  - The zero-dimensional representation has height `1`; the empty Hilbert–Schmidt norm
    itself is `0`, so this case is defined separately. A counting assertion includes
    finiteness: Lean assigns `Set.ncard = 0` to the infinite set `ℕ`.
  - For `GL₁/ℚ` with the standard character `r(x) = [x]`, so `r ⊕ r^∨ = diag(x, x⁻¹)`, `height x⁻¹ = height x`; the real local factor is
    `sqrt(x² + x⁻²)`, and each finite factor is `max(|x|_p, |x⁻¹|_p)` (`height_gl1`).
  - If `G(F_∞)` is noncompact the height is unbounded on `G(𝔸)`; a height built from finite
    places only would be bounded on `G(F_∞)` and fail the compactness of height balls
    (`height_not_finite_only`).
  - For `GL₂/ℚ` with the standard representation, `height 1 = √4 = 2` (`height_one`); `height²`
    satisfies all the inequalities above and gives `4`.
- **Comparison of heights.** For any affine algebraic group `G` over the number field `F` and two proper
  `F`-algebraic height representations `r, r′` satisfying *adelic-height* (both algebraic and
  defining proper heights controlling their inverses), prove that there are `C, N > 0` with
  `‖x‖_{r′} ≤ C ‖x‖_r^N` for every `x ∈ G(𝔸_F)`, and conversely; and that multiplication on either
  side by a fixed compact subgroup changes these heights by bounded factors ([Arthur], §13,
  p. 70). *Needs:* AA.3.5.
- **Heights on Siegel sets.** `Reduction.height_siegel` uses a positive-definite real
  seminorm on the existing `a_P` vector space (so its addition is not replaced). For a connected reductive group `G` over `F` and a Siegel set
  `𝔖(T_1, ω)`, prove that there are `c, C > 0` such that for `x = pak`,
  `c e^{c‖H_0(a)‖} ≤ ‖x‖ ≤ C e^{C‖H_0(a)‖}` (any norm on `a_0`); in particular `log‖x‖` and
  `‖H_0(x)‖` are comparable on `𝔖 ∩ G(𝔸)^1` up to constants ([Arthur], §13, p. 70). *Needs:*
  AA.3.5; AA.3.4; AA.3.1.

### 3.6 Cusps for one fixed maximal compact

- **Finitely many cusps.** `Reduction.finite_cusps` uses actual rational
  conjugation of Hopf ideals on every coefficient algebra. For `G` connected reductive over a number field `F` and the arithmetic subgroup
  `Γ=levelArithmetic 1 U` for compact open `U`, prove that there are only finitely many `Γ`-conjugacy classes of `F`-parabolic
  subgroups ([BKT], Proposition 2.7(1), p. 9; [Borel], Theorem 7.3, p. 25). *Needs:* AA.3.1; AA.3.4.
- **Finitely many fixed-K Siegel sets cover.** `RealSiegel.fixed_K_covering`
  supplies a complete irredundant list of arithmetic conjugacy classes of rational
  parabolics, their fixed-K data, relatively compact open windows and positive thresholds,
  covering the connected real group modulo its level arithmetic group. The theorem applies
  to connected reductive `G`; `semialgebraic_window_enlargement` supplies semialgebraic
  windows without changing this list or losing coverage. For `G` connected semisimple over `ℚ`, `Γ`
  arithmetic, `K` fixed and `M ⊂ K` compact, let `𝐏_1, …, 𝐏_k` represent the `Γ`-conjugacy
  classes of `ℚ`-parabolics. Prove that there are Siegel sets `𝔖_i = U_i × A_{𝐏_i,t_i} × W_i`
  associated to `𝐏_i` and the same `K` whose images cover `Γ\G/M` ([BKT], Proposition 2.7(1),
  p. 9; [BKT erratum], §1.1, p. 1). *Needs:* the preceding bullet; AA.3.2; AA.3.4.
- **Finite overlaps of Siegel sets.** `RealSiegel.finite_overlap` allows two
  parabolics and independently chosen positive thresholds, at the same K. For Siegel sets `𝔖_1, 𝔖_2` associated to the same `K`,
  prove that `{γ ∈ Γ : γ𝔖_1 ∩ 𝔖_2 ≠ ∅}` is finite, and that the same holds for the relatively
  compact closures of their unipotent and Levi factors ([BKT], Proposition 2.7(2), p. 9).
  *Needs:* AA.3.2; AA.3.3.
- **Deep Siegel sets of distinct parabolics are disjoint.**
  `RealSiegel.deep_distinct_disjoint` compares distinct Hopf ideals. For distinct `ℚ`-parabolics
  `𝐏_1 ≠ 𝐏_2` and fixed bounded `U_i`, `W_i` (one `K`), prove that the Siegel sets `𝔖_1, 𝔖_2` are
  disjoint once `t_1, t_2` are sufficiently large ([BKT], Proposition 2.7(5), p. 9). *Needs:*
  AA.3.2; ReductiveGroups, layer 7.
- **Inequivalent cusps separate.** `RealSiegel.inequivalent_cusps_separate`
  quantifies over the actual arithmetic image in the real identity component. If `𝐏_1` and `𝐏_2` are not `Γ`-conjugate, prove that for
  fixed `U_i`, `W_i` and all sufficiently large `t_1, t_2`, `γ𝔖_1 ∩ 𝔖_2 = ∅` for every `γ ∈ Γ`
  ([BKT], Proposition 2.7(3), p. 9). *Needs:* the preceding bullets; AA.3.2.
- **Deep self-intersections come from the parabolic.**
  `RealSiegel.deep_self_intersection` concludes membership in the original parabolic. For fixed `U`, `W` and sufficiently
  large `t`, prove that a Siegel set `𝔖` for `𝐏` and `K` satisfies `γ𝔖 ∩ 𝔖 = ∅` for every
  `γ ∈ Γ ∖ Γ_𝐏`, where `Γ_𝐏 = Γ ∩ 𝐏(ℚ)` ([BKT], Proposition 2.7(4), p. 9). *Needs:* the
  preceding bullets; AA.3.2.
- **Comparison of Siegel-set conventions.** Fix a triple compact `K`. For a standard
  rational parabolic `P` above its minimal `P₀`, relatively compact `U,W`, and `t>0`,
  `SiegelGeometry.general_horo_in_triple` puts the `HoroData` domain inside one triple
  domain. For `P=P₀`, `triple_horo_comparison` gives cofinality in both directions on
  the real identity component, with `K⁺=K∩G(ℝ)⁺` and changed positive thresholds.
  The converse is not asserted for a larger parabolic: for `P=G=SL₂` the domain from a bounded
  horospherical window cannot contain a noncompact minimal-parabolic domain.
  `fixed_minimal_comparison` puts any triple domain for `K` inside a single rational
  translate of one for another fixed minimal parabolic and the same `K`.
  [BKT], §2.2, p. 8; [Orr], §§2.2–2.3, pp. 6–7. *Needs:* AA.3.2; AA.3.1.

### 3.7 Subgroup containment and orbit maps

All groups in this subsection are connected reductive algebraic groups over `ℚ`;
real points may be disconnected. Names below lie in `SiegelGeometry`.

`Cartan B` specifies a faithful rational matrix representation `ρ`, a positive
real form `b`, and an involution with the equation
`ρ(θ(g))=b⁻¹ρ(g⁻¹)ᵀb`. Its compact subgroup is exactly `Fix(θ)` and is maximal
among compact subgroups. This inverse-adjoint realization imposes algebraic Cartan
compatibility, in addition to compactness. `cartan_exists` supplies such data for
a connected reductive group. The LieGroups roadmap's `CartanInvolution` instead
uses smooth manifolds and the Lie algebra; this carrier records the algebraic
realization needed for rational parabolics. [BHC], §§1.1, 1.6–1.9, pp. 486, 489–492.

**Checks.** `cartan_fixed` identifies the fixed subgroup; `cartan_gm` inverts every
point of the split one-dimensional torus; `cartan_sl2` identifies `K` with the
orthogonal matrices when the realizing form is the identity.

A `Triple B` consists of `Reduction.RelativeRootData`, its `MinimalParabolic P`,
a `Cartan B`, and `u∈N(ℝ)`. Its real split torus, positive component and norm-one
Levi factor are pinned by

```
S = u S₀(ℝ) u⁻¹,      θ(S)=S,      A=S⁰,
M = u {m∈Z_G(S₀)(ℝ) : |χ(m)|=1 for every rational Levi character χ} u⁻¹,
logA(a)(χ) = log |χ(u⁻¹au)|.
```

The equation for `S` also specifies its real algebraic group: base change the
rational split torus, then conjugate by the real point `u` on every real algebra.
`logA` takes values in the existing `RealCharacterSpace`. `triple_exists` supplies
a triple with a given Cartan compact and a given rational minimal parabolic.
`Triple.N` is the actual real unipotent radical; `Mplus=M⁰`; `windowGroup=N M⁺`.
[Orr], Lemma 2.1 and §2.2, pp. 6–7.

**Checks.** `triple_torus` makes `S=G_m(ℝ)` with no simple roots;
`triple_trivial` makes `A=N=1`; `triple_nontilted` excludes the tilted torus
when `K=SO₂`. `triple_cartan` also checks the defining stability equation. `factors_gm` gives `N=M⁺=1` and `NM⁺={1}`; `factors_trivial` makes that set
the whole one-point group; `factors_sl2` realizes `N={[[1,x],[0,1]]}`, `M⁺=1`,
and `NM⁺=N` for a standard `SL₂` triple.

A `Triple.Window` is a compact `Ω⊆NM⁺` together with `t>0`. The two set definitions
are `cone t={a∈A : exp(logA(a)(α))≥t for all simple α}` and
`domain W=Ω·cone(t)·K`. These use weak inequalities; the `HoroData` comparison
changes thresholds when passing to its strict inequalities. `mem_domain` is the
literal three-factor membership formula, and `domain_mono` enlarges the window
and lowers the threshold. [Orr], §2.2, p. 6.

**Checks.** `window_empty`, `window_identity`, `window_negative` allow the empty
and singleton-identity windows at `t=1`, and exclude `t=−1`.
`cone_torus`, `cone_wall`, `cone_above_wall` leave all central split directions
untruncated, include `1` at `t=1`, and exclude it at `t=2` when roots exist.
`domain_empty` gives an empty set; `domain_identity` includes `1` when `1∈Ω` and
`t≤1`; `domain_torus` gives `AK` when roots are absent and `Ω={1}`.

An `Embedding B H` is a surjective coordinate bialgebra map `B→H`, with point
map `e.points R`. `Embedding.Compatible TH TG` requires compact and torus
inclusion, `S_G∩H=S_H`, `N_H⊆N_G`, and a homomorphism
`res:X*(S_G)→X*(S_H)`. Its character equation is
`χ_G(u_G⁻¹e(u_H s u_H⁻¹)u_G)=res(χ_G)(s)` for every real split-torus point.
Thus restriction and the dual real-character-space map are fixed by the
algebraic embedding; they are not independent maps of abstract root systems.
[Orr], §§4.2–4.3, pp. 15–20; [Orr–Schnell], §§A,E.

**Checks.** `embedding_identity`, `embedding_faithful`, `embedding_trivial`
respectively give the identity on every coefficient algebra, injectivity of a
closed embedding on points, and the trivial image of the identity group.
`compatible_equal` has `H=G` and identity character restriction;
`compatible_zero_root` makes a vanishing restriction evaluate to `1`;
`compatible_torus` gives an empty root system for `H=G_m`.

For the rational-split intermediate statements below, `hQ:TH.u=1` chooses the
rational torus as the Cartan-stable lift. `compatible_parabolic` produces `Q`
with Levi `Z_G(S_H)`, `N_H⊆R_u(Q)`, and `P_G⊆Q`. `finite_root_cones` gives
finitely many real normalizer representatives and `0<t′≤1`, preserving the
required inclusions of `N_H` and `N_Z=N_G∩Z_G(S_H)`. In `weyl_representatives`,
the specified `u∈N_Z(ℝ)` sends `S_G` to `TG.roots.splitTorus`; a rational
normalizer point `n` gives `w_Q=u⁻¹nu`. The hypotheses require
`N_H,N_Z⊆w_Q N_G w_Q⁻¹`. The conclusions supply `w_K∈K_G`,
`w_Q⁻¹w_K∈Z_G(S_G)(ℝ)⁰`, and `n⁻¹w_Q∈N_G`.
`uniform_windows` takes a finite family of these representatives, including
their connected-centralizer condition, and gives a single ambient compact window
and compact `B_w⊆A_G` satisfying the inclusion below.

`OrbitMap H n` specifies a faithful algebraic representation into `SL_n`, with
the determinant equation on every coefficient algebra, a positive form `b₀`, and
a compatible `Cartan H`. It defines

```
value(g)=ρ(g⁻¹)ᵀ b₀ ρ(g⁻¹),      quotient(gK_H)=value(g).
```

`value_fiber` says that equality of values is exactly `g⁻¹h∈K_H`;
`quotient_mk` pins the quotient map. Its values have determinant `det(b₀)`.
`orbitMap_of_lie` constructs the carrier from the original Lie hypothesis:
for dual-number points with `ρ(g)=1+εX`, the tangent matrices are stable under
`X↦b₀⁻¹Xᵀb₀`. The negative sign in the Cartan differential is immaterial for a
linear subspace. The carrier theorem assumes connected reductivity, faithfulness,
the determinant equation and positive definiteness. [BKT], §4.5, pp. 17–18;
[BKT erratum], §1.5, p. 3.

**Checks.** `orbitMap_base` gives `value(1)=b₀`; `orbitMap_det` fixes its determinant;
`orbitMap_diagonal` evaluates the `G_m→SL₂` orbit as `diag(a⁻²,a²)` at
`diag(a,a⁻¹)` with `b₀=1`. `quotient_base`, `quotient_injective`,
`quotient_positive` give the base form, distinguish distinct compact cosets, and
exclude degenerate forms from the quotient image.

Three explicit Hopf ideals fix the failure cases on every coefficient algebra.
`tiltedTorus` in `SL₂` has points `[[x,x⁻¹−x],[0,x⁻¹]]`, for a unit `x`.
Its whole real point group is a triple domain (`tiltedTorus_siegel`), its compact
factor is `{±1}`, and its image in the upper half-plane is `(1−y)+iy`, `y>0`.
No finite union of rational translates of a Siegel set with compact `SO₂`
contains it. `nonsplitTorus` has points `[[a,2b],[b,a]]`, `a²−2b²=1`.
Its rational split torus is trivial, so it meets the torus-stability condition
while the standard ambient Cartan involution does not preserve the group.
[Orr–Schnell], Remark 2 and §B, pp. 1231–1233.

**Checks.** `tilted_identity`, `tilted_two`, `tilted_transpose` include `1` and
`[[2,−3/2],[0,1/2]]`, and exclude the transpose of the latter; `tilted_ray`
computes the upper half-plane ray. `nonsplit_identity`, `nonsplit_pell`,
`nonsplit_transpose` include `1` and `[[3,4],[2,3]]`, and exclude `[[3,2],[4,3]]`.

For the semisimple example, set
`η=[[3/2,0,−1/2],[0,1,0],[−1/2,0,3/2]]` and
`B=η[[0,0,1],[0,1,0],[1,0,0]]ηᵀ`.
`twistedOrthogonal` is the subgroup of `SL₃` cut out by `gBgᵀ=B` on every
coefficient algebra. `twistedOrthogonal_semisimple` and
`semisimple_compact_inclusion_counterexample` assert semisimplicity and a triple
with compact factor contained in `SO₃`, but with a domain escaping every finite
union of rational translates of any fixed-`SO₃` ambient triple domain.
`specialLinear_triple` supplies the standard orthogonal compact for every `SL_n`.
[Orr–Schnell], §C, pp. 1233–1234.

**Checks.** `twisted_identity` includes `1`; `twisted_two` includes
`η diag(2,1,1/2)η⁻¹=[[35/16,0,9/16],[0,1,0],[−9/16,0,5/16]]`;
`twisted_transpose` excludes its transpose; `twisted_gram` computes
`(ηᵀη)₁₃=−3/2`, the off-diagonal obstruction.

- **Compatible parabolic and torus for a subgroup.** `SiegelGeometry.Embedding.compatible_parabolic` and `compatible_exists`. (*containment-parabolic-torus*) For
  `H ⊂ G` reductive `ℚ`-groups, a Siegel triple `(P_H, S_H, K_H)` for `H` with `S_H` `ℚ`-split
  (the general case reduces to this by conjugating with an element of `R_u(P_H)(ℝ)`, Orr §4.1),
  and `K_G ⊂ G(ℝ)` maximal compact with `K_H ⊂ K_G` whose Cartan involution stabilises `S_H`,
  choose a parabolic `ℚ`-subgroup `Q ⊂ G` with Levi `Z_G(S_H)` and `N_H ⊂ R_u(Q)`, then a minimal
  `P_G ⊂ Q`. Prove that its Cartan-stable Siegel torus `S_G` contains `S_H`, satisfies
  `S_G ∩ H = S_H`, and `N_H ⊂ N_G` ([Orr], §4.2, Lemmas 4.2–4.6, pp. 15–17; [Orr–Schnell], §§A,E,
  pp. 1232, 1236). *Needs:* AA.3.1; AA.3.2; ReductiveGroups, layer 7.
- **Finite root-cone comparison.** `SiegelGeometry.Embedding.finite_root_cones`. (*containment-finite-root-cones*) In the notation and under
  the hypotheses of *containment-parabolic-torus* (`S_H` `ℚ`-split, `K_H ⊂ K_G`, Cartan
  involution of `K_G` stabilising `S_H`), with `Z = Z_G(S_H)`, `N_Z = R_u(P_G ∩ Z)` and `t > 0`,
  prove that there is `t′ ∈ (0, 1]` such that every `a ∈ A_{H,t}` belongs to `w A_{G,t′} w⁻¹` for
  some `w` in the finite Weyl group of `S_G` satisfying `N_H, N_Z ⊂ w N_G w⁻¹`. Roots of `S_G`
  vanishing on `S_H` take the value `1 ≥ t′` on `a`, so they impose no further condition ([Orr],
  §4.3, Proposition 4.7 and Lemmas 4.8–4.9, pp. 17–20; [Orr–Schnell], §§A,E, pp. 1232, 1236).
  *Needs:* AA.3.7; ReductiveGroups, layer 7.
- **Rational and compact Weyl representatives.** `SiegelGeometry.Embedding.weyl_representatives`. (*containment-weyl-representatives*) In the
  notation and under the hypotheses of *containment-finite-root-cones*, with `w` ranging over
  the finite set of Weyl elements of `S_G` with `N_H, N_Z ⊂ w N_G w⁻¹`, `u ∈ N_Z(ℝ)` with
  `u S_G u⁻¹` a maximal `ℚ`-split torus of `P_G ∩ Z`, and the maximal real split torus containing
  `S_G` chosen stable under the Cartan involution of `K_G`: for each admissible `w`, choose a
  compact representative `w_K ∈ K_G` and a representative `w_Q = u⁻¹ w′_Q u` with `w′_Q ∈ G(ℚ)`
  and `w′_Q⁻¹ w_Q ∈ N_G(ℝ)`, and prove that their quotient can be chosen in the identity component
  of `Z_G(S_G)(ℝ)` ([Orr], §4.4, Lemmas 4.10–4.11, pp. 20–21; [Orr–Schnell], §§A,E, pp. 1232,
  1236). *Needs:* AA.3.7; ReductiveGroups, layer 7; RepresentationTheory/LieGroups, layer 9.
- **Uniform compact factors for subgroup Siegel sets.** `SiegelGeometry.Embedding.uniform_windows`. In the notation and under the
  hypotheses of *containment-weyl-representatives*, with `Ω_H ⊂ N_H(ℝ) M_H(ℝ)^+` compact and
  `K_Z = K_G ∩ Z_G(S_H)(ℝ)` (maximal compact in `Z_G(S_H)(ℝ)` by the Cartan hypothesis), prove
  that one can choose a compact `Ω_G ⊂ N_G M_G` and, for every admissible `w`, a compact
  `B_w ⊂ S_G(ℝ)^0` such that `w′_Q⁻¹ Ω_H ⊂ Ω_G w_K⁻¹ B_w K_Z`; all these choices range over a
  finite Weyl set ([Orr], §4.5, Lemmas 4.12–4.13, pp. 21–22; [Orr–Schnell], §§A,E, pp. 1232,
  1236). *Needs:* AA.3.7; AA.3.2.
- **Containment of subgroup Siegel sets.** `SiegelGeometry.Embedding.containment`. (*orr-schnell-containment*) Let `𝐇 ⊂ 𝐆` be
  reductive `ℚ`-groups, `(𝐏_H, 𝐒_H, K_H)` a Siegel triple for `𝐇` and `𝔖_H = Ω A_t K_H` a Siegel
  set. Let `K_G ⊂ 𝐆(ℝ)` be maximal compact with `K_H ⊂ K_G` and whose Cartan involution
  `θ_{K_G}` stabilises `𝐒_H`. Prove that there are a Siegel triple `(𝐏_G, 𝐒_G, K_G)`, a Siegel
  set `𝔖_G` for it and a finite `C ⊂ 𝐆(ℚ)` with `𝔖_H ⊂ C·𝔖_G`; moreover `R_u(𝐏_H) ⊂ R_u(𝐏_G)` and
  `𝐒_H = 𝐒_G ∩ 𝐇` ([Orr–Schnell], Theorem 1, pp. 1231–1232; §§A,E; [Orr], §4.6, Proposition 4.14,
  pp. 22–23; [Orr], §4.1, p. 15). *Needs:* AA.3.7; AA.3.6.
- **Stability of the subgroup under the Cartan involution suffices.** `SiegelGeometry.Embedding.cartan_restrict` and `cartan_stability_converse_fails`. In the setting of
  *orr-schnell-containment* with `K_H ⊂ K_G`, prove that if the Cartan involution `Θ` of `𝐆` for
  `K_G` stabilises `𝐇`, then `Θ|_𝐇` is the Cartan involution of `𝐇` for `K_H` and `Θ` stabilises
  the torus `𝐒_H` of every Siegel triple, so the theorem applies. The converse fails for
  `𝐆 = SL_2`, `𝐇 = {(a, 2b; b, a) : a² − 2b² = 1}`,
  `K_G = SO_2(ℝ)`, `K_H={±1}`, `𝐒_H = {1}` ([BKT erratum], Proof of Theorem 1.2, p. 3; [Orr–Schnell],
  Remark 2, pp. 1231–1232). *Needs:* AA.3.7; RepresentationTheory/LieGroups, layer 9.
- **Intersecting Siegel sets with a subgroup.** `SiegelGeometry.Embedding.intersection`. Let `𝐇 ⊂ 𝐆` be reductive over `ℚ`,
  `K_H = K_G ∩ 𝐇(ℝ)` maximal compact, and assume every `K_H`-Siegel set lies in finitely many
  `𝐆(ℚ)`-translates of a `K_G`-Siegel set (the conclusion of *orr-schnell-containment*, taken as
  the forward-containment hypothesis). Prove that for every `K_G`-Siegel set `𝔖_G` there are a
  `K_H`-Siegel set `𝔖_H` and a finite `F ⊂ 𝐇(ℚ)` with `𝔖_G ∩ 𝐇(ℝ) ⊂ F 𝔖_H` ([BGST], §28,
  Proposition 28.1, pp. 14–15; [BKT erratum], §1.5, p. 3). *Needs:* AA.3.7; AA.3.6; AA.3.2.
- **Compact inclusion alone does not give Siegel containment.** `SiegelGeometry.compact_inclusion_counterexample`, `tiltedTorus_siegel` and `semisimple_compact_inclusion_counterexample`. Prove that there are
  inclusions of reductive (even semisimple) `ℚ`-groups `𝐇 ⊂ 𝐆` with `K_H ⊂ K_G` for which some
  `𝐇`-Siegel set is not covered by finitely many `𝐆(ℚ)`-translates of `K_G`-Siegel sets; the
  Cartan compatibility hypothesis of *orr-schnell-containment* cannot be removed ([Orr–Schnell],
  §§B–C, pp. 1232–1234). *Needs:* AA.3.7; AA.3.6.
- **Preimages of Siegel sets under orbit maps.** `SiegelGeometry.OrbitMap.preimage_siegel`. (*orbit-map-siegel-preimage*) Let `𝐇 ⊂ SL(V)`
  be reductive over `ℚ`, `x_0 ∈ X = SL(V_ℝ)/SO(b_0)` with `K_H = Stab_{𝐇(ℝ)}(x_0)` and the Cartan
  involution of `x_0` stabilising `Lie 𝐇`, and `ι : 𝐇(ℝ)/K_H → X` the orbit map. Prove that for
  every Siegel set `𝔖 ⊂ X`, `ι⁻¹(𝔖)` is contained in finitely many Siegel sets of `𝐇(ℝ)/K_H`
  associated to `K_H`. In the Gram realization, `preimage_siegel` fixes a rational
  ordered basis and `C>0` and covers its reduced-form preimage by finitely many
  `H(ℚ)`-translates of a single triple domain with this compact ([BKT], §4.5, pp. 17–18 (arXiv v2); JAMS pp. 932–933). *Needs:* AA.3.7; AA.3.2.
- **Images of Siegel sets under orbit maps.** `SiegelGeometry.OrbitMap.image_siegel`. In the setting of *orbit-map-siegel-preimage*,
  prove that every Siegel set of `𝐇(ℝ)/K_H` is mapped by `ι` into finitely many Siegel sets of
  `X`. In the Gram realization, `image_siegel` gives one `C>0` and finitely many rational
  ordered bases in which every image form is `C`-reduced ([BKT], §4.5, p. 18 (arXiv v2); JAMS p. 933). *Needs:* AA.3.7; AA.3.2; AA.3.6.

**Further carrier Checks.** Each label is an anonymous Lean `example`.

| Definition | Three discriminating Checks |
|---|---|
| `aP_decomp` | `decomp_identity`: equal parabolics give `(a,0)`; `decomp_kernel`: a relative vector gives `(0,a)`; `decomp_split`: a lifted quotient vector gives `(a,0)` |
| `infiniteDiagonal` | `infiniteDiagonal_one`: identity; `infiniteDiagonal_evaluation`: the actual scalar coordinate; `infiniteDiagonal_injective`: distinct rational points stay distinct |
| `Reduction.rightAct` | `rightAct_identity`: identity multiplier; `rightAct_order`: successive right multipliers occur in their original order; `rightAct_split`: nonzero logarithmic height moves the base coset |
| `IsUnipotentPoint` | `unipotent_one`: identity; `unipotent_shear`: `[[1,1],[0,1]]`; `unipotent_diagonal`: exclusion of `diag(2,1/2)` |
| `SArithmetic.projection`, `diagonalS` | `projection_one`: identity; `projection_empty`: unchanged infinite factor; `projection_selected`: exact value at every retained finite place |

The real regularity targets use `TauCeti.IsSemialgebraic`'s defining polynomial set
algebra, written out in finite matrix coordinates. `horo_identity`, `horo_compact`,
`horo_split` fix the smooth coordinate map; the empty-window and truncation-wall Checks
also apply to `siegelSet_semialgebraic`. `truncation_scale` fixes the corner chart at
root value two, and `corner_central_kernel` excludes the missing-character hypothesis.

**Checks for the horospherical logarithm.** `horo_identity` gives `aLog(1)=0`;
`aLog_product` gives `aLog(ab)=aLog(a)+aLog(b)`; `aLog_nontrivial` excludes zero
for every nonidentity positive split point, including a central torus direction.
These check `HoroData.aLog` itself, beyond its simple-root evaluations.

**Checks for coordinate and subgroup helpers.**

| Definition | Checks (Lean `example` labels) |
|---|---|
| `GeometricRoots.Cocharacter` | `cocharacter_zero`: zero degree; `cocharacter_double`: doubling doubles the pairing; `cocharacter_gm`: a primitive degree pairs to one. |
| `GeometricRoots.adjoint` | `adjoint_identity`: identity operator; `adjoint_torus`: torus action is trivial; `adjoint_gl2`: a nonzero root vector is doubled. |
| `StandardParabolic.leviInclusion` | `leviInclusion_identity`: equal parabolics; `leviInclusion_generator`: original quotient coordinates; `leviInclusion_surjective`: every smaller-Levi coordinate occurs. |
| `StandardParabolic.restrictToSplit` | `restrict_generator`: original torus coordinates; `restrict_surjective`: every torus function occurs; `restrict_proper`: a proper torus inclusion has nonzero kernel. |
| `StandardParabolic.rootCoordinates` | `rootCoordinates_zero`: zero; `rootCoordinates_character`: actual character value; `rootCoordinates_injective`: central directions survive. |
| `subgroupEmbed` | `subgroupEmbed_one`: identity; `subgroupEmbed_eval`: exact quotient evaluation; `subgroupEmbed_injective`: distinct subgroup points remain distinct. |
| `StandardParabolic.A` | `splitA_identity`: contains one; `splitA_finite`: finite projection is one; `splitA_recovery`: unique positive split-Levi preimage. |
| `ConnectedRealPoints` | `connected_trivial`: one point; `connected_gm`: negative component excluded; `connected_sl2`: all real SL₂ points included. |
| `realSubgroupEmbed` | `realEmbed_one`: identity; `realEmbed_eval`: exact quotient evaluation; `realEmbed_injective`: distinct real subgroup points remain distinct. |
| `realN`, `realA`, `realM`, `realMK` | `factors_trivial`: one-point factors; `factors_gm`: `N=M=1`, `A=G⁺`, `MK=K`; `factors_full_nochars`: at `P=G`, `N=A=1`, `M=G⁺`, `MK=G⁺`; `factors_proper`: nonempty simple roots force `N≠1`. |
| `levelArithmetic` | `level_full`: all rational points; `level_bottom`: only one; `level_identity`: exact finite diagonal membership. |

### Examples

`GL_3` has four standard parabolics, and the lower triangular Borel of `GL_2` is conjugate to the
standard one. `O(n) × ∏_p GL_n(ℤ_p)` is admissible for `GL_n/ℚ` while a product of Iwahori
subgroups is not. In `SL_2(ℝ)` the `A`-coordinate of `k = [[0, −1], [1, 0]]` changes from `1` to
`1/2` when `K` is conjugated by `n(1)`, and the Siegel sets of distinct `K` are not
interchangeable. `diag(4, 1)` is not `(std, 2)`-reduced while `diag(1, 4)` is, and
`reducedSet std 2` is not closed under inversion. For `SL_2/ℚ` the Siegel set with `N`-window
`[−1, 1]` and `y > 1/2` contains `1` and `n(1)`, so it is not a fundamental domain, and
`levelArithmetic (diag(p, 1)) GL_2(ℤ̂) ≠ GL_2(ℤ)`. The `GL_1` height for the standard character, augmented by its dual, has
`height x⁻¹ = height x` and is unbounded on `G(𝔸)` because of the archimedean factor. The
tilted split torus of `SL_2` shows that Cartan stability of the Siegel torus is not implied
by `K_H ⊂ K_G`; the norm-one torus of `ℚ(√2)` distinguishes stability of the split torus
from stability of the whole subgroup.

### Dependencies

Layers AA.1 and AA.2; Mathlib's modular-group fundamental domain; Tau Ceti's Cholesky lemmas and
dynamic parabolics; ReductiveGroups, layers 3, 6 and 7; ReductiveGroupsPartII, RG2.1, RG2.3 and
RG2.4; RepresentationTheory/LieGroups, layer 9; GlobalNumberFields, layer 6; the cusp theory of
AA.3.6 uses the adelic Siegel property of AA.3.4 and feeds the containment theorems of AA.3.7.

## Layer 4: approximation, neat levels and Hecke maps

Weak and strong approximation have different hypotheses and obstructions. Develop torsors and
arithmetic closure lemmas explicitly, then construct neat levels, actual topological level
quotients, stabilizer-aware fibre formulas and Hecke maps. The final abelian calculations isolate
quaternion norms and compact abelian Fourier limits.

### 4.1 Weak approximation and torsors

- **Weak approximation.** For an affine algebraic group `G` over `F` and a finite set `S` of
  places, define `Approximation.HasWeakApproximation G S : Prop := DenseRange (diagonal G(F) →
  G(F_S))`, weak approximation with respect to `S`, where `G(F_S) = ∏_{v∈S} G(F_v)`; `G` has weak
  approximation if this holds for every finite `S`. Prove `Approximation.HasWeakApproximation.mono`
  (weak approximation for `S` implies it for every `S′ ⊆ S`),
  `Approximation.HasWeakApproximation.prod` (weak approximation for `G` and `H` gives it for
  `G × H`) and `Approximation.HasWeakApproximation.of_iso` (invariance under isomorphisms of
  `F`-groups) ([HW], §1 (notation and conventions), p. 6). *Needs:* AA.1.2; Tau Ceti
  `TauCeti.GlobalNumberFields.weakApproximation_denseRange`.

  **Checks.**
  - `G_a` has weak approximation for every finite `S` (`weakApproximation_denseRange`).
  - `μ_2` over `ℚ` fails weak approximation for `S = {∞, 2}`: the diagonal image
    `{(1,1), (−1,−1)}` is not dense in `{±1}²`.
  - For the empty set of places, the target product is a point and every affine group has weak approximation (`hasWeakApproximation_empty`).

- **Weak approximation for GL_n, SL_n and split tori.** (*weak-approximation-gln*) Prove that
  `GL_n`, `SL_n`, `G_a` and split tori `G_m^r` over `F` have weak approximation (use field weak approximation on the open affine variety `GL_n`; use elementary matrices
  for `SL_n`, and products for split tori). The `SL₂` elementary-matrix calculation is
  [Rapinchuk], Lemma 1.2, p. 3; field weak approximation is supplied by the exact contract
  below. *Needs:* AA.4.1; Tau Ceti
  `TauCeti.GlobalNumberFields.weakApproximation_denseRange`; AA.1.4; GlobalNumberFields, layer 1.
- **Torsors under an affine group over a field.** For a field `k` and an affine algebraic group
  `G` over `k` (Hopf algebra `H`), define `Approximation.Torsor`, the structure of a `G`-torsor:
  a nonzero finitely generated commutative `k`-algebra `A` with a coaction `A → A ⊗ H` making
  `Spec A` a right `G`-space such that `A ⊗_k k̄ ≅ H ⊗_k k̄` as comodule algebras (the
  isomorphism is of comodule algebras; geometric points alone are insufficient for nonreduced
  group schemes); the structure holds the algebra, the coassociative counital coaction, and bijectivity of
  `A ⊗_k A → A ⊗_k H`, `a ⊗ b ↦ (a ⊗ 1)ρ(b)`. Nonzero algebras over a field are faithfully
  flat; this canonical-map condition is equivalent to the stated geometric trivialization. Define `Approximation.Torsor.IsTrivial`, `IsTrivial X : Prop := Nonempty
  (A →ₐ[k] k)` (that is, `X(k) ≠ ∅`), and `Approximation.Torsor.baseChange` along a field
  extension `k → k′`, with coordinate algebra `k′ ⊗_k A` (`Torsor.nonempty_baseChange_algEquiv`)
  and `Torsor.isTrivial_baseChange_iff`: `X_{k′}` is trivial iff `X` has a `k′`-valued point
  `A →ₐ[k] k′`. The Hasse principle below is stated through `baseChange`, so these equations
  carry its content: a `baseChange` returning the trivial torsor would make every torsor
  locally trivial. Prove `Approximation.Torsor.trivial_iff_iso`: `X` is trivial iff `X` is
  isomorphic to `G` acting on itself ([HW], Lemme 6.3, p. 22). *Needs:* Tau Ceti
  `TauCeti.HopfAlgebra.points`.

  **Coordinate/geometric comparison.** AA owns `Torsor.geometricEquivalence`
  between coordinate torsors (with equivariant algebra isomorphisms reversed)
  and geometric torsors for `Spec H` on the fppf site of `Spec k`.
  `geometricEquivalence_baseChange` compares tensor extension with the owner's
  `Torsor.baseChange`; `geometricEquivalence_sections` identifies algebra maps
  `A →ₐ[k] k` with sections and hence with `Torsor.trivial_iff_section`;
  `geometricEquivalence_iso` compares equivariant isomorphisms.
  `Torsor.classComparison` identifies coordinate isomorphism classes with
  `torsorClasses G = NonabelianH1 (fppfTopology.over (Spec k)) h_G`, preserving
  the distinguished class and base change. Affine fppf descent supplies
  representability ([Stacks], Tag 0245 for effective affine descent; Tags 04TY
  and 04SK for the geometric torsor and algebraic-space formulation; SchemeAndStackFoundations
  §§1.15, 2.3). The Lean `ClassComparison` contract expresses this class-set
  comparison; `baseChange_coaction`
  fixes the comodule presentation, and `ClassComparison.baseChangeMap_classOf`
  fixes scalar extension on classes. `baseChange_sections`, `baseChange_iso`,
  `iso_trivial_iff` and `ClassComparison.eq_base_iff` describe
  the coordinate compatibilities. `hasse_classSet` states the Hasse principle
  for an abstract class set with the comparison and local-class compatibility
  as hypotheses; specializing to `torsorClasses` gives the canonical statement.

  **Checks.**
  - `G` acting on itself is trivial.
  - `G_m` acting on `A¹` by scaling is not a torsor: `A¹(k̄)` has two orbits.
  - The algebra `ℚ[x]/(x² − 2)` with coaction `x ↦ x ⊗ g` is a nontrivial `μ₂`-torsor: a rational point would give a rational square root of `2` (`Torsor.mu2_sqrt`).
  - Its base change along `ℚ → ℚ` is still nontrivial and its base change along `ℚ → ℝ` is trivial
    (`Torsor.baseChange_self_nontrivial`); a `baseChange` returning `G_{k′}` fails the first clause.
  - Under `ClassComparison`, the square-root torsor has nontrivial class,
    its identity base change still has nontrivial class, and its real base
    change has the distinguished class (`torsorClasses_sqrtTwo_nontrivial`,
    `torsorClasses_sqrtTwo_identity`, `torsorClasses_sqrtTwo_real`).

- **Canonical μ₂ class and scalar extension.** The target `canonical_mu2_sqrtTwo`
  uses #779's `GroupSpace` associated to `Spec ℚ[ℤ/2]` and
  `torsorClasses G = SiteCohomology.NonabelianH1 (Scheme.fppfTopology.over (Spec ℚ))
  G.sheafOfGroups`. Its class is `torsorClasses.mk` of `Spec ℚ[t]/(t²−2)` with
  coaction `t ↦ t⊗g`; it is not the identity class. Pullback along the identity
  of `Spec ℚ` fixes this nontrivial class, while pullback along `Spec ℝ → Spec ℚ`
  gives the identity. Use geometric `Torsor.baseChange` and its section comparison,
  then `torsorClasses.mk_eq_one_iff`; coefficient `pushforward` is a different map.
  These are equalities in the canonical class set, independently of an arbitrary C.
  Source interfaces are [#779 §§1.15, 2.3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/94dae83ded2e18c604ce405d00e059692ea7673b/TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean).

  **Checks.** `canonical_mu2_rational_sections` excludes sections of this concrete
  affine torsor over ℚ; `canonical_mu2_identity_sections` does the same after identity
  scalar extension; `canonical_mu2_real_sections` constructs sections after extension
  to ℝ. The canonical `mk_eq_one_iff` turns these into exactly the three class assertions
  of `canonical_mu2_sqrtTwo`; the earlier `ClassComparison` examples remain transport tests.

- **Local H¹ vanishing.** For connected semisimple simply connected `G` over a
  characteristic-zero nonarchimedean local field, `Torsor.isTrivial_of_simplyConnected_local`
  asserts `H¹(E,G)=1`. The source is [PR94], Theorem 6.4, pp. 284–285, with proofs in
  §§6.7–6.8. Reduce by restriction of scalars and products to absolutely simple groups;
  construct twisting and central isogeny sequences, reduced norms and Hermitian-form
  invariants for classical types, and the exceptional-type arguments, including E₈.
  The quaternion norm-one case in [Khayutin], §2.3, is one specialization.
  *Needs:* AA.4.1 coordinate/geometric comparison; ReductiveGroups simple-factor structure;
  ClassFieldTheory local Brauer and norm theorems; GlobalQuadraticForms' form invariants.
- **Hasse kernel and injectivity.** Retain `Torsor.isTrivial_iff_forall_real` over number
  fields for semisimple simply connected `G`. [PR94], Theorem 6.6, p. 286 and §§6.7–6.8
  supplies the Hasse kernel; local vanishing removes finite places and algebraic
  closedness removes complex places. To compare *two* classes, twist by one torsor and
  apply the kernel theorem to the resulting simply connected inner form. The target
  `Torsor.iso_iff_forall_real` records that injectivity direction. Supply compatibility
  of twisting with base change and preservation of semisimple simply connected structure.
  `Torsor.hasse_classSet` only transports basepoint detection through an assumed
  `ClassComparison`; it does not prove full bijectivity or construct the canonical carrier.
- **Real-class realization.** `Torsor.real_classes_realized` realizes every family of real
  torsors by a global torsor. Use [PR94], Proposition 6.17, pp. 337–339: represent real
  classes in maximal tori, approximate those tori globally, then use real-localization
  surjectivity for tori (§7.3, Corollary 2). Combined with twisting injectivity this gives
  `torsorClasses.realLocalization_bijective` on #779's canonical fppf class set.
  The affine comparison uses #779's `torsorClasses.surjective_mk`,
  `torsorClasses.mk_eq_one_iff`, representability and natural base change.
- **Weak approximation.** `Approximation.hasWeakApproximation_of_simplyConnected` holds
  for every finite set of places. [PR94], Theorem 7.8, p. 415, proof in §7.3, uses
  reduction theory, local Kneser–Tits, the Hasse principle, and weak approximation for
  suitable tori. Build these inputs separately; strong approximation is not an input.
  A torsor trivial at real places has a global point by the kernel theorem; translation
  transfers weak approximation from `G`. This proves property (⋆) used by [HW],
  Theorem 6.1, p. 21. HW Lemma 6.3 only propagates that property through fibrations.
  The anisotropic-factor step of AA.4.2 consumes this weak-approximation theorem.

  **Checks.** `hasse_no_real_places` tests triviality over a totally imaginary number
  field; `hasse_two_classes` tests the twisting/injectivity direction;
  `real_classes_realized` tests the independent realization direction. The existing
  μ₂ examples test comparison and scalar extension only: μ₂ is not semisimple simply
  connected and cannot satisfy the Hasse-kernel conclusion.

### 4.2 Strong approximation and arithmetic closures

- **Strong approximation.** For an affine algebraic group `G` over `F` and a finite set `S` of
  places containing every archimedean place, write `S = ∞ ∪ S_f` and define `Approximation.HasStrongApproximation F H S_f : Prop := DenseRange (diagonal G(F) →
  G(𝔸^S))`, strong approximation with respect to `S`: `G(F)` is dense in `G(𝔸_F^S)`, the adelic
  points away from `S` (equivalently `G(F)G(F_S)` is dense in `G(𝔸_F)`). Prove
  `Approximation.HasStrongApproximation.mul_open` (for every open subgroup `U ⊂ G(𝔸^S)`,
  `G(𝔸^S) = G(F)U`), `Approximation.HasStrongApproximation.mono` (strong approximation for `S`
  implies it for `S′ ⊇ S`) and `Approximation.HasStrongApproximation.classNumber_one` (if it holds
  for `S` the archimedean places then `G(F)\G(𝔸_f)/U` is a point for every compact open `U`)
  ([Rapinchuk], §2.1, Definition, p. 7; restated in Theorem 2.3, p. 12; [Borel], §2.6, p. 13).
  *Needs:* AA.1.2; AA.0.3.

  **Checks.**
  - `G_a` over `F` has strong approximation for `S` the archimedean places (GlobalNumberFields
    layer 6).
  - `G_m` over `ℚ` fails for `S = {∞}`: `ℚ^× ∩ ℤ̂^× = {±1}`, so `ℚ^×` is discrete in `𝔸_f^×`
    (AA.1.3).
  - For `SL₂/ℚ` and `S = {∞}`, strong approximation holds (`hasStrongApproximation_sl2_rat`).

- **Strong approximation for unipotent groups.** Every unipotent group `N` over the
  number field `F` has dense rational points in `N(𝔸_F^S)` for every nonempty set `S`
  of places, with no requirement that `S` be finite or contain infinity
  ([Platonov–Rapinchuk–Rapinchuk], Lemma 5.7, pp. 301–302; Theorem 1.13, p. 15).
  `HasStrongApproximationAway` expresses this on the full adelic carrier as density
  of `N(F)N(F_S)`, with separate arbitrary sets of infinite and finite places.
  `hasStrongApproximationAway_of_unipotent` is the general signature;
  `hasStrongApproximationAway_univ_iff` identifies its `S = ∞ ∪ S_f` specialization
  with the retained `HasStrongApproximation` interface.
  **Check.** `G_a/ℚ` is dense away from `{2}` although infinity is retained; it is not
  dense in all adeles when `S` is empty, since the rational diagonal is discrete.
  These are `unipotent_away_finite_singleton` and `unipotent_away_empty`;
  `away_all` checks that the complementary space is a point when `S` is every place.
  *Needs:* AA.4.2; AA.0.3; GlobalNumberFields, layer 6; AA.3.4.
- **Tori never have strong approximation for finite S containing infinity.** For a nontrivial torus `T` over `F`
  and a finite set `S` of places containing all archimedean places, prove that `T(F)` is not dense in `T(𝔸^S)`, and that the
  quotient of `T(𝔸^S)` by the closure of `T(F)` has infinite exponent. Weak approximation for
  tori is asserted only for split tori (*weak-approximation-gln*) ([Rapinchuk], Proposition 2.1,
  p. 9). *Needs:* AA.4.2; AA.1.3; AA.1.4; Chebotarev, layer 10.
- **Closed subgroups of p-adic Lie groups.** Build the analytic structure on each closed
  subgroup `C` of a finite-dimensional `ℚ_p`-analytic Lie group `L`, with its induced
  topology, and prove that continuous homomorphisms of such groups are analytic
  ([Platonov–Rapinchuk–Rapinchuk], Theorem 3.12, p. 136). Identify `Lie(C)` as a
  `ℚ_p`-Lie subalgebra of `Lie(L)`, and prove that equality implies openness and
  zero Lie algebra implies discreteness, using local exponential charts. Construct
  compact open subgroups with a saturated integral `p`-valuation ([Schneider],
  Theorem 27.1, pp. 192–194); closed subgroups have finite rank by Exercise 26.2,
  p. 181, and acquire their analytic structure by Corollary 29.6, p. 205, and
  Theorem 29.8, pp. 206–208. This analytic input is work in AA.4.2.

  **Checks.** `ℤ_p ⊂ ℚ_p` has full Lie algebra and is open; `{0}` has zero Lie
  algebra and is discrete. For a proper finite extension `E/ℚ_p`, the closed subgroup
  `ℚ_p ⊂ (E,+)` has a one-dimensional `ℚ_p` Lie algebra, not an `E`-linear one.
  Thus neither closedness nor `E`-Zariski density supplies an `E`-analytic subgroup.

- **Closures of Zariski-dense subgroups are open.** Let `G` be connected absolutely almost
  simple over `ℚ_p`, and `Γ ⊂ G(ℚ_p)` a Zariski-dense nondiscrete subgroup. Prove that its
  closure is open in `G(ℚ_p)`, using the `p`-adic analytic closed-subgroup theorem. This
  statement does not extend to arbitrary `E/ℚ_p` with `E`-Zariski density alone ([Rapinchuk],
  Lemma 2.7, p. 16; more generally the Lie-ideal argument is
  [Platonov–Rapinchuk–Rapinchuk], Proposition 3.11, p. 136). *Needs:* AA.4.2,
  closed subgroups of p-adic Lie groups.
- **Borel density for S-arithmetic groups.** For `G` connected absolutely almost simple over
  `F` and `S` a finite set of places containing the archimedean ones with `G_S` noncompact,
  prove that the `S`-arithmetic group `G(𝒪_{F,S})` is infinite and Zariski dense in `G`
  ([Rapinchuk], Theorem 2.3, remark after it, p. 12). *Needs:* AA.3.4.
- **Open subgroups of finite covolume have finite index.** If `Δ` is an open subgroup of a
  locally compact group `H` such that `H/Δ` carries a nonzero finite `H`-invariant Radon measure,
  prove that `Δ` has finite index in `H` ([Rapinchuk], §2.6, p. 16). *Needs:* AA.2.2.
- **Strong approximation through finitely many places.** For `S` containing the archimedean
  places, prove that `G` has strong approximation with respect to `S` iff for every finite set
  `S₁` of places disjoint from `S`, the `S ∪ S₁`-arithmetic group `G(𝒪(S ∪ S₁))` is dense in
  `G_{S₁} = ∏_{v∈S₁} G(F_v)` ([Rapinchuk], §2.6, p. 16). *Needs:* AA.4.2; AA.1.5.
- **S-arithmetic groups are not discrete at an extra place.** For `F` a number field, `G`
  connected absolutely almost simple, `S` finite containing the archimedean places with `G_S`
  noncompact, and `S₁` finite, nonempty and disjoint from `S`, prove that the image of
  `G(𝒪(S ∪ S₁))` in `G_{S₁}` is not discrete and is infinite ([Rapinchuk], §2.6, p. 16). *Needs:*
  AA.3.4.
- **Finite covolume of a projection closure.** (*projection-finite-covolume*) Let `A` and `B`
  be second countable locally compact Hausdorff groups, `Γ ⊂ A × B` a lattice (a discrete
  subgroup with a nonzero finite `(A × B)`-invariant Radon measure on `Γ\(A × B)`), and `Δ` the
  closure of its `B`-projection; `B` acts on `Γ\(A × B)` and on `Δ\B` by right translation in the
  second factor. Prove that `Δ\B` carries a nonzero finite `B`-invariant Radon measure
  (push forward the finite quotient measure; [Platonov–Rapinchuk–Rapinchuk],
  Lemma 3.66, pp. 191–192, uses this construction with extra assumptions
  for its nondiscreteness conclusion). *Needs:* AA.2.2.
- **Lie algebra of an arithmetic closure over ℚ.** For `G` connected absolutely almost
  simple over `ℚ`, `S` finite containing infinity with `G(ℚ_S)` noncompact, and a finite
  nonempty set `S₁` of rational primes disjoint from `S`, the closure of
  `G(ℤ[S⁻¹, S₁⁻¹])` in `∏_{p∈S₁} G(ℚ_p)` has full `ℚ_p` Lie algebra in each factor.
  Borel density makes each projected Lie algebra an ideal, and nondiscreteness makes it
  nonzero. Distinct primes are separated by the pro-`p` subgroups of compact opens
  ([Platonov], Proposition 3.2, pp. 1144–1145; [Rapinchuk], Lemma 2.7, p. 16 and §3,
  pp. 17–18). *Needs:* AA.3.4; AA.4.2, closed subgroups of p-adic Lie groups.

- **Number-field arithmetic closure.** (*number-field-arithmetic-closure*)
  For a number field `F`, connected absolutely almost simple `G/F`, finite `S`
  containing infinity with `G_S` noncompact, and finite `S₁` disjoint from `S`,
  let `Δ` be the closure of `G(𝒪_{F,S∪S₁})` in `∏_{v∈S₁} G(F_v)`.
  Prove `Approximation.arithmeticClosure_lie_full`: for every rational prime
  `p`, the Lie algebra of the projection closure in
  `∏_{v∈S₁,v|p} Res_{F_v/ℚ_p} G(F_v)` is the entire product as a `ℚ_p` Lie
  algebra. First establish `arithmetic_zariskiDense_restriction`: the given
  S-arithmetic subgroup is ℚ-Zariski dense in `Res_{F/ℚ} G`, including when S
  contains only some places over a rational prime. Prove `arithmeticClosure_open` and `arithmeticClosure_finiteIndex`.
  Establish density by a commensurator argument, extending the proof of [PR94],
  §4.4, pp. 205–206. Put `R=Res_{F/ℚ}G`, which is ℚ-simple, and let `Γ` be the
  actual partial-place arithmetic group. Reduction theory and `G_S` noncompact
  make `Γ` infinite. The target `arithmetic_commensurated` says that every element
  of `G(F)=R(ℚ)` commensurates `Γ`: outside the chosen places, conjugation changes
  only finitely many integral compact opens, whose intersections have finite index.
  Thus the identity component `J` of the ℚ-Zariski closure of `Γ` is positive
  dimensional and normalized by `R(ℚ)`. Rational-point Zariski density in connected
  groups ([PR94], Theorem 2.2) makes `J` normal in `R`; ℚ-simplicity gives `J=R`.
  This proves `arithmetic_zariskiDense_restriction` without enlarging S or asserting
  finite index in a rational-prime-saturated group.
  After base change to ℚ_p, the algebraic stabilizer of the closure Lie algebra
  contains Γ, so it contains the whole restricted group, including every factor
  over p. Project to the factors in S₁; the Lie algebra is an ideal in that entire
  product. Each restricted simple
  factor is ℚ_p-simple (after algebraic closure its simple factors are
  transitively permuted by the local Galois group); nondiscreteness at each
  place makes every projected ideal nonzero. Ideals in a direct sum of simple
  Lie algebras are sums of factors, excluding diagonal graphs even when two
  places lie over the same `p`. Separate distinct primes using compact
  pro-`p` subgroups, then use the finite-covolume theorem.
  This extends the ideal argument of [Rapinchuk], Lemma 2.7, p. 16 and §3,
  pp. 17–18, with the scalar-restriction decomposition of AA.1.4; it does not
  infer openness from factorwise surjectivity alone.
  *Needs:* `arithmetic_commensurated`, infinitude from reduction theory,
  rational-point Zariski density and ℚ-simplicity of the restriction; local restriction of
  scalars, closed-subgroup Lie theory, extra-place nondiscreteness,
  *projection-finite-covolume*.

  **Checks.** Two distinct places of `F` over the same `p` are both present in
  `arithmeticClosure_same_prime`; the diagonal Lie subalgebra in two copies
  of `sl₂(ℚ_p)` surjects to each factor but is not an ideal
  (`arithmeticClosure_diagonal_not_ideal`).
  `arithmeticClosure_mixed_prime` puts one of two places over p in S and the other
  in S₁. For `F=ℚ(√2)`, write `π=3+√2`, `π′=3−√2`: `ππ′=7`.
  The Check `arithmetic_partial_seven` gives pairwise distinct additive cosets of
  `π′^(−n)` modulo `𝒪_F[1/π]`. The corresponding upper-unipotent matrices give
  infinitely many cosets of `SL₂(𝒪_F[1/π])` in `SL₂(𝒪_F[1/7])`.
  This rules out transferring density by finite index from the saturated group.


- **Openness in a finite product of rational completions.** Under the preceding hypotheses,
  the arithmetic closure is open in `∏_{p∈S₁} G(ℚ_p)` and has finite index, by its finite
  covolume ([Platonov], Propositions 3.2–3.3, pp. 1144–1145).
  *Needs:* AA.4.2; *projection-finite-covolume*.
- **Anisotropic factors from weak approximation.** For `G/F` connected absolutely almost
  simple and simply connected over any number field, `S` finite containing infinity
  with `G(F_S)` noncompact, let `T` be the finite set of anisotropic finite places outside `S`. Once the closure of
  `G(F)G(F_S)` contains each isotropic local factor, closedness and density of the
  finite-support subgroup show that it contains the whole adelic factor away from `T`.
  Weak approximation makes its projection to `∏_{v∈T} G(F_v)` dense. Apply
  `Approximation.eq_top_of_contains_factor_dense_projection`: for groups `A, B` with
  topologies and a closed subgroup `C ≤ A × B`, if `A × {1} ⊆ C` and the projection of
  `C` to `B` is dense, then `C = A × B`. Thus the adelic closure is the whole group
  ([Platonov addendum], §§1–2, pp. 784–785, with the preceding number-field
  closure argument). *Needs:* AA.4.1 `hasWeakApproximation_of_simplyConnected`; AA.4.2;
  ReductiveGroupsPartII, RG2.4 (kneser-tits-local).
- **Arithmetic closure at one isotropic place.** Let `F` be any number field, `G` connected,
  absolutely almost simple and simply connected over `F`, `S` finite, containing the archimedean
  places, with `G_S` noncompact, `v ∉ S` a finite place at which `G` is `F_v`-isotropic, and
  `W ⊂ G(𝔸_F^{S∪{v}})` a compact open subgroup. Prove that the image of
  `Γ_W = G(F) ∩ (G_S × G(F_v) × W)` is dense in `G(F_v)`; consequently the closure of `G(F)G_S` in
  `G(𝔸_F)` contains `G(F_v)`, placed at `v` ([Platonov], §3.4, p. 1145; [Rapinchuk], §2.6, pp. 16–17; [Rapinchuk], Remark 1
  after Theorem 2.3, p. 12). *Needs:* AA.3.4; AA.4.2; ReductiveGroupsPartII, RG2.4
  (kneser-tits-local); `arithmeticClosure_open` over F. For each compact-open
  condition W, its arithmetic subgroup is commensurable with the partial-S group.
  Apply the whole-product Lie-ideal argument before local Kneser–Tits; separate
  rational primes with pro-p subgroups. No saturation of S is used.
- **Almost all local factors are isotropic.** (*isotropic-almost-everywhere*) For `F` a number
  field and `G` a connected semisimple group over `F` with `dim G > 0`, prove that `G` is
  quasi-split, hence isotropic, over `F_v` for all but finitely many places `v`; in particular,
  for finite `S` the set of places `v ∉ S` at which `G` is `F_v`-anisotropic is finite ([Arthur],
  §16, p. 89). *Needs:* AA.1.1 `IntegralModel.exists_reductive`;
  ReductiveGroupsPartII, RG2.3, reductive-model (over the complete discrete valuation ring
  `𝒪_v` with finite residue field, a reductive model gives an unramified, hence quasi-split group);
  ReductiveGroups, layer 7.
- **Strong approximation: sufficiency.** (*strong-approximation-sufficiency*) Let `G` be
  connected, absolutely almost simple and simply connected over a number field `F`, and `S` a
  finite set of places containing the archimedean ones with `G_S = ∏_{v∈S} G(F_v)` noncompact.
  Prove that `G` has strong approximation with respect to `S` ([Rapinchuk], Theorem 2.3, p. 12;
  [Rapinchuk], Remark 1 after Theorem 2.3, p. 12). *Needs:* AA.4.2; AA.4.1.
- **Strong approximation: necessity.** For `G` connected absolutely almost simple over `F` and
  `S` finite containing all archimedean places, in the setting of *strong-approximation-sufficiency* without its hypotheses, prove
  that if `G` has strong approximation with respect to `S` then `G_S` is noncompact and `G` is
  simply connected ([Rapinchuk], §2.3, p. 11). *Needs:* AA.4.2; AA.1.3; Chebotarev, layer 10; Tau
  Ceti `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`.
- **Strong approximation for semisimple groups.** Let `G` be connected semisimple simply
  connected over `F` and `S ⊇` archimedean places finite such that `G′(F_S)` is noncompact for
  every `F`-simple factor `G′` of `G`. Prove that `G(𝔸_F) = G(F)·G(F_S)·U` for every compact open
  `U ⊂ G(𝔸_F^S)`; in particular `G(F)\G(𝔸_f)/U` is a single point when `S` is the set of
  archimedean places ([Arthur], Theorem 2.1(a), p. 12). *Needs:* AA.4.2; AA.1.4; ReductiveGroups,
  layer 6.

### 4.3 Neat elements and levels

- **Eigenvalues of algebraic tensor subquotients.** For `k` a field of characteristic `0` with
  algebraic closure `k̄`, `G` an affine group scheme of finite type over `k`, `ρ : G → GL(V)` a
  closed immersion (a closed faithful algebraic representation), `σ : G → GL(W)` an algebraic
  representation and `g ∈ G(k)`, prove that every eigenvalue of `σ(g)` over `k̄` lies in the
  multiplicative subgroup generated by the eigenvalues of `ρ(g)` ([Milne], §3, p. 34). *Needs:*
  ReductiveGroups, layer 1.
- **Neat elements.** For a number field `F` with a fixed embedding `τ : F → ℂ` and a linear
  algebraic group `G`, define `Neat.IsNeatAut α : Prop` for `α ∈ GL(V)`, `V` over a subfield of
  `ℂ`: `α` is neat if its eigenvalues in `ℂ` generate a torsion-free subgroup of `ℂ^×`; and
  `Neat.IsNeat g : Prop` for `g ∈ G(F)`: `g` is neat if `ρ(g)` is neat for one faithful
  `F`-representation `ρ`, via a chosen faithful representation; `Neat.IsNeatSubgroup` is a
  subgroup all of whose elements are neat. The notion does not depend on `τ`, since an
  automorphism of `ℂ` carries one eigenvalue group isomorphically onto the other. It is weaker
  than neatness of `g` as an element of `(Res_{F/ℚ}G)(ℚ)`, whose eigenvalues include all Galois
  conjugates: `√2 ∈ G_m(ℚ(√2))` is neat, but `±√2` generate a group containing `−1`. The group
  representation is algebraic and faithful, rather than merely injective as a map on
  `F`-rational points; in Hopf coordinates it is induced by a surjective `GL_n`-coordinate
  morphism `O(GL_n) → O(G)`. Define `Neat.algebraicPointMap` (for a `GL_n` coordinate bialgebra
  morphism `r : O(GL_n) → O(G)` and an embedding `F → ℂ`, evaluate `r` on `F`-points through Tau
  Ceti `GeneralLinear.pointsMulEquiv` and extend matrix entries to `ℂ`), `Neat.IsAlgebraicPointHom`
  (the point homomorphism is induced by such an algebraic coordinate morphism, using the
  specified coefficient embedding) and `Neat.IsFaithfulAlgebraicPointHom` (the point
  homomorphism is induced by a surjective coordinate morphism, hence a closed algebraic
  immersion; this is stronger than injectivity on rational points). Prove `Neat.IsNeat.pow` (if
  `g` is neat then so is `g^n`) and `Neat.IsNeat.torsion_eq_one` (a neat element of finite order
  is `1`) ([Milne], §3, p. 34). *Needs:* AA.1.3.

  **Checks.**
  - `diag(2, 1/2) ∈ SL_2(ℚ)` is neat.
  - The order-`3` element `(0 −1; 1 −1)` of `SL_2(ℤ)` is not neat.
  - Nor is a torsion-free element whose eigenvalue group contains `ζ_3`, such as
    `(0 −1; 1 1)·(scalar 2)` in `GL_2(ℚ)`.
- **Neatness does not depend on the representation.** For a finite-type linear algebraic group
  `G` over the number field `F`, `ρ` a faithful algebraic representation (a closed immersion),
  `σ` an algebraic representation defined over a subfield of `ℂ`, and the compared complex point
  actions using the same embedding `F → ℂ`, prove that if `ρ(g)` is neat then `σ(g)` is neat.
  Arbitrary homomorphisms of the abstract rational-point group are excluded ([Milne], §3,
  p. 34). *Needs:* AA.4.3.
- **Neatness is stable under subgroups, conjugation and homomorphisms.** For `G, G′` linear
  algebraic over `F`, prove that subgroups of neat subgroups are neat, that conjugates of neat
  subgroups by elements of `G(F)` are neat, and that for a homomorphism `φ : G → G′` of linear
  algebraic groups the image `φ(Γ)` of a neat subgroup `Γ` is neat ([Milne], §3, p. 34). *Needs:*
  AA.4.3.
- **Neat groups are torsion free.** For `G` linear algebraic, prove that a neat subgroup of
  `G(F)` is torsion free ([Milne], §3, p. 34). *Needs:* AA.4.3.
- **Neat compact open levels.** For `G` linear algebraic over `F`, define
  `Neat.IsNeatLevel U : Prop := ∀ x, IsNeatSubgroup (levelArithmetic x U)`: a compact open
  subgroup `U ⊂ G(𝔸_{F,f})` is neat if `G(F) ∩ x U x⁻¹` is neat for every `x ∈ G(𝔸_{F,f})`
  (convention: all rational intersections, not every element of `U`). Prove
  `Neat.IsNeatLevel.mono` (a compact open subgroup of a neat level is neat),
  `Neat.IsNeatLevel.conj` (conjugates of neat levels are neat) and `Neat.IsNeatLevel.torsionFree`
  (all `levelArithmetic x U` are torsion free) ([Milne], §5, p. 58). *Needs:* AA.4.3; AA.3.4.

  **Checks.**
  - The level `U(3) ⊂ GL_2(ℤ̂)` is neat: every `GL_2(ℚ) ∩ xU(3)x⁻¹` (`x ∈ GL_2(𝔸_f)`) is neat by
    *neat-criterion-one-prime* at `p = 3`.
  - For `x = 1` this group is `Γ(3) = SL_2(ℤ) ∩ U(3)`, since a determinant in `{±1}` congruent to
    `1` mod `3` equals `1`.
  - `GL_2(ℤ̂)` is not neat: it contains `−1 ∈ GL_2(ℤ)`.
- **Stable lattices for compact p-adic matrix groups.** For a prime `p`, `n ≥ 1` and a compact
  subgroup `C ⊂ GL_n(ℚ_p)`, prove that `C` preserves a full `ℤ_p`-lattice `Λ ⊂ ℚ_p^n`, hence is
  conjugate into `GL_n(ℤ_p)` ([Milne], Proposition 3.5, p. 34). *Needs:* AA.1.5.
- **Distance of p-adic roots of unity from one.** For a prime `p`, `ℚ̄_p` an algebraic closure
  of `ℚ_p` with the unique extension of `|·|_p`, and `ζ ∈ ℚ̄_p` a root of unity with `ζ ≠ 1`,
  prove `|ζ − 1|_p ≥ p^{−1/(p−1)}`; more precisely a primitive `p^k`-th root has distance
  `p^{−1/(p^{k−1}(p−1))}`, while a root of order prime to `p` has distance one ([Milne],
  Proposition 3.5, p. 34). *Needs:* LocalFieldsRamification, layer 0.
- **Eigenvalue bound for congruence matrices.** For a prime `p`, `a ≥ 1` and
  `M ∈ 1 + p^a M_n(ℤ_p)`, with eigenvalues taken in `ℚ̄_p` with the extended absolute value, prove
  that every eigenvalue `λ` of `M` satisfies `|λ − 1|_p ≤ p^{−a}`; the eigenvalues and their
  inverses then lie in the multiplicative open ball used by *padic-ball-torsion-free* when
  `p ≥ 3, a ≥ 1` or `p = 2, a ≥ 2` ([Milne], Proposition 3.5, p. 34). *Needs:* AA.4.3.
- **Principal units of small radius are torsion free.** (*padic-ball-torsion-free*) For a prime
  `p`, prove that in an algebraic closure of `ℚ_p` the multiplicative group
  `{λ : |λ − 1|_p < p^{−1/(p−1)}}` contains no root of unity other than `1`; in particular
  eigenvalues of elements of `1 + pM_n(ℤ_p)` (`p ≥ 3`) or `1 + 4M_n(ℤ_2)` generate a torsion-free
  group ([Milne], Proposition 3.5, p. 34). *Needs:* AA.4.3.
- **A one-prime criterion for neatness.** (*neat-criterion-one-prime*) Let `ρ : G ↪ GL_n` be a
  faithful algebraic representation over the number field `F` and `U ⊂ G(𝔸_{F,f})` compact.
  Prove that if, at one place `v` above a prime `p`, every element of `U` acts through `ρ` in
  `1 + p^e M_n(𝒪_v)` with `e ≥ 1` for `p ≥ 3` and `e ≥ 2` for `p = 2`, then `U` is neat
  (`Neat.isNeatLevel_of_congruence`; over `ℚ` this is the condition `1 + pM_n(ℤ_p)`, resp.
  `1 + 4M_n(ℤ_2)`) ([Milne], Proposition 3.5, p. 34). The congruence is modulo the rational prime
  power, not modulo a power of a uniformizer of `F_v`: eigenvalues `λ` then satisfy
  `|λ − 1|_p ≤ p^{−e} < p^{−1/(p−1)}` whatever the ramification of `v`. *Needs:* AA.4.3; AA.1.5.

  **Checks.**
  - Modulo `2` alone the criterion fails: `−1 = 1 + 2·(−1)` lies in `K(2)` and is a nontrivial
    torsion element, whereas `−1 ∉ 1 + 4ℤ` (`congruence_two_needs_four`).
- **Neat levels exist.** For `G` linear algebraic over `F`, prove that every compact open
  `U ⊂ G(𝔸_{F,f})` contains a neat normal open subgroup of finite index, and that every
  arithmetic subgroup of `G(F)` contains a neat subgroup of finite index defined by congruence
  conditions (Borel) ([Milne], Proposition 3.5, p. 34). *Needs:* AA.4.3; AA.1.5.

### 4.4 Double cosets and level topology

- **Nested-level map on double cosets.** For a group `G` and subgroups `H, K′ ≤ K ≤ G`, define
  `LevelMaps.levelMap H hK : DoubleCoset.Quotient H K′ → DoubleCoset.Quotient H K`,
  `π : H\G/K′ → H\G/K`, `[g] ↦ [g]`, and `LevelMaps.fibreSurj g : K ⧸ K′.subgroupOf K →
  levelMap ⁻¹' {mk g}`, `kK′ ↦ mk (g k)`. Prove `LevelMaps.levelMap_mk` (`levelMap (mk g) = mk g`),
  `LevelMaps.levelMap_surjective`, that `fibreSurj g` is surjective for each `g`, and
  `LevelMaps.levelMap_comp` (`levelMap` for `K″ ≤ K′ ≤ K` composes); no normality is assumed
  ([LT], §3.2, (15), p. 11). *Needs:* Mathlib `DoubleCoset.Quotient`, `DoubleCoset.eq`.

  **Checks.**
  - For `K′ = K`, `levelMap` is the identity.
  - For `H = G` and `[K : K′] = 2` there is one fine class, so the fibre size `1` is not the
    index `2`.
  - For `H = 1`, the fibre has exactly `[K : K′]` elements (`levelMap_trivial_H`), unlike the `H = G` case above.

  - In `S₃`, with `H = K′ = 1`, `K = S₃`, `g = (01)` and `k = (12)`,
    `fibreSurj` takes `[k]` to `[gk]`; `(gk)(0) = 1` whereas `(kg)(0) = 2`
    (`fibreSurj_noncommutative`).

- **Finite-index bound for level changes.** For `K′ ≤ K` of finite index `N`, prove that every
  fibre of `H\G/K′ → H\G/K` has at most `N` elements, and that if `H\G/K` is finite of
  cardinality `h` then `H\G/K′` is finite of cardinality at most `Nh`
  (`LevelMaps.card_le_index_mul`, whose conclusion states finiteness as well as the bound). No
  normality, freeness or neatness is assumed ([LT], §3.2.3, p. 16). *Needs:* AA.4.4.

  **Checks.**
  - `Nat.card ℤ = 0`, so `Nat.card X ≤ Nh` holds for every infinite `X`; the bound alone does not
    give finiteness (`card_le_index_mul_needs_finite`).
- **Conjugate levels give equivalent double-coset sets.** For a group `G`, `H, K ≤ G` and
  `a ∈ G`, prove that `[g] ↦ [ga]` is a bijection `H\G/(aKa⁻¹) ≃ H\G/K` with inverse
  `[x] ↦ [xa⁻¹]`; `a` need not normalize `H` ([LT], §3.2, pp. 11–16 (conjugate lattice
  stabilizers; the abstract bijection is a direct double-coset calculation)). *Needs:* Mathlib
  `DoubleCoset.eq`, `DoubleCoset.Quotient`.
  **Checks.**
  - For `a = 1`, the representative is unchanged (`conjLevelEquiv_identity`).
  - In `S₃`, `g = (01)`, `a = (12)` gives `(ga)(0) = 1`, whereas `(ag)(0) = 2`;
    `conjLevelEquiv` uses the former (`conjLevelEquiv_noncommutative`).
  - With `g = (01)` and `a = (01)(12)`, `(ga)(0) = 0`, whereas `(ga⁻¹)(0) = 2`;
    the forward map uses `a` (`conjLevelEquiv_inverse_direction`).

- **Index of product subgroups with finite exceptional support.** For groups `H_v` with
  subgroups `S_v ≤ H_v` equal to `H_v` outside a finite set `B` and of finite index for `v ∈ B`,
  prove `(∏ H_v)/(∏ S_v) ≃ ∏_{v∈B} H_v/S_v` and `[∏ H_v : ∏ S_v] = ∏_{v∈B} [H_v : S_v]`; in
  particular for compact open product levels in `G(𝔸_f)`, `[∏ K_v : ∏ K′_v] = ∏_v [K_v : K′_v]`
  ([LT], §3.2.1, (20), p. 14). For a finite index set this is Mathlib `Subgroup.index_pi`;
  `LevelMaps.relIndex_pi` is the variant for an arbitrary index set with finite exceptional
  support. *Needs:* AA.1.5; Mathlib `Subgroup.index_prod`, `Subgroup.index_pi`.
- **Level quotients.** For a connected reductive group `G` over `F`, compact open
  `U ⊂ G(𝔸_{F,f})` and a closed subgroup `K_∞ ⊂ G(F_∞)` (for example a maximal compact subgroup
  times `A_G(ℝ)^0`, or trivial), define `LevelMaps.LevelQuotient U K∞ : Type`, the level
  quotient `X_U = G(F)\G(𝔸_F)/K_∞U` with the quotient topology, with `LevelMaps.LevelQuotient.mk`
  the projection `G(𝔸) → LevelQuotient U K∞`, and `LevelMaps.LevelQuotient.rightTranslate g :
  LevelQuotient (g U g⁻¹) K∞ ≃ₜ LevelQuotient U K∞`, the right action of `G(𝔸_f)` by Hecke
  translation `X_{gUg⁻¹} ≃ X_U`, `[x] ↦ [xg]`. Prove `LevelMaps.LevelQuotient.mk_rational`
  (`mk (diagonal γ * x) = mk x`) ([Milne], §5, footnote 40, p. 57). *Needs:* AA.3.4; AA.1.2.

  **Checks.**
  - For `GL_1/ℚ`, `U = ℤ̂^×` (the maximal compact open subgroup) and `K∞ = ℝ^×`,
    `LevelQuotient` is a point.
  - For `SL_2/ℚ` with `K∞ = 1` and `U = SL_2(ℤ̂)`, `LevelQuotient` is `SL_2(ℤ)\SL_2(ℝ)` (strong
    approximation), not the one-point set `SL_2(ℚ)\SL_2(𝔸_f)/U`.
  - For `GL₁/ℚ`, `U = ℤ̂^×`, `K∞ = ℝ^×`, the quotient is one point
    (`LevelQuotient.gl1_rat`).

- **Compact kernel of height on an archimedean level.** (*compact-kernel-split-centre*) For
  connected reductive `G/F`, let `K∞ ⊂ G(F_∞)` be closed, contain `A_G(ℝ)^0`, and be compact
  modulo it. Prove that `K∞ ∩ ker H_{G,∞}` is compact, and that multiplication gives
  `K∞ ≃ A_G(ℝ)^0 × (K∞ ∩ ker H_{G,∞})` ([Arthur], §2, pp. 13–15). *Needs:* AA.2.1.
- **Finite full rational stabilizers.** (*rational-stabilizer-finite*) For `F` a number field,
  `G` connected reductive over `F`, `K∞ ⊂ G(F_∞)` closed, containing `A_G(ℝ)^0` and compact modulo
  it (*compact-kernel-split-centre*), `U ⊂ G(𝔸_{F,f})` compact open and `g ∈ G(𝔸_F)`, prove that
  `A_x = G(F) ∩ gK∞Ug⁻¹` is finite. Here `A_x` is the full stabilizer, before division by any
  rational central subgroup ([Arthur], §1, pp. 7–8; §2, pp. 13–15). *Needs:* AA.4.4; AA.1.3;
  AA.2.1; AA.1.2.
- **Proper arithmetic action on the level space.** For `F` a number field, `G` connected
  reductive over `F`, `K∞ ⊂ G(F_∞)` closed, containing `A_G(ℝ)^0` and compact modulo it,
  `U ⊂ G(𝔸_{F,f})` compact open, and `G(F)` acting on `G(𝔸)/K∞U` by left multiplication, prove
  under *rational-stabilizer-finite* that the discrete group `G(F)` acts properly
  discontinuously on `G(𝔸)/K∞U` with its canonical quotient topology: for compact `C, D` only
  finitely many `γ` satisfy `γC ∩ D ≠ ∅` ([Arthur], §1, pp. 7–8). *Needs:* AA.4.4; AA.2.2; AA.2.1;
  AA.1.3.
- **Level quotients are Hausdorff.** For compact open `U` and `K_∞` containing `A_G(ℝ)^0` and
  compact modulo it, prove that the level quotient `X_U` is Hausdorff and locally compact, and
  that `G(F)` acts properly discontinuously on `G(𝔸)/K_∞U` ([Milne], Lemma 5.13, p. 57). *Needs:*
  AA.4.4; AA.2.2; Mathlib `ProperlyDiscontinuousSMul`, `isOpenMap_quotient_mk'_mul`.
- **Free action of finite level groups at neat level.** For neat compact open `U`, normal open
  `U′ ⊂ U`, and `K∞` containing `A_G(ℝ)^0` and compact modulo it, prove that the full group
  `U/U′` acts freely and properly discontinuously on `X_{U′}`. Rational stabilizers are finite,
  and neatness makes them trivial; the central rational kernel is trivial in this scope
  ([Milne], §5, p. 58). *Needs:* AA.4.4; AA.4.3.
- **Covering maps between neat levels.** For a connected reductive group `G` over `F`,
  `U′ ⊂ U` compact open with `U` neat, and `K∞` containing `A_G(ℝ)^0` and compact modulo it, prove
  that `X_{U′} → X_U` is a finite covering of degree `[U : U′]`, and that if `U′` is normal in `U`,
  the canonical `U/U′` action is free and transitive on each fibre, so this is a principal
  `U/U′` covering. The rational stabilizer is trivial in this scope. Equality of `U/U′` with the
  full deck-transformation group additionally requires the usual connectedness hypotheses (in
  particular connected total space) ([Milne], §5, p. 58). *Needs:* AA.4.4; AA.4.3; Mathlib
  `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`; Tau Ceti
  `IsQuotientCoveringMap.isCoveringMap_of_comp`; Mathlib `ProperlyDiscontinuousSMul`.
- **Fibre mass for full stabilizers.** For `F` a number field, `G` connected reductive over
  `F`, `K∞ ⊂ G(F_∞)` closed, `U′ ⊂ U ⊂ G(𝔸_{F,f})` compact open, and `x = [g] ∈ X_U` with
  `A_x = G(F) ∩ gK∞Ug⁻¹` finite (for example by *rational-stabilizer-finite*), prove for the
  full stabilizers `A_y` at the points above `x` that `∑_{y↦x} 1/|A_y| = [U : U′]/|A_x|`
  ([Arthur], §1, pp. 7–8). *Needs:* AA.4.4.
- **Fibre mass of a level map with stabilizers.** For a connected reductive group `G` over `F`,
  `U′ ⊂ U` compact open, and `K∞ ⊂ G(F_∞)` closed, containing `A_G(ℝ)^0` and compact modulo it (so
  that `A_x`, `Z(F) ∩ K∞U` and `Z(F) ∩ K∞U′` are finite by *rational-stabilizer-finite*), without
  neatness, prove for `x ∈ X_U` with finite stabilizer group
  `Γ_x = (G(F) ∩ g K_∞U g⁻¹)/(Z(F) ∩ K_∞U)` that the fibre of `X_{U′} → X_U` over `x` satisfies

  ```text
  ∑_{y ↦ x} 1/|Γ_y| = [U : U′] / (|Γ_x| · [Z(F) ∩ K_∞U : Z(F) ∩ K_∞U′])
  ```

  ([LT], §3.2, pp. 11–16 (level-counting context; the displayed mass formula is derived from
  finite-group orbit–stabilizer)). *Needs:* AA.4.4.
- **Quotient groupoids at non-neat level.** For a connected reductive group `G` over `F`,
  compact open `U` and closed `K∞`, define `LevelMaps.levelGroupoid`, the action groupoid `𝒳_U`
  of `G(F)` on `G(𝔸)/K∞U`. Prove `LevelMaps.levelGroupoid_aut` (the automorphism group of the
  object `x` is `G(F) ∩ x K∞U x⁻¹`; `levelGroupoid_aut_hom` identifies it with Mathlib's
  `CategoryTheory.ActionCategory.stabilizerIsoEnd`, the automorphism attached to `γ` being the
  morphism `γ`), `LevelMaps.levelGroupoid_isoClasses` (isomorphism classes
  `≃ LevelQuotient U K∞`, the class of the object `[g]` going to `[g]`,
  `levelGroupoid_isoClasses_mk`) and `LevelMaps.levelGroupoid_finite_aut` (every automorphism group is
  finite if `U` is compact open and `K∞` contains `A_G(ℝ)^0` and is compact modulo it; at neat
  `U` they are trivial). No finiteness assertion is made for general closed `K∞`: the
  automorphism groups need not be finite (real quadratic unit stabilizers when `K∞` is the full
  archimedean centre) ([Milne], §5, p. 58). *Needs:* AA.4.4; Mathlib
  `CategoryTheory.ActionCategory`; AA.1.3.

  **Checks.**
  - For `SL_2/ℚ`, `K∞ = SO(2)`, `U = SL_2(ℤ̂)`, the automorphism group of the object over `i` is
    `⟨(0 −1; 1 0)⟩` of order `4` (for `K∞ = 1` it would be trivial).
  - The groupoid is not determined by `X_U`: `Y(1)` and the coarse space of the groupoid agree,
    but the groupoid remembers the stabilizers of orders `4` and `6`.
  - The automorphism attached to `γ` has underlying group element `γ`
    (`levelGroupoid_aut_underlying`); composing with conjugation by a fixed stabilizer element is
    another isomorphism of the same groups and moves every noncentral `γ`.

### 4.5 Hecke correspondences, volumes and abelianization


  **Checks.** At full integral `GL₂` level, the object over `i` has automorphism group
  of order `4` (`LevelMaps.elliptic_i`), and the object over
  `ρ = −1/2 + (√3/2)i` has order `6` (`elliptic_rho`). The latter uses the conjugate of
  `ℝ_{>0}SO(2)` by `[[√3/2,−1/2],[0,1]]`. The central element `−1` is retained; the
  effective `PSL₂` stabilizers instead have orders `2` and `3`. At neat level the full
  automorphism group is trivial (`levelGroupoid_neat`).

- **Degree of a Hecke correspondence.** For compact open `U` and `g ∈ G(𝔸_f)`, prove that `UgU`
  is the disjoint union of `[U : U ∩ gUg⁻¹]` cosets of the form `x·U` (left cosets in the
  convention of Tau Ceti `HeckeCoset.degree`), represented by `u g`; in the compact-modulo-`A_G`
  neat scope, `p₁ : X_{U∩gUg⁻¹} → X_U` is a covering of exactly that degree, and the rational
  central kernel is trivial ([Arthur], §2, p. 13). *Needs:* Tau Ceti `HeckeCoset.degree_eq_relIndex`;
  AA.4.4.
- **Hecke correspondences.** For a connected reductive group `G` over `F`, `g ∈ G(𝔸_{F,f})` and
  compact open `U`, put `U_g = U ∩ gUg⁻¹` and define `LevelMaps.hecke`, the Hecke correspondence
  `T_g` as the pair of maps `X_U ←p₁ X_{U_g} →p₂ X_U`. Prove `LevelMaps.hecke_fst`
  (`(hecke g).1 (mk x) = mk x`), `LevelMaps.hecke_snd` (`(hecke g).2 (mk x) = mk (x * g)`), that
  `T_g` depends only on `UgU`, and `LevelMaps.hecke_degree` (at neat level the degree of `p₁` is
  `[U : U_g]`, the degree of the double coset `UgU`, `HeckeCoset.degree_eq_relIndex`) ([Arthur],
  §2, p. 13). *Needs:* AA.4.4; AA.4.5.

  **Checks.**
  - For `g = 1` both maps are the identity.
  - `T_g` and `T_{g⁻¹}` are transposes, not equal in general: for `GL_2/ℚ` with `g = diag(p, 1)`,
    `T_{g⁻¹}` is `T_g` composed with translation by the central idele `p⁻¹` at `p`.
  - With `U = GL_2(ℤ̂)` and `K∞ = SO(2)` this translation rescales the archimedean component
    (`|det x_∞|` is multiplied by `p²`), so `T_{g⁻¹} ≠ T_g`; if `K∞ ⊇ ℝ_{>0}` the translation is
    trivial on `X_U` and the two coincide.
- **Cartesian squares of level maps.** For a connected reductive group `G` over `F`,
  `U′, L ⊂ U` compact open with `U` neat, `K∞` containing `A_G(ℝ)^0` and compact modulo it, and
  `U′L = U`, prove that the square `X_{U′∩L} → X_L`, `X_{U′∩L} → X_{U′}`, `X_{U′} → X_U`,
  `X_L → X_U` is Cartesian. For `L = U_g` this identifies this one leg of a Hecke pullback only
  when the product condition holds; `U′` normal does not imply that condition, and `U′ ∩ U_g` is
  generally different from `U′ ∩ gU′g⁻¹` ([Milne], §5, p. 58). *Needs:* AA.4.4; AA.4.5; Tau Ceti
  `HeckeCoset.degree_eq_relIndex`.
- **Volume of a level quotient.** For a connected reductive group `G` over `F` and compact open
  `U`, with a Haar measure `dg_f` on `G(𝔸_f)`, `dg_∞` on `G(F_∞)` and the product measure on
  `G(𝔸)` (AA.0.3), prove

  ```text
  vol(G(F)\G(𝔸)^1) = vol(U) ∑_i vol(Γ_i\G(F_∞)/A_G(ℝ)^0)
  ```

  for representatives `x_i` of `G(F)\G(𝔸_f)/U`, where `Γ_i = G(F) ∩ x_iUx_i⁻¹`, the measure on
  `G(𝔸)^1` is transported from `G(𝔸)/A_G(ℝ)^0` (AA.2.1) and `G(F_∞)/A_G(ℝ)^0` carries the quotient
  measure. (`G(𝔸)^1` is not `G(F_∞)^1 × G(𝔸_f)`: finite ideles have nontrivial norms.) ([Arthur],
  (2.1), p. 13). *Needs:* AA.3.4; AA.2.3; AA.2.1; AA.2.2; AA.0.3.
- **Volumes under finite-index level change.** For a connected reductive group `G` over `F` and
  compact open `U′ ⊂ U`, prove
  `∑_j vol(Γ′_j\G(F_∞)/A_G(ℝ)^0) = [U : U′] ∑_i vol(Γ_i\G(F_∞)/A_G(ℝ)^0)` ([LT], §3.2.3, p. 16).
  *Needs:* AA.4.5; Mathlib `MeasureTheory.Subgroup.index_mul_measure`; AA.2.4.
- **Integral lifting for reductive abelianization.** (*abelianization-integral-lifts*) For
  connected reductive `G/F` with simply connected derived group and `ν : G → D = G/G^der`, prove
  that there is a finite set `B` such that smooth reductive models over `𝒪_{F,B}` extend `ν` and
  `ν : G(𝒪_v) → D(𝒪_v)` is surjective for every finite `v ∉ B` ([Milne], Lemma 5.21(b), p. 61).
  The lift follows from Lang’s theorem on the connected smooth special fibre and
  Hensel lifting along the smooth fibre of `ν`. *Needs:* AA.1.1; ReductiveGroupsPartII, RG2.3
  (Lang and smooth lifting).
- **Surjectivity of finite adelic abelianization.** For `F` a number field, `G` connected
  reductive over `F` with `G^der` simply connected, `D = G/G^der` and `ν : G → D` the quotient
  morphism with its restricted-product map on finite adelic points, prove under
  *abelianization-integral-lifts* and local simply connected `H¹` vanishing that
  `ν : G(𝔸_f) → D(𝔸_f)` is surjective with kernel `G^der(𝔸_f)`; it is the actual
  restricted-product homomorphism induced by `ν` ([Milne], Lemma 5.21, p. 61). *Needs:* AA.4.5;
  AA.4.1; AA.1.3.
- **Class sets of groups with simply connected derived group.** Let `G` be connected reductive
  over `F` with `G^der` simply connected and `G^der(F_∞)` noncompact on each `F`-simple factor,
  and `ν : G → D = G/G^der`. For compact open `U ⊂ G(𝔸_{F,f})`, prove that `ν` induces a bijection
  `G(F)\G(𝔸_{F,f})/U ≃ ν(G(F))\D(𝔸_{F,f})/ν(U)` ([LT], §3.2.2, (21), p. 14). *Needs:* AA.4.2;
  AA.4.1; AA.1.3; AA.1.5; AA.4.5.

### 4.6 Compact abelian quotients and quaternion norms

- **Reduced norms of a quaternion algebra over ℚ.** For a quaternion algebra `B` over `ℚ`,
  prove `Nrd(B_p^×) = ℚ_p^×` for every prime `p`; `Nrd(B_∞^×) = ℝ^×` if `B` is split at `∞` and
  `ℝ_{>0}` otherwise; and `Nrd(B^×) = ℚ^×` if `B` is split at `∞`, `ℚ_{>0}` otherwise
  (Hasse–Schilling–Maass) ([Khayutin], §2.3, arXiv v3 pp. 15–16; Annals p. 162). *Needs:* Tau Ceti
  `QuaternionAlgebra.normForm`; GlobalQuadraticForms, layer 5; AA.4.1.
- **Compact idele classes modulo squares.** (*idele-class-square-compact*) For a number field
  `F`, `C_F = F^×\𝔸_F^×` the idele class group with the quotient topology and `C_F²` its subgroup
  of squares, using the idele norm and the compactness of `C_F^1` from GlobalNumberFields
  layer 6, prove that `C_F/C_F²` is compact Hausdorff: the norm decomposition
  `C_F ≃ ℝ_{>0} × C_F¹` identifies it with the quotient of compact `C_F¹` by its square image
  ([Khayutin], Definition 3.1, arXiv v3 p. 22, and Remark 3.7, p. 25). *Needs:* GlobalNumberFields,
  layer 6.

  **Checks.**
  - The class of `x²` is the identity for every actual idele class `x`
    (`NumberField.idele_squares_killed`).
  - The positive infinite scalar `2` also dies: its positive square root is an idele
    (`idele_squares_positive`). Thus the noncompact norm direction disappears.
  - Over `ℚ`, the idele with component `−1` at `3` and `1` everywhere else survives
    (`idele_squares_nontrivial`): `−1` is not a square in `ℚ₃`, and a principal factor
    with even finite valuations and positive real component is a rational square.

- **Pushforward of a homogeneous measure to a compact abelian quotient.** Let `C` be a compact
  abelian group, second countable so that Mathlib's Haar uniqueness `isMulLeftInvariant_eq_smul` applies, `π : G → C` a
  continuous surjective homomorphism, `T ≤ G` a closed subgroup with `Λ ≤ T` discrete, `Λ\T`
  compact (as for `[T(𝔸)]` with `T` anisotropic modulo the centre) and `π(Λ) = 1`, and `μ` the
  `T`-invariant probability measure on `Λ\T g`. Prove that `π_*μ` is the Haar probability
  measure of the coset `π(T)·π(g)` of the closed subgroup `π(T)` ([Khayutin], Definition 3.1,
  arXiv v3 p. 22; Annals p. 169). *Needs:* AA.4.6; Mathlib
  `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.
  **Checks.** The source quotient carries its Borel sigma algebra. On a two-point
  discrete space, the identity from the trivial sigma algebra to the full sigma algebra
  is not measurable; an arbitrary measurable-space instance does not suffice.

  **Checks.**
  - For `G = C₄`, `π = id`, `T = Λ = {1}` and translating by `1 ∈ ℤ/4`, the pushforward
    is a point mass (`Residual.homogeneous_point`).
  - With `T = C₄` and `Λ = {1}`, its singleton masses are `1/4`
    (`homogeneous_full`).
  - With `T = {0,2}` and `Λ = {1}` in multiplicative notation, translation by `1 ∈ ℤ/4`
    gives mass `1/2` at each of `1,3` and zero off that coset (`homogeneous_coset`).
    All three tests use the orbit quotient, its Borel sigma algebra and its normalized counting
    measure. The two-point sigma-algebra non-example above explains the Borel hypothesis.

### 4.7 Fourier limits on compact abelian groups

- **Fourier convergence of quadratic-character kernels.** Let `C` be a compact Hausdorff
  abelian group with a second countable topology and its Borel sigma algebra,
  `χ_i : C → {±1}` pairwise distinct nontrivial continuous characters, and `m_i`
  the Haar probability of the closed subgroup `ker χ_i`, viewed on `C`. Prove that for each fixed
  character `ψ` of `C`, `Residual.integral_character_kernel` gives integral zero unless
  `ψ = 1` or `ψ = χ_i`, and prove `Residual.tendsto_kernel_haar`, weak convergence of the
  `m_i` to Haar probability on `C` ([Khayutin],
  Proposition 3.6, arXiv v3 p. 24, and its proof with Remark 3.7, p. 25). *Needs:* AA.2.4;
  RepresentationTheory/CompactGroups, layer 5.
- **Limits of measures invariant under character kernels.** Let `C` be a second countable
  compact Hausdorff abelian group and `(χ_i)` a sequence of pairwise distinct continuous
  characters `C → {±1}`. Prove `Residual.invariant_of_tendsto_kernels`: any weak-* limit
  of probability measures invariant under `ker χ_i` is `C`-invariant ([Khayutin],
  Proof of Proposition 3.6, arXiv v3 p. 25; Annals pp. 172–173). *Needs:* AA.4.7;
  RepresentationTheory/CompactGroups, layer 5.
### Examples

`μ_2` over `ℚ` fails weak approximation at `{∞, 2}` and `G_m` over `ℚ` fails strong approximation
at `{∞}`, while `G_a` has both. `diag(2, 1/2)` is neat and the order-`3` element of `SL_2(ℤ)` is
not; `U(3)` is a neat level and `GL_2(ℤ̂)` is not. The `SL_2/ℚ` level quotient with `K∞ = 1` is
`SL_2(ℤ)\SL_2(ℝ)`; with `K∞ = SO(2)`, the groupoid over `i` has automorphism group of order `4`. For
`g = diag(p, 1)` the correspondences `T_g` and `T_{g⁻¹}` differ at `K∞ = SO(2)` and agree once
`K∞ ⊇ ℝ_{>0}`. The positive scalar direction disappears in idele classes modulo squares,
while a nonsquare unit at `3` survives over `ℚ`.

### Dependencies

Layers AA.1–AA.3; Mathlib's double cosets, action categories, properly discontinuous actions and
covering maps; Tau Ceti's Hecke degrees, covering-map composition and quaternion norm form;
ReductiveGroups, layers 1, 6 and 7; ReductiveGroupsPartII, RG2.3 and RG2.4; GlobalNumberFields,
layers 1 and 6; Chebotarev, layer 10; GlobalQuadraticForms, layer 5; ClassFieldTheory, layer 12;
LocalFieldsRamification, layer 0; RepresentationTheory/CompactGroups, layer 5; the `p`-adic
closed-subgroup development in AA.4.2 and the finite reductive order formula in AA.2.4.

## Layer 5: worked examples

Work out the quotient topology, connected components, cohomology and level changes in concrete
groups. These examples test the centre, determinant, measure and stabilizer conventions of the
preceding layers; each item is a target with its own locator.

### 5.1 GL₁ and logarithmic tori

- **The GL_1 quotient is the idele class group.** For `G = G_m` over a number field `F`, prove
  `G(F)\G(𝔸_F) ≃ₜ* IdeleClassGroup F`; that `G(𝔸_F)^1` is the group `𝔸_F^1` of norm-one ideles;
  that `A_G(ℝ)^0 = ℝ_{>0}` embedded diagonally at the archimedean places; that
  `𝔸_F^× = 𝔸_F^1 × ℝ_{>0}`; and that `F^×\𝔸_F^1` is compact while `F^×\𝔸_F^×` is not ([Arthur],
  §3, p. 16; [Borel], §5.8, p. 22). *Needs:* AA.1.4; Mathlib `NumberField.IdeleClassGroup`;
  AA.2.1; AA.3.4; GlobalNumberFields, layer 6; Tau Ceti
  `TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue`.
- **Units at level U_Q form a lattice of rank r₁ + r₂ − 1.** For a compact open `U ⊂ Ô^×`,
  prove that `Γ_U = F^× ∩ U` is a finite-index subgroup of `𝒪_F^×`, and that its image under the
  logarithmic embedding is a lattice of rank `r₁ + r₂ − 1` in the trace-zero hyperplane of
  `ℝ^{r₁+r₂}` ([CG], §8.2, p. 79). *Needs:* Mathlib `NumberField.Units.unitLattice_rank`,
  `NumberField.Units.rank`, `NumberField.Units.instZLattice_unitLattice`.
- **Canonical logarithmic torus at GL₁ level.** For `F` a number field with `r₁` real and `r₂`
  complex places, `Q` a finite set of finite places, `p` a prime and `n ≥ 1` with
  `N(v) ≡ 1 mod p^n` for `v ∈ Q`, and `U_Q = K_∞ × ∏_v U_{Q,v}` with `K_∞` and `A_∞^0` as in
  *gl1-XQ-components*, prove that the identity component is the logarithmic quotient `W/Λ_Q`,
  where `W = ℝ^{r₁+r₂}/ℝ·(1, …, 1)` and `Λ_Q` is the image of the totally positive congruence
  units `F^× ∩ U_{Q,f}`; it is a compact real torus of dimension `r₁ + r₂ − 1`. The complex
  circle factors have already been divided out by `K_∞` ([CG], §8.2, pp. 78–79). The signature
  `AdelicExamples.GL1.nonempty_identityComponentHomeomorph` asserts a homeomorphism, without
  naming one. *Needs:* AA.5.1.
- **Geometry of the GL_1 arithmetic quotients X_Q.** (*gl1-XQ-components*) For a finite set `Q`
  of finite places with `N(v) ≡ 1 mod p^n`, let `U_Q = K_∞ × ∏_v U_{Q,v}`, where
  `K_∞ ≅ (S¹)^{r₂}` is the identity component of the maximal compact subgroup of `(F ⊗ ℝ)^×`,
  `U_{Q,v} = 𝒪_v^×` for `v ∉ Q` and the index-`p^n` subgroup of `𝒪_v^×` for `v ∈ Q`, and
  `X_Q = F^×\𝔸_F^×/U_Q A_∞^0` with `A_∞^0 = A_{G_m}(ℝ)^0`. Prove that each connected component of
  `X_Q` is a compact torus `(S¹)^{r₁+r₂−1}`, and that
  `π_0(X_Q) = F^×\𝔸_F^×/U_Q (F ⊗ ℝ)^{×,0}`, an extension of the narrow class group of `F` by a
  quotient of `∏_{v∈Q} 𝒪_v^×/𝒪_v^{×p^n}` (not, in general, the maximal exponent-`p^n` quotient of
  the ray class group) ([CG], §8.2, p. 79). The identification
  `AdelicExamples.GL1.componentsEquiv` sends the component of the class of an idele `x` to the
  class of `x` (`componentsEquiv_mk`); a bijection permuting the components would satisfy every
  other clause. *Needs:* AA.5.1; AA.3.4; Mathlib `NumberField.Units.rank`,
  `NumberField.Units.unitLattice_rank`; GlobalNumberFields, layer 6.

  **Checks.**
  - An idele of `(F ⊗ ℝ)^{×,0}` lies in the identity component (`componentsEquiv_identity`).
- **The invariant l0 for GL_1.** Prove that every connected component of `X_Q` has dimension
  `r₁ + r₂ − 1 = NumberField.Units.rank F`, the value of Calegari–Geraghty's invariant `l0` for
  `G = GL_1/F`; in particular its cohomology vanishes above degree `r₁ + r₂ − 1` ([CG], §8.2,
  p. 77). *Needs:* AA.5.1; Mathlib `NumberField.Units.rank`; AlgebraicTopology, stage 6.
- **Degree-zero cohomology of X_Q.** Prove that the `ℤ_p`-module of locally constant functions
  `X_Q → ℤ_p` is free on `π_0(X_Q)`: `H^0(X_Q, ℤ_p) ≅ ℤ_p[π_0(X_Q)]` ([CG], §8.2, p. 79), the
  isomorphism `AdelicExamples.GL1.locallyConstantEquiv` evaluating `f` at a point of each component
  (`locallyConstantEquiv_apply`). *Needs:* AA.5.1; AA.3.4.
- **Hecke and diamond operators for GL_1.** Prove that for `v ∉ Q` the `GL₁` Hecke operator of
  the finite idele `π_v` is right translation, and that for `v ∈ Q` a unit `α` gives the diamond
  translation; each permutes `π₀(X_Q)` by its finite idele class. Under the natural
  exterior-power identification of torus cohomology, translation induces the identity within
  the torus factor and the indicated permutation of the component factors in every degree
  ([CG], §8.2, p. 79). *Needs:* AA.4.5; AA.5.1; AlgebraicTopology, stage 6.

### 5.2 GL₂ over ℚ and principal levels

- **Integral adelic congruence.** For `N : ℕ` and finite adeles `x,y`, define
  `AdelicExamples.GL2.CongrMod N x y` by `x − y ∈ Nℤ̂`. For `N > 0` this is
  equivalent to `(x − y)/N ∈ ℤ̂`; the divisibility definition also handles `N = 0`.
  **Checks.** Modulo zero it is equality; `1 ≡ 0 mod 1`; `1` is not congruent to `0`
  modulo `2`. The inverse-based expression at `N = 0` equals zero even for the pair
  `(1,0)`, so it cannot define congruence modulo zero. These four cases are Lean examples.
- **Raw Möbius action and the Mathlib folded action.** For `g ∈ GL₂(ℝ)` and `z ∈ ℂ` with
  `Im z ≠ 0`, prove that the raw Möbius maps of `GL₂(ℝ)` induce an action on `ℍ± = ℂ ∖ ℝ`, that
  folding the lower half-plane by conjugation is equivariant for this action and Mathlib's
  `glAction` on `ℍ`, and that for positive determinant the raw and folded formulas coincide;
  `diag(1, −1)` sends `i` to `−i` in the raw action and fixes `i` in `glAction` ([Milne],
  Lemma 5.11, p. 56). *Needs:* Mathlib `UpperHalfPlane.glAction`, `Matrix.GeneralLinearGroup.det`,
  `UpperHalfPlane.moebius_im`, `UpperHalfPlane.denom_ne_zero_of_im`, `UpperHalfPlane.coe_smul`.
- **GL_2(ℝ) modulo ℝ^× SO(2).** Prove that `GL_2(ℝ)/ℝ^× SO(2)` is homeomorphic to `ℍ^± = ℂ ∖ ℝ`
  through `g ↦ g·i`, equivariantly for the Möbius action, and that `GL_2(ℝ)^+` acts transitively
  on `ℍ` with stabilizer `ℝ^× SO(2)` at `i` ([Milne], Lemma 5.11, p. 56). *Needs:* AA.5.2.
- **Congruence groups of the GL₂ components.** For compact open subgroups `U′ ⊂ U` of
  `GL₂(𝔸_f)`, `g ∈ GL₂(𝔸_f)`, `q ∈ GL₂(ℚ)` with `det q > 0` and `u ∈ U`, put
  `Γ_{g,U} = GL₂(ℚ)^+ ∩ gUg⁻¹`, with `GL₂(ℚ)` embedded diagonally. Prove that every element of
  `Γ_{g,U}` has determinant `1`: `det U` is a compact subgroup of `𝔸_f^×`, hence lies in `ℤ̂^×`,
  and `ℚ_{>0} ∩ ℤ̂^× = {1}`; thus `Γ_{g,U} = SL₂(ℚ) ∩ gUg⁻¹`. Prove that if
  `K(M) = ker(GL₂(ℤ̂) → GL₂(ℤ/M))` lies in `gUg⁻¹` (such `M` exists because these kernels form a
  neighbourhood basis of `1`), then `Γ(M) ⊂ Γ_{g,U}`, and `Γ_{g,U} ∩ SL₂(ℤ)` has finite index in
  both `Γ_{g,U}` and `SL₂(ℤ)`; hence the image of `Γ_{g,U}` in `GL₂(ℝ)` is arithmetic in Mathlib's
  sense, discrete, and acts properly discontinuously on `ℍ`; its image in `PSL₂(ℝ)` is a Fuchsian
  group, and the orbit space `Γ_{g,U}\ℍ` with the quotient topology is Hausdorff and is the
  coarse quotient Riemann surface of the Fuchsian orbifolds roadmap. Prove that
  `Γ_{qgu,U} = qΓ_{g,U}q⁻¹` and that `z ↦ q·z` induces a biholomorphism
  `Γ_{g,U}\ℍ → Γ_{qgu,U}\ℍ`; and that `Γ_{g,U′}` has finite index in `Γ_{g,U}`, so that `z ↦ z`
  induces a finite holomorphic map `Γ_{g,U′}\ℍ → Γ_{g,U}\ℍ` ([Milne], §4, definition of
  congruence subgroups, p. 42, and Proposition 4.1, p. 43; Lemma 5.13 and the remarks after it,
  pp. 57–58. The determinant argument is a direct computation). *Needs:* AA.5.2; AA.4.4; Mathlib
  `Subgroup.IsArithmetic`, `Subgroup.IsArithmetic.conj`,
  `Subgroup.IsArithmetic.properlyDiscontinuous`, `Subgroup.IsArithmetic.discreteTopology`,
  `CongruenceSubgroup.Gamma`, `t2Space_of_properlyDiscontinuousSMul_of_t2Space`;
  FuchsianOrbifolds, layers 0, 1 and 4.

  **Checks.**
  - At principal level `1`, the component of `1` has group `Γ(1) = SL₂(ℤ)`
    (`GL2.componentGroup_level_one`).
  - The scalar `−1` belongs to the component group at principal level `2`, but not at
    principal level `3` (`GL2.componentGroup_sign`).
  - The matrix `[[1,1],[0,1]]` belongs to `Γ₀(3)` and `Γ₁(3)` but not `Γ(3)`
    (`GL2.componentGroup_unipotent`).

- **The GL_2/ℚ quotient and the upper half-plane.** For `G = GL_2` over `ℚ`, `K_∞ = ℝ^× SO(2)`
  and `U ⊂ GL_2(𝔸_f)` compact open, prove

  ```text
  G(ℚ)\G(𝔸)/K_∞U ≃ ⊔_{c ∈ ℚ_{>0}\𝔸_f^×/det U} Γ_c\ℍ,
  ```

  where `Γ_c = GL_2(ℚ)^+ ∩ g_c U g_c⁻¹` for `g_c ∈ GL_2(𝔸_f)` with `det g_c = c`, acting on `ℍ` by
  Möbius transformations; for `det U = ℤ̂^×` there is a single component ([Milne], Lemma 5.13,
  p. 57). The Lean signatures (`AdelicExamples.GL2.componentHomeomorph`) work in the model
  `GL_2(ℚ)^+\(ℍ × GL_2(𝔸_f)/U)` over `FiniteAdeleRing ℤ ℚ`; its identification with
  `LevelMaps.LevelQuotient` for `GL_2` (finite adeles over `𝓞_ℚ`, `K∞ = ℝ^×SO(2)`), sending
  `[(g_∞, g_f)]` with `det g_∞ > 0` to `[(g_∞ · i, g_f)]`, is part of this target and has no
  signature yet. *Needs:* AA.3.4; AA.4.5; AA.4.2; Tau Ceti
  `Matrix.SpecialLinearGroup.map_intCast_zmod_surjective`; AA.5.2, including the congruence
  groups of the components; Mathlib `Matrix.GeneralLinearGroup.det`; AA.4.4.
- **Principal congruence level.** For `N ≥ 1` and `U = K(N) = ker(GL_2(ℤ̂) → GL_2(ℤ/N))`, prove
  `det K(N) = {x ∈ ℤ̂^× : x ≡ 1 mod N}`, that the components are indexed by `(ℤ/N)^×`, and that
  each `Γ_c` is `Γ(N) = ker(SL_2(ℤ) → SL_2(ℤ/N))` when the representatives `g_c` are chosen in `GL₂(ℤ̂)` (other choices give conjugate groups) (Mathlib `CongruenceSubgroup.Gamma`) ([Milne],
  Lemma 5.13, p. 57). The indexing is the statement `GL2.nonempty_componentsPrincipalEquiv`; the
  canonical bijection is `componentsEquivDet` followed by reduction of `det` modulo `N`, and no
  other bijection is singled out. *Needs:* AA.5.2; Mathlib `CongruenceSubgroup.Gamma`; AA.3.4.
- **Riemann-surface structure and change of level for GL₂ quotients.** Let
  `X_U = G(ℚ)\G(𝔸)/K_∞U` for `G = GL₂` over `ℚ`, `K_∞ = ℝ^× SO(2)`, `U′ ⊂ U` compact open subgroups
  of `GL₂(𝔸_f)`, `h ∈ GL₂(𝔸_f)` and `N ≥ 1`. Transport the Riemann-surface structures of the
  components `Γ_c\ℍ` along the homeomorphism of the upper half-plane decomposition and prove
  that the resulting complex structure on `X_U` does not depend on the representatives `g_c`.
  Prove that the projection `X_{U′} → X_U` is holomorphic: if `g′ = qgu` with `q ∈ GL₂(ℚ)^+` and
  `u ∈ U`, it maps the component `Γ_{g′,U′}\ℍ` to `Γ_{g,U}\ℍ` by `z ↦ q⁻¹·z`; and that right
  translation `[x, a] ↦ [x, ah]` is a biholomorphism `X_U → X_{h⁻¹Uh}`. Let `K₀(N)` and `K₁(N)` be
  the matrices `(a b; c d) ∈ GL₂(ℤ̂)` with `c ≡ 0 mod N`, respectively with `c ≡ 0` and
  `d ≡ 1 mod N`. Prove that their determinants fill `ℤ̂^×`, so `X_{K₀(N)}` and `X_{K₁(N)}` are
  connected, isomorphic to `Γ₀(N)\ℍ` and `Γ₁(N)\ℍ` as Riemann surfaces, and that the projections
  `X_{K(N)} → X_{K₁(N)} → X_{K₀(N)}` restrict on the component of `1` to the natural maps
  `Γ(N)\ℍ → Γ₁(N)\ℍ → Γ₀(N)\ℍ` ([Milne], Lemma 5.13, p. 57, and the maps `Sh_{K′} → Sh_K` and
  `T(g)`, p. 58; `π₀` at principal level, p. 63. The `K₀(N)` and `K₁(N)` cases are direct
  computations from the component decomposition). *Needs:* AA.5.2; AA.4.4; Mathlib
  `CongruenceSubgroup.Gamma0`, `CongruenceSubgroup.Gamma1`, `CongruenceSubgroup.Gamma`;
  FuchsianOrbifolds, layers 1, 4 and 5.
- **GL₂ components for O(2) and SO(2).** For `G = GL₂` over `ℚ`, `N ≥ 1` and principal finite
  level `K(N) = ker(GL₂(ℤ̂) → GL₂(ℤ/N))`, prove that the quotient with `K∞ = ℝ^× SO(2)` (the raw
  Möbius action on `ℍ±`) has components `(ℤ/N)^×` and raw real symmetric space `ℍ±` before
  rational orientation reduction, and that with `K∞ = ℝ^× O(2)` (the folded action on `ℍ`) the
  real space is the folded `ℍ` and the component set is `(ℤ/N)^×/{±1}`
  (`GL2.nonempty_componentsO2PrincipalEquiv`). At `N = 3` these cardinalities are respectively two
  and one ([Milne], Theorem 5.17, pp. 59–61; zero-dimensional example, p. 63). *Needs:* AA.5.2.

### 5.3 Definite quaternion groups

- **Compactness for a definite quaternion algebra.** For a definite quaternion division algebra
  `D` over `ℚ` with `D ⊗ ℝ ≅ ℍ` (Hamilton) and `G = D^×`, prove that `G(ℚ)\G(𝔸)^1` is compact;
  that `G(ℚ)\G(𝔸_f)/U` is finite for every compact open `U`; that each
  `Γ_{x,U} = D^× ∩ xUx⁻¹` is finite; and that `D^×/ℚ^×` is discrete in `(D ⊗ 𝔸_f)^×/𝔸_f^×`
  ([Milne], §3, Theorem 3.3 and Example 3.4, pp. 33–34). *Needs:* AA.3.4; AA.1.3; Mathlib
  `QuaternionAlgebra`.
- **Volume comparison under level change for a definite quaternion algebra.** For `D` definite
  over `ℚ` and compact open `U′ ⊂ U ⊂ (D ⊗ 𝔸_f)^×`, with `Γ_x = (D^× ∩ xUx⁻¹)/(ℚ^× ∩ U)` the
  finite stabilizers and `Cl(U) = D^×\(D ⊗ 𝔸_f)^×/U`, prove

  ```text
  ∑_{x ∈ Cl(U′)} 1/|Γ′_x| = ([U : U′] / [ℚ^× ∩ U : ℚ^× ∩ U′]) · ∑_{x ∈ Cl(U)} 1/|Γ_x|
  ```

  ([Arthur], §2, p. 12). *Needs:* AA.5.3; AA.4.5; AA.4.4.

### Examples

The layer is itself the worked-example layer: `F^×\𝔸_F^1` is compact while `F^×\𝔸_F^×` is not;
the `GL_1` level quotients `X_Q` are disjoint unions of `(S¹)^{r₁+r₂−1}` indexed by an extension
of the narrow class group; `diag(1, −1)` distinguishes the raw and folded half-plane actions;
`X_{K(N)}` has `(ℤ/N)^×` components for `SO(2)` and `(ℤ/N)^×/{±1}` for `O(2)` (two and one at
`N = 3`); and a definite quaternion algebra has compact norm-one quotient and finite stabilizers.

### Dependencies

Layers AA.1–AA.4; Mathlib's idele class group, unit lattice, upper half-plane action, arithmetic
subgroups, congruence subgroups and quaternion algebras; Tau Ceti's `G_m` and `SL_2` comparison
lemmas; GlobalNumberFields, layers 4 and 6; AlgebraicTopology, stage 6; FuchsianOrbifolds,
layers 0, 1, 4 and 5.

## Downstream consumers

Automorphic forms on reductive groups consume the adelic groups, Haar and Tamagawa measures,
quotient integration, the norm-one subgroup and the reduction theory of AA.1–AA.3; their
representation and spectral theory lie outside this roadmap. Locally symmetric spaces, Shimura
data and Shimura varieties consume the neat levels, level quotients, covering maps and Hecke
correspondences of AA.4 and the `GL_2` identification of AA.5.2, and add their own geometric
applications. The Fourier limits of AA.4.7 apply to specified compact abelian quotients.
Function-field applications consume Layer AA.0
unchanged, since it is stated for countable families of second countable locally compact groups.
The Calegari–Geraghty `GL_1` computations of AA.5.1 are the base case for the invariant `l0` in
modularity-lifting roadmaps. Within this roadmap, AA.3.4 consumes the real reduction of AA.3.2–3.3;
AA.3.6 consumes AA.3.4, AA.4.2 consumes its lattices, and AA.4.4–AA.4.5 consume
the neat levels of AA.4.3.

## References

- **[PR94]** V. Platonov and A. Rapinchuk, *Algebraic Groups and Number Theory*,
  Academic Press, 1994; [author-hosted text](https://uva.theopenscholar.com/files/andrei-rapinchuk/files/agnt_english.pdf).

The locators above refer to the following editions. Rosengarten is cited for statements that
hold over number fields as well as function fields; the analytic normalizations of AA.2 use the
number-field sources named there.

- **Arthur**: James Arthur, *An introduction to the trace formula*. Clay Mathematics Proceedings 4
  (2005), pp. 1–263. <https://www.claymath.org/library/cw/arthur/pdf/62.pdf>
- **Borel**: Armand Borel, *Some finiteness properties of adele groups over number fields*.
  Publications mathématiques de l'IHÉS 16 (1963), pp. 5–30.
  <http://www.numdam.org/item/PMIHES_1963__16__5_0.pdf>
- **Conrad**: Brian Conrad, *Weil and Grothendieck approaches to adelic points*. L'Enseignement
  Mathématique 58 (2012), pp. 61–97; locators use the author's preprint pagination.
  <https://math.stanford.edu/~conrad/papers/adelictop.pdf>
- **Conrad RGS**: Brian Conrad, *Reductive group schemes*. In *Autour des schémas en groupes*,
  Panoramas et Synthèses 42–43 (2014), pp. 93–444; locators use the author's preprint.
  <https://math.stanford.edu/~conrad/papers/luminysga3.pdf>
- **Platonov–Rapinchuk–Rapinchuk**: V. Platonov, A. Rapinchuk and I. Rapinchuk,
  *Algebraic Groups and Number Theory*, Volume I, second edition, Cambridge Studies
  in Advanced Mathematics 205, Cambridge University Press, 2023. Locators use printed pages.
- **Schneider**: P. Schneider, *p-Adic Lie Groups*, Grundlehren der mathematischen
  Wissenschaften 344, Springer, 2011. Locators use printed pages.
- **Dudas–Michel**: Olivier Dudas and Jean Michel, *Lectures on finite reductive groups
  and their representations*, BICMR, 23 April–3 June 2015.
  <https://webusers.imj-prg.fr/~jean.michel/papiers/lectures_beijing_2015.pdf>
- **Rapinchuk**: Andrei S. Rapinchuk, *On strong approximation for algebraic groups*. MSRI
  Publications 61 (2014), pp. 269–298; locators use arXiv:1207.4425.
  <https://arxiv.org/abs/1207.4425>
- **Platonov**: V. P. Platonov, *The problem of strong approximation and the Kneser–Tits
  conjecture for algebraic groups*. Mathematics of the USSR-Izvestiya 3 (1969), pp. 1139–1147.
  <https://www.mathnet.ru/eng/im2220>
- **Platonov addendum**: V. P. Platonov, *The problem of strong approximation and the
  Kneser–Tits conjecture for algebraic groups: Addendum*. Mathematics of the USSR-Izvestiya
  4 (1970), pp. 784–786. <https://www.mathnet.ru/eng/im2446>
- **Milne**: J. S. Milne, *Introduction to Shimura varieties*. Author's revision of 16 September
  2017 of the Clay Mathematics Proceedings 4 (2005) article.
  <https://www.jmilne.org/math/xnotes/svi.pdf>
- **Rosengarten**: Zev Rosengarten, *Tamagawa numbers and other invariants of pseudo-reductive
  groups over global function fields*. arXiv:1806.10723v3 (31 January 2020); published in
  Algebra & Number Theory 15 (2021), pp. 1865–1920; locators use the arXiv edition.
  <https://arxiv.org/abs/1806.10723v3>
- **Sutherland**: Andrew V. Sutherland, *18.785 Number theory I, Lecture #23: The ring of adeles,
  strong approximation*. MIT 18.785 lecture notes, Fall 2016.
  <https://math.mit.edu/classes/18.785/2016fa/LectureNotes23.pdf>
- **BKT**: Benjamin Bakker, Bruno Klingler, Jacob Tsimerman, *Tame topology of arithmetic
  quotients and algebraicity of Hodge loci*. Journal of the American Mathematical Society 33
  (2020), pp. 917–939; arXiv:1810.04801v2, with the 2023 erratum.
  <https://arxiv.org/abs/1810.04801v2>
- **Khayutin**: Ilya Khayutin, *Joint equidistribution of CM points*. Annals of Mathematics 189
  (2019), pp. 145–276; arXiv:1710.04557v3. <https://arxiv.org/abs/1710.04557v3>
- **CG**: Frank Calegari, David Geraghty, *Modularity lifting beyond the Taylor–Wiles method*.
  Inventiones Mathematicae 211 (2018), pp. 297–433; arXiv:1207.4224v2.
  <https://arxiv.org/abs/1207.4224v2>
- **LT**: Michael Lipnowski, Jacob Tsimerman, *How large is A_g(F_q)?*. Duke Mathematical
  Journal 167 (2018); locators use arXiv:1511.02212v1. <https://arxiv.org/abs/1511.02212v1>
- **HW**: Yonatan Harpaz, Olivier Wittenberg, *Zéro-cycles sur les espaces homogènes et problème
  de Galois inverse*. Journal of the American Mathematical Society 33 (2020), pp. 775–805;
  arXiv:1802.09605v2. <https://arxiv.org/abs/1802.09605v2>
- **BKT erratum**: Benjamin Bakker, Bruno Klingler, Jacob Tsimerman, *Erratum: Tame topology of
  arithmetic quotients and algebraicity of Hodge loci*. Journal of the American Mathematical
  Society 36 (2023), DOI 10.1090/jams/1025; locators use the four-page author copy.
  <https://benjamin-bakker.github.io/DefArithErr.pdf>
- **Gordon**: Julia Gordon, with an appendix by Matthew Koster, *Orbital integrals and
  normalizations of measures*. arXiv:2205.02391v1 (2022). <https://arxiv.org/pdf/2205.02391v1>
- **BHC**: Armand Borel and Harish-Chandra, *Arithmetic subgroups of algebraic groups*. Annals of
  Mathematics 75 (1962), pp. 485–535.
  <https://www.mathi.uni-heidelberg.de/~wienhard/retreat10/references/borel_harishchandra_2.pdf>
- **BGST**: Benjamin Bakker, Thomas W. Grimm, Christian Schnell and Jacob Tsimerman, *Finiteness
  for self-dual classes in integral variations of Hodge structure*. Author PDF, 2021 edition,
  including §28 and Proposition 28.1. <https://benjamin-bakker.github.io/finiteness.pdf>
- **Orr–Schnell**: Martin Orr and Christian Schnell, *Correction to the article Height bounds and
  the Siegel property*. Algebra & Number Theory 17 (2023), pp. 1231–1237.
  <https://msp.org/ant/2023/17-6/ant-v17-n6-p04-s.pdf>
- **Orr**: Martin Orr, *Height bounds and the Siegel property*. arXiv:1609.01315v2, with the
  Orr–Schnell 2023 corrections. <https://arxiv.org/pdf/1609.01315v2>
- **BHV**: Bachir Bekka, Pierre de la Harpe and Alain Valette, *Kazhdan's Property (T)*. Author
  manuscript of 23 February 2007; locators use its pagination rather than that of the Cambridge
  2008 book. <https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf>

- **Marzec–Neururer**: J. Marzec and M. Neururer, *L-functions and their applications*,
  25 February 2020, Chapter 5, pp. 55–67.
  <https://jmarzec.ukw.edu.pl/marzec,neururer-lecture.pdf>
- **Stacks**: The Stacks Project, Tags [0245](https://stacks.math.columbia.edu/tag/0245),
  [04TY](https://stacks.math.columbia.edu/tag/04TY) and
  [04SK](https://stacks.math.columbia.edu/tag/04SK).
