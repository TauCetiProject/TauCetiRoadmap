import Mathlib
import TauCeti.LinearAlgebra.FiniteBilinearModule.Orthogonal.Quotient
import TauCeti.LinearAlgebra.FiniteBilinearModule.Quadratic
import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Cardinality
import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Quadratic
import TauCeti.LinearAlgebra.IntegralLattice.Examples
import TauCeti.LinearAlgebra.IntegralLattice.Overlattice.Index
import TauCeti.LinearAlgebra.IntegralLattice.Overlattice.OrthogonalQuotient.Bilinear
import TauCeti.LinearAlgebra.IntegralLattice.Overlattice.OrthogonalQuotient.OrthogonalSum
import TauCeti.LinearAlgebra.IntegralLattice.Overlattice.OrthogonalQuotient.Quadratic
import TauCeti.LinearAlgebra.IntegralLattice.RadicalQuotient
import TauCeti.LinearAlgebra.IntegralLattice.RankOne
import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.D8Plus.Isometry
import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.TypeA
import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.TypeD.SimpleRoots
import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.TypeE
import TauCeti.LinearAlgebra.IntegralLattice.Unimodular

/-!
# Integral lattices, discriminant forms, and overlattices: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below suggest Lean forms for load-bearing milestones, so that
contributors and reviewers can test the representation, quotients, and normalization. Proving every
declaration here would not by itself complete a layer or the roadmap.

Every milestone below is **discharged**: each target is stated as the roadmap asked for it, and
closed by the Tau Ceti declaration that realizes it, so the correspondence is checked by the Lean
kernel rather than asserted in prose. Nothing here records a status by hand -- the remaining
`sorry` count is the remaining work, and it is zero.

The primary carrier is Mathlib's algebraic `Submodule.IsLattice ℚ`; the real-topological
`IsZLattice` API is not used as a replacement. The dual is literally `BilinForm.dualSubmodule`, the
discriminant group is an actual quotient, and character duals use Mathlib's `CharacterModule`. The
quadratic form is only constructed from an even lattice and uses `B(x,x) / 2` in
`AddCircle (1 : ℚ)`. The Markdown roadmap remains definitive.

Where Tau Ceti spells a target differently, the target is stated here in the roadmap's spelling and
the difference is closed by proof rather than by restating the roadmap. Two conventions differ
systematically. Tau Ceti carries evenness through `Even (L.integralNorm x)` on the integral norm
rather than through a rational witness, and it names the definiteness predicates `IsPosDef`,
`IsPosSemidef`, `IsNegDef` and `IsNegSemidef`; both are related to the roadmap's forms below.
-/

namespace TauCetiRoadmap.IntegralLattices

open scoped TensorProduct
open Module TauCeti TauCeti.IntegralLattice

universe u v

/-! ## Lattices with forms and their dual quotients -/

section Lattices

variable {V : Type u} [AddCommGroup V] [Module ℚ V]

/-- An integral symmetric lattice in a rational ambient vector space: a full `ℤ`-submodule, a
symmetric rational form, and integrality of the form on the carrier.  Nondegeneracy is not a
field: see `IsNondegenerate` below. -/
abbrev IntegralLattice (V : Type u) [AddCommGroup V] [Module ℚ V] : Type u :=
  TauCeti.IntegralLattice V

/-- The form takes integer values on pairs of lattice vectors.  This is the roadmap's integrality
field, which Tau Ceti stores as the inclusion of the carrier in its dual submodule. -/
theorem integral (L : IntegralLattice V) (x y : L.carrier) :
    L.form x y ∈ (1 : Submodule ℤ ℚ) :=
  L.form_mem_one x y

/-- Evenness means that every norm lies in `2ℤ`. -/
theorem isEven_iff (L : IntegralLattice V) :
    L.IsEven ↔ ∀ x : L.carrier, ∃ n : ℤ, L.form x x = ((2 * n : ℤ) : ℚ) := by
  rw [L.isEven_iff_forall_norm]
  refine forall_congr' fun x ↦ exists_congr fun n ↦ ?_
  rw [L.norm_apply]
  push_cast
  rfl

/-- The radical of the form. -/
theorem radical_eq (L : IntegralLattice V) : L.radical = LinearMap.ker L.form := rfl

/-- The nondegeneracy mixin holds exactly when the ambient form is nondegenerate. -/
theorem isNondegenerate_iff_form (L : IntegralLattice V) :
    L.IsNondegenerate ↔ L.form.Nondegenerate :=
  ⟨fun h ↦ h.nondegenerate, fun h ↦ ⟨h⟩⟩

/-- Nondegeneracy is exactly triviality of the radical. -/
theorem isNondegenerate_iff_radical_eq_bot (L : IntegralLattice V) :
    L.IsNondegenerate ↔ L.radical = ⊥ := by
  rw [isNondegenerate_iff_form, ← not_iff_not, ← L.isDegenerate_iff_not_nondegenerate]
  exact Iff.rfl

/-! Definiteness is expressed through Mathlib's indices of inertia, which are available over any
linearly ordered field and so over `ℚ` itself. -/

/-- The three indices exhaust the rank; this is `sigPos_add_sigNeg_add_radical`, not a new proof of
Sylvester's law of inertia. -/
theorem sigPos_add_sigNull_add_sigNeg (L : IntegralLattice V) [FiniteDimensional ℚ V] :
    L.sigPos + L.sigNull + L.sigNeg = Module.finrank ℚ V :=
  L.signature_sum_eq_finrank

/-- Positive-definiteness is a predicate, not part of the lattice structure. -/
theorem isPositiveDefinite_iff' (L : IntegralLattice V) :
    L.IsPosDef ↔ ∀ x : V, x ≠ 0 → 0 < L.form x x :=
  L.isPosDef_iff

/-- Positive-semidefiniteness admits a radical; it is the affine Cartan matrix case. -/
theorem isPositiveSemidefinite_iff (L : IntegralLattice V) :
    L.IsPosSemidef ↔ ∀ x : V, 0 ≤ L.form x x :=
  L.isPosSemidef_iff

