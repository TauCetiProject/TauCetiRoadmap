# Roadmap: holonomy groupoids and C*-algebras of foliations

**Summary.** Build the holonomy groupoid of a foliation and Connes's C*-algebra of its leaf space,
on Tau Ceti's foliation carrier `TauCeti.Foliation`, the flat charts and leaves of
DifferentialGeometry Layer 4, the Lie groupoids, bibundles and source-simply-connected integrations
of LieGroupoidsPoisson, the groupoid C*-algebras of OperatorAlgebraDynamics and the Hilbert
modules of HilbertModules. Layer Fo1 defines the holonomy germ of a leafwise path between two
transversals by sliding the path along the leaves, proves that it depends only on the leafwise
homotopy class, and builds holonomy groups and the holonomy pseudogroup of a transversal. Layer
Fo2 makes the holonomy classes of leafwise paths a Lie groupoid `Hol(M,F)` of dimension
`dim M + p`, `p` the leaf dimension, whose arrow manifold is second countable and in general not
Hausdorff, and proves Winkelnkemper's Hausdorff criterion. Layer Fo3 characterizes foliation
groupoids (Crainic–Moerdijk), reduces them to étale groupoids on complete transversals, and places
every source-connected integration of a foliation between the monodromy and the holonomy groupoid.
Layer Fo4 constructs Connes's half-density convolution algebra of a Lie groupoid whose arrow
manifold need not be Hausdorff, its regular representations and the reduced C*-algebra
`C*_r(V,F)`, and identifies it with OperatorAlgebraDynamics D5 when the arrows are Hausdorff.
Layer Fo5 proves the Hilsum–Skandalis theorems: a complete transversal `T` makes `C*_r(V,F)`
Morita equivalent to the étale algebra `C*_r(Hol_T^T)`, and for `p ≥ 1` it gives
`C*_r(V,F) ≅ K ⊗ C*_r(Hol_T^T)`. Layer Fo6 works out simple foliations, the linear foliations of
the torus (whose transversal algebras are the rotation algebras `A_θ'` for `θ'` in the `PSL(2,ℤ)`
orbit of `θ`), suspensions with their Hausdorff suspension groupoids, and a suspension with
one-sided holonomy whose holonomy groupoid is not Hausdorff. Layer Fo7 turns a holonomy-invariant
transverse measure into a lower semicontinuous densely defined trace on `C*_r(V,F)`, induced from
the trace of the measure on the étale reduction. [Suggested.lean](Suggested.lean) states the Fo1
holonomy headlines that are statable at the pinned libraries, proves the quasi-analyticity of
analytic holonomy behind Fo2.3, and ends with sanity checks of the flat shift and of slidings; its
docstring records which carriers the remaining statements lack.

## How to read the build

Fo1 is local differential topology on one foliation: flat charts, plaque chains and germs of
maps between transversals; no groupoid appears. Fo2 assembles the germs into the holonomy
groupoid and gives it the structure of LieGroupoidsPoisson §G0.2. Fo3 is the Lie-groupoid theory
of foliations and the bridge to étale groupoids, through LieGroupoidsPoisson §G3.4–§G3.5 and
§G5.4. Fo4 is analysis on a single Lie groupoid: half densities, convolution and the regular
representations; it uses Fo2 only to define `C*_r(V,F)` and in its examples. Fo5 combines the
transversals of Fo3 with the algebras of Fo4 and with HilbertModules H3–H4. Fo6 applies Fo1–Fo5 to
four families of foliations. Fo7 needs Fo3.2, Fo5.1 and the traces of TracesOnCStarAlgebras Tr1.
Each layer ends with its examples and its dependencies.

## Conventions

- **Manifolds.** `M` is a real smooth manifold of dimension `n`, Hausdorff, second countable and
  without boundary, modelled on `𝓘(ℝ, E)` with `E` finite-dimensional, as in DifferentialGeometry
  Layer 4. Smooth means `C^∞`.
- **Foliations.** A foliation is `F : TauCeti.Foliation 𝓘(ℝ, E) ∞ M p`, the smooth involutive
  distribution of rank `p` (Tau Ceti's rank `k` is the leaf dimension `p` here); its codimension is
  `q = n − p`. Leaves are Tau Ceti's `TauCeti.Foliation.leaf` with the manifold structure of
  DifferentialGeometry 4.4. Witness: the lines of slope `θ` in `ℝ²` are
  `TauCeti.Foliation.ofSubmodule (ℝ ∙ (1, θ))`, whose leaf through `x` is `x + ℝ(1, θ)`
  (`TauCeti.Foliation.leaf_ofSubmodule`), with `p = q = 1`.
- **Leafwise paths.** A leafwise path is a curve `γ : ℝ → M` that is `C¹` on `[0,1]` with
  `curveVelocityWithin 𝓘(ℝ, E) γ (Icc 0 1) t ∈ F.distribution (γ t)` (`IsLeafwisePath`), a curve
  of `TauCeti.Foliation.JoinedByTangentCurve`. The concatenation `γ₂·γ₁` runs through `γ₁` first,
  after both are reparametrized by a smooth map of `[0,1]` with vanishing derivative at the ends,
  so that it is again `C¹` and tangent; a chain of tangent curves, as in
  `TauCeti.Foliation.SameLeaf`, is thus one leafwise path. A leafwise homotopy is a homotopy with
  fixed ends through leafwise paths, continuous into `M`.
- **Transversals.** A transversal is a smooth embedding `ι : N → M` (Mathlib's
  `Manifold.IsSmoothEmbedding`) of a manifold of dimension `q` with
  `T_{ι z}M = range(dι_z) ⊕ F_{ι z}` for every `z` (`IsTransversal`), identified with its image
  `T`; it need not be compact or closed, and it is complete if it meets every leaf. Witness: for
  the horizontal lines of `ℝ²` the vertical axis is a complete transversal, the segment
  `{0} × (0,1)` is a transversal that is not complete, and the unit circle is not a transversal,
  since it is tangent to the leaves at `(0, ±1)`.
- **Arrows.** Groupoids follow LieGroupoidsPoisson: an arrow `g : x → y` has `s(g) = x`,
  `t(g) = y`, `gh` means "first `h`, then `g`" and is Mathlib's `h ≫ g`. The holonomy class of a
  leafwise path from `x` to `y` is an arrow `x → y`, and `[γ₂][γ₁] = [γ₂·γ₁]`. Holonomy germs
  compose covariantly: `hol(γ₂·γ₁) = hol(γ₂) ∘ hol(γ₁)` (Fo1.2). Witness: for a suspension (Fo6.3)
  over the punctured torus whose two generators act on `ℝ` by `u ↦ 2u` and `u ↦ u + u³`, the two
  composites of the holonomy germs at `0` are `u ↦ 2u + 8u³` and `u ↦ 2u + 2u³`, so the order of
  composition is visible in the germs.
- **Half densities.** For a real vector space `V` of dimension `k`, `|Λ|^{1/2}(V)` is the line of
  maps `ρ : Λ^k V → ℂ` with `ρ(λv) = |λ|^{1/2} ρ(v)` (Connes 1982, p. 17). For a Lie groupoid with
  Lie algebroid `A`, `Ω^{1/2}_g = |Λ|^{1/2}(A_{t(g)}) ⊗ |Λ|^{1/2}(A_{s(g)})` (Crainic–Moerdijk,
  p. 4); for `Hol(M,F)`, `A = TF` and these are leafwise half densities. The product of the two
  factors at a common point is a density, integrated over a range fibre `t⁻¹(y)` after identifying
  `T_γ t⁻¹(y)` with `A_{s(γ)}` by left translation.
- **Convolution.** `(f * g)(γ) = ∫_{γ₁γ₂ = γ} f(γ₁) g(γ₂)` and `f*(γ) = conj(f(γ⁻¹))`, as in
  Connes (1982, p. 17; 1994, p. 124) and Kordyukov (p. 26). Witness that the conjugate is needed:
  on the groupoid with one arrow, the element `f = i` would otherwise satisfy `f* * f = −1`, which
  no *-representation sends to a positive operator.
- **C*-algebras.** Haar systems, the I-norm, the full and reduced norms and the regular
  representations are those of OperatorAlgebraDynamics D5: Haar measures live on the range fibres
  `G^u = t⁻¹(u)`, regular representations act on `L²(G_u)` of the source fibres `G_u = s⁻¹(u)`.
  `C*_r(V,F)` is Connes's `C*(V,F)` (Connes 1982, Definition, p. 17; Connes 1994, Chapter II,
  §8.α, Definition 1, p. 124), the reduced algebra; the full algebra `C*(V,F)` is defined here only
  when `Hol(M,F)` is Hausdorff (Fo4.3).
- **Pseudogroups and germs.** A pseudogroup on `T` is a Mathlib `StructureGroupoid T`; germs are
  Mathlib's `Filter.Germ (𝓝 x)`. A pseudogroup is quasi-analytic at `x` if each member that is the
  identity on an open subset `U` of its source with `x` in the closure of `U` is the identity near
  `x` (`IsQuasiAnalyticAt`). Witness: the flat shift `u ↦ u + exp(−1/u)` (`u > 0`), `u ↦ u`
  (`u ≤ 0`), of Fo2.3 is the identity on `(−1, 0)` but not near `0`.
- **Measures and traces.** Measures on transversals are Radon measures in Mathlib's sense. A trace
  is a trace of TracesOnCStarAlgebras Tr1.1, a map into `[0,∞]` additive and positively homogeneous
  on the positive cone with `τ(x*x) = τ(xx*)`; lower semicontinuity and density are those of
  TracesOnCStarAlgebras Tr1.2.

## Layer Fo1: holonomy

### 1.1 Foliation charts, plaques and transversals (Fo1.1)

A foliation chart is a chart `(U, φ)` of the maximal atlas of `M` with `φ(U) = B^p × B^q`, a
product of open balls, carrying `F` to `ℝ^p × 0`; such charts exist through every point
(DifferentialGeometry 4.3, `Distribution.exists_flatChart`), also adapted to a given transversal
`T`, with `T ∩ U = φ⁻¹(0 × B^q)` (the transverse-submanifold clause of DifferentialGeometry 4.3).
Its plaques are the sets `φ⁻¹(B^p × {v})` and its transverse projection is `π = pr₂ ∘ φ`. Prove:

