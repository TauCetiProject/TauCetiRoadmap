module

public import Mathlib

/-!
# Probabilistic, metric and ergodic number theory, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each with `sorry`, together with the few
definitions they need: the ordered projective simplex in chart coordinates (`orderedSimplex`), the
accelerated branches (`branchDenom`, `branchMap`), chronological words with their maps, delays and
renewal count (`wordMap`, `wordDelay`, `wordCount`), a pointwise C¹ bound on the simplex
(`C1BoundedOn`), the pointwise countable-branch transfer operator (`transferOp`) and the
eigenprobability predicate (`IsEigenprobability`).

Chart conventions: for `n ≥ 3` put `d = n - 2`; a point of the ordered simplex is
`x : Fin d → ℝ` with `x i = w_{i+1}` and `w_{d+1} = 1 - ∑ i, x i`; the letter `(A, j)` with
`j : Fin d` is the accelerated branch `γ_{n-1}^A γ_{j+1}`.

Stated headlines: eventual uniform contraction of the branches, Schauder–Tychonoff, Birkhoff's
cone contraction, Hennion's essential-radius bound, the Ruelle–Perron–Frobenius theorem with a C¹
gap and its version uniform on compact parameter intervals, analytic perturbation of simple
isolated eigenvalues, Wielandt separation, the pressure, the uniform renewal Tauberian theorem,
the uniform counting theorem, the conformal exponent, the explicit `n = 3` eigenprobability and
counting asymptotic, the p-series enclosure of the exponent and its monotonicity in `n`.

The Banach space `C¹(Δ; ℂ)` of jets, on which the transfer operators act as bounded operators, is
a Layer 0 construction of the roadmap and is not a carrier at the pins. The spectral gap of the
Ruelle–Perron–Frobenius theorem, its uniform version on compact parameter intervals and
Wielandt's separation are therefore stated in their equivalent forms, as exponential decay of
iterates in the pointwise C¹ bound on native `ContDiffOn` functions, the constants of the uniform
version being quantified before the parameter. The following headlines need that carrier as an
operator space and are not statable at the pins: holomorphy of `s ↦ L_s` in operator norm on
`C¹(Δ; ℂ)`, the uniform separation of the non-leading spectrum of `L_σ` from `λ_σ` on compact
parameter intervals together with the holomorphic continuation of the eigendata off the real
axis, and the meromorphic continuation of the renewal transform with its simple pole, each valued
in operators on, or elements of, `C¹(Δ; ℂ)`. The Rauzy gasket comparison
is not statable either: it needs the closed coding attractor and the attractor of the Rauzy
iterated function system, whose existence as compact sets is itself a theorem of the roadmap.
-/
@[expose] public section

noncomputable section

open MeasureTheory Filter Set Topology
open scoped ENNReal NNReal

namespace TauCetiRoadmap.ProbabilisticAndMetricNumberTheoryPartII

/-! ## Layer 0: Affine carriers and branch counting -/

/-- The ordered projective simplex `Δ_{d+2}` in chart coordinates: `x i = w_{i+1}` for
`i < d` and `w_{d+1} = 1 - ∑ x`, with `0 ≤ w₁ ≤ ⋯ ≤ w_d ≤ w_{d+1}`
(Gamburd–Magee–Ronan 2019, (1.5) and §5.1). -/
def orderedSimplex (d : ℕ) : Set (Fin d → ℝ) :=
  {x | (∀ i, 0 ≤ x i) ∧ Monotone x ∧ ∀ i, x i ≤ 1 - ∑ k, x k}

/-- The denominator `q_a(w) = 1 + (A + 1)(1 - w_j)` of the accelerated branch
`a = (A, j)`, the last homogeneous coordinate of `γ_{n-1}^A γ_j (w, 1)`
(Gamburd–Magee–Ronan 2019, Lemma 33, (4.6)). -/
def branchDenom {d : ℕ} (a : ℕ × Fin d) (x : Fin d → ℝ) : ℝ :=
  1 + ((a.1 : ℝ) + 1) * (1 - x a.2)

