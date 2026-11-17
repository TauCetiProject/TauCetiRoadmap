import TauCeti.Analysis.Fourier.Hardy.Basic

/-!
# The cubic Szegő equation: target signatures

The roadmap is `README.md`. This file prototypes the base flow theorem on the
weighted nonnegative Fourier-coefficient carrier. The nonlinear vector field is
the Hardy projection of `|u|²u`; the derivative is taken in circle `L²`, as in
the source's weak `H^{1/2}` Cauchy theory.
-/

noncomputable section

namespace TauCetiRoadmap.CubicSzegoEquation

abbrev CircleL2 := Lp ℂ 2 (AddCircle.haarAddCircle (T := 1))

/-- Weighted nonnegative Fourier coefficients, with the `H^{1/2}` norm. -/
abbrev H12 := lp (fun _ : ℕ => ℂ) 2

/-- Fourier synthesis, where the `n`th coefficient is divided by `√(n+1)`. -/
noncomputable def h12ToHardy : H12 →L[ℂ] TauCeti.HardySpace := by
  sorry

/-- The projected cubic nonlinearity `Π(|u|²u)` on the `H^{1/2}` carrier. -/
noncomputable def szegoVectorField (u : H12) : TauCeti.HardySpace := by
  sorry

/-- A global `H^{1/2}` solution; its equation is differentiated in `L²`. -/
def IsSolution (u : ℝ → H12) (u₀ : H12) : Prop :=
  u 0 = u₀ ∧ Continuous u ∧
    ∀ t, HasDerivAt
      (fun s : ℝ => ((h12ToHardy (u s) : TauCeti.HardySpace) : CircleL2))
      ((-Complex.I : ℂ) •
        ((szegoVectorField (u t) : TauCeti.HardySpace) : CircleL2)) t

/-- **Global well-posedness of the cubic Szegő equation**
(Gérard–Grellier 2010, Theorem 2.1, pp. 768–770). -/
theorem existsUnique_solution (u₀ : H12) :
    ∃! u : ℝ → H12, IsSolution u u₀ := by
  sorry

end TauCetiRoadmap.CubicSzegoEquation
