# Roadmap: perfectoid rings and spaces

**Summary.** Perfectoid spaces are the adic spaces on which Frobenius can be inverted: locally they
are adic spectra of perfectoid Tate rings, complete uniform Tate rings with a pseudouniformiser `ϖ`
such that `ϖ^p` divides `p` and Frobenius is an isomorphism `R°/ϖ → R°/ϖ^p`. This roadmap builds
their theory in that generality, with no perfectoid base field and with products of mixed- and
equal-characteristic rings allowed: almost mathematics over an arbitrary basic setup; perfectoid
Tate rings, tilts, Fontaine's `θ` and the classification of untilts by primitive ideals; the tilting
homeomorphism, perfectoid rational localisation, the sheaf theorem with almost acyclicity of `O⁺`,
and perfectoid spaces with fibre products; almost purity and the étale site; injections,
immersions, Zariski closed immersions and separatedness; cofiltered limits and finite-stage descent
of étale objects; `κ`-small perfectoid spaces and the pro-étale calculus; and tilde-limits and
Frobenius-controlled towers. The end results are the tilting equivalence
`Perfd/X ≃ Perf/X♭` with `X_ét ≃ X♭_ét`, the almost purity theorem (for a perfectoid Tate ring
`R`, `FÉt(R) ≃ FÉt(R♭)`, every finite étale `R`-algebra is perfectoid, and `S°` is almost finite
étale over `R°`), and the pro-étale calculus on which DiamondsAndVStacks builds its topologies.

| Layer | Construction |
| --- | --- |
| P0 | Almost mathematics over a basic setup |
| P1 | Perfectoid Tate rings, tilts and untilts |
| P2 | Rational localisation, the sheaf theorem and perfectoid spaces |
| P3 | Almost purity and the étale site |
| P4 | Injections, immersions and separatedness |
| P5 | Cofiltered limits and finite-stage étale descent |
| P6 | `κ`-small perfectoid spaces and pro-étale morphisms |
| P7 | Tilde-limits and Frobenius-controlled towers |

## Scope and ownership

The module order is AdicSpacesPartII → AdicSpacesPartIII → AdicEtaleGeometry → AdicSpacesPartIV →
PerfectoidSpaces → DiamondsAndVStacks → PerfectoidTowers. Everything rests on Tau Ceti's Huber rings
and adic spaces and on Mathlib's Witt vectors, perfection, `PreTilt` and `fontaineTheta`. The
tower-quotient and torsor-descent layers P8–P9 form [PerfectoidTowers](../PerfectoidTowers/README.md).
AdicEtaleGeometry supplies finite étale and étale morphisms of analytic adic spaces and their sites
(P3 restricts them to perfectoid spaces and compares); AdicSpacesPartII R0 owns completed tensor
products, fibre products and separatedness of adic spaces; AdicSpacesPartIII R3 the Gel'fand
spectrum; AdicSpacesPartIV R5 vector bundles on étale sites, sousperfectoid coefficients and the
intrinsic tilde-limit relation. This roadmap owns the perfectoid theory, the `κ`-small and
pro-étale calculus (P6) and the v-site construction from compact-open coverings (P7);
DiamondsAndVStacks owns diamonds and spatiality. Prismatic cohomology and general
perfectoidisation are not targets: P4 uses only the semiperfectoid case.

## Conventions

Fix a prime `p`. A perfectoid Tate pair `(R, R⁺)` is a Tau Ceti Huber pair with `R` perfectoid; `R°`
is the power-bounded subring and `R°°` the topologically nilpotent ideal. `Perfd` is the category of
perfectoid spaces, a full subcategory of Tau Ceti's `PreAdicSpace`, and `Perf` the subcategory with
`p = 0` in all sections; `X♭` is the tilt and `♯` the multiplicative, non-additive sharp map. Almost
statements are relative to a stated basic setup, for perfectoid rings `(R°, R°°)`, and are never
upgraded silently. "qcqs" means quasicompact and quasiseparated; cutoff cardinals are strong limits
and may be singular.

## Exact supplier contracts

| Object | Declaration at the pins | Layer |
| --- | --- | --- |
| Serre classes and their isomorphisms | Mathlib `ObjectProperty.IsSerreClass`, `ObjectProperty.isoModSerre` | P0 |
| Henselian adic completions | Mathlib `IsAdicComplete.henselianRing` | P0, P3 |
| Idempotent lifting | Tau Ceti `HenselianRing.exists_isIdempotentElem_sub_mem`, `IsAdicComplete.exists_isIdempotentElem_eq` | P0 |
| Tate and Huber rings | Tau Ceti `IsTateRing`, `IsHuberRing`, `IsPseudoUniformizer`, `PairOfDefinition` | P1 |
| `R°`, `R°°`, boundedness, uniformity | Tau Ceti `powerBoundedSubring`, `topologicallyNilpotentIdeal`, `IsBounded`, `IsUniform`, `IsUniform.isReduced` | P1 |
| Integral tilt and `θ` | Mathlib `PreTilt`, `PreTilt.untilt`, `Tilt`, `WittVector.fontaineTheta`, `surjective_fontaineTheta` | P1 |
| Perfection | Mathlib `Perfection`, `Perfection.coeffMonoidHom`, `ModP` | P1 |
| Huber pairs and quotients | Tau Ceti `Pair`, `Pair.quotient`, `Pair.Hom.spaComap` | P1, P4 |
| Rational localisation | Tau Ceti `PairOfDefinition.locUniformSpace`, `isTateRing_completion_locTopology_of_isTateRing` | P2 |
| Stable uniformity and sheafiness | Tau Ceti `IsStablyUniform`, `IsSheafyRing` | P2 |
| Pre-adic spaces | Tau Ceti `PreAdicSpace`, `presentationLimitPreAdicSpace`, `PreAdicSpace.isAdic`, `PreAdicSpace.isAffinoid`, `PreAdicSpace.IsOpenImmersion`, `isIso_toPresentationLimit_top` | P2, P4 |
| Pro-constructible sets | Tau Ceti `IsProConstructible` | P4, P5 |
| Cardinal-filtered categories, pro-objects | Mathlib `IsCardinalFiltered`, `Ind`, `Functor.ofSequence`, `AdicCompletion` | P5–P7 |
| Profinite level families | Tau Ceti `Subgroup.exists_le_of_iInf_le_of_directed` | P7 |
| `A_inf` and the Fargues–Fontaine `Y` | Tau Ceti `FarguesFontaine.spaY` | P1 |

## How to read the build

P0 and P1 are independent until the almost setup of a perfectoid ring. P2 turns the ring theory into
geometry, P3 proves almost purity and builds the étale site, P4 treats injections, immersions and
separatedness, P5 cofiltered limits, P6 the `κ`-small calculus and pro-étale morphisms, P7
tilde-limits and towers. Within a layer, subsections are in dependency order. Each target ends with
the Lean declarations that carry it, when there are any; targets without Lean are stated here only,
their carriers being formalisation tasks in their own right.

## Layer P0: almost mathematics over a basic setup

Almost mathematics over an abstract basic setup `(V, m)`, so that P1 can instantiate it with
`(R°, R°°)` and with the root ideal of a pseudouniformiser: the almost category as a Serre quotient,
its monoidal structure, almost algebras, finiteness, flatness and projectivity, almost finite étale
algebras and the trace-form criterion, the almost cotangent complex and deformation theory, descent,
tight ideals and finite étale lifting along complete algebras, and almost sheaf cohomology. `M^a` is
the almostification of a `V`-module and `M_*` the almost elements of an almost module.

### P0.1 Basic setups

**Basic setup.** A basic setup on a commutative ring `V` is an ideal `m` with `m·m = m` and
`m̃ := m ⊗_V m` flat ([GR] §2.1, (2.1.1), p. 7, and (2.5.14), p. 32). `M` is almost zero if `m·M = 0`;
a map is an almost isomorphism if its kernel and cokernel are almost zero. The classical setup is
`m = V`; base change along `V → W` gives `(W, mW)`, flat since `W ⊗_V m̃ ≅ (mW)~` ([GR] Remark
2.1.4(ii)). Condition (A): `m` is a directed union of principal ideals; (B): `k`-th powers of
elements of `m` generate `m`. For idempotent `m`, (A) implies (B) and flatness of `m̃`; flatness of
`m̃` alone implies (B) ([GR] (2.1.6), Proposition 2.1.7). A setup is data, not a class. Checks: the
zero ideal is a setup in which every module is almost zero; the maximal ideal of `ℤ_p` is not
idempotent and `ℤ/p²` is not killed by `p`, so idempotence is what closes almost zero modules under
extensions; `(t) ⊆ 𝔽_p[t]` satisfies (A) but not (B); over `(ℤ, ℤ)`, `m̃ → V` sends
`2 ⊗ 3 + 5 ⊗ 7` to `41`; classically `2 : ℤ → ℤ` is not an almost isomorphism. Lean:
`Almost.BasicSetup`, `tilde`, `tildeMul`, `IsAlmostZero`, `almostZero`, `IsAlmostIso`, `classical`,
`baseChange`, `IsFilteredPrincipal`, `PowersGenerate`, `IsFilteredPrincipal.powersGenerate`,
`flat_tilde_of_isFilteredPrincipal`, `powersGenerate`, `flat_tilde_top`, `isAlmostZero_classical_iff`,
`isIdempotentElem_map`, `flat_tilde_map`.

**Detection by `m̃ ⊗ −`.** `m·M = 0 ⟺ m ⊗_V M = 0 ⟺ m̃ ⊗_V M = 0`; `f` is an almost isomorphism
iff `m̃ ⊗ f` is bijective; for flat `m`, `m̃ ≅ m`; `m̃ ⊗ m ≅ m̃ ⊗ m̃ ≅ m̃` with `x ⊗ y = y ⊗ x` ([GR]
Remark 2.1.4(i), Claim 2.1.10). Checks: for `𝒪_{ℂ_p}`, `m ⊗ V/m = 0`, while `(p) ⊗ ℤ_p/p ≠ 0`; the
predicate agrees with Mathlib's `isoModSerre`. Lean: `isAlmostZero_iff_tensor_eq_zero`,
`isAlmostIso_iff_isoModSerre`.

### P0.2 The root setup

**Compatible `p`-power roots.** For `p ≥ 2` and `ϖ_{n+1}^p = ϖ_n` in `V`, `m = (ϖ_n : n ≥ 0)` is a
basic setup with (A); `M` is almost zero iff every `ϖ_n` kills it; shifts and cofinal changes give
the same setup; base change gives the root setup of the images; for regular `ϖ_0`, `m̃ ≅ m` ([Bhatt]
Example 4.1.3; [ECD] Definition 3.21). Checks: for `𝔽_p[t^{1/p^∞}]`, `V/(t)` is not almost zero and
`V/m` is; the all-one chain gives the classical setup, the all-zero chain `m = 0`, while `ϖ_0 = 0`
with `ϖ_1 ≠ 0` gives a nonzero ideal. Lean: `ofCompatibleRoots`, `mem_ofCompatibleRoots_ideal`,
`ofCompatibleRoots_isAlmostZero_iff`, `isIdempotentElem_span_roots`, `flat_tilde_span_roots`.

### P0.3 The setup of a valuation ring

**`(K°, K°°)`.** For a valuation domain with maximal ideal not finitely generated, `(V, m)` is a basic
setup with `m̃ ≅ m`, and almost zero means a `V/m`-vector space ([GR] Example 2.1.2(i); [Sch12] Lemma
4.2; [ECD] Example 3.22(i)); for a non-field, `m` is idempotent iff it is not finitely generated; with
compatible roots of some `ϖ_0 ≠ 0` dividing all of `m` (automatic in rank one) it is the root setup.
Checks: over `𝒪_{ℂ_p}` the residue field is almost zero and `V/p` is not; a field has idempotent,
finitely generated maximal ideal `0`; in rank two the root ideal of an element of value `(1, 0)`
misses value `(0, 1)`. Lean: `ofValuationRing`, `isIdempotentElem_maximalIdeal_iff`,
`ofValuationRing_eq_ofCompatibleRoots`, `isIdempotentElem_maximalIdeal_of_not_fg`,
`flat_tilde_maximalIdeal`, `padicComplex_maximalIdeal_not_fg`.

### P0.4 Firm modules and the Serre class

**Serre class.** Almost zero modules form a Serre class and a tensor ideal (`M ⊗ N`, `Hom(M, N)`,
`Hom(N, M)`), using only `m·m = m`; almost isomorphisms are stable under `X ⊗ −` ([Sch12] Lemma 4.2;
[GR] (2.2.2), (2.2.5)). Check: `m ↪ V` is an almost isomorphism. Lean: `almostZero_isSerreClass`.

**Firm modules.** `M` is firm if `m̃ ⊗ M → M` is bijective; firm modules form an abelian subcategory,
`M ↦ m̃ ⊗ M` is exact, right adjoint to the inclusion with kernel the almost zero modules, so firm
modules model the almost category with small Hom-types ([Bhatt] Construction 4.1.5, Proposition
4.1.7; [GR] Proposition 2.2.21). Checks: `m̃` is firm and `V` is not when `m ≠ V`; `m·M = M` does not
characterise firmness ([Bhatt] Warning 4.1.6).

### P0.5 Almost modules

