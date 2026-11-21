# Roadmap: anabelian geometry of `p`-adic local fields

**Summary.** For finite extensions `K, K'` of `ℚ_p`, Mochizuki's theorem says that the natural map

```text
{ field isomorphisms K ≅ K' }  →  Out_Filt(G_K, G_{K'})
```

to the outer isomorphisms of absolute Galois groups that respect the upper ramification
filtrations is a bijection. Hyeon's `m`-step solvable form replaces `G_K` by the solvable quotients
`G_K^m = G_K/G_K^[m]`, the quotients by the closed derived series: a filtered isomorphism
`G_K^2 ≅ G_{K'}^2` forces `K ≅ K'`, and for `m ≥ 0` a filtered isomorphism
`G_K^{m+3} ≅ G_{K'}^{m+3}` induces on `G^{m+1}` conjugation by a field isomorphism
`K^{m+1} ≅ K'^{m+1}`, where `K^{m+1}` is the fixed field of `G_K^[m+1]`; this field isomorphism is
unique for `m ≥ 1`. Without the filtration both statements fail: non-isomorphic finite extensions
of `ℚ_p` with isomorphic absolute Galois groups exist (Yamagata; Jarden–Ritter).

This roadmap proves both theorems by one route. It reads invariants of `K` off the filtered group
one at a time: the numerical invariants `p`, `[K : ℚ_p]`, `e`, `f` and the `p`-power roots of unity
from `G_K^ab`; the cyclotomic character from `G_K^2`; inertia and wild inertia from `G_K^{m+1}`,
`m ≥ 1`, still without the filtration; the additive module `K^m`, through the `p`-adic logarithm
and the transfer; the ring of integers of `K^m` and the completion of `K^m`, where the filtration
enters; the Hodge–Tate numbers of `m`-step solvable `p`-adic representations; and the uniformizing
characters, which carry the embeddings `K → E`. It then glues field isomorphisms over the finite
subextensions.

It builds on FilteredLocalGaloisGroups, which supplies the solvable quotients, filtrations,
filtered isomorphisms, the descent of filtered isomorphisms to open subgroups, coordinates on
`G_K^ab` and centre-freeness of `G_K^m`; on ClassFieldTheory, which supplies the Artin map, its
functoriality and unit-filtration reciprocity; on PadicPeriodRings, which supplies the Galois
action on `ℂ_p`, Ax–Sen–Tate and Tate's computation of `ℂ_p(i)^{G_K}`; and on
FiniteFlatGroupsAndIntegralPadicHodgeTheory, which supplies Hodge–Tate weights and the local
character criterion. AnabelianGeometryAndNonabelianChabauty supplies centre-freeness of `G_K` and
owns the anabelian geometry of curves.

Layer 0 builds the tools: a model of `G_K` inside `Gal(ℚ̄_p/ℚ_p)`, the continuous transfer and
its reciprocity form, the images of the unit filtration in `G_K^ab`, the logarithm on principal
units and the spanning lemma for open subgroups of units. Layers 1–3 recover the numerical
invariants, the cyclotomic character and inertia without the filtration. Layers 4–5 recover the
additive module `K^m`, its integers and its completion. Layer 6 recovers the Hodge–Tate numbers and
Layer 7 the uniformizing characters. Layer 8 proves the theorems.

## Conventions

- **Fields.** `K` is a nonarchimedean local field that is a finite extension of `ℚ_p`:
  `(p : ℕ) [Fact p.Prime] [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] [FinitePadicExtension K p]`. Tau Ceti's `FinitePadicExtension`
  supplies `Algebra ℚ_[p] K` and `Module.Finite ℚ_[p] K`, the hypotheses of ClassFieldTheory's
  `injective_artinMap`, and is what `deepUnitExpLogEquiv` takes. Every statement carries these
  binders, including statements whose conclusion does not mention `p`; local fields of positive
  characteristic are never in scope. A second field `K'` carries the same structure for a prime
  `p'`; that `p = p'` is a theorem (Layer 1), so statements comparing `K` and `K'` take two primes
  unless an earlier result has identified them.
- **Notation of FilteredLocalGaloisGroups.** `G_K = Field.absoluteGaloisGroup K`, `G^[n]` the
  closed derived series, `G^n = G/G^[n]` (`SolvableQuotient`), `G^1 = G^ab`. The upper filtration of
  `G_K` is `G_K(u)`; `G_K^m` carries the quotient filtration. `K^m` is the fixed field
  `IntermediateField.fixedField (closedDerivedSeries G_K m)` in `AlgebraicClosure K`. In
  characteristic `0` it is Galois over `K`, and Mathlib's infinite Galois correspondence identifies
  `G_K^m` with `Gal(K^m/K)` and `G_K^[m]/G_K^[m+1]` with `Gal(K^{m+1}/K^m)`.
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
- **Reciprocity is arithmetic**, as in ClassFieldTheory: `Art_K` sends a uniformizer to an
  arithmetic Frobenius lift, and `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹` for units (ClassFieldTheory
  Layer 7). On `ℚ_p` this reads `χ_cyc(Art(u)) = u⁻¹` for `u ∈ ℤ_p^×` and `χ_cyc(Art(p)) = 1`.
  Hodge–Tate weights are those of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.1, with
  `HT(χ_cyc) = +1`.
- **Hodge–Tate numbers.** For a finite-dimensional continuous `ℚ_p`-representation `V` of `G_K`,
  `d^i_K(V) = dim_K (ℂ_p ⊗_{ℚ_p} V(χ_cyc^{−i}))^{G_K}`, the dimension over `K` (not over `ℚ_p`),
  computed in the `p`-adic model 0.1. So `d^1_K(ℚ_p(1)) = 1`, and `d^i_K(V)` counts the weight `i`.
  The sign of the Hodge–Tate criterion 7.3 follows the arithmetic normalization: a uniformizing
  character has its nonzero Hodge–Tate number at `i = −1` (the computed Check in 7.3). With `Art_K`
  normalized geometrically the character of 7.2 on `ℚ_p` would be `χ_cyc` and the nonzero number
  would sit at `i = 1`.
- **Parity index.** `ε_p = 1` for `p` odd and `ε_2 = 2`. It enters only through the depth
  `ε_p·e_L`, at which the logarithm is an isomorphism `U_L^{(ε_p e_L)} ≅ p^{ε_p} 𝒪_L`.
- **Field isomorphisms** are ring isomorphisms. Between finite extensions of `ℚ_p` every ring
  homomorphism is continuous and `ℚ_p`-linear (0.6), so `K ≃+* K'`, `K ≃ₐ[ℚ_[p]] K'` and the
  continuous ring isomorphisms of FilteredLocalGaloisGroups §2.4 are the same set.

Suggested home: `TauCeti/NumberTheory/LocalField/Anabelian/`.

## Layer 0: tools

Nothing in Mathlib or Tau Ceti identifies `Field.absoluteGaloisGroup K` with a subgroup of
`Gal(PadicAlgCl p/ℚ_p)`, descends the transfer to topological abelianizations, states the transfer
square for the absolute Artin map, or makes the logarithm on `U(K,1)` a homomorphism. This layer
builds them.

### 0.1 The `p`-adic model

For `K` a finite extension of `ℚ_p`, a `ℚ_p`-isomorphism
`ι : AlgebraicClosure K ≃ₐ[ℚ_[p]] PadicAlgCl p` exists, `AlgebraicClosure K` being an algebraic
closure of `ℚ_p`. It restricts to an embedding of `K` with image an intermediate field
`K_ι ⊆ PadicAlgCl p`, and `σ ↦ ι σ ι⁻¹` is an isomorphism of topological groups
`G_K ≃ₜ* K_ι.fixingSubgroup ≤ Gal(PadicAlgCl p/ℚ_p)`. Composed with
`IntermediateField.fixingSubgroupEquiv` it lands in `PadicAlgCl p ≃ₐ[K_ι] PadicAlgCl p`, the `G_K`
of PadicPeriodRings §1. Two choices of `ι` differ by an element of `Gal(PadicAlgCl p/ℚ_p)`, which
conjugates one model onto the other, so every dimension of invariants below is independent of `ι`.
Through the model, `G_K` acts continuously on `ℂ_p` (PadicPeriodRings §1.1), and
`localCyclotomicCharacter p K` is the cyclotomic character of PadicPeriodRings §1: both are
Mathlib's `cyclotomicCharacter` on roots of unity, which `ι` preserves.

