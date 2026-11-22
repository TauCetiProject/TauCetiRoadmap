import Mathlib

/-!
# Mean field and belief propagation: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining API lists and Checks are not restated.

Several definitions are verbatim copies, because a roadmap's Lean file cannot import another
roadmap's module: `margin`, `CondIndep`, `Separates` and `IsGlobalMarkov` from
GraphicalModelsAndConditionalIndependence 1.1, 2.1 and 2.2; `isWeight` from
ImportanceSamplingAndVarianceReduction 1.1; `elbo` from EvidenceLowerBound 1.3; `spin` and
`ising` from QuantumOptimization 1.1; `cwEnergy`, `freeEnergy` and `pressure` from
CurieWeissModel 1.1 and 1.2.

Variables are indexed by a finite type `V`; the variable at `v` takes values in a finite type
`X v`, and a configuration is an element of `∀ v, X v`. A law is a function
`p : (∀ v, X v) → ℝ≥0`, not necessarily normalised. A product law is a family `q` of probability
vectors `q v : X v → ℝ`; as a measure on configurations it is `productLaw q`. A pairwise model on
a simple graph `G` has vertex potentials `ψ v : X v → ℝ≥0` and, for every ordered pair `(u, v)`,
a factor `φ u v : X u → X v → ℝ≥0`; the potential of the edge `uv` is
`edgePot φ u v a b = φ u v a b * φ v u b a`. Messages are unnormalised: `m u v : X v → ℝ≥0` is
the message from `u` to `v`, and only messages along edges of `G` are read.
-/

noncomputable section

open Finset MeasureTheory ProbabilityTheory Filter Topology
open scoped NNReal ENNReal

namespace TauCetiRoadmap.MeanFieldAndBeliefPropagation

/-! ## Definitions copied verbatim from GraphicalModelsAndConditionalIndependence -/

section CopiedFromGraphicalModels

variable {V : Type*} [Fintype V] [DecidableEq V] {X : V → Type*} [∀ v, Fintype (X v)]
  [∀ v, DecidableEq (X v)]

/-- 1.1 (copied verbatim from GraphicalModelsAndConditionalIndependence 1.1): the margin of `p`
on the set `A` at the configuration `x`: the total mass of the configurations that agree with
`x` on `A`. On `A = ∅` it is the total mass of `p`. -/
def margin (p : (∀ v, X v) → ℝ≥0) (A : Finset V) (x : ∀ v, X v) : ℝ≥0 :=
  ∑ y ∈ univ.filter (fun y => ∀ v ∈ A, y v = x v), p y

/-- 2.1 (copied verbatim from GraphicalModelsAndConditionalIndependence 1.1): the variables in
`A` and in `B` are conditionally independent given those in `S` under `p`. -/
def CondIndep (p : (∀ v, X v) → ℝ≥0) (A B S : Finset V) : Prop :=
  ∀ x, margin p S x * margin p (A ∪ B ∪ S) x = margin p (A ∪ S) x * margin p (B ∪ S) x

/-- 2.1 (copied verbatim from GraphicalModelsAndConditionalIndependence 2.1): `S` separates `A`
from `B` in `G`: every walk from a vertex of `A` to a vertex of `B` visits a vertex of `S`. -/
def Separates (G : SimpleGraph V) (S A B : Finset V) : Prop :=
  ∀ a ∈ A, ∀ b ∈ B, ∀ w : G.Walk a b, ∃ v ∈ w.support, v ∈ S

/-- 2.1 (copied verbatim from GraphicalModelsAndConditionalIndependence 2.2): the global Markov
property: for pairwise disjoint `A`, `B`, `S` with `S` separating `A` from `B`, the variables in
`A` and in `B` are conditionally independent given those in `S`. -/
def IsGlobalMarkov (G : SimpleGraph V) (p : (∀ v, X v) → ℝ≥0) : Prop :=
  ∀ A B S : Finset V, Disjoint A B → Disjoint A S → Disjoint B S → Separates G S A B →
    CondIndep p A B S

end CopiedFromGraphicalModels

/-! ## Definitions copied verbatim from ImportanceSamplingAndVarianceReduction and
EvidenceLowerBound -/

