module

public import Mathlib
public import TauCeti.Analysis.Sobolev.W1p.Zero
public import TauCeti.Analysis.Sobolev.W1p.Restriction
public import TauCeti.Analysis.Sobolev.Wkp.Basic
public import TauCeti.Analysis.PDE.Ellipticity.Basic
public import TauCeti.Analysis.PDE.EnergyForm.Sobolev

/-!
# Partial differential equations: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need: the Lipschitz-domain predicate of Layer 1, the
almost-everywhere inverse-coercive ellipticity predicate of the Conventions, and the
Calderón–Zygmund operator structure of Layer 2. Everything else the roadmap plans, including
every API bullet and every Check, lives in the README.

Headline theorems stated here: Meyers–Serrin density in every order on an arbitrary open set
(§1.2); the Poincaré–Wirtinger inequality on connected bounded Lipschitz domains (§1.5); the
trace theorem with its kernel, the extension operator and Rellich compactness on bounded
Lipschitz domains (§1.6); Calderón–Zygmund `Lᵖ` and weak-`(1,1)` bounds (§2.3); the classical
Hopf boundary-point lemma (§3.2); the Dirichlet problem with an `H¹` lifting and `H⁻¹` forcing
(§4.2); the Fredholm compatibility condition for Gårding forms (§4.3); interior `H²` regularity
for Lipschitz coefficients (§5.1); De Giorgi–Nash–Moser Hölder continuity and the Harnack
inequality in every dimension for non-symmetric inverse-coercive coefficients (§5.4); the
Krylov–Safonov Hölder estimate and Harnack inequality for strong solutions (§5.5); and the
interior Schauder estimate (§5.6). The strong-type maximal inequality of §2.1 is a theorem at
the pin (`TauCeti.lintegral_rpow_maximalFunction_le`) and is not restated.

Headline theorems not statable at the pins, and what each lacks:

* §1.3 (Calderón's agreement of `W^{k,p}(ℝⁿ)` with the Bessel-potential scale for
  `1 < p < ∞`): the identification is statable only through the complex tempered
  distribution attached to a real `Lᵖ` function, whose `H^{k,2}` half exists at the pin; the
  general-`p` statement needs the real Bessel-potential carrier of §1.3.
* §2.1 (the Fefferman–Stein vector-valued inequality), §2.2 (Riesz–Thorin, off-diagonal
  Marcinkiewicz) and §2.3 (Mihlin–Hörmander): a sequence-valued `Lᵖ` function with its square
  function, an operator defined on `L^{p₀} + L^{p₁}`, respectively a Fourier multiplier acting on
  `Lᵖ`, has no carrier at the pins beyond tempered distributions.
* §4.4 (the Dirichlet spectrum): proved at the pin for symmetric coercive forms; its
  remaining targets are Checks and corollaries of §5.1, not new headlines.
* §6.2 (Galerkin existence for parabolic equations) and §6.3 (the heat semigroup and its
  generator on `Lᵖ` and `BUC`): the Bochner Sobolev space `H¹(0,T;V*)` with its embedding
  into `C([0,T];H)`, and a bounded convolution operator on `Lᵖ`, are themselves targets of
  §6.1 and §6.3.
* §6.4–§6.9 (the classical parabolic Schauder isomorphisms): the bundled parabolic Hölder
  spaces are targets of §6.4.
* §7 (dyadic and Besov analysis), §8 (Strichartz estimates) and §9 (quasilinear existence):
  the dyadic blocks, the `L²` Schrödinger and wave propagators, and the `C^{1,1}`-domain
  predicate with its boundary Hölder estimate are all targets of those layers. The stochastic
  programme is PDE, Part II.
-/

@[expose] public section

open MeasureTheory TauCeti TauCeti.PDE TopologicalSpace Metric Filter Set
open scoped ENNReal NNReal InnerProductSpace Matrix

namespace TauCetiRoadmap.PDE

/-! ## Conventions: the inverse-coercive ellipticity predicate -/

/-- Uniform ellipticity in the almost-everywhere inverse-coercive form of the Conventions: on
`Ω`, for almost every `x`, `ξ · a(x)ξ ≥ λ‖ξ‖²` and `ξ · a(x)⁻¹ξ ≥ Λ⁻¹‖ξ‖²` for every `ξ`,
with `0 < λ ≤ Λ`. No symmetry of `a(x)` is assumed. This is the hypothesis of §5.4; it differs
from the pinned pointwise operator-bound predicate `TauCeti.PDE.UniformlyEllipticOn`, whose
upper constant is an operator bound rather than an inverse-coercivity constant. -/
def IsUniformlyEllipticAE {ι : Type*} [Fintype ι] [DecidableEq ι]
    (mu : Measure (EuclideanSpace ℝ ι)) (Ω : Set (EuclideanSpace ℝ ι))
    (a : EuclideanSpace ℝ ι → Matrix ι ι ℝ) (lam Lam : ℝ) : Prop :=
  0 < lam ∧ lam ≤ Lam ∧ ∀ᵐ x ∂(mu.restrict Ω),
    (∀ ξ : EuclideanSpace ℝ ι, lam * ‖ξ‖ ^ 2 ≤ ξ ⬝ᵥ (a x *ᵥ ξ)) ∧
      ∀ ξ : EuclideanSpace ℝ ι, Lam⁻¹ * ‖ξ‖ ^ 2 ≤ ξ ⬝ᵥ ((a x)⁻¹ *ᵥ ξ)

