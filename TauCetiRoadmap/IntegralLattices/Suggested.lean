import Mathlib
import TauCeti.FieldTheory.SquareClassGroup
import TauCeti.LinearAlgebra.RootSystem.DynkinType
import TauCeti.LinearAlgebra.RootSystem.NumberOfRoots
import TauCetiRoadmap.QuadraticFormInvariants.Suggested
import TauCetiRoadmap.GlobalQuadraticForms.Suggested
import TauCetiRoadmap.GlobalNumberFields.Suggested
import TauCetiRoadmap.ClassFieldTheory.Suggested
import TauCetiRoadmap.RestrictedProducts.Suggested
import TauCetiRoadmap.OrthogonalSpinGroups.Suggested
import TauCetiRoadmap.LFunctions.Suggested

/-!
# Integral quadratic forms and lattices: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap is in `README.md`: Layers 0 to 9, together with Layer B for binary
lattices, the convention table, the worked examples and the references. Mathlib has quadratic maps over semirings, symmetric
bilinear forms with Gram matrices and base change, `ZLattice` covolumes, Smith normal form
with the index-equals-determinant theorems, and a dual-submodule construction, but no
integral-lattice arithmetic: no even/odd theory, no discriminant groups or forms, no
genus, no local densities, no Nikulin embedding theory, no lattice theta series. We build that
in `TauCeti/`.

The first section retains the reviewed carrier merged in upstream PR #200: a full
`Submodule ℤ V` in a rational ambient space, Mathlib's `dualSubmodule`, an actual quotient
for the discriminant group, and half-norm quadratic forms in `AddCircle (1 : ℚ)`. Abstract
finite-free integral forms and Nikulin's full-norm `ℚ/2ℤ` notation are boundary
dictionaries, not competing public carriers.

The second section checks the exact declarations imported from the seven final supplier
roadmaps. Every name there is one the supplier actually exports in its own accepted scope:
there are no private supplier structures or substitute carriers here, and no `#check` of a
declaration a supplier has said it will not export. Where a supplier's contract is README-only
(the Gaussian theta transformation) the dependency stays a prose
milestone rather than an unconstrained Lean stand-in. Generic Tamagawa normalization, strong
approximation for `Spin`, the orthogonal volume theorem and Cho's smooth affine group scheme
over `ℤ₂` are not README milestones of this
roadmap at all: they belong to the successor `OrthogonalTamagawaAndLatticeMass`, together with
the mass formula and the dyadic local density they assemble (`README.md`, §*Scope*).

The remaining sections pin targets for **Layer 0** (the bilinear and quadratic dictionary,
Gram determinants, the standard examples), **Layer 1** (dual lattices, the
discriminant-group cardinality, unimodularity, integral against even overlattices, the
signature-mod-8 statement), **Layer 2** (finiteness of automorphism groups and of positive
definite classes, the covolume identity, `|O(E₈)| = 696729600`), **Layer 3** (odd-`p`
orthogonal splitting, the dyadic counterexample, the constraint from the product formula),
**Layer 4** (the imported spinor norm of a product of reflections, and the two class-number
finiteness branches this roadmap owns), **Layer 5** (the primitivity
dictionary, the K3-lattice existence shape, and Nikulin's existence and `2`-elementary
predicates written out clause by clause), **Layer 6** (indefinite even unimodular
uniqueness), **Layer 8** (theta convergence, the restriction of the holomorphic theta to
the imaginary axis, the translation law under `T`, and the vector-valued law on discriminant
cosets) and
**Layer 9** (`StoredGenusCertificate`, the object a stored LMFDB lattice
record asserts, and the separate `StoredClassNumberCertificate` that carries completeness).
They elaborate against the Mathlib version this repository builds
against, and they are stated with `sorry`, which is allowed in this human-owned roadmap
library.

The statements whose types do not exist yet stay in `README.md` only. They are the
Conway–Sloane genus symbols of Layer 3 and the adelic double cosets of Layer 4. Nothing here stands in for them, since a `Prop`-valued placeholder
would assert nothing. Layer 9 is different: genus membership and isometry are congruence of
Gram matrices over `ℤ_p` and over `ℤ`, which are expressible now, so the certificate is
written out rather than described.

Two boundaries are enforced by types rather than by prose, because prose has proved not to be
enough. Completeness of a stored class list is not a field of `StoredGenusCertificate`: it is
a theorem of a separate record whose hypothesis field is the imported mass, and there is no
`class_number` beside the semantic columns. And the ring class field of a binary discriminant is
reached only through `binaryRingClassField`, whose type carries `¬ IsSquare Δ`; the split
algebra `ℚ × ℚ` is not a field, so it is the `K` of no `NumberFieldOrder K` and cannot be
supplied to Class Field Theory's `ringClassField` at all.

Conventions follow `README.md`: the rational bilinear form is primary, its restriction to
the carrier is integral, and an abstract integral form enters through rationalization.
Even lattices correspond to `QuadraticForm ℤ L` through `polarBilin` (never through
`associated`, which needs `Invertible (2 : ℤ)`). Statements about bounded norms, minima,
reduction, and theta series are stated for **positive** definite lattices.
-/

namespace TauCetiRoadmap.IntegralLattices

open QuadraticMap MeasureTheory NumberField
open scoped Real

universe u v

/-! ## The reviewed canonical carriers -/

open scoped TensorProduct
open Module

variable (V : Type u) [AddCommGroup V] [Module ℚ V]

/-- The single lattice carrier: a full integral submodule in a rational quadratic space. -/
structure IntegralLattice where
  carrier : Submodule ℤ V
  [isLattice : carrier.IsLattice ℚ]
  form : LinearMap.BilinForm ℚ V
  isSymm : form.IsSymm
  integral : ∀ x y : carrier, form x y ∈ (1 : Submodule ℤ ℚ)

attribute [instance] IntegralLattice.isLattice

namespace IntegralLattice

variable {V} (L : IntegralLattice V)

/-- The rational form restricted to the carrier, with values returned in `ℤ` by the
integrality proof.  This is the form that may be base-changed to `ℤ_[p]`; the rational
form `L.form` itself cannot be base-changed from `ℚ` to `ℤ_[p]`. -/
noncomputable def integralForm : LinearMap.BilinForm ℤ L.carrier := sorry

/-- Restricting `integralForm` and then casting back to `ℚ` recovers the embedded
rational form. -/
theorem algebraMap_integralForm_apply (x y : L.carrier) :
    ((L.integralForm x y : ℤ) : ℚ) = L.form x y := sorry

/-- A form twist changes the bilinear form and keeps the embedded carrier fixed.
⚠ `L` is bound explicitly rather than taken from the section: the body is `sorry` and the type
does not mention `L`, so Lean would drop it and every `L.formTwist a` below would fail. -/
noncomputable def formTwist (L : IntegralLattice V) (a : ℤ) : IntegralLattice V := sorry

/-- Scalar dilation changes a submodule inside the rational ambient space.  It is a
different operation from `formTwist`. -/
noncomputable def scalarDilation (a : ℚ) (M : Submodule ℤ V) : Submodule ℤ V := sorry

/-- Restriction inside the same rational ambient space requires the submodule to remain
full. -/
noncomputable def restrictToFullSubmodule (M : Submodule ℤ V) (hM : M ≤ L.carrier)
    [M.IsLattice ℚ] : IntegralLattice V := sorry

/-- An arbitrary finite-free submodule is instead a lattice in its own rationalization. -/
noncomputable def restrictToRationalSpan (M : Submodule ℤ L.carrier)
    [Module.Free ℤ M] [Module.Finite ℤ M] : IntegralLattice (ℚ ⊗[ℤ] M) := sorry

def IsEven : Prop := ∀ x : L.carrier, ∃ n : ℤ, L.form x x = ((2 * n : ℤ) : ℚ)

class IsNondegenerate : Prop where
  nondegenerate : L.form.Nondegenerate

abbrev radical : Submodule ℚ V := LinearMap.ker L.form

theorem isNondegenerate_iff_radical_eq_bot : L.IsNondegenerate ↔ L.radical = ⊥ := sorry

noncomputable abbrev sigPos : ℕ := _root_.sigPos L.form.toQuadraticMap
noncomputable abbrev sigNeg : ℕ := _root_.sigNeg L.form.toQuadraticMap
noncomputable abbrev sigNull : ℕ := Module.finrank ℚ L.radical
noncomputable abbrev signature : ℕ × ℕ × ℕ := (L.sigPos, L.sigNull, L.sigNeg)

theorem sigPos_add_sigNull_add_sigNeg [FiniteDimensional ℚ V] :
    L.sigPos + L.sigNull + L.sigNeg = Module.finrank ℚ V := sorry

abbrev IsPositiveDefinite : Prop := L.form.toQuadraticMap.PosDef
def IsPositiveSemidefinite : Prop := ∀ x : V, 0 ≤ L.form x x
def IsNegativeDefinite : Prop := ∀ x : V, x ≠ 0 → L.form x x < 0
def IsNegativeSemidefinite : Prop := ∀ x : V, L.form x x ≤ 0
def IsIndefinite : Prop := (∃ x : V, 0 < L.form x x) ∧ (∃ x : V, L.form x x < 0)

theorem isPositiveDefinite_iff [FiniteDimensional ℚ V] :
    L.IsPositiveDefinite ↔ L.IsPositiveSemidefinite ∧ L.IsNondegenerate := sorry

theorem isIndefinite_iff :
    L.IsIndefinite ↔ ¬ L.IsPositiveSemidefinite ∧ ¬ L.IsNegativeSemidefinite := sorry

theorem isPositiveSemidefinite_iff_sigNeg_eq_zero [FiniteDimensional ℚ V] :
    L.IsPositiveSemidefinite ↔ L.sigNeg = 0 := sorry

noncomputable def radicalQuotient : IntegralLattice (V ⧸ L.radical) := sorry
instance : L.radicalQuotient.IsNondegenerate := sorry

theorem signature_radicalQuotient [FiniteDimensional ℚ V] :
    L.radicalQuotient.signature = (L.sigPos, 0, L.sigNeg) := sorry

theorem radicalQuotient_isEven (hL : L.IsEven) : L.radicalQuotient.IsEven := sorry

abbrev dual : Submodule ℤ V := L.form.dualSubmodule L.carrier

/-- The dual of a nonzero form twist is the inverse scalar dilation of the old dual
carrier; it is not a form twist on the unchanged carrier. -/
theorem dual_formTwist (a : ℤ) (ha : a ≠ 0) :
    (L.formTwist a).dual = scalarDilation ((a : ℚ)⁻¹) L.dual := sorry

theorem carrier_le_dual : L.carrier ≤ L.dual := by
  intro x hx y hy
  exact L.integral ⟨x, hx⟩ ⟨y, hy⟩

def carrierInDual : Submodule ℤ L.dual := L.carrier.comap L.dual.subtype
abbrev DiscriminantGroup : Type u := L.dual ⧸ L.carrierInDual

theorem dual_isLattice_iff [FiniteDimensional ℚ V] :
    L.dual.IsLattice ℚ ↔ L.IsNondegenerate := sorry

theorem dual_isLattice [L.IsNondegenerate] [FiniteDimensional ℚ V] :
    L.dual.IsLattice ℚ := sorry

noncomputable def dualEquivModuleDual [L.IsNondegenerate] :
    L.dual ≃ₗ[ℤ] Module.Dual ℤ L.carrier := sorry

theorem dual_dual [L.IsNondegenerate] : L.form.dualSubmodule L.dual = L.carrier := sorry

theorem discriminantGroup_finite [L.IsNondegenerate] : Finite L.DiscriminantGroup := sorry

theorem finite_discriminantGroup_iff [FiniteDimensional ℚ V] :
    Finite L.DiscriminantGroup ↔ L.IsNondegenerate := sorry

noncomputable def gramMatrix {ι : Type*} [Fintype ι] (e : Basis ι ℤ L.carrier) :
    Matrix ι ι ℤ := sorry

theorem algebraMap_gramMatrix_apply {ι : Type*} [Fintype ι] (e : Basis ι ℤ L.carrier)
    (i j : ι) :
    ((L.gramMatrix e i j : ℤ) : ℚ) = L.form (e i) (e j) := sorry

noncomputable def gramDet {ι : Type*} [Fintype ι] [DecidableEq ι]
    (e : Basis ι ℤ L.carrier) : ℤ := Matrix.det (L.gramMatrix e)

theorem gramDet_ne_zero_iff {ι : Type*} [Fintype ι] [DecidableEq ι]
    (e : Basis ι ℤ L.carrier) : L.gramDet e ≠ 0 ↔ L.IsNondegenerate := sorry

theorem natCard_discriminantGroup_eq_natAbs_gramDet [L.IsNondegenerate]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (e : Basis ι ℤ L.carrier) :
    Nat.card L.DiscriminantGroup = (L.gramDet e).natAbs := sorry

def IsUnimodular : Prop := L.carrier = L.dual

theorem unimodular_iff_natCard_discriminantGroup_eq_one [L.IsNondegenerate] :
    L.IsUnimodular ↔ Nat.card L.DiscriminantGroup = 1 := sorry

theorem unimodular_iff_natAbs_gramDet_eq_one [L.IsNondegenerate]
    {ι : Type*} [Fintype ι] [DecidableEq ι]
    (e : Basis ι ℤ L.carrier) : L.IsUnimodular ↔ (L.gramDet e).natAbs = 1 := sorry