**Checks.**

- For `K = ℚ_p`, `K_ι = ℚ_p` for every `ι`, and the model is all of `Gal(PadicAlgCl p/ℚ_p)`.
- For `p` odd and `K = ℚ_p(√p)`, the two embeddings of `K` give the same fixing subgroup, `K`
  being Galois over `ℚ_p`; for `K = ℚ_p(p^{1/3})`, `p ≡ 2 mod 3`, the three embeddings give three
  distinct conjugate subgroups, so the model depends on `ι` up to conjugation and not better.

*Needs:* Mathlib `PadicAlgCl`, `IsAlgClosed.lift`, `IntermediateField.fixingSubgroupEquiv` and the
Krull topology; PadicPeriodRings §1.1.

### 0.2 The continuous transfer

For a compact topological group `G` and an open subgroup `H`, the transfer
`Ver_{G,H} : G^ab → H^ab` between topological abelianizations is Mathlib's `MonoidHom.transfer` of
`H → H^ab`, continuous by `continuous_transfer`, descended to the topological abelianization of `G`
(its target is Hausdorff, so the continuous homomorphism kills the closure of the commutator
subgroup). It is built exactly as Tau Ceti's pro-`p` transfer `abelianizationProPTransfer`, with
`continuous_abelianizationProPTransfer` and `abelianizationProPTransfer_eq_one_of_mk_eq_one` as the
models for continuity and descent, the full abelianization in place of its maximal pro-`p` quotient.
It is transitive for `H' ≤ H ≤ G` (Tau Ceti's `transfer_transfer`), natural for continuous
isomorphisms (`α(H) = H'` gives `Ver_{G',H'} ∘ α^ab = (α|_H)^ab ∘ Ver_{G,H}`, from
`transfer_apply_of_mulEquiv`), and for `H` normal its image lies in the invariants of the
conjugation action of `G` on `H^ab`.

**Checks.**

- For `H = G` the transfer is the identity of `G^ab`.
- For `G` abelian the transfer is `x ↦ x^{[G : H]}`: for `G = ℤ_p` and `H = pℤ_p`, written
  additively, `Ver(x) = px`, an isomorphism `ℤ_p ≅ pℤ_p`, while the map induced by the inclusion
  `H ≤ G` goes the other way.

*Needs:* Mathlib `MonoidHom.transfer`, `TopologicalAbelianization`; Tau Ceti
`continuous_transfer`, `transfer_transfer`.

### 0.3 Reciprocity and the transfer

For `L/K` finite inside `AlgebraicClosure K`, with `G_L` the open subgroup of
FilteredLocalGaloisGroups §2.0, `Ver(Art_K(x)) = Art_L(x)` for `x ∈ Kˣ ⊆ Lˣ`. At each finite
abelian level this is `ClassFormation.artinMap_groundInclusion` for the local class formation, and
`artinMap_restrict` passes it to the limit, `G_L^ab` being the limit of its finite quotients.
Together with norm functoriality (`artinMap_norm`) and naturality (`artinMap_congr`) these are the
three reciprocity squares used below.

**Checks.**

- For `L/K` unramified of degree `n` and `π` a uniformizer of `K`, `Ver(Art_K(π)) = Art_L(π)` is
  the arithmetic Frobenius of `L`; the norm square sends `Art_L(π)` to `Art_K(π^n)`, the `n`-th
  power of that of `K`. The two squares are not interchangeable.

*Needs:* 0.2; ClassFieldTheory Layers 4 and 7; FilteredLocalGaloisGroups §2.0.

### 0.4 Units and the filtration in `G_K^ab`

For every integer `n ≥ 0`, the upper filtration group `G_K(n)` of FilteredLocalGaloisGroups §2.1 is
ClassFieldTheory's `localAbsoluteUpperRamificationGroup K n`: both are closed subgroups of `G_K`
with the same image in every finite Galois quotient, the upper ramification group of that
quotient, and a closed subgroup of a profinite group is the intersection of the preimages of its
finite images. So `Art_K` restricts to an isomorphism of topological groups from `𝒪_K^×` onto the
image of `G_K(0)` (inertia) in `G_K^ab`, and from `U_K^(n)` onto the image of `G_K(n)` for every
integer `n ≥ 1`: injectivity and closedness from FilteredLocalGaloisGroups §3.1, the images from
`map_artinMap_unitFiltration_eq_upper`. Only integer steps are used. The image of wild inertia
`G_K(0+)` in `G_K^ab` is `Art_K(U_K^(1))`: it is compact, so closed; it lies in the image of
`G_K(0)`, which is `Art_K(𝒪_K^×) ≅ μ_{q−1} × U_K^(1)`, and is pro-`p`, so it lies in
`Art_K(U_K^(1))`; and it contains the image of `G_K(1) ≤ G_K(0+)`, which is `Art_K(U_K^(1))`.
The torsion subgroup of `G_K^ab` is `Art_K(μ(K))`, `μ(K)` the roots of unity of `K`.

**Checks.**

- For `K = ℚ_p`, `p` odd, the image of inertia is `Art(ℤ_p^×) ≅ μ_{p−1} × (1 + pℤ_p)` and the
  image of wild inertia is `Art(1 + pℤ_p) ≅ ℤ_p`; for `K = ℚ_2` they coincide, both being
  `Art(ℤ_2^×)`, since `q − 1 = 1`.
- In `ℚ_3(ζ_9)/ℚ_3` the upper group at `2` is trivial and the image of `U^(2) = 1 + 9ℤ_3` is the
  kernel of `ℤ_3^× → (ℤ/9)^×`, the unit part of the norm group of `ℚ_3(ζ_9)`, while the lower group
  at `2` has order `3`: the indexing is upper, not lower (ClassFieldTheory Layer 7 Checks).

*Needs:* ClassFieldTheory Layer 7 (`map_artinMap_unitFiltration_eq_upper`,
`map_artinMap_unitFiltration_zero`); FilteredLocalGaloisGroups §§2.1, 3.1.

### 0.5 The logarithm on principal units

`log : U(K,1) → K` is a continuous homomorphism (`log_mul_of_mem_unitFiltration_one`): for `u` in
`U(K,1)` some `u^{p^k}` is deep, so `log u = p^{−k} log(u^{p^k})` and the deep case is
`log_mul_of_mem_unitFiltration`. Its kernel is the group of `p`-power roots of unity of `K`
(`log_eq_zero_iff`), and it induces a `ℚ_p`-linear isomorphism `U(K,1) ⊗_{ℤ_p} ℚ_p ≃ K`
(`deepUnitExpLogEquiv` and `exists_mem_unitFiltration_log_eq_smul`). Here and below an abelian
pro-`p` group `A` is a `ℤ_p`-module by `x ↦ x ^ᶻ a` through the `ℤ_p`-component of `Ẑ`
(`zpowHat_eq_padicPow_component`); this `Module ℤ_[p] (Additive A)` structure is a target, with
continuity of the action and naturality in continuous homomorphisms. For `L/K` finite, `log`
commutes with `K ⊆ L` and with the Galois action.

**Checks.**

- For `K = ℚ_2`, `log(−1) = 0` and `−1 ∈ U(ℚ_2, 1)`: the kernel is `μ_{2^∞}(ℚ_2) = {±1}`, not
  trivial. For `K = ℚ_3(μ_3)` the kernel is `μ_3`.
- For `p` odd and `K = ℚ_p`, `log(1 + pℤ_p) = pℤ_p`, so the image of `U(ℚ_p, 1)` spans `ℚ_p` and
  `U(ℚ_p,1) ⊗_{ℤ_p} ℚ_p` is one-dimensional.

*Needs:* Tau Ceti `log_mul_of_mem_unitFiltration`, `deepUnitExpLogEquiv`,
`exists_mem_unitFiltration_log_eq_smul`, `hasSum_log_of_mem_unitFiltration_one`,
`zpowHat_eq_padicPow_component`.

### 0.6 Open subgroups of units span

For an open subgroup `I` of `𝒪_K^×`, the `ℚ_p`-span of `I` in `K` is `K` (`span_units_eq_top`)
[Mochizuki 1997, Lem. 4.1; Hyeon 2025, Lem. 6.1]: `I` contains `1 + p^n 𝒪_K` for some `n`, so its
span contains `p^n 𝒪_K`. Consequently two `ℚ_p`-algebra homomorphisms `K → Ω` that agree on `I`
are equal (`algHom_ext_of_eqOn_units`). Every ring homomorphism between finite extensions of `ℚ_p`
is `ℚ_p`-linear and continuous (`algebraMap_comp_ringHom`): it is `ℚ`-linear, and `x ∈ ℤ_p`
exactly when `1 + p x` has an `n`-th root for every `n` prime to `p`, a condition preserved by ring
homomorphisms and forcing the image of `1 + p x` to be a unit; so it maps `ℤ_p` into `p⁻¹𝒪`, a
bounded set, hence is continuous on `ℚ_p`, hence fixes it, and a `ℚ_p`-linear map of
finite-dimensional spaces is continuous.

**Checks.**

- For `p` odd and `K = ℚ_p(√p)`, the subgroup `μ_{p−1}` of `𝒪_K^×` spans `ℚ_p ≠ K`: openness is
  needed.
- `ℚ_p` has no ring endomorphism other than the identity, while `ℂ_p`, which is not a finite
  extension, has discontinuous field automorphisms (PadicPeriodRings §1.1 Checks): finiteness is
  needed for continuity.

*Needs:* Mathlib `Submodule.span`, `PadicInt`; Tau Ceti `unitFiltration`.

### Examples

For `K = ℚ_p`, `p` odd, `G_{ℚ_p}^ab ≅ μ_{p−1} × ℤ_p × Ẑ`, with inertia `μ_{p−1} × ℤ_p × 0` and wild
inertia `ℤ_p × 0` (0.4). The logarithm identifies the wild part with `pℤ_p` (0.5).

### Dependencies

ClassFieldTheory Layers 4 and 7; FilteredLocalGaloisGroups §§2.0, 2.1 and 3.1; PadicPeriodRings
§1.1. 0.1, 0.5 and 0.6 need nothing beyond Mathlib, Tau Ceti and PadicPeriodRings.

## Layer 1: numerical invariants from `G^ab`

### 1.1 The invariants of a profinite abelian group

For a profinite commutative group `A`, with torsion subgroup `A_tor` and `A_{/tor} = A/A_tor`:

- `p(A)`: the unique prime `ℓ` with `#(A_{/tor}/ℓ) ≥ ℓ²`, when it exists and is unique, else `0`;
- `d(A) = log_{p(A)} #(A_{/tor}/p(A)) − 1`;
- `f(A) = log_{p(A)} (#((A_tor)^{(p(A)')}) + 1)`, `(A_tor)^{(p')}` the prime-to-`p(A)` part;
- `a(A) = log_{p(A)} #((A_tor)^{(p(A))})`, the order of the `p(A)`-part;
- `e(A) = d(A)/f(A)`.

From FilteredLocalGaloisGroups §3.1 and the structure of `𝒪_K^×`,
`G_K^ab ≅ μ_{q−1} × μ_{p^a} × ℤ_p^d × Ẑ` with `q = p^f` and `d = [K : ℚ_p]`
[Hyeon 2025, (4)], whence `p(G_K^ab) = p`, `d(G_K^ab) = [K : ℚ_p]`, `f(G_K^ab) = f(K/ℚ_p)`,
`e(G_K^ab) = absoluteRamificationIndex K p` and `a(G_K^ab)` is the largest `a` with `μ_{p^a} ⊆ K`
[Hyeon 2025, Prop. 3.1; Mochizuki 1997, Prop. 1.2].

**Checks.**

- `A = G_{ℚ_2}^ab ≅ ℤ/2 × ℤ_2 × Ẑ`: `#(A_{/tor}/2) = 4` and `#(A_{/tor}/ℓ) = ℓ` for `ℓ` odd, so
  `p(A) = 2`, and `d = f = a = e = 1`.
- `A = G_{ℚ_3(μ_3)}^ab ≅ μ_2 × μ_3 × ℤ_3^2 × Ẑ`: `p = 3`, `d = 2`, `f = 1`, `a = 1`, `e = 2`.
- The boundary: for `K = ℚ_p`, `#(A_{/tor}/p) = p²` exactly. With `>` in place of `≥` in the
  definition of `p(A)`, `p(G_{ℚ_p}^ab)` would be `0`.
- `f` uses only the prime-to-`p` torsion: on `ℚ_2` the whole torsion has order `2`, and
  `log_2 (2 + 1)` is not an integer.

*Needs:* 0.4; FilteredLocalGaloisGroups §3.1; Tau Ceti `absoluteRamificationIndex`.

### 1.2 Recovery

A continuous isomorphism `G_K^ab ≃ₜ* G_{K'}^ab`, no filtration, forces `p = p'`,
`[K : ℚ_p] = [K' : ℚ_p]`, equal residue-field cardinalities and absolute ramification indices, and
`#μ_{p^∞}(K) = #μ_{p^∞}(K')` (`eq_of_continuousMulEquiv_abelianization`). The same holds for
`G_K^m`, `m ≥ 1`, and `G_K`, through `G^ab`.

*Needs:* 1.1; FilteredLocalGaloisGroups Layer 0 (functoriality of `G^m`).

### Examples

Example 2 of Layer 3 shows that this is all that `G^ab` recovers without the filtration: there is a
continuous automorphism of `G_{ℚ_p}^ab` moving the image of inertia.

### Dependencies

Layer 0; FilteredLocalGaloisGroups Layer 0 and §3.1.

## Layer 2: the cyclotomic character from `G^2`

### 2.1 Kummer sequences and their Tate modules

Let `G` be a profinite group and `ℓ` a prime. A **Kummer sequence** is a decreasing sequence
`G = H_0 ⊇ H_1 ⊇ …` of open normal subgroups with `G/H_ν` abelian, `H_ν^ab[ℓ^ν]` cyclic of
order `ℓ^ν`, and the transfer restricting to isomorphisms `H_ν^ab[ℓ^ν] ≅ H_{ν+1}^ab[ℓ^ν]`. Along
it `T_ℓ(G) = lim_ν H_ν^ab[ℓ^ν]`, with transition maps `x ↦ Ver⁻¹(x^ℓ)`, is a `ℤ_ℓ`-module with `G`
acting by conjugation. When it is free of rank one, `χ^{(ℓ)}(G, (H_ν)) : G → ℤ_ℓ^×` is the scalar
by which `G` acts. Both are attached to the pair `(G, (H_ν))`, and a continuous isomorphism
`α : G ≃ₜ* G'` carries a Kummer sequence `(H_ν)` to a Kummer sequence `(α H_ν)` with
`χ^{(ℓ)}(G', (α H_ν)) ∘ α = χ^{(ℓ)}(G, (H_ν))`, by transport of structure.

**Checks.**

- For `ℓ = p`, the images in `G_K^2` of `G_{K(μ_{p^ν})}` form a Kummer sequence, and for `ℓ ≠ p`
  the images of `G_{K(μ_{ℓ^ν})}`, an unramified tower, form one too.
- The constant sequence `H_ν = G_{ℚ_p}^2` is not Kummer: `G_{ℚ_p}^ab[ℓ^ν] = Art(μ(ℚ_p)[ℓ^ν])` is
  bounded in `ν`. Without the order condition, `T_ℓ` along it would be the Tate module of a finite
  group, `0`.
- A sequence with some `H_ν^ab[ℓ^ν]` not cyclic is not Kummer: for `G = (ℤ/2)^2` and `H_ν = G`,
  `H_1^ab[2] = G` is not cyclic.

*Needs:* 0.2; FilteredLocalGaloisGroups Layer 0.

### 2.2 Comparison and recovery

**Comparison, for every Kummer sequence of `G_K^2`.** Let `(H_ν)` be one, with `H_ν` the image of
`G_{L_ν}`. Since `G_K^2/H_ν` is abelian, `L_ν/K` is finite abelian, so `L_ν ⊆ K^1`, and
`H_ν^ab = G_{L_ν}^ab` (FilteredLocalGaloisGroups Layer 0). The torsion of `G_{L_ν}^ab` is
`Art_{L_ν}(μ(L_ν))` (0.4), so `H_ν^ab[ℓ^ν] = Art_{L_ν}(μ(L_ν)[ℓ^ν])`, and its being cyclic of
order `ℓ^ν` forces `μ_{ℓ^ν} ⊆ L_ν`. The transfer is the inclusion `μ(L_ν) ⊆ μ(L_{ν+1})` (0.3).
Hence `T_ℓ(G_K^2, (H_ν)) ≅ lim_ν μ_{ℓ^ν} = ℤ_ℓ(1)` as `G_K^2`-modules, conjugation being the
Galois action (`artinMap_congr`), and `χ^{(ℓ)}(G_K^2, (H_ν))` is the `ℓ`-adic cyclotomic
character [Hyeon 2025, Prop. 3.2]. Kummer sequences exist (2.1).

**Recovery.** For every prime `ℓ` and every continuous isomorphism `α : G_K^2 ≃ₜ* G_{K'}^2`, the
`ℓ`-adic cyclotomic characters satisfy `χ_{K'} ∘ α = χ_K`: apply transport of structure to a
Kummer sequence of `G_K^2` and the comparison to both it and its image. The same holds for
`G_K^m`, `m ≥ 2`, and for `G_K` (`localCyclotomicCharacter_comp_continuousMulEquiv`,
[Mochizuki 1997, Prop. 1.1]), through the induced isomorphisms of `G^2`. No filtration is used.

**Checks.**

- For `K = ℚ_p` and `ℓ = p`, `χ^{(p)}(Art(u)) = u⁻¹` for `u ∈ ℤ_p^×` and `χ^{(p)}(Art(p)) = 1`
  (ClassFieldTheory's `localCyclotomicCharacter_artinMap_padic` and
  `localCyclotomicCharacter_artinMap_padic_uniformizer`), not `u`: the group-theoretic character
  agrees with the library's arithmetic normalization.
- For `ℓ ≠ p`, `χ^{(ℓ)}` is unramified, and sends an arithmetic Frobenius to `q`.

*Needs:* 2.1; 0.3–0.4; ClassFieldTheory Layer 7 (`artinMap_congr`); FilteredLocalGaloisGroups
Layer 0.

### Examples

For `K = ℚ_p` the Kummer sequence of `ℚ_p(μ_{p^ν})` gives `T_p(G_{ℚ_p}^2) = ℤ_p(1)`, and
`χ^{(p)}` composed with `Art` is `u ↦ u⁻¹` on units and `1` at `p`.

### Dependencies

Layers 0–1; ClassFieldTheory Layer 7; FilteredLocalGaloisGroups Layer 0.

## Layer 3: inertia

### 3.1 The groups `I(G)` and `P(G)`

Let `m ≥ 1` and `G` a profinite group with `G ≅ G_K^{m+1}`. For an open `H ⊇ G^[1]`,
`H^ab ≅ G_L^ab` for the corresponding finite abelian `L/K` (FilteredLocalGaloisGroups Layer 0), so
Layer 1 applies to `H^ab`. Define `I(G)` as the intersection of the open `H ⊇ G^[1]` with
`e(H^ab) = e(G^ab)`, and `P(G)` as the intersection of all Sylow pro-`p(G^ab)` subgroups of `I(G)`
(Tau Ceti's `IsProPSylow`, `Profinite/Sylow/Basic.lean`). Both are defined from the topological
group alone, so continuous isomorphisms preserve them.

**Comparison** [Hyeon 2025, Lem. 4.1; Mochizuki 1997, Cor. 1.3]. `I(G_K^{m+1})` is the image of
inertia and `P(G_K^{m+1})` the image of wild inertia: `e(L) = e(K)` exactly when `L/K` is
unramified, and the maximal unramified extension lies in `K^1`. The image of wild inertia is a
normal Sylow pro-`p` subgroup of `I`: it is the image of Tau Ceti's `isProPSylow_wildInertiaSubgroup`,
closed, pro-`p`, with pro-prime-to-`p` quotient. By `IsProPSylow.eq_of_normal`
(`Profinite/Sylow/Conjugacy.lean`) it is the only one, so it equals `P(G_K^{m+1})`; for `G_K`
itself this is Tau Ceti's `eq_subgroupOf_wildInertiaSubgroup_of_isProPSylow`.

**Checks.**

- For `K = ℚ_p`, `p` odd, `m ≥ 1`: the open subgroup cut out by `ℚ_p(√p)` has `e(H^ab) = 2 ≠ 1`
  and is excluded, while that of the unramified quadratic extension has `e(H^ab) = 1` and is kept.
- For `K = ℚ_p`, `p` odd, `P(G) ≠ I(G)`: their quotient is the image of `μ_{p−1}`. For `K = ℚ_2`
  the image of inertia in `G^ab` is pro-`2`, but `I(G) ≠ P(G)` in `G_{ℚ_2}^{m+1}`, `m ≥ 1`, since
  tame inertia `∏_{ℓ ≠ 2} ℤ_ℓ(1)` survives in `G^{m+1}`.
- At `m = 0` no construction from the topological group gives inertia: example 2 below.

*Needs:* Layer 1; FilteredLocalGaloisGroups Layer 0; Tau Ceti `IsProPSylow`,
`IsProPSylow.eq_of_normal`, `isProPSylow_wildInertiaSubgroup`,
`eq_subgroupOf_wildInertiaSubgroup_of_isProPSylow`.

### 3.2 Recovery

Every continuous isomorphism `G_K^{m+1} ≃ₜ* G_{K'}^{m+1}`, `m ≥ 1`, carries inertia onto inertia
and wild inertia onto wild inertia. So does every continuous isomorphism `G_K ≃ₜ* G_{K'}`
(`map_inertiaSubgroup`, `map_wildInertiaSubgroup`): the preimage of the inertia of `G_K^{m+1}` is
`I_K · G_K^[m+1]`, and `⋂_m I_K · G_K^[m+1] = I_K` because `G_K` is compact and the closed
`G_K^[m]` decrease to `1` (prosolvability, FilteredLocalGaloisGroups Layer 0); likewise for wild
inertia. Consequently a `(0, ∞)`-filtered isomorphism of `G_K^{m+1}`, `m ≥ 1`, or of `G_K` is
`[0, ∞)`-filtered, `G(0)` being inertia.

*Needs:* 3.1; FilteredLocalGaloisGroups Layers 0–1.

### Examples

1. **`G^ab` does not see inertia.** For `p` odd, `G_{ℚ_p}^ab ≅ μ_{p−1} × ℤ_p × Ẑ` with inertia
   `μ_{p−1} × ℤ_p × 0` (0.4). Writing `Ẑ = ℤ_p × ∏_{ℓ ≠ p} ℤ_ℓ`, the automorphism exchanging the two
   factors `ℤ_p` is continuous and does not preserve the image of inertia. So this layer needs
   `m ≥ 1`, and Layer 1 is all that `G^ab` recovers without the filtration.

### Dependencies

Layers 0–1; FilteredLocalGaloisGroups Layers 0–1.

## Layer 4: the additive module `K^m`

### 4.1 The module `(k^m)_+(G)`

Let `m ≥ 1` and `G ≅ G_K^{m+1}`. Let `𝓗_m(G)` be the open normal subgroups of `G` containing
`G^[m]`, directed by reverse inclusion. For `H ∈ 𝓗_m(G)`, `U(H)` is the image of `H ∩ P(G)` in
`H^ab`, a `G`-module by conjugation and an abelian pro-`p` group. The transfer restricts to
`U(H_1) → U(H_2)` for `H_1 ⊇ H_2`, and

```text
(k^m)_+(G) = colim_{H ∈ 𝓗_m(G)} U(H) ⊗_{ℤ_p} ℚ_p .
```

**Comparison** [Hyeon 2025, Prop. 4.2; Mochizuki 1997, Prop. 2.1]. For `H` the image of `G_L`,
`L ⊆ K^m` finite Galois over `K`, `U(H)` is the image of wild inertia in `G_L^ab`, which is
`Art_L(U_L^(1))` (0.4, for `L`); the transfer is the inclusion `U_L^(1) ⊆ U_{L'}^(1)` (0.3) and
conjugation is the Galois action (`artinMap_congr`). With 0.5, `(k^m)_+(G_K^{m+1}) ≅ ⋃_L L = K^m`
as `ℚ_p`-linear `G_K^{m+1}`-modules.

**Checks.**

- For `K = ℚ_p` and `H = G`, `U(G) ⊗_{ℤ_p} ℚ_p ≅ ℚ_p` is one-dimensional. Using the whole pro-`p`
  part `ℤ_p × ℤ_p` of `G^ab` (`p` odd) in place of `U(G)` would add the unramified line.
- The transition maps are transfers, the inclusions `U_L^(1) ⊆ U_{L'}^(1)`. The maps induced by
  `H_2 ≤ H_1` go the other way and are the norms (`artinMap_norm`); along them the `U(H)` form an
  inverse system, whose limit is not `K^m`.

*Needs:* Layer 3; 0.2–0.5; ClassFieldTheory Layer 7 (`artinMap_congr`).

### 4.2 Recovery

A continuous isomorphism `α : G_K^{m+1} ≃ₜ* G_{K'}^{m+1}` induces a `ℚ_p`-linear isomorphism
`K^m ≃ K'^m` carrying the action of `σ` to that of `α(σ)`. For `G_K`, the same with
`AlgebraicClosure K = ⋃_m K^m` (prosolvability) [Mochizuki 1997, Prop. 2.1]. The multiplication of
`K^m` is not recovered here.

*Needs:* 4.1; FilteredLocalGaloisGroups Layer 0.

### Examples

For `m = 1` and `K = ℚ_p`, the colimit runs over the finite abelian `L/ℚ_p`, and `(k^1)_+` is
`ℚ_p^ab` as a `ℚ_p`-linear `Gal(ℚ_p^ab/ℚ_p)`-module.

### Dependencies

Layers 0 and 3; FilteredLocalGaloisGroups Layer 0.

## Layer 5: integers and completion

### 5.1 The modules `(𝒪_{k^m})_+(G)` and `(ℂ_{k^m})_+(G)`

Let `m ≥ 1` and `(G, F)` a filtered profinite group with a `[0, ∞)`-filtered isomorphism to
`G_K^{m+1}`. For `H ∈ 𝓗_m(G)` give `H` the restricted filtration `F.restrict H`
(FilteredLocalGaloisGroups Layer 1), let `U(H, w)` be the image of `H(w)` in `H^ab`, and
`U'(H) = U(H, ε·e(H^ab))` with `ε = ε_{p(G^ab)}`. The transfer restricts to `U'(H_1) → U'(H_2)`
because `U_{L_1}^{(ε e_{L_1})} ⊆ U_{L_2}^{(ε e_{L_2})}`. Define

```text
(𝒪_{k^m})_+(G) = p^{−ε} · colim_H U'(H)   ⊆ (k^m)_+(G),
(ℂ_{k^m})_+(G) = (p-adic completion of (𝒪_{k^m})_+(G)) ⊗_{ℤ_p} ℚ_p .
```

**Comparison** [Hyeon 2025, Prop. 4.3; Mochizuki 1997, Prop. 2.2]. For `H` the image of `G_L`, the
filtration on `H` is the upper filtration of `G_L` (FilteredLocalGaloisGroups §2.2), so
`U'(H) = Art_L(U_L^{(ε e_L)})` (0.4) and `log U_L^{(ε e_L)} = 𝓂_L^{ε e_L} = p^ε 𝒪_L`
(`deepUnitExpLogEquiv`, valid since `e_L < (p − 1) ε e_L`). So the isomorphism of Layer 4 carries
`(𝒪_{k^m})_+(G_K^{m+1})` onto the integral closure `𝒪_{K^m}` of `𝒪_K` in `K^m`, and
`(ℂ_{k^m})_+(G_K^{m+1})` onto `ℂ_{K^m}`, the closure of `K^m` in `ℂ_p` through 0.1, as
`G_K^{m+1}`-modules.

**Checks.**

- `K = ℚ_p`, `p` odd: `ε = e = 1`, `log U^(1) = pℤ_p` and `p^{−1}·pℤ_p = ℤ_p`.
- `K = ℚ_2`: `ε = 2`, `log U^(2) = log(1 + 4ℤ_2) = 4ℤ_2` and `2^{−2}·4ℤ_2 = ℤ_2`. With `ε = 1` the
  depth-one group `ℤ_2^×` contains `−1 ∈ ker log`, and `2^{−1}·log(ℤ_2^×) = 2ℤ_2 ≠ ℤ_2`.
- `K = ℚ_3(μ_3)`: `e = 2`, and at depth `2` `log(1 + 3𝒪_K) = 3𝒪_K`, scaled to `𝒪_K`. At depth `1`
  the logarithm is not injective, `μ_3 ⊆ U^(1)`: the depth is `ε e`, not `ε`.
- `(ℂ_{k^m})_+(G_K^{m+1}) ≠ (k^m)_+(G_K^{m+1})` for `m ≥ 1`: `K^1 ⊇ K(μ_{p^∞})`, which is not
  complete (PadicPeriodRings §1.2 Checks).

*Needs:* Layer 4; 0.4–0.5; FilteredLocalGaloisGroups Layer 1 and §2.2; PadicPeriodRings §1.2;
Tau Ceti `deepUnitExpLogEquiv`.

### 5.2 Recovery

A `(0, ∞)`-filtered isomorphism `G_K^{m+1} ≃ₜ* G_{K'}^{m+1}` (`[0, ∞)`-filtered by Layer 3)
induces semilinear isomorphisms `𝒪_{K^m} ≃ 𝒪_{K'^m}` and `ℂ_{K^m} ≃ ℂ_{K'^m}` compatible with
Layer 4. For `G_K`: `𝒪_{AlgebraicClosure K}` and `ℂ_p` [Mochizuki 1997, Prop. 2.2].

*Needs:* 5.1; Layer 3.

### Examples

For `m = 1`, `K = ℚ_p`: `(𝒪_{k^1})_+` is the ring of integers of `ℚ_p^ab` and `(ℂ_{k^1})_+` its
completion `\widehat{ℚ_p^ab}`.

### Dependencies

Layers 0, 3 and 4; FilteredLocalGaloisGroups Layers 1 and 2; PadicPeriodRings §1.2.

## Layer 6: Hodge–Tate numbers

A finite-dimensional continuous `ℚ_p`-representation `V` of `G_K` is **`m`-step solvable** when
`G_K^[m]` acts trivially [Hyeon 2025, Def. 5.2], that is, when it is a representation of `G_K^m`.

### 6.1 Bounds

`Σ_i d^i_K(V) ≤ dim_{ℚ_p} V`, with equality exactly when `V` is Hodge–Tate in the sense of
FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.1: `Σ_i d^i_K(V) = dim_K D_HT(V)`.

**Checks.**

- `V = ℚ_p(1) ⊕ ℚ_p`: `d^1 = d^0 = 1`, the sum is `2 = dim V`.
- `V = ℚ_p^2` with `σ ↦ [[1, log χ_cyc(σ)], [0, 1]]`, a `1`-step solvable representation: `d^0 = 1`,
  since `log χ_cyc` is a nonzero class in `H¹(G_K, ℂ_p)` (PadicPeriodRings §1.4), and `d^i = 0`
  for `i ≠ 0`. The sum is `1 < 2`: `V` is not Hodge–Tate.

*Needs:* 0.1; PadicPeriodRings §§1.1, 1.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.1.

### 6.2 Lines with coefficients

For `E/ℚ_p` finite Galois with an embedding of `K`, and `V` an `E`-linear Hodge–Tate representation
of `E`-dimension `1`, `d^i_K(V) = [E : K] · #{τ : K → E | HT_τ(V) = i}`: decompose
`ℂ_p ⊗_{ℚ_p} V = ∏_{τ' : E → ℂ_p} ℂ_p ⊗_{E,τ'} V`, whose factors are permuted by `G_K` in
`[K : ℚ_p]` orbits of size `[E : K]`, and use `tateSen_H0` (PadicPeriodRings §1.4).

*Needs:* 6.1; PadicPeriodRings §1.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.1.

### 6.3 Descent of invariants

[Hyeon 2025, Lem. 5.1] With `F` the fixed field of `ker ρ`, `(ℂ_p ⊗ V)^{G_K} = (ℂ_F ⊗ V)^{G_K}`,
`ℂ_F` the closure of `F`, by Ax–Sen–Tate for the closed subgroup `ker ρ` (PadicPeriodRings §1.2).
For `V` `m`-step solvable, `F ⊆ K^m`, so the invariants may be computed in
`ℂ_{K^m} ⊗ V(χ^{−i})`. This applies to each twist: for `m ≥ 1`, `V(χ^{−i})` is `m`-step solvable
whenever `V` is, because `χ` factors through `G_K^ab = G_K^1`, and so through `G_K^m`.

*Needs:* PadicPeriodRings §1.2.

### 6.4 The group-theoretic numbers

For a filtered `G` as in Layer 5, a continuous character `χ : G → ℤ_p^×` and a representation `V`
of `G` killed by `G^[m]`,
`d^i_m(G, χ, V) = dim_{ℚ_p} ((ℂ_{k^m})_+(G) ⊗_{ℚ_p} V(χ^{−i}))^G / d(G^ab)`.

**Comparison and recovery** [Hyeon 2025, Prop. 5.3; Mochizuki 1997, Cor. 3.1].
`d^i_m(G_K^{m+1}, χ(G_K^2), V) = d^i_K(V)` for `m`-step solvable `V` (Layers 1, 2, 5 and 6.3).
Hence for a `(0, ∞)`-filtered `α : G_K^{m+1} ≃ₜ* G_{K'}^{m+1}`, `m ≥ 1`, and `V` `m`-step solvable,
`d^i_{K'}(V ∘ α_m⁻¹) = d^i_K(V)` for every `i`, where `α_m` is the induced isomorphism of `G^m`.
For `G_K`, every `V` [Mochizuki 1997, Cor. 3.1].

**Checks.**

- For `p` odd, `K = ℚ_p(√p)` and `V = ℚ_p` trivial, the invariants are `K`, of `ℚ_p`-dimension
  `2 = d(G^ab)`, so `d^0_m = 1 = d^0_K(V)`. Without the division by `d(G^ab)` the number would be
  `2 > dim V`, contradicting 6.1.
- For `V = ℚ_p(1)` over `ℚ_p` and `m = 1`: `d^1_1 = 1` and `d^i_1 = 0` for `i ≠ 1`.

*Needs:* 6.1–6.3; Layers 1, 2 and 5.

### Examples

For `K = ℚ_p`, `d^i_{ℚ_p}(ℚ_p(n)) = 1` exactly for `i = n` (`tateSen_H0`).

### Dependencies

Layers 1, 2 and 5; 0.1; PadicPeriodRings §§1.1, 1.2 and 1.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.P7.1.

## Layer 7: uniformizing characters

Let `E/ℚ_p` be finite with an embedding of `K`. From 7.3 on, `E` is Galois over `ℚ_p`, so that `E`
contains every embedding of `K`; 7.1 and 7.2 do not use this.

### 7.1 Definition

A continuous `ρ : G_K^ab → E^×` is **uniformizing** (`IsUniformizing`)
[Hyeon 2025, §5; Mochizuki 1997, Def. 3.2] if there are an open subgroup `I ≤ 𝒪_K^×` and a
`ℚ_p`-algebra homomorphism `ι : K → E` with `ρ(Art_K(u)) = ι(u)` for `u ∈ I`. An `E`-linear
representation of `G_K` on a line is the same as a character `G_K → E^×`, which factors through
`G_K^ab`.

**Checks.** On `K = E = ℚ_p`:

- the trivial character is not uniformizing: `u = 1` fails on every open subgroup of `ℤ_p^×`;
- `χ_cyc` is not uniformizing: `χ_cyc(Art(u)) = u⁻¹` (`localCyclotomicCharacter_artinMap_padic`),
  and `u⁻¹ = u` fails on every open subgroup;
- `χ_cyc⁻¹` is uniformizing, with `I = ℤ_p^×` and `ι = id`;
- `χ_cyc⁻¹` times an unramified character is uniformizing too: the definition constrains `ρ` on
  units only.

*Needs:* ClassFieldTheory Layer 7 (`artinMap`).

### 7.2 Existence

[Hyeon 2025, Ex. 5.4] (`exists_isUniformizing`). For `K ⊆ E`, the composite
`G_K^ab → G_E^ab → (image of inertia) ≅ 𝒪_E^× ⊆ E^×` of the transfer, the projection along the
coordinates of FilteredLocalGaloisGroups §3.1 for a uniformizer of `E`, and `Art_E⁻¹` (0.4) is
continuous and sends `Art_K(u)` to `u` for every `u ∈ 𝒪_K^×` (0.3). It is uniformizing with `ι` the
inclusion.

**Checks.**

- For `K = E = ℚ_p` the character sends `Art(u)` to `u` on `ℤ_p^×` and `Art(p)` to `1`, so it is
  `χ_cyc⁻¹`: the two agree on the dense image of `Art` (`denseRange_artinMap`,
  `localCyclotomicCharacter_artinMap_padic`, `localCyclotomicCharacter_artinMap_padic_uniformizer`).

*Needs:* 7.1; 0.2–0.4; FilteredLocalGaloisGroups §3.1.

### 7.3 The Hodge–Tate criterion

`ρ` is uniformizing if and only if `d^{−1}_K(ρ) = [E : K]` and
`d^0_K(ρ) = [E : K]([K : ℚ_p] − 1)`, for `ρ` viewed as a `ℚ_p`-representation on `E`. If `ρ` is
uniformizing with `ι`, it is locally algebraic with `m_ι = 1` and `m_τ = 0` otherwise, so
`HT_ι = −1` and `HT_τ = 0` (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.3), and 6.2 gives
the numbers. Conversely the two numbers add up to `dim_{ℚ_p} E`, so `ρ` is Hodge–Tate (6.1), hence
locally algebraic, and 6.2 leaves exactly one `τ` with `HT_τ = −1` and all others `0`.

**Checks.**

- The sign, computed on `K = E = ℚ_p`: the character of 7.2 is `ρ = χ_cyc⁻¹` (7.2 Check), so
  `ℂ_p ⊗ ρ(χ_cyc^{−i}) = ℂ_p(−1 − i)`, which has nonzero `G_{ℚ_p}`-invariants exactly for
  `i = −1` (`tateSen_H0`): `d^{−1}_{ℚ_p}(ρ) = 1` and `d^1_{ℚ_p}(ρ) = d^0_{ℚ_p}(ρ) = 0`, matching
  the criterion with `[E : K] = [K : ℚ_p] = 1`. The non-uniformizing `χ_cyc` has `d^1 = 1` and
  `d^{−1} = 0`.

*Needs:* 6.1–6.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.3.

### 7.4 Recovery

[Hyeon 2025, Cor. 5.6] For a `(0, ∞)`-filtered `α : G_K^2 ≃ₜ* G_{K'}^2` with `K, K'` embedded in
`E`, and `α_1` the induced isomorphism of `G^ab`, `ρ ∘ α_1⁻¹` is uniformizing for `K'` if and only
if `ρ` is uniformizing for `K`: Layer 6 with `m = 1`, `[K : ℚ_p] = [K' : ℚ_p]` (Layer 1), and 7.3.

*Needs:* 7.3; Layers 1 and 6.

### Examples

Every check of 7.1 is an instance of 7.3: on `ℚ_p` the trivial character has `d^0 = 1`, `χ_cyc` has
`d^1 = 1`, and only the characters with `d^{−1} = 1` are uniformizing.

### Dependencies

Layers 0, 1 and 6; FilteredLocalGaloisGroups §3.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory
§R07.P7.3.

## Layer 8: the theorems

Let `α_U : 𝒪_K^× ≃ₜ* 𝒪_{K'}^×` denote `Art_{K'}⁻¹ ∘ α_1 ∘ Art_K` on units, for a filtered `α_1` of
`G^ab` preserving the image of inertia (0.4).

### 8.1 The weak theorem

[Hyeon 2025, Thm. 1.4] If `α : G_K^2 ≃ₜ* G_{K'}^2` is `(0, ∞)`-filtered, there are a field
isomorphism `f : K ≃+* K'` and an open subgroup `I ≤ 𝒪_K^×` with `f(u) = α_U(u)` for `u ∈ I`; by
0.6, `f` is determined by `α`. Proof: `p = p'` (Layer 1), choose `E/ℚ_p` finite Galois containing
both; 7.2 gives `ρ` for `K`, 7.4 makes `ρ ∘ α_1⁻¹` uniformizing for `K'` with some `ι'`; on a common
open subgroup `ι = ι' ∘ α_U`, so `ι(K) = ι'(K')` (0.6) and `f = ι'⁻¹ ∘ ι`.

*Needs:* Layers 1, 3 and 7; 0.6.

### 8.2 Uniqueness

[Hyeon 2025, Thm. 1.5(1)–(2)] If two ring isomorphisms `θ_1, θ_2 : K^{m+1} ≃+* K'^{m+1}` both
induce the same `α_{m+1} : G_K^{m+1} ≃ G_{K'}^{m+1}` by conjugation, then `θ_1|_K = θ_2|_K`, and
`θ_1 = θ_2` when `m ≥ 1`. The automorphism `γ = θ_2⁻¹θ_1` of `K^{m+1}` commutes with
`G_K^{m+1}`, so it preserves `K`, and `Art_K(γ x) = Art_K(x)` (`artinMap_congr`) gives
`γ|_K = id` (`injective_artinMap`). Then `γ ∈ Z(G_K^{m+1})`, trivial for `m ≥ 1`
(`center_solvableQuotient_eq_bot`, FilteredLocalGaloisGroups §3.4).

*Needs:* ClassFieldTheory Layers 7–8; FilteredLocalGaloisGroups §3.4.

### 8.3 The strong theorem

[Hyeon 2025, Thm. 1.5] Let `m ≥ 0` and `α : G_K^{m+3} ≃ₜ* G_{K'}^{m+3}` be `(0, ∞)`-filtered,
with induced `α_{m+1}`. There is a ring isomorphism `θ : K^{m+1} ≃+* K'^{m+1}` with
`α_{m+1}(σ) = θ σ θ⁻¹` for all `σ ∈ G_K^{m+1}`, unique by 8.2 for `m ≥ 1`, with `θ|_K` unique for
`m = 0`. Proof: by Layer 3, `α` is `[0, ∞)`-filtered. For each finite Galois `L/K` inside
`K^{m+1}`, `α` carries the image `H` of `G_L` to the image `H'` of `G_{L'}`, `L'` finite Galois
inside `K'^{m+1}` (`α` preserves `(G^{m+3})^[m+1]` and normality), and FilteredLocalGaloisGroups
§2.3 with `(m+1, 2)` gives a `[0, ∞)`-filtered `G_L^2 ≃ₜ* G_{L'}^2`. 8.1 gives `θ_L : L ≃ L'`
extending the unit map on an open subgroup. For `L_1 ⊆ L_2` the transfer square 0.3 and 0.6 give
`θ_{L_2}|_{L_1} = θ_{L_1}`; the `θ_L` glue to `θ` on `K^{m+1}`. The conjugation identity holds on
an open subgroup of units of each `L`, by naturality of the transfer and `artinMap_congr` (on
`I ∩ γ⁻¹ I` for the conjugating `γ`), hence on `L` by 0.6.

*Needs:* 8.1–8.2; 0.2–0.3, 0.6; Layer 3; FilteredLocalGaloisGroups §2.3.

### 8.4 Mochizuki's theorem

[Mochizuki 1997, Thm. 4.2] The map of FilteredLocalGaloisGroups §2.4, from field isomorphisms
`K ≃+* K'` to `Out_Filt(G_K, G_{K'}; S)`, is bijective for `S = (0, ∞)` and for `S = [0, ∞)`.
Injective: as in 8.2, an automorphism of `K` inducing an inner automorphism of `G_K` acts trivially
on `G_K^ab`, so is the identity. Surjective: a filtered `α` induces filtered `α_{m+3}` for every
`m`; 8.3 gives `θ_{m+1}`, compatible in `m` by 8.2 (`m ≥ 1`), which glue to an automorphism `θ` of
`AlgebraicClosure K = ⋃_m K^m` with `α = θ (·) θ⁻¹` on every `G_K^{m+1}`, hence on `G_K`
(prosolvability). So the class of `α` is the image of `θ|_K`, and every filtered isomorphism is
itself, not only up to inner automorphisms, conjugation by a field isomorphism of the algebraic
closures. That field isomorphism is unique: the quotient of two of them commutes with `G_K`, so
preserves `K` and is the identity on `K` by the injectivity argument, hence lies in
`Z(G_K) = 1` (AnabelianGeometryAndNonabelianChabauty §3.5, Local Galois centre-freeness).

*Needs:* 8.2–8.3; FilteredLocalGaloisGroups Layer 0 and §2.4; AnabelianGeometryAndNonabelianChabauty
§3.5.

### Examples

1. **`m = 0` in 8.3.** For `K = K' = ℚ_p` and `α` the identity of `G_{ℚ_p}^3`, every
   `σ ∈ G_{ℚ_p}^1 = Gal(ℚ_p^ab/ℚ_p)` gives a solution `θ = σ` at level `1`, since `G^1` is abelian;
   `θ|_{ℚ_p}` is the identity in every case. Uniqueness on `K^1` fails, as 8.2 allows.
2. **Inner automorphisms only.** Every `(0, ∞)`-filtered automorphism of `G_{ℚ_p}` is inner (8.4,
   `ℚ_p` having no nontrivial automorphisms).

### Dependencies

Layers 0–7; ClassFieldTheory Layers 7–8; FilteredLocalGaloisGroups Layer 0 and §§2.3, 2.4, 3.4;
AnabelianGeometryAndNonabelianChabauty §3.5.

## Scope and ownership

This roadmap owns:

- the `p`-adic model of `G_K`, the continuous transfer `G^ab → H^ab` of an open subgroup, its
  reciprocity form, the comparison of the unit filtration with the upper filtration in `G_K^ab`,
  the logarithm on principal units as a homomorphism, and the spanning lemma for open subgroups of
  units (Layer 0);
- the reconstruction, stated as invariance under isomorphisms, of the numerical invariants, the
  cyclotomic character, inertia, the additive module `K^m`, the ring of integers and completion of
  `K^m`, the Hodge–Tate numbers of `m`-step solvable representations and the uniformizing characters
  of a finite extension of `ℚ_p`, together with the group-theoretic constructions that prove them
  (Layers 1–7);
- the theorems of Mochizuki and Hyeon (Layer 8).

It does not own:

- **Filtered profinite groups and the filtered local Galois groups**: the closed derived series,
  solvable quotients `G^m`, filtrations, filtered isomorphisms relative to an index set,
  `Out_Filt`, quotient filtrations, restriction to open subgroups, the upper filtration on `G_K^m`,
  the descent of filtered isomorphisms along solvable extensions, and centre-freeness of `G_K^m`,
  `m ≥ 2`: FilteredLocalGaloisGroups.
- **Centre-freeness of `G_K`**: AnabelianGeometryAndNonabelianChabauty §3.5.
- **Local class field theory**: the Artin map, its norm functoriality, naturality, injectivity,
  the finite-level transfer square and unit-filtration reciprocity: ClassFieldTheory.
- **`ℂ_p` and Hodge–Tate theory**: the Galois action on `ℂ_p`, Ax–Sen–Tate and Tate's computation
  of `ℂ_p(i)^{G_K}`: PadicPeriodRings. `D_HT`, labelled Hodge–Tate weights and the local character
  criterion: FiniteFlatGroupsAndIntegralPadicHodgeTheory.
- **Local fields of positive characteristic.** The anabelian theorems for `𝔽_q((t))` and its
  finite extensions are proved by a different method (Abrashkin) and are not here.
- **Anabelian geometry of curves** over `p`-adic and number fields:
  AnabelianGeometryAndNonabelianChabauty.
- **The unfiltered counterexamples.** Non-isomorphic finite extensions of `ℚ_p` with isomorphic
  absolute Galois groups exist [Yamagata 1976; Jarden–Ritter 1979]. Their proof needs the
  Jannsen–Wingberg presentation of `G_K`, which no roadmap builds; they are cited, not targets.
  Layer 3, example 1, is the provable form of the same phenomenon that this roadmap needs.

## Exact supplier contracts

### From FilteredLocalGaloisGroups

[FilteredLocalGaloisGroups](../FilteredLocalGaloisGroups/README.md):

- **Layer 0.** `closedDerivedSeries`, `SolvableQuotient`, functoriality, the derived series of a
  closed subgroup above `G^[m]` (`closedDerivedSeries_add_le`, and the isomorphism `H^n ≅ H̄^n`),
  the commutator of an intersection, prosolvability `iInf_closedDerivedSeries_eq_bot`.
- **Layer 1.** `GroupFiltration`, `IsFiltered`, `FilteredOut`, `GroupFiltration.quotient`,
  `GroupFiltration.restrict`, the Herbrand functions `ψ_H`, and `exists_isFiltered_restrict`.
- **Layer 2.** The open-subgroup model `absoluteGaloisGroupEquivFixingSubgroup'` (§2.0), the upper
  filtration on `G_K` and `G_K^m` (§2.1), its restriction to open subgroups (§2.2), the descent of
  filtered isomorphisms of `G_K^{m+n}` to `G_L^n` for `L` lying in `K^m` (§2.3), and the map from
  continuous field isomorphisms to `Out_Filt` (§2.4).
- **Layer 3.** The coordinates `artinCoordinateHom` (§3.1), the Galois action and norms in
  coordinates (§3.2), and centre-freeness `center_solvableQuotient_eq_bot`, `m ≥ 2` (§3.4).

### From ClassFieldTheory

[ClassFieldTheory](../ClassFieldTheory/README.md), implemented in Tau Ceti:
`TauCeti.ClassFieldTheory.artinMap`, `artinMap_restrict`, `artinMap_norm`, `artinMap_congr`,
`continuous_artinMap`, `denseRange_artinMap`, `unramifiedCoordinate_artinMap`,
`map_artinMap_unitFiltration_zero`, `localCyclotomicCharacter_artinMap_padic`,
`localCyclotomicCharacter_artinMap_padic_uniformizer`,
`abelianizedLocalCyclotomicCharacter_artinMap_norm`, and the finite-level transfer square
`TauCeti.ClassFieldTheory.ClassFormation.artinMap_groundInclusion`
(`TauCeti/NumberTheory/ClassFieldTheory/Formation/ArtinMap.lean`, Layer 4). Targets:
`cyclotomicCharacter_artinMap` (Layer 7, the unit normalization for every finite `ℚ_p`-algebra
structure); **absolute unit-filtration reciprocity** `map_artinMap_unitFiltration_eq_upper`
(Layer 7): for a nonarchimedean local field `K` and every integer `n ≥ 0`, the image of `U(K,n)`
under `artinMap` is the image of `localAbsoluteUpperRamificationGroup K n` in `G_K^ab`;
and `injective_artinMap` (Layer 8, characteristic `0`).

### From PadicPeriodRings

[PadicPeriodRings](../PadicPeriodRings/README.md):

- §1.1: the continuous action of `G_K` on `ℂ_p = PadicComplex p`, for `K` a finite intermediate
  field of `PadicAlgCl p` (`completedGaloisAction`, `completedGaloisAction_continuous`).
- §1.2: Ax–Sen–Tate, `padicComplex_fixed_eq` and `padicComplex_fixed_closure_eq` (the fixed points
  of a closed subgroup `H ≤ G_{ℚ_p}` are the closure of its fixed field).
- §1.4: Tate's `tateSen_H0`, `ℂ_p(i)^{G_K} = 0` for `i ≠ 0` and `K` for `i = 0`, and the class of
  `log χ` in `H¹(G_K, ℂ_p)` from `tateSen_H1`.

### From FiniteFlatGroupsAndIntegralPadicHodgeTheory

[FiniteFlatGroupsAndIntegralPadicHodgeTheory](../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md):

- §R07.P7.1: `D_HT(V) = (B_HT ⊗_{ℚ_p} V)^{G_K}`, its dimension bound, Hodge–Tate representations,
  and the labelled weight multisets `HT_τ(V)`, `τ : K → E`, for `E`-linear `V`, `E` containing all
  embeddings of `K`, with `HT_τ(χ_cyc) = +1`.
- §R07.P7.3: the local character criterion: a continuous `ψ : G_K → E^×` is Hodge–Tate if and only
  if it is locally algebraic, `ψ(Art_K(u)) = ∏_τ τ(u)^{m_τ}` on an open subgroup of `𝒪_K^×`, and
  then `HT_τ(ψ) = −m_τ`, under arithmetic reciprocity.

### From AnabelianGeometryAndNonabelianChabauty

[AnabelianGeometryAndNonabelianChabauty](../AnabelianGeometryAndNonabelianChabauty/README.md)
§3.5, Local Galois centre-freeness: `Z(G_K) = 1` for `K/ℚ_p` finite.

### From LocalGaloisGroups and LocalFieldsRamification

[LocalGaloisGroups](../../Completed/LocalGaloisGroups/README.md) Layer 5 and
[LocalFieldsRamification](../../Completed/LocalFieldsRamification/README.md), implemented in Tau
Ceti:

- `TauCeti.unitFiltration K i`, `TauCeti.absoluteRamificationIndex K p`, `deepUnitExpLogEquiv`
  (`log : U(K,i) ≃ₜ* 𝓂[K]^i` for `e < (p − 1)i`), `log_mul_of_mem_unitFiltration`,
  `exists_mem_unitFiltration_log_eq_smul`, and the convergence of `log` on `U(K,1)`
  (`hasSum_log_of_mem_unitFiltration_one`, `continuous_log_unitFiltration`).
- `TauCeti.inertiaSubgroup`, `TauCeti.wildInertiaSubgroup`, `TauCeti.maximalUnramifiedExtension`,
  and the Sylow statements `isProPSylow_wildInertiaSubgroup` and
  `eq_subgroupOf_wildInertiaSubgroup_of_isProPSylow` (`TauCeti/NumberTheory/LocalField/WildInertia.lean`):
  wild inertia is the unique Sylow pro-`p` subgroup of inertia, the `G_K` case of 3.1.
- `TauCeti.localCyclotomicCharacter`, agreeing with Mathlib's `cyclotomicCharacter` (LocalGaloisGroups
  Layer 5).

### From the rest of Tau Ceti

- `TauCeti.zHat` and `TauCeti.zpowHat` (`zpowHat_eq_padicPow_component` on pro-`p` groups).
- `TauCeti.continuous_transfer` (`TauCeti/Topology/Algebra/Group/Transfer.lean`): Mathlib's
  `MonoidHom.transfer` from an open finite-index subgroup preserves continuity; `transfer_transfer`
  and `transfer_apply_of_mulEquiv` (`TauCeti/GroupTheory/Transfer/Basic.lean`).
- The pro-`p` transfer `abelianizationProPTransfer`, `continuous_abelianizationProPTransfer` and
  `abelianizationProPTransfer_eq_one_of_mk_eq_one`
  (`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/ClassModule/Transfer/Basic.lean`),
  the model for 0.2.
- `IsProPSylow` and `IsProPSylow.eq_of_normal` (`TauCeti/Topology/Algebra/Group/Profinite/Sylow/`).
- `TauCeti.absoluteGaloisGroupExtend`, `TauCeti.galoisSubgroup` and the structure adapters that
  make a finite subextension a local field.

### From Mathlib

`MonoidHom.transfer`, `TopologicalAbelianization`, `PadicAlgCl`, `PadicComplex`, `IsAlgClosed.lift`,
`IntermediateField.fixedField`, `IntermediateField.fixingSubgroupEquiv`, the infinite Galois
correspondence, `AdicCompletion`, `cyclotomicCharacter`, `NormedSpace.log`.

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
