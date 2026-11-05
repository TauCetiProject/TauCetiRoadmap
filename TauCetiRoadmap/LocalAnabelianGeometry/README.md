# Roadmap: anabelian geometry of `p`-adic local fields

For finite extensions `K, K'` of `ℚ_p`, Mochizuki's theorem [Mochizuki 1997, Thm. 4.2] says that
the natural map

```text
{ field isomorphisms K ≅ K' }  →  Out_Filt(G_K, G_{K'})
```

to the outer isomorphisms of absolute Galois groups that respect the upper ramification
filtrations is a bijection. Its `m`-step solvable form [Hyeon 2025, Thms. 1.4–1.5] replaces `G_K`
by the solvable quotients `G_K^m = G_K/G_K^[m]`: a filtered isomorphism `G_K^2 ≅ G_{K'}^2` forces
`K ≅ K'`, and a filtered isomorphism `G_K^{m+3} ≅ G_{K'}^{m+3}` induces on `G^{m+1}` conjugation by
a field isomorphism `K^{m+1} ≅ K'^{m+1}`, unique for `m ≥ 1`. This roadmap proves both, by the
common route: read invariants of `K` off the filtered group one at a time, in the order

- the numerical invariants `p`, `[K : ℚ_p]`, `e`, `f`, `q` and the `p`-power roots of unity, from
  `G_K^ab`;
- the cyclotomic character, from `G_K^2`;
- inertia and wild inertia, from `G_K^{m+1}`, `m ≥ 1`, without the filtration;
- the additive `G_K^{m+1}`-module `K^m`, through the `p`-adic logarithm and the transfer;
- the ring of integers of `K^m` and the completion of `K^m`, where the filtration enters;
- the Hodge–Tate numbers of `m`-step solvable `p`-adic representations;
- the uniformizing characters, which carry the embeddings `K → E`;

and then glue field isomorphisms over the finite subextensions, with centre-freeness for
uniqueness.

Suggested home: `TauCeti/NumberTheory/LocalField/Anabelian/`.

## Scope

This roadmap owns:

- the comparison of `Field.absoluteGaloisGroup K` with the `p`-adic model of the period-ring
  roadmap, the continuous transfer `G^ab → H^ab` of an open subgroup, its reciprocity form, the
  logarithm on principal units as a homomorphism, and the spanning lemma for open subgroups of
  units (Layer 0);
- the reconstruction, stated as invariance under isomorphisms, of the numerical invariants, the
  cyclotomic character, inertia, the additive module `K^m`, the ring of integers and completion of
  `K^m`, the Hodge–Tate numbers of `m`-step solvable representations and the uniformizing characters
  of a finite extension of `ℚ_p`, together with the group-theoretic constructions that prove them
  (Layers 1–7);
- the theorems of Mochizuki [Mochizuki 1997, Thm. 4.2] and Hyeon [Hyeon 2025, Thms. 1.4–1.5]
  (Layer 8).

It does not own:

