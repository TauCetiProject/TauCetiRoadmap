import TauCetiRoadmap.AlgebraicTopology.Suggested
import TauCetiRoadmap.DifferentialGeometry.Suggested
import TauCeti.AlgebraicTopology.Singular.Empty

/-!
AT 6.3 orientation comparison consumed by DG 9.3. The point class below is the image of the
actual AT ordered-simplex identity class. The oriented chart-overlap formula is derived from an
unsigned local-homology chart-change target; the local-section proof uses the chart-localization
results below. No class-valued choice is an input.
-/

noncomputable section
universe u
set_option maxHeartbeats 800000
set_option synthInstance.maxHeartbeats 800000
open CategoryTheory
open scoped ContDiff Manifold
open TauCetiRoadmap.AlgebraicTopology
open TauCetiRoadmap.DifferentialGeometry
namespace TauCetiRoadmap.AlgebraicTopology.OrientationComparison

abbrev Model (m : ℕ) := modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin m))
abbrev IntegralSystem (M : Type) [TopologicalSpace M] :=
  (TauCeti.LocalCoefficientSystem.constantFunctor (TopCat.of M)).obj (ModuleCat.of ℤ ℤ)
abbrev LocalHomology (m : ℕ) (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    (x : M) := twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)
      (IntegralSystem M) m

noncomputable def orderedVertex (m : ℕ) (j : Fin (m + 1)) : EuclideanSpace ℝ (Fin m) :=
  Fin.cases (-∑ i : Fin m, EuclideanSpace.basisFun (Fin m) ℝ i)
    (fun i : Fin m => EuclideanSpace.basisFun (Fin m) ℝ i) j
noncomputable def orderedVector (m : ℕ)
    (t : Convexity.StdSimplex ℝ (Fin (m + 1))) : EuclideanSpace ℝ (Fin m) :=
  t.weights.sum (fun j a => a • orderedVertex m j)
def orderedEdgeMatrix (m : ℕ) : Matrix (Fin m) (Fin m) ℝ :=
  fun i j => if i = j then 2 else 1
theorem orderedEdgeMatrix_det (m : ℕ) : (orderedEdgeMatrix m).det = (m + 1 : ℝ) := by
  sorry
theorem orderedVector_coordinates (m : ℕ) (x : fullSimplex m) (i : Fin m) :
    (orderedVector m (fullSimplexEquivStdSimplex m x)) i =
      (orderedVertex m ⟨0, Nat.zero_lt_succ m⟩) i +
        ∑ j : Fin m, orderedEdgeMatrix m i j * (x : EuclideanSpace ℝ (Fin m)) j := by
  sorry

/-- A concrete simplex based at an arbitrary chart anchor `a` and a point `y` in that chart.
Its relative-pair map lands in the punctured fibre at `y`; the chart transition law below compares
classes in this one fixed fibre. -/
structure ChartSimplexAt (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source) where
  radius : ℝ
  radius_pos : 0 < radius
  chartTarget : ∀ t : Convexity.StdSimplex ℝ (Fin (m + 1)),
    extChartAt (Model m) a y + radius • orderedVector m t ∈
      (chartAt (EuclideanSpace ℝ (Fin m)) a).target
  map : (coordinateSimplexPair m).fst ⟶ TopCat.of M
  map_formula : ∀ t : ULift (Convexity.StdSimplex ℝ (Fin (m + 1))),
    map t = (chartAt (EuclideanSpace ℝ (Fin m)) a).symm
      (extChartAt (Model m) a y + radius • orderedVector m t.down)
  boundary_avoids_point : ∀ t : (coordinateSimplexPair m).snd, map t.1 ≠ y

abbrev ChartSimplex (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M] (x : M) :=
  ChartSimplexAt m M x x (mem_chart_source (EuclideanSpace ℝ (Fin m)) x)

theorem chartSimplex_exists (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source) :
    Nonempty (ChartSimplexAt m M a y hy) := by
  sorry
noncomputable def chartSimplexPairMapAt (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) : coordinateSimplexPair m ⟶ puncturedPair (TopCat.of M) y :=
  TopPair.ofSubsetMap w.map (by
    intro t ht
    change w.map t ≠ y
    exact w.boundary_avoids_point ⟨t, ht⟩)

/-- The chart class is the image of AT's ordered-simplex identity class in the local-homology
fibre over the displayed point. -/
noncomputable def orderedChartImageAt (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) : LocalHomology m M y := by
  let P := puncturedPair (TopCat.of M) y
  let sourceClass := (P.twistedHomologyConstantIso (ModuleCat.of ℤ (ULift.{0} ℤ)) m).inv
    ((TopPair.singularHomologyMap (C := ModuleCat.{0} ℤ)
      (chartSimplexPairMapAt m M a y hy w) (ModuleCat.of ℤ (ULift.{0} ℤ)) m).hom
        (coordinateSimplexIdentityClass.{0} m))
  exact (P.twistedHomologyCoefficientMap
    ((TauCeti.LocalCoefficientSystem.constantFunctor P.fst).map
      (ModuleCat.ofHom ULift.moduleEquiv.toLinearMap)) m).hom sourceClass

theorem chartSimplexWitness_exists (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M] (x : M) :
    Nonempty (ChartSimplex m M x) :=
  chartSimplex_exists m M x x (mem_chart_source (EuclideanSpace ℝ (Fin m)) x)

