# Roadmap: local anabelian geometry, Part II — Abrashkin's theorems

**Summary.** Let `p` be a prime and `E` a nonarchimedean local field of residue characteristic
`p`, of characteristic `0` or `p`. Write `E(p)` for a maximal `p`-extension of `E` and
`Γ_E(p) = Gal(E(p)/E)`, the maximal pro-`p` quotient of the absolute Galois group, with the
image `Γ_E(p)^{(v)}` of the upper ramification filtration. Abrashkin's theorem
[Abrashkin 2010, Thm. A] says that for two such fields `E`, `E'`, every isomorphism of
topological groups `g : Γ_E(p) ≅ Γ_{E'}(p)` with `g(Γ_E(p)^{(v)}) = Γ_{E'}(p)^{(v)}` for all
`v ≥ 0` is conjugation by a field isomorphism `μ : E(p) ≅ E'(p)` with `μ(E) = E'`, which is
unique (target 5.5). It holds for every `p`, `p = 2` included, and in both characteristics. In
characteristic `0` it is a pro-`p` strengthening of Mochizuki's theorem, proved by a different
method; in characteristic `p` it has no Hodge–Tate counterpart.

The proof is characteristic-`p` in nature. For `K = k((t))` with `k` finite, a solution `f` of
`σ(f) = f·e` in a Magnus algebra `𝒜` of noncommutative power series, with
`e = 1 + Σ_{p ∤ a} t^{−a}D_{a0} + α₀D₀`, embeds `Γ_K(p)` into the units of `𝒜`. The ramification
subgroups generate closed ideals `𝒜^{(v)}`, and Abrashkin computes them modulo the cube of the
augmentation ideal by explicit generators [Abrashkin 2010, Thm. B]. A filtration-preserving
automorphism must preserve these ideals. This forces its action on `I_K(p)^ab ⊗ 𝔽_p` to look
like that of a field automorphism. Over the unramified tower these actions assemble into the
differential of a field isomorphism, and the isomorphisms glue over the finite Galois
subextensions of `E(p)`. Characteristic `0` reduces to characteristic `p` through the field of
norms.

The same theorem for the full absolute Galois group follows, again for every `p`: a group
isomorphism `G_K ≅ G_{K'}` respecting the upper filtrations is conjugation by an isomorphism of
algebraic closures carrying `K` to `K'`. [Abrashkin 2000, Thm. A′] proves it for `p ≠ 2`, and
[Abrashkin 2010, p. 2] states that Theorem A implies it. Here it is deduced from Theorem A by
gluing the pro-`p` isomorphisms of the finite Galois subextensions, which the uniqueness makes
compatible. A second result of [Abrashkin 2000] is proved alongside, for `p ≠ 2`, by a Lie-algebra
form of the same computation: nilpotent Artin–Schreier theory in class two, and the ramification
filtration of `Γ_K(p)` modulo third commutators. It is a truncated statement
[Abrashkin 2000, Thm. B]. For `K/ℚ_p` finite
containing the `p^M`-th roots of unity and with large residue field, the filtered group
`Γ_K(p)/Γ_K(p)^{(a_K)}`, `a_K = e_K(p/(p−1) + M)`, determines `𝒪_K mod p^{1/(p−1)}` up to a
twisted isomorphism. Its proof needs Deligne's equivalence between extensions of bounded ramification of a complete
discretely valued field with perfect residue field and extensions of its truncation `Tr_e(F) = (𝒪_F/𝔪^e, 𝔪/𝔪^{e+1})`
[Deligne 1984, Thm. 2.8], which is built here.

The roadmap builds on FilteredLocalGaloisGroups, which supplies filtered profinite groups, the
upper filtration on `G_K(p)` and restriction to open subgroups; on FieldOfNorms, which supplies
`G_L ≅ G_{X_K(L)}` with its filtrations and Wintenberger's lifting of isomorphisms along
`ℤ_p`-towers; on FunctionFieldArithmetic, which supplies Artin–Schreier–Witt theory over
`k((t))` and the ramification of its extensions; and on the
[profinite pro-`p` groups roadmap](../../Completed/ProfiniteProPGroups/README.md), implemented in
Tau Ceti, which supplies free pro-`p` groups on a basis converging to `1` and Serre's freeness
criterion. LocalAnabelianGeometry, Mochizuki's theorem by Hodge–Tate theory, is the
characteristic-`0` sibling and shares no layer with this one.

The layers, in build order:

- **Layer 0**, algebra: the profinite Magnus algebra on generators converging to `0`, Lazard's
  isomorphism with the completed group algebra of a free pro-`p` group, and class-two Lie
  algebras for `p ≠ 2`;
- **Layer 1**, the Galois group `Γ_K(p)` of a local field of characteristic `p`: freeness, Witt
  liftings, Witt–Artin–Schreier theory in Abrashkin's coordinates, and the Magnus embedding
  `ψ_f` [Abrashkin 2010, §1];
- **Layer 2**, the ramification ideals `𝒜^{(v)} mod 𝒥³` [Abrashkin 2010, §4, Thm. B];
- **Layer 3**, automorphisms of `I_K(p)^ab ⊗ 𝔽_p`: admissibility, and what compatibility with
  the ramification ideals forces [Abrashkin 2010, §§2, 5];
- **Layer 4**, compatible systems over the unramified tower and the recovery of a field
  isomorphism from its differential [Abrashkin 2010, §3];
- **Layer 5**, Theorem A in characteristic `p`, with uniqueness [Abrashkin 2010, §6];
- **Layer 6**, Theorem A in characteristic `0`, through the field of norms
  [Abrashkin 2010, §7], and the absolute form for `G_K`, for every `p`;
- **Layer 7**, nilpotent Artin–Schreier theory in class two and the ramification filtration
  modulo third commutators, for `p ≠ 2` [Abrashkin 2000, §§2–3; Abrashkin 1998];
- **Layer 8**, the Main Lemma [Abrashkin 2000, §4];
- **Layer 9**, the ramification functor and its full faithfulness [Abrashkin 2000, §1], for
  every `p`;
- **Layer 10**, Deligne's truncated equivalence [Deligne 1984];
- **Layer 11**, Theorem B and its corollary [Abrashkin 2000, §§0, 6–7].

Layers 1–6 and 9 hold for every `p`. Layers 7, 8 and 11 assume `p ≠ 2`. Layer 10 is independent
of the rest and holds for every `p`.

## Conventions

- **Home.** The suggested home is `TauCeti/NumberTheory/LocalField/Anabelian/Abrashkin/`, with
  Layer 0 in `TauCeti/Topology/Algebra/Group/Profinite/Free/Magnus/` and Layer 10 in
  `TauCeti/NumberTheory/LocalField/Deligne/`.
- **Fields.** Every field is a nonarchimedean local field,
  `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`, with residue
  field `k` of characteristic `p`, `#k = q₀ = p^{N₀}`. A statement in characteristic `p` adds
  `[CharP K p]`; one in characteristic `0` adds `FinitePadicExtension K p`. The exception is
  Layer 10, which is stated at Deligne's generality: a complete discretely valued field with
  perfect residue field. Its consumer, Layer 11, applies it to local fields. Outside Layer 10,
  complete discretely valued fields with infinite residue field are not in scope.
- **Galois groups.** `G_K = Field.absoluteGaloisGroup K`. `Γ_K(p)` is Tau Ceti's
  `absoluteGaloisGroupProP p K`, the maximal pro-`p` quotient of `G_K`. `K(p)` is the fixed field
  of the pro-`p` kernel in the separable closure `separableClosure K (AlgebraicClosure K)`, which
  is Galois over `K` in every characteristic. Mathlib's infinite Galois correspondence then
  identifies `Γ_K(p)` with `Gal(K(p)/K)`. For `L ⊆ K(p)`, `Γ_L(p)` means `Gal(K(p)/L)`; that
  `K(p)` is a maximal `p`-extension of `L` when `L/K` is Galois or finite is target 5.0.
- **Filtrations.** `G_K(u)` is the upper filtration `F_K` of FilteredLocalGaloisGroups 2.1, in
  Serre's numbering, so `G_K(0)` is inertia. It is ClassFieldTheory's
  `localAbsoluteUpperRamificationGroup`, of which `Suggested.lean` keeps a copy. `Γ_K(p)^{(v)}` is the step at `v` of the quotient
  filtration `F_K.quotient (proPKernel p G_K)`. A pro-`p` group meets the tame quotient
  trivially, so `Γ_K(p)^{(v)}` is the inertia subgroup `I_K(p)` for every `v ∈ [0, 1]`.
  "Filtered" means `[0, ∞)`-filtered in the sense of FilteredLocalGaloisGroups 1.2
  (`IsFiltered F F' (Set.Ici 0) α`), which is Abrashkin's "for all `v ≥ 0`".
- **Composition.** Composition is the usual one, `(στ)(x) = σ(τ(x))`, and a field isomorphism `μ`
  acts on Galois groups by `μ^*(τ) = μ ∘ τ ∘ μ⁻¹`. [Abrashkin 2010] and [Abrashkin 2000] compose
  left to right (`fg` is "first `f`, then `g`"). Their statements are read in the usual
  convention by two rules. First, the paper's `μ̄^*(τ) = μ̄⁻¹τμ̄` is `μ ∘ τ ∘ μ⁻¹`. Second, the
  Magnus embedding is `ψ_f(τ) = (τ⁻¹f)·f⁻¹` (target 1.6). This is the paper's `ψ_f` evaluated at
  `τ⁻¹`, so it is a homomorphism, it has the same image on every subgroup, and it gives the same
  ideals `𝒜^{(v)}`. A paper composite `fη^*` of automorphisms is `η^* ∘ f` here. The formulas
  for `F_γ` and `ℱ^{(v)}_γ` are copied verbatim. So is that for `ℱ_γ(v)`, except that its product
  sum for `γ = ap^m` runs over `0 ≤ n < m`, not `n ≥ 0` (3.3).
- **Index sets.** `ℤ(p)` is the set of positive integers prime to `p` and
  `ℤ⁰(p) = ℤ(p) ∪ {0}`. Second indices `n` of the generators `D_{an}` lie in `ℤ/N₀`, and `D_{an}`
  with `n ∈ ℤ` means `D_{a, n mod N₀}`.
- **Witt vectors.** `W(k)`, `W_M(k)` are Mathlib's `WittVector p k` and `TruncatedWittVector p M k`.
  `σ` is the absolute Frobenius of `k` and its lift to `W(k)`, extended to every algebra built from
  `W(k)` as stated. `α₀ ∈ W(k)` is fixed with `Tr_{W(k)/ℤ_p}(α₀) = 1`. `{β_r}` is a `ℤ_p`-basis of
  `W(k)`, `1 ≤ r ≤ N₀`, and `{α_r}` the dual basis for the trace.
- **One normalization of the generators.** In every layer, `D_{an}` and `D₀` are dual to the
  classes `α₀` and `t^{−a}·c` in `O(K)/(σ − id)O(K)` (1.3). With `ψ_f(τ) = (τ⁻¹f)·f⁻¹`,
  `1 + D₀` is the image of `τ₀⁻¹` and `1 + D_a^{(r)}` that of `(τ_a^{(r)})⁻¹` (1.6 (b)). Under
  class field theory, `D₀` therefore corresponds to `t⁻¹` and `D_{an}` to the inverse of
  `Σ_r σⁿ(α_r) ⊗ E(β_r, t^a)^{1/a}`. [Abrashkin 2010, §1.4, p. 8] says `t` and
  `E(β_r, t^a)^{1/a}`, because its `ψ_f(τ) = (τf)f⁻¹` has no inverse. This is the normalization in
  which the diagonal element is `e = α₀D₀ + Σ t^{−a}D_{a0}`.
  **Source correction.** [Abrashkin 2000, §2.1, pp. 139–140] defines its special basis by the
  `χ_t`-coordinates of `E(w, t^a)`, with no exponent `1/a`, and Lemma of §2.3 (p. 141) states
  the same diagonal element. By the Schmid–Witt formula, `Res(c t^{−a} dlog E(w, t^a)) = a·cw`
  (FunctionFieldArithmetic 4.3), so for that literal basis the diagonal element is
  `α₀D₀ + Σ a⁻¹t^{−a}D_{a0}`. The formulas of [Abrashkin 2000] (Lemmas of §§2.3–2.4, Prop. 1 of §2.7,
  `F_{γ, −N}`) hold for the generators that occur in `e`. Here, for `γ > 0` rational and `N ≥ 0`,
  [Abrashkin 2000, §3.1, p. 146] puts
  `F_{γ, −N} = Σ (−1)^{s−1} η(n_1, …, n_s) a_1 p^{n_1} [… [D_{a_1n_1}, D_{a_2n_2}], …, D_{a_sn_s}]`,
  summed over `1 ≤ s < p`, `n_1 ≥ 0`, `n_2, …, n_s ≥ −N` and `a_1, …, a_s ∈ ℤ⁰(p)` with
  `p^{n_1}a_1 + ⋯ + p^{n_s}a_s = γ`. Here `η(n_1, …, n_s) = 1/(s_1!(s_2 − s_1)!⋯(s_l − s_{l−1})!)`
  when `n_1 = ⋯ = n_{s_1} > ⋯ > n_{s_{l−1}+1} = ⋯ = n_{s_l}`, `s_l = s`, and `0` otherwise.
  `F_{a0}` is `F_{γ, −N}` at `γ = a`, `N = 0`. Modulo `C₃` the element depends on `N`: for
  `γ = a ∈ ℤ(p)` and `N ≥ 1` the terms with `s = 2`, `a_1 = a`, `n_1 = 0`, `a_2 = 0`,
  `−N ≤ n_2 < 0` have `η(0, n_2) = 1`, and `D_{0n} = σⁿ(α₀)D₀` (1.4), so
  `F_{a, −N} ≡ F_{a, 0} − a·(Σ_{−N ≤ n < 0} σⁿ(α₀))·[D_{a0}, D₀] mod C₃`. The ideals do not
  depend on `N`: a `σ`-invariant ideal containing `ap^mΔ_{am}` plus brackets contains its bracket
  with `D₀`, which is `ap^m[D_{am}, D₀]` modulo `C₃`, so the ideals `L^{(v)}_W` of 7.3 are the same
  for every `N`. Layers 7–11 use the normalization above, which differs from the printed special
  basis by the unit factors `a`.
- **The case `v = 0` of Theorem B.** With `F₀ = D₀`, the ideal `𝒜(0)` is the whole augmentation
  ideal, while `𝒜^{(0)}` is generated by inertia. Theorem B, the Remark after it
  [Abrashkin 2010, p. 26] and Proposition 5.1 are therefore stated for `v > 0` only. Nothing in
  the proof uses `v = 0`: inertia is recovered as the closure of `⋃_{v > 0} Γ_K(p)^{(v)}`.

## Layer 0: Magnus algebras of free pro-`p` groups

Pure algebra; no field appears.

### 0.1 The profinite Magnus algebra