**`V^a`-Mod.** `Almost.Module S` is the localisation of `ModuleCat V` at almost isomorphisms
(Mathlib's Serre-class localisation, realised by firm modules); `(−)^a` is exact and essentially
surjective, `M^a ≅ 0` iff `M` is almost zero, the category is abelian, and exact functors killing
almost zero modules factor uniquely ([Sch12] Definition 4.3; [GR] (2.2.2); [KL15] Definition 5.5.8).
Checks: over `𝒪_{ℂ_p}` the residue field dies and `V/p` does not; `V^a` is not projective over
`(K°, K°°)` ([Sch12] Remark 4.8).

### P0.6 Almost elements and the left adjoint

**`M_*` and `M_!`.** `M_* := Hom(V^a, M)` is right adjoint to `(−)^a` with invertible counit and
`(N^a)_* ≅ Hom_V(m̃, N)`; `M_! := m̃ ⊗ M_*` is an exact left adjoint; `N → (N^a)_*` and `M_! → M_*`
are almost isomorphisms; the category is complete, cocomplete, AB5 with generator `V^a` and enough
injectives; `Hom(M^a, N^a) ≅ Hom_V(m̃ ⊗ M, N)` ([GR] Propositions 2.2.13, 2.2.21, (2.2.4), (2.2.9),
Corollary 2.2.15; [Sch12] Propositions 4.4, 4.6). Checks: `((K°°)^a)_* = K°`; for `K` the completion
of `ℚ_p(p^{1/p^∞})`, `K°/p → ((K°/p)^a)_*` is not surjective ([Sch12] Remark 4.8).

### P0.7 The closed symmetric monoidal structure

**Tensor and internal Hom.** The localised monoidal structure has unit `V^a ≅ m^a`,
`M^a ⊗ N^a ≅ (M ⊗ N)^a`, internal Hom `alHom(M, N) := Hom(M, N)^a`; `(−)_!` is strong and `(−)_*` lax
monoidal ([Sch12] Proposition 4.5; [GR] (2.2.10)–(2.2.11), Proposition 2.4.35). Check: `m` is not a
tensor unit in `ModuleCat V` (`m ⊗ V/m = 0`) but `m^a` is.

### P0.8 Almost algebras

**Commutative monoids.** Almost algebras are Mathlib `CommMon` objects of `Almost.Module S`; `A_*` is
a `V`-algebra, `R ↦ R^a` is left adjoint to `A ↦ A_*`; `A`-modules (Mathlib `Mod`) form a closed
symmetric monoidal abelian category equivalent to almost modules over the base change of `S` to
`A_*`, with free modules, quotients, products and pushouts computed on almost elements ([Sch12] after
Proposition 4.6; [Bhatt] Remark 4.2.8; [GR] (2.2.8), Propositions 2.2.13, 2.2.18). Check: classically
`R ↦ R^a` is an equivalence.

### P0.9 The left adjoint on algebras

**`B_!!`.** `B_!! := (V ⊕ B_!)/(xy − x ⊗ y ⊗ 1)` is a unital `V`-algebra with `(B_!!)^a ≅ B`, left
adjoint to `R ↦ R^a`, commuting with colimits, with `B_!! → B_*` an almost isomorphism; `B` is exact
when `0 → m̃ → V ⊕ B_! → B_!! → 0` is, which holds for `m̃ ≅ m` ([GR] Definition 2.2.25 to Remark
2.2.28). Checks: `(V^a)_!! ≅ V`; for the zero setup `B_!! = V` while `B_* = 0`; the flat
`V^a × V^a → V^a` becomes non-flat after `(−)_!!` ([GR] Remark 3.1.3(ii)).

### P0.10 Almost finite generation and presentation

**Almost finitely generated and presented.** `N` is almost finitely generated if for each finitely
generated `m₀ ⊆ m` some `φ : Vⁿ → N` has cokernel killed by `m₀` (uniformly if one `n` serves all),
almost finitely presented if moreover the kernel is almost finitely generated in the same sense
([GR] Definition 2.3.8, Proposition 2.3.10). These are almost-isomorphism invariant, stable under
extensions and base change; almost finite presentation means `alHom(M, −)` commutes with filtered
colimits; under (A) they are Scholze's `ε`-forms ([GR] Lemma 2.3.17, Proposition 2.3.15, Remark
2.3.9; [Sch12] Proposition 4.7(iii)). Checks: for `L = K(√p)` over `K` the completion of
`ℚ_p(p^{1/p^∞})`, `L°` is uniformly almost finitely generated with bound `2` ([Bhatt] Example 4.2.7);
`⊕_ℕ K°` is not. Lean: `AlmostFG`.

### P0.11 Flatness and almost projectivity

**Flat, faithfully flat, almost projective.** `M` is flat if `M ⊗ −` is exact, faithfully flat if
moreover it reflects zero, almost projective if `alHom(M, −)` is exact ([GR] Definition 2.4.4);
categorical projectivity is never used. These are detected by almost vanishing of `Tor_i`, `Ext^i`
([GR] (2.4.10); [Sch12] Proposition 4.7(i)); almost projective plus almost finitely generated equals
flat plus almost finitely presented ([GR] Proposition 2.4.18; [Sch12] Proposition 4.10); and almost
projectivity of almost finitely generated `M` is the existence of `M → Aⁿ → M` composing to `ε·1`
for all `ε ∈ m` ([GR] Lemma 2.4.15; [KL15] Definition 5.5.8). Checks: `K°/ϖ` is not flat; classically
the `ε`-form is `Module.Projective ∧ Module.Finite`; `L° → (K°)² → L°` gives bound `2`. Lean:
`IsAlmostFiniteProjective`, `IsAlmostFiniteProjective.almostFG`.

### P0.12 Duals and traces

**Traces and the trace form.** For almost finite projective `P`, `P ⊗ P* → End(P)^a` is an
isomorphism and `tr := ev ∘ ω⁻¹` is cyclic, multiplicative, additive, base-change compatible and
transitive, with `P ≅ P**`; for `B` almost finite projective over `A`, `Tr_{B/A}`, the trace form
`t_{B/A}` and `τ : B → B*` are defined ([GR] Definition 4.1.1, Lemmas 2.4.29, 2.4.31, 4.1.2, 4.1.13,
(4.1.7), (4.1.12)). Mathlib's `LinearMap.trace` is not used. Checks: `Tr_{L°/K°}(1) = 2` with an
almost perfect trace form; for `A[ε]/ε²` the form `[[2, 0], [0, 0]]` is not perfect.

### P0.13 Rank decomposition

**Constant-rank pieces.** Under (B), a uniformly almost finite projective `P` has `Λ^r P = 0` for
some `r` and `A ≅ A_0 × ⋯ × A_{r−1}` uniquely with `P ⊗ A_i` of rank `i`, compatibly with base change
([GR] Remark 4.3.10(i), Proposition 4.3.27; [Sch12] Theorem 4.11). Checks: `P = 0` has `r = 1`; the
non-almost-finitely-generated `⊕ V δ_i ⊆ ∏ k` has `Λ² = 0` and no decomposition.

### P0.14 Flat, unramified, étale and finite étale morphisms

**Morphism classes.** For `φ : A → B` with `μ : B ⊗_A B → B`: flat, almost finite and so on via
`B` as `A`-module; (weakly) unramified if `B` is almost projective (flat) over `B ⊗_A B`; (weakly)
étale if moreover flat; finite étale if étale and almost finitely presented ([GR] Definition 3.1.1;
[Sch12] Definition 4.13; [Bhatt] Definition 4.3.1); stable under base change and composition, with
cancellation ([GR] Lemma 3.1.2). Checks: `L°a/K°a` is finite étale with diagonal idempotent
`(1 ⊗ √p + √p ⊗ 1)/(2√p ⊗ 1)` not in `L° ⊗ L°`; `ℚ → ℚ[ε]/ε²` is not unramified.

### P0.15 The trace-form criterion and the diagonal idempotent

**Étale iff the trace form is perfect.** For `B` almost finite projective, `φ` is étale iff `t_{B/A}`
is perfect ([GR] Theorem 4.1.14; [Sch12] Theorem 4.16); `φ` is unramified iff a unique almost
idempotent `e` has `μ(e) = 1`, `I·e = 0`, giving `B ⊗ B ≅ I × B` ([GR] Proposition 3.1.4, Corollary
3.1.9). Checks: the idempotent of `A × A`; `A[ε]/ε²` fails both sides.

### P0.16 Inverting an element of `m`

**`M ↦ M[1/ϖ]`.** For `ϖ ∈ m`, inverting `ϖ` factors through an exact symmetric monoidal functor
`Almost.Module S → ModuleCat V[1/ϖ]` sending almost isomorphisms and almost exact complexes to honest
ones; the base-changed setup is classical ([GR] proof of Corollary 5.2.15; [Berkeley] proof of
Proposition 8.2.8). For `V → W`, almost `(W, mW)`-modules are `W^a`-modules in `Almost.Module S`
([GR] Remark 2.2.12). Check: `(K°/ϖ)^a ↦ 0`, so the functor is not faithful. Lean:
`baseChange_away_eq_classical`.

### P0.17 Comparison with Mathlib's finite étale algebras

**Honest versus almost.** Mathlib finite étale `R → R'` gives finite étale `R^a → R'^a`, with the
converse classically; almost finite étale becomes finite étale after inverting `ϖ ∈ m` ([Bhatt]
Construction 4.3.3; [GR] (3.4.44), Remark 3.1.3(i)). Check: `L°` need not be finitely presented over
`K°`.

### P0.18 Almost Kähler differentials

**`Ω_{B/A} := I/I²`.** It represents derivations, satisfies base change, the two exact sequences,
commutes with colimits, almostifies `Ω_{R'/R}`, and vanishes for unramified maps ([GR] Definition
2.5.22(ii), Proposition 2.5.25, Lemma 2.5.28). Check: `δ(X² + X) = 2X + 1`, fixing the sign.

### P0.19 The cotangent complex of a ring map

**`L_{S/R}`.** The simplicial-resolution cotangent complex ([Stacks] Tag 08PL) with `H_0 = Ω`, `H_1`
matching Mathlib's `Algebra.H1Cotangent`, transitivity (08QX), Tor-independent base change (08QQ),
filtered colimits (08S9), `Ext^0 = Der`, `Ext^1 = Exal` (08S3, 08RB), deformation obstructions in
`Ext^2` (08SP), and the diagonal spectral sequence of simplicial maps ([Illusie] II 1.2.6.2; [GR]
proof of Proposition 8.1.7). Checks: `L_{R[X]/R} = Ω`; `R → R/(f)` gives `(f)/(f²)[1]`; perfect
`𝔽_p`-algebras have `L ≃ 0`; `ℤ → ℤ/2` has `H_1 = ℤ/2`.

### P0.20 The almost cotangent complex

**`L^a_{B/A}`.** Defined through `B_!!` and the unitisations `V^a × A`, with `H_0 = Ω_{B/A}`,
`Ext^0 = Der`, `Ext^1 = Exal`, transitivity, base change, colimits, and `L^a_{S^a/R^a} ≅ (L_{S/R})^a`
([GR] Definition 2.5.20, Theorems 2.5.32, 2.5.35, Propositions 2.5.33–2.5.34, 8.1.7; [Sch12] §5).
Check: the naive complex of `A_* → B_*` is wrong (for `m = 0`, `B_!! = V`, `B_* = 0`).

### P0.21 Square-zero extensions and `Ext^1`

**`Exal_A(B, M) ≅ Ext^1_B(L^a, M)`.** Almostification identifies extensions of `B_!!` by `M_*` with
almost extensions ([GR] Lemma 2.5.17, Theorem 2.5.30, Proposition 2.5.29); for an epimorphism with
kernel `I`, `Hom_B(I/I², M) ≅ Exal_A(B, M)`. Checks: `ℤ/4 → ℤ/2` has class of order two, `ℤ/9 → ℤ/3`
of order three.

### P0.22 Flat square-zero deformations

**Obstruction, torsor, automorphisms.** For `0 → I → B → B₀ → 0` and flat `C₀`, the class in
`Ext^2(L^a_{C₀/B₀}, C₀ ⊗ I)` vanishes iff a flat deformation exists, deformations form an
`Ext^1`-torsor with automorphisms `Ext^0` ([GR] Proposition 3.2.9, Corollary 3.2.11; [Sch12]
Theorem 5.11); local flatness criterion for `J² = 0` ([GR] (3.2.19), Lemma 3.2.6). Check: `B₀[X]` has
automorphisms `X ↦ X + aε`.

### P0.23 Lifting morphisms

**Along square-zero extensions.** The obstruction lies in `Ext^1(L^a_{C₀¹/B₀}, J²)` and lifts form a
`Der`-torsor ([GR] Proposition 3.2.16; [Sch12] Theorem 5.12). Check: unequal pushed and pulled
classes give a nonzero obstruction.

### P0.24 Étale algebras lift along nilpotent ideals

**Nilpotent invariance.** For nilpotent `I`, `B ↦ B ⊗ A/I` is an equivalence on weakly étale, étale
and finite étale algebras ([GR] Theorems 3.2.18, 3.2.28(ii)); Tor-vanishing gives `L ≃ 0` ([GR]
Theorem 2.5.36). Check: classically this is [SGA1] I 5.5, 8.3.

### P0.25 Faithfully flat descent

**Descent.** Along faithfully flat `A → B` modules and algebras descend, flatness, almost finiteness
and the étale classes descend, and the Amitsur complex is exact ([GR] (3.4.1), Remark 3.2.26(iii);
[ECD] proof of Proposition 8.8); `(−)_!!` reflects faithful flatness, not flatness. Check: for
`A → A × A` the Amitsur complex is split.

### P0.26 Tight ideals and henselian pairs

**Tight henselian pairs.** `I` is tight if `Iⁿ ⊆ m₀A` for finitely generated `m₀ ⊆ m`; `(A, I)` is
henselian if `I ⊆ rad(A)` and `(A_*, m·I_*)` is henselian; complete pairs are henselian;
Nakayama for tight `I`; idempotents lift uniquely ([GR] Definitions 5.1.1, 5.1.5, 5.1.8, Lemmas
5.1.6, 5.1.10, Proposition 5.1.17), extending Tau Ceti's `HenselianRing.exists_isIdempotentElem_sub_mem`.
Checks: `ϖA` is tight, the unit ideal of `K°a` is not.

### P0.27 Modules over complete almost algebras

**Almost finite projective modules by levels.** For tight `I` and `A ≅ lim A/I^{n+1}`, almost finite
projective modules are compatible systems of such modules over `A/I^{n+1}` ([GR] Lemma 5.3.5,
Theorem 5.3.24); limits and `lim¹` of almost zero modules are almost zero ([GR] Lemma 2.4.2). Check:
transitions `·t` on `k[t]` give the nonzero, almost zero `lim¹ = k⟦t⟧/k[t]`.

### P0.28 Finite étale lifting modulo a tight ideal

**`A_fet ≃ (A/I)_fet`.** For tight `I` and `I`-adically complete `A`, reduction is an equivalence of
finite étale algebras ([GR] Theorem 5.3.27; [Sch12] Theorem 4.17). Supporting: unramifiedness lifts
([GR] Theorem 5.2.12(ii)); finite étale algebras over a `ϖ`-complete `A` are `ϖ`-complete; for
`ϖ`-torsion-free `M_*`, `(ϖⁿM)_* = ϖⁿM_*` and completeness of `M` and `M_*` agree ([Sch12] Lemma 5.3;
[Bhatt] Lemmas 4.4.1–4.4.2); a nonnegative complex of `ϖ`-torsion-free complete modules almost exact
modulo `ϖ` is almost exact, by the Milnor sequence ([ECD] proof of Proposition 8.8). Checks:
`(K°/p²)^a` shows torsion-freeness is needed; `C^0 = V[1/ϖ]` shows completeness is needed.

### P0.29 Almost sheaves and almost cohomology

