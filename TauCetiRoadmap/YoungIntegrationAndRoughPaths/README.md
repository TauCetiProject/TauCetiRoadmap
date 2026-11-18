# Roadmap: Young integration and rough paths

**Summary.** This roadmap builds the deterministic theory of integration and differential
equations driven by irregular paths, and then applies it to Brownian motion and Gaussian
processes.

- Paths of finite `p`-variation, Hölder paths and controls; the sewing lemma; the Young integral
  of a path of finite `q`-variation against a path of finite `p`-variation when
  `1/p + 1/q > 1`; Young differential equations for `p < 2`.
- Signatures as iterated integrals over words, Chen's identity, the shuffle identity, factorial
  decay, multiplicative functionals and Lyons' extension theorem.
- Hölder rough paths of regularity `α ∈ (1/3, 1/2]` with their second level, weakly geometric and
  geometric rough paths, controlled paths with Gubinelli derivatives, the rough integral and its
  stability, composition with smooth maps, rough differential equations with existence,
  uniqueness and the universal limit theorem, and the geometric chain rule.
- Hölder–Besov distributions of negative regularity, regularity structures with models and
  modelled distributions, the reconstruction theorem and the product of a Hölder function with a
  Hölder–Besov distribution.
- The Kolmogorov criterion for rough paths, the Itô and Stratonovich Brownian rough paths, the
  Wong–Zakai theorem at the level of rough paths and of equations, and Gaussian rough paths
  including fractional Brownian motion of Hurst index `H ∈ (1/3, 1/2]`.

The sources are Friz–Hairer, *A Course on Rough Paths* (2nd ed., 2020), Friz–Victoir,
*Multidimensional Stochastic Processes as Rough Paths* (2010), and Lyons–Caruana–Lévy,
*Differential Equations Driven by Rough Paths* (LNM 1908, 2007). The layers follow the
proof-dependency order of the subject, not the chapter order of any one of them.

[Suggested.lean](Suggested.lean) states, against the pinned Mathlib and Tau Ceti and each with
`sorry`, the headlines below that carry a Lean name, each with every conclusion this README
attaches to it, together with the definitions their statements need. It is not an exhaustive
acceptance test: the other headlines of this README are targets of the same standing, stated in
prose with their locators or proof routes.

Suggested home: `TauCeti/Analysis/RoughPath/` for Layers 1–6 and
`TauCeti/Probability/RoughPath/` for Layer 7.

## Scope and ownership

Completion means:

1. The `r`-variation of a path and controls exist with their basic theory (Layer 1).
2. The sewing lemma in Hölder and control form, the Young integral with its estimates, and
   Young differential equations with existence, uniqueness and continuity (Layer 2).
3. The signature of a path of finite `p`-variation, `p < 2`, with Chen's identity, the shuffle
   identity and factorial decay, and Lyons' extension theorem for multiplicative functionals
   (Layer 3).
4. Level-2 Hölder rough paths, the rough integral of controlled paths, its stability, and
   composition (Layer 4).
5. Rough differential equations: existence and uniqueness for `C_b³` coefficients, the universal
   limit theorem, consistency with classical ODEs, and the geometric chain rule (Layer 5).
6. Hölder–Besov spaces of negative regularity, regularity structures, models, modelled
   distributions, reconstruction and the Hölder–Besov product (Layer 6).
7. Brownian and Gaussian rough paths: the Kolmogorov criterion for rough paths, the Itô and
   Stratonovich lifts, Wong–Zakai, Gaussian lifts and fractional Brownian motion with
   `H ∈ (1/3, 1/2]` (Layer 7). Everything in Layer 7 is stated in rough-path terms; the
   identification with stochastic integrals and SDEs is listed under *Beyond this roadmap*.

**Not owned here.**

- Brownian motion, its Wiener measure and the Kolmogorov–Chentsov theorem are owned by
  StochasticCalculus, Layer 1; this roadmap consumes §§1.1–1.2 and nothing else from it. Itô
  and Stratonovich integrals and SDEs (StochasticCalculus Layers 3, 5 and 9) are not used; the
  identifications that would need them are under *Beyond this roadmap*.
- Littlewood–Paley blocks, the Besov scale `B^s_{p,q}` defined by dyadic blocks, and Bony's
  paraproduct decomposition with its paraproduct and resonant estimates are owned by PDE,
  Layer 7 (§§7.1–7.3). This roadmap owns the local wavelet-free definition of the Hölder–Besov
  space of negative regularity through scaled test functions, which is the form reconstruction
  needs; it does not prove the equivalence of the two definitions (see *Beyond this roadmap*).
- The support theorem, the enhanced Schilder theorem, rough paths of regularity at most `1/3`
  (third and higher levels in the Hölder setting, fractional Brownian motion with
  `H ∈ (1/4, 1/3]`), RDEs driven by `p`-rough paths with `p ≥ 3`, the uniqueness of the
  signature up to tree-like equivalence, and singular stochastic PDE are listed under *Beyond
  this roadmap*.

## Conventions

- Time is real. A path is a map `ℝ → E` used on a closed interval `Icc a b`, and a two-parameter
  map `ℝ → ℝ → E` is used on the simplex `a ≤ s ≤ t ≤ b`; values off these sets are not
  constrained. Hypotheses are stated "on" a set, in Mathlib's `HolderOnWith` style.
- Hölder conditions are stated with an explicit constant, either through `HolderOnWith` or as
  `‖X t - X s‖ ≤ C * |t - s| ^ α` on the interval. Rough path regularity is written `α`, with
  `1/3 < α ≤ 1/2` for the level-2 theory, so `3α > 1`.
- Quantities that can be infinite take values in `ℝ≥0∞`: the `r`-variation
  `rEVariationOn`, the rough path distance `roughPathDist`, the controlled distance
  `controlledDist` and the two-dimensional variation `rectVariation`. A finiteness hypothesis is
  written `≠ ⊤`. No real `⨆` over a possibly unbounded family appears in a statement.
- Rough paths are finite-dimensional. `Vec d` is `EuclideanSpace ℝ (Fin d)`. The second level
  lives in `Ten2 d`, the Euclidean space of `d × d` arrays, whose norm is the Hilbert–Schmidt
  norm. It is an admissible tensor norm (symmetric, with `‖x ⊗ y‖ = ‖x‖ ‖y‖`), so the
  estimates of the sources hold with the same exponents. Higher tensors are handled in word
  coordinates: a functional of all degrees is a map on `List (Fin d)`, and the degree-`n` norm
  `levelNorm` is the Hilbert–Schmidt norm over the `dⁿ` words of length `n`.
- `outer x y` is `x ⊗ y`, with coordinates `x i * y j`. A bilinear map `B` acts on a second-level
  tensor `A` by `contract2 B A = ∑ᵢⱼ A (i, j) • B eᵢ eⱼ`, so `contract2 B (outer x y) = B x y`.
- Chen's relation for a level-2 rough path is imposed for all triples of times in `[0, T]`, not
  only ordered ones; this fixes `XX s s = 0` and `XX t s` from `XX s t`.
- Smooth coefficients are written `C_bᵏ` in prose and stated in Lean as `ContDiff ℝ k f`
  together with `‖iteratedFDeriv ℝ j f y‖ ≤ M` for all `j ≤ k` and all `y`. The bound at `j = 0`
  is part of the hypothesis: linear vector fields, which Friz–Hairer also treat, are outside the
  Lean statements.
- Distributions are Mathlib's: `Distr m` is the space of distributions on all of
  `Sp m = EuclideanSpace ℝ (Fin m)` against smooth compactly supported test functions `Test m`.
  The scaled test function `φ^λ_x(y) = λ^(−m) φ((y − x)/λ)` is introduced through the relation
  `IsRescaled φ ψ x λ`, so that no further test-function constructor is needed.
- Regularity structures follow Friz–Hairer, Definition 13.1, p. 245, which has no unit
  element, specialised to a finite basis: each graded piece `T_α` is finite-dimensional and the
  structure is given in the coordinates of a basis of symbols. Reconstruction and the product
  are stated for structures of this kind; the theorems of Layer 6 and their proofs in
  Friz–Hairer do not use a unit, and every structure the roadmap uses is finite.
- The implementation namespace is TauCeti; the prototypes in `Suggested.lean` live in
  `TauCetiRoadmap.YoungIntegrationAndRoughPaths`.

## Exact supplier contracts

### From Mathlib

- `eVariationOn` and `BoundedVariationOn`
  (`Mathlib/Topology/EMetricSpace/BoundedVariation.lean`): the `1`-variation, to which
  `rEVariationOn` reduces at `r = 1`.
- `HolderWith`, `HolderOnWith` (`Mathlib/Topology/MetricSpace/Holder.lean`) and `eHolderNorm`,
  `MemHolder` (`Mathlib/Topology/MetricSpace/HolderNorm.lean`).
- `intervalIntegral`, `iteratedFDeriv`, `ContDiff`, `EuclideanSpace`, `limUnder` and `Real.Gamma`.
- `IsPicardLindelof` (`Mathlib/Analysis/ODE/PicardLindelof.lean`) and
  `ODE_solution_unique_of_mem_Icc` (`Mathlib/Analysis/ODE/ExistUnique.lean`): the classical ODE
  theory against which Layers 2 and 5 are checked.
- `TestFunction` with notation `𝓓(Ω, F)` (`Mathlib/Analysis/Distribution/TestFunction.lean`)
  and `Distribution` with notation `𝓓'(Ω, F)` and the embedding `Distribution.ofFun`
  (`Mathlib/Analysis/Distribution/Distribution.lean`).
- `ProbabilityTheory.IsPreBrownianReal` and `ProbabilityTheory.IsBrownianReal`
  (`Mathlib/Probability/BrownianMotion/Basic.lean`); `ProbabilityTheory.IsKolmogorovProcess`
  (`Mathlib/Probability/Process/Kolmogorov.lean`); `ProbabilityTheory.IsGaussianProcess`
  (`Mathlib/Probability/Distributions/Gaussian/IsGaussianProcess/Def.lean`);
  `ProbabilityTheory.iIndepFun` and `MeasureTheory.TendstoInMeasure`.
- `PiTensorProduct.projectiveSeminorm` (`Mathlib/Analysis/Normed/Module/PiTensorProduct/`) and
  `TensorAlgebra`: the coordinate-free tensor algebra, against which the word coordinates are
  checked in §3.1.
- Mathlib has no `p`-variation for `p ≠ 1`, no control functions, no sewing lemma, no Young
  integral and no rough path. Two open pull requests fix the shapes used here and are followed
  exactly: #38055 (`rEVariationOn`, the predicate of finite `r`-variation, monotonicity in
  `r`) and #38053 (`ControlOn`, its global version, powers and differences of controls). The
  definitions are built here in those shapes and replaced by Mathlib's when they land. The
  Hopf-algebra pull request #31898 on `TensorAlgebra` is prior art for the shuffle and
  deconcatenation coproducts and is not waited for.

