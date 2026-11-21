# Roadmap: complex tori, varying lattices and logarithmic transforms

**Summary.** A complex torus is the quotient `E/L` of a finite-dimensional complex vector space
`E` by a lattice `L`, a discrete subgroup that spans `E` over `ℝ`. This roadmap builds complex
tori, holomorphic families of them whose lattice varies, quotients of such families by groups
acting through affine maps of the fibres, and the logarithmic transforms of Kodaira, which cut a
fibre out of a torus fibration and reglue a multiple fibre in its place. Every object is an orbit
quotient. A family over a complex manifold `Y`, Hausdorff and second countable, is given by a free
abelian group `Λ` of finite rank and a period map: for each `y`, an injective homomorphism
`Π(y) : Λ → E` whose image is a lattice, holomorphic in `y`. The family is the quotient
`(Y × E)/Λ` of `Y × E` by `λ · (y, v) = (y, v + Π(y)λ)`, and its fibre over `y` is the torus
`E/Π(y)Λ`.

The headline theorems are these. A lattice quotient `E/L` is a compact connected complex Lie
group whose integral homology is the exterior algebra on `L`; a complex-linear map `f` carrying
`L` into a lattice `L'` induces a holomorphic homomorphism whose kernel has a torus as identity
component and `(L' ∩ f(E))/f(L)` as group of components. For a period map as above,
`(Y × E)/Λ` is a complex manifold, the quotient map from `Y × E` is a covering map and a local
biholomorphism, and the projection to `Y` is a holomorphic submersion; the family is smoothly
trivial over `Y`, and holomorphically locally trivial when its periods vary by complex-linear
automorphisms, but not in general. If `A` is an automorphism of an abelian group `T` with
`A^m = 1`, the `k`-th power of `x ↦ Ax + t` has a fixed point exactly when `∑_{i<k} A^i t` lies in
`(1 − A^k)T`, and for `T = E/Λ`, with `E` a real vector space, the connecting map
`H¹(C_m, T) → H²(C_m, Λ)` is an isomorphism sending the class of `t` to the class of the norm of a
lift of `t`. Finally, let a cyclic group of order `m` act freely on a family over a disc by affine
maps lifting the rotation `z ↦ ζz`, `ζ = exp(2πi/m)`. The quotient maps to a disc by `t = z^m`,
its central fibre has multiplicity exactly `m`, and the normal bundle of that fibre is the line
bundle of the character `ζ`. When the action is by translations and the family is the pullback
by `z ↦ z^m` of a family over the `t`-disc, a logarithmic gauge identifies the quotient minus its
central fibre with that family over the punctured `t`-disc, so the quotient can be glued into any
complex manifold containing that family over the `t`-disc.

ComplexManifolds supplies the complex structure on quotients by free properly discontinuous
actions, open gluing of complex manifolds, and holomorphic line bundles, including normal and
canonical bundles and the line bundles of characters of a deck group. The completed
UniversalCovers roadmap and AlgebraicTopology supply covering spaces, fundamental groups, the
homology of tori and fibre transport; GeometricTopology supplies the smooth collars along which
the logarithmic transform is reglued. AbelianSchemesAndArithmeticModuli and
BallQuotientsAndComplexHyperbolicLattices build on the tori and families here, and
GeometryOfNumbersAndQuadraticArithmetic on the period-two norm and difference maps.

Milestone 1 treats a fixed torus `E/L`, Milestone 2 families with varying periods, Milestone 3
their quotients by groups acting on the base with linear or affine lifts and the monodromy of the
result, and Milestone 4 the algebra and cohomology of a cyclic group acting on an abelian group by
affine maps. Milestone 5 combines Milestones 3 and 4 over a disc to build multiple fibres, and
Milestone 6 builds the logarithmic gauge and reglues.

## How to read the build

Milestones 1, 2 and 3 build on each other in order. Milestone 4 is algebra and depends on no other
milestone, except that the base change of §4.6 uses Milestone 2. Milestone 5 uses Milestones 2–4
with the holomorphic line bundles of ComplexManifolds, and Milestone 6 uses Milestone 5 with the
open gluing of ComplexManifolds and the collars of GeometricTopology.

Item `n` of Milestone `k` is §`k.n`, which other roadmaps also cite as Milestone `k.n`.
Milestone 4's torus-level affine algebra is §§4.1–4.4 and its integral connecting class §§4.5–4.6.
Each section's *Needs:* line lists what its statements and their route use, so that a target proved
another way is not blocked behind an unrelated section. Where the pinned Tau Ceti has the
declarations that realise an item, an *In Tau Ceti:* line after its statement names them.

## Conventions

1. **Lattices.** `E` is a finite-dimensional complex normed vector space. A lattice in `E` is
   `L : Submodule ℤ E` with its subtype topology, `[DiscreteTopology L]` and `[IsZLattice ℝ L]`;
   `IsZLattice` says that `L` spans `E` over `ℝ`, so no second rank witness is added, and no
   statement asks for a chosen basis or a full-rank certificate. The torus of `L` is Mathlib's
   additive orbit quotient `AddAction.orbitRel.Quotient L E` for translation, written `E/L`,
   never a tagged copy or a set of chosen representatives.
2. **Period families.** `Λ` is a finitely generated free abelian group and `Y` a complex manifold
   modelled on `I`, with `[T2Space Y]` and `[SecondCountableTopology Y]` stated explicitly. A
   period family is a map `Π : Y → (Λ →ₗ[ℤ] E)` with these hypotheses, written out on every
   statement that uses them and never bundled into a structure: coordinatewise holomorphy
   `∀ λ, ContMDiff I 𝓘(ℂ, E) ∞ (fun y ↦ Π y λ)`, injectivity of every `Π y`, and
   `[DiscreteTopology (LinearMap.range (Π y))]` and `[IsZLattice ℝ (LinearMap.range (Π y))]` for
   every `y`. The lattice acts on `Y × E` by `λ +ᵥ (y, v) = (y, v + Π y λ)`, and the total space is
   the orbit quotient `(Y × E)/Λ` of this action. Its fibre over `y` is identified with
   `E/LinearMap.range (Π y)`, the orbit quotient of Convention 1, not with a tagged torus type.
3. **Two projections.** `q : Y × E → (Y × E)/Λ` is the orbit map, a covering map and a local
   biholomorphism. `p : (Y × E)/Λ → Y`, descended from `Prod.fst`, is a holomorphic submersion with
   compact torus fibres, and is not a local diffeomorphism once `E ≠ 0`. A quotient by a group is
   always the orbit quotient of the action, and a projection to another base is a separate map.
4. **Monodromy** acts on the single lattice `Λ`; its action on the homology of the fibres is
   derived functorially, through exterior powers. A basis of `Λ` gives coordinate statements,
   never a second matrix-valued representation.
5. **Linear parts.** The cyclic algebra of Milestone 4 takes an additive automorphism `A : T ≃+ T`
   of an abelian group and assumes no holomorphy. The analytic constructions of Milestones 3 and 5
   take complex-linear equivalences of `E` preserving the lattice in both directions, and the
   automorphism they induce on a torus is biholomorphic; an additive torus automorphism is
   accepted there only together with the holomorphy of it and of its inverse. A lattice
   automorphism alone is not analytic input.
6. **Orders and cyclic groups.** An affine map is *`m`-periodic*, or *of order dividing `m`*, when
   its `m`-th power is the identity, and *of exact order `m`* when moreover no smaller positive
   power is the identity. `T[m]` is the `m`-torsion subgroup `AddSubgroup.torsionBy T m`, not the
   set of elements of exact order `m`. In Milestone 4, `C_m` is `Multiplicative (ZMod m)` with
   generator `ofAdd 1`; in Milestones 5–6 the group acting on a disc is `rootsOfUnity m ℂ` acting by
   rotation, identified with `C_m` by sending `ζ = exp(2πi/m)` to `ofAdd 1`.
7. **Meridians.** The meridian of a punctured disc `{0 < ‖z‖ < R}` is the counterclockwise loop
   `s ↦ ρ·exp(2πis)` for a radius `0 < ρ < R`; its free homotopy class does not depend on `ρ`.
   Reversing it inverts monodromy and negates additive twist data (§§3.5, 6.6).
8. **Varying lattices are kept.** A cyclic quotient or a logarithmic transform is built on the
   varying period family; a product with one fixed torus is never an intermediate construction.

## Milestone 1: fixed complex tori

Let `L : Submodule ℤ E` be a lattice (Convention 1). The milestone treats every compact complex
torus, with no polarization and no algebraicity hypothesis (Birkenhake–Lange, Chapter 1, for the
quotient, its morphisms and the period lattice).

### 1.1 The translation quotient

Prove that translation by `L` on `E` is free and properly discontinuous, and use the orbit
quotient `E/L` with Mathlib's quotient atlas `AddAction.instChartedSpaceQuotient`. Apply the
complex quotient theorem of ComplexManifolds Milestone 4, in its specialisation to the model
`𝓘(ℂ, E)`, to prove that `E/L` is a complex manifold and that the orbit map `E → E/L` is a local
biholomorphism. The orbit map is moreover a covering map, by Mathlib's
`isAddQuotientCoveringMap_quotientMk_of_properlyDiscontinuousVAdd`.
*Needs:* Convention 1; ComplexManifolds Milestone 4; Mathlib
`AddAction.instChartedSpaceQuotient`,
`isAddQuotientCoveringMap_quotientMk_of_properlyDiscontinuousVAdd`.
*In Tau Ceti:* `Submodule.properlyDiscontinuousVAdd_of_discreteTopology`, `TauCeti.instIsManifoldAddQuotient`, `TauCeti.isLocalDiffeomorph_addQuotientMk`.

**Checks.**
- For `E = ℂ` and `L = ℤ`, `IsZLattice ℝ L` fails, since `L` spans only `ℝ`, and `ℂ/ℤ` is not
  compact: `z ↦ exp(2πiz)` identifies it with `ℂ ∖ {0}`. A notion of torus asking only for
  discreteness would admit it.
- For `E = ℂ` and `L = ℤ + √2·ℤ + iℤ`, `L` spans `ℂ` but is not discrete, as `ℤ + √2·ℤ` is dense in
  `ℝ`, and `ℂ/L` is not Hausdorff; the hypothesis `[DiscreteTopology L]` excludes it.

### 1.2 The Lie group