- every plaque lies in one leaf, and a leafwise path that stays in `U` stays in one plaque, since
  `π ∘ γ` has derivative `dπ(γ') = 0` (the plaque argument of DifferentialGeometry 4.4);
- there is a countable locally finite atlas of foliation charts `(U_i, φ_i)`, each the restriction
  of a foliation chart defined on a neighbourhood of the closure of `U_i`, in which each plaque of
  `U_i` meets at most one plaque of `U_j` (a good cover: Kordyukov, Definitions 2.19–2.20 and the
  statement following them, p. 11), by shrinking flat charts transversally;
- there is a locally finite family of foliation charts `U_i` with transversals `T_i ⊂ U_i` whose
  closures are pairwise disjoint, every leaf meeting some `T_i` (Hilsum–Skandalis, Lemme 2,
  p. 202); in particular `T = ⋃ T_i` is a complete transversal, and on a compact `M` the family is
  finite and each `T_i` is relatively compact in a larger transversal.

**Checks.**

- *Global chart.* For the lines of slope `θ` in `ℝ²`, `φ(x, y) = (x, y − θx)` is a foliation chart
  on all of `ℝ²`; its plaques are the whole leaves and `π(x, y) = y − θx`.
- *Why shrink.* On the torus `ℝ²/ℤ²` with irrational slope, a long thin strip along a leaf and a
  second strip crossing it twice intersect in two components, so a plaque of the first meets two
  plaques of the second; the good-cover clause excludes such pairs, and without it the plaque
  chains of Fo1.2 are not single-valued.
- *Transversality is pointwise.* For the horizontal lines of `ℝ²`, the unit circle is transverse
  except at `(0, ±1)`, where its tangent line is the leaf direction; it is not a transversal.

*Needs:* DifferentialGeometry 4.3 (flat charts, transverse-submanifold charts), 4.4 (leaves, the
plaque argument); Tau Ceti `TauCeti.Foliation`, `TauCeti.Foliation.JoinedByTangentCurve`,
`TauCeti.Foliation.leaf`.

### 1.2 Holonomy germs of leafwise paths (Fo1.2)

Let `γ` be a leafwise path from `x` to `y`, and `T₀ ∋ x`, `T₁ ∋ y` transversals. A sliding of `γ`
from `T₀` to `T₁` is an open neighbourhood `U` of `x` in `T₀` with a continuous
`Γ : U × [0,1] → M` such that `Γ(x, ·) = γ` and each `Γ(z, ·)` is a leafwise path from `z` to a
point `h(z)` of `T₁` (`IsSliding`). Prove:

- existence: `γ` has a sliding, and its endpoint map `h` is smooth (`exists_isSliding`); route:
  cover `γ` by a chain of foliation charts `U_1, …, U_k` in which each plaque of `U_i` meets
  exactly one plaque of `U_{i+1}` (Kordyukov, p. 8), and slide inside each chart along plaques in
  flat coordinates;
- uniqueness: the endpoint maps of two slidings have the same germ at `x`
  (`germ_eq_of_isSliding`); route: for `z` near `x` both paths stay in the chain chart by chart, by
  compactness of `[0,1]`, hence in the same plaques, and `T₁` meets the last plaque once. This
  germ is the holonomy germ `hol_{T₁T₀}(γ)` (Connes 1994, Chapter II, §8.α, p. 123);
- leafwise homotopy invariance: leafwise homotopic paths have the same holonomy germ
  (`germ_eq_of_homotopy`; Kordyukov, p. 8), by local constancy of the germ along the homotopy;
- functoriality: `hol(γ₂·γ₁) = hol(γ₂) ∘ hol(γ₁)`, `hol(γ⁻¹) = hol(γ)⁻¹`, and the constant path
  has the identity germ, so every holonomy germ is the germ of a diffeomorphism between
  neighbourhoods of `x` in `T₀` and of `y` in `T₁`;
- change of transversal: for transversals `T₀, T₀'` through `x`, the holonomy of the constant path
  is the germ of the plaque projection `T₀ → T₀'`, and holonomy germs between different
  transversals are conjugate by plaque projections.

**Checks.**

- *A computed germ.* For the lines of slope `θ` in `ℝ²`, the leaf segment `t ↦ (t, v₀ + θt)` from
  the axis `{0} × ℝ` to the line `{1} × ℝ` has the sliding `Γ(v, t) = (t, v + θt)` and holonomy
  `v ↦ v + θ` (`isSliding_slope`); the candidate "nearest point of `T₁`", `v ↦ v`, is not on the
  leaf.
- *Germs see more than ends.* In the suspension of `u ↦ 2u` over the circle (Fo6.3), the loop
  around the compact leaf `u = 0` and the constant loop have the same ends; their germs at `0` are
  `u ↦ 2^{±1}u` (the sign depending on the orientation of the loop) and the identity.
- *Uniqueness needs the transversal.* If `T₁` were replaced by a curve tangent to the leaves at
  `y`, two slidings could end at different points of the same plaque, and the endpoint germ would
  not be defined.

*Needs:* Fo1.1; DifferentialGeometry 4.4 (leaves with their topology, for homotopies in a leaf);
Mathlib `Filter.Germ`, `Manifold.IsSmoothEmbedding`.

### 1.3 Holonomy groups and the holonomy pseudogroup (Fo1.3)