### From Tau Ceti

- `TauCeti.HolderSpace` (`TauCeti/Analysis/Holder/Normed.lean`): the Banach space of bounded
  Hölder maps with the sup-plus-Hölder norm. It is the carrier in which the Young and RDE
  fixed points of §2.3 and §5.1 are taken.
- `TauCeti/Topology/EMetricSpace/VariationOnFromTo.lean`: signed variation between two points,
  used in the proof of the control property in §1.2.
- Tau Ceti has no sewing, rough path, signature or Hölder–Besov material.

### From other roadmaps

- StochasticCalculus (on main):
  - §1.1 (construction): the Kolmogorov–Chentsov theorem in the metric-parameter form with
    Hölder exponents below `1/2`, used in §7.1 and as the model for its proof.
  - §1.2 (Wiener space): the Wiener measure (its existence theorem, named there) and centred
    vector Brownian motion on a finite-dimensional inner-product space with independent
    orthonormal components. `IsBrownian` in `Suggested.lean` is a local copy of the latter for
    `Vec d`.
  - No other section of StochasticCalculus, and no other roadmap, is consumed.

## How to read the build

Layer 1 is the vocabulary of paths. Layer 2 builds the sewing lemma, on which every integral in
the roadmap rests; Young integration is its first application and Young equations its first
fixed point. Layer 3 iterates Young integration to the signature and states the algebra of
iterated integrals; the extension theorem is the bridge to rough paths. Layer 4 restricts to the
level-2 Hölder theory, `α ∈ (1/3, 1/2]`, which is where Layers 5 and 7 work, and builds the
controlled rough integral by sewing. Layer 5 solves RDEs by a fixed point in the space of
controlled paths. Layer 6 is independent of Layers 3–5: it generalises the local expansion
idea of controlled paths to distributions and proves reconstruction, which contains the sewing
lemma as a special case. Layer 7 consumes StochasticCalculus and Layers 4–5.

Each subsection states its targets, a locator in at least one source (with the printed page),
a proof route, and a *Needs:* line. Each layer ends with **Checks.**, *Examples* and
*Dependencies*.

## Layer 1: variation, Hölder paths and controls

### 1.1 The `r`-variation

- **`r`-variation** (`rEVariationOn`): for `0 < r < ∞`, the supremum over finite monotone
  sequences `u` in `s` of `(∑ edist (f (u (i+1))) (f (u i)) ^ r) ^ (1/r)`, in `ℝ≥0∞`; at
  `r = ⊤` the oscillation `⨆ edist (f x) (f y)`, at `r = 0` the number of jumps. The definition
  is the one of Mathlib pull request #38055 (Lyons–Caruana–Lévy, Definition 1.5, p. 4).
- **Monotonicity in `r`** (`rEVariationOn_anti`): for `0 < r ≤ r' < ∞`,
  `rEVariationOn r' f s ≤ rEVariationOn r f s` (Lyons–Caruana–Lévy, Lemma 1.6, pp. 4–5).
- **Reduction at `r = 1`** (`rEVariationOn_one`): `rEVariationOn 1 f s = eVariationOn f s`.
- Target in prose: for a normed space `E` and `p ≥ 1`, the paths on `[a, b]` of finite
  `p`-variation form a Banach space under `|X a| + rEVariationOn p X (Icc a b)`, with continuous
  inclusions for increasing `p` (Lyons–Caruana–Lévy, Proposition 1.7, p. 5).
- Target in prose: the `p`-variation dominates the oscillation,
  `edist (X s) (X t) ≤ rEVariationOn p X (Icc a b)` for `s, t ∈ [a, b]` (a two-point
  partition), and it is invariant under nondecreasing reparametrisation (Lyons–Caruana–Lévy,
  Lemma 1.6, pp. 4–5).

*Proof route.* For monotonicity, the `ℓ^r` norm of a finite sequence is antitone in `r`; take
suprema. At `r = 1`, both sides are suprema of the same sums over monotone sequences. The Banach
property follows by the usual lower-semicontinuity of the variation under pointwise convergence.

*Needs:* `eVariationOn`; nothing from this roadmap.

### 1.2 Controls and Hölder paths

- **Control** (`ControlOn`): a function `ω : α → α → ℝ≥0` on a set `s`, superadditive
  (`ω(a, b) + ω(b, c) ≤ ω(a, c)` for `a ≤ b ≤ c` in `s`), vanishing on the diagonal, and
  continuous on the ordered pairs of `s` (Friz–Victoir, Definition 1.6, p. 22;
  Lyons–Caruana–Lévy, Definition 1.9, p. 7). The structure is the one of Mathlib pull request
  #38053.
- **Variation is a control** (`exists_controlOn_rEVariationOn`): for `p ≥ 1` and `X` continuous
  of finite `p`-variation on `[a, b]`, `(s, t) ↦ rEVariationOn p X (Icc s t) ^ p` is a control
  (Friz–Victoir, Proposition 5.8, p. 80).
- **Hölder paths have finite variation** (`rEVariationOn_inv_le_of_holderOnWith`): if
  `HolderOnWith C α X (Icc a b)` with `0 < α ≤ 1`, then
  `rEVariationOn (1/α) X (Icc a b) ≤ C (b − a)^α`.
- Target in prose (interpolation): if `X` has finite `p`-variation and `q > p`, then
  `rEVariationOn q X ≤ rEVariationOn p X ^ (p/q) * osc X ^ (1 − p/q)`, with `osc` the
  `⊤`-variation, from `∑ |Δ|^q ≤ max |Δ|^(q−p) ∑ |Δ|^p` (the two-path form is
  Lyons–Caruana–Lévy, Lemma 1.13, p. 9). Consequently a sequence bounded in `p`-variation and
  converging uniformly converges in `q`-variation for every `q > p`, and the piecewise linear
  interpolations of a path of finite `p`-variation converge to it in `q`-variation as the mesh
  tends to zero (Lyons–Caruana–Lévy, Proposition 1.14, p. 9).
- Target in prose: powers `ω^θ` (`θ ≥ 1`), sums and products `ω₁^a ω₂^b` with `a + b ≥ 1` of
  controls are controls; `(t − s)` is a control (Friz–Victoir, Exercise 1.9, p. 22).
  These are the power and product lemmas of pull request #38053.

*Proof route.* For the control property: superadditivity from concatenating partitions, which
needs `p ≥ 1` (for `p < 1` the `p`-th power of the sum of `p`-th powers fails to be
superadditive); continuity from the continuity of `X` and a partition-refinement argument
(Friz–Victoir, proof of Proposition 5.8, p. 80), using the signed variation of
`TauCeti/Topology/EMetricSpace/VariationOnFromTo.lean` for the one-sided limits. For Hölder paths:
`∑ ‖ΔX‖^(1/α) ≤ C^(1/α) ∑ Δt = C^(1/α) (b − a)`.

*Needs:* §1.1.

**Checks.**

- `X t = t` on `[0, 1]`: `rEVariationOn r X (Icc 0 1) = 1` for every `r ≥ 1`, since
  `∑ Δᵢ^r ≤ (∑ Δᵢ)^r = 1`, with equality for the trivial partition.
- The tent path `X t = min t (2 − t)` on `[0, 2]` has `1`-variation `2`, `2`-variation `√2`
  (`≈ 1.414`, from the partition `{0, 1, 2}`) and `⊤`-variation `1`; the values decrease in `r`
  as `rEVariationOn_anti` says.
- Negative control for the exponent `1/r`: without the outer power, the tent path would get the
  value `2` at `r = 2` instead of `√2`, and `rEVariationOn_anti` would fail between `r = 1`
  (value `2`) and `r = 2`.
- `X t = √t` on `[0, 1]` is `1/2`-Hölder with constant `1`; its `2`-variation is
  `(∑ (√tᵢ₊₁ − √tᵢ)²)^(1/2) ≤ (∑ Δtᵢ)^(1/2) = 1`, with equality for the trivial partition, so
  the bound `C (b − a)^α = 1` of `rEVariationOn_inv_le_of_holderOnWith` is attained.
- `(s, t) ↦ t − s` and `(s, t) ↦ (t − s)²` are controls on `[0, 1]`.
- Negative control: `(s, t) ↦ (t − s)^(1/2)` is not superadditive (`1 + 1 > √2` on `[0, 1]`,
  `[1, 2]`), so it is no `ControlOn`; this is why `exists_controlOn_rEVariationOn` raises the
  variation to the power `p ≥ 1` and not to a smaller power.
- On `s` the field `zero_diag` follows from superadditivity at `a = b = c`
  (`2 ω(a, a) ≤ ω(a, a)`); as a field it constrains the points outside `s` as well.

### Examples

- A Brownian path on `[0, 1]` has finite `p`-variation for every `p > 2`, by
  `rEVariationOn_inv_le_of_holderOnWith` and its `α`-Hölder regularity for `α < 1/2` (§7.2).
- The Weierstrass function `∑ 2^(−kα) cos(2^k t)`, `0 < α < 1`, is `α`-Hölder and of finite
  `1/α`-variation.

### Dependencies

Mathlib's `eVariationOn` and `HolderOnWith`; Tau Ceti's
`TauCeti/Topology/EMetricSpace/VariationOnFromTo.lean`.

## Layer 2: the sewing lemma, Young integration and Young equations

### 2.1 Sewing

- **Dyadic sums and the sewing map** (`dyadicSum`, `sewing`): `dyadicSum Ξ s t n` is the Riemann
  sum of `Ξ` over the dyadic partition of `[s, t]` into `2ⁿ` pieces, and `sewing Ξ s t` is its
  limit, `limUnder atTop`. The value is a junk value when the limit does not exist; every
  statement about it carries the defect hypothesis that makes it exist.
- **Partition limits** (`HasPartitionLimit`): Riemann sums of `Ξ` along partitions of `[s, t]`
  converge to `I` as the mesh tends to zero.
- **Sewing lemma, Hölder form** (`sewing_spec`): let `E` be a Banach space, `γ > 1`, and
  `‖Ξ s t − Ξ s u − Ξ u t‖ ≤ C (t − s)^γ` for `a ≤ s ≤ u ≤ t ≤ b`. Then `sewing Ξ` is additive,
  `‖sewing Ξ s t − Ξ s t‖ ≤ C / (1 − 2^(1−γ)) (t − s)^γ`, Riemann sums along every partition of
  vanishing mesh converge to `sewing Ξ s t`, and every additive `I` with
  `‖I s t − Ξ s t‖ ≤ K (t − s)^γ'`, `γ' > 1`, equals `sewing Ξ` on the simplex (Friz–Hairer,
  Lemma 4.2, p. 65; Friz–Victoir, Theorem 6.8 and its proof, p. 116, for the constant).