/-! ## Layer 1: function spaces on a domain -/

section Layer1

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E] {mu : Measure E} [mu.IsAddHaarMeasure]

/-- **Meyers–Serrin in every order** (§1.2). On an arbitrary open set `Ω` and for finite `p`,
the elements of `W^{k,p}(Ω)` with a smooth representative on `Ω` are dense
(Evans, *Partial Differential Equations*, §5.3.2, Theorem 2). The order-one case is the pinned
`TauCeti.W1p.dense_contDiffOn_representatives`. -/
theorem dense_contDiffOn_representatives_wkp {p : ℝ≥0∞} [Fact (1 ≤ p)] (hp : p ≠ ⊤)
    (Ω : Opens E) (k : ℕ) :
    Dense {u : Wkp mu Ω p k | ∃ f : E → ℝ,
      ContDiffOn ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) f Ω ∧ (Wkp.value k u : E → ℝ) =ᵐ[mu.restrict Ω] f} := by
  sorry

end Layer1

section LipschitzDomains

variable {n : ℕ}

/-- **Lipschitz domains** (§1.6). An open set `Ω ⊆ ℝ^(n+1)` is a Lipschitz domain when every
frontier point `x` has a rigid chart (a linear isometry `e` applied to `z − x`) in which, inside
the open cylinder of horizontal radius `r` and vertical half-height `h`, `Ω` is exactly the
region strictly above the graph of a Lipschitz function `γ` of the first `n` coordinates. -/
def IsLipschitzDomain (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))) : Prop :=
  ∀ x ∈ frontier Ω,
    ∃ (e : EuclideanSpace ℝ (Fin (n + 1)) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin (n + 1))) (r h : ℝ)
      (K : ℝ≥0) (γ : EuclideanSpace ℝ (Fin n) → ℝ), 0 < r ∧ 0 < h ∧ LipschitzWith K γ ∧
      ∀ z : EuclideanSpace ℝ (Fin (n + 1)),
        ‖(WithLp.toLp 2 fun i : Fin n => e (z - x) (Fin.castSucc i) :
            EuclideanSpace ℝ (Fin n))‖ < r →
        |e (z - x) (Fin.last n)| < h →
        (z ∈ Ω ↔ γ (WithLp.toLp 2 fun i : Fin n => e (z - x) (Fin.castSucc i)) <
          e (z - x) (Fin.last n))

variable {mu : Measure (EuclideanSpace ℝ (Fin (n + 1)))} [mu.IsAddHaarMeasure]
  {p : ℝ≥0∞} [Fact (1 ≤ p)]

