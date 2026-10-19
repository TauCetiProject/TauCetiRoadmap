import Mathlib

/-!
# SchemeKTheoryOperations: representative target signatures

The roadmap is `README.md`. This file records light definitions and theorem signatures
expressible against the pinned APIs; it is not exhaustive. Strict perfectness bounds the terms
of a cochain complex of finite locally free sheaves, rather than only its cohomology. Zero,
single-sheaf, isomorphism, shift and cone statements give its basic interface. A named boundary
target and a proved identity-cone example distinguish term bounds from derived acyclicity.
Perfect derived categories, K-theory spectra,
operations and their geometric comparison maps are specified in the README.
-/

namespace TauCetiRoadmap.SchemeKTheoryOperations

open CategoryTheory CategoryTheory.Limits
open scoped ZeroObject

universe u

/-! ## Layer 1: Perfect complexes and their models -/

/-- A bounded complex of finite locally free sheaves, in the scheme convention of
Thomason–Trobaugh, Definition 2.2.2. The finite bound is on terms. -/
def IsStrictlyPerfect (X : AlgebraicGeometry.Scheme.{u})
    (E : CochainComplex X.Modules ℤ) : Prop :=
  (∃ a b : ℤ, a ≤ b ∧ ∀ i : ℤ, i < a ∨ b < i → IsZero (E.X i)) ∧
  ∀ i : ℤ, SheafOfModules.IsLocallyFree (E.X i) ∧
    SheafOfModules.IsFiniteType (E.X i)

/-- The zero cochain complex is strictly perfect. -/
theorem isStrictlyPerfect_zero (X : AlgebraicGeometry.Scheme.{u}) :
    IsStrictlyPerfect X (HomologicalComplex.zero : CochainComplex X.Modules ℤ) := by
  sorry

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

/-- Cohomological shifts preserve strict perfectness, translating the term bounds. -/
theorem IsStrictlyPerfect.shift (X : AlgebraicGeometry.Scheme.{u})
    {E : CochainComplex X.Modules ℤ} (hE : IsStrictlyPerfect X E) (n : ℤ) :
    IsStrictlyPerfect X (E⟦n⟧) := by
  rcases hE with ⟨⟨a, b, hab, hbounded⟩, hterms⟩
  refine ⟨⟨a - n, b - n, by lia, ?_⟩, ?_⟩
  · intro i hi
    change IsZero (E.X (i + n))
    apply hbounded
    rcases hi with hi | hi
    · exact Or.inl (by lia)
    · exact Or.inr (by lia)
  · intro i
    exact hterms (i + n)

/-- The mapping cone of a map between strictly perfect complexes is strictly perfect. -/
theorem IsStrictlyPerfect.cone (X : AlgebraicGeometry.Scheme.{u})
    {E F : CochainComplex X.Modules ℤ} (f : E ⟶ F)
    (hE : IsStrictlyPerfect X E) (hF : IsStrictlyPerfect X F) :
    IsStrictlyPerfect X (CochainComplex.mappingCone f) := by
  sorry

/-- The zero-differential complex with the structure sheaf in every nonpositive degree
has finite locally free terms but fails strict perfectness on a nonempty scheme. -/
theorem nonpositiveStructureSheaf_not_strictlyPerfect
    (X : AlgebraicGeometry.Scheme.{u}) [Nonempty X] :
    let E : CochainComplex X.Modules ℤ :=
      CochainComplex.of
        (fun i : ℤ => if i ≤ 0 then SheafOfModules.unit X.ringCatSheaf else 0)
        (fun _ => 0) (by intro i; simp)
    (∀ i : ℤ, SheafOfModules.IsLocallyFree (E.X i) ∧
      SheafOfModules.IsFiniteType (E.X i)) ∧ ¬ IsStrictlyPerfect X E := by
  sorry

/-- A contractible identity cone still fails strict perfectness if its source has terms
in arbitrarily negative degrees. -/
example (X : AlgebraicGeometry.Scheme.{u}) (E : CochainComplex X.Modules ℤ)
    (h : ∀ a : ℤ, ∃ i : ℤ, i < a ∧ ¬ IsZero (E.X i)) :
    ¬ IsStrictlyPerfect X (CochainComplex.mappingCone (𝟙 E)) := by
  rintro ⟨⟨a, b, _, hbounded⟩, _⟩
  obtain ⟨i, hia, hi⟩ := h a
  have hz := hbounded (i - 1) (Or.inl (by lia))
  have hsource := ((CochainComplex.mappingCone.isZero_X_iff (𝟙 E) (i - 1)).mp hz).1
  exact hi (by simpa using hsource)

/-
The further strict-model API in README §1.1 includes `IsStrictlyPerfect.exists_bounds` and
`isStrictlyPerfect_iff_locally_summand_free`.

The README specifies the following definitions and constructions requiring new carriers.

Layer 1: `IsPseudoCoherentAt`, `HasTorAmplitude`, `HasFiniteTorDimension`,
`HasLocallyFiniteTorDimension`, `perfCategory`, `perfCategory.supports`,
`perfFrobeniusPair`, `perfModelEnhancedEquiv`, `quasicoherentCoherator`, and `PerfTorStratum`.

Layer 2: `Scheme.K`, `Scheme.KOn`, `Scheme.Knaive`, `Scheme.KB`, `Scheme.G`,
`perfPullback`, proper perfect/coherent direct-image functors, `Scheme.cartan`,
and the perfect tensor and coherent module pairings. `Scheme.K.vectorBundleQComparison`
identifies the Quillen vector-bundle and perfect K-spaces on qcqs schemes with the
resolution property. On the regular ample-family domain, it preserves the ordinary,
relative and supported interfaces `higherKGroup`, `relativeKSpace` and
`higherKGroupWithSupports` used by ColemanIntegration.

Layer 3: `PerfSupport`, `supportKTheory`, `cohSupport`, `unitLoopClass`,
`specialisation`, `WittSupport.Perf`, `WittSupport.K`, `WittSupport.alpha`,
`WittQuasiIsogeny`, its `supportClass`, and `RamifiedWittSupport` with restriction.
`stableDeterminant`, `SpecialK1` and `kOne_units_split` transport AlgebraicKTheory A2
through GeneralAlgebraicKTheory's classical K1 comparison. The scheme unit-loop and
projective-automorphism determinant comparisons are targets here;
`specialK1_semilocal_zero` and `stableDeterminant_localEquiv` use A4's supplied
semilocal shortening and elementary reduction.

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
For `gFiltration`, a smooth ambient stratum of relative dimension r over the fixed
regular irreducible base S uses supported gamma degree `dim S + r - j` in grade j.
`gAdams_embedding_indep` compares these indices componentwise, and `gAdams_smooth`
has the normalization `k^(dim S) * phi^k = psi^k * theta^k(-T_dual)` under Cartan.
These constructions use relative cotangent rank even on nonsurjective components.

ColemanIntegration owns the downstream `adams_exactCube_comparison`, identifying
its rational exact-cube operations with the scheme operations through the Quillen
comparison and the uniqueness interface of Layer 6.

-/

end TauCetiRoadmap.SchemeKTheoryOperations
