import Mathlib
import TauCeti.LinearAlgebra.RootSystem.DynkinType
import TauCeti.LinearAlgebra.RootSystem.NumberOfRoots

/-!
# Integral lattices, discriminant forms, and overlattices: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below suggest Lean forms for load-bearing milestones, so that
contributors and reviewers can test the representation, quotients, and normalization. Proving every
declaration here would not by itself complete a layer or the roadmap. `sorry` is permitted in this
human-owned roadmap repository: these are targets, not implementations.

The primary carrier is Mathlib's algebraic `Submodule.IsLattice ℚ`; the real-topological
`IsZLattice` API is not used as a replacement. The dual is literally `BilinForm.dualSubmodule`, the
discriminant group below is an actual quotient, and character duals use Mathlib's
`CharacterModule`. The quadratic form is only constructed from an even lattice and uses
`B(x,x) / 2` in `AddCircle (1 : ℚ)`. The ADE section at the end prototypes the bridge against
Tau Ceti's landed `DynkinType` rather than behind a Mathlib-only stand-in. The Markdown roadmap
remains definitive.
-/

namespace TauCetiRoadmap.IntegralLattices

open scoped TensorProduct
open Module

universe u v

/-! ## Lattices with forms and their dual quotients -/

section Lattices

variable (V : Type u) [AddCommGroup V] [Module ℚ V]

/-- An integral symmetric lattice in a rational ambient vector space.  Nondegeneracy is not a
field: see `IntegralLattice.IsNondegenerate` below. -/
structure IntegralLattice where
  carrier : Submodule ℤ V
  [isLattice : carrier.IsLattice ℚ]
  form : LinearMap.BilinForm ℚ V
  isSymm : form.IsSymm
  integral : ∀ x y : carrier, form x y ∈ (1 : Submodule ℤ ℚ)

attribute [instance] IntegralLattice.isLattice

namespace IntegralLattice

variable {V} (L : IntegralLattice V)

/-- Evenness means that every norm lies in `2ℤ`. -/
def IsEven : Prop := ∀ x : L.carrier, ∃ n : ℤ, L.form x x = ((2 * n : ℤ) : ℚ)

/-- Nondegeneracy is a mixin rather than a structure field, so that a degenerate integral symmetric
form, an affine Cartan matrix among them, is a lattice of the same type. -/
class IsNondegenerate : Prop where
  nondegenerate : L.form.Nondegenerate

/-- The radical of the form. -/
abbrev radical : Submodule ℚ V := LinearMap.ker L.form

/-- Nondegeneracy is exactly triviality of the radical. -/
theorem isNondegenerate_iff_radical_eq_bot : L.IsNondegenerate ↔ L.radical = ⊥ := sorry

/-! Definiteness is expressed through Mathlib's indices of inertia, which are available over any
linearly ordered field and so over `ℚ` itself. -/

/-- The positive index of inertia `n₊`. -/
noncomputable abbrev sigPos : ℕ := _root_.sigPos L.form.toQuadraticMap

/-- The negative index of inertia `n₋`. -/
noncomputable abbrev sigNeg : ℕ := _root_.sigNeg L.form.toQuadraticMap

/-- The dimension `n₀` of the radical. -/
noncomputable abbrev sigNull : ℕ := Module.finrank ℚ L.radical

/-- The signature triple `(n₊, n₀, n₋)`. -/
noncomputable abbrev signature : ℕ × ℕ × ℕ := (L.sigPos, L.sigNull, L.sigNeg)

/-- The three indices exhaust the rank; this is `sigPos_add_sigNeg_add_radical`, not a new proof of
Sylvester's law of inertia. -/
theorem sigPos_add_sigNull_add_sigNeg [FiniteDimensional ℚ V] :
    L.sigPos + L.sigNull + L.sigNeg = Module.finrank ℚ V := sorry

/-- Positive-definiteness is a predicate, not part of the lattice structure. -/
abbrev IsPositiveDefinite : Prop := L.form.toQuadraticMap.PosDef

/-- Positive-semidefiniteness admits a radical; it is the affine Cartan matrix case. -/
def IsPositiveSemidefinite : Prop := ∀ x : V, 0 ≤ L.form x x

/-- Negative-definiteness. -/
def IsNegativeDefinite : Prop := ∀ x : V, x ≠ 0 → L.form x x < 0

