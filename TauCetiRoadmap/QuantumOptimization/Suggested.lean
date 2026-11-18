import Mathlib
import TauCeti.Analysis.ODE.DysonSeries

/-!
# Quantum optimization: target signatures

**This file is not the roadmap.** The definitive document is `README.md`. This file states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti APIs, with the definitions
they need. Every headline theorem of the README is statable at the pins and is stated here. The
`sorry` proofs are targets, not completed results.

The statements use Mathlib's `Matrix.diagonal`, `NormedSpace.exp`, `cfc`, `spectrum`,
`Matrix.IsHermitian.eigenvalues₀`, `Matrix.PosSemidef`, `ProbabilityTheory.stdGaussian`,
`SimpleGraph.adjMatrix`, `SimpleGraph.IsMaximumIndepSet`, `SimpleGraph.IsRegularOfDegree`,
`SimpleGraph.CliqueFree`, `SimpleGraph.edist` and the Euclidean operator norm on matrices
(`Matrix.Norms.L2Operator`), and Tau Ceti's `TauCeti.dysonSeriesLeft`.
-/

noncomputable section

open Finset Matrix
open scoped Matrix.Norms.L2Operator

namespace TauCetiRoadmap.QuantumOptimization

/-! ## Layer 1: quadratic pseudo-Boolean functions, Ising energies and cuts -/

section Classical

variable {ι : Type*} [Fintype ι]

/-- 1.1: the `{0,1}` value of variable `i` in the configuration `x`: `1` if `x i` is true. -/
def bit (x : ι → Bool) (i : ι) : ℝ := if x i then 1 else 0

/-- 1.1: the spin of variable `i` in the configuration `x`: `spin = 1 − 2 · bit`, so `−1` if
`x i` is true and `1` otherwise. -/
def spin (x : ι → Bool) (i : ι) : ℝ := if x i then -1 else 1

/-- 1.1: the quadratic pseudo-Boolean function with coefficient matrix `Q`, summed over all
ordered pairs. -/
def qubo (Q : Matrix ι ι ℝ) (x : ι → Bool) : ℝ := ∑ i, ∑ j, Q i j * bit x i * bit x j

/-- 1.1: the Ising energy with couplings `J`, summed over all ordered pairs, and fields `h`. -/
def ising (J : Matrix ι ι ℝ) (h : ι → ℝ) (x : ι → Bool) : ℝ :=
  ∑ i, ∑ j, J i j * spin x i * spin x j + ∑ i, h i * spin x i

/-- 1.3: the weight of the cut `x`: the sum of `w i j` over the ordered pairs with `x i` true
and `x j` false. -/
def cutWeight (w : Matrix ι ι ℝ) (x : ι → Bool) : ℝ := ∑ i, ∑ j, w i j * bit x i * (1 - bit x j)

/-- 1.1: a quadratic pseudo-Boolean function is an Ising energy plus a constant. -/
theorem qubo_eq_ising (Q : Matrix ι ι ℝ) (x : ι → Bool) :
    qubo Q x = ising ((1 / 4 : ℝ) • Q) (fun i ↦ -(∑ j, (Q i j + Q j i)) / 4) x
      + (∑ i, ∑ j, Q i j) / 4 :=
  sorry

/-- 1.1: an Ising energy is a quadratic pseudo-Boolean function plus a constant. -/
theorem ising_eq_qubo [DecidableEq ι] (J : Matrix ι ι ℝ) (h : ι → ℝ) (x : ι → Bool) :
    ising J h x = qubo ((4 : ℝ) • J - Matrix.diagonal fun i ↦ 2 * (∑ j, (J i j + J j i) + h i)) x
      + (∑ i, ∑ j, J i j + ∑ i, h i) :=
  sorry

/-- 1.2: fields are couplings to one additional spin. -/
theorem ising_ancilla (J : Matrix ι ι ℝ) (h : ι → ℝ) (y : Option ι → Bool) :
    ising (Matrix.of fun a b : Option ι ↦
        match a, b with
        | some i, some j => J i j
        | some i, none => h i / 2
        | none, some j => h j / 2
        | none, none => 0) 0 y
      = ising J h fun i ↦ xor (y (some i)) (y none) :=
  sorry

