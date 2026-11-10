import Mathlib
import TauCeti.MeasureTheory.OptimalTransport.Coupling
import TauCeti.MeasureTheory.OptimalTransport.Cost.Basic
import TauCeti.MeasureTheory.OptimalTransport.Monge
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Space
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.PotentialEnergy
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.InternalEnergy.Basic
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.GeneralizedGeodesic.Convex
import TauCeti.MeasureTheory.OptimalTransport.Cost.Partial.Basic
import TauCeti.MeasureTheory.OptimalTransport.Duality.Basic
import TauCeti.MeasureTheory.OptimalTransport.Twist.CExponential
import TauCeti.MeasureTheory.OptimalTransport.Twist.MaTrudingerWang
import TauCeti.MeasureTheory.OptimalTransport.Entropic.Duality
import TauCeti.MeasureTheory.OptimalTransport.Entropic.SinkhornDivergence
import TauCeti.MeasureTheory.OptimalTransport.MetricMeasure.Basic
import TauCeti.MeasureTheory.OptimalTransport.MetricMeasure.CurvatureDimension
import TauCeti.MeasureTheory.OptimalTransport.GromovWasserstein.Space
import TauCeti.MeasureTheory.Function.CheegerEnergy
import TauCeti.Analysis.GradientFlow.EVI.Basic
import TauCeti.Analysis.GradientFlow.MoreauYosida.Basic
import TauCeti.Analysis.PositiveDefinite.Kernel.Universal
import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume

/-!
# Optimal transport and Wasserstein geometry: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states headline theorems of
the roadmap against the pinned Mathlib and Tau Ceti, each with `sorry`. It is the acceptance test
of the finished roadmap, not a list of its targets.

The carriers are Tau Ceti's couplings `TauCeti.IsCoupling`, transport cost
`TauCeti.transportCost`, relaxed transport value `TauCeti.relaxedTransportCost`, dual pairs
`TauCeti.DualFeasible` and `TauCeti.kantorovichDualValue`, optimal couplings
`TauCeti.IsOptimalCoupling`, Kantorovich-optimal maps `TauCeti.IsKantorovichOptimalTransportMap`,
`c`-convex sets `TauCeti.IsCConvexSet`, the weak Ma–Trudinger–Wang condition
`TauCeti.SatisfiesWeakMTW`, Wasserstein distance `TauCeti.wassersteinEDist`, finite moments
`TauCeti.HasFiniteMoment`, the Wasserstein space `TauCeti.WassersteinSpace`, evolution
variational inequalities `TauCeti.IsEVISolution`, convexity along generalized geodesics
`TauCeti.GeneralizedGeodesicallyConvex`, the JKO step `TauCeti.moreauYosidaResolvent`, the
energies `TauCeti.boltzmannEntropy` and `TauCeti.potentialEnergy`, the Sinkhorn divergence
`TauCeti.sinkhornDivergence` with its Gibbs kernel `TauCeti.entropicGibbsKernel` and universal
kernels `TauCeti.IsUniversalKernel`, metric-measure spaces `TauCeti.MetricMeasureSpace` with the
condition `TauCeti.MetricMeasureSpace.CurvatureDimensionInfinity`, the Cheeger energy
`TauCeti.cheegerEnergy`, the Gromov–Wasserstein quotient `TauCeti.GromovWassersteinSpace`, Tau
Ceti's Riemannian volume `TauCeti.riemannianVolume`, and Mathlib's Riemannian distance, Hausdorff
dimension, Hölder maps, homeomorphisms, iterated derivatives, gradient and Laplacian,
multivariate Gaussian laws, Kullback–Leibler divergence and separable measures.

The following headline theorems of `README.md` are proved in Tau Ceti at the pinned
revision `2fd255d9`, so they are not restated here.

* Primal attainment for lower semicontinuous costs on Polish spaces (Layer 1.5):
  `TauCeti.exists_isOptimalCoupling`.
* Kantorovich duality for lower semicontinuous costs on Polish spaces (Layer 2.4):
  `TauCeti.transportCost_eq_sSup_ofReal_kantorovichDualValue_integrable_of_lowerSemicontinuous`.
* The Schachermayer–Teichmann characterization of optimal plans by cyclical monotonicity
  (Layer 2.7): `TauCeti.IsCoupling.isOptimalCoupling_iff_exists_isCyclicallyMonotone`.
* Completeness of `P_p(X)` for `1 ≤ p < ∞` (Layer 3.3):
  `TauCeti.WassersteinSpace.completeSpace`.
* Kantorovich–Rubinstein duality (Layer 3.8): `TauCeti.wassersteinEDist_one_eq_iSup`.
* Pratelli's equality of the Monge and Kantorovich values for continuous costs (Layer 4.3):
  `TauCeti.mongeCost_eq_transportCost_of_continuous`.
* Brenier's theorem (Layer 5.5): `TauCeti.exists_isKantorovichOptimalTransportMap_gradient`.
* Brenier's polar factorization at finite quadratic cost (Layer 5.9):
  `TauCeti.exists_hasLaw_and_ae_eq_gradient_comp`.
* Lisini's superposition principle (Layer 8.3):
  `TauCeti.exists_map_IccExtend_eq_lintegral_curveAction_eq`.
* The Benamou–Brenier formula for `1 ≤ p < ∞` (Layer 8.8):
  `TauCeti.isLeast_lintegral_isContinuityEquation`.
* The conditional chain rule for relative entropy (Layer 11.1):
  `TauCeti.klDiv_compProd_eq_add_lintegral`.
