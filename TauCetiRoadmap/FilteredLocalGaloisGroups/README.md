# Roadmap: filtered local Galois groups and their solvable quotients

**Summary.** The anabelian theorems for local fields are statements about **filtered** profinite
groups: the absolute Galois group `G_K` of a local field `K`, or one of its quotients, together
with the upper ramification filtration. Mochizuki's theorem [Mochizuki 1997, Thm. 4.2] says that,
for finite extensions `K, K'` of `ℚ_p`, every isomorphism `G_K ≅ G_{K'}` that respects the
filtrations is, up to an inner automorphism, induced by a unique field isomorphism. Its `m`-step
solvable form [Hyeon 2025, Thms. 1.4–1.5] replaces `G_K` by its maximal `m`-step solvable quotient
`G_K^m = G_K/G_K^[m]`, filtered by the image of the upper filtration. Both statements need the
same scaffolding first, and this roadmap builds it.

For a topological group `G`, the closed derived series `G^[n]` is the closure of the abstract
derived series, and `G^n = G/G^[n]` is the maximal `n`-step solvable quotient, so that `G^1` is the
topological abelianization. A filtration of `G` is a decreasing family `G(u)`, `u ∈ ℝ`, of closed
normal subgroups. For a set `S` of indices, an isomorphism of filtered groups is `S`-filtered when
it carries `G(u)` onto `G'(u)` for every `u ∈ S`, and `Out_Filt(G, G'; S)` is the set of these
modulo inner automorphisms of `G'`. A filtration passes to quotients, and, through Herbrand
functions of an open subgroup `H` built from the indices `[G : G(t)·H]`, to open subgroups.

On a nonarchimedean local field `K` the upper filtration makes `G_K`, its solvable quotients and
its maximal pro-`p` quotient filtered groups. For a finite separable extension `L` of `K` the
filtration induced on the open subgroup `G_L` is the upper filtration of `L`. The headline of the
group-theoretic part is descent: for `m, n ≥ 0`, a filtered isomorphism `G_K^{m+n} ≅ G_{K'}^{m+n}`
that carries the image of `G_L` onto the image of `G_{L'}`, for finite separable `L`, `L'` fixed by
`G_K^[m]`, `G_{K'}^[m]`, induces a filtered isomorphism `G_L^n ≅ G_{L'}^n`. A continuous field
isomorphism `K ≅ K'` gives an element of `Out_Filt(G_K, G_{K'})`.

The arithmetic headlines are for `K` a finite extension of `ℚ_p`. For a uniformizer `ϖ`, local
reciprocity gives an isomorphism of topological groups `𝒪_K^× × Ẑ ≅ G_K^ab`,
`(u, a) ↦ Art_K(u)·Art_K(ϖ)^a`. The centre of `G_K^{m+1}` lies in `G_K^[m]/G_K^[m+1]` for every
`m ≥ 0`, and `G_K^m` has trivial centre for every `m ≥ 2` [Hyeon 2025, Prop. A.1]. For `m = 1` this
fails, `G_K^ab` being abelian.

The roadmap builds on RamificationOfCompleteDiscretelyValuedFields, which supplies the functions
`ψ_{L/K}` of finite separable extensions and the identity `G_K^u ∩ G_L = G_L^{ψ_{L/K}(u)}`; on
ClassFieldTheory, which supplies the absolute upper filtration of a local field, the absolute Artin
map with its functoriality and its injectivity in characteristic `0`; and on the completed local
fields and ramification roadmap, implemented in Tau Ceti, for the finite-level upper numbering. It
feeds LocalAnabelianGeometry, which proves the filtered and `m`-step solvable local Grothendieck
conjectures from it, and FieldOfNorms, which uses the filtered groups and Herbrand functions for
arithmetically profinite extensions.

Layer 0 is the closed derived series and the solvable quotients of a topological group, up to the
statement that centre-freeness of every `G^m` passes to `G`. Layer 1 is filtered topological
groups: filtered and outer filtered isomorphisms, quotient filtrations, Herbrand functions of an
open subgroup and restriction. Layer 2 puts the upper filtration on local Galois groups and proves
that restriction and descent match the arithmetic. Layer 3 writes `G_K^ab` in coordinates and
proves centre-freeness of `G_K^m` for `m ≥ 2`. Layers 0 and 1 are pure group theory and hold in
every characteristic, Layer 2 holds for every nonarchimedean local field, and Layer 3 is for finite
extensions of `ℚ_p`.

## Conventions

- **Topological groups.** Groups carry `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]`;
  profinite groups add `[CompactSpace G] [TotallyDisconnectedSpace G]`, as in Tau Ceti's
  `zpowHat` and Mathlib's `ProfiniteGrp`. Isomorphisms are Mathlib's `G ≃ₜ* G'`
  (`ContinuousMulEquiv`).
- **Notation.** In prose `G(u)` is a filtration step, `G^[n]` a term of the closed derived
  series and `G^n = G/G^[n]` a solvable quotient. The absolute upper group written `G_K^u` in
  ClassFieldTheory and RamificationOfCompleteDiscretelyValuedFields is written `G_K(u)` here, so
  that `G_K^m` always means the quotient. `G^1 = G^ab`.
- **The closed derived series** is `closedDerivedSeries G n`, the topological closure of Mathlib's
  `Subgroup.derivedSeries G n`. It is not defined by iterating closed commutators. The recursion
  `G^[n+1] = closure ⁅G^[n], G^[n]⁆` is a theorem (0.1). `G^1` is Mathlib's
  `TopologicalAbelianization G` by definition, not merely up to isomorphism, because
  `closedDerivedSeries G 1` is `(commutator G).topologicalClosure`.
- **Filtrations are indexed by all of `ℝ`.** A filtration of `G` is an antitone family `u ↦ G(u)`
  of closed normal subgroups, `u ∈ ℝ` (`GroupFiltration G`). The upper filtration of a local
  Galois group is ClassFieldTheory Layer 7's `localAbsoluteUpperRamificationGroup K u` for
  `u ≥ −1`, and `G_K` for `u < −1` (2.1). A filtration need not be exhaustive or separated, and no
  continuity in `u` is assumed.
- **Filtered isomorphisms are relative to an index set.** For `S ⊆ ℝ`, `α : G ≃ₜ* G'` is
  `S`-filtered if `α(G(u)) = G'(u)` for every `u ∈ S` (`IsFiltered F F' S α`). Two index sets are
  used: `S = [0, ∞)`, which includes inertia `G(0)` and is the convention of [Hyeon 2025, §2], and
  `S = (0, ∞)`, the convention of [Mochizuki 1997, Def. 2.3]. Every statement names its `S`.
  Restriction to open subgroups (1.5) needs `[0, ∞) ⊆ S`. That a `(0, ∞)`-filtered isomorphism
  of `G_K^{m+1}` already preserves inertia is a reconstruction theorem of LocalAnabelianGeometry,
  not a convention.