- **Sewing lemma, control form** (`sewing_spec_control`): for `θ > 1` and a control `ω` with
  `‖Ξ s t − Ξ s u − Ξ u t‖ ≤ ω(s, t)^θ`, `sewing Ξ` is additive,
  `‖sewing Ξ s t − Ξ s t‖ ≤ 1/(1 − 2^(1−θ)) ω(s, t)^θ`, and the partition sums converge to it
  (Lyons–Caruana–Lévy, Theorem 4.3, p. 65, in degree one, for existence and uniqueness with a
  constant depending on `θ` and `ω(a, b)`; Friz–Victoir, Lemma 6.2, p. 113, for the constant).

*Proof route.* Hölder form: refining a dyadic piece of length `h` into two changes the sum by at
most `C h^γ`; summing over the `2ⁿ` pieces at level `n` gives `C (t − s)^γ 2^(n(1−γ))`, whose sum
over `n ≥ 0` is the constant. Additivity at dyadic points passes to all points by the partition
estimate. Partition sums: for an arbitrary partition, compare with `sewing` piecewise, which
costs `K ∑ (Δu)^γ ≤ K mesh^(γ−1) (t − s)`. Uniqueness: the difference of two additive maps that
are both within `O((t − s)^γ')` of `Ξ` is additive and `o(t − s)`, hence zero. Control form:
the point-removal argument of Young: in a partition with `n` pieces some point `uᵢ` has
`ω(uᵢ₋₁, uᵢ₊₁) ≤ 2 ω(s, t)/(n − 1)`, and removing it costs at most `(2 ω(s, t)/(n − 1))^θ`;
summing shows that the partition sums converge, with the provisional bound
`‖sewing Ξ s t − Ξ s t‖ ≤ 2^θ ζ(θ) ω(s, t)^θ`. Then `Γ = sewing Ξ − Ξ` is `o(ω)` and satisfies
`‖Γ s u‖ ≤ ‖Γ s t‖ + ‖Γ t u‖ + ω(s, u)^θ` by additivity, which are the hypotheses of
Friz–Victoir, Lemma 6.2, p. 113; its halving argument gives the constant `1/(1 − 2^(1−θ))`.
The CKMA file `Sewing.lean` (see *Prior formalization*) proves
the Hölder form with this route.

*Needs:* Layer 1 for controls; Mathlib's `limUnder`.

### 2.2 Young integration

- **Young integral** (`youngIntegral`): for `X : ℝ → E` and `Y : ℝ → E →L[ℝ] F`,
  `youngIntegral X Y s t = sewing (fun u v ↦ Y u (X v − X u)) s t`.
- **Young's theorem, Hölder form** (`youngIntegral_holder`): if `X` is `α`-Hölder with constant
  `Cx` and `Y` is `β`-Hölder with constant `Cy` on `[a, b]` with `α + β > 1`, the integral is
  additive and
  `‖∫_s^t Y dX − Y s (X t − X s)‖ ≤ Cx Cy / (1 − 2^(1−α−β)) (t − s)^(α+β)` (Friz–Hairer, (4.3),
  p. 62).
- **Young–Loève estimate** (`youngIntegral_variation`): if `X` is continuous of finite
  `p`-variation and `Y` continuous of finite `q`-variation with `1/p + 1/q > 1`, `p, q ≥ 1`,
  the integral is additive,
  `‖∫_s^t Y dX − Y s (X t − X s)‖ ≤ 1/(1 − 2^(1−θ)) ‖X‖_{p;[s,t]} ‖Y‖_{q;[s,t]}` with
  `θ = 1/p + 1/q`, and `t ↦ ∫_a^t Y dX` has finite `p`-variation (Friz–Victoir, Theorem 6.8,
  p. 116; Lyons–Caruana–Lévy, Theorem 1.16, p. 11).
- **Consistency** (`youngIntegral_eq_intervalIntegral`): for `X` of class `C¹` and `Y`
  continuous, `youngIntegral X Y s t = ∫ r in s..t, Y r (deriv X r)`.
- Target in prose: the Young integral is bilinear and jointly continuous: if `Xₙ → X` in
  `p`-variation and `Yₙ → Y` in `q`-variation with uniform bounds, then the integrals converge in
  `p`-variation (Lyons–Caruana–Lévy, Theorem 1.16, p. 11, continuity part).
- Target in prose (integration by parts): for scalar paths of complementary variation,
  `∫_s^t Y dX + ∫_s^t X dY = X t Y t − X s Y s`.

*Proof route.* Apply §2.1 to `Ξ u v = Y u (X v − X u)`, whose defect is
`−(Y u − Y s)(X t − X u)`, bounded by `Cx Cy (t − s)^(α+β)` in the Hölder case. In the
variation case it is bounded by `ω_Y(s, t)^(1/q) ω_X(s, t)^(1/p) = ω(s, t)^θ` with
`ω_X = ‖X‖_p^p`, `ω_Y = ‖Y‖_q^q` and `ω = ω_X^(1/(pθ)) ω_Y^(1/(qθ))`, a control by Layer 1
since the exponents sum to `1`; Young's point-removal argument gives the constant
`1/(1 − 2^(1−θ))` of Friz–Victoir. For the `C¹` case compare Riemann sums with the interval
integral and use uniqueness in §2.1.

*Needs:* §2.1; §1.2.

### 2.3 Young differential equations

- **Young solution** (`IsYoungSolution`): `Y` is continuous on `[0, T]` and
  `Y t = ξ + ∫_0^t f(Y) dX` there, the integral being `youngIntegral`.
- **Existence and uniqueness** (`exists_unique_isYoungSolution`): for `1 ≤ p < 2`, `f` of class
  `C_b²` from `W` to `E →L[ℝ] W`, `X` continuous of finite `p`-variation on `[0, T]` and
  `ξ ∈ W`, there is a unique solution of finite `p`-variation (Lyons–Caruana–Lévy, Theorem 1.28,
  p. 20).
- **Continuity of the solution map** (`tendsto_isYoungSolution`): if `Xₙ → X` in `p`-variation
  and `ξₙ → ξ`, the solutions converge in `p`-variation and uniformly on `[0, T]`
  (Lyons–Caruana–Lévy, Theorem 1.28, p. 20, continuity part).
- Target in prose (a priori bound): the solution satisfies
  `‖Y‖_{p;[s,t]} ≤ C (‖X‖_{p;[s,t]} ∨ ‖X‖_{p;[s,t]}^p)` with `C` depending on `p` and the `C_b²`
  bound of `f` (Friz–Hairer, Proposition 8.1, p. 132, in the Hölder form).

*Proof route.* Picard iteration in the Banach space of paths of finite `p`-variation on a short
interval, where `Y ↦ ξ + ∫ f(Y) dX` is a contraction by §2.2 and the `C_b²` bound on `f`
(Lyons–Caruana–Lévy, proof of Theorem 1.28, p. 20); glue intervals with the control
`ω = ‖X‖_p^p`, whose finiteness bounds the number of intervals. Continuity from the same
contraction estimate applied to the difference of two solutions.

*Needs:* §2.2; Mathlib's `IsPicardLindelof` for the classical case in the Checks.

**Checks.**

- `dyadicSum Ξ s t 0 = Ξ s t`, and `dyadicSum Ξ s t (n + 1)` refines `dyadicSum Ξ s t n` by
  splitting every piece at its midpoint.
- `Ξ s t = f s (t − s)` with `f r = r`: the defect is `(s − u)(t − u)`, bounded by `(t − s)²`
  with `C = 1`, `γ = 2`; `sewing Ξ s t = (t² − s²)/2` and
  `|sewing Ξ s t − Ξ s t| = (t − s)²/2 ≤ 2 (t − s)²`, the constant `1/(1 − 2^(−1)) = 2`.
- Negative control (`γ = 1` is excluded): `Ξ s t = (t − s) log(1/(t − s))` on `[0, 1/2]` has
  defect `(t − s) H(λ)` with `H` the binary entropy, bounded by `(log 2)(t − s)`, but
  `dyadicSum Ξ 0 h n = h (n log 2 + log(1/h)) → ∞`, so the sewing map is a junk value.
- `HasPartitionLimit Ξ s t I` with `Ξ s t = t − s` holds with `I = t − s`, and fails with any
  other `I`: every partition sum equals `t − s`.
- `HasPartitionLimit` determines `I`: limits in a normed space are unique, and the partitions
  of every mesh exist.
- `HasPartitionLimit Ξ s t (sewing Ξ s t)` fails for the entropy germ of the previous
  negative control, whose partition sums are unbounded.
- The sewing constants: `1/(1 − 2^(1−γ))` is `2` at `γ = 2`, `≈ 3.414` at `γ = 3/2` and `4/3` at
  `γ = 3`, and tends to `∞` as `γ ↓ 1`.
- `X t = Y t = t` (scalar, `Y` as a multiplication operator): `youngIntegral X Y 0 1 = 1/2`,
  in agreement with `youngIntegral_eq_intervalIntegral`.
- Negative control for `α + β > 1`: for a Brownian path the left-point dyadic sums of `∫ B dB`
  converge almost surely to `(B_t² − B_s² − (t − s))/2` and the right-point sums to
  `(B_t² − B_s² + (t − s))/2`; the integral depends on the evaluation point, so no Young
  integral exists at `α + β < 1`.
- Young's integral is linear in `Y`: the integral of `Y + Z` is the sum of the integrals of
  `Y` and `Z` whenever both sides exist, since `sewing` of a sum of convergent dyadic
  sums is the sum.
- `IsYoungSolution` with `f ≡ 0`: the unique solution is `Y ≡ ξ`.
- `IsYoungSolution` with `W = E = ℝ`, `f y = sin y`, `X` of class `C¹`: the solution is
  `Y t = 2 arctan(tan(ξ/2) e^(X t − X 0))`; at `ξ = π/2` and `X t − X 0 = log 3` it is
  `2 arctan 3 ≈ 2.4981`. This is also the classical ODE solution of `Y' = sin(Y) X'` given by
  `IsPicardLindelof`.
- Negative control for `p < 2`: with `p = 2` the Young integral `∫ f(Y) dX` against a Brownian
  path is not defined (previous negative control), so `IsYoungSolution` has no content; the
  theorem's hypothesis `p < 2` is load-bearing.

### Examples

- The Young integral against a fractional Brownian path of Hurst index `H > 1/2` exists pathwise
  for integrands of the same regularity, since `2H > 1`.
- Young equations driven by a `C¹` path are the classical ODEs `Y' = f(Y) X'`.

### Dependencies

Layer 1. Prior formalization in CKMA (*Prior formalization*).

## Layer 3: signatures, multiplicative functionals and the extension theorem

### 3.1 The signature and its algebra

