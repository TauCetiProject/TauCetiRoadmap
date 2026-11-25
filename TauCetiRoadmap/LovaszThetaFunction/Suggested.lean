import Mathlib

/-!
# The Lovász theta function: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Graphs are Mathlib's `SimpleGraph V` on a `Fintype`. The theta function `lovaszTheta G` is defined
by its semidefinite form, the supremum of `∑ᵢ ∑ⱼ B i j` over positive semidefinite real matrices
`B` of trace `1` that vanish on the edges of `G`; it is `0` on the empty vertex type, where no
such matrix exists. The orthonormal representation form and the eigenvalue form are stated as
`IsLeast` facts on a nonempty vertex type, so that each minimum is asserted to be attained. The
cost `1 / ⟨c, uᵢ⟩²` of an orthonormal representation is written without division, as
`1 ≤ t * ⟨c, uᵢ⟩²`, so that a vector orthogonal to the handle is never given the junk cost `0`.
The chromatic number of the complement enters through every `k` with `Gᶜ.Colorable k`, and the
Shannon capacity is the supremum over `k ≥ 1` of `α(G^⊠k)^(1/k)`. The adjacency eigenvalues of
4.3 are copied verbatim from SpectralGraphBounds 1.1.
-/

noncomputable section

open SimpleGraph Filter Topology

namespace TauCetiRoadmap.LovaszThetaFunction

section Copied

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 4.3 (copied verbatim from SpectralGraphBounds 1.1): the adjacency eigenvalues of `G`, with
multiplicity, in nonincreasing order: index `0` carries the largest one. -/
def adjEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_adjMatrix ℝ).eigenvalues₀

/-- 4.3 (copied verbatim from SpectralGraphBounds 1.1): the smallest adjacency eigenvalue `λₙ`
of a graph on a nonempty vertex type. -/
def smallestEigenvalue [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj] : ℝ :=
  adjEigenvalues G ⟨Fintype.card V - 1, Nat.sub_lt Fintype.card_pos Nat.one_pos⟩

end Copied

variable {V : Type*} [Fintype V]

/-! ## Layer 1: the theta function and its three forms -/

/-- 1.1 The Lovász theta function in its semidefinite form: the supremum of the sum of the
entries of `B` over positive semidefinite real matrices `B` with trace `1` and `B i j = 0`
whenever `i` and `j` are adjacent. -/
def lovaszTheta (G : SimpleGraph V) : ℝ :=
  sSup {s : ℝ | ∃ B : Matrix V V ℝ, B.PosSemidef ∧ B.trace = 1 ∧
    (∀ i j, G.Adj i j → B i j = 0) ∧ ∑ i, ∑ j, B i j = s}

/-- 1.1 On a nonempty vertex type the supremum defining `lovaszTheta G` is attained. -/
theorem isGreatest_lovaszTheta [Nonempty V] (G : SimpleGraph V) :
    IsGreatest {s : ℝ | ∃ B : Matrix V V ℝ, B.PosSemidef ∧ B.trace = 1 ∧
      (∀ i j, G.Adj i j → B i j = 0) ∧ ∑ i, ∑ j, B i j = s} (lovaszTheta G) := by
  sorry

/-- 1.2 The orthonormal representation form (Lovász): on a nonempty vertex type, `lovaszTheta G`
is the least `t` for which there are a dimension `N`, unit vectors `u i` in `ℝ^N` with
`⟨u i, u j⟩ = 0` for distinct nonadjacent `i`, `j`, and a unit vector `c` with
`1 ≤ t ⟨c, u i⟩²` for every `i`; the minimum is attained. -/
theorem isLeast_orthonormalRepresentation [Nonempty V] (G : SimpleGraph V) :
    IsLeast {t : ℝ | ∃ (N : ℕ) (u : V → EuclideanSpace ℝ (Fin N)) (c : EuclideanSpace ℝ (Fin N)),
      ‖c‖ = 1 ∧ (∀ i, ‖u i‖ = 1) ∧ (∀ i j, i ≠ j → ¬G.Adj i j → inner ℝ (u i) (u j) = 0) ∧
      ∀ i, 1 ≤ t * inner ℝ c (u i) ^ 2} (lovaszTheta G) := by
  sorry

/-- 1.3 The eigenvalue form: on a nonempty vertex type, `lovaszTheta G` is the least largest
eigenvalue of a real symmetric matrix `A` with `A i j = 1` whenever `i` and `j` are not adjacent
(in particular on the diagonal); the minimum is attained. -/
theorem isLeast_eigenvalue [Nonempty V] [DecidableEq V] (G : SimpleGraph V) :
    IsLeast {t : ℝ | ∃ (A : Matrix V V ℝ) (hA : A.IsHermitian),
      (∀ i j, ¬G.Adj i j → A i j = 1) ∧ hA.eigenvalues₀ ⟨0, Fintype.card_pos⟩ = t}
      (lovaszTheta G) := by
  sorry

/-! ## Layer 2: the sandwich theorem -/

/-- 2.1 The independence number is at most the theta function: `α(G) ≤ ϑ(G)`. -/
theorem indepNum_le_lovaszTheta (G : SimpleGraph V) : (G.indepNum : ℝ) ≤ lovaszTheta G := by
  sorry

/-- 2.1 The theta function is at most the chromatic number of the complement: if `Gᶜ` is
`k`-colourable, that is if the vertices of `G` are covered by `k` cliques, then `ϑ(G) ≤ k`. -/
theorem lovaszTheta_le_of_colorable_compl (G : SimpleGraph V) {k : ℕ} (hk : Gᶜ.Colorable k) :
    lovaszTheta G ≤ k := by
  sorry