For a leaf `L`, `x ∈ L` and a transversal `T ∋ x`, the holonomy germs of loops define a functor
from the fundamental groupoid of `L` (Mathlib's `FundamentalGroupoid`, on the leaf topology) to
germs of diffeomorphisms of transversals, and in particular a homomorphism
`H_T : π₁(L, x) → Diff_x(T)` into the germs at `x` of local diffeomorphisms fixing `x`; its image is
the holonomy group of `L` at `x` (Kordyukov, p. 9). Prove that it is independent of `T` up to
conjugation by a plaque projection and of `x ∈ L` up to conjugation by a path, and construct the
holonomy covering `L̃ → L` of `ker H_T` (Connes 1994, Chapter II, §8.α, p. 123).

The holonomy pseudogroup `Γ_T` of a transversal `T` consists of the local diffeomorphisms of `T`
whose germ at every point of the source is a holonomy germ (Kordyukov, Definition 2.18, p. 10;
`holonomyMembers`). Prove that it is a Mathlib `StructureGroupoid T`
(`exists_structureGroupoid_holonomyMembers`): closure under composition, inverse and restriction
is functoriality of Fo1.2, locality is built into the germ condition. For the transversal of a good
cover, `T = ⋃ T_i` with `T_i = φ_i⁻¹(0 × B^q)`, prove that `Γ_T` is generated by the transition maps
`f_ij : T_ij → T_ji` that send `y` to the point whose plaque meets the plaque of `y` (Kordyukov,
p. 11): every member is, near each point, a finite composite of maps `f_ij`. There are countably
many such composites, which Fo2.2 uses.

**Checks.**

- *Torus.* For irrational `θ`, the circle `{0} × ℝ/ℤ` in `ℝ²/ℤ²` is a complete transversal whose
  holonomy pseudogroup is generated by the rotation `v ↦ v + θ` restricted to small arcs; it has
  no fixed points, and every holonomy group is trivial.
- *A compact leaf with holonomy.* In the suspension of `u ↦ 2u` the transversal `ℝ` has holonomy
  pseudogroup generated by `u ↦ 2u`; the holonomy group of the compact leaf at `0` is `ℤ`, and that
  of every other leaf is trivial.
- *Reeb.* The compact torus leaf of the Reeb foliation of `S³` (GeometricTopology 10.1) has
  holonomy group `ℤ²` (Kordyukov, Example 2.14, p. 10). The meridian of either Reeb component
  pushes into the nearby plane leaves of that component as a closed curve, so each generator is
  the identity germ on one side of the torus and a contraction on the other; this one-sided
  holonomy is what makes the holonomy groupoid non-Hausdorff (Fo2.3; Connes 1982, §6, p. 18).

*Needs:* Fo1.2; DifferentialGeometry 4.4; Mathlib `StructureGroupoid`, `OpenPartialHomeomorph`,
`FundamentalGroupoid`.

### Examples

Linear foliations of `ℝ²` and of the torus; the suspension of `u ↦ 2u` with its compact leaf; the
Reeb foliation of `S³`.

### Dependencies

DifferentialGeometry 4.3–4.4; Tau Ceti `TauCeti.Foliation` with its leaves and tangent curves;
GeometricTopology 10.1 for the Reeb foliation; Mathlib germs, structure groupoids and fundamental
groupoids.

## Layer Fo2: the holonomy groupoid

### 2.1 Holonomy classes (Fo2.1)

Call two leafwise paths `γ, γ'` from `x` to `y` holonomy-equivalent when `hol(γ'⁻¹·γ)` is the
identity germ at `x`; by Fo1.2 this does not depend on the transversals. The holonomy groupoid
`Hol(M,F)` has objects `M` and arrows `x → y` the holonomy classes of leafwise paths from `x` to
`y`, with concatenation as composition (Connes 1982, p. 16; Connes 1994, Chapter II, §8.α, p. 123;
Kordyukov, p. 23); it is a Mathlib `CategoryTheory.Groupoid` in the conventions of
LieGroupoidsPoisson. Prove:

- the isotropy group at `x` is the holonomy group of the leaf at `x`, with the law `gh = h ≫ g`
  of LieGroupoidsPoisson §G0.4;
- `t` restricted to the source fibre `s⁻¹(x)` is a bijection onto the holonomy covering of the
  leaf through `x`, and `(s, t)` has image the leaf relation `{(x, y) : SameLeaf x y}`;
- the holonomy classes of the paths in one leaf form the quotient of its fundamental groupoid by
  the kernel of the holonomy functor of Fo1.3.

**Checks.**

- *Trivial holonomy.* If every leaf has trivial holonomy, an arrow is determined by its ends and
  `Hol(M,F)` is the leaf relation itself (Connes 1982, p. 16).
- *Holonomy is not homotopy.* For the horizontal planes in `ℝ³ ∖ {0}`, the loop around the origin
  in the punctured plane `z = 0` is not null-homotopic in its leaf but has trivial holonomy, since
  `z` is a global transverse coordinate; its holonomy class is a unit.

*Needs:* Fo1.2–Fo1.3; Mathlib `CategoryTheory.Groupoid`, `FundamentalGroupoid`.

### 2.2 The manifold of holonomy classes (Fo2.2)

Foliation charts `(U, φ)`, `(U', φ')` are compatible if any `m ∈ U` and `m' ∈ U'` with
`π(m) = π'(m')` are joined by a leafwise path whose holonomy carries the germ of `π` at `m` to that
of `π'` at `m'`. For compatible charts let `W(φ, φ')` be the set of the arrows `γ` with
`s(γ) ∈ U`, `t(γ) ∈ U'`, `π(s(γ)) = π'(t(γ))` and this property, with coordinates
`(pr₁φ(s(γ)), pr₁φ'(t(γ)), π(s(γ))) ∈ B^p × B^p × B^q` (Kordyukov, p. 23, (3.1); Connes 1982, §6,
p. 18). Every arrow `γ : x → y` lies in such a domain:
take a foliation chart at `x` and, at `y`, one whose transverse coordinate is transported by
`hol(γ)` (the adapted charts of Fo1.1). Prove:

- the chart changes are smooth, and the charts form a smooth atlas of dimension `2p + q = n + p`
  on the arrows (Connes 1994, Chapter II, §8.α, p. 123); each chart domain is Hausdorff, so the
  arrow manifold is locally Hausdorff;
- the arrow manifold is second countable: for a countable good cover (Fo1.1) the domains indexed
  by pairs of charts and by the countably many composites of the maps `f_ij` (Fo1.3) cover it;
- `s` and `t` are smooth submersions, units are a smooth embedding, inversion is a diffeomorphism
  and composition is smooth on the composable pairs; every source fibre is the holonomy covering
  of a leaf with its manifold structure, hence Hausdorff. Thus `Hol(M,F)` is a Lie groupoid in
  the sense of LieGroupoidsPoisson §G0.2;
- the isotropy Lie groups (LieGroupoidsPoisson §G0.4) are the holonomy groups, of dimension `0`;
  the Lie algebroid (LieGroupoidsPoisson §G2.1) is `TF` with the inclusion as anchor;
- `(s, t) : Hol(M,F) → M × M` is an immersion onto the leaf relation, in general neither an
  embedding nor proper (Connes 1994, Chapter II, §8.α, p. 123).

**Checks.**

- *Dimension.* For the linear foliation of the torus, `Hol = T² × ℝ` (Fo6.2) has dimension
  `3 = 2 + 1`; for the foliation by points (`p = 0`) `Hol` is the unit groupoid of dimension `n`;
  for the foliation of a connected `M` by itself (`p = n`) it is the pair groupoid, of dimension
  `2n`.
- *Not the subspace topology.* For the linear foliation of the torus with irrational slope, the
  arrows `((x, y), t_k)` with `t_k → ∞` and `(t_k, θt_k) → 0` in `ℝ²/ℤ²` converge to the unit at
  `(x, y)` in `T² × T²` and to nothing in `Hol`; `(s, t)` is not an embedding.

*Needs:* Fo1.1–Fo1.3, Fo2.1; LieGroupoidsPoisson §G0.0, §G0.2, §G0.4, §G2.1.

### 2.3 Hausdorffness (Fo2.3)

Prove Winkelnkemper's criterion (as stated by Kordyukov, p. 24): `Hol(M,F)` is Hausdorff if and
only if, for one (equivalently every) complete transversal `T`, the holonomy pseudogroup `Γ_T` is
quasi-analytic at every point. Route: two arrows `x → y` that cannot be separated have chart
domains meeting in arrows over an open set of transversal points accumulating at `x`, on which
their holonomy maps agree; conversely a member that is the identity on an open set accumulating at
`x` but not near `x` gives units converging to both a unit and a nonunit arrow at `x`. Deduce:

- trivial holonomy gives a Hausdorff `Hol(M,F)`, and then `(s, t)` is injective;
- a holonomy pseudogroup of real-analytic maps is quasi-analytic
  (`isQuasiAnalyticAt_of_analyticOnNhd`, from Mathlib's identity theorem
  `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`), so `Hol(M,F)` is Hausdorff (Connes 1982,
  §6, p. 18; Kordyukov, p. 24);
- one-sided flat holonomy makes `Hol(M,F)` non-Hausdorff: the flat shift `flatShift`, equal to
  `u ↦ u` for `u ≤ 0` and to `u ↦ u + exp(−1/u)` for `u > 0`, is a smooth diffeomorphism of `ℝ`
  (`contDiff_flatShift`, `strictMono_flatShift`, `surjective_flatShift`) whose germ is the identity
  at every `u < 0` (`germ_flatShift_eq_id_of_neg`) and not at `0` (`germ_flatShift_ne_id`); its
  suspension (Fo6.4) has a non-Hausdorff holonomy groupoid, as has the Reeb foliation of `S³`
  (Connes 1982, §6, p. 18).

**Checks.**

- *Quasi-analytic is the right condition.* The flat shift is the identity on `(−1, 0)`, an open
  set with `0` in its closure, and differs from the identity on every neighbourhood of `0`; its
  germs at the points `u < 0` are units of the germ groupoid that converge to two different
  arrows at `0`.
- *Analytic generators.* For the suspension of `u ↦ 2u`, the generator is linear, the pseudogroup
  is quasi-analytic, and `Hol` is Hausdorff even though the compact leaf has holonomy `ℤ`.
- *Simple foliations.* For the planes `z = c` in `ℝ³ ∖ {0}`, `Hol` is the closed submanifold
  `{(x, y) : z(x) = z(y)}` of `M × M`, Hausdorff.

*Needs:* Fo1.3, Fo2.2; Mathlib `AnalyticOnNhd`, `expNegInvGlue`.

### Examples

The linear foliation of the torus (`T² × ℝ`); the suspensions of `u ↦ 2u` (Hausdorff, with
holonomy) and of the flat shift (not Hausdorff); the horizontal planes in `ℝ³ ∖ {0}`.

### Dependencies

Fo1; LieGroupoidsPoisson §G0.0, §G0.2, §G0.4, §G2.1; Mathlib groupoids and the analytic identity
theorem.

## Layer Fo3: foliation groupoids and transversals

### 3.1 Foliation groupoids (Fo3.1)

For a Lie groupoid `G` (LieGroupoidsPoisson §G0.2), prove that the following are equivalent
(Crainic–Moerdijk, Theorem 1, p. 5, proved on pp. 8–9): `G` is Morita equivalent
(LieGroupoidsPoisson §G3.5) to an étale Lie groupoid; the anchor of its Lie algebroid is injective;
every isotropy Lie group (LieGroupoidsPoisson §G0.4) is discrete. Such `G` is a foliation groupoid.
Prove further:

- the image of the anchor of a foliation groupoid is an involutive subbundle, a
  `TauCeti.Foliation` `F_G` of `G₀`, and `G` integrates `F_G`;
- `t` maps the leaves of the foliation of `G₁` by the components of the source fibres locally
  diffeomorphically onto leaves of `F_G`, and for source-connected `G` the map `t : s⁻¹(x) → L_x`
  is a covering with structure group the isotropy group (Crainic–Moerdijk, Lemma 1, p. 8);
- for a submersion `π : U → T` whose fibres are the contractible plaques of `F_G` in `U`, the
  source-connected component of the restriction of `G` to `U` is isomorphic to `U ×_T U`
  (Crainic–Moerdijk, Lemma 3, p. 9);
- `Hol(M,F)` is a source-connected foliation groupoid with `F_Hol = F`.

**Checks.**

- *Locally free actions.* The action groupoid (LieGroupoidsPoisson §G0.3) of the linear flow on
  the torus is a foliation groupoid; that of `SO(2)` acting on `ℝ²` is not, its isotropy at `0`
  being `SO(2)` and its anchor vanishing on `𝔰𝔬(2)` at `0`.
- *Pair groupoid.* The pair groupoid of `M` has trivial isotropy and anchor the identity of `TM`,
  and it is Morita equivalent to a point (LieGroupoidsPoisson §G3.5).
- *Lie groups.* A Lie group of positive dimension over a point has non-discrete isotropy and
  anchor `𝔤 → 0`, so it is not Morita equivalent to an étale groupoid.

*Needs:* Fo2.2; LieGroupoidsPoisson §G0.2–§G0.4, §G2.1, §G3.5.

### 3.2 Reduction to a transversal (Fo3.2)

For a foliation groupoid `G` and a transversal `T` of `F_G`, the restriction
`G_T^T = s⁻¹(T) ∩ t⁻¹(T)` is an étale Lie groupoid (Crainic–Moerdijk, Lemma 2, p. 9; the
restriction of LieGroupoidsPoisson §G3.4, since `T` is transverse to the anchor). Prove:

- every arrow `g` of `G_T^T` defines the germ `σ_g` of a local diffeomorphism of `T`, through a
  local section of `s` (Crainic–Moerdijk, p. 4), and `g ↦ σ_g` is a functor into germs;
- for complete `T`, the manifold `G_T = s⁻¹(T)`, with `G` acting by composition at the target and
  `G_T^T` at the source and with anchors `t` and `s`, is a biprincipal bibundle in the sense of
  LieGroupoidsPoisson §G3.5, so `G` is Morita equivalent to `G_T^T` (Crainic–Moerdijk, Lemma 2,
  p. 9, and p. 3); two complete transversals give Morita equivalent étale groupoids;
- for `G = Hol(M,F)`, `g ↦ σ_g` identifies `Hol_T^T` with the groupoid of germs of the holonomy
  pseudogroup `Γ_T` with its étale topology (Crainic–Moerdijk, p. 10); `Hol_T^T` is Hausdorff
  when `Hol(M,F)` is, and for complete `T` the converse holds (both are then quasi-analyticity of
  `Γ_T`, Fo2.3).

**Checks.**

- *Torus.* For the circle `{0} × ℝ/ℤ`, `Hol_T^T ≅ ℤ ⋉ ℝ/ℤ` with `n` acting by the rotation
  `u ↦ u + nθ` (Connes 1994, Chapter II, §8.β, p. 127).
- *Completeness is needed.* For the lines `ℝ × {y}` of the cylinder `ℝ × ℝ/ℤ` and the transversal
  `T = {0} × (0, 1/2)`, the orbit space of `Hol_T^T` is the interval `(0, 1/2)` while that of `Hol`
  is the circle `ℝ/ℤ`; Morita equivalent groupoids have homeomorphic orbit spaces
  (LieGroupoidsPoisson §G3.5), so there is no Morita equivalence. In the second item it is the
  anchor that fails: `t(G_T) = ℝ × (0, 1/2)` is not `M`.
- *Completeness in the Hausdorff criterion.* For the suspension of the flat shift (Fo6.4) and the
  interval `T = (−2, −1)` of the fibre `ℝ`, the leaves through `T` are circles without holonomy,
  each meeting `T` once, so `Hol_T^T` is the unit groupoid of `T`, Hausdorff, while `Hol` is not.
- *Germs, not arrows.* For a general foliation groupoid `σ` need not be injective: for the
  suspension groupoid of the flat shift (Fo6.3–Fo6.4), the arrows of `G_T^T` over `u < 0` labelled
  by `n ≠ 0` have identity germs.

*Needs:* Fo3.1, Fo1.3, Fo2.3; LieGroupoidsPoisson §G3.4–§G3.5.

### 3.3 The monodromy groupoid and the extreme integrations (Fo3.3)

Define the monodromy groupoid `Mon(M,F)` as the source-simply-connected integration `Σ(TF)` of
LieGroupoidsPoisson §G5.4, with the smooth structure obtained there from the charts of the
integration `Hol(M,F)`; its arrows are the leafwise homotopy classes of leafwise paths. Prove
(Crainic–Moerdijk, Proposition 1, p. 6, proved on p. 10): for every source-connected Lie groupoid
`G` integrating `F` there are unique morphisms of groupoids over `M`,
`h_G : Mon(M,F) → G` and `hol_G : G → Hol(M,F)`, with `hol_G ∘ h_G` the holonomy morphism; both
are surjective local diffeomorphisms, `h_G` is an isomorphism exactly when `G` is
source-simply-connected, and `hol_G(g)` is the arrow whose holonomy germ is `σ_g` (Fo3.2).

**Checks.**

- *Hausdorffness is not monotone.* For the horizontal planes in `ℝ³ ∖ {0}`, `Mon` is not Hausdorff
  (LieGroupoidsPoisson §G0.2) and `Hol` is (Fo2.3); for the suspension of the flat shift `Mon` is
  the Hausdorff suspension groupoid (Fo6.3) and `Hol` is not (Fo6.4). This is Crainic–Moerdijk's
  Remark 2.1 (i), p. 7.
- *Torus.* For irrational slope, `Mon = Hol = T² × ℝ`: the leaves are lines without holonomy.
- *Circle fibres.* For `S¹ × ℝ` foliated by the circles `S¹ × {y}`, `Hol` is the fibre product
  `M ×_ℝ M` and `Mon` has source fibres `ℝ`; `h_Hol` is the quotient by `ℤ`.

*Needs:* Fo3.1–Fo3.2, Fo2.2; LieGroupoidsPoisson §G5.4.

### Examples

The action groupoid of the linear flow on the torus; the reductions of `Hol` to closed geodesics
of the torus; the monodromy and holonomy groupoids of the horizontal planes in `ℝ³ ∖ {0}`.

### Dependencies

Fo1–Fo2; LieGroupoidsPoisson §G0.2–§G0.4, §G2.1, §G3.4–§G3.5, §G5.4.

## Layer Fo4: the C*-algebra of a foliation

### 4.1 The half-density convolution algebra (Fo4.1)

Let `G` be a Lie groupoid in the sense of LieGroupoidsPoisson §G0.2 (source fibres Hausdorff, arrow
manifold locally Hausdorff and second countable, possibly not Hausdorff). Define
`C_c^∞(G, Ω^{1/2})` as the span of the sections that are smooth with compact support inside one
Hausdorff chart domain and zero outside it (Connes 1982, §6, p. 18). Prove:

- for Hausdorff `G` this is the space of compactly supported smooth sections; in general its
  elements need not be continuous, and the pointwise product of two of them need not lie in it
  (Connes 1982, §6, p. 18);
- the restriction of an element to a source or a range fibre is smooth with compact support,
  since these fibres are Hausdorff;
- convolution and involution (Conventions) preserve `C_c^∞(G, Ω^{1/2})` (Connes 1982, §6, Lemma,
  pp. 18–19, in local coordinates `(f₁ * f₂)(t'', t, s) = ∫ f₁(t'', t', s) f₂(t', t, s) dt'`), and
  make it a *-algebra; `C_c^∞(G₀)` acts on both sides by `(h ∘ t) f` and `f (h ∘ s)`;
- an open subgroupoid `G' ⊆ G` gives a *-homomorphism by extension by zero; for an open
  `V' ⊆ M`, `Hol(V', F|V')` is an open subgroupoid of `Hol(M,F)` (Connes 1982, Lemma, p. 17);
- for an étale `G`, `Ω^{1/2}` is canonically trivial and `(f * g)(γ) = Σ_{γ₁γ₂ = γ} f(γ₁) g(γ₂)`
  (Connes 1994, Chapter II, §8.β, p. 126).

**Checks.**

- *Pair groupoid.* For the pair groupoid of `ℝ`, trivializing by `|dx|^{1/2} ⊗ |dy|^{1/2}` turns
  convolution into kernel composition `∫ f(x, z) g(z, y) dz` and the involution into
  `conj(f(y, x))`.
- *Units.* For the unit groupoid of `M` (`p = 0`), the convolution is the pointwise product and the
  algebra is `C_c^∞(M)`.
- *Discontinuous elements.* For the germ groupoid of the flat shift (Fo6.4), a function supported
  in the bisection of germs of the shift near `0` is nonzero at the units `1_u`, `u < 0` near `0`,
  and zero at `1_0`; it lies in `C_c^∞` without being continuous.

*Needs:* LieGroupoidsPoisson §G0.2, §G2.1; Fo2.2 for `Hol`.

### 4.2 Regular representations and the reduced algebra (Fo4.2)

For `x ∈ G₀` let `π_x` act on the square-integrable half densities on the source fibre
`G_x = s⁻¹(x)` by `(π_x(f)ξ)(γ) = ∫_{γ₁γ₂ = γ} f(γ₁) ξ(γ₂)` (Connes 1982, p. 17). Prove:

- `π_x(f)` is a bounded integral operator with smooth kernel `k(γ₁, γ₂) = f(γ₁γ₂⁻¹)` on
  `G_x × G_x` (Connes 1982, §6, Lemma, p. 19), and `π_x` is a *-representation;
- each arrow `g : x → y` gives a unitary `L²(G_y) → L²(G_x)` by right translation intertwining
  `π_y` and `π_x` (Connes 1982, p. 17);
- the representations separate `C_c^∞(G, Ω^{1/2})`: a nonzero `f` has a nonzero restriction to
  some `G_x`, a nonzero smooth kernel;
- `‖f‖_r = sup_x ‖π_x(f)‖` is finite and a C*-norm; `C*_r(G)` is the completion, and
  `C*_r(V,F) = C*_r(Hol(M,F))` (Connes 1982, Definition, p. 17; Connes 1994, Chapter II, §8.α,
  Definition 1, p. 124; Hilsum–Skandalis, p. 203); `C*_r(V,F)` is separable (Connes 1982, p. 18);
- the extension by zero of Fo4.1 for an open subgroupoid extends to an isometric *-homomorphism of
  the reduced algebras; in particular `C*_r(V',F|V') ⊆ C*_r(V,F)` isometrically (Connes 1982,
  Lemma, p. 17; Connes 1994, Chapter II, §8.α, Lemma 2, p. 125, also without Hausdorffness);
- if the leaf through `x` has trivial holonomy, `π_x` is irreducible (Connes 1994, p. 124).

**Checks.**

- *Units.* For the unit groupoid, `π_x(f) = f(x)` and `C*_r = C₀(M)`.
- *One fibre is not enough.* For `B × P` foliated by the fibres `{b} × P`, `π_x` sees only the
  fibre through `x`, so `‖f‖_r` needs the supremum over all `x`.
- *Pair groupoid.* For the pair groupoid of a manifold `X`, `C*_r = K(L²(X))`, as in
  OperatorAlgebraDynamics D5.

*Needs:* Fo4.1; Mathlib `MeasureTheory.Lp` and `IsCompactOperator`.

### 4.3 Hausdorff groupoids: Haar systems and the full algebra (Fo4.3)

Let `G` be Hausdorff, hence second-countable locally compact. A smooth positive density `α` on the
Lie algebroid `A` defines, by left translation, a smooth Haar system `λ^u` on the range fibres,
which for `Hol(M,F)` is the lift of the leafwise density `α` along `s : t⁻¹(u) → L_u` (Kordyukov,
Definition 3.14 and the paragraph following it, p. 26). Prove:

- `λ` satisfies the axioms of OperatorAlgebraDynamics D5 (support `t⁻¹(u)`, continuity of
  integration, left invariance);
- trivializing `Ω^{1/2}` by `α^{1/2} ∘ t ⊗ α^{1/2} ∘ s` identifies `C_c^∞(G, Ω^{1/2})` with
  `C_c^∞(G)`, dense in `C_c(G)` for the inductive-limit topology, and carries convolution,
  involution and `π_x` to those of OperatorAlgebraDynamics D5 for `λ`; hence `C*_r(G)` is D5's
  reduced algebra;
- the full algebra `C*(G)` is D5's full algebra for `λ`; replacing `α` by `Dα` changes the
  identification by the factor `D(t)^{−1/2} D(s)^{−1/2}`, a *-isomorphism of the convolution
  algebras which is not isometric for the I-norms but is continuous for the inductive-limit
  topology, so the full algebras agree by D5's pre-representation theorem (Muhly–Williams,
  Theorem 7.8, as consumed by D5);