/-- Negative-definiteness. -/
theorem isNegativeDefinite_iff (L : IntegralLattice V) :
    L.IsNegDef ↔ ∀ x : V, x ≠ 0 → L.form x x < 0 :=
  L.isNegDef_iff

/-- Negative-semidefiniteness. -/
theorem isNegativeSemidefinite_iff (L : IntegralLattice V) :
    L.IsNegSemidef ↔ ∀ x : V, L.form x x ≤ 0 :=
  L.isNegSemidef_iff

/-- Indefiniteness: vectors of both signs, equivalently `n₊ > 0` and `n₋ > 0`. -/
theorem isIndefinite_iff' (L : IntegralLattice V) :
    L.IsIndefinite ↔ (∃ x : V, 0 < L.form x x) ∧ (∃ x : V, L.form x x < 0) :=
  L.isIndefinite_iff_exists_pos_and_exists_neg

/-- The definite case is the semidefinite case with no radical. -/
theorem isPositiveDefinite_iff (L : IntegralLattice V) :
    L.IsPosDef ↔ L.IsPosSemidef ∧ L.IsNondegenerate := by
  rw [L.isPosDef_iff_isPosSemidef_and_nondegenerate]
  exact and_congr_right fun _ ↦ (isNondegenerate_iff_form L).symm

/-- Indefinite is exactly the failure of both semidefiniteness conditions. -/
theorem isIndefinite_iff (L : IntegralLattice V) :
    L.IsIndefinite ↔ ¬ L.IsPosSemidef ∧ ¬ L.IsNegSemidef :=
  L.isIndefinite_iff_not_semidef

/-- Each predicate is visible in the signature. -/
theorem isPositiveSemidefinite_iff_sigNeg_eq_zero (L : IntegralLattice V) :
    L.IsPosSemidef ↔ L.sigNeg = 0 :=
  L.isPosSemidef_iff_sigNeg_eq_zero

/-- The lattice obtained by quotienting out the radical: this is how a degenerate lattice, such as
one presented by an affine Cartan matrix, reaches the nondegenerate theory below. -/
noncomputable abbrev radicalQuotient (L : IntegralLattice V) :
    IntegralLattice (V ⧸ L.radical) :=
  L.radicalQuotient

instance (L : IntegralLattice V) : L.radicalQuotient.IsNondegenerate :=
  ⟨L.nondegenerate_radicalQuotient⟩

/-- The radical quotient keeps the indices of inertia and loses only the radical. -/
theorem signature_radicalQuotient (L : IntegralLattice V) :
    L.radicalQuotient.signature = (L.sigPos, 0, L.sigNeg) :=
  L.signature_radicalQuotient

/-- Evenness descends to the radical quotient. -/
theorem radicalQuotient_isEven {L : IntegralLattice V} (hL : L.IsEven) :
    L.radicalQuotient.IsEven :=
  hL.radicalQuotient

/-- The dual is Mathlib's existing algebraic dual submodule. -/
theorem dual_eq (L : IntegralLattice V) :
    L.dualCarrier = L.form.dualSubmodule L.carrier := rfl

/-- Integrality puts the carrier inside its dual. -/
theorem carrier_le_dual (L : IntegralLattice V) : L.carrier ≤ L.dualCarrier :=
  L.le_dualCarrier

/-- The original carrier, regarded as a submodule of the subtype `L^∨`. -/
theorem carrierInDual_eq (L : IntegralLattice V) :
    L.carrierInDual = L.carrier.submoduleOf L.dualCarrier := rfl

/-- The actual discriminant-group quotient `L^∨ / L`. -/
theorem discriminantGroup_eq (L : IntegralLattice V) :
    L.DiscriminantGroup = (L.dualCarrier ⧸ L.carrierInDual) := rfl

/-- The dual of a full lattice is again a full lattice exactly when the form is nondegenerate: this
is where the mixin is load-bearing, since a radical vector spans a rational line inside the dual. -/
theorem dual_isLattice_iff (L : IntegralLattice V) :
    L.dualCarrier.IsLattice ℚ ↔ L.IsNondegenerate := by
  rw [L.isLattice_dualCarrier_iff_nondegenerate]
  exact (isNondegenerate_iff_form L).symm

theorem dual_isLattice (L : IntegralLattice V) [L.IsNondegenerate] :
    L.dualCarrier.IsLattice ℚ :=
  (dual_isLattice_iff L).mpr ‹_›

/-- The form identifies the dual lattice with the integral module dual. -/
noncomputable abbrev dualEquivModuleDual (L : IntegralLattice V) [L.IsNondegenerate] :
    L.dualCarrier ≃ₗ[ℤ] Module.Dual ℤ L.carrier :=
  L.dualPairingEquiv

/-- Double duality inside the fixed rational ambient space. -/
theorem dual_dual (L : IntegralLattice V) [L.IsNondegenerate] :
    L.form.dualSubmodule L.dualCarrier = L.carrier :=
  L.dualSubmodule_dualCarrier

/-- The discriminant group is finite, and again only in the nondegenerate case. -/
theorem discriminantGroup_finite (L : IntegralLattice V) [L.IsNondegenerate] :
    Finite L.DiscriminantGroup :=
  inferInstance

theorem finite_discriminantGroup_iff (L : IntegralLattice V) :
    Finite L.DiscriminantGroup ↔ L.IsNondegenerate := by
  rw [L.finite_discriminantGroup_iff_nondegenerate]
  exact (isNondegenerate_iff_form L).symm

/-- The Gram entries cast back to the values of the rational form. -/
theorem algebraMap_gramMatrix_apply (L : IntegralLattice V) {ι : Type v}
    (e : Basis ι ℤ L.carrier) (i j : ι) :
    ((L.gramMatrix e i j : ℤ) : ℚ) = L.form (e i) (e j) :=
  L.intCast_gramMatrix_apply e i j