Descend addition, negation and zero from `E` to `E/L` and prove the Lie group laws: `E/L` is a
complex Lie group for the model `𝓘(ℂ, E)`, a `C^n` Lie group for every `n` and in particular a
holomorphic one. Prove that `E/L` is compact, from a fundamental domain of `L`, connected,
Hausdorff and second countable, and that a basis of `L` identifies it with `(ℝ/ℤ)^d` as a
topological group. Connectedness and the Hausdorff property are Mathlib's
`Quotient.instConnectedSpace` and `t2Space_of_properlyDiscontinuousVAdd_of_t2Space`.
*Needs:* §1.1; Mathlib `Quotient.instConnectedSpace`,
`t2Space_of_properlyDiscontinuousVAdd_of_t2Space`, `IsZLattice`.
*In Tau Ceti:* `Submodule.instAddCommGroupOrbitRelQuotient`, `Submodule.instLieAddGroupOrbitRelQuotient`, `Submodule.instCompactSpaceOrbitRelQuotient`, `Submodule.instSecondCountableTopologyOrbitRelQuotient`, `Module.Basis.orbitRelQuotientLatticeEquiv`.

### 1.3 Induced homomorphisms

Let `L ⊆ E` and `L' ⊆ E'` be lattices and `f : E →ₗ[ℂ] E'` complex-linear with
`L.map (f.restrictScalars ℤ) ≤ L'`. Construct the induced homomorphism `[v] ↦ [f v]` from `E/L` to
`E'/L'`, and prove that it is holomorphic and compatible with identities, composites and
products.

Prove that its kernel is `f⁻¹(L')/L`, a closed subgroup of `E/L`, and that it is a closed complex
Lie subgroup: `L ∩ ker f` is a lattice in `ker f`; the induced map `ker f/(L ∩ ker f) → E/L` is a
closed embedding onto the identity component of the kernel and a holomorphic immersion, so that
this identity component is an embedded complex submanifold and a complex Lie group for the
induced structure; the group of components of the kernel is `(L' ∩ range f)/f(L)`; and the
kernel, the finite union of the translates of its identity component by representatives of that
group, is a closed embedded complex submanifold. The component group is computed in the form
`(f⁻¹(L')/L)/(image of ker f) ≃ (L' ∩ range f)/(L' ∩ f(L))`, which needs no hypothesis
`f(L) ⊆ L'`; under that hypothesis `L' ∩ f(L) = f(L)`.

For a continuous complex-linear equivalence `e : E ≃L[ℂ] E'` with `e(L) ⊆ L'`, prove that the
induced map is bijective if and only if `e(L) = L'`, and that it is then a biholomorphic
isomorphism whose inverse is induced by `e⁻¹`.
*Needs:* §§1.1–1.2; Mathlib `Manifold.IsImmersion`.
*In Tau Ceti:* `Submodule.orbitRelQuotientMap`, `Submodule.contMDiff_orbitRelQuotientMap`, `Submodule.orbitRelQuotientMap_id`, `Submodule.orbitRelQuotientMap_comp`, `Submodule.orbitRelQuotientProdAddEquiv_orbitRelQuotientMap_prodMap`, `Submodule.orbitRelQuotientProdDiffeomorph`, `Submodule.ker_orbitRelQuotientMap`, `Submodule.isClosed_orbitRelQuotient_mk_image_preimage`, `ZLattice.isZLattice_comap_ker_subtype`, `Submodule.isClosedEmbedding_orbitRelQuotientMap_subtype`, `Submodule.range_orbitRelQuotientMap_ker_subtype`, `Submodule.orbitRelQuotientComapQuotientEquiv`, `Submodule.orbitRelQuotientMap_bijective_iff`, `Submodule.orbitRelQuotientDiffeomorph`.

**Checks.**
- For `f(z, w) = 2z` from `ℂ²` to `ℂ`, with `L = ℤ[i]²` and `L' = ℤ[i]`, the kernel is
  `(½ℤ[i] × ℂ)/ℤ[i]²`: its identity component is `(0 × ℂ)/(0 × ℤ[i]) ≅ ℂ/ℤ[i]` and its group of
  components is `ℤ[i]/2ℤ[i] ≅ (ℤ/2)²`, so it has four components.
- For the inclusion `f(z) = (z, 0)` of `ℂ` in `ℂ²`, with `L = ℤ[i]` and `L' = ℤ[i]²`, the kernel is
  trivial and `(L' ∩ range f)/f(L) = 0`, while `L'/f(L) ≅ ℤ[i]` is infinite: a group of components
  written `L'/f(L)` would be wrong.
- Multiplication by `2` on `ℂ` with `L = L' = ℤ[i]` has `e(L) = 2ℤ[i] ≠ L'`: the induced map is
  onto, with kernel `½ℤ[i]/ℤ[i]` of order four, so it is not bijective, as the criterion says.

### 1.4 Universal cover, fundamental group and homology

The orbit map `E → E/L` is a covering by the simply connected space `E` (§1.1). Prove that its
deck group is `L`, acting by translations, and that `E → E/L`, pointed at `0`, is isomorphic over
`E/L` to the universal cover `TauCeti.UniversalCover` of `E/L` based at `0`, compatibly with the
deck actions; the route is the uniqueness of pointed simply connected covers. Identify the
fundamental group of `E/L` with `L` through the displacement of lifted loops, naturally in the
induced maps of §1.3, and `H₁(E/L; ℤ)` with `L` by the displacement `Γ 1 − Γ 0` of a lift `Γ` of a
loop. For every `k`, identify `H_k(E/L; ℤ)` with `⋀^k L`, naturally in the maps of §1.3, so that
the integral homology of `E/L` is the exterior algebra on `L`; in degree one this is the previous
identification.
*Needs:* §§1.1, 1.3; the completed UniversalCovers roadmap (Tau Ceti `TauCeti.UniversalCover`,
`TauCeti.UniversalCover.isCoveringMap`,
`IsCoveringMap.exists_homeomorph_comp_eq_of_simplyConnectedSpace`); AlgebraicTopology §5.4 for the
homology of tori.
*In Tau Ceti:* `AddSubgroup.isAddQuotientCoveringMap_quotientMk`, `AddSubgroup.orbitRelQuotientDeckMulEquiv`, `AddSubgroup.orbitRelQuotientFundamentalGroupEquiv`, `AddSubgroup.orbitRelQuotientFundamentalGroupEquiv_map`, `AddSubgroup.orbitRelQuotientFirstHomologyEquiv`, `AddSubgroup.orbitRelQuotientFirstHomologyEquiv_loopClass`, `Submodule.orbitRelQuotientHomologyEquiv`, `Submodule.orbitRelQuotientHomologyEquiv_singularHomologyMap`.

**Checks.**
- Multiplication by `α ∈ ℤ[i]` on `ℂ/ℤ[i]` induces multiplication by `α` on `H₁ ≅ ℤ[i]` and
  multiplication by `|α|²`, the real determinant of `α`, on `H₂ = ⋀² ℤ[i] ≅ ℤ`; for `α = 1 + i`
  this is `2`, the degree of the map. A formula through the complex determinant would give `α`,
  which is not an integer.
- For `E = ℂ` and `L = ℤ[i]`, `H_k(E/L; ℤ)` is `ℤ`, `ℤ²`, `ℤ` for `k = 0, 1, 2` and `0` above, of
  ranks `binomial(2, k)`.

### Examples

- `ℂ/(ℤ + τℤ)` for `τ` in the upper half-plane is an elliptic curve; `τ` and `τ + 1` give the same
  lattice, so the same torus.
- `ℂ²/ℤ[i]²` is the product of two copies of `ℂ/ℤ[i]` as a complex Lie group
  (`Submodule.orbitRelQuotientProdDiffeomorph`).

### Dependencies

Tau Ceti's quotient-manifold theorems and its universal cover (supplier contracts).
ComplexManifolds Milestone 4 for the complex quotient theorem; the completed UniversalCovers
roadmap for the universal cover; AlgebraicTopology §5.4 for the homology of tori. Mathlib's
quotient atlas, covering maps and `IsZLattice`.

## Milestone 2: holomorphic families from varying periods

Fix a period family `Π : Y → (Λ →ₗ[ℤ] E)` with the hypotheses of Convention 2. Since every `Π y`
is injective with image a lattice, `Λ` has rank `d = 2 dim_ℂ E`. For families of this kind over
the Siegel upper half-space see Birkenhake–Lange, Chapter 8; the quotient-manifold arguments are
those of ComplexManifolds.

### 2.1 The period action

Prove that the period translation `λ +ᵥ (y, v) = (y, v + Π y λ)` is an additive action of `Λ` on
`Y × E` by homeomorphisms, and that it is free and properly discontinuous. First prove uniform
period separation: for every compact `K ⊆ Y` there is `c > 0` with `c ≤ ‖Π y λ‖` for all `y ∈ K`
and all `λ ≠ 0`; equivalently, after a choice of basis of `Λ`, the inverse period frames
`E → ℝ^d` are bounded uniformly on `K`. Deduce that for every `R` only finitely many `λ` have
`‖Π y λ‖ ≤ R` at some `y ∈ K`, and from this construct bounded fundamental representatives and
prove the local finiteness of orbits. Pointwise discreteness of each `range (Π y)` alone does not
give the estimate.
*Needs:* Convention 2.
*In Tau Ceti:* `TauCeti.periodAddAction`, `TauCeti.continuousConstVAdd_periodAddAction`, `TauCeti.isCancelVAdd_periodAddAction`, `TauCeti.properlyDiscontinuousVAdd_periodAddAction`, `TauCeti.exists_pos_le_norm_period_of_isCompact`, `TauCeti.exists_pos_mul_norm_le_norm_sum_smul_period_of_isCompact`, `TauCeti.finite_setOf_exists_norm_period_le`.

**Checks.**
- On the upper half-plane `ℍ` with `Λ = ℤ²` and `Π(τ)(a, b) = a + bτ`, a nonzero period has norm
  at least `min(1, Im τ)`: `|a + bτ| ≥ |b|·Im τ ≥ Im τ` when `b ≠ 0`, and `|a| ≥ 1` when `b = 0`.
  This is positive on each compact subset of `ℍ`, and no bound holds on all of `ℍ`: along `τ = it`
  the period `τ` has norm `t → 0`.

### 2.2 The total space

Give the orbit quotient `(Y × E)/Λ` the quotient atlas, and prove that it is a complex manifold
and that `q` is a covering map and a local biholomorphism.
*Needs:* §2.1; ComplexManifolds Milestone 4 (Tau Ceti `TauCeti.instIsManifoldAddQuotient`,
`TauCeti.isLocalDiffeomorph_addQuotientMk`); Mathlib `AddAction.instChartedSpaceQuotient`,
`isAddQuotientCoveringMap_quotientMk_of_properlyDiscontinuousVAdd`.
*In Tau Ceti:* `TauCeti.torusFamilyChartedSpace`, `TauCeti.isManifold_torusFamily`, `TauCeti.isAddQuotientCoveringMap_torusFamily_mk`, `TauCeti.isLocalDiffeomorph_torusFamily_mk`.