* The Le Gouic–Loubes existence of population barycenters (Layer 12.5):
  `TauCeti.WassersteinSpace.exists_isFrechetBarycenter`.
* Existence and uniqueness of the static Schrödinger bridge (Layer 13.2):
  `TauCeti.existsUnique_isCoupling_klDiv_eq_schroedingerValue`.
* The zero-temperature limit of entropic transport for a continuous cost with an integrable
  split upper bound and tight marginals (Layer 13.5):
  `TauCeti.tendsto_entropicTransportCost_transportCost_of_le_add`.
* Existence and uniqueness of the dynamic Schrödinger minimizer (Layer 13.11):
  `TauCeti.existsUnique_isCoupling_map_klDiv_eq_dynamicSchroedingerValue`.
* The Gromov–Wasserstein metric on weak-isomorphism classes of measured kernels (Layer 15.4):
  `TauCeti.GromovWassersteinSpace.instMetricSpace`.
* Existence of fixed-law finite Gromov–Wasserstein barycenters (Layer 15.10):
  `TauCeti.exists_isMinOn_finiteGromovWassersteinBarycenterObjective`.

The following headline theorems of `README.md` are not statable at the pins; each needs the
carrier named.

* Caffarelli's global regularity (Layer 6.10) needs domains with `C^{k,α}` boundary and uniform
  convexity of the boundary; neither library has a predicate for the boundary regularity of an
  open set.
* The `p = 1` BV theory of Abedi–Li–Schultz (Layer 8.5) needs the Skorokhod topology on càdlàg
  paths; Mathlib has only the càdlàg predicate `IsCadlag`.
* The Riemannian Benamou–Brenier formula on a compact manifold (Layer 8.9) needs the continuity
  equation for a time-dependent vector field on a manifold, and with it the Riemannian
  divergence; neither library states a continuity equation on a manifold.
* Brownian Schrödinger bridges and the Schilder limit (Layer 13.12–13.13) need the Brownian law
  on `C([0,1]; ℝⁿ)`; Mathlib has only the predicates `ProbabilityTheory.IsPreBrownianReal` and
  `ProbabilityTheory.IsBrownianReal` on real-valued processes.
* The Gigli–Rajala–Sturm optimal-map theorem (Layer 14.8) needs the `RCD*(K,N)` condition, that
  is a curvature-dimension condition with finite `N` and infinitesimal Hilbertianity; neither
  library has a curvature-dimension condition with finite `N`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory InformationTheory Set Filter
open scoped ENNReal NNReal RealInnerProductSpace MatrixOrder Matrix.Norms.L2Operator Manifold Bundle

namespace TauCetiRoadmap.OptimalTransport

/-! ## Layer 2: Kantorovich duality, transforms, and optimality certificates -/

/-- **Duality for Borel costs through the relaxed primal** (Beiglböck–Léonard–Schachermayer,
arXiv:0911.4347v2, Theorem 1.2, p. 3). Let `μ` and `ν` be Borel probability measures on Polish
spaces and `c : X × Y → [0, ∞]` a Borel cost. The relaxed primal value, the limit as `ε ↓ 0` of
the least cost of a measure of mass at least `1 - ε` with marginals at most `μ` and `ν`, equals
the supremum of `∫ φ dμ + ∫ ψ dν` over the integrable pairs with `φ x + ψ y ≤ c (x, y)`
everywhere; both sides may be `∞`. No lower semicontinuity is assumed, and the ordinary primal
value may be strictly larger. -/
theorem relaxedTransportCost_eq_sSup_ofReal_kantorovichDualValue
    {X Y : Type*} [TopologicalSpace X] [PolishSpace X] [MeasurableSpace X] [BorelSpace X]
    [TopologicalSpace Y] [PolishSpace Y] [MeasurableSpace Y] [BorelSpace Y]
    (μ : Measure X) (ν : Measure Y) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    {c : X × Y → ℝ≥0∞} (hc : Measurable c) :
    TauCeti.relaxedTransportCost c μ ν =
      sSup {r : ℝ≥0∞ | ∃ (φ : X → ℝ) (ψ : Y → ℝ), Integrable φ μ ∧ Integrable ψ ν ∧
        TauCeti.DualFeasible (fun z ↦ (c z : EReal)) φ ψ ∧
        ENNReal.ofReal (TauCeti.kantorovichDualValue μ ν φ ψ) = r} := by
  sorry

/-! ## Layer 5: convex analysis, Brenier, and polar factorization -/

