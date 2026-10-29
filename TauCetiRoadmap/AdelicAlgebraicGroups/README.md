# Roadmap: adelic algebraic groups and arithmetic quotients

**Summary.** This roadmap develops algebraic groups over number fields on the adeles: the adelic
points and their topology, Haar and Tamagawa measures, the arithmetic quotient `G(F)\G(𝔸_F)` with
reduction theory, finiteness of class numbers, finite volume and compactness criteria, strong
approximation, neat levels and Hecke correspondences, with `GL₁`, `GL₂` and quaternion algebras as
worked examples. We want it because automorphic forms live on these quotients: the locally
symmetric spaces whose cohomology carries Hecke eigensystems and Galois representations are exactly
`G(F)\G(𝔸_F)/K`, and their finiteness, compactness and level structure are what make the
cohomology finite-dimensional and the Hecke action well defined. Everything about automorphic
representations and arithmetic manifolds downstream rests on these statements.

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

The shared Haar-character, congruence-level and S-arithmetic interfaces draw on the API
organization of the Imperial College London FLT project.

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
topology, compact open local subgroups and the local analytic chart/cotangent/Haar-Jacobian
bridge specified in the supplier contracts below; in RG2.0a, coefficient-natural Weil restriction, its
tower maps and tensor comparison; in RG2.1, the valuation map of the maximal split central torus
at the finite places (the torus itself is ReductiveGroups, layers 6–7); in RG2.3, reductive
integral models, hyperspecial subgroups and Lang's theorem with Hensel lifting; in RG2.4, the
local decompositions and integration, the Iwasawa decomposition `G(F_v) = K_v P(F_v)` with
`K_v ∩ P(F_v) = P(𝒪_v)` for an arbitrary parabolic and a hyperspecial `K_v`
(`iwasawa-parabolic-integral`), and the Kneser–Tits theorem over a local field
(`kneser-tits-local`), and the algebraic parabolic adjoint determinant comparison
(*parabolic-adjoint-determinant*). Quasi-splitness at almost all places (AA.4.2,
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
characters, reciprocity and the global norm-index theorem. LFunctions supplies
finite-order Hecke analysis through ThetaSeries. RepresentationTheory/InductionRestriction,
layer 6, supplies abstract Brauer induction; the pinned Tau Ceti Brauer, nilpotent monomiality
and induction-transitivity theorems give integral combinations of induced linear characters.
AA supplies the ramified local Artin-factor induction identity, the one-dimensional
Artin–Hecke comparison and analytic assembly. RepresentationTheory/CompactGroups,
layer 5, supplies compact abelian Fourier theory, and its layer 0 supplies the Haar probability
measure of a compact group; on a compact open factor `B_i` it is the restriction of a local Haar
measure normalized as in AA.0. AlgebraicTopology, stages 5–6, supplies the integral cohomology
of products of circles. LocalFieldsRamification, layers 0 (valuations) and 1 (residue units), supplies the local-field
input for the distance of `p`-adic roots of unity from one (AA.4.3). SmoothRepresentationsOfLocalGroups supplies ring-valued Haar measures (SR.1.1)
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
`Multipliable.prod_mul_tprod_compl`. The extension to factor masses that are only summably close
to one is this roadmap's deduction from these lemmas; [Sutherland], §23.3, p. 6, supplies the
normalized product of local Haar measures on boxes whose almost-all factors have mass one.
Integral points of a model are compact open in `G(F_v)`:
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
Mathlib `MeasureTheory.Subgroup.index_mul_measure`, applied with AA.1.5 and AA.0.2. A division ring has no unipotent unit other than `1`
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

The unvalued relative-root core is the `AlgebraicRelativeRoots` layer of the
ReductiveGroupsPartII README (RG2.1), refining ReductiveGroups layer 7.
The characters, roots and relative weight spaces of AA.3.1 use that core's characters and
counit-derivation weight spaces. The relative root data of AA.3.1 identify their finite
support with the same root subtype by the identity on characters. AA adds positive systems,
`a_P`, logarithms and reduction interfaces; RG2 adds valuations and buildings.
AA's local modulus (the product over positive relative roots) agrees with RG2's: the two
products are formed on the identical torus, positive-root set, absolute value and point,
with the same weight multiplicities.

**Checks.** The two local moduli agree on the shared carrier; the empty positive set gives
one, and a single weight of multiplicity two contributes the square.

## Exact supplier contracts

| Object | Exact supplier and file | Use here |
|---|---|---|
| Relative roots and weights | RG2.1 targets `AlgebraicRelativeRoots.Character`, `.Root`, `.weightSpace`; `ReductiveGroupsPartII/README.md` | Shared algebraic carriers extending ReductiveGroups layer 7; AA adds reduction data. The local modulus is RG2.4 `LocalIntegration.modularCharacter_eq_adjointModulus`, `ReductiveGroupsPartII/Suggested.lean`. |
| Geometric torsors and classes | SchemeAndStackFoundations, §§1.15, 2.3: `Torsor.baseChange`, `Torsor.trivial_iff_section`, `Torsor.hom_isIso`, `torsorClasses G := NonabelianH1 (fppfTopology.over S) h_G`, `torsorClasses.mk_eq_base_iff` | AA.4.1 owns the affine coordinate comparison, its naturality and the class-set Hasse statement; no second geometric torsor owner. |
| Finite-image Artin factors | AA.2.4 owns the local factors on inertia invariants, their induction formula, the nonzero leading coefficient at one and its positivity for character lattices (README targets of *convergence-factors* and AA.2.5) | Determinants on inertia invariants and the nonzero leading coefficient at one. |
| Linear Haar scaling | MassFormula, Layer 2 | One generic DVR lattice-index theorem (`q^length`) and linear Haar image law `μ(M A)=|det M| μ(A)`; arbitrary measurable sets require regular Haar measure. AA constructs gauge measures using RG2.0's nonlinear charts and change of variables; gauge forms, scalar-restriction Jacobians and the global discriminant assembly belong to AA. |
| Rational tuple heights | [DiophantineApproximationAndTranscendence, §2.5](../DiophantineApproximationAndTranscendence/README.md#25-absolute-twisted-heights-and-subspace-weights), **Relative Euclidean projective normalization**: its targets `height2`, `arakelovMulHeight` and `arakelovMulHeight_eq_height2` on tuples indexed by a finite type, and `height2_baseExtension` with the relative extension-power transport. This roadmap is the sole supplier; no tuple height is pinned in Tau Ceti. | The relative finite-sup/archimedean-`ℓ²` projective height of the entry tuple of `(ρ(g),ρ(g)⁻¹)` agrees with the adelic height of AA.3.5 (*adelic-height*) on rational points. Its value on the empty tuple is one. AA retains the adelic extension, properness, compact-translation estimates and quantitative counting. |
| Brauer and monomial character induction | RepresentationTheory/InductionRestriction, layer 6; pinned `TauCeti/RepresentationTheory/Induction/Brauer/Induction.lean`: `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary`, `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary`; `TauCeti/GroupTheory/Elementary.lean`: `TauCeti.IsElementary.isNilpotent`; `TauCeti/RepresentationTheory/Induction/Monomial.lean`: `FDRep.exists_character_eq_indClassFun_of_isNilpotent`; `TauCeti/RepresentationTheory/Induction/ClassFunction.lean`: `TauCeti.indClassFun_indClassFun_subgroupOf` | For a finite group over an algebraically closed characteristic-zero field, write every character as an integral combination of characters induced from linear characters of subgroups. AA.2.4 owns the ramified local Artin-factor induction identity, one-dimensional Artin–Hecke comparison and analytic assembly. |
| Finite-order Hecke analysis | LFunctions, Layer 5 for continuation and Layer 7 for nonvanishing: `PrimitiveRayClassCharacter`, `heckeLFunctionC`, `heckeLFunctionC_eq`, `heckeLFunctionC_induced`, `heckeLFunctionC_eq_primitive`, `eulerCorrection`, `heckeLFunction_ne_zero_of_one_le_re` | GlobalNumberFields supplies ray class carriers; ArithmeticDirichletSeries supplies ideal series; ThetaSeries supplies Poisson/Mellin analysis. AA uses the nonzero germ at one for nontrivial primitive finite-order characters. |
| One-dimensional Artin–Hecke comparison | ClassFieldTheory reciprocity, with arithmetic Frobenius, plus the one-dimensional comparison owned by AA.2.4 (*convergence-factors*) | For a finite-order Galois character `χ`, choose its primitive ray class character with value `χ(Frob_v)` at unramified `v`. Match conductor primes using inertia invariants. For a larger modulus multiply the primitive function by LFunctions' `eulerCorrection`; state equality on `Re s > 1` and of meromorphic germs, including ramified factors. |

| Trace discriminants and lattice indices | `NumberField.discr_eq_of_integralBasis`, `TauCeti/NumberTheory/NumberField/Discriminant/OfIntegralBasis.lean`; `Algebra.discr_of_matrix_vecMul`, `Mathlib/RingTheory/Discriminant.lean`; `AddSubgroup.index_eq_natAbs_det`, `Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean` | The local lattice covolumes and archimedean determinants in AA.2.5. |

| Scheme centralizers, normalizers and character evaluation | RG2.1 targets `BruhatTits.GeometricRoots.characterValue`, `BruhatTits.GeometricRoots.characterValue_coe`, `centralizer`, `normalizer`, `centralizerIdeal`, `centralizerIdeal_points_iff`; `TauCetiRoadmap/ReductiveGroupsPartII/README.md` | AA.3.1 spells the same contracts on the unbundled coordinate algebra `H` and the pinned `quotientPointsSubgroup`. The root-ray helper additionally accepts non-root characters and uses the pinned dynamic contraction subgroups. |
| Arithmetic level carrier | `TauCetiRoadmap.AdelicAlgebraicGroups.Reduction.levelArithmetic`; `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean` | `Neat.IsNeatLevel` is stated through it; the arithmetic discreteness, neatness and component results consume the same subgroup. |
| Algebraically closed central-simple splitting | Mathlib `IsSimpleRing.exists_algEquiv_matrix_of_isAlgClosed`, `Mathlib/RingTheory/SimpleModule/IsAlgClosed.lean`; `Algebra.IsCentral`, `Mathlib/Algebra/Central/Defs.lean`; `Module.Basis.baseChange`, `Mathlib/LinearAlgebra/TensorProduct/Basis.lean`. | The `SL₁(D)` target of AA.3.4 uses this matrix splitting and the extended regular basis; its reduced-norm-one Hopf ideal and compact arithmetic quotients are the additional targets. |
| Semialgebraic sets | `TauCeti.IsSemialgebraic`, `TauCeti.isSemialgebraic_def`; `TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean` | AA.3.2 uses this exact polynomial set algebra on matrix-entry coordinates; the new assertions concern the horospherical graph, windows and reduced forms. |
| Adjoint weight spaces | `Derivation.adjointWeightSpace`, `Derivation.mem_adjointWeightSpace_iff_universalPointAction`, `Derivation.isInternal_adjointWeightSpace`; `TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean` | The relative weight spaces of AA.3.1 instead realize the geometric weight space inside counit derivations for a Hopf-ideal split torus; the supplier uses the cotangent dual and a specified split-torus coordinate map. |
| Derived subgroup | `TauCeti.CommHopfAlgCat.derivedDefiningIdeal`; `TauCeti/Algebra/AlgebraicGroup/Derived/Basic.lean`; RG2.1 tests `ZExtension.derivedIdeal_gl_n`, `ZExtension.derivedIdeal_sl_n`, `TauCetiRoadmap/ReductiveGroupsPartII/README.md` | The anisotropy criterion of AA.3.4 specifies the derived Hopf ideal by this universal property (largest ideal killed by every algebra-valued commutator) and tests all rational cocharacters; no independent derived-subgroup definition. |
| Geometric identity component | `TauCeti.HopfAlgebra.identityComponentHopfIdeal`; `TauCeti/Algebra/AlgebraicGroup/Connected/Comultiplication.lean` | This supplier assumes an algebraically closed field. The finite-volume criterion of AA.3.4 gives the number-field descent by the largest geometrically connected closed subgroup; the disconnected case of that criterion uses its ideal. |
| Constant-form matrix subgroup | `TauCeti.ConstantForm.definingHopfIdeal`, `TauCeti.ConstantForm.mem_definingPointsSubgroup_iff`; `TauCeti/Algebra/AlgebraicGroup/ConstantForm/Basic.lean` | The twisted orthogonal group of AA.3.7 is the determinant-one restriction of this equation for its explicit rational form; it does not define another general orthogonal-group construction. |
| Connected reductivity | `TauCeti.reductiveCommHopfAlgProperty`; `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean` | The reductive groups with finite component groups of AA.3.3 drop connectedness in characteristic zero for the Borel–Harish-Chandra statements. |
| Homogeneous quotient sheaf | `CommHopfAlgCat.fppfHomogeneousQuotient`; `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean` | The affine quotients of AA.3.3 add an affine faithfully flat realization with exact scheme fibres. Inversion identifies the supplier’s `G/H` convention with `H\G` here. |
| Matrix points | `TauCeti.GeneralLinear.pointsMulEquiv`, `TauCeti.AlgHom.mapDomain`; `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/FunctorOfPoints.lean`, `TauCeti/Algebra/AlgebraicGroup/Hopf/Map.lean` | The matrix points of a rational representation in AA.3.3 are their composition for a specified coordinate representation, not a separate point construction. |
| Quaternion reduced norm | `QuaternionAlgebra.normForm`, `QuaternionAlgebra.normForm_apply`, `QuaternionAlgebra.normForm_mul`; `TauCeti/Algebra/Quaternion/NormForm.lean`. `QuaternionAlgebra.normForm_eq_of_algEquiv`; `TauCeti/Algebra/Quaternion/AlgEquiv.lean`. `TauCeti.QuaternionAlgebra.baseChange`; `TauCeti/Algebra/Quaternion/BaseChange.lean` | The norm-image theorems use this quadratic form directly. For a presentation `D ≃ ℍ[F,a,b]` and a commutative `F`-algebra `A`, the unit norm `Nrd_A : (D ⊗[F] A)^× → A^×` is `normForm` over `A` transported along `baseChange`; it is multiplicative by `normForm_mul` and independent of the presentation by `normForm_eq_of_algEquiv`, since `2` is invertible in `F`. AA.4.6 (*quaternion-norm-images*) owns its naturality in `A` and the determinant comparison under a splitting. |
| Idele norm | `TauCeti.GlobalNumberFields.ideleNorm`, `TauCeti.GlobalNumberFields.continuous_ideleNorm`, `TauCeti.GlobalNumberFields.ideleNorm_unitEmbedding`; `TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Basic.lean` | `H_G` takes the real logarithm of this norm; multiplicativity and positivity come from the supplier's homomorphism into positive units. |
| Compact norm-one idele classes | `TauCeti.GlobalNumberFields.IdeleClassGroup.isCompact_normOne`; `TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Compact.lean` | Supplies the compactness assertion in Layer 5 directly. |
| Finite-factor decomposition | `TauCeti.awayDecomposition`, `TauCeti.continuous_awayDecomposition`, `TauCeti.continuous_awayDecomposition_symm`; `TauCeti/Topology/Algebra/RestrictedProduct/Away/Decomposition.lean` | The finite splitting of AA.0.3 and AA.1.2 bundles these as a topological group equivalence on finset-indexed factors; the new assertion is measure compatibility. |
| Restricted-product coordinate maps | `TauCeti.restrictedProductCongr_apply`; `TauCeti/Topology/Algebra/RestrictedProduct/Congr/Basic.lean`. `TauCeti.awayDecomposition_fst`, `TauCeti.awayDecomposition_snd`, `TauCeti.awayDecomposition_symm_apply_of_mem`, `TauCeti.awayDecomposition_symm_apply_of_notMem`; `TauCeti/Topology/Algebra/RestrictedProduct/Away/Decomposition.lean` | Supply the coordinate formulas of the bundled topological equivalences. |
| Modular character under conjugation | `MeasureTheory.Measure.modularCharacter`; `Mathlib/MeasureTheory/Group/ModularCharacter.lean`, with `map_mul` and `map_inv` | Its commutative codomain makes conjugation invariance a general homomorphism identity. |
| Measurable fundamental domains | `MeasureTheory.Measure.exists_isFundamentalDomain_of_properlyDiscontinuousSMul`; `TauCeti/MeasureTheory/Group/ProperlyDiscontinuous.lean` | Apply to the countable discrete rational subgroup acting freely by translation; its Borel domain supplies the existence statement directly. |
| Exponential tail integral | `integral_exp_mul_Ioi`; `Mathlib/Analysis/SpecialFunctions/ImproperIntegrals.lean` | Finite-product integration gives the relative-chamber integral. |
| Change of double-coset level | `DoubleCoset.quotientMapOfLELeft`; `TauCeti/GroupTheory/DoubleCoset/Map.lean` | The level map here changes the right subgroup; its defining equation sends the class of `g` to the class of the same `g`. |


All names in this section are part of the dependency contract. Each is cited again in the
*Needs* clause of the target that consumes it.

### Local analytic and parabolic suppliers

The local charts, their cotangent comparison and their Haar change of variables belong to
ReductiveGroupsPartII RG2.0. RG2.4 then supplies the local adjoint-modulus theorem and its
parabolic determinant reduction; AA.2.2 consumes these local results, and AA.2.4 consumes the
same RG2.0 charts for gauge measures. SmoothRepresentationsOfLocalGroups SR.2.2 consumes RG2.4
and supplies the change to coefficient-valued moduli and the square root for normalized induction.
The local supplier order is RG2.0 charts → RG2.4 local modulus → AA.2.2 and SR.2.2;
AA.2.4 gauge measures use RG2.0 charts independently. The roadmap dependency order is
ReductiveGroupsPartII before AdelicAlgebraicGroups and SmoothRepresentationsOfLocalGroups;
AA's local modulus comparison has no dependency on SR.

**Local analytic chart supplier.** (RG2.0, *smooth-group-analytic-charts*) For every
nondiscrete locally compact field `K` of characteristic zero and smooth affine finite-type
`K`-group `G = Spec H` of dimension `d`, construct an analytic manifold structure on `G(K)`
inducing the evaluation topology of RG2.0. Construct charts from smooth local parameters
using the local inverse function theorem; multiplication and inversion are analytic.
Identify the tangent space at the identity with the `K`-linear dual of
`TauCeti.Bialgebra.CotangentSpace K H`, with the derivative of a coordinate function equal
to evaluation on its cotangent class. Prove analytic change of variables for analytic
isomorphisms of open chart domains, with normalized absolute determinant and product
additive Haar measure. ReductiveGroupsPartII RG2.0 owns this bridge
([Platonov–Rapinchuk–Rapinchuk], §3.1,
Theorem 3.2 and Proposition 3.3, pp. 128–130, and the local-parameter and measure
constructions on pp. 192–196).
*Needs:* ReductiveGroupsPartII, RG2.0 (point topology); Tau Ceti
`TauCeti.Bialgebra.CotangentSpace` and `Derivation.cotangentLinearEquiv` (cotangent duality),
`Algebra/AlgebraicGroup/Tangent/Cotangent.lean`; Mathlib additive Haar measure and
`HasStrictFDerivAt.toOpenPartialHomeomorph`. The product additive measure is formed locally;
no adelic measure or RG2.4 modulus theorem is an input. At a nonarchimedean place use
`vol(𝒪_K) = 1`, over `ℝ` use `dx`, and over `ℂ` use `2 dx dy` and the squared modulus.
For a Borel set `B` in the source of an analytic chart isomorphism `f`, the image law is
`μ_d(f(B)) = ∫_B |det Df(x)|_K dμ_d(x)`; for a linear isomorphism `A`, its pushforward
is `A_*μ_d = |det A|_K⁻¹ μ_d`.
*Lean:* none; specified in the README only.

**Checks.**

- `G_a(K)` has its standard coordinate, whose derivative is the identity.
- `G_m(K)` is the open subset `K^×` with coordinate `T`; at `1` its derivative is
  dual to the class of `T − 1`.
- On `ℚ₃`, multiplication by `3` has image factor `1/3` and pushforward factor `3`.
  RG2.0 *equal-characteristic-smooth-group-analytic-charts* gives the same two factors
  for multiplication by `t` on `𝔽₃((t))`, with no characteristic-zero argument.
- The trivial group has dimension zero; its chart is the singleton `K^0` and the
  empty Jacobian determinant is `1`.

**Parabolic adjoint determinant supplier.** (RG2.4, *parabolic-adjoint-determinant*)
For a connected reductive group `G` over a field `E`, a parabolic `P = M ⋉ N` and
`p ∈ P(E)`, supply the algebraic identity
`det(Ad(p)|Lie P) = det(Ad(p)|Lie N)`. Use the `P`-stable exact sequence
`0 → Lie N → Lie P → Lie M → 0`, where the action on the quotient factors through
`P → M`. The adjoint determinant of the connected reductive Levi is the trivial
algebraic character: after scalar extension to an algebraic closure, its maximal-torus
weights consist of zero weights and opposite root pairs, whose product is one; a
character of a connected reductive group trivial on that torus is trivial. Descend the
identity to `E`. This proves equality in `Eˣ` in every characteristic, before taking
absolute values; local Haar unimodularity alone only gives an absolute-value identity.
This is a deduction from [Conrad RGS], §1.2, equation (1.2.1), p. 16
(the root-weight decomposition in arbitrary characteristic), and Proposition 1.4.7,
pp. 35–36 (parabolics and Levi factors), with ReductiveGroups layer 7's parabolic/Levi
theory. Together with `LocalIntegration.modularCharacter_eq_adjointModulus`
it gives the local formula `Δ_P(p) = |det(Ad(p)|Lie N)|_E` used by AA and SR
([Casselman], §1.5, p. 16). *Needs:* ReductiveGroups layers 4, 6–7 (characters,
reductive structure, root spaces and Levi decomposition); RG2.1's shared adjoint-weight
carriers; Tau Ceti `Derivation.adjointAction`; Mathlib `LinearEquiv.det`.
*Lean:* none; specified as a supplier contract in the README only.

**Checks.**

- For the upper Borel of `GL₂`, the determinants on `Lie P` and `Lie N` at
  `diag(a,d)` are both `a/d`, even though `Lie P` has dimension three and `Lie N` one.
- For the lower Borel they are both `d/a`; at `diag(3,1)` over `ℚ₃` the
  absolute determinants are `3`, while the upper Borel gives `1/3`. At `diag(t,1)`
  over `𝔽₃((t))` the same lower and upper values are `3` and `1/3`.
- For `P = G`, `N = 1`: the determinant on the zero Lie algebra is one, and the
  adjoint determinant of `G` is one as an algebraic character.

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
`MeasureTheory.Subgroup.index_mul_measure`,
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
obstructions only). LFunctions supplies primitive finite-order Hecke continuation in Layer 5,
using ThetaSeries, and nonvanishing in Layer 7; AA assembles finite-image Artin functions.
ClassFieldTheory, layers 11–12
(quadratic idele characters, reciprocity, the global norm-index theorem). AlgebraicTopology,
stages 5–6 (integral cohomology of products of circles). LocalFieldsRamification, layers 0–1
(valuations and residue units, the input for the distance of `p`-adic roots of unity from one).
SmoothRepresentationsOfLocalGroups, SR.1.1; RG2.4 local integration. IntegralLattices, 2F–2G. FuchsianOrbifolds,
layers 0, 1, 4 and 5.

### Analytic and integral dependencies

AA.2.4 builds the finite reductive-group order formula from [Dudas–Michel],
Propositions 7.12(iii) and 7.14, pp. 27–28. AA.4.2 builds the `ℚ_p`-analytic
closed-subgroup input of [Platonov–Rapinchuk–Rapinchuk], Theorem 3.12, p. 136. The integral
models in AA.4.6 and *isotropic-almost-everywhere* require reductive fibres after
inverting finitely many primes. These inputs need the generality specified at each use.

## How to read the build

`README.md` is normative; `Suggested.lean` states headline milestones against the pinned
Mathlib and Tau Ceti, with the auxiliary definitions needed to state them. It is not exhaustive.
Each target's *Lean:* line identifies its statement or auxiliary definitions there; *Lean:* none
means that the target is specified in this README. Checks are mathematical examples in prose.
The RG2.0 analytic chart suppliers precede RG2.4 local integration,
which is an input to AA.1.5 and AA.2.2. The AA layers are built in order, with the
number-field level definitions of AA.5.2 accompanying AA.1.5's local factors; their
quotient applications follow AA.4. AA.0 is the Borel
structure and the Haar measures of a restricted product and of the adeles and ideles; everything measure-theoretic later
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
groups with their Borel sigma algebras, and `B_i` open subgroups compact at almost every index.
Measures `μ_i` are left Haar unless a target explicitly allows general measures. Purely topological finite-splitting results
allow arbitrary index sets. Use the restricted-product carrier and topology already in Mathlib.
Build its Borel structure from countably many open principal pieces, put probability measures on
the compact tails, and glue compatible level measures. The convergent rescaling construction
handles the non-unit local volumes needed for Tamagawa measure.

### 0.1 Borel structure and local normalization

- **The restricted product of countably many second countable groups is second countable.** Let
  `ι` be countable, let each `G i` be a second countable topological group and each `B i` an open
  subgroup of `G i`. Prove that `Πʳ i, [G i, B i]` is second countable, and consequently that its
  Borel σ-algebra is generated by the boxes `Π i, C i` with `C i` open in `G i` and `C i = B i`
  for all but finitely many `i`. Both statements are this roadmap's deduction from the two
  Mathlib inputs below; [Sutherland], §23.3, p. 6, uses such boxes to define the adelic measure.
  *Needs:* Mathlib
  `RestrictedProduct.topologicalSpace_eq_iSup`, `RestrictedProduct.isOpenEmbedding_inclusion_principal`.
  *Lean:* none; specified in the README only.
- **Borel structure on a restricted product.** For the data of AA.0, give
  `Πʳ i, [G i, B i]` the Borel σ-algebra, making it a `BorelSpace`, and write
  `box C = {x | ∀ i, x i ∈ C i}` for a family of subsets `C i ⊆ G i`. Prove that each coordinate
  map `x ↦ x i` is measurable; that for Borel `C i` with `C i = B i` for all but finitely many
  `i`, the box `{x | ∀ i, x i ∈ C i}` is measurable; that the inclusion of each principal piece
  `Πʳ i, [G i, B i]_[𝓟 S]` is measurable; and that for countable `ι` the Borel σ-algebra is
  generated by the boxes with open factors. With it the
  restricted product is a Borel space in which every open subgroup `U_S`, every such box and
  every inclusion of a principal piece is measurable ([Sutherland], §23.3, p. 6). *Needs:* AA.0.1;
  Mathlib `RestrictedProduct.topologicalSpace_eq_iSup`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The set `{x | ∀ i, x i ∈ B i}` is measurable.
  - For `ι = ℕ`, `G i = ℤ/4` and `B i = 2ℤ/4`, the singleton `{0}` is neither open nor a box with
    cofinitely trivial factors, but it is measurable: it is the decreasing intersection over `n`
    of the boxes with factor `{0}` at the indices below `n` and `B i` elsewhere.
  - A σ-algebra generated by the open subgroups `U_S` and their cosets alone would not contain
    that singleton; a definition built from them fails this test.
  - `box univ = univ`, a box with one empty factor is empty, and the integral box equals
    the empty level.
- **Normalized local Haar measures and their character.** (*local-haar-character*)
  For any field `E` with `IsNonarchimedeanLocalField E`, let `q = Nat.card 𝓀[E]` and let
  `v_E : E^× → ℤ` be the additive reading of `TauCeti.normalizedValuation E`, with
  `v_E(ϖ) = 1`. Prove uniqueness of regular additive Haar measure `μ_E` with
  `μ_E(𝒪[E]) = 1`, and
  `MeasureTheory.distribHaarChar E a = q^{−v_E(a)}` for `a ∈ E^×`. Consequently
  `map (a * ·) μ_E = q^{v_E(a)} • μ_E`. For the pinned norm on `v.adicCompletion K`,
  this character is `‖a‖₊`, since that norm uses `q = Ideal.absNorm v.asIdeal`
  ([Platonov–Rapinchuk–Rapinchuk], §3.5, pp. 186–187; [Sutherland], §23.3, p. 6).
  *Needs:* Tau Ceti `IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion`,
  `TauCeti.normalizedValuation`; Mathlib `MeasureTheory.distribHaarChar`,
  `MeasureTheory.distribHaarChar_mul`, `MeasureTheory.Subgroup.index_mul_measure`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - A uniformizer has character `q⁻¹`; its multiplication map pushes `μ_E` to `q • μ_E`.
  - Every valuation-ring unit has character `1` and preserves additive Haar measure.
  - For `E = 𝔽_q((t))` the character of `t` is `q⁻¹`, in positive characteristic too.
  - At a prime of residue degree `f` in a number field, a uniformizer has character
    `p^{−f}`, rather than `p⁻¹` when `f > 1`.

- **Linear Haar change of variables on module spaces.** (*linear-haar-change-of-variables*)
  Let `E` be as above, `V` a finite-dimensional `E`-vector space with its module topology,
  `μ` a regular additive Haar measure on `V`, and `T : V ≃ₗ[E] V`. Prove
  `map T μ = |det T|_E⁻¹ • μ`, where `|·|_E = TauCeti.normalizedAbsoluteValue E`.
  Transport the coordinate-space formula through a basis and prove independence of that
  basis and of the Haar normalization. The coordinate formula is supplied by
  ReductiveGroupsPartII, RG2.0, *smooth-group-analytic-charts* in characteristic zero and
  *equal-characteristic-smooth-group-analytic-charts* in positive characteristic; this target is
  its basis-independent module-space adapter ([Platonov–Rapinchuk–Rapinchuk], §3.5,
  pp. 186–187, modulus of an automorphism; apply the coordinate formula to `T⁻¹`).
  *Needs:* those RG2.0 targets; Mathlib `Module.Basis`, `LinearMap.det`, `IsModuleTopology`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - On `E²`, `diag(ϖ,1)` has image factor `q⁻¹` and pushforward factor `q`.
  - A change of integral basis in `GL_d(𝒪[E])` preserves the normalized lattice measure.
  - For `dim V = 0`, the empty determinant is `1` and the map preserves the Haar measure.

### 0.2 Compatible measures on principal pieces

- **Product measure on a level subgroup.** (*level-measure*) Let `S ⊂ ι` be finite with `B i`
  compact and `μ i (B i) = 1` for `i ∉ S`, where `μ i` is a left Haar measure on `G i`. On
  `U_S = Π_{i∈S} G i × Π_{i∉S} B i` define the level measure `μ_S`
  as the product of the finite product measure `Measure.pi (fun i : S => μ i)` and the infinite
  product measure `infinitePi (fun i : ι∖S => μ i restricted to B i)`, each factor a probability
  measure on the compact group `B i`. Prove that `μ_S` of a box
  with factors `C i` for `i ∈ S` and `B i` for `i ∉ S` is `∏_{i∈S} μ i (C i)`,
  that `μ_S` is a left Haar measure on the topological group
  `U_S`, and that if every `B i` is compact and
  `μ i (B i) = 1` for all `i`, then `μ_∅` is a probability measure ([Sutherland], §23.3, p. 6;
  [Borel], §5.5, p. 21). *Needs:* Mathlib `MeasureTheory.Measure.pi`,
  `MeasureTheory.Measure.infinitePi`, `MeasureTheory.Measure.prod`,
  `RestrictedProduct.isOpenEmbedding_structureMap`,
  `RestrictedProduct.isOpenEmbedding_inclusion_principal`; AA.0.1.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `S = ∅` and `μ i (B i) = 1` for all `i`, `μ_∅ (univ) = 1`.
  - For `S = {i₀}` and a measurable `C ⊆ G i₀`, `μ_S {x | x i₀ ∈ C} = μ i₀ (C)` even when
    `μ i₀ (B i₀) ≠ 1`: for `G i₀ = ℤ/4` with counting measure, `B i₀ = 2ℤ/4` and `C = {0}` the
    value is `1`.
  - A construction that also normalized the factors in `S` would give `1/2` in that example;
    the level measure does not renormalize the exceptional factors.
  - The level subgroup `U_S` for `S` the whole index set is the whole group; at a singleton
    level only that coordinate is unrestricted; an element outside one integral subgroup is
    rejected by the empty level.
- **Compatibility of level measures.** For finite `S ⊆ S'` as in *level-measure*, with
  `μ i (B i) = 1` for `i ∉ S`, prove that the restriction of `μ_{S'}` to the open subgroup
  `U_S ⊂ U_{S'}` equals `μ_S` ([Borel], §5.5, p. 21). *Needs:* AA.0.2; Mathlib
  `MeasureTheory.Measure.infinitePi_map_restrict`, `MeasureTheory.Measure.pi_pi`.
  *Lean:* none; specified in the README only.
- **Directed suprema of compatible measures.** Let `X` be a measurable space, `(U_S)` a countable
  directed family of measurable sets covering `X`, and `ν_S` measures with `ν_S` supported on
  `U_S` and `ν_{S'}|_{U_S} = ν_S` for `S ⊆ S'`. Prove that `E ↦ sup_S ν_S(E ∩ U_S)` is a measure
  `ν` on `X` with `ν|_{U_S} = ν_S` for every `S`, and that it is the unique measure with this
  property ([Borel], §5.5, p. 21). *Needs:* Mathlib measure theory.
  *Lean:* none; specified in the README only.
- **Restricted product of Haar measures.** (*restricted-haar-product*) Given left Haar measures
  `μ i` on `G i` with `μ i (B i) = 1` for all but finitely many `i`, construct
  the measure `μ = ∏ʳ μ i` on `Πʳ i, [G i, B i]` given
  `hμ : ∀ᶠ i in cofinite, μ i (B i) = 1`, as the supremum of the directed family of measures
  `(U_S ↪ Πʳ)_* μ_S`. Prove that it is the unique Borel measure whose restriction to each open
  subgroup `U_S` (for `S` finite and containing the finitely many `i` with `μ i (B i) ≠ 1` or
  `B i` not compact) is `μ_S`: for admissible
  finite `S`, the restriction of `∏ʳ μ i` to `U_S` is `μ_S`, and
  a Borel measure whose restriction to every
  admissible `U_S` is `μ_S` equals `∏ʳ μ i`. Prove further that `∏ʳ μ i` of a
  box `Π i, C i` with `C i = B i` cofinitely equals `∏ᶠ i, μ i (C i)`,
  that `∏ʳ μ i` is a left Haar measure, and that
  for positive finite real `c_i` equal to `1` cofinitely,
  rescaling `μ_i` by `c_i` rescales the product by `∏ᶠ c_i` (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189; [Borel],
  §5.5, p. 21). The Lean statement is the existence-and-uniqueness form: when `B i` is compact
  for all but finitely many `i`, there is a unique left Haar measure on `Πʳ i, [G i, B i]` giving
  every measurable box whose factors are cofinitely `B i` the mass `∏ᶠ i, μ i (C i)`.
  *Needs:* AA.0.2; AA.0.1.
  *Lean:* `RestrictedHaar.exists_unique_haarProduct`.

  **Checks.**
  - If `μ i (B i) = 1` for every `i`, then `∏ʳ μ i` of `{x | ∀ i, x i ∈ B i}` is `1`.
  - If some factor has infinite total mass (as `μ_p` on `ℚ_p`), then `∏ʳ μ i` has infinite total
    mass; it is not an infinite product of probability measures.
  - One exceptional integral factor of mass `2` gives integral-box mass `2`; two exceptional factors of masses `2` and `3` give `6`.

- **Restriction of the restricted product measure to a level.** For every finite `S` containing
  the exceptional indices, prove `(∏ʳ μ i).restrict U_S = (U_S ↪ Πʳ)_* μ_S`, and that `∏ʳ μ i`
  is the unique measure with this property (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189). *Needs:* AA.0.2.
  *Lean:* none; specified in the README only.

  **Checks.**
  - At the empty level, restriction is the pushforward of the integral-level probability.
  - At a singleton exceptional level whose integral box has mass `2`, both sides of the
    restriction/pushforward identity give that box mass `2`, without division by `2`.
  - For a finite index set and the full level, the restriction disappears and the pushforward
    is the whole product measure.

- **Measure of a box.** For Borel sets `C i ⊂ G i` with `C i = B i` for all but finitely many
  `i`, prove `∏ʳ μ i (Π i, C i) = ∏ᶠ i, μ i (C i)`, the product being finite because almost all
  factors equal `1` (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189). *Needs:* AA.0.2; Mathlib
  `MeasureTheory.Measure.pi_pi`.
  *Lean:* `RestrictedHaar.exists_unique_haarProduct` (the determining box formula).
- **The restricted product measure is a Haar measure.** Prove that `∏ʳ μ i` is a left Haar
  measure on the locally compact group `Πʳ i, [G i, B i]`, and that if every `μ i` is also right
  invariant then `∏ʳ μ i` is right invariant (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189). *Needs:* AA.0.2;
  Mathlib `RestrictedProduct.locallyCompactSpace_of_group`, `RestrictedProduct.isTopologicalGroup`,
  `MeasureTheory.Measure.IsHaarMeasure`.
  *Lean:* `RestrictedHaar.exists_unique_haarProduct` (left Haar property).


  **Checks.**
  - Left translation by any restricted-product element preserves the actual measure.
  - Every compact set has finite mass, even when the entire group
    has infinite mass.
  - Every nonempty open set has positive mass; in particular the
    normalized integral box has mass `1`, whereas the zero measure fails this condition.

### 0.3 Products, transport and changes of normalization

- **Change of local normalizations.** If `μ′_i = c_i μ_i`, where `0 < c_i < ∞` and `c_i = 1`
  outside a finite set, prove that the normalized restricted Haar products satisfy
  `∏ʳ μ′_i = (∏ᶠ c_i) ∏ʳ μ_i` ([Rosengarten], §1, p. 2). An infinitely rescaled family needs the
  separately stated convergent-product construction below; finite rescaling alone gives no such
  theorem. *Needs:* AA.0.2.
  *Lean:* none; specified in the README only.

  **Checks.**
  - Unit local scalars preserve the measure.
  - Rescaling one local factor by `2` rescales the adelic measure by `2`.
  - Rescaling two distinct local factors by `2` and `1/2` preserves the measure.

- **Changing the restricting subgroups at finitely many places.** Let `B' i ≤ G i` be open
  subgroups with `B' i = B i` for all but finitely many `i`. Prove that the identity on
  `Π i, G i` restricts to an isomorphism of topological groups
  `Πʳ i, [G i, B i] ≃ₜ* Πʳ i, [G i, B' i]`, under which `∏ʳ μ i` corresponds to `∏ʳ μ i` (the
  normalization condition being cofinite); thus the restricted product and its measure depend
  only on the `B i` up to finitely many indices ([Conrad], Theorem 3.6, p. 6). *Needs:* AA.0.2;
  Mathlib `RestrictedProduct.topologicalSpace_eq_iSup`, `RestrictedProduct.continuous_dom`.
  *Lean:* none; specified in the README only.
- **Fubini for restricted product measures.** Under the finite splitting, prove that `∏ʳ_ι μ i`
  corresponds to `(Measure.pi (fun i : S => μ i)).prod (∏ʳ_{ι∖S} μ i)`, hence that for `f`
  integrable on `Πʳ i, [G i, B i]` for `∏ʳ μ i`,

  `∫ f ∂(∏ʳ μ i) = ∫_{Π_{i∈S} G i} ∫_{Πʳ_{ι∖S}} f(x_S, x^S) dμ^S dμ_S`

  ([Borel], §5.5, p. 21). *Needs:* AA.0.3; AA.0.2; Mathlib
  `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`, `MeasureTheory.integral_prod`.
  *Lean:* none; specified in the README only.
- **Integral of a factorizable function.** Let `f i : G i → ℂ` be integrable, with `f i` the
  indicator of `B i` for all but finitely many `i`. Prove that `f(x) = ∏ i, f i (x i)` is a
  well-defined integrable function on `Πʳ i, [G i, B i]` and that
  `∫ f ∂(∏ʳ μ i) = ∏ᶠ i, ∫ f i ∂μ i` (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189). *Needs:* AA.0.3; AA.0.2.
  *Lean:* none; specified in the README only.

  **Checks.**
  - With no factors, the integral of the empty product over the one-point group is `1`.
  - On one copy of `C₂` with counting measure, the constant function `2` has integral `4`.
  - On two copies of `C₂`, constants `2` and `3` have product integral `4 · 6 = 24`.
    These finite measures are sigma-finite and the functions integrable;
    probability normalization would incorrectly give `2` and `6` in the last two cases.

- **Restricted products of unimodular groups are unimodular.** If every `G i` is unimodular
  (`modularCharacter G i = 1`), prove that `Πʳ i, [G i, B i]` is unimodular; more generally the
  modular character of the restricted product is `x ↦ ∏ᶠ i, Δ_{G i}(x i)`, a finite product
  because `x_i` belongs to `B_i` at almost every index and those `B_i` are compact at almost every
  index ([Borel], §5.5, p. 21). *Needs:* AA.0.2; Mathlib `MeasureTheory.Measure.modularCharacter`.
  *Lean:* none; specified in the README only.
- **Functoriality of restricted product measures.** Let `φ i : G i ≃ₜ* G' i` be isomorphisms of
  topological groups with `φ i (B i) = B' i` for all but finitely many `i`. Prove that the
  induced isomorphism `Φ = RestrictedProduct.map φ` of restricted products satisfies
  `Φ_*(∏ʳ μ i) = ∏ʳ (φ i)_* μ i`. This is an owned deduction from the box formula and
  uniqueness in AA.0.2: inverse images of boxes have coordinate inverse images, so the
  pushforward has the required box masses. [Rosengarten], Lemma 3.5, p. 26, gives the
  specialization induced by a morphism of affine finite-type schemes over a global field.
  *Needs:* AA.0.2; Mathlib
  `RestrictedProduct.mapAlong_continuous`, `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.
  *Lean:* none; specified in the README only.
  **Checks.**
  - The identity family preserves every box mass.
  - On one copy of `C₄` with counting measure, inversion preserves the mass `2` of `{0,2}`.
  - On one copy of the additive real group, `x ↦ 2x` sends Lebesgue measure to half
    Lebesgue measure; the interval `[0,2]` has pushforward mass `1`.

- **Convergent restricted products of local Haar measures.** Let `ι` be countable, each `G_i` a
  second countable locally compact Hausdorff group with a left Haar measure `μ_i`, `B_i ≤ G_i`
  open subgroups, and `S ⊂ ι` finite with `B_i` compact for every `i ∉ S`. Put
  `a_i = μ_i(B_i) ∈ (0, ∞)` for `i ∉ S`, suppose `∑_{i∉S} |a_i − 1| < ∞`, and let
  `C_S = ∏_{i∉S} a_i > 0`. Define the convergent Haar product as `C_S` times the
  normalized restricted Haar product of `μ_i` for `i ∈ S` and `a_i⁻¹ μ_i` for `i ∉ S`. Prove
  that enlarging the finite
  exceptional set leaves the measure unchanged, so the construction is independent of `S`;
  that the convergent product is a nonzero
  Haar measure; and that if `C_i = B_i` off finite
  `T ⊃ S`, its box mass is `(∏_{i∈T} μ_i(C_i)) · ∏_{i∉T} a_i` (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189;
  Mathlib summable series and logarithms supply the convergence). *Needs:* AA.0.2; AA.0.3; Mathlib
  summable series and logarithms.
  *Lean:* `RestrictedHaar.exists_unique_convergentHaarProduct`.

  **Checks.**
  - When every tail mass `a_i = 1`, the measure equals the restricted product `∏ʳ μ_i`.
    Its integral box has mass `∏_{i∈S} μ_i(B_i)`, which is one when all exceptional integral
    masses are one. A single `C₄` factor with counting measure, `B = {0,2}` and `S` the
    whole index set has empty tail and integral box mass `2`.
  - For `SL_2` good factors `a_v = 1 − q_v⁻²`, the tail contributes their positive infinite
    product, strictly less than `1` for a nonempty tail. The full integral box mass also
    includes the exceptional integral masses; eventual equality to `1` is unnecessary.
  - Rescaling exactly one normalized factor by `c > 0` multiplies the whole measure by `c`.
  - The normalized family (`μ_i` for `i ∈ S`, `a_i⁻¹ μ_i` for `i ∉ S`) leaves a factor in the
    exceptional set unchanged.
  - A factor whose integral subgroup has mass `1` is unchanged even in the tail.
  - A tail factor of mass `2` becomes `(1/2)μ`, while the global product retains the compensating
    factor `2`.

- **Independence under finite changes of integral subgroups.** With `ι` countable, each `G_i` a
  second countable locally compact Hausdorff group with a left Haar measure `μ_i`,
  `B_i, B′_i ≤ G_i` open subgroups, `S ⊂ ι` finite with `B_i = B′_i` compact for every `i ∉ S`,
  and `∑_{i∉S} |μ_i(B_i) − 1| < ∞`, prove that changing the compact open `B_i` at finitely many
  indices transports the convergent Haar product to the same measure on the canonically
  identified restricted product (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189). *Needs:* AA.0.3.
  *Lean:* none; specified in the README only.


  **Checks.**
  - On one copy of `C₄`, the identity change preserves counting measure of total mass `4`.
  - Changing its restricting subgroup from `C₄` to `{1}` still transports counting measure
    of mass `4`.
  - On two copies, changing both restricting subgroups from `C₄` to `{1}` preserves mass `16`.
    The exceptional set is the full finite index set in these examples;
    normalizing the changed subgroups would give the wrong masses.

### 0.4 Adeles and ideles

- **Second countability and the adelic Borel structure.** (*adelic-borel-structure*)
  For every number field `K`, prove and register `SecondCountableTopology` for
  `𝔸_{K,f}`, `K_∞`, `𝔸_K`, their native units groups, and `GL_n` over each ring for every
  finite `n`. Give the finite and infinite adeles their Borel σ-algebras and the full
  adeles their product σ-algebra; prove `BorelSpace` for this product. On units and matrix
  units use the Borel σ-algebra of the native units topology. The embedding
  `u ↦ (u,u⁻¹)` transfers second countability from the product, including for the adelic
  rings where units do not carry the subspace topology of the ring. These are proved
  instances, with no second-countability or Borel-agreement assumptions left to consumers.
  The finite-place proof uses the countable dense image of `K` in each metrizable completion
  and AA.0.1; the infinite-place proof uses the finite product of real and complex completions
  ([Platonov–Rapinchuk–Rapinchuk], Lemma 3.63, pp. 188–189, countable restricted-product
  topology; Mathlib `Units.isEmbedding_embedProduct` and `Prod.borelSpace`).
  *Needs:* AA.0.1; GlobalNumberFields, layers 4–5; RG2.0
  *general-linear-points-homeomorphism* for the comparison with algebraic-group points.
  *Lean:* none; specified in the README only.

  **Checks.**
  - A product of an infinite Borel set and a finite-adele Borel set is adelic Borel.
  - For `n = 1`, the matrix-units topology and Borel structure agree with those of the ideles.
  - For `n = 0`, `GL₀(𝔸_K)` is a singleton and is second countable.

- **Normalized Haar measure on the finite adeles.** (*finite-adele-haar*) For a number field `K`,
  define the measure `μ_f` on `𝔸_{K,f} = FiniteAdeleRing (𝓞 K) K`, as
  the additive Haar measure normalized by `μ_f(∏_v 𝒪_v) = 1` (Mathlib's `addHaarMeasure` at the
  compact open subring `∏_v 𝒪_v`), and prove that it is
  the restricted product of the additive Haar measures `μ_v` on `K_v` normalized by
  `μ_v(𝒪_v) = 1`, where each `K_v` is a nonarchimedean local field and `𝒪_v` its compact open
  valuation ring: a measurable box with factors `C_v`, equal to `𝒪_v` for all but finitely many
  `v`, has mass `∏ᶠ_v μ_v(C_v)`. Prove that
  `μ_f (∏_v 𝒪_v) = 1`, that it is an additive Haar measure, and that for a finite
  idele `a`, `map (a * ·) μ_f = (∏_v |a_v|_v)⁻¹ • μ_f` (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189).
  *Needs:* AA.0.2; Mathlib `IsDedekindDomain.FiniteAdeleRing`; Tau Ceti
  `IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion`;
  GlobalNumberFields, layer 4; AA.0.1.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For a nonzero ideal `𝔞` of `𝓞 K`, the closure of `𝔞` in `∏_v 𝒪_v` has measure
    `(Ideal.absNorm 𝔞)⁻¹`.
  - `μ_f` is not a finite measure: `𝔸_{K,f}` is a disjoint union of infinitely many
    translates of `∏_v 𝒪_v`.
  - For a prime above `2` in `ℚ`, the box with factor `2ℤ₂` and integral factors elsewhere has mass `1/2`.

- **Normalized Haar measure on the adeles.** For a number field `K`, define
  `μ_∞`, the measure on `K_∞ = ∏_{w|∞} K_w` given by Lebesgue measure at
  real places and twice Lebesgue measure at complex places, as `2^{r₂}` times the transport of
  the mixed-space volume, and the measure `μ_𝔸` on `𝔸_K = K_∞ × 𝔸_{K,f}`, as
  the product of this archimedean measure with the finite-adele measure of *finite-adele-haar*.
  Prove that `μ_𝔸` is an additive Haar measure; by
  definition it is the product of the archimedean measure and `μ_f`, and the
  archimedean factor is `2^{r₂}` times the transport of the mixed-space volume (derived from the definition of the restricted-product measure in AA.0.2, using [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the measure construction following it, pp. 188–189). *Needs:* AA.0.4; Mathlib
  `NumberField.AdeleRing`, `NumberField.mixedEmbedding.volume_fundamentalDomain_stdBasis`,
  `MeasureTheory.Measure.prod`; AA.0.1; GlobalNumberFields, layer 6, additive strong
  approximation; Mathlib `ZSpan.isAddFundamentalDomain` and
  `NumberField.mixedEmbedding.volume_fundamentalDomain_latticeBasis`
  (`NumberTheory/NumberField/Discriminant/Basic.lean`, line 89).
  The adelic fundamental-domain assertion is an owned deduction: additive strong approximation
  moves the finite component into `∏_v 𝒪_v`, and translation by `𝓞_K` then moves the infinite
  component into its integral-basis parallelotope. Two rational translates intersect only when
  their difference is integral, where `ZSpan.isAddFundamentalDomain` gives uniqueness.
  Its mass follows from the cited lattice-volume formula and the factor `2^{r₂}` in
  `μ_∞`. [Sutherland], §23.3, p. 6, supplies the local-measure normalization.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `K = ℚ` the set `[0,1) × ∏_p ℤ_p` has measure `1`.
  - The product of the mixed-space fundamental parallelotope of `𝓞_K` (transported to `K_∞`)
    with `∏_v 𝒪_v` is a fundamental domain for `K` in `𝔸_K` and has measure `|d_K|^{1/2}`: the
    archimedean factor is `2^{r₂}` times the mixed volume `2^{−r₂} |d_K|^{1/2}`.
  - So `vol(𝔸_K/K) = |d_K|^{1/2}`, which differs from the self-dual value `1` (the self-dual
    normalization) whenever `|d_K| > 1`; omitting the factor `2` at complex places would give
    `2^{−r₂} |d_K|^{1/2}`. At the complex place of an imaginary quadratic field the unit square
    has mass `2`, where `dx dy` would give `1`.
- **The idele norm is the additive Haar character.** (*idele-haar-character*)
  For a number field `K` and `x ∈ 𝔸_K^×`, prove
  `MeasureTheory.distribHaarChar 𝔸_K x = TauCeti.GlobalNumberFields.ideleNorm x` (coerced to
  `ℝ≥0`), and hence `map (x * ·) μ_𝔸 = ‖x‖⁻¹ • μ_𝔸`. The norm-one subgroup is
  exactly the kernel of this character, equivalently the ideles whose multiplication
  preserves `μ_𝔸`. The product formula makes every principal idele measure preserving.
  For finite ideles the analogous character is `∏ᶠ_v ‖x_v‖₊` and multiplication pushes
  `μ_f` forward by its reciprocal. These identities concern the additive groups
  of the rings ([Platonov–Rapinchuk–Rapinchuk], §3.5, pp. 186–189: local modulus and
  restricted Haar products).
  *Needs:* AA.0.1, AA.0.2, *finite-adele-haar*; GlobalNumberFields, layer 6;
  Tau Ceti `TauCeti.GlobalNumberFields.coe_ideleNorm`,
  `TauCeti.GlobalNumberFields.ideleNorm_unitEmbedding`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The idele concentrated at a finite uniformizer has character `q_v⁻¹`.
  - At a complex place the character is `|z|²`; multiplication by `2` has character `4`.
  - The principal idele `2` over `ℚ` has character `1`: its finite part has character `1/2`
    and pushes finite-adele Haar measure to twice itself; its real part has character `2`.
- **Normalized Haar measure on the ideles.** For a number field `K`, define
  the measure `d^×x` on the idele group `𝔸_K^×` as the restricted
  product, through the topological isomorphism `𝔸_K^× ≅ Πʳ v, [K_v^×, 𝒪_v^×]` (finite part) times
  `∏_{w|∞} K_w^×`, of the Haar measures `d^×x_v` with `vol(𝒪_v^×) = 1` at finite places, `dx/|x|`
  at real places and `2 dx dy/(x² + y²)` at complex places. Prove that it is a Haar measure on
  the idele group and that `d^×x` of
  `∏_v 𝒪_v^×` times a box at infinity is the archimedean volume of the box. The normalization
  `vol(𝒪_v^×) = 1` is this roadmap's convention; [Rosengarten], §1, p. 2, forms restricted products
  of local Haar measures on adelic points. The archimedean factor `d^×x_∞` is fixed
  by an equation: carried to `K_∞`, it is the additive measure
  `μ_∞` (`dx`, `2 dx dy`) restricted to the units with density `∏_w |x_w|_w⁻¹`, the
  normalized absolute value being squared at complex places (Mathlib
  `NumberField.mixedEmbedding.norm`). Without this equation the statement about `∏_v 𝒪_v^×` would only tie
  `d^×x` to an archimedean measure left unspecified. *Needs:* AA.0.2; Mathlib
  `NumberField.IdeleGroup`, `RestrictedProduct.unitsEquiv`, `NumberField.mixedEmbedding.norm`;
  GlobalNumberFields, layer 6.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `K = ℚ`, `d^×x(∏_p ℤ_p^× × [1, e]) = 1`.
  - At a finite place, the measure `|dx/x|_v` built from the additive normalization gives
    `𝒪_v^×` volume `1 − q_v⁻¹`, so `d^×x` is the product of `(1 − q_v⁻¹)⁻¹ |dx/x|_v`.
  - For `K = ℚ`, the set with `x_2 ∈ 1 + 4ℤ_2`, `x_p ∈ ℤ_p^×` for odd `p` and `x_∞ ∈ [1, e]` has
    `d^×x` mass `(1 − 2⁻¹)⁻¹ · 4⁻¹ = 1/2`; without the factor at `2` it would be `1/4`.
  - At the complex place of an imaginary quadratic field the annulus `1 ≤ |z| ≤ e` has
    `d^×x_∞` mass `2 · 2π · log e = 4π`; the density `dx dy/(x² + y²)` would give `2π`.
- **Products of form measures need convergence factors.** For `K = ℚ` and `ω = dx/x` on `G_m`,
  prove that the local measures `|ω|_p` built from the additive normalization `μ_p(ℤ_p) = 1` give
  `vol(ℤ_p^×) = 1 − p⁻¹`, and that `∏_p (1 − p⁻¹)` diverges to `0`. Hence the family `|ω|_p` does
  not satisfy the normalization hypothesis of *restricted-haar-product* (cofinitely volume `1`),
  and no rescaling by a single constant makes it do so; the Tamagawa measure of `G_m` uses the
  convergence factors `λ_p = (1 − p⁻¹)⁻¹`. The analogous statement for a number field `K` uses the
  pole of the Dedekind zeta function at `s = 1` ([Rosengarten], §1, p. 2; [Borel], §5.5, p. 21).
  *Needs:* AA.0.4; Mathlib `Nat.Primes.not_summable_one_div`; AA.0.2.
  *Lean:* none; specified in the README only.

### Examples

**Checks.** With all local integral masses one, the integral box has mass one. With
one exceptional mass two and all others one it has mass two; with exceptional masses
two and three it has mass six. The last two values distinguish cofinite normalization
from normalization at every place and fix the direction of rescaling.

The integral box `{x | ∀ i, x i ∈ B i}` has `∏ʳ μ i` mass `1` when every local integral subgroup has mass one,
and the `ℤ/4` examples of AA.0.1 and AA.0.2 separate the Borel σ-algebra from the σ-algebra of
the open subgroups and the level measure from a fully normalized product. For `K = ℚ`,
`[0,1) × ∏_p ℤ_p` has `μ_𝔸` mass `1` and `∏_p ℤ_p^× × [1, e]` has `d^×x` mass `1`;
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
  (`TauCeti.HopfAlgebra.points H 𝔸_F`), with the
  affine-points topology induced from `𝔸_F^H` by evaluation (the weakest topology making every
  evaluation `h ↦ x(h)` continuous), making it a topological group. Likewise
  `G(𝔸_{F,f})`, `G(F_∞) = G(F ⊗_ℚ ℝ)` and `G(F_v)`. Define `AdelicPoints.diagonal`, the diagonal
  `ι : G(F) →* AdelicPoints H` given by the coefficient map (`TauCeti.AlgHom.mapValue`, equivalently
  `mapPoints`) along `algebraMap F 𝔸_F`, and
  the continuous homomorphism `p_v : AdelicPoints H →* G(F_v)` given by the coefficient map
  along the projection `𝔸_F → F_v`; the finite and archimedean components are
  `AdelicPoints.finiteProjection` and `AdelicPoints.infiniteProjection`, and the diagonals into
  `G(𝔸_{F,f})` and `G(F_∞)` are `AdelicPoints.finiteDiagonal` and the coefficient map along
  `F → F_∞`.
  Prove that for `h ∈ H`,
  `x ↦ x h` is continuous `AdelicPoints H → 𝔸_F`, and that
  `p_v (diagonal g)` is the image of `g` in `G(F_v)`. Define `finiteEmbed`, the
  finite-supported homomorphism `G(𝔸_f) → G(𝔸)`, `x ↦ (1, x)`, under the canonical
  archimedean/finite splitting — an embedding of point groups, not a ring inclusion with
  archimedean coordinate zero — and prove that the finite projection of
  `finiteEmbed x` equals `x` and that the infinite projection of
  `finiteEmbed x` equals `1` ([Conrad], Proposition 2.1, p. 2; [Arthur], §2, p. 11). *Needs:*
  Tau Ceti `TauCeti.HopfAlgebra.points`, `TauCeti.HopfAlgebra.mapPoints`,
  `TauCeti.HopfAlgebra.pointsFunctor`; Mathlib `NumberField.AdeleRing`,
  `IsDedekindDomain.FiniteAdeleRing`, `RestrictedProduct.evalRingHom`; ReductiveGroupsPartII,
  RG2.0; GlobalNumberFields, layer 4.
  *Lean:* `AdelicPoints`, `evaluationTopology`, `characterValue`; in `AdelicPoints`,
  `FiniteAdelicPoints`, `InfinitePoints`, `LocalPoints`, `diagonal`, `finiteDiagonal`,
  `finiteProjection`, `infiniteProjection` are the carriers and maps used by the headline statements.

  **Checks.**
  - For `H = F[T]` with additive comultiplication, `AdelicPoints H ≃ₜ+ 𝔸_F`
    (using the multiplicative type synonym; see *ga-adelic*).
  - For `H = F[T, T⁻¹]` the topology is not the subspace topology of `𝔸_F`: the inversion map is
    not continuous for the subspace topology on `𝔸_F^×`, so evaluation at `T` is injective but
    not an embedding.
  - For the trivial coordinate Hopf algebra `H = F`, `AdelicPoints F F` is a subsingleton.

- **Integral models over `S`-integers.** For finitely generated `H` and a finite set `S` of places
  of `F` containing the archimedean ones, define `IntegralModel`: an integral model of `H` away
  from `S` is a finitely presented commutative Hopf algebra `𝓗` over the `S`-integers `𝒪_{F,S}`
  (`SIntegers F S`, the elements of `F` integral at every finite place outside `S`)
  together with a specified isomorphism of Hopf algebras `F ⊗_{𝒪_{F,S}} 𝓗 ≅ H` (`S` is finite and
  all infinite places are understood to be included). For `v ∉ S` define
  `IntegralModel.localPoints`, the subgroup `𝓗(𝒪_v) = Hom_{𝒪_{F,S}}(𝓗, 𝒪_v) ⊂ G(F_v)`, and
  `IntegralModel.level`, the restricting subgroup at `v`: `𝓗(𝒪_v)` for `v ∉ S` and `G(F_v)` for
  `v ∈ S`. Define the enlargement, the base-changed model over `𝒪_{F,S′}` for `S ⊆ S′`, with
  local points unchanged at `v ∉ S′` and coordinate algebra `𝒪_{F,S′} ⊗_{𝒪_{F,S}} 𝓗`, by a Hopf
  isomorphism under which the generic-fibre identifications agree. The second clause is needed: the product of
  `𝓗` with the non-reduced group scheme `𝒪_{F,S′}[ε]/(ε^p, pε)` (`ε` primitive, `p` a prime outside
  `S′`) has the same generic fibre and the same `𝒪_v`-points, since `ε` is `p`-torsion, but its fibre
  at `p` is not reduced, so reductivity of the enlargement would fail for it. Prove that the map
  `𝓗(𝒪_v) → G(F_v)` induced by the injection `𝒪_v → F_v` is injective ([Conrad], Remark 3.5 and
  §3, p. 6). *Needs:* Tau Ceti `TauCeti.HopfAlgebra.points`,
  `TauCeti.CommHopfAlgCat.baseChangePointsMulEquiv`; Mathlib `Set.integer`.
  *Lean:* `SIntegers`, `IntegralModel`, `IntegralModel.localPoints`, `IntegralModel.level`.

  **Checks.**
  - For the standard model of `GL_n`, `localPoints v = GL_n(𝒪_v)` (invertible determinant), not
    all integral matrices with nonzero determinant.
  - For `G_a` (`H = F[T]`) and the model `𝒪_{F,S}[X]` identified with `H` by `X ↦ cT`, where
    `c ∈ 𝒪_{F,S}` is nonzero, `localPoints v` is `{a ∈ F_v : c·a ∈ 𝒪_v} = c⁻¹𝒪_v`.
  - For `c = p` and `v | p` (`v ∉ S`) this is `p⁻¹𝒪_v ⊋ 𝒪_v`, so the integral points depend on the
    specified Hopf identification and not only on the abstract Hopf algebra.
- **Global integral points of a specified model.** For any number field `F`, finite sets
  `S₀ ⊆ S` containing infinity, and `M : IntegralModel F H S₀`, define
  `Γ(M,S) = IntegralModel.globalPoints M S` as the image of
  `𝒢_M(𝒪_{F,S}) → G(F)` under the specified generic-fibre identification, where
  `𝒢_M = Spec M.coordinate`. Prove injectivity of this map and that its image consists
  exactly of the rational points whose values on the integral coordinate algebra lie in
  `𝒪_{F,S}`. Prove the away-`S` characterization
  `g ∈ Γ(M,S) ↔ ∀ finite v ∉ S, g_v ∈ IntegralModel.localPoints M v`. Enlarging `S` increases the subgroup and
  base-changing `M` to `𝒪_{F,S}` gives the same subgroup. Construct a model over `𝒪_F`
  by taking the schematic closure of a faithful closed matrix representation; its coordinate
  algebra is torsion-free over the Dedekind base, and the Hopf operations restrict to it.
  Thus a model exists over every `𝒪_{F,S}`. This assertion does not require a reductive or
  smooth model ([Conrad], Theorems 3.4 and 3.6, pp. 5–6; [Milne], §4, pp. 42–43,
  including footnote 28, with the same closure construction over `𝒪_F`).
  *Needs:* AA.1.1; ReductiveGroups, layer 1 (faithful finite-dimensional representations);
  Mathlib `Set.integer`; Tau Ceti base change of Hopf-algebra points.
  *Lean:* `IntegralModel.globalPoints` (the subgroup used in the arithmetic covolume criterion).

  **Checks.**
  - The standard additive model gives `Γ(M,S) = 𝒪_{F,S}`. Over `ℚ` this is
    `ℤ[S_f⁻¹]`, and `S_f = ∅` gives `ℤ`.
  - For the additive model with coordinate `X ↦ cT`, `Γ(M,S) = c⁻¹𝒪_{F,S}`.
    Over `ℚ`, `c = p` gives `p⁻¹ℤ` at `S = {∞}`, and enlarging `S` to include `p`
    gives `ℤ[1/p]` for both this model and the standard one.
  - The standard multiplicative model gives `Γ(M,S) = 𝒪_{F,S}^×`:
    the coordinate and its inverse must both be integral. Over `ℚ` and `S = {∞}`
    this is `{±1}`, whereas `p` belongs when `p ∈ S`.

- **Spreading Hopf structure and its identities.** Prove that a finitely presented affine
  `F`-algebra with Hopf structure descends to a finitely presented Hopf algebra over `𝒪_{F,S}`
  after enlarging finite `S`, and that a prescribed finite collection of Hopf morphisms and
  their identities descends simultaneously; the integral generic-fibre identifications are Hopf
  isomorphisms ([Conrad], Theorem 3.4(1)–(2), pp. 5–6; Remark 3.5, p. 6). *Needs:* Mathlib finite
  presentation and localization.
  *Lean:* none; specified in the README only.
- **Spreading out.** Prove that every finitely generated commutative Hopf algebra `H` over `F`
  has an integral model away from some finite set `S` of places ([Conrad], Theorem 3.4(1), p. 5).
  *Needs:* AA.1.1.
  *Lean:* none; specified in the README only.
- **Reductive models outside finitely many places.** Call an integral model `M` reductive when
  its coordinate algebra is `Algebra.Smooth` over the `S`-integer base and Tau Ceti's
  `reductiveCommHopfAlgProperty` holds on every field-valued fibre `k ⊗ M.coordinate`.
  The generic fibre is the specified Hopf algebra through `M.baseChangeIso`.
  Prove that reductivity passes to the generic fibre and to every enlargement, and that
  a finite-type connected reductive `F`-group has such a
  model for some finite `S`. Prove that the standard model of `GL_n` is reductive in every rank
  ([Conrad RGS], Definition 3.1.1, p. 81; Corollary 3.1.11, pp. 88–89).
  *Needs:* AA.1.1; Tau Ceti's field-valued reductivity predicate; Mathlib `Algebra.Smooth`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The rank-zero general linear model is reductive.
  - The rank-one model is the smooth multiplicative group with torus fibres.
  - No integral model of `G_a` is reductive: its specified
    generic fibre is a nontrivial connected unipotent group.
  - Enlarging the standard `GL_n` model keeps it reductive; the
    non-reduced twist described above keeps the local points and fails this.

- **Uniqueness of integral models up to enlarging `S`.** For finitely generated `H`, prove that
  two integral models `𝓗`, `𝓗′` of `H` (away from `S` and `S′`) become isomorphic, compatibly
  with their identifications with `H`, after base change to `𝒪_{F,S″}` for some finite
  `S″ ⊇ S ∪ S′`; consequently `𝓗(𝒪_v) = 𝓗′(𝒪_v)` inside `G(F_v)` for all but finitely many `v`
  ([Conrad], Theorem 3.4(3), p. 5). *Needs:* AA.1.1.
  *Lean:* none; specified in the README only.

The primitive thickening `𝒪_{F,S′}[ε]/(ε^p, pε)` used above satisfies all three Hopf-ideal
conditions for the relations `ε^p` and `pε`:
`Δ(ε)=ε⊗1+1⊗ε`, `counit(ε)=0`, and `S(ε)=−ε`. The intermediate
binomial coefficients in `Δ(ε^p)` are divisible by the prime `p`, and each
mixed monomial is killed by `pε`; this is a direct binomial calculation.
*Lean:* none; specified in the README only.

**Checks.**

- Both defining relations vanish under primitive comultiplication at `p=3`.
- For `𝔽₃[ε]/ε²`, the proposed
  comultiplication gives `Δ(ε²)=2ε⊗ε≠0`; hence the square-zero integral example
  cannot carry that Hopf structure at `p=3`.
- For `A = 𝒪_{F,S′}[ε]/(ε^p,pε)`, inverting `p` gives
  `A[1/p] ≅ 𝒪_{F,S′}[1/p]`; its generic fibre is `A ⊗ F ≅ F`.
  With base ring `ℤ` and `p=3`, the localization is `ℤ[1/3]`, which has no `1/2`
  and is not `ℚ`. Torsion-free integral points kill `ε`; in a characteristic-`p`
  fibre, `ε` is a nonzero nilpotent. These point and fibre properties accompany the Hopf-ideal test.

### 1.2 Restricted-product realization

- **Points over a product of rings.** For a commutative Hopf algebra `H` over `F` and
  commutative `F`-algebras `R₁`, `R₂` (and more generally a finite product), prove
  `WithConv (H →ₐ[F] R₁ × R₂) ≃* WithConv (H →ₐ[F] R₁) × WithConv (H →ₐ[F] R₂)`, naturally and as
  topological groups for the affine-points topology ([Conrad], Proposition 2.1, proof, p. 2).
  *Needs:* AA.1.1; Mathlib `AlgHom.prod`.
  *Lean:* none; specified in the README only.

  **Checks.** The projections of a pair recover its two point coordinates; the rational diagonal
  maps to the pair of rational diagonals; a finite embedded point has archimedean coordinate `1`.
- **Finite adeles as a directed union of `S`-adeles.** For finite sets `S` of finite places, prove
  that the `S`-adeles `𝔸_{F,S} = ∏_{v∈S} F_v × ∏_{v∉S} 𝒪_v` are open subrings of `𝔸_{F,f}`
  forming a directed union, and that every `F`-algebra map `H → 𝔸_{F,f}` from a finitely
  generated `H` with integral model `𝓗` restricts to a map of models `𝓗 → 𝔸_{F,S}` for `S`
  large: `G(𝔸_{F,f}) = ⋃_S 𝓗(𝔸_{F,S})`; the integral generic-fibre identifications are Hopf
  isomorphisms ([Conrad], Remark 3.5, p. 6). *Needs:* AA.1.1; Mathlib
  `RestrictedProduct.isOpenEmbedding_inclusion_principal`.
  *Lean:* none; specified in the README only.
- **The restricted-product bijection on `S`-adelic points.** For a fixed affine finitely presented
  model `𝓗` over `𝒪_{F,S}` whose generic-fibre identification is a Hopf isomorphism, prove that
  the evaluation map from its `S′`-adelic points to `∏_{v∈S′} G(F_v) × ∏_{v∉S′} 𝓗(𝒪_v)`, for
  finite `S′ ⊃ S`, is a bijection. This is a set and group statement; the topology is proved
  separately ([Conrad], Theorem 3.6, p. 6). *Needs:* AA.1.1; AA.1.2; ReductiveGroupsPartII, RG2.0.
  *Lean:* none; specified in the README only.
- **Topology of the restricted-product comparison.** Prove that the bijection
  `G(𝔸_{F,f}) → ∏ʳ_v [G(F_v), B_v]` induced by coordinate projections is a homeomorphism: on each
  `S`-integral principal piece it is the product homeomorphism of affine points, and the
  principal pieces are open on both sides; the integral generic-fibre identifications are Hopf
  isomorphisms ([Conrad], Theorem 3.6, pp. 7–8; §4, p. 9). *Needs:* AA.1.2; ReductiveGroupsPartII,
  RG2.0; Mathlib `RestrictedProduct.topologicalSpace_eq_iSup`.
  *Lean:* none; specified in the README only.
- **Adelic points as a restricted product.** (*restricted-product-comparison*) Let `H` be
  finitely generated and `𝓗` an integral model of `H` away from `S`. Prove that
  `x ↦ (p_v(x))_v` is an isomorphism of topological groups
  `G(𝔸_{F,f}) ≃ₜ* Πʳ v, [G(F_v), B_v]`, where `B_v = 𝓗(𝒪_v)` for `v ∉ S` and `B_v = G(F_v)` for
  the finitely many finite `v ∈ S`, and that `G(𝔸_F) ≃ₜ* G(F_∞) × G(𝔸_{F,f})` ([Conrad],
  Theorem 3.6, p. 6; [Borel], §1.2, p. 7). *Needs:* AA.1.1; Mathlib
  `RestrictedProduct.topologicalSpace_eq_iSup`; AA.0.3; ReductiveGroupsPartII, RG2.0; AA.1.2.
  *Lean:* `IntegralModel.exists_restrictedProductEquiv` (finite adelic comparison).
- **Independence of the model and of the exceptional set.** For finitely generated `H`, prove
  that the topological group structure on `Πʳ v, [G(F_v), 𝓗(𝒪_v)]` obtained from
  *restricted-product-comparison* does not depend on the integral model `𝓗` or on `S`: for two
  models the identity of `G(𝔸_{F,f})` corresponds to the canonical isomorphism
  `restrictedProductCongr` of Tau Ceti, and enlarging `S` does not change it ([Conrad],
  Theorem 3.6, p. 6). *Needs:* AA.1.2; AA.1.1; AA.0.3.
  *Lean:* none; specified in the README only.
- **Adelic groups are locally compact.** For a number field `F` and finitely generated
  `F`-algebra `H`, prove that `G(𝔸_F)`, `G(𝔸_{F,f})` and `G(F_∞)` are second countable, locally
  compact, Hausdorff topological groups
  ([Borel], §1.2, p. 7). *Needs:* AA.1.2; Mathlib `RestrictedProduct.locallyCompactSpace_of_group`;
  AA.0.1; ReductiveGroupsPartII, RG2.0 (`PointTopology.locallyCompactSpace_of_finiteType`);
  GlobalNumberFields, layer 5.
  *Lean:* none; specified in the README only.
- **Splitting off finitely many places.** For finitely generated `H` and a finite set `S` of
  places, prove `G(𝔸_F) ≃ₜ* G(F_S) × G(𝔸_F^S)`, with `G(F_S) = ∏_{v∈S} G(F_v)` and `G(𝔸_F^S)` the
  adelic points away from `S`; in particular `G(𝔸_F) ≃ₜ* G(F_∞) × G(𝔸_{F,f})`. The diagonal
  `G(F)` maps to the pair of diagonals ([Borel], §1.2, p. 7). *Needs:* AA.1.2; AA.0.3.
  *Lean:* none; specified in the README only.

  **Checks.** Splitting no places retains the original group; splitting all infinite places
  gives the archimedean/finite pair; the rational diagonal projects to each local diagonal.

### 1.3 Rational points and functoriality

- **Rational points are discrete in the full adeles.** For finitely generated `H`, prove that
  the diagonal `G(F) → G(𝔸_F)` is injective, that its image is a discrete subgroup, and that the
  image is closed ([Conrad], Example 2.3, p. 3; [Borel], §1.2, p. 7). *Needs:* AA.1.1; Tau Ceti
  `TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup`,
  `TauCeti.GlobalNumberFields.isClosed_principalSubgroup`; Mathlib `Subgroup.isClosed_of_isDiscrete`;
  Tau Ceti `NumberField.AdeleRing.instT2Space`; ReductiveGroupsPartII, RG2.0.
  *Lean:* none; specified in the README only.
- **Discreteness in the finite adeles alone.** For finitely generated `H`, prove that `G(F)` is
  discrete in `G(𝔸_{F,f})` if and only if `G(F) ∩ U` is finite for one (equivalently every)
  compact open subgroup `U ⊂ G(𝔸_{F,f})`. In particular `G_a(F) = F` is not discrete in
  `𝔸_{F,f}`, `SL_2(ℚ)` is not discrete in `SL_2(𝔸_{ℚ,f})` because `SL_2(ℤ)` is infinite, and `ℚ^×`
  is discrete in `𝔸_{ℚ,f}^×` because `ℚ^× ∩ ∏_p ℤ_p^× = {±1}` ([Borel], §1.8, p. 9). *Needs:*
  AA.1.3; AA.1.2.
  *Lean:* none; specified in the README only.
- **Functoriality of adelic points.** For finitely generated `H` and a homomorphism of affine
  algebraic groups `φ : G → G′` over `F` (a Hopf algebra map `φ* : H′ → H`), define
  `φ_𝔸 : AdelicPoints H →* AdelicPoints H′`, `x ↦ x ∘ φ*`. Prove
  that `φ_𝔸` is continuous, that the identity induces the identity,
  that `(φ ∘ ψ)_𝔸 = φ_𝔸 ∘ ψ_𝔸` for composable group morphisms `ψ : G₀ → G`,
  `φ : G → G′` (with `(φ ∘ ψ)* = ψ* ∘ φ*` on Hopf algebras), that
  `φ_𝔸 (diagonal g) = diagonal (φ g)` and that `p_v ∘ φ_𝔸 = φ_v ∘ p_v`. Under
  *restricted-product-comparison* it is the restricted product of the local maps `φ_v`, which
  send `𝓗(𝒪_v)` into `𝓗′(𝒪_v)` for almost all `v` ([Borel], §1.3, p. 7). *Needs:* AA.1.1; Tau
  Ceti `TauCeti.CommHopfAlgCat.pointsFunctor`; AA.1.2; Mathlib
  `RestrictedProduct.mapAlong_continuous`; Tau Ceti `TauCeti.GeneralLinear.determinantCoordinateMap`,
  `TauCeti.GeneralLinear.pointsMulEquiv_determinantPoints`.
  *Lean:* none; specified in the README only.

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
  centre of `G(𝔸_F)`, and that `Z(F) = Z(𝔸_F) ∩ G(F)`. The closed embedding follows from [Conrad],
  Proposition 2.1, p. 2, and the centre Hopf-ideal API below. The rational intersection
  is an owned closed-subgroup deduction: injectivity of `F → 𝔸_F` means a rational
  point kills the defining ideal after coefficient extension exactly when it kills it over `F`.
  *Needs:* AA.1.3; Tau
  Ceti `TauCeti.CommHopfAlgCat.centerDefiningIdeal`,
  `TauCeti.CommHopfAlgCat.centerPointsSubgroup_eq_center`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `G_m`, every adelic point belongs to the centre subgroup.
  - For `GL₂`, scalar invertible matrices lie in `Z(𝔸_F)`, while `[[1,1],[0,1]]` does not.
  - For `SL₂/ℚ`, the rational intersection is `{±I}`; `diag(2,1/2)` is outside it.

### 1.4 Restriction of scalars and concrete groups

- **Local factors of restriction of scalars.** For `E/F` finite and `G_E` affine over `E`, prove
  that under *base-change-adelic* the projection to `F_v` corresponds to
  `Res(F_v) ≃ ∏_{w|v} G_E(E_w)`, and that for almost all `v` the integral points of a model of
  `Res` correspond to `∏_{w|v} 𝓗_E(𝒪_w)`. The Weil restriction and the completion/adelic
  base-change maps are the natural adjunction and canonical tensor-product maps; arbitrary point
  equivalences are excluded, and the integral generic-fibre identifications are Hopf
  isomorphisms ([Borel], §1.4, p. 8). *Needs:* AA.1.4; GlobalNumberFields, layer 8;
  ReductiveGroupsPartII, RG2.0a.
  *Lean:* none; specified in the README only.
- **Naturality of adelic restriction of scalars.** Let `k ⊆ F ⊆ E` be number fields with `E/F`
  and `F/k` finite, `G_E` an affine algebraic group over `E` (a finite-type commutative Hopf
  `E`-algebra) with morphisms `G_E → G′_E` over `E`, `Res_{E/F}` with its natural point adjunction
  `Res_{E/F}G(R) ≃ G(E ⊗_F R)` from RG2.0a, and the canonical continuous isomorphism
  `E ⊗_F 𝔸_F ≅ 𝔸_E` with its local factors from GlobalNumberFields layer 8. Prove that the adelic
  comparison commutes with every algebraic group morphism, the diagonal `F → 𝔸_F`, projections
  to `F_v`, and the canonical tensor associator for towers `E/F/k` ([Conrad], Examples 2.4 and
  4.2, pp. 3 and 9–10). *Needs:* AA.1.4; ReductiveGroupsPartII, RG2.0a; GlobalNumberFields,
  layer 8.
  *Lean:* none; specified in the README only.
- **Restriction of scalars on adelic points.** (*base-change-adelic*) For a finite extension
  `E/F` of number fields and an affine algebraic group `G_E` over `E`, with `Res = Res_{E/F} G_E`,
  define an isomorphism of topological groups `Res(𝔸_F) ≃ₜ* G_E(𝔸_E)`,
  and prove that it carries the diagonal of `Res(F) = G_E(E)` to the
  diagonal of `G_E(E)`, that it is natural in homomorphisms
  `G_E → G′_E`, and that in a tower `F ⊂ E ⊂ L` the isomorphism for `L/F`
  is the composite of those for `L/E` and `E/F`. The Weil restriction and the completion/adelic
  base-change maps are the natural adjunction and canonical tensor-product maps; arbitrary point
  equivalences are excluded, and the integral generic-fibre identifications are Hopf
  isomorphisms ([Conrad], Example 4.2, p. 10; [Arthur], §2, p. 11).
  The general commutative-ring tower interface retains finite/projective instances for
  `k′/k`, `k″/k′`, and `k″/k` (the last follows mathematically by transitivity).
  The Hopf isomorphism `Res_{E/F} Res_{L/E} H ≃ Res_{L/F} H` used in the tower clause is
  fixed by its effect on points: on `R`-points both sides give the same
  `L`-algebra map out of `H`, through `L ⊗_E (E ⊗_F R) ≃ L ⊗_F R` (Mathlib
  `Algebra.TensorProduct.cancelBaseChange`). A Hopf isomorphism twisted by an automorphism of the
  group (inversion on `G_m`) satisfies every other clause but would make the tower clause false.
  *Needs:* AA.1.1; ReductiveGroupsPartII, RG2.0a (`WeilRestriction.functor`,
  `WeilRestriction.functor_isCorepresentable`); GlobalNumberFields, layer 8; Mathlib
  `Algebra.TensorProduct.cancelBaseChange`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `G_E = G_m`, the isomorphism is `(E ⊗ 𝔸_F)^× ≃ 𝔸_E^×`.
  - `Res_{E/F}(G_E)` is not the base change of `G_E`: for `E = ℚ(i)`, `Res G_m(ℚ) = ℚ(i)^×` while
    `G_m(ℚ) = ℚ^×`.
  - For `E = F`, the map on coefficient values is the tensor unit equivalence `F ⊗_F 𝔸_F ≃ 𝔸_F`.
  - For the tower `ℚ ⊂ ℚ ⊂ ℚ` and `G_m`, the tower isomorphism is the identity on points up to the
    unit equivalences; the inversion-twisted isomorphism sends the
    point `2` to `1/2` and fails.

- **The additive group.** (*ga-adelic*) For `G = G_a` (`H = F[T]` with `T` primitive), prove
  `G(𝔸_F) ≃ₜ+ 𝔸_F`, that the diagonal is `algebraMap F 𝔸_F`, and that
  *restricted-product-comparison* recovers `FiniteAdeleRing` as a restricted product ([Arthur],
  §2, p. 11). *Needs:* AA.1.1; Mathlib `NumberField.AdeleRing`, `IsDedekindDomain.FiniteAdeleRing`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The convolution identity corresponds to the zero adele.
  - A rational point with value `a` corresponds to the diagonal adele of `a`.
  - The point with archimedean value zero and finite value one corresponds to `(0,1)` in the adelic product.
- **The multiplicative group and the ideles.** For `G = G_m`, prove
  `G(𝔸_F) ≃ₜ* NumberField.IdeleGroup (𝓞 F) F = 𝔸_F^×` with the units topology, and that under
  *restricted-product-comparison* the finite part is `Πʳ v, [F_v^×, 𝒪_v^×]` via
  `RestrictedProduct.unitsEquiv` ([Borel], §1.3, p. 7). The comparison is Tau Ceti's
  `TauCeti.MultiplicativeGroup.pointsMulEquiv`, and the target includes that it is a
  homeomorphism.
  *Needs:* AA.1.1; Tau Ceti
  `TauCeti.MultiplicativeGroup.pointsMulEquiv`; Mathlib `NumberField.IdeleGroup`,
  `RestrictedProduct.unitsEquiv`; GlobalNumberFields, layer 6.
  *Lean:* none; specified in the README only.
- **The general linear group.** For `G = GL_n` with `n ≥ 1`, prove
  `G(𝔸_F) ≃ₜ* GL_n(𝔸_F) = (Matrix (Fin n) (Fin n) 𝔸_F)ˣ` with the units topology, and that its
  finite part is the restricted product `Πʳ v, [GL_n(F_v), GL_n(𝒪_v)]` ([Arthur], §2, p. 11).
  Both comparisons are the matrix of coordinates; over `𝔸_F` the comparison is ReductiveGroupsPartII's
  `PointTopology.generalLinearPointsHomeomorph` at `R = 𝔸_F`. *Needs:* AA.1.1; Tau Ceti
  `TauCeti.GeneralLinear.pointsMulEquiv`; AA.1.2; AA.1.4.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The inverse transpose `g ↦ (gᵀ)⁻¹` is also an isomorphism of topological groups
    `G(𝔸_{F,f}) ≃ GL_n(𝔸_{F,f})`; at `n = 1` it is inversion and differs from the comparison at
    every finite idele of order greater than two.
  - In rank one the matrix comparison agrees with the multiplicative-group comparison to the ideles.
  - A rational matrix maps to its entrywise diagonal adelic matrix, with neither transpose nor inversion.

### 1.5 Unimodularity and compact open levels

- **The modular character on compact and central elements.** For a locally compact group `G`,
  prove that the modular character `Δ : G → ℝ_{>0}` is a homomorphism trivial on every compact
  subgroup and on the centre of `G` ([Borel], §5.5, p. 20). *Needs:* Mathlib
  `MeasureTheory.Measure.modularCharacter`,
  `MeasureTheory.Measure.map_right_mul_eq_modularCharacterFun_smul`.
  *Lean:* none; specified in the README only.
- **Weyl orbit products lie in the split centre up to finite index.** Let `A` be a maximal split
  torus of a connected reductive group over a field and `W` its relative Weyl group. For
  `a ∈ A(E)`, prove that the product `∏_{w∈W} w(a)` lies in `(Z(G) ∩ A)(E)` up to an element of
  a finite group; in particular some power of it lies in the split centre ([Borel], §5.5, p. 20).
  *Needs:* ReductiveGroups, layer 7; ReductiveGroupsPartII, RG2.1.
  *Lean:* none; specified in the README only.
- **Local unimodularity of reductive groups.** For a connected reductive group `G` over a local
  field `E` of characteristic `0`, prove that the locally compact group `G(E)` is unimodular
  ([Borel], §5.5, p. 20). *Needs:* Mathlib `MeasureTheory.Measure.modularCharacter`;
  ReductiveGroupsPartII, RG2.4 (`Decomposition.modularCharacter_eq_one`, nonarchimedean);
  RepresentationTheory/LieGroups, layer 9 (archimedean); AA.1.5.
  *Lean:* none; specified in the README only.
- **Adelic groups of reductive groups are unimodular.** For a connected reductive group `G` over
  a number field `F`, prove that `G(𝔸_F)`, `G(𝔸_{F,f})` and `G(F_∞)` are unimodular ([Borel],
  §5.5, p. 20). *Needs:* AA.1.5; AA.0.3; AA.1.2.
  *Lean:* none; specified in the README only.
- **Compact open subgroups and product levels.** For finitely generated `H`, prove that every
  compact open subgroup `U ⊂ G(𝔸_{F,f})` contains a product subgroup `∏_v U_v` with
  `U_v ⊂ G(F_v)` compact open and `U_v = 𝓗(𝒪_v)` for all but finitely many `v`, and is contained
  in such a product; and that any two compact open subgroups are commensurable ([Borel], §1.7,
  p. 8). *Needs:* AA.1.2; AA.0.1; ReductiveGroupsPartII, RG2.0.
  *Lean:* none; specified in the README only.
- **Conjugation changes a level at finitely many places.** For finitely generated `H`,
  `g ∈ G(𝔸_{F,f})` and an integral model `𝓗`, prove that `g_v ∈ 𝓗(𝒪_v)` for all but finitely
  many `v`; hence for a product level `U = ∏_v U_v`, the conjugate `gUg⁻¹ = ∏_v g_v U_v g_v⁻¹`
  agrees with `U` at all but finitely many `v`, and `g` can be written as `g_B · u` with `g_B`
  supported on a finite set `B` of places and `u ∈ ∏_v 𝓗(𝒪_v)` ([Borel], §1.2, p. 7). *Needs:*
  AA.1.2; AA.1.5.
  *Lean:* none; specified in the README only.

- **Local factors of number-field congruence levels.** (*local-congruence-levels*)
  Let `F` be a number field, `N ≠ 0` an ideal of `𝒪_F`, and `v` an explicitly specified
  finite place. Extend matrices in `GL₂(F_v)` by the identity away from `v`, giving a
  continuous homomorphism `ι_v : GL₂(F_v) → GL₂(𝔸_{F,f})`. Define the local level-zero,
  level-one and principal levels as the subgroup comaps of AA.5.2's number-field levels
  along `ι_v`. Prove that they are compact open and have the entry descriptions
  `c ∈ N𝒪_v`, respectively `c ∈ N𝒪_v, d−1 ∈ N𝒪_v`, respectively every entry of `g − I₂`
  in `N𝒪_v`, in each case inside `GL₂(𝒪_v)`. Prove that the global level-one group is the product of
  these local subgroups, with full `GL₂(𝒪_v)` at `v ∤ N`, and similarly for the other
  two levels. This is an entrywise deduction from the restricted-product comparison and
  AA.5.2's completed-ideal comparison; no choice of a place above a rational prime occurs
  ([Milne], §4, p. 42, congruence subgroups; [Borel], §1.7, p. 8, product levels).
  *Needs:* AA.1.2; AA.5.2 *number-field-congruence-levels*; GlobalNumberFields, layer 4;
  ReductiveGroupsPartII, RG2.0.3 integral points and congruence kernels.
  *Lean:* none; specified in the README only.

  **Checks.**
  - If `N = 𝒪_F`, all three local subgroups are `GL₂(𝒪_v)`.
  - If `v ∤ N`, the local factor is full even when the level is proper elsewhere.
  - If `N𝒪_v = ϖ_vⁿ𝒪_v` with `n > 0`, the upper unipotent with entry `1` belongs
    to the level-one group but not the principal level; the lower unipotent with entry `1`
    belongs to neither.
  - Two distinct places above the same rational prime have independent local factors.

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

- **`F`-rational characters.** For `G = Spec H` an affine algebraic group over `F` with `H`
  finitely generated, use Mathlib’s `GroupLike F H` as the commutative group
  `X*_F(G)` of homomorphisms `G → G_m` defined over `F`, realized as the group-like elements
  `χ ∈ H` (`Δχ = χ ⊗ χ`, `ε(χ) = 1`) under multiplication; `χ(x)` is the
  action on points, `χ x := x χ ∈ Rˣ` for a point `x : H →ₐ[F] R`. Prove
  that `χ (x * y) = χ x * χ y` for the convolution product; construct
  the multiplicative equivalence of `GroupLike F H` with the bialgebra maps `F[T,T⁻¹] → H` under
  Mathlib's convolution product on `WithConv (F[T,T⁻¹] →ₐc[F] H)`, with value equation:
  the map attached to `χ` sends `T` to `χ`; and construct the base change of rational characters
  to an algebraic closure, with value equation: the base change of `χ` is
  `1 ⊗ χ ∈ F̄ ⊗_F H`. Prove that base change injects rational
  characters into Tau Ceti's geometric character group; that for
  finite-type smooth geometrically reduced and geometrically connected `G`, the rational
  character group is free abelian of finite rank; and that over
  a field `F` of characteristic zero, in particular a number field, the image of rational
  characters in the geometric character group is exactly the subgroup fixed by
  `Field.absoluteGaloisGroup F`; so `X*_F(G)` is equivalently the Galois-fixed subgroup of the
  geometric character group `X*(G_{F̄})` ([Arthur], §3, p. 16; [Borel], §1.3, p. 7). The two
  value equations are part of the specification: inversion `χ ↦ χ⁻¹` composed with the correct
  maps gives an injective base-change map with the same Galois-fixed range, and a multiplicative
  bijection onto the bialgebra maps, so injectivity, range and multiplicativity alone do not fix
  either map. *Needs:* Mathlib `GroupLike`, `GroupLike.instCommGroup`, the convolution monoid on
  `WithConv (C →ₐc[R] A)` (`Mathlib/RingTheory/Bialgebra/Convolution.lean`); Tau Ceti
  `TauCeti.CommHopfAlgCat.geometricCharacterGroup`,
  `TauCeti.CommHopfAlgCat.instGeometricCharacterGroupGaloisAction`,
  `TauCeti.GeneralLinear.determinantGroupLike`, `TauCeti.GeneralLinear.pointsMulEquiv_determinantPoints`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `n ≥ 1`, `X*_F(GL_n) ≃ ℤ` and the actual generic determinant is sent to `1`, so every
    character is its unique integral power.
  - For `G_m`, the tautological character `T` corresponds to the identity map of `F[T,T⁻¹]`,
    and its base change is `1 ⊗ T ≠ 1 ⊗ T⁻¹`; the inversion-twisted maps fail both.
  - For `E = ℚ(i)`, the rational characters of `Res_{E/ℚ} G_m` have rank `1`, not the rank `2` of
    the geometric character group.
  - The rational character group of `SL_n` is trivial, including `n = 0` and `n = 1`.

- **Rational characters form a lattice.** (*rational-characters-free*) For `G = Spec H` affine
  algebraic over `F` with `H` finitely generated, `G` geometrically connected, smooth and
  geometrically reduced (automatic in characteristic zero by Cartier's theorem, a standing input
  of the Reductive groups roadmap), prove that `X*_F(G)` is a free abelian group of finite rank,
  and that for connected reductive `G`, restriction of `F`-rational characters to the identity
  component of the centre is injective with finite cokernel. For the lattice statement,
  base change to an algebraic closure and restrict to a maximal torus. This restriction is
  injective: characters kill unipotents, and Jordan decomposition and conjugacy of maximal
  tori determine their values on all geometric points. Geometric reducedness then determines
  the character morphism. The character group embeds in the finite-free torus lattice;
  subgroup theory over `ℤ` gives finite freeness. These are owned deductions from
  ReductiveGroups, layers 4, 5 and 7, and the torsion-free API below. [Borel], Lemma 5.9,
  p. 22, supplies only the characteristic-zero finite-cokernel assertion, applied to the
  connected centre; injectivity for connected reductive groups follows from the central
  isogeny with the derived group ([Arthur], §5, p. 24).
  *Needs:* AA.2.1; Tau Ceti
  `TauCeti.CommHopfAlgCat.isMulTorsionFree_geometricCharacterGroup`
  (`CommHopfAlgCat/CharacterLattice/Torsion.lean`, theorem at line 74); ReductiveGroups, layers 4, 5 and 7; Tau
  Ceti `TauCeti.geometricallyReducedCommHopfAlgProperty`,
  `TauCeti.geometricallyConnectedCommHopfAlgProperty`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - `G_m` has lattice `ℤ`, generated by `T`.
  - `G_a` has zero character lattice, although it has dimension one.
  - For `GL₂`, restriction of `det` to the scalar centre is the square character:
    the injective map `ℤ → ℤ` has cokernel `ℤ/2`, rather than being onto.
- **The real vector space `a_G`.** For `G = Spec H` affine algebraic over `F` with `H` finitely
  generated and `G` geometrically connected, define
  `a_G = Hom_ℤ(Additive X*_F(G), ℝ)`, the finite-dimensional real vector space
  `a_G`, with scalar multiplication on the codomain and the finite-dimensional topology from
  *rational-characters-free*; its dual is `a_G^* = X*_F(G) ⊗_ℤ ℝ` and its complexification
  `a_{G,ℂ}^* = X*_F(G) ⊗ ℂ`. Define the pairing
  `a_G × X*_F(G) → ℝ`, and the linear map `a(φ) : a_G → a_{G′}` given by a
  coordinate Hopf map `φ : H′ → H` by precomposition with character pullback. Prove
  that `finrank ℝ a_G` is the rank of `X*_F(G)`,
  that `a(φ) a χ′ = a (φ χ′)` (the pulled-back character being
  group-like by Mathlib `IsGroupLikeElem.map`), that the map induced by
  the identity coordinate Hopf map is the identity on `a_G`, and that
  for coordinate Hopf maps `φ : H′ → H` and `ψ : H″ → H′`, `a(φ∘ψ) = a(ψ)∘a(φ)`
  ([Arthur], §3, p. 16). Functoriality alone does not fix `a(φ)`: conjugating it by rescalings of
  the spaces `a_G` (by `2` on `a_{G_m}`, by `1` elsewhere) preserves the identity and composition
  laws and breaks the naturality `H_{G′} ∘ φ_𝔸 = a(φ) ∘ H_G` of the Harish-Chandra map for the
  diagonal `G_m → G_m²`. *Needs:* AA.2.1; Mathlib `IsGroupLikeElem.map`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `GL_n` with `n ≥ 1`, the rational character lattice is `ℤ·det` and `a_G` has real
    dimension `1`.
  - For `E = ℚ(i)` and `G = Res_{E/ℚ} G_m`, `finrank a_G = 1`, not `2`.
  - For `SL_n`, the real character space is zero.
  - For the squaring map of `G_m` (coordinate map `T ↦ T²`), `a(φ)` is multiplication by `2` on
    `a_{G_m} ≅ ℝ`.
  - For the diagonal `G_m → G_m²`, the first coordinate character of `G_m²` pulls back to `T`, so
    `a(φ) a` takes the value `a(T)` on it; the functor conjugated by the rescaling
    `2` on `a_{G_m}` and `1` on `a_{G_m²}` satisfies the identity and composition laws and gives `a(T)/2`.

- **The Harish-Chandra map `H_G`.** For `G = Spec H` affine algebraic over `F` with `H` finitely
  generated and `G` geometrically connected, define `H_G`, the continuous
  homomorphism `H_G : AdelicPoints H →* Multiplicative a_G` (an additive map to `a_G`) with
  `⟨H_G(x), χ⟩ = log ‖χ(x)‖` for `χ ∈ X*_F(G)`, where `χ(x) = χ_𝔸(x) ∈ 𝔸_F^×` and `‖·‖` is the
  idele norm `∏_v |·|_v` (Tau Ceti `TauCeti.GlobalNumberFields.ideleNorm`). Prove that
  `⟪H_G x, χ⟫ = Real.log ‖χ x‖`, that `H_G` is continuous,
  that `H_G (diagonal g) = 0` (the product formula),
  that `H_G ∘ φ_𝔸 = a(φ) ∘ H_G`, and
  that `H_G` vanishes on every compact subgroup ([Arthur], §3,
  p. 16). *Needs:* AA.2.1; AA.1.3; AA.1.4; GlobalNumberFields, layer 6; Tau Ceti
  `TauCeti.GlobalNumberFields.normalizedAbsValue`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `G = G_m`, `H_G` is the logarithm of the idele norm.
  - `H_G` is not computed from the archimedean component alone: for `F = ℚ`, the ideles `1`
    and (`p` at the place `p`, `1` elsewhere) have the same archimedean component but norms `1`
    and `p⁻¹`.
  - For `SL_n`, every value of `H_G` is `1` in the multiplicative type tag, hence `0` in `a_G`.
  - The actual Hopf algebra `ℚ[ℤ^(ℕ)] = AddMonoidAlgebra ℚ (ℕ →₀ ℤ)` is not finite type,
    and its `H_G` is not continuous for the specified module topology.
    Give the `n`th generator the positive archimedean value
    `exp 1`, every other generator value `1`, and all finite values `1`. These adelic points
    tend to the identity because every polynomial uses finitely many generators. Their
    logarithms are the coordinate vectors `e_n`. A linear functional on the character dual
    sending every `e_n` to `1` extends from their span and is continuous for `moduleTopology`,
    so these logarithms do not tend to zero. This is a failure on a specified Hopf carrier,
    not a conclusion inferred merely from infinite dimension. The topology fact is
    Mathlib `IsModuleTopology.continuous_of_linearMap`
    (`Topology/Algebra/Module/ModuleTopology.lean`).

- **`H_G` vanishes on rational points.** For `G = Spec H` affine algebraic over `F` with `H`
  finitely generated, prove `H_G(g) = 0` for `g ∈ G(F)` ([Arthur], §3, p. 16). *Needs:* AA.2.1; Tau
  Ceti `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`; Mathlib
  `NumberField.prod_abs_eq_one`.
  *Lean:* none; specified in the README only.
- **The norm-one subgroup `G(𝔸)^1`.** For `G = Spec H` affine algebraic over `F` with `H` finitely
  generated and `G` geometrically connected, define `normOne`,
  `normOne H = ker H_G`, so that
  `G(𝔸_F)^1 = ker H_G = ⋂_{χ ∈ X*_F(G)} ker ‖χ‖`. Prove that `normOne` is closed,
  that it is normal, that `diagonal g ∈ normOne`,
  that `x ∈ normOne` iff `‖χ x‖ = 1` for every rational character `χ`,
  and that if `X*_F(G) = 0` then `normOne = ⊤`; it
  is a closed normal subgroup containing `G(F)`, every compact subgroup and the commutator
  subgroup ([Arthur], §3, p. 16; [Borel], §5.8, p. 22). *Needs:* AA.2.1.
  *Lean:* `normOne` (the intersection of the rational-character norm kernels).

  **Checks.**
  - For `G_m`, `normOne` is the kernel of the idele norm of GlobalNumberFields layer 6; its image
    in the idele class group is that layer's `IdeleClassGroup.normOne`.
  - `normOne` is not `G(F_∞)^1 × G(𝔸_f)`: for `GL_1(𝔸_ℚ)` the idele (`p_∞ = p`, `p_p = p`, `1`
    elsewhere) has norm `1` but its archimedean component has `|p|_∞ ≠ 1`.
  - For `SL₂`, the norm-one subgroup is the full adelic group.

- **The split component `A_G`.** For a connected reductive group `G` over `F`, let
  `G₁ = Res_{F/ℚ} G`; `A_G` is the largest `ℚ`-split torus in the centre of `G₁`. Define
  the subgroup `A_G(ℝ)^0` of `AdelicPoints H` (supported at the archimedean
  places), the identity component of the real points of `A_G` inside
  `G₁(ℝ) = G(F ⊗ ℝ) = G(F_∞) ⊂ G(𝔸_F)`, isomorphic to `(ℝ_{>0})^k` with `k = rank X*_F(G)`. Prove
  that `H_G` restricts to an isomorphism of topological groups
  `A_G(ℝ)^0 ≃ a_G`, that `A_G(ℝ)^0` is central in `G(𝔸)`, and
  that `A_G(ℝ)^0 ∩ G(𝔸)^1 = {1}` ([Arthur], §3, pp. 15–16; [Borel],
  §1.5, Proposition, p. 8). These clauses do not determine the subgroup. For `G = G_m × T¹` over
  `ℚ`, with `T¹` the norm-one torus of a real quadratic field (anisotropic over `ℚ`, split over
  `ℝ`), the graph `{(t, φ(t))}` of a nontrivial homomorphism `φ : ℝ_{>0} → T¹(ℝ)^0` is central,
  archimedean, meets `G(𝔸)^1` trivially and is carried isomorphically onto `a_G` by `H_G`, but it is
  not `A_G(ℝ)^0 = ℝ_{>0} × {1}`. The defining clause: if the Hopf ideal `I` cuts out the maximal
  central `F`-split torus `S` of `G`, then `A_G(ℝ)^0` consists of the archimedean points of `S` at
  which every character of `S` takes one positive real value `t` at all archimedean places
  (the maximal `ℚ`-split torus of `Res_{F/ℚ} S` has the real points of `S` with real scalar
  character values). For `G_m` this is the group of positive reals embedded diagonally at the
  archimedean places, `AdelicExamples.GL1.posRealsDiag` (AA.5.1). *Needs:* AA.2.1;
  AA.1.4; AA.1.3; Tau Ceti `TauCeti.HopfIdeal.IsCentral`, `TauCeti.splitTorusCommHopfAlgProperty`.
  *Lean:* `AdelicExamples.GL1.posRealsDiag` for `G_m`; the general target is specified in the README.

  **Checks.**
  - For `GL_n` with `n ≥ 1`, `a_G` is one-dimensional and `A_G(ℝ)^0` (the positive real
    scalars at `∞` for `F = ℚ`) is homeomorphic to `ℝ`; `GL₀` is trivial and its split
    component is a point.
  - For `G_m` over a number field `F`, `a_G` and `A_G(ℝ)^0` are one-dimensional, whereas
    `(F ⊗ ℝ)^×_{>0}` has dimension `r₁ + r₂`: for `F` real quadratic the anti-diagonal direction
    is not split over `ℚ`.
  - For a connected reductive group with no rational characters, the split component is trivial.
  - In a real quadratic field (exactly two infinite places, both real), the idele with infinite
    components `2` and `1/2` and finite component `1` has norm `1` and lies outside
    `A_G(ℝ)^0`: its character value is not a
    scalar. This tests the subgroup, not just its dimension; the one-place subgroup
    `{(t, 1)}`, which passes the group-theoretic clauses, fails the defining clause.

- **`H_G` on the split centre.** (*log-height-split-centre-iso*) For a connected reductive group
  `G` over `F`, prove that the restriction of `H_G` to `A_G(ℝ)^0` is an isomorphism of
  topological groups onto `a_G`; in particular `H_G` is surjective ([Arthur], (5.1), p. 24).
  *Needs:* AA.2.1.
  *Lean:* none; specified in the README only.
- **`G(𝔸) = G(𝔸)^1 × A_G(ℝ)^0`.** (*split-centre-decomposition*) For a connected reductive group
  `G` over `F`, prove that multiplication `G(𝔸_F)^1 × A_G(ℝ)^0 → G(𝔸_F)` is an isomorphism of
  topological groups ([Arthur], §3, p. 16). *Needs:* AA.2.1.
  *Lean:* none; specified in the README only.
- **Two normalizations of the quotient.** (*quotient-norm-one-comparison*) For a connected
  reductive group `G` over `F`, prove that the inclusion `G(𝔸_F)^1 → G(𝔸_F)` induces a
  homeomorphism `G(F)\G(𝔸_F)^1 ≃ G(F)\G(𝔸_F)/A_G(ℝ)^0`, equivariant for `G(𝔸_F)^1` acting on the
  right. It is a theorem, not a definitional identity, and it fails if `A_G(ℝ)^0` is replaced by
  a larger central subgroup such as `Z(F_∞)^0` ([Arthur], §6, p. 30). *Needs:* AA.2.1; AA.1.3.
  *Lean:* none; specified in the README only.


  **Checks.**
  - The identity norm-one class maps to the identity split quotient class.
  - For `x ∈ G(𝔸)^1` and `a ∈ A_G(ℝ)^0`, the representatives `x` and `xa` give the same image.
  - Over a real quadratic field, the `(2,1/2)` idele with finite part `1` is nontrivial modulo
    rational points in the norm-one quotient, but becomes trivial after quotienting by the
    entire infinite centre.

### 2.2 Parabolic modulus and homogeneous integration

- **Modulus character of a parabolic.** For a finite-type affine `F`-group `P` with
  finite-dimensional identity cotangent space, define its modulus as the idele
  norm of the determinant of its adjoint action on the scalar extension of its Lie algebra
  to `𝔸_F`. In particular, for a parabolic `P = M_P N_P` of a connected reductive group,
  the Levi adjoint determinant is one, so this is
  `δ_P(p) = ‖det(Ad(p) | Lie N_P)‖`. The determinant is the unit-valued determinant of
  `Derivation.adjointAction`, not an arbitrary character supplied as data. Prove
  that it takes the value `1` on rational points by the product formula, and
  that it is identically `1` when `P` itself is connected reductive
  ([Arthur], §5, p. 25). *Needs:* AA.2.1; Tau Ceti `Derivation.adjointAction`;
  Mathlib `LinearEquiv.det`; the idele norm of GlobalNumberFields.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The trivial group has modulus `1`.
  - `G_m` has modulus `1` on every idele; the modulus is not the tautological character.
  - On `O(GL₂)/(X₁₀)`, with finite components the identity, the real matrices `diag(2,1)`
    and `diag(1,2)` have moduli `2` and `1/2`, but both ambient determinants have norm `2`.
- **Modular function of `P(𝔸)`.** For a parabolic `P` of a connected reductive `G` over a number
  field `F`, prove that Mathlib's modular character (`map (·p) μ_l = Δ(p) μ_l`) on `P(𝔸_F)` is
  `δ_P`; with mutually inversion-normalized left and right Haar measures,
  `dμ_l(p) = δ_P(p)⁻¹ dμ_r(p)`. For a proper parabolic `δ_P` is nontrivial; for `P = G` it is `1`
  ([Arthur], §5, p. 25). The statement holds for every
  finite-type `F`-group with finite-dimensional identity cotangent space: Mathlib's modular
  character of `P(𝔸_F)` is the modulus, the idele norm of the adjoint determinant.
  *Needs:* AA.2.2; AA.1.5; AA.1.3; Tau Ceti `TauCeti.Cocharacter.leviDecompositionMulEquiv`;
  Mathlib `MeasureTheory.Measure.modularCharacter`; AA.0.3;
  ReductiveGroupsPartII RG2.4, *parabolic-adjoint-determinant*.
  *Lean:* none; specified in the README only.

  The nonarchimedean inputs are ReductiveGroupsPartII RG2.4
  `LocalIntegration.modularCharacter_eq_adjointModulus` for the general adjoint determinant,
  and RG2.4 *parabolic-adjoint-determinant* for the algebraic comparison
  `det(Ad(p)|Lie P) = det(Ad(p)|Lie N)`, with the supplier contract above.
  AA owns the existence of points supported at a single finite place and their modulus: a point
  supported at a finite place has exactly the local adjoint modulus after scalar extension.
  Multiplication gives the finite-support product comparison; continuity and the integral
  compact-open subgroups give the restricted-product statement. Archimedean factors use
  the real/complex analytic change of variables. SR consumes the RG2 theorem directly
  and changes coefficients under its residue-cardinality invertibility hypotheses.
  No square root occurs here; a choice of square root belongs to normalized induction.

  **Checks.**
  - In the upper and the lower Borel of `GL₂`, put `diag(3,1)`
    at a residue-cardinality-three place of `ℚ`, with every other coordinate the identity:
    the adelic moduli are `1/3` and `3`. In general a point supported at one place
    has the local Haar modular character after base change. RG2's Checks for RG2.4
    *iwasawa-integration-and-unimodularity* (over `ℚ₃` and `𝔽₃((t))`, upper and lower Borel)
    check these same local numbers in both characteristics.

  - For the upper triangular Borel of `GL₂/ℚ`, the real point `diag(2, 1)` has modular character
    `2`, not `1/2`: right translation by it doubles left Haar
    measure, as `(a, x) ↦ (2a, x)` does for `da dx/a²` in the coordinates `n(x) diag(a, 1)`.
  - For `P = G`, the unipotent radical is trivial and both adjoint determinants are `1`;
    the adelic modular character is trivial.
- **Topology of a closed homogeneous quotient.** For a second countable locally compact
  Hausdorff topological group `G` and a closed subgroup `H ≤ G` acting by left multiplication,
  with `H\G` the orbit space with the quotient topology and `q : G → H\G` the projection, prove
  that `H\G` is locally compact, Hausdorff and second countable, that `q` is open, and that over
  each compact subset of `H\G` there is a compact subset of `G` whose image contains it
  ([Arthur], §1, pp. 7–9; [BHV], Appendix B.1, Lemma B.1.1, pp. 343–344). *Needs:* Mathlib
  locally compact groups and quotient topology.
  *Lean:* none; specified in the README only.
- **Continuity and support of fibre averaging.** (*fibre-average-continuous*) For `G` a second
  countable locally compact Hausdorff group, `H ≤ G` closed with a right Haar measure `dh`, and
  `f ∈ C_c(G, ℝ)`, prove that `P f(Hg) = ∫_H f(hg) dh` is a continuous compactly supported function
  on `H\G`, with support contained in `q(support f)`, and that `P` preserves positivity
  ([Arthur], §1, pp. 7–9; [BHV], Appendix B.1, Lemma B.1.2, p. 344). *Needs:* AA.2.2.
  *Lean:* none; specified in the README only.
- **A cutoff over a compact part of the quotient.** For `G` a second countable locally compact
  Hausdorff group, `H ≤ G` closed with a right Haar measure `dh`, `P` the fibre average of
  *fibre-average-continuous* and `C ⊂ H\G` compact, prove that there is `β ∈ C_c(G, ℝ)`, `β ≥ 0`,
  with `Pβ = 1` on `C` ([Arthur], §1, pp. 7–9; [BHV], Appendix B.1, Lemma B.1.2 and its proof,
  p. 344). *Needs:* AA.2.2.
  *Lean:* none; specified in the README only.
- **Averaging over a closed subgroup is surjective on compact supports.** For a closed subgroup
  `H` of a locally compact Hausdorff group `G` and a right Haar measure `dh` on `H`, prove that
  `P : C_c(G) → C_c(H\G)`, `(Pf)(Hg) = ∫_H f(hg) dh`, is surjective, and that every `f ≥ 0` in
  `C_c(H\G)` is `Pφ` for some `φ ≥ 0` ([Arthur], §1, p. 7; [BHV], Appendix B.1, Lemma B.1.2 and
  its proof, p. 344). *Needs:* AA.2.2.
  *Lean:* none; specified in the README only.
- **The right-Haar exchange identity.** For `G` a second countable locally compact Hausdorff
  group, `H ≤ G` closed, `dg` and `dh` right Haar measures on `G` and `H` with `Δ_G(h) = Δ_H(h)`
  for `h ∈ H` in the Mathlib `modularCharacter` convention, and `f, β ∈ C_c(G, ℝ)`, prove

  `∫_G β(g) Pf(Hg) dg = ∫_G f(g) Pβ(Hg) dg`

  ([Arthur], §1, pp. 7–9; [BHV], Appendix B.1, Lemma B.1.3, pp. 344–346). *Needs:* AA.2.2;
  Mathlib `MeasureTheory.Measure.modularCharacter`, `MeasureTheory.integral_prod`.
  *Lean:* none; specified in the README only.
- **Weil's functional is well defined under the modular condition.** For `G` locally compact
  Hausdorff, `H` a closed subgroup, `dg` and `dh` right Haar measures and `Δ_G|_H = Δ_H` in
  Mathlib's modular-character convention, prove that for `f ∈ C_c(G)`, `Pf = 0` implies
  `∫_G f dg = 0`; hence `Pf ↦ ∫_G f dg` is a well-defined positive `G`-invariant functional on
  `C_c(H\G)` ([Arthur], §1, p. 9; [BHV], Appendix B.1, Lemma B.1.3, pp. 344–346). *Needs:* AA.2.2.
  *Lean:* none; specified in the README only.
- **Invariant measure on a coset space.** (*quotient-measure*) Let `G` be a second countable
  locally compact Hausdorff group, `H ≤ G` a closed subgroup with `Δ_G` restricted to `H` equal
  to `Δ_H`, and `dg`, `dh` right Haar measures on the Borel sigma algebras; invariance means
  the right `G`-action on `H\G`.
  Define the measure `dġ` on the right coset space `H\G` given `dg`,
  `dh` and the modular condition, and prove
  `∫_G f dg = ∫_{H\G} ∫_H f(hg) dh dġ` for `f ∈ C_c(G)`, invariance
  under the right action of `G`, that any `G`-invariant Radon measure on
  `H\G` is a scalar multiple, and that replacing `dh` by `c • dh`
  replaces `dġ` by `c⁻¹ • dġ`; so `dġ` is the unique `G`-invariant Radon measure with the
  integral identity ([Platonov–Rapinchuk–Rapinchuk], Theorem 3.64, pp. 189–190;
  use inversion to pass from the book's left action on `G/H` to our right action
  on `H\G`). *Needs:* AA.2.2; Mathlib
  `RealRMK.integral_rieszMeasure`, `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`,
  `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.
  *Lean:* `HomogeneousMeasure.exists_unique_quotientMeasure`.

  **Checks.**
  - The source quotient carries its Borel sigma algebra. On a two-point discrete space, the
    identity from the trivial sigma algebra to the full sigma algebra is not measurable; an
    arbitrary measurable-space instance does not suffice.
  - For `H = ⊥` with its normalized counting measure, the quotient measure transported to `G`
    equals `dg`.
  - For `G = SL_2(ℝ)` and `H` its upper triangular Borel, `Δ_G|_H ≠ Δ_H`; the canonical
    homogeneous quotient `ℙ¹(ℝ)` has no nonzero invariant Radon measure.
  - For the upper triangular Borel in `SL₂(ℝ)`, the modular characters disagree; its quotient admits no nonzero invariant Radon measure.

- **Tonelli extension of quotient integration.** For `G` a second countable locally compact
  Hausdorff group, `H ≤ G` closed, `dg`, `dh` right Haar measures with `Δ_G|_H = Δ_H`, `dġ` the
  quotient measure of *quotient-measure* and `f : G → [0, ∞]` Borel, prove that fibre integration
  is measurable on `H\G` and that `∫_G f = ∫_{H\G} ∫_H f(hg) dh`, valid in `[0, ∞]` ([Arthur],
  §1, pp. 7–9). *Needs:* AA.2.2.
  *Lean:* none; specified in the README only.
- **Weil's formula for integrable functions.** In the setting of *quotient-measure*, for
  `f ∈ L¹(G)`, prove that `h ↦ f(hg)` is integrable on `H` for almost every `Hg`, that
  `Hg ↦ ∫_H f(hg) dh` is integrable on `H\G`, and that `∫_G f dg = ∫_{H\G} ∫_H f(hg) dh dġ`
  ([Arthur], §1, p. 9). *Needs:* AA.2.2.
  *Lean:* none; specified in the README only.
- **Quotient measures in stages.** For `G` a second countable locally compact Hausdorff group,
  closed subgroups `H₁ ≤ H₂ ≤ G`, and right Haar measures on `G`, `H₂`, `H₁` with `Δ_G = Δ_{H₂}`
  on `H₂` and `Δ_{H₂} = Δ_{H₁}` on `H₁`, prove that the quotient measure on `H₁\G` is the product
  of those on `H₂\G` and `H₁\H₂`: `∫_{H₁\G} f = ∫_{H₂\G} ∫_{H₁\H₂} f(hg) dh dg` ([Arthur], §1,
  p. 9). *Needs:* AA.2.2.
  *Lean:* none; specified in the README only.

  **Checks.**
  - In `{1} ≤ C₂ ≤ C₄` with counting measures, the intermediate quotient masses are `2`
    and `2`, and the final quotient has mass `4`.
  - Multiplying the middle Haar measure by `2` changes the two masses to `1` and `4`;
    their product remains `4`.
  - Also multiplying the bottom Haar measure by `3` gives masses `1` and `4/3`,
    and final mass `4/3`. The inner bottom measure is transported
    along the identification of `H₁` with a subgroup of `H₂`; scaling the middle measure
    cancels, scaling the bottom does not.

- **Inversion between left and right quotient conventions.** For any topological group `G` and
  subgroup `H`, define the homeomorphism `H\G ≃ₜ G/H` by `Hg ↦ g⁻¹H`.
  For `G` second countable locally compact Hausdorff and unimodular, `Γ` a countable discrete
  subgroup, and a normalized Haar measure `μ` that is left and right invariant, prove that inversion sends `Γg` to `g⁻¹Γ`, giving
  a homeomorphism `Γ\G ≃ G/Γ` that preserves the correspondingly normalized quotient measures,
  and that it carries left-orbit unfolding to Mathlib's right `Γ.op`-orbit unfolding; use the
  fundamental-domain quotient measures and the integrability/measurability hypotheses of
  Mathlib's theorem ([Arthur], §1, p. 7). *Needs:* Mathlib
  `QuotientGroup.integral_eq_integral_automorphize`,
  `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`,
  `MeasureTheory.QuotientMeasureEqMeasurePreimage`.
  *Lean:* none; specified in the README only.

### 2.3 Rational quotients

- **Borel fundamental domains for countable discrete subgroups.** For a countable discrete
  subgroup of a second countable locally compact Hausdorff group, use
  `MeasureTheory.Measure.exists_isFundamentalDomain_of_properlyDiscontinuousSMul`
  (`TauCeti/MeasureTheory/Group/ProperlyDiscontinuous.lean`). Translation is free, so its
  free-locus hypothesis is automatic. With the Borel sigma algebra, the supplied measurable
  domain is Borel. The construction by first occurrence in a countable cover meets every orbit.
  *Lean:* none; specified in the README only.
- **Fundamental domains for rational points.** For `G = Spec H` affine algebraic over `F` with
  `H` finitely generated, prove that `G(F)` acting on `G(𝔸_F)` (or `G(𝔸_F)^1`) by left
  translation admits a Borel fundamental domain for left Haar measure. When the ambient group
  is unimodular — for instance `G` connected reductive, by AA.1.5 and *split-centre-decomposition* —
  prove that the quotient measure on
  `G(F)\G(𝔸_F)` equals the pushforward of the restriction of Haar measure to any measurable
  fundamental domain, independently of the choice (existence is the preceding Tau Ceti supplier;
  the quotient-measure identity is Mathlib's
  `IsFundamentalDomain.quotientMeasure_eq`, with unimodularity identifying the left and right
  Haar conventions). *Needs:*
  AA.1.3; AA.1.2; Mathlib `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`,
  `MeasureTheory.QuotientMeasureEqMeasurePreimage`; AA.2.2; AA.2.3.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `G_a/ℚ`, `[0,1) × ∏ ℤ_p` is a fundamental domain.
  - For the trivial group, the singleton is a fundamental domain.
  - For `G_m/ℚ`, a Borel fundamental domain exists despite the infinite volume of the full quotient.

- **The measure on the automorphic quotient.** For connected reductive `G` with a Haar measure
  `dx` on `G(𝔸_F)` and Lebesgue measure on `a_G` (normalized by the lattice dual to `X*_F(G)`),
  define the measure on `[G]^1 = G(F)\G(𝔸_F)^1` attached to `dx`:
  the quotient (*quotient-measure*) of the measure on `G(𝔸)^1` induced via
  *split-centre-decomposition*; and its transport to
  `G(F)A_G(ℝ)^0\G(𝔸_F)` by *quotient-norm-one-comparison*. Prove
  right `G(𝔸)^1`-invariance for ordinary translation `[x]·g := [xg]` with
  `x,g ∈ G(𝔸)^1`. This action satisfies `([x]·g)·h = [x]·(gh)`; in Lean it is a left action
  of the opposite group `G(𝔸)^1ᵐᵒᵖ`. A multiplier with `H_G(g) ≠ 0` does not preserve the
  carrier, since `H_G(xg) = H_G(g)` for norm-one `x`. Prove
  that scaling `dx` by `c` scales the quotient measure by `c`, and the
  normalization: with `λ` the Haar measure on `a_G` giving
  the fundamental domains of the integral lattice `Hom(X*_F(G), ℤ)` mass one, a
  measurable `A ⊆ G(𝔸)^1` meeting each `G(F)`-orbit at most once and a measurable `E ⊆ a_G`
  satisfy `dx(A · (H_G|_{A_G(ℝ)^0})⁻¹(E)) = vol([A]) · λ(E)` ([Borel], Theorem 5.8, p. 22;
  [Arthur], §3, p. 16).
  Invariance and linearity in `dx` also hold for `c(G) · vol` with a constant depending only on
  `G`; the normalization fixes the constant. *Needs:* AA.2.1; AA.2.2; AA.2.3; AA.1.5.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `G` without rational characters (for instance semisimple `G`), `G(𝔸)^1 = G(𝔸)`, so the
    measure lives on `G(F)\G(𝔸)`.
  - For `GL_1`, the norm-one quotient has finite volume while the split component `ℝ_{>0}` is
    not compact, so `ℚ^×\𝔸^×` has infinite volume.
  - The idele `u_∞ = −1`, `u_p = 1` for every finite prime has norm one and is not principal:
    a rational element with all finite components `1` must be `1`, whose real component is `1`.
    Thus `[1]·u ≠ [1]`.
  - The positive split-central idele `g_∞ = 2`, `g_p = 1` has logarithmic height `log 2 ≠ 0`;
    ordinary translation by it leaves the norm-one carrier.
  - The lattice condition fixes the scale of `λ`: doubling `λ` gives a fundamental domain mass
    `2`. Over a quadratic field the positive scalar `t` has
    `H_G(t) = 2 log t`, so `λ` corresponds to `2 dt/t` on `A_{G_m}(ℝ)^0`, not `dt/t`.

### 2.4 Gauge forms and Tamagawa normalization

- **Invariant top-degree forms.** For a field `k` and a smooth affine algebraic group `G` of
  dimension `d` over `k` with finite-type coordinate Hopf algebra `H`, derive finite
  dimensionality of its identity cotangent space. For any commutative Hopf algebra whose
  identity cotangent space is finite-dimensional, define `ω_G`, with `d` the cotangent
  dimension, as the top exterior-power line `ω_G = ∧^d_k (𝔪_ε/𝔪_ε²)` of the cotangent
  module `(ker ε)/(ker ε)²` at the
  identity, the space of left-invariant top-degree differential forms; a gauge form is a nonzero
  vector in it. Prove `dim_k ω_G = 1`,
  that `ω_G` commutes with base change `k → k′`, through the canonical
  map `c ⊗ (dh₁ ∧ ⋯ ∧ dh_d) ↦ c • (d(1 ⊗ h₁) ∧ ⋯ ∧ d(1 ⊗ h_d))`
  (both sides are lines, so a linear equivalence alone could be any rescaling of it), and
  that right pullback by `g` acts on the left-invariant top-form line by
  `det(Ad(g))⁻¹` ([Rosengarten], §1.1, pp. 2–3). *Needs:* Tau Ceti `TauCeti.Bialgebra.CotangentSpace`,
  `Derivation.adjointPointRepresentation`; Mathlib `Ideal.Cotangent`, `Bialgebra.counitAlgHom`,
  `exteriorPower.ιMulti`; Tau Ceti `Derivation.adjointAction`; Mathlib `Module.evalEquiv`,
  `TensorProduct.lid`, `exteriorPower.map`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `G_m` the cotangent space at `1` is one-dimensional, spanned by the class of `T − 1`, so
    `ω_G` is spanned by `dT/T`.
  - For the upper triangular Borel of `GL_2`, right pullback by `diag(a,d)` multiplies a
    left-invariant gauge form by `(a/d)⁻¹`; for `a/d ≠ 1` it is not invariant.
  - For the trivial group, the degree-zero exterior power has dimension `1`, so the top-form line is the scalar field.
  - The canonical degree-zero identification sends the empty wedge to `1`
    and sends twice it to `2`. Over `ℚ`, these fixed forms have real absolute values `1`, `2`
    and 2-adic absolute values `1`, `1/2`. Over a finite extension `E/ℚ`, the empty-basis
    form with value `a` restricts with scalar `Algebra.norm ℚ a`.
  - The infinite torus `ℚ[ℕ →₀ ℤ]` has independent cotangent classes `T_i − 1` at every
    index; it fails the finite-dimensional hypothesis and has no `ω_G` in this API.


  **Checks.**
  - On the concrete Hopf quotient `O(GL₂)/(X₁₀)`, `diag(2,1)` has adjoint determinant `2`,
    cotangent determinant `1/2` and right pullback `ω ↦ (1/2)ω`.
  - `diag(1,2)` reverses these factors: `1/2`, `2` and `ω ↦ 2ω`.
    Thus pullback uses the inverse determinant.
  - The upper unipotent `[[1,1],[0,1]]` has both determinants `1` and fixes every invariant
    top form. These examples also check the adjoint action and the right action on the
    cotangent space of the named group, using the identity cotangent of the quotient Hopf algebra.
  - Along `ℚ → ℝ`, `1 ⊗ dT/T` for `G_m` goes to `d(1 ⊗ T)`, the class of `1 ⊗ T − 1` in the
    identity cotangent space; the rescaled equivalence, twice the base-change map, would send it
    to twice that class.

- **The Haar measure of a gauge form over a local field.** For a nondiscrete locally
  compact field `K` of characteristic zero, a smooth affine algebraic `K`-group `G` of
  dimension `d`, and a nonzero left-invariant top form `ω` defined over `K`, construct
  the measure `|ω|`: in a chart with `ω = f dx₁ ∧ ⋯ ∧ dx_d`, integrate
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
  In the nonarchimedean case these statements are made for arbitrary characteristic-zero
  nonarchimedean local fields with a specified valuation relation and a finite-type coordinate
  Hopf algebra. For a number field `F`, finite `v` and `G/F`, the local measure `|ω|_v` is
  the specialization to the scalar extension of `ω` to `F_v`;
  prove that it agrees with the local-field construction through the point adjunction, and that it
  is a Haar measure, scales by `|c|_v` and satisfies the translation formula (for rational `g`).
  For a finite-type `F`-group over the number
  field `F`, the archimedean product
  `∏_{w|∞} |ω|_w` on `G(F ⊗ ℝ)` is a Haar measure, a scalar `c ∈ F` multiplies it by
  `∏_w |c|_w`, squared at complex places, and for `G_a` it is
  `μ_∞`. These clauses determine the measures attached to `G_a` and to `G_m`; for
  a general group the constant is fixed by the chart construction or, at finite places, by
  Weil's formula below for smooth integral models, with `GL_n` as a normalization check.
  The archimedean constant comes from the chart construction. *Needs:* AA.2.4; ReductiveGroupsPartII, RG2.0 (point topology);
  RG2.0 *smooth-group-analytic-charts*, as specified in the local analytic supplier contract.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `G_a` with coordinate `T`, the image of `|dT|_v` under `x ↦ x(T)` is the
    standard Haar measure of `F_v` (`𝒪_v` of volume `1`).
  - `|dT/T|_v` on `ℚ_p^×` is not the normalized idele measure of AA.0.4: they differ
    by the factor `1 − p⁻¹ ≠ 1`.
  - For `G_m`, the actual mass of integral units is `1 − q_v⁻¹`, in particular `1/2` when `q_v = 2`.

  - For `G_a/ℂ` and `ω = dz`, the unit square has mass `2`; for `G_a²/ℂ`
    the product square has mass `4`; replacing `2 dx dy` by `dx dy` would give `1` in both cases.
  - The square `[0,2] × [0,2]` has mass `8`, four times the
    unit square's mass. The real segment `[0,1] × {0}` has mass zero.
    Both test the complex coordinate measure itself.

- **Weil's volume formula for integral points.** Let `𝓗` be a smooth affine group scheme of
  relative dimension `d` over `𝒪_v` with residue field `k_v` of order `q_v`, and `ω` a gauge form
  of the generic fibre that extends to a generator of the invariant top forms of `𝓗`. Prove
  `|ω|_v(𝓗(𝒪_v)) = #𝓗(k_v) · q_v^{−d}` ([Gordon], §2.1, equation (1), p. 3). For the standard
  model of `GL_n` and the wedge of the coordinate classes `d(X_ij − δ_ij)` this
  fixes the scale of the local measure on `GL_n`, which the
  scaling and translation clauses leave open. *Needs:* AA.2.4; AA.1.1.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `G_a/𝒪_v` with `ω = dT`, the formula gives `q_v · q_v⁻¹ = 1`.
  - For `G_m/𝒪_v` with `ω = dT/T`, it gives `(q_v − 1) q_v⁻¹ = 1 − q_v⁻¹`.
  - For `GL₂` at `q_v = 2`, `|ω|_v(GL₂(𝒪_v)) = 6/16 = 3/8`; a measure
    normalized by `vol(GL₂(𝒪_v)) = 1` satisfies the other clauses and gives `1`.
- **Convergence factors from the character module.** (*convergence-factors*) For `G = Spec H`
  affine algebraic over `F` with `H` finitely generated and `G` connected, let
  `X = X*(G_{F̄}) ⊗ ℂ` with its continuous finite-image Galois action. The local Artin
  factor is `L_v(X,s) = det(1 − q_v^{−s} Frob_v | X^{I_v})⁻¹`.
  The split specialization is
  `L_v^split(r,s) = (1 − q_v^{−s})^{−r}` and
  `ρ_F^split(r) = (Res_{s=1} ζ_F)^r`.
  AA owns the general finite-image Artin factors and analytic assembly: for a continuous finite-image
  complex representation `ρ : Gal(F̄/F) → GL(V)` on a finite-dimensional complex vector
  space `V`, construct the inertia-invariant subspace `V^{I_v}` and the determinant
  `det(1 − q_v^{−s} ρ(Φ_v) | V^{I_v})`, where `Φ_v` is an arithmetic Frobenius lift.
  Prove independence of the lift and of the chosen place above `v`, invariance under
  representation isomorphisms, and multiplicativity under direct sums. Its reciprocal is
  the local Artin factor; its induction formula includes ramified places.
  The global `L`-function is identified with the Euler product on `Re s > 1`;
  `(s−1)^r L(X,s)` has a finite nonzero limit,
  where `r = dim X^Gal`. For a character lattice this real limit is positive.
  These targets feed the character-module local factors and leading coefficient
  and the Artin product formula for the Tamagawa measure. The split formulas remain
  specializations of the character-module ones.
  Use the pinned abstract Brauer induction, nilpotent monomiality and induction transitivity
  in the supplier table to express each character of the finite Galois image as an integral
  combination of characters induced from linear characters of subgroups. This reduces
  the Artin construction to finite-order Hecke characters.
  Consume the Hecke and one-dimensional Artin–Hecke contracts in the table above, including `heckeLFunctionC_eq_primitive`
  and `heckeLFunction_ne_zero_of_one_le_re`; the analytic dependency is
  AA → LFunctions → ThetaSeries, with GlobalNumberFields and
  ArithmeticDirichletSeries providing the carriers. The analytic hypotheses of
  the nonvanishing of the leading coefficient are precisely that Hecke/reciprocity contract.
  AA constructs the complex Artin factors, their ramified induction identity and analytic
  assembly for these finite-image complex representations.
  General Artin coefficients need not be completely multiplicative
  and do not inhabit `UnitaryIdealWeight`.
  Use arithmetic Frobenius throughout; if a reciprocity API uses geometric Frobenius,
  compose its reciprocity map with inversion before forming the Hecke character.
  A one-dimensional unramified factor is
  `(1 − χ(Frob_v) q_v^(−s))⁻¹`. At conductor primes with nontrivial inertia the
  one-dimensional invariant space is zero and the factor is one. For a larger ray modulus,
  LFunctions' `eulerCorrection` deletes precisely its additional factors; compare germs at poles,
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
  Tau Ceti `TauCeti.dedekindZeta_eulerProduct_hasProd`;
  RepresentationTheory/InductionRestriction, layer 6, with the pinned Brauer/monomial
  and induction-transitivity contracts above; the Hecke/reciprocity contracts above.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The rank-one trivial determinant Euler product is
    Dedekind zeta; in general the global `L`-function of the trivial character is `ζ_F` as a
    meromorphic germ.
  - The nontrivial character of `ℚ(i)/ℚ` is the
    primitive character `χ₄`, under reciprocity the odd primitive ray class character of
    conductor `4∞`. Its factor at 2 is one and its germ at one is the value `L(1, χ₄) = π/4 ≠ 0`.
    Raising the modulus 4 to 12 gives the correction `1 + 3^(−s)` (as `χ₄(3) = −1`), so the
    function at modulus 12 takes the value `(π/4)(4/3) = π/3` at one. These are specializations
    of the one-dimensional Artin–Hecke comparison. Arithmetic Frobenius distinguishes eigenvalue `ζ` from `ζ⁻¹` for a
    nontrivial cube root of unity: at `q=2` and `s=1` the factors are distinct.
  - `Ind_{ℚ(i)}^ℚ 1 = 1 ⊕ χ₄` gives `ζ_{ℚ(i)}`
    on the convergence half-plane and as meromorphic germs. In general
    `L_F(Ind_E^F 1,s)=ζ_E(s)` for every finite
    separable extension, using the ramified induction identity at every place.
    The inertia-fixed line at 2 is checked in AA.2.5 (*Inductivity of the convergence factors*).

  - Rank zero gives `L_v^split(0,s) = 1`, including at `s = 1`.
  - For a place of residue cardinality `2`, rank one at `s = 1` gives `2`, as for `G_m`.
  - At the same place rank two gives `4`, as for `G_m²`. This interface applies only to trivial Galois action.
  - `ρ_F^split(0) = 1`;
    `ρ_F^split(1) = Res_{s=1} ζ_F`;
    `ρ_F^split(2)` is the square of that residue.
    The local rank-two factor and double-pole coefficient both use the exponent `2`.

- **Orders of connected reductive groups over finite fields.** For a connected reductive
  group `H/𝔽_q`, choose a Frobenius-stable Borel pair `(B,T)` over the algebraic closure.
  Put `W = W(H,T)`, `N = #Φ⁺` and let `F*` act on `X*(T)`. Prove
  `#H(𝔽_q) = q^N · #T(𝔽_q) · ∑_{w∈W^F} q^{ℓ(w)}` and
  `#T(𝔽_q) = |det(F* − 1 | X*(T) ⊗ ℚ)|`.
  Use absolute Weyl-group length. These are [Dudas–Michel], Proposition 7.12(iii),
  p. 27, and the character-lattice cokernel argument in Proposition 7.14, p. 28;
  the absolute value makes the determinant the lattice index. Build this input here
  from ReductiveGroups, layer 7 (Bruhat decomposition), and ReductiveGroupsPartII,
  RG2.3.7, *lang-theorem*, `Lang.lang_surjective` (Lang's theorem for smooth geometrically
  connected finite-type groups over finite fields).
  *Lean:* none; specified in the README only.

  **Checks.** Split rank one at `q = 2` gives `|2 − 1| = 1`; nonsplit rank one
  gives `|−2 − 1| = 3`, not `−3`.
  For split `SL₂/𝔽₂`, the formula gives `2 · 1 · (1 + 2) = 6`.

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
  AA.1.1 (reductive models outside finitely many places); ReductiveGroups, layer 7;
  `TauCeti.dedekindZeta_eulerProduct_hasProd`.
  *Lean:* none; specified in the README only.
- **Tamagawa measure.** For `G = Spec H` affine algebraic over `F` with `H` finitely generated,
  `G` smooth connected of dimension `d`, `ρ_G` existing by *convergence-factors*, finite and
  strictly positive, and the product of corrected integral volumes absolutely convergent and
  nonzero, define the Tamagawa measure `τ_G` on `AdelicPoints H`,
  `τ_G = |d_F|^{−d/2} ρ_G⁻¹` times the convergent Haar product of `μ_v = λ_v |ω|_v`. At finite
  `v`, `λ_v = L_v(X*(G_{F̄}) ⊗ ℂ, 1)`, including ramified inertia invariants; at infinite `v`,
  `λ_v = 1`. Use the specified additive normalizations `dx`, `2 dx dy` and `vol(𝒪_v) = 1`.
  Connected reductive groups satisfy the separate convergence target above. If the geometric
  character lattice is zero, `λ_v = ρ_G = 1`, but the gauge integral masses still need the
  convergent-product construction. Prove that `τ_G` is a Haar measure. Prove the Artin product
  formula for every connected reductive group, with the character-module local factors and
  leading coefficient: on a product of finitely many local sets and almost all `𝓗(𝒪_v)`, `τ_G` is
  `|d_F|^{−d/2} ρ_G⁻¹ ∏ λ_v |ω|_v(C_v)`. Its split-character specialization covers groups whose
  geometric characters are all rational (base change of rational characters surjective), where
  `λ_v = L_v^split(r,1)` and `ρ_G = ρ_F^split(r)`, with the
  archimedean factor `∏_{w|∞} |ω|_w`. Prove that for `G_a` the measure is
  `|d_F|^{−1/2} • μ_𝔸`, and prove compatibility with restriction of
  scalars (*tamagawa-restriction-scalars*). The Haar-product construction is
  [Platonov–Rapinchuk–Rapinchuk], proof of Theorem 5.22, p. 315; the canonical
  Artin and scalar-restriction normalizations use the named suppliers in
  *convergence-factors* and AA.2.5. [Gordon], equation (48), p. 32, checks the
  imaginary-quadratic restriction torus, not the general normalization theorem. *Needs:* AA.2.4; AA.0.2; AA.0.3;
  AA.0.4.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `G_a` over `ℚ`, `τ_G` of the `ℚ\𝔸` fundamental domain `[0,1) × ℤ̂` is `1`.
  - For `G_m` the naive product `∏ |dT/T|_p` does not give a nonzero Haar measure on `𝔸^×`: the volumes `1 − p⁻¹`
    have product `0` because `Σ_p 1/p` diverges; `τ_G` uses `λ_v = (1 − q_v⁻¹)⁻¹` and
    `ρ = Res ζ_F`.
  - For the trivial group and any nonzero form, the measure is the unit point mass.
  - For `G_m`, `λ_v · |dT/T|_v(𝒪_v^×) = (1 − q_v⁻¹)⁻¹ (1 − q_v⁻¹) = 1` at every finite place,
    so the integral factors in the split product formula are `1`; with
    `λ_v = 1` their product over all `v` would be `0`.
  - Over an imaginary quadratic field, scaling the form by `2` scales the archimedean factor by
    `|2|_ℂ = 4`; the measure `dx dy` at the complex place
    would also give `4`, but a factor `|c|` instead of `|c|²` would give `2`.

- **Independence of the gauge form.** For `G = Spec H` affine algebraic over `F` with `H`
  finitely generated, prove that `τ_G` does not depend on the gauge form `ω`: replacing `ω` by
  `cω` with `c ∈ F^×` multiplies each `|ω|_v` by `|c|_v`, and `∏_v |c|_v = 1` ([Rosengarten], §1,
  p. 2). *Needs:* AA.2.4; Tau Ceti `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`;
  AA.0.3.
  *Lean:* none; specified in the README only.
- **Corrected volumes for `GL_n` and `SL_n`.** For `n ≥ 1` and the standard models of `GL_n` and `SL_n` over
  `𝒪_F` and their standard gauge forms, prove that at every finite place `v`,
  `λ_v · #GL_n(k_v) q_v^{−n²} = ∏_{i=2}^{n} (1 − q_v^{−i})` with `λ_v = (1 − q_v^{−1})^{−1}`, and
  `#SL_n(k_v) q_v^{−(n²−1)} = ∏_{i=2}^{n} (1 − q_v^{−i})`; both products over `v` converge
  absolutely (derive from the preceding order formula; [Platonov–Rapinchuk–Rapinchuk],
  Example 5.23, p. 316, computes the `SL₂/ℚ` case). *Needs:* AA.2.4.
  *Lean:* none; specified in the README only.
  **Checks.** At `q = 2`, `#GL₂(𝔽₂) = 6`, so the corrected volume is
  `2 · 6/16 = 3/4`. In rank zero the group has one element and dimension zero;
  the GL correction would give `2`, whereas the empty product is `1`. Thus the
  displayed corrected GL formula requires `n ≥ 1`. There is no field of cardinality one.

- **Tamagawa number.** For connected reductive `G`, define the Tamagawa number in `ℝ≥0∞`,
  `τ(G) = vol(G(F)\G(𝔸_F)^1)` for the measure on `G(𝔸)^1` induced by `τ_G` and the Lebesgue
  measure on `a_G` normalized by the lattice `Hom(X*_F(G), ℤ)` (through
  *split-centre-decomposition* and *log-height-split-centre-iso*), with counting measure on
  `G(F)`, as an element of `[0, ∞]`. Prove that `τ(G) > 0` and
  that `τ(Res_{E/F} G) = τ(G)`; its finiteness is
  AA.3.4 ([Rosengarten], §1, p. 3). *Needs:* AA.2.4; AA.2.3; AA.2.1.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For the trivial group `τ = 1`.
  - Replacing the auxiliary gauge form by twice that form leaves `τ(G)` unchanged:
    its local scaling factors have product one.
  - Replacing the Lebesgue measure on `a_G` by twice that measure divides the induced
    norm-one quotient measure by two; the lattice normalization excludes this change.
  - `vol(G_m(F)\G_m(𝔸)) = ∞` because the split component `ℝ_{>0}` is not compact; `τ` uses the
    norm-one quotient.

**Checks.** For the diagonal positive scalar `t` in `G_m/F`, the idele norm is
`t^[F:ℚ]`. At degree two, `t = 2` gives norm `4` and
logarithm `2 log 2`. Consequently the lattice-normalized logarithmic measure is `2 dt/t` in
this case.

### 2.5 Scalar Jacobians and restriction of scalars

The linear measure input in the next target is MassFormula, Layer 2:
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
  *Lean:* none; specified in the README only.
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
  *Lean:* none; specified in the README only.
- **Global scalar Jacobian and absolute discriminants.** For `E/F` a finite extension of number
  fields of degree `n`, an `F`-basis `β` of `E`, `j_{β,v}` as defined in
  *restriction-finite-jacobian* and *restriction-infinite-jacobian*, and `d ≥ 0`, prove that the
  positive factors `j_{β,v}` equal `1` at almost all finite `v` and that
  `∏_v j_{β,v} = |d_F|^{[E:F]/2} |d_E|^{−1/2}`; thus `|d_F|^{−nd/2} ∏_v j_{β,v}^d = |d_E|^{−d/2}`.
  This global product formula is deduced from the two local Jacobians.
  Use `NumberField.discr_eq_of_integralBasis` to identify the integral trace
  determinant, `Algebra.discr_of_matrix_vecMul` for the square of a basis-change
  determinant, and `AddSubgroup.index_eq_natAbs_det` on global `ℤ`-lattices
  after clearing denominators. Decompose their finite quotient into its primary
  parts to obtain the local lattice indices; no local integer ring is assumed
  finite over `ℤ`. At real places the embedding determinant has
  the factor `2^b` already present in the complex Haar normalization. Multiply
  these equalities and use
  `TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one` on the nonzero
  basis-change determinant to remove the choice of basis. Thus no arbitrary
  basis is assumed integral at every place. This is an owned deduction from
  these exact APIs, not a generalization of the quadratic-torus calculation.
  *Needs:* the preceding finite and infinite Jacobians; NumberFieldArithmetic,
  layer 4; the exact trace, index and product-formula suppliers above.
  *Lean:* none; specified in the README only.

- **Gauge forms under restriction of scalars.** For a finite extension of number fields `E/F`,
  a smooth connected affine `E`-group `G_E` of dimension `d ≥ 0` and a gauge form `ω_E`, choose
  an `F`-basis `β` of `E` and any `E`-basis `e_1, …, e_d` of `Lie(G_E)`. Put
  `a = ω_E(e_1, …, e_d) ∈ E^×`. Define the invariant `F`-top form `ω_β` by
  `ω_β((β_j e_i)_{i,j}) = N_{E/F}(a)`, ordering first by `i`, then by `j`.
  A change of `E`-basis by `M` multiplies `a` by `det_E M` and the restricted basis determinant
  by `N_{E/F}(det_E M)` (`LinearMap.det_restrictScalars`), so the form is independent of `e`.
  Scaling `ω_E` by `c ∈ E^×` scales `ω_β` by `N_{E/F}(c)`. In dimension zero the empty basis
  gives `a = ω_E ∈ E^×` and `ω_β = N_{E/F}(ω_E)` in the degree-zero exterior-power line.
  At `v`, transport `|ω_β|_v` to `G_E(∏_{w|v} E_w)` and prove that it equals
  `j_{β,v}^d ∏_{w|v} |ω_E|_w`, where `j_{β,v}` is defined by
  `(β-coordinates)_* μ_{F_v}^{[E:F]} = j_{β,v} ∏_{w|v} μ_{E_w}`. It depends on `β` and is not an
  unspecified square root of a local discriminant. This is a chartwise deduction
  from `|N_{E/F}(a)|_v = ∏_{w|v} |a|_w`, the preceding local Jacobians and [Platonov–Rapinchuk–Rapinchuk],
  Theorem 3.71, p. 196; it does not use a general scalar-restriction assertion
  from [Rosengarten], §1, p. 2. *Needs:* AA.2.4;
  AA.1.4; GlobalNumberFields, layer 0; AA.2.5; Mathlib `LinearMap.det_restrictScalars`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For the trivial group and `ω_E = 1`, both forms give the one-point group mass one at every
    place, including the real and 2-adic places of `E = F = ℚ`.
  - For the trivial group over `E = F = ℚ` and `ω_E = 2`, the restricted form is `2`, with mass
    `2` at infinity and `1/2` at 2. The scalar Jacobian contributes `j_{β,v}^0 = 1`, and the
    product formula cancels the gauge scaling globally.
  - For the trivial group over `ℚ(i)/ℚ`, the gauge `1+i` restricts to the scalar
    `N_{ℚ(i)/ℚ}(1+i) = 2`. The complex mass is `2`, and the mass at the place above 2 is `1/2`,
    agreeing with the real and 2-adic masses of the restricted form.
  - For `E = F`, `G = G_a`, `ω_E = dx` and `β = (b)`, the construction gives `ω_β = b⁻¹ dx`
    and `j_{β,v} = |b|_v⁻¹`.
- **Inductivity of the convergence factors.** For a finite separable `E/F` and a finite-image
  complex Galois representation `X` over `E`, prove that the induced representation satisfies
  `L_v(Ind X, s) = ∏_{w|v} L_w(X, s)` at every finite `v`, including ramified `v` with inertia
  invariants; consequently their global Euler products coincide for `Re(s) > 1` and their leading
  coefficients coincide whenever the stated nonzero limits at `s = 1` exist.
  The local identity is proved using the
  decomposition-group double cosets and the determinant on the inertia-fixed
  cyclic blocks of length `f(w/v)`. [Marzec–Neururer], Proposition 5.10, pp. 61–62,
  and Theorem 5.14(iv), pp. 63–64. *Needs:* AA.2.4, finite-image Artin factors.
  *Lean:* none; specified in the README only.

  **Checks.** For `ℚ(i)/ℚ` at `2`, inertia swaps the two basis vectors of
  `Ind 1`. Its invariant space is the diagonal line, Frobenius is identity
  there, and both factors are `(1−2^{−s})⁻¹`; using the full two-dimensional
  space incorrectly squares the factor.
  Rank-zero inertia invariants give factor one.
  A residue-degree-two block has determinant `1−z²`, not `(1−z)²`.

- **Tamagawa measures and restriction of scalars.** (*tamagawa-restriction-scalars*) Let `E/F`
  be a finite extension of number fields and `G_E` a connected reductive `E`-group of dimension
  `d`, with the Artin leading coefficients and Haar products having the existence and
  convergence proved in the named inputs. Prove that the canonical topological group isomorphism
  `Res_{E/F} G_E(𝔸_F) → G_E(𝔸_E)`, together with the induced character-space map and its
  integral-lattice Lebesgue normalization, transports Tamagawa measures and norm-one quotient
  measures; in particular the Tamagawa numbers agree. The extension to connected nonreductive
  groups requires the Levi/unipotent integration input of AA.3. This is an owned
  deduction from the preceding three comparisons; its inputs are the inductivity of the
  convergence factors, the nonvanishing of their leading coefficients (*convergence-factors*),
  the global scalar Jacobian and the Artin product formula for `τ_G` (AA.2.4).
  [Gordon], equation (48), p. 32, is a quadratic-torus Check only. The two statements are
  that the isomorphism of *base-change-adelic* carries `τ_{Res G_E}` to `τ_{G_E}` and that
  `τ(Res_{E/F} G_E) = τ(G_E)`,
  for arbitrary nonzero gauge forms on the two sides, which is legitimate because `τ` does not
  depend on the form (*Independence of the gauge form* and the one-dimensional top-form line,
  `dim ω_G = 1`).
  *Needs:* AA.2.4; AA.1.4; GlobalNumberFields, layer 0; NumberFieldArithmetic, layer 4; AA.2.5.
  *Lean:* none; specified in the README only.

  **Checks.**
  - `E = F` gives the identity transport on measures and character spaces.
  - Restriction of the trivial group preserves its one-point measure of mass one.
  - `τ(Res_{E/F} G_m) = τ(G_m)` although `Res_{E/F} G_m` has dimension `[E : F]`.
    Without the factors `|d|^{−d/2}` the two sides would be multiplied by
    `|d_F|^{[E:F]/2}` and `|d_E|^{1/2}`, which are `1` and `2` for `ℚ(i)/ℚ`.

### Examples

for `n ≥ 1`, `X*_F(GL_n) ≃ ℤ`, generated by the determinant, and `a_{GL_n}` is one-dimensional
(for `n = 0` both are zero); for
`Res_{ℚ(i)/ℚ} G_m` the rational rank is `1` while the geometric rank is `2`. The norm-one idele
`(p, p, 1, …)` separates `G(𝔸)^1` from `G(F_∞)^1 × G(𝔸_f)`. `ℙ¹(ℝ) = B\SL_2(ℝ)` has no nonzero
invariant Radon measure, while `H = ⊥` recovers Haar measure. `|dT/T|_p` on `ℚ_p^×` differs from
the idele normalization by `1 − p⁻¹`, `τ_{G_a}` of `[0,1) × ℤ̂` for `G_a/ℚ` is `1`, and
`L_v^split(1,1)` is `2` at residue cardinality `2`, and rank two gives `4`.

### Dependencies

Layers AA.0 and AA.1; Mathlib's group-like elements, modular character, Riesz representation,
fundamental domains, `L²` spaces, exterior powers and Dedekind zeta residues; Tau Ceti's geometric
characters with their Galois action, cotangent spaces, adjoint representation, dynamic parabolics
and Euler product; ReductiveGroups, layers 4, 5 and 7; ReductiveGroupsPartII,
RG2.0, RG2.1, RG2.3 (Lang's theorem) and RG2.4 (adjoint-modulus comparison);
GlobalNumberFields, layers 0 and 6; NumberFieldArithmetic, layer 4;
LFunctions, Layer 5 for primitive finite-order Hecke continuation using ThetaSeries and Layer 7 for nonvanishing;
ClassFieldTheory reciprocity;
RepresentationTheory/InductionRestriction, layer 6 (Brauer and monomial induction).

## Layer 3: reduction and arithmetic quotients

Begin with rational parabolic data, real Siegel coordinates and the primitive `GL_n` and
closed-orbit reductions. Their adelic consequences give finite class sets, finite volume and
compactness criteria. Heights quantify growth; the fixed-`K` real theory controls cusps and
subgroup orbit maps.

### 3.1 Rational parabolics and Iwasawa integration

- **Algebraic Levi decompositions.** For a finite-type commutative Hopf algebra `H/F`
  and a Hopf ideal `P` cutting out a closed subgroup, define a Levi decomposition of `P`:
  Hopf ideals `N` and `M` containing `P`; the corresponding closed subgroups are smooth
  unipotent and connected reductive, respectively. On every commutative `F`-algebra `R`,
  `N(R)` is normal in `P(R)` and each `p ∈ P(R)` has a unique expression `n m`.
  These point groups are `TauCeti.CommHopfAlgCat.quotientPointsSubgroup`, so the multiplication
  equation is in the original group `G(R)`. For `char F = 0` and geometrically connected
  `P`, prove that a Levi decomposition exists ([Borel], §1.13, p. 11).
  This structure records algebraic subgroups; the dynamic point decomposition above remains
  the supplier for cocharacter parabolics. *Needs:* Tau Ceti Hopf ideals and quotient points.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `G_m`, `N` is the identity and `M` the whole group.
  - For `G_a` in characteristic zero, `N` is the whole group and `M` the identity.
  - For `GL_2`, `M` is the whole group and `N` the identity.

- **Relative roots with their adjoint realization.** For a connected reductive `F`-group
  represented by `H`, construct its relative root data. Their maximal split torus
  `S₀` is a Hopf ideal with the existing `TauCeti.splitTorusCommHopfAlgProperty`; maximality
  reverses the ideal order. Set `X = X*(S₀) = Additive (GroupLike F (H/S₀))` and
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
  positivity of the multiplicity exactly at the roots away from zero. These are realization
  conditions, not a free choice
  of an unrelated abstract root pairing. Sources: [Borel–Tits](https://www.numdam.org/item/PMIHES_1965__27__55_0.pdf),
  §5.3, p. 96 and §5.8, p. 98; [Platonov–Rapinchuk–Rapinchuk], §2.1.14, pp. 75–76.
  The latter's §2.1.11 is the regular-semisimple section, not the relative-root locator.
  *Needs:* Tau Ceti split tori, Hopf quotient points, counit derivations and adjoint action;
  Mathlib `RootPairing` and `DirectSum.IsInternal`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The diagonal torus of split `GL_n` has roots `e_i − e_j`, `i ≠ j`,
    multiplicity one and Weyl group `Equiv.Perm (Fin n)`, including `n = 0,1`.
  - `G_m` has no roots, trivial Weyl group and zero-weight dimension one;
    the trivial group instead has zero-weight dimension zero.
  - The diagonal torus of `SL₂` has roots `±α`, both with multiplicity one.
  - For a quadratic field extension `E/F` in characteristic zero with
    nontrivial involution, the special unitary group of the antidiagonal Hermitian form
    has roots `±α, ±2α`, multiplicities `2,1`, and Weyl group of order two. This includes
    an unramified quadratic extension of a nonarchimedean local field. Its carrier is cut
    out inside `Res_{E/F} GL₃` by `det A = 1` and `τ(A)ᵀ J A = J`, using the sibling
    roadmap's coefficient-natural Weil restriction. The identity, a diagonal element and the
    exclusion of a nonidentity scalar distinguish this group from all of `Res GL₃`.

  **Checks for the realization maps.** The zero character gives the constant unit,
  the negative of a character gives reciprocal evaluation, and every nonzero character is
  detected on geometric points. The centralizer of a torus is the whole torus; for
  `GL₂` and `GL₃` the centralizer of the maximal torus is the torus itself, with Weyl orders
  two and six. The root-ray group of the upper root of `GL₂` is the upper additive subgroup;
  opposite rays intersect trivially; doubling a root
  retains the same contraction ray (the ray group is not the
  smaller long-root group in a nonreduced system). The
  unconstrained zero-character intersection is the whole group; zero is excluded from
  the root set and from every use as a root subgroup.

- **Minimal rational parabolics and standard parabolics.** For a connected reductive group `G`
  over `F`, fix a minimal `F`-parabolic `P_0 ⊂ G` with Levi decomposition `P_0 = M_0 N_0`, `M_0`
  the centralizer of a maximal `F`-split torus `S_0`: define the minimal parabolic data
  `P_0, M_0, N_0, S_0` with the Levi decomposition. A standard parabolic is an
  `F`-parabolic `P ⊇ P_0`; it has a unique Levi component `M_P ⊇ M_0`, unipotent radical `N_P`,
  and split component `A_P = A_{M_P}`: define the finite type of
  standard parabolics with `M_P`, `N_P`, `A_P`. Prove that the standard parabolics are in
  bijection with `Finset Δ_0`, the subsets of the simple relative roots,
  that every `F`-parabolic is `G(F)`-conjugate to a unique
  standard parabolic, and that `P ≤ P′` iff the corresponding
  subsets satisfy `Δ_0^P ⊆ Δ_0^{P′}`, with the convention that the subset lists the simple roots
  of `M_P`; so the standard parabolics are finite in number ([Arthur], §4, p. 22). *Needs:*
  ReductiveGroups, layer 7; Tau Ceti `TauCeti.Cocharacter.parabolic`,
  `TauCeti.Cocharacter.unipotent`, `TauCeti.Cocharacter.leviDecompositionMulEquiv`; AA.2.1.
  *Lean:* none; specified in the README only.

  The defining equations hold on **every** coefficient algebra: for a regular dominant
  cocharacter of `S₀`, `P₀(R) = Cocharacter.parabolic R λ`,
  `N₀(R) = Cocharacter.unipotent R λ`, and `M₀(R) = Cocharacter.levi R λ`.
  Moreover `M₀ = Z_G(S₀)`. The cocharacter's pullback sends `χ` to `T^{⟨χ,λ⟩}` and
  has strictly positive pairing with every simple root. **Checks:** the dominant cocharacter
  kills the torus ideal, gives a positive Laurent exponent on each
  simple character, and is not the constant cocharacter when roots exist. The subset for `P` consists of
  the simple roots whose negative root-ray group is contained in `P`, on every algebra.
  Here the root-ray group is the intersection of the cocharacter contraction groups with
  positive pairing against that root; in a nonreduced system it includes the double root.
  The Levi decomposition of a standard parabolic is the unique one containing `M₀`.
  Borel–Tits §5.9, p. 98 and §§5.12, 5.14, p. 99 give the positive-system and conjugacy
  classification. The order is subgroup inclusion, hence reverse inclusion of Hopf ideals.

  **Checks.**
  - A torus has one standard parabolic.
  - For `GL_2/ℚ` there are exactly two standard parabolics: the upper Borel and `GL_2`.
  - For `GL_3` there are `4` standard parabolics.
  - For `GL_2` over `ℚ` the lower triangular Borel is a parabolic that is not standard; it is
    conjugate to the standard one by the Weyl element.
- **Relative chambers and the spaces `a_P`.** For a connected reductive group `G` over `F` and
  standard `P`, define the real vector space `a_P = a_{M_P}` (AA.2.1), with
  `a_0 = a_{P_0}`; for `P_1 ⊆ P_2`, the canonical linear projection
  `a_{P_1} → a_{P_2}` dual to restriction of rational characters, whose kernel is the relative
  space `a_{P_1}^{P_2}`; `ρ_P = (1/2) ∑_{α∈Φ_P} (dim 𝔫_α) α ∈ (a_P^G)^*`;
  `Δ_P ⊂ (a_P^G)^*`, the restrictions of `Δ_0 ∖ Δ_0^P`, a basis; and
  the positive chamber `a_P^+ = {H | ∀ α ∈ Δ_P, 0 < α H}`. The roots `Φ_P` of `(P, A_P)`
  lie in `(a_P^G)^*`. Prove the splitting: for `P₁ ≤ P₂`, restriction of rational
  characters induces the canonical projection `π : a_{P₁} → a_{P₂}` and
  `a_{P₁} ≃ₗ a_{P₂} × ker π`, with the splitting induced by the split centres (the split exact
  sequences `a_{P_1} = a_{P_2} ⊕ a_{P_1}^{P_2}` and dually); the kernel is `0` for `P₁ = P₂`
  ([Arthur], §5, p. 24; [Arthur], §5, p. 25). *Needs:* AA.3.1; AA.2.1; ReductiveGroupsPartII,
  RG2.1; ReductiveGroups, layer 7.
  *Lean:* none; specified in the README only.

  For algebraic Levi data `D`, the carrier equation is
  `a_P = Hom_ℤ(Additive X*_F(M), ℝ)`, the real character space of the Levi quotient.
  Restriction along a specified inclusion of Levi groups, with coordinate map
  `i : O(M₂) → O(M₁)`, is the character map fixed by `(i_* a)(χ) = a(i(χ))`.
  For standard parabolics the map `i` must be the inclusion determined by `M₀`;
  an arbitrary algebraic homomorphism does not specify the projection `a_{P_1} → a_{P_2}`.
  The Levi inclusion and the restriction to the split component send the class of a coordinate
  function to its class in the smaller quotient. One equation uniquely specifies the lift
  `a_P → Hom(X,ℝ)`: it agrees with evaluation on restricted Levi characters and vanishes
  on the simple Levi roots. Evaluating that lift on `α` gives the root functional;
  the simple roots are linearly independent, and they span
  when `G` has no rational characters. `Δ_P` removes duplicate restrictions, and `ρ_P` is the multiplicity-weighted
  half-sum of positive roots (Levi roots restrict to zero).
  The inclusion `a_{P_2} → a_{P_1}` is fixed in coordinates; the splitting is
  `a ↦ (πa, a − inclusion(πa))`.

  **Checks for the splitting.**
  - The identity projection and inclusion are identities.
  - The Borel-to-group projection of `GL₂` is `(a,d) ↦ a+d`, and its central
    lift is `z ↦ (z/2,z/2)`; the factor one half cannot be omitted.
  - For full `SL₂`, the target character space is zero.

  **Checks for the character-space carrier.**
  - For `G_m`, its dimension is one.
  - For `G_a` in characteristic zero, its Levi character space is zero.
  - For the full `SL_2`, its character space is zero.

  **Checks for restriction of characters.**
  - The identity inclusion induces a map with zero kernel.
  - The square map on `G_m` doubles a nonzero real character coordinate and is not
    the identity.
  - A homomorphism pulling every character back to `1` induces the zero map.

  **Checks for roots and chambers.**
  - For a torus, `P = G`, `a_P = a_G`, the relative space is zero and `Δ` is empty.
  - For the Borel of `GL_2`, `ρ = (1/2)(e_1 − e_2)`.
  - For `GL_3`, `a_0^+` is cut out by the two simple roots; positivity of `e_1 − e_3` alone does
    not imply membership.
- **Admissible maximal compact subgroup of `G(𝔸)`.** For a connected reductive group `G` over `F`,
  define admissibility: a maximal compact subgroup `K = ∏_v K_v` of `G(𝔸_F)` is
  admissible relative to `M_0` if `K_v = 𝓗(𝒪_v)` is hyperspecial for all but finitely many `v`,
  each `K_v` is a special maximal compact subgroup in good position relative to `M_0` at finite
  `v` and a maximal compact subgroup of `G(F_v)` at archimedean `v`. Prove
  `G(F_v) = P_0(F_v) K_v` at every place, finite and archimedean. Define the compact subgroup
  `∏_v K_v` of `G(𝔸)`, and prove that it is compact and
  that an admissible `K` exists for every minimal parabolic
  data ([Arthur], §4, p. 23; [Arthur], §4, p. 24). *Needs:* AA.1.1; AA.1.2;
  ReductiveGroupsPartII, RG2.3 (reductive-model, hyperspecial-vertices); ReductiveGroupsPartII,
  RG2.4 (iwasawa-parabolic-integral); RepresentationTheory/LieGroups, layer 9.
  *Lean:* none; specified in the README only.

  In an admissible `K`, good position is the equation
  `K_v ∩ P = (K_v ∩ N_P)(K_v ∩ M_P)` for every standard `P`. The finite-place special
  condition is expressed intrinsically: a local maximal split torus contains `S₀`, and
  each element of its rational relative Weyl group has a normalizer representative in
  `K_v`. Compare this characterization with special points of the RG2 apartment.
  The almost-everywhere condition uses reductive integral models (AA.1.1), including smoothness
  and reductive fibres, and equality with that model's integral points. The global
  subgroup is the intersection of the comaps of all these local subgroups.

  **Checks.**
  - For `GL_n` over `ℚ`, `O(n) × ∏_p GL_n(ℤ_p)` is admissible.
  - For the trivial group, the compact is the whole group.
  - A proper subgroup of any larger compact subgroup fails maximality.
  - The Iwahori subgroup (upper triangular modulo `p`) is a proper subgroup of `GL_2(ℤ_p)`, so a
    product of Iwahori subgroups is not maximal compact and not admissible
    (including residue characteristic two).
- **Adelic Iwasawa factorization.** For connected reductive `G/F`, minimal-parabolic data and
  an admissible `K`, prove that multiplication
  `N_P(𝔸) × M_P(𝔸)^1 × A_P(ℝ)^0 × K → G(𝔸)` is surjective and open for each standard `P`, and
  that at almost all finite places it restricts to the integral Iwasawa factorization; this
  integrality permits assembling local choices into restricted-product elements ([Arthur], §4,
  pp. 23–24). *Needs:* AA.3.1; AA.2.1; ReductiveGroupsPartII, RG2.3 (reductive-model);
  ReductiveGroupsPartII, RG2.4 (iwasawa-parabolic-integral); RepresentationTheory/LieGroups,
  layer 9.
  *Lean:* none; specified in the README only.
- **Parabolic Haar Jacobian.** For `F` a number field, `G` a connected reductive group over
  `F`, `P = N_P ⋊ M_P` an `F`-parabolic with its Levi decomposition on `𝔸`-points, and `dn`, `dm`
  Haar measures on `N_P(𝔸)` and the unimodular `M_P(𝔸)`, write `P = N ⋊ M` and
  `δ_P(m) = |det(Ad(m) | Lie N)|_𝔸`. Prove that with left Haar measures `dn`, `dm`, the measure
  `δ_P(m)^{−1} dn dm` in coordinates `(n, m)` is a left Haar measure of `P(𝔸)`; that Mathlib's
  modular character of `P(𝔸)` (`map (·p) μ_l = Δ_P(p) μ_l`, equivalently
  `map (p·) μ_r = Δ_P(p)^{−1} μ_r` for `μ_r` the inversion image of `μ_l`) is `Δ_P(nm) = δ_P(m)`;
  and that `dn dm` is a right Haar measure in the same coordinates ([Arthur], §4, p. 21).
  *Needs:* AA.2.2.
  *Lean:* none; specified in the README only.
- **Iwasawa integration through the compact factor.** For `F` a number field, `G` a connected
  reductive group over `F`, `P = N ⋊ M` a standard `F`-parabolic, `K` admissible with `dk` its
  Haar probability measure, and `dn`, `dm` Haar measures on `N(𝔸)`, `M(𝔸)` with
  `vol(N(𝒪_v)) = vol(M(𝒪_v)) = 1` at almost all `v`, prove that the functional

  `f ↦ ∫_K ∫_M ∫_N f(nmk) δ_P(m)^{−1} dn dm dk`

  on compactly supported continuous `f` is a positive functional invariant under right
  translation by `G(𝔸)` (left `P`-invariance and right `K`-invariance are immediate); since
  `G(𝔸)` is unimodular it is the Haar measure of `G(𝔸)`. Equivalently use the compact
  homogeneous space `(P ∩ K)\K`, whose measure is quasi-invariant under `G` with the parabolic
  Radon–Nikodym cocycle. No invariant measure on `P\G` is asserted ([Arthur], §7, p. 32, for the
  compatible-measure formula in `mnk` order, from which the substitution `n ↦ m n m⁻¹` gives the
  `nmk` order with `δ_P(m)^{−1}`; [Arthur], §4, pp. 21–23, carries out the `GL₂` case).
  *Needs:* AA.3.1; AA.0.3; ReductiveGroupsPartII, RG2.4; RepresentationTheory/LieGroups, layer 9;
  AA.1.5.
  *Lean:* none; specified in the README only.
- **Adelic Iwasawa decomposition and integration formula.** For a connected reductive group `G`
  over `F`, admissible `K` and standard `P`, prove
  `G(𝔸_F) = P(𝔸_F)K = N_P(𝔸) M_P(𝔸)^1 A_P(ℝ)^0 K`, and for `f ∈ L¹(G(𝔸))`,

  `∫_{G(𝔸)} f(x) dx = ∫_K ∫_{M_P(𝔸)} ∫_{N_P(𝔸)} f(nmk) δ_P(m)^{−1} dn dm dk`

  for compatible Haar measures ([Arthur], §4, p. 24, for the decomposition; [Arthur], §7, p. 32,
  for the integration formula and its measure normalization, stated in `mnk` order, the
  substitution `n ↦ m n m⁻¹` giving the `nmk` order with `δ_P(m)^{−1}`). Arthur works over `ℚ`;
  the statement over `F` passes through *base-change-adelic*. *Needs:* AA.3.1; AA.1.4.
  *Lean:* none; specified in the README only.
- **The map `H_P`.** For a connected reductive group `G` over `F`, standard `P` and admissible `K`,
  define `H_P : AdelicPoints H → a_P`, `H_P(nmk) = H_{M_P}(m)` for `n ∈ N_P(𝔸)`,
  `m ∈ M_P(𝔸)`, `k ∈ K`, and write `H_0 = H_{P_0}`. Prove that
  `H_P(n * m * k) = H_{M_P}(m)`, that `H_P(p * x) = H_P(p) + H_P(x)` for
  `p ∈ P(𝔸)`, that `H_P` is continuous, and that
  `H_P(diagonal γ * x) = H_P(x)` for `γ ∈ P(F)` ([Arthur], §4, p. 24). *Needs:* AA.3.1; AA.2.1.
  *Lean:* none; specified in the README only.

  The equation `H_P(nmk) = H_{M_P}(m)` pins the function on the whole adelic group by Iwasawa
  surjectivity, and includes its normalization at the identity. The dependence on `K`
  is explicit in the statement.

  **Checks.**
  - For the upper Borel and `O₂(ℝ)·∏ GL₂(ℤ_p)`, the simple-root
    coordinate of `H_P(diag(y,1))` is `log y`, with `y > 0` at infinity and finite
    component one. The full vector is `(log y,0)`, not a scalar.
  - The orthogonal Weyl representative has height zero.
  - `w diag(2,1)` has simple-root height `−log 2`; additivity on
    the whole group would give `log 2`.
  - Compact factors have zero height,
    the split logarithm is retained, and rational parabolic translation leaves it unchanged.
  - For `x` in `P(𝔸)`, the pairing of `H_P(x)` with each rational character `χ` of `P` is
    `log ‖χ(x)‖`; for `GL_2` and the Borel, `H_P(diag(a, d)) = (log ‖a‖, log ‖d‖)`.
  - `H_P` is not a homomorphism on `G(𝔸)`: for `GL_2`, `H_P(w) = 0` for the Weyl element `w ∈ K`,
    but `H_P` of a product of upper and lower unipotents can be nonzero.

**Checks for local coefficient comparison.** The comparison of local points under base change
preserves one, evaluates the inverse comparison by `a⊗h ↦ a·g(h)`, and
retains distinct points. These pin the comparison in
addition to its evaluation equation on `1⊗h`.

The adelic integration normalization is fixed by a measure equation, not by an unspecified
choice of Haar measure. Put `δ_P(m) = exp(2ρ_P(H_M(m)))` for the Levi modulus. The parabolic
product map is `(n,m) ↦ nm` into the represented parabolic; its pushforward of
`δ⁻¹ dn dm` is left Haar and its pushforward of `dn dm` is right invariant.
The Iwasawa measure attached to `P, K, dn, dm, dk` is the pushforward of `δ⁻¹ dn dm dk` by `(n,m,k) ↦ nmk`.
For Haar `dn,dm` and Haar probability `dk`, it is Haar on `G`; the Iwasawa integration formula uses this
precise normalization, and its right `G`-invariance is part of the target.
The adelic Iwasawa factorization adds openness to surjectivity; its integral form factors
`K_v ∩ P(F_v) = (K_v ∩ N_P(F_v))(K_v ∩ M_P(F_v))` at each good place and supplies the
integral-factor statement at places outside the model's exceptional set.
The nontrivial extraction criterion: for `n ∈ N(F_v)`
and `m ∈ M(F_v)`, `nm ∈ G(𝒪_v)` if and only if both factors are integral.

**Checks for the Jacobian and measures.**

- For a torus `δ=1`; for `GL₂` at root logarithm `log 2`, `δ=2` and `density=1/2`;
  `δ` is positive and inversion gives its reciprocal.
- The parabolic product sends `(1,1)` to one; multiplication
  is bijective; reversing two noncommuting factors changes it.
- Zero input gives zero; doubling `dn` doubles
  the output; three Dirac masses at one give the Dirac mass at one.
- Evaluating the infinite
  points of `GL₂/ℚ` at its real place preserves one and is bijective onto `GL₂(ℝ)`.

**Checks for the parabolic product and integral intersection.**
In `GL₂`,
`[[1,1],[0,1]] [[2,0],[0,1]] = [[2,1],[0,1]]`, whereas reversing the factors gives
`[[2,2],[0,1]]`. The determinant-one Weyl matrix
`[[0,−1],[1,0]]` belongs to `GL₂(ℤ_p)` but is not upper triangular. Thus the
integral factorization has `K_v ∩ P` on the left, not all of `K_v`.

### 3.2 Real Siegel coordinates and reduced positive forms

- **Horospherical decomposition for a fixed maximal compact.** Let `𝐆` be connected semisimple
  over `ℚ`, `G = 𝐆(ℝ)^+`, `K ⊂ G` a maximal compact subgroup with Cartan involution `θ`, and `𝐏`
  a `ℚ`-parabolic with unipotent radical `𝐍_P` and Levi quotient `𝐋_P`. With `S_P` the split
  centre of `𝐋_P`, `A_P = S_P(ℝ)^0` and `M_P` the full real points of
  `⋂_{χ∈X*_ℚ(𝐋_P)} ker χ²`, prove that there is a unique `θ`-stable real Levi lift of
  `(𝐋_P)_ℝ`. Regard `A_P` and `M_P` as subgroups of `𝐆(ℝ)` through this lift and put
  `M_P^+ := M_P ∩ G`. Prove `𝐏(ℝ) = N_P A_P M_P`,
  `𝐏(ℝ) ∩ G = N_P A_P M_P^+` and the diffeomorphism
  `N_P × A_P × (M_P^+ K) → G`, whose inverse supplies the horospherical coordinates.
  `M_P^+` is the intersection with the ambient identity component, not the identity component
  of `M_P`. Define the horospherical data `N_P, A_P, M_P, M_P^+, M_P^+ K`, the
  homeomorphism `G ≃ₜ N_P × A_P × (M_P^+ K)` for fixed `K` and `𝐏`, and the simple
  roots. Prove that left multiplication by `p_0 = n_0 a_0 m_0 ∈ 𝐏(ℝ) ∩ G`, with
  `m_0 ∈ M_P^+`, acts
  by `(n, a, m) ↦ (n_0 · (a_0 m_0) n (a_0 m_0)⁻¹, a_0 a, m_0 m)`, that
  conjugation by `g ∈ 𝐆(ℚ)` carries the decomposition for `(𝐏, K)` to that for
  `(g𝐏g⁻¹, gKg⁻¹)`, and that for `K′ = uKu⁻¹` with `u ∈ N_P` and
  the Levi lifts identified by conjugation by `u`, the `A`-coordinate satisfies
  `a_{K′}(g) = a_K(gu)`, equivalently `H_{P,K′}(g) = H_{P,K}(gu)`; it need not equal `a_K(g)`
  ([BKT], §2.2, p. 8; [BKT], (2.2), p. 8). *Needs:* AA.3.1; RepresentationTheory/LieGroups,
  layer 9; Tau Ceti `TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.leviDecompositionMulEquiv`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For the upper Borel of `SL₂`, `M_P = M_P^+ = {±I}` although `M_P^0 = {I}`;
    the residual factor is `SO(2)`, and `(x, a, k) ↦ n(x) diag(√a, 1/√a)k`.
  - For `P = 𝐆 = PGL₂`, `M_P = PGL₂(ℝ)` whereas `M_P^+ = PGL₂(ℝ)^+`;
    the class of `diag(−1,1)` belongs only to the full `M_P`.
  - For `P = 𝐆 = G_m`, the same squared-character construction gives `M_P = {±1}`,
    `M_P^+ = {1}` and `A_P = ℝ_{>0}`.
  - In `SL₂(ℝ)`, take `u = n(1)`, `k = [[0, −1], [1, 0]] ∈ SO(2)`. The upper-half-plane height of
    `ki` is `1` whereas that of `k(1 + i)` is `1/2`. Thus `a_K(k) = 1` but `a_{uKu⁻¹}(k) = 1/2` under
    the parameter `diag(√a, 1/√a)`.
- **Simple roots of P and truncated tori.** `Φ(A_P, N_P)` is the set of characters of `A_P` on
  `Lie N_P`; define `Δ(A_P, N_P) = {α_1, …, α_r}` as a `Finset`
  of positive characters of `A_P`, the unique set of `dim A_P` linearly independent roots of
  which every root is a nonnegative integral combination. For `t > 0` define
  the truncated torus `A_{P,t} = {a ∈ A_P : a^α > t for all α ∈ Δ(A_P, N_P)}`, and
  the corner coordinates `e_P(a) = (a^{−α_1}, …, a^{−α_r}) : A_P ≃ (Fin r → ℝ_{>0})`. Prove
  that `e_P` is a semialgebraic diffeomorphism and that
  `e_P '' A_{P,t} = Set.pi univ (fun _ => Ioo 0 t⁻¹)`, that is `e_P(A_{P,t}) = (0, 1/t)^r`
  ([BKT], §2.2, p. 8; §2.3, equation (2.4), p. 9). *Needs:* AA.3.2; ReductiveGroups, layer 7.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `SL_2` and the Borel, `Δ = {α}` with `diag(a, a⁻¹)^α = a²`.
  - For the Borel of `SL_3` the root `α_1 + α_2` is positive but not simple; truncating by it
    alone does not give `A_{P,t}`.
- **Siegel set for a fixed maximal compact.** For a `ℚ`-parabolic `𝐏`, a fixed maximal compact
  `K ⊂ G = 𝐆(ℝ)^+`, `t > 0` and bounded (relatively compact open semialgebraic) `U ⊂ N_P`,
  `W ⊂ M_P^+ K`, define the Siegel set `𝔖(𝐏, K, U, t, W) ⊂ G`,
  `𝔖 = U × A_{P,t} × W ⊂ G` in horospherical coordinates associated to `𝐏` and `K`; for a
  connected compact `M ⊂ K`, a Siegel set of `G/M` associated to `K` is the image of such a set.
  The set carrier itself permits arbitrary `U,W` and
  arbitrary quotient subgroup; the semialgebraicity statement adds the semialgebraic hypotheses
  in a faithful matrix realization. Any
  relatively compact pair of windows enlarges to relatively compact open semialgebraic windows,
  which therefore supplies these choices in the translation and finite-covering conclusions.
  `K` is fixed once and for all (BKT Definition 2.5 as
  corrected by the 2023 erratum). Prove the membership criterion in horospherical
  coordinates and that the Siegel set is monotone in `U`, `W` and antitone in `t`
  ([BKT], Definition 2.3, p. 8; [BKT erratum], §1.1, p. 1). *Needs:* AA.3.2.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `SL_2` and `K = SO(2)`, the image in `ℍ` is `{x + iy : x ∈ U, y > t}` when
    `W = M_P^+ K = K`.
  - For the upper Borel of `SL₂`, `U = {n(x) : −1 < x < 1}`, `t = 1` and the full residual
    window `W = K`, the image is `{x + iy : −1 < x < 1, y > 1}`; it excludes `i`
    and `2 + 2i`. The full residual window gives right
    `K`-invariance and retains both restrictions.
  - Siegel sets for different `K` are not interchangeable: for `SL_2`, `P` upper triangular and
    `x ≠ i` in `ℍ`, a Siegel set `B_N B_A K_x` is not contained in finitely many
    `SL_2(ℤ)`-translates of Siegel sets for `K_i` (erratum §1.6.1).
- **Translating and conjugating Siegel sets.** Prove that for `g ∈ 𝐆(ℚ)`, `g𝔖g⁻¹` is a Siegel
  set associated to `g𝐏g⁻¹` and `gKg⁻¹`; for `g ∈ G`, `𝔖g` is contained in a Siegel set for `𝐏` and `g⁻¹Kg`;
  and for `g ∈ 𝐏(ℝ) ∩ G`, `g𝔖` is contained in a Siegel set for `𝐏` and `K` (exactly, for the sets `U a A_{>0} W`
  of the erratum; for Definition 2.3's `A_{P,t}`, up to containment). Consequently, for
  `γ ∈ 𝐆(ℚ)^+`, `γ𝔖` is contained in a Siegel set associated to `γ𝐏γ⁻¹` and the same `K`
  ([BKT], Lemma 2.4, p. 8; [BKT erratum], Remark 1.1(1), p. 2). *Needs:* AA.3.2.
  *Lean:* none; specified in the README only.
- **Reduced positive forms.** For a finite-dimensional `ℚ`-vector space `V` with an ordered
  basis `e = (e_i)` of `V_ℚ` (integral bases of `V_ℤ` in BKT), `C > 0` and a positive definite
  symmetric form `b` on `V_ℝ`, call `b` `(e, C)`-reduced when its Gram matrix
  `B = (b(e_i, e_j))_{i,j}` in the basis `e` satisfies `RealSiegel.IsReduced C B`, that is,
  (1) `|b(e_i, e_j)| < C b(e_i, e_i)` for all `i, j`; (2) `b(e_i, e_i) < C b(e_j, e_j)` for `i < j`;
  (3) `∏_i b(e_i, e_i) < C det(B)`. Prove
  `IsReduced C B → C ≤ C′ → IsReduced C′ B`, and
  `IsReduced C B ↔ IsReduced C (λ • B)` for `λ > 0`; prove that for
  fixed dimension `n` and `C > 0` there is a constant `R(n, C) > 0` such that every `C`-reduced
  positive Gram matrix `b = Nᵀ diag(d) N` with `N` unit upper triangular and `d_i > 0` satisfies
  `|N_ij| ≤ R` for `i < j` and `d_i ≤ R d_{i+1}` for `0 ≤ i < n − 1` (the bound is uniform over
  `b`), and conversely that for fixed `n` and `R > 0` there is
  `C(n, R) > 1` such that every positive Gram matrix `b = Nᵀ diag(d) N` with `N` unit upper
  triangular, positive pivots `d_i`, `|N_ij| ≤ R` above the diagonal and `d_i ≤ R d_{i+1}` for
  `i < n − 1` is `C`-reduced ([BKT], Definition 4.11, p. 17). *Needs:* Tau Ceti `TauCeti.cholesky`.
  *Lean:* none; specified in the README only.

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
  - In dimension one, every positive matrix is reduced for `C > 1`.

- **Scalar invariance of reduced forms.** For a positive definite real symmetric `n × n` matrix
  `B` (the Gram matrix of `b` in the basis `e`), `C > 0` and real `a > 0`, prove that `B` is
  `(e, C)`-reduced iff `aB` is `(e, C)`-reduced; consequently determinant normalization preserves
  reducedness ([BKT], §4.5, Definition 4.11, pp. 17–18 (arXiv v2)). *Needs:* AA.3.2.
  *Lean:* none; specified in the README only.
  **Checks.**
  - At `C = 2`, both one-dimensional forms `[1]` and `2[1]` are reduced.
  - The zero multiple of `[1]` is not reduced.
  - The multiple `−[1]` is not reduced.

- **The set `T_{e,C}` of reduced forms.** Define the set of reduced positive definite matrices
  `T_{e,C} = {b ∈ X : b is (e, C)-reduced} ⊂ X`, the space of positive definite forms on `V_ℝ`.
  Prove that it is semialgebraic in matrix-entry coordinates, that it is monotone in `C`, and
  that `T_{ge,C} = g·T_{e,C}` for `g ∈ GL(V_ℚ)` ([BKT], §4.5, p. 18 (arXiv v2); JAMS p. 933). *Needs:*
  AA.3.2; Tau Ceti `TauCeti.cholesky_mul_transpose`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - `1 ∈ T_{std,2}`.
  - `diag(1, 4) ∈ T_{std,2}` but its inverse `diag(1, 1/4)` is not.
  - In dimension one and `C > 1`, the reduced set is exactly the set of positive definite matrices.

- **Reduced forms and Siegel sets.** For a lattice `V_ℤ` in `V_ℚ`, an ordered integral basis `e`
  and `C > 0`, prove that the set of `(e, C)`-reduced positive definite forms lies in the image
  of a `GL_n(ℝ)` Siegel set in `GL_n(ℝ)/O(n)`, and that each such Siegel set has reduced-form
  image for some `C`. Restricting to Gram determinant one gives the corresponding statement for
  `SL_n(ℝ)/SO(n)`; for `n>0`, normalize an arbitrary form `B` by `det(B)^{−1/n} B`. Rank zero is a point. Rational bases are
  handled by the matching rational change of basis ([BKT], §4.5, p. 18 (arXiv v2); JAMS p. 933).
  The statement comprises the cofinality of reduced forms with the standard real Siegel domain of
  AA.3.3 in both directions, its determinant-one version, the fibres of the Gram map, and the
  identification of the standard domain with a Siegel-triple domain of AA.3.7.
  *Needs:* AA.3.2; Tau Ceti `TauCeti.cholesky`, `TauCeti.cholesky_mul_transpose`.
  *Lean:* none; specified in the README only.
- **Lower bound by diagonal entries.** Let `B` be a positive definite real symmetric `n × n`
  matrix with diagonal `d_k = B_kk` and `D ≥ 1` with `∏_k d_k ≤ D det B`. Prove that for every
  real vector `a` and every `k`, `aᵀ B a ≥ a_k² d_k / D`. This is an owned
  quantitative lemma supporting [BKT], Definition 4.11 and its following paragraph,
  pp. 17–18: the cofactor formula and Hadamard inequality give
  `(B⁻¹)_kk ≤ D/d_k`; Cauchy–Schwarz for the `B` inner product gives the result. *Needs:* Tau Ceti `TauCeti.cholesky_mul_transpose`.
  *Lean:* none; specified in the README only.
- **Transferring off-diagonal bounds to another basis.** Let `B` be the Gram matrix in an
  ordered basis `e′` of a positive definite form `b` with `|B_ab| ≤ C′ d_a` for all `a, b`, with
  `d_a ≤ C′ d_b` for `a < b`, and `∏ d_a ≤ C′ det B` (`C′ ≥ 1`). For a fixed basis
  `e_i = ∑_a A_ai e′_a` put `k_i = max{a : A_ai ≠ 0}`, `m_i = |A_{k_i,i}|`, `L_i = ∑_a |A_ai|`. Prove
  `|b(e_i, e_j)| ≤ C′³ L_i L_j m_i⁻² b(e_i, e_i)` for all `i, j`.
  This quantitative bound is our deduction supporting [BKT], Definition 4.11,
  pp. 17–18: summing the entry bounds gives `C′² L_i L_j d_{k_i}`;
  the preceding lower bound gives `b(e_i,e_i) ≥ m_i² d_{k_i}/C′`. *Needs:* AA.3.2.
  *Lean:* none; specified in the README only.
- **Basis change with determinant control.** Let `e`, `e′` be bases of `V_ℚ` (`m = dim V`) and
  `C, C′ ≥ 1`. Prove that if `b` is `(e′, C′)`-reduced and `∏_i b(e_i, e_i) ≤ C det(b in e)`, then
  `b` is `(σe, C″)`-reduced for the ordering `σ` of `e` that sorts the values `b(e_i, e_i)`, with
  `C″` depending only on `C`, `C′` and the change-of-basis matrix; hence `b` lies in one of the
  `m!` sets `T_{σe,C″}`. The sorting permutation is part of the conclusion ([BKT], §4.5, p. 18
  (arXiv v2); JAMS p. 933). The conclusion requires `C″>1` and
  monotonicity of the permuted diagonal. **Check:** `diag(4,1)`
  is 5-reduced but unsorted; swapping the two basis vectors sorts it.
  *Needs:* AA.3.2.
  *Lean:* none; specified in the README only.

The connected real carrier `G` is the identity component of the existing infinite points over `ℚ`.
The real unipotent subgroup `N` lies in `G`. The real groups `A` and `M` are
conjugates by `u ∈ N(ℝ)` of the rational Levi's positive split component and full real norm-one
subgroup in the ambient infinite points. Put `M^+ = M ∩ G`; the residual factor is `M^+ K`.
The horospherical data require a continuous involutive group automorphism with fixed subgroup
`K`, inversion on `A`, preservation of `M^+`, and a coordinate homeomorphism whose inverse is
**multiplication**. Its logarithm on `A`
is pinned on every element of `A` by an equation using the Levi's rational
characters. The three coordinates have smooth local extensions
in every faithful rational matrix realization; the inverse is matrix multiplication.
The four-block graph `(g,n,a,m)` lies in the polynomial
set algebra. Thus regularity is a conclusion about the actual coordinates.
The corner chart is smooth and semialgebraic, and together with the pinned
homeomorphism below gives the stated smooth semialgebraic corner chart. The formula for the corner chart is
`a ↦ (exp(−α(log a)))_α`. Both the truncation formula and
the homeomorphism onto the positive orthant assume `X*(G)=0`; the latter pins the homeomorphism into
the positive orthant by its value on every element. Central split directions cannot be
recovered from root coordinates. **Check:** take `G=G_m`:
`A=ℝ_{>0}` has distinct elements, but every corner tuple is empty.

**Checks for these definitions and translations.**

| Interface | Checks |
|---|---|
| The real groups `N`, `A`, `M`, `M^+`, `M^+ K`, the horospherical data, the decomposition and the logarithm | `N=A=1` and `log=0` at one; `N=A=1` on `K`; a split element retains its `A`-coordinate |
| Fixed compact dependence | the Weyl element sends `i` to height 1 but `1+i` to height 1/2; the change-of-compact formula identifies this with the new compact's coordinate |
| Simple roots, truncated torus, corner chart | at `t=1` the identity is excluded if roots exist, corner `tuple=1`; in rank zero there are no inequalities and an empty tuple; root value 2 gives corner coordinate 1/2 and membership at `t=1` |
| Siegel sets and their quotient images | empty `U` gives empty set; the strict wall excludes one; for the upper Borel of `SL₂` with `U=n((−1,1))`, `t=1` and `W=K` the image is `−1<x<1`, `y>1`, excluding `i` and `2+2i`; the quotient is the literal image under the quotient map |
| Translation | no change at one; left `N`-translation moves exactly the `N`-window; the full `M^+ K`-window absorbs right `K`-translation |

The conjugation statements for the decomposition and for Siegel sets compare actual rationally
conjugate Hopf-ideal parabolics and conjugate compacts. The three coordinates conjugate separately, and the
conjugate Siegel set uses the conjugated windows with the same threshold. Right translation
and parabolic left translation are stated as containment with a possibly smaller positive
common threshold. Different root coordinates can require different shifts, so exact equality
requires the root-by-root translated cones in the erratum's convention.

**Checks for the quotient Siegel set.** An empty
window has empty image; the quotient by the identity subgroup
preserves membership; a nonempty Siegel set maps onto the
one-point quotient by the whole group. These check the literal-image definition
independently of any fundamental-domain assertion.

### 3.3 Primitive reduction and closed orbits

Use the points `WithConv (B →ₐ[F] R)` of a finite-type affine
Hopf group with coordinate algebra `B`. A rational representation is a coordinate
bialgebra map `r : O(GL_n) → B`; its matrix points over `R` are evaluation followed by
`GeneralLinear.pointsMulEquiv`. A closed embedding means `r` is surjective.
The real comparison identifies the infinite points `AdelicPoints.InfinitePoints ℚ B` with the
real points by evaluation
at the unique real place, using that place's completion equivalence. These are the
AA.1 and RG2.0 point carriers, with their existing topologies.
*Lean:* none; specified in the README only.

**Checks.** The trivial group's points are a singleton; the nontrivial element of order
two in `G_m(ℝ)` is retained; nontrivial `G_a` points over the dual numbers are retained.
The matrix points give the
supplier's `GL_n` identification, the constant identity representation of the trivial
group, and injectivity for a closed embedding. The real comparison is tested on
the identity, the rational
diagonal and equality of infinite points.

The standard real Siegel domain `Σ_n(u,t)` is the full real domain

`Σ_n(u,t) = {v diag(a) k : v upper unitriangular, |v_ij| ≤ u (i<j), a_i>0, a_i/a_(i+1) ≥ t, kᵀk=1}.`

Theorems about reduction use `u,t>0`. Both determinant signs occur through `O(n)`.
This is [Orr], §2.A, pp. 5–6; inversion converts [Platonov–Rapinchuk–Rapinchuk],
§4.2, pp. 205–208, from `KAU` with right arithmetic action to this `UAK` domain.
`gram g = (g⁻¹)ᵀg⁻¹` records the Gram matrix of the columns of `g⁻¹`.
These are positive forms, and equal
forms mean `h=gk` for an orthogonal `k`. The domain is cofinal
with the reduced sets `T_{e,C}` of AA.3.2 in both directions, changing the positive constants,
and this exact set is a domain of the triple defined
in AA.3.7, with its standard orthogonal compact. [BKT], §4.5, pp. 17–18.
*Lean:* none; specified in the README only.

**Checks.** The domain is a singleton in rank zero; in rank one it is
all of `GL_1(ℝ)`, including negative scalars. For `SL₂`,
`g=[[√y,x/√y],[0,1/√y]]`, `y>0`, lies in `Σ_2(u,t)` exactly when `|x|≤u` and
`y≥t`; its upper half-plane coordinate is `x+iy`.
The identity has the identity form; columns `(1,0),(1,2)` of `g⁻¹` give `[[1,1],[1,5]]`;
`g=diag(a,a⁻¹)`, `a≠0`, gives `diag(a⁻²,a²)`.

A reductive group with finite component group, over a characteristic-zero field, is a smooth
group every normal smooth unipotent subgroup of whose geometric fibre is trivial.
It allows finite component groups. Connected reductive groups in the supplier's sense
(`TauCeti.reductiveCommHopfAlgProperty`) are examples. [Borel], §5.3, p. 20.
*Lean:* none; specified in the README only.

**Checks.** `G_m` qualifies; `μ₂` qualifies
in characteristic zero; `G_a` does not.

For a Hopf ideal `I` defining `H⊆G`, an affine quotient consists of a finite-type
commutative coordinate algebra `A`, a faithfully flat map `π:A→O(G)` and a
coefficient-natural right action of `G`. Its pinning equations, for every `F`-algebra
`R`, are

`σ_R(g)=g∘π;  σ_R(g)=σ_R(h) ↔ gh⁻¹∈H(R); x·1=x;  (x·g)·h=x·(gh);  σ_R(g)·h=σ_R(gh).`

Thus the points `(A →ₐ[F] R)` of the quotient also define rational and adelic points.
Faithful flatness supplies local lifts; it does not assert that every rational
quotient point lifts rationally. The existence of the affine quotient assumes
both groups reductive with finite component groups. The closed-orbit realization uses a surjection
`F[X₁,…,X_n]→A` and the equation `j(x·g)=ρ(g⁻¹)j(x)`. This is a closed immersion;
faithful flatness and the fibre equation identify its geometric image with the
closed orbit of `j(σ(1))` and its scheme stabilizer with `H`.
[BHC], §3.8, p. 501; [Borel], §5.3, pp. 19–20, includes disconnected groups.
*Lean:* none; specified in the README only.

**Checks.** `G\G` is a point. The
projection for the identity subgroup is bijective on every coefficient algebra.
For `G_m` modulo `μ₂` there is a quotient coordinate pulling back to `T²` on `G_m`
and a rational quotient point taking value `2` that cannot lift to `G_m(ℚ)`.

A closed-orbit datum has a rational algebraic `GL_n` representation, a real vector `w`,
and two hypotheses: its complex orbit is the common zero locus of a set of complex
polynomials, and its real stabilizer is transpose-stable. Its action is `g ↦ ρ(g)w`.
For a rational basis `b`, the lattice of `b` consists exactly of the real
vectors `∑_j z_j b_j` with integer coefficients. The compact weight-bound and
lattice-finiteness theorems assume this carrier, positive `u,t`, and this full
rational lattice; the latter also allows a fixed rational left translate `cΣ`.
No boundedness or finiteness of the orbit intersection is a carrier axiom.
[BHC], §§5.3–5.4, pp. 504–506.
*Lean:* none; specified in the README only.

**Checks.** The zero orbit is admitted; the punctured affine line is excluded;
the action of `1` gives `w`.
The zero vector is fixed; weights `+1,−1` act at
`(1,1)` as `(a,a⁻¹)`, fixing the left-action convention.
The lattice is `{0}` in dimension zero; it has integer
coordinates in the standard basis; for the basis vector `1/2` it contains `1/2` but excludes
`1/4`.

The primitive region attached to `r, a, u, t, C` is the inverse image in the actual `AdelicPoints ℚ B`
of `⋃_{c∈C} c(Σ_n(u,t)a × GL_n(ℤ̂))`, using the real comparison and
the integral level of the standard `GL_n` model. Its reduction theorem assumes a closed
embedding, reductivity with finite component group, `det a=1`, transpose-stability of `aG(ℝ)a⁻¹`,
positive `u,t`, and the real covering `GL_n(ℝ)=GL_n(ℤ)Σ_n(u,t)`.
[Borel], Theorem 4.5, pp. 17–18.

**Checks.** `C=∅` gives the empty region;
the region includes the identity for `C={1}`, `a=1`, `u≥0`, `t≤1`;
for `G=GL_n`, `a=1`, `C={1}`, membership is equivalent
to membership of the real component in `Σ_n(u,t)` and of the finite component
in the standard integral level.

- **Reduction for `GL_n(ℝ)`.** (*gln-real-reduction*) For `n ≥ 1`, prove that there are `C > 0`
  and a standard Siegel set `𝔖 ⊂ GL_n(ℝ)` (with respect to `O(n)` and the upper triangular
  Borel) such that `GL_n(ℝ) = GL_n(ℤ)·𝔖`; equivalently every positive definite form is
  `GL_n(ℤ)`-equivalent to an `(e, C)`-reduced form for the standard basis `e`
  ([Platonov–Rapinchuk–Rapinchuk], Theorem 4.12, pp. 206–208, and Theorem 4.20,
  p. 220). The book uses a right arithmetic action and `KAU` coordinates;
  apply inversion to obtain our left action and `UAK` convention. This also
  reverses the simple-root ratios; do not carry the book's truncation sign
  unchanged into our coordinates. *Needs:* AA.3.2; Mathlib `ModularGroup.exists_smul_mem_fd`.
  *Lean:* `RealSiegel.exists_reduced_GLZ`, using `RealSiegel.IsReduced` (the reduced-form version).
- **`GLₙ` finite class number one over `ℚ`.** For `n ≥ 1` over the ground field `ℚ` (`ℤ` a PID; over
  a number field the double coset set is the class group), prove
  `GL_n(𝔸_{ℚ,f}) = GL_n(ℚ) GL_n(ℤ̂)`, and that the rational intersection with `GL_n(ℤ̂)` is
  `GL_n(ℤ)` ([Borel], §2.1–2.2, pp. 11–12; §4.4, p. 17). *Needs:* AA.1.4; AA.1.1.
  *Lean:* none; specified in the README only.
- **Adelic reduction for `GL_n` over `ℚ`.** For `n ≥ 1` and a standard Siegel domain `𝔖` of
  `GL_n(ℝ)` with `GL_n(ℝ) = GL_n(ℤ)·𝔖` (*gln-real-reduction*), prove
  `GL_n(𝔸_ℚ) = GL_n(ℚ) · (𝔖 × GL_n(ℤ̂))` ([Borel], Lemma 4.4, p. 17). *Needs:* AA.3.3.
  *Lean:* none; specified in the README only.
- **Real `GLₙ` Siegel overlap.** For `n ≥ 1`, an integer `d ≥ 1` and a standard Siegel domain `Σ`
  of `GL_n(ℝ)` in the left-quotient convention of *gln-real-reduction*, prove that the set of
  `γ ∈ GL_n(ℚ)` with `γ, γ⁻¹ ∈ d^{−1} M_n(ℤ)` and `γΣ ∩ Σ ≠ ∅` is finite; the same holds for two
  fixed rational translates of such domains, with `c_1, c_2 ∈ GL_n(ℚ)` fixed and the overlap
  condition `γc_1Σ ∩ c_2Σ ≠ ∅` ([Borel], §3.1 Lemma, p. 14; §3.3, p. 15). *Needs:* AA.3.3.
  *Lean:* none; specified in the README only.
- **Simultaneous self-adjointness.** For `n ≥ 1` and a finite nested chain
  `G_1 ⊃ G_2 ⊃ ⋯ ⊃ G_m` (`m ≥ 1`) of reductive real algebraic subgroups of `GL_n(ℝ)`, prove that
  one `a ∈ SL_n(ℝ)` makes every `a G_i(ℝ) a⁻¹` stable under transpose ([BHC], Theorem 1.9,
  p. 492). *Needs:* RepresentationTheory/LieGroups, layer 9.
  *Lean:* none; specified in the README only.
- **Reductive homogeneous spaces as closed orbits.** For a field `F` of characteristic `0`, a
  reductive (not necessarily connected) linear algebraic group `G` over `F` and a reductive
  closed `F`-subgroup `H ⊂ G`, prove that `H\G` is affine and has a `G`-equivariant closed
  immersion into a finite-dimensional rational `G`-representation, taking the identity coset to
  `w ∈ V(F)` with stabilizer `H`, and that the orbit of `w` is closed ([BHC], §3.8, p. 501; [Borel], §5.3, pp. 19–20 for disconnected groups). *Needs:* ReductiveGroups, layer 3; ReductiveGroups, layer 6.
  *Lean:* none; specified in the README only.
- **Closed-orbit weight bounds in a real Siegel domain.** (*closed-orbit-weight-bound*) Let
  `V` be a finite-dimensional rational representation of `GL_n` over `ℚ`, `w ∈ V(ℝ)` with closed
  `GL_n(ℂ)`-orbit and transpose-stable stabilizer in `GL_n(ℝ)`, `Γ ⊂ V(ℚ)` a lattice, and let
  `GL_n(ℝ)` act on the left with `Σ = ω·A_t·O(n)` a standard real Siegel domain for the upper
  triangular Borel and `O(n)` in the left-quotient convention of *gln-real-reduction* (BHC §5.3
  uses the equivalent right action `v·g = g⁻¹·v` and the inverse domain `O(n)·A_t⁻¹·ω⁻¹`). Prove
  that there is a compact `Q ⊂ GL_n(ℝ)` such that `Σ·w ∩ Γ ⊂ Q·w`; in particular the norms of
  these lattice points are uniformly bounded ([BHC], §5.3–5.4, pp. 504–506). *Needs:* AA.3.3.
  *Lean:* none; specified in the README only.
- **Closed-orbit lattice finiteness.** Under the hypotheses of *closed-orbit-weight-bound*
  (rational `GL_n`-representation `V` over `ℚ`, `w ∈ V(ℝ)` with closed orbit and
  transpose-stable stabilizer, `Γ ⊂ V(ℚ)` a lattice, `Σ` a left-convention standard Siegel
  domain), prove that `Σ·w ∩ Γ` is finite, and that the same holds for any other lattice of
  `V(ℚ)`, in particular after replacing `Σ` by `c·Σ` for fixed `c ∈ GL_n(ℚ)`, since
  `c·Σ·w ∩ Γ = c·(Σ·w ∩ c⁻¹Γ)` ([BHC], Lemma 5.4, pp. 505–506). *Needs:* AA.3.3.
  *Lean:* none; specified in the README only.
- **Compact finite parts give bounded denominators.** For `F` a number field, `G` a linear
  algebraic group over `F` with a rational representation `ρ : G → GL(V)` over `F`, `w ∈ V(F)`
  and compact `C ⊂ G(𝔸_{F,f})`, prove that there is a fractional `𝒪_F`-lattice `L ⊂ V(F)` such
  that `wρ(C) ∩ V(F) ⊂ L`; likewise (for `G = GL_n` and `ρ` the identity) a compact `C` bounds
  denominators of all entries of `g` and `g⁻¹` for `g ∈ C ∩ GL_n(F)` ([Borel], Lemma 4.3, p. 17).
  In a rational basis there is a nonzero
  `d ∈ 𝒪_F` with `d v_i ∈ 𝒪_F` for every rational vector in `wρ(C)`; the lattice can
  therefore be chosen as `d⁻¹𝒪_F^n`. Likewise one nonzero `d` simultaneously
  clears all entries of `ρ(γ)` and `ρ(γ)⁻¹` for rational `γ` whose finite diagonal lies in `C`.
  *Needs:* AA.1.2; AA.1.5.
  *Lean:* none; specified in the README only.
- **Reduction for reductive subgroups of `GL_n`.** Let `G ⊂ GL_n` be reductive over `ℚ` with
  `a(G(ℝ))a⁻¹` self-adjoint for some `a ∈ SL_n(ℝ)` (the self-adjoint embedding), and let `𝔖` be
  the left-quotient standard Siegel domain of *gln-real-reduction*. Prove that there are
  finitely many `c_i ∈ GL_n(ℚ)` such that `Ω = ⋃_i (c_i·(𝔖a × GL_n(ℤ̂)) ∩ G(𝔸))` satisfies
  `G(𝔸) = G(ℚ)·Ω` and `{γ ∈ G(ℚ) : γΩ ∩ Ω ≠ ∅}` is finite, and that the finite projection of `Ω`
  has compact closure (Borel §4.5 states the inverse set `⋃_i (a⁻¹𝔖⁻¹·GL_n(ℤ̂)·c_i⁻¹ ∩ G(𝔸))` for right
  quotients) ([Borel], Theorem 4.5, p. 17). *Needs:* AA.3.3.
  *Lean:* none; specified in the README only.
- **Rational points on closed orbits.** For `F` a number field, `G` a reductive `F`-group (not
  necessarily connected), `H ⊂ G` a reductive `F`-subgroup and `σ : G → H\G`, prove that
  `σ_𝔸(G(𝔸)) ∩ (H\G)(F)` is a finite union of `G(F)`-orbits ([Borel], Theorem 5.4, p. 20).
  *Needs:* AA.3.3; AA.1.4.
  *Lean:* none; specified in the README only.

### 3.4 Adelic reduction and arithmetic quotients

- **Adelic Siegel sets.** For a connected reductive group `G` over `F`, admissible `K`,
  `T_1 ∈ a_0` and a compact subset `ω ⊂ N_0(𝔸) M_0(𝔸)^1`, define
  the Siegel set `𝔖(T₁, ω) ⊂ AdelicPoints H`,

  `𝔖(T_1, ω) = {p a k : p ∈ ω, a ∈ A_0(ℝ)^0, k ∈ K, β(H_0(a) − T_1) > 0 for all β ∈ Δ_0}.`

  Prove that `x ∈ 𝔖(T₁, ω)` iff `x = p a k` with the stated
  conditions, that the Siegel set is antitone in `T₁`, coordinatewise for `Δ_0`, and
  monotone in `ω`, that `𝔖(T₁, ω) K = 𝔖(T₁, ω)`, and that it is
  stable under `A_G(ℝ)^0` ([Arthur], §8, p. 37). *Needs:* AA.3.1.
  *Lean:* none; specified in the README only.

  **Checks.**
  - In the real split-torus case, there are no root inequalities; with the whole compact
    residual factor the Siegel set is the whole real torus. Adelic compact windows need
    not give the whole adelic torus: for `G_m/ℚ`, `ω = {1}` and the usual maximal compact,
    a finite idele with nonzero valuation lies outside `ω A_G K`.
  - The modular fundamental domain is contained in `|x| < 1`, `y > 1/2`,
    while `3i/4` belongs to that strip but not to
    the fundamental domain.
  - `|x| ≤ 1/2`, `y ≥ √3/2` covers every modular orbit.
    With the strict convention of this roadmap, the strict inequality `y > √3/2` excludes the
    elliptic boundary orbit at `1/2 + i√3/2`; `y > t` covers
    for `0 < t < √3/2`. The same scalar quotient check applies to `GL₂/ℚ` with its standard
    compact. Changing a strict threshold to the critical value is not legitimate.
  - For `SL_2/ℚ`, some Siegel set with compact `ω` meets every `SL_2(ℚ)`-orbit in `SL_2(𝔸)` (at
    `∞` it contains the standard fundamental domain of `SL_2(ℤ)`).
  - For `SL₂/ℚ` choose the finite factor `SL₂(ℤ̂)`, real `N`-window `[−1, 1]`, and `A`-parameter
    `y > 1/2`. Both the identity and `n(1)` lie in this Siegel set; their ratio is a nontrivial
    rational element. Thus this specified Siegel set cannot be a fundamental domain with
    disjoint rational translates (the real coordinates already show this).
- **Siegel sets cover `G(F)\G(𝔸)`.** For a connected reductive group `G` over `F` and admissible
  `K`, prove that there are `T_1` and `ω` such that `G(𝔸_F) = G(F) 𝔖(T_1, ω)`
  (Borel–Harish-Chandra) ([Arthur], Theorem 8.1, p. 37; [Borel], Theorem 4.6, p. 18). *Needs:*
  AA.3.4; AA.3.2; AA.1.4; Mathlib `ModularGroup.exists_smul_mem_fd`; AA.3.3.
  *Lean:* none; specified in the README only.
- **Siegel property.** For a connected reductive group `G` over `F`, admissible `K` and a Siegel
  set `𝔖 = 𝔖(T_1, ω)`, prove that `{γ ∈ G(F) : γ𝔖 ∩ 𝔖 ≠ ∅}` is finite (the finiteness condition
  of a fundamental set, [Borel], Definition 4.1, p. 17, which the Siegel-set fundamental sets of
  [Borel], Theorem 4.6, p. 18 satisfy; the real-group form is [BKT], Proposition 2.7(2), p. 9,
  stated in AA.3.6, which depends on this subsection and is not an input to it). *Needs:*
  AA.3.4; AA.3.3; AA.1.4.
  *Lean:* none; specified in the README only.
- **Finiteness of class numbers.** (*class-number-finite*) For every linear algebraic group `G`
  over `F` and every compact open subgroup `U ⊂ G(𝔸_{F,f})`, prove that the double coset space
  `G(F)\G(𝔸_{F,f})/U` is finite; equivalently `G(𝔸_F) = ⋃_{i=1}^h G(F) x_i G(F_∞) U` for finitely
  many `x_i` ([Borel], Theorem 5.1, p. 19; [Milne], Lemma 5.12, p. 57). *Needs:* AA.1.5; AA.1.4;
  AA.3.4; AA.1.2; AA.3.3.
  *Lean:* `Reduction.finite_classes`.
- **Unipotent groups have class number one.** For a unipotent group `N` over `F` and compact
  open `U ⊂ N(𝔸_f)`, prove `N(𝔸_f) = N(F)U` ([Borel], Corollary 2.5, p. 13). *Needs:*
  GlobalNumberFields, layer 6; AA.1.3.
  *Lean:* none; specified in the README only.
- **Class numbers of semidirect products.** If `G = H ⋉ N` over `F` with `N` unipotent, prove
  that every double coset `G(F)\G(𝔸_f)/U` meets `H(𝔸_f)`, and that `G(F)\G(𝔸_f)/U` is finite if
  `H(F)\H(𝔸_f)/(U ∩ H(𝔸_f))` is finite for all compact open `U` ([Borel], Proposition 2.7, p. 13).
  The general statement assumes a normal
  smooth unipotent Hopf subgroup `N` and bijectivity of `N(R)×H(R)→G(R)` on every
  coefficient algebra. No reductivity of the complement is assumed.
  The Levi decomposition gives its Levi specialization. The induced surjection
  from the complement's double cosets gives the finiteness implication.
  *Needs:* AA.3.4; AA.1.3.
  *Lean:* none; specified in the README only.
- **S-arithmetic subgroups and independence of the model.** For any affine algebraic
  group `G/F` and finite `S ⊇ ∞`, define `Reduction.IsSArithmetic S Γ` for
  `Γ ≤ G(F)` to mean that `Γ` is commensurable with `Γ(M,S)` for some finite
  `S₀ ⊆ S` and `M : IntegralModel F H S₀`. Arithmetic means `S = ∞` (empty finite
  part). For any models `M` and `N` and fixed `S` containing both exceptional sets,
  prove that their global integral groups are
  commensurable. Their local compact open groups agree away from finitely many places;
  at the remaining places their intersections have finite index in each. Pulling these
  conditions back to `G(F)` proves the claim without enlarging the fixed `S`.
  Prove that every rational point commensurates every `S`-arithmetic subgroup, and that commensurability preserves
  `S`-arithmeticity. For any compact open `W ≤ G(𝔸_F^S)`, the rational subgroup
  `Γ_W = G(F) ∩ (G(F_S) × W)` is `S`-arithmetic; conversely every `S`-arithmetic
  subgroup is commensurable with such a `Γ_W`. In particular the `levelArithmetic`
  groups below are congruence-type arithmetic examples, not a definition of all arithmetic
  subgroups ([Conrad], Theorem 3.4(3), p. 5; [Milne], §3, p. 33 and §4,
  pp. 42–43, Proposition 4.1; [Platonov–Rapinchuk], §4.4, pp. 205–206).
  *Needs:* AA.1.1 (global integral points and existence of a model over `𝒪_F`);
  AA.1.2; ReductiveGroupsPartII, RG2.0.3 (compact open local integral points).
  *Lean:* `Reduction.IsSArithmetic` (the definition used in the arithmetic covolume criterion).

  **Checks.**
  - For `G_a/ℚ`, `ℤ` and `p⁻¹ℤ` are distinct commensurable arithmetic subgroups;
    their intersection has indices `1` and `p`.
  - A finite-index noncongruence subgroup of `SL₂(ℤ)` is arithmetic and is not
    `levelArithmetic 1 U` for any compact open `U ≤ SL₂(𝔸_f)` ([Milne], §4, p. 42).
  - For the standard `SL₂` model over `F = ℚ(√2)`, `π = 3+√2`, `π′ = 3−√2`,
    the groups `SL₂(𝒪_F[1/π])` and `SL₂(𝒪_F[1/7])` have infinite relative index.
    Model independence holds at fixed `S`; it does not assert commensurability after
    adding another place. Conjugation by any fixed `g ∈ SL₂(F)` does commensurate
    the first group without inverting `π′`.

- **Borel–Harish-Chandra criterion for arithmetic covolume.**
  For a connected reductive group `G` over any
  number field `F` and an arithmetic subgroup `Γ ≤ G(F)` (`Reduction.IsSArithmetic ∅ Γ`
  in the finite-place convention), prove that its diagonal image in `G(F_∞)` is discrete
  and `Γ\G(F_∞)` has finite invariant volume if and only if `X*_F(G) = 0`.
  For `F = ℚ` this is `Γ\G(ℝ)`; the general case follows by restriction of scalars,
  including the identification of rational character groups. The quotient retains the full
  split central direction. This criterion is separate from the norm-one adelic finite-volume
  theorem and from *arithmetic-quotient-finite-volume*, which divides out `A_G(ℝ)^0`
  ([Milne], Theorem 3.3(a), pp. 33–34).
  *Needs:* AA.1.1; AA.1.4 (restriction of scalars); AA.2.2–AA.2.3;
  AA.3.4 (reduction theory and the arithmetic definition).
  *Lean:* `Reduction.arithmetic_finite_volume_iff`.

  **Checks.**
  - For `G_m/ℚ` and the standard model, `Γ(M,{∞}) = {±1}` and
    `{±1}\ℝ^×` has infinite multiplicative Haar volume. Dividing also by `ℝ_{>0}` gives a point.
  - For `SL₂/ℚ`, `SL₂(ℤ)\SL₂(ℝ)` has finite volume and is noncompact.
  - For the norm-one group of a definite quaternion division algebra over `ℚ`,
    the real group is compact and its arithmetic quotients have finite volume.

- **Arithmetic subgroups attached to a level.** For any affine algebraic group `G` over the number field `F`,
  compact open `U ⊂ G(𝔸_{F,f})` and `x ∈ G(𝔸_{F,f})`, define
  `Reduction.levelArithmetic x U : Subgroup (G(F)) := G(F) ∩ x U x⁻¹`, `Γ_{x,U}`, viewed in
  `G(F_∞)` through the diagonal. Prove that its image in
  `G(F_∞)` is discrete, that
  `levelArithmetic (γ x u) U = γ (levelArithmetic x U) γ⁻¹` for `γ ∈ G(F)`, `u ∈ U`, and
  that for compact open `U′ ≤ U`, `levelArithmetic x U′` has finite
  index in `levelArithmetic x U`;
  for all `x, x′` and compact open `U, U′` the groups `Γ_{x,U}`
  and `Γ_{x′,U′}` are commensurable ([Milne], Lemma 5.13, p. 57). *Needs:* AA.1.3; AA.1.5; AA.1.2.
  These groups are arithmetic by the preceding compact-open comparison. Discreteness needs
  only compactness of `U`; the finite-index and
  commensurability applications here use compact open levels.
  KleinianGroups, Layer 3, `isDiscrete_bianchi`
  states the imaginary-quadratic Bianchi special case, reconciled with this theorem by the
  integral-level and finite-centre adapter in **Downstream consumers**.
  *Lean:* `Reduction.levelArithmetic` (the subgroup used to define neat levels).

  **Checks.**
  - For `GL_2/ℚ`, `levelArithmetic 1 GL_2(ℤ̂) = GL_2(ℤ)`.
  - `levelArithmetic x U` depends on `x` and not only on `U`: for `GL_2/ℚ` and `x = diag(p, 1)` at
    the place `p`, `levelArithmetic x GL_2(ℤ̂) = diag(p,1) GL_2(ℤ) diag(p,1)⁻¹ ≠ GL_2(ℤ)`.
  - For `GL₁/ℚ`, the level `ℤ̂^×` gives rational arithmetic group `{±1}`; the
    principal congruence level of modulus `3` gives `{1}`.
  - For `G_a/ℚ`, `x = 1` (the identity), `U = ℤ̂` and the compact non-open subgroup
    `U′ = {0}`, the rational intersections are `ℤ` and `{0}`. Their index is infinite,
    so compactness of `U′` alone does not give finite index.
  - At `x = 1` membership is the finite diagonal condition, and the
    whole finite group as level gives all rational points.

- **Component decomposition of a level quotient.** For any affine algebraic group `G` over the number field `F`,
  compact open `U` and representatives `x_1, …, x_h` of `G(F)\G(𝔸_{F,f})/U`
  (*class-number-finite*), prove that `[g_∞] ↦ [(g_∞, x_i)]` induces a homeomorphism
  `⊔_i Γ_{x_i,U}\G(F_∞) ≃ G(F)\G(𝔸_F)/U`, equivariant for the right action of `G(F_∞)`; the
  archimedean factor and the split centre are retained, and the finite set `G(F)\G(𝔸_f)/U` is in
  general not the whole quotient ([Milne], Lemma 5.13, p. 57; [Arthur], §2, p. 13). *Needs:*
  AA.3.4; AA.1.2. The right-action equation holds
  through the two induced quotient maps.
  *Lean:* none; specified in the README only.
  **Checks:** the finite representative is retained at the base point;
  different class indices stay separate; points within a component are identified
  exactly by the arithmetic left action.
- **Exponential integrability on the relative chamber.** For `r ≥ 0`, `a₀^G` a real vector
  space of dimension `r` with a Haar (Lebesgue) measure, `β_1, …, β_r` a basis of its dual,
  `c_1, …, c_r > 0` with `2ρ = Σ c_i β_i`, and `T ∈ a₀^G`, prove in independent root coordinates that the integral of
  `exp(−2ρ(H))` over `β_i(H) > β_i(T)` is finite. For `r = 0` the domain is the zero-dimensional
  point and has the chosen finite Haar mass. In the coordinates `x_i = β_i(H)`,
  the integral is `J ∏_i exp(−c_i β_i(T))/c_i`, where `J > 0` is the Haar Jacobian.
  This follows from Mathlib `integral_exp_mul_Ioi` and finite-product integration
  (`Mathlib/Analysis/SpecialFunctions/ImproperIntegrals.lean`, `integral_exp_mul_Ioi`). *Needs:* AA.3.1.
  *Lean:* none; specified in the README only.
  **Checks.**
  - In rank zero, coordinate Lebesgue measure gives integral `1`;
    a Haar measure with point mass `J` gives `J`.
  - On `x > 0`, `∫ exp(−x) dx = 1`, whereas `∫ exp(−2x) dx = 1/2`;
    the rate belongs in the denominator.
  - On `x > log 2`, `∫ exp(−x) dx = 1/2`, fixing the sign of
    the truncation parameter.

- **Siegel sets in `G(𝔸)^1` have finite measure.** For `G` connected reductive, `ω` compact and
  an adelic Siegel set `𝔖 = 𝔖(T₁, ω)`, prove that the measure of `𝔖 ∩ G(𝔸)^1` is finite
  (an owned deduction from the exponential chamber integral and the Iwasawa Jacobian,
  using the Siegel sets of [Arthur], §8, Theorem 8.1, p. 37).
  *Needs:* AA.3.4; AA.3.1; AA.2.2.
  *Lean:* none; specified in the README only.
- **Finite volume of `G(F)\G(𝔸)^1`.** For every connected linear algebraic group `G/F`,
  prove that `G(F)\G(𝔸_F)^1` has finite positive volume for the invariant quotient measure: [Platonov–Rapinchuk–Rapinchuk],
  Theorem 5.24, pp. 318–321, treats every connected linear algebraic group.
  Supply its characteristic-zero Levi decomposition (*Algebraic Levi decompositions*, AA.3.1),
  the compactness of the adelic quotient of a unipotent group, and product
  integration as owned inputs. The general statement is the existence of a finite invariant
  measure on the norm-one quotient; the reductive case
  retains the specified normalization. *Needs:* AA.3.4; AA.2.3; AA.2.1; AA.2.2; AA.3.1.
  *Lean:* `Reduction.exists_fundamentalDomain_normOne_lt_top` (connected linear algebraic groups).
- **Tamagawa numbers are finite.** For connected reductive `G`, prove that the Tamagawa number
  `τ(G)` of AA.2.4 is finite and positive ([Rosengarten], §1, p. 3). *Needs:* AA.3.4; AA.2.4.
  *Lean:* none; specified in the README only.
- **When `G(F)\G(𝔸)` has finite volume.** For a linear algebraic group `G` over `F`, prove that
  `G(F)\G(𝔸_F)` carries a nonzero `G(𝔸)`-invariant Radon measure of finite volume iff
  `X*_F(G°) = 0`, with `G°` represented by
  the largest geometrically connected closed subgroup: its Hopf ideal is minimal among
  those with geometrically connected quotient, and its existence is part of the target;
  `Reduction.finite_volume_iff` is the connected specialization (finite volume in the form of a
  fundamental domain of finite Haar measure).
  [Platonov–Rapinchuk–Rapinchuk], Theorem 5.22(2), pp. 314–316.
  **Checks:** the ideal is zero for connected `G`;
  the identity component of any
  finite characteristic-zero group has no characters; `G_m` retains its nonzero
  characters. *Needs:* AA.3.4; AA.2.1.
  *Lean:* `Reduction.finite_volume_iff` (connected groups).
- **Anisotropic groups have compact quotients.** For connected reductive `G` over `F` whose
  derived group is `F`-anisotropic (equivalently, `G` has no proper `F`-parabolic subgroup;
  equivalently, every rational cocharacter `G_m → G` is central),
  prove that `G(F)\G(𝔸_F)^1` is compact ([Borel], Theorem 5.8, p. 22; [Arthur], §4, p. 21).
  The Lean statement is the equivalence: a compact set meets every `G(F)`-orbit of `G(𝔸_F)^1`
  exactly when every rational cocharacter is central (on every coefficient algebra, its points
  commute with all points of `G`).
  *Needs:* AA.3.4; AA.3.1; ReductiveGroups, layer 7.
  *Lean:* `Reduction.exists_compact_normOne_iff` and `Reduction.IsCentralCocharacter`.

  **Checks.**
  - `F^×\𝔸_F^1` is compact.
  - The trivial cocharacter (the counit followed by the unit of `F[T,T⁻¹]`) is central for every
    `H`.
  - For `G_m` every cocharacter `T ↦ T^k` is central.
  - For `GL₂` the cocharacter with coordinate map `X₁₁ ↦ T`, `X₂₂ ↦ 1`, `X₁₂, X₂₁ ↦ 0` (so
    `det⁻¹ ↦ T⁻¹`) is not central: over `R = F` its point `diag(2, 1)` does not commute with
    `[[1,1],[0,1]]`, the two products being `[[2,2],[0,1]]` and `[[2,1],[0,1]]`.
- **Isotropic groups have noncompact quotients.** For connected reductive `G` over `F` with a
  proper `F`-parabolic subgroup, prove that `G(F)\G(𝔸_F)^1` is not compact; precisely,
  `G(F)\G(𝔸)^1` is compact iff `G(F)` has no nontrivial unipotent element iff `G^der` is
  `F`-anisotropic ([Borel], Theorem 5.8, p. 22; [Arthur], §4, p. 21). *Needs:* AA.3.1; AA.1.3;
  ReductiveGroups, layer 7; AA.2.1.
  *Lean:* `Reduction.exists_compact_normOne_iff`.

  **Checks.**
  - `SL₂(F)\SL₂(𝔸_F)` is not compact.
- **Cocompact arithmetic groups contain no unipotents.** Let `G` be connected reductive over
  `ℚ` and `Γ = G(ℚ) ∩ U` for a compact open `U ⊂ G(𝔸_f)`. Prove that if `Γ\G(ℝ)` is compact then
  `Γ` contains no nontrivial unipotent element ([BKT], Remarks 1.4(1), p. 5). *Needs:* AA.3.4.
  *Lean:* none; specified in the README only.
- **S-arithmetic subgroups are lattices.** Let `G` be connected reductive over `F` with
  `X*_F(G)=0` (in particular, connected semisimple), `S` a
  finite set of places containing the archimedean ones, and `Γ_S ≤ G(F)` an
  `S`-arithmetic subgroup as defined above. Prove that its diagonal image is a lattice in
  `G(F_S) = ∏_{v∈S} G(F_v)`, cocompact iff `G` is `F`-anisotropic. This applies in particular
  to `Γ(M,S)` for `M : IntegralModel F H S₀`, `S₀ ⊆ S`, and to
  `G(F) ∩ (G(F_S) × U^S)` for compact open `U^S ≤ G(𝔸_F^S)`
  ([Rapinchuk], §2.6, p. 16; [Borel], Introduction, p. 6; §8, pp. 26–30).
  *Needs:* AA.3.4; AA.1.2; AA.1.3.
  *Lean:* none; specified in the README only.

  **Checks.**
  - At `S = ∞`, the standard `SL₂` model gives an arithmetic lattice at infinity;
    every subgroup commensurable with it is also a lattice.
  - Over `ℚ`, `SL₂(ℤ[1/p])` is a lattice in `SL₂(ℝ) × SL₂(ℚ_p)` and is not cocompact.
  - For the standard multiplicative model, `{±1}` in `ℝ^×` has infinite covolume;
    the rational-character hypothesis cannot be removed.

- **Finitely many `G(𝒪)`-orbits on rational flags.** For `F` a number field, `G` connected
  reductive over `F` (Borel 7.3 allows any connected `G`; the consumers need only reductive `G`)
  and `P` parabolic over `F`, prove that `(G/P)(F)` is a finite union of orbits of an arithmetic
  subgroup; equivalently `G(F) = ⋃_{i∈I} Γ x_i P(F)` with `I` finite ([Borel], Lemma 7.2 and
  Theorem 7.3, p. 25). *Needs:* AA.3.4; AA.3.1.
  *Lean:* none; specified in the README only.
- **Arithmetic quotients have finite volume.** (*arithmetic-quotient-finite-volume*) For
  connected reductive `G` over `F` and `Γ = G(F) ∩ U` with `U ⊂ G(𝔸_{F,f})` compact open, prove
  that `Γ \ (G(F_∞)/A_G(ℝ)^0)` has finite invariant volume ([Borel], Theorem 5.6, p. 21). *Needs:*
  AA.3.4; AA.2.1.
  *Lean:* none; specified in the README only.
- **Arithmetic quotients of anisotropic groups are compact.** For `G` connected reductive, in
  the setting of *arithmetic-quotient-finite-volume*, prove that `Γ \ (G(F_∞)/A_G(ℝ)^0)` is compact
  iff `G^der` is `F`-anisotropic; for `H = SL_1(D)` with `D` a central division algebra of degree
  `≥ 2` over `F`, `H(F)\H(𝔸_F)` and `Γ\H(F_∞)` are compact ([Borel], Theorem 5.6(ii), p. 21).
  The general division-algebra statement assumes connected
  reductivity, no rational characters, a closed matrix embedding, and a rational basis
  identifying every rational matrix with left multiplication by a unit of a
  finite-dimensional division algebra. It concludes compactness of both full quotients.
  For `SL₁(D)`, the left regular embedding and semisimplicity provide these hypotheses;
  nilpotence of `a−1` in a division algebra forces `a=1`.
  *Needs:* AA.3.4.
  *Lean:* none; specified in the README only.

**Checks for the window carrier.** The chosen window `ω = {1}` contains one.
For `SL₂/ℚ`, the allowed window `ω = {n(1)}` and the empty window exclude one.
`H_P` vanishes throughout every allowed window, so a positive split component with nonzero
logarithm is excluded. The subgroup inclusions in these formulas are the original
quotient-coordinate pullbacks.

The adelic Siegel-set carrier allows arbitrary windows; compactness and
`ω ⊆ N_P(𝔸) M_P(𝔸)^1` are explicit hypotheses of the reduction theorems.
The covering, finite-overlap and finite-measure theorems use the minimal
standard parabolic (the Hopf ideal of `P` equal to that of `P₀`); no covering or finiteness is
assumed as input. The finite-measure theorem measures the set in the **norm-one subgroup**, not its
ambient Haar measure. Empty relative roots are identified with the absence of
nontrivial `F`-cocharacters in the actual derived Hopf quotient, equivalently with the centrality
of every rational cocharacter. Compactness of the norm-one quotient is characterized both in the
anisotropic-derived form and through the actual dynamic parabolic
predicate. Finiteness of rational flags is finiteness of the arithmetic/parabolic double cosets.

**Checks for the adelic set definition.** An empty
window gives the empty set. One lies in the singleton-window set exactly when every simple
root evaluates negatively on T. For `G_m/ℚ`, `A K ≠ G_m(𝔸)` for the singleton
window, detecting the finite idele valuations that root inequalities alone miss.

For the S-arithmetic target, the `S`-points are the product of all infinite factors
and the finite factors indexed by `S`, and the projection and the diagonal evaluate precisely
these factors. The congruence-type `S`-arithmetic group of a finite level `U` consists of
rational points whose finite components outside `S` agree with some element of `U`; this is
`Γ_W` for the projection `W` of `U` to the away-`S` factors. General `S`-arithmetic
subgroups are those commensurable with a model's `Γ(M,S)`. The target states discreteness,
finite covolume and the anisotropy criterion for compactness. Finite covolume and compactness require
`X*_F(G)=0`, which includes the semisimple setting in the target.

**Checks.** `S = ∞` recovers `levelArithmetic 1 U`;
the `GL₁` rational element `p` is `S`-arithmetic when `S` contains `p` but
not at the ordinary integral level; for the trivial group the `S`-arithmetic group is everything.

For a finite-dimensional **central** division algebra `D/F`, the target
constructs `SL₁(D)` as a Hopf-ideal quotient of the
left regular `GL_n`. A splitting isomorphism `D⊗F̄≃M_d(F̄)` pins its geometric
points: left multiplication by a unit whose determinant in `M_d` is one.
Characteristic zero makes this geometric equation determine the subgroup scheme.
The target supplies semisimplicity and compactness of both the full adelic quotient
and every compact-open-level arithmetic quotient at infinity. The splitting
isomorphism is supplied by Mathlib's algebraically closed Wedderburn theorem;
the descended Hopf ideal and arithmetic conclusion are owned here.
[Platonov–Rapinchuk–Rapinchuk], §2.3.1, pp. 90–91, Proposition 2.29,
Example 4.46, pp. 252–253, and Theorem 5.24.

**Checks.** `D=F` gives the identity group;
`diag(2,1/2)` has reduced norm one after splitting;
reduced norm `−1` on `diag(−1,1)` is distinguished
from determinant `1` of left multiplication on `M₂`. The latter determinant
cannot replace the reduced norm in the defining equation.

### 3.5 Algebraic heights

- **Rational-point Arakelov comparison.** Identify
  the adelic height on `g ∈ G(F)` with DiophantineApproximationAndTranscendence's
  relative projective `arakelovMulHeight`
  of the tuple indexed by `Bool × Fin m × Fin m`, containing the entries of
  `ρ(g)` and `ρ(g)⁻¹`. Its finite factors use normalized `|π_v|=N(v)⁻¹`; at infinity
  they use the `ℓ²` norm to exponent `mult(v)`. For `d=[F:ℚ]`, the absolute
  Arakelov height is `height(Δg)^(1/d)`, equivalently the adelic height is the
  d-th power of the absolute height. For `m=0`, the empty tuple and the adelic
  representation both have height one; raw `height2` is zero on this tuple.
  Consume `arakelovMulHeight_eq_height2` and the extension-power consequence of
  `height2_baseExtension`: for an embedding `f : F → E` of number fields and any finite tuple `y`,
  `arakelovMulHeight (f ∘ y) = arakelovMulHeight y ^ [E:F]`, including at zero.
  The supplier is DiophantineApproximationAndTranscendence §2.5,
  **Relative Euclidean projective normalization**, which owns the tuple-height carrier on
  finite index types and the extension transport; no tuple height is pinned in Tau Ceti.
  This comparison uses its relative height and the formula of *adelic-height*.
  *Needs:* DiophantineApproximationAndTranscendence §2.5, **Relative Euclidean projective
  normalization**; AA.3.5 (*adelic-height*).
  *Lean:* none; specified in the README only.

  **Checks.**
  - Rank zero gives one for both the adelic height and the relative projective height
    of the empty tuple; raw `height2` gives zero.
  - The entry tuple of `(I₂,I₂⁻¹)` gives relative height `2^[F:ℚ]` and absolute
    height two, including over quadratic `F`.
  - The rational `GL₁` point 2 gives `sqrt(17)`: the tuple `(2,1/2)` has archimedean
    factor `sqrt(17)/2` and 2-adic factor 2.
  - After base change of the same point to a quadratic field `E`, the relative height of
    `(2,1/2)` is `sqrt(17)² = 17`, while the absolute height stays `sqrt(17)`.

- **Local polynomial comparison for algebraic heights.** Define the local height at a finite
  place as the maximum of the normalized absolute values of entries of `r(g)` and its inverse,
  and at an infinite place as their combined Hilbert–Schmidt norm to the
  archimedean multiplicity. Both are one in rank zero. The comparison is stated at finite and at
  infinite places.
  **Checks:** rank zero gives one; the identity gives one at
  finite places and `sqrt(2m)^mult` at infinity; local heights are unchanged by
  inversion. These local formulas agree with the factors in the height formula of *adelic-height*.
 For `F` a number field, `G` an affine
  algebraic group over `F`, closed immersions `σ : G → GL_m` and `τ : G → GL_{m′}` over `F`, and
  local norms as in *adelic-height* applied to `σ ⊕ σ^∨` and `τ ⊕ τ^∨` (dual-augmented norms),
  prove that there are integers `N ≥ 1` and positive `c_v`, with `c_v = 1` at almost all finite
  places, such that `‖τ(g)‖_v ≤ c_v ‖σ(g)‖_v^N`; the statement includes inverse coordinates
  ([Arthur], §13, p. 70). *Needs:* AA.1.1; AA.1.5.
  *Lean:* none; specified in the README only.
- **Properness of dual-augmented adelic height.** For `F` a number field, `G` an affine
  algebraic group over `F`, `σ : G → GL_n` a closed immersion over `F`, `r` containing `σ ⊕ σ^∨`,
  and local norms normalized as in *adelic-height*, prove that the product height of
  *adelic-height* has compact sublevel sets: at infinity it bounds both `σ(g)` and `σ(g)⁻¹`; at
  finite `v` its value is `≥ 1` and, when not integral in both directions, is `≥ q_v`. A height
  bound therefore allows only finitely many exceptional finite places ([Arthur], §13, p. 70).
  *Needs:* AA.1.2; AA.1.3; AA.3.5.
  *Lean:* none; specified in the README only.
- **Polynomial count of rational coordinates.** For a number field `F`, an integer `d ≥ 1`,
  absolute values normalized for the product formula (`|·|_v = |·|^{[F_v:ℝ]}` at archimedean
  `v`) and `R ≥ 1`, prove that the number of `a ∈ F^d` with
  `∏_v max(1, |a₁|_v, …, |a_d|_v) ≤ R` is at most `C R^N`, for constants `C, N` depending only on
  `F, d` ([Arthur], §13, p. 70). *Needs:* GlobalNumberFields, layer 6.
  *Lean:* none; specified in the README only.
- **Height functions on `G(𝔸)`.** (*adelic-height*) For an affine algebraic group `G` over the number field `F`,
  choose a faithful `F`-algebraic representation `r : G → GL_m` containing a representation and
  its dual (and, if needed, a trivial summand), so the resulting height is proper and each local
  norm is at least `1`; arbitrary abstract faithful point representations do not suffice. Define
  the height `‖·‖_r : AdelicPoints H → ℝ`, `‖x‖_r = ∏_v ‖r(x)_v‖_v`, using the entrywise maximum
  of normalized absolute values at finite `v` and the Hilbert–Schmidt norm raised to the
  archimedean multiplicity `[F_v:ℝ]` at infinity; the height of `r` already uses
  `r ⊕ r^∨`, and the displayed product is its defining formula in positive rank (the inequalities
  below are also satisfied by `‖·‖_r²` or any power, so they do not fix the function). Prove
  `‖x y‖_r ≤ ‖x‖_r ‖y‖_r`, that
  `‖x⁻¹‖_r ≤ C ‖x‖_r^N` for some `C, N`, that
  `{x | ‖x‖_r ≤ t}` is compact for a suitable `r`, and that
  the sublevel set in `G(F)` is finite and `#{γ ∈ G(F) | ‖γ‖_r ≤ t} ≤ C t^N`, using the proper-height and counting results of this
  subsection ([Arthur], §13, p. 70). *Needs:* AA.1.1; AA.1.5; AA.1.3; AA.1.4; AA.3.5.
  *Lean:* none; specified in the README only.

  Arthur's formulas (13.2)–(13.4), p. 70, use a matrix height over `ℚ`.
  The extension here to affine algebraic groups uses closed immersions and polynomial
  expressions in matrix entries and inverse entries; properness and rational counting are
  supplied by the preceding targets for affine groups. Restriction of scalars gives the
  number-field version;
  adjoining the dual fixes inversion symmetry, and normalized local absolute values
  supply the stated exponents. These normalizations are part of the height formula, rather
  than a quotation of Arthur's chosen embedding.

  **Checks.**
  - The zero-dimensional representation has height `1`; the empty Hilbert–Schmidt norm
    itself is `0`, so this case is defined separately. A counting assertion includes
    finiteness: Lean assigns `Set.ncard = 0` to the infinite set `ℕ`.
  - For `GL₁/ℚ` with the standard character `r(x) = [x]`, so `r ⊕ r^∨ = diag(x, x⁻¹)`, `‖x⁻¹‖ = ‖x‖`; the real local factor is
    `sqrt(x² + x⁻²)`, and each finite factor is `max(|x|_p, |x⁻¹|_p)`.
  - If `G(F_∞)` is noncompact the height is unbounded on `G(𝔸)`; a height built from finite
    places only would be bounded on `G(F_∞)` and fail the compactness of height balls.
  - For `GL₂/ℚ` with the standard representation, `‖1‖ = √4 = 2`; `‖·‖²`
    satisfies all the inequalities above and gives `4`.
  - For `G_a/ℚ` embedded by `t ↦ [[1,t],[0,1]]`, the dual-augmented local factors are
    `sqrt(4 + 2t²)` at infinity and `max(1, |t|_p)` at finite places. This nonreductive
    group has the same proper-height construction and polynomial comparison.
- **Comparison of heights.** For any affine algebraic group `G` over the number field `F` and two proper
  `F`-algebraic height representations `r, r′` satisfying *adelic-height* (both algebraic and
  defining proper heights controlling their inverses), prove that there are `C, N > 0` with
  `‖x‖_{r′} ≤ C ‖x‖_r^N` for every `x ∈ G(𝔸_F)`, and conversely; and that multiplication on either
  side by a fixed compact subgroup changes these heights by bounded factors ([Arthur], §13,
  p. 70). *Needs:* AA.3.5.
  *Lean:* none; specified in the README only.
- **Heights on Siegel sets.** The statement uses a positive-definite real
  seminorm on the existing `a_P` vector space (so its addition is not replaced). For a connected reductive group `G` over `F` and a Siegel set
  `𝔖(T_1, ω)`, prove that there are `c, C > 0` such that for `x = pak`,
  `c e^{c‖H_0(a)‖} ≤ ‖x‖ ≤ C e^{C‖H_0(a)‖}` (any norm on `a_0`); in particular `log‖x‖` and
  `‖H_0(x)‖` are comparable on `𝔖 ∩ G(𝔸)^1` up to constants ([Arthur], §13, p. 70). *Needs:*
  AA.3.5; AA.3.4; AA.3.1.
  *Lean:* none; specified in the README only.

### 3.6 Cusps for one fixed maximal compact

- **Finitely many cusps.** The statement uses actual rational
  conjugation of Hopf ideals on every coefficient algebra. For `G` connected reductive over a number field `F` and the arithmetic subgroup
  `Γ=levelArithmetic 1 U` for compact open `U`, prove that there are only finitely many `Γ`-conjugacy classes of `F`-parabolic
  subgroups ([BKT], Proposition 2.7(1), p. 9; [Borel], Theorem 7.3, p. 25). *Needs:* AA.3.1; AA.3.4.
  *Lean:* none; specified in the README only.
- **Finitely many fixed-`K` Siegel sets cover.** The statement
  supplies a complete irredundant list of arithmetic conjugacy classes of rational
  parabolics, their fixed-`K` data, relatively compact open windows and positive thresholds,
  covering the connected real group modulo its level arithmetic group. The theorem applies
  to connected reductive `G`; the window enlargement of AA.3.2 supplies semialgebraic
  windows without changing this list or losing coverage. For `G` connected semisimple over `ℚ`, `Γ`
  arithmetic, `K` fixed and `M ⊂ K` compact, let `𝐏_1, …, 𝐏_k` represent the `Γ`-conjugacy
  classes of `ℚ`-parabolics. Prove that there are Siegel sets `𝔖_i = U_i × A_{𝐏_i,t_i} × W_i`
  associated to `𝐏_i` and the same `K` whose images cover `Γ\G/M` ([BKT], Proposition 2.7(1),
  p. 9; [BKT erratum], §1.1, p. 1). *Needs:* the preceding bullet; AA.3.2; AA.3.4.
  *Lean:* none; specified in the README only.
- **Finite overlaps of Siegel sets.** The statement allows two
  parabolics and independently chosen positive thresholds, at the same `K`. For Siegel sets `𝔖_1, 𝔖_2` associated to the same `K`,
  prove that `{γ ∈ Γ : γ𝔖_1 ∩ 𝔖_2 ≠ ∅}` is finite, and that the same holds for the relatively
  compact closures of their unipotent and Levi factors ([BKT], Proposition 2.7(2), p. 9).
  *Needs:* AA.3.2; AA.3.3.
  *Lean:* none; specified in the README only.
- **Deep Siegel sets of distinct parabolics are disjoint.**
  The statement compares distinct Hopf ideals. For distinct `ℚ`-parabolics
  `𝐏_1 ≠ 𝐏_2` and fixed bounded `U_i`, `W_i` (one `K`), prove that the Siegel sets `𝔖_1, 𝔖_2` are
  disjoint once `t_1, t_2` are sufficiently large ([BKT], Proposition 2.7(5), p. 9). *Needs:*
  AA.3.2; ReductiveGroups, layer 7.
  *Lean:* none; specified in the README only.
- **Inequivalent cusps separate.** The statement
  quantifies over the actual arithmetic image in the real identity component. If `𝐏_1` and `𝐏_2` are not `Γ`-conjugate, prove that for
  fixed `U_i`, `W_i` and all sufficiently large `t_1, t_2`, `γ𝔖_1 ∩ 𝔖_2 = ∅` for every `γ ∈ Γ`
  ([BKT], Proposition 2.7(3), p. 9). *Needs:* the preceding bullets; AA.3.2.
  *Lean:* none; specified in the README only.
- **Deep self-intersections come from the parabolic.**
  The statement concludes membership in the original parabolic. For fixed `U`, `W` and sufficiently
  large `t`, prove that a Siegel set `𝔖` for `𝐏` and `K` satisfies `γ𝔖 ∩ 𝔖 = ∅` for every
  `γ ∈ Γ ∖ Γ_𝐏`, where `Γ_𝐏 = Γ ∩ 𝐏(ℚ)` ([BKT], Proposition 2.7(4), p. 9). *Needs:* the
  preceding bullets; AA.3.2.
  *Lean:* none; specified in the README only.
- **Comparison of Siegel-set conventions.** Fix a triple compact `K`. For a standard
  rational parabolic `P` above its minimal `P₀`, relatively compact `U,W`, and `t>0`,
  prove that the horospherical domain lies inside one triple
  domain. For `P=P₀`, prove cofinality in both directions on
  the real identity component, with `K⁺=K∩G(ℝ)⁺` and changed positive thresholds.
  The converse is not asserted for a larger parabolic: for `P=G=SL₂` the domain from a bounded
  horospherical window cannot contain a noncompact minimal-parabolic domain.
  Prove that any triple domain for `K` lies inside a single rational
  translate of one for another fixed minimal parabolic and the same `K`.
  [BKT], §2.2, p. 8; [Orr], §§2.B–2.C, pp. 6–7. *Needs:* AA.3.2; AA.3.1.
  *Lean:* none; specified in the README only.

### 3.7 Subgroup containment and orbit maps

All groups in this subsection are connected reductive algebraic groups over `ℚ`;
real points may be disconnected. The general objects below are specified in the README only;
the compact norm-one torus below provides matrix Checks.

An algebraic Cartan datum on a group with coordinate algebra `B` specifies a faithful rational
matrix representation `ρ`, a positive
real form `b`, and a real algebraic involution `θ` of `G_ℝ` with the equation
`ρ(θ(g))=b⁻¹ρ(g⁻¹)ᵀb`. Its compact subgroup is exactly `Fix(θ)` and is maximal
among compact subgroups. This inverse-adjoint realization imposes algebraic Cartan
compatibility, in addition to compactness. Such data exist for
every connected reductive group. The LieGroups roadmap's `CartanInvolution` instead
uses smooth manifolds and the Lie algebra; this carrier records the algebraic
realization needed for rational parabolics. [BHC], §§1.1, 1.6–1.9, pp. 486, 489–492.

**Checks.**
- In the standard representation of `SL₂` with `b = I`,
  `θ(diag(2,1/2)) = diag(1/2,2)`.
- Its compact subgroup `K = SO₂(ℝ)` contains `[[0,−1],[1,0]]`.
- The upper unipotent `[[1,1],[0,1]]` is outside `K`.
- The reflection `diag(−1,1)` lies in `O₂(ℝ)` but is outside `SL₂(ℝ)`.

A Siegel triple consists of relative root data (AA.3.1), its minimal parabolic,
a Cartan datum, and `u∈N(ℝ)`. Its real split torus, positive component and norm-one
Levi factor are pinned by

`S = u S₀(ℝ) u⁻¹,      θ(S)=S,      A=S⁰, M = u {m∈M₀(ℝ) : |χ(m)|=1 for every χ∈X*_ℚ(M₀)} u⁻¹, logA(a)(χ) = log |χ(u⁻¹au)|  (χ∈X*_ℚ(M₀)),`

where `M₀ = Z_G(S₀)` is the rational minimal Levi of AA.3.1.

The equation for `S` also specifies its real algebraic group: base change the
rational split torus, then conjugate by the real point `u` on every real algebra.
Thus `logA : A → a₀ = a_{P₀} = a_{M₀}`, the full minimal-Levi character space of AA.3.1,
central split directions included; it does not take values in the ambient `a_G`, and the
projection `a₀ → a_G` of AA.3.1 is a separate map. A root `α` of `S₀` need not be a rational
character of `M₀`, so `logA(a)(α)` means the value at `α` of the canonical lift
`a₀ → Hom(X*(S₀), ℝ)` of AA.3.1. A triple exists with
a given Cartan compact and a given rational minimal parabolic.
Its `N` is the actual real unipotent radical; the window group is `N M⁰`, where `M⁰` is
`M`'s own identity component. This differs from `M_P^+ = M_P ∩ 𝐆(ℝ)^+` in AA.3.2:
for the upper Borel of `SL₂`, `M⁰={I}` while `M_P^+={±I}`.
[Orr], Lemma 2.1 and §2.B, pp. 6–7.

**Checks.** For `G_m`, `S=G_m(ℝ)` with no simple roots;
for the trivial group `A=N=1`; with `K=SO₂` the tilted torus is excluded.
For the standard `SL₂` triple (`u=1`, diagonal `S₀`), `a_{SL₂}=0` while `a₀≅ℝ`, and
`logA(diag(2,1/2))(α) = log 4` for the simple root `α(diag(t,t⁻¹)) = t²`.
For `G_m`, `logA(a)(id) = log|a|` is the untruncated central direction of `a₀≅ℝ`;
for the trivial group `a₀=0`.
The defining stability equation is checked as well. For `G_m`, `N=M⁰=1` and `NM⁰={1}`; for the
trivial group that set is the whole one-point group; for a standard `SL₂` triple,
`N={[[1,x],[0,1]]}`, `M⁰=1`, and `NM⁰=N`.

A window of a triple is a compact `Ω⊆NM⁰` together with `t>0`. The two set definitions
are the cone `{a∈A : exp(logA(a)(α))≥t for all simple α}` and
the domain `Ω·cone(t)·K`. These use weak inequalities; the comparison with the horospherical
Siegel sets of AA.3.2 changes thresholds when passing to their strict inequalities. Membership in
the domain is the literal three-factor formula, and the domain grows when the window is enlarged
and the threshold lowered. [Orr], §2.B, item (4), pp. 6–7.

**Checks.** The empty
and singleton-identity windows are allowed at `t=1`, and `t=−1` is excluded.
The cone leaves all central split directions
untruncated, includes `1` at `t=1`, and excludes it at `t=2` when roots exist.
An empty window gives an empty domain; the domain contains `1` when `1∈Ω` and
`t≤1`; it is `AK` when roots are absent and `Ω={1}`.

An embedding of groups with coordinate algebras `B` and `H` is a surjective coordinate bialgebra
map `B→H`, with its point maps. Compatibility of triples `T_H`, `T_G` along it requires compact
inclusion `K_H⊆K_G`, torus inclusion `S_H⊆S_G`, `N_H⊆N_G`, and a homomorphism
`res:X*(S_G)→X*(S_H)`. Its character equation is
`χ_G(u_G⁻¹e(u_H s u_H⁻¹)u_G)=res(χ_G)(s)` for every real split-torus point.
Thus restriction and the dual real-character-space map are fixed by the
algebraic embedding; they are not independent maps of abstract root systems. The ambient
Cartan involution stabilises `S_H`. Full-torus intersections can have finite components
outside `S_H`; character restriction uses the inclusion alone.
[Orr], §§4.B–4.C, pp. 17–22; [Orr–Schnell], §§A,E.

**Checks.**

- The identity embedding is the identity on every coefficient algebra.
- A closed embedding is injective on points, and the identity group has trivial image.
- For `H=G` the character restriction is the identity.
- A vanishing restriction evaluates to `1`.
- For `H=G_m` the root system is empty.

**Checks for the compact norm-one torus.** Take `G=SL₂/ℚ` and
`H=ker(N_{ℚ(i)/ℚ}:Res_{ℚ(i)/ℚ}G_m→G_m)`, embedded as
`[[a,−b],[b,a]]` with `a²+b²=1`. Then `H(ℝ)=SO₂(ℝ)` is compact, `H` is
`ℚ`-anisotropic, and its triple has `P_H=H`, `S_H=N_H=1`, `K_H=H(ℝ)`.
The standard ambient Cartan involution fixes `H` pointwise. Direct matrix calculation
in the standard `SL₂` triple gives:

- `diag(t,t⁻¹)` belongs to `H(ℝ)` exactly when `t=±1`, so the full algebraic
  intersection is `μ₂` while `S_H=1`.
- `−I` belongs to `H` and to every full ambient maximal split torus: these tori
  are real conjugates of the diagonal torus and `−I` is central. It is distinct from `I`.
- With `Ω_H=H(ℝ)`, the subgroup domain is `SO₂(ℝ)` and lies in the standard ambient
  domain with `Ω_G={1}` and threshold `1`; the positive ambient torus meets `H(ℝ)` in `{I}`.

For the rational-split intermediate statements below, the hypothesis `u=1` on the subgroup
triple chooses the
rational torus as the Cartan-stable lift. The compatible-parabolic statement produces `Q`
with Levi `Z_G(S_H)`, `N_H⊆R_u(Q)`, and `P_G⊆Q`. The root-cone statement gives
finitely many real normalizer representatives and `0<t′≤1`, preserving the
required inclusions of `N_H` and `N_Z=N_G∩Z_G(S_H)`. In the Weyl-representative statement,
the specified `u∈N_Z(ℝ)` sends `S_G` to the rational split torus of the ambient triple's root
data; a rational normalizer point `n` gives `w_Q=u⁻¹nu`. The hypotheses require
`N_H,N_Z⊆w_Q N_G w_Q⁻¹`. The conclusions supply `w_K∈K_G`,
`w_Q⁻¹w_K∈Z_G(S_G)(ℝ)⁰`, and `n⁻¹w_Q∈N_G`.
The uniform-window statement takes a finite family of these representatives, including
their connected-centralizer condition, and gives a single ambient compact window
and compact `B_w⊆A_G` satisfying the inclusion below.

An orbit-map datum for `H` in dimension `n` specifies a faithful algebraic representation into `SL_n`, with
the determinant equation on every coefficient algebra, a positive form `b₀`, and
a compatible Cartan datum on `H`. It defines

`value(g)=ρ(g⁻¹)ᵀ b₀ ρ(g⁻¹),      quotient(gK_H)=value(g).`

Equality of values is exactly `g⁻¹h∈K_H`, and
this pins the quotient map. Its values have determinant `det(b₀)`.
The carrier is constructed from the original Lie hypothesis:
for dual-number points with `ρ(g)=1+εX`, the tangent matrices are stable under
`X↦b₀⁻¹Xᵀb₀`. The negative sign in the Cartan differential is immaterial for a
linear subspace. The carrier theorem assumes connected reductivity, faithfulness,
the determinant equation and positive definiteness. [BKT], §4.5, pp. 17–18;
[BKT erratum], §1.5, p. 3.

**Checks.**

- `value(1)=b₀`, and its determinant is `det(b₀)`.
- With `b₀=1`, the `G_m→SL₂` orbit takes `diag(a,a⁻¹)` to `diag(a⁻²,a²)`.
- The quotient map sends the base coset to the base form and distinguishes distinct compact
  cosets.
- Degenerate forms are not in its image.

Three explicit Hopf ideals fix the failure cases on every coefficient algebra.
The tilted torus in `SL₂` has points `[[x,x⁻¹−x],[0,x⁻¹]]`, for a unit `x`.
Its whole real point group is a triple domain, its compact
factor is `{±1}`, and its image in the upper half-plane is `(1−y)+iy`, `y>0`.
No finite union of rational translates of a Siegel set with compact `SO₂`
contains it. The nonsplit torus has points `[[a,2b],[b,a]]`, `a²−2b²=1`.
Its rational split torus is trivial, so it meets the torus-stability condition
while the standard ambient Cartan involution does not preserve the group.
[Orr–Schnell], Remark 2 and §B, pp. 1231–1233.

**Checks.**

- The tilted torus contains `1` and `[[2,−3/2],[0,1/2]]` (the point `x=2`).
- It excludes the transpose `[[2,0],[−3/2,1/2]]`, and its image is the ray `(1−y)+iy`.
- The nonsplit torus contains `1` and `[[3,4],[2,3]]` (`9−2·4=1`).
- It excludes `[[3,2],[4,3]]`.

For the semisimple example, set
`η=[[3/2,0,−1/2],[0,1,0],[−1/2,0,3/2]]` and
`B=η[[0,0,1],[0,1,0],[1,0,0]]ηᵀ`.
The twisted orthogonal group is the subgroup of `SL₃` cut out by `gBgᵀ=B` on every
coefficient algebra. It is semisimple, and it has a triple
with compact factor contained in `SO₃` whose domain escapes every finite
union of rational translates of any fixed-`SO₃` ambient triple domain.
Every `SL_n` has a triple with the standard orthogonal compact.
[Orr–Schnell], §C, pp. 1233–1234.

**Checks.**

- The twisted group contains `1`.
- It contains `η diag(2,1,1/2)η⁻¹=[[35/16,0,9/16],[0,1,0],[−9/16,0,5/16]]`.
- It excludes the transpose of that matrix.
- `(ηᵀη)₁₃=−3/2`, the off-diagonal obstruction.

- **Compatible parabolic and torus for a subgroup.** (*containment-parabolic-torus*) For
  `H ⊂ G` reductive `ℚ`-groups, a Siegel triple `(P_H, S_H, K_H)` for `H` with `S_H` `ℚ`-split
  (the general case reduces to this by conjugating with an element of `R_u(P_H)(ℝ)`, [Orr], §4.A,
  p. 16), and `K_G ⊂ G(ℝ)` maximal compact with `K_H ⊂ K_G` whose Cartan involution stabilises
  `S_H`, choose a parabolic `ℚ`-subgroup `Q ⊂ G` with Levi `Z_G(S_H)` and `N_H ⊂ R_u(Q)`, then a
  minimal `P_G ⊂ Q`. Prove that its Cartan-stable Siegel torus `S_G` contains `S_H` and
  `N_H ⊂ N_G` ([Orr], §4.B, Lemmas 4.2–4.5, pp. 17–19; [Orr–Schnell], §§A,E,
  pp. 1232, 1236). *Needs:* AA.3.1; AA.3.2; ReductiveGroups, layer 7.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `H=G`, choose the original triple and `Q=P_H`.
  - For the trivial subgroup, take `Q=G` and any ambient minimal parabolic.
  - For the compact norm-one torus above, `Q=G`, `S_H=N_H=1`, and `S_G∩H=μ₂`.
- **Finite root-cone comparison.** (*containment-finite-root-cones*) In the notation and under
  the hypotheses of *containment-parabolic-torus* (`S_H` `ℚ`-split, `K_H ⊂ K_G`, Cartan
  involution of `K_G` stabilising `S_H`), with `Z = Z_G(S_H)`, `N_Z = R_u(P_G ∩ Z)` and `t > 0`,
  prove that there is `t′ ∈ (0, 1]` such that every `a ∈ A_{H,t}` belongs to `w A_{G,t′} w⁻¹` for
  some `w` in the finite Weyl group of `S_G` satisfying `N_H, N_Z ⊂ w N_G w⁻¹`. Roots of `S_G`
  vanishing on `S_H` take the value `1 ≥ t′` on `a`, so they impose no further condition ([Orr],
  §4.C, Proposition 4.7 and Lemmas 4.8–4.9, pp. 19–22; [Orr–Schnell], §§A,E, pp. 1232, 1236).
  *Needs:* AA.3.7; ReductiveGroups, layer 7.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `H=G`, the identity Weyl element works with `t′=min(t,1)`.
  - For the trivial subgroup, `a=1` lies in every ambient cone with `t′≤1`.
  - For the compact norm-one torus, all ambient roots restrict trivially and take value `1`
    on `A_H={1}`.
- **Rational and compact Weyl representatives.** (*containment-weyl-representatives*) In the
  notation and under the hypotheses of *containment-finite-root-cones*, with `w` ranging over
  the finite set of Weyl elements of `S_G` with `N_H, N_Z ⊂ w N_G w⁻¹`, `u ∈ N_Z(ℝ)` with
  `u S_G u⁻¹` a maximal `ℚ`-split torus of `P_G ∩ Z`, and the maximal real split torus containing
  `S_G` chosen stable under the Cartan involution of `K_G`: for each admissible `w`, choose a
  compact representative `w_K ∈ K_G` and a representative `w_Q = u⁻¹ w′_Q u` with `w′_Q ∈ G(ℚ)`
  and `w′_Q⁻¹ w_Q ∈ N_G(ℝ)`, and prove that their quotient can be chosen in the identity component
  of `Z_G(S_G)(ℝ)` ([Orr], §4.D, Lemmas 4.10–4.11, pp. 22–23; [Orr–Schnell], §§A,E, pp. 1232,
  1236). *Needs:* AA.3.7; ReductiveGroups, layer 7; RepresentationTheory/LieGroups, layer 9.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The identity Weyl element has `w′_Q=w_Q=w_K=1`.
  - In standard `SL₂` with `H` the diagonal split torus, the nonidentity Weyl element has
    rational compact representative `[[0,−1],[1,0]]`.
  - For the compact norm-one torus, `N_Z=N_G` leaves only the identity Weyl element
    admissible, and the connected-centralizer quotient is `1`.
- **Uniform compact factors for subgroup Siegel sets.** In the notation and under the
  hypotheses of *containment-weyl-representatives*, with `Ω_H ⊆ N_H M_H⁰` compact and
  `K_Z = K_G ∩ Z_G(S_H)(ℝ)` (maximal compact in `Z_G(S_H)(ℝ)` by the Cartan hypothesis), prove
  that one can choose a compact `Ω_G ⊆ N_G M_G⁰` and, for every admissible `w`, a compact
  `B_w ⊂ S_G(ℝ)^0` such that `w′_Q⁻¹ Ω_H ⊂ Ω_G w_K⁻¹ B_w K_Z`; all these choices range over a
  finite Weyl set ([Orr], §4.E, Lemmas 4.12–4.13, pp. 23–24; [Orr–Schnell], §§A,E, pp. 1232,
  1236). *Needs:* AA.3.7; AA.3.2.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For trivial groups take every compact factor to be `{1}`.
  - For `H=G` and the identity representative take `Ω_G=Ω_H`, `B_w={1}`.
  - For the compact norm-one torus take `Ω_G=B_w={1}` and `K_Z=SO₂(ℝ)` for its full compact
    window.
  - For `H=G=SL₂` with the standard upper-Borel triple, `M_H⁰=M_G⁰={I}`; the singleton `{-I}`
    is not a window in either group, while `-I ∈ K_G=SO₂(ℝ)`.
- **Containment of subgroup Siegel sets.** (*orr-schnell-containment*) Let `𝐇 ⊂ 𝐆` be
  reductive `ℚ`-groups, `(𝐏_H, 𝐒_H, K_H)` a Siegel triple for `𝐇` and `𝔖_H = Ω A_t K_H` a Siegel
  set. Let `K_G ⊂ 𝐆(ℝ)` be maximal compact with `K_H ⊂ K_G` and whose Cartan involution
  `θ_{K_G}` stabilises `𝐒_H`. Prove that there are a Siegel triple `(𝐏_G, 𝐒_G, K_G)`, a Siegel
  set `𝔖_G` for it and a finite `C ⊂ 𝐆(ℚ)` with `𝔖_H ⊂ C·𝔖_G`; moreover `R_u(𝐏_H) ⊂ R_u(𝐏_G)` and
  `𝐒_H ⊆ 𝐒_G` ([Orr–Schnell], Theorem 1, pp. 1231–1232; §§A,E; [Orr], §4.F, Proposition 4.14,
  p. 24; [Orr], §4, Theorem 4.1, p. 15). *Needs:* AA.3.7; AA.3.6.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `H=G`, take the original domain and `C={1}`.
  - For the trivial subgroup, its nonempty domain is `{1}`, contained in an ambient domain
    with threshold `1`.
  - For the compact norm-one torus, the domain `SO₂(ℝ)` is contained with `C={1}`,
    although the full-torus intersection is `μ₂`.
- **Stability of the subgroup under the Cartan involution suffices.** In the setting of
  *orr-schnell-containment* with `K_H ⊂ K_G`, prove that if the Cartan involution `Θ` of `𝐆` for
  `K_G` stabilises `𝐇`, then `Θ|_𝐇` is the Cartan involution of `𝐇` for `K_H` and `Θ` stabilises
  the torus `𝐒_H` of every Siegel triple, so the theorem applies. The converse fails for
  `𝐆 = SL_2`, `𝐇 = {(a, 2b; b, a) : a² − 2b² = 1}`,
  `K_G = SO_2(ℝ)`, `K_H={±1}`, `𝐒_H = {1}` ([BKT erratum], Proof of Theorem 1.2, p. 3; [Orr–Schnell],
  Remark 2, pp. 1231–1232). *Needs:* AA.3.7; RepresentationTheory/LieGroups, layer 9.
  *Lean:* none; specified in the README only.
- **Intersecting Siegel sets with a subgroup.** Let `𝐇 ⊂ 𝐆` be reductive over `ℚ`,
  `K_H = K_G ∩ 𝐇(ℝ)` maximal compact, and assume every `K_H`-Siegel set lies in finitely many
  `𝐆(ℚ)`-translates of a `K_G`-Siegel set (the conclusion of *orr-schnell-containment*, taken as
  the forward-containment hypothesis). Prove that for every `K_G`-Siegel set `𝔖_G` there are a
  `K_H`-Siegel set `𝔖_H` and a finite `F ⊂ 𝐇(ℚ)` with `𝔖_G ∩ 𝐇(ℝ) ⊂ F 𝔖_H` ([BGST], §28,
  Proposition 28.1, pp. 14–15; [BKT erratum], §1.5, p. 3). *Needs:* AA.3.7; AA.3.6; AA.3.2.
  *Lean:* none; specified in the README only.
- **Compact inclusion alone does not give Siegel containment.** Prove that there are
  inclusions of reductive (even semisimple) `ℚ`-groups `𝐇 ⊂ 𝐆` with `K_H ⊂ K_G` for which some
  `𝐇`-Siegel set is not covered by finitely many `𝐆(ℚ)`-translates of `K_G`-Siegel sets; the
  Cartan compatibility hypothesis of *orr-schnell-containment* cannot be removed ([Orr–Schnell],
  §§B–C, pp. 1232–1234). The examples are the tilted torus of `SL₂` and the twisted orthogonal
  group above. *Needs:* AA.3.7; AA.3.6.
  *Lean:* none; specified in the README only.
- **Preimages of Siegel sets under orbit maps.** (*orbit-map-siegel-preimage*) Let `𝐇 ⊂ SL(V)`
  be reductive over `ℚ`, `x_0 ∈ X = SL(V_ℝ)/SO(b_0)` with `K_H = Stab_{𝐇(ℝ)}(x_0)` and the Cartan
  involution of `x_0` stabilising `Lie 𝐇`, and `ι : 𝐇(ℝ)/K_H → X` the orbit map. Prove that for
  every Siegel set `𝔖 ⊂ X`, `ι⁻¹(𝔖)` is contained in finitely many Siegel sets of `𝐇(ℝ)/K_H`
  associated to `K_H`. In the Gram realization, fix a rational
  ordered basis and `C>0`; the reduced-form preimage is covered by finitely many
  `H(ℚ)`-translates of a single triple domain with this compact ([BKT], §4.5, pp. 17–18 (arXiv v2); JAMS pp. 932–933). *Needs:* AA.3.7; AA.3.2.
  *Lean:* none; specified in the README only.
- **Images of Siegel sets under orbit maps.** In the setting of *orbit-map-siegel-preimage*,
  prove that every Siegel set of `𝐇(ℝ)/K_H` is mapped by `ι` into finitely many Siegel sets of
  `X`. In the Gram realization, there are one `C>0` and finitely many rational
  ordered bases in which every image form is `C`-reduced ([BKT], §4.5, p. 18 (arXiv v2); JAMS p. 933). *Needs:* AA.3.7; AA.3.2; AA.3.6.
  *Lean:* none; specified in the README only.

**Further carrier Checks.** Discriminating Checks for each auxiliary object.

| Object | Three discriminating Checks |
|---|---|
| The splitting `a_{P₁} ≃ a_{P₂} × a_{P₁}^{P₂}` (AA.3.1) | equal parabolics give `(a,0)`; a relative vector gives `(0,a)`; a lifted quotient vector gives `(a,0)` |
| The infinite diagonal `G(F) → G(F_∞)` | identity; the actual scalar coordinate; distinct rational points stay distinct |
| Ordinary right translation on the norm-one quotient, by `G(𝔸)^1` as in AA.2.3 | identity multiplier; `([x]·g)·h=[x]·(gh)`; the idele with `u_∞=−1` and `u_p=1` for all finite `p` moves the base class over `ℚ`; the idele with `g_∞=2` and `g_p=1` is excluded since `xg` has nonzero height |
| Unipotent rational points | identity; `[[1,1],[0,1]]`; exclusion of `diag(2,1/2)` |
| The `S`-projection and `S`-diagonal (AA.3.4) | identity; unchanged infinite factor; exact value at every retained finite place |

The real regularity targets use `TauCeti.IsSemialgebraic`'s defining polynomial set
algebra, written out in finite matrix coordinates. The checks of the horospherical coordinates
at the identity, on `K` and on a split element
fix the smooth coordinate map; the empty-window and truncation-wall Checks
also apply to the semialgebraicity of Siegel sets. Root value two fixes the corner chart, and
the `G_m` check excludes the missing-character hypothesis.

**Checks for the horospherical logarithm.** `log(1)=0`;
`log(ab)=log(a)+log(b)`; the logarithm is nonzero
at every nonidentity positive split point, including a central torus direction.
These check the logarithm itself, beyond its simple-root evaluations.

**Checks for coordinate and subgroup helpers.**

| Object | Checks |
|---|---|
| Cocharacters of a split torus (AA.3.1) | zero degree; doubling doubles the pairing; a primitive degree pairs to one. |
| The adjoint action (AA.3.1) | identity operator; torus action is trivial; a nonzero root vector is doubled. |
| The Levi inclusion of standard parabolics | equal parabolics; original quotient coordinates; every smaller-Levi coordinate occurs. |
| Restriction to the split component | original torus coordinates; every torus function occurs; a proper torus inclusion has nonzero kernel. |
| The root coordinates of `a_P` | zero; actual character value; central directions survive. |
| Subgroup points in the ambient group | identity; exact quotient evaluation; distinct subgroup points remain distinct. |
| The split component `A_P` | contains one; finite projection is one; unique positive split-Levi preimage. |
| The real identity component | one point for the trivial group; negative component of `G_m` excluded; all real `SL₂` points included. |
| Real subgroup points in the ambient real group | identity; exact quotient evaluation; distinct real subgroup points remain distinct. |
| The real groups `N`, `A`, `M`, `M^+`, `M^+ K` | one-point factors for the trivial group; for `G_m`, `N=1`, `M={±1}`, `M^+=1`, `A=G⁺` and `M^+ K=K`; at `P=𝐆=PGL₂`, `N=A=1`, `M=PGL₂(ℝ)`, `M^+=G` and `M^+ K=G`; for the upper Borel of `SL₂`, `M=M^+={±I}` while `M⁰=1`; nonempty simple roots force `N≠1`. |
| `Reduction.levelArithmetic` | the whole level gives all rational points; the trivial level gives only one; exact finite diagonal membership at `x = 1`. |

### Examples

`GL_3` has four standard parabolics, and the lower triangular Borel of `GL_2` is conjugate to the
standard one. `O(n) × ∏_p GL_n(ℤ_p)` is admissible for `GL_n/ℚ` while a product of Iwahori
subgroups is not. In `SL_2(ℝ)` the `A`-coordinate of `k = [[0, −1], [1, 0]]` changes from `1` to
`1/2` when `K` is conjugated by `n(1)`, and the Siegel sets of distinct `K` are not
interchangeable. `diag(4, 1)` is not `(std, 2)`-reduced while `diag(1, 4)` is, and
`T_{std,2}` is not closed under inversion. For `SL_2/ℚ` the Siegel set with `N`-window
`[−1, 1]` and `y > 1/2` contains `1` and `n(1)`, so it is not a fundamental domain, and
`levelArithmetic (diag(p, 1)) GL_2(ℤ̂) ≠ GL_2(ℤ)`. The `GL_1` height for the standard character, augmented by its dual, has
`‖x⁻¹‖ = ‖x‖` and is unbounded on `G(𝔸)` because of the archimedean factor. The
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
  places, define `Approximation.HasWeakApproximation G S : Prop := DenseRange (diagonal G(F) → G(F_S))`, weak approximation with respect to `S`, where `G(F_S) = ∏_{v∈S} G(F_v)` (the
  archimedean factors `G(F_w)` and the diagonal `diagonal on S`); `G` has weak
  approximation if this holds for every finite `S`. Prove that
  weak approximation for `S` implies it for every `S′ ⊆ S`,
  that weak approximation for `G` and `H` gives it for
  `G × H`, and that it is invariant under isomorphisms of
  `F`-groups ([HW], §1 (notation and conventions), p. 6). *Needs:* AA.1.2; Tau Ceti
  `TauCeti.GlobalNumberFields.weakApproximation_denseRange`.
  *Lean:* `Approximation.HasWeakApproximation` (the density predicate).

  **Checks.**
  - `G_a` has weak approximation for every finite `S` (`weakApproximation_denseRange`).
  - `μ_2` over `ℚ` fails weak approximation for `S = {∞, 2}`: the diagonal image
    `{(1,1), (−1,−1)}` is not dense in `{±1}²`.
  - For the empty set of places, the target product is a point and every affine group has weak approximation.

- **Weak approximation for `GL_n`, `SL_n` and split tori.** (*weak-approximation-gln*) Prove that
  `GL_n`, `SL_n`, `G_a` and split tori `G_m^r` over `F` have weak approximation (use field weak approximation on the open affine variety `GL_n`; use elementary matrices
  for `SL_n`, and products for split tori). The `SL₂` elementary-matrix calculation is
  [Rapinchuk], Lemma 1.2, p. 3; field weak approximation is supplied by the exact contract
  below. *Needs:* AA.4.1; Tau Ceti
  `TauCeti.GlobalNumberFields.weakApproximation_denseRange`; AA.1.4; GlobalNumberFields, layer 1.
  *Lean:* none; specified in the README only.

  **Checks.**
  - `GL₀` and a split torus of rank zero have singleton point groups.
  - `G_m` has weak approximation at `{∞,2}` even though strong approximation away from infinity fails.
  - For `SL₂`, elementary matrices allow simultaneous approximation while preserving determinant one.
- **Torsors under an affine group over a field.** For a field `k` and an affine algebraic group
  `G` over `k` (Hopf algebra `H`), define the structure of a `G`-torsor:
  a nonzero finitely generated commutative `k`-algebra `A` with a coaction `A → A ⊗ H` making
  `Spec A` a right `G`-space such that `A ⊗_k k̄ ≅ H ⊗_k k̄` as comodule algebras (the
  isomorphism is of comodule algebras; geometric points alone are insufficient for nonreduced
  group schemes); the structure holds the algebra, the coassociative counital coaction, and bijectivity of
  `A ⊗_k A → A ⊗_k H`, `a ⊗ b ↦ (a ⊗ 1)ρ(b)`. Nonzero algebras over a field are faithfully
  flat; this canonical-map condition is equivalent to the stated geometric trivialization. Call
  `X` trivial when `A →ₐ[k] k` is nonempty
  (that is, `X(k) ≠ ∅`), and define its base change along a field
  extension `k → k′`, with coordinate algebra `k′ ⊗_k A`;
  `X_{k′}` is trivial iff `X` has a `k′`-valued point
  `A →ₐ[k] k′`. The Hasse principle below is stated through base change, so these equations
  carry its content: a base change returning the trivial torsor would make every torsor
  locally trivial. Prove that `X` is trivial iff `X` is
  isomorphic to `G` acting on itself (SchemeAndStackFoundations `Torsor.trivial_iff_section`; the statement is
  elementary). *Needs:* Tau Ceti
  `TauCeti.HopfAlgebra.points`.
  *Lean:* none; specified in the README only.

  **Coordinate/geometric comparison.** AA owns the equivalence
  between coordinate torsors (with equivariant algebra isomorphisms reversed)
  and geometric torsors for `Spec H` on the fppf site of `Spec k`.
  The coaction presents a right action, while the owner's actions are on the left; the comparison
  uses the left action `g · x := x · g⁻¹`, whose coaction is the right coaction followed by the
  antipode `S` on the `H` factor and the tensor swap. Inversion `x ↦ x⁻¹` identifies `G` acting
  on itself by this rule with the owner's trivial torsor. The comparison of base change and of
  equivariant isomorphisms is stated in this convention.
  It compares tensor extension with the owner's
  `Torsor.baseChange`, identifies algebra maps
  `A →ₐ[k] k` with sections and hence with `Torsor.trivial_iff_section`,
  and compares equivariant isomorphisms.
  The induced class comparison identifies coordinate isomorphism classes with
  `torsorClasses G = NonabelianH1 (fppfTopology.over (Spec k)) h_G`, preserving
  the distinguished class and base change. Affine fppf descent supplies
  representability ([Stacks], Tag 0245 for effective affine descent; Tags 04TY
  and 04SK for the geometric torsor and algebraic-space formulation; SchemeAndStackFoundations
  §§1.15, 2.3). The class-comparison contract expresses this class-set
  comparison; the coaction of the base change
  fixes the comodule presentation, and the class of a base change
  fixes scalar extension on classes. Base change of sections and of isomorphisms,
  the triviality of isomorphic torsors, and the characterization of the distinguished class describe
  the coordinate compatibilities. The Hasse principle is stated
  for an abstract class set with the comparison and local-class compatibility
  as hypotheses; specializing to `torsorClasses` gives the canonical statement.

  **Checks.**
  - `G` acting on itself is trivial.
  - `G_m` acting on `A¹` by scaling is not a torsor: `A¹(k̄)` has two orbits.
  - The algebra `ℚ[x]/(x² − 2)` with coaction `x ↦ x ⊗ g` is a nontrivial `μ₂`-torsor: a rational point would give a rational square root of `2`.
  - Its base change along `ℚ → ℚ` is still nontrivial and its base change along `ℚ → ℝ` is trivial;
    a base change returning `G_{k′}` fails the first clause.
  - For the constant group `S₃` acting on itself on the right, the swapped rule `g · x := x · g`
    fails the left action law `(gh) · x = g · (h · x)` at two non-commuting transpositions, while
    `g · x := x · g⁻¹` satisfies it.
  - Under the class comparison, the square-root torsor has nontrivial class,
    its identity base change still has nontrivial class, and its real base
    change has the distinguished class.

- **Canonical `μ₂` class and scalar extension.** The target
  uses SchemeAndStackFoundations's group space `G = GroupSpace.ofGroupScheme (Spec ℚ[ℤ/2])` and
  `torsorClasses G = NonabelianH1 (fppfTopology.over (Spec ℚ)) h_G`. Its class is
  `torsorClasses.mk` of `Spec ℚ[t]/(t²−2)` with coaction `t ↦ t⊗g`; it is not the
  identity class. Pullback along the identity of `Spec ℚ` fixes this nontrivial
  class, while pullback along `Spec ℝ → Spec ℚ` gives the identity. Use geometric
  `Torsor.baseChange` and its section comparison, then `torsorClasses.mk_eq_base_iff`;
  coefficient `pushforward` is a different map.
  These are equalities in the canonical class set, independently of an arbitrary C.
  Source interfaces are SchemeAndStackFoundations §§1.15, 2.3 (its `Suggested.lean`).
  *Lean:* none; specified in the README only.

  **Checks.** This concrete
  affine torsor has no sections over `ℚ`, and none after identity
  scalar extension; it has sections after extension
  to `ℝ`. The canonical `torsorClasses.mk_eq_base_iff` turns these into exactly the three class
  assertions of the target; the class-comparison Checks above remain transport tests.

- **Local H¹ vanishing.** For connected semisimple simply connected `G` over a
  characteristic-zero nonarchimedean local field, prove
  `H¹(E,G)=1`. The source is [Platonov–Rapinchuk], Theorem 6.4, pp. 284–285, with proofs in
  §§6.7–6.8. Reduce by restriction of scalars and products to absolutely simple groups;
  construct twisting and central isogeny sequences, reduced norms and Hermitian-form
  invariants for classical types, and the exceptional-type arguments, including `E₈`.
  The quaternion norm-one case in [Khayutin], §2.3, is one specialization.
  *Needs:* AA.4.1 coordinate/geometric comparison; ReductiveGroups simple-factor structure;
  ClassFieldTheory local Brauer and norm theorems; GlobalQuadraticForms' form invariants.
  *Lean:* none; specified in the README only.
- **Hasse kernel and injectivity.** Prove, over number
  fields for semisimple simply connected `G`, that a torsor is trivial iff it is trivial at every
  real place. [Platonov–Rapinchuk], Theorem 6.6, p. 286 and §§6.7–6.8
  supplies the Hasse kernel; local vanishing removes finite places and algebraic
  closedness removes complex places. To compare *two* classes, twist by one torsor and
  apply the kernel theorem to the resulting simply connected inner form. The target
  records that injectivity direction: two torsors are isomorphic iff they are at every real
  place. Supply compatibility
  of twisting with base change and preservation of semisimple simply connected structure.
  The abstract class-set Hasse statement only transports basepoint detection through an assumed
  class comparison; it does not prove full bijectivity or construct the canonical carrier.
  *Lean:* none; specified in the README only.
- **Real-class realization.** Prove that every family of real
  torsors is realized by a global torsor. Use [Platonov–Rapinchuk], Proposition 6.17,
  pp. 337–339: represent real classes in maximal tori, approximate those tori globally, then
  use real-localization surjectivity for tori (§7.3, Corollary 2). Combined with twisting
  injectivity this gives bijectivity of real localization on SchemeAndStackFoundations's
  canonical fppf class set.
  The affine comparison uses SchemeAndStackFoundations's `torsorClasses.surjective_mk`,
  `torsorClasses.mk_eq_base_iff`, representability and natural base change.
  *Lean:* none; specified in the README only.
- **Weak approximation.** `Approximation.hasWeakApproximation_of_simplyConnected` holds
  for every finite set of places. [Platonov–Rapinchuk], Theorem 7.8, p. 415, proof in §7.3, uses
  reduction theory, local Kneser–Tits, the Hasse principle, and weak approximation for
  suitable tori. Build these inputs separately; strong approximation is not an input.
  A torsor trivial at real places has a global point by the kernel theorem; translation
  transfers weak approximation from `G`. This proves property `(⋆)` used by [HW],
  Theorem 6.1, p. 21. HW Lemma 6.3 only propagates that property through fibrations.
  The anisotropic-factor step of AA.4.2 consumes this weak-approximation theorem.
  *Lean:* `Approximation.hasWeakApproximation_of_simplyConnected` (semisimple simply connected groups).

  **Checks.** Over a totally imaginary number
  field every torsor is trivial; two torsors with the same real classes are isomorphic
  (the twisting/injectivity direction); every family of real classes is realized (the independent
  realization direction). The
  `μ₂` Checks above test comparison and scalar extension only: `μ₂` is not semisimple simply
  connected and cannot satisfy the Hasse-kernel conclusion.

### 4.2 Strong approximation and arithmetic closures

- **Quaternion norm-one strong approximation at a split place.**
  (*quaternion-norm-one-strong-approximation*)
  Let `D` be a quaternion algebra over a number field `F` and `v` a specified finite
  place where `D` splits. For the algebraic group `D¹ = ker Nrd`, prove strong
  approximation away from `S = ∞ ∪ {v}`. In particular, for any compact open
  `U^{v,1} ≤ D¹(𝔸_{F,f}^v)`, prove
  `D¹(𝔸_{F,f}) = D¹(F) · D¹(F_v) · U^{v,1}`, using identity extensions of the last
  two factors. The splitting identifies `D¹(F_v)` with the noncompact `SL₂(F_v)`;
  geometrically `D¹` is simply connected and absolutely almost simple. This is the
  quaternion specialization of the strong approximation theorem below
  ([Rapinchuk], Theorem 2.3, p. 12). The norm is the base-change-natural unit norm `Nrd_A` of
  the supplier table, built on the pinned `QuaternionAlgebra.normForm`; total definiteness is not
  required.
  *Needs:* AA.4.2 strong approximation criterion; AA.1.2; Tau Ceti `QuaternionAlgebra.normForm`
  and `TauCeti.QuaternionAlgebra.baseChange`;
  ReductiveGroups, layer 6, simply connected forms of `SL₂`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `D = M₂(F)`, this is strong approximation for `SL₂` away from `∞ ∪ {v}`.
  - A totally definite quaternion algebra still satisfies this assertion at a split finite
    `v`, although its norm-one group is compact at every infinite place.
  - For such a definite algebra, replacing `S` by just `∞` fails the noncompactness
    criterion; removing the split finite place is not an allowed simplification.

- **Strong approximation.** For an affine algebraic group `G` over `F` and a finite set `S` of
  places containing every archimedean place, write `S = ∞ ∪ S_f` and define `Approximation.HasStrongApproximation F H S_f : Prop := DenseRange (diagonal G(F) → G(𝔸^S))`, strong approximation with respect to `S`: `G(F)` is dense in `G(𝔸_F^S)`, the adelic
  points away from `S` (equivalently `G(F)G(F_S)` is dense in `G(𝔸_F)`, with `G(F_S)` the
  subgroup of adelic points trivial at the finite places outside
  `S_f`). Prove that
  for every open subgroup `U ⊂ G(𝔸^S)`,
  `G(𝔸^S) = G(F)U`, that strong approximation for `S`
  implies it for `S′ ⊇ S`, and that if it holds
  for `S` the archimedean places then `G(F)\G(𝔸_f)/U` is a point for every compact open `U`
  ([Rapinchuk], §2.1, Definition, p. 7; restated in Theorem 2.3, p. 12; [Borel], §2.6, p. 13).
  *Needs:* AA.1.2; AA.0.3.
  *Lean:* `Approximation.HasStrongApproximation` (the density predicate).

  **Checks.**
  - `G_a` over `F` has strong approximation for `S` the archimedean places (GlobalNumberFields
    layer 6).
  - `G_m` over `ℚ` fails for `S = {∞}`: `ℚ^× ∩ ℤ̂^× = {±1}`, so `ℚ^×` is discrete in `𝔸_f^×`
    (AA.1.3).
  - For `SL₂/ℚ` and `S = {∞}`, strong approximation holds; this applies to `SL_n`
    over every number field.
  - The identity lies in `G(F_S)` for every finite `S_f`.
  - For `G_m` over `ℚ` and `v` the place of a prime `p`, `finiteEmbed` of the finite idele with
    component `p` at `v` and `1` elsewhere lies in the supported factor for `S_f = {v}` and not for `S_f = ∅`.
  - Every point whose finite component is `1` lies in `G(F_∞)`.

- **Strong approximation for unipotent groups.** Every unipotent group `N` over the
  number field `F` has dense rational points in `N(𝔸_F^S)` for every nonempty set `S`
  of places, with no requirement that `S` be finite or contain infinity
  ([Platonov–Rapinchuk–Rapinchuk], Lemma 5.7, pp. 301–302; Theorem 1.13, p. 15).
  The statement is density
  of `N(F)N(F_S)` on the full adelic carrier, with separate arbitrary sets of infinite and finite
  places; its `S = ∞ ∪ S_f` specialization is
  `Approximation.HasStrongApproximation`.
  **Check.** `G_a/ℚ` is dense away from `{2}` although infinity is retained; it is not
  dense in all adeles when `S` is empty, since the rational diagonal is discrete;
  the complementary space is a point when `S` is every place.
  *Needs:* AA.4.2; AA.0.3; GlobalNumberFields, layer 6; AA.3.4.
  *Lean:* none; specified in the README only.
- **Tori never have strong approximation for finite S containing infinity.** For a nontrivial torus `T` over `F`
  and a finite set `S` of places containing all archimedean places, prove that `T(F)` is not dense in `T(𝔸^S)`, and that the
  quotient of `T(𝔸^S)` by the closure of `T(F)` has infinite exponent. Weak approximation for
  tori is asserted only for split tori (*weak-approximation-gln*) ([Rapinchuk], Proposition 2.1,
  p. 9). *Needs:* AA.4.2; AA.1.3; AA.1.4; Chebotarev, layer 10.
  *Lean:* none; specified in the README only.
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
  *Lean:* none; specified in the README only.

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
  *Lean:* none; specified in the README only.
- **Borel density for S-arithmetic groups.** For `G` connected absolutely almost simple over
  any number field `F`, `M : IntegralModel F H S₀`, and finite `S ⊇ S₀ ∪ ∞`
  with `G_S` noncompact, prove that `Γ(M,S)` is infinite and Zariski dense in `G`.
  The same conclusion holds for every subgroup commensurable with `Γ(M,S)`
  ([Rapinchuk], Theorem 2.3, remark after it, p. 12). *Needs:* AA.1.1; AA.3.4.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The standard model of `SL₂/ℚ` with `S = {∞}` gives the Zariski-dense `SL₂(ℤ)`.
  - The norm-one group of a definite quaternion algebra over `ℚ` has finite integral
    group at `S = {∞}`; the noncompactness hypothesis fails.
  - For that norm-one group, adding a split finite place makes `G_S` noncompact and
    the model's `S`-integral group infinite and Zariski dense.
- **Open subgroups of finite covolume have finite index.** If `Δ` is an open subgroup of a
  locally compact group `H` such that `H/Δ` carries a nonzero finite `H`-invariant Radon measure,
  prove that `Δ` has finite index in `H` ([Rapinchuk], §2.6, p. 16). *Needs:* AA.2.2.
  *Lean:* none; specified in the README only.
- **Strong approximation through finitely many places.** For an affine algebraic group
  `G` over any number field `F`, `M : IntegralModel F H S₀`, and finite
  `S ⊇ S₀ ∪ ∞`, prove that `G` has strong approximation with respect to `S` iff for every
  finite set `S₁` disjoint from `S`, the image of `Γ(M,S ∪ S₁)` is dense in
  `G_{S₁} = ∏_{v∈S₁} G(F_v)` ([Rapinchuk], §2.6, p. 16).
  *Needs:* AA.1.1 (away-`S` characterization); AA.4.2; AA.1.5.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For the standard `SL₂/ℚ` model, `SL₂(ℤ[1/p])` is dense in `SL₂(ℚ_p)`.
  - For `G_a/ℚ`, the model `X ↦ pT` gives `Γ(M,{∞,p}) = ℤ[1/p]` and the same
    density in `ℚ_p` as the standard model.
  - For the standard `G_m/ℚ` model, `Γ(M,{∞,p}) = {±p^n : n ∈ ℤ}` is not dense in
    `ℚ_p^×`, detecting failure of strong approximation.
- **S-arithmetic groups are not discrete at an extra place.** For any number field `F`,
  connected absolutely almost simple `G/F`, `M : IntegralModel F H S₀`, finite
  `S ⊇ S₀ ∪ ∞` with `G_S` noncompact, and finite nonempty `S₁` disjoint from `S`,
  prove that the image of `Γ(M,S ∪ S₁)` in `G_{S₁}` is not discrete and is infinite
  ([Rapinchuk], §2.6, p. 16). *Needs:* AA.1.1; AA.3.4 (the `S`-arithmetic lattice theorem).
  *Lean:* none; specified in the README only.

  **Checks.**
  - For the standard `SL₂/ℚ` model and `S₁ = {p}`, the upper unipotents with entries
    `p^n` are distinct elements tending to the identity in `SL₂(ℚ_p)`.
  - At two extra primes the image is nondiscrete in the product; integrality away from
    their union still uses the same model.
  - For the definite quaternion norm-one group with `S = {∞}`, `G_S` is compact
    and the group at an extra split prime is discrete; the noncompactness assumption matters.
- **Finite covolume of a projection closure.** (*projection-finite-covolume*) Let `A` and `B`
  be second countable locally compact Hausdorff groups, `Γ ⊂ A × B` a lattice (a discrete
  subgroup with a nonzero finite `(A × B)`-invariant Radon measure on `Γ \ (A × B)`), and `Δ` the
  closure of its `B`-projection; `B` acts on `Γ \ (A × B)` and on `Δ\B` by right translation in the
  second factor. Prove that `Δ\B` carries a nonzero finite `B`-invariant Radon measure
  (push forward the finite quotient measure; [Platonov–Rapinchuk–Rapinchuk],
  Lemma 3.66, pp. 191–192, uses this construction with extra assumptions
  for its nondiscreteness conclusion). *Needs:* AA.2.2.
  *Lean:* none; specified in the README only.
- **Lie algebra of an arithmetic closure over `ℚ`.** For `G` connected absolutely almost
  simple over `ℚ`, `M : IntegralModel ℚ H S₀`, finite `S ⊇ S₀ ∪ {∞}` with
  `G(ℚ_S)` noncompact, and a finite nonempty set `S₁` of rational primes disjoint from `S`,
  the closure of `Γ(M,S ∪ S₁)` in `∏_{p∈S₁} G(ℚ_p)` has full `ℚ_p` Lie algebra in each factor.
  Borel density makes each projected Lie algebra an ideal, and nondiscreteness makes it
  nonzero. Distinct primes are separated by the pro-`p` subgroups of compact opens
  ([Platonov], Proposition 3.2, pp. 1144–1145; [Rapinchuk], Lemma 2.7, p. 16 and §3,
  pp. 17–18). *Needs:* AA.3.4; AA.4.2, closed subgroups of p-adic Lie groups.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The standard `SL₂` model has closure Lie algebra `sl₂(ℚ_p)` at one extra prime.
  - At two distinct primes the Lie algebras form the full product; compact pro-`p`
    and pro-`q` subgroups separate the factors.
  - Replacing the standard model by its conjugate under `diag(p,1)` changes the integral
    subgroup but not the full closure Lie algebra.

- **Number-field arithmetic closure.** (*number-field-arithmetic-closure*)
  For any number field `F`, connected absolutely almost simple `G/F`,
  `M : IntegralModel F H S₀`, finite `S ⊇ S₀ ∪ ∞` with `G_S` noncompact,
  and finite `S₁` disjoint from `S`, let `Δ` be the closure of `Γ(M,S ∪ S₁)`
  in `∏_{v∈S₁} G(F_v)`.
  Prove that for every rational prime
  `p`, the Lie algebra of the projection closure in
  `∏_{v∈S₁,v|p} Res_{F_v/ℚ_p} G(F_v)` is the entire product as a `ℚ_p` Lie
  algebra. First establish that
  `Γ(M,S ∪ S₁)` is `ℚ`-Zariski dense in `Res_{F/ℚ} G`, including when `S`
  contains only some places over a rational prime. Prove that `Δ` is open and of finite index.
  Establish density by a commensurator argument, extending the proof of [Platonov–Rapinchuk],
  §4.4, pp. 205–206. Put `R=Res_{F/ℚ}G`, which is `ℚ`-simple, and let `Γ` be the
  actual partial-place group `Γ(M,S ∪ S₁)`. Reduction theory and `G_S` noncompact
  make `Γ` infinite. The commensuration target says that every element
  of `G(F)=R(ℚ)` commensurates `Γ`: outside the chosen places, conjugation changes
  only finitely many integral compact opens, whose intersections have finite index.
  Thus the identity component `J` of the `ℚ`-Zariski closure of `Γ` is positive
  dimensional and normalized by `R(ℚ)`. Rational-point Zariski density in connected
  groups ([Platonov–Rapinchuk], Theorem 2.2) makes `J` normal in `R`; `ℚ`-simplicity gives `J=R`.
  This proves the Zariski density without enlarging `S` or asserting
  finite index in a rational-prime-saturated group.
  After base change to `ℚ_p`, the algebraic stabilizer of the closure Lie algebra
  contains `Γ`, so it contains the whole restricted group, including every factor
  over `p`. Project to the factors in `S₁`; the Lie algebra is an ideal in that entire
  product. Each restricted simple
  factor is `ℚ_p`-simple (after algebraic closure its simple factors are
  transitively permuted by the local Galois group); nondiscreteness at each
  place makes every projected ideal nonzero. Ideals in a direct sum of simple
  Lie algebras are sums of factors, excluding diagonal graphs even when two
  places lie over the same `p`. Separate distinct primes using compact
  pro-`p` subgroups, then use the finite-covolume theorem.
  This extends the ideal argument of [Rapinchuk], Lemma 2.7, p. 16 and §3,
  pp. 17–18, with the scalar-restriction decomposition of AA.1.4; it does not
  infer openness from factorwise surjectivity alone.
  *Needs:* AA.1.1; AA.3.4,
  infinitude from reduction theory,
  rational-point Zariski density and `ℚ`-simplicity of the restriction; local restriction of
  scalars, closed-subgroup Lie theory, extra-place nondiscreteness,
  *projection-finite-covolume*.
  *Lean:* none; specified in the README only.

  **Checks.** Two distinct places of `F` over the same `p` can both be present
  in `S₁`; the diagonal Lie subalgebra in two copies
  of `sl₂(ℚ_p)` surjects to each factor but is not an ideal.
  One of two places over `p` may lie in `S` and the other
  in `S₁`. For `F=ℚ(√2)`, write `π=3+√2`, `π′=3−√2`: `ππ′=7`.
  A Check gives pairwise distinct additive cosets of
  `π′^(−n)` modulo `𝒪_F[1/π]`. The corresponding upper-unipotent matrices give
  infinitely many cosets of `SL₂(𝒪_F[1/π])` in `SL₂(𝒪_F[1/7])`.
  This rules out transferring density by finite index from the saturated group.


- **Openness in a finite product of rational completions.** For connected absolutely almost
  simple `G/ℚ`, `M : IntegralModel ℚ H S₀`, finite `S ⊇ S₀ ∪ {∞}` with
  `G(ℚ_S)` noncompact, and finite nonempty `S₁` disjoint from `S`, prove that the closure
  of `Γ(M,S ∪ S₁)` is open in `∏_{p∈S₁} G(ℚ_p)` and has finite index, by its finite
  covolume ([Platonov], Propositions 3.2–3.3, pp. 1144–1145).
  *Needs:* AA.1.1; AA.4.2; *projection-finite-covolume*.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For the standard `SL₂/ℚ` model the closure is the whole product.
  - Changing the model at fixed `S ∪ S₁` preserves openness and finite index by
    commensurability; it need not preserve an arbitrary subgroup's exact closure.
  - For a definite quaternion norm-one group with `S = {∞}`, the closure at a split
    extra prime is discrete, so the assertion without noncompactness would fail.
- **Anisotropic factors from weak approximation.** For `G/F` connected absolutely almost
  simple and simply connected over any number field, `S` finite containing infinity
  with `G(F_S)` noncompact, let `T` be the finite set of anisotropic finite places outside `S`. Once the closure of
  `G(F)G(F_S)` contains each isotropic local factor, closedness and density of the
  finite-support subgroup show that it contains the whole adelic factor away from `T`.
  Weak approximation makes its projection to `∏_{v∈T} G(F_v)` dense. Apply
  the following topological lemma: for groups `A, B` with
  topologies and a closed subgroup `C ≤ A × B`, if `A × {1} ⊆ C` and the projection of
  `C` to `B` is dense, then `C = A × B`. Thus the adelic closure is the whole group
  ([Platonov addendum], §§1–2, pp. 784–785, with the preceding number-field
  closure argument). *Needs:* AA.4.1 `hasWeakApproximation_of_simplyConnected`; AA.4.2;
  ReductiveGroupsPartII, RG2.4 (kneser-tits-local).
  *Lean:* none; specified in the README only.
- **Arithmetic closure at one isotropic place.** Let `F` be any number field, `G` connected,
  absolutely almost simple and simply connected over `F`, `S` finite, containing the archimedean
  places, with `G_S` noncompact, `v ∉ S` a finite place at which `G` is `F_v`-isotropic, and
  `W ⊂ G(𝔸_F^{S∪{v}})` a compact open subgroup. Prove that the image of
  `Γ_W = G(F) ∩ (G_S × G(F_v) × W)` is dense in `G(F_v)`; consequently the closure of `G(F)G_S` in
  `G(𝔸_F)` contains `G(F_v)`, placed at `v` ([Platonov], §3.4, p. 1145; [Rapinchuk], §2.6, pp. 16–17; [Rapinchuk], Remark 1
  after Theorem 2.3, p. 12). *Needs:* AA.3.4; AA.4.2; ReductiveGroupsPartII, RG2.4
  (kneser-tits-local); the openness of the arithmetic closure over `F` (*number-field-arithmetic-closure*). For each compact-open
  condition `W` and any `M : IntegralModel F H S₀` with `S₀ ⊆ S`,
  `Γ_W` is commensurable with `Γ(M,S ∪ {v})` by AA.3.4's compact-open comparison.
  Apply the whole-product Lie-ideal argument before local Kneser–Tits; separate
  rational primes with pro-p subgroups. No saturation of `S` is used.
  *Lean:* none; specified in the README only.
  **Checks.**
  - For `SL₂/ℚ`, `S = {∞}` and the standard integral level away from `p`,
    `Γ_W = SL₂(ℤ[1/p])` is dense in `SL₂(ℚ_p)`.
  - Replacing `W` by an open subgroup of finite index preserves this density;
    the isotropic simply connected local group has no proper subgroup of finite index.
  - For a definite quaternion norm-one group, `S = {∞}` has compact `G_S` and
    its group integral away from a split `p` is discrete at `p`; adding a different
    split place to `S` satisfies the noncompactness hypothesis and gives density at `p`.

- **Almost all local factors are isotropic.** (*isotropic-almost-everywhere*) For `F` a number
  field and `G` a connected semisimple group over `F` with `dim G > 0`, prove that `G` is
  quasi-split, hence isotropic, over `F_v` for all but finitely many places `v`; in particular,
  for finite `S` the set of places `v ∉ S` at which `G` is `F_v`-anisotropic is finite ([Arthur],
  §16, p. 89). *Needs:* AA.1.1 (reductive models outside finitely many places);
  ReductiveGroupsPartII, RG2.3, reductive-model (over the complete discrete valuation ring
  `𝒪_v` with finite residue field, a reductive model gives an unramified, hence quasi-split group);
  ReductiveGroups, layer 7.
  *Lean:* none; specified in the README only.
- **Strong approximation: sufficiency.** (*strong-approximation-sufficiency*) Let `G` be
  connected, absolutely almost simple and simply connected over a number field `F`, and `S` a
  finite set of places containing the archimedean ones with `G_S = ∏_{v∈S} G(F_v)` noncompact.
  Prove that `G` has strong approximation with respect to `S` ([Rapinchuk], Theorem 2.3, p. 12;
  [Rapinchuk], Remark 1 after Theorem 2.3, p. 12). *Needs:* AA.4.2; AA.4.1.
  *Lean:* none; specified in the README only.
- **Strong approximation: necessity.** For `G` connected absolutely almost simple over `F` and
  `S` finite containing all archimedean places, in the setting of *strong-approximation-sufficiency* without its hypotheses, prove
  that if `G` has strong approximation with respect to `S` then `G_S` is noncompact and `G` is
  simply connected ([Rapinchuk], §2.3, p. 11). *Needs:* AA.4.2; AA.1.3; Chebotarev, layer 10; Tau
  Ceti `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`.
  *Lean:* none; specified in the README only.
- **Strong approximation for semisimple groups.** Let `G` be connected semisimple simply
  connected over `F` and `S ⊇` archimedean places finite such that `G′(F_S)` is noncompact for
  every `F`-simple factor `G′` of `G`. Prove that `G(𝔸_F) = G(F)·G(F_S)·U` for every compact open
  `U ⊂ G(𝔸_F^S)`; in particular `G(F)\G(𝔸_f)/U` is a single point when `S` is the set of
  archimedean places ([Arthur], Theorem 2.1(a), p. 12). *Needs:* AA.4.2; AA.1.4; ReductiveGroups,
  layer 6.
  The factorwise noncompactness condition is equivalently noncompactness of `Q(F_S)` for every
  nontrivial connected semisimple quotient `Q` of `G`. In coordinates these quotients are
  injective Hopf maps `O(Q) → O(G)`; nontriviality is failure of surjectivity of the scalar map
  `F → O(Q)`. A nontrivial semisimple quotient has a simple factor, while each simple factor
  of `G` occurs as a quotient up to a central isogeny. Central isogenies preserve compactness
  of local point groups, so the two conditions agree.
  *Lean:* `Approximation.hasStrongApproximation_of_simplyConnected` (all number fields and finite `S = ∞ ∪ S_f`).

  **Checks.**
  - `SL_n` for `n ≥ 2` has noncompact archimedean points and satisfies strong approximation
    away from infinity; ranks zero and one give the trivial group, with no nontrivial quotient.
  - For a definite quaternion algebra over `ℚ`, its norm-one group is compact at infinity;
    omitting this noncompactness hypothesis would falsely give strong approximation there.
  - For a product of `SL₂` and that definite norm-one group, the full real point group is
    noncompact but the second quotient is compact. Noncompactness of the whole group alone
    does not imply strong approximation.

### 4.3 Neat elements and levels

- **Eigenvalues of algebraic tensor subquotients.** For `k` a field of characteristic `0` with
  algebraic closure `k̄`, `G` an affine group scheme of finite type over `k`, `ρ : G → GL(V)` a
  closed immersion (a closed faithful algebraic representation), `σ : G → GL(W)` an algebraic
  representation and `g ∈ G(k)`, prove that every eigenvalue of `σ(g)` over `k̄` lies in the
  multiplicative subgroup generated by the eigenvalues of `ρ(g)` ([Milne], §3, p. 34). *Needs:*
  ReductiveGroups, layer 1.
  *Lean:* none; specified in the README only.
- **Neat elements.** For a number field `F` with a fixed embedding `τ : F → ℂ` and a linear
  algebraic group `G`, define `Neat.IsNeatAut α : Prop` for `α ∈ GL(V)`, `V` over a subfield of
  `ℂ`: `α` is neat if its eigenvalues in `ℂ` generate a torsion-free subgroup of `ℂ^×`; and
  neatness of `g ∈ G(F)`: `g` is neat if `ρ(g)` is neat for one faithful
  `F`-representation `ρ`, via a chosen faithful representation; a neat subgroup is a
  subgroup all of whose elements are neat. The notion does not depend on `τ`, since an
  automorphism of `ℂ` carries one eigenvalue group isomorphically onto the other. It is weaker
  than neatness of `g` as an element of `(Res_{F/ℚ}G)(ℚ)`, whose eigenvalues include all Galois
  conjugates: `√2 ∈ G_m(ℚ(√2))` is neat, but `±√2` generate a group containing `−1`. The group
  representation is algebraic and faithful, rather than merely injective as a map on
  `F`-rational points; in Hopf coordinates it is induced by a surjective `GL_n`-coordinate
  morphism `O(GL_n) → O(G)`. Define `Neat.algebraicPointMap` (for a `GL_n` coordinate bialgebra
  morphism `r : O(GL_n) → O(G)` and an embedding `F → ℂ`, evaluate `r` on `F`-points through Tau
  Ceti `GeneralLinear.pointsMulEquiv` and extend matrix entries to `ℂ`), the predicate that
  the point homomorphism is induced by such an algebraic coordinate morphism, using the
  specified coefficient embedding, and `Neat.IsFaithfulAlgebraicPointHom` (the point
  homomorphism is induced by a surjective coordinate morphism, hence a closed algebraic
  immersion; this is stronger than injectivity on rational points). Prove that if
  `g` is neat then so is `g^n`, and that a neat element of finite order
  is `1` ([Milne], §3, p. 34). *Needs:* AA.1.3.
  *Lean:* `Neat.IsNeatAut`, `Neat.algebraicPointMap`, `Neat.IsFaithfulAlgebraicPointHom`
  (definitions used by the existence and covering theorems).

  **Checks.**
  - `diag(2, 1/2) ∈ SL_2(ℚ)` is neat.
  - The order-`3` element `(0 −1; 1 −1)` of `SL_2(ℤ)` is not neat.
  - Nor is a torsion-free element whose eigenvalue group contains `ζ_3`, such as
    `(0 −1; 1 1)·(scalar 2)` in `GL_2(ℚ)`: its determinant is `4`, so it has infinite
    order, while the ratio of its eigenvalues is a nontrivial cube root of unity.
  - For `r` the identity of `O(GL_n)`, `Neat.algebraicPointMap τ n r` is
    `Matrix.GeneralLinearGroup.map τ` composed with `TauCeti.GeneralLinear.pointsMulEquiv`,
    and satisfies `Neat.IsFaithfulAlgebraicPointHom` since its coordinate map is surjective.
  - The trivial group has a faithful dimension-zero representation: the surjective counit
    `O(GL₀) → F` induces a point map satisfying `Neat.IsFaithfulAlgebraicPointHom`.
  - Over `ℚ`, the coordinate map `X ↦ T³` of the cube map `G_m → GL₁` has point map `x ↦ x³`,
    injective on `ℚ^×`, but that point map is not `Neat.IsFaithfulAlgebraicPointHom`: a surjective
    bialgebra map `O(GL₁) → ℚ[T,T⁻¹]` sends `X` to `T` or `T⁻¹`, with point map `x ↦ x^{±1}`.
  - The trivial point action of `G_m` is not `Neat.IsFaithfulAlgebraicPointHom`, since a
    surjective coordinate map makes the point map injective on `F^×`.
- **Neatness does not depend on the representation.** For a finite-type linear algebraic group
  `G` over the number field `F`, `ρ` a faithful algebraic representation (a closed immersion),
  `σ` an algebraic representation defined over a subfield of `ℂ`, and the compared complex point
  actions using the same embedding `F → ℂ`, prove that if `ρ(g)` is neat then `σ(g)` is neat.
  Arbitrary homomorphisms of the abstract rational-point group are excluded ([Milne], §3,
  p. 34). *Needs:* AA.4.3.
  *Lean:* none; specified in the README only.
- **Neatness is stable under subgroups, conjugation and homomorphisms.** For `G, G′` linear
  algebraic over `F`, prove that subgroups of neat subgroups are neat, that conjugates of neat
  subgroups by elements of `G(F)` are neat, and that for a homomorphism `φ : G → G′` of linear
  algebraic groups the image `φ(Γ)` of a neat subgroup `Γ` is neat ([Milne], §3, p. 34). *Needs:*
  AA.4.3.
  *Lean:* none; specified in the README only.
- **Neat groups are torsion free.** For `G` linear algebraic, prove that a neat subgroup of
  `G(F)` is torsion free ([Milne], §3, p. 34). *Needs:* AA.4.3.
  *Lean:* none; specified in the README only.
- **Neat compact open levels.** For `G` linear algebraic over `F`, define
  `Neat.IsNeatLevel`: a compact open
  subgroup `U ⊂ G(𝔸_{F,f})` is neat if `G(F) ∩ x U x⁻¹ = levelArithmetic x U` is neat for every
  `x ∈ G(𝔸_{F,f})`, for the chosen faithful representation
  (convention: all rational intersections, not every element of `U`). Prove
  that a compact open subgroup of a neat level is neat,
  that conjugates of neat levels are neat, and
  that all `levelArithmetic x U` are torsion free ([Milne], §5, p. 58). *Needs:* AA.4.3; AA.3.4.
  *Lean:* `Neat.IsNeatLevel` (the predicate used by the existence and covering theorems).

  **Checks.**
  - The level `K(3) ⊂ GL_2(ℤ̂)` is neat: every `GL_2(ℚ) ∩ xK(3)x⁻¹` (`x ∈ GL_2(𝔸_f)`) is neat by
    *neat-criterion-one-prime* at `p = 3`.
  - For `x = 1` this group is `Γ(3) = SL_2(ℤ) ∩ K(3)`, since a determinant in `{±1}` congruent to
    `1` mod `3` equals `1`.
  - `GL_2(ℤ̂)` is not neat: it contains `−1 ∈ GL_2(ℤ)`.
- **Stable lattices for compact p-adic matrix groups.** For a prime `p`, `n ≥ 1` and a compact
  subgroup `C ⊂ GL_n(ℚ_p)`, prove that `C` preserves a full `ℤ_p`-lattice `Λ ⊂ ℚ_p^n`, hence is
  conjugate into `GL_n(ℤ_p)`. This is an owned deduction from compactness and the DVR lattice
  theory of LocalFieldsRamification, layer 0 (the auxiliary input to the congruence argument
  of [Milne], Proposition 3.5, p. 34): the union of the orbits of standard basis vectors is
  bounded, so its `ℤ_p`-span lies between `ℤ_p^n` and `p^{−r}ℤ_p^n` for some `r`.
  Noetherianity makes the span finitely generated, and torsion-free modules over the DVR
  are free. The group permutes these orbits, hence preserves the span.
  *Needs:* AA.1.5; LocalFieldsRamification, layer 0.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The trivial subgroup preserves the standard lattice.
  - `GL_n(ℤ_p)` preserves `ℤ_p^n`.
  - The order-two matrix `[[0,p],[p⁻¹,0]]` preserves `pℤ_p × ℤ_p`, but not `ℤ_p²`.
- **Distance of p-adic roots of unity from one.** For a prime `p`, `ℚ̄_p` an algebraic closure
  of `ℚ_p` with the unique extension of `|·|_p`, and `ζ ∈ ℚ̄_p` a root of unity with `ζ ≠ 1`,
  prove `|ζ − 1|_p ≥ p^{−1/(p−1)}`; more precisely a primitive `p^k`-th root (`k ≥ 1`) has
  distance `p^{−1/(p^{k−1}(p−1))}`, while a nontrivial root of order prime to `p` has distance
  one. This is an owned cyclotomic deduction in the congruence argument of [Milne],
  Proposition 3.5, p. 34: reduction preserves the order of prime-to-`p` roots, while
  `Φ_{p^k}(1) = p` is the product of the `φ(p^k)` conjugate differences with equal
  extended valuation. For mixed order, the nontrivial prime-to-`p` part gives distance one.
  *Needs:* LocalFieldsRamification, layer 0 (valuation extension) and layer 1 (residue units).
  *Lean:* none; specified in the README only.

  **Checks.**
  - At `p = 2`, `|−1 − 1|₂ = 1/2`, attaining the lower bound.
  - A primitive cube root at `p = 3` has distance `3^{−1/2}`.
  - A primitive cube root at `p = 2` has distance one.
- **Eigenvalue bound for congruence matrices.** For a prime `p`, `a ≥ 1` and
  `M ∈ 1 + p^a M_n(ℤ_p)`, with eigenvalues taken in `ℚ̄_p` with the extended absolute value, prove
  that every eigenvalue `λ` of `M` satisfies `|λ − 1|_p ≤ p^{−a}`; the eigenvalues and their
  inverses then lie in the multiplicative open ball used by *padic-ball-torsion-free* when
  `p ≥ 3, a ≥ 1` or `p = 2, a ≥ 2`. This is an owned deduction in the congruence argument
  of [Milne], Proposition 3.5, p. 34: write `M = I + p^a A`; the eigenvalues of the integral
  matrix `A` satisfy a monic integral characteristic polynomial and have absolute value at
  most one. If a root had absolute value greater than one, its leading power would
  strictly dominate all other terms, contradicting their sum being zero.
  *Needs:* AA.4.3; LocalFieldsRamification, layer 0.
  *Lean:* none; specified in the README only.

  **Checks.**
  - `M = I` has `λ − 1 = 0`.
  - The scalar matrix `(1+p^a)I` attains the bound `p^{−a}` in positive dimension.
  - `[[1,p^a],[0,1]]` has only eigenvalue `1`, although the matrix is not the identity.
- **Principal units of small radius are torsion free.** (*padic-ball-torsion-free*) For a prime
  `p`, prove that in an algebraic closure of `ℚ_p` the multiplicative group
  `{λ : |λ − 1|_p < p^{−1/(p−1)}}` contains no root of unity other than `1`; in particular
  eigenvalues of elements of `1 + pM_n(ℤ_p)` (`p ≥ 3`) or `1 + 4M_n(ℤ_2)` generate a torsion-free
  group. This is an owned deduction from *Distance of p-adic roots of unity from one* and
  *Eigenvalue bound for congruence matrices*, the auxiliary argument for [Milne],
  Proposition 3.5, p. 34: the ultrametric inequality makes this strict ball closed under
  multiplication, and `|λ|_p = 1` gives closure under inversion. The distance bound excludes
  every nonidentity torsion element.
  *Needs:* AA.4.3.
  *Lean:* none; specified in the README only.

  **Checks.**
  - At `p = 3`, `4` lies in the strict ball and has infinite multiplicative order.
  - At `p = 2`, `5` lies in the strict ball and has infinite multiplicative order.
  - At `p = 2`, `−1` lies on the boundary and has order two; a closed ball would fail.
- **A one-prime criterion for neatness.** (*neat-criterion-one-prime*) Let `ρ : G ↪ GL_n` be a
  faithful algebraic representation over the number field `F` and `U ⊂ G(𝔸_{F,f})` compact.
  Prove that if, at one place `v` above a prime `p`, every element of `U` acts through `ρ` in
  `1 + p^e M_n(𝒪_v)` with `e ≥ 1` for `p ≥ 3` and `e ≥ 2` for `p = 2`, then every rational
  intersection `G(F) ∩ xUx⁻¹` is neat. This is an owned deduction from the preceding
  eigenvalue bound and strict torsion-free ball, giving the number-field level form of the
  congruence argument of [Milne], Proposition 3.5, p. 34. For a rational point in this
  intersection, local conjugacy preserves eigenvalues; the strict ball contains the group
  they generate. Embed their algebraic splitting field at `v` to transport any complex
  multiplicative torsion relation to this ball.
  The same monic-polynomial argument works over `𝒪_v`. The congruence is modulo the rational
  prime power, so `|λ − 1|_p ≤ p^{−e} < p^{−1/(p−1)}` whatever the ramification of `v`.
  *Needs:* AA.4.3; AA.1.5; LocalFieldsRamification, layer 0.
  *Lean:* none; specified in the README only.

  **Checks.**
  - Modulo `2` alone the criterion fails: `−1 = 1 + 2·(−1)` lies in `K(2)` and is a nontrivial
    torsion element, whereas `−1 ∉ 1 + 4ℤ`.
  - `K(3) ⊂ GL₂(ℤ̂)` satisfies the criterion at `3`; all its rational conjugate intersections
    are neat.
  - Even over a ramified completion above `2`, congruence modulo `4` gives distance at most
    `1/4 < 1/2`; congruence modulo a uniformizer alone need not give this bound.
- **Neat levels exist.** For `G` linear algebraic over `F`, prove that every compact open
  `U ⊂ G(𝔸_{F,f})` contains a neat normal open subgroup of finite index, and that every
  arithmetic subgroup of `G(F)` contains a neat subgroup of finite index defined by congruence
  conditions (Borel) ([Milne], Proposition 3.5, p. 34). *Needs:* AA.4.3; AA.1.5.
  *Lean:* `Neat.exists_isNeatLevel_le`.

### 4.4 Double cosets and level topology

- **S-arithmetic decomposition at a finite place.** (*s-arithmetic-double-cosets*)
  Let `G` be an affine finite-type group over a number field `F`, `v` a specified finite
  place, and `U = U_v × U^v` under
  `G(𝔸_{F,f}) ≃ G(F_v) × G(𝔸_{F,f}^v)`, with `U_v` and `U^v` compact open. Choose
  representatives `g_j^v` for `J = G(F)\G(𝔸_{F,f}^v)/U^v`. Let `Γ_j` be the image in
  `G(F_v)` of `{γ ∈ G(F) | γ^v ∈ g_j^v U^v (g_j^v)⁻¹}`. Prove the homeomorphism
  `⊔_{j∈J} Γ_j\G(F_v)/U_v ≃ G(F)\G(𝔸_{F,f})/U`, sending `[x]` to `[(x,g_j^v)]`,
  with quotient topologies and discrete `J`. Prove that `J` is finite using AA.3.4's
  class-number finiteness for linear algebraic groups. Changing a representative conjugates
  the stabilizer and gives the compatible equivalence of its summand. Discreteness of `Γ_j`
  is not needed.
  This is the double-coset calculation of [Milne], Lemma 5.13, p. 57, with `G(F_v)/U_v`
  in place of the archimedean homogeneous space; the away-factor splitting is AA.0.3.
  *Needs:* AA.0.3; AA.1.2; AA.3.4 for finiteness; Mathlib `DoubleCoset.Quotient`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `G_a/ℚ` and integral `U^p`, `Γ = ℤ[1/p]` is dense in `ℚ_p`, so a general
    discreteness assertion about these stabilizers would fail.
  - For a quaternion norm-one group split at `v`, the preceding strong approximation
    target makes `J` a singleton for every `U^{v,1}`.
  - A level coupling residues at two places need not split as `U_v × U^v` and does
    not satisfy the hypothesis of this formula.

- **Nested-level map on double cosets.** For a group `G` and subgroups `H, K′ ≤ K ≤ G`, define
  the map `DoubleCoset.Quotient H K′ → DoubleCoset.Quotient H K`,
  `π : H\G/K′ → H\G/K`, `[g] ↦ [g]`, and for each `g` the map `K ⧸ K′.subgroupOf K → π⁻¹{[g]}`, `kK′ ↦ [g k]`. Prove that `π [g] = [g]`, that `π` is
  surjective, that the fibre map is surjective for each `g`, and
  that the maps for `K″ ≤ K′ ≤ K` compose; no normality is assumed
  (Tau Ceti `DoubleCoset.quotientMapOfLELeft_apply_mk`,
  `DoubleCoset.quotientMapOfLELeft_refl`, `DoubleCoset.quotientMapOfLELeft_trans`,
  `DoubleCoset.quotientMapOfLELeft_surjective`, `GroupTheory/DoubleCoset/Map.lean`, lines 38–67;
  `TauCeti.cosetToOrbitRelMapFiber_surjective`,
  `GroupTheory/DoubleCoset/Fiber.lean`, lines 57–77). Transport the left-level maps through
  inversion to change the right level; choose the inverse coset representative so the fibre
  formula is `[gk]`. *Needs:* Mathlib `DoubleCoset.Quotient`, `DoubleCoset.eq`;
  Tau Ceti `DoubleCoset.quotientMapOfLELeft`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `K′ = K`, `π` is the identity.
  - For `H = G` and `[K : K′] = 2` there is one fine class, so the fibre size `1` is not the
    index `2`.
  - For `H = 1`, the fibre has exactly `[K : K′]` elements, unlike the `H = G` case above.

  - In `S₃`, with `H = K′ = 1`, `K = S₃`, `g = (01)` and `k = (12)`,
    the fibre map takes `[k]` to `[gk]`; `(gk)(0) = 1` whereas `(kg)(0) = 2`.

- **Finite-index bound for level changes.** For `K′ ≤ K` of finite index `N`, prove that every
  fibre of `H\G/K′ → H\G/K` has at most `N` elements, and that if `H\G/K` is finite of
  cardinality `h` then `H\G/K′` is finite of cardinality at most `Nh`
  (the conclusion states finiteness as well as the bound). No
  normality, freeness or neatness is assumed. This is an owned deduction from the
  preceding fibre surjection and Tau Ceti
  `TauCeti.finite_fiber_orbitRel_map_of_isFiniteRelIndex`,
  `GroupTheory/DoubleCoset/Fiber.lean`, lines 80–90: a quotient of `N` cosets is finite
  with cardinality at most `N`; sum this bound over the `h` coarse classes.
  *Needs:* AA.4.4.
  *Lean:* none; specified in the README only.

  **Checks.**
  - `Nat.card ℤ = 0`, so `Nat.card X ≤ Nh` holds for every infinite `X`; the bound alone does not
    give finiteness.
  - With `H = 1` and `[K : K′] = 2`, every fibre has size `2`, attaining the bound.
  - With `H = G` and the same index, both double-coset spaces are singletons and the
    fibre has size `1`, strictly below the bound.
- **Conjugate levels give equivalent double-coset sets.** For a group `G`, `H, K ≤ G` and
  `a ∈ G`, prove that `[g] ↦ [ga]` is a bijection `H\G/(aKa⁻¹) ≃ H\G/K` with inverse
  `[x] ↦ [xa⁻¹]`; `a` need not normalize `H` ([LT], §3.2, pp. 11–16 (conjugate lattice
  stabilizers; the abstract bijection is a direct double-coset calculation)). *Needs:* Mathlib
  `DoubleCoset.eq`, `DoubleCoset.Quotient`.
  *Lean:* none; specified in the README only.
  **Checks.**
  - For `a = 1`, the representative is unchanged.
  - In `S₃`, `g = (01)`, `a = (12)` gives `(ga)(0) = 1`, whereas `(ag)(0) = 2`;
    the bijection uses the former.
  - With `g = (01)` and `a = (01)(12)`, `(ga)(0) = 0`, whereas `(ga⁻¹)(0) = 2`;
    the forward map uses `a`.

- **Index of product subgroups with finite exceptional support.** For groups `H_v` with
  subgroups `S_v ≤ H_v` equal to `H_v` outside a finite set `B` and of finite index for `v ∈ B`,
  prove `(∏ H_v)/(∏ S_v) ≃ ∏_{v∈B} H_v/S_v` and `[∏ H_v : ∏ S_v] = ∏_{v∈B} [H_v : S_v]`; in
  particular for compact open product levels in `G(𝔸_f)`, `[∏ K_v : ∏ K′_v] = ∏_v [K_v : K′_v]`
  as an owned finite-support deduction from Mathlib `Subgroup.index_pi`
  (`GroupTheory/Index.lean`, lines 643–649). Split the index set into `B` and its complement;
  the subgroup on the complement is the full product and its coset space is a point.
  Coordinate restriction and extension by identity give the displayed equivalence. For varying
  groups, apply the finite product-index formula inductively using `Subgroup.index_prod`.
  [LT], §3.2.1, (20), p. 14, is the lattice-counting application.
  *Needs:* AA.1.5; Mathlib `Subgroup.index_prod`, `Subgroup.index_pi`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `B = ∅`, every subgroup is the whole group, and the coset space is a singleton.
  - In `∏_{n∈ℕ} ℤ`, take `S₀ = 2ℤ`, `S₁ = 3ℤ` and all other `S_n = ℤ`; the index is `6`.
  - If `S_n = 2ℤ` for every `n∈ℕ`, the quotient has infinitely many cosets; the finite-support
    hypothesis fails, and no finite product of the local indices gives its index.
- **Level quotients.** For a connected reductive group `G` over `F`, compact open
  `U ⊂ G(𝔸_{F,f})` and a closed subgroup `K_∞ ⊂ G(F_∞)` (for example a maximal compact subgroup
  times `A_G(ℝ)^0`, or trivial), define `LevelMaps.LevelQuotient U K∞ : Type`, the level
  quotient `X_U = G(F)\G(𝔸_F)/K_∞U` (the quotient of `G(𝔸_F)` by the double-coset
  relation `x ∼ γ x k` for `γ ∈ G(F)` and `k` in `LevelMaps.levelSubgroup`, the subgroup
  `K∞ × U`) with the quotient topology, with
  the projection `mk : G(𝔸) → LevelQuotient U K∞`, and the homeomorphism
  `LevelQuotient (g U g⁻¹) K∞ ≃ₜ LevelQuotient U K∞`, the right action of `G(𝔸_f)` by Hecke
  translation `X_{gUg⁻¹} ≃ X_U`, `[x] ↦ [xg]`. For `U′ ≤ U`, `[x] ↦ [x]` is the level map
  `X_{U′} → X_U` (`LevelMaps.levelMap`). Prove that
  `mk (diagonal γ * x) = mk x` ([Milne], §5, footnote 40, p. 57). *Needs:* AA.3.4; AA.1.2.
  *Lean:* `LevelMaps.levelSubgroup`, `LevelMaps.LevelQuotient`, `LevelMaps.levelMap`
  (the native double quotient and its level map).

  **Checks.**
  - For `GL_1/ℚ`, `U = ℤ̂^×` (the maximal compact open subgroup) and `K∞ = ℝ^×`,
    `LevelQuotient` is a point.
  - For `SL_2/ℚ` with `K∞ = 1` and `U = SL_2(ℤ̂)`, `LevelQuotient` is `SL_2(ℤ)\SL_2(ℝ)` (strong
    approximation), not the one-point set `SL_2(ℚ)\SL_2(𝔸_f)/U`.
  - For `GL₁/ℚ`, `U = ℤ̂^×`, `K∞ = ℝ^×`, the quotient is one point.

- **Compact kernel of height on an archimedean level.** (*compact-kernel-split-centre*) For
  connected reductive `G/F`, let `K∞ ⊂ G(F_∞)` be closed, contain `A_G(ℝ)^0`, and be compact
  modulo it. Prove that `K∞ ∩ ker H_{G,∞}` is compact, and that multiplication gives
  `K∞ ≃ A_G(ℝ)^0 × (K∞ ∩ ker H_{G,∞})` ([Arthur], §2, pp. 13–15). *Needs:* AA.2.1.
  *Lean:* none; specified in the README only.
- **Finite full rational stabilizers.** (*rational-stabilizer-finite*) For `F` a number field,
  `G` connected reductive over `F` (more generally `G` of finite type), `K∞ ⊂ G(F_∞)` a subgroup
  such that `K∞ ∩ ker H_G` is compact — that is, the adelic points with archimedean component in
  `K∞`, finite component `1` and `H_G = 0` form a compact set; this holds for instance when `K∞` is
  closed, contains `A_G(ℝ)^0` and is compact modulo it (*compact-kernel-split-centre*) —
  `U ⊂ G(𝔸_{F,f})` compact open and `g ∈ G(𝔸_F)`, prove that
  `A_x = G(F) ∩ gK∞Ug⁻¹` is finite. Here `A_x` is the full stabilizer, before division by any
  rational central subgroup ([Arthur], §1, pp. 7–8; §2, pp. 13–15). *Needs:* AA.4.4; AA.1.3;
  AA.2.1; AA.1.2.
  *Lean:* none; specified in the README only.
- **Proper arithmetic action on the level space.** For `F` a number field, `G` connected
  reductive over `F`, `K∞ ⊂ G(F_∞)` closed, containing `A_G(ℝ)^0` and compact modulo it,
  `U ⊂ G(𝔸_{F,f})` compact open, and `G(F)` acting on `G(𝔸)/K∞U` by left multiplication, prove
  under *rational-stabilizer-finite* that the discrete group `G(F)` acts properly
  discontinuously on `G(𝔸)/K∞U` with its canonical quotient topology: for compact `C, D` only
  finitely many `γ` satisfy `γC ∩ D ≠ ∅` ([Arthur], §1, pp. 7–8). *Needs:* AA.4.4; AA.2.2; AA.2.1;
  AA.1.3.
  *Lean:* none; specified in the README only.
- **Level quotients are Hausdorff.** For compact open `U` and `K_∞` containing `A_G(ℝ)^0` and
  compact modulo it, prove that the level quotient `X_U` is Hausdorff and locally compact, and
  that `G(F)` acts properly discontinuously on `G(𝔸)/K_∞U` ([Milne], Lemma 5.13, p. 57). *Needs:*
  AA.4.4; AA.2.2; Mathlib `ProperlyDiscontinuousSMul`, `isOpenMap_quotient_mk'_mul`.
  *Lean:* none; specified in the README only.

  **Checks.** For `SL₂/ℚ` and compact `K∞` the height conditions are automatic; for `G_m/ℚ`
  the positive real subgroup has trivial height kernel and full height image; the real quadratic
  lattice in the covering-map Checks has compact height kernel but insufficient height image,
  and its fine level quotient is not Hausdorff.
- **Free action of finite level groups at neat level.** For neat compact open `U`, normal open
  `U′ ⊂ U`, and `K∞` containing `A_G(ℝ)^0` and compact modulo it, prove that the full group
  `U/U′` acts freely and properly discontinuously on `X_{U′}`. Rational stabilizers are finite,
  and neatness makes them trivial; the central rational kernel is trivial in this scope. This is
  this roadmap's deduction from *rational-stabilizer-finite* and neatness; [Milne], §5, p. 58,
  makes the arithmetic groups at small level neat. *Needs:* AA.4.4; AA.4.3.
  *Lean:* none; specified in the README only.
- **Covering maps between neat levels.** For a connected reductive group `G` over `F` (more
  generally `G` of finite type), `U′ ⊂ U` compact open with `U` neat, and `K∞ ⊂ G(F_∞)` closed
  such that `K∞ ∩ ker H_G` is compact and `H_G(K∞) = H_G(G(𝔸))` (every value of `H_G` is taken at
  an adele with archimedean component in `K∞` and finite component `1`), prove that
  `X_{U′} → X_U` is a finite covering of degree `[U : U′]`, and that if `U′` is normal in `U`, the
  canonical `U/U′` action is free and transitive on each fibre, so this is a principal `U/U′`
  covering. For connected reductive `G` both conditions hold when `K∞` contains `A_G(ℝ)^0` and is
  compact modulo it (*compact-kernel-split-centre*, *log-height-split-centre-iso*). The second
  condition gives `G(𝔸) = G(𝔸)^1K∞`, and as `H_G` vanishes on `U`, `K∞U ∩ G(𝔸)^1 = (K∞ ∩ ker H_G)U`; so `G(𝔸)/K∞U` is `G(𝔸)^1/(K∞ ∩ ker H_G)U`, a quotient by a compact subgroup, on
  which the discrete group `G(F)` acts properly discontinuously. The first condition alone gives
  finite rational stabilizers (*rational-stabilizer-finite*), which neatness makes trivial, but
  not properness. Equality of `U/U′` with the full deck-transformation group additionally
  requires the usual connectedness hypotheses (in particular connected total space). The degree,
  freeness and fibre transitivity are this roadmap's deduction from the stabilizer and neatness
  inputs above; [Milne], §5, p. 58, supplies the inverse system of level quotients and its right
  action. *Needs:* AA.4.4; AA.4.3; AA.2.1; Mathlib
  `isQuotientCoveringMap_quotientMk_of_properlyDiscontinuousSMul`; Tau Ceti
  `IsQuotientCoveringMap.isCoveringMap_of_comp`; Mathlib `ProperlyDiscontinuousSMul`.
  *Lean:* `LevelMaps.isCoveringMap_levelMap`.

  **Checks.**
  - For `GL_1/ℚ`, put `U(N) = ker(ℤ̂^× → (ℤ/N)^×) = ℤ̂^× ∩ (1 + Nℤ̂)` for `N ≥ 1`.
    With `K∞ = ℝ_{>0} = A_G(ℝ)^0`, `U = U(3)` and `U′ = U(9)`, the decomposition
    `𝔸^× = ℚ^× × ℝ_{>0} × ℤ̂^×` makes `X_U` and `X_{U′}` the discrete sets `(ℤ/3)^×` and
    `(ℤ/9)^×` of cardinalities two and six, and every fibre has `[U : U′] = 3` points.
    The affine set `1 + 3ℤ̂` itself contains an element with zero 2-adic component
    (take `z₂ = −1/3` and `z_p = 0` for `p ≠ 2` in `1 + 3z`), so it is not a subgroup of ideles.
  - For `SL_2/ℚ`, `a_G = 0` and the two conditions say that `K∞` is compact. With `K∞ = SO(2)` and
    `U(N) = ker(SL_2(ℤ̂) → SL_2(ℤ/N))`, the map `X_{U(9)} → X_{U(3)}` is `Γ(9)\ℍ → Γ(3)\ℍ`, of
    degree `27 = |ker(SL_2(ℤ/9) → SL_2(ℤ/3))|`.
  - The first condition alone does not suffice. Over `F = ℚ(√2)` let `G = G_m`,
    `η = 17 + 12√2 = (1 + √2)^4`, `L = log η`, `U` and `U′` the kernels of reduction of
    `𝒪̂_F^×` modulo `4` and `8` (`U` is neat: its rational points are the powers of `η`), and
    `K∞ = exp Λ` for the lattice `Λ = ℤ(L, 0) + ℤ(√2L, L)` in `ℝ² = log (F ⊗ ℝ)^×_{>0}`. Then `K∞`
    is closed, `H_G(K∞) = L(ℤ + (1 + √2)ℤ)` and `K∞ ∩ ker H_G = 1`, but `H_G(K∞) ≠ ℝ`. As
    `η ∈ U ∖ U′`, the classes of `1` and `(η_∞, 1)` in `X_{U′}` are distinct (a rational element
    relating them is a unit `γ ∈ U′` with `γ_∞⁻¹η_∞ ∈ K∞ ∩ ker H_G`, so `γ = η`) and have the same
    image in `X_U`. As `η² ∈ U′`, `t ↦ [(exp t, 1)]` on `ℝ²/Λ` is invariant under translation by
    `2(L, −L)`; modulo `Λ`, `(L, −L) ≡ √2(L, 0)` lies on the circle `ℝ(L, 0)/ℤ(L, 0)`, on which
    this translation is an irrational rotation. So the two classes are topologically
    indistinguishable and `X_{U′} → X_U` is not a covering map.
- **Fibre mass for full stabilizers.** For `F` a number field, `G` connected reductive over
  `F`, `K∞ ⊂ G(F_∞)` closed, `U′ ⊂ U ⊂ G(𝔸_{F,f})` compact open, and `x = [g] ∈ X_U` with
  `A_x = G(F) ∩ gK∞Ug⁻¹` finite (for example by *rational-stabilizer-finite*), prove for the
  full stabilizers `A_y` at the points above `x` that `∑_{y↦x} 1/|A_y| = [U : U′]/|A_x|`
  ([Arthur], §1, pp. 7–8). *Needs:* AA.4.4.
  *Lean:* none; specified in the README only.
- **Fibre mass of a level map with stabilizers.** For a connected reductive group `G` over `F`,
  `U′ ⊂ U` compact open, and `K∞ ⊂ G(F_∞)` closed, containing `A_G(ℝ)^0` and compact modulo it (so
  that `A_x`, `Z(F) ∩ K∞U` and `Z(F) ∩ K∞U′` are finite by *rational-stabilizer-finite*), without
  neatness, prove for `x ∈ X_U` with finite stabilizer group
  `Γ_x = (G(F) ∩ g K_∞U g⁻¹)/(Z(F) ∩ K_∞U)` that the fibre of `X_{U′} → X_U` over `x` satisfies

  `∑_{y ↦ x} 1/|Γ_y| = [U : U′] / (|Γ_x| · [Z(F) ∩ K_∞U : Z(F) ∩ K_∞U′])`

  ([LT], §3.2, pp. 11–16 (level-counting context; the displayed mass formula is derived from
  finite-group orbit–stabilizer)). *Needs:* AA.4.4.
  *Lean:* none; specified in the README only.
- **Quotient groupoids at non-neat level.** For a connected reductive group `G` over `F`,
  compact open `U` and closed `K∞`, define the action groupoid `𝒳_U`
  of `G(F)` on `G(𝔸)/K∞U`. Prove that the automorphism group of the
  object `x` is `G(F) ∩ x K∞U x⁻¹` (identified through Mathlib's
  `CategoryTheory.ActionCategory.stabilizerIsoEnd`, the automorphism attached to `γ` being the
  morphism `γ`), that the isomorphism classes are
  `≃ LevelQuotient U K∞`, the class of the object `[g]` going to `[g]`,
  and that every automorphism group is
  finite if `U` is compact open and `K∞` contains `A_G(ℝ)^0` and is compact modulo it; at neat
  `U` they are trivial. No finiteness assertion is made for general closed `K∞`: the
  automorphism groups need not be finite (real quadratic unit stabilizers when `K∞` is the full
  archimedean centre). The stabilizer description and finiteness are this roadmap's deduction
  from *rational-stabilizer-finite*; [Milne], §5, p. 58, gives the neat small-level case.
  *Needs:* AA.4.4; Mathlib
  `CategoryTheory.ActionCategory`; AA.1.3.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `SL_2/ℚ`, `K∞ = SO(2)`, `U = SL_2(ℤ̂)`, the automorphism group of the object over `i` is
    `⟨(0 −1; 1 0)⟩` of order `4` (for `K∞ = 1` it would be trivial).
  - The groupoid is not determined by `X_U`: `Y(1)` and the coarse space of the groupoid agree,
    but the groupoid remembers the stabilizers of orders `4` and `6`.
  - The automorphism attached to `γ` has underlying group element `γ`;
    postcomposing the canonical identification with conjugation by a stabilizer element `h`
    sends `γ` to `hγh⁻¹` and moves it exactly when `h` and `γ` do not commute.
    For every noncentral `γ`, some stabilizer element `h` moves it.
  - For `GL₂/ℚ`, `U = GL₂(ℤ̂)` and `K∞ = ℝ_{>0}O(2)`, the object represented by `1` has
    stabilizer `O₂(ℤ)`, the dihedral group of order eight. With `h = diag(1,−1)` and
    `r = [[0,−1],[1,0]]`, conjugation by `h` fixes the noncentral element `h` and sends
    `r` to `r⁻¹ ≠ r`.
  - For `GL₂/ℚ`, `U = GL₂(ℤ̂)` and `K∞ = ℝ_{>0}SO(2)`, the objects over `i` and
    `ρ = −1/2 + (√3/2)i` have automorphism groups of orders `4` and `6`.
    The latter uses the conjugate of `K∞` by `[[√3/2,−1/2],[0,1]]`.
    With `K∞ = ℝ_{>0}O(2)` the orders are instead `8` and `12`.
    The central element `−1` is retained; the effective `PSL₂` stabilizers in the
    `SO(2)` case have orders `2` and `3`. At neat level the full automorphism group is trivial.

### 4.5 Hecke correspondences, volumes and abelianization

- **Degree of a Hecke correspondence.** For compact open `U` and `g ∈ G(𝔸_f)`, prove that `UgU`
  is the disjoint union of `[U : U ∩ gUg⁻¹]` cosets of the form `x·U` (left cosets in the
  convention of Tau Ceti `HeckeCoset.degree`), represented by `u g`; in the compact-modulo-`A_G`
  neat scope, `p₁ : X_{U∩gUg⁻¹} → X_U` is a covering of exactly that degree, and the rational
  central kernel is trivial ([Arthur], §2, p. 13). *Needs:* Tau Ceti `HeckeCoset.degree_eq_relIndex`;
  AA.4.4.
  *Lean:* none; specified in the README only.
- **Hecke correspondences.** For a connected reductive group `G` over `F`, `g ∈ G(𝔸_{F,f})` and
  compact open `U`, put `U_g = U ∩ gUg⁻¹` and define the Hecke correspondence
  `T_g` as the pair of maps `X_U ←p₁ X_{U_g} →p₂ X_U`. Prove that
  `p₁(mk x) = mk x` (the first map is the level map), that
  `p₂(mk x) = mk (x * g)`, that
  `T_g` depends only on `UgU`, and that at neat level, for `K∞` as in *Covering maps between neat
  levels*, `p₁` is a covering of degree `[U : U_g]`, the degree of the double coset `UgU`
  (`HeckeCoset.degree_eq_relIndex`) ([Arthur], §2, p. 13). *Needs:* AA.4.4; AA.4.5.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `g = 1` both maps are the identity.
  - `T_g` and `T_{g⁻¹}` are transposes, not equal in general. For `GL₂/ℚ` with
    `U = GL₂(ℤ_p) × U^p` and `g` equal to `diag(p,1)` at `p` and `1` elsewhere,
    `T_{g⁻¹}` is `T_g` composed with translation by the central idele `p⁻¹` at `p`.
  - With `U = GL_2(ℤ̂)` and `K∞ = SO(2)` this translation rescales the archimedean component
    (`|det x_∞|` is multiplied by `p²`), so `T_{g⁻¹} ≠ T_g`; if `K∞ ⊇ ℝ_{>0}` the translation is
    trivial on `X_U` and the two coincide.
  - At `U = K₀(p)`, let `I=U_p` be upper triangular modulo `p`. The reductions of
    `I diag(p,1) I` have zero first column and nonzero lower-right entry; those of
    `I diag(1,p) I` have zero bottom row and nonzero upper-left entry. The double cosets
    are disjoint, so `I diag(p,1) I ≠ I diag(1,p) I`.
- **Cartesian squares of level maps.** For a connected reductive group `G` over `F`,
  `U′, L ⊂ U` compact open with `U` neat, `K∞` containing `A_G(ℝ)^0` and compact modulo it, and
  `U′L = U`, prove that the square `X_{U′∩L} → X_L`, `X_{U′∩L} → X_{U′}`, `X_{U′} → X_U`,
  `X_L → X_U` is Cartesian. For `L = U_g` this identifies this one leg of a Hecke pullback only
  when the product condition holds; `U′` normal does not imply that condition, and `U′ ∩ U_g` is
  generally different from `U′ ∩ gU′g⁻¹`. The Cartesian property is this roadmap's deduction from
  the covering degrees and neat-level freeness above; [Milne], §5, p. 58, supplies the inverse
  system of level maps. *Needs:* AA.4.4; AA.4.5; Tau Ceti
  `HeckeCoset.degree_eq_relIndex`.
  *Lean:* none; specified in the README only.
- **Volume of a level quotient.** For a connected reductive group `G` over `F` and compact open
  `U`, with a Haar measure `dg_f` on `G(𝔸_f)`, `dg_∞` on `G(F_∞)` and the product measure on
  `G(𝔸)` (AA.0.3), prove

  `vol(G(F)\G(𝔸)^1) = vol(U) ∑_i vol(Γ_i\G(F_∞)/A_G(ℝ)^0)`

  for representatives `x_i` of `G(F)\G(𝔸_f)/U`, where `Γ_i = G(F) ∩ x_iUx_i⁻¹`, the measure on
  `G(𝔸)^1` is transported from `G(𝔸)/A_G(ℝ)^0` (AA.2.1) and `G(F_∞)/A_G(ℝ)^0` carries the quotient
  measure. (`G(𝔸)^1` is not `G(F_∞)^1 × G(𝔸_f)`: finite ideles have nontrivial norms.) ([Arthur],
  (2.1), p. 13). *Needs:* AA.3.4; AA.2.3; AA.2.1; AA.2.2; AA.0.3.
  *Lean:* none; specified in the README only.
- **Volumes under finite-index level change.** For a connected reductive group `G` over `F` and
  compact open `U′ ⊂ U`, prove
  `∑_j vol(Γ′_j\G(F_∞)/A_G(ℝ)^0) = [U : U′] ∑_i vol(Γ_i\G(F_∞)/A_G(ℝ)^0)` (the index factor as in
  the counting analogue [LT], §3.2.3, (28), p. 16).
  *Needs:* AA.4.5; Mathlib `MeasureTheory.Subgroup.index_mul_measure`; AA.2.4.
  *Lean:* none; specified in the README only.
- **Integral lifting for reductive abelianization.** (*abelianization-integral-lifts*) For
  connected reductive `G/F` with simply connected derived group and `ν : G → D = G/G^der`, prove
  that there is a finite set `B` such that smooth reductive models over `𝒪_{F,B}` extend `ν` and
  `ν : G(𝒪_v) → D(𝒪_v)` is surjective for every finite `v ∉ B` ([Milne], Lemma 5.21(b), p. 61).
  The lift follows from Lang’s theorem on the connected smooth special fibre and
  Hensel lifting along the smooth fibre of `ν`. *Needs:* AA.1.1; ReductiveGroupsPartII, RG2.3
  (Lang and smooth lifting).
  *Lean:* none; specified in the README only.
- **Surjectivity of finite adelic abelianization.** For `F` a number field, `G` connected
  reductive over `F` with `G^der` simply connected, `D = G/G^der` and `ν : G → D` the quotient
  morphism with its restricted-product map on finite adelic points, prove under
  *abelianization-integral-lifts* and local simply connected `H¹` vanishing that
  `ν : G(𝔸_f) → D(𝔸_f)` is surjective with kernel `G^der(𝔸_f)`; it is the actual
  restricted-product homomorphism induced by `ν` ([Milne], Lemma 5.21, p. 61). *Needs:* AA.4.5;
  AA.4.1; AA.1.3.
  *Lean:* none; specified in the README only.
- **Class sets of groups with simply connected derived group.** Let `G` be connected reductive
  over `F` with `G^der` simply connected and `G^der(F_∞)` noncompact on each `F`-simple factor,
  and `ν : G → D = G/G^der`. For compact open `U ⊂ G(𝔸_{F,f})`, prove that `ν` induces a bijection
  `G(F)\G(𝔸_{F,f})/U ≃ ν(G(F))\D(𝔸_{F,f})/ν(U)` ([LT], §3.2.2, (21), p. 14). *Needs:* AA.4.2;
  AA.4.1; AA.1.3; AA.1.5; AA.4.5.
  *Lean:* none; specified in the README only.

### 4.6 Compact abelian quotients and quaternion norms

- **Reduced norms of a quaternion algebra over a number field.** (*quaternion-norm-images*)
  For a quaternion algebra `D` over a number field `F`, take the reduced norm `Nrd_A` of the
  supplier table on a presentation `D ≃ ℍ[F,a,b]`; it is multiplicative on units and
  independent of the presentation by the pinned `normForm_mul` and `normForm_eq_of_algEquiv`.
  Prove that it is natural for `D ⊗[F] A` under commutative coefficient-algebra maps and equal
  to the determinant under every splitting `D ⊗[F] A ≃ M₂(A)`. Prove that `Nrd(D_v^×) = F_v^×`
  at every finite place and every complex place; at a real place the image is `ℝ^×` when split
  and `ℝ_{>0}` when ramified.
  Prove the global image formula
  `Nrd(D^×) = {a ∈ F^× | τ(a) > 0 at every real place τ ramified in D}`
  (Hasse–Schilling–Maass). For quaternion algebras the local–global step is the
  representation theorem for their quadratic norm forms
  ([Platonov–Rapinchuk–Rapinchuk], Theorem 1.34, pp. 43–44, with the split matrix case;
  [Khayutin], §2.3, arXiv v3 pp. 15–16, for `ℚ`).
  *Needs:* Tau Ceti `QuaternionAlgebra.normForm`, `QuaternionAlgebra.normForm_mul`,
  `QuaternionAlgebra.normForm_eq_of_algEquiv`, `TauCeti.QuaternionAlgebra.baseChange`;
  GlobalQuadraticForms, layer 5; AA.4.1.
  *Lean:* `QuaternionNorms.nrd_image` (the global norm-image formula over every number field,
  on Mathlib’s `QuaternionAlgebra` carrier).

  **Checks.**
  - In the split algebra, `Nrd(diag(a,1)) = a`, including negative real `a`.
  - For Hamilton's algebra over `ℚ`, every nonzero rational norm is positive.
  - In a real quadratic field with a quaternion algebra ramified at exactly one real
    place and one finite place, positivity is required only at that real place, not both.
  - On a split quaternion algebra left multiplication has determinant `Nrd(x)²`;
    it cannot replace the unit norm in its kernel or in the image formula.
- **Compact idele classes modulo squares.** (*idele-class-square-compact*) For a number field
  `F`, `C_F = F^×\𝔸_F^×` the idele class group with the quotient topology and `C_F²` its subgroup
  of squares, using the idele norm and the compactness of `C_F^1` from GlobalNumberFields
  layer 6, prove that `C_F/C_F²` is compact Hausdorff: the norm decomposition
  `C_F ≃ ℝ_{>0} × C_F¹` identifies it with the quotient of compact `C_F¹` by its square image
  ([Khayutin], proof of Proposition 3.6, arXiv v3 p. 25 (compactness of `ℚ^×\𝔸^×/𝔸^{×2}`);
  Definition 3.1, p. 22, for `G_res`). *Needs:* GlobalNumberFields, layer 6.
  *Lean:* `compactSpace_ideleClassGroup_quotient_squares`.

  **Checks.**
  - The class of `x²` is the identity for every actual idele class `x`.
  - The positive infinite scalar `2` also dies: its positive square root is an idele.
    Thus the noncompact norm direction disappears.
  - Over `ℚ`, the idele with component `−1` at `3` and `1` everywhere else survives:
    `−1` is not a square in `ℚ₃`, and a principal factor
    with even finite valuations and positive real component is a rational square.

- **Pushforward of a homogeneous measure to a compact abelian quotient.** Let `C` be a compact
  Hausdorff, second countable abelian group with its Borel sigma algebra, so that Mathlib's Haar
  uniqueness `isMulLeftInvariant_eq_smul` applies, `π : G → C` a
  continuous surjective homomorphism, `T ≤ G` a closed subgroup with `Λ ≤ T` discrete, `Λ\T`
  compact (for example, `T(F)\T(𝔸_F)` for an `F`-anisotropic torus `T`) and `π(Λ) = 1`, and `μ` the
  `T`-invariant probability measure on `Λ\T g`. Prove that `π_*μ` is the Haar probability
  measure of the coset `π(T)·π(g)` of the closed subgroup `π(T)` ([Khayutin], Definition 3.1,
  arXiv v3 p. 22; Annals p. 169). *Needs:* AA.4.6; Mathlib
  `MeasureTheory.Measure.isMulLeftInvariant_eq_smul`.
  *Lean:* none; specified in the README only.
  **Checks.**
  - For `G_m/ℚ`, the quotient by the algebraic centre is trivial, but
    `ℚ^×\𝔸_ℚ^×` is noncompact: the idele norm descends by the product formula to a
    continuous surjection onto `ℝ_{>0}`. An idele with real component `t > 0` and all
    finite components `1` has norm `t`. Anisotropy modulo the centre therefore does
    not imply compactness of the unreduced quotient.
  - The source quotient carries its Borel sigma algebra. On a two-point discrete space,
    the identity from the trivial sigma algebra to the full sigma algebra is not measurable;
    an arbitrary measurable-space instance does not suffice.
  - For `G = C₄`, `π = id`, `T = Λ = {1}` and translating by `1 ∈ ℤ/4`, the pushforward
    is a point mass.
  - With `T = C₄` and `Λ = {1}`, its singleton masses are `1/4`.
  - With `T = {0,2}` and `Λ = {1}` in multiplicative notation, translation by `1 ∈ ℤ/4`
    gives mass `1/2` at each of `1,3` and zero off that coset.
    All three tests use the orbit quotient, its Borel sigma algebra and its normalized counting
    measure. The two-point sigma-algebra non-example above explains the Borel hypothesis.
  - Hausdorffness is necessary for the closed-image assertion: take discrete `G = C₂`,
    indiscrete `C = C₂`, the identity homomorphism `π`, and `T = Λ = {1}`, `g = 1`.
    The singleton orbit is compact and carries its probability measure, but `π(T) = {1}`
    is not closed in `C`.

### 4.7 Fourier limits on compact abelian groups

- **Fourier convergence of quadratic-character kernels.** Let `C` be a compact Hausdorff
  abelian group with a second countable topology and its Borel sigma algebra,
  `χ_i : C → {±1}` pairwise distinct nontrivial continuous characters, and `m_i`
  the Haar probability of the closed subgroup `ker χ_i`, viewed on `C`. Prove that for each fixed
  character `ψ` of `C`, `m_i` integrates `ψ` to zero unless
  `ψ = 1` or `ψ = χ_i`, and prove weak convergence of the
  `m_i` to Haar probability on `C` ([Khayutin],
  Proposition 3.6, arXiv v3 p. 24, and its proof with Remark 3.7, p. 25). *Needs:* AA.2.4;
  RepresentationTheory/CompactGroups, layer 5.
  *Lean:* `CompactFourier.tendsto_quadraticKernel_haar` (weak convergence).

  **Checks.**
  - On `∏_n {±1}`, the coordinate characters are distinct and their kernel Haar probabilities converge to product Haar.
  - The trivial character and the defining quadratic character both have coefficient `1` on its kernel.
  - Repeating a fixed nontrivial character leaves its coefficient equal to `1`, so distinctness cannot be omitted.
- **Limits of measures invariant under character kernels.** Let `C` be a second countable
  compact Hausdorff abelian group and `(χ_i)` a sequence of pairwise distinct continuous
  characters `C → {±1}`. Prove that any weak-* limit
  of probability measures invariant under `ker χ_i` is `C`-invariant ([Khayutin],
  Proof of Proposition 3.6, arXiv v3 p. 25; Annals pp. 172–173). *Needs:* AA.4.7;
  RepresentationTheory/CompactGroups, layer 5.
  *Lean:* `CompactFourier.isMulLeftInvariant_of_tendsto`.

  **Checks.**
  - Kernel Haar probabilities give the Haar limit of the preceding target.
  - Translates of these kernel Haar probabilities have the same limit, even if the translating points vary.
  - Repeating one character allows its kernel Haar probability as a limit, which is not invariant under the full group.

### Examples

`μ_2` over `ℚ` fails weak approximation at `{∞, 2}` and `G_m` over `ℚ` fails strong approximation
at `{∞}`, while `G_a` has both. `diag(2, 1/2)` is neat and the order-`3` element of `SL_2(ℤ)` is
not; `K(3)` is a neat `GL₂` level and `GL_2(ℤ̂)` is not. The `SL_2/ℚ` level quotient with `K∞ = 1` is
`SL_2(ℤ)\SL_2(ℝ)`; with `K∞ = SO(2)`, the groupoid over `i` has automorphism group of order `4`. For
`GL₂/ℚ`, `U = GL_2(ℤ̂)` and `g` equal to `diag(p, 1)` at `p` and `1` elsewhere, the correspondences
`T_g` and `T_{g⁻¹}` differ at `K∞ = SO(2)` and agree once `K∞ ⊇ ℝ_{>0}`; at the Iwahori level
`K₀(p)` the double cosets of `diag(p, 1)` and `diag(1, p)` at `p` are already distinct. The
positive scalar direction disappears in idele classes modulo squares, while a nonsquare unit at
`3` survives over `ℚ`.

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

### 5.1 `GL₁` and logarithmic tori

- **The `GL_1` quotient is the idele class group.** For `G = G_m` over a number field `F`, prove
  `G(F)\G(𝔸_F) ≃ₜ* IdeleClassGroup F`; that `G(𝔸_F)^1` is the group `𝔸_F^1` of norm-one ideles;
  that `A_G(ℝ)^0 = ℝ_{>0}` embedded diagonally at the archimedean places; that
  `𝔸_F^× = 𝔸_F^1 × ℝ_{>0}`; and that `F^×\𝔸_F^1` is compact while `F^×\𝔸_F^×` is not ([Arthur],
  §3, p. 16; [Borel], §5.8, p. 22). *Needs:* AA.1.4; Mathlib `NumberField.IdeleClassGroup`;
  AA.2.1; AA.3.4; GlobalNumberFields, layer 6; Tau Ceti
  `TauCeti.MultiplicativeGroup.pointsMulEquiv_mapValue`.
  *Lean:* `AdelicExamples.GL1.archComponent`, `AdelicExamples.GL1.posRealsDiag`
  (the archimedean scalar subgroup used by the torus theorem).

  **Checks.** Write `a_∞(t)` for the idele with value `t ≠ 0` at every infinite place
  and value one at every finite place.

  - `a_∞(1) = 1`.
  - `a_∞(2) a_∞(3) = a_∞(6)`.
  - `a_∞(−1) ∉ A_{G_m}(ℝ)^0`.
- **Units at level `U_Q` form a lattice of rank `r₁ + r₂ − 1`.** For a compact open `U ⊂ Ô^×`,
  prove that `Γ_U = F^× ∩ U` is a finite-index subgroup of `𝒪_F^×`, and that its image under the
  logarithmic embedding is a lattice of rank `r₁ + r₂ − 1` in the trace-zero hyperplane of
  `ℝ^{r₁+r₂}` ([CG], §8.2, p. 78 (the rank; finite index is a direct deduction from compactness
  of `Ô^×`)). *Needs:* Mathlib `NumberField.Units.unitLattice_rank`,
  `NumberField.Units.rank`, `NumberField.Units.instZLattice_unitLattice`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - Over `ℚ` the level `ℤ̂^×` gives `{±1}`.
  - Over `ℚ` the principal level `{x ∈ ℤ̂^× : x ≡ 1 mod 3}` gives `⊥`, since `−1 ≢ 1 mod 3`.
  - At the full level `U = Ô^×`, `Γ_U = 𝒪_F^×`.
- **Canonical logarithmic torus at `GL₁` level.** For `F` a number field with `r₁` real and `r₂`
  complex places, `Q` a finite set of finite places, `p` a prime and `n ≥ 1` with
  `N(v) ≡ 1 mod p^n` for `v ∈ Q`, and `U_Q = K_∞ × ∏_v U_{Q,v}` with `K_∞` and `A_∞^0` as in
  *gl1-XQ-components*, prove that the identity component is the logarithmic quotient `W/Λ_Q`,
  where `W = ℝ^{r₁+r₂}/ℝ·(1, …, 1)`, `F_+^×` is the group of totally positive elements of `F^×`,
  `Γ_Q⁺ = F_+^× ∩ U_{Q,f}` is the group of totally positive congruence units and
  `Λ_Q = log(Γ_Q⁺)`; it is a compact real torus of dimension `r₁ + r₂ − 1`. The complex
  circle factors have already been divided out by `K_∞` ([CG], §8.2, pp. 78–79). The statement
  asserts a homeomorphism, without
  naming one. *Needs:* AA.5.1.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `F = ℚ(√2)` and `Q = ∅`, the unit `ε = 1 + √2` has norm `−1`, so `Γ_Q⁺ = ⟨ε²⟩` and
    `Λ_Q` is generated by the image of `(2 log ε, −2 log ε)`; the logarithmic image of all units
    `F^× ∩ U_{Q,f} = ⟨−1, ε⟩` contains it with index two, so dropping total positivity gives the
    wrong lattice.
  - For `F = ℚ(√3)` and `Q = ∅`, the fundamental unit `2 + √3` is totally positive, and `Λ_Q` is
    the full logarithmic unit lattice.
  - For `F = ℚ` or `F` imaginary quadratic, `r₁ + r₂ − 1 = 0` and the identity component is a
    point.
- **Geometry of the `GL_1` arithmetic quotients `X_Q`.** (*gl1-XQ-components*) For a finite set `Q`
  of finite places with `N(v) ≡ 1 mod p^n`, let `U_Q = K_∞ × ∏_v U_{Q,v}`, where
  `K_∞ ≅ (S¹)^{r₂}` is the identity component of the maximal compact subgroup of `(F ⊗ ℝ)^×`,
  `U_{Q,v} = 𝒪_v^×` for `v ∉ Q` and the index-`p^n` subgroup of `𝒪_v^×` for `v ∈ Q`, and
  `X_Q = F^×\𝔸_F^×/U_Q A_∞^0` with `A_∞^0 = A_{G_m}(ℝ)^0`. Prove that each connected component of
  `X_Q` is a compact torus `(S¹)^{r₁+r₂−1}`, and that
  `π_0(X_Q) = F^×\𝔸_F^×/U_Q (F ⊗ ℝ)^{×,0}`, an extension of the narrow class group of `F` by a
  quotient of `∏_{v∈Q} 𝒪_v^×/𝒪_v^{×p^n}` (not, in general, the maximal exponent-`p^n` quotient of
  the ray class group) (correcting the sentence of [CG], §8.2, p. 79, which holds only when the
  narrow class group has exponent dividing `p^n`). The identification
  of `π_0(X_Q)` sends the component of the class of an idele `x` to the
  class of `x`; a bijection permuting the components would satisfy every
  other clause. *Needs:* AA.5.1; AA.3.4; Mathlib `NumberField.Units.rank`,
  `NumberField.Units.unitLattice_rank`; GlobalNumberFields, layer 6.
  *Lean:* `AdelicExamples.GL1.nonempty_connectedComponent_homeomorph`, with
  `AdelicExamples.GL1.levelQ` and `AdelicExamples.GL1.XQ` (the torus homeomorphism).

  **Checks.**
  - An idele of `(F ⊗ ℝ)^{×,0}` lies in the identity component.
  - `levelQ F ∅ p n` does not depend on `p` and `n`.
  - For `F = ℚ`, `Q = {3}`, `p = 2` and `n = 1`, the idele with component `4` at `3` and `1` at
    every other place lies in `levelQ` (`4 = 2²` with `2 ∈ ℤ_3^×`); the idele with component `2`
    at `3` does not, since `2` is not a square mod `3`.
- **The invariant `l0` for `GL_1`.** Prove that every connected component of `X_Q` has dimension
  `r₁ + r₂ − 1 = NumberField.Units.rank F`, the value of Calegari–Geraghty's invariant `l0` for
  `G = GL_1/F`; in particular its cohomology vanishes above degree `r₁ + r₂ − 1` ([CG], §8.2,
  p. 77). *Needs:* AA.5.1; Mathlib `NumberField.Units.rank`; AlgebraicTopology, stage 6.
  *Lean:* none; specified in the README only.
- **Degree-zero cohomology of `X_Q`.** Prove that the `ℤ_p`-module of locally constant functions
  `X_Q → ℤ_p` is free on `π_0(X_Q)`: `H^0(X_Q, ℤ_p) ≅ ℤ_p[π_0(X_Q)]` ([CG], §8.2, p. 79), the
  isomorphism evaluating `f` at a point of each component. *Needs:* AA.5.1; AA.3.4.
  *Lean:* none; specified in the README only.
- **Hecke and diamond operators for `GL_1`.** Prove that for `v ∉ Q` the `GL₁` Hecke operator of
  the finite idele `π_v` is right translation, and that for `v ∈ Q` a unit `α` gives the diamond
  translation; each permutes `π₀(X_Q)` by its finite idele class. Under the natural
  exterior-power identification of torus cohomology, translation induces the identity within
  the torus factor and the indicated permutation of the component factors in every degree
  ([CG], §8.2, p. 79). *Needs:* AA.4.5; AA.5.1; AlgebraicTopology, stage 6.
  *Lean:* none; specified in the README only.

### 5.2 `GL₂` over `ℚ` and principal levels

- **Number-field congruence levels and membership.** (*number-field-congruence-levels*)
  For a number field `F`, put `Ô_F = ∏_{v finite} 𝒪_v ⊂ 𝔸_{F,f}`, and let `N ≠ 0`
  be an integral ideal of `𝒪_F`. Define `NÔ_F` as the image of `N ⊗[𝒪_F] Ô_F`.
  Prove `NÔ_F = ∏_v N𝒪_v` and the diagonal ring isomorphism
  `𝒪_F/N ≃ Ô_F/NÔ_F`, using ideal factorization and the Chinese remainder theorem.
  Thus the quotient is finite. Define the principal level `K(N)`, the level `K₀(N)` and the
  level `K₁(N)` as subgroups of `GL₂(𝔸_{F,f})` inside `GL₂(Ô_F)`, with respectively
  `g − I₂ ∈ M₂(NÔ_F)`, `c ∈ NÔ_F`, and `c ∈ NÔ_F, d−1 ∈ NÔ_F`.
  Express membership entrywise: integral entries, integral inverse entries, and the stated
  congruence conditions on all entries, on `c`, and on `c` and `d − 1` respectively. Prove
  equivalence with the subgroup membership predicates. Ring maps
  `Ô_F → R` carrying `NÔ_F` into an ideal `J` carry these entry conditions to their
  counterparts modulo `J`. Prove compactness, openness, the inclusions
  `K(N) ≤ K₁(N) ≤ K₀(N)`, the inclusion of each `M`-level in the
  corresponding `N`-level whenever `M ⊆ N`,
  and the local comap and product formulas of AA.1.5. No generator of `N` is chosen.
  These levels extend the congruence-subgroup convention of [Milne], §4, p. 42, and
  the product-level topology of [Borel], §1.7, p. 8.
  *Needs:* GlobalNumberFields, layer 4, finite adeles; Mathlib ideal factorization and
  `Ideal.quotientInfRingEquivPiQuotient`; AA.1.2; AA.0.3's single-place factor splitting;
  ReductiveGroupsPartII, RG2.0.3, integral points and congruence kernels.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `N = 𝒪_F`, all three groups are `GL₂(Ô_F)`.
  - For `N` proper, `[[1,1],[0,1]]` lies in `K₁(N)` but not `K(N)`.
  - A nonprincipal nonzero ideal defines the same entrywise subgroups without any
    principal-ideal hypothesis; over `ℚ`, `N = (n)` gives the existing natural-number levels.
  - At the zero ideal the entry conditions still make sense, but the principal level is
    `{I₂}` and is not open; compact openness is asserted only for `N ≠ 0`.

- **Integral adelic congruence.** For `N : ℕ` and finite adeles `x,y`, define
  congruence of `x` and `y` modulo `N` by `x − y ∈ Nℤ̂`. For `N > 0` this is
  equivalent to `(x − y)/N ∈ ℤ̂` ([Milne], §4, definition of congruence subgroups,
  p. 42). The `N = 0` extension is an owned deduction from divisibility: `0ℤ̂ = {0}`.
  *Lean:* none; specified in the README only.
  **Checks.** Modulo zero it is equality; `1 ≡ 0 mod 1`; `1` is not
  congruent to `0` modulo `2`. The inverse-based expression at `N = 0`
  equals zero even for the pair `(1,0)`, so it cannot define congruence modulo zero.
- **Raw Möbius action and the Mathlib folded action.** For `g ∈ GL₂(ℝ)` and `z ∈ ℂ` with
  `Im z ≠ 0`, prove that the raw Möbius maps of `GL₂(ℝ)` induce an action on `ℍ± = ℂ ∖ ℝ`, that
  folding the lower half-plane by conjugation is equivariant for this action and Mathlib's
  `glAction` on `ℍ`, and that for positive determinant the raw and folded formulas coincide;
  `diag(1, −1)` sends `i` to `−i` in the raw action and fixes `i` in `glAction`.
  This is an owned matrix deduction from Mathlib `UpperHalfPlane.denom_ne_zero_of_im`,
  `UpperHalfPlane.moebius_im`, `UpperHalfPlane.coe_smul` and
  `UpperHalfPlane.coe_smul_of_det_pos`
  (`Analysis/Complex/UpperHalfPlane/MoebiusAction.lean`, lines 58–83 and 188–193).
  *Needs:* these four declarations; Mathlib `UpperHalfPlane.glAction`,
  `Matrix.GeneralLinearGroup.det`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For `diag(1, −1)`, the raw image of `i` is `−i` and its folded image is `i`.
  - For `[[1,1],[0,1]]`, the raw image of `i` is `1+i`, agreeing with the folded action.
  - For `[[2,0],[0,1]]`, the raw image of `−i` is `−2i`; folding it gives `2i`, the
    folded action on the folded input.
- **`GL_2(ℝ)` modulo `ℝ^× SO(2)`.** Prove that `GL_2(ℝ)/ℝ^× SO(2)` is homeomorphic to `ℍ^± = ℂ ∖ ℝ`
  through `g ↦ g·i`, equivariantly for the Möbius action, and that `GL_2(ℝ)^+` acts transitively
  on `ℍ` with stabilizer `ℝ^× SO(2)` at `i`. This is an owned matrix deduction from the
  raw action and Mathlib `UpperHalfPlane.denom_ne_zero_of_im` and `UpperHalfPlane.moebius_im`
  (`Analysis/Complex/UpperHalfPlane/MoebiusAction.lean`, lines 58–83): the stabilizer equation
  is `g·i = i` iff `g = [[a,b],[−b,a]]` with `a²+b² > 0`, giving `ℝ^× SO(2)`.
  The continuous section `x+iy ↦ [[y,x],[0,1]]` for `y ≠ 0` gives the orbit-quotient
  homeomorphism; `y > 0` gives positive-determinant transitivity. *Needs:* AA.5.2,
  raw Möbius action; the two cited Mathlib declarations.
  *Lean:* none; specified in the README only.

  **Checks.**
  - The matrix `[[0,1],[−1,0]]` fixes `i` and lies in `SO(2)`.
  - The section at `2+3i` is `[[3,2],[0,1]]`, of determinant `3`, and sends `i` to `2+3i`.
  - The section at `−i` has determinant `−1`; the positive-determinant orbit of `i`
    therefore excludes `−i`.
- **Congruence groups of the `GL₂` components.** For compact open subgroups `U′ ⊂ U` of
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
  *Lean:* in `AdelicExamples.GL2`, `diag`, `toReal`, `componentGroup`, `componentGroupReal`
  define the groups used by the upper-half-plane decomposition.

  **Checks.**
  - At principal level `1`, the component of `1` has group `Γ(1) = SL₂(ℤ)`.
  - The scalar `−1` belongs to the component group at principal level `2`, but not at
    principal level `3`.
  - The matrix `[[1,1],[0,1]]` belongs to `Γ₀(3)` and `Γ₁(3)` but not `Γ(3)`.

- **The `GL_2/ℚ` quotient and the upper half-plane.** For `G = GL_2` over `ℚ`, `K_∞ = ℝ^× SO(2)`
  and `U ⊂ GL_2(𝔸_f)` compact open, prove

  `G(ℚ)\G(𝔸)/K_∞U ≃ ⊔_{c ∈ ℚ_{>0}\𝔸_f^×/det U} Γ_c\ℍ,`

  where `Γ_c = GL_2(ℚ)^+ ∩ g_c U g_c⁻¹` for `g_c ∈ GL_2(𝔸_f)` with `det g_c = c`, acting on `ℍ` by
  Möbius transformations; for `det U = ℤ̂^×` there is a single component ([Milne], Lemma 5.13,
  p. 57; Lemma 5.11, p. 56, supplies the rational orientation reduction from `ℍ±` to `ℍ`).
  The Lean statement (`AdelicExamples.GL2.exists_componentHomeomorph`) works in the model
  `GL_2(ℚ)^+ \ (ℍ × GL_2(𝔸_f)/U)` (`AdelicExamples.GL2.LevelSpace`) over `FiniteAdeleRing ℤ ℚ`; its identification with
  `LevelMaps.LevelQuotient` for `GL_2` (finite adeles over `𝓞_ℚ`, `K∞ = ℝ^×SO(2)`), sending
  `[(g_∞, g_f)]` with `det g_∞ > 0` to `[(g_∞ · i, g_f)]`, is part of this target and is
  specified in the README only. *Needs:* AA.3.4; AA.4.5; AA.4.2; Tau Ceti
  `Matrix.SpecialLinearGroup.map_intCast_zmod_surjective`; AA.5.2, including the congruence
  groups of the components; Mathlib `Matrix.GeneralLinearGroup.det`; AA.4.4.
  *Lean:* `AdelicExamples.GL2.exists_componentHomeomorph`, with `AdelicExamples.GL2.Af`,
  `AdelicExamples.GL2.ratPos`, `AdelicExamples.GL2.Components`, `AdelicExamples.GL2.levelSetoid`
  and `AdelicExamples.GL2.LevelSpace`.

  **Checks.**
  - For `U = GL₂(ℤ̂)`, there is one component, `SL₂(ℤ)\ℍ`.
  - For `U = K(3)`, there are two components, each `Γ(3)\ℍ` when the representatives lie
    in `GL₂(ℤ̂)`.
  - The rational reflection `diag(1,−1)` sends the raw pair `(−i,1)` to
    `(i,diag(1,−1))`; orientation reduction acts on the finite factor as well.
- **Principal congruence level.** For `N ≥ 1` and `U = K(N) = ker(GL_2(ℤ̂) → GL_2(ℤ/N))`, prove
  `det K(N) = {x ∈ ℤ̂^× : x ≡ 1 mod N}`, that the components are indexed by `(ℤ/N)^×`, and that
  each `Γ_c` is `Γ(N) = ker(SL_2(ℤ) → SL_2(ℤ/N))` when the representatives `g_c` are chosen in `GL₂(ℤ̂)` (other choices give conjugate groups) (Mathlib `CongruenceSubgroup.Gamma`) ([Milne],
  Lemma 5.13, p. 57). The
  canonical bijection is the determinant map on components followed by reduction of `det` modulo
  `N`, and no other bijection is singled out. *Needs:* AA.5.2; Mathlib `CongruenceSubgroup.Gamma`; AA.3.4.
  *Lean:* none; specified in the README only.
- **Riemann-surface structure and change of level for `GL₂` quotients.** Let
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
  *Lean:* none; specified in the README only.

  **Checks.**
  - For each `u ∈ ℤ̂^×`, `diag(u,1)` lies in both `K₀(N)` and `K₁(N)` and has determinant `u`.
  - At `N = 1`, both levels equal `GL₂(ℤ̂)` and give the connected modular quotient.
  - At `N = 3`, these determinant images contain `−1`, whereas the determinant image of `K(3)` does not.

- **`GL₂` components for `O(2)` and `SO(2)`.** For `G = GL₂` over `ℚ`, `N ≥ 1` and principal finite
  level `K(N) = ker(GL₂(ℤ̂) → GL₂(ℤ/N))`, prove that the quotient with `K∞ = ℝ^× SO(2)` (the raw
  Möbius action on `ℍ±`) has components `(ℤ/N)^×` and raw real symmetric space `ℍ±` before
  rational orientation reduction, and that with `K∞ = ℝ^× O(2)` (the folded action on `ℍ`) the
  real space is the folded `ℍ` and the component set is `(ℤ/N)^×/{±1}`.
  At `N = 3` these cardinalities are respectively two
  and one ([Milne], Theorem 5.17, pp. 59–61; zero-dimensional example, p. 63). *Needs:* AA.5.2.
  *Lean:* none; specified in the README only.

### 5.3 Definite quaternion groups

- **Class sets and compactness for a quaternion algebra.** (*quaternion-class-sets*) For a
  quaternion algebra `D` over a number field `F`, realize `GL_1(D)` as the closed subgroup of the
  left-regular `GL(D)` cut out by commuting with right multiplication by a basis of `D`, so that
  its points in every commutative `F`-algebra `A` are `(D ⊗[F] A)^×`, naturally in `A`. At
  `A = 𝔸_{F,f}` identify the point topology of AA.1.2 with the units topology of the finite free
  `𝔸_{F,f}`-algebra `D ⊗[F] 𝔸_{F,f}`, and the diagonal with the inclusion of `D^×`. For every
  compact open `U ⊂ (D ⊗_F 𝔸_{F,f})^×`, deduce from *class-number-finite*
  (`Reduction.finite_classes`) for this group that `Cl(U) = D^× \ (D ⊗_F 𝔸_{F,f})^× / U` is
  finite, with representatives `x_1, …, x_h` and factorizations `g = γ x_i u`, and that the
  refinement map `Cl(U′) → Cl(U)` is surjective for `U′ ⊂ U`. Deduce compactness of
  `D^× \ (D ⊗_F 𝔸_{F,f})^×` as the finite union of the images of the compact sets `x_i U`.
  Neither a division hypothesis nor definiteness is used. Full-adelic norm-one compactness uses
  AA.3.4. *Needs:* AA.1.2; AA.1.5; AA.3.4 (*class-number-finite*); Mathlib `DoubleCoset`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For Hamilton's algebra over `ℚ` at the Hurwitz maximal-order level, `Cl(U)` has one element:
    every right ideal of the Hurwitz order is principal ([Voight], Lemma 11.2.1 and
    Proposition 11.3.4).
  - For `D = M₂(ℚ)` and `U = GL₂(ℤ̂)`, `Cl(U)` has one element, since
    `GL₂(𝔸_{ℚ,f}) = GL₂(ℚ) GL₂(ℤ̂)`; the theorem is the `GL₂` case of *class-number-finite*.
  - Openness cannot be dropped: at `U = {1}`, which is compact, the class set is
    `D^× \ (D ⊗ 𝔸_{ℚ,f})^×`, a quotient of an uncountable group by a countable one, so it is
    infinite.
- **Stabilizers at compact levels for a totally definite quaternion algebra.**
  (*definite-quaternion-stabilizers*) Let `F` be totally real, `D` totally definite (ramified
  at every real place), `U ⊂ (D ⊗_F 𝔸_{F,f})^×` a compact subgroup and `x` a finite adelic
  unit. Put `Γ_x = D^× ∩ xUx⁻¹`, the group `Reduction.levelArithmetic x U` of `GL_1(D)`, and
  `Z_x = Γ_x ∩ F^×`, which equals `F^× ∩ U` because `F^×` is central. Prove that `Z_x` is
  central in `Γ_x`, that `Γ_x / Z_x` is finite, and that `Γ_x` is finite when `F = ℚ`. Conjugation
  by `x` identifies `Γ_x` with `x⁻¹D^×x ∩ U`.
  The proof is owned here. A compact subgroup lies in a compact open subgroup `U′` (intersect the
  finitely many `U`-conjugates of a compact open subgroup and multiply by `U`), and
  `Γ_x ∩ F^× = Z_x`, so `Γ_x / Z_x` injects into the quotient for `U′`; assume `U` compact open.
  The norm-one group `D¹(F ⊗ ℝ)` is a product of copies of the Hamilton norm-one group, hence
  compact, and `D¹(F)` is discrete in `D¹(𝔸_F)` (AA.1.3), so `Γ_x ∩ D¹` is finite. The reduced
  norm sends `Γ_x` into `𝒪_F^×` and `Z_x` onto `Z_x²`; `Z_x` has finite index in `𝒪_F^×`
  (AA.5.1), so `Z_x²` has finite index in the finitely generated group `𝒪_F^×`. If
  `Nrd(γ) = Nrd(z)` with `z ∈ Z_x`, then `γz⁻¹ ∈ Γ_x ∩ D¹`; hence `Γ_x / Z_x` is finite. Over
  `ℚ`, `ℚ^× ∩ U` lies in the compact subgroup `U ∩ 𝔸_{ℚ,f}^×` of `𝔸_{ℚ,f}^×`, hence in `ℤ̂^×`,
  so it lies in `ℚ^× ∩ ℤ̂^× = {±1}`
  ([Loeffler], Proposition 3.1.4, arXiv v3 p. 15, for compact open levels of a group that is
  compact modulo its centre at infinity).
  *Needs:* *quaternion-class-sets*; AA.1.3; AA.4.6 (*quaternion-norm-images*); AA.5.1
  (units at level `U_Q`); Mathlib `NumberField.Units.rank`.
  *Lean:* none; specified in the README only.

  **Checks.**
  - For Hamilton's algebra over `ℚ` at the Hurwitz maximal-order level, the stabilizer of the
    single class is the unit group of the Hurwitz order, of order 24 ([Voight], Lemma 11.2.1 and
    Proposition 11.3.4),
    with `Z_x = {±1}` and quotient of order 12.
  - For `D = ℍ ⊗ ℚ(√2)`, totally definite over the real quadratic field `ℚ(√2)`, the maximal-order
    level gives `Z_x = 𝒪_F^×`, which contains `1 + √2` of infinite order, so `Γ_x` is infinite;
    `Γ_x / Z_x` is still finite. The finiteness of the whole stabilizer is special to `ℚ`.
  - Compactness cannot be dropped: for Hamilton's algebra at the noncompact level
    `U = (D ⊗ 𝔸_{ℚ,f})^×`, `Γ_x = D^×` contains `ℚ^×`, and `D^× / ℚ^×` is infinite because the
    units `1 + n i`, `n ∈ ℕ`, are pairwise non-proportional over `ℚ`.
- **Volume comparison under level change for a definite quaternion algebra.** For `D` definite
  over `ℚ` and compact open `U′ ⊂ U ⊂ (D ⊗ 𝔸_f)^×`, with `Γ_x = (D^× ∩ xUx⁻¹)/(ℚ^× ∩ U)` the
  finite stabilizers and `Cl(U) = D^× \ (D ⊗ 𝔸_f)^×/U`, prove

  `∑_{x ∈ Cl(U′)} 1/|Γ′_x| = ([U : U′] / [ℚ^× ∩ U : ℚ^× ∩ U′]) · ∑_{x ∈ Cl(U)} 1/|Γ_x|`

  ([Arthur], §2, p. 12, with the central quotient and its index factor obtained from
  AA.4.5). *Needs:* *quaternion-class-sets*; *definite-quaternion-stabilizers*, specialized to
  `F = ℚ`; AA.4.5; AA.4.4.
  *Lean:* none; specified in the README only.

  **Checks.**
  - At `U′ = U` the level and central indices are both one.
  - If `ℚ^× ∩ U′ = ℚ^× ∩ U`, the weighted sum is multiplied by `[U : U′]`.
  - For Hamilton's algebra at the Hurwitz maximal-order level, every right ideal of the
    Hurwitz order is principal and its unit group has order 24 ([Voight], Lemma 11.2.1 and
    Proposition 11.3.4), so the single class has a stabilizer of order 24 and a central
    subgroup `{±1}`, giving weighted sum `1/12`. Fix an identification of the Hurwitz order
    at 3 with `M₂(ℤ₃)` and let `U₁(9)` be the level with bottom row `≡ (0,1) mod 9` at 3.
    Its index is the number `9² − 3² = 72` of primitive rows mod 9, and `ℚ^× ∩ U₁(9) = 1`, so the
    central index is two. A unit fixing a primitive row mod 9 has
    `nrd(γ − 1) = 2 − trd(γ) ≡ 0 mod 9`; the unit traces are `−2, −1, 0, 1, 2`, so only
    `γ = 1` does. The 24 units act freely on the 72 rows, giving three classes with trivial
    stabilizers, and the formula gives `3 = (72/2) · (1/12)`. This detects the central-index
    denominator.

### Examples

The layer is itself the worked-example layer: `F^×\𝔸_F^1` is compact while `F^×\𝔸_F^×` is not;
the `GL_1` level quotients `X_Q` are disjoint unions of `(S¹)^{r₁+r₂−1}` indexed by an extension
of the narrow class group; `diag(1, −1)` distinguishes the raw and folded half-plane actions;
`X_{K(N)}` has `(ℤ/N)^×` components for `SO(2)` and `(ℤ/N)^×/{±1}` for `O(2)` (two and one at
`N = 3`); and a totally definite quaternion algebra has compact norm-one quotient, its
stabilizers at compact open levels are finite modulo their intersection with the central units
`F^×`, and the full stabilizers are finite over `ℚ`.

### Dependencies

Layers AA.1–AA.4; Mathlib's idele class group, unit lattice, upper half-plane action, arithmetic
subgroups, congruence subgroups and quaternion algebras; Tau Ceti's `G_m` and `SL_2` comparison
lemmas; GlobalNumberFields, layers 4 and 6; AlgebraicTopology, stage 6; FuchsianOrbifolds,
layers 0, 1, 4 and 5; Tau Ceti's quaternion norm form and its base change.

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

| Consumer | Supplied target | Consumer bridge |
|---|---|---|
| AutomorphicLFunctionsAndLocalFactors, AL.2, *gl2-newvectors* | AA.0.1 *local-haar-character*; AA.1.5 *local-congruence-levels*; AA.5.2 *number-field-congruence-levels* | Its local newvector `K₀` and last-row `K₁` are compared with the single-place comaps; its representation theory uses the same Haar normalization. |
| GL2AutomorphicRepresentationsAndTransfer, R16.1.3 | AA.0.4 *adelic-borel-structure*, *idele-haar-character*; AA.1.5 *local-congruence-levels* | Its local-to-adelic level comparison uses the product factors and native units topology. |
| HilbertModularVarietiesAndShimuraCurves, R18.3 | AA.4.2 *quaternion-norm-one-strong-approximation*; AA.4.4 *s-arithmetic-double-cosets* | Quaternionic components use the specified split finite place and the actual away-level stabilizers. |
| AutomorphicFormsOnReductiveGroups, §0.3 | AA.0.1 *linear-haar-change-of-variables*; AA.0.4 *adelic-borel-structure*, *idele-haar-character* and `μ_𝔸` | Integration uses the single product Borel structure and the normalized Haar measure; the additive rational fundamental domain has mass `|d_F|^{1/2}`. |
| KleinianGroups, Layer 3, `isDiscrete_bianchi` | AA.3.4 arithmetic discreteness for the integral `SL₂` level over an imaginary quadratic field | KleinianGroups identifies the integral level and the chosen complex embedding, then passes through the finite centre to its Bianchi subgroup of `PSL₂(ℂ)`. |

For this specialization take `x = 1` and the compact open level `∏_{v finite} SL₂(𝒪_v)`;
identify its rational preimage with `SL₂(𝒪_F)`. KleinianGroups uses its explicit
`ι : F →+* ℂ` to identify `F_∞` with `ℂ` and transport the archimedean subgroup topology.
It derives projective discreteness by passing through the finite centre of `SL₂(ℂ)` to
its image `bianchi F ι` in `PSL₂(ℂ)`; this adapter consumes AA.3.4 rather than giving a
second arithmetic-discreteness proof.

**Algebraic Cartan comparison for locally symmetric spaces.**
ArithmeticLocallySymmetricSpaces, ALS.0.1–0.3
owns the following downstream bridge. For a connected reductive `ℚ`-group `G`, an AA.3.7
inverse-adjoint datum induces `LocallySymmetric.IsCartanInvolution` on `G_ℝ`: its twisted real
form embeds as a closed subgroup of the unitary group of the realizing positive form.
Conversely, every real algebraic involution of `G_ℝ` satisfying that predicate admits an AA.3.7
realization with a faithful rational representation and a positive real form. The compact
subgroup on both presentations is literally `Fix(θ) ⊂ G(ℝ)`, including all its components.
For rational groups, AA.3.7 owns existence of the inverse-adjoint datum; ALS obtains its
number-field existence statement by applying this theorem to `Res_{F/ℚ} G` and the forward
comparison. The converse uses conjugacy of Cartan involutions and transports the positive form
in the same rational representation. ALS retains existence for arbitrary real groups.
[Milne], Theorem 1.16 and Example 1.17(b)–(c), p. 15; [BHC], §§1.6–1.9, pp. 489–492.
*Needs in ALS:* AA.3.7; the predicate and conjugacy API of ALS.0.1.
*Lean:* none; specified as a downstream contract in the README only.

**Checks.**
- For `GL_n`, inverse transpose with the identity form gives the compact twist `U(n)` and
  the real fixed subgroup `O(n)`, including its two components when `n ≥ 1`.
- For `SL₂`, the compact twist is `SU(2)` and both fixed subgroups are `SO(2)`.
- For `G_m`, inversion has compact twist `S¹` and fixed subgroup `{±1}`; the identity
  involution has noncompact twist `ℝ^×` and satisfies neither Cartan presentation.

The generic adelic quotient and Tamagawa-measure interfaces referenced as `TamagawaMeasures`
in IntegralLattices are supplied here by AA.1–AA.2 and the finite-volume targets of AA.3.4.
Among the downstream orthogonal applications,
GeometryOfNumbersAndQuadraticArithmetic, §3.3
owns the number-field Tamagawa theorem for `SO(Q)` in rank at least three, the orthogonal gauge
forms and their comparisons, maximal integral models and their canonical local volumes, the
adelic mass identity and the maximal-lattice mass formula. Its
Scope and ownership
places strong approximation for `Spin`, Eichler's theorem, mass formulas for arbitrary genera
and dyadic density formulas for arbitrary lattices, extending the maximal case, in
OrthogonalTamagawaAndLatticeMass. That consumer uses the shared inputs with their rank and
maximality hypotheses.
The finite-image Artin factors, induction and leading-coefficient statements referenced under
`ArtinRepresentations` in LFunctions are owned by AA.2.4; LFunctions supplies the Hecke analytic
statements used there. These ownership assignments concern the stated generic-measure and
finite-image targets, rather than all subjects envisaged under either successor name.

## References

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
- **Platonov–Rapinchuk**: V. Platonov and A. Rapinchuk, *Algebraic Groups and Number Theory*,
  Pure and Applied Mathematics 139, Academic Press, 1994. Locators use printed pages.
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
- **Sutherland**: Andrew V. Sutherland, *18.785 Number theory I, Lecture 23: The ring of adeles,
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
- **LT**: Michael Lipnowski, Jacob Tsimerman, *How large is `A_g(F_q)`?*. Duke Mathematical
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
- **BGST**: Benjamin Bakker, Thomas W. Grimm, Christian Schnell and Jacob Tsimerman, *Finiteness
  for self-dual classes in integral variations of Hodge structure*. Author PDF, 2021 edition,
  including §28 and Proposition 28.1. <https://benjamin-bakker.github.io/finiteness.pdf>
- **Orr–Schnell**: Martin Orr and Christian Schnell, *Correction to the article Height bounds and
  the Siegel property*. Algebra & Number Theory 17 (2023), pp. 1231–1237.
  <https://msp.org/ant/2023/17-6/ant-v17-n6-p04-s.pdf>
- **Orr**: Martin Orr, *Height bounds and the Siegel property*. arXiv:1609.01315v6, 19 July 2023,
  with the Orr–Schnell 2023 corrections; locators use its lettered subsections and pagination.
  <https://arxiv.org/abs/1609.01315v6>
- **Loeffler**: David Loeffler, *Overconvergent algebraic automorphic forms*. Proceedings of
  the London Mathematical Society 102 (2011), pp. 193–228; locators use arXiv:0901.2279v3.
  <https://arxiv.org/abs/0901.2279v3>
- **Voight**: John Voight, *Quaternion Algebras*, Graduate Texts in Mathematics 288,
  Springer, 2021, Chapter 11, §§11.2–11.3. Locators use printed numbering.
- **BHV**: Bachir Bekka, Pierre de la Harpe and Alain Valette, *Kazhdan's Property (T)*. Author
  manuscript of 23 February 2007; locators use its pagination rather than that of the Cambridge
  2008 book.

- **Casselman**: W. Casselman, *Introduction to the theory of admissible representations of
  p-adic reductive groups*. Draft of 1 May 1995; locators use its printed pages.
  <https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf>
- **Marzec–Neururer**: J. Marzec and M. Neururer, *L-functions and their applications*,
  25 February 2020, Chapter 5, pp. 55–67.
  <https://jmarzec.ukw.edu.pl/marzec,neururer-lecture.pdf>
- **Stacks**: The Stacks Project, Tags [0245](https://stacks.math.columbia.edu/tag/0245),
  [04TY](https://stacks.math.columbia.edu/tag/04TY) and
  [04SK](https://stacks.math.columbia.edu/tag/04SK).