- **Filtered profinite groups and the filtered local Galois groups**: the closed derived series,
  solvable quotients `G^m`, filtrations, filtered isomorphisms relative to an index set,
  `Out_Filt`, quotient filtrations, restriction to open subgroups, the upper filtration on `G_K^m`,
  the descent of filtered isomorphisms along solvable extensions, and centre-freeness of `G_K^m`
  (`m ≥ 2`) and `G_K`: the filtered local Galois groups roadmap
  (TauCetiProject/TauCetiRoadmap#1795), consumed below.
- **Local class field theory**: the Artin map, its norm functoriality, naturality, injectivity
  and the finite-level transfer square `ClassFormation.artinMap_groundInclusion`: the
  [class field theory roadmap](../ClassFieldTheory/README.md); unit-filtration reciprocity is its
  Layer 7 amendment (TauCetiProject/TauCetiRoadmap#1411).
- **`ℂ_p` and Hodge–Tate theory**: the Galois action on `ℂ_p`, Ax–Sen–Tate and Tate's computation
  of `ℂ_p(i)^{G_K}`: the `p`-adic period rings roadmap (TauCetiProject/TauCetiRoadmap#940,
  §§1.1–1.5). `D_HT`, labelled Hodge–Tate weights and the local character criterion: the finite
  flat group schemes and integral `p`-adic Hodge theory roadmap
  (TauCetiProject/TauCetiRoadmap#879, §§R07.P7.1–R07.P7.3).
- **Local fields of positive characteristic.** The anabelian theorems for `𝔽_q((t))` and its
  finite extensions are proved by a different method (Abrashkin) and are not here.
- **Anabelian geometry of curves** over `p`-adic and number fields: the anabelian geometry and
  nonabelian Chabauty roadmap (TauCetiProject/TauCetiRoadmap#1021).
- **The unfiltered counterexamples.** Non-isomorphic finite extensions of `ℚ_p` with isomorphic
  absolute Galois groups exist [Yamagata 1976; Jarden–Ritter 1979]. Their proof needs the
  Jannsen–Wingberg presentation of `G_K`, which no roadmap builds; they are cited, not targets.
  Worked example 2 is the provable form of the same phenomenon that this roadmap needs.

## Standing conventions

- **Fields.** `K` is a nonarchimedean local field that is a finite extension of `ℚ_p`:
  `(p : ℕ) [Fact p.Prime] [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] [FinitePadicExtension K p]`. Tau Ceti's `FinitePadicExtension`
  supplies `Algebra ℚ_[p] K` and `Module.Finite ℚ_[p] K`, the hypotheses of the class field theory
  roadmap's `injective_artinMap`, and is what `deepUnitExpLogEquiv` takes. A second field `K'`
  carries the same structure for a prime `p'`; that `p = p'` is a theorem (Layer 1), so statements
  comparing `K` and `K'` take two primes unless an earlier result has identified them.
- **Notation from the filtered local Galois groups roadmap.** `G_K = Field.absoluteGaloisGroup K`,
  `G^[n]` the closed derived series, `G^n = G/G^[n]` (`SolvableQuotient`), `G^1 = G^ab`. The
  upper filtration of `G_K` is `G_K(u)`; `G_K^m` carries the quotient filtration. `K^m` is the
  fixed field `IntermediateField.fixedField (closedDerivedSeries G_K m)` in `AlgebraicClosure K`.
  In characteristic `0` it is Galois over `K` and Mathlib's infinite Galois correspondence
  identifies `G_K^m` with `Gal(K^m/K)` and `G_K^[m]/G_K^[m+1]` with `Gal(K^{m+1}/K^m)`.
- **Index sets.** Every filtered statement names its index set `S`. The theorems are stated for
  `S = (0, ∞)` (`Set.Ioi 0`), the convention of [Mochizuki 1997, Def. 2.3], which is the weaker
  hypothesis; Layer 3 shows that a `(0, ∞)`-filtered isomorphism of `G_K^{m+1}`, `m ≥ 1`, or of
  `G_K` is `[0, ∞)`-filtered, which is the convention of [Hyeon 2025, §2] and what restriction to
  open subgroups needs.
- **"Recovered" means invariant.** An invariant of `K` is *recovered from* a (filtered) group
  attached to `K` when every isomorphism (respectively `S`-filtered isomorphism) of these groups
  for `K` and `K'` carries the invariant of `K` to that of `K'`. Every reconstruction theorem here
  is stated in this form. The group-theoretic constructions of Layers 1–6 (`p(A)`, `T_ℓ(G)`,
  `I(G)`, `(k^m)_+(G)`, …) are definitions on abstract topological groups, built from open
  subgroups, abelianizations, transfers, cardinalities and the filtration steps only, so they are
  invariant under isomorphisms by transport of structure; their content is the comparison with
  the field-theoretic invariant. There is no notion of "group-theoretic algorithm".
- **Reciprocity is arithmetic.** `Art_K` sends a uniformizer to an arithmetic Frobenius lift, and
  `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹` for units (`cyclotomicCharacter_artinMap`, ClassFieldTheory
  Layer 7). Hodge–Tate weights are those of TauCetiProject/TauCetiRoadmap#879 §R07.P7.1, with
  `HT(χ_cyc) = +1`.
- **Hodge–Tate numbers.** For a finite-dimensional continuous `ℚ_p`-representation `V` of `G_K`,
  `d^i_K(V) = dim_K (ℂ_p ⊗_{ℚ_p} V(χ_cyc^{−i}))^{G_K}`, the dimension over `K` (not over `ℚ_p`),
  computed in the `p`-adic model 0.1. So `d^1_K(ℚ_p(1)) = 1`. ⚠ With these normalizations a
  uniformizing character has its nonzero Hodge–Tate number at `i = −1` (7.3 and worked example 1);
  [Mochizuki 1997, §3] and [Hyeon 2025, Prop. 5.5] print `i = 1`, which is the geometric
  normalization of reciprocity.
- **Parity index.** `ε_p = 1` for `p` odd and `ε_2 = 2`. It enters only through the depth
  `ε_p·e_L`, at which the logarithm is an isomorphism `U_L^{(ε_p e_L)} ≅ p^{ε_p} 𝒪_L`.
- **Field isomorphisms** are ring isomorphisms. Between finite extensions of `ℚ_p` every ring
  homomorphism is continuous and `ℚ_p`-linear (0.6), so `K ≃+* K'`, `K ≃ₐ[ℚ_[p]] K'` and the
  continuous ring isomorphisms of the filtered local Galois groups roadmap's 2.4 are the same set.

## What this roadmap consumes

### From the filtered local Galois groups roadmap (TauCetiProject/TauCetiRoadmap#1795)

- **Layer 0.** `closedDerivedSeries`, `SolvableQuotient`, functoriality, the derived series of a
  closed subgroup above `G^[m]` (`closedDerivedSeries_add_le`, and the isomorphism `H^n ≅ H̄^n`),
  the commutator of an intersection, prosolvability `iInf_closedDerivedSeries_eq_bot`.
- **Layer 1.** `GroupFiltration`, `IsFiltered`, `FilteredOut`, `GroupFiltration.quotient`,
  `GroupFiltration.restrict`, the Herbrand functions `ψ_H`, and `exists_isFiltered_restrict`.
- **Layer 2.** The upper filtration on `G_K`, `G_K^m` (2.1), its restriction to open subgroups
  (2.2), the descent of filtered isomorphisms of `G_K^{m+n}` to `G_L^n` for `L` lying in `K^m`
  (2.3), and the map from continuous field isomorphisms to `Out_Filt` (2.4), with the open-subgroup
  model `absoluteGaloisGroupEquivFixingSubgroup'` (2.0).
- **Layer 3.** The coordinates `artinCoordinateHom` (3.1), the Galois action and norms in
  coordinates (3.2), and centre-freeness `center_solvableQuotient_eq_bot` (`m ≥ 2`) and
  `center_absoluteGaloisGroup_eq_bot` (3.4–3.5).

### From the class field theory roadmap

Implemented in Tau Ceti: `TauCeti.ClassFieldTheory.artinMap`, `artinMap_restrict`, `artinMap_norm`,
`artinMap_congr`, `continuous_artinMap`, `denseRange_artinMap`, `unramifiedCoordinate_artinMap`,
`abelianizedLocalCyclotomicCharacter_artinMap_norm`, and the finite-level transfer square
`TauCeti.ClassFieldTheory.ClassFormation.artinMap_groundInclusion`
(`TauCeti/NumberTheory/ClassFieldTheory/Formation/ArtinMap.lean`). Targets: `injective_artinMap`
(Layer 8, for finite extensions of `ℚ_p`), `cyclotomicCharacter_artinMap` (Layer 7) and, from the
Layer 7 amendment TauCetiProject/TauCetiRoadmap#1411, **unit-filtration reciprocity**
`map_unitFiltration_normResidue` in its absolute form: for every integer `n ≥ 0` the closure of
`Art_K(U_K^(n))` in `G_K^ab` is the image of `G_K(n)`.

### From the `p`-adic period rings roadmap (TauCetiProject/TauCetiRoadmap#940)

- §1.1: the continuous action of `G_K` on `ℂ_p = PadicComplex p`, for `K` a finite intermediate
  field of `PadicAlgCl p` (`completedGaloisAction`, `completedGaloisAction_continuous`).
- §1.2: Ax–Sen–Tate, `padicComplex_fixed_eq` and `padicComplex_fixed_closure_eq` (the fixed points
  of a closed subgroup `H ≤ G_{ℚ_p}` are the closure of its fixed field).
- §1.4: Tate's `tateSen_H0`, `ℂ_p(i)^{G_K} = 0` for `i ≠ 0`.

### From the finite flat group schemes and integral `p`-adic Hodge theory roadmap (TauCetiProject/TauCetiRoadmap#879)

- §R07.P7.1: `D_HT(V) = (B_HT ⊗_{ℚ_p} V)^{G_K}`, its dimension bound, Hodge–Tate representations,
  and the labelled weight multisets `HT_τ(V)`, `τ : K → E`, for `E`-linear `V`, `E` containing all
  embeddings of `K`, with `HT_τ(χ_cyc) = +1`.
- §R07.P7.3: the local character criterion: a continuous `ψ : G_K → E^×` is Hodge–Tate if and only
  if it is locally algebraic, `ψ(Art_K(u)) = ∏_τ τ(u)^{m_τ}` on an open subgroup of `𝒪_K^×`, and
  then `HT_τ(ψ) = −m_τ`.

### From the local fields and ramification roadmap and the rest of Tau Ceti

- `TauCeti.unitFiltration K i`, `TauCeti.absoluteRamificationIndex K p`, `deepUnitExpLogEquiv`
  (`log : U(K,i) ≃ₜ* 𝓂[K]^i` for `e < (p − 1)i`), `log_mul_of_mem_unitFiltration`,
  `exists_mem_unitFiltration_log_eq_smul`, and the convergence of `log` on `U(K,1)`
  (`hasSum_log_of_mem_unitFiltration_one`, `continuous_log_unitFiltration`).
- `TauCeti.inertiaSubgroup`, `TauCeti.wildInertiaSubgroup`, `TauCeti.maximalUnramifiedExtension`,
  `TauCeti.localCyclotomicCharacter`, `TauCeti.zHat` and `TauCeti.zpowHat`
  (`zpowHat_eq_padicPow_component` on pro-`p` groups).
- `TauCeti.continuous_transfer` (`TauCeti/Topology/Algebra/Group/Transfer.lean`): Mathlib's
  `MonoidHom.transfer` from an open finite-index subgroup preserves continuity.
- `TauCeti.absoluteGaloisGroupExtend`, `TauCeti.galoisSubgroup` and the structure adapters that make
  a finite subextension a local field.

### From Mathlib

`MonoidHom.transfer`, `TopologicalAbelianization`, `PadicAlgCl`, `PadicComplex`, `IsAlgClosed.lift`,
`IntermediateField.fixedField`, `IntermediateField.fixingSubgroupEquiv`, the infinite Galois
correspondence, `AdicCompletion`, `cyclotomicCharacter`.

## What is missing (build here)

Nothing in Mathlib or Tau Ceti identifies `Field.absoluteGaloisGroup K` with a subgroup of
`Gal(PadicAlgCl p/ℚ_p)`, states the transfer square for the absolute Artin map, or makes the
logarithm on `U(K,1)` a homomorphism. No group-theoretic invariant of an absolute Galois group, and
no anabelian theorem, is stated anywhere.

---

## The build, in layers

### Layer 0: tools

- **0.1 The `p`-adic model.** For `K` a finite extension of `ℚ_p`, a `ℚ_p`-isomorphism
  `ι : AlgebraicClosure K ≃ₐ[ℚ_[p]] PadicAlgCl p` (it exists: `AlgebraicClosure K` is an algebraic
  closure of `ℚ_p`) restricts to an embedding of `K` with image the intermediate field
  `K_ι ⊆ PadicAlgCl p`, and `σ ↦ ι σ ι⁻¹` is an isomorphism of topological groups
  `padicModelEquiv : G_K ≃ₜ* K_ι.fixingSubgroup ≤ Gal(PadicAlgCl p/ℚ_p)`, composed with
  `IntermediateField.fixingSubgroupEquiv` to land in `PadicAlgCl p ≃ₐ[K_ι] PadicAlgCl p`, the
  `G_K` of TauCetiProject/TauCetiRoadmap#940. Two choices of `ι` differ by an element of
  `Gal(PadicAlgCl p/ℚ_p)`, which conjugates one model onto the other, so every dimension of
  invariants below is independent of `ι`. Through `padicModelEquiv`, `G_K` acts continuously on
  `ℂ_p` (§1.1), and `localCyclotomicCharacter p K` is the cyclotomic character of #940 (both are
  Mathlib's `cyclotomicCharacter` on roots of unity, which `ι` preserves).
- **0.2 The continuous transfer.** For a compact topological group `G` and an open subgroup `H`,
  the transfer `Ver_{G,H} : G^ab → H^ab` (`topologicalTransfer`): Mathlib's `MonoidHom.transfer`
  of `H → H^ab`, continuous by `continuous_transfer`, descended to the topological abelianization
  (its target is Hausdorff). It is transitive for `H' ≤ H ≤ G` (Tau Ceti's `transfer_transfer`),
  natural for continuous isomorphisms (`α(H) = H'` gives
  `Ver_{G',H'} ∘ α^ab = (α|_H)^ab ∘ Ver_{G,H}`, from `transfer_apply_of_mulEquiv`), and for `H`
  normal its image lies in the invariants of the conjugation action of `G` on `H^ab`.
- **0.3 Reciprocity and the transfer.** For `L/K` finite inside `AlgebraicClosure K`, with `G_L`
  the open subgroup of 2.0 of the filtered local Galois groups roadmap,
  `Ver(Art_K(x)) = Art_L(x)` for `x ∈ Kˣ ⊆ Lˣ` (`artinMap_transfer`): at each finite abelian level
  this is `ClassFormation.artinMap_groundInclusion` for the local class formation, and
  `artinMap_restrict` passes it to the limit, `G_L^ab` being the limit of its finite quotients.
  Together with norm functoriality (`artinMap_norm`) and naturality (`artinMap_congr`) these are
  the three reciprocity squares used below.
- **0.4 Units and the filtration in `G_K^ab`.** `Art_K` restricts to an isomorphism of topological
  groups from `𝒪_K^×` onto the image of `G_K(0)` (inertia) in `G_K^ab`, and from `U_K^(n)` onto
  the image of `G_K(n)` for every integer `n ≥ 1`: injectivity and closedness from 3.1 of the
  filtered local Galois groups roadmap, the images from unit-filtration reciprocity (#1411). By
  Hasse–Arf the image of `G_K(v)` for real `v ≥ 0` is `Art_K(U_K^(⌈v⌉))`. The torsion subgroup of
  `G_K^ab` is `Art_K(μ(K))`, `μ(K)` the roots of unity of `K`.
- **0.5 The logarithm on principal units.** `log : U(K,1) → K` is a continuous homomorphism
  (`log_mul_of_mem_unitFiltration_one`): for `u` in `U(K,1)` some `u^{p^k}` is deep, so
  `log u = p^{−k} log(u^{p^k})` and the deep case is `log_mul_of_mem_unitFiltration`. Its kernel is
  the group of `p`-power roots of unity of `K`, and it induces a `ℚ_p`-linear isomorphism
  `U(K,1) ⊗_{ℤ_p} ℚ_p ≃ K` (`deepUnitExpLogEquiv` and `exists_mem_unitFiltration_log_eq_smul`).
  Here and below an abelian pro-`p` group `A` is a `ℤ_p`-module by `x ↦ x ^ᶻ a` through the
  `ℤ_p`-component of `Ẑ` (`zpowHat_eq_padicPow_component`); this `Module ℤ_[p] (Additive A)`
  structure is a target, with continuity of the action and naturality in continuous homomorphisms.
  For `L/K` finite, `log` commutes with `K ⊆ L` and with the Galois action.
- **0.6 Open subgroups of units span.** For an open subgroup `I` of `𝒪_K^×`, the `ℚ_p`-span of
  `I` in `K` is `K` [Mochizuki 1997, Lem. 4.1; Hyeon 2025, Lem. 6.1]: `I` contains `1 + p^n 𝒪_K`
  for some `n`, so its span contains `p^n 𝒪_K`. Consequently two `ℚ_p`-algebra homomorphisms
  `K → Ω` that agree on `I` are equal. Every ring homomorphism between finite extensions of `ℚ_p`
  is `ℚ_p`-linear and continuous: it is `ℚ`-linear, and `x ∈ ℤ_p` exactly when `1 + p x` has an
  `n`-th root for every `n` prime to `p`, a condition preserved by ring homomorphisms and forcing
  the image of `1 + p x` to be a unit; so it maps `ℤ_p` into `p⁻¹𝒪`, a bounded set, hence is
  continuous on `ℚ_p`, hence fixes it, and a `ℚ_p`-linear map of finite-dimensional spaces is
  continuous.

### Layer 1: numerical invariants from `G^ab` [Hyeon 2025, Prop. 3.1; Mochizuki 1997, Prop. 1.2]

For a profinite commutative group `A`, with torsion subgroup `A_tor` and `A_{/tor} = A/A_tor`:

- `p(A)`: the unique prime `ℓ` with `#(A_{/tor}/ℓ) ≥ ℓ²`, when it exists and is unique, else `0`;
- `d(A) = log_{p(A)} #(A_{/tor}/p(A)) − 1`;
- `f(A) = log_{p(A)} (#((A_tor)^{(p(A)')}) + 1)`, `(A_tor)^{(p')}` the prime-to-`p(A)` part;
- `a(A) = log_{p(A)} #((A_tor)^{(p(A))})`, the order of the `p(A)`-part;
- `e(A) = d(A)/f(A)`.

From 3.1 of the filtered local Galois groups roadmap and the structure of `𝒪_K^×`,
`G_K^ab ≅ μ_{q−1} × μ_{p^a} × ℤ_p^d × Ẑ` with `q = p^f` and `d = [K : ℚ_p]`
[Hyeon 2025, (4)], whence `p(G_K^ab) = p`, `d(G_K^ab) = [K : ℚ_p]`, `f(G_K^ab) = f(K/ℚ_p)`,
`e(G_K^ab) = absoluteRamificationIndex K p` and `a(G_K^ab)` is the largest `a` with `μ_{p^a} ⊆ K`.

**Recovery** (`eq_of_continuousMulEquiv_abelianization`). A continuous isomorphism
`G_K^ab ≃ₜ* G_{K'}^ab`, no filtration, forces `p = p'`, `[K : ℚ_p] = [K' : ℚ_p]`, equal
residue-field cardinalities and absolute ramification indices, and `#μ_{p^∞}(K) = #μ_{p^∞}(K')`.
The same holds for `G_K^m`, `m ≥ 1`, and `G_K`, through `G^ab`.

### Layer 2: the cyclotomic character from `G^2` [Hyeon 2025, Prop. 3.2]

Let `G` be a profinite group and `ℓ` a prime. A **Kummer sequence** is a decreasing sequence
`G = H_0 ⊇ H_1 ⊇ …` of open normal subgroups with `G/H_ν` abelian, `H_ν^ab[ℓ^ν]` cyclic of
order `ℓ^ν`, and the transfer restricting to isomorphisms `H_ν^ab[ℓ^ν] ≅ H_{ν+1}^ab[ℓ^ν]`. Along
it `T_ℓ(G) = lim_ν H_ν^ab[ℓ^ν]`, with transition maps
`x ↦ Ver⁻¹(x^ℓ)`, is a `ℤ_ℓ`-module with `G` acting by conjugation; `χ^{(ℓ)}(G) : G → ℤ_ℓ^×` is the
scalar by which `G` acts. These are targets for a general `G` admitting a Kummer sequence, with
the independence of the sequence (two sequences give isomorphic rank-one modules, and the scalar
of a rank-one module is canonical).

For `G = G_K^2`: the subgroups `Gal(K^2/K(μ_{ℓ^ν}))` form a Kummer sequence. Indeed
`Gal(K^2/L)^ab = G_L^ab` for `L ⊆ K^1` (Layer 0 of the filtered local Galois groups roadmap), the
torsion of `G_L^ab` is `Art_L(μ(L))` (0.4), and the transfer is the inclusion `μ(L_ν) ⊆ μ(L_{ν+1})`
(0.3). So `T_ℓ(G_K^2) ≅ ℤ_ℓ(1)` as `G_K^2`-modules, by the reciprocity squares 0.3 and
`artinMap_congr`.

**Recovery.** For every prime `ℓ` and every continuous isomorphism `α : G_K^2 ≃ₜ* G_{K'}^2`, the
`ℓ`-adic cyclotomic characters satisfy `χ_{K'} ∘ α = χ_K`. For `G_K^m`, `m ≥ 2`, and for `G_K`
(`localCyclotomicCharacter_comp_continuousMulEquiv`, [Mochizuki 1997, Prop. 1.1]), through the
induced isomorphisms of `G^2`. No filtration is used.

### Layer 3: inertia [Hyeon 2025, Lem. 4.1; Mochizuki 1997, Cor. 1.3]

Let `m ≥ 1` and `G` a profinite group with `G ≅ G_K^{m+1}`. For an open `H ⊇ G^[1]`,
`H^ab ≅ G_L^ab` for the corresponding finite abelian `L/K` (Layer 0 of the filtered local Galois
groups roadmap), so Layer 1 applies to `H^ab`. Define `I(G)` as the intersection of the open
`H ⊇ G^[1]` with `e(H^ab) = e(G^ab)`, and `P(G)` as the pro-`p(G^ab)` Sylow subgroup of `I(G)`.

- **Comparison.** `I(G_K^{m+1})` is the image of inertia and `P(G_K^{m+1})` the image of wild
  inertia: `e(L) = e(K)` exactly when `L/K` is unramified, and the maximal unramified extension
  lies in `K^1`. The image of wild inertia is a normal pro-`p` subgroup of `I` with
  pro-prime-to-`p` quotient, so it is the unique pro-`p` Sylow subgroup.
- **Recovery.** Every continuous isomorphism `G_K^{m+1} ≃ₜ* G_{K'}^{m+1}`, `m ≥ 1`, carries inertia
  onto inertia and wild inertia onto wild inertia. So does every continuous isomorphism
  `G_K ≃ₜ* G_{K'}` (`map_inertiaSubgroup`, `map_wildInertiaSubgroup`): the preimage of the inertia
  of `G_K^{m+1}` is `I_K · G_K^[m+1]`, and `⋂_m I_K · G_K^[m+1] = I_K` because `G_K` is compact and
  the closed `G_K^[m]` decrease to `1` (prosolvability); likewise for wild inertia.
- **The index sets agree.** Consequently a `(0, ∞)`-filtered isomorphism of `G_K^{m+1}`, `m ≥ 1`,
  or of `G_K` is `[0, ∞)`-filtered, `G(0)` being inertia.

### Layer 4: the additive module `K^m` [Hyeon 2025, Prop. 4.2; Mochizuki 1997, Prop. 2.1]

Let `m ≥ 1` and `G ≅ G_K^{m+1}`. Let `𝓗_m(G)` be the open normal subgroups of `G` containing
`G^[m]`, directed by reverse inclusion. For `H ∈ 𝓗_m(G)`, `U(H)` is the image of `H ∩ P(G)` in
`H^ab`, a `G`-module by conjugation and an abelian pro-`p` group. The transfer restricts to
`U(H_1) → U(H_2)` for `H_1 ⊇ H_2`, and

```text
(k^m)_+(G) = colim_{H ∈ 𝓗_m(G)} U(H) ⊗_{ℤ_p} ℚ_p .
```

- **Comparison** (`additiveModule`). For `H` the image of `G_L`, `L ⊆ K^m` finite Galois over `K`,
  `U(H)` is the image of wild inertia in `G_L^ab`, which is `Art_L(U_L^(1))` (0.4); the transfer is
  the inclusion `U_L^(1) ⊆ U_{L'}^(1)` (0.3) and conjugation is the Galois action
  (`artinMap_congr`). With 0.5, `(k^m)_+(G_K^{m+1}) ≅ ⋃_L L = K^m` as `ℚ_p`-linear
  `G_K^{m+1}`-modules.
- **Recovery.** A continuous isomorphism `α : G_K^{m+1} ≃ₜ* G_{K'}^{m+1}` induces a `ℚ_p`-linear
  isomorphism `K^m ≃ K'^m` carrying the action of `σ` to that of `α(σ)`. For `G_K`, the same with
  `AlgebraicClosure K = ⋃_m K^m` (prosolvability) [Mochizuki 1997, Prop. 2.1]. The multiplication
  of `K^m` is not recovered here.

### Layer 5: integers and completion [Hyeon 2025, Prop. 4.3; Mochizuki 1997, Prop. 2.2]

Let `m ≥ 1` and `(G, F)` a filtered profinite group with a `[0, ∞)`-filtered isomorphism to
`G_K^{m+1}`. For `H ∈ 𝓗_m(G)` give `H` the restricted filtration `F.restrict H` (Layer 1 of the
filtered local Galois groups roadmap), let `U(H, w)` be the image of `H(w)` in `H^ab`, and
`U'(H) = U(H, ε·e(H^ab))` with `ε = ε_{p(G^ab)}`. The transfer restricts to `U'(H_1) → U'(H_2)`
because `U_{L_1}^{(ε e_{L_1})} ⊆ U_{L_2}^{(ε e_{L_2})}`. Define

```text
(𝒪_{k^m})_+(G) = p^{−ε} · colim_H U'(H)   ⊆ (k^m)_+(G),
(ℂ_{k^m})_+(G) = (p-adic completion of (𝒪_{k^m})_+(G)) ⊗_{ℤ_p} ℚ_p .
```

- **Comparison.** For `H` the image of `G_L`, the filtration on `H` is the upper filtration of
  `G_L` (2.2 of the filtered local Galois groups roadmap), so `U'(H) = Art_L(U_L^{(ε e_L)})` (0.4)
  and `log U_L^{(ε e_L)} = 𝓂_L^{ε e_L} = p^ε 𝒪_L` (`deepUnitExpLogEquiv`, valid since
  `e_L < (p − 1) ε e_L`). So the isomorphism of Layer 4 carries `(𝒪_{k^m})_+(G_K^{m+1})` onto the
  integral closure `𝒪_{K^m}` of `𝒪_K` in `K^m`, and `(ℂ_{k^m})_+(G_K^{m+1})` onto `ℂ_{K^m}`, the
  closure of `K^m` in `ℂ_p` through 0.1, as `G_K^{m+1}`-modules.
- **Recovery.** A `(0, ∞)`-filtered isomorphism `G_K^{m+1} ≃ₜ* G_{K'}^{m+1}` (Layer 3) induces
  semilinear isomorphisms `𝒪_{K^m} ≃ 𝒪_{K'^m}` and `ℂ_{K^m} ≃ ℂ_{K'^m}` compatible with Layer 4. For
  `G_K`: `𝒪_{AlgebraicClosure K}` and `ℂ_p` [Mochizuki 1997, Prop. 2.2].

### Layer 6: Hodge–Tate numbers [Hyeon 2025, Prop. 5.3; Mochizuki 1997, Cor. 3.1]

A finite-dimensional continuous `ℚ_p`-representation `V` of `G_K` is **`m`-step solvable** when
`G_K^[m]` acts trivially [Hyeon 2025, Def. 5.2], that is, when it is a representation of `G_K^m`.

- **6.1 Bounds.** `Σ_i d^i_K(V) ≤ dim_{ℚ_p} V`, with equality exactly when `V` is Hodge–Tate in the
  sense of #879 §R07.P7.1: `Σ_i d^i_K(V) = dim_K D_HT(V)`.
- **6.2 Lines with coefficients.** For `E/ℚ_p` finite Galois with an embedding of `K`, and `V` an
  `E`-linear Hodge–Tate representation of `E`-dimension `1`,
  `d^i_K(V) = [E : K] · #{τ : K → E | HT_τ(V) = i}`: decompose
  `ℂ_p ⊗_{ℚ_p} V = ∏_{τ' : E → ℂ_p} ℂ_p ⊗_{E,τ'} V`, whose factors are permuted by `G_K` in
  `[K : ℚ_p]` orbits of size `[E : K]`, and use `tateSen_H0` (#940 §1.4).
- **6.3 Descent of invariants** [Hyeon 2025, Lem. 5.1]. With `F` the fixed field of `ker ρ`,
  `(ℂ_p ⊗ V)^{G_K} = (ℂ_F ⊗ V)^{G_K}`, `ℂ_F` the closure of `F`, by Ax–Sen–Tate for the closed
  subgroup `ker ρ` (#940 §1.2). For `V` `m`-step solvable, `F ⊆ K^m`, so the invariants may be
  computed in `ℂ_{K^m} ⊗ V(χ^{−i})`.
- **6.4 The group-theoretic numbers.** For a filtered `G` as in Layer 5, a continuous character
  `χ : G → ℤ_p^×` and a representation `V` of `G` killed by `G^[m]`,
  `d^i_m(G, χ, V) = dim_{ℚ_p} ((ℂ_{k^m})_+(G) ⊗_{ℚ_p} V(χ^{−i}))^G / d(G^ab)`.
- **Comparison and recovery.** `d^i_m(G_K^{m+1}, χ(G_K^2), V) = d^i_K(V)` for `m`-step solvable `V`
  (Layers 1, 2, 5 and 6.3). Hence for a `(0, ∞)`-filtered `α : G_K^{m+1} ≃ₜ* G_{K'}^{m+1}`, `m ≥ 1`,
  and `V` `m`-step solvable, `d^i_{K'}(V ∘ α_m⁻¹) = d^i_K(V)` for every `i`, where `α_m` is the
  induced isomorphism of `G^m`. For `G_K`, every `V` [Mochizuki 1997, Cor. 3.1].

### Layer 7: uniformizing characters [Hyeon 2025, §5; Mochizuki 1997, Def. 3.2, Cor. 3.3]

Let `E/ℚ_p` be finite Galois with an embedding of `K`, so that `E` contains every embedding of `K`.

- **7.1 Definition** (`IsUniformizing`). A continuous `ρ : G_K^ab → E^×` is *uniformizing* if there
  are an open subgroup `I ≤ 𝒪_K^×` and a `ℚ_p`-algebra homomorphism `ι : K → E` with
  `ρ(Art_K(u)) = ι(u)` for `u ∈ I`. An `E`-linear representation of `G_K` on a line is the same as
  a character `G_K → E^×`, which factors through `G_K^ab`.
- **7.2 Existence** [Hyeon 2025, Ex. 5.4] (`exists_isUniformizing`). For `K ⊆ E`, the composite
  `G_K^ab → G_E^ab → (image of inertia) ≅ 𝒪_E^× ⊆ E^×` of the transfer, the projection along the
  coordinates of 3.1 of the filtered local Galois groups roadmap for a uniformizer of `E`, and
  `Art_E⁻¹` (0.4) is continuous and sends `Art_K(u)` to `u` for every `u ∈ 𝒪_K^×` (0.3). It is
  uniformizing with `ι` the inclusion.
- **7.3 The Hodge–Tate criterion.** `ρ` is uniformizing if and only if `d^{−1}_K(ρ) = [E : K]` and
  `d^0_K(ρ) = [E : K]([K : ℚ_p] − 1)`, for `ρ` viewed as a `ℚ_p`-representation on `E`. If `ρ` is
  uniformizing with `ι`, it is locally algebraic with `m_ι = 1` and `m_τ = 0` otherwise, so
  `HT_ι = −1` and `HT_τ = 0` (#879 §R07.P7.3), and 6.2 gives the numbers. Conversely the two
  numbers add up to `dim_{ℚ_p} E`, so `ρ` is Hodge–Tate (6.1), hence locally algebraic, and 6.2
  leaves exactly one `τ` with `HT_τ = −1` and all others `0`.
- **7.4 Recovery** [Hyeon 2025, Cor. 5.6]. For a `(0, ∞)`-filtered `α : G_K^2 ≃ₜ* G_{K'}^2` with
  `K, K'` embedded in `E`, and `α_1` the induced isomorphism of `G^ab`, `ρ ∘ α_1⁻¹` is uniformizing
  for `K'` if and only if `ρ` is uniformizing for `K`: Layer 6 with `m = 1`,
  `[K : ℚ_p] = [K' : ℚ_p]` (Layer 1), and 7.3.

### Layer 8: the theorems

Let `α_U : 𝒪_K^× ≃ₜ* 𝒪_{K'}^×` denote `Art_{K'}⁻¹ ∘ α_1 ∘ Art_K` on units, for a filtered `α_1` of
`G^ab` preserving the image of inertia (0.4).

- **8.1 The weak theorem** [Hyeon 2025, Thm. 1.4] (`exists_ringEquiv_of_isFiltered_two`). If
  `α : G_K^2 ≃ₜ* G_{K'}^2` is `(0, ∞)`-filtered, there are a field isomorphism `f : K ≃+* K'` and an
  open subgroup `I ≤ 𝒪_K^×` with `f(u) = α_U(u)` for `u ∈ I`; by 0.6, `f` is determined by `α`.
  Proof: `p = p'` (Layer 1), choose `E/ℚ_p` finite Galois containing both; 7.2 gives `ρ` for `K`,
  7.4 makes `ρ ∘ α_1⁻¹` uniformizing for `K'` with some `ι'`; on a common open subgroup
  `ι = ι' ∘ α_U`, so `ι(K) = ι'(K')` (0.6) and `f = ι'⁻¹ ∘ ι`.
- **8.2 Uniqueness** [Hyeon 2025, Thm. 1.5(1)–(2)]. If two ring isomorphisms
  `θ_1, θ_2 : K^{m+1} ≃+* K'^{m+1}` both induce the same `α_{m+1} : G_K^{m+1} ≃ G_{K'}^{m+1}` by
  conjugation, then `θ_1|_K = θ_2|_K`, and `θ_1 = θ_2` when `m ≥ 1`. The automorphism
  `γ = θ_2⁻¹θ_1` of `K^{m+1}` commutes with `G_K^{m+1}`, so it preserves `K`, and
  `Art_K(γ x) = Art_K(x)` (`artinMap_congr`) gives `γ|_K = id` (`injective_artinMap`). Then
  `γ ∈ Z(G_K^{m+1})`, trivial for `m ≥ 1` (`center_solvableQuotient_eq_bot`).
- **8.3 The strong theorem** [Hyeon 2025, Thm. 1.5]
  (`exists_ringEquiv_conj_of_isFiltered`). Let `m ≥ 0` and `α : G_K^{m+3} ≃ₜ* G_{K'}^{m+3}` be
  `(0, ∞)`-filtered, with induced `α_{m+1}`. There is a ring isomorphism
  `θ : K^{m+1} ≃+* K'^{m+1}` with `α_{m+1}(σ) = θ σ θ⁻¹` for all `σ ∈ G_K^{m+1}`, unique by 8.2 for
  `m ≥ 1`, with `θ|_K` unique for `m = 0`. Proof: by Layer 3, `α` is `[0, ∞)`-filtered. For each
  finite Galois `L/K` inside `K^{m+1}`, `α` carries the image `H` of `G_L` to the image `H'` of
  `G_{L'}`, `L'` finite Galois inside `K'^{m+1}` (`α` preserves `(G^{m+3})^[m+1]` and normality),
  and 2.3 of the filtered local Galois groups roadmap with `(m+1, 2)` gives a `[0, ∞)`-filtered
  `G_L^2 ≃ₜ* G_{L'}^2`. 8.1 gives `θ_L : L ≃ L'` extending the unit map on an open subgroup. For
  `L_1 ⊆ L_2` the transfer square 0.3 and 0.6 give `θ_{L_2}|_{L_1} = θ_{L_1}`; the `θ_L` glue to
  `θ` on `K^{m+1}`. The conjugation identity holds on an open subgroup of units of each `L`, by
  naturality of the transfer and `artinMap_congr` (on `I ∩ γ⁻¹ I` for the conjugating `γ`), hence
  on `L` by 0.6.
- **8.4 Mochizuki's theorem** [Mochizuki 1997, Thm. 4.2] (`bijective_toFilteredOut`). The map of
  2.4 of the filtered local Galois groups roadmap, from field isomorphisms `K ≃+* K'` to
  `Out_Filt(G_K, G_{K'}; S)`, is bijective for `S = (0, ∞)` and for `S = [0, ∞)`. Injective: as in
  8.2, an automorphism of `K` inducing an inner automorphism of `G_K` acts trivially on `G_K^ab`, so
  is the identity. Surjective: a filtered `α` induces filtered `α_{m+3}` for every `m`; 8.3 gives
  `θ_{m+1}`, compatible in `m` by 8.2 (`m ≥ 1`), which glue to an automorphism `θ` of
  `AlgebraicClosure K = ⋃_m K^m` with `α = θ (·) θ⁻¹` on every `G_K^{m+1}`, hence on `G_K`
  (prosolvability). So the class of `α` is the image of `θ|_K`, and every filtered isomorphism is
  itself, not only up to inner automorphisms, conjugation by a field isomorphism of the algebraic
  closures.

## Worked examples (acceptance criteria)

1. **The sign of the Hodge–Tate criterion.** For `K = E = ℚ_p`, the character `ρ` of 7.2 sends
   `Art(u)` to `u` on `ℤ_p^×` and `Art(p)` to `1`, so `ρ = χ_cyc⁻¹`
   (`cyclotomicCharacter_artinMap_padic` and its uniformizer case, `denseRange_artinMap`), and
   `ρ(χ_cyc^{−i})` has nonzero `ℂ_p`-invariants exactly for `i = −1` (`tateSen_H0`):
   `d^{−1}_{ℚ_p}(ρ) = 1`, `d^0_{ℚ_p}(ρ) = 0`, matching 7.3 with `[E : K] = [K : ℚ_p] = 1`.
2. **`G^ab` does not see inertia.** For `p` odd, `G_{ℚ_p}^ab ≅ μ_{p−1} × ℤ_p × Ẑ` with inertia
   `μ_{p−1} × ℤ_p × 0` (0.4). Writing `Ẑ = ℤ_p × ∏_{ℓ ≠ p} ℤ_ℓ`, the automorphism exchanging the two
   factors `ℤ_p` is continuous and does not preserve the image of inertia. So Layer 3 needs
   `m ≥ 1`, and Layer 1 is all that `G^ab` recovers without the filtration.
3. **Numerical invariants.** `G_{ℚ_2}^ab ≅ ℤ/2 × ℤ_2 × Ẑ`: `p = 2`, `d = 1`, `f = 1`, `a = 1`,
   `e = 1`; `#(A_{/tor}/ℓ) = ℓ` for `ℓ` odd, so `p(A)` is unique. For `K = ℚ_3(μ_3)`: `d = 2`,
   `f = 1`, `e = 2`, `a = 1`.
4. **Spanning needs openness.** For `p` odd and `K = ℚ_p(√p)`, the subgroup `μ_{p−1}` of `𝒪_K^×`
   spans `ℚ_p ≠ K`; 0.6 fails for subgroups that are not open.
5. **`m = 0` in 8.3.** For `K = K' = ℚ_p` and `α` the identity of `G_{ℚ_p}^3`, every
   `σ ∈ G_{ℚ_p}^1 = Gal(ℚ_p^ab/ℚ_p)` gives a solution `θ = σ` at level `1`, since `G^1` is abelian;
   `θ|_{ℚ_p}` is the identity in every case. Uniqueness on `K^1` fails, as 8.2 allows.
6. **Inner automorphisms only.** Every `(0, ∞)`-filtered automorphism of `G_{ℚ_p}` is inner (8.4,
   `ℚ_p` having no nontrivial automorphisms).

## Ordering

Layer 0 needs the class field theory roadmap and #1411; 0.1 and 0.6 need nothing else. Layers 1–4
need Layer 0 and Layers 0 and 3 of the filtered local Galois groups roadmap; none uses a
filtration. Layer 5 needs Layers 1 and 2 of that roadmap. Layer 6 needs #940 §§1.1–1.4 and #879
§R07.P7.1; Layer 7 needs #879 §R07.P7.3. Layer 8 needs everything above, 2.3–2.4 and 3.4–3.5 of
the filtered local Galois groups roadmap.

## References

- S. Mochizuki, *A version of the Grothendieck conjecture for p-adic local fields*, Internat. J.
  Math. **8** (1997), 499–506 — Props. 1.1–1.2, Cor. 1.3, Props. 2.1–2.2, Def. 2.3, Cor. 3.1,
  Def. 3.2, Cor. 3.3, Lem. 4.1, Thm. 4.2. Prop. 1.1 there recovers the cyclotomic character by
  local duality instead of Layer 2's Tate modules.
- S.-H. Hyeon, *The m-step solvable anabelian geometry of mixed-characteristic local fields*,
  J. London Math. Soc. (2) **112** (2025), e70402 — §§3–6: Props. 3.1–3.2, Lem. 4.1,
  Props. 4.2–4.3, Lem. 5.1, Prop. 5.3, Ex. 5.4, Prop. 5.5, Cor. 5.6, Lem. 6.1, Thms. 1.4–1.5.
- J.-P. Serre, *Local Fields*, GTM 67 — VII §8 (transfer), XI §3 (functoriality of reciprocity),
  XV §2 (the unit filtration).
- J.-P. Serre, *Abelian ℓ-adic representations and elliptic curves*, III, Appendix, §5 — locally
  algebraic abelian representations.
- J. Tate, *p-divisible groups*, Proc. Conf. Local Fields (Driebergen 1966), 1967 — §3.3.
- J. Neukirch, *Algebraic Number Theory*, II §5 (the logarithm).
- H. Yamagata, *A counterexample for the local analogy of a theorem by Iwasawa and Uchida*, Proc.
  Japan Acad. **52** (1976), 276–278.
- M. Jarden and J. Ritter, *On the characterization of local fields by their absolute Galois
  groups*, J. Number Theory **11** (1979), 1–13.
