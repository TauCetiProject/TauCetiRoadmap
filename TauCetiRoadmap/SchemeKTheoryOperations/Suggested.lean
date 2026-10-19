import Mathlib

/-!
# SchemeKTheoryOperations: representative target signatures

The roadmap is `README.md`. This file records light definitions and theorem signatures
expressible against the pinned APIs; it is not exhaustive. Strict perfectness bounds the terms
of a cochain complex of finite locally free sheaves, rather than only its cohomology. The positive
single-sheaf and isomorphism comparisons are theorem targets; the unbounded-term negative
control is proved directly from the predicate. Perfect derived categories, K-theory spectra,
operations and their geometric comparison maps are specified in the README.
-/

namespace TauCetiRoadmap.SchemeKTheoryOperations

open CategoryTheory CategoryTheory.Limits

universe u

/-! ## Layer 1: Perfect complexes and their models -/

/-- A bounded complex of finite locally free sheaves, in the scheme convention of
Thomason–Trobaugh, Definition 2.2.2. The finite bound is on terms. -/
def IsStrictlyPerfect (X : AlgebraicGeometry.Scheme.{u})
    (E : CochainComplex X.Modules ℤ) : Prop :=
  (∃ a b : ℤ, a ≤ b ∧ ∀ i : ℤ, i < a ∨ b < i → IsZero (E.X i)) ∧
  ∀ i : ℤ, SheafOfModules.IsLocallyFree (E.X i) ∧
    SheafOfModules.IsFiniteType (E.X i)

/-- A single finite locally free sheaf is strictly perfect in any cohomological degree. -/
theorem isStrictlyPerfect_single (X : AlgebraicGeometry.Scheme.{u}) (M : X.Modules)
    [M.IsLocallyFree] [M.IsFiniteType] (n : ℤ) :
    IsStrictlyPerfect X ((HomologicalComplex.single X.Modules (ComplexShape.up ℤ) n).obj M) := by
  sorry

/-- Strict perfectness is unchanged by an isomorphism of complexes. -/
theorem isStrictlyPerfect_iff_of_iso (X : AlgebraicGeometry.Scheme.{u})
    {E F : CochainComplex X.Modules ℤ} (e : E ≅ F) :
    IsStrictlyPerfect X E ↔ IsStrictlyPerfect X F := by
  sorry

/-- A genuine term bound excludes a complex with nonzero terms in arbitrarily negative degrees,
even when the differential is zero and every term is finite locally free. -/
example (X : AlgebraicGeometry.Scheme.{u}) (E : CochainComplex X.Modules ℤ)
    (h : ∀ a : ℤ, ∃ i : ℤ, i < a ∧ ¬ IsZero (E.X i)) :
    ¬ IsStrictlyPerfect X E := by
  rintro ⟨⟨a, b, _, hbounded⟩, _⟩
  obtain ⟨i, hia, hi⟩ := h a
  exact hi (hbounded i (Or.inl hia))

/-
The further strict-model API in README §1.1 includes `IsStrictlyPerfect.exists_bounds` and
`isStrictlyPerfect_iff_locally_summand_free`.

The README specifies the following definitions and constructions requiring new carriers.

Layer 1: `IsPseudoCoherentAt`, `HasTorAmplitude`, `HasFiniteTorDimension`,
`HasLocallyFiniteTorDimension`, `perfCategory`, `perfCategory.supports`,
`perfFrobeniusPair`, `perfModelEnhancedEquiv`, `quasicoherentCoherator`, and `PerfTorStratum`.

Layer 2: `Scheme.K`, `Scheme.KOn`, `Scheme.Knaive`, `Scheme.KB`, `Scheme.G`,
`perfPullback`, proper perfect/coherent direct-image functors, `Scheme.cartan`,
and the perfect tensor and coherent module pairings.

Layer 3: `PerfSupport`, `supportKTheory`, `cohSupport`, `unitLoopClass`,
`specialisation`, `WittSupport.Perf`, `WittSupport.K`, `WittSupport.alpha`,
`WittQuasiIsogeny`, its `supportClass`, and `RamifiedWittSupport` with restriction.

Layer 4: `HasMayerVietoris`, `hypercohomology` and its supported variant,
`kSheaf`, `supportFiltration`, `kConiveauSS`, `codimFiltration`, `coniveauSS`,
`GerstenQuillen`, `powerSeriesPresentation`, `weierstrassFiniteFree`,
`powerSeriesDiagonalEffacement`, `equiChar_semilocalApprox`,
`PerfectScheme.vTopology`, `derivedCechCharts_overIntegers`,
`perfectSquareZeroLifting`, `wittPerfectEffectivity`, and `WittSupport.degree`.

Layer 5: `MumfordRegular`, its coherent and vector-bundle exact categories,
`quillenT`, `quillenResolution`, `Scheme.polynomialExtension`,
`Scheme.laurentExtension`, `NK`, the blowup subcategories A'_k,
and `blowup_exceptionalApproximation`.

Layer 6: the pre-lambda and special lambda-ring structures, universal product and iteration
polynomials, projective exterior operations, rank section, integral algebraic representation
rings, formal characters and associated projectives; `TauCeti.LambdaRing.NonUnitalAlgebra`, its `unitization`, `Hom`,
`gammaFiltration` and `gammaGraded`; `TauCeti.RepresentationRing.stableGL`,
`TauCeti.RepresentationRing` and their pre-lambda structures, scalar extension,
Frobenius twist and classifying maps; `TauCeti.KTheory.LambdaOperations.op`,
`lambda`, `gamma`, `adams` and `stableMap`; the scheme/support analogues and
rank augmentation; `TauCeti.AlgebraicGeometry.KTheory.relative`;
`TauCeti.AlgebraicGeometry.SimplicialSheaf`, its `hyper` and `supportCofiber`;
`integralCompletion`, `completedGL_plus`, `KCoherent`, `coefficientMooreSpace`,
`coefficientMooreComparison`, `coefficientAdams_bockstein`, rational and
finite-coefficient weight projectors; the pointed A1 category, infinite Grassmannian
and K-representability; `TauCeti.LambdaRing.bott`, `bottExp`, `twisted` and
`twistedOp`; `SupportK0.strictComparison`, `SupportK0.lambda`, `SupportK0.adams`
and the ambient-codimension support filtration.

Layer 7: `TauCeti.AlgebraicGeometry.KTheory.gammaFiltration`, `gammaGraded`,
`gammaChern`, `gAdams`, `gFiltration`, `gRiemannRoch`, their graded Todd correction,
and `SupportedCycle.kClass` and its rational Chow comparison. The geometric
Chow/Chern carriers themselves are supplied as specified in the README.

-/

end TauCetiRoadmap.SchemeKTheoryOperations
