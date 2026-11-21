module

public import Mathlib
public import TauCeti.Analysis.PDE.HopfLax
public import TauCeti.Analysis.Convex.Superlinear

/-!
# Hamilton–Jacobi equations and scalar conservation laws: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti and each with `sorry`, some of the definitions and headline theorems of the
roadmap. It is a set of suggested forms and not a checklist: every target, including every API
bullet and every Check, is in the README.

Stated here: Fréchet sub- and superdifferentials (§1.2) and semiconcavity (§1.3); the real
Legendre transform of a superlinear Hamiltonian (§1.1); the local existence theorem for
noncharacteristic data (§2.2); for the pinned `TauCeti.hopfLax`, the Lipschitz bound, the
semigroup property, the equation at points of differentiability and the uniqueness of
semiconcave weak solutions (§3.1–§3.3); viscosity sub- and supersolutions of a first-order
equation with their differential characterization (§4.1), the comparison principle and
uniqueness for the Cauchy problem (§4.3) with existence of its solution (§4.5), and the
eikonal equation for the distance to the complement (§4.7); integral solutions in one space dimension with Oleinik's uniqueness theorem
and the existence theorem (§5.1–§5.3); and Kružkov entropy solutions with the `L¹`
contraction and the existence theorem (§6.1, §6.2, §6.4).

The control problem of §4.6 is stated on the carriers of OptimalControlAndHamiltonJacobi,
which are not at the pins.
-/

@[expose] public section

open MeasureTheory TauCeti Filter Set Topology
open scoped ENNReal NNReal InnerProductSpace

noncomputable section

namespace TauCetiRoadmap.HamiltonJacobiAndConservationLaws

/-! ## Layer 1: convex and nonsmooth analysis -/

section Layer1

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- **The Fréchet superdifferential** `D⁺u(x)` (§1.2): the covectors `p` with
`u y ≤ u x + p (y - x) + o(‖y - x‖)` as `y → x`. -/
def frechetSuperdifferential (u : V → ℝ) (x : V) : Set (V →L[ℝ] ℝ) :=
  {p | ∀ ε > 0, ∀ᶠ y in 𝓝 x, u y - u x - p (y - x) ≤ ε * ‖y - x‖}

/-- **The Fréchet subdifferential** `D⁻u(x)` (§1.2). -/
def frechetSubdifferential (u : V → ℝ) (x : V) : Set (V →L[ℝ] ℝ) :=
  {p | ∀ ε > 0, ∀ᶠ y in 𝓝 x, -(ε * ‖y - x‖) ≤ u y - u x - p (y - x)}

/-- A function is differentiable at a point exactly when both one-sided differentials are
nonempty there (§1.2). -/
theorem differentiableAt_iff_nonempty_frechetSuperdifferential_and_frechetSubdifferential
    (u : V → ℝ) (x : V) :
    DifferentiableAt ℝ u x ↔
      (frechetSuperdifferential u x).Nonempty ∧ (frechetSubdifferential u x).Nonempty := by
  sorry

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **Semiconcavity** with constant `C` on a set (§1.3): `u - (C/2)‖·‖²` is concave there. -/
def IsSemiconcaveOn (s : Set E) (C : ℝ) (u : E → ℝ) : Prop :=
  ConcaveOn ℝ s fun x ↦ u x - C / 2 * ‖x‖ ^ 2

/-- The squared distance to a nonempty set is semiconcave with constant `2` (§1.3). -/
theorem isSemiconcaveOn_infDist_sq {K : Set E} (hK : K.Nonempty) :
    IsSemiconcaveOn univ 2 fun x ↦ Metric.infDist x K ^ 2 := by
  sorry

/-- **The Legendre transform** of a Hamiltonian (§1.1): the real representative of Tau Ceti's
conjugate. It is the honest maximum when `H` is continuous and superlinear. -/
def legendre (H : E → ℝ) (q : E) : ℝ :=
  (fenchelConjugate (innerₗ E) (fun p ↦ (H p : EReal)) q).toReal