### 2.3 The projection, its fibres and the smooth trivialisation

Descend `Prod.fst` to the projection `p : (Y × E)/Λ → Y`, so that `p ∘ q = Prod.fst`. Prove that
`p` is a holomorphic submersion, and construct submersion coordinates at every point of the total
space. Prove that the fibre inclusion `[v] ↦ [y, v]` from `E/LinearMap.range (Π y)` to
`(Y × E)/Λ` is holomorphic and a homeomorphism onto `p⁻¹(y)`, and that it is a holomorphic
immersion, so that `p⁻¹(y)` is a closed embedded complex submanifold biholomorphic to
`E/LinearMap.range (Π y)`.

Choosing a basis `λ_1, …, λ_d` of `Λ` inside proofs, prove that the real-linear period frame
`F_y : ℝ^d ≃ E`, which sends `e_i` to `Π y λ_i`, is an isomorphism, by injectivity and
`IsZLattice`; that `F_y` and its inverse depend smoothly on `y`; and that `[y, v] ↦ (y, [F_y⁻¹ v])`
is a global smooth trivialisation `(Y × E)/Λ ≃ Y × ℝ^d/ℤ^d` over `Y`, for a real manifold `Y` and
so for the underlying real manifold of a complex one (ComplexManifolds Milestone 1). Prove that a
change of basis changes it by the integral change of coordinates on `ℝ^d/ℤ^d`. This
trivialisation is real-linear on fibres and is not holomorphic.

Prove that the family is holomorphically locally trivial with one fixed fibre wherever its periods
vary by complex-linear automorphisms (`exists_diffeomorph_torusFamily_of_periods_eq`): for `Y`
Hausdorff and locally compact and `(Y × E)/Λ` with Mathlib's quotient atlas, if `U ⊆ Y` is open,
`y₀ ∈ Y` and `g : U → (E ≃L[ℂ] E)` is holomorphic with `Π y = g(y) ∘ Π y₀` for every `y ∈ U`, then
`(y, [w]) ↦ [y, g(y) w]` is a biholomorphism from `U × E/LinearMap.range (Π y₀)` onto
`p⁻¹(U) = q(U × E)`, over `U`. Its inverse is `[y, v] ↦ (y, [g(y)⁻¹ v])`, well defined because
`g(y)⁻¹(v + Π y λ) = g(y)⁻¹ v + Π y₀ λ`. Isotriviality is taken in this form, on the periods.
Without such a hypothesis no holomorphic trivialisation with a fixed fibre is asserted: a varying
`τ` in `ℂ/(ℤ + τ(y)ℤ)` must not satisfy that conclusion, and the Checks give a family with none.
*Needs:* §§2.1–2.2; ComplexManifolds Milestone 1 for the underlying real manifold of `Y`; Tau Ceti
`TauCeti.isLocalDiffeomorph_addQuotientMk`; Mathlib `AddAction.instChartedSpaceQuotient`,
`isOpenMap_quotient_mk'_add`, `Manifold.IsImmersion`, `Diffeomorph`.
*In Tau Ceti:* `TauCeti.torusFamilyProjection`, `TauCeti.torusFamilyProjection_mk`, `TauCeti.isSubmersionOfComplement_torusFamilyProjection`, `TauCeti.torusFamilyFiberMap`, `TauCeti.contMDiff_torusFamilyFiberMap`, `TauCeti.torusFamilyFiberHomeomorph`, `TauCeti.periodBasis`, `TauCeti.contMDiff_periodBasis_equivFunL`, `TauCeti.contMDiff_periodBasis_equivFunL_symm`, `TauCeti.torusFamilyDiffeomorphProd`, `TauCeti.torusFamilyDiffeomorphProd_eq_prodMap_torusCoordChange`.

**Checks.**
- On `ℍ` with `Π(τ)(a, b) = a + bτ`, the fibres over `τ` and `τ'` are biholomorphic only when
  `τ' ∈ SL₂(ℤ)·τ`, and these orbits are discrete in `ℍ`. So over no nonempty open subset of `ℍ`
  is this family holomorphically isomorphic to a product with one fixed elliptic curve, although
  it has submersion charts everywhere; the periods do not vary by complex-linear automorphisms,
  since `τ` is not locally constant.
- For a constant period map, `Π y = Π y₀` for all `y`, the hypothesis holds with `g = 1`, and the
  family is the product `Y × E/LinearMap.range (Π y₀)`.

### 2.4 Topology, the zero section and base change

From the explicit Hausdorff, second-countability, continuity and coordinatewise-holomorphy
hypotheses on `Y` and `Π`, prove that the projection is proper, so that its fibres are compact;
that the total space is Hausdorff and second countable; and that the zero section `y ↦ [y, 0]` is
holomorphic. For a holomorphic `f : Y' → Y`, `Π ∘ f` is a period family; prove that the base
change map `[y', v] ↦ [f y', v]` is holomorphic and functorial (it sends identities to identities
and composites to composites), that together with the projection it is a homeomorphism from the
family of `Π ∘ f` onto the literal pullback of `p` along `f`, and that it has the universal
property of the pullback for holomorphic maps: a map into the family of `Π ∘ f` is holomorphic
exactly when its projection to `Y'` and its composite with the base change map are.
*Needs:* §§2.1–2.3.
*In Tau Ceti:* `TauCeti.isProperMap_torusFamilyProjection`, `TauCeti.t2Space_torusFamily`, `TauCeti.secondCountableTopology_torusFamily`, `TauCeti.contMDiff_torusFamily_mk_zero`, `TauCeti.torusFamilyBaseChangeMap`, `TauCeti.contMDiff_torusFamilyBaseChangeMap`, `TauCeti.torusFamilyBaseChangeMap_id`, `TauCeti.torusFamilyBaseChangeMap_comp`, `TauCeti.torusFamilyBaseChangeHomeomorph`, `TauCeti.contMDiff_torusFamilyBaseChange_iff`.

### 2.5 The canonical marking

Construct the canonical marking `H₁(T_y; ℤ) ≅ Λ`, for `T_y = p⁻¹(y)`, by lifting loops to `E` and
taking their period displacement: a loop in the fibre over `y` lifts to a path in `E` whose
displacement is `Π y λ` for a unique `λ`, and the marking sends its class to `λ`. Prove that it is
compatible with the fibre identification of §2.3, and that loops in two fibres that are freely
homotopic in the total space have the same marking: the marking is natural in `y`, and the
globally marked family has trivial monodromy.

Describe the change of an arbitrary marking by the automorphisms of `Λ`: every isomorphism
`H₁(T_y; ℤ) ≅ Λ` is the canonical marking followed by a unique automorphism of `Λ`, and changing
the marking by `φ ∈ Aut(Λ)` conjugates every monodromy representation by `φ`.
*Needs:* §§1.4, 2.3; AlgebraicTopology §2.6 for local systems and §5.5 for fibre transport.
*In Tau Ceti:* `TauCeti.torusFamilyMarking`, `TauCeti.torusFamilyMarking_loopClass`, `TauCeti.torusFamilyMarking_singularHomologyMap`, `TauCeti.torusFamilyMarking_loopClass_eq_of_homotopy`.

**Checks.**
- On `ℍ` with `Π(τ)(a, b) = a + bτ`, the loop `s ↦ [s]` in the fibre over `τ` lifts to the path
  from `0` to `1`, so it is marked `(1, 0)`, and the loop `s ↦ [sτ]` is marked `(0, 1)`; a
  marking by the displacement `Γ 0 − Γ 1` would give `(−1, 0)` and `(0, −1)`. At `τ = i`,
  multiplication by `i` is an automorphism of the fibre acting on `H₁` by the matrix
  `(0, −1; 1, 0)` in this marking.

### Examples

- Over `ℍ`, the family `ℂ/(ℤ + τℤ)` with `Π(τ)(a, b) = a + bτ` is the universal family of marked
  elliptic curves; it is smoothly trivial, `[τ, v] ↦ (τ, (Re v − Re τ·Im v/Im τ, Im v/Im τ))` in
  the basis `(1, 0), (0, 1)`, and not holomorphically trivial over any open set.
- For `Y = ℂ*` and `Π(y)(a, b) = a + b·(i + log|y|)`, `τ(y) = i + log|y|` is not holomorphic, so
  this is not a period family: coordinatewise holomorphy fails.

### Dependencies

Milestone 1 for the fibres. Tau Ceti's quotient-manifold theorems (supplier contracts).
ComplexManifolds Milestone 1 for the underlying real manifold of `Y` and Milestone 4 for the
complex quotient theorem; AlgebraicTopology §§2.6 and 5.5 for local systems and fibre transport.
Mathlib's quotient atlas and `Manifold.IsImmersion`.

## Milestone 3: equivariant descent and monodromy

A discrete group `Γ` acts properly discontinuously on `Y` by biholomorphisms. The data are a
representation `ρ : Representation ℤ Γ Λ` and complex-linear equivalences `R_g(y)` of `E`,
holomorphic in `(y, v) ↦ R_g(y)v`, with the cocycle law `R_1(y) = 1`,
`R_(gh)(y) = R_g(h·y) ∘ R_h(y)` and the period-equivariance law
`Π(g·y)(ρ(g)λ) = R_g(y)(Π(y)λ)`. Tau Ceti takes `R_g(y)` as an additive map `E →+ E`; holomorphy in
`v` makes it complex-linear, and the cocycle law makes it invertible. There are two constructors,
with different inputs and conclusions.

### 3.1 The linear constructor

The linear constructor lifts the action to `Y × E` by `g·(y, v) = (g·y, R_g(y)v)`. Prove the group
law from the cocycle law, and prove that the lift normalises the period action,
`g·(λ +ᵥ x) = ρ(g)λ +ᵥ g·x`, from the period-equivariance law, so that it descends to an action on
`(Y × E)/Λ`. Prove that the descended action fixes the zero section over every fixed point of the
base, so that it is free if and only if `Γ` acts freely on `Y`: this constructor is not used to
remove a base stabilizer.
*Needs:* §2.1.
*In Tau Ceti:* `TauCeti.linearCocycle_apply_inv_apply`, `TauCeti.linearCocycleMulAction`, `TauCeti.linearCocycleMulAction_smul_vadd`, `TauCeti.torusFamilyLinearMulAction`, `TauCeti.torusFamilyLinearMulAction_stabilizer_mk_zero`, `TauCeti.isCancelSMul_torusFamilyLinearMulAction_iff`.

### 3.2 The affine constructor

