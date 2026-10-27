# Roadmap: the profinite Grothendieck–Teichmüller group

**Summary.** Build Drinfeld's profinite Grothendieck–Teichmüller group `GT̂` on Tau Ceti's free
profinite group `F̂₂` and profinite integers `ẑ`: the substitution calculus `f ↦ f(a, b)` of
pro-words in two variables, the monoid of parameters `(λ, f) ∈ ẑ × F̂₂` acting on `F̂₂` by
`x ↦ x^λ`, `y ↦ f⁻¹ y^λ f`, Drinfeld's relations (I) and (II) in `F̂₂` and the pentagon relation
(III) in the profinite pure braid group `P̂₄`, the groups `GT̂ ⊆ GT̂₀` with their character
`GT̂ → ẑˣ`, their faithful action on `F̂₂`, and their injection into `ContinuousOut F̂₂`. The
homomorphism `Gal(ℚ̄/ℚ) → GT̂` and Ihara's question whether it is an isomorphism are recorded at
the end as a roadmap for a roadmap: they need the arithmetic layers of BelyiMaps, which are not
built yet.

The group is named after the programme of Grothendieck's *Esquisse d'un programme* (1984,
printed 1997); his working notes treat the same subject (Montpellier fonds, folders 119, 142,
145, 147). The statements specified here are the refereed ones of Drinfeld 1990, Ihara 1991 and
1994, Lochak–Schneps 1994, Schneps 1997 and Guillot 2014.

Suggested home: `TauCeti/Topology/Algebra/Group/Profinite/GrothendieckTeichmuller/`, beside
Tau Ceti's `Profinite/Free/` and `ContinuousAut/`.

## Scope and ownership

**In scope.** Everything is a statement about the free profinite group on two generators, about
the profinite completion of the pure braid group on four strands, or about pairs
`(λ, f) ∈ ẑ × F̂₂`. This roadmap owns:

- the substitution of elements of a profinite group into a pro-word of `F̂₂` and its calculus
  (Layer 0);
- the closed commutator subgroup `F̂₂'` of `F̂₂` and its description as the kernel of the
  abelianization `F̂₂ → ẑ²` (Layer 0);
- the monoid of parameters `ẑ × F̂₂` and the homomorphism `(λ, f) ↦ β_{λ,f}` to continuous
  endomorphisms of `F̂₂` (Layer 1);
- the Artin generators of the pure braid group `P₄`, its profinite completion `P̂₄` and the
  elements `x_{ij}` there (Layer 2);
- Drinfeld's relations (I), (II), (III), the monoid `GT̂^{mon}`, the groups `GT̂₀` and `GT̂`, the
  character `χ : GT̂₀ → ẑˣ`, the actions on `F̂₂` and the injections into `ContinuousAut F̂₂` and
  `ContinuousOut F̂₂` (Layers 3 and 4).

**Out of scope, with owner.**

- *The free profinite group, its universal property, `ẑ` as a topological ring, the power
  `x ^ᶻ a`, `ContinuousAut` and `ContinuousOut`*: Tau Ceti, from the completed roadmaps
  ProfiniteProPGroups and [ProfiniteArithmetic](../ProfiniteArithmetic/README.md). Consumed by
  name; no second carrier is built.
- *The Artin braid group `B_n`, its generators `σ_i` and the pure braid subgroup*: Tau Ceti
  (`TauCeti.BraidGroup`, `TauCeti.BraidGroup.sigma`, `TauCeti.BraidGroup.pureSubgroup`).
- *The thrice-punctured line, its profinite fundamental group, the arithmetic exact sequence and
  the outer Galois action*: [BelyiMaps](../BelyiMaps/README.md) Layer 12 and its successor
  `BelyiArithmeticActions`. BelyiMaps excludes Grothendieck–Teichmüller theory explicitly; this
  roadmap takes it up and consumes nothing of BelyiMaps until the last section.