- **Signature coordinates** (`sigCoord`): for `X : ℝ → Vec d` and a word `w`, `sigCoord X w s t`
  is the iterated integral `∫_{s<r₁<⋯<rₙ<t} dX^{w₁}_{r₁} ⋯ dX^{wₙ}_{rₙ}`, defined by
  `sigCoord X [] s t = 1` and `sigCoord X (i :: w) s t = ∫_s^t sigCoord X w r t dX^i_r` (Young
  integral) (Lyons–Caruana–Lévy, Definitions 2.5 and 2.6, p. 30; Friz–Victoir, Definition 7.2,
  p. 129).
- **Shuffles** (`shuffle`): the list, with multiplicity, of shuffles of two words.
- **Level norm** (`levelNorm`): the Hilbert–Schmidt norm of the degree-`n` coordinates.
- **Chen's identity** (`sigCoord_chen`): for `X` continuous of finite `p`-variation, `p < 2`, and
  `s ≤ u ≤ t`, `sigCoord X w s t = ∑ₖ sigCoord X (w.take k) s u * sigCoord X (w.drop k) u t`
  (Lyons–Caruana–Lévy, Theorem 2.9, p. 31, and Corollary 2.13, p. 32, for `p < 2`;
  Friz–Victoir, Theorem 7.11, p. 133).
- **Shuffle identity** (`sigCoord_shuffle`): `sigCoord X u s t * sigCoord X v s t` is the sum of
  `sigCoord X w s t` over the shuffles `w` of `u` and `v` (Lyons–Caruana–Lévy, Theorem 2.15,
  p. 34).
- **Factorial decay** (`levelNorm_sigCoord_le`): for `X` continuous of bounded variation on
  `[s, t]`, `levelNorm (sigCoord X · s t) n ≤ L^n / n!` with `L` the length of `X` on `[s, t]`
  (Lyons–Caruana–Lévy, Proposition 2.2, p. 27).
- Target in prose: the word coordinates of the degree-`n` part identify with
  `(ℝ^d)^{⊗n}` through the basis `e_{w₁} ⊗ ⋯ ⊗ e_{wₙ}`; under this identification Chen's
  identity is multiplicativity in Mathlib's `TensorAlgebra` truncated at any degree, and
  the shuffle identity says that the signature is group-like (Lyons–Caruana–Lévy, Definition
  2.18, p. 35, and Theorem 2.23, p. 37). The `levelNorm` is the Hilbert–Schmidt norm, bounded by
  the projective norm `PiTensorProduct.projectiveSeminorm`.
- Target in prose: the truncated signature solves the linear equation `dS = S ⊗ dX`
  (Lyons–Caruana–Lévy, Lemma 2.10, p. 31) and is continuous in `p`-variation for `p < 2`
  (Corollary 2.11, p. 32); it is invariant under nondecreasing reparametrisation (by the
  reparametrisation invariance of Young integrals, §2.2).

*Proof route.* Chen: induction on the word, splitting the outer Young integral at `u` by
additivity (§2.2) and applying the induction hypothesis to the inner one. Shuffle: induction on
`|u| + |v|` using integration by parts for Young integrals (§2.2) and the recursive definition
of `shuffle`. Factorial decay: by induction, `|sigCoord X (i :: w) s t|` summed in squares is
bounded through the simplex volume `L^n/n!` after reparametrising by arc length.

*Needs:* §2.2.

### 3.2 Multiplicative functionals and the extension theorem

- **Multiplicative functional** (`IsMultiplicative`): a map `M : List (Fin d) → ℝ → ℝ → ℝ`
  with `M [] = 1`, continuous on the simplex and satisfying Chen's identity on words of length
  at most `N` (Lyons–Caruana–Lévy, Definition 3.1, p. 42).
- **Extension constant** (`lyonsBeta`): `β_p = p² (1 + ∑_{k≥1} (2/k)^((p+1)/p))`
  (Lyons–Caruana–Lévy, Theorem 3.7, p. 45, where the sum is indexed by `r = k + 2 ≥ 3`).
- **Finite `p`-variation** (`HasPVariation`):
  `levelNorm (M · s t) n ≤ ω(s,t)^(n/p) / (β Γ(n/p + 1))` for `1 ≤ n ≤ N`
  (Lyons–Caruana–Lévy, Definition 3.6, p. 44).
- **Lyons' extension theorem** (`exists_unique_extension`): for `p ≥ 1`, a multiplicative
  functional of degree `⌊p⌋` of finite `p`-variation controlled by `ω` with constant `β_p` has an
  extension to all degrees, multiplicative, agreeing up to degree `⌊p⌋`, of finite `p`-variation
  controlled by the same `ω` and `β_p`, and unique among multiplicative extensions of finite
  `p`-variation for any control and constant (Lyons–Caruana–Lévy, Theorem 3.7, p. 45;
  Friz–Victoir, Theorem 9.5, p. 186).
- **Signature as extension** (`sigCoord_isMultiplicative`): for `X` continuous of finite
  `p`-variation, `p < 2`, the signature is multiplicative in all degrees and of finite
  `p`-variation; by uniqueness it is the extension of the increments of `X`
  (Lyons–Caruana–Lévy, the discussion before Definition 3.13, p. 53).
- Target in prose (neo-classical inequality): for `p ≥ 1`, `a, b ≥ 0` and `n ∈ ℕ`,
  `∑_{i=0}^n a^(i/p) b^((n−i)/p) / (Γ(i/p + 1) Γ((n−i)/p + 1)) ≤ p (a + b)^(n/p) / Γ(n/p + 1)`
  (Lyons–Caruana–Lévy, Lemma 3.8, p. 46).
- Target in prose: the extension depends continuously on the functional in `p`-variation
  distance (Lyons–Caruana–Lévy, Theorem 3.10, p. 51).

*Proof route.* Lyons–Caruana–Lévy, proof of Theorem 3.7, from p. 46: define the
degree-`(n+1)` part by sewing the
almost-multiplicative functional built from lower degrees by Chen's formula, the control-form
sewing of §2.1 applied with `θ = (n+1)/p > 1`; the bounds propagate by the neo-classical
inequality; uniqueness from the uniqueness clause of sewing. For the signature, Chen (§3.1)
gives multiplicativity and factorial decay with `ω = ‖X‖_p^p` gives the bounds.

*Needs:* §2.1, §3.1, §1.2.

### 3.3 Weakly geometric `p`-rough paths

- **Weakly geometric `p`-rough path** (`IsWeaklyGeometricPRoughPath`): a multiplicative
  functional of degree `⌊p⌋` with finite `p`-variation whose coordinates satisfy the shuffle
  identity on pairs of words of total length at most `⌊p⌋` (Lyons–Caruana–Lévy, Definition
  3.14, p. 53; Friz–Victoir, Definition 9.15, p. 195).
- **The extension preserves shuffles** (`shuffle_of_extension`): the Lyons extension of a weakly
  geometric `p`-rough path satisfies the shuffle identity at every length (Friz–Victoir,
  Theorem 9.5, p. 186, which places the extension in the free nilpotent group of every step).
- Target in prose: a geometric `p`-rough path, the limit in `p`-variation distance of signatures
  of paths of bounded variation, is weakly geometric (Lyons–Caruana–Lévy, Definition 3.13 and
  the discussion after it, p. 53).

*Proof route.* The shuffle identity is a closed polynomial condition; it holds for signatures of
bounded-variation paths (§3.1) and passes to limits; for a weakly geometric `p`-rough path,
approximate in the `p'`-variation distance, `p' > p`, by signatures of piecewise geodesic paths,
as in the proof of Friz–Victoir, Theorem 9.5, p. 186, and use continuity of the extension
(§3.2).

*Needs:* §3.1, §3.2.

**Checks.**

- `X t = t • v` on `[0, 1]`: `sigCoord X w 0 1 = v_{w₁} ⋯ v_{wₙ} / n!`, so the level-`n` norm is
  `|v|ⁿ/n!`, and the factorial bound is attained.
- Chen for `d = 1`, `X t = t`, `w = [0, 0]` on `[0, 2]` split at `1`: `2²/2 = 2` and
  `1/2 + 1·1 + 1/2 = 2`.
- `shuffle [a] [b] = [[a, b], [b, a]]`, so `sigCoord X [a] * sigCoord X [b]` is
  `sigCoord X [a, b] + sigCoord X [b, a]`; for `X t = (t, t²)` on `[0, 1]` this reads
  `1 · 1 = 2/3 + 1/3`.
- Negative control for multiplicity: `shuffle [a] [a] = [[a, a], [a, a]]`; a set-valued shuffle
  would give the single word `[a, a]` and the identity `x² = x²/2` for the increment `x`.
- `sigCoord X [] s t = 1`, so `levelNorm (sigCoord X · s t) 0 = 1 = L⁰/0!`; at `n = 1` the level
  norm is `‖X t − X s‖ ≤ L`.
- `lyonsBeta 1 = 1 + 4ζ(2) = 1 + 2π²/3 ≈ 7.580`, and `lyonsBeta 2 = 4(1 + 2^(3/2) ζ(3/2)) ≈ 33.56`;
  the series diverges at the excluded exponent `(p+1)/p = 1`, which no `p ≥ 1` reaches.
- `HasPVariation` at `p = 1`, `n = 1`: `‖M¹ s t‖ ≤ ω(s, t)/β`, so for the increments of a path
  of bounded variation the control `β_1 × length` works.
- `IsMultiplicative` with `N = 1` is Chen's relation `M [i] s t = M [i] s u + M [i] u t`: the
  degree-one part is the increment of a path, and nothing else is constrained.
- Negative control for `IsMultiplicative`: `M [i] s t = (t − s)²` is continuous with `M [] = 1`
  but not additive (`4 ≠ 1 + 1` on `[0, 2]`).
- `IsWeaklyGeometricPRoughPath` for `p < 2` reduces to finite `p`-variation of a path, since
  the shuffle condition at total length `1` is trivial (Lyons–Caruana–Lévy, discussion after
  Exercise 3.15, p. 54).
- Negative control for `IsWeaklyGeometricPRoughPath` at `p ∈ (2, 3)`: the Itô lift of
  Brownian motion with `M [i, i] = ((ΔBⁱ)² − Δt)/2` violates `M [i] M [i] = 2 M [i, i]`.
- `levelNorm M 0 = |M []|`, which is `1` for a multiplicative functional; for `d = 0` and
  `n ≥ 1` there are no words of length `n` and `levelNorm M n = 0`.

### Examples

- The signature of a piecewise linear path is the tensor product of the exponentials of its
  increments.
- For `d = 2`, `sigCoord X [0, 1] − sigCoord X [1, 0]` is twice the Lévy area of `X`.

### Dependencies

Layer 2 (sewing in control form, Young integration).

## Layer 4: Hölder rough paths and controlled integration

### 4.1 Level-2 rough paths

- **Second-level tensors** (`Ten2`, `outer`, `transpose2`): `Ten2 d` is the Euclidean space
  over `Fin d × Fin d`, `outer x y` has coordinates `x i * y j`, and `transpose2` swaps the indices.