/-- The accelerated branch `F_a` in chart coordinates: delete `w_j` from `(w₁, …, w_{d+1})`
and divide by `q_a(w)`; the deleted slot is filled by the last coordinate
`(1 + A (1 - w_j)) / q_a(w)`, which is not a chart coordinate
(Gamburd–Magee–Ronan 2019, Lemma 33, (4.5)). -/
def branchMap {d : ℕ} (a : ℕ × Fin d) (x : Fin d → ℝ) : Fin d → ℝ :=
  fun i => (Fin.snoc (α := fun _ => ℝ) x (1 - ∑ k, x k) ((Fin.castSucc a.2).succAbove i)) /
    branchDenom a x

/-- The map `F_u` of a word read chronologically: the first letter acts first,
`F_{a :: u} = F_u ∘ F_a`, and the empty word acts as the identity. -/
def wordMap {d : ℕ} : List (ℕ × Fin d) → (Fin d → ℝ) → (Fin d → ℝ)
  | [], x => x
  | a :: u, x => wordMap u (branchMap a x)

/-- The delay of a word read chronologically: the first letter acts first, and
`T_{a :: u}(w) = log q_a(w) + T_u(F_a w)`; the empty word has delay `0`. -/
def wordDelay {d : ℕ} : List (ℕ × Fin d) → (Fin d → ℝ) → ℝ
  | [], _ => 0
  | a :: u, x => Real.log (branchDenom a x) + wordDelay u (branchMap a x)

/-- The renewal count `N(w, r)`: the number of words, the empty word included, whose delay
at `w` is at most `r` (Gamburd–Magee–Ronan 2019, (1.7)). -/
def wordCount (d : ℕ) (x : Fin d → ℝ) (r : ℝ) : ℕ :=
  {u : List (ℕ × Fin d) | wordDelay u x ≤ r}.ncard

/-- A pointwise C¹ bound on the simplex: `f` is `C¹` on `Δ` and `‖f x‖ + ‖D f(x)‖ ≤ K`
at every point of `Δ`, the derivative taken within `Δ`. -/
def C1BoundedOn (d : ℕ) (f : (Fin d → ℝ) → ℂ) (K : ℝ) : Prop :=
  ContDiffOn ℝ 1 f (orderedSimplex d) ∧
    ∀ x ∈ orderedSimplex d, ‖f x‖ + ‖fderivWithin ℝ f (orderedSimplex d) x‖ ≤ K

/-! ## Layer 1: Explicit contraction and the coding attractor -/

/-- **Eventual uniform contraction.** For `d ≥ 1` there are `D ≥ 1` and `0 < ρ < 1` such that
the derivative within the simplex of every word map `F_u` has operator norm at most `D ρ^{|u|}`
at every point of the simplex (Gamburd–Magee–Ronan 2019, Proposition 45 and Lemma 48). -/
theorem eventual_contraction (d : ℕ) (hd : 1 ≤ d) :
    ∃ D ρ : ℝ, 1 ≤ D ∧ 0 < ρ ∧ ρ < 1 ∧ ∀ (u : List (ℕ × Fin d)), ∀ x ∈ orderedSimplex d,
      ‖fderivWithin ℝ (wordMap u) (orderedSimplex d) x‖ ≤ D * ρ ^ u.length := by
  sorry

/-! ## Layer 2: Transfer operators and convergent transforms -/

/-- The countable-branch transfer operator
`L_s f(w) = ∑_a q_a(w)^{-s} f(F_a w)`, with the positive-base complex power
`q^{-s} = exp(-s log q)` (Gamburd–Magee–Ronan 2019, (4.3), (4.7)). -/
def transferOp (d : ℕ) (s : ℂ) (f : (Fin d → ℝ) → ℂ) (x : Fin d → ℝ) : ℂ :=
  ∑' a : ℕ × Fin d, ((branchDenom a x : ℂ) ^ (-s)) * f (branchMap a x)

/-! ## Layer 3: Fixed points, cones and spectral decomposition -/

/-- An eigenprobability of `L_σ` with eigenvalue `c`: a Borel probability measure carried by
the simplex with `∫ L_σ f dν = c ∫ f dν` for every continuous `f`. For `c = 1` this is a
`σ`-conformal probability (Gamburd–Magee–Ronan 2019, Corollary 36 and Theorem 10). -/
def IsEigenprobability (d : ℕ) (σ c : ℝ) (ν : Measure (Fin d → ℝ)) : Prop :=
  IsProbabilityMeasure ν ∧ ν (orderedSimplex d)ᶜ = 0 ∧
    ∀ f : C(Fin d → ℝ, ℂ), ∫ x, transferOp d σ f x ∂ν = c * ∫ x, f x ∂ν

