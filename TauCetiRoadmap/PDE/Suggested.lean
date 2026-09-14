import Mathlib

/-!
# Partial differential equations: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap, the build lanes (A–F), and the acceptance criteria are in
`README.md`. Mathlib already carries a substantial prerequisite stack: distributions and
test functions, the Schwartz space, the Fourier transform, convolution and mollifiers,
the Gagliardo–Nirenberg–Sobolev inequality, the **Bessel-potential** Sobolev scale
(`TemperedDistribution.memSobolev`), the Laplacian and harmonic-function theory,
**Lax–Milgram** (`InnerProductSpace.continuousLinearEquivOfBilin`), the **Fredholm
alternative** for compact operators, and the spectral theorem for symmetric operators.

What is missing is the PDE theory on top: weak-derivative Sobolev spaces `W^{k,p}(Ω)` on
a domain with their embedding/trace/compactness package (Lane A), the harmonic-analysis
estimates (Lane B), maximum principles and potential theory (Lane C), elliptic existence
via the energy method (Lane D), elliptic regularity (Schauder and De Giorgi–Nash–Moser;
Lane E), and parabolic/evolution equations (Lane F). Lane E itself has two deliberately
separate tracks: divergence-form weak solutions (`H²` under Lipschitz coefficients,
Meyers/VMO `W^{1,p}`, `C^{1,β}` Schauder for `a, F ∈ C^{0,α}` and `f ∈ L^q`, `q > n`,
with `β = min(α, 1 - n/q)`, and De Giorgi–Nash–Moser), and
non-divergence-form strong/classical solutions (ABP/Krylov–Safonov, `C^{2,α}` Schauder,
and VMO `W^{2,p}`). These live in
`TauCeti/Analysis/PDE/`, with supporting theories under `TauCeti/Analysis/Sobolev/` and
`TauCeti/Analysis/HarmonicAnalysis/`.

De Giorgi–Nash–Moser and Krylov–Safonov are scalar theories. The smoother-coefficient
items have systems analogues under the appropriate systems ellipticity hypotheses, so
their eventual APIs should not block vector-valued generalization even though v1 is scalar.

As each lane makes the next lane's *types* expressible in `TauCeti/`, state that lane's
milestones here with `sorry` (human-owned roadmap territory, so `sorry` is allowed). The
natural first targets, in order:

* Lane A: `Wkp k p Ω` (weak-derivative Sobolev space) is complete; Meyers–Serrin `H = W`;
  Poincaré on `Wkp0 1 p Ω`; Rellich–Kondrachov compactness `W^{1,p}(Ω) ↪↪ L^p(Ω)`.
* Lane D: existence and uniqueness of the weak solution of `−Δu = f`, `u|∂Ω = 0`, on a
  bounded domain, via `IsCoercive` + `continuousLinearEquivOfBilin` (Lax–Milgram).
* Lane E: De Giorgi–Nash–Moser, showing that a weak `H¹` solution of the *homogeneous*
  divergence-form equation with bounded measurable, not necessarily symmetric coefficients
  has a locally Hölder continuous representative. Port and reconcile Armstrong–Kempe's
  existing `DeGiorgi` formalization rather than rebuilding this theorem from scratch. Keep
  this divergence v1 milestone distinct from the non-divergence track: bounded measurable
  coefficients with `f ∈ L^n_loc` there lead to Krylov–Safonov for `W^{2,n}_loc` strong
  solutions, `C^{0,α}` coefficients and `C^{0,α}` data to Schauder `C^{2,α}`, and VMO
  coefficients with `f ∈ Lᵖ` to interior `W^{2,p}`, `1 < p < ∞`.

The intended uniform-ellipticity predicate must support non-symmetric coefficient fields.
With explicit constants `0 < λ ≤ Λ`, its primitive almost-everywhere conditions are
`ξ · a(x)ξ ≥ λ‖ξ‖²` and `ξ · a(x)⁻¹ξ ≥ Λ⁻¹‖ξ‖²`. The familiar Loewner inequality
`λI ≤ a(x) ≤ ΛI` is equivalent only in the symmetric case. Mixed bilinear and operator-norm
upper bounds should be derived with the same `Λ`, not used as a primitive replacement that
changes constants. The alternative formulation, coercivity plus `‖a(x)‖ ≤ M`, is a genuinely
different hypothesis at fixed constants: it is implied by the inverse form with the same
constants, and implies it only as `(λ, M²/λ)`. Carry both conversions. Every quantitative
target must expose its dependence on `λ, Λ` (or the normalized ratio `Λ / λ`).

Lane E's statement carries three conditions that are easy to drop and false to omit. The
constant depends on the solution, not only on `n, λ, Λ` and the geometry: `u ↦ M u` maps
solutions to solutions and scales the Hölder seminorm, so a purely structural constant is
refuted by `u_M = M x₁`. The exponent is an `ℝ≥0` with `0 < α ≤ 1`, since `HolderOnWith`
takes `ℝ≥0` and an exponent above 1 forces a function on a connected set to be constant.
And the conclusion is about a representative: a weak `H¹` solution is an a.e. equivalence
class, so `HolderOnWith … u K` is false for a badly chosen representative, and the target
is `∃ v, v =ᵐ u ∧ HolderOnWith … v K`.

The first end-to-end milestone (Lane D.17) is the shortest path to a genuine PDE existence
theorem, because Lax–Milgram is already in Mathlib; it only awaits `Wkp0` and Poincaré
from Lane A.
-/

namespace TauCetiRoadmap.PDE

-- (no compiled targets yet; see README.md)

end TauCetiRoadmap.PDE