/-- **Poincaré–Wirtinger** (§1.5). On a nonempty connected bounded Lipschitz domain and for
finite `p`, every `W^{1,p}` function is within a constant multiple of its gradient's `Lᵖ` norm
of its mean (Evans, §5.8.1, Theorem 1). The constant depends on `Ω` and `p`; the convex and
ball cases are the pinned `TauCeti.W1p.eLpNorm_value_sub_setAverage_le_of_convex` and
`TauCeti.W1p.eLpNorm_value_sub_setAverage_le_of_eq_ball`. -/
theorem exists_poincare_wirtinger (hp : p ≠ ⊤) (Ω : Opens (EuclideanSpace ℝ (Fin (n + 1))))
    (hΩ : IsLipschitzDomain (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    (hb : Bornology.IsBounded (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    (hc : IsConnected (Ω : Set (EuclideanSpace ℝ (Fin (n + 1))))) :
    ∃ C : ℝ≥0, ∀ u : W1p mu Ω p,
      eLpNorm (fun x => W1p.value u x - ⨍ y in (Ω : Set _), W1p.value u y ∂mu) p
        (mu.restrict Ω) ≤ C * ‖W1p.gradient u‖ₑ := by
  sorry

/-- **The trace theorem** (§1.6). On a bounded Lipschitz domain and for finite `p` there is a
bounded trace operator `W^{1,p}(Ω) → Lᵖ(∂Ω, μHE[n])`, with `μHE[n]` the normalized
`n`-dimensional Euclidean Hausdorff measure on the frontier, which agrees with restriction for
functions continuous up to the boundary and whose kernel is exactly `W^{1,p}_0(Ω)`
(Evans, §5.5, Theorems 1 and 2). -/
theorem exists_trace (hp : p ≠ ⊤) (Ω : Opens (EuclideanSpace ℝ (Fin (n + 1))))
    (hΩ : IsLipschitzDomain (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    (hb : Bornology.IsBounded (Ω : Set (EuclideanSpace ℝ (Fin (n + 1))))) :
    ∃ T : W1p mu Ω p →L[ℝ]
        Lp ℝ p ((μHE[n] : Measure (EuclideanSpace ℝ (Fin (n + 1)))).restrict
          (frontier (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))),
      (∀ (u : W1p mu Ω p) (f : EuclideanSpace ℝ (Fin (n + 1)) → ℝ),
        ContinuousOn f (closure (Ω : Set (EuclideanSpace ℝ (Fin (n + 1))))) →
        (W1p.value u : EuclideanSpace ℝ (Fin (n + 1)) → ℝ) =ᵐ[mu.restrict Ω] f →
        (T u : EuclideanSpace ℝ (Fin (n + 1)) → ℝ)
          =ᵐ[(μHE[n] : Measure (EuclideanSpace ℝ (Fin (n + 1)))).restrict
            (frontier (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))] f) ∧
      LinearMap.ker T.toLinearMap = (w1p0Submodule mu Ω p).toSubmodule := by
  sorry

/-- **The extension operator** (§1.6). On a bounded Lipschitz domain there is a bounded linear
extension `W^{1,p}(Ω) → W^{1,p}(ℝ^(n+1))` that is a right inverse of restriction
(Evans, §5.4, Theorem 1, for `C¹` boundaries; Stein, *Singular Integrals*, Chapter VI, §3, for
Lipschitz boundaries). -/
theorem exists_extension (Ω : Opens (EuclideanSpace ℝ (Fin (n + 1))))
    (hΩ : IsLipschitzDomain (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    (hb : Bornology.IsBounded (Ω : Set (EuclideanSpace ℝ (Fin (n + 1))))) :
    ∃ Ext : W1p mu Ω p →L[ℝ] W1p mu ⊤ p, ∀ u, W1p.restrictL le_top (Ext u) = u := by
  sorry

/-- **Rellich–Kondrachov on `W^{1,p}(Ω)`** (§1.6). On a bounded Lipschitz domain the inclusion
`W^{1,p}(Ω) → Lᵖ(Ω)` is compact for every `1 ≤ p ≤ ∞` (Evans, §5.7, Theorem 1, for finite `p`;
the case `p = ∞` through equi-Lipschitz extensions and Arzelà–Ascoli). The zero-boundary case on
a bounded open set is the pinned `TauCeti.W1p0.isCompactOperator_valueL`. -/
theorem isCompactOperator_valueL_of_isLipschitzDomain
    (Ω : Opens (EuclideanSpace ℝ (Fin (n + 1))))
    (hΩ : IsLipschitzDomain (Ω : Set (EuclideanSpace ℝ (Fin (n + 1)))))
    (hb : Bornology.IsBounded (Ω : Set (EuclideanSpace ℝ (Fin (n + 1))))) :
    IsCompactOperator (W1p.valueL : W1p mu Ω p →L[ℝ] Lp ℝ p (mu.restrict Ω)) := by
  sorry

end LipschitzDomains

/-! ## Layer 2: harmonic-analysis estimates -/

section CalderonZygmund

variable {n : ℕ}

/-- **A Calderón–Zygmund operator** on `ℝⁿ` (§2.3): a bounded linear operator on `L²`, with
the `L²` bound part of the data, which off the diagonal is given by integration against a
standard kernel: `‖K(x,y)‖ ≤ A / |x−y|ⁿ`, the Hölder-type smoothness
`‖K(x,y) − K(x,y')‖ + ‖K(y,x) − K(y',x)‖ ≤ A |y−y'|^δ / |x−y|^(n+δ)` for `|y−y'| ≤ |x−y|/2`,
and the representation `Tf(x) = ∫ K(x,y) f(y) dy` for almost every `x` outside a compact set
carrying `f` (Grafakos, *Classical Fourier Analysis*, §5.3; Stein, *Harmonic Analysis*,
Chapter VII, §3). Multiplication by `x` on `ℝ` has kernel `0` off the diagonal and is not
`L²`-bounded, so it is not an instance; the Hilbert transform is. -/
structure CalderonZygmundOperator (n : ℕ) where
  /-- The operator on `L²`. -/
  toL2 : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin n))) →L[ℂ]
    Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin n)))
  /-- The kernel off the diagonal. -/
  kernel : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n) → ℂ
  /-- The kernel constant. -/
  bound : ℝ
  /-- The kernel's Hölder exponent. -/
  exponent : ℝ
  exponent_pos : 0 < exponent
  size : ∀ x y, x ≠ y → ‖kernel x y‖ ≤ bound / dist x y ^ n
  smooth : ∀ x y y', x ≠ y → dist y y' ≤ dist x y / 2 →
    ‖kernel x y - kernel x y'‖ + ‖kernel y x - kernel y' x‖ ≤
      bound * dist y y' ^ exponent / dist x y ^ ((n : ℝ) + exponent)
  repr : ∀ (f : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin n))))
    (S : Set (EuclideanSpace ℝ (Fin n))), IsCompact S →
    (∀ᵐ x ∂(volume : Measure (EuclideanSpace ℝ (Fin n))), x ∉ S → f x = 0) →
    ∀ᵐ x ∂(volume : Measure (EuclideanSpace ℝ (Fin n))), x ∉ S →
      toL2 f x = ∫ y, kernel x y * f y