/-- 2.2 For every graph on `n` vertices, `n ≤ ϑ(G) ϑ(Gᶜ)`. -/
theorem card_le_lovaszTheta_mul_compl (G : SimpleGraph V) :
    (Fintype.card V : ℝ) ≤ lovaszTheta G * lovaszTheta Gᶜ := by
  sorry

/-! ## Layer 3: the strong product and multiplicativity -/

/-- 3.1 The strong product of `G` and `H`: distinct pairs are adjacent when each coordinate is
equal or adjacent. -/
def strongProd {W : Type*} (G : SimpleGraph V) (H : SimpleGraph W) : SimpleGraph (V × W) where
  Adj x y := x ≠ y ∧ (x.1 = y.1 ∨ G.Adj x.1 y.1) ∧ (x.2 = y.2 ∨ H.Adj x.2 y.2)
  symm.symm _ _ h := ⟨h.1.symm, h.2.1.imp Eq.symm (fun h' => h'.symm),
    h.2.2.imp Eq.symm (fun h' => h'.symm)⟩
  loopless.irrefl _ h := h.1 rfl

/-- 3.1 The `k`-th strong power of `G`, on words `Fin k → V`: distinct words are adjacent when
in every coordinate the letters are equal or adjacent. -/
def strongPow (G : SimpleGraph V) (k : ℕ) : SimpleGraph (Fin k → V) where
  Adj x y := x ≠ y ∧ ∀ i, x i = y i ∨ G.Adj (x i) (y i)
  symm.symm _ _ h := ⟨h.1.symm, fun i => (h.2 i).imp Eq.symm (fun h' => h'.symm)⟩
  loopless.irrefl _ h := h.1 rfl

/-- 3.2 Lovász's multiplicativity: `ϑ(G ⊠ H) = ϑ(G) ϑ(H)`. -/
theorem lovaszTheta_strongProd {W : Type*} [Fintype W] (G : SimpleGraph V) (H : SimpleGraph W) :
    lovaszTheta (strongProd G H) = lovaszTheta G * lovaszTheta H := by
  sorry

/-- 3.2 The theta function of the `k`-th strong power is the `k`-th power: `ϑ(G^⊠k) = ϑ(G)^k`,
for every `k` including `0`. -/
theorem lovaszTheta_strongPow (G : SimpleGraph V) (k : ℕ) :
    lovaszTheta (strongPow G k) = lovaszTheta G ^ k := by
  sorry

/-! ## Layer 4: cycles, symmetric graphs and regular graphs -/

/-- 4.1 Odd cycles: for odd `n ≥ 3`, `ϑ(Cₙ) = n cos(π/n) / (1 + cos(π/n))`. -/
theorem lovaszTheta_cycleGraph {n : ℕ} (hn : Odd n) (h3 : 3 ≤ n) :
    lovaszTheta (cycleGraph n) =
      n * Real.cos (Real.pi / n) / (1 + Real.cos (Real.pi / n)) := by
  sorry

/-- 4.2 For a vertex-transitive graph on `n` vertices, `ϑ(G) ϑ(Gᶜ) = n`. -/
theorem lovaszTheta_mul_compl_of_forall_exists_iso (G : SimpleGraph V)
    (hG : ∀ u v : V, ∃ φ : G ≃g G, φ u = v) :
    lovaszTheta G * lovaszTheta Gᶜ = Fintype.card V := by
  sorry

/-- 4.3 The ratio bound for the theta function, multiplied out: for a `d`-regular graph on a
nonempty vertex type with smallest adjacency eigenvalue `λₙ`, `ϑ(G) (d - λₙ) ≤ n (-λₙ)`. -/
theorem lovaszTheta_mul_le [Nonempty V] [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]
    {d : ℕ} (hd : G.IsRegularOfDegree d) :
    lovaszTheta G * (d - smallestEigenvalue G) ≤ Fintype.card V * -smallestEigenvalue G := by
  sorry

/-! ## Layer 5: the Shannon capacity -/

/-- 5.1 The Shannon capacity: the supremum over `k ≥ 1` of `α(G^⊠k)^(1/k)`. -/
def shannonCapacity (G : SimpleGraph V) : ℝ :=
  ⨆ k : ℕ, ((strongPow G (k + 1)).indepNum : ℝ) ^ ((1 : ℝ) / (k + 1))

/-- 5.1 The Shannon capacity is a limit: `α(G^⊠k)^(1/k) → Θ(G)` as `k → ∞`. -/
theorem tendsto_shannonCapacity (G : SimpleGraph V) :
    Tendsto (fun k : ℕ => ((strongPow G k).indepNum : ℝ) ^ ((1 : ℝ) / k)) atTop
      (𝓝 (shannonCapacity G)) := by
  sorry

/-- 5.2 Lovász's bound: `α(G) ≤ Θ(G) ≤ ϑ(G)`. -/
theorem indepNum_le_shannonCapacity_le_lovaszTheta (G : SimpleGraph V) :
    (G.indepNum : ℝ) ≤ shannonCapacity G ∧ shannonCapacity G ≤ lovaszTheta G := by
  sorry

/-- 5.3 Lovász's theorem: the Shannon capacity of the pentagon is `√5`. -/
theorem shannonCapacity_cycleGraph_five : shannonCapacity (cycleGraph 5) = √5 := by
  sorry

end TauCetiRoadmap.LovaszThetaFunction