/-- **Gangbo–McCann for strictly convex costs** (Gangbo–McCann 1996, Theorem 1.2). Let
`h : ℝᵈ → [0, ∞)` be strictly convex, superlinear (`h x / ‖x‖ → ∞` at infinity), and satisfy the
cone condition (H2): for every height `r` and aperture `θ ∈ (0, π)`, every vertex `p` far enough
from the origin admits `z ≠ 0` such that `h ≤ h p` on the truncated cone
`{x | ‖x - p‖ ‖z‖ cos (θ / 2) ≤ ⟪z, x - p⟫ ≤ r ‖z‖}`. If `μ` is absolutely continuous and the
transport cost of `c (x, y) = h (x - y)` from `μ` to `ν` is finite, there is a transport map `T`
attaining the Kantorovich value, and its graph plan is the only optimal coupling. -/
theorem exists_isKantorovichOptimalTransportMap_of_strictConvexOn {d : ℕ}
    (h : EuclideanSpace ℝ (Fin d) → ℝ) (h_nonneg : ∀ x, 0 ≤ h x)
    (h_strict : StrictConvexOn ℝ univ h)
    (h_superlinear : Tendsto (fun x => h x / ‖x‖) (Bornology.cobounded _) atTop)
    (h_cone : ∀ r θ : ℝ, 0 < θ → θ < Real.pi → ∃ R : ℝ, ∀ p, R < ‖p‖ →
      ∃ z, z ≠ 0 ∧ ∀ x, ‖x - p‖ * ‖z‖ * Real.cos (θ / 2) ≤ ⟪z, x - p⟫ →
        ⟪z, x - p⟫ ≤ r * ‖z‖ → h x ≤ h p)
    (μ ν : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hμ : μ ≪ volume)
    (hfin : TauCeti.transportCost (fun z => ENNReal.ofReal (h (z.1 - z.2))) μ ν ≠ ∞) :
    ∃ T : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d),
      TauCeti.IsKantorovichOptimalTransportMap (fun z => ENNReal.ofReal (h (z.1 - z.2))) μ ν T ∧
      ∀ γ, TauCeti.IsOptimalCoupling (fun z => ENNReal.ofReal (h (z.1 - z.2))) γ μ ν ↔
        γ = μ.map fun x => (x, T x) := by
  sorry

/-! ## Layer 6: Monge–Ampère measures, equations, and regularity -/

/-- **Caffarelli's interior regularity of the Brenier map** (Caffarelli 1992; De Philippis–Figalli
survey, Theorem 3.3). Let `X, Y ⊆ ℝⁿ` be bounded open sets with `Y` convex, and let `μ = f dx` on
`X` and `ν = g dy` on `Y` be probability measures whose densities are bounded below by `λ > 0`
and above by `λ⁻¹` almost everywhere on their sets. Then every quadratic Kantorovich-optimal map
from `μ` to `ν` agrees `μ`-almost everywhere with a map that is Hölder of one positive exponent on
every compact subset of `X`. -/
theorem exists_holderOnWith_of_isKantorovichOptimalTransportMap_of_convex {n : ℕ}
    {X Y : Set (EuclideanSpace ℝ (Fin n))} (hXo : IsOpen X) (hXb : Bornology.IsBounded X)
    (hYo : IsOpen Y) (hYb : Bornology.IsBounded Y) (hYc : Convex ℝ Y)
    {f g : EuclideanSpace ℝ (Fin n) → ℝ≥0∞} (hf : Measurable f) (hg : Measurable g)
    {l : ℝ} (hl : 0 < l)
    (hfl : ∀ᵐ x ∂volume.restrict X, ENNReal.ofReal l ≤ f x ∧ f x ≤ ENNReal.ofReal l⁻¹)
    (hgl : ∀ᵐ y ∂volume.restrict Y, ENNReal.ofReal l ≤ g y ∧ g y ≤ ENNReal.ofReal l⁻¹)
    [IsProbabilityMeasure ((volume.restrict X).withDensity f)]
    [IsProbabilityMeasure ((volume.restrict Y).withDensity g)]
    {T : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n)}
    (hT : TauCeti.IsKantorovichOptimalTransportMap
      (fun z => ENNReal.ofReal (‖z.1 - z.2‖ ^ 2 / 2))
      ((volume.restrict X).withDensity f) ((volume.restrict Y).withDensity g) T) :
    ∃ α : ℝ≥0, 0 < α ∧ ∃ S : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n),
      T =ᵐ[(volume.restrict X).withDensity f] S ∧
      ∀ K ⊆ X, IsCompact K → ∃ C : ℝ≥0, HolderOnWith C α S K := by
  sorry