/-- The Gram determinant vanishes exactly in the degenerate case. -/
theorem gramDet_ne_zero_iff (L : IntegralLattice V) {ι : Type v} [Fintype ι] [DecidableEq ι]
    (e : Basis ι ℤ L.carrier) : L.gramDet e ≠ 0 ↔ L.IsNondegenerate := by
  rw [L.gramDet_ne_zero_iff e]
  exact (isNondegenerate_iff_form L).symm

/-- The order of `L^∨/L` is the absolute, not signed, Gram determinant. -/
theorem natCard_discriminantGroup_eq_natAbs_gramDet (L : IntegralLattice V) [L.IsNondegenerate]
    {ι : Type v} [Fintype ι] [DecidableEq ι] (e : Basis ι ℤ L.carrier) :
    Nat.card L.DiscriminantGroup = (L.gramDet e).natAbs := by
  convert L.natCard_discriminantGroup_eq_natAbs_gramDet e using 3

/-- Unimodular means self-dual. -/
theorem isUnimodular_iff_eq_dual (L : IntegralLattice V) :
    L.IsUnimodular ↔ L.carrier = L.dualCarrier :=
  L.isUnimodular_def

/-- Triviality of the discriminant group characterizes unimodularity. -/
theorem unimodular_iff_natCard_discriminantGroup_eq_one (L : IntegralLattice V)
    [L.IsNondegenerate] :
    L.IsUnimodular ↔ Nat.card L.DiscriminantGroup = 1 :=
  L.isUnimodular_iff_natCard_discriminantGroup_eq_one

/-- A Gram determinant has absolute value one exactly for a unimodular lattice. -/
theorem unimodular_iff_natAbs_gramDet_eq_one (L : IntegralLattice V) [L.IsNondegenerate]
    {ι : Type v} [Fintype ι] [DecidableEq ι] (e : Basis ι ℤ L.carrier) :
    L.IsUnimodular ↔ (L.gramDet e).natAbs = 1 :=
  L.isUnimodular_iff_natAbs_gramDet_eq_one e

/-- An isometry preserves both the embedded carrier and the form. -/
theorem isometry_map_form {W : Type v} [AddCommGroup W] [Module ℚ W]
    {L : IntegralLattice V} {M : IntegralLattice W} (e : L.Isometry M) (x y : V) :
    M.form (e x) (e y) = L.form x y :=
  e.map_app x y

theorem isometry_map_mem_iff {W : Type v} [AddCommGroup W] [Module ℚ W]
    {L : IntegralLattice V} {M : IntegralLattice W} (e : L.Isometry M) (x : V) :
    e x ∈ M.carrier ↔ x ∈ L.carrier :=
  e.apply_mem_carrier_iff x

end Lattices


/-! ## Finite bilinear and quadratic modules -/

section FiniteModules

/-- A finite symmetric bilinear module with adjoint valued in Mathlib's character module. -/
abbrev FiniteBilinearModule : Type (u + 1) := TauCeti.FiniteBilinearModule.{u}

namespace FiniteBilinearModule

variable (A : FiniteBilinearModule.{u})

/-- The pairing is symmetric. -/
theorem symmetric (x y : A) : A.pairing x y = A.pairing y x := A.pairing_comm x y

/-- Nondegeneracy is deliberately a predicate, since subgroup restrictions can be degenerate. -/
theorem isNondegenerate_iff : A.IsNondegenerate ↔ Function.Bijective A.pairing := Iff.rfl

/-- Nondegeneracy gives an actual equivalence with the character dual. -/
noncomputable abbrev adjointEquiv (hA : A.IsNondegenerate) : A ≃+ CharacterModule A :=
  TauCeti.FiniteBilinearModule.adjointEquiv A hA

/-- The orthogonal complement is available as an explicit subgroup. -/
theorem mem_orthogonalComplement_iff (H : AddSubgroup A) (x : A) :
    x ∈ A.orthogonalComplement H ↔ ∀ y ∈ H, A.pairing x y = 0 :=
  TauCeti.FiniteBilinearModule.mem_orthogonalComplement_iff A H x

/-- Bilinear isotropy means that the pairing vanishes on `H × H`. -/
theorem isIsotropic_iff (H : AddSubgroup A) :
    A.IsIsotropic H ↔ ∀ x ∈ H, ∀ y ∈ H, A.pairing x y = 0 := Iff.rfl

/-- A Lagrangian is an isotropic subgroup equal to its orthogonal complement. -/
theorem isLagrangian_iff (H : AddSubgroup A) :
    A.IsLagrangian H ↔ A.IsIsotropic H ∧ H = A.orthogonalComplement H :=
  ⟨fun h ↦ ⟨h.isIsotropic, h⟩, fun h ↦ h.2⟩

/-- The cardinality formula for a subgroup of a nondegenerate finite bilinear module. -/
theorem natCard_mul_natCard_orthogonalComplement (hA : A.IsNondegenerate) (H : AddSubgroup A) :
    Nat.card H * Nat.card (A.orthogonalComplement H) = Nat.card A :=
  TauCeti.FiniteBilinearModule.IsNondegenerate.card_mul_card_orthogonalComplement A hA H

/-- The explicit quotient type `H^⊥/H` used in the gluing theorem: the orthogonal complement
modulo the copy of `H` inside it. -/
theorem orthogonalQuotient_carrier (H : AddSubgroup A) :
    (A.orthogonalQuotient H).carrier =
      (A.orthogonalComplement H ⧸
        (H.addSubgroupOf (A.orthogonalComplement H)).toIntSubmodule) := rfl

/-- Its pairing is the pairing of `A` read on representatives. -/
theorem orthogonalQuotient_pairing (H : AddSubgroup A) (x y : A.orthogonalComplement H) :
    (A.orthogonalQuotient H).pairing (A.orthogonalQuotientMk H x) (A.orthogonalQuotientMk H y) =
      A.pairing x.1 y.1 :=
  TauCeti.FiniteBilinearModule.orthogonalQuotient_pairing_mk A H x y

end FiniteBilinearModule