The affine constructor also takes, for each `g`, a holomorphic section `b_g` of the pulled-back
torus family, `b_g(y) ∈ T_(g·y)`, with `b_1 = 0` and `b_(gh)(y) = b_g(h·y) + R_g(h·y)(b_h(y))`.
Define the affine maps `g·[y, v] = R_g(y)v +ᵥ b_g(y)` of the torus family, the point `b_g(y)` of
the fibre over `g·y` translated by the vector `R_g(y)v`, well defined on the period quotient.
Prove the action law and the inverse formula, that the action recovers the linear action of §3.1
when `b = 0`, and that each affine map is holomorphic, so that the action is by biholomorphisms.
The translation is a section of the torus family, not of `E`: no global lift to the vector space
is required.
*Needs:* §§2.2, 3.1.
*In Tau Ceti:* `TauCeti.torusFamilyAffineMap`, `TauCeti.torusFamilyAffineMulAction`, `TauCeti.torusFamilyAffineMulAction_inv_smul_mk`, `TauCeti.torusFamilyAffineMap_zero_translation`, `TauCeti.contMDiff_torusFamilyAffineMap`, `TauCeti.contMDiffConstSMul_torusFamilyAffineMulAction`.

### 3.3 Descent and total-space freeness

Prove that both descended actions are properly discontinuous whenever `Γ` acts properly
discontinuously on `Y`. For the affine constructor, state freeness for the action on the total
space `(Y × E)/Λ`, not merely on the base. For `g·y = y`, `g` acts on `T_y` by an affine map
`x ↦ Ax + t`, with linear part induced by `R_g(y)` and translation part `b_g(y)`, and such a map
has a fixed point exactly when `t ∈ (1 − A)T_y`. Prove that the action on `(Y × E)/Λ` is free if
and only if, for every `y` and every `g ≠ 1` with `g·y = y`, the translation part does not lie in
`(1 − A)T_y`, and that when the stabilizers are cyclic it suffices to test every nonidentity power
of a generator. Form the orbit quotient by the total action only under this criterion, and prove
that it is then a complex manifold. The affine constructor covers elliptic base points, whose
stabilizers act on the fibre by fixed-point-free affine maps.
*Needs:* §§2.4, 3.1–3.2; ComplexManifolds Milestone 4 (Tau Ceti `TauCeti.instIsManifoldQuotient`),
with §2.4 for the Hausdorff hypothesis of the quotient.
*In Tau Ceti:* `TauCeti.properlyDiscontinuousSMul_torusFamilyLinearMulAction`, `TauCeti.properlyDiscontinuousSMul_torusFamilyAffineMulAction`, `TauCeti.torusFamilyFiberLinearPart`, `TauCeti.torusFamilyFiberTranslationPart`, `TauCeti.torusFamilyAffineMap_fiberMap`, `TauCeti.isCancelSMul_torusFamilyAffineMulAction_iff`, `TauCeti.isCancelSMul_torusFamilyAffineMulAction_iff_of_stabilizer_le_zpowers`.

**Checks.**
- Let `C_2 = {±1}` act on `ℂ` by `z ↦ −z`, with constant periods `ℤ[i]`, `R = 1` and constant
  translation `a = ½` in `T = ℂ/ℤ[i]`. At the fixed point `0`, `A = 1` and `(1 − A)T = 0` does not
  contain `a`, so the affine action `(z, x) ↦ (−z, x + ½)` is free; the linear action
  `(z, x) ↦ (−z, x)` fixes `(0, 0)` and is not.

### 3.4 The descended family and its monodromy

Descend `p` to the map from the second quotient `((Y × E)/Λ)/Γ` to `Y/Γ`. Over the free locus of
the action on `Y`, prove that it is a holomorphic submersion with submersion charts, and a smooth
fibre bundle with fibre `ℝ^d/ℤ^d` whose local trivialisations are those of §2.3 carried through
local sections of `Y → Y/Γ`. Identify the monodromy: for a loop at `[y]` whose lift runs from `y`
to `g·y`, identify the fibre over the endpoint with the fibre over `y` by the action of `g⁻¹`; the
transport on the canonical marking of §2.5 is `ρ(g⁻¹)`. Equivalently, a lift ending at `g⁻¹·y`
has monodromy `ρ(g)`. This convention is this roadmap's normalisation, fixed by the Check below.
Derive the action on `H_k` of the fibres as the `k`-th exterior power of the action on `Λ`.
*Needs:* §§1.4, 2.3, 2.5, 3.2–3.3; Tau Ceti `TauCeti.freeLocus.instIsManifold`,
`TauCeti.contMDiff_orbitRelQuotientMap`, and path lifting for the covering `Y → Y/Γ` over the free
locus; AlgebraicTopology §5.5 for fibre transport.

**Checks.**
- Let `Γ = ℤ` act on `Y = ℂ` by `z ↦ z + n`, with constant periods `ℤ[i] ⊂ E = ℂ`, `R_n = iⁿ` and
  `ρ(n)` multiplication by `iⁿ` on `ℤ[i]`; the laws hold since `iⁿ⁺ᵐ = iⁿ·iᵐ`. The loop in
  `ℂ/ℤ` whose lift runs from `0` to `1` has monodromy `ρ(−1)`, multiplication by `−i`, on the
  marking. A convention reading the monodromy as `ρ(g)` would give `i`, which is a different
  automorphism of `ℤ[i]`.

### 3.5 Naturality

Prove that the constructions of §§3.1–3.4 are natural under base change along `Γ`-equivariant
holomorphic maps `Y' → Y`, that changing the marking by an automorphism of `Λ` conjugates the
monodromy, and that reversing the orientation of a loop inverts its monodromy.
*Needs:* §§2.4–2.5, 3.4.

### Examples

- The free involution `(z, x) ↦ (−z, x + ½)` of `ℂ × ℂ/ℤ[i]` of the Check of §3.3 has as quotient a
  family over `ℂ/{±1} ≅ ℂ` whose fibre over the image of `0` is `(ℂ/ℤ[i])/⟨½⟩`, an elliptic curve.
- With `Γ = SL₂(ℤ)` acting on `ℍ` and the family `ℂ/(ℤ + τℤ)` of the Examples of Milestone 2, the
  linear constructor with `R_g(τ)` multiplication by `(γτ + δ)⁻¹` for `g = (α, β; γ, δ)`, and `ρ`
  the induced action on `ℤ²`, gives an action that is not free: `−1` fixes every `τ` and acts on
  the fibre by `x ↦ −x`, fixing the zero section, as §3.1 says.

### Dependencies

Milestone 2. Tau Ceti's quotient manifolds, their free locus and the descent of maps between them
(supplier contracts). ComplexManifolds Milestone 4 for the complex quotient theorem;
AlgebraicTopology §5.5 for fibre transport, and the completed UniversalCovers roadmap for path
lifting.

## Milestone 4: cyclic affine algebra on a torus

Let `T` be an additive commutative group, in the applications a torus `E/Λ`, let `A : T ≃+ T` be
an additive automorphism, and fix `m > 0`. The milestone is additive algebra: `A` is not assumed
holomorphic. The translation parameter is `t : T`; an element of `Λ` is zero in `T` and cannot
parametrise the affine geometry. Period, exact-order and freeness conditions are hypotheses of
theorems, never fields of a structure whose consequences are assumed. Sections 4.1–4.4 are the
torus-level affine algebra and §§4.5–4.6 the integral connecting class. For a finite cyclic group
with generator `g` acting on a module `M`, Milne, *Class Field Theory*, Chapter II, computes
`H¹ = ker N / (g − 1)M` (Example 1.20, p. 66), describes the connecting map through a lift of a
cocycle (Remark 1.21, p. 66), and proves the periodicity that gives `H² = M^G / N M`
(Proposition 3.4, p. 81). In the cohomological sections `T`, `Λ` and `E` live in `Type`, as
Mathlib's `Rep ℤ` requires.

### 4.1 Affine maps and the iterate formula

Define the affine permutation `affine(A, t)` of `T`, `x ↦ Ax + t`, and for every `k` the partial
norm `N_{A,k}(t) = ∑_{i<k} A^i t`, together with its additive form `t ↦ N_{A,k}(t)`, a homomorphism
`T →+ T`. Prove the iterate formula `affine(A, t)^k (x) = A^k x + N_{A,k}(t)` for every `k`.
*Needs:* Mathlib's sums over `Finset.range`.
*In Tau Ceti:* `AddEquiv.affineEquiv`, `AddEquiv.partialNorm`, `AddEquiv.partialNorm_def`, `AddEquiv.cyclicNormHom`, `AddEquiv.affineEquiv_iterate_apply`.

**Checks.**
- For `A = −1`, `N_{A,2}(t) = t − t = 0`, so every map `x ↦ −x + t` is an involution. A partial
  norm summing `A^i` over `1 ≤ i ≤ k` would give `N_{A,1}(t) = −t`, and the iterate formula
  would fail already at `k = 1`.

### 4.2 Period and exact order

Prove that the affine map has `m`-th power the identity exactly when `A^m = 1` and
`N_{A,m}(t) = 0`; so under `A^m = 1` it is `m`-periodic, of order dividing `m`, exactly when
`N_{A,m}(t) = 0`. Prove that under `A^m = 1` it has exact order `m` exactly when, moreover, for
every `0 < k < m`, `A^k ≠ 1` or `N_{A,k}(t) ≠ 0`. From periodicity derive the action of `ZMod m`
on `T` by iterates, which takes the norm equation as a hypothesis and is not asserted to be
faithful, and prove that it is faithful exactly when the affine map has exact order `m`.
*Needs:* §4.1.
*In Tau Ceti:* `AddEquiv.affineEquiv_pow_eq_one_iff`, `AddEquiv.affineEquiv_pow_eq_one_iff_of_iterate_eq_id`, `AddEquiv.orderOf_affineEquiv_dvd_iff`, `AddEquiv.orderOf_affineEquiv_eq_iff`, `AddEquiv.affineAddAction`, `AddEquiv.faithfulVAdd_affineAddAction_iff`.

**Checks.**
- On `T = ℂ/ℤ[i]` with `A = 1`, `m = 2` and `t = ⅓`, `A² = 1` but `N_{A,2}(t) = ⅔ ≠ 0`: translation
  by `⅓` has order three, and no action of `ZMod 2` comes from it. `A^m = 1` alone does not give
  a cyclic action.
- On `T = ℂ/ℤ[i]` with `A = 1`, `m = 4` and `t = ½`, `N_{A,4}(t) = 2 = 0`, so the map has order
  dividing `4`; but `N_{A,2}(t) = 1 = 0` as well, so its exact order is `2`. A criterion reading
  exact order off `A^m = 1` and `N_{A,m}(t) = 0` alone would say `4`.

### 4.3 Translation conjugacy and the first cohomology

