import Mathlib

/-!
# Singular Hermitian metrics and L² methods: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about plurisubharmonic weights with values in `[−∞, ∞)`: upper
semicontinuous functions that satisfy the sub-mean-value inequality on every holomorphic disc,
the mean being taken in `[−∞, ∞)` (0.1), and, on manifolds, about singular hermitian metrics on
holomorphic line bundles, given in local frames by such weights up to null sets, with their
curvature currents (2.1). Neither Mathlib nor Tau Ceti has these carriers at the pins. Mathlib has
upper semicontinuity, `EReal`, `Real.circleAverage` (the Bochner mean of a function with values in a
normed space, which is not the mean in `[−∞, ∞)` of a function taking the value `−∞`),
distributions and test functions, `HilbertBasis`, smooth vector bundles over manifolds modelled
on `ℂⁿ` with their sections (`ContMDiffVectorBundle`, `ContMDiffSection`) and smooth real fibrewise
inner products (`Bundle.ContMDiffRiemannianMetric`); it has no subharmonic or plurisubharmonic
functions. Tau Ceti has `TauCeti.SubharmonicOn` (continuous real functions with the local
sub-mean-value inequality on balls), the Levi form `TauCeti.leviForm` with
`TauCeti.IsStrictlyPlurisubharmonicAt` and `TauCeti.IsManifoldStrictlyPlurisubharmonicAt` (for
smooth functions), the sheaf of holomorphic functions `TauCeti.holomorphicStructureSheaf` of a
complex manifold, the Dolbeault operator `TauCeti.SmoothAlmostComplexStructure.delBar` on smooth
complex-valued forms, and the Green kernel `TauCeti.planarGreenKernelDisk` of a disc. None of
these is a weight that may take the value `−∞`, a metric with such weights, a form with values in a
line bundle, or a weighted `L²` space of forms.

* Demailly's `L²` estimate for singular metrics (8.1; the form 3.5 with an analytic set): on a
  Kähler manifold `(X, ω)` with a smooth plurisubharmonic exhaustion, for a holomorphic line bundle
  `L` with a singular metric `h` whose local weights are quasi-plurisubharmonic and with
  `iΘ_h(L) ≥ εω` as currents for a constant `ε > 0`, every `∂̄`-closed `L`-valued `(n,q)`-form `g`,
  `q ≥ 1`, with `∫|g|²_{h,ω} dV_ω < ∞` is `∂̄u` with `∫|u|²_{h,ω} dV_ω ≤ (1/(qε))∫|g|²_{h,ω} dV_ω`.
  It lacks Kähler forms and the plurisubharmonic exhaustion of a complex manifold,
  plurisubharmonic and quasi-plurisubharmonic functions, singular hermitian metrics with their
  curvature currents and the order on real `(1,1)`-currents, `L`-valued `(p,q)`-forms with their
  weighted `L²` norms, and `∂̄` on them in the sense of distributions.
* Nadel's theorems (6.2, 8.2): the multiplier ideal `J(φ)` of a quasi-plurisubharmonic `φ` is a
  coherent ideal sheaf, and on a weakly pseudoconvex Kähler manifold (for instance a compact one)
  `H^q(X, K_X ⊗ L ⊗ J(h)) = 0` for `q ≥ 1` whenever the weights of `h` are quasi-plurisubharmonic
  and `iΘ_h(L) ≥ εω`. It lacks, besides the carriers of the first headline, coherent ideal sheaves
  of `TauCeti.holomorphicStructureSheaf`, the multiplier ideal sheaf, the canonical bundle, and the
  cohomology of the analytic sheaf `K_X ⊗ L ⊗ J(h)`.
* The Ohsawa–Takegoshi theorem with the optimal constant (4.1; its manifold form 4.2): for a
  bounded planar domain `D ∋ 0`, a pseudoconvex domain `Ω ⊂ ℂ^{n−1} × D`, a plurisubharmonic `φ`
  on `Ω` and `f` holomorphic on `Ω ∩ {z_n = 0}` with `∫|f|²e^{−φ} < ∞`, there is `F` holomorphic
  on `Ω` with `F = f` on `Ω ∩ {z_n = 0}` and `∫_Ω|F|²e^{−φ} ≤ (π/c_D(0)²)∫_{Ω∩H}|f|²e^{−φ}`, where
  `c_D(0)` is the logarithmic capacity of `D` at `0`. It lacks plurisubharmonic functions with
  values in `[−∞, ∞)`, pseudoconvex domains (open sets with a continuous plurisubharmonic
  exhaustion), and the Green function and the logarithmic capacity of a bounded planar domain; the
  manifold form lacks besides the carriers of the first headline.
* Bergman kernels (9.1, 9.2): if `iΘ_h(L) + Ric(ω) ≥ εω` for a singular metric `h` with
  quasi-plurisubharmonic weights on a Kähler manifold that is weakly pseudoconvex (or carries a
  complete Kähler metric off an analytic set where `h` is smooth), then on a chart ball of radius
  `r` with `εr² ≥ C_n` the Bergman density at the centre is at least `c_n r^{−2n} exp(−osc φ)`;
  and for a smooth metric `h` on a compact complex manifold with `c₁(L, h)` positive definite,
  `k^{−n}B_{h^k,dV} → (c₁(L, h)^n/n!)/dV` uniformly. It lacks, besides the carriers of the first
  headline, hermitian metrics on holomorphic line bundles, their Chern forms and the Ricci form,
  the Bergman space of `L²` holomorphic sections with its Bergman density, and volume forms.

The one-variable statements of the roadmap are steps, not headlines: the Suita inequality 4.3
(which lacks, besides the Green function and the logarithmic capacity of a bounded planar domain,
the Bergman kernel of a planar domain), the sub-mean-value comparison 3.7, and the Checks on the
disc. The case of a disc in 4.1 is a weaker statement than the headline, and it is not statable
either: it needs plurisubharmonic weights and pseudoconvex domains.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.SingularHermitianMetricsAndL2Methods

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.SingularHermitianMetricsAndL2Methods