- **Hölder rough path** (`IsHolderRoughPath`): `(X, XX)` with Chen's relation
  `XX s t = XX s u + XX u t + outer (X u − X s) (X t − X u)` for all `s, u, t ∈ [0, T]`, and
  `‖X t − X s‖ ≤ C |t − s|^α`, `‖XX s t‖ ≤ C |t − s|^(2α)` (Friz–Hairer, Definition 2.1 and
  (2.1)–(2.2), p. 16).
- **Weakly geometric** (`IsWeaklyGeometric`): `XX s t + transpose2 (XX s t) = outer ΔX ΔX`, that
  is `Sym XX = ½ ΔX ⊗ ΔX` (Friz–Hairer, (2.6), p. 20).
- **Rough path distance** (`roughPathDist`): the inhomogeneous `α`-Hölder distance
  `sup ‖ΔX − ΔY‖/(t − s)^α + sup ‖XX − YY‖/(t − s)^(2α)` in `ℝ≥0∞` (Friz–Hairer, Definition 2.4,
  p. 18).
- **Canonical lift** (`canonicalLift`): `∫_s^t (X r − X s) ⊗ X' r dr` for `X` of class `C¹`.
- **Geometric** (`IsGeometric`): a Hölder rough path that is the limit in `roughPathDist` of
  canonical lifts of `C¹` paths (Friz–Hairer, §2.2, p. 20).
- **Canonical lifts** (`isHolderRoughPath_canonicalLift`): the canonical lift of a `C¹` path is
  a weakly geometric `α`-Hölder rough path for every `α ∈ (0, 1]`.
- **Geometric implies weakly geometric** (`IsGeometric.isWeaklyGeometric`).
- **Geodesic approximation** (`isGeometric_of_isWeaklyGeometric`): a weakly geometric `β`-Hölder
  rough path is a geometric `α`-Hölder rough path for `1/3 < α < β ≤ 1/2` (Friz–Hairer,
  Proposition 2.8, p. 24).
- Target in prose: the Hölder rough paths at `α ∈ (1/3, 1/2]` with `roughPathDist` and the
  starting point form a complete metric space (not a vector space: Chen's relation is not
  linear), by completeness of the Hölder spaces and closedness of Chen's relation under
  pointwise limits (Friz–Hairer, Definition 2.4, p. 18, for the metric).
- Target in prose: for `α ∈ (1/3, 1/2]`, an `α`-Hölder rough path in the sense here and a
  weakly geometric `1/α`-rough path of §3.3 determine each other, with `M [i] = ΔXⁱ` and
  `M [i, j] = XX (i, j)` (Lyons–Caruana–Lévy, Definition 3.14, p. 53; Friz–Victoir,
  Definition 9.15, p. 195).

*Proof route.* Canonical lifts: Chen by additivity of the interval integral, the bounds from the
`C¹` bound of `X` on `[0, T]` and `α ≤ 1`, weak geometricity from the product rule. Geometric
implies weakly geometric: the weak geometricity equation is closed under pointwise convergence
of increments, which `roughPathDist → 0` gives; the diagonal and reversed times follow from
Chen. Geodesic approximation: Friz–Hairer, proof of Proposition 2.8, p. 24, through
sub-Riemannian geodesics in the step-2 nilpotent group, or Friz–Victoir's piecewise geodesic
approximation.

*Needs:* Layer 3 for the comparison targets; Mathlib's `intervalIntegral`.

### 4.2 Controlled paths and the rough integral

- **Controlled path** (`IsControlled`): `(Y, Y')` with `Y'` `α`-Hölder and remainder
  `R s t = Y t − Y s − Y' s (X t − X s)` bounded by `C |t − s|^(2α)` (Friz–Hairer, Definition
  4.6, p. 70).
- **Controlled distance** (`controlledDist`): `‖Y' − Ỹ'‖_α + ‖R^Y − R^Ỹ‖_(2α)` in `ℝ≥0∞`, where
  the remainders are taken with respect to the respective drivers (Friz–Hairer, before Theorem
  4.17, p. 75).
- **Contraction with a tensor** (`contract2`).
- **Rough integral** (`roughIntegral`): the sewing of the germ
  `Y u (X v − X u) + contract2 (Y' u) (XX u v)`.
- **Gubinelli's theorem** (`roughIntegral_spec`): for `α ∈ (1/3, 1/2]` there is `C = C(α)` such
  that for every rough path and controlled integrand with the bounds `Kx, Kxx, Kd, Kr`, the
  rough integral is additive,
  `‖∫_s^t Y dX − Y s ΔX − Y' s XX s t‖ ≤ C (Kx Kr + Kxx Kd) (t − s)^(3α)`, and
  `(∫_0^· Y dX, Y)` is controlled by `X` (Friz–Hairer, Theorem 4.10 and (4.22), p. 71).

*Proof route.* Apply the sewing lemma (§2.1) with `γ = 3α > 1`: by Chen, the defect of
`Ξ u v = Y u ΔX_{u,v} + Y' u XX u v` is `−R^Y_{s,u} ΔX_{u,t} − (Y' u − Y' s) XX u t`, bounded by
`(Kr Kx + Kd Kxx)(t − s)^(3α)`. The controlledness of the integral follows from the bound and
`α`-Hölder regularity of `Y`.

*Needs:* §2.1, §4.1.

### 4.3 Stability and consistency

- **Stability** (`roughIntegral_lipschitz`): on the set where both rough paths have
  `roughPathDist` to `0` at most `R` and both integrands have `‖Y' 0‖ + ‖Y, Y'‖ ≤ R`, the
  controlled distance between the integrals is at most
  `C (roughPathDist X X̃ + ‖Y' 0 − Ỹ' 0‖ + T^α controlledDist (Y, Y') (Ỹ, Ỹ'))` (Friz–Hairer,
  Theorem 4.17, p. 75).
- **Consistency** (`roughIntegral_canonicalLift`): for the canonical lift of a `C¹` path, the
  rough integral of a controlled integrand is `∫_s^t Y r (X' r) dr`, whatever the Gubinelli
  derivative.
- Target in prose: for `X` of class `C¹` and the lift `canonicalLift X + (t − s) A` with `A`
  antisymmetric, the rough integral is `∫ Y dX + ∫ contract2 (Y' r) A dr`, the area correction.
  Proof route: the germ differs from the canonical one by `(v − u) contract2 (Y' u) A`, whose
  sewing is the Riemann integral.

*Proof route.* Stability: Friz–Hairer, proof of Theorem 4.17, p. 75, by applying the sewing
estimate to the difference of the two germs. Consistency: the `Y' XX` term is `O((t − s)²)` for
a `C¹` path, so it does not change the sewing (uniqueness in §2.1), and the remaining germ is the
Young germ of §2.2.

*Needs:* §4.2; §2.2.

### 4.4 Composition

- **Composition** (`IsControlled.comp`): if `(Y, Y')` is controlled by an `α`-Hölder `X` and
  `φ` is `C_b²`, then `(φ(Y), Dφ(Y) Y')` is controlled by `X` (Friz–Hairer, Lemma 7.3, p. 121).
- Target in prose: the composition map is locally Lipschitz in the controlled distance for
  `φ ∈ C_b³` (Friz–Hairer, Theorem 7.6, p. 123), and products of controlled paths are controlled
  (Friz–Hairer, Corollary 7.4, p. 122).

*Proof route.* Taylor's formula at order two: `φ(Y t) − φ(Y s) − Dφ(Y s) Y' s ΔX` equals
`Dφ(Y s) R^Y + O(‖Y t − Y s‖²)`, and `‖Y t − Y s‖ ≤ sup ‖Y'‖ ‖ΔX‖ + ‖R^Y‖ = O(|t − s|^α)`.

*Needs:* §4.2.

**Checks.**

- `outer x y` at `(i, j)` is `x i * y j`, and `transpose2 (outer x y) = outer y x`.
- `‖outer x y‖ = ‖x‖ ‖y‖` in `Ten2 d`: `∑ᵢⱼ xᵢ² yⱼ² = (∑ xᵢ²)(∑ yⱼ²)`.
- `X t = (t, t²)` on `[0, 1]`: `canonicalLift X 0 1` has entries `1/2, 2/3, 1/3, 1/2` at
  `(0,0), (0,1), (1,0), (1,1)`; the off-diagonal entries add to `1 = ΔX₀ ΔX₁`, as
  `IsWeaklyGeometric` says, and the Lévy area is `(2/3 − 1/3)/2 = 1/6`.
- Chen forces `XX s s = 0`: with `s = u = t` it reads `XX s s = 2 XX s s`.
- Negative control for Chen: `XX ≡ 0` with `X t = t e₀` fails, `0 ≠ 0 + 0 + 1·1` on `[0, 2]`
  split at `1`.
- The pure-area rough path `X ≡ 0`, `XX s t = (t − s) A` with `A = e₀ ⊗ e₁ − e₁ ⊗ e₀` is a
  `1/2`-Hölder rough path, weakly geometric (`A + Aᵀ = 0`), and
  `roughPathDist (1/2) T 0 0 0 XX = ‖A‖ = √2`.
- Negative control for `IsWeaklyGeometric`: the Itô lift of Brownian motion has
  `XX + XXᵀ = ΔB ⊗ ΔB − (t − s) I` (§7.2).
- `roughPathDist α T X XX X XX = 0`, and `roughPathDist` is symmetric.
- `IsGeometric` includes `IsHolderRoughPath`: without it the values `XX t s` for `t > s` and
  `XX s s` would be unconstrained by the distance, and `IsGeometric.isWeaklyGeometric` would be
  false.
- `IsControlled` with `Y = X` and `Y' ≡ id`: the remainder is `0`.
- Negative control for uniqueness of `Y'`: for `X` of class `C¹` and `α ≤ 1/2`, `(0, Y')` is
  controlled for every Lipschitz `Y'`, since `Y' s ΔX = O(|t − s|) ⊆ O(|t − s|^(2α))`; so the
  Gubinelli derivative is not determined by `Y`, which is why `roughIntegral` takes it as input.
- `controlledDist α T X X (fun _ ↦ id) X 0 0 = 0`: a controlled path with constant derivative
  and zero remainder has seminorm `0`, and `controlledDist` is a seminorm, not a norm.
- `controlledDist` is symmetric in its two triples and vanishes on equal triples.
- The canonical lift of a `C¹` path is `IsGeometric`, through the constant approximating
  sequence.
- `contract2 B (outer x y) = B x y`, and with `B x y = ⟪x, y⟫` it gives `contract2 B A = trace A`.
- `contract2 B A` is linear in `A` and in `B`.
- Over the pure-area rough path with `Y ≡ 0` (a constant) and `Y' ≡ B`, `B x y = x₀ y₁`:
  `roughIntegral X XX Y Y' 0 1 = A (0, 1) = 1`, a nonzero integral against the zero path. The
  rough integral depends on `XX`, not only on `X`.
