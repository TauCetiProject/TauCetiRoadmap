# Roadmap: Gowers uniformity norms and box norms

**Summary.** For a complex function `f` on an abelian group `G` with an invariant probability
measure, the Gowers norm `‖f‖_{U^k}` measures how far `f` is from correlating with "polynomial
phases of degree less than `k`". It is defined through the multiplicative derivatives
`Δ_h f(x) = f(x) · conj f(x + h)`:

`‖f‖_{U^k}^{2^k} = ∫_{x, h₁, …, h_k ∈ G} Δ_{h₁} ⋯ Δ_{h_k} f(x) = ∫ ∏_{ω ∈ {0,1}^k} C^{|ω|} f(x + ω·h)`,

where `C` is complex conjugation and `|ω|` the number of ones in `ω`. Box norms are the same
construction on a product of probability spaces, where the cube is formed by choosing each
coordinate from one of two independent points. This roadmap develops both, together with the
directional box norms in between, in which the `i`-th direction of the cube is drawn from a
probability measure `ν_i` on `G`. The Gowers norm is the case where every `ν_i` is the measure of
`G` itself, and the box norm along subgroups is the case of Haar measures of subgroups.

The groups are abelian groups `G` carrying a probability measure `μ` invariant under translation,
with measurable addition. The main examples are a finite abelian group with the uniform measure,
and a second-countable compact abelian group with its Haar probability measure. Functions lie in
`L^{2^k}(μ)`. The headline theorems are:

- the **Gowers–Cauchy–Schwarz inequality** `|⟨(f_ω)_ω⟩_{U^k}| ≤ ∏_ω ‖f_ω‖_{U^k}` and its
  analogues for box and directional box norms, with the triangle inequality as a consequence;
- the **inductive formula** `‖f‖_{U^{k+1}}^{2^{k+1}} = ∫_h ‖Δ_h f‖_{U^k}^{2^k}` and the
  **nesting** `|∫ f| = ‖f‖_{U^1} ≤ ‖f‖_{U^2} ≤ ‖f‖_{U^3} ≤ ⋯`;
- invariance under polynomial phases of degree less than `k`, and under pullback along
  measure-preserving homomorphisms; multiplying `f` by the indicator of a coset of a
  finite-index subgroup does not increase `‖f‖_{U^k}` for `k ≥ 2`;
- the **Fourier identity** `‖f‖_{U^2}^4 = Σ_ψ |f̂(ψ)|^4` over the characters, and hence that
  `‖·‖_{U^k}` is a norm for `k ≥ 2` on compact abelian groups;
- the **generalised von Neumann theorem**: the weighted count of `k`-term arithmetic
  progressions `∫∫ ∏_{i<k} f_i(x + i d)` is bounded by `‖f_j‖_{U^{k-1}}` for 1-bounded `f_i`,
  whenever multiplication by each of `1, …, k − 1` preserves `μ`;
- the **Freiman invariance** of Gowers norms of functions on a finite subset of an arbitrary
  abelian group, normalised by the number of cubes in that subset, so that Gowers norms on an
  interval `{0, …, N − 1}` do not depend on the cyclic group it is placed in;
- the **concatenation of box norms along subgroups**, after Kravitz, Kuca and Leng: if a
  weighted average over `i` of the box norms of `f` along `k` copies of subgroups `Q_i` is at
  least `δ`, and `Q_i + Q_j = G` for most pairs `(i, j)`, then `‖f‖_{U^{2^k − 1}}` is bounded
  below by a power of `δ`, with exponent and constants depending only on `k`.

The roadmap builds on Mathlib's measure theory (products, measure-preserving maps, Hölder's
inequality, convolution of measures), its characters of finite abelian groups with their
orthogonality, and its Freiman isomorphisms. It consumes the compact Fourier transform and
Parseval identity of **AlmostPeriodicityAndBohrSets** §5.1 for the Fourier identity on compact
groups. It feeds the inverse theorems for the Gowers norms (**GowersInverseTheorem**,
**NilsequenceEquidistribution**) and the Gowers norms of functions on integer boxes in
**NilmanifoldsAndNilsequences**. **ClassicalErgodicTheory** is the ergodic neighbour: the
Host–Kra seminorms of measure-preserving systems are the dynamical analogue of these norms, and
neither roadmap builds them.

**How to read the build.**

| Layer | Content |
|---|---|
| 0 | Discrete cubes, measured abelian groups, measure-preserving cube maps and integrability |
| 1 | Box norms on a product of probability spaces: Gowers–Cauchy–Schwarz, norm properties, cut-norm control |
| 2 | Directional box norms on a measured abelian group; difference laws and Haar directions; smoothing |
| 3 | Gowers norms: derivatives, inner product, inductive formula, nesting, invariances, dual functions |
| 4 | Fourier analysis of `U^2`; definiteness on compact groups; multipliers and cosets |
| 5 | The generalised von Neumann theorem for arithmetic progressions |
| 6 | Gowers norms relative to a finite set, and their Freiman invariance |
| 7 | Concatenation of box norms along directions, and along subgroups |

Layers 1–3 are the core, in that order: Layer 2 is defined through Layer 1, and Layer 3 is the
case of Layer 2 in which every direction is `μ`. Layers 4–7 each use Layer 3 and are independent
of one another; Layer 7 also uses Layer 2's difference laws.

## Conventions

- **Cubes.** The discrete cube of dimension `k` is `Fin k → Bool`; `true` is the digit `1`. For a
  vertex `ω`, `DiscreteCube.weight ω` is the number of `i` with `ω i = true`, and
  `DiscreteCube.conjPow ω z` is `z` if that number is even and `conj z` if it is odd. For `h :
  Fin k → G` in an additive commutative monoid, `DiscreteCube.shift ω h = Σ_{i, ω i} h i`, written
  `ω·h`. For two points `x⁰ x¹ : ∀ i, X i` of a product, `DiscreteCube.select ω x⁰ x¹` is the point
  whose `i`-th coordinate is `x¹ i` if `ω i` and `x⁰ i` otherwise.
- **Measured abelian groups.** Layers 2–5 and 7 fix
  `[AddCommGroup G] [MeasurableSpace G] [MeasurableAdd₂ G] [MeasurableNeg G]` and a measure `μ`
  with `[IsProbabilityMeasure μ] [μ.IsAddLeftInvariant]`. The examples are:
  - a finite abelian group with `[DiscreteMeasurableSpace G]` and the uniform measure
    `ProbabilityTheory.uniformOn Set.univ`, where integrals are Mathlib's averages `𝔼 x, f x`;
  - a compact Hausdorff abelian group with `[SecondCountableTopology G] [BorelSpace G]` and any
    measure with `[μ.IsAddHaarMeasure] [IsProbabilityMeasure μ]`, unique by Mathlib's
    `Measure.isAddHaarMeasure_eq_of_isProbabilityMeasure`; second countability gives
    `[MeasurableAdd₂ G]` through `ContinuousAdd.measurableMul₂`.

  Layer 0 shows that `μ` is then also invariant under negation, and that it is the only
  invariant probability measure. Topology is used only in Layer 4's compact statements.
- **Functions and integrability.** Functions are `f : G → ℂ`. Integrals are Bochner integrals,
  so a definition returns `0` on non-integrable input; theorems carry
  `MemLp f (2 ^ k) μ` for statements about `U^k` or `k`-dimensional boxes. This is the exponent
  at which Hölder's inequality makes every cube integral absolutely convergent (Layer 0.3).
  "1-bounded" means `Measurable f` and `∀ x, ‖f x‖ ≤ 1`.
- **Normalisation and convention for derivatives.** `mulDeriv f h x = f x * conj (f (x + h))`
  (the convention of Kravitz–Kuca–Leng, §3.3). With it the iterated derivative is
  `Δ_{h₁} ⋯ Δ_{h_k} f(x) = ∏_ω DiscreteCube.conjPow ω (f (x + ω·h))`. All norms are normalised by
  probability measures, so `‖1‖ = 1`.
