import Mathlib
import TauCeti.Analysis.Contour.Winding.Number.Basic

/-!
# GravitationalLensing: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, with the few definitions they need: the
lens map, lens potential and time delay of a lens made of a smooth part and finitely many point
masses, its image set, Jacobian, signed magnification and the non-caustic condition, and the lens
map of the singular isothermal sphere. Winding numbers are Tau Ceti's
`TauCeti.Contour.windingNumber`.

Every headline theorem of the README is statable at the pins and is stated below.
-/

open Complex ComplexConjugate Filter Topology Metric

namespace TauCetiRoadmap.GravitationalLensing

/-! ## Design note: lens maps, time delay and magnification -/

/-- D.1 The deflection of point masses `m j` at the positions `pos j`:
`∑ j, m j / conj (z - pos j)`. At a position the corresponding term has the junk value `0`. -/
noncomputable def pointDeflection {n : ℕ} (pos : Fin n → ℂ) (m : Fin n → ℝ) (z : ℂ) : ℂ :=
  ∑ j, (m j : ℂ) / conj (z - pos j)

/-- D.1 The lens map `z ↦ z - ∇ψ₀ z - ∑ j, m j / conj (z - pos j)` of a lens with smooth
potential `ψ₀` and point masses `m j` at `pos j`. -/
noncomputable def lensMap {n : ℕ} (ψ₀ : ℂ → ℝ) (pos : Fin n → ℂ) (m : Fin n → ℝ) (z : ℂ) : ℂ :=
  z - gradient ψ₀ z - pointDeflection pos m z

/-- D.2 The lens potential `ψ₀ z + ∑ j, m j * log ‖z - pos j‖`. -/
noncomputable def lensPotential {n : ℕ} (ψ₀ : ℂ → ℝ) (pos : Fin n → ℂ) (m : Fin n → ℝ)
    (z : ℂ) : ℝ :=
  ψ₀ z + ∑ j, m j * Real.log ‖z - pos j‖

/-- D.2 The time delay (Fermat potential) of the source `w`:
`‖z - w‖ ^ 2 / 2 - lensPotential ψ₀ pos m z`. -/
noncomputable def timeDelay {n : ℕ} (ψ₀ : ℂ → ℝ) (pos : Fin n → ℂ) (m : Fin n → ℝ)
    (w z : ℂ) : ℝ :=
  ‖z - w‖ ^ 2 / 2 - lensPotential ψ₀ pos m z

/-- D.1 The images of the source `w`: the points off the lens positions that the lens map sends
to `w`. -/
def images {n : ℕ} (ψ₀ : ℂ → ℝ) (pos : Fin n → ℂ) (m : Fin n → ℝ) (w : ℂ) : Set ℂ :=
  {z | (∀ j, z ≠ pos j) ∧ lensMap ψ₀ pos m z = w}

/-- D.3 The Jacobian of the lens map: the determinant of its real derivative. -/
noncomputable def lensJacobian {n : ℕ} (ψ₀ : ℂ → ℝ) (pos : Fin n → ℂ) (m : Fin n → ℝ)
    (z : ℂ) : ℝ :=
  LinearMap.det (fderiv ℝ (lensMap ψ₀ pos m) z : ℂ →ₗ[ℝ] ℂ)

/-- D.3 The signed magnification, the inverse of the Jacobian (junk value `0` where the Jacobian
vanishes). -/
noncomputable def magnification {n : ℕ} (ψ₀ : ℂ → ℝ) (pos : Fin n → ℂ) (m : Fin n → ℝ)
    (z : ℂ) : ℝ :=
  (lensJacobian ψ₀ pos m z)⁻¹

/-- D.3 A source is non-caustic when the Jacobian vanishes at none of its images. -/
def NonCaustic {n : ℕ} (ψ₀ : ℂ → ℝ) (pos : Fin n → ℂ) (m : Fin n → ℝ) (w : ℂ) : Prop :=
  ∀ z ∈ images ψ₀ pos m w, lensJacobian ψ₀ pos m z ≠ 0

