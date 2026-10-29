import Mathlib
import TauCeti.RepresentationTheory.CharacterTable.Wedderburn
import TauCeti.RepresentationTheory.FDRep
import TauCeti.RepresentationTheory.Simple.Basic
import TauCeti.RepresentationTheory.CharacterTable.ClassFunction
import TauCeti.RepresentationTheory.CharacterTable.Kernel
import TauCeti.RepresentationTheory.Tensor.Power
import TauCeti.RepresentationTheory.CharacterTable.Pairing
import TauCeti.RepresentationTheory.CharacterTable.Completeness
import TauCeti.RepresentationTheory.CharacterTable.CentralIdempotent
import TauCeti.RepresentationTheory.CharacterTable.Specification
import TauCeti.RepresentationTheory.CharacterTable.Solvable
import TauCeti.RepresentationTheory.CharacterTable.Galois
import TauCeti.RepresentationTheory.Induction.Cyclotomic.SplittingField
import TauCeti.RepresentationTheory.CharacterTable.Dixon.Cyclotomic.Solver
import TauCeti.RepresentationTheory.RepresentationRing.Injective
import TauCeti.RepresentationTheory.FrobeniusGroup.Basic
import TauCeti.RepresentationTheory.CharacterTable.FrobeniusSchur.Realizability
import TauCeti.RepresentationTheory.CharacterTable.FrobeniusSchur.InvolutionCount
import TauCeti.RepresentationTheory.CharacterTable.RealClasses
import TauCeti.RepresentationTheory.CharacterTable.GL2.PrincipalSeries.Irreducible
import TauCeti.RepresentationTheory.CharacterTable.GL2.Steinberg
import TauCeti.RepresentationTheory.CharacterTable.GL2.Cuspidal.Irreducible
import Mathlib.NumberTheory.NumberField.Cyclotomic.Basic
import Mathlib.NumberTheory.PrimesCongruentOne
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.ConjugacyClasses

/-!
# Character theory and computable character tables: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib has characters as traces and the **first (row) orthogonality relation** `char_orthonormal`,
Maschke's theorem, Schur's lemma, the algebraically-closed Artin-Wedderburn theorem, computable conjugacy
classes, the algebraic-integer and cyclotomic API, and `ZMod p` as a computable field (see `README.md`
for the file-by-file map). The pinned TauCeti library supplies these class-function, class-algebra, completeness, table and
conditional exact-solver APIs. This file consumes them; the remaining targets are explicit
comparison and completeness adapters, not replacement foundational objects.

The design follows the three deliverables of `README.md`: **A** ordinary character theory (`ClassFunction`,
`classSum`, `structureConstant`, Wedderburn/count, the table, `primitiveCentralIdempotent`, the arithmetic
of values); **B** the Dixon-Schneider specification (the coordinate identity, `centralCharacterTable`,
`IsCharacterTableSpec`, labeled uniqueness); **C** the executable algorithm over an **exact** cyclotomic
type (`Cyclotomic e`, `ExactCharTable`, `DixonPrimeData`, `IsGoodDixonPrime`, `kernelBasis`,
`eigenvalueSearch`, `liftCyclotomic`, `characterTableDixon`). `ℂ` is only the specification: the summit
`characterTable_eq` says the **embedded** exact output satisfies the `ℂ`-valued checker. `README.md`
remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.CharacterTheory

open scoped Classical Matrix Pointwise TensorProduct
open Representation MonoidAlgebra

universe u v

/-! ## A. Ordinary character theory and the character table -/

/-! ### Layer 0: class functions and their pairing -/

/-- **Class functions**: the submodule of `G → k` of functions constant on conjugacy classes. Every
character is a member, by `char_conj`. -/
abbrev ClassFunction (k : Type u) (G : Type v) [CommRing k] [Group G] :=
  TauCeti.ClassFunction k G

/-- A class function is the same data as a function on conjugacy classes; this makes the character table
a **square** matrix indexed by classes. -/
noncomputable def classFunctionEquiv (k : Type u) (G : Type v) [CommRing k] [Group G] :
    ClassFunction k G ≃ₗ[k] (ConjClasses G → k) := TauCeti.ClassFunction.equivConjClasses

/-- The dimension of the space of class functions is the number of conjugacy classes. -/
theorem finrank_classFunction (k : Type u) (G : Type v) [Field k] [Group G] [Fintype G] :
    Module.finrank k (ClassFunction k G) = Nat.card (ConjClasses G) := TauCeti.ClassFunction.finrank_eq_card_conjClasses

/-- **The character pairing**: bilinear and symmetric over a general field (*not* Hermitian there); the
`g⁻¹` form matching `char_orthonormal`. Over `ℂ`, a separate lemma identifies it with the Hermitian inner
product on virtual characters. -/
noncomputable def characterPairingFormula {k : Type u} {G : Type v} [Field k] [Group G] [Fintype G]
    (f₁ f₂ : G → k) : k := (Nat.card G : k)⁻¹ * ∑ g : G, f₁ g * f₂ g⁻¹

/-- The actual bundled native pairing on class functions.
Nondegeneracy of the pairing on class functions. The `[Invertible (Nat.card G : k)]` hypothesis is
essential, not decorative: when `char k ∣ |G|` the normalization `(Nat.card G : k)⁻¹` is `0`, the
pairing vanishes identically, and the statement would assert that every class function is zero. -/
noncomputable abbrev characterPairing {k : Type u} {G : Type v} [Field k] [Group G] [Fintype G] :=
  TauCeti.ClassFunction.characterPairing (k := k) (G := G)

/-- The raw finite-sum expression is only the formula of the native bundled pairing. -/
theorem characterPairingFormula_eq_native {k : Type u} {G : Type v} [Field k] [Group G]
    [Fintype G] (f g : ClassFunction k G) :
    characterPairingFormula f.1 g.1 = characterPairing f g :=
  (TauCeti.ClassFunction.characterPairing_apply f g).symm

theorem characterPairing_nondegenerate (k : Type u) (G : Type v) [Field k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] :
    (characterPairing (k := k) (G := G)).Nondegenerate :=
  TauCeti.ClassFunction.characterPairing_nondegenerate

/-! ### Layer 1: the group algebra, its center, and structure constants -/

/-- **The class sum** `∑_{g ∈ C} g ∈ k[G]`. Mathematical native carrier;
its numbered coefficient function below is executable on finite data. -/
noncomputable def classSum (k : Type u) {G : Type v} [Semiring k] [Group G]
    [Fintype G] [DecidableEq G] (C : ConjClasses G) : MonoidAlgebra k G :=
  TauCeti.classSum k C

theorem classSum_mem_center (k : Type u) {G : Type v} [CommRing k] [Group G] [Fintype G]
    [DecidableEq G] (C : ConjClasses G) :
    classSum k C ∈ Subalgebra.center k (MonoidAlgebra k G) := TauCeti.classSum_mem_center k C

/-- The class sums are a basis of the center; its dimension is the number of classes. -/
theorem finrank_center_monoidAlgebra (k : Type u) (G : Type v) [Field k] [Group G] [Fintype G] :
    Module.finrank k (Subalgebra.center k (MonoidAlgebra k G)) = Nat.card (ConjClasses G) := TauCeti.finrank_center_monoidAlgebra k G