- `roughIntegral` over a canonical lift with `Y' ≡ 0` and `Y` continuous is the Young integral
  of §2.2.

### Examples

- The Itô and Stratonovich Brownian rough paths (§7.2) are `α`-Hölder rough paths for every
  `α < 1/2`; only the second is weakly geometric.
- A function `Y = g(X)` with `g ∈ C_b²` is controlled with `Y' = Dg(X)`: this is §4.4 applied
  to `(X, id)`.

### Dependencies

Layer 2 (sewing); Layer 3 for the comparison with `p`-rough paths.

## Layer 5: rough differential equations

### 5.1 Existence and uniqueness

- **Derivative along a solution** (`rdeDeriv`): `rdeDeriv f Y s = Df(Y s) ∘ f(Y s)`, the
  Gubinelli derivative of `f(Y)` when `Y' = f(Y)`.
- **RDE solution** (`IsRDESolution`): `(Y, f(Y))` is controlled by `X`, and
  `Y t = ξ + ∫_0^t f(Y) dX` with the rough integral of `(f(Y), rdeDeriv f Y)` (Friz–Hairer,
  (8.6), p. 137).
- **Existence and uniqueness** (`exists_unique_isRDESolution`): for `f ∈ C_b³`,
  `α ∈ (1/3, 1/2)` and an `α`-Hölder rough path on `[0, T]`, there is a unique RDE solution on
  `[0, T]` (Friz–Hairer, Theorem 8.3, p. 137).
- Target in prose (a priori bound): `‖Y‖_α ≤ C (|||X|||_α ∨ |||X|||_α^(1/α))` with `C` depending
  on `α` and the `C_b²` bound of `f` (Friz–Hairer, Proposition 8.2, p. 134).

*Proof route.* Friz–Hairer, §8.3, from p. 133, and the proof of Theorem 8.3: the map
`(Y, Y') ↦ (ξ + ∫ f(Y) dX, f(Y))`
is a contraction on a ball of controlled paths over a short interval, by §4.2 and §4.4; the
a priori bound makes the interval length depend only on `|||X|||_α`, giving the global solution.
Uniqueness from the contraction on each interval.

*Needs:* §4.2, §4.4; Tau Ceti's `TauCeti.HolderSpace` as the carrier of the fixed point.

### 5.2 The universal limit theorem

- **Itô–Lyons continuity** (`rdeSolution_lipschitz`): on rough paths with `roughPathDist` to `0`
  at most `R`, `‖Y − Ỹ‖_α` and the controlled distance between `(Y, f(Y))` and `(Ỹ, f(Ỹ))` are at
  most `C (|ξ − ξ̃| + roughPathDist X X̃)` (Friz–Hairer, Theorem 8.5, p. 141; Lyons–Caruana–Lévy,
  Theorem 5.3, p. 83, in `p`-variation form).
- Target in prose: consequently, if `Xₙ` are `C¹` paths whose canonical lifts converge to `X` in
  `roughPathDist`, the classical ODE solutions of `Yₙ' = f(Yₙ) Xₙ'` converge in `α`-Hölder norm
  to the RDE solution driven by `X`.

*Proof route.* Friz–Hairer, proof of Theorem 8.5, p. 141: stability of composition (§4.4)
and of integration (§4.3) on a short interval, iterated over a number of intervals bounded by
the a priori bound.

*Needs:* §5.1, §4.3, §4.4.

### 5.3 Consistency with ODEs

- **Classical solutions** (`hasDerivWithinAt_of_isRDESolution_canonicalLift`): driven by the
  canonical lift of a `C¹` path, an RDE solution satisfies `Y' t = f(Y t) X' t` on `[0, T]`.

*Proof route.* By §4.3 the rough integral is the Riemann integral `∫ f(Y r) X' r dr`; then the
fundamental theorem of calculus. Uniqueness against Mathlib's `ODE_solution_unique_of_mem_Icc`
identifies it with the classical solution.

*Needs:* §4.3, §5.1.

### 5.4 The geometric chain rule

- **Chain rule** (`chain_rule_of_isWeaklyGeometric`): for a weakly geometric driver, an RDE
  solution `Y` and `F` of class `C³`,
  `F(Y t) = F(ξ) + ∫_0^t DF(Y) f(Y) dX`, the integrand `g(Y)`, `g y = DF(y) ∘ f(y)`, taken with
  Gubinelli derivative `Dg(Y) f(Y)` (Friz–Hairer, Theorem 7.7, p. 125, with zero bracket).
- Target in prose (Itô formula for rough paths): for a general `α`-Hölder rough path the same
  identity holds with the correction `½ ∫ D²F(Y)(f(Y) ·, f(Y) ·) d[X]`, where
  `[X]_{s,t} = ΔX ⊗ ΔX − 2 Sym XX s t` is the bracket (Friz–Hairer, Definition 5.5, p. 93, and
  Theorem 7.7, p. 125).

*Proof route.* Taylor's formula at order two for `F(Y t) − F(Y s)` and the identity
`Sym XX = ½ ΔX ⊗ ΔX`, which turns the second-order Taylor term into the `Y'` term of the rough
integral germ; the remainder is `O(|t − s|^(3α))` and sewing (§2.1) concludes.

*Needs:* §4.2, §4.4, §5.1.

**Checks.**

- `rdeDeriv f Y = 0` when `f` is constant, and then `IsRDESolution` reads
  `Y t = ξ + f₀ (X t − X 0)` for every rough path: constant vector fields see only the first
  level.
- `d = 1`, `W = ℝ`, `f y x = g(y) x`: `rdeDeriv f Y s x x' = g'(Y s) g(Y s) x x'`.
- `d = 1`: every `α`-Hölder `X` has exactly one weakly geometric lift, `XX s t = (ΔX)²/2`, and the
  RDE solution with `f y x = sin(y) x`, `ξ = π/2`, `X t − X 0 = log 3` is `2 arctan 3 ≈ 2.4981`,
  as for the classical ODE (Layer 2, Checks).
- Negative control for the second level: for `d = 1` and the Itô lift
  `XX s t = ((ΔB)² − (t − s))/2`, the solution of `dY = Y dB` is `exp(B t − t/2)`, not
  `exp(B t)`; this uses the linear field, outside the `C_b³` hypothesis but inside Friz–Hairer,
  Theorem 8.3, which allows linear `f`.
- The constraint `Y' = f(Y)` is load-bearing (Friz–Hairer, Remark 8.4, p. 138): over the
  canonical lift of a `C¹` path any Gubinelli derivative of `f(Y)` is admissible, and for a
  general rough path uniqueness holds only because `IsRDESolution` fixes the derivative of `Y`
  to `f(Y)` and that of `f(Y)` to `rdeDeriv f Y`.
- Over the pure-area rough path of Layer 4 (`X ≡ 0`, `XX s t = (t − s) A`), with `d = 2`,
  `W = ℝ²`, `f₀(y) = e₀` and `f₁(y) = sin(y₀) e₁`, the germ reduces to
  `(v − u) ∑ᵢⱼ A(i, j) Dfⱼ(Y u) fᵢ(Y u) = (v − u) cos(Y₀) e₁`, so the solution from `ξ = 0` is
  `Y t = (0, t)`: the driver's first level is zero and the solution moves along the Lie
  bracket of the two fields.
- Chain rule with `F = id`: the identity is the RDE itself. With `F` linear, `D²F = 0` and the
  identity holds for every driver; the weakly geometric hypothesis matters only through
  `D²F`.
- Negative control for the chain rule: with the Itô lift, `d = 1`, `f y x = x`, `Y = B`,
  `F y = y²`: `F(B t) − F(B 0) = 2 ∫ B dB + t`, and the bracket term `t` is missing from the
  stated identity.

### Examples

- Linear RDEs `dY = A(Y) dX` with `A` linear have the solution given by the signature series
  `∑ₙ Aⁿ applied to the level-n signature`, in the setting of Layer 3 for `p < 2`.
- Driven by the Stratonovich Brownian rough path (§7.2), RDE solutions are random processes
  whose Wong–Zakai approximations are classical ODE solutions (§7.3).

### Dependencies

Layer 4; Tau Ceti's `TauCeti.HolderSpace`; Mathlib's ODE uniqueness.

## Layer 6: Hölder–Besov distributions and reconstruction

### 6.1 Hölder–Besov spaces of negative regularity

- **Test class** (`testBall`): test functions supported in the closed unit ball with
  `‖iteratedFDeriv ℝ k φ y‖ ≤ 1` for `k ≤ r` (Friz–Hairer, the class `B_r` defined before
  Definition 13.5, p. 249).
- **Rescaling** (`IsRescaled`): `ψ = φ^λ_x`, `ψ y = λ^(−m) φ(λ⁻¹ (y − x))`.
- **Hölder–Besov space** (`IsHolderBesov`): for `α < 0`, `|ξ(φ^λ_x)| ≤ C λ^α` for `φ` in the test
  class with `r = ⌊−α⌋ + 1`, `λ ∈ (0, 1]`, locally uniformly in `x` (Friz–Hairer, definition of
  `C^α` for `α < 0`, p. 253).
- Target in prose: for `α ∈ (0, 1)`, a continuous function satisfies the analogous bound
  `|(f − f(x))(φ^λ_x)| ≤ C λ^α` if and only if it is locally `α`-Hölder.

*Proof route.* Definitions only; the target follows by testing against an approximate identity.

*Needs:* Mathlib's `TestFunction` and `Distribution`.

### 6.2 Regularity structures, models and reconstruction

- **Regularity structure** (`RegStructure`): a finite basis `ι` with degrees and a structure
  group `G` of linear automorphisms such that `Γ eⱼ − eⱼ` has only components of lower degree
  (Friz–Hairer, Definition 13.1, p. 245). Friz–Hairer's definition has no unit element, and
  neither does this one; the unit of degree `0` belongs to particular structures, such as the
  ones of §6.3 and the polynomial structure in the Checks.
- **Realisation** (`realize`): `Π_x τ = ∑ᵢ τᵢ Π_x eᵢ`.
- **Model** (`IsModel`): `Γ x y ∈ G`, `Γ x y Γ y z = Γ x z`, `Π_x Γ x y = Π_y`,
  `|Π_x eᵢ (φ^λ_x)| ≤ C λ^(deg i)` and `|(Γ x y eⱼ)ᵢ| ≤ C |x − y|^(deg j − deg i)` locally
  uniformly, with test class `r > −min deg` (Friz–Hairer, Definition 13.5, p. 249).
- **Modelled distribution** (`IsModelled`): components of degree at least `γ` vanish and
  `|(f x − Γ x y f y)ᵢ| ≤ C |x − y|^(γ − deg i)` locally uniformly (Friz–Hairer, Definition
  13.10, p. 250).