- **Outer isomorphisms.** `Out_Filt(G, G'; S)` is the quotient of the `S`-filtered isomorphisms
  `G ≃ₜ* G'` by post-composition with inner automorphisms of `G'`, `α ~ c_g ∘ α`
  (`FilteredOut`). It is a set, not a group, when `G ≠ G'`. An inner automorphism preserves every
  filtration because the steps are normal.
- **Herbrand functions of an open subgroup.** For a filtration `F` of a compact group `G` and an
  open subgroup `H`, put `f_H = [G : G(0)·H]` and
  `ψ_H(u) = u` for `u ≤ 0`, `ψ_H(u) = (1/f_H) ∫_0^u [G : G(t)·H] dt` for `u ≥ 0`
  (`GroupFiltration.herbrandPsi`). The indices are finite because `H` is open. `ψ_H` is a strictly
  increasing continuous bijection of `ℝ`, and `φ_H` is its inverse. On a local Galois group with
  `H = G_L`, `f_H` is the residue degree `f(L/K)` and `ψ_H` is `ψ_{L/K}` (2.2). Throughout,
  `ψ_{L/K}` is Serre's normalized function [Serre, *Local Fields*, IV §3], which is the identity
  for `L/K` unramified, and `φ_{L/K}` its inverse; this is the normalization of
  RamificationOfCompleteDiscretelyValuedFields §4a.2, and every cited formula is read with it.
  ⚠ The integrand is `[G : G(t)·H]`, divided by `f_H`. The variant without the factor `1/f_H`
  gives `ψ_H(u) = f_H·u` for `L/K` unramified.
- **Local Galois groups.** `G_K` is Mathlib's `Field.absoluteGaloisGroup K`, the automorphism
  group of `AlgebraicClosure K` with the Krull topology, as in ClassFieldTheory and
  RamificationOfCompleteDiscretelyValuedFields. Subextensions are
  `IntermediateField K (AlgebraicClosure K)`. Statements are about `G_K^m` and its subgroups,
  never about a Galois group of an infinite subextension: `AlgebraicClosure K` is not Galois over
  `K` in characteristic `p`, and Mathlib's infinite Galois correspondence
  (`Mathlib/FieldTheory/Galois/Infinite.lean`) needs `IsGalois`. A finite separable subextension
  `L` **lies in `K^m`** when `G_K^[m] ≤ L.fixingSubgroup`; in characteristic `0` this is
  `L ⊆ K^m` for the fixed field `K^m` of `G_K^[m]`, and Layer 3, which is in characteristic `0`,
  writes `Gal(K^{m+1}/K^m)` for `G_K^[m]/G_K^[m+1]`. A finite separable subextension `L` is a
  local field through Tau Ceti's `finiteIntermediateFieldValuativeRel`,
  `finiteIntermediateFieldTopology` and `finiteIntermediateField_isNonarchimedeanLocalField`.
  These are definitions, not instances: a statement about `L` installs them locally with `letI`
  and `haveI`, as `TauCeti/NumberTheory/LocalField/Herbrand/CyclicReduction.lean` does. The
  absolute Galois group of `L` is identified with the open subgroup `L.fixingSubgroup` of `G_K`
  (2.0).
- **Mixed characteristic** in Layer 3 is `(p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K]
  [Module.Finite ℚ_[p] K]`, carried by every Layer 3 theorem, beside the local-field structure
  `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`. It gives
  `[CharZero K]`, the hypothesis of Tau Ceti's `injective_artinMap`.
- **Universes.** Layer 3 takes `K : Type` and `zHat.{0}`, because Tau Ceti's
  `TauCeti.ClassFieldTheory.artinMap` is stated in `Type`.

## Layer 0: the closed derived series and solvable quotients

Let `G` be a topological group.

### 0.1 Definition and basic properties

`closedDerivedSeries G n`, its normality (an instance), closedness, `closedDerivedSeries G 0 = ⊤`,
antitonicity (`closedDerivedSeries_antitone`), and the recursion
`closedDerivedSeries G (n + 1) = (⁅closedDerivedSeries G n, closedDerivedSeries G n⁆).topologicalClosure`
(`closedDerivedSeries_succ`), from `closure ⁅closure A, closure B⁆ = closure ⁅A, B⁆` for subgroups
of a topological group. `closedDerivedSeries G 1 = (commutator G).topologicalClosure`. For `G`
Hausdorff, `G` is abelian exactly when `G^[1] = ⊥`; without separation an abelian `G` has
`G^[1] = closure {1}`. `G^n` is the quotient `SolvableQuotient G n = G ⧸ closedDerivedSeries G n`,
with `SolvableQuotient G 1 = TopologicalAbelianization G`.

*Needs:* Mathlib's `Subgroup.derivedSeries`, `commutator`, `Subgroup.topologicalClosure`,
`Subgroup.is_normal_topologicalClosure`, `TopologicalAbelianization`.

**Checks.**

- `S₃` with the discrete topology: `G^[1] = A₃`, `G^[2] = ⊥`, so `G^1 ≅ ℤ/2` and `G^2 = G`.
- `ℤ_p` (additive, Hausdorff, abelian): `G^[1] = ⊥` and `G^1 = ℤ_p`.
- `ℤ/2` with the indiscrete topology: `Subgroup.derivedSeries G 1 = ⊥`, but its closure is `⊤`, so
  `G^[1] = ⊤` and `G^1` is trivial. This separates the closed derived series from the abstract
  one, and shows that `G^[1] = ⊥` characterizes abelian groups only for `G` Hausdorff.

### 0.2 Functoriality

A continuous homomorphism `f` maps `G^[n]` into `G'^[n]`, onto it when `f` is surjective and `G` is
compact and `G'` Hausdorff; a continuous isomorphism maps `G^[n]` onto `G'^[n]`
(`map_closedDerivedSeries`). So `G^n` is functorial, and continuous isomorphisms induce continuous
isomorphisms of every `G^n`.

*Needs:* 0.1; Mathlib's `Subgroup.map_derivedSeries_le_derivedSeries`, `Subgroup.map_derivedSeries_eq`
(`Mathlib/GroupTheory/Solvable.lean`) and compactness of images.

### 0.3 Quotients

For `G` compact and `m, n ≥ 0`, the image of `G^[m]` in `G^{m+n}` is `(G^{m+n})^[m]`
(`map_closedDerivedSeries_solvableQuotient`): `G^{m+n}` is Hausdorff because `G^[m+n]` is closed,
so 0.2 applies. Moreover `(G^{m+n})^m ≅ G^m` canonically; these are the
transition maps `G^{m+1} → G^m`. A profinite `G` has profinite solvable quotients.

*Needs:* 0.1, 0.2.

### 0.4 Closed subgroups above `G^[m]`

[Hyeon 2025, Lem. 2.3(1)]. If `H ≤ G` is closed and contains `G^[m]`, then `G^[m+n] ≤ H^[n]` for
every `n`, the closed derived series of `H` taken in `H` (`closedDerivedSeries_add_le`). By
induction on `n`, since `G^[m+n+1]` is the closure of `⁅G^[m+n], G^[m+n]⁆`. Consequently, with `H̄`
the image of `H` in `G^{m+n}` and `G` compact Hausdorff, the natural surjection `H^n → H̄^n` is an
isomorphism.