/-- A quadratic refinement, reusing Mathlib's quadratic-map structure in the half-norm
convention. -/
abbrev FiniteQuadraticModule : Type (u + 1) := TauCeti.FiniteQuadraticModule.{u}

namespace FiniteQuadraticModule

variable (A : FiniteQuadraticModule.{u})

/-- The polar form of the quadratic refinement is the stored pairing. -/
theorem polar (x y : A) :
    QuadraticMap.polar A.quadratic x y = A.toFiniteBilinearModule.pairing x y :=
  TauCeti.FiniteQuadraticModule.polar_eq_pairing' A x y

/-- Nondegeneracy of a quadratic module means nondegeneracy of its polar pairing. -/
theorem isNondegenerate_iff :
    A.IsNondegenerate ↔ A.toFiniteBilinearModule.IsNondegenerate := Iff.rfl

/-- Quadratic isotropy is `q|_H = 0`, stronger data than a mere group inclusion. -/
theorem isIsotropic_iff (H : AddSubgroup A) :
    A.IsIsotropic H ↔ ∀ x ∈ H, A.quadratic x = 0 := Iff.rfl

/-- Isometries preserve the quadratic refinement, hence also its polar form. -/
theorem isometry_map_quadratic {B : FiniteQuadraticModule.{v}}
    (f : TauCeti.FiniteQuadraticModule.Isometry A B) (x : A) :
    B.quadratic (f x) = A.quadratic x :=
  f.map_app x

/-- The induced finite quadratic module on `H^⊥/H`, whose underlying bilinear module is the
bilinear orthogonal quotient. -/
theorem orthogonalQuotient_toFiniteBilinearModule (H : AddSubgroup A) (hH : A.IsIsotropic H) :
    (A.orthogonalQuotient H hH).toFiniteBilinearModule =
      A.toFiniteBilinearModule.orthogonalQuotient H :=
  TauCeti.FiniteQuadraticModule.orthogonalQuotient_toFiniteBilinearModule A H hH

/-- Orthogonal reduction preserves nondegeneracy when the ambient polar pairing is
nondegenerate. -/
theorem orthogonalQuotient_isNondegenerate (hA : A.IsNondegenerate) (H : AddSubgroup A)
    (hH : A.IsIsotropic H) : (A.orthogonalQuotient H hH).IsNondegenerate :=
  TauCeti.FiniteQuadraticModule.IsNondegenerate.isNondegenerate_orthogonalQuotient A hA hH

end FiniteQuadraticModule

end FiniteModules

/-! ## Discriminant modules -/

section DiscriminantModules

variable {V : Type u} [AddCommGroup V] [Module ℚ V] (L : IntegralLattice V)

/-- The well-defined discriminant pairing, read on representatives as `B(x,y) mod ℤ`. -/
theorem discriminantPairing_mk (x y : L.dualCarrier) :
    L.discriminantPairing (Submodule.Quotient.mk x) (Submodule.Quotient.mk y) =
      (L.form x y : AddCircle (1 : ℚ)) :=
  L.discriminantPairing_mk x y

variable [L.IsNondegenerate]

/-- Every nondegenerate integral lattice has a finite discriminant bilinear module, carried by the
discriminant group and paired by the descended form. -/
theorem discriminantBilinearModule_carrier :
    L.discriminantBilinearModule.carrier = L.DiscriminantGroup := rfl

theorem discriminantBilinearModule_pairing (x y : L.DiscriminantGroup) :
    L.discriminantBilinearModule.pairing x y = L.discriminantPairing x y :=
  L.discriminantBilinearModule_pairing x y

/-- The discriminant pairing is nondegenerate. -/
theorem discriminantBilinearModule_isNondegenerate :
    L.discriminantBilinearModule.IsNondegenerate :=
  L.isNondegenerate_discriminantBilinearModule

omit [L.IsNondegenerate] in
/-- Only an even lattice has the half-norm discriminant quadratic form, and on a representative it
is `B(x,x)/2 mod ℤ`. -/
theorem discriminantQuadraticForm_mk (hL : L.IsEven) (x : L.dualCarrier) :
    L.discriminantQuadraticMap hL (Submodule.Quotient.mk x) =
      ((L.form x x / (2 : ℚ) : ℚ) : AddCircle (1 : ℚ)) :=
  L.discriminantQuadraticMap_mk hL x

omit [L.IsNondegenerate] in
/-- The quadratic discriminant module, with the polar form visible. -/
theorem discriminantQuadraticModule_polar (hL : L.IsEven) (x y : L.DiscriminantGroup) :
    QuadraticMap.polar (L.discriminantQuadraticMap hL) x y = L.discriminantPairing x y :=
  L.polar_discriminantQuadraticMap hL x y

theorem discriminantQuadraticModule_toFiniteBilinearModule (hL : L.IsEven) :
    (L.discriminantQuadraticModule hL).toFiniteBilinearModule =
      L.discriminantBilinearModule :=
  L.discriminantQuadraticModule_toFiniteBilinearModule hL

/-- The quadratic discriminant module is nondegenerate through its polar pairing. -/
theorem discriminantQuadraticModule_isNondegenerate (hL : L.IsEven) :
    (L.discriminantQuadraticModule hL).IsNondegenerate :=
  L.isNondegenerate_discriminantQuadraticModule hL

end DiscriminantModules


/-! ## Intermediate lattices and the `H^⊥/H` theorem -/

section Overlattices

open TauCeti.IntegralLattice (IntermediateCarrier)
open TauCeti.IntegralLattice.IntermediateCarrier (IsIntegral IsEven)

variable {V : Type u} [AddCommGroup V] [Module ℚ V] (L : IntegralLattice V)

/-- An intermediate lattice in the same rational ambient space is a carrier between `L` and
`L^∨`; the roadmap's `carrier_le` and `le_dual` fields are the two halves of that interval. -/
theorem intermediateCarrier_eq : L.IntermediateCarrier = Set.Icc L.carrier L.dualCarrier := rfl

theorem carrier_le_intermediate (M : L.IntermediateCarrier) : L.carrier ≤ M.1 := M.2.1

