import Mathlib
import TauCeti.Combinatorics.Young.Diagram
import TauCeti.RepresentationTheory.CharacterTable.Table
import TauCeti.RepresentationTheory.Symmetric.Specht.Character

/-!
# Random walks on finite groups: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

`tvToStationary`, `mixingTime` and `hypercubeWalk` are verbatim copies of the definitions of
MarkovChainMixing 1.2, 1.3 and 5.3, carried here because a roadmap's file cannot import another
roadmap's module.

Suppliers used by the statements: Mathlib `MeasureTheory.tvDist`, `Measure.mconv`,
`Measure.uniformOfFinset`, `Kernel.ofFunOfCountable`, `Subgroup.closure`, `Subgroup.Normal`,
`YoungDiagram.ofPartition` and `Equiv.swap`; Tau Ceti `TauCeti.irreducibleCharacter`,
`TauCeti.characterDegree`, `TauCeti.spechtChar` and `YoungDiagram.cellContent`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Finset
open scoped Pointwise

namespace TauCetiRoadmap.RandomWalksOnFiniteGroups

/-! ## Layer 1: random walks and convergence to the uniform law -/

section Copied

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-- 1.1 (copied verbatim from MarkovChainMixing 1.2): the distance to stationarity
`d(t) = max_x ‖κ^t(x, ·) − π‖_TV`. -/
def tvToStationary [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (t : ℕ) : ℝ :=
  univ.sup' univ_nonempty fun x ↦ tvDist ((κ ^ t) x) π / 2

/-- 1.1 (copied verbatim from MarkovChainMixing 1.3): the mixing time `t_mix(ε)`, the least `t`
with `d(t) ≤ ε`, and `⊤` if there is none. -/
def mixingTime [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (ε : ℝ) : ℕ∞ :=
  ⨅ (t : ℕ) (_ : tvToStationary κ π t ≤ ε), (t : ℕ∞)

end Copied

section Group

variable {G : Type*} [Group G] [Fintype G] [MeasurableSpace G] [MeasurableSingletonClass G]

/-- 1.1: the convolution powers `μ^{*t}`: `μ^{*0} = δ₁` and `μ^{*(t+1)} = μ^{*t} ∗ μ`, the
multiplicative counterpart of Tau Ceti's `MeasureTheory.Measure.convolutionPower`, which is defined
on additive monoids. -/
def convPow (μ : Measure G) : ℕ → Measure G
  | 0 => Measure.dirac 1
  | t + 1 => convPow μ t ∗ₘ μ

/-- 1.1: the random walk driven by `μ`: from `x` it moves to `x * ξ` with `ξ` of law `μ`. -/
def randomWalk (μ : Measure G) : Kernel G G :=
  Kernel.ofFunOfCountable fun x ↦ μ.map (x * ·)

/-- 1.2: the convolution powers of a probability measure converge to the uniform law in total
variation exactly when its support generates the group and lies in no coset of a proper normal
subgroup. -/
theorem tendsto_tvDist_convPow_iff (μ : Measure G) [IsProbabilityMeasure μ] :
    Tendsto (fun t ↦ tvDist (convPow μ t) (Measure.uniformOfFinset univ) / 2) atTop (𝓝 0) ↔
      Subgroup.closure {g | μ {g} ≠ 0} = ⊤ ∧
        ∀ N : Subgroup G, N.Normal → N ≠ ⊤ → ∀ g : G, ¬ {x | μ {x} ≠ 0} ⊆ g • (N : Set G) :=
  sorry

/-! ## Layer 2: the upper bound lemma -/

open scoped Classical in
/-- 2.1: the Plancherel sum `Σ_{χ ≠ 1} χ(1) Σ_{h,k} ν(h) ν(k) χ(h k⁻¹)` over the nontrivial
irreducible complex characters; the term of `χ` is `χ(1) tr(ν̂(ρ) ν̂(ρ)*)` for a unitary
representation `ρ` affording `χ`. -/
def plancherelSum (ν : Measure G) : ℂ :=
  ∑ i with TauCeti.irreducibleCharacter ℂ i ≠ 1,
    TauCeti.irreducibleCharacter ℂ i 1 *
      ∑ h, ∑ k, ((ν.real {h} * ν.real {k} : ℝ) : ℂ) * TauCeti.irreducibleCharacter ℂ i (h * k⁻¹)

/-- 2.1: Plancherel's identity `|G| Σ_g (ν(g) − 1/|G|)² = plancherelSum ν` and the upper bound
lemma `4 ‖ν − U‖² ≤ Re (plancherelSum ν)`, for every probability measure `ν`. -/
theorem upper_bound_lemma (ν : Measure G) [IsProbabilityMeasure ν] :
    (((Fintype.card G : ℝ) * ∑ g, (ν.real {g} - (Fintype.card G : ℝ)⁻¹) ^ 2 : ℝ) : ℂ) =
        plancherelSum ν ∧
      4 * (tvDist ν (Measure.uniformOfFinset univ) / 2) ^ 2 ≤ (plancherelSum ν).re :=
  sorry

open scoped Classical in
/-- 2.2: for a probability measure constant on conjugacy classes,
`|G| Σ_g (μ^{*t}(g) − 1/|G|)² = Σ_{χ ≠ 1} χ(1)² |Σ_g μ(g) χ(g) / χ(1)|^{2t}`, and
`4 ‖μ^{*t} − U‖²` is at most this sum. -/
theorem card_mul_sum_sq_convPow_eq (μ : Measure G) [IsProbabilityMeasure μ]
    (hμ : ∀ g h : G, μ {h * g * h⁻¹} = μ {g}) (t : ℕ) :
    (Fintype.card G : ℝ) * ∑ g, ((convPow μ t).real {g} - (Fintype.card G : ℝ)⁻¹) ^ 2 =
        ∑ i with TauCeti.irreducibleCharacter ℂ i ≠ 1,
          (TauCeti.characterDegree ℂ i : ℝ) ^ 2 *
            ‖(∑ g, (μ.real {g} : ℂ) * TauCeti.irreducibleCharacter ℂ i g) /
              TauCeti.characterDegree ℂ i‖ ^ (2 * t) ∧
      4 * (tvDist (convPow μ t) (Measure.uniformOfFinset univ) / 2) ^ 2 ≤
        ∑ i with TauCeti.irreducibleCharacter ℂ i ≠ 1,
          (TauCeti.characterDegree ℂ i : ℝ) ^ 2 *
            ‖(∑ g, (μ.real {g} : ℂ) * TauCeti.irreducibleCharacter ℂ i g) /
              TauCeti.characterDegree ℂ i‖ ^ (2 * t) :=
  sorry

end Group

/-! ## Layer 3: the lazy random walk on the hypercube -/

/-- 3.1 (copied verbatim from MarkovChainMixing 5.3): the lazy walk on the hypercube: a uniform
coordinate is replaced by a uniform bit. -/
def hypercubeWalk (n : ℕ) : Kernel (Fin n → Bool) (Fin n → Bool) :=
  Kernel.ofFunOfCountable fun x ↦
    (Measure.uniformOfFinset (univ : Finset (Fin n × Bool))).map fun jb ↦
      Function.update x jb.1 jb.2

/-- 3.2: for `n ≥ 1` and `t ≥ (1/2) n log n + c n`, `4 d(t)² ≤ exp(e^{−2c}) − 1`. -/
theorem four_mul_sq_tvToStationary_hypercubeWalk_le (n : ℕ) (hn : 1 ≤ n) (c : ℝ) (t : ℕ)
    (ht : n / 2 * Real.log n + c * n ≤ t) :
    4 * tvToStationary (hypercubeWalk n) (Measure.uniformOfFinset univ) t ^ 2 ≤
      Real.exp (Real.exp (-2 * c)) - 1 :=
  sorry

/-- 3.3: for `n ≥ 1` and `t ≤ (1/2) n log n − α n`, `d(t) ≥ 1 − 8 e^{2 − 2α}`. -/
theorem le_tvToStationary_hypercubeWalk (n : ℕ) (hn : 1 ≤ n) (α : ℝ) (t : ℕ)
    (ht : (t : ℝ) ≤ n / 2 * Real.log n - α * n) :
    1 - 8 * Real.exp (2 - 2 * α) ≤
      tvToStationary (hypercubeWalk n) (Measure.uniformOfFinset univ) t :=
  sorry

/-- 3.4: cutoff with a window of order `n`: for `0 < ε < 1` there is `C` with
`(1/2) n log n − C n ≤ t_mix(ε) ≤ (1/2) n log n + C n` for every `n`. -/
theorem mixingTime_hypercubeWalk_window {ε : ℝ} (hε₀ : 0 < ε) (hε₁ : ε < 1) :
    ∃ C : ℝ, ∀ n : ℕ,
      ((⌈n / 2 * Real.log n - C * n⌉₊ : ℕ) : ℕ∞) ≤
          mixingTime (hypercubeWalk n) (Measure.uniformOfFinset univ) ε ∧
        mixingTime (hypercubeWalk n) (Measure.uniformOfFinset univ) ε ≤
          ((⌈n / 2 * Real.log n + C * n⌉₊ : ℕ) : ℕ∞) :=
  sorry

/-! ## Layer 4: random transpositions -/

/-- 4.1: Frobenius's formula: for a transposition `(i j)` of `Fin n`,
`n (n − 1) χ^λ((i j)) = 2 (Σ_{cells (r, c) of λ} (c − r)) χ^λ(1)`, the content
`YoungDiagram.cellContent (r, c)` of the cell in row `r` and column `c` being `c − r`. -/
theorem mul_spechtChar_swap {n : ℕ} (lam : n.Partition) {i j : Fin n} (hij : i ≠ j) :
    ((n : ℤ) * (n - 1)) * TauCeti.spechtChar lam (Equiv.swap i j) =
      2 * (∑ p ∈ (YoungDiagram.ofPartition lam).cells, YoungDiagram.cellContent p) *
        TauCeti.spechtChar lam 1 :=
  sorry

/-- 4.2 (and Conventions): every set of permutations of `Fin n` is measurable. -/
instance instMeasurableSpacePermFin (n : ℕ) : MeasurableSpace (Equiv.Perm (Fin n)) := ⊤

/-- 4.2 (and Conventions): singletons of permutations of `Fin n` are measurable. -/
instance instMeasurableSingletonClassPermFin (n : ℕ) :
    MeasurableSingletonClass (Equiv.Perm (Fin n)) :=
  ⟨fun _ ↦ MeasurableSpace.measurableSet_top⟩

/-- 4.2: the random transposition measure: the law of `(i j)` for `i`, `j` independent and
uniform, so that the identity has mass `1/n` and each transposition `2/n²`. -/
def randomTransposition (n : ℕ) : Measure (Equiv.Perm (Fin n)) :=
  (Measure.uniformOfFinset (univ : Finset (Fin n × Fin n))).map fun p ↦ Equiv.swap p.1 p.2

/-- 4.2: the Diaconis–Shahshahani bound: there is a constant `A` such that, whenever `c > 0` and
`k = (n/2)(log n + c)`, both `2 ‖μ^{*k} − U‖` and the `ℓ²` distance
`(n! Σ_σ (μ^{*k}(σ) − 1/n!)²)^{1/2}` are at most `A e^{−c}`. -/
theorem exists_tvDist_convPow_randomTransposition_le :
    ∃ A : ℝ, ∀ (n : ℕ) (c : ℝ) (k : ℕ), 0 < c → (k : ℝ) = n / 2 * (Real.log n + c) →
      2 * (tvDist (convPow (randomTransposition n) k) (Measure.uniformOfFinset univ) / 2) ≤
          A * Real.exp (-c) ∧
        (n.factorial : ℝ) * ∑ σ, ((convPow (randomTransposition n) k).real {σ} -
          (n.factorial : ℝ)⁻¹) ^ 2 ≤ (A * Real.exp (-c)) ^ 2 :=
  sorry

/-- 4.3: for `ε < 1`, `t_mix(ε) ≥ ((n − 1)/2) log ((1 − ε) n / 6)`. -/
theorem ceil_le_mixingTime_randomTransposition (n : ℕ) {ε : ℝ} (hε : ε < 1) :
    ((⌈((n : ℝ) - 1) / 2 * Real.log ((1 - ε) * n / 6)⌉₊ : ℕ) : ℕ∞) ≤
      mixingTime (randomWalk (randomTransposition n)) (Measure.uniformOfFinset univ) ε :=
  sorry

/-- 4.4: cutoff with a window of order `n`: for `0 < ε < 1` there is `C` with
`(1/2) n log n − C n ≤ t_mix(ε) ≤ (1/2) n log n + C n` for every `n`. -/
theorem mixingTime_randomTransposition_window {ε : ℝ} (hε₀ : 0 < ε) (hε₁ : ε < 1) :
    ∃ C : ℝ, ∀ n : ℕ,
      ((⌈n / 2 * Real.log n - C * n⌉₊ : ℕ) : ℕ∞) ≤
          mixingTime (randomWalk (randomTransposition n)) (Measure.uniformOfFinset univ) ε ∧
        mixingTime (randomWalk (randomTransposition n)) (Measure.uniformOfFinset univ) ε ≤
          ((⌈n / 2 * Real.log n + C * n⌉₊ : ℕ) : ℕ∞) :=
  sorry

end TauCetiRoadmap.RandomWalksOnFiniteGroups