**Almost acyclicity.** On a site, almost zero sheaves form a Serre class; `H^n(X, F)^a` depends only
on `F^a`; if every augmented Čech complex of a covering by a fibre-product-stable basis is almost
exact, then `H^n(U, F)` is almost zero on the basis for `n > 0` ([GR] §3.3; [ECD] proof of
Proposition 8.8; [Berkeley] Theorem 7.4.4; [Sch12] Proposition 6.14); for `m = V` this is Cartan's
criterion. Check: on `S¹` the constant sheaf `K°/K°°` has `H¹ ≠ 0` yet is almost acyclic.

### Examples

The Lean `example`s use the classical, zero, valuation and root setups, with `ℤ_p`, `(t) ⊆ 𝔽_p[t]`
and fields as non-examples.

### Dependencies

Mathlib `IsIdempotentElem`, `Module.Flat`, `ValuationRing`, `ObjectProperty.IsSerreClass`,
`isoModSerre`, `CommMon`, `Mod`, `KaehlerDifferential`, `Algebra.H1Cotangent`, `HenselianRing`,
`IsAdicComplete`; Tau Ceti `HenselianRing.exists_isIdempotentElem_sub_mem`. Consumed by P1–P3 and by
DiamondsAndVStacks.

## Layer P1: perfectoid Tate rings, tilts and untilts

Perfectoid Tate rings and fields, the tilt with its sharp map and functoriality, the almost setup
`(R°, R°°)`, Fontaine's `θ` and its distinguished kernel, untilts and their classification by
primitive ideals, integral perfectoid rings, the tilting equivalence, completed colimits, perfected
Tate algebras and the standard examples. No perfectoid base field is fixed; the zero ring is
allowed; "characteristic `p`" means `pR = 0` (Lean's `CharP R p` excludes the zero ring).
`ℚ_p^cycl` is the completion of `ℚ_p(μ_{p^∞})`.

### P1.1 Perfectoid Tate rings

**Perfectoid Tate ring.** A complete Hausdorff Tate ring `R` is perfectoid if `R°` is bounded and
some pseudouniformiser `ϖ ∈ R°` has `ϖ^p | p` in `R°` with Frobenius `R°/ϖ → R°/ϖ^p` bijective
([ECD] Definition 3.1, p. 14; [Berkeley] Definition 6.1.1; [KL16] Definition 3.3.1). Injectivity
is automatic, the condition does not depend on `ϖ`, and for uniform `R` it is surjectivity of
Frobenius on `R°/p` with `ϖ^p | p` ([ECD] Remark 3.2; [BMS] Lemma 3.9). Perfectoid Tate rings are
uniform and reduced ([Sch12] proof of Proposition 5.8), and finite products of them are perfectoid.
Checks: `ℚ_p` is not perfectoid ([ECD] Remark 3.3);
`ℂ_p[ε]/ε²` meets the Frobenius condition but is not uniform; the zero ring and `ℂ_p` are
perfectoid. Lean: `Perfectoid.IsPerfectoidTateRing`, `IsPerfectoidTateRing.of_surjective`,
`IsPerfectoidTateRing.iff_frobenius_surjective_modP`, `IsPerfectoidTateRing.isUniform`,
`IsPerfectoidTateRing.isReduced`, `IsPerfectoidTateRing.prod`,
`isTateRing_of_nontriviallyNormedField`, `IsTateRing.instProd`.

### P1.2 Characteristic `p`

**Perfectoid equals perfect.** With `pR = 0`, `R` is perfectoid iff perfect, and then `R°` and every
`R⁺` are perfect ([ECD] Proposition 3.5; [Sch12] Proposition 5.9); perfect complete Tate rings of
characteristic `p` are uniform. For complete uniform `R`, `R⁺` is `ϖ`-adically complete with
`R = R⁺[1/ϖ]` and `p` a non-unit, the hypotheses of Mathlib's `PreTilt.untilt` and `fontaineTheta`.
Checks: the completed perfection of `𝔽_p((t))` is perfectoid and `𝔽_p((t))` is not. Lean:
`IsPerfectoidTateRing.iff_perfectRing`.

### P1.3 Compatible `p`-power roots and the spectral gauge

**Roots.** A pseudouniformiser with compatible roots is `ϖ♭ ∈ Perfection R p` with `ϖ♭^{(0)}` a
pseudouniformiser in `R°` and `ϖ^p | p`; every perfectoid Tate ring has one ([ECD] Lemma 3.10;
[BMS] Lemma 3.9). The gauge `|x|_ϖ := inf{2^{−q} : ϖ^{−q}x ∈ R°}` is a power-multiplicative norm
defining the topology with `R° = {|x| ≤ 1}`, the spectral seminorm of AdicSpacesPartII R0 ([Sch12]
Remark 3.5; [Berkeley] Lemma 6.2.2). Checks: on `ℂ_p`, `|x| = 2^{−p v_p(x)}`; `ℚ_p` has no roots, so
the root structure is empty. Lean: `PseudoUniformizerRoots`, `PseudoUniformizerRoots.root`,
`PseudoUniformizerRoots.nonempty`.

### P1.4 The tilt

**`R♭ = lim_{x↦x^p} R`.** With addition `(x + y)^{(i)} = lim_n (x^{(i+n)} + y^{(i+n)})^{p^n}`, `R♭` is a
perfectoid Tate ring of characteristic `p` with pseudouniformiser `ϖ♭`, `R♭ = (lim R°)[1/ϖ♭]`, and
`R♭ ≅ R` when `pR = 0` ([ECD] Definition 3.9, Lemma 3.10; [AWS] Lemma 2.7.1(b)); `R♭⁺ := lim R⁺`, and
`lim R⁺ ≅ lim_Φ R⁺/p` ([BMS] Lemma 3.2(i)). Checks: in
`(ℚ_p^cycl)♭`, `ε = (ζ_{p^n})` has `(ε − 1)^{(0)} ≠ 0`, so addition is not coordinatewise;
`Nontrivial R♭ ↔ Nontrivial R`.

### P1.5 The sharp map and the integral subrings of the tilt

**`♯ : R♭ → R`.** `x♯ := x^{(0)}` is continuous, multiplicative, not additive, detects `R♭°` and
zero, satisfies `(x + y)♯ ≡ x♯ + y♯ mod p`, is surjective modulo `p`, and induces
`R♭°/ϖ♭^q ≅ R°/ϖ^q` for `0 < q ≤ p` ([ECD] after Lemma 3.10; [BMS] Lemma 3.10). Frobenius criterion:
surjectivity of `R°/ϖ → R°/ϖ^p`, of Frobenius on `R°/p` and on `R°/ϖp` agree ([BMS] Lemma 3.9;
[KL15] Remark 3.4.9). Check: for `ℤ_p[p^{1/p}]` the first holds and the second fails.

### P1.6 Functoriality

**`f ↦ f♭`.** Continuous `f : R → S` induces continuous `f♭` with `(f♭x)♯ = f(x♯)`, functorially and
on pairs and slices ([Berkeley] Theorem 6.2.7; [AWS] Definition 2.3.2; [ECD] Theorem 3.13). Check:
for `g ∈ Gal(ℚ_p^cycl/ℚ_p)`, `g♭(ε) = ε^{χ(g)}`.

### P1.7 The tilt of a complete uniform Tate ring

**`B♭` without perfectoidness.** For complete uniform Tate `B` with `p` topologically nilpotent,
`B♭ := lim_{x↦x^p} B` is a complete perfect ring with open `B♭⁺ ≅ PreTilt B⁺ p`; with roots of
`ϖ = ϖ♭♯` and `ϖ^p | p` it is a perfectoid Tate ring with `|x|_{ϖ♭} = |x♯|_ϖ`; `θ_B` is Mathlib's
`fontaineTheta`, natural, not surjective in general ([AWS] Lemma 2.7.1, Lemma 2.8.4). Check:
`ℚ_p♭ ≅ 𝔽_p` is not Tate.

### P1.8 The integral tilt is Mathlib's `PreTilt`

**`R♭⁺ = PreTilt R⁺ p`.** For nonzero perfectoid `R`, `x ↦ (x^{(n)} mod p)_n` is a topological ring
isomorphism under which `♯` is `PreTilt.untilt`, and `R♭ ≅ (PreTilt R⁺ p)[1/ϖ♭]` ([BMS] Lemma
3.2(i); [KL15] Remark 3.4.10). Check: in `ℂ_p`, `PreTilt.untilt p♭ = p`.

### P1.9 The almost setup of a perfectoid Tate ring

**`(R°, R°°)`.** With compatible roots, `R°° = ⋃ ϖ^{1/p^n}R°` is idempotent and flat, contained in
every `R⁺`, so `(R°, R°°)` and `(R⁺, R°°)` are root setups depending only on `R`; almost zero means
killed by every pseudouniformiser, and `R°/R⁺` is almost zero ([ECD] Definitions 3.21, 3.23,
Example 3.22). Checks: `(pℤ_p)² ≠ pℤ_p`; over `𝒪_{ℂ_p}`, `𝒪/m` is almost zero and `𝒪/p^{1/p}` is not.
Lean: `isIdempotentElem_topologicallyNilpotentIdeal`, `flat_tilde_topologicallyNilpotentIdeal`,
`almostSetup`, `almostSetup_isAlmostZero_iff`.

### P1.10 Perfectoid fields

**Perfectoid field.** A perfectoid Tate ring that is a field complete for a nontrivial
nonarchimedean absolute value defining its topology ([ECD] Definition 3.6); its value group is
`p`-divisible. Mathlib's proposed interface (mathlib4#26389) uses a rank-one valuation. Checks:
`ℚ_p` is not one; `ℂ_p` is; the trivially valued `𝔽̄_p` is excluded. Lean: `IsPerfectoidField`,
`isPerfectoidField_padicComplex`, `IsPerfectoidField.valueGroup_pDivisible`.

### P1.11 Characterisation of perfectoid fields

**Scholze's definition.** A complete nonarchimedean field is perfectoid iff non-discretely valued
with `|p| < 1` and surjective Frobenius on `K°/p` ([ECD] Proposition 3.8; [Sch12] Definition 3.1).
Lean: `IsPerfectoidField.iff`.

### P1.12 The unit criterion on the Gelfand spectrum

**Units.** In a nonarchimedean Banach ring, `f` is a unit iff no bounded multiplicative seminorm
kills it ([KBF] proof of Lemma 2.4); the spectrum is AdicSpacesPartIII R3.

### P1.13 Uniform Banach fields

**Multiplicative spectral norm.** Over a nonarchimedean field with dense value group, a uniform
Banach algebra that is a field has multiplicative spectral norm, `|xy|_sp = |x|_sp·|y|_sp` ([KBF]
Theorem 3.7). Check: Kedlaya's
nonuniform Banach field ([KBF] Example 2.15).

### P1.14 A perfectoid Tate ring that is a field

**Kedlaya's theorem.** A perfectoid Tate ring that is a field carries a nontrivial nonarchimedean
absolute value defining its topology ([KBF] Theorem 4.2; [AWS] Theorem 2.9.1); `R` is a perfectoid
field iff `R♭` is ([Sch12] Lemma 5.21). Check: `K × K♭` is perfectoid but not a field. Lean:
`exists_absoluteValue_of_isField`.

### P1.15 The tilt of a perfectoid field

**`K♭`.** `K♭` is a perfectoid field with `|x|_♭ = |x♯|`, the same value group and residue field,
equal to Mathlib's `Tilt` with `PreTilt.val x = v(x♯)`; continuous valuations of `K` and `K♭`
correspond in all ranks ([Sch12] Lemma 3.4, Proposition 3.6). Check: for `ℚ_p`, Mathlib's `Tilt` is
`𝔽_p` with trivial valuation.

### P1.16 Primitive elements of `W(R⁺)`

**Distinguished elements.** For `(R, R⁺)` of characteristic `p`, `ξ = Σ p^n[ξ_n]` is primitive of
degree one if `ξ_0` is topologically nilpotent and `ξ_1` a unit, equivalently a unit times
`p + [ϖ♭]α` ([AWS] Definition 2.3.4; [KL16] Definition 3.2.3; [ECD] Definition 3.15); primitive
ideals are principal with primitive generator; primitive elements are nonzerodivisors, stable under
`W(f)` and Frobenius ([ECD] Lemma 3.16); `W(R⁺)` is a `(p, [ϖ♭])`-adic Huber ring ([BMS] Lemma
3.2(ii); [AWS] Theorem 2.2.10). Checks: `p` and `p − [p♭]` are primitive, `p²` and Teichmüller
lifts are not. Lean: `IsDistinguished`, `IsPrimitive`, `IsPrimitiveIdeal`.

### P1.17 Fontaine's `θ`

**`θ` is `fontaineTheta`.** For nonzero perfectoid `R`, `θ : W(R♭⁺) → R⁺`, `Σ p^n[r_n] ↦ Σ p^n r_n♯`,
is Mathlib's `WittVector.fontaineTheta`, surjective by `surjective_fontaineTheta` ([ECD] Lemma
3.14(i); [BMS] Definition 3.5); every `R⁺` has bijective `R⁺/ϖ → R⁺/ϖ^p` ([BMS] proof of Lemma 3.20).
Check: in `ℂ_p`, `θ[p♭] = p` and `θ[ε] = 1`.

### P1.18 The kernel of `θ`

**`ker θ` is principal and distinguished.** For a perfectoid pair, `ker θ` is generated by a
primitive `ξ = p + [ϖ♭]α`, and an element of `ker θ` generates it iff distinguished; `θ` extends to
`W(S♭⁺)[1/[ϖ♭]] → S`; `ker θ = (p)` when `pS = 0` ([ECD] Lemma 3.14(ii); [AWS] Lemma 2.7.5; [BMS]
Remark 3.11). Rings of integral elements of `R` and `R♭` correspond ([ECD] Lemma 3.11). Check: in
`ℂ_p`, `[ε] − 1 ∈ ker θ` does not generate it. Lean: `ker_fontaineTheta`.

### P1.19 The untilt along a primitive ideal

**`(W(R⁺)[1/[ϖ]]/J, W(R⁺)/J)`.** For a primitive `J`, this is a complete Tate pair independent of
`ϖ`, functorial, with multiplicative `♯_J` and `A⁺/π ≅ R⁺/ϖ` ([ECD] Theorem 3.17; [AWS] Theorem
2.3.9). Checks: `J = (p)` returns `(R, R⁺)`; `(p − [t])` over `𝔽_p((t^{1/p^∞}))^` gives
`ℚ_p(p^{1/p^∞})^` ([AWS] Examples 2.3.7–2.3.8); `(p²)` gives a non-reduced ring.

### P1.20 The untilt is a perfectoid pair with tilt `(R, R⁺)`

**Untilts are perfectoid.** The untilt along `J` is perfectoid with `A°/A⁺` almost zero, tilt
`(R, R⁺)` and `ker θ_A = J` ([AWS] Lemmas 2.6.14, 2.7.9; [KL16] Theorem 3.3.8; [BMS] Lemma 3.21).
Check: over a zero base every untilt is zero.

