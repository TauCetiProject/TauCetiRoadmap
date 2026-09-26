import Mathlib

/-!
# Analytic toric geometry: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These declarations pin representative interfaces for the algebraic supplier,
finite-fan analytic realization, mixed monomial calculus, boundary normal forms, properness,
and the comparison with algebraic complex points.

The algebraic structures below are built on Mathlib carriers. In particular, a toric cone is a
predicate on `PointedCone`, and affine charts use monoid algebras and schemes. They are the
Toric-compatible prerequisites that this roadmap supplies until an identical external API can
be imported.
-/

namespace TauCetiRoadmap.AnalyticToricGeometry

open AlgebraicGeometry CategoryTheory Topology
open scoped BigOperators
open scoped ContDiff Manifold
open scoped TensorProduct

universe u

/-! ## Integral lattices and toric cones -/

section AlgebraicSupplier

variable {N V : Type u} [AddCommGroup N] [Module ℤ N] [Module.Free ℤ N] [Module.Finite ℤ N]
  [AddCommGroup V] [Module ℝ V] [FiniteDimensional ℝ V]

/-- Full integral-lattice data in a real vector space. The scalar-extension equivalence rules out
dense injective images such as `ℤ² → ℝ`, `(a,b) ↦ a + √2 b`; cones remain Mathlib
`PointedCone`s in the ambient space. -/
def IsIntegralLattice (i : N →+ V) : Prop :=
  ∃ scalarExtension : TensorProduct ℤ ℝ N ≃ₗ[ℝ] V,
    ∀ n : N, scalarExtension ((1 : ℝ) ⊗ₜ[ℤ] n) = i n

/-- Rationality of a cone means generation by finitely many lattice vectors. -/
def IsLatticeRational (i : N →+ V) (sigma : PointedCone ℝ V) : Prop :=
  ∃ s : Finset N, sigma = PointedCone.hull ℝ (i '' (s : Set N))

/-- A toric cone is a finitely generated, lattice-rational, salient Mathlib pointed cone. -/
structure IsToricCone (i : N →+ V) (sigma : PointedCone ℝ V) : Prop where
  fg : sigma.FG
  rational : IsLatticeRational i sigma
  salient : (sigma : ConvexCone ℝ V).Salient

/-- One-dimensional faces of a toric cone. -/
def ToricRay (sigma : PointedCone ℝ V) :=
  {rho : sigma.Face //
    Module.finrank ℝ (Submodule.span ℝ ((rho : PointedCone ℝ V) : Set V)) = 1}

/-- A primitive lattice generator pointing along a ray. -/
def IsPrimitiveGenerator (i : N →+ V) {sigma : PointedCone ℝ V}
    (rho : ToricRay sigma) (v : N) : Prop :=
  i v ∈ (rho.1 : PointedCone ℝ V) ∧ v ≠ 0 ∧
    ∀ (m : ℕ), 0 < m → ∀ w : N, v = m • w → m = 1

/-- Rational salient rays have unique primitive generators. -/
theorem IsToricCone.existsUnique_primitiveGenerator {i : N →+ V}
    (hi : IsIntegralLattice i) {sigma : PointedCone ℝ V} (hsigma : IsToricCone i sigma)
    (rho : ToricRay sigma) :
    ∃! v : N, IsPrimitiveGenerator i rho v := by
  sorry

/-- A regular cone is a toric cone whose primitive ray generators occur in one integral basis.
Carrying the toric-cone hypothesis prevents regularity from holding vacuously for an irrational
or nonsalient cone. -/
def IsRegularCone (i : N →+ V) (sigma : PointedCone ℝ V) : Prop :=
  IsToricCone i sigma ∧
    ∃ (basis : Module.Basis (Fin (Module.finrank ℤ N)) ℤ N)
        (rayIndex : ToricRay sigma ↪ Fin (Module.finrank ℤ N)),
      ∀ rho, IsPrimitiveGenerator i rho (basis (rayIndex rho))

/-- A finite fan on the shared Mathlib cone carrier. -/
structure Fan (i : N →+ V) where
  lattice : IsIntegralLattice i
  cones : Set (PointedCone ℝ V)
  finite_cones : cones.Finite
  toric : ∀ {sigma}, sigma ∈ cones → IsToricCone i sigma
  faces : ∀ {sigma}, sigma ∈ cones → ∀ rho : sigma.Face,
    (rho : PointedCone ℝ V) ∈ cones
  inter_face_left : ∀ {sigma}, sigma ∈ cones → ∀ {tau}, tau ∈ cones →
    (sigma ⊓ tau).IsFaceOf sigma
  inter_face_right : ∀ {sigma}, sigma ∈ cones → ∀ {tau}, tau ∈ cones →
    (sigma ⊓ tau).IsFaceOf tau

