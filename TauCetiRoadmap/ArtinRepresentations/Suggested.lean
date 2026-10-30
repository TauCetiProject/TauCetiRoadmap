import Mathlib
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.Basic
import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.FiniteExtension
import TauCeti.RepresentationTheory.GaloisLattice.FiniteQuotient
import TauCeti.RepresentationTheory.CharacterTable.FrobeniusSchur.Basic
import TauCeti.NumberTheory.LocalField.Unramified.Inertia.Basic
import TauCeti.NumberTheory.LocalField.WildInertia
import TauCeti.NumberTheory.NumberField.Frobenius
import TauCeti.NumberTheory.NumberField.ArtinSymbol
import TauCeti.NumberTheory.NumberField.ComplexConjugation.Basic

/-!
# Artin representations, Artin L-functions and the LMFDB invariants: target signatures

**This file is not the roadmap and is not exhaustive.** It states only what can be stated over
Mathlib and the pinned Tau Ceti; the other targets, with their definitions and Checks, are
specified in `README.md` only, which is the definitive specification. Every definition here has its
real body, and `sorry` occurs only as the proof of a theorem: these are targets, not
implementations. Every docstring names the milestone (`README.md`, Layer `N`, `N.M`) a declaration
realises.

The carrier is `ArtinRep F V`: Mathlib's `ContRepresentation ℂ (Field.absoluteGaloisGroup F) V`
on a finite-dimensional complex normed space `V`, **together with** the continuity of
`ρ : G_F → (V →L[ℂ] V)` for the Krull topology and the operator norm, which Mathlib's structure
does not carry (it is a bare homomorphism `G →* V →L[R] V`). Nothing else is added: no joint
continuity, no "finite image" predicate; `ArtinRep.isOpen_ker` and `ArtinRep.finite_range` are
theorems, and `continuous_iff_isOpen_ker` shows the continuity field is the only possible one.
Every statement about a specific `ρ` is read at the **finite level** `toFinite ρ`, a
`Representation ℂ (artinField ρ ≃ₐ[F] artinField ρ) V`, where Mathlib's `IsArithFrobAt`,
`Ideal.inertia`, `Representation.invariants`, `LinearMap.charpoly` and Tau Ceti's
`complexConjugationAt`, `frobeniusSchurIndicator` apply unchanged.

Four conventions are visible in the signatures and are the point of seeding this file at all.
First, **arithmetic Frobenius** everywhere: Tau Ceti's `IsArithFrobeniusLift` locally, Mathlib's
`IsArithFrobAt` globally. Second, the **local polynomial** is
`det(1 − X ρ(Φ) | V^I)` on the *inertia invariants*, `(LinearMap.charpoly _).reverse`, never
the characteristic polynomial (`frobeniusCharpoly`) and never on all of `V`; the Euler product
`artinLSeries` runs over **all** finite places. Third, `artinLFunctionC` is the continuation of
`artinLSeries` in Mathlib's meromorphic normal form, and identities between continued functions are
equalities of **punctured germs** `=ᶠ[𝓝[≠] s]`, never of total functions. Fourth, parity is a
property of `det ρ` at a complex conjugation, with `n₋` the dimension of the `−1`-eigenspace of
`ρ(c)`, so that an even `ρ` may have `ρ(c) = −1` (the tetrahedral example of `README.md`).

Several definitions are formed at an auxiliary choice (a Frobenius lift, a prime above `v` with a
Frobenius at it, a complex place above a real one, a representative of a conjugacy class), made by
`Classical.choose` on an existence statement; the accompanying `_spec` theorem pins the value
wherever the README defines it (for `frobeniusCharpoly` and `frobeniusClass`, at unramified and good
places). In `nMinus` the `else` branch is the value itself (`n₋ = 0` when every place above `v` is
real); in the others the existence always holds. `artinLFunctionC` is chosen by
`Classical.epsilon` among the meromorphic functions in normal form that continue `artinLSeries`,
of which there is exactly one.

What is **not** declared here: the Artin conductor, Swan conductor and local constants
(`Conductor.artinConductorNat`, `Conductor.globalConductor`, `epsilonWeil` of the arithmetic Galois
representations roadmap), Brauer induction (`TauCeti.RepresentationTheory.Induction.Brauer`), the
Hecke L-functions and the analytic card of the L-functions roadmap, and the proved cases of Artin's
conjecture. The targets that rest on them are specified in `README.md` only: the analytic conductor
(Layer 3.5), the completed L-function (4.2), the root number and the functional equation (4.3,
6.2), the root numbers of `p`-adic fields (2.4, 6.4), the local root numbers of elliptic curves
(6.5) and the top slope of a mod-`ℓ` representation (9.2). So is induction along a finite extension
(1.5), whose carrier needs coset representatives of an open subgroup of `G_F`. Layer 5
(conductor–discriminant), 8.2 (weight one) and 8.3 (Stark) have no declaration here.

Four theorems are proved here. Two are bridge checks: `isOpen_ker_of_forall_isOpen_stabilizer`
applies Tau Ceti's `Representation.isOpen_ker_of_finite` to the carrier (Layer 1.1), and
`Gammaℂ_eq_Gammaℝ_mul_Gammaℝ_add_one` is the duplication formula the inductivity of the gamma factor
(Layer 4.2) rests on, taken from Mathlib. The other two, `ker_restrictNormalHom_artinField_le` and
`mem_ramifiedSet_iff`, are what the definitions of `toFinite` and `ramifiedSet` are built from.

The instances `Finite (image ρ)`, `FiniteDimensional F (artinField ρ)`, `IsGalois F (artinField ρ)`
and their mod-`ℓ` analogues are stated as instances because the finite level needs them; each is
the theorem of Layer 1.1, 1.2 or 9.1 stated just above it, whose proof is `sorry`.
-/

namespace TauCetiRoadmap.ArtinRepresentations

open Complex Filter Topology NumberField Polynomial
open IsDedekindDomain (HeightOneSpectrum)
open scoped NumberField MatrixGroups

noncomputable section

/-! ## Layer 1: Artin representations of a field -/

section Carrier

variable (F : Type*) [Field F]
variable (V : Type*) [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]

/-- **Layer 1.1**, the carrier. Mathlib's `ContRepresentation ℂ G_F V` is a homomorphism
`G_F →* (V →L[ℂ] V)` with no condition in the group variable; an Artin representation is one that
is continuous for the Krull topology on `G_F = Field.absoluteGaloisGroup F` and the operator-norm
topology on `V →L[ℂ] V`. `isOpen_ker` and `finite_range` are consequences, not fields. -/
structure ArtinRep extends ContRepresentation ℂ (Field.absoluteGaloisGroup F) V where
  continuous_toFun : Continuous (toMonoidHom : Field.absoluteGaloisGroup F → V →L[ℂ] V)

variable {F V}

namespace ArtinRep

instance : CoeFun (ArtinRep F V) (fun _ ↦ Field.absoluteGaloisGroup F → V →L[ℂ] V) :=
  ⟨fun ρ ↦ ρ.toMonoidHom⟩

/-- The underlying `Representation ℂ G_F V`, Mathlib's `ContRepresentation.toRepresentation`. -/
abbrev toRepresentation (ρ : ArtinRep F V) : Representation ℂ (Field.absoluteGaloisGroup F) V :=
  ρ.toContRepresentation.toRepresentation

/-- **Layer 1.1**, the kernel, as the kernel of the underlying `Representation`. -/
abbrev ker (ρ : ArtinRep F V) : Subgroup (Field.absoluteGaloisGroup F) := ρ.toRepresentation.ker

theorem mem_ker {ρ : ArtinRep F V} {g : Field.absoluteGaloisGroup F} : g ∈ ρ.ker ↔ ρ g = 1 := sorry

/-- **Layer 1.1**, `isOpen_ker`: the kernel is open (no small subgroups in `GL(V)`, profiniteness
of `G_F`; the arithmetic Galois representations roadmap §1.4). -/
theorem isOpen_ker (ρ : ArtinRep F V) : IsOpen (ρ.ker : Set (Field.absoluteGaloisGroup F)) := sorry