*Needs:* 0.1–0.3.

**Checks.**

- `G = S₃` discrete, `m = 1`, `H = A₃ = G^[1]`, `n = 1`: `H^[1] = ⊥` because `A₃` is abelian,
  and `G^[2] = ⊥ ≤ H^[1]`, while the unshifted `G^[1] = A₃ ≤ H^[1]` fails. The shift by `m` is
  needed.

### 0.5 The commutator of an intersection

For `G` profinite and `N` any subgroup,
`closure ⁅N, N⁆ = ⋂_U closure ⁅N·U, N·U⁆` over the open normal subgroups `U` of `G`
(`topologicalClosure_commutator_eq_iInf`). The inclusion `⊆` is monotonicity. For `⊇`, if `x` lies
in every `closure ⁅NU, NU⁆`, then `x ∈ ⁅NU, NU⁆·U = ⁅N, N⁆·U`, because `⁅NU, NU⁆·U` is open hence
closed and `⁅nu, n'u'⁆ ≡ ⁅n, n'⁆ mod U`; and `⋂_U ⁅N, N⁆·U = closure ⁅N, N⁆`. Equivalently
`(⋂ H)^ab = lim H^ab` over the open normal `H ⊇ N` [Hyeon 2025, proof of Prop. A.1].

*Needs:* Mathlib's `OpenNormalSubgroup`,
`ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one` and
`ProfiniteGrp.closedSubgroup_eq_sInf_open` (`Mathlib/Topology/Algebra/ClopenNhdofOne.lean`, stated
for `ProfiniteGrp` objects), from which the closure of a subgroup `A` of a profinite group is `⋂_U A·U` over the open normal `U`.

### 0.6 Divisibility in profinite abelian groups

For a profinite commutative group `A`, `⋂_{n ≥ 1} A^n = 1` (`iInf_range_powMonoidHom_eq_bot`): the
image of `x ∈ ⋂ A^n` in each finite quotient `A/U` is an `[A : U]`-th power there, hence trivial.

*Needs:* 0.5's description of closed subgroups through open normal subgroups.

**Checks.**

- `A = ℤ_p`: `⋂_n nℤ_p ⊆ ⋂_k p^kℤ_p = 0`.
- `A = ℚ_p` (totally disconnected, not compact): `nℚ_p = ℚ_p` for every `n ≥ 1`, so compactness
  cannot be dropped.
- `A = ℝ/ℤ` (compact, connected): every element is an `n`-th multiple, so total disconnectedness
  cannot be dropped.

### 0.7 Prosolvable groups

If `G` is profinite and every `G ⧸ U`, `U` open normal, is solvable, then `⋂_n G^[n] = 1`
(`iInf_closedDerivedSeries_eq_bot`): if `(G/U)^(k) = 1` then `G^[k] ≤ U`, because the image of
`G^[k]` lies in the closure of the image of `Subgroup.derivedSeries G k`, inside the finite discrete
`(G/U)^(k)`.

*Needs:* 0.1, 0.2; Mathlib's `IsSolvable`, `Subgroup.derivedSeries`.

**Checks.**

- `A₅` with the discrete topology: `U = ⊥` is open and `A₅` is not solvable, and indeed
  `G^[n] = A₅` for every `n`. The hypothesis cannot be weakened to "`G` profinite".

### 0.8 Centre-freeness passes to the limit

If `⋂_n G^[n] = 1` and `Z(G^m) = 1` for every `m ≥ m₀`, then `Z(G) = 1`
(`center_eq_bot_of_center_solvableQuotient_eq_bot`). A central element of `G` maps to a central
element of each `G^m`, so it lies in every `G^[m]`.

*Needs:* 0.1.

### Dependencies

Mathlib only. Layer 0 can be built in parallel with Layer 1.

## Layer 1: filtered topological groups

Let `G, G'` be topological groups with filtrations `F, F'`.

### 1.1 Filtrations

`GroupFiltration G`: `u ↦ G(u)`, antitone, closed, normal. The upper and lower limits
`G(u+) = closure ⋃_{w > u} G(w)` and `G(u−) = ⋂_{w < u} G(w)` are closed normal subgroups. A jump
is a `u` with `G(u+) ≠ G(u)` or `G(u−) ≠ G(u)`.

*Needs:* Mathlib's `Subgroup.topologicalClosure`, `Subgroup.Normal`.

### 1.2 Filtered and outer isomorphisms

`IsFiltered F F' S α` for `α : G ≃ₜ* G'`; closure under composition and inverse, the identity of
`(G, F)` is `S`-filtered, an `S'`-filtered isomorphism is `S`-filtered for `S ⊆ S'`, and
conjugation by any `g ∈ G'` is `S`-filtered for every `S` (`isFiltered_of_conj`).
`FilteredOut F F' S` is the quotient by `α ~ c_g ∘ α`; composition descends to `FilteredOut`,
which for `G = G'` is a group.

*Needs:* 1.1.

**Checks.**

- `G = G'` abelian with any filtration: inner automorphisms are trivial, so the quotient map from
  the `S`-filtered isomorphisms to `FilteredOut F F S` is a bijection.
- `G = G' = S₃` discrete with the filtration `G(u) = G` for every `u`: every automorphism is
  filtered and inner, so `FilteredOut F F S` has exactly one element.
- `G = G' = ℤ/4 × ℤ/2` (discrete) with `G(u) = ℤ/4 × 0` for `u ≤ 0` and `G(u) = 0` for `u > 0`:
  the automorphism `(a, b) ↦ (a + 2b, b)` preserves `ℤ/4 × 0`, while `(a, b) ↦ (a, b + (a mod 2))`
  does not; the first is `S`-filtered for every `S`, the second exactly when `S ⊆ (0, ∞)`. The
  index set matters.

### 1.3 Quotient filtrations

For `G` compact and `N` a closed normal subgroup, `(G/N)(u) = G(u)·N/N` is a filtration
(`GroupFiltration.quotient`): closed because the image of a compact set in the Hausdorff group
`G/N`. It is transitive, `(G/N)/(M/N) ≅ G/M` as filtered groups for `N ≤ M`, and an `S`-filtered
`α` with `α(N) = N'` induces an `S`-filtered `G/N ≃ₜ* G'/N'`. In particular every `S`-filtered `α`
induces `S`-filtered isomorphisms `G^m ≃ₜ* G'^m` (0.2) and of maximal pro-`p` quotients
(`map_proPKernel_eq`), compatible with the transition maps, and so maps
`FilteredOut(G, G'; S) → FilteredOut(G^m, G'^m; S)` with `m`-compatible composites.

*Needs:* 1.1, 1.2, 0.2; Tau Ceti's `TauCeti.proPKernel`, `TauCeti.map_proPKernel_eq`.

**Checks.**