/-- A fan is regular when each of its cones is regular. -/
def Fan.IsRegular {i : N →+ V} (Sigma : Fan i) : Prop :=
  ∀ sigma, sigma ∈ Sigma.cones → IsRegularCone i sigma

/-- The support of a finite fan. -/
def Fan.support {i : N →+ V} (Sigma : Fan i) : Set V :=
  ⋃ sigma ∈ Sigma.cones, (sigma : Set V)

/-- Completeness means that the support fills the ambient real vector space. -/
def Fan.IsComplete {i : N →+ V} (Sigma : Fan i) : Prop := Sigma.support = Set.univ

variable {N' V' : Type u} [AddCommGroup N'] [Module ℤ N'] [Module.Free ℤ N']
  [Module.Finite ℤ N'] [AddCommGroup V'] [Module ℝ V'] [FiniteDimensional ℝ V']

/-- An integral map of lattices carrying each source cone into a target cone. -/
structure FanHom {i : N →+ V} {i' : N' →+ V'} (Sigma : Fan i) (Delta : Fan i') where
  latticeMap : N →+ N'
  realMap : V →ₗ[ℝ] V'
  map_lattice : ∀ n, realMap (i n) = i' (latticeMap n)
  map_cone : ∀ sigma, sigma ∈ Sigma.cones →
    ∃ tau, tau ∈ Delta.cones ∧ sigma.map realMap ≤ tau

/-- The integral dual semigroup of a cone. -/
noncomputable def dualSemigroup (i : N →+ V) (sigma : PointedCone ℝ V) :
    AddSubmonoid (N →+ ℤ) := by
  sorry

/-- Coordinate ring of the affine toric chart of a cone. -/
abbrev affineCoordinateRing (i : N →+ V) (sigma : PointedCone ℝ V) :=
  MonoidAlgebra ℂ (Multiplicative (dualSemigroup i sigma))

/-- Affine toric scheme supplied by a cone. -/
noncomputable abbrev affineToricScheme (i : N →+ V) (sigma : PointedCone ℝ V) :=
  Spec (.of (affineCoordinateRing i sigma))

/-- A face inclusion induces the algebraic affine open immersion used for fan gluing. -/
noncomputable def faceOpenImmersion {i : N →+ V} {sigma tau : PointedCone ℝ V}
    (h : tau.IsFaceOf sigma) : affineToricScheme i tau ⟶ affineToricScheme i sigma := by
  sorry

/-- Algebraic realization obtained by gluing the affine cone schemes along face localizations. -/
noncomputable def algebraicRealization {i : N →+ V} (Sigma : Fan i) : Scheme := by
  sorry

/-- A fan morphism induces the algebraic toric morphism. -/
noncomputable def algebraicMap {i : N →+ V} {i' : N' →+ V'}
    {Sigma : Fan i} {Delta : Fan i'} (f : FanHom Sigma Delta) :
    algebraicRealization Sigma ⟶ algebraicRealization Delta := by
  sorry

end AlgebraicSupplier

/-! ## Affine complex points and an independent topology -/

/-- The complex points of an affine semigroup scheme. -/
abbrev AffineSemigroupComplexPoint (S : Type*) [AddCommMonoid S] :=
  MonoidAlgebra ℂ (Multiplicative S) →ₐ[ℂ] ℂ

/-- A finite additive generating family. -/
structure AddGeneratingFamily (S : Type*) [AddCommMonoid S] (r : ℕ) where
  toFun : Fin r → S
  spans : AddSubmonoid.closure (Set.range toFun) = ⊤

/-- Evaluation on finite semigroup generators gives a monomial embedding into affine space. -/
noncomputable def monomialEmbedding {S : Type*} [AddCommMonoid S] {r : ℕ}
    (g : AddGeneratingFamily S r) : AffineSemigroupComplexPoint S → Fin r → ℂ :=
  fun x j ↦ x (MonoidAlgebra.single (.ofAdd (g.toFun j)) 1)

/-- The affine complex-point topology is induced by a finite monomial embedding. -/
@[instance_reducible]
noncomputable def affinePointTopology {S : Type*} [AddCommMonoid S] {r : ℕ}
    (g : AddGeneratingFamily S r) : TopologicalSpace (AffineSemigroupComplexPoint S) :=
  TopologicalSpace.induced (monomialEmbedding g) inferInstance

/-- The monomial-embedding topology is independent of the finite generating family. -/
theorem affinePointTopology_eq {S : Type*} [AddCommMonoid S] {r s : ℕ}
    (g : AddGeneratingFamily S r) (h : AddGeneratingFamily S s) :
    affinePointTopology g = affinePointTopology h := by
  sorry

/-- Coordinate model for the dual semigroup of a regular cone. -/
abbrev RegularDualSemigroup (k l : ℕ) := (Fin k →₀ ℕ) × (Fin l →₀ ℤ)

/-- Regularity identifies the affine functor-of-points carrier with its mixed affine-torus model. -/
noncomputable def regularAffinePointEquiv {S : Type*} [AddCommMonoid S] {k l : ℕ}
    (e : S ≃+ RegularDualSemigroup k l) :
    AffineSemigroupComplexPoint S ≃ (Fin k → ℂ) × (Fin l → ℂˣ) := by
  sorry

/-- The regular coordinate map is a homeomorphism for the independently defined topology. -/
noncomputable def regularAffinePointHomeomorph {S : Type*} [AddCommMonoid S]
    {r k l : ℕ} (g : AddGeneratingFamily S r) (e : S ≃+ RegularDualSemigroup k l) :
    @Homeomorph (AffineSemigroupComplexPoint S) ((Fin k → ℂ) × (Fin l → ℂˣ))
      (affinePointTopology g) inferInstance := by
  sorry

/-! ## Mixed monomial maps -/

/-- Exponent data for a map between regular charts. There is deliberately no block from
noninvertible source coordinates to invertible target coordinates. -/
structure MixedExponent (k l k' l' : ℕ) where
  boundaryBoundary : Matrix (Fin k') (Fin k) ℕ
  boundaryTorus : Matrix (Fin k') (Fin l) ℤ
  torusTorus : Matrix (Fin l') (Fin l) ℤ

/-- Ambient coordinate formula for a mixed monomial map. -/
noncomputable def mixedMonomialMap {k l k' l' : ℕ} (A : MixedExponent k l k' l') :
    ((Fin k → ℂ) × (Fin l → ℂ)) → (Fin k' → ℂ) × (Fin l' → ℂ) :=
  fun z ↦
    (fun a ↦ (∏ b, z.1 b ^ A.boundaryBoundary a b) *
      ∏ b, z.2 b ^ A.boundaryTorus a b,
    fun a ↦ ∏ b, z.2 b ^ A.torusTorus a b)

/-- The open locus where all torus coordinates are invertible. -/
def mixedChartDomain (k l : ℕ) : Set ((Fin k → ℂ) × (Fin l → ℂ)) :=
  {z | ∀ j, z.2 j ≠ 0}

/-- Mixed monomial maps preserve the mixed-chart locus. -/
theorem mixedMonomialMap_mem {k l k' l' : ℕ} (A : MixedExponent k l k' l')
    {z : (Fin k → ℂ) × (Fin l → ℂ)} (hz : z ∈ mixedChartDomain k l) :
    mixedMonomialMap A z ∈ mixedChartDomain k' l' := by
  sorry

/-- Mixed monomial maps are holomorphic on their natural open domain. -/
theorem mixedMonomialMap_differentiableOn {k l k' l' : ℕ}
    (A : MixedExponent k l k' l') :
    DifferentiableOn ℂ (mixedMonomialMap A) (mixedChartDomain k l) := by
  sorry

/-- Composition of typed mixed exponent data. -/
noncomputable def MixedExponent.comp {k l k' l' k'' l'' : ℕ}
    (B : MixedExponent k' l' k'' l'') (A : MixedExponent k l k' l') :
    MixedExponent k l k'' l'' := by
  sorry

theorem mixedMonomialMap_comp {k l k' l' k'' l'' : ℕ}
    (B : MixedExponent k' l' k'' l'') (A : MixedExponent k l k' l')
    (z : (Fin k → ℂ) × (Fin l → ℂ)) (hz : z ∈ mixedChartDomain k l) :
    mixedMonomialMap (B.comp A) z = mixedMonomialMap B (mixedMonomialMap A z) := by
  sorry

/-! ## Finite-fan analytic realization and comparison -/

section AnalyticRealization

variable {N V : Type u} [AddCommGroup N] [Module ℤ N] [Module.Free ℤ N] [Module.Finite ℤ N]
  [AddCommGroup V] [Module ℝ V] [FiniteDimensional ℝ V]
variable {i : N →+ V}

/-- Topological gluing data built from affine complex-point charts and face localizations. -/
noncomputable def fanGlueData (Sigma : Fan i) : TopCat.GlueData := by
  sorry

/-- The analytic realization uses `TopCat.GlueData.glued`, not a new quotient carrier. -/
noncomputable abbrev AnalyticRealization (Sigma : Fan i) := (fanGlueData Sigma).glued

/-- Model vector space determined by the lattice rank. -/
abbrev ToricModel := Fin (Module.finrank ℤ N) → ℂ

/-- The compatible regular affine charts install the complex atlas on the glued carrier. -/
@[instance_reducible]
noncomputable def analyticChartedSpace (Sigma : Fan i) (hSigma : Sigma.IsRegular) :
    ChartedSpace (ToricModel (N := N)) (AnalyticRealization Sigma) := by
  sorry

/-- The finite-fan realization is a complex manifold. -/
theorem analyticRealization_isManifold (Sigma : Fan i) (hSigma : Sigma.IsRegular) :
    letI := analyticChartedSpace Sigma hSigma
    IsManifold 𝓘(ℂ, ToricModel (N := N)) ∞ (AnalyticRealization Sigma) := by
  sorry

/-- Coordinate-free dense complex torus with character lattice `N →+ ℤ`. -/
abbrev ComplexTorus := Multiplicative (N →+ ℤ) →* ℂˣ

/-- The affine torus actions glue to an action on the analytic realization. -/
noncomputable def torusAction (Sigma : Fan i) :
    ComplexTorus (N := N) →* Equiv.Perm (AnalyticRealization Sigma) := by
  sorry

/-- The torus orbit associated to a cone. -/
noncomputable def orbit (Sigma : Fan i) (sigma : PointedCone ℝ V)
    (hsigma : sigma ∈ Sigma.cones) : Set (AnalyticRealization Sigma) := by
  sorry

/-- Face inclusion is the closure order on torus orbits. -/
theorem orbit_subset_closure_iff (Sigma : Fan i) {sigma tau : PointedCone ℝ V}
    (hsigma : sigma ∈ Sigma.cones) (htau : tau ∈ Sigma.cones) :
    orbit Sigma tau htau ⊆ closure (orbit Sigma sigma hsigma) ↔ sigma ≤ tau := by
  sorry

/-- Rays of a finite fan. -/
def FanRay (Sigma : Fan i) :=
  {sigma : PointedCone ℝ V // sigma ∈ Sigma.cones ∧
    Module.finrank ℝ (Submodule.span ℝ (sigma : Set V)) = 1}

/-- The invariant boundary component indexed by a ray. -/
noncomputable def boundaryComponent (Sigma : Fan i) (rho : FanRay Sigma) :
    Set (AnalyticRealization Sigma) := by
  sorry

/-- Every boundary component is closed. Its hypersurface property follows from the local normal
form below. -/
theorem boundaryComponent_isClosed (Sigma : Fan i) (rho : FanRay Sigma) :
    IsClosed (boundaryComponent Sigma rho) := by
  sorry

/-- The toric boundary has the holomorphic simple-normal-crossings coordinate-hyperplane normal
form. A complex `PartialDiffeomorph`, rather than a bare `PartialHomeomorph`, makes each component
a complex hypersurface and makes the displayed coordinates holomorphic. -/
theorem boundary_local_normalForm (Sigma : Fan i) (hSigma : Sigma.IsRegular)
    (x : AnalyticRealization Sigma) :
    letI := analyticChartedSpace Sigma hSigma
    ∃ (s : Set (FanRay Sigma)) (_hs : s.Finite)
      (j : s ↪ Fin (Module.finrank ℤ N))
      (e : PartialDiffeomorph 𝓘(ℂ, ToricModel (N := N)) 𝓘(ℂ, ToricModel (N := N))
        (AnalyticRealization Sigma) (ToricModel (N := N)) ∞),
      x ∈ e.source ∧
        ∀ y ∈ e.source, ∀ rho,
          y ∈ boundaryComponent Sigma rho ↔
            ∃ hrho : rho ∈ s, e y (j ⟨rho, hrho⟩) = 0 := by
  sorry

variable {N' V' : Type u} [AddCommGroup N'] [Module ℤ N'] [Module.Free ℤ N']
  [Module.Finite ℤ N'] [AddCommGroup V'] [Module ℝ V'] [FiniteDimensional ℝ V']
variable {i' : N' →+ V'} {Sigma : Fan i} {Delta : Fan i'}

/-- A fan morphism glues to a continuous analytic map. -/
noncomputable def analyticMap (f : FanHom Sigma Delta) :
    AnalyticRealization Sigma → AnalyticRealization Delta := by
  sorry

theorem analyticMap_continuous (f : FanHom Sigma Delta) : Continuous (analyticMap f) := by
  sorry

/-- The glued map is holomorphic for regular source and target fans. -/
theorem analyticMap_mdifferentiable (f : FanHom Sigma Delta)
    (hSigma : Sigma.IsRegular) (hDelta : Delta.IsRegular) :
    letI := analyticChartedSpace Sigma hSigma
    letI := analyticChartedSpace Delta hDelta
    ContMDiff 𝓘(ℂ, ToricModel (N := N)) 𝓘(ℂ, ToricModel (N := N')) ∞
      (analyticMap f) := by
  sorry

/-- The finite-fan support condition for properness. -/
def FanHom.SupportCondition (f : FanHom Sigma Delta) : Prop :=
  ∀ tau, tau ∈ Delta.cones →
    f.realMap ⁻¹' (tau : Set V') =
      ⋃ sigma ∈ Sigma.cones, ⋃ (_h : sigma.map f.realMap ≤ tau), (sigma : Set V)

/-- Properness is characterized by the cone-by-cone support condition for finite fans. -/
theorem analyticMap_isProper_iff (f : FanHom Sigma Delta) :
    IsProperMap (analyticMap f) ↔ f.SupportCondition := by
  sorry

/-- A finite regular fan has compact realization exactly when it is complete. -/
theorem isCompact_univ_iff_isComplete (hSigma : Sigma.IsRegular) :
    IsCompact (Set.univ : Set (AnalyticRealization Sigma)) ↔ Sigma.IsComplete := by
  sorry

/-- Global algebraic complex points mean morphisms from `Spec ℂ`, not prime ideals. -/
abbrev AlgebraicComplexPoint (Sigma : Fan i) := Spec (.of ℂ) ⟶ algebraicRealization Sigma

/-- The topology on global algebraic complex points is glued from the independently topologized
affine functor-of-points charts. -/
@[instance_reducible]
noncomputable def algebraicComplexPointTopology (Sigma : Fan i) :
    TopologicalSpace (AlgebraicComplexPoint Sigma) := by
  sorry

/-- The affine algebraic complex-point charts glue to their own named complex atlas. -/
@[instance_reducible]
noncomputable def algebraicComplexPointChartedSpace (Sigma : Fan i)
    (hSigma : Sigma.IsRegular) :
    letI := algebraicComplexPointTopology Sigma
    ChartedSpace (ToricModel (N := N)) (AlgebraicComplexPoint Sigma) := by
  sorry

/-- The affine comparisons glue to the global algebraic--analytic comparison. -/
noncomputable def algebraicAnalyticHomeomorph (Sigma : Fan i) (hSigma : Sigma.IsRegular) :
    @Homeomorph (AlgebraicComplexPoint Sigma) (AnalyticRealization Sigma)
      (algebraicComplexPointTopology Sigma) inferInstance := by
  sorry

/-- The global comparison and its inverse are holomorphic. -/
theorem algebraicAnalyticHomeomorph_mdifferentiable (Sigma : Fan i)
    (hSigma : Sigma.IsRegular) :
    letI := algebraicComplexPointTopology Sigma
    letI := algebraicComplexPointChartedSpace Sigma hSigma
    letI := analyticChartedSpace Sigma hSigma
    ContMDiff 𝓘(ℂ, ToricModel (N := N)) 𝓘(ℂ, ToricModel (N := N)) ∞
        (algebraicAnalyticHomeomorph Sigma hSigma) ∧
      ContMDiff 𝓘(ℂ, ToricModel (N := N)) 𝓘(ℂ, ToricModel (N := N)) ∞
        (algebraicAnalyticHomeomorph Sigma hSigma).symm := by
  sorry

/-- The comparison is natural for fan morphisms. -/
theorem algebraicAnalyticHomeomorph_naturality (f : FanHom Sigma Delta)
    (hSigma : Sigma.IsRegular) (hDelta : Delta.IsRegular)
    (x : AlgebraicComplexPoint Sigma) :
    algebraicAnalyticHomeomorph Delta hDelta (x ≫ algebraicMap f) =
      analyticMap f (algebraicAnalyticHomeomorph Sigma hSigma x) := by
  sorry

end AnalyticRealization

end TauCetiRoadmap.AnalyticToricGeometry
