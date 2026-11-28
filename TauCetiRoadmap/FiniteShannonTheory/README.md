# Roadmap: Finite Shannon theory

**Summary.** This roadmap builds the elementary Shannon theory of finite
alphabets, distribution first: the objects are distributions on finite types,
given as functions `p : α → ℝ`, and the theory is the one of Chapter 2 of
Cover–Thomas, developed completely before it is applied. The main objects are
the Shannon entropy `H(p) = ∑ x, -p(x) log p(x)` of a finite distribution, the
conditional entropy and mutual information of a joint distribution, and the
finite Kullback–Leibler divergence `D(p ‖ q) = ∑ x, p(x) log (p(x) / q(x))`,
all with natural logarithms. The headline theorems are the chain rule
`H(X, Y) = H(Y) + H(X ∣ Y)`, the nonnegativity of mutual information with
equality exactly under independence, Fano's inequality, the identification of
the distribution-level theory with Tau Ceti's existing label entropy of a
finite label under a probability measure, and, as the final layer, the
asymptotic equipartition property and Shannon's channel coding theorem for
finite channels.

Within Tau Ceti, the roadmap builds on the label and partition entropy
development in `TauCeti.InformationTheory` (`labelEntropy`,
`condLabelEntropy`, the partition entropies), whose random-variable-first
theory it complements with the distribution-first one and connects to by
proved bridges in Layer 4; on Tau Ceti's finite Kullback–Leibler formula
(`TauCeti.InformationTheory.KullbackLeibler.Finite`), which Layer 3 restates
in distribution terms; and on Mathlib's `Real.negMulLog`, `klFun` and
`klDiv`, `Real.binEntropy`, and strong law of large numbers. It feeds the
Rényi divergence roadmap, whose order-`1` limit is the divergence of Layer 3;
the PAC-Bayes bounds roadmap, whose change-of-measure arguments use finite
Kullback–Leibler divergences on finite alphabets; and the large deviations
roadmap, whose finite-alphabet rate functions are relative entropies.

Layer 1 defines the entropy of a finite distribution with its complete basic
API. Layer 2 defines conditional entropy and mutual information of a joint
distribution and proves the chain rule, subadditivity and data processing.
Layer 3 defines the finite Kullback–Leibler divergence, proves Gibbs'
inequality, and identifies the divergence with Mathlib's `klDiv` of the
distributions' own mass measures. Layer 4 proves the bridges to the label and partition entropies.
Layer 5 proves Fano's inequality. Layer 6 develops typical sequences and
states and proves the channel coding theorem for finite channels.

## Conventions

- **Distributions.** A distribution on a finite type `α` is a bare function
  `p : α → ℝ`. The definitions are total and take no hypotheses; the
  distribution axioms `0 ≤ p x` and `∑ x, p x = 1` are carried as hypotheses
  of the lemmas that need them, as with Mathlib's `Real.negMulLog` API.
  Nothing in this roadmap uses `ProbabilityTheory.PMF` as the carrier.
- **Logarithms.** All logarithms are natural; entropies are in nats.
  `Real.negMulLog x = -x log x`, with `negMulLog 0 = 0`, is the single
  building block; the convention `0 log 0 = 0` and `0 log (0/0) = 0` are
  inherited from it and from `Real.log 0 = 0`.
- **Pairs.** For a joint distribution `p : α × β → ℝ`, `X` and `Y` in the
  prose are the two coordinates; the marginals are
  `marginal₁ p a = ∑ b, p (a, b)` and `marginal₂ p b = ∑ a, p (a, b)`.
  The joint entropy is the entropy of `p` itself; no separate definition
  is introduced for it.
- **Names.** New declarations live in the `InformationTheory` namespace
  region of Tau Ceti, next to the existing label entropy API, and are named
  to be distinguishable from it at a glance: the distribution-level notions
  are `entropy`, `condEntropy`, `mutualInfo` and `relEntropy`, against the
  label-level `labelEntropy` and `condLabelEntropy`; no name is shared
  between the two APIs, as in the Suggested file.

## Layer 1: Entropy of a finite distribution

Define, for `[Fintype α]` and `p : α → ℝ`,

```
entropy p = ∑ x, negMulLog (p x)
```

with the following basic theory, for `p` a distribution (`0 ≤ p`,
`∑ x, p x = 1`) unless stated otherwise.

- `entropy_nonneg`: `0 ≤ entropy p`.
- `entropy_point_mass`: the point mass at `a` has entropy `0`.
- `entropy_uniform`: the constant distribution `(card α)⁻¹` has entropy
  `log (card α)`.
