# Roadmap: the profinite Grothendieck–Teichmüller group

**Summary.** Build Drinfeld's profinite Grothendieck–Teichmüller group `GT̂` on Tau Ceti's free
profinite group `F̂₂` and profinite integers `ẑ`: the substitution calculus `f ↦ f(a, b)` of
pro-words in two variables, the monoid of parameters `(λ, f) ∈ ẑ × F̂₂` acting on `F̂₂` by
`x ↦ x^λ`, `y ↦ f⁻¹ y^λ f`, Drinfeld's relations (I) and (II) in `F̂₂` and the pentagon relation
(III) in the profinite pure braid group `P̂₄`, and the groups `GT̂ ⊆ GT̂₀`. The end theorems are:
an element of Drinfeld's monoid `GT̂^{mon}` is invertible exactly when its endomorphism of `F̂₂` is
bijective; Guillot's definition of `GT̂₀` by commutation with two automorphisms of `F̂₂` agrees
with Drinfeld's by relations (I) and (II); `GT̂ ⊆ GT̂₀`; the map `GT̂ → ContinuousOut F̂₂` is
injective; and `g ↦ β_g` identifies `GT̂` with a closed subgroup of `ContinuousAut F̂₂` for Tau
Ceti's congruence topology. The character `χ : GT̂₀ → ẑˣ` and the five-term form of relation (III)
are built on the way. The statements are those of Drinfeld 1990, Ihara 1991, Lochak–Schneps 1994,
Schneps 1997 and Guillot 2014.

Suggested home: `TauCeti/Topology/Algebra/Group/Profinite/GrothendieckTeichmuller/`, beside
Tau Ceti's `Profinite/Free/` and `ContinuousAut/`.

## Scope and ownership

**Owned here.** Everything is a statement about free profinite groups of finite rank, about the
pure braid group on four strands and its profinite completion, about the pure mapping class group
`K(0,5)`, or about pairs `(λ, f) ∈ ẑ × F̂₂`:

- the general facts on free profinite groups of finite rank that Layer 0 needs (topological finite
  generation, abelianization, centralizers of basis elements, continuity of evaluation), stated at
  that generality, and the substitution calculus of pro-words in two variables (Layer 0);
- the monoid of parameters `ẑ × F̂₂`, its action `(λ, f) ↦ β_{λ,f}` on `F̂₂` and its topology
  (Layer 1);
- the six words `x_{ij} ∈ pureSubgroup 4` of the Conventions and the theorem that they generate
  `pureSubgroup 4` (Lochak–Schneps 1994, §2, for the formula and the generation statement;
  Drinfeld 1990, (4.6)), the completion `P̂₄`, and relation (III) there (Layer 2). Nothing is
  stated here about pure braid groups on other numbers of strands;
- Drinfeld's relations, the monoid `GT̂^{mon}`, the groups `GT̂₀` and `GT̂`, the mapping class group
  `M(0,5)` with its pure subgroup `K(0,5)` as needed for the five-term relation (Layer 3);
- the character `χ`, the injections into `ContinuousAut F̂₂` and `ContinuousOut F̂₂`, the actions on
  finite quotients and the topology of `GT̂₀` and `GT̂` (Layer 4).

**Supplied at the pins.** The free profinite group and its universal property, `ẑ` as a
topological ring, the power `x ^ᶻ a`, `ContinuousAut` with its congruence topology, `ContinuousOut`,
the Hopf property, and the braid groups with `σ_i` and the pure braid subgroup are Tau Ceti
declarations (from the completed roadmaps ProfiniteProPGroups and
[ProfiniteArithmetic](../../Completed/ProfiniteArithmetic/README.md), and Tau Ceti's braid
library); profinite completion and closures are Mathlib's. They are consumed by name; no second
carrier is built.

**Scope.** The homomorphism `Gal(ℚ̄/ℚ) → GT̂` (Ihara 1994; Drinfeld 1990, §4 after (4.14);
injective by Belyi 1979), its image (Ihara 1991, Question 3.3.3), `Out♯ₙ ≅ GT̂` for `n ≥ 5`
(Harbater–Schneps 2000, Main Theorem; `Out♯ₙ` is the group of outer automorphisms of
`π̂₁(M_{0,n})` that preserve the conjugacy classes of the inertia subgroups and commute with the
permutations of the marked points) and `Out(Πₙ) ≅ GT̂ × 𝔖ₙ₊₃` for `n ≥ 2`
(Hoshi–Minamide–Mochizuki 2022, Corollary 2.8; `Πₙ` is the profinite fundamental group of the
configuration space of `n` points on `ℙ¹ ∖ {0, 1, ∞}` over `ℚ̄`) are left to the successor of
[BelyiMaps](../BelyiMaps/README.md) Layer 12 (`BelyiArithmeticActions`) and to
InverseGaloisAndArithmeticFundamentalGroups §IG.1.2 (tangential base points) and §IG.5.1
(configuration spaces). The pro-unipotent and graded groups `GT(k)`,
`GRT(k)` and the Lie algebra `𝔤𝔯𝔱` are not in this roadmap.

The boundary in one sentence: if a statement is about pro-words, about `P̂₄` or `K̂(0,5)`, or about
pairs `(λ, f)`, it is here; if it mentions a Galois group, a curve or a configuration space, it is
in BelyiMaps' successor or in InverseGaloisAndArithmeticFundamentalGroups.

## Conventions

- `F̂₂ := TauCeti.freeProfiniteGroup (Fin 2)` in universe `0` (`F2`); `x := of 0`, `y := of 1`,
  `z := (x y)⁻¹`, so `x y z = 1` (`x`, `y`, `z`).
- `ẑ := Additive TauCeti.zHat.{0}` with Tau Ceti's ring structure; powers are `g ^ᶻ a`.
- **Substitution.** For `f ∈ F̂₂` and `a, b` in a profinite group `P` (universe `0`),
  `f(a, b) := freeProfiniteGroup.lift ![a, b] f` (`subst`). In particular `f(x, y) = f`, and
  `f(y, x) = θ(f)` for the swap `θ`.
- **The action of a parameter.** For `(λ, f) ∈ ẑ × F̂₂` (`Param`), `β_{λ,f} : F̂₂ →ₜ* F̂₂` (`beta`)
  is the continuous endomorphism with `β_{λ,f}(x) = x^λ` and `β_{λ,f}(y) = f⁻¹ y^λ f`. This is the
  convention of Guillot 2014, Proposition 5.17 (with `σ = x`, `α = y`), of Ihara 1991, §3.3, and of
  Schneps 1997, §1.1.