- *Tangential base points and tame tangential fibres*: the InverseGaloisAndArithmeticFundamentalGroups
  roadmap (§IG.1.2). Used only in the last section.
- *The pro-unipotent and graded versions `GT(k)`, `GRT(k)`, the Lie algebra `𝔤𝔯𝔱` and the
  Deligne–Drinfeld conjecture*: not in this roadmap, and not owned by any roadmap at present.

The boundary in one sentence: if a statement is about pro-words in two variables, about `P̂₄`,
or about pairs `(λ, f)`, it is here; if it mentions a Galois group or a curve, it is in BelyiMaps
or its successors.

## What Mathlib and Tau Ceti already have (consume)

- **Free profinite groups.** `TauCeti.freeProfiniteGroup X : ProfiniteGrp` (Mathlib's
  `ProfiniteGrp.ProfiniteCompletion.completion` of `FreeGroup X`), `freeProfiniteGroup.of`,
  `lift`, `lift_of`, `lift_unique`, `hom_ext`, `map`, `existsUnique_continuousMulEquiv`
  (`TauCeti/Topology/Algebra/Group/Profinite/Free/Basic.lean`); its abelianization
  (`…/Free/Abelianization.lean`), rank and Hopf property (`…/Profinite/Hopfian.lean`).
- **Profinite integers and powers.** `TauCeti.zHat`, the ring structure on `Additive zHat`
  (`…/ZHat/Ring.lean`), the unit criterion and `ẑˣ ≃ ∏ ℤ_ℓˣ` (`…/ZHat/Units.lean`),
  `TauCeti.zpowHat` with notation `x ^ᶻ a` and its calculus: `zpowHat_mul`, `map_zpowHat`,
  `conj_zpowHat`, `zpowHat_intCast`, `continuous_zpowHat` (`…/ZHat/Pow.lean`).
- **Automorphisms.** `TauCeti.ContinuousAut G = (G ≃ₜ* G)`, `ContinuousAut.conj`,
  `TauCeti.ContinuousOut G`, the congruence topology and profiniteness for topologically finitely
  generated `G` (`TauCeti/Topology/Algebra/Group/ContinuousAut/`).
- **Braids.** `TauCeti.BraidGroup n` (the Artin group of type `A_{n−1}`), `sigma`, `lift`,
  `permHom`, `pureSubgroup n = ker permHom`, `sigma_sq_mem_pureSubgroup`, `permHom_surjective`
  (`TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean`).
- **Mathlib.** `ProfiniteGrp`, `ProfiniteGrp.ProfiniteCompletion.completion`, `eta`, `lift`,
  `denseRange`; `commutator`, `Subgroup.topologicalClosure`; `ContinuousMonoidHom`; `Units` of a
  monoid.

## Conventions (pinned)

- `F̂₂ := TauCeti.freeProfiniteGroup (Fin 2)` in universe `0`; `x := of 0`, `y := of 1`,
  `z := (x y)⁻¹`, so `x y z = 1`.
- `ẑ := Additive TauCeti.zHat.{0}` with Tau Ceti's ring structure; powers are `g ^ᶻ a`.
- **Substitution.** For `f ∈ F̂₂` and `a, b` in a profinite group `P` (universe `0`),
  `f(a, b) := freeProfiniteGroup.lift ![a, b] f`. In particular `f(x, y) = f`.
- **The action of a parameter.** For `(λ, f) ∈ ẑ × F̂₂`, `β_{λ,f} : F̂₂ →ₜ* F̂₂` is the continuous
  endomorphism with `β_{λ,f}(x) = x^λ` and `β_{λ,f}(y) = f⁻¹ y^λ f`. This is the convention of
  Guillot 2014, Proposition 5.17 (with `σ = x`, `α = y`) and of Ihara's papers.
- **The product of parameters** is the one that makes `(λ, f) ↦ β_{λ,f}` multiplicative:
  `(λ, f) · (μ, g) := (λμ, f · β_{λ,f}(g))`, with unit `(1, 1)`. Then
  `β_{(λ,f)·(μ,g)} = β_{λ,f} ∘ β_{μ,g}`.