/-- **Layer 1.1**, `finite_range`. -/
theorem finite_range (ρ : ArtinRep F V) : (Set.range ρ).Finite := sorry

/-- **Layer 1.1**, `continuous_iff_isOpen_ker`: on Mathlib's bare `ContRepresentation`, continuity
in the group variable is exactly openness of the kernel, so the field `continuous_toFun` is the
only condition an Artin representation adds. -/
theorem continuous_iff_isOpen_ker (π : ContRepresentation ℂ (Field.absoluteGaloisGroup F) V) :
    Continuous (π.toMonoidHom : Field.absoluteGaloisGroup F → V →L[ℂ] V) ↔
      IsOpen (π.toRepresentation.ker : Set (Field.absoluteGaloisGroup F)) := sorry

/-- **Layer 1.1**, bridge check (not `sorry`): Tau Ceti's `Representation.isOpen_ker_of_finite`
applies to the carrier verbatim, so the backward direction of `continuous_iff_isOpen_ker` needs only
the openness of the vector stabilisers. -/
theorem isOpen_ker_of_forall_isOpen_stabilizer (ρ : ArtinRep F V)
    (h : ∀ x : V, IsOpen {g : Field.absoluteGaloisGroup F | ρ.toRepresentation g x = x}) :
    IsOpen (ρ.ker : Set (Field.absoluteGaloisGroup F)) :=
  Representation.isOpen_ker_of_finite ρ.toRepresentation h

/-- **Layer 1.1**, the trivial representation on `V`: the non-vacuity constructor of the carrier. -/
def trivial : ArtinRep F V where
  toMonoidHom := 1
  continuous_toFun := continuous_const

variable (F V) in
theorem ker_trivial : (trivial : ArtinRep F V).ker = ⊤ := sorry

/-- **Layer 1.1**, the character, as a function on `G_F`; it is constant on cosets of `ρ.ker`. -/
def character (ρ : ArtinRep F V) : Field.absoluteGaloisGroup F → ℂ := ρ.toRepresentation.character

theorem character_one (ρ : ArtinRep F V) : character ρ 1 = Module.finrank ℂ V := sorry

/-- **Layer 1.4**, the determinant `det ρ : G_F →* ℂ`, a one-dimensional Artin representation. -/
def det (ρ : ArtinRep F V) : Field.absoluteGaloisGroup F →* ℂ :=
  LinearMap.det.comp ρ.toRepresentation

/-- **Layer 7.4**, the image, a finite subgroup of `GL(V) = (V →L[ℂ] V)ˣ`, the LMFDB's `Group`. -/
def image (ρ : ArtinRep F V) : Subgroup (V →L[ℂ] V)ˣ := ρ.toMonoidHom.toHomUnits.range

/-- **Layer 1.1**, the image is a finite subgroup of `GL(V)`. -/
theorem finite_image (ρ : ArtinRep F V) : Finite (image ρ) := sorry

instance (ρ : ArtinRep F V) : Finite (image ρ) := finite_image ρ