### P1.21 Classification of untilts

**Untilts ↔ primitive ideals.** Tilting with `ker θ` and untilting are quasi-inverse equivalences
between perfectoid Tate pairs and triples `(R, R⁺, J)` of characteristic `p` with `J` primitive; `ker θ`
commutes with base change ([ECD] Theorem 3.17; [KL16] Theorem 3.3.8; [AWS] Remark 2.3.17). Check:
`(K♭, K♭°, ker θ_K)` returns `(K, K°)`.

### P1.22 Marked untilts

**No automorphisms.** Untilts with a marking `(S♭, S♭⁺) ≅ (R, R⁺)` form a discrete category
equivalent to primitive ideals, pulled back along maps of pairs ([Berkeley] Lemma 6.2.8; [AWS]
Definition 2.3.13). Check: twisting the marking by Frobenius gives `φ(J) ≠ J`.

### P1.23 Strict inclusions and the sharp approximation lemma

**Strictness under tilting.** For perfectoid `A` and continuous `f : A → B`, `f` is a strict
inclusion iff `f♭` is, iff isometric for the gauges ([AWS] Theorem 2.4.2; [KL16] Lemma 3.3.23).
Supporting: the metric criterion (`|x − y^p| ≤ c|x|` for some `c < 1`) and sharp approximation
(`|a − y♯| ≤ |p||a|`, `|(x + y)♯ − x♯ − y♯| ≤ |p|max(|x|, |y|)`) ([AWS] Lemmas 2.6.7, 2.8.3, 2.8.5;
[KL15] Proposition 3.6.2(c)). Check: `T^{1/p^n} ↦ (ϖT)^{1/p^n}` is injective, not strict.

### P1.24 Integral perfectoid rings

**Integral perfectoid.** `R` is integral perfectoid if some `π` with `π^p | p` makes it `π`-adically
complete, Frobenius on `R/p` is surjective and `ker θ` is principal ([BMS] Definition 3.5, p. 21);
then `R/π → R/π^p` is bijective ([BMS] Lemmas 3.9–3.10). Mathlib's proposal (mathlib4#26385) uses a
chosen topology. Checks: `ℤ_p` is not; `𝒪_{ℂ_p}` and perfect `𝔽_p`-algebras are. Lean:
`IsIntegralPerfectoid`.

### P1.25 Perfectoid Tate rings and integral perfectoid rings

**`R` perfectoid ⇔ `R⁺` bounded integral perfectoid**, for every ring of integral elements ([BMS]
Lemma 3.20, pp. 26–27). Check: perfect discrete `𝔽_p`-algebras are integral perfectoid but not
Tate. Lean: `isPerfectoidTateRing_iff_integral`.

### P1.26 Flat deformation modulo `ϖ`

**`K°a`-Perf `≃ (K°a/ϖ)`-Perf.** Over a perfectoid field, reduction is an equivalence of complete
almost flat algebras with bijective Frobenius conditions, through unique flat deformations, since the
almost cotangent complex vanishes ([Sch12] Theorem 5.10, Proposition 5.13; [GR] v3 Lemma 6.5.9(i)).
Check: `K⟨T^{1/p^∞}⟩` and `K♭⟨T^{1/p^∞}⟩` have the same reduction.

### P1.27 The tilting equivalence

**`Perf_R ≃ Perf_{R♭}`.** Tilting is an equivalence of perfectoid algebras with inverse the untilt
along `ker θ_R·W(T°)`, on pairs and preserving fields ([ECD] Theorem 3.13; [Berkeley] Theorem 6.2.7;
[Sch12] Theorem 5.2); `R⟨T^{1/p^∞}⟩♭ = R♭⟨T^{1/p^∞}⟩` ([Sch12] Proposition 5.20).

### P1.28 The mod-`ϖ` chain over a perfectoid field

**`K`-Perf `≃ K°a`-Perf `≃ (K°a/ϖ)`-Perf** by `S ↦ S°a` and reduction ([Sch12] Theorems 5.2, 5.10,
Lemma 5.3); in characteristic `p`, `B` lifts to `lim_Φ B` ([Sch12] Remark 5.18).

### P1.29 Completed filtered colimits

**Colimits.** For a filtered diagram of perfectoid Tate rings, `(colim R_j°)^∧_ϖ[1/ϖ]` is perfectoid,
the colimit among perfectoid and complete uniform Tate rings, commuting with tilting ([Bhatt] Remark
6.2.9; [KL16] Corollary 3.3.22; [ECD] Proposition 6.5). Check: `C(S_i, K)` gives `C^0(S, K)`.

### P1.30 Perfected Tate algebras

**`R⟨T_s^{1/p^∞}⟩`.** For any set `Σ`, the completed monoid algebra on `Σ →₀ ℤ[1/p]_{≥0}` is
perfectoid, universal for compatible root systems, with tilt `R♭⟨T_s^{1/p^∞}⟩`, functorial in `Σ`;
the Laurent variant is perfectoid ([AWS] Examples 2.1.4, 2.3.15; [KL16] Example 3.3.12). Check:
`R⟨T⟩` is not perfectoid for `R ≠ 0`.

### P1.31 The completed cyclotomic field

**`ℚ_p^cycl` is perfectoid**, with `ϖ = ζ_{p²} − 1`, tilt `𝔽_p((t^{1/p^∞}))^` with `t = ε − 1`, and is
the untilt along `(Σ_{i<p}[1 + t]^{i/p})` ([ECD] Example 3.4(i); [AWS] Example 2.3.8). Lean:
`padicCyclotomic`, `padicCyclotomic.instCompleteSpace`, `padicCyclotomic.exists_one_lt_norm`,
`padicCyclotomic.instNontriviallyNormedField`, `isPerfectoidField_padicCyclotomic`.

### P1.32 Examples and non-examples

**Standard examples.** Perfectoid: `ℂ_p`, `ℚ_p(p^{1/p^∞})^`, completed perfections, `ℚ_p^cycl⟨T^{1/p^∞}⟩`,
a perfectoid ring containing no field ([ECD] Example 3.4(iv)), `K × K♭`. Not: discretely valued
fields, `𝔽_p((t))`, `ℂ_p[ε]/ε²`, `R⟨T_1, …, T_n⟩`.

### P1.33 AdicSpaces' perfect field and `A_inf`

**Compatibility.** AdicSpaces' complete perfect field `F` is perfectoid and its own tilt;
`W(𝒪_F)` with the `(p, [ϖ])`-adic topology is the ring of P1.16, matching Tau Ceti's
`FarguesFontaine.spaY`.

### Examples

The Lean `example`s cover `ℚ_p` (not perfectoid, no roots), `ℂ_p`, the zero ring, `p` versus `p²`
and Teichmüller lifts as distinguished elements, and `ℤ_p` versus `𝒪_{ℂ_p}` as integral perfectoid
rings.

### Dependencies

P0; Tau Ceti `IsTateRing`, `IsPseudoUniformizer`, `powerBoundedSubring`,
`topologicallyNilpotentIdeal`, `IsBounded`, `IsUniform`, `Pair`; Mathlib `Perfection`, `PreTilt`,
`Tilt`, `WittVector`, `fontaineTheta`, `PadicComplex`; AdicEtaleGeometry A4, AdicSpacesPartII R0,
AdicSpacesPartIII R3.

## Layer P2: rational localisation, the sheaf theorem and perfectoid spaces

From perfectoid pairs to perfectoid spaces: the tilting homeomorphism, perfectoid rational
localisation, completed residue fields, stable uniformity and the sheaf theorem with almost
acyclicity of `O⁺`, affinoid perfectoid and perfectoid spaces, the glued tilt and
`Perfd/X ≃ Perf/X♭`, completed tensor products and fibre products, absolute products in `Perf`,
and the comparison with Scholze's spaces over a perfectoid field. `(R, R⁺)` is a perfectoid pair,
`X = Spa(R, R⁺)` (Tau Ceti's `presentationLimitPreAdicSpace`), `ϖ = ϖ♭♯` with compatible roots.

### P2.1 The tilting map

**`x ↦ x♭`.** `v_x ∘ ♯` is a continuous valuation on `R♭` bounded on `R♭⁺`, giving a continuous
natural `τ : X → X♭` with `|f(x♭)| = |f♯(x)|`, `τ⁻¹U(f/g) = U(f♯/g♯)`, the identity when `pR = 0`
([ECD] Theorem 3.12; [AWS] Lemma 2.6.12). On the perfectoid polydisc, homogeneous elements are
approximated by homogeneous `g♯` ([Sch12] Lemma 6.5). Check: there is no ring map
`(ℚ_p^cycl)♭ → ℚ_p^cycl`, so `τ` is not `Spa` of a ring map.

### P2.2 The tilting homeomorphism

**`Spa(R, R⁺) ≅ Spa(R♭, R♭⁺)`.** `τ` is a natural homeomorphism matching rational subsets
(`τ(U(f♯/g♯)) = U(f/g)`, all rational subsets of `X` of this form), specialisation and rank-one
points ([ECD] Theorem 3.12; [Sch12] Corollary 6.7; [KL16] Theorem 3.3.16; [AWS] Theorem 2.5.1).
Inputs: characteristic-`p` rational localisations are perfectoid with explicit almost integral
models, so characteristic-`p` pairs are stably uniform ([KL15] Proposition 3.1.7; [Bhatt] Lemma
9.2.3); and approximation, `|f − g♯| ≤ |ϖ^{1−ε}| max(|f|, |ϖ^c|)` ([Sch12] Corollary 6.7(i); [AWS]
Lemma 2.6.17). Checks: `τ{|T| ≤ |ϖ|} = {|T| ≤ |ϖ♭|}` on the disc; ECD Example 3.4(iv) has points
with `|p| = 0` and `|p| ≠ 0`.

### P2.3 Rational localisation of perfectoid affinoids

**Rational localisations are perfectoid.** For rational `U`, Tau Ceti's completed rational
localisation `(O_X(U), O_X⁺(U))` is a perfectoid pair with a unique tilt isomorphism to
`(O_{X♭}(τU), O_{X♭}⁺(τU))`, the rational localisation in perfectoid pairs ([ECD] Theorem 3.18;
[KL16] Theorem 3.3.18; [Sch12] Corollary 6.8). The `ϖ`-adic completion `A` of
`R⁺[(f_i^{1/p^m})♯/(g^{1/p^m})♯]` has `O_X(U) = A[1/ϖ]` and `A ⊆ O_X⁺(U)` almost equal ([Sch12] Lemma
6.4; [AWS] Lemma 2.8.8). Checks: `O({|T| ≤ |ϖ|}) = ℚ_p^cycl⟨(T/ϖ)^{1/p^∞}⟩` on the disc; the naive
model `R°⟨T/ϖ⟩` is not almost equal to `O(U)°`. Lean: `isPerfectoidTateRing_rationalLocalization`.

### P2.4 The presheaf of perfectoid pairs on rational subsets

**Restriction and tilting.** `U ↦ (O_X(U), O_X⁺(U))` is a functor to perfectoid pairs with
`O⁺ = {|f| ≤ 1 on U}`, `O°/O⁺` almost zero, and natural tilt isomorphisms, so
`O_{X♭}⁺/ϖ♭ ≅ O_X⁺/ϖ` ([ECD] Example 3.22(ii), Lemma 3.11). Checks: for `R⁺ = K° + K°°⟨T^{1/p^∞}⟩`,
`T ∈ R° \ R⁺`; for `U = ∅`, `pA = 0` while `CharP A p` fails.

### P2.5 Completed residue fields

**`k(x)^` is perfectoid**, with tilt `k(x♭)^` and the same value group ([Sch12] Corollary 6.7(ii);
[AWS] Corollary 2.5.7). Check: the uncompleted residue field at the Gauss point is not complete.

### P2.6 Stable uniformity and sheafiness

**Stably uniform and sheafy.** Every `O_X(U)` is uniform, `O_X` and `O_X⁺` are sheaves by the
Buzzard–Verberkmoes theorem (AdicSpaces layer 4.2), and rational Čech complexes of `O_X` are exact
(AdicSpacesPartIII R3), depending only on `R` ([KL15] Theorem 3.6.15; [KL16] Corollary 3.3.19;
[Berkeley] Theorem 6.1.10; [HK] Corollary 3.15). Huber's noetherian theorem does not apply ([AWS]
Corollary 2.9.3). Lean: `Perfectoid.isStablyUniform`, `Perfectoid.isSheafyRing`.

### P2.7 Almost acyclicity of `O⁺`

**The integral Čech complex is almost exact** for every finite rational covering of a rational
subset, with `(d⁰s)_{ij} = s_j − s_i`, so `H^i(U, O⁺)` is almost zero for `i > 0` ([Berkeley] proof
of Theorem 7.4.4; [Sch12] proof of Proposition 6.14; [KL16] Corollary 3.3.20). Supporting: almost
exactness lifts from modulo `ϖ` for complete torsion-free complexes; the integral complex of a
stably uniform sheafy pair has bounded torsion cohomology ([Sch12] proof of Proposition 6.10(iii));
Cartan's criterion modulo almost zero ([Stacks] Tag 01EW). Checks: `[ℚ_p → 0]` is exact modulo `p`
with `H⁰ ≠ 0`; `d⁰(2, 5) = 3` fixes the sign.

### P2.8 The sheaf theorem

**`O_X` acyclic, `O_X⁺` almost acyclic.** `O_X`, `O_X⁺` are sheaves, `H⁰(X, O_X) = R`,
`H^i(X, O_X) = 0`, `H⁰(X, O⁺) = R⁺` and `H^i(X, O⁺)` almost zero for `i > 0`, also on rational
subsets ([ECD] Theorems 3.18, 3.24; [Sch12] Theorem 6.3, Proposition 6.14; [AWS] Theorem 2.9.5).
The `p`-finite route: over a characteristic-`p` perfectoid field, completed perfections of reduced
affinoid algebras are acyclic by Tate's theorem, and every perfectoid affinoid algebra is a completed
colimit of `p`-finite ones with `Spa = lim Spa` ([Sch12] Definition 6.9, Propositions 6.10–6.11,
Lemma 6.13). Check: `K⟨T^{1/p^∞}⟩` is `p`-finite.

### P2.9 Affinoid perfectoid spaces