/-- **Schauder–Tychonoff.** A continuous self-map of a nonempty compact convex subset of a
Hausdorff locally convex real topological vector space has a fixed point
(Morris–Noussair 1975, Theorem 2.6). -/
theorem schauder_tychonoff {V : Type*} [AddCommGroup V] [Module ℝ V] [TopologicalSpace V]
    [IsTopologicalAddGroup V] [ContinuousSMul ℝ V] [LocallyConvexSpace ℝ V] [T2Space V]
    {C : Set V} (hne : C.Nonempty) (hcpt : IsCompact C) (hconv : Convex ℝ C)
    {f : V → V} (hf : ContinuousOn f C) (hmaps : MapsTo f C C) :
    ∃ x ∈ C, f x = x := by
  sorry

/-- **Birkhoff's contraction theorem**, in order-bound form. Let `C₁, C₂` be salient convex
cones in real vector spaces and `T` a linear map with `T(C₁) ⊆ C₂` satisfying the order bound:
any two images `T f`, `T g` of nonzero elements of `C₁` are comparable, `a • T f ≤ T g ≤ b • T f`
with `a > 0` and `log (b / a) ≤ Δ`. When `T` sends nonzero elements to nonzero elements this is
the Hilbert diameter bound `diam T(C₁ ∖ {0}) ≤ Δ`; the zero map satisfies it too. If
`a f ≤ g ≤ b f` in `C₁` with `a > 0` and `f ≠ 0`, then `a' T f ≤ T g ≤ b' T f` with `a' > 0` and
`log (b' / a') ≤ tanh (Δ / 4) log (b / a)`; taking infima over `a`, `b` gives the Hilbert-distance
contraction where the distance is defined (Liverani 1995, Theorem 1.1). -/
theorem birkhoff_contraction {V W : Type*} [AddCommGroup V] [Module ℝ V] [AddCommGroup W]
    [Module ℝ W] (C₁ : PointedCone ℝ V) (C₂ : PointedCone ℝ W)
    (hC₁ : ∀ x ∈ C₁, -x ∈ C₁ → x = 0) (hC₂ : ∀ x ∈ C₂, -x ∈ C₂ → x = 0)
    (T : V →ₗ[ℝ] W) (hT : ∀ f ∈ C₁, T f ∈ C₂) {Δ : ℝ} (hΔ₀ : 0 ≤ Δ)
    (hΔ : ∀ f ∈ C₁, ∀ g ∈ C₁, f ≠ 0 → g ≠ 0 → ∃ a b : ℝ, 0 < a ∧
      T g - a • T f ∈ C₂ ∧ b • T f - T g ∈ C₂ ∧ Real.log (b / a) ≤ Δ)
    {f g : V} (hf : f ∈ C₁) (hf₀ : f ≠ 0) {a b : ℝ} (ha : 0 < a)
    (hga : g - a • f ∈ C₁) (hgb : b • f - g ∈ C₁) :
    ∃ a' b' : ℝ, 0 < a' ∧ T g - a' • T f ∈ C₂ ∧ b' • T f - T g ∈ C₂ ∧
      Real.log (b' / a') ≤ Real.tanh (Δ / 4) * Real.log (b / a) := by
  sorry