/-- D.4 The lens map `z ↦ z - b * z / ‖z‖` of the singular isothermal sphere with Einstein
radius `b` (junk value `0` at the centre). -/
noncomputable def sisLensMap (b : ℝ) (z : ℂ) : ℂ :=
  z - (b : ℂ) * z / (‖z‖ : ℂ)

/-- D.4 The images of the source `w` under the singular isothermal sphere: the points other
than the centre that the lens map sends to `w`. -/
def sisImages (b : ℝ) (w : ℂ) : Set ℂ :=
  {z | z ≠ 0 ∧ sisLensMap b z = w}

/-- D.4 The signed magnification of the singular isothermal sphere at `z`. -/
noncomputable def sisMagnification (b : ℝ) (z : ℂ) : ℝ :=
  (LinearMap.det (fderiv ℝ (sisLensMap b) z : ℂ →ₗ[ℝ] ℂ))⁻¹

/-! ## Layer 1: Fermat's principle and the Jacobian -/

/-- 1.1 Fermat's principle: off the lens positions, wherever the smooth potential is
differentiable, the gradient of the time delay is the lens map minus the source. -/
theorem hasGradientAt_timeDelay {n : ℕ} (ψ₀ : ℂ → ℝ) (pos : Fin n → ℂ) (m : Fin n → ℝ)
    (w z : ℂ) (hψ : DifferentiableAt ℝ ψ₀ z) (hz : ∀ j, z ≠ pos j) :
    HasGradientAt (timeDelay ψ₀ pos m w) (lensMap ψ₀ pos m z - w) z := sorry

/-- 1.2 The Jacobian of a lens of point masses off the positions is
`1 - ‖∑ j, m j / (z - pos j) ^ 2‖ ^ 2`. -/
theorem lensJacobian_pointMasses {n : ℕ} (pos : Fin n → ℂ) (m : Fin n → ℝ) (z : ℂ)
    (hz : ∀ j, z ≠ pos j) :
    lensJacobian 0 pos m z = 1 - ‖∑ j, (m j : ℂ) / (z - pos j) ^ 2‖ ^ 2 := sorry

/-! ## Layer 2: the point-mass lens and the singular isothermal sphere -/

/-- 2.1 A point mass `M > 0` at `a` images a source `w ≠ a` exactly twice, at
`a + (w - a) * (u ± √(u ^ 2 + 4 M)) / (2 u)` with `u = ‖w - a‖`. -/
theorem pointLens_images (a w : ℂ) (M : ℝ) (hM : 0 < M) (hw : w ≠ a) :
    images 0 (fun _ : Fin 1 => a) (fun _ => M) w =
      {a + (w - a) * (((‖w - a‖ + Real.sqrt (‖w - a‖ ^ 2 + 4 * M)) / (2 * ‖w - a‖) : ℝ) : ℂ),
       a + (w - a) * (((‖w - a‖ - Real.sqrt (‖w - a‖ ^ 2 + 4 * M)) / (2 * ‖w - a‖) : ℝ) : ℂ)} :=
  sorry

/-- 2.2 The Einstein ring: a point mass `M > 0` at `a` images the source `a` onto the circle of
radius `√M` about `a`. -/
theorem pointLens_images_self (a : ℂ) (M : ℝ) (hM : 0 < M) :
    images 0 (fun _ : Fin 1 => a) (fun _ => M) a = sphere a (Real.sqrt M) := sorry