- `N = G`: every step of the quotient filtration is the trivial group of `G/G`.
- `G = ℤ/4` discrete, `G(u) = G` for `u ≤ 0`, `G(u) = 2ℤ/4` for `0 < u ≤ 1`, `G(u) = 0` for
  `u > 1`, and `N = 2ℤ/4`: the quotient filtration of `G/N ≅ ℤ/2` is `ℤ/2` for `u ≤ 0` and trivial
  for `u > 0`. The jump of `G` at `1` disappears, the one at `0` survives.

### 1.4 Herbrand functions of an open subgroup

For `G` compact and `H` open, `f_H`, `ψ_H` and `φ_H` as in the conventions
(`GroupFiltration.herbrandPsi`, `GroupFiltration.herbrandPsiOrderIso`). `t ↦ [G : G(t)·H]` is
monotone with values in `[f_H, [G : H]]` for `t ≥ 0`, so `ψ_H` is piecewise linear when the
filtration has finitely many jumps in each bounded interval, and in general continuous, strictly
increasing (slope at least `1`) and unbounded in both directions
(`GroupFiltration.strictMono_herbrandPsi`, `GroupFiltration.surjective_herbrandPsi`). `ψ_H` and
`φ_H` depend only on `H` and the `G(t)`, `t ≥ 0`. For `H = G`, `ψ_G = id`. Tower law: for open
`H' ≤ H ≤ G`, `ψ_{H'} = ψ^H_{H'} ∘ ψ_H`, where `ψ^H_{H'}` is computed in `H` for the restricted
filtration of 1.5.

*Needs:* 1.1; Mathlib's `intervalIntegral`, `Subgroup.index`, `StrictMono.orderIsoOfSurjective`.

**Checks.**

- `H = G`: `ψ_G = id`.
- `G` finite discrete, `G(t) = G` for `t < 0` and `G(t) = 1` for `t ≥ 0`, `H` of index `f`:
  `f_H = f = [G : G(t)·H]` for every `t ≥ 0`, so `ψ_H = id`; the variant without the factor
  `1/f_H` gives `f·u` for `u ≥ 0`. This is the unramified pattern of 2.2.
- `G = ℤ/2` discrete, `G(t) = G` for `t ≤ 0` and `G(t) = 1` for `t > 0`, `H = 1`: `f_H = 1` and
  `ψ_H(u) = 2u` for `u ≥ 0`. This is the tame pattern of `ℚ_3(ζ_3)/ℚ_3`; here `f_H = 1`, so it
  does not separate the two variants.

### 1.5 Restriction to an open subgroup

`F.restrict H` is the filtration `H(w) = G(φ_H(w)) ∩ H` of `H` (`GroupFiltration.restrict`). For
an open `H` with `N ≤ H` closed normal in `G`, restriction commutes with quotients: `(G/N)`
restricted to `H/N` is `(F.restrict H)` taken modulo `N`. Here `[G/N : (G/N)(t)·(H/N)]` equals
`[G : G(t)·H]`, and `(G(v)·N) ∩ H = (G(v) ∩ H)·N` by the modular law. If `α` is `S`-filtered with
`[0, ∞) ⊆ S` and `α(H) = H'`, then `ψ_{H'} = ψ_H` and `α|_H : H ≃ₜ* H'` is `ψ_H(S)`-filtered
(`exists_isFiltered_restrict`), in particular `[0, ∞)`-filtered.

*Needs:* 1.3, 1.4.

**Checks.**

- `H = G`: `F.restrict G` is `F`, read on `⊤ ≅ G`, since `φ_G = id`.
- In the unramified pattern of 1.4, `φ_H = id` and `H(w) = G(w) ∩ H`.

### Dependencies

1.1–1.2 need Mathlib only; 1.3 needs 0.2 and Tau Ceti's pro-`p` kernel. Layer 1 can be built in
parallel with Layer 0.

## Layer 2: the upper filtration on local Galois groups

Let `K` be a nonarchimedean local field and `F_K` the upper filtration of `G_K`, as in the
conventions.

### 2.0 The open-subgroup model

For a finite separable subextension `L` of `AlgebraicClosure K`, an isomorphism of topological
groups `Field.absoluteGaloisGroup L ≃ₜ* L.fixingSubgroup` whose composite with the inclusion into
`G_K` is `absoluteGaloisGroupExtend K L σ` for the embedding `σ` of `L` into `SeparableClosure K`
induced by the inclusion (`exists_continuousMulEquiv_fixingSubgroup`). Tau Ceti's
`absoluteGaloisGroupExtendEquiv K L σ hU` is such an isomorphism onto any `U` with
`(absoluteGaloisGroupExtend K L σ).range = U`, with `coe_absoluteGaloisGroupExtendEquiv_apply`
for the compatibility, so what is left is the equality of subgroups
`(absoluteGaloisGroupExtend K L σ).range = L.fixingSubgroup`
(`range_absoluteGaloisGroupExtend_eq_fixingSubgroup`). Tau Ceti's
`map_range_absoluteGaloisGroupExtend` computes the range in the separable-closure model as
`σ.fieldRange.fixingSubgroup`; its transport along `absoluteGaloisGroupRestrictEquiv K` is
`L.fixingSubgroup` because `σ` is induced by the inclusion. For every `L`-embedding `ι`
of `AlgebraicClosure K` into `AlgebraicClosure L`, Mathlib's
`Field.absoluteGaloisGroup.mapOfAlgebra K L`, through which
RamificationOfCompleteDiscretelyValuedFields §4a.2 reads `G_L` in `G_K`, is injective with image
`L.fixingSubgroup`, and it differs from this model by conjugation by an element of
`L.fixingSubgroup`: two `L`-isomorphisms between the algebraic closures differ by an element of
`G_L`. So statements about normal subgroups of `G_L` do not depend on the model.