- **Half of `λ − 1`.** For `λ ∈ ẑˣ`, `m_λ` is the unique `m ∈ ẑ` with `2m = λ − 1`. It exists
  because the `2`-adic component of a unit is odd, and is unique because `2` is a non-zero-divisor
  of `ẑ`.
- **Artin generators.** With Tau Ceti's 0-indexed `σ₀, σ₁, σ₂` of `B₄` (`σ_k` crosses strands
  `k` and `k + 1`), and strands numbered `1, …, 4` in prose:
  `x₁₂ = σ₀²`, `x₂₃ = σ₁²`, `x₃₄ = σ₂²`, `x₁₃ = σ₁ σ₀² σ₁⁻¹`, `x₂₄ = σ₂ σ₁² σ₂⁻¹`,
  `x₁₄ = σ₂ σ₁ σ₀² σ₁⁻¹ σ₂⁻¹`, i.e. `x_{ij} = σ_{j−1} ⋯ σ_{i+1} σ_i² σ_{i+1}⁻¹ ⋯ σ_{j−1}⁻¹` in the
  1-indexed notation of Birman's book. All six lie in `pureSubgroup 4`.
- `P̂₄ := ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of (pureSubgroup 4))`, and `x_{ij}`
  also denotes the image of `x_{ij}` under `eta`.
- **Drinfeld's relations**, for `(λ, f) ∈ ẑˣ × F̂₂'`:
  - (I) `f(y, x) · f = 1`;
  - (II) `f(z, x) z^{m_λ} f(y, z) y^{m_λ} f x^{m_λ} = 1`;
  - (III) in `P̂₄`:
    `f(x₁₂, x₂₃x₂₄) f(x₁₃x₂₃, x₃₄) = f(x₂₃, x₃₄) f(x₁₂x₁₃, x₂₄x₃₄) f(x₁₂, x₂₃)`.

  These are relations (I), (II) and the pentagon relation of Drinfeld 1990 in the profinite
  setting, as restated in Ihara 1991 and Schneps 1997. Relation (III) is pinned in Drinfeld's
  `P̂₄` form; the five-term form in `π̂₁(M_{0,5})` is a theorem of Layer 3, not an alternative
  definition.

## The build, in layers

### Layer 0: pro-words in two variables

**0.1 Substitution.** Define `subst f a b = f(a, b)` for `P` profinite. API: `subst_x_y`
(`f(x, y) = f`), `subst_of_zero`/`subst_of_one` (`x(a, b) = a`, `y(a, b) = b`), `subst_mul`,
`subst_inv`, `subst_one`, `subst_zpowHat` (`(g^c)(a, b) = g(a, b)^c`), `map_subst` (for
`φ : P →ₜ* Q`, `φ (f(a, b)) = f(φ a, φ b)`), `subst_subst`
(`f(g(a, b), h(a, b)) = (f(g, h))(a, b)`), `continuous_subst` (jointly in `(f, a, b)`), and
`subst_eq_of_dense` (two continuous homomorphisms agreeing on `x, y` agree). *Needs:* Tau Ceti
`freeProfiniteGroup.lift`, `lift_unique`, `hom_ext`, `map_zpowHat`.

**0.2 The closed commutator subgroup.** `F̂₂' := (commutator F̂₂).topologicalClosure`. Prove it
is the kernel of the continuous abelianization `F̂₂ → ẑ × ẑ`, `x ↦ (1, 0)`, `y ↦ (0, 1)`
(Tau Ceti `…/Free/Abelianization.lean`), that it is closed, normal and topologically
characteristic, and that `subst f a b ∈ P'‾` for `f ∈ F̂₂'`. *Checks:* `x ∉ F̂₂'`; `x y x⁻¹ y⁻¹ ∈ F̂₂'`;
`x^a y^b ∈ F̂₂'` only for `a = b = 0`.