- **Reconstruction** (`exists_unique_reconstruction`): for `γ > 0` there is a unique
  distribution `Rf` with `|(Rf − Π_x f(x))(φ^λ_x)| ≤ C λ^γ` locally uniformly (Friz–Hairer,
  Theorem 13.12, p. 251; the version proved in §13.4 is Theorem 13.26, p. 258).
- Target in prose: for `γ < 0` existence holds without uniqueness, and the map
  `(Π, Γ, f) ↦ Rf` is locally Lipschitz for the distances of Friz–Hairer, Remark 13.13,
  pp. 251–252.
- Target in prose: the rough integral of §4.2 is a reconstruction: for a level-2 rough path and
  a controlled `(Y, Y')`, the modelled distribution `Y ⊗ Ẋ + Y' ⊗ Ẍ` over the regularity
  structure of Friz–Hairer, §13.3, reconstructs to the derivative of `∫ Y dX` (Friz–Hairer,
  Proposition 13.21, p. 255).

*Proof route.* Friz–Hairer, §13.4, through Lemma 13.24, p. 257: write `Rf` as the
limit of `ρ^(n) ∗ (Π_x f(x))` assembled with a partition of unity at scale `2^(−n)`; the
increments between levels are bounded by `2^(−nγ)` using the model bounds and the modelled
distribution bound, and `γ > 0` makes them summable. Uniqueness: a distribution with
`|ξ(φ^λ_x)| ≤ C λ^γ`, `γ > 0`, vanishes, by testing against `φ^λ_x` with `λ → 0`.

*Needs:* §6.1.

### 6.3 Products

- **Hölder–Besov product** (`exists_unique_holderBesov_mul`): for `0 < α < β < 1`, a locally
  `β`-Hölder `f` and `ξ ∈ C^(−α)`, there is a unique distribution `B` with
  `|(B − f(x) ξ)(φ^λ_x)| ≤ C λ^(β−α)`; it lies in `C^(−α)`, and equals `f g` when `ξ` is a
  continuous function `g` (Friz–Hairer, Theorem 13.18 and Remark 13.19, pp. 253–254).
- Target in prose: the product is a continuous bilinear map `C^β × C^(−α) → C^(−α)` on the
  local seminorms (Friz–Hairer, Theorem 13.18, p. 253).

*Proof route.* Reconstruction (§6.2) for the regularity structure spanned by `Ξ` of degree `−α`
and the Taylor polynomial `1` of degree `0`, with `Π_x Ξ = ξ`, and the modelled distribution
`x ↦ f(x) Ξ` of regularity `β − α > 0` (Friz–Hairer, proof of Theorem 13.18, p. 253).

*Needs:* §6.2.

**Checks.**

- `δ₀ ∈ C^(−m)` on `ℝ^m`: `δ₀(φ^λ_x) = λ^(−m) φ(−x/λ)`, bounded by `λ^(−m)`.
- Negative control: `δ₀ ∉ C^(−m+ε)` for `ε > 0`: at `x = 0` and a test function with `φ(0) = 1`,
  `λ^(−m) ≤ C λ^(−m+ε)` fails as `λ → 0`.
- A bounded continuous function `g` lies in `C^α` for every `α < 0`:
  `|∫ g φ^λ_x| ≤ ‖g‖_∞ ‖φ‖_{L¹} ≤ ‖g‖_∞ vol(B₁) ≤ C λ^α` for `λ ≤ 1`.
- The test-class order `⌊−α⌋ + 1` is `1` for `α ∈ (−1, 0)` and `m + 1` for `α = −m`; so `δ₀'` on
  `ℝ`, in `C^(−2)`, is tested with `r = 3` derivatives bounded.
- `0 ∈ testBall m r`, and `testBall m r` is antitone in `r`.
- Negative control for `testBall`: a bump supported in the ball of radius `2` is excluded; and
  without the derivative bounds, `φₙ(y) = sin(n y) χ(y)` with a fixed bump `χ` would be
  admitted, and `δ₀' ∈ C^(−2)` on `ℝ` would take the unbounded values `|δ₀'(φₙ)| = n χ(0)` at
  `λ = 1`.
- `IsRescaled φ φ 0 1`, and rescaling preserves the integral: `∫ φ^λ_x = ∫ φ`.
- `IsRescaled φ ψ x λ` determines `ψ` as a function, so two rescalings of the same `φ` are
  equal test functions.
- The polynomial structure on `ℝ`: `ι = Fin 2`, degrees `0, 1`, `G` the translations
  `Γ_h e₁ = e₁ + h e₀`; the model `Π_x e₀ = 1`, `Π_x e₁ = (· − x)`, `Γ x y e₁ = e₁ + (x − y) e₀`
  satisfies `Π_x Γ x y = Π_y` and `|(Γ x y e₁)₀| = |x − y|^(1 − 0)`.
- Negative control for `triangular`: `e₀ ↦ e₀ + e₁` raises degree and is excluded; the trivial
  group is always admissible.
- Negative control for `compat`: with the sign `Γ x y e₁ = e₁ + (y − x) e₀`,
  `Π_x Γ x y e₁ = (· − x) + (y − x) ≠ (· − y)`.
- `realize 𝒯 Pm x (Pi.single i 1) = Pm x i`, and `realize` is linear in `τ`.
- In the polynomial model, `f(x) = (g(x), g'(x))` with `g ∈ C^(1,γ−1)`, `γ ∈ (1, 2)`, is modelled
  of regularity `γ`, and `Rf = g`.
- Negative control for `γ > 0`: in the polynomial model with `γ < 0`, `Rf` and `Rf + h` with
  `h ∈ C^γ` both satisfy the reconstruction bound, so uniqueness fails.
- Product, `ξ = g` continuous: `B = f g` by the third conjunct; for `f ≡ 1`, `B = ξ`.
- Negative control for `β > α`: `fₙ x = 2^(−nβ) sin(2ⁿ x)` is bounded in `C^β`,
  `ξₙ x = 2^(nα) sin(2ⁿ x)` in `C^(−α)`, and `fₙ ξₙ = 2^(n(α−β)) (1 − cos(2^(n+1) x))/2` tested
  against a fixed bump tends to `∞` when `α > β`.

### Examples

- White noise on `ℝ^m` lies almost surely in `C^α_loc` for every `α < −m/2`; this is a target of
  the singular SPDE programme (see *Beyond this roadmap*) and only illustrates the scale here.
- The product `f ξ` of a `β`-Hölder function with the derivative of an `α'`-Hölder path,
  `β + α' > 1`, is the derivative of the Young integral `∫ f dX` of Layer 2.

### Dependencies

Mathlib's distributions; independent of Layers 3–5. PDE, Layer 7 owns the Besov scale defined by
dyadic blocks.

## Layer 7: Brownian and Gaussian rough paths

### 7.1 The Kolmogorov criterion for rough paths

- **Kolmogorov criterion** (`exists_modification_isHolderRoughPath`): let `q ≥ 2`, `β > 1/q`,
  and `(X, XX)` satisfy Chen's relation pathwise with
  `E ‖X t − X s‖^q ≤ C |t − s|^(βq)` and `E ‖XX s t‖^(q/2) ≤ C |t − s|^(βq)` on `[0, T]`. Then for
  every `α ∈ (0, β − 1/q)` there is a modification that is almost surely an `α`-Hölder rough
  path (Friz–Hairer, Theorem 3.1, p. 40; Friz–Victoir, Theorem A.12, p. 583).
- Target in prose: the rough path Hölder norm of the modification has finite `q`-th moment, and
  the distance version for two processes holds (Friz–Hairer, Theorem 3.3, p. 42).

*Proof route.* Friz–Hairer, proof of Theorem 3.1, p. 40: dyadic chaining on both levels,
using Chen to control `XX` between dyadic points; the first level is the Kolmogorov–Chentsov
theorem of StochasticCalculus §1.1.

*Needs:* §4.1; StochasticCalculus §1.1.

### 7.2 Brownian rough paths

- **Lifts** (`realPath`, `itoLift`, `idTensor`, `stratLift`): `realPath B ω t = B t⁺ ω`;
  `itoLift B ω s t` is the limit of the dyadic left-point sums of
  `(B u − B s) ⊗ (B v − B u)`; `stratLift = itoLift + ½ (t − s) I` (Friz–Hairer, (3.4), p. 43, and
  (3.5), p. 44). `IsBrownian` is the local copy of StochasticCalculus §1.2.
- **Itô Brownian rough path** (`exists_version_itoLift`): for `α ∈ (1/3, 1/2)`, `itoLift` has a
  version that is almost surely an `α`-Hölder rough path (Friz–Hairer, Proposition 3.4, p. 43).
- **Stratonovich Brownian rough path** (`exists_version_stratLift`): `stratLift` has a version
  that is almost surely a weakly geometric `α`-Hölder rough path (Friz–Hairer, Proposition 3.5,
  p. 44; Friz–Victoir, Definition 13.9, p. 333, and Proposition 13.11, p. 334).
- Target in prose: the Hölder rough path norm of either lift has Gaussian tails (Friz–Hairer,
  Proposition 3.4, p. 43; Friz–Victoir, Theorem 13.13, p. 337).

*Proof route.* For fixed `s ≤ t` the dyadic left-point sums converge almost surely: the
off-diagonal sums differ between levels `n` and `n + 1` by a martingale increment of variance
`O(2^(−n))`, summable, and the diagonal is `((ΔBⁱ)² − Σ (dyadic increments)²)/2`, which
converges by Lévy's dyadic quadratic variation. The moment bounds
`E ‖XX s t‖^(q/2) ≤ C (t − s)^(q/2)` follow from Brownian scaling, so §7.1 applies with
`β = 1/2` and every `q`. For the Stratonovich lift add the deterministic correction and check
`Sym = ½ ΔB ⊗ ΔB`.

*Needs:* §7.1; StochasticCalculus §1.2.

### 7.3 Wong–Zakai

- **Dyadic interpolation** (`dyadicInterp`): the piecewise linear interpolation of a path at the
  times `k T/2ⁿ`.
- **Wong–Zakai for rough paths** (`ae_tendsto_roughPathDist_dyadicInterp`): almost surely, the
  canonical lifts of the dyadic interpolations converge to every rough path version of the
  Stratonovich lift in `roughPathDist` (Friz–Hairer, Proposition 3.6, p. 45).
- **Wong–Zakai for equations** (`ae_tendsto_isRDESolution_dyadicInterp`): for `f ∈ C_b³`, the
  solutions driven by the dyadic interpolations converge almost surely in `α`-Hölder seminorm to
  the RDE solution driven by the Stratonovich lift (Friz–Hairer, Theorem 9.3, p. 154;
  Lyons–Caruana–Lévy, Theorem 3.18, p. 58). The statement is purely about RDEs; that this limit
  is the Stratonovich SDE solution is the RDE = SDE identification under *Beyond this
  roadmap*.