theorem intermediate_le_dual (M : L.IntermediateCarrier) : M.1 ≤ L.dualCarrier := M.2.2

/-- Integrality of an intermediate lattice. -/
theorem isIntegral_iff (M : L.IntermediateCarrier) :
    IsIntegral M ↔ ∀ x ∈ M.1, ∀ y ∈ M.1, L.form x y ∈ (1 : Submodule ℤ ℚ) :=
  TauCeti.IntegralLattice.IntermediateCarrier.isIntegral_def

/-- Evenness of an intermediate lattice. -/
theorem isEven_iff' (M : L.IntermediateCarrier) :
    IsEven M ↔ ∀ x ∈ M.1, ∃ n : ℤ, L.norm x = 2 * n :=
  TauCeti.IntegralLattice.IntermediateCarrier.isEven_def

/-- The subgroup `M/L ≤ A_L` attached to an intermediate lattice, by the class of a dual vector. -/
theorem mk_mem_discriminantSubgroup_iff (M : L.IntermediateCarrier) (x : L.dualCarrier) :
    Submodule.Quotient.mk x ∈ L.discriminantSubgroup M ↔ (x : V) ∈ M.1 :=
  L.mk_mem_discriminantSubgroup_iff M x

/-- The literal inverse image in `L^∨` of a subgroup of `A_L`. -/
theorem mem_intermediateCarrierOfDiscriminantSubgroup_iff
    (H : AddSubgroup L.DiscriminantGroup) (x : V) :
    x ∈ (L.intermediateCarrierOfDiscriminantSubgroup H).1 ↔
      ∃ hx : x ∈ L.dualCarrier, Submodule.Quotient.mk (⟨x, hx⟩ : L.dualCarrier) ∈ H :=
  L.mem_intermediateCarrierOfDiscriminantSubgroup_iff H x

variable [L.IsNondegenerate]

/-- Intermediate lattices and subgroups are mutually inverse, order-preserving constructions. -/
noncomputable abbrev intermediateOrderIsoSubgroup :
    L.IntermediateCarrier ≃o AddSubgroup L.DiscriminantGroup :=
  L.intermediateCarrierOrderIsoDiscriminantSubgroup