end Layer1

/-! ## Layer 2: the method of characteristics -/

section Layer2

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- **Local existence for noncharacteristic data** (§2.2). The datum `g` is prescribed on the
hypersurface `{γ = 0}` near `x₀`; the triple `(x₀, g x₀, p₀)` is admissible (`hF₀`, `hp₀`) and
noncharacteristic (`hnc`). -/
theorem exists_contDiffOn_eq_zero_of_noncharacteristic {F : E → ℝ → E → ℝ}
    (hF : ContDiff ℝ 2 fun q : E × ℝ × E ↦ F q.1 q.2.1 q.2.2) {γ g : E → ℝ} {x₀ p₀ : E}
    (hγ : ContDiffAt ℝ 2 γ x₀) (hg : ContDiffAt ℝ 2 g x₀) (hγ₀ : γ x₀ = 0)
    (hF₀ : F x₀ (g x₀) p₀ = 0) (hp₀ : ∃ c : ℝ, p₀ - gradient g x₀ = c • gradient γ x₀)
    (hnc : ⟪gradient (fun p ↦ F x₀ (g x₀) p) p₀, gradient γ x₀⟫_ℝ ≠ 0) :
    ∃ W ∈ 𝓝 x₀, ∃ u : E → ℝ, ContDiffOn ℝ 2 u W ∧ (∀ x ∈ W, F x (u x) (gradient u x) = 0) ∧
      (∀ x ∈ W, γ x = 0 → u x = g x) ∧ gradient u x₀ = p₀ := by
  sorry

end Layer2

/-! ## Layer 3: the Hopf–Lax formula -/

section Layer3

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- The Hopf–Lax function of a `K`-Lipschitz datum is `K`-Lipschitz in space (§3.1). -/
theorem lipschitzWith_hopfLax {H g : E → ℝ} {K : ℝ≥0} (hH : ConvexOn ℝ univ H)
    (hsl : Tendsto (fun p ↦ H p / ‖p‖) (cocompact E) atTop) (hg : LipschitzWith K g)
    {t : ℝ} (ht : 0 < t) : LipschitzWith K (hopfLax (legendre H) g t) := by
  sorry

/-- **The semigroup property of the Hopf–Lax formula** (§3.1; Evans, §3.3.2, Lemma 1). -/
theorem hopfLax_hopfLax {H g : E → ℝ} {K : ℝ≥0} (hH : ConvexOn ℝ univ H)
    (hsl : Tendsto (fun p ↦ H p / ‖p‖) (cocompact E) atTop) (hg : LipschitzWith K g)
    {s t : ℝ} (hs : 0 < s) (ht : 0 < t) :
    hopfLax (legendre H) (hopfLax (legendre H) g s) t = hopfLax (legendre H) g (s + t) := by
  sorry

/-- **The Hopf–Lax function solves the Hamilton–Jacobi equation at points of
differentiability** (§3.2; Evans, §3.3.2, Theorem 5). -/
theorem deriv_hopfLax_add_eq_zero {H g : E → ℝ} {K : ℝ≥0} (hH : ConvexOn ℝ univ H)
    (hsl : Tendsto (fun p ↦ H p / ‖p‖) (cocompact E) atTop) (hg : LipschitzWith K g)
    {t : ℝ} (ht : 0 < t) {x : E}
    (hd : DifferentiableAt ℝ (Function.uncurry (hopfLax (legendre H) g)) (t, x)) :
    deriv (fun s ↦ hopfLax (legendre H) g s x) t
      + H (gradient (hopfLax (legendre H) g t) x) = 0 := by
  sorry

