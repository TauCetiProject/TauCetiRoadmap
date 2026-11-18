import Mathlib
import TauCeti.Analysis.ODE.GlobalSolution
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic

/-!
# Langevin and Hamiltonian Monte Carlo: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Suppliers used by the README and not restated here: MathematicalStatisticsFoundations 9.4 (the
one-step facts about `leapfrog` and `momentumFlip`: the involution identity, injectivity and
preservation of Lebesgue measure); Mathlib `Kernel.IsReversible.invariant`,
`Kernel.withDensity_apply'`, `MeasureTheory.lintegral_prod`,
`MeasureTheory.withDensity_eq_iff_of_sigmaFinite`, `MeasureTheory.prod_withDensity`,
`MeasureTheory.MeasurePreserving.iterate`, `LinearIsometryEquiv.measurePreserving`,
`MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`, `discrete_gronwall`,
`intervalIntegral.integral_eq_sub_of_hasDerivAt`, `strongConvexOn_iff_convex`,
`ContractingWith.exists_fixedPoint`, `MeasureTheory.Measure.map_addHaar_smul` and
`MeasureTheory.ext_of_forall_integral_eq_of_IsFiniteMeasure`; Tau Ceti
`ODE.hasDerivAt_globalSolution`, `ODE.eq_globalSolution`, `ODE.globalSolution_add`,
`ODE.dist_globalSolution_le`, `StrongConvexOn.add_add_le_of_hasFDerivWithinAt`,
`TauCeti.Probability.stdGaussian_eq_withDensity_norm`,
`TauCeti.Probability.stdGaussian_map_norm_sq`, `TauCeti.Probability.integral_id_chiSquaredMeasure`,
`TauCeti.wassersteinEDist_map_le_mul`, `TauCeti.wassersteinEDist_conv_right_le`,
`TauCeti.wassersteinEDist_triangle` and `TauCeti.WassersteinSpace.completeSpace`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Set Function
open scoped NNReal ENNReal RealInnerProductSpace

namespace TauCetiRoadmap.LangevinAndHamiltonianMonteCarlo

/-! ## Layer 1: Metropolis–Hastings kernels on a measurable space -/

section MetropolisHastings

variable {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]

/-- 1.1: the Metropolis–Hastings kernel with proposal `Q` and acceptance function `a`: from `x`
it moves along `a x y • Q x (dy)` and stays at `x` with the remaining mass
`1 - ∫⁻ y, a x y ∂Q x`. -/
def mhKernel (Q : Kernel X X) [IsSFiniteKernel Q] (a : X → X → ℝ≥0∞) : Kernel X X :=
  Q.withDensity a +
    (Kernel.id : Kernel X X).withDensity fun x _ ↦ 1 - Q.withDensity a x univ

/-- 1.1: a Markov proposal and an acceptance function with values at most `1` give a Markov
kernel. -/
theorem isMarkovKernel_mhKernel (Q : Kernel X X) [IsMarkovKernel Q] {a : X → X → ℝ≥0∞}
    (ha : ∀ x y, a x y ≤ 1) : IsMarkovKernel (mhKernel Q a) :=
  sorry

/-- 1.1: the diagonal part does not matter: the Metropolis–Hastings kernel is reversible exactly
when its acceptance part `Q.withDensity a` is (Tierney 1998, Section 2). -/
theorem mhKernel_isReversible_iff (π : Measure X) [SigmaFinite π] (Q : Kernel X X)
    [IsSFiniteKernel Q] (a : X → X → ℝ≥0∞) :
    (mhKernel Q a).IsReversible π ↔ (Q.withDensity a).IsReversible π :=
  sorry

/-- 1.2: the Metropolis–Hastings acceptance probability for a target density `p` and a proposal
density `q`, both against one reference measure. -/
def mhAcceptance (p : X → ℝ≥0∞) (q : X → X → ℝ≥0∞) (x y : X) : ℝ≥0∞ :=
  min 1 (p y * q y x / (p x * q x y))