/-- **Calderón–Zygmund `Lᵖ` bounds** (§2.3). A Calderón–Zygmund operator is bounded on `Lᵖ` for
every `1 < p < ∞`, with a constant depending only on `p`, the dimension, the kernel constants
and the `L²` operator norm (Grafakos, *Classical Fourier Analysis*, Theorem 5.3.3; Stein,
*Harmonic Analysis*, Chapter VII, §3, Theorem 3). -/
theorem CalderonZygmundOperator.eLpNorm_le (T : CalderonZygmundOperator n) {p : ℝ≥0∞}
    (hp1 : 1 < p) (hp : p ≠ ⊤) :
    ∃ C : ℝ≥0, ∀ f : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin n))),
      MemLp f p volume → eLpNorm (T.toL2 f) p volume ≤ C * eLpNorm f p volume := by
  sorry

/-- **The weak-`(1,1)` endpoint** (§2.3): a Calderón–Zygmund operator satisfies
`t · |{|Tf| > t}| ≤ C ‖f‖₁` (same sources as `CalderonZygmundOperator.eLpNorm_le`). It is not
bounded on `L¹`. -/
theorem CalderonZygmundOperator.weakType_one (T : CalderonZygmundOperator n) :
    ∃ C : ℝ≥0, ∀ (f : Lp ℂ 2 (volume : Measure (EuclideanSpace ℝ (Fin n)))) (t : ℝ≥0∞),
      t * volume {x | t < ‖T.toL2 f x‖ₑ} ≤ C * eLpNorm f 1 volume := by
  sorry

end CalderonZygmund

/-! ## Layer 3: maximum principles and potential theory -/

section Layer3

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- **The classical Hopf boundary-point lemma** (§3.2), in Gilbarg–Trudinger's convention:
`L u = aⁱʲ∂ᵢⱼu + bⁱ∂ᵢu + cu` with symmetric uniformly elliptic `a`, bounded `b` and `c`, and a
`C²` function `u` with `Lu ≥ 0` on an open set `Ω`. If `x₀ ∈ ∂Ω` lies on the boundary of an
open ball `B ⊆ Ω` of centre `y` and radius `R`, `u` is continuous at `x₀` relative to `Ω`,
`u(x) < u(x₀)` for every `x ∈ Ω`, and either `c = 0`, or `c ≤ 0` and `u(x₀) ≥ 0`, or
`u(x₀) = 0`, then along the inward radius the difference quotient
`(u(x₀) − u(x₀ − tν))/t`, with `ν = (x₀ − y)/R` the outer normal of `B` at `x₀`, is bounded
below by a positive constant for all small `t > 0` (Gilbarg–Trudinger, Lemma 3.4). -/
theorem hopf_boundary_point {Ω : Set (EuclideanSpace ℝ ι)} (hΩ : IsOpen Ω)
    {a : EuclideanSpace ℝ ι → Matrix ι ι ℝ} {lam Lam : ℝ}
    (ha : UniformlyEllipticOn Ω a lam Lam) (hsymm : ∀ x ∈ Ω, (a x).IsSymm)
    {b : EuclideanSpace ℝ ι → EuclideanSpace ℝ ι} {β : ℝ} (hb : ∀ x ∈ Ω, ‖b x‖ ≤ β)
    {c : EuclideanSpace ℝ ι → ℝ} {γ : ℝ} (hc : ∀ x ∈ Ω, |c x| ≤ γ)
    {u : EuclideanSpace ℝ ι → ℝ} (hu : ContDiffOn ℝ 2 u Ω)
    (hL : ∀ x ∈ Ω, 0 ≤ ∑ i, ∑ j, a x i j *
        iteratedFDeriv ℝ 2 u x ![EuclideanSpace.single i 1, EuclideanSpace.single j 1] +
      ∑ i, b x i * fderiv ℝ u x (EuclideanSpace.single i 1) + c x * u x)
    {y x₀ : EuclideanSpace ℝ ι} {R : ℝ} (hR : 0 < R) (hball : ball y R ⊆ Ω)
    (hx₀ : dist x₀ y = R) (hfr : x₀ ∈ frontier Ω) (hcont : ContinuousWithinAt u Ω x₀)
    (hmax : ∀ x ∈ Ω, u x < u x₀)
    (hsign : (∀ x ∈ Ω, c x = 0) ∨ ((∀ x ∈ Ω, c x ≤ 0) ∧ 0 ≤ u x₀) ∨ u x₀ = 0) :
    ∃ ε > (0 : ℝ), ∃ δ > (0 : ℝ), ∀ t ∈ Ioo 0 δ,
      ε * t ≤ u x₀ - u (x₀ - t • (R⁻¹ • (x₀ - y))) := by
  sorry

