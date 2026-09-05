import Mathlib
import TauCetiRoadmap.IntegralLattices.Suggested

/-!
# Algebraic coding theory and Construction A: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below suggest Lean forms for load-bearing milestones, so that
contributors and reviewers can test the carrier choices, normalizations, and dependency boundary.
Proving every declaration here would not by itself complete a layer or the roadmap. `sorry` is
permitted in this human-owned roadmap repository: these are targets, not implementations.

Linear codes remain Mathlib `Submodule`s and additive codes remain `AddSubgroup`s. Hamming weight
is Mathlib's `hammingNorm`. Construction A uses the rational form `dotProduct / m`, and its gluing
comparison consumes the integral-lattices roadmap's actual discriminant quotient and
`ofIsotropicSubgroup`. The Markdown roadmap remains definitive.
-/

namespace TauCetiRoadmap.AlgebraicCodingTheory

open scoped BigOperators
open MvPolynomial

universe u v w

/-! ## Carriers, matrix presentations, and elementary operations -/

/-- The primary representation: no length or dimension is bundled into the code. -/
abbrev LinearCode (F : Type u) [Field F] (ι : Type v) := Submodule F (ι → F)

/-- Additive codes include the subgroups used as discriminant glue. -/
abbrev AdditiveCode (A : Type u) [AddCommGroup A] (ι : Type v) := AddSubgroup (ι → A)

section LinearCodes

variable {F : Type u} [Field F]
variable {ι : Type v} [Fintype ι]
variable {ρ : Type w} [Fintype ρ]

/-- The standard Euclidean bilinear form, with no field involution. -/
def standardBilin : LinearMap.BilinForm F (ι → F) := dotProductBilin F F

/-- The Euclidean dual code is Mathlib's orthogonal submodule. -/
def dual (C : LinearCode F ι) : LinearCode F ι := (standardBilin (F := F) (ι := ι)).orthogonal C

theorem mem_dual_iff (C : LinearCode F ι) (y : ι → F) :
    y ∈ dual C ↔ ∀ x ∈ C, ∑ i, x i * y i = 0 := sorry

/-- Row vectors multiply the generator matrix on the left. -/
def generatedCode (G : Matrix ρ ι F) : LinearCode F ι := LinearMap.range G.vecMulLinear

/-- A parity-check matrix sends a word to its syndrome. -/
def checkedCode {σ : Type*} [Fintype σ] (H : Matrix σ ι F) : LinearCode F ι :=
  LinearMap.ker H.mulVecLin

def IsGeneratorMatrix (G : Matrix ρ ι F) (C : LinearCode F ι) : Prop :=
  generatedCode G = C

def IsParityCheckMatrix {σ : Type*} [Fintype σ]
    (H : Matrix σ ι F) (C : LinearCode F ι) : Prop :=
  checkedCode H = C

/-- A generator for `C` is a parity check for `C⊥`, with the pinned row convention. -/
theorem generator_iff_check_dual (G : Matrix ρ ι F) (C : LinearCode F ι) :
    IsGeneratorMatrix G C ↔ IsParityCheckMatrix G (dual C) := sorry

/-! Hermitian duality is expressed through Mathlib's sesquilinear maps.  The form below is
linear in its first input and `σ`-semilinear in its second input. -/

/-- The coordinate Hermitian form `Σ i, x i * σ (y i)` for a chosen field automorphism. -/
noncomputable def standardHermitian (σ : F ≃+* F) :
    (ι → F) →ₗ[F] (ι → F) →ₛₗ[σ.toRingHom] F := sorry

theorem standardHermitian_apply (σ : F ≃+* F) (x y : ι → F) :
    standardHermitian σ x y = ∑ i, x i * σ (y i) := sorry

theorem standardHermitian_nondegenerate (σ : F ≃+* F) :
    (standardHermitian (ι := ι) σ).Nondegenerate := sorry

/-- The Hermitian dual uses `orthogonalBilin`, not the Euclidean `BilinForm.orthogonal`. -/
noncomputable def hermitianDual (σ : F ≃+* F) (C : LinearCode F ι) : LinearCode F ι :=
  C.orthogonalBilin (standardHermitian σ)

theorem mem_hermitianDual_iff (σ : F ≃+* F) (C : LinearCode F ι) (y : ι → F) :
    y ∈ hermitianDual σ C ↔ ∀ x ∈ C, ∑ i, x i * σ (y i) = 0 := sorry

theorem hermitianDual_hermitianDual (σ : F ≃+* F) (hσ : Function.Involutive σ)
    (C : LinearCode F ι) :
    hermitianDual σ (hermitianDual σ C) = C := sorry

theorem finrank_add_finrank_hermitianDual (σ : F ≃+* F) (hσ : Function.Involutive σ)
    (C : LinearCode F ι) :
    Module.finrank F C + Module.finrank F (hermitianDual σ C) = Fintype.card ι := sorry

/-- With our orientation, the conjugated generator, not `G`, checks the Hermitian dual. -/
theorem generator_iff_conjugate_check_hermitianDual
    (σ : F ≃+* F) (hσ : Function.Involutive σ)
    (G : Matrix ρ ι F) (C : LinearCode F ι) :
    IsGeneratorMatrix G C ↔
      IsParityCheckMatrix (G.map σ) (hermitianDual σ C) := sorry

