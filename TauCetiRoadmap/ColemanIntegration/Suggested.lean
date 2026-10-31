import Mathlib

/-!
# Coleman integration: headline target statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements give Lean forms for headline results; discharging them
finishes neither a layer nor the roadmap. The theorem proofs are left as `sorry`.

Layer L0 is represented by the unique primitive on a whole open disc (L0.8), the
annulus residue obstruction (L0.12), logarithm transcendence (L0.21), and unique
logarithmic primitives modulo constants (L0.22). Annulus statements use convergent
coefficient families `ℤ → K`; polynomials in a formal logarithm use Mathlib's
`Polynomial`. Logarithm transcendence is stated for a function on `PadicComplex`
satisfying the explicit homomorphism, principal-unit series and branch normalization
laws. Layer L3's complex Dirichlet L-value formula (L3.13, including weight one in
L3.31) uses a closed-disc polylogarithm defined by its series and principal logarithm.

The geometric Coleman theorems of L1, including continuation, uniqueness, integration,
lift independence and pullback, are deferred as signatures: the pins have no wide-open
dagger algebras, local logarithmic function rings or Coleman function algebra. The
continued p-adic polylogarithm family is also absent, so L2's global functional equations
and scalar/projective five-term relation (L2.69–L2.70), and Coleman's p-adic L-value
formula (L3.28–L3.30), cannot be stated for their actual objects. The Kubota–Leopoldt
function and its Teichmüller twist are missing as well. The cyclotomic regulator formula
(L3.15), cyclotomic basis theorem (L3.Fa.5), regulator comparisons and Dirichlet-motive
Beilinson theorem (L3.36–L3.37) require scheme K-groups with Adams weights, cyclotomic
classes, modified syntomic cohomology and regulator maps, none of which exist at the pins.
-/

open Filter Topology

noncomputable section

namespace TauCetiRoadmap.ColemanIntegration

/-- The logarithm laws used in L0.21: `L` is multiplicative on `ℂ_p^×`, is the logarithm
series on `1 + 𝔪`, and sends `p` to `a`. -/
structure IsLogBranch (p : ℕ) [Fact p.Prime] (a : ℂ_[p]) (L : ℂ_[p] → ℂ_[p]) : Prop where
  map_mul : ∀ x y : ℂ_[p], x ≠ 0 → y ≠ 0 → L (x * y) = L x + L y
  map_p : L (p : ℂ_[p]) = a
  hasSum_one_add : ∀ x : ℂ_[p], ‖x‖ < 1 →
    HasSum (fun n : ℕ => (-1 : ℂ_[p]) ^ n * x ^ (n + 1) / (n + 1)) (L (1 + x))

section AnalyticPrimitives

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [CharZero K]

/-- L0.8: on an open disc a whole-disc analytic function has a unique whole-disc analytic
primitive with a chosen value at a base point. -/
theorem existsUnique_primitive_disc {a : K} {r : ENNReal} {f : K → K}
    {P : FormalMultilinearSeries K K K} (hf : HasFPowerSeriesOnBall f P a r) {b : K}
    (hb : b ∈ Metric.eball a r) (c : K) :
    ∃ F : K → K, (∃ Q : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall F Q a r) ∧
      (∀ z ∈ Metric.eball a r, HasDerivAt F (f z) z) ∧ F b = c ∧
      ∀ G : K → K, (∃ Q : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall G Q a r) →
        (∀ z ∈ Metric.eball a r, HasDerivAt G (f z) z) → G b = c →
          Set.EqOn G F (Metric.eball a r) := by
  sorry

/-- Convergence at every radius of an annulus, in its two-sided Laurent coefficients. -/
def IsLaurentOn (I : Set ℝ) (a : ℤ → K) : Prop :=
  ∀ ρ ∈ I, Tendsto (fun n : ℤ => ‖a n‖ * ρ ^ n) cofinite (𝓝 0)