*Needs:* Tau Ceti's `absoluteGaloisGroupExtendEquiv`, `coe_absoluteGaloisGroupExtendEquiv_apply`,
`map_range_absoluteGaloisGroupExtend`, `absoluteGaloisGroupRestrictEquiv`,
`absoluteGaloisGroupEquivFixingSubgroup`, `galoisSubgroupEquiv`, `absoluteGaloisGroupExtend`,
`injective_absoluteGaloisGroupExtend`, `continuous_absoluteGaloisGroupExtend` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/`) and
`TauCeti.absoluteGaloisGroup_mapOfAlgebra_commutes` (`AbsoluteGaloisGroup/Map.lean`); Mathlib's
`IntermediateField.fixingSubgroup`.

### 2.1 The filtration on `G_K` and its quotients

`F_K` is the `GroupFiltration` with steps ClassFieldTheory Layer 7's
`localAbsoluteUpperRamificationGroup K u` for `u ≥ −1`, and `G_K` for `u < −1`. Its API is that of
ClassFieldTheory Layer 7: closed and normal steps, antitone, `G_K(−1) = G_K`, separated (trivial
intersection), `G_K(0)` inertia and `G_K(0+)` wild inertia, and surjective onto the finite upper
groups. This roadmap does not define a second absolute upper filtration; the valuation-subring
filtration of RamificationOfCompleteDiscretelyValuedFields §4a.1 agrees with it on a local field
(§4a.1, fourth bullet). For a Galois subextension `E` of `AlgebraicClosure K`, the quotient
filtration through `G_K/E.fixingSubgroup ≅ Gal(E/K)` is the upper filtration of `Gal(E/K)`, and
for `E` finite it is `TauCeti.LocalFieldsRamification.upperRamificationGroup` on
`RamificationIndexDomain` (ClassFieldTheory Layer 7, the surjections onto the finite levels); the
identification `G_K/E.fixingSubgroup ≅ Gal(E/K)` is Mathlib's `AlgEquiv.restrictNormalHom`,
surjective because `AlgebraicClosure K` is normal over `K`. The maximal unramified extension is an
example: its `G(u)` is trivial for `u ≥ 0`. The solvable quotients and the maximal pro-`p` quotient
are filtered directly, as `F_K.quotient (closedDerivedSeries G_K m)` on `G_K^m` (in particular on
`G_K^ab`) and `F_K.quotient (proPKernel p G_K)` on `G_K(p)`, with no field-theoretic model.

*Needs:* 1.1, 1.3; ClassFieldTheory Layer 7 (the absolute upper filtration and its API); Tau
Ceti's `TauCeti.proPKernel`, `TauCeti.maximalUnramifiedExtension`.

**Checks.**

- At an unramified cubic finite level, the image of `G_K(−1)` has order `3` and that of `G_K(0)`
  is trivial.
- `K = ℚ_2` and `M = ℚ_2(μ_8)`, with `Gal(M/K) = (ℤ/8)ˣ`: the image of `G_K(u)` is everything for
  `u ≤ 1`, `{1, 5}` for `1 < u ≤ 2`, and trivial for `u > 2` (ClassFieldTheory Layer 7, Checks on
  the absolute upper filtration). A constant inertia filtration would fail at `u = 2`.
- In the tame splitting field of `X³ − 5` over `ℚ_5`, with group `S₃`, the images of
  `G_K(−1)`, `G_K(0)`, `G_K(1)` are `S₃`, `C₃` and `1`. `G_K(0)` maps onto `C₃` in `S₃` but
  trivially to `S₃^ab`, so the quotient filtration on `G_K^1` is strictly coarser than the one on
  `G_K^2`.

### 2.2 Open subgroups

For finite separable `L ⊆ AlgebraicClosure K`, with `H = L.fixingSubgroup`: `f_H = f(L/K)`,
`ψ_H = ψ_{L/K}` and `φ_H = φ_{L/K}`, and `F_K.restrict H` is the upper filtration of `G_L`
transported by 2.0. `G_K(0)·G_L` fixes `L ∩ K^ur`, the maximal unramified subextension of `L`,
which has degree `f(L/K)` (`Unramified/`). With that, the integral formula of
RamificationOfCompleteDiscretelyValuedFields §4a.2 gives `ψ_H = ψ_{L/K}`, and its open-subgroup
identity, read through 2.0 and §4a.1's agreement with 2.1, gives `G_L(w) = G_K(φ_{L/K}(w)) ∩ G_L`.
So **a filtered isomorphism `G_K ≃ₜ* G_{K'}` restricts to filtered isomorphisms of the absolute
Galois groups of corresponding finite extensions** (1.5).

*Needs:* 1.5, 2.0, 2.1; RamificationOfCompleteDiscretelyValuedFields §4a.2; Tau Ceti's
`TauCeti.maximalUnramifiedExtension` and the factorization through the maximal unramified
subextension (`TauCeti/NumberTheory/LocalField/Unramified/`).

**Checks.**

- `L/K` unramified of degree `f`: `f_H = f = [G_K : G_K(t)·G_L]` for every `t ≥ 0`, so
  `ψ_H = id` and `G_L(w) = G_K(w) ∩ G_L`.
- `K = ℚ_3`, `L = ℚ_3(ζ_3)`: `f_H = 1`, and `[G_K : G_K(t)·G_L] = 2` for `t > 0` (the image of
  `G_K(t)` in `Gal(L/K)` is trivial since `L/K` is tame), so `ψ_H(u) = 2u` for `u ≥ 0` and
  `G_L(w) = G_K(w/2) ∩ G_L`.

### 2.3 Descent along solvable extensions

[Hyeon 2025, Lems. 2.1 and 2.3(2)]. Let `m, n ≥ 0` and `L` finite separable over `K` lying in
`K^m`, and let `H` be the image of `L.fixingSubgroup` in `G_K^{m+n}`, an open subgroup containing
`(G_K^{m+n})^[m]`. Then `G_L^[n] ⊇ G_K^[m+n]` (0.4), `H^n ≅ G_L^n` canonically, and under this
isomorphism the filtration `((F_K.quotient G_K^[m+n]).restrict H).quotient H^[n]` is the upper
filtration of `G_L^n` (2.1, 2.2 and the compatibility of restriction with quotients, 1.5).
Consequently, an `S`-filtered `α : G_K^{m+n} ≃ₜ* G_{K'}^{m+n}` with `[0, ∞) ⊆ S` and `α(H) = H'`,
where `H'` is the image of `L'.fixingSubgroup` for a finite separable `L'` lying in `K'^m`, induces
a `[0, ∞)`-filtered `G_L^n ≃ₜ* G_{L'}^n`. This is the form in which the `m`-step anabelian theorems
pass to finite extensions.

*Needs:* 0.4, 1.5, 2.2.

**Checks.**

- `K = ℚ_p`, `m = n = 1` and `L = ℚ_p(μ_p) ⊆ K^1`: `Gal(K^2/L)^1 = G_L^ab`, and a
  `[0, ∞)`-filtered automorphism of `G_K^2` that preserves `Gal(K^2/L)` induces a
  `[0, ∞)`-filtered automorphism of `G_L^ab`.

### 2.4 Outer isomorphisms of local Galois groups

`Out_Filt(G_K, G_{K'}; S)` and `Out_Filt(G_K^m, G_{K'}^m; S)` with the maps between them of 1.3,
and the map `K ≃+* K' ↦ Out_Filt(G_K, G_{K'}; [0, ∞))` on continuous field isomorphisms. An
extension `ẽ` of `e` to the algebraic closures conjugates `G_K` onto `G_{K'}`, and the outer class
does not depend on `ẽ`. It is filtered by ClassFieldTheory Layer 7's transport of the absolute
upper filtration along a continuous field isomorphism and an extension to algebraic closures. Its
composites with the maps to `G_K^m` and `G_K(p)`.

*Needs:* 1.2, 1.3, 2.1; ClassFieldTheory Layer 7 (transport of the absolute upper filtration).

### Dependencies

Layer 1, ClassFieldTheory Layer 7 and RamificationOfCompleteDiscretelyValuedFields §4a.2; 2.3 also
needs 0.4.

## Layer 3: the abelianization in coordinates and centre-freeness

Let `K` be a finite extension of `ℚ_p`, with the hypotheses of the conventions.

### 3.1 Coordinates on `G_F^ab`

For a finite extension `F` of `ℚ_p` with uniformizer `ϖ`, the map `𝒪_F^× × Ẑ → G_F^ab`,
`(u, a) ↦ Art_F(u) · Art_F(ϖ)^ᶻ a`, is an isomorphism of topological groups
(`artinCoordinateHom`, `exists_continuousMulEquiv_artinCoordinateHom`). It is a continuous
homomorphism, `zHat.lift` being continuous. Its image is compact, `𝒪_F^×` and `Ẑ` being compact,
hence closed, and contains `Art_F(Fˣ) = Art_F(𝒪_F^×)·Art_F(ϖ)^ℤ`, which is dense
(`denseRange_artinMap`); so it is surjective. If `Art_F(u)·Art_F(ϖ)^ᶻ a = 1`, the unramified
coordinate gives `a = 0` (`unramifiedCoordinate_artinMap`), and then `u = 1` (`injective_artinMap`).
It is a continuous bijection from a compact space to a Hausdorff one. It is Tau Ceti's
`profiniteCompletionArtinEquiv`, the isomorphism `(Fˣ)^ ≅ G_F^ab` of the profinite completion,
read in the coordinates `Fˣ = 𝒪_F^× × ϖ^ℤ`.

*Needs:* ClassFieldTheory: Tau Ceti's `artinMap`, `continuous_artinMap`, `denseRange_artinMap`,
`unramifiedCoordinate_artinMap`, `injective_artinMap` (`[CharZero K]`); Tau Ceti's
`TauCeti.zHat.lift`, `TauCeti.IsUniformizer`.

**Checks.**

- `F = ℚ_p`, `ϖ = p`: `artinCoordinateHom` followed by the cyclotomic character sends `(u, a)` to
  `u⁻¹`, and followed by `unramifiedCoordinate` sends it to `a`.
- `ϖ = p²` is not a uniformizer of `ℚ_p`: the unramified coordinate of the image of `(u, a)` is
  `2a`, so the map is not surjective. The hypothesis `IsUniformizer K ϖ` cannot be dropped.

### 3.2 Galois action and norms in coordinates

For `F/E` finite Galois inside `AlgebraicClosure K` and `τ ∈ G_E`, conjugation by `τ` on `G_F^ab`
is `Art_F(x) ↦ Art_F(τ x)` (`artinMap_congr` with `e = τ|_F`, `e' = τ`; `e` is continuous by
`AlgEquiv.continuous_of_valuativeExtension`,
`TauCeti/NumberTheory/LocalField/AlgebraicExtension/Basic.lean`). The map `G_F^ab → G_E^ab`
induced by `G_F ≤ G_E` is `Art_F(x) ↦ Art_E(N_{F/E} x)` (`artinMap_norm`). Both are read through
2.0, which identifies the algebraic closures of `E` and `F` with `AlgebraicClosure K` and their
absolute Galois groups with fixing subgroups. Both commute with `^ᶻ`, being continuous
homomorphisms.

*Needs:* 2.0, 3.1; Tau Ceti's `artinMap_congr`, `artinMap_norm`.

### 3.3 The centre lies in the top layer

[Hyeon 2025, Lem. A.2]. For `m ≥ 0`, `Z(G_K^{m+1}) ≤ Gal(K^{m+1}/K^m) = G_K^[m]/G_K^[m+1]`
(`center_solvableQuotient_succ_le`). Let `z` be central with lift `z̃ ∈ G_K` and `L ⊆ K^m` finite
Galois over `K`. Then `G_L ⊇ G_K^[m]`, so `closure ⁅G_L, G_L⁆ ⊇ G_K^[m+1]`, and conjugation by `z̃`
is the identity on `G_L^ab`. By 3.2, `Art_L(z̃ x) = Art_L(x)`, so `z̃` fixes `L`
(`injective_artinMap` for `L`). `K^m` is the union of such `L`.

*Needs:* 0.4, 3.2; `injective_artinMap`.

**Checks.**

- `m = 0`: `Z(G_K^1) = G_K^1 = G_K^[0]/G_K^[1]`, so the inclusion is an equality there.

### 3.4 Centre-freeness of `G_K^m`, `m ≥ 2`

[Hyeon 2025, Prop. A.1] (`center_solvableQuotient_eq_bot`). Let `m ≥ 1` and `z ∈ Z(G_K^{m+1})`
with lift `z̃`, so `z̃ ∈ G_K^[m]` by 3.3. For each finite Galois `L ⊆ K^m`, let `z_L` be the image
of `z̃` in `G_L^ab`. It is well defined, fixed by conjugation by `G_K`, and `z_{L'} ↦ z_L` under the
map induced by `G_{L'} ≤ G_L` for `L ⊆ L'`. Fix `L` and `n ≥ 1`, and let `L'` be the unramified
extension of `L` of degree `n`: `L' = L·K'`, with `K'` the unramified extension of `K` of degree
`n·f(L/K)`. It is Galois over `K` and lies in `K^m`, since `K' ⊆ K^ab ⊆ K^m` because `m ≥ 1`.
This is the only use of `m ≥ 1`. A uniformizer `ϖ` of `L` is one of `L'`. By 3.1,
`z_{L'} = Art_{L'}(u)·Art_{L'}(ϖ)^ᶻ a`. By 3.2, invariance under `τ ∈ G_L` gives
`Art_{L'}(τu)·Art_{L'}(ϖ)^ᶻ a = Art_{L'}(u)·Art_{L'}(ϖ)^ᶻ a`, so `τu = u` by 3.1 and `u ∈ 𝒪_L^×`.
Then `z_L` is the image of `z_{L'}`, which is
`Art_L(N_{L'/L} u)·Art_L(N_{L'/L} ϖ)^ᶻ a = (Art_L(u)·Art_L(ϖ)^ᶻ a)^n`. So `z_L ∈ ⋂_n (G_L^ab)^n`,
which is trivial (0.6). Hence
`z̃ ∈ ⋂_L closure ⁅G_L, G_L⁆ = closure ⁅G_K^[m], G_K^[m]⁆ = G_K^[m+1]` (0.5), and `z = 1`. The
unramified extension keeps the uniformizer, so this route needs no Galois descent for the profinite
completion of `L'^×` along an arbitrary finite Galois `L'/L`, which [Hyeon 2025, Lem. A.3(3)]
proves with Hilbert 90.

*Needs:* 0.5, 0.6, 3.1–3.3; Tau Ceti's `TauCeti.unramifiedExtension`.

**Checks.**

- `m = 1` is excluded: `G_K^1 = G_K^ab` is abelian and nontrivial, so `Z(G_K^1) = G_K^1`; 3.3
  holds there with `K^0 = K`, and the proof of 3.4 fails because there is no unramified `L'`
  inside `K^0`.
- `Gal(ℚ_p(μ_{p²})/ℚ_p) ≅ (ℤ/p²)ˣ` is abelian and nontrivial, a quotient of every `G_{ℚ_p}^m` with
  `m ≥ 1`; centre-freeness of `G_K^m` is not a statement about its finite quotients.

*Remark.* With 0.7, applied through Tau Ceti's
`TauCeti.LocalFieldsRamification.isSolvable_algEquiv` to the finite quotients of `G_K`, and 0.8,
3.4 gives `Z(G_K) = 1` for `K/ℚ_p` finite in two lines. That statement is owned by
AnabelianGeometryAndNonabelianChabauty (see *Scope and ownership*) and is not a target here.

### Dependencies

Layer 0, 2.0, ClassFieldTheory (Tau Ceti's absolute Artin map and its injectivity
`injective_artinMap` in characteristic zero). Layer 3 does not need Layer 1 or 2.1–2.4.

## Worked examples

- **Quotient filtration at infinite level.** On `Gal(ℚ_p(μ_{p^∞})/ℚ_p) ≅ ℤ_p^×` (the cyclotomic
  character), the quotient filtration is `ℤ_p^×` for `u ≤ 0` and `1 + p^n ℤ_p` for
  `n − 1 < u ≤ n`, `n ≥ 1`. The filtration factors through `G_{ℚ_p}^ab` by transitivity (1.3). At
  an integer `n ≥ 1` the image of `G_{ℚ_p}(n)` is `χ_cyc(Art(U^(n))) = 1 + p^n ℤ_p`, by
  ClassFieldTheory Layer 7's absolute unit-filtration reciprocity `map_artinMap_unitFiltration_eq_upper`
  and the cyclotomic normalization `localCyclotomicCharacter_artinMap_padic`. Between integers it
  is constant, by Hasse–Arf at the finite abelian levels. The jumps are at `1, 2, …`, and also at
  `0` when `p` is odd; for `p = 2`, `1 + 2ℤ_2 = ℤ_2^×`.

## Downstream consumers

LocalAnabelianGeometry consumes all four layers: the closed derived series and solvable quotients
(Layer 0), filtered groups, `Out_Filt`, quotient filtrations and restriction (Layer 1), the upper
filtration on `G_K` and `G_K^m` with restriction, descent and the map from field isomorphisms
(Layer 2), and the coordinates and centre-freeness of `G_K^m` (Layer 3), for the filtered and
`m`-step solvable local Grothendieck conjectures. FieldOfNorms consumes Layers 1 and 2, the
filtered groups and Herbrand functions of an open subgroup and the upper filtration on Galois
groups of subextensions, for arithmetically profinite extensions and their fields of norms.

## Scope and ownership

This roadmap owns:

- the closed derived series `G^[n]` of a topological group, the solvable quotients
  `G^n = G/G^[n]`, and their basic theory: functoriality, the derived series of a quotient, the
  derived series of a closed subgroup above `G^[m]`, the limit formula for the closed commutator
  subgroup of an intersection, the criterion `⋂_n G^[n] = 1` for prosolvable groups and the
  passage of centre-freeness from every `G^m` to `G`;
- filtrations of topological groups, filtered isomorphisms relative to an index set, `Out_Filt`,
  quotient filtrations, restriction of a filtration to an open subgroup, and the Herbrand
  functions of an open subgroup;
- the packaging of the absolute upper filtration as a filtration of `G_K` and of its quotients,
  the identification of restriction with the upper numbering of finite extensions, and the
  descent of filtered isomorphisms along `m`-step solvable extensions;
- the coordinate description `G_F^ab ≅ 𝒪_F^× × Ẑ` of the abelianized absolute Galois group of a
  finite extension of `ℚ_p` attached to a uniformizer, the centre of `G_K^{m+1}`, and
  centre-freeness of `G_K^m` (`m ≥ 2`) for finite extensions of `ℚ_p`. The coordinate
  description is the profinite completion of local reciprocity written in coordinates attached to
  a uniformizer; the isomorphism with the profinite completion of `Kˣ` is Tau Ceti's
  `profiniteCompletionArtinEquiv` and is not restated here.

Nothing in Mathlib or Tau Ceti defines the closed derived series, solvable quotients of topological
groups, filtrations of groups, filtered or outer filtered isomorphisms, Herbrand functions of an
open subgroup of an abstract filtered group, the upper filtration on `G_K^m` or `G_K(p)`, or the
coordinates `G_F^ab ≅ 𝒪_F^× × Ẑ`.

It does not own:

- **The absolute upper filtration** of a nonarchimedean local field, with its API (closed normal
  steps, inertia, wild inertia, finite projections, transport along field isomorphisms):
  ClassFieldTheory Layer 7 (`localAbsoluteUpperRamificationGroup`), in both characteristics. Its
  general form over a complete discretely valued field with perfect residue field, and its
  agreement with ClassFieldTheory's on a local field:
  [RamificationOfCompleteDiscretelyValuedFields](../RamificationOfCompleteDiscretelyValuedFields/README.md)
  §4a.1.
- **`ψ_{L/K}` of finite separable extensions**, its tower law, the open-subgroup identity
  `G_K^u ∩ G_L = G_L^{ψ_{L/K}(u)}` and the integral formula:
  RamificationOfCompleteDiscretelyValuedFields §4a.2.
- **Finite-level ramification**: lower and upper ramification groups of a finite Galois extension,
  Herbrand functions, Herbrand's theorem on quotients and Hasse–Arf: the
  [local fields and ramification roadmap](../../Completed/LocalFieldsRamification/README.md).
- **Local class field theory**: the absolute local Artin map, its norm functoriality, naturality,
  unramified coordinate and injectivity, and absolute unit-filtration reciprocity:
  [ClassFieldTheory](../ClassFieldTheory/README.md) Layers 7 and 8.
- **Pro-`p` groups**, the maximal pro-`p` quotient and the Demushkin structure of `G_K(p)`: the
  [profinite pro-`p` groups roadmap](../../Completed/ProfiniteProPGroups/README.md) and the
  [local Galois groups roadmap](../../Completed/LocalGaloisGroups/README.md).
- **Centre-freeness of `G_K`**, `Z(G_K) = 1` for `K/ℚ_p` finite:
  [AnabelianGeometryAndNonabelianChabauty](../AnabelianGeometryAndNonabelianChabauty/README.md)
  §3.5, "Local Galois centre-freeness", together with centre-freeness of the absolute Galois group
  of a finitely generated extension of `ℚ_p` and of geometric fundamental groups.
- **The anabelian theorems**: Mochizuki's theorem, its `m`-step solvable form, and the
  reconstruction of the cyclotomic character, inertia, the additive module `K^m` and the
  Hodge–Tate numbers from filtered groups: LocalAnabelianGeometry.
- **Local fields of positive characteristic** in Layer 3. Layers 0–2 hold for every
  nonarchimedean local field. Layer 3 needs the injectivity of the absolute local Artin map, which
  ClassFieldTheory states in characteristic zero only, and is stated for finite extensions of
  `ℚ_p`.

## Exact supplier contracts

### From RamificationOfCompleteDiscretelyValuedFields

- **§4a.1, agreement.** On a nonarchimedean local field, for the valuation subring lying over
  `𝒪[K]`, the absolute upper filtration of §4a.1 is ClassFieldTheory Layer 7's
  `localAbsoluteUpperRamificationGroup K u` at every `u ≥ −1`.
- **§4a.2, open subgroups.** For finite separable `L/K` inside `AlgebraicClosure K`: `ψ_{L/K}` on
  `[−1, ∞)`, continuous, strictly increasing, the identity on `[−1, 0]`, with the tower law; the
  open-subgroup identity `G_K^u ∩ G_L = G_L^{ψ_{L/K}(u)}`, with `G_L` read in `G_K` through
  `Field.absoluteGaloisGroup.mapOfAlgebra K L`; and the integral formula
  `ψ_{L/K}(u) = (1/f) ∫_0^u [G_K : G_K^t G_L] dt` for `u ≥ 0`, `f = f(L/K)`.

### From ClassFieldTheory

Layer 7, the absolute upper filtration (`localAbsoluteUpperRamificationGroup K v`, every
nonarchimedean local field, `v ≥ −1`): each step closed and normal, antitone, `G_K^(−1) = G_K`,
trivial intersection, `G_K^0` Tau Ceti's `TauCeti.inertiaSubgroup` and the closure of
`⋃_{v > 0} G_K^v` Tau Ceti's `TauCeti.wildInertiaSubgroup`, restriction onto
`TauCeti.LocalFieldsRamification.upperRamificationGroup K M v` for every finite Galois
`M : FiniteGaloisIntermediateField K (AlgebraicClosure K)` and onto the inverse-image filtration of
every algebraic Galois `E/K`, and transport along a continuous field isomorphism with an extension
to algebraic closures.

Implemented in Tau Ceti (`TauCeti/NumberTheory/ClassFieldTheory/Local/` and
`LocalExistence/ArtinMap.lean`):

- `TauCeti.ClassFieldTheory.artinMap K : Kˣ →* Field.absoluteGaloisGroupAbelianization K`, with
  `continuous_artinMap`, `denseRange_artinMap`;
- **norm functoriality** `artinMap_norm`: for `L/K` finite, embedded by `iota`, the image of
  `Art_L(x)` under `absoluteGaloisGroupExtend K L iota` is `Art_K(N_{L/K} x)`;
- **naturality** `artinMap_congr`: a continuous `e : K ≃+* K'`, extended to the algebraic
  closures by `e'`, carries `Art_K(x)` to `Art_{K'}(e x)`, conjugation by `e'` acting on the
  abelianizations;
- **the unramified coordinate** `TauCeti.unramifiedCoordinate K : G_K^ab →ₜ* zHat`, with
  `unramifiedCoordinate_artinMap`: the coordinate of `Art_K(x)` is the normalized valuation of `x`;
- **injectivity** `injective_artinMap` under `[CharZero K]` (ClassFieldTheory Layer 8), and
  `profiniteCompletionArtinEquiv` under `[CharZero K]`: the extension of `artinMap` to an
  isomorphism of topological groups from the profinite completion of `Kˣ` onto `G_K^ab`.

Used only in the worked examples: the cyclotomic normalization
`TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_padic`, and Layer 7's absolute
unit-filtration reciprocity `map_artinMap_unitFiltration_eq_upper`: for every integer `n ≥ 0`, the
image of `U_K^(n)` under `Art_K` is the image of `G_K(n)` in `G_K^ab`.

### From the local fields and ramification roadmap, implemented in Tau Ceti

- **Finite-level upper numbering**: `TauCeti.LocalFieldsRamification.upperRamificationGroup K L v`
  on `L ≃ₐ[K] L` for `v : RamificationIndexDomain` (`Set.Ici (−1 : ℝ)`), with Herbrand's theorem
  on quotients `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean`).