/-- Integral overlattices correspond to bilinear-isotropic subgroups. -/
noncomputable abbrev integralOverlatticeEquivIsotropicSubgroup :
    {M : L.IntermediateCarrier // IsIntegral M} ≃o
      {H : AddSubgroup L.DiscriminantGroup // L.discriminantBilinearModule.IsIsotropic H} :=
  L.integralIntermediateCarrierOrderIsoIsotropicSubgroup

/-- Even overlattices correspond to quadratic-isotropic subgroups. -/
noncomputable abbrev evenOverlatticeEquivIsotropicSubgroup (hL : L.IsEven) :
    {M : L.IntermediateCarrier // IsEven M} ≃o
      {H : AddSubgroup L.DiscriminantGroup // (L.discriminantQuadraticModule hL).IsIsotropic H} :=
  L.evenIntermediateCarrierOrderIsoIsotropicSubgroup hL

/-- The integral lattice glued along an intermediate carrier keeps the ambient form. -/
theorem toIntegralLattice_form {M : L.IntermediateCarrier} (hM : IsIntegral M) :
    hM.toIntegralLattice.form = L.form :=
  hM.toIntegralLattice_form

theorem toIntegralLattice_carrier {M : L.IntermediateCarrier} (hM : IsIntegral M) :
    hM.toIntegralLattice.carrier = M.1 :=
  hM.toIntegralLattice_carrier

/-- Gluing along an isotropic subgroup keeps the form, hence keeps nondegeneracy. -/
theorem toIntegralLattice_isNondegenerate {M : L.IntermediateCarrier} (hM : IsIntegral M) :
    hM.toIntegralLattice.IsNondegenerate :=
  inferInstance

/-- The preimage construction is even. -/
theorem toIntegralLattice_isEven {M : L.IntermediateCarrier} (hM : IsEven M) :
    hM.isIntegral.toIntegralLattice.IsEven :=
  hM.isEven_toIntegralLattice

omit [L.IsNondegenerate] in
/-- `[L_H : L] = |H|`. -/
theorem index_intermediateCarrierOfDiscriminantSubgroup (H : AddSubgroup L.DiscriminantGroup) :
    TauCeti.IntegralLattice.IntermediateCarrier.index
        (L.intermediateCarrierOfDiscriminantSubgroup H) = Nat.card H :=
  TauCeti.IntegralLattice.IntermediateCarrier.index_intermediateCarrierOfDiscriminantSubgroup H

/-- `disc(L_H) · [L_H : L]² = disc(L)`, the divisibility conclusion included. -/
theorem discriminant_mul_index_sq {M : L.IntermediateCarrier} (hM : IsIntegral M) :
    hM.toIntegralLattice.discriminant *
        TauCeti.IntegralLattice.IntermediateCarrier.index M ^ 2 = L.discriminant :=
  hM.discriminant_mul_index_sq

omit [L.IsNondegenerate] in
/-- Index is multiplicative along a chain of intermediate lattices. -/
theorem relIndex_mul_relIndex {M N P : L.IntermediateCarrier} (hMN : M ≤ N) (hNP : N ≤ P) :
    TauCeti.IntegralLattice.IntermediateCarrier.relIndex M N *
        TauCeti.IntegralLattice.IntermediateCarrier.relIndex N P =
      TauCeti.IntegralLattice.IntermediateCarrier.relIndex M P :=
  TauCeti.IntegralLattice.IntermediateCarrier.relIndex_mul_relIndex hMN hNP

/-- **The discriminant form of an even overlattice is the induced form on `H^⊥/H`.** -/
noncomputable abbrev discriminantFormOverlatticeEquiv (hL : L.IsEven)
    {M : L.IntermediateCarrier} (hM : IsEven M) :
    FiniteQuadraticModule.Isometry
      (hM.isIntegral.toIntegralLattice.discriminantQuadraticModule hM.isEven_toIntegralLattice)
      ((L.discriminantQuadraticModule hL).orthogonalQuotient (L.discriminantSubgroup M)
        ((TauCeti.IntegralLattice.IntermediateCarrier.isEven_iff_isIsotropic_discriminantSubgroup
          hL M).mp hM)) :=
  TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry hL hM

/-- The same comparison for an integral overlattice that need not be even, on the discriminant
*bilinear* modules; the roadmap records the two refinements separately. -/
noncomputable abbrev discriminantBilinearFormOverlatticeEquiv {M : L.IntermediateCarrier}
    (hM : IsIntegral M) :
    FiniteBilinearModule.Isometry hM.toIntegralLattice.discriminantBilinearModule
      (L.discriminantBilinearModule.orthogonalQuotient (L.discriminantSubgroup M)) :=
  TauCeti.IntegralLattice.IntermediateCarrier.discriminantBilinearOrthogonalQuotientIsometry hM

/-- The order of the orthogonal quotient is the discriminant of the glued lattice. -/
theorem natCard_orthogonalQuotient (hL : L.IsEven) {M : L.IntermediateCarrier} (hM : IsEven M) :
    Nat.card ((L.discriminantQuadraticModule hL).orthogonalQuotient (L.discriminantSubgroup M)
        ((TauCeti.IntegralLattice.IntermediateCarrier.isEven_iff_isIsotropic_discriminantSubgroup
          hL M).mp hM)) =
      hM.isIntegral.toIntegralLattice.discriminant :=
  TauCeti.IntegralLattice.IntermediateCarrier.natCard_orthogonalQuotient hL hM

/-- The glued lattice is unimodular exactly when the isotropic subgroup is Lagrangian. -/
theorem ofIsotropicSubgroup_unimodular_iff (H : AddSubgroup L.DiscriminantGroup) :
    TauCeti.IntegralLattice.IntermediateCarrier.dual
          (L.intermediateCarrierOfDiscriminantSubgroup H) =
        L.intermediateCarrierOfDiscriminantSubgroup H ↔
      L.discriminantBilinearModule.IsLagrangian H :=
  L.dual_intermediateCarrierOfDiscriminantSubgroup_eq_self_iff H

end Overlattices


/-! ## Rank-one normalization test -/

section RankOne

variable (m : ℤ)

/-- The lattice `⟨2m⟩` on the standard copy of `ℤ` in `ℚ`: nonvanishing of `m` is carried as a
`NeZero` instance, so that the degenerate `m = 0` form stays an object of the same type. -/
theorem rankOne_form_apply (x y : ℚ) : (rankOne m).form x y = 2 * m * x * y :=
  _root_.TauCeti.IntegralLattice.rankOne_form_apply m x y

theorem rankOne_isEven : (rankOne m).IsEven := isEven_rankOne m

instance (m : ℤ) [NeZero m] : (rankOne m).IsNondegenerate := inferInstance

/-- The signature records the sign of `m`, so the negative-definite case is not a special case. -/
theorem rankOne_signature (hm : m ≠ 0) :
    (rankOne m).signature = if 0 < m then (1, 0, 0) else (0, 0, 1) := by
  split_ifs with h
  · exact rankOne_signature_of_pos h
  · exact rankOne_signature_of_neg (lt_of_le_of_ne (not_lt.mp h) hm)

/-- The degenerate rank-one lattice, excluded above, is still an object of the type: its signature
is `(0,1,0)`. -/
theorem rankOneZero_signature : (rankOne 0).signature = (0, 1, 0) := rankOne_zero_signature

variable [NeZero m]

/-- The dual really is `(1/(2m))ℤ`, stated without identifying subtype carriers by coercion. -/
theorem mem_rankOne_dual_iff (x : ℚ) :
    x ∈ (rankOne m).dualCarrier ↔ ∃ z : ℤ, x = (z : ℚ) / (2 * (m : ℚ)) := by
  rw [mem_rankOne_dualCarrier_iff]

/-- The class of `1/(2m)` in the dual quotient. -/
theorem coe_rankOneGenerator :
    ((rankOneDualGen m : (rankOne m).dualCarrier) : ℚ) = 1 / (2 * m) :=
  coe_rankOneDualGen m

/-- The discriminant quotient, not merely its cardinality, is cyclic of order `|2m|`. -/
noncomputable abbrev rankOneDiscriminantEquivZMod :
    (rankOne m).DiscriminantGroup ≃+ ZMod (2 * m).natAbs :=
  rankOneDiscriminantEquiv m

/-- The quotient has the expected absolute order for either sign of `m`. -/
theorem natCard_rankOne_discriminantGroup :
    Nat.card (rankOne m).DiscriminantGroup = (2 * m).natAbs :=
  _root_.TauCeti.IntegralLattice.natCard_rankOne_discriminantGroup m

/-- The generator has self-pairing `1/(2m) mod ℤ`. -/
theorem rankOne_bilinear_generator :
    (rankOne m).discriminantPairing (rankOneClass m) (rankOneClass m) =
      ((1 / (2 * (m : ℚ)) : ℚ) : AddCircle (1 : ℚ)) :=
  discriminantPairing_rankOneClass_self m

/-- The half-norm convention gives `q(1/(2m)) = 1/(4m) mod ℤ`. -/
theorem rankOne_quadratic_generator :
    (rankOne m).discriminantQuadraticMap (isEven_rankOne m) (rankOneClass m) =
      ((1 / (4 * (m : ℚ)) : ℚ) : AddCircle (1 : ℚ)) :=
  discriminantQuadraticMap_rankOneClass m

/-- On the generator, the polar of the displayed quadratic value is the displayed pairing. -/
theorem rankOne_polar_generator :
    QuadraticMap.polar ((rankOne m).discriminantQuadraticMap (isEven_rankOne m))
        (rankOneClass m) (rankOneClass m) =
      (rankOne m).discriminantPairing (rankOneClass m) (rankOneClass m) :=
  (rankOne m).polar_discriminantQuadraticMap (isEven_rankOne m) _ _

end RankOne

/-! ## Definiteness acceptance tests

These exercise the predicates outside the positive-definite case: an indefinite lattice, and a
degenerate one which is only positive-semidefinite. -/

section Definiteness

/-- The hyperbolic plane `!![0,1;1,0]`: even, unimodular, and indefinite. -/
theorem hyperbolicPlane_form_apply (x y : Fin 2 → ℚ) :
    hyperbolicPlane.form x y = x 0 * y 1 + x 1 * y 0 :=
  _root_.TauCeti.IntegralLattice.hyperbolicPlane_form_apply x y

instance : hyperbolicPlane.IsNondegenerate :=
  ⟨hyperbolicPlane.determinant_ne_zero_iff.mp (by simp)⟩

theorem hyperbolicPlane_signature : hyperbolicPlane.signature = (1, 0, 1) :=
  _root_.TauCeti.IntegralLattice.hyperbolicPlane_signature

theorem hyperbolicPlane_isEven : hyperbolicPlane.IsEven := isEven_hyperbolicPlane

theorem hyperbolicPlane_isUnimodular : hyperbolicPlane.IsUnimodular :=
  hyperbolicPlane.isUnimodular_iff_discriminant_eq_one.mpr hyperbolicPlane_discriminant

theorem hyperbolicPlane_isIndefinite : hyperbolicPlane.IsIndefinite :=
  isIndefinite_hyperbolicPlane

/-- The affine `Ã₁` Gram matrix `!![2,-2;-2,2]`: even, positive-semidefinite, and degenerate.  It is
a lattice of the same type, which is the point of keeping nondegeneracy out of the structure. -/
theorem affineA1_form_apply (x y : Fin 2 → ℚ) :
    affineA1.form x y = 2 * (x 0 - x 1) * (y 0 - y 1) :=
  _root_.TauCeti.IntegralLattice.affineA1_form_apply x y

theorem affineA1_isEven : affineA1.IsEven := isEven_affineA1

theorem affineA1_signature : affineA1.signature = (1, 1, 0) := _root_.TauCeti.IntegralLattice.affineA1_signature

theorem affineA1_isPositiveSemidefinite : affineA1.IsPosSemidef := isPosSemidef_affineA1

theorem affineA1_not_isNondegenerate : ¬ affineA1.IsNondegenerate := fun h ↦
  affineA1.isDegenerate_iff_not_nondegenerate.mp isDegenerate_affineA1 h.nondegenerate

/-- Quotienting out the radical of `Ã₁` gives the `A₁` root lattice `⟨2⟩`. -/
noncomputable abbrev affineA1RadicalQuotientIsometry :
    affineA1.radicalQuotient.Isometry a1 :=
  _root_.TauCeti.IntegralLattice.affineA1RadicalQuotientIsometry

/-- `A₁` is the rank-one lattice `⟨2⟩`. -/
theorem a1_eq_rankOne : a1 = rankOne 1 := (rankOne_one).symm

end Definiteness

/-! ## The ADE table and the `D₈ ⊂ E₈` acceptance test

The roadmap admits either a general conversion of Tau Ceti's root data or a direct construction of
each root lattice.  Tau Ceti took the second route, so each row is stated for the lattice that
carries it, and the bridge property the roadmap asks of the construction -- that the Gram matrix in
the simple-root basis is the pinned Cartan matrix -- is recorded row by row. -/

section ADE

/-- `Aₙ`: the Gram matrix of the simple roots is `CartanMatrix.A n`. -/
theorem gramMatrix_typeARootLattice (n : ℕ) (i j : Fin n) :
    (typeARootLattice n).form (typeASimpleRoot n i) (typeASimpleRoot n j) =
      ((CartanMatrix.A n i j : ℤ) : ℚ) :=
  form_typeASimpleRoot_typeASimpleRoot n i j

theorem typeARootLattice_isEven (n : ℕ) : (typeARootLattice n).IsEven :=
  isEven_typeARootLattice n

theorem discriminant_typeARootLattice (n : ℕ) : (typeARootLattice n).discriminant = n + 1 :=
  _root_.TauCeti.IntegralLattice.discriminant_typeARootLattice n

/-- `A_n` has cyclic discriminant group of order `n+1`, generated by the first fundamental weight,
whose quadratic value is `n / (2(n+1))`. -/
theorem discriminantQuadraticMap_typeAFundamentalWeightClass (n : ℕ) [NeZero n] :
    (typeARootLattice n).discriminantQuadraticMap (isEven_typeARootLattice n)
        (typeAFundamentalWeightClass n) =
      (((n : ℚ) / (2 * ((n : ℚ) + 1)) : ℚ) : AddCircle (1 : ℚ)) :=
  _root_.TauCeti.IntegralLattice.discriminantQuadraticMap_typeAFundamentalWeightClass n

/-- The `Aₙ` row is verified as a finite quadratic module, not merely as a group order. -/
noncomputable abbrev typeADiscriminantEquiv (n : ℕ) [NeZero n] :
    FiniteQuadraticModule.Isometry (typeAStandardQuadraticModule n)
      ((typeARootLattice n).discriminantQuadraticModule (isEven_typeARootLattice n)) :=
  typeADiscriminantQuadraticIsometry n

/-- `Dₙ`: the checkerboard model has the Cartan matrix `CartanMatrix.D n` as the Gram matrix of its
simple-root basis. -/
theorem gramMatrix_checkerboardLattice (n : ℕ) (hn : 4 ≤ n) :
    (checkerboardLattice n).gramMatrix (checkerboardSimpleRootBasis n hn) = CartanMatrix.D n :=
  gramMatrix_checkerboardSimpleRootBasis hn

/-- The vector class has `q = 1/2`, and either spinor class has `q = n/8`. -/
theorem discriminantQuadraticMap_checkerboardVectorClass (n : ℕ) [NeZero n] :
    (checkerboardLattice n).discriminantQuadraticMap (isEven_checkerboardLattice n)
        (checkerboardVectorClass n) = ((1 / 2 : ℚ) : AddCircle (1 : ℚ)) :=
  _root_.TauCeti.IntegralLattice.discriminantQuadraticMap_checkerboardVectorClass n

theorem discriminantQuadraticMap_checkerboardSpinorClass (n : ℕ) [NeZero n] :
    (checkerboardLattice n).discriminantQuadraticMap (isEven_checkerboardLattice n)
        (checkerboardSpinorClass n) = (((n : ℚ) / 8 : ℚ) : AddCircle (1 : ℚ)) :=
  _root_.TauCeti.IntegralLattice.discriminantQuadraticMap_checkerboardSpinorClass n

/-- Even `Dₙ` is the row that group order alone cannot settle: the discriminant module is the
Klein four model with the table's values. -/
noncomputable abbrev checkerboardDiscriminantEquivEven (n : ℕ) [NeZero n] (hn : Even n) :
    FiniteQuadraticModule.Isometry (checkerboardStandardQuadraticModule n hn)
      ((checkerboardLattice n).discriminantQuadraticModule (isEven_checkerboardLattice n)) :=
  checkerboardDiscriminantQuadraticIsometry n hn

/-- Odd `Dₙ` has cyclic discriminant module of order four. -/
noncomputable abbrev checkerboardDiscriminantEquivOdd (n : ℕ) [NeZero n] (hn : Odd n) :
    FiniteQuadraticModule.Isometry (checkerboardCyclicQuadraticModule n)
      ((checkerboardLattice n).discriminantQuadraticModule (isEven_checkerboardLattice n)) :=
  checkerboardCyclicQuadraticIsometry n hn

/-- `E₆` and `E₇` have discriminant modules `ℤ/3` and `ℤ/2` with the table's quadratic values. -/
noncomputable abbrev typeE₆DiscriminantEquiv :
    FiniteQuadraticModule.Isometry typeE₆StandardQuadraticModule
      (typeE₆RootLattice.discriminantQuadraticModule isEven_typeE₆RootLattice) :=
  typeE₆DiscriminantQuadraticIsometry

noncomputable abbrev typeE₇DiscriminantEquiv :
    FiniteQuadraticModule.Isometry typeE₇StandardQuadraticModule
      (typeE₇RootLattice.discriminantQuadraticModule isEven_typeE₇RootLattice) :=
  typeE₇DiscriminantQuadraticIsometry

/-- `E₈` is self-dual; the discriminant group is trivial. -/
theorem e8_isUnimodular : typeE₈RootLattice.IsUnimodular := isUnimodular_typeE₈RootLattice

/-! ### The `D₈ ⊂ E₈` glue calculation -/

/-- The subgroup generated by the spinor class of `A_{D₈} ≅ (ℤ/2)²` has order two. -/
theorem natCard_d8SpinorSubgroup : Nat.card d8SpinorSubgroup = 2 :=
  _root_.TauCeti.IntegralLattice.natCard_d8SpinorSubgroup

/-- `q(s) = 8/8 = 0`, so the subgroup is quadratic-isotropic. -/
theorem d8SpinorSubgroup_isIsotropic :
    ((checkerboardLattice 8).discriminantQuadraticModule
      (isEven_checkerboardLattice 8)).IsIsotropic d8SpinorSubgroup :=
  isIsotropic_d8SpinorSubgroup

/-- `D₈⁺` is produced by the general gluing operation, not by a fresh construction, and its
carrier is `D₈ ∪ (s + D₈)`. -/
theorem d8Plus_eq_toIntegralLattice
    (h : TauCeti.IntegralLattice.IntermediateCarrier.IsEven
      ((checkerboardLattice 8).intermediateCarrierOfDiscriminantSubgroup d8SpinorSubgroup)) :
    h.isIntegral.toIntegralLattice = d8PlusLattice :=
  toIntegralLattice_eq_d8PlusLattice h

theorem mem_d8Plus_carrier_iff (x : Fin 8 → ℚ) :
    x ∈ d8PlusCarrier.1 ↔
      x ∈ (checkerboardLattice 8).carrier ∨
        x - checkerboardSpinor 8 ∈ (checkerboardLattice 8).carrier :=
  mem_d8PlusCarrier_iff x

/-- The subgroup has order two, so the determinant scales from `4` to `1`: `D₈⁺` is unimodular. -/
theorem d8Plus_isUnimodular : d8PlusLattice.IsUnimodular := isUnimodular_d8PlusLattice

/-- The eight glue roots have the `E₈` Cartan matrix as their Gram matrix. -/
theorem form_e8GlueRoot (i j : Fin 8) :
    (checkerboardLattice 8).form (e8GlueRoot i) (e8GlueRoot j) =
      (((CartanMatrix.E 8) i j : ℤ) : ℚ) :=
  form_e8GlueRoot_e8GlueRoot i j

/-- **`D₈⁺ ≅ E₈`**, an actual lattice isometry rather than an inference from determinant one. -/
noncomputable abbrev e8IsometryD8Plus : typeE₈RootLattice.Isometry d8PlusLattice :=
  typeE₈IsometryD8Plus

/-- The general comparison gives `A_{D₈⁺} ≅ H^⊥/H = 0`, agreeing with the direct `E₈`
computation. -/
theorem natCard_orthogonalQuotient_d8Spinor :
    Nat.card (((checkerboardLattice 8).discriminantQuadraticModule
      (isEven_checkerboardLattice 8)).orthogonalQuotient d8SpinorSubgroup
        isIsotropic_d8SpinorSubgroup) = 1 :=
  natCard_orthogonalQuotient_d8SpinorSubgroup

noncomputable abbrev d8PlusDiscriminantEquiv :
    FiniteQuadraticModule.Isometry (d8PlusLattice.discriminantQuadraticModule isEven_d8PlusLattice)
      (typeE₈RootLattice.discriminantQuadraticModule isEven_typeE₈RootLattice) :=
  d8PlusDiscriminantQuadraticIsometry

end ADE

end TauCetiRoadmap.IntegralLattices