- **Norms are real numbers.** `gowersNorm μ k f`, `boxNorm`, `dirBoxNorm` and `relGowersNorm` are
  the `2^k`-th roots (`Real.rpow` with exponent `(2 ^ k)⁻¹`) of the real parts of the
  corresponding inner products of the constant family `fun _ ↦ f`. Every theorem about a norm
  assumes `1 ≤ k`, where Layer 1.2 and Layer 3.2 show the real part is nonnegative. Statements
  about `2^k`-th powers are stated for the power, never through `Real.rpow`.
- **Directions.** A *direction* is a probability measure `ν` on `G`. Its *difference law* is
  `ν ∗ ν.neg`, the law of `h' − h` for independent `h, h'` of law `ν`, written with Mathlib's
  `Measure.conv` and `Measure.neg`. A *Haar direction* is a direction equal to its difference
  law; the uniform measure on a finite subgroup, the Haar probability measure of a closed
  subgroup of a compact group, and `μ` itself are Haar directions (Layer 2.3).
- **Weights.** A probability weight on a finite type `ι` is `w : ι → ℝ` with `∀ i, 0 ≤ w i` and
  `∑ i, w i = 1`; no new structure is introduced.
- **Constants.** In Layer 7, "constants depending only on `k`" are stated as
  `∃ N C : ℕ, … ∀ G …`, quantifying over groups in a fixed universe after the constants.
- **Namespaces.** Cubes live in `DiscreteCube`. Box, directional box and Gowers norms of
  measured spaces live in `MeasureTheory` (`MeasureTheory.boxNorm`, `MeasureTheory.dirBoxNorm`,
  `MeasureTheory.gowersNorm`, `MeasureTheory.Measure.IsHaarDirection`). `mulDeriv` is in the root
  namespace. Finite-set notions live in `Finset` (`Finset.cubes`, `Finset.relGowersNorm`). The
  prototype `Suggested.lean` declares everything in its own namespace.

## Layer 0: cubes, measured abelian groups and integrability

### 0.1 Discrete cubes

Define `DiscreteCube.weight`, `DiscreteCube.conjPow`, `DiscreteCube.shift` and
`DiscreteCube.select` as in Conventions. Prove:

- the splitting along the first coordinate: for `ω : Fin k → Bool` and `b : Bool`,
  `weight (Fin.cons b ω) = weight ω + (if b then 1 else 0)`,
  `shift (Fin.cons b ω) (Fin.cons h₀ h) = (if b then h₀ else 0) + shift ω h`, and
  `∏_{ω : Fin (k+1) → Bool} F ω = (∏_ω F (Fin.cons false ω)) * ∏_ω F (Fin.cons true ω)`;
- `conjPow ω` is a ring endomorphism of `ℂ` preserving the norm; `conjPow ω (conj z) =
  conj (conjPow ω z)`;
- `shift ω` is an additive monoid hom in `h`, commutes with additive monoid homs `φ`
  (`φ (shift ω h) = shift ω (φ ∘ h)`), and `shift ω h = 0` when `ω = fun _ ↦ false`;
- `Fintype.card (Fin k → Bool) = 2 ^ k`, and `weight` is even for exactly `2 ^ (k-1)` vertices
  when `k ≥ 1`.

*Needs:* Mathlib `Fin.cons`, `Fintype.prod_bool`, `Fin.consEquiv`.

### 0.2 Measured abelian groups

Fix `(G, μ)` as in Conventions.

- **Uniqueness.** If `μ'` is another invariant probability measure on `G`, then `μ' = μ`. Prove
  it by Fubini: `μ A = ∫ μ (A − y) dμ'(y) = ∫∫ 1_A(x + y) dμ(x) dμ'(y) = ∫ μ' (A − x) dμ(x) =
  μ' A`. Consequences: `μ.neg = μ`; `ν ∗ μ = μ` for every probability measure `ν`; and every
  measurable surjective homomorphism `φ : G →+ H` onto another measured abelian group `(H, μ_H)`
  satisfies `MeasurePreserving φ μ μ_H`, since `Measure.map φ μ` is an invariant probability
  measure on `H`.
- **Cube maps preserve measure.** For every vertex `ω`, the map `(x, h) ↦ x + ω·h` is
  measure-preserving from `μ.prod (Measure.pi fun _ ↦ μ)` to `μ`. For probability spaces
  `(X i, μ_i)`, the map `(x⁰, x¹) ↦ select ω x⁰ x¹` is measure-preserving from
  `(Measure.pi μ).prod (Measure.pi μ)` to `Measure.pi μ`. For directions `ν_i`, the map
  `(x, (y⁰, y¹)) ↦ x + Σ_i select ω y⁰ y¹ i` is measure-preserving from
  `μ.prod ((Measure.pi ν).prod (Measure.pi ν))` to `μ`.
- **Change of variables for cubes.** The map `(x, y⁰, y¹) ↦ (x + Σ y⁰, y¹ − y⁰)` sends
  `μ.prod ((Measure.pi ν).prod (Measure.pi ν))` to `μ.prod (Measure.pi fun i ↦ ν i ∗ (ν i).neg)`.
- **Finite groups.** For a finite abelian group with `[DiscreteMeasurableSpace G]`, the measure
  `uniformOn Set.univ` is an invariant probability measure, and
  `∫ x, f x ∂(uniformOn Set.univ) = 𝔼 x, f x` for every `f : G → ℂ`.

*Needs:* Mathlib `MeasureTheory.integral_prod`, `MeasureTheory.Measure.pi`,
`MeasurePreserving.prod`, `MeasureTheory.measurePreserving_pi`, `Measure.conv`, `Measure.neg`,
`ProbabilityTheory.uniformOn`.

**Checks.**

- `G = ZMod N` with the uniform measure: `μ {0} = 1 / N`, and the map `(x, h) ↦ x + h₀ + h₁` of
  the first bullet (`ω = fun _ ↦ true`, `k = 2`) has fibres of size `N²` in `(ZMod N)³`.
- `G = AddCircle 1` with `AddCircle.haarAddCircle`: an invariant probability measure.
- Non-example: for `ν = (δ₀ + δ₁)/2` on `ZMod 3`, the difference law `ν ∗ ν.neg` gives mass
  `1/2` to `0` and `1/4` to each of `1, 2`, so `ν` is not a Haar direction.

### 0.3 Integrability of cube products

Let `(Ω, P)` be a probability space, `(Y, Q)` a probability space, and `v_ω : Ω → Y` (for `ω` in
the cube of dimension `k`) measure-preserving maps. If `F_ω ∈ L^{2^k}(Q)` for every `ω`, then
`∏_ω conjPow ω (F_ω ∘ v_ω)` is integrable and
`∫ ‖∏_ω F_ω ∘ v_ω‖ dP ≤ ∏_ω ‖F_ω‖_{L^{2^k}(Q)}`, by the generalised Hölder inequality with `2^k`
exponents equal to `2^{-k}`. Apply it to the three cube shapes of 0.2.

*Needs:* 0.2; Mathlib `ENNReal.lintegral_prod_norm_pow_le` (generalised Hölder),
`MeasureTheory.MemLp`, `MeasureTheory.eLpNorm`, `MeasurePreserving.integral_comp`.

## Layer 1: box norms on a product of probability spaces

Fix `k : ℕ`, spaces `X : Fin k → Type*` with `[∀ i, MeasurableSpace (X i)]`, and probability
measures `μ i` on `X i`. Write `P = Measure.pi μ`. The generality is that of products of
probability spaces: finite sets with the uniform measure are the special case `X i` finite and
`μ i = uniformOn Set.univ`, and the directional box norms of Layer 2 are box norms of products of
copies of `(G, ν_i)`, which are not finite.

### 1.1 Box inner product and box norm

For a family `F : (Fin k → Bool) → (∀ i, X i) → ℂ`, define

`MeasureTheory.boxInner μ F = ∫ (x⁰, x¹), ∏_ω conjPow ω (F ω (select ω x⁰ x¹)) ∂(P.prod P)`

and `MeasureTheory.boxNorm μ F = (boxInner μ (fun _ ↦ F)).re ^ ((2 ^ k)⁻¹ : ℝ)`. The box inner
product is linear in `F ω` for `weight ω` even and conjugate-linear for `weight ω` odd.

### 1.2 Inductive formula and positivity

For `F : (∀ i : Fin (k+1), X i) → ℂ` in `L^{2^{k+1}}`, writing `F a y = F (Fin.cons a y)`:

`boxNorm μ F ^ 2^(k+1) = ∫∫ boxNorm (Fin.tail μ) (fun y ↦ F a y * conj (F a' y)) ^ 2^k dμ₀(a) dμ₀(a')`.

The same formula holds for the inner product of a family, with the two halves of the family
`F (Fin.cons false ·)` and `F (Fin.cons true ·)`. Prove:

- `boxInner μ (fun _ ↦ F)` is real and nonnegative for `k ≥ 1`;
- for `k = 1`, `boxNorm μ F = ‖∫ F dP‖`;
- for `k = 2` and finite `X 0, X 1` with uniform measures,
  `boxNorm μ F ^ 4 = 𝔼 y y', ‖𝔼 x, F (x, y) * conj (F (x, y'))‖ ^ 2`.

*Needs:* 0.1, 0.3; Mathlib `MeasureTheory.measurePreserving_piFinSuccAbove`,
`MeasureTheory.integral_prod`.

### 1.3 Gowers–Cauchy–Schwarz for box norms

For `k ≥ 1` and `F ω ∈ L^{2^k}(P)`:

`‖boxInner μ F‖ ≤ ∏_ω boxNorm μ (F ω)`.

Integrating out the first coordinate writes `boxInner μ F` as an integral, over the pair of
points of the remaining coordinates, of `A · conj B`, where `A` and `B` are first-coordinate
averages built from the halves `F (Fin.cons false ·)` and `F (Fin.cons true ·)`. The
Cauchy–Schwarz inequality bounds it by the geometric mean of the inner products of the two
families obtained by copying one half onto the other. Repeating this in every coordinate (with
the invariance under permuting coordinates of 1.4, whose proof does not use 1.3) leaves the
inner products of constant families, which gives the bound.

*Needs:* 1.2; Mathlib `MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg`,
`inner_mul_le_norm_mul_norm`.

### 1.4 Norm properties and control of the cut norm

For `k ≥ 1` and `F, F' ∈ L^{2^k}(P)`, prove:

- the triangle inequality `boxNorm μ (F + F') ≤ boxNorm μ F + boxNorm μ F'`, by expanding the
  inner product multilinearly and applying 1.3 to each of the `2^{2^k}` terms;
- `boxNorm μ (c • F) = ‖c‖ * boxNorm μ F`, and `boxNorm μ (conj ∘ F) = boxNorm μ F`;
- `boxNorm μ F ≤ ‖F‖_{L^{2^k}(P)}` (from 0.3), so `boxNorm μ F ≤ C` when `‖F x‖ ≤ C` for all `x`;
- **cut-norm control:** if `u_j` (`j : Fin k`) are measurable, 1-bounded, and `u_j x` does not
  depend on `x j`, then `‖∫ F * ∏_j u_j dP‖ ≤ boxNorm μ F`. Apply 1.3 to the family with `F` at
  the vertex `0`, `conj u_j` at the vertex with a single `1` in position `j`, and `1` elsewhere;
- **definiteness:** for `k ≥ 2`, `boxNorm μ F = 0` if and only if `F =ᵐ[P] 0`. The indicator of a
  measurable rectangle `∏ A_i` is a product `u₀ u₁` as in the previous bullet when `k ≥ 2`, so
  `∫ F 1_R = 0` for all rectangles, and rectangles generate the product σ-algebra;
- invariance: `boxNorm μ' (F ∘ (fun x i ↦ T i (x i))) = boxNorm μ F` for measure-preserving
  `T i : (X' i, μ' i) → (X i, μ i)`, and invariance under permuting the coordinates together with
  the measures.

*Needs:* 1.3; Mathlib `generateFrom_pi`, `MeasureTheory.ext_of_generate_finite`.

**Checks.**

- Tensor products: for `k ≥ 2` and `F x = ∏_i f_i (x i)`,
  `boxNorm μ F = ∏_i ‖f_i‖_{L^{2^{k-1}}(μ i)}`. A definition without the conjugations would give
  `∫ f_i ^ (2^{k-1})` in place of `∫ |f_i| ^ (2^{k-1})`.
- `k = 1` is not definite: on `X 0 = Fin 2` with the uniform measure, `F = (1, −1)` has
  `boxNorm μ F = 0`.
- `k = 2`, `X 0 = X 1 = Fin 2` uniform, `F (x, y) = (−1)^{x + y}`: `boxNorm μ F = 1`, while
  `‖∫ F‖ = 0`.

## Layer 2: directional box norms on a measured abelian group

Fix `(G, μ)` as in Conventions, `k : ℕ` and directions `ν : Fin k → Measure G`.

### 2.1 Definition

For a family `f : (Fin k → Bool) → G → ℂ`, define

`MeasureTheory.dirBoxInner μ ν f = ∫ x, boxInner ν (fun ω y ↦ f ω (x + Σ_i y i)) ∂μ`,

the average over `x` of the box inner product on the product of the probability spaces
`(G, ν_i)` of the functions `y ↦ f ω (x + y₁ + ⋯ + y_k)`, and
`MeasureTheory.dirBoxNorm μ ν f = (dirBoxInner μ ν (fun _ ↦ f)).re ^ ((2 ^ k)⁻¹ : ℝ)`. Unfolded,
`‖f‖_{□(ν)}^{2^k} = ∫_x ∫_{h, h'} ∏_ω C^{|ω|} f(x + Σ_i (ω_i ? h'_i : h_i))`, which is
Kravitz–Kuca–Leng's box norm along multisets (their (20), §3.3) with the uniform measures on the
multisets replaced by arbitrary directions.

### 2.2 Gowers–Cauchy–Schwarz, seminorm and inductive formula

For `k ≥ 1` and `f ω ∈ L^{2^k}(μ)`:

- `‖dirBoxInner μ ν f‖ ≤ ∏_ω dirBoxNorm μ ν (f ω)`: apply 1.3 for each `x` and then Hölder's
  inequality in `x` with `2^k` factors;
- the triangle inequality, homogeneity and invariance under conjugation, as in 1.4, and
  `dirBoxNorm μ ν f ≤ ‖f‖_{L^{2^k}(μ)}`;
- **inductive formula:** with `Δ'_{(h,h')} f x = f (x + h) * conj (f (x + h'))`,
  `dirBoxNorm μ ν f ^ 2^(k+1) = ∫∫ dirBoxNorm μ (Fin.init ν) (Δ'_{(h,h')} f) ^ 2^k
  dν_k(h) dν_k(h')` for `ν : Fin (k+1) → Measure G` (Kravitz–Kuca–Leng, Lemma 3.5(i));
- permutation invariance: `dirBoxNorm μ (ν ∘ σ) f = dirBoxNorm μ ν f` for `σ : Equiv.Perm (Fin k)`
  (Kravitz–Kuca–Leng, Lemma 3.5(ii)).

*Needs:* Layer 1, 0.2, 0.3.

### 2.3 Difference laws and Haar directions

Define `MeasureTheory.Measure.IsHaarDirection ν : Prop := ν ∗ ν.neg = ν`. Prove:

- **alternative formula:** for directions `ν_i`,
  `dirBoxInner μ ν f = ∫ x, ∫ t, ∏_ω conjPow ω (f ω (x + ω·t)) ∂(Measure.pi fun i ↦ ν i ∗ (ν i).neg) ∂μ`
  (the change of variables of 0.2; Kravitz–Kuca–Leng, (21));
- a Haar direction is invariant under negation, and `ν ∗ ν = ν`;
- if `ν, ν'` are Haar directions then `ν' ∗ ν.neg = ν ∗ ν'` is a Haar direction (convolution is
  commutative on an abelian group);
- `μ` is a Haar direction, and `ν ∗ μ = μ` for every direction `ν` (0.2);
- for a finite subgroup `H` (with measurable singletons), the uniform measure `ν_H` on `H` is a
  Haar direction, and `ν_H ∗ ν_K = ν_{H + K}` for finite subgroups `H, K`; for a compact `G`, the
  Haar probability measure of a closed subgroup, pushed into `G`, is a Haar direction;
- if every `ν_i` is a Haar direction, then
  `dirBoxNorm μ ν f ^ 2^k = ∫_x ∫_h ∏_ω conjPow ω (f (x + ω·h)) d(Measure.pi ν)(h) dμ(x)`.