/-- 1.2: with finite densities against an s-finite reference measure, the Metropolis–Hastings
kernel is reversible with respect to the target, whose density need not be normalized. -/
theorem mhKernel_mhAcceptance_isReversible {lam : Measure X} [SFinite lam] {Q : Kernel X X}
    [IsSFiniteKernel Q] {p : X → ℝ≥0∞} {q : X → X → ℝ≥0∞} (hp : Measurable p)
    (hq : Measurable (uncurry q)) (hp_top : ∀ x, p x ≠ ∞) (hq_top : ∀ x y, q x y ≠ ∞)
    (hQ : ∀ x, Q x = lam.withDensity (q x)) :
    (mhKernel Q (mhAcceptance p q)).IsReversible (lam.withDensity p) :=
  sorry

/-- 1.3: the Metropolis–Hastings kernel of the deterministic proposal `x ↦ f x`, accepted with
probability `a x`. -/
def involutiveKernel (f : X → X) (a : X → ℝ≥0∞) : Kernel X X :=
  mhKernel ((Kernel.id : Kernel X X).map f) fun x _ ↦ a x

/-- 1.3: for a measurable involution `f`, the kernel is reversible exactly when the measure
`a • π` is invariant under `f`. -/
theorem involutiveKernel_isReversible_iff {π : Measure X} [SigmaFinite π] {f : X → X}
    {a : X → ℝ≥0∞} (hf : Measurable f) (hff : Involutive f) (ha : Measurable a) :
    (involutiveKernel f a).IsReversible π ↔ (π.withDensity a).map f = π.withDensity a :=
  sorry

/-- 1.3: the Jacobian form. If the image of the reference measure under the involution `f` has
density `j`, the acceptance probability `min 1 (p (f x) * j x / p x)` makes the kernel reversible
with respect to the target of density `p`. -/
theorem involutiveKernel_isReversible_of_map_eq_withDensity {lam : Measure X} [SigmaFinite lam]
    {f : X → X} {p j : X → ℝ≥0∞} (hf : Measurable f) (hff : Involutive f) (hp : Measurable p)
    (hp_top : ∀ x, p x ≠ ∞) (hj : Measurable j) (hlam : lam.map f = lam.withDensity j) :
    (involutiveKernel f fun x ↦ min 1 (p (f x) * j x / p x)).IsReversible
      (lam.withDensity p) :=
  sorry

/-- 1.4: the kernel on `X` obtained from a kernel `K` on `X × Y` by drawing the auxiliary
variable from `ρ`, applying `K` and forgetting the auxiliary variable. -/
def auxKernel (ρ : Measure Y) (K : Kernel (X × Y) (X × Y)) : Kernel X X :=
  (K.map Prod.fst) ∘ₖ ((Kernel.id : Kernel X X) ×ₖ Kernel.const X ρ)

/-- 1.4: reversibility on the extended space with respect to a product measure passes to the
marginal kernel. -/
theorem auxKernel_isReversible {π : Measure X} {ρ : Measure Y} [SFinite ρ]
    {K : Kernel (X × Y) (X × Y)} (hK : K.IsReversible (π.prod ρ)) :
    (auxKernel ρ K).IsReversible π :=
  sorry

end MetropolisHastings

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-! ## Layer 2: the leapfrog integrator -/

/-- 2.1: the momentum flip `(q, p) ↦ (q, -p)` of MathematicalStatisticsFoundations 9.4. -/
def momentumFlip (z : E × E) : E × E :=
  (z.1, -z.2)

/-- 2.1: one leapfrog (Störmer–Verlet) step with drift `g` and step `h`, the map of
MathematicalStatisticsFoundations 9.4: a half step in momentum, a full step in position, a half
step in momentum. -/
def leapfrog (g : E → E) (h : ℝ) (z : E × E) : E × E :=
  (z.1 + h • (z.2 - (h / 2) • g z.1),
    z.2 - (h / 2) • g z.1 - (h / 2) • g (z.1 + h • (z.2 - (h / 2) • g z.1)))