end IntegralLattice

variable {V}

/-- An isometry preserves both the embedded carrier and the rational form. -/
structure IntegralLattice.Isometry
    {W : Type v} [AddCommGroup W] [Module ℚ W]
    (L : IntegralLattice V) (K : IntegralLattice W) where
  toLinearEquiv : V ≃ₗ[ℚ] W
  map_mem_iff : ∀ x : V, toLinearEquiv x ∈ K.carrier ↔ x ∈ L.carrier
  map_form : ∀ x y : V, K.form (toLinearEquiv x) (toLinearEquiv y) = L.form x y

/-- When an abstract submodule is full in the original ambient space, restriction in its
own rationalization agrees with same-ambient restriction through the canonical isometry. -/
noncomputable def IntegralLattice.restrictionComparison
    {W : Type v} [AddCommGroup W] [Module ℚ W] (L : IntegralLattice W)
    (M : Submodule ℤ L.carrier) [Module.Free ℤ M] [Module.Finite ℤ M]
    (hM : M.map L.carrier.subtype ≤ L.carrier)
    [(M.map L.carrier.subtype).IsLattice ℚ] :
    IntegralLattice.Isometry (L.restrictToRationalSpan M)
      (L.restrictToFullSubmodule (M.map L.carrier.subtype) hM) := sorry

/-! ### Two pieces of vocabulary the discriminant-form layers need by name

`l(A)` and the character `e^{2πi·}` of `ℚ/ℤ` are used by Layer 1's Gauss-sum invariant, by
Nikulin's boundary conditions in Layer 5, and by the vector-valued theta law of Layer 8. They
are named once here rather than spelled out at each use. -/

/-- **Nikulin's `l(A)`**: the least number of generators of a finite abelian group. This is
real data, not a milestone: the formula *is* the convention being pinned. -/
noncomputable def minGenerators (A : Type*) [AddCommGroup A] : ℕ :=
  sInf {n : ℕ | ∃ s : Finset A, s.card = n ∧ AddSubgroup.closure (s : Set A) = ⊤}

/-- The standard character `e^{2πi·}` of `ℚ/ℤ`. Mathlib's `AddCircle.toCircle` is stated for
`AddCircle (T : ℝ)`, and every discriminant form of this roadmap takes values in
`AddCircle (1 : ℚ)`, so the character is named here on that group. -/
noncomputable def expCircle (x : AddCircle (1 : ℚ)) : ℂ := sorry

/-- The defining property of `expCircle` on a rational representative. This is where the
half-norm convention pays: a discriminant-form value `q_L(x) ∈ ℚ/ℤ` enters the exponent with no
factor of two to insert. -/
theorem expCircle_coe (r : ℚ) :
    expCircle (r : AddCircle (1 : ℚ)) = Complex.exp (2 * (π : ℂ) * Complex.I * (r : ℂ)) := sorry

theorem expCircle_add (x y : AddCircle (1 : ℚ)) :
    expCircle (x + y) = expCircle x * expCircle y := sorry

theorem expCircle_zero : expCircle 0 = 1 := sorry

theorem expCircle_neg (x : AddCircle (1 : ℚ)) : expCircle (-x) = (expCircle x)⁻¹ := sorry

/-- A finite symmetric bilinear module, using Mathlib's character dual. -/
structure FiniteBilinearModule where
  A : Type u
  [addCommGroup : AddCommGroup A]
  [finite : Finite A]
  pairing : A →+ CharacterModule A
  symmetric : ∀ x y, pairing x y = pairing y x

attribute [instance] FiniteBilinearModule.addCommGroup FiniteBilinearModule.finite

namespace FiniteBilinearModule

def IsNondegenerate (A : FiniteBilinearModule) : Prop := Function.Bijective A.pairing

noncomputable def adjointEquiv (A : FiniteBilinearModule) (hA : A.IsNondegenerate) :
    A.A ≃+ CharacterModule A.A := sorry

def orthogonalComplement (A : FiniteBilinearModule) (H : AddSubgroup A.A) : AddSubgroup A.A where
  carrier := {x | ∀ y ∈ H, A.pairing x y = 0}
  zero_mem' := sorry
  add_mem' := sorry
  neg_mem' := sorry

def IsIsotropic (A : FiniteBilinearModule) (H : AddSubgroup A.A) : Prop :=
  ∀ x ∈ H, ∀ y ∈ H, A.pairing x y = 0

def IsLagrangian (A : FiniteBilinearModule) (H : AddSubgroup A.A) : Prop :=
  A.IsIsotropic H ∧ H = A.orthogonalComplement H

theorem natCard_mul_natCard_orthogonalComplement (A : FiniteBilinearModule)
    (hA : A.IsNondegenerate) (H : AddSubgroup A.A) :
    Nat.card H * Nat.card (A.orthogonalComplement H) = Nat.card A.A := sorry

def subgroupInOrthogonal (A : FiniteBilinearModule) (H : AddSubgroup A.A)
    (_hH : A.IsIsotropic H) : Submodule ℤ (A.orthogonalComplement H) := sorry

abbrev OrthogonalQuotient (A : FiniteBilinearModule) (H : AddSubgroup A.A)
    (hH : A.IsIsotropic H) : Type u :=
  A.orthogonalComplement H ⧸ A.subgroupInOrthogonal H hH

end FiniteBilinearModule

/-- The canonical half-norm quadratic refinement. -/
structure FiniteQuadraticModule extends FiniteBilinearModule where
  quadratic : QuadraticMap ℤ A (AddCircle (1 : ℚ))
  polar : ∀ x y, quadratic.polarBilin x y = pairing x y

namespace FiniteQuadraticModule

def IsNondegenerate (A : FiniteQuadraticModule) : Prop :=
  A.toFiniteBilinearModule.IsNondegenerate

def IsIsotropic (A : FiniteQuadraticModule) (H : AddSubgroup A.A) : Prop :=
  ∀ x ∈ H, A.quadratic x = 0

structure Isometry (A B : FiniteQuadraticModule) where
  toAddEquiv : A.A ≃+ B.A
  map_quadratic : ∀ x, B.quadratic (toAddEquiv x) = A.quadratic x

/-- The three families of nondegenerate primary generators in Nikulin's classification. -/
inductive NikulinGenerator where
  | cyclic (p k : ℕ) (hp : p.Prime) (θ : ℤ)
  | evenU (k : ℕ)
  | evenV (k : ℕ)

/-- The finite quadratic module represented by one named generator. -/
noncomputable def NikulinGenerator.toFiniteQuadraticModule
    (g : NikulinGenerator) : FiniteQuadraticModule := sorry

/-- The orthogonal sum represented by a finite list of generators. -/
noncomputable def orthogonalSumNikulinGenerators
    (generators : List NikulinGenerator) : FiniteQuadraticModule := sorry

/-- Concrete classification output: a list of generators together with an actual isometry. -/
structure NikulinDecomposition (A : FiniteQuadraticModule) where
  generators : List NikulinGenerator
  isometry : Isometry A (orthogonalSumNikulinGenerators generators)

/-- Nikulin's generator classification applies to nondegenerate finite quadratic modules.
Restrictions to arbitrary subgroups remain representable by `FiniteQuadraticModule`, but may
not invoke this theorem without a separate nondegeneracy proof. -/
theorem exists_isometry_orthogonalSum_generators
    (A : FiniteQuadraticModule) (hA : A.IsNondegenerate) :
    Nonempty (NikulinDecomposition A) := sorry

/-! ### The invariants Nikulin's boundary conditions are stated in

`l(A_{q_p})`, the Gauss-sum invariant, the square class `discr K(q_p)`, and the dyadic
alternative "`q₂` has a summand `q_θ^{(2)}(2)`" are each named, so that the existence and
uniqueness predicates of Layer 5 can be written clause by clause instead of as a table. -/

/-- The orthogonal sum of two finite quadratic modules. ⚠ The carrier is **data**: leaving the
whole record a `sorry` would make `A` opaque, and then `HasCyclicTwoSummand` below could not be
stated. Only the form fields are milestones. -/
noncomputable def orthogonalSum (A B : FiniteQuadraticModule) : FiniteQuadraticModule where
  A := A.A × B.A
  pairing := sorry
  symmetric := sorry
  quadratic := sorry
  polar := sorry

/-- The `p`-primary component of a finite quadratic module, whose carrier is Mathlib's
`AddCommGroup.primaryComponent`. ⚠ Data again, for the same reason: `minGenerators` and
`HasCyclicTwoSummand` are applied to this carrier. -/
noncomputable def primaryComponent (A : FiniteQuadraticModule) (p : ℕ) :
    FiniteQuadraticModule where
  A := AddCommGroup.primaryComponent A.A p
  pairing := sorry
  symmetric := sorry
  quadratic := sorry
  polar := sorry

/-- **Layer 1G**, the `p`-primary decomposition, in the form Nikulin's `l(A_q) = max_p l(A_{q_p})`
needs: every primary length is at most the total length. -/
theorem minGenerators_primaryComponent_le (A : FiniteQuadraticModule) (p : ℕ) :
    minGenerators (A.primaryComponent p).A ≤ minGenerators A.A := sorry

/-- and the maximum is attained at some prime, so `l(A_q) = max_p l(A_{q_p})` on the nose. -/
theorem exists_minGenerators_primaryComponent_eq (A : FiniteQuadraticModule) :
    ∃ p : ℕ, p.Prime ∧ minGenerators (A.primaryComponent p).A = minGenerators A.A := sorry

/-- **Layer 1H, the Gauss-sum invariant** `sign q ∈ ℤ/8` of a nondegenerate finite quadratic
form. It is `sorry`-bodied because it is defined by the Gauss sum below and nothing here
evaluates it; `gaussSum_eq` is its defining property. -/
noncomputable def gaussSign (A : FiniteQuadraticModule) : ZMod 8 := sorry

/-- **Layer 1H.** The Gauss sum of a nondegenerate finite quadratic module, in the canonical
half-norm convention, where the exponential carries `2πi` and not `πi`. This equation *defines*
`gaussSign`. -/
theorem gaussSum_eq (A : FiniteQuadraticModule) [Fintype A.A] (hA : A.IsNondegenerate) :
    ∑ a : A.A, expCircle (A.quadratic a) =
      (Real.sqrt (Nat.card A.A : ℝ) : ℂ) *
        Complex.exp (2 * (π : ℂ) * Complex.I * (A.gaussSign.val : ℂ) / 8) := sorry

theorem gaussSign_orthogonalSum (A B : FiniteQuadraticModule) :
    (A.orthogonalSum B).gaussSign = A.gaussSign + B.gaussSign := sorry

/-- **Nikulin's `discr K(q_p)`.** `K(q_p)` is a `p`-adic lattice of rank `l(A_{q_p})` whose
discriminant form is the `p`-primary part `q_p`; it exists and is unique up to isometry, by 3C
at odd `p` and by 3D at `p = 2`, and `padicDiscriminant` is its determinant square class in
`ℚ_p^*/(ℚ_p^*)²`. Independence of the chosen `K(q_p)` is part of milestone 5B. -/
noncomputable def padicDiscriminant (A : FiniteQuadraticModule) (p : ℕ) [Fact p.Prime] :
    TauCeti.SquareClassGroup ℚ_[p] := sorry

/-- The rank-0 value, which pins the normalization: when the `p`-primary part is trivial,
`K(q_p)` is the rank-0 lattice and its determinant is the empty product. -/
theorem padicDiscriminant_of_minGenerators_eq_zero (A : FiniteQuadraticModule) (p : ℕ)
    [Fact p.Prime] (h : minGenerators (A.primaryComponent p).A = 0) :
    A.padicDiscriminant p = TauCeti.squareClass (1 : ℚ_[p]ˣ) := sorry