For a commutative ring `R` that is complete and separated for an ideal-adic topology (`ℤ_p`, `W(k)`,
`W(k)((t))^∧`, and the liftings of 1.2), and a type `I`, define
`𝒜_R(I) = lim_{S, n} R⟨X_i : i ∈ S⟩/𝒥ⁿ`. The limit runs over finite `S ⊆ I` and `n ≥ 1`, and the
transition maps send `X_i ↦ 0` for `i ∉ S`. The finite level, the free algebra modulo all words of
length `n`, is the truncated Magnus algebra of GeometricTopology §4.12.1 at `d = n − 1`. That
section supplies its basis of words (so it is a free `R`-module of finite rank), the truncations,
the deletion of variables and the universal property; this target owns the inverse limit. `𝒜_R(I)`
carries the inverse-limit topology, built from the topology of `R`; this is Abrashkin's "pro-free
algebra" `𝒜 = lim_{C, M} 𝒜_{CM}`, with generators converging to `0` [Abrashkin 2010, §1.2]. The
targets:
- the augmentation ideal `𝒥` and its closed powers, with `𝒥ⁿ/𝒥^{n+1}` the completed free
  module on words of length `n`;
- the universal property: a continuous ring homomorphism to a complete separated `R`-algebra
  `B` is determined by the images `b_i` of the `X_i`, and any family `b_i` in a closed ideal
  `𝔟` with `B = lim B/𝔟ⁿ` and `b_i → 0` along the cofinite filter occurs;
- base change `𝒜_R(I) ⊗̂_R R' = 𝒜_{R'}(I)` for `R → R'` continuous, and the semilinear
  extension of a continuous ring endomorphism of `R` that fixes the `X_i`;
- a continuous `R`-algebra endomorphism inducing a bijection on `𝒥/𝒥²` is an automorphism,
  by inversion degree by degree.

*Needs:* GeometricTopology §4.12.1 (the truncated Magnus algebra and its transition maps);
Mathlib's inverse limits of topological rings.

### 0.2 Lazard's theorem

[Lazard 1965; Koch 1970, Ch. 7; Serre, *Lie algebras and Lie groups*, Part I, Ch. IV, §6 for
discrete free groups]. Let `F` be the free pro-`p` group on the one-point compactification
`(I⁺, ∗)`, Tau Ceti's `freeProCPointed (finiteGroupClassP p) ∗`, with basis `x_i → 1`. Then:
- `θ : x_i ↦ 1 + X_i` extends to an isomorphism of topological rings
  `ℤ_p[[F]] ≅ 𝒜_{ℤ_p}(I)` from Tau Ceti's `completedGroupAlgebra ℤ_[p] F`, taking the
  augmentation ideal to `𝒥`;
- `θ⁻¹(1 + 𝒥ⁿ) = C_n(F)`, the closure of the `n`-th term of the lower central series, and `θ`
  induces injections `C_n(F)/C_{n+1}(F) ↪ 𝒥ⁿ/𝒥^{n+1}`;
- **recognition**: a continuous homomorphism `ψ : F → 1 + 𝒥` inducing an isomorphism
  `F^ab ≅ (1 + 𝒥) mod 𝒥²` is a closed embedding and extends to an isomorphism
  `ℤ_p[[F]] ≅ 𝒜_{ℤ_p}(I)`; so every continuous automorphism of `F` induces a continuous algebra
  automorphism of `𝒜_{ℤ_p}(I)`, and `Aut F ↪ Aut 𝒜_{ℤ_p}(I)`.

The same holds over `W(k)` after `⊗̂ W(k)`.
*Needs:* 0.1; Tau Ceti's `freeProCPointed`, its universal property and bases
([profinite pro-`p` groups roadmap](../../Completed/ProfiniteProPGroups/README.md), Layer 10),
and `completedGroupAlgebra`.

### 0.3 Class-two Lie algebras, `p ≠ 2`

For a Lie `ℤ_p`-algebra `L` with `⁅L, ⁅L, L⁆⁆ = 0`, `classTwoMul` is a group law
(`classTwoMul_assoc`). The group is `G(L)`, with identity `0` and inverse `−x`. Its commutator is
`⁅x, y⁆` and its `n`-th powers are `n·x`. For `F` as in 0.2, let `L₂(I)` be the closed Lie
subalgebra of `𝒜_{ℤ_p}(I) mod 𝒥³` generated by the `X_i`, which has class two. Let `θ'` be the
homomorphism `x_i ↦ exp(X_i) = 1 + X_i + X_i²/2 mod 𝒥³`; it is `θ` followed by the automorphism
`X_i ↦ X_i + X_i²/2` of `𝒜_{ℤ_p}(I)/𝒥³` (0.1). Then `log(1 + y) = y − y²/2 mod 𝒥³` gives
`log θ'(x_i) = X_i`, and `log θ'` is a homomorphism `F → G(L₂(I))`, since
`log(e^x e^y) = x ∘ y mod 𝒥³`. Its image is closed and stable under `∘`, commutators, sums
(`x + y = x ∘ y ∘ (−½⁅x, y⁆)`) and `ℤ_p`-multiples, so it is `L₂(I)`. Its kernel is
`θ'⁻¹(1 + 𝒥³) = C₃(F)` by 0.2, `log` being injective on `1 + 𝒥 mod 𝒥³`. So
`log θ' : F/C₃(F) ≅ G(L₂(I))`, compatibly with reduction modulo `p^M`:
`F/F^{p^M}C₃(F) ≅ G(L₂(I)/p^M L₂(I))`, the form [Abrashkin 2000, §4.2] uses with `M = 3`. With `θ`
itself, `log θ(x_i) = X_i − X_i²/2` is not a Lie element; in rank one it is not in `ℤ_p X`.
*Needs:* 0.1, 0.2.

**Checks.**

- `F` free pro-`p` of rank one: `𝒜_{ℤ_p}({1}) = ℤ_p[[X]]` is commutative, and `θ` is the
  isomorphism `ℤ_p[[ℤ_p]] ≅ ℤ_p[[X]]`, `1 ↦ 1 + X`, of Iwasawa theory.
- Rank two, `x = x₁`, `y = x₂`: `θ(x⁻¹y⁻¹xy) ≡ 1 + X₁X₂ − X₂X₁ mod 𝒥³`, so the commutator lies in
  `C₂(F)` and not in `C₃(F)`. The map `x_i ↦ 1 + X_i` into the commutative power series ring
  would send it to `1`, so the variables must not commute.
- `p = 2` is excluded from 0.3: the product needs `½ ∈ ℤ_p`, and `½ ∉ ℤ_2`.

## Layer 1: the Galois group `Γ_K(p)` in characteristic `p`

`K` has characteristic `p`, with residue field `k = 𝔽_{q₀}`, `q₀ = p^{N₀}`.

### 1.0 Coordinates

A uniformizer `t` and the Teichmüller section of `k`, a field embedding in characteristic `p`, give
a continuous isomorphism `k((t)) ≅ K`. Here `k((t))` is `LaurentSeries k` with Tau Ceti's
`TauCeti.LaurentSeries.isNonarchimedeanLocalField`. Every finite separable `L/K` has `t` as a
`p`-basis [Abrashkin 2010, §1.1].

### 1.1 Freeness

[Witt; Serre, *Galois Cohomology*, II §2.2]. For any field `K` of characteristic `p`,
`cd_p Γ_K(p) ≤ 1` (`cohomologicalDimensionAt_absoluteGaloisGroupProP_le_one_of_charP`). The reason
is that the Artin–Schreier sequence makes `H²(G_K, 𝔽_p) = 0` and inflation to `Γ_K(p)` is injective
in degree two. By Tau Ceti's pointed Serre theorem
(`IsProP.exists_convergesToOne_continuousMulEquiv_presentation_of_cohomologicalDimensionAt_le_one`),
`Γ_K(p)` is then free pro-`p` on a basis converging to `1`. For `K` a local field of characteristic
`p` the basis is countably infinite, by 1.3.

### 1.2 Liftings

[Abrashkin 2010, §1.1; Abrashkin 1998, §1.1; Berthelot–Messing 1990]. For `L/K` finite separable and
`M ≥ 1`, let `O_M(L) = W_M(σ^{M−1}L)[t_M] ⊆ W_M(L)`, where `t_M = [t]` is the Teichmüller
representative. The targets:
- `O_M(L)` is a flat `W_M(𝔽_p)`-algebra with `O_M(L)/p = L`, stable under `σ` and under
  `K`-automorphisms;
- `O_M(K) = W_M(k)((t))`, and `O(K) = lim_M O_M(K)` is the `p`-adic completion of
  `W(k)((t))`;
- `O_M(K^sep) = colim_L O_M(L)` and `O(K^sep) = lim_M O_M(K^sep)`, with their `G_K`-actions,
  and the same for `K(p)` and `Γ_K(p)`;
- `O(K^sep)^{G_K} = O(K)`, `O(K(p))^{Γ_K(p)} = O(K)`, and the `σ`-invariants of `O(K^sep)` and
  of `O(K(p))` are `W(𝔽_p) = ℤ_p`;
- **`σ − id` is surjective** on `O_M(K(p))`, hence on `O(K(p))`. At `M = 1` this is
  Artin–Schreier: a `p`-extension of `K(p)` is trivial. The general case follows by induction
  on `M`.

### 1.3 Witt–Artin–Schreier theory in Abrashkin's coordinates

[Abrashkin 2010, §1.4]. The targets:
- **the decomposition** [Abrashkin 2010, proof of Prop. 1.2 b), p. 7]:
  `O(K)/(σ − id)O(K) = ℤ_p α₀ ⊕ ⊕̂_{a ∈ ℤ(p)} W(k) t^{−a}`, the sum completed `p`-adically.
  The route has three steps:
  - *Reduce inside `O(K)`.* For `x ∈ tW(k)[[t]]`, `x = (σ − id)y` with
    `y = −Σ_{m ≥ 0} σ^m x`. Also `c t^{−ap^n} ≡ σ^{−n}(c) t^{−a}`, and
    `W(k) = ℤ_p α₀ ⊕ (σ − id)W(k)`. So every class has a representative `cα₀ + Σ c_a t^{−a}`
    with `c_a → 0`.
  - *Compare with `W(K)`.* The inclusion `O(K) ⊆ W(K)` commutes with `σ` and the Witt Frobenius,
    because `F[t] = [t]^p`, and so induces `O(K)/(σ − id)O(K) → W(K)/℘W(K) = Q_∞(K)`, the
    Artin–Schreier–Witt group of FunctionFieldArithmetic 3.1. There, `cα₀ ≡ (c/Tr β)β` modulo
    `(σ − id)W(k)` for the `β = [α]`, `Tr α ≠ 0`, of FunctionFieldArithmetic 3.2.
  - *Conclude.* The existence half of `aswReduced_exists_unique` gives surjectivity, and its
    uniqueness half gives injectivity and directness.

  `β = α₀` is not allowed in FunctionFieldArithmetic 3.2. That section needs a Teichmüller
  `β`, and there need be no Teichmüller representative of `W(k)`-trace exactly `1`; for
  instance with `p = 3` and `k = 𝔽₉`. The two normalizations differ by the unit
  `Tr β ∈ ℤ_p^×`, which the comparison absorbs;
- the pairing `(τ, x) ↦ τy − y` for `(σ − id)y = x`, `y ∈ O(K(p))`, identifies
  `Γ_K(p)^ab` with `Hom_cts(O(K)/(σ − id)O(K), ℤ_p)` (FunctionFieldArithmetic 3.1 (iii) at
  infinite length, read through the comparison above);
- the basis `τ₀`, `τ_a^{(r)}` of `Γ_K(p)^ab` dual to `α₀`, `α_r t^{−a}` corresponds under
  local reciprocity to `t` and to `E(β_r, t^a)^{1/a}` [Abrashkin 2010, pp. 7–8], where
  `E(β, X) = exp(Σ_{n ≥ 0} σⁿ(β)X^{pⁿ}/pⁿ)` is Shafarevich's exponential. This is the
  Schmid–Witt explicit formula, FunctionFieldArithmetic 4.3, evaluated on these units;
- **unramified base change** [Abrashkin 2010, Prop. 1.3]: for `k'/k` finite, `N₀ | N₀'`, and
  `K' = k'((t))`, the map `Γ_{K'}(p)^ab → Γ_K(p)^ab` sends `D'_{an} ↦ D_{a, n mod N₀}`, read
  after `⊗ W(k')`. The source prints no proof; it follows from the reciprocity description and
  the trace.

### 1.4 The Magnus algebra of `K`

[Abrashkin 2010, §§1.2–1.3]. The targets:
- `𝒜_k = 𝒜_{W(k)}(I)` on the generators `D_{an}`, `a ∈ ℤ(p)`, `n ∈ ℤ/N₀`, and `D₀`;
- the `σ`-semilinear automorphism `D_{an} ↦ D_{a, n+1}`, `D₀ ↦ D₀`, and
  `𝒜 = 𝒜_k^{σ = id}`, free on `D_a^{(r)} = Σ_n σⁿ(β_r)D_{an}` and `D₀`, with
  `D_{an} = Σ_r σⁿ(α_r)D_a^{(r)}`;
- the finite levels `𝒜_{CM}`, generators with `a ≤ C` and coefficients modulo `p^M`, and
  their reductions `mod 𝒥ⁿ_{CM}`;
- `𝒜_K = 𝒜_{O(K)}(I)`, `𝒜_{K(p)} = 𝒜_{O(K(p))}(I)`, with `𝒥_K`, `𝒥_{K(p)}`, the
  `σ`-semilinear Frobenius acting on both the coefficients and the generators, and
  `Γ_K(p)` acting on the coefficients of `𝒜_{K(p)}`;
- `D_{0n} = σⁿ(α₀)D₀`, and `e = 1 + Σ_{a ∈ ℤ(p)} t^{−a}D_{a0} + α₀D₀ ∈ 1 + 𝒥_K`.

### 1.5 A solution of `σ(f) = f·e`

[Abrashkin 2010, Prop. 1.1]. There is `f ∈ 1 + 𝒥_{K(p)}` with `σ(f) = f·e`. The finite-level
solution sets `S_{CMn}` are nonempty, by induction on `n` using 1.2's surjectivity of `σ − id`. They
are finite, and each element is defined over a finite extension of `K` inside `K(p)`. `f` is an
element of `lim S_{CMn}`.

### 1.6 The Magnus embedding

[Abrashkin 2010, Prop. 1.2]. For such `f` and `τ ∈ Γ_K(p)` put `ψ_f(τ) = (τ⁻¹f)·f⁻¹`. It is
`σ`-invariant, hence in `1 + 𝒥`, and `ψ_f` is a homomorphism (see the conventions). Then:
- (a) `ψ_f : Γ_K(p) → (1 + 𝒥)^×` is a closed embedding;
- (b) `ψ_f` induces an isomorphism of topological groups
  `Γ_K(p)^ab ≅ (1 + 𝒥) mod 𝒥²`, under which `τ₀⁻¹ ↦ 1 + D₀` and
  `(τ_a^{(r)})⁻¹ ↦ 1 + D_a^{(r)}`, so `τ₀ ↦ 1 − D₀` and `τ_a^{(r)} ↦ 1 − D_a^{(r)}`;
