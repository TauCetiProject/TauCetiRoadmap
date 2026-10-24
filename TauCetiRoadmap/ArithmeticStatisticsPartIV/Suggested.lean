import Mathlib

/-!
# Arithmetic statistics, Part IV: headline theorem statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; these are suggested Lean forms for its headline results.

The statements cover Cohen–Lenstra mass, surjection moments and all-prime moment
convergence (§§3.3–3.5), Haar cokernel moments and Friedman–Washington limits (§3.6),
finite-field matrix counts and the symmetric kernel limit (§§3.7–3.9), the FK good-plane
bijection (§3.10), and Wood's grid uniqueness and bounded moment limit (§3.11).
Mathlib's partitions, finite cyclic groups, submodules, exterior powers, categorical
skeleton and probability mass functions suffice for these statements. No headline result
requires an absent carrier. The number-field counting adapter, prime-power rank API,
border recurrences and analytic separators are infrastructure specified in the README.

Partition representatives are products of `ZMod` factors in decreasing order of exponent.
The exponent-bounded group carrier is a subtype of Mathlib's skeleton of integer modules;
its representative is the native module chosen by `fromSkeleton`. Wood's limit concerns
quotients by multiplication by `a`, with the stated exterior-square bound. Probability mass
functions describe the discrete laws of finitely generated abelian groups up to isomorphism.
-/

noncomputable section
open scoped BigOperators Topology ENNReal
open Filter MeasureTheory CategoryTheory

namespace TauCetiRoadmap.ArithmeticStatisticsPartIV