**Affinoid perfectoid space.** A pre-adic space isomorphic to `Spa(R, R⁺)` for a perfectoid pair;
global sections recover the pair (Tau Ceti `isIso_toPresentationLimit_top`), and `Spa` is an
anti-equivalence onto affinoid perfectoid spaces ([Wedhorn] Proposition 8.25; [Berkeley] Remark
7.1.3). The empty space qualifies. Checks: `Spa(ℂ_p, 𝒪_{ℂ_p})` is affinoid perfectoid,
`Spa(ℚ_p, ℤ_p)` is not. Lean: `PerfectoidSpace.isAffinoidPerfectoidModel`, `isAffinoidPerfectoid`,
`isAffinoidPerfectoid_presentationLimitPreAdicSpace`.

### P2.10 Perfectoid spaces

**`Perfd` and `Perf`.** A perfectoid space is a pre-adic space covered by affinoid perfectoid opens
([ECD] Definition 3.19; [Berkeley] Definition 7.1.2), an adic space by the sheaf theorem; `Perf`
is the full subcategory with `p = 0` in all sections. Opens of perfectoid spaces are perfectoid and
affinoid perfectoid opens form a basis ([Sch12] proof of Proposition 6.17; [Wedhorn] Remark 8.23);
in characteristic `p`, sections are perfect (Mihara, [Bhatt] Example 9.3.12); perfectoid spaces are
sousperfectoid (AdicSpacesPartIV R5). Checks: the empty space is perfectoid; `Spa(ℚ_p, ℤ_p)` and the
discrete `Spa(𝔽_p, 𝔽_p)` are not. Lean: `isPerfectoidSpace`, `Perfd`, `InCharP`, `Perf`,
`isAffinoidPerfectoid_le_isPerfectoidSpace`, `isPerfectoidSpace_le_isAdic`,
`isPerfectoidSpace_restrict`, `isBasis_affinoidPerfectoidOpens`.

### P2.11 The glued tilt

**`X ↦ X♭`.** Every perfectoid space has a tilt `X♭ ∈ Perf` with `|X| ≅ |X♭|`, glued from
affinoid tilts, functorial, compatible with opens, with multiplicative `♯ : O_{X♭} → O_X`, and
`X♭ ≅ X` on `Perf` ([Sch12] Definition 6.16, Proposition 6.17; [Bhatt] Theorem 9.3.10). Check:
`Spa ℚ_p^cycl` and `Spa 𝔽_p((t^{1/p^∞}))^` have isomorphic tilts.

### P2.12 The tilting equivalence

**`Perfd/X ≃ Perf/X♭`**, compatible with opens and affinoid perfectoid objects; maps `T → X♭`
correspond to untilts `T♯ → X` ([ECD] Corollary 3.20; [Berkeley] Theorem 7.1.4; [Sch12]
Proposition 6.17). Affinoid form: tilting pairs under `(A, A⁺)` is an equivalence carrying rational
localisations to rational localisations ([ECD] Theorems 3.13, 3.17; [Sch12] Lemma 6.2).

### P2.13 Completed tensor products

**`B ⊗̂_A C`.** The completed tensor product (AdicSpacesPartII R0) of perfectoid pairs is perfectoid,
the pushout in perfectoid pairs, commuting with tilting, with `D°` almost the completed image of
`B° ⊗ C°` ([AWS] Theorem 2.4.1; [KL16] Theorem 3.3.13; [Sch12] proof of Proposition 6.18); the
same in characteristic `p` for perfect rings. Checks: `ℂ_p ⊗̂_{ℚ_p} ℂ_p` is not uniform; for finite
Galois `L/K`, `L ⊗̂_K L ≅ ∏_G L`.

### P2.14 Uniform completed tensor products and dense images

**Over any Tate base.** `B ⊗̂ᵘ_A C` of perfectoid `B, C` over a complete Tate `A` is perfectoid
([KL16] Corollary 3.3.21); a complete uniform Tate ring receiving a dense-image map from a
perfectoid ring is perfectoid ([AWS] Lemma 2.8.4). Check: `K⟨T^{1/p^∞}⟩/(T)` is not reduced ([AWS]
Example 2.4.9).

### P2.15 Affinoid perfectoid fibre products

**`Spa(B ⊗̂_A C)`** is a fibre product in adic spaces, compatible with rational subsets and opens,
with `|W| → |Y| ×_{|X|} |Z|` surjective, not injective ([Sch12] proof of Proposition 6.18; [ECD]
Proposition 8.3). Check: `Spa L ×_{Spa K} Spa L` has `|G|` points.

### P2.16 Fibre products of perfectoid spaces

**`Perfd` has pullbacks**, computed in adic spaces, glued from affinoid pieces, with `Perf` and
affinoids closed under them and tilting commuting ([Sch12] Proposition 6.18; [Berkeley]
Proposition 8.2.5(3)). The plus ring is only almost the completed tensor product of plus rings
([Bhatt] Example 9.3.14). Lean: `PerfectoidSpace.hasPullbacks`.

### P2.17 Fibre products over an analytic base

**Over analytic `S`**, perfectoid `Y, Z` have a perfectoid fibre product, locally
`Spa(O_Y(U) ⊗̂ᵘ_A O_Z(V))`, agreeing with P2.16 over perfectoid `S` ([KL16] Corollary 3.3.21).
Check: over `Spa ℚ_p` the uniform `ℂ_p ⊗̂ᵘ ℂ_p` is used.

### P2.18 Absolute products in `Perf`

**`X × Y` in `Perf`** exists ([Berkeley] Lemma 8.3.5; [ECD] proof of Proposition 11.4), the fibre
product over the discrete `Spa 𝔽_p`, covered by `Spa(C_{m,n})` where `C_{m,n}` completes
`A ⊗_{𝔽_p} B` with `(A° ⊗ B°)[ϖ^m/ϖ', ϖ'^n/ϖ]` open, the plus ring being the completed integral
closure of `(A⁺ ⊗ B⁺)[ϖ^m/ϖ', ϖ'^n/ϖ]`; `Perf` has no final object. Check:
`Spa 𝔽_p((t^{1/p^∞})) × Spa 𝔽_p((s^{1/p^∞}))` is a punctured open disc. Lean:
`PerfectoidSpace.hasBinaryProducts_perf`.

### P2.19 Perfectoid spaces over a perfectoid field

**Scholze's category.** For a perfectoid field `K`, Scholze's perfectoid spaces over `K` form
`Perfd/Spa(K, K⁺₀)`, with his tilt, Proposition 6.17 and fibre products being P2.11, P2.12, P2.16
([Sch12] Definitions 5.1, 6.1, 6.15, Propositions 6.17–6.18). Check: a rank-two `K⁺` gives a space
over `K` with no map to `Spa(K, K°)`.

### Examples

The Lean `example` checks that the empty pre-adic space is perfectoid.

### Dependencies

P0, P1; Tau Ceti `PreAdicSpace` (`restrict`, `isAdic`, `isAffinoid`,
`presentationLimitPreAdicSpace`), `IsStablyUniform`, `IsSheafyRing`,
`PairOfDefinition.locUniformSpace`; AdicSpaces layers 3–5; AdicSpacesPartII R0; AdicSpacesPartIII
R3; AdicSpacesPartIV R5.

## Layer P3: almost purity and the étale site

Henselian approximation and the invariance of finite étale algebras under henselian completion and
completed colimits; almost purity in characteristic `p`; untilting of finite étale algebras;
finite extensions of perfectoid fields and Fontaine–Wintenberger; the almost purity theorem; finite
étale and étale morphisms of perfectoid spaces, the comparison with AdicEtaleGeometry A1, and `X_ét`
with its tilting equivalence and almost acyclicity of `O⁺`. `FÉt(R)` is Mathlib's
`CommAlgCat.FiniteEtale R`.

### P3.1 Henselian approximation

**Elkik's theorem.** For a noetherian henselian pair `(A, 𝔍)` and `B` smooth off `V(𝔍)`, a completed
section lifts to an `A`-section congruent modulo `𝔍ⁿ`; in polynomial form, approximate solutions
with `J(a⁰) ⊆ 𝔍ⁿ` and Elkik Jacobian `H_B(a⁰) ⊇ 𝔍^h` lift modulo `𝔍^{n−r}` ([Elkik] Théorèmes 2,
2 bis); over any henselian pair, smooth sections lift ([Stacks] Tag 0H74). Non-noetherian inputs:
Newton approximation over `tI`-adically complete rings and density of `X(R[1/t])` in
`X(R^∧[1/t])` for smooth quasi-projective `X` ([GR] Lemma 5.4.8, Propositions 5.4.13, 5.4.30);
henselian pairs and filtered colimits (AdicEtaleGeometry A4). Checks: `X² − 7` over `ℤ_(p)^h` lifts
with `r = 0`; over `𝔽_2`, `X² − 1` has zero Jacobian ideal.

### P3.2 Finite étale algebras under henselian completion

**`FÉt(R[1/t]) ≃ FÉt(R^∧[1/t])`** for a nonzerodivisor `t` and henselian `(R, tI)`, compatible with
tensor products, ranks and splitness ([GR] Proposition 5.4.54, Theorem 5.4.38, Lemmas
5.4.45–5.4.53); for topologically henselian Tate rings `FÉt(A) ≃ FÉt(Â)` ([Berkeley] Theorem 7.4.8;
[Sch12] Proposition 7.4); for filtered diagrams of complete Tate rings,
`2-colim FÉt(A_j) ≃ FÉt(L̂)` ([Sch12] Lemma 7.5(i)). Check: the dual-number law is not étale.

### P3.3 Almost purity in characteristic `p`

**Finite étale over a perfect complete Tate ring.** For `R` perfectoid of characteristic `p` and
`S ∈ FÉt(R)`: `S` is perfect, uniform and perfectoid, `S°` is the integral closure of `R°`, `S°a` is
almost finite étale and uniformly almost finite projective over `R°a`, and faithfully flat `S` is
almost split ([Sch12] Proposition 5.23; [GR] Theorem 3.5.28); `S°` need not be finite or flat.
Étale algebras over perfect rings are perfect ([Bhatt] Lemma 4.3.8); finite étale algebras over
complete uniform Tate rings are uniform ([AWS] Lemma 1.10.1). Check: `ℂ_2[ε]/ε²` is not étale and
not uniform. Lean: `perfectRing_of_etale`.

### P3.4 Characteristic `p`: inverting `ϖ`

**`(R°a)_afet ≃ FÉt(R)`** by `A ↦ A_*[1/ϖ]` with inverse `S ↦ S°a`, compatible with tensor
products and faithful flatness ([GR] 3.5.26, Theorem 3.5.28). Check: inverting `p = 0` instead of
`ϖ` changes the output.

### P3.5 Untilting finite étale algebras

**`T ↦ T♯`.** Through `FÉt(R♭) ≃ (R♭°a)_afet → (R♭°a/ϖ♭)_afet = (R°a/ϖ)_afet ≃ (R°a)_afet → FÉt(R)`,
untilting is a functor with `(T♯)♭ ≅ T`, independent of `ϖ♭`, compatible with products, ranks and
base change; `T♯ = W(T⁺)[1/[ϖ♭]]/ξ` ([Sch12] Proposition 5.22; [KL15] Lemma 3.6.20; [AWS] Lemma
2.8.10; [ECD] Theorem 6.1). Check: over `ℚ_p(p^{1/p^∞})^`, `(K♭[u]/(u² − t))♯ ≅ K[u]/(u² − p)` for odd
`p`.

### P3.6 Untilting is fully faithful

**Essential image**: perfectoid `S ∈ FÉt(R)` with `S°a` almost finite étale ([Sch12] Theorem 5.25).

### P3.7 Finite extensions of perfectoid fields

**Finite extensions are perfectoid.** Every finite extension of a perfectoid field is perfectoid,
`FÉt(K♭) ≃ FÉt(K)` preserves degrees and Galois extensions, `K` is algebraically closed iff `K♭`
is, and `L°a` is almost finite étale over `K°a` ([Sch12] Theorem 3.7, Proposition 3.8; [GR] §6.6).
Check: for `L = K(p^{1/ℓ})` over the completion of `ℚ̆_p(μ_{p^∞})`, `L° ⊗ L° → (L°)^ℓ` is not
surjective. Lean: `IsPerfectoidField.of_finiteDimensional`, `isPerfectoidField_of_isAlgClosed`.

### P3.8 Fontaine–Wintenberger

**`Gal(K̄/K) ≅ Gal(K♭^sep/K♭)`** compatibly with the Galois correspondences ([Sch12] Theorem 1.1);
finite étale algebras are insensitive to completed perfection in characteristic `p` ([Sch12] Lemma
7.5(ii)). Checks: `G_{ℚ_p(p^{1/p^∞})} ≅ G_{𝔽_p((t))}` with `K(√p) ↔ K♭(√t)`; at `p = 2`, `K(ζ_3)`
matches the Artin–Schreier `u² − u = 1`.

### P3.9 The tilting equivalence of finite étale algebras

**`FÉt(R) ≃ FÉt(R♭)`**, inverse to `S ↦ S♭`, compatible with tensor products, base change, ranks and
finite étale maps of pairs ([ECD] Theorem 6.1(ii)); finite étale algebras over a completed residue
field spread out to a neighbourhood ([Berkeley] Lemma 7.4.6).

### P3.10 Finite étale algebras over a perfectoid ring are perfectoid

**Perfectoidness of `S`.** With its finite-module topology, `S ∈ FÉt(R)` is a perfectoid Tate ring,
`(S, S⁺)` is a perfectoid pair and `Spa(S, S⁺) → Spa(R, R⁺)` is finite étale ([ECD] Theorem 6.1(i);
[Berkeley] Theorem 7.4.5(1)). Lean: `isPerfectoidTateRing_of_finiteEtale`.

### P3.11 Almost purity, categorical form

**`(R°a)_afet ≃ FÉt(R)`** in all characteristics, Scholze's six categories composing to tilting, and
`(R⁺a)_afet ≃ (R°a)_afet` ([Sch12] Theorem 7.9; [ECD] Theorem 6.1).

### P3.12 The integral closure is almost finite étale

**`S°` over `R°`.** `S°` is the integral closure of `R°`, `S°a` is almost finite étale and uniformly
almost finite projective (one `n` with `S° → (R°)ⁿ → S°` composing to `ε` for each `ε ∈ R°°`), with
almost perfect trace pairing and almost splitting for faithfully flat `S` ([ECD] Theorem 6.1(iii);
[Sch12] Proposition 5.23, Theorem 7.9(iii)). Check: on `K × K → K` the trace sends `x` to `(x, 0)`.
Lean: `exists_uniformlyAlmostFiniteProjective_powerBounded`.

### P3.13 The almost purity theorem

**Almost purity** ([ECD] Theorem 6.1) is P3.9–P3.12 together. Checks: `S = R × R` has `n = 2`;
`ℚ_p^cycl(p^{1/ℓ})°` is almost finite étale but not finite free.

### P3.14 Finite étale morphisms of perfectoid spaces

