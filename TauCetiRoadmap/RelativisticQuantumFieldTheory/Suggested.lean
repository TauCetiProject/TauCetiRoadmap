/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.Analysis.PDE.HeatKernel.Basic

/-!
# Relativistic quantum field theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable there, each with `sorry`,
together with the few definitions those statements need.

Stated here:

* Layer 1 (RQFT1): existence and uniqueness of the retarded and advanced solutions of the
  Klein–Gordon equation with causal support; the four massive boundary-value distributions and
  their relations with the two mass-shell distributions; the classification of Lorentz-invariant
  tempered solutions of `(p² − m²)U = 0`.
* Layer 5 (RQFT5): the asymptotic expansion of the zero-dimensional quartic integral, and its
  continuation to the fourfold cover `ζ ↦ ζ⁴` with an essential singularity at `ζ = 0`.
* Layer 6 (RQFT6): the unique extension across the origin of a distribution on `ℝⁿ ∖ {0}` whose
  scaling degree is below `n`.
* Layer 7 (RQFT7): reflection positivity of the free massive Euclidean covariance and the density
  of its one-particle image; the zero-mass limits of the Euclidean Green functions.

Headline theorems that are not statable at the pins, with the carrier each lacks:

* the free scalar, Dirac and photon fields as operator-valued tempered distributions (RQFT3) and
  Shale's implementability theorem with the inequivalence of the regular representations
  (RQFT10): the bosonic and fermionic Fock spaces over a Hilbert space, with their creation,
  annihilation and Weyl operators;
* Reeh–Schlieder, spin–statistics, PCT and the net-to-field comparison (RQFT4), the
  Osterwalder–Schrader reconstruction (RQFT7) and Haag–Ruelle scattering with the LSZ formula
  (RQFT8): a strongly continuous unitary representation of the covering Poincaré group with the
  spectrum condition, and with it a Wightman field or a covariant net of von Neumann algebras on
  Minkowski space;
* the wavefront-controlled extension at partial diagonals, the forest formula and the
  renormalisation group action (RQFT6), and the perturbative QED statements (RQFT9): wavefront
  sets of distributions, and Feynman-graph amplitudes as distributions on configuration space;
* the Connes–Kreimer Hopf algebra of Feynman graphs and its Birkhoff decomposition (RQFT5 and
  RQFT6): the Hopf algebra of graphs with its coproduct;
* the periodic Green function of the Euclidean torus and its zero-mode subtraction (RQFT7):
  distributions on a torus;
* graviton power counting (RQFT11): the formal Einstein–Hilbert jet algebra.
-/

@[expose] public section

noncomputable section

open MeasureTheory Filter TopologicalSpace
open scoped Topology ContDiff ComplexConjugate SchwartzMap Distributions

namespace TauCetiRoadmap.RelativisticQuantumFieldTheory

/-! ## Layer 1: Lorentzian equations and causal Green operators -/

/-- Minkowski space, and its momentum space, as `ℝ⁴` with coordinate `0` the time. -/
abbrev Spacetime := EuclideanSpace ℝ (Fin 4)

/-- Euclidean three-space, the spatial slice and the spatial momentum space. -/
abbrev Spatial := EuclideanSpace ℝ (Fin 3)

/-- The Minkowski quadratic form `q(x) = x₀² − x₁² − x₂² − x₃²` of signature `(+,−,−,−)`. -/
def minkowskiSquare (x : Spacetime) : ℝ := x 0 ^ 2 - x 1 ^ 2 - x 2 ^ 2 - x 3 ^ 2

/-- The Klein–Gordon operator `(□ + m²)u = ∂₀²u − ∂₁²u − ∂₂²u − ∂₃²u + m²u`. -/
def kleinGordon (m : ℝ) (u : Spacetime → ℂ) (x : Spacetime) : ℂ :=
  iteratedFDeriv ℝ 2 u x (fun _ => EuclideanSpace.single 0 1) -
    ∑ i : Fin 3, iteratedFDeriv ℝ 2 u x (fun _ => EuclideanSpace.single i.succ 1) +
    (m : ℂ) ^ 2 * u x