- `entropy_le_log_card`: `entropy p ≤ log (card α)`, by Jensen's inequality
  for `Real.concaveOn_negMulLog`; equality holds for the uniform
  distribution (the forward direction is the target here; the
  characterisation of equality is Layer 2's `mutualInfo_eq_zero_iff` applied
  to a pair, not a target of this layer).
- `entropy_eq_zero_of_forall`: a distribution supported on a single point
  has entropy `0`. Support invariance: `entropy p` depends only on the
  values of `p` on its support; adjoining zero-mass points does not change
  it, and reindexing by an equivalence `α ≃ β` transports it.
- Computations: on `Fin 2`, `entropy ![p, 1 - p] = Real.binEntropy p`
  (agreement with Mathlib's binary entropy), and the entropy of a product
  distribution splits, `entropy (fun z => q z.1 * r z.2) =
  (∑ b, r b) * entropy q + (∑ a, q a) * entropy r` for arbitrary `q`, `r`,
  hence `entropy (q ⊗ r) = entropy q + entropy r` for distributions.

**Check.** `entropy` of the uniform distribution on `Bool` is `log 2`, and
of the point mass at `true` is `0`, by `decide`-free computation through
the lemmas above (`entropy_uniform`, `entropy_point_mass`).

## Layer 2: Conditional entropy and mutual information

For a joint distribution `p : α × β → ℝ`, define the marginals as in the
Conventions and

```
condEntropy p = ∑ z, p z * log ((marginal₂ p z.2) / p z)
mutualInfo p = entropy (marginal₁ p) + entropy (marginal₂ p) - entropy p
```

Targets, for `p` a distribution:

- `condEntropy_nonneg`: `0 ≤ condEntropy p`.
- Chain rule: `entropy p = entropy (marginal₂ p) + condEntropy p`.
- `condEntropy_le_entropy`: conditioning reduces entropy,
  `condEntropy p ≤ entropy (marginal₁ p)`.
- `mutualInfo_nonneg`: `0 ≤ mutualInfo p` (equivalent to subadditivity
  `entropy p ≤ entropy (marginal₁ p) + entropy (marginal₂ p)`; prove the
  subadditivity form and derive both).
- `mutualInfo_comm`: mutual information is symmetric in the two
  coordinates, via the equivalence `α × β ≃ β × α`.
- `mutualInfo_eq_zero_iff`: `mutualInfo p = 0` if and only if `p` is the
  product of its marginals, `p (a, b) = marginal₁ p a * marginal₂ p b`.
- `mutualInfo_self`: for the diagonal joint distribution
  `fun z => if z.1 = z.2 then q z.1 else 0` of a distribution `q` with
  itself, mutual information equals `entropy q`.
- Data processing for functions: for `f : α → γ`, pushing `p` forward
  along `f` in the first coordinate does not increase mutual information,
  and `entropy (fun c => ∑ a ∈ f ⁻¹' {c}, p a) ≤ entropy p` for a
  distribution `p` on a finite type (entropy does not increase under a
  function of the variable).
- The klFun characterisation: `mutualInfo p =
  ∑ z, (marginal₁ p z.1 * marginal₂ p z.2) *
    klFun (p z / (marginal₁ p z.1 * marginal₂ p z.2))`, matching the
  label-level identity `labelEntropy_add_sub_pair_eq_sum_klFun` so that
  Layer 4's bridge can identify the two.

**Check.** For `p` the product of the uniform distribution on `Bool` with
itself, `mutualInfo p = 0` by `mutualInfo_eq_zero_iff`; for the diagonal
joint distribution of the same `q`, `mutualInfo = log 2` by
`mutualInfo_self` and `entropy_uniform`.

## Layer 3: Finite Kullback–Leibler divergence

For `p q : α → ℝ` on a finite type, define

```
relEntropy p q = ∑ x, p x * log (p x / q x)
```

The definition is total. Where `q x = 0 < p x` the mathematical value of
`D(p ‖ q)` is `+∞`, which a real-valued sum cannot return; following the
convention of the Rényi roadmap, the lemmas below are stated under the
support hypothesis `q x = 0 → p x = 0`, under which the sum is the
mathematical value, and no lemma uses the value outside it. Terms with
`p x = 0` contribute `0` by the conventions of the Conventions section.

Targets:

- `relEntropy_nonneg` (Gibbs' inequality): if `p`, `q` are distributions
  and `q x = 0` implies `p x = 0`, then `0 ≤ relEntropy p q`. Proof through
  `klFun`: `relEntropy p q = ∑ x, q x * klFun (p x / q x)` under the same
  hypotheses, and `klFun_nonneg`.
- `relEntropy_eq_zero_iff`: under the same hypotheses,
  `relEntropy p q = 0` if and only if `p = q`.
- The measure of a distribution: for `p : α → ℝ` write `μ p` for the
  measure on the finite type `α` (discrete measurable space structure)
  with singleton masses `p x`, i.e. the finite sum
  `∑ x, (ENNReal.ofReal (p x)) • Measure.dirac x`. This notation is used
  here and in Layer 4.
- `relEntropy_eq_klDiv`: for distributions `p`, `q` with `q` of full
  support, `(klDiv (μ p) (μ q)).toReal = relEntropy p q`, by
  specialising Tau Ceti's `klDiv_eq_sum_klFun_singleton` (the supplier
  statement in `TauCeti.InformationTheory.KullbackLeibler.Finite`) to
  `μ p`, `μ q`.
- Joint convexity of `(p, q) ↦ relEntropy p q` on pairs of distributions,
  from `klFun` convexity (Mathlib's `convexOn_klFun` region and Tau Ceti's
  `KullbackLeibler.Convex`).

Pinsker's inequality is already in Tau Ceti
(`TauCeti.InformationTheory.KullbackLeibler.Pinsker`) and is not a target.

## Layer 4: Bridges to label and partition entropy

Identify the two developments on finite alphabets, using the measure
`μ p` of a distribution from Layer 3; for a distribution `p`, `μ p` is a
probability measure.

- `entropy_eq_labelEntropy`: `entropy p = labelEntropy (μ p) id`.
- `condEntropy_eq_condLabelEntropy`: for a joint distribution `p` on
  `α × β`, `condEntropy p = condLabelEntropy (μ p) Prod.fst Prod.snd`
  (with the label-entropy argument order as in
  `TauCeti.InformationTheory.LabelEntropy`).
- `mutualInfo_eq_labelEntropy_gap`: `mutualInfo p` equals the label gap
  `labelEntropy (μ p) Prod.fst + labelEntropy (μ p) Prod.snd -
  labelEntropy (μ p) id`, hence, by the existing label theory, the chain
  rule, bounds and independence characterisation of Layers 1–2 also follow
  from the label development; the direct proofs of Layers 1–2 stand, and
  these bridges are the agreement tests between the two APIs.
- The partition-entropy forms: `entropy p =
  (countablePartitionEntropy (μ p) id).toReal` under the probability
  hypothesis, through `TauCeti`'s
  `countablePartitionEntropy_eq_ofReal_labelEntropy`.

## Layer 5: Fano's inequality

For a joint distribution `p` on `α × β` with `β` the observation, an
estimator is a function `g : β → α`; its error probability is
`Pₑ = ∑ z with g z.2 ≠ z.1, p z`. Targets:

- Fano's inequality: with `X` the first coordinate,
  `Real.binEntropy Pₑ + Pₑ * log (card α - 1) ≥ condEntropy p`,
  for `card α ≥ 2`, proved by the standard two-step chain rule through the
  error indicator (a `Bool`-valued function of the pair), using Layer 2's
  data processing and Layer 1's binary-entropy computation.
- The weakened form `Pₑ ≥ (condEntropy p - 1) / log (card α)`.

## Layer 6: Typical sequences and channel capacity

Fix a distribution `p` on a finite type `α`. For `n : ℕ` and `ε > 0`, the
typical set `A ε n` is the set of sequences `x : Fin n → α` with
`|-(1/n) log (∏ i, p (x i)) - entropy p| ≤ ε`.

- AEP: the probability of the typical set under the product distribution
  tends to `1` as `n → ∞` (through Mathlib's strong law of large numbers
  applied to the summands `log (p (X i))`, on the support of `p`), and
  every typical sequence has probability between
  `exp (-n (entropy p + ε))` and `exp (-n (entropy p - ε))`.
- Cardinality bounds: `(1 - δ) exp (n (entropy p - ε)) ≤ card (A ε n) ≤
  exp (n (entropy p + ε))` for all large `n`.

A finite channel is a function `W : α → β → ℝ` with `W a` a distribution
for each `a`. For an input distribution `p`, the output distribution and
the joint distribution are the evident sums; the channel's mutual
information at `p` is Layer 2's `mutualInfo` of that joint distribution.

- `channelCapacity W = ⨆ p : distribution, mutualInfo (joint p W)` as a
  supremum over the finite simplex of input distributions; the supremum is
  attained (the simplex is compact and `mutualInfo` of the joint
  distribution is continuous in `p`), and `channelCapacity W ≤
  log (min (card α) (card β))`.
- Shannon's channel coding theorem for finite channels: for every rate
  `R < channelCapacity W` there are block codes of block length `n`, rate
  at least `R` and maximal error probability tending to `0` as `n → ∞`
  (achievability, by random coding over the typical sets above), and for
  every sequence of block codes of rate at least `R > channelCapacity W`
  the maximal error probability is bounded away from `0` (weak converse,
  by Fano's inequality from Layer 5 and data processing from Layer 2).

## Scope and ownership

In scope: finite alphabets only; distributions as functions on finite
types; entropy, conditional entropy, mutual information, finite relative
entropy, Fano, typicality, finite channel capacity and the coding theorem.

Out of scope, with their owners: entropy of labels and partitions of a
general probability space, including countable alphabets (the existing
`TauCeti.InformationTheory` label and partition development, which this
roadmap bridges to but does not restate); Rényi divergences and Rényi
differential privacy (the Rényi divergence roadmap); error-correcting
codes as algebraic objects (the coding-theory roadmaps, e.g.
BoundsOnCodes); differential entropy and continuous alphabets (no owner
yet; a separate roadmap); rate–distortion theory (no owner yet; a
separate roadmap building on this one).

## Exact supplier contracts

### From Mathlib

- `Real.negMulLog` and its API (`negMulLog_nonneg`, `negMulLog_mul`,
  `Real.concaveOn_negMulLog`), `Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean`:
  the building block of every definition here.
- Jensen's inequality, `ConcaveOn.le_map_sum`
  (`Mathlib/Analysis/Convex/Jensen.lean`): Layer 1's bound.
- `InformationTheory.klDiv`, `klFun` and `klFun_nonneg`
  (`Mathlib/InformationTheory/KullbackLeibler/`): Layer 3's identification
  target and proof route.
- `Real.binEntropy` (`Mathlib/Analysis/SpecialFunctions/BinaryEntropy.lean`):
  Layers 1 and 5.
- The strong law of large numbers
  (`Mathlib/Probability/StrongLaw.lean` region): Layer 6's AEP.

### From Tau Ceti

- `TauCeti.InformationTheory.LabelEntropy` (`labelEntropy`,
  `condLabelEntropy`, `labelEntropy_nonneg_le_log_card`,
  `labelEntropy_add_sub_pair_eq_sum_klFun`, the chain rule
  `labelEntropy_pair_eq_add`): the label-level theory Layer 4 identifies
  with Layers 1–2.
- `TauCeti.InformationTheory.KullbackLeibler.Finite`
  (`klDiv_eq_sum_klFun_singleton`): Layer 3's supplier statement.
- `TauCeti.InformationTheory.PartitionEntropy.Finite`
  (`countablePartitionEntropy_eq_ofReal_labelEntropy`): Layer 4's
  partition form.

### From other roadmaps

- Rényi divergence and privacy: consumes Layer 3's `relEntropy` as its
  order-`1` limit on finite alphabets; no item here is restated there.
- PAC-Bayes bounds: consumes Layer 3's finite relative entropy and Gibbs'
  inequality for its finite-alphabet change of measure.
- Large deviations: consumes Layer 3's relative entropy as the
  finite-alphabet rate function.

## Provenance

A prototype of Layer 1 (definitions of `entropy`, the marginals and
`mutualInfo`, with `entropy_nonneg`, `entropy_point_mass`,
`entropy_uniform`, `entropy_le_log_card` and the product splitting proved,
no `sorry`, standard axioms only) exists at
https://github.com/ma-bo-do-fu/mathlib-blanks (Apache-2.0), written by this
roadmap's author, who agrees to its integration. Per the roadmap
guidelines the specification above is intrinsic; the prototype is prior
art for the Suggested signatures, not a prescription. Its file map:
`LeanLab/InformationTheory/EntropyDefs.lean` (definitions) and
`LeanLab/InformationTheory/Entropy.lean` (proofs) correspond to Layer 1
and the `mutualInfo` definition of Layer 2.

## References

- T. M. Cover and J. A. Thomas, *Elements of Information Theory*, 2nd ed.,
  Wiley, 2006. Chapter 2 (entropy, relative entropy, mutual information,
  chain rules, Fano), Chapter 3 (the asymptotic equipartition property),
  Chapter 7 (channel capacity and the coding theorem).
- R. M. Gray, *Entropy and Information Theory*, 2nd ed., Springer, 2011.
- Mathlib's `InformationTheory` folder and Tau Ceti's
  `TauCeti/InformationTheory/` tree, as cited in the supplier contracts.