/-- 1.3: for symmetric weights the cut weight is an Ising energy with no field. -/
theorem cutWeight_eq_ising {w : Matrix ι ι ℝ} (hw : w.IsSymm) (x : ι → Bool) :
    cutWeight w x = (∑ i, ∑ j, w i j) / 4 - ising ((1 / 4 : ℝ) • w) 0 x :=
  sorry

/-- 1.3: every quadratic pseudo-Boolean function is minus a cut weight on one more vertex. -/
theorem qubo_eq_neg_cutWeight (Q : Matrix ι ι ℝ) (y : Option ι → Bool) :
    qubo Q (fun i ↦ xor (y (some i)) (y none)) =
      -cutWeight (Matrix.of fun a b : Option ι ↦
        match a, b with
        | some i, some j => (Q i j + Q j i) / 2
        | some i, none => -(∑ k, (Q i k + Q k i)) / 2
        | none, some j => -(∑ k, (Q j k + Q k j)) / 2
        | none, none => 0) y :=
  sorry

/-- 1.4: with penalty `A > B > 0`, the minimizers of `A · #(edges inside) − B · #(vertices)` are
exactly the maximum independent sets. -/
theorem isMinOn_qubo_independentSet_iff [DecidableEq ι] (G : SimpleGraph ι) [DecidableRel G.Adj]
    {A B : ℝ} (hB : 0 < B) (hAB : B < A) (x : ι → Bool) :
    IsMinOn (qubo ((A / 2) • G.adjMatrix ℝ - B • (1 : Matrix ι ι ℝ))) Set.univ x ↔
      G.IsMaximumIndepSet (univ.filter fun v ↦ x v = true) :=
  sorry

/-- 1.4: the exact-cover energy of a family `S` of subsets of `α`. -/
def exactCoverEnergy {α : Type*} [Fintype α] [DecidableEq α] (S : ι → Finset α) (A B : ℝ)
    (x : ι → Bool) : ℝ :=
  A * ∑ a : α, (1 - ∑ i, if a ∈ S i then bit x i else 0) ^ 2 + B * ∑ i, bit x i

/-- 1.4: if an exact cover exists and `A > |α| · B > 0`, the minimizers of the exact-cover energy
are exactly the exact covers with the fewest sets. -/
theorem isMinOn_exactCoverEnergy_iff {α : Type*} [Fintype α] [DecidableEq α] (S : ι → Finset α)
    {A B : ℝ} (hB : 0 < B) (hAB : Fintype.card α * B < A)
    (hex : ∃ z : ι → Bool, ∀ a, ∃! i, z i = true ∧ a ∈ S i) (x : ι → Bool) :
    IsMinOn (exactCoverEnergy S A B) Set.univ x ↔
      (∀ a, ∃! i, x i = true ∧ a ∈ S i) ∧
        ∀ z : ι → Bool, (∀ a, ∃! i, z i = true ∧ a ∈ S i) →
          (univ.filter fun i ↦ x i = true).card ≤ (univ.filter fun i ↦ z i = true).card :=
  sorry

/-- 1.5: every pseudo-Boolean function is the minimum over auxiliary variables of a quadratic
one. -/
theorem exists_quadratization (f : (ι → Bool) → ℝ) :
    ∃ (m : ℕ) (Q : Matrix (ι ⊕ Fin m) (ι ⊕ Fin m) ℝ) (c : ℝ),
      ∀ x, IsLeast (Set.range fun y : Fin m → Bool ↦ qubo Q (Sum.elim x y) + c) (f x) :=
  sorry

end Classical

/-! ## Layer 2: the semidefinite relaxation of Max-Cut and hyperplane rounding -/

section Rounding

open MeasureTheory ProbabilityTheory Real