end Layer3

/-! ## Layer 4: linear elliptic existence by the energy method -/

section Layer4

variable {ι : Type*} [Fintype ι] {mu : Measure (EuclideanSpace ℝ ι)} [mu.IsAddHaarMeasure]
  {Ω : Opens (EuclideanSpace ℝ ι)} {a : EuclideanSpace ℝ ι → Matrix ι ι ℝ}
  {b : EuclideanSpace ℝ ι → EuclideanSpace ℝ ι} {c : EuclideanSpace ℝ ι → ℝ}

/-- **The Dirichlet problem with an `H¹` lifting and `H⁻¹` forcing** (§4.2). For a bounded
coercive energy form, every `g ∈ H¹(Ω)` and every `ℓ ∈ H⁻¹(Ω) = (H¹₀(Ω))*` there is exactly one
`u ∈ H¹(Ω)` with `u − g ∈ H¹₀(Ω)` and `B(u, v) = ℓ(v)` for every `v ∈ H¹₀(Ω)`
(Evans, §6.2.2, Theorem 3, with the lifting of §6.2.1). The homogeneous `L²` case is the pinned
`TauCeti.PDE.existsUnique_isWeakSolutionDirichlet`. -/
theorem existsUnique_weakSolution_lifting
    (hcoeff : MemLp (fun x => energyIntegrand (a x) (b x) (c x)) ⊤ (mu.restrict Ω))
    (hcoercive : IsCoercive (energyFormH1L0 hcoeff)) (g : W1p mu Ω 2)
    (ℓ : StrongDual ℝ (W1p0 mu Ω 2)) :
    ∃! u : W1p mu Ω 2, u - g ∈ (w1p0Submodule mu Ω 2).toSubmodule ∧
      ∀ v : W1p0 mu Ω 2, energyFormH1 a b c u (v : W1p mu Ω 2) = ℓ v := by
  sorry

/-- **Fredholm compatibility for Gårding forms** (§4.3). On a bounded open set, for a bounded
energy form satisfying a Gårding inequality `C₀‖w‖²_{H¹} ≤ B(w, w) + β‖w‖²_{L²}`, the weak
Dirichlet problem `B(u, ·) = ℓ` with `ℓ ∈ H⁻¹(Ω)` is solvable exactly when `ℓ` annihilates the
weak adjoint kernel `{w | ∀ v, B(v, w) = 0}` (Evans, §6.2.3, Theorem 4; Gilbarg–Trudinger,
Theorem 8.6). For non-symmetric `a` the adjoint kernel differs from the kernel of `B(·, w)`. -/
theorem fredholm_compatibility
    (hΩ : Bornology.IsBounded (Ω : Set (EuclideanSpace ℝ ι)))
    (hcoeff : MemLp (fun x => energyIntegrand (a x) (b x) (c x)) ⊤ (mu.restrict Ω))
    {C₀ β : ℝ} (hC₀ : 0 < C₀)
    (hgarding : ∀ w : W1p0 mu Ω 2,
      C₀ * ‖w‖ ^ 2 ≤ energyFormH1L0 hcoeff w w + β * ‖W1p0.valueL w‖ ^ 2)
    (ℓ : StrongDual ℝ (W1p0 mu Ω 2)) :
    (∃ u : W1p0 mu Ω 2, ∀ v, energyFormH1L0 hcoeff u v = ℓ v) ↔
      ∀ w : W1p0 mu Ω 2, (∀ v, energyFormH1L0 hcoeff v w = 0) → ℓ w = 0 := by
  sorry

end Layer4

/-! ## Layer 5: elliptic regularity -/

section Layer5

variable {ι : Type*} [Fintype ι] [DecidableEq ι] {mu : Measure (EuclideanSpace ℝ ι)}
  [mu.IsAddHaarMeasure]