- (c) for another solution `f₁`, `ψ_{f₁} = c·ψ_f·c⁻¹` with `c = f₁f⁻¹ ∈ 1 + 𝒥`;
- (d) `ψ_f` extends to an isomorphism `ℤ_p[[Γ_K(p)]] ≅ 𝒜`, so every continuous automorphism
  of `Γ_K(p)` induces a continuous `ℤ_p`-algebra automorphism of `𝒜`.

Route: (b) is 1.3, since `ψ_f(τ) ≡ 1 + Σ(τ⁻¹f_a^{(r)} − f_a^{(r)})D_a^{(r)} + … mod 𝒥²`,
where `(σ − id)f_a^{(r)} = α_r t^{−a}`. Since `τ ↦ τy − y` is additive,
`τ⁻¹y − y = −(τy − y)`, which gives the signs. (a) and (d) are 0.2's recognition applied with 1.1.
*Needs:* Layer 0; 1.1–1.5.

**Checks.**

- `x^p − x = c t^{−a}`, `c ∈ k^×`, `p ∤ a`: this is a `ℤ/p`-extension with upper jump `a`
  (FunctionFieldArithmetic 4.4 at length one: conductor `a + 1`). Its character is a combination
  of the `D_{an} mod (p, 𝒥²)` with first index `a`, and its kernel contains
  `Γ_K(p)^{(v)}` exactly for `v > a`.
- `k = 𝔽_p` (`N₀ = 1`): the second index is trivial, `𝒜 = 𝒜_k`, and
  `e = 1 + Σ t^{−a}D_{a0} + D₀`.
- The sign in 1.6 (b), rank one: for `k = 𝔽_p`, `α₀ = 1`, the `D₀`-coefficient `f₀` of `f`
  satisfies `σf₀ = f₀ + 1`. The arithmetic Frobenius `τ₀` acts on it as `σ`, so `τ₀⁻¹f₀ = f₀ − 1`
  and `ψ_f(τ₀) ≡ 1 − D₀ mod 𝒥²`. A version of 1.6 (b) with `τ₀ ↦ 1 + D₀` has the wrong sign.
- A plausible wrong embedding `τ ↦ (τf)f⁻¹` with the usual composition is an
  anti-homomorphism: `ψ(τ₁τ₂) = ψ(τ₂)ψ(τ₁)`. The inverse in 1.6 is needed.

## Layer 2: the ramification ideals modulo `𝒥³`

Setting of Layer 1, with `f` and `ψ = ψ_f` fixed.

### 2.1 Definitions

[Abrashkin 2010, §§4.1–4.2, pp. 25–26]. The targets:
- for `v > 0`, `𝒜^{(v)}` is the smallest closed two-sided ideal of `𝒜` containing
  `ψ(τ) − 1` for all `τ ∈ Γ_K(p)^{(v)}`; it is a decreasing filtration, and its image in
  each `𝒜_{CM} mod 𝒥ⁿ_{CM}` is written `𝒜^{(v)}_{CM} mod 𝒥ⁿ_{CM}`;
- for `γ > 0`, the element `F_γ ∈ 𝒜_k`:

  ```text
  F_γ = p^{v_γ} a_γ D_{a_γ v_γ}
        − Σ_{a₁, a₂ ∈ ℤ(p), n ≥ 0, pⁿ(a₁ + a₂) = γ} pⁿ a₁ D_{a₁ n} D_{a₂ n}
        − Σ_{a₁, a₂ ∈ ℤ(p), n₁ ≥ 0, n₂ < n₁, p^{n₁}a₁ + p^{n₂}a₂ = γ} p^{n₁} a₁ [D_{a₁ n₁}, D_{a₂ n₂}],
  ```

  where the first two terms occur only for `γ ∈ ℕ`, with `γ = p^{v_γ}a_γ` and
  `a_γ ∈ ℤ(p)`. `n₂` may be negative, which is how non-integral `γ` arise. The last sum is
  finite: `p^{n₁}a₁ + p^{n₂}a₂ = p^{n₂}(p^{n₁−n₂}a₁ + a₂)` with the bracket prime to `p`, so
  `n₂ = v_p(γ)` is forced, and `p^{n₁}a₁ < γ`;
- `𝒜(v)`: `𝒜(v) ⊗ W(k)` is the smallest closed `σ`-invariant ideal of `𝒜_k` containing every
  `F_γ`, `γ ≥ v`;
- the truncations `F̃_γ(v₀)`, keeping only the degree-two terms with
  `p^{n₁}a₁, p^{n₁}a₂ < v₀`.

### 2.2 The abelian level

[Abrashkin 2010, Prop. 4.2 and Remark a), p. 26]. For `v > 0`, `𝒜^{(v)}_k mod 𝒥²_k` is topologically
generated by the `p^s D_{an}` with `p^s a ≥ v`. So `𝒜^{(v)} ≡ 𝒜(v) mod 𝒥²`. The source prints no
proof ("class field theory implies"). The route has four steps:
- for `v ∈ (0, 1]`, `Γ_K(p)^{(v)}` is inertia, and the statement is that `D₀` drops out;
- let `H_v` be the image of `Γ_K(p)^{(v)}` in `Γ_K(p)^ab`. It is closed, so by duality it is
  the annihilator of its annihilator in `Hom_cts(Γ_K(p)^ab, ℤ_p) = O(K)/(σ − id)O(K)` (1.3),
  read at every finite length;
- a class `y = cα₀ + Σ c_a t^{−a}` of length `M` kills `H_v` iff `G_K(v)` acts trivially on
  `K(℘⁻¹y)`. By FunctionFieldArithmetic 4.4 (`aswUpperRamification`; conductor
  `1 + max a·p^{M − v(c_a) − 1}` at length `M`) this holds iff `a·p^{M − 1 − v(c_a)} < v` for every
  `a` with `c_a ≠ 0`, that is `c_a ∈ p^{M − s(a, v)}W_M(k)`, with no condition on `c`. Here
  `s(a, v)` is the least `s ≥ 0` such that `ap^s ≥ v`;
- dually, `H_v` is the closed subgroup of `Γ_K(p)^ab` with zero `τ₀`-coordinate and
  `τ_a^{(r)}`-coordinate in `p^{s(a, v)}ℤ_p`. Through 1.6 (b), this is the generation by the
  `p^s D_{an}`, `p^s a ≥ v`.

An equivalent route goes through unit-filtration reciprocity: `τ_a^{(r)}` corresponds to
`E(β_r, t^a)^{1/a}` (1.3), `E(w, t^a)^{p^s} = E(σ^s w, t^{ap^s})`, and `U^{(m)}` is the closure
of the subgroup generated by the `E(w, t^j)`, `j ≥ m`.
- **Consequence** used in Layer 3: if a continuous automorphism of `𝒜` preserves every
  `𝒜^{(v)}`, `v > 0`, its matrix on `I_K(p)^ab ⊗ 𝔽_p` is upper triangular in the first index.

### 2.3 Finite levels

[Abrashkin 2010, Props. 4.1, 4.3]. The targets:
- **left continuity**: for every `C, M, n` and `v₀ > 0` there is `0 < δ < v₀` with
  `𝒜^{(v)}_{CM} ≡ 𝒜^{(v₀)}_{CM} mod 𝒥ⁿ_{CM}` for `v ∈ (v₀ − δ, v₀)`;
- **truncation**: modulo `𝒥³`, `𝒜_k(v₀)` is the smallest closed `σ`-invariant ideal
  containing the `F̃_γ(v₀)`, `γ ≥ v₀`, and `F̃_γ(v₀) = γ D_{a_γ v_γ}` for integral
  `γ ≥ 2v₀`, `0` for non-integral `γ ≥ 2v₀`. The printed statement of Prop. 4.3 a) is
  garbled; this is the reading its proof supports.

### 2.4 Theorem B′

[Abrashkin 2010, p. 27; proof §§4.3–4.7, pp. 27–35]. For `C ∈ ℕ`, `M ≥ 0` and `v₀ > 0`: if
`𝒜^{(v)}_{C, M+1} ≡ 𝒜_{C, M+1}(v) mod 𝒥³` for every `v > v₀`, then the same holds at `v₀`. The proof
is a target in its parts:
- **the auxiliary field** (Lemma 4.4, p. 28): `K₁ = k((t₁))`, totally ramified over `K` of
  degree `q = p^{N*}`, isomorphic to `K` as a field, with one upper jump `r*`, and the
  expansion of `t^{p^M}` in `t₁` through `E(·, ·)`;
- **the criterion** (Prop. 4.5, p. 30): `ℬ^{(v₀)}` is the smallest ideal `I` such that the
  comparison element `X` between `σ^M f` and `σ^{M+N*}f₁` is, modulo `I`, defined over an
  extension of `K₁` with upper ramification numbers `< qv₀ − r*(q − 1)`;
- **the recurrence** (pp. 31–33): the derivation of (4.2)–(4.6), the series `𝓔_r(b, T)`, the
  decomposition of `ω`, and the truncation to `N* − r` terms;
- **the estimates** (Lemmas 4.6–4.9, pp. 34–35): the product, commutator and linear terms lie
  in the ideals the recurrence needs, and `F'_γ ≡ F_γ mod ℬ^{(v₀)}_k 𝒥_k` for `γ ≥ v₀`;
- **the end of the proof**: `pF_{v₀} ∈ ℬ^{(v₀+)}_k`, by counting the degree-two terms of
  `F_{v₀}` and of `σ⁻¹F_{pv₀}`. When `F_{v₀} ∉ I_k`, the extension `K₁(X'', I)/K₁` has upper
  ramification number exactly `qv₀ − r*(q − 1)`, because modulo the functionals of `ℬ/I` the
  element `X''` reduces to Artin–Schreier equations `z^p − z = −c t_{K₁}^{−N}` with `p ∤ N`.
  The source states both without proof.

**Source corrections**, in force for every implementation:
- the ideal used in §§4.5–4.7 is `ℬ^{(v₀)}𝒥 + 𝒥ℬ^{(v₀)}`; the printed `ℬ^{(v₀)}𝒥` misses
  `𝒥ℬ^{(v₀)}`. Modulo `𝒥³`, the span of the `p^s D_{as}·D` is not the span of the
  `D·p^s D_{as}`. Case (1) of Lemma 4.8 and the brackets of Lemma 4.7 (p. 34) need `𝒥ℬ^{(v₀)}`.
  The remark on p. 33, "we may assume `I ⊃ ℬ^{(v₀)}𝒥`", gives `𝒥ℬ^{(v₀)} ⊂ I` by the same
  argument. `ℬ^{(v₀+)}` is defined with the sum;
- property (2) of §4.5 reads `𝓔_r(b, T) = p^r bT + p^r T² g_r(T)`;
- `𝔪₁ = t₁W_{M+1}(k)[[t₁]]`;
- in Lemma 4.4, `t ≡ t₁^q E(…)`.

### 2.5 Theorem B

[Abrashkin 2010, p. 27]. For every `v > 0`, `𝒜^{(v)} ≡ 𝒜(v) mod 𝒥³`. It is proved by descending
transfinite induction from 2.4 at every level `(C, M)`, with 2.3. The induction starts above
`v₀ = inf{w : [w, ∞) ⊆ S}`, where `S` is the set where the equality holds; `inf S` alone does not
give 2.4's hypothesis.

*Layer 2 needs:* Layer 1; FunctionFieldArithmetic 3.1–3.2 and 4.3–4.4; Tau Ceti's Artin–Schreier
theory (`TauCeti/FieldTheory/ArtinSchreier/`).

**Checks.**

- `F₁ = D_{10}`: no degree-two term has `pⁿ(a₁ + a₂) = 1` or `p^{n₁}a₁ + p^{n₂}a₂ = 1`.
- For `p` odd, `F₂ = 2D_{20} − D_{10}²`. For `p = 2`, `F₂ = 2D_{11} − D_{10}²`, because
  `2 = 2¹·1`. A formula ignoring `v_γ` would give `2D_{20}`, which does not exist for `p = 2`.
- `F_{1 + 1/p} = −[D_{10}, D_{1, −1}]`, from `n₁ = 0`, `a₁ = 1`, `n₂ = −1`, `a₂ = 1`. So
  `𝒜(v) mod 𝒥³` has a jump at the non-integral `v = 1 + 1/p`, while `𝒜(v) mod 𝒥²` jumps only at
  integers (Hasse–Arf). A version of the third sum with `n₂ ≥ 0` would miss this jump.
- `v₀ = 1`, `γ = 2`, `p` odd: no degree-two term survives the truncation `< v₀ = 1`, so
  `F̃₂(1) = 2D_{20}`, as 2.3 predicts for `γ ≥ 2v₀`.

## Layer 3: automorphisms of `I_K(p)^ab ⊗ 𝔽_p`

Setting of Layer 1.

### 3.1 The module `ℳ` and admissibility

[Abrashkin 2010, §§2.1–2.3, pp. 8–10]. The targets:
- `ℳ = I_K(p)^ab ⊗ 𝔽_p ≅ U_K/U_K^p` by reciprocity, and `ℳ_k = ℳ ⊗ k`, with the free
  topological generators `D_{an}`, the images of 1.6 (b);
- `Aut K = ⟨Fr(t)⟩ ⋉ Aut⁰K`, where `Fr(t)` fixes `t` and is `σ` on `k`, and `Aut⁰K` is the
  automorphisms trivial on `k`, each determined by `η(t)`;
- the action `η^*` of `Aut K` on `ℳ`, by conjugation with any extension of `η` to `K(p)`;
- the coefficients `α_{abn}(f) ∈ k` of an `f ∈ Aut ℳ`, defined by
  `f(D_{a0}) = Σ α_{abn}(f)D_{bn}`, and the rule
  `f(D_{am}) = Σ σ^m(α_{abn}(f))D_{b, n+m}`;
- the filtration `ℳ^{(v)}`, spanned over `k` by the `D_{an}` with `a ≥ v`;
- `Aut_adm ℳ`: the `f` with `α_{a, b, m mod N₀}(f) = 0` whenever `bp^m < a`, for
  `−N₀ < m ≤ 0`. It is a subgroup, preserves every `ℳ^{(a)}`, and has `α_{aa0}(f) ∈ k^×` and
  `α_{aan}(f) = 0` for `n ≠ 0`;
- the analytic part `f_an(D_{a0}) = Σ_b α_{ab0}(f)D_{b0}`.

### 3.2 Field automorphisms

[Abrashkin 2010, Props. 2.1–2.7, pp. 9–13]. The targets:
- Prop. 2.1: `Fr(t)^*D_{an} = D_{a, n−1}`, `Fr(t)^*D₀ = D₀`, and for `η ∈ Aut⁰K`,
  `Σ_a t^{−a}η^*(D_{a0}) ≡ Σ_a η⁻¹(t)^{−a}D_{a0} mod (k + (σ − id)K) ⊗ ℳ`;