/-- 2.2: the derivative of a leapfrog step has determinant `1`. -/
theorem det_fderiv_leapfrog [FiniteDimensional ℝ E] {g : E → E} (hg : Differentiable ℝ g)
    (h : ℝ) (z : E × E) : (fderiv ℝ (leapfrog g h) z).det = 1 :=
  sorry

/-- 2.2: when the derivative of the drift is symmetric, as for a gradient, a leapfrog step
preserves the canonical symplectic form `⟪u.1, v.2⟫ - ⟪u.2, v.1⟫`. -/
theorem leapfrog_symplectic {g : E → E} (hg : Differentiable ℝ g)
    (hsymm : ∀ x u v, ⟪fderiv ℝ g x u, v⟫ = ⟪u, fderiv ℝ g x v⟫) (h : ℝ) (z u v : E × E) :
    ⟪(fderiv ℝ (leapfrog g h) z u).1, (fderiv ℝ (leapfrog g h) z v).2⟫ -
        ⟪(fderiv ℝ (leapfrog g h) z u).2, (fderiv ℝ (leapfrog g h) z v).1⟫ =
      ⟪u.1, v.2⟫ - ⟪u.2, v.1⟫ :=
  sorry

/-- 2.3: the modified energy of the leapfrog integrator for the quadratic potential
`⟪q, A q⟫ / 2`. -/
def quadraticModifiedEnergy (A : E →L[ℝ] E) (h : ℝ) (z : E × E) : ℝ :=
  ‖z.2‖ ^ 2 / 2 + ⟪z.1, A z.1⟫ / 2 - h ^ 2 / 8 * ‖A z.1‖ ^ 2

/-- 2.3: for a symmetric `A` the leapfrog step with drift `A` conserves the modified energy
exactly, for every step size. -/
theorem quadraticModifiedEnergy_leapfrog (A : E →L[ℝ] E) (hA : ∀ u v, ⟪A u, v⟫ = ⟪u, A v⟫)
    (h : ℝ) (z : E × E) :
    quadraticModifiedEnergy A h (leapfrog A h z) = quadraticModifiedEnergy A h z :=
  sorry

/-! ## Layer 3: Hamiltonian flow and the accuracy of the integrator -/

/-- 3.1: the Hamiltonian `H (q, p) = U q + ‖p‖ ^ 2 / 2`. -/
def hamiltonian (U : E → ℝ) (z : E × E) : ℝ :=
  U z.1 + ‖z.2‖ ^ 2 / 2

/-- 3.1: the vector field `(q, p) ↦ (p, -g q)` of Hamilton's equations with force `-g`. -/
def hamiltonianField (g : E → E) (z : E × E) : E × E :=
  (z.2, -g z.1)

/-- 3.1: the Hamiltonian is constant along every solution of Hamilton's equations. -/
theorem hamiltonian_eq_of_hasDerivAt {U : E → ℝ} {g : E → E} {γ : ℝ → E × E}
    (hg : ∀ x, HasFDerivAt U (innerSL ℝ (g x)) x)
    (hγ : ∀ t, HasDerivAt γ (hamiltonianField g (γ t)) t) (t : ℝ) :
    hamiltonian U (γ t) = hamiltonian U (γ 0) :=
  sorry

/-- 3.1: reversibility of the flow: flipping the momentum reverses time. -/
theorem globalSolution_hamiltonianField_momentumFlip [CompleteSpace E] {g : E → E} {K : ℝ≥0}
    (hv : LipschitzWith K (hamiltonianField g)) (z : E × E) (t : ℝ) :
    ODE.globalSolution (hamiltonianField g) hv (momentumFlip z) t =
      momentumFlip (ODE.globalSolution (hamiltonianField g) hv z (-t)) :=
  sorry

/-- 3.2: the local error of a leapfrog step in position, for a potential bounded below by `m`
with `L`-Lipschitz gradient. -/
theorem norm_fst_sub_leapfrog_le {U : E → ℝ} {g : E → E} {L : ℝ≥0} {m : ℝ} {γ : ℝ → E × E}
    (hg : ∀ x, HasFDerivAt U (innerSL ℝ (g x)) x) (hL : LipschitzWith L g) (hm : ∀ x, m ≤ U x)
    (hγ : ∀ t, HasDerivAt γ (hamiltonianField g (γ t)) t) {ε : ℝ} (hε : 0 ≤ ε) :
    ‖(γ ε).1 - (leapfrog g ε (γ 0)).1‖ ≤
      L * √(2 * (hamiltonian U (γ 0) - m)) * ε ^ 3 / 6 :=
  sorry