/-- **Layer 1.1**, isomorphism: a linear equivariant equivalence (automatically continuous in finite
dimension). -/
def Iso {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W] [FiniteDimensional ℂ W]
    (ρ : ArtinRep F V) (ρ' : ArtinRep F W) : Prop :=
  ∃ e : V ≃L[ℂ] W, ∀ g v, e (ρ g v) = ρ' g (e v)

/-- **Layer 1.3**, `iso_iff_character_eq`. -/
theorem iso_iff_character_eq {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W]
    [FiniteDimensional ℂ W] (ρ : ArtinRep F V) (ρ' : ArtinRep F W) :
    Iso ρ ρ' ↔ character ρ = character ρ' := sorry

/-- **Layer 1.4**, the direct sum on `V × W`. -/
def prod {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W] [FiniteDimensional ℂ W]
    (ρ : ArtinRep F V) (ρ' : ArtinRep F W) : ArtinRep F (V × W) where
  toMonoidHom :=
    { toFun := fun g ↦ (ρ.toMonoidHom g).prodMap (ρ'.toMonoidHom g)
      map_one' := by ext <;> simp
      map_mul' := fun g h ↦ by ext <;> simp }
  continuous_toFun :=
    ((ContinuousLinearMap.prodMapL ℂ V V W W).continuous.comp
      (ρ.continuous_toFun.prodMk ρ'.continuous_toFun)).congr fun g ↦ by simp

theorem character_prod {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W]
    [FiniteDimensional ℂ W] (ρ : ArtinRep F V) (ρ' : ArtinRep F W)
    (g : Field.absoluteGaloisGroup F) :
    character (prod ρ ρ') g = character ρ g + character ρ' g := sorry

/-- **Layer 1.4**, the dual, on the strong dual `V →L[ℂ] ℂ` (Mathlib's `Representation.dual` made
continuous): `g` acts by precomposition with `ρ(g⁻¹)`. Its character is the complex conjugate
(`FDRep.conj_char`). -/
def dual (ρ : ArtinRep F V) : ArtinRep F (StrongDual ℂ V) where
  toMonoidHom :=
    { toFun := fun g ↦ (ContinuousLinearMap.compL ℂ V V ℂ).flip (ρ.toMonoidHom g⁻¹)
      map_one' := by ext; simp
      map_mul' := fun g h ↦ by ext; simp }
  continuous_toFun :=
    (ContinuousLinearMap.compL ℂ V V ℂ).flip.continuous.comp
      (ρ.continuous_toFun.comp continuous_inv)

theorem character_dual (ρ : ArtinRep F V) (g : Field.absoluteGaloisGroup F) :
    character (dual ρ) g = starRingEnd ℂ (character ρ g) := sorry

theorem det_dual (ρ : ArtinRep F V) (g : Field.absoluteGaloisGroup F) :
    det (dual ρ) g = (det ρ g)⁻¹ := sorry

/-- **Layer 1.2**, the Artin field `K_ρ`: the fixed field of `ker ρ` in the algebraic closure. -/
def artinField (ρ : ArtinRep F V) : IntermediateField F (AlgebraicClosure F) :=
  IntermediateField.fixedField ρ.ker

/-- **Layer 1.2**: an open normal subgroup fixes a finite Galois extension (`isOpen_iff_finite`). -/
theorem finiteDimensional_artinField (ρ : ArtinRep F V) : FiniteDimensional F (artinField ρ) :=
  sorry

theorem isGalois_artinField (ρ : ArtinRep F V) : IsGalois F (artinField ρ) := sorry

instance (ρ : ArtinRep F V) : FiniteDimensional F (artinField ρ) := finiteDimensional_artinField ρ
instance (ρ : ArtinRep F V) : IsGalois F (artinField ρ) := isGalois_artinField ρ

/-- **Layer 1.2**, `(artinField ρ).fixingSubgroup = ρ.ker`, the Galois correspondence for the closed
subgroup `ρ.ker`. -/
theorem fixingSubgroup_artinField (ρ : ArtinRep F V) : (artinField ρ).fixingSubgroup = ρ.ker :=
  sorry

/-- **Layer 1.2**, `finrank F (artinField ρ) = |image ρ|`. -/
theorem finrank_artinField (ρ : ArtinRep F V) :
    Module.finrank F (artinField ρ) = Nat.card (image ρ) := sorry

/-- **Layer 1.2**, inflation: a representation of `Gal(L/F)` for a finite Galois `L ⊆ F̄`, read on
`G_F` through `AlgEquiv.restrictNormalHom L`. -/
def ofFinite (L : IntermediateField F (AlgebraicClosure F)) [IsGalois F L] [FiniteDimensional F L]
    (W : Representation ℂ (L ≃ₐ[F] L) V) : ArtinRep F V where
  toMonoidHom :=
    { toFun := fun g ↦ LinearMap.toContinuousLinearMap (W (AlgEquiv.restrictNormalHom L g))
      map_one' := by ext x; erw [map_one, map_one]; rfl
      map_mul' := fun g h ↦ by ext x; erw [map_mul, map_mul]; rfl }
  continuous_toFun :=
    (continuous_of_discreteTopology
      (f := fun σ : L ≃ₐ[F] L ↦ LinearMap.toContinuousLinearMap (W σ))).comp
        (InfiniteGalois.restrictNormalHom_continuous L)

theorem ofFinite_apply (L : IntermediateField F (AlgebraicClosure F)) [IsGalois F L]
    [FiniteDimensional F L] (W : Representation ℂ (L ≃ₐ[F] L) V) (g : Field.absoluteGaloisGroup F) :
    ((ofFinite L W) g : V →ₗ[ℂ] V) = W (AlgEquiv.restrictNormalHom L g) := sorry

/-- **Layer 1.2**, restriction to the Artin field kills nothing outside `ρ.ker`, so `ρ` factors
through `Gal(K_ρ/F)`. -/
theorem ker_restrictNormalHom_artinField_le (ρ : ArtinRep F V) :
    (AlgEquiv.restrictNormalHom (artinField ρ) :
      Field.absoluteGaloisGroup F →* artinField ρ ≃ₐ[F] artinField ρ).ker ≤ ρ.ker :=
  ((artinField ρ).restrictNormalHom_ker.trans (fixingSubgroup_artinField ρ)).le

/-- **Layer 1.2**, the faithful finite-level representation of `Gal(K_ρ/F)` on `V`: `σ` acts as
`ρ(g)` for any `g ∈ G_F` restricting to `σ`, through `G_F ⧸ ker(restriction) ≃* Gal(K_ρ/F)`. -/
def toFinite (ρ : ArtinRep F V) : Representation ℂ (artinField ρ ≃ₐ[F] artinField ρ) V :=
  (QuotientGroup.lift (AlgEquiv.restrictNormalHom (artinField ρ) :
      Field.absoluteGaloisGroup F →* artinField ρ ≃ₐ[F] artinField ρ).ker ρ.toRepresentation
      (ker_restrictNormalHom_artinField_le ρ)).comp
    (QuotientGroup.quotientKerEquivOfSurjective
      (AlgEquiv.restrictNormalHom (artinField ρ) :
        Field.absoluteGaloisGroup F →* artinField ρ ≃ₐ[F] artinField ρ)
      (AlgEquiv.restrictNormalHom_surjective (AlgebraicClosure F))).symm.toMonoidHom

theorem ofFinite_toFinite (ρ : ArtinRep F V) : ofFinite (artinField ρ) (toFinite ρ) = ρ := sorry

theorem toFinite_injective (ρ : ArtinRep F V) : Function.Injective (toFinite ρ) := sorry

/-- **Layer 1.2**, `factorsThrough_iff`: `ρ` is inflated from `L` iff `L` contains the Artin field. -/
theorem exists_ofFinite_eq_iff (ρ : ArtinRep F V) (L : IntermediateField F (AlgebraicClosure F))
    [IsGalois F L] [FiniteDimensional F L] :
    (∃ W : Representation ℂ (L ≃ₐ[F] L) V, ofFinite L W = ρ) ↔ artinField ρ ≤ L := sorry

/-- **Layer 1.3**, semisimplicity, transported from Maschke at the finite level. -/
theorem isSemisimpleRepresentation (ρ : ArtinRep F V) :
    Representation.IsSemisimpleRepresentation ρ.toRepresentation := sorry

/-- **Layer 1.5**, restriction to the open subgroup `G_L` of a finite extension `L/F`, placed in
`F̄` by `σ`; Tau Ceti's `absoluteGaloisGroupExtend` is the inclusion `G_L →* G_F`. -/
def restrict (ρ : ArtinRep F V) (L : Type*) [Field L] [Algebra F L] [FiniteDimensional F L]
    (σ : L →ₐ[F] SeparableClosure F) : ArtinRep L V where
  toMonoidHom := ρ.toMonoidHom.comp (TauCeti.absoluteGaloisGroupExtend F L σ)
  continuous_toFun := ρ.continuous_toFun.comp (TauCeti.continuous_absoluteGaloisGroupExtend F L σ)

/-- **Layer 1.6**, the character field `ℚ(χ) ⊆ ℂ`, an abelian number field inside `ℚ(ζ_e)`. -/
def characterField (ρ : ArtinRep F V) : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ (Set.range (character ρ))

theorem finiteDimensional_characterField (ρ : ArtinRep F V) :
    FiniteDimensional ℚ (characterField ρ) := sorry

/-- **Layer 1.6**, the conductor of the character field: the least `n ≥ 1` with
`ℚ(χ) ⊆ ℚ(ζ_n)`, the LMFDB's `CharacterField`. -/
def characterFieldConductor (ρ : ArtinRep F V) : ℕ :=
  sInf {n : ℕ | 0 < n ∧ characterField ρ ≤
    IntermediateField.adjoin ℚ {Complex.exp (2 * (Real.pi : ℂ) * I / n)}}

theorem characterFieldConductor_spec (ρ : ArtinRep F V) :
    IsLeast {n : ℕ | 0 < n ∧ characterField ρ ≤
      IntermediateField.adjoin ℚ {Complex.exp (2 * (Real.pi : ℂ) * I / n)}} (characterFieldConductor ρ) :=
  sorry

/-- **Layer 7.2**, the Frobenius–Schur indicator, Tau Ceti's average
`|G|⁻¹ Σ_g χ(g²)` on the finite level; `1` orthogonal, `−1` symplectic, `0` complex (the LMFDB's
`Indicator`). -/
def frobeniusSchurIndicator (ρ : ArtinRep F V) : ℂ :=
  TauCeti.Representation.frobeniusSchurIndicator (toFinite ρ)

theorem frobeniusSchurIndicator_mem (ρ : ArtinRep F V)
    [Representation.IsIrreducible ρ.toRepresentation] :
    frobeniusSchurIndicator ρ ∈ ({1, 0, -1} : Set ℂ) := sorry

/-- **Layer 7.2**, self-duality is a nonzero indicator. -/
theorem frobeniusSchurIndicator_ne_zero_iff (ρ : ArtinRep F V)
    [Representation.IsIrreducible ρ.toRepresentation] :
    frobeniusSchurIndicator ρ ≠ 0 ↔ Iso ρ (dual ρ) := sorry

end ArtinRep

end Carrier

/-! ## Layer 2: local Artin representations -/

section Local

open ValuativeRel

variable {K : Type*} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]

namespace ArtinRep

/-- **Layer 2.1**, the inertia invariants `V^{I_K}`, Mathlib's `Representation.invariants` of the
restriction to Tau Ceti's `inertiaSubgroup K`. -/
def inertiaInvariants (ρ : ArtinRep K V) : Submodule ℂ V :=
  Representation.invariants (ρ.toRepresentation.comp (TauCeti.inertiaSubgroup K).subtype)

/-- **Layer 2.1**, the wild-inertia invariants `V^{P_K}`. -/
def wildInvariants (ρ : ArtinRep K V) : Submodule ℂ V :=
  Representation.invariants (ρ.toRepresentation.comp (TauCeti.wildInertiaSubgroup K).subtype)

/-- **Layer 2.1**, `IsUnramified ρ := I_K ≤ ker ρ`. -/
def IsUnramified (ρ : ArtinRep K V) : Prop := TauCeti.inertiaSubgroup K ≤ ρ.ker

/-- **Layer 2.1**, `IsTame ρ := P_K ≤ ker ρ`. -/
def IsTame (ρ : ArtinRep K V) : Prop := TauCeti.wildInertiaSubgroup K ≤ ρ.ker

theorem isUnramified_iff_inertiaInvariants_eq_top (ρ : ArtinRep K V) :
    IsUnramified ρ ↔ inertiaInvariants ρ = ⊤ := sorry

theorem isTame_iff_wildInvariants_eq_top (ρ : ArtinRep K V) :
    IsTame ρ ↔ wildInvariants ρ = ⊤ := sorry

theorem inertiaInvariants_le_wildInvariants (ρ : ArtinRep K V) :
    inertiaInvariants ρ ≤ wildInvariants ρ := sorry

/-- **Layer 2.1**, `V^{I_K}` is `G_K`-stable, since `I_K` is normal. -/
theorem inertiaInvariants_mapsTo (ρ : ArtinRep K V) (g : Field.absoluteGaloisGroup K) :
    ∀ x ∈ inertiaInvariants ρ, ρ.toRepresentation g x ∈ inertiaInvariants ρ := sorry

/-- **Layer 2.2**, the local polynomial `P(ρ, X) = det(1 − X ρ(Φ) | V^{I_K})`, the LMFDB's
`LocalFactors` entry, formed at the arithmetic Frobenius lift chosen by
`exists_isArithFrobeniusLift`; `localPolynomial_spec` says every other lift gives the same. -/
def localPolynomial (ρ : ArtinRep K V) : ℂ[X] :=
  (LinearMap.charpoly ((ρ.toRepresentation (TauCeti.exists_isArithFrobeniusLift K).choose).restrict
    (inertiaInvariants_mapsTo ρ _))).reverse

theorem localPolynomial_spec (ρ : ArtinRep K V) {Φ : Field.absoluteGaloisGroup K}
    (hΦ : TauCeti.IsArithFrobeniusLift K Φ) :
    localPolynomial ρ =
      (LinearMap.charpoly
        ((ρ.toRepresentation Φ).restrict (inertiaInvariants_mapsTo ρ Φ))).reverse := sorry

/-- **Layer 2.2**, `localPolynomial_of_isUnramified`: on all of `V`, the reversed characteristic
polynomial of `ρ(Φ)`. -/
theorem localPolynomial_of_isUnramified (ρ : ArtinRep K V) (h : IsUnramified ρ)
    {Φ : Field.absoluteGaloisGroup K} (hΦ : TauCeti.IsArithFrobeniusLift K Φ) :
    localPolynomial ρ = (LinearMap.charpoly (ρ.toRepresentation Φ)).reverse := sorry

theorem localPolynomial_coeff_zero (ρ : ArtinRep K V) : (localPolynomial ρ).coeff 0 = 1 := sorry

theorem natDegree_localPolynomial (ρ : ArtinRep K V) :
    (localPolynomial ρ).natDegree = Module.finrank ℂ (inertiaInvariants ρ) := sorry

theorem localPolynomial_prod {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W]
    [FiniteDimensional ℂ W] (ρ : ArtinRep K V) (ρ' : ArtinRep K W) :
    localPolynomial (prod ρ ρ') = localPolynomial ρ * localPolynomial ρ' := sorry

/-- **Layer 2.2**, the local Euler factor `L_K(s, ρ) = P(ρ, q^{−s})^{−1}`, `q = |𝓀_K|`. -/
def localEulerFactor (ρ : ArtinRep K V) (s : ℂ) : ℂ :=
  ((localPolynomial ρ).eval ((Nat.card 𝓀[K] : ℂ) ^ (-s)))⁻¹

end ArtinRep

end Local

/-! ## Layer 3: local data of a global Artin representation and the Euler product -/

section Global

variable {F : Type*} [Field F] [NumberField F]
variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]

namespace ArtinRep

/-- **Layer 3.1**, the invariants of the finite level under the inertia group of a prime `Q` of the
Artin field (Mathlib's `Ideal.inertia`). -/
def inertiaInvariantsAt (ρ : ArtinRep F V) (Q : Ideal (𝓞 (artinField ρ))) : Submodule ℂ V :=
  Representation.invariants
    ((toFinite ρ).comp (Q.inertia (artinField ρ ≃ₐ[F] artinField ρ)).subtype)

/-- **Layer 3.1**, a Frobenius at `Q` normalises the inertia group at `Q`. -/
theorem inertiaInvariantsAt_mapsTo (ρ : ArtinRep F V) {Q : Ideal (𝓞 (artinField ρ))} [Q.IsPrime]
    {σ : artinField ρ ≃ₐ[F] artinField ρ} (hσ : IsArithFrobAt (𝓞 F) σ Q) :
    ∀ x ∈ inertiaInvariantsAt ρ Q, toFinite ρ σ x ∈ inertiaInvariantsAt ρ Q := sorry

open scoped Classical in
/-- **Layer 3.1**, the local polynomial `P_v(ρ, X)` of a global `ρ` at a finite place `v`, formed
at a chosen prime `Q | v` of the Artin field and arithmetic Frobenius at `Q`, which exist (Tau Ceti
`exists_isArithFrobAt`); it is independent of both choices (`localPolynomialAt_spec`). -/
def localPolynomialAt (ρ : ArtinRep F V) (v : HeightOneSpectrum (𝓞 F)) : ℂ[X] :=
  if h : ∃ Q : Ideal (𝓞 (artinField ρ)), ∃ _ : Q.IsPrime, Q.LiesOver v.asIdeal ∧
      ∃ σ : artinField ρ ≃ₐ[F] artinField ρ, IsArithFrobAt (𝓞 F) σ Q then
    haveI := h.choose_spec.choose
    (LinearMap.charpoly ((toFinite ρ h.choose_spec.choose_spec.2.choose).restrict
      (inertiaInvariantsAt_mapsTo ρ h.choose_spec.choose_spec.2.choose_spec))).reverse
  else 1

theorem localPolynomialAt_spec (ρ : ArtinRep F V) (v : HeightOneSpectrum (𝓞 F))
    (Q : Ideal (𝓞 (artinField ρ))) [Q.IsPrime] [Q.LiesOver v.asIdeal]
    {σ : artinField ρ ≃ₐ[F] artinField ρ} (hσ : IsArithFrobAt (𝓞 F) σ Q) :
    localPolynomialAt ρ v =
      (LinearMap.charpoly ((toFinite ρ σ).restrict (inertiaInvariantsAt_mapsTo ρ hσ))).reverse :=
  sorry

/-- **Layer 3.1**, `IsUnramifiedAt ρ v`: every prime of the Artin field above `v` is unramified
over `𝓞 F`, equivalently `I_Q ≤ ker (toFinite ρ)`, equivalently `a_v(ρ) = 0`. -/
def IsUnramifiedAt (ρ : ArtinRep F V) (v : HeightOneSpectrum (𝓞 F)) : Prop :=
  ∀ (Q : Ideal (𝓞 (artinField ρ))) [Q.IsPrime] [Q.LiesOver v.asIdeal],
    Algebra.IsUnramifiedAt (𝓞 F) Q

/-- **Layer 3.1**, the Artin field has finitely many ramified primes. -/
theorem finite_setOf_not_isUnramifiedAt (ρ : ArtinRep F V) :
    {v : HeightOneSpectrum (𝓞 F) | ¬ IsUnramifiedAt ρ v}.Finite := sorry

/-- **Layer 3.1**, the ramified set, the LMFDB's `BadPrimes`. -/
def ramifiedSet (ρ : ArtinRep F V) : Finset (HeightOneSpectrum (𝓞 F)) :=
  (finite_setOf_not_isUnramifiedAt ρ).toFinset

theorem mem_ramifiedSet_iff (ρ : ArtinRep F V) (v : HeightOneSpectrum (𝓞 F)) :
    v ∈ ramifiedSet ρ ↔ ¬ IsUnramifiedAt ρ v :=
  Set.Finite.mem_toFinset _

open scoped Classical in
/-- **Layer 3.1**, the characteristic polynomial of Frobenius, formed at a chosen arithmetic
Frobenius at a prime above `v` and meaningful at an unramified place, where `frobeniusCharpoly_spec`
pins it; the arithmetic good polynomial `X² − a_p X + ψ(p)` of the weight-one dictionary
(Layer 8.2). -/
def frobeniusCharpoly (ρ : ArtinRep F V) (v : HeightOneSpectrum (𝓞 F)) : ℂ[X] :=
  if h : ∃ Q : Ideal (𝓞 (artinField ρ)), ∃ _ : Q.IsPrime, Q.LiesOver v.asIdeal ∧
      ∃ σ : artinField ρ ≃ₐ[F] artinField ρ, IsArithFrobAt (𝓞 F) σ Q then
    LinearMap.charpoly (toFinite ρ h.choose_spec.choose_spec.2.choose)
  else 1

theorem frobeniusCharpoly_spec (ρ : ArtinRep F V) {v : HeightOneSpectrum (𝓞 F)}
    (hv : IsUnramifiedAt ρ v) (Q : Ideal (𝓞 (artinField ρ))) [Q.IsPrime] [Q.LiesOver v.asIdeal]
    {σ : artinField ρ ≃ₐ[F] artinField ρ} (hσ : IsArithFrobAt (𝓞 F) σ Q) :
    frobeniusCharpoly ρ v = LinearMap.charpoly (toFinite ρ σ) := sorry

/-- **Layer 3.1**, at an unramified place the local polynomial is the reversed characteristic
polynomial; at a ramified one it is **not** (the `23`-adic factor `1 − X` of `2.23.3t2.b.a`). -/
theorem localPolynomialAt_eq_reverse_frobeniusCharpoly (ρ : ArtinRep F V)
    {v : HeightOneSpectrum (𝓞 F)} (hv : IsUnramifiedAt ρ v) :
    localPolynomialAt ρ v = (frobeniusCharpoly ρ v).reverse := sorry

/-- **Layer 3.1**, the trace of Frobenius `a_v(ρ) = χ(Frob_v)`, read off the monic
`frobeniusCharpoly` as minus its next-to-leading coefficient. -/
def frobeniusTrace (ρ : ArtinRep F V) (v : HeightOneSpectrum (𝓞 F)) : ℂ :=
  -(frobeniusCharpoly ρ v).nextCoeff

theorem localPolynomialAt_prod {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W]
    [FiniteDimensional ℂ W] (ρ : ArtinRep F V) (ρ' : ArtinRep F W) (v : HeightOneSpectrum (𝓞 F)) :
    localPolynomialAt (prod ρ ρ') v = localPolynomialAt ρ v * localPolynomialAt ρ' v := sorry

theorem localPolynomialAt_dual (ρ : ArtinRep F V) (v : HeightOneSpectrum (𝓞 F)) :
    localPolynomialAt (dual ρ) v = (localPolynomialAt ρ v).map (starRingEnd ℂ) := sorry

open scoped Classical in
/-- **Layer 3.3**, `n₋(ρ, v)`: the dimension of the `−1`-eigenspace of a complex conjugation at a
real place `v`, read at a chosen complex place `w | v` of the Artin field through Tau Ceti's
`complexConjugationAt`, and `0` when every place above `v` is real (conjugation acts trivially);
`nMinus_spec` says every complex `w | v` gives the same. -/
def nMinus (ρ : ArtinRep F V) (v : InfinitePlace F) (_hv : v.IsReal) : ℕ :=
  if h : ∃ (w : InfinitePlace (artinField ρ)) (_ : w.IsRamified F),
      w.comap (algebraMap F (artinField ρ)) = v then
    Module.finrank ℂ (Module.End.eigenspace
      (toFinite ρ (TauCeti.NumberField.complexConjugationAt F h.choose h.choose_spec.choose)) (-1))
  else 0

theorem nMinus_spec (ρ : ArtinRep F V) (v : InfinitePlace F) (hv : v.IsReal)
    (w : InfinitePlace (artinField ρ)) (hw : w.IsRamified F)
    (hwv : w.comap (algebraMap F (artinField ρ)) = v) :
    nMinus ρ v hv =
      Module.finrank ℂ (Module.End.eigenspace
        (toFinite ρ (TauCeti.NumberField.complexConjugationAt F w hw)) (-1)) := sorry

theorem nMinus_le_finrank (ρ : ArtinRep F V) (v : InfinitePlace F) (hv : v.IsReal) :
    nMinus ρ v hv ≤ Module.finrank ℂ V := sorry

/-- **Layer 3.3**, when a place of the Artin field above `v` is real, complex conjugation acts
trivially (Tau Ceti `complexConjugationAt_restrictNormal_eq_one_of_isReal`) and `n₋ = 0`; the places
above `v` are permuted transitively by `Gal(K_ρ/F)`, so one real place above `v` means all are. -/
theorem nMinus_eq_zero_of_isUnramified (ρ : ArtinRep F V) (v : InfinitePlace F) (hv : v.IsReal)
    (w : InfinitePlace (artinField ρ)) (hw : w.IsUnramified F)
    (hwv : w.comap (algebraMap F (artinField ρ)) = v) : nMinus ρ v hv = 0 := sorry

/-- **Layer 3.3**, `n₊(ρ, v) = dim V − n₋(ρ, v)`. -/
def nPlus (ρ : ArtinRep F V) (v : InfinitePlace F) (hv : v.IsReal) : ℕ :=
  Module.finrank ℂ V - nMinus ρ v hv

/-- **Layer 3.3**, the trace of complex conjugation `n₊ − n₋ = χ(c)`, the LMFDB's
`trace_complex_conjugation`. -/
def traceOfComplexConjugation (ρ : ArtinRep F V) (v : InfinitePlace F) (hv : v.IsReal) : ℤ :=
  (nPlus ρ v hv : ℤ) - nMinus ρ v hv

/-- **Layer 3.3 / 7.1**, parity at a real place is a property of the **determinant**:
`det ρ(c) = −1` for a complex conjugation `c`, witnessed at a complex place `w` of the Artin field
above `v` (Tau Ceti's `complexConjugationAt`); the conjugations at the places above `v` are
conjugate, so one witness is every witness. Stated existentially: when no place above `v` is complex,
`ρ(c) = 1` and `ρ` is even, which a universal statement would get wrong by vacuity. An even `ρ` may
have `ρ(c) = −1`. -/
def IsOddAt (ρ : ArtinRep F V) (v : InfinitePlace F) (_hv : v.IsReal) : Prop :=
  ∃ (w : InfinitePlace (artinField ρ)) (hw : w.IsRamified F),
    w.comap (algebraMap F (artinField ρ)) = v ∧
      LinearMap.det (toFinite ρ (TauCeti.NumberField.complexConjugationAt F w hw)) = -1

/-- **Layer 3.3**, `det ρ(c) = (−1)^{n₋}`, so oddness is the parity of `n₋`. -/
theorem isOddAt_iff_odd_nMinus (ρ : ArtinRep F V) (v : InfinitePlace F) (hv : v.IsReal) :
    IsOddAt ρ v hv ↔ Odd (nMinus ρ v hv) := sorry

/-- **Layer 3.4**, the local Euler factor at `v`, `P_v(ρ, Nv^{−s})^{−1}`. -/
def localEulerFactorAt (ρ : ArtinRep F V) (v : HeightOneSpectrum (𝓞 F)) (s : ℂ) : ℂ :=
  ((localPolynomialAt ρ v).eval ((Ideal.absNorm v.asIdeal : ℂ) ^ (-s)))⁻¹

/-- **Layer 3.4**, the Euler product `L(s, ρ) = ∏_v L_v(s, ρ)` over **all** finite places, as a
`tprod`; it is the function it should be on `Re s > 1` (`multipliable_localEulerFactorAt`) and is
not asserted to mean anything elsewhere (`artinLFunctionC` is the continuation). -/
def artinLSeries (ρ : ArtinRep F V) (s : ℂ) : ℂ := ∏' v, localEulerFactorAt ρ v s

theorem multipliable_localEulerFactorAt (ρ : ArtinRep F V) {s : ℂ} (hs : 1 < s.re) :
    Multipliable (fun v ↦ localEulerFactorAt ρ v s) := sorry

theorem artinLSeries_ne_zero (ρ : ArtinRep F V) {s : ℂ} (hs : 1 < s.re) :
    artinLSeries ρ s ≠ 0 := sorry

/-- **Layer 3.4**, additivity. -/
theorem artinLSeries_prod {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W]
    [FiniteDimensional ℂ W] (ρ : ArtinRep F V) (ρ' : ArtinRep F W) {s : ℂ} (hs : 1 < s.re) :
    artinLSeries (prod ρ ρ') s = artinLSeries ρ s * artinLSeries ρ' s := sorry

/-- **Layer 3.4**, the trivial representation gives the Dedekind zeta function. -/
theorem artinLSeries_trivial {s : ℂ} (hs : 1 < s.re) :
    artinLSeries (trivial : ArtinRep F ℂ) s = dedekindZeta F s := sorry

/-! ## Layer 4: continuation, the functional equation and the root number -/

/-- **Layer 4.1**, the meromorphic Artin L-function: the meromorphic continuation of `artinLSeries ρ`
from `Re s > 1`, taken in Mathlib's meromorphic normal form (`MeromorphicNFOn`), which fixes its
values at removable singularities. Such a function exists by Brauer induction through the Hecke
L-functions of the L-functions roadmap (`artinLFunctionC_eqOn`, `meromorphicOn_artinLFunctionC`)
and is unique (`artinLFunctionC_unique`). -/
def artinLFunctionC (ρ : ArtinRep F V) : ℂ → ℂ :=
  Classical.epsilon fun f : ℂ → ℂ ↦
    MeromorphicNFOn f Set.univ ∧ Set.EqOn f (artinLSeries ρ) {s | 1 < s.re}

theorem artinLFunctionC_eqOn (ρ : ArtinRep F V) :
    Set.EqOn (artinLFunctionC ρ) (artinLSeries ρ) {s | 1 < s.re} := sorry

theorem meromorphicOn_artinLFunctionC (ρ : ArtinRep F V) :
    MeromorphicOn (artinLFunctionC ρ) Set.univ := sorry

/-- **Layer 4.1**, uniqueness as punctured germs at every point. -/
theorem artinLFunctionC_unique (ρ : ArtinRep F V) {f : ℂ → ℂ} (hf : MeromorphicOn f Set.univ)
    (h : Set.EqOn f (artinLSeries ρ) {s | 1 < s.re}) (s : ℂ) :
    f =ᶠ[𝓝[≠] s] artinLFunctionC ρ := sorry

theorem artinLFunctionC_prod {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W]
    [FiniteDimensional ℂ W] (ρ : ArtinRep F V) (ρ' : ArtinRep F W) (s : ℂ) :
    artinLFunctionC (prod ρ ρ') =ᶠ[𝓝[≠] s] fun s ↦ artinLFunctionC ρ s * artinLFunctionC ρ' s :=
  sorry

/-- **Layer 4.1**, the pole at `s = 1` has order exactly `dim V^{G_F}`; holomorphy elsewhere is
Artin's conjecture, not a theorem here. -/
theorem meromorphicOrderAt_artinLFunctionC_one (ρ : ArtinRep F V) :
    meromorphicOrderAt (artinLFunctionC ρ) 1 =
      -(Module.finrank ℂ ρ.toRepresentation.invariants : ℤ) := sorry

/-- **Layer 4.1**, holomorphy and nonvanishing on `Re s > 1`. -/
theorem analyticAt_artinLFunctionC (ρ : ArtinRep F V) {s : ℂ} (hs : 1 < s.re) :
    AnalyticAt ℂ (artinLFunctionC ρ) s := sorry

open scoped Classical in
/-- **Layer 4.2**, the archimedean factor
`∏_{v real} Γ_ℝ(s)^{n₊} Γ_ℝ(s+1)^{n₋} · ∏_{v complex} Γ_ℂ(s)^{dim V}`. -/
def gammaFactor (ρ : ArtinRep F V) (s : ℂ) : ℂ :=
  ∏ v : InfinitePlace F,
    if hv : v.IsReal then Gammaℝ s ^ nPlus ρ v hv * Gammaℝ (s + 1) ^ nMinus ρ v hv
    else Gammaℂ s ^ Module.finrank ℂ V

/-- **Layer 4.2**, bridge check (not `sorry`): the duplication formula behind the inductivity of
`gammaFactor` (a complex place above a real one contributes `Γ_ℂ = Γ_ℝ(s) Γ_ℝ(s+1)`). -/
theorem Gammaℂ_eq_Gammaℝ_mul_Gammaℝ_add_one (s : ℂ) : Gammaℂ s = Gammaℝ s * Gammaℝ (s + 1) :=
  (Gammaℝ_mul_Gammaℝ_add_one s).symm

open scoped Classical in
/-- **Layer 4.4**, the order of vanishing at `s = 0`:
`Σ_{v | ∞} dim V^{G_v} − dim V^{G_F}` (Tate 1984, Ch. I, Prop. 3.4). -/
theorem meromorphicOrderAt_artinLFunctionC_zero (ρ : ArtinRep F V) :
    meromorphicOrderAt (artinLFunctionC ρ) 0 =
      ((∑ v : InfinitePlace F,
          if hv : v.IsReal then nPlus ρ v hv else Module.finrank ℂ V : ℕ) : ℤ) -
        (Module.finrank ℂ ρ.toRepresentation.invariants : ℤ) := sorry

/-! ## Layer 7: the LMFDB invariants -/

/-- **Layer 7.4**, `IsStemField ρ E`: the Galois closure of `E` over `F` is the Artin field,
equivalently `Gal(K_ρ/E)` is core-free in `Gal(K_ρ/F)`. The LMFDB's `NFGal` is one stem field of
minimal degree; which one is a database convention, not a target. -/
def IsStemField (ρ : ArtinRep F V) (E : IntermediateField F (artinField ρ)) : Prop :=
  E.fixingSubgroup.normalCore = ⊥

theorem isStemField_top (ρ : ArtinRep F V) : IsStemField ρ ⊤ := sorry

/-- **Layer 7.5**, the projective representation `G_F → GL(V)/ℂ^×`. -/
def projective (ρ : ArtinRep F V) :
    Field.absoluteGaloisGroup F →* (V →L[ℂ] V)ˣ ⧸ Subgroup.center (V →L[ℂ] V)ˣ :=
  (QuotientGroup.mk' (Subgroup.center (V →L[ℂ] V)ˣ)).comp ρ.toMonoidHom.toHomUnits

/-- **Layer 7.5**, the projective image, the LMFDB's `Proj_GAP` up to isomorphism. -/
def projectiveImage (ρ : ArtinRep F V) : Subgroup ((V →L[ℂ] V)ˣ ⧸ Subgroup.center (V →L[ℂ] V)ˣ) :=
  (projective ρ).range

/-- **Layer 7.5**, the projective field `fixedField (ker Pρ)`, the LMFDB's `Proj_Polynomial`'s
Galois closure. -/
def projectiveField (ρ : ArtinRep F V) : IntermediateField F (AlgebraicClosure F) :=
  IntermediateField.fixedField (projective ρ).ker

theorem projectiveField_le_artinField (ρ : ArtinRep F V) : projectiveField ρ ≤ artinField ρ :=
  sorry

/-- **Layer 7.5**, the projective kernel is read off the character table: `|χ(g)| = dim ρ`. -/
theorem mem_ker_projective_iff (ρ : ArtinRep F V) (g : Field.absoluteGaloisGroup F) :
    g ∈ (projective ρ).ker ↔ ‖character ρ g‖ = Module.finrank ℂ V := sorry

/-- **Layer 7.6**, the five projective types in dimension two: cyclic, dihedral `D_n` of order `2n`
(`n ≥ 2`, `D₂ = V₄`), `A₄`, `S₄`, `A₅`, the LMFDB's `projective_image_type`. -/
def IsCyclicType (ρ : ArtinRep F V) : Prop := IsCyclic (projectiveImage ρ)

def IsDihedralType (ρ : ArtinRep F V) (n : ℕ) : Prop :=
  2 ≤ n ∧ Nonempty (projectiveImage ρ ≃* DihedralGroup n)

def IsTetrahedralType (ρ : ArtinRep F V) : Prop :=
  Nonempty (projectiveImage ρ ≃* alternatingGroup (Fin 4))

def IsOctahedralType (ρ : ArtinRep F V) : Prop :=
  Nonempty (projectiveImage ρ ≃* Equiv.Perm (Fin 4))

def IsIcosahedralType (ρ : ArtinRep F V) : Prop :=
  Nonempty (projectiveImage ρ ≃* alternatingGroup (Fin 5))

/-- **Layer 7.6**, Klein's classification of the finite subgroups of `PGL₂(ℂ)`, proved (five
cases), not certified. -/
theorem klein_classification (Γ : Subgroup (Matrix.ProjGenLinGroup (Fin 2) ℂ)) [Finite Γ] :
    IsCyclic Γ ∨ (∃ n, 2 ≤ n ∧ Nonempty (Γ ≃* DihedralGroup n)) ∨
      Nonempty (Γ ≃* alternatingGroup (Fin 4)) ∨ Nonempty (Γ ≃* Equiv.Perm (Fin 4)) ∨
        Nonempty (Γ ≃* alternatingGroup (Fin 5)) := sorry

/-- **Layer 7.6**, the five predicates are exhaustive in dimension two. -/
theorem projectiveType_exhaustive (ρ : ArtinRep F V) (h : Module.finrank ℂ V = 2) :
    IsCyclicType ρ ∨ (∃ n, IsDihedralType ρ n) ∨ IsTetrahedralType ρ ∨ IsOctahedralType ρ ∨
      IsIcosahedralType ρ := sorry

/-- **Layer 7.6**, an irreducible two-dimensional `ρ` is never of cyclic type. -/
theorem not_isCyclicType (ρ : ArtinRep F V) (h : Module.finrank ℂ V = 2)
    [Representation.IsIrreducible ρ.toRepresentation] : ¬ IsCyclicType ρ := sorry

/-- **Layer 7.7**, the container degree: the least index of a subgroup `H ≤ Gal(K_ρ/F)` with
`V^{H} ≠ 0`; by Frobenius reciprocity, the least degree of a permutation representation containing
`ρ`. The LMFDB's `Container` is this degree with a `T`-number that is not formed here. -/
def containerDegree (ρ : ArtinRep F V) : ℕ :=
  sInf {n | ∃ H : Subgroup (artinField ρ ≃ₐ[F] artinField ρ),
    H.index = n ∧ Representation.invariants ((toFinite ρ).comp H.subtype) ≠ ⊥}

theorem containerDegree_le_card (ρ : ArtinRep F V) [Nontrivial V] :
    containerDegree ρ ≤ Nat.card (image ρ) := sorry

theorem containerDegree_eq_one_iff (ρ : ArtinRep F V) [Nontrivial V] :
    containerDegree ρ = 1 ↔ ρ.ker = ⊤ := sorry

/-- **Layer 7.8**, the bad primes are the primes ramified in the Artin field, since `toFinite ρ` is
faithful. The LMFDB's `HardPrimes` (the primes dividing the discriminant of its stored defining
polynomial) is a stored set, not a target, and has no declaration here. -/
theorem mem_ramifiedSet_iff_exists_not_isUnramifiedAt (ρ : ArtinRep F V)
    (v : HeightOneSpectrum (𝓞 F)) :
    v ∈ ramifiedSet ρ ↔ ∃ (Q : Ideal (𝓞 (artinField ρ))) (_ : Q.IsPrime),
      Q.LiesOver v.asIdeal ∧ ¬ Algebra.IsUnramifiedAt (𝓞 F) Q := sorry

/-! ## Layer 8: Artin's conjecture as a statement -/

/-- **Layer 8.1**, `ArtinHolomorphic ρ`: `L(s, ρ)` is analytic away from `s = 1`, where its pole has
order `dim V^{G_F}`. -/
def ArtinHolomorphic (ρ : ArtinRep F V) : Prop :=
  (∀ s : ℂ, s ≠ 1 → AnalyticAt ℂ (artinLFunctionC ρ) s) ∧
    meromorphicOrderAt (artinLFunctionC ρ) 1 =
      -(Module.finrank ℂ ρ.toRepresentation.invariants : ℤ)

/-- **Layer 8.1**, one-dimensional representations satisfy Artin's conjecture (Hecke). -/
theorem artinHolomorphic_of_finrank_eq_one (ρ : ArtinRep F V) (h : Module.finrank ℂ V = 1) :
    ArtinHolomorphic ρ := sorry

theorem artinHolomorphic_prod {W : Type*} [NormedAddCommGroup W] [NormedSpace ℂ W]
    [FiniteDimensional ℂ W] {ρ : ArtinRep F V} {ρ' : ArtinRep F W} (h : ArtinHolomorphic ρ)
    (h' : ArtinHolomorphic ρ') : ArtinHolomorphic (prod ρ ρ') := sorry

end ArtinRep

/-- **Layer 8.1**, **Artin's conjecture** for the number field `F`, as a proposition. Every
finite-dimensional complex representation is isomorphic to one on `Fin n → ℂ`, so quantifying over
those loses nothing and pins no universe. -/
def ArtinConjecture (F : Type*) [Field F] [NumberField F] : Prop :=
  ∀ (n : ℕ) (ρ : ArtinRep F (Fin n → ℂ)), ArtinRep.ArtinHolomorphic ρ

end Global

/-! ## Layer 9: finite-image representations over finite fields -/

section ModL

variable (F : Type*) [Field F] (n : ℕ) (𝔽 : Type*) [Field 𝔽] [Finite 𝔽]

/-- **Layer 9.1**, the carrier: a homomorphism `G_F →* GL_n(𝔽)` with open kernel, equivalently
continuous for the discrete topology on the finite field `𝔽`. -/
structure ModLRep where
  toMonoidHom : Field.absoluteGaloisGroup F →* GL (Fin n) 𝔽
  isOpen_ker : IsOpen (toMonoidHom.ker : Set (Field.absoluteGaloisGroup F))

namespace ModLRep

variable {F n 𝔽}

instance : CoeFun (ModLRep F n 𝔽) (fun _ ↦ Field.absoluteGaloisGroup F → GL (Fin n) 𝔽) :=
  ⟨fun ρ ↦ ρ.toMonoidHom⟩

/-- **Layer 9.1**, the trivial representation: the non-vacuity constructor of the carrier. -/
def trivial : ModLRep F n 𝔽 where
  toMonoidHom := 1
  isOpen_ker := by rw [MonoidHom.ker_one, Subgroup.coe_top]; exact isOpen_univ

/-- **Layer 9.1**, the splitting field, the LMFDB's `splitting_field` (its minimal sibling is not
a target). -/
def splittingField (ρ : ModLRep F n 𝔽) : IntermediateField F (AlgebraicClosure F) :=
  IntermediateField.fixedField ρ.toMonoidHom.ker

theorem finiteDimensional_splittingField (ρ : ModLRep F n 𝔽) :
    FiniteDimensional F (splittingField ρ) := sorry

theorem isGalois_splittingField (ρ : ModLRep F n 𝔽) : IsGalois F (splittingField ρ) := sorry

instance (ρ : ModLRep F n 𝔽) : FiniteDimensional F (splittingField ρ) :=
  finiteDimensional_splittingField ρ
instance (ρ : ModLRep F n 𝔽) : IsGalois F (splittingField ρ) := isGalois_splittingField ρ

/-- **Layer 9.1**, the image in the codomain `GL_n(𝔽)`, the LMFDB's `image_label`'s group. -/
def image (ρ : ModLRep F n 𝔽) : Subgroup (GL (Fin n) 𝔽) := ρ.toMonoidHom.range

/-- **Layer 9.1**, `image_order`. -/
def imageOrder (ρ : ModLRep F n 𝔽) : ℕ := Nat.card (image ρ)

/-- **Layer 9.1**, `image_index`, the index of the image in the codomain. -/
def imageIndex (ρ : ModLRep F n 𝔽) : ℕ := (image ρ).index

/-- **Layer 9.1**, `is_surjective`. -/
def IsSurjective (ρ : ModLRep F n 𝔽) : Prop := Function.Surjective ρ

theorem isSurjective_iff_imageIndex_eq_one (ρ : ModLRep F n 𝔽) :
    IsSurjective ρ ↔ imageIndex ρ = 1 := sorry

theorem card_image (ρ : ModLRep F n 𝔽) : imageOrder ρ = Module.finrank F (splittingField ρ) :=
  sorry

/-- **Layer 9.1**, the determinant `G_F →* 𝔽ˣ`, the LMFDB's `determinant_label`'s character. -/
def det (ρ : ModLRep F n 𝔽) : Field.absoluteGaloisGroup F →* 𝔽ˣ :=
  Matrix.GeneralLinearGroup.det.comp ρ.toMonoidHom

/-- **Layer 9.1**, `determinant_index = [𝔽ˣ : det ρ̄(G_F)]`. -/
def determinantIndex (ρ : ModLRep F n 𝔽) : ℕ := (det ρ).range.index

/-- **Layer 9.1**, `is_solvable` of the image. -/
def IsSolvableImage (ρ : ModLRep F n 𝔽) : Prop := Group.IsSolvable (image ρ)

/-- **Layer 9.1**, the underlying linear representation on `Fin n → 𝔽`. -/
def toRepresentation (ρ : ModLRep F n 𝔽) :
    Representation 𝔽 (Field.absoluteGaloisGroup F) (Fin n → 𝔽) :=
  (Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp ρ.toMonoidHom)

/-- **Layer 9.1**, irreducibility over `𝔽`. -/
def IsIrreducible (ρ : ModLRep F n 𝔽) : Prop := Representation.IsIrreducible (toRepresentation ρ)

/-- **Layer 9.1**, the base change to `𝔽̄`, entrywise. -/
def baseChange (ρ : ModLRep F n 𝔽) :
    Field.absoluteGaloisGroup F →* GL (Fin n) (AlgebraicClosure 𝔽) :=
  (Units.map (algebraMap 𝔽 (AlgebraicClosure 𝔽)).mapMatrix.toMonoidHom).comp ρ.toMonoidHom

/-- **Layer 9.1**, `is_absolutely_irreducible`: irreducible after base change to `𝔽̄`. -/
def IsAbsolutelyIrreducible (ρ : ModLRep F n 𝔽) : Prop :=
  Representation.IsIrreducible
    ((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp (baseChange ρ)))

theorem IsAbsolutelyIrreducible.isIrreducible {ρ : ModLRep F n 𝔽} (h : IsAbsolutelyIrreducible ρ) :
    IsIrreducible ρ := sorry

/-- **Layer 9.4**, the projective kernel field, the LMFDB's `projective_kernel_polynomial`'s
field. -/
def projectiveKernelField (ρ : ModLRep F n 𝔽) : IntermediateField F (AlgebraicClosure F) :=
  IntermediateField.fixedField
    ((QuotientGroup.mk' (Subgroup.center (GL (Fin n) 𝔽))).comp ρ.toMonoidHom).ker

theorem projectiveKernelField_le_splittingField (ρ : ModLRep F n 𝔽) :
    projectiveKernelField ρ ≤ splittingField ρ := sorry

section NumberField

variable [NumberField F]

/-- **Layer 9.2**, unramified at `v`: every prime of the splitting field above `v` is unramified. -/
def IsUnramifiedAt (ρ : ModLRep F n 𝔽) (v : HeightOneSpectrum (𝓞 F)) : Prop :=
  ∀ (Q : Ideal (𝓞 (splittingField ρ))) [Q.IsPrime] [Q.LiesOver v.asIdeal],
    Algebra.IsUnramifiedAt (𝓞 F) Q

/-- **Layer 9.2**, a good prime: unramified and not above `ℓ = char 𝔽`, the LMFDB's
`frobenius_prime`. -/
def IsGoodPrime (ρ : ModLRep F n 𝔽) (v : HeightOneSpectrum (𝓞 F)) : Prop :=
  IsUnramifiedAt ρ v ∧ (ringChar 𝔽 : 𝓞 F) ∉ v.asIdeal

open scoped Classical in
/-- **Layer 9.3**, the Frobenius class, the class of `ρ(g)` for a chosen `g ∈ G_F` restricting to an
arithmetic Frobenius at a prime of the splitting field above `v`; meaningful at a good prime, where
`frobeniusClass_spec` pins it. -/
def frobeniusClass (ρ : ModLRep F n 𝔽) (v : HeightOneSpectrum (𝓞 F)) : ConjClasses (GL (Fin n) 𝔽) :=
  if h : ∃ g : Field.absoluteGaloisGroup F, ∃ Q : Ideal (𝓞 (splittingField ρ)), ∃ _ : Q.IsPrime,
      Q.LiesOver v.asIdeal ∧
        IsArithFrobAt (𝓞 F) (AlgEquiv.restrictNormalHom (splittingField ρ) g) Q then
    ConjClasses.mk (ρ h.choose)
  else ConjClasses.mk 1

theorem frobeniusClass_spec (ρ : ModLRep F n 𝔽) {v : HeightOneSpectrum (𝓞 F)} (hv : IsGoodPrime ρ v)
    (Q : Ideal (𝓞 (splittingField ρ))) [Q.IsPrime] [Q.LiesOver v.asIdeal]
    {σ : splittingField ρ ≃ₐ[F] splittingField ρ} (hσ : IsArithFrobAt (𝓞 F) σ Q)
    {g : Field.absoluteGaloisGroup F} (hg : AlgEquiv.restrictNormalHom (splittingField ρ) g = σ) :
    frobeniusClass ρ v = ConjClasses.mk (ρ g) := sorry

/-- **Layer 9.3**, the Frobenius characteristic polynomial at a good prime, the LMFDB's
`frobenius_matrices` table: the characteristic polynomial of a representative of the class. -/
def frobeniusCharpoly (ρ : ModLRep F n 𝔽) (v : HeightOneSpectrum (𝓞 F)) : 𝔽[X] :=
  Matrix.charpoly ((frobeniusClass ρ v).exists_rep.choose : Matrix (Fin n) (Fin n) 𝔽)

theorem frobeniusCharpoly_spec (ρ : ModLRep F n 𝔽) {v : HeightOneSpectrum (𝓞 F)}
    (hv : IsGoodPrime ρ v) {g : GL (Fin n) 𝔽} (hg : g ∈ (frobeniusClass ρ v).carrier) :
    frobeniusCharpoly ρ v = Matrix.charpoly (g : Matrix (Fin n) (Fin n) 𝔽) := sorry

/-- **Layer 9.3**, a generating set of good primes: the Frobenius classes generate the image (the
LMFDB's `generating_primes` fixes representatives and a canonical choice, which is not a
target). -/
def IsGeneratingSet (ρ : ModLRep F n 𝔽) (P : Finset (HeightOneSpectrum (𝓞 F))) : Prop :=
  (∀ p ∈ P, IsGoodPrime ρ p) ∧
    Subgroup.closure (⋃ p ∈ P, (frobeniusClass ρ p).carrier) = image ρ

/-- **Layer 9.3**, a generating set exists (Chebotarev). -/
theorem exists_isGeneratingSet (ρ : ModLRep F n 𝔽) :
    ∃ P : Finset (HeightOneSpectrum (𝓞 F)), IsGeneratingSet ρ P := sorry

/-- **Layer 9.3**, Chebotarev recognition (Brauer–Nesbitt on a dense set of classes, the
arithmetic Galois representations roadmap §5.3): semisimple `ρ̄, ρ̄'` with equal Frobenius
characteristic polynomials at all good primes outside a finite set are conjugate over `𝔽̄`. -/
theorem exists_conj_baseChange_of_frobeniusCharpoly_eq (ρ ρ' : ModLRep F n 𝔽)
    [Representation.IsSemisimpleRepresentation (toRepresentation ρ)]
    [Representation.IsSemisimpleRepresentation (toRepresentation ρ')]
    (S : Finset (HeightOneSpectrum (𝓞 F)))
    (h : ∀ v, IsGoodPrime ρ v → IsGoodPrime ρ' v → v ∉ S →
      frobeniusCharpoly ρ v = frobeniusCharpoly ρ' v) :
    ∃ g : GL (Fin n) (AlgebraicClosure 𝔽), ∀ σ, g * baseChange ρ σ * g⁻¹ = baseChange ρ' σ :=
  sorry

end NumberField

end ModLRep

end ModL

end

end TauCetiRoadmap.ArtinRepresentations