- Prop. 2.2 and Cor. 2.3 (one proof, printed under Cor. 2.3): `f ↦ f_an` is multiplicative
  modulo `ℳ^{(v)}` for `v < p^{N₀}`;
- Prop. 2.4: `η^* ∈ Aut_adm ℳ` for `η ∈ Aut⁰K`;
- Props. 2.5 (`p ≠ 2`) and 2.6 (`p = 2`): one normalization step of `f_an` by an `η^*` with
  `η(t) ≡ t mod t^{w₀}`;
- Prop. 2.7: equality of the `α_{cb0}(η^*)` for `a ≤ c ≤ b < w₀` determines `η(t)` modulo
  `t^{v₀}`, with `v₀ = w₀ − a + 1` for `p ≠ 2` and `(w₀ − a + 1)/2` for `p = 2`.

**Source corrections** (Prop. 2.7's proof, pp. 13–14): read "`a + 2M ≥ w₀`" for
"`2M ≥ w₀`"; for `M = 1` and `p = 2` run its two steps in the other order; when `a ≡ −1` and
`v ≡ 3 mod p` use the row `a + 2`.

### 3.3 Compatibility with the ramification ideals

[Abrashkin 2010, §5, pp. 35–43]. Let `A = 𝒜/𝒥³`, `A^{(v)} = 𝒜^{(v)} mod 𝒥³`, and let `f` be a
continuous `ℤ_p`-algebra automorphism of `A` with `f(A^{(v)}) = A^{(v)}` for all `v > 0`. By 1.6
(d), every filtered automorphism of `Γ_K(p)` gives one. The targets:
- the elements `ℱ_γ(v)` and the submodules `A^{(v)}_tr`, `A^{(v)}_adm` of §§5.1–5.2, with the
  product sum of `ℱ_γ(v)`, `γ = ap^m`, restricted to `n < m` (the terms with `n = m` lie in
  `Δ_{am}`). For integral `γ` no bracket term remains: `p^{n₁}a₁ + p^{n₂}a₂ = ap^m` with
  `n₂ < n₁` and `p ∤ a₂` forces `n₂ = m`, so those terms lie in `p^m a Δ_{am} = p^m σ^m F_a`;
- Prop. 5.1: `A^{(v)}_k` is the smallest closed `σ`-invariant ideal containing the
  `ℱ_γ(v)`, `γ ≥ v` (Theorem B and 2.3);
- Prop. 5.2: `A^{(v)}_adm ⊇ A^{(v)}_k ⊇ A^{(v)}_tr ⊇ pA^{(v)}_adm`, the stated `k`-basis of
  `A^{(v)}_adm/A^{(v)}_tr`, and `f(A^{(v)}_tr) = A^{(v)}_tr`;
- Prop. 5.3: each `adm₂` element occurs in exactly one `σ^mℱ_γ(v)`;
- Prop. 5.4 and Cor. 5.5: `α_{110}(f) = α` forces `α_{aa0}(f) = α^a`, for `a < p^{N₀−1}` when
  `p ≠ 2` and `N₀ ≥ 2`, and for `a < 2^{N₀}` when `p = 2` and `N₀ ≥ 3`;
- **Prop. 5.6**: for `N₀ ≥ 3`, `α_{110}(f) ≠ 0` and `a, b < p^{N₀−2}`, `α_{a, b, −m}(f) = 0`
  whenever `b/p^m < a`. So `f` is admissible below `p^{N₀−2}`;
- Prop. 5.7 and Lemma 5.8: periodicity of `α_{b, b+r, 0}(f)` in `b` with period `δ(p)`
  (`p` for `p ≠ 2`, `4` for `p = 2`). The proof proves the shift by `+δ(p)`, and that is the
  statement;
- **Prop. 5.9**: for `α_{110}(f) ≠ 0` and `N₀ ≥ 3` there is `η ∈ Aut⁰K` with
  `α_{ab0}(η^* ∘ f) = δ_{ab}` for `a ≤ b < p^{N₀−3}`; here `η(t) = α_{110}(f)⁻¹t` at the
  first step.

The triangularity `α_{abm}(f) = 0` for `b < a`, which Props. 5.4 and 5.6 use without saying so,
is the consequence in 2.2.

**Checks.**

- `η(t) = αt`, `α ∈ k^×`: by Prop. 2.1, `η^*` is diagonal with `α_{aa0}(η^*) = α^a`, the
  pattern of Prop. 5.4. A version with `η(t)` in place of `η⁻¹(t)` would give `α^{−a}`.
- For `N₀ ≥ 2`, `Fr(t)^*` is not in `Aut_adm ℳ`: `α_{1, 1, −1}(Fr(t)^*) = 1`, against
  `α_{aan} = 0` for `n ≠ 0`. The Frobenius twist is split off in Layer 5.

## Layer 4: compatible systems and field isomorphisms

`K = k((t))`, `K' = k((t')) ⊆ K(p)`, with the same residue field. For `s ≥ 0`, `K_s` is the
unramified extension of degree `p^s` in `K(p)`, with residue field `k_s`, `N_s = N₀p^s`.
`K_ur = ⋃ K_s` has residue field `k(p)` [Abrashkin 2010, §3].

### 4.1 The modules

[Abrashkin 2010, §§3.1–3.2, pp. 14–16]. The targets:
- `ℳ_{Ks} = I_{K_s}(p)^ab ⊗ 𝔽_p`, `ℳ̄_{Ks} = ℳ_{Ks} ⊗̂ k(p)`, the connecting maps `j_s`, and the
  generators `D^{(s)}_{an}` and `D^∞_{an} = lim_s D^{(s)}_{a, n mod N_s}` for `n ∈ ℤ`;
- `ℳ_{K∞}`, the `k(p)`-module of formal sums `Σ c_{an}D^∞_{an}`, `a ∈ ℤ(p)`, `n ∈ ℤ`, on which
  a compatible system acts through its coefficient matrices (Remark after Prop. 3.3). The
  source does not specify the topology in which `ℳ_{K∞}` is "topologically generated", and
  the closed span of the `D^∞_{an}` in `ℳ̄_{K ur}` is everything. This formal-sum module is
  therefore a pinned convention of this roadmap, and Layer 4 uses no other `ℳ_{K∞}`;
- `Ω̂¹ = Ω̂¹_{𝒪_{K_ur}}`, the `t`-adically completed differentials, with the Cartier operator
  `C`. It is `σ⁻¹`-linear, its kernel is the exact forms, and
  `C(g^p dt/t) = g dt/t`;
- `π_{Ks}(u ⊗ α) = α du/u` and `π_{K∞}(D^∞_{an}) = t^{ap^n − 1}dt` for `n ≥ 0`, `0` for `n < 0`;
- Prop. 3.1: `ℳ_{K∞}` does not depend on `t`;
- Prop. 3.2: `π_{K∞}` maps onto `Ω̂¹`, with kernel spanned by the `D^∞_{an}`, `n < 0`.

### 4.2 Admissible systems

[Abrashkin 2010, §§3.3–3.4, pp. 16–19]. The targets:
- a **compatible system** `f_{KK'} = {f_{KK's}}` of continuous maps `ℳ_{Ks} → ℳ_{K's}`
  commuting with the `j_s`;
- **admissible**: (A1) `f_{KK'∞} : Ω̂¹_K ≅ Ω̂¹_{K'}` with `π' ∘ f_ur = f_∞ ∘ π`, (A2) `f_∞`
  commutes with Cartier, (A3) `f_∞(t^mΩ̂¹) ⊆ t'^mΩ̂¹`;
- the consequences: `f_∞` is unique, composites are admissible, exact forms go to exact
  forms, the expansion (3.1) with coefficients `α^∞_{a, b, −m}`, and `α^∞_{a, b, −m} = 0` for
  `b/p^m < a`;
- **special admissible**: `f_ur(ℳ_{K∞}) ⊆ ℳ_{K'∞}`;
- **Prop. 3.3**: a compatible system of isomorphisms is special admissible iff there are
  `v_s → ∞` with `α_{a, b, −m mod N_s}(f_{KK's}) = 0` whenever `a, b < v_s` and `b/p^m < a`.
  The isomorphism hypothesis is needed: the zero system satisfies the coefficient condition.

### 4.3 Analytic and locally analytic systems

[Abrashkin 2010, §§3.5–3.6, pp. 19–20]. The targets:
- `Iso⁰(K, K')`, the field isomorphisms trivial on `k`, and the analytic systems
  `η^*_{KK'} = {η_s^*}` with `η_{∞} = Ω¹(η)`, which are special admissible;
- the Frobenius systems `Fr(t_K)^*`: compatible and not admissible, since `Fr(t_K)_∞` is the
  Cartier operator. A system `θ_s^*` from field isomorphisms is special admissible iff its
  Frobenius exponent `n̄ ∈ lim ℤ/N_sℤ` is `0`;
- `f_{KK'an} = f_∞|_{d𝒪̂}` and **locally analytic**: there are `v_s → ∞` and
  `η_s ∈ Iso⁰(K_s, K'_s)` with `f_an ≡ d(η_s) ⊗̂ k(p) mod t'^{v_s}`. The printed definition
  takes `η_s ∈ Iso⁰(K, K')`; the proof of Prop. 3.4 and §6 need `K_s`;
- **Prop. 3.4**: a special admissible, locally analytic system has `f_an = d(η) ⊗̂_k k(p)` for
  some `η ∈ Iso⁰(K, K')`. This is the recovery step, by Prop. 2.7 at every level.

### 4.4 Comparable systems

[Abrashkin 2010, §3.7, pp. 20–25]. For `L ⊇ K`, `L' ⊇ K'` finite in `K(p)` and `L/K`, `L'/K'`
Galois, the targets are:
- **comparability** of systems `g_{LL'}`, `f_{KK'}` of module maps, through the squares with
  `ℳ_{Ls} → ℳ_{Ks}`, and the limit square (3.2);
- **condition C**: an isomorphism `κ : I_{L/K} ≅ I_{L'/K'}` intertwining the inertia actions;
- **Prop. 3.5**: admissibility passes from `g_{LL'}` to `f_{KK'}`;
- **Prop. 3.6**: if both systems are special admissible and locally analytic and condition C
  holds, then `η_{LL'}|_K = η_{KK'}`.

*Layer 4 needs:* Layers 1 and 3; ClassFieldTheory Layer 7 (reciprocity `I_{K_s}(p)^ab ≅ U_{K_s}`).

**Checks.**

- For `η ∈ Iso⁰(K, K')` the analytic system has `f_an = d(η) ⊗̂ k(p)` on the nose, so Prop. 3.4
  returns `η`. Prop. 2.7 makes it unique, because the matrices of `η^*` below `w₀` determine
  `η(t) mod t^{v₀}`.
- `C(c·t^{ap^n}dt/t) = σ⁻¹(c)·t^{ap^{n−1}}dt/t` for `n ≥ 1` and `C(c·t^a dt/t) = 0`, since
  `t^a dt/t = d(t^a)/a` is exact. So `C^{n+1}` kills `t^{ap^n}dt/t`, and (A2) forces `C'^{n+1}`
  to kill its image. That is the vanishing pattern of (3.1).

## Layer 5: Theorem A in characteristic `p`

`E`, `E'` local fields of residue characteristic `p`, `g : Γ_E(p) ≃ₜ* Γ_{E'}(p)` filtered.

### 5.0 Maximal `p`-extensions of subfields

In either characteristic, for `L ⊆ E(p)` that is Galois over `E` or finite over `E`, `E(p)` is a
maximal `p`-extension of `L`. For `L` Galois: a `p`-extension of `L` has Galois closure over `E`
that is an extension of a pro-`p` group by a pro-`p` group. For `L` finite: `Gal(E(p)/L)` is open in
the pro-`p` group `Γ_E(p)`, hence subnormal, so `E ⊆ L` is a chain of Galois steps of degree `p`,
and the Galois case applies along it. Also `Γ_E(p)^{(v)} ∩ Gal(E(p)/L)` is the image of
`G_E(v) ∩ G_L`. For `L` finite this is `Γ_L(p)^{(ψ_{L/E}(v))}`, by FilteredLocalGaloisGroups 2.2.

### 5.1 First invariants

[Abrashkin 2010, §6, first step]. The targets:
- `E` has characteristic `p` iff `Γ_E(p)^ab ⊗ 𝔽_p` is infinite. In characteristic `0` it is
  finite, by Tau Ceti's `isTopologicallyFinitelyGenerated_absoluteGaloisGroupProP`;
- in characteristic `p`, the jumps of the image of the filtration in `ℳ` are the `a ∈ ℤ(p)`,
  and each graded piece has `𝔽_p`-dimension `N₀`, so `#k` is recovered;
- hence `E ≅ E'`, and `E(p)`, `E'(p)` may be identified.

### 5.2 Open subgroups of `Γ_E(p)`

For `K ⊆ E(p)` finite over `E`, the filtration of `Γ_E(p)` restricted to `Γ_K(p)` in the sense of
FilteredLocalGaloisGroups 1.5 is the upper filtration of `Γ_K(p)`. Through 5.0 this is
FilteredLocalGaloisGroups 2.2 on the pro-`p` quotients. So `g(Γ_K(p)) = Γ_{K'}(p)` gives a filtered
`Γ_K(p) ≅ Γ_{K'}(p)`.

### 5.3 The construction

[Abrashkin 2010, §6, pp. 44–47]. Take `K ⊆ E(p)` finite Galois over `E` with `N₀(K) ≥ 3`; these are
cofinal, by unramified extension. Fix uniformizers `t_K`, `t_{K'}`. The targets are the steps:
- the compatible systems `g_{KK'} = {g_{KK's}}` induced by `g` on the `ℳ̄_{Ks}`, and their
  coefficients `α_{abm}(g_{KK's})`;
- an `n_s ∈ ℤ/N_s` with `α_{1,1,n_s}(g_{KK's}) ≠ 0`, unique by Prop. 5.6, with `n_{s+1} ≡ n_s`, and
  `n̄_{KK'} = lim n_s`. Every level has `N_s = N₀(K)p^s ≥ 3`, so Prop. 5.6 applies at each;
- `g⁰_{KK's} = Fr(t_{K'})^{n_s*} ∘ g_{KK's}` and `h_s = ξ_s^* ∘ g⁰_{KK's}` with
  `ξ(t_{K'}) = t_K`. `h_s` comes from a filtered automorphism of `Γ_{K_s}(p)`, so it is admissible
  below `p^{N_s−2}` by Prop. 5.6 and normalized by Prop. 5.9. So `g⁰_{KK'}` is special
  admissible (Prop. 3.3) and locally analytic;
- `η_{KK'} ∈ Iso⁰(K, K')` from Prop. 3.4, and
  `μ_{KK'} = Fr(t_{K'})^{−n̄_{KK'}} ∘ η_{KK'} ∈ Iso(K, K')`;
- **Prop. 6.1** (p. 45): for `L ⊇ K` finite Galois over `E` in `E(p)`, `μ_{LL'}|_K = μ_{KK'}`,
  and `μ_{LL'} ∘ τ = κ(τ) ∘ μ_{LL'}` for `τ ∈ I_{L/K}`, `κ` induced by `g`. In the definition
  of `μ_{LL'}` the Frobenius is `Fr(t_{L'})`, and `n̄_{LL'}` lies in `lim ℤ/N_{0,L}p^sℤ`;
- **Prop. 6.2** (p. 47): `μ = colim μ_{KK'}` is a continuous field isomorphism
  `E(p) → E'(p)` with `μ(E) = E'` and `μ^* = g`.

### 5.4 Theorem A, characteristic `p`

[Abrashkin 2010, Thm. A, p. 2]. For `E` of characteristic `p` and any `E'`, every filtered
`g : Γ_E(p) ≃ₜ* Γ_{E'}(p)` is `μ^*` for a continuous field isomorphism `μ : E(p) → E'(p)` with
`μ(E) = E'`. With 6.4, this is `exists_ringEquiv_conj_of_filtered_absoluteGaloisGroupProP`, stated
for isomorphisms of algebraic closures restricting to `K ≃ K'`; `μ` is the restriction.

### 5.5 Uniqueness

`μ` is unique, in both characteristics. If `μ₁^* = μ₂^*`, then `ν = μ₂⁻¹μ₁` centralizes `Γ_E(p)`. It
is continuous, because the `μ_i` are. It preserves every finite `K ⊆ E(p)` over `E`, Galois or not,
being the fixed field of a closed subgroup, and centralizes `Γ_K(p)`, the Galois group of the
maximal `p`-extension `E(p)` of `K` (5.0). By the naturality of reciprocity (`artinMap_congr`),
`ν|_K` then acts trivially on the `p`-adic completion `K̂^×` of `K^×`. The kernel of `K^× → K̂^×` is
`μ_{q−1}` in both characteristics, so `K̂^×` contains the principal units `U^{(1)}_K`, and
`ν(U^{(1)}_K) = U^{(1)}_K` by continuity. `ν(1 + πx) = 1 + πx` for all `x ∈ 𝒪_K` gives `ν|_K = id`,
so `ν = id`. The source does not state uniqueness; §7 needs it, and so does 6.3. The same argument
applied to `ν ∈ Z(Γ_E(p))` gives `Z(Γ_E(p)) = 1`.

### 5.6 The filtered outer form

With FilteredLocalGaloisGroups 2.4 composed with the maximal pro-`p` quotient, `μ ↦ μ^*` is a
bijection from the field isomorphisms `E(p) → E'(p)` carrying `E` to `E'` onto the filtered
isomorphisms `Γ_E(p) ≃ₜ* Γ_{E'}(p)`. Inner automorphisms by `Γ_{E'}(p)` correspond to
post-composition with `Γ_{E'}(p)`.

**Checks.**

- `E = E'` and `g` conjugation by `τ₀ ∈ Γ_E(p)`: by 5.5, `μ = τ₀` is the only answer.
- `g` conjugation by an extension of `Fr(t)` to `E(p)`: the answer `μ` has `μ|_E = Fr(t)`, which
  is not trivial on `k`. Every `η_{KK'}` is trivial on the residue field, so the factor
  `Fr(t_{K'})^{−n̄_{KK'}}` cannot be dropped.

## Layer 6: Theorem A in characteristic `0`

`E` of characteristic `0`.

### 6.1 The field of norms of `p`-extensions

For `L ⊆ E(p)` infinite APF Galois over `E`, with `𝓛 = X_E(L)`, `X_{L/E}(E(p))` is a maximal
`p`-extension `𝓛(p)` of `𝓛`. The isomorphism `ι_{L/E}` of FieldOfNorms 2.2 descends to
`Gal(E(p)/L) ≅ Γ_𝓛(p)`, carrying `Γ_E(p)^{(v)} ∩ Gal(E(p)/L)` onto `Γ_𝓛(p)^{(ψ_{L/E}(v))}`
(FieldOfNorms 3.3, absolute form, and 5.0).

### 6.2 The cofinal system

For `F ⊆ E(p)` finite Galois over `E`, let `E_F = F·E_∞`, with `E_∞` the `ℤ_p`-quotient of
`E(μ_{p^∞})/E`. It is the system of FieldOfNorms 4.4. Each `E_F/E` satisfies the hypothesis of
FieldOfNorms 4.3, and the `E_F` exhaust `E(p)`.

### 6.3 The proof

[Abrashkin 2010, §7, pp. 47–49]. The targets are the steps:
- `E'` has characteristic `0`, by 5.1;
- `E'_F` is defined by `g(Gal(E(p)/E_F)) = Gal(E'(p)/E'_F)`. `g` induces a filtered
  `Gal(E_F/E) ≅ Gal(E'_F/E')`, so `E'_F/E'` is APF (FieldOfNorms 0.6) and the Herbrand
  functions agree. The hypothesis of FieldOfNorms 4.3 for `E'_F/E'` is not needed in advance:
  4.3 transports it from `E_F/E`;
- by 6.1, `g` restricts to a filtered `Γ_{𝓔_F}(p) ≅ Γ_{𝓔'_F}(p)`, `𝓔_F = X_E(E_F)`;
- 5.4 and 5.5 give a unique `μ̃_F : 𝓔_F(p) → 𝓔'_F(p)` with `μ̃_F(𝓔_F) = 𝓔'_F`. By uniqueness
  applied to the conjugates of `g` by lifts of `Gal(E_F/E)`, `μ̃_F` conjugates
  `X_E(Gal(E_F/E))` onto `X_{E'}(Gal(E'_F/E'))` as `g` prescribes;
- FieldOfNorms 4.3 lifts `μ̃_F|_{𝓔_F}` to a unique `μ_F : E_F → E'_F` with `μ_F(E) = E'`. The
  `μ_F` are compatible in `F`, by both uniquenesses, and `μ = colim μ_F` has `μ^* = g`.

### 6.4 Theorem A, characteristic `0`

The statement of 5.4 for `E` of characteristic `0`, with the uniqueness of 5.5 and the bijection of
5.6.

### 6.5 The absolute form, every `p`

[Abrashkin 2010, p. 2; Abrashkin 2000, Thm. A′, p. 139, for `p ≠ 2`]. Let `E`, `E'` be local fields
of residue characteristic `p`, any `p`. Every filtered `G : G_E ≃ₜ* G_{E'}` is `τ ↦ ẽ ∘ τ ∘ ẽ⁻¹` for
an isomorphism `ẽ : AlgebraicClosure E ≃+* AlgebraicClosure E'` with `ẽ(E) = E'`, continuous on `E`.
Lean: `exists_ringEquiv_conj_of_filtered_absoluteGaloisGroup`. [Abrashkin 2010] states this
consequence of Theorem A without proof, and [Abrashkin 2000] proves it for `p ≠ 2` by the Main
Lemma; the route here is the uniqueness of 5.5, used as in the fourth step of 6.3. The targets are
the steps:
- for `F/E` finite Galois in `E^sep`, let `F'` be the fixed field of `G(G_F)`. By
  FilteredLocalGaloisGroups 1.5 and 2.2, `G` restricts to a filtered `G_F ≅ G_{F'}`, and by 1.3
  it induces a filtered `g_F : Γ_F(p) ≅ Γ_{F'}(p)`. `F(p)/E` is Galois, and `G` induces
  `ḡ_F : Gal(F(p)/E) ≅ Gal(F'(p)/E')` extending `g_F` (`map_proPKernel_eq`);
- 5.4 or 6.4 gives `μ_F : F(p) → F'(p)` with `μ_F(F) = F'` and `μ_F^* = g_F`. For
  `τ ∈ Gal(F(p)/E)` put `μ' = ḡ_F(τ)⁻¹ ∘ μ_F ∘ τ`. Then `μ'(F) = F'`, and for `x ∈ Γ_F(p)`,
  `μ' x μ'⁻¹ = ḡ_F(τ)⁻¹ g_F(τxτ⁻¹) ḡ_F(τ) = g_F(x)`. By 5.5, `μ' = μ_F`, that is
  `μ_F τ μ_F⁻¹ = ḡ_F(τ)` on all of `Gal(F(p)/E)`, so `μ_F(E) = E'`;
- for `F₁ ⊆ F₂`, `F₁(p) ⊆ F₂(p)` is the fixed field of a subgroup that `ḡ_{F₂}` carries to the
  corresponding one, so `μ_{F₂}` restricts to an isomorphism `F₁(p) → F₁'(p)` inducing
  `ḡ_{F₁}`, and 5.5 gives `μ_{F₂}|_{F₁(p)} = μ_{F₁}`;
- the `F(p)` exhaust `E^sep`, and `μ = colim μ_F : E^sep → E'^sep` induces `G`. It extends
  uniquely to the algebraic closures, which are purely inseparable over the separable closures.
  `μ|_E` is continuous, as `μ_E` is.

Nothing here uses `p ≠ 2`.
*Needs:* 5.0, 5.4, 5.5, 6.4; FilteredLocalGaloisGroups 1.3, 1.5, 2.2.

**Checks.**

- `E = ℚ_p`, `p` odd: `Aut ℚ_p` is trivial, so 6.4 says that every filtered automorphism of
  `Γ_{ℚ_p}(p)` is inner. Without the filtration this fails. `Γ_{ℚ_p}(p)` is free on a lift `x` of
  Frobenius and a generator `y` of inertia, and inertia is the normal closure of `y`. The
  automorphism swapping `x` and `y` does not preserve it.
- The cofinal system needs `E_∞ ⊆ E(p)`: the full cyclotomic extension `E(μ_{p^∞})` is not a
  `p`-extension for `p` odd, since `Gal(ℚ_p(μ_p)/ℚ_p)` has order `p − 1`.
- 6.5 needs the uniqueness of 5.5. Without it, `μ_F` is determined by `g_F` only up to the
  centralizer of `Γ_{F'}(p)` in the field automorphisms of `F'(p)`, and nothing forces
  `μ_F(E) = E'` or `μ_{F₂}|_{F₁(p)} = μ_{F₁}`.
- `E = E'` and `G` conjugation by `σ ∈ G_E`: by 5.5 at each `F`, `μ_F = σ|_{F(p)}`, so `ẽ = σ`.

## Layer 7: nilpotent Artin–Schreier theory in class two, `p ≠ 2`

`𝒦 = k((t))` of characteristic `p ≠ 2`, `k = 𝔽_{p^{N₀}}`, `𝒢 = G_𝒦`. The notation is that of
[Abrashkin 2000].

### 7.1 Special bases

[Abrashkin 2000, §§2.1–2.7, pp. 139–145]. The targets:
- the `p`-completion `𝒦̂^*` and the coordinates
  `χ_t : 𝒦̂^* ≅ ℤ_p × ∏_{a ∈ ℤ(p)} W(k)`, `α = t^{a₀(α)}∏E(w_a(α), t^a)`;
- the special basis `𝒟(t) = {D_{an}} ∪ {D₀}` of `𝒦̂^* ⊗ W(k)`, in the normalization of the
  conventions (the `χ_t`-basis vector at `(a, n)` divided by `a`), and its reductions, bases of
  `U^{(1)}_𝒦 ⊗ W(k)`, `U^{(1)}_𝒦 ⊗ k` and `ℳ^{(1)}_k`;
- `ℳ = 𝒢^ab ⊗ 𝔽_p` with Artin–Schreier theory (§2.2), and Lemma of §2.3: in this
  normalization the diagonal element is `e_{α₀, t} = α₀D₀ + Σ t^{−a}D_{a0}`;
- §§2.4–2.5: `ℳ^{(1)}` is inertia, `ℳ^{(a)}` comes from `U^{(a)}`, the change-of-uniformizer
  coefficients `α_{abm}` vanish for `b < a`, and Prop. of §2.5 for `t' ≡ αt mod t²` and
  `t' ≡ t + αt^{b+1} mod t^{b+2}`;
- **Prop. of §2.6** (p. 143): a `k`-basis `{C_{an}}` of `ℳ^{(1)}_k` with `σC_{an} = C_{a, n+1}`
  and `{C_{bm} : b ≥ a}` spanning `ℳ^{(a)}_k` can be normalized, by a shift `n₀` and a choice
  of uniformizer, to `α_{110} = 1`, `α_{1b0} = 0` for `b > 1`, `α_{2b0} = 0` for
  `b ≡ 1 mod p`;
- §2.7: the action `φ * m` of `Aut 𝒦` on `ℳ`, Prop. 1 (`Σφ⁻¹(t)^{−a}D_{a0} ≡ Σt^{−a}(φ * D_{a0})`),
  Prop. 2 (`fr_t * D_{an} = D_{a, n−1}`) and the Corollary for `φ|_k = σ^{−n₀}`.

### 7.2 The identification in class two

[Abrashkin 2000, §3.1; Abrashkin 1998, §§1.2–1.3, 5.2; Abrashkin 1995b]. Let `𝓛` be the free
pro-finite Lie `ℤ_p`-algebra on `𝒦̂^*` modulo `C₃`, and `G(𝓛)` its class-two group (0.3). For `α₀`,
`t` and a solution `f` of `σf = f ∘ e` in `G(𝓛 ⊗̂ O(𝒦^sep))`, with `e = α₀D₀ + Σ t^{−a}D_{a0}`, the
map `τ ↦ (τ⁻¹f) ∘ (−f)` is an isomorphism `ψ : 𝒢(p)/C₃(𝒢(p)) ≅ G(𝓛)`. The steps:
- a solution of `σf = f ∘ e` exists, by 1.5's induction along the filtration by `C₂`;
- `ψ` is a `σ`-invariant homomorphism: `ψ(τ₁τ₂) = ψ(τ₁) ∘ ψ(τ₂)`, because `ψ(τ₁) ∈ 𝓛` is fixed by
  Galois;
- `ψ^ab` is the negative of the Witt–Artin–Schreier isomorphism of 1.3, by the sign of 1.6 (b);
- `ψ` is surjective, because `G(𝓛)` is pro-`p` and `ψ` is onto `𝓛/(p𝓛 + ⁅𝓛, 𝓛⁆)`;
- `ψ` is injective. `𝒢(p)` is free (1.1), so 0.3 identifies `𝒢(p)/C₃` with `G(L₂(I))`, and
  `L₂(I) ≅ 𝓛`. Then `C₂/C₃ ≅ ∧̂²` of the abelianization on both sides, and `ψ` intertwines the
  commutators.

`ψ` carries the image of `𝒢^{(v)}` to `G(𝓛^{(v)})` for closed ideals `𝓛^{(v)}`, the
ramification ideals. Reduction modulo `p³` gives `𝒢/𝒢^{p³}C₃(𝒢) ≅ G(L̄)`,
`L̄ = 𝓛/p³𝓛` [Abrashkin 2000, §4.2].

### 7.3 The ramification ideals modulo `C₃`

[Abrashkin 2000, Thm. of §3.1 and §§3.2–3.3, pp. 146–148]. The targets:
- **the abelian case** (§3.2): `𝓛^{(v)}_W mod C₂` is generated by the `p^s aD_{an}` with
  `p^s a ≥ v`, from 2.2's input, FunctionFieldArithmetic 4.4;
- **the generators** `Δ_{a0} = a⁻¹F_{a0} mod C₃`, `Δ_{an} = σⁿΔ_{a0}`, `Δ₀ = D₀`, and the
  elements `ℱ^{(v)}_γ` of §3.3: for `γ = ap^m ∈ ℕ`,
  `ℱ^{(v)}_γ = ap^mΔ_{am} − ½Σ p^s a₁[Δ_{a₁s}, Δ_{a₂s}]` over
  `0 ≤ s < m`, `p^s a₁, p^s a₂ < v`, `p^s(a₁ + a₂) = γ`; for `γ ∉ ℕ`,
  `ℱ^{(v)}_γ = −Σ p^{n₁}a₁[Δ_{a₁n₁}, Δ_{a₂n₂}]` over `n₁ ≥ 0`, `n₂ ∈ ℤ`,
  `p^{n₁}a₁, p^{n₁}a₂ < v`, `p^{n₁}a₁ + p^{n₂}a₂ = γ`;
- **Theorem** (the class-two case of [Abrashkin 2000, Thm. of §3.1] and
  [Abrashkin 1998, Thms. A–B]): for `v ≥ 1`, `L^{(v)}_W = 𝓛^{(v)}_W mod C₃` is the smallest
  `σ`-invariant ideal of `L_W` containing every `ℱ^{(v)}_γ`, `γ ≥ v` (Prop. of §3.3, p. 148).

A route is that of [Abrashkin 1998, §§1–4], restricted to nilpotency class two. Its targets are:
- the auxiliary field `K' = K(N*, r*)` (Prop. of §1.5, p. 865);
- the criterion `L^{(v₀)} = J'_{qv₀ − b*}(X)` (Lemma and Prop. of §1.6, pp. 866–868);
- the stabilization in `N` of the ideals `𝓛_N(A, v₀)` (Prop. of §2.5, p. 871) and their left
  continuity (§2.6);
- the estimates of §3 in the enveloping algebra;
- the main theorem of §4 (p. 892) for epimorphisms onto finite Lie algebras of class `≤ 2`, by
  induction on the exponent and descending induction on `v`, with Props. of §§4.2–4.4.

Class two is enough for every statement of this roadmap.

### 7.4 Trivial and admissible submodules

[Abrashkin 2000, §3.4, pp. 148–150]. For `v ≥ 1` with `pv ∈ ℕ`, `v ≤ v₀` and `N₀ ≥ 2 log_p(pv₀)`,
the targets are:
- `L^{(v)}_triv`, the index sets `S^{(v)}_{1, adm}`, `S^{(v)}_{2, adm}`, the weights `γ(a, n)`,
  `γ(a₁, n₁, a₂, n₂)` and `L^{(v)}_adm`;
- Prop. 1: `L^{(v)}_adm ⊇ L^{(v)}_W ⊇ L^{(v)}_triv ⊇ pL^{(v)}_adm`;
- Prop. 2: the `k`-basis of `L^{(v)}_adm/L^{(v)}_triv`;
- **Prop. 3**, the coefficient criterion: `l ∈ L^{(v)}_adm mod L^{(v)}_triv` lies in
  `L^{(v)}_W` iff there are `A_{γ, m} ∈ k` with `a⁻¹α_{an} = A_{γ, m}` and
  `a₁⁻¹α_{a₁n₁a₂n₂} = −A_{γ, m}` on the indices of weight `γ` and shift `m`.

*Layer 7 needs:* Layer 0; 1.1–1.3, 1.5 and the sign of 1.6 (b) (7.2); 2.2's route (7.3);
FunctionFieldArithmetic 4.4; ClassFieldTheory Layer 7.

**Checks.**

- `v = 1`: every bracket term needs `p^{n₁}a₁ < 1`, which is impossible, so `ℱ^{(1)}_γ = γΔ_{a_γ v_γ}`
  for `γ ∈ ℕ` and `0` otherwise. `L^{(1)}_W` is the full inertia ideal.
- `F_{a, −N}` depends on `N`, the ideals do not (conventions): for `k = 𝔽_p`, so `α₀ = 1` and
  `σ = id`, `F_{a, −1} ≡ F_{a, 0} − a[D_{a0}, D₀] mod C₃`, and `[D_{a0}, D₀] ≠ 0` in the free Lie
  algebra modulo `C₃`. The difference is `−[aΔ_{a0}, D₀]` modulo `C₃`, so it lies in every ideal
  containing `aΔ_{a0}`. A version of the conventions with `F_{a, −N}` independent of `N` proves
  `a[D_{a0}, D₀] = 0`.
- `v = 2 + 1/p`: the source's sign `(1/2)ℱ^{(v)}_v = [Δ_{20}, Δ_{1, −1}]`
  [Abrashkin 2000, p. 152] is the opposite of the definition, which gives
  `ℱ^{(v)}_v = −2[Δ_{20}, Δ_{1, −1}]`. An implementation must follow the definition.

## Layer 8: the Main Lemma, `p ≠ 2`

[Abrashkin 2000, §4, pp. 150–161.] `v₀ ∈ p²ℕ`, `v₀ > 10` if `p = 3`, `N₀ ≥ 2 log_p(p²v₀)`.
`𝒢̄ = 𝒢/𝒢^{p³}C₃(𝒢)` with the induced filtration. `F̄` is an automorphism of `𝒢̄` with
`F̄(𝒢̄^{(v)}) = 𝒢̄^{(v)}` for rational `1 ≤ v ≤ v₀`, and `f_k(D_{a0}) = Σ α_{abm}D_{bm}` is its
matrix in the special basis of `t` (§4.1).

### 8.1 The Main Lemma

(p. 151). Suppose `α_{110} = 1`, `α_{1b0} = 0` for `1 < b < v₀`, and `α_{2b0} = 0` for
`b ≡ 1 mod p`, `1 < b < v₀`. Then:
- (A) there are `β_{c, −m} ∈ k` with
  `f_k(D_{a0}) ≡ D_{a0} + Σ_{m ≥ 1, c} β_{c, −m}D_{ap^m + c, −m} mod ℳ^{(v₀/p)}_k` for every
  `a`;
- (B) if `τ, τ' ∈ Aut 𝒦` satisfy `f(τ * m) ≡ τ' * f(m) mod ℳ^{(v₀/p)}` for every
  `m ∈ ℳ^{(1)}`, then `τ` and `τ'` induce the same automorphism of `𝒪_𝒦 mod t^{v₀/p}`.

### 8.2 The steps

(§§4.2–4.12). The targets:
- Props. 1–2 of §4.2: `α_{aan} = 0` for `n ≠ 0`;
- Prop. of §4.3 with Lemmas 1–3: `α_{aa0} = λ^{a−1}`;
- Prop. of §4.4: `λ = 1`, from `ℱ^{(p²)}_{p²}`;
- Lemma of §4.5: `α_{a, b, −1} = 0` for `b/p < a < b`;
- Prop. of §4.6: `α_{bb₁} = α_{b−p, b₁−p}`;
- Prop. of §4.7: `α_{ll₁} = 0` for `l < l₁ ≤ min(l + r, v₀ − 1)`, by induction on `r`;
- the end of (A) (§4.8, through Prop. 3 of §3.4) and `τ|_k = τ'|_k` (§4.9);
- the expansions of `τ⁻¹(t^{−b})` (§4.10);
- Prop. of §4.11: `A^{(b)}_a = B^{(b)}_a`;
- Prop. of §4.12: `τ(t) ≡ τ'(t) mod t^{v₀/p}𝒪_𝒦`, which is (B).

The source's cases "done similarly", namely `p = 3` in §4.2 and the decompositions of Lemma 3
of §4.3, are part of the target and are written out. In Prop. of §4.11 the bound reads
`b ≥ ap^m ≥ p^{N₀}`.

### 8.3 The Remark of §4.1

(p. 151), part (1): (A) is equivalent to the coefficient conditions (a)–(c) on the `α_{abm}`.

*Layer 8 needs:* Layer 7; 7.1's Prop. of §2.6 arranges the hypotheses.

**Checks.**

- `F̄ = id`: `f_k = id` satisfies the hypotheses, and (A) holds with every `β_{c, −m} = 0`.
- The hypothesis `v₀ ≡ 0 mod p²` is used: Prop. of §4.4 evaluates at `p² ≤ v₀`.

## Layer 9: the ramification functor

Every `p`.

### 9.1 The categories

[Abrashkin 2000, §§1.1–1.3, pp. 136–138]. The targets:
- `DVF`: pairs `(K, K̃)` of a local field and a separable closure, with morphisms the continuous
  isomorphisms `i : K̃_1 → K̃_2`, `i(K_1) ⊆ K_2`. The source restricts to residue
  characteristic `≠ 2`, which 6.5 makes unnecessary;
- `FPG`: profinite groups with a filtration, and morphisms the open embeddings
  `i : G_1 → G_2` with `i(G_1^{(ψ_{G_2, i(G_1)}(v))}) = i(G_1) ∩ G_2^{(v)}`. This is
  FilteredLocalGaloisGroups' `GroupFiltration` with restriction 1.5 and its Herbrand function
  1.4, and Prop. of §1.2 (composition) is FilteredLocalGaloisGroups 1.4's tower law;
- the functor `RF(K, K̃) = G_K` with its upper filtration, and `RF(i)(τ) = i⁻¹ ∘ τ ∘ i`. That
  it is a functor is FilteredLocalGaloisGroups 2.2;
- **Prop. of §1.3**: `RF` is faithful. An automorphism of `K̃` commuting with an open subgroup of
  `G_K` is the identity, by reciprocity.

### 9.2 Theorem A′

[Abrashkin 2000, p. 139]. Every filtered `G : G_K ≃ₜ* G_{K'}` is induced by a `DVF` isomorphism.
This is 6.5, for every `p`; the source states it for `p ≠ 2`. `K` and `K'` have the same
characteristic, by 5.1 applied to the pro-`p` quotients.

### 9.3 Theorem A

[Abrashkin 2000, p. 139]. `RF` is fully faithful, for every `p`; the source states it for `p ≠ 2`.
The step from 9.2 is that an `FPG` morphism `G_L → G_K` has open image `G_{K₁}`, `K₁/K` finite, and
is a filtered isomorphism onto it for the restricted filtration, which is the upper filtration of
`K₁` (FilteredLocalGaloisGroups 2.2).

*Layer 9 needs:* 5.1, 6.5; FilteredLocalGaloisGroups 1.4, 1.5, 2.2; ClassFieldTheory Layer 7.

## Layer 10: Deligne's truncated equivalence

[Deligne 1984, pp. 119–157.] `F` is a complete discretely valued field with perfect residue
field, of either characteristic, which is Deligne's generality (1.2), and `e ≥ 1` is an integer.
Ramification is Serre's, for perfect residue fields, with `ψ_{E/F}` of
RamificationOfCompleteDiscretelyValuedFields §4a.2. The consumer, Layer 11, specializes to local
fields.

### 10.1 Truncated valuation rings and triples

[Deligne 1984, §§1.1–1.2, 1.4]. The targets:
- a **truncated valuation ring** is a local ring with principal nilpotent maximal ideal, with
  length `lg R` and valuation `v`; every one is `V/𝔪^n` for a complete discrete valuation ring
  `V`;
- a **triple** `(R, M, ε)` is a truncated valuation ring with perfect residue field, a free
  rank-one `R`-module `M`, and an epimorphism `ε : M → 𝔪_R`. Its class depends only on `R`;
- `Tr_e(F) = (𝒪_F/𝔪^e, 𝔪/𝔪^{e+1}, ε)`, with `𝔪/𝔪^{e+1}` free of rank one over `𝒪_F/𝔪^e`,
  and `Tr_e(F)^× ≅ F^×/(1 + 𝔪^e)`;
- the category `𝒯` of triples, with morphisms `(r, φ, η)` and the ramification index `r`, and
  the notions flat, finite, étale and totally ramified (1.4);
- Example 1.4.1: a finite extension `E/F` of ramification index `r` gives
  `Tr_e(F) → Tr_{re}(E)`;
- 1.4.3: the Eisenstein description of a finite flat totally ramified `T/S`;
- Lemma 1.4.4: every finite flat `T` over `Tr_e(F)` is `Tr_{re}(E)` for a finite separable
  `E/F`.

### 10.2 Bounded ramification

[Deligne 1984, 1.3, 1.5, Appendix A.3–A.6]. The targets:
- `(ext F)^f` is the full subcategory of finite separable `E/F` whose Galois closure `E₁` has
  `Gal(E₁/F)^f = 1` (condition `C^f`, Serre's upper numbering);
- it is stable under Galois closure, subextensions and composita, and corresponds to the fixed
  field of `G_F(f)`;
- Prop. 1.5.1: for `0 < f ≤ e` and `E/F` totally ramified, `E/F` satisfies `C^f` iff the
  Newton polygon function `n_b` of the reduced Eisenstein data satisfies `n_b(r) < r(f + 1)`;
- Prop. A.6.1: the equivalent forms of `C^f` through `ψ_{E/F}` of
  RamificationOfCompleteDiscretelyValuedFields §4a.2 and the root distances, for `E/F` not
  necessarily Galois. Its overlap with PadicExtensionFamilies 2.2 (upper breaks of a
  non-Galois extension) is read through that section.

### 10.3 The equivalence

[Deligne 1984, §2]. The targets:
- for a triple `S` with `lg R = e`, the category `(ext S)` of finite flat `S`-objects (§2.1),
  and `(ext S)^e` (Def. 2.7): the objects satisfying `C^e`, with morphisms the classes of
  `(ext S)`-morphisms modulo `R(ψ_{T/S}(e))`, well defined by Lemmas 2.4–2.5, with
  Lemmas 2.1.1, 2.3.1 and 2.6;
- the functor `T : (ext F)^e → (ext Tr_e F)^e`, `E ↦ Tr_{re}(E)` with `r = e(E/F)`
  (Example 1.4.1), on morphisms through their classes;
- **Theorem 2.8**: `T` is an equivalence of categories;
- Cor. 2.9 (reduction to `f < e`), Cor. 2.10.1 and Cor. 2.10.2 (automorphisms and the
  relative form).

### 10.4 Compatibilities

[Deligne 1984, 1.5.3–1.5.4 and §§3.1–3.5]. For `F'`, `F''` and `u : Tr_e(F') ≅ Tr_e(F'')`, the
equivalence `U_u : (ext F')^e ≃ (ext F'')^e`. The targets:
- corresponding extensions have the same ramification index and
  `ψ_{E'/F'}(e) = ψ_{E''/F''}(e)` (Construction 3.4.1, p. 142), and the same Herbrand
  functions (1.5.3–1.5.4, pp. 131–132);
- Construction 3.4.1: the canonical `Tr_{e(1)}(E') ≅ Tr_{e(1)}(E'')`, `e(1) = ψ_{E'/F'}(e)`,
  with `e ≤ e(1) ≤ re` (3.4.2) and its functoriality 3.4.3–3.4.5 (norms and traces);
- **3.5** (p. 144): an isomorphism, unique up to inner automorphisms,
  `G_{F'}/G_{F'}(e) ≅ G_{F''}/G_{F''}(e)`, and its abelianized form 3.5.2;
- **the filtration**: for real `0 < f ≤ e`, the isomorphism of 3.5 carries `G_{F'}(f)/G_{F'}(e)`
  onto `G_{F''}(f)/G_{F''}(e)`. Deligne states neither this nor the corresponding fact for
  Herbrand functions in this form, and equal Herbrand functions alone give only `|G^v|`, not
  the subgroup. The route has three steps:
  - condition `C^f` is intrinsic to `Tr_e` (1.5.1, 1.5.4), so by 2.8, `U_u` restricts to
    `(ext F')^f ≃ (ext F'')^f`;
  - run 3.5 (a)–(c) with `Ω'_f`, the invariants of `G_{F'}(f)`, compatibly with
    `Aut Ω' → Aut Ω'_f`;
  - then 3.5.1 carries `G_{F'}(f)/G_{F'}(e)` onto `G_{F''}(f)/G_{F''}(e)`.

  It is cited as "from 1.5.1, 1.5.4, 2.8 and the proof of 3.5";
- for an `E ∈ (ext F)^e` Galois over `F`, `Gal(E/F) = Aut^e(T(E)/Tr_e F)`, the automorphisms in
  `(ext Tr_e F)^e` [Abrashkin 2000, §6.3.2].

*Layer 10 needs:* RamificationOfCompleteDiscretelyValuedFields §§4a.1–4a.2 (upper numbering and
`ψ_{E/F}` over complete discretely valued fields with perfect residue field); Mathlib's
`IsDiscreteValuationRing` and quotients of `IsLocalRing`s.

**Checks.**

- `e = 1`: `Tr_1(F) = (k, 𝔪/𝔪², 0)`. The tamely ramified extensions lie in `(ext F)^1`, and
  `M = 𝔪/𝔪²` is needed (Deligne's introduction). The ring `𝒪/𝔪 = k` alone does not determine them
  up to unique isomorphism: `x ↦ λx` on `k((x))`, with `λ` a primitive `N`-th root of unity, is
  trivial on `k` and has no extension of order `N` to `k((x^{1/N}))`.
- `F = ℚ_p(ζ_p)`, `F'' = 𝔽_p((t))`, `e = p − 1`, with `u : t ↦ 1 − ζ_p`: `𝒪_F/p = 𝒪_F/𝔪^{p−1} ≅
  𝔽_p[t]/t^{p−1}`, so 10.4 compares the extensions of both fields with ramification below
  `p − 1`.
- `C^f` is read in the upper numbering: `ℚ_p(ζ_{p²})/ℚ_p` has upper jumps `0` and `1`, so it lies
  in `(ext ℚ_p)^f` exactly for `f > 1`. Its lower jumps are `0` and `p − 1`, so a lower-numbering
  reading would give the threshold `p − 1`.

## Layer 11: Theorem B, `p ≠ 2`

`K/ℚ_p` finite with a primitive `p^M`-th root of unity `ζ_M`, `M ≥ 1`, residue degree `f_K` and
absolute ramification index `e_K`. Put `v_K = p^{M+1}e_K/(p − 1)`, `a_K = e_K(p/(p − 1) + M)`,
`w_K = e_Kp^M`, and assume `f_K ≥ 2 log_p(p²v_K)`.

### 11.1 The fundamental exact sequence

[Abrashkin 2000, §§6.1–6.2, pp. 164–166]. The targets:
- the tower `K_s = K(π_s)`, `π_s^p = π_{s−1}`, `π₀ = π_K`, and `K̃ = ⋃K_s`;
- `𝒦 = X_K(K̃)` with the uniformizer `t = (π_s)`. This is FieldOfNorms' Kummer worked example
  and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3;
- the embedding `ι : 𝒢_𝒦 → G_K` with `ι(𝒢_𝒦^{(x)}) = ι(𝒢_𝒦) ∩ G_K(φ_{K̃/K}(x))`
  (FieldOfNorms 2.2, 3.3);
- `Gal(K_M/K) = ℤ/p^M·τ₀`, `τ₀(π_M) = ζ_Mπ_M`;
- **Lemma 1 of §6.2**: `G_K(a_K) = G_{K_M}(v_K)`;
- **Lemma 2 of §6.2**: `ι` induces `𝒢_𝒦(p)/𝒢_𝒦(p)^{(v_K)} ≅ Γ_{K_M}(p)/Γ_{K_M}(p)^{(v_K)}`,
  through the equivalence `L ↦ X_K(LK̃)` from the finite extensions `L/K_M` with
  `v(L/K_M) < v_K` to the extensions `𝓛/𝒦` with `v(𝓛/𝒦) < v_K`;
- **the exact sequence (1)**:
  `1 → 𝒢_𝒦(p)/𝒢_𝒦(p)^{(v_K)} → Γ_K(p)/Γ_K(p)^{(a_K)} → ℤ/p^M → 0` (Prop. of §6.2).

### 11.2 The outer action of the Kummer generator

[Abrashkin 2000, §6.3, pp. 166–169]. The targets:
- `P ∈ W(k)[[X]]` with `P(π_K) ≡ ζ_M mod p`, `P_M = P^{p^M}`, and `τ_P ∈ Aut¹𝒦` with
  `τ_P(t) = tP_M(t)`, of order `p^M` on `𝒪_𝒦 mod t^{w_K}`;
- the classes `cl(τ₀)` and `cl(τ_P)` of outer automorphisms of
  `𝒢_𝒦(p)/𝒢_𝒦(p)^{(w_K)}`;
- **Prop. of §6.3**: `cl(τ₀) = cl(τ_P)`. The proof reduces to finite Galois `L ⊇ K_M` with
  `v(L/K_M) < w_K`. It then applies 10.3 over `𝒦` and over `K_M` at level `w_K = e_{K_M}`,
  and identifies `T_𝒦 ≅ T_{K_M}` through the projection to level `M` of the field of norms,
  `𝒪_𝒦/t^{w_K} ≅ 𝒪_{K_M}/p` (FieldOfNorms 1.4 at `E = K_M`, where `s(K_M) = r(K_M) = e_{K_M}`).
  The restrictions to finite layers determine the class through compatible choices: the sets
  of admissible choices at the finite layers are finite and nonempty, and an inverse limit of
  finite nonempty sets is nonempty.

### 11.3 The proof of Theorem B

[Abrashkin 2000, §7, pp. 169–174]. The targets are the steps:
- Prop. of §7.1: `f_{K'} = f_K`, `e_{K'} = e_K`, `ζ_M ∈ K'`, by class field theory on
  `Γ_K(p)^ab` modulo the image of `Γ_K(p)^{(a_K)}`. For `M = 1` this is Theorem B (Remark of
  §7.1);
- Prop. of §7.2: `G` carries a fundamental sequence of `K` to one of `K'`, for suitable `π_{K'}`
  and `(π'_s)`;
- the data of §7.3 for `K` and `K'`, and the transport `g(τ_P * m) = τ_{P'} * g(m) mod
  ℳ'^{(w₀)}`, from 11.2 on both sides with Prop. of §7.2;
- the normalization by Prop. of §2.6 and the Main Lemma (B) at `v₀ = v_K`. By the Remark of
  §7.1, `v_K ≡ 0 mod p^{2M}` and `M ≥ 2` may be assumed, which gives `v₀ > 10` for `p = 3`. So
  `τ_P` and `τ_{P̃}` induce the same automorphism of `𝒪_𝒦 mod t^{v_K/p}`;
- Lemma of §7.5: the expansions `f ≡ Σ_{0 ≤ a < p^M} t^a s_a^{p^M} mod t^{v₀/p}` and their
  uniqueness, giving `P(t) ≡ P̃(t̃) mod t^{e_K/(p−1)}`;
- the isomorphism `κ`, through `𝒪_𝒦/t^{e_K} ≅ 𝒪_K/p`, `t ↦ π_K`, under which `t^{e_K/(p−1)}`
  corresponds to `p^{1/(p−1)}`.

### 11.4 Theorem B

[Abrashkin 2000, p. 135]. Let `K'/ℚ_p` be finite and
`G : Γ_K(p)/Γ_K(p)^{(a_K)} ≅ Γ_{K'}(p)/Γ_{K'}(p)^{(a_K)}` an isomorphism respecting the quotient
filtrations for `v ≤ a_K`. Then `ζ_M ∈ K'`, `e_{K'} = e_K`, `f_{K'} = f_K`, and for some
`φ_M ∈ Gal(ℚ_p(ζ_M)/ℚ_p)` there is a `φ_M`-linear isomorphism of `ℤ_p[ζ_M]`-algebras
`κ : 𝒪_K mod p^{1/(p−1)} ≅ 𝒪_{K'} mod p^{1/(p−1)}`.

### 11.5 The corollary

[Abrashkin 2000, p. 136]. For finite `L ⊆ K`, `v(K/L) = max{v : G_L(v) acts nontrivially on K}`, and
`𝒜_M` is the set of finite extensions `K` of `ℚ_p(ζ_M)` with `v(K/ℚ_p(ζ_M)) < p^{M−1} − 1`. If
`K, K' ∈ 𝒜_M` satisfy the hypothesis of 11.4, then `K ≅ K'`. **Source correction.** The source
assumes only `K ∈ 𝒜_M`, but its sketch applies Krasner's lemma to both fields, and nothing shows
that `K' ∈ 𝒜_M` follows from the hypothesis. The corollary is stated for both. The proof is 11.4 and
Krasner's lemma in Deligne's form [Deligne 1984, Remark A.6.3]: `K/L` is determined by the
`𝒪_L`-algebra `𝒪_K mod π_L^{v(K/L) + 1 + ε}`, here with `L = ℚ_p(ζ_M)` and
`π_L^{p^{M−1}} ~ p^{1/(p−1)}`.

*Layer 11 needs:* Layers 7, 8 and 10; FieldOfNorms 1.4, 2.2, 3.3 and its Kummer worked example;
Lemma 1 of §6.2 needs RamificationOfCompleteDiscretelyValuedFields §4a.2.

**Checks.**

- `p = 3`, `M = 2`, `K = ℚ_3(ζ_9)·𝔽_{3^{12}}`: `e_K = 6`, `v_K = 81`, `a_K = 21`, `w_K = 54`, and
  `f_K = 12 = 2 log_3(9·81)`. The hypothesis holds with equality, and the conclusion is about
  `𝒪_K/π_K^3`.
- Lemma 1 of §6.2 at `K = ℚ_p(ζ_p)`, `M = 1`: `a_K = 2p − 1`, `v_K = p²`. The Kummer extension
  `K(π_K^{1/p})/K` has upper jump `e_Kp/(p − 1) = p`, and `ψ(2p − 1) = p + p(p − 1) = p²`.
- `M = 1`, `K = ℚ_3(ζ_3)·𝔽_{3^8}`: `e_K = 2`, `v_K = 9`, and `f_K = 8 = 2 log_3(81)`. Here
  `𝒪_K mod 3^{1/2} = 𝒪_K/π_K` is the residue field, so Theorem B says only what Prop. of §7.1
  says, consistent with the Remark of §7.1.

## Scope and ownership

This roadmap owns:

- the profinite Magnus algebra on generators converging to `0`, Lazard's isomorphism for free
  pro-`p` groups on a basis converging to `1`, the recognition criterion for Magnus embeddings,
  and the class-two Lie correspondence for `p ≠ 2` (Layer 0);
- the freeness of `Γ_K(p)` in characteristic `p`, the Witt liftings `O_M(L)`, the
  Witt–Artin–Schreier description of `Γ_K(p)^ab` in Abrashkin's coordinates with its reciprocity
  form and unramified base change, and the Magnus embedding `ψ_f` (Layer 1);
- the ramification ideals `𝒜^{(v)}`, the elements `F_γ`, and Theorems B and B′ of
  [Abrashkin 2010] (Layer 2);
- the admissible automorphisms of `I_K(p)^ab ⊗ 𝔽_p` and the results of [Abrashkin 2010, §§2, 5]
  (Layer 3);
- compatible, admissible, special admissible, analytic, locally analytic and comparable systems,
  and the recovery of field isomorphisms [Abrashkin 2010, §3] (Layer 4);
- Theorem A of [Abrashkin 2010] in both characteristics, its uniqueness, its filtered outer form,
  and the descent of maximal `p`-extensions and their filtrations to Galois subextensions
  (Layers 5–6);
- nilpotent Artin–Schreier theory in class two, the special bases, and the ramification filtration
  of `Γ_K(p)` modulo `C₃` in characteristic `p` for `p ≠ 2`, with its proof
  [Abrashkin 2000, §§2–3; Abrashkin 1998, §§1–4 in class two] (Layer 7);
- the absolute form of Theorem A for every `p`, by gluing along the uniqueness (6.5);
- the Main Lemma [Abrashkin 2000, §4] (Layer 8);
- the categories `DVF` and `FPG`, the faithfulness of `RF`, and Theorems A and A′ of
  [Abrashkin 2000, §1] for every `p` (Layer 9);
- Deligne's truncated valuation rings, triples, the categories `(ext F)^e` and `(ext Tr_e F)^e`,
  the equivalence of Theorem 2.8 and the compatibilities of §§3.1–3.5, for complete discretely
  valued fields with perfect residue field (Layer 10);
- the fundamental exact sequence, the outer action of the Kummer generator, Theorem B and its
  corollary [Abrashkin 2000, §§0, 6–7] (Layer 11).

Layers 2 and 7 compute the same object, the ramification filtration of `Γ_K(p)` in nilpotent
class two. Layer 2 does it in the Magnus algebra, for every `p`, and Layer 7 in the class-two Lie
algebra, for `p ≠ 2`. Both are targets, because Theorems A and B′ use the first and the Main
Lemma uses the second. No comparison between them is a target.

Neither Mathlib nor Tau Ceti defines noncommutative power series over a profinite set of
variables, Lazard's isomorphism, Witt liftings of fields of characteristic `p`, the ramification
filtration of `Γ_K(p)` in nilpotent class two, Deligne's triples, or any statement recovering a
local field from a filtered Galois group. The finite levels of the Magnus algebra are the
truncated Magnus algebra of [GeometricTopology](../GeometricTopology/README.md) §4.12.1, which
0.1 cites. The profinite algebra over infinitely many variables, its topology, its universal
property for families converging to `0` and Lazard's isomorphism are new here.

It does not own:

- **Filtered profinite groups and the upper filtration on `G_K` and `G_K(p)`**: filtrations,
  filtered isomorphisms, `Out_Filt`, quotient filtrations, restriction to open subgroups, Herbrand
  functions of open subgroups, and the map from field isomorphisms to filtered outer
  isomorphisms: FilteredLocalGaloisGroups Layers 1–2.
- **The field of norms**: APF extensions, `X_K(L)`, `G_L ≅ G_{X_K(L)}` with filtrations,
  Wintenberger's full faithfulness on totally ramified `ℤ_p`-extensions, the lifting of
  isomorphisms and the cofinal systems: FieldOfNorms.
- **Full faithfulness of the field-of-norms functor on all `p`-adic Lie extensions**
  [Wintenberger 1980], which [Abrashkin 2000, §5.3] and [Abrashkin 2010, §7.1] cite. Its proof is
  not in print; Layer 6 uses FieldOfNorms 4.3 along `ℤ_p`-towers instead.
- **Artin–Schreier–Witt theory**: the operator `℘`, the duality `Q_∞(K) ≅ Hom(G_K, ℤ_p)`, reduced
  representatives over `k((T))`, the Schmid–Witt symbol and the ramification of
  Artin–Schreier–Witt extensions: FunctionFieldArithmetic Layers 3–4.
- **Free pro-`p` groups, completed group algebras and Serre's freeness criterion at arbitrary
  rank**: the [profinite pro-`p` groups roadmap](../../Completed/ProfiniteProPGroups/README.md),
  implemented in Tau Ceti. **The structure of `G_K(p)` for `K/ℚ_p` finite**, free or Demushkin:
  the [local Galois groups roadmap](../../Completed/LocalGaloisGroups/README.md).
- **Local class field theory**: ClassFieldTheory.
- **Ramification of non-Galois extensions**: `ψ_{L/K}`, RamificationOfCompleteDiscretelyValuedFields
  §4a.2; the breaks and slopes of a non-Galois extension, PadicExtensionFamilies Layer 2.
- **Mochizuki's theorem and Hyeon's `m`-step solvable form** for finite extensions of `ℚ_p`, by
  Hodge–Tate theory: LocalAnabelianGeometry. This roadmap proves the pro-`p` form of the same
  conclusion by a different method and shares no target with it.
- **The full description of the ramification filtration modulo `C_p`** [Abrashkin 1998, Thms. A–B]
  and modulo `I^pC_p(I)` [Abrashkin 1995]. This roadmap uses nilpotency class two only.
- **The proof of Theorem A′ in [Abrashkin 2000, §5]**, for `p ≠ 2`, through the field of norms
  of `E·K_∞` for finite Galois `E ⊆ K^sep`, the Main Lemma (B) and a limit over `v₀`. It is not a
  target: 6.5 deduces the statement for every `p` from Theorem A and the uniqueness of 5.5, as
  [Abrashkin 2010, p. 2] states. The Main Lemma remains a target, for Layer 11.
- **The global criterion** [Abrashkin 2010, p. 3] for automorphisms of decomposition groups of
  number fields. Its converse needs the Neukirch–Uchida theorem.
- **Higher-dimensional local fields** and their ramification filtrations
  [Abrashkin 2003; Abrashkin 2007].

**Dependency order.** Layer 0 needs Tau Ceti and GeometricTopology §4.12.1. Layer 1 needs Layer 0 and
FunctionFieldArithmetic 3.1–3.2 and 4.3. Layer 2 needs Layer 1 and FunctionFieldArithmetic 4.4.
Layer 3 needs Layers 1–2. Layer 4 needs Layers 1 and 3. Layer 5 needs Layers 2–4 and
FilteredLocalGaloisGroups Layers 1–2. Layer 6 needs Layer 5 and FieldOfNorms 2.2, 3.3, 4.3–4.4.
Layer 7 needs Layer 0, 1.1–1.3, 1.5, the sign of 1.6 (b), 2.2's route, FunctionFieldArithmetic 4.4
and ClassFieldTheory Layer 7. Layer 8 needs Layer 7. Layer 9 needs 5.1, 6.5,
FilteredLocalGaloisGroups 1.4, 1.5, 2.2 and ClassFieldTheory Layer 7. Layer 10 needs only
RamificationOfCompleteDiscretelyValuedFields §§4a.1–4a.2. Layer 11
needs Layers 7, 8 and 10 and FieldOfNorms 1.4, 2.2, 3.3.

## Exact supplier contracts

### From GeometricTopology

- **§4.12.1**: the truncated Magnus algebra, the quotient of `FreeAlgebra R I` by the words of
  length `d + 1` for a commutative ring `R` and a finite type `I`, with its basis of words, the
  truncations, coefficient change, deletion of variables and the universal property (0.1).

### From FilteredLocalGaloisGroups

- **1.2, 1.4, 1.5**: `GroupFiltration`, `IsFiltered F F' S α` with `S = Set.Ici 0`,
  `FilteredOut`, `GroupFiltration.herbrandPsi` with its tower law, and `GroupFiltration.restrict`
  with `exists_isFiltered_restrict`.
- **1.3**: `GroupFiltration.quotient`, and filtered isomorphisms inducing filtered isomorphisms of
  maximal pro-`p` quotients (`map_proPKernel_eq`).
- **2.1**: the upper filtration `F_K` on `G_K` for every nonarchimedean local field, and its
  quotient on `G_K(p)`.
- **2.2**: for finite separable `L/K`, `F_K.restrict L.fixingSubgroup` is the upper filtration of
  `G_L`, with `ψ_H = ψ_{L/K}`.
- **2.4**: the map from continuous field isomorphisms `K ≅ K'`, with an extension to algebraic
  closures, to filtered isomorphisms and to `Out_Filt`, and its composite with the maximal pro-`p`
  quotient.

### From FieldOfNorms

- **0.2, 0.6**: `ψ_{L/K}` of an APF extension, and the criterion that a Galois `L/K` is APF iff
  every `Gal(L/K)^u` is open.
- **1.4**: the ring `A_K(L) = lim 𝒪_E/𝔪_E^{s(E)}` with `s(E) = r(E)`, and the surjections
  `𝒪_{X_K(L)} → 𝒪_E/𝔪_E^{r(E)}`.
- **2.2**: the equivalence `X_{L/K}` of separable algebraic extensions and the isomorphism
  `ι_{L/K} : G_L ≅ G_{X_K(L)}`.
- **2.3**: the faithful action of `Gal(L/K)` on `X_K(L)` for `L/K` Galois.
- **3.3**, absolute form: `ι_{L/K}` carries `G_K(u) ∩ G_L` onto `G_{X_K(L)}(ψ_{L/K}(u))`.
- **4.3**: lifting of isomorphisms. For infinite Galois APF `L/K`, `L'/K'` with an open normal
  `Γ₁ ≅ ℤ_p` whose fixed field `K₁` has `L/K₁` totally ramified, a continuous
  `μ̃ : X_K(L) ≅ X_{K'}(L')` conjugating `X_K(Gal(L/K))` onto `X_{K'}(Gal(L'/K'))` is the
  transport of a unique `μ : L ≅ L'` with `μ(K) = K'`, equivariantly.
- **4.4**: the cofinal systems `E_F = F·E_∞` inside `E(p)`, and the argument showing that they
  satisfy 4.3's hypothesis.
- **Worked examples**: the Kummer tower `ℚ_p(p^{1/p^∞})`, its elementary tower and its field of
  norms `𝔽_p((t))`, `t = (p^{1/p^n})`, in the general form `K(π_K^{1/p^∞})`.

### From FunctionFieldArithmetic

- **3.1**: `artinSchreierWitt p F`, `Q_n(F)`, `Q_∞(F)`, and the dualities
  `exists_addEquiv_aswQuotient_characters`, `exists_addEquiv_aswQuotient_padicCharacters` with
  the solution-pairing equation.
- **3.2**: `aswReduced_exists_unique` and `aswReduced_exists_unique_length` over `K = k((T))`.
- **4.3**: the Schmid–Witt symbol, `schmidWitt_perfect`, `schmidWitt_characterization` and
  `schmidWitt_formula`.
- **4.4**: `aswConductor_eq` and `aswUpperRamification`.

### From ClassFieldTheory

- **Layer 7**: the absolute Artin map, its unit-filtration reciprocity
  `map_artinMap_unitFiltration_eq_upper` in every characteristic, and its naturality
  `artinMap_congr`. They are used in 3.1 (`ℳ ≅ U_K/U_K^p`), 4.1 (`I_{K_s}(p)^ab ≅ U_{K_s}`), 5.5
  and 9.1 (an automorphism acting trivially on `G_K^ab` is trivial on `K`), and 11.3
  (Prop. of §7.1).

### From RamificationOfCompleteDiscretelyValuedFields

- **§§4a.1–4a.2**, over a complete discretely valued field with perfect residue field: the
  upper numbering, and `ψ_{L/K}`, `φ_{L/K}` of finite separable, not necessarily Galois,
  extensions, with the tower law and the open-subgroup identity. They are used for the condition `C^f` and the
  functor `T` of Layer 10, and for Lemma 1 of §6.2.

### From PadicExtensionFamilies

- **2.1–2.2**: the orbit-count function and the upper breaks of a non-Galois `L/K`, read in Layer
  10.2.

### From the profinite pro-`p` groups roadmap, implemented in Tau Ceti

- `TauCeti.freeProCPointed`, its universal property, `ConvergesToOne`, `freeProPInsertOne`,
  `IsProP.presentation`, and the pointed Serre theorem
  `TauCeti.IsProP.exists_convergesToOne_continuousMulEquiv_presentation_of_cohomologicalDimensionAt_le_one`
  (Layer 10).
- `TauCeti.completedGroupAlgebra` (Layer 9).
- `TauCeti.cohomologicalDimensionAt`, `TauCeti.absoluteGaloisGroupProP` and
  `isTopologicallyFinitelyGenerated_absoluteGaloisGroupProP`.

### From the local fields and ramification roadmap, implemented in Tau Ceti

- `TauCeti.LocalFieldsRamification.upperRamificationGroup`, `herbrand`, `inverseHerbrand`, and
  Herbrand's theorem on quotients `map_restrictNormalHom_upperRamificationGroup`.
- Teichmüller representatives (`LocalField/Teichmuller.lean`), unramified extensions
  (`TauCeti.unramifiedExtension`), and `TauCeti.LaurentSeries.isNonarchimedeanLocalField`.
- Tau Ceti's Artin–Schreier extensions of degree `p`, `TauCeti/FieldTheory/ArtinSchreier/`.

### From Mathlib

- `FreeAlgebra`, `LieRing`, `LieAlgebra`, `WittVector`, `TruncatedWittVector`,
  `WittVector.frobenius`, `WittVector.teichmuller`, `LaurentSeries`,
  `Field.absoluteGaloisGroup`, `separableClosure`, and the infinite Galois correspondence
  (`Mathlib/FieldTheory/Galois/Infinite.lean`).

## References

- V. Abrashkin, *Modified proof of a local analogue of the Grothendieck conjecture*, J. Théor.
  Nombres Bordeaux **22** (2010), 1–50 — Thm. A (p. 2); §1 (Props. 1.1–1.3, pp. 4–8); §2
  (Props. 2.1–2.7, pp. 8–14); §3 (Props. 3.1–3.6, pp. 14–25); §4 (Props. 4.1–4.5, Thms. B, B′,
  Lemmas 4.4–4.9, pp. 25–35); §5 (Props. 5.1–5.9, pp. 35–43); §6 (Props. 6.1–6.2, pp. 44–47); §7
  (pp. 47–49).
- V. Abrashkin, *On a local analogue of the Grothendieck conjecture*, Internat. J. Math. **11**
  (2000), 133–175 — Thm. B and Corollary (pp. 135–136); §1 (Thms. A, A′, p. 139); §2 (special
  bases, Prop. of §2.6, pp. 139–145); §3 (Thm. of §3.1, Prop. of §3.3, Props. 1–3 of §3.4,
  pp. 145–150); §4 (Main Lemma, pp. 150–161); §5 (pp. 161–164); §6 (pp. 164–169); §7
  (pp. 169–174). Subsections number the statements, cited as "Prop. of §2.6".
- V. Abrashkin, *A ramification filtration of the Galois group of a local field. III*,
  Izv. Ross. Akad. Nauk Ser. Mat. **62**:5 (1998), 3–48; English transl. Izv. Math. **62**
  (1998), 857–900 — §§1–4 (Props. of §§1.5–1.6, p. 865–868; Prop. of §2.5, p. 871; Thm. of §4,
  p. 892), §5 (Thms. A–B, pp. 899–900).
- V. Abrashkin, *A ramification filtration of the Galois group of a local field. II*, Trudy Mat.
  Inst. Steklov. **208** (1995), 18–69 — the ramification filtration modulo `C₃` and nilpotent
  Artin–Schreier theory, cited by [Abrashkin 2000, §3.1].
- V. Abrashkin, *A ramification filtration of the Galois group of a local field*, Trudy
  S.-Peterburg. Mat. Obshch. **3** (1995), 47–127 — the filtration modulo `I^pC_p(I)`.
- V. Abrashkin, *An analogue of the Grothendieck conjecture for two-dimensional local fields of
  finite characteristic*, Trudy Mat. Inst. Steklov. **241** (2003), 8–42; and J. Algebraic Geom.
  **16** (2007), 671–730 — the higher-dimensional sequels, not here.
- P. Deligne, *Les corps locaux de caractéristique p, limites de corps locaux de caractéristique
  0*, in J.-N. Bernstein, P. Deligne, D. Kazhdan, M.-F. Vignéras, *Représentations des groupes
  réductifs sur un corps local*, Travaux en Cours, Hermann, Paris, 1984, 119–157 — §1 (1.1–1.5),
  §2 (Def. 2.7, Thm. 2.8, Cors. 2.9–2.10), §3 (3.4–3.5), Appendix (A.6.1–A.6.3).
- M. Lazard, *Groupes analytiques p-adiques*, Publ. Math. IHÉS **26** (1965), 5–219 — the
  completed group algebra of a free pro-`p` group.
- H. Koch, *Galoissche Theorie der p-Erweiterungen*, Deutscher Verlag der Wissenschaften and
  Springer, 1970; English transl. *Galois Theory of p-Extensions*, Springer, 2002 — Ch. 7, Magnus
  algebras of free pro-`p` groups.
- J.-P. Serre, *Lie Algebras and Lie Groups*, Lecture Notes in Math. 1500, Springer — Part I,
  Ch. IV, §6 (the Magnus embedding of a free group).
- J.-P. Serre, *Galois Cohomology*, Springer — II §2.2 (`cd_p ≤ 1` in characteristic `p`).
- P. Berthelot and W. Messing, *Théorie de Dieudonné cristalline III*, in *The Grothendieck
  Festschrift* I, Birkhäuser, 1990 — the liftings `O_M(L)`.
- I. R. Shafarevich, *On p-extensions*, Mat. Sb. **20** (1947) — the exponential `E(β, X)` and
  the basis of principal units.
- J.-P. Wintenberger, *Le corps des normes de certaines extensions infinies de corps locaux;
  applications*, Ann. Sci. ÉNS **16** (1983), 59–89; *Extensions abéliennes et groupes
  d'automorphismes de corps locaux*, C. R. Acad. Sci. Paris **290** (1980), 201–203; through
  FieldOfNorms.
- S. Mochizuki, *A version of the Grothendieck conjecture for p-adic local fields*, Internat. J.
  Math. **8** (1997), 499–506 — the characteristic-`0` theorem of LocalAnabelianGeometry.