- for Hausdorff `Hol(M,F)`, `C*(V,F) = C*(Hol(M,F))` with D5's regular quotient
  `C*(V,F) → C*_r(V,F)` (Connes 1994, Chapter II, §8.α, p. 125).

**Checks.**

- *Lie groups.* For a Lie group over a point, `λ` is a left Haar measure and the trivialized
  half-density algebra is D5's groupoid algebra, which D5's dictionary `f ↦ Δ^{1/2} f` identifies
  with OperatorAlgebraDynamics D1's group algebra; for the `ax + b` group the two involutions differ
  without the factor.
- *The I-norm depends on `α`.* For the pair groupoid of `ℝ`, `α = dx` and `D(x) = e^x`, a half
  density supported near the arrow from `0` to `1` has its range-fibre and source-fibre halves of
  the I-norm multiplied by about `e^{−1/2}` and `e^{1/2}` when `α` is replaced by `Dα`, while the
  two convolution algebras are isomorphic.
- *Action groupoids.* For a free action of a Lie group, `C*_r(G)` is the reduced crossed product
  (OperatorAlgebraDynamics D5, transformation groupoids; Connes 1994, p. 125).

*Needs:* Fo4.1–Fo4.2; OperatorAlgebraDynamics D1, D5.

### Examples

`C₀(M)` for the foliation by points; `K(L²(X))` for the pair groupoid; `C(T²) ⋊ ℝ` for the linear
foliation of the torus (Fo6.2); the germ groupoid of the flat shift.