**0.3 Three automorphisms.** `θ` (`x ↦ y`, `y ↦ x`), `ω` (`x ↦ y`, `y ↦ z`) and Guillot's `δ`
(`x ↦ x⁻¹ y⁻¹`, `y ↦ y`) as elements of `ContinuousAut F̂₂`, with `θ² = 1`, `ω³ = 1`, and `δ²`
inner (conjugation by `y`). *Needs:* 0.1, Tau Ceti `existsUnique_continuousMulEquiv`.

### Layer 1: parameters and their action

**1.1 The endomorphism `β_{λ,f}`.** Definition by `lift`; `beta_x`, `beta_y`, `beta_one_one`
(`β_{1,1} = id`), `beta_z` (`β_{λ,f}(z) = (x^λ f⁻¹ y^λ f)⁻¹`), `beta_subst`
(`β_{λ,f}(g) = g(x^λ, f⁻¹ y^λ f)`).

**1.2 The monoid.** `Param := ẑ × F̂₂` as a structure with the product of the conventions;
`Monoid Param`; `beta_mul : β_{p·q} = β_p ∘ β_q`; `Param.toEnd : Param →* (F̂₂ →ₜ* F̂₂)` (monoid
of continuous endomorphisms under composition). *Needs:* 1.1, `zpowHat_mul`, `conj_zpowHat`,
`map_zpowHat`.

**1.3 The character.** `Param.lam : Param →* ẑ` (multiplicative monoid of `ẑ`), and its
restriction to parameters with `λ ∈ ẑˣ`.

**1.4 Uniqueness of `f`.** If `β_{λ,f} = β_{λ,g}` with `f, g ∈ F̂₂'`, then `f = g`. The proof uses
that the centralizers of `x` and of `y` in `F̂₂` are the closed procyclic subgroups `⟨x⟩‾` and
`⟨y⟩‾` (used in Guillot 2014, proof of Proposition 5.17; a consequence of the centralizer theorem
for free profinite products of Herfort–Ribes 1985 applied to `F̂₂ = ẑ ∐ ẑ`), which is itself a
target here, with the statement used pinned in its docstring. Also: if `β_{λ,f} = β_{μ,g}`
then `λ = μ`, because `⟨x⟩‾ ≅ ẑ`. *Checks:* `(λ, f)` and `(λ, f·y^c)` with `c ≠ 0` give the same
`β` but `f y^c ∉ F̂₂'` when `f ∈ F̂₂'`.

### Layer 2: the profinite pure braid group on four strands

**2.1 Artin generators.** The six `x_{ij}` of the conventions, as elements of
`pureSubgroup 4`, with membership proved from `sigma_sq_mem_pureSubgroup` and normality.
*Checks:* `permHom` of each `x_{ij}` is `1`; `x₁₂` and `x₃₄` commute; `x₁₂` and `x₂₃` do not.

