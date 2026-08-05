# Berge's maximum theorem

Argmin stability under objective perturbation: how a minimizer over a compact feasible set
moves when the objective is perturbed, and when the value function is continuous.

Mathlib has `IsCompact.exists_isMinOn`, `IsCompact.tendsto_subseq`, `IsMinOn`, and the
hemicontinuity *definitions* `UpperHemicontinuousAt` and `LowerHemicontinuousAt` with the
sequential criterion — but no Berge theorem.

Suggested home: `TauCeti/Topology/`.

## Standing conventions

- **Both cases are stated, and every statement says which it is.** The fixed-constraint case
  keeps the compact `K` independent of the parameter; the varying case carries a constraint
  correspondence, and its two halves need different hypotheses on it.
- **Hypotheses are those the proof uses.** The argmin half over a fixed compact set needs no
  countability or separation hypothesis on the point space, because the classical open-cover
  argument replaces the sequential route. The value half and the varying-constraint results
  carry the first-countability, regularity and local-compactness hypotheses their proofs use.
- **`IsMinOn` rather than an invented argmin-set API**: the predicate is Mathlib's.

## What is missing (build here)

* Continuity of the value function and upper hemicontinuity of the argmin correspondence,
  over a fixed compact feasible set and over a varying one.
* The compactness form of approximate-minimizer stability the argument consumes.

## The build, in layers

### Part A — a fixed compact feasible set

**Objects.** For jointly continuous `g : P → X → ℝ` and a nonempty compact `K ⊆ X`: the argmin
correspondence `p ↦ {x ∈ K | IsMinOn (g p) K x}` and the value function
`p ↦ ⨅ x : K, g p x`.

**API to develop.**

- The **engine**, and the actual content of the fixed-constraint case: a sequence of
  *approximate* minimizers in a compact set (`F (z k) ≤ F x + ε x k` for `x ∈ K`, with
  `ε x k → 0`) has a subsequence converging to a minimizer on `K`. This is the recovery
  half of the fundamental theorem of Γ-convergence, with a global-comparison variant beside it.
- The **sequential uniform-convergence step**: along `p k → p₀`, the evaluation difference
  `g (p k) (x k) − g p₀ (x k)` vanishes for points staying in `K`, proved by the subsequence
  criterion, in exactly the form Berge consumes.

**Milestone A1 — Berge at fixed `K`, in three forms**, because three consumers want three
shapes: a closed-graph sequential statement, a statement through Mathlib's own
`UpperHemicontinuousAt`, and a uniform `ε`–`δ` modulus whose `δ` depends only on `(p₀, ε)` and
so avoids measurable selection of minimizers. The family form measures closeness by a finite
family of continuous invariants vanishing on the diagonal rather than by the ambient metric —
the case where minimizers are determined only up to a symmetry group.

**Milestone A2 — the value function** at fixed `K` is continuous, by the squeeze between a
fixed minimizer of `g p₀` and the moving minimizers.

### Part B — a varying constraint correspondence

**Milestone B1 — the classical theorem, over a varying constraint correspondence.** This is
the classical statement's actual generality. **The fixed-constraint case is a special case of
it, not a step toward it**: the argument that proves the fixed case does not generalize by
adding a hypothesis, because with `K` varying the approximate-minimizer sequence need not
stay in one compact set.

Both hemicontinuity predicates already exist upstream, so nothing here defines a hemicontinuity
notion. What the milestone adds is a correspondence `Γ : P → Set X` that is

- **nonempty- and compact-valued** — both essential, for opposite reasons: the first makes the
  value function finite, the second is what makes an argmin exist at all;
- **upper hemicontinuous** — what bounds the argmin set from outside and gives the closed-graph
  half;
- **lower hemicontinuous** — what the value function's *upper* semicontinuity needs, and the
  half the fixed-constraint development never had to prove, a constant correspondence being
  trivially lower hemicontinuous.

The conclusion: the value function `v p = ⨅ x ∈ Γ p, g p x` is continuous, and the argmin
correspondence is upper hemicontinuous with nonempty compact values.

Continuity of `v` splits into *lower* semicontinuity from upper hemicontinuity of `Γ` and
*upper* semicontinuity from lower hemicontinuity of `Γ`, and each half is provable on its
own. As a single target, "Berge's theorem" is two independent lemmas with opposite
hypotheses, and half of it is already available from Milestone A2.

**Scope.** The vocabulary is Mathlib's hemicontinuity predicates, not a bespoke
correspondence structure; new here are the two theorems above and nothing else.

## Worked examples (acceptance criteria)

**Acceptance examples.** `g p x = ‖x − p‖²` on a compact `K`: the argmin correspondence is the
metric projection, and the modulus form is nontrivial exactly where the projection is
set-valued; a symmetric objective whose minimizers form an orbit, exercising the
invariant-family modulus.

## Ordering

Part A is a leaf: it rests only on Mathlib. Part B consumes Part A's fixed-constraint
statements. This roadmap is independent of the
[operator theory](../OperatorTheory/README.md) family.

## References

- C. Berge, *Topological Spaces* (1963), and C. D. Aliprantis, K. C. Border, *Infinite
  Dimensional Analysis*, 3rd ed. (2006), Ch. 17 — the maximum theorem, hemicontinuity.
- G. Dal Maso, *An Introduction to Γ-Convergence* (1993) — recovery of minimizers from
  approximate minimizers.

## Acknowledgements

An Apache-2.0 implementation exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization) (Kitware,
Inc.). The public API and proof structure may change during integration.