### Dependencies

Fo2; LieGroupoidsPoisson §G0.2, §G2.1; OperatorAlgebraDynamics D1, D5; Mathlib `MeasureTheory.Lp`.

## Layer Fo5: Morita equivalence and stability

### 5.1 The transversal module (Fo5.1)

Let `T` be a transversal and `G = Hol(M,F)`. On `G_T = s⁻¹(T)`, a submanifold of dimension `n`, let
`E_T` be the completion of the chart-supported smooth sections of `t*|Λ|^{1/2}(F)` (as in Fo4.1)
for the right action of `C_c^∞(G_T^T)` by convolution and the inner product
`⟨ξ, η⟩(g) = ∫_{γ ∈ s⁻¹(t(g))} conj(ξ(γ)) η(γg)`, `g ∈ G_T^T` (Hilsum–Skandalis, p. 203; Connes
1994, Chapter II, §8.β, p. 126, with the opposite side conventions). Prove (Hilsum–Skandalis,
Proposition 3, p. 204):

- `E_T` is a right Hilbert `C*_r(G_T^T)`-module (HilbertModules H1) and the left action of
  `C_c^∞(G, Ω^{1/2})` by convolution extends to `C*_r(V,F)`; the arrows with range in an open set
  `U` span a submodule `E_U^T`, additive over disjoint open sets, and `E_T^T = C*_r(G_T^T)` as a
  module over itself (Proposition 3 (1)–(2));
- for complete `T`, `C*_r(V,F)` acts as `K(E_T)` and `⟨E_T, E_T⟩` is dense, so `E_T` is a
  `C*_r(V,F)`–`C*_r(G_T^T)` imprimitivity bimodule (HilbertModules H3; Hilsum–Skandalis, proof of
  Corollaire 6, p. 206; Connes 1994, p. 126);
- if `Hol(M,F)` is Hausdorff, `E_T` is OperatorAlgebraDynamics D6's module of the equivalence `G_T`
  of Fo3.2; D6 (Muhly–Williams, Theorem 5.5; Sims–Williams, Theorem 13) also gives
  `C*(V,F) ∼_M C*(G_T^T)` for the full algebras.

**Checks.**

- *Horizontal lines.* For the horizontal lines of `ℝ²` and the vertical axis `T`, `G_T^T` is the
  unit groupoid of `ℝ`, `G_T ≅ ℝ²` and `K(E_T) = C₀(ℝ) ⊗ K(L²(ℝ)) = C*_r(V,F)`.
- *Incomplete transversals.* For `T = {0} × (0,1)` there, `K(E_T)` is the ideal
  `C₀(0,1) ⊗ K(L²(ℝ))` of the saturation `ℝ × (0,1)`, a proper ideal of `C*_r(V,F)`.
- *Torus.* For the circle `{0} × ℝ/ℤ`, `E_T` is Connes's module between `C(T²) ⋊ ℝ` and the rotation
  algebra (Fo6.2).

*Needs:* Fo3.2, Fo4.1–Fo4.3; HilbertModules H1, H3; OperatorAlgebraDynamics D6.

### 5.2 Stability (Fo5.2)

Prove that for `p ≥ 1` the algebra `C*_r(V,F)` is stable, `C*_r(V,F) ≅ K ⊗ C*_r(V,F)`
(Hilsum–Skandalis, Théorème 1, p. 201), and that `C*_r(V,F) ≅ K ⊗ C*_r(G_T^T)` for every complete
transversal `T` (Hilsum–Skandalis, Corollaire 6, p. 206). Route (Hilsum–Skandalis, pp. 202–206):
take the pairwise disjoint chart domains `Ω_i ≅ D^p × T_i` around the transversals of Fo1.1
(Lemme 2 and the construction following it, pp. 202–203), `Ω = ⋃ Ω_i` and `T = ⋃ T_i`. The
boundary of `Ω` meets every leaf in a set of leafwise Lebesgue measure zero, so removing it does
not change the modules (Lemme 4, p. 205), and `E_T` is the sum of the submodules of the arrows with
range in `Ω` and in `M ∖ Ω̄` (Proposition 3 (2)). The first is `L²(D^p) ⊗ C*_r(G_T^T)`
(Proposition 3 (1), (4), p. 204), and Kasparov stabilization (HilbertModules H4) absorbs the
second, so `E_T ≅ H_{C*_r(G_T^T)}` and `C*_r(V,F) = K(E_T) ≅ K ⊗ C*_r(G_T^T)` (Proposition 3 (3);
p. 206); stability of `C*_r(V,F)` follows. For Hausdorff `Hol(M,F)` the full algebras satisfy the
same (Hilsum–Skandalis, Remarque 5, p. 206): the decomposition and Kasparov stabilization above run
for the full norms, with OperatorAlgebraDynamics D6's equivalence module of `G_T` (Fo5.1) in place
of `E_T`, so `C*(V,F)` is stable and `C*(V,F) ≅ K ⊗ C*(G_T^T)`.

**Checks.**

- *Leaf dimension zero.* For the foliation by points, `C*_r(V,F) = C₀(M)` is commutative and not
  stable, so `p ≥ 1` is needed.
- *Horizontal lines.* `C₀(ℝ) ⊗ K(L²(ℝ))` is stable and equals `K ⊗ C₀(ℝ)`, the reduction to the
  vertical axis.
- *Torus.* `C(T²) ⋊ ℝ ≅ K ⊗ A_θ` (Fo6.2).

*Needs:* Fo1.1, Fo5.1; HilbertModules H4; OperatorAlgebraDynamics D6.

### 5.3 Compact transversals and projections (Fo5.3)

For a compact transversal `N` without boundary, construct the projection
`e_N ∈ C_c^∞(Hol, Ω^{1/2}) ⊆ C*_r(V,F)` from a nonnegative half density `ξ` on `t⁻¹(N)`
supported near the units with `∫_{t(γ) = y} |ξ(γ)|² = 1` for `y ∈ N`, by
`e_N(γ) = Σ_{s(γ') = s(γ), t(γ') ∈ N} ξ(γ'γ⁻¹) ξ(γ')`; prove that `π_x(e_N)` is the orthogonal
projection onto the span of orthonormal vectors indexed by the arrows from `x` to `N`, and that
`e_N C*_r(V,F) e_N ≅ C*_r(Hol_N^N)`, a unital algebra (Connes 1994, Chapter II, §8.β,
pp. 125–126). For complete `N` the projection `e_N` is full, and `C*_r(V,F)` and `C*_r(Hol_N^N)`
are complementary full corners (HilbertModules H3).

**Checks.**

- *Torus.* For the closed geodesics `N_{p,q}` of the torus, `e_{p,q} C*_r(V,F) e_{p,q}` is the
  rotation algebra `A_θ'` of Fo6.2.
- *Circle fibres.* For `S¹ × S¹` foliated by the circles `S¹ × {y}` and `N = {1} × S¹`,
  `Hol_N^N` is the unit groupoid of `N`, `C*_r(V,F) = C(S¹) ⊗ K(L²(S¹))` (Fo6.1), and `e_N` is
  the field over `y ∈ S¹` of the rank-one projections onto `ξ(·, y)`, Murray–von Neumann
  equivalent to `1 ⊗ e` for a rank-one projection `e`, with corner `C(S¹)`.

*Needs:* Fo5.1; HilbertModules H3.

### Examples

The horizontal lines of `ℝ²`; the linear foliation of the torus with its closed geodesics; the
foliation by points as the case `p = 0`.

### Dependencies

Fo3.2, Fo4; HilbertModules H1, H3, H4; OperatorAlgebraDynamics D6.

## Layer Fo6: worked foliations

### 6.1 Simple foliations (Fo6.1)

For a surjective submersion `π : M → B` with connected fibres, foliated by `F = ker dπ`
(Kordyukov, Example 2.2, p. 4), prove: the leaves are the fibres, the holonomy is trivial, and
`Hol(M,F) = M ×_B M`, a closed embedded submanifold of `M × M` (Kordyukov, Example 3.9, p. 24;
Connes 1994, p. 124); `M` is a biprincipal bibundle between `M ×_B M` and the unit groupoid of `B`
(LieGroupoidsPoisson §G3.5), so `C*(V,F) ∼_M C₀(B)` and `C*_r(V,F) ∼_M C₀(B)`
(OperatorAlgebraDynamics D6; Connes 1994, p. 125); the regular quotient is injective, since D6's
equivalence module matches its kernel with the zero kernel of the unit groupoid of `B`
(Sims–Williams, Theorem 17); and `C*_r(V,F) ≅ C₀(B) ⊗ K` for `p ≥ 1` (Fo5.2, HilbertModules H4). For
the product `B × P`, identify `C*_r(V,F) = C₀(B) ⊗ K(L²(P))` directly (OperatorAlgebraDynamics D5,
pair groupoids).

**Checks.**

- *Connected fibres.* For `(ℝ ∖ {0}) × ℝ → ℝ`, `(x, y) ↦ y`, each fibre is two leaves, the leaf
  space is two copies of `ℝ`, and `C*_r(V,F) ∼_M C₀(ℝ ⊔ ℝ)`, not `C₀(ℝ)`.