- **The product of parameters** is the one that makes `(λ, f) ↦ β_{λ,f}` multiplicative:
  `(λ, f) · (μ, g) := (λμ, f · β_{λ,f}(g))`, with unit `(1, 1)`, so that
  `β_{(λ,f)·(μ,g)} = β_{λ,f} ∘ β_{μ,g}`. This is the law of Ihara 1991, §3.3, Schneps 1997, §1.1,
  and Guillot 2014, §5.6; Lochak–Schneps 1994, §1, write the same law in the form
  `f₂(f₁ x^{λ₁} f₁⁻¹, y^{λ₁}) f₁`. Drinfeld 1990, (4.11), composes in the opposite order; the two
  laws differ already at `(−1, 1)` and `(1, x)`: here `(−1, 1) · (1, x) = (−1, x⁻¹)` and
  `(1, x) · (−1, 1) = (−1, x)`, while Drinfeld's law gives `(−1, x)` and `(−1, x⁻¹)`.
- **Half of `λ − 1`.** For `λ ∈ ẑˣ`, `m_λ` is the unique `m ∈ ẑ` with `2m = λ − 1`. It exists
  because the `2`-adic component of a unit is odd, and is unique because `2` is a non-zero-divisor
  of `ẑ`.
- **The words `x_{ij}`.** With Tau Ceti's zero-based `σ₀, σ₁, σ₂` of `B₄` (`σ_k` crosses strands
  `k` and `k + 1`), and strands numbered `1, …, 4` in prose:
  `x₁₂ = σ₀²`, `x₂₃ = σ₁²`, `x₃₄ = σ₂²`, `x₁₃ = σ₁ σ₀² σ₁⁻¹`, `x₂₄ = σ₂ σ₁² σ₂⁻¹`,
  `x₁₄ = σ₂ σ₁ σ₀² σ₁⁻¹ σ₂⁻¹`. This is the formula
  `x_{ij} = σ_{j−1} ⋯ σ_{i+1} σ_i² σ_{i+1}⁻¹ ⋯ σ_{j−1}⁻¹` of Drinfeld 1990, (4.6), Lochak–Schneps
  1994, §2, and Schneps 1997, §1.1, written in their one-based indexing and shifted by one. In Lean
  they are `a12`, `a13`, `a14`, `a23`, `a24`, `a34`, elements of `P4 := pureSubgroup 4`.
- `P̂₄ := ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of (pureSubgroup 4))` (`P4hat`), and
  `x_{ij}` also denotes the image of `x_{ij}` under `eta` (`toHat`).
- **Drinfeld's relations**, for `(λ, f) ∈ ẑˣ × F̂₂'`:
  - (I) `f(y, x) · f = 1`;
  - (II) `f(z, x) z^{m_λ} f(y, z) y^{m_λ} f x^{m_λ} = 1`;
  - (III) in `P̂₄`:
    `f(x₁₂, x₂₃x₂₄) f(x₁₃x₂₃, x₃₄) = f(x₂₃, x₃₄) f(x₁₂x₁₃, x₂₄x₃₄) f(x₁₂, x₂₃)`.

  These are relations (4.3), (4.4) and (4.10) of Drinfeld 1990 in the profinite setting, as
  restated in Ihara 1991, (3.1.1), and Schneps 1997, §1.1. Relation (III) is pinned in Drinfeld's
  `P̂₄` form; the five-term form in `K̂(0,5)` is a theorem of Layer 3, not an alternative
  definition.
- **The mapping class group `M(0,5)`.** `M(0,5)` is the quotient of `B₅` by the normal closure of
  `σ₃ σ₂ σ₁ σ₀² σ₁ σ₂ σ₃` and `(σ₀ σ₁ σ₂ σ₃)⁵`, and `K(0,5)` is the kernel of the map
  `M(0,5) → 𝔖₅` induced by `permHom` (Schneps 1997, §1.1, in zero-based indexing). Indices of the
  generators `x_{i,i+1}` of `K(0,5)` are read modulo `5`, so `x₅₁ = x₁₅`. The automorphism `ρ` of
  `K(0,5)` is the restriction of `u ↦ c⁻¹ u c` with `c = (σ₃ σ₂ σ₁ σ₀)³`, and
  `ρ(x_{i,i+1}) = x_{i+3,i+4}`. For `f ∈ F̂₂`, `f̃ := f(x₁₂, x₂₃) ∈ K̂(0,5)`.

## Exact supplier contracts

**From Mathlib** (at the pinned revision).

- `ProfiniteGrp`, `ProfiniteGrp.ProfiniteCompletion.completion`, its unit `eta`, its universal
  property `lift` (a homomorphism from a group to a profinite group extends uniquely and
  continuously to the completion) and `denseRange` (the image of the group is dense).
- `commutator`, `Subgroup.topologicalClosure`, `Subgroup.closure`, `Subgroup.center`,
  `Subgroup.normalClosure`, quotient groups; `ContinuousMonoidHom` (`→ₜ*`) and
  `ContinuousMulEquiv` (`≃ₜ*`); `Units` of a monoid with its topology (the embedding
  `u ↦ (u, u⁻¹)` into `M × Mᵐᵒᵖ`); `TopologicalSpace.induced`; `Topology.IsClosedEmbedding`.

**From Tau Ceti** (at the pinned revision).

- **Free profinite groups** (`TauCeti/Topology/Algebra/Group/Profinite/Free/Basic.lean`).
  `TauCeti.freeProfiniteGroup X : ProfiniteGrp`, the completion of `FreeGroup X`, with `of`, `lift`
  (for a map `X → P` to a profinite group, the continuous homomorphism extending it), `lift_of`,
  `lift_unique`, `hom_ext` (two continuous homomorphisms to a Hausdorff group that agree on `of`
  agree), `comp_lift`, `map`, `existsUnique_continuousMulEquiv`.
- **Profinite integers and powers** (`…/Profinite/ZHat/`). `TauCeti.zHat`, the commutative
  topological ring structure on `Additive zHat` (`Ring.lean`), the unit criterion and
  `ẑˣ ≃ ∏ ℤ_ℓˣ` (`Units.lean`, `isUnit_iff_component`, `unitsEquivPiPadicInt`), and
  `TauCeti.zpowHat` with notation `x ^ᶻ a` (`Pow.lean`): `zpowHat_mul`, `map_zpowHat` (a continuous
  homomorphism commutes with `^ᶻ`), `conj_zpowHat`, `zpowHat_intCast` (agreement with integer
  powers), `continuous_zpowHat`.
- **Automorphisms** (`TauCeti/Topology/Algebra/Group/ContinuousAut/`). `TauCeti.ContinuousAut G`,
  the group `G ≃ₜ* G`; `ContinuousAut.conj`; `TauCeti.ContinuousOut G`, the quotient by the image of
  `conj`, with `ContinuousOut.mk`; the congruence topology `ContinuousAut.congruenceTopology`
  (`Congruence.lean`), coarsest making every action on a quotient by a topologically
  characteristic open normal subgroup continuous; and, for `G` profinite and topologically finitely
  generated, `ContinuousAut.compactSpace` and `ContinuousAut.t2Space`.
- **Generation and the Hopf property.** `TauCeti.IsTopologicallyFinitelyGenerated`
  (`TauCeti/Topology/Algebra/Group/Generation.lean`) and
  `IsTopologicallyFinitelyGenerated.bijective_of_surjective` (`…/Profinite/Hopfian.lean`): a
  continuous surjective endomorphism of a topologically finitely generated profinite group is
  bijective. It takes topological finite generation as a hypothesis; for `F̂₂` that hypothesis is
  target 0.1.
- **Braids** (`TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean`). `TauCeti.BraidGroup n` (the
  Artin group of type `A_{n−1}`), `sigma`, `lift`, `permHom : BraidGroup n →* Equiv.Perm (Fin n)`,
  `permHom_surjective`, `pureSubgroup n = ker permHom`, `sigma_sq_mem_pureSubgroup`.

Nothing is consumed from another roadmap.

## How to read the build

Layer 0 proves the general facts on free profinite groups of finite rank that the rest uses and
builds the substitution calculus and the closed commutator subgroup `F̂₂'`. Layer 1 makes the
parameters `(λ, f)` into a topological monoid acting on `F̂₂` and proves that `f` is determined by
`β_{λ,f}` for unit `λ` and `f ∈ F̂₂'`. Layer 2 gives the six generators of `P₄` and the
completion `P̂₄`, independently of Layers 0 and 1, and relation (III), which uses the substitution
of 0.2. Layer 3 defines Drinfeld's relations and the groups `GT̂₀` and `GT̂`, and proves the two
comparison theorems: units of `GT̂^{mon}` are the bijective parameters, and Guillot's commutation
conditions are relations (I) and (II); it ends with the five-term form of (III). Layer 4 proves the
structure theorems: `GT̂ ⊆ GT̂₀`, the character, the injection into outer automorphisms, the
examples, the action on finite quotients and the topology. Within Layer 3, 3.4 and 3.5 are the
hardest.