/-- **Essential spectral radius from a two-norm inequality** (Hennion). Let `p` be a seminorm
on a complex Banach space `B` and `T` a bounded operator such that `T` maps the unit ball to a
`p`-precompact set, `T` is `p`-bounded, and `‖T^k f‖ ≤ R p(f) + r^k ‖f‖` for some `k ≥ 1`.
Then every spectral value of modulus `> r` is an isolated point of the spectrum and an
eigenvalue with finite-dimensional generalised eigenspace, and only finitely many spectral
values have modulus `≥ t` for each `t > r` (Hennion 1995, Théorème 3.1, Corollaire 5.2,
Proposition 3.1). -/
theorem hennion_essential_radius {B : Type*} [NormedAddCommGroup B] [NormedSpace ℂ B]
    [CompleteSpace B] (T : B →L[ℂ] B) (p : Seminorm ℂ B)
    (hcpt : ∀ ε > 0, ∃ t : Finset B, T '' Metric.closedBall 0 1 ⊆ ⋃ g ∈ t, p.ball g ε)
    (hweak : ∃ M : ℝ, ∀ f, p (T f) ≤ M * p f)
    {k : ℕ} (hk : 1 ≤ k) {r R : ℝ} (hr : 0 ≤ r)
    (hLY : ∀ f, ‖(T ^ k) f‖ ≤ R * p f + r ^ k * ‖f‖) :
    (∀ z ∈ spectrum ℂ T, r < ‖z‖ →
      Module.End.HasEigenvalue (T : Module.End ℂ B) z ∧
      FiniteDimensional ℂ (Module.End.maxGenEigenspace (T : Module.End ℂ B) z) ∧
      ∃ ε > 0, Metric.ball z ε ∩ spectrum ℂ T = {z}) ∧
    ∀ t : ℝ, r < t → {z ∈ spectrum ℂ T | t ≤ ‖z‖}.Finite := by
  sorry

/-- **Ruelle–Perron–Frobenius with a C¹ spectral gap.** For `d ≥ 1` and real `σ > 1` there are
`c > 0`, a positive `C¹` eigenfunction `h` and a unique eigenprobability `ν` with
`ν h = 1`, and `c⁻ᵐ L_σ^m f` converges to `h ∫ f dν` exponentially fast in the `C¹` bound,
uniformly for `C¹`-bounded `f` (Gamburd–Magee–Ronan 2019, Theorem 39). -/
theorem ruelle_perron_frobenius (d : ℕ) (hd : 1 ≤ d) (σ : ℝ) (hσ : 1 < σ) :
    ∃ c : ℝ, 0 < c ∧ ∃ h : (Fin d → ℝ) → ℝ, ∃ ν : Measure (Fin d → ℝ),
      IsEigenprobability d σ c ν ∧
      (∀ μ : Measure (Fin d → ℝ), ∀ c' : ℝ, IsEigenprobability d σ c' μ → μ = ν) ∧
      ContDiffOn ℝ 1 h (orderedSimplex d) ∧ (∀ x ∈ orderedSimplex d, 0 < h x) ∧
      ∫ x, h x ∂ν = 1 ∧
      (∀ x ∈ orderedSimplex d, transferOp d σ (fun y => (h y : ℂ)) x = c * h x) ∧
      ∃ M θ : ℝ, 0 < θ ∧ θ < 1 ∧ ∀ (f : (Fin d → ℝ) → ℂ) (K : ℝ), C1BoundedOn d f K →
        ∀ m : ℕ, C1BoundedOn d
          (fun x => ((c : ℂ) ^ m)⁻¹ * (transferOp d σ)^[m] f x - h x * ∫ y, f y ∂ν)
          (M * θ ^ m * K) := by
  sorry

/-! ## Layer 4: Analytic perturbation and uniform gaps -/

