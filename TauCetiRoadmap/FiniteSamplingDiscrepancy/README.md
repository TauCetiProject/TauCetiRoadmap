# Roadmap: sampling with and without replacement, exact discrepancy for finite populations

Draw `m` values from a finite population of size `n`, once without replacement and once with
replacement. The completed [Exchangeability](../../Completed/Exchangeability/README.md) roadmap
(Layer 8) bounded the difference of the two laws on every event by the collision probability
`1 - (n)_m / n^m`.

This roadmap proves exact discrepancy formulas for populations of distinct values and for
populations identifying one pair. For `2 ≤ m ≤ n`, with a measurable all-distinct event, the
collision bound is attained exactly by injective populations. Every noninjective population
satisfies a smaller sharp universal bound. Integrating that bound gives a finite de Finetti
estimate that improves with the probability of ties.

Place the discrepancy results under `TauCeti/Probability/PopulationSampling/`.

## Scope and dependencies

This roadmap owns exact special-case formulas and sharp universal bounds for the two
finite-population sampling laws, their supporting counting identities, and the resulting finite
de Finetti refinements.

- Exchangeability Layer 8 owns the sampling laws, the collision bounds and the finite de
  Finetti bounds. Consume them.
- [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md), Layer 3 item 5, owns the
  formula `tvDist μ ν = ∑' y, |μ.real {y} - ν.real {y}|` for finite measures on a countable
  space with measurable singletons. Consume it in L2.
- [StandardDistributions](../StandardDistributions/README.md) owns count laws
  (hypergeometric, multinomial). Approximation by an arbitrary i.i.d. mixture is not part of
  this roadmap.

## Conventions

- `ι`, `κ` are finite, `m = Fintype.card ι`, `n = Fintype.card κ`, and `κ` has
  `[MeasurableSingletonClass κ]`. The value space `α` is an arbitrary measurable space unless
  stated otherwise.
- For `x : κ → α`, `P x = sampleWithoutReplacement (ι := ι) (Measure.dirac x)` and
  `Q x = sampleWithReplacement (ι := ι) (Measure.dirac x)`.
- `p = n.descFactorial m / n ^ m` and `t = m.descFactorial 2 / n.descFactorial 2`.
- Use Mathlib's signed normalization: `etvDist P Q = ENNReal.ofReal (tvDist P Q)`, with values
  in `[0, 2]` for probability measures. An eventwise error `c` corresponds to distance at most
  `2 * c`. Provide both eventwise and total-variation forms.
- The one-pair population for distinct `a b : κ` is `Function.update id b a`, not a new
  definition.
- Write `m ≤ n` as `e : ι ↪ κ` when a probability law is needed.

## L0: deterministic populations, observation, and contraction

1. `samplePopulation_dirac`: `samplePopulation σ (Measure.dirac x) = σ.map (fun k i => x (k i))`
   for `[SFinite σ]`, as a simp lemma.
2. `IsFiniteMeasure (sampleWithoutReplacement (ι := ι) ρ)` for finite `ρ`.
3. Observation commutes with sampling: for measurable `g : α → β`,
   `samplePopulation σ (ρ.map (g ∘ ·)) = (samplePopulation σ ρ).map (g ∘ ·)`, and its `P`, `Q`
   specializations.