## Layer 0: pro-words

### 0.1 Free profinite groups of finite rank

For a finite type `X`, prove for `F̂(X) := freeProfiniteGroup X`:

- `F̂(X)` is topologically finitely generated (`TauCeti.IsTopologicallyFinitelyGenerated`): the
  subgroup generated by the `of i`, `i ∈ X`, is dense, because `FreeGroup X` is generated by `X`
  and its image under `eta` is dense (Mathlib `denseRange`).
- The abelianization: the continuous homomorphism `F̂(X) → Multiplicative (X → ẑ)` sending `of i`
  to the `i`-th basis vector is surjective, and its kernel is the closure of the commutator
  subgroup. Route: a continuous homomorphism from `F̂(X)` to a finite abelian group is the same as
  a map from `X`, so the quotient by the closed commutator subgroup is the completion of `ℤ^X`
  (the reduction used in Guillot 2014, proof of Proposition 5.17, at rank two).
- For `i ∈ X`, the closed subgroup generated by `of i` is the image of `zHat.lift (of i)`, which is
  injective; for every `g ≠ 1` in it, the centralizer of `g` in `F̂(X)` is that closed subgroup.
  Route: `F̂(X)` is the free profinite product `⟨of i⟩‾ ∐ F̂(X ∖ {i})` (Ribes–Zalesskii 2010,
  §9.1, uncertified), and the centralizer of a nontrivial element of a free factor of a free
  profinite product lies in that factor (Herfort–Ribes 1985, Theorem B).
- Evaluation `(a, w) ↦ lift a w` is jointly continuous on `(X → P) × F̂(X)` for `P` profinite, and
  natural in `P` (Tau Ceti `comp_lift`).

*Needs:* Mathlib `ProfiniteGrp.ProfiniteCompletion.denseRange`, `commutator`,
`Subgroup.topologicalClosure`; Tau Ceti `freeProfiniteGroup.dense_closure_range_of` (with the
finiteness of `X`, the whole of the first item), `freeProfiniteGroup.lift`, `lift_unique`,
`hom_ext`, `comp_lift`, `zHat.lift`, `IsTopologicallyFinitelyGenerated`; the free-product
decomposition of `F̂(X)` (Ribes–Zalesskii 2010, §9.1).

**Checks.**

- `X` empty: `F̂(X)` is trivial and its abelianization is the zero group; a statement that
  required `X` nonempty would leave the trivial case out.
- Rank one: `F̂(Fin 1) ≅ ẑ` is abelian, the commutator closure is trivial, and the centralizer of
  `of 0` is everything, which is the closed subgroup it generates.
- Rank two: `x y` does not commute with `y` (send `x ↦ (12)`, `y ↦ (23)` in `𝔖₃`: `(123)` and
  `(23)` do not commute), so the centralizer of `y` misses `x y`; the hypothesis `g ≠ 1` is needed,
  since the centralizer of `1` is all of `F̂(X)`.

### 0.2 Substitution

Define `subst f a b = f(a, b)` for `f ∈ F̂₂` and `a, b` in a profinite group `P`, as in the
Conventions. *Needs:* Tau Ceti `freeProfiniteGroup.lift`, `comp_lift`, `lift_unique`, `hom_ext`,
`map_zpowHat`; 0.1 (evaluation).

- For every `f`, `f(x, y) = f`; `x(a, b) = a` and `y(a, b) = b`.
- `f ↦ f(a, b)` is a continuous homomorphism: it respects products, inverses and `1`, and
  `(g^c)(a, b) = g(a, b)^c` for `c ∈ ẑ`.
- For a continuous homomorphism `φ : P →ₜ* Q`, `φ(f(a, b)) = f(φ a, φ b)`.
- `f(g(a, b), h(a, b)) = (f(g, h))(a, b)` for `f, g, h ∈ F̂₂`.
- `(f, a, b) ↦ f(a, b)` is jointly continuous.
- Two continuous homomorphisms `F̂₂ → P` that agree on `x` and `y` are equal.

These are the rank-two cases of the statements of 0.1 for `freeProfiniteGroup X`; `subst` is the
two-generator form used below.

**Checks.**

- `z(a, b) = (a b)⁻¹`; a substitution that swapped its arguments would give `x(a, b) = b`.
- The commutator `[x, y] = x y x⁻¹ y⁻¹` at `a = (12)`, `b = (23)` in `𝔖₃` is `(132) ≠ 1`, so
  `subst` does not factor through the abelianization.