/-- Negative-semidefiniteness. -/
def IsNegativeSemidefinite : Prop := ∀ x : V, L.form x x ≤ 0

/-- Indefiniteness: vectors of both signs, equivalently `n₊ > 0` and `n₋ > 0`. -/
def IsIndefinite : Prop := (∃ x : V, 0 < L.form x x) ∧ (∃ x : V, L.form x x < 0)

/-- The definite case is the semidefinite case with no radical. -/
theorem isPositiveDefinite_iff [FiniteDimensional ℚ V] :
    L.IsPositiveDefinite ↔ L.IsPositiveSemidefinite ∧ L.IsNondegenerate := sorry

/-- Indefinite is exactly the failure of both semidefiniteness conditions. -/
theorem isIndefinite_iff :
    L.IsIndefinite ↔ ¬ L.IsPositiveSemidefinite ∧ ¬ L.IsNegativeSemidefinite := sorry

/-- Each predicate is visible in the signature. -/
theorem isPositiveSemidefinite_iff_sigNeg_eq_zero [FiniteDimensional ℚ V] :
    L.IsPositiveSemidefinite ↔ L.sigNeg = 0 := sorry

/-- The lattice obtained by quotienting out the radical: this is how a degenerate lattice, such as
one presented by an affine Cartan matrix, reaches the nondegenerate theory below. -/
noncomputable def radicalQuotient : IntegralLattice (V ⧸ L.radical) := sorry

instance : L.radicalQuotient.IsNondegenerate := sorry

/-- The radical quotient keeps the indices of inertia and loses only the radical. -/
theorem signature_radicalQuotient [FiniteDimensional ℚ V] :
    L.radicalQuotient.signature = (L.sigPos, 0, L.sigNeg) := sorry

/-- Evenness descends to the radical quotient. -/
theorem radicalQuotient_isEven (hL : L.IsEven) : L.radicalQuotient.IsEven := sorry

/-- The dual is Mathlib's existing algebraic dual submodule. -/
abbrev dual : Submodule ℤ V := L.form.dualSubmodule L.carrier

/-- Integrality puts the carrier inside its dual. -/
theorem carrier_le_dual : L.carrier ≤ L.dual := by
  intro x hx y hy
  exact L.integral ⟨x, hx⟩ ⟨y, hy⟩

/-- The original carrier, regarded as a submodule of the subtype `L.dual`. -/
def carrierInDual : Submodule ℤ L.dual := L.carrier.comap L.dual.subtype

/-- The actual discriminant-group quotient `L^∨ / L`. -/
abbrev DiscriminantGroup : Type u := L.dual ⧸ L.carrierInDual

/-- The dual of a full lattice is again a full lattice exactly when the form is nondegenerate: this
is where the mixin is load-bearing, since a radical vector spans a rational line inside the dual. -/
theorem dual_isLattice_iff [FiniteDimensional ℚ V] :
    L.dual.IsLattice ℚ ↔ L.IsNondegenerate := sorry

theorem dual_isLattice [L.IsNondegenerate] [FiniteDimensional ℚ V] : L.dual.IsLattice ℚ := sorry

/-- The form identifies the dual lattice with the integral module dual. -/
noncomputable def dualEquivModuleDual [L.IsNondegenerate] :
    L.dual ≃ₗ[ℤ] Module.Dual ℤ L.carrier := sorry

/-- Double duality inside the fixed rational ambient space. -/
theorem dual_dual [L.IsNondegenerate] : L.form.dualSubmodule L.dual = L.carrier := sorry

/-- The discriminant group is finite, and again only in the nondegenerate case. -/
theorem discriminantGroup_finite [L.IsNondegenerate] : Finite L.DiscriminantGroup := sorry

theorem finite_discriminantGroup_iff [FiniteDimensional ℚ V] :
    Finite L.DiscriminantGroup ↔ L.IsNondegenerate := sorry

/-- An integral Gram matrix in a carrier basis. -/
noncomputable def gramMatrix {ι : Type*} [Fintype ι] (e : Basis ι ℤ L.carrier) :
    Matrix ι ι ℤ := sorry