Prove that conjugating by the translation `x ↦ x + b` sends the translation part `t` to
`t + (b − Ab)`. For `A^m = 1`, construct the representation of `C_m` on `T` in which `ofAdd 1` acts
by `A`, and the corresponding object of `Rep ℤ C_m`. Prove that Mathlib's `Representation.norm` of
it is the ordered sum of powers `N_{A,m}`, and that the range of `ρ(ofAdd 1) − 1` is the range of
`1 − A`, by negation. Prove that Mathlib's finite-cyclic class map
`Rep.FiniteCyclicGroup.groupCohomologyπOdd` sends the kernel of the norm onto `H¹(C_m, T)`, and
that two affine maps with linear part `A` and norm-zero translation parts have the same class
exactly when they are conjugate by a translation. So the translation-conjugacy classes of
`m`-periodic affine maps with linear part `A` form Mathlib's `groupCohomology` in degree one,
computed as `ker N_A / range(1 − A)`, with no second `H¹` carrier; the partial norms `N_{A,k}` for
every `k` stay available for the iterate and fixed-point formulas.

For period two, with `σ : T ≃+ T` and `σ² = 1`, prove that the norm `N_{σ,2}` is `id + σ`, that the
difference `1 − σ` is the map `1 − σ^k` at `k = 1`, and that both composites of the two vanish.
Mathlib's short complexes `Rep.FiniteCyclicGroup.normHomCompSub` and
`Rep.FiniteCyclicGroup.subCompNormHom` use `σ − 1`; construct their isomorphisms with the complexes
built from `1 − σ`, which negate one end. All of this holds over every additive commutative group,
including groups with `2`-torsion, and divides by nothing.
*Needs:* §4.1; Mathlib `Rep.FiniteCyclicGroup.groupCohomologyπOdd`,
`Rep.FiniteCyclicGroup.groupCohomologyπOdd_eq_iff`, `Rep.FiniteCyclicGroup.normHomCompSub`,
`Rep.FiniteCyclicGroup.subCompNormHom`, `Representation.norm`.
*In Tau Ceti:* `AddEquiv.conj_addRight_affineEquiv`, `AddEquiv.cyclicRepresentation`, `AddEquiv.cyclicRep`, `AddEquiv.cyclicRepresentation_norm_apply`, `AddEquiv.cyclicRepresentation_norm_eq_partialNorm`, `AddEquiv.mem_range_cyclicRep_applyAsHom_sub_iff`, `AddEquiv.groupCohomologyπOdd_cyclicRep_eq_iff`, `AddEquiv.groupCohomologyπOdd_cyclicRep_eq_iff_exists_conj_affineEquiv`, `AddEquiv.cyclicNormHom_two`, `AddEquiv.oneSubPow`, `AddEquiv.oneSubPow_one`, `AddEquiv.oneSubPow_comp_cyclicNormHom`, `AddEquiv.cyclicNormHom_comp_oneSubPow`, `AddEquiv.normHomCompSubCyclicRepIso`, `AddEquiv.subCompNormHomCyclicRepIso`.

**Checks.**
- On `ZMod 2` with `σ = id`, the norm `id + σ` is `x ↦ 2x = 0` and the difference is `0`, so both
  composites vanish although `2` is not invertible; a description through the splitting
  `x = (x + σx)/2 + (x − σx)/2` would divide by `2`, which is not possible here.
- On `T = ℂ/ℤ[i]` with `A = −1` and `m = 2`, `ker N_A = T` and `range(1 − A) = 2T = T`, so
  `H¹(C_2, T) = 0`: every involution `x ↦ −x + t` is conjugate by a translation to `x ↦ −x` (take
  `b` with `2b = −t`, so that `t + (b − Ab) = t + 2b = 0`). With `A = 1` instead, `H¹(C_2, T) = T[2] ≅ (ℤ/2)²`.

### 4.4 Fixed points and freeness

Prove that the `k`-th iterate of `x ↦ Ax + t` has a fixed point if and only if some `b` satisfies
`b − A^k b = N_{A,k}(t)`, that is `N_{A,k}(t) ∈ range(1 − A^k : T → T)`. Hence, under `A^m = 1` and
`N_{A,m}(t) = 0`, prove that the action of §4.2 is free exactly when this membership fails for
every `0 < k < m`. State the prime-order simplification: for `m` prime the generator decides, and
the action is free exactly when `t ∉ range(1 − A)`. For composite `m` every nonidentity power is
checked.
*Needs:* §§4.1–4.2.
*In Tau Ceti:* `AddEquiv.oneSubPow`, `AddEquiv.oneSubPow_apply`, `AddEquiv.exists_affineEquiv_iterate_apply_eq_self_iff`, `AddEquiv.isCancelVAdd_affineAddAction_iff`, `AddEquiv.isCancelVAdd_affineAddAction_iff_of_prime`.

**Checks.**
- On `T = ℂ²/ℤ[i]²` with `A = diag(1, i)`, `m = 4` and `t = (½, 0)`: `A⁴ = 1` and
  `N_{A,4}(t) = (2, 0) = 0`, and the map has exact order `4`, since `A`, `A²` and `A³` are not
  `1`. The generator has no fixed point, because `(1 − A)T = 0 × T` (multiplication by `1 − i` is
  onto `ℂ/ℤ[i]`) does not contain `t`. But `N_{A,2}(t) = (1, 0) = 0`, so the square is
  `x ↦ (x₁, −x₂)`, which fixes every `(x₁, 0)`: the action is faithful and not free. A freeness
  test checking only the generator would accept it.

### 4.5 The integral connecting class

Fix the equivariant short exact sequence `0 → Λ → E → T → 0` in `Rep ℤ C_m`. Its input consists
of automorphisms `A_Λ`, `A_E`, `A_T` with `m`-th powers `1` and equivariant additive maps
`i : Λ → E` and `p : E → T` with `p ∘ i = 0`; construct the short complex of representations from
these data and prove that it is short exact when `i` is injective, `p` surjective and
`ker p = range i`. In the applications `E` is a real vector space, `A_E` is real-linear and
`T = E/Λ`. For a lift `t̃ ∈ E` of `t` with `N_{A,m}(t) = 0`, prove that the norm `N_A(t̃)` is the
image of a fixed point of `A_Λ`, and that changing the lift by `λ ∈ Λ` adds `N_A(λ)`. The
connecting map `H¹(C_m, T) → H²(C_m, Λ)` is Mathlib's `groupCohomology.δ`, and
`H²(C_m, Λ) = Λ^A / N_A Λ` through Mathlib's `Rep.FiniteCyclicGroup.groupCohomologyπEven`. With the
generator `ofAdd 1` and the cocycle given by its value `t`, prove against `groupCohomology.δ_apply`
that `δ[t] = [N_A(t̃)]`, and in particular that `δ[v/m] = [v]` for `v ∈ Λ^A` when multiplication by
`m` is injective on `E`, with this positive sign.

Prove that `H¹` and `H²` of `E` vanish when multiplication by `m` is bijective on `E`, as on a real
vector space, so that `δ` is an isomorphism, and construct its underlying additive equivalence
`H¹(C_m, T) ≃ H²(C_m, Λ)`. The vanishing holds for every finite group whose order acts bijectively
on the coefficients; for `C_m` the periodic complex with division by `m` gives it directly, and
Mathlib's `groupCohomology.isIso_δ_of_isZero` turns the two vanishing statements into the
isomorphism.
*Needs:* §§4.1, 4.3; Mathlib `groupCohomology.δ`, `groupCohomology.δ_apply`,
`groupCohomology.isIso_δ_of_isZero`, `Rep.FiniteCyclicGroup.groupCohomologyπEven`.
*In Tau Ceti:* `AddMonoidHom.cyclicRepShortComplex`, `AddMonoidHom.shortExact_cyclicRepShortComplex`, `AddMonoidHom.exists_apply_eq_sum_range_iterate`, `AddMonoidHom.sum_range_iterate_add_apply`, `TauCeti.δ_cyclicRepShortComplex_groupCohomologyπOdd_one`, `TauCeti.δ_cyclicRepShortComplex_groupCohomologyπOdd_one_of_nsmul_eq`, `groupCohomology.subsingleton_of_bijective_nsmul`, `TauCeti.cyclicConnectingEquiv`.

**Checks.**
- With all actions trivial, `Λ = ℤ[i] ⊂ E = ℂ` and `m = 3`, the class of `t = ⅓` maps to the
  class of `N(⅓) = 3·⅓ = 1` in `Λ/3Λ`. The opposite sign would give the class of `−1`, which
  differs from that of `1` in `ℤ[i]/3ℤ[i]`; for `m = 2` the two signs agree and the test would
  not see the difference.
- For `A = −1` on `Λ = ℤ[i] ⊂ E = ℂ` and `m = 2`, `Λ^A = 0`, so `H²(C_2, Λ) = 0`, matching
  `H¹(C_2, T) = 0` from §4.3 through the isomorphism `δ`.

### 4.6 Naturality and the trivial action

Prove that the connecting map is natural under morphisms of equivariant short exact sequences,
under products of equivariant short exact sequences, and under restriction along homomorphisms of
finite cyclic groups `C_n → C_m`, through `groupCohomology.map` and `groupCohomology.δ_naturality`.
For a period family over `Y` carrying on every fibre a cyclic action as in §4.5, varying
holomorphically in `y`, base change along a holomorphic `f : Y' → Y` pulls back the marked lattice,
the vector space and the torus families with their short exact sequence: construct the induced
fibrewise comparisons of `H¹(C_m, T_y)` and `H²(C_m, Λ)` and prove that `δ` commutes with them.

When all three actions are trivial, prove `H¹(C_m, T) ≃ T[m]`, with
`T[m] = AddSubgroup.torsionBy T m` (written `Submodule.torsionBy ℤ T m` in Tau Ceti), and
`H²(C_m, Λ) ≃ Λ/mΛ`, and, when multiplication by `m` is bijective on `E`, that the composite
`T[m] ≃ Λ/mΛ` through `δ` is the snake isomorphism of `0 → Λ → E → T → 0`. Exact order still needs the criterion of §4.2: not every
point of `T[m]` has exact order `m`.
*Needs:* §4.5; §2.4 for base change of period families and §2.5 for the marked lattice; Mathlib
`groupCohomology.map`, `groupCohomology.δ_naturality`.
*In Tau Ceti:* `TauCeti.map_δ_cyclicRepShortComplex`, `TauCeti.groupCohomologyOddEquivTorsionBy`, `TauCeti.groupCohomologyEvenEquivQuotSMulTop`, `TauCeti.torsionByδEquiv_eq_trans_cyclicConnectingEquiv`.

**Checks.**
- For trivial actions, `Λ = ℤ[i]` and `m = 2`, `T[2]` and `Λ/2Λ` both have order `4`; a version of
  the trivial-action formula landing in `Λ` itself would be infinite, and a version landing in the
  points of exact order `2` would have three elements.