- If `a` and `b` commute, `f(a, b) = 1` for every `f ∈ F̂₂'`, while `x(a, b) = a` need not be `1`.

### 0.3 The closed commutator subgroup

Define `F̂₂' := (commutator F̂₂).topologicalClosure` (`commutatorClosure`). Prove that it is the
kernel of the abelianization `F̂₂ → ẑ × ẑ`, `x ↦ (1, 0)`, `y ↦ (0, 1)` (0.1 at rank two), that it
is closed, normal and topologically characteristic, and that `f(a, b)` lies in the closed
commutator subgroup of `P` for `f ∈ F̂₂'`. *Needs:* 0.1 (abelianization), 0.2.

**Checks.**

- `x ∉ F̂₂'`: the quotient `F̂₂ → ℤ/2`, `x ↦ 1`, `y ↦ 0`, sends `x` to `1 ≠ 0`.
- `x y x⁻¹ y⁻¹ ∈ F̂₂'`.
- `x^a y^b ∈ F̂₂'` only for `a = b = 0`; in particular, for `f ∈ F̂₂'` and `c ≠ 0`, `y^c f ∉ F̂₂'`.

### 0.4 Three automorphisms

Define the continuous endomorphisms `θ` (`thetaHom`: `x ↦ y`, `y ↦ x`) and Guillot's `δ`
(`deltaHom`: `x ↦ x⁻¹ y⁻¹`, `y ↦ y`), and `ω` (`x ↦ y`, `y ↦ z`). Prove that they are elements of
`ContinuousAut F̂₂`, with `θ² = 1`, `ω³ = 1` and `δ² = conj y`, and that `δ = conj y ∘ ω ∘ θ`, so
that `δ` and `ωθ` have the same class in `ContinuousOut F̂₂` (Guillot 2014, Lemma 5.11 and the
remark after it; Schneps 1997, §1.1, for `θ` and `ω`). *Needs:* 0.2, Tau Ceti
`existsUnique_continuousMulEquiv`, `ContinuousAut.conj`.

**Checks.**

- `θ(θ(x)) = x` and `θ(θ(y)) = y`.
- `ω` permutes `x ↦ y ↦ z ↦ x`: `ω(z) = (y z)⁻¹ = x`, so `ω³ = 1`; `ω` has order `3`, `δ` has
  order `2` in `ContinuousOut F̂₂`, so `δ` is not an inverse of `ω` there.
- `δ²(x) = (x⁻¹ y⁻¹)⁻¹ y⁻¹ = y x y⁻¹` and `δ²(y) = y`; and `ωθ(x) = z = y⁻¹ x⁻¹`, whose conjugate
  by `y` is `x⁻¹ y⁻¹ = δ(x)`, while `ωθ(y) = y = δ(y)`.

### Examples

- `θ` sends `[x, y]` to `[y, x] = [x, y]⁻¹`.
- At rank two, the abelianization sends `x³ y⁻² [x, y]` to `(3, −2)`.

### Dependencies

Mathlib: `ProfiniteGrp.ProfiniteCompletion`, `commutator`, `Subgroup.topologicalClosure`. Tau
Ceti: `freeProfiniteGroup` and its API, `zHat.lift`, `zpowHat`, `ContinuousAut`,
`IsTopologicallyFinitelyGenerated`.

## Layer 1: parameters and their action

### 1.1 Parameters and the endomorphism `β_{λ,f}`

Define `Param`, the structure of pairs `(λ, f)` with `λ ∈ ẑ` and `f ∈ F̂₂`, and `beta`, the
continuous endomorphism `β_{λ,f}` of the Conventions, by `freeProfiniteGroup.lift`. *Needs:* 0.2,
Tau Ceti `zpowHat`.

- `β_{λ,f}(x) = x^λ` and `β_{λ,f}(y) = f⁻¹ y^λ f`.
- `β_{λ,f}(z) = (x^λ f⁻¹ y^λ f)⁻¹`.
- `β_{λ,f}(g) = g(x^λ, f⁻¹ y^λ f)` for every `g ∈ F̂₂`.

**Checks.**

- `β_{1,1}` is the identity.
- `β_{0,f}` is trivial for every `f`: `x ↦ 1`, `y ↦ f⁻¹ f = 1`.
- `β_{−1,1}` sends `x ↦ x⁻¹`, `y ↦ y⁻¹` and `z ↦ (x⁻¹ y⁻¹)⁻¹ = y x`. The other conjugation
  convention, `y ↦ f y^λ f⁻¹`, would differ at `(1, x)`: `x⁻¹ y x` here against `x y x⁻¹`.

### 1.2 The monoid of parameters

Give `Param` the product and unit of the Conventions and prove the monoid laws
(`param_mul_assoc`, `param_one_mul`, `param_mul_one`), so that `Param` is a `Monoid`. Prove
`beta_mul` (`β_{p·q} = β_p ∘ β_q`) and `beta_one` (`β_{1,1} = id`), so that `p ↦ β_p` is a monoid
homomorphism to the continuous endomorphisms of `F̂₂` under composition. *Needs:* 1.1, Tau Ceti
`zpowHat_mul`, `conj_zpowHat`, `map_zpowHat`.

**Checks.**

- `(−1, 1) · (1, x) = (−1, x⁻¹)` and `(1, x) · (−1, 1) = (−1, x)`: the monoid is not commutative.
- `β_{(1,x)·(−1,1)} = β_{1,x} ∘ β_{−1,1}`: both send `y ↦ x⁻¹ y⁻¹ x`; the opposite law would
  give the parameter `(−1, x⁻¹)`, whose `β` sends `y ↦ x y⁻¹ x⁻¹`.
- `(−1, 1) · (−1, 1) = (1, β_{−1,1}(1)) = (1, 1)`.

### 1.3 The exponent

The map `(λ, f) ↦ λ` is a monoid homomorphism from `Param` to the multiplicative monoid of `ẑ`.
Hence a unit of `Param` has a unit exponent. *Needs:* 1.2.

**Checks.**

- The exponent of `(λ, f) · (μ, g)` is `λμ`, whatever `f` and `g`.
- `(0, f)` is not a unit of `Param`, since `0` is not a unit of `ẑ`.
- `(1, [y, x])` has a unit exponent, but is not a unit of `Param` (3.2, Checks): a unit exponent
  is necessary, not sufficient. No `(λ, 1)` with `λ ∈ ẑˣ` can serve here, since `β_{λ,1}` is
  always surjective (its image contains `(x^λ)^{λ⁻¹} = x` and `y`).