*Needs:* 2.1, 0.2; Mathlib `Measure.conv`, `Measure.neg`, `Measure.conv_comm`,
`Measure.conv_assoc` (additive forms of `Measure.mconv_comm`, `Measure.mconv_assoc`).

**Checks.**

- `G = ZMod 6`, `H = {0, 3}`, `K = {0, 2, 4}`: `ν_H ∗ ν_K` is the uniform measure on `G`.
- `k = 1`: `dirBoxNorm μ ![ν] f ^ 2 = ∫_x ‖∫ f (x + y) dν(y)‖² dμ(x)`; for `ν = μ` this is
  `‖∫ f dμ‖²`, and for `ν = δ₀` it is `‖f‖_{L²}²`.

### 2.4 Smoothing the directions decreases the norm

For `k ≥ 1`, directions `ν_i`, probability measures `λ_i` and `f ∈ L^{2^k}(μ)`:

`dirBoxNorm μ (fun i ↦ ν i ∗ λ i) f ≤ dirBoxNorm μ ν f`.

For `k = 1` this is Jensen's inequality and the invariance of `μ`:
`∫_x |∫∫ f(x + y + z) dν(y) dλ(z)|² ≤ ∫_z ∫_x |∫ f(x + z + y) dν(y)|²`. For general `k`, move the
smoothed direction last by 2.2's permutation invariance and apply the `k = 1` case inside 2.2's
inductive formula for each value of the other variables.

*Needs:* 2.2.

## Layer 3: Gowers norms

Fix `(G, μ)` as in Conventions.

### 3.1 Multiplicative derivatives

Define `mulDeriv f h x = f x * conj (f (x + h))`. Prove:

- `mulDeriv (mulDeriv f h) h' = mulDeriv (mulDeriv f h') h`;
- the iterated derivative along `h : Fin k → G` is
  `∏_ω conjPow ω (f (x + ω·h))`;
- `mulDeriv (f * g) h = mulDeriv f h * mulDeriv g h`, `mulDeriv (conj ∘ f) h = conj ∘ mulDeriv f h`,
  `mulDeriv (fun x ↦ f (x + a)) h = fun x ↦ mulDeriv f h (x + a)`;
- `‖mulDeriv f h x‖ ≤ 1` for 1-bounded `f`.

*Needs:* 0.1.

### 3.2 The Gowers inner product and norm

For `f : (Fin k → Bool) → G → ℂ` define

`MeasureTheory.gowersInner μ k f = ∫ (x, h), ∏_ω conjPow ω (f ω (x + ω·h)) ∂(μ.prod (Measure.pi fun _ ↦ μ))`

and `MeasureTheory.gowersNorm μ k f = (gowersInner μ k (fun _ ↦ f)).re ^ ((2 ^ k)⁻¹ : ℝ)`.
Prove, for `k ≥ 1` and functions in `L^{2^k}(μ)`:

- `gowersInner μ k f = dirBoxInner μ (fun _ ↦ μ) f`, by 2.3 and `μ ∗ μ.neg = μ`; hence the
  **Gowers–Cauchy–Schwarz inequality** `‖gowersInner μ k f‖ ≤ ∏_ω gowersNorm μ k (f ω)`, the
  triangle inequality, homogeneity, conjugation invariance and
  `gowersNorm μ k f ≤ ‖f‖_{L^{2^k}(μ)}`;
- `gowersNorm μ 1 f = ‖∫ f dμ‖`;
- **inductive formula:** `gowersNorm μ (k+1) f ^ 2^(k+1) = ∫ h, gowersNorm μ k (mulDeriv f h) ^ 2^k ∂μ`
  for `f ∈ L^{2^{k+1}}(μ)`, and the average-square form
  `gowersNorm μ (k+1) f ^ 2^(k+1) = ∫_{h ∈ G^k} ‖∫_x Δ_{h₁} ⋯ Δ_{h_k} f(x)‖² dμ^k(h)`;
- **nesting:** `gowersNorm μ k f ≤ gowersNorm μ (k+1) f`, so `‖∫ f‖ ≤ gowersNorm μ k f`. Apply
  Gowers–Cauchy–Schwarz in dimension `k+1` to the family with `f` on the face `ω_k = false` and
  `1` on the opposite face;
- for 1-bounded `f`: `gowersNorm μ k f ^ 2^k ≤ ∫ ‖f‖ dμ`, hence `gowersNorm μ k f ≤ 1`;
- `gowersNorm μ k 1 = 1`, `gowersNorm μ k (fun x ↦ f (x + a)) = gowersNorm μ k f`,
  `gowersNorm μ k (fun x ↦ f (-x)) = gowersNorm μ k f`;
- **phase invariance:** if `q` is measurable with `‖q x‖ = 1` and
  `∏_ω conjPow ω (q (x + ω·h)) = 1` for all `x, h`, then `gowersNorm μ k (q * f) =
  gowersNorm μ k f`. Measurable characters `ψ : AddChar G Circle` satisfy the hypothesis for every
  `k ≥ 2`, and `x ↦ e(a x² / N)` on `ZMod N` satisfies it for every `k ≥ 3`;
- **pullback:** if `φ : G →+ H` is measurable and `MeasurePreserving φ μ μ_H` for a measured
  abelian group `(H, μ_H)`, then `gowersNorm μ k (g ∘ φ) = gowersNorm μ_H k g`. This covers
  quotient maps, and isomorphisms such as `x ↦ c • x` on `ZMod N` for `c` a unit;
- **finite groups:** with the uniform measure,
  `gowersNorm μ k f ^ 2^k = 𝔼 x, 𝔼 h : Fin k → G, ∏_ω conjPow ω (f (x + ω·h))`, and the inductive
  formula reads `gowersNorm μ (k+1) f ^ 2^(k+1) = 𝔼 h, gowersNorm μ k (mulDeriv f h) ^ 2^k`.

*Needs:* 3.1, Layer 2, 0.2.

**Checks.**

- `G = ZMod N`: `gowersNorm μ k (Set.indicator {0} 1) = N ^ (-(k+1) / 2^k)`; the only cube in
  `{0}` is `(0, 0)`.
- `G = ZMod N`, `ψ` a nontrivial character: `gowersNorm μ 1 ψ = 0` and `gowersNorm μ k ψ = 1` for
  `k ≥ 2`. So `‖·‖_{U^1}` is not a norm, and phase invariance fails for `k = 1`.
- `G = ZMod N` with `N` odd, `q x = e(x² / N)`: `gowersNorm μ 2 q = N ^ (-1/4 : ℝ)` (each Fourier
  coefficient has modulus `N^{-1/2}`, by the Gauss sum) and `gowersNorm μ 3 q = 1`.

### 3.3 Dual functions

Define the dual function `MeasureTheory.gowersDual μ k f x = ∫ h, ∏_{ω ≠ 0} conjPow ω (conj (f
(x + ω·h))) d(Measure.pi fun _ ↦ μ)(h)`, the product running over the vertices other than
`fun _ ↦ false`. Prove, for `k ≥ 1`:

- `∫ f * conj (gowersDual μ k f) dμ = gowersNorm μ k f ^ 2^k` for `f ∈ L^{2^k}(μ)`;
- `‖gowersDual μ k f x‖ ≤ 1` for 1-bounded `f`;
- `‖∫ g * conj (gowersDual μ k f) dμ‖ ≤ gowersNorm μ k g * gowersNorm μ k f ^ (2^k − 1)`, from
  Gowers–Cauchy–Schwarz.

*Needs:* 3.2.

### 3.4 Many large derivatives, and correlation through derivatives

- **Popularity.** For `k ≥ 1`, 1-bounded `f` and `0 ≤ η ≤ gowersNorm μ (k+1) f`, the set
  `S = {h | η ^ 2^(k+1) / 2 ≤ gowersNorm μ k (mulDeriv f h) ^ 2^k}` satisfies
  `ENNReal.ofReal (η ^ 2^(k+1) / 2) ≤ μ S`. The function `h ↦ gowersNorm μ k (mulDeriv f h)` is
  measurable (a parametric integral), and the statement follows from the inductive formula since
  the integrand lies in `[0, 1]`.