/-- 2.3 The signed magnifications of the two images of a point lens are
`1 / 2 ± (u ^ 2 + 2 M) / (2 u √(u ^ 2 + 4 M))` with `u = ‖w - a‖`; the inner image has negative
magnification. -/
theorem pointLens_magnification (a w : ℂ) (M : ℝ) (hM : 0 < M) (hw : w ≠ a) :
    magnification 0 (fun _ : Fin 1 => a) (fun _ => M)
        (a + (w - a) * (((‖w - a‖ + Real.sqrt (‖w - a‖ ^ 2 + 4 * M)) / (2 * ‖w - a‖) : ℝ) : ℂ)) =
      1 / 2 + (‖w - a‖ ^ 2 + 2 * M) / (2 * ‖w - a‖ * Real.sqrt (‖w - a‖ ^ 2 + 4 * M)) ∧
    magnification 0 (fun _ : Fin 1 => a) (fun _ => M)
        (a + (w - a) * (((‖w - a‖ - Real.sqrt (‖w - a‖ ^ 2 + 4 * M)) / (2 * ‖w - a‖) : ℝ) : ℂ)) =
      1 / 2 - (‖w - a‖ ^ 2 + 2 * M) / (2 * ‖w - a‖ * Real.sqrt (‖w - a‖ ^ 2 + 4 * M)) := sorry

/-- 2.4 The singular isothermal sphere with Einstein radius `b > 0` images a source `w ≠ 0` at
`w ± b w / ‖w‖` when `‖w‖ < b` and at `w + b w / ‖w‖` alone when `b ≤ ‖w‖`, and the source `0`
onto the circle of radius `b`. -/
theorem sis_images (b : ℝ) (hb : 0 < b) (w : ℂ) :
    (w ≠ 0 → ‖w‖ < b →
      sisImages b w = {w + (b : ℂ) * w / (‖w‖ : ℂ), w - (b : ℂ) * w / (‖w‖ : ℂ)}) ∧
    (w ≠ 0 → b ≤ ‖w‖ → sisImages b w = {w + (b : ℂ) * w / (‖w‖ : ℂ)}) ∧
    sisImages b 0 = sphere 0 b := sorry

/-- 2.5 The signed magnifications of the singular isothermal sphere are `1 + b / ‖w‖` at the
outer image and, when `‖w‖ < b`, `1 - b / ‖w‖` at the inner one. -/
theorem sis_magnification (b : ℝ) (hb : 0 < b) (w : ℂ) (hw : w ≠ 0) :
    sisMagnification b (w + (b : ℂ) * w / (‖w‖ : ℂ)) = 1 + b / ‖w‖ ∧
    (‖w‖ < b → sisMagnification b (w - (b : ℂ) * w / (‖w‖ : ℂ)) = 1 - b / ‖w‖) := sorry

/-! ## Layer 3: winding numbers of planar maps -/

/-- 3.1 The local index of a regular zero: if `f` is `C¹` near `p`, `f p = 0` and the real
derivative at `p` is invertible, then on every small circle about `p` the winding number of `f`
about `0` is the sign of the Jacobian. -/
theorem windingNumber_eventually_eq_sign (f : ℂ → ℂ) (p : ℂ) (hf : ContDiffAt ℝ 1 f p)
    (h0 : f p = 0) (hdet : LinearMap.det (fderiv ℝ f p : ℂ →ₗ[ℝ] ℂ) ≠ 0) :
    ∀ᶠ ε in 𝓝[>] (0 : ℝ),
      TauCeti.Contour.windingNumber (fun t => f (circleMap p ε t)) 0 (2 * Real.pi) 0 =
        ((SignType.sign (LinearMap.det (fderiv ℝ f p : ℂ →ₗ[ℝ] ℂ)) : ℤ) : ℂ) := sorry