/-- **Analytic perturbation of a simple isolated eigenvalue.** Let `T` be a holomorphic family
of bounded operators on a complex Banach space, and at `z₀` let `λ₀, h₀, φ₀` be eigendata with
`φ₀ h₀ = 1` such that `T z₀ - λ₀` is bijective on `ker φ₀`. Then near `z₀` there are
holomorphic eigendata `λ(z), h(z), φ(z)` extending them, with `φ(z) h(z) = 1`, still simple
isolated, and `λ'(z₀) = φ₀ (T'(z₀) h₀)` (Kloeckner 2019, Definition 1.1 and Propositions
3.1–3.2). -/
theorem simple_eigenvalue_analytic {B : Type*} [NormedAddCommGroup B] [NormedSpace ℂ B]
    [CompleteSpace B] {U : Set ℂ} (hU : IsOpen U) {T : ℂ → B →L[ℂ] B}
    (hT : AnalyticOnNhd ℂ T U) {z₀ : ℂ} (hz₀ : z₀ ∈ U) {ev₀ : ℂ} {h₀ : B} {φ₀ : B →L[ℂ] ℂ}
    (hnorm : φ₀ h₀ = 1) (heig : T z₀ h₀ = ev₀ • h₀) (hdual : φ₀.comp (T z₀) = ev₀ • φ₀)
    (hsimple : BijOn (T z₀ - ev₀ • (1 : B →L[ℂ] B)) (LinearMap.ker (φ₀ : B →ₗ[ℂ] ℂ))
      (LinearMap.ker (φ₀ : B →ₗ[ℂ] ℂ))) :
    ∃ V : Set ℂ, IsOpen V ∧ z₀ ∈ V ∧ V ⊆ U ∧
      ∃ (ev : ℂ → ℂ) (h : ℂ → B) (φ : ℂ → B →L[ℂ] ℂ),
        AnalyticOnNhd ℂ ev V ∧ AnalyticOnNhd ℂ h V ∧ AnalyticOnNhd ℂ φ V ∧
        ev z₀ = ev₀ ∧ h z₀ = h₀ ∧ φ z₀ = φ₀ ∧
        (∀ z ∈ V, T z (h z) = ev z • h z ∧ (φ z).comp (T z) = ev z • φ z ∧
          φ z (h z) = 1 ∧
          BijOn (T z - ev z • (1 : B →L[ℂ] B)) (LinearMap.ker (φ z : B →ₗ[ℂ] ℂ))
            (LinearMap.ker (φ z : B →ₗ[ℂ] ℂ))) ∧
        deriv ev z₀ = φ₀ (deriv T z₀ h₀) := by
  sorry

/-- **Ruelle–Perron–Frobenius, uniform on compact parameter intervals.** For `d ≥ 1` and every
compact interval `[a, b] ⊂ (1, ∞)` there are `M` and `0 < θ < 1`, chosen before `σ`, such that
for every `σ ∈ [a, b]` the data of `ruelle_perron_frobenius` exist with these constants: an
eigenvalue `c > 0`, a positive `C¹` eigenfunction `h` and an eigenprobability `ν` with
`ν h = 1`, and `c⁻ᵐ L_σ^m f` converges to `h ∫ f dν` in the `C¹` bound at the rate `M θ^m`,
uniformly for `C¹`-bounded `f` (Gamburd–Magee–Ronan 2019, Theorem 39(1) and §4.4). -/
theorem uniform_ruelle_perron_frobenius (d : ℕ) (hd : 1 ≤ d) (a b : ℝ) (ha : 1 < a) :
    ∃ M θ : ℝ, 0 < θ ∧ θ < 1 ∧ ∀ σ ∈ Set.Icc a b,
      ∃ c : ℝ, 0 < c ∧ ∃ h : (Fin d → ℝ) → ℝ, ∃ ν : Measure (Fin d → ℝ),
        IsEigenprobability d σ c ν ∧
        ContDiffOn ℝ 1 h (orderedSimplex d) ∧ (∀ x ∈ orderedSimplex d, 0 < h x) ∧
        ∫ x, h x ∂ν = 1 ∧
        (∀ x ∈ orderedSimplex d, transferOp d σ (fun y => (h y : ℂ)) x = c * h x) ∧
        ∀ (f : (Fin d → ℝ) → ℂ) (K : ℝ), C1BoundedOn d f K →
          ∀ m : ℕ, C1BoundedOn d
            (fun x => ((c : ℂ) ^ m)⁻¹ * (transferOp d σ)^[m] f x - h x * ∫ y, f y ∂ν)
            (M * θ ^ m * K) := by
  sorry

/-! ## Layer 5: Non-lattice separation and pressure -/

/-- **Wielandt separation on vertical lines.** If `ν` is an eigenprobability of `L_σ` with
eigenvalue `c` and `t ≠ 0`, the iterates of `L_{σ + i t}` decay in the `C¹` bound at an
exponential rate `θ < c`, uniformly for `C¹`-bounded `f`; equivalently the spectral radius of
`L_{σ+it}` on `C¹(Δ)` is strictly below `λ_σ` (Gamburd–Magee–Ronan 2019, Theorem 41 and
Proposition 42). -/
theorem wielandt_separation (d : ℕ) (hd : 1 ≤ d) {σ t c : ℝ} (hσ : 1 < σ) (ht : t ≠ 0)
    {ν : Measure (Fin d → ℝ)} (hν : IsEigenprobability d σ c ν) :
    ∃ C θ : ℝ, 0 ≤ θ ∧ θ < c ∧ ∀ (f : (Fin d → ℝ) → ℂ) (K : ℝ), C1BoundedOn d f K →
      ∀ m : ℕ, C1BoundedOn d ((transferOp d (σ + t * Complex.I))^[m] f) (C * θ ^ m * K) := by
  sorry