/-- **Interior `H²` regularity for Lipschitz coefficients** (§5.1). Let `a` be uniformly elliptic
with entries Lipschitz on `Ω`, `b, c ∈ L^∞(Ω)`, `f ∈ L²(Ω)`, and `u ∈ H¹(Ω)` a weak solution of
`−∂ⱼ(aⁱʲ∂ᵢu) + b·∇u + cu = f` with no boundary condition. Then on every open `V` with compact
closure inside `Ω` the restriction of `u` is the first-order part of an element of `W^{2,2}(V)`
(Evans, §6.3.1, Theorem 1; Gilbarg–Trudinger, Theorem 8.8). The constant-coefficient case is the
pinned `TauCeti.PDE.UniformlyEllipticOn.exists_lowerOrder_eq_restrictL`. -/
theorem exists_wkp_two_of_lipschitz_coefficients {Ω : Opens (EuclideanSpace ℝ ι)}
    {a : EuclideanSpace ℝ ι → Matrix ι ι ℝ} {lam Lam : ℝ}
    (ha : UniformlyEllipticOn (Ω : Set (EuclideanSpace ℝ ι)) a lam Lam)
    {K : ℝ≥0} (haLip : ∀ i j, LipschitzOnWith K (fun x => a x i j) Ω)
    {b : EuclideanSpace ℝ ι → EuclideanSpace ℝ ι} {c : EuclideanSpace ℝ ι → ℝ}
    (hb : MemLp b ⊤ (mu.restrict Ω)) (hc : MemLp c ⊤ (mu.restrict Ω))
    {f : Lp ℝ 2 (mu.restrict Ω)} {u : W1p mu Ω 2}
    (hu : ∀ v : W1p0 mu Ω 2, energyFormH1 a b c u (v : W1p mu Ω 2) =
      ∫ x in Ω, f x * W1p.value (v : W1p mu Ω 2) x ∂mu)
    {V : Opens (EuclideanSpace ℝ ι)} (hV : IsCompact (closure (V : Set (EuclideanSpace ℝ ι))))
    (hVΩ : closure (V : Set (EuclideanSpace ℝ ι)) ⊆ Ω) :
    ∃ U : Wkp mu V 2 2, Wkp.lowerOrder 1 U =
      W1p.restrictL (SetLike.coe_subset_coe.mp (subset_closure.trans hVΩ)) u := by
  sorry

/-- **De Giorgi–Nash–Moser in every dimension** (§5.4). Fix the ellipticity ratio `ratio`. There
are `α ∈ (0, 1]` and `C > 0`, depending only on `ratio` and the dimension, such that for every
inverse-coercive coefficient field `a` with constants `0 < λ ≤ Λ ≤ ratio·λ`, measurable and not
necessarily symmetric, every weak solution `u ∈ H¹(B(x₀, 2r))` of the homogeneous equation
`−∂ⱼ(aⁱʲ∂ᵢu) = 0` has a representative that is `α`-Hölder on `B(x₀, r)` with constant
`C r^(−α) · r^(−n/2) ‖u‖_{L²(B(x₀,2r))}` (Gilbarg–Trudinger, Theorem 8.22 and Theorem 8.24;
Armstrong–Kempe, arXiv:2604.05984, `holder_Moser`, for the unit-ball statement with
`λ = 1` and `n ≥ 3`). The `n ≥ 3`, operator-bound-ellipticity, thickening form is the pinned
`TauCeti.PDE.exists_holderOnWith_preciseRepresentative`. -/
theorem exists_holderOnWith_of_isWeakSolution_ball (ratio : ℝ) :
    ∃ (α : ℝ≥0) (C : ℝ), 0 < α ∧ α ≤ 1 ∧ 0 < C ∧
      ∀ (lam Lam : ℝ) (x₀ : EuclideanSpace ℝ ι) (r : ℝ)
        (a : EuclideanSpace ℝ ι → Matrix ι ι ℝ)
        (u : W1p mu ⟨ball x₀ (2 * r), isOpen_ball⟩ 2),
        0 < r → Lam ≤ ratio * lam →
        IsUniformlyEllipticAE mu (ball x₀ (2 * r)) a lam Lam →
        AEStronglyMeasurable a (mu.restrict (ball x₀ (2 * r))) →
        (∀ v : W1p0 mu ⟨ball x₀ (2 * r), isOpen_ball⟩ 2,
          energyFormH1 a 0 0 u (v : W1p mu ⟨ball x₀ (2 * r), isOpen_ball⟩ 2) = 0) →
        ∃ v : EuclideanSpace ℝ ι → ℝ,
          (W1p.value u : EuclideanSpace ℝ ι → ℝ) =ᵐ[mu.restrict (ball x₀ (2 * r))] v ∧
          HolderOnWith (C * r ^ (-(α : ℝ)) * (r ^ (-(Fintype.card ι : ℝ) / 2) *
            √(∫ y in ball x₀ (2 * r), W1p.value u y ^ 2 ∂mu))).toNNReal α v (ball x₀ r) := by
  sorry