/-- The Gram entries cast back to the values of the rational form. -/
theorem algebraMap_gramMatrix_apply {ι : Type*} [Fintype ι] (e : Basis ι ℤ L.carrier)
    (i j : ι) :
    ((L.gramMatrix e i j : ℤ) : ℚ) = L.form (e i) (e j) := sorry

/-- The signed Gram determinant; its absolute value is the nonnegative discriminant. -/
noncomputable def gramDet {ι : Type*} [Fintype ι] [DecidableEq ι]
    (e : Basis ι ℤ L.carrier) : ℤ :=
  Matrix.det (L.gramMatrix e)

/-- The Gram determinant vanishes exactly in the degenerate case. -/
theorem gramDet_ne_zero_iff {ι : Type*} [Fintype ι] [DecidableEq ι]
    (e : Basis ι ℤ L.carrier) : L.gramDet e ≠ 0 ↔ L.IsNondegenerate := sorry

/-- The order of `L^∨/L` is the absolute, not signed, Gram determinant. -/
theorem natCard_discriminantGroup_eq_natAbs_gramDet [L.IsNondegenerate]
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (e : Basis ι ℤ L.carrier) :
    Nat.card L.DiscriminantGroup = (L.gramDet e).natAbs := sorry

/-- Unimodular means self-dual. -/
def IsUnimodular : Prop := L.carrier = L.dual

/-- Triviality of the discriminant group characterizes unimodularity. -/
theorem unimodular_iff_natCard_discriminantGroup_eq_one [L.IsNondegenerate] :
    L.IsUnimodular ↔ Nat.card L.DiscriminantGroup = 1 := sorry

/-- A Gram determinant has absolute value one exactly for a unimodular lattice. -/
theorem unimodular_iff_natAbs_gramDet_eq_one [L.IsNondegenerate]
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (e : Basis ι ℤ L.carrier) : L.IsUnimodular ↔ (L.gramDet e).natAbs = 1 := sorry

end IntegralLattice

variable {V}

/-- An isometry includes preservation of both the embedded carrier and the form. -/
structure IntegralLattice.Isometry
    {W : Type v} [AddCommGroup W] [Module ℚ W]
    (L : IntegralLattice V) (K : IntegralLattice W) where
  toLinearEquiv : V ≃ₗ[ℚ] W
  map_mem_iff : ∀ x : V, toLinearEquiv x ∈ K.carrier ↔ x ∈ L.carrier
  map_form : ∀ x y : V, K.form (toLinearEquiv x) (toLinearEquiv y) = L.form x y

end Lattices

/-! ## Finite bilinear and quadratic modules -/

/-- A finite symmetric bilinear module with adjoint valued in Mathlib's character module. -/
structure FiniteBilinearModule where
  A : Type u
  [addCommGroup : AddCommGroup A]
  [finite : Finite A]
  pairing : A →+ CharacterModule A
  symmetric : ∀ x y, pairing x y = pairing y x

attribute [instance] FiniteBilinearModule.addCommGroup FiniteBilinearModule.finite

namespace FiniteBilinearModule

/-- Nondegeneracy is deliberately a predicate, since subgroup restrictions can be degenerate. -/
def IsNondegenerate (A : FiniteBilinearModule) : Prop :=
  Function.Bijective A.pairing

/-- Nondegeneracy gives an actual equivalence with the character dual. -/
noncomputable def adjointEquiv (A : FiniteBilinearModule) (hA : A.IsNondegenerate) :
    A.A ≃+ CharacterModule A.A := sorry

/-- The orthogonal complement is available as an explicit subgroup. -/
def orthogonalComplement (A : FiniteBilinearModule) (H : AddSubgroup A.A) :
    AddSubgroup A.A where
  carrier := {x | ∀ y ∈ H, A.pairing x y = 0}
  zero_mem' := sorry
  add_mem' := sorry
  neg_mem' := sorry

/-- Bilinear isotropy means that the pairing vanishes on `H × H`. -/
def IsIsotropic (A : FiniteBilinearModule) (H : AddSubgroup A.A) : Prop :=
  ∀ x ∈ H, ∀ y ∈ H, A.pairing x y = 0

/-- A Lagrangian is an isotropic subgroup equal to its orthogonal complement. -/
def IsLagrangian (A : FiniteBilinearModule) (H : AddSubgroup A.A) : Prop :=
  A.IsIsotropic H ∧ H = A.orthogonalComplement H

