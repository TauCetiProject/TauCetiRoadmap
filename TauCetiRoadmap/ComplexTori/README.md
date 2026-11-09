# Complex tori: varying lattices and logarithmic transforms

This roadmap develops complex tori and holomorphic families of them from period lattices, then
builds cyclic affine quotients and logarithmic transforms at their natural generality. The
resulting library keeps the period lattice visible, distinguishes quotient coverings from family
projections, and classifies cyclic affine actions through torus cohomology and its integral
connecting class.

Suggested homes are `TauCeti/Geometry/ComplexTorus/`,
`TauCeti/Geometry/Manifold/Fibration/Torus/`, and
`TauCeti/Geometry/Manifold/LogTransform/`.

## Scope and completion criterion

The roadmap is complete when Tau Ceti proves all of the following.

1. A full discrete lattice in a finite-dimensional complex normed vector space gives the standard
   orbit quotient a compact connected complex Lie-group structure, functorially in complex linear
   maps preserving lattices.
2. A coordinatewise-holomorphic family of full period lattices over a complex manifold gives a
   complex manifold whose map to the base is a holomorphic submersion with complex-torus fibres.
   The map from the product before quotienting is separately a covering map and local
   biholomorphism.
3. Equivariant period data descend through properly discontinuous actions on the base, with local
   submersion charts, monodromy, marked homology, and natural base change. Smooth local triviality
   and holomorphic isotriviality are separate theorems with their own hypotheses.
4. A finite cyclic affine action has a complete algebraic API: the iterate formula, the norm-sum
   criterion for period dividing `m`, a separate exact-order criterion, translation-conjugacy
   classes in the additive group `H¹(C_m,T)`, the connecting homomorphism and equivalence with
   `H²(C_m,Λ)`, and an exact fixed-point and freeness criterion for every nonidentity power.
5. Cyclic affine actions over a rotated disc produce holomorphic multiple fibres and logarithmic
   transforms while retaining the varying lattice. Their multiplicity, normal-bundle character,
   canonical character, punctured-disc gauges, and change-of-choice laws are proved.
6. Fundamental-group and homology maps induced by the punctured collar and filling are derived
   from the actual quotient and bundle maps, ready for use by geometric constructions without
   construction-specific theorem records.

This roadmap owns complex-torus quotients, varying period families, their equivariant descent,
cyclic affine actions, and analytic logarithmic transforms. It does not own general complex-
manifold quotient or gluing theorems, universal-cover classification, Fuchsian groups, period-
function existence, analytic toric geometry, general singular homology, manifold collars, or a
specific global assembly.

## Ownership and dependencies

- The [complex-manifolds roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/pull/279) owns realification, free properly discontinuous smooth and
  complex quotients, holomorphic descent, holomorphic bundles, and compatible open gluing. This
  roadmap consumes those results on the standard orbit quotient and adds the torus-family and
  cyclic-affine geometry.
- The [completed universal-covers roadmap](../../Completed/UniversalCovers/README.md) owns covering spaces, deck groups,
  and lifting. This roadmap uses its quotient-cover and monodromy interfaces; it does not package
  another equivariant universal cover.
- The [algebraic-topology roadmap](../AlgebraicTopology/README.md) owns general fundamental groups, singular homology, Wang
  sequences, transfer, and homology of tori. This roadmap proves which maps arise from a torus
  family or logarithmic transform and applies that generic theory.
- The [geometric-topology roadmap](../GeometricTopology/README.md) owns collars and boundary
  gluing. This roadmap constructs the analytic punctured-disc gauges and proves their boundary
  maps are smooth and holomorphic where appropriate.
- The [analytic-toric-geometry roadmap](../../Completed/AnalyticToricGeometry/README.md) owns analytic
  manifolds from finite regular fans. This roadmap treats smooth period-lattice families and
  finite cyclic multiple fibres.
- The [Fuchsian-groups roadmap](../FuchsianOrbifolds/README.md) owns orbifold bases and their quotient uniformization. An orbifold
  torus family supplies its period representation and then consumes this roadmap's equivariant
  descent.