/-- 2.1: the Goemans–Williamson constant, the infimum of `(2/π) θ / (1 − cos θ)` over
`0 < θ ≤ π`. -/
def gwConstant : ℝ := sInf ((fun θ : ℝ ↦ 2 / π * θ / (1 - cos θ)) '' Set.Ioc 0 π)

/-- 2.1: the infimum is attained at the solution of `tan (θ/2) = θ` in `(π/2, π)`, and only
there. -/
theorem gwConstant_eq :
    ∃ θ ∈ Set.Ioo (π / 2) π, tan (θ / 2) = θ ∧ gwConstant = 2 / π * θ / (1 - cos θ) ∧
      ∀ φ ∈ Set.Ioc 0 π, φ ≠ θ → gwConstant < 2 / π * φ / (1 - cos φ) :=
  sorry

/-- 2.1: the numerical value of the constant to three places. -/
theorem gwConstant_mem_Ioo : gwConstant ∈ Set.Ioo (0.878 : ℝ) 0.879 :=
  sorry

/-- 2.1: the inequality that hyperplane rounding uses. -/
theorem gwConstant_mul_le_arccos {t : ℝ} (ht : t ∈ Set.Icc (-1 : ℝ) 1) :
    gwConstant * ((1 - t) / 2) ≤ arccos t / π :=
  sorry

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- 2.2: two unit vectors are separated by a standard Gaussian hyperplane with probability
`arccos ⟪u, v⟫ / π`. -/
theorem stdGaussian_sign_inner_ne {u v : E} (hu : ‖u‖ = 1) (hv : ‖v‖ = 1) :
    stdGaussian E {g | SignType.sign (inner ℝ g u) ≠ SignType.sign (inner ℝ g v)} =
      ENNReal.ofReal (arccos (inner ℝ u v) / π) :=
  sorry

variable {ι : Type*} [Fintype ι]

/-- 2.3: the objective of the semidefinite relaxation of Max-Cut at the matrix `X`. -/
def cutRelaxation (w X : Matrix ι ι ℝ) : ℝ := ∑ i, ∑ j, w i j * (1 - X i j) / 4

/-- 2.3: the cut cut out by the hyperplane orthogonal to `g`: `i` is on the true side when
`⟪g, u i⟫ < 0`. -/
def hyperplaneCut (u : ι → E) (g : E) (i : ι) : Bool := decide (inner ℝ g (u i) < 0)

/-- 2.3: the expected weight of the cut produced by a standard Gaussian hyperplane. -/
theorem integral_cutWeight_hyperplaneCut (w : Matrix ι ι ℝ) {u : ι → E} (hu : ∀ i, ‖u i‖ = 1) :
    ∫ g, cutWeight w (hyperplaneCut u g) ∂(stdGaussian E) =
      ∑ i, ∑ j, w i j * (arccos (inner ℝ (u i) (u j)) / (2 * π)) :=
  sorry

/-- 2.3: the Goemans–Williamson rounding guarantee. -/
theorem gwConstant_mul_cutRelaxation_le_integral {w : Matrix ι ι ℝ} (hw : ∀ i j, 0 ≤ w i j)
    {u : ι → E} (hu : ∀ i, ‖u i‖ = 1) :
    gwConstant * cutRelaxation w (Matrix.of fun i j ↦ inner ℝ (u i) (u j)) ≤
      ∫ g, cutWeight w (hyperplaneCut u g) ∂(stdGaussian E) :=
  sorry

/-- 2.3: every feasible point of the relaxation is matched by a cut up to the factor
`gwConstant`. -/
theorem exists_gwConstant_mul_cutRelaxation_le_cutWeight {w : Matrix ι ι ℝ}
    (hw : ∀ i j, 0 ≤ w i j) {X : Matrix ι ι ℝ} (hX : X.PosSemidef) (hdiag : ∀ i, X i i = 1) :
    ∃ x : ι → Bool, gwConstant * cutRelaxation w X ≤ cutWeight w x :=
  sorry

end Rounding

/-! ## Layer 3: diagonal and transverse-field Hamiltonians on qubits -/