/-- Puncturing retains exactly the coordinates in `s`. -/
noncomputable def puncture (C : LinearCode F ι) (s : Set ι) [Fintype s] :
    LinearCode F s := sorry

/-- Shortening first imposes zero outside `s`, then retains `s`. -/
noncomputable def shorten (C : LinearCode F ι) (s : Set ι) [Fintype s] :
    LinearCode F s := sorry

/-- Direct sum uses a disjoint-union coordinate type. -/
noncomputable def directSum {κ : Type*} [Fintype κ]
    (C : LinearCode F ι) (D : LinearCode F κ) : LinearCode F (ι ⊕ κ) := sorry

theorem dual_puncture (C : LinearCode F ι) (s : Set ι) [Fintype s] :
    dual (puncture C s) = shorten (dual C) s := sorry

theorem dual_shorten (C : LinearCode F ι) (s : Set ι) [Fintype s] :
    dual (shorten C s) = puncture (dual C) s := sorry

/-- Data for a coordinate permutation followed by multiplication by nonzero scalars. -/
structure MonomialEquiv (κ : Type*) where
  reindex : ι ≃ κ
  scale : κ → Fˣ

noncomputable def MonomialEquiv.toLinearEquiv {κ : Type*}
    (e : MonomialEquiv (F := F) (ι := ι) κ) : (ι → F) ≃ₗ[F] (κ → F) := sorry

def MonomialEquiv.mapsCode {κ : Type*}
    (e : MonomialEquiv (F := F) (ι := ι) κ)
    (C : LinearCode F ι) (D : LinearCode F κ) : Prop :=
  C.map e.toLinearEquiv.toLinearMap = D

/-- The stabilizer notion behind `Aut(C)`; permutation automorphisms are a named subgroup. -/
def IsMonomialAutomorphism (C : LinearCode F ι)
    (e : MonomialEquiv (F := F) (ι := ι) ι) : Prop := e.mapsCode C C

end LinearCodes

/-! ## Hamming data and weight enumerators -/

section Hamming

variable {F : Type u} [Field F] [Finite F] [DecidableEq F]
variable {ι : Type v} [Fintype ι]

/-- The zero code has minimum distance zero.  This follows Mathlib PR #38014's `Set.infsep`
interface; a later bridge identifies `Fin n` instances with its `InformationTheory.minDist`. -/
noncomputable def minimumDistance (C : LinearCode F ι) : ℕ :=
  ⌊({x : Hamming fun _ : ι ↦ F | Hamming.ofHamming x ∈ C} :
      Set (Hamming fun _ : ι ↦ F)).infsep⌋₊

/-- The metric definition equals the least-nonzero-weight formula, including the empty-set
convention for the zero code. -/
theorem minimumDistance_eq_sInf_weights (C : LinearCode F ι) :
    minimumDistance C =
      sInf {d : ℕ | ∃ c : C, (c : ι → F) ≠ 0 ∧ d = hammingNorm (c : ι → F)} := sorry

theorem minimumDistance_eq_minimumWeight (C : LinearCode F ι) (hC : C ≠ ⊥) :
    ∃ c : C, (c : ι → F) ≠ 0 ∧ hammingNorm (c : ι → F) = minimumDistance C := sorry

/-- Coefficients are integral and variables `0,1` are respectively `X,Y`. -/
noncomputable def weightEnumerator (C : LinearCode F ι) : MvPolynomial (Fin 2) ℤ := by
  classical
  letI := Fintype.ofFinite C
  exact ∑ c : C,
    X 0 ^ (Fintype.card ι - hammingNorm (c : ι → F)) *
      X 1 ^ hammingNorm (c : ι → F)

/-- The integral MacWilliams substitution `(X,Y) ↦ (X+(q-1)Y,X-Y)`. -/
noncomputable def macWilliamsSubstitution (q : ℕ) :
    MvPolynomial (Fin 2) ℤ →+* MvPolynomial (Fin 2) ℤ :=
  eval₂Hom (MvPolynomial.C : ℤ →+* MvPolynomial (Fin 2) ℤ)
    ![X 0 + C ((q : ℤ) - 1) * X 1, X 0 - X 1]

/-- Division-free, hence valid over the integral coefficient ring. -/
theorem macWilliams (D : LinearCode F ι) :
    MvPolynomial.C (Nat.card D : ℤ) * weightEnumerator (dual D) =
      macWilliamsSubstitution (Nat.card F) (weightEnumerator D) := sorry

theorem weightEnumerator_directSum {κ : Type*} [Fintype κ]
    (C₁ : LinearCode F ι) (C₂ : LinearCode F κ) :
    weightEnumerator (directSum C₁ C₂) = weightEnumerator C₁ * weightEnumerator C₂ := sorry

end Hamming

/-! ## Binary Type II codes -/

abbrev F2 := ZMod 2

section TypeII

variable {ι : Type v} [Fintype ι]

def IsDoublyEven (C : LinearCode F2 ι) : Prop :=
  ∀ c ∈ C, 4 ∣ hammingNorm c

def IsSelfDual (C : LinearCode F2 ι) : Prop := dual C = C

def IsTypeII (C : LinearCode F2 ι) : Prop := IsDoublyEven C ∧ IsSelfDual C