/-- The causal future `J⁺(K)`: the points `x` with `x − y` future-directed causal for some
`y ∈ K`. -/
def causalFuture (K : Set Spacetime) : Set Spacetime :=
  {x | ∃ y ∈ K, y 0 ≤ x 0 ∧ 0 ≤ minkowskiSquare (x - y)}

/-- The causal past `J⁻(K)`: the points `x` with `y − x` future-directed causal for some
`y ∈ K`. -/
def causalPast (K : Set Spacetime) : Set Spacetime :=
  {x | ∃ y ∈ K, x 0 ≤ y 0 ∧ 0 ≤ minkowskiSquare (x - y)}

/-- Retarded solutions of the Klein–Gordon equation: for every mass `m` and every compactly
supported smooth source `f` there is exactly one smooth `u` with `(□ + m²)u = f` whose support
lies in the causal future of the support of `f`. Existence is the future-supported Green operator
of Bär–Ginoux–Pfäffle, Corollary 3.4.3 (their `G₊`, Definition 3.4.1); uniqueness is their
Theorem 3.1.1 applied to the difference of two solutions. -/
theorem existsUnique_retardedSolution (m : ℝ) (f : 𝓓((⊤ : Opens Spacetime), ℂ)) :
    ∃! u : Spacetime → ℂ, ContDiff ℝ ∞ u ∧ kleinGordon m u = ⇑f ∧
      tsupport u ⊆ causalFuture (tsupport f) := by
  sorry

/-- Advanced solutions of the Klein–Gordon equation: for every mass `m` and every compactly
supported smooth source `f` there is exactly one smooth `u` with `(□ + m²)u = f` whose support
lies in the causal past of the support of `f` (Bär–Ginoux–Pfäffle, Corollary 3.4.3 and
Theorem 3.1.1). -/
theorem existsUnique_advancedSolution (m : ℝ) (f : 𝓓((⊤ : Opens Spacetime), ℂ)) :
    ∃! u : Spacetime → ℂ, ContDiff ℝ ∞ u ∧ kleinGordon m u = ⇑f ∧
      tsupport u ⊆ causalPast (tsupport f) := by
  sorry

/-- The mass-shell point `(±ω(k), k)` in angular momentum variables, `ω(k) = √(|k|² + m²)`;
`positive = true` is the upper sheet. -/
def shellPoint (m : ℝ) (positive : Bool) (k : Spatial) : Spacetime :=
  WithLp.toLp 2 (Fin.cases ((if positive then 1 else -1) * Real.sqrt (‖k‖ ^ 2 + m ^ 2)) k)

/-- The mass-shell pairings `D_±(f) = ∫ f(±ω(k), k) d³k / (2ω(k))`, that is
`D_± = 1_(±p⁰>0) δ(p² − m²)`, with no factor `2π`. -/
def shellPairing (m : ℝ) (positive : Bool) (f : 𝓢(Spacetime, ℂ)) : ℂ :=
  ∫ k : Spatial, f (shellPoint m positive k) / ((2 * Real.sqrt (‖k‖ ^ 2 + m ^ 2) : ℝ) : ℂ)

/-- The regularised denominators `(p⁰ + iε)² − ω²`, `(p⁰ − iε)² − ω²`, `p² − m² + iε` and
`p² − m² − iε`, indexed `0, 1, 2, 3` for the retarded, advanced, Feynman and anti-Feynman
prescriptions. -/
def poleDenominator (m : ℝ) (i : Fin 4) (ε : ℝ) (p : Spacetime) : ℂ :=
  let w2 : ℝ := (∑ j : Fin 3, (p j.succ) ^ 2) + m ^ 2
  if i = 0 then ((p 0 : ℂ) + Complex.I * ε) ^ 2 - w2
  else if i = 1 then ((p 0 : ℂ) - Complex.I * ε) ^ 2 - w2
  else if i = 2 then (p 0 : ℂ) ^ 2 - w2 + Complex.I * ε
  else (p 0 : ℂ) ^ 2 - w2 - Complex.I * ε