/-- L0.12: on an open annulus a differential has a Laurent primitive exactly when its
residue vanishes; the coefficient equation is `dg = a dT`. -/
theorem exists_laurent_primitive_iff {I : Set ℝ} (hI : IsOpen I)
    (hpos : I ⊆ Set.Ioi 0) (hne : I.Nonempty) {a : ℤ → K} (ha : IsLaurentOn I a) :
    (∃ g : ℤ → K, IsLaurentOn I g ∧
      ∀ n : ℤ, ((n + 1 : ℤ) : K) * g (n + 1) = a n) ↔ a (-1) = 0 := by
  sorry

/-- L0.22: every logarithmic Laurent differential has a unique primitive with zero scalar
constant. The two terms differentiate a Laurent coefficient and a logarithm power. -/
theorem existsUnique_logLaurent_primitive {I : Set ℝ} (hI : IsOpen I)
    (hpos : I ⊆ Set.Ioi 0) (hne : I.Nonempty) (F : Polynomial (ℤ → K))
    (hF : ∀ k, IsLaurentOn I (F.coeff k)) :
    ∃! G : Polynomial (ℤ → K), (∀ k, IsLaurentOn I (G.coeff k)) ∧
      G.coeff 0 0 = 0 ∧ ∀ (k : ℕ) (n : ℤ),
        ((n + 1 : ℤ) : K) * G.coeff k (n + 1) +
          ((k + 1 : ℕ) : K) * G.coeff (k + 1) (n + 1) = F.coeff k n := by
  sorry

end AnalyticPrimitives

/-- The value of the Laurent series with coefficients `a` at the coordinate value `w = z - e`. -/
def laurentSeriesEval {K : Type*} [NontriviallyNormedField K] (a : ℤ → K) (w : K) : K :=
  ∑' n : ℤ, a n * w ^ n

section LogarithmTranscendence

variable (p : ℕ) [Fact p.Prime]

/-- L0.21: a polynomial relation in a logarithm branch with convergent Laurent
coefficients on an open annulus has all coefficients zero. -/
theorem logBranch_laurent_transcendental {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) {I : Set ℝ} (hI : IsOpen I)
    (hpos : I ⊆ Set.Ioi 0) (hne : I.Nonempty)
    (N : ℕ) (g : Fin (N + 1) → ℤ → ℂ_[p])
    (hg : ∀ k, IsLaurentOn I (g k))
    (h0 : ∀ z : ℂ_[p], ‖z‖ ∈ I →
      ∑ k : Fin (N + 1), laurentSeriesEval (g k) z * L z ^ (k : ℕ) = 0) :
    ∀ k, g k = 0 := by
  sorry

end LogarithmTranscendence

/-- L2.Fa: the closed-disc complex polylogarithm, with principal-logarithm boundary values
in weight one. The series is used in weights at least two; values outside the closed disc
have no analytic contract. -/
def complexPolylog (k : ℕ) (z : ℂ) : ℂ :=
  if k = 1 then -Complex.log (1 - z)
  else ∑' n : ℕ, z ^ (n + 1) / ((n + 1 : ℕ) : ℂ) ^ k

/-- L3.13 and L3.31: the complex Dirichlet L-value formula in every positive integer
weight, for a nontrivial primitive character, with Mathlib's standard additive character. -/
theorem LFunction_nat_eq_gaussSum_inv_mul_sum_complexPolylog {N : ℕ} [NeZero N]
    (θ : DirichletCharacter ℂ N) (hθ : θ.IsPrimitive)
    (hN : 2 ≤ N) (k : ℕ) (hk : 1 ≤ k) :
    DirichletCharacter.LFunction θ k =
      (gaussSum θ⁻¹ ZMod.stdAddChar)⁻¹ *
        ∑ c : ZMod N, θ⁻¹ c * complexPolylog k (ZMod.stdAddChar c) := by
  sorry

end TauCetiRoadmap.ColemanIntegration