theorem typeII_length_mod_eight (C : LinearCode F2 ι) (hC : IsTypeII C) :
    Fintype.card ι % 8 = 0 := sorry

/-- Self-duality gives the integral, division-free MacWilliams invariance. -/
theorem typeII_macWilliams_invariance (C : LinearCode F2 ι) (hC : IsTypeII C) :
    macWilliamsSubstitution 2 (weightEnumerator C) =
      MvPolynomial.C ((2 ^ (Fintype.card ι / 2) : ℕ) : ℤ) * weightEnumerator C := sorry

/-- The substitution `(X,Y) ↦ (X,iY)` after the coefficient base change `ℤ → ℂ`. -/
noncomputable def typeIIRotationSubstitution :
    MvPolynomial (Fin 2) ℂ →+* MvPolynomial (Fin 2) ℂ :=
  eval₂Hom (MvPolynomial.C : ℂ →+* MvPolynomial (Fin 2) ℂ)
    ![X 0, C Complex.I * X 1]

/-- Divisibility of all weights by four gives `W_C(X,iY)=W_C(X,Y)`. -/
theorem typeII_rotation_invariance (C : LinearCode F2 ι) (hC : IsTypeII C) :
    typeIIRotationSubstitution
        (MvPolynomial.map (Int.castRingHom ℂ) (weightEnumerator C)) =
      MvPolynomial.map (Int.castRingHom ℂ) (weightEnumerator C) := sorry

end TypeII

/-! ## Explicit exceptional codes -/

/-- The ternary tetracode matrix, in the displayed coordinate order from the roadmap. -/
def tetracodeGenerator : Matrix (Fin 2) (Fin 4) (ZMod 3) :=
  ![![1, 0, 1, 1], ![0, 1, 1, -1]]

def tetracode : LinearCode (ZMod 3) (Fin 4) := generatedCode tetracodeGenerator

theorem tetracode_selfDual : dual tetracode = tetracode := sorry

theorem tetracode_minimumDistance : minimumDistance tetracode = 3 := sorry

/-- The chosen four-element field; changing the root of `X²+X+1` gives an equivalent code. -/
abbrev F4 := GaloisField 2 2

noncomputable local instance : DecidableEq F4 := Classical.decEq F4

noncomputable def omega : F4 := sorry

theorem omega_spec : omega ^ 2 + omega + 1 = 0 := sorry

noncomputable def hexacodeGenerator : Matrix (Fin 3) (Fin 6) F4 :=
  ![![1, 0, 0, 1, omega, omega],
    ![0, 1, 0, omega, 1, omega],
    ![0, 0, 1, omega, omega, 1]]

noncomputable def hexacode : LinearCode F4 (Fin 6) := generatedCode hexacodeGenerator

/-- Frobenius squaring as the nontrivial involutive automorphism of `F₄`. -/
noncomputable def frobeniusF4 : F4 ≃+* F4 := sorry

theorem frobeniusF4_apply (x : F4) : frobeniusF4 x = x ^ 2 := sorry

theorem frobeniusF4_involutive : Function.Involutive frobeniusF4 := sorry

/-- Hermitian duality is the generic sesquilinear construction specialized to Frobenius. -/
noncomputable abbrev hermitianDualF4 (C : LinearCode F4 (Fin 6)) :
    LinearCode F4 (Fin 6) := hermitianDual frobeniusF4 C

theorem hexacode_hermitian_selfDual : hermitianDualF4 hexacode = hexacode := sorry

theorem hexacode_minimumDistance : minimumDistance hexacode = 4 := sorry

/-- Entrywise Frobenius conjugation of an `F₄`-linear code. -/
noncomputable def frobeniusConjugateF4 {n : ℕ} (C : LinearCode F4 (Fin n)) :
    LinearCode F4 (Fin n) := sorry

/-- In one-based notation this is the coordinate ordering `(1,2,4,6,3,5)`. -/
noncomputable def hexacodeConjugationPermutation : Equiv.Perm (Fin 6) := sorry

theorem hexacodeConjugationPermutation_values :
    List.ofFn (fun i ↦ (hexacodeConjugationPermutation i).val + 1) = [1, 2, 4, 6, 3, 5] := sorry

/-- Exchanging `ω` and `ω²` produces a genuinely permutation-equivalent code. -/
theorem hexacode_conjugate_permutation_equivalent :
    ∃ e : MonomialEquiv (F := F4) (ι := Fin 6) (Fin 6),
      e.reindex = hexacodeConjugationPermutation ∧
        e.mapsCode (frobeniusConjugateF4 hexacode) hexacode := sorry

theorem hexacode_frobeniusConjugate_ne : frobeniusConjugateF4 hexacode ≠ hexacode := sorry

theorem natCard_hexacode_inf_frobeniusConjugate :
    Nat.card ↑(hexacode ⊓ frobeniusConjugateF4 hexacode) = 4 := sorry

/-- The displayed rows are Hermitian-orthogonal; this is the Gram-matrix convention check. -/
theorem hexacodeGenerator_hermitian_gram_zero :
    hexacodeGenerator * (hexacodeGenerator.map frobeniusF4).transpose = 0 := sorry

/-- The same matrix is not Euclidean self-orthogonal. -/
theorem hexacodeGenerator_euclidean_gram_ne_zero :
    hexacodeGenerator * hexacodeGenerator.transpose ≠ 0 := sorry