**2.2 Generation.** The six `x_{ij}` generate `pureSubgroup 4` (Artin; Birman's book, Lemma 1.8.2).

**2.3 `P̂₄`.** The completion, `eta`, density of the image of `P₄` (Mathlib `denseRange`), and
the universal property used to define maps out of `P̂₄`.

**2.4 Relation (III).** The predicate `RelIII f` of the conventions. *Check:* `RelIII 1` holds.

### Layer 3: Drinfeld's relations and the groups `GT̂₀ ⊇ GT̂`

**3.1 The predicates.** `RelI f`, `RelII λ f` (with `m_λ`), `RelIII f`; `existsUnique_two_mul_eq_sub_one`
for units of `ẑ`.

**3.2 `GT̂₀`.** Guillot's group: the parameters `(λ, f)` with `λ ∈ ẑˣ`, `f ∈ F̂₂'`, `β_{λ,f}`
bijective, and `β_{λ,f}` commuting with `θ` and with `δ` in `ContinuousOut F̂₂`. Prove that they
form a subgroup of `Paramˣ` (closure under the product from `beta_mul`; inverses from the
uniqueness of Layer 1.4 and the existence statement of Guillot 2014, Proposition 5.17). *Source:*
Guillot 2014, §5.6, definition of `GT̂₀` and Proposition 5.20.

**3.3 `GT̂`.** The set of `(λ, f)` with `λ ∈ ẑˣ`, `f ∈ F̂₂'`, (I), (II), (III) is a submonoid
`GT̂^{mon}` of `Param`; `GT̂ := (GT̂^{mon})ˣ`. Theorem: a parameter of `GT̂^{mon}` is a unit if and only
if `β_{λ,f}` is bijective (the Hopf property of `F̂₂`, Tau Ceti `…/Profinite/Hopfian.lean`, gives
that a surjective `β` is bijective). *Source:* Drinfeld 1990, where `GT̂` is the group of
invertible elements of the semigroup `GT̂^{mon}`; Schneps 1997, §1.

**3.4 Drinfeld's form of `GT̂₀`.** For `(λ, f) ∈ ẑˣ × F̂₂'` with `β_{λ,f}` bijective: (I) holds iff
`β_{λ,f}` commutes with `θ` in `ContinuousOut F̂₂`, and (II) holds iff it commutes with `δ`. Hence
`GT̂₀` is the group of bijective parameters satisfying (I) and (II), and `GT̂ ≤ GT̂₀`. *Source:*
Guillot 2014, Lemma 5.19, citing Schneps 1997, §1.2.

**3.5 The five-term pentagon.** (III) is equivalent, for `f` satisfying (I) and (II), to the
five-term relation `f(x₁₂, x₂₃) f(x₃₄, x₄₅) f(x₅₁, x₁₂) f(x₂₃, x₃₄) f(x₄₅, x₅₁) = 1` in the
profinite completion of the pure mapping class group of the sphere with five marked points,
`K(0,5) := P₄ / Z(P₄)`, with `x_{i5}` defined from the `x_{ij}` by the sphere relations. *Source:*
Ihara 1991; Schneps 1997, §1. The presentation of `K(0,5)` used is pinned in the docstring
from one of these sources before the theorem is stated.

### Layer 4: structure of `GT̂`

**4.1 Inclusions and character.** `GT̂ ≤ GT̂₀` as subgroups of `Paramˣ`;
`χ : GT̂₀ →* ẑˣ`, `(λ, f) ↦ λ`.

**4.2 Faithful action.** `GT̂₀ →* ContinuousAut F̂₂`, `p ↦ β_p`, is injective (Layer 1.4). Composed
with `ContinuousOut.mk`, it is still injective (Guillot 2014, Propositions 5.17 and 5.20: an outer
class has at most one representative of the form `β_{λ,f}` with `f ∈ F̂₂'`).

**4.3 Examples.** `(1, 1)` is the unit; `c := (−1, 1) ∈ GT̂`, `c² = 1`, `c ≠ 1`, and
`β_c(x) = x⁻¹`, `β_c(y) = y⁻¹`. For (II) at `c`: `m = −1` and the relation reads
`z⁻¹ y⁻¹ x⁻¹ = (x y z)⁻¹ = 1`.

  *Check:* `c` is the only parameter `(λ, 1)` with `λ ≡ 3 (mod 4)` satisfying (II). For such `λ`,
  `m = m_λ` is odd and (II) at `f = 1` reads `z^m y^m x^m = 1`. Sending `x`, `y` to two reflections
  of the dihedral group of order `2N` whose product is a rotation of order `N` gives
  `(xy)^{−(m+1)} = 1`, so `m ≡ −1 (mod N)` for every `N`, i.e. `λ = −1`. (Units `λ ≡ 1 (mod 4)`
  are not covered: `m` is even and the dihedral quotient says nothing.)

**4.4 Finite quotients.** For a finite group `G`, `GT̂₀` acts on the set of continuous surjections
`F̂₂ → G` modulo `Aut(G)`, by precomposition with `β_p⁻¹`; the action of `p` sends a class with
`(x, y) ↦ (a, b)` to one with `x ↦` a conjugate of `a^{χ(p)⁻¹}`. *Source:* Guillot 2014, §5, where
`GT̂₀` is described through such finite quotients.

## Ordering

Layers 0 and 2 are independent and can start at once. Layer 1 needs 0; Layer 3 needs 1 and 2;
Layer 4 needs 3. Within Layer 3, 3.4 and 3.5 are the hardest and come last.

## Roadmap for a roadmap: the Galois action and Ihara's question

**Do not implement this section.** It records what a successor roadmap would specify once
BelyiMaps' arithmetic layers exist.

Fix the tangential base point `01→` on `ℙ¹_ℚ ∖ {0, 1, ∞}`. Ihara (1994) constructs a homomorphism
`Gal(ℚ̄/ℚ) → GT̂`, `σ ↦ (χ_cyc(σ), f_σ)`, where `f_σ` is the image under `σ` of the path from `01→`
to `10→`, and `x`, `y` are the standard loops around `0` and `1`; composition with `χ` is the
cyclotomic character. It is injective by Belyi's theorem (Belyi 1979). Guillot 2014, Theorem 5.21,
gives an elementary proof of the weaker statement with `GT̂₀` in place of `GT̂`.

- **Ihara's question** (Ihara 1991): is `Gal(ℚ̄/ℚ) → GT̂` an isomorphism? It is open; so is the
  same question for `GT̂₀`.
- **`GT̂` as outer automorphisms of `π̂₁(M_{0,n})`** (Harbater–Schneps 2000, main theorem): for
  `n ≥ 5`, `GT̂` is isomorphic to the group `Out♯_n` of outer automorphisms of `π̂₁(M_{0,n})` that
  preserve the conjugacy classes of the inertia subgroups and commute with the outer automorphisms
  induced by permuting the marked points. For `n = 5`, `π̂₁(M_{0,5})` is the profinite completion
  of Layer 3.5's `K(0,5)`; stating the isomorphism needs the inertia subgroups and the `𝔖₅`-action
  there, which no roadmap owns yet.
- **The `𝔖ₙ`-action at `n = 4`: equivariant units of `M_{0,4}`.** `M_{0,4} ≅ U_{0,3} = ℙ¹ ∖ {0, 1, ∞}`
  with coordinate `λ`; the stabiliser `𝔖₃` of the fourth marked point permutes `0, 1, ∞` and acts
  on `O(U_{0,3})^* = k^* · λ^ℤ (1 − λ)^ℤ` through the six anharmonic substitutions, and `𝔖₄` acts
  through `𝔖₄/V₄ ≅ 𝔖₃`. Two small cases of the successor's equivariant Picard groups are checked:
  - for a domain `k`, `H¹(𝔖₃, O(U_{0,3})^*) ≅ ℤ/6` if `2 ≠ 0` in `k`, and `≅ ℤ/3` if `2 = 0`,
    generated by the class of the tangent cocycle `g ↦ g′(λ)`;
  - the cocycle `g ↦ sgn(g) · g′(λ)` of `L = L₁ ⊗ L₂ ⊗ L₃ ⊗ L₄` (`L_i` the line bundle attached
    to the `i`-th marked point) has order exactly `3`: its cube is the coboundary of
    `λ²(1 − λ)²`, and over a field with `3 ≠ 0` containing a root of `ζ² − ζ + 1`, its `m`-th
    power is the coboundary of a nowhere-zero function on `U_{0,3}` only if `3 ∣ m`.

  Both are proved in Lean outside Tau Ceti (see Provenance): the first on the model
  `k^* × Ker(ℤ³ → ℤ)` of the units with the anharmonic action, the second as identities of
  functions on `U_{0,3}(K)`. A successor states them on `M_{0,4}` itself, which needs what they
  leave out: that the model is the unit group of `k[λ, 1/λ, 1/(1 − λ)]`; the identification of
  the `𝔖₃`-equivariant Picard group of `U_{0,3}` with `H¹(𝔖₃, O(U_{0,3})^*)` (`Pic(U_{0,3}) = 0`
  and the Hochschild–Serre sequence); and the passage from the bundles `L_i` under `𝔖₄` to these
  cocycles, with the injectivity of inflation from `𝔖₃` to `𝔖₄`.
- **The `𝔖ₙ`-action for all `n`: trivialising exponents.** In a homogeneous model (`n` vectors of
  `K²` up to `GL₂` and scalars, a function trivialises `L^{⊗m}` when it has the weights of `L^{⊗m}`
  and is invariant under relabelling), `L^{⊗m}` is `𝔖ₙ`-equivariantly trivial iff `(n − 1) ∣ m`,
  over a field with a primitive `(n − 1)`-th root of unity; `Lₙ^{⊗m}` is trivial under the
  stabiliser `𝔖ₙ₋₁` of the `n`-th point iff `(n − 1)(n − 2) ∣ m`, with primitive roots of orders
  `n − 1` and `n − 2`. Products of `2 × 2` determinants give the upper bounds; the lower bounds come
  from the configurations `{0} ∪ μ_{n−1}` and `{0, ∞} ∪ μ_{n−2}`, which a rotation renumbers while
  turning the fibre at `0` by a primitive root of unity. For `n = 4, 5, 6` the homogeneous model and
  the cocycles on normalised configurations give the same condition. A successor would need the
  identification of the model with `Pic` of `[M_{0,n}/𝔖ₙ]` and `[M_{0,n}/𝔖ₙ₋₁]` for general `n`.
  For `n = 2g + 2` the group `Pic[M_{0,n}/𝔖ₙ₋₁] ≅ ℤ/(n − 1)(n − 2)` is Edidin–Hu, Theorem 1.3; the
  odd case was not found in print.
- **What is missing.** The profinite comparison `π₁^{geo}(ℙ¹ ∖ {0,1,∞}) ≃ F̂₂` with the standard
  loops (BelyiMaps 12.6, successor `BelyiArithmeticActions`); the tangential fibre at `01→` and the
  lift of the outer action to an action (InverseGaloisAndArithmeticFundamentalGroups §IG.1.2);
  for (III), the fundamental group of `M_{0,5}` with its tangential base points, which no roadmap
  owns. Once these exist, the successor states `galoisToGT : Gal(ℚ̄/ℚ) →* GT̂`, its injectivity, and
  `def IharaQuestion : Prop := Function.Surjective galoisToGT`.

## References

All checked on zbMATH (identifiers given) or arXiv.

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
- A. Grothendieck, « Esquisse d'un programme », ibid., 5–48 (English translation 243–283).
  Zbl 0901.14001.
- P. Guillot, « An elementary approach to dessins d'enfants and the Grothendieck–Teichmüller
  group », *Enseign. Math.* (2) 60 (2014), 293–375. Zbl 1364.11126; arXiv:1309.1968.
- W. N. Herfort, L. Ribes, « Torsion elements and centralizers in free products of profinite
  groups », *J. reine angew. Math.* 358 (1985), 155–161. Zbl 0549.20017.
- G. V. Belyĭ, « On Galois extensions of a maximal cyclotomic field », *Izv. Akad. Nauk SSSR Ser.
  Mat.* 43 (1979), 267–276. Zbl 0409.12012.
- A. Minamide, H. Nakamura, « The automorphism groups of the profinite braid groups », *Amer. J.
  Math.* 144 (2022), no. 5, 1159–1176. Zbl 1554.20077; arXiv:1904.06749 (`Aut(B̂_n)`, `n ≥ 4`,
  in terms of `GT̂`; context for Layer 2).
- D. Edidin, Z. Hu, « The integral Chow rings of the stacks of hyperelliptic Weierstrass
  points », *Michigan Math. J.* (2025), arXiv:2208.00556, Theorem 1.3.
- D. Harbater, L. Schneps, « Fundamental groups of moduli and the Grothendieck–Teichmüller
  group », *Trans. Amer. Math. Soc.* 352 (2000), no. 7, 3117–3148. Zbl 0956.14013.

## Provenance

Grothendieck's notes contain the « relation des lacets » for automorphisms of the profinite
fundamental group of the thrice-punctured sphere (Montpellier fonds, folder 142, [from 1978]),
and an exercise on relation (II) at `f = 1` (folder 145, p. 35: in the free profinite group on
`l₀, l₁` with `l_∞ l₁ l₀ = 1`, a unit `p` with `l_∞^p l₁^p l₀^p = 1` is `1`; with `x = l₀⁻¹`,
`y = l₁⁻¹`, this is (II) for `(1 − 2p, 1)`). The Lean appendix of the transcription project
(github.com/Commutator-IO/grothendieck-project, `lean/Grothendieck/Folder145.lean`, `rel14_iff`)
proves it for every odd `p ∈ ẑ`, read in all finite quotients: under `z y x = 1`, `z^p y^p x^p = 1`
holds in every finite group iff `p = 1`. It is the cited source for the Check of Layer 4.3, not a
specification.

The equivariant units of `M_{0,4}` appear in folder 140-1, pp. 22 and 24, where the
`𝔖₃`-equivariant Picard group of `U_{0,3}` is stated to be `ℤ/6` (`ℤ/3` in characteristic `2`),
generated by `O(1)`, and in folder 146, p. 70, a table of the smallest exponents that trivialise
`L` and the `L_i` compatibly with the symmetric group on `M_{0,n}`, with `3` for `L` at `n = 4`.
The same Lean appendix proves the two `n = 4` statements of the last section
(`lean/Grothendieck/Folder140_1.lean`, `H1_units`, `H1_units_char_two`;
`lean/Grothendieck/Folder146.lean`, `derL_pow_three`, `coboundary_derL_iff`). The units model,
the lower bound by the tangent class and the formula `sgn(g) · g′(λ)` for `L` are the appendix's,
not the pages'. The general formulas are also the appendix's (`trivL_iff`, `trivLi_iff`; for
`n = 5, 6`, `trivL_five_iff`, `trivLi_five_iff`, `trivL_six_iff`, `trivLi_six_iff` match them with
the normalised cocycles): the page's table gives `3` and `6` at `n = 4` and only queried values for
`n = 5, 6` (« 12 ? », « 20 ? », « 60 ? »), of which `12` for `Lₙ` at `n = 5` is right, and `20`
and `60` at `n = 6` should be `5` and `20`.

Two more folders bear on the geometry behind relations (II) and (III). They are cited for
orientation only; nothing in them is specified here. Folder 147, *Structure à l'infini des
M_{g,ν}*, is undated; the transcription project places it in the winter of 1982–83, because its
formalism is the one Grothendieck describes to Illusie on 25 January 1983. It describes the
Deligne–Mumford boundary by stable graphs, lists the strata of modular dimension `≤ 2` with four
elementary cases (`M_{0,4}`, `M_{1,1}`, `M_{0,5}`, `M_{1,2}`), and says on its p. 29 that a more or
less complete understanding of the discrete `π₁` in these cases should give the key to the
general case. That is the two-level principle, a year before the *Esquisse d'un programme*.
Folder 144, *Teichmülleries* (1981–83), lists the two-generator presentations of the braid group
`B₃` (June 1983). Its 1982 « Rétrospection sur les cartes cellulaires » identifies the groups that
classify maps on surfaces with orbifold fundamental groups, going back over the Montpellier notes
of C. Voisin and J. Malgoire, *Cartes cellulaires*, Cahiers mathématiques de Montpellier 12
(1977).