### 1.4 Uniqueness of `f`

Prove `eq_of_beta_eq`: if `λ ∈ ẑˣ`, `f, g ∈ F̂₂'` and `β_{λ,f} = β_{μ,g}`, then `(λ, f) = (μ, g)`.
Route: `x^λ = x^μ` gives `λ = μ`, since the closed subgroup generated by `x` is a copy of `ẑ`
(0.1); then `g f⁻¹` centralizes `y^λ`, so it lies in the closed subgroup generated by `y` (0.1,
centralizers, with `y^λ ≠ 1` because `λ` is a unit), and an element `y^c` of that subgroup lies in
`F̂₂'` only for `c = 0` (Guillot 2014, Proposition 5.17, uniqueness). *Needs:* 0.1, 0.3, 1.1.

**Checks.**

- The unit hypothesis is needed: `(0, 1)` and `(0, [x, y])` give the same `β` (both generators go
  to `1`), while `[x, y] ≠ 1` (0.2, Checks).
- The hypothesis `f, g ∈ F̂₂'` is needed: `(λ, f)` and `(λ, y^c f)` give the same `β`, and
  `y^c f ∉ F̂₂'` for `c ≠ 0` (0.3, Checks).
- For `λ` a unit the exponent is recovered from `β`: `β_{1,1} ≠ β_{−1,1}`, since `x ≠ x⁻¹` (the
  quotient `F̂₂ → ℤ/3`, `x ↦ 1`, `y ↦ 0`, separates them).

### 1.5 The topology of `Param`

Give `Param` the topology induced from `Additive zHat × F̂₂` along `p ↦ (p.lam, p.f)` (an instance
of `TopologicalSpace Param`). Prove that `Param` is compact, Hausdorff and totally disconnected,
that `(p, w) ↦ β_p(w)` is jointly continuous, and that the product of `Param` is continuous, so
that `Param` is a topological monoid. *Needs:* 0.1 (evaluation), 1.2, Tau Ceti
`continuous_zpowHat`.

**Checks.**

- The set of parameters with unit exponent is closed, since `ẑˣ = ∏ ℤ_ℓˣ` is closed in
  `∏ ℤ_ℓ`.
- It is not open: the non-units with component `ℓ` at `ℓ` and `1` elsewhere converge to `1` as
  `ℓ` grows.
- `λ ↦ (λ, 1)` is continuous, and so is `λ ↦ β_{λ,1}(x) = x^λ` (Tau Ceti `continuous_zpowHat`).

### Examples

- `(−1, 1)` is an involution of `Param` with `β_{−1,1}` the automorphism `x ↦ x⁻¹`, `y ↦ y⁻¹`.
- `(1, x)` has `β_{1,x}(x) = x` and `β_{1,x}(y) = x⁻¹ y x`: it is conjugation by `x⁻¹`, so its
  outer class is trivial, and `x ∉ F̂₂'` (4.2, Checks).

### Dependencies

Layer 0; Tau Ceti `zpowHat` and its calculus; Mathlib `TopologicalSpace.induced`.

## Layer 2: the profinite pure braid group on four strands

### 2.1 The six generators

Define `P4 := pureSubgroup 4` as a type and the six elements `a12`, `a13`, `a14`, `a23`, `a24`,
`a34` of the Conventions. Prove that each is in `pureSubgroup 4` (the squares by
`sigma_sq_mem_pureSubgroup`, the others because `pureSubgroup 4` is normal). *Needs:* Tau Ceti
`BraidGroup.sigma`, `pureSubgroup`, `sigma_sq_mem_pureSubgroup`.

**Checks.**

- `permHom` of each `x_{ij}` is `1`; the word `σ₁ σ₀ σ₁⁻¹`, with the square forgotten, maps to a
  transposition.
- `x₁₂` and `x₃₄` commute, since `σ₀ σ₂ = σ₂ σ₀`.
- `x₁₂ x₁₃ x₂₃ = (σ₀ σ₁)³`, which is central in the subgroup generated by `σ₀, σ₁`; while `x₁₂`
  and `x₂₃` do not commute (they generate a free group of rank two in `P₃`).

### 2.2 Generation

Prove `closure_artin`: the six `x_{ij}` generate `pureSubgroup 4` (Lochak–Schneps 1994, §2;
Schneps 1997, §1.1; Drinfeld 1990, (4.6)). Route: `pureSubgroup 4` is the semidirect product of
the free group on `x₁₄, x₂₄, x₃₄` by the pure braid group on the first three strands, which is in
turn generated by `x₁₂, x₁₃, x₂₃`. *Needs:* 2.1, Tau Ceti `permHom`, `permHom_surjective`,
`pureSubgroup`.

### 2.3 The completion `P̂₄`

Define `P4hat` and `toHat` as in the Conventions. Prove that `toHat` has dense image (Mathlib
`denseRange`), and that a homomorphism from
`P₄` to a profinite group extends uniquely to a continuous homomorphism from `P̂₄` (Mathlib
`lift`). *Needs:* 2.1, Mathlib `ProfiniteGrp.ProfiniteCompletion`.

**Checks.**

- The abelianization of `P₄` is free abelian on the classes of the six `x_{ij}`; reducing it
  modulo `2` shows that the six images `toHat x_{ij}` are distinct and different from `1`.
- `toHat` is a homomorphism: `toHat (x₁₂ x₁₃) = toHat x₁₂ · toHat x₁₃`.
- Two continuous homomorphisms from `P̂₄` to a finite group that agree on the six
  `toHat x_{ij}` agree (density and 2.2); three of them do not suffice: the map to `ℤ/2` reading
  the coefficient of `x₁₃` in the abelianization is trivial on `x₁₂`, `x₂₃`, `x₃₄` and not on
  `x₁₃`.

### 2.4 Relation (III)

Define `RelIII f` as relation (III) of the Conventions. *Needs:* 0.2, 2.3.

**Checks.**

- `RelIII 1` holds: both sides are `1`.
- For `f = x^a y^b`, the image of (III) in the abelianization `ẑ⁶` of `P̂₄` has coefficient `a` on
  the left and `2a` on the right at `x₁₂`, and `b` against `2b` at `x₃₄`: (III) forces the exponent
  sums of `f` to vanish, which is why it is imposed only for `f ∈ F̂₂'`.
- The relation is stated in `P̂₄`, not in `P₄`: for general `f ∈ F̂₂` only the `P̂₄` reading makes
  sense; for `f` in the image of the discrete free group, (III) in `P₄` gives (III) in `P̂₄` by
  applying `toHat`.

### Examples