section CopiedImportanceSampling

variable {α Ω Ω' : Type*} {mα : MeasurableSpace α} {mΩ : MeasurableSpace Ω}
  {mΩ' : MeasurableSpace Ω'}

/-- 1.1 (copied verbatim from ImportanceSamplingAndVarianceReduction 1.1): the importance weight
(likelihood ratio) `dp/dq`, as a real function. -/
def isWeight (p q : Measure α) (x : α) : ℝ :=
  (p.rnDeriv q x).toReal

end CopiedImportanceSampling

section CopiedElbo

variable {Z : Type*} {mZ : MeasurableSpace Z}

/-- 1.1 (copied verbatim from EvidenceLowerBound 1.3): the evidence lower bound
`∫ log (dp/dr) dr` of a probability measure `r` on the latent space, for the joint measure `p`. -/
def elbo (p r : Measure Z) : ℝ :=
  ∫ z, Real.log (isWeight p r z) ∂r

end CopiedElbo

/-! ## Layer 1: naive mean field -/

section MeanField

variable {V : Type*} [Fintype V] [DecidableEq V] {X : V → Type*} [∀ v, Fintype (X v)]
  [∀ v, DecidableEq (X v)]

/-- 1.1 The product of the probability simplices: families `q` with each `q v` a probability
vector on `X v`. -/
def productSimplex : Set (∀ v, X v → ℝ) :=
  {q | ∀ v, (∀ a, 0 ≤ q v a) ∧ ∑ a, q v a = 1}

/-- 1.1 The expected log-law `E log p(a, X_{−v})` when the coordinates other than `v` are drawn
from `q` and the coordinate `v` is fixed to `a`. -/
def expectedLog (p : (∀ v, X v) → ℝ≥0) (q : ∀ v, X v → ℝ) (v : V) (a : X v) : ℝ :=
  ∑ y, (∏ w, Function.update q v (Pi.single a 1) w (y w)) * Real.log (p y)

/-- 1.1 The coordinate-ascent update of the factor at `v`: the probability vector proportional to
`exp (expectedLog p q v a)`. -/
def caviCoord (p : (∀ v, X v) → ℝ≥0) (q : ∀ v, X v → ℝ) (v : V) : X v → ℝ :=
  fun a => Real.exp (expectedLog p q v a) / ∑ b, Real.exp (expectedLog p q v b)

/-- 1.1 The family `q` with its factor at `v` replaced by the coordinate-ascent update. -/
def caviUpdate (p : (∀ v, X v) → ℝ≥0) (q : ∀ v, X v → ℝ) (v : V) : ∀ v, X v → ℝ :=
  Function.update q v (caviCoord p q v)

/-- 1.2 A sweep: the coordinate-ascent updates at the vertices of the list `l`, in order. -/
def caviSweep (p : (∀ v, X v) → ℝ≥0) (l : List V) (q : ∀ v, X v → ℝ) : ∀ v, X v → ℝ :=
  l.foldl (fun q v => caviUpdate p q v) q

section Measures

variable [∀ v, MeasurableSpace (X v)] [∀ v, MeasurableSingletonClass (X v)]

/-- 1.1 The finite measure `Σ_x p x δ_x` on configurations of a law `p`. -/
def lawMeasure (p : (∀ v, X v) → ℝ≥0) : Measure (∀ v, X v) :=
  ∑ x, (p x : ℝ≥0∞) • Measure.dirac x

/-- 1.1 The product law of `q`, the measure giving `x` the mass `Π_v q v (x v)`. -/
def productLaw (q : ∀ v, X v → ℝ) : Measure (∀ v, X v) :=
  ∑ x, ENNReal.ofReal (∏ v, q v (x v)) • Measure.dirac x

/-- 1.1 The evidence lower bound of a product law and the exact gain of a coordinate update: for
a positive law `p` and a product law `q`, the bound is `Σ_x Q{x} log p(x) + Σ_x negMulLog Q{x}`
with `Q{x} = Π_v q v (x v)`; updating the factor at `v` raises it by exactly the relative entropy
of the old factor from the new one, and the new factor is the unique maximiser over the factor
at `v`. -/
theorem elbo_caviUpdate_sub_elbo {p : (∀ v, X v) → ℝ≥0} (hp : ∀ x, 0 < p x)
    {q : ∀ v, X v → ℝ} (hq : q ∈ productSimplex) (v : V) :
    elbo (lawMeasure p) (productLaw q) =
        ∑ x : ∀ w, X w, (∏ w, q w (x w)) * Real.log (p x) +
          ∑ x : ∀ w, X w, Real.negMulLog (∏ w, q w (x w)) ∧
    elbo (lawMeasure p) (productLaw (caviUpdate p q v)) - elbo (lawMeasure p) (productLaw q) =
        ∑ a, q v a * Real.log (q v a / caviCoord p q v a) ∧
      ∀ r : X v → ℝ, (∀ a, 0 ≤ r a) → ∑ a, r a = 1 →
        elbo (lawMeasure p) (productLaw (Function.update q v r)) ≤
            elbo (lawMeasure p) (productLaw (caviUpdate p q v)) ∧
          (elbo (lawMeasure p) (productLaw (Function.update q v r)) =
              elbo (lawMeasure p) (productLaw (caviUpdate p q v)) ↔ r = caviCoord p q v) := by
  sorry

/-- 1.2 Coordinate ascent by sweeps through a list `l` containing every vertex: the evidence
lower bound does not decrease and stays below `log Σ_x p x`; a product law is fixed by a sweep
exactly when every factor equals its own update; the iterates have limit points, and every limit
point is such a fixed point. -/
theorem caviSweep_iterate {p : (∀ v, X v) → ℝ≥0} (hp : ∀ x, 0 < p x) {l : List V}
    (hl : ∀ v, v ∈ l) {q₀ : ∀ v, X v → ℝ} (hq₀ : q₀ ∈ productSimplex) :
    Monotone (fun k : ℕ => elbo (lawMeasure p) (productLaw ((caviSweep p l)^[k] q₀))) ∧
      (∀ k : ℕ, elbo (lawMeasure p) (productLaw ((caviSweep p l)^[k] q₀)) ≤
        Real.log (∑ x, (p x : ℝ))) ∧
      (∀ q ∈ productSimplex, caviSweep p l q = q ↔ ∀ v, caviCoord p q v = q v) ∧
      (∃ q, MapClusterPt q atTop fun k : ℕ => (caviSweep p l)^[k] q₀) ∧
      ∀ q, MapClusterPt q atTop (fun k : ℕ => (caviSweep p l)^[k] q₀) →
        q ∈ productSimplex ∧ ∀ v, caviCoord p q v = q v := by
  sorry

end Measures

end MeanField

section CopiedFromQuantumOptimization

variable {ι : Type*} [Fintype ι]

/-- 1.3 (copied verbatim from QuantumOptimization 1.1): the spin of variable `i` in the
configuration `x`: `−1` if `x i` is true and `1` otherwise. -/
def spin (x : ι → Bool) (i : ι) : ℝ := if x i then -1 else 1

/-- 1.3 (copied verbatim from QuantumOptimization 1.1): the Ising energy with couplings `J`,
summed over all ordered pairs, and fields `h`. -/
def ising (J : Matrix ι ι ℝ) (h : ι → ℝ) (x : ι → Bool) : ℝ :=
  ∑ i, ∑ j, J i j * spin x i * spin x j + ∑ i, h i * spin x i

end CopiedFromQuantumOptimization

/-- 1.3 (copied verbatim from CurieWeissModel 1.1): the Curie–Weiss energy of `N` spins at
inverse temperature `β` in the field `h`, `H(x) = −(β / (2N)) M(x)² − h M(x)` with
`M(x) = Σ_i spin x i`. -/
def cwEnergy (N : ℕ) (β h : ℝ) : (Fin N → Bool) → ℝ :=
  ising (Matrix.of fun _ _ ↦ -(β / (2 * N))) fun _ ↦ -h

/-- 1.3 (copied verbatim from CurieWeissModel 1.2): the mean-field free energy
`f_β(m) = −β m² / 2 − s(m)`, where `s(m) = binEntropy ((1 + m) / 2)`. -/
def freeEnergy (β m : ℝ) : ℝ :=
  -(β * m ^ 2 / 2) - Real.binEntropy ((1 + m) / 2)

/-- 1.3 (copied verbatim from CurieWeissModel 1.2): the variational pressure
`ψ(β, h) = max_{m ∈ [−1, 1]} (h m − f_β(m))`. -/
def pressure (β h : ℝ) : ℝ :=
  sSup ((fun m ↦ h * m - freeEnergy β m) '' Set.Icc (-1) 1)

section Ising

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 1.3 The spin mean `q i false − q i true` of a factor on `Bool` (spin `1` at `false`, `−1` at
`true`). -/
def spinMean (q : ι → Bool → ℝ) (i : ι) : ℝ := q i false - q i true

/-- 1.3 (a) Naive mean field for Ising models: for the law `exp(−ising J h)`, a product law is
fixed by every coordinate update exactly when its spin means solve the mean-field equations
`m_i = −tanh (h_i + Σ_{j ≠ i} (J i j + J j i) m_j)`. -/
theorem caviCoord_ising_eq_iff (J : Matrix ι ι ℝ) (h : ι → ℝ) {q : ι → Bool → ℝ}
    (hq : q ∈ productSimplex (X := fun _ : ι => Bool)) :
    (∀ i, caviCoord (fun x => (Real.exp (-ising J h x)).toNNReal) q i = q i) ↔
      ∀ i, spinMean q i =
        -Real.tanh (h i + ∑ j ∈ univ.erase i, (J i j + J j i) * spinMean q j) := by
  sorry

end Ising

/-- 1.3 (b) Naive mean field is exact per spin for the Curie–Weiss model: the best evidence lower
bound over product laws, divided by `N`, tends to the pressure, for all real `β` and `h`. -/
theorem tendsto_sSup_elbo_productLaw_cwEnergy_div (β h : ℝ) :
    Tendsto (fun N : ℕ => sSup ((fun q => elbo
        (lawMeasure fun x => (Real.exp (-cwEnergy N β h x)).toNNReal) (productLaw q)) ''
          productSimplex (X := fun _ : Fin N => Bool)) / N) atTop (𝓝 (pressure β h)) := by
  sorry

/-! ## Layer 2: trees -/

section Trees

variable {V : Type*} [Fintype V] [DecidableEq V] {X : V → Type*} [∀ v, Fintype (X v)]
  [∀ v, DecidableEq (X v)]

/-- 2.1 The tree factorisation of a Markov law in division-free form: on a forest `G`, a law of
total mass `1` that is globally Markov for `G` satisfies
`p x · Π_v p_v(x_v)^(deg v − 1) = Π_{uv ∈ E} p_uv(x_u, x_v) · Π_{deg v = 0} p_v(x_v)` for every `x`,
where `p_v` and `p_uv` are the margins on `{v}` and on `{u, v}`; the exponent `deg v − 1` is the
natural-number difference, `0` at isolated vertices, which appear on the right instead. -/
theorem margin_mul_prod_pow_eq_prod {G : SimpleGraph V} [DecidableRel G.Adj] (hG : G.IsAcyclic)
    {p : (∀ v, X v) → ℝ≥0} (hp : ∑ x, p x = 1) (hM : IsGlobalMarkov G p) (x : ∀ v, X v) :
    p x * ∏ v, margin p {v} x ^ (G.degree v - 1) =
      (∏ e ∈ G.edgeFinset, margin p e.toFinset x) *
        ∏ v ∈ univ.filter (fun v => G.degree v = 0), margin p {v} x := by
  sorry

/-- 2.2 The potential of the edge `uv` in the direction `u → v`: `φ u v a b · φ v u b a`. -/
def edgePot (φ : (u v : V) → X u → X v → ℝ≥0) (u v : V) (a : X u) (b : X v) : ℝ≥0 :=
  φ u v a b * φ v u b a

/-- 2.2 The (unnormalised) pairwise law `Π_v ψ v (x v) · Π_{G.Adj u v} φ u v (x u) (x v)`. -/
def pairwiseLaw (G : SimpleGraph V) [DecidableRel G.Adj] (ψ : ∀ v, X v → ℝ≥0)
    (φ : (u v : V) → X u → X v → ℝ≥0) (x : ∀ v, X v) : ℝ≥0 :=
  (∏ v, ψ v (x v)) * ∏ u, ∏ v ∈ G.neighborFinset u, φ u v (x u) (x v)

/-- 2.2 One parallel step of the sum-product (belief propagation) update with unnormalised
messages: `m' u v b = Σ_a ψ u a · edgePot φ u v a b · Π_{w ∼ u, w ≠ v} m w u a`. -/
def bpStep (G : SimpleGraph V) [DecidableRel G.Adj] (ψ : ∀ v, X v → ℝ≥0)
    (φ : (u v : V) → X u → X v → ℝ≥0) (m : (u v : V) → X v → ℝ≥0) :
    (u v : V) → X v → ℝ≥0 :=
  fun u v b => ∑ a, ψ u a * edgePot φ u v a b * ∏ w ∈ (G.neighborFinset u).erase v, m w u a

/-- 2.2 The belief at `v`: `ψ v a · Π_{u ∼ v} m u v a`. -/
def belief (G : SimpleGraph V) [DecidableRel G.Adj] (ψ : ∀ v, X v → ℝ≥0)
    (m : (u v : V) → X v → ℝ≥0) (v : V) (a : X v) : ℝ≥0 :=
  ψ v a * ∏ u ∈ G.neighborFinset v, m u v a

/-- 2.2 The belief on the edge `uv`:
`ψ u a · ψ v b · edgePot φ u v a b · Π_{w ∼ u, w ≠ v} m w u a · Π_{w ∼ v, w ≠ u} m w v b`. -/
def edgeBelief (G : SimpleGraph V) [DecidableRel G.Adj] (ψ : ∀ v, X v → ℝ≥0)
    (φ : (u v : V) → X u → X v → ℝ≥0) (m : (u v : V) → X v → ℝ≥0) (u v : V) (a : X u)
    (b : X v) : ℝ≥0 :=
  ψ u a * ψ v b * edgePot φ u v a b * (∏ w ∈ (G.neighborFinset u).erase v, m w u a) *
    ∏ w ∈ (G.neighborFinset v).erase u, m w v b

/-- 2.2 Belief propagation is exact on trees: on a tree of diameter `D`, from any initial
messages, after any `t ≥ D` parallel steps the vertex and edge beliefs are the margins of the
pairwise law, and the messages along edges no longer depend on `t` or on the initial messages. -/
theorem belief_bpStep_iterate_eq_margin {G : SimpleGraph V} [DecidableRel G.Adj]
    (hT : G.IsTree) (ψ : ∀ v, X v → ℝ≥0) (φ : (u v : V) → X u → X v → ℝ≥0)
    (m₀ : (u v : V) → X v → ℝ≥0) {t : ℕ} (ht : G.diam ≤ t) :
    (∀ v x, belief G ψ ((bpStep G ψ φ)^[t] m₀) v (x v) = margin (pairwiseLaw G ψ φ) {v} x) ∧
      (∀ u v, G.Adj u v → ∀ x, edgeBelief G ψ φ ((bpStep G ψ φ)^[t] m₀) u v (x u) (x v) =
        margin (pairwiseLaw G ψ φ) {u, v} x) ∧
      ∀ (m₁ : (u v : V) → X v → ℝ≥0) (s : ℕ), G.diam ≤ s → ∀ u v, G.Adj u v →
        (bpStep G ψ φ)^[s] m₁ u v = (bpStep G ψ φ)^[t] m₀ u v := by
  sorry

end Trees

/-! ## Layer 3: the Bethe free entropy -/

section Bethe

variable {V : Type*} [Fintype V] [DecidableEq V] {X : V → Type*} [∀ v, Fintype (X v)]
  [∀ v, DecidableEq (X v)]

/-- 3.1 Locally consistent pseudomarginals on `G` (the local polytope): every `τ v` is a
probability vector, and for adjacent `u, v` the table `σ u v` is nonnegative, `σ v u` is its
transpose, and its row sums are `τ u`. -/
def IsLocallyConsistent (G : SimpleGraph V) (τ : ∀ v, X v → ℝ)
    (σ : (u v : V) → X u → X v → ℝ) : Prop :=
  (∀ v, (∀ a, 0 ≤ τ v a) ∧ ∑ a, τ v a = 1) ∧
    ∀ u v, G.Adj u v → (∀ a b, 0 ≤ σ u v a b) ∧ (∀ a b, σ v u b a = σ u v a b) ∧
      ∀ a, ∑ b, σ u v a b = τ u a

/-- 3.1 On a tree every locally consistent family is the family of margins of a law
(`L(T) = M(T)`). -/
theorem exists_margin_eq_of_isLocallyConsistent {G : SimpleGraph V} (hT : G.IsTree)
    {τ : ∀ v, X v → ℝ} {σ : (u v : V) → X u → X v → ℝ} (hτ : IsLocallyConsistent G τ σ) :
    ∃ p : (∀ v, X v) → ℝ≥0, ∑ x, p x = 1 ∧ (∀ v x, (margin p {v} x : ℝ) = τ v (x v)) ∧
      ∀ u v, G.Adj u v → ∀ x, (margin p {u, v} x : ℝ) = σ u v (x u) (x v) := by
  sorry

/-- 3.2 The Bethe free entropy of a pairwise model at the pseudomarginals `(τ, σ)`:
`Σ_{uv ∈ E} [H(σ_uv) + Σ σ_uv log ψ_uv] − Σ_v [(deg v − 1) H(τ_v) − Σ τ_v log ψ_v]`, the edge
sum written as half the sum over ordered adjacent pairs. -/
def betheFreeEntropy (G : SimpleGraph V) [DecidableRel G.Adj] (ψ : ∀ v, X v → ℝ≥0)
    (φ : (u v : V) → X u → X v → ℝ≥0) (τ : ∀ v, X v → ℝ) (σ : (u v : V) → X u → X v → ℝ) : ℝ :=
  (1 / 2 : ℝ) * ∑ u, ∑ v ∈ G.neighborFinset u, ∑ a, ∑ b,
      (Real.negMulLog (σ u v a b) + σ u v a b * Real.log (edgePot φ u v a b)) +
    ∑ v, ∑ a, (-((G.degree v : ℝ) - 1) * Real.negMulLog (τ v a) + τ v a * Real.log (ψ v a))

/-- 3.2 The Bethe variational principle is exact on trees: for positive potentials the Bethe free
entropy on the local polytope is at most `log Z`, with equality exactly at the normalised true
vertex and edge marginals. -/
theorem betheFreeEntropy_le_log_and_eq_iff {G : SimpleGraph V} [DecidableRel G.Adj]
    (hT : G.IsTree) {ψ : ∀ v, X v → ℝ≥0} {φ : (u v : V) → X u → X v → ℝ≥0}
    (hψ : ∀ v a, 0 < ψ v a) (hφ : ∀ u v, G.Adj u v → ∀ a b, 0 < φ u v a b)
    {τ : ∀ v, X v → ℝ} {σ : (u v : V) → X u → X v → ℝ} (hτ : IsLocallyConsistent G τ σ) :
    betheFreeEntropy G ψ φ τ σ ≤ Real.log (∑ x, (pairwiseLaw G ψ φ x : ℝ)) ∧
      (betheFreeEntropy G ψ φ τ σ = Real.log (∑ x, (pairwiseLaw G ψ φ x : ℝ)) ↔
        (∀ v x, τ v (x v) = margin (pairwiseLaw G ψ φ) {v} x / ∑ y, (pairwiseLaw G ψ φ y : ℝ)) ∧
          ∀ u v, G.Adj u v → ∀ x, σ u v (x u) (x v) =
            margin (pairwiseLaw G ψ φ) {u, v} x / ∑ y, (pairwiseLaw G ψ φ y : ℝ)) := by
  sorry

/-- 3.3 A fixed point of belief propagation up to scaling: the messages along edges are positive,
and one step multiplies each of them by a positive constant. -/
def IsBPFixedPoint (G : SimpleGraph V) [DecidableRel G.Adj] (ψ : ∀ v, X v → ℝ≥0)
    (φ : (u v : V) → X u → X v → ℝ≥0) (m : (u v : V) → X v → ℝ≥0) : Prop :=
  ∀ u v, G.Adj u v → (∀ b, 0 < m u v b) ∧ ∃ c : ℝ≥0, 0 < c ∧ bpStep G ψ φ m u v = c • m u v

/-- 3.3 The normalised vertex beliefs `b_v(a) / Σ_c b_v(c)`. -/
def normBelief (G : SimpleGraph V) [DecidableRel G.Adj] (ψ : ∀ v, X v → ℝ≥0)
    (m : (u v : V) → X v → ℝ≥0) : ∀ v, X v → ℝ :=
  fun v a => belief G ψ m v a / ∑ c, (belief G ψ m v c : ℝ)

/-- 3.3 The normalised edge beliefs `b_uv(a, b) / Σ_{c, d} b_uv(c, d)`. -/
def normEdgeBelief (G : SimpleGraph V) [DecidableRel G.Adj] (ψ : ∀ v, X v → ℝ≥0)
    (φ : (u v : V) → X u → X v → ℝ≥0) (m : (u v : V) → X v → ℝ≥0) :
    (u v : V) → X u → X v → ℝ :=
  fun u v a b => edgeBelief G ψ φ m u v a b / ∑ c, ∑ d, (edgeBelief G ψ φ m u v c d : ℝ)

/-- 3.3 An interior stationary point of the Bethe free entropy on the local polytope: a locally
consistent family with positive entries (along edges) at which the derivative of the Bethe free
entropy vanishes in every direction `(δτ, δσ)` tangent to the affine hull of the local polytope
(the entries of `δτ v` sum to `0`; along edges `δσ v u` is the transpose of `δσ u v`, whose row
sums are `δτ u`). -/
def IsBetheStationary (G : SimpleGraph V) [DecidableRel G.Adj] (ψ : ∀ v, X v → ℝ≥0)
    (φ : (u v : V) → X u → X v → ℝ≥0) (τ : ∀ v, X v → ℝ) (σ : (u v : V) → X u → X v → ℝ) :
    Prop :=
  IsLocallyConsistent G τ σ ∧ (∀ v a, 0 < τ v a) ∧ (∀ u v, G.Adj u v → ∀ a b, 0 < σ u v a b) ∧
    ∀ (δτ : ∀ v, X v → ℝ) (δσ : (u v : V) → X u → X v → ℝ), (∀ v, ∑ a, δτ v a = 0) →
      (∀ u v, G.Adj u v → (∀ a b, δσ v u b a = δσ u v a b) ∧ ∀ a, ∑ b, δσ u v a b = δτ u a) →
        HasDerivAt (fun s : ℝ => betheFreeEntropy G ψ φ (τ + s • δτ) (σ + s • δσ)) 0 0

/-- 3.3 Belief propagation fixed points are the interior stationary points of the Bethe free
entropy, on every finite graph with nonempty state spaces and positive potentials: the
normalised beliefs of a fixed point are an interior stationary point, and every interior
stationary point is the family of normalised beliefs of a fixed point. -/
theorem isBetheStationary_iff_exists_isBPFixedPoint [∀ v, Nonempty (X v)] {G : SimpleGraph V}
    [DecidableRel G.Adj] {ψ : ∀ v, X v → ℝ≥0} {φ : (u v : V) → X u → X v → ℝ≥0}
    (hψ : ∀ v a, 0 < ψ v a) (hφ : ∀ u v, G.Adj u v → ∀ a b, 0 < φ u v a b) :
    (∀ m, IsBPFixedPoint G ψ φ m →
        IsBetheStationary G ψ φ (normBelief G ψ m) (normEdgeBelief G ψ φ m)) ∧
      ∀ τ σ, IsBetheStationary G ψ φ τ σ → ∃ m, IsBPFixedPoint G ψ φ m ∧
        normBelief G ψ m = τ ∧ ∀ u v, G.Adj u v → normEdgeBelief G ψ φ m u v = σ u v := by
  sorry

end Bethe

end TauCetiRoadmap.MeanFieldAndBeliefPropagation