/-- The quadratic residues modulo eleven, together with zero. -/
def isGolayResidue (a : ℕ) : Bool :=
  a % 11 == 0 || a % 11 == 1 || a % 11 == 3 ||
    a % 11 == 4 || a % 11 == 5 || a % 11 == 9

/-- The bordered reverse-circulant block in Huffman--Pless §1.9.1; index zero is the border. -/
def binaryGolayBlock : Matrix (Fin 12) (Fin 12) F2 := fun i j ↦
  if i.val = 0 then
    if j.val = 0 then 0 else 1
  else if j.val = 0 then 1
  else if isGolayResidue ((i.val - 1) + (j.val - 1)) then 1 else 0

/-- A concrete systematic generator `[I₁₂ | A]`, on sum coordinates. -/
def binaryGolayGenerator : Matrix (Fin 12) (Fin 12 ⊕ Fin 12) F2 := fun i j ↦
  match j with
  | Sum.inl k => if i = k then 1 else 0
  | Sum.inr k => binaryGolayBlock i k

def extendedBinaryGolay : LinearCode F2 (Fin 12 ⊕ Fin 12) :=
  generatedCode binaryGolayGenerator

theorem binaryGolayGenerator_isParityCheck :
    IsParityCheckMatrix binaryGolayGenerator extendedBinaryGolay := sorry

theorem extendedBinaryGolay_typeII : IsTypeII extendedBinaryGolay := sorry

theorem extendedBinaryGolay_minimumDistance : minimumDistance extendedBinaryGolay = 8 := sorry

theorem extendedBinaryGolay_weightEnumerator :
    weightEnumerator extendedBinaryGolay =
      X 0 ^ 24 + 759 * X 0 ^ 16 * X 1 ^ 8 + 2576 * X 0 ^ 12 * X 1 ^ 12 +
        759 * X 0 ^ 8 * X 1 ^ 16 + X 1 ^ 24 := sorry

def ternaryGolayBlock : Matrix (Fin 6) (Fin 6) (ZMod 3) :=
  ![![0, 1, 1, 1, 1, 1],
    ![1, 0, 1, 2, 2, 1],
    ![1, 1, 0, 1, 2, 2],
    ![1, 2, 1, 0, 1, 2],
    ![1, 2, 2, 1, 0, 1],
    ![1, 1, 2, 2, 1, 0]]

def ternaryGolayGenerator : Matrix (Fin 6) (Fin 6 ⊕ Fin 6) (ZMod 3) := fun i j ↦
  match j with
  | Sum.inl k => if i = k then 1 else 0
  | Sum.inr k => ternaryGolayBlock i k

def extendedTernaryGolay : LinearCode (ZMod 3) (Fin 6 ⊕ Fin 6) :=
  generatedCode ternaryGolayGenerator

theorem extendedTernaryGolay_selfDual : dual extendedTernaryGolay = extendedTernaryGolay := sorry

theorem extendedTernaryGolay_minimumDistance : minimumDistance extendedTernaryGolay = 6 := sorry

/-! ## Construction A and the discriminant-subgroup bridge -/

open TauCetiRoadmap.IntegralLattices

section ConstructionA

variable {ι : Type v} [Fintype ι]

/-- Orthogonality for additive `ZMod m` codes uses the coordinate dot product. -/
noncomputable def zmodDual (m : ℕ) (_hm : 2 ≤ m) (C : AdditiveCode (ZMod m) ι) :
    AdditiveCode (ZMod m) ι := sorry

/-- At modulus two the additive and linear Euclidean duals are the same carrier. -/
theorem zmodDual_two_toAddSubgroup (C : LinearCode F2 ι) :
    zmodDual 2 (by decide) C.toAddSubgroup = (dual C).toAddSubgroup := sorry

/-- The inverse image of `C` in integer vectors, embedded in the fixed rational ambient space. -/
noncomputable def constructionACarrier (m : ℕ) (_hm : 2 ≤ m)
    (C : AdditiveCode (ZMod m) ι) :
    Submodule ℤ (ι → ℚ) := sorry

theorem mem_constructionACarrier_iff (m : ℕ) (hm : 2 ≤ m)
    (C : AdditiveCode (ZMod m) ι)
    (x : ι → ℚ) :
    x ∈ constructionACarrier m hm C ↔
      ∃ z : ι → ℤ, (∀ i, x i = (z i : ℚ)) ∧ (fun i ↦ (z i : ZMod m)) ∈ C := sorry

/-- The rational normalization corresponding over `ℝ` to scaling vectors by `m⁻¹/²`. -/
noncomputable def constructionAForm (m : ℕ) (_hm : 2 ≤ m) : LinearMap.BilinForm ℚ (ι → ℚ) :=
  (m : ℚ)⁻¹ • dotProductBilin ℚ ℚ

/-- Integrality requires exactly self-orthogonality of the residue code. -/
noncomputable def constructionA (m : ℕ) (hm : 2 ≤ m) (C : AdditiveCode (ZMod m) ι)
    (hC : C ≤ zmodDual m hm C) : IntegralLattice (ι → ℚ) := sorry