- **Solvability**: `TauCeti.LocalFieldsRamification.isSolvable_algEquiv`, the Galois group of a
  finite Galois extension of nonarchimedean local fields is solvable (`Solvable.lean`).
- **Unramified extensions**: `TauCeti.unramifiedExtension K Ω f`, unique of each degree in a
  separably closed `Ω`, with `TauCeti.maximalUnramifiedExtension` and the factorization of a finite
  extension through its maximal unramified subextension (`Unramified/`).
- **Structure adapters** `finiteIntermediateFieldValuativeRel`, `finiteIntermediateFieldTopology`
  and their companions, which make a finite subextension a local field.

### From the profinite pro-`p` groups and local Galois groups roadmaps, implemented in Tau Ceti

- `TauCeti.maximalProPQuotient p G`, `TauCeti.proPKernel p G` and `map_proPKernel_eq`: a
  continuous isomorphism carries the pro-`p` kernel onto the pro-`p` kernel.
- `TauCeti.absoluteGaloisGroupProP p K`, the maximal pro-`p` quotient of
  `Field.absoluteGaloisGroup K`.
- `TauCeti.zHat`, `TauCeti.zHat.lift` and `TauCeti.zpowHat`, the profinite power `x ^ᶻ a`.

### From Mathlib and the rest of Tau Ceti