/-- **Pressure.** The leading eigenvalue `σ ↦ λ_σ` is real analytic on `(1, ∞)`, is the
eigenvalue of an eigenprobability, satisfies `λ'_σ ≤ -log(3/2) λ_σ`, tends to `∞` as `σ ↓ 1`
and to `0` as `σ → ∞` (Gamburd–Magee–Ronan 2019, Proposition 43, with the lower p-series
bound). -/
theorem pressure_eigenvalue (d : ℕ) (hd : 1 ≤ d) :
    ∃ ev : ℝ → ℝ, AnalyticOnNhd ℝ ev (Ioi 1) ∧
      (∀ σ : ℝ, 1 < σ → 0 < ev σ ∧ ∃ ν : Measure (Fin d → ℝ), IsEigenprobability d σ (ev σ) ν) ∧
      (∀ σ : ℝ, 1 < σ → deriv ev σ ≤ -Real.log (3 / 2) * ev σ) ∧
      Tendsto ev (𝓝[>] 1) atTop ∧ Tendsto ev atTop (𝓝 0) := by
  sorry

/-! ## Layer 6: Uniform renewal and conformal measures -/

/-- **Uniform renewal Tauberian theorem.** Let `X` be compact, `a > 0`, and let each `α x` be
nonnegative and nondecreasing on `[0, ∞)` with a common bound `α x t ≤ C e^{a t}`. If the
Laplace transforms `F(s)(x) = ∫₀^∞ e^{-st} α x t dt` form a `C(X; ℂ)`-valued holomorphic map on
`Re s > a` and `F(s) - B / (s - a)` has a holomorphic `C(X; ℂ)`-valued germ at every point of
the line `Re s = a`, with `B ∈ C(X; ℝ)`, then `e^{-a r} α x r → B x` uniformly in `x`
(Lalley 1989, Lemma 8.2 and proof of Theorem 1, (8.9)–(8.12)). -/
theorem uniform_renewal_tauberian {X : Type*} [TopologicalSpace X] [CompactSpace X]
    {a : ℝ} (ha : 0 < a) (α : X → ℝ → ℝ)
    (hmono : ∀ x, MonotoneOn (α x) (Ici 0)) (hnonneg : ∀ x t, 0 ≤ t → 0 ≤ α x t)
    (hbound : ∃ C : ℝ, ∀ x t, 0 ≤ t → α x t ≤ C * Real.exp (a * t))
    (F : ℂ → C(X, ℂ)) (B : C(X, ℝ))
    (hF : ∀ s : ℂ, a < s.re → ∀ x,
      ∫ t in Ioi (0 : ℝ), Complex.exp (-s * t) * (α x t : ℂ) = F s x)
    (hhol : AnalyticOnNhd ℂ F {s : ℂ | a < s.re})
    (hpole : ∀ y : ℝ, ∃ ρ > 0, ∃ G : ℂ → C(X, ℂ),
      AnalyticOnNhd ℂ G (Metric.ball ((a : ℂ) + y * Complex.I) ρ) ∧
      ∀ s ∈ Metric.ball ((a : ℂ) + y * Complex.I) ρ, a < s.re →
        F s = G s + (s - a)⁻¹ • (Complex.ofRealCLM : C(ℝ, ℂ)).comp B) :
    TendstoUniformly (fun r x => Real.exp (-(a * r)) * α x r) (fun x => B x) atTop := by
  sorry

