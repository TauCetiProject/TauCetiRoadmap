import Mathlib

/-!
# Spectral sparsification: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's routes and Checks are not restated.

Networks, their Laplacians and effective resistance are copied verbatim from the roadmap
ElectricalNetworksAndRandomWalks, Layers 1 and 2. Matrices are real and indexed by finite types,
and `A ≤ B` between square matrices is Mathlib's Loewner order (`open scoped MatrixOrder`): `B − A`
is positive semidefinite. A network `H` is an `ε`-approximation of a network `N` when
`(1 − ε) L_N ≤ L_H ≤ (1 + ε) L_N`. A reweighting of `N` multiplies the conductance of every
unordered pair by a nonnegative factor; its pairs with a nonzero factor are counted as a `Finset`
of `Sym2 V`. The random reweighting of Layer 2 is driven by independent `Bool`-valued random
variables on a probability space. The barrier potentials of Layer 3 are traces of inverses; they
are used only where the shifted matrix is positive definite.
-/

noncomputable section

open Matrix Finset MeasureTheory ProbabilityTheory
open scoped MatrixOrder NNReal

namespace TauCetiRoadmap.SpectralSparsification

/-! ## Layer 1: ε-approximation of networks -/

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) A network on `V`: a
symmetric nonnegative conductance function. Loops `cond x x` are allowed; a pair `x ≠ y` with
`cond x y = 0` is not an edge. -/
structure Network (V : Type*) where
  /-- The conductance `c(x, y)` between `x` and `y`. -/
  cond : V → V → ℝ
  /-- Conductances are symmetric. -/
  symm : ∀ x y, cond x y = cond y x
  /-- Conductances are nonnegative. -/
  nonneg : ∀ x y, 0 ≤ cond x y

namespace Network

variable {V : Type*} [Fintype V] (N : Network V)

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The weight
`c(x) = ∑ y, c(x, y)` of a vertex, a loop counted once. -/
def weight (x : V) : ℝ := ∑ y, N.cond x y

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 1.1) The graph of the network:
`x` and `y` are adjacent when `x ≠ y` and `0 < c(x, y)`. -/
def graph : SimpleGraph V := SimpleGraph.fromRel fun x y => 0 < N.cond x y

