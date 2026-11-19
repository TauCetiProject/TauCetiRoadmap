# Roadmap: amenable groups

**Summary.** Amenability is what makes averaging possible on a group that has no normalized
counting measure. A topological group `G` is *amenable* when the space `UCB(G)` of bounded real
functions `f` with `sup_x |f(ux) − f(x)| → 0` as `u → 1` carries a left-invariant mean: a linear
functional `m` with `m(f) ≥ 0` whenever `f ≥ 0`, `m(1) = 1`, and `m(f(g⁻¹ ·)) = m(f)` for every
`g ∈ G`. No separation, local compactness or countability hypothesis enters the definition. The
roadmap develops invariant means as a usable theory: the function space, means and their weak-*
compactness, transport along continuous homomorphisms, the comparison with complex means, and the
behaviour of amenability under the constructions of group theory. For a discrete group, means are
the same as finitely additive probabilities on all subsets, and in that form amenability rules out
paradoxical decompositions, the phenomenon behind the Banach–Tarski paradox.

The headline theorems are these.

- *Følner's theorem.* A discrete group `G` is amenable if and only if for every finite `K ⊆ G` and
  every `ε > 0` there is a finite nonempty `F ⊆ G` with `|gF △ F| < ε|F|` for all `g ∈ K`. No
  countability is assumed; for countable `G` the condition is equivalent to the existence of a
  Følner sequence.
- *Tarski's alternative.* A discrete group is amenable if and only if it is not paradoxical: there
  are no disjoint `A, B` with `A ∪ B = G` such that each of `A` and `B` can be cut into finitely
  many pieces which left translations reassemble into all of `G`.
- The free group on two generators is paradoxical, so neither it nor any discrete group containing
  it is amenable. Finite, abelian and compact groups are amenable, and amenability of discrete
  groups passes to subgroups, quotients, extensions, finite products, directed unions and directed
  colimits.
- *Invariant means on `L∞`.* If `G` is locally compact Hausdorff and `μ` is a regular left Haar
  measure on `G`, then `G` is amenable if and only if `L∞(G, μ)` carries a positive linear
  functional that takes the value `1` at the constant function `1` and is invariant under left
  translation.

The roadmap is written on Mathlib's Følner filters, finitely additive contents, piecewise
translations with finitely many pieces, Hall's marriage theorem, Hahn–Banach separation, and Haar
measure with its modular character. The roadmap
[RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md) supplies the
normalized Haar probability of a compact group, which makes every compact group amenable. In the
other direction, [VonNeumannAlgebras](../VonNeumannAlgebras/README.md) and
[BanachAlgebras](../BanachAlgebras/README.md) use the Følner theory and the smoothing kernels of
the locally compact layer, and [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md)
uses invariant means on `UCB(G)`.

Layer 1 builds `UCB(G)`, means, their weak-* compactness, transport along continuous
homomorphisms and complex means. Layer 2 specializes to discrete groups, where means are
finitely additive probabilities, and treats finite groups. Layer 3 develops equidecompositions and
paradoxical sets and decomposes the free group. Layer 4 proves the closure properties of discrete
amenability. Layer 5 proves Følner's theorem, Layer 6 the amenability of `ℤ` and of abelian
groups, Layer 7 the characterization of amenable locally compact groups by invariant means on Haar
`L∞`, and Layer 8 Tarski's alternative. Euclidean Banach–Tarski, Property (T), and constructions of
nonamenable groups without nonabelian free subgroups are outside the roadmap.

## Conventions

1. **Groups.** `G` is a topological group: `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]`.
   Layers 1 and 7 work with an arbitrary group topology (Layer 7 adds local compactness and the
   Hausdorff property). Layers 2–6 and 8 concern discrete groups, `[DiscreteTopology G]`, and there
   "amenable group" means amenable with the discrete topology. The topology-free forms of the
   discrete statements are stated through Følner sets (`TauCeti.HasFoelnerSets G`) and
   paradoxical sets (`TauCeti.Paradoxical G Set.univ`), which mention no topology.
2. **The function space.** `UCB(G)` is the space of bounded real-valued functions `f` on `G` with

   ```text
   ∀ ε > 0,  ∀ᶠ u in 𝓝 1,  ∀ x ∈ G,  |f(ux) − f(x)| < ε,
   ```

   equivalently `sup_x |f(ux) − f(x)| → 0` as `u → 1`. The formula is authoritative, not the words
   "left" or "right". The condition implies continuity, and it is exactly uniform continuity for
   Mathlib's [`IsTopologicalGroup.rightUniformSpace`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/Algebra/IsUniformGroup/Defs.html#IsTopologicalGroup.rightUniformSpace),
   whose entourages compare `(x, y)` through `y * x⁻¹`. No `IsUniformGroup` instance is inferred:
   the left and right uniformities of a general group differ. Bekka–de la Harpe–Valette (BDHV),
   Appendix A.3 and Definition G.1.4, call this condition *left* uniform continuity and warn that
   the names are reversed elsewhere. Their topological groups are Hausdorff by the convention at
   the start of their Appendix A; the definition here makes sense without that assumption, and
   comparisons with their results retain their Hausdorff hypothesis.
3. **Translations.** `(L_g f)(x) = f(g⁻¹x)`, so that `L_g L_h = L_(gh)`; right translation is
   `(R_g f)(x) = f(xg)`.
4. **Means.** A *mean* on `UCB(G)` is a real linear functional `m` with `m(f) ≥ 0` for `f ≥ 0` and
   `m(1) = 1`. Continuity is a consequence, not an assumption. A mean is *left invariant* if
   `m(L_g f) = m(f)` for all `g` and `f`, and `G` is *amenable* if a left-invariant mean exists.
   The real space is primary. BDHV use complex-valued functions, with `‖f(ux) − f(x)‖` in the
   condition of Convention 2; Layer 1 identifies the two notions by `m_ℂ(f) = m(Re f) + i m(Im f)`,
   and positivity of a complex mean concerns real nonnegative functions.
5. **Contents.** A *finitely additive probability on all subsets* of a set `X` is Mathlib's
   `MeasureTheory.AddContent ℝ≥0∞ (Set.univ : Set (Set X))` with total mass one. A countably
   additive `MeasureTheory.Measure` is never used for this purpose: neither finite additivity nor
   the domain of all subsets can be replaced by countable additivity on a σ-algebra. In Layer 7 a
   content on the Borel sets is `MeasureTheory.AddContent ℝ {s | MeasurableSet s}`, and its values
   on nonmeasurable sets are not part of any statement.
6. **Finite sets.** Finite subsets are `Finset`s with the pointwise action, `gF = {g * x | x ∈ F}`,
   and `F △ F'` is `symmDiff`. Cardinalities in inequalities and ratios are coerced to `ℝ`.
7. **Haar measure.** In Layer 7, `G` is moreover `[LocallyCompactSpace G] [T2Space G]`, with the
   Borel measurable space and a regular left Haar measure `μ` (`[μ.IsHaarMeasure] [μ.Regular]`);
   the canonical `MeasureTheory.Measure.haar` is an allowed choice. No σ-compactness, second
   countability or σ-finiteness is a standing hypothesis. `L∞(G, μ)` is Mathlib's global
   `MeasureTheory.Lp ℝ ∞ μ`: classes modulo `μ`-almost-everywhere equality, with the
   essential-supremum norm. The modular character is
   `c(g) = (MeasureTheory.Measure.modularCharacter g : ℝ)`, normalized by
   `∫ f(x g) dμ(x) = c(g) ∫ f dμ`; BDHV's modular function is `Δ(g) = c(g)⁻¹`. No statement assumes
   `Borel(G × G) = Borel(G) ⊗ Borel(G)`, installs a product-measurable multiplication instance
   without proving it, or infers global `InnerRegular` from `Regular`.
8. **Names.** Declarations of Mathlib and of the Tau Ceti library are cited by their full names.
   The headline statements of `Suggested.lean` live in `TauCetiRoadmap.AmenableGroups` and are
   cited by their short names. Targets with no declaration are described in prose.

## Layer 1: UCB, means and transport

Layer 1 works over an arbitrary topological group. Its objects are Tau Ceti's `TauCeti.UCB G`,
`TauCeti.Mean G` and `TauCeti.Amenable G`; this layer fixes them and records their theory, on which
every subsequent layer rests.

### 1.1 The space UCB(G)