/-- **De Philippis–Figalli partial regularity** (De Philippis–Figalli 2015, Theorem 1.3, p. 82).
Let `X, Y ⊆ ℝⁿ` be bounded open sets, and let `μ = f dx` on `X` and `ν = g dy` on `Y` be
probability measures whose densities are continuous and lie between `λ > 0` and `λ⁻¹` on their
sets. Let the cost `c` be nonnegative on `X × Y` (a constant shift arranges this without changing
optimal maps), of class `C²` there with derivatives of order at most two bounded (C0), with
`y ↦ -Dₓc(x, y)` injective on `Y` for every `x ∈ X` (C1), `x ↦ -D_y c(x, y)` injective on `X` for
every `y ∈ Y` (C2), and with injective mixed derivative `D_y Dₓ c(x, y)` on `X × Y` (C3). No
Ma–Trudinger–Wang condition and no convexity of `X` or `Y` is assumed. Then every
Kantorovich-optimal map `T` from `μ` to `ν` agrees `μ`-almost everywhere with a homeomorphism `h`
of `X \ S_X` onto `Y \ S_Y`, for relatively closed Lebesgue-null sets `S_X ⊆ X` and `S_Y ⊆ Y`,
and `h` is Hölder of every exponent `β < 1` on every compact subset of `X \ S_X`. -/
theorem exists_homeomorph_holderOnWith_of_isKantorovichOptimalTransportMap {n : ℕ}
    {X Y : Set (EuclideanSpace ℝ (Fin n))} (hXo : IsOpen X) (hXb : Bornology.IsBounded X)
    (hYo : IsOpen Y) (hYb : Bornology.IsBounded Y)
    {f g : EuclideanSpace ℝ (Fin n) → ℝ} (hf : ContinuousOn f X) (hg : ContinuousOn g Y)
    {l : ℝ} (hl : 0 < l) (hfl : ∀ x ∈ X, l ≤ f x ∧ f x ≤ l⁻¹)
    (hgl : ∀ y ∈ Y, l ≤ g y ∧ g y ≤ l⁻¹)
    [IsProbabilityMeasure ((volume.restrict X).withDensity fun x => ENNReal.ofReal (f x))]
    [IsProbabilityMeasure ((volume.restrict Y).withDensity fun y => ENNReal.ofReal (g y))]
    {c : EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n) → ℝ}
    (hc_nonneg : ∀ z ∈ X ×ˢ Y, 0 ≤ c z) (hc : ContDiffOn ℝ 2 c (X ×ˢ Y))
    (hc_bdd : ∃ C : ℝ, ∀ k ≤ 2, ∀ z ∈ X ×ˢ Y, ‖iteratedFDeriv ℝ k c z‖ ≤ C)
    (hc_twist : ∀ x ∈ X, InjOn (fun y => -fderiv ℝ (fun x' => c (x', y)) x) Y)
    (hc_twist' : ∀ y ∈ Y, InjOn (fun x => -fderiv ℝ (fun y' => c (x, y')) y) X)
    (hc_nondeg : ∀ x ∈ X, ∀ y ∈ Y,
      Function.Injective (fderiv ℝ (fun y' => fderiv ℝ (fun x' => c (x', y')) x) y))
    {T : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n)}
    (hT : TauCeti.IsKantorovichOptimalTransportMap (fun z => ENNReal.ofReal (c z))
      ((volume.restrict X).withDensity fun x => ENNReal.ofReal (f x))
      ((volume.restrict Y).withDensity fun y => ENNReal.ofReal (g y)) T) :
    ∃ SX SY : Set (EuclideanSpace ℝ (Fin n)), SX ⊆ X ∧ SY ⊆ Y ∧
      IsOpen (X \ SX) ∧ IsOpen (Y \ SY) ∧ volume SX = 0 ∧ volume SY = 0 ∧
      ∃ h : ↥(X \ SX) ≃ₜ ↥(Y \ SY),
        (∀ᵐ x ∂((volume.restrict X).withDensity fun x => ENNReal.ofReal (f x)),
          ∀ hx : x ∈ X \ SX, (h ⟨x, hx⟩ : EuclideanSpace ℝ (Fin n)) = T x) ∧
        ∀ β : ℝ≥0, β < 1 → ∀ K : Set ↥(X \ SX), IsCompact K →
          ∃ C : ℝ≥0, HolderOnWith C β (fun x => (h x : EuclideanSpace ℝ (Fin n))) K := by
  sorry

/-- A target set `V` is **strongly `c`-convex with respect to** a source set `U` when it is
`c`-convex with respect to `U` and, for every `x ∈ U`, the set of momenta `-Dₓ c (x, y)` of the
points `y ∈ V` is strongly convex: for one radius `R`, every boundary point `p` of that set lies
on a sphere of radius `R` whose closed ball contains the set (Figalli–Kim–McCann,
arXiv:1107.1014v1, condition (B2)s, p. 5). Strong `c`-convexity of the source with respect to the
target is this condition for the swapped cost `fun z ↦ c z.swap`. -/
def IsStronglyCConvexSet {E Y : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (c : E × Y → ℝ) (U : Set E) (V : Set Y) : Prop :=
  TauCeti.IsCConvexSet c U V ∧ ∀ x ∈ U, ∃ R : ℝ,
    ∀ p ∈ frontier ((fun y ↦ -fderiv ℝ (fun x' ↦ c (x', y)) x) '' V), ∃ a : StrongDual ℝ E,
      dist p a = R ∧ (fun y ↦ -fderiv ℝ (fun x' ↦ c (x', y)) x) '' V ⊆ Metric.closedBall a R