/-- The number of surjective additive homomorphisms, finite for finite source and target. -/
def surjCard (X A : Type*) [AddCommGroup X] [AddCommGroup A] : ℕ :=
  Nat.card {f : X →+ A // Function.Surjective f}

/-- Partition classes of finite abelian p-groups, including the empty partition. -/
abbrev FinAbPGroupClass := Σ n, Nat.Partition n

/-- The native finite cyclic factors of the partition representative. -/
abbrev FinAbPGroupClass.toGroup (p : ℕ) (A : FinAbPGroupClass) :=
  (i : Fin (A.2.parts.sort (· ≥ ·)).length) → ZMod (p ^ (A.2.parts.sort (· ≥ ·))[i])

/-- The convergent Euler product normalizing the Cohen–Lenstra law. -/
def cohenLenstraConstant (p u : ℕ) : ℝ :=
  ∏' j : ℕ, (1 - (p : ℝ)⁻¹ ^ (j + u + 1))

/-- Cohen–Lenstra weights on the native partition representatives. -/
def cohenLenstraWeight (p u : ℕ) (A : FinAbPGroupClass) : ℝ≥0∞ :=
  ENNReal.ofReal (cohenLenstraConstant p u /
    ((Nat.card (FinAbPGroupClass.toGroup p A) : ℝ) ^ u *
      Nat.card (FinAbPGroupClass.toGroup p A ≃+ FinAbPGroupClass.toGroup p A)))

/-- Nonnegative surjection moments on partition classes. -/
def surjectionMoment (p : ℕ) (ν : FinAbPGroupClass → ℝ≥0∞)
    (A : FinAbPGroupClass) : ℝ≥0∞ :=
  ∑' X, ν X * surjCard (FinAbPGroupClass.toGroup p X) (FinAbPGroupClass.toGroup p A)

/-- The Cohen–Lenstra mass formula (§3.3) constructs a probability law at every prime. -/
theorem cohenLenstra_mass {p : ℕ} (hp : p.Prime) (u : ℕ) :
    HasSum (cohenLenstraWeight p u) 1 := by sorry

/-- The Cohen–Lenstra law has the prescribed surjection moments (§3.4). -/
theorem cohenLenstra_moments {p : ℕ} (hp : p.Prime) (u : ℕ) (A : FinAbPGroupClass) :
    surjectionMoment p (cohenLenstraWeight p u) A =
      (Nat.card (FinAbPGroupClass.toGroup p A) : ℝ≥0∞)⁻¹ ^ u := by sorry

/-- Convergent Cohen–Lenstra moments determine the limiting masses for all p and u (§3.5). -/
theorem tendsto_of_cohenLenstra_moments {p : ℕ} (hp : p.Prime) (u : ℕ)
    (ν : ℕ → PMF FinAbPGroupClass)
    (hν : ∀ A, Tendsto (fun n => surjectionMoment p (ν n) A) atTop
      (𝓝 ((Nat.card (FinAbPGroupClass.toGroup p A) : ℝ≥0∞)⁻¹ ^ u))) :
    ∀ A, Tendsto (fun n => ν n A) atTop (𝓝 (cohenLenstraWeight p u A)) := by sorry

/-- The quotient module underlying the p-adic matrix cokernel of §3.6. -/
abbrev padicCokernel {p : ℕ} [Fact p.Prime] {n m : ℕ}
    (M : Matrix (Fin n) (Fin m) ℤ_[p]) :=
  (Fin n → ℤ_[p]) ⧸ LinearMap.range M.mulVecLin

/-- Additive matrix Haar measure with total mass one, as used in §3.6. -/
def padicMatrixHaar (p n m : ℕ) [Fact p.Prime]
    [MeasurableSpace ℤ_[p]] [BorelSpace ℤ_[p]] :
    MeasureTheory.Measure (Matrix (Fin n) (Fin m) ℤ_[p]) :=
  MeasureTheory.Measure.addHaarMeasure (G := Fin n → Fin m → ℤ_[p]) ⊤

/-- Haar matrix cokernel surjection moments (§3.6) are the free-source surjection count
divided by one target cardinality for each column. -/
theorem surjectionMoment_cokernelLaw {p : ℕ} [Fact p.Prime]
    [MeasurableSpace ℤ_[p]] [BorelSpace ℤ_[p]] (n u : ℕ)
    (A : Type*) [AddCommGroup A] [Finite A] (hA : IsPGroup p (Multiplicative A)) :
    (∫⁻ M : Matrix (Fin n) (Fin (n + u)) ℤ_[p],
      (surjCard (padicCokernel M) A : ℝ≥0∞) ∂(padicMatrixHaar p n (n + u))) =
      (surjCard (Fin n → ℤ_[p]) A : ℝ≥0∞) / (Nat.card A : ℝ≥0∞) ^ (n + u) := by sorry

/-- The Friedman–Washington cokernel law (§3.6) gives the Cohen–Lenstra mass for every
finite abelian p-group and every nonnegative column excess. -/
theorem tendsto_cokernelLaw {p : ℕ} [Fact p.Prime]
    [MeasurableSpace ℤ_[p]] [BorelSpace ℤ_[p]] (u : ℕ)
    (A : Type*) [AddCommGroup A] [Finite A] (hA : IsPGroup p (Multiplicative A)) :
    Tendsto (fun n : ℕ => padicMatrixHaar p n (n + u)
      {M | Nonempty (padicCokernel M ≃+ A)}) atTop
      (𝓝 (ENNReal.ofReal ((∏' j : ℕ, (1 - (p : ℝ)⁻¹ ^ (j + u + 1))) /
        ((Nat.card A : ℝ) ^ u * (Nat.card (A ≃+ A) : ℝ))))) := by sorry

/-- The Friedman–Washington translation form (§3.6) gives the square-matrix limit
for the cokernel of one minus a Haar-random endomorphism. -/
theorem tendsto_translation_cokernelLaw {p : ℕ} [Fact p.Prime]
    [MeasurableSpace ℤ_[p]] [BorelSpace ℤ_[p]]
    (A : Type*) [AddCommGroup A] [Finite A] (hA : IsPGroup p (Multiplicative A)) :
    Tendsto (fun n : ℕ => padicMatrixHaar p n n
      {F | Nonempty (padicCokernel (1 - F) ≃+ A)}) atTop
      (𝓝 (ENNReal.ofReal ((∏' j : ℕ, (1 - (p : ℝ)⁻¹ ^ (j + 1))) /
        (Nat.card (A ≃+ A) : ℝ)))) := by sorry

/-- The rational probability of a specified right-kernel dimension for a uniform matrix. -/
def matrixKernelLaw (F : Type*) [Field F] [Fintype F] (m n j : ℕ) : ℚ :=
  (Nat.card {M : Matrix (Fin m) (Fin n) F //
    Module.finrank F (LinearMap.ker M.mulVecLin) = j} : ℚ) /
    (Fintype.card F : ℚ) ^ (m * n)

/-- The exact rank distribution of arbitrary rectangular finite-field matrices (§3.7). -/
theorem matrix_rank_count (F : Type*) [Field F] [Fintype F] (m n r : ℕ)
    (hr : r ≤ min m n) :
    (Nat.card {M : Matrix (Fin m) (Fin n) F // M.rank = r} : ℚ) =
      ∏ i ∈ Finset.range r,
        (((Fintype.card F : ℚ) ^ m - (Fintype.card F : ℚ) ^ i) *
          ((Fintype.card F : ℚ) ^ n - (Fintype.card F : ℚ) ^ i) /
          ((Fintype.card F : ℚ) ^ r - (Fintype.card F : ℚ) ^ i)) := by sorry

/-- The finite binary kernel law satisfies the normalized Koymans–Pagano identity. -/
theorem koymansPaganoRankIdentity (m : ℕ) :
    (∑ j ∈ Finset.range (m + 1), matrixKernelLaw (ZMod 2) m m j /
      ((2 : ℚ) ^ m * (2 ^ (j + 1) - 1))) = 1 / ((2 : ℚ) ^ (m + 1) - 1) := by sorry

/-- The rational kernel law for uniform symmetric matrices, including their diagonal entries. -/
def symmetricKernelLaw (F : Type*) [Field F] [Fintype F] (r n : ℕ) : ℚ :=
  (Nat.card {M : Matrix (Fin r) (Fin r) F // M.IsSymm ∧
    Module.finrank F (LinearMap.ker M.mulVecLin) = n} : ℚ) /
    (Fintype.card F : ℚ) ^ (r * (r + 1) / 2)

/-- MacWilliams's product counts symmetric matrices of each rank in every characteristic. -/
theorem macwilliams_symmetric_rank_count (F : Type*) [Field F] [Fintype F]
    (s k : ℕ) (hk : k ≤ s) :
    (Nat.card {M : Matrix (Fin s) (Fin s) F // M.IsSymm ∧ M.rank = k} : ℚ) =
      (∏ i ∈ Finset.range (k / 2),
        (Fintype.card F : ℚ) ^ (2 * (i + 1)) /
          ((Fintype.card F : ℚ) ^ (2 * (i + 1)) - 1)) *
      ∏ i ∈ Finset.range k, ((Fintype.card F : ℚ) ^ (s - i) - 1) := by sorry

/-- Binary symmetric kernel masses converge to the odd Euler-product law. -/
theorem tendsto_symmetricKernelLaw (n : ℕ) :
    Tendsto (fun r : ℕ => (symmetricKernelLaw (ZMod 2) r n : ℝ)) atTop
      (𝓝 ((∏' j : ℕ, (1 - (2 : ℝ)⁻¹ ^ (2 * j + 1))) /
        ∏ i ∈ Finset.range n, ((2 : ℝ) ^ (i + 1) - 1))) := by sorry

/-- The binary symmetric kernel limit has an explicit error bound for every positive size. -/
theorem symmetricKernelLaw_error (n r : ℕ) (hr : 1 ≤ r) :
    |(symmetricKernelLaw (ZMod 2) r n : ℝ) -
      (∏' j : ℕ, (1 - (2 : ℝ)⁻¹ ^ (2 * j + 1))) /
        ∏ i ∈ Finset.range n, ((2 : ℝ) ^ (i + 1) - 1)| ≤
          (2 : ℝ) ^ ((n : ℤ) + 1 - (r : ℤ)) := by sorry

/-- The limiting binary symmetric kernel masses sum to one. -/
theorem hasSum_symmetricKernelLimit :
    HasSum (fun n : ℕ => (∏' j : ℕ, (1 - (2 : ℝ)⁻¹ ^ (2 * j + 1))) /
      ∏ i ∈ Finset.range n, ((2 : ℝ) ^ (i + 1) - 1)) 1 := by sorry

namespace FieldStatistics

/-- Binary coordinates for the Fouvry–Klüners finite quadratic calculation. -/
abbrev FKSpace (k : ℕ) := Fin k → ZMod 2 × ZMod 2

/-- Good planes are k-dimensional subspaces annihilated by the directed pairing. -/
def fkGoodPlanes (k : ℕ) : Set (Submodule (ZMod 2) (FKSpace k)) :=
  {U | Module.finrank (ZMod 2) U = k ∧
    ∀ u ∈ U, ∀ v ∈ U, (∑ j, (u j).1 * ((v j).1 + (v j).2)) = 0}

/-- The FK good k-planes are counted by all subspaces of F₂^k. -/
theorem fk_good_subspace_bijection (k : ℕ) :
    Nonempty ({U // U ∈ fkGoodPlanes k} ≃ Submodule (ZMod 2) (Fin k → ZMod 2)) := by sorry

/-- Each nonempty FK coordinate constraint gives the subspaces of one lower dimension (§3.10). -/
theorem fkGoodPlanes_linear_constraint {k : ℕ} (hk : 1 ≤ k)
    (Γ : Finset (Fin k)) (hΓ : Γ.Nonempty) :
    ({U : Submodule (ZMod 2) (FKSpace k) | U ∈ fkGoodPlanes k ∧
      ∀ u ∈ U, (∑ j ∈ Γ, ((u j).1 + (u j).2)) = 0} : Set _).ncard =
        Nat.card (Submodule (ZMod 2) (Fin (k - 1) → ZMod 2)) ∧
    ({U : Submodule (ZMod 2) (FKSpace k) | U ∈ fkGoodPlanes k ∧
      ∀ u ∈ U, (∑ j ∈ Γ, (u j).1) = 0} : Set _).ncard =
        Nat.card (Submodule (ZMod 2) (Fin (k - 1) → ZMod 2)) := by sorry

end FieldStatistics

namespace Distributions

/-- Finite exponential moments with Wood's quadratic growth bound determine every profile mass
for any finite set of distinct primes. -/
theorem wood_grid_uniqueness {s : ℕ} (p m : Fin s → ℕ)
    (hp : ∀ j, (p j).Prime) (hp_distinct : Function.Injective p) (hm : ∀ j, 1 ≤ m j) :
    let M := (j : Fin s) → {v : Fin (m j) → ℕ // Antitone v}
    ∀ (x y C : M → ℝ) (F : ℝ), 0 < F →
      (∀ μ, 0 ≤ x μ) → (∀ μ, 0 ≤ y μ) →
      (∀ lam, HasSum (fun μ : M => x μ *
        ∏ j, (p j : ℝ) ^ (∑ i, (lam j).val i * (μ j).val i)) (C lam)) →
      (∀ lam, HasSum (fun μ : M => y μ *
        ∏ j, (p j : ℝ) ^ (∑ i, (lam j).val i * (μ j).val i)) (C lam)) →
      (∀ lam, C lam ≤ ∏ j, F ^ m j *
        (p j : ℝ) ^ (∑ i, (lam j).val i * ((lam j).val i - 1) / 2)) →
      ∀ μ, x μ = y μ := by sorry

/-- Isomorphism classes of finite abelian groups killed by a. -/
abbrev BoundedAbGroupClass (a : ℕ) :=
  {G : Skeleton (ModuleCat.{0} ℤ) //
    Finite ((fromSkeleton (ModuleCat ℤ)).obj G) ∧
      ∀ x : (fromSkeleton (ModuleCat ℤ)).obj G, a • x = 0}

/-- Mathlib's chosen integer-module representative of an exponent-bounded class. -/
abbrev BoundedAbGroupClass.toGroup {a : ℕ} (G : BoundedAbGroupClass a) :=
  (fromSkeleton (ModuleCat ℤ)).obj G.val

/-- Wood's bounded moment limit (§3.11): quotient masses converge, preserve all moments,
and give the unique probability law with those moments. -/
theorem wood_bounded_moment_limit {a : ℕ} (ha : 1 ≤ a)
    {ι : ℕ → Type*} (ρ : (n : ℕ) → PMF (ι n))
    (X : (n : ℕ) → ι n → ModuleCat.{0} ℤ)
    (hfg : ∀ n ω, Module.Finite ℤ (X n ω))
    (M : BoundedAbGroupClass a → ℝ≥0∞)
    (hM : ∀ G, M G ≤ (Nat.card (ExteriorAlgebra.exteriorPower ℤ 2 G.toGroup) : ℝ≥0∞))
    (hmom : ∀ G, Tendsto (fun n => ∑' ω, ρ n ω *
      (surjCard (X n ω) G.toGroup : ℝ≥0∞)) atTop (𝓝 (M G))) :
    ∃ ν : PMF (BoundedAbGroupClass a),
      (∀ H, Tendsto (fun n => ∑' ω, ρ n ω *
        (Set.indicator {ω | Nonempty
          ((X n ω ⧸ LinearMap.range (a • (LinearMap.id : X n ω →ₗ[ℤ] X n ω))) ≃+
            H.toGroup)} (fun _ => (1 : ℝ≥0∞)) ω)) atTop (𝓝 (ν H))) ∧
      (∀ G, ∑' H, ν H * (surjCard H.toGroup G.toGroup : ℝ≥0∞) = M G) ∧
      (∀ ν' : PMF (BoundedAbGroupClass a),
        (∀ G, ∑' H, ν' H * (surjCard H.toGroup G.toGroup : ℝ≥0∞) = M G) → ν' = ν) := by
  sorry

end Distributions

end TauCetiRoadmap.ArithmeticStatisticsPartIV