/-- **Semiconcave weak solution** of `∂ₜu + H(∇u) = 0` on `[0,T]` with datum `g` (§3.3). -/
def IsSemiconcaveWeakSolution [MeasurableSpace E] [BorelSpace E] (H g : E → ℝ) (T : ℝ)
    (u : ℝ → E → ℝ) : Prop :=
  (∃ K : ℝ≥0, LipschitzOnWith K (Function.uncurry u) (Icc 0 T ×ˢ univ)) ∧ u 0 = g ∧
  (∀ᵐ q ∂((volume.restrict (Ioo 0 T)).prod volume),
    deriv (fun s ↦ u s q.2) q.1 + H (gradient (u q.1) q.2) = 0) ∧
  ∃ C : ℝ, ∀ t ∈ Ioc 0 T, IsSemiconcaveOn univ (C * (1 + 1 / t)) (u t)

/-- **Uniqueness of semiconcave weak solutions** (§3.3; Evans, §3.3.3, Theorem 7). -/
theorem IsSemiconcaveWeakSolution.eqOn [MeasurableSpace E] [BorelSpace E] {H g : E → ℝ}
    (hH : ContDiff ℝ 2 H) (hHc : ConvexOn ℝ univ H)
    (hsl : Tendsto (fun p ↦ H p / ‖p‖) (cocompact E) atTop) {K : ℝ≥0} (hg : LipschitzWith K g)
    {T : ℝ} {u v : ℝ → E → ℝ} (hu : IsSemiconcaveWeakSolution H g T u)
    (hv : IsSemiconcaveWeakSolution H g T v) : ∀ t ∈ Icc 0 T, u t = v t := by
  sorry

end Layer3

/-! ## Layer 4: viscosity solutions -/

section Layer4

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- **Viscosity subsolution** of `F(x, u, Du) = 0` in `Ω` (§4.1), in the form of the pinned
`TauCeti.IsMongeAmpereViscositySubsolution`: no regularity of `u` is part of the predicate. -/
structure IsViscositySubsolution (F : V → ℝ → (V →L[ℝ] ℝ) → ℝ) (Ω : Set V) (u : V → ℝ) :
    Prop where
  le_zero ⦃x₀ : V⦄ (hx₀ : x₀ ∈ Ω) ⦃φ : V → ℝ⦄ (hφ : ContDiffAt ℝ 1 φ x₀)
    (hmax : IsLocalMax (fun x ↦ u x - φ x) x₀) : F x₀ (u x₀) (fderiv ℝ φ x₀) ≤ 0

/-- **Viscosity supersolution** of `F(x, u, Du) = 0` in `Ω` (§4.1). -/
structure IsViscositySupersolution (F : V → ℝ → (V →L[ℝ] ℝ) → ℝ) (Ω : Set V) (u : V → ℝ) :
    Prop where
  zero_le ⦃x₀ : V⦄ (hx₀ : x₀ ∈ Ω) ⦃φ : V → ℝ⦄ (hφ : ContDiffAt ℝ 1 φ x₀)
    (hmin : IsLocalMin (fun x ↦ u x - φ x) x₀) : 0 ≤ F x₀ (u x₀) (fderiv ℝ φ x₀)

/-- **Viscosity solution** of `F(x, u, Du) = 0` in `Ω` (§4.1). -/
structure IsViscositySolution (F : V → ℝ → (V →L[ℝ] ℝ) → ℝ) (Ω : Set V) (u : V → ℝ) : Prop
    extends IsViscositySubsolution F Ω u, IsViscositySupersolution F Ω u

/-- The differential form of the subsolution property (§4.1; Crandall–Evans–Lions,
Theorem 1.1). -/
theorem isViscositySubsolution_iff_forall_mem_frechetSuperdifferential [FiniteDimensional ℝ V]
    (F : V → ℝ → (V →L[ℝ] ℝ) → ℝ) (Ω : Set V) (u : V → ℝ) :
    IsViscositySubsolution F Ω u ↔
      ∀ x ∈ Ω, ∀ p ∈ frechetSuperdifferential u x, F x (u x) p ≤ 0 := by
  sorry

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]