/-- The form `B_m` is a nonzero scaling of the dot product, so it is nondegenerate; since
nondegeneracy is now a mixin rather than a structure field, every Construction-A lattice carries
it as an instance. -/
instance (m : ℕ) (hm : 2 ≤ m) (C : AdditiveCode (ZMod m) ι) (hC : C ≤ zmodDual m hm C) :
    (constructionA m hm C hC).IsNondegenerate := sorry

/-- Dual carriers are identified literally in the same rational ambient space. -/
theorem constructionA_dual (m : ℕ) (hm : 2 ≤ m) (C : AdditiveCode (ZMod m) ι)
    (hC : C ≤ zmodDual m hm C) :
    (constructionA m hm C hC).dual = constructionACarrier m hm (zmodDual m hm C) := sorry

theorem constructionA_unimodular_iff (m : ℕ) (hm : 2 ≤ m)
    (C : AdditiveCode (ZMod m) ι) (hC : C ≤ zmodDual m hm C) :
    (constructionA m hm C hC).IsUnimodular ↔ C = zmodDual m hm C := sorry

/-- For even `m`, this is independent of the chosen integer representatives. -/
noncomputable def constructionAQuadraticValue (m : ℕ) (_hm₂ : 2 ≤ m) (_hmeven : Even m)
    (c : ι → ZMod m) : AddCircle (1 : ℚ) :=
  ((↑((∑ i, ((c i).val : ℚ) ^ 2 / (2 * (m : ℚ))) : ℚ)) : AddCircle (1 : ℚ))

/-- Any integer lifts give the same half-norm residue value. -/
theorem constructionAQuadraticValue_eq_sum_lifts
    (m : ℕ) (hm₂ : 2 ≤ m) (hmeven : Even m) (c : ι → ZMod m)
    (z : ι → ℤ) (hz : ∀ i, (z i : ZMod m) = c i) :
    constructionAQuadraticValue m hm₂ hmeven c =
      (↑((∑ i, (z i : ℚ) ^ 2 / (2 * (m : ℚ))) : ℚ) : AddCircle (1 : ℚ)) := sorry

theorem constructionA_even_iff (m : ℕ) (hm₂ : 2 ≤ m) (hmeven : Even m)
    (C : AdditiveCode (ZMod m) ι) (hC : C ≤ zmodDual m hm₂ C) :
    (constructionA m hm₂ C hC).IsEven ↔
      ∀ c ∈ C, constructionAQuadraticValue m hm₂ hmeven c = 0 := sorry

/-- The half-norm residue value at modulus two is Hamming weight divided by four. -/
theorem constructionAQuadraticValue_two (c : ι → F2) :
    constructionAQuadraticValue 2 (by decide) (by decide) c =
      ((↑((hammingNorm c : ℚ) / 4) : AddCircle (1 : ℚ))) := sorry

/-- Euclidean weight for a residue word, using least absolute residue representatives. -/
noncomputable def zmodEuclideanWeight (m : ℕ) (_hm₂ : 2 ≤ m) (c : ι → ZMod m) : ℕ :=
  ∑ i, min (c i).val (m - (c i).val) ^ 2