/-- The cardinality formula for a subgroup of a nondegenerate finite bilinear module. -/
theorem natCard_mul_natCard_orthogonalComplement (A : FiniteBilinearModule)
    (hA : A.IsNondegenerate) (H : AddSubgroup A.A) :
    Nat.card H * Nat.card (A.orthogonalComplement H) = Nat.card A.A := sorry

/-- The copy of an isotropic `H` inside `H^⊥`. -/
def subgroupInOrthogonal (A : FiniteBilinearModule) (H : AddSubgroup A.A)
    (_hH : A.IsIsotropic H) :
    Submodule ℤ (A.orthogonalComplement H) :=
  (H.comap (A.orthogonalComplement H).subtype).toIntSubmodule

/-- The explicit quotient type `H^⊥/H` used in the gluing theorem. -/
abbrev OrthogonalQuotient (A : FiniteBilinearModule) (H : AddSubgroup A.A)
    (hH : A.IsIsotropic H) : Type u :=
  A.orthogonalComplement H ⧸ A.subgroupInOrthogonal H hH

end FiniteBilinearModule

/-- A quadratic refinement, reusing Mathlib's quadratic-map structure in the half-norm convention. -/
structure FiniteQuadraticModule extends FiniteBilinearModule where
  quadratic : QuadraticMap ℤ A (AddCircle (1 : ℚ))
  polar : ∀ x y, quadratic.polarBilin x y = pairing x y

namespace FiniteQuadraticModule

/-- Nondegeneracy of a quadratic module means nondegeneracy of its polar pairing. -/
def IsNondegenerate (A : FiniteQuadraticModule) : Prop :=
  A.toFiniteBilinearModule.IsNondegenerate

/-- Quadratic isotropy is `q|_H=0`, stronger data than a mere group inclusion. -/
def IsIsotropic (A : FiniteQuadraticModule) (H : AddSubgroup A.A) : Prop :=
  ∀ x ∈ H, A.quadratic x = 0

/-- Isometries preserve the quadratic refinement, hence also its polar form. -/
structure Isometry (A B : FiniteQuadraticModule) where
  toAddEquiv : A.A ≃+ B.A
  map_quadratic : ∀ x, B.quadratic (toAddEquiv x) = A.quadratic x

end FiniteQuadraticModule

/-! ## Discriminant modules -/

section DiscriminantModules

variable {V : Type u} [AddCommGroup V] [Module ℚ V]
variable (L : IntegralLattice V)

variable [L.IsNondegenerate]

/-- The well-defined discriminant pairing as the adjoint into `CharacterModule`. -/
noncomputable def IntegralLattice.discriminantPairing :
    L.DiscriminantGroup →+ CharacterModule L.DiscriminantGroup := sorry

/-- Every nondegenerate integral lattice has a finite nondegenerate discriminant bilinear module. -/
noncomputable def IntegralLattice.discriminantBilinearModule : FiniteBilinearModule where
  A := L.DiscriminantGroup
  addCommGroup := inferInstance
  finite := L.discriminantGroup_finite
  pairing := L.discriminantPairing
  symmetric := sorry

/-- The discriminant pairing is nondegenerate. -/
theorem IntegralLattice.discriminantBilinearModule_isNondegenerate :
    L.discriminantBilinearModule.IsNondegenerate := sorry

/-- Only an even lattice has the half-norm discriminant quadratic form. -/
noncomputable def IntegralLattice.discriminantQuadraticForm (hL : L.IsEven) :
    QuadraticMap ℤ L.DiscriminantGroup (AddCircle (1 : ℚ)) := sorry

/-- On a representative the quadratic form is `B(x,x)/2 mod ℤ`. -/
theorem IntegralLattice.discriminantQuadraticForm_mk (hL : L.IsEven) (x : L.dual) :
    L.discriminantQuadraticForm hL (L.carrierInDual.mkQ x) =
      (↑(L.form x x / (2 : ℚ)) : AddCircle (1 : ℚ)) := sorry

/-- The quadratic discriminant form, with the polar form definitionally visible. -/
noncomputable def IntegralLattice.discriminantQuadraticModule (hL : L.IsEven) :
    FiniteQuadraticModule where
  toFiniteBilinearModule := L.discriminantBilinearModule
  quadratic := L.discriminantQuadraticForm hL
  polar := sorry