/-- **Figalli–Kim–McCann: Hölder continuity and injectivity of optimal maps** (Figalli–Kim–McCann,
arXiv:1107.1014v1, Theorem 2.1, p. 6, with Corollary 9.6 for the exponent). For every dimension
`n` and every `L` there is an exponent `α > 0` with the following property. Let `U, V ⊆ ℝⁿ` be
bounded open sets and `c` a cost of class `C⁴` on an open set containing `closure U × closure V`,
nonnegative on `U × V` (a constant shift arranges this without changing optimal maps), such that
for all `x ∈ closure U` and `y ∈ closure V` the maps `x' ↦ D_y c (x', y)` and `y' ↦ Dₓ c (x, y')`
are injective on `closure U` and `closure V` and the mixed derivative `D_y Dₓ c (x, y)` is
injective (B1), `V` is strongly `c`-convex with respect to `closure U` and `U` is strongly
`c`-convex with respect to `closure V` for the swapped cost (B2), (B2)s, and `c` satisfies the weak
Ma–Trudinger–Wang condition on `U × V` (B3). Let `f` and `g` be probability densities on `U` and
`V` with `f x ≤ C g y` for almost every `(x, y) ∈ U × V` and one constant `C`, and let `U' ⊆ U`
be open with `f x ≤ L g y` and `g y ≤ L f x` for almost every `(x, y) ∈ U' × V`. Then some
transport map from `f dx` to `g dy` attains the Kantorovich value, is injective on `U'`, and is
Hölder of exponent `α` on every compact subset of `U'`. -/
theorem exists_isKantorovichOptimalTransportMap_injOn_holderOnWith_of_satisfiesWeakMTW
    (n : ℕ) (L : ℝ≥0) :
    ∃ α : ℝ≥0, 0 < α ∧ ∀ {U V U' : Set (EuclideanSpace ℝ (Fin n))}
      {W : Set (EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n))}
      {c : EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n) → ℝ}
      {f g : EuclideanSpace ℝ (Fin n) → ℝ≥0∞},
      IsOpen U → Bornology.IsBounded U → IsOpen V → Bornology.IsBounded V →
      IsOpen W → closure U ×ˢ closure V ⊆ W → ContDiffOn ℝ 4 c W →
      (∀ z ∈ U ×ˢ V, 0 ≤ c z) →
      (∀ y ∈ closure V, InjOn (fun x => fderiv ℝ (fun y' => c (x, y')) y) (closure U)) →
      (∀ x ∈ closure U, InjOn (fun y => fderiv ℝ (fun x' => c (x', y)) x) (closure V)) →
      (∀ x ∈ closure U, ∀ y ∈ closure V,
        Function.Injective (fderiv ℝ (fun y' => fderiv ℝ (fun x' => c (x', y')) x) y)) →
      IsStronglyCConvexSet c (closure U) V →
      IsStronglyCConvexSet (fun z => c z.swap) (closure V) U →
      TauCeti.SatisfiesWeakMTW c U V →
      Measurable f → Measurable g →
      IsProbabilityMeasure ((volume.restrict U).withDensity f) →
      IsProbabilityMeasure ((volume.restrict V).withDensity g) →
      (∃ C : ℝ≥0, ∀ᵐ z ∂(volume.restrict U).prod (volume.restrict V), f z.1 ≤ C * g z.2) →
      IsOpen U' → U' ⊆ U →
      (∀ᵐ z ∂(volume.restrict U').prod (volume.restrict V),
        f z.1 ≤ L * g z.2 ∧ g z.2 ≤ L * f z.1) →
      ∃ T : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n),
        TauCeti.IsKantorovichOptimalTransportMap (fun z => ENNReal.ofReal (c z))
          ((volume.restrict U).withDensity f) ((volume.restrict V).withDensity g) T ∧
        InjOn T U' ∧ ∀ K ⊆ U', IsCompact K → ∃ C : ℝ≥0, HolderOnWith C α T K := by
  sorry

/-! ## Layer 7: Riemannian Brenier–McCann transport -/

/-- **McCann's theorem** (McCann 2001, Theorems 8 and 9, on compact manifolds; Fathi–Figalli,
arXiv:0711.4519v1, Theorems 4.2 and 4.3, on complete manifolds). Let `M` be a finite-dimensional,
connected, boundaryless, complete smooth Riemannian manifold whose extended distance is the
Riemannian distance. For probability measures `μ` and `ν` of finite second moment with `μ`
absolutely continuous with respect to Riemannian volume, there is a transport map attaining the
Kantorovich value for the cost `d² / 2`, and its graph plan is the only optimal coupling. -/
theorem exists_isKantorovichOptimalTransportMap_riemannian
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    {M : Type*} [EMetricSpace M] [ChartedSpace H M] [IsManifold I (⊤ : ℕ∞) M]
    [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M]
    [Bundle.RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I (⊤ : ℕ∞) E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    [IsRiemannianManifold I M] [ConnectedSpace M] [CompleteSpace M]
    (μ ν : Measure M) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hμ2 : TauCeti.HasFiniteMoment 2 μ) (hν2 : TauCeti.HasFiniteMoment 2 ν)
    (hμ : μ ≪ TauCeti.riemannianVolume I M) :
    ∃ T : M → M,
      TauCeti.IsKantorovichOptimalTransportMap (fun z => edist z.1 z.2 ^ 2 / 2) μ ν T ∧
      ∀ γ, TauCeti.IsOptimalCoupling (fun z => edist z.1 z.2 ^ 2 / 2) γ μ ν ↔
        γ = μ.map fun x => (x, T x) := by
  sorry

/-- **Figalli's distance-cost Monge theorem** (Figalli 2007, Theorem 1.1 with the Lagrangian
`(1 + ‖v‖²) / 2` of Remark 1.2, pp. 3–4). Let `M` be a finite-dimensional, connected, boundaryless
smooth Riemannian manifold, complete for its Riemannian distance. For probability measures `μ`
and `ν` of finite first moment with `μ` absolutely continuous with respect to Riemannian volume,
there is a transport map from `μ` to `ν` attaining the Kantorovich value for the cost `d`.
Neither support is assumed compact, and the optimal map is in general not unique. -/
theorem exists_isKantorovichOptimalTransportMap_edist_riemannian
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    {M : Type*} [EMetricSpace M] [ChartedSpace H M] [IsManifold I (⊤ : ℕ∞) M]
    [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M]
    [Bundle.RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I (⊤ : ℕ∞) E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    [IsRiemannianManifold I M] [ConnectedSpace M] [CompleteSpace M]
    (μ ν : Measure M) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hμ1 : TauCeti.HasFiniteMoment 1 μ) (hν1 : TauCeti.HasFiniteMoment 1 ν)
    (hμ : μ ≪ TauCeti.riemannianVolume I M) :
    ∃ T : M → M, TauCeti.IsKantorovichOptimalTransportMap (fun z => edist z.1 z.2) μ ν T := by
  sorry

/-! ## Layer 11: entropy, Wasserstein differential calculus, JKO, and PDE flows -/