- *Planes.* The planes `z = c` in `ℝ³ ∖ {0}` are the fibres of `z`, connected, so
  `C*_r(V,F) ≅ C₀(ℝ) ⊗ K`, although `Mon` is not Hausdorff (Fo3.3).

*Needs:* Fo2.1–Fo2.3, Fo4.3, Fo5.2; LieGroupoidsPoisson §G3.5; OperatorAlgebraDynamics D5–D6.

### 6.2 Linear foliations of the torus (Fo6.2)

Let `T² = Circle × Circle` (Mathlib's Lie group `Circle`), `θ` irrational, and `F_θ` the rank-one
foliation whose distribution at each point is spanned by the image of the constant field
`∂_x + θ∂_y` under the covering `(x, y) ↦ (exp(2πix), exp(2πiy))`; it is the image of
`TauCeti.Foliation.ofSubmodule (ℝ ∙ (1, θ))`, the lines `dy = θ dx` (Kordyukov, Example 2.4, p. 5;
Connes 1994, p. 127). A rank-one distribution spanned by a nowhere-vanishing smooth field is
involutive, so `F_θ` is a `TauCeti.Foliation`. Prove:

- `F_θ` is the orbit foliation of the free linear flow of `ℝ`, and `Hol(T², F_θ)` is its action
  groupoid `T² × ℝ` (LieGroupoidsPoisson §G0.3) with `r((x, y), t) = (x + t, y + θt)`, `s = (x, y)`
  (Connes 1994, Chapter II, §8.β, p. 127; Kordyukov, Example 3.19, p. 29), equal to `Mon`;
- `C*_r(V,F) = C*(V,F) ≅ C(T²) ⋊ ℝ` (OperatorAlgebraDynamics D5, transformation groupoids, and D2,
  amenability of `ℝ`);
- for coprime `(p, q)` the closed geodesic `N_{p,q} = {(ps, qs)}` is a compact complete
  transversal with `Hol_N^N ≅ ℤ ⋉ ℝ/ℤ`, `r(u, n) = u + nθ'`,
  `θ' = (p'θ − q') / (pθ − q)` for any integers with `pq' − p'q = 1` (Connes 1994, Chapter II,
  §8.β, pp. 127–128), so `C*_r(Hol_N^N)` is the rotation algebra `A_θ'` of NoncommutativeGeometry
  N6, the rotation by `+θ'` on points giving N6's `A_{−θ'} ≅ A_θ'` (exchange `u` and `u*`);