/-- The evolution equation `∂ₜu + H(x, ∇u) = 0` as a first-order equation on `ℝ × E`
(Conventions). -/
def evolutionEquation (H : E → E → ℝ) : ℝ × E → ℝ → (ℝ × E →L[ℝ] ℝ) → ℝ :=
  fun q _ P ↦ P (1, 0) +
    H q.2 ((InnerProductSpace.toDual ℝ E).symm (P ∘L ContinuousLinearMap.inr ℝ ℝ E))

/-- **The comparison principle for the Cauchy problem** (§4.3), in its semicontinuous form.
The conclusion is on `[0,T)`: it fails at `t = T` for functions that are only semicontinuous on
the closed strip. -/
theorem le_of_isViscositySubsolution_of_isViscositySupersolution_evolutionEquation
    [FiniteDimensional ℝ E] {H : E → E → ℝ} (hH : Continuous (Function.uncurry H)) {ω : ℝ → ℝ}
    (hω : Tendsto ω (𝓝[>] 0) (𝓝 0))
    (hHx : ∀ x y p, |H x p - H y p| ≤ ω (‖x - y‖ * (1 + ‖p‖))) {N : ℝ}
    (hHp : ∀ x p q, |H x p - H x q| ≤ N * ‖p - q‖) {T : ℝ} {u v : ℝ → E → ℝ}
    (hu : UpperSemicontinuousOn (Function.uncurry u) (Ico 0 T ×ˢ univ))
    (hv : LowerSemicontinuousOn (Function.uncurry v) (Ico 0 T ×ˢ univ))
    (hub : ∃ C : ℝ, ∀ t ∈ Ico 0 T, ∀ x, |u t x| ≤ C)
    (hvb : ∃ C : ℝ, ∀ t ∈ Ico 0 T, ∀ x, |v t x| ≤ C)
    (hsub : IsViscositySubsolution (evolutionEquation H) (Ioo 0 T ×ˢ univ) (Function.uncurry u))
    (hsup : IsViscositySupersolution (evolutionEquation H) (Ioo 0 T ×ˢ univ)
      (Function.uncurry v))
    (h₀ : ∀ x, u 0 x ≤ v 0 x) : ∀ t ∈ Ico 0 T, ∀ x, u t x ≤ v t x := by
  sorry

/-- **Uniqueness for the Cauchy problem** (§4.3): two bounded continuous viscosity solutions
with the same initial datum agree. -/
theorem eqOn_of_isViscositySolution_evolutionEquation
    [FiniteDimensional ℝ E] {H : E → E → ℝ} (hH : Continuous (Function.uncurry H)) {ω : ℝ → ℝ}
    (hω : Tendsto ω (𝓝[>] 0) (𝓝 0))
    (hHx : ∀ x y p, |H x p - H y p| ≤ ω (‖x - y‖ * (1 + ‖p‖))) {N : ℝ}
    (hHp : ∀ x p q, |H x p - H x q| ≤ N * ‖p - q‖) {T : ℝ} {u v : ℝ → E → ℝ}
    (hu : ContinuousOn (Function.uncurry u) (Ico 0 T ×ˢ univ))
    (hv : ContinuousOn (Function.uncurry v) (Ico 0 T ×ˢ univ))
    (hub : ∃ C : ℝ, ∀ t ∈ Ico 0 T, ∀ x, |u t x| ≤ C)
    (hvb : ∃ C : ℝ, ∀ t ∈ Ico 0 T, ∀ x, |v t x| ≤ C)
    (hus : IsViscositySolution (evolutionEquation H) (Ioo 0 T ×ˢ univ) (Function.uncurry u))
    (hvs : IsViscositySolution (evolutionEquation H) (Ioo 0 T ×ˢ univ) (Function.uncurry v))
    (h₀ : u 0 = v 0) : ∀ t ∈ Ico 0 T, u t = v t := by
  sorry

