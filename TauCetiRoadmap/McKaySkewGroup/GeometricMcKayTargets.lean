import TauCetiRoadmap.McKaySkewGroup.McKayClassificationTargets
import TauCetiRoadmap.AlgebraicVectorBundles.Suggested
import TauCeti.AlgebraicGeometry.Quotient.FiniteGroup.Affine
import TauCeti.AlgebraicGeometry.LineBundle.Degree
import TauCeti.AlgebraicGeometry.LineBundle.Pullback
import Mathlib.LinearAlgebra.SymmetricAlgebra.Basis
import Mathlib.AlgebraicGeometry.IdealSheaf.Functorial
import Mathlib.AlgebraicGeometry.IdealSheaf.Subscheme
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.RingTheory.Spectrum.Prime.FreeLocus

/-!
# Finite geometric McKay: native target interfaces

README Layer7 is definitive, including all concrete charts, generation, kernels, inverse maps,
properness, P¹ and cohomology calculations. Hard constructors below are whole dependent families,
not fixed-codomain admissions with erased arguments. Existing native quotient, scheme, ideal,
module, finite-locally-free and degree carriers are used directly. No geometric theorem is an
assumed input certificate. In particular the degree delta matrix is a THEOREM, not cluster data.
-/
namespace TauCetiRoadmap.McKaySkewGroup.Geometric

open CategoryTheory AlgebraicGeometry Opposite
open scoped TensorProduct Matrix MatrixGroups MonoidalCategory Classical

abbrev Vector2 := Fin 2 → ℂ
abbrev Coordinates := SymmetricAlgebra ℂ (Module.Dual ℂ Vector2)

noncomputable instance coordinateAction (H : Subgroup TauCeti.SU2) :
    MulSemiringAction H Coordinates :=
  symmetricAlgebraAction ℂ H (Module.Dual ℂ Vector2)
    (Representation.dual (definingRepresentation H))

noncomputable instance coordinateScalars (H : Subgroup TauCeti.SU2) :
    SMulCommClass H ℂ Coordinates :=
  symmetricAlgebraAction_smulComm ℂ H (Module.Dual ℂ Vector2)
    (Representation.dual (definingRepresentation H))

noncomputable def coordinate (i : Fin 2) : Coordinates :=
  SymmetricAlgebra.ι ℂ (Module.Dual ℂ Vector2) ((Pi.basisFun ℂ (Fin 2)).dualBasis i)

noncomputable def polynomialCoordinates : Coordinates ≃ₐ[ℂ] MvPolynomial (Fin 2) ℂ :=
  SymmetricAlgebra.equivMvPolynomial (Pi.basisFun ℂ (Fin 2)).dualBasis

noncomputable instance coordinateFiniteType : Algebra.FiniteType ℂ Coordinates :=
  Algebra.FiniteType.of_surjective polynomialCoordinates.symm.toAlgHom
    polynomialCoordinates.symm.surjective

@[simp] theorem polynomialCoordinates_coordinate (i : Fin 2) :
    polynomialCoordinates (coordinate i) = MvPolynomial.X i :=
  SymmetricAlgebra.equivMvPolynomial_ι_apply _ i