/-- **Conformal exponent.** For `d ≥ 1` there is a unique `β > 1` admitting a `β`-conformal
probability on the simplex, and at `β` that probability is unique
(Gamburd–Magee–Ronan 2019, Theorem 10, with the exponent obtained from the pressure). -/
theorem conformal_exponent (d : ℕ) (hd : 1 ≤ d) :
    ∃ β : ℝ, 1 < β ∧ (∃! ν : Measure (Fin d → ℝ), IsEigenprobability d β 1 ν) ∧
      ∀ (s : ℝ) (ν : Measure (Fin d → ℝ)), IsEigenprobability d s 1 ν → s = β := by
  sorry

/-- **Uniform counting theorem.** If `ν` is a `β`-conformal probability, then there is a
positive `C¹` function `B` on the simplex, invariant under `L_β`, with
`N(w, r) / (B(w) e^{β r}) → 1` uniformly in `w ∈ Δ` (Gamburd–Magee–Ronan 2019, Theorem 13 and
(1.8)). -/
theorem uniform_counting (d : ℕ) (hd : 1 ≤ d) {β : ℝ} {ν : Measure (Fin d → ℝ)}
    (hν : IsEigenprobability d β 1 ν) :
    ∃ B : (Fin d → ℝ) → ℝ, ContDiffOn ℝ 1 B (orderedSimplex d) ∧
      (∀ x ∈ orderedSimplex d, 0 < B x) ∧
      (∀ x ∈ orderedSimplex d, transferOp d β (fun y => (B y : ℂ)) x = B x) ∧
      TendstoUniformlyOn (fun r x => (wordCount d x r : ℝ) / (B x * Real.exp (β * r)))
        (fun _ => 1) atTop (orderedSimplex d) := by
  sorry

/-! ## Layer 7: Gauss, Rauzy and exponent comparisons -/

/-- **The exponent for `n = 3` is `2`.** Twice Lebesgue measure on the chart segment
`Δ₃ = [0, 1/2]` is a `2`-conformal probability; by `conformal_exponent`, `β(3) = 2`
(Gamburd–Magee–Ronan 2019, Example 37). -/
theorem eigenprobability_three :
    IsEigenprobability 1 2 1 ((2 : ℝ≥0∞) • volume.restrict (orderedSimplex 1)) := by
  sorry

/-- **The `n = 3` counting asymptotic.** On the chart segment `Δ₃ = [0, 1/2]`,
`N(w, r) / (3 e^{2r} / (π² w₂)) → 1` uniformly, with `w₂ = 1 - w₁`
(Gamburd–Magee–Ronan 2019, Theorem 13 at `n = 3`, with Example 37). -/
theorem counting_three :
    TendstoUniformlyOn
      (fun r (x : Fin 1 → ℝ) =>
        (wordCount 1 x r : ℝ) / (3 / (Real.pi ^ 2 * (1 - x 0)) * Real.exp (2 * r)))
      (fun _ => 1) atTop (orderedSimplex 1) := by
  sorry

/-- **p-series enclosure of the exponent.** A `β`-conformal probability forces
`d ∑_{A ≥ 0} (A + 2)^{-β} ≤ 1 ≤ 2^β d ∑_{A ≥ 0} (A + 3)^{-β}`; for `d = 0` no conformal
probability exists (Gamburd–Magee–Ronan 2019, Lemma 35 and §4.5, with the factor `2^β`). -/
theorem conformal_exponent_pseries (d : ℕ) {β : ℝ} {ν : Measure (Fin d → ℝ)}
    (hν : IsEigenprobability d β 1 ν) :
    (d : ℝ) * ∑' A : ℕ, ((A : ℝ) + 2) ^ (-β) ≤ 1 ∧
      1 ≤ 2 ^ β * (d : ℝ) * ∑' A : ℕ, ((A : ℝ) + 3) ^ (-β) := by
  sorry

/-- **Monotonicity of the exponent.** The conformal exponent for `n + 1` coordinates is at
least the exponent for `n` (Gamburd–Magee–Ronan 2019, Remark 14). -/
theorem conformal_exponent_mono {d : ℕ} {s s' : ℝ} {ν : Measure (Fin d → ℝ)}
    {ν' : Measure (Fin (d + 1) → ℝ)} (hν : IsEigenprobability d s 1 ν)
    (hν' : IsEigenprobability (d + 1) s' 1 ν') : s ≤ s' := by
  sorry

end TauCetiRoadmap.ProbabilisticAndMetricNumberTheoryPartII