/-- **The dyadic alternative of Nikulin's condition (4)**: `q₂ ≅ q_θ^{(2)}(2) ⊕ q'` for some odd
`θ` and some `q'`. Condition (4) applies exactly when this **fails**, so it has to be a named
predicate and not an unstated side condition. -/
def HasCyclicTwoSummand (A : FiniteQuadraticModule.{u}) : Prop :=
  ∃ (θ : ℤ) (A' : FiniteQuadraticModule.{u}),
    Nonempty (A.Isometry
      (orthogonalSum
        (NikulinGenerator.toFiniteQuadraticModule.{u}
          (NikulinGenerator.cyclic 2 1 Nat.prime_two θ))
        A'))

end FiniteQuadraticModule

section DiscriminantModules

variable {V : Type u} [AddCommGroup V] [Module ℚ V]
variable (L : IntegralLattice V) [L.IsNondegenerate]

noncomputable def IntegralLattice.discriminantPairing :
    L.DiscriminantGroup →+ CharacterModule L.DiscriminantGroup := sorry

/-- ⚠ The carrier is **data**, not a milestone: `A` is `L.DiscriminantGroup` by construction and
the pairing is `discriminantPairing`. Leaving the whole record a `sorry` makes `A` opaque, and
then `AddSubgroup L.DiscriminantGroup` no longer matches `AddSubgroup (…).A`, so the isotropic
and Lagrangian statements of Layer 1 cannot be written at all. Only `symmetric` is a milestone. -/
noncomputable def IntegralLattice.discriminantBilinearModule : FiniteBilinearModule where
  A := L.DiscriminantGroup
  finite := L.discriminantGroup_finite
  pairing := L.discriminantPairing
  symmetric := sorry

theorem IntegralLattice.discriminantBilinearModule_isNondegenerate :
    L.discriminantBilinearModule.IsNondegenerate := sorry

noncomputable def IntegralLattice.discriminantQuadraticForm (hL : L.IsEven) :
    QuadraticMap ℤ L.DiscriminantGroup (AddCircle (1 : ℚ)) := sorry

theorem IntegralLattice.discriminantQuadraticForm_mk (hL : L.IsEven) (x : L.dual) :
    L.discriminantQuadraticForm hL (L.carrierInDual.mkQ x) =
      (↑(L.form x x / (2 : ℚ)) : AddCircle (1 : ℚ)) := sorry

/-- ⚠ Same as `discriminantBilinearModule`: the carrier and the form are data, so that the
half-norm convention of `discriminantQuadraticForm_mk` is the one every consumer sees, and so that
`IsIsotropic` accepts a subgroup of `L.DiscriminantGroup`. Only `polar` is a milestone. -/
noncomputable def IntegralLattice.discriminantQuadraticModule (hL : L.IsEven) :
    FiniteQuadraticModule where
  toFiniteBilinearModule := L.discriminantBilinearModule
  quadratic := L.discriminantQuadraticForm hL
  polar := sorry

theorem IntegralLattice.discriminantQuadraticModule_isNondegenerate (hL : L.IsEven) :
    (L.discriminantQuadraticModule hL).IsNondegenerate :=
  L.discriminantBilinearModule_isNondegenerate

end DiscriminantModules

section Overlattices

variable {V : Type u} [AddCommGroup V] [Module ℚ V]
variable (L : IntegralLattice V) [L.IsNondegenerate]

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

noncomputable def Overlattice.subgroup (M : Overlattice L) :
    AddSubgroup L.DiscriminantGroup := sorry

def IntegralLattice.preimage (H : AddSubgroup L.DiscriminantGroup) : Submodule ℤ V :=
  (H.toIntSubmodule.comap L.carrierInDual.mkQ).map L.dual.subtype

noncomputable def intermediateOrderIsoSubgroup :
    Overlattice L ≃o AddSubgroup L.DiscriminantGroup := sorry

noncomputable def integralOverlatticeEquivIsotropicSubgroup :
    {M : Overlattice L // M.IsIntegral} ≃
      {H : AddSubgroup L.DiscriminantGroup //
        L.discriminantBilinearModule.IsIsotropic H} := sorry

noncomputable def evenOverlatticeEquivIsotropicSubgroup (hL : L.IsEven) :
    {M : Overlattice L // M.IsEven} ≃
      {H : AddSubgroup L.DiscriminantGroup //
        (L.discriminantQuadraticModule hL).IsIsotropic H} := sorry

noncomputable def IntegralLattice.ofIsotropicSubgroup (hL : L.IsEven)
    (H : AddSubgroup L.DiscriminantGroup)
    (hH : (L.discriminantQuadraticModule hL).IsIsotropic H) : IntegralLattice V := sorry

instance IntegralLattice.ofIsotropicSubgroup_isNondegenerate (hL : L.IsEven)
    (H : AddSubgroup L.DiscriminantGroup)
    (hH : (L.discriminantQuadraticModule hL).IsIsotropic H) :
    (L.ofIsotropicSubgroup hL H hH).IsNondegenerate := sorry

theorem IntegralLattice.ofIsotropicSubgroup_isEven (hL : L.IsEven)
    (H : AddSubgroup L.DiscriminantGroup)
    (hH : (L.discriminantQuadraticModule hL).IsIsotropic H) :
    (L.ofIsotropicSubgroup hL H hH).IsEven := sorry

noncomputable def FiniteQuadraticModule.orthogonalQuotient
    (A : FiniteQuadraticModule) (H : AddSubgroup A.A) (hH : A.IsIsotropic H) :
    FiniteQuadraticModule := sorry

theorem FiniteQuadraticModule.orthogonalQuotient_isNondegenerate
    (A : FiniteQuadraticModule) (hA : A.IsNondegenerate)
    (H : AddSubgroup A.A) (hH : A.IsIsotropic H) :
    (A.orthogonalQuotient H hH).IsNondegenerate := sorry

noncomputable def discriminantFormOverlatticeEquiv (hL : L.IsEven)
    (H : AddSubgroup L.DiscriminantGroup)
    (hH : (L.discriminantQuadraticModule hL).IsIsotropic H) :
    FiniteQuadraticModule.Isometry
      ((L.ofIsotropicSubgroup hL H hH).discriminantQuadraticModule
        (L.ofIsotropicSubgroup_isEven hL H hH))
      ((L.discriminantQuadraticModule hL).orthogonalQuotient H hH) := sorry

theorem IntegralLattice.ofIsotropicSubgroup_unimodular_iff (hL : L.IsEven)
    (H : AddSubgroup L.DiscriminantGroup)
    (hH : (L.discriminantQuadraticModule hL).IsIsotropic H) :
    (L.ofIsotropicSubgroup hL H hH).IsUnimodular ↔
      H = L.discriminantBilinearModule.orthogonalComplement H := sorry

end Overlattices

/-! ## Exact supplier checks

These are the Lean-level contracts this file uses directly, and every one of them is a
declaration its supplier exports. The Gaussian theta transformation is
still a README-level milestone in its owning roadmap; no local structure stands in for it.
Generic adelic quotients, Tamagawa normalization, strong approximation for `Spin`, the
orthogonal volume theorem and Cho's smooth affine group scheme over `ℤ₂` are not milestones of
this roadmap: they are
`OrthogonalTamagawaAndLatticeMass`'s, over #246's `TamagawaMeasures`, and nothing here `#check`s
a name #246 or #255 has declined to export. -/

#check QuadraticFormInvariants.hilbertSymbol
#check QuadraticFormInvariants.localHasse
#check QuadraticFormInvariants.hilbertSymbol_productFormula
#check GlobalQuadraticForms.hasseMinkowski_equivalent
#check GlobalQuadraticForms.equivalent_of_locallyEquivalent
#check GlobalNumberFields.NumberFieldOrder
#check GlobalNumberFields.NumberFieldOrder.IsProperFractionalIdeal
#check GlobalNumberFields.NumberFieldOrder.properFractionalIdeals
#check GlobalNumberFields.NumberFieldOrder.invertibleProperFractionalIdeals
#check GlobalNumberFields.NumberFieldOrder.invertible_isProper
#check GlobalNumberFields.NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two
#check GlobalNumberFields.IdealClassMonoid
#check GlobalNumberFields.NumberFieldOrder.mkIdealClassMonoid
#check GlobalNumberFields.picEquivUnitsIdealClassMonoid
#check GlobalNumberFields.Pic
#check GlobalNumberFields.NarrowPic
#check GlobalNumberFields.NumberFieldOrder.narrowToPic
#check GlobalNumberFields.NumberFieldOrder.narrowToPic_surjective
#check ClassFieldTheory.hilbertProductFormula
#check ClassFieldTheory.ringClassField
#check ClassFieldTheory.ringClassArtinMap
#check ClassFieldTheory.gal_ringClassField_equiv_pic
#check RestrictedProducts.RestrictedProductGroup
#check RestrictedProducts.RestrictedProductGroupWithFactor
#check RestrictedProducts.CompactOpenSubgroups
#check RestrictedProducts.integralSubgroup
#check RestrictedProducts.isCompact_integralSubgroup
#check RestrictedProducts.rationalDiagonal
#check OrthogonalSpinGroups.spinorNorm
#check OrthogonalSpinGroups.spinorNorm_reflection
#check OrthogonalSpinGroups.OrthogonalCompactOpens
#check OrthogonalSpinGroups.finiteAdelicOrthogonal
#check OrthogonalSpinGroups.transvection
#check OrthogonalSpinGroups.transvectionLiftHom
#check LFunctions.FEPairWithLevel

section Layer0

variable {L : Type u} [AddCommGroup L] [Module ℤ L] [Module.Free ℤ L] [Module.Finite ℤ L]

/-! ## Layer 0: lattices, the bilinear/quadratic dictionary, Gram determinants -/

/-- **Layer 0, the even-to-quadratic dictionary.** An even symmetric integral bilinear
form is the polar form of a unique integral quadratic form (its values are the
half-norms `β x x / 2`). This is the factor-of-2 bookkeeping done once and for all:
the quadratic form is produced from the companion structure of `QuadraticMap`, never
from `QuadraticMap.associated`, which would demand `Invertible (2 : ℤ)`. -/
example (β : LinearMap.BilinForm ℤ L) (hs : β.IsSymm) (he : ∀ x, 2 ∣ β x x) :
    ∃! Q : QuadraticForm ℤ L, Q.polarBilin = β :=
  sorry

/-- **Layer 0, the quadratic-to-even dictionary.** The polar form of any integral
quadratic form is symmetric and even (`polarBilin Q x x = 2 * Q x`). Together with the
previous target this makes even lattices and integral quadratic forms interchangeable. -/
example (Q : QuadraticForm ℤ L) :
    Q.polarBilin.IsSymm ∧ ∀ x, 2 ∣ Q.polarBilin x x :=
  sorry

/-- **Layer 0, the determinant is well-defined on the nose.** Over ℤ a change of basis
has determinant `±1`, so Gram determinants agree exactly (not merely up to squares, as
over a field). `det L` is then a genuine ℤ-valued invariant of the lattice. -/
example {ι ι' : Type} [Fintype ι] [DecidableEq ι] [Fintype ι'] [DecidableEq ι']
    (β : LinearMap.BilinForm ℤ L) (b : Module.Basis ι ℤ L) (b' : Module.Basis ι' ℤ L) :
    (LinearMap.BilinForm.toMatrix b β).det = (LinearMap.BilinForm.toMatrix b' β).det :=
  sorry

/-- **Layer 0, worked example: E₈.** The E₈ Cartan matrix is the Gram matrix of the
`E₈` lattice: symmetric, even, unimodular. Its determinant is `1`. -/
example : CartanMatrix.E₈.det = 1 :=
  sorry

/-- **Layer 0, worked example: E₈ is even and symmetric** (decidable checks). -/
example : CartanMatrix.E₈.IsSymm ∧ ∀ i, 2 ∣ CartanMatrix.E₈ i i :=
  sorry

/-- **Layer 0, worked example: E₈ is positive definite.** Stated over ℤ directly:
`Matrix.toQuadraticForm'` and `QuadraticMap.PosDef` are `Invertible 2`-free. -/
example : (Matrix.toQuadraticForm' CartanMatrix.E₈).PosDef :=
  sorry

/-- **Layer 0, worked example: the Aₙ root-lattice determinants.** The type-`A` Cartan
matrix (the Gram matrix of the root lattice `Aₙ`) has determinant `n + 1`; its
discriminant group is cyclic of that order (Layer 1). -/
example (n : ℕ) : (CartanMatrix.A n).det = n + 1 :=
  sorry

/-- **Layer 0, worked example: the hyperbolic plane U.** Gram matrix `!![0,1;1,0]`:
even, unimodular, of signature `(1,0,1)`, determinant `−1`. -/
example : (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ).det = -1 :=
  sorry

/-- **Layer 0, positive twists stay positive definite.** `L(a)` is the same module with the
form `a • β`. Positive definiteness is preserved exactly for `a > 0`, which is why the
theta scaling law and the twist statements about masses in Layer 7 carry that hypothesis:
for `a < 0` the twist lands in the negative definite category, and for `a = 0` it is
degenerate. -/
example (β : LinearMap.BilinForm ℤ L) (hpos : (LinearMap.BilinMap.toQuadraticMap β).PosDef)
    {a : ℤ} (ha : 0 < a) :
    (LinearMap.BilinMap.toQuadraticMap (a • β)).PosDef :=
  sorry

end Layer0

section Layer1

/-! ## Layer 1: dual lattices, discriminant groups, overlattices, signature mod 8 -/

variable {ι : Type} [Fintype ι] [DecidableEq ι]
variable {V : Type v} [AddCommGroup V] [Module ℚ V]

/-- **Layer 1, integrality places a lattice inside its dual.** For a lattice realized
as the ℤ-span of a ℚ-basis with integral Gram matrix, `L ≤ L^⋆` where
`L^⋆ = LinearMap.BilinForm.dualSubmodule B L` is Mathlib's dual submodule. -/
example (B : LinearMap.BilinForm ℚ V) (b : Module.Basis ι ℚ V)
    (hint : ∀ i j, B (b i) (b j) ∈ (1 : Submodule ℤ ℚ)) :
    Submodule.span ℤ (Set.range b) ≤ B.dualSubmodule (Submodule.span ℤ (Set.range b)) :=
  sorry

/-- **Layer 1, the discriminant-group cardinality.** The index of a lattice in its dual
is the absolute value of the Gram determinant: `#A_L = |det L|`. The engine is
Mathlib's `AddSubgroup.relIndex_eq_abs_det` combined with
`LinearMap.BilinForm.dualSubmodule_span_of_basis` (the dual lattice is spanned by the
`B`-dual basis). -/
example (B : LinearMap.BilinForm ℚ V) (hB : B.Nondegenerate) (hs : B.IsSymm)
    (b : Module.Basis ι ℚ V) (hint : ∀ i j, B (b i) (b j) ∈ (1 : Submodule ℤ ℚ)) :
    ((Submodule.span ℤ (Set.range b)).toAddSubgroup.relIndex
        (B.dualSubmodule (Submodule.span ℤ (Set.range b))).toAddSubgroup : ℚ)
      = |(LinearMap.BilinForm.toMatrix b B).det| :=
  sorry

/-- **Layer 1, unimodular means self-dual.** A lattice with integral Gram matrix has
Gram determinant `±1` if and only if it equals its dual lattice. -/
example (B : LinearMap.BilinForm ℚ V) (hB : B.Nondegenerate) (hs : B.IsSymm)
    (b : Module.Basis ι ℚ V) (hint : ∀ i j, B (b i) (b j) ∈ (1 : Submodule ℤ ℚ)) :
    ((LinearMap.BilinForm.toMatrix b B).det = 1 ∨ (LinearMap.BilinForm.toMatrix b B).det = -1)
      ↔ B.dualSubmodule (Submodule.span ℤ (Set.range b)) = Submodule.span ℤ (Set.range b) :=
  sorry

/-- **Layer 1, worked example: the discriminant group of A₂ has order 3.** The Gram
matrix `!![2,−1;−1,2]` has determinant `3`; the dual quotient has 3 elements. In the
canonical half-norm convention its generator has `q = 1/3 ∈ ℚ/ℤ`; Nikulin's equivalent
full-norm notation writes this value as `2/3 ∈ ℚ/2ℤ`. -/
example :
    (Submodule.span ℤ (Set.range (Pi.basisFun ℚ (Fin 2)))).toAddSubgroup.relIndex
        ((Matrix.toBilin' ((!![2, -1; -1, 2] : Matrix (Fin 2) (Fin 2) ℤ).map
          (Int.cast : ℤ → ℚ))).dualSubmodule
            (Submodule.span ℤ (Set.range (Pi.basisFun ℚ (Fin 2))))).toAddSubgroup = 3 :=
  sorry

/-- **Layer 1, integral and even overlattices are governed by different conditions.**
Integral overlattices of a nondegenerate integral lattice correspond to subgroups of `A_L`
on which the discriminant *bilinear* form `b_L` vanishes; even overlattices of an even
lattice correspond to subgroups on which the discriminant *quadratic* form `q_L` vanishes.
The second condition is strictly stronger, and this example is the smallest witness: the
even lattice `A₁ ⊕ A₁` with Gram `!![2,0;0,2]` has the glue vector `(e₁+e₂)/2`, which is
isotropic for `b_L` but has `q_L = 1/2 ≠ 0` in `ℚ/ℤ`, so it generates an index-2 integral
overlattice with Gram `!![1,1;1,2]`, which is odd (and in fact unimodular). Conflating the
two correspondences would make this overlattice disappear. -/
example : ∃ P : Matrix (Fin 2) (Fin 2) ℚ,
    |P.det| = 1 / 2 ∧
      P.transpose * (!![2, 0; 0, 2] : Matrix (Fin 2) (Fin 2) ℚ) * P = !![1, 1; 1, 2] :=
  sorry

/-- **Layer 1, even unimodular lattices have signature ≡ 0 mod 8.**
Stated through the Gram matrix and the real signature (Mathlib's `sigPos`/`sigNeg`
of the base-changed form — root-namespace names at this pin). The pinned route is through
the discriminant-form signature: the Gauss-sum invariant of a finite quadratic form, and
Milgram's theorem `t₊ − t₋ ≡ sign q_L (mod 8)` (Nikulin Theorem 1.3.3). For unimodular `L`
the discriminant group is trivial, so the right-hand side is `0`. Serre's *A Course in
Arithmetic* V.2 Theorem 2 with its Corollary 1 is the classical statement. -/
example {n : ℕ} (G : Matrix (Fin n) (Fin n) ℤ) (hs : G.IsSymm) (he : ∀ i, 2 ∣ G i i)
    (hu : G.det = 1 ∨ G.det = -1) :
    (8 : ℤ) ∣ (sigPos (Matrix.toQuadraticForm' (G.map (Int.cast : ℤ → ℝ))) : ℤ)
      - (sigNeg (Matrix.toQuadraticForm' (G.map (Int.cast : ℤ → ℝ))) : ℤ) :=
  sorry

end Layer1

/-! ## Gram-level vocabulary

Isometry, local isometry and genus membership, written out at the level of Gram matrices. They
are expressible at the current Mathlib, they are what a class-number statement quantifies over,
and they are what a stored LMFDB record asserts, so they are named once here and used by
Layers 2, 4 and 9 alike. -/

/-- **Isometry of lattices, at the level of Gram matrices** (2C): integral congruence by a
matrix invertible over `ℤ`. Over `ℤ` this is `det P = ±1`, so `IsUnit P.det` is the whole
condition; positive definiteness is not needed for the definition. -/
def GramIsometric {n : ℕ} (G H : Matrix (Fin n) (Fin n) ℤ) : Prop :=
  ∃ P : Matrix (Fin n) (Fin n) ℤ, IsUnit P.det ∧ P.transpose * G * P = H

/-- **Local isometry at `p`** (3A, 3F): congruence over `ℤ_p`. Writing it by base change of
the Gram matrix is what keeps `p = 2` in scope, exactly as in the convention that localizes
with `LinearMap.BilinForm.baseChange` rather than `QuadraticForm.baseChange`. -/
def GramIsometricAt (p : ℕ) [Fact p.Prime] {n : ℕ} (G H : Matrix (Fin n) (Fin n) ℤ) : Prop :=
  ∃ P : Matrix (Fin n) (Fin n) ℤ_[p], IsUnit P.det ∧
    P.transpose * G.map (Int.cast : ℤ → ℤ_[p]) * P = H.map (Int.cast : ℤ → ℤ_[p])

/-- **Membership in one genus** (3F), written out: congruence over every `ℤ_p` **together with**
the real signature. The genus is defined by both halves and this definition carries both, so
that the indefinite statement of 4E and the positive definite one of 9A are about the same
notion; in the positive definite case the signature clause is implied by definiteness on both
sides, and carrying it is then harmless rather than wrong. -/
def GramSameGenus {n : ℕ} (G H : Matrix (Fin n) (Fin n) ℤ) : Prop :=
  (∀ (p : ℕ) [Fact p.Prime], GramIsometricAt p G H) ∧
    sigPos (Matrix.toQuadraticForm' (G.map (Int.cast : ℤ → ℝ)))
        = sigPos (Matrix.toQuadraticForm' (H.map (Int.cast : ℤ → ℝ))) ∧
      sigNeg (Matrix.toQuadraticForm' (G.map (Int.cast : ℤ → ℝ)))
        = sigNeg (Matrix.toQuadraticForm' (H.map (Int.cast : ℤ → ℝ)))

section Layer2

/-! ## Layer 2: positive definite lattices — automorphisms, reduction, covolume -/

variable {L : Type u} [AddCommGroup L] [Module ℤ L] [Module.Free ℤ L] [Module.Finite ℤ L]

/-- **Layer 2, bounded-norm sets are finite.** For a positive definite lattice, only
finitely many vectors have norm at most `C`. This is what makes minima, shells, kissing
numbers and theta coefficients well defined, and it is **false** for negative definite
lattices, where `β x x` is unbounded below; the negative definite statements are obtained
by applying this one to `−β`. -/
example (β : LinearMap.BilinForm ℤ L) (hpos : (LinearMap.BilinMap.toQuadraticMap β).PosDef)
    (C : ℤ) :
    {x : L | β x x ≤ C}.Finite :=
  sorry

/-- **Layer 2, automorphism groups of definite lattices are finite.** The isometry
group embeds into the permutations of a finite generating set of bounded-norm vectors
(equivalently: discrete ∩ compact in `O(n,ℝ)` after realization). This statement is
invariant under `β ⇝ −β`, so it is proved for positive definite lattices and then holds for
definite ones. Indefinite lattices have infinite isometry groups in rank ≥ 3 (and in rank 2
exactly in the anisotropic Pell case) — hence the definiteness hypothesis. -/
example (β : LinearMap.BilinForm ℤ L) (hpos : (LinearMap.BilinMap.toQuadraticMap β).PosDef) :
    Finite {e : L ≃ₗ[ℤ] L // ∀ x y, β (e x) (e y) = β x y} :=
  sorry

/-- **Layer 2/7, worked example: `|O(E₈)| = 696729600`.** The isometry group of the
`E₈` lattice is the Weyl group `W(E₈)` (reflections in the 240 roots generate, and
`−1 ∈ W(E₈)`), of order `696729600 = 2¹⁴·3⁵·5²·7`. This is the number the mass
formula divides by: the mass of the rank-8 even unimodular genus is `1/696729600`. -/
example : Nat.card {e : (Fin 8 → ℤ) ≃ₗ[ℤ] (Fin 8 → ℤ) //
      ∀ x y, Matrix.toBilin' CartanMatrix.E₈ (e x) (e y)
        = Matrix.toBilin' CartanMatrix.E₈ x y} = 696729600 :=
  sorry

/-- **Layer 2G, reduction-theory finiteness — the first of the three class-number branches, and
one of the two this roadmap owns.** There are finitely many positive
definite integral lattices of given rank and determinant up to isometry: every class
contains a (Minkowski-)reduced Gram matrix, and reduced Gram matrices of bounded
determinant have bounded entries.

⚠ Definiteness is a hypothesis of this theorem and not a convenience. The proof is reduction
theory, it does not extend to indefinite forms, and O'Meara 103:4 — the statement for every
nondegenerate lattice — is **not** what this is. See `finite_genusClasses_rank_two`
for the second branch and the note beside it for the third. -/
theorem finite_classes_of_posDef (n : ℕ) (d : ℤ) :
    ∃ S : Finset (Matrix (Fin n) (Fin n) ℤ), ∀ G : Matrix (Fin n) (Fin n) ℤ,
      G.IsSymm → (Matrix.toQuadraticForm' G).PosDef → G.det = d →
        ∃ H ∈ S, GramIsometric G H :=
  sorry

/-- **Layer 2, the covolume identity.** For a lattice realized in Euclidean space, the
square of the `ZLattice` covolume is the Gram determinant of the dot-product form:
`covolume(L)² = det L`. This reconciles the analytic `ZLattice` covolume (consumed
for Minkowski-type bounds and by Layer 8) with the algebraic determinant, and is where the
`√det`-versus-`det` bookkeeping is fixed once. -/
example {ι : Type} [Fintype ι] [DecidableEq ι] (b : Module.Basis ι ℝ (ι → ℝ)) :
    ZLattice.covolume (Submodule.span ℤ (Set.range b)) ^ 2
      = |(LinearMap.BilinForm.toMatrix b (Matrix.toBilin' 1)).det| :=
  sorry

end Layer2

section Layer3

/-! ## Layer 3: localization and Jordan splittings -/

namespace IntegralLattice

variable {V : Type v} [AddCommGroup V] [Module ℚ V]

/-- The integral localization of the accepted embedded carrier. -/
abbrev LocalCarrier (L : IntegralLattice V) (p : ℕ) [Fact p.Prime] := ℤ_[p] ⊗[ℤ] L.carrier

/-- The integral form on `L` base-changed from `ℤ` to `ℤ_[p]`.  This construction starts
from `L.integralForm`, not from the rational form `L.form`. -/
noncomputable def localIntegralForm (L : IntegralLattice V) (p : ℕ) [Fact p.Prime] :
    LinearMap.BilinForm ℤ_[p] (L.LocalCarrier p) :=
  LinearMap.BilinForm.baseChange ℤ_[p] L.integralForm

/-- The completed rational ambient space, separately base-changed from `ℚ`. -/
abbrev CompletedAmbient (L : IntegralLattice V) (p : ℕ) [Fact p.Prime] := ℚ_[p] ⊗[ℚ] V

/-- The rational form on the completed ambient space. -/
noncomputable def completedRationalForm (L : IntegralLattice V) (p : ℕ) [Fact p.Prime] :
    LinearMap.BilinForm ℚ_[p] (L.CompletedAmbient p) :=
  LinearMap.BilinForm.baseChange ℚ_[p] L.form

/-- The canonical inclusion of the localized integral lattice into the completed rational
quadratic space. -/
noncomputable def localizationToCompletion (L : IntegralLattice V) (p : ℕ)
    [Fact p.Prime] : L.LocalCarrier p →ₗ[ℤ_[p]] L.CompletedAmbient p := sorry

theorem localizationToCompletion_injective (L : IntegralLattice V) (p : ℕ)
    [Fact p.Prime] : Function.Injective (L.localizationToCompletion p) := sorry

/-- The embedded local lattice is full after extending scalars from `ℤ_[p]` to `ℚ_[p]`. -/
theorem span_range_localizationToCompletion (L : IntegralLattice V) (p : ℕ)
    [Fact p.Prime] :
    Submodule.span ℚ_[p] (Set.range (L.localizationToCompletion p)) = ⊤ := sorry

/-- Compatibility between the localized integral form and the restriction of the completed
rational form. -/
theorem completedRationalForm_localizationToCompletion (L : IntegralLattice V) (p : ℕ)
    [Fact p.Prime] (x y : L.LocalCarrier p) :
    L.completedRationalForm p (L.localizationToCompletion p x)
        (L.localizationToCompletion p y) =
      algebraMap ℤ_[p] ℚ_[p] (L.localIntegralForm p x y) := sorry

end IntegralLattice

/-- **Layer 3, odd-`p` orthogonal splitting.** Over `ℤ_p` with `p ≠ 2` every symmetric
bilinear form on a finite free module admits an orthogonal basis; grouping by scale
gives the Jordan splitting (O'Meara §91C; uniqueness of the invariants is 91:9 and
the non-dyadic classification 92:2).  This target is now constructed from the accepted
`IntegralLattice` carrier through `integralForm` and `localIntegralForm`; it does not start
with an unrelated local form. -/
example {p : ℕ} [Fact p.Prime] (hp : p ≠ 2)
    {V : Type v} [AddCommGroup V] [Module ℚ V] (L : IntegralLattice V) :
    ∃ (ι : Type) (_ : Fintype ι)
      (b : Module.Basis ι ℤ_[p] (L.LocalCarrier p)),
        (L.localIntegralForm p).iIsOrtho b :=
  sorry

/-- **Layer 3, the dyadic trap, as a theorem.** Over `ℤ_2` orthogonal splitting fails:
the hyperbolic plane `U` is *not* diagonalizable (its unimodular even structure
survives 2-adically). Diagonal invariants do not exist at `p = 2`; the dyadic theory
runs on Jordan splittings with non-unique invariants and on the Conway–Sloane 2-adic
symbol calculus (README Layer 3). -/
example : ¬ ∃ b : Module.Basis (Fin 2) ℤ_[2] (Fin 2 → ℤ_[2]),
    (Matrix.toBilin' ((!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ).map
      (Int.cast : ℤ → ℤ_[2]))).iIsOrtho b :=
  sorry

/-- **Layer 3G, the constraint on genus symbols.** QFI identifies its local
norm-equation/quaternion symbol with CFT's cohomological symbol and exports this sign form of
Hilbert reciprocity. The oddity formula and sign-product conditions specialize this exact
supplier theorem; there is no local Hilbert-symbol package. -/
example (a b : ℚˣ) :
    (∏ v ∈ ClassFieldTheory.finiteHilbertSupport ℚ a b,
        QuadraticFormInvariants.hilbertSign
          (ClassFieldTheory.finiteHilbertInvariantAt ℚ v a b)) *
      ∏ w : InfinitePlace ℚ,
        QuadraticFormInvariants.hilbertSign
          (ClassFieldTheory.infiniteHilbertInvariantAt ℚ w a b) = 1 :=
  QuadraticFormInvariants.hilbertSymbol_productFormula ℚ a b

end Layer3

section Layer4

/-! ## Layer 4: the spinor norm of a lattice stabilizer -/

variable {K : Type u} [Field K] [Invertible (2 : K)]
variable {V : Type v} [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- **Layer 4C, against the imported OSG declarations.** The spinor norm is a homomorphism,
so its value on a product of two reflections is the product of the square classes of the two
norms. Layer 4C applies this to reflections generating the stabilizer `K_p⁺(L)` and reads the
answer off the Jordan data of Layer 3. -/
example (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    {v w : V} (hv : Q v ≠ 0) (hw : Q w ≠ 0) (u u' : Kˣ)
    (hu : (u : K) = Q v) (hu' : (u' : K) = Q w) :
    OrthogonalSpinGroups.spinorNorm Q hQ
        (⟨OrthogonalSpinGroups.reflection Q hv,
            OrthogonalSpinGroups.reflection_mem Q hv⟩ *
          ⟨OrthogonalSpinGroups.reflection Q hw,
            OrthogonalSpinGroups.reflection_mem Q hw⟩) =
      QuotientGroup.mk' (Subgroup.square Kˣ) (u * u') :=
  sorry

/-! ### The class-number finiteness branches

There are three, with three unrelated proofs, and this roadmap owns two. Nothing here is a
`finite_genusClassSet` covering all of them: such a statement would silently claim the third.
The definite branch is `finite_classes_of_posDef` in Layer 2, proved by reduction. The rank-2
branch is below, proved through ideal classes.

⚠ **The third branch is not stated in this file and must not be added to it.** For an
indefinite nondegenerate lattice of rank at least 3 the class number is finite because Eichler's
theorem identifies proper classes with proper spinor genera and 4C counts the latter; that runs
through strong approximation for `Spin`, which no supplier in this portfolio exports. It is
`OrthogonalTamagawaAndLatticeMass`'s 4D together with the rank-`≥ 3` half of 4E
(`README.md`, §*Scope*). A contributor who wants one theorem covering every rank is being asked
for the successor's, not for a generalization of either theorem here. -/

/-- **Layer 4E, rank 2 — the second of the three class-number branches, and the other one this
roadmap owns.** For a nondegenerate binary lattice the classes in a genus inject into the
invertible proper ideal classes of the quadratic order `𝒪(L)` of B1, by the dictionary of B2,
and that group is the consumed `Pic 𝒪_Δ` for `Δ < 0` and `NarrowPic 𝒪_Δ` for `Δ > 0`, both
finite by `GlobalNumberFields.finite_pic` and `finite_narrowPic`. In the square-discriminant
branch B5 counts the split classes directly.

⚠ Rank 2 is stated separately because the rank-`≥ 3` proof does not cover it and this proof does
not extend: the argument is the arithmetic of a quadratic order, and it stops as soon as the
norm form is no longer binary. The name says `rank_two` and not `indefinite_rank_two` because
indefiniteness is not a hypothesis: the ideal-class proof covers definite binary lattices too,
where it agrees with `finite_classes_of_posDef`. It is 4E's rank-2 half that this discharges,
and 4E's rank-`≥ 3` half is the successor's. -/
theorem finite_genusClasses_rank_two (G : Matrix (Fin 2) (Fin 2) ℤ)
    (hs : G.IsSymm) (hd : G.det ≠ 0) :
    ∃ S : Finset (Matrix (Fin 2) (Fin 2) ℤ), ∀ H : Matrix (Fin 2) (Fin 2) ℤ,
      H.IsSymm → GramSameGenus G H → ∃ H' ∈ S, GramIsometric H' H :=
  sorry

end Layer4

section Layer5

/-! ## Layer 5: primitive embeddings (the entry point to Nikulin's theory) -/

variable {L M : Type u}
variable [AddCommGroup L] [Module ℤ L] [Module.Free ℤ L] [Module.Finite ℤ L]
variable [AddCommGroup M] [Module ℤ M] [Module.Free ℤ M] [Module.Finite ℤ M]

/-- **Layer 5, the primitivity dictionary.** An embedding of finite free ℤ-modules is
*primitive* when its cokernel is torsion-free; over ℤ this is equivalent to the image
being a direct summand. Every statement of Nikulin's embedding theory quantifies over
primitive embeddings, so this dictionary is stated first. -/
example (f : L →ₗ[ℤ] M) (hf : Function.Injective f) :
    (∀ x : M ⧸ LinearMap.range f, ∀ n : ℤ, n ≠ 0 → n • x = 0 → x = 0)
      ↔ ∃ N : Submodule ℤ M, IsCompl (LinearMap.range f) N :=
  sorry

/-- **Layer 5/6, worked example: the K3 lattice exists.** There is an even unimodular
lattice of signature `(3, 19)` — concretely `U³ ⊕ E₈(−1)²`, the Gram matrix being the
block sum of three hyperbolic planes and two negated `E₈` matrices, of determinant
`−1`. Uniqueness is the indefinite even unimodular classification (Layer 6). -/
example : ∃ G : Matrix (Fin 22) (Fin 22) ℤ, G.IsSymm ∧ (∀ i, 2 ∣ G i i) ∧ G.det = -1 ∧
    sigPos (Matrix.toQuadraticForm' (G.map (Int.cast : ℤ → ℝ))) = 3 ∧
    sigNeg (Matrix.toQuadraticForm' (G.map (Int.cast : ℤ → ℝ))) = 19 :=
  sorry

end Layer5

section Layer5Nikulin

/-! ## Layer 5B and 5J: Nikulin's boundary predicates, clause by clause

These are the highest-risk statements of the roadmap, and they are typed here rather than left
as tables in `README.md`. Each condition of Nikulin Theorem 1.10.1 and of Theorem 3.6.2 is one
field, with its own hypothesis visible in its own type, and each existence theorem is stated as
a literal `↔`.

⚠ A single field named `localConditions`, or any packaging that hides which clause applies at
which prime and at which boundary, is an explicit **rejection test**. The whole point of the
source audit behind Layer 5 is that one omitted boundary clause produces a statement that is
not Nikulin's theorem and that no reviewer of the proof would catch. -/

/-- **Nikulin Theorem 1.10.1, the four conditions.** An even lattice with invariants
`(t₊, t₋, q)` exists exactly when these hold. Conditions 3 and 4 are the boundary conditions:
they apply only at the equality `t₊ + t₋ = l(A_{q_p})`, condition 4 additionally switches off
when `q₂` has a summand `q_θ^{(2)}(2)`, and the two determinant clauses differ — condition 3
carries the sign `(−1)^{t₋}` while condition 4 allows either sign. -/
structure NikulinExistenceConditions (tp tm : ℕ) (q : FiniteQuadraticModule) : Prop where
  /-- (1) The signature is congruent to the Gauss-sum invariant mod 8. -/
  signature_congr : (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = q.gaussSign
  /-- (2) The rank is at least `l(A_q)`. Nikulin's `t₊ ≥ 0` and `t₋ ≥ 0` are carried by `ℕ`. -/
  minGenerators_le : minGenerators q.A ≤ tp + tm
  /-- (3) At every **odd** prime where the rank meets `l(A_{q_p})` exactly, the determinant
  square class is pinned, with the sign `(−1)^{t₋}`. The existential says both that the number
  is a `p`-adic unit — which it is, because `v_p(det K(q_p)) = v_p(|A_q|)` — and that its square
  class is `discr K(q_p)`. -/
  odd_boundary : ∀ (p : ℕ) [Fact p.Prime], p ≠ 2 →
    tp + tm = minGenerators (q.primaryComponent p).A →
    ∃ u : ℚ_[p]ˣ, (u : ℚ_[p]) = (((-1) ^ tm * (Nat.card q.A : ℤ) : ℤ) : ℚ_[p]) ∧
      TauCeti.squareClass u = q.padicDiscriminant p
  /-- (4) The dyadic clause. It applies only when the rank meets `l(A_{q₂})` exactly **and**
  `q₂` has no summand `q_θ^{(2)}(2)`, and then `|A_q|` matches `discr K(q₂)` up to a sign that
  is not fixed. -/
  dyadic_boundary :
    tp + tm = minGenerators (q.primaryComponent 2).A →
    ¬ (q.primaryComponent 2).HasCyclicTwoSummand →
    ∃ (ε : ℤ) (u : ℚ_[2]ˣ), (ε = 1 ∨ ε = -1) ∧
      (u : ℚ_[2]) = ((ε * (Nat.card q.A : ℤ) : ℤ) : ℚ_[2]) ∧
        TauCeti.squareClass u = q.padicDiscriminant 2

/-- **The left-hand side of 5B**: an even lattice with invariants `(t₊, t₋, q)` exists. It is
nondegenerate and even, its signature triple is `(t₊, 0, t₋)`, and its discriminant quadratic
module — in the half-norm `ℚ/ℤ` convention of `README.md`, not Nikulin's `ℚ/2ℤ` one — is
isometric to `q`. The ambient space has the right dimension, so no rank hypothesis is
implicit. -/
def EvenLatticeWithInvariants (tp tm : ℕ) (q : FiniteQuadraticModule) : Prop :=
  ∃ (L : IntegralLattice (Fin (tp + tm) → ℚ)) (hnd : L.IsNondegenerate) (hev : L.IsEven),
    L.signature = (tp, 0, tm) ∧
      Nonempty ((@IntegralLattice.discriminantQuadraticModule _ _ _ L hnd hev).Isometry q)

/-- **Layer 5B, Nikulin Theorem 1.10.1, as a literal necessary-and-sufficient statement.**
Nondegeneracy of `q` is a hypothesis: the generator classification, the Gauss-sum invariant and
`discr K(q_p)` are all stated for nondegenerate finite quadratic forms only. -/
theorem exists_evenLattice_iff (tp tm : ℕ) (q : FiniteQuadraticModule)
    (hq : q.IsNondegenerate) :
    EvenLatticeWithInvariants tp tm q ↔ NikulinExistenceConditions tp tm q :=
  sorry

/-- **Layer 5B, Nikulin Corollary 1.10.2**, the sufficient form under the *strict* inequality.
⚠ This is not a restatement of `exists_evenLattice_iff`, and it does not replace it: the strict
inequality is what makes conditions 3 and 4 vacuous, and at equality they are exactly what
decides existence. -/
theorem exists_evenLattice_of_lt (tp tm : ℕ) (q : FiniteQuadraticModule)
    (hq : q.IsNondegenerate)
    (hsign : (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = q.gaussSign)
    (hrank : minGenerators q.A < tp + tm) :
    EvenLatticeWithInvariants tp tm q :=
  sorry

/-- **Nikulin Theorem 3.6.2, the seven conditions** for an even `2`-elementary lattice with
invariants `(δ_S; t₊, t₋, a)`. Conditions 4 to 7 are boundary clauses at `a = 0`, `a = 1`,
`a = 2` and `a = t₊ + t₋`, and none of them follows from the ones before it; `README.md`
records a witness tuple for each. -/
structure TwoElementaryAdmissible (δ : ZMod 2) (tp tm a : ℕ) : Prop where
  /-- (1) `a ≤ t₊ + t₋`. -/
  le_rank : a ≤ tp + tm
  /-- (2) `t₊ + t₋ + a ≡ 0 (mod 2)`. -/
  parity : ((tp + tm + a : ℕ) : ZMod 2) = 0
  /-- (3) `t₊ − t₋ ≡ 0 (mod 4)` when `δ_S = 0`. -/
  four_of_delta_zero : δ = 0 → (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 4) = 0
  /-- (4) `δ_S = 0` and `t₊ − t₋ ≡ 0 (mod 8)` when `a = 0`, which is 1I for a unimodular
  lattice. -/
  unimodular_of_a_zero : a = 0 → δ = 0 ∧ (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = 0
  /-- (5) `t₊ − t₋ ≡ ±1 (mod 8)` when `a = 1`. -/
  pm_one_of_a_one : a = 1 →
    (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = 1 ∨ (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = -1
  /-- (6) `δ_S = 0` when `a = 2` and `t₊ − t₋ ≡ 4 (mod 8)`. -/
  delta_zero_of_a_two : a = 2 → (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = 4 → δ = 0
  /-- (7) `t₊ − t₋ ≡ 0 (mod 8)` when `δ_S = 0` and `a = t₊ + t₋`. -/
  eight_of_a_eq_rank : δ = 0 → a = tp + tm → (((tp : ℤ) - (tm : ℤ) : ℤ) : ZMod 8) = 0

/-- **The left-hand side of 5J**: an even `2`-elementary lattice with invariants
`(δ_S; t₊, t₋, a)` exists. `2`-elementary is `A_S ≅ (ℤ/2)^a` as an actual additive equivalence,
and `δ_S = 0` is the statement that the half-norm discriminant form takes values in
`½ℤ/ℤ` — equivalently that `q_S` has no `q_θ^{(2)}(2)` summand, which is where Nikulin's
full-norm `ℚ/2ℤ` convention would put integrality. Nondegeneracy is asserted by the second
binder even though the half-norm form of 1D is defined without it. -/
def TwoElementaryLatticeWithInvariants (δ : ZMod 2) (tp tm a : ℕ) : Prop :=
  ∃ (L : IntegralLattice (Fin (tp + tm) → ℚ)) (_hnd : L.IsNondegenerate) (hev : L.IsEven),
    L.signature = (tp, 0, tm) ∧
      Nonempty (L.DiscriminantGroup ≃+ (Fin a → ZMod 2)) ∧
        (δ = 0 ↔ ∀ x : L.DiscriminantGroup,
          L.discriminantQuadraticForm hev x + L.discriminantQuadraticForm hev x = 0)

/-- **Layer 5J, Nikulin Theorem 3.6.2, as a literal necessary-and-sufficient statement.** -/
theorem exists_twoElementaryLattice_iff (δ : ZMod 2) (tp tm a : ℕ) :
    TwoElementaryLatticeWithInvariants δ tp tm a ↔ TwoElementaryAdmissible δ tp tm a :=
  sorry

/-- **Layer 5J, the four independence witnesses.** Each tuple satisfies every condition before
the named one and fails that one, so no clause of `TwoElementaryAdmissible` is implied by its
predecessors. These are decidable arithmetic checks, and they are what stops a contributor from
dropping a clause. -/
theorem twoElementaryAdmissible_independence :
    ¬ TwoElementaryAdmissible 0 4 0 0 ∧ ¬ TwoElementaryAdmissible 1 3 0 1 ∧
      ¬ TwoElementaryAdmissible 1 4 0 2 ∧ ¬ TwoElementaryAdmissible 0 4 0 4 :=
  sorry

end Layer5Nikulin

section Layer6

/-! ## Layer 6: unimodular lattices in low rank -/

/-- **Layer 6, indefinite even unimodular uniqueness (shape).** Two even unimodular
integral lattices that are indefinite with equal signatures are isometric
(`II_{t₊,t₋} ≅ U^{min(t₊,t₋)} ⊕ E₈(±1)^{|t₊−t₋|/8}`; Serre V.2.2, Milnor–Husemoller
II §5; via Nikulin Corollary 1.13.3 in the discriminant-form route). The definite
analogue is false from rank 16 on (`E₈²` vs `D₁₆⁺`). -/
example {n : ℕ} (G₁ G₂ : Matrix (Fin n) (Fin n) ℤ)
    (h₁s : G₁.IsSymm) (h₂s : G₂.IsSymm)
    (h₁e : ∀ i, 2 ∣ G₁ i i) (h₂e : ∀ i, 2 ∣ G₂ i i)
    (h₁u : G₁.det = 1 ∨ G₁.det = -1) (h₂u : G₂.det = 1 ∨ G₂.det = -1)
    (hp : sigPos (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ)))
        = sigPos (Matrix.toQuadraticForm' (G₂.map (Int.cast : ℤ → ℝ))))
    (hn : sigNeg (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ)))
        = sigNeg (Matrix.toQuadraticForm' (G₂.map (Int.cast : ℤ → ℝ))))
    (hindef : 0 < sigPos (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ))) ∧
        0 < sigNeg (Matrix.toQuadraticForm' (G₁.map (Int.cast : ℤ → ℝ)))) :
    (Matrix.toBilin' G₁).Equivalent (Matrix.toBilin' G₂) :=
  sorry

end Layer6

section Layer8

/-! ## Layer 8: the arithmetic theta series

L-functions owns the general real-parameter Gaussian transformation and Poisson summation.
Its generic lattice-level transformation is currently a README milestone, so this file does not
invent a carrier or interface for it. The definitions below are the arithmetic objects owned by
Integral Lattices; the README states the exact imported milestone used to prove their
transformation law. -/

variable {L : Type u} [AddCommGroup L] [Module ℤ L] [Module.Free ℤ L] [Module.Finite ℤ L]

/-- **Layer 8A, real-parameter arithmetic theta.** -/
noncomputable def realTheta (β : LinearMap.BilinForm ℤ L) (t : ℝ) : ℝ :=
  ∑' x : L, Real.exp (-π * t * ((β x x : ℤ) : ℝ))

/-- **Layer 8A, holomorphic arithmetic theta** on the upper half-plane. -/
noncomputable def theta (β : LinearMap.BilinForm ℤ L) (τ : ℂ) : ℂ :=
  ∑' x : L, Complex.exp ((π : ℂ) * Complex.I * τ * (β x x : ℤ))

/-- **Layer 8B, convergence.** For a positive definite integral
lattice the theta sum `∑_{x ∈ L} exp(−π t · β(x,x))` converges for every `t > 0` — the
summability behind `Θ_L(τ) = ∑ exp(πiτ·β(x,x))` on the upper half-plane. Mathlib's
`jacobiTheta` is exactly `Θ_ℤ` in this normalization (the rank-1 reconciliation is a worked
example in `README.md`). Positive definiteness is essential. -/
example (β : LinearMap.BilinForm ℤ L) (hpos : (LinearMap.BilinMap.toQuadraticMap β).PosDef)
    {t : ℝ} (ht : 0 < t) :
    Summable fun x : L => Real.exp (-π * t * ((β x x : ℤ) : ℝ)) :=
  sorry

/-- **Layer 8A, the two arithmetic thetas agree on the imaginary axis.** This is the bridge
from L-functions' real-parameter Gaussian theorem to the upper-half-plane law owned here. -/
example (β : LinearMap.BilinForm ℤ L) {t : ℝ} (ht : 0 < t) :
    theta β (t * Complex.I) = (realTheta β t : ℂ) :=
  sorry

/-- **Layer 8B, holomorphy** on the upper half-plane. Together with the previous bridge and
L-functions' Gaussian transformation, the identity theorem gives Layer 8E. -/
theorem differentiableOn_theta (β : LinearMap.BilinForm ℤ L) :
    DifferentiableOn ℂ (theta β) {τ : ℂ | 0 < τ.im} :=
  sorry

/-- **Layer 8F, the translation law under `T`.** With the nome `q = e^{πiτ}` fixed in the
conventions, integrality of `β` already gives period 2. -/
theorem theta_add_two (β : LinearMap.BilinForm ℤ L) (τ : ℂ) :
    theta β (τ + 2) = theta β τ :=
  sorry

/-- **Layer 8F, the even case**: period 1, because every norm is even. -/
theorem theta_add_one_of_even (β : LinearMap.BilinForm ℤ L) (he : ∀ x, 2 ∣ β x x) (τ : ℂ) :
    theta β (τ + 1) = theta β τ :=
  sorry

/-- **Layer 8F, the rejection test.** The parity hypothesis on `theta_add_one_of_even` is not
decoration: `Θ_ℤ` is the odd unimodular rank-one series, its `q`-expansion has nonzero
coefficients in odd degrees, and `jacobiTheta` is periodic with period 2 and not 1. -/
theorem exists_theta_add_one_ne :
    ∃ τ : ℂ, 0 < τ.im ∧
      theta (Matrix.toBilin' (1 : Matrix (Fin 1) (Fin 1) ℤ)) (τ + 1)
        ≠ theta (Matrix.toBilin' (1 : Matrix (Fin 1) (Fin 1) ℤ)) τ :=
  sorry

end Layer8

section Layer8VectorValued

/-! ## Layer 8E and 8G: the exported transformation law

⚠ **These theorems are a transformation law and nothing more.** No declaration here is called
`isModularForm`, none takes values in a space of modular forms, and none may be renamed to one
before a half-integral-weight modular-forms carrier and a cusp-holomorphy theorem are imported.
`README.md`, §*Scope*, records that neither has an owner. -/

variable {V : Type v} [AddCommGroup V] [Module ℚ V]

namespace IntegralLattice

/-- **Layer 8A**, the theta series of the lattice itself, on the embedded carrier. -/
noncomputable def latticeTheta (L : IntegralLattice V) (τ : ℂ) : ℂ :=
  ∑' x : L.carrier, Complex.exp ((π : ℂ) * Complex.I * τ * ((L.form (x : V) (x : V) : ℚ) : ℂ))

/-- **Layer 8A**, the theta series of the dual lattice. Its form is rational-valued, so this is
an instance of the analytic theta and not of the arithmetic one. -/
noncomputable def dualTheta (L : IntegralLattice V) (τ : ℂ) : ℂ :=
  ∑' x : L.dual, Complex.exp ((π : ℂ) * Complex.I * τ * ((L.form (x : V) (x : V) : ℚ) : ℂ))

/-- **Layer 8G**, the theta series of the coset of `L` in `L^⋆` labelled by `μ ∈ A_L`. -/
noncomputable def cosetTheta (L : IntegralLattice V) (μ : L.DiscriminantGroup) (τ : ℂ) : ℂ :=
  ∑' x : {x : L.dual // L.carrierInDual.mkQ x = μ},
    Complex.exp ((π : ℂ) * Complex.I * τ * ((L.form (x.1 : V) (x.1 : V) : ℚ) : ℂ))

theorem cosetTheta_zero (L : IntegralLattice V) (τ : ℂ) :
    L.cosetTheta 0 τ = L.latticeTheta τ := sorry

theorem sum_cosetTheta (L : IntegralLattice V) [Fintype L.DiscriminantGroup] (τ : ℂ) :
    ∑ ν : L.DiscriminantGroup, L.cosetTheta ν τ = L.dualTheta τ := sorry

theorem cosetTheta_neg (L : IntegralLattice V) (μ : L.DiscriminantGroup) (τ : ℂ) :
    L.cosetTheta (-μ) τ = L.cosetTheta μ τ := sorry

/-- **Layer 8E, the exported transformation law under `S`.** For a positive definite lattice,

    Θ_L(−1/τ) = (τ/i)^{n/2} (det L)^{−1/2} Θ_{L^⋆}(τ).

The branch of `(τ/i)^{n/2}` is `Complex.cpow` on the principal branch, which is correct because
`τ/i` has positive real part on the upper half-plane, and the square root is the positive real
one, which exists because a positive definite lattice has `det L > 0`. -/
theorem latticeTheta_neg_inv (L : IntegralLattice V) [L.IsNondegenerate]
    (hpos : L.IsPositiveDefinite) {ι : Type} [Fintype ι] [DecidableEq ι]
    (e : Basis ι ℤ L.carrier) {τ : ℂ} (hτ : 0 < τ.im) :
    L.latticeTheta (-1 / τ) =
      (τ / Complex.I) ^ ((Fintype.card ι : ℂ) / 2)
        * ((Real.sqrt (L.gramDet e : ℝ) : ℂ))⁻¹ * L.dualTheta τ :=
  sorry

/-- **Layer 8G, the translation law on a discriminant coset.** The exponent is exactly the
half-norm discriminant form of 1D, with no factor of two to insert; that is what the half-norm
`ℚ/ℤ` convention buys, and Nikulin's `ℚ/2ℤ` convention would need the explicit dictionary. -/
theorem cosetTheta_add_one (L : IntegralLattice V) [L.IsNondegenerate] (hev : L.IsEven)
    (μ : L.DiscriminantGroup) (τ : ℂ) :
    L.cosetTheta μ (τ + 1)
      = expCircle (L.discriminantQuadraticForm hev μ) * L.cosetTheta μ τ :=
  sorry

/-- **Layer 8G, the vector-valued law under `S`.**

    Θ_μ(−1/τ) = (τ/i)^{n/2} (det L)^{−1/2} ∑_{ν ∈ A_L} e^{−2πi b_L(μ,ν)} Θ_ν(τ).

⚠ The sign inside the character is immaterial, because `cosetTheta_neg` lets `ν ↦ −ν` reverse
it; a source with the opposite sign is not in conflict with this. The factor
`(det L)^{−1/2}`, the branch of `(τ/i)^{n/2}` and the exponent `q_L(μ)` of `cosetTheta_add_one`
are **not** immaterial. At `μ = 0` this is `latticeTheta_neg_inv`, by `cosetTheta_zero` and
`sum_cosetTheta`, and that is the mandatory consistency check. -/
theorem cosetTheta_neg_inv (L : IntegralLattice V) [L.IsNondegenerate]
    [Fintype L.DiscriminantGroup] (hev : L.IsEven) (hpos : L.IsPositiveDefinite)
    {ι : Type} [Fintype ι] [DecidableEq ι] (e : Basis ι ℤ L.carrier)
    (μ : L.DiscriminantGroup) {τ : ℂ} (hτ : 0 < τ.im) :
    L.cosetTheta μ (-1 / τ) =
      (τ / Complex.I) ^ ((Fintype.card ι : ℂ) / 2)
        * ((Real.sqrt (L.gramDet e : ℝ) : ℂ))⁻¹
        * ∑ ν : L.DiscriminantGroup,
            expCircle (-(L.discriminantPairing μ ν)) * L.cosetTheta ν τ :=
  sorry

end IntegralLattice

end Layer8VectorValued

section Layer9

/-! ## Layer 9: what a stored LMFDB lattice record asserts

The Gram-level vocabulary — `GramIsometric`, `GramIsometricAt`, `GramSameGenus` — is the one
fixed before Layer 2, so a certificate and a class-number theorem talk about the same notions.

⚠ The record splits in two, and the split is the point. `StoredGenusCertificate` carries the
**semantic** columns, each of which is a finite check about the stored matrices.
`StoredClassNumberCertificate` carries **completeness**, which no milestone of this roadmap
proves, and it carries it as a named imported hypothesis rather than as a bare field. -/

/-- **Layer 9A, the stored record as one object.** Each field is a statement an LMFDB
lattice record asserts, and nothing here is a placeholder: every condition is spelled out
in terms of the stored matrices, so no unintended model satisfies it. The label
`dim.det.level.class_number.index` contributes the three fields named after its first three
components; its fifth component is an insertion-order serial with no mathematical content and
has no field, and its `class_number` component belongs to `StoredClassNumberCertificate` below.

Genus membership is 3F written out, as `GramSameGenus`: congruence over every `ℤ_p` together
with the real signature.

⚠ There is deliberately **no completeness field and no `class_number` field here**. A list of
pairwise non-isometric lattices in one genus is not thereby the whole genus; 2G gives finiteness
of the class set, which is a different statement from identifying it. Putting `class_number`
beside the semantic columns would make every certificate assert exhaustiveness, which is exactly
what this roadmap cannot prove. -/
structure StoredGenusCertificate where
  /-- The label component `dim`, and the size of the stored Gram matrix. -/
  dim : ℕ
  /-- The stored lattices have positive rank, which is what makes the minimum and the
  kissing number of 2B defined. -/
  dim_pos : 0 < dim
  /-- The stored Gram matrix. -/
  gram : Matrix (Fin dim) (Fin dim) ℤ
  /-- It is symmetric, so it is the Gram matrix of a lattice form (0A, 0C). -/
  gram_isSymm : gram.IsSymm
  /-- It is positive definite, which is what makes 0A to 0E, 2B, 2C, 2G and 8B apply
  (0E). -/
  gram_posDef : (Matrix.toQuadraticForm' gram).PosDef
  /-- The label component `det`, the Gram determinant of 0C. -/
  det : ℤ
  /-- and it is that determinant. -/
  det_eq : det = gram.det
  /-- The label component `level`, in the shape 0D fixes it: the least positive `N` for
  which `N·G⁻¹` is integral with even diagonal. -/
  level : ℕ
  /-- and it is that least element. -/
  level_isLeast :
    IsLeast {N : ℕ | 0 < N ∧ ∃ M : Matrix (Fin dim) (Fin dim) ℤ, (∀ i, 2 ∣ M i i) ∧
      M.map (Int.cast : ℤ → ℚ) = (N : ℚ) • (gram.map (Int.cast : ℤ → ℚ))⁻¹} level
  /-- The stored minimum, `min L` of 2B: the least norm of a nonzero vector. -/
  minimum : ℤ
  /-- and it is that least element. -/
  minimum_isLeast :
    IsLeast {k : ℤ | ∃ x : Fin dim → ℤ, x ≠ 0 ∧ Matrix.toBilin' gram x x = k} minimum
  /-- The stored kissing number, `#S_{min L}(L)` of 2B. -/
  kissing : ℕ
  /-- and it counts the minimal shell. -/
  kissing_eq : kissing = Nat.card {x : Fin dim → ℤ // Matrix.toBilin' gram x x = minimum}
  /-- The stored automorphism group order, `|O(L)|` of 2C, at the level of Gram
  matrices. -/
  autOrder : ℕ
  /-- and it counts the integral congruences of `G` with itself. -/
  autOrder_eq :
    autOrder = Nat.card {P : Matrix (Fin dim) (Fin dim) ℤ // P.transpose * gram * P = gram}
  /-- The stored theta coefficients, `r_L(k) = #S_k(L)` of 2B, which are the coefficients
  of `Θ_L` in 8B. -/
  theta : ℕ → ℕ
  /-- and each one counts its shell. -/
  theta_eq :
    ∀ k : ℕ, theta k = Nat.card {x : Fin dim → ℤ // Matrix.toBilin' gram x x = (k : ℤ)}
  /-- The stored genus representatives. -/
  reps : List (Matrix (Fin dim) (Fin dim) ℤ)
  /-- Each one is the Gram matrix of a positive definite lattice. -/
  reps_posDef : ∀ H ∈ reps, H.IsSymm ∧ (Matrix.toQuadraticForm' H).PosDef
  /-- Each one lies in `gen L`, by 3F. -/
  reps_mem_genus : ∀ H ∈ reps, GramSameGenus gram H
  /-- They are pairwise non-isometric, which is a decidable check for positive definite
  lattices by 2G. -/
  reps_pairwise : reps.Pairwise fun H H' => ¬ GramIsometric H H'

/-- **The mass of a positive definite genus, at the level of Gram matrices** (7A). This says
that the genus of `G` has a finite complete set of representatives whose reciprocal
automorphism orders sum to `m`. It is a definition, not a theorem: 7A defines the mass and 2G
gives finiteness of the class set, but **no milestone of this roadmap evaluates it**. The
Conway–Sloane evaluation is `OrthogonalTamagawaAndLatticeMass`'s 7H. -/
def IsGenusMass {n : ℕ} (G : Matrix (Fin n) (Fin n) ℤ) (m : ℚ) : Prop :=
  ∃ S : Finset (Matrix (Fin n) (Fin n) ℤ),
    (∀ H ∈ S, H.IsSymm ∧ (Matrix.toQuadraticForm' H).PosDef ∧ GramSameGenus G H) ∧
      ((S : Set (Matrix (Fin n) (Fin n) ℤ)).Pairwise fun H H' => ¬ GramIsometric H H') ∧
        (∀ H : Matrix (Fin n) (Fin n) ℤ, H.IsSymm → (Matrix.toQuadraticForm' H).PosDef →
          GramSameGenus G H → ∃ H' ∈ S, GramIsometric H' H) ∧
          m = ∑ H ∈ S,
            (1 : ℚ) / (Nat.card {P : Matrix (Fin n) (Fin n) ℤ // P.transpose * H * P = H} : ℚ)

/-- **Layer 9B, the completeness certificate.** This is the record the `class_number` column
belongs to, and it is separate from 9A on purpose: exhaustiveness of a stored list is not
provable from anything in Layers 0 to 8.

The import is a **named hypothesis field**. `mass` is a rational number, `mass_isGenusMass`
assumes that it is the mass of the genus in the sense of 7A, and `reps_exhaust_mass` is the
finite check that the stored representatives already account for all of it. The only routes to
`mass_isGenusMass` leave this roadmap: an exact mass, which is the successor's 7H, or a proved
neighbour-graph connectivity theorem in the exact regime, which 4G explicitly does not claim.
A consumer that has imported neither cannot build this record at all, which is the intended
behaviour. -/
structure StoredClassNumberCertificate extends StoredGenusCertificate where
  /-- The rational number an imported exact mass theorem supplies for this genus. -/
  mass : ℚ
  /-- **The imported hypothesis, not proved here.** -/
  mass_isGenusMass : IsGenusMass toStoredGenusCertificate.gram mass
  /-- The finite check: the listed representatives already carry the whole mass. -/
  reps_exhaust_mass :
    mass = ∑ H ∈ toStoredGenusCertificate.reps.toFinset,
      (1 : ℚ) / (Nat.card {P : Matrix (Fin toStoredGenusCertificate.dim)
        (Fin toStoredGenusCertificate.dim) ℤ //
          P.transpose * H * P = H} : ℚ)
  /-- The label component `class_number`, the invariant of 4A, finite by 2G. -/
  classNumber : ℕ
  /-- and it is the length of the list. -/
  classNumber_eq : classNumber = toStoredGenusCertificate.reps.length

/-- **Layer 9B, completeness is a theorem and not a field.** Given the imported mass, the
listed representatives exhaust the genus: they are distinct classes in it, `1/|O(M)|` is an
isometry invariant and strictly positive, so a proper sublist would sum to strictly less than
the mass. -/
theorem StoredClassNumberCertificate.reps_complete (c : StoredClassNumberCertificate)
    (H : Matrix (Fin c.dim) (Fin c.dim) ℤ) (hs : H.IsSymm)
    (hp : (Matrix.toQuadraticForm' H).PosDef) (hgen : GramSameGenus c.gram H) :
    ∃ H' ∈ c.reps, GramIsometric H' H :=
  sorry

/-- **Layer 9B, what the certificate buys.** Completeness and pairwise non-isometry say
together that the stored list is a set of representatives on the nose: every positive
definite lattice in the genus is isometric to exactly one entry. This is the statement the
`class_number` column asserts, and it is why it lives on this record and not on 9A's. -/
theorem StoredClassNumberCertificate.existsUnique_rep (c : StoredClassNumberCertificate)
    (H : Matrix (Fin c.dim) (Fin c.dim) ℤ)
    (hs : H.IsSymm) (hp : (Matrix.toQuadraticForm' H).PosDef)
    (hgen : GramSameGenus c.gram H) :
    ∃! H' : Matrix (Fin c.dim) (Fin c.dim) ℤ, H' ∈ c.reps ∧ GramIsometric H' H :=
  sorry

end Layer9

/-! ## Layer B: nonsplit consumed orders and the separate split branch

Layer B builds the binary theory — the norm form, the content and the discriminant, the map from
a form to an ideal, composition, the automorphism groups, and the rank-2 mass. It does **not**
build a quadratic order or a class group of one: `GlobalNumberFields` owns the order, conductor,
raw proper fractional ideals, invertible proper fractional ideals, the ideal class monoid,
`Pic`, and `NarrowPic`. `ClassFieldTheory` owns the ring class field and its Artin isomorphism,
as `ringClassField`, `ringClassArtinMap` and `gal_ringClassField_equiv_pic`.  Those supplier
carriers are used only when the discriminant is nonsquare.  A square discriminant gives the
split algebra and is handled elementarily below; it is never passed to `NumberFieldOrder`.

⚠ **The split branch cannot be asked for a ring class field, and that is enforced by types.**
`binaryRingClassField` below is the only route from a binary discriminant to a ring class field
in this roadmap, and it carries `¬ IsSquare Δ` in its own type because the only route to the
order it needs — `orderOfNonsquareBinaryDiscriminant` — carries it. There is no way round:
`ClassFieldTheory.ringClassField` takes a `NumberFieldOrder K` with `[Field K]`, and the split
algebra `ℚ × ℚ` is not a field, so it is the `K` of no such order. Nothing here defines a split
substitute that would reopen the question.

Layer B's form-side carriers rest on milestones of Layers 0 to 3 that are themselves still
targets, so the class sets of forms are not built here. The checks below apply the exact GNF
and CFT exports at the shapes B1 to B5 use.
-/

section LayerBContract

open GlobalNumberFields
open scoped NumberField nonZeroDivisors

-- ⚠ `K : Type` and not `Type u`: `ClassFieldTheory.ringClassField` is stated at `Type`, and
-- `binaryRingClassField` below composes with it.
variable {K : Type} [Field K] [NumberField K]

/-- **B1's nonsplit branch is a genuine supplier order.**  The square root and rank-two
hypotheses identify the supplied number field with the quadratic field of `Δ`; the explicit
`¬ IsSquare Δ` hypothesis prevents this declaration from being instantiated by `ℚ × ℚ`. -/
noncomputable def orderOfNonsquareBinaryDiscriminant (Δ : ℤ) (hΔ : ¬ IsSquare Δ)
    (sqrtΔ : K) (hsqrtΔ : sqrtΔ ^ 2 = (Δ : K))
    (hquadratic : Module.finrank ℚ K = 2) : NumberFieldOrder K := sorry

/-- **B1 consumes Global Number Fields Layer 11.** The order attached to a binary lattice is a term of this
type, and its conductor is this ideal. -/
noncomputable example (O : NumberFieldOrder K) : Ideal (𝓞 K) := O.conductor

/-- **B2 consumes Global Number Fields Layer 11.** This is the group-valued carrier used by
`Pic` and `NarrowPic`. Its members are both invertible and proper. Raw proper fractional
ideals live in `O.properFractionalIdeals`; for a general order they need not be invertible. -/
noncomputable example (O : NumberFieldOrder K) :
    CommGroup O.invertibleProperFractionalIdeals := inferInstance

/-- **B2 keeps raw proper ideals out of `Pic`.** They have a class in the supplier's ideal
class monoid, which is not a group in general. -/
noncomputable example (O : NumberFieldOrder K) (I : O.properFractionalIdeals) :
    IdealClassMonoid O := O.mkIdealClassMonoid I

/-- **B2 consumes `GlobalNumberFields.Pic`**, for `Δ < 0`, through the invertible proper
carrier. -/
noncomputable example (O : NumberFieldOrder K) (I : O.invertibleProperFractionalIdeals) :
    Pic O := O.mkPic I

/-- **B2's proper-to-invertible step is quadratic, not general.** The nonsquare binary
branch supplies a quadratic number field, so this exact supplier theorem converts the raw
proper ideal attached to a primitive binary form into an invertible ideal. -/
example (O : NumberFieldOrder K) (hK : Module.finrank ℚ K = 2)
    (I : FractionalIdeal (O.toSubalgebra)⁰ K) :
    O.IsProperFractionalIdeal I ↔ IsUnit I :=
  O.isProper_iff_isUnit_of_finrank_eq_two hK I

/-- **B2 consumes `GlobalNumberFields.NarrowPic`**, for `Δ > 0`. The target is the **narrow**
group, and it is a different type from `Pic O`. A dictionary stated into `Pic` for `Δ > 0` is
false; `Δ = 12` is the smallest witness. -/
example (O : NumberFieldOrder K) : Type := NarrowPic O

/-- **B5 consumes GNF's finiteness theorems**, for both groups. Layer B owns the form-side reduction
route and the explicit list of reduced forms, and not these two theorems. -/
example (O : NumberFieldOrder K) : Finite (Pic O) ∧ Finite (NarrowPic O) :=
  ⟨finite_pic O, finite_narrowPic O⟩

/-- **B3, the only ring class field this roadmap ever forms.** It is a real definition and not a
milestone: the ring class field of a binary discriminant *is* Class Field Theory's, applied to
B1's order. The point of naming it is the type — `¬ IsSquare Δ` is a parameter, so a square
discriminant cannot reach a ring class field through this roadmap at all. -/
noncomputable def binaryRingClassField (Δ : ℤ) (hΔ : ¬ IsSquare Δ)
    (sqrtΔ : K) (hsqrtΔ : sqrtΔ ^ 2 = (Δ : K)) (hquadratic : Module.finrank ℚ K = 2) :
    IntermediateField K (AlgebraicClosure K) :=
  ClassFieldTheory.ringClassField K
    (orderOfNonsquareBinaryDiscriminant Δ hΔ sqrtΔ hsqrtΔ hquadratic) hquadratic

/-- **B3, the composite this roadmap proves**, at the level of the two consumed theorems: the
Galois group of the binary ring class field is the supplier's `Pic` of B1's order, which B2
identifies with the proper classes of primitive forms of discriminant `Δ`. This roadmap proves
the composite and neither half. -/
theorem gal_binaryRingClassField_equiv_pic (Δ : ℤ) (hΔ : ¬ IsSquare Δ)
    (sqrtΔ : K) (hsqrtΔ : sqrtΔ ^ 2 = (Δ : K)) (hquadratic : Module.finrank ℚ K = 2) :
    Nonempty
      ((binaryRingClassField Δ hΔ sqrtΔ hsqrtΔ hquadratic
          ≃ₐ[K] binaryRingClassField Δ hΔ sqrtΔ hsqrtΔ hquadratic)
        ≃* Pic (orderOfNonsquareBinaryDiscriminant Δ hΔ sqrtΔ hsqrtΔ hquadratic)) :=
  ClassFieldTheory.gal_ringClassField_equiv_pic K
    (orderOfNonsquareBinaryDiscriminant Δ hΔ sqrtΔ hsqrtΔ hquadratic) hquadratic

end LayerBContract

section LayerBSplitContract

/-- The split quadratic algebra `ℚ[t]/(t² − Δ) ≃ ℚ × ℚ` of a square discriminant. -/
abbrev SplitQuadraticAlgebra := ℚ × ℚ

/-- The order in the split quadratic algebra.  This is deliberately an elementary product
ring, not a `GlobalNumberFields.NumberFieldOrder`. -/
abbrev SplitQuadraticOrder := ℤ × ℤ

/-- **The rejection test that makes the split ring class field unaskable.** `ℚ × ℚ` is not a
field — `(1, 0)` is a nonzero nonunit — so it carries no `Field` instance, is the `K` of no
`GlobalNumberFields.NumberFieldOrder K`, and cannot be supplied to
`ClassFieldTheory.ringClassField` or to `binaryRingClassField`. This is a statement about the
mathematics and not about the Lean elaborator: there is no ring class field of `ℚ × ℚ` to
name. -/
theorem not_isField_splitQuadraticAlgebra : ¬ IsField SplitQuadraticAlgebra := sorry

/-- The split order has four units, independently of the field-only Picard API. -/
example : Nat.card (Units SplitQuadraticOrder) = 4 := sorry

/-- `U` is the mandatory square-discriminant example: its primitive discriminant is `1`
and its full integral isometry group has order four. -/
example : Nat.card {e : (Fin 2 → ℤ) ≃ₗ[ℤ] (Fin 2 → ℤ) //
    ∀ x y, Matrix.toBilin' (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ) (e x) (e y) =
      Matrix.toBilin' (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℤ) x y} = 4 := sorry

end LayerBSplitContract

/-! ## Reviewed foundation acceptance suite

These named targets are retained from upstream PR #200. They test the canonical carrier,
the half-norm convention, degeneracy, and the general gluing route independently of the
broader local/global programme above.
-/

section RankOneAcceptance

noncomputable def rankOne (m : ℤ) (hm : m ≠ 0) : IntegralLattice ℚ := sorry

instance (m : ℤ) (hm : m ≠ 0) : (rankOne m hm).IsNondegenerate := sorry

theorem rankOne_isEven (m : ℤ) (hm : m ≠ 0) : (rankOne m hm).IsEven := sorry

theorem rankOne_signature (m : ℤ) (hm : m ≠ 0) :
    (rankOne m hm).signature = if 0 < m then (1, 0, 0) else (0, 0, 1) := sorry

noncomputable def rankOneZero : IntegralLattice ℚ := sorry

theorem rankOneZero_signature : rankOneZero.signature = (0, 1, 0) := sorry

noncomputable def rankOneGenerator (m : ℤ) (hm : m ≠ 0) :
    (rankOne m hm).dual := sorry

theorem mem_rankOne_dual_iff (m : ℤ) (hm : m ≠ 0) (x : ℚ) :
    x ∈ (rankOne m hm).dual ↔
      ∃ z : ℤ, x = (z : ℚ) / (2 * (m : ℚ)) := sorry

noncomputable def rankOneDiscriminantEquivZMod (m : ℤ) (hm : m ≠ 0) :
    (rankOne m hm).DiscriminantGroup ≃+ ZMod (2 * m).natAbs := sorry

theorem natCard_rankOne_discriminantGroup (m : ℤ) (hm : m ≠ 0) :
    Nat.card (rankOne m hm).DiscriminantGroup = (2 * m).natAbs := sorry

theorem rankOne_bilinear_generator (m : ℤ) (hm : m ≠ 0) :
    let L := rankOne m hm
    let g := L.carrierInDual.mkQ (rankOneGenerator m hm)
    L.discriminantPairing g g =
      (↑((1 : ℚ) / (2 * (m : ℚ))) : AddCircle (1 : ℚ)) := sorry

theorem rankOne_quadratic_generator (m : ℤ) (hm : m ≠ 0) :
    let L := rankOne m hm
    L.discriminantQuadraticForm (rankOne_isEven m hm)
        (L.carrierInDual.mkQ (rankOneGenerator m hm)) =
      (↑((1 : ℚ) / (4 * (m : ℚ))) : AddCircle (1 : ℚ)) := sorry

theorem rankOne_polar_generator (m : ℤ) (hm : m ≠ 0) :
    let L := rankOne m hm
    let g := L.carrierInDual.mkQ (rankOneGenerator m hm)
    let q := L.discriminantQuadraticForm (rankOne_isEven m hm)
    q (g + g) - q g - q g = L.discriminantPairing g g := sorry

end RankOneAcceptance

section DefinitenessAcceptance

noncomputable def hyperbolicPlane : IntegralLattice (Fin 2 → ℚ) := sorry
instance : hyperbolicPlane.IsNondegenerate := sorry
theorem hyperbolicPlane_signature : hyperbolicPlane.signature = (1, 0, 1) := sorry
theorem hyperbolicPlane_isEven : hyperbolicPlane.IsEven := sorry
theorem hyperbolicPlane_isUnimodular : hyperbolicPlane.IsUnimodular := sorry
theorem hyperbolicPlane_isIndefinite : hyperbolicPlane.IsIndefinite := sorry

noncomputable def affineA1 : IntegralLattice (Fin 2 → ℚ) := sorry
theorem affineA1_isEven : affineA1.IsEven := sorry
theorem affineA1_signature : affineA1.signature = (1, 1, 0) := sorry
theorem affineA1_isPositiveSemidefinite : affineA1.IsPositiveSemidefinite := sorry
theorem affineA1_not_isNondegenerate : ¬ affineA1.IsNondegenerate := sorry

noncomputable def affineA1RadicalQuotientIsometry :
    affineA1.radicalQuotient.Isometry (rankOne 1 one_ne_zero) := sorry

end DefinitenessAcceptance

section ADEAcceptance

open TauCeti

abbrev SimplyLacedType := {t : DynkinType // t.Valid ∧ t.IsSimplyLaced}

variable (t : SimplyLacedType)

noncomputable def adeLattice : IntegralLattice (Fin t.1.rank → ℚ) := sorry
instance : (adeLattice t).IsNondegenerate := sorry
noncomputable def adeSimpleBasis : Basis (Fin t.1.rank) ℤ (adeLattice t).carrier := sorry

theorem gramMatrix_adeLattice :
    (adeLattice t).gramMatrix (adeSimpleBasis t) = t.1.cartanMatrix := sorry

theorem adeLattice_isEven : (adeLattice t).IsEven := sorry
theorem adeLattice_isPositiveDefinite : (adeLattice t).IsPositiveDefinite := sorry

theorem natCard_adeLattice_roots :
    Nat.card {x : (adeLattice t).carrier // (adeLattice t).form x x = 2} =
      t.1.numRoots := sorry

noncomputable def discriminantEquivZMod_A (n : ℕ) (hn : 1 ≤ n) :
    (adeLattice ⟨.A n, DynkinType.valid_A.mpr hn, DynkinType.isSimplyLaced_A n⟩).DiscriminantGroup
      ≃+ ZMod (n + 1) := sorry

theorem e8_isUnimodular :
    (adeLattice ⟨.E8, DynkinType.valid_E8, DynkinType.isSimplyLaced_E8⟩).IsUnimodular := sorry

def d8 : SimplyLacedType := ⟨.D 8, by decide, by decide⟩
def e8 : SimplyLacedType := ⟨.E8, by decide, by decide⟩

noncomputable def d8SpinorClass : (adeLattice d8).DiscriminantGroup := sorry

noncomputable def d8SpinorSubgroup : AddSubgroup (adeLattice d8).DiscriminantGroup :=
  AddSubgroup.closure {d8SpinorClass}

theorem natCard_d8SpinorSubgroup : Nat.card d8SpinorSubgroup = 2 := sorry

theorem d8SpinorClass_quadratic_eq_zero :
    (adeLattice d8).discriminantQuadraticForm (adeLattice_isEven d8) d8SpinorClass = 0 := sorry

theorem d8SpinorSubgroup_isIsotropic :
    ((adeLattice d8).discriminantQuadraticModule (adeLattice_isEven d8)).IsIsotropic
      d8SpinorSubgroup := sorry

noncomputable def d8Plus : IntegralLattice (Fin (DynkinType.D 8).rank → ℚ) :=
  (adeLattice d8).ofIsotropicSubgroup (adeLattice_isEven d8) d8SpinorSubgroup
    d8SpinorSubgroup_isIsotropic

instance : d8Plus.IsNondegenerate := sorry
theorem d8Plus_isUnimodular : d8Plus.IsUnimodular := sorry

noncomputable def d8PlusIsometryE8 :
    IntegralLattice.Isometry d8Plus (adeLattice e8) := sorry

theorem d8Plus_discriminantGroup_subsingleton :
    Subsingleton d8Plus.DiscriminantGroup := sorry

end ADEAcceptance

end TauCetiRoadmap.IntegralLattices