/-- **Convergence of the Jordan–Kinderlehrer–Otto scheme** (Ambrosio–Gigli–Savaré 2008,
Theorem 4.0.4 under Assumption 4.0.1; Ambrosio–Gigli, *A user's guide to optimal transport*,
Theorem 3.25, p. 64, for `λ ≥ 0`). Let `Φ : P₂(ℝⁿ) → (-∞, ∞]` be lower semicontinuous for `W₂`
and `λ`-convex along generalized geodesics with every base, and let `Φ μ₀ < ∞`. Then an `EVI_λ`
solution `u` of `Φ` starts from `μ₀`, and for all time steps `τ j → 0` and all sequences of JKO
steps `J j` from `μ₀` with step `τ j`, the piecewise constant interpolants
`t ↦ J j ⌈t / τ j⌉` converge to `u` in `W₂`, uniformly on every bounded time interval. -/
theorem exists_isEVISolution_tendstoUniformlyOn_moreauYosidaResolvent {n : ℕ}
    {Φ : TauCeti.WassersteinSpace 2 (EuclideanSpace ℝ (Fin n)) → EReal} {lam : ℝ}
    (hΦ_lsc : LowerSemicontinuous Φ) (hΦ_bot : ∀ μ, Φ μ ≠ ⊥)
    (hΦ_conv : ∀ μ, TauCeti.GeneralizedGeodesicallyConvex lam Φ μ)
    {μ₀ : TauCeti.WassersteinSpace 2 (EuclideanSpace ℝ (Fin n))} (hμ₀ : Φ μ₀ ≠ ⊤) :
    ∃ u : ℝ → TauCeti.WassersteinSpace 2 (EuclideanSpace ℝ (Fin n)),
      u 0 = μ₀ ∧ TauCeti.IsEVISolution lam Φ u ∧
      ∀ (τ : ℕ → ℝ≥0) (J : ℕ → ℕ → TauCeti.WassersteinSpace 2 (EuclideanSpace ℝ (Fin n))),
        (∀ j, τ j ≠ 0) → Tendsto τ atTop (nhds 0) → (∀ j, J j 0 = μ₀) →
        (∀ j k, J j (k + 1) ∈ TauCeti.moreauYosidaResolvent Φ (τ j) (J j k)) →
        ∀ T : ℝ, TendstoUniformlyOn (fun j (t : ℝ) => J j ⌈t / (τ j : ℝ)⌉₊) u atTop (Icc 0 T) := by
  sorry

/-- **The Fokker–Planck equation as the gradient flow of the free energy**
(Jordan–Kinderlehrer–Otto 1998; Ambrosio–Gigli–Savaré 2008, Theorem 11.2.8). Let `V ∈ C²(ℝⁿ)`
with `∇²V ≥ λ`, that is `V - (λ / 2) ‖·‖²` convex, and let `u` be an `EVI_λ` solution in `P₂(ℝⁿ)`
of the free energy `μ ↦ Ent(μ) + ∫ V dμ`, with the Boltzmann entropy relative to Lebesgue
measure. Then `u` solves `∂ₜρ = Δρ + div(ρ ∇V)` in distributions on `(0, ∞) × ℝⁿ`:
`∫₀^∞ ∫ (∂ₜζ + Δζ - ⟪∇V, ∇ζ⟫) d(u t) dt = 0` for every smooth compactly supported `ζ` whose
support lies in `(0, ∞) × ℝⁿ`. -/
theorem integral_fokkerPlanck_eq_zero_of_isEVISolution {n : ℕ}
    {V : EuclideanSpace ℝ (Fin n) → ℝ} {lam : ℝ} (hV : ContDiff ℝ 2 V)
    (hV_conv : ConvexOn ℝ univ fun x => V x - lam / 2 * ‖x‖ ^ 2)
    {u : ℝ → TauCeti.WassersteinSpace 2 (EuclideanSpace ℝ (Fin n))}
    (hu : TauCeti.IsEVISolution lam
      (fun μ : TauCeti.WassersteinSpace 2 (EuclideanSpace ℝ (Fin n)) =>
        TauCeti.boltzmannEntropy volume
            ((μ : ProbabilityMeasure (EuclideanSpace ℝ (Fin n))) :
              Measure (EuclideanSpace ℝ (Fin n))) +
          TauCeti.potentialEnergy V
            ((μ : ProbabilityMeasure (EuclideanSpace ℝ (Fin n))) :
              Measure (EuclideanSpace ℝ (Fin n)))) u)
    (ζ : ℝ × EuclideanSpace ℝ (Fin n) → ℝ) (hζ : ContDiff ℝ (⊤ : ℕ∞) ζ)
    (hζ_supp : HasCompactSupport ζ) (hζ_pos : tsupport ζ ⊆ Ioi 0 ×ˢ univ) :
    ∫ t in Ioi (0 : ℝ), ∫ x, (deriv (fun s => ζ (s, x)) t +
      Laplacian.laplacian (fun y => ζ (t, y)) x -
      ⟪gradient V x, gradient (fun y => ζ (t, y)) x⟫)
        ∂((u t : ProbabilityMeasure (EuclideanSpace ℝ (Fin n))) : Measure _) = 0 := by
  sorry

/-! ## Layer 12: Fréchet and Wasserstein barycenters -/

