/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Algebra.CentralSimple.Quaternion

/-!
**This file is not the roadmap and is not exhaustive.** The README is the definitive
specification. These declarations expose concrete native test-function, Hilbert-space, and graph
carriers; unfinished analytic bridges are marked honestly.
-/

noncomputable section

open scoped SchwartzMap

open scoped Distributions

namespace TauCetiRoadmap

namespace ContDiffMapSupportedIn

variable (𝕜 : Type*) [NontriviallyNormedField 𝕜] {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [NormedSpace 𝕜 F]
  [SMulCommClass ℝ 𝕜 F] {K : TopologicalSpace.Compacts E}

/-- Local compact-support inclusion; its continuity uses a radius bound for the support. -/
def toSchwartzMapCLM : 𝓓_{K}(E, F) →L[𝕜] 𝓢(E, F) := by
  let A : 𝓓_{K}(E, F) →ₗ[𝕜] 𝓢(E, F) :=
    { toFun := fun f => f.hasCompactSupport.toSchwartzMap f.contDiff
      map_add' := fun _ _ => SchwartzMap.ext fun _ => rfl
      map_smul' := fun _ _ => SchwartzMap.ext fun _ => rfl }
  refine ⟨A, ?_⟩
  obtain ⟨R, hR, hK⟩ := K.isCompact.isBounded.exists_pos_norm_le
  refine (_root_.ContDiffMapSupportedIn.withSeminorms 𝕜 E F ⊤ K).continuous_of_isBounded
    (schwartz_withSeminorms 𝕜 E F) A (.of_real fun ⟨k, n⟩ =>
      ⟨{n}, R ^ k, fun f => ?_⟩)
  simp only [Finset.sup_singleton]
  apply (A f).seminorm_le_bound 𝕜 k n (by positivity)
  intro x
  change ‖x‖ ^ k * ‖iteratedFDeriv ℝ n f x‖ ≤ _
  by_cases hx : x ∈ K
  · exact mul_le_mul (pow_le_pow_left₀ (norm_nonneg x) (hK x hx) k)
      (_root_.ContDiffMapSupportedIn.norm_iteratedFDeriv_apply_le_seminorm_top 𝕜)
      (norm_nonneg _) (pow_nonneg hR.le k)
  · simpa only [f.iteratedFDeriv_zero_on_compl hx, Pi.zero_apply, norm_zero, mul_zero]
      using (mul_nonneg (pow_nonneg hR.le k) (apply_nonneg _ f))

variable {𝕜} in
@[simp] theorem toSchwartzMapCLM_apply (f : 𝓓_{K}(E, F)) (x : E) :
    toSchwartzMapCLM 𝕜 f x = f x := rfl

end ContDiffMapSupportedIn

namespace TestFunction

variable (𝕜 : Type*) [NontriviallyNormedField 𝕜] {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [NormedSpace 𝕜 F]
  [Algebra ℝ 𝕜] [IsScalarTower ℝ 𝕜 F] {Ω : TopologicalSpace.Opens E}

/-- The LF-to-Schwartz inclusion, assembled from the compact-support stages. -/
def toSchwartzMapCLM : 𝓓(Ω, F) →L[𝕜] 𝓢(E, F) :=
  _root_.TestFunction.limitCLM 𝕜 (fun f => f.hasCompactSupport.toSchwartzMap f.contDiff)
    (fun _ _ => ContDiffMapSupportedIn.toSchwartzMapCLM 𝕜) (fun _ _ _ => rfl)

variable {𝕜} in
@[simp] theorem toSchwartzMapCLM_apply (f : 𝓓(Ω, F)) (x : E) :
    toSchwartzMapCLM 𝕜 f x = f x := rfl

end TestFunction

end TauCetiRoadmap

namespace TauCetiRoadmap.RelativisticQuantumFieldTheory

abbrev Spacetime := EuclideanSpace ℝ (Fin 4)
abbrev Test := 𝓢(Spacetime, ℂ)
abbrev TemperedScalar := 𝓢'(Spacetime, ℂ)
abbrev PairSpacetime := PiLp 2 (fun _ : Fin 2 => Spacetime)
abbrev PairTest := 𝓢(PairSpacetime, ℂ)
abbrev PairDistribution := 𝓢'(PairSpacetime, ℂ)

/-- The sup-norm coordinate presentation is continuously linearly equivalent to the
finite Hilbert carrier; native Fourier is applied on `Spacetime`. -/
abbrev legacySpacetimeEquiv : Spacetime ≃L[ℝ] (Fin 4 → ℝ) :=
  EuclideanSpace.equiv (Fin 4) ℝ

/-- Preserve the old coordinate test interface by native continuous Schwartz pullback. -/
def legacyTestPullback : 𝓢((Fin 4 → ℝ), ℂ) →L[ℂ] Test :=
  SchwartzMap.compCLMOfContinuousLinearEquiv ℂ legacySpacetimeEquiv

/-- The inverse coordinate pullback. -/
def legacyTestPushforward : Test →L[ℂ] 𝓢((Fin 4 → ℝ), ℂ) :=
  SchwartzMap.compCLMOfContinuousLinearEquiv ℂ legacySpacetimeEquiv.symm

@[simp] theorem legacyTestPullback_apply (f : 𝓢((Fin 4 → ℝ), ℂ)) (x : Spacetime) :
    legacyTestPullback f x = f (legacySpacetimeEquiv x) := rfl

@[simp] theorem legacyTestPushforward_apply (f : Test) (x : Fin 4 → ℝ) :
    legacyTestPushforward f x = f (legacySpacetimeEquiv.symm x) := rfl

@[simp] theorem legacyTestPushforward_pullback (f : 𝓢((Fin 4 → ℝ), ℂ)) :
    legacyTestPushforward (legacyTestPullback f) = f := by
  ext x
  change f (legacySpacetimeEquiv (legacySpacetimeEquiv.symm x)) = f x
  rw [legacySpacetimeEquiv.apply_symm_apply]

@[simp] theorem legacyTestPullback_pushforward (f : Test) :
    legacyTestPullback (legacyTestPushforward f) = f := by
  ext x
  change f (legacySpacetimeEquiv.symm (legacySpacetimeEquiv x)) = f x
  rw [legacySpacetimeEquiv.symm_apply_apply]

open LineDeriv

/-- Underlying real configuration space; the model supplies Lorentzian or Euclidean structure. -/
abbrev Configuration (n : ℕ) := PiLp 2 (fun _ : Fin n => Spacetime)

/-- Native Schwartz Fourier transform on the Euclidean test carrier. -/
def testFourier : Test →L[ℂ] Test := FourierTransform.fourierCLM ℂ Test

/-- The configuration carrier has the finite Hilbert norm required by native Fourier. -/
def configurationFourier (n : ℕ) : 𝓢(Configuration n, ℂ) →L[ℂ] 𝓢(Configuration n, ℂ) :=
  FourierTransform.fourierCLM ℂ 𝓢(Configuration n, ℂ)

/-- The union of pairwise coincidence diagonals; empty for zero or one slot. -/
def coincidenceLocus (n : ℕ) : Set (Configuration n) :=
  {x | ∃ i j : Fin n, i ≠ j ∧ x i = x j}

/-- A finite union of closed pairwise diagonals. -/
theorem isClosed_coincidenceLocus (n : ℕ) : IsClosed (coincidenceLocus n) := by
  classical
  have h : coincidenceLocus n = ⋃ (i : Fin n) (j : Fin n),
      {x : Configuration n | i ≠ j ∧ x i = x j} := by
    ext x
    simp [coincidenceLocus]
  rw [h]
  apply isClosed_iUnion_of_finite
  intro i
  apply isClosed_iUnion_of_finite
  intro j
  by_cases hij : i ≠ j
  · have hc : IsClosed {x : Configuration n | x i = x j} :=
      isClosed_eq (PiLp.continuous_apply 2 (fun _ : Fin n => Spacetime) i)
        (PiLp.continuous_apply 2 (fun _ : Fin n => Spacetime) j)
    have hset : {x : Configuration n | i ≠ j ∧ x i = x j} =
        {x : Configuration n | x i = x j} := by
      ext x
      exact ⟨And.right, fun heq => ⟨hij, heq⟩⟩
    rw [hset]
    exact hc
  · simp [hij]

/-- The open complement of the coincidence locus, in any number of slots. -/
def offDiagonal (n : ℕ) : TopologicalSpace.Opens (Configuration n) :=
  ⟨(coincidenceLocus n)ᶜ, (isClosed_coincidenceLocus n).isOpen_compl⟩

/-- All jets vanish on all coincidences. The topology is the inherited Schwartz topology. -/
def zeroDiagonalSchwartz (n : ℕ) : Submodule ℂ 𝓢(Configuration n, ℂ) :=
  ⨅ x : coincidenceLocus n, ⨅ k : ℕ, ⨅ v : Fin k → Configuration n,
    (((BoundedContinuousFunction.evalCLM ℂ x.1).comp
      (SchwartzMap.toBoundedContinuousFunctionCLM ℂ (Configuration n) ℂ)).comp
      (iteratedLineDerivOpCLM ℂ 𝓢(Configuration n, ℂ) v)).ker

/-- Explicit function-level form of the native kernel-intersection carrier. -/
theorem mem_zeroDiagonalSchwartz_iff (n : ℕ) (f : 𝓢(Configuration n, ℂ)) :
    f ∈ zeroDiagonalSchwartz n ↔
      ∀ (x : coincidenceLocus n) (k : ℕ) (v : Fin k → Configuration n),
        iteratedFDeriv ℝ k f x.1 v = 0 := by
  simp only [zeroDiagonalSchwartz, Submodule.mem_iInf]
  change (∀ (x : coincidenceLocus n) (k : ℕ) (v : Fin k → Configuration n),
    (iteratedLineDerivOp v f) x.1 = 0) ↔ _
  simp only [SchwartzMap.iteratedLineDerivOp_eq_iteratedFDeriv]

/-- Closedness is needed when the restricted Schwinger functional uses this subspace. -/
theorem isClosed_zeroDiagonalSchwartz (n : ℕ) :
    IsClosed (zeroDiagonalSchwartz n : Set 𝓢(Configuration n, ℂ)) := by
  simp only [zeroDiagonalSchwartz, Submodule.coe_iInf]
  exact isClosed_iInter fun x => isClosed_iInter fun k =>
    isClosed_iInter fun v => ContinuousLinearMap.isClosed_ker _

abbrev ZeroDiagonalTests (n : ℕ) := zeroDiagonalSchwartz n
abbrev RestrictedSchwingerFunctional (n : ℕ) := ZeroDiagonalTests n →L[ℂ] ℂ

theorem coincidenceLocus_zero : coincidenceLocus 0 = ∅ := by
  ext x
  simp [coincidenceLocus]

theorem coincidenceLocus_one : coincidenceLocus 1 = ∅ := by
  ext x
  simp [coincidenceLocus]

theorem zeroDiagonalSchwartz_zero : zeroDiagonalSchwartz 0 = ⊤ := by
  simp [zeroDiagonalSchwartz, coincidenceLocus_zero]

theorem zeroDiagonalSchwartz_one : zeroDiagonalSchwartz 1 = ⊤ := by
  simp [zeroDiagonalSchwartz, coincidenceLocus_one]

/-- Flatness includes the value, not just positive-order derivatives. -/
theorem zeroDiagonalTests_apply_eq_zero {n : ℕ} (f : ZeroDiagonalTests n)
    (x : coincidenceLocus n) : f.1 x.1 = 0 := by
  have h := (mem_zeroDiagonalSchwartz_iff n f.1).mp f.2 x 0 Fin.elim0
  simpa using h

/-- The inherited Schwartz topology makes the inclusion continuous. -/
def zeroDiagonalInclusion (n : ℕ) : ZeroDiagonalTests n →L[ℂ] 𝓢(Configuration n, ℂ) :=
  (zeroDiagonalSchwartz n).subtypeL

/-- Full Schwartz functionals restrict to the zero-diagonal subspace. -/
def restrictSchwingerFunctional (n : ℕ) (u : 𝓢(Configuration n, ℂ) →L[ℂ] ℂ) :
    RestrictedSchwingerFunctional n := u.comp (zeroDiagonalInclusion n)

/-- Support away from coincidences is sufficient for flatness, without defining flatness by it. -/
theorem mem_zeroDiagonalSchwartz_of_disjoint_tsupport {n : ℕ}
    (f : 𝓢(Configuration n, ℂ))
    (h : Disjoint (tsupport f) (coincidenceLocus n)) : f ∈ zeroDiagonalSchwartz n := by
  rw [mem_zeroDiagonalSchwartz_iff]
  intro x k v
  rw [← SchwartzMap.iteratedLineDerivOp_eq_iteratedFDeriv]
  apply image_eq_zero_of_notMem_tsupport
  intro hx
  exact Set.disjoint_left.mp h
    (SchwartzMap.tsupport_iteratedLineDerivOp_subset v f hx) x.2

/-- Integer exponents of mass, length and time; multiplication of dimension monomials
becomes addition in this native integer module. -/
abbrev DimensionLattice := Fin 3 → ℤ

/-- The speed dimension is length/time. -/
def speedDimension : DimensionLattice := fun i =>
  if i = 1 then 1 else if i = 2 then -1 else 0

/-- The action dimension is mass*length²/time. -/
def actionDimension : DimensionLattice := fun i =>
  if i = 0 then 1 else if i = 1 then 2 else -1

/-- Setting c and ℏ to unit numerical values identifies their dimension vectors with zero. -/
def naturalUnitRelations : Submodule ℤ DimensionLattice :=
  Submodule.span ℤ ({speedDimension, actionDimension} : Set DimensionLattice)

/-- Mass degree in natural units: M^a L^b T^c has degree a-b-c. -/
def naturalMassDegree : DimensionLattice →ₗ[ℤ] ℤ :=
  (LinearMap.proj 0 : DimensionLattice →ₗ[ℤ] ℤ) - LinearMap.proj 1 - LinearMap.proj 2

/-- The only dimension relations imposed by setting c and ℏ to one. -/
theorem naturalMassDegree_ker :
    LinearMap.ker naturalMassDegree = naturalUnitRelations := by
  apply le_antisymm
  · intro d hd
    change d 0 - d 1 - d 2 = 0 at hd
    have hs : d = (d 1 - 2 * d 0) • speedDimension + d 0 • actionDimension := by
      ext i
      fin_cases i <;> simp [speedDimension, actionDimension] <;> omega
    rw [hs]
    exact Submodule.add_mem _
      (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
      (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
  · apply Submodule.span_le.mpr
    intro d hd
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hd
    rcases hd with rfl | rfl <;>
      norm_num [naturalMassDegree, speedDimension, actionDimension, LinearMap.mem_ker]

/-- The mass coordinate can realize every integer degree. -/
theorem naturalMassDegree_surjective : Function.Surjective naturalMassDegree := by
  intro n
  refine ⟨Pi.single 0 n, ?_⟩
  simp [naturalMassDegree]

/-- The natural-unit comparison constructed from the native first isomorphism theorem. -/
noncomputable def naturalUnitEquiv :
    (DimensionLattice ⧸ naturalUnitRelations) ≃ₗ[ℤ] ℤ :=
  (Submodule.quotEquivOfEq _ _ naturalMassDegree_ker.symm).trans
    (naturalMassDegree.quotKerEquivOfSurjective naturalMassDegree_surjective)

/-- Compatibility pins the sign and normalization of the quotient comparison. -/
theorem naturalUnitEquiv_mk (d : DimensionLattice) :
    naturalUnitEquiv (Submodule.Quotient.mk d) = naturalMassDegree d := by
  simp [naturalUnitEquiv]

/-- Rational physical exponents include the half-integer field dimensions. -/
abbrev RationalDimensionLattice := Fin 3 → ℚ

def rationalSpeedDimension : RationalDimensionLattice := fun i =>
  if i = 1 then 1 else if i = 2 then -1 else 0

def rationalActionDimension : RationalDimensionLattice := fun i =>
  if i = 0 then 1 else if i = 1 then 2 else -1

def rationalNaturalUnitRelations : Submodule ℚ RationalDimensionLattice :=
  Submodule.span ℚ ({rationalSpeedDimension, rationalActionDimension} :
    Set RationalDimensionLattice)

def rationalNaturalMassDegree : RationalDimensionLattice →ₗ[ℚ] ℚ :=
  (LinearMap.proj 0 : RationalDimensionLattice →ₗ[ℚ] ℚ) -
    LinearMap.proj 1 - LinearMap.proj 2

theorem rationalNaturalMassDegree_ker :
    LinearMap.ker rationalNaturalMassDegree = rationalNaturalUnitRelations := by
  apply le_antisymm
  · intro d hd
    change d 0 - d 1 - d 2 = 0 at hd
    have hs : d = (d 1 - 2 * d 0) • rationalSpeedDimension +
        d 0 • rationalActionDimension := by
      ext i
      fin_cases i <;> simp [rationalSpeedDimension, rationalActionDimension] <;> linarith
    rw [hs]
    exact Submodule.add_mem _
      (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
      (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
  · apply Submodule.span_le.mpr
    intro d hd
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hd
    rcases hd with rfl | rfl <;>
      norm_num [rationalNaturalMassDegree, rationalSpeedDimension,
        rationalActionDimension, LinearMap.mem_ker]

theorem rationalNaturalMassDegree_surjective : Function.Surjective rationalNaturalMassDegree := by
  intro n
  refine ⟨Pi.single 0 n, ?_⟩
  simp [rationalNaturalMassDegree]

noncomputable def rationalNaturalUnitEquiv :
    (RationalDimensionLattice ⧸ rationalNaturalUnitRelations) ≃ₗ[ℚ] ℚ :=
  (Submodule.quotEquivOfEq _ _ rationalNaturalMassDegree_ker.symm).trans
    (rationalNaturalMassDegree.quotKerEquivOfSurjective rationalNaturalMassDegree_surjective)

theorem rationalNaturalUnitEquiv_mk (d : RationalDimensionLattice) :
    rationalNaturalUnitEquiv (Submodule.Quotient.mk d) = rationalNaturalMassDegree d := by
  simp [rationalNaturalUnitEquiv]

/-- The rational quotient agrees with the proved integral quotient on integral exponents. -/
theorem rationalNaturalUnitEquiv_cast (d : DimensionLattice) :
    rationalNaturalUnitEquiv (Submodule.Quotient.mk (fun i => (d i : ℚ))) =
      (naturalUnitEquiv (Submodule.Quotient.mk d) : ℚ) := by
  simp [rationalNaturalUnitEquiv_mk, naturalUnitEquiv_mk,
    rationalNaturalMassDegree, naturalMassDegree]

/-- The Minkowski quadratic form in the chapter's `(+---)` convention. -/
def minkowskiSquare (p : Spacetime) : ℝ := p 0 ^ 2 - p 1 ^ 2 - p 2 ^ 2 - p 3 ^ 2

/-- A common invariant dense domain for an operator-valued distribution. The closure of the
operator is a separate theorem; this submodule is the declared algebraic domain. -/
structure CommonDomain (H : Type*) [NormedAddCommGroup H] [NormedSpace ℂ H] where
  carrier : Submodule ℂ H
  dense : Dense (carrier : Set H)

/-- An operator-valued tempered field on a fixed common domain, together with the distributional
matrix-coefficient continuity theorem. Each test function acts on the domain; this does not claim
that the resulting unbounded operator is bounded or everywhere defined. -/
structure OperatorValuedTemperedField (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] where
  domain : CommonDomain H
  operator : Test → domain.carrier →ₗ[ℂ] domain.carrier
  operator_add : ∀ f g ξ, operator (f + g) ξ = operator f ξ + operator g ξ
  operator_smul : ∀ (c : ℂ) f ξ, operator (c • f) ξ = c • operator f ξ
  weakCoefficient : domain.carrier → domain.carrier → Test →L[ℂ] ℂ
  coefficient_agrees : ∀ (f : Test) (ξ η : domain.carrier),
    weakCoefficient ξ η f = inner ℂ η.1 (operator f ξ).1

/-- A finite half-edge graph with labelled vertices. Fixed points of the involution are
external half-edges; two-element orbits are internal edges. Both halves may meet the same
vertex (a loop), and distinct orbits may join the same vertices (parallel edges).
RQFT5 adds decorations, external labels, isomorphisms and automorphism groups. -/
structure LabelledGraph (n : ℕ) where
  halfEdgeCount : ℕ
  incidentVertex : Fin halfEdgeCount → Fin n
  edgeInvolution : Equiv.Perm (Fin halfEdgeCount)
  pairing_involutive : Function.Involutive edgeInvolution

/-- Valence is computed from the actual incident half-edges. -/
def LabelledGraph.vertexFieldDegree {n : ℕ} (G : LabelledGraph n) (v : Fin n) : ℕ :=
  (Finset.univ.filter fun h => G.incidentVertex h = v).card

/-- External half-edges are exactly the fixed points of the pairing. -/
def LabelledGraph.externalLegs {n : ℕ} (G : LabelledGraph n) : Finset (Fin G.halfEdgeCount) :=
  Finset.univ.filter fun h => G.edgeInvolution h = h

/-- Choose exactly one half-edge in each internal two-element orbit. The resulting
list retains repeated vertex pairs and loops. Its order/orientation is presentation data. -/
def LabelledGraph.internalEdgePresentation {n : ℕ} (G : LabelledGraph n) :
    List (Fin n × Fin n) :=
  (Finset.univ.filter fun h => h < G.edgeInvolution h).toList.map
    (fun h => (G.incidentVertex h, G.incidentVertex (G.edgeInvolution h)))

/-- The legacy external-vertex list is derived from the external fixed half-edges. -/
def LabelledGraph.externalVertexPresentation {n : ℕ} (G : LabelledGraph n) :
    List (Fin n) := G.externalLegs.toList.map G.incidentVertex

/-- Recover actual valence from the two lists. A loop contributes once to each endpoint count. -/
theorem LabelledGraph.vertexFieldDegree_eq_presentation {n : ℕ}
    (G : LabelledGraph n) (v : Fin n) :
    G.vertexFieldDegree v =
      (G.internalEdgePresentation.countP fun e => e.1 == v) +
      (G.internalEdgePresentation.countP fun e => e.2 == v) +
      (G.externalVertexPresentation.countP fun w => w == v) := by
  sorry

/-- A formal coupling/propagator monomial attached to one labelled graph. Analytic distribution
amplitudes are a separate target and require the relevant product/extension hypotheses. -/
structure FormalGraphWeight (n : ℕ) where
  graph : LabelledGraph n
  couplingPower : ℕ
  propagatorPower : ℕ

/-- The open complement of the closed two-point diagonal. -/
def awayDiagonal : TopologicalSpace.Opens PairSpacetime := offDiagonal 2

/-- Actual compactly supported smooth tests on the complement, with the native LF topology.
Pointwise vanishing on the diagonal alone is insufficient for off-diagonal test data. -/
abbrev AwayDiagonalTests := TestFunction awayDiagonal ℂ ⊤

/-- The native inclusion of a smooth compactly supported test into Schwartz space. -/
def awayDiagonalToSchwartz (f : AwayDiagonalTests) : PairTest :=
  (TestFunction.toSchwartzMapCLM ℂ) f

/-- The native compact-support inclusion is complex-linear. -/
def awayDiagonalToSchwartzLinear : AwayDiagonalTests →ₗ[ℂ] PairTest :=
  (TestFunction.toSchwartzMapCLM ℂ).toLinearMap

/-- The LF inclusion is continuous by the native support-stage universal property. -/
theorem continuous_awayDiagonalToSchwartz : Continuous awayDiagonalToSchwartzLinear := by
  exact (TestFunction.toSchwartzMapCLM ℂ (Ω := awayDiagonal) (F := ℂ)).continuous

/-- The continuous linear inclusion used to compare ordinary and tempered extensions. -/
def awayDiagonalToSchwartzCLM : AwayDiagonalTests →L[ℂ] PairTest :=
  TestFunction.toSchwartzMapCLM ℂ

/-- Compactly supported off-diagonal tests belong to the closed flat Schwartz subspace. -/
theorem awayDiagonalToSchwartz_mem_zeroDiagonal (f : AwayDiagonalTests) :
    awayDiagonalToSchwartz f ∈ zeroDiagonalSchwartz 2 := by
  apply mem_zeroDiagonalSchwartz_of_disjoint_tsupport
  refine Set.disjoint_left.mpr ?_
  intro x hx hd
  exact (f.tsupport_subset hx : x ∉ coincidenceLocus 2) hd

/-- The same inclusion with the zero-diagonal subspace as codomain. -/
def awayDiagonalToZeroDiagonalCLM : AwayDiagonalTests →L[ℂ] ZeroDiagonalTests 2 :=
  awayDiagonalToSchwartzCLM.codRestrict (zeroDiagonalSchwartz 2)
    awayDiagonalToSchwartz_mem_zeroDiagonal

/-- Extension data for a continuous distribution on tests supported away from the diagonal.
This prototype requires a tempered extension; RQFT6 also owns ordinary distribution
extensions on compactly supported tests. Existence and scaling-degree control are separate
theorem targets, not opaque proposition fields. -/
structure TemperedDiagonalExtension where
  regularPart : AwayDiagonalTests →L[ℂ] ℂ
  extension : PairDistribution
  agreesOffDiagonal : ∀ f : AwayDiagonalTests,
    extension (awayDiagonalToSchwartzCLM f) = regularPart f

/-- The shared Gamma-normalized native M expression. This transparent consumer alias
introduces no hypergeometric construction; the analytic ODE is a supplier hypothesis below.
Its comparison with ordinary Kummer M excludes the nonpositive-integer b parameters. -/
abbrev kummerM (a b z : ℂ) : ℂ :=
  Complex.Gamma b * Complex.regularizedHGFun {a} {b} z

/-- Specialize the exact quantified shared M-equation hypothesis to radial parameters.
This representative consumer theorem does not prove the supplier's analytic construction. -/
theorem kummerM_differential_equation
    (hM : ∀ a b z : ℂ, (∀ n : ℕ, b ≠ -(n : ℂ)) →
      z * deriv (deriv (kummerM a b)) z + (b - z) * deriv (kummerM a b) z -
        a * kummerM a b z = 0)
    (a b z : ℂ) (hb : ∀ n : ℕ, b ≠ -(n : ℂ)) :
    z * deriv (deriv (kummerM a b)) z + (b - z) * deriv (kummerM a b) z -
      a * kummerM a b z = 0 :=
  hM a b z hb

/-- Transparent alias of the explicitly supplied shared family, not a chosen Tricomi solution.
Specializing `sharedU` to QF6b's actual constructor preserves that same all-b function.
An arbitrary supplied family is not identified as principal Tricomi by its ODE alone. -/
abbrev kummerU (sharedU : ℂ → ℂ → ℂ → ℂ) : ℂ → ℂ → ℂ → ℂ := sharedU

/-- Specialize the exact quantified shared U-equation hypothesis on its slit-plane domain.
The branch, Laplace normalization and continuation remain the definitive QF6b supplier targets. -/
theorem kummerU_differential_equation (sharedU : ℂ → ℂ → ℂ → ℂ)
    (hU : ∀ a b z : ℂ, z ∈ Complex.slitPlane →
      z * deriv (deriv (sharedU a b)) z + (b - z) * deriv (sharedU a b) z -
        a * sharedU a b z = 0)
    (a b z : ℂ) (hz : z ∈ Complex.slitPlane) :
    z * deriv (deriv (kummerU sharedU a b)) z +
      (b - z) * deriv (kummerU sharedU a b) z - a * kummerU sharedU a b z = 0 :=
  hU a b z hz

/-- The massive Klein--Gordon symbol in the source angular-frequency variable p.
For the Euclidean negative-phase kernel, p = 2πξ. For the Minkowski positive-phase
kernel, ξ = -η♭p / (2π), where η♭ negates the three spatial components. Both give
`massSq - 4π² * minkowskiSquare ξ`, since this quadratic form is invariant under
that reflection. For the Minkowski positive-phase kernel, positive physical energy
corresponds to negative Mathlib time frequency; the Euclidean negative-phase map preserves it.
Physical uses assume `0 ≤ massSq`; the symbol itself is defined for every real parameter.
A full construction proves the continuous advanced/retarded Green operators and
their causal support in RQFT1. -/
def kleinGordonSymbol (massSq : ℝ) (p : Spacetime) : ℝ :=
  massSq - minkowskiSquare p

/-- Formal coefficientwise perturbation data. It is a series, not a measure on a field space. -/
abbrev FormalSeries (R : Type*) := PowerSeries R

section CourseExamples

/-! Folded in from the former `CourseExamplesSuggested.lean`.
These are suggested forms. The README is the definitive specification.
The scalar estimates support the separately specified L² evolution theorem. -/

open scoped Quaternion TensorProduct

/-- The actual real-quaternion matrix model printed in Borcherds p101. -/
def quaternionPauli (q : ℍ[ℝ]) : Matrix (Fin 2) (Fin 2) ℂ :=
  !![(q.re : ℂ) + Complex.I * q.imI, (q.imJ : ℂ) + Complex.I * q.imK;
      -(q.imJ : ℂ) + Complex.I * q.imK, (q.re : ℂ) - Complex.I * q.imI]

/-- Complexifying the printed model gives the full matrix algebra. -/
theorem quaternionPauli_splitting :
    ∃ e : (ℂ ⊗[ℝ] ℍ[ℝ]) ≃ₐ[ℂ] Matrix (Fin 2) (Fin 2) ℂ,
      ∀ (z : ℂ) (q : ℍ[ℝ]), e (z ⊗ₜ[ℝ] q) = z • quaternionPauli q := by
  sorry

/-- Comparison with the existing abstract splitting is an actual inner automorphism. -/
theorem quaternionSplitting_inner
    (e : (ℂ ⊗[ℝ] ℍ[ℝ]) ≃ₐ[ℂ] Matrix (Fin 2) (Fin 2) ℂ) :
    ∃ g : (Matrix (Fin 2) (Fin 2) ℂ)ˣ, ∀ x,
      e x = (g : Matrix (Fin 2) (Fin 2) ℂ) *
        TauCeti.Quaternion.complexTensorAlgEquivMatrix x *
        (↑g⁻¹ : Matrix (Fin 2) (Fin 2) ℂ) := by
  sorry

/-- Positive KG energy after removing rest energy, in physical momentum magnitude r. -/
def kgRestSubtractedEnergy (m c r : ℝ) : ℝ :=
  Real.sqrt (m ^ 2 * c ^ 4 + c ^ 2 * r ^ 2) - m * c ^ 2

/-- The global dispersion remainder controls each finite momentum window. -/
theorem kg_energy_error (m c r : ℝ) (hm : 0 < m) (hc : 0 < c) (hr : 0 ≤ r) :
    0 ≤ r ^ 2 / (2 * m) - kgRestSubtractedEnergy m c r ∧
      r ^ 2 / (2 * m) - kgRestSubtractedEnergy m c r ≤
        r ^ 4 / (8 * m ^ 3 * c ^ 2) := by
  sorry

/-- The scalar phase estimate used under the momentum spectral integral. -/
theorem kg_phase_error (m c ℏ r t : ℝ) (hm : 0 < m) (hc : 0 < c)
    (hℏ : 0 < ℏ) (hr : 0 ≤ r) :
    ‖Complex.exp (-Complex.I * ((t * kgRestSubtractedEnergy m c r / ℏ : ℝ) : ℂ)) -
      Complex.exp (-Complex.I * ((t * r ^ 2 / (2 * m * ℏ) : ℝ) : ℂ))‖ ≤
        |t| * r ^ 4 / (8 * ℏ * m ^ 3 * c ^ 2) := by
  sorry

/-- The common mode factor is necessary when summing the two time orderings.
This rational statement is separate from the README's boundary-value theorem. -/
theorem photon_time_ordering_sum (ω r : ℂ) (hr : r ≠ 0)
    (hm : ω - r ≠ 0) (hp : ω + r ≠ 0) :
    ((ω - r)⁻¹ - (ω + r)⁻¹) / (2 * r) = (ω ^ 2 - r ^ 2)⁻¹ := by
  sorry

/-- Transverse exchange plus instantaneous Coulomb exchange for conserved currents.
The currents have complex bilinear contractions; no additional conjugation is inserted. -/
theorem coulomb_transverse_covariant (ω : ℝ) (k : Fin 3 → ℝ)
    (ρ₁ ρ₂ : ℂ) (j₁ j₂ : Fin 3 → ℂ)
    (hk : (∑ i, (k i : ℂ) ^ 2) ≠ 0)
    (hd : (ω : ℂ) ^ 2 - ∑ i, (k i : ℂ) ^ 2 ≠ 0)
    (h₁ : ∑ i, (k i : ℂ) * j₁ i = (ω : ℂ) * ρ₁)
    (h₂ : ∑ i, (k i : ℂ) * j₂ i = (ω : ℂ) * ρ₂) :
    let s : ℂ := ∑ i, (k i : ℂ) ^ 2
    let d : ℂ := (ω : ℂ) ^ 2 - s
    let transverse : Fin 3 → ℂ :=
      fun i => j₂ i - (k i : ℂ) * (∑ l, (k l : ℂ) * j₂ l) / s
    (∑ i, j₁ i * transverse i) / d + ρ₁ * ρ₂ / s =
      -(ρ₁ * ρ₂ - ∑ i, j₁ i * j₂ i) / d := by
  sorry

end CourseExamples

section FreeReflection

/-! Folded in from the former `FreeEuclideanReflectionTargets.lean`.
These targets pin RQFT7.FreeReflection's angular Fourier and massive-shell
normalizations on native Schwartz and L² carriers. Analytic proofs are targets. -/

open MeasureTheory
open scoped ComplexConjugate

namespace FreeReflection

abbrev Spatial := EuclideanSpace ℝ (Fin 3)
/-- Expose the native product-Haar instance through the volume definition. -/
local instance : (volume : Measure (ℝ × Spatial)).IsAddHaarMeasure := by
  change (volume.prod volume : Measure (ℝ × Spatial)).IsAddHaarMeasure
  infer_instance

abbrev EuclideanTest := 𝓢(ℝ × Spatial, ℂ)

/-- Schwartz tests flat on the closed nonpositive-time half-space. -/
def positiveTimeTests : Submodule ℂ EuclideanTest where
  carrier := {f | ∀ z, z.1 ≤ 0 → f z = 0}
  zero_mem' := by simp
  add_mem' := by
    intro f g hf hg z hz
    simp [hf z hz, hg z hz]
  smul_mem' := by
    intro c f hf z hz
    simp [hf z hz]

abbrev PositiveTest := positiveTimeTests

/-- Massive dispersion in the angular momentum variable p = 2πξ. -/
def omega (m : ℝ) (p : Spatial) : ℝ := Real.sqrt (‖p‖ ^ 2 + m ^ 2)

/-- RQFT3's scalar shell measure in its spatial chart. -/
def shellMeasure (m : ℝ) : Measure Spatial :=
  volume.withDensity fun p => ENNReal.ofReal (((2 * Real.pi) ^ 3 * (2 * omega m p))⁻¹)

abbrev OneParticle (m : ℝ) := Lp ℂ 2 (shellMeasure m)

/-- Unnormalized negative-phase spatial Fourier transform. -/
def spatialFourier (f : EuclideanTest) (t : ℝ) (p : Spatial) : ℂ :=
  ∫ x : Spatial, Complex.exp (-(inner ℝ x p : ℂ) * Complex.I) * f (t, x)

/-- Positive-time Laplace transform of the spatial Fourier transform. -/
def laplaceSpatial (m : ℝ) (f : PositiveTest) (p : Spatial) : ℂ :=
  ∫ t in Set.Ioi (0 : ℝ),
    (Real.exp (-omega m p * t) : ℂ) * spatialFourier f.val t p

/-- Actual native L² membership is required before forming the quotient vector. -/
theorem memLp_laplaceSpatial (m : ℝ) (hm : 0 < m) (f : PositiveTest) :
    MemLp (laplaceSpatial m f) 2 (shellMeasure m) := by
  sorry

/-- Its representative is the specified transform, not an arbitrary L² vector. -/
def toOneParticle (m : ℝ) (hm : 0 < m) (f : PositiveTest) : OneParticle m :=
  (memLp_laplaceSpatial m hm f).toLp (laplaceSpatial m f)

/-- The reflected two-time kernel after spatial Fourier transformation.
The README additionally requires its distributional agreement with G_m(θx-y). -/
def reflectedCovariance (m : ℝ) (f g : PositiveTest) : ℂ :=
  ∫ p : Spatial, (∫ t in Set.Ioi (0 : ℝ), ∫ s in Set.Ioi (0 : ℝ),
    conj (spatialFourier f.val t p) *
      (Real.exp (-omega m p * (t + s)) : ℂ) * spatialFourier g.val s p)
    ∂shellMeasure m

/-- Factorization with the invariant shell weight and a second-linear inner product. -/
theorem reflectedCovariance_eq_inner (m : ℝ) (hm : 0 < m) (f g : PositiveTest) :
    reflectedCovariance m f g = inner ℂ (toOneParticle m hm f) (toOneParticle m hm g) := by
  sorry

/-- Time Cauchy–Schwarz followed by angular spatial Plancherel. -/
theorem norm_toOneParticle_le (m : ℝ) (hm : 0 < m) (f : PositiveTest) :
    ‖toOneParticle m hm f‖ ≤ (2 * m)⁻¹ * ‖f.val.toLp 2 volume‖ := by
  sorry

/-- Every scalar one-particle vector is approximated by positive-time tests. -/
theorem denseRange_toOneParticle (m : ℝ) (hm : 0 < m) :
    DenseRange (toOneParticle m hm) := by
  sorry

end FreeReflection

end FreeReflection

section MassivePrescriptions

/-! Folded in from the former `MassivePrescriptionTargets.lean`.
RQFT1.MassivePrescriptions uses delta-normalized inverses with physical Fourier
phase +iη(p,x). These statements pin the boundary pairings and shell constants;
their analytic proofs are future work. -/

open Filter MeasureTheory
open scoped Topology

namespace MassivePrescriptions

abbrev Momentum := EuclideanSpace ℝ (Fin 4)
abbrev Spatial := EuclideanSpace ℝ (Fin 3)
abbrev Test := 𝓢(Momentum, ℂ)
abbrev Distribution := 𝓢'(Momentum, ℂ)

/-- Physical time-first mass shell in the angular momentum variable. -/
def shellPoint (m : ℝ) (positive : Bool) (k : Spatial) : Momentum :=
  WithLp.toLp 2 (Fin.cases
    ((if positive then 1 else -1) * Real.sqrt (‖k‖ ^ 2 + m ^ 2)) k)

/-- D± = θ(±p0)δ(q-m²); unlike W±, these contain no 2π factor. -/
def shellPairing (m : ℝ) (positive : Bool) (f : Test) : ℂ :=
  ∫ k : Spatial, f (shellPoint m positive k) /
    ((2 * Real.sqrt (‖k‖ ^ 2 + m ^ 2) : ℝ) : ℂ)

/-- Indices 0,1,2,3 mean retarded, advanced, Feynman, anti-Feynman. -/
def poleDenominator (m : ℝ) (i : Fin 4) (ε : ℝ) (p : Momentum) : ℂ :=
  let w2 : ℝ := (∑ j : Fin 3, (p j.succ) ^ 2) + m ^ 2
  if i = 0 then ((p 0 : ℂ) + Complex.I * ε) ^ 2 - w2
  else if i = 1 then ((p 0 : ℂ) - Complex.I * ε) ^ 2 - w2
  else if i = 2 then (p 0 : ℂ) ^ 2 - w2 + Complex.I * ε
  else (p 0 : ℂ) ^ 2 - w2 - Complex.I * ε

/-- The minus sign makes the eventual kernel solve P G=δ. -/
def regularizedPairing (m : ℝ) (i : Fin 4) (ε : ℝ) (f : Test) : ℂ :=
  ∫ p : Momentum, -(poleDenominator m i ε p)⁻¹ * f p

/-- Continuity is part of constructing the shell distributions. -/
theorem exists_shell_distributions (m : ℝ) (hm : 0 < m) :
    ∃ D : Bool → Distribution, ∀ positive f, D positive f = shellPairing m positive f := by
  sorry

/-- The boundary values are actual continuous complex-linear Schwartz functionals. -/
theorem exists_prescription_distributions (m : ℝ) (hm : 0 < m) :
    ∃ G : Fin 4 → Distribution, ∀ i f,
      Tendsto (fun ε => regularizedPairing m i ε f) (𝓝[>] (0 : ℝ)) (𝓝 (G i f)) := by
  sorry

/-- The common-source affine relation and the two frequency jumps. -/
theorem prescription_relations (m : ℝ) (hm : 0 < m) (G : Fin 4 → Distribution)
    (hG : ∀ i f,
      Tendsto (fun ε => regularizedPairing m i ε f) (𝓝[>] (0 : ℝ)) (𝓝 (G i f))) :
    G 0 + G 1 = G 2 + G 3 ∧
      (∀ f, G 2 f - G 1 f = (2 * Real.pi * Complex.I) * shellPairing m true f) ∧
      (∀ f, G 2 f - G 0 f = (2 * Real.pi * Complex.I) * shellPairing m false f) := by
  sorry

/-- The two mass-shell components give independent homogeneous solutions. -/
theorem shell_pairings_independent (m : ℝ) (hm : 0 < m) (a b : ℂ)
    (h : ∀ f : Test, a * shellPairing m true f + b * shellPairing m false f = 0) :
    a = 0 ∧ b = 0 := by
  sorry

end MassivePrescriptions

end MassivePrescriptions

section MasslessLimit

/-! Folded in from the former `MasslessLimitTargets.lean`.
RQFT7.MasslessLimit compares the actual Euclidean kernels as positive mass
approaches zero. Uniform convergence on von Neumann-bounded Schwartz sets
states the stronger estimate explicitly, without changing the native topology
on tempered distributions. These theorem admissions are future proofs. -/

open Filter MeasureTheory
open scoped Topology

namespace MasslessLimit

/-- The normalized massive one-dimensional Green function. -/
def greenOne (m x : ℝ) : ℝ := Real.exp (-m * |x|) / (2 * m)

abbrev Plane := EuclideanSpace ℝ (Fin 2)

/-- The massive planar heat representation, with an arbitrary value at its
single singular point. For m>0 and x≠0 the integral is convergent. -/
def greenTwo (m : ℝ) (x : Plane) : ℝ := by
  classical
  exact if x = 0 then 0 else
    ∫ t in Set.Ioi (0 : ℝ), (4 * Real.pi * t)⁻¹ *
      Real.exp (-m ^ 2 * t - ‖x‖ ^ 2 / (4 * t))

/-- A radius-one normalization for the constant subtraction. -/
def unitPoint : Plane := WithLp.toLp 2 ![(1 : ℝ), 0]

/-- The constant divergence is removed in position space, not by a position delta. -/
theorem greenOne_sub_const_tendstoUniformlyOn
    (s : Set 𝓢(ℝ, ℂ)) (hs : Bornology.IsVonNBounded ℂ s) :
    TendstoUniformlyOn
      (fun m f => ∫ x : ℝ, ((greenOne m x - (2 * m)⁻¹ : ℝ) : ℂ) * f x)
      (fun f => ∫ x : ℝ, ((-|x| / 2 : ℝ) : ℂ) * f x)
      (𝓝[>] (0 : ℝ)) s := by
  sorry

/-- The two-dimensional radial normalization is fixed at radius one. -/
theorem greenTwo_sub_const_tendstoUniformlyOn
    (s : Set 𝓢(Plane, ℂ)) (hs : Bornology.IsVonNBounded ℂ s) :
    TendstoUniformlyOn
      (fun m f => ∫ x : Plane, ((greenTwo m x - greenTwo m unitPoint : ℝ) : ℂ) * f x)
      (fun f => ∫ x : Plane, ((-Real.log ‖x‖ / (2 * Real.pi) : ℝ) : ℂ) * f x)
      (𝓝[>] (0 : ℝ)) s := by
  sorry

/-- The unrenormalized one-dimensional kernels really diverge on such tests. -/
theorem greenOne_pairing_tendsto_atTop (f : 𝓢(ℝ, ℝ))
    (hf : 0 < ∫ x : ℝ, f x) :
    Tendsto (fun m => ∫ x : ℝ, greenOne m x * f x) (𝓝[>] (0 : ℝ)) atTop := by
  sorry

/-- In dimensions at least three the native Fourier multipliers need no
constant subtraction. Their value at ξ=0 is immaterial to the integral. -/
theorem multiplier_tendstoUniformlyOn {n : ℕ} (hn : 3 ≤ n)
    (s : Set 𝓢(EuclideanSpace ℝ (Fin n), ℂ)) (hs : Bornology.IsVonNBounded ℂ s) :
    TendstoUniformlyOn
      (fun m f => ∫ ξ : EuclideanSpace ℝ (Fin n),
        (((4 * Real.pi ^ 2 * ‖ξ‖ ^ 2 + m ^ 2)⁻¹ : ℝ) : ℂ) * f ξ)
      (fun f => ∫ ξ : EuclideanSpace ℝ (Fin n),
        (((4 * Real.pi ^ 2 * ‖ξ‖ ^ 2)⁻¹ : ℝ) : ℂ) * f ξ)
      (𝓝[>] (0 : ℝ)) s := by
  sorry

end MasslessLimit

end MasslessLimit

section TorusGreen

/-! Folded in from the former `TorusGreenTargets.lean`.
These native characters and scalar mode formulas
calibrate the physical-volume normalization of RQFT7.TorusGreen. Construction
of periodic distributions and their inverse operators remains a target there. -/

open Filter
open scoped Topology

namespace TorusGreen

abbrev Frequency (n : ℕ) := Fin n → ℤ

def mode {n : ℕ} (k : Frequency n) : C(UnitAddTorus (Fin n), ℂ) :=
  UnitAddTorus.mFourier k

def energy {n : ℕ} (L : ℝ) (k : Frequency n) : ℝ :=
  (2 * Real.pi / L) ^ 2 * ∑ i, (k i : ℝ) ^ 2

def coefficient {n : ℕ} (L m : ℝ) (k : Frequency n) : ℝ :=
  (L ^ n * (energy L k + m ^ 2))⁻¹

def reducedCoefficient {n : ℕ} (L m : ℝ) (k : Frequency n) : ℝ := by
  classical
  exact if k = 0 then 0 else coefficient L m k

theorem coefficient_equation {n : ℕ} (L m : ℝ) (hL : 0 < L) (hm : 0 < m)
    (k : Frequency n) :
    (energy L k + m ^ 2) * coefficient L m k = (L ^ n)⁻¹ := by
  sorry

theorem reduced_coefficient_tendsto {n : ℕ} (L : ℝ) (hL : 0 < L)
    (k : Frequency n) :
    Tendsto (fun m ↦ coefficient L m k -
      if k = 0 then (L ^ n * m ^ 2)⁻¹ else 0)
      (𝓝[>] (0 : ℝ)) (𝓝 (reducedCoefficient L 0 k)) := by
  sorry

theorem coefficient_remainder {n : ℕ} (L m : ℝ) (hL : 0 < L) (hm : 0 ≤ m)
    (k : Frequency n) (hk : k ≠ 0) :
    |coefficient L m k - coefficient L 0 k| ≤
      m ^ 2 / (L ^ n * energy L k ^ 2) := by
  sorry

def circleGreen (L m d : ℝ) : ℝ :=
  Real.cosh (m * (L / 2 - d)) / (2 * m * Real.sinh (m * L / 2))

theorem circle_reduced_tendsto (L d : ℝ) (hL : 0 < L)
    (hd : 0 ≤ d ∧ d ≤ L / 2) :
    Tendsto (fun m ↦ circleGreen L m d - (m ^ 2 * L)⁻¹)
      (𝓝[>] (0 : ℝ)) (𝓝 (L / 12 - d / 2 + d ^ 2 / (2 * L))) := by
  sorry

end TorusGreen

end TorusGreen

end TauCetiRoadmap.RelativisticQuantumFieldTheory