`UCB(G)` is `TauCeti.UCB G`, the type of the real subalgebra `TauCeti.ucb G` of Mathlib's
[`BoundedContinuousFunction G ℝ`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/ContinuousMap/Bounded/Basic.html#BoundedContinuousFunction)
(written `G →ᵇ ℝ`) cut out by the condition of Convention 2. It is the case `𝕜 = ℝ` of the
subalgebra `TauCeti.ucbSubalgebra 𝕜 G` defined for every normed field `𝕜`
(`TauCeti.ucb_eq_ucbSubalgebra`), and it carries the restricted supremum norm, the pointwise
order and the pointwise algebra operations (BDHV, Appendix A.3 and Definition G.1.4).
*Needs:* Mathlib `BoundedContinuousFunction`, `IsTopologicalGroup.rightUniformSpace`.

- A bounded continuous `f` lies in `UCB(G)` exactly when it satisfies the neighbourhood condition
  of Convention 2 (`TauCeti.mem_ucb_iff`), exactly when its left translates `x ↦ f(ux)` converge
  to `f` in supremum norm as `u → 1` (`TauCeti.mem_ucb_iff_tendsto`), and exactly when it is
  uniformly continuous for the right uniformity (`TauCeti.mem_ucb_iff_uniformContinuous`). A
  function satisfying the neighbourhood condition is continuous
  (`TauCeti.continuous_of_forall_eventually_dist_mul_lt`).
- `UCB(G)` is closed in `G →ᵇ ℝ` for the supremum norm (`TauCeti.isClosed_ucb`), so it is a real
  Banach space, and `‖c • f‖ = |c| ‖f‖`.
- It contains the constants (`TauCeti.const_mem_ucb`) and is closed under sums, scalar multiples
  and pointwise products. It is closed under pointwise maximum, minimum and absolute value
  (`TauCeti.sup_mem_ucb`, `TauCeti.inf_mem_ucb`, `TauCeti.abs_mem_ucb`); these lattice operations
  are computed pointwise (`TauCeti.UCB.coe_sup`, `TauCeti.UCB.coe_inf`, `TauCeti.UCB.coe_abs`), and
  the norm is solid.
- Two elements with the same values are equal (`TauCeti.UCB.ext`); `f ≤ h` exactly when
  `f(x) ≤ h(x)` for every `x` (`TauCeti.UCB.le_def`); `|f(x)| ≤ ‖f‖` for every `x`
  (`TauCeti.UCB.abs_apply_le_norm`), and `f ≤ ‖f‖ • 1` (`TauCeti.UCB.le_norm_smul_one`).
- Composing with a continuous linear map between normed fields preserves the condition
  (`TauCeti.compLeftContinuousBounded_mem_ucbSubalgebra`).

**Checks.**
- Let `G` be the affine group of the line, the pairs `(a, b)` with `a > 0` acting by
  `t ↦ at + b`, so `(a, b)(c, d) = (ac, ad + b)`, and let `f(a, b) = arctan(b/a)`. For `u = (1, β)`
  with `β > 0` and `x = (a, 0)`, `ux = (a, β)` and `f(ux) − f(x) = arctan(β/a)`, which tends to
  `π/2` as `a → 0`; so `f ∉ UCB(G)`. On the other hand `xu = (a, aβ + b)` for `u = (α, β)`,
  and `sup_x |f(xu) − f(x)| → 0` as `u → 1`, so `f` satisfies the condition with `f(xu)` in place
  of `f(ux)`, and `x ↦ f(x⁻¹)` lies in `UCB(G)`. A definition written with `f(xu)` would contain
  `f`: the two conventions differ on this nonabelian group, and this is the distinction that
  Convention 2 pins.

### 1.2 Translations

Left translation is `TauCeti.UCB.leftTranslation : G →* (UCB G ≃ₗᵢ[ℝ] UCB G)`, with
`(L_g f)(x) = f(g⁻¹x)` (`TauCeti.UCB.leftTranslation_apply`), and right translation is
`TauCeti.UCB.rightTranslation`, with `(R_g f)(x) = f(xg)` (`TauCeti.UCB.rightTranslation_apply`).
Left translation preserves `UCB(G)` because conjugation is continuous
(`TauCeti.compContinuous_mulLeft_mem_ucb`), and right translation preserves it as well
(`TauCeti.compContinuous_mulRight_mem_ucb`). *Needs:* §1.1.

- Both are group homomorphisms into the linear isometries of `UCB(G)`, so `L_1 = id`,
  `L_(gh) = L_g L_h` and `(L_g)⁻¹ = L_(g⁻¹)` (`TauCeti.UCB.leftTranslation_symm`), and likewise for
  `R` (`TauCeti.UCB.rightTranslation_symm`).
- Translations are order isomorphisms, `L_g f ≤ L_g f' ↔ f ≤ f'`
  (`TauCeti.UCB.leftTranslation_le_leftTranslation_iff`), and fix the constants
  (`TauCeti.UCB.leftTranslation_apply_algebraMap`, `TauCeti.UCB.leftTranslation_apply_one`).
- For fixed `f`, the orbit map `g ↦ L_g f` is continuous for the supremum norm
  (`TauCeti.UCB.tendsto_leftTranslation_apply_nhds_one`, `TauCeti.UCB.continuous_leftTranslation_apply`);
  this is where the condition of Convention 2 is used.
- Left and right translations commute (`TauCeti.UCB.commute_leftTranslation_rightTranslation`).
- For finite `G`, `∑_g L_g f` is the constant `∑_x f(x)` (`TauCeti.UCB.sum_leftTranslation`).
- Inversion `f ↦ (x ↦ f(x⁻¹))` is an isometric algebra isomorphism from `UCB(G)` onto the space
  `TauCeti.RightUCB G` of bounded functions with `sup_x |f(xu) − f(x)| → 0` as `u → 1`
  (`TauCeti.UCB.invEquiv`, `TauCeti.UCB.invLinearIsometryEquiv`); it preserves and reflects the
  order (`TauCeti.UCB.invEquiv_le_invEquiv_iff`) and exchanges left and right translation
  (`TauCeti.UCB.invEquiv_leftTranslation`, `TauCeti.UCB.invEquiv_rightTranslation`). The space
  `TauCeti.RightUCB G` is uniform continuity for the left uniformity
  (`TauCeti.mem_rightUcb_iff_uniformContinuous`).

**Checks.**
- On a discrete group, where every bounded function lies in `UCB(G)` (§2.1), `L_g` sends the
  indicator `δ_1` of the identity to `δ_g`, since `δ_1(g⁻¹x) = 1` exactly when `x = g`, and so
  `L_g L_h δ_1 = δ_(gh)`. The variant `f ↦ f(g ·)` sends `δ_1` to `δ_(g⁻¹)` and composes as
  `δ_1 ↦ δ_((hg)⁻¹)`, a right action: on a nonabelian group it is not a homomorphism `G →* …`.

### 1.3 Means

A mean is a `TauCeti.Mean G`: a positive linear map `UCB G →ₚ[ℝ] ℝ` with `m(1) = 1`
(`TauCeti.Mean.map_one`), built from a linear map by `TauCeti.Mean.mk₀` once positivity and
normalization are known. *Needs:* §1.1; Mathlib `PositiveLinearMap`.

- Means with the same values are equal (`TauCeti.Mean.ext`); a mean is monotone and takes the value
  `c` on the constant `c` (`TauCeti.Mean.map_algebraMap`).
- `inf f ≤ m(f) ≤ sup f`, the infimum and supremum taken over the nonempty group
  (`TauCeti.Mean.ciInf_le_apply`, `TauCeti.Mean.apply_le_ciSup`); a pointwise bound `f ≤ c` or
  `c ≤ f` passes to `m(f)` (`TauCeti.Mean.apply_le_of_forall_le`,
  `TauCeti.Mean.le_apply_of_forall_le`).
- `|m(f)| ≤ ‖f‖` and `|m(f) − m(h)| ≤ ‖f − h‖` (`TauCeti.Mean.abs_apply_le_norm`,
  `TauCeti.Mean.abs_apply_sub_apply_le`), so `m` is `1`-Lipschitz (`TauCeti.Mean.lipschitzWith`),
  continuous, and compatible with uniform limits: if `f_i → f` uniformly then `m(f_i) → m(f)`.
- The bundled continuous linear functional `TauCeti.Mean.toContinuousLinearMap` has operator norm
  one (`TauCeti.Mean.norm_toContinuousLinearMap`). A continuous linear functional is a mean exactly
  when it is positive and takes the value `1` at `1`
  (`TauCeti.Mean.mem_range_toContinuousLinearMap_iff`). The means form a convex set
  (`TauCeti.Mean.convex_range_toContinuousLinearMap`), and so do the left-invariant means
  (`TauCeti.Mean.convex_toContinuousLinearMap_image_setOf_isLeftInvariant`).
- Evaluation at a point is a mean (`TauCeti.Mean.eval`), so there is at least one.
- The same estimates hold on any ordered normed space with an element `u` such that
  `f ≤ ‖f‖ • u` for all `f`, which is how Layers 2 and 7 reuse them: a positive linear functional
  `φ` satisfies `|φ(f)| ≤ φ(u) ‖f‖` (`PositiveLinearMap.abs_apply_le_mul_norm`) and is continuous
  (`PositiveLinearMap.continuous_of_forall_le_norm_smul`), and a monotone continuous linear
  functional `ψ` has norm `ψ(u)` when `‖u‖ ≤ 1` (`ContinuousLinearMap.opNorm_eq_apply_of_monotone`).

**Checks.**
- On `G = ZMod 2`, where `UCB(G)` is all of `ℝ²` with the supremum norm, `m(f) = 2f(0) − f(1)` is
  linear with `m(1) = 1` but takes the value `−1` on the indicator of `{1}`, and its operator norm
  is `3`, attained at `f = (1, −1)`. A definition of a mean as a normalized linear functional,
  without positivity, would admit it, and would lose `|m(f)| ≤ ‖f‖`.

### 1.4 Invariant means, amenability and weak-* compactness

A mean is left invariant, `TauCeti.Mean.IsLeftInvariant m`, when `m(L_g f) = m(f)` for all `g` and
`f` (`TauCeti.Mean.isLeftInvariant_iff`), and `TauCeti.Amenable G` is the class asserting that a
left-invariant mean exists (`TauCeti.amenable_iff`). *Needs:* §§1.2–1.3; Mathlib
`WeakDual.isCompact_closedBall`.

- Means embed into the weak-* dual `WeakDual ℝ (UCB G)` (`TauCeti.Mean.toWeakDual`) with image in
  the closed unit ball (`TauCeti.Mean.range_toWeakDual_subset_closedBall`). The image is closed,
  because positivity and normalization are closed conditions
  (`TauCeti.Mean.isClosed_range_toWeakDual`), hence compact by the Banach–Alaoglu theorem
  `WeakDual.isCompact_closedBall` (`TauCeti.Mean.isCompact_range_toWeakDual`). With the induced
  topology the means form a compact Hausdorff space, nonempty by evaluation at a point, in which
  convergence is pointwise convergence on `UCB(G)`
  (`TauCeti.Mean.tendsto_iff_forall_apply_tendsto`).
- Each equation `m(L_g f) = m(f)` defines a closed set of means
  (`TauCeti.Mean.isClosed_setOf_apply_leftTranslation_eq`), so the left-invariant means form a
  closed, hence compact, set (`TauCeti.Mean.isClosed_setOf_isLeftInvariant`,
  `TauCeti.Mean.isCompact_setOf_isLeftInvariant`).
- Finite-intersection criterion: `G` is amenable exactly when for every finite set of pairs
  `(g, f)` some mean satisfies `m(L_g f) = m(f)` for those pairs
  (`TauCeti.amenable_iff_forall_finset_exists`).
- Approximate invariance: if means `m_i` along a nontrivial filter satisfy
  `m_i(L_g f) − m_i(f) → 0` for every `g` and `f`, every cluster point of the `m_i` is left
  invariant (`TauCeti.Mean.IsLeftInvariant.of_mapClusterPt`), a cluster point exists
  (`TauCeti.Mean.exists_mapClusterPt_isLeftInvariant`), and `G` is amenable
  (`TauCeti.Amenable.of_tendsto`).

### 1.5 Transport along continuous homomorphisms

For a continuous homomorphism `φ : G →ₜ* H`, pulling back along `φ` maps `UCB(H)` to `UCB(G)`
(`TauCeti.compContinuous_mem_ucb`), as the algebra homomorphism `TauCeti.UCB.compRightAlgHom φ`,
and means push forward by `TauCeti.Mean.map φ`, with `(Mean.map φ m)(f) = m(f ∘ φ)`
(`TauCeti.Mean.map_apply`). *Needs:* §1.4.

- The pullback preserves constants and positivity (`TauCeti.UCB.monotone_compRightAlgHom`), does
  not increase norms (`TauCeti.UCB.norm_compRightAlgHom_apply_le`), and, when `φ` is surjective, is
  isometric and reflects the order (`TauCeti.UCB.norm_compRightAlgHom_apply`,
  `TauCeti.UCB.compRightAlgHom_le_compRightAlgHom_iff`). It intertwines `L_g` with `L_(φ g)` and
  `R_g` with `R_(φ g)` (`TauCeti.UCB.compRightAlgHom_leftTranslation`,
  `TauCeti.UCB.compRightAlgHom_rightTranslation`), and is compatible with identities and
  composition (`TauCeti.UCB.compRightAlgHom_id`, `TauCeti.UCB.compRightAlgHom_comp`,
  `TauCeti.Mean.map_id`, `TauCeti.Mean.map_map`).
- When `φ` is surjective, the push-forward of a left-invariant mean is left invariant
  (`TauCeti.Mean.IsLeftInvariant.map`). Hence amenability passes along surjective continuous
  homomorphisms (`TauCeti.Amenable.of_surjective`), and it is invariant under isomorphisms of
  topological groups, group isomorphisms whose two directions are continuous
  (`ContinuousMulEquiv.amenable_iff`).
- Amenability for a finer group topology implies amenability for a coarser one
  (`TauCeti.Amenable.of_le`).

**Checks.**
- The inclusion of the trivial group into `ℤ` pushes the unique mean of the trivial group forward
  to evaluation at `0`, which is not invariant: `L_1` moves the indicator of `{0}` to that of
  `{1}`. Surjectivity cannot be dropped from `TauCeti.Mean.IsLeftInvariant.map`.

### 1.6 Complex means

The complex space `TauCeti.ComplexUCB G` is cut out of `G →ᵇ ℂ` by the condition of Convention 2
with `‖f(ux) − f(x)‖` (`TauCeti.mem_complexUCB_iff`), and a complex function lies in it exactly when
its real and imaginary parts lie in `UCB(G)` (`TauCeti.mem_complexUCB_iff_re_im`). A complex mean
`TauCeti.ComplexMean G` is a complex linear functional with `M(1) = 1` that is nonnegative on real
nonnegative functions (`TauCeti.ComplexMean.map_nonneg`). *Needs:* §§1.3–1.4.

- Real and imaginary parts `TauCeti.ComplexUCB.re`, `TauCeti.ComplexUCB.im` and complexification
  `TauCeti.ComplexUCB.ofReal` satisfy the inverse laws (`TauCeti.ComplexUCB.re_ofReal`,
  `TauCeti.ComplexUCB.im_ofReal`, `TauCeti.ComplexUCB.ofReal_re_add_I_smul_ofReal_im`), the norm
  bounds `‖Re f‖ ≤ ‖f‖`, `‖Im f‖ ≤ ‖f‖` and `‖ofReal f‖ = ‖f‖`, and commute with left translation
  (`TauCeti.ComplexUCB.re_leftTranslation`, `TauCeti.ComplexUCB.leftTranslation_ofReal`).
- `TauCeti.Mean.complexMeanEquiv` is a bijection between means and complex means, sending `m` to
  `m_ℂ(f) = m(Re f) + i m(Im f)` (`TauCeti.ComplexMean.apply_eq_toMean_re_add_toMean_im_mul_I`),
  with inverse the restriction to real functions (`TauCeti.ComplexMean.toMean`); complex means
  have operator norm one (`TauCeti.ComplexMean.norm_toContinuousLinearMap`).
- The bijection matches left-invariant means with left-invariant complex means
  (`TauCeti.Mean.isLeftInvariant_toComplexMean_iff`, `TauCeti.ComplexMean.isLeftInvariant_toMean_iff`),
  so `G` is amenable exactly when a left-invariant complex mean exists
  (`TauCeti.amenable_iff_exists_complexMean`).

### Examples

Evaluation at a point is a mean on every topological group, invariant only for the trivial group.
On a finite group the normalized counting mean is the unique invariant mean (§2.5); on a compact
group integration against normalized Haar measure is an invariant mean (§7.8).

### Dependencies

Mathlib bounded continuous functions, positive linear maps, the weak-* topology and
`WeakDual.isCompact_closedBall`. Tau Ceti `TauCeti/Topology/Algebra/Group/UCB/`,
`TauCeti/GroupTheory/Amenable/Mean.lean`, `Basic.lean`, `WeakStar.lean` and `Complex.lean`, and
`TauCeti/Analysis/Normed/Order/PositiveLinearMap.lean`.

## Layer 2: discrete means, contents and finite groups

From here to Layer 6, and in Layer 8, `G` carries the discrete topology.

### 2.1 Discrete UCB

For a discrete group every bounded function belongs to `UCB(G)` (`TauCeti.ucb_eq_top`); continuity
is automatic. `TauCeti.UCB.discreteAlgEquiv` and `TauCeti.UCB.discreteLinearIsometryEquiv` identify
`UCB(G)` with `G →ᵇ ℝ`, preserving the norm, the order
(`TauCeti.UCB.discreteAlgEquiv_symm_le_discreteAlgEquiv_symm_iff`), the constants and both
translations (`TauCeti.UCB.discreteAlgEquiv_symm_compContinuous_mulLeft`,
`TauCeti.UCB.discreteAlgEquiv_symm_compContinuous_mulRight`). *Needs:* Layer 1.

- Means on a discrete group are the normalized positive functionals on `G →ᵇ ℝ`
  (`TauCeti.Mean.boundedContinuousFunctionEquiv`); a mean is left invariant exactly when the
  functional is invariant under `f ↦ f(g⁻¹ ·)`
  (`TauCeti.Mean.isLeftInvariant_iff_boundedContinuousFunction`), and `G` is amenable exactly when
  such an invariant functional exists (`TauCeti.amenable_iff_exists_boundedContinuousFunction_mean`).
- Pulling back along an arbitrary map `r : G → H` of discrete groups is the algebra homomorphism
  `TauCeti.UCB.compRightAlgHomOfDiscrete r`, and means push forward by
  `TauCeti.Mean.mapOfDiscrete r`. If `φ : H →* G` and `r(φ(h) x) = h r(x)` for all `h` and `x`,
  the push-forward of a left-invariant mean on `G` is left invariant
  (`TauCeti.Mean.IsLeftInvariant.mapOfDiscrete`).

### 2.2 Finitely additive probabilities on all subsets

For a set `X`, a finitely additive probability on all subsets is a content as in Convention 5. It
is the same as a real-valued `ν` on all subsets with `ν(∅) = 0`, `ν(X) = 1`, `ν(A) ≥ 0` and
`ν(A ∪ B) = ν(A) + ν(B)` for disjoint `A, B`: all values are at most one and finite, and the
conversions `MeasureTheory.AddContent.toReal` and `MeasureTheory.AddContent.ofReal`, which apply
`ENNReal.toReal` and `ENNReal.ofReal` to the values, are mutually inverse on all subsets
(`MeasureTheory.AddContent.ofReal_toReal`, `MeasureTheory.AddContent.toReal_ofReal`).
*Needs:* Mathlib `MeasureTheory.AddContent`.

- A content of finite total mass is finite everywhere
  (`MeasureTheory.addContent_ne_top_of_univ_ne_top`) and bounded by its total mass
  (`MeasureTheory.addContent_le_univ`).
- Finite disjoint unions (`MeasureTheory.addContent_biUnion`), complements
  (`MeasureTheory.addContent_compl`, `MeasureTheory.addContent_compl_of_ne_top`), differences
  (`MeasureTheory.addContent_sdiff_of_subset`), monotonicity
  (`MeasureTheory.addContent_mono_of_nonneg`), finite subadditivity
  (`MeasureTheory.addContent_union_le_of_nonneg`, `MeasureTheory.addContent_biUnion_le_of_nonneg`)
  and inclusion–exclusion (`MeasureTheory.addContent_union_add_inter`).
- Push-forward along a map `f : X → Y`, `ν ↦ (A ↦ ν(f⁻¹ A))` (`MeasureTheory.AddContent.map`),
  compatible with identities and composition (`MeasureTheory.AddContent.map_id`,
  `MeasureTheory.AddContent.map_map`); for an action of a group `Γ` on `X`, invariance
  `ν(γ • A) = ν(A)` is invariance under push-forward by every `γ`
  (`MeasureTheory.AddContent.forall_map_smul_eq_iff`), and push-forward along an equivariant map
  preserves it (`MeasureTheory.AddContent.map_apply_smul_set`).

**Checks.**
- For `X = ℤ` with translation, a countably additive invariant probability on all subsets would
  give every singleton the same mass `c`, and `1 = ∑_n c` is impossible for `c = 0` and for
  `c > 0`. Invariant finitely additive probabilities on all subsets of `ℤ` exist (Layer 6, with
  §2.4), and each gives every finite set mass `0`. A definition through countably additive
  measures would make `ℤ` nonamenable.

### 2.3 Means and contents

For a discrete space `X`, positive linear functionals on `X →ᵇ ℝ` correspond bijectively to
nonnegative real contents on all subsets of `X` (`PositiveLinearMap.addContentEquiv X`), by
`ν(A) = m(1_A)` (`LinearMap.toAddContent_apply`), with `m(1) = ν(X)`
(`LinearMap.toAddContent_univ`). In the inverse direction
`m(c₁ 1_(A₁) + ⋯ + c_r 1_(A_r)) = c₁ ν(A₁) + ⋯ + c_r ν(A_r)`, independently of the disjoint
presentation, and `m` extends from finite-range functions, which are uniformly dense, to all
bounded functions, positively, with `|m(f)| ≤ ν(X) ‖f‖` and uniquely
(`PositiveLinearMap.addContentEquiv_symm_apply_indicator`,
`PositiveLinearMap.addContentEquiv_symm_apply_one`). For a discrete group the correspondence is
`TauCeti.Mean.contentEquiv : Mean G ≃ {ν // ν univ = 1}`, with content `TauCeti.Mean.toContent`
(`TauCeti.Mean.toContent_apply`, `TauCeti.Mean.toContent_univ`, `TauCeti.Mean.toContent_le_one`,
`TauCeti.Mean.apply_sum_smul_indicator`), natural for push-forward along maps and continuous
homomorphisms (`TauCeti.Mean.toContent_mapOfDiscrete`, `TauCeti.Mean.toContent_map`), and matching
left-invariant means with left-invariant contents
(`TauCeti.Mean.isLeftInvariant_iff_toContent_smul`) (Garrido, Definitions 1.12–1.13, in discrete
scope).

Prove the naturality and the equivariance of `PositiveLinearMap.addContentEquiv` for every
discrete space, not only for the left regular action of a group:

- for a map `r : X → Y` of discrete spaces and a positive functional `m` on `X →ᵇ ℝ`, the
  functional `f ↦ m(f ∘ r)` on `Y →ᵇ ℝ` corresponds to the push-forward content
  `A ↦ ν(r⁻¹ A)` of the content `ν` of `m`;
- for an action of a group `Γ` on `X`, `m` is invariant under `f ↦ f(γ⁻¹ • ·)` for every `γ`
  exactly when its content satisfies `ν(γ • A) = ν(A)` for every `γ` and `A`.

*Needs:* `PositiveLinearMap.addContentEquiv`, `BoundedContinuousFunction.indicator_compContinuous`,
`MeasureTheory.AddContent.map`, `MeasureTheory.AddContent.forall_map_smul_eq_iff`.

### 2.4 The discrete characterization and change of topology

A discrete group is amenable exactly when it carries a left-invariant finitely additive probability
on all of its subsets (`TauCeti.amenable_iff_exists_invariantContent`; headline
`amenable_iff_exists_invariantContent`; Garrido, Theorem 1.15, in discrete scope; BDHV, G.1). An
abstract group that is amenable with the discrete topology is amenable with every group topology
(`TauCeti.Amenable.of_discrete`): restrict its mean to `UCB(G)`, which is the case `t₁ = ⊥` of
`TauCeti.Amenable.of_le`. *Needs:* §§2.1–2.3, §1.5.

### 2.5 Finite groups

For finite `G`, with any group topology, the normalized counting mean `TauCeti.Mean.uniform G` is
`m(f) = |G|⁻¹ ∑_x f(x)` (`TauCeti.Mean.uniform_apply_eq_sum_div_card`). It is defined from
`[Finite G]` alone and evaluated by this formula for every `Fintype` instance
(`TauCeti.Mean.uniform_apply`), so its value does not depend on the instance used to write the
sum. It is left invariant, by the permutation `x ↦ gx`
(`TauCeti.Mean.isLeftInvariant_uniform`), and it is the only left-invariant mean
(`TauCeti.Mean.IsLeftInvariant.eq_uniform`, `TauCeti.Mean.isLeftInvariant_iff_eq_uniform`); on the
trivial group it is evaluation at the identity (`TauCeti.Mean.uniform_eq_eval`). Every finite group
with any group topology is amenable (the instance `TauCeti.Amenable.of_finite`). Averages over a
finite nonempty `F` are the means `TauCeti.Mean.average F` (`TauCeti.Mean.average_apply_eq_sum_div_card`,
`TauCeti.Mean.average_singleton`, `TauCeti.Mean.average_univ`). *Needs:* §1.4, §2.3.

Prove that the content of the normalized counting mean of a finite discrete group is
`ν(A) = |A| / |G|` for every `A ⊆ G`. *Needs:* `TauCeti.Mean.toContent_apply`,
`TauCeti.Mean.uniform_apply_eq_sum_div_card`.

**Checks.**
- On `G = ZMod 3`, the normalized counting mean gives `{0, 1}` mass `2/3`. Evaluation at `0` is a
  mean, with content giving `{0}` mass `1`, but it is not invariant: it gives `{1} = 1 + {0}` mass
  `0`. Invariance is what singles out the counting mean among the means of a finite group.

### Examples

The trivial group, with its unique mean; `ZMod n` with the normalized counting mean; `ℤ`, whose
invariant contents give every finite set mass zero.

### Dependencies

Layer 1. Mathlib `MeasureTheory.AddContent`. Tau Ceti `TauCeti/Topology/Algebra/Group/UCB/Discrete.lean`,
`TauCeti/Topology/ContinuousMap/Bounded/AddContent.lean`,
`TauCeti/MeasureTheory/Measure/AddContent.lean`, and `TauCeti/GroupTheory/Amenable/Discrete.lean`,
`Content.lean` and `Finite.lean`.

## Layer 3: equidecompositions and the free-group obstruction

Throughout, a group `G` acts on a set `X`, `[Group G] [MulAction G X]`.

### 3.1 Equidecomposability and partitions

`A ∼_G B`, written `TauCeti.Equidecomposable G A B`, means that some
[`Equidecomp X G`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Action/Equidecomp.html#Equidecomp)
has source `A` and target `B` (`TauCeti.equidecomposable_iff`; Garrido, Definition 1.1). Mathlib's `Equidecomp X G` is a
partial bijection that agrees on its source with a piecewise translation by the elements of a
finite subset of `G`, with restriction, composition and inverse. *Needs:* Mathlib `Equidecomp`,
`Finpartition`.

- The equipartitions `Equidecomp.Equipartition X G` are finite families of source pieces, each with
  a group element, whose pieces are pairwise disjoint and whose translated pieces are pairwise
  disjoint. They convert to and from equidecompositions (`Equidecomp.toEquipartition`,
  `Equidecomp.Equipartition.toEquidecomp`) with the same source and target
  (`Equidecomp.toEquipartition_source`, `Equidecomp.toEquipartition_target`,
  `Equidecomp.Equipartition.toEquidecomp_source`, `Equidecomp.Equipartition.toEquidecomp_target`),
  the induced bijection translating each piece by its element
  (`Equidecomp.Equipartition.toEquidecomp_apply`), and they induce `Finpartition`s of the source
  and the target (`Equidecomp.Equipartition.sourceFinpartition`,
  `Equidecomp.Equipartition.targetFinpartition`). Their shape follows a
  [Mathlib pull request defining `Equidecomp.Equipartition`](https://github.com/leanprover-community/mathlib4/pull/30330).
- `A ∼_G B` exactly when there are a `Finpartition` of `A` and elements `g_i` of `G`, one for each
  part `A_i`, such that the sets `g_i • A_i` are pairwise disjoint with union `B`
  (`Equidecomp.exists_iff_exists_finpartition`). Parts of a `Finpartition` are nonempty, so empty
  pieces may be removed without changing the relation.

**Checks.**
- In `ℤ` acting on itself, the even integers `2ℤ` and `ℤ` are in bijection by `2n ↦ n`, a
  translation of each singleton `{2n}` by `−n`, but they are not equidecomposable: an
  equidecomposition moves points by at most some `C`, so it would map the at most `N + 1` even
  integers in `[−N, N]` onto a set containing the `2N − 2C + 1` integers in `[−N + C, N − C]`,
  which fails for `N > 2C`. A definition allowing infinitely many pieces would identify them.

### 3.2 The equidecomposition preorder and Schröder–Bernstein

*Needs:* §3.1.

- `∼_G` is an equivalence relation (`TauCeti.Equidecomposable.refl`,
  `TauCeti.Equidecomposable.symm`, `TauCeti.Equidecomposable.trans`,
  `TauCeti.Equidecomposable.equivalence`), and `A ∼_G g • A` (`TauCeti.equidecomposable_smul_set`).
- Restriction to subsets: if `A ∼_G B` and `A' ⊆ A`, there is `B' ⊆ B` with `A' ∼_G B'` and
  `A \ A' ∼_G B \ B'` (`TauCeti.Equidecomposable.exists_subset_and_sdiff`).
- Finite disjoint unions: `A_i ∼_G B_i` for finitely many `i`, with the `A_i` pairwise disjoint
  and the `B_i` pairwise disjoint, gives `⋃ A_i ∼_G ⋃ B_i` (`TauCeti.Equidecomposable.union`,
  `TauCeti.Equidecomposable.biUnion_finset`).
- Transport by an equivariant bijection `e : X ≃ Y` (`TauCeti.equidecomposable_image_equiv_iff`),
  and change of the acting group along a map compatible with the actions
  (`TauCeti.Equidecomposable.of_smul_eq`), with equivalence along a surjective one, in particular
  along a group isomorphism (`TauCeti.equidecomposable_iff_of_surjective`).
- `A ≼_G B`, written `TauCeti.EquidecomposableLE G A B`, means that `A` is equidecomposable with
  a subset of `B` (`TauCeti.equidecomposableLE_iff`). It is a preorder containing inclusion
  (`TauCeti.EquidecomposableLE.refl`, `TauCeti.EquidecomposableLE.trans`,
  `TauCeti.equidecomposableLE_of_subset`).
- Schröder–Bernstein: `A ≼_G B` and `B ≼_G A` give `A ∼_G B`
  (`TauCeti.EquidecomposableLE.antisymm`, `TauCeti.equidecomposable_iff_equidecomposableLE`;
  Garrido, Theorem 1.2). The
  proof keeps a finite set of acting elements while building the bijection; an arbitrary
  set-theoretic bijection does not suffice.

### 3.3 Paradoxical sets

A subset `S ⊆ X` is *paradoxical*, `TauCeti.Paradoxical G S`, when it is nonempty and there are
disjoint `A, B` with `A ∪ B = S`, `A ∼_G S` and `B ∼_G S` (`TauCeti.paradoxical_iff`). In
particular the empty set is not paradoxical (`TauCeti.not_paradoxical_empty`). *Needs:* §3.2.

- Subcopy form: `S` is paradoxical exactly when it is nonempty and contains disjoint `A, B` with
  `A ∼_G S` and `B ∼_G S`, without requiring that they cover `S`
  (`TauCeti.paradoxical_iff_exists_subset`; Garrido, Corollary 1.3 and Definition 1.4, where the
  two forms are stated for proper subsets of the whole space).
- Paradoxicality is invariant under equidecomposition (`TauCeti.Equidecomposable.paradoxical_iff`,
  `TauCeti.Paradoxical.of_equidecomposable`), under equivariant bijections
  (`TauCeti.paradoxical_image_equiv_iff`), and under change of the acting group
  (`TauCeti.Paradoxical.of_smul_eq`, `TauCeti.paradoxical_iff_of_surjective`).

**Checks.**
- Without the nonemptiness clause, `∅ = ∅ ∪ ∅` with `∅ ∼_G ∅` would be a paradoxical
  decomposition of the empty set for every action, of the trivial group on itself included; with
  it, no empty set is paradoxical (`TauCeti.not_paradoxical_empty`).

### 3.4 Invariant contents exclude paradoxical decompositions

Let `ν` be a content on all subsets of `X` with `ν(g • A) = ν(A)` for all `g` and `A`.
Equidecomposable sets have the same mass (`TauCeti.Equidecomposable.addContent_eq`), by finite
additivity. If `S` is paradoxical then `ν(S) + ν(S) = ν(S)`
(`TauCeti.Paradoxical.addContent_add_self`), so `ν(S) = 0` when `ν(S)` is finite
(`TauCeti.Paradoxical.addContent_eq_zero`): a finite-valued invariant content with `ν(S) > 0`
excludes a paradoxical decomposition of `S`. In particular an invariant probability rules out
paradoxicality of the whole space (`TauCeti.not_paradoxical_univ_of_addContent`; headline
`not_paradoxical_univ_of_invariantContent`; the easy direction of Garrido, Theorem 1.11), and with §2.4 an amenable discrete group is not
paradoxical for its left regular action. *Needs:* §3.3, §2.4.

### 3.5 The free group on two generators

Let `F₂ = FreeGroup (Fin 2)` with generators `a, b`. For a letter `c`, the set `W(c)` of elements
whose reduced word begins with `c` is `FreeGroup.startsWith c`
(`FreeGroup.mem_startsWith_iff_exists_toWord_eq_cons`), defined through Mathlib's
`FreeGroup.toWord` and `FreeGroup.isReduced_toWord`. *Needs:* §3.3; Mathlib `FreeGroup.toWord`.

- Prefixes: `a ∈ W(a)` and `a⁻¹ ∈ W(a⁻¹)` (`FreeGroup.of_mem_startsWith`,
  `FreeGroup.inv_of_mem_startsWith`), every element other than `1` lies in some `W(c)`, and the
  `W(c)` cover the complement of `{1}` (`FreeGroup.exists_mem_startsWith_of_ne_one`,
  `FreeGroup.iUnion_startsWith`); they are pairwise disjoint, the first letter being unique
  (`FreeGroup.mem_startsWith_iff_head?_eq`).
- Cancellation: if `w` begins with `c⁻¹`, the reduced word of `c w` is that of `w` without its
  first letter (`FreeGroup.toWord_mk_singleton_mul_of_mem_startsWith`), and `c w` begins with `c`
  exactly when `w` does not begin with `c⁻¹` (`FreeGroup.mk_singleton_mul_mem_startsWith_iff`).
- The decompositions

  ```text
  F₂ = {1} ⊔ W(a) ⊔ W(a⁻¹) ⊔ W(b) ⊔ W(b⁻¹),
  F₂ = W(a) ⊔ a·W(a⁻¹) = W(b) ⊔ b·W(b⁻¹)
  ```

  hold (`FreeGroup.isCompl_startsWith_of_smul`, `FreeGroup.isCompl_startsWith_inv_of_smul`).
- They exhibit two disjoint subcopies, `W(a) ∪ W(a⁻¹) ∼ F₂` and `W(b) ∪ W(b⁻¹) ∼ F₂`
  (`FreeGroup.equidecomposable_startsWith_union_univ`), and the subcopy form of §3.3 gives a
  paradoxical decomposition of the whole group, identity included: every free group on at least
  two generators is paradoxical (`FreeGroup.paradoxical_univ`; headline
  `freeGroup_two_paradoxical`; Garrido, Proposition 1.5 (1), for `F₂`). By §3.4 such a group is not amenable
  (`TauCeti.not_amenable_freeGroup`).

**Checks.**
- `1 = a · a⁻¹ ∈ a·W(a⁻¹)`, `b = a · (a⁻¹ b) ∈ a·W(a⁻¹)` because `a⁻¹ b` is reduced and begins with
  `a⁻¹`, and `a ∈ W(a)`; an element `a·w` with `w ∈ W(a⁻¹)` has reduced word `w` without its first
  letter, which does not begin with `a`. Writing the second decomposition with `W(a)` and
  `W(a⁻¹)` alone would miss the identity, which lies in no `W(c)`.

### Examples

`F₂` and every free group on at least two generators are paradoxical; on `ℤ`, the even integers
are not equidecomposable with `ℤ`.

### Dependencies

Layers 1–2. Mathlib `Equidecomp`, `Finpartition`, `FreeGroup.toWord`. Tau Ceti
`TauCeti/Algebra/Group/Action/Equidecomp.lean`, `Equipartition.lean` and `Paradoxical.lean`,
`TauCeti/MeasureTheory/Group/Paradoxical.lean`, `TauCeti/GroupTheory/FreeGroup/StartsWith.lean` and
`Paradoxical.lean`, `TauCeti/GroupTheory/Amenable/FreeGroup.lean`.

References: [Garrido](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf), Definition 1.1,
Theorem 1.2, Corollary 1.3, Definition 1.4 and Proposition 1.5 (1).

## Layer 4: discrete closure theory

All groups in this layer carry the discrete topology, and the maps on means come with formulas.
Subgroups of amenable topological groups need not be amenable; the subgroup theorem is for discrete
groups.

### 4.1 Subgroups

If `G` is amenable, every subgroup `K ≤ G` is amenable (the instance `TauCeti.Amenable.subgroup`),
and so is every group with an injective homomorphism into `G` (`TauCeti.Amenable.of_injective`).
The proof chooses representatives of the right cosets `K t`, with `1` for `K` itself, so that
`r(k x) = k r(x)` defines a `K`-equivariant retraction `r : G → K`; it pulls a bounded function on
`K` back along `r` and averages with a mean on `G` (`TauCeti.Mean.mapOfDiscrete`,
`TauCeti.Mean.IsLeftInvariant.mapOfDiscrete`). This is not restriction of a probability to `K`,
which can have mass zero. *Needs:* §2.1.

### 4.2 Quotients and images

Amenability passes along every surjective homomorphism (`TauCeti.Amenable.of_surjective`; on a
discrete group every homomorphism is continuous), so the quotient `G ⧸ N` by every normal subgroup
(`QuotientGroup.mk'`) and the range of every homomorphism out of an amenable group
(`MonoidHom.rangeRestrict`) are amenable, and isomorphic groups are amenable together
(`ContinuousMulEquiv.amenable_iff`). *Needs:* §1.5.

### 4.3 Extensions

If `N ◁ G` with `N` and `G ⧸ N` amenable, then `G` is amenable, and conversely
(`TauCeti.Amenable.of_subgroup_quotient`, `TauCeti.amenable_iff_subgroup_quotient`). More generally,
for homomorphisms `ψ : K →* G` and `φ : G →* Q` with `K` and `Q` amenable and `ker φ ≤ range ψ`,
`G` is amenable (`TauCeti.Amenable.of_ker_le_range`); with `ψ` the inclusion of the kernel this is
the theorem for a surjective homomorphism with amenable kernel. For a bounded `f` on `G` and an
invariant mean `n` on `K`, the fiber average `x ↦ n(k ↦ f(x ψ(k)))` is
`TauCeti.UCB.fiberAverage ψ n f` (`TauCeti.UCB.fiberAverage_apply`); it is bounded by `‖f‖`
(`TauCeti.UCB.norm_fiberAverage_apply_le`), positive, normalized, compatible with left translation
(`TauCeti.UCB.fiberAverage_leftTranslation`), and constant on the fibers of `φ`
(`TauCeti.UCB.fiberAverage_apply_eq_of_map_eq`). Averaging it with an invariant mean on `Q` along a
section `s` of `φ` is the mean `TauCeti.Mean.extension ψ n s m`
(`TauCeti.Mean.extension_apply`), which is invariant (`TauCeti.Mean.IsLeftInvariant.extension`).
*Needs:* §2.1, §4.1, §4.2.

### 4.4 Finite products

For amenable topological groups `G` and `H` (discrete or not), the product mean
`TauCeti.Mean.prod m n` is the iterated mean `f ↦ m(x ↦ n(y ↦ f(x, y)))`
(`TauCeti.Mean.prod_apply`), has marginals `m` and `n` (`TauCeti.Mean.map_fst_prod`,
`TauCeti.Mean.map_snd_prod`), and is invariant when `m` and `n` are
(`TauCeti.Mean.IsLeftInvariant.prod`). So `G × H` is amenable exactly when `G` and `H` are (the
instance `TauCeti.Amenable.prod`, `TauCeti.amenable_prod_iff`), and a product over a finite index
type, the empty product included, is amenable exactly when every factor is (the instance
`TauCeti.Amenable.pi`, `TauCeti.amenable_pi_iff`). In the discrete case product closure is also the
extension theorem of §4.3 for the subgroup `G × 1` with quotient `H`. *Needs:* §§1.4–1.5.

### 4.5 Directed unions

For a nonempty directed family of subgroups `H_i ≤ G`, each amenable, the subgroup `⋃_i H_i`,
which is `⨆ i, H_i`, is amenable (`TauCeti.amenable_iSup_of_directed`); in particular `G` is
amenable when the union is all of `G` (`TauCeti.Amenable.of_directed_of_iSup_eq_top`). The general
criterion is `TauCeti.Amenable.of_forall_finset_subset_range`: if every finite subset of `G` lies
in the image of a continuous homomorphism from an amenable group, `G` is amenable. The proof
restricts a bounded function to `H_i` and applies a mean there; for each finite family of
invariance equations, directedness puts the finitely many acting elements in one `H_i`, and the
finite-intersection criterion of §1.4 concludes. *Needs:* §1.4, §1.5.

### 4.6 Directed colimits

For a small filtered diagram `F` of discrete amenable groups in Mathlib's `GrpCat` and any colimit
cocone `c`, the group `c.pt` is amenable, with every group topology
(`TauCeti.Amenable.of_isColimit_of_discreteTopology`; the topological form with continuous legs is
`TauCeti.Amenable.of_isColimit`). The transition maps need not be injective, and the result holds
for every colimit cocone, so it is invariant under the unique isomorphism of colimits. For a
directed system of groups `G_i` with homomorphisms `φ_ij` satisfying the identity and composition
laws, Mathlib's `DirectLimit` is amenable when every `G_i` is
(`TauCeti.Amenable.directLimit_of_discreteTopology`). The proof uses Mathlib's
`GrpCat.FilteredColimits.colimitCoconeIsColimit`, the preservation of filtered colimits by the
forgetful functor, and `CategoryTheory.Limits.Types.jointly_surjective_of_isColimit` to represent
every element at a stage; the images of the stages are a directed family of subgroups covering the
colimit, each image is a quotient of its stage, and §4.2 and §4.5 apply. *Needs:* §4.2, §4.5.

### 4.7 Finitely generated subgroups and free subgroups

Every finite subset of `G` lies in a finitely generated subgroup, and these subgroups form a
directed family with union `G`, so `G` is amenable when all its finitely generated subgroups are
(`TauCeti.Amenable.of_forall_fg`). A discrete group with a subgroup isomorphic to a free group on at
least two generators, in particular to `F₂`, is not amenable
(`TauCeti.not_amenable_of_injective_freeGroup`), by §3.5 and §4.1. *Needs:* §3.5, §4.1, §4.5.

### Examples

Subgroups, quotients, extensions and finite products of finite groups; the finitary symmetric group
of an infinite set, a directed union of finite groups; `SL₂(ℤ)`, which contains a free group of
rank two and is not amenable.

### Dependencies

Layers 1–3. Mathlib `QuotientGroup`, `MonoidHom.range`, `GrpCat`, `DirectLimit`. Tau Ceti
`TauCeti/GroupTheory/Amenable/Subgroup.lean`, `Extension.lean`, `Prod.lean`, `DirectedUnion.lean`,
`Colimit.lean` and `FreeGroup.lean`, and `TauCeti/Topology/Algebra/Group/UCB/Prod.lean`.

References: [Garrido](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf), Proposition 2.2;
[BDHV](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf), Proposition G.2.2, for the
quotient, extension and directed-union principles.

## Layer 5: Følner criteria for arbitrary discrete groups

### 5.1 Følner sets

`TauCeti.HasFoelnerSets G` names `NeBot (maxFoelner G Measure.count)` for the left regular action
on `G`, with Mathlib's
[`IsFoelner` and `maxFoelner`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Group/FoelnerFilter.html)
as the Følner API. It installs the measurable space `⊤` locally, so every subset is measurable
even when `G` is uncountable, and it mentions no topology. Here `NeBot` excludes the bottom filter,
for which all eventual conditions hold vacuously. For `G` with only `[Group G]`, with no topology
and no countability hypothesis,

```text
HasFoelnerSets G ↔
  ∀ K ⊆ G finite,  ∀ ε > 0,  ∃ F ⊆ G finite,  F ≠ ∅  ∧  ∀ g ∈ K,  |gF △ F| < ε·|F|
```

(`TauCeti.hasFoelnerSets_iff`; headline `hasFoelnerSets_iff`). *Needs:* Mathlib `IsFoelner`,
`maxFoelner`, `isFoelner_iff_tendsto`, `MeasureTheory.Measure.count`.

- Counting measure and finite sets: for finite nonempty `F`, the `ℝ≥0∞` ratio of `IsFoelner` is
  below `ε` exactly when the real ratio `|gF △ F| / |F|` is
  (`MeasureTheory.Measure.count_smul_symmDiff_div_count_lt_ofReal_iff`); a Følner family of finite
  sets has real ratios tending to zero (`IsFoelner.tendsto_card_smul_symmDiff_div_card`) and passes
  every finite test along a nontrivial filter (`IsFoelner.exists_finset_card_smul_symmDiff_lt`);
  conversely finite nonempty sets with ratios tending to zero along a nontrivial filter give Følner
  sets (`TauCeti.HasFoelnerSets.of_tendsto_card_smul_symmDiff_div_card`).
- Having Følner sets is invariant under group isomorphisms (`MulEquiv.hasFoelnerSets_iff`).

Prove the following facts about the finite test.

- Monotonicity: a set `F` that passes the test for `K` and `ε` passes it for every `K' ⊆ K` and
  every `ε' ≥ ε`.
- For finite `F` and `g ∈ G`, `|gF \ F| = |F \ gF|`, hence `|gF △ F| = 2 |gF \ F|`.
- The triangle bound `|ghF △ F| ≤ |gF △ F| + |hF △ F|`, from `ghF △ F ⊆ g(hF △ F) ∪ (gF △ F)`.

*Needs:* Mathlib `Finset.card_smul_finset`, `Finset.card_sdiff_comm`, `symmDiff_triangle`.

**Checks.**
- For `G = ℤ`, `F_n = {0, …, n}` and `g = 1`, `(1 + F_n) △ F_n = {0, n + 1}`, so the ratio is
  `2/(n + 1)`, and `|(1 + F_n) \ F_n| = |F_n \ (1 + F_n)| = 1`.
- Writing `|gF △ F| ≤ ε|F|` without `F ≠ ∅` would let `F = ∅` pass every test, and every group,
  `F₂` included, would have Følner sets.

### 5.2 Amenability implies the finite-test condition

An amenable discrete group satisfies Reiter's condition: for finite `K ⊆ G` and `δ > 0` there is a
finitely supported `p : G → ℝ` with `p ≥ 0`, `∑_x p(x) = 1` and
`∑_(g ∈ K) ‖L_g p − p‖₁ < δ`, where `‖L_g p − p‖₁ = ∑_x |p(g⁻¹x) − p(x)|`
(`TauCeti.Amenable.exists_sum_tsum_abs_sub_lt`), and conversely Reiter's condition characterizes
amenability (`TauCeti.amenable_iff_exists_sum_tsum_abs_sub_lt`). The proof separates zero from the
norm closure of the convex set `{(L_g p − p)_(g ∈ K) : p a finitely supported probability}` in the
finite product of copies of `ℓ¹(G) = lp (fun _ : G ↦ ℝ) 1` with the sum norm, by
`geometric_hahn_banach_point_closed`. For a continuous linear functional `Λ` on that product, let
`f_g(y) = Λ(ι_g δ_y)`, where `ι_g` is the inclusion of the `g`-th factor and `δ_y` is the point
mass `lp.single`; then `|f_g(y)| ≤ ‖Λ‖`, so each `f_g` is bounded. Evaluating a strict separator at
point masses gives a positive lower bound, uniform in `x`, for `∑_(g ∈ K) (f_g(gx) − f_g(x))`, while
an invariant mean gives this sum mean zero. *Needs:* §2.1, §1.4; Mathlib
`geometric_hahn_banach_point_closed`.

From Reiter's condition, a level set of `p` is a Følner set: if `p ≥ 0` is finitely supported and
`∑_(g ∈ K) ∑_x |p(g⁻¹x) − p(x)| < ε ∑_x p(x)`, then some superlevel set `F_t = {x : p(x) > t}` is
nonempty with `|gF_t △ F_t| < ε |F_t|` for every `g ∈ K`
(`TauCeti.exists_finset_card_smul_symmDiff_lt_of_sum_tsum_lt`, with the summed form
`TauCeti.exists_finset_sum_card_smul_symmDiff_lt_of_sum_tsum_lt`, for any action on a set). The
layer-cake identities `∫₀^∞ |F_t| dt = ∑ p` and `∫₀^∞ |gF_t △ F_t| dt = ‖L_g p − p‖₁` are finite
weighted sums over the breakpoints of the values of `p`, and a weighted average gives the level
`t`; `K = ∅` is handled by a singleton. Hence Reiter's condition gives Følner sets
(`TauCeti.hasFoelnerSets_of_forall_exists_sum_tsum_abs_sub_lt`). *Needs:* §5.1.

### 5.3 Filters, nets and the converse

Finite tests give a concrete Følner net: indexing by pairs `(K, n)` with `K : Finset G` and
`n : ℕ`, ordered by inclusion and the usual order, and choosing a witness with error `1/(n + 1)`,
gives finite nonempty sets `F_(K, n)` with `IsFoelner G Measure.count atTop (fun i ↦ F_i)` along a
nontrivial filter (`TauCeti.exists_isFoelner_atTop`). Conversely a nontrivial Følner filter of finite
nonempty sets satisfies all finite tests, by intersecting finitely many eventual conditions
(`IsFoelner.exists_finset_card_smul_symmDiff_lt`). Mathlib's `IsFoelner.comp_tendsto` and
`IsFoelner.mono` give reindexing along `Tendsto` and passage to finer filters, in particular to
cofinal subnets. Prove that the Følner property is compatible with eventual equality: if two
families of sets agree eventually along a filter `l`, one is a Følner family along `l` exactly when
the other is. *Needs:* §5.1; Mathlib `isFoelner_iff_tendsto`, `Filter.Tendsto.congr'`.

From Følner sets to an invariant mean: for an ultrafilter `u` along which a family `F` is Følner,
Mathlib's limits of the densities `|A ∩ F_i| / |F_i|` in the compact interval `[0, 1]` form an
invariant content `IsFoelner.addContent` with total mass one (`IsFoelner.tendsto_addContent`,
`IsFoelner.addContent_univ`, `IsFoelner.addContent_smul`), finite sums and the boundary estimate
passing to the limit. Its mean `TauCeti.Mean.ofIsFoelner` has exactly this content
(`TauCeti.Mean.toContent_ofIsFoelner`) and is invariant (`TauCeti.Mean.isLeftInvariant_ofIsFoelner`).
For finite nonempty `F`, the average `m_F(f) = |F|⁻¹ ∑_(x ∈ F) f(x)` satisfies

```text
|m_F(L_g f) − m_F(f)| ≤ ‖f‖∞ · |g⁻¹F △ F| / |F|
```

(`TauCeti.Mean.abs_average_leftTranslation_sub_le`), and along the ultrafilter the averages
converge in the weak-* topology to the mean of the density-limit content formed with the same
ultrafilter (`TauCeti.Mean.tendsto_average_ofIsFoelner`). Hence a group with Følner sets is
amenable, with every group topology (`TauCeti.Amenable.of_isFoelner`,
`TauCeti.Amenable.of_hasFoelnerSets`, `TauCeti.Amenable.of_tendsto_card_smul_symmDiff_div_card`).
*Needs:* §1.4, §2.3, §5.1; Mathlib `IsFoelner.amenable`.

### 5.4 Følner's theorem

A discrete group is amenable exactly when it has Følner sets
(`TauCeti.amenable_iff_hasFoelnerSets`, with `TauCeti.Amenable.hasFoelnerSets`; headline
`amenable_iff_hasFoelnerSets`):

```text
Amenable G ↔ HasFoelnerSets G.
```

Since `TauCeti.HasFoelnerSets G` is by definition `NeBot (maxFoelner G Measure.count)` with the
measurable space `⊤`, the same theorem says that `G` is amenable exactly when its counting-measure
Følner filter is nontrivial. Composing with §5.1 gives the finite-test form
(`TauCeti.amenable_iff_exists_finset`; headline `amenable_iff_exists_finset`). *Needs:* §5.2,
§5.3.

### 5.5 Følner sequences

For countable `G`, having Følner sets is equivalent to the existence of finite nonempty sets `F_n`
with `|gF_n △ F_n| / |F_n| → 0` for every `g` (`TauCeti.hasFoelnerSets_iff_exists_seq`; headline
`amenable_iff_exists_foelnerSequence`). The proof builds an increasing sequence of finite test sets
covering `G`, without requiring `G` infinite, and uses error `1/(n + 1)`; the reverse implication
uses finite intersections of eventual conditions and needs no countability. The sets `F_n` need
not be nested or exhaustive. *Needs:* §5.1, §5.4.

### Examples

The intervals `{0, …, n}` in `ℤ` (Layer 6); finite groups, where `F = G` passes every test.

### Dependencies

Layers 1–2. Mathlib `IsFoelner`, `maxFoelner`, `lp`, `geometric_hahn_banach_point_closed`. Tau Ceti
`TauCeti/GroupTheory/Amenable/Foelner.lean`, `Reiter.lean`, `Average.lean`, `DiscreteFoelner.lean`
and `Sequence.lean`, and `TauCeti/MeasureTheory/Group/Foelner/AddContent.lean`.

References: [Garrido](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf), Definition 3.1,
Definition 3.3, Lemma 3.4 and Theorem 3.6;
[BDHV](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf), Theorem G.3.1 for approximate
invariance and G.5.1–G.5.2 for Følner sets and the level-set argument.

## Layer 6: integers and abelian groups

### 6.1 The integers

For the additive group `ℤ`, take `F_n = {0, …, n}` (`Finset.Icc 0 n`), of cardinality `n + 1`. The
ratio `|(k + F_n) △ F_n| / |F_n|` tends to zero for every integer `k`
(`Int.tendsto_card_image_add_left_Icc_symmDiff_div_card`), so the intervals are an additive Følner
family for counting measure (`TauCeti.isAddFoelner_int_Icc`, in Mathlib's `IsAddFoelner`), and,
through `Multiplicative ℤ`, `ℤ` has Følner sets (`TauCeti.hasFoelnerSets_multiplicative_int`) and
is amenable with every group topology (the instance `TauCeti.Amenable.multiplicative_int`).
*Needs:* §5.4.

Prove the interval estimate `|(k + F_n) △ F_n| ≤ 2|k|` for every integer `k` and natural number
`n`. *Needs:* Mathlib `Finset.Icc`.

**Checks.**
- The exact value is `2 · min(|k|, n + 1)`: for `k = 3` and `n = 1`, `3 + F_1 = {3, 4}` is
  disjoint from `F_1 = {0, 1}`, and the symmetric difference has `4 ≤ 6` elements.

### 6.2 Finitely generated abelian groups

A finitely generated abelian group `A` with generators `a_1, …, a_r` is the image of the
homomorphism `ℤ^r → A` sending the standard generators to them; in multiplicative form this is
Mathlib's `MonoidHom.noncommPiCoprod` of the maps `zpowersHom A a_i`. Finite-product and image
closure (§4.4, §4.2) make `A` amenable; this is the case of finitely generated `A` of §6.3.
*Needs:* §4.2, §4.4, §6.1.

### 6.3 Abelian groups

Every commutative group is amenable, with every group topology and with no rank or torsion
restriction (the instance `TauCeti.Amenable.of_commGroup`): a finite subset `s` lies in the image
of the continuous homomorphism from the discrete group `s → Multiplicative ℤ` of §6.2, which is
amenable, and the directed-union criterion `TauCeti.Amenable.of_forall_finset_subset_range` of §4.5
applies. For an additive commutative group `A`, the statement is about `Multiplicative A`, which
carries the topology of `A`. *Needs:* §4.5, §6.2.

### Examples

`ℤ`, `ℤ^r`, `ℚ`, which is abelian but not finitely generated, and `ℝ` with its usual topology.

### Dependencies

Layers 4–5. Mathlib `IsAddFoelner`, `Multiplicative`, `MonoidHom.noncommPiCoprod`. Tau Ceti
`TauCeti/MeasureTheory/Group/Foelner/Int.lean`, `TauCeti/GroupTheory/Amenable/Int.lean` and
`Abelian.lean`.

References: [Garrido](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf), Example 3.5 and
Proposition 2.3; [BDHV](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf), Example G.5.4
for the integer intervals.

## Layer 7: locally compact Hausdorff groups and Haar L∞

Standing hypotheses as in Convention 7: `G` is a locally compact Hausdorff topological group with
the Borel measurable space and a regular left Haar measure `μ`.

### 7.1 Haar L∞ and the comparison with UCB

`L∞(G, μ)` is `MeasureTheory.Lp ℝ ∞ μ`, with the constant class `TauCeti.linftyOne`. Left
translation `MeasureTheory.Lp.leftTranslation μ ∞ ℝ g` is a linear isometry, positive
(`MeasureTheory.Lp.leftTranslation_mono`) and unital (`MeasureTheory.Lp.leftTranslation_linftyOne`).
Taking classes, `BoundedContinuousFunction.toLpTop μ ℝ`, maps `UCB(G)` to `L∞(G, μ)` positively
(`BoundedContinuousFunction.toLpTop_mono`), unitally (`BoundedContinuousFunction.toLpTop_one`) and
equivariantly (`MeasureTheory.Lp.leftTranslation_toLpTop`); because a Haar measure is positive on
nonempty open sets, the supremum and the essential supremum of a continuous function agree, and
the map is isometric (`BoundedContinuousFunction.norm_toLpTop`) and reflects the order
(`BoundedContinuousFunction.toLpTop_le_toLpTop_iff`). *Needs:* Layer 1; Mathlib `MeasureTheory.Lp`,
`MeasureTheory.Measure.haar`.

- A positive linear functional on `L∞(G, μ)` is continuous (`PositiveLinearMap.continuous_lpTop`).
- A positive functional `M` on `L∞(G, μ)` with `M(1) = 1` restricts along `toLpTop` to a mean on
  `UCB(G)` (`TauCeti.Mean.ofLpTop`), left invariant when `M` is
  (`TauCeti.Mean.isLeftInvariant_ofLpTop`). Hence a topological group with a left-invariant mean on
  `L∞` of some left-invariant measure is amenable (`TauCeti.Amenable.of_lpTop`): this is the
  reverse implication of §7.5.

**Checks.**
- Positivity on open sets is what makes the map isometric. For the Dirac measure at `0` on `ℝ`,
  which is not open-positive, `f(x) = min(|x|, 1)` has supremum `1` but essential supremum `0`.

### 7.2 Measure-theoretic inputs

*σ-compact localization.* Countably many almost-everywhere finitely strongly measurable functions,
in particular countably many elements of `L¹(G, μ)`, vanish almost everywhere outside a single
σ-compact set (`MeasureTheory.exists_isSigmaCompact_forall_ae_eq_zero`); a σ-compact set lies in a
σ-compact open subgroup (`IsSigmaCompact.exists_openSubgroup`, which adjoins a compact
identity neighbourhood), so countably many integrable functions vanish almost everywhere off one
σ-compact open subgroup `H` (`MeasureTheory.exists_openSubgroup_isSigmaCompact_forall_ae_eq_zero`).
Integrals of such functions over `H` agree with integrals over `G`
(`MeasureTheory.setIntegral_eq_integral_of_ae_compl_eq_zero`), so they do not depend on the
subgroup chosen, and smoothing kernels can be chosen within one such subgroup. σ-compactness does
not imply second countability. The convolutions of §7.3 and §7.4 are Bochner integrals of
translates and need no σ-finiteness of `G`. *Needs:* Mathlib `IsSigmaCompact`.

*The modular character.* `c(g) > 0` (`MeasureTheory.Measure.modularCharacterFun_pos`) and `c` is
a homomorphism to `ℝ≥0`, so `c(g⁻¹) = c(g)⁻¹`; it is continuous (`TauCeti.continuous_modularCharacter`):
for a nonzero nonnegative compactly supported continuous test function `f`, the integral
transformation formula expresses `c(g)` as `∫ f(x g) dμ(x) / ∫ f dμ`, continuous in `g`. For a regular Haar measure, without global inner regularity,
`map (· * g) μ = c(g) • μ` (`MeasureTheory.Measure.map_right_mul_eq_modularCharacter_smul_of_regular`,
derived from `MeasureTheory.Measure.isMulLeftInvariant_eq_smul_of_regular` and regularity under a
homeomorphism, where Mathlib's `MeasureTheory.Measure.map_right_mul_eq_modularCharacterFun_smul`
assumes `InnerRegular`), `∫ f(x g) dμ(x) = c(g) ∫ f dμ`
(`TauCeti.integral_mul_right_eq_modularCharacter_smul_of_regular`), right translation and inversion
preserve null sets (`MeasureTheory.Measure.measure_mul_right_null_of_regular`,
`MeasureTheory.Measure.measure_inv_null_of_regular`), and the inversion formula
`μ.map Inv.inv = μ.withDensity (fun x ↦ (c(x) : ℝ≥0∞))` holds
(`MeasureTheory.Measure.inv_eq_withDensity_modularCharacter_of_regular`); its strictly positive
finite density makes `μ` and its inverse have the same null sets. *Needs:* Mathlib
`MeasureTheory.Measure.modularCharacter`.

*Baire representatives.* Prove that for a σ-compact locally compact Hausdorff group `H` with a left
Haar measure `μ`, in particular a σ-compact open subgroup of `G` with the restriction of `μ`, every
Borel set `E` lies between two Baire sets, `B ⊆ E ⊆ B'` with `μ(B' \ B) = 0`, so that `E` differs
from a Baire set by a subset of a Baire `μ`-null set. Here the Baire σ-algebra is generated by the
continuous real-valued functions. The input is that Haar measures are completion regular, inner
regular with respect to zero sets ([Fremlin, *Measure Theory*, §443M](https://www1.essex.ac.uk/maths/people/fremlin/chap44.pdf#page=29)),
applied to `E` and its complement, of σ-finite measure because `H` is σ-compact. *Needs:* Mathlib
`MeasureTheory.Measure.haar`.

**Checks.**
- On the affine group of §1.1, `μ = da db / a²` is a left Haar measure and `c(a, b) = a`: for
  `g = (2, 0)` and `S = [1, 2] × [0, 1]`, `S g⁻¹ = [1/2, 1] × [0, 1]`, of measure `1`, while
  `μ(S) = 1/2`, so `(map (· * g) μ)(S) = μ(S g⁻¹) = 2 μ(S)`. The group is not unimodular, and
  the opposite normalization would give `1/2`, which is BDHV's `Δ(g)`.

### 7.3 L¹ convolution and approximate identities

The convolution `MeasureTheory.Lp.convolutionL μ p hp`, defined for `p ≠ ∞` and
`(h ⋆ f)(x) = ∫ h(y) f(y⁻¹x) dμ(y)` almost everywhere, is a Bochner integral of left translates;
it satisfies `‖h ⋆ f‖ ≤ ‖h‖₁ ‖f‖` (`MeasureTheory.Lp.norm_convolutionL_apply_le`), associativity
(`MeasureTheory.Lp.convolutionL_assoc`), positivity (`MeasureTheory.Lp.convolutionL_nonneg`),
`∫ (h ⋆ f) = ∫ h · ∫ f` (`MeasureTheory.Lp.integral_convolutionL`), so it preserves nonnegative
functions of integral one, and equivariance under left translation
(`MeasureTheory.Lp.leftTranslation_convolutionL`). Left and right translation are continuous on
`Lᵖ` for `p ≠ ∞` (`MeasureTheory.Lp.continuous_leftTranslation_apply`,
`MeasureTheory.Lp.continuous_rightTranslation_apply`), where right translation
`MeasureTheory.Lp.rightTranslation` is normalized by `c` to be isometric, `(R_g h)(x) = c(g)⁻¹ h(xg)`
on `L¹`. *Needs:* §7.2.

Prove that `L¹(G, μ)` has an approximate identity of kernels supported near `1`:

- for every neighbourhood `U` of `1` there is `k ∈ L¹(G, μ)` with `k ≥ 0`, `∫ k dμ = 1` and
  `k = 0` almost everywhere off `U` (the normalized indicator of a compact neighbourhood of `1`
  inside `U`, of finite positive measure);
- for every `h ∈ L¹(G, μ)` and `ε > 0` there is a neighbourhood `U` of `1` such that
  `‖h ⋆ k − h‖₁ < ε` for every such `k` supported in `U`. Choosing one kernel `h_U` for each `U`
  gives a net with `‖h ⋆ h_U − h‖₁ → 0` along the neighbourhoods of `1`.

Route: by left invariance and the inversion formula of §7.2, `h ⋆ k = ∫ k(z) R_(z⁻¹) h dμ(z)`, an
average of right translates of `h` with weights `k`, and continuity of `z ↦ R_z h` at `1` in `L¹`
concludes; compactly supported continuous approximation
(`MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`) is an alternative input.
*Needs:* `MeasureTheory.Lp.convolutionL`, `MeasureTheory.Lp.continuous_rightTranslation_apply`,
`MeasureTheory.Measure.inv_eq_withDensity_modularCharacter_of_regular`.

**Checks.**
- On `ℝ` with Lebesgue measure, `h = 1_[0, 1]` and `k = (2δ)⁻¹ 1_[−δ, δ]` with `δ ≤ 1/2`, `h ⋆ k`
  differs from `h` only within `δ` of `0` and of `1`, and `‖h ⋆ k − h‖₁ = δ`. Without the
  normalization `∫ k = 1`, the kernels `1_[−δ, δ]` give `h ⋆ k → 0`.

### 7.4 Smoothing L∞ into UCB

For `h ∈ L¹(G, μ)` and `φ ∈ L∞(G, μ)`, the function `C_h φ(x) = ∫ h(y) φ(y⁻¹x) dμ(y)`, defined at
every point, lies in `UCB(G)`: this is the bounded linear operator
`MeasureTheory.Lp.convolutionUCB h : L∞ →L[ℝ] UCB G` (`MeasureTheory.Lp.convolutionUCB_apply`),
which does not depend on representatives (`MeasureTheory.Lp.convolutionUCB_apply_of_ae_eq`).
*Needs:* §7.3, §1.2.

- `‖C_h φ‖∞ ≤ ‖h‖₁ ‖φ‖∞` (`MeasureTheory.Lp.norm_convolutionUCB_le`,
  `MeasureTheory.Lp.norm_convolutionUCB_apply_le`), and `C_h φ` is bilinear in `(h, φ)`
  (`MeasureTheory.Lp.convolutionUCBL`).
- Positivity for `h ≥ 0` (`MeasureTheory.Lp.convolutionUCB_nonneg`,
  `MeasureTheory.Lp.convolutionUCB_mono`) and `C_h 1 = (∫ h) 1`
  (`MeasureTheory.Lp.convolutionUCB_linftyOne`).
- Mixed associativity `C_(h ⋆ k) φ = C_h (C_k φ)`, with `C_k φ` viewed in `L∞` through `toLpTop`
  (`MeasureTheory.Lp.convolutionUCB_convolutionL`).
- Translation: `C_(L_g h) φ = L_g (C_h φ)` (`MeasureTheory.Lp.convolutionUCB_leftTranslation_apply`)
  and `C_h (L_g φ) = C_(R_(g⁻¹) h) φ` (`MeasureTheory.Lp.convolutionUCB_apply_leftTranslation`),
  where `R_(g⁻¹) h(z) = c(g) h(z g⁻¹)` is again nonnegative of integral one when `h` is.
- On `UCB(G)`, `C_h` of the class of `ψ` is the `UCB`-valued Bochner integral
  `∫ h(y) L_y ψ dμ(y)` of the norm-continuous orbit (`MeasureTheory.Lp.convolutionUCB_toLpTop`,
  `TauCeti.UCB.integral_smul_leftTranslation_apply`), which is integrable, the orbit being
  essentially separably valued by continuity on σ-compact supports
  (`TauCeti.UCB.integrable_smul_leftTranslation`).

### 7.5 The characterization

For a left-invariant mean `m` on `UCB(G)` and `h ∈ L¹(G, μ)`: `m(C_h ψ) = (∫ h) m(ψ)` for
`ψ ∈ UCB(G)` (`TauCeti.Mean.IsLeftInvariant.apply_convolutionUCB_toLpTop`, through the orbit
integral `TauCeti.Mean.IsLeftInvariant.apply_integral_smul_leftTranslation`),
`m(C_(L_g h) φ) = m(C_h φ)` (`TauCeti.Mean.IsLeftInvariant.apply_convolutionUCB_leftTranslation`),
and `m(C_(h ⋆ k) φ) = (∫ h) m(C_k φ)` (`TauCeti.Mean.IsLeftInvariant.apply_convolutionUCB_convolutionL`).

Prove:

- *Independence of the kernel.* For a left-invariant mean `m`, nonnegative `h, k ∈ L¹(G, μ)` of
  integral one and `φ ∈ L∞(G, μ)`, `m(C_h φ) = m(C_k φ)`. Route: with the approximate identity
  `h_U` of §7.3 and continuity of `m` and of `h ↦ C_h φ`,
  `m(C_h φ) = lim_U m(C_(h ⋆ h_U) φ) = lim_U m(C_(h_U) φ)`, a limit that does not involve `h`.
- *The extension.* Fix such an `h₀` and set `M(φ) = m(C_(h₀) φ)`. Then `M` is a positive linear
  functional on `L∞(G, μ)` with `M(1) = 1`, continuous, and left invariant: `M(L_g φ) =
  m(C_(R_(g⁻¹) h₀) φ) = M(φ)` by the translation formula of §7.4 and independence of the kernel.
- *The theorem* (headline `amenable_iff_exists_lpTop_invariant_of_isHaarMeasure`): `G` is amenable
  if and only if there is a positive linear functional `M` on `L∞(G, μ)` with `M(1) = 1` and
  `M(L_g φ) = M(φ)` for all `g` and `φ`. The forward implication is the extension; the reverse is
  §7.1.

```text
G amenable  ⟺  ∃ M : L∞(G, μ) → ℝ linear, positive, unital and left invariant.
```

*Needs:* §§7.1–7.4.

Whether such an `M` exists depends only on the null sets of `μ`: it is unchanged by multiplying `μ`
by a positive constant (`TauCeti.exists_lpTop_invariant_smul_iff`), is the same for measures with
the same null sets (`TauCeti.exists_lpTop_invariant_congr`), and is the same for all regular Haar
measures (`TauCeti.exists_lpTop_invariant_iff_of_regular`). For a discrete group the theorem holds
for every left-invariant measure charging every point, Haar measure included, where means on
`UCB(G)` and on `L∞` correspond bijectively (`TauCeti.amenable_iff_exists_lpTop_invariant`,
`TauCeti.Mean.lpTopEquiv`, `TauCeti.Mean.isLeftInvariant_iff_lpTopEquiv`), compatibly with Layer 2.
[BDHV](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf), Theorem G.3.1 (i) and (v), is
the principal reference.

### 7.6 Means on L∞ and Borel contents

Positive linear functionals `M` on `L∞(G, μ)` correspond bijectively to nonnegative real contents
`ν` on the Borel sets with `μ(A) = 0 ⟹ ν(A) = 0` (with the value `0` on nonmeasurable sets, which
are not part of the specification) (`PositiveLinearMap.addContentLpTopEquiv μ`), by
`ν(A) = M([1_A])` (`LinearMap.toAddContentLpTop_apply`, with the class
`TauCeti.linftyIndicator` of `1_A`) and `M(1) = ν(G)` (`LinearMap.toAddContentLpTop_univ`).
The inverse integrates Borel simple functions, approximates bounded measurable representatives
uniformly, and descends through almost-everywhere equality by null annihilation; an essentially
bounded representative can be truncated on a null set (`PositiveLinearMap.ofAddContentLpTop`).
`M` is left invariant exactly when `ν(gA) = ν(A)` for every `g` and Borel `A`
(`PositiveLinearMap.forall_apply_leftTranslation_eq_iff`), so a left-invariant Borel probability
content vanishing on null sets makes `G` amenable (`TauCeti.Amenable.of_addContent`). *Needs:*
§7.1.

```text
ν(gA) = ν(A),        μ(A) = 0  ⟹  ν(A) = 0.
```

Prove that the correspondence passes to the completion of the Haar measurable space: every such
Borel content extends uniquely across null sets to the `μ`-null-measurable sets (Mathlib's
`MeasureTheory.NullMeasurableSet`), by `ν(E) = ν(A)` for Borel `A` with `μ(E △ A) = 0`; the
extensions are exactly the nonnegative contents on the null-measurable sets vanishing on null
sets, positive functionals on `L∞(G, μ)` correspond to them by the same formula
`ν(E) = M([1_E])`, and invariance is preserved. *Needs:* `PositiveLinearMap.addContentLpTopEquiv`.

### 7.7 Locally Borel and locally null sets

BDHV's Section C.5 calls `A` *locally Borel* when `A ∩ B` is Borel for every Borel `B` of finite
Haar measure, and *locally null* when all those intersections have measure zero; a function is
locally measurable when inverse images of Borel sets are locally Borel, and the book's `L∞` is the
functions bounded outside a locally null set, modulo equality outside a locally null set. This is
not Mathlib's global `Lp ℝ ∞ μ`, and `L∞ = (L¹)*` needs measure-theoretic hypotheses not assumed
here; §§7.3–7.5 prove the global version directly. Prove, using a countable exhaustion by sets of
finite measure, that for σ-finite Haar measure (for instance when `G` is σ-compact) locally Borel
sets are Borel and locally null sets are null, so that the book's function and quotient conventions
agree with Mathlib's in that case. A separate local-`L∞` carrier is not a target. *Needs:* §7.1.

### 7.8 Compact groups

For a Borel probability measure `μ`, integration is a mean on `UCB(G)`, `TauCeti.Mean.integral μ`,
left invariant when `μ` is (`TauCeti.Mean.isLeftInvariant_integral`), and on `L∞(G, μ)` it is the
positive functional `MeasureTheory.Lp.integralPositiveLinearMap`, invariant under left translation
for left-invariant `μ` (`MeasureTheory.Lp.integral_leftTranslation`). For a compact group `G`, the
normalized Haar measure `TauCeti.haarProb G` is a positive multiple of `Measure.haar`
(`TauCeti.haarProb_def`), hence a regular left Haar measure, and `M(φ) = ∫ φ dμ` is a left-invariant
mean on `L∞(G, μ)` whose restriction to `UCB(G)` is an invariant mean: every compact group is
amenable for its given topology (the instance `TauCeti.Amenable.of_compactSpace`). For a finite
group, the Haar mean is the normalized counting mean of §2.5 (`TauCeti.Mean.integral_haarProb`).
This example concerns the given compact topology, not the underlying discrete group. *Needs:* §7.1,
§2.5; RepresentationTheory/CompactGroups §0.1.

### Examples

Compact groups, through normalized Haar measure; `ℝ` and `ℝⁿ`, abelian and so amenable (§6.3);
the affine group of §1.1, a non-unimodular amenable group: it is an extension of the multiplicative
group of positive reals by the additive group of the line, so it is amenable as a discrete group by
§4.3 and §6.3, and with its given topology by §2.4.

### Dependencies

Layers 1–2. Mathlib `MeasureTheory.Lp`, Haar measure and `MeasureTheory.Measure.modularCharacter`.
Tau Ceti `TauCeti/MeasureTheory/Function/Lp/`, `TauCeti/MeasureTheory/Group/ModularCharacter.lean`,
`TauCeti/MeasureTheory/Group/SigmaCompactSupport.lean`, `TauCeti/MeasureTheory/Group/Convolution/UCB.lean`,
`TauCeti/GroupTheory/Amenable/OrbitIntegral.lean`, `Convolution.lean` and `Linfty.lean`.
RepresentationTheory/CompactGroups §0.1 for normalized Haar probability, through Tau Ceti's
`TauCeti.haarProb`.

## Layer 8: Tarski's alternative for the whole discrete group

### 8.1 Expansion

If `G` has no Følner sets, then for every `k ∈ ℕ` there is a finite `D ⊆ G` with `|DF| ≥ k|F|` for
every finite `F ⊆ G` (`TauCeti.exists_mul_card_le_card_smul_of_not_hasFoelnerSets`). Route:
negating the finite test gives finite `K` and `ε > 0` such that each finite nonempty `F` has some
`g ∈ K` with `|gF △ F| ≥ ε|F|`; with `S = {1} ∪ K`, the difference identity of §5.1 gives
`|SF| ≥ |F ∪ gF| = |F| + |gF \ F| ≥ (1 + ε/2)|F|` for every finite `F`, the empty set included.
Iterating, `|S^n F| ≥ (1 + ε/2)^n |F|` (`Finset.pow_mul_card_le_card_pow_smul`), and `D = S^n`
with `(1 + ε/2)^n ≥ k` works. *Needs:* §5.1.

### 8.2 Hall's theorem

If a finite `D` satisfies `|DF| ≥ k|F|` for every finite `F`, there is an injection
`j : G × Fin k → G` with `j(x, i) ∈ D x` (`Finset.exists_injective_of_mul_card_le_card_smul`, for
any action on a set). Route: apply Mathlib's Hall theorem with arbitrary index type and finite
neighbour sets, `Finset.all_card_le_biUnion_card_iff_exists_injective`, to the neighbour sets
`N(x, i) = D x` indexed by `(x, i) ∈ G × Fin k`: for a finite set of indices `A` with projection `F`,
`|A| ≤ k|F| ≤ |DF| = |⋃_(a ∈ A) N(a)|`. Hence a nonamenable group, or a group without Følner sets,
has such an injection for every `k` (`TauCeti.exists_injective_mul_of_not_hasFoelnerSets`,
`TauCeti.exists_injective_mul_of_not_amenable`). *Needs:* §8.1; Mathlib
`Finset.all_card_le_biUnion_card_iff_exists_injective`.

### 8.3 The alternative

For every discrete group, without countability assumptions,

```text
G amenable  ⟺  G is not paradoxical for its left regular action
```

(`TauCeti.amenable_iff_not_paradoxical_univ`; headline `amenable_iff_not_paradoxical`), and without
reference to a topology, `G` has Følner sets exactly when it is not paradoxical
(`TauCeti.hasFoelnerSets_iff_not_paradoxical_univ`). This is the whole-group, left-regular-action
form of Tarski's alternative: exactly one of an invariant finitely additive probability on all
subsets and a paradoxical decomposition with finitely many pieces exists. The forward implication
is §3.4. For the converse (`TauCeti.paradoxical_univ_of_not_hasFoelnerSets`,
`TauCeti.paradoxical_univ_of_not_amenable`), take `k = 2` in §8.2 and choose for each value of `j` a
multiplier in the finite set `D`; for each copy `i`, the fibres of the multiplier give a finite
equidecomposition from `G` onto the image of `j(·, i)`, the two images are disjoint, and the
subcopy form of §3.3 gives paradoxicality. The assertion concerns the whole group, not every
nonempty subset. *Needs:* §3.3, §3.4, §5.4, §8.2.

### Examples

`F₂` is paradoxical, so not amenable; `ℤ` is amenable, so not paradoxical.

### Dependencies

Layers 3 and 5. Mathlib's Hall theorem. Tau Ceti `TauCeti/Combinatorics/Additive/Expansion.lean`,
`TauCeti/GroupTheory/Amenable/Expansion.lean` and `Tarski.lean`.

References: [Garrido](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf), Theorem 1.11
specialized to `X = E = G`, and Theorem 1.15 (iii) in discrete scope. A proof reference for this
alternative is Ceccherini-Silberstein–Grigorchuk–de la Harpe,
[*Amenability and paradoxical decompositions for pseudogroups and for discrete metric spaces*](https://people.tamu.edu/~grigorch/publications/zCGH.pdf),
Theorem 7, specialized to the left regular action; its relative-subset clause is outside this
target. Its §III.1, Theorem 35, gives the matching method; the one-sided Hall theorem in Mathlib
suffices for the injection used here.

## Downstream consumers

- [VonNeumannAlgebras](../VonNeumannAlgebras/README.md): Layers 5–7, in particular the kernels
  `h_U` of §7.3 and the σ-compact localization of §7.2.
- [BanachAlgebras](../BanachAlgebras/README.md): Layers 1 and 7, including the modular character,
  Baire representatives and the localized integrals of §7.2.
- [QuantumGroups](../QuantumGroups/README.md): Layer 1 invariant means, the Følner criterion of
  Layer 5 and Layer 7.
- [FactorRigidity](../FactorRigidity/README.md): Layers 1–5.
- [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md): the primary definition of Layer 1
  and the `L∞` means of Layer 7.
- [CompactQuantumMetricSpaces](../CompactQuantumMetricSpaces/README.md): amenability of abelian
  groups (Layer 6) and the interval estimate of §6.1.
- [HilbertModules/HeisenbergImprimitivity](../HilbertModules/HeisenbergImprimitivity/README.md):
  amenability of abelian discrete groups (Layer 6).
- [BanachSpaceTheory](../BanachSpaceTheory/README.md): the global `L∞` convention of Layer 7.

## Scope and ownership

**This roadmap owns** the theory of invariant means on `UCB(G)` for topological groups and the
definition of amenability through them (Layer 1); the discrete theory of means, finitely additive
probabilities and finite groups (Layer 2); equidecompositions, paradoxical sets and the paradoxical
decomposition of free groups (Layer 3); the closure properties of discrete amenability (Layer 4);
the Følner, Reiter and Følner-sequence characterizations (Layer 5); amenability of `ℤ` and of
abelian groups (Layer 6); the characterization of amenable locally compact Hausdorff groups by
invariant means on Haar `L∞`, the smoothing theory behind it, Baire representatives, the
correspondence with Borel contents and its completion, and the comparison with BDHV's local
conventions (Layer 7); and Tarski's alternative for the left regular action of a discrete group
(Layer 8).

**Already in the library.** The Tau Ceti library implements most of the roadmap, under the names
used above and listed under the supplier contracts: all of Layers 1, 3, 4 and 8; Layer 2 except
the general naturality and equivariance of §2.3 and the counting content of §2.5; Layer 5 except
the finite-test facts of §5.1 and the eventual-equality compatibility of §5.3; Layer 6 except the interval estimate of §6.1; and in Layer 7 the
comparison of §7.1, the measure-theoretic inputs of §7.2 other than Baire representatives, the
convolutions of §7.3 and §7.4, the Borel-content correspondence of §7.6, the compact groups of §7.8,
the reverse implication of §7.5 with its independence of the Haar measure, and the discrete case.
The remaining targets are those §§2.3, 2.5, 5.1, 5.3, 6.1 and 7.2 state as targets, the approximate
identity of §7.3, the forward implication of §7.5, the completion of §7.6 and the local conventions
of §7.7. The proof routes described above for results already in the library are proof sketches,
not separate targets.

**Owned elsewhere and consumed here.**

- Normalized Haar probability of a compact group, with its invariance: RepresentationTheory/CompactGroups
  §0.1, consumed through Tau Ceti's `TauCeti.haarProb` in §7.8.
- Følner filters, finitely additive contents, piecewise translations, Hall's theorem, Hahn–Banach
  separation, Haar measure and the modular character: Mathlib, as listed under the supplier
  contracts.

**Outside the roadmap.** Euclidean Banach–Tarski, Property (T), and constructions of nonamenable
groups without nonabelian free subgroups. The [amenability design discussion](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Amenability.20of.20actions.2Fgroups.html)
distinguishes topological-group amenability from several inequivalent notions of amenability of
actions; those notions are not treated here, and a content on all subsets characterizes only the
discrete specialization (§2.4). Peter–Weyl, unitary representation theory and the positive-definite
functions of [OneParameterSemigroups, Part C](../../Completed/OneParameterSemigroups/README.md#part-c--positive-definite-functions-and-bochners-theorem)
are related subjects, not inputs of this roadmap.

## Exact supplier contracts

### From Mathlib

- `BoundedContinuousFunction`, `Submodule`, `Subalgebra`, `ContinuousLinearMap`, `PositiveLinearMap`
  (`→ₚ[ℝ]`), `WeakDual` and `WeakDual.isCompact_closedBall` (Banach–Alaoglu): the function space,
  the means and their compactness (Layer 1). `IsTopologicalGroup.rightUniformSpace`: the uniformity
  of Convention 2.
- `MeasureTheory.AddContent`, with `MeasureTheory.addContent_biUnion`: finite additivity on a
  specified family of sets (Layer 2, §7.6). `MeasureTheory.Measure.count`.
- `IsFoelner`, `maxFoelner`, `isFoelner_iff_tendsto`, `IsFoelner.amenable` (an invariant
  `ℝ≥0∞`-valued set function from an ultrafilter limit of densities, which does not by itself give
  the definition of Layer 1), `amenable_of_maxFoelner_neBot`, `IsFoelner.comp_tendsto`,
  `IsFoelner.mono`, `IsAddFoelner` (Layers 5–6).
- `Equidecomp X G`, a partial equivalence with a finite set of acting elements, with its
  restriction, composition and inverse; `Finpartition` (Layer 3).
- `FreeGroup.toWord` and `FreeGroup.isReduced_toWord` (§3.5).
- `QuotientGroup.mk'`, `MonoidHom.rangeRestrict`, `GrpCat.FilteredColimits.colimitCoconeIsColimit`,
  `CategoryTheory.Limits.Types.jointly_surjective_of_isColimit`, `DirectLimit` (Layer 4).
- `lp`, `lp.single` and `geometric_hahn_banach_point_closed` (§5.2); `Finset.card_smul_finset`,
  `Finset.card_sdiff_comm` and `symmDiff_triangle` (§5.1).
- `Multiplicative`, `MonoidHom.noncommPiCoprod`, `zpowersHom`, `Finset.Icc` (Layer 6).
- `Finset.all_card_le_biUnion_card_iff_exists_injective`: Hall's theorem with arbitrary index type
  and finite neighbour sets (§8.2).
- `MeasureTheory.Measure.haar`, `MeasureTheory.Lp`, Bochner integration,
  `MeasureTheory.MemLp.exists_hasCompactSupport_eLpNorm_sub_le`,
  `MeasureTheory.setIntegral_eq_integral_of_ae_compl_eq_zero`, `MeasureTheory.NullMeasurableSet`,
  `IsSigmaCompact` (Layer 7).
- `MeasureTheory.Measure.modularCharacter`, the right-translation factor of Haar integrals, with
  `MeasureTheory.Measure.modularCharacterFun_pos`,
  `MeasureTheory.Measure.map_right_mul_eq_modularCharacterFun_smul` (for inner regular Haar
  measures) and `MeasureTheory.Measure.isMulLeftInvariant_eq_smul_of_regular` (§7.2).

### From Tau Ceti

Paths are under `TauCeti/`. Each declaration is assumed as stated there, with the hypotheses
recorded in the sections above.

- `Topology/Algebra/Group/UCB/Basic.lean`: `TauCeti.ucbSubalgebra`, `TauCeti.ucb`, `TauCeti.UCB`,
  `TauCeti.ucb_eq_ucbSubalgebra`, `TauCeti.mem_ucb_iff`, `TauCeti.mem_ucb_iff_tendsto`,
  `TauCeti.mem_ucb_iff_uniformContinuous`, `TauCeti.continuous_of_forall_eventually_dist_mul_lt`,
  `TauCeti.isClosed_ucb`, `TauCeti.const_mem_ucb`, `TauCeti.sup_mem_ucb`, `TauCeti.inf_mem_ucb`,
  `TauCeti.abs_mem_ucb`, `TauCeti.compLeftContinuousBounded_mem_ucbSubalgebra`, and the `TauCeti.UCB`
  lemmas `coe_sup`, `coe_inf`, `coe_abs`, `ext`, `le_def`, `abs_apply_le_norm`, `le_norm_smul_one`
  (§1.1).
- `Topology/Algebra/Group/UCB/Translation.lean`: `TauCeti.compContinuous_mulLeft_mem_ucb`,
  `TauCeti.compContinuous_mulRight_mem_ucb`, `TauCeti.UCB.leftTranslation`,
  `TauCeti.UCB.rightTranslation` and their lemmas cited in §1.2, including
  `TauCeti.UCB.continuous_leftTranslation_apply` and `TauCeti.UCB.sum_leftTranslation`.
  `Topology/Algebra/Group/UCB/Inversion.lean`: `TauCeti.RightUCB`, `TauCeti.UCB.invEquiv`,
  `TauCeti.UCB.invLinearIsometryEquiv` and the lemmas of §1.2.
  `Topology/Algebra/Group/UCB/CompRight.lean`: `TauCeti.compContinuous_mem_ucb`,
  `TauCeti.UCB.compRightAlgHom` and the lemmas of §1.5. `Topology/Algebra/Group/UCB/Complex.lean`:
  `TauCeti.ComplexUCB` and the lemmas of §1.6. `Topology/Algebra/Group/UCB/Discrete.lean`:
  `TauCeti.ucb_eq_top`, `TauCeti.UCB.discreteAlgEquiv`, `TauCeti.UCB.discreteLinearIsometryEquiv`,
  `TauCeti.UCB.compRightAlgHomOfDiscrete` (§2.1). `Topology/Algebra/Group/UCB/Prod.lean`: the slices
  and partial means behind `TauCeti.Mean.prod` (§4.4).
- `GroupTheory/Amenable/Mean.lean`: `TauCeti.Mean` and the lemmas of §1.3.
  `Analysis/Normed/Order/PositiveLinearMap.lean`: `PositiveLinearMap.abs_apply_le_mul_norm`,
  `PositiveLinearMap.continuous_of_forall_le_norm_smul`,
  `ContinuousLinearMap.opNorm_eq_apply_of_monotone` (§1.3).
- `GroupTheory/Amenable/Basic.lean`: `TauCeti.Mean.IsLeftInvariant`, `TauCeti.Amenable`,
  `TauCeti.amenable_iff`, `TauCeti.Mean.map`, `TauCeti.Amenable.of_surjective`,
  `TauCeti.Amenable.of_le`, `ContinuousMulEquiv.amenable_iff` (§§1.4–1.5).
  `GroupTheory/Amenable/WeakStar.lean`: `TauCeti.Mean.toWeakDual`, the compact space of means,
  `TauCeti.amenable_iff_forall_finset_exists`, `TauCeti.Mean.IsLeftInvariant.of_mapClusterPt`,
  `TauCeti.Amenable.of_tendsto` (§1.4). `GroupTheory/Amenable/Complex.lean`: `TauCeti.ComplexMean`,
  `TauCeti.Mean.complexMeanEquiv`, `TauCeti.amenable_iff_exists_complexMean` (§1.6).
- `GroupTheory/Amenable/Discrete.lean`: `TauCeti.Mean.boundedContinuousFunctionEquiv`,
  `TauCeti.Mean.mapOfDiscrete`, `TauCeti.amenable_iff_exists_boundedContinuousFunction_mean`,
  `TauCeti.Amenable.of_discrete` (§§2.1, 2.4). `MeasureTheory/Measure/AddContent.lean`: the content
  API of §2.2. `Topology/ContinuousMap/Bounded/AddContent.lean`:
  `PositiveLinearMap.addContentEquiv`, `LinearMap.toAddContent`,
  `BoundedContinuousFunction.indicator_compContinuous` (§2.3). `GroupTheory/Amenable/Content.lean`:
  `TauCeti.Mean.toContent`, `TauCeti.Mean.contentEquiv`,
  `TauCeti.amenable_iff_exists_invariantContent` (§§2.3–2.4). `GroupTheory/Amenable/Finite.lean`:
  `TauCeti.Mean.uniform`, `TauCeti.Mean.average`, `TauCeti.Amenable.of_finite` (§2.5).
- `Algebra/Group/Action/Equidecomp.lean`: `TauCeti.Equidecomposable`,
  `TauCeti.EquidecomposableLE`, `TauCeti.EquidecomposableLE.antisymm` and the lemmas of §3.2.
  `Algebra/Group/Action/Equipartition.lean`: `Equidecomp.Equipartition`,
  `Equidecomp.exists_iff_exists_finpartition` (§3.1). `Algebra/Group/Action/Paradoxical.lean`:
  `TauCeti.Paradoxical`, `TauCeti.paradoxical_iff_exists_subset` (§3.3).
  `MeasureTheory/Group/Paradoxical.lean`: `TauCeti.Equidecomposable.addContent_eq`,
  `TauCeti.not_paradoxical_univ_of_addContent` (§3.4). `GroupTheory/FreeGroup/StartsWith.lean` and
  `GroupTheory/FreeGroup/Paradoxical.lean`: `FreeGroup.startsWith`,
  `FreeGroup.isCompl_startsWith_of_smul`, `FreeGroup.paradoxical_univ` (§3.5).
  `GroupTheory/Amenable/FreeGroup.lean`: `TauCeti.not_amenable_freeGroup`,
  `TauCeti.not_amenable_of_injective_freeGroup` (§§3.5, 4.7).
- `GroupTheory/Amenable/Subgroup.lean`, `Extension.lean`, `Prod.lean`, `DirectedUnion.lean` and
  `Colimit.lean`: `TauCeti.Amenable.subgroup`, `TauCeti.Amenable.of_injective`,
  `TauCeti.Amenable.of_ker_le_range`, `TauCeti.amenable_iff_subgroup_quotient`,
  `TauCeti.UCB.fiberAverage`, `TauCeti.Mean.extension`, `TauCeti.Mean.prod`,
  `TauCeti.amenable_pi_iff`, `TauCeti.amenable_iSup_of_directed`,
  `TauCeti.Amenable.of_forall_finset_subset_range`, `TauCeti.Amenable.of_forall_fg`,
  `TauCeti.Amenable.of_isColimit_of_discreteTopology`,
  `TauCeti.Amenable.directLimit_of_discreteTopology` (Layer 4).
- `GroupTheory/Amenable/Foelner.lean`: `TauCeti.HasFoelnerSets`, `TauCeti.hasFoelnerSets_iff`,
  `MeasureTheory.Measure.count_smul_symmDiff_div_count_lt_ofReal_iff`,
  `TauCeti.exists_isFoelner_atTop`, `MulEquiv.hasFoelnerSets_iff`. `GroupTheory/Amenable/Reiter.lean`:
  `TauCeti.exists_finset_card_smul_symmDiff_lt_of_sum_tsum_lt`,
  `TauCeti.hasFoelnerSets_of_forall_exists_sum_tsum_abs_sub_lt`. `GroupTheory/Amenable/Average.lean`:
  `TauCeti.Mean.ofIsFoelner`, `TauCeti.Mean.abs_average_leftTranslation_sub_le`,
  `TauCeti.Amenable.of_hasFoelnerSets`. `MeasureTheory/Group/Foelner/AddContent.lean`:
  `IsFoelner.addContent`. `GroupTheory/Amenable/DiscreteFoelner.lean`:
  `TauCeti.Amenable.exists_sum_tsum_abs_sub_lt`, `TauCeti.amenable_iff_hasFoelnerSets`,
  `TauCeti.amenable_iff_exists_finset`. `GroupTheory/Amenable/Sequence.lean`:
  `TauCeti.hasFoelnerSets_iff_exists_seq` (Layer 5).
- `MeasureTheory/Group/Foelner/Int.lean`: `Int.tendsto_card_image_add_left_Icc_symmDiff_div_card`,
  `TauCeti.isAddFoelner_int_Icc`. `GroupTheory/Amenable/Int.lean`:
  `TauCeti.hasFoelnerSets_multiplicative_int`, `TauCeti.Amenable.multiplicative_int`.
  `GroupTheory/Amenable/Abelian.lean`: `TauCeti.Amenable.of_commGroup` (Layer 6).
- `MeasureTheory/Function/Lp/One.lean`, `LeftTranslation.lean`, `RightTranslation.lean`,
  `BoundedContinuous.lean`, `GroupConvolution.lean`, `Indicator.lean`, `AddContent.lean`,
  `AbsolutelyContinuous.lean` and `Restriction.lean`: `TauCeti.linftyOne`,
  `PositiveLinearMap.continuous_lpTop`, `MeasureTheory.Lp.leftTranslation`,
  `MeasureTheory.Lp.rightTranslation`, `BoundedContinuousFunction.toLpTop`,
  `MeasureTheory.Lp.convolutionL`, `TauCeti.linftyIndicator`,
  `PositiveLinearMap.addContentLpTopEquiv`, `MeasureTheory.Lp.integralPositiveLinearMap` and the
  lemmas of §§7.1, 7.3 and 7.6. `MeasureTheory/Function/StronglyMeasurable/SigmaCompact.lean`,
  `Topology/Algebra/Group/OpenSubgroup/SigmaCompact.lean` and
  `MeasureTheory/Group/SigmaCompactSupport.lean`:
  `MeasureTheory.exists_isSigmaCompact_forall_ae_eq_zero`, `IsSigmaCompact.exists_openSubgroup`,
  `MeasureTheory.exists_openSubgroup_isSigmaCompact_forall_ae_eq_zero` (§7.2).
  `MeasureTheory/Group/ModularCharacter.lean`: `TauCeti.continuous_modularCharacter`,
  `TauCeti.integral_mul_right_eq_modularCharacter_smul_of_regular` and the regular-measure lemmas of
  §7.2 in `MeasureTheory.Measure`. `MeasureTheory/Group/Convolution/UCB.lean`:
  `MeasureTheory.Lp.convolutionUCB` and its lemmas (§7.4). `GroupTheory/Amenable/OrbitIntegral.lean`
  and `Convolution.lean`: `TauCeti.UCB.integrable_smul_leftTranslation`,
  `TauCeti.Mean.IsLeftInvariant.apply_integral_smul_leftTranslation`,
  `MeasureTheory.Lp.convolutionUCB_toLpTop` and the invariant-mean identities of §7.5.
  `GroupTheory/Amenable/Linfty.lean`: `TauCeti.Mean.ofLpTop`, `TauCeti.Amenable.of_lpTop`,
  `TauCeti.Amenable.of_addContent`, `TauCeti.amenable_iff_exists_lpTop_invariant`,
  `TauCeti.exists_lpTop_invariant_iff_of_regular`, `TauCeti.Mean.integral`,
  `TauCeti.Amenable.of_compactSpace`, `TauCeti.Mean.integral_haarProb` (§§7.1, 7.5, 7.8).
  `RepresentationTheory/Compact/Haar.lean`: `TauCeti.haarProb`, `TauCeti.haarProb_def` (§7.8).
- `Combinatorics/Additive/Expansion.lean`: `Finset.pow_mul_card_le_card_pow_smul`,
  `Finset.exists_injective_of_mul_card_le_card_smul`. `GroupTheory/Amenable/Expansion.lean`:
  `TauCeti.exists_mul_card_le_card_smul_of_not_hasFoelnerSets`,
  `TauCeti.exists_injective_mul_of_not_amenable`. `GroupTheory/Amenable/Tarski.lean`:
  `TauCeti.amenable_iff_not_paradoxical_univ`, `TauCeti.hasFoelnerSets_iff_not_paradoxical_univ`
  (Layer 8).

## References

- Alejandra Garrido, [*An introduction to amenable groups*](https://www.math.uni-duesseldorf.de/~garrido/amenable.pdf),
  especially §§1–3. Its formulations are applied with the explicit discrete and null-set
  qualifications of this roadmap.
- Bachir Bekka, Pierre de la Harpe and Alain Valette,
  [*Kazhdan's Property (T)*](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf),
  Cambridge University Press, 2008, Appendix G; also Appendix A.3 for uniformity and Haar
  conventions and Section C.5 for `L∞`. Definition and theorem numbers refer to the linked
  manuscript; its page numbers differ from the published edition.
- Tullio Ceccherini-Silberstein, Rostislav Grigorchuk and Pierre de la Harpe,
  [*Amenability and paradoxical decompositions for pseudogroups and for discrete metric spaces*](https://people.tamu.edu/~grigorch/publications/zCGH.pdf),
  Proceedings of the Steklov Institute of Mathematics **224** (1999), 57–97, especially Theorems 7,
  25 and 35.
- D. H. Fremlin, *Measure Theory*, Volume 4, [Chapter 44, *Topological groups*](https://www1.essex.ac.uk/maths/people/fremlin/chap44.pdf),
  §443M.
- The [amenability design discussion](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Amenability.20of.20actions.2Fgroups.html)
  on the Lean Zulip.
- Earlier formalizations: the [Lean 3 invariant-mean development for mathlib](https://github.com/leanprover-community/mathlib3/pull/16574),
  its Lean 4 successor [*Amenable monoid actions*](https://github.com/leanprover-community/mathlib4/pull/7395),
  which defines amenability of a monoid action through finitely additive invariant set functions on
  measurable sets rather than through functional means on a group, and the associated
  [Amenable Groups discussion](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Amenable.20Groups.html).
  Both pull requests are by the same author; reuse of their code requires the author's agreement,
  or a licence permitting it and a plan discussed on the Lean Zulip.
- The [Mathlib pull request defining `Equidecomp.Equipartition`](https://github.com/leanprover-community/mathlib4/pull/30330),
  whose names and shapes the equipartitions of §3.1 follow.