/-- **The Harnack inequality for weak solutions** (§5.4). Fix the ellipticity ratio `ratio`.
There is `C > 0`, depending only on `ratio` and the dimension, such that for every
inverse-coercive coefficient field `a` with constants `0 < λ ≤ Λ ≤ ratio·λ`, measurable and not
necessarily symmetric, and every weak solution `u ∈ H¹(B(x₀, 4r))` of the homogeneous equation
`−∂ⱼ(aⁱʲ∂ᵢu) = 0` that is nonnegative almost everywhere on `B(x₀, 4r)`, one has `u(x) ≤ C u(y)`
for almost every `x` and almost every `y` in `B(x₀, r)`. This is
`ess sup_{B(x₀,r)} u ≤ C ess inf_{B(x₀,r)} u`, written pairwise so that no junk value of a real
essential supremum enters (Gilbarg–Trudinger, Theorem 8.20, with no lower-order terms, where
the constant depends on `n` and `Λ/λ` only). -/
theorem harnack_of_isWeakSolution_ball (ratio : ℝ) :
    ∃ C : ℝ, 0 < C ∧
      ∀ (lam Lam : ℝ) (x₀ : EuclideanSpace ℝ ι) (r : ℝ)
        (a : EuclideanSpace ℝ ι → Matrix ι ι ℝ)
        (u : W1p mu ⟨ball x₀ (4 * r), isOpen_ball⟩ 2),
        0 < r → Lam ≤ ratio * lam →
        IsUniformlyEllipticAE mu (ball x₀ (4 * r)) a lam Lam →
        AEStronglyMeasurable a (mu.restrict (ball x₀ (4 * r))) →
        (∀ᵐ x ∂(mu.restrict (ball x₀ (4 * r))), 0 ≤ W1p.value u x) →
        (∀ v : W1p0 mu ⟨ball x₀ (4 * r), isOpen_ball⟩ 2,
          energyFormH1 a 0 0 u (v : W1p mu ⟨ball x₀ (4 * r), isOpen_ball⟩ 2) = 0) →
        ∀ᵐ x ∂(mu.restrict (ball x₀ r)), ∀ᵐ y ∂(mu.restrict (ball x₀ r)),
          W1p.value u x ≤ C * W1p.value u y := by
  sorry

/-- **The Krylov–Safonov Hölder estimate** (§5.5). Let `n = card ι ≥ 1`, let `a` be measurable
and uniformly elliptic on `B(x₀, 2r)` with constants `λ, Λ`, and let `u ∈ W^{2,n}(B(x₀, 2r))`
be a strong solution of `−aⁱʲ∂ᵢⱼu = f` almost everywhere, with `f ∈ Lⁿ` and `|u| ≤ M` almost
everywhere on the ball. Then `u` has a representative that is `α`-Hölder on `B(x₀, r)` with
constant `C r^(−α)(M + r ‖f‖_{Lⁿ(B(x₀,2r))}/λ)`, where `α` and `C` depend only on `n` and
`Λ/λ` (Gilbarg–Trudinger, Theorem 9.22 and Corollary 9.24). -/
theorem exists_holderOnWith_of_isStrongSolution_ball
    [Fact (1 ≤ (Fintype.card ι : ℝ≥0∞))] (ratio : ℝ) :
    ∃ (α : ℝ≥0) (C : ℝ), 0 < α ∧ α ≤ 1 ∧ 0 < C ∧
      ∀ (lam Lam : ℝ) (x₀ : EuclideanSpace ℝ ι) (r M : ℝ)
        (a : EuclideanSpace ℝ ι → Matrix ι ι ℝ)
        (f : Lp ℝ (Fintype.card ι) (mu.restrict (ball x₀ (2 * r))))
        (u : Wkp mu ⟨ball x₀ (2 * r), isOpen_ball⟩ (Fintype.card ι) 2),
        0 < r → Lam ≤ ratio * lam →
        UniformlyEllipticOn (ball x₀ (2 * r)) a lam Lam →
        AEStronglyMeasurable a (mu.restrict (ball x₀ (2 * r))) →
        (∀ᵐ x ∂(mu.restrict (ball x₀ (2 * r))), |Wkp.value 2 u x| ≤ M) →
        (∀ᵐ x ∂(mu.restrict (ball x₀ (2 * r))),
          -(∑ i, ∑ j, a x i j * (Wkp.iteratedGradient 1 u x (EuclideanSpace.single j 1)) i) =
            f x) →
        ∃ v : EuclideanSpace ℝ ι → ℝ,
          (Wkp.value 2 u : EuclideanSpace ℝ ι → ℝ) =ᵐ[mu.restrict (ball x₀ (2 * r))] v ∧
          HolderOnWith (C * r ^ (-(α : ℝ)) * (M + r * ‖f‖ / lam)).toNNReal α v
            (ball x₀ r) := by
  sorry