noncomputable def chartSimplexPairMap (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M] (x : M)
    (w : ChartSimplex m M x) : coordinateSimplexPair m ⟶ puncturedPair (TopCat.of M) x :=
  chartSimplexPairMapAt m M x x (mem_chart_source (EuclideanSpace ℝ (Fin m)) x) w

abbrev orderedChartImage (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M] (x : M)
    (w : ChartSimplex m M x) : LocalHomology m M x :=
  orderedChartImageAt m M x x (mem_chart_source (EuclideanSpace ℝ (Fin m)) x) w

noncomputable def modelOrientationSign (m : ℕ) {M : Type} [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (l : OrientationLift (Model m) M (Fin m)) : ℤ := by
  classical
  exact if l.modelOrientation = (EuclideanSpace.basisFun (Fin m) ℝ).toBasis.orientation
    then 1 else -1

/-- Flipping the model orientation flips the scalar which compares it with the standard basis. -/
theorem modelOrientationSign_flip (m : ℕ) {M : Type} [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (l : OrientationLift (Model m) M (Fin m)) :
    modelOrientationSign m { l with modelOrientation := -l.modelOrientation } =
      -modelOrientationSign m l := by
  classical
  let b := (EuclideanSpace.basisFun (Fin m) ℝ).toBasis.orientation
  have hflip : -b ≠ b := (Module.Ray.ne_neg_self b).symm
  by_cases hb : l.modelOrientation = b
  · simp [modelOrientationSign, b, hb, hflip]
  · have hneg : l.modelOrientation = -b :=
      (Module.Basis.orientation_ne_iff_eq_neg (EuclideanSpace.basisFun (Fin m) ℝ).toBasis
        l.modelOrientation).mp hb
    unfold modelOrientationSign
    rw [hneg]
    rw [show - -b = b from neg_neg b]
    simp [b, hflip]

/-- Signed coefficient at any point of a chart source, with the point distinct from the
chart anchor in the interface. Transition Jacobians are used only to compare two charts. -/
noncomputable def rawChartCoefficient_at (m : ℕ) (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (l : OrientationLift (Model m) M (Fin m)) (a y : M)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source) : ℤ :=
  modelOrientationSign m l * (l.sign a ⟨y, hy⟩ : ℤ)

/-- The diagonal coefficient used in the selected point generator is this same chart value. -/
theorem rawChartCoefficient_at_self (m : ℕ) (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (l : OrientationLift (Model m) M (Fin m)) (x : M) :
    rawChartCoefficient_at m M l x x (mem_chart_source (EuclideanSpace ℝ (Fin m)) x) =
      modelOrientationSign m l *
        (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) := rfl

/-- Simultaneously changing the model orientation and the chart sign leaves the raw coefficient
unchanged at every point of the chart source, not only at the chart anchor.
-/
theorem orientationCoefficient_raw_relation_at (m : ℕ) (M : Type)
    [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (l l' : OrientationLift (Model m) M (Fin m)) (a y : M)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (h : l' = l ∨
      (l'.modelOrientation = -l.modelOrientation ∧
        l'.sign = fun a y ↦ -l.sign a y)) :
    rawChartCoefficient_at m M l' a y hy = rawChartCoefficient_at m M l a y hy := by
  rcases h with h | ⟨hmodel, hsign⟩
  · simp [rawChartCoefficient_at, h]
  · have hmodelSign : modelOrientationSign m l' = -modelOrientationSign m l := by
      let b := (EuclideanSpace.basisFun (Fin m) ℝ).toBasis.orientation
      have hflip : -b ≠ b := (Module.Ray.ne_neg_self b).symm
      by_cases hb : l.modelOrientation = b
      · simp [modelOrientationSign, b, hmodel, hb, hflip]
      · have hneg : l.modelOrientation = -b :=
          (Module.Basis.orientation_ne_iff_eq_neg (EuclideanSpace.basisFun (Fin m) ℝ).toBasis
            l.modelOrientation).mp hb
        unfold modelOrientationSign
        rw [hmodel, hneg]
        rw [show - -b = b from neg_neg b]
        simp [b, hflip]
    have hchartSign :
        (l'.sign a ⟨y, hy⟩ : ℤ) = -(l.sign a ⟨y, hy⟩ : ℤ) := by
      rw [hsign]
      simp
    simp only [rawChartCoefficient_at]
    rw [hmodelSign, hchartSign]
    ring


theorem orientationCoefficient_raw_relation (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l l' : OrientationLift (Model m) M (Fin m)) (x : M)
    (h : l' = l ∨
      (l'.modelOrientation = -l.modelOrientation ∧ l'.sign = fun a y ↦ -l.sign a y)) :
    modelOrientationSign m l' *
        (l'.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) =
      modelOrientationSign m l *
        (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) := by
  rcases h with h | ⟨hmodel, hsign⟩
  · simp [h]
  · have hmodelSign : modelOrientationSign m l' = -modelOrientationSign m l := by
      have h1 : modelOrientationSign m l' =
          modelOrientationSign m { l with modelOrientation := -l.modelOrientation } := by
        unfold modelOrientationSign
        rw [hmodel]
      exact h1.trans (modelOrientationSign_flip m l)
    have hchartSign :
        (l'.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) =
          - (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) := by
      rw [hsign]
      simp
    rw [hmodelSign, hchartSign]
    ring

/-- Raw coefficient invariance under the orientation-lift relation. This is proved before
quotient descent and does not depend on any formula for the descended point generator. -/
theorem orientationCoefficient_lift_independent (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l l' : OrientationLift (Model m) M (Fin m)) (x : M)
    (h : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l =
      Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l') :
    modelOrientationSign m l' *
        (l'.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) =
      modelOrientationSign m l *
        (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) := by
  exact orientationCoefficient_raw_relation m M l l' x (Quotient.exact h)

/-- Fixed-witness chart classes respect the raw lift relation, before choosing a quotient
representative. Witness independence remains the separate geometric target below. -/
theorem rawChartGenerator_lift_independent (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l l' : OrientationLift (Model m) M (Fin m)) (x : M)
    (w : ChartSimplex m M x)
    (h : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l =
      Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l') :
    (modelOrientationSign m l' *
        (l'.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
        orderedChartImage m M x w =
      (modelOrientationSign m l *
        (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
        orderedChartImage m M x w := by
  exact congrArg (fun a : ℤ => a • orderedChartImage m M x w)
    (orientationCoefficient_lift_independent m M l l' x h)

/-- The orientation-lift quotient and the chart Jacobian both enter the coefficient. -/
noncomputable def pointGenerator (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m)) (x : M) : LocalHomology m M x := by
  let l := Quotient.out o
  let w := Classical.choice (chartSimplex_exists m M x x
    (mem_chart_source (EuclideanSpace ℝ (Fin m)) x))
  exact (modelOrientationSign m l *
    (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
      orderedChartImage m M x w


/-- Raw representative formula for the chosen quotient representative. `pointGenerator` is
literally the signed image of AT's ordered-simplex identity class through the chart selected at
`x`; this formula is definitional and does not follow merely from quotient congruence. -/
theorem pointGenerator_raw_representative (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m)) (x : M) :
    pointGenerator m M o x =
      ((modelOrientationSign m (Quotient.out o) *
        ((Quotient.out o).sign x
          ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ) : ℤ) •
        orderedChartImage m M x (Classical.choice (chartSimplexWitness_exists m M x))) := rfl


/-- The actual raw chart-transition Jacobian law used in the overlap comparison. Its direction
matches `OrientationLift.sign_mul_sign`: chart `a'` after the inverse of chart `a`, differentiated
at the coordinate `extChartAt I a y`. Thus the transition determinant is the cocycle that cancels
the two chart signs; this is not inferred from an informal orientation convention. -/
theorem chart_transition_determinant_sign (m : ℕ) (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [FiniteDimensional ℝ (EuclideanSpace ℝ (Fin m))]
    (l : OrientationLift (Model m) M (Fin m)) (a a' y : M)
    (ha : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (ha' : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a').source) :
    ((l.sign a ⟨y, ha⟩ * l.sign a' ⟨y, ha'⟩ : ℤˣ) : ℤ) =
      (SignType.sign (LinearMap.det
        (fderivWithin ℝ (extChartAt (Model m) a' ∘ (extChartAt (Model m) a).symm)
          (Set.range (Model m)) (extChartAt (Model m) a y) :
            EuclideanSpace ℝ (Fin m) →ₗ[ℝ] EuclideanSpace ℝ (Fin m))) : ℤ) :=
  l.sign_mul_sign a a' y ha ha'

/-- Unsigned chart-change law in a single local-homology fibre. No orientation is chosen:
changing the chart multiplies the ordered-simplex class by the sign of the transition Jacobian. -/
theorem orderedChartImageAt_chartChange (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a a' y : M)
    (ha : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (ha' : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a').source)
    (w : ChartSimplexAt m M a y ha) (w' : ChartSimplexAt m M a' y ha') :
    orderedChartImageAt m M a y ha w =
      (SignType.sign (LinearMap.det
        (fderivWithin ℝ (extChartAt (Model m) a' ∘ (extChartAt (Model m) a).symm)
          (Set.range (Model m)) (extChartAt (Model m) a y) :
            EuclideanSpace ℝ (Fin m) →ₗ[ℝ] EuclideanSpace ℝ (Fin m))) : ℤ) •
        orderedChartImageAt m M a' y ha' w' := by
  sorry

/-- The two-anchor overlap law for a chosen orientation is derived from the unsigned law
and the chart-sign cocycle. The only geometric input is `orderedChartImageAt_chartChange`. -/
theorem chart_overlap_generator (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m)) (a a' y : M)
    (ha : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (ha' : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a').source)
    (w : ChartSimplexAt m M a y ha) (w' : ChartSimplexAt m M a' y ha') :
    (modelOrientationSign m (Quotient.out o) *
      ((Quotient.out o).sign a ⟨y, ha⟩ : ℤ)) • orderedChartImageAt m M a y ha w =
    (modelOrientationSign m (Quotient.out o) *
      ((Quotient.out o).sign a' ⟨y, ha'⟩ : ℤ)) • orderedChartImageAt m M a' y ha' w' := by
  let l := Quotient.out o
  let u : ℤ := (l.sign a ⟨y, ha⟩ : ℤ)
  let v : ℤ := (l.sign a' ⟨y, ha'⟩ : ℤ)
  let d : ℤ := SignType.sign (LinearMap.det
    (fderivWithin ℝ (extChartAt (Model m) a' ∘ (extChartAt (Model m) a).symm)
      (Set.range (Model m)) (extChartAt (Model m) a y) :
        EuclideanSpace ℝ (Fin m) →ₗ[ℝ] EuclideanSpace ℝ (Fin m)))
  let c : ℤ := modelOrientationSign m l * u
  let c' : ℤ := modelOrientationSign m l * v
  have hdet : u * v = d := by
    simpa [u, v, d, l] using chart_transition_determinant_sign m M l a a' y ha ha'
  have hu : u * u = 1 := by
    dsimp [u]
    rcases Int.units_eq_one_or (l.sign a ⟨y, ha⟩) with h | h <;> simp [h]
  have hcoef : c * d = c' := by
    dsimp [c, c']
    calc
      (modelOrientationSign m l * u) * d =
          modelOrientationSign m l * (u * (u * v)) := by rw [hdet]; ring
      _ = modelOrientationSign m l * v := by
        rw [show u * (u * v) = (u * u) * v by ring, hu]
        ring
  rw [orderedChartImageAt_chartChange m M a a' y ha ha' w w']
  change c • (d • orderedChartImageAt m M a' y ha' w') =
    c' • orderedChartImageAt m M a' y ha' w'
  calc
    c • (d • orderedChartImageAt m M a' y ha' w') =
        (c * d) • orderedChartImageAt m M a' y ha' w' := by
          simpa using (smul_smul c d (orderedChartImageAt m M a' y ha' w'))
    _ = c' • orderedChartImageAt m M a' y ha' w' := by rw [hcoef]

theorem pointGenerator_chartWitness_independent (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l : OrientationLift (Model m) M (Fin m)) (x : M) (w w' : ChartSimplex m M x) :
    (modelOrientationSign m l *
      (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
        orderedChartImage m M x w =
    (modelOrientationSign m l *
      (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
        orderedChartImage m M x w' := by
  sorry

theorem pointGenerator_chartFormula (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (l : OrientationLift (Model m) M (Fin m)) (x : M) (w : ChartSimplex m M x) :
    pointGenerator m M (Quotient.mk _ l) x =
      (modelOrientationSign m l *
        (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
          orderedChartImage m M x w := by
  let l₀ := Quotient.out (Quotient.mk
    (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l)
  have hout : Quotient.mk
      (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l₀ =
      Quotient.mk _ l := Quotient.out_eq _
  have hc := orientationCoefficient_lift_independent m M l₀ l x hout
  change (modelOrientationSign m l₀ *
      (l₀.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
      orderedChartImage m M x (Classical.choice (chartSimplexWitness_exists m M x)) = _
  rw [← hc]
  exact pointGenerator_chartWitness_independent m M l x
    (Classical.choice (chartSimplexWitness_exists m M x)) w

/-- The oriented point generator at an arbitrary point equals the signed chart class from
any anchor chart containing that point and any representative of the orientation quotient. -/
theorem pointGenerator_eq_rawChartCoefficient_at (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m))
    (l : OrientationLift (Model m) M (Fin m))
    (hl : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l = o)
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) :
    pointGenerator m M o y =
      (rawChartCoefficient_at m M l a y hy : ℤ) • orderedChartImageAt m M a y hy w := by
  classical
  let q := Quotient.out o
  let hq : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) q =
      Quotient.mk _ l := (Quotient.out_eq o).trans hl.symm
  have hrel := Quotient.exact hq
  have hrawY := orientationCoefficient_raw_relation_at m M q l y y
    (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) hrel
  have hrawA := orientationCoefficient_raw_relation_at m M q l a y hy hrel
  let wy := Classical.choice (chartSimplexWitness_exists m M y)
  have hoverlap := chart_overlap_generator m M o y a y
    (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) hy wy w
  have hformula := pointGenerator_chartFormula m M q y wy
  have hout := Quotient.out_eq o
  calc
    pointGenerator m M o y = pointGenerator m M (Quotient.mk _ q) y := by
      exact congrArg (fun z => pointGenerator m M z y) hout.symm
    _ = (rawChartCoefficient_at m M q y y
        (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) : ℤ) •
          orderedChartImageAt m M y y (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) wy := by
      simpa [rawChartCoefficient_at, q] using hformula
    _ = (rawChartCoefficient_at m M l y y
        (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) : ℤ) •
          orderedChartImageAt m M y y (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) wy := by
      rw [hrawY]
    _ = (rawChartCoefficient_at m M l a y hy : ℤ) • orderedChartImageAt m M a y hy w := by
      have hoverlapRaw :
          rawChartCoefficient_at m M q y y
              (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) •
                orderedChartImageAt m M y y
                  (mem_chart_source (EuclideanSpace ℝ (Fin m)) y) wy =
          rawChartCoefficient_at m M q a y hy • orderedChartImageAt m M a y hy w := by
        simpa [rawChartCoefficient_at] using hoverlap
      rw [← hrawY, ← hrawA] at hoverlapRaw
      exact hoverlapRaw

/-- Zero-dimensional signed point normalization in an arbitrary chart: the local generator is
exactly the chart's raw orientation coefficient times the image of its coordinate 0-simplex.
This records the sign and the local point class; it does not identify `H₀` with a global finite
sum of point classes. -/
theorem pointGenerator_zero (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M]
    [IsManifold (Model 0) ∞ M] [BoundarylessManifold (Model 0) M]
    (o : Manifold.Orientation (Model 0) M (Fin 0)) (a y : M)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin 0)) a).source)
    (w : ChartSimplexAt 0 M a y hy) :
    pointGenerator 0 M o y =
      (rawChartCoefficient_at 0 M (Quotient.out o) a y hy : ℤ) •
        orderedChartImageAt 0 M a y hy w := by
  exact pointGenerator_eq_rawChartCoefficient_at 0 M o (Quotient.out o)
    (Quotient.out_eq o) a y hy w

/-- The dimension-zero orientation sign compares the orientation at a point with the orientation
of the canonical empty basis of `EuclideanSpace ℝ (Fin 0)`. This is the shared meaning of the
`ε_o(x)` appearing in the DG 9.3 zero-dimensional formula. -/
noncomputable def orientationSignAt (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M]
    (o : Manifold.Orientation (Model 0) M (Fin 0)) (x : M) : ℤˣ := by
  classical
  exact if orientationAt o x = (EuclideanSpace.basisFun (Fin 0) ℝ).toBasis.orientation
    then 1 else -1

/-- For the chart centered at `x`, the raw chart coefficient in dimension zero is precisely the
orientation relative to the empty ordered basis. -/
theorem orientationSignAt_eq_rawChartCoefficient (M : Type) [TopologicalSpace M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M] [IsManifold (Model 0) ∞ M]
    [BoundarylessManifold (Model 0) M]
    (o : Manifold.Orientation (Model 0) M (Fin 0)) (x : M) :
    (orientationSignAt M o x : ℤ) =
      rawChartCoefficient_at 0 M (Quotient.out o) x x
        (mem_chart_source (EuclideanSpace ℝ (Fin 0)) x) := by
  sorry

/-- The ordered coordinate 0-simplex is the unsigned positive point class. Its value is
independent of the simplex witness (the coordinate domain is the singleton `EuclideanSpace ℝ
(Fin 0)`). -/
theorem orderedChartImageAt_zero_witness_independent (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M] [IsManifold (Model 0) ∞ M]
    [BoundarylessManifold (Model 0) M]
    (x : M) (w w' : ChartSimplex 0 M x) :
    orderedChartImage 0 M x w = orderedChartImage 0 M x w' := by
  sorry

/-- The selected local generator is the empty-basis sign times the positive coordinate point
class. This is the dimension-zero specialization consumed by integration. -/
theorem pointGenerator_zero_orientationAt (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin 0)) M]
    [IsManifold (Model 0) ∞ M] [BoundarylessManifold (Model 0) M]
    (o : Manifold.Orientation (Model 0) M (Fin 0)) (x : M) (w : ChartSimplex 0 M x) :
    pointGenerator 0 M o x =
      (orientationSignAt M o x : ℤ) • orderedChartImage 0 M x w := by
  sorry

/-- Congruence for already equal orientation quotient classes; raw invariance is proved above. -/
theorem pointGenerator_quotient_congr (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l l' : OrientationLift (Model m) M (Fin m)) (x : M)
    (h : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l =
      Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l') :
    pointGenerator m M (Quotient.mk _ l) x = pointGenerator m M (Quotient.mk _ l') x := by
  exact congrArg (fun o => pointGenerator m M o x) h

/-- Reversing the chosen tangent orientation negates its normalized integral point generator.
This is the scalar sign calculation on one chart witness, before any integration comparison. -/
theorem pointGenerator_neg (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m)) (x : M) :
    pointGenerator m M o.neg x = -pointGenerator m M o x := by
  classical
  let l := Quotient.out o
  let w := Classical.choice (chartSimplexWitness_exists m M x)
  have ho : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l = o :=
    Quotient.out_eq o
  have hneg : o.neg = Quotient.mk _ { l with modelOrientation := -l.modelOrientation } := by
    rw [← ho]
    rfl
  have hout : Quotient.mk
      (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m))
      (Quotient.out o.neg) =
      Quotient.mk _ { l with modelOrientation := -l.modelOrientation } :=
    (Quotient.out_eq o.neg).trans hneg
  have hc := orientationCoefficient_lift_independent m M (Quotient.out o.neg)
    { l with modelOrientation := -l.modelOrientation } x hout
  change (modelOrientationSign m (Quotient.out o.neg) *
      ((Quotient.out o.neg).sign x
        ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
      orderedChartImage m M x w =
    -((modelOrientationSign m l *
      (l.sign x ⟨x, mem_chart_source (EuclideanSpace ℝ (Fin m)) x⟩ : ℤ)) •
      orderedChartImage m M x w)
  rw [← hc, modelOrientationSign_flip]
  simp only [neg_mul, neg_zsmul]

/-! AT-owned chart-local support constructions. Kept in this module so the selected section
can consume the actual signed local-image theorem without an import cycle. -/
abbrev StdSimplexInterior (m : ℕ) :=
  {t : Convexity.StdSimplex ℝ (Fin (m + 1)) | ∀ i, 0 < t.weights i}

def chartSimplexInteriorImage (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) : Set M :=
  Set.range fun t : StdSimplexInterior m => w.map (ULift.up t.1)

theorem chartSimplexAt_map_injective (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) : Function.Injective w.map := by
  sorry

theorem chartSimplexAt_boundary_disjoint_interiorImage (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) :
    Disjoint (Set.range fun t : (coordinateSimplexPair m).snd => w.map t.1)
      (chartSimplexInteriorImage m M a y hy w) := by
  sorry

theorem chartSimplexInteriorImage_subset_chartSource (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) :
    chartSimplexInteriorImage m M a y hy w ⊆
      (chartAt (EuclideanSpace ℝ (Fin m)) a).source := by
  sorry

/-- Continuous chart signs are constant on a connected subset of one chart source. This is the
local-constancy step: the codomain `ℤˣ` has its discrete topology and the source sign is the
`OrientationLift.continuous_sign` field.
-/
theorem chartSign_constant_on_connected (m : ℕ) (M : Type)
    [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    (l : OrientationLift (Model m) M (Fin m)) (a : M) (S : Set M)
    (hS : IsConnected S)
    (hsource : S ⊆ (chartAt (EuclideanSpace ℝ (Fin m)) a).source) :
    ∀ x (hx : x ∈ S) y (hy : y ∈ S),
      l.sign a ⟨x, hsource hx⟩ = l.sign a ⟨y, hsource hy⟩ := by
  sorry

theorem chartSimplexAt_anchor_mem_interiorImage (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) :
    y ∈ chartSimplexInteriorImage m M a y hy w := by
  sorry

/-- The pair map is induced by the actual chart simplex.  The support hypothesis places the
support in the positive-weight simplex image; injectivity separates it from every boundary face.
-/
noncomputable def chartSimplexSupportPairMap (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) (S : Set M)
    (hS : S ⊆ chartSimplexInteriorImage m M a y hy w) :
    coordinateSimplexPair m ⟶ TopPair.ofSubset (X := TopCat.of M) Sᶜ := by
  refine TopPair.ofSubsetMap w.map ?_
  intro z hz
  change w.map z ∈ Sᶜ
  intro hnot
  have hboundary : w.map z ∈ Set.range fun t : (coordinateSimplexPair m).snd => w.map t.1 :=
    ⟨⟨z, hz⟩, rfl⟩
  have hinterior := hS hnot
  exact (Set.disjoint_left.mp (chartSimplexAt_boundary_disjoint_interiorImage
    m M a y hy w) hboundary hinterior)

/-- The support class is the image of AT's ordered identity class.  The two coefficient changes
are explicit: the relative constant-system isomorphism and the constant-functor map induced by
`ULift.moduleEquiv`.
-/
noncomputable def chartSimplexSupportClass (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) (S : Set M)
    (hS : S ⊆ chartSimplexInteriorImage m M a y hy w) :
    twistedRelativeHomology ℤ (TopPair.ofSubset (X := TopCat.of M) Sᶜ)
      (IntegralSystem M) m := by
  let P := TopPair.ofSubset (X := TopCat.of M) Sᶜ
  let c := (P.twistedHomologyConstantIso (ModuleCat.of ℤ (ULift.{0} ℤ)) m).inv
    ((TopPair.singularHomologyMap (C := ModuleCat.{0} ℤ)
      (chartSimplexSupportPairMap m M a y hy w S hS)
      (ModuleCat.of ℤ (ULift.{0} ℤ)) m).hom (coordinateSimplexIdentityClass.{0} m))
  exact (P.twistedHomologyCoefficientMap
    ((TauCeti.LocalCoefficientSystem.constantFunctor P.fst).map
      (ModuleCat.ofHom ULift.moduleEquiv.toLinearMap)) m).hom c

/-- The geometric local-image theorem is unsigned: localizing the image of the ordered simplex
identity class gives the recentered ordered-simplex class, with no orientation lift in the
statement. This avoids making an orientation-independent class depend on `l`.
-/
theorem chartSimplexSupportClass_local_image (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) (S : Set M)
    (hS : S ⊆ chartSimplexInteriorImage m M a y hy w)
    (x : M) (hx : x ∈ S)
    (hxchart : x ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w' : ChartSimplexAt m M a x hxchart) :
    (twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m S x hx).hom
        (chartSimplexSupportClass m M a y hy w S hS) =
      orderedChartImageAt m M a x hxchart w' := by
  sorry

/-- Scalar compatibility of the native support-local homology map. -/
theorem twistedSupportLocalMap_smul (m : ℕ) (M : Type) [TopologicalSpace M]
    [T2Space M] [SecondCountableTopology M]
    (S : Set M) (x : M) (hx : x ∈ S)
    (c : ℤ)
    (z : twistedRelativeHomology ℤ (TopPair.ofSubset (X := TopCat.of M) Sᶜ)
      (IntegralSystem M) m) :
    (twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m S x hx).hom (c • z) =
      c • (twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m S x hx).hom z := by
  exact map_zsmul _ c z

/- The positive-weight simplex is connected, and its chart image remains connected. This is the
topological input that turns local constancy of the ±1 chart sign into constancy on the whole
simplex image.
-/
theorem chartSimplexInteriorImage_isConnected (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) :
    IsConnected (chartSimplexInteriorImage m M a y hy w) := by
  sorry

/-- The positive-weight simplex image is open in the manifold. The proof is the image of
the open standard simplex under the chart diffeomorphism and the nondegenerate affine simplex map. -/
theorem chartSimplexInteriorImage_isOpen (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) : IsOpen (chartSimplexInteriorImage m M a y hy w) := by
  sorry

theorem rawChartCoefficient_at_constant_on_chartSimplexInterior (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l : OrientationLift (Model m) M (Fin m)) (a y : M)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) :
    ∀ x ∈ chartSimplexInteriorImage m M a y hy w,
      ∀ hxchart : x ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source,
        rawChartCoefficient_at m M l a x hxchart = rawChartCoefficient_at m M l a y hy := by
  have hconn := chartSimplexInteriorImage_isConnected m M a y hy w
  have hsource := chartSimplexInteriorImage_subset_chartSource m M a y hy w
  have hcenter := chartSimplexAt_anchor_mem_interiorImage m M a y hy w
  intro x hx hxchart
  have hsign := chartSign_constant_on_connected m M l a
    (chartSimplexInteriorImage m M a y hy w) hconn hsource x hx y hcenter
  have hsignZ : (l.sign a ⟨x, hxchart⟩ : ℤ) = (l.sign a ⟨y, hy⟩ : ℤ) :=
    congrArg (fun s : ℤˣ => (s : ℤ)) hsign
  simp only [rawChartCoefficient_at]
  rw [hsignZ]

/-- Multiply the unsigned support class by its raw coefficient at the original chart center.
Connected-image constancy identifies this scalar with the coefficient at each support point.
-/
theorem chartSimplexSupportClass_signed_local_image (m : ℕ) (M : Type)
    [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (l : OrientationLift (Model m) M (Fin m)) (a y : M)
    (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) (S : Set M)
    (hS : S ⊆ chartSimplexInteriorImage m M a y hy w)
    (x : M) (hx : x ∈ S)
    (hxchart : x ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w' : ChartSimplexAt m M a x hxchart) :
    (twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m S x hx).hom
        ((rawChartCoefficient_at m M l a y hy : ℤ) •
          chartSimplexSupportClass m M a y hy w S hS) =
      (rawChartCoefficient_at m M l a x hxchart : ℤ) •
        orderedChartImageAt m M a x hxchart w' := by
  rw [twistedSupportLocalMap_smul m M S x hx
    (rawChartCoefficient_at m M l a y hy : ℤ)
    (chartSimplexSupportClass m M a y hy w S hS)]
  rw [chartSimplexSupportClass_local_image m M a y hy w S hS x hx hxchart w']
  rw [rawChartCoefficient_at_constant_on_chartSimplexInterior
    m M l a y hy w x (hS hx) hxchart]

/-- A signed chart-support class represents the selected point generator at every point of
its support, using the arbitrary-anchor and arbitrary-lift chart formula. -/
theorem chartSimplexSupportClass_signed_local_image_pointGenerator
    (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold (Model m) ∞ M]
    [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m))
    (l : OrientationLift (Model m) M (Fin m))
    (hl : Quotient.mk (OrientationLift.setoid (I := Model m) (M := M) (ι := Fin m)) l = o)
    (a y : M) (hy : y ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w : ChartSimplexAt m M a y hy) (S : Set M)
    (hS : S ⊆ chartSimplexInteriorImage m M a y hy w)
    (x : M) (hx : x ∈ S)
    (hxchart : x ∈ (chartAt (EuclideanSpace ℝ (Fin m)) a).source)
    (w' : ChartSimplexAt m M a x hxchart) :
    (twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m S x hx).hom
        ((rawChartCoefficient_at m M l a y hy : ℤ) •
          chartSimplexSupportClass m M a y hy w S hS) = pointGenerator m M o x := by
  rw [chartSimplexSupportClass_signed_local_image m M l a y hy w S hS x hx hxchart w']
  exact (pointGenerator_eq_rawChartCoefficient_at m M o l hl a x hxchart w').symm


/-- The orientation-selected section uses AT's existing section carrier and compact-support class
factory. Its local-representation proof is an explicit chart-overlap target below. -/
noncomputable def chosenSection (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (o : Manifold.Orientation (Model m) M (Fin m)) :
    LocallyRepresentedTopSection ℤ (TopCat.of M) (IntegralSystem M) m Set.univ where
  localValue := fun x _ => pointGenerator m M o x
  locally_represented := by
    intro x hx
    let hxchart := mem_chart_source (EuclideanSpace ℝ (Fin m)) x
    let w := Classical.choice (chartSimplexWitness_exists m M x)
    let U := chartSimplexInteriorImage m M x x hxchart w
    have hopen : IsOpen U := chartSimplexInteriorImage_isOpen m M x x hxchart w
    have hcenter : x ∈ U := chartSimplexAt_anchor_mem_interiorImage m M x x hxchart w
    refine ⟨U, Set.subset_univ U, hopen, hcenter, ?_⟩
    let l := Quotient.out o
    let c := (rawChartCoefficient_at m M l x x hxchart : ℤ) •
      chartSimplexSupportClass m M x x hxchart w U (Set.Subset.rfl)
    refine ⟨c, ?_⟩
    intro y hy
    have hychart := chartSimplexInteriorImage_subset_chartSource m M x x hxchart w hy
    let wy := Classical.choice (chartSimplex_exists m M x y hychart)
    have hlocal := chartSimplexSupportClass_signed_local_image_pointGenerator
      m M o l (Quotient.out_eq o) x x hxchart w U (Set.Subset.rfl) y hy hychart wy
    simpa [c, l, rawChartCoefficient_at] using hlocal

/-- The unique AT compact-support class selected by `chosenSection`. This is the AT 6.3
factory, not a second DG class carrier. -/
noncomputable def chosenCompactClass (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (K : Set (TopCat.of M)) (hK : IsCompact K) (o : Manifold.Orientation (Model m) M (Fin m)) :
    twistedRelativeHomology ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem M) m :=
  Classical.choose (compactSupportTopClass_existsUnique ℤ m (TopCat.of M)
    (IntegralSystem M) K Set.univ hK isOpen_univ (Set.subset_univ K)
    (chosenSection m M o)).exists

theorem chosenCompactClass_local (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (K : Set (TopCat.of M)) (hK : IsCompact K) (o : Manifold.Orientation (Model m) M (Fin m))
    (x : TopCat.of M) (hx : x ∈ K) :
    twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m K x hx
      (chosenCompactClass m M K hK o) = pointGenerator m M o x := by
  have hspec := Classical.choose_spec
    (compactSupportTopClass_existsUnique ℤ m M (IntegralSystem M) K Set.univ hK
      isOpen_univ (Set.subset_univ K) (chosenSection m M o)).exists
  simpa [chosenCompactClass, chosenSection, pointGenerator, twistedSupportLocalMap,
    twistedRelativeLocalMap] using hspec x hx


theorem chosenCompactClass_unique (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (K : Set (TopCat.of M)) (hK : IsCompact K)
    (o : Manifold.Orientation (Model m) M (Fin m))
    (d : RelativeTwistedClassDatum ℤ (TopPair.ofSubset Kᶜ) (IntegralSystem M) m
      (fun x _ => pointGenerator m M o x)) :
    d.fundamentalClass = chosenCompactClass m M K hK o := by
  let hfac := compactSupportTopClass_existsUnique ℤ m M (IntegralSystem M) K Set.univ hK
    isOpen_univ (Set.subset_univ K) (chosenSection m M o)
  have hd : ∀ x : TopCat.of M, ∀ hx : x ∈ K,
      twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m K x hx
        d.fundamentalClass = pointGenerator m M o x := by
    intro x hx
    have hlocal :
        twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m K x hx =
        twistedRelativeLocalMap ℤ (TopPair.ofSubset (X := TopCat.of M) Kᶜ)
          (IntegralSystem M) m x (by
            intro h
            rcases h with ⟨y, hy⟩
            have hmem : y.val ∈ K := by
              change (TopPair.ofSubset (X := TopCat.of M) Kᶜ).map y ∈ K
              rw [hy]
              exact hx
            exact y.property hmem) := rfl
    rw [hlocal]
    exact d.local_eq x (by
      intro h
      rcases h with ⟨y, hy⟩
      have hmem : y.val ∈ K := by
        change (TopPair.ofSubset (X := TopCat.of M) Kᶜ).map y ∈ K
        rw [hy]
        exact hx
      exact y.property hmem)
  have hc : ∀ x : TopCat.of M, ∀ hx : x ∈ K,
      twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m K x hx
        (chosenCompactClass m M K hK o) = pointGenerator m M o x :=
    chosenCompactClass_local m M K hK o
  exact ExistsUnique.unique hfac (y₁ := d.fundamentalClass)
    (y₂ := chosenCompactClass m M K hK o) hd hc


/-- The selected class is packaged in the existing AT local-normalization carrier. Its local
normalization is the AT compact-support factory output; the support-map/relative-map identity is
proved by the pair definitions. -/
noncomputable def chosenCompactDatum (m : ℕ) (M : Type) [TopologicalSpace M] [T2Space M]
    [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]
    [IsManifold (Model m) ∞ M] [BoundarylessManifold (Model m) M]
    (K : Set M) (hK : IsCompact K) (o : Manifold.Orientation (Model m) M (Fin m)) :
    RelativeTwistedClassDatum ℤ (TopPair.ofSubset (X := TopCat.of M) Kᶜ)
      (IntegralSystem M) m (fun x _ => pointGenerator m M o x) := by
  refine ⟨chosenCompactClass m M K hK o, ?_⟩
  intro x hx
  have hxK : x ∈ K := by
    by_contra hKx
    apply hx
    exact ⟨⟨x, hKx⟩, rfl⟩
  have hlocal :
      twistedSupportLocalMap ℤ (TopCat.of M) (IntegralSystem M) m K x hxK =
        twistedRelativeLocalMap ℤ (TopPair.ofSubset (X := TopCat.of M) Kᶜ)
          (IntegralSystem M) m x (by
            intro h
            rcases h with ⟨y, hy⟩
            have hmem : y.val ∈ K := by
              change (TopPair.ofSubset (X := TopCat.of M) Kᶜ).map y ∈ K
              rw [hy]
              exact hxK
            exact y.property hmem) := rfl
  rw [← hlocal]
  exact chosenCompactClass_local m M K hK o x hxK


end TauCetiRoadmap.AlgebraicTopology.OrientationComparison
end