noncomputable def evaluate (v : Vector2) : Coordinates →ₐ[ℂ] ℂ :=
  SymmetricAlgebra.lift
    { toFun := fun φ => φ v
      map_add' := fun _ _ => rfl
      map_smul' := fun _ _ => rfl }

/-- Actual left CONTRAGREDIENT coordinate equation. -/
theorem coordinateAction_evaluate (H : Subgroup TauCeti.SU2) (g : H)
    (f : Coordinates) (v : Vector2) :
    evaluate v (g • f) = evaluate (definingRepresentation H g⁻¹ v) f := sorry

noncomputable abbrev Invariants (H : Subgroup TauCeti.SU2) := FixedPoints.subalgebra ℂ Coordinates H

noncomputable abbrev complexPoint : Scheme := Spec (CommRingCat.of ℂ)
noncomputable def plane : Over complexPoint := Over.mk (Spec.algebraMap ℂ Coordinates)
noncomputable def quotientSpace (H : Subgroup TauCeti.SU2) : Over complexPoint :=
  Over.mk (Spec.algebraMap ℂ (Invariants H))

/-- The actual native invariant-spectrum projection, including its structure-map square. -/
noncomputable def quotientProjection (H : Subgroup TauCeti.SU2) : plane ⟶ quotientSpace H :=
  Over.homMk (TauCeti.AffineInvariantQuotient.projection Coordinates H)
    (TauCeti.AffineInvariantQuotient.projection_specAlgebraMap Coordinates H ℂ)

theorem quotientProjection_native (H : Subgroup TauCeti.SU2) :
    (quotientProjection H).left = TauCeti.AffineInvariantQuotient.projection Coordinates H := rfl

theorem quotientProjection_invariant (H : Subgroup TauCeti.SU2) (g : H) :
    TauCeti.AffineInvariantQuotient.specComap Coordinates H g ≫
      (quotientProjection H).left = (quotientProjection H).left :=
  TauCeti.AffineInvariantQuotient.specComap_projection Coordinates H g

theorem quotientProjection_finite (H : Subgroup TauCeti.SU2) [Fintype H] :
    IsFinite (quotientProjection H).left :=
  TauCeti.AffineInvariantQuotient.isFinite_projection_of_finiteType Coordinates H ℂ

/-- Self-duality compares the old Sym(V) algebra with this coordinate Sym(V*). -/
noncomputable def definingCoordinateEquiv :
    SymmetricAlgebra ℂ Vector2 ≃ₐ[ℂ] Coordinates := by
  refine AlgEquiv.ofAlgHom
    (SymmetricAlgebra.lift ((SymmetricAlgebra.ι ℂ _).comp
      standardAlternatingDualEquiv.toLinearMap))
    (SymmetricAlgebra.lift ((SymmetricAlgebra.ι ℂ _).comp
      standardAlternatingDualEquiv.symm.toLinearMap)) ?_ ?_
  · sorry
  · sorry

theorem definingCoordinateEquiv_generator (v : Vector2) :
    definingCoordinateEquiv (SymmetricAlgebra.ι ℂ Vector2 v) =
      SymmetricAlgebra.ι ℂ _ (standardAlternatingDualEquiv v) := by
  simp [definingCoordinateEquiv]

/-- Pullback f↦f∘T on coordinates, with a specified linear change of point coordinates. -/
noncomputable def coordinatePullback : ∀ (T : Vector2 ≃ₗ[ℂ] Vector2),
    Coordinates ≃ₐ[ℂ] Coordinates := sorry

theorem coordinatePullback_evaluate (T : Vector2 ≃ₗ[ℂ] Vector2)
    (f : Coordinates) (v : Vector2) :
    evaluate v (coordinatePullback T f) = evaluate (T v) f := sorry

noncomputable def invariantConjugacy : ∀ (H K : Subgroup TauCeti.SU2)
    (e : H ≃* K) (T : Vector2 ≃ₗ[ℂ] Vector2)
    (hT : ∀ g v, T (definingRepresentation H g v) = definingRepresentation K (e g) (T v)),
    Invariants K ≃ₐ[ℂ] Invariants H := sorry

theorem invariantConjugacy_coe (H K : Subgroup TauCeti.SU2)
    (e : H ≃* K) (T : Vector2 ≃ₗ[ℂ] Vector2)
    (hT : ∀ g v, T (definingRepresentation H g v) = definingRepresentation K (e g) (T v))
    (f : Invariants K) : (invariantConjugacy H K e T hT f : Coordinates) =
      coordinatePullback T f := sorry

noncomputable def quotientConjugacyMap (H K : Subgroup TauCeti.SU2)
    (e : H ≃* K) (T : Vector2 ≃ₗ[ℂ] Vector2)
    (hT : ∀ g v, T (definingRepresentation H g v) = definingRepresentation K (e g) (T v)) :
    (quotientSpace H).left ⟶ (quotientSpace K).left :=
  Spec.map (CommRingCat.ofHom (invariantConjugacy H K e T hT).toRingHom)

theorem quotientConjugacy_isIso (H K : Subgroup TauCeti.SU2)
    (e : H ≃* K) (T : Vector2 ≃ₗ[ℂ] Vector2)
    (hT : ∀ g v, T (definingRepresentation H g v) = definingRepresentation K (e g) (T v)) :
    IsIso (quotientConjugacyMap H K e T hT) :=
  isIso_SpecMap_iff.mpr (invariantConjugacy H K e T hT).bijective

theorem quotientConjugacy_square (H K : Subgroup TauCeti.SU2)
    (e : H ≃* K) (T : Vector2 ≃ₗ[ℂ] Vector2)
    (hT : ∀ g v, T (definingRepresentation H g v) = definingRepresentation K (e g) (T v)) :
    Spec.map (CommRingCat.ofHom (coordinatePullback T).toRingHom) ≫
        (quotientProjection K).left =
      (quotientProjection H).left ≫ quotientConjugacyMap H K e T hT := sorry

/-! ## Finite SL2 unitarization consumes Layer0's actual conjugator -/
noncomputable def sl2Defining (K : Subgroup SL2) : Representation ℂ K Vector2 :=
  (TauCeti.stdRep ℂ 2).comp (Matrix.SpecialLinearGroup.toGL.comp K.subtype)

noncomputable instance sl2CoordinateAction (K : Subgroup SL2) :
    MulSemiringAction K Coordinates :=
  symmetricAlgebraAction ℂ K (Module.Dual ℂ Vector2) (Representation.dual (sl2Defining K))

noncomputable instance sl2CoordinateScalars (K : Subgroup SL2) :
    SMulCommClass K ℂ Coordinates :=
  symmetricAlgebraAction_smulComm ℂ K (Module.Dual ℂ Vector2) (Representation.dual (sl2Defining K))

noncomputable abbrev SL2Invariants (K : Subgroup SL2) := FixedPoints.subalgebra ℂ Coordinates K

/-- Extract the actual restricted group and two-module equivalences from Layer0's GL2 conjugacy.
This consumes finiteSL2Classification/unitarization, rather than another classification argument. -/
noncomputable def sl2CoordinateModel : ∀ (K : Subgroup SL2) [Fintype K],
    Σ a : FiniteSU2Model, Σ e : K ≃* a.subgroup,
      {T : Vector2 ≃ₗ[ℂ] Vector2 // ∀ g v,
        T (sl2Defining K g v) = definingRepresentation a.subgroup (e g) (T v)} := sorry

noncomputable def sl2InvariantComparison : ∀ (K : Subgroup SL2)
    (H : Subgroup TauCeti.SU2) (e : K ≃* H) (T : Vector2 ≃ₗ[ℂ] Vector2)
    (hT : ∀ g v, T (sl2Defining K g v) = definingRepresentation H (e g) (T v)),
    Invariants H ≃ₐ[ℂ] SL2Invariants K := sorry

theorem sl2InvariantComparison_coe (K : Subgroup SL2)
    (H : Subgroup TauCeti.SU2) (e : K ≃* H) (T : Vector2 ≃ₗ[ℂ] Vector2)
    (hT : ∀ g v, T (sl2Defining K g v) = definingRepresentation H (e g) (T v))
    (f : Invariants H) : (sl2InvariantComparison K H e T hT f : Coordinates) =
      coordinatePullback T f := sorry

/-! ## Literal hypersurfaces and actual named generators -/
abbrev Polynomial3 := MvPolynomial (Fin 3) ℂ

noncomputable def equation : FiniteSU2Model → Polynomial3
  | .cyclic n _ => MvPolynomial.X 0 * MvPolynomial.X 1 - MvPolynomial.X 2 ^ n
  | .dihedral m _ => MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 2 * MvPolynomial.X 2 +
      MvPolynomial.X 2 ^ (m + 1)
  | .tetrahedral => MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 3 + MvPolynomial.X 2 ^ 4
  | .octahedral => MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 3 +
      MvPolynomial.X 1 * MvPolynomial.X 2 ^ 3
  | .icosahedral => MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 3 + MvPolynomial.X 2 ^ 5

abbrev Hypersurface (a : FiniteSU2Model) := Polynomial3 ⧸ Ideal.span {equation a}

noncomputable def namedGenerators : ∀ (a : FiniteSU2Model), Fin 3 → Invariants a.subgroup := sorry
noncomputable def namedPresentationMap (a : FiniteSU2Model) : Polynomial3 →ₐ[ℂ] Invariants a.subgroup :=
  MvPolynomial.aeval (namedGenerators a)

theorem namedPresentation_kernel (a : FiniteSU2Model) :
    RingHom.ker (namedPresentationMap a).toRingHom = Ideal.span {equation a} := sorry

theorem namedPresentation_surjective (a : FiniteSU2Model) :
    Function.Surjective (namedPresentationMap a) := sorry

noncomputable def namedHypersurfaceEquiv : ∀ (a : FiniteSU2Model),
    Hypersurface a ≃ₐ[ℂ] Invariants a.subgroup := sorry

theorem namedHypersurfaceEquiv_generator (a : FiniteSU2Model) (i : Fin 3) :
    namedHypersurfaceEquiv a (Ideal.Quotient.mk _ (MvPolynomial.X i)) = namedGenerators a i := sorry

noncomputable def namedSurface (a : FiniteSU2Model) : Scheme :=
  Spec (CommRingCat.of (Hypersurface a))

noncomputable def namedSurfaceComparison (a : FiniteSU2Model) :
    (quotientSpace a.subgroup).left ⟶ namedSurface a :=
  Spec.map (CommRingCat.ofHom (namedHypersurfaceEquiv a).toRingHom)

theorem namedSurfaceComparison_isIso (a : FiniteSU2Model) :
    IsIso (namedSurfaceComparison a) :=
  isIso_SpecMap_iff.mpr (namedHypersurfaceEquiv a).bijective

/-- Apply this literal pullback to NilN8's particular hypersurface resolution r.
No second surface-resolution engine or arbitrary substitute algebra is introduced. -/
noncomputable def pullbackSurfaceResolution (a : FiniteSU2Model)
    {Y : Scheme} (r : Y ⟶ namedSurface a) : Over (quotientSpace a.subgroup).left :=
  Over.mk (Limits.pullback.snd r (namedSurfaceComparison a))

theorem pullbackSurfaceResolution_square (a : FiniteSU2Model)
    {Y : Scheme} (r : Y ⟶ namedSurface a) :
    Limits.pullback.fst r (namedSurfaceComparison a) ≫ r =
      (pullbackSurfaceResolution a r).hom ≫ namedSurfaceComparison a :=
  Limits.pullback.condition

theorem cyclic_generators (n : ℕ) (hn : 1 ≤ n) :
    (fun i => (namedGenerators (.cyclic n hn) i : Coordinates)) =
      ![coordinate 0 ^ n, coordinate 1 ^ n, coordinate 0 * coordinate 1] := sorry

noncomputable def dihedralRawTriple (m : ℕ) : Fin 3 → Coordinates :=
  let A := coordinate 0 ^ (2 * m)
  let B := coordinate 1 ^ (2 * m)
  let w := coordinate 0 * coordinate 1
  ![w * (A - B), A + B, w ^ 2]

theorem dihedral_raw_relation (m : ℕ) :
    (dihedralRawTriple m 0) ^ 2 = dihedralRawTriple m 2 *
      ((dihedralRawTriple m 1) ^ 2 - 4 * dihedralRawTriple m 2 ^ m) := by
  dsimp [dihedralRawTriple]
  simp only [mul_pow, pow_mul]
  ring

/-- Explicit nonzero rescalings from the raw triple to the pinned positive-sign hypersurface. -/
theorem dihedral_normalizing_units (m : ℕ) (hm : 2 ≤ m) :
    ∃ c : Fin 3 → ℂˣ, ∀ i,
      (namedGenerators (.dihedral m hm) i : Coordinates) = (c i : ℂ) • dihedralRawTriple m i := sorry

def exceptionalDegrees : FiniteSU2Model → Fin 3 → ℕ
  | .tetrahedral => ![12, 8, 6]
  | .octahedral => ![18, 12, 8]
  | .icosahedral => ![30, 20, 12]
  | .dihedral m _ => ![2 * m + 2, 2 * m, 4]
  | .cyclic n _ => ![n, n, 2]

theorem namedGenerators_homogeneous (a : FiniteSU2Model) (i : Fin 3) :
    (polynomialCoordinates (namedGenerators a i)).IsHomogeneous (exceptionalDegrees a i) := sorry

/-! ## Affine Γ-clusters over arbitrary complex algebras (including nonreduced bases) -/

noncomputable def basePolynomialAction : ∀ (H : Subgroup TauCeti.SU2)
    (A : Type) [CommRing A] [Algebra ℂ A], MulSemiringAction H (MvPolynomial (Fin 2) A) := sorry

/-- This pins the base-change action to the actual restricted point matrix, not a fresh action. -/
theorem basePolynomialAction_X (H : Subgroup TauCeti.SU2)
    (A : Type) [CommRing A] [Algebra ℂ A] (g : H) (i : Fin 2) :
    letI := basePolynomialAction H A
    g • (MvPolynomial.X i : MvPolynomial (Fin 2) A) =
      ∑ j, MvPolynomial.C (algebraMap ℂ A (((g⁻¹).val : Matrix (Fin 2) (Fin 2) ℂ) i j)) *
        MvPolynomial.X j := sorry

theorem basePolynomialAction_C (H : Subgroup TauCeti.SU2)
    (A : Type) [CommRing A] [Algebra ℂ A] (g : H) (a : A) :
    letI := basePolynomialAction H A
    g • (MvPolynomial.C a : MvPolynomial (Fin 2) A) = MvPolynomial.C a := sorry

/-- Over ℂ, this is exactly the lifted coordinate action under the native basis equivalence. -/
theorem basePolynomialAction_complex (H : Subgroup TauCeti.SU2) (g : H) (f : Coordinates) :
    letI := basePolynomialAction H ℂ
    polynomialCoordinates (g • f) = g • polynomialCoordinates f := sorry

noncomputable def clusterRepresentation : ∀ (H : Subgroup TauCeti.SU2)
    (A : Type) [CommRing A] [Algebra ℂ A] (I : Ideal (MvPolynomial (Fin 2) A))
    (hI : ∀ (g : H) (f : MvPolynomial (Fin 2) A), f ∈ I →
      (letI := basePolynomialAction H A; g • f) ∈ I),
    Representation A H (MvPolynomial (Fin 2) A ⧸ I) := sorry

theorem clusterRepresentation_mk (H : Subgroup TauCeti.SU2)
    (A : Type) [CommRing A] [Algebra ℂ A] (I : Ideal (MvPolynomial (Fin 2) A))
    (hI : ∀ (g : H) (f : MvPolynomial (Fin 2) A), f ∈ I →
      (letI := basePolynomialAction H A; g • f) ∈ I)
    (g : H) (f : MvPolynomial (Fin 2) A) :
    clusterRepresentation H A I hI g (Ideal.Quotient.mk I f) =
      Ideal.Quotient.mk I (letI := basePolynomialAction H A; g • f) := sorry

/-- The actual multiplicity submodule, not a separate irreducible-class engine. -/
def multiplicityModule (H : Subgroup TauCeti.SU2) [Fintype H]
    (A : Type) [CommRing A] [Algebra ℂ A] (I : Ideal (MvPolynomial (Fin 2) A))
    (hI : ∀ (g : H) (f : MvPolynomial (Fin 2) A), f ∈ I →
      (letI := basePolynomialAction H A; g • f) ∈ I) (i : CanonicalIndex H) :
    Submodule A (canonicalSimple H i →ₗ[ℂ] (MvPolynomial (Fin 2) A ⧸ I)) where
  carrier := {f | ∀ (g : H) v, f ((canonicalSimple H i).ρ g v) =
    clusterRepresentation H A I hI g (f v)}
  zero_mem' := by simp
  add_mem' := by
    intro f g hf hg h v
    change f ((canonicalSimple H i).ρ h v) + g ((canonicalSimple H i).ρ h v) =
      clusterRepresentation H A I hI h (f v + g v)
    rw [map_add]
    exact congrArg₂ (· + ·) (hf h v) (hg h v)
  smul_mem' := by
    intro a f hf h v
    change a • f ((canonicalSimple H i).ρ h v) =
      clusterRepresentation H A I hI h (a • f v)
    rw [map_smul]
    exact congrArg (a • ·) (hf h v)

/-- A moduli object contains an ACTUAL invariant ideal and finite-projective regular fibres.
It assumes no resolution, component bijection, degree calculation, smoothness or chart inverse. -/
structure AffineCluster (H : Subgroup TauCeti.SU2) [Fintype H]
    (A : Type) [CommRing A] [Algebra ℂ A] where
  ideal : Ideal (MvPolynomial (Fin 2) A)
  stable : ∀ (g : H) (f : MvPolynomial (Fin 2) A), f ∈ ideal →
    (letI := basePolynomialAction H A; g • f) ∈ ideal
  finite : Module.Finite A (MvPolynomial (Fin 2) A ⧸ ideal)
  projective : Module.Projective A (MvPolynomial (Fin 2) A ⧸ ideal)
  regular : ∀ (i : CanonicalIndex H) (p : PrimeSpectrum A),
    Module.rankAtStalk (multiplicityModule H A ideal stable i) p = canonicalDimensions H i

noncomputable def affineClusterBaseChange : ∀ (H : Subgroup TauCeti.SU2) [Fintype H]
    (A B : Type) [CommRing A] [Algebra ℂ A] [CommRing B] [Algebra ℂ B]
    (f : A →ₐ[ℂ] B), AffineCluster H A → AffineCluster H B := sorry

theorem affineClusterBaseChange_ideal (H : Subgroup TauCeti.SU2) [Fintype H]
    (A B : Type) [CommRing A] [Algebra ℂ A] [CommRing B] [Algebra ℂ B]
    (f : A →ₐ[ℂ] B) (c : AffineCluster H A) :
    (affineClusterBaseChange H A B f c).ideal = Ideal.map (MvPolynomial.map f.toRingHom) c.ideal := sorry

theorem affineClusterBaseChange_id (H : Subgroup TauCeti.SU2) [Fintype H]
    (A : Type) [CommRing A] [Algebra ℂ A] (c : AffineCluster H A) :
    affineClusterBaseChange H A A (AlgHom.id ℂ A) c = c := sorry

theorem affineClusterBaseChange_comp (H : Subgroup TauCeti.SU2) [Fintype H]
    (A B C : Type) [CommRing A] [Algebra ℂ A] [CommRing B] [Algebra ℂ B]
    [CommRing C] [Algebra ℂ C] (f : A →ₐ[ℂ] B) (g : B →ₐ[ℂ] C) (c : AffineCluster H A) :
    affineClusterBaseChange H B C g (affineClusterBaseChange H A B f c) =
      affineClusterBaseChange H A C (g.comp f) c := sorry

/-! ## Representability, actual resolution, universal ideals and tautological bundles -/
noncomputable def clusterScheme : ∀ (H : Subgroup TauCeti.SU2) [Fintype H], Over complexPoint := sorry
noncomputable def resolution : ∀ (H : Subgroup TauCeti.SU2) [Fintype H], Over complexPoint := sorry
noncomputable def resolutionMap : ∀ (H : Subgroup TauCeti.SU2) [Fintype H],
    resolution H ⟶ quotientSpace H := sorry

noncomputable def affineClusterEquiv : ∀ (H : Subgroup TauCeti.SU2) [Fintype H]
    (A : Type) [CommRing A] [Algebra ℂ A],
    (Over.mk (Spec.algebraMap ℂ A) ⟶ clusterScheme H) ≃ AffineCluster H A := sorry

noncomputable def affineTestChange (A B : Type) [CommRing A] [Algebra ℂ A]
    [CommRing B] [Algebra ℂ B] (f : A →ₐ[ℂ] B) :
    Over.mk (Spec.algebraMap ℂ B) ⟶ Over.mk (Spec.algebraMap ℂ A) :=
  Over.homMk (Spec.map (CommRingCat.ofHom f.toRingHom)) (by sorry)

theorem affineClusterEquiv_natural (H : Subgroup TauCeti.SU2) [Fintype H]
    (A B : Type) [CommRing A] [Algebra ℂ A] [CommRing B] [Algebra ℂ B]
    (f : A →ₐ[ℂ] B) (u : Over.mk (Spec.algebraMap ℂ A) ⟶ clusterScheme H) :
    affineClusterEquiv H B (affineTestChange A B f ≫ u) =
      affineClusterBaseChange H A B f (affineClusterEquiv H A u) := sorry

/-- Full chart exhaustion is a theorem, not part of a cluster certificate. -/
noncomputable def resolutionClusterIso : ∀ (H : Subgroup TauCeti.SU2) [Fintype H],
    resolution H ≅ clusterScheme H := sorry

theorem resolutionMap_proper (H : Subgroup TauCeti.SU2) [Fintype H] :
    IsProper (resolutionMap H).left := sorry

noncomputable def universalIdeal : ∀ (H : Subgroup TauCeti.SU2) [Fintype H],
    (Limits.pullback (resolution H).hom plane.hom).IdealSheafData := sorry

noncomputable def baseCoordinateMap (A : Type) [CommRing A] [Algebra ℂ A] :
    Coordinates →ₐ[ℂ] MvPolynomial (Fin 2) A :=
  (MvPolynomial.aeval (fun i : Fin 2 => (MvPolynomial.X i : MvPolynomial (Fin 2) A))).comp
    polynomialCoordinates.toAlgHom

/-- The two actual coordinate projections on Spec A[x,y], not an arbitrary test morphism. -/
noncomputable def affineFamilyMap (H : Subgroup TauCeti.SU2) [Fintype H]
    (A : Type) [CommRing A] [Algebra ℂ A]
    (u : Over.mk (Spec.algebraMap ℂ A) ⟶ resolution H) :
    Spec (CommRingCat.of (MvPolynomial (Fin 2) A)) ⟶
      Limits.pullback (resolution H).hom plane.hom :=
  Limits.pullback.lift
    (Spec.algebraMap A (MvPolynomial (Fin 2) A) ≫ u.left)
    (Spec.map (CommRingCat.ofHom (baseCoordinateMap A).toRingHom)) (by sorry)

/-- Pull back the ACTUAL universal ideal, then use Γ(Spec B)=B, with correct inverse direction. -/
noncomputable def universalIdealOnAffine (H : Subgroup TauCeti.SU2) [Fintype H]
    (A : Type) [CommRing A] [Algebra ℂ A]
    (u : Over.mk (Spec.algebraMap ℂ A) ⟶ resolution H) : Ideal (MvPolynomial (Fin 2) A) :=
  Ideal.comap (Scheme.ΓSpecIso (CommRingCat.of (MvPolynomial (Fin 2) A))).inv.hom
    (((universalIdeal H).comap (affineFamilyMap H A u)).ideal
      ⟨⊤, isAffineOpen_top _⟩)

theorem universalIdealOnAffine_eq (H : Subgroup TauCeti.SU2) [Fintype H]
    (A : Type) [CommRing A] [Algebra ℂ A]
    (u : Over.mk (Spec.algebraMap ℂ A) ⟶ resolution H) :
    universalIdealOnAffine H A u =
      (affineClusterEquiv H A (u ≫ (resolutionClusterIso H).hom)).ideal := sorry

noncomputable def universalFamily (H : Subgroup TauCeti.SU2) [Fintype H] : Scheme :=
  (universalIdeal H).subscheme

noncomputable def universalProjection (H : Subgroup TauCeti.SU2) [Fintype H] :
    universalFamily H ⟶ (resolution H).left :=
  (universalIdeal H).subschemeι ≫ Limits.pullback.fst _ _

theorem universalProjection_finite (H : Subgroup TauCeti.SU2) [Fintype H] :
    IsFinite (universalProjection H) := sorry

theorem universalProjection_flat (H : Subgroup TauCeti.SU2) [Fintype H] :
    Flat (universalProjection H) := sorry

noncomputable def tautological : ∀ (H : Subgroup TauCeti.SU2) [Fintype H]
    (i : CanonicalIndex H), AlgebraicVectorBundles.FiniteLocallyFreeSheaf (resolution H).left := sorry

/-- The Hom convention is pinned to actual polynomial quotient modules on EVERY affine test map. -/
noncomputable def tautologicalAffineIso : ∀ (H : Subgroup TauCeti.SU2) [Fintype H]
    (A : Type) [CommRing A] [Algebra ℂ A]
    (u : Over.mk (Spec.algebraMap ℂ A) ⟶ resolution H) (i : CanonicalIndex H),
    ((AlgebraicVectorBundles.pullbackFiniteLocallyFree u.left).obj (tautological H i)).obj ≅
      AlgebraicGeometry.tilde (ModuleCat.of A
        (multiplicityModule H A
          (affineClusterEquiv H A (u ≫ (resolutionClusterIso H).hom)).ideal
          (affineClusterEquiv H A (u ≫ (resolutionClusterIso H).hom)).stable i)) := sorry

noncomputable def tautological_trivial : ∀ (H : Subgroup TauCeti.SU2) [Fintype H],
    (tautological H (canonicalTrivialIndex H)).obj ≅
      _root_.SheafOfModules.unit (resolution H).left.ringCatSheaf := sorry

theorem tautological_rank (H : Subgroup TauCeti.SU2) [Fintype H]
    (i : CanonicalIndex H) :
    AlgebraicVectorBundles.rank (tautological H i) =
      LocallyConstant.const (resolution H).left (canonicalDimensions H i) := sorry

/-- Construct this surjection from a finite Γ-stable space of polynomial generators and averaging.
It is the actual finite global generation statement, not a new private predicate. -/
theorem tautological_finite_global_generators (H : Subgroup TauCeti.SU2) [Fintype H]
    (i : CanonicalIndex H) : ∃ (N : ℕ)
      (f : _root_.SheafOfModules.free (R := (resolution H).left.ringCatSheaf) (Fin N) ⟶
        (tautological H i).obj), Epi f := sorry

/-- The actual complex origin is induced by restricting evaluation at zero to invariants. -/
noncomputable def origin (H : Subgroup TauCeti.SU2) : complexPoint ⟶ (quotientSpace H).left :=
  Spec.map (CommRingCat.ofHom ((evaluate 0).toRingHom.comp (Invariants H).subtype))

noncomputable def exceptionalSet (H : Subgroup TauCeti.SU2) [Fintype H] :
    Set (resolution H).left :=
  Set.range (Limits.pullback.fst (resolutionMap H).left (origin H))

/-- Actual positive-dimensional irreducible components of the fibre, before irrep labeling. -/
def ComponentIndex (H : Subgroup TauCeti.SU2) [Fintype H] :=
  {Z : TopologicalSpace.Closeds (resolution H).left //
    IsIrreducible (Z : Set (resolution H).left) ∧
    (Z : Set (resolution H).left) ⊆ exceptionalSet H ∧
    (∃ x ∈ (Z : Set (resolution H).left), ∃ y ∈ (Z : Set (resolution H).left), x ≠ y) ∧
    ∀ W : TopologicalSpace.Closeds (resolution H).left,
      IsIrreducible (W : Set (resolution H).left) →
      (W : Set (resolution H).left) ⊆ exceptionalSet H → Z ≤ W → W = Z}

noncomputable def componentScheme (H : Subgroup TauCeti.SU2) [Fintype H]
    (j : ComponentIndex H) : Scheme := (Scheme.IdealSheafData.vanishingIdeal j.val).subscheme
noncomputable def componentInclusion (H : Subgroup TauCeti.SU2) [Fintype H]
    (j : ComponentIndex H) : componentScheme H j ⟶ (resolution H).left :=
  (Scheme.IdealSheafData.vanishingIdeal j.val).subschemeι

noncomputable def componentDegree (H : Subgroup TauCeti.SU2) [Fintype H]
    (L : TauCeti.AlgebraicGeometry.InvertibleSheaf (resolution H).left)
    (j : ComponentIndex H) : ℤ := by
  letI : (componentScheme H j).Over complexPoint :=
    ⟨componentInclusion H j ≫ (resolution H).hom⟩
  exact (((TauCeti.AlgebraicGeometry.InvertibleSheaf.pullback
    (componentInclusion H j)).obj L).eulerDegree ℂ)

noncomputable def componentLabel : ∀ (H : Subgroup TauCeti.SU2) [Fintype H],
    {i : CanonicalIndex H // i ≠ canonicalTrivialIndex H} ≃ ComponentIndex H := sorry

theorem tautological_degree_nonnegative (H : Subgroup TauCeti.SU2) [Fintype H]
    (i : CanonicalIndex H) (j : ComponentIndex H) :
    0 ≤ componentDegree H (AlgebraicVectorBundles.determinantObj (tautological H i)) j := sorry

noncomputable instance componentFintype (H : Subgroup TauCeti.SU2) [Fintype H] :
    Fintype (ComponentIndex H) := Fintype.ofEquiv
      {i : CanonicalIndex H // i ≠ canonicalTrivialIndex H} (componentLabel H)

/-- Positive delta degrees: no guessed sign, and no input field assuming this theorem. -/
theorem tautological_degree_delta (H : Subgroup TauCeti.SU2) [Fintype H]
    (i j : {i : CanonicalIndex H // i ≠ canonicalTrivialIndex H}) :
    componentDegree H (AlgebraicVectorBundles.determinantObj (tautological H i.val))
      (componentLabel H j) = if i = j then 1 else 0 := sorry

/-- The concrete quotient map retains its full input and has the required nontrivial basis. -/
noncomputable def geometricRootQuotient (H : Subgroup TauCeti.SU2) [Fintype H] :
    ((CanonicalIndex H → ℤ) ⧸ Submodule.span ℤ
      {fun i => (canonicalDimensions H i : ℤ)}) ≃ₗ[ℤ] (ComponentIndex H → ℤ) :=
  (markedMcKay_deleteTrivial H).trans
    (LinearEquiv.funCongrLeft ℤ ℤ (componentLabel H).symm)

theorem geometricRootQuotient_mk (H : Subgroup TauCeti.SU2) [Fintype H]
    (x : CanonicalIndex H → ℤ)
    (j : {i : CanonicalIndex H // i ≠ canonicalTrivialIndex H}) :
    geometricRootQuotient H (Submodule.Quotient.mk x) (componentLabel H j) =
      x j.val - x (canonicalTrivialIndex H) * (canonicalDimensions H j.val : ℤ) := sorry

/-- Definite coefficient vector on ACTUAL components, not a second root-lattice carrier. -/
noncomputable def fundamentalCycle (H : Subgroup TauCeti.SU2) [Fintype H] : ComponentIndex H → ℤ :=
  fun j => (canonicalDimensions H ((componentLabel H).symm j).val : ℤ)

/-- This is the TRANSPORTED algebraic matrix. Identifying it with minus the geometric
intersection form is a separate Layer7 theorem on the actual exceptional curves. -/
noncomputable def componentCartan (H : Subgroup TauCeti.SU2) [Fintype H] :
    Matrix (ComponentIndex H) (ComponentIndex H) ℤ :=
  fun i j => subgroupCartan H ((componentLabel H).symm i).val ((componentLabel H).symm j).val

theorem fundamentalCycle_positive (H : Subgroup TauCeti.SU2) [Fintype H]
    (j : ComponentIndex H) : 0 < fundamentalCycle H j := by
  change (0 : ℤ) < (canonicalDimensions H ((componentLabel H).symm j).val : ℤ)
  exact_mod_cast subgroupDimensions_pos H ((componentLabel H).symm j).val

/-- Once minus-intersection equals componentCartan, this is exactly anti-nefness. -/
theorem fundamentalCycle_antiNef (H : Subgroup TauCeti.SU2) [Fintype H]
    (j : ComponentIndex H) :
    0 ≤ ∑ i, componentCartan H j i * fundamentalCycle H i := sorry

/-- Nontriviality is essential: the empty exceptional lattice has no positive cycle. -/
theorem fundamentalCycle_minimal (H : Subgroup TauCeti.SU2) [Fintype H] (hH : H ≠ ⊥)
    (z : ComponentIndex H → ℤ) (hz : ∀ j, 0 ≤ z j) (hne : z ≠ 0)
    (hnef : ∀ j, 0 ≤ ∑ i, componentCartan H j i * z i) :
    ∀ j, fundamentalCycle H j ≤ z j := sorry

theorem trivial_component_empty : IsEmpty (ComponentIndex (⊥ : Subgroup TauCeti.SU2)) := sorry

theorem trivial_fundamentalCycle_zero :
    fundamentalCycle (⊥ : Subgroup TauCeti.SU2) = 0 := by
  funext j
  exact False.elim ((trivial_component_empty).false j)

/-!
The full P¹/cohomology-degree comparison, normal-bundle intersection matrix, anti-nef minimality
for H≠⊥, explicit all-family chart algorithms, conjugation squares, native finite Geck/base
comparison and distinct affine KM realization remain definitive README targets. This file is
not exhaustive. The trivial group has empty components and zero cycle, never a positive cycle.
-/
end TauCetiRoadmap.McKaySkewGroup.Geometric