/-- The published higher-modulus Type II notion is restricted to `Z/(2^r)`. -/
def IsTypeIIZModTwoPower (r : ℕ) (hr : 1 ≤ r)
    (C : AdditiveCode (ZMod (2 ^ r)) ι) : Prop :=
  let hm : 2 ≤ 2 ^ r := by
    simpa using (pow_le_pow_right' (a := (2 : ℕ)) (by omega) hr)
  C = zmodDual (2 ^ r) hm C ∧
    ∀ c ∈ C, 2 ^ (r + 1) ∣ zmodEuclideanWeight (2 ^ r) hm c

/-- Dougherty--Gulliver--Harada's Type II/even-unimodular Construction-A implication. -/
theorem constructionA_typeIIZModTwoPower_even_unimodular
    (r : ℕ) (hr : 1 ≤ r) (C : AdditiveCode (ZMod (2 ^ r)) ι)
    (hC : IsTypeIIZModTwoPower r hr C) :
    let hm : 2 ≤ 2 ^ r := by
      simpa using (pow_le_pow_right' (a := (2 : ℕ)) (by omega) hr)
    ∃ hself : C ≤ zmodDual (2 ^ r) hm C,
      (constructionA (2 ^ r) hm C hself).IsEven ∧
        (constructionA (2 ^ r) hm C hself).IsUnimodular := sorry

/-- The integral base has carrier `mℤ^ι`; its dual is `ℤ^ι`; it is even for even `m`. -/
noncomputable def constructionABase (m : ℕ) (hm₂ : 2 ≤ m) :
    IntegralLattice (ι → ℚ) := sorry

instance (m : ℕ) (hm₂ : 2 ≤ m) : (constructionABase (ι := ι) m hm₂).IsNondegenerate := sorry

theorem constructionABase_isEven (m : ℕ) (hm₂ : 2 ≤ m) (hmeven : Even m) :
    (constructionABase (ι := ι) m hm₂).IsEven := sorry

/-- The coordinate discriminant pairing at every nonzero modulus. -/
noncomputable def coordinateBilinearModule (ι : Type v) [Fintype ι]
    (m : ℕ) (hm₂ : 2 ≤ m) : FiniteBilinearModule := by
  letI : NeZero m := ⟨by omega⟩
  letI : DecidableEq ι := Classical.decEq ι
  letI : Fintype (ZMod m) := ZMod.fintype m
  letI : Fintype (ι → ZMod m) := Pi.instFintype
  exact
    { A := ι → ZMod m
      addCommGroup := inferInstance
      finite := Finite.of_fintype (ι → ZMod m)
      pairing := sorry
      symmetric := sorry }

/-- The coordinate quadratic module with values `Σ lift(cᵢ)²/(2m) mod ℤ`. -/
noncomputable def coordinateQuadraticModule (ι : Type v) [Fintype ι]
    (m : ℕ) (hm₂ : 2 ≤ m) (_hmeven : Even m) : FiniteQuadraticModule where
      toFiniteBilinearModule := coordinateBilinearModule ι m hm₂
      quadratic := sorry
      polar := sorry

/-- An integer vector is canonically in the dual of the base `mℤ^ι`. -/
noncomputable def constructionABaseDualOfInt (m : ℕ) (hm₂ : 2 ≤ m) (z : ι → ℤ) :
    (constructionABase (ι := ι) m hm₂).dual := sorry

/-- The discriminant quotient of `mℤ^ι` is coordinatewise reduction modulo `m`. -/
noncomputable def constructionABaseDiscriminantEquiv (m : ℕ) (hm₂ : 2 ≤ m) :
    (constructionABase (ι := ι) m hm₂).DiscriminantGroup ≃+ (ι → ZMod m) := sorry

theorem constructionABaseDiscriminantEquiv_integerClass
    (m : ℕ) (hm₂ : 2 ≤ m) (z : ι → ℤ) :
    constructionABaseDiscriminantEquiv m hm₂
        ((constructionABase (ι := ι) m hm₂).carrierInDual.mkQ
          (constructionABaseDualOfInt m hm₂ z)) =
      fun i ↦ (z i : ZMod m) := sorry

/-- The additive equivalence also preserves the residue/discriminant bilinear pairings. -/
theorem constructionABaseDiscriminantEquiv_pairing
    (m : ℕ) (hm₂ : 2 ≤ m)
    (x y : (constructionABase (ι := ι) m hm₂).DiscriminantGroup) :
    (coordinateBilinearModule ι m hm₂).pairing
        (constructionABaseDiscriminantEquiv m hm₂ x)
        (constructionABaseDiscriminantEquiv m hm₂ y) =
      (constructionABase (ι := ι) m hm₂).discriminantPairing x y := sorry

/-- The key normalization check between residues and the actual discriminant quotient. -/
noncomputable def constructionABaseDiscriminantIsometry
    (m : ℕ) (hm₂ : 2 ≤ m) (hmeven : Even m) :
    FiniteQuadraticModule.Isometry
      ((constructionABase (ι := ι) m hm₂).discriminantQuadraticModule
        (constructionABase_isEven (ι := ι) m hm₂ hmeven))
      (coordinateQuadraticModule ι m hm₂ hmeven) where
  toAddEquiv := constructionABaseDiscriminantEquiv m hm₂
  map_quadratic := sorry

/-- The actual inverse image of `C` under the pinned discriminant-coordinate equivalence. -/
noncomputable def codeInBaseDiscriminant
    (m : ℕ) (hm₂ : 2 ≤ m)
    (C : AdditiveCode (ZMod m) ι) :
    AddSubgroup (constructionABase (ι := ι) m hm₂).DiscriminantGroup :=
  C.comap (constructionABaseDiscriminantEquiv m hm₂).toAddMonoidHom

/-- Orthogonal complement commutes with the coordinate/discriminant equivalence. -/
theorem orthogonalComplement_codeInBaseDiscriminant
    (m : ℕ) (hm₂ : 2 ≤ m) (C : AdditiveCode (ZMod m) ι) :
    (constructionABase (ι := ι) m hm₂).discriminantBilinearModule.orthogonalComplement
        (codeInBaseDiscriminant m hm₂ C) =
      codeInBaseDiscriminant m hm₂ (zmodDual m hm₂ C) := sorry

theorem codeInBaseDiscriminant_isIsotropic
    (m : ℕ) (hm₂ : 2 ≤ m) (hmeven : Even m)
    (C : AdditiveCode (ZMod m) ι)
    (hC : ∀ c ∈ C, constructionAQuadraticValue m hm₂ hmeven c = 0) :
    ((constructionABase (ι := ι) m hm₂).discriminantQuadraticModule
      (constructionABase_isEven (ι := ι) m hm₂ hmeven)).IsIsotropic
        (codeInBaseDiscriminant m hm₂ C) := sorry

/-- Construction A is the existing preimage/gluing construction, not a parallel notion. -/
noncomputable def constructionAAsGluing
    (m : ℕ) (hm₂ : 2 ≤ m) (hmeven : Even m)
    (C : AdditiveCode (ZMod m) ι) (hself : C ≤ zmodDual m hm₂ C)
    (hq : ∀ c ∈ C, constructionAQuadraticValue m hm₂ hmeven c = 0) :
    IntegralLattice.Isometry
      (constructionA m hm₂ C hself)
      ((constructionABase (ι := ι) m hm₂).ofIsotropicSubgroup
        (constructionABase_isEven (ι := ι) m hm₂ hmeven)
        (codeInBaseDiscriminant m hm₂ C)
        (codeInBaseDiscriminant_isIsotropic m hm₂ hmeven C hq)) := sorry

/-- The literal copy of `C` inside `C^⊥`, used to form the quotient `C^⊥/C`. -/
noncomputable def codeInZModDual (m : ℕ) (hm₂ : 2 ≤ m) (C : AdditiveCode (ZMod m) ι)
    (_hself : C ≤ zmodDual m hm₂ C) : Submodule ℤ (zmodDual m hm₂ C) :=
  (C.comap (zmodDual m hm₂ C).subtype).toIntSubmodule

/-- The quotient `C^⊥/C`, not merely a group of the same cardinality. -/
abbrev CodeOrthogonalQuotient (m : ℕ) (hm₂ : 2 ≤ m)
    (C : AdditiveCode (ZMod m) ι) (hself : C ≤ zmodDual m hm₂ C) :=
  zmodDual m hm₂ C ⧸ codeInZModDual m hm₂ C hself

/-- The bilinear form induced on the literal quotient `C^⊥/C`. -/
noncomputable def codeOrthogonalQuotientBilinearModule
    (m : ℕ) (hm₂ : 2 ≤ m) (C : AdditiveCode (ZMod m) ι)
    (hself : C ≤ zmodDual m hm₂ C) : FiniteBilinearModule where
  A := CodeOrthogonalQuotient m hm₂ C hself
  addCommGroup := inferInstance
  finite := sorry
  pairing := sorry
  symmetric := sorry

/-- The quadratic refinement on `C^⊥/C` when `C` is quadratically isotropic. -/
noncomputable def codeOrthogonalQuotientQuadraticModule
    (m : ℕ) (hm₂ : 2 ≤ m) (hmeven : Even m)
    (C : AdditiveCode (ZMod m) ι) (hself : C ≤ zmodDual m hm₂ C)
    (_hq : ∀ c ∈ C, constructionAQuadraticValue m hm₂ hmeven c = 0) :
    FiniteQuadraticModule where
  toFiniteBilinearModule := codeOrthogonalQuotientBilinearModule m hm₂ C hself
  quadratic := sorry
  polar := sorry

theorem constructionA_isEven
    (m : ℕ) (hm₂ : 2 ≤ m) (hmeven : Even m)
    (C : AdditiveCode (ZMod m) ι) (hself : C ≤ zmodDual m hm₂ C)
    (hq : ∀ c ∈ C, constructionAQuadraticValue m hm₂ hmeven c = 0) :
    (constructionA m hm₂ C hself).IsEven :=
  (constructionA_even_iff m hm₂ hmeven C hself).2 hq

/-- The promised bilinear isometry `A_{P_m(C)} ≅ C^⊥/C`, packaged as an additive
equivalence together with its form-preservation equation until PR 1's general bilinear-isometry
structure is available. -/
noncomputable def constructionADiscriminantBilinearIsometry
    (m : ℕ) (hm₂ : 2 ≤ m) (C : AdditiveCode (ZMod m) ι)
    (hself : C ≤ zmodDual m hm₂ C) :
    { e : (constructionA m hm₂ C hself).DiscriminantGroup ≃+
          CodeOrthogonalQuotient m hm₂ C hself //
      ∀ x y, (codeOrthogonalQuotientBilinearModule m hm₂ C hself).pairing (e x) (e y) =
        (constructionA m hm₂ C hself).discriminantPairing x y } := sorry

/-- The quadratic strengthening of `A_{P_m(C)} ≅ C^⊥/C`. -/
noncomputable def constructionADiscriminantQuadraticIsometry
    (m : ℕ) (hm₂ : 2 ≤ m) (hmeven : Even m)
    (C : AdditiveCode (ZMod m) ι) (hself : C ≤ zmodDual m hm₂ C)
    (hq : ∀ c ∈ C, constructionAQuadraticValue m hm₂ hmeven c = 0) :
    FiniteQuadraticModule.Isometry
      ((constructionA m hm₂ C hself).discriminantQuadraticModule
        (constructionA_isEven m hm₂ hmeven C hself hq))
      (codeOrthogonalQuotientQuadraticModule m hm₂ hmeven C hself hq) := sorry

end ConstructionA

/-! ## `A₂` and `D₄` discriminant-coordinate normalizations -/

/-- The `A₂` discriminant alphabet, with `q(a)=a²/3` and polar form `2ab/3`. -/
noncomputable def a2DiscriminantAlphabet : FiniteQuadraticModule where
  A := ZMod 3
  addCommGroup := inferInstance
  finite := inferInstance
  pairing := sorry
  symmetric := sorry
  quadratic := sorry
  polar := sorry

theorem a2DiscriminantAlphabet_quadratic (a : ZMod 3) :
    a2DiscriminantAlphabet.quadratic a =
      ((↑((((a.val : ℚ) ^ 2) / (3 : ℚ) : ℚ)) : AddCircle (1 : ℚ))) := sorry

theorem a2DiscriminantAlphabet_pairing (a b : ZMod 3) :
    a2DiscriminantAlphabet.pairing a b =
      ((↑(((2 * (a.val : ℚ) * (b.val : ℚ)) / (3 : ℚ) : ℚ)) : AddCircle (1 : ℚ))) :=
  sorry

/-- The trace `F₄ → F₂` used in the `D₄` polar form. -/
noncomputable def traceF4F2 : F4 →+ F2 := sorry

theorem traceF4F2_apply (x : F4) :
    algebraMap F2 F4 (traceF4F2 x) = x + x ^ 2 := sorry

/-- The `D₄` discriminant alphabet under `1↦vector`, `ω↦spinor`, `ω²↦conjugate spinor`. -/
noncomputable def d4DiscriminantAlphabet : FiniteQuadraticModule where
  A := F4
  addCommGroup := inferInstance
  finite := inferInstance
  pairing := sorry
  symmetric := sorry
  quadratic := sorry
  polar := sorry

noncomputable def d4VectorClass : F4 := 1

noncomputable def d4SpinorClass : F4 := omega

noncomputable def d4ConjugateSpinorClass : F4 := omega ^ 2

theorem d4DiscriminantAlphabet_quadratic (x : F4) :
    d4DiscriminantAlphabet.quadratic x =
      ((↑((if x = 0 then 0 else (1 : ℚ) / 2) : ℚ) : AddCircle (1 : ℚ))) := sorry

theorem d4DiscriminantAlphabet_pairing (x y : F4) :
    d4DiscriminantAlphabet.pairing x y =
      ((↑((((traceF4F2 (x * y ^ 2)).val : ℚ) / (2 : ℚ) : ℚ)) : AddCircle (1 : ℚ))) :=
  sorry

/-- Orthogonal coordinate powers of the `A₂` discriminant alphabet. -/
noncomputable def a2CoordinateQuadraticModule (ι : Type*) [Fintype ι] :
    FiniteQuadraticModule where
  A := ι → ZMod 3
  addCommGroup := inferInstance
  finite := inferInstance
  pairing := sorry
  symmetric := sorry
  quadratic := sorry
  polar := sorry

theorem a2CoordinateQuadraticModule_quadratic { ι : Type*} [Fintype ι]
    (x : ι → ZMod 3) :
    (a2CoordinateQuadraticModule ι).quadratic x =
      ∑ i, ((↑(((((x i).val : ℚ) ^ 2) / (3 : ℚ) : ℚ)) : AddCircle (1 : ℚ))) := sorry

/-- Orthogonal coordinate powers of the `D₄` alphabet. -/
noncomputable def d4CoordinateQuadraticModule (ι : Type*) [Fintype ι] :
    FiniteQuadraticModule where
  A := ι → F4
  addCommGroup := inferInstance
  finite := inferInstance
  pairing := sorry
  symmetric := sorry
  quadratic := sorry
  polar := sorry

theorem d4CoordinateQuadraticModule_quadratic { ι : Type*} [Fintype ι]
    (x : ι → F4) :
    (d4CoordinateQuadraticModule ι).quadratic x =
      ((↑(((hammingNorm x : ℚ) / (2 : ℚ) : ℚ)) : AddCircle (1 : ℚ))) := sorry

theorem d4CoordinateQuadraticModule_pairing { ι : Type*} [Fintype ι]
    (x y : ι → F4) :
    (d4CoordinateQuadraticModule ι).pairing x y =
      ((↑((((traceF4F2 (∑ i, x i * y i ^ 2)).val : ℚ) / (2 : ℚ) : ℚ)) :
        AddCircle (1 : ℚ))) := sorry

/-- The named ternary codes are Lagrangians for the pinned `A₂` coordinate form. -/
theorem tetracode_a2_isLagrangian :
    (a2CoordinateQuadraticModule (Fin 4)).IsIsotropic tetracode.toAddSubgroup ∧
      tetracode.toAddSubgroup =
        (a2CoordinateQuadraticModule (Fin 4)).toFiniteBilinearModule.orthogonalComplement
          tetracode.toAddSubgroup := sorry

theorem ternaryGolay_a2_isLagrangian :
    (a2CoordinateQuadraticModule (Fin 6 ⊕ Fin 6)).IsIsotropic
        extendedTernaryGolay.toAddSubgroup ∧
      extendedTernaryGolay.toAddSubgroup =
        (a2CoordinateQuadraticModule (Fin 6 ⊕ Fin 6)).toFiniteBilinearModule.orthogonalComplement
          extendedTernaryGolay.toAddSubgroup := sorry

/-- The Hermitian hexacode is a Lagrangian for the pinned traced `D₄` coordinate form. -/
theorem hexacode_d4_isLagrangian :
    (d4CoordinateQuadraticModule (Fin 6)).IsIsotropic hexacode.toAddSubgroup ∧
      hexacode.toAddSubgroup =
        (d4CoordinateQuadraticModule (Fin 6)).toFiniteBilinearModule.orthogonalComplement
          hexacode.toAddSubgroup := sorry

/-! ## End-to-end named-code acceptance path -/

noncomputable def golayConstructionA : IntegralLattice ((Fin 12 ⊕ Fin 12) → ℚ) :=
  constructionA 2 (by decide) extendedBinaryGolay.toAddSubgroup
    (by
      rw [zmodDual_two_toAddSubgroup, extendedBinaryGolay_typeII.2])

theorem golayConstructionA_isEven : golayConstructionA.IsEven := sorry

theorem golayConstructionA_isUnimodular : golayConstructionA.IsUnimodular := sorry

theorem golayConstructionA_isPositiveDefinite : golayConstructionA.IsPositiveDefinite := sorry

end TauCetiRoadmap.AlgebraicCodingTheory