section Qubits

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 3.1: the diagonal Hamiltonian of a cost function: `diagHam C |x⟩ = C x |x⟩`. -/
def diagHam (C : (ι → Bool) → ℝ) : Matrix (ι → Bool) (ι → Bool) ℂ :=
  Matrix.diagonal fun x ↦ (C x : ℂ)

/-- 3.1: the Pauli operator `X` on qubit `i`: it flips bit `i` of a basis state. -/
def pauliX (i : ι) : Matrix (ι → Bool) (ι → Bool) ℂ :=
  Matrix.of fun x y ↦ if y = Function.update x i (!x i) then 1 else 0

/-- 3.2: the transverse-field mixer `B = ∑ i, X i`. -/
def mixer (ι : Type*) [Fintype ι] [DecidableEq ι] : Matrix (ι → Bool) (ι → Bool) ℂ :=
  ∑ i, pauliX i

/-- 3.2: the uniform superposition of all basis states. -/
def plusState (ι : Type*) [Fintype ι] : (ι → Bool) → ℂ := fun _ ↦ ((√(2 ^ Fintype.card ι))⁻¹ : ℝ)

/-- 3.2: the eigenvalues of the mixer on `n` qubits are `n − 2k` with multiplicity
`n.choose k`. -/
theorem charpoly_mixer :
    (mixer ι).charpoly = ∏ k ∈ range (Fintype.card ι + 1),
      (Polynomial.X - Polynomial.C ((Fintype.card ι : ℂ) - 2 * k)) ^ (Fintype.card ι).choose k :=
  sorry

/-- 3.2: the matrix entries of the mixing unitary, in terms of the Hamming distance. -/
theorem exp_mixer_apply (β : ℝ) (x y : ι → Bool) :
    NormedSpace.exp ((-(β : ℂ) * Complex.I) • mixer ι) x y =
      (Real.cos β : ℂ) ^ (Fintype.card ι - (univ.filter fun i ↦ x i ≠ y i).card) *
        (-Complex.I * Real.sin β) ^ (univ.filter fun i ↦ x i ≠ y i).card :=
  sorry

/-- 3.3: for `0 ≤ s < 1` the largest eigenvalue of `(1 − s) B + s H_C` is simple. -/
theorem eigenvalues₀_interpolation_lt (C : (ι → Bool) → ℝ) {s : ℝ} (hs : s ∈ Set.Ico (0 : ℝ) 1)
    (hA : (((1 - s : ℝ) : ℂ) • mixer ι + ((s : ℝ) : ℂ) • diagHam C).IsHermitian)
    {i j : Fin (Fintype.card (ι → Bool))} (hi : (i : ℕ) = 0) (hj : (j : ℕ) ≠ 0) :
    hA.eigenvalues₀ j < hA.eigenvalues₀ i :=
  sorry

/-- 3.3: for `0 ≤ s < 1` the largest eigenvalue of `(1 − s) B + s H_C` has an eigenvector with
positive real entries. -/
theorem exists_pos_eigenvector_interpolation (C : (ι → Bool) → ℝ) {s : ℝ}
    (hs : s ∈ Set.Ico (0 : ℝ) 1) :
    ∃ (r : ℝ) (v : (ι → Bool) → ℝ), (∀ x, 0 < v x) ∧
      (((1 - s : ℝ) : ℂ) • mixer ι + ((s : ℝ) : ℂ) • diagHam C) *ᵥ (fun x ↦ (v x : ℂ)) =
        (r : ℂ) • (fun x ↦ (v x : ℂ)) ∧
      ∀ μ ∈ spectrum ℝ (((1 - s : ℝ) : ℂ) • mixer ι + ((s : ℝ) : ℂ) • diagHam C), μ ≤ r :=
  sorry

end Qubits

/-! ## Layer 4: the adiabatic theorem for Hermitian matrix families -/

section Adiabatic