/-- The quadratic discriminant module is nondegenerate through its polar pairing. -/
theorem IntegralLattice.discriminantQuadraticModule_isNondegenerate (hL : L.IsEven) :
    (L.discriminantQuadraticModule hL).IsNondegenerate :=
  L.discriminantBilinearModule_isNondegenerate

end DiscriminantModules

/-! ## Intermediate lattices and the `H^⊥/H` theorem -/

section Overlattices

variable {V : Type u} [AddCommGroup V] [Module ℚ V]
variable (L : IntegralLattice V) [L.IsNondegenerate]

/-- An intermediate lattice in the same rational ambient space. -/
structure Overlattice where
  carrier : Submodule ℤ V
  carrier_le : L.carrier ≤ carrier
  le_dual : carrier ≤ L.dual

instance : PartialOrder (Overlattice L) := PartialOrder.lift Overlattice.carrier (by
  intro M N h
  cases M
  cases N
  simp_all)

namespace Overlattice

variable {L} (M : Overlattice L)

def IsIntegral : Prop := ∀ x y : M.carrier, L.form x y ∈ (1 : Submodule ℤ ℚ)

def IsEven : Prop := ∀ x : M.carrier, ∃ n : ℤ, L.form x x = ((2 * n : ℤ) : ℚ)

end Overlattice

/-- The subgroup `M/L ≤ A_L` attached to an intermediate lattice. -/
noncomputable def Overlattice.subgroup (M : Overlattice L) :
    AddSubgroup L.DiscriminantGroup := sorry

/-- The literal inverse image in `L^∨` of a subgroup of `A_L`. -/
def IntegralLattice.preimage (H : AddSubgroup L.DiscriminantGroup) : Submodule ℤ V :=
  (H.toIntSubmodule.comap L.carrierInDual.mkQ).map L.dual.subtype

/-- Intermediate lattices and subgroups are mutually inverse, order-preserving constructions. -/
noncomputable def intermediateOrderIsoSubgroup :
    Overlattice L ≃o AddSubgroup L.DiscriminantGroup := sorry