- `toHat x₁₂` generates a closed procyclic subgroup of `P̂₄`, the image of `zHat.lift`.
- At `f = [x, y]`, the first term of (III) is the commutator of `x₁₂` and `x₂₃ x₂₄` in `P̂₄`.

### Dependencies

Tau Ceti braid groups; Mathlib profinite completion; Layer 0 for `subst`.

## Layer 3: Drinfeld's relations and the groups `GT̂₀ ⊇ GT̂`

### 3.1 Relations (I) and (II)

Define `RelI f` (relation (I)) and `RelII λ f` (relation (II), stated as the existence of `m ∈ ẑ`
with `2m = λ − 1` and the relation at `m`). Prove that for `λ ∈ ẑˣ` there is exactly one `m` with
`2m = λ − 1`, so that `RelII λ f` is relation (II) at `m_λ`; and that for `λ` with even `2`-adic
component no `m` exists, so `RelII λ f` fails. *Needs:* 0.2, Tau Ceti `isUnit_iff_component`.

**Checks.**

- `RelI 1` holds, `RelI x` fails (`f(y, x) f = y x ≠ 1`), and `RelI (θ(g)⁻¹ g)` holds for every
  `g`, since `θ(θ(g)⁻¹ g) θ(g)⁻¹ g = g⁻¹ θ(g) θ(g)⁻¹ g = 1` (Schneps 1997, §1.3, for the converse).
- `RelII 1 1` holds with `m = 0`, and `RelII (−1) 1` with `m = −1`: `z⁻¹ y⁻¹ x⁻¹ = (x y z)⁻¹ = 1`.
- `RelII 3 1` fails: `m = 1`, and `z y x` maps to `(132)(23)(12) = (123) ≠ 1` under
  `x ↦ (12)`, `y ↦ (23)` in `𝔖₃`.

### 3.2 `GT̂₀`

Define `CommutesUpToInner φ ψ` (there is `c ∈ F̂₂` with `φ(ψ(g)) = c ψ(φ(g)) c⁻¹` for all `g`)
and `IsGT0 p`, Guillot's conditions: `λ ∈ ẑˣ`, `f ∈ F̂₂'`, `β_{λ,f}` bijective, and `β_{λ,f}`
commuting up to inner automorphisms with `θ` and with `δ` (Guillot 2014, §5.6, definition of
`GT̂₀`). Prove that the parameters satisfying `IsGT0` are units of `Param` and form a subgroup
`GT̂₀` of `Paramˣ` (closure under the product from `beta_mul`; inverses from the existence and
uniqueness of Guillot 2014, Proposition 5.17, and 1.4), isomorphic to Guillot's coarse
Grothendieck–Teichmüller group of outer classes (Guillot 2014, Proposition 5.20).
*Needs:* 0.3, 0.4, 1.2, 1.4.

**Checks.**

- `(1, 1)` satisfies `IsGT0`.
- `c = (−1, 1)` satisfies `IsGT0`: `β_c θ = θ β_c` exactly, while `β_c δ(x) = x y` and
  `δ β_c(x) = δ(x⁻¹) = y x` differ by conjugation by `y`, so commutation holds only up to inner
  automorphisms, which the definition allows.
- `(1, [y, x])` fails `IsGT0` although `1` is a unit and `[y, x] ∈ F̂₂'`: under `x ↦ (12)`,
  `y ↦ (13)` in `𝔖₃`, `[y, x]` maps to a 3-cycle and `β_{1,[y,x]}(y) = [y, x]⁻¹ y [y, x]` maps to
  `(12)`, so the image of `β_{1,[y,x]}` lies in `⟨(12)⟩ ≠ 𝔖₃`. It satisfies (I), since
  `[x, y] [y, x] = 1`, and fails (II): the image of `[x, z] [z, y] [y, x]` in `𝔖₃` is a 3-cycle.

### 3.3 `GT̂^{mon}` and `GT̂`

Define `IsGT p` (`λ ∈ ẑˣ`, `f ∈ F̂₂'`, (I), (II), (III)), prove `isGT_one` and `IsGT.mul`
(Drinfeld 1990, §4; Schneps 1997, §1.2, Lemma 2 and its corollary), and define the submonoid
`gtMonoid` of `Param` (`GT̂^{mon}`) and `GTHat := (gtMonoid)ˣ`, the group `GT̂`. Prove
`isUnit_iff_bijective_beta`: an element of `GT̂^{mon}` is a unit if and only if `β_{λ,f}` is
bijective, and then if and only if it is surjective (Tau Ceti
`IsTopologicallyFinitelyGenerated.bijective_of_surjective`). Route for the converse: the inverse of
a bijective `β_{λ,f}` is `β_{λ⁻¹,g}` for some `g ∈ F̂₂'`, and `(λ⁻¹, g)` satisfies (I)–(III)
(Schneps 1997, §1.2, Lemma 2). *Source:* Drinfeld 1990, §4, whose profinite semigroup has
`λ ∈ 1 + 2ẑ` and no condition `f ∈ F̂₂'`; `GT̂^{mon}` as defined here (`λ ∈ ẑˣ`, `f ∈ F̂₂'`) is a
subsemigroup of it with the same group of units (Ihara 1991, §3.3; Schneps 1997, §1.1). *Needs:* 0.1
(topological finite generation of `F̂₂`), 1.2, 1.4, 2.4, 3.1, Tau Ceti
`IsTopologicallyFinitelyGenerated.bijective_of_surjective`.

**Checks.**

- `(1, 1)` is the unit of `GT̂`.
- `c = (−1, 1)` lies in `GT̂^{mon}` ((I) and (III) at `f = 1`, (II) by 3.1, Checks) and is a unit,
  with `c² = 1`.
- `(3, 1)` is not in `GT̂^{mon}`, because `3 ∉ ẑˣ` (its `3`-adic component is not a unit; the
  only integers that are units of `ẑ` are `±1`), and `(0, 1)` is not either.

### 3.4 Drinfeld's form of `GT̂₀`

Prove `isGT0_iff`: a parameter satisfies `IsGT0` if and only if `λ ∈ ẑˣ`, `f ∈ F̂₂'`, `β_{λ,f}` is
bijective, and (I) and (II) hold. The theorem is the conjunction of two statements for
`(λ, f) ∈ ẑˣ × F̂₂'` with `β_{λ,f}` bijective:

- (I) holds if and only if `β_{λ,f}` commutes with `θ` in `ContinuousOut F̂₂`;
- if moreover (I) holds, then (II) holds if and only if `β_{λ,f}` commutes with `ω` in
  `ContinuousOut F̂₂`, equivalently with `δ`, since `δ` and `ωθ` have the same outer class (0.4).