**Finite étale maps** are those of AdicEtaleGeometry A1, equivalently `f⁻¹(Spa(R, R⁺)) = Spa(S, S⁺)`
with `S ∈ FÉt(R)` and `S⁺` the integral closure ([ECD] Definition 6.2(i); [Sch12] Definition
7.1(ii)). Checks: the Kummer cover of the perfectoid torus is finite étale; `{|T| ≤ |p|} ↪` the disc
is not.

### P3.15 Étale morphisms of perfectoid spaces

**Étale maps** are locally open immersion, finite étale, open immersion ([ECD] Definition 6.2(ii);
[Sch12] Definition 7.1(iii)); they need not be separated or quasi-compact. Check: the doubled disc
over `X` is étale and not separated.

### P3.16 Strongly étale morphisms

**Strong classes**, with `S°a` almost finite étale, are tilting-invariant, stable under base change
and composition, and coincide with the ordinary classes ([Sch12] Definition 7.2, Lemma 7.3,
Corollary 7.8).

### P3.17 Comparison with AdicEtaleGeometry A1

**The definitions agree.** Spaces étale over a perfectoid space are perfectoid; A1's, [ECD] 6.2's,
[Sch12] 7.1's and [Berkeley] 7.5.1's classes agree; A1's sites, sheaves and affinoid basis apply;
perfectoid Tate rings are strongly sheafy, every `R⟨T_1, …, T_n⟩` being stably uniform ([Sch12] Lemma
7.3, Propositions 7.6, 7.10; [Berkeley] Propositions 6.3.3–6.3.4).

### P3.18 The étale site

**`X_ét` and `X_fét`.** The small étale site with affinoid perfectoid basis and finite limits;
`O`, `O⁺`, `O⁺/ϖ` and `O^{+a}` are sheaves; for connected `X`, `X_fét` is a Galois category; étale
maps compose, base change, cancel and are open ([ECD] Definition 6.2; [Sch12] Definition 7.11;
[Berkeley] Proposition 7.5.2). Check: `Spa(C, 𝒪_C)_ét ≃ Set` for algebraically closed `C`.

### P3.19 Étale descent

**Descent on `X_ét`.** Finite étaleness is local, `U ↦ U_fét` is a stack, and finite projective
`R`-modules are the finite locally free `O_{X_ét}`-modules (AdicSpacesPartIV R5; [KL15] Theorems
1.3.4–1.3.5, 8.2.22).

### P3.20 Tilting the étale site

**`X_ét ≃ X♭_ét`** and `X_fét ≃ X♭_fét`, as sites and topoi, functorial, identifying `O⁺/ϖ` with
`O⁺_{X♭}/ϖ♭` ([ECD] Theorem 6.3). Check: at scale `p²` the identification fails on `Spa ℂ_p`.

### P3.21 Almost acyclicity on the étale site

**`O⁺` on `X_ét`.** For affinoid perfectoid `X`, `H⁰(X_ét, O⁺) = R⁺`, `H^i(X_ét, O⁺)` is almost zero
and `H^i(X_ét, O) = 0` for `i > 0` ([ECD] Theorem 6.3; [Sch12] Proposition 7.13). Check: for a
Galois cover, `H^i(G, O⁺(Y))^a = 0`.

### P3.22 The tilting equivalence with almost acyclicity

**[ECD] Theorem 6.3** is P3.20 with P3.21. Check: over `Spa ℚ_p(p^{1/p^∞})^`,
`H^i(G_K, 𝒪_{K^sep})` is almost zero.

### Examples

The Lean `example` checks that `R × R` is perfectoid.

### Dependencies

P0–P2; AdicEtaleGeometry A1, A4; AdicSpacesPartIV R5; Mathlib `HenselianRing`,
`CommAlgCat.FiniteEtale`, `Algebra.Etale`, `IsModuleTopology`, `PerfectRing`, `IsAlgClosed`.

## Layer P4: injections, immersions and separatedness

Field-valued points, injections and the qcqs isomorphism criterion, immersions, Zariski closed
immersions and the universal perfectoid space over a Zariski closed subset, the theorem that
Zariski closed immersions are strongly Zariski closed, diagonals and separatedness with its
valuative criterion, and tilting invariance. Morphisms are those of `Perfd` (P2.10).

### P4.1 Affinoid perfectoid fields and their points

**Field points.** An affinoid perfectoid field is a perfectoid field `K` with an open bounded
valuation subring `K⁺`; `|Spa(K, K⁺)|` is the chain of valuation rings between `K⁺` and `K°`;
`X(K, K⁺) := Hom(Spa(K, K⁺), X)`, maps of pairs for affinoid `X` ([ECD] Proposition 5.3(ii);
[Berkeley] Proposition 8.3.3). Checks: `Spa(K, K°)` is one point; a rank-two `K⁺` gives two points
with only `K⁺` closed.

### P4.2 Quasicompact and quasiseparated morphisms

**qcqs maps**, defined by quasi-compact preimages and quasicompact diagonals, stable under
composition and base change, agreeing with AdicSpacesPartII R0 ([ECD] after Proposition 5.11).
Check: the open unit disc in the closed perfectoid disc is not quasicompact.

### P4.3 Injections

**Injections are monomorphisms.** `f` is an injection if `Hom(Z, Y) → Hom(Z, X)` is injective for
(affinoid) perfectoid `Z`, equivalently a monomorphism of `Perfd`, equivalently `Δ_f` is an
isomorphism ([ECD] Definition 5.1). Annulus rings with compatible roots are perfectoid ([BMS] Lemma
3.21). Checks: rational open immersions are injections; `Spa L → Spa K` for quadratic `L/K` is
bijective but not an injection.

### P4.4 Filtered intersections of rational subsets

**Pro-rational subspaces.** For a filtered family of rational subsets with intersection `T`, the
completed colimit `(S, S⁺)` of the `O⁺(U)` is a perfectoid pair with `Spa(S, S⁺) ≅ T`, the limit of
the `U` and an injection through which maps landing in `T` factor ([ECD] Proposition 6.5, Example
5.2; [Bhatt] Proposition 9.4.1). Supporting: an almost Frobenius criterion for perfectoidness
(extending [Sch12] Lemmas 5.6–5.7). Check: `{|ϖ^{1/pⁿ}| ≤ |T|}` on the disc gives `C⟨T^{±1/p^∞}⟩`.

### P4.5 The completed residue field point

**`i_x : Spa(K(x), K(x)⁺) → X`** is the pro-rational subspace of the neighbourhoods of `x`, an
injection onto the generalisations of `x`, universal among field points centred at `x` ([ECD]
Example 5.2; [Torsion] Lemma II.3.1). Check: at the Gauss point `i_η` is not an immersion.

### P4.6 The qcqs isomorphism criterion

**Isomorphisms of qcqs maps.** A qcqs `f` is an isomorphism iff bijective on points with
isomorphic rank-one residue fields, iff bijective on `(K, K⁺)`-points, iff on `(C, C⁺)`-points for
algebraically closed `C` ([ECD] Lemma 5.4, proof of Proposition 5.3). Check: the open disc plus its
pro-rational complement maps bijectively onto the closed disc, without being an isomorphism.

### P4.7 Characterisations of injections

**By points.** `f` is an injection iff injective on `(K, K⁺)`- or `(C, C⁺)`-points, iff `|f|` is
injective with isomorphic rank-one residue fields; injections are determined by their image ([ECD]
Proposition 5.3(iii)–(iv); [Berkeley] Proposition 8.3.3(3)).

### P4.8 Base change of injections

**Pullbacks** of injections are injections with `|Y'| ≅ |X'| ×_{|X|} |Y|` ([ECD] Corollary 5.5(i)).

### P4.9 Universally injective maps

**Injection ⇔ universally injective** on underlying spaces: `|Y ×_X Z| → |Z|` is injective for
every `Z → X` ([ECD] Corollary 5.5(ii)).

### P4.10 Immersions

**Immersions** are injections with `|f|` an embedding onto a locally closed subset; closed
immersions are quasicompact ([ECD] Definition 5.6). Check: the origin of the perfectoid disc is a
closed immersion.

### P4.11 Open immersions agree with AdicSpaces'

**Comparison.** Open immersions are Tau Ceti's `PreAdicSpace.IsOpenImmersion` between perfectoid
spaces ([ECD] Proposition 5.3(iv)).

### P4.12 Zariski closed subsets

**`V(I)`.** For affinoid perfectoid `X` and an ideal `I`, `V(I) = {x : |g(x)| = 0 ∀g ∈ I}`, closed,
pro-constructible, generalisation-stable, depending on the closed radical of `I`; a Zariski closed
immersion is a closed immersion onto some `V(I)` ([Torsion] Definition II.2.1; [ECD] Definition
5.7(i)). Checks: over `ℂ_p`, `V((T − 1))` on the perfectoid torus is `ℤ_p`; `V(R) = ∅`.

### P4.13 Strongly Zariski closed immersions

**Surjective perfectoid quotients.** `Spa(S, S⁺) → Spa(R, R⁺)` with `R → S` surjective onto a
perfectoid ring and `S⁺` the integral closure of the image of `R⁺` ([ECD] Definition 5.7(ii)).
Check: `Spa(R, R°) → Spa(R, R⁺)` for `R⁺ ⊊ R°` is not one.

### P4.14 The universal perfectoid space over a Zariski closed subset

**`Z_I`.** The pro-rational subspace of the `U_F`, `F ⊆ I` finite, is affinoid perfectoid,
homeomorphic onto `V(I)`, universal for maps killing `I`, with kernel `{h : |h| = 0 on V(I)}`
([Torsion] Lemma II.2.2; [Bhatt] Proposition 9.4.1). Checks: `I = (T − 1)` over `ℂ_p` gives
`C⁰(ℤ_p, ℂ_p)` ([AWS] Example 2.4.10); `F = {0, ϖ⁻¹}` gives the empty set.

### P4.15 Zariski closed equals strongly Zariski closed

**[ECD] Theorem 5.8.** For any ideal `I`, `R → S_I` is surjective, `S_I⁺` is the integral closure of
the image, and `R⁺ → S_I⁺` is almost surjective ([BS22] Corollary 7.3, Theorem 7.4). The input is
perfectoidisation of semiperfectoid rings, applied to `(R⁺/(I ∩ R⁺))^∧_ϖ`; (strongly) Zariski closed
immersions base change ([Torsion] Lemma II.2.9). Check: derived `p`-completeness fails for `ℚ`.
Lean: `exists_surjective_perfectoidQuotient`.

### P4.16 Comparison with AdicSpaces' closed immersions

**Quotient immersions.** Strongly Zariski closed maps are Tau Ceti's `Spa(Pair.quotient …) → X` for
closed `J` with perfectoid `R/J`, and globally AdicSpacesPartII R0's `AdicSpace.IsClosedImmersion` on
perfectoid spaces ([AWS] Example 2.4.9).

### P4.17 Closed immersions versus Zariski closed immersions

**Different notions.** The closure of `{|T| = 1}` in the perfectoid disc is the image of a closed
immersion that is not Zariski closed ([Berkeley] after Definition 17.4.2).

### P4.18 The diagonal is an immersion

**`Δ_f`** is a split mono, locally strongly Zariski closed, hence an immersion ([ECD] Proposition
5.9).

### P4.19 Separated morphisms

**Separatedness.** `f` is separated if `Δ_f` is a closed immersion (`MorphismProperty.diagonal`);
separated maps are quasiseparated, include injections, compose and base change, and agree with
AdicSpacesPartII R0's `AdicSpace.IsSeparated` ([ECD] Definition 5.10; [HJ] Definition 5.4). Check:
two discs glued along `{|ϖ| ≤ |T|}` are not separated.

### P4.20 The valuative criterion

**Field points.** `f` is separated iff quasiseparated with unique lifts of `Spa(K, K⁺) → X` extending
`Spa(K, 𝒪_K) → Y` ([ECD] Propositions 5.11, 10.10).

### P4.21 Tilting

**Tilting invariance.** Injections, immersions, (quasi)separatedness and strong Zariski closedness
hold for `f` iff for `f♭` ([Torsion] Lemma II.2.7; [AWS] Theorem 2.4.4, Corollaries 2.4.5–2.4.6).

### Examples

The Lean `example` checks that a map killing the unit ideal has zero target, fixing the vanishing
convention of the universal quotient.

### Dependencies

P1–P3; Tau Ceti `Pair.quotient`, `Pair.Hom.spaComap`, `PreAdicSpace.IsOpenImmersion`;
AdicSpacesPartII R0; Mathlib `Mono`, `pullback.diagonal`, `IsLocallyClosed`. PerfectoidTowers P8
owns the global Zariski closed notion; DiamondsAndVStacks D0, D3 consume this layer.

## Layer P5: cofiltered limits and finite-stage étale descent

The completed direct limit of a cofiltered system of perfectoid Tate pairs, the limit
`Spa(R, R⁺) = lim X_i` with underlying space the inverse limit, finite-stage descent of rational
subsets and quasi-compact opens, the absence of completion for `ω₁`-cofiltered systems, the
countably generated decomposition, and finite-stage descent of finite étale, qcqs étale and
quasi-compact separated étale objects. `I` is small cofiltered and `X_i = Spa(R_i, R_i⁺)` affinoid
perfectoid with continuous transition maps (no injectivity or density assumed).

### P5.1 The completed direct limit

**`(R, R⁺)`.** On a tail the system has a compatible pseudouniformiser `ϖ` with roots and
`ϖ^p | p` ([ECD] Proposition 6.4, Lemma 3.10); `R⁺ := (colim R_i⁺)^∧_ϖ`, `R := R⁺[1/ϖ]` is
independent of choices, `R⁺/ϖⁿ = colim R_i⁺/ϖⁿ`, the stage images are dense, and `(R, R⁺)` is
universal for compatible maps to complete Tate pairs ([ECD] Proposition 6.4; [Sch12] proof of Lemma
6.13; [KL15] Definition 2.6.1). Completion preserves integral closedness in `A[1/ϖ]` ([Bhatt] Lemmas
5.1.1–5.1.2; [Stacks] Tag 05GG). Checks: for `S = lim {0,1}ⁿ`, `R = C^0(S, K)` and `Σ s_k ϖ^k` lies in
no stage; `T^{1/p^m} ↦ ϖ^{1/p^m}T^{1/p^m}` on `K⟨T^{1/p^∞}⟩` gives non-injective `ι_i`.

### P5.2 The completed direct limit is perfectoid

**Perfectoidness.** `R` is uniform, `R⁺` is integral perfectoid, `(R, R⁺)` is a perfectoid pair whose
tilt is the completed limit of the tilts ([ECD] Proposition 6.5; [BMS] Lemmas 3.10, 3.20, 3.21).
Check: `C^0(S, K)° = C^0(S, 𝒪_K)` ([Sch13] proof of Lemma 4.6).