- **Correlation identity.** For `f, u ∈ L²(μ)`,
  `‖∫ f * conj u dμ‖² = ∫_h ∫_x mulDeriv f h x * conj (mulDeriv u h x) dμ dμ(h)`, the case `k = 1`
  of the inductive formula applied to `f * conj u`.

*Needs:* 3.2; Mathlib `MeasureTheory.StronglyMeasurable.integral_prod_right`,
`MeasureTheory.mul_meas_ge_le_integral_of_nonneg`.

### 3.5 Gowers norms against directional box norms

- For `k ≥ 1`, directions `ν_i` and `f ∈ L^{2^k}(μ)`: `gowersNorm μ k f ≤ dirBoxNorm μ ν f`, by
  2.4 with `λ_i = μ` and `ν i ∗ μ = μ`.
- In particular, for a finite abelian group and a subgroup `K` with the uniform measure `ν_K`,
  2.3 gives `dirBoxNorm μ (fun _ ↦ ν_K) f ^ 2^k = 𝔼_x ‖y ↦ f (x + y)‖_{U^k(K)}^{2^k}`, the average
  of the Gowers norms of the restrictions of `f` to the cosets of `K`; hence
  `gowersNorm μ k f ^ 2^k ≤ 𝔼_x ‖y ↦ f (x + y)‖_{U^k(K)}^{2^k}`.

*Needs:* 2.3, 2.4, 3.2.

## Layer 4: Fourier analysis of `U^2`, definiteness, multipliers and cosets

### 4.1 Finite abelian groups

Let `G` be a finite abelian group with the uniform measure, and for `ψ : AddChar G ℂ` write
`f̂ ψ = 𝔼 x, f x * conj (ψ x)`. Prove:

- `gowersNorm μ 2 f ^ 4 = ∑ ψ : AddChar G ℂ, ‖f̂ ψ‖ ^ 4`. Expand
  `gowersNorm μ 2 f ^ 4 = 𝔼 h, ‖𝔼 x, mulDeriv f h x‖²`, recognise the autocorrelation
  `h ↦ 𝔼 x, f x * conj (f (x + h))` with Fourier coefficients `‖f̂ ψ‖²`, and apply Parseval;
- `‖f̂ ψ‖ ≤ gowersNorm μ 2 f` for every `ψ`;
- the `U^2` inverse statement: there is `ψ` with `gowersNorm μ 2 f ^ 2 ≤ ‖f̂ ψ‖ * ‖f‖_{L²}`; for
  1-bounded `f`, `gowersNorm μ 2 f ^ 2 ≤ ‖f̂ ψ‖`;
- **Fourier coefficients of derivatives.** For `k ≥ 2` and any family of characters
  `ψ : G → AddChar G ℂ`,
  `(𝔼 h, ‖𝔼 x, mulDeriv f h x * conj (ψ h x)‖) ^ 2^k ≤ gowersNorm μ (k+1) f ^ 2^(k+1)`: bound each
  coefficient by `‖mulDeriv f h‖_{U^2} ≤ ‖mulDeriv f h‖_{U^k}`, then apply Jensen's inequality and
  the inductive formula (3.2).

Parseval `∑_ψ ‖f̂ ψ‖² = 𝔼 x, ‖f x‖²` is proved here from Mathlib's orthogonality of characters,
as a lemma about functions (FourierAnalyticAdditiveCombinatorics 1.1 states it for indicators of
sets with unnormalised character sums; this roadmap does not depend on it).

*Needs:* 3.2; Mathlib `AddChar.card_eq`, `AddChar.expect_apply_eq_ite`,
`AddChar.wInner_cWeight_eq_boole`, `AddChar.complexBasis`.

**Checks.**

- `f = ψ₀` a character: `f̂ ψ = 1` if `ψ = ψ₀` and `0` otherwise; both sides of the identity are
  `1`.
- `f = Set.indicator A 1` on `ZMod N`: `gowersNorm μ 2 f ^ 4 = E(A) / N³`, where `E(A)` is
  Mathlib's additive energy `Finset.addEnergy A A`.

### 4.2 Compact abelian groups

Let `G` be a second-countable compact Hausdorff abelian group with Haar probability `μ`. With the
continuous characters `ψ : AddChar G Circle` and the compact Fourier transform
`cft f ψ = ∫ f * conj ψ dμ` of AlmostPeriodicityAndBohrSets §5.1, prove for `f ∈ L⁴(μ)`:

- `gowersNorm μ 2 f ^ 4 = ∑' ψ, ‖cft f ψ‖ ^ 4`, the sum running over continuous characters;
- `‖cft f ψ‖ ≤ gowersNorm μ 2 f`, and the `U^2` inverse statement of 4.1.

The proof is that of 4.1, with §5.1's Parseval identity and its convolution identity in place of
orthogonality on a finite group.

*Needs:* 3.2; AlmostPeriodicityAndBohrSets §5.1.

### 4.3 Definiteness

On a compact group as in 4.2 (in particular on every finite abelian group), for `k ≥ 2` and
`f ∈ L^{2^k}(μ)`: `gowersNorm μ k f = 0 ↔ f =ᵐ[μ] 0`. By nesting it suffices that
`gowersNorm μ 2 f = 0` forces every Fourier coefficient to vanish, and Parseval then gives
`f = 0` almost everywhere. Together with 3.2, `‖·‖_{U^k}` is a norm on `L^{2^k}(μ)` for `k ≥ 2`.

*Needs:* 4.1, 4.2.

### 4.4 Multipliers and cosets

Fix `(G, μ)` as in Conventions and `k ≥ 2`.

- **Fourier multipliers.** For a finite family of complex numbers `c_j` and measurable
  characters `ψ_j : AddChar G Circle`,
  `gowersNorm μ k (f * Σ_j c_j ψ_j) ≤ (Σ_j ‖c_j‖) * gowersNorm μ k f`, by the triangle inequality
  and phase invariance (3.2).
- **Cosets of finite-index subgroups.** For a measurable homomorphism `φ : G →+ H` to a finite
  abelian group (with the discrete σ-algebra) and `a : H`,
  `gowersNorm μ k (f * Set.indicator (φ ⁻¹' {a}) 1) ≤ gowersNorm μ k f`. Write
  `1_{a} = Σ_ψ |H|⁻¹ conj (ψ a) ψ` and apply the multiplier bound to the characters `ψ ∘ φ`.

*Needs:* 3.2, 4.1.

**Checks.**

- The coset bound fails for `k = 1`: on `ZMod 4` with `φ` the reduction to `ZMod 2`, `a = 0` and
  `f = ψ` the character `x ↦ (−1)^x`, `gowersNorm μ 1 f = 0` while
  `gowersNorm μ 1 (f * 1_{φ⁻¹ 0}) = 1/2`.

## Layer 5: the generalised von Neumann theorem

Fix `(G, μ)` as in Conventions and `k ≥ 2`. For 1-bounded `f : Fin k → G → ℂ` define the
progression count

`MeasureTheory.progressionCount μ f = ∫ (x, d), ∏_i f i (x + (i : ℕ) • d) ∂(μ.prod μ)`.

**Theorem.** If `x ↦ c • x` is measure-preserving for every natural number `1 ≤ c < k`, then for
every `j`, `‖progressionCount μ f‖ ≤ gowersNorm μ (k − 1) (f j)`.

Prove the statement for counts `∫∫ f₀(x) ∏_{i=1}^{m} f_i(x + a_i d)` with distinct nonzero
integers `a_i`, by induction on `m`, bounding the last function. The Cauchy–Schwarz inequality in
`x` removes `f₀`; the substitution `x ↦ x − a₁ d` turns the result into an average over `h` of
counts with coefficients `a_i − a₁` and functions `mulDeriv f_i (a_i h)`; the induction hypothesis
and Hölder's inequality in `h` conclude, with the substitution `h ↦ a_m h`. The base case `m = 1`
is the substitution `d ↦ a₁ d`. Every coefficient met is a difference of two indices of the
progression, so of absolute value less than `k`, and negation preserves `μ` by 0.2. For the
progression and a chosen `j`, substitute `x ↦ x − i₀ d` for some `i₀ ≠ j` first.

*Needs:* 3.2, 0.2.

**Checks.**