/-- **Agueh–Carlier existence and uniqueness of quadratic barycenters** (Agueh–Carlier 2011,
Proposition 2.3, Definition 3.2 and Proposition 3.5). For finitely many laws `μ i` of finite
second moment on `ℝⁿ` and weights `w i ≥ 0` summing to one, suppose that one input `μ j` of
positive weight vanishes on small sets: `μ j A = 0` for every Borel `A` of Hausdorff dimension at
most `n - 1`. Then exactly one probability measure minimizes `ν ↦ ∑ i, w i W₂(ν, μ i)²`.
For `n = 0` the truncated `n - 1` is `0`, the hypothesis `hsmall` is unsatisfiable, and the
statement is vacuous. -/
theorem existsUnique_isMinOn_sum_wassersteinEDist_sq_of_dimH_le {n : ℕ} {ι : Type*} [Fintype ι]
    (w : ι → ℝ≥0) (hw : ∑ i, w i = 1) (μ : ι → Measure (EuclideanSpace ℝ (Fin n)))
    [∀ i, IsProbabilityMeasure (μ i)] (hμ : ∀ i, TauCeti.HasFiniteMoment 2 (μ i))
    {j : ι} (hj : w j ≠ 0)
    (hsmall : ∀ A, MeasurableSet A → dimH A ≤ ((n - 1 : ℕ) : ℝ≥0∞) → μ j A = 0) :
    ∃! ν : ProbabilityMeasure (EuclideanSpace ℝ (Fin n)),
      IsMinOn (fun ν : ProbabilityMeasure (EuclideanSpace ℝ (Fin n)) =>
        ∑ i, (w i : ℝ≥0∞) * TauCeti.wassersteinEDist 2 (ν : Measure _) (μ i) ^ 2) univ ν := by
  sorry

/-- **Quadratic barycenters of Gaussian laws** (Agueh–Carlier 2011, Theorem 6.1;
Álvarez-Esteban–del Barrio–Cuesta-Albertos–Matrán 2016, Theorem 4.2 and Corollary 4.5). Let `N(m k, C k)` be
finitely many Gaussian laws on `ℝⁿ` with positive semidefinite covariances, and let `w k ≥ 0` be
weights summing to one, one of them positive on an input with positive definite covariance. Then
there is a positive definite `S` with `S = ∑ k, w k (S^(1/2) C k S^(1/2))^(1/2)` such that the
quadratic barycenters of the inputs are exactly the Gaussian law with mean `∑ k, w k m k` and
covariance `S`. -/
theorem exists_posDef_forall_isMinOn_sum_wassersteinEDist_sq_multivariateGaussian_iff
    {n : ℕ} {κ : Type*} [Fintype κ] (w : κ → ℝ≥0) (hw : ∑ k, w k = 1)
    (m : κ → EuclideanSpace ℝ (Fin n)) (C : κ → Matrix (Fin n) (Fin n) ℝ)
    (hC : ∀ k, (C k).PosSemidef) {j : κ} (hj : w j ≠ 0) (hCj : (C j).PosDef) :
    ∃ S : Matrix (Fin n) (Fin n) ℝ, S.PosDef ∧
      S = ∑ k, (w k : ℝ) • CFC.sqrt (CFC.sqrt S * C k * CFC.sqrt S) ∧
      ∀ ν : ProbabilityMeasure (EuclideanSpace ℝ (Fin n)),
        IsMinOn (fun ν : ProbabilityMeasure (EuclideanSpace ℝ (Fin n)) =>
          ∑ k, (w k : ℝ≥0∞) *
            TauCeti.wassersteinEDist 2 (ν : Measure _) (multivariateGaussian (m k) (C k)) ^ 2)
          univ ν ↔
        (ν : Measure _) = multivariateGaussian (∑ k, (w k : ℝ) • m k) S := by
  sorry

/-! ## Layer 13: entropic transport, Sinkhorn, and Schrödinger bridges -/