/-- **Existence for the Cauchy problem** (§4.5): for bounded uniformly continuous data there is
a continuous viscosity solution, bounded on every finite time interval. With the uniqueness
theorem above this is the well-posedness of the Cauchy problem. -/
theorem exists_isViscositySolution_evolutionEquation
    [FiniteDimensional ℝ E] {H : E → E → ℝ} (hH : Continuous (Function.uncurry H)) {ω : ℝ → ℝ}
    (hω : Tendsto ω (𝓝[>] 0) (𝓝 0))
    (hHx : ∀ x y p, |H x p - H y p| ≤ ω (‖x - y‖ * (1 + ‖p‖))) {N : ℝ}
    (hHp : ∀ x p q, |H x p - H x q| ≤ N * ‖p - q‖) {C₀ : ℝ} (hH₀ : ∀ x, |H x 0| ≤ C₀)
    {g : E → ℝ} (hg : UniformContinuous g) {M : ℝ} (hgb : ∀ x, |g x| ≤ M) :
    ∃ u : ℝ → E → ℝ, ContinuousOn (Function.uncurry u) (Ici 0 ×ˢ univ) ∧
      (∀ T : ℝ, ∃ C : ℝ, ∀ t ∈ Icc 0 T, ∀ x, |u t x| ≤ C) ∧ u 0 = g ∧
      IsViscositySolution (evolutionEquation H) (Ioi 0 ×ˢ univ) (Function.uncurry u) := by
  sorry

/-- **The distance to the complement solves the eikonal equation** in the viscosity sense
(§4.7). -/
theorem isViscositySolution_infDist_compl [FiniteDimensional ℝ E] {Ω : Set E} (hΩ : IsOpen Ω)
    (hΩc : Ωᶜ.Nonempty) :
    IsViscositySolution (fun _ _ p ↦ ‖p‖ - 1) Ω fun x ↦ Metric.infDist x Ωᶜ := by
  sorry

end Layer4

/-! ## Layer 5: one space dimension -/

section Layer5

/-- **Integral solution** of `∂ₜu + ∂ₓ(f(u)) = 0` on `(0,∞) × ℝ` with datum `u₀` (§5.1). -/
def IsIntegralSolution (f : ℝ → ℝ) (u₀ : ℝ → ℝ) (u : ℝ → ℝ → ℝ) : Prop :=
  LocallyIntegrable u₀ volume ∧
  AEStronglyMeasurable (Function.uncurry u) ((volume.restrict (Ioi 0)).prod volume) ∧
  (∃ M : ℝ, ∀ᵐ q ∂((volume.restrict (Ioi 0)).prod volume), |u q.1 q.2| ≤ M) ∧
  ∀ φ : ℝ × ℝ → ℝ, ContDiff ℝ 1 φ → HasCompactSupport φ →
    (∫ t in Ioi 0, ∫ x, (u t x * fderiv ℝ φ (t, x) (1, 0)
        + f (u t x) * fderiv ℝ φ (t, x) (0, 1))) + ∫ x, u₀ x * φ (0, x) = 0

/-- **Entropy solution in the sense of Oleinik** (§5.3): an integral solution with the one-sided
bound `u(t, x + z) - u(t, x) ≤ C (1 + 1/t) z` for `z > 0`. -/
def IsOleinikEntropySolution (f : ℝ → ℝ) (u₀ : ℝ → ℝ) (u : ℝ → ℝ → ℝ) : Prop :=
  IsIntegralSolution f u₀ u ∧ ∃ C : ℝ, 0 ≤ C ∧ ∀ᵐ t ∂(volume.restrict (Ioi (0 : ℝ))),
    ∀ᵐ q ∂((volume : Measure ℝ).prod (volume.restrict (Ioi (0 : ℝ)))),
      u t (q.1 + q.2) - u t q.1 ≤ C * (1 + 1 / t) * q.2

/-- **Oleinik's uniqueness theorem** (§5.3; Evans, §3.4.3, Theorem 3). -/
theorem IsOleinikEntropySolution.ae_eq {f : ℝ → ℝ} (hf : ContDiff ℝ 2 f)
    (hfc : ConvexOn ℝ univ f) {u₀ : ℝ → ℝ} {u v : ℝ → ℝ → ℝ}
    (hu : IsOleinikEntropySolution f u₀ u) (hv : IsOleinikEntropySolution f u₀ v) :
    Function.uncurry u =ᵐ[(volume.restrict (Ioi 0)).prod volume] Function.uncurry v := by
  sorry

