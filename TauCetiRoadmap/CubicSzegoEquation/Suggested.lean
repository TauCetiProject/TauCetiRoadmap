import Mathlib
import TauCeti.Analysis.Fourier.Hardy.Basic

/-!
# The cubic Szegő equation: target signatures

The roadmap is `README.md`. This file states the roadmap's headline theorems against the pinned
Mathlib and Tau Ceti, each with `sorry`, with only the definitions they need: the weighted
`H^(1/2)` condition on the Hardy space, the cubic vector field by Fourier coefficients (so that no
product in `L²` has to be formed), and the notion of solution, differentiated in circle `L²`.

Stated here:

* README 1.1, 2.3: `IsH12`, `h12NormSq`, `IsSolution` and `existsUnique_solution`, the global
  well-posedness theorem in `H^(1/2)`; `h12NormSq_solution`, the conservation of `Q + M`;
* README 3.2: `hankel_summable_sq`, the Hilbert–Schmidt identity of the Hankel matrix;
* README 5.3: `norm_growth`, the Sobolev norm growth of the data `z + ε`.

Not stated:

* README 3.1, 3.3, 3.4, the antilinear Hankel operator `H_u`, its Lax equation and the invariants
  `J_n`, lacking a real-linear Hankel operator on `H²` at the pins: `TauCeti.hankel` is
  complex-linear with negative-frequency codomain;
* README 4.1–4.3, the finite-rank manifolds `M(N)` and the integrable hierarchy, and README 5.1–5.2,
  the explicit flow on `M̃(1)`, lacking the rational-symbol manifolds `M(N)` and the Hankel
  operator above.
-/

open MeasureTheory
open scoped Real

noncomputable section

namespace TauCetiRoadmap.CubicSzegoEquation

/-- Circle `L²` for the normalised Haar measure on `ℝ / ℤ`. -/
abbrev CircleL2 := Lp ℂ 2 (AddCircle.haarAddCircle (T := 1))

/-- The series `∑ₙ (n + 1) |û(n)|²` of the Hardy coefficients of `u` converges: `u ∈ H^(1/2)`. -/
def IsH12 (u : TauCeti.HardySpace) : Prop :=
  Summable fun n : ℕ => ((n : ℝ) + 1) * ‖TauCeti.hardyBasis.repr u n‖ ^ 2

/-- The value `∑ₙ (n + 1) |û(n)|² = Q(u) + M(u)` of the series defining `IsH12`. -/
def h12NormSq (u : TauCeti.HardySpace) : ℝ :=
  ∑' n : ℕ, ((n : ℝ) + 1) * ‖TauCeti.hardyBasis.repr u n‖ ^ 2

/-- `v` is the Hardy projection of `|u|² u`, stated as the equality of all Fourier coefficients of
`|u|² u` and `v`. -/
def IsCubicField (u v : TauCeti.HardySpace) : Prop :=
  ∀ n : ℕ,
    fourierCoeff
        (fun t => ((‖(u : CircleL2) t‖ ^ 2 : ℝ) : ℂ) * (u : CircleL2) t) (n : ℤ) =
      fourierCoeff (v : CircleL2) (n : ℤ)

/-- A global `H^(1/2)` solution of `i ∂ₜ u = Π(|u|² u)` with datum `u₀`: continuous in the
`H^(1/2)` norm, with the equation differentiated in circle `L²`. -/
def IsSolution (u : ℝ → TauCeti.HardySpace) (u₀ : TauCeti.HardySpace) : Prop :=
  u 0 = u₀ ∧ (∀ t, IsH12 (u t)) ∧
    (∀ t, Filter.Tendsto (fun s => h12NormSq (u s - u t)) (nhds t) (nhds 0)) ∧
    ∀ t, ∃ v, IsCubicField (u t) v ∧
      HasDerivAt (fun s : ℝ => (u s : CircleL2)) ((-Complex.I) • (v : CircleL2)) t

/-- **Global well-posedness of the cubic Szegő equation** in `H^(1/2)`: every `u₀ ∈ H^(1/2)₊` has a
unique global solution (Gérard–Grellier 2010, Theorem 2.1, pp. 768–770). -/
theorem existsUnique_solution (u₀ : TauCeti.HardySpace) (h : IsH12 u₀) :
    ∃! u : ℝ → TauCeti.HardySpace, IsSolution u u₀ := by
  sorry

/-- **Conservation of `Q + M`**, the square of the `H^(1/2)` norm, along a global solution
(Gérard–Grellier 2010, §2). -/
theorem h12NormSq_solution {u : ℝ → TauCeti.HardySpace} {u₀ : TauCeti.HardySpace}
    (h : IsSolution u u₀) (t : ℝ) : h12NormSq (u t) = h12NormSq u₀ := by
  sorry

/-- **The Hilbert–Schmidt identity** for the Hankel matrix `û(j + k)`: its squared entries are
summable with sum `Q(u) + M(u)` (Gérard–Grellier 2010, Theorem 3.1, pp. 770–772). -/
theorem hankel_summable_sq {u : TauCeti.HardySpace} (h : IsH12 u) :
    Summable (fun p : ℕ × ℕ => ‖TauCeti.hardyBasis.repr u (p.1 + p.2)‖ ^ 2) ∧
      ∑' p : ℕ × ℕ, ‖TauCeti.hardyBasis.repr u (p.1 + p.2)‖ ^ 2 = h12NormSq u := by
  sorry

/-- **Sobolev norm growth** for the data `z + ε`: for every `s > 1/2` there are `K > 0` and
`ε₀ > 0` such that at the times `π / (ε √(4 + ε²))` the `H^s` norm of the solution is at least
`K` times the time to the power `2s − 1` (Gérard–Grellier 2010, Theorem 1.3, pp. 766–767). -/
theorem norm_growth (s : ℝ) (hs : 1 / 2 < s) :
    ∃ K > 0, ∃ ε₀ > 0, ∀ ε : ℝ, 0 < ε → ε < ε₀ →
      ∀ u : ℝ → TauCeti.HardySpace,
        IsSolution u (TauCeti.hardyBasis 1 + (ε : ℂ) • TauCeti.hardyBasis 0) →
          K * (π / (ε * Real.sqrt (4 + ε ^ 2))) ^ (2 * s - 1) ≤
            Real.sqrt (∑' n : ℕ, ((n : ℝ) + 1) ^ (2 * s) *
              ‖TauCeti.hardyBasis.repr (u (π / (ε * Real.sqrt (4 + ε ^ 2)))) n‖ ^ 2) := by
  sorry

end TauCetiRoadmap.CubicSzegoEquation