Hence Guillot's `GT̂₀` is Drinfeld's (Schneps 1997, §1.2, Theorem (i) and (ii); Guillot 2014,
Lemma 5.19). (II) alone is not equivalent to commuting with `δ`: for `β` commuting with `ω`,
commuting with `δ` is equivalent to commuting with `θ`, that is to (I). *Needs:* 0.4, 3.1, 3.2.

### 3.5 The five-term relation

Define `M(0,5)`, `K(0,5)`, the generators `x_{i,i+1}`, `ρ` and `f̃` as in the Conventions, and
`K̂(0,5)`, the profinite completion. Prove: for `(λ, f) ∈ ẑˣ × F̂₂'` with `β_{λ,f}` bijective and
satisfying (I) and (II), relation (III) in `P̂₄` holds if and only if
`ρ⁴(f̃) ρ³(f̃) ρ²(f̃) ρ(f̃) f̃ = 1` in `K̂(0,5)` (Ihara 1991, remark after (3.1.1); Schneps 1997,
§1.1, for the five-term form). The route passes through `K(0,5) ≅ P₄ / Z(P₄)` (Lochak–Schneps
1994, Proposition 2). *Needs:* 2.3, 2.4, 3.1, Mathlib `Subgroup.normalClosure`, `Subgroup.center`,
Tau Ceti `BraidGroup`, `permHom`.

**Checks.**

- `f = 1` satisfies both forms.
- `ρ` has order `5`: `ρ(x₁₂) = x₄₅`, `ρ(x₄₅) = x₂₃`, and five steps of `i ↦ i + 3` return to `i`.
- `(c f̃)⁵ = c⁵ ρ⁴(f̃) ρ³(f̃) ρ²(f̃) ρ(f̃) f̃` in `M̂(0,5)` (with `ρ(u) = c⁻¹ u c`), and `c⁵ = 1`
  there, so the five-term form says `(c f̃)⁵ = 1` (Schneps 1997, §1.2, proof of Lemma 2).

### Examples

- `GT̂` contains the subgroup `{1, c}` of order `2`.
- The parameter `(1, [x, y])` satisfies `f ∈ F̂₂'`; whether it satisfies (I) is decided by
  `[y, x] [x, y] = 1`, which holds, so (I) does not separate it from `GT̂`.

### Dependencies

Layers 0–2; Tau Ceti `IsTopologicallyFinitelyGenerated.bijective_of_surjective`, `ContinuousOut`;
Mathlib quotient groups and profinite completion.

## Layer 4: structure of `GT̂`

### 4.1 `GT̂ ⊆ GT̂₀` and the character

Prove `GTHat.isGT0`: every element of `GT̂` satisfies `IsGT0`, from 3.3 (bijectivity) and 3.4
(Schneps 1997, §1.1, where `GT̂` is defined as a subset of `GT̂₀`; Guillot 2014, remarks after
Theorem 5.21). Define the character `χ : GT̂₀ →* ẑˣ`, `(λ, f) ↦ λ` (1.3), and its restriction to
`GT̂` (Guillot 2014, Theorem 5.21, for the projection to `ẑˣ`). *Needs:* 1.3, 3.2, 3.3, 3.4.

**Checks.**

- `χ(c) = −1` and `χ(1) = 1`; since `−1 ≠ 1` in `ẑ` (the `3`-adic components differ), `c ≠ 1`.
- `χ(p q) = χ(p) χ(q)`, whatever the second components.
- The kernel of `χ` on `GT̂₀` contains every element `(1, f)`; it does not contain `c`.

### 4.2 Faithful action and outer automorphisms

Define `GTHat.betaEquiv : GTHat → ContinuousAut F̂₂`, `g ↦ β_g`, with inverse `β_{g⁻¹}`, and prove
that it is a group homomorphism. Prove `GTHat.injective_mk_betaEquiv`: two elements of `GT̂` whose
automorphisms have the same class in `ContinuousOut F̂₂` are equal; in particular `g ↦ β_g` is
injective. Route: an outer class has at most one representative `β_{λ,f}` with `f ∈ F̂₂'`
(Guillot 2014, Propositions 5.17 and 5.20, and 1.4). The same holds on `GT̂₀`. *Needs:* 1.4, 3.3,
Tau Ceti `ContinuousAut`, `ContinuousOut.mk`.

**Checks.**

- `β_c` is an involution of `F̂₂` and is not inner: it acts as `−1` on the abelianization `ẑ²`,
  where inner automorphisms act trivially.
- `β_1` is the identity of `ContinuousAut F̂₂`.
- Without the condition `f ∈ F̂₂'` the injectivity into `ContinuousOut F̂₂` fails: `β_{1,x}` is
  conjugation by `x⁻¹`, so `(1, x)` and `(1, 1)` have the same outer class.

### 4.3 Complex conjugation

`c := (−1, 1) ∈ GT̂`, `c² = 1`, `c ≠ 1`, `β_c(x) = x⁻¹`, `β_c(y) = y⁻¹`. For (II) at `c`, `m = −1`
and the relation reads `z⁻¹ y⁻¹ x⁻¹ = (x y z)⁻¹ = 1`. *Needs:* 3.1, 3.3, 4.1.

**Checks.**

- `c` is the only parameter `(λ, 1)` with `λ ≡ 3 (mod 4)` satisfying (II). For such `λ`, `m = m_λ`
  is odd and (II) at `f = 1` reads `z^m y^m x^m = 1`. Sending `x`, `y` to two reflections of the
  dihedral group of order `2N` whose product is a rotation of order `N` gives `(xy)^{−(m+1)} = 1`,
  so `m ≡ −1 (mod N)` for every `N`, i.e. `λ = −1`. For `λ ≡ 1 (mod 4)`, `m` is even, `x^m` and
  `y^m` map to `1` and `z^m` to `r^{−m}`, so (II) forces `N ∣ m` for every `N`, i.e. `m = 0`:
  `(λ, 1)` satisfies (II) exactly for `λ = ±1`.
- `(1, 1)` satisfies (II) with `λ ≡ 1 (mod 4)`, consistent with the previous Check.
- `β_c` commutes with `θ` exactly, and with `δ` only up to conjugation by `y` (3.2, Checks).

Grothendieck's working notes treat the case `f = 1` of relation (II) as an exercise (Montpellier
fonds, folder 145, p. 35, https://grothendieck.umontpellier.fr/145.pdf).

### 4.4 Finite quotients

For a finite group `G`, `GT̂₀` acts on the set of continuous surjections `F̂₂ → G` modulo `Aut(G)`,
by `φ ↦ φ ∘ β_p⁻¹`; the action of `p` sends a class with `(x, y) ↦ (a, b)` to one with
`x ↦ a^{χ(p)⁻¹}` (Guillot 2014, §5.3). *Needs:* 4.1, 4.2.