/-- 4.3: Kato's intertwining property. If `P` is a continuously differentiable family of
idempotents and `A` a continuous family commuting with it, the solution of
`Γ' = (A + (P' P − P P')) Γ`, `Γ 0 = 1`, carries `P 0` to `P s`. -/
theorem dysonSeriesLeft_mul_eq_mul_dysonSeriesLeft {B : Type*} [NormedRing B] [NormedAlgebra ℝ B]
    [CompleteSpace B] {P A : ℝ → B} (hP : ContDiff ℝ 1 P) (hidem : ∀ s, IsIdempotentElem (P s))
    (hA : Continuous A) (hcomm : ∀ s, Commute (A s) (P s)) (s : ℝ) :
    TauCeti.dysonSeriesLeft (fun r ↦ A r + (deriv P r * P r - P r * deriv P r)) s * P 0 =
      P s * TauCeti.dysonSeriesLeft (fun r ↦ A r + (deriv P r * P r - P r * deriv P r)) s :=
  sorry

variable {d : Type*} [Fintype d] [DecidableEq d]

/-- 4.1: the propagator of `i ∂ₛ U = T H(s) U`, `U 0 = 1`. -/
def schrodingerPropagator (H : ℝ → Matrix d d ℂ) (T s : ℝ) : Matrix d d ℂ :=
  TauCeti.dysonSeriesLeft (fun r ↦ (-(T : ℂ) * Complex.I) • H r) s

/-- 4.1: two Schrödinger propagators differ by at most the integrated difference of their
Hamiltonians. -/
theorem norm_schrodingerPropagator_sub_le {H₁ H₂ : ℝ → Matrix d d ℂ} (h₁ : Continuous H₁)
    (h₂ : Continuous H₂) (hH₁ : ∀ s, (H₁ s).IsHermitian) (hH₂ : ∀ s, (H₂ s).IsHermitian)
    (T : ℝ) {s : ℝ} (hs : 0 ≤ s) :
    ‖schrodingerPropagator H₁ T s - schrodingerPropagator H₂ T s‖ ≤
      |T| * ∫ r in (0 : ℝ)..s, ‖H₁ r - H₂ r‖ :=
  sorry

/-- 4.2: the spectral projection of `A` for the band `[a, b]`. -/
def bandProj (A : Matrix d d ℂ) (a b : ℝ) : Matrix d d ℂ :=
  cfc ((Set.Icc a b).indicator (1 : ℝ → ℝ)) A

/-- 4.2: the distance between the eigenvalues of `A` in the band `[a, b]` and those outside
it; `0` if there are none inside or none outside. -/
def bandGap (A : Matrix d d ℂ) (a b : ℝ) : ℝ :=
  sInf ((fun p : ℝ × ℝ ↦ |p.1 - p.2|) ''
    ((spectrum ℝ A ∩ Set.Icc a b) ×ˢ (spectrum ℝ A \ Set.Icc a b)))

/-- 4.2: the band projection is as smooth as the family while the band edges stay off the
spectrum. -/
theorem contDiffAt_bandProj {H : ℝ → Matrix d d ℂ} {a b : ℝ → ℝ} {n : ℕ∞} {s : ℝ}
    (hH : ContDiffAt ℝ n H s) (hherm : ∀ r, (H r).IsHermitian) (ha : ContinuousAt a s)
    (hb : ContinuousAt b s) (has : a s ∉ spectrum ℝ (H s)) (hbs : b s ∉ spectrum ℝ (H s)) :
    ContDiffAt ℝ n (fun r ↦ bandProj (H r) (a r) (b r)) s :=
  sorry

/-- 4.2: the derivative of the band projection is bounded by `‖H'‖ / g`, the infinitesimal
form of the Davis–Kahan `sin Θ` theorem. -/
theorem norm_deriv_bandProj_le {H : ℝ → Matrix d d ℂ} {a b : ℝ → ℝ} {s : ℝ}
    (hH : DifferentiableAt ℝ H s) (hherm : ∀ r, (H r).IsHermitian) (ha : ContinuousAt a s)
    (hb : ContinuousAt b s) (has : a s ∉ spectrum ℝ (H s)) (hbs : b s ∉ spectrum ℝ (H s)) :
    ‖deriv (fun r ↦ bandProj (H r) (a r) (b r)) s‖ ≤
      ‖deriv H s‖ / bandGap (H s) (a s) (b s) :=
  sorry