/-- 3.2: the local error of a leapfrog step in momentum, when moreover the derivative `g'` of
the gradient is `M`-Lipschitz. -/
theorem norm_snd_sub_leapfrog_le {U : E → ℝ} {g : E → E} {g' : E → E →L[ℝ] E} {L M : ℝ≥0}
    {m : ℝ} {γ : ℝ → E × E} (hg : ∀ x, HasFDerivAt U (innerSL ℝ (g x)) x)
    (hL : LipschitzWith L g) (hm : ∀ x, m ≤ U x) (hg' : ∀ x, HasFDerivAt g (g' x) x)
    (hM : LipschitzWith M g') (hγ : ∀ t, HasDerivAt γ (hamiltonianField g (γ t)) t) {ε : ℝ}
    (hε : 0 ≤ ε) :
    ‖(γ ε).2 - (leapfrog g ε (γ 0)).2‖ ≤
      (M * (2 * (hamiltonian U (γ 0) - m)) + L * √L * √(2 * (hamiltonian U (γ 0) - m))) *
          ε ^ 3 / 12 +
        L ^ 2 * √(2 * (hamiltonian U (γ 0) - m)) * ε ^ 4 / 12 :=
  sorry

/-- 3.3: the global error of `n` leapfrog steps of size `ε` is of order `ε ^ 2` on a fixed time
interval, with explicit constants. -/
theorem leapfrog_iterate_error_le {U : E → ℝ} {g : E → E} {g' : E → E →L[ℝ] E} {L M : ℝ≥0}
    {m : ℝ} {γ : ℝ → E × E} (hg : ∀ x, HasFDerivAt U (innerSL ℝ (g x)) x)
    (hL : LipschitzWith L g) (hm : ∀ x, m ≤ U x) (hg' : ∀ x, HasFDerivAt g (g' x) x)
    (hM : LipschitzWith M g') (hγ : ∀ t, HasDerivAt γ (hamiltonianField g (γ t)) t) {ε : ℝ}
    (hε : 0 ≤ ε) (n : ℕ) :
    let V := √(2 * (hamiltonian U (γ 0) - m))
    let B := ε ^ 2 / 12 * (3 * L * V + M * V ^ 2 / √L + L * √L * V * ε) *
      (Real.exp (√L * (n * ε)) - 1)
    √L * ‖(γ (n * ε)).1 - ((leapfrog g ε)^[n] (γ 0)).1‖ ≤ B ∧
      ‖(γ (n * ε)).2 - ((leapfrog g ε)^[n] (γ 0)).2‖ ≤ √(1 + L * ε ^ 2 / 4) * B :=
  sorry

/-- 3.4: Liouville's theorem for Hamilton's equations with a Lipschitz force: the flow preserves
Lebesgue measure on phase space. -/
theorem measurePreserving_globalSolution_hamiltonianField [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E] {g : E → E} {K : ℝ≥0}
    (hv : LipschitzWith K (hamiltonianField g)) (t : ℝ) :
    MeasurePreserving (fun z ↦ ODE.globalSolution (hamiltonianField g) hv z t)
      (volume : Measure (E × E)) volume :=
  sorry

variable [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-! ## Layer 4: Hamiltonian Monte Carlo -/

/-- 4.1: the target measure with density `exp (-U)` against Lebesgue measure, not normalized. -/
def targetMeasure (U : E → ℝ) : Measure E :=
  volume.withDensity fun x ↦ ENNReal.ofReal (Real.exp (-U x))

/-- 4.1: the Hamiltonian Monte Carlo kernel: refresh the momentum from the standard Gaussian,
propose `n` leapfrog steps of size `h` with drift `g` followed by a momentum flip, and accept
with probability `min 1 (exp (H z - H z'))`. -/
def hmcKernel (U : E → ℝ) (g : E → E) (h : ℝ) (n : ℕ) : Kernel E E :=
  auxKernel (stdGaussian E)
    (involutiveKernel (momentumFlip ∘ (leapfrog g h)^[n]) fun z ↦
      ENNReal.ofReal (min 1 (Real.exp
        (hamiltonian U z - hamiltonian U (momentumFlip ((leapfrog g h)^[n] z))))))

/-- 4.1: Hamiltonian Monte Carlo is reversible with respect to the target, for every measurable
potential, every measurable drift, every step size and every number of steps. -/
theorem hmcKernel_isReversible {U : E → ℝ} {g : E → E} (hU : Measurable U) (hg : Measurable g)
    (h : ℝ) (n : ℕ) : (hmcKernel U g h n).IsReversible (targetMeasure U) :=
  sorry

/-- 4.2: Hamiltonian Monte Carlo with the exact flow for time `t`, which accepts every
proposal. -/
def exactHmcKernel (g : E → E) {K : ℝ≥0} (hv : LipschitzWith K (hamiltonianField g)) (t : ℝ) :
    Kernel E E :=
  auxKernel (stdGaussian E)
    ((Kernel.id : Kernel (E × E) (E × E)).map fun z ↦
      ODE.globalSolution (hamiltonianField g) hv z t)

/-- 4.2: exact Hamiltonian Monte Carlo is reversible with respect to the target. -/
theorem exactHmcKernel_isReversible {U : E → ℝ} {g : E → E} {K : ℝ≥0}
    (hg : ∀ x, HasFDerivAt U (innerSL ℝ (g x)) x) (hv : LipschitzWith K (hamiltonianField g))
    (t : ℝ) : (exactHmcKernel g hv t).IsReversible (targetMeasure U) :=
  sorry

/-! ## Layer 5: Langevin algorithms -/

/-- 5.1: the kernel of the unadjusted Langevin algorithm with drift `g` and step `h`: the law of
`x - h • g x + √(2 * h) • ξ` for a standard Gaussian `ξ`. -/
def ulaKernel (g : E → E) (h : ℝ) : Kernel E E :=
  ((Kernel.id : Kernel E E) ×ₖ Kernel.const E (stdGaussian E)).map fun z ↦
    z.1 - h • g z.1 + √(2 * h) • z.2

/-- 5.1: the kernel of the unadjusted Langevin algorithm is s-finite, whatever the drift. -/
instance isSFiniteKernel_ulaKernel (g : E → E) (h : ℝ) : IsSFiniteKernel (ulaKernel g h) := by
  unfold ulaKernel
  infer_instance

/-- 5.2: one step of the unadjusted Langevin algorithm contracts the Wasserstein distance of
order `2` by the factor `1 - h * m`, for an `m`-strongly convex potential with `L`-Lipschitz
gradient and `h * (m + L) ≤ 2`. -/
theorem wassersteinEDist_ulaKernel_le {U : E → ℝ} {g : E → E} {m : ℝ} {L : ℝ≥0} {h : ℝ}
    (hg : ∀ x, HasFDerivAt U (innerSL ℝ (g x)) x) (hU : StrongConvexOn univ m U)
    (hL : LipschitzWith L g) (h0 : 0 ≤ h) (hh : h * (m + L) ≤ 2) (μ ν : Measure E)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    TauCeti.wassersteinEDist 2 (ulaKernel g h ∘ₘ μ) (ulaKernel g h ∘ₘ ν) ≤
      ENNReal.ofReal (1 - h * m) * TauCeti.wassersteinEDist 2 μ ν :=
  sorry

/-- 5.3: the unadjusted Langevin algorithm has exactly one invariant probability measure. -/
theorem existsUnique_invariant_ulaKernel {U : E → ℝ} {g : E → E} {m : ℝ} {L : ℝ≥0} {h : ℝ}
    (hg : ∀ x, HasFDerivAt U (innerSL ℝ (g x)) x) (hU : StrongConvexOn univ m U)
    (hL : LipschitzWith L g) (hm : 0 < m) (h0 : 0 < h) (hh : h * (m + L) ≤ 2) :
    ∃! μ : Measure E, IsProbabilityMeasure μ ∧ (ulaKernel g h).Invariant μ :=
  sorry

/-- 5.3: the second moment of the invariant law about the minimizer of the potential
(Durmus and Moulines 2019, Proposition 2). -/
theorem integral_norm_sub_sq_le_of_invariant_ulaKernel {U : E → ℝ} {g : E → E} {m : ℝ}
    {L : ℝ≥0} {h : ℝ} (hg : ∀ x, HasFDerivAt U (innerSL ℝ (g x)) x)
    (hU : StrongConvexOn univ m U) (hL : LipschitzWith L g) (hm : 0 < m) (h0 : 0 < h)
    (hh : h * (m + L) ≤ 2) {μ : Measure E} [IsProbabilityMeasure μ]
    (hμ : (ulaKernel g h).Invariant μ) {x₀ : E} (hx₀ : g x₀ = 0) :
    ∫ x, ‖x - x₀‖ ^ 2 ∂μ ≤ Module.finrank ℝ E * (m + L) / (m * L) :=
  sorry

/-- 5.4: the distance from the `k`-th iterate to any probability measure `ν` is controlled by
the initial distance and the one-step defect of `ν` (the discrete part of Dalalyan 2017,
Theorem 1). -/
theorem wassersteinEDist_ulaKernel_pow_le {U : E → ℝ} {g : E → E} {m : ℝ} {L : ℝ≥0} {h : ℝ}
    (hg : ∀ x, HasFDerivAt U (innerSL ℝ (g x)) x) (hU : StrongConvexOn univ m U)
    (hL : LipschitzWith L g) (hm : 0 < m) (h0 : 0 ≤ h) (hh : h * (m + L) ≤ 2) (μ ν : Measure E)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] (k : ℕ) :
    TauCeti.wassersteinEDist 2 ((ulaKernel g h ^ k) ∘ₘ μ) ν ≤
      ENNReal.ofReal ((1 - h * m) ^ k) * TauCeti.wassersteinEDist 2 μ ν +
        ENNReal.ofReal ((1 - (1 - h * m) ^ k) / (h * m)) *
          TauCeti.wassersteinEDist 2 (ulaKernel g h ∘ₘ ν) ν :=
  sorry

/-- 5.5: the Metropolis-adjusted Langevin algorithm: the Metropolis–Hastings kernel with the
unadjusted Langevin proposal and the densities `exp (-U)` and
`exp (-‖y - x + h • g x‖ ^ 2 / (4 * h))`. -/
def malaKernel (U : E → ℝ) (g : E → E) (h : ℝ) : Kernel E E :=
  mhKernel (ulaKernel g h)
    (mhAcceptance (fun x ↦ ENNReal.ofReal (Real.exp (-U x))) fun x y ↦
      ENNReal.ofReal (Real.exp (-‖y - x + h • g x‖ ^ 2 / (4 * h))))

/-- 5.5: the Metropolis-adjusted Langevin algorithm is reversible with respect to the target. -/
theorem malaKernel_isReversible {U : E → ℝ} {g : E → E} (hU : Measurable U) (hg : Measurable g)
    {h : ℝ} (hh : 0 ≤ h) : (malaKernel U g h).IsReversible (targetMeasure U) :=
  sorry

/-- 5.5: Hamiltonian Monte Carlo with a single leapfrog step of size `ε` is the
Metropolis-adjusted Langevin algorithm with step `ε ^ 2 / 2` (Neal 2011, Section 5.2). -/
theorem hmcKernel_one_eq_malaKernel {U : E → ℝ} {g : E → E} (hU : Measurable U)
    (hg : Measurable g) (ε : ℝ) : hmcKernel U g ε 1 = malaKernel U g (ε ^ 2 / 2) :=
  sorry

end TauCetiRoadmap.LangevinAndHamiltonianMonteCarlo