- On a finite abelian group the hypothesis holds if and only if `Nat.Coprime (Fintype.card G)
  (k − 1)!`. On `AddCircle 1` with Haar measure it holds for every `k`, since `x ↦ c • x` is a
  continuous surjective homomorphism and 0.2's uniqueness applies.
- `k = 2`: `progressionCount μ f = (∫ f 0) * (∫ f 1)`, and for `j = 1` the theorem reads
  `‖∫ f 0‖ * ‖∫ f 1‖ ≤ ‖∫ f 1‖ = gowersNorm μ 1 (f 1)`.

## Layer 6: Gowers norms relative to a finite set, and Freiman transport

Let `A` be an arbitrary abelian group with `[DecidableEq A]`, `Q : Finset A` and `k : ℕ`. No
measure is involved.

### 6.1 Cubes in a finite set

Define `Finset.cubes k Q : Finset (A × (Fin k → A))`, the pairs `(x, h)` with `x + ω·h ∈ Q` for
every `ω`. It is finite because `(x, h) ↦ (x, (x + h i)_i)` embeds it in `Q × Q^k`. Prove:

- `#Q ≤ #(Q.cubes k)` (the degenerate cubes `(x, 0)`), and `#(Q.cubes 1) = #Q ^ 2`;
- for a finite abelian group with `Q = Finset.univ`, `#(Q.cubes k) = card G ^ (k+1)`;
- the decomposition along the first direction:
  `#(Q.cubes (k+1)) = ∑_{h ∈ Q − Q} #((Q.filter (· + h ∈ Q)).cubes k)`;
- translation: `#((a +ᵥ Q).cubes k) = #(Q.cubes k)`.

### 6.2 Relative Gowers norms

For `F : (Fin k → Bool) → A → ℂ` define

`Finset.relGowersInner k Q F = (∑_{(x, h) ∈ Q.cubes k} ∏_ω conjPow ω (F ω (x + ω·h))) / #(Q.cubes k)`

and `Finset.relGowersNorm k Q f = (relGowersInner k Q (fun _ ↦ f)).re ^ ((2 ^ k)⁻¹ : ℝ)`. These
are the Gowers norms of `f` on `Q`, normalised by the number of cubes of `Q`; they depend only on
`f` restricted to `Q`. Prove:

- `relGowersNorm 1 Q f = ‖𝔼 x ∈ Q, f x‖` and `relGowersNorm k Q 1 = 1` for nonempty `Q`;
- translation invariance;
- **ambient comparison:** if `A` is a finite abelian group with the uniform measure and `k ≥ 1`,
  `gowersNorm μ k (Set.indicator Q f) ^ 2^k = #(Q.cubes k) / card A ^ (k+1) *
  relGowersNorm k Q f ^ 2^k`;
- **derivative formula:** `#(Q.cubes (k+1)) * relGowersNorm (k+1) Q f ^ 2^(k+1) =
  ∑_{h ∈ Q − Q} #(Q_h.cubes k) * relGowersNorm k Q_h (mulDeriv f h) ^ 2^k`, where
  `Q_h = Q.filter (· + h ∈ Q)`.

### 6.3 Freiman invariance