### Examples

- For `T = ℂ/ℤ[i]`, `A = i` and `m = 4`, `1 − A` is invertible on `ℂ`, so `(1 − A)T = T` and every
  affine map `x ↦ ix + t` has a fixed point; `H¹(C_4, T) = 0`, and `Λ^A = 0` gives `H²(C_4, Λ) = 0`.
- For `T = E₁ × E₂` a product of elliptic curves, `A = (1, −1)` and `m = 2`, the involution
  `(x₁, x₂) ↦ (x₁ + a, −x₂)` with `0 ≠ a ∈ E₁[2]` is free, by §4.4 with `m` prime: `(a, 0)` is not in
  `(1 − A)T = 0 × E₂`.

### Dependencies

No other milestone, except that §4.6's base change uses §§2.4–2.5. Mathlib's `groupCohomology`,
its finite-cyclic isomorphisms and its long exact sequence (supplier contracts).

## Milestone 5: cyclic quotients and multiple fibres

Let `m > 0`, `ζ = exp(2πi/m)` and `r > 0`. The disc `D_z = {‖z‖ < r}`, with `rootsOfUnity m ℂ`
acting by rotation, is `TauCeti.rootsOfUnityBall m r`. Let `X → D_z` be a period family
(Milestone 2, base `D_z`) carrying a holomorphic cyclic affine cocycle of Milestone 3 over the
rotation: linear parts `R_g(z)` and translation sections `b_g(z)` with the period-equivariance and
action laws. In the constant-linear-part case the generator has `R_ζ(z) = A_E`, and the
period-equivariance law reads `A_E(Π(z)λ) = Π(ζz)(A_Λ λ)`. The translation law is the full orbit
sum of sections along `z, ζz, …`, not a norm equation in one fixed fibre. Over the fixed point `0`
the generator acts on `T_0` with linear part `R_ζ(0)` and translation part `b_ζ(0)`, so
Milestone 4 applies there
(Barth–Hulek–Peters–Van de Ven, Chapter V, the section "Logarithmic Transformations", beginning
on p. 216, for the local cyclic-quotient model; the statements here allow torus fibres of any
dimension). The multiplicity of §5.3 and the characters of §§5.4–5.5 are computed here in that
model, with the associated-bundle convention of §5.4 as this roadmap's normalisation.

### 5.1 The total action

Construct the biholomorphic action of `rootsOfUnity m ℂ` on `X` as the affine action of §3.2.
Away from `z = 0` the rotations act freely. Prove that the action on `X` is free if and only if,
for every `0 < k < m`, the `k`-th power of the generator has no fixed point on `T_0`, that is
`N_{A,k}(t) ∉ range(1 − A^k)` for `x ↦ Ax + t` the action of `ζ` on `T_0` (§4.4), and that when
`R_ζ(0) = 1` this says that `b_ζ(0)` has exact order `m`. Prove that the action has exact order `m`
whenever `r > 0`. These statements are algebraic: they use no topology on the disc.
*Needs:* §§3.2–3.3, 4.4; Tau Ceti `TauCeti.rootsOfUnityBall`.
*In Tau Ceti:* `TauCeti.isCancelSMul_torusFamilyAffineMulAction_rootsOfUnityBall_iff`, `TauCeti.isCancelSMul_torusFamilyAffineMulAction_rootsOfUnityBall_iff_addOrderOf_eq`, `TauCeti.orderOf_toPerm_torusFamilyAffineMulAction_rootsOfUnityBall`.

### 5.2 The quotient and its map to the disc

Give `D_z` the complex-manifold structure of an open subset of `ℂ`, so that the rotations and the
affine action are biholomorphic (§3.2). Form the orbit quotient `Q = X/C_m`, a complex manifold by
`TauCeti.instIsManifoldQuotient` under the freeness of §5.1, and descend `z ↦ z^m` to
`p_Q : Q → D_t`, where `D_t = {‖t‖ < r^m}` and `D_z/C_m ≅ D_t` is
`TauCeti.rootsOfUnityBallQuotientHomeomorph`. Prove that `p_Q` is holomorphic, and a holomorphic
submersion at every point of `Q` outside `p_Q⁻¹(0)`.
*Needs:* §§3.2–3.3, 5.1; Tau Ceti `TauCeti.instIsManifoldQuotient`,
`TauCeti.contMDiffConstSMul_torusFamilyAffineMulAction`,
`TauCeti.properlyDiscontinuousSMul_torusFamilyAffineMulAction`,
`TauCeti.rootsOfUnityBallQuotientHomeomorph`, `TauCeti.contMDiff_orbitRelQuotientLift_iff`.

### 5.3 The central fibre and its multiplicity

Let `F` be the image of the central torus `T_0` in `Q`. Prove that `F` is a closed embedded complex
hypersurface of `Q`, that `F = p_Q⁻¹(0)` as a set, and that `F` is biholomorphic to the orbit
quotient `T_0/C_m`. In charts transverse to `F` prove `t = a·u^m` with `a` a holomorphic unit, so
that `p_Q` vanishes to order exactly `m` along `F`: the fibre multiplicity is `m`.
*Needs:* §5.2; ComplexManifolds Milestone 4 for descent of holomorphic maps.

### 5.4 The normal character

With the associated-bundle convention `(x, v) ↦ (g·x, χ(g)v)` for the cover `T_0 → F`, identify the
normal bundle `N_{F/Q}` with the line bundle of the character `χ(ζ) = ζ`, and prove that
`N_{F/Q}^{⊗m}` is trivial. Deduce that `N_{F/Q}` has exact order `m` from ComplexManifolds
Milestone 7.6, whose hypotheses, a connected compact covering manifold on which holomorphic units
are constant, hold for `T_0 → F`.
*Needs:* §5.3; ComplexManifolds Milestone 7.4 for the normal bundle of a complex hypersurface and
Milestone 7.6 for line bundles of characters.

### 5.5 Canonical bundles and adjunction

In the constant-linear-part case, the restriction `K_Q|_F` is the line bundle of the character
`(ζ · det A_E)⁻¹` and the canonical bundle `K_F` that of `(det A_E)⁻¹`, with `det` the complex
determinant. Prove both identifications and the adjunction isomorphism
`K_F ≅ K_Q|_F ⊗ N_{F/Q}`. For a varying linear part use the corresponding determinant transition
cocycle. Apply ComplexManifolds Milestone 7.6 to the character cases, and prove that `F` is a
compact complex manifold, with its smoothness and manifold instances.
*Needs:* §§5.3–5.4; ComplexManifolds Milestones 7.4–7.6 for normal, canonical and character line
bundles.

**Checks.**
- Let `X = D × T₀` with constant periods, `m = 2` and `(z, x) ↦ (−z, x + a)` with
  `0 ≠ a ∈ T₀[2]`. Then `F = T₀/⟨a⟩` is again a torus, and in the chart `u = z` near `F`,
  `t = u²`: multiplicity `2`. The normal character is `−1`, so `N_{F/Q}` is nontrivial with
  `N_{F/Q}^{⊗2}` trivial; `K_F` has character `1`, consistent with `F` being a torus, and `K_Q|_F`
  has character `−1`, and adjunction reads `1 = (−1)·(−1)`. Treating `Q` near `F` as a product
  `D_t × F` would give a trivial normal bundle.
- For `m = 1` the group is trivial, `Q = X`, `p_Q(z) = z` is a submersion everywhere and the
  central fibre has multiplicity `1`.

### Examples

- `X = D × E₁ × E₂` with constant periods, `m = 2` and `(z, x₁, x₂) ↦ (−z, x₁ + a, −x₂)` with
  `0 ≠ a ∈ E₁[2]`: the action is free by §4.4, `Q` is a complex threefold fibred over `D_t` in
  abelian surfaces with central fibre the bielliptic surface `(E₁ × E₂)/C_2` of multiplicity `2`,
  and `det A_E = −1`, so `K_F` has character `−1`, nontrivial of order `2`.

### Dependencies

Milestones 2–4. Tau Ceti's rotated disc and its quotient, its quotient manifolds and holomorphic
descent (supplier contracts). ComplexManifolds Milestone 4 for descent and Milestone 7 for
holomorphic line bundles: normal bundles of hypersurfaces (7.4), canonical bundles (7.5) and line
bundles of characters (7.6).

## Milestone 6: logarithmic gauges and regluing

Write `D_z` and `D_t` for discs as in Milestone 5, `D_z*` and `D_t*` for their punctured
subspaces, and `β_m : D_z* → D_t*`, `β_m(z) = z^m`. In this milestone `Y → D_t` denotes a marked
period family over `D_t` with period map `Π_Y`; its pullback `X = β_m^*Y → D_z` is the period
family with periods `z ↦ Π_Y(z^m)`, and `Q = X/C_m → D_t` is the quotient of Milestone 5 for a
free equivariant cyclic affine action on `X` over the rotation. The logarithmic transform uses
trivial linear part; general linear cocycles stay in Milestone 5. The meridian is that of
Convention 7.
(Barth–Hulek–Peters–Van de Ven, Chapter V, "Logarithmic Transformations", for the construction;
Bogomolov–Tschinkel, §3, pp. 3–4, recall Kodaira's construction for elliptic fibrations, and
§§6.2–6.4 cite its pages.)

### 6.1 The covering identification

For any free equivariant family `X → D_z` of Milestone 5, prove the canonical covering
identification `X* ≃ β_m^*Q*` over `D_z*`, with forward map `x ↦ (p_X(x), [x])`: give its
inverse, both projection equations and holomorphy. The pullback is the literal subtype of the product,
`{(z, q) : D_z* × Q* // β_m(z) = p_Q(q)}`, with the inherited topology; its atlas is obtained by
lifting the atlas of `Q*` through the local inverse branches of `β_m`, and its second projection
is a local biholomorphism. An independently supplied charted space or manifold structure on the
pullback is not an input of the theorem, and the theorem uses no logarithm.
*Needs:* §§5.1–5.2; Tau Ceti `TauCeti.puncturedDiscPow`, `TauCeti.isCoveringMap_puncturedDiscPow`,
`TauCeti.puncturedDiscPowDeckMulEquiv`, which treat `z ↦ z^m` on the punctured unit disc and apply
to `β_m` through the homotheties `z ↦ z/r` of `D_z*` and `t ↦ t/r^m` of `D_t*`, since
`(z/r)^m = z^m/r^m`; §2.4 for the base change of a period family as a literal pullback.

**Checks.**
- For `m = 1`, `β_1` is the identity and the identification is `X* ≃ Q*`; with the literal
  pullback, a disc times an elliptic curve has total model `ℂ × ℂ`, of complex dimension two, not
  the one-dimensional model of the base.