- consequently `C(T²) ⋊ ℝ ∼_M A_θ'` for every coprime `(p, q)`, `A_θ ∼_M A_θ'` whenever `θ'` lies
  in the `PSL(2,ℤ)` orbit of `θ` (Rieffel's theorem, reproved by Connes 1994, p. 128), and
  `C(T²) ⋊ ℝ ≅ K ⊗ A_θ` (Fo5.2).

**Checks.**

- *Return maps.* For `(p, q) = (0, 1)` the formula gives `θ' = θ`, the return map `v ↦ v + θ` of
  Fo1.2's computation; for `(1, 0)` it gives `θ' = −1/θ`, and the return map along the leaves to
  the horizontal circle is `u ↦ u + 1/θ`, which generates the same groupoid.
- *Rational slope.* For `θ = a/b` in lowest terms the flow is periodic, its action groupoid has
  isotropy `bℤ` at every point and is not `Hol`; `Hol` is the groupoid `M ×_{S¹} M` of the
  fibration by closed leaves (Fo6.1). Over `N_{0,1}` the action groupoid restricts to `ℤ ⋉ ℝ/ℤ`
  for the rotation by `a/b`, with isotropy `bℤ`, while `Hol_N^N` is the orbit relation of that
  rotation, with trivial isotropy; irrationality is what makes the formula above compute `Hol`.
- *K-theory.* The projections `e_{p,q}` of Fo5.3 have the traces `|q − pθ|` (Fo7.3), which with
  OperatorKTheory 7.4 recover the trace range `ℤ + θℤ` of `A_θ`.

*Needs:* Fo2.2, Fo3.2, Fo5.1–Fo5.3; LieGroupoidsPoisson §G0.3; OperatorAlgebraDynamics D2, D5;
NoncommutativeGeometry N6; Mathlib `Circle`.

### 6.3 Suspensions (Fo6.3)

Let `B` be a connected manifold, `B̃` its universal cover with the deck action of `Γ = π₁(B)`, and
`φ : Γ → Diff(P)` a homomorphism into the diffeomorphisms of a manifold `P`. The suspension
`M_φ = B̃ ×_Γ P`, the quotient of `B̃ × P` by `γ(b, f) = (γb, φ(γ)f)`, is foliated by the images
`F_φ` of the slices `B̃ × {f}` (Kordyukov, Example 2.7, p. 6). Prove:

- `M_φ → B` is a fibre bundle with fibre `P`, `F_φ` is a `TauCeti.Foliation` transverse to the
  fibres, and every fibre `P_b` is a complete transversal whose holonomy pseudogroup is generated
  by the maps `φ(γ)` (each holonomy germ along the lift of a loop representing `γ` is the germ of
  `φ(γ)^{±1}`, the sign fixed by the deck convention);
- the suspension groupoid `G_φ = (B̃ × B̃ × P)/Γ` (diagonal action), with arrows
  `[b', b, f] : [b, f] → [b', f]`, is a Hausdorff Lie groupoid (LieGroupoidsPoisson §G0.2) and a
  source-simply-connected foliation groupoid integrating `F_φ`, hence `G_φ ≅ Mon(M_φ, F_φ)`
  (Fo3.3);
- the restriction of `G_φ` to a fibre is the action groupoid `Γ ⋉ P` (LieGroupoidsPoisson §G0.3),
  so `C*(G_φ) ∼_M C₀(P) ⋊ Γ` and `C*_r(G_φ) ∼_M C₀(P) ⋊_r Γ` (Fo3.2, OperatorAlgebraDynamics
  D5–D6);
- `Hol_P^P` is the groupoid of germs of the maps `φ(γ)`, and `hol_{G_φ} : G_φ → Hol` (Fo3.3) is an
  isomorphism exactly when `φ` is germ-faithful: no `φ(γ)`, `γ ≠ e`, is the identity near one of
  its fixed points. Free actions, and faithful real-analytic actions on a connected `P`, are
  germ-faithful; then `C*_r(V,F) ≅ K ⊗ (C₀(P) ⋊_r Γ)` when `dim B ≥ 1` (Fo5.2).

**Checks.**

- *Torus.* `B = S¹`, `P = ℝ/ℤ` and `φ(1)` the rotation by `θ` give `M_φ = T²` with the foliation
  `F_θ` and `G_φ = Hol = T² × ℝ` (Fo6.2).
- *Analytic holonomy.* `φ(1) = (u ↦ 2u)` on `ℝ` is germ-faithful: `G_φ = Hol`, Hausdorff, with a
  compact leaf of holonomy `ℤ`.
- *Trivial action.* For trivial `φ`, `M_φ = B × P` is the simple foliation of the projection to
  `P`, `G_φ` has source fibres `B̃` and `Hol = M ×_P M`; `hol_{G_φ}` is the quotient by `π₁(B)`, and
  `φ` is not germ-faithful when `π₁(B) ≠ 1`, although every `φ(γ)` is real-analytic.

*Needs:* Fo3.1–Fo3.3, Fo4.3, Fo5.1–Fo5.2; LieGroupoidsPoisson §G0.2–§G0.3;
OperatorAlgebraDynamics D5–D6.

### 6.4 One-sided holonomy (Fo6.4)

Let `M_h` be the suspension over `S¹` of the flat shift `h = flatShift` of Fo2.3 acting on `P = ℝ`.
Prove:

- for `u ≤ 0` the leaf through `u` is a compact circle, with trivial holonomy for `u < 0` and
  holonomy `ℤ`, generated by the germ of `h` at `0`, for `u = 0`; for `u > 0` the leaves are lines,
  since `h(u) > u` and the orbit of `u` accumulates at `0` and leaves every compact set;
- `Γ_ℝ` is not quasi-analytic at `0`, so `Hol(M_h, F_h)` is not Hausdorff (Fo2.3): the units over
  the circles `u < 0` converge, as `u → 0`, both to the unit at `0` and to the arrow of the loop
  around the compact leaf (Connes 1982, §6, pp. 19–21, for the analogous foliation of `T²`;
  Kordyukov, p. 24);
- the canonical map `σ` of Fo3.2 from the action groupoid `ℤ ⋉ ℝ = (G_h)_ℝ^ℝ` onto the germ
  groupoid `Hol_ℝ^ℝ` is a surjective local diffeomorphism (Fo3.3), bijective over `[0, ∞)`, and
  over `u < 0` it collapses the isotropy `ℤ` of the action groupoid to the trivial group;
- `C_c^∞(Hol_ℝ^ℝ)` consists of the finite sums `Σ_k φ_k ∘ s`, `φ_k ∈ C_c^∞(ℝ)`, each extended by
  zero from the bisection `J_k` of the germs of `h^k`; its value at a unit `1_u` with `u < 0` is
  `Σ_k φ_k(u)` (compare Connes 1982, §6, Lemma, p. 21, for his example).

**Checks.**

- *Isotropy jump.* `Hol_0^0 = ℤ` and `Hol_u^u = 1` for `u < 0`, while `(G_h)_u^u = ℤ` for every
  `u ≤ 0`; `G_h` is a Hausdorff integration between `Mon` and `Hol` (it equals `Mon`).
- *Replacing the flat shift by `u ↦ 2u`* gives a Hausdorff `Hol` (Fo6.3), although the compact leaf
  still has holonomy `ℤ`.

*Needs:* Fo2.3, Fo3.2–Fo3.3, Fo4.1, Fo6.3; Mathlib `expNegInvGlue`.

### Examples

The simple foliations `B × P`; `T²` with slope `θ = √2 − 1` and its geodesics `N_{0,1}`, `N_{1,0}`
and `N_{1,1}`; the suspensions of `u ↦ 2u` and of the flat shift over the circle.

### Dependencies

Fo1–Fo5; LieGroupoidsPoisson §G0.2–§G0.3, §G3.5; OperatorAlgebraDynamics D2, D5–D6;
NoncommutativeGeometry N6; HilbertModules H4.

## Layer Fo7: transverse measures and traces

### 7.1 Invariant transverse measures (Fo7.1)

A holonomy-invariant transverse measure `Λ` assigns to each transversal `T` a Radon measure `Λ_T`,
compatibly with restriction to open subsets, such that every member `e` of a holonomy pseudogroup
between two transversals satisfies `e_*(Λ_T|source) = Λ_{T'}|target` (Kordyukov,
Definitions 2.24–2.25, p. 12, in Borel form; Connes 1982, §2). Prove:

- `Λ` is determined by `Λ_T` for one complete transversal `T`, and every `Γ_T`-invariant Radon
  measure on a complete `T` extends uniquely to a holonomy-invariant transverse measure;
- `Γ_T`-invariance is invariance for the étale groupoid `Hol_T^T`: for every open bisection `U`,
  `(t ∘ (s|_U)⁻¹)_*(μ|_{s(U)}) = μ|_{t(U)}`;
- with a positive leafwise density `α`, `Λ` defines a Radon measure `Λ ⊗ α` on `M`, by the formula
  over a good cover and a partition of unity (Kordyukov, p. 13), independent of these choices;
- a smooth transverse density invariant under linear holonomy defines `Λ` (Kordyukov,
  Example 2.26, p. 12), and a compact leaf defines the counting measure of its intersections
  (Kordyukov, Example 2.27, p. 12).

**Checks.**

- *Torus.* The transverse density `|dy − θdx|` is invariant; `Λ ⊗ (leafwise length)` is a multiple
  of Lebesgue measure on `T²` (Kordyukov, Example 3.27, p. 33), and `Λ(N_{p,q}) = |q − pθ|`.
- *Compact leaf only.* For the suspension of `u ↦ 2u`, the invariant Radon measures on the complete
  transversal `ℝ` are the multiples of `δ₀`: Lebesgue measure is rescaled by `2`, and `du/|u|` is
  invariant but has infinite mass near `0`.

*Needs:* Fo1.3, Fo3.2; Mathlib `MeasureTheory.Measure`, `Measure.map`.

### 7.2 Traces on étale reductions (Fo7.2)

Let `G` be an étale Lie groupoid over `T`, Hausdorff or not, and `μ` a finite `G`-invariant Radon
measure on `T`. Define `τ_μ(a) = ∫_T ⟨δ_x, π_x(a) δ_x⟩ dμ(x)` on `C*_r(G)`, with `π_x` the regular
representation on `ℓ²(G_x)`. Prove:

- the integrand is Borel and bounded by `‖a‖`, and `τ_μ(f) = ∫_T f(1_x) dμ(x)` for
  `f ∈ C_c^∞(G)` (for non-Hausdorff `G`, `f` restricted to the units is bounded Borel and possibly
  discontinuous);
- `τ_μ` is a positive tracial linear functional of norm at most `μ(T)`: on `C_c^∞(G)`,
  `τ_μ(a* * b) = ∫ Σ_{g ∈ G_x} conj(a(g)) b(g) dμ(x)` and `τ_μ(b * a*)` is the same integral with
  `G^x` in place of `G_x`, equal by invariance; continuity extends the trace identity;
- for Hausdorff `G`, `τ_μ = μ ∘ E` with the conditional expectation `E` of
  OperatorAlgebraDynamics D6, and `τ_μ` is faithful when `μ` has full support; normalized and
  composed with the regular quotient, it is the tracial state that Neshveyev's classification
  attaches to `μ` and the canonical traces of the isotropy groups (Neshveyev, Theorem 1.3 with
  zero cocycle, p. 4, and the remark after the proof of Theorem 1.1, p. 3).

**Checks.**

- *Torus.* For `ℤ ⋉ ℝ/ℤ` and Lebesgue measure, `τ_μ` is the trace `∫ ∘ E` of
  NoncommutativeGeometry N6 on `A_θ`.
- *Invariance is needed.* For `ℤ` acting on `ℝ` by `u ↦ 2u` and Lebesgue measure restricted to
  `[0, 2]`, a function `f` on the bisection of the generator with `f(1, u) = φ(u)`,
  `φ ∈ C_c(0, 1)`, has `τ(f* * f) = ∫ |φ|²` and `τ(f * f*) = 2 ∫ |φ|²`; Lebesgue measure is not
  invariant, and the trace identity fails.
- *A fixed point.* For `δ₀`, `τ_{δ₀}(a) = ⟨δ_0, π_0(a)δ_0⟩` restricts on the isotropy `ℤ` at `0` to
  the canonical trace of `C*_r(ℤ)`.

*Needs:* Fo4.1–Fo4.2, Fo7.1; OperatorAlgebraDynamics D6.

### 7.3 The trace of a transverse measure on `C*_r(V,F)` (Fo7.3)

Let `T` be a complete transversal on which `Λ_T` is finite (on a compact `M`, the relatively compact
`T` of Fo1.1), and `μ = Λ_T`. Define `τ_Λ` as the trace induced from `τ_μ` (Fo7.2) on
`K(E_T) = C*_r(V,F)` (Fo5.1) by Laca–Neshveyev, Theorem 1.1, pp. 2–3:
`τ_Λ(x) = sup Σ_{ξ ∈ I} τ_μ(⟨ξ, xξ⟩)` over finite `I ⊆ E_T` with `Σ_{ξ ∈ I} θ_{ξ,ξ} ≤ 1`. Prove:

- `τ_Λ` is a trace (TracesOnCStarAlgebras Tr1.1), lower semicontinuous and densely defined
  (TracesOnCStarAlgebras Tr1.2), with `τ_Λ(θ_{ξ,η}) = τ_μ(⟨η, ξ⟩)` (Laca–Neshveyev,
  Theorem 1.1 (i)–(iv));
- `τ_Λ(f) = ∫_M f|_M dΛ` for `f ∈ C_c^∞(Hol, Ω^{1/2})`, where the restriction of `f` to the units is
  a leafwise density integrated against `Λ` as in Fo7.1 (the trace of a transverse measure in
  Connes 1982, p. 16; the normal trace `tr_μ(k) = ∫ k(x) dμ(x)` of Kordyukov, §3.3, p. 33, is its
  von Neumann counterpart);
- `τ_Λ` does not depend on `T`: compare `T` and `T'` through the étale groupoid pulled back along
  `T ⊔ T' → M` (Crainic–Moerdijk, p. 3), whose algebra has the algebras of `T` and `T'` as
  complementary corners, and induction in stages (Laca–Neshveyev, Proposition 1.2, p. 3);
- for a compact transversal `N`, `τ_Λ(e_N) = Λ(N)` (Fo5.3).

**Checks.**

- *Torus.* With `Λ = |dy − θdx|`, `τ_Λ(e_{p,q}) = |q − pθ|` and, on the corner
  `e_{0,1} C*_r(V,F) e_{0,1} ≅ A_θ`, `τ_Λ` is N6's trace; under `C(T²) ⋊ ℝ ≅ K ⊗ A_θ` it is
  `Tr ⊗ τ`.
- *Simple foliations.* For `B × P` and a Radon measure `ν` on `B`, `τ_Λ = ν ⊗ Tr` on
  `C₀(B) ⊗ K(L²(P))`; the point masses of `B` are the ergodic transverse measures (Connes 1982,
  p. 15).
- *A compact leaf.* For the suspension of `u ↦ 2u` and `Λ = δ₀`, `τ_Λ` vanishes on the ideal
  `C*_r` of the open saturated complement of the compact leaf (Fo4.2), so it is not faithful.

*Needs:* Fo5.1, Fo5.3, Fo7.1–Fo7.2; TracesOnCStarAlgebras Tr1.1–Tr1.2; HilbertModules H2–H3.

### Examples

Lebesgue measure for the linear foliation of the torus; point masses for simple foliations; the
counting measure of a compact leaf; the Haar measure of `SL(2,ℝ)` for the horocycle flow of a
compact quotient, whose trace is faithful (Connes 1994, Chapter II, §8.β, pp. 129–130).

### Dependencies

Fo3.2, Fo4–Fo5; TracesOnCStarAlgebras Tr1.1–Tr1.2; OperatorAlgebraDynamics D6; HilbertModules
H2–H3.

## Downstream consumers

None of the following supplies anything to this roadmap beyond the supplier contracts; they are the
roadmaps whose objects reappear here, and which can consume it.

- NoncommutativeGeometry: N6's rotation algebra `A_θ` and its trace are the transversal algebra of
  the linear foliation of the torus and the trace of Lebesgue measure (Fo6.2, Fo7.3).
- OperatorKTheory: the trace range `ℤ + θℤ` of 7.4 is realized by the projections of closed
  transversals (Fo6.2, Fo7.3).
- OperatorAlgebraDynamics: D2's irrational rotation is the reduction of `Hol(T², F_θ)` to a closed
  transversal (Fo6.2), and D5–D6 are the Hausdorff case of Fo4–Fo5.
- GeometricTopology: the Reeb foliations of Layer 10 are the basic foliations with non-Hausdorff
  holonomy groupoids (Fo2.3).

## Scope and ownership

This roadmap owns, in seven layers cited as Fo1–Fo7 (subsection `k.n` of layer Fo`k` is Fo`k.n`):

- Fo1: good covers and disjoint transversal families of a foliation; slidings of leafwise paths
  and holonomy germs with their invariances; holonomy groups, holonomy coverings and holonomy
  pseudogroups as structure groupoids, with their generation by the maps `f_ij`.
- Fo2: the holonomy groupoid as a Lie groupoid with possibly non-Hausdorff arrows, its isotropy and
  Lie algebroid, and Winkelnkemper's Hausdorff criterion with its trivial, analytic and one-sided
  cases.
- Fo3: foliation groupoids (Crainic–Moerdijk's characterization), reduction to transversals and
  the identification of `Hol_T^T` with the germ groupoid of `Γ_T`, the monodromy groupoid as
  `Σ(TF)` and the factorization `Mon → G → Hol`.
- Fo4: the half-density convolution algebra, the regular representations and the reduced
  C*-algebra of a Lie groupoid whose arrow manifold need not be Hausdorff, `C*_r(V,F)`, and its
  identification with OperatorAlgebraDynamics D5 through Haar systems of densities in the
  Hausdorff case.
- Fo5: the transversal modules, Morita equivalence with the étale reductions, stability, and the
  projections of compact transversals.
- Fo6: simple foliations, linear foliations of the torus, suspensions with their suspension
  groupoids, and the suspension of the flat shift.
- Fo7: holonomy-invariant transverse measures, their traces on étale reductions and their induced
  traces on `C*_r(V,F)`.

It leaves the following to the named owners and consumes them by section.

- **DifferentialGeometry** owns distributions, involutivity and the local Frobenius theorem with
  flat charts and charts adapted to transverse submanifolds (4.1–4.3), and the global leaves with
  their manifold structure and second countability (4.4). Fo1 starts from these charts and leaves.
- **LieGroupoidsPoisson** owns topological groupoids (§G0.0), Lie groupoids on possibly
  non-Hausdorff arrow manifolds with their examples, bisections and isotropy groups (§G0.2–§G0.4),
  Lie algebroids of Lie groupoids (§G2.1), restriction to submanifolds transverse to the anchor
  (§G3.4), bibundles and Morita equivalence (§G3.5), and the integration `Σ(A)` with Lie II and
  uniqueness (§G5.4). Fo2–Fo3 construct their foliation groupoids inside this framework; the
  monodromy groupoid is §G5.4's `Σ(TF)` and is not constructed a second time.
- **OperatorAlgebraDynamics** owns crossed products (D1–D2), Haar systems, the convolution algebras,
  full and reduced completions, regular representations and transformation groupoids of Hausdorff
  groupoids (D5), and groupoid equivalence with Renault's equivalence theorem and the conditional
  expectation of étale groupoids (D6). Fo4.3 and Fo5.1–Fo5.2 consume them for Hausdorff holonomy
  groupoids; the non-Hausdorff constructions of Fo4–Fo5 are this roadmap's.
- **HilbertModules** owns Hilbert modules and their compact operators (H1–H2), imprimitivity
  bimodules, linking algebras and full corners (H3), and Kasparov stabilization with
  Brown–Green–Rieffel (H4).
- **NoncommutativeGeometry** owns the rotation algebra `A_θ` with its trace (N6);
  **OperatorKTheory** owns `K₀(A_θ)` and its trace range (7.4).
- **TracesOnCStarAlgebras** owns traces, their lower semicontinuity and density (Tr1.1–Tr1.2).
- **GeometricTopology** owns the Reeb components and the Reeb foliation of `S³` (10.1).

Outside this roadmap: singular foliations and their holonomy groupoids; full C*-algebras of Lie
groupoids with non-Hausdorff arrow manifolds; von Neumann algebras of foliations and their type
classification; longitudinal pseudodifferential operators and index theorems; cyclic cohomology of
foliation algebras; K-theory computations and the Baum–Connes map for foliations; Kasparov
functoriality for maps of leaf spaces; characteristic classes of foliations.

## Exact supplier contracts

### From Mathlib

At Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`:

- `CategoryTheory.Groupoid` (`Mathlib/CategoryTheory/Groupoid.lean`) and `FundamentalGroupoid`
  (`Mathlib/AlgebraicTopology/FundamentalGroupoid/Basic.lean`).
- `Filter.Germ` with `Filter.Germ.coe_eq` (`Mathlib/Order/Filter/Germ/Basic.lean`).
- `StructureGroupoid` (`Mathlib/Geometry/Manifold/StructureGroupoid.lean`) and
  `OpenPartialHomeomorph` (`Mathlib/Topology/OpenPartialHomeomorph/Defs.lean`).
- `Manifold.IsSmoothEmbedding` (`Mathlib/Geometry/Manifold/SmoothEmbedding.lean`), `mfderiv`,
  `ContMDiffOn`, `IsManifold`; the Lie group `Circle` with its `IsManifold (𝓡 1) ω Circle`
  instance (`Mathlib/Geometry/Manifold/Instances/Sphere.lean`).
- `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`
  (`Mathlib/Analysis/Analytic/Uniqueness.lean`).
- `expNegInvGlue` and `expNegInvGlue.contDiff`
  (`Mathlib/Analysis/SpecialFunctions/SmoothTransition.lean`).
- `MeasureTheory.Measure`, `MeasureTheory.Measure.map`, `MeasureTheory.Lp`, `lp` and
  `IsCompactOperator`.

### From Tau Ceti

At Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`:

- `TauCeti.Foliation` (`TauCeti/Geometry/Manifold/Foliation/Basic.lean`): a `C^n` involutive
  distribution of rank `k`, with `TauCeti.Foliation.ofSubmodule` and
  `TauCeti.Foliation.ofSubmodule_distribution`.
- `TauCeti.Foliation.JoinedByTangentCurve`, `TauCeti.Foliation.SameLeaf`,
  `TauCeti.Foliation.leaf`, `TauCeti.Foliation.leaf_eq_leaf_iff`,
  `TauCeti.Foliation.sameLeaf_of_contMDiffOn_of_tangent` and `TauCeti.Foliation.leaf_ofSubmodule`
  (`TauCeti/Geometry/Manifold/Foliation/Leaf.lean`).
- `TauCeti.Manifold.curveVelocityWithin` (`TauCeti/Geometry/Manifold/MFDeriv/Curve.lean`).
- `TauCeti.IsContMDiffDistribution` and `TauCeti.IsInvolutiveDistribution`
  (`TauCeti/Geometry/Manifold/Distribution.lean`).

### From TauCetiRoadmap.DifferentialGeometry

4.3: `Distribution.exists_flatChart` and the chart statement adapted to a transverse
submanifold. 4.4: `Distribution.exists_leaf`, the manifold structure and second countability of
leaves, and the identification of their images with `TauCeti.Foliation.leaf`.

### From TauCetiRoadmap.LieGroupoidsPoisson

§G0.0 (topological groupoids on `CategoryTheory.Groupoid` with total-arrow topology), §G0.2 (Lie
groupoids with locally Hausdorff, second-countable arrow manifolds and Hausdorff source fibres),
§G0.3 (unit, pair and action groupoids), §G0.4 (bisections, isotropy Lie groups with the law
`gh = h ≫ g`), §G2.1 (the Lie algebroid of a Lie groupoid), §G3.4 (restriction to submanifolds
transverse to the anchor), §G3.5 (biprincipal bibundles, Morita equivalence, homeomorphic orbit
spaces and isomorphic isotropy), §G5.4 (`Σ(A)`, Lie II, uniqueness, and the source-fibre-cover
structure of `Σ(A(Γ))` from an integration `Γ`).

### From TauCetiRoadmap.OperatorAlgebraDynamics

D1–D2 (crossed products, amenability, the irrational rotation); D5 (Haar systems, `C_c(G)` with
convolution, involution and I-norm, the full and reduced algebras, regular representations on
`L²(G_u)`, the pre-representation theorem, pair and transformation groupoids); D6
(`(G,H)`-equivalences and their imprimitivity bimodules for full and reduced algebras, the
conditional expectation of an étale groupoid).

### From TauCetiRoadmap.HilbertModules

H1 (Hilbert modules and completions), H2 (adjointable and compact module operators `θ_{ξ,η}`), H3
(imprimitivity bimodules, linking algebras, full corners), H4 (countable generation, Kasparov
stabilization, Brown–Green–Rieffel).

### From TauCetiRoadmap.NoncommutativeGeometry

N6: `A_θ = C(𝕋) ⋊_α ℤ` with `α(f)(z) = f(exp(2πiθ)z)`, its unitaries `u`, `v` and its faithful
tracial state `τ = ∫_𝕋 ∘ E`.

### From TauCetiRoadmap.OperatorKTheory

7.4: Pimsner–Voiculescu for `ℤ`-actions and `K₀(A_θ)` with the canonical trace.

### From TauCetiRoadmap.TracesOnCStarAlgebras

Tr1.1 (`IsTrace` and the domain `𝔪_τ`), Tr1.2 (lower semicontinuity on the positive cone,
`IsDenselyDefined`, `IsSemifinite`).

### From TauCetiRoadmap.GeometricTopology

10.1: the Reeb component and the Reeb foliation of `S³`.

## References

- A. Connes, *A survey of foliations and operator algebras*, in Operator Algebras and
  Applications, Proc. Sympos. Pure Math. 38, Part 1, Amer. Math. Soc., 1982, 521–628; the author's
  version at <https://alainconnes.org/wp-content/uploads/foliationsfine.pdf>, to whose page numbers
  the locators above refer (§2, transverse measures; §5, pp. 15–18, the construction of `C*(V,F)`;
  §6, pp. 18–21, non-Hausdorff graphs).
- A. Connes, *Noncommutative Geometry*, Academic Press, 1994; the author's version at
  <https://alainconnes.org/wp-content/uploads/book94bigpdf.pdf>, Chapter II, §8.α–§8.β,
  pp. 123–130 of that file.
- M. Crainic, I. Moerdijk, *Foliation groupoids and their cyclic homology*, Adv. Math. 157 (2001),
  177–197; arXiv:math/0003119v2, to whose page numbers the locators above refer.
- M. Hilsum, G. Skandalis, *Stabilité des C*-algèbres de feuilletages*, Ann. Inst. Fourier 33
  (1983), no. 3, 201–208, doi:10.5802/aif.936 (Numdam).
- Yu. A. Kordyukov, *Noncommutative geometry of foliations*, J. K-Theory 2 (2008);
  arXiv:math/0504095v2, to whose page numbers the locators above refer.
- M. Laca, S. Neshveyev, *KMS states of quasi-free dynamics on Pimsner algebras*, J. Funct. Anal.
  211 (2004), no. 2, 457–482; arXiv:math/0304435.
- S. Neshveyev, *KMS states on the C*-algebras of non-principal groupoids*, J. Operator Theory 70
  (2013), no. 2, 513–530; arXiv:1106.5912v3.
- P. S. Muhly, D. P. Williams, *Renault's equivalence theorem for groupoid crossed products*,
  arXiv:0707.3566 (Theorems 5.5 and 7.8, consumed through OperatorAlgebraDynamics D5–D6).
- A. Sims, D. P. Williams, *Renault's equivalence theorem for reduced groupoid C*-algebras*,
  arXiv:1002.3093 (Theorems 13 and 17, consumed through OperatorAlgebraDynamics D6).