- **Cubes are Freiman-invariant.** A configuration `(p_ω)_ω` of points of `Q` is a cube
  `p_ω = x + ω·h` if and only if every two-dimensional face is a parallelogram
  (`p_ω + p_{ω + e_i + e_j} = p_{ω + e_i} + p_{ω + e_j}` whenever `ω_i = ω_j = 0`). Hence a Freiman
  isomorphism of order 2 (Mathlib's `IsAddFreimanIso 2 Q R φ`) induces a bijection
  `Q.cubes k ≃ R.cubes k`, and `relGowersNorm k R g = relGowersNorm k Q (g ∘ φ)`.
- **Finite models.** Every finite `Q` in an abelian group is Freiman-isomorphic of order 2 to a
  subset of a finite abelian group in the same universe. The subgroup generated by `Q` is
  `ℤ^r × T` with `T` finite; reduce the free coordinates modulo an `N` larger than twice their
  spread on `Q`, which is injective on `Q + Q`.
- **Consequences.** For `k ≥ 1`, Gowers–Cauchy–Schwarz
  `‖relGowersInner k Q F‖ ≤ ∏_ω relGowersNorm k Q (F ω)` and the triangle inequality hold for
  relative norms: transport to a finite model and apply 6.2's ambient comparison and 3.2.

*Needs:* 6.1, 6.2, 3.2; Mathlib `IsAddFreimanIso`, `AddCommGroup.equiv_free_prod_directSum_zmod`,
`AddGroup.FG`.

**Checks.**

- Intervals: for `Q = Finset.range N` viewed in `ℤ`, and `M ≥ 2N`, the reduction `ℤ → ZMod M` is a
  Freiman isomorphism of order 2 on `Q`, so `relGowersNorm k Q f` is the normalised `U^k` norm of
  `f` on `{0, …, N − 1}` computed in any `ZMod M` with `M ≥ 2N`. For `M = N` this fails: in
  `ZMod 2` the points `0, 1` of `Finset.range 2` satisfy `1 + 1 = 0 + 0`.
- `Q = {0, 1, 3}` in `ℤ`: `#(Q.cubes 2)` counts the parallelograms `x, x + a, x + b, x + a + b` in
  `Q`, and equals `15`: the cubes with `a = 0` or `b = 0` number `9 + 9 − 3`, and since `Q` has
  no three-term progression it contains no other parallelogram.

## Layer 7: concatenation of box norms

Fix `(G, μ)` as in Conventions, a finite type `ι` with probability weights `w`, and a 1-bounded
`f`. Box norms of 1-bounded functions lie in `[0, 1]` (2.2). For directions `K : Fin s →
Measure G` and `H`, write `‖f‖_{K, H}` for `dirBoxNorm μ (Fin.snoc K H) f`, and `K ++ K'` for
`Fin.append K K'`. For the subgroup statements, recall from 2.3 that for finite subgroups
`H_i, H_j` the direction `ν_{H_j} ∗ ν_{H_i}.neg` is `ν_{H_i + H_j}`.

### 7.1 One concatenation step

**Theorem (Kravitz–Kuca–Leng, Lemma 6.1, with `B = G`).** Let `H : ι → Measure G` and
`K : ι → Fin s → Measure G` be directions and `0 ≤ δ ≤ Σ_i w i * ‖f‖_{K i, H i} ^ 2^(s+1)`. Then

`δ ^ 2^(2s+1) ≤ Σ_{i, j} w i * w j * ‖f‖_{K i ++ K j, H j ∗ (H i).neg} ^ 2^(2s+1)`.

Prove it with 2.3's alternative formula on all coordinates. It writes
`‖f‖_{K i, H i}^{2^{s+1}} = ∫ f · conj Ψ_i dμ`, where `Ψ_i x` averages, over `κ` of law
`Measure.pi (K i ∗ (K i).neg)` and `t` of law `H i ∗ (H i).neg`, the product of `f (x + t)` and
the factors of the cube at the vertices other than `0`; it is 1-bounded. The Cauchy–Schwarz
inequality in `x` gives `δ² ≤ Σ_{i,j} w i w j ∫ Ψ_i conj Ψ_j dμ`. For fixed `t₀, t₁`, the integral
over `x, κ₀, κ₁` is, by 2.3, a directional box inner product along `K i ++ K j` whose vertex `0`
carries `g = x ↦ conj (f (x + t₀)) * f (x + t₁)`, whose vertices with exactly one nonzero half
carry 1-bounded functions, and whose remaining vertices carry `1`. Gowers–Cauchy–Schwarz (2.2) and
Hölder's inequality give `δ ^ 2^(2s+1) ≤ Σ w i w j ∫∫ dirBoxNorm μ (K i ++ K j) g ^ 2^(2s)`. After
the shift `x ↦ x − t₀` the integrand depends on `t₁ − t₀`, whose law is the difference law of
`H j ∗ (H i).neg`, and the alternative formula identifies the double integral with
`‖f‖_{K i ++ K j, H j ∗ (H i).neg} ^ 2^(2s+1)`.

Kravitz, Kuca and Leng state the lemma for finite multisets in a countable abelian group, for
functions supported on a set `B`, with a loss depending on `|supp(B + B − B)| / |B|`; here
`B = G`, the multisets are replaced by directions, and there is no loss.

*Needs:* 2.2, 2.3.

### 7.2 Generic pairs

Define `badPairMass μ w H = Σ_{i, j} (if H j ∗ (H i).neg = μ then 0 else w i * w j)`. For every
family of direction lists `L i j : Fin m → Measure G`:

`Σ_{i,j} w i w j ‖f‖_{L i j, H j ∗ (H i).neg} ^ 2^(m+1) − badPairMass μ w H ≤
Σ_{i,j} w i w j ‖f‖_{L i j, μ} ^ 2^(m+1)`,

since the norm powers lie in `[0, 1]`. For uniform measures on finite subgroups,
`H j ∗ (H i).neg = μ` exactly when `H_i + H_j = G`.

*Needs:* 7.1.

### 7.3 Concatenation along many directions

**Theorem.** For every `k ≥ 1` there are natural numbers `N ≥ 1` and `C` such that for every
measured abelian group `(G, μ)`, finite `ι`, probability weights `w`, directions
`H : ι → Measure G` and 1-bounded `f`:

`(Σ_i w i * dirBoxNorm μ (fun _ : Fin k ↦ H i) f ^ 2^k) ^ N − C * badPairMass μ w H ≤
gowersNorm μ (2^k − 1) f ^ 2^(2^k − 1)`.

Prove it by strong induction on `k`. For `k = 1`, apply 7.1 with `s = 0` and 7.2. For `k ≥ 2`,
apply 7.1 with `s = k − 1` and `K i = fun _ ↦ H i`, then 7.2; this yields the directions
`(H i)^{k−1}, (H j)^{k−1}, μ`. By 2.2's inductive formula, the sum over `i, j` with weights
`w i w j` is an average, over the variables of the blocks `(H j)^{k−1}` and `μ`, of
`Σ_i w i ‖G‖_{(H i)^{k−1}} ^ 2^(k−1)` for 1-bounded functions `G`. Apply the statement for
`k − 1` to it, with Jensen's inequality for `t ↦ t^{N_{k−1}}`; then do the same for the block
`(H j)^{k−1}`. Every direction is now `μ`, and the dimension is
`(2^{k−1} − 1) + (2^{k−1} − 1) + 1 = 2^k − 1`. The constants depend on `k` alone; this is the
case `B = G` of Kravitz–Kuca–Leng's Proposition 6.2, in a form that replaces the concatenated
directions `H j ∗ (H i).neg` by `μ` at the cost of the bad-pair mass.

**Corollaries.**

- **Mixtures.** For a finite family of 1-bounded functions `h c` with probability weights `α`,
  `(Σ_i w i Σ_c α c ‖h c‖_{(H i)^k} ^ 2^k) ^ N − C * badPairMass μ w H ≤
  Σ_c α c ‖h c‖_{U^{2^k−1}} ^ 2^(2^k−1)`, by Jensen's inequality.
- **Contrapositive form.** For every `k ≥ 1` and `β > 0` there are `δ₁, η₁ > 0` such that if
  `badPairMass μ w H ≤ η₁` and `Σ_c α c ‖h c‖_{U^{2^k−1}} ^ 2^(2^k−1) ≤ δ₁`, then
  `Σ_i w i Σ_c α c ‖h c‖_{(H i)^k} ^ 2^k ≤ β`; take `δ₁ = β^N / 3` and `η₁ = β^N / (3 (C + 1))`.
- **Subgroups.** For uniform measures `H i = ν_{Q_i}` on finite subgroups, `badPairMass` is the
  weight of the pairs with `Q_i + Q_j ≠ G`, and `dirBoxNorm μ (fun _ ↦ ν_{Q_i}) f` is the box norm
  of `f` along `k` copies of `Q_i`.

*Needs:* 7.1, 7.2, 2.2, 2.3, 3.2.

**Checks.**

- `G = ZMod N` with `N = a b`, `Nat.Coprime a b`: the subgroups generated by `a` and by `b` have
  sum `G` (Bézout), so the pair contributes nothing to `badPairMass`.
- `k = 1` with a single index and `H = μ`: `badPairMass = 0` since `μ ∗ μ.neg = μ`, and the
  theorem reads `‖∫ f‖ ^ (2N) ≤ ‖∫ f‖ ^ 2`, true since `‖∫ f‖ ≤ 1` and `N ≥ 1`.
- `s = 0` in 7.1, a single index and `H = (δ₀ + δ_a)/2` on `ZMod N`: in Fourier terms the
  statement is `(Σ_ξ c_ξ |f̂ ξ|²)² ≤ Σ_ξ c_ξ² |f̂ ξ|²` with `c_ξ = cos²(π a ξ / N)`, which is the
  Cauchy–Schwarz inequality and `‖f‖₂ ≤ 1`.

## Worked examples

- On `ZMod N` with the uniform measure, Layer 3 gives the Gowers norms used in the inverse
  theorem: the inductive formula in the form `‖f‖_{U^{s+1}}^{2^{s+1}} = 𝔼_h ‖Δ_h f‖_{U^s}^{2^s}`,
  Fourier control of `U^2` (4.1), invariance under multiplication by `x ↦ c x` for units `c`
  (3.2), and the coset bound (4.4) for the reduction `ZMod N → ZMod q` with `q ∣ N`.
- On `ℤ`, Layer 6 gives the Gowers norm of a function on `{0, …, N − 1}` without choosing a cyclic
  group, and its comparison with the norm in `ZMod M` for every `M ≥ 2N`.
- On `ZMod N`, Layer 7 with subgroups generated by pairwise coprime divisors of `N` replaces an
  average of box norms along those subgroups by a single Gowers norm.

## Downstream consumers

GowersInverseTheorem and NilsequenceEquidistribution, the quasi-polynomial inverse theorem for
the Gowers norms on `ZMod N` of Leng, Sah and Sawhney, consume Layer 3 (inductive formula,
nesting, Gowers–Cauchy–Schwarz, phase invariance, pullback, many large derivatives, the
correlation identity), Layer 4 (Fourier control of `U^2`, multipliers and cosets) and Layer 6
(Gowers norms of functions on integer boxes).
Szemerédi-type counting arguments consume Layer 5, and arithmetic-regularity and density-increment
arguments with several subgroups consume Layer 7.

## Scope and ownership

This roadmap owns:

- discrete-cube combinatorics for Gowers norms (`weight`, `conjPow`, `shift`, `select`);
- uniqueness and negation invariance of invariant probability measures on measured abelian
  groups, and the measure-preserving cube maps;
- box inner products and box norms on products of probability spaces, their Gowers–Cauchy–Schwarz
  inequality, norm properties and control of the cut norm;
- directional box norms along arbitrary directions, difference laws, Haar directions and the
  smoothing inequality;
- multiplicative derivatives, the Gowers inner product and Gowers norms on measured abelian
  groups, with the properties of Layer 3, dual functions and the popularity of large derivatives;
- the Fourier identity for `U^2` on finite and compact abelian groups, definiteness for `k ≥ 2`,
  Fourier multipliers and the coset bound;
- the generalised von Neumann theorem for arithmetic progressions;
- cubes in finite subsets of abelian groups, relative Gowers norms, their Freiman invariance, and
  finite models of finite sets under Freiman isomorphisms of order 2;
- the concatenation of directional box norms of Layer 7, and its subgroup form.

It does not own:

- **Mathlib:** Haar measure and its uniqueness, products and `Measure.pi`, convolution of
  measures, Hölder's inequality, characters of finite abelian groups and their orthogonality,
  Freiman homomorphisms and isomorphisms, additive energy, the structure theorem for finitely
  generated abelian groups.
- **AlmostPeriodicityAndBohrSets §5.1:** continuous characters of compact abelian groups, the
  compact Fourier transform `cft` and its Parseval and convolution identities. Layer 4.2 consumes
  them; Layer 4.1 proves the finite case from Mathlib alone.
- **FourierAnalyticAdditiveCombinatorics:** character sums of sets in finite abelian groups with
  their Parseval identity (its 1.1), and the count of three-term progressions through characters
  (its 1.2–1.3). Layer 5 bounds weighted counts of progressions of any length by Gowers norms,
  a different statement, and neither roadmap depends on the other.
- **ClassicalErgodicTheory:** measure-preserving systems and their factors. The Host–Kra
  seminorms of a measure-preserving system and its Host–Kra cube measures are not built there
  and are outside this roadmap. The Gowers norm of Layer 3 on a compact abelian group is the
  Host–Kra seminorm of the action of `G` on itself by translations; nothing here is stated for
  general systems.
- **PolynomialOrbitsAndCubeGroups:** Host–Kra cube groups of filtered nilpotent groups and their
  Haar measures. Layer 0's cubes are configurations in abelian groups only.
- **GowersInverseTheorem, NilsequenceEquidistribution:** every inverse theorem (for `U^3` and
  beyond), correlation with nilsequences, and the Cauchy–Schwarz arguments specific to the
  inverse theorem, such as the passage from correlations of derivatives to additive quadruples
  and the pigeonholing of correlating summands.
- **Regularity:** regularity lemmas and the cut norm of graphs and hypergraphs. Layer 1.4 bounds
  integrals against products of functions of fewer variables by box norms of functions on
  products of probability spaces; it states nothing about graphs.
- **Tau Ceti:** Tau Ceti's `Finset.sum_sum_pow_four_le` (in
  `TauCeti/Algebra/BigOperators/Finset/BoxCauchySchwarz.lean`, not at the pinned commit) is the
  rectangle bound for real functions on finite sets, a counting form of 1.4's cut-norm control
  for `k = 2`; it is neither restated nor consumed.