/-- The regularised momentum-space pairing `f ↦ −∫ f(p) / denominator_ε(p) dp`; the sign makes
the resulting kernels solve `(□ + m²)G = δ` under the transform `∫ exp(iη(p,x)) f(x) dx`. -/
def regularizedPairing (m : ℝ) (i : Fin 4) (ε : ℝ) (f : 𝓢(Spacetime, ℂ)) : ℂ :=
  ∫ p : Spacetime, -(poleDenominator m i ε p)⁻¹ * f p

/-- For `m > 0` the four regularised pairings converge as `ε ↓ 0` to tempered distributions
`G_R`, `G_A`, `G_F`, `G_aF` (README, RQFT1.MassivePrescriptions). -/
theorem exists_prescription_distributions (m : ℝ) (hm : 0 < m) :
    ∃ G : Fin 4 → 𝓢'(Spacetime, ℂ), ∀ i f,
      Tendsto (fun ε => regularizedPairing m i ε f) (𝓝[>] (0 : ℝ)) (𝓝 (G i f)) := by
  sorry

/-- The relations of the four boundary values with the mass-shell distributions:
`G_R + G_A = G_F + G_aF`, `G_F − G_A = 2πi D₊` and `G_F − G_R = 2πi D₋` in momentum space, from
`1/(x ± i0) = PV(1/x) ∓ iπδ(x)` on each sheet. -/
theorem prescription_relations (m : ℝ) (hm : 0 < m) (G : Fin 4 → 𝓢'(Spacetime, ℂ))
    (hG : ∀ i f,
      Tendsto (fun ε => regularizedPairing m i ε f) (𝓝[>] (0 : ℝ)) (𝓝 (G i f))) :
    G 0 + G 1 = G 2 + G 3 ∧
      (∀ f, G 2 f - G 1 f = (2 * Real.pi * Complex.I) * shellPairing m true f) ∧
      (∀ f, G 2 f - G 0 f = (2 * Real.pi * Complex.I) * shellPairing m false f) := by
  sorry

/-- A restricted Lorentz transformation: a linear automorphism of `ℝ⁴` preserving
`minkowskiSquare`, of determinant one, sending the time axis into the future. -/
def IsRestrictedLorentz (Λ : Spacetime ≃L[ℝ] Spacetime) : Prop :=
  (∀ p, minkowskiSquare (Λ p) = minkowskiSquare p) ∧
    LinearMap.det (Λ : Spacetime →ₗ[ℝ] Spacetime) = 1 ∧
    0 < Λ (EuclideanSpace.single 0 1) 0

/-- Classification of the massive invariant solutions: for `m > 0`, a tempered distribution `U`
in momentum space that is invariant under the restricted Lorentz group and annihilates every
test of the form `(p² − m²)f` is `a D₊ + b D₋` for exactly one pair `(a, b)`. For `m = 0` this
fails: `δ₀` is invariant and annihilated by `p²`. -/
theorem existsUnique_shell_decomposition (m : ℝ) (hm : 0 < m) (U : 𝓢'(Spacetime, ℂ))
    (hU : ∀ f g : 𝓢(Spacetime, ℂ),
      (∀ p, g p = ((minkowskiSquare p - m ^ 2 : ℝ) : ℂ) * f p) → U g = 0)
    (hinv : ∀ Λ, IsRestrictedLorentz Λ →
      ∀ f, U (SchwartzMap.compCLMOfContinuousLinearEquiv ℂ Λ f) = U f) :
    ∃! c : ℂ × ℂ, ∀ f, U f = c.1 * shellPairing m true f + c.2 * shellPairing m false f := by
  sorry

/-! ## Layer 5: graph combinatorics, amplitudes and formal perturbation theory -/

/-- The zero-dimensional quartic integral `Z(j, g) = ∫ exp(−φ²/2 − gφ⁴/24 + jφ) dφ`, absolutely
convergent exactly for `Re g ≥ 0` (Borcherds–Barnard, §5, pp. 25–27). -/
def quarticIntegral (j g : ℂ) : ℂ :=
  ∫ φ : ℝ, Complex.exp (-(φ : ℂ) ^ 2 / 2 - g * (φ : ℂ) ^ 4 / 24 + j * φ)

/-- The perturbative coefficients
`aₙ(j) = (−1)ⁿ/(24ⁿ n!) · ∫ φ⁴ⁿ exp(−φ²/2 + jφ) dφ` of the quartic integral; they are entire in
`j`, and `aₙ(0) = (−1)ⁿ √(2π) (4n − 1)!!/(24ⁿ n!)`. -/
def quarticCoefficient (n : ℕ) (j : ℂ) : ℂ :=
  (-1) ^ n / (24 ^ n * (Nat.factorial n : ℂ)) *
    ∫ φ : ℝ, (φ : ℂ) ^ (4 * n) * Complex.exp (-(φ : ℂ) ^ 2 / 2 + j * φ)

/-- The perturbation series of the quartic integral is asymptotic on the closed right half-plane,
with an explicit remainder: for `Re g ≥ 0`, every `j` and every `N`,
`|Z(j,g) − Σ_(n<N) aₙ(j) gⁿ| ≤ |g|^N/(24^N N!) · ∫ φ⁴ᴺ exp(−φ²/2 + Re(j) φ) dφ`.
At `j = 0` the right side is `√(2π) b_N |g|^N` with `bₙ = (4n − 1)!!/(24ⁿ n!)`, and
`b_(n+1)/b_n = (4n+1)(4n+3)/(24(n+1)) → ∞`, so the series has radius of convergence zero
(Borcherds–Barnard, §5, p. 27). -/
theorem norm_quarticIntegral_sub_sum_le (j g : ℂ) (hg : 0 ≤ g.re) (N : ℕ) :
    ‖quarticIntegral j g - ∑ n ∈ Finset.range N, quarticCoefficient n j * g ^ n‖ ≤
      ‖g‖ ^ N / (24 ^ N * (Nat.factorial N : ℝ)) *
        ∫ φ : ℝ, φ ^ (4 * N) * Real.exp (-φ ^ 2 / 2 + j.re * φ) := by
  sorry

/-- The quartic integral on the rotated contour,
`F(ζ, j) = ζ⁻¹ ∫ exp(−t⁴/24 − t²/(2ζ²) + jt/ζ) dt`, defined for `ζ ≠ 0`. -/
def quarticContinuation (ζ j : ℂ) : ℂ :=
  ζ⁻¹ * ∫ t : ℝ, Complex.exp (-(t : ℂ) ^ 4 / 24 - (t : ℂ) ^ 2 / (2 * ζ ^ 2) + j * t / ζ)

/-- The continuation of the quartic integral to the fourfold cover `ζ ↦ g = ζ⁴`: `F(·, j)` is
holomorphic on `ℂ ∖ {0}`, agrees with `Z(j, ζ⁴)` for `ζ > 0`, is odd in `ζ` (so continuation once
around `g = 0` acts as `ζ ↦ iζ` and has order exactly four), and is not meromorphic at `ζ = 0`. -/
theorem quarticContinuation_continuation (j : ℂ) :
    DifferentiableOn ℂ (fun ζ => quarticContinuation ζ j) {0}ᶜ ∧
      (∀ ζ : ℝ, 0 < ζ → quarticContinuation ζ j = quarticIntegral j ((ζ : ℂ) ^ 4)) ∧
      (∀ ζ, quarticContinuation (-ζ) j = -quarticContinuation ζ j) ∧
      ¬ MeromorphicAt (fun ζ => quarticContinuation ζ j) 0 := by
  sorry

/-! ## Layer 6: distribution products, extension and renormalisation -/

/-- `ℝⁿ ∖ {0}`. -/
def puncturedSpace (n : ℕ) : Opens (EuclideanSpace ℝ (Fin n)) :=
  ⟨{0}ᶜ, isOpen_compl_singleton⟩

open scoped Classical in
/-- The dilated real test function `x ↦ f(c⁻¹x)` on an open set `Ω` that `c • ·` maps into
itself, for `c ≠ 0`; it is the zero test otherwise. -/
def dilateTest {n : ℕ} (Ω : Opens (EuclideanSpace ℝ (Fin n))) (c : ℝ) (f : 𝓓(Ω, ℝ)) :
    𝓓(Ω, ℝ) :=
  if h : c ≠ 0 ∧ ∀ x ∈ Ω, c • x ∈ Ω then
    { toFun := fun x => f (c⁻¹ • x)
      contDiff' := f.contDiff.comp (contDiff_const_smul c⁻¹)
      hasCompactSupport' :=
        f.hasCompactSupport.comp_homeomorph (Homeomorph.smulOfNeZero c⁻¹ (inv_ne_zero h.1))
      tsupport_subset' := by
        intro x hx
        have hx' : c⁻¹ • x ∈ tsupport f :=
          tsupport_comp_subset_preimage f (continuous_const_smul c⁻¹) hx
        simpa [smul_inv_smul₀ h.1] using h.2 _ (f.tsupport_subset hx') }
  else 0

/-- A distribution `t` on `Ω ⊆ ℝⁿ` scales below `d` at the origin when
`λ^d t(λ·) → 0` as `λ ↓ 0` in the sense of distributions, that is
`λ^(d − n) t(f(·/λ)) → 0` for every test `f`. The scaling degree of `t` is the infimum of
such `d` (Brunetti–Fredenhagen, §5.1). -/
def ScalesBelow {n : ℕ} (Ω : Opens (EuclideanSpace ℝ (Fin n))) (t : 𝓓'(Ω, ℂ)) (d : ℝ) :
    Prop :=
  ∀ f : 𝓓(Ω, ℝ), Tendsto (fun s : ℝ => ((s ^ (d - n) : ℝ) : ℂ) * t (dilateTest Ω s f))
    (𝓝[>] (0 : ℝ)) (𝓝 0)

/-- Extension across a point: a distribution on `ℝⁿ ∖ {0}` of scaling degree at most `σ < n`
extends to exactly one distribution on `ℝⁿ` of scaling degree at most `σ`
(Brunetti–Fredenhagen, Theorem 5.2). For `σ ≥ n` uniqueness fails by the multiples of the
derivatives `∂^α δ` with `|α| ≤ σ − n`. -/
theorem existsUnique_extension_of_scalesBelow (n : ℕ) (t : 𝓓'(puncturedSpace n, ℂ)) (σ : ℝ)
    (hσ : σ < n) (ht : ∀ d > σ, ScalesBelow (puncturedSpace n) t d) :
    ∃! u : 𝓓'((⊤ : Opens (EuclideanSpace ℝ (Fin n))), ℂ),
      (∀ f : 𝓓(puncturedSpace n, ℝ),
        u (TestFunction.monoCLM ℝ f : 𝓓((⊤ : Opens (EuclideanSpace ℝ (Fin n))), ℝ)) = t f) ∧
      ∀ d > σ, ScalesBelow ⊤ u d := by
  sorry

/-! ## Layer 7: Euclidean continuation and analytic bridges -/

/-- Euclidean Schwartz tests on `ℝ × ℝ³`, the first coordinate the Euclidean time. -/
abbrev EuclideanTest := 𝓢(ℝ × Spatial, ℂ)

/-- The positive-time tests: Schwartz tests vanishing on the closed half-space `t ≤ 0`. -/
def positiveTimeTests : Submodule ℂ EuclideanTest where
  carrier := {f | ∀ z, z.1 ≤ 0 → f z = 0}
  zero_mem' := by simp
  add_mem' := by
    intro f g hf hg z hz
    simp [hf z hz, hg z hz]
  smul_mem' := by
    intro c f hf z hz
    simp [hf z hz]

/-- The massive dispersion `ω(p) = √(|p|² + m²)` in angular momentum `p = 2πξ`. -/
def omega (m : ℝ) (p : Spatial) : ℝ := Real.sqrt (‖p‖ ^ 2 + m ^ 2)

/-- The invariant mass-shell measure `d³p / ((2π)³ 2ω(p))` in its spatial chart. -/
def shellMeasure (m : ℝ) : Measure Spatial :=
  volume.withDensity fun p => ENNReal.ofReal (((2 * Real.pi) ^ 3 * (2 * omega m p))⁻¹)

/-- The scalar one-particle space `L²(d³p / ((2π)³ 2ω(p)))`. -/
abbrev OneParticle (m : ℝ) := Lp ℂ 2 (shellMeasure m)

/-- The spatial Fourier transform `f̃(t, p) = ∫ exp(−i p·x) f(t, x) d³x`. -/
def spatialFourier (f : EuclideanTest) (t : ℝ) (p : Spatial) : ℂ :=
  ∫ x : Spatial, Complex.exp (-(inner ℝ x p : ℂ) * Complex.I) * f (t, x)

/-- The positive-time Laplace transform `K f(p) = ∫_(t>0) exp(−ω(p)t) f̃(t, p) dt`. -/
def laplaceSpatial (m : ℝ) (f : positiveTimeTests) (p : Spatial) : ℂ :=
  ∫ t in Set.Ioi (0 : ℝ), (Real.exp (-omega m p * t) : ℂ) * spatialFourier f.val t p

/-- For `m > 0` the Laplace transform of a positive-time test is square integrable for the
shell measure. -/
theorem memLp_laplaceSpatial (m : ℝ) (hm : 0 < m) (f : positiveTimeTests) :
    MemLp (laplaceSpatial m f) 2 (shellMeasure m) := by
  sorry

/-- The one-particle vector `K f` of a positive-time test. -/
def toOneParticle (m : ℝ) (hm : 0 < m) (f : positiveTimeTests) : OneParticle m :=
  (memLp_laplaceSpatial m hm f).toLp (laplaceSpatial m f)

/-- The massive Euclidean Green function of `−Δ + m²` on `ℝ⁴`, evaluated at the point `(t, x)`
of `ℝ × ℝ³`, in its heat representation `G_m(t, x) = ∫_0^∞ exp(−m²s) Γ_s(t, x) ds` with the
Gaussian heat kernel `Γ_s(y) = (4πs)⁻² exp(−|y|²/(4s))` of `ℝ⁴`. -/
def euclideanGreen (m t : ℝ) (x : Spatial) : ℝ :=
  ∫ s in Set.Ioi (0 : ℝ),
    Real.exp (-m ^ 2 * s) * TauCeti.heatKernel s (WithLp.toLp 2 (Fin.cases t x) : Spacetime)

/-- Reflection positivity of the free massive covariance: for positive-time tests `f, g` and the
time reflection `θ(t, x) = (−t, x)`,
`∫∫ conj(f(x)) G_m(θx − y) g(y) dx dy = ⟨K f, K g⟩` in the one-particle space; in particular the
reflected covariance is positive semidefinite, which is the Osterwalder–Schrader positivity of the
free two-point function. -/
theorem reflectedCovariance_eq_inner (m : ℝ) (hm : 0 < m) (f g : positiveTimeTests) :
    ∫ x : ℝ × Spatial, ∫ y : ℝ × Spatial,
        conj (f.val x) * (euclideanGreen m (-x.1 - y.1) (x.2 - y.2) : ℂ) * g.val y =
      inner ℂ (toOneParticle m hm f) (toOneParticle m hm g) := by
  sorry

/-- The positive-time tests reach a dense subspace of the one-particle space. -/
theorem denseRange_toOneParticle (m : ℝ) (hm : 0 < m) :
    DenseRange (toOneParticle m hm) := by
  sorry

/-- The massive Green function of `−d²/dx² + m²` on the line, `G_m(x) = exp(−m|x|)/(2m)`. -/
def greenOne (m x : ℝ) : ℝ := Real.exp (-m * |x|) / (2 * m)

/-- The Euclidean plane. -/
abbrev Plane := EuclideanSpace ℝ (Fin 2)

/-- The massive Green function of `−Δ + m²` on the plane in its heat representation
`G_m(x) = ∫_0^∞ exp(−m²t) Γ_t(x) dt` with `Γ_t(x) = (4πt)⁻¹ exp(−|x|²/(4t))`; the integral
diverges at `x = 0`, where the value is immaterial to the distribution. -/
def greenTwo (m : ℝ) (x : Plane) : ℝ :=
  ∫ t in Set.Ioi (0 : ℝ), Real.exp (-m ^ 2 * t) * TauCeti.heatKernel t x

/-- The unit vector `(1, 0)` of the plane, the radius fixing the subtraction constant. -/
def unitPoint : Plane := WithLp.toLp 2 ![(1 : ℝ), 0]

/-- Zero-mass limit on the line: `G_m − 1/(2m) → −|x|/2` as `m ↓ 0`, uniformly on every
von Neumann-bounded set of Schwartz tests. -/
theorem greenOne_sub_const_tendstoUniformlyOn
    (s : Set 𝓢(ℝ, ℂ)) (hs : Bornology.IsVonNBounded ℂ s) :
    TendstoUniformlyOn
      (fun m f => ∫ x : ℝ, ((greenOne m x - (2 * m)⁻¹ : ℝ) : ℂ) * f x)
      (fun f => ∫ x : ℝ, ((-|x| / 2 : ℝ) : ℂ) * f x)
      (𝓝[>] (0 : ℝ)) s := by
  sorry

/-- Zero-mass limit on the plane: `G_m − G_m(e) → −log|x|/(2π)` as `m ↓ 0` for a unit vector
`e`, uniformly on every von Neumann-bounded set of Schwartz tests. -/
theorem greenTwo_sub_const_tendstoUniformlyOn
    (s : Set 𝓢(Plane, ℂ)) (hs : Bornology.IsVonNBounded ℂ s) :
    TendstoUniformlyOn
      (fun m f => ∫ x : Plane, ((greenTwo m x - greenTwo m unitPoint : ℝ) : ℂ) * f x)
      (fun f => ∫ x : Plane, ((-Real.log ‖x‖ / (2 * Real.pi) : ℝ) : ℂ) * f x)
      (𝓝[>] (0 : ℝ)) s := by
  sorry

/-- Zero-mass limit in dimension `n ≥ 3`, with no subtraction: in Mathlib's Fourier variable the
multipliers `(4π²|ξ|² + m²)⁻¹` converge to `(4π²|ξ|²)⁻¹` as `m ↓ 0`, uniformly on every
von Neumann-bounded set of Schwartz tests. -/
theorem multiplier_tendstoUniformlyOn {n : ℕ} (hn : 3 ≤ n)
    (s : Set 𝓢(EuclideanSpace ℝ (Fin n), ℂ)) (hs : Bornology.IsVonNBounded ℂ s) :
    TendstoUniformlyOn
      (fun m f => ∫ ξ : EuclideanSpace ℝ (Fin n),
        (((4 * Real.pi ^ 2 * ‖ξ‖ ^ 2 + m ^ 2)⁻¹ : ℝ) : ℂ) * f ξ)
      (fun f => ∫ ξ : EuclideanSpace ℝ (Fin n),
        (((4 * Real.pi ^ 2 * ‖ξ‖ ^ 2)⁻¹ : ℝ) : ℂ) * f ξ)
      (𝓝[>] (0 : ℝ)) s := by
  sorry

end TauCetiRoadmap.RelativisticQuantumFieldTheory