**Checks.**

- The unit acts trivially.
- `c` sends the class of `(a, b)` to the class of `(a⁻¹, b⁻¹)`.
- For `G = ℤ/n` and `φ(x) = 1`, `φ(y) = 0`, the action of `p` sends `φ` to `x ↦ χ(p)⁻¹ mod n`.

### 4.5 Topology

Prove `isClosed_setOf_isGT`: `GT̂^{mon}` is closed in `Param` (each of the five conditions is
closed: 1.5 for `λ ∈ ẑˣ`, 0.3 for `F̂₂'`, continuity of substitution for (I)–(III), and compactness
of `ẑ` for the existential in (II)). Hence `GT̂^{mon}` is compact and profinite. `GT̂₀` is closed
in `Param`, since bijectivity of `β_p` is, by 3.3, surjectivity, and surjectivity is the
intersection over the finite quotients `F̂₂ → G` of the clopen conditions « `β_p(x)` and `β_p(y)`
generate `G` ». `GT̂` carries the topology of the units of `GT̂^{mon}` (Mathlib
`Units.instTopologicalSpaceUnits`, induced from `M × Mᵐᵒᵖ`), so its compactness is the closedness
of `{(u, v) : u v = v u = 1}` in `GT̂^{mon} × GT̂^{mon}`, from the continuity of the product (1.5)
and Hausdorffness. Then `χ` is continuous. *Source:* `GT̂` as a profinite group of automorphisms
of `F̂₂`: Lochak–Schneps 1994, §1; Harbater–Schneps 2000, §0. Prove `GTHat.isClosedEmbedding_betaEquiv`: for the topology of the units of
`GT̂^{mon}` and Tau Ceti's congruence topology, `g ↦ β_g` is a closed embedding of `GT̂` into
`ContinuousAut F̂₂`, and its composite with `ContinuousOut.mk` is a homeomorphism onto a closed
subgroup of `ContinuousOut F̂₂`. The action of 4.4 on surjections to a finite group factors through
a finite quotient of `GT̂₀`. *Needs:* 0.1, 1.5, 3.3, 4.2, Tau Ceti `congruenceTopology`,
`ContinuousAut.compactSpace`, `ContinuousAut.t2Space`.

**Checks.**

- The parameters `(λ, 1)` with `λ ∈ ẑˣ` form a closed subset of `Param`; its intersection with
  `GT̂^{mon}` is `{(1, 1), (−1, 1)}` (4.3, Checks).
- `g ↦ β_g` is continuous into the congruence topology: the action of `β_g` on a characteristic
  finite quotient `F̂₂/N` depends only on `λ` modulo the exponent of `F̂₂/N` and on `f` modulo `N`.
- `ContinuousAut F̂₂` is Hausdorff (Tau Ceti `ContinuousAut.t2Space`, with 0.1), so a continuous
  injection from the compact space `GT̂` is a closed embedding.

### Examples

- `{1, c}` is a closed subgroup of `GT̂` and its image in `ContinuousOut F̂₂` has order `2`.
- `χ` maps `{1, c}` isomorphically onto `{±1} ⊆ ẑˣ`.

### Dependencies

Layers 0–3; Tau Ceti `ContinuousAut`, `ContinuousOut`, the congruence topology and its
compactness for topologically finitely generated groups.

## Downstream consumers

The successor of [BelyiMaps](../BelyiMaps/README.md) Layer 12, `BelyiArithmeticActions`, consumes
`GT̂`, `β`, `χ` and the injection `GT̂ → ContinuousOut F̂₂` to state the homomorphism
`Gal(ℚ̄/ℚ) → GT̂` and its injectivity, with the tangential base points of
InverseGaloisAndArithmeticFundamentalGroups §IG.1.2; relation (III) in `P̂₄` and its five-term
form in `K̂(0,5)` are what that successor compares with the fundamental groups of the
configuration spaces of InverseGaloisAndArithmeticFundamentalGroups §IG.5.1.

## References

- V. G. Drinfel'd, « On quasitriangular quasi-Hopf algebras and on a group that is closely
  connected with Gal(ℚ̄/ℚ) », *Leningrad Math. J.* 2 (1991), no. 4, 829–860; Russian original
  *Algebra i Analiz* 2 (1990), no. 4, 149–181. Zbl 0728.16021, Zbl 0718.16034.
- Y. Ihara, « Braids, Galois groups, and some arithmetic functions », *Proc. ICM Kyoto 1990*,
  vol. I (1991), 99–120. Zbl 0757.20007.
- Y. Ihara, « On the embedding of Gal(ℚ̄/ℚ) into GT̂ », in L. Schneps (ed.), *The Grothendieck
  theory of dessins d'enfants*, LMS Lecture Note Ser. 200 (1994), 289–321. Zbl 0849.12005.
- P. Lochak, L. Schneps, « The Grothendieck–Teichmüller group and automorphisms of braid groups »,
  ibid., 323–358. Zbl 0827.20050.
- L. Schneps, « The Grothendieck–Teichmüller group GT̂: a survey », in L. Schneps, P. Lochak (eds.),
  *Geometric Galois Actions* 1, LMS Lecture Note Ser. 242 (1997), 183–203. Zbl 0910.20019.
- P. Guillot, « An elementary approach to dessins d'enfants and the Grothendieck–Teichmüller
  group », *Enseign. Math.* (2) 60 (2014), 293–375. Zbl 1364.11126; arXiv:1309.1968.
- L. Ribes, P. Zalesskii, *Profinite Groups*, 2nd ed., Ergebnisse der Mathematik (3) 40,
  Springer, 2010, §9.1 (free pro-𝒞 products). Uncertified: paywalled book, cited by locator.
- W. N. Herfort, L. Ribes, « Torsion elements and centralizers in free products of profinite
  groups », *J. reine angew. Math.* 358 (1985), 155–161. Zbl 0549.20017.
- G. V. Belyĭ, « On Galois extensions of a maximal cyclotomic field », *Izv. Akad. Nauk SSSR Ser.
  Mat.* 43 (1979), 267–276. Zbl 0409.12012.
- D. Harbater, L. Schneps, « Fundamental groups of moduli and the Grothendieck–Teichmüller
  group », *Trans. Amer. Math. Soc.* 352 (2000), no. 7, 3117–3148. Zbl 0956.14013.
- Y. Hoshi, A. Minamide, S. Mochizuki, « Group-theoreticity of numerical invariants and
  distinguished subgroups of configuration space groups », *Kodai Math. J.* 45 (2022), no. 3,
  295–348. Zbl 1511.14050.
