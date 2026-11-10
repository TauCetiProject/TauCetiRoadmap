import Mathlib
import TauCeti.MeasureTheory.OptimalTransport.Coupling
import TauCeti.MeasureTheory.OptimalTransport.Cost.Basic
import TauCeti.MeasureTheory.OptimalTransport.Monge
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic
import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume

/-!
# Optimal transport and Wasserstein geometry: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states headline theorems of
the roadmap against the pinned Mathlib and Tau Ceti, each with `sorry`. It is the acceptance test
of the finished roadmap, not a list of its targets.

The carriers are Tau Ceti's couplings `TauCeti.IsCoupling`, transport cost
`TauCeti.transportCost`, optimal couplings `TauCeti.IsOptimalCoupling`, Kantorovich-optimal maps
`TauCeti.IsKantorovichOptimalTransportMap`, Wasserstein distance `TauCeti.wassersteinEDist` and
finite moments `TauCeti.HasFiniteMoment`, Tau Ceti's Riemannian volume
`TauCeti.riemannianVolume`, and Mathlib's Riemannian distance, Hausdorff dimension, Hölder maps,
homeomorphisms, iterated derivatives, multivariate Gaussian laws, Kullback–Leibler divergence and
separable measures.

The following headline theorems of `README.md` are proved in Tau Ceti at revision `2fd255d9`,
the revision pinned by the roadmap repository's main branch, so they are not restated here.

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
* The Riemannian Benamou–Brenier formula (Layer 8.9) needs the continuity equation for a
  time-dependent vector field on a manifold, and with it the Riemannian divergence; neither
  library states a continuity equation on a manifold.
* Brownian Schrödinger bridges and the Schilder limit (Layer 13.12–13.13) need the Brownian law
  on `C([0,1]; ℝⁿ)`; Mathlib has only the predicates `ProbabilityTheory.IsPreBrownianReal` and
  `ProbabilityTheory.IsBrownianReal` on real-valued processes.
* The Gigli–Rajala–Sturm optimal-map theorem (Layer 14.8) needs the `RCD*(K,N)` condition, that
  is a curvature-dimension condition with finite `N` and infinitesimal Hilbertianity; neither
  library has a curvature-dimension condition with finite `N`.

The following headline theorems of `README.md` are stated on carriers of Tau Ceti that the Tau
Ceti pinned by this file's manifest does not contain, so they are not statable at these pins;
each names the carrier it needs.

* The Borel-cost duality through the relaxed primal (Layer 2.5) needs the relaxed transport
  value `TauCeti.relaxedTransportCost`.
* The Figalli–Kim–McCann Hölder-continuity theorem (Layer 6.14) needs the weak
  Ma–Trudinger–Wang condition `TauCeti.SatisfiesWeakMTW` and `c`-convexity of sets
  `TauCeti.IsCConvexSet`.
* Convergence of the Jordan–Kinderlehrer–Otto scheme (Layer 11.7) needs the signed Boltzmann
  entropy `TauCeti.boltzmannEntropy` and evolution variational inequalities
  `TauCeti.IsEVISolution`.
* Metrization of weak convergence by the Sinkhorn divergence (Layer 13.4) needs
  `TauCeti.sinkhornDivergence`.
* The identification of the heat flow on `RCD(K,∞)` spaces (Layer 14.7) needs the Cheeger
  energy `TauCeti.cheegerEnergy` and the condition
  `TauCeti.MetricMeasureSpace.CurvatureDimensionInfinity`.
* Completeness of the Gromov–Wasserstein quotient exactly when the target is complete
  (Layer 15.5) needs `TauCeti.GromovWassersteinSpace`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory InformationTheory Set Filter
open scoped ENNReal NNReal RealInnerProductSpace MatrixOrder Matrix.Norms.L2Operator Manifold Bundle

namespace TauCetiRoadmap.OptimalTransport

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

end TauCetiRoadmap.OptimalTransport