### P5.3 Cofiltered limits of affinoid perfectoid spaces

**`X = Spa(R, R⁺) = lim X_i`** in perfectoid spaces, with `O(X) = R`, `O⁺(X) = R⁺` ([ECD] Proposition
6.5, Example 5.2); the universal property uses that `O⁺(Y)` is `ϖ`-adically complete for perfectoid
`Y`. Checks: `lim ({0,1}ⁿ × Spa K) = Spa C^0(S, K)`; `(LC(S, K), LC(S, 𝒪_K))` has the same spectrum
but is not the global sections.

### P5.4 The underlying space of the limit

**`|X| ≅ lim |X_i|`**, a homeomorphism of spectral spaces with every rational subset coming from a
finite stage ([ECD] Proposition 6.4(o); [Sch12] Lemma 6.13(ii)). Supporting: `Spa(colim) ≅ lim Spa`
for Tate pairs, also after completion ([KL15] Remark 2.6.3; [Wedhorn] Proposition 7.48);
quasi-compact opens, constructible sets and finite covers of spectral limits descend ([Stacks] Tags
0A30, 0A2Y; [KL15] Remark 2.6.7); restriction to a finite-stage rational subset is the limit of the
restrictions ([Sch12] Lemma 6.13(iii)). Check: `S ∖ {s}` in the Cantor set descends to no stage.

### P5.5 `ω₁`-cofiltered limits need no completion

**No completion.** Along an `ℵ₁`-filtered diagram of `t_j`-adically complete rings the colimit is
`t`-adically complete, so for `ω₁`-cofiltered `I`, `O(lim X_i) = colim O(X_i)` ([ECD] Proposition 6.5,
proof of Proposition 8.5). Check: for `I = ℕ^op` this fails. Lean:
`isAdicComplete_colimit_of_isCardinalFiltered`.

### P5.6 Countably generated decomposition

**`ω₁`-presentations.** Every countable subset of a perfectoid Tate ring lies in a closed,
topologically countably generated perfectoid subring of size `≤ 2^{ℵ₀}`; these form an `ω₁`-directed
family, so every affinoid perfectoid space is an `ω₁`-cofiltered limit of such ([ECD] Proposition
6.5, Remark 4.3). Check: for `S = {0,1}^{ℵ₁}` no `ℕ`-indexed tower suffices.

### P5.7 Cardinal bounds

**`κ`-smallness of limits.** For a cutoff `κ`, fewer than `λ < κ` index arrows and stage rings
bounded by a strong limit `κ' < κ`, the limit is `κ`-small ([ECD] Proposition 6.4, Lemma 4.1).
Check: `|C^0({0,1}^ℕ, ℂ_p)| = 2^{ℵ₀}`.

### P5.8 Filtered 2-colimits of categories

**`2-colim_j C_j`.** For a pseudofunctor on a small filtered category, objects `(i, x)` with
`Hom = colim Hom(F_a x, F_b y)` over cospans form the pseudo-colimit, with eventual criteria for
faithfulness, fullness and essential surjectivity of induced functors ([Berkeley] Remark 7.4.7;
[KL15] Remark 1.2.9). Check: finitely presented modules over a filtered colimit of rings ([Stacks]
Tag 05N7).

### P5.9 Finite étale objects come from a finite stage

**`2-colim (X_i)_fét ≃ X_fét`**, in ring form `2-colim FÉt(R_i) ≃ FÉt(R)` (AdicEtaleGeometry A4 with
P3.2) ([ECD] Proposition 6.4(i); [Sch12] proof of Lemma 7.5(i)). Check: finitely presented algebras
need not descend: `C^0(S, K)/(Σ s_k ϖ^k)` is not flat.

### P5.10 Quasicompact quasiseparated étale objects

**`2-colim (X_i)_ét,qcqs ≃ X_ét,qcqs`** ([ECD] Proposition 6.4(ii)): faithful by graphs, full by graph
approximation, essentially surjective by gluing. Check: the complement of `{s₀} × Spa K` in
`S × Spa K` is not quasi-compact and does not descend.

### P5.11 Quasicompact separated étale objects

**`2-colim (X_i)_ét,qc,sep ≃ X_ét,qc,sep`**: separatedness is recognised at a finite stage ([ECD]
Proposition 6.4(iii)). Check: two discs glued along `{|T| ≤ |ϖ|²}` become separated one stage up.

### P5.12 Finite-stage descent

**[ECD] Proposition 6.4(i)–(iii)** is P5.9–P5.11 together; surjectivity and isomorphism of qcqs
étale maps are detected at a finite stage ([ECD] Proposition 5.3(iv)).

### Examples

Layer P5 carries no Lean `example`; its Checks are the computations above.

### Dependencies

P1–P4; AdicEtaleGeometry A1, A3, A4; Tau Ceti `Pair.Hom.spaComap`, `IsProConstructible`; Mathlib
`AdicCompletion`, `IsAdicComplete`, `IsCardinalFiltered`, `SpectralSpace`, `Pseudofunctor`.
DiamondsAndVStacks D0–D3 consume these results.

## Layer P6: κ-small perfectoid spaces and pro-étale morphisms

Size and pro-étale notions for DiamondsAndVStacks: κ-small and uniformly κ-small perfectoid spaces
for an uncountable strong limit `κ`, the cover criterion and closure properties, affinoid pro-étale
and pro-étale morphisms, products with profinite sets, the pro-category description of
`X_proét^aff` and its κ-bounded form, and the stability of pro-étale morphisms. Cutoff cardinals
are those of [ECD] Lemma 4.1, which may be singular.

### P6.1 κ-small perfectoid spaces

**κ-smallness.** `X` is κ-small if `#|X| < κ` and `#O_X(U) < κ` for every open affinoid perfectoid
`U` ([ECD] Definition 4.2, p. 20); the predicate is isomorphism-invariant and monotone in `κ`, and
κ-small spaces form an essentially small category. Mathlib's `Cardinal.IsStrongLimit` counts `ℵ₀`,
so `ℵ₀ < κ` is a separate hypothesis. Checks: `Spa ℂ_p` is κ-small for uncountable strong limit `κ`
and not `ℵ₀`-small; `⊔_κ Spa ℂ_p` is not κ-small. Lean: `PerfectoidSpace.IsKappaSmall`,
`IsKappaSmall.mono`, `IsKappaSmall.restrict`.

### P6.2 Uniformly κ-small perfectoid spaces

**Uniform bound.** `X` is uniformly κ-small if one `λ < κ` bounds `#|X|` and all `#O_X(U)`; this
implies κ-small, quasi-compact κ-small spaces are uniformly κ-small, and the notions differ for
singular `κ` ([ECD] Proposition 6.4, proof of Lemma 4.1). Size estimate: a Hausdorff first-countable
uniform group with a dense subset of size `≤ λ` has completion of size `≤ λ^{ℵ₀}` ([ECD] Remark 4.3),
so rational localisations, finite étale algebras and completed tensor products of rings of size
`< κ` have size `< κ`. Check: for `cf κ = ω₁`, `⊔_{α<ω₁} Spa K_α` with `#K_α` cofinal is κ-small, not
uniformly. Lean: `IsUniformlyKappaSmall`, `IsUniformlyKappaSmall.isKappaSmall`,
`completion_cardinality_bound`.

### P6.3 The cover criterion

**Covers and κ-smallness.** A κ-small `X` has a cover by fewer than `κ` open affinoids with rings
of size `< κ`; conversely such a cover with a uniform bound gives uniform κ-smallness; `Spa(A, A⁺)`
is κ-small iff `#A < κ` ([ECD] Proposition 4.4), with `#Spa(A, A⁺) ≤ 2^{#A·#A}`. Lean:
`isKappaSmall_presentationLimit_iff`.

### P6.4 Closure properties

**Opens, unions, fibre products, tilting.** Opens, small uniformly bounded disjoint unions and fibre
products of uniformly κ-small spaces are uniformly κ-small ([ECD] Proposition 4.4), while for
`cf κ = ω₁` a self-fibre product of κ-small spaces can fail to be κ-small; tilting preserves
(uniform) κ-smallness, `#A♭ ≤ (#A)^{ℵ₀}`; an affinoid perfectoid space over `Spa(R, R⁺)` with
`#R < κ` is the cofiltered limit of its closed perfectoid subpairs of size `< κ` ([ECD] proofs of
Propositions 6.5, 8.2).

### P6.5 Affinoid étale objects at a finite stage

**[ECD] Proposition 6.4(iv).** For `X = lim X_i`, `2-colim (X_i)_ét^aff ≃ X_ét^aff`
(AdicEtaleGeometry A3); étale surjections are surjective at a finite stage, and finite-stage models
become affinoid ([ECD] proofs of Lemmas 7.11(i), 7.18).

### P6.6 Affinoid pro-étale morphisms

**Pro-étale presentations.** `Y → X` of affinoid perfectoid spaces is affinoid pro-étale if
`Y ≅ lim Y_i` over `X` for a small cofiltered diagram of affinoid perfectoid spaces étale over `X`
([ECD] Definition 7.8(i); [Berkeley] Definition 8.2.1); then `|Y| = lim |Y_i|`. Checks: rational
inclusions and finite étale maps are affinoid pro-étale; the origin of the perfectoid disc is
affinoid pro-étale and not étale; the open unit disc is not.

### P6.7 Pro-étale morphisms

**Local form.** `f` is pro-étale if locally affinoid pro-étale on affinoid perfectoid
neighbourhoods; local on the source, not for the pro-étale topology ([ECD] Definition 7.8(ii);
[Berkeley] Definition 8.2.1). Check: `X × S → X` for locally profinite `S` is pro-étale.

### P6.8 Products with profinite sets

**`X × S`.** For affinoid perfectoid `X` and profinite `S`, `X × S := lim X × S_k` is affinoid
pro-étale over `X`, represents continuous maps `|T| → S`, with `|X × S| = |X| × S` and
`O(X × S) = C⁰(S, O(X))`; relative and locally profinite versions glue ([ECD] Example 11.12;
[Berkeley] Example 8.2.2). Checks: finite `S` gives `⊔_S X`; for infinite `S`, `X × S ≠ ⊔_S X`.

### P6.9 The pro-category equivalence

**`Pro(X_ét^aff) ≃ X_proét^aff`** by realisation, with Mathlib's `(Ind (X_ét^aff)ᵒᵖ)ᵒᵖ` as
pro-category ([ECD] Proposition 7.10; [Berkeley] Lemma 8.2.4). Supporting: `X_ét^aff` is essentially
small with objects of size `≤ (#R + ℵ₀)^{ℵ₀}`; maps from limits to qcqs étale spaces factor through
a stage; the canonical presentation is cofiltered ([ECD] Lemma 7.13). Check: over `Spa(C, 𝒪_C)`,
`Pro(FinSet) ≃ Profinite`.

### P6.10 κ-small affinoid pro-étale spaces

**`Pro_κ`.** `Pro_κ(C)` consists of pro-objects with a cofiltered presentation of fewer than `κ`
arrows; for κ-small `X`, `Pro_κ(X_ét^aff) ≃ X_proét,κ^aff`, and every affinoid pro-étale `Y` is a
directed limit of κ-small ones ([ECD] Proposition 7.10, proof of Proposition 8.2); Zariski closed
immersions are affinoid pro-étale ([ECD] Remark 7.9). Checks: `Pro_0` is empty; a constant
pro-object lies in `Pro_2`. Lean: `PerfectoidSpace.HasKappaSmallPresentation`, `ProKappa`,
`HasKappaSmallPresentation.of_diagram`.

### P6.11 Zariski closed equals strongly Zariski closed

**Consequences of P4.15.** For `R = ℂ_p⟨T^{±1/p^∞}⟩` and `I = (T − 1)`, `R ↠ C⁰(ℤ_p, ℂ_p)`
(Fresnel–de Mathan), correcting [Torsion] Remark II.2.4: the Fourier map from the completed group
algebra is surjective, not bounded below ([ECD] Theorem 5.8; [AWS] Theorem 2.9.12). Sections of
affinoid pro-étale maps are affinoid pro-étale ([ECD] proof of Lemma 7.11).

### P6.12 Limits in the affinoid pro-étale category

**Small limits.** `X_proét^aff` has all small limits, computed in perfectoid spaces and matching
those of the pro-category; affinoid pro-étale maps base change, compose and cancel ([ECD] Lemma
7.11; [Berkeley] Proposition 8.2.5(3)).

### P6.13 Stability of pro-étale morphisms

**Composition, base change, cancellation.** Pro-étale maps compose, base change, cancel and contain
étale maps, with `Y_proét ≃ X_proét/Y`; diagonals are pro-étale ([ECD] Lemma 7.11, Remark 7.9;
[Berkeley] Proposition 8.2.5).

### P6.14 Comparison with Scholze 2013

**Scholze's `X_proét`.** For a locally noetherian adic space over a characteristic-zero perfectoid
field, an affinoid perfectoid object `U = lim U_i` of Scholze's pro-étale site gives an affinoid
pro-étale space over its completion `Û`, functorially; no converse is asserted ([Sch13] Definition 4.3, Lemmas 4.5–4.6;
[Sch13E]).

### Examples

The Lean `example`s check that no space is `0`-small and that `ProKappa 0` is empty.

### Dependencies

P2–P5; AdicEtaleGeometry A1, A3; Mathlib `Cardinal`, `Ind`, `IsCofiltered`, `Profinite`,
`UniformSpace.Completion`, `FirstCountableTopology`. DiamondsAndVStacks D0–D2, D4, D6 consume this
layer.

## Layer P7: tilde-limits and Frobenius-controlled towers

Tilde-limits `X ~ lim X_i` of analytic adic spaces and their perfectoid and residue-field forms,
good affinoid perfectoid subsets, Frobenius-controlled towers with the perfectoid Frobenius
criterion, preperfectoid spaces, cofinality witnesses, uniqueness, locality and base change,
limits of towers, the étale-topos comparison, and the regular towers of Česnavičius.
AdicSpacesPartIV R5 owns the intrinsic tilde-limit relation; this layer adds the perfectoid
specialisations.

### P7.1 Tilde-limits of analytic adic spaces

**`X ~ lim X_i`.** For a cofiltered diagram of analytic adic spaces with qcqs transitions and a cone
from `X`: `|X| → lim |X_i|` is a homeomorphism, and locally the finite-level affinoid rings have
dense image ([SW13] Definition 2.4.1); this agrees with R5's relation on analytic spaces. Checks:
`Spa ℂ_p⟨T^{±1/p^∞}⟩ ~ lim Spa ℂ_p⟨T^{±1/pⁿ}⟩`; `Spa ℂ_p → Spa ℚ_p` fails density.