/-- 4.4: the adiabatic theorem with an explicit bound in the gap: the evolved band projection
stays within `O(1/T)` of the instantaneous one. -/
theorem norm_adiabatic_sub_bandProj_le {H : ℝ → Matrix d d ℂ} (hH : ContDiff ℝ 2 H)
    (hherm : ∀ r, (H r).IsHermitian) {a b : ℝ → ℝ} {s : ℝ} (hs : 0 ≤ s)
    (ha : ContinuousOn a (Set.Icc 0 s)) (hb : ContinuousOn b (Set.Icc 0 s))
    (hgap : ∀ r ∈ Set.Icc 0 s, a r ∉ spectrum ℝ (H r) ∧ b r ∉ spectrum ℝ (H r))
    {T : ℝ} (hT : 0 < T) :
    ‖schrodingerPropagator H T s * bandProj (H 0) (a 0) (b 0) * star (schrodingerPropagator H T s)
        - bandProj (H s) (a s) (b s)‖ ≤
      1 / T * (‖deriv H 0‖ / bandGap (H 0) (a 0) (b 0) ^ 2
        + ‖deriv H s‖ / bandGap (H s) (a s) (b s) ^ 2
        + ∫ r in (0 : ℝ)..s,
            (‖deriv (deriv H) r‖ / bandGap (H r) (a r) (b r) ^ 2
              + 7 * ‖deriv H r‖ ^ 2 / bandGap (H r) (a r) (b r) ^ 3)) :=
  sorry

end Adiabatic

/-! ## Layer 5: the quantum approximate optimization algorithm -/

section QAOA

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 5.1: one layer of the alternating circuit with angles `(γ, β)`: the phase `exp (−iγ H_C)`
followed by the mixing unitary `exp (−iβ B)`. -/
def qaoaLayer (C : (ι → Bool) → ℝ) (θ : ℝ × ℝ) : Matrix (ι → Bool) (ι → Bool) ℂ :=
  NormedSpace.exp ((-(θ.2 : ℂ) * Complex.I) • mixer ι) *
    NormedSpace.exp ((-(θ.1 : ℂ) * Complex.I) • diagHam C)

/-- 5.1: the state `|γ, β⟩` for a list of angle pairs; the head of the list acts first. -/
def qaoaState (C : (ι → Bool) → ℝ) (θ : List (ℝ × ℝ)) : (ι → Bool) → ℂ :=
  (θ.map (qaoaLayer C)).reverse.prod *ᵥ plusState ι

/-- 5.1: the expectation of the observable `D` in the state `|γ, β⟩` of the cost `C`. -/
def qaoaMean (C D : (ι → Bool) → ℝ) (θ : List (ℝ × ℝ)) : ℝ :=
  ∑ x, D x * ‖qaoaState C θ x‖ ^ 2

/-- 5.1: the expectation of the cost is at most its maximum. -/
theorem qaoaMean_le_sup' (C : (ι → Bool) → ℝ) (θ : List (ℝ × ℝ)) :
    qaoaMean C C θ ≤ univ.sup' univ_nonempty C :=
  sorry

/-- 5.1: every value of the expectation at depth `p` is a value at every depth `q ≥ p`. -/
theorem exists_qaoaMean_eq_of_le (C : (ι → Bool) → ℝ) (θ : List (ℝ × ℝ)) {q : ℕ}
    (hq : θ.length ≤ q) :
    ∃ θ' : List (ℝ × ℝ), θ'.length = q ∧ qaoaMean C C θ' = qaoaMean C C θ :=
  sorry