/-- **The Krylov–Safonov Harnack inequality** (§5.5). Let `n = card ι ≥ 1`, let `a` be
measurable and uniformly elliptic on `B(x₀, 2r)` with constants `λ, Λ`, `Λ ≤ ratio·λ`, and let
`u ∈ W^{2,n}(B(x₀, 2r))` be a strong solution of `−aⁱʲ∂ᵢⱼu = f` almost everywhere with `f ∈ Lⁿ`,
nonnegative almost everywhere on the ball. Then `u(x) ≤ C (u(y) + r ‖f‖_{Lⁿ(B(x₀,2r))}/λ)` for
almost every `x` and almost every `y` in `B(x₀, r)`, with `C` depending only on `n` and `Λ/λ`
(Gilbarg–Trudinger, Theorem 9.22, with no lower-order terms). -/
theorem harnack_of_isStrongSolution_ball
    [Fact (1 ≤ (Fintype.card ι : ℝ≥0∞))] (ratio : ℝ) :
    ∃ C : ℝ, 0 < C ∧
      ∀ (lam Lam : ℝ) (x₀ : EuclideanSpace ℝ ι) (r : ℝ)
        (a : EuclideanSpace ℝ ι → Matrix ι ι ℝ)
        (f : Lp ℝ (Fintype.card ι) (mu.restrict (ball x₀ (2 * r))))
        (u : Wkp mu ⟨ball x₀ (2 * r), isOpen_ball⟩ (Fintype.card ι) 2),
        0 < r → Lam ≤ ratio * lam →
        UniformlyEllipticOn (ball x₀ (2 * r)) a lam Lam →
        AEStronglyMeasurable a (mu.restrict (ball x₀ (2 * r))) →
        (∀ᵐ x ∂(mu.restrict (ball x₀ (2 * r))), 0 ≤ Wkp.value 2 u x) →
        (∀ᵐ x ∂(mu.restrict (ball x₀ (2 * r))),
          -(∑ i, ∑ j, a x i j * (Wkp.iteratedGradient 1 u x (EuclideanSpace.single j 1)) i) =
            f x) →
        ∀ᵐ x ∂(mu.restrict (ball x₀ r)), ∀ᵐ y ∂(mu.restrict (ball x₀ r)),
          Wkp.value 2 u x ≤ C * (Wkp.value 2 u y + r * ‖f‖ / lam) := by
  sorry

/-- **The interior Schauder estimate** (§5.6), in scaled form. Fix `0 < α < 1`, ellipticity
constants and a bound `M` on the scaled Hölder seminorm of the coefficients. There is `C`,
depending only on these and on the dimension, such that for every ball `B(x₀, 2r)`, every
symmetric uniformly elliptic `a` with `r^α [a]_{α; B(x₀,2r)} ≤ M`, every `f` with `|f| ≤ M_f` and
`[f]_α ≤ K_f` on the ball, and every `C²` solution `u` of `−aⁱʲ∂ᵢⱼu = f` with `|u| ≤ M_u`, the
Hessian of `u` is `α`-Hölder on `B(x₀, r)` with constant
`C (r^(−2−α) M_u + r^(−α) M_f + K_f)` (Gilbarg–Trudinger, Theorem 6.2). -/
theorem holderOnWith_iteratedFDeriv_two_of_schauder (α : ℝ≥0) (hα0 : 0 < α) (hα1 : α < 1)
    (lam Lam M : ℝ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (x₀ : EuclideanSpace ℝ ι) (r : ℝ) (a : EuclideanSpace ℝ ι → Matrix ι ι ℝ)
      (f u : EuclideanSpace ℝ ι → ℝ) (Ka Kf Mu Mf : ℝ≥0),
      0 < r → UniformlyEllipticOn (ball x₀ (2 * r)) a lam Lam →
      (∀ x ∈ ball x₀ (2 * r), (a x).IsSymm) →
      (∀ i j, HolderOnWith Ka α (fun x => a x i j) (ball x₀ (2 * r))) →
      Ka * r ^ (α : ℝ) ≤ M →
      HolderOnWith Kf α f (ball x₀ (2 * r)) → (∀ x ∈ ball x₀ (2 * r), |f x| ≤ Mf) →
      ContDiffOn ℝ 2 u (ball x₀ (2 * r)) → (∀ x ∈ ball x₀ (2 * r), |u x| ≤ Mu) →
      (∀ x ∈ ball x₀ (2 * r), -(∑ i, ∑ j, a x i j *
        iteratedFDeriv ℝ 2 u x ![EuclideanSpace.single i 1, EuclideanSpace.single j 1]) =
          f x) →
      HolderOnWith (C * (r ^ (-(2 + (α : ℝ))) * Mu + r ^ (-(α : ℝ)) * Mf + Kf)).toNNReal α
        (fun x => iteratedFDeriv ℝ 2 u x) (ball x₀ r) := by
  sorry

end Layer5

end TauCetiRoadmap.PDE