### P7.2 Perfectoid tilde-limits

**Perfectoid apex.** A tilde-limit with `X` perfectoid; the `X_i` may lie over `ℚ_p` ([CHJ] Theorem
2.8); `X ~ X_0` does not force `X ≅ X_0` ([SW13] after Proposition 2.4.4); agrees with Huber's
notion on qcqs spaces ([Huber96] Definition 2.4.2). Check: `D_n ⊔ D_n` with one summand's cone has
dense image but the wrong points.

### P7.3 Residue-field tilde-limits

**`X ~′ lim X_i`.** For qcqs locally noetherian `X_i`: homeomorphism plus dense
`colim k(x_i)^ → k(x)^` ([Sch12] Definition 7.14); tilde-limits are residue-field tilde-limits.
Check: `Spa ℂ_p → Spa ℚ_p` fails residue density.

### P7.4 Good affinoid perfectoid subsets

**Good charts.** An affinoid perfectoid open `W = φ_{i_0}⁻¹(V)`, `V` quasi-compact at level `i_0`,
with `colim O(V_a)` dense in `O(W)` ([Survey] Definition 2.20; [Torsion] Theorem III.1.2); then
`|W| ≅ lim |V_a|`, and for affinoid `V_a`, `O(W)` is the uniform completed colimit with
`FÉt(O(W)) ≃ 2-colim FÉt(O(V_a))` ([KL15] Proposition 2.8.16; [Berkeley] Theorem 7.4.8). Check:
`Spa ℂ_p` over the constant `Spa ℚ_p` is not good.

### P7.5 Frobenius-controlled integral towers

**Towers with eventual Frobenius lifts.** Rings `A_m⁺` with maps `t_m` and a parameter `ϖ`, regular
and adically complete at every stage with `ϖ^p | p`, and from `m_0` on isomorphisms
`w_m : A_{m+1}⁺/ϖ ≅ A_m⁺/ϖ^p` with `t_m ∘ w_m = Φ` and `w_{m+1} ∘ t_{m+1} = t_m ∘ w_m` ([Torsion] proof
of Corollary III.2.19; [BHW] proof of Theorem 5.11). Constructions: constant towers of integral
perfectoid rings, relative Frobenius towers over a perfect base, morphisms and shifts. Checks: the
disc tower `R⁺⟨T^{1/p^m}⟩` is Frobenius-controlled, the constant `K°⟨T⟩` is not; no tower has a stage
`ℤ_2` with parameter `2` (`4 ∤ 2`). Lean: `Perfectoid.IntegralTower`, `IntegralTower.quotient`,
`IntegralTower.quotientMap`, `IntegralTower.diagram`, `FrobeniusTower`.

### P7.6 Completion of a tower

**`A_∞⁺`, `A_∞`.** `A_∞⁺` is the `ϖ`-adic completion of `colim A_m⁺` and `A_∞ = A_∞⁺[1/ϖ]`, with
`A_∞⁺/ϖ^k = colim A_m⁺/ϖ^k`, `ϖ`-torsion-free, depending only on the tail, universal for compatible
maps to `ϖ`-adically complete rings ([Torsion] Definition III.2.18). Check: for the disc tower
`A_∞⁺ = R⁺⟨T^{1/p^∞}⟩`. Lean: `IntegralTower.colimitParameter`, `IntegralTower.completedPlus`.

### P7.7 Preperfectoid spaces

**Strong completion of affinoids.** Completing `A⁺` `ϖ`-adically gives the strong completion; `X` is
preperfectoid if covered by affinoids with perfectoid strong completion; open and closed subspaces
inherit it ([SW13] Definitions 2.3.4, 2.3.9, Propositions 2.3.7, 2.3.10–2.3.11). Check: dual numbers
over `K` have strong completion `K` ([SW13] Remark 2.3.5).

### P7.8 The strong completion

**`X̂ → X`.** A preperfectoid `X` has a perfectoid `X̂` with `|X̂| ≅ |X|`, universal for maps from
perfectoid spaces, with `X̂ ~ X` ([SW13] Propositions 2.3.6, 2.4.4).

### P7.9 Cofinality witnesses

**Level families.** A cofiltered family of compact open subgroups `K_j` of a locally profinite `G`
with witnesses `K_{j(U)} ⊆ U` is initial, so the full tower and the subtower have the same
perfectoid tilde-limits; a decreasing family is cofinal iff its intersection is trivial (Tau Ceti
`Subgroup.exists_le_of_iInf_le_of_directed`). Check: `Γ_0(pⁿ)` is not cofinal ([BHW] proof of
Theorem 5.11).

### P7.10 Uniqueness and representability

**`X` represents `lim Hom(−, X_i)`** on perfectoid spaces and uniform analytic spaces, so perfectoid
tilde-limits are unique and functorial ([SW13] Proposition 2.4.5; [Survey] Propositions 2.22–2.23).

### P7.11 Represented functors and finite-level descriptions

**Comparisons.** The v-site itself (its precoverage and topology) is DiamondsAndVStacks D2.2; P7
uses coverings by finitely many compact open images (Mathlib `IsCompactOpenCovered`; [ECD]
Definition 8.1(iii));
tilde-limits induce limits of represented sheaves; completed direct limits of pairs are tilde-limits
([SW13] Proposition 2.4.2); rational subsets come from finite level ([CHJ] proof of Theorem 2.17);
tilde-limits are invariant under initial reindexing; [HJ]'s hypotheses use R0's finite pair maps.

### P7.12 Locality, gluing and base change

**Local nature.** Tilde-limits can be checked on an open cover of one finite level, glue by
uniqueness, restrict to opens, and are stable under finite étale and étale base change with affinoid
formula `B ⊗_A R` ([SW13] Proposition 2.4.3; [Sch12] Lemma 7.3, Propositions 7.10, 7.16; [Torsion]
Definition III.3.5).

### P7.13 The perfectoid Frobenius criterion

**Frobenius-controlled towers have perfectoid limits.** `Φ : A_∞⁺/ϖ → A_∞⁺/ϖ^p` is bijective,
`A_∞⁺` is integral perfectoid ([BMS] Lemma 3.10(ii)), `A_∞` is a perfectoid Tate ring and
`(A_∞, A_∞⁺⁺)` a perfectoid pair; for sheafy `A_m`, `Spa(A_∞, A_∞⁺⁺) ~ lim Spa(A_m, A_m⁺⁺)`; towers of
formal schemes globalise ([Torsion] proof of Corollary III.2.19; [BHW] proof of Theorem 5.11;
[Sch13] Example 4.4). Congruent characteristic-`p` towers give the tilt; relative Frobenius towers
give `Spa(S^{perf}) ~ lim_Φ Spa(S)`. Lean: `FrobeniusTower.isIntegralPerfectoid_completedPlus`.

### P7.14 Limits of towers of perfectoid spaces

**Affinoid transitions.** Cofiltered systems of perfectoid spaces with affinoid transitions have a
limit glued from P5.3, a perfectoid tilde-limit with `|X| = lim |X_i|` ([BHW] proof of Theorem 5.11;
[ECD] Proposition 6.5).

### P7.15 Étale topoi along noetherian towers

**[Sch12] Theorem 7.17.** For `X ~′ lim X_i` with qcqs locally noetherian `X_i`, `X_ét^~` is the limit
of the topoi `X_{i,ét}^~` and `colim H^n(X_{j,ét}, F_j) ≅ H^n(X_ét, F)` ([Sch12] Corollaries
7.18–7.19; [SW13] Theorem 2.4.7; [Huber96] Proposition 2.4.4). Check: `⊔_{ℤ_p} Spa K` maps bijectively
onto `lim ⊔_{ℤ/pⁿ} Spa K` without being homeomorphic.

### P7.16 Regular towers with algebraically closed residue field

**[Čes] Lemma 5.1.** A complete regular local ring has a filtered system of finite flat regular
local algebras with regular colimit of algebraically closed residue field, of `p`-power rank for
separably closed `k` of characteristic `p`, via Cohen presentations ([Stacks] Tag 032A). Check:
`𝔽̄_p⟦x⟧ ⊋ colim 𝔽_{pⁿ}⟦x⟧`.

### P7.17 Regular towers with perfectoid completion

**[Čes] Lemma 5.2.** A complete regular local ring of mixed characteristic with perfect residue field
has a tower of finite flat regular local algebras of `p`-power rank with integral perfectoid
completed colimit, through the criterion of [Čes] Lemma 4.7 (`(ϖ^p) = (p)`, integrally closed, `S/p`
consisting of `p`-th powers).

### Examples

The Lean `example`s check the transition maps of the tower diagram and that at `p = 2` a stage with
parameter `2` is the zero ring.

### Dependencies

P1–P6; AdicSpacesPartIV R5; AdicEtaleGeometry A1, A4; AdicSpacesPartII R0; Tau Ceti
`Subgroup.exists_le_of_iInf_le_of_directed`; Mathlib `Functor.ofSequence`, `AdicCompletion`,
`IsAdicComplete`, `ProfiniteGrp`, `IsCompactOpenCovered`. PerfectoidTowers P8–P9 and
DiamondsAndVStacks D2, D5–D6 consume this layer.

## Downstream consumers

DiamondsAndVStacks D0–D6 consumes P0–P7: perfectoid spaces, tilting, the pro-étale calculus, the
completion bound and the v-site; it owns diamonds, spatiality and the comparison of its
characteristic-`p` diamond functor with P7's untilt test sheaves. PerfectoidTowers P8–P9 imports
both roadmaps for finite quotients, spatial presentations, closed loci and torsor descent.
Perfectoid Shimura varieties and period spaces use these foundations.

## References

Locators are theorem and section numbers of the linked versions, with page numbers where stable.

- [GR] Ofer Gabber and Lorenzo Ramero, Almost ring theory, LNM 1800 (2003); arXiv:math/0201175v3. https://arxiv.org/abs/math/0201175.
- [Sch12] Peter Scholze, Perfectoid spaces, Publ. IHÉS 116 (2012); arXiv:1111.4914. https://arxiv.org/abs/1111.4914.
- [ECD] Peter Scholze, Étale cohomology of diamonds, arXiv:1709.07343v4. https://arxiv.org/abs/1709.07343.
- [Bhatt] Bhargav Bhatt, Lecture notes for a class on perfectoid spaces (2017). http://www-personal.umich.edu/~bhattb/teaching/mat679w17/lectures.pdf.
- [Berkeley] Peter Scholze and Jared Weinstein, Berkeley lectures on p-adic geometry, Annals of Math. Studies 207 (2020); author manuscript. https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf.
- [KL15] Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory: foundations, Astérisque 371 (2015); arXiv:1301.0792. https://arxiv.org/abs/1301.0792.
- [AWS] Kiran Kedlaya, Sheaves, stacks, and shtukas (Arizona Winter School 2017 notes). https://kskedlaya.org/papers/aws-notes.pdf.
- [KL16] Kiran Kedlaya and Ruochuan Liu, Relative p-adic Hodge theory, II: imperfect period rings, arXiv:1602.06899v3. https://arxiv.org/abs/1602.06899.
- [KBF] Kiran Kedlaya, On commutative nonarchimedean Banach fields, Doc. Math. 23 (2018); arXiv:1602.09004. https://arxiv.org/abs/1602.09004.
- [BMS] Bhargav Bhatt, Matthew Morrow and Peter Scholze, Integral p-adic Hodge theory, Publ. IHÉS 128 (2018); arXiv:1602.03148v3. https://arxiv.org/abs/1602.03148.
- [Stacks] The Stacks Project authors, The Stacks Project (stable tags). https://stacks.math.columbia.edu.
- [Sch13] Peter Scholze, p-adic Hodge theory for rigid-analytic varieties, Forum Math. Pi 1 (2013); arXiv:1205.3463v2. https://arxiv.org/abs/1205.3463.
- [Sch13E] Peter Scholze, Erratum to 'p-adic Hodge theory for rigid-analytic varieties'. https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf.
- [HK] David Hansen and Kiran Kedlaya, Sheafiness criteria for Huber rings. https://kskedlaya.org/papers/criteria.pdf.
- [Wedhorn] Torsten Wedhorn, Adic spaces, arXiv:1910.05934v1. https://arxiv.org/abs/1910.05934.
- [Elkik] Renée Elkik, Solutions d'équations à coefficients dans un anneau hensélien, Ann. Sci. ÉNS 6 (1973), pp. 553–603. https://www.numdam.org/item/ASENS_1973_4_6_4_553_0/.
- [Torsion] Peter Scholze, On torsion in the cohomology of locally symmetric varieties, Ann. of Math. 182 (2015); arXiv:1306.2070v2. https://arxiv.org/abs/1306.2070.
- [SW13] Peter Scholze and Jared Weinstein, Moduli of p-divisible groups, Camb. J. Math. 1 (2013); arXiv:1211.6357v2. https://arxiv.org/abs/1211.6357.
- [Survey] Peter Scholze, Perfectoid spaces: a survey, arXiv:1303.5948. https://arxiv.org/abs/1303.5948.
- [BHW] Christopher Birkbeck, Ben Heuer and Chris Williams, Overconvergent Hilbert modular forms via perfectoid modular varieties, Ann. Inst. Fourier (2023); arXiv:1902.03985. https://arxiv.org/abs/1902.03985.
- [CHJ] Przemysław Chojecki, David Hansen and Christian Johansson, Overconvergent modular forms and perfectoid Shimura curves, Doc. Math. 22 (2017); arXiv:1507.04875. https://arxiv.org/abs/1507.04875.
- [Čes] Kęstutis Česnavičius, Purity for the Brauer group, Duke Math. J. 168 (2019); arXiv:1711.06456v4. https://arxiv.org/pdf/1711.06456v4.
- [HJ] David Hansen and Christian Johansson, Perfectoid Shimura varieties and the Calegari–Emerton conjectures, arXiv:2011.03951. https://arxiv.org/abs/2011.03951.
- [BS22] Bhargav Bhatt and Peter Scholze, Prisms and prismatic cohomology, Ann. of Math. 196 (2022); arXiv:1905.08229v4. https://arxiv.org/abs/1905.08229.
- [SGA1] Alexander Grothendieck et al., Revêtements étales et groupe fondamental (SGA 1), arXiv:math/0206203. https://arxiv.org/abs/math/0206203.
- [Illusie] Luc Illusie, Complexe cotangent et déformations I, LNM 239 (1971). https://doi.org/10.1007/BFb0059052.
- [Huber96] Roland Huber, Étale cohomology of rigid analytic varieties and adic spaces, Aspects of Math. E30 (1996). https://doi.org/10.1007/978-3-663-09991-8.