/-- 3.2 The argument principle for `C¹` maps: if `f` is `C¹` and zero-free on the closed disc of
radius `R` about `c` with the open discs of radius `ε` about the points of `S` removed, these
discs being disjoint and inside the open disc, then the winding number of `f` along the outer
circle is the sum of its winding numbers along the small circles. -/
theorem windingNumber_circle_eq_sum (f : ℂ → ℂ) (c : ℂ) (R ε : ℝ) (S : Finset ℂ) (U : Set ℂ)
    (hR : 0 < R) (hε : 0 < ε) (hU : IsOpen U) (hf : ContDiffOn ℝ 1 f U)
    (hS : ∀ p ∈ S, closedBall p ε ⊆ ball c R)
    (hdisj : (S : Set ℂ).Pairwise fun p q => Disjoint (closedBall p ε) (closedBall q ε))
    (hK : ∀ x ∈ closedBall c R, (∀ p ∈ S, ε ≤ dist x p) → x ∈ U ∧ f x ≠ 0) :
    TauCeti.Contour.windingNumber (fun t => f (circleMap c R t)) 0 (2 * Real.pi) 0 =
      ∑ p ∈ S, TauCeti.Contour.windingNumber (fun t => f (circleMap p ε t)) 0 (2 * Real.pi) 0 :=
  sorry

/-! ## Layer 4: counting images -/

/-- 4.1 The image-counting formula and the odd-number theorem: for a lens with a `C²` smooth
potential and `n` point masses of nonzero mass at distinct positions, whose lens map has a
positive definite derivative outside some disc and whose time delay tends to `+∞` at infinity,
a non-caustic source has finitely many images and the images of negative Jacobian outnumber
those of positive Jacobian by `n - 1`; if the masses are positive, there is an image of positive
Jacobian. For `n = 0` the number of images is odd. -/
theorem image_count {n : ℕ} (ψ₀ : ℂ → ℝ) (pos : Fin n → ℂ) (m : Fin n → ℝ) (w : ℂ)
    (hψ : ContDiff ℝ 2 ψ₀) (hpos : Function.Injective pos) (hm : ∀ j, m j ≠ 0)
    (hsub : ∃ R, ∀ z : ℂ, R ≤ ‖z‖ → ∀ v : ℂ, v ≠ 0 →
      0 < inner ℝ (fderiv ℝ (lensMap ψ₀ pos m) z v) v)
    (hcoer : Tendsto (timeDelay ψ₀ pos m w) (cocompact ℂ) atTop)
    (hw : NonCaustic ψ₀ pos m w) :
    (images ψ₀ pos m w).Finite ∧
    (({z | z ∈ images ψ₀ pos m w ∧ lensJacobian ψ₀ pos m z < 0}.ncard : ℤ) =
      {z | z ∈ images ψ₀ pos m w ∧ 0 < lensJacobian ψ₀ pos m z}.ncard + n - 1) ∧
    ((∀ j, 0 < m j) → 0 < {z | z ∈ images ψ₀ pos m w ∧ 0 < lensJacobian ψ₀ pos m z}.ncard) :=
  sorry

/-- 4.2 Witt's bound: `n ≥ 2` point masses of nonzero mass at distinct positions produce at most
`n ^ 2 + 1` images of any source. -/
theorem pointMasses_images_ncard_le {n : ℕ} (hn : 2 ≤ n) (pos : Fin n → ℂ) (m : Fin n → ℝ)
    (hpos : Function.Injective pos) (hm : ∀ j, m j ≠ 0) (w : ℂ) :
    (images 0 pos m w).Finite ∧ (images 0 pos m w).ncard ≤ n ^ 2 + 1 := sorry

/-- 4.3 A non-caustic source of `n` point masses of nonzero mass at distinct positions has
finitely many images, whose number has the parity of `n + 1`; if the masses are positive, there
are at least `n + 1` images. -/
theorem pointMasses_images_lower {n : ℕ} (pos : Fin n → ℂ) (m : Fin n → ℝ)
    (hpos : Function.Injective pos) (hm : ∀ j, m j ≠ 0) (w : ℂ) (hw : NonCaustic 0 pos m w) :
    (images 0 pos m w).Finite ∧ (images 0 pos m w).ncard % 2 = (n + 1) % 2 ∧
      ((∀ j, 0 < m j) → n + 1 ≤ (images 0 pos m w).ncard) := sorry

end TauCetiRoadmap.GravitationalLensing
