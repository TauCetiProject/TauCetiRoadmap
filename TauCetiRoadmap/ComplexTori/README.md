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

- The complex-manifolds roadmap owns realification, free properly discontinuous smooth and
  complex quotients, holomorphic descent, holomorphic bundles, and compatible open gluing. This
  roadmap consumes those results on the standard orbit quotient and adds the torus-family and
  cyclic-affine geometry.
- The [universal-covers roadmap](../UniversalCovers/README.md) owns covering spaces, deck groups,
  and lifting. This roadmap uses its quotient-cover and monodromy interfaces; it does not package
  another equivariant universal cover.
- The algebraic-topology roadmap owns general fundamental groups, singular homology, Wang
  sequences, transfer, and homology of tori. This roadmap proves which maps arise from a torus
  family or logarithmic transform and applies that generic theory.
- The [geometric-topology roadmap](../GeometricTopology/README.md) owns collars and boundary
  gluing. This roadmap constructs the analytic punctured-disc gauges and proves their boundary
  maps are smooth and holomorphic where appropriate.
- The analytic-toric-geometry roadmap owns fan constructions and toric degenerations. This
  roadmap treats smooth period-lattice families and finite cyclic multiple fibres; a toric
  degeneration consumes both roadmaps.
- The Fuchsian-groups roadmap owns orbifold bases and their quotient uniformization. An orbifold
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
  for the cyclic affine calculation.