/-- **Schrödinger potentials** (Nutz, *Introduction to Entropic Optimal Transport*, Theorem 2.1).
Let `μ` and `ν` be separable probability measures and `R` a probability measure on `X × Y`
equivalent to `μ ⊗ ν`, and suppose some coupling of `μ` and `ν` has finite relative entropy
with respect to `R`. If `π` is a coupling minimizing `klDiv · R`, then there are measurable real
functions `φ` and `ψ` with `dπ / dR = exp (φ ⊕ ψ)` `R`-almost everywhere, and any other such pair
differs from `(φ, ψ)` by `(a, -a)` almost everywhere, for one real `a`. -/
theorem exists_rnDeriv_eq_exp_add_of_isCoupling_of_forall_klDiv_le
    {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    (μ : Measure X) (ν : Measure Y) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    [IsSeparable μ] [IsSeparable ν] (R : Measure (X × Y)) [IsProbabilityMeasure R]
    (hRμν : R ≪ μ.prod ν) (hμνR : μ.prod ν ≪ R)
    (hfin : ∃ γ, TauCeti.IsCoupling γ μ ν ∧ klDiv γ R ≠ ∞)
    {γ : Measure (X × Y)} (hγ : TauCeti.IsCoupling γ μ ν)
    (hmin : ∀ γ', TauCeti.IsCoupling γ' μ ν → klDiv γ R ≤ klDiv γ' R) :
    ∃ (φ : X → ℝ) (ψ : Y → ℝ), Measurable φ ∧ Measurable ψ ∧
      γ.rnDeriv R =ᵐ[R] (fun z => ENNReal.ofReal (Real.exp (φ z.1 + ψ z.2))) ∧
      ∀ (φ' : X → ℝ) (ψ' : Y → ℝ), Measurable φ' → Measurable ψ' →
        γ.rnDeriv R =ᵐ[R] (fun z => ENNReal.ofReal (Real.exp (φ' z.1 + ψ' z.2))) →
        ∃ a : ℝ, φ' =ᵐ[μ] (fun x => φ x + a) ∧ ψ' =ᵐ[ν] (fun y => ψ y - a) := by
  sorry

/-- **The Sinkhorn divergence metrizes weak convergence** (Feydy–Séjourné–Vialard–Amari–
Trouvé–Peyré 2019, Theorem 1). Let `X` be a compact metric space, `c` a Lipschitz cost and
`ε > 0`, and suppose that the Gibbs kernel `exp (-c / ε)` is positive semidefinite and universal.
Then a sequence of probability measures `μs i` converges weakly to `μ` exactly when the Sinkhorn
divergences `S_ε (μs i, μ)` tend to `0`. -/
theorem tendsto_sinkhornDivergence_zero_iff_tendsto
    {X : Type*} [MetricSpace X] [CompactSpace X] [MeasurableSpace X] [BorelSpace X]
    {c : X × X → ℝ≥0} (hc : ∃ K : ℝ≥0, LipschitzWith K c) {ε : ℝ≥0} (hε : ε ≠ 0)
    (hk : Matrix.PosSemidef (TauCeti.entropicGibbsKernel (fun z => (c z : ℝ≥0∞)) ε))
    (hku : TauCeti.IsUniversalKernel (TauCeti.entropicGibbsKernel (fun z => (c z : ℝ≥0∞)) ε))
    (μs : ℕ → ProbabilityMeasure X) (μ : ProbabilityMeasure X) :
    Tendsto (fun i => TauCeti.sinkhornDivergence (fun z => (c z : ℝ≥0∞)) ε
        (μs i : Measure X) (μ : Measure X)) atTop (nhds 0) ↔
      Tendsto μs atTop (nhds μ) := by
  sorry

/-! ## Layer 14: synthetic curvature, nonsmooth heat flow, and optimal maps -/

/-- **The heat flow on `RCD(K, ∞)` spaces is the `EVI_K` flow of the entropy**
(Ambrosio–Gigli–Savaré, *Calculus and heat flow*, Theorem 9.3 (iii);
Ambrosio–Gigli–Mondino–Rajala, arXiv:1207.4924v2, Theorems 6.1 and 6.2, pp. 30–31). Let
`(X, d, m)` be a complete separable metric space with a reference measure finite on bounded sets
that satisfies `CD(K, ∞)` and whose Cheeger energy is a quadratic form, in the sense of the
parallelogram identity. Let `f` be the `L²(m)` gradient flow of the Cheeger energy, that is an
`EVI₀` solution in `L²(m)`, starting from a nonnegative density `f 0` of a law `μ₀` of finite
second moment. Then the laws `(f t) m` are probability measures of finite second moment, and the
curve `t ↦ (f t) m` is an `EVI_K` solution in `P₂(X)` of the Boltzmann entropy relative to `m`
starting from `μ₀`. -/
theorem exists_isEVISolution_boltzmannEntropy_of_isEVISolution_cheegerEnergy
    {X : Type*} [MetricSpace X] [MeasurableSpace X] [CompleteSpace X]
    [SecondCountableTopology X] [BorelSpace X] (M : TauCeti.MetricMeasureSpace X) {K : ℝ}
    (hCD : M.CurvatureDimensionInfinity K)
    (hquad : ∀ g h : Lp ℝ 2 M.reference,
      TauCeti.cheegerEnergy M.reference (g + h) + TauCeti.cheegerEnergy M.reference (g - h) =
        2 * TauCeti.cheegerEnergy M.reference g + 2 * TauCeti.cheegerEnergy M.reference h)
    {f : ℝ → Lp ℝ 2 M.reference}
    (hf : TauCeti.IsEVISolution 0
      (fun g : Lp ℝ 2 M.reference => ((TauCeti.cheegerEnergy M.reference g : ℝ≥0∞) : EReal)) f)
    (hf_nonneg : 0 ≤ᵐ[M.reference] f 0) {μ₀ : TauCeti.WassersteinSpace 2 X}
    (hμ₀ : ((μ₀ : ProbabilityMeasure X) : Measure X) =
      M.reference.withDensity fun x => ENNReal.ofReal (f 0 x)) :
    ∃ u : ℝ → TauCeti.WassersteinSpace 2 X, u 0 = μ₀ ∧
      (∀ t, 0 ≤ t → ((u t : ProbabilityMeasure X) : Measure X) =
        M.reference.withDensity fun x => ENNReal.ofReal (f t x)) ∧
      TauCeti.IsEVISolution K (fun μ : TauCeti.WassersteinSpace 2 X =>
        TauCeti.boltzmannEntropy M.reference ((μ : ProbabilityMeasure X) : Measure X)) u := by
  sorry

/-! ## Layer 15: measured kernels and Gromov–Wasserstein -/

/-- **Completeness of the Gromov–Wasserstein space** (Bauer–Mémoli–Needham–Nishino 2025,
Theorem 39, p. 30). For `1 ≤ p ≤ ∞` and a metric target `Z`, the space of weak-isomorphism
classes of measured `Z`-valued kernels of finite `p`-size on standard Borel probability spaces,
with the Gromov–Wasserstein metric, is complete exactly when `Z` is complete. No separability of
`Z` is assumed. -/
theorem completeSpace_gromovWassersteinSpace_iff {p : ℝ≥0∞} [Fact (1 ≤ p)]
    {Z : Type*} [MetricSpace Z] :
    CompleteSpace (TauCeti.GromovWassersteinSpace p Z) ↔ CompleteSpace Z := by
  sorry

end TauCetiRoadmap.OptimalTransport
