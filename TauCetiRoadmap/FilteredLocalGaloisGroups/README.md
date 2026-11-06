# Roadmap: filtered local Galois groups and their solvable quotients

The anabelian theorems for local fields are statements about **filtered** profinite groups: the
absolute Galois group `G_K` of a local field, or one of its quotients, together with the upper
ramification filtration. Mochizuki's theorem [Mochizuki 1997, Thm. 4.2] says that, for finite
extensions `K, K'` of `ℚ_p`, every isomorphism `G_K ≅ G_{K'}` that respects the filtrations is,
up to an inner automorphism, induced by a unique field isomorphism. The `m`-step solvable form
[Hyeon 2025, Thms. 1.4–1.5] replaces `G_K` by its maximal `m`-step solvable quotient
`G_K^m = G_K/G_K^[m]`, filtered by the image of the upper filtration. Both statements need the
same scaffolding first, and this roadmap builds it:

- the **closed derived series** of a topological group and its **solvable quotients**;
- **filtered topological groups**, their filtered isomorphisms and outer isomorphisms
  `Out_Filt(G, G')`, the filtration induced on a quotient, and the filtration induced on an open
  subgroup through group-theoretic Herbrand functions;
- the upper filtration on **local Galois groups**: on `G_K`, on `Gal(F/K)` for every Galois
  `F/K`, on `G_K^m` and on the maximal pro-`p` quotient `G_K(p)`, and the descent of filtered
  isomorphisms of `G_K^{m+n}` to filtered isomorphisms of `G_L^n` for finite separable `L` lying in `K^m`;
- **centre-freeness**: for `K/ℚ_p` finite, `G_K^m` has trivial centre for every `m ≥ 2`
  [Hyeon 2025, Prop. A.1], and hence so does `G_K`.

The local Grothendieck conjecture itself, and the reconstruction of field invariants from filtered
groups, are not here; see *Scope*.

Suggested homes: `TauCeti/Topology/Algebra/Group/Filtration/` for Layers 0 and 1, and
`TauCeti/NumberTheory/LocalField/FilteredGaloisGroup/` for Layers 2 and 3.

## Scope

This roadmap owns:

- the closed derived series `G^[n]` of a topological group, the solvable quotients
  `G^n = G/G^[n]`, and their basic theory: functoriality, the derived series of a quotient, the
  derived series of a closed subgroup above `G^[m]`, the limit formula for the closed commutator
  subgroup of an intersection, and the criterion `⋂_n G^[n] = 1` for prosolvable groups;
- filtrations of topological groups, filtered isomorphisms relative to an index set, `Out_Filt`,
  quotient filtrations, restriction of a filtration to an open subgroup, and the Herbrand
  functions of an open subgroup;
- the identification of these constructions, on local Galois groups, with the upper numbering of
  the ramification roadmaps, and the descent of filtered isomorphisms along `m`-step solvable
  extensions;
- the coordinate description `G_F^ab ≅ 𝒪_F^× × Ẑ` of the abelianized absolute Galois group of a
  finite extension of `ℚ_p` attached to a uniformizer, and centre-freeness of `G_K^m` (`m ≥ 2`)
  and of `G_K` for finite extensions of `ℚ_p`. The coordinate description is the profinite
  completion of local reciprocity written in coordinates attached to a uniformizer. It is proved
  in Layer 3 from the named statements of the class field theory roadmap, and the comparison with
  the profinite completion of `Kˣ` listed there is not restated here.

It does not own:

- **The absolute upper filtration** `G_K^u`, the functions `ψ_{L/K}` of finite separable
  extensions and the open-subgroup identity `G_K^u ∩ G_L = G_L^{ψ_{L/K}(u)}`: the ramification of
  complete discretely valued fields roadmap (TauCetiProject/TauCetiRoadmap#1410), §§4a.1–4a.2,
  consumed below.
- **Finite-level ramification**: lower and upper ramification groups of a finite Galois extension,
  Herbrand functions, Herbrand's theorem on quotients and Hasse–Arf: the
  [local fields and ramification roadmap](../../Completed/LocalFieldsRamification/README.md).
- **Local class field theory**: the absolute local Artin map, its norm functoriality, naturality,
  unramified coordinate and injectivity, and its compatibility with the unit filtration: the
  [class field theory roadmap](../ClassFieldTheory/README.md) and its Layer 7 amendment
  (TauCetiProject/TauCetiRoadmap#1411), consumed below.
- **Pro-`p` groups**, the maximal pro-`p` quotient and the Demushkin structure of `G_K(p)`: the
  [profinite pro-`p` groups roadmap](../../Completed/ProfiniteProPGroups/README.md) and the
  [local Galois groups roadmap](../../Completed/LocalGaloisGroups/README.md).
- **The anabelian theorems**: Mochizuki's theorem, its `m`-step solvable form, and the
  reconstruction of the cyclotomic character, inertia, the additive module `K^m` and the
  Hodge–Tate numbers from filtered groups, which consume this roadmap.
- **Anabelian geometry of curves**, including centre-freeness of the absolute Galois group of a
  finitely generated extension of `ℚ_p` and of geometric fundamental groups: the anabelian
  geometry and nonabelian Chabauty roadmap (TauCetiProject/TauCetiRoadmap#1021), which consumes
  Layer 3 here for the local case.
- **Local fields of positive characteristic** in Layer 3. Layers 0–2 hold for every
  nonarchimedean local field. Layer 3 needs the injectivity of the absolute local Artin map, which
  the class field theory roadmap states for finite extensions of `ℚ_p` only, and is stated for
  those.

## Standing conventions

- **Topological groups.** Groups carry `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]`;
  profinite groups add `[CompactSpace G] [TotallyDisconnectedSpace G]`, as in Tau Ceti's
  `zpowHat` and Mathlib's `ProfiniteGrp`. Isomorphisms are Mathlib's `G ≃ₜ* G'`
  (`ContinuousMulEquiv`).
- **Notation.** In prose `G(u)` is a filtration step, `G^[n]` a term of the closed derived
  series and `G^n = G/G^[n]` a solvable quotient. The paper notation `G_K^u` of
  TauCetiProject/TauCetiRoadmap#1410 is written `G_K(u)` here, so that `G_K^m` always means the
  quotient. `G^1 = G^ab`.
- **The closed derived series** is `closedDerivedSeries G n`, the topological closure of Mathlib's
  `derivedSeries G n`. It is not defined by iterating closed commutators. The recursion
  `G^[n+1] = closure ⁅G^[n], G^[n]⁆` is a theorem (Layer 0). `G^1` is Mathlib's
  `TopologicalAbelianization G` by definition, not merely up to isomorphism, because
  `closedDerivedSeries G 1` is `(commutator G).topologicalClosure`.
- **Filtrations are indexed by all of `ℝ`.** A filtration of `G` is an antitone family `u ↦ G(u)`
  of closed normal subgroups, `u ∈ ℝ` (`GroupFiltration G`). The upper filtration of a local
  Galois group is `G_K(u) = G_K^u` of TauCetiProject/TauCetiRoadmap#1410 for `u ≥ −1`, and `G_K`
  for `u < −1`. A filtration need not be exhaustive or separated, and no continuity in `u` is
  assumed.
- **Filtered isomorphisms are relative to an index set.** For `S ⊆ ℝ`, `α : G ≃ₜ* G'` is
  `S`-filtered if `α(G(u)) = G'(u)` for every `u ∈ S` (`IsFiltered F F' S α`). Two index sets are
  used: `S = [0, ∞)`, which includes inertia `G(0)` and is the convention of [Hyeon 2025, §2], and
  `S = (0, ∞)`, the convention of [Mochizuki 1997, Def. 2.3]. Every statement names its `S`.
  Restriction to open subgroups (Layer 1) needs `[0, ∞) ⊆ S`. That a `(0, ∞)`-filtered isomorphism
  of `G_K^{m+1}` already preserves inertia is a reconstruction theorem of the anabelian roadmaps,
  not a convention.
- **Outer isomorphisms.** `Out_Filt(G, G'; S)` is the quotient of the `S`-filtered isomorphisms
  `G ≃ₜ* G'` by post-composition with inner automorphisms of `G'`, `α ~ c_g ∘ α`
  (`FilteredOut`). It is a set, not a group, when `G ≠ G'`. An inner automorphism preserves every
  filtration because the steps are normal.
- **Herbrand functions of an open subgroup.** For a filtration `F` of a compact group `G` and an
  open subgroup `H`, put `f_H = [G : G(0)·H]` and
  `ψ_H(u) = u` for `u ≤ 0`, `ψ_H(u) = (1/f_H) ∫_0^u [G : G(t)·H] dt` for `u ≥ 0`.
  The indices are finite because `H` is open. `ψ_H` is a strictly increasing continuous bijection
  of `ℝ`, and `φ_H` is its inverse. On a local Galois group with `H = G_L`, `f_H` is the residue
  degree `f(L/K)` and `ψ_H` is `ψ_{L/K}` (Layer 2). ⚠ The integrand is `[G : G(t)·H]`, divided by
  `f_H`. The variant without the factor `1/f_H` is wrong for unramified `L/K`, where `ψ_{L/K}` is
  the identity.
- **Local Galois groups.** `G_K` is Mathlib's `Field.absoluteGaloisGroup K`, the automorphism
  group of `AlgebraicClosure K` with the Krull topology, as in TauCetiProject/TauCetiRoadmap#1410
  and the class field theory roadmap. Subextensions are `IntermediateField K (AlgebraicClosure K)`.
  Statements are about `G_K^m` and its subgroups, never about a Galois group of an infinite
  subextension: `AlgebraicClosure K` is not Galois over `K` in characteristic `p`, and Mathlib's
  infinite Galois correspondence (`Mathlib/FieldTheory/Galois/Infinite.lean`) needs `IsGalois`. A
  finite separable subextension `L` **lies in `K^m`** when `G_K^[m] ≤ L.fixingSubgroup`; in
  characteristic `0` this is `L ⊆ K^m` for the fixed field `K^m` of `G_K^[m]`, and Layer 3, which
  is in characteristic `0`, writes `Gal(K^{m+1}/K^m)` for `G_K^[m]/G_K^[m+1]`. A finite separable
  subextension `L` is a local field through Tau Ceti's `finiteIntermediateFieldValuativeRel`,
  `finiteIntermediateFieldTopology` and `finiteIntermediateField_isNonarchimedeanLocalField`.
  These are definitions, not instances: a statement about `L` installs them locally with `letI`
  and `haveI`, as `TauCeti.IntermediateField.discriminantExponent` does. The absolute Galois group
  of `L` is identified with the open subgroup `L.fixingSubgroup` of `G_K` (Layer 2.0).
- **Mixed characteristic** in Layer 3 is the hypothesis of the class field theory roadmap's
  `injective_artinMap`: `(p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]`,
  beside the local-field structure
  `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`.

## What this roadmap consumes

### From the ramification of complete discretely valued fields roadmap (TauCetiProject/TauCetiRoadmap#1410)

- **§4a.1, the absolute upper filtration.** For a complete discretely valued field with perfect
  residue field, in particular for a nonarchimedean local field `K`, and real `u ≥ −1`, the closed
  normal subgroups `G_K^u` of `Field.absoluteGaloisGroup K`: antitone, `G_K^(−1) = G_K`, with
  trivial intersection, mapping onto `Gal(M/K)^u` for every finite Galois
  `M : FiniteGaloisIntermediateField K (AlgebraicClosure K)`, with `G_K^0` inertia and
  `G_K^(0+) = closure ⋃_{w > 0} G_K^w` wild inertia, which on a local field are Tau Ceti's
  `TauCeti.inertiaSubgroup` and `TauCeti.wildInertiaSubgroup`.
- **§4a.2, open subgroups.** For finite separable `L/K` inside `AlgebraicClosure K`: `ψ_{L/K}` on
  `[−1, ∞)`, continuous, strictly increasing, the identity on `[−1, 0]`, with the tower law; the
  open-subgroup identity `G_K^u ∩ G_L = G_L^{ψ_{L/K}(u)}`; and the integral formula
  `ψ_{L/K}(u) = (1/f) ∫_0^u [G_K : G_K^t G_L] dt` for `u ≥ 0`, `f = f(L/K)`.

### From the local fields and ramification roadmap, implemented in Tau Ceti

- **Finite-level upper numbering**: `TauCeti.upperRamificationGroup K L v` on `L ≃ₐ[K] L` for
  `v : RamificationIndexDomain` (`Set.Ici (−1 : ℝ)`), with Herbrand's theorem on quotients
  `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean`).
- **Solvability**: `TauCeti.LocalFieldsRamification.isSolvable_algEquiv`, the Galois group of a
  finite Galois extension of nonarchimedean local fields is solvable (`Solvable.lean`).
- **Unramified extensions**: `TauCeti.unramifiedExtension K Ω f`, unique of each degree in a
  separably closed `Ω`, with `TauCeti.maximalUnramifiedExtension` and the factorization of a finite
  extension through its maximal unramified subextension (`Unramified/`).
- **Structure adapters** `finiteIntermediateFieldValuativeRel`, `finiteIntermediateFieldTopology`
  and their companions, which make a finite subextension a local field.

### From the class field theory roadmap

Implemented in Tau Ceti (`TauCeti/NumberTheory/ClassFieldTheory/Local/`):

- `TauCeti.ClassFieldTheory.artinMap K : Kˣ →* Field.absoluteGaloisGroupAbelianization K`, with
  `continuous_artinMap`, `denseRange_artinMap`;
- **norm functoriality** `artinMap_norm`: for `L/K` finite, embedded by `iota`, the image of
  `Art_L(x)` under `absoluteGaloisGroupExtend K L iota` is `Art_K(N_{L/K} x)`;
- **naturality** `artinMap_congr`: a continuous `e : K ≃+* K'`, extended to the algebraic
  closures by `e'`, carries `Art_K(x)` to `Art_{K'}(e x)`, conjugation by `e'` acting on the
  abelianizations;
- **the unramified coordinate** `TauCeti.unramifiedCoordinate K : G_K^ab →ₜ* zHat`, with
  `unramifiedCoordinate_artinMap`: the coordinate of `Art_K(x)` is the normalized valuation of `x`.

A target of its Layer 8, for finite extensions of `ℚ_p`:

- **injectivity** `injective_artinMap`.

Used only in the worked examples: the cyclotomic normalization `χ_cyc(Art_{ℚ_p}(u)) = u⁻¹`
(`cyclotomicCharacter_artinMap_padic`, Layer 7), and, from the Layer 7 amendment
TauCetiProject/TauCetiRoadmap#1411, **unit-filtration reciprocity** in its absolute form: for every
integer `n ≥ 0`, the closure of `Art_K(U_K^(n))` in `G_K^ab` is the image of `G_K(n)`.

### From the profinite pro-`p` groups and local Galois groups roadmaps, implemented in Tau Ceti

- `TauCeti.maximalProPQuotient p G`, `TauCeti.proPKernel p G` and `map_proPKernel_eq`: a
  continuous isomorphism carries the pro-`p` kernel onto the pro-`p` kernel.
- `TauCeti.absoluteGaloisGroupProP p K`, the maximal pro-`p` quotient of
  `Field.absoluteGaloisGroup K`.
- `TauCeti.zHat`, `TauCeti.zHat.lift` and `TauCeti.zpowHat`, the profinite power `x ^ᶻ a`.

### From Mathlib and the rest of Tau Ceti

- `derivedSeries`, `commutator`, `Subgroup.topologicalClosure`, `TopologicalAbelianization`,
  `Subgroup.center`, `OpenNormalSubgroup`, `IntermediateField.fixingSubgroup`
  and the infinite Galois correspondence (`Mathlib/FieldTheory/Galois/Infinite.lean`).
- Tau Ceti's `absoluteGaloisGroupRestrictEquiv`, `absoluteGaloisGroupEquivFixingSubgroup`,
  `galoisSubgroupEquiv` and `absoluteGaloisGroupExtend`
  (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/`), which compare the algebraic and separable
  closure models and realize `G_L` inside `G_K`.
- Tau Ceti's `TauCeti.IsUniformizer` on `Kˣ`.

## What is missing (build here)

Nothing in Mathlib or Tau Ceti defines the closed derived series, solvable quotients of
topological groups, filtrations of groups, filtered or outer filtered isomorphisms, Herbrand
functions of an open subgroup of an abstract filtered group, the upper filtration on `G_K^m` or
`G_K(p)`, or the coordinates `G_F^ab ≅ 𝒪_F^× × Ẑ`. The centre of `G_K` and of its solvable
quotients is not computed anywhere.

---

## The build, in layers

### Layer 0: the closed derived series and solvable quotients

Let `G` be a topological group.

- **Definition and basic properties.** `closedDerivedSeries G n`, its normality (an instance),
  closedness, `closedDerivedSeries G 0 = ⊤`, antitonicity, and the recursion
  `closedDerivedSeries G (n + 1) = (⁅closedDerivedSeries G n, closedDerivedSeries G n⁆).topologicalClosure`,
  from `closure ⁅closure A, closure B⁆ = closure ⁅A, B⁆` for subgroups of a topological group.
  `closedDerivedSeries G 1 = (commutator G).topologicalClosure`. For `G` Hausdorff, `G` is
  abelian exactly when `G^[1] = ⊥`; without separation an abelian `G` has `G^[1] = closure {1}`.
  `G^n` is the quotient `SolvableQuotient G n = G ⧸ closedDerivedSeries G n`, with
  `SolvableQuotient G 1 = TopologicalAbelianization G`.
- **Functoriality.** A continuous homomorphism `f` maps `G^[n]` into `G'^[n]`, onto it when `f` is
  surjective and `G` is compact and `G'` Hausdorff; a continuous isomorphism maps `G^[n]` onto
  `G'^[n]` (`map_closedDerivedSeries`). So `G^n` is functorial, and continuous isomorphisms induce
  continuous isomorphisms of every `G^n`.
- **Quotients.** For `G` compact Hausdorff and `m, n ≥ 0`, the image of `G^[m]` in
  `G^{m+n}` is `(G^{m+n})^[m]`, and `(G^{m+n})^m ≅ G^m` canonically; these are the transition maps
  `G^{m+1} → G^m`. A profinite `G` has profinite solvable quotients.
- **Closed subgroups above `G^[m]`** [Hyeon 2025, Lem. 2.3(1)]. If `H ≤ G` is closed and contains
  `G^[m]`, then `G^[m+n] ≤ H^[n]` for every `n`, the closed derived series of `H` taken in `H`. By
  induction on `n`, since `G^[m+n+1]` is the closure of `⁅G^[m+n], G^[m+n]⁆`. Consequently, with
  `H̄` the image of `H` in `G^{m+n}` and `G` compact Hausdorff, the natural surjection
  `H^n → H̄^n` is an isomorphism.
- **The commutator of an intersection.** For `G` profinite and `N` a closed normal subgroup,
  `closure ⁅N, N⁆ = ⋂_U closure ⁅N·U, N·U⁆` over the open normal subgroups `U` of `G`. The
  inclusion `⊆` is monotonicity. For `⊇`, if `x` lies in every `closure ⁅NU, NU⁆`, then
  `x ∈ ⁅NU, NU⁆·U = ⁅N, N⁆·U`, because `⁅NU, NU⁆·U` is open hence closed and
  `⁅nu, n'u'⁆ ≡ ⁅n, n'⁆ mod U`; and `⋂_U ⁅N, N⁆·U = closure ⁅N, N⁆`. Equivalently
  `(⋂ H)^ab = lim H^ab` over the open normal `H ⊇ N` [Hyeon 2025, proof of Prop. A.1].
- **Divisibility in profinite abelian groups.** For a profinite commutative group `A`,
  `⋂_{n ≥ 1} A^n = 1`: the image of `x ∈ ⋂ A^n` in each finite quotient `A/U` is an `[A : U]`-th
  power there, hence trivial.
- **Prosolvable groups.** If `G` is profinite and every `G ⧸ U`, `U` open normal, is solvable,
  then `⋂_n G^[n] = 1`: if `(G/U)^(k) = 1` then `G^[k] ≤ U`, because the image of `G^[k]` lies in the
  closure of the image of `derivedSeries G k`, inside the finite discrete `(G/U)^(k)`.
- **Centre-freeness passes to the limit.** If `⋂_n G^[n] = 1` and `Z(G^m) = 1` for every
  `m ≥ m₀`, then `Z(G) = 1`. A central element of `G` maps to a central element of each `G^m`,
  so it lies in every `G^[m]`.

### Layer 1: filtered topological groups

Let `G, G'` be topological groups with filtrations `F, F'`.

- **Filtrations.** `GroupFiltration G`: `u ↦ G(u)`, antitone, closed, normal. The upper and lower
  limits `G(u+) = closure ⋃_{w > u} G(w)` and `G(u−) = ⋂_{w < u} G(w)` are closed normal
  subgroups. A jump is a `u` with `G(u+) ≠ G(u)` or `G(u−) ≠ G(u)`.
- **Filtered and outer isomorphisms.** `IsFiltered F F' S α` for `α : G ≃ₜ* G'`; closure under
  composition and inverse, the identity of `(G, F)` is `S`-filtered, an `S'`-filtered
  isomorphism is `S`-filtered for `S ⊆ S'`, and
  conjugation by any `g ∈ G'` is `S`-filtered for every `S`. `FilteredOut F F' S` is the quotient
  by `α ~ c_g ∘ α`; composition descends to `FilteredOut`, which for `G = G'` is a group.
- **Quotient filtrations.** For `G` compact and `N` a closed normal subgroup,
  `(G/N)(u) = G(u)·N/N` is a filtration (`GroupFiltration.quotient`): closed because the image of a
  compact set. It is transitive, `(G/N)/(M/N) ≅ G/M` as filtered groups for `N ≤ M`, and an
  `S`-filtered `α` with `α(N) = N'` induces an `S`-filtered `G/N ≃ₜ* G'/N'`. In particular every
  `S`-filtered `α` induces `S`-filtered isomorphisms `G^m ≃ₜ* G'^m` (Layer 0 functoriality) and of
  maximal pro-`p` quotients (`map_proPKernel_eq`), compatible with the transition maps, and so maps
  `FilteredOut(G, G'; S) → FilteredOut(G^m, G'^m; S)` with `m`-compatible composites.
- **Herbrand functions of an open subgroup.** For `G` compact and `H` open, `f_H`, `ψ_H` and
  `φ_H` as in the conventions. `t ↦ [G : G(t)·H]` is monotone with values in `[f_H, [G : H]]`
  for `t ≥ 0`, so `ψ_H` is piecewise linear when the filtration has finitely many jumps in each
  bounded interval, and in general continuous, strictly increasing (slope at least `1`) and
  unbounded in both directions. `ψ_H` and `φ_H` depend only on `H` and the `G(t)`, `t ≥ 0`. For `H = G`,
  `ψ_G = id`. Tower law: for open `H' ≤ H ≤ G`, `ψ_{H'} = ψ^H_{H'} ∘ ψ_H`, where `ψ^H_{H'}` is
  computed in `H` for the restricted filtration below.
- **Restriction to an open subgroup.** `F.restrict H` is the filtration `H(w) = G(φ_H(w)) ∩ H` of
  `H`. For an open `H` with `N ≤ H` closed normal in `G`, restriction commutes with quotients:
  `(G/N)` restricted to `H/N` is `(F.restrict H)` taken modulo `N`. Here `[G/N : (G/N)(t)·(H/N)]`
  equals `[G : G(t)·H]`, and `(G(v)·N) ∩ H = (G(v) ∩ H)·N` by the modular law. If `α` is
  `S`-filtered with `[0, ∞) ⊆ S` and `α(H) = H'`, then `ψ_{H'} = ψ_H` and `α|_H : H ≃ₜ* H'` is
  `ψ_H(S)`-filtered (`exists_isFiltered_restrict`), in particular `[0, ∞)`-filtered.

### Layer 2: the upper filtration on local Galois groups

Let `K` be a nonarchimedean local field and `F_K` the upper filtration of `G_K`, as in the
conventions.

- **2.0 The open-subgroup model.** For a finite separable subextension `L` of
  `AlgebraicClosure K`, an
  isomorphism of topological groups `Field.absoluteGaloisGroup L ≃ₜ* L.fixingSubgroup`
  (`absoluteGaloisGroupEquivFixingSubgroup'`): the
  composite of `absoluteGaloisGroupRestrictEquiv L`,
  `absoluteGaloisGroupEquivFixingSubgroup K L σ` for the embedding `σ` of `L` into
  `SeparableClosure K` induced by the inclusion, and `absoluteGaloisGroupRestrictEquiv K`. Its
  composite with the inclusion into `G_K` is `absoluteGaloisGroupExtend K L σ`.
- **2.1 The filtration on `G_K` and its quotients.** `F_K` is a `GroupFiltration`, exhaustive
  (`G_K(−1) = G_K`), separated (trivial intersection), with `G_K(0)` inertia and `G_K(0+)` wild
  inertia (§4a.1). For a Galois subextension `E` of `AlgebraicClosure K`, the quotient filtration
  through `G_K/E.fixingSubgroup ≅ Gal(E/K)` is the upper filtration of `Gal(E/K)`, and for `E`
  finite it is `TauCeti.upperRamificationGroup` on `RamificationIndexDomain` (§4a.1, the
  surjections onto the finite levels); the identification `G_K/E.fixingSubgroup ≅ Gal(E/K)` is
  Mathlib's `AlgEquiv.restrictNormalHom`, surjective because `AlgebraicClosure K` is normal over
  `K`. The maximal unramified extension is an example: its `G(u)` is trivial for `u ≥ 0`. The
  solvable quotients and the maximal pro-`p` quotient are filtered directly, as
  `F_K.quotient (closedDerivedSeries G_K m)` on `G_K^m` (in particular on `G_K^ab`) and
  `F_K.quotient (proPKernel p G_K)` on `G_K(p)`, with no field-theoretic model.
- **2.2 Open subgroups.** For finite separable `L ⊆ AlgebraicClosure K`, with
  `H = L.fixingSubgroup`:
  `f_H = f(L/K)`, `ψ_H = ψ_{L/K}` and `φ_H = φ_{L/K}`, and `F_K.restrict H` is the upper filtration
  of `G_L` transported by 2.0. `G_K(0)·G_L` fixes `L ∩ K^ur`, the maximal unramified subextension
  of `L`, which has degree `f(L/K)` (`Unramified/`). With that, the integral formula of §4a.2
  gives `ψ_H = ψ_{L/K}`, and the open-subgroup identity gives `G_L(w) = G_K(φ_{L/K}(w)) ∩ G_L`.
  So **a filtered isomorphism `G_K ≃ₜ* G_{K'}` restricts to filtered isomorphisms of the
  absolute Galois groups of corresponding finite extensions** (Layer 1).
- **2.3 Descent along solvable extensions** [Hyeon 2025, Lems. 2.1 and 2.3(2)]. Let `m, n ≥ 0`
  and `L` finite separable over `K` lying in `K^m`, and let `H` be the image of `L.fixingSubgroup`
  in `G_K^{m+n}`, an open subgroup containing `(G_K^{m+n})^[m]`. Then `G_L^[n] ⊇ G_K^[m+n]` (Layer 0), `H^n ≅ G_L^n` canonically,
  and under this isomorphism the filtration
  `((F_K.quotient G_K^[m+n]).restrict H).quotient H^[n]` is the upper filtration of `G_L^n`
  (2.1, 2.2 and the compatibility of restriction with quotients). Consequently, an
  `S`-filtered `α : G_K^{m+n} ≃ₜ* G_{K'}^{m+n}` with `[0, ∞) ⊆ S` and `α(H) = H'`, where
  `H'` is the image of `L'.fixingSubgroup` for a finite separable `L'` lying in `K'^m`, induces a `[0, ∞)`-filtered
  `G_L^n ≃ₜ* G_{L'}^n`. This is the form in which the `m`-step anabelian theorems pass to finite
  extensions.
- **2.4 Outer isomorphisms of local Galois groups.** `Out_Filt(G_K, G_{K'}; S)` and
  `Out_Filt(G_K^m, G_{K'}^m; S)` with the maps between them of Layer 1, and the map
  `K ≃+* K' ↦ Out_Filt(G_K, G_{K'}; [0, ∞))` on continuous field isomorphisms. An extension
  `ẽ` of `e` to the algebraic closures conjugates `G_K` onto `G_{K'}`, and the outer class does not
  depend on `ẽ`. It is filtered, by the finite-level transport below and §4a.1, which passes it
  to the limit. Its composites with the maps to `G_K^m` and `G_K(p)`.

  **Transport of ramification groups** (`map_conj_upperRamificationGroup`). For a continuous
  `e : K ≃+* K'` of nonarchimedean local fields, a finite Galois `M/K` and a ring isomorphism
  `ẽ : M ≃+* M'` onto a finite Galois `M'/K'` extending `e`, conjugation `σ ↦ ẽ ∘ σ ∘ ẽ⁻¹` is an
  isomorphism `(M ≃ₐ[K] M) ≃* (M' ≃ₐ[K'] M')` carrying `upperRamificationGroup K M v` onto
  `upperRamificationGroup K' M' v` for every `v : RamificationIndexDomain`. `ẽ` is continuous,
  the valuation of a finite extension being the unique one extending that of the base, so it
  carries `𝒪[M]` onto `𝒪[M']` and the lower index `i(σ)` to `i(ẽσẽ⁻¹)`. The lower groups, the
  Herbrand functions and the upper groups then correspond.

### Layer 3: the abelianization in coordinates and centre-freeness

Let `K` be a finite extension of `ℚ_p`, with the hypotheses of the conventions.

- **3.1 Coordinates on `G_F^ab`.** For a finite extension `F` of `ℚ_p` with uniformizer `ϖ`, the
  map `𝒪_F^× × Ẑ → G_F^ab`, `(u, a) ↦ Art_F(u) · Art_F(ϖ)^ᶻ a`, is an isomorphism of topological
  groups (`artinCoordinateHom`, `exists_continuousMulEquiv_artinCoordinateHom`). It is a continuous
  homomorphism, `zHat.lift` being continuous. Its image is compact, `𝒪_F^×` and `Ẑ` being compact, hence closed, and contains `Art_F(Fˣ) = Art_F(𝒪_F^×)·Art_F(ϖ)^ℤ`, which is
  dense (`denseRange_artinMap`); so it is surjective. If `Art_F(u)·Art_F(ϖ)^ᶻ a = 1`, the
  unramified coordinate gives `a = 0` (`unramifiedCoordinate_artinMap`), and then `u = 1`
  (`injective_artinMap`). It is a continuous bijection from a compact space to a Hausdorff one.
  It is the profinite completion `(Fˣ)^ ≅ G_F^ab` of local reciprocity read in the coordinates
  `Fˣ = 𝒪_F^× × ϖ^ℤ`.
- **3.2 Galois action and norms in coordinates.** For `F/E` finite Galois inside
  `AlgebraicClosure K` and `τ ∈ G_E`, conjugation by `τ` on `G_F^ab` is
  `Art_F(x) ↦ Art_F(τ x)` (`artinMap_congr` with `e = τ|_F`, `e' = τ`; `e` is continuous by
  `AlgEquiv.continuous_of_valuativeExtension`, `LocalField/FiniteExtension/Basic.lean`). The map
  `G_F^ab → G_E^ab` induced by `G_F ≤ G_E` is `Art_F(x) ↦ Art_E(N_{F/E} x)` (`artinMap_norm`).
  Both are read through 2.0, which identifies the algebraic closures of `E` and `F` with
  `AlgebraicClosure K` and their absolute Galois groups with fixing subgroups. Both commute with
  `^ᶻ`, being continuous homomorphisms.
- **3.3 The centre lies in the top layer** [Hyeon 2025, Lem. A.2]. For `m ≥ 0`,
  `Z(G_K^{m+1}) ≤ Gal(K^{m+1}/K^m) = G_K^[m]/G_K^[m+1]`. Let `z` be central with lift `z̃ ∈ G_K`
  and `L ⊆ K^m` finite Galois over `K`. Then `G_L ⊇ G_K^[m]`, so
  `closure ⁅G_L, G_L⁆ ⊇ G_K^[m+1]`, and conjugation by `z̃` is the identity on `G_L^ab`. By 3.2,
  `Art_L(z̃ x) = Art_L(x)`, so `z̃` fixes `L` (`injective_artinMap` for `L`). `K^m` is the union of
  such `L`.
- **3.4 Centre-freeness of `G_K^m`, `m ≥ 2`** [Hyeon 2025, Prop. A.1]
  (`center_solvableQuotient_eq_bot`). Let `m ≥ 1` and `z ∈ Z(G_K^{m+1})` with lift `z̃`, so
  `z̃ ∈ G_K^[m]` by 3.3. For each finite Galois `L ⊆ K^m`, let `z_L` be the image of `z̃` in
  `G_L^ab`. It is well defined, fixed by conjugation by `G_K`, and `z_{L'} ↦ z_L` under the map
  induced by `G_{L'} ≤ G_L` for `L ⊆ L'`. Fix `L` and `n ≥ 1`, and let `L'` be the unramified
  extension of `L` of degree `n`: `L' = L·K'`, with `K'` the unramified extension of `K` of degree
  `n·f(L/K)`. It is Galois over `K` and lies in `K^m`, since `K' ⊆ K^ab ⊆ K^m` because `m ≥ 1`.
  This is the only use of `m ≥ 1`. A uniformizer `ϖ` of `L` is one of `L'`. By 3.1,
  `z_{L'} = Art_{L'}(u)·Art_{L'}(ϖ)^ᶻ a`. By 3.2, invariance under `τ ∈ G_L` gives
  `Art_{L'}(τu)·Art_{L'}(ϖ)^ᶻ a = Art_{L'}(u)·Art_{L'}(ϖ)^ᶻ a`, so `τu = u` by 3.1 and `u ∈ 𝒪_L^×`.
  Then `z_L` is the image of `z_{L'}`, which is
  `Art_L(N_{L'/L} u)·Art_L(N_{L'/L} ϖ)^ᶻ a = (Art_L(u)·Art_L(ϖ)^ᶻ a)^n`. So `z_L ∈ ⋂_n (G_L^ab)^n`,
  which is trivial (Layer 0). Hence `z̃ ∈ ⋂_L closure ⁅G_L, G_L⁆ = closure ⁅G_K^[m], G_K^[m]⁆ = G_K^[m+1]`
  (Layer 0, the commutator of an intersection), and `z = 1`. The unramified extension keeps the
  uniformizer, so this route needs no Galois descent for the profinite completion of `L'^×` along
  an arbitrary finite Galois `L'/L`, which [Hyeon 2025, Lem. A.3(3)] proves with Hilbert 90.
- **3.5 Centre-freeness of `G_K`** (`center_absoluteGaloisGroup_eq_bot`). `G_K` is prosolvable:
  each `G_K/U` is `Gal(M/K)` for a finite Galois `M`, solvable by `isSolvable_algEquiv`; so
  `⋂_n G_K^[n] = 1` (Layer 0). Layer 0's limit criterion with 3.4 gives `Z(G_K) = 1`.

## Worked examples (acceptance criteria)

- **`m = 1` is excluded.** `G_K^1 = G_K^ab` is abelian and nontrivial, so `Z(G_K^1) = G_K^1`;
  3.3 holds there with `K^0 = K`, and 3.4 fails because there is no unramified `L'` inside `K^0`.
- **Finite quotients have centres.** `Gal(ℚ_p(μ_{p²})/ℚ_p) ≅ (ℤ/p²)ˣ` is abelian and nontrivial,
  a quotient of every `G_{ℚ_p}^m` with `m ≥ 1`; centre-freeness of `G_K^m` is not a statement
  about its finite quotients.
- **Unramified restriction.** For `L/K` unramified of degree `f`, `f_H = f = [G_K : G_K(t)·G_L]`
  for every `t ≥ 0`, so `ψ_H = id` and `G_L(w) = G_K(w) ∩ G_L`.
- **Tame restriction.** For `K = ℚ_3`, `L = ℚ_3(ζ_3)`: `f_H = 1`, and `[G_K : G_K(t)·G_L] = 2` for
  `t > 0` (the image of `G_K(t)` in `Gal(L/K)` is trivial since `L/K` is tame), so `ψ_H(u) = 2u`
  for `u ≥ 0` and `G_L(w) = G_K(w/2) ∩ G_L`. The variant without `1/f_H` gives the same answer here,
  `f_H` being `1`. The unramified example is the one that separates them.
- **Quotient filtration at finite level.** The image of `G_{ℚ_2}(u)` in
  `Gal(ℚ_2(μ_8)/ℚ_2) = (ℤ/8)ˣ` is everything for `u ≤ 1`, `{1, 5}` for `1 < u ≤ 2`, and trivial for
  `u > 2` (§4a.1's check and Tau Ceti's `WorkedExamples/CyclotomicEight/Herbrand.lean`). Through
  `G_{ℚ_2}^1` it is the same: the quotient filtration of `G_{ℚ_2}^ab` maps to `(ℤ/8)ˣ` by
  transitivity.
- **Quotient filtration at infinite level.** On `Gal(ℚ_p(μ_{p^∞})/ℚ_p) ≅ ℤ_p^×` (the cyclotomic
  character), the quotient filtration is `ℤ_p^×` for `u ≤ 0` and `1 + p^n ℤ_p` for
  `n − 1 < u ≤ n`, `n ≥ 1`. The filtration factors through `G_{ℚ_p}^ab` by transitivity. At an
  integer `n` the image of `G_{ℚ_p}(n)` is `χ_cyc(closure Art(U^(n))) = 1 + p^n ℤ_p`, by
  unit-filtration reciprocity and the cyclotomic normalization. Between integers it is constant,
  by Hasse–Arf at the finite abelian levels. The jumps are at `1, 2, …`, and also at `0` when `p` is
  odd; for `p = 2`, `1 + 2ℤ_2 = ℤ_2^×`.
- **Coordinates.** For `F = ℚ_p` and `ϖ = p`, `artinCoordinateHom` followed by `χ_cyc` sends
  `(u, a)` to `u⁻¹`, and followed by `unramifiedCoordinate` sends it to `a`.
- **Descent.** For `K = ℚ_p`, `m = n = 1` and `L = ℚ_p(μ_p) ⊆ K^1`: `Gal(K^2/L)^1 = G_L^ab`, and a
  `[0, ∞)`-filtered automorphism of `G_K^2` that preserves `Gal(K^2/L)` induces a
  `[0, ∞)`-filtered automorphism of `G_L^ab`.

## Ordering

Layers 0 and 1 are group theory and can be built first, in parallel. Layer 2 needs Layer 1 and
§§4a.1–4a.2 of TauCetiProject/TauCetiRoadmap#1410. Layer 3 needs Layer 0 and the class field
theory roadmap, including `injective_artinMap` from its Layer 8, and of Layer 2 only the model
2.0; it does not need Layer 1.
3.4 and 3.5 are what TauCetiProject/TauCetiRoadmap#1021 consumes.

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