4. `etvDist_map_le`: for finite `μ ν` and measurable `f`,
   `etvDist (μ.map f) (ν.map f) ≤ etvDist μ ν`, in the general total-variation file
   (naming as `tvDist_map_le` in Mathlib PR
   [#27579](https://github.com/leanprover-community/mathlib4/pull/27579)).
5. For `e : ι ↪ κ`, `P x` and `Q x` are probability measures.

## L1: distinct values attain the collision bound

Let `x` be injective and assume `MeasurableSet {f : ι → α | Function.Injective f}` (true when
`Set.diagonal α` is measurable). Keep this hypothesis explicit.

1. `P x {f | Function.Injective f} = 1` for `e : ι ↪ κ`.
2. `Q x {f | Function.Injective f} = p`, for all finite `ι κ`.
3. **Sharpness.** For `e : ι ↪ κ`, `etvDist (P x) (Q x) = 2 * (1 - p)`.
4. **Sharpness of exact-collision finite de Finetti.** Assume `[Nonempty α]`. For `m ≤ n` and
   injective `x : Fin n → α`, with the measurability hypothesis on `Fin m → α`, uniformly
   permuting `x` and extending the process constantly beyond `n` gives a process exchangeable
   at `n` attaining `ExchangeableAt.etvDist_prefixLaw_sampleWithReplacement_le_exact_collision`
   with equality, on every nonempty value space.

## L2: one repeated pair, exactly

1. **Singleton masses.** For `[MeasurableSingletonClass α]`:
   `P x {y} = Nat.card {f : ι ↪ κ // x ∘ f = y} / n.descFactorial m` and
   `Q x {y} = Nat.card {f : ι → κ // x ∘ f = y} / n ^ m` in `ℝ≥0∞`, for all `m`, `n`.
2. **Fibers.** For `a ≠ b`, `q = Function.update id b a` and an embedding `f`, let `r` count
   the `i` with `q (f i) = a`. The embedding fiber of `q ∘ f` has 1 element if `r = 0`, else
   2; the function fiber has `2 ^ r`; `r = 2` iff `a, b ∈ Set.range f`.
3. **Two-hit mass.** For `a ≠ b` and `m ≤ n`,
   `uniformOn {k : ι → κ | Function.Injective k} {k | a ∈ Set.range k ∧ b ∈ Set.range k} = t`.
4. **One-pair formula.** For `a ≠ b` and `m ≤ n`,
   `tvDist (P q) (Q q) = 2 * (1 - p - t * min p (1 - p))`. On the support of `P q` the
   likelihood ratio `Q q {y} / P q {y}` is `p` if `r ≤ 1` and `2 * p` if `r = 2`. Equal masses
   give `tvDist = 2 * ∑ y, max ((P q).real {y} - (Q q).real {y}) 0`, to which words outside
   that support contribute zero.

## L3: repeated values, the general bound

For `x` not injective and `m ≤ n`:

1. **Bound.** `tvDist (P x) (Q x) ≤ 2 * (1 - p - t * min p (1 - p))`, with its eventwise
   form, from `x = x ∘ Function.update id b a` (where `x a = x b`, `a ≠ b`), L0.3, L0.4 and
   L2.4. No hypothesis on `α` is needed.
2. **Strictness.** For `2 ≤ m ≤ n`, `tvDist (P x) (Q x) < 2 * (1 - p)`.
3. **Characterization.** For `2 ≤ m ≤ n` and the L1 measurability hypothesis,
   `tvDist (P x) (Q x) = 2 * (1 - p) ↔ Function.Injective x`. For `m ≤ 1`, `P x = Q x`.

## L4: random populations and finite de Finetti with ties

1. **Mixture bound.** For a probability measure `ρ` on `κ → α`, `e : ι ↪ κ`, and a measurable
   set `S` of noninjective populations, every measurable `A` satisfies
   both eventwise inequalities with error `1 - p - t * min p (1 - p) * (ρ S).toReal`, hence
   `tvDist` at most twice that. Integrate the collision bound off `S` and L3.1 on `S`.
2. **Finite de Finetti with ties.** For `[IsProbabilityMeasure μ]`, `h : ExchangeableAt μ X n`,
   `m ≤ n`, `hX : ∀ i : Fin n, AEMeasurable (X i.val) μ`, and a measurable set `S` of
   noninjective populations in `Fin n → α`,
   item 1 holds with `ρ = prefixLaw μ X n` and `prefixLaw μ X m` in place of
   `sampleWithoutReplacement ρ`, by `ExchangeableAt.sampleWithoutReplacement_eq_prefixLaw`.

## Worked examples

`tvDist (P x) (Q x)` for `n = 3`, `m = 2`: distinct `2/3`, one pair `4/9`, constant `0`. For
`n = m = 4`, one pair: `13/8` (the `p < 1/2` branch).

## References

- D. Freedman, "A remark on the difference between sampling with and without replacement",
  *J. Amer. Statist. Assoc.* 72 (359) (1977), 681,
  [doi:10.1080/01621459.1977.10480637](https://doi.org/10.1080/01621459.1977.10480637).
- P. Diaconis and D. Freedman, "Finite exchangeable sequences", *Ann. Probab.* 8 (4) (1980),
  745–764, [doi:10.1214/aop/1176994663](https://doi.org/10.1214/aop/1176994663).

## Provenance

Secondary sources: Tau Ceti draft [PR #17365](https://github.com/TauCetiProject/TauCeti/pull/17365)
(L0.1, L0.2, L1.1 to L1.3); A. R. Towell's sampling archive v1.1.0,
[doi:10.5281/zenodo.23833164](https://doi.org/10.5281/zenodo.23833164) (L2, L3.1, L3.2).