- Target in prose: along arbitrary deterministic partitions with mesh tending to zero, the
  piecewise linear lifts converge in probability and in every `Lq`, with rate any `θ < 1/2 − α`
  (Friz–Hairer, Remark 3.7, p. 45, through Theorem 3.3, p. 42; Friz–Victoir, Corollary 13.21,
  p. 346).

*Proof route.* The dyadic interpolation is the conditional expectation of `B` given the dyadic
values, so the off-diagonal second level is a martingale in `n` and converges almost surely;
uniform Hölder bounds from §7.1 give convergence in `roughPathDist` by interpolation
(Friz–Hairer, proof of Proposition 3.6, p. 45). For equations combine with §5.2.

*Needs:* §7.2, §5.2, §5.3.

### 7.4 Gaussian rough paths

- **Two-dimensional variation** (`rectVariation`): the `ρ`-th power of the `ρ`-variation of a
  covariance `R` over the rectangle `[s, t]²`, in `ℝ≥0∞` (Friz–Hairer, (10.13), p. 171;
  Friz–Victoir, §5.5, p. 104).
- **Gaussian lift** (`exists_gaussianLift`): a centred continuous Gaussian process with
  independent components whose covariances satisfy `rectVariation ρ R s t ≤ K (t − s)`,
  `ρ ∈ [1, 3/2)`, has a weakly geometric `α`-Hölder lift for every `α ∈ (1/3, 1/(2ρ))`, whose
  off-diagonal second level is the limit in probability of the dyadic Riemann sums
  (Friz–Hairer, Theorem 10.4, p. 171, and Corollary 10.10, p. 177; Friz–Victoir, Theorem 15.33,
  p. 429).
- **Fractional Brownian motion** (`rectVariation_fbmCov_le`): the covariance
  `½(|u|^(2H) + |v|^(2H) − |u − v|^(2H))` has `rectVariation (1/(2H)) R s t ≤ K (t − s)` for
  `H ∈ (0, 1/2]` (Friz–Victoir, Proposition 15.5, p. 405). With the Gaussian lift, fractional
  Brownian motion with `H ∈ (1/3, 1/2]` and independent components lifts to a weakly geometric
  `α`-Hölder rough path for `α ∈ (1/3, H)`.
- Target in prose: the paths of the lift have finite `p`-variation for every `p > 1/H`, by
  `rEVariationOn_inv_le_of_holderOnWith`.

*Proof route.* Friz–Hairer, §10.2, from p. 167: the `L²` norm of the off-diagonal Riemann sums is
a two-dimensional Young integral of the covariances, bounded by the `ρ`-variation with
`2/ρ > 1`; hypercontractivity of the second Wiener chaos upgrades to all moments; §7.1 applies.
For fBM, compute the rectangle increments of `R_H` and use their sign (negative correlation of
disjoint increments for `H ≤ 1/2`).

*Needs:* §7.1, §1.1; Mathlib's `IsGaussianProcess`.

**Checks.**

- `realPath B ω t = B 0 ω` for `t ≤ 0`, and `realPath B ω t = B t ω` for `t ≥ 0`.
- `idTensor d` has Hilbert–Schmidt norm `√d`, and `transpose2 (idTensor d) = idTensor d`.
- `d = 1`: `itoLift B ω s t = ((ΔB)² − (t − s))/2` almost surely for each `s ≤ t`, and
  `stratLift B ω s t = (ΔB)²/2`; so `E itoLift = 0` and `E stratLift = (t − s)/2` on the
  diagonal.
- `E ‖itoLift B ω 0 1‖² = 2` for `d = 2`: each diagonal entry `(B² − 1)/2` has second moment
  `(3 − 2 + 1)/4 = 1/2`, each off-diagonal `∫ Bⁱ dBʲ` has second moment `∫₀¹ r dr = 1/2`.
- The Lévy area `(XX(0,1) − XX(1,0))/2` over `[0, 1]` has variance `1/4` under both lifts; the
  lifts differ only on the diagonal.
- Negative control for `stratLift`: the Itô lift is not weakly geometric, since
  `Sym itoLift = ½ ΔB ⊗ ΔB − ½ (t − s) I`.
- `dyadicInterp T 0 x t = x 0 + (t/T)(x T − x 0)` on `[0, T]`, and `dyadicInterp T n x` agrees
  with `x` at the dyadic times `k T/2ⁿ`.
- The canonical lift of `dyadicInterp T 0 (realPath B ω)` has zero Lévy area: the area appears
  only in the limit.
- `rectVariation 1 (fun u v ↦ min u v) s t = t − s` for `0 ≤ s ≤ t`: the rectangle increments of
  `min` are the overlap lengths, which sum to `t − s`.
- `rectVariation ρ 0 s t = 0`.
- The fBM covariance at `H = 1/2` and `u, v ≥ 0` is `min u v` (at `u = 1`, `v = 2`:
  `(1 + 2 − 1)/2 = 1`), so `rectVariation_fbmCov_le` at `H = 1/2` is the previous Check with
  `K = 1`.
- Negative control for `ρ < 3/2`: at `ρ = 3/2` the interval `(1/3, 1/(2ρ))` is empty, and for
  `H ≤ 1/3` the level-2 lift does not exist in the Hölder sense here (see *Beyond this
  roadmap*).
- Negative control for the version in §7.2: the pointwise `limUnder` of `itoLift` is defined for
  every `ω`, but its almost-sure convergence holds for each fixed `(s, t)`, not simultaneously
  for all; the theorems therefore assert a version, not that `itoLift` itself is a rough path.

### Examples

- Fractional Brownian motion with `H = 0.4` lifts with `α ∈ (1/3, 0.4)`; with `H = 0.3` the
  level-2 theory does not apply.
- Brownian bridge and the Ornstein–Uhlenbeck process satisfy the covariance hypothesis with
  `ρ = 1`.

### Dependencies

Layers 4–5; StochasticCalculus §§1.1–1.2; Mathlib's Brownian motion and Gaussian processes.

## Downstream consumers

- No roadmap on main consumes this one. The singular-SPDE programme listed under *Beyond this
  roadmap* is the intended consumer of Layer 6, and the support and large-deviation theorems
  listed there are the intended consumers of Layers 5 and 7.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Rough integral = Itô integral** (part of CKMA 09.31; Friz–Hairer, Proposition 5.1, p. 90):
  needs the Itô integral of StochasticCalculus Layer 3.
- **Rough integral = Stratonovich integral** (part of CKMA 09.31; Friz–Hairer, Corollary 5.2,
  p. 91): needs the Stratonovich integral of StochasticCalculus Layer 5.
- **RDE solution = SDE solution**, including the identification of the Wong–Zakai limit with the
  Stratonovich SDE solution (part of CKMA 09.31 and 09.32; Friz–Hairer, Theorems 9.1 and 9.3,
  pp. 153–154; Friz–Victoir, Theorem 17.3, p. 510): needs the SDE theory of StochasticCalculus
  Layer 9.

- **Support theorem** (CKMA 09.33; Friz–Hairer, §9.3, p. 155): needs the large-deviation and
  Cameron–Martin machinery of a separate probabilistic roadmap; this roadmap supplies its
  deterministic input, the continuity of the Itô–Lyons map (§5.2).
- **Enhanced Schilder theorem** (CKMA 09.34; Friz–Victoir, Chapter 13): a large deviation
  principle for scaled Brownian rough paths; it needs a large-deviation library and the
  contraction principle, owned by a large-deviation roadmap.
- **Rough paths of regularity at most `1/3`**: level-3 Hölder rough paths and RDEs driven by
  them, the `p`-variation RDE theory for `p ≥ 3` with `Lip^γ` vector fields
  (Lyons–Caruana–Lévy, Theorem 5.3, p. 83, in general), and fractional Brownian motion with
  `H ∈ (1/4, 1/3]` (part of CKMA 09.35; Friz–Victoir, Theorem 15.33, p. 429, at `ρ ∈ [3/2, 2)`).
  The level-2 theory here is the case the charter's RDE items need.
- **Signature uniqueness up to tree-like equivalence** (Hambly–Lyons, part of CKMA 09.24): a
  separate result on the kernel of the signature map.
- **Equivalence of the local and dyadic definitions of `C^α`, and the converse of the product
  criterion** (Friz–Hairer, Exercise 13.1(b), p. 260): bridges this roadmap's Layer 6 with
  PDE, Layer 7.
- **Singular SPDE** (CKMA 09.55, 09.56, 09.58–09.60: parabolic Schauder, white-noise regularity,
  `Φ⁴₂`, KPZ, subcritical well-posedness): the theory of renormalised models for which Layer 6
  supplies reconstruction and the product.

## Prior formalization

- CKMA (`~/lean-CKMA`), fully proved: `CKMA/Analysis/RoughPath/Sewing.lean` and its subfiles
  `Sewing/Construction.lean`, `Dyadic.lean`, `Variation.lean`, `VariationEstimate.lean`,
  `YoungGrid.lean`, `YoungIntegral.lean`. They prove the sewing lemma in Hölder form (existence,
  uniqueness among left-normalised continuous additive maps, partition-sum limits, constant
  `sewingConstant γ`) and Young's integral in Hölder and variation form. They cover the Hölder
  part of §2.1 and §2.2 (CKMA 09.21–09.22) and are the starting point for those subsections,
  with the statements here adapted to two-parameter `sewing` and to `rEVariationOn`.
- CKMA coverage of this roadmap: 09.21 (§2.2), 09.22 (§2.1), 09.23 (§3.1, §4.1), 09.24 (§3.2;
  Hambly–Lyons in *Beyond*), 09.25 (§4.2), 09.26 (§4.3), 09.27 (§4.4), 09.28 (§5.1), 09.29
  (§5.2), 09.30 (§5.4), 09.31 (§7.2; the identifications in *Beyond*), 09.32 (§7.3; the SDE
  limit in *Beyond*), 09.33 and 09.34 (*Beyond*), 09.35
  (§7.4, `H ∈ (1/3, 1/2]`; `H ∈ (1/4, 1/3]` in *Beyond*), 09.54 (§6.3; Bony's form owned by
  PDE §7.3), 09.57 (§6.2).
- Mathlib pull requests #38055 and #38053 (see *Exact supplier contracts*).

## References

- P. K. Friz and M. Hairer, *A Course on Rough Paths, with an Introduction to Regularity
  Structures*, 2nd ed., Universitext, Springer, 2020. Chapters 2–5 and 7–10, 13.
- P. K. Friz and N. B. Victoir, *Multidimensional Stochastic Processes as Rough Paths: Theory and
  Applications*, Cambridge Studies in Advanced Mathematics 120, Cambridge University Press,
  2010. Chapters 1, 5–7, 9, 13, 15, 17 and Appendix A.
- T. J. Lyons, M. Caruana and T. Lévy, *Differential Equations Driven by Rough Paths*, École
  d'Été de Probabilités de Saint-Flour XXXIV – 2004, Lecture Notes in Mathematics 1908, Springer,
  2007. Chapters 1–5.
