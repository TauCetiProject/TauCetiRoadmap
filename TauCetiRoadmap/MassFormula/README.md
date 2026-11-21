# Roadmap: counting totally ramified extensions of a local field, and Serre's mass formula

**Summary.** The [local fields and ramification
roadmap](../../Completed/LocalFieldsRamification/README.md) builds the arithmetic of a finite
extension of a non-archimedean local field: total ramification, Eisenstein generators,
monogenicity, the different and the discriminant, and the tame criterion. This roadmap is that
theory's counting consumer. It asks how *many* such extensions there are, and proves the answer —
the **mass formula** of [Serre 1978]: inside a fixed separable closure, the totally ramified
extensions of degree `n` of a local field `K` satisfy

```text
∑_{L ∈ σ_K(n)} q^{-c(L)} = n,          c(L) = d(L) − n + 1
```

where `q` is the residue cardinality and `d(L)` the discriminant exponent, together with its
isomorphism-class form `∑_{M} 1 / (#Aut_K(M) · q^{c(M)}) = 1`. It is the local counting statement
behind mass heuristics for global field counting. Mathlib has no such count.

The machinery the count needs is not ramification theory, and that is what makes this a separate
roadmap: a **quantitative Newton estimate** over a discrete valuation ring (Mathlib's
`hensels_lemma` is that estimate over `ℤ_[p]` only, and `HenselianLocalRing` lifts a simple root
with no distance bound, hence no count), the **lattice-index scaling law** for Haar measure over
such a ring (Mathlib's `Measure.addHaar_image_linearMap` is real-vector-space only), and the
parametrization of `σ_K(n)` by the **Eisenstein region** of coefficient space. The first two are
stated over an arbitrary discrete valuation ring (Henselian, for the Newton estimate; with finite
residue field, for the index) and are reusable well outside this roadmap.

Every target of Layers 0–4 is proved in Tau Ceti at the pinned commit, on the objects this README
specifies; *From Tau Ceti* below lists the declarations, and `Suggested.lean` states the headline
targets on them and closes each by the library's theorem.

Two roadmaps consume the count: the [étale mass formula roadmap](../EtaleMassFormula/README.md)
applies Serre's formula over each unramified extension of `K` to obtain Bhargava's mass formula,
and the [`p`-adic extension families roadmap](../PadicExtensionFamilies/README.md) refines it by
discriminant (Krasner's count) on the same `σ_K(n)` and wild exponent.

Home: `TauCeti/NumberTheory/LocalField/MassFormula/`, with the general layers placed by subject:
quantitative Newton lifting in `TauCeti/RingTheory/DiscreteValuationRing/`, the lattice index in
`TauCeti/LinearAlgebra/FreeModule/` beside Mathlib's `ℤ` analogue, and the Haar scaling law in
`TauCeti/MeasureTheory/Group/`.

## How to read the build

The layers are in dependency order. Layer 0 comes first and rests on the consumed contract. The
Newton estimate of Layer 1 and all of Layer 2 are independent of Layer 0 and of each other —
general statements about discrete valuation rings; the local constancy of the root count
quantifies over finite subextensions and is applied to `σ_K n`. Layer 3 needs 0–2; Layer 4 needs
Layer 3, except for the orbit count, which needs only Layer 0.

## Conventions

The objects are junk-tolerant by design, so these choices fix the statements.

- **The base field.** `K` carries
  `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`.
  Spell the hypotheses out; do not bundle them. Mathlib's instances then supply
  `IsDiscreteValuationRing 𝒪[K]`, `Finite 𝓀[K]`, `CompactSpace 𝒪[K]` and
  `IsAdicComplete 𝓂[K] 𝒪[K]` by `inferInstance`; consume them, never re-prove them.
- **The residue cardinality is written inline as `Nat.card 𝓀[K]`**, and the residue
  characteristic as `ringChar 𝓀[K]`; `q` below abbreviates the former in prose only, as `σ_K n`
  and `c L` abbreviate `totallyRamifiedOfDegree K n` and `L.wildExponent`. Do not introduce a `q`
  or `p` abbreviation. A weight `q^{−k}` is spelled `1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ k`.
- **Extensions live inside a separable closure.** An extension is a term of
  `IntermediateField K (SeparableClosure K)`. This is Serre's setting and it is load-bearing: in
  equal characteristic `p` the inseparable Eisenstein polynomials (`X^p − π`) must not be counted,
  and working inside `SeparableClosure K` excludes them by construction rather than by a side
  hypothesis. The supplier states its ramification theory for a finite extension `L/K` as such;
  the bridge to subextensions of `SeparableClosure K` is Layer 0, which installs the supplier's
  `finiteIntermediateField*` structures.
- **The discriminant exponent is the supplier's.** `d L` is `TauCeti.discriminantExponent`,
  totalized over arbitrary subextensions as `IntermediateField.discriminantExponent`; for a totally
  ramified extension its different exponent `v_L(𝔡)` and the valuation of its discriminant ideal
  in `K` agree, since the residue degree is `1`
  (`discriminantExponent_eq_inertiaDegree_mul_differentExponent`). Do not introduce a second
  discriminant.
- **Junk is tolerated, `0 < n` is not optional.** For `L` infinite over `K`, or for `n = 0`, these
  definitions take junk values. Statements about `σ_K n` carry `0 < n` where it is needed, and
  membership in `σ_K n` is what makes a statement honest. Do not add finiteness hypotheses to
  definitions to avoid junk; add them to theorems.
- **Sums are in `ℝ≥0∞`.** Theorems 1 and 2 are stated with `∑'` valued in `ℝ≥0∞`, where the
  possibly infinite sum needs no convergence side condition and equality with `n` (resp. `1`)
  already encodes convergence. The convergence remark is a *separate* statement over `ℝ`; state
  both and relate them, and do not merge them.
- **Representative sets are a predicate, not a quotient.** `IsRepresentativeSet n R` says that
  `R ⊆ σ_K n` and every `L ∈ σ_K n` is `K`-isomorphic to exactly one member of `R`; Theorem 2
  quantifies over every such `R`. This is Serre's formulation and avoids `Quotient.lift`
  well-definedness obligations for `c` and `#Aut`.
- **The coefficient space and its measure.** A monic degree-`n` polynomial is its coefficient
  vector `a : Fin n → K`, with `a i` the coefficient of `X ^ i` (`monicOfCoeff a`). The measure is
  an additive Haar measure of `Fin n → K` normalized so that the integer box `integerBox K (Fin n)`
  has volume `1`; by uniqueness of Haar measure this is the product of the normalized coordinate
  measures, but the product structure is needed only inside proofs, so neither `Measure.pi` nor
  σ-finiteness appears in any statement. Statements that do not depend on the normalization do
  not assume it.
- **Valuations in an extension are `IsDiscreteValuationRing.addVal`**, `ℕ∞`-valued. All estimates
  are `addVal` estimates, the spelling of the supplier's `addVal_sum_eisenstein_powerBasis`. The
  supplier's structures put the canonical topology and valuation on a subextension carrier; no
  statement here hypothesizes a second uniform structure.

## Layer 0: the counting invariants

### 0.1 The set `σ_K(n)` and its Eisenstein generators

`σ_K(n)` is the set of subextensions of `SeparableClosure K` that are totally ramified of degree
`n` over `K`, through `IntermediateField.IsTotallyRamified`, which installs the supplier's
`finiteIntermediateField*` structures and agrees with `TauCeti.IsTotallyRamified` on a finite
subextension by unfolding. With the bridge lemmas the count needs: `σ_K(1) = {K}`; every member
is `K⟮x⟯` for `x` a root of a monic Eisenstein polynomial of degree `n`, the supplier's
`isTotallyRamified_iff_exists_eisenstein_generator` transported to this setting; conversely,
`K⟮x⟯ ∈ σ_K(n)` for every root `x ∈ SeparableClosure K` of a degree-`n` Eisenstein polynomial over
`𝒪[K]`, which transports the supplier's `isTotallyRamified_of_eisenstein_adjoin_eq_top` and is the
direction Layer 3's root-count identity and Layer 4's orbit count apply; and membership is
preserved by `K`-isomorphism, a corollary of the converse.

### 0.2 The wild exponent

`c L := d L + 1 − n` in truncated `ℕ`-subtraction. The supplier's
`ramificationIndex_sub_one_le_discriminantExponent` with `e = n` gives `n − 1 ≤ d L`, which makes
the truncation faithful, so `c` is Serre's nonnegative integer; with the supplier's tame criterion
it gives `c L = 0 ⟺ ¬ (ringChar 𝓀[K] ∣ n)`. Both are corollaries of the supplier's facts, not
fresh developments.

### 0.3 Invariance of `c` under `K`-isomorphism

A `K`-isomorphism carries integral bases to integral bases with the same discriminant, so `d`,
hence `c`, is an invariant of the class. The arithmetic invariance is the supplier's
`discriminantExponent_eq_of_algEquiv`; the target here is its transport to the totalized
exponent and to `wildExponent`, junk case included, which is the regrouping Theorem 2 runs along.

### 0.4 The box and cube corollaries of the power-basis orthogonality

The supplier's `addVal_sum_eisenstein_powerBasis` gives, at an Eisenstein generator `ξ` of degree
`n`, that the terms of `∑_{i<n} c_i ξ^i` have pairwise distinct valuations — the `i`-th is
`n · addVal(c_i) + i`, distinct modulo `n` — so no cancellation is possible and the valuation of
the sum is the minimum of the terms'. The targets here are its family-level consequences: a ball
of the ring of integers is a box in power-basis coordinates — the ball `v_L ≥ r` is
`∏_{i<n} π^{⌈(r − i)/n⌉} · 𝒪[K]`, that is `c_i ∈ 𝓂[K] ^ ((r − i) ⌈/⌉ n)` for every `i`, with the
`ℕ`-truncated ceiling division `(r − i) ⌈/⌉ n = (r − i + n − 1) / n`, so the `i`-th factor is
`𝒪[K]` itself when `r ≤ i` — and at a radius `r = n · ρ` it is the cube with every factor
`π^ρ · 𝒪[K]`. These are the workhorse of Layers 2 and 3.

## Layer 1: quantitative Newton lifting over a discrete valuation ring

The Newton estimate is stated for an arbitrary Henselian discrete valuation ring, since nothing in
it uses the local field; the local-field case is an instance, because `𝒪[K]` is complete. The
local constancy of the root count is stated over `K`.

### 1.1 Newton iteration with an estimate

If `addVal (F y₀) > 2 · addVal (F' y₀)`, the iteration `y ↦ y − F y / F' y` converges to a root
`z` of `F` with `addVal (F y₀) = addVal (F' y₀) + addVal (z − y₀)`, and `z` is the unique root in
that ball. Uniqueness is the algebraic statement that two roots `z ≠ z'` of `F` satisfy
`addVal (z − z') ≤ addVal (F' z)`, from the Taylor expansion of `F` at `z`; it uses no
completeness, and it is the form the local fibre count of Layer 3 applies. This is Mathlib's
`hensels_lemma` (`Mathlib/NumberTheory/Padics/Hensel.lean`), stated there over `ℤ_[p]` only and in
norm spelling, over an arbitrary Henselian discrete valuation ring in `addVal` spelling;
`HenselianLocalRing` lifts a simple root modulo the maximal ideal and yields no distance bound.
The estimate, not the existence, is what Layer 3 consumes.

### 1.2 Local constancy of the root count

For a monic `f` over `𝒪[K]`, separable over `K`, there is a threshold `T > 0`, depending on `f`
only, such that every monic `g` with `g.coeff i − f.coeff i ∈ 𝓂[K]^T` for all `i` has exactly as
many roots as `f` in every finite subextension of `SeparableClosure K`, in particular in every
`L ∈ σ_K n`. The route is a Bézout certificate `U · f + V · f' = β` over `𝒪[K]` bounding the order
of `f'` at every near-root uniformly, then Newton lifting in both directions.

This is not Krasner's lemma. Mathlib's Krasner (`Analysis/Normed/Field/Krasner.lean`) is a
normed-field statement about a *single* root generating an extension; what Layer 3 needs is a
*count* that is uniform on a coefficient ball, which Krasner does not give. Keep the two apart and
do not route this layer through the normed setting.

## Layer 2: lattices, index, and the Haar scaling law

The index is stated for an arbitrary discrete valuation ring with finite residue field of
cardinality `q`; it uses no completeness. The scaling law is over `K`, whose `𝒪[K]` is such a ring.

### 2.1 The index of an image lattice

For a square matrix `M` over a discrete valuation ring with `Associated M.det (π^k)`, the quotient
of the integer box by its image under `M` has exactly `q^k` elements. Via
`Submodule.quotientEquivPiSpan` (Smith normal form over a principal ideal ring), the quotient
splits into residue rings of the diagonal coefficients, whose product is associated to `M.det`.
Mathlib's `AddSubgroup.index_eq_natAbs_det` is the `ℤ` analogue.

### 2.2 The scaling law

For an additive Haar measure `μ` of `ι → K`, `μ (M '' S) = q^{−k} · μ S` for every set `S` — the
non-archimedean analogue of `Measure.addHaar_image_linearMap`. For `S` the box or any ball it is
the index, with no side condition, and that is the form Layer 3 consumes. For general `S`,
`μ (M '' ·)` is again a Haar measure, so the constant is read off the box by uniqueness of Haar
measure (`isAddLeftInvariant_eq_smul_of_regular`), at the price of the hypothesis `μ.Regular`,
which Mathlib's `addHaarMeasure` carries by instance and which no Layer 3 statement needs.

### 2.3 Boxes and balls

The image lattice of a diagonal matrix is the coordinate box with `i`-th factor `π^{e i} · 𝒪[K]`,
of volume `q^{−∑ e i}`; a ball is a translate of the lattice of a constant-radius box. With
Layer 0's orthogonality this computes the volume of a ball of the ring of integers of `L` in
power-basis coordinates, which is the only other volume the summit needs.

## Layer 3: the Eisenstein region and the parametrization

### 3.1 The Eisenstein region

`E_n = eisensteinSet K n ⊆ (Fin n → K)`: every coefficient in `𝓂[K]`, with the constant term of
valuation exactly that of a uniformizer. The bridge the parametrization runs on: `a ∈ E_n` exactly
when `monicOfCoeff a` is the image of a polynomial over `𝒪[K]` that is
`Polynomial.IsEisensteinAt 𝓂[K]`. For `0 < n` its measure is `q^{−n} · (1 − q^{−1})`.

### 3.2 Almost every Eisenstein polynomial is separable

[Serre 1978, eq. (3)]: the non-separable locus is null for every additive Haar measure. In equal
characteristic this is where the inseparable polynomials are discarded, and it is the reason the
count is over subextensions of `SeparableClosure K`.

### 3.3 The root-count identity

For `L ∈ σ_K n`, `L.rootCount a` is the number of roots of `monicOfCoeff a` lying in `L`, counted
with multiplicity. On the full-measure separable locus all multiplicities are `1`. Almost
everywhere on `E_n`, `∑_{L ∈ σ_K n} L.rootCount a = n`: an Eisenstein polynomial is irreducible,
and each of its `n` roots generates exactly one member of `σ_K n`. The identity holds for every
additive Haar measure.

### 3.4 Almost-everywhere measurability of the root count

For each `L ∈ σ_K n`, `fun a ↦ (L.rootCount a : ℝ≥0∞)` is almost-everywhere measurable for
`μ.restrict (eisensteinSet K n)`. Layer 1 makes the root count locally constant on the separable
Eisenstein locus, and the non-separable locus is null.

### 3.5 Countability of the family

For `0 < n`, `σ_K n` is countable. At the coefficient vector of an Eisenstein generator of each
`L`, local constancy gives an open piece of `E_n` of positive Haar measure on which `rootCount L`
is positive. For any finite subfamily, the sum of the root-count integrals is at most `n · μ(E_n)`,
by the almost-everywhere root-count identity. This finite bound forces the family of positive
integrals, hence `σ_K n`, to be countable, without using Theorem 1.

### 3.6 The local fibre count

[Serre 1978, Lemma 1]: for `L ∈ σ_K n` with uniformizer `ξ` of minimal polynomial `f`, and
`d = d L` — which is `addVal (f' ξ)`, since `𝒪_L = 𝒪[K][ξ]` makes Mathlib's
`conductor_mul_differentIdeal` (with `conductor_eq_top_of_adjoin_eq_top`) read
`differentIdeal = (f' ξ)`, and the residue degree is `1` — and for every `r > d`: a monic `g` of
degree `n` over `𝒪[K]` has a root `z` with `addVal (z − ξ) ≥ r` if and only if
`addVal (g ξ) ≥ r + d`, and then exactly one. Existence is Layer 1 at `ξ`, where
`addVal (g' ξ) = d`; uniqueness is that the threshold transports the derivative order to any root
`z` of `g` in the ball, `addVal (g' z) = d`, and two distinct roots `z ≠ z'` would then give
`d = addVal (g' z) ≥ addVal (z − z') ≥ r`; the converse is the Taylor expansion of `g` at a root
in the ball. By the power-basis orthogonality, at `r = n · ρ` the condition
`addVal (g ξ) ≥ n · ρ + d` is a box in coefficient space, of measure `q^{−(n · ρ + d)}`, which is
`q^{−d}` times the volume `q^{−n · ρ}` of the cube in power-basis coordinates: the lattice whose
volume the integral below computes. The radius must exceed `d`: for `K = ℚ_2` and `ξ = √2`, where
`d = 3`, the ball `addVal (z − ξ) ≥ 2` is `ξ + 2 · 𝒪_L` and contains both roots of `X² − 2`.

### 3.7 The integral of the root count

[Serre 1978, Lemmas 2 and 3, eqs. (5)–(13)]: for each `L ∈ σ_K n`,
`∫_{E_n} rootCount L = q^{−(d L + 1)} · (1 − q^{−1})` for the normalized measure. The change of
variables runs in power-basis coordinates: a ball of the ring of integers is the ideal generated
by a suitable element, in coordinates the image lattice of the matrix of multiplication by it,
whose determinant is that element's norm — so Layer 2 supplies the factor `q^{−d L}` with no
Jacobian, no conjugates and no Vandermonde.

## Layer 4: the mass formulas

### 4.1 Theorem 1

[Serre 1978, Thm. 1]: `∑' L : σ_K n, 1 / q ^ c L = n` in `ℝ≥0∞`. For `0 < n`, integrate the
root-count identity of 3.3 over `E_n`, interchange the sum and integral using
`MeasureTheory.lintegral_tsum` with the countability of 3.5 and the measurability of 3.4, and
divide by the measure of the region; for `n = 0` both sides are `0`.

### 4.2 The finiteness dichotomy

[Serre 1978, Rmk. 1°]: for `0 < n`, `σ_K n` is infinite if and only if `K` has equal
characteristic `p` and `p ∣ n`. The forward direction follows from Theorem 1 together with the
uniform bound `c L ≤ n · natCastValuation K n h`, for `h : (n : K) ≠ 0`, which is available
exactly outside the asserted case — the supplier's upper bound `differentExponent_bounds_of_wild`
at `e = n`, its `natCastValuation L n` being `n · natCastValuation K n h` since `L / K` is totally
ramified; the converse is an explicit family — the Eisenstein polynomials `X^n + π^m X + π` for
`m ≥ 1` have `d = n · m`, pairwise distinct, hence generate infinitely many distinct members.

### 4.3 Convergence

[Serre 1978, Rmk. 1°]: the real series `∑ L : σ_K n, 1 / (q : ℝ) ^ c L` converges with sum `n`, a
corollary of Theorem 1 through `ENNReal.summable_toReal`; it carries information only in the
infinite case.

### 4.4 The orbit count

[Serre 1978, Rmk. 3°]: for `L ∈ σ_K n`, the number of `M ∈ σ_K n` that are `K`-isomorphic to `L`,
times `#Aut_K(L)`, is `n`. `L / K` is separable of degree `n`, so it has exactly `n` embeddings
into `SeparableClosure K`; each image lies in `σ_K n` by 0.1; and the embeddings with a given image
form a torsor under `Aut_K(L)`.

### 4.5 Theorem 2

[Serre 1978, Thm. 2]: for `0 < n` and every `R` with `IsRepresentativeSet n R`,
`∑' M : R, 1 / (#Aut_K(M) · q ^ c M) = 1` in `ℝ≥0∞`. Theorem 1 regrouped along isomorphism
classes, using the invariance of `c` from 0.3 and the orbit count.

### 4.6 The tame count

When `¬ (ringChar 𝓀[K] ∣ n)`, every `c L = 0`, so `σ_K n` is finite with exactly `n` elements.

## Worked examples (acceptance criteria, keeping the definitions honest)

They catch a vacuous `σ`, a wrong normalization of the measure, and an off-by-one in `c`. Each is
proved in Tau Ceti.

- **`n = 1`:** `σ_K 1 = {K}` with `d = c = 0`, and Theorem 1 reads `1 = 1`.
- **Tame:** for `K = ℚ_p` with `p` odd and `n = 2`, `σ_K 2` has exactly two elements (`ℚ_p(√p)`
  and `ℚ_p(√(u p))` for `u` a non-residue unit), both with `c = 0`, so the sum is `2`. This is the
  tame count above in its smallest instance.
- **Wild, and the sharpest test of `c`:** for `K = ℚ_2` and `n = 2`, `σ_K 2` has six elements —
  `ℚ_2(√−1)` and `ℚ_2(√−5)` with `d = 2`, hence `c = 1`; and `ℚ_2(√±2)`, `ℚ_2(√±10)` with `d = 3`,
  hence `c = 2`. Theorem 1 reads `2 · 2^{−1} + 4 · 2^{−2} = 2`. An implementation that gets `c`
  off by one fails here and nowhere earlier. The supplier's worked examples give the lower breaks
  `b = 1` of `ℚ_2(i)` and `b = 2` of `ℚ_2(√2)`, and Hilbert's formula for a quadratic extension,
  `d = b + 1`, turns them into `d = 2` and `d = 3`: the supplier's `d` and the `d` here are the
  same invariant.
- **Equal characteristic:** for `K = 𝔽_p((t))` and `n = p`, `σ_K n` is infinite, yet the real
  series converges — the two halves of Remark 1° on the same example.
- **The measure of the Eisenstein region** is `q^{−n}(1 − q^{−1})`, and the integral of
  `rootCount L` over it is `q^{−(d L + 1)}(1 − q^{−1})`; summing over `L` recovers `n` times the
  measure of the region. Checking the two constants against each other catches a misnormalized
  Haar measure, which is otherwise invisible until the summit.
- **Galois case of the orbit count:** for `L / K` Galois in `σ_K n`, `#Aut_K(L) = n` and the
  isomorphism class of `L` inside `σ_K n` is `{L}`.

## Continuations in other roadmaps

Krasner's refinement of Serre's formula, the count of the totally ramified extensions of given
degree *and* given discriminant, is [Layer 5 of the `p`-adic extension families
roadmap](../PadicExtensionFamilies/README.md#layer-5-krasners-count-by-degree-and-discriminant),
stated on `totallyRamifiedOfDegree` and the wild exponent of this roadmap. Bhargava's
generalization to a mass formula over all étale extensions of a local field, the local input to
the conjectured densities of number-field discriminants, is the [étale mass formula
roadmap](../EtaleMassFormula/README.md).

## Scope and ownership

This roadmap owns the **counting** of totally ramified extensions of a local field: the set
`σ_K(n)` as an object, the wild exponent `c` as its weight, the analytic and measure-theoretic
machinery that evaluates the count, and the mass formulas with the finiteness, convergence and
orbit statements that accompany them.

It does not own the arithmetic of the individual extension. **Total ramification, Eisenstein
generators, monogenicity, the different, the discriminant, and the tame criterion belong to the
[local fields and ramification roadmap](../../Completed/LocalFieldsRamification/README.md)**; the
contract this roadmap consumes from it is listed below. It also does not own higher ramification
groups, Herbrand functions or Hasse–Arf (same roadmap); local class field theory; adic or
Huber-theoretic geometry over `K`, which is the [adic spaces
roadmap](../../Completed/AdicSpaces/README.md); or archimedean local fields, which
`IsNonarchimedeanLocalField` excludes and which never enter.

The set `σ_K(n)` and the wild exponent as a counting weight, with its invariance under
`K`-isomorphism derived from the supplier's exponent invariance; the box and cube descriptions
that follow from the supplier's power-basis orthogonality; quantitative Newton lifting over a
discrete valuation ring and the local constancy of root counts it yields; the lattice-index
formula over a discrete valuation ring with finite residue field and the Haar scaling law over
`K`; the measure of the Eisenstein region and the parametrization it carries; and the two mass
formulas with their finiteness, convergence and orbit-counting companions. None of this is in
Mathlib, and none of it is claimed by the roadmap this one consumes.

## Exact supplier contracts

### From the local fields and ramification roadmap

That roadmap is complete, and its exports are Tau Ceti declarations; its *Downstream consumers*
entry for MassFormula records what it supplies here. This roadmap's targets rest on these items
and add no independent development of the same material.

| Consumed item | Tau Ceti declaration |
| --- | --- |
| total ramification, and the residue-degree criterion | `TauCeti.IsTotallyRamified`, `isTotallyRamified_iff_inertiaDegree_eq_one` |
| `e · f = [L:K]` | `ramificationIndex_mul_inertiaDegree` |
| totally ramified ⟹ Eisenstein generator | `isTotallyRamified_iff_exists_eisenstein_generator`, `IsTotallyRamified.exists_eisenstein_adjoin_eq_top` |
| an Eisenstein root generates a totally ramified extension, and its power basis generates the ring of integers ([Serre 1979, Chap. I, §6, Prop. 17]) | `isTotallyRamified_of_eisenstein_adjoin_eq_top`, `algebra_adjoin_eq_top_of_eisenstein_adjoin_eq_top`, `adjoin_eq_top_of_eisenstein_of_natDegree_eq_finrank` (`Eisenstein/TotallyRamified.lean`) |
| local monogenicity | `exists_integerRing_adjoin_eq_top` |
| the different and discriminant exponents | `differentExponent`, `discriminantExponent`, `localDiscriminantIdeal`, `discriminantExponent_eq_inertiaDegree_mul_differentExponent` |
| the lower bound `e − 1 ≤ d` | `ramificationIndex_sub_one_le_discriminantExponent` |
| the tame criterion and the wild bounds for `(e : L) ≠ 0` | `differentExponent_eq_ramificationIndex_sub_one_iff`, `differentExponent_bounds_of_wild` |
| invariance under `K`-isomorphism | `differentExponent_eq_of_algEquiv`, `discriminantExponent_eq_of_algEquiv` |
| Eisenstein power-basis orthogonality | `addVal_sum_eisenstein_powerBasis` |
| structure on a finite intermediate-field carrier | `finiteIntermediateFieldNormedField`, `finiteIntermediateFieldValuativeRel`, `finiteIntermediateFieldTopology`, `finiteIntermediateField_valuativeExtension`, `finiteIntermediateField_isValuativeTopology`, `finiteIntermediateField_isNonarchimedeanLocalField` |

All names are in namespace `TauCeti`. The lower bound `n − 1 ≤ d` is not a corollary of
`differentExponent_bounds_of_wild`, whose hypothesis `(e : L) ≠ 0` fails in equal characteristic
`p` with `p ∣ n`, the case in which `σ_K(n)` is infinite; it rests on Mathlib's
`pow_sub_one_dvd_differentIdeal` (`Mathlib/RingTheory/DedekindDomain/Different.lean`).

### From Tau Ceti

At the pinned commit Tau Ceti proves every target of Layers 0–4 and every worked example. Files
are under `TauCeti/NumberTheory/LocalField/MassFormula/` unless another directory is given; names
are in namespace `TauCeti` unless they begin with `IntermediateField.`, `Polynomial.`, `Matrix.` or
`MeasureTheory.`.

- *Layer 0* (`Basic.lean`, `Eisenstein/Basic.lean`, `Orbit.lean`): `totallyRamifiedOfDegree`,
  `IntermediateField.IsTotallyRamified` with `IntermediateField.isTotallyRamified_iff`,
  `IntermediateField.discriminantExponent` with `IntermediateField.discriminantExponent_eq`,
  `IntermediateField.wildExponent`, `totallyRamifiedOfDegree_one`,
  `exists_eisenstein_generator_of_mem_totallyRamifiedOfDegree`,
  `adjoin_mem_totallyRamifiedOfDegree_of_eisenstein`,
  `mem_totallyRamifiedOfDegree_of_algEquiv`,
  `IntermediateField.sub_one_le_discriminantExponent`,
  `IntermediateField.wildExponent_eq_zero_iff`,
  `IntermediateField.discriminantExponent_eq_of_algEquiv`,
  `IntermediateField.wildExponent_eq_of_algEquiv`; and
  `Polynomial.le_addVal_sum_eisenstein_powerBasis_iff` with its cube form
  `Polynomial.natDegree_mul_le_addVal_sum_eisenstein_powerBasis_iff`
  (`TauCeti/NumberTheory/LocalField/Eisenstein/Box.lean`).
- *Layer 1*: `Polynomial.exists_isRoot_addVal_eval_eq`, `Polynomial.eq_of_isRoot_of_addVal_lt`
  and `Polynomial.existsUnique_isRoot_addVal_lt`
  (`TauCeti/RingTheory/DiscreteValuationRing/Hensel.lean`, over a Henselian discrete valuation
  ring); `exists_card_aroots_eq` (`TauCeti/NumberTheory/LocalField/RootCount/Basic.lean`).
- *Layer 2*: `Matrix.card_quotient_range_mulVecLin_eq_pow`
  (`TauCeti/LinearAlgebra/FreeModule/CardQuotient.lean`); `integerBox` and
  `MeasureTheory.Measure.addHaar_image_mulVec`
  (`TauCeti/MeasureTheory/Group/LocalFieldScaling.lean`).
- *Layer 3*: `eisensteinSet`, `mem_eisensteinSet_iff_exists_isEisensteinAt` and
  `measure_eisensteinSet` (`Eisenstein/Region.lean`);
  `ae_separable_monicOfCoeff_restrict_eisensteinSet` (`Eisenstein/Separable.lean`);
  `IntermediateField.rootCount` (`TauCeti/FieldTheory/IntermediateField/RootCount.lean`) over
  `Polynomial.monicOfCoeff` (`TauCeti/RingTheory/Polynomial/Monic/OfCoeff.lean`);
  `ae_tsum_rootCount_eq` and `aemeasurable_rootCount_restrict_eisensteinSet` (`RootCount.lean`);
  `countable_totallyRamifiedOfDegree` (`Countable.lean`);
  `IntermediateField.existsUnique_isRoot_le_addVal_iff` (`Fibre.lean`);
  `IntermediateField.lintegral_rootCount` (`Integral.lean`).
- *Layer 4* (`Main.lean`, `Orbit.lean`, `Representative.lean`):
  `tsum_one_div_natCard_residueField_pow_wildExponent`,
  `infinite_totallyRamifiedOfDegree_iff`,
  `hasSum_one_div_natCard_residueField_pow_wildExponent`,
  `summable_one_div_natCard_residueField_pow_wildExponent`,
  `ncard_isomorphic_mul_natCard_algEquiv`, `IsRepresentativeSet`,
  `IsRepresentativeSet.tsum_one_div_natCard_algEquiv_mul_natCard_residueField_pow_wildExponent`,
  `encard_totallyRamifiedOfDegree_of_not_dvd`.
- *Worked examples*: `Quadratic/PadicTwo.lean` (`totallyRamifiedOfDegree_two_eq_padicTwo`),
  `LaurentSeries.lean` (`hasSum_one_div_natCard_pow_wildExponent_laurentSeries`),
  `Total.lean` (`tsum_lintegral_rootCount_eq_of_normalized`), and
  `setOf_isomorphic_eq_singleton_of_normal` (`Orbit.lean`).

### From Mathlib

- **Local fields:** `Mathlib/NumberTheory/LocalField/Basic.lean` — `IsNonarchimedeanLocalField`
  and the instance package above, plus `valueGroupWithZeroIsoInt`. `IsAdicComplete 𝓂[K] 𝒪[K]` is
  an instance there; it is not a gap and must not be reproved.
- **Notation and valuations:** `Mathlib/Topology/Algebra/Valued/ValuativeRel.lean`,
  `Mathlib/RingTheory/Valuation/ValuativeRel/*`, and
  `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` (`IsDiscreteValuationRing.addVal`,
  `exists_irreducible`, `Irreducible.maximalIdeal_eq`).
- **Eisenstein polynomials:** `Mathlib/RingTheory/Polynomial/Eisenstein/*`
  (`Polynomial.IsEisensteinAt`, `IsEisensteinAt.irreducible`).
- **Hensel's lemma:** `Mathlib/NumberTheory/Padics/Hensel.lean` — `hensels_lemma`, over `ℤ_[p]`
  only: for `a` with `‖F(a)‖ < ‖F'(a)‖²` it gives a root `z` with `‖z − a‖ < ‖F'(a)‖` and
  `‖F'(z)‖ = ‖F'(a)‖`, unique among the roots in that ball. Layer 1 is this theorem over an
  arbitrary Henselian discrete valuation ring, in `addVal` spelling.
  `Mathlib/RingTheory/Henselian.lean` — `HenselianLocalRing`, `HenselianRing` — lifts a simple
  root *modulo the maximal ideal*, with no distance estimate.
- **Separable degree and embeddings:** `Mathlib/FieldTheory/SeparableDegree.lean` —
  `Field.embEquivOfAdjoinSplits`, `Field.finSepDegree_eq_finrank_of_isSeparable`.
- **Smith normal form:** `Mathlib/LinearAlgebra/FreeModule/IdealQuotient.lean` and
  `…/Finite/Quotient.lean` — `Submodule.quotientEquivPiSpan`, the input to the lattice index,
  whose `ℤ` analogue is `AddSubgroup.index_eq_natAbs_det` (`…/Finite/CardQuotient.lean`).
- **Haar measure:** `Mathlib/MeasureTheory/Group/Measure.lean` — `IsAddHaarMeasure` and the
  existence of Haar measure on a locally compact group;
  `Mathlib/MeasureTheory/Measure/Haar/Unique.lean` — `isAddLeftInvariant_eq_smul_of_regular`, the
  uniqueness the general-set scaling law uses. The determinant scaling law
  `Measure.addHaar_image_linearMap` (`Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`) is
  stated for real vector spaces only; the non-archimedean analogue is Layer 2.

## Acknowledgements

The mathematics of every layer was first formalized, `sorry`-free, in
[0stellensatz/MassFormula](https://github.com/0stellensatz/MassFormula) (Apache-2.0), by the
proposer of this roadmap; the provenance map below records where each layer's proof can be read.
That project is a **cited source, not the specification**: this roadmap states the mathematics
intrinsically, hands the ramification-theoretic half to the roadmap that owns it, and asks for the
two general layers at a generality the source did not need.

### Provenance (secondary; the layers above are definitive)

File map, relative to that project's `MassFormula/`:

| Layer | Files |
| --- | --- |
| 0 | `Defs.lean`, `UniformizerParam.lean` (the box and cube corollaries), `Second.lean` (invariance of `c`) |
| 1 | `RootLifting.lean` |
| 2 | `HaarScaling.lean` |
| 3 | `First.lean`, `UniformizerParam.lean` (the fibre count) |
| 4 | `First.lean`, `Second.lean`, `Finiteness.lean`, `Convergence.lean`, `Orbit.lean` |

The source's `EisensteinMonogenic.lean`, `Discriminant.lean` and `Tame.lean`, and the
orthogonality half of `UniformizerParam.lean`, prove material this roadmap consumes rather than
owns; they belong with the roadmap that specifies it, not here.

Where this roadmap departs from the source:

- The source proves `IsAdicComplete 𝓂[K] 𝒪[K]` itself; Mathlib has it as an instance.
- The source wraps `integralClosure ↥𝒪[K] ↥L` and its maximal ideal in project abbreviations; use
  Mathlib's spelling, and the supplier's, so the lemmas land where the rest of the
  integral-closure API lives.
- Layer 1's Newton estimate and Layer 2 are stated in the source only for the local-field case
  they were needed in; this roadmap asks for them over an arbitrary discrete valuation ring
  (Henselian, for the Newton estimate; with finite residue field, for the index), which is the
  generality their proofs already have.
- The source is organized as a frozen specification file paired with a development file that
  discharges it. In Tau Ceti the roadmap is what commits to a statement before its proof exists.

## References

- J-P. Serre, *Une «formule de masse» pour les extensions totalement ramifiées de degré donné
  d'un corps local*, C. R. Acad. Sci. Paris **286** (1978), Série A, 1031–1036 — the summit:
  Thm. 1, Thm. 2, Remarks 1° and 3°, Lemmas 1–3 and the change of variables of §3.
- J-P. Serre, *Local Fields*, Graduate Texts in Mathematics **67**, Springer (1979) — Chap. I §6
  (Eisenstein polynomials and monogenicity, Prop. 17), Chap. III §3 (the different and the
  discriminant), Chap. III §6 (the valuation of the different, tameness, Prop. 13). Consumed
  through the local fields and ramification roadmap rather than developed here.
- M. Krasner, *Nombre des extensions d'un degré donné d'un corps p-adique*, in *Les tendances
  géométriques en algèbre et théorie des nombres*, CNRS (1966), 143–169 — the
  discriminant-refined count that Serre's formula summarizes.
- M. Bhargava, *Mass formulae for extensions of local fields, and conjectures on the density of
  number field discriminants*, IMRN (2007) — the étale generalization.