The complex quotient work in
[mathlib4#40727](https://github.com/leanprover-community/mathlib4/pull/40727) determines the
orbit-quotient shape consumed here. Build the missing manifold theorem locally in the complex-
manifolds roadmap and replace it by imports when available.

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
3. For a complex linear map `f : E →ₗ[ℂ] E'` satisfying `f '' L ≤ L'`, construct the induced
   holomorphic homomorphism of tori. Prove identity, composition, products, kernels under the
   standard closedness hypotheses, and the equivalence criterion for continuous linear
   equivalences carrying one lattice onto the other.
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
   `E / LinearMap.range (Π y)`. Separately prove smooth local triviality from the compact-fibre
   proper-submersion theorem, with every properness hypothesis visible. Call the family a
   holomorphic fibre bundle with one fixed compact fibre only under an isotriviality hypothesis;
   varying `τ` in `ℂ/(ℤ + τ(y)ℤ)` is the regression test which must not satisfy that conclusion.
4. Prove fibre compactness, total-space Hausdorffness and second countability, existence and
   holomorphy of the zero section, and naturality under base change from the explicit Hausdorff,
   second-countability, continuity, and coordinatewise-holomorphy hypotheses on `Y` and `Π`.
5. Define markings as isomorphisms from the local system of first integral homology groups to the
   constant lattice local system. Prove change-of-marking and monodromy laws through the local-
   system or covering API, not through unrelated matrices at each fibre.

For the analytic family construction use Birkenhake--Lange, Chapter 8, on families and period
data, together with the quotient-manifold source spine in the complex-manifolds roadmap.

## Milestone 3: equivariant descent and monodromy

Let a discrete group `Γ` act properly discontinuously by biholomorphisms on `Y`. Let
`ρ : Representation ℤ Γ Λ` and a holomorphic family of complex linear equivalences
`R_g(y) : E ≃L[ℂ] E` satisfy the exact cocycle and period-equivariance laws.

1. Lift the action to `Y × E` by `(y, v) ↦ (g • y, R_g(y) v)`. Prove the group law from the
   cocycle and prove that it normalizes the period translation action using
   `Π (g • y) (ρ g λ) = R_g(y) (Π y λ)`.
2. Descend the action to the varying torus family, prove it biholomorphic and properly
   discontinuous under explicit orbit-local-finiteness hypotheses. State freeness for the induced
   action on the **total torus-family space**, not merely on the base, and prove it directly or
   deduce it from Milestone 4's torus fixed-point criterion at every base stabilizer. Only then form
   the standard second quotient. This includes elliptic base points whose stabilizers are removed
   by a fibre translation.
3. Descend the family projection to `Y/Γ`, prove submersion charts over the free locus, and identify
   its monodromy with `ρ`. Under the proper-submersion hypotheses, descend the separate smooth local
   trivializations. Derive the action on homology through exterior powers.
4. Prove naturality under equivariant base change, conjugation of the marking, and reversal of
   loop orientation.

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
3. Prove that conjugation by translation sends `t` to `t + (1-A_T)b`. Classify `m`-periodic
   translation-conjugacy classes by the literal additive-group quotient

   `H¹(C_m,T) = ker (N_A : T → T) / range (1-A_T : T → T)`.

   Implement `ker N_A` and `range(1-A_T)` as additive subgroups and `H¹` as their
   `QuotientAddGroup`, so its `AddCommGroup` structure, quotient homomorphism, induction principle,
   and lift theorem are available. Prove identity, change-of-representative, functoriality, and
   restriction homomorphisms in this carrier.
4. Prove

   `affine(A_T,t)^k` has a fixed point
   `↔ N_{A,k}(t) ∈ range(1-A_T^k : T → T)`.

   Thus the action is free exactly when this membership fails for every `0 < k < m`. State the
   prime-order simplification and check every nonidentity power for composite `m`.

### Integral connecting class

5. For a lift `t̃ : E` of `t`, prove `N_A(t̃) ∈ Λ^A`. Prove that changing `t̃` by `λ : Λ`
   changes this invariant by `N_A(λ)`, and hence obtain the connecting class

   `δ(t) ∈ Λ^A / N_A Λ = H²(C_m,Λ)`.

   Construct the connecting additive homomorphism
   `δ : H¹(C_m,T) →+ H²(C_m,Λ)` induced by the equivariant short exact sequence
   `0 → Λ → E → T → 0`. Use the vanishing of positive-degree finite-group cohomology of the
   real vector space `E` to construct an `AddEquiv` between these two carriers, and prove that
   its forward map is `δ`. For normalized data `t = v/m` with `v ∈ Λ^A`, compute `δ(t)`
   explicitly.
6. Prove functoriality under equivariant homomorphisms, products, restriction to subgroups, and
   base change for both cohomology carriers, with the connecting homomorphism natural in these
   maps. As the decisive regression test, when `A_T = 1`, prove that the `m`-periodic translations
   form the `m`-torsion subgroup and that `T[m] ≃+ Λ/mΛ`; a lattice cokernel of `A-1` must not
   appear. State any exact-order subset only after adding the exact-order criterion from Step 2.

Brown, *Cohomology of Groups*, Chapter VI, Section 2, supplies the cyclic norm, invariants,
coinvariants, and periodic cohomology spine. The fixed-point criterion follows directly from the
affine iterate equation and is proved in the torus quotient, not asserted as a freeness field.

## Milestone 5: cyclic quotients and multiple fibres

Let `D` be a complex disc with a rotation `r` of exact order `m`, and let a varying torus family
over `D` carry compatible period monodromy and affine translation data from Milestone 4. In
addition to the additive class, fix a complex-linear equivalence `A_E : E ≃L[ℂ] E` preserving
the period lattice in both directions and inducing `A_T`, or supply the equivalent
biholomorphic additive automorphism of each torus fibre.

1. Construct the generator on the total torus family and prove it biholomorphic from the
   complex-linearity and lattice-preservation hypotheses, not merely from the additive
   automorphism `A_T`. Prove its `m`-th power is the identity from `A_E ^ m = 1` (hence
   `A_T ^ m = 1`) and the translation norm equation. Use the exact fixed-point criterion to prove
   that the action is free; the exact order of the base rotation makes the total generator have
   exact order `m`.
2. Take the standard complex quotient and descend the base map `z ↦ z^m`. Prove this map is a
   holomorphic submersion away from the central fibre and has a multiple central fibre of
   multiplicity exactly `m`.
3. In every transverse chart prove the local normal form `t = a u^m`, with `a` a nowhere-zero
   holomorphic unit. Identify the reduced fibre and its quotient by the central affine action.
4. Use the complex-manifolds roadmap's holomorphic-line-bundle API to prove that the normal bundle
   of the reduced fibre has `m`-th tensor power trivial. Identify its character. Prove exact order
   only by the associated-character-to-Picard injectivity criterion from that roadmap, with the
   connected compact covering-space and constant-invertible-holomorphic-function hypotheses
   displayed; faithful base rotation alone proves only divisibility.
5. Compute the canonical-bundle character from the derivative of the affine generator and give an
   exact-order criterion using the same injectivity theorem. Prove smoothness, compactness, and
   complex-manifold instances for the reduced quotient under their explicit hypotheses.

Barth--Hulek--Peters--Van de Ven, *Compact Complex Surfaces*, second edition, Chapter V, the
section “Logarithmic Transformations” (beginning on p. 216), supplies the local cyclic-quotient
model. The statements here allow higher-dimensional torus fibres.

## Milestone 6: logarithmic gauges and regluing

1. Over a punctured disc, construct logarithmic gauges from a chosen branch of logarithm. Prove
   that changing the branch acts by the corresponding lattice translation and therefore gives the
   same descended biholomorphism.
2. Identify the punctured restriction of the cyclic quotient with the original varying torus
   family after the prescribed base change. Prove the forward and inverse formulas and their
   holomorphy.
3. Construct compatible smooth collars through the geometric-topology roadmap and prove that the
   punctured gauge restricts to the collar map used for regluing. Apply the complex-manifolds
   roadmap's open-gluing theorem to the analytic pieces.
4. Prove independence, up to biholomorphism over the base, of disc radius, collar width, logarithm
   branch, and linearizing coordinate while holding the period family and class in `H¹(C_m,T)`--or
   equivalently its connecting class in `Λ^A/N_AΛ`--fixed. State separately how changing that class
   changes the gluing map.
5. Compute the induced maps on fundamental groups and first homology from the actual collar and
   quotient maps. Record fibre lattice generators and the selected meridian convention, and prove
   the inversion law under orientation reversal.

The logarithmic-transform section of Barth--Hulek--Peters--Van de Ven gives the local proof spine.

## Dependency order

Milestone 1 consumes the complex-manifolds, universal-covers, and algebraic-topology roadmaps.
Milestone 2 uses Milestone 1 and develops the compact-uniform lattice estimates in Milestone 2.1.
Milestone 3 uses Milestone 2 and the universal-covers roadmap. Milestone 4 is algebraic and can
proceed in parallel with Milestones 1--3. Milestone 5 uses Milestones 2 and 4 together with the
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
- A cyclic action cannot be constructed from `A ^ m = 1` without the translation norm equation.
- The abstract `H¹/H²` calculation accepts `A_T : T ≃+ T`, but the analytic cyclic quotient does
  not accept that alone: it consumes a complex-linear lift preserving the lattice or an explicitly
  biholomorphic additive torus automorphism.
- The equations `A_T^m = 1` and `N_{A,m}(t)=0` prove only order dividing `m`. Exact order uses the
  no-smaller-power criterion, and `T[m]` is consistently called the `m`-torsion subgroup.
- The iterate theorem computes every power on `T`, translation conjugacy changes the twist by
  `(1-A_T)b`, and the normalized class lies in `ker N_A / range(1-A_T)`. Its integral connecting
  class lies in `Λ^A/N_AΛ`. The first quotient is an `AddCommGroup`; the connecting map is an
  additive homomorphism and the vanishing theorem supplies an `AddEquiv` to the second quotient.
- For composite `m`, freeness checks every `0 < k < m` using
  `cyclicNorm A k t ∉ range(1-A^k)`. A proposition which checks only the generator is rejected.
- When `A = 1`, the classification specializes to the additive equivalence
  `T[m] ≃+ Λ/mΛ`; it does not specialize to `Λ` or claim that every `m`-torsion point has exact
  order `m`.
- A varying elliptic family with nonconstant period ratio has submersion charts but is not thereby
  declared holomorphically locally trivial with one fixed elliptic-curve fibre.
- The cyclic quotient retains the varying period lattice and proves the local equation
  `t = a u^m`; it is not replaced by a product with a fixed torus.
- Branch changes in the punctured logarithmic gauge are proved to be lattice translations, and
  induced `π₁` and `H₁` maps come from the constructed maps.

## References

- Christina Birkenhake and Herbert Lange, *Complex Abelian Varieties*, second edition, Chapters
  1 and 8, for complex tori, period lattices, morphisms, and families.
- Kenneth S. Brown, *Cohomology of Groups*, Chapter VI, Section 2, for cyclic norm and periodic
  cohomology calculations.
- Wolf P. Barth, Klaus Hulek, Chris A. M. Peters, and Antonius Van de Ven,
  *Compact Complex Surfaces*, second edition, Chapter V, “Logarithmic Transformations”.