The following are outside this roadmap:

- Gowers norms on non-abelian groups, and the domain `L^{2^k/(k+1)}` on which `U^k` is still
  finite; this roadmap works on `L^{2^k}`;
- compact groups that are not second countable, where addition need not be measurable for the
  product σ-algebra;
- concatenation with a support set `B ≠ G`, along polynomial progressions, and the full
  Proposition 6.2 of Kravitz–Kuca–Leng for multisets, as well as the Tao–Ziegler concatenation
  theorems;
- Gowers norms along arbitrary finite subsets of `ℤ^d` beyond Layer 6's Freiman transport.

## Exact supplier contracts

### From Mathlib

At Mathlib `1b1ccf4b`:

- **Measure theory.** `MeasureTheory.Measure.pi`, `MeasureTheory.Measure.prod`,
  `MeasureTheory.integral_prod`, `MeasureTheory.MeasurePreserving`, `MeasurePreserving.prod`,
  `MeasureTheory.measurePreserving_pi`, `MeasureTheory.measurePreserving_piFinSuccAbove`,
  `MeasurePreserving.integral_comp`, `MeasureTheory.MemLp`, `MeasureTheory.eLpNorm`,
  `ENNReal.lintegral_prod_norm_pow_le` (MeasureTheory/Integral/MeanInequalities.lean),
  `MeasureTheory.integral_mul_le_Lp_mul_Lq_of_nonneg`, `generateFrom_pi`,
  `MeasureTheory.StronglyMeasurable.integral_prod_right`.
- **Groups with measures.** `MeasurableAdd₂`, `MeasurableNeg`, `Measure.IsAddLeftInvariant`,
  `ContinuousAdd.measurableMul₂`, `Measure.IsAddHaarMeasure`,
  `Measure.isAddHaarMeasure_eq_of_isProbabilityMeasure` (MeasureTheory/Measure/Haar/Unique.lean),
  `Measure.conv` and its notation `∗` (MeasureTheory/Group/Convolution.lean), `Measure.neg`,
  `AddCircle.haarAddCircle`.
- **Finite probability.** `ProbabilityTheory.uniformOn` (Probability/UniformOn.lean),
  `DiscreteMeasurableSpace`, `Finset.expect`.
- **Characters.** `AddChar`, `Circle`, `AddChar.card_eq`, `AddChar.expect_apply_eq_ite`,
  `AddChar.complexBasis` (Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean),
  `AddChar.wInner_cWeight_eq_boole` (Analysis/Fourier/FiniteAbelian/Orthogonality.lean).
- **Additive combinatorics.** `IsAddFreimanIso` (Combinatorics/Additive/FreimanHom.lean),
  `Finset.addEnergy` (Combinatorics/Additive/Energy.lean),
  `AddCommGroup.equiv_free_prod_directSum_zmod` (GroupTheory/FiniteAbelian/Basic.lean).

### From Tau Ceti

At Tau Ceti `2fd255d`: nothing is consumed. The compact examples use Mathlib's additive Haar
measure directly.

### From TauCetiRoadmap.AlmostPeriodicityAndBohrSets

- §5.1: the identification of continuous characters `ψ : AddChar G Circle` of a compact Hausdorff
  abelian group, the compact Fourier transform `cft f ψ = ∫ f * conj ψ dμ`, Parseval
  `‖f‖₂² = Σ_ψ ‖cft f ψ‖²` and the convolution identity. Used in 4.2 and 4.3 only.

## Provenance

This roadmap was extracted from a Lean development of Hindman's finite sums-and-products
theorem, part of whose code is derived from openai/math (Apache-2.0, commit `adc7f124`). That
source works on finite abelian groups with uniform averages and contains:

- Gowers norms through iterated multiplicative derivatives, with the inductive formula, nesting,
  the triangle inequality through mixed Gowers moments, invariance under characters, translation
  and pullback along homomorphisms to finite groups, and the coset bound;
- Gowers norms relative to a finite set normalised by cube counts, and their transport along
  homomorphisms injective on additive quadruples of the set;
- box norms along lists of subgroups with the Gowers–Cauchy–Schwarz inequality, the subgroup form
  of Kravitz–Kuca–Leng's Lemma 6.1 with weights, the replacement of generic pairs, and the
  iterated concatenation with constants depending only on `k`.

The roadmap generalises it to measured abelian groups and products of probability spaces, to
arbitrary directions, and to Freiman isomorphisms; Layers 1, 2.4 and 5 have no formal precursor
there. LeanAPAP has Fourier analysis on finite abelian groups but no Gowers or box norms. Neither
source is prescriptive.

## References

- W. T. Gowers, *A new proof of Szemerédi's theorem*, Geom. Funct. Anal. 11 (2001) 465–588
  (Gowers norms, Gowers–Cauchy–Schwarz, control of progression counts).
- W. T. Gowers, *Hypergraph regularity and the multidimensional Szemerédi theorem*, Ann. of Math.
  166 (2007) (box norms on products).
- B. Green and T. Tao, *Linear equations in primes*, Ann. of Math. 171 (2010) 1753–1850
  (generalised von Neumann theorems).
- T. Tao and V. Vu, *Additive Combinatorics*, Cambridge University Press 2006 (Gowers norms and
  Freiman isomorphisms).
- T. Tao, *Higher Order Fourier Analysis*, Graduate Studies in Mathematics 142, Amer. Math. Soc.
  2012 (Gowers norms on finite and compact abelian groups, dual functions).
- B. Host and B. Kra, *Nonconventional ergodic averages and nilmanifolds*, Ann. of Math. 161
  (2005) 397–488 (the ergodic analogue; outside this roadmap).
- N. Kravitz, B. Kuca and J. Leng, *Quantitative concatenation for polynomial box norms*,
  arXiv:2407.08636v3: box norms along multisets, §3.3, (20)–(22) and Lemma 3.5; Lemma 6.1 and
  Proposition 6.2 (Layer 7).
- B. Kuca, *Multidimensional polynomial patterns over finite fields: bounds, counting estimates
  and Gowers norm control*, Adv. Math. 448 (2024) 109700 (the finite-field precursor of the
  concatenation lemma, cited by Kravitz–Kuca–Leng).
- T. Tao and T. Ziegler, *Concatenation theorems for anti-Gowers-uniform functions and Host–Kra
  characteristic factors*, Discrete Anal. 2016, 13.
- J. Leng, A. Sah and M. Sawhney, *Quasipolynomial bounds for the inverse theorem for the Gowers
  `U^{s+1}[N]`-norm*, arXiv:2402.17994 (the downstream consumer).
- Y. Dillies and B. Bloom, LeanAPAP, `github.com/YaelDillies/LeanAPAP` (Apache-2.0): Fourier
  analysis on finite abelian groups.
- OpenAI, openai/math at commit `adc7f124` (Apache-2.0): see Provenance.