### 6.2 Normalising a pure-translation cocycle

Let the generator act with trivial linear part, `(z, x) ↦ (ζz, x + b(z))`, with `b` a holomorphic
section of the torus family. Lift `b` to a holomorphic `b̃ : D_z → E` through the period covering of
the simply connected disc: every holomorphic map from a simply connected, locally path-connected
manifold into the family has a holomorphic lift to `E`. Prove that the action law gives a constant
`λ ∈ Λ` with `∑_{j<m} b̃(ζ^j z) = Π_Y(z^m)λ`; over a connected base the orbit sum of a continuous
lift of a pure translation of order dividing `m` is one constant period. Put
`f(z) = b̃(z) − Π_Y(z^m)λ/m` and define the cyclic correction `c(z) = −(1/m) ∑_{j<m} j f(ζ^j z)`.
Prove that `c(ζz) − c(z) = −f(z)` and that `c` is holomorphic, so that the change of fibre
coordinate `x ↦ x + c(z)` turns the translation into `Π_Y(z^m)λ/m`.

Prove that the invariant `λ mod mΛ` corresponds to `b(0) ∈ T_0[m]` under the snake isomorphism
`T_0[m] ≃ Λ/mΛ` and to the class of `b(0)` in `H¹(C_m, T_0)` for the trivial action (§4.6), so that
the action is free on the central fibre exactly when this class has exact order `m`. A different
lift `b̃` changes `λ` by an element of `mΛ`, since two continuous lifts over a connected base differ
by one constant period: prove the corresponding comparison of the normalisations and of the
overlap identifications of §6.4, so that no representative `λ` is treated as canonical.
Bogomolov–Tschinkel, §3, p. 4, start from a translation already of the normalised form, a period
divided by `m`; the reduction to it by the weighted correction `c` is this roadmap's
normalisation.
*Needs:* §§2.2, 4.6, 5.1.
*In Tau Ceti:* `TauCeti.exists_contMDiff_lift_torusFamily`, `TauCeti.exists_eq_add_period_of_mk_eq_mk`, `TauCeti.exists_birkhoffSum_translation_eq_period`, `TauCeti.cyclicCorrection`, `TauCeti.add_cyclicCorrection_apply_sub`, `TauCeti.contMDiff_cyclicCorrection`, `TauCeti.isCancelSMul_torusFamilyAffineMulAction_rootsOfUnityBall_iff_addOrderOf_mk_eq`.

**Checks.**
- For `m = 2`, `∑_{j<2} f(ζ^j z) = 0` says `f(−z) = −f(z)`, and `c(z) = −½ f(−z) = ½ f(z)`, so
  `c(−z) − c(z) = −½ f(z) − ½ f(z) = −f(z)`, as claimed. A correction without the weight `j`
  would be `−½ (f(z) + f(−z)) = 0` and would change nothing.

### 6.3 The downstairs gauge

For normalised data, with translation `Π_Y(z^m)λ/m`, prove a separate gauge `G : Q* ≃ Y*` over
`D_t*`. On a simply connected open set carrying a branch `Log` of the logarithm, define
`G[(z, [e])] = (z^m, [e − (Log z / 2πi) Π_Y(z^m) λ])`. On compatible branches
`Log(ζz) = Log z + 2πi/m`, which gives invariance under the cyclic action; a change of branch by
`2πik` adds the period `−Π_Y(t)(kλ)`, so the local formulas patch. The inverse sends `(t, [y])` to
`[(z, [y + (Log z / 2πi) Π_Y(t) λ])]` for a local root `z^m = t`. Prove independence of the root
and of the branch, the two inverse identities, and holomorphy of `G` and `G⁻¹`. For
pure-translation data that is not normalised, compose with the coordinate change of §6.2.
Bogomolov–Tschinkel, §3, p. 4, state the identification of the quotient minus its central fibre
with the original family minus its central fibre, for elliptic fibres and without a formula; the
formula for `G` and its sign are this roadmap's normalisation, fixed by the first Check below.
*Needs:* §§6.1–6.2.

**Checks.**
- With the opposite sign, `e + (Log z / 2πi) Π_Y(z^m)λ`, the generator changes the value by
  `2Π_Y(t)λ/m`, which is not a period when `m ≥ 3` and `λ mod mΛ` has exact order `m`: that sign
  does not descend to `Q*`.
- Branch changes are lattice translations: the gauge patches over `D_t*`, while the covering
  identification of §6.1 lives over `D_z*`.

### 6.4 Regluing

Fix a complex manifold `M` containing the family `Y → D_t` as an open fibred neighbourhood: an open
subset of `M` that is the total space of the family. Glue `M` minus the central fibre `Y_0` to `Q`
along `Y*`, through the inclusion `Y* ⊆ M ∖ Y_0` and `G⁻¹ : Y* → Q*`, by the open gluing of
ComplexManifolds Milestones 5–6 applied to these pieces and maps, with their separation
hypotheses. Restrict `G` to annular overlaps and identify the regluing map on the smooth collars
of GeometricTopology §1.1 (Bogomolov–Tschinkel, §3, p. 4, for the extension of the quotient to
the logarithmic transform of an elliptic fibration).
*Needs:* §6.3; ComplexManifolds Milestones 5–6; GeometricTopology §§1.1 and 1.3.

### 6.5 Independence of choices

Prove that the reglued manifold does not depend, up to the induced isotopies and
biholomorphisms, on the radius, the collar width, the local logarithm, the lift `b̃` and the
linearising coordinate, when `M`, the marked family `Y`, the class `λ mod mΛ` (equivalently
the corresponding class in `H¹(C_m, T_0)`, §6.2) and the overlap identification are held fixed.
State the effect of changing this class: it is read off the induced maps on `π₁` and `H₁` computed
in §6.6, where the class enters as the image `λ/m` of the meridian.
*Needs:* §§6.2–6.4.

### 6.6 Fundamental group and first homology

Let `λ ∈ Λ` be the constant of §6.2 and `G` the gauge of §6.3. Prove that the inclusion of the
central fibre `F = T_0/C_m` in `Q` induces an isomorphism on `π₁`, so that `π₁(Q) = H₁(Q)` is the
lattice `Π_Y(0)Λ + ℤ·Π_Y(0)λ/m` of the torus `F` (§1.4), which `Π_Y(0)` identifies with the
subgroup `Λ + ℤ·λ/m` of `Λ ⊗ ℚ`; the quotient map `X → Q` then induces the inclusion of
`Λ = π₁(X)`. In `π₁(Y*) = H₁(Y*) = Λ × ℤ`, with `Λ` marked as in §2.5 and `ℤ` generated by the
meridian of `D_t*` carried on the zero section of `Y`, prove that `G⁻¹` followed by the inclusion
`Q* ⊂ Q` sends `(μ, k)` to `μ + kλ/m`: the meridian goes to `λ/m`, and `m` times it to the fibre
class `λ` (Bogomolov–Tschinkel, §3, p. 4, observe that in the transform this circle becomes a
nonzero homology class carried by the new central fibre). The annular overlaps of §6.4 include into `Y*` by isomorphisms on
`π₁`, so this is also the map induced by the collar maps. Reversing the meridian sends its class
to `−λ/m`, and it negates the twist class: replacing the generator `ζ` by `ζ⁻¹` sends
`λ mod mΛ` to `−λ mod mΛ` and the class in `H¹(C_m, T_0)` to its negative. This is the effect of
changing the class (§6.5): `π₁(Q) = Λ + ℤ·λ/m` depends on `λ mod mΛ` only through the cyclic
subgroup of `Λ/mΛ` that it generates, and the image `λ/m` of the meridian, taken modulo the image
of `Λ`, recovers `λ mod mΛ`. These maps are derived from the actual quotient, bundle and collar
maps, ready for use by geometric constructions, and are not recorded as fields of a
construction-specific structure.
*Needs:* §§5.3, 6.2–6.5; §1.4 and §2.5 for the lattice generators; AlgebraicTopology for
fundamental groups and singular homology.

### Examples

- On a constant family `D × E₁ × E₂` of products of two elliptic curves, take the free involution
  `(z, x₁, x₂) ↦ (−z, x₁ + a, −x₂)` with `0 ≠ a ∈ E₁[2]`. The punctured quotient has monodromy
  `id ⊕ (−id)` around `t = 0`. Section 6.1 recovers the upstairs family from it after the double
  cover. Section 6.3 does not apply: its pure-translation hypothesis fails, and this quotient
  cannot be identified over `D_t*` with a family extending over the disc, which would have
  trivial monodromy. The total model is `ℂ × (ℂ × ℂ)`, of complex dimension three.
- For a disc times an elliptic curve with `m = 2` and translation by a nonzero `2`-torsion point,
  the gauge of §6.3 identifies `Q*` with `D_t* × E` and the reglued manifold is a logarithmic
  transform of multiplicity `2`.

### Dependencies

Milestone 5, and Milestones 2 and 4 through it. Tau Ceti's punctured-disc covering (supplier
contracts).
ComplexManifolds Milestones 5–6 for open gluing; GeometricTopology §§1.1 and 1.3 for collars and
gluing along the boundary; AlgebraicTopology for the fundamental group and homology computations.

## Downstream consumers

- [AbelianSchemesAndArithmeticModuli](../AbelianSchemesAndArithmeticModuli/README.md) A5.1, A5.6
  and A5.8 use Milestone 1 (the lattice quotient, its Lie group structure and induced maps),
  Milestones 2–3 (period families and their equivariant actions) and §4.6 (the trivial-action
  formula `T[n] ≃ Λ/nΛ`).
- [BallQuotientsAndComplexHyperbolicLattices](../BallQuotientsAndComplexHyperbolicLattices/README.md)
  §8.2 uses Milestone 1 for the boundary tori of its toroidal compactification.
- [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) uses §§1.3–1.4 for complex tori.
- [GeometryOfNumbersAndQuadraticArithmetic](../GeometryOfNumbersAndQuadraticArithmetic/README.md)
  §6.1a uses the period-two norm and difference maps of §4.3 and Mathlib's short complexes, with
  their comparisons, rather than a separate helper map.

## Scope and ownership

**This roadmap owns** complex-torus quotients and their maps, varying period families, their
equivariant descent and monodromy, cyclic affine actions on tori and their cohomology, cyclic
quotients with multiple fibres, and analytic logarithmic transforms: every item of Milestones 1–6
above. The pinned Tau Ceti declarations that realise its items are named on their *In Tau Ceti:*
lines. `Suggested.lean` states the holomorphic local triviality of §2.3, and its module docstring
says, for each other headline, which pinned declaration realises it or which carrier it needs that
the pins lack. Mathlib owns the shape of its quotient, manifold, lattice, bundle and
group-cohomology APIs; Tau Ceti implements the missing results at the dependency pin rather than
waiting for another repository.