/-- **Existence of the entropy solution for a uniformly convex flux** (§5.2–§5.3): the
Lax–Oleinik solution. -/
theorem exists_isOleinikEntropySolution {f : ℝ → ℝ} (hf : ContDiff ℝ 2 f) {θ : ℝ} (hθ : 0 < θ)
    (hfc : StrongConvexOn univ θ f) {u₀ : ℝ → ℝ} (hu₀ : AEStronglyMeasurable u₀ volume)
    {M : ℝ} (hM : ∀ᵐ x, |u₀ x| ≤ M) : ∃ u : ℝ → ℝ → ℝ, IsOleinikEntropySolution f u₀ u := by
  sorry

end Layer5

/-! ## Layer 6: Kružkov entropy solutions -/

section Layer6

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- **Kružkov entropy solution** of `∂ₜu + div f(u) = 0` on `(0,T) × E` with datum `u₀`
(§6.1). The spatial pairing `⟪f(u) - f(k), ∇ₓφ⟫` is `fderiv ℝ φ (t, x) (0, f (u t x) - f k)`
and `∂ₜφ` is `fderiv ℝ φ (t, x) (1, 0)`. -/
def IsEntropySolution (f : ℝ → E) (u₀ : E → ℝ) (T : ℝ) (u : ℝ → E → ℝ) : Prop :=
  LocallyIntegrable u₀ volume ∧
  AEStronglyMeasurable (Function.uncurry u) ((volume.restrict (Ioo 0 T)).prod volume) ∧
  (∃ M : ℝ, ∀ᵐ q ∂((volume.restrict (Ioo 0 T)).prod volume), |u q.1 q.2| ≤ M) ∧
  ∀ (k : ℝ) (φ : ℝ × E → ℝ), ContDiff ℝ 1 φ → HasCompactSupport φ → (∀ q, 0 ≤ φ q) →
    (∀ q : ℝ × E, T ≤ q.1 → φ q = 0) →
    0 ≤ (∫ t in Ioo 0 T, ∫ x, (|u t x - k| * fderiv ℝ φ (t, x) (1, 0)
          + (SignType.sign (u t x - k) : ℝ) * fderiv ℝ φ (t, x) (0, f (u t x) - f k)))
        + ∫ x, |u₀ x - k| * φ (0, x)

/-- **The `L¹` contraction** (§6.2; Kružkov 1970, Theorem 1). It is stated with lower Lebesgue
integrals, so that it asserts the integrability of `u t - v t` when `u₀ - v₀` is integrable and
is true, with right side `∞`, when it is not. -/
theorem IsEntropySolution.lintegral_enorm_sub_le {f : ℝ → E} (hf : LocallyLipschitz f)
    {u₀ v₀ : E → ℝ} {T : ℝ} {u v : ℝ → E → ℝ} (hu : IsEntropySolution f u₀ T u)
    (hv : IsEntropySolution f v₀ T v) :
    ∀ᵐ t ∂(volume.restrict (Ioo 0 T)),
      ∫⁻ x, ‖u t x - v t x‖ₑ ≤ ∫⁻ x, ‖u₀ x - v₀ x‖ₑ := by
  sorry

/-- **Existence of entropy solutions** (§6.4; Kružkov 1970, Theorem 5). -/
theorem exists_isEntropySolution {f : ℝ → E} (hf : LocallyLipschitz f) {u₀ : E → ℝ}
    (hu₀ : AEStronglyMeasurable u₀ volume) {M : ℝ} (hM : ∀ᵐ x, |u₀ x| ≤ M) {T : ℝ}
    (hT : 0 < T) : ∃ u : ℝ → E → ℝ, IsEntropySolution f u₀ T u := by
  sorry

end Layer6

end TauCetiRoadmap.HamiltonJacobiAndConservationLaws