variable [DecidableEq V]

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The Laplacian
`diag(c(x)) − (c(x, y))`. Loops cancel on the diagonal. -/
def laplacian : Matrix V V ℝ := Matrix.diagonal N.weight - Matrix.of N.cond

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The Laplacian with the row
and column of `z` deleted. -/
def groundedLaplacian (z : V) : Matrix {x // x ≠ z} {x // x ≠ z} ℝ :=
  N.laplacian.submatrix Subtype.val Subtype.val

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The voltage of the unit
current from `a` to `z`, grounded at `z`: the column of `a` of the inverse of the grounded
Laplacian, extended by `0` at `z`; it is `0` when `a = z`. -/
def voltage (a z : V) (x : V) : ℝ :=
  if ha : a = z then 0 else if hx : x = z then 0 else (N.groundedLaplacian z)⁻¹ ⟨x, hx⟩ ⟨a, ha⟩

/-- 1.1 (copied verbatim from ElectricalNetworksAndRandomWalks 2.1) The effective resistance
`R(a ↔ z)`: the voltage at `a` of the unit current from `a` to `z`. -/
def effResistance (a z : V) : ℝ := N.voltage a z a

end Network

section Approximation

variable {V : Type*}

/-- 1.1 The reweighting of `N` by factors `s : Sym2 V → ℝ≥0`: the conductance of `x` and `y`
becomes `s(xy) · c(x, y)`. -/
def Network.reweight (N : Network V) (s : Sym2 V → ℝ≥0) : Network V where
  cond x y := s s(x, y) * N.cond x y
  symm x y := by rw [Sym2.eq_swap, N.symm]
  nonneg x y := mul_nonneg (s s(x, y)).2 (N.nonneg x y)

variable [Fintype V] [DecidableEq V]

/-- 1.1 `H` is an `ε`-approximation of `N`: `(1 − ε) L_N ≤ L_H ≤ (1 + ε) L_N` in the Loewner
order. -/
def IsApprox (ε : ℝ) (N H : Network V) : Prop :=
  (1 - ε) • N.laplacian ≤ H.laplacian ∧ H.laplacian ≤ (1 + ε) • N.laplacian

/-- 1.2 **Cuts.** If `H` is an `ε`-approximation of `N`, every cut of `H` weighs between
`1 − ε` and `1 + ε` times the same cut of `N`; the weight of the cut between `S` and its
complement is `∑_{x ∈ S} ∑_{y ∉ S} c(x, y)`. -/
theorem cutWeight_le_of_isApprox {N H : Network V} {ε : ℝ} (h : IsApprox ε N H)
    (S : Finset V) :
    (1 - ε) * ∑ x ∈ S, ∑ y ∈ Sᶜ, N.cond x y ≤ ∑ x ∈ S, ∑ y ∈ Sᶜ, H.cond x y ∧
      ∑ x ∈ S, ∑ y ∈ Sᶜ, H.cond x y ≤ (1 + ε) * ∑ x ∈ S, ∑ y ∈ Sᶜ, N.cond x y := by
  sorry

/-- 1.3 **Effective resistances.** If `N` is connected, `ε < 1` and `H` is an
`ε`-approximation of `N`, then `R_N(a ↔ z) / (1 + ε) ≤ R_H(a ↔ z) ≤ R_N(a ↔ z) / (1 − ε)` for all
vertices `a`, `z`. The route compares Dirichlet energies and inverts, using
`effResistance_pos`, the positivity theorem of ElectricalNetworksAndRandomWalks 2.5. -/
theorem effResistance_le_of_isApprox {N H : Network V} (hN : N.graph.Connected) {ε : ℝ}
    (hε : ε < 1) (h : IsApprox ε N H) (a z : V) :
    N.effResistance a z / (1 + ε) ≤ H.effResistance a z ∧
      H.effResistance a z ≤ N.effResistance a z / (1 - ε) := by
  sorry

end Approximation

/-! ## Layer 2: sampling by effective resistances -/

section Sampling

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 2.1 **Effective resistance through any grounding.** On a connected network, for every vertex
`z`, the quadratic form of the inverse of the Laplacian grounded at `z`, evaluated at `δ_x − δ_y`
with the coordinate `z` deleted, is `R(x ↔ y)`. The route identifies the left side through
`effResistance_eq_div` of ElectricalNetworksAndRandomWalks 2.1. -/
theorem dotProduct_inv_groundedLaplacian_mulVec (N : Network V) (hN : N.graph.Connected)
    (z x y : V) :
    (fun w : {w // w ≠ z} => (Pi.single x 1 - Pi.single y 1 : V → ℝ) w) ⬝ᵥ
        ((N.groundedLaplacian z)⁻¹ *ᵥ
          fun w : {w // w ≠ z} => (Pi.single x 1 - Pi.single y 1 : V → ℝ) w) =
      N.effResistance x y := by
  sorry

/-- 2.2 **Sampling by effective resistances (Spielman–Srivastava).** Let `N` be a connected
network on `n` vertices, `ρ > 0` and `ε > 0`. Keep each unordered pair `e` independently with
probability `p(e) = min(1, c(e) R(e) / ρ)` and give a kept pair the factor `1 / p(e)`. The
reweighted network fails to be an `ε`-approximation of `N` with probability at most
`2 (n − 1) exp(−(ε² / 2) / (ρ + ρ ε / 3))`, and the expected number of kept pairs is at most
`(n − 1) / ρ`. -/
theorem measureReal_not_isApprox_le {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω)
    [IsProbabilityMeasure P] (N : Network V) (hN : N.graph.Connected) {ρ ε : ℝ} (hρ : 0 < ρ)
    (hε : 0 < ε) (p : Sym2 V → ℝ≥0)
    (hp : ∀ x y, (p s(x, y) : ℝ) = min 1 (N.cond x y * N.effResistance x y / ρ))
    (ξ : Sym2 V → Ω → Bool) (hξ : ∀ e, Measurable (ξ e)) (hind : iIndepFun ξ P)
    (hlaw : ∀ e, P.real {ω | ξ e ω = true} = p e) :
    P.real {ω | ¬IsApprox ε N (N.reweight fun e => if ξ e ω then (p e)⁻¹ else 0)} ≤
        2 * ((Fintype.card V : ℝ) - 1) * Real.exp (-(ε ^ 2 / 2) / (ρ + ρ * ε / 3)) ∧
      ∫ ω, (#{e | ξ e ω = true} : ℝ) ∂P ≤ ((Fintype.card V : ℝ) - 1) / ρ := by
  sorry

end Sampling

/-! ## Layer 3: barrier potentials and linear-size sparsifiers -/

section Barrier

variable {n m : Type*} [Fintype n] [DecidableEq n]

/-- 3.1 The upper barrier potential `Φ^u(A) = tr (u I − A)⁻¹`. -/
def upperPotential (u : ℝ) (A : Matrix n n ℝ) : ℝ := ((u • 1 - A)⁻¹).trace

/-- 3.1 The lower barrier potential `Φ_l(A) = tr (A − l I)⁻¹`. -/
def lowerPotential (l : ℝ) (A : Matrix n n ℝ) : ℝ := ((A - l • 1)⁻¹).trace

/-- 3.2 The amount `U_A(v)` of `v vᵀ` the upper barrier can absorb when it moves from `u` to
`u + δ`: `vᵀ M² v / (Φ^u(A) − Φ^{u+δ}(A)) + vᵀ M v` with `M = ((u + δ) I − A)⁻¹`. -/
def upperBarrierCost (u δ : ℝ) (A : Matrix n n ℝ) (v : n → ℝ) : ℝ :=
  v ⬝ᵥ (((u + δ) • 1 - A)⁻¹ ^ 2 *ᵥ v) / (upperPotential u A - upperPotential (u + δ) A) +
    v ⬝ᵥ (((u + δ) • 1 - A)⁻¹ *ᵥ v)

/-- 3.3 The amount `L_A(v)` the lower barrier needs when it moves from `l` to `l + δ`:
`vᵀ M² v / (Φ_{l+δ}(A) − Φ_l(A)) − vᵀ M v` with `M = (A − (l + δ) I)⁻¹`. -/
def lowerBarrierCost (l δ : ℝ) (A : Matrix n n ℝ) (v : n → ℝ) : ℝ :=
  v ⬝ᵥ ((A - (l + δ) • 1)⁻¹ ^ 2 *ᵥ v) / (lowerPotential (l + δ) A - lowerPotential l A) -
    v ⬝ᵥ ((A - (l + δ) • 1)⁻¹ *ᵥ v)

/-- 3.2 **Upper barrier shift.** If `u I − A` is positive definite and `δ > 0`, then for every
real `t` with `t U_A(v) ≤ 1` the matrix `(u + δ) I − (A + t v vᵀ)` is positive definite and
`Φ^{u+δ}(A + t v vᵀ) ≤ Φ^u(A)`. -/
theorem upperPotential_add_le {A : Matrix n n ℝ} {u δ : ℝ} (hu : (u • 1 - A).PosDef)
    (hδ : 0 < δ) (v : n → ℝ) {t : ℝ} (ht : t * upperBarrierCost u δ A v ≤ 1) :
    ((u + δ) • 1 - (A + t • vecMulVec v v)).PosDef ∧
      upperPotential (u + δ) (A + t • vecMulVec v v) ≤ upperPotential u A := by
  sorry

/-- 3.3 **Lower barrier shift.** If `A − l I` is positive definite and `Φ_l(A) ≤ 1 / δ`, then for
every `t ≥ 0` with `1 ≤ t L_A(v)` the matrix `A + t v vᵀ − (l + δ) I` is positive definite and
`Φ_{l+δ}(A + t v vᵀ) ≤ Φ_l(A)`. -/
theorem lowerPotential_add_le {A : Matrix n n ℝ} {l δ : ℝ} (hl : (A - l • 1).PosDef)
    (hΦ : lowerPotential l A ≤ 1 / δ) (v : n → ℝ) {t : ℝ} (ht : 0 ≤ t)
    (htL : 1 ≤ t * lowerBarrierCost l δ A v) :
    (A + t • vecMulVec v v - (l + δ) • 1).PosDef ∧
      lowerPotential (l + δ) (A + t • vecMulVec v v) ≤ lowerPotential l A := by
  sorry

/-- 3.4 **Both barriers.** Let `v : m → n → ℝ` be in isotropic position, `∑ᵢ vᵢ vᵢᵀ = I`, with
`m` nonempty. If `l I < A < u I` strictly, `Φ^u(A) ≤ εU`, `Φ_l(A) ≤ εL`, `δU > 0` and
`1 / δU + εU ≤ 1 / δL − εL`, then some `vᵢ` and some `t > 0` move both barriers, by `δU` and `δL`,
without raising either potential. -/
theorem exists_barrier_step [Fintype m] [Nonempty m] {v : m → n → ℝ}
    (hv : ∑ i, vecMulVec (v i) (v i) = 1) {A : Matrix n n ℝ} {u l δU δL εU εL : ℝ}
    (hu : (u • 1 - A).PosDef) (hl : (A - l • 1).PosDef) (hΦu : upperPotential u A ≤ εU)
    (hΦl : lowerPotential l A ≤ εL) (hδU : 0 < δU) (h : 1 / δU + εU ≤ 1 / δL - εL) :
    ∃ i, ∃ t : ℝ, 0 < t ∧ ((u + δU) • 1 - (A + t • vecMulVec (v i) (v i))).PosDef ∧
      (A + t • vecMulVec (v i) (v i) - (l + δL) • 1).PosDef ∧
      upperPotential (u + δU) (A + t • vecMulVec (v i) (v i)) ≤ upperPotential u A ∧
      lowerPotential (l + δL) (A + t • vecMulVec (v i) (v i)) ≤ lowerPotential l A := by
  sorry

/-- 3.5 **Batson–Spielman–Srivastava for vectors.** If `v : m → n → ℝ` is in isotropic position
and `d > 1`, there are weights `sᵢ ≥ 0`, at most `⌈d n⌉` of them nonzero, with
`I ≤ ∑ᵢ sᵢ vᵢ vᵢᵀ ≤ ((d + 1 + 2√d) / (d + 1 − 2√d)) I`. -/
theorem exists_sparse_weights_isotropic [Fintype m] {v : m → n → ℝ}
    (hv : ∑ i, vecMulVec (v i) (v i) = 1) {d : ℝ} (hd : 1 < d) :
    ∃ s : m → ℝ, (∀ i, 0 ≤ s i) ∧ #{i | s i ≠ 0} ≤ ⌈d * Fintype.card n⌉₊ ∧
      1 ≤ ∑ i, s i • vecMulVec (v i) (v i) ∧
      ∑ i, s i • vecMulVec (v i) (v i) ≤
        ((d + 1 + 2 * Real.sqrt d) / (d + 1 - 2 * Real.sqrt d)) • 1 := by
  sorry

end Barrier

section Graphs

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 3.6 **Twice-Ramanujan sparsifiers (Batson–Spielman–Srivastava).** For every network `N` on
`n` vertices and every `d > 1` there is a reweighting `H` of `N` with at most `⌈d (n − 1)⌉`
nonzero factors and `L_N ≤ L_H ≤ ((d + 1 + 2√d) / (d + 1 − 2√d)) L_N`. -/
theorem exists_sparse_reweight (N : Network V) {d : ℝ} (hd : 1 < d) :
    ∃ s : Sym2 V → ℝ≥0, #{e | s e ≠ 0} ≤ ⌈d * ((Fintype.card V : ℝ) - 1)⌉₊ ∧
      N.laplacian ≤ (N.reweight s).laplacian ∧
      (N.reweight s).laplacian ≤
        ((d + 1 + 2 * Real.sqrt d) / (d + 1 - 2 * Real.sqrt d)) • N.laplacian := by
  sorry

end Graphs

end TauCetiRoadmap.SpectralSparsification