/-- **Structure constants** `aᵢⱼₖ = #{(x,y) : x ∈ Cᵢ, y ∈ Cⱼ, x*y = g_k}`. A computable `ℕ`-valued
function; the entire input to Dixon-Schneider. Coercions to `ℤ`, `k`, `ZMod p` are exposed downstream. -/
def structureConstant {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    (Ci Cj Ck : ConjClasses G) : ℕ := TauCeti.structureConstant Ci Cj Ck

theorem classSum_mul (k : Type u) {G : Type v} [CommRing k] [Group G] [Fintype G] [DecidableEq G]
    (Ci Cj : ConjClasses G) :
    classSum k Ci * classSum k Cj
      = ∑ Ck : ConjClasses G, (structureConstant Ci Cj Ck : k) • classSum k Ck := TauCeti.classSum_mul k Ci Cj

/-- Mathematical group-algebra realization of the executable numbered class finset.
Its coefficient function below is executable; the native MonoidAlgebra additive instance is not. -/
noncomputable def classSumOfClassData {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    (k : Type u) [Semiring k] (d : TauCeti.ClassData G) (i : Fin d.numClasses) :
    MonoidAlgebra k G := ∑ g ∈ d.classFinset i, MonoidAlgebra.of k G g

/-- The numbered mathematical sum is the existing native class sum. -/
theorem classSumOfClassData_eq {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    (k : Type u) [Semiring k] (d : TauCeti.ClassData G) (i : Fin d.numClasses) :
    classSumOfClassData k d i = classSum k (d.classOf i) := by
  classical
  ext g
  simp only [classSumOfClassData, classSum, MonoidAlgebra.coeff_sum,
    Finsupp.finsetSum_apply, MonoidAlgebra.of_apply, MonoidAlgebra.coeff_single,
    Finsupp.single_apply, TauCeti.classSum_coeff]
  rw [Finset.sum_ite_eq', if_congr (by
    rw [← Finset.mem_coe, d.coe_classFinset, ConjClasses.mem_carrier_iff_mk_eq]) rfl rfl]

/-- Executable coefficients of the actual numbered class sum, on every finite input. -/
def classSumCoefficientsOfClassData {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    (k : Type u) [Semiring k] (d : TauCeti.ClassData G) (i : Fin d.numClasses) (g : G) : k :=
  if d.index g = i then 1 else 0

/-- The executable coefficients agree with the native mathematical group algebra. -/
theorem classSumCoefficientsOfClassData_eq {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    (k : Type u) [Semiring k] (d : TauCeti.ClassData G) (i : Fin d.numClasses) (g : G) :
    classSumCoefficientsOfClassData k d i g = (classSumOfClassData k d i).coeff g := by
  classical
  rw [classSumOfClassData_eq]
  simp only [classSumCoefficientsOfClassData, classSum, TauCeti.classSum_coeff]
  congr 1
  rw [← d.mem_classFinset, ← Finset.mem_coe, d.coe_classFinset,
    ConjClasses.mem_carrier_iff_mk_eq]

/-- **The integral class center**: each class sum is integral over `ℤ` **as an element of the center**
`Z(ℤ[G])` (the finite `ℤ`-algebra spanned by the class sums, with integer structure constants). Stated
inside `Subalgebra.center` so it carries structural content — in `ℤ[G]` itself the claim is trivial,
since `ℤ[G]` is module-finite over `ℤ`. The base for central-character integrality. -/
theorem isIntegral_classSum {G : Type v} [Group G] [Fintype G] [DecidableEq G] (C : ConjClasses G) :
    IsIntegral ℤ
      (⟨classSum ℤ C, classSum_mem_center ℤ C⟩ :
        Subalgebra.center ℤ (MonoidAlgebra ℤ G)) := TauCeti.isIntegral_classSum C

/-! ### Layer 2: Wedderburn, irreducible indexing, and the count -/

/-- **`k[G] ≅ ∏ Matₙᵢ(k)`** (`k` algebraically closed, `char ∤ |G|`); a **noncomputable** algebra
equivalence over a finite index set of positive-sized matrix blocks. The block/simple-module dictionary
is the separate Layer-2.5 target. -/
theorem exists_algEquiv_pi_matrix (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G]
    [Fintype G] [Invertible (Nat.card G : k)] :
    ∃ (ι : Type) (_ : Fintype ι) (n : ι → ℕ), (∀ i, 0 < n i) ∧
      Nonempty (MonoidAlgebra k G ≃ₐ[k] Π i, Matrix (Fin (n i)) (Fin (n i)) k) := by
  obtain ⟨m, d, hd, he⟩ := TauCeti.exists_algEquiv_pi_matrix k G
  exact ⟨Fin m, inferInstance, d, fun i => Nat.pos_of_ne_zero (hd i).out, he⟩

theorem sum_sq_dim_eq_card (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] {ι : Type} [Fintype ι] (n : ι → ℕ)
    (e : MonoidAlgebra k G ≃ₐ[k] Π i, Matrix (Fin (n i)) (Fin (n i)) k) :
    ∑ i, (n i) ^ 2 = Nat.card G :=
  TauCeti.sum_sq_eq_card_of_algEquiv_pi_matrix e

/-- **The center splits** by central-character evaluation, `Z(k[G]) ≃ (ι → k)`: central characters
**separate points** of the center. The sharp form Layer 5 needs. -/
theorem center_algEquiv_pi (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] {ι : Type} [Fintype ι] (n : ι → ℕ)
    (hn : ∀ i, 0 < n i)
    (e : MonoidAlgebra k G ≃ₐ[k] Π i, Matrix (Fin (n i)) (Fin (n i)) k) :
    Nonempty (Subalgebra.center k (MonoidAlgebra k G) ≃ₐ[k] (ι → k)) := by
  let : ∀ i, NeZero (n i) := fun i => ⟨Nat.ne_of_gt (hn i)⟩
  exact ⟨TauCeti.centerMonoidAlgebraAlgEquivPi e⟩

/-- **#irreducibles = #conjugacy classes.** -/
theorem card_irreps_eq_card_conjClasses (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G]
    [Fintype G] [Invertible (Nat.card G : k)] {ι : Type} [Fintype ι] (n : ι → ℕ)
    (hn : ∀ i, 0 < n i)
    (e : MonoidAlgebra k G ≃ₐ[k] Π i, Matrix (Fin (n i)) (Fin (n i)) k) :
    Fintype.card ι = Nat.card (ConjClasses G) := by
  let : ∀ i, NeZero (n i) := fun i => ⟨Nat.ne_of_gt (hn i)⟩
  exact TauCeti.card_eq_card_conjClasses_of_algEquiv_pi_matrix e

/-! ### Layer 3: the character table, idempotents, completeness, second orthogonality

The native tables index rows by `Fin (Nat.card (ConjClasses G))` (as many irreducibles as classes) and
columns by `ConjClasses G` (labeled). -/

/-- **Completeness**: irreducible characters span the class functions — and only those: every
character is a class function, so the span is contained in `ClassFunction k G` and the correct
completeness statement is the reverse inclusion stated here (spanning all of `G → k` is false for
any nonabelian `G`). -/
theorem irreducibleCharacters_span (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G]
    [Fintype G] [Invertible (Nat.card G : k)] :
    ClassFunction k G ≤ Submodule.span k {f : G → k | ∃ (V : FDRep k G) (_ : CategoryTheory.Simple V),
      (V.character : G → k) = f} := by
  apply le_trans (TauCeti.ClassFunction.le_span_irreducibleCharacters k G)
  apply Submodule.span_mono
  rintro f ⟨n, ρ, hρ, rfl⟩
  refine ⟨FDRep.of ρ, ?_, FDRep.character_of ρ⟩
  apply (FDRep.simple_iff_isIrreducible (FDRep.of ρ)).mpr
  simpa only [FDRep.of_ρ'] using hρ

/-- **Primitive central idempotents** `eχ = (χ(1)/|G|) ∑_g χ(g⁻¹) g ∈ Z(k[G])`; orthogonal idempotents
summing to `1`, the Wedderburn projectors. The connective tissue Layer 5 uses. `char ∤ |G|` is
required for the formula to be idempotent, hence the invertibility hypothesis. -/
noncomputable def primitiveCentralIdempotent {k : Type u} {G : Type v} [Field k]
    [IsAlgClosed k] [Group G] [Fintype G] [Invertible (Nat.card G : k)]
    {V : Type*} [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (ρ : Representation k G V) [ρ.IsIrreducible] : MonoidAlgebra k G :=
  TauCeti.Representation.primitiveCentralIdempotent ρ

/-- **The character table**: `χᵢ(g_C)` for a representative of each class. -/
noncomputable def characterTable (G : Type v) [Group G] [Fintype G] [DecidableEq G] :
    Matrix (Fin (Nat.card (ConjClasses G))) (ConjClasses G) ℂ := TauCeti.characterTable ℂ G

/-- **Second (column) orthogonality**, with the class-size weights, from completeness. -/
theorem char_column_orthogonality (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (C C' : ConjClasses G) :
    ∑ i, characterTable G i C * (starRingEnd ℂ) (characterTable G i C')
      = if C = C' then (Nat.card G : ℂ) / (Nat.card (ConjClasses.carrier C) : ℂ) else 0 := by
  classical
  by_cases h : C = C'
  · simpa only [characterTable, ite_eq_left h] using (TauCeti.sum_characterTable_mul_conj C C')
  · simpa only [characterTable, ite_eq_right h] using (TauCeti.sum_characterTable_mul_conj C C')

-- **Labeled uniqueness** (`characterTable_unique_rows`) is stated in Layer 5, after `IsCharacterTableSpec`.

/-! #### Faithful tensor generation over ℂ

The finite node set and polynomial below are defined from the actual action. Hard new
statements are theorem targets, never unconstrained `Prop` fields or admitted data maps.
The native finite-order trace criterion and tensor/character/Hom adapters are consumed.
-/

namespace FaithfulTensor

open CategoryTheory

variable {G : Type v} [Group G] [Fintype G]

/-- Actual distinct character values; no irreducibility or faithfulness is needed. -/
noncomputable def characterValues (U : FDRep ℂ G) : Finset ℂ := by
  classical
  exact Finset.univ.image U.character

/-- The sharp tensor-generation bound is this positive finite cardinal. -/
noncomputable def characterValueCount (U : FDRep ℂ G) : ℕ := (characterValues U).card

/-- The existing class-function quotient map, not a new class-function carrier. -/
noncomputable def characterOnClasses (U : FDRep ℂ G) : ConjClasses G → ℂ :=
  TauCeti.ClassFunction.toConjClasses (TauCeti.ClassFunction.ofFDRep U)

/-- The Lagrange polynomial selecting the character value at the identity.
Its empty product is one, including for a zero-dimensional representation. -/
noncomputable def identityFibrePolynomial (U : FDRep ℂ G) : Polynomial ℂ := by
  classical
  exact Lagrange.basis (characterValues U) id (U.character 1)

/-- The actual native diagonal tensor power, bundled in the existing finite category. -/
noncomputable def tensorPowerFDRep (U : FDRep ℂ G) (n : ℕ) : FDRep ℂ G :=
  FDRep.of (Representation.tensorPower U.ρ n)

@[simp]
theorem mem_characterValues (U : FDRep ℂ G) (z : ℂ) :
    z ∈ characterValues U ↔ ∃ g : G, U.character g = z := by
  classical
  simp [characterValues]

/-- Representatives disappear through the native class-function quotient map. -/
theorem characterValues_eq_conjClasses_image (U : FDRep ℂ G) :
    characterValues U = Finset.univ.image (characterOnClasses U) := by
  sorry

theorem characterValueCount_pos (U : FDRep ℂ G) : 0 < characterValueCount U := by
  classical
  exact Finset.card_pos.mpr ⟨U.character 1, Finset.mem_image.mpr ⟨1, Finset.mem_univ 1, rfl⟩⟩

theorem characterValueCount_le_card_conjClasses (U : FDRep ℂ G) :
    characterValueCount U ≤ Nat.card (ConjClasses G) := by
  sorry

theorem characterValues_iso {U V : FDRep ℂ G} (e : U ≅ V) :
    characterValues U = characterValues V := by
  classical
  unfold characterValues
  rw [FDRep.char_iso e]

/-- Native finite-order trace criterion plus the actual injective representation. -/
theorem character_eq_degree_iff (U : FDRep ℂ G) (hU : Function.Injective U.ρ) (g : G) :
    U.character g = (Module.finrank ℂ U.V : ℂ) ↔ g = 1 := by
  rw [← FDRep.character_ρ U g,
    Representation.char_eq_finrank_iff U.ρ (isOfFinOrder_of_finite g)]
  constructor
  · intro h
    apply hU
    simpa only [map_one] using h
  · rintro rfl
    exact map_one U.ρ

theorem identityFibrePolynomial_degree (U : FDRep ℂ G) :
    (identityFibrePolynomial U).degree = ((characterValueCount U - 1 : ℕ) : WithBot ℕ) := by
  sorry

/-- First isolate the character fibre; without faithfulness it is the kernel fibre. -/
theorem identityFibrePolynomial_eval (U : FDRep ℂ G) (g : G) :
    (identityFibrePolynomial U).eval (U.character g) =
      if U.character g = U.character 1 then 1 else 0 := by
  sorry

/-- Faithfulness reduces that actual fibre to the singleton identity. -/
theorem identityFibrePolynomial_eval_faithful (U : FDRep ℂ G)
    (hU : Function.Injective U.ρ) (g : G) :
    (identityFibrePolynomial U).eval (U.character g) = if g = 1 then 1 else 0 := by
  sorry

omit [Fintype G] in
/-- Consumes the native tensor-power character formula, including n=0. -/
@[simp]
theorem tensorPowerFDRep_character (U : FDRep ℂ G) (n : ℕ) (g : G) :
    (tensorPowerFDRep U n).character g = U.character g ^ n := by
  change (Representation.tensorPower U.ρ n).character g = U.character g ^ n
  rw [Representation.char_tensorPower, FDRep.character_ρ]

/-- Pairing orientation: first the target tensor power, then the source simple character.
This is just the native categorical pairing-to-Hom identity. -/
theorem tensorPower_pairing_eq_finrank [Invertible (Nat.card G : ℂ)]
    (U X : FDRep ℂ G) (n : ℕ) :
    characterPairingFormula (fun g => U.character g ^ n) X.character =
      (Module.finrank ℂ (X ⟶ tensorPowerFDRep U n) : ℂ) := by
  simpa only [characterPairingFormula, tensorPowerFDRep_character] using
    (FDRep.scalar_product_char_eq_finrank_equivariant X (tensorPowerFDRep U n))

/-- The finite coefficient/pairing interchange; its bound also covers the constant polynomial. -/
theorem polynomial_pairing_eq_coeff_sum (U X : FDRep ℂ G) (p : Polynomial ℂ)
    (hp : p.degree < (characterValueCount U : WithBot ℕ)) :
    characterPairingFormula (fun g => p.eval (U.character g)) X.character =
      ∑ n : Fin (characterValueCount U), p.coeff n.val *
        characterPairingFormula (fun g => U.character g ^ n.val) X.character := by
  sorry

/-- Pairing the isolated identity with an actual representation gives its dimension/order. -/
theorem identityFibrePolynomial_pairing (U : FDRep ℂ G)
    (hU : Function.Injective U.ρ) (X : FDRep ℂ G) :
    characterPairingFormula (fun g => (identityFibrePolynomial U).eval (U.character g)) X.character =
      (Module.finrank ℂ X.V : ℂ) / (Nat.card G : ℂ) := by
  sorry

/-- Each actual simple object occurs in one of the first r tensor powers of a faithful U.
U is not required to be nonzero, irreducible, self-dual or two-dimensional. -/
theorem exists_pos_finrank_hom_tensorPower (U : FDRep ℂ G)
    (hU : Function.Injective U.ρ) (X : FDRep ℂ G) [CategoryTheory.Simple X] :
    ∃ n : ℕ, n < characterValueCount U ∧
      0 < Module.finrank ℂ (X ⟶ tensorPowerFDRep U n) := by
  sorry

/-- The weaker bound by the number of actual conjugacy classes. -/
theorem exists_pos_finrank_hom_tensorPower_lt_card_conjClasses (U : FDRep ℂ G)
    (hU : Function.Injective U.ρ) (X : FDRep ℂ G) [CategoryTheory.Simple X] :
    ∃ n : ℕ, n < Nat.card (ConjClasses G) ∧
      0 < Module.finrank ℂ (X ⟶ tensorPowerFDRep U n) := by
  obtain ⟨n, hn, hpos⟩ := exists_pos_finrank_hom_tensorPower U hU X
  exact ⟨n, lt_of_lt_of_le hn (characterValueCount_le_card_conjClasses U), hpos⟩

/-- Nonzero maps from the actual simple representation are injective; this supplies occurrence
on the module spine before the existing semisimple regrouping extracts a direct summand. -/
theorem exists_injective_intertwiner_tensorPower (U : FDRep ℂ G)
    (hU : Function.Injective U.ρ) (X : FDRep ℂ G) [CategoryTheory.Simple X] :
    ∃ n : ℕ, n < characterValueCount U ∧
      ∃ f : Representation.IntertwiningMap X.ρ (Representation.tensorPower U.ρ n), Function.Injective f := by
  sorry

/-- Arbitrary carrier universes use the existing shrink/finite-model adapter, not a new
irreducible quotient. Its character-value bound is invariant under that equivalence. -/
theorem exists_pos_finrank_intertwining_tensorPower
    {V W : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    [AddCommGroup W] [Module ℂ W] [FiniteDimensional ℂ W]
    (ρ : Representation ℂ G V) (hρ : Function.Injective ρ)
    (σ : Representation ℂ G W) [σ.IsIrreducible] :
    ∃ n : ℕ, n < characterValueCount (FDRep.ofShrink ρ) ∧
      0 < Module.finrank ℂ (Representation.IntertwiningMap σ (ρ.tensorPower n)) := by
  sorry

/-- The zero-dimensional character still has one value. -/
theorem characterValueCount_of_finrank_zero (U : FDRep ℂ G)
    (hzero : Module.finrank ℂ U.V = 0) : characterValueCount U = 1 := by
  sorry

/-- A faithful action on the zero space forces the group to be trivial. -/
theorem subsingleton_group_of_faithful_finrank_zero (U : FDRep ℂ G)
    (hU : Function.Injective U.ρ) (hzero : Module.finrank ℂ U.V = 0) : Subsingleton G := by
  sorry

/-- A trivial group is covered at n=0, even when U is the zero representation. -/
theorem pos_finrank_hom_tensorPower_zero [Subsingleton G] (U X : FDRep ℂ G)
    [CategoryTheory.Simple X] :
    0 < Module.finrank ℂ (X ⟶ tensorPowerFDRep U 0) := by
  sorry

end FaithfulTensor

/-! ### Layer 4: the arithmetic of character values -/

/-- Consume the native character-integrality theorem. Cyclotomic lifts and embedding
compatibility remain separate targets in the definitive README. -/
theorem isIntegral_character {G : Type v} [Group G] [Fintype G] (V : FDRep ℂ G) (g : G) :
    IsIntegral ℤ (V.character g) := FDRep.isIntegral_character V g

/-- **The central character** `ωᵪ : Z(k[G]) → k` (Schur), with `ωᵪ(Kⱼ) = |Cⱼ| χ(gⱼ)/χ(1)`. -/
noncomputable def centralCharacter {k : Type u} {G : Type v} [Field k] [IsAlgClosed k]
    [Group G] [Fintype G] {V : Type*} [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (ρ : Representation k G V) [ρ.IsIrreducible] :
    Subalgebra.center k (MonoidAlgebra k G) →ₐ[k] k :=
  TauCeti.Representation.centralCharacter ρ

/-- The value of a central character on a class sum is an algebraic integer (base-changed from the
integral class center). -/
theorem isIntegral_centralCharacter_classSum {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    {V : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    [ρ.IsIrreducible] (C : ConjClasses G) :
    IsIntegral ℤ (centralCharacter ρ ⟨classSum ℂ C, classSum_mem_center ℂ C⟩) := TauCeti.Representation.isIntegral_centralCharacter_classSumCenter ρ C

/-- **Degree divides the order.** -/
theorem finrank_dvd_card {G : Type v} [Group G] [Fintype G] {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (ρ : Representation ℂ G V) [ρ.IsIrreducible] :
    (Module.finrank ℂ V) ∣ Nat.card G := TauCeti.Representation.finrank_dvd_card ρ

/- Brauer's splitting-field theorem, consumed from the pin: every irreducible complex
representation is realized over the intermediate field `ℚ(ζ_e) ⊆ ℂ`. -/
#check @FDRep.exists_simple_nonempty_iso_baseChange_adjoin_of_isPrimitiveRoot

/-- **The field of values is the fixed field of the stabilizer.** Let `K` be the exponent
cyclotomic field of `G`, embedded in `ℂ`, and `ζ` its distinguished primitive `e`-th root.
`Gal(K/ℚ)` acts on the irreducible complex characters by `(σ · χ)(g) = χ(g ^ j)`, with
`j = autToPow σ` the cyclotomic exponent of `σ`; `H` is the stabilizer of `χ` for that action,
given by its membership condition. The field `ℚ(χ) ⊆ ℂ` generated by the values of `χ` is the
image in `ℂ` of the fixed field of `H` (Isaacs, *Character Theory of Finite Groups*,
Chapter 9; Serre, *Linear Representations of Finite Groups*, §12.4). No automorphism of
`ℂ` is chosen. -/
theorem fieldOfValues_eq_map_fixedField_stabilizer {G : Type} [Group G] [Finite G]
    {K : Type} [Field K] [CharZero K] [Algebra K ℂ]
    [IsCyclotomicExtension {Monoid.exponent G} ℚ K]
    {χ : G → ℂ} (hχ : χ ∈ TauCeti.irreducibleCharacters ℂ G) (H : Subgroup Gal(K/ℚ))
    (hH : ∀ σ : Gal(K/ℚ), σ ∈ H ↔ ∀ g : G,
      χ (g ^ ((IsCyclotomicExtension.zeta_spec (Monoid.exponent G) ℚ K).autToPow ℚ σ :
        ZMod (Monoid.exponent G)).val) = χ g) :
    IntermediateField.adjoin ℚ (Set.range χ) =
      IntermediateField.map (algebraMap K ℂ).toRatAlgHom (IntermediateField.fixedField H) :=
  sorry

/-- **The Frobenius-Schur indicator** `ν₂(χ) = |G|⁻¹ ∑ g, χ(g²)`; `+1` for `D₄`, `-1` for `Q₈`. -/
noncomputable def frobeniusSchurIndicator {G : Type v} [Group G] [Fintype G] (V : FDRep ℂ G) : ℂ :=
  (Nat.card G : ℂ)⁻¹ * ∑ g : G, V.character (g * g)

/-! ### Layer 4b: the representation ring (characteristic zero)

The multiplicative structure the family index promises. `virtualCharacters` (an `AddSubgroup`, in
`../InductionRestriction`) is deliberately only the additive shadow, kept for positive
characteristic; in characteristic zero the ring itself is pinned here, so that tensor-product
decomposition (Littlewood-Richardson, Racah-Speiser via `../LieHighestWeight`'s `formalCharacter`)
has a machine-checked home rather than a prose promise. -/

/-- **The representation ring** `R(G)` over a characteristic-zero field: the Grothendieck ring of
`FDRep k G`, addition from `⊕`, multiplication from `⊗`. -/
abbrev repRing (k : Type u) (G : Type v) [Field k] [CharZero k] [Group G] [Fintype G] :=
  TauCeti.repRing k G

/-- **The character map is a ring homomorphism** into functions on `G` (additive on `⊕`,
multiplicative on `⊗` via `char_tensor`), with image inside `ClassFunction k G`. -/
noncomputable def repRingCharacter (k : Type u) (G : Type v) [Field k] [CharZero k] [Group G]
    [Fintype G] : repRing k G →+* (G → k) := TauCeti.repRingCharacter k G

theorem repRingCharacter_mem_classFunction (k : Type u) (G : Type v) [Field k] [CharZero k]
    [Group G] [Fintype G] (x : repRing k G) :
    repRingCharacter k G x ∈ ClassFunction k G := TauCeti.repRingCharacter_mem_classFunction x

/-- **The character map is injective** over a characteristic-zero splitting field (stated for
algebraically closed `k`): virtual representations are determined by their characters, which is what
makes character-level computation of tensor decompositions sound. -/
theorem repRingCharacter_injective (k : Type u) (G : Type v) [Field k] [CharZero k] [IsAlgClosed k]
    [Group G] [Fintype G] :
    Function.Injective (repRingCharacter k G) := TauCeti.repRingCharacter_injective

/-- Coprime conjugacy-class size and irreducible degree give zero character value or scalar action. -/
theorem character_eq_zero_or_scalar_of_coprime_class_card
    {G : Type v} [Group G] [Fintype G] {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (ρ : Representation ℂ G V) [ρ.IsIrreducible] (g : G)
    (hcop : Nat.Coprime (Nat.card (ConjClasses.carrier (ConjClasses.mk g)))
      (Module.finrank ℂ V)) :
    ρ.character g = 0 ∨ ∃ a : ℂ, ∀ v : V, ρ g v = a • v := by
  rcases Representation.char_eq_zero_or_exists_apply_eq_smul ρ hcop with h | ⟨a, ha⟩
  · exact Or.inl h
  · exact Or.inr ⟨a, fun v => by simpa using congrArg (fun f : Module.End ℂ V => f v) ha⟩

/-- **Burnside's `pᵃqᵇ` theorem** (off the critical path; a Layer-4 application). -/
theorem isSolvable_of_card_eq_prime_pow_mul_prime_pow {G : Type v} [Group G] [Fintype G]
    {p q : ℕ} (hp : p.Prime) (hq : q.Prime) {a b : ℕ} (h : Nat.card G = p ^ a * q ^ b) :
    Group.IsSolvable G := TauCeti.isSolvable_of_card_eq_prime_pow_mul_prime_pow hp hq h

/-! ## B. The class algebra and the Dixon-Schneider specification -/

/-! ### Layer 5: the Dixon-Schneider characterization (the specification) -/

/-- **Class-multiplication matrix**, convention pinned: `(Mᵢ)ⱼₖ = aᵢₖⱼ` (the coefficient of `K_j` in
`K_i K_k`), acting on **row vectors from the left** via `ᵥ*`. Under this convention the normalized
central-character **rows** of `Ω` are common **left** eigenvectors of the `{Mᵢ}`
(`centralCharacterTable_eigenvector` below): with `v_j = ω(K_j)`,
`(v ᵥ* Mᵢ)_k = ∑_j ω(K_j) a_{i,k,j} = ω(K_i) ω(K_k)` by the coordinate identity and commutativity of
the class algebra. Do not mix this with the column/`*ᵥ` convention, which would need the transposed
matrix `(Mᵢ)ⱼₖ = aᵢⱼₖ` instead. -/
def classMultMatrix {G : Type v} [Group G] [Fintype G] [DecidableEq G] (Ci : ConjClasses G) :
    Matrix (ConjClasses G) (ConjClasses G) ℤ :=
  TauCeti.classMultMatrix Ci

theorem classMultMatrix_commute {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    (Ci Cj : ConjClasses G) : Commute (classMultMatrix Ci) (classMultMatrix Cj) := TauCeti.classMultMatrix_commute Ci Cj

/-- **The coordinate identity** `ωᵪ(Kᵢ) ωᵪ(Kⱼ) = ∑ₖ aᵢⱼᵏ ωᵪ(Kₖ)`, from multiplicativity of `ωᵪ`. The
algebraic fact the eigenvector theorem rests on. -/
theorem centralCharacter_coordinate {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    {V : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    [ρ.IsIrreducible] (Ci Cj : ConjClasses G) :
    centralCharacter ρ ⟨classSum ℂ Ci, classSum_mem_center ℂ Ci⟩
        * centralCharacter ρ ⟨classSum ℂ Cj, classSum_mem_center ℂ Cj⟩
      = ∑ Ck : ConjClasses G, (structureConstant Ci Cj Ck : ℂ)
          * centralCharacter ρ ⟨classSum ℂ Ck, classSum_mem_center ℂ Ck⟩ := by
  have hC (C : ConjClasses G) : TauCeti.classSumCenter (k := ℂ) C =
      ⟨classSum ℂ C, classSum_mem_center ℂ C⟩ := by
    apply Subtype.ext
    exact TauCeti.classSumCenter_coe C
  have h := congrArg (centralCharacter ρ) (TauCeti.classSumCenter_mul ℂ Ci Cj)
  simpa only [map_mul, map_sum, map_smul, Algebra.algebraMap_eq_smul_one,
    smul_eq_mul, RingHom.id_apply, hC, structureConstant] using h

/-- **The central-character table** `Ω`, `Ωᵢⱼ = ωᵢ(Kⱼ)`, normalized by `ωᵢ(K₁) = 1`. The algorithm's
primary computed object; the ordinary table `X` is a conversion via `χ(gⱼ) = dᵢ ωᵢ(Kⱼ)/|Cⱼ|`. -/
noncomputable def centralCharacterTable (G : Type v) [Group G] [Fintype G] [DecidableEq G] :
    Matrix (Fin (Nat.card (ConjClasses G))) (ConjClasses G) ℂ := TauCeti.centralCharacterTable ℂ G

/-- **The rows of `Ω` are the common left eigenvectors** of the `{Mᵢ}` (after the coordinate
identity), in the pinned row/`ᵥ*` convention of `classMultMatrix`. -/
theorem centralCharacterTable_eigenvector (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (i : Fin (Nat.card (ConjClasses G))) (Ci : ConjClasses G) :
    (fun Cj => centralCharacterTable G i Cj) ᵥ* (classMultMatrix Ci).map (Int.cast : ℤ → ℂ)
      = (centralCharacterTable G i Ci) • (fun Cj => centralCharacterTable G i Cj) := TauCeti.isClassEigenrow_centralCharacterTable i Ci

/-- **Normalized left eigenrows are exactly the class-algebra homomorphisms**: a vector `v` on the
classes with `v(1) = 1` is a common left eigenvector of every `classMultMatrix Ci` (with eigenvalue
`v Ci`) iff it is the evaluation of an algebra homomorphism `Z(ℂ[G]) → ℂ` on the class sums. This is
the lemma that makes `characterTable_unique_rows` an argument rather than a leap: the homomorphisms
of the split semisimple class algebra are finite in number, orthonormality forbids repetitions, and
the row count exhausts them. -/
theorem normalized_eigenrow_iff_algHom (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (v : ConjClasses G → ℂ) (hv : v (ConjClasses.mk 1) = 1) :
    (∀ Ci : ConjClasses G,
        v ᵥ* (classMultMatrix Ci).map (Int.cast : ℤ → ℂ) = v Ci • v) ↔
      ∃ φ : Subalgebra.center ℂ (MonoidAlgebra ℂ G) →ₐ[ℂ] ℂ,
        ∀ C : ConjClasses G, φ ⟨classSum ℂ C, classSum_mem_center ℂ C⟩ = v C := by
  have hC (C : ConjClasses G) : TauCeti.classSumCenter (k := ℂ) C =
      ⟨classSum ℂ C, classSum_mem_center ℂ C⟩ := by
    apply Subtype.ext
    exact TauCeti.classSumCenter_coe C
  simpa only [TauCeti.isClassEigenrow_def, TauCeti.classSumRow_apply, classMultMatrix,
    hC, funext_iff] using
    (TauCeti.isClassEigenrow_iff_exists_algHom (k := ℂ) (G := G) hv)

/-- **The specification** over `ℂ`, now with a real body (a `Prop`-valued structure): degrees are
positive integers dividing `|G|` with `∑ dᵢ² = |G|`; the rows are orthonormal in the class-size
weighted Hermitian pairing; and each **normalized row** (the central-character row `ω_i(K_j) =
|C_j| M i C_j / M i 1`) is a common **left** eigenvector of the `{Mᵢ}` in the pinned `ᵥ*` convention.
`characterTable G` satisfies it (`isCharacterTableSpec_characterTable`), and it pins the table up to a
row permutation (`characterTable_unique_rows`, via `normalized_eigenrow_iff_algHom`). -/
abbrev IsCharacterTableSpec := TauCeti.IsCharacterTableSpec

theorem isCharacterTableSpec_characterTable (G : Type v) [Group G] [Fintype G] [DecidableEq G] :
    IsCharacterTableSpec G (characterTable G) := TauCeti.isCharacterTableSpec_characterTable G

/-- **Labeled uniqueness**: with columns the actual classes, any matrix satisfying the specification is
the character table up to a permutation of **rows only**. -/
theorem characterTable_unique_rows (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (M : Matrix (Fin (Nat.card (ConjClasses G))) (ConjClasses G) ℂ)
    (hM : IsCharacterTableSpec G M) :
    ∃ σ : Equiv.Perm (Fin (Nat.card (ConjClasses G))),
      M = (characterTable G).submatrix σ id := TauCeti.characterTable_unique_rows hM

/-! ## C. The executable certified algorithm with exact cyclotomic output -/

/-! ### Layer 6: the executable Burnside-Dixon-Schneider algorithm (the summit) -/

/-- The existing exact ring and its actual arithmetic, not a second quotient. -/
abbrev Cyclotomic := TauCeti.Cyclotomic
abbrev cyclotomicGen := TauCeti.Cyclotomic.zeta
abbrev cyclotomicCoeff := @TauCeti.Cyclotomic.coeff
noncomputable abbrev cyclotomicEmbedding (e : ℕ) [NeZero e] : Cyclotomic e →+* ℂ :=
  TauCeti.Cyclotomic.complexEmbedding

/-- A genuine comparison target with Mathlib's abstract cyclotomic ring. The computational
ring, generator and embedding above are already defined by the native library. -/
noncomputable def cyclotomicRingEquiv : ∀ (e : ℕ) [NeZero e],
    Cyclotomic e ≃+* CyclotomicRing e ℤ ℚ := sorry

theorem cyclotomicEmbedding_injective (e : ℕ) [NeZero e] :
    Function.Injective (cyclotomicEmbedding e) := TauCeti.Cyclotomic.complexEmbedding_injective

theorem isPrimitiveRoot_cyclotomicEmbedding_gen (e : ℕ) [NeZero e] :
    IsPrimitiveRoot (cyclotomicEmbedding e (cyclotomicGen e)) e := by
  rw [TauCeti.Cyclotomic.complexEmbedding_zeta]
  exact TauCeti.Cyclotomic.isPrimitiveRoot_complexRoot

abbrev DixonPrimeData := TauCeti.DixonPrimeData
abbrev IsGoodDixonPrime := TauCeti.IsGoodDixonPrime
abbrev ClassData := TauCeti.ClassData
abbrev ExactCharTable {G : Type v} [Group G] (d : ClassData G) (e : ℕ) :=
  d.CyclotomicCharacterTableData e
abbrev kernelBasis := @TauCeti.kernelBasis
/-- Native eigenvalue search returns a finite set; no second Gaussian elimination. -/
abbrev eigenvalueSearch := @TauCeti.eigenvalueSearch

/-- The native good-prime split-center theorem, with the native table's row index. -/
theorem center_zmod_algEquiv_pi {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    {p : ℕ} [Fact p.Prime] (hp : IsGoodDixonPrime G p) :
    Nonempty (Subalgebra.center (ZMod p) (MonoidAlgebra (ZMod p) G)
      ≃ₐ[ZMod p] (Fin (Nat.card (ConjClasses G)) → ZMod p)) :=
  hp.nonempty_center_algEquiv_pi

/-- A left eigenrow uses the RIGHT kernel of the TRANSPOSE. The native numbered search
already makes this transposition: consume `d.centralCharacterSearch` in the solver. -/
def leftEigenspaceBasis {F : Type*} [Field F] [DecidableEq F] {n : ℕ}
    (M : Matrix (Fin n) (Fin n) F) (a : F) : List (Fin n → F) :=
  TauCeti.kernelBasis (Mᵀ - a • (1 : Matrix (Fin n) (Fin n) F))

abbrev liftCyclotomic := TauCeti.Cyclotomic.lift
noncomputable abbrev cyclotomicReduce {e : ℕ} [NeZero e] (p : ℕ) [Fact p.Prime]
    (α : ZMod p) (hα : IsPrimitiveRoot α e) : Cyclotomic e →+* ZMod p :=
  TauCeti.Cyclotomic.reduceRingHom p α hα

/-- General root-premise evaluation, including roots not supplied as primitive data.
This is the old quotient/evaluation intent in native eval₂ form. -/
noncomputable def cyclotomicReduceAtRoot {e p : ℕ} (α : ZMod p)
    (hα : (Polynomial.cyclotomic e ℤ).eval₂ (Int.castRingHom (ZMod p)) α = 0) :
    Cyclotomic e →+* ZMod p :=
  TauCeti.Cyclotomic.evalRingHom (Int.castRingHom (ZMod p)) α hα

theorem cyclotomicReduceAtRoot_gen {e p : ℕ} (α : ZMod p)
    (hα : (Polynomial.cyclotomic e ℤ).eval₂ (Int.castRingHom (ZMod p)) α = 0) :
    cyclotomicReduceAtRoot α hα (cyclotomicGen e) = α :=
  TauCeti.Cyclotomic.evalRingHom_zeta (Int.castRingHom (ZMod p)) α hα

theorem cyclotomicReduce_gen {e p : ℕ} [NeZero e] [Fact p.Prime]
    (α : ZMod p) (hα : IsPrimitiveRoot α e) :
    cyclotomicReduce p α hα (cyclotomicGen e) = α := by
  simpa only [cyclotomicReduce, TauCeti.Cyclotomic.reduceRingHom_apply] using
    (TauCeti.Cyclotomic.reduce_zeta p α hα)

theorem liftCyclotomic_spec {e p : ℕ} [Fact p.Prime] (α : ZMod p)
    (hα : IsPrimitiveRoot α e) (residues : Fin e.totient → ZMod p)
    (y : Cyclotomic e) (hy : ∀ j : Fin e.totient, 2 * (y.coeff j).natAbs < p)
    (hr : TauCeti.Cyclotomic.conjugateResidues α y = residues) :
    liftCyclotomic e α residues = y :=
  TauCeti.Cyclotomic.lift_eq_of_conjugateResidues_eq hα hy hr

theorem cyclotomicEmbeddingPoint_isRoot {e p : ℕ} [NeZero e] (hp : p.Prime)
    (α : ZMod p) (hα : orderOf α = e) (u : (ZMod e)ˣ) :
    (Polynomial.cyclotomic e (ZMod p)).IsRoot (α ^ (u : ZMod e).val) := by
  let : Fact p.Prime := ⟨hp⟩
  exact ((IsPrimitiveRoot.iff_orderOf.mpr hα).pow_of_coprime _
    (ZMod.val_coe_unit_coprime u)).isRoot_cyclotomic (NeZero.pos e)

/-- Finite, executable bound on the actual canonical power coordinates. For e=1 it is one.
The descending native list is read by its ascending `coeff` API, not by raw list indexing. -/
def canonicalPowerBound (e : ℕ) : ℕ :=
  max 1 (((Finset.univ : Finset (Fin e)).product
    (Finset.univ : Finset (Fin e.totient))).sup fun jk =>
      ((TauCeti.Cyclotomic.zeta e ^ jk.1.val).coeff jk.2.val).natAbs)

def centralCoefficientBound (G : Type v) [Fintype G] (e : ℕ) : ℕ :=
  Fintype.card G * canonicalPowerBound e

theorem canonicalPowerBound_pos (e : ℕ) : 0 < canonicalPowerBound e := by
  exact lt_of_lt_of_le Nat.zero_lt_one (le_max_left _ _)

theorem pow_coeff_le_canonicalPowerBound (e : ℕ) (j : Fin e) (k : Fin e.totient) :
    ((TauCeti.Cyclotomic.zeta e ^ j.val).coeff k.val).natAbs ≤ canonicalPowerBound e := by
  exact le_trans (Finset.le_sup (f := fun jk : Fin e × Fin e.totient =>
    ((TauCeti.Cyclotomic.zeta e ^ jk.1.val).coeff jk.2.val).natAbs)
      (by simp : (j, k) ∈ (Finset.univ : Finset (Fin e)).product Finset.univ)) (le_max_right _ _)

/-- New exact/integral comparison target. Use the primitive root in Q(ζ_e), its chosen
embedding sending it to native complexRoot, integral closure/adjoin and integralPowerBasis.
This is existence in the ACTUAL native ring; integrality in C alone is not an exact value. -/
theorem exists_exact_of_integral_mem_cyclotomic (e : ℕ) [NeZero e] (z : ℂ)
    (hz : IsIntegral ℤ z)
    (hmem : z ∈ Algebra.adjoin ℚ ({TauCeti.Cyclotomic.complexRoot e} : Set ℂ)) :
    ∃ w : Cyclotomic e, cyclotomicEmbedding e w = z := by
  sorry

/-- Generator-compatible field map, needed before transferring the integral power basis.
Its target is a field; the integral target in the preceding theorem is a separate step. -/
noncomputable def cyclotomicFieldEmbedding : ∀ (e : ℕ) [NeZero e],
    letI : NeZero (e : ℚ) := ⟨Nat.cast_ne_zero.mpr (NeZero.ne e)⟩
    letI : IsCyclotomicExtension {e} ℚ (CyclotomicField e ℚ) :=
      CyclotomicField.isCyclotomicExtension e ℚ
    {ι : CyclotomicField e ℚ →+* ℂ //
      ι (IsCyclotomicExtension.zeta e ℚ (CyclotomicField e ℚ)) =
        TauCeti.Cyclotomic.complexRoot e} := sorry

/-- Pin the abstract-ring comparison to the same generator of the rational field. -/
theorem cyclotomicRingEquiv_gen (e : ℕ) [NeZero e] :
    letI : NeZero (e : ℚ) := ⟨Nat.cast_ne_zero.mpr (NeZero.ne e)⟩
    letI : IsCyclotomicExtension {e} ℚ (CyclotomicField e ℚ) :=
      CyclotomicField.isCyclotomicExtension e ℚ
    algebraMap (CyclotomicRing e ℤ ℚ) (CyclotomicField e ℚ)
      (cyclotomicRingEquiv e (cyclotomicGen e)) =
        IsCyclotomicExtension.zeta e ℚ (CyclotomicField e ℚ) := by
  sorry

/-- The chosen field embedding and the abstract integral-ring comparison commute with
actual native complex evaluation, on EVERY exact element. -/
theorem cyclotomicRingEquiv_embedding (e : ℕ) [NeZero e] (x : Cyclotomic e) :
    (cyclotomicFieldEmbedding e).val
      (algebraMap (CyclotomicRing e ℤ ℚ) (CyclotomicField e ℚ) (cyclotomicRingEquiv e x)) =
        cyclotomicEmbedding e x := by
  sorry

/-- Identify the actual ordered integral powers with the native canonical coefficients.
The dim=phi(e) reindexing is explicit. An arbitrary integral basis would not suffice. -/
theorem exists_integralPowerBasis_comparison (e : ℕ) [NeZero e] :
    let K := CyclotomicField e ℚ
    letI : NeZero (e : ℚ) := ⟨Nat.cast_ne_zero.mpr (NeZero.ne e)⟩
    letI : IsCyclotomicExtension {e} ℚ K :=
      CyclotomicField.isCyclotomicExtension e ℚ
    let hζ := IsCyclotomicExtension.zeta_spec e ℚ K
    ∃ E : Cyclotomic e ≃+* NumberField.RingOfIntegers K,
      (∀ x, (cyclotomicFieldEmbedding e).val
        (algebraMap (NumberField.RingOfIntegers K) K (E x)) = cyclotomicEmbedding e x) ∧
      ∀ (x : Cyclotomic e) (k : Fin e.totient),
        (hζ.integralPowerBasis.basis.repr (E x))
          ((finCongr hζ.integralPowerBasis_dim).symm k) = x.coeff k.val := by
  sorry

/-- Actual nonnegative eigenvalue multiplicities in the pinned generator. -/
theorem exists_eigenvalue_multiplicities {G : Type v} [Group G] [Fintype G]
    (e : ℕ) [NeZero e] (he : e = Monoid.exponent G) (V : FDRep ℂ G) (g : G) :
    ∃ m : Fin e → ℕ, (∑ j, m j = Module.finrank ℂ V.V) ∧
      cyclotomicEmbedding e (∑ j, (m j : Cyclotomic e) * cyclotomicGen e ^ j.val) = V.character g ∧
      ∀ k : Fin e.totient,
        ((∑ j, (m j : Cyclotomic e) * cyclotomicGen e ^ j.val).coeff k.val).natAbs ≤
          Module.finrank ℂ V.V * canonicalPowerBound e := by
  sorry

/-- Exact ordinary/central values, their division-free identity and the derived uniform bound.
There is no arbitrary coefficient-bound oracle and no quotient inside an integer ring. -/
theorem exists_exact_character_and_central_values {G : Type v} [Group G] [Fintype G]
    [DecidableEq G] (e : ℕ) [NeZero e] (he : e = Monoid.exponent G)
    (i : Fin (Nat.card (ConjClasses G))) (C : ConjClasses G) :
    ∃ x w : Cyclotomic e,
      cyclotomicEmbedding e x = characterTable G i C ∧
      cyclotomicEmbedding e w = centralCharacterTable G i C ∧
      (TauCeti.characterDegree ℂ i : Cyclotomic e) * w = (Nat.card C.carrier : Cyclotomic e) * x ∧
      (∀ k : Fin e.totient, (w.coeff k.val).natAbs ≤ Nat.card C.carrier * canonicalPowerBound e) ∧
      (∀ k : Fin e.totient, (w.coeff k.val).natAbs ≤ centralCoefficientBound G e) := by
  sorry

/-- Construct the exact native certificate from the actual table, not an arbitrary candidate.
The row equivalence is the existing numbering of ClassData; all coefficients are bounded. -/
theorem exists_bounded_exact_character_table {G : Type v} [Group G] [Fintype G]
    [DecidableEq G] (d : ClassData G) (e : ℕ) [NeZero e] (he : e = Monoid.exponent G) :
    ∃ out : ExactCharTable d e,
      d.IsCyclotomicCharacterTableSpec e out.omega out.table out.degree ∧
      d.complexTableOfCyclotomic e out.table = characterTable G ∧
      (∀ i k (j : Fin e.totient),
        ((out.omega i k).coeff j.val).natAbs ≤ centralCoefficientBound G e) := by
  sorry

/-- Existing cofinal primes plus native primitive roots give the stronger data.
No new Dirichlet theorem and no assumed central-row injectivity. -/
theorem exists_strongDixonPrime {G : Type v} [Group G] [Fintype G]
    (e : ℕ) (he : e = Monoid.exponent G) :
    ∃ q : DixonPrimeData G, 2 * centralCoefficientBound G e < q.p := by
  sorry

/-- Native left-row search, all-conjugate permutation enumeration and Option solver. -/
abbrev characterTableDixon := @TauCeti.ClassData.dixonCyclotomicCharacterTable?
abbrev characterTableDixonSearch := @TauCeti.ClassData.characterTableDixon?

/-- Native soundness; success alone suffices, without the new stronger bound. -/
theorem characterTable_eq {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    (d : ClassData G) (e : ℕ) [NeZero e] (he : e = Monoid.exponent G)
    (q : DixonPrimeData G) (out : ExactCharTable d e)
    (h : characterTableDixon d e he q = some out) :
    IsCharacterTableSpec G (d.complexTableOfCyclotomic e out.table) :=
  TauCeti.ClassData.isCharacterTableSpec_of_dixonCyclotomicCharacterTable?_eq_some e he q h

/-- Complete reconstruction at the derived strong bound: combine the new exact certificate
with native completeness, whose proof already constructs all row alignments and no-merging. -/
theorem characterTableDixon_isSome {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    (d : ClassData G) (e : ℕ) [NeZero e] (he : e = Monoid.exponent G)
    (q : DixonPrimeData G) (hq : 2 * centralCoefficientBound G e < q.p) :
    (characterTableDixon d e he q).isSome = true := by
  obtain ⟨out, hs, _, hb⟩ := exists_bounded_exact_character_table d e he
  apply d.isSome_dixonCyclotomicCharacterTable_of_spec e he q out.omega out.table out.degree hs
  intro i k j
  exact lt_of_le_of_lt (Nat.mul_le_mul_left 2 (hb i k j)) hq

/-- A finite budget eventually reaches a strong prime in native candidates. This is the
terminating-search completeness theorem, distinct from unconditional native Option soundness. -/
theorem characterTableDixonSearch_eventually_some {G : Type v} [Group G] [Fintype G]
    [DecidableEq G] (d : ClassData G) (e : ℕ) (he : e = Monoid.exponent G) :
    ∃ fuel : ℕ, (characterTableDixonSearch d e he fuel).isSome = true := by
  sorry

/-- Every returned output has the unique actual complex table up to ROW permutation only. -/
theorem characterTableDixon_unique_rows {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    (d : ClassData G) (e : ℕ) [NeZero e] (he : e = Monoid.exponent G)
    (q : DixonPrimeData G) (out : ExactCharTable d e)
    (h : characterTableDixon d e he q = some out) :
    ∃ σ : Equiv.Perm (Fin (Nat.card (ConjClasses G))),
      d.complexTableOfCyclotomic e out.table = (characterTable G).submatrix σ id :=
  TauCeti.characterTable_unique_rows (characterTable_eq d e he q out h)


/-! #### Executable refinement: direct finite rows, class powers, per-row degrees

NEW proposed executable definitions and honest theorem targets. None is an assertion
that pinned native Solver.lean was optimized or that these new definitions were run.
The original native solver aliases/theorems above remain the exhaustive reference.
-/
namespace ExecutableRefinement

variable {G : Type v} [Group G] [Fintype G] [DecidableEq G]

/-- Injective radix-p code on actual row values; no enumeration of all codes. -/
def modularRowCode (d : ClassData G) (q : DixonPrimeData G)
    (row : Fin d.numClasses → ZMod q.p) : ℕ :=
  ∑ k, (row k).val * q.p ^ k.val

def modularRowOfCode (d : ClassData G) (q : DixonPrimeData G)
    (code : ℕ) : Fin d.numClasses → ZMod q.p :=
  fun k => ((code / q.p ^ k.val : ℕ) : ZMod q.p)

/-- Traverses the returned Finset itself, then sorts its actual NAT codes. -/
def modularCentralRowsDirect (d : ClassData G) (q : DixonPrimeData G) :
    List (Fin d.numClasses → ZMod q.p) :=
  (((d.centralCharacterSearch (F := ZMod q.p)).image (modularRowCode d q)).sort
    (fun a b : ℕ => a ≤ b)).map (modularRowOfCode d q)

theorem modularRowOfCode_code (d : ClassData G) (q : DixonPrimeData G)
    (row : Fin d.numClasses → ZMod q.p) :
    modularRowOfCode d q (modularRowCode d q row) = row := by
  sorry

theorem modularCentralRowsDirect_spec (d : ClassData G) (q : DixonPrimeData G) :
    (modularCentralRowsDirect d q).Nodup ∧
      (modularCentralRowsDirect d q).toFinset = d.centralCharacterSearch ∧
      (modularCentralRowsDirect d q).length = d.numClasses := by
  sorry

/-- Same representatives and native executable conjugacy-class lookup. -/
def powerClass (d : ClassData G) (b : ℕ) (k : Fin d.numClasses) : Fin d.numClasses :=
  d.index (d.rep k ^ b)

def inverseClass (d : ClassData G) (k : Fin d.numClasses) : Fin d.numClasses :=
  d.index ((d.rep k)⁻¹)

def firstConjugate (e : ℕ) [NeZero e] : Fin e.totient :=
  ⟨0, Nat.totient_pos.mpr (NeZero.pos e)⟩

/-- A length-e scalar modular-inverse scan; never a tuple-of-permutations search. -/
def alignmentExponent (e : ℕ) [NeZero e] (j : Fin e.totient) : ℕ :=
  ((List.range e).find? fun b => decide
    ((TauCeti.Cyclotomic.primitiveExponent e (firstConjugate e) * b) % e =
      TauCeti.Cyclotomic.primitiveExponent e j % e)).getD 0

theorem primitiveExponent_first (e : ℕ) [NeZero e] :
    TauCeti.Cyclotomic.primitiveExponent e (firstConjugate e) =
      if e = 1 then 0 else 1 := by
  sorry

theorem alignmentExponent_spec (e : ℕ) [NeZero e] (j : Fin e.totient) :
    alignmentExponent e j < e ∧ Nat.Coprime (alignmentExponent e j) e ∧
      (TauCeti.Cyclotomic.primitiveExponent e (firstConjugate e) * alignmentExponent e j) % e =
        TauCeti.Cyclotomic.primitiveExponent e j % e := by
  sorry

theorem alignmentExponent_one (j : Fin (1 : ℕ).totient) :
    alignmentExponent 1 j = 0 := by
  sorry

theorem powerClass_bijective_and_card (d : ClassData G) (e : ℕ)
    (he : e = Monoid.exponent G) (b : ℕ) (hb : Nat.Coprime b e) :
    Function.Bijective (powerClass d b) ∧
      ∀ k, (d.classFinset (powerClass d b k)).card = (d.classFinset k).card := by
  sorry

def alignedResidues (d : ClassData G) (e : ℕ) [NeZero e] (q : DixonPrimeData G)
    (row : Fin d.numClasses → ZMod q.p) (k : Fin d.numClasses) :
    Fin e.totient → ZMod q.p :=
  fun j => row (powerClass d (alignmentExponent e j) k)

/-- Covariance follows from the native certificate/complex comparison and Galois
power formula, with class-size and degree preservation; it is not an input oracle. -/
theorem alignedResidues_eq_conjugateResidues (d : ClassData G) (e : ℕ) [NeZero e]
    (he : e = Monoid.exponent G) (q : DixonPrimeData G) (out : ExactCharTable d e)
    (hs : d.IsCyclotomicCharacterTableSpec e out.omega out.table out.degree)
    (i : Fin d.numClasses) (k : Fin d.numClasses) :
    alignedResidues d e q
      (fun l => TauCeti.Cyclotomic.conjugateResidues q.root (out.omega i l)
        (firstConjugate e)) k =
      TauCeti.Cyclotomic.conjugateResidues q.root (out.omega i k) := by
  sorry

def liftPowerRow (d : ClassData G) (e : ℕ) [NeZero e] (q : DixonPrimeData G)
    (row : Fin d.numClasses → ZMod q.p) : Fin d.numClasses → Cyclotomic e :=
  fun k => TauCeti.Cyclotomic.lift e q.root (alignedResidues d e q row k)

/-- n/s_k is exact by the class-size divisibility theorem owned below. -/
def degreeNormNumerator (d : ClassData G) (e : ℕ)
    (omega : Fin d.numClasses → Cyclotomic e) : Cyclotomic e :=
  ∑ k, ((Fintype.card G / (d.classFinset k).card : ℕ) : Cyclotomic e) *
    omega k * omega (inverseClass d k)

theorem classSize_dvd_card (d : ClassData G) (k : Fin d.numClasses) :
    (d.classFinset k).card ∣ Fintype.card G := by
  sorry

/-- Only O(sqrt(n)) scalar candidates per row, with exact cyclotomic equality. -/
def recoverDegreeFromNumerator? (_d : ClassData G) (e : ℕ)
    (t : Cyclotomic e) : Option ℕ :=
  (List.range (Nat.sqrt (Fintype.card G) + 1)).find? fun m => decide
    (0 < m ∧ m ∣ Fintype.card G ∧
      (m : Cyclotomic e) ^ 2 * t =
        (Fintype.card G : Cyclotomic e) ^ 2)

def recoverDegree? (d : ClassData G) (e : ℕ)
    (omega : Fin d.numClasses → Cyclotomic e) : Option ℕ :=
  recoverDegreeFromNumerator? d e (degreeNormNumerator d e omega)

theorem degreeNormNumerator_of_spec (d : ClassData G) (e : ℕ) [NeZero e]
    (out : ExactCharTable d e)
    (hs : d.IsCyclotomicCharacterTableSpec e out.omega out.table out.degree)
    (i : Fin d.numClasses) :
    degreeNormNumerator d e (out.omega i) =
      ((Fintype.card G / out.degree i : ℕ) : Cyclotomic e) ^ 2 := by
  sorry

/-- Positivity and the degree-square identity give uniqueness, no real square root. -/
theorem recoverDegree?_of_spec (d : ClassData G) (e : ℕ) [NeZero e]
    (out : ExactCharTable d e)
    (hs : d.IsCyclotomicCharacterTableSpec e out.omega out.table out.degree)
    (i : Fin d.numClasses) : recoverDegree? d e (out.omega i) = some (out.degree i) := by
  sorry

/-- Owned structural recursion avoids the private native map specialization.
Its total integer quotient agrees with the coefficient map for every denominator. -/
def quotientCoefficients (n : ℕ) : List ℤ → List ℤ
  | [] => []
  | c :: cs => (c / (n : ℤ)) :: quotientCoefficients n cs

theorem quotientCoefficients_eq_map (n : ℕ) (xs : List ℤ) :
    quotientCoefficients n xs = xs.map (fun c => c / (n : ℤ)) := by
  induction xs with
  | nil => rfl
  | cons c cs ih =>
    change (c / (n : ℤ)) :: quotientCoefficients n cs =
      (c / (n : ℤ)) :: cs.map (fun a => a / (n : ℤ))
    exact congrArg (List.cons (c / (n : ℤ))) ih

/-- The native quotient helper is private; this is its exposed coefficient adapter,
not a second exact ring. The unchanged native checker validates every division. -/
def divideClassSize (e : ℕ) (x : Cyclotomic e) (n : ℕ) : Cyclotomic e :=
  TauCeti.Cyclotomic.ofCoeffList e (quotientCoefficients n x.coeffs)

theorem divideClassSize_eq_coeff_map (e : ℕ) (x : Cyclotomic e) (n : ℕ) :
    divideClassSize e x n =
      TauCeti.Cyclotomic.ofCoeffList e (x.coeffs.map fun c => c / (n : ℤ)) := by
  unfold divideClassSize
  rw [quotientCoefficients_eq_map]

/-- Proposed finite refinement. Direct rows and class powers build ONE candidate;
degree Option traversal short-circuits. No call to the exhaustive native solver. -/
def dixonPowerAligned? (d : ClassData G) (e : ℕ) [NeZero e]
    (_he : e = Monoid.exponent G) (q : DixonPrimeData G) : Option (ExactCharTable d e) :=
  let rows := modularCentralRowsDirect d q
  if rows.length = d.numClasses then
    let ratios := List.ofFn (alignmentExponent e)
    let powers := List.ofFn fun j : Fin e.totient =>
      List.ofFn fun k : Fin d.numClasses => powerClass d (ratios.getD j.val 0) k
    let sizes := List.ofFn fun k : Fin d.numClasses => (d.classFinset k).card
    let inverses := List.ofFn (inverseClass d)
    let entries := List.ofFn fun i : Fin d.numClasses =>
      List.ofFn fun k : Fin d.numClasses =>
        TauCeti.Cyclotomic.lift e q.root fun j =>
          (rows.getD i.val 0) ((powers.getD j.val []).getD k.val (d.index 1))
    let omega : Matrix (Fin d.numClasses) (Fin d.numClasses) (Cyclotomic e) :=
      fun i k => (entries.getD i.val []).getD k.val 0
    let numerator := fun i : Fin d.numClasses =>
      ∑ k : Fin d.numClasses,
        ((Fintype.card G / sizes.getD k.val 1 : ℕ) : Cyclotomic e) * omega i k *
          omega i (inverses.getD k.val (d.index 1))
    match (List.finRange d.numClasses).mapM
        (fun i => recoverDegreeFromNumerator? d e (numerator i)) with
    | none => none
    | some degrees =>
      let degree : Fin d.numClasses → ℕ := fun i => degrees.getD i.val 0
      let table : Matrix (Fin d.numClasses) (Fin d.numClasses) (Cyclotomic e) :=
        fun i k => divideClassSize e ((degree i : Cyclotomic e) * omega i k)
          (sizes.getD k.val 1)
      if d.cyclotomicCharacterTableChecker e omega table degree then
        some { omega := omega, table := table, degree := degree }
      else none
  else none

/-- Exact comparison of all three fields, with labeled columns fixed. -/
def SameUpToRows (d : ClassData G) (e : ℕ) (a b : ExactCharTable d e) : Prop :=
  ∃ sigma : Equiv.Perm (Fin d.numClasses),
    (∀ i k, a.omega i k = b.omega (sigma i) k) ∧
    (∀ i k, a.table i k = b.table (sigma i) k) ∧
    ∀ i, a.degree i = b.degree (sigma i)

theorem dixonPowerAligned?_sound (d : ClassData G) (e : ℕ) [NeZero e]
    (he : e = Monoid.exponent G) (q : DixonPrimeData G) (out : ExactCharTable d e)
    (h : dixonPowerAligned? d e he q = some out) :
    d.IsCyclotomicCharacterTableSpec e out.omega out.table out.degree := by
  sorry

/-- Full bounded-certificate completeness, including a deterministic modular row order. -/
theorem dixonPowerAligned?_complete (d : ClassData G) (e : ℕ) [NeZero e]
    (he : e = Monoid.exponent G) (q : DixonPrimeData G) (cert : ExactCharTable d e)
    (hs : d.IsCyclotomicCharacterTableSpec e cert.omega cert.table cert.degree)
    (hb : ∀ i k (j : Fin e.totient), 2 * ((cert.omega i k).coeff j.val).natAbs < q.p) :
    ∃ out, dixonPowerAligned? d e he q = some out ∧ SameUpToRows d e out cert := by
  sorry

theorem dixonPowerAligned?_strong_some (d : ClassData G) (e : ℕ) [NeZero e]
    (he : e = Monoid.exponent G) (q : DixonPrimeData G)
    (hq : 2 * centralCoefficientBound G e < q.p) :
    (dixonPowerAligned? d e he q).isSome = true := by
  sorry

/-- Existing reference completeness remains; first answers need not coincide literally. -/
theorem dixonPowerAligned?_reference_comparison (d : ClassData G) (e : ℕ) [NeZero e]
    (he : e = Monoid.exponent G) (q : DixonPrimeData G)
    (hq : 2 * centralCoefficientBound G e < q.p) (a b : ExactCharTable d e)
    (ha : dixonPowerAligned? d e he q = some a)
    (hb : characterTableDixon d e he q = some b) : SameUpToRows d e a b := by
  sorry

/-- Same native prime candidates; derived strong-bound filter is actual computation. -/
def characterTablePowerSearch? (d : ClassData G) (e : ℕ) [NeZero e]
    (he : e = Monoid.exponent G) (fuel : ℕ) : Option (ExactCharTable d e) :=
  (TauCeti.DixonPrimeData.candidates e he (Fintype.card G) Nat.card_eq_fintype_card.symm fuel).findSome?
    fun q => if 2 * centralCoefficientBound G e < q.p then dixonPowerAligned? d e he q else none

theorem characterTablePowerSearch?_eventually_some (d : ClassData G) (e : ℕ) [NeZero e]
    (he : e = Monoid.exponent G) :
    ∃ fuel, (characterTablePowerSearch? d e he fuel).isSome = true := by
  sorry

theorem characterTablePowerSearch?_sound (d : ClassData G) (e : ℕ) [NeZero e]
    (he : e = Monoid.exponent G) (fuel : ℕ) (out : ExactCharTable d e)
    (h : characterTablePowerSearch? d e he fuel = some out) :
    IsCharacterTableSpec G (d.complexTableOfCyclotomic e out.table) := by
  sorry

theorem characterTablePowerSearch?_prefix (d : ClassData G) (e : ℕ) [NeZero e]
    (he : e = Monoid.exponent G) {fuel fuel' : ℕ} (hfuel : fuel ≤ fuel')
    (out : ExactCharTable d e) (h : characterTablePowerSearch? d e he fuel = some out) :
    characterTablePowerSearch? d e he fuel' = some out := by
  sorry

end ExecutableRefinement

/-! ## D. Structural theorems and worked families

Three classical applications of Deliverable A, off the Dixon-Schneider critical path: the Frobenius-Schur
trichotomy, Frobenius's theorem, and the character table of `GL₂(𝔽_q)`. See `README.md`. -/

/-! ### Layer 7: the Frobenius-Schur indicator and real/quaternionic type -/

/-- **The indicator on the module spine**, generalizing the `FDRep`-level `frobeniusSchurIndicator`:
`ν₂(χ) = |G|⁻¹ ∑_g χ(g²)` for `ρ : Representation ℂ G V`. -/
noncomputable def frobeniusSchurIndicatorRep {G : Type v} [Group G] [Fintype G] {V : Type*}
    [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V) : ℂ :=
  (Nat.card G : ℂ)⁻¹ * ∑ g : G, ρ.character (g * g)

/-- **An invariant bilinear form**: `B (ρ g x) (ρ g y) = B x y` for all `g`. The symmetric invariant forms
(orthogonal type) and alternating invariant forms (symplectic type) are the `G`-invariants of `V* ⊗ V*`. -/
abbrev IsInvariantForm := @TauCeti.Representation.IsInvariantForm

/-- **The trichotomy**: for an irreducible `ρ` over `ℂ`, the indicator is `+1`, `0`, or `-1`. -/
theorem frobeniusSchurIndicatorRep_trichotomy {G : Type v} [Group G] [Fintype G] {V : Type*}
    [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    [ρ.IsIrreducible] :
    frobeniusSchurIndicatorRep ρ = 1 ∨ frobeniusSchurIndicatorRep ρ = 0
      ∨ frobeniusSchurIndicatorRep ρ = -1 := by
  simpa only [frobeniusSchurIndicatorRep, TauCeti.Representation.frobeniusSchurIndicator_def, pow_two] using
    (TauCeti.Representation.frobeniusSchurIndicator_eq_one_or_eq_zero_or_eq_neg_one ρ)

/-- **`ν₂ = +1` iff orthogonal**: a nonzero invariant symmetric nondegenerate form exists. Realizability
over `ℝ` is a *strictly stronger* consequence, pinned separately as `frobeniusSchurIndicatorRep_eq_one_realizable`
below (the symmetric complex form alone is not a real representation). -/
theorem frobeniusSchurIndicatorRep_eq_one_iff {G : Type v} [Group G] [Fintype G] {V : Type*}
    [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    [ρ.IsIrreducible] :
    frobeniusSchurIndicatorRep ρ = 1
      ↔ ∃ B : LinearMap.BilinForm ℂ V, IsInvariantForm ρ B ∧ B.IsSymm ∧ B.Nondegenerate := by
  simpa only [frobeniusSchurIndicatorRep, TauCeti.Representation.frobeniusSchurIndicator_def, pow_two] using
    (TauCeti.Representation.frobeniusSchurIndicator_eq_one_iff ρ)

/-- **`ν₂ = -1` iff symplectic (quaternionic)**: a nonzero invariant alternating nondegenerate form exists. -/
theorem frobeniusSchurIndicatorRep_eq_neg_one_iff {G : Type v} [Group G] [Fintype G] {V : Type*}
    [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    [ρ.IsIrreducible] :
    frobeniusSchurIndicatorRep ρ = -1
      ↔ ∃ B : LinearMap.BilinForm ℂ V, IsInvariantForm ρ B ∧ B.IsAlt ∧ B.Nondegenerate := by
  simpa only [frobeniusSchurIndicatorRep, TauCeti.Representation.frobeniusSchurIndicator_def, pow_two] using
    (TauCeti.Representation.frobeniusSchurIndicator_eq_neg_one_iff ρ)

/-- **A real form** of a complex representation: a real representation `σ` whose scalar extension along
`ℝ → ℂ` is isomorphic to `ρ`, stated on pure tensors (`ℂ ⊗[ℝ] W` carries its `ℂ`-module structure via
`TensorProduct.leftModule`, so no bespoke complexification of representations is needed to *state*
the predicate; the complexification API remains a build target for working with it). -/
abbrev IsRealForm := @Representation.IsRealForm

/-- **Realizability over `ℝ`**: `ρ` has a real form. The carrier is fixed to
`Fin (Module.finrank ℂ V) → ℝ` so that no type- or instance-existential is needed (safe in the
finite-dimensional setting where the notion is used; every real form of the right dimension
transports to this carrier along a basis). -/
abbrev IsRealizableOverReal := @Representation.IsRealizableOverReal

/-- **`ν₂ = +1` iff realizable over `ℝ`**: the orthogonal case admits an honest real form whose
complexification recovers `ρ`. This must *construct* a real representation, not merely a symmetric complex
form; hence a separate target from `frobeniusSchurIndicatorRep_eq_one_iff`. -/
theorem frobeniusSchurIndicatorRep_eq_one_realizable {G : Type v} [Group G] [Fintype G] {V : Type*}
    [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    [ρ.IsIrreducible] :
    frobeniusSchurIndicatorRep ρ = 1 ↔ IsRealizableOverReal ρ := by
  simpa only [frobeniusSchurIndicatorRep, TauCeti.Representation.frobeniusSchurIndicator_def, pow_two] using
    (Representation.frobeniusSchurIndicator_eq_one_iff_isRealizableOverReal (ρ := ρ))

/-- **A real conjugacy class**: `g` is conjugate to `g⁻¹`. -/
abbrev IsRealClass := @TauCeti.IsRealClass

/-- **Real-valued irreducibles match real classes**: the rows of `characterTable` fixed by complex
conjugation are as many as the real conjugacy classes. -/
theorem card_realValued_eq_card_realClasses (G : Type v) [Group G] [Fintype G] [DecidableEq G] :
    Nat.card {i // ∀ C, (starRingEnd ℂ) (characterTable G i C) = characterTable G i C}
      = Nat.card {C : ConjClasses G // IsRealClass C} := TauCeti.card_realValued_eq_card_realClasses G

/-- **The Frobenius-Schur indicator of the `i`-th irreducible** (the row `i` of `characterTable`). The
per-row form the involution count sums against. -/
noncomputable def frobeniusSchurIndicatorRow (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (i : Fin (Nat.card (ConjClasses G))) : ℂ :=
  (Nat.card G : ℂ)⁻¹ * ∑ g : G, characterTable G i (ConjClasses.mk (g * g))

/-- **The involution-counting formula** `#{g : g² = x} = ∑_χ ν₂(χ) χ(x)`, the degree-weighted signed sum
over the irreducibles. At `x = 1` this is `#{g : g² = 1} = ∑_χ ν₂(χ) χ(1)` (weighted by the degrees `χ(1)`),
which is *not* the raw count of orthogonal minus quaternionic irreducibles `∑_χ ν₂(χ)`. -/
theorem card_sq_eq_sum_frobeniusSchur (G : Type v) [Group G] [Fintype G] [DecidableEq G] (x : G) :
    (Nat.card {g : G // g * g = x} : ℂ)
      = ∑ i, frobeniusSchurIndicatorRow G i * characterTable G i (ConjClasses.mk x) := by
  simpa only [TauCeti.frobeniusSchurIndicatorRow_eq_inv_mul_sum_characterTable,
    frobeniusSchurIndicatorRow, characterTable, pow_two] using
    (TauCeti.card_squareRoot_eq_sum_frobeniusSchurIndicatorRow_mul_characterTable ℂ G x)

/-! ### Layer 8: Frobenius groups and Frobenius's theorem -/

/-- **A Frobenius complement**: `H` is proper and nontrivial, and a trivial-intersection subgroup, meeting
each distinct conjugate trivially (`MulAut.conj g • H` is the conjugate subgroup). Then `G` is a
Frobenius group with complement `H`. -/
abbrev IsFrobeniusComplement := @TauCeti.IsFrobeniusComplement

/-- **A trivial-intersection (T.I.) set** relative to `H`: a subset `S` (in practice the nonidentity part
`H# = (H : Set G) \ {1}`, a union of nonidentity classes of `H`) whose distinct `G`-conjugates are disjoint
and normalized by `H`. The load-bearing property, pinned as `isometry_ind_of_isTISet`, is that a class
function on `H` *supported on `S`* (vanishing outside `H#`), extended by zero, induces to `G` with its norm
preserved. Raw differences `χᵢ - χⱼ` vanish at one only when their degrees agree;
otherwise use native `ClassFunction.indExtend` with its degree correction. Norm preservation
and the separate irreducible-orthogonality norm-two calculation are distinct statements. -/
abbrev IsTISet := @TauCeti.IsTISet

/-- **The Frobenius kernel** `{1} ∪ (G ∖ ⋃_g g H g⁻¹)`: the identity and the elements in no conjugate of the
complement. -/
def frobeniusKernel : ∀ {G : Type v} [Group G] (_H : Subgroup G),
    Set G := fun H => TauCeti.frobeniusKernel H

/-- **Frobenius's theorem** (proved via the T.I.-set and exceptional-character route; no character-free
proof is known): the kernel is a `Subgroup`. Promoted to a bundled `Subgroup G` so downstream results need
not carry a chosen `N` and a carrier-equality proof. -/
noncomputable def frobeniusKernelSubgroup : ∀ {G : Type v} [Group G] [Finite G] (H : Subgroup G)
    (_hH : IsFrobeniusComplement H),
    Subgroup G := fun _ hH => TauCeti.frobeniusKernelSubgroup hH.isTISubgroup

theorem coe_frobeniusKernelSubgroup {G : Type v} [Group G] [Finite G] (H : Subgroup G)
    (hH : IsFrobeniusComplement H) :
    (frobeniusKernelSubgroup H hH : Set G) = frobeniusKernel H := TauCeti.coe_frobeniusKernelSubgroup hH.isTISubgroup

theorem frobeniusKernelSubgroup_normal {G : Type v} [Group G] [Finite G] (H : Subgroup G)
    (hH : IsFrobeniusComplement H) : (frobeniusKernelSubgroup H hH).Normal := TauCeti.frobeniusKernelSubgroup_normal hH.isTISubgroup

/-- **The semidirect decomposition** `G = N ⋊ H`: the kernel is a complement to `H`. -/
theorem frobeniusKernel_isComplement' {G : Type v} [Group G] [Finite G] (H : Subgroup G)
    (hH : IsFrobeniusComplement H) : (frobeniusKernelSubgroup H hH).IsComplement' H := TauCeti.frobeniusKernel_isComplement' hH.isTISubgroup

/-- The existing degree-corrected exceptional extension; it preserves degree and pairing.
For raw χi−χj, equality of degrees is the separate vanishing-at-one hypothesis. -/
noncomputable abbrev exceptionalExtension {G : Type v} [Group G] [Fintype G]
    (H : Subgroup G) : ClassFunction ℂ H →ₗ[ℂ] ClassFunction ℂ G :=
  TauCeti.ClassFunction.indExtend H

theorem exceptionalExtension_pairing {G : Type v} [Group G] [Fintype G]
    (H : Subgroup G) (hH : TauCeti.IsTISubgroup H) (f g : ClassFunction ℂ H) :
    characterPairing (exceptionalExtension H f) (exceptionalExtension H g) =
      characterPairing f g :=
  TauCeti.ClassFunction.characterPairing_indExtend_indExtend
    (isUnit_iff_ne_zero.mpr (Nat.cast_ne_zero.mpr (Nat.card_pos.ne'))) hH f g

/-! ### Layer 9: the representation theory of GL₂(𝔽_q) -/

/-- **The Borel subgroup** of `GL₂(𝔽_q)`: the upper-triangular matrices `B = T U`. -/
def GL2Borel (F : Type u) [Field F] [Fintype F] [DecidableEq F] : Subgroup (GL (Fin 2) F) := TauCeti.GL2Borel F

/-- **The class count**: `GL₂(𝔽_q)` has `q² - 1` conjugacy classes (central, split semisimple, unipotent,
elliptic), hence `q² - 1` irreducibles. -/
theorem card_conjClasses_GL2 (F : Type u) [Field F] [Fintype F] [DecidableEq F] :
    Nat.card (ConjClasses (GL (Fin 2) F)) = (Fintype.card F) ^ 2 - 1 := by simpa only [Nat.card_eq_fintype_card] using TauCeti.card_conjClasses_GL2 F

/-- **The principal series** `Ind_B^{GL₂}(α ⊗ β)`, dimension `q + 1`; irreducible iff `α ≠ β`. -/
noncomputable def GL2PrincipalSeries (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (α β : Fˣ →* ℂˣ) : FDRep ℂ (GL (Fin 2) F) := TauCeti.GL2PrincipalSeries F α β

/-- The principal series has dimension `q + 1` (read off `char_one`). -/
theorem character_one_GL2PrincipalSeries (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (α β : Fˣ →* ℂˣ) :
    (GL2PrincipalSeries F α β).character 1 = (Fintype.card F : ℂ) + 1 := TauCeti.character_one_GL2PrincipalSeries F α β

/-- The principal series is irreducible exactly when `α ≠ β`. -/
theorem simple_GL2PrincipalSeries_iff (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (α β : Fˣ →* ℂˣ) :
    CategoryTheory.Simple (GL2PrincipalSeries F α β) ↔ α ≠ β := sorry

/-- Existing same-universe theorem, not a second irreducibility proof. The preceding
arbitrary-universe target is the finite-field small-model transport comparison. -/
theorem simple_GL2PrincipalSeries_iff_small (F : Type) [Field F] [Fintype F] [DecidableEq F]
    (α β : Fˣ →* ℂˣ) :
    CategoryTheory.Simple (GL2PrincipalSeries F α β) ↔ α ≠ β :=
  TauCeti.simple_GL2PrincipalSeries_iff F α β

/-- **The Steinberg representation**, the dimension-`q` constituent of `Ind_B(α α)` beside the linear
character `α ∘ det`. -/
noncomputable def GL2Steinberg (F : Type u) [Field F] [Fintype F] [DecidableEq F] :
    FDRep ℂ (GL (Fin 2) F) := TauCeti.GL2Steinberg F

/-- **The non-split (elliptic) torus** `𝔽_{q²}^× ↪ GL₂(𝔽_q)`, embedded through a chosen `F`-basis of a
degree-`2` extension `E` of `F` (so `Fintype.card E = q²`). The source of the cuspidal series; the
degree-`2` extension is itself a build target, not an ambient `[Field F] [Fintype F]` datum. -/
noncomputable def GL2NonSplitTorus : ∀ (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (E : Type u) [Field E] [Fintype E] [Algebra F E] (_hE : Module.finrank F E = 2),
    Subgroup (GL (Fin 2) F) := fun F _ _ _ E _ _ _ hE => by
  letI : Algebra.IsQuadraticExtension F E := { finrank_eq_two' := hE }
  exact TauCeti.GL2NonSplitTorus F E

/-- **A cuspidal (discrete-series) representation** of dimension `q - 1`, attached to a character
`θ : Eˣ →* ℂˣ` of the non-split torus that does *not* factor through the norm (`θ ≠ θ ∘ Frob`); `θ` and its
`q`-power twist give the same representation, so the cuspidals are parametrized by the `½q(q-1)` such orbits.
These are exactly the irreducibles absent from every principal series. The degree-2 hypothesis and
the regularity of `θ` (it does not factor through the norm: `θ^q ≠ θ`) are carried explicitly — the
dimension claim below is false without them. -/
noncomputable def GL2Cuspidal : ∀ (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (E : Type u) [Field E] [Fintype E] [Algebra F E] (_hE : Module.finrank F E = 2)
    (θ : Eˣ →* ℂˣ) (_hθ : ∃ x : Eˣ, θ (x ^ Fintype.card F) ≠ θ x),
    FDRep ℂ (GL (Fin 2) F) := fun F _ _ _ E _ _ _ hE θ hθ => by
  letI : Algebra.IsQuadraticExtension F E := { finrank_eq_two' := hE }
  exact TauCeti.GL2Cuspidal θ (by
    intro h
    obtain ⟨x, hx⟩ := hθ
    exact hx (congrArg (fun f : Eˣ →* ℂˣ => f x) h))

/-- The cuspidal representation has dimension `q - 1` (read off `char_one`). -/
theorem character_one_GL2Cuspidal (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (E : Type u) [Field E] [Fintype E] [Algebra F E] (hE : Module.finrank F E = 2)
    (θ : Eˣ →* ℂˣ) (hθ : ∃ x : Eˣ, θ (x ^ Fintype.card F) ≠ θ x) :
    (GL2Cuspidal F E hE θ hθ).character 1 = (Fintype.card F : ℂ) - 1 := by
  let : Algebra.IsQuadraticExtension F E := { finrank_eq_two' := hE }
  have hθ' : θ.comp (powMonoidHom (Fintype.card F)) ≠ θ := by
    intro h
    obtain ⟨x, hx⟩ := hθ
    exact hx (congrArg (fun f : Eˣ →* ℂˣ => f x) h)
  change (TauCeti.GL2Cuspidal θ hθ').character 1 = _
  rw [FDRep.char_one, TauCeti.finrank_GL2Cuspidal]
  simpa only [Nat.cast_one] using
    (Nat.cast_sub (R := ℂ) (show 1 ≤ Fintype.card F from Fintype.card_pos))

end TauCetiRoadmap.RepresentationTheory.CharacterTheory


/- Exact rational matrix witnesses for the spring-system application.
   These finite identities do not construct the representation-theoretic or analytic adapters. -/
namespace TauCetiRoadmap.RepresentationTheory.CharacterTheory.SpringSystems

def force : Matrix (Fin 12) (Fin 12) ℚ :=
  !![-2, -1, -1, 1, 1, 0, 1, 0, 1, 0, 0, 0;
  -1, -2, -1, 1, 1, 0, 0, 0, 0, 0, 1, 1;
  -1, -1, -2, 0, 0, 0, 1, 0, 1, 0, 1, 1;
  1, 1, 0, -2, -1, 1, 0, 0, 0, 1, 0, -1;
  1, 1, 0, -1, -2, 1, 0, 1, -1, 0, 0, 0;
  0, 0, 0, 1, 1, -2, 0, -1, 1, -1, 0, 1;
  1, 0, 1, 0, 0, 0, -2, 1, -1, 1, -1, 0;
  0, 0, 0, 0, 1, -1, 1, -2, 1, -1, 1, 0;
  1, 0, 1, 0, -1, 1, -1, 1, -2, 0, 0, 0;
  0, 0, 0, 1, 0, -1, 1, -1, 0, -2, 1, 1;
  0, 1, 1, 0, 0, 0, -1, 1, 0, 1, -2, -1;
  0, 1, 1, -1, 0, 1, 0, 0, 0, 1, -1, -2]

def modes : Matrix (Fin 12) (Fin 12) ℚ :=
  !![1, 0, 0, -1, -1, 0, -1, 0, -1, -1, 0, -1;
  0, 1, 0, 1, 0, -1, 1, -1, -1, 0, -1, -1;
  0, 0, 1, 0, 1, 1, 0, 1, 0, -1, -1, -1;
  1, 0, 0, 1, -1, 0, 1, 0, 1, -1, 0, 1;
  0, 1, 0, -1, 0, -1, -1, 1, 1, 0, -1, 1;
  0, 0, 1, 0, -1, -1, 0, 1, 0, 1, 1, -1;
  1, 0, 0, -1, 1, 0, 1, 0, -1, 1, 0, 1;
  0, 1, 0, -1, 0, 1, 1, -1, 1, 0, 1, -1;
  0, 0, 1, 0, -1, 1, 0, -1, 0, 1, -1, 1;
  1, 0, 0, 1, 1, 0, -1, 0, 1, 1, 0, -1;
  0, 1, 0, 1, 0, 1, -1, 1, -1, 0, 1, 1;
  0, 0, 1, 0, 1, -1, 0, -1, 0, -1, 1, 1]

def inverseModes : Matrix (Fin 12) (Fin 12) ℚ :=
  !![(1 / 4), 0, 0, (1 / 4), 0, 0, (1 / 4), 0, 0, (1 / 4), 0, 0;
  0, (1 / 4), 0, 0, (1 / 4), 0, 0, (1 / 4), 0, 0, (1 / 4), 0;
  0, 0, (1 / 4), 0, 0, (1 / 4), 0, 0, (1 / 4), 0, 0, (1 / 4);
  (-1 / 8), (1 / 8), 0, (1 / 8), (-1 / 8), 0, (-1 / 8), (-1 / 8), 0, (1 / 8), (1 / 8), 0;
  (-1 / 8), 0, (1 / 8), (-1 / 8), 0, (-1 / 8), (1 / 8), 0, (-1 / 8), (1 / 8), 0, (1 / 8);
  0, (-1 / 8), (1 / 8), 0, (-1 / 8), (-1 / 8), 0, (1 / 8), (1 / 8), 0, (1 / 8), (-1 / 8);
  (-1 / 6), (1 / 12), (1 / 12), (1 / 6), (-1 / 12), (1 / 12), (1 / 6), (1 / 12), (-1 / 12), (-1 / 6), (-1 / 12), (-1 / 12);
  (-1 / 12), (-1 / 12), (1 / 6), (1 / 12), (1 / 12), (1 / 6), (1 / 12), (-1 / 12), (-1 / 6), (-1 / 12), (1 / 12), (-1 / 6);
  (-1 / 8), (-1 / 8), 0, (1 / 8), (1 / 8), 0, (-1 / 8), (1 / 8), 0, (1 / 8), (-1 / 8), 0;
  (-1 / 8), 0, (-1 / 8), (-1 / 8), 0, (1 / 8), (1 / 8), 0, (1 / 8), (1 / 8), 0, (-1 / 8);
  0, (-1 / 8), (-1 / 8), 0, (-1 / 8), (1 / 8), 0, (1 / 8), (-1 / 8), 0, (1 / 8), (1 / 8);
  (-1 / 12), (-1 / 12), (-1 / 12), (1 / 12), (1 / 12), (-1 / 12), (1 / 12), (-1 / 12), (1 / 12), (-1 / 12), (1 / 12), (1 / 12)]

def eigenvalues : Fin 12 → ℚ := ![0, 0, 0, 0, 0, 0, -2, -2, -4, -4, -4, -8]

set_option maxHeartbeats 6000000 in
theorem force_modes : force * modes = modes * Matrix.diagonal eigenvalues := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [force, modes, eigenvalues, Matrix.mul_apply, Fin.sum_univ_succ]

set_option maxHeartbeats 6000000 in
theorem inverse_modes : inverseModes * modes = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [inverseModes, modes, Matrix.mul_apply, Fin.sum_univ_succ]

end TauCetiRoadmap.RepresentationTheory.CharacterTheory.SpringSystems