**Owned elsewhere.**
- [ComplexManifolds](../ComplexManifolds/README.md) owns realification, free properly discontinuous smooth and complex quotients,
  holomorphic descent, holomorphic vector and line bundles, and compatible open gluing
  (Milestones 1 and 4–7). This roadmap uses those results on the orbit quotients here and adds the
  torus-family and cyclic-affine geometry.
- The completed [UniversalCovers](../../Completed/UniversalCovers/README.md) roadmap owns covering spaces, deck groups and lifting; this
  roadmap uses its quotient-cover and monodromy interfaces and packages no second equivariant
  universal cover.
- [AlgebraicTopology](../AlgebraicTopology/README.md) owns fundamental groups, singular homology, local systems (§2.6), Wang
  sequences, transfer, the homology of tori (§5.4) and fibre transport (§5.5). This roadmap proves
  which maps arise from a torus family or a logarithmic transform and applies that theory.
- [GeometricTopology](../GeometricTopology/README.md) owns collars and gluing along the boundary (§§1.1, 1.3). This roadmap
  constructs the analytic punctured-disc gauges and proves that their boundary maps are smooth,
  and holomorphic where appropriate.
- The completed [AnalyticToricGeometry](../../Completed/AnalyticToricGeometry/README.md) roadmap owns complex manifolds from finite regular fans;
  this roadmap treats smooth period-lattice families and finite cyclic multiple fibres.
- [FuchsianOrbifolds](../FuchsianOrbifolds/README.md) owns orbifold bases and their quotient uniformization. A torus family over an
  orbifold base is given by its period representation on the uniformizing base, and then uses the
  equivariant descent of Milestone 3.
- The vanishing of §4.5 is the finite cyclic case of the derived invariants of
  [SmoothRepresentationsOfLocalGroups](../SmoothRepresentationsOfLocalGroups/README.md) SR.0d.2 at
  invertible pro-order; the vanishing used here is Tau Ceti's and does not use that roadmap.
- The spectral transfer and the Tate constructions that use the period-two maps of §4.3 belong to
  GeometryOfNumbersAndQuadraticArithmetic.
- General complex-manifold quotient or gluing theorems, the classification of universal covers,
  Fuchsian groups, the existence of period maps, analytic toric geometry, general singular
  homology, manifold collars and any particular global assembly are not targets here.

Suggested homes for new modules are `TauCeti/Geometry/ComplexTorus/`,
`TauCeti/Geometry/Manifold/Fibration/Torus/` and `TauCeti/Geometry/Manifold/LogTransform/`, beside
the existing modules under `TauCeti/Algebra/Module/ZLattice/Family/` and
`TauCeti/RepresentationTheory/Cyclic/`.

## Exact supplier contracts

### From Mathlib

- Lattices and quotients: `Submodule ℤ E`, `LinearMap.range`, `DiscreteTopology`, `IsZLattice`
  (a discrete `L` spanning `E` over `ℝ`), `AddAction.orbitRel.Quotient`, `ProperlyDiscontinuousVAdd`,
  `IsAddQuotientCoveringMap` and
  `isAddQuotientCoveringMap_quotientMk_of_properlyDiscontinuousVAdd` (the orbit map of a free,
  properly discontinuous, continuous action on a locally compact Hausdorff space is a covering
  map), `AddAction.instChartedSpaceQuotient` (the quotient atlas for such an action),
  `isOpenMap_quotient_mk'_add` (the orbit map of a continuous action is open),
  `Quotient.instConnectedSpace`, `t2Space_of_properlyDiscontinuousVAdd_of_t2Space`.
- Manifolds: `ContMDiff`, `IsManifold`, `IsLocalDiffeomorph`, `Diffeomorph`, `ContMDiffConstVAdd`,
  `LieAddGroup`, `Manifold.IsImmersion`, `FiberBundle`, `VectorBundle`, `ContMDiffVectorBundle`.
- Linear algebra and representations: `LinearMap`, `LinearEquiv`, `ContinuousLinearMap`,
  `ContinuousLinearEquiv`, `Representation`, `Representation.norm` (the sum over the group),
  `Module.Dual`, exterior powers, quotient modules, `AddSubgroup.torsionBy`,
  `Submodule.torsionBy`, `Finset.range`, `AddCircle`, `ZMod`, `rootsOfUnity`.
- Group cohomology: `groupCohomology`; `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` and
  `Rep.FiniteCyclicGroup.groupCohomologyIsoEven` (for a finite cyclic group generated by `g`,
  cohomology in odd, respectively positive even, degree is the homology of
  `Rep.FiniteCyclicGroup.subCompNormHom`, respectively `Rep.FiniteCyclicGroup.normHomCompSub`);
  `Rep.FiniteCyclicGroup.groupCohomologyπOdd`, `Rep.FiniteCyclicGroup.groupCohomologyπEven` and
  their equality criteria `Rep.FiniteCyclicGroup.groupCohomologyπOdd_eq_iff`,
  `Rep.FiniteCyclicGroup.groupCohomologyπEven_eq_iff`; `groupCohomology.map`; the connecting map
  `groupCohomology.δ` of a short exact sequence of representations, with
  `groupCohomology.δ_apply` (its value on a cocycle through a lift), `groupCohomology.δ_naturality`
  (naturality in morphisms of short exact sequences) and `groupCohomology.isIso_δ_of_isZero` (it
  is an isomorphism when the middle term has vanishing cohomology in the two adjacent degrees).

### From Tau Ceti

All declarations named in this roadmap are proved at the pin. Those that realise its own items are
named on the *In Tau Ceti:* lines of the milestones above. Unless stated there, the period-family
declarations among them take `Λ` finite free, `E` a finite-dimensional real normed space that is
also a normed space over the field of the regularity statements (no compatibility between the two
structures is assumed), `[∀ y, DiscreteTopology (LinearMap.range (Π y))]`,
`[∀ y, IsZLattice ℝ (LinearMap.range (Π y))]`, injectivity of every `Π y` as an explicit
hypothesis, `Y` Hausdorff and locally compact, and coordinatewise `C^n` periods for the regularity
statements, over any nontrivially normed field (`ℂ` for the holomorphic statements). The homology
of a lattice quotient takes `E : Type`, the marking takes `Y` and `E` in `Type`, and the cyclic
cohomology takes `T`, `Λ` and `E` in `Type`. Besides these, the roadmap consumes:

- *Quotient manifolds* (`TauCeti.Geometry.Manifold.Instances.Quotient`): for a free, properly
  discontinuous action by `C^n` maps on a Hausdorff, locally compact `C^n` manifold,
  `TauCeti.instIsManifoldQuotient` and `TauCeti.instIsManifoldAddQuotient` (the orbit space is a
  `C^n` manifold for the installed quotient atlas), `TauCeti.isLocalDiffeomorph_addQuotientMk`
  (the orbit map is a `C^n` local diffeomorphism), and `TauCeti.freeLocus.instIsManifold` (the free
  locus of a properly discontinuous action is an open `C^n` submanifold);
  `TauCeti.contMDiff_orbitRelQuotientLift_iff` and `TauCeti.contMDiff_orbitRelQuotientMap`
  (`TauCeti.Geometry.Manifold.Quotient.Descent`: an invariant map descends to a `C^m` map exactly
  when it is `C^m`, and a `C^m` equivariant map between two such actions induces a `C^m` map of
  orbit spaces, for `m ≤ n`). These specialise the quotient theorem of ComplexManifolds
  Milestone 4 to the orbit quotients here.
- *Universal covers*: the universal cover `TauCeti.UniversalCover`,
  `TauCeti.UniversalCover.isCoveringMap`, and the uniqueness of pointed simply connected, locally
  path-connected covers `IsCoveringMap.exists_homeomorph_comp_eq_of_simplyConnectedSpace` (the
  completed UniversalCovers roadmap), for §1.4.
- *The rotated and punctured discs*: `TauCeti.rootsOfUnityBall` and
  `TauCeti.rootsOfUnityBallQuotientHomeomorph` (the disc of radius `r` modulo `rootsOfUnity m ℂ`
  is the disc of radius `r^m` by `z ↦ z^m`; `TauCeti.Analysis.Complex.RootsOfUnity.Quotient`), for
  Milestone 5; `TauCeti.puncturedDiscPow`, `TauCeti.isCoveringMap_puncturedDiscPow` and
  `TauCeti.puncturedDiscPowDeckMulEquiv` (`z ↦ z^e` on the punctured unit disc is a covering with
  deck group `rootsOfUnity e ℂ`; `TauCeti.Topology.Covering.PuncturedDisc`), for §6.1.

### From TauCetiRoadmap.ComplexManifolds

Milestone 1 (the underlying real manifold of a complex manifold, for §2.3); Milestone 4 (complex
quotients by free properly discontinuous holomorphic actions and holomorphic descent, for
§§1.1, 5.2–5.3); Milestones 5–6 (compatible open gluing with its separation criteria, for §6.4);
Milestone 7 (holomorphic line bundles: 7.4 the normal bundle of a closed complex hypersurface,
7.5 the canonical bundle, and 7.6 the line bundle of a character of a finite deck group, of exact
order the order of the character when the covering manifold is connected and compact, for
§§5.4–5.5).

### From TauCetiRoadmap.AlgebraicTopology

§2.6 (local coefficient systems, for §2.5), §5.4 (the homology of tori as exterior powers, for
§1.4), §5.5 (fibre transport for fibrations, for §§2.5 and 3.4), and its fundamental groups and
singular homology for §6.6.

### From TauCetiRoadmap.GeometricTopology

§1.1 (smooth collars) and §1.3 (gluing along the boundary), for §6.4.

## References

- Christina Birkenhake and Herbert Lange, *Complex Abelian Varieties*, second edition, Chapters
  1 and 8, for complex tori, period lattices, morphisms and families.
- J. S. Milne, *Class Field Theory*, version 4.03 (2020), Chapter II, Example 1.20, Remark 1.21
  and Proposition 3.4, for the cohomology of finite cyclic groups,
  [jmilne.org/math/CourseNotes/CFT.pdf](https://www.jmilne.org/math/CourseNotes/CFT.pdf).
- Wolf P. Barth, Klaus Hulek, Chris A. M. Peters and Antonius Van de Ven, *Compact Complex
  Surfaces*, second edition, Chapter V, "Logarithmic Transformations" (beginning on p. 216).
- Fedor Bogomolov and Yuri Tschinkel, *Special elliptic fibrations*, §3, pp. 3–4 of the arXiv
  version, [arXiv:math/0303044](https://arxiv.org/abs/math/0303044).