- `Subgroup.derivedSeries`, `commutator`, `Subgroup.topologicalClosure`, `TopologicalAbelianization`,
  `Subgroup.center`, `OpenNormalSubgroup`, `IntermediateField.fixingSubgroup`,
  `Field.absoluteGaloisGroup.mapOfAlgebra` and the infinite Galois correspondence
  (`Mathlib/FieldTheory/Galois/Infinite.lean`).
- Tau Ceti's `absoluteGaloisGroupRestrictEquiv`, `absoluteGaloisGroupEquivFixingSubgroup`,
  `galoisSubgroupEquiv` and `absoluteGaloisGroupExtend`
  (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/`), which compare the algebraic and separable
  closure models and realize `G_L` inside `G_K`, and `TauCeti.absoluteGaloisGroup_mapOfAlgebra_commutes`.
- Tau Ceti's `TauCeti.IsUniformizer` on `Kˣ`.

## References

- S. Mochizuki, *A version of the Grothendieck conjecture for p-adic local fields*, Internat. J.
  Math. **8** (1997), 499–506 — Def. 2.3 (filtered groups, `v > 0`), Thm. 4.2.
- S.-H. Hyeon, *The m-step solvable anabelian geometry of mixed-characteristic local fields*,
  J. London Math. Soc. (2) **112** (2025), e70402 — §2 (filtered profinite groups, `Out_Filt`,
  Lems. 2.1 and 2.3), Appendix A (Lem. A.2, Prop. A.1).
- J.-P. Serre, *Local Fields*, GTM 67 — IV §§1–3 (Herbrand functions, Prop. 14 on quotients),
  XI §3 (functoriality of reciprocity).
- S. Ladkani, *On nilpotency problems in metabelian extensions of local fields*, Master's thesis,
  Hebrew University of Jerusalem, 1996 — the case `m = 1` of [Hyeon 2025, Prop. A.1].
- M. Saïdi and A. Tamagawa, *The m-step solvable anabelian geometry of number fields*, J. reine
  angew. Math. **789** (2022), 153–186 — the global analogue; Prop. 1.1(ix) gives the induction
  from `m = 1`.