/-- Integral overlattices correspond to bilinear-isotropic subgroups. -/
noncomputable def integralOverlatticeEquivIsotropicSubgroup :
    {M : Overlattice L // M.IsIntegral} ≃
      {H : AddSubgroup L.DiscriminantGroup //
        L.discriminantBilinearModule.IsIsotropic H} := sorry

/-- Even overlattices correspond to quadratic-isotropic subgroups. -/
noncomputable def evenOverlatticeEquivIsotropicSubgroup (hL : L.IsEven) :
    {M : Overlattice L // M.IsEven} ≃
      {H : AddSubgroup L.DiscriminantGroup //
        (L.discriminantQuadraticModule hL).IsIsotropic H} := sorry

/-- The integral lattice obtained by taking the preimage of a quadratic-isotropic subgroup. -/
noncomputable def IntegralLattice.ofIsotropicSubgroup (hL : L.IsEven)
    (H : AddSubgroup L.DiscriminantGroup)
    (hH : (L.discriminantQuadraticModule hL).IsIsotropic H) : IntegralLattice V where
  carrier := L.preimage H
  isLattice := sorry
  form := L.form
  isSymm := L.isSymm
  integral := sorry

/-- Gluing along an isotropic subgroup keeps the form, hence keeps nondegeneracy. -/
instance IntegralLattice.ofIsotropicSubgroup_isNondegenerate (hL : L.IsEven)
    (H : AddSubgroup L.DiscriminantGroup)
    (hH : (L.discriminantQuadraticModule hL).IsIsotropic H) :
    (L.ofIsotropicSubgroup hL H hH).IsNondegenerate := sorry

/-- The preimage construction is even. -/
theorem IntegralLattice.ofIsotropicSubgroup_isEven (hL : L.IsEven)
    (H : AddSubgroup L.DiscriminantGroup)
    (hH : (L.discriminantQuadraticModule hL).IsIsotropic H) :
    (L.ofIsotropicSubgroup hL H hH).IsEven := sorry

/-- The induced finite quadratic module on `H^⊥/H`. -/
noncomputable def FiniteQuadraticModule.orthogonalQuotient
    (A : FiniteQuadraticModule) (H : AddSubgroup A.A) (hH : A.IsIsotropic H) :
    FiniteQuadraticModule where
  A := A.toFiniteBilinearModule.OrthogonalQuotient H (by
    intro x hx y hy
    rw [← A.polar]
    simp [QuadraticMap.polar, hH x hx, hH y hy, hH (x + y) (H.add_mem hx hy)])
  addCommGroup := inferInstance
  finite := sorry
  pairing := sorry
  symmetric := sorry
  quadratic := sorry
  polar := sorry

/-- Orthogonal reduction preserves nondegeneracy when the ambient polar pairing is nondegenerate. -/
theorem FiniteQuadraticModule.orthogonalQuotient_isNondegenerate
    (A : FiniteQuadraticModule) (hA : A.IsNondegenerate)
    (H : AddSubgroup A.A) (hH : A.IsIsotropic H) :
    (A.orthogonalQuotient H hH).IsNondegenerate := sorry

/-- The discriminant form of the glued lattice is the induced form on `H^⊥/H`. -/
noncomputable def discriminantFormOverlatticeEquiv (hL : L.IsEven)
    (H : AddSubgroup L.DiscriminantGroup)
    (hH : (L.discriminantQuadraticModule hL).IsIsotropic H) :
    FiniteQuadraticModule.Isometry
      ((L.ofIsotropicSubgroup hL H hH).discriminantQuadraticModule
        (L.ofIsotropicSubgroup_isEven hL H hH))
      ((L.discriminantQuadraticModule hL).orthogonalQuotient H hH) := sorry

/-- The glued lattice is unimodular exactly when the isotropic subgroup is Lagrangian. -/
theorem IntegralLattice.ofIsotropicSubgroup_unimodular_iff (hL : L.IsEven)
    (H : AddSubgroup L.DiscriminantGroup)
    (hH : (L.discriminantQuadraticModule hL).IsIsotropic H) :
    (L.ofIsotropicSubgroup hL H hH).IsUnimodular ↔
      H = (L.discriminantBilinearModule.orthogonalComplement H) := sorry

end Overlattices

/-! ## Rank-one normalization test -/

section RankOne

/-- The lattice `⟨2m⟩` on the standard copy of `ℤ` in `ℚ`. -/
noncomputable def rankOne (m : ℤ) (hm : m ≠ 0) : IntegralLattice ℚ := sorry

instance (m : ℤ) (hm : m ≠ 0) : (rankOne m hm).IsNondegenerate := sorry

theorem rankOne_isEven (m : ℤ) (hm : m ≠ 0) : (rankOne m hm).IsEven := sorry

/-- The signature records the sign of `m`, so the negative-definite case is not a special case. -/
theorem rankOne_signature (m : ℤ) (hm : m ≠ 0) :
    (rankOne m hm).signature = if 0 < m then (1, 0, 0) else (0, 0, 1) := sorry

/-- The degenerate rank-one lattice, excluded from `rankOne`, is still an object of the type: its
signature is `(0,1,0)` and its radical quotient is zero. -/
noncomputable def rankOneZero : IntegralLattice ℚ := sorry

theorem rankOneZero_signature : rankOneZero.signature = (0, 1, 0) := sorry

/-- The class of `1/(2m)` in the dual quotient. -/
noncomputable def rankOneGenerator (m : ℤ) (hm : m ≠ 0) :
    (rankOne m hm).dual := sorry

/-- The dual really is `(1/(2m))ℤ`, stated without identifying subtype carriers by coercion. -/
theorem mem_rankOne_dual_iff (m : ℤ) (hm : m ≠ 0) (x : ℚ) :
    x ∈ (rankOne m hm).dual ↔
      ∃ z : ℤ, x = (z : ℚ) / (2 * (m : ℚ)) := sorry

/-- The discriminant quotient, not merely its cardinality, is cyclic of order `|2m|`. -/
noncomputable def rankOneDiscriminantEquivZMod (m : ℤ) (hm : m ≠ 0) :
    (rankOne m hm).DiscriminantGroup ≃+ ZMod (2 * m).natAbs := sorry

/-- The quotient has the expected absolute order for either sign of `m`. -/
theorem natCard_rankOne_discriminantGroup (m : ℤ) (hm : m ≠ 0) :
    Nat.card (rankOne m hm).DiscriminantGroup = (2 * m).natAbs := sorry

/-- The generator has self-pairing `1/(2m) mod ℤ`. -/
theorem rankOne_bilinear_generator (m : ℤ) (hm : m ≠ 0) :
    let L := rankOne m hm
    let g := L.carrierInDual.mkQ (rankOneGenerator m hm)
    L.discriminantPairing g g =
      (↑((1 : ℚ) / (2 * (m : ℚ))) : AddCircle (1 : ℚ)) := sorry

/-- The half-norm convention gives `q(1/(2m)) = 1/(4m) mod ℤ`. -/
theorem rankOne_quadratic_generator (m : ℤ) (hm : m ≠ 0) :
    let L := rankOne m hm
    L.discriminantQuadraticForm (rankOne_isEven m hm)
        (L.carrierInDual.mkQ (rankOneGenerator m hm)) =
      (↑((1 : ℚ) / (4 * (m : ℚ))) : AddCircle (1 : ℚ)) := sorry

/-- On the generator, the polar of the displayed quadratic value is the displayed pairing. -/
theorem rankOne_polar_generator (m : ℤ) (hm : m ≠ 0) :
    let L := rankOne m hm
    let g := L.carrierInDual.mkQ (rankOneGenerator m hm)
    let q := L.discriminantQuadraticForm (rankOne_isEven m hm)
    q (g + g) - q g - q g = L.discriminantPairing g g := sorry

end RankOne

/-! ## Definiteness acceptance tests

These exercise the predicates outside the positive-definite case: an indefinite lattice, and a
degenerate one which is only positive-semidefinite. -/

section Definiteness

/-- The hyperbolic plane `!![0,1;1,0]`: even, unimodular, and indefinite. -/
noncomputable def hyperbolicPlane : IntegralLattice (Fin 2 → ℚ) := sorry

instance : hyperbolicPlane.IsNondegenerate := sorry

theorem hyperbolicPlane_signature : hyperbolicPlane.signature = (1, 0, 1) := sorry

theorem hyperbolicPlane_isEven : hyperbolicPlane.IsEven := sorry

theorem hyperbolicPlane_isUnimodular : hyperbolicPlane.IsUnimodular := sorry

theorem hyperbolicPlane_isIndefinite : hyperbolicPlane.IsIndefinite := sorry

/-- The affine `Ã₁` Gram matrix `!![2,-2;-2,2]`: even, positive-semidefinite, and degenerate.  It is
a lattice of the same type, which is the point of keeping nondegeneracy out of the structure. -/
noncomputable def affineA1 : IntegralLattice (Fin 2 → ℚ) := sorry

theorem affineA1_isEven : affineA1.IsEven := sorry

theorem affineA1_signature : affineA1.signature = (1, 1, 0) := sorry

theorem affineA1_isPositiveSemidefinite : affineA1.IsPositiveSemidefinite := sorry

theorem affineA1_not_isNondegenerate : ¬ affineA1.IsNondegenerate := sorry

/-- Quotienting out the radical of `Ã₁` gives the `A₁` root lattice `⟨2⟩`. -/
noncomputable def affineA1RadicalQuotientIsometry :
    affineA1.radicalQuotient.Isometry (rankOne 1 one_ne_zero) := sorry

end Definiteness

/-! ## The Tau Ceti ADE bridge and the `D₈ ⊂ E₈` acceptance test -/

section ADE

open TauCeti

/-- The valid simply-laced Dynkin types: the input to the root-lattice bridge.  The `B`, `C`, `F`
and `G` names, and the degenerate low-rank `A`/`D` names, are uninhabited here. -/
abbrev SimplyLacedType := {t : DynkinType // t.Valid ∧ t.IsSimplyLaced}

variable (t : SimplyLacedType)

/-- The positive root lattice of a valid simply-laced type, in simple-root coordinates. -/
noncomputable def adeLattice : IntegralLattice (Fin t.1.rank → ℚ) := sorry

/-- A finite-type Cartan matrix is nonsingular, so the root lattice is nondegenerate. -/
instance : (adeLattice t).IsNondegenerate := sorry

/-- The simple-root basis of the carrier, in Tau Ceti's Bourbaki node numbering. -/
noncomputable def adeSimpleBasis : Basis (Fin t.1.rank) ℤ (adeLattice t).carrier := sorry

/-- The theorem that makes this a bridge rather than a lattice which merely has the right rank:
the Gram matrix of the simple roots is the pinned Tau Ceti Cartan matrix. -/
theorem gramMatrix_adeLattice :
    (adeLattice t).gramMatrix (adeSimpleBasis t) = t.1.cartanMatrix := sorry

theorem adeLattice_isEven : (adeLattice t).IsEven := sorry

theorem adeLattice_isPositiveDefinite : (adeLattice t).IsPositiveDefinite := sorry

/-- The norm-two vectors are the roots, and Tau Ceti's `numRoots` counts them. -/
theorem natCard_adeLattice_roots :
    Nat.card {x : (adeLattice t).carrier // (adeLattice t).form x x = 2} = t.1.numRoots := sorry

/-! ### Two table rows, stated against the actual quotient -/

/-- `A_n` has cyclic discriminant group of order `n+1`, generated by the first fundamental
weight. -/
noncomputable def discriminantEquivZMod_A (n : ℕ) (hn : 1 ≤ n) :
    (adeLattice ⟨.A n, DynkinType.valid_A.mpr hn, DynkinType.isSimplyLaced_A n⟩).DiscriminantGroup
      ≃+ ZMod (n + 1) := sorry

/-- `E₈` is self-dual; the discriminant group is trivial. -/
theorem e8_isUnimodular :
    (adeLattice ⟨.E8, DynkinType.valid_E8, DynkinType.isSimplyLaced_E8⟩).IsUnimodular := sorry

/-! ### The `D₈ ⊂ E₈` glue calculation -/

/-- The `D₈` input to the glue calculation. -/
def d8 : SimplyLacedType := ⟨.D 8, by decide, by decide⟩

/-- The `E₈` output of the glue calculation. -/
def e8 : SimplyLacedType := ⟨.E8, by decide, by decide⟩

/-- The class of `s = (1/2)(e₁+⋯+e₈)` in `A_{D₈} ≅ (ℤ/2)²`. -/
noncomputable def d8SpinorClass : (adeLattice d8).DiscriminantGroup := sorry

noncomputable def d8SpinorSubgroup : AddSubgroup (adeLattice d8).DiscriminantGroup :=
  AddSubgroup.closure {d8SpinorClass}

theorem natCard_d8SpinorSubgroup : Nat.card d8SpinorSubgroup = 2 := sorry

/-- `q(s) = 8/8 = 0`, so the subgroup is quadratic-isotropic. -/
theorem d8SpinorClass_quadratic_eq_zero :
    (adeLattice d8).discriminantQuadraticForm (adeLattice_isEven d8) d8SpinorClass = 0 := sorry

theorem d8SpinorSubgroup_isIsotropic :
    ((adeLattice d8).discriminantQuadraticModule (adeLattice_isEven d8)).IsIsotropic
      d8SpinorSubgroup := sorry

/-- `D₈⁺` is produced by the general gluing operation, not by a fresh construction. -/
noncomputable def d8Plus : IntegralLattice (Fin (DynkinType.D 8).rank → ℚ) :=
  (adeLattice d8).ofIsotropicSubgroup (adeLattice_isEven d8) d8SpinorSubgroup
    d8SpinorSubgroup_isIsotropic

instance : d8Plus.IsNondegenerate := sorry

/-- Unimodularity comes from the Lagrangian criterion `H = H^⊥`, which here holds because the
subgroup has order two in a group of order four. -/
theorem d8Plus_isUnimodular : d8Plus.IsUnimodular := sorry

/-- The acceptance test is an actual isometry.  It is emphatically *not* the invalid inference
that any two even unimodular lattices of the same rank are isometric. -/
noncomputable def d8PlusIsometryE8 :
    IntegralLattice.Isometry d8Plus (adeLattice e8) := sorry

/-- The general `H^⊥/H` comparison agrees with the direct `E₈` computation: both are trivial. -/
theorem d8Plus_discriminantGroup_subsingleton :
    Subsingleton d8Plus.DiscriminantGroup := sorry

end ADE

end TauCetiRoadmap.IntegralLattices