Coordinate with those roadmaps before integrating an overlapping implementation. Mathlib owns
the shape of its quotient, manifold, lattice, and bundle APIs; Tau Ceti implements missing
results at the dependency pin rather than waiting for another repository.

## Mathlib inventory

Use the following objects without replacement wrappers.

- `Submodule ℤ E`, `LinearMap.range`, `DiscreteTopology`, and `IsZLattice ℝ L` for a period
  lattice. `IsZLattice` supplies full real rank; do not add a second rank witness.
- `AddAction.orbitRel.Quotient` for every translation quotient,
  `ProperlyDiscontinuousVAdd`, `IsAddQuotientCoveringMap`, and the complex-quotient theorem from
  the complex-manifolds roadmap.
- `LinearMap`, `LinearEquiv`, `ContinuousLinearMap`, `ContinuousLinearEquiv`, `Representation`,
  `Module.Dual`, exterior powers, and quotient modules for period maps and monodromy.
- `ContMDiff`, `IsLocalDiffeomorph`, `ContMDiffMap`, `FiberBundle`, `VectorBundle`, and
  `ContMDiffVectorBundle` for the manifold and fibration interfaces.
- Mathlib's `AddCircle`, finite cyclic groups, `Finset.range`, quotient modules, kernels, and ranges
  for the cyclic affine calculation. Use
  [`groupCohomology`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.html#groupCohomology),
  `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`, `groupCohomologyIsoEven`,
  `groupCohomologyπOdd_eq_iff`, `groupCohomologyπEven_eq_iff`, `Representation.norm`,
  `groupCohomology.map`, `groupCohomology.δ`, `δ_naturality`, and `isIso_δ_of_isZero`.

The pinned Tau Ceti module `TauCeti.Geometry.Manifold.Instances.Quotient` already supplies
`TauCeti.instIsManifoldQuotient` and `TauCeti.isLocalDiffeomorph_quotientMk` on Mathlib's
installed quotient atlas. Consume their complex specialization through ComplexManifolds.
[mathlib4#40727](https://github.com/leanprover-community/mathlib4/pull/40727) is an API migration
reference; compare its atlas with the installed atlas before changing local-section calculations.

## Encoding conventions

- Fix a finite free ℤ-module `Λ`, a finite-dimensional complex normed vector space `E`, and a
  complex manifold `Y` with explicit `T2Space Y` and `SecondCountableTopology Y` instances. A
  period family is stated directly as
  `Π : Y → (Λ →ₗ[ℤ] E)`, together with coordinatewise holomorphy
  `∀ λ, ContMDiff I 𝓘(ℂ, E) ∞ (fun y ↦ Π y λ)`, pointwise injectivity, and the hypotheses
  `[DiscreteTopology (LinearMap.range (Π y))]` and
   `[IsZLattice ℝ (LinearMap.range (Π y))]` for each `y`. Do not bundle these propositions merely
   to give the constructor a custom input record.
- The lattice acts on `Y × E` by
  `λ +ᵥ (y, v) = (y, v + Π y λ)`. The total space is the standard
  `AddAction.orbitRel.Quotient Λ (Y × E)` for this action, not a tagged quotient.
- Write `q : Y × E → (Y × E)/Λ` for the orbit projection. It is a covering map and local
  biholomorphism. Write `p : (Y × E)/Λ → Y` for the map descended from `Prod.fst`. It is a
  holomorphic submersion with compact torus fibres. These are different maps with different
  local models; no theorem calls `p` a local diffeomorphism when `E` has positive dimension.
- Monodromy acts on the single lattice `Λ`; actions on homology are derived functorially from it.
  A choice of basis yields coordinate lemmas, not a second matrix-valued representation.
- A logarithmic transform retains the varying period family. Replacing it by a product with one
  fixed torus is not an admissible intermediate API.
- The cyclic cohomology calculation uses an abstract additive automorphism `A_T : T ≃+ T`. The
  analytic quotient constructor instead takes a complex-linear equivalence
  `A_E : E ≃L[ℂ] E` preserving `Λ` in both directions and proves that its descended additive
  automorphism of `T` is biholomorphic; equivalently, it may take an additive torus automorphism
  together with holomorphy of it and its inverse. A lattice automorphism or additive torus
  automorphism alone is not analytic input.
- Say **`m`-periodic** or **of order dividing `m`** when only the `m`-th power is known to be the
  identity. Say **of exact order `m`** only after excluding every smaller positive power.
  Likewise `T[m]` denotes the `m`-torsion subgroup, not the subset of elements of exact order
  `m`.
- Clockwise and counterclockwise meridians are separate conventions. Once one is selected, prove
  that reversing it inverts monodromy and negates additive twist data.

## Milestone 1: fixed complex tori

Let `L : Submodule ℤ E` have its subtype topology, `[DiscreteTopology L]`, and
`[IsZLattice ℝ L]`.

1. Construct the translation action on `E`, prove it free and properly discontinuous, and use the
   standard additive orbit quotient. Apply the complex-manifold quotient theorem to prove that the
   quotient is a complex manifold and the orbit map is a local biholomorphism.
2. Descend addition, negation, and zero and prove the complex Lie-group laws. Prove compactness
   from a lattice fundamental domain, connectedness, Hausdorffness, and second countability.
3. For a complex linear map `f : E →ₗ[ℂ] E'` satisfying `L.map (f.restrictScalars ℤ) ≤ L'`, construct the induced
   holomorphic homomorphism of tori. Prove identity, composition, and products. The kernel is the closed complex Lie subgroup
   `f⁻¹(L')/L`; its identity component is the torus `ker f / (L ∩ ker f)`, using the
   induced full lattice on `ker f`, and its component group is `(L' ∩ range f)/f(L)`.
   Prove the equivalence criterion for continuous linear equivalences carrying one lattice
   onto the other.
4. Identify the universal covering and deck action through the universal-covers roadmap. Consume
   the algebraic-topology roadmap to identify `π₁` and integral homology with the lattice and its
   exterior powers, naturally in induced maps.

Birkenhake--Lange, *Complex Abelian Varieties*, Chapter 1, supplies the quotient, morphism, and
period-lattice source spine. The roadmap treats all compact complex tori, without assuming a
polarization or algebraicity.

## Milestone 2: holomorphic families from varying periods

Use the direct period-family hypotheses fixed above.

1. Prove the period translation is an `AddAction Λ (Y × E)`, is free, and is properly
   discontinuous. First prove `uniform_period_separation_on_compact`: on each compact `K ⊆ Y`
   there is a positive lower bound for the norm of every nonzero period at every point of `K`.
   Equivalently, after choosing a lattice basis, prove a uniform bound for the inverse period maps.
   Use that estimate to construct bounded fundamental representatives and prove orbit-local
   finiteness. Pointwise discreteness alone does not discharge this target.
2. Give the standard orbit quotient its complex-manifold structure. Prove that
   `q : Y × E → (Y × E)/Λ` is a covering map and local biholomorphism.
3. Descend `Prod.fst` to `p : (Y × E)/Λ → Y`. Prove that `p ∘ q = Prod.fst`, that `p` is a
   holomorphic submersion, and construct submersion coordinates around each point of its total
   space. Identify the fibre over `y` biholomorphically with
   `E / LinearMap.range (Π y)`. Choose a ℤ-basis `λ_i` as a proof choice and construct the real-linear equivalence
   `F_y : ℝ^d ≃ₗ[ℝ] E`, `e_i ↦ Π(y) λ_i`, from injectivity and `IsZLattice`. Prove smooth
   dependence of `F_y` and its inverse, then descend `[y,v] ↦ (y,[F_y⁻¹ v])` to a global
   smooth trivialization with fibre `ℝ^d/ℤ^d`. Prove independence of the chosen basis up to
   its integral change-of-basis map; this real-linear trivialization is not a holomorphic one. Call the family a
   holomorphic fibre bundle with one fixed compact fibre only under an isotriviality hypothesis;
   varying `τ` in `ℂ/(ℤ + τ(y)ℤ)` is the regression test which must not satisfy that conclusion.
4. Prove fibre compactness, total-space Hausdorffness and second countability, existence and
   holomorphy of the zero section, and naturality under base change from the explicit Hausdorff,
   second-countability, continuity, and coordinatewise-holomorphy hypotheses on `Y` and `Π`.
5. Construct the canonical marking `H₁(T_y;ℤ) ≅ Λ` by lifting loops to `E` and taking their
   period displacement. Prove naturality in `y`, compatibility with the fibre identification
   in item 3, and trivial monodromy of this globally marked family. Describe change of an
   arbitrary marking by `Aut(Λ)`. Consume AlgebraicTopology Stage 2.6 for local-coefficient
   systems and Stage 5.5 for bundle monodromy.

For the analytic family construction use Birkenhake--Lange, Chapter 8, on families and period
data, together with the quotient-manifold source spine in the complex-manifolds roadmap.

## Milestone 3: equivariant descent and monodromy

Let a discrete group `Γ` act properly discontinuously by biholomorphisms on `Y`. Let
`ρ : Representation ℤ Γ Λ` and a holomorphic family of complex linear equivalences
`R_g(y) : E ≃L[ℂ] E` satisfy the exact cocycle and period-equivariance laws.  There are two
constructors, with different inputs and conclusions.

1. The **linear constructor** lifts the action to `Y × E` by
   `(y, v) ↦ (g • y, R_g(y) v)`. Prove the group law from the cocycle and prove that it normalizes
   the period translation action using
   `Π (g • y) (ρ g λ) = R_g(y) (Π y λ)`.  Its descended action preserves the zero section, so it
   is free only when the base action is free.  This constructor is not used to remove a base
   stabilizer.
2. The **affine constructor** additionally takes a holomorphic section
   `b_g : Y → g^*T` of the pulled-back torus family, so
   `b_g(y) ∈ T_(g • y)`, satisfying
   `b_(gh)(y) = b_g(h • y) + R_g(h • y)(b_h(y))` and `b_1 = 0`.  Define
   `g(y,x) = (g • y, R_g(y)x + b_g(y))` on the fibrewise torus family.  Prove the action law,
   holomorphy, inverse formula, and compatibility with the period quotient.  Formulating `b` on
   the torus family is intentional: no unnecessary global vector-space lift is required.
3. Descend either action, prove it biholomorphic and properly discontinuous under explicit
   orbit-local-finiteness hypotheses.  For the affine constructor, state freeness for the induced
   action on the **total torus-family space**, not merely on the base, and prove it from
   Milestone 4's torus fixed-point criterion at every base stabilizer. Only then form the standard
   second quotient.  This constructor includes elliptic base points whose stabilizers are removed
   by a fibre translation.
4. Descend the family projection to `Y/Γ`, prove submersion charts over the free locus, and identify
   its monodromy as follows. For a loop lifted from `y` to `g • y`, identify the endpoint
   fibre back with the starting fibre by the inverse action: transport on the marking is
   `ρ(g⁻¹)`. Equivalently a lift ending at `g⁻¹ • y` has monodromy `ρ(g)`. Prove this formula
   before the reversal law, and descend the smooth trivializations from Milestone 2 over the
   free locus. Derive the action on homology through exterior powers.
5. Prove naturality under equivariant base change, conjugation of the marking, and reversal of
   loop orientation.

As a regression test, take a base fixed point and a nonzero torsion translation on its torus
fibre.  The affine constructor admits the resulting fixed-point-free fibre action.  The linear
constructor fixes the fibre origin and therefore cannot prove total-space freeness there.

The universal-covers roadmap supplies deck and monodromy foundations; this milestone owns only
their application to period-lattice families.

## Milestone 4: cyclic affine algebra on a torus

Let `T = E/Λ`, let `A_T : T ≃+ T` be an additive automorphism, and fix `m > 0`. This milestone is
abstract additive algebra: `A_T` is not assumed holomorphic. The public translation parameter is
`t : T`; an element of `Λ` is zero in `T` and cannot parameterize the affine geometry. Period,
exact-order, and freeness hypotheses are theorem arguments, not fields whose intended consequences
are assumed.

### Torus-level affine algebra

1. Define `affineEquiv A_T t : T ≃ T` by `x ↦ A_T x + t` and
   `N_{A,k}(t) = ∑ i ∈ Finset.range k, A_T^i t`. Prove for every `k`

   `affine(A_T,t)^k(x) = A_T^k x + N_{A,k}(t)`.

2. Under `A_T^m = 1`, prove that the affine generator has `m`-th power equal to the identity
   exactly when `N_{A,m}(t) = 0` in `T`; these conditions give order dividing `m`. Prove that it
   has exact order `m` exactly when, in addition, for every `0 < k < m` either `A_T^k ≠ 1` or
   `N_{A,k}(t) ≠ 0`. Derive an action of `ZMod m` from periodicity without calling it faithful;
   faithfulness follows from the exact-order theorem.
3. Prove that conjugation by translation sends `t` to `t + (1-A_T)b`. For
   `A_T^m = 1`, construct the representation in `Rep ℤ C_m`, where
   `C_m = Multiplicative (ZMod m)` and its selected generator acts by `A_T`.
   Classify translation-conjugacy classes in Mathlib's `groupCohomology` in degree one.
   Its finite-cyclic isomorphism computes this as `ker N_A / range(A_T-1)`.
   Prove `range(A_T-1) = range(1-A_T)` by negation, and compare `Representation.norm`
   with the ordered sum of powers. Use Mathlib's quotient maps and equality criteria,
   rather than defining another public `H¹` carrier. Retain the partial norms `N_{A,k}`
   for arbitrary `k`, which are needed for the iterate and fixed-point formulas.
   For the period-two consumer, prove `cyclicNormHom σ 2 = id + σ` and
   `oneSubPow σ 1 = id − σ`, and both zero-composite laws when `σ² = id`.
   Use `Rep.FiniteCyclicGroup.normHomCompSub` and `subCompNormHom` as the shared
   short complexes; negating Mathlib's `σ − id` gives the displayed difference convention.
   These statements hold for every additive commutative group, including groups with
   2-torsion. The compatibility contract of
   [GeometryOfNumbersAndQuadraticArithmetic #851](https://github.com/TauCetiProject/TauCetiRoadmap/pull/851)
   uses these complexes and comparisons in place of the obsolete `oneSubToNormKer` helper.
   Its spectral transfer and Tate constructions remain with that consumer.
4. Prove

   `affine(A_T,t)^k` has a fixed point
   `↔ N_{A,k}(t) ∈ range(1-A_T^k : T → T)`.

   Thus the action is free exactly when this membership fails for every `0 < k < m`. State the
   prime-order simplification and check every nonidentity power for composite `m`.

### Integral connecting class

5. Fix the equivariant short exact sequence `0 → Λ → E → T → 0` in `Rep ℤ C_m`.
   Its input consists of compatible actions `A_Λ`, `A_E`, `A_T`, each with `m`-th power
   one, with `A_E` real-linear, and equivariant inclusion and quotient maps. Construct
   these representations from the automorphisms and prove their exactness. For a lift
   `t̃ : E` of a norm-zero `t`, show `N_A(t̃) ∈ Λ^A`; changing the lift by `λ` adds
   `N_A(λ)`. Use `groupCohomology.δ` as the connecting homomorphism
   `H¹(C_m,T) → H²(C_m,Λ)`, and the finite-cyclic isomorphism to compute the latter
   as `Λ^A/N_AΛ`. Fix the generator `1 mod m` and the cocycle determined by its value
   `t`; verify against `δ_apply` that the connecting class is `[N_A(t̃)]` and hence
   that `δ(v/m) = [v]` for `v ∈ Λ^A`, with the displayed positive sign.

   Prove vanishing in degrees one and two for the real-vector-space representation
   `E` using the periodic complex and division by `m`. This is the finite cyclic
   special case of [SmoothRepresentationsOfLocalGroups SR.0d.2, #793](https://github.com/TauCetiProject/TauCetiRoadmap/pull/793).
   Use `isIso_δ_of_isZero` to obtain the connecting isomorphism and its underlying
   additive equivalence. The periodic proof supplies this case independently of the
   more general supplier.
6. Prove naturality under morphisms of equivariant short exact sequences, products,
   and restriction along homomorphisms of finite cyclic groups, using
   `groupCohomology.map` and `δ_naturality`. In a varying family, base change along a
   holomorphic `f : Y' → Y` means pulling back the marked lattice, vector-space and
   torus local systems and their short exact sequence; construct the induced fibrewise
   cohomology comparisons and prove that `δ` commutes with them. When all actions are
   trivial, prove `H¹(C_m,T) ≃+ AddSubgroup.torsionBy T m` and
   `T[m] ≃+ Λ/mΛ`. Exact order still requires Step 2's separate criterion.

Brown, *Cohomology of Groups*, Chapter VI, Section 2, supplies the cyclic norm, invariants,
coinvariants, and periodic cohomology spine. The fixed-point criterion follows directly from the
affine iterate equation and is proved in the torus quotient, not asserted as a freeness field.

## Milestone 5: cyclic quotients and multiple fibres

Let `D_z` be the unit disc, `ζ = exp(2πi/m)` for `m > 0`, and `r(z) = ζz`.
Consume Milestone 3's full holomorphic cyclic affine cocycle `(R_g(z), b_g(z))` on
its varying torus family `X → D_z`, with the period-equivariance and action laws.
In the constant-linear-part specialization require
`A_E(Π(z)λ) = Π(ζz)(A_Λ λ)`. The translation law is the full orbit sum of sections,
not a norm equation in one fixed fibre. At zero the generator has linear part
`R_g(0)` and translation `b_g(0)`, so Milestone 4 applies there.

1. Construct the biholomorphic total action using Milestone 3. Away from zero the
   base rotation is free. At zero require Milestone 4's fixed-point exclusion for
   every nonidentity power. Prove total-space freeness and exact order `m`.
2. Form the standard quotient `Q = X/C_m` and descend `t = z^m` to
   `p_Q : Q → D_t`. Prove it is a holomorphic submersion off zero.
3. Define `F` as the image of the central torus `T_0` in `Q`. Prove that it is an
   embedded complex hypersurface, equals `p_Q⁻¹(0)` as a set, and is biholomorphic
   to `T_0/C_m`. In transverse charts prove `t = a u^m` with `a` a holomorphic unit;
   thus the vanishing order along `F`, and the fibre multiplicity, is exactly `m`.
4. With associated-bundle convention `(x,v) ↦ (g x, χ(g)v)`, identify the normal
   character as `ζ` and prove `N_(F/Q)^⊗m` trivial. For exact order use
   [ComplexManifolds Milestone 7.6, #279](https://github.com/TauCetiProject/TauCetiRoadmap/pull/279),
   including its connected compact cover and constant-unit hypotheses.
5. In the constant-linear-part case distinguish `K_Q|_F`, with character
   `(ζ · det A_E)⁻¹`, from `K_F`, with character `(det A_E)⁻¹`. Prove adjunction
   `K_F ≅ K_Q|_F ⊗ N_(F/Q)`. For varying linear part use the corresponding
   determinant transition cocycle. Apply ComplexManifolds Milestone 7.6 to the character cases,
   and prove smoothness, compactness and manifold instances for `F`.

Barth--Hulek--Peters--Van de Ven, *Compact Complex Surfaces*, second edition, Chapter V, the
section “Logarithmic Transformations” (beginning on p. 216), supplies the local cyclic-quotient
model. The statements here allow higher-dimensional torus fibres.

## Milestone 6: logarithmic gauges and regluing

Distinguish `D_z` and `D_t`, their punctured subspaces, and
`β_m : D_z* → D_t*`, `β_m(z) = z^m`. Fix a varying marked period family
`Y → D_t`, set `X = β_m^*Y → D_z`, and form `Q = X/C_m → D_t` using
Milestone 5. The logarithmic transform uses trivial linear part; general linear
cocycles remain in Milestone 5.

1. For any free equivariant family of Milestone 5 prove the canonical covering
   identification `X* ≃_[D_z*] β_m^*Q*`, with forward map
   `x ↦ (p_X(x), [x])`. Expose the inverse, both projection equations and
   holomorphy. Give the literal subtype-of-product pullback its atlas by lifting the
   installed total-space atlas of `Q*` through the local inverse branches of `β_m`;
   prove the second projection is a local biholomorphism. An independently supplied
   `ChartedSpace` or manifold instance on the pullback is not an input to the theorem.
   This theorem requires no logarithm.
2. For trivial linear part lift the generator's holomorphic translation section
   `b` to `b̃ : D_z → E` by lifting through the period covering of the simply
   connected disc. The action law gives a constant `λ ∈ Λ` such that
   `∑_(j<m) b̃(ζ^j z) = Π_Y(z^m)λ`. Put
   `f(z) = b̃(z) − Π_Y(z^m)λ/m` and
   `c(z) = −(1/m)∑_(j<m) j f(ζ^j z)`.
   Prove `c(ζz) − c(z) = −f(z)`, so the change of fibre coordinate
   `x ↦ x+c(z)` normalizes the cocycle to `Π_Y(z^m)λ/m`.
   Identify the invariant `λ mod mΛ` with `b(0) ∈ T_0[m]` and with
   `H¹(C_m,T_0)` for the trivial action; central freeness means exact order `m`.
   A different lift changes `λ` by `mΛ`; prove the corresponding normalization and
   overlap-identification comparison, rather than treating a representative `λ` as canonical.
3. For normalized data prove a separate downstairs gauge
   `G : Q* ≃_[D_t*] Y*`. On a simply connected logarithm chart define

   `G[(z,[e])] = (z^m,[e − (Log z/2πi)Π_Y(z^m)λ])`.

   Use the counterclockwise meridian and `Log(ζz) = Log z+2πi/m` on compatible
   charts to prove cyclic invariance. A full branch change adds the period
   `−Π_Y(t)(kλ)`, so the local maps patch. The inverse sends `(t,[y])` to
   `[(z,[y+(Log z/2πi)Π_Y(t)λ])]` using a local root `z^m=t`.
   Prove independence of root and branch, the inverse identities and holomorphy.
   Compose with item 2 for non-normalized pure-translation data.
4. Fix an ambient complex manifold `M` containing the original `Y → D_t` as
   an open fibred neighbourhood. Glue `M` minus its central fibre to `Q` along
   `Y*`, using its inclusion into `M` and `G⁻¹ : Y* → Q*`.
   Apply ComplexManifolds Milestones 5–6 to these named pieces and maps, including
   their separation hypotheses. Restrict `G` to annular overlaps and the smooth
   collars of GeometricTopology to identify the actual regluing map.
5. Prove independence of radius, collar width, local logarithm, lift `b̃`, and
   linearizing coordinate, holding `M`, the marked family `Y`, the class
   `λ mod mΛ ≅ H¹(C_m,T_0)`, and the overlap identification fixed up to the
   induced isotopies/biholomorphisms. State the effect of changing this class.
6. Compute induced `π₁` and `H₁` maps from the constructed quotient and collar
   maps, with lattice generators and the selected meridian. Prove the inversion
   law under orientation reversal.

For the free involution `(z,x₁,x₂) ↦ (−z,x₁+a,−x₂)` on a constant family
of two elliptic curves, with `0 ≠ a ∈ E₁[2]`, the punctured quotient has
monodromy `id ⊕ (−id)`. Item 1 recovers the upstairs family after the double
cover. Item 3 does not apply: its pure-translation hypothesis fails, and this
quotient cannot be identified downstairs with a family extending over the disc
with trivial monodromy.

The logarithmic-transform section of Barth--Hulek--Peters--Van de Ven supplies
the local proof spine; compare [Bogomolov–Tschinkel, §3](https://arxiv.org/abs/math/0303044).

## Dependency order

Milestone 1 consumes the complex-manifolds, universal-covers, and algebraic-topology roadmaps.
Milestone 2 uses Milestone 1 and develops the compact-uniform lattice estimates in Milestone 2.1.
Milestone 3 uses Milestone 2 and the universal-covers roadmap. Milestone 4 is algebraic and can
proceed in parallel with Milestones 1--3. Milestone 5 uses Milestones 2–4 together with the
complex-manifolds roadmap's holomorphic-line-bundle API. Milestone 6 uses Milestone 5 together
with the complex-manifolds and geometric-topology gluing APIs.

## Acceptance checks

- A lattice range is accepted through `Submodule`, `DiscreteTopology`, and `IsZLattice ℝ`; a
  constructor which requires a chosen basis or a custom full-rank certificate does not discharge
  the target.
- In a varying family, `q : Y × E → (Y × E)/Λ` is proved a local biholomorphism while
  `p : (Y × E)/Λ → Y` is proved a holomorphic submersion. For `E ≠ 0`, no result claims that `p`
  is a local diffeomorphism.
- The fibre over `y` is identified with the standard orbit quotient by
  `LinearMap.range (Π y)`, not with a tagged complex-torus type.
- The period-two norm/difference comparisons and both zero composites work on `ZMod 2`
  with its identity involution, as well as on torsion-free groups; division by two is absent.
- A cyclic action cannot be constructed from `A ^ m = 1` without the translation norm equation.
- The abstract `H¹/H²` calculation accepts `A_T : T ≃+ T`, but the analytic cyclic quotient does
  not accept that alone: it consumes a complex-linear lift preserving the lattice or an explicitly
  biholomorphic additive torus automorphism.
- The equations `A_T^m = 1` and `N_{A,m}(t)=0` prove only order dividing `m`. Exact order uses the
  no-smaller-power criterion, and `T[m]` is consistently called the `m`-torsion subgroup.
- The iterate theorem computes every power on `T`, translation conjugacy changes the twist by
  `(1-A_T)b`, and the normalized class lies in `ker N_A / range(1-A_T)`. Its integral connecting
  class lies in `Λ^A/N_AΛ`. Both cohomology carriers are Mathlib `groupCohomology`; the concrete quotients compute
  them through its finite-cyclic isomorphisms. The connecting map is Mathlib’s `δ`,
  and the vanishing theorem makes it an isomorphism.
- For composite `m`, freeness checks every `0 < k < m` using
  `cyclicNorm A k t ∉ range(1-A^k)`. A proposition which checks only the generator is rejected.
- When `A = 1`, the classification specializes to the additive equivalence
  `T[m] ≃+ Λ/mΛ`; it does not specialize to `Λ` or claim that every `m`-torsion point has exact
  order `m`.
- A varying elliptic family with nonconstant period ratio has submersion charts but is not thereby
  declared holomorphically locally trivial with one fixed elliptic-curve fibre.
- The linear equivariant-family constructor fixes the zero section and requires a free base action
  for total-space freeness.  The separate affine constructor carries an actual torus-valued
  cocycle.  A nonzero torsion translation over a base fixed point is accepted only by the latter.
- The cyclic quotient retains the varying period lattice and proves the local equation
  `t = a u^m`; it is not replaced by a product with a fixed torus.
- Instantiate both punctured contracts with inherited subtype/product topologies and
  total-space model `ℂ × E`: a disc times an elliptic curve has complex dimension two,
  and the two-factor involution has dimension three. The covering identification recovers
  `X*` by pulling back `Q*`; only pure-translation data instantiate the downstairs gauge.
- Branch changes are lattice translations. The gauge patches over `D_t*`, while the
  canonical covering identification is over `D_z*`. The involution is a positive test
  for the covering theorem and a negative test for a trivial-monodromy downstairs gauge.

## References

- Christina Birkenhake and Herbert Lange, *Complex Abelian Varieties*, second edition, Chapters
  1 and 8, for complex tori, period lattices, morphisms, and families.
- Kenneth S. Brown, *Cohomology of Groups*, Chapter VI, Section 2, for cyclic norm and periodic
  cohomology calculations.
- Wolf P. Barth, Klaus Hulek, Chris A. M. Peters, and Antonius Van de Ven,
  *Compact Complex Surfaces*, second edition, Chapter V, “Logarithmic Transformations”.