/-- 5.2: the first-order product formula for Hermitian matrices. -/
theorem norm_exp_add_sub_exp_mul_exp_le {d : Type*} [Fintype d] [DecidableEq d]
    {A B : Matrix d d ℂ} (hA : A.IsHermitian) (hB : B.IsHermitian) (t : ℝ) :
    ‖NormedSpace.exp ((-(t : ℂ) * Complex.I) • (A + B)) -
        NormedSpace.exp ((-(t : ℂ) * Complex.I) • A) * NormedSpace.exp ((-(t : ℂ) * Complex.I) • B)‖
      ≤ t ^ 2 / 2 * ‖A * B - B * A‖ :=
  sorry

/-- 5.3: the expectation of the cost comes arbitrarily close to its maximum at large depth. -/
theorem exists_lt_qaoaMean (C : (ι → Bool) → ℝ) {ε : ℝ} (hε : 0 < ε) :
    ∃ θ : List (ℝ × ℝ), univ.sup' univ_nonempty C - ε < qaoaMean C C θ :=
  sorry

variable (G : SimpleGraph ι) [DecidableRel G.Adj]

/-- 5.4: the cut size of `x` in the graph `G`: the number of edges with one end on each
side. -/
def cutSize (x : ι → Bool) : ℝ := cutWeight (G.adjMatrix ℝ) x

/-- 5.4: the cut indicator of the pair `u`, `v`. -/
def edgeTerm (u v : ι) (x : ι → Bool) : ℝ := if x u = x v then 0 else 1

/-- 5.4: at depth `p` the expectation of a pair term depends only on the edges that meet a
vertex at distance less than `p` from the pair. -/
theorem qaoaMean_cutSize_edgeTerm_congr (G' : SimpleGraph ι) [DecidableRel G'.Adj] (u v : ι)
    (θ : List (ℝ × ℝ))
    (h : ∀ a b, (G.edist u a < θ.length ∨ G.edist v a < θ.length) → (G.Adj a b ↔ G'.Adj a b)) :
    qaoaMean (cutSize G) (edgeTerm u v) θ = qaoaMean (cutSize G') (edgeTerm u v) θ :=
  sorry

/-- 5.5: the depth-one expectation of an edge term, in terms of the degrees of its ends and the
number of triangles through it. -/
theorem qaoaMean_cutSize_edgeTerm_singleton {u v : ι} (huv : G.Adj u v) (γ β : ℝ) :
    qaoaMean (cutSize G) (edgeTerm u v) [(γ, β)] =
      1 / 2 + Real.sin (4 * β) * Real.sin γ *
          (Real.cos γ ^ (G.degree u - 1) + Real.cos γ ^ (G.degree v - 1)) / 4
        - Real.sin (2 * β) ^ 2 *
          Real.cos γ ^ (G.degree u - 1 + (G.degree v - 1)
            - 2 * (G.neighborFinset u ∩ G.neighborFinset v).card) *
          (1 - Real.cos (2 * γ) ^ (G.neighborFinset u ∩ G.neighborFinset v).card) / 4 :=
  sorry

/-- 5.5: the largest depth-one expectation of the cut size of a triangle-free `(k+1)`-regular
graph. -/
theorem isGreatest_qaoaMean_cutSize_singleton {k : ℕ} (hreg : G.IsRegularOfDegree (k + 1))
    (htri : G.CliqueFree 3) :
    IsGreatest (Set.range fun θ : ℝ × ℝ ↦ qaoaMean (cutSize G) (cutSize G) [θ])
      (G.edgeFinset.card / 2 * (1 + √((k : ℝ) ^ k / ((k : ℝ) + 1) ^ (k + 1)))) :=
  sorry

/-- 5.6: on every `3`-regular graph, depth one with the angles `(arctan (1/√2), π/8)` reaches
`1/2 + 1/(3√3) > 0.6924` of every cut. -/
theorem mul_cutSize_le_qaoaMean_of_isRegularOfDegree_three (hreg : G.IsRegularOfDegree 3)
    (x : ι → Bool) :
    (1 / 2 + 1 / (3 * √3)) * cutSize G x ≤
      qaoaMean (cutSize G) (cutSize G) [(Real.arctan (1 / √2), Real.pi / 8)] :=
  sorry

end QAOA

end TauCetiRoadmap.QuantumOptimization
