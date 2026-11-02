module

public import Mathlib
public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Symplectic.Basic
public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Symplectic.Levi
public import TauCeti.LinearAlgebra.Matrix.SymplecticMultiplier
public import TauCeti.LinearAlgebra.SymplecticGroup
public import TauCeti.NumberTheory.ModularForms.Newforms.Satake

/-!
# Siegel modular forms: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need (the Siegel upper half-space and its action, holomorphic weights
and slash operators, the bundled forms, half-integral matrices and Fourier coefficients, the
`Φ`-operator and cusp forms, the Siegel Eisenstein series, theta series and theta constants,
Igusa's generators, the Hecke operators and eigenforms, the Euler factors, the Maass lift and the
Maass space, the paramodular group and its Fricke element). Every definition has a real body; a
proof obligation inside a bundled definition (that a function lands in `ℍ_g`, that a sum of
slashes is again a modular form) is a named theorem proved by `sorry`.

Headline theorems not statable at the pins, and what each lacks:

* the Petersson inner product and the orthogonal decompositions built on it (3.4, 7.2, 9.4,
  10.3): a fundamental domain for `Γ_g` with its invariant measure (3.3);
* the Maass–Cohen coefficient formula (4.2) and the Jacobi Eisenstein series (9.2): Cohen's
  function `H(r, N)`, whose definition needs the decomposition `N = |D| f²` into a fundamental
  discriminant and a conductor;
* the Klingen Eisenstein series and Arakawa's decomposition (4.3): the Klingen parabolic and the
  pullback to the upper-left block;
* the theta transformation law for lattices of odd rank (5.2): the holomorphic square root of
  `det(τ/i)` on `ℍ_g`, which for `g ≥ 3` is not the principal branch;
* Satoh's theorem, Tsushima's formula, Igusa's `Γ₂(2)` ring and the `Γ₀(2)`, `Γ₀(3)`, `Γ₀(4)`
  rings, and the degree-three and degree-four classifications (6.4–6.9): forms with a character
  and the structure of modules over a polynomial ring in theta constants;
* the Satake isomorphism and the Satake parameters (7.4): the Hecke algebra as a ring with its
  characters;
* the spinor and standard `L`-functions as Euler products, their functional equations and the
  data-model export (8.2–8.5): the Satake parameters;
* the Fourier–Jacobi expansion and the Jacobi-side statements of 9.1–9.2, 9.5–9.6: the Jacobi
  carrier of `MetaplecticAutomorphicForms` 6.18 and the sibling `HalfIntegralWeightModularForms`
  6.1–6.4, which are pull requests;
* the Ikeda and Miyawaki lifts (9.7–9.8): the standard `L`-function;
* the paramodular Hecke operators, oldforms, newforms, the local newform theory and the
  paramodular conjecture (7.3, 10.2–10.6, including `IsParamodularPartner`): the Satake
  parameters at `p ∤ N` and the Petersson complement.

The carrier is `SiegelHalfSpace g` (`ℍ[g]`), the subtype of the complex vector space `Sym g` of
symmetric `g × g` matrices cut out by `Matrix.PosDef` of the imaginary part, with the charted-space
structure of an open subset, exactly as Mathlib's `UpperHalfPlane`. All `2g × 2g` matrices are
indexed by `Fin g ⊕ Fin g`, so that the symplectic group is Tau Ceti's `GLSymplectic (Fin g) R`
(a subgroup of `GL (Fin g ⊕ Fin g) R` whose matrices lie in Mathlib's `Matrix.symplecticGroup`,
`M J Mᵀ = J` for Mathlib's `J`), and the blocks are `toBlocks₁₁ … toBlocks₂₂`.

Conventions visible in the signatures (`README.md`, *Conventions*): the positive similitude group
`GSpPos` is cut out by `M J Mᵀ = μ • J` with `0 < μ`; the similitude group and its multiplier `ν`
are `ClassicalGroupsPartII` CG.0.1's, which this file cannot import, so no multiplier is declared
here and `slashE` reads the scalar `μ(γ) = ν(γ)` off the membership witness; the action is
`τ ↦ (Aτ + B)(Cτ + D)⁻¹`; a weight is a holomorphic representation of `GL (Fin g) ℂ` on a
finite-dimensional normed space, `detWeight g k` is `det ^ k`, and `rho k j` is `Sym^j ⊗ det^k` on
coefficient vectors `Fin (j + 1) → ℂ` (highest weight `(k + j, k)`; `(k, j)` is the LMFDB weight);
the slash operator is `ρ(Cτ + D)⁻¹ f(γ • τ)` with the extra factor `μ(γ) ^ e` on similitudes, and
the Hecke operators take the exponent `e` explicitly (`scalarExponent g k = g k − g(g+1)/2`,
`vectorExponent k j = 2k + j − 3`); a modular form is a structure with a boundedness field that
Koecher's principle discharges for `g ≥ 2` (`SiegelModularForm.ofInvariant`); Fourier coefficients
are indexed by `HalfIntegral g`, with the degree-two coordinates `ofTriple n r m` for
`[[n, r/2], [r/2, m]]`; `chi10` and `chi12` are normalized by `a((1,1,1)) = 1` (Igusa's are `−¼`
and `1/12` of these) and `chi35` by `a((2,1,3)) = 1`; a tuple `(α₀, …, α_g)` of Satake parameters
in the arithmetic normalization has `spinorEulerFactor = ∏_{I ⊆ {1..g}} (1 − α₀ α_I X)`; the
paramodular group `paramodular N` is the stabilizer of `ℤ ⊕ ℤ ⊕ ℤ ⊕ Nℤ` and `fricke N` is
`diag(A_N, A_Nᵀ)` with `A_N = [[0, √N], [1/√N, 0]]`.
-/

@[expose] public section

open Matrix Complex Real Filter Topology Polynomial
open UpperHalfPlane hiding I
open scoped Manifold ContDiff RealInnerProductSpace MatrixGroups

noncomputable section

namespace TauCetiRoadmap.SiegelModularForms

attribute [local instance] Matrix.normedAddCommGroup Matrix.normedSpace

/-! ## Layer 0: symplectic groups and the Siegel upper half-space -/

/-- `Sp_{2g}(R)`, Tau Ceti's symplectic subgroup of `GL (Fin g ⊕ Fin g) R` (`README.md`, Layer 0,
0.1). -/
abbrev Sp (g : ℕ) (R : Type*) [CommRing R] : Subgroup (GL (Fin g ⊕ Fin g) R) :=
  TauCeti.GLSymplectic (Fin g) R

/-- The underlying matrix of an element of `Sp_{2g}(R)`. -/
def Sp.mat {g : ℕ} {R : Type*} [CommRing R] (γ : Sp g R) :
    Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) R :=
  ((γ : GL (Fin g ⊕ Fin g) R) : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) R)

/-- The inverse of a symplectic matrix is `−J Mᵀ J` (0.1); used by the membership proofs of the
Siegel parabolic below. -/
theorem Sp.mat_inv {K : Type*} [CommRing K] {g : ℕ} (γ : Sp g K) :
    Sp.mat γ⁻¹ = -Matrix.J (Fin g) K * (Sp.mat γ)ᵀ * Matrix.J (Fin g) K := by
  rw [← SymplecticGroup.inv_eq_symplectic_inv (Sp.mat γ)
    (TauCeti.GLSymplectic.mem_iff_mem_symplecticGroup.mp γ.2)]
  exact Matrix.coe_units_inv _

/-- The transpose of an invertible matrix, as a unit; `Aᵀ` has inverse `(A⁻¹)ᵀ`. -/
def transposeGL {n : Type*} [Fintype n] [DecidableEq n] {K : Type*} [CommRing K] (A : GL n K) :
    GL n K where
  val := (A : Matrix n n K)ᵀ
  inv := ((A⁻¹ : GL n K) : Matrix n n K)ᵀ
  val_inv := by rw [← Matrix.transpose_mul, Units.inv_mul, Matrix.transpose_one]
  inv_val := by rw [← Matrix.transpose_mul, Units.mul_inv, Matrix.transpose_one]

variable {R : Type*} [Field R] [LinearOrder R] [IsStrictOrderedRing R]

/-- The group of **positive symplectic similitudes** `GSp⁺_{2g}(R)` (0.2): the `R`-points of
`ClassicalGroupsPartII` CG.0.1's similitude group with positive multiplier, that is,
`M J Mᵀ = μ • J` for some `0 < μ`. -/
def GSpPos (g : ℕ) (R : Type*) [Field R] [LinearOrder R] [IsStrictOrderedRing R] :
    Subgroup (GL (Fin g ⊕ Fin g) R) where
  carrier := {M | ∃ μ : R, 0 < μ ∧
    (M : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) R) * Matrix.J (Fin g) R *
      (M : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) R)ᵀ = μ • Matrix.J (Fin g) R}
  mul_mem' := by
    rintro M N ⟨μ, hμ, hM⟩ ⟨ν, hν, hN⟩
    refine ⟨μ * ν, mul_pos hμ hν, ?_⟩
    simp only [Units.val_mul, Matrix.transpose_mul]
    set A : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) R := ↑M
    set B : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) R := ↑N
    have h : A * B * Matrix.J (Fin g) R * (Bᵀ * Aᵀ) = A * (B * Matrix.J (Fin g) R * Bᵀ) * Aᵀ := by
      simp only [Matrix.mul_assoc]
    rw [h, hN, Matrix.mul_smul, Matrix.smul_mul, hM, smul_smul, mul_comm]
  one_mem' := ⟨1, one_pos, by simp⟩
  inv_mem' := by
    rintro M ⟨μ, hμ, hM⟩
    refine ⟨μ⁻¹, inv_pos.mpr hμ, ?_⟩
    set A : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) R := ↑M
    set A' : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) R := ↑M⁻¹
    have h1 : A' * A = 1 := Units.inv_mul M
    have h2 : Aᵀ * A'ᵀ = 1 := by rw [← Matrix.transpose_mul, h1, Matrix.transpose_one]
    have h3 : A' * Matrix.J (Fin g) R * A'ᵀ =
        μ⁻¹ • (A' * (μ • Matrix.J (Fin g) R) * A'ᵀ) := by
      rw [Matrix.mul_smul, Matrix.smul_mul, smul_smul, inv_mul_cancel₀ hμ.ne', one_smul]
    rw [h3, ← hM, show A' * (A * Matrix.J (Fin g) R * Aᵀ) * A'ᵀ =
      (A' * A) * Matrix.J (Fin g) R * (Aᵀ * A'ᵀ) by simp only [Matrix.mul_assoc], h1, h2,
      Matrix.one_mul, Matrix.mul_one]

variable {g : ℕ}

/-- The underlying matrix of a similitude. -/
def GSpPos.mat (M : GSpPos g R) : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) R :=
  ((M : GL (Fin g ⊕ Fin g) R) : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) R)

/-- `Sp_{2g}(R) → GSp⁺_{2g}(R)`, the kernel of the multiplier (0.2). -/
def Sp.toGSpPos : Sp g R →* GSpPos g R where
  toFun γ := ⟨γ, 1, one_pos, by simpa using TauCeti.GLSymplectic.mem_iff.mp γ.2⟩
  map_one' := rfl
  map_mul' _ _ := rfl

/-- `GSp⁺_{2g}(ℚ) → GSp⁺_{2g}(ℝ)` (0.2). -/
def GSpPos.ratToReal : GSpPos g ℚ →* GSpPos g ℝ where
  toFun M := ⟨Matrix.GeneralLinearGroup.map (algebraMap ℚ ℝ) M, by
    obtain ⟨μ, hμ, h⟩ := M.2
    have h' : GSpPos.mat M * Matrix.J (Fin g) ℚ * (GSpPos.mat M)ᵀ = μ • Matrix.J (Fin g) ℚ := h
    refine ⟨algebraMap ℚ ℝ μ, by simpa using hμ, ?_⟩
    change ((GSpPos.mat M).map (algebraMap ℚ ℝ)) * Matrix.J (Fin g) ℝ *
        ((GSpPos.mat M).map (algebraMap ℚ ℝ))ᵀ = _
    rw [← Matrix.transpose_map, ← Matrix.map_J (Fin g) (algebraMap ℚ ℝ),
      ← Matrix.map_mul, ← Matrix.map_mul, h']
    ext i j
    simp only [Matrix.map_apply, Matrix.smul_apply, smul_eq_mul, map_mul]⟩
  map_one' := Subtype.ext (map_one (Matrix.GeneralLinearGroup.map (algebraMap ℚ ℝ)))
  map_mul' M N := Subtype.ext (map_mul (Matrix.GeneralLinearGroup.map (algebraMap ℚ ℝ)) M.1 N.1)

/-- `Sp_{2g}(ℚ) → Sp_{2g}(ℝ)`, Tau Ceti's `GLSymplectic.map` (0.2). -/
def Sp.ratToReal : Sp g ℚ →* Sp g ℝ := TauCeti.GLSymplectic.map (Fin g) (algebraMap ℚ ℝ)

/-- `Sp_{2g}(ℤ) → Sp_{2g}(ℚ)` (0.2). -/
def Sp.intToRat : Sp g ℤ →* Sp g ℚ := TauCeti.GLSymplectic.map (Fin g) (Int.castRingHom ℚ)

/-- The symmetric complex `g × g` matrices as a `ℂ`-submodule of the matrix space (0.3). -/
def symSubmodule (g : ℕ) : Submodule ℂ (Matrix (Fin g) (Fin g) ℂ) where
  carrier := {τ | τ.IsSymm}
  add_mem' hA hB := hA.add hB
  zero_mem' := Matrix.isSymm_zero
  smul_mem' c _ hA := hA.smul c

/-- `Sym g`, the complex vector space of symmetric `g × g` matrices, with the sup norm inherited
from `Matrix.normedAddCommGroup` (0.3). -/
abbrev Sym (g : ℕ) : Type := ↥(symSubmodule g)

/-- The **Siegel upper half-space** `ℍ_g`: symmetric complex matrices with positive definite
imaginary part (0.3). Positivity is strict. -/
def SiegelHalfSpace (g : ℕ) : Type :=
  {τ : Sym g // ((τ : Matrix (Fin g) (Fin g) ℂ).map Complex.im).PosDef}

@[inherit_doc] scoped notation "ℍ[" g "]" => SiegelHalfSpace g

namespace SiegelHalfSpace

/-- The underlying matrix of a point of `ℍ_g`. -/
def toMatrix (τ : ℍ[g]) : Matrix (Fin g) (Fin g) ℂ := (τ.1 : Matrix (Fin g) (Fin g) ℂ)

/-- `Y = Im τ`, a real symmetric positive definite matrix (0.3). -/
def im (τ : ℍ[g]) : Matrix (Fin g) (Fin g) ℝ := τ.toMatrix.map Complex.im

theorem toMatrix_isSymm (τ : ℍ[g]) : τ.toMatrix.IsSymm := τ.1.2

theorem isSymm_I_smul_one : (Complex.I • (1 : Matrix (Fin g) (Fin g) ℂ)).IsSymm :=
  Matrix.isSymm_one.smul Complex.I

theorem map_im_I_smul_one :
    (Complex.I • (1 : Matrix (Fin g) (Fin g) ℂ)).map Complex.im = 1 := by
  ext i j
  by_cases h : i = j <;> simp [Matrix.one_apply, h]

/-- The base point `i · 1_g ∈ ℍ_g` (0.3), with Mathlib's `PosDef.one`; it makes `ℍ_g` nonempty,
which the charted-space structure below needs. -/
def basePoint (g : ℕ) : ℍ[g] :=
  ⟨⟨Complex.I • (1 : Matrix (Fin g) (Fin g) ℂ), isSymm_I_smul_one⟩,
    by rw [map_im_I_smul_one]; exact Matrix.PosDef.one⟩

instance : Nonempty ℍ[g] := ⟨basePoint g⟩

instance : TopologicalSpace ℍ[g] := instTopologicalSpaceSubtype

/-- `ℍ_g` is open in `Sym g` (0.3): positive definiteness is an open condition. The model space
`Sym g` carries the topology of its norm here, the one `𝓘(ℂ, Sym g)` uses, so that the charted
space built from this embedding is the one of an open subset of `Sym g`. -/
theorem isOpenEmbedding_coe :
    @IsOpenEmbedding ℍ[g] (Sym g) _ UniformSpace.toTopologicalSpace
      (fun τ : ℍ[g] => (τ.1 : Sym g)) := sorry

/-- The charted-space structure of `ℍ_g` as an open subset of `Sym g` (0.3). -/
instance : @ChartedSpace (Sym g) UniformSpace.toTopologicalSpace ℍ[g] _ :=
  isOpenEmbedding_coe.singletonChartedSpace

/-- The `g = 1` comparison (0.3) as a bijection: `ℍ_1 ≃ ℍ`, `τ ↦ τ 0 0`. -/
def equivUpperHalfPlane : ℍ[1] ≃ UpperHalfPlane where
  toFun τ := UpperHalfPlane.mk (τ.toMatrix 0 0) (by
    have h := τ.2.diag_pos (i := 0)
    simp only [Matrix.map_apply] at h
    exact h)
  invFun z := ⟨⟨Matrix.of fun _ _ => (z : ℂ), Matrix.IsSymm.ext fun _ _ => rfl⟩, by
    have : (Matrix.of fun _ _ => (z : ℂ) : Matrix (Fin 1) (Fin 1) ℂ).map Complex.im =
        Matrix.diagonal fun _ => z.im := by
      ext i j
      simp [Subsingleton.elim i j]
    rw [this]
    exact Matrix.posDef_diagonal_iff.mpr fun _ => z.im_pos⟩
  left_inv τ := Subtype.ext <| Subtype.ext <| Matrix.ext fun i j => by
    simp [SiegelHalfSpace.toMatrix, Subsingleton.elim i 0, Subsingleton.elim j 0]
  right_inv z := rfl

/-- The block-diagonal matrix `diag(τ, τ')`, indexed through `finSumFinEquiv` (0.3). -/
def diagMatrix (τ : ℍ[g]) {g' : ℕ} (τ' : ℍ[g']) : Matrix (Fin (g + g')) (Fin (g + g')) ℂ :=
  Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks τ.toMatrix 0 0 τ'.toMatrix)

theorem diagMatrix_isSymm (τ : ℍ[g]) {g' : ℕ} (τ' : ℍ[g']) : (diagMatrix τ τ').IsSymm := by
  rw [diagMatrix, Matrix.reindex_apply]
  exact (Matrix.IsSymm.fromBlocks τ.toMatrix_isSymm (by simp) τ'.toMatrix_isSymm).submatrix _

/-- `diag(τ, τ')` has positive definite imaginary part (0.3). -/
theorem diagMatrix_im_posDef (τ : ℍ[g]) {g' : ℕ} (τ' : ℍ[g']) :
    ((diagMatrix τ τ').map Complex.im).PosDef := sorry

/-- The block-diagonal embedding `ℍ_g × ℍ_g' → ℍ_{g + g'}` (0.3). -/
def diagEmbed (τ : ℍ[g]) {g' : ℕ} (τ' : ℍ[g']) : ℍ[g + g'] :=
  ⟨⟨diagMatrix τ τ', diagMatrix_isSymm τ τ'⟩, diagMatrix_im_posDef τ τ'⟩

end SiegelHalfSpace

open SiegelHalfSpace

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V]

open scoped Classical in
/-- The extension of `f : ℍ_g → V` by `0` to the model space `Sym g`. -/
def extendZero (f : ℍ[g] → V) (σ : Sym g) : V :=
  if h : ((σ : Matrix (Fin g) (Fin g) ℂ).map Complex.im).PosDef then f ⟨σ, h⟩ else 0

/-- **Holomorphy** on `ℍ_g` (0.3): `DifferentiableOn ℂ` of the zero extension on the open subset
`ℍ_g ⊆ Sym g`. Since `ℍ_g` is open this is the holomorphy of `f` itself, and for `g = 1` it is
Mathlib's `MDifferentiable 𝓘(ℂ) 𝓘(ℂ)` under `equivUpperHalfPlane`. -/
def Holomorphic (f : ℍ[g] → V) : Prop :=
  DifferentiableOn ℂ (extendZero f) {σ : Sym g | ((σ : Matrix (Fin g) (Fin g) ℂ).map Complex.im).PosDef}

/-- Constants are holomorphic; a proof obligation of `siegelSubmodule`. -/
theorem holomorphic_const (v : V) : Holomorphic (fun _ : ℍ[g] => v) := sorry

/-- Sums of holomorphic functions are holomorphic; a proof obligation of `siegelSubmodule`. -/
theorem Holomorphic.add {f h : ℍ[g] → V} (hf : Holomorphic f) (hh : Holomorphic h) :
    Holomorphic (f + h) := sorry

/-- Scalar multiples of holomorphic functions are holomorphic; a proof obligation of
`siegelSubmodule`. -/
theorem Holomorphic.smul {f : ℍ[g] → V} (c : ℂ) (hf : Holomorphic f) : Holomorphic (c • f) := sorry

/-- Products of scalar holomorphic functions are holomorphic; a proof obligation of
`SiegelModularForm.mul`. -/
theorem Holomorphic.mul {f h : ℍ[g] → ℂ} (hf : Holomorphic f) (hh : Holomorphic h) :
    Holomorphic (f * h) := sorry

/-- The complex `A`-block of a real similitude. -/
def blockA (γ : GSpPos g ℝ) : Matrix (Fin g) (Fin g) ℂ :=
  ((GSpPos.mat γ).toBlocks₁₁).map Complex.ofReal

/-- The complex `B`-block of a real similitude. -/
def blockB (γ : GSpPos g ℝ) : Matrix (Fin g) (Fin g) ℂ :=
  ((GSpPos.mat γ).toBlocks₁₂).map Complex.ofReal

/-- The complex `C`-block of a real similitude. -/
def blockC (γ : GSpPos g ℝ) : Matrix (Fin g) (Fin g) ℂ :=
  ((GSpPos.mat γ).toBlocks₂₁).map Complex.ofReal

/-- The complex `D`-block of a real similitude. -/
def blockD (γ : GSpPos g ℝ) : Matrix (Fin g) (Fin g) ℂ :=
  ((GSpPos.mat γ).toBlocks₂₂).map Complex.ofReal

/-- `det (Cτ + D) ≠ 0` for `γ ∈ GSp⁺_{2g}(ℝ)` and `τ ∈ ℍ_g` (0.4). -/
theorem det_blockC_mul_add_blockD_ne_zero (γ : GSpPos g ℝ) (τ : ℍ[g]) :
    (blockC γ * τ.toMatrix + blockD γ).det ≠ 0 := sorry

/-- `(Aτ + B)(Cτ + D)⁻¹` is symmetric (0.4). -/
theorem act_isSymm (γ : GSpPos g ℝ) (τ : ℍ[g]) :
    ((blockA γ * τ.toMatrix + blockB γ) * (blockC γ * τ.toMatrix + blockD γ)⁻¹).IsSymm := sorry

/-- `(Aτ + B)(Cτ + D)⁻¹` has positive definite imaginary part (0.4). -/
theorem act_im_posDef (γ : GSpPos g ℝ) (τ : ℍ[g]) :
    (((blockA γ * τ.toMatrix + blockB γ) * (blockC γ * τ.toMatrix + blockD γ)⁻¹).map
      Complex.im).PosDef := sorry

/-- The action `γ • τ = (Aτ + B)(Cτ + D)⁻¹` (0.4). -/
def act (γ : GSpPos g ℝ) (τ : ℍ[g]) : ℍ[g] :=
  ⟨⟨(blockA γ * τ.toMatrix + blockB γ) * (blockC γ * τ.toMatrix + blockD γ)⁻¹, act_isSymm γ τ⟩,
    act_im_posDef γ τ⟩

/-- `1 • τ = τ` (0.4); a proof obligation of the `MulAction` instance. -/
theorem act_one (τ : ℍ[g]) : act 1 τ = τ := sorry

/-- The left-action law `(γδ) • τ = γ • (δ • τ)` (0.4). -/
theorem act_mul (γ δ : GSpPos g ℝ) (τ : ℍ[g]) : act (γ * δ) τ = act γ (act δ τ) := sorry

/-- The left action of `GSp⁺_{2g}(ℝ)` on `ℍ_g` (0.4). -/
instance : MulAction (GSpPos g ℝ) ℍ[g] where
  smul := act
  one_smul := act_one
  mul_smul := act_mul

/-- The translation `n(S) = [[1, S], [0, 1]]` for a real symmetric `S` (0.1). -/
def translation (S : Matrix (Fin g) (Fin g) ℝ) (hS : S.IsSymm) : Sp g ℝ :=
  ⟨Matrix.GeneralLinearGroup.mkOfDetNeZero (Matrix.fromBlocks 1 S 0 1)
      (by simp),
    TauCeti.GLSymplectic.mem_iff_mem_symplecticGroup.mpr (SymplecticGroup.fromBlocks_upper_mem hS)⟩

/-- The translation by an integral symmetric matrix, as an element of `Sp_{2g}(ℝ)` (0.6). -/
def translationInt (S : Matrix (Fin g) (Fin g) ℤ) (hS : S.IsSymm) : Sp g ℝ :=
  translation (S.map Int.cast) (hS.map _)

/-- The **automorphy factor** `j(γ, τ) = Cτ + D ∈ GL_g(ℂ)` (0.5). -/
def autFactor (γ : GSpPos g ℝ) (τ : ℍ[g]) : GL (Fin g) ℂ :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero (blockC γ * τ.toMatrix + blockD γ)
    (det_blockC_mul_add_blockD_ne_zero γ τ)

/-- `Γ_g = Sp_{2g}(ℤ)` as a subgroup of `Sp_{2g}(ℝ)` (0.6). -/
def Gamma (g : ℕ) : Subgroup (Sp g ℝ) := (TauCeti.GLSymplectic.map (Fin g) (Int.castRingHom ℝ)).range

/-- The **Siegel parabolic** `{C = 0}` of `Sp_{2g}(K)` (0.6, 4.1). -/
def siegelParabolic (g : ℕ) (K : Type*) [CommRing K] : Subgroup (Sp g K) where
  carrier := {γ | (Sp.mat γ).toBlocks₂₁ = 0}
  mul_mem' {a b} ha hb := by
    simp only [Set.mem_ofPred_eq] at ha hb ⊢
    change (Sp.mat a * Sp.mat b).toBlocks₂₁ = 0
    rw [← Matrix.fromBlocks_toBlocks (Sp.mat a), ← Matrix.fromBlocks_toBlocks (Sp.mat b),
      Matrix.fromBlocks_multiply, Matrix.toBlocks_fromBlocks₂₁, ha, hb]
    simp
  one_mem' := by
    ext i j
    simp [Sp.mat, Matrix.toBlocks₂₁]
  inv_mem' {a} ha := by
    simp only [Set.mem_ofPred_eq] at ha ⊢
    rw [Sp.mat_inv, ← Matrix.fromBlocks_toBlocks (Sp.mat a), ha]
    simp [Matrix.J, Matrix.fromBlocks_transpose, Matrix.fromBlocks_multiply, Matrix.fromBlocks_neg]

/-- Reduction modulo `N`, `Sp_{2g}(ℤ) → Sp_{2g}(ℤ/N)` (0.6). -/
def Sp.reduce (g N : ℕ) : Sp g ℤ →* Sp g (ZMod N) :=
  TauCeti.GLSymplectic.map (Fin g) (Int.castRingHom (ZMod N))

/-- `Γ₀^{(g)}(N) = {C ≡ 0 mod N}` as a subgroup of `Sp_{2g}(ℤ)` (0.6). -/
def Gamma0Z (g N : ℕ) : Subgroup (Sp g ℤ) := (siegelParabolic g (ZMod N)).comap (Sp.reduce g N)

/-- The image of `Sp_{2g}(ℤ)` in `Sp_{2g}(ℝ)`. -/
def Sp.intToReal : Sp g ℤ →* Sp g ℝ := TauCeti.GLSymplectic.map (Fin g) (Int.castRingHom ℝ)

/-- `Γ₀^{(g)}(N)` as a subgroup of `Sp_{2g}(ℝ)` (0.6). -/
def Gamma0 (g N : ℕ) : Subgroup (Sp g ℝ) := (Gamma0Z g N).map Sp.intToReal

/-- **Arithmetic subgroups** of `Sp_{2g}(ℝ)`: those commensurable with `Γ_g` (0.6), the exact
analogue of Mathlib's degree-one `IsArithmetic`. -/
def IsArithmetic (Γ : Subgroup (Sp g ℝ)) : Prop := Subgroup.Commensurable Γ (Gamma g)

/-- `[Γ_g : Γ₀^{(g)}(p)] = ∏_{i=1}^{g} (1 + p^i)`, the number of Lagrangian subspaces of
`𝔽_p^{2g}` (0.6). -/
theorem relindex_gamma0_prime (p : ℕ) (hp : p.Prime) :
    (Gamma0 g p).relIndex (Gamma g) = ∏ i ∈ Finset.range g, (1 + p ^ (i + 1)) := sorry

/-- The lattice `ℤ ⊕ ℤ ⊕ ℤ ⊕ Nℤ` of column vectors (0.7). -/
def paramodularLattice (N : ℕ) : Set (Fin 2 ⊕ Fin 2 → ℚ) :=
  {v | ∀ i, ∃ n : ℤ, v i = n * (if i = Sum.inr 1 then (N : ℚ) else 1)}

/-- The **paramodular group** `K(N) ≤ Sp₄(ℚ)`, the stabilizer of `L = ℤ ⊕ ℤ ⊕ ℤ ⊕ Nℤ` (0.7):
`γ L ⊆ L` and `γ⁻¹ L ⊆ L`. -/
def paramodular (N : ℕ) : Subgroup (Sp 2 ℚ) where
  carrier := {γ | ∀ v ∈ paramodularLattice N, Sp.mat γ *ᵥ v ∈ paramodularLattice N ∧
    Sp.mat γ⁻¹ *ᵥ v ∈ paramodularLattice N}
  mul_mem' {a b} ha hb v hv := by
    refine ⟨?_, ?_⟩
    · change (Sp.mat a * Sp.mat b) *ᵥ v ∈ _
      rw [← Matrix.mulVec_mulVec]
      exact (ha _ (hb v hv).1).1
    · rw [_root_.mul_inv_rev]
      change (Sp.mat b⁻¹ * Sp.mat a⁻¹) *ᵥ v ∈ _
      rw [← Matrix.mulVec_mulVec]
      exact (hb _ (ha v hv).2).2
  one_mem' v hv := by
    refine ⟨?_, ?_⟩ <;> simpa [Sp.mat] using hv
  inv_mem' {a} ha v hv := ⟨(ha v hv).2, by rw [inv_inv]; exact (ha v hv).1⟩

/-- `K(N)` as a subgroup of `Sp₄(ℝ)` (0.7). -/
def paramodularR (N : ℕ) : Subgroup (Sp 2 ℝ) := (paramodular N).map Sp.ratToReal

/-- The entrywise description of `K(N)` (0.7): the `(1,2)`, `(3,2)`, `(4,1)`, `(4,2)`, `(4,3)`
entries lie in `Nℤ`, the `(2,4)` entry in `N⁻¹ℤ`, and the others in `ℤ`. -/
theorem mem_paramodular_iff (N : ℕ) (hN : 0 < N) (γ : Sp 2 ℚ) :
    γ ∈ paramodular N ↔ ∀ i j, ∃ n : ℤ, Sp.mat γ i j = n *
        (if (i, j) ∈ ({(Sum.inl 0, Sum.inl 1), (Sum.inr 0, Sum.inl 1), (Sum.inr 1, Sum.inl 0),
            (Sum.inr 1, Sum.inl 1), (Sum.inr 1, Sum.inr 0)} : Set _) then (N : ℚ)
          else if (i, j) = (Sum.inl 1, Sum.inr 1) then (N : ℚ)⁻¹ else 1) := sorry

/-- `[Γ₂ : K(p) ∩ Γ₂] = p³ + p² + p + 1`, the number of hyperplanes of `𝔽_p⁴` (0.7). -/
theorem relindex_paramodular_inf_gamma (p : ℕ) (hp : p.Prime) :
    (paramodularR p ⊓ Gamma 2).relIndex (Gamma 2) = p ^ 3 + p ^ 2 + p + 1 := sorry

/-- The matrix `A_N = [[0, √N], [1/√N, 0]]` of the paramodular Fricke involution (0.7). -/
def frickeMatrix (N : ℕ) : Matrix (Fin 2) (Fin 2) ℝ := !![0, Real.sqrt N; 1 / Real.sqrt N, 0]

theorem det_frickeMatrix (N : ℕ) (hN : 0 < N) : (frickeMatrix N).det = -1 := by
  have h : (0 : ℝ) < Real.sqrt N := Real.sqrt_pos.mpr (by exact_mod_cast hN)
  rw [frickeMatrix, Matrix.det_fin_two_of]
  field_simp
  norm_num

/-- The **Fricke element** `μ_N = diag(A_N, A_Nᵀ) ∈ Sp₄(ℝ)` (0.7), through Tau Ceti's Levi
embedding. -/
def fricke (N : ℕ) (hN : 0 < N) : Sp 2 ℝ :=
  TauCeti.GLSymplectic.leviHom (l := Fin 2) (R := ℝ)
    (Matrix.GeneralLinearGroup.mkOfDetNeZero (frickeMatrix N)
      (by rw [det_frickeMatrix N hN]; norm_num))

/-! ## Layer 1: weights, slash operators, and the bundled forms -/

open scoped Classical in
/-- The matrix function of a representation of `GL_g(ℂ)`, extended by `0` off the units (1.1). -/
def Representation.matrixFun (ρ : Representation ℂ (GL (Fin g) ℂ) V)
    (A : Matrix (Fin g) (Fin g) ℂ) : V →ₗ[ℂ] V :=
  if h : IsUnit A then ρ h.unit else 0

/-- A **holomorphic weight**: a finite-dimensional representation of `GL_g(ℂ)` whose matrix
function is holomorphic on the open set of invertible matrices (1.1). -/
structure Weight (g : ℕ) (V : Type*) [NormedAddCommGroup V] [NormedSpace ℂ V]
    [FiniteDimensional ℂ V] where
  /-- The representation. -/
  rep : Representation ℂ (GL (Fin g) ℂ) V
  /-- Holomorphy of every matrix coefficient on the invertible matrices. -/
  holomorphic : ∀ v : V,
    DifferentiableOn ℂ (fun A : Matrix (Fin g) (Fin g) ℂ => Representation.matrixFun rep A v)
      {A | IsUnit A}

variable [FiniteDimensional ℂ V]

/-- The representation `det ^ k` of `GL_g(ℂ)` on `ℂ` (1.1). -/
def detRep (g : ℕ) (k : ℤ) : Representation ℂ (GL (Fin g) ℂ) ℂ where
  toFun A := ((Matrix.GeneralLinearGroup.det A : ℂˣ) : ℂ) ^ k • LinearMap.id
  map_one' := by ext; simp
  map_mul' A B := by
    ext
    simp [mul_zpow]
    ring

/-- The matrix coefficients of `det ^ k` are holomorphic on the invertible matrices (1.1). -/
theorem detRep_holomorphic (g : ℕ) (k : ℤ) (v : ℂ) :
    DifferentiableOn ℂ (fun A : Matrix (Fin g) (Fin g) ℂ => Representation.matrixFun (detRep g k) A v)
      {A | IsUnit A} := sorry

/-- The scalar weight `det ^ k` on `ℂ` (1.1). -/
def detWeight (g : ℕ) (k : ℤ) : Weight g ℂ := ⟨detRep g k, detRep_holomorphic g k⟩

/-- The exponent `e(det ^ k) = g k − g(g+1)/2` of the Hecke normalization (1.2, 7.2). -/
def scalarExponent (g : ℕ) (k : ℤ) : ℤ := g * k - (g * (g + 1) : ℤ) / 2

/-- The exponent `e(ρ_{k,j}) = 2k + j − 3` (1.1). -/
def vectorExponent (k : ℤ) (j : ℕ) : ℤ := 2 * k + j - 3

/-- The homogeneous polynomial `∑ v_i X₀^{j−i} X₁^i` of a coefficient vector (1.1). -/
def toHomogeneous (j : ℕ) (v : Fin (j + 1) → ℂ) : MvPolynomial (Fin 2) ℂ :=
  ∑ i : Fin (j + 1), MvPolynomial.C (v i) * MvPolynomial.X 0 ^ (j - i) * MvPolynomial.X 1 ^ (i : ℕ)

/-- The substitution `X_i ↦ ∑_l A_{l i} X_l` (1.1). -/
def substitute (A : Matrix (Fin 2) (Fin 2) ℂ) : MvPolynomial (Fin 2) ℂ →ₐ[ℂ] MvPolynomial (Fin 2) ℂ :=
  MvPolynomial.aeval fun i => ∑ l, MvPolynomial.C (A l i) * MvPolynomial.X l

/-- The action of `ρ_{k,j} = Sym^j ⊗ det^k` on coefficient vectors (1.1). -/
def rhoFun (k : ℤ) (j : ℕ) (A : GL (Fin 2) ℂ) (v : Fin (j + 1) → ℂ) : Fin (j + 1) → ℂ :=
  fun i => (A : Matrix (Fin 2) (Fin 2) ℂ).det ^ k *
    MvPolynomial.lcoeff ℂ (Finsupp.single (0 : Fin 2) (j - i) + Finsupp.single (1 : Fin 2) (i : ℕ))
      (substitute A (toHomogeneous j v))

theorem rhoFun_add (k : ℤ) (j : ℕ) (A : GL (Fin 2) ℂ) (v w : Fin (j + 1) → ℂ) :
    rhoFun k j A (v + w) = rhoFun k j A v + rhoFun k j A w := by
  funext i
  simp [rhoFun, toHomogeneous, add_mul, Finset.sum_add_distrib, mul_add]

theorem rhoFun_smul (k : ℤ) (j : ℕ) (A : GL (Fin 2) ℂ) (c : ℂ) (v : Fin (j + 1) → ℂ) :
    rhoFun k j A (c • v) = c • rhoFun k j A v := by
  funext i
  simp [rhoFun, toHomogeneous, mul_assoc, ← Finset.mul_sum, MvPolynomial.coeff_C_mul,
    mul_left_comm]

/-- `ρ_{k,j}(1) = 1` (1.1); a proof obligation of `rhoRep`. -/
theorem rhoFun_one (k : ℤ) (j : ℕ) (v : Fin (j + 1) → ℂ) : rhoFun k j 1 v = v := sorry

/-- `ρ_{k,j}(AB) = ρ_{k,j}(A) ρ_{k,j}(B)`: substitution composes, and `det` is
multiplicative (1.1). -/
theorem rhoFun_mul (k : ℤ) (j : ℕ) (A B : GL (Fin 2) ℂ) (v : Fin (j + 1) → ℂ) :
    rhoFun k j (A * B) v = rhoFun k j A (rhoFun k j B v) := sorry

/-- The representation `Sym^j ⊗ det^k` of `GL_2(ℂ)` on coefficient vectors (1.1). -/
def rhoRep (k : ℤ) (j : ℕ) : Representation ℂ (GL (Fin 2) ℂ) (Fin (j + 1) → ℂ) where
  toFun A := { toFun := rhoFun k j A, map_add' := rhoFun_add k j A, map_smul' := rhoFun_smul k j A }
  map_one' := LinearMap.ext (rhoFun_one k j)
  map_mul' A B := LinearMap.ext (rhoFun_mul k j A B)

/-- The matrix coefficients of `ρ_{k,j}` are holomorphic on the invertible matrices (1.1). -/
theorem rhoRep_holomorphic (k : ℤ) (j : ℕ) (v : Fin (j + 1) → ℂ) :
    DifferentiableOn ℂ (fun A : Matrix (Fin 2) (Fin 2) ℂ => Representation.matrixFun (rhoRep k j) A v)
      {A | IsUnit A} := sorry

/-- The weight `ρ_{k,j}`, of dimension `j + 1` and highest weight `(k + j, k)`; `(k, j)` is the
LMFDB weight (1.1). -/
def rho (k : ℤ) (j : ℕ) : Weight 2 (Fin (j + 1) → ℂ) := ⟨rhoRep k j, rhoRep_holomorphic k j⟩

/-- The **slash operator** `(f ∣_ρ γ)(τ) = ρ(Cτ + D)⁻¹ f(γ • τ)` for `γ ∈ GSp⁺_{2g}(ℝ)` (1.2);
for `γ ∈ Sp_{2g}(ℝ)` this is the operator of the conventions table. -/
def slash (ρ : Weight g V) (γ : GSpPos g ℝ) (f : ℍ[g] → V) : ℍ[g] → V :=
  fun τ => ρ.rep (autFactor γ τ)⁻¹ (f (γ • τ))

/-- The slash operator with exponent `e` for rational similitudes,
`(f ∣_{ρ,e} γ)(τ) = μ(γ)^e ρ(Cτ + D)⁻¹ f(γ • τ)` (1.2). The scalar `μ(γ)` is the one in the
membership witness of `γ`, which is the multiplier for `g ≥ 1`. -/
def slashE (ρ : Weight g V) (e : ℤ) (γ : GSpPos g ℚ) (f : ℍ[g] → V) : ℍ[g] → V :=
  fun τ => ((Classical.choose (show ∃ μ : ℚ, 0 < μ ∧
      GSpPos.mat γ * Matrix.J (Fin g) ℚ * (GSpPos.mat γ)ᵀ = μ • Matrix.J (Fin g) ℚ from γ.2) : ℚ) :
        ℂ) ^ e • slash ρ (GSpPos.ratToReal γ) f τ

theorem slash_add (ρ : Weight g V) (γ : GSpPos g ℝ) (f h : ℍ[g] → V) :
    slash ρ γ (f + h) = slash ρ γ f + slash ρ γ h := by
  funext τ
  simp [slash]

theorem slash_smul (ρ : Weight g V) (γ : GSpPos g ℝ) (c : ℂ) (f : ℍ[g] → V) :
    slash ρ γ (c • f) = c • slash ρ γ f := by
  funext τ
  simp [slash]

theorem slash_zero (ρ : Weight g V) (γ : GSpPos g ℝ) : slash ρ γ 0 = 0 := by
  funext τ
  simp [slash]

/-- The scalar slash is multiplicative: `(f h) ∣_{k+l} γ = (f ∣_k γ)(h ∣_l γ)` (1.3). -/
theorem slash_detWeight_mul (k l : ℤ) (γ : GSpPos g ℝ) (f h : ℍ[g] → ℂ) :
    slash (detWeight g (k + l)) γ (f * h) =
      slash (detWeight g k) γ f * slash (detWeight g l) γ h := by
  funext τ
  simp only [slash, detWeight, detRep, MonoidHom.coe_mk, OneHom.coe_mk, LinearMap.smul_apply,
    LinearMap.id_apply, Pi.mul_apply, smul_eq_mul]
  rw [zpow_add₀ (Units.ne_zero _)]
  ring

/-- The functions satisfying the three conditions of 1.3 (holomorphy, invariance, boundedness on
Siegel domains after every rational slash), as a subspace of `ℍ_g → V`. -/
def siegelSubmodule (Γ : Subgroup (Sp g ℝ)) (ρ : Weight g V) : Submodule ℂ (ℍ[g] → V) where
  carrier := {f | Holomorphic f ∧ (∀ γ ∈ Γ, slash ρ (Sp.toGSpPos γ) f = f) ∧
    ∀ δ : Sp g ℚ, ∀ c : ℝ, 0 < c → ∃ M : ℝ, ∀ τ : ℍ[g],
      (τ.im - c • 1).PosSemidef → ‖slash ρ (Sp.toGSpPos (Sp.ratToReal δ)) f τ‖ ≤ M}
  add_mem' := by
    rintro f h ⟨hf₁, hf₂, hf₃⟩ ⟨hh₁, hh₂, hh₃⟩
    refine ⟨hf₁.add hh₁, fun γ hγ => by rw [slash_add, hf₂ γ hγ, hh₂ γ hγ], fun δ c hc => ?_⟩
    obtain ⟨M₁, hM₁⟩ := hf₃ δ c hc
    obtain ⟨M₂, hM₂⟩ := hh₃ δ c hc
    refine ⟨M₁ + M₂, fun τ hτ => ?_⟩
    rw [slash_add, Pi.add_apply]
    exact (norm_add_le _ _).trans (add_le_add (hM₁ τ hτ) (hM₂ τ hτ))
  zero_mem' := ⟨holomorphic_const 0, fun γ _ => slash_zero ρ _,
    fun δ c _ => ⟨0, fun τ _ => by simp [slash_zero]⟩⟩
  smul_mem' := by
    rintro c f ⟨hf₁, hf₂, hf₃⟩
    refine ⟨hf₁.smul c, fun γ hγ => by rw [slash_smul, hf₂ γ hγ], fun δ c' hc' => ?_⟩
    obtain ⟨M, hM⟩ := hf₃ δ c' hc'
    refine ⟨‖c‖ * M, fun τ hτ => ?_⟩
    rw [slash_smul, Pi.smul_apply, norm_smul]
    exact mul_le_mul_of_nonneg_left (hM τ hτ) (norm_nonneg _)

/-- A **Siegel modular form** of weight `ρ` on an arithmetic `Γ ≤ Sp_{2g}(ℝ)` (1.3): holomorphic,
`∣_ρ γ`-invariant for `γ ∈ Γ`, and bounded on every Siegel domain `{Im τ ≥ c·1}` after every slash
by `Sp_{2g}(ℚ)`. For `g ≥ 2` the last field follows from the others (Koecher, 2.4,
`ofInvariant`); for `g = 1` it is the condition at the cusps. -/
structure SiegelModularForm (Γ : Subgroup (Sp g ℝ)) (ρ : Weight g V) where
  /-- The function. -/
  toFun : ℍ[g] → V
  /-- Holomorphy. -/
  holomorphic : Holomorphic toFun
  /-- Invariance under `Γ`. -/
  slash_invariant : ∀ γ ∈ Γ, slash ρ (Sp.toGSpPos γ) toFun = toFun
  /-- Boundedness on Siegel domains after every rational slash. -/
  bounded : ∀ δ : Sp g ℚ, ∀ c : ℝ, 0 < c → ∃ M : ℝ, ∀ τ : ℍ[g],
    (τ.im - c • 1).PosSemidef → ‖slash ρ (Sp.toGSpPos (Sp.ratToReal δ)) toFun τ‖ ≤ M

namespace SiegelModularForm

variable {Γ : Subgroup (Sp g ℝ)} {ρ : Weight g V}

instance : FunLike (SiegelModularForm Γ ρ) ℍ[g] V where
  coe := toFun
  coe_injective f h hfh := by
    cases f
    cases h
    congr

/-- The forms of weight `ρ` on `Γ` are the elements of `siegelSubmodule Γ ρ` (1.3). -/
def equivSubmodule : SiegelModularForm Γ ρ ≃ siegelSubmodule Γ ρ where
  toFun f := ⟨f.toFun, f.holomorphic, f.slash_invariant, f.bounded⟩
  invFun F := ⟨F.1, F.2.1, F.2.2.1, F.2.2.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

/-- `M_ρ(Γ)` is a `ℂ`-vector space (1.3), transported from `siegelSubmodule Γ ρ`. -/
instance : AddCommGroup (SiegelModularForm Γ ρ) := equivSubmodule.addCommGroup

instance : Module ℂ (SiegelModularForm Γ ρ) :=
  AddEquiv.module ℂ
    ({ equivSubmodule with map_add' := fun _ _ => Equiv.apply_symm_apply _ _ } :
      SiegelModularForm Γ ρ ≃+ siegelSubmodule Γ ρ)

/-- The scalar-valued forms of weights `k` and `l` multiply to weight `k + l` (1.3). -/
def mul {k l : ℤ} (f : SiegelModularForm Γ (detWeight g k)) (h : SiegelModularForm Γ (detWeight g l)) :
    SiegelModularForm Γ (detWeight g (k + l)) where
  toFun := ⇑f * ⇑h
  holomorphic := f.holomorphic.mul h.holomorphic
  slash_invariant γ hγ := by
    rw [slash_detWeight_mul]
    exact congrArg₂ (· * ·) (f.slash_invariant γ hγ) (h.slash_invariant γ hγ)
  bounded δ c hc := by
    obtain ⟨M₁, hM₁⟩ := f.bounded δ c hc
    obtain ⟨M₂, hM₂⟩ := h.bounded δ c hc
    refine ⟨|M₁| * |M₂|, fun τ hτ => ?_⟩
    rw [slash_detWeight_mul, Pi.mul_apply, norm_mul]
    exact mul_le_mul ((hM₁ τ hτ).trans (le_abs_self _)) ((hM₂ τ hτ).trans (le_abs_self _))
      (norm_nonneg _) (abs_nonneg _)

/-- The **parity lemma** (1.3): if `−1 ∈ Γ` and `ρ(−1)` fixes no nonzero vector of `V` then
`M_ρ(Γ) = 0`. Slashing by `−1` gives `ρ(−1) f(τ) = f(τ)` for every `τ`, so every value of `f` is
fixed by `ρ(−1)`; for irreducible `ρ` the hypothesis is `ρ(−1) ≠ 1`, and for the reducible
`ρ = det⁰ ⊕ det¹` with `ρ(−1) = diag(1, −1)` the constant `(1, 0)` is a nonzero form. -/
theorem eq_zero_of_neg_one_mem (hΓ : ∀ γ : Sp g ℝ, (γ : GL (Fin g ⊕ Fin g) ℝ) = -1 → γ ∈ Γ)
    (hρ : ∀ v : V, ρ.rep (-1) v = v → v = 0) (f : SiegelModularForm Γ ρ) : f = 0 := sorry

/-- `M_k(Γ_g) = 0` for `kg` odd (1.3): `det^k(−1) = (−1)^{kg}`. -/
theorem scalar_eq_zero_of_odd (k : ℤ) (hk : Odd (k * g)) (f : SiegelModularForm (Gamma g) (detWeight g k)) :
    f = 0 := sorry

/-- `M_{k,j}(Γ₂) = 0` for odd `j` (1.3): `ρ_{k,j}(−1) = (−1)^j`. -/
theorem vector_eq_zero_of_odd (k : ℤ) (j : ℕ) (hj : Odd j) (f : SiegelModularForm (Gamma 2) (rho k j)) :
    f = 0 := sorry

end SiegelModularForm

/-! ## Layer 2: Fourier expansions and Koecher's principle -/

/-- **Half-integral matrices**: symmetric rational `g × g` matrices with integral diagonal and
`2T` integral (2.1). -/
structure HalfIntegral (g : ℕ) where
  /-- The matrix. -/
  mat : Matrix (Fin g) (Fin g) ℚ
  /-- Symmetry. -/
  isSymm : mat.IsSymm
  /-- Integral diagonal. -/
  diag_int : ∀ i, ∃ n : ℤ, mat i i = n
  /-- `2T` integral. -/
  two_int : ∀ i j, ∃ n : ℤ, 2 * mat i j = n

namespace HalfIntegral

/-- The zero matrix as a half-integral matrix (2.1). -/
def zero (g : ℕ) : HalfIntegral g :=
  ⟨0, Matrix.isSymm_zero, fun _ => ⟨0, by simp⟩, fun _ _ => ⟨0, by simp⟩⟩

/-- The degree-two coordinates `(n, r, m)` for `[[n, r/2], [r/2, m]]` (2.1). -/
def ofTriple (n r m : ℤ) : HalfIntegral 2 where
  mat := !![(n : ℚ), (r : ℚ) / 2; (r : ℚ) / 2, (m : ℚ)]
  isSymm := Matrix.IsSymm.ext fun i j => by fin_cases i <;> fin_cases j <;> rfl
  diag_int i := by
    fin_cases i
    exacts [⟨n, rfl⟩, ⟨m, rfl⟩]
  two_int i j := by
    fin_cases i <;> fin_cases j
    exacts [⟨2 * n, by push_cast; rfl⟩, ⟨r, by simp; ring⟩, ⟨r, by simp; ring⟩,
      ⟨2 * m, by push_cast; rfl⟩]

/-- The block-diagonal matrix `diag(T', 0)` of degree `g + 1`, indexed through `finSumFinEquiv`
(2.1, 3.1). -/
def appendZeroMat (T' : HalfIntegral g) : Matrix (Fin (g + 1)) (Fin (g + 1)) ℚ :=
  Matrix.reindex finSumFinEquiv finSumFinEquiv (Matrix.fromBlocks T'.mat 0 0 0)

theorem appendZeroMat_isSymm (T' : HalfIntegral g) : (appendZeroMat T').IsSymm := by
  rw [appendZeroMat, Matrix.reindex_apply]
  exact (Matrix.IsSymm.fromBlocks T'.isSymm (by simp) Matrix.isSymm_zero).submatrix _

theorem appendZeroMat_diag_int (T' : HalfIntegral g) :
    ∀ i, ∃ n : ℤ, appendZeroMat T' i i = n := by
  intro i
  rcases hi : finSumFinEquiv.symm i with a | b
  · obtain ⟨n, hn⟩ := T'.diag_int a
    exact ⟨n, by simp [appendZeroMat, Matrix.reindex_apply, hi, hn]⟩
  · exact ⟨0, by simp [appendZeroMat, Matrix.reindex_apply, hi]⟩

theorem appendZeroMat_two_int (T' : HalfIntegral g) :
    ∀ i j, ∃ n : ℤ, 2 * appendZeroMat T' i j = n := by
  intro i j
  rcases hi : finSumFinEquiv.symm i with a | b <;> rcases hj : finSumFinEquiv.symm j with c | d
  · obtain ⟨n, hn⟩ := T'.two_int a c
    exact ⟨n, by simp [appendZeroMat, Matrix.reindex_apply, hi, hj, hn]⟩
  · exact ⟨0, by simp [appendZeroMat, Matrix.reindex_apply, hi, hj]⟩
  · exact ⟨0, by simp [appendZeroMat, Matrix.reindex_apply, hi, hj]⟩
  · exact ⟨0, by simp [appendZeroMat, Matrix.reindex_apply, hi, hj]⟩

/-- `diag(T', 0) ∈ HalfIntegral (g + 1)`, the index of the Fourier description of `Φ` (3.1). -/
def appendZero (T' : HalfIntegral g) : HalfIntegral (g + 1) :=
  ⟨appendZeroMat T', appendZeroMat_isSymm T', appendZeroMat_diag_int T', appendZeroMat_two_int T'⟩

/-- `T ≥ 0` (2.1). -/
def IsPosSemidef (T : HalfIntegral g) : Prop := (T.mat.map (algebraMap ℚ ℝ)).PosSemidef

/-- `T > 0` (2.1). -/
def IsPosDef (T : HalfIntegral g) : Prop := (T.mat.map (algebraMap ℚ ℝ)).PosDef

/-- `Uᵀ T U` has integral diagonal for integral `U` (2.1); a proof obligation of `conj`. -/
theorem conj_diag_int (U : Matrix (Fin g) (Fin g) ℤ) (T : HalfIntegral g) :
    ∀ i, ∃ n : ℤ, ((U.map (Int.cast : ℤ → ℚ))ᵀ * T.mat * U.map (Int.cast : ℤ → ℚ)) i i = n :=
  sorry

/-- `2 Uᵀ T U` is integral for integral `U` (2.1); a proof obligation of `conj`. -/
theorem conj_two_int (U : Matrix (Fin g) (Fin g) ℤ) (T : HalfIntegral g) :
    ∀ i j, ∃ n : ℤ, 2 * ((U.map (Int.cast : ℤ → ℚ))ᵀ * T.mat * U.map (Int.cast : ℤ → ℚ)) i j = n :=
  sorry

/-- The `GL_g(ℤ)`-action `T ↦ Uᵀ T U` (2.1). -/
def conj (U : Matrix (Fin g) (Fin g) ℤ) (T : HalfIntegral g) : HalfIntegral g where
  mat := (U.map Int.cast)ᵀ * T.mat * U.map Int.cast
  isSymm := by
    simp only [Matrix.IsSymm, Matrix.transpose_mul, Matrix.transpose_transpose, T.isSymm.eq,
      Matrix.mul_assoc]
  diag_int := conj_diag_int U T
  two_int := conj_two_int U T

/-- **Reduced** binary forms `(n, r, m)`: `|r| ≤ n ≤ m`, and `r ≥ 0` when `|r| = n` or `n = m`
(2.1); the LMFDB's row labels. -/
def IsReduced (n r m : ℤ) : Prop := |r| ≤ n ∧ n ≤ m ∧ ((|r| = n ∨ n = m) → 0 ≤ r)

/-- Every positive definite `(n, r, m)` is `GL₂(ℤ)`-equivalent to exactly one reduced form (2.1). -/
theorem exists_unique_reduced (n r m : ℤ) (h : (ofTriple n r m).IsPosDef) :
    ∃! T : ℤ × ℤ × ℤ, IsReduced T.1 T.2.1 T.2.2 ∧
      ∃ U : Matrix (Fin 2) (Fin 2) ℤ, IsUnit U.det ∧ conj U (ofTriple n r m) = ofTriple T.1 T.2.1 T.2.2 :=
  sorry

/-- Minkowski's finiteness (2.1): finitely many `T ≥ 0` with bounded trace. -/
theorem finite_posSemidef_trace_le (C : ℚ) :
    {T : HalfIntegral g | T.IsPosSemidef ∧ T.mat.trace ≤ C}.Finite := sorry

/-- `e(tr(Tτ)/N)`, the character of the Fourier expansion (2.2). -/
def char (N : ℕ) (T : HalfIntegral g) (τ : ℍ[g]) : ℂ :=
  cexp (2 * π * I * ((T.mat.map (algebraMap ℚ ℂ)) * τ.toMatrix).trace / N)

end HalfIntegral

open HalfIntegral

/-- The real symmetric matrix with upper-triangular coordinates `x` (2.2). -/
def symOfUpper (x : {p : Fin g × Fin g // p.1 ≤ p.2} → ℝ) : Matrix (Fin g) (Fin g) ℝ :=
  Matrix.of fun i j => if h : i ≤ j then x ⟨(i, j), h⟩ else x ⟨(j, i), le_of_not_ge h⟩

theorem symOfUpper_isSymm (x : {p : Fin g × Fin g // p.1 ≤ p.2} → ℝ) :
    (symOfUpper x).IsSymm := Matrix.IsSymm.ext fun i j => by
  rcases lt_trichotomy i j with h | rfl | h
  · simp [symOfUpper, h.le, not_le.mpr h]
  · rfl
  · simp [symOfUpper, h.le, not_le.mpr h]

/-- The point `X + i·1_g ∈ ℍ_g` for a real symmetric `X` (2.2). -/
def SiegelHalfSpace.ofRealAddI (X : Matrix (Fin g) (Fin g) ℝ) (hX : X.IsSymm) : ℍ[g] :=
  ⟨⟨X.map Complex.ofReal + Complex.I • 1, (hX.map _).add SiegelHalfSpace.isSymm_I_smul_one⟩, by
    have : (X.map Complex.ofReal + Complex.I • (1 : Matrix (Fin g) (Fin g) ℂ)).map Complex.im =
        1 := by
      ext i j
      by_cases h : i = j <;> simp [Matrix.one_apply, h]
    rw [this]
    exact Matrix.PosDef.one⟩

/-- The **Fourier coefficient** `a(T)` of a function with translation lattice `N·Sym_g(ℤ)`:
`N^{−g(g+1)/2} ∫_{X ∈ [0, N)^{g(g+1)/2}} f(X + iY) e(−tr(T(X + iY))/N) dX` at `Y = 1_g`, the
coordinates of `X` being its upper-triangular entries; independence of `Y` is a theorem of 2.2. -/
def fourierCoeff (N : ℕ) (f : ℍ[g] → V) (T : HalfIntegral g) : V :=
  ((N : ℂ) ^ (-((g * (g + 1) / 2 : ℕ) : ℤ))) •
    ∫ x in Set.univ.pi fun _ => Set.Ico (0 : ℝ) N,
      cexp (-(2 * π * I * ((T.mat.map (algebraMap ℚ ℂ)) *
          (SiegelHalfSpace.ofRealAddI (symOfUpper x) (symOfUpper_isSymm x)).toMatrix).trace / N)) •
        f (SiegelHalfSpace.ofRealAddI (symOfUpper x) (symOfUpper_isSymm x))

/-- The Fourier expansion (2.2): for `f` holomorphic and invariant under `τ ↦ τ + N S`,
`f(τ) = ∑_T a(T) e(tr(Tτ)/N)`, absolutely convergent. -/
theorem hasSum_fourier (N : ℕ) (hN : 0 < N) (f : ℍ[g] → V)
    (hf : Holomorphic f)
    (hper : ∀ (S : Matrix (Fin g) (Fin g) ℤ) (hS : S.IsSymm) (τ : ℍ[g]),
      f (Sp.toGSpPos (translationInt ((N : ℤ) • S) (hS.smul _)) • τ) = f τ) (τ : ℍ[g]) :
    HasSum (fun T : HalfIntegral g => char N T τ • fourierCoeff N f T) (f τ) := sorry

/-- Uniqueness of coefficients (2.2). -/
theorem fourierCoeff_eq_zero_of_hasSum (N : ℕ) (hN : 0 < N) (a : HalfIntegral g → V)
    (h : ∀ τ : ℍ[g], HasSum (fun T => char N T τ • a T) 0) : a = 0 := sorry

/-- The equivariance `a(UᵀTU) = ρ(Uᵀ) a(T)` for `U ∈ GL_g(ℤ)` with `m(U) = diag(U, U⁻ᵀ) ∈ Γ`
(2.2); in scalar weight `k` this is `a(UᵀTU) = det(U)^k a(T)`. -/
theorem fourierCoeff_conj {Γ : Subgroup (Sp g ℝ)} {ρ : Weight g V} (f : SiegelModularForm Γ ρ)
    (U : GL (Fin g) ℤ)
    (hU : TauCeti.GLSymplectic.leviHom (l := Fin g) (R := ℝ)
      (Matrix.GeneralLinearGroup.map (Int.castRingHom ℝ) U) ∈ Γ) (T : HalfIntegral g) :
    fourierCoeff 1 f (conj (U : Matrix (Fin g) (Fin g) ℤ) T) =
      ρ.rep (transposeGL (Matrix.GeneralLinearGroup.map (Int.castRingHom ℂ) U))
        (fourierCoeff 1 f T) := sorry

/-- **Koecher's principle** (2.4): for `g ≥ 2`, a holomorphic `Γ`-invariant function on `ℍ_g`
has Fourier coefficients supported on the positive semidefinite cone. -/
theorem koecher (hg : 2 ≤ g) {Γ : Subgroup (Sp g ℝ)} (hΓ : IsArithmetic Γ) (ρ : Weight g V)
    (f : ℍ[g] → V) (hf : Holomorphic f)
    (hinv : ∀ γ ∈ Γ, slash ρ (Sp.toGSpPos γ) f = f) (N : ℕ) (hN : 0 < N)
    (hlat : ∀ (S : Matrix (Fin g) (Fin g) ℤ) (hS : S.IsSymm),
      translationInt ((N : ℤ) • S) (hS.smul _) ∈ Γ)
    (T : HalfIntegral g) (hT : ¬ T.IsPosSemidef) : fourierCoeff N f T = 0 := sorry

/-- The boundedness that Koecher's principle gives for `g ≥ 2` (2.3, 2.4): a holomorphic
`Γ`-invariant function is bounded on every Siegel domain after every rational slash. -/
theorem bounded_of_invariant (hg : 2 ≤ g) {Γ : Subgroup (Sp g ℝ)} (hΓ : IsArithmetic Γ)
    (ρ : Weight g V) (f : ℍ[g] → V) (hf : Holomorphic f)
    (hinv : ∀ γ ∈ Γ, slash ρ (Sp.toGSpPos γ) f = f) :
    ∀ δ : Sp g ℚ, ∀ c : ℝ, 0 < c → ∃ M : ℝ, ∀ τ : ℍ[g],
      (τ.im - c • 1).PosSemidef → ‖slash ρ (Sp.toGSpPos (Sp.ratToReal δ)) f τ‖ ≤ M := sorry

/-- The constructor Koecher's principle provides for `g ≥ 2` (2.4): the boundedness field follows
from holomorphy and invariance. -/
def SiegelModularForm.ofInvariant (hg : 2 ≤ g) {Γ : Subgroup (Sp g ℝ)} (hΓ : IsArithmetic Γ)
    (ρ : Weight g V) (f : ℍ[g] → V) (hf : Holomorphic f)
    (hinv : ∀ γ ∈ Γ, slash ρ (Sp.toGSpPos γ) f = f) : SiegelModularForm Γ ρ :=
  ⟨f, hf, hinv, bounded_of_invariant hg hΓ ρ f hf hinv⟩

/-- `M_0(Γ) = ℂ` for `g ≥ 2` and arithmetic `Γ` (2.4). -/
theorem exists_eq_const (hg : 2 ≤ g) {Γ : Subgroup (Sp g ℝ)} (hΓ : IsArithmetic Γ)
    (f : SiegelModularForm Γ (detWeight g 0)) : ∃ c : ℂ, ⇑f = fun _ => c := sorry

/-- `M_k(Γ_g) = 0` for `k < 0`, `g ≥ 2` (2.4). -/
theorem eq_zero_of_neg (hg : 2 ≤ g) (k : ℤ) (hk : k < 0)
    (f : SiegelModularForm (Gamma g) (detWeight g k)) : f = 0 := sorry

/-- Hecke's bound `a(T) = O(det T ^ k)` on positive definite `T` (2.5). -/
theorem fourierCoeff_isBigO {Γ : Subgroup (Sp g ℝ)} (hΓ : IsArithmetic Γ) (k : ℤ)
    (f : SiegelModularForm Γ (detWeight g k)) : ∃ C : ℝ, ∀ T : HalfIntegral g, T.IsPosDef →
      ‖fourierCoeff 1 f T‖ ≤ C * (T.mat.det : ℝ) ^ k := sorry

/-! ## Layer 3: the Φ-operator, cusp forms, finite dimensionality -/

/-- The point `i t ∈ ℍ_1` for `t > 0` (3.1). -/
def SiegelHalfSpace.imagScalar (t : ℝ) (ht : 0 < t) : ℍ[1] :=
  ⟨⟨((t : ℂ) * Complex.I) • 1, Matrix.isSymm_one.smul _⟩, by
    have : (((t : ℂ) * Complex.I) • (1 : Matrix (Fin 1) (Fin 1) ℂ)).map Complex.im = t • 1 := by
      ext i j
      by_cases h : i = j <;> simp [h]
    rw [this]
    exact Matrix.PosDef.one.smul ht⟩

/-- The block-diagonal point `diag(τ', i t) ∈ ℍ_{g+1}` (3.1). -/
def SiegelHalfSpace.appendImag (τ' : ℍ[g]) (t : ℝ) (ht : 0 < t) : ℍ[g + 1] :=
  τ'.diagEmbed (SiegelHalfSpace.imagScalar t ht)

/-- **Siegel's Φ-operator** `(Φ f)(τ') = lim_{t → ∞} f(diag(τ', i t))` (3.1). -/
def phi (f : ℍ[g + 1] → V) : ℍ[g] → V :=
  fun τ' => limUnder atTop fun t : {t : ℝ // 0 < t} => f (τ'.appendImag t.1 t.2)

/-- `Φ` of a form of degree `g + 1` and weight `det^k` is a form of degree `g` and weight `det^k`
(3.1). -/
theorem phi_mem (k : ℤ) (f : SiegelModularForm (Gamma (g + 1)) (detWeight (g + 1) k)) :
    ∃ F : SiegelModularForm (Gamma g) (detWeight g k), ⇑F = phi f := sorry

/-- The Fourier description `(Φ f)(τ') = ∑_{T' ≥ 0} a(diag(T', 0)) e(tr(T' τ'))` (3.1). -/
theorem fourierCoeff_phi (k : ℤ) (f : SiegelModularForm (Gamma (g + 1)) (detWeight (g + 1) k))
    (F : SiegelModularForm (Gamma g) (detWeight g k)) (hF : ⇑F = phi f) (T' : HalfIntegral g) :
    fourierCoeff 1 F T' = fourierCoeff 1 f T'.appendZero := sorry

/-- `Φ : M_{k,j}(Γ₂) → M_{k+j}(SL₂(ℤ))` in the vector-valued case, through the `X₀^j`-coordinate
(3.1). -/
theorem phi_rho (k : ℤ) (j : ℕ) (f : SiegelModularForm (Gamma 2) (rho k j)) :
    ∃ F : SiegelModularForm (Gamma 1) (detWeight 1 (k + j)), ⇑F = fun τ => phi (⇑f) τ 0 := sorry

/-- **Cusp forms** (3.2): `Φ(f ∣_ρ γ) = 0` for every `γ ∈ Sp_{2g}(ℚ)`. -/
def IsCuspForm {Γ : Subgroup (Sp (g + 1) ℝ)} {ρ : Weight (g + 1) V} (f : SiegelModularForm Γ ρ) :
    Prop :=
  ∀ δ : Sp (g + 1) ℚ, phi (slash ρ (Sp.toGSpPos (Sp.ratToReal δ)) f) = 0

/-- For `Γ = Γ_g` cuspidality is `a(T) = 0` for every singular `T` (3.2). -/
theorem isCuspForm_iff_fourierCoeff (k : ℤ) (f : SiegelModularForm (Gamma (g + 1)) (detWeight (g + 1) k)) :
    IsCuspForm f ↔ ∀ T : HalfIntegral (g + 1), T.mat.det = 0 → fourierCoeff 1 f T = 0 := sorry

/-- The zero form is a cusp form; a proof obligation of `cuspSubmodule`. -/
theorem isCuspForm_zero (Γ : Subgroup (Sp (g + 1) ℝ)) (ρ : Weight (g + 1) V) :
    IsCuspForm (0 : SiegelModularForm Γ ρ) := sorry

/-- Cusp forms are closed under addition (3.2); `Φ` is linear on forms because its limits exist
(3.1). A proof obligation of `cuspSubmodule`. -/
theorem IsCuspForm.add {Γ : Subgroup (Sp (g + 1) ℝ)} {ρ : Weight (g + 1) V}
    {f h : SiegelModularForm Γ ρ} (hf : IsCuspForm f) (hh : IsCuspForm h) : IsCuspForm (f + h) :=
  sorry

/-- Cusp forms are closed under scalars; a proof obligation of `cuspSubmodule`. -/
theorem IsCuspForm.smul {Γ : Subgroup (Sp (g + 1) ℝ)} {ρ : Weight (g + 1) V} (c : ℂ)
    {f : SiegelModularForm Γ ρ} (hf : IsCuspForm f) : IsCuspForm (c • f) := sorry

/-- The cusp forms `S_ρ(Γ)` as a subspace (3.2). -/
def cuspSubmodule (Γ : Subgroup (Sp (g + 1) ℝ)) (ρ : Weight (g + 1) V) :
    Submodule ℂ (SiegelModularForm Γ ρ) where
  carrier := {f | IsCuspForm f}
  add_mem' := IsCuspForm.add
  zero_mem' := isCuspForm_zero Γ ρ
  smul_mem' := IsCuspForm.smul

/-- The cusp-form bound `|a(T)| ≤ C det(T)^{k/2}` (2.5, 3.2). -/
theorem fourierCoeff_cusp_isBigO {Γ : Subgroup (Sp (g + 1) ℝ)} (hΓ : IsArithmetic Γ) (k : ℤ)
    (f : SiegelModularForm Γ (detWeight (g + 1) k)) (hf : IsCuspForm f) :
    ∃ C : ℝ, ∀ T : HalfIntegral (g + 1), T.IsPosDef →
      ‖fourierCoeff 1 f T‖ ≤ C * (T.mat.det : ℝ) ^ ((k : ℝ) / 2) := sorry

/-- **Finite dimensionality** (3.5): `M_ρ(Γ)` is finite-dimensional for every arithmetic `Γ`. -/
theorem finiteDimensional {Γ : Subgroup (Sp g ℝ)} (hΓ : IsArithmetic Γ) (ρ : Weight g V) :
    FiniteDimensional ℂ (SiegelModularForm Γ ρ) := sorry

/-- The Siegel–Eichler analogue of the Sturm bound (3.5): a scalar form on `Γ_g` all of whose
coefficients with `tr T ≤ C(g, k)` vanish is zero. -/
theorem eq_zero_of_fourierCoeff_eq_zero (k : ℤ) : ∃ C : ℚ, ∀ f : SiegelModularForm (Gamma g) (detWeight g k),
    (∀ T : HalfIntegral g, T.mat.trace ≤ C → fourierCoeff 1 f T = 0) → f = 0 := sorry

/-! ## Layer 4: Siegel and Klingen Eisenstein series -/

/-- The series `∑_{γ ∈ P_g \ Γ_g} det(Cτ + D)^{−k}` over the right cosets of the Siegel
parabolic, one representative per coset; for even `k` the term does not depend on the
representative, since `det D = ±1` on `P_g` (4.1). -/
def siegelEisensteinFun (g k : ℕ) (τ : ℍ[g]) : ℂ :=
  ∑' q : Quotient (QuotientGroup.rightRel (siegelParabolic g ℤ)),
    ((autFactor (Sp.toGSpPos (Sp.intToReal q.out)) τ : Matrix (Fin g) (Fin g) ℂ).det) ^
      (-(k : ℤ))

/-- For even `k > g + 1` the series converges to a modular form of weight `k` on `Γ_g` (4.1). -/
theorem siegelEisensteinFun_mem (g k : ℕ) (hk : g + 1 < k) (hk2 : Even k) :
    siegelEisensteinFun g k ∈ siegelSubmodule (Gamma g) (detWeight g k) := sorry

/-- The **Siegel Eisenstein series** `E_k^{(g)} = ∑_{(C,D)} det(Cτ + D)^{−k}` over
`GL_g(ℤ)\{coprime symmetric pairs}`, for even `k > g + 1`, normalized by `a(0) = 1` (4.1). -/
def siegelEisenstein (g k : ℕ) (hk : g + 1 < k) (hk2 : Even k) :
    SiegelModularForm (Gamma g) (detWeight g k) :=
  SiegelModularForm.equivSubmodule.symm ⟨siegelEisensteinFun g k, siegelEisensteinFun_mem g k hk hk2⟩

/-- The constant term of `E_k^{(g)}` is `1` (4.1). -/
theorem fourierCoeff_siegelEisenstein_zero (g k : ℕ) (hk : g + 1 < k) (hk2 : Even k) :
    fourierCoeff 1 (siegelEisenstein g k hk hk2) (HalfIntegral.zero g) = 1 := sorry

/-- `Φ E_k^{(g+1)} = E_k^{(g)}` (4.1). -/
theorem phi_siegelEisenstein (g k : ℕ) (hk : g + 2 < k) (hk2 : Even k) :
    phi (siegelEisenstein (g + 1) k hk hk2) =
      siegelEisenstein g k (by omega) hk2 := sorry

/-! ## Layer 5: Siegel theta series -/

section Theta

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- The Gram matrix `(⟪v_i, v_j⟫)_{ij}` of a `g`-tuple of vectors, as a complex matrix (5.1). -/
def gram (v : Fin g → E) : Matrix (Fin g) (Fin g) ℂ := Matrix.of fun i j => ((⟪v i, v j⟫ : ℝ) : ℂ)

/-- The **degree-`g` theta series** `θ_L^{(g)}(τ) = ∑_{v ∈ L^g} exp(π i tr(Gram(v) τ))` of a
lattice in the real model of the theta-series roadmap (5.1); at `g = 1` it is that roadmap's
`thetaSeries L`. -/
def siegelTheta (L : Submodule ℤ E) (g : ℕ) (τ : ℍ[g]) : ℂ :=
  ∑' v : Fin g → L, cexp (π * I * (gram (fun i => (v i : E)) * τ.toMatrix).trace)

/-- Summability of the theta series (5.1), which makes the `tsum` the series. -/
theorem summable_siegelTheta (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] (τ : ℍ[g]) :
    Summable fun v : Fin g → L => cexp (π * I * (gram (fun i => (v i : E)) * τ.toMatrix).trace) :=
  sorry

/-- The representation numbers `r_L(T) = #{v ∈ L^g : Gram(v) = 2T}` are the coefficients of the
theta series of an even lattice (5.1). -/
theorem fourierCoeff_siegelTheta (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (heven : ∀ x ∈ L, ∃ m : ℤ, ⟪x, x⟫ = 2 * m) (T : HalfIntegral g) :
    fourierCoeff 1 (siegelTheta L g) T =
      Set.ncard {v : Fin g → L | gram (fun i => (v i : E)) = (2 : ℂ) • T.mat.map (algebraMap ℚ ℂ)} :=
  sorry

/-- **Modularity for even unimodular lattices** (5.2): rank `2k` gives `θ_L^{(g)} ∈ M_k(Γ_g)`. -/
theorem siegelTheta_mem (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] (k : ℕ)
    (hrank : Module.finrank ℝ E = 2 * k) (heven : ∀ x ∈ L, ∃ m : ℤ, ⟪x, x⟫ = 2 * m)
    (hunimod : LinearMap.BilinForm.dualSubmodule (innerₗ E) L = L) (g : ℕ) :
    ∃ F : SiegelModularForm (Gamma g) (detWeight g k), ⇑F = siegelTheta L g := sorry

/-- The transformation under `J` (5.2) for a lattice of even rank `2k`:
`θ_L(−τ⁻¹) = det(τ/i)^k covol(L)⁻¹ θ_{L^∨}(τ)`. For odd rank the README's `det(τ/i)^{m/2}` is the
holomorphic square root positive at `τ = iY`, which for `g ≥ 3` is not the principal branch of
`cpow`, so that case is stated in the README only. -/
theorem siegelTheta_symJ_smul [MeasurableSpace E] [BorelSpace E] (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (k : ℕ) (hrank : Module.finrank ℝ E = 2 * k) (τ : ℍ[g]) :
    siegelTheta L g (Sp.toGSpPos (TauCeti.GLSymplectic.symJ (Fin g) ℝ) • τ) =
      (τ.toMatrix.map fun z => z / I).det ^ k *
        (ZLattice.covolume L MeasureTheory.volume : ℂ)⁻¹ *
        siegelTheta (LinearMap.BilinForm.dualSubmodule (innerₗ E) L) g τ := sorry

end Theta

/-- A **theta constant with characteristic** `ε = (ε', ε'')`,
`θ_ε(τ) = ∑_{n ∈ ℤ^g} exp(π i [(n + ε'/2) τ (n + ε'/2)ᵀ + (n + ε'/2)·ε''])` (5.4). -/
def thetaConstant (ε' ε'' : Fin g → Fin 2) (τ : ℍ[g]) : ℂ :=
  ∑' n : Fin g → ℤ, cexp (π * I *
    ((∑ i, ∑ j, ((n i : ℂ) + (ε' i : ℂ) / 2) * τ.toMatrix i j * ((n j : ℂ) + (ε' j : ℂ) / 2)) +
      ∑ i, ((n i : ℂ) + (ε' i : ℂ) / 2) * (ε'' i : ℂ)))

/-- A characteristic is **even** when `ε' · ε'' ≡ 0 mod 2` (5.4). -/
def IsEvenChar (ε' ε'' : Fin g → Fin 2) : Prop := Even (∑ i, (ε' i : ℕ) * (ε'' i : ℕ))

/-- `θ_ε = 0` iff `ε` is odd (5.4). -/
theorem thetaConstant_eq_zero_iff (ε' ε'' : Fin g → Fin 2) :
    thetaConstant ε' ε'' = 0 ↔ ¬ IsEvenChar ε' ε'' := sorry

/-- There are `2^{g−1}(2^g + 1)` even characteristics (5.4). -/
theorem card_evenChar (hg : 0 < g) :
    Nat.card {ε : (Fin g → Fin 2) × (Fin g → Fin 2) // IsEvenChar ε.1 ε.2} =
      2 ^ (g - 1) * (2 ^ g + 1) := sorry

/-! ## Layer 6: the degree-two rings -/

/-- `ψ_k := E_k^{(2)}` (6.1). -/
def psi (k : ℕ) (hk : 3 < k) (hk2 : Even k) : SiegelModularForm (Gamma 2) (detWeight 2 k) :=
  siegelEisenstein 2 k hk hk2

/-- Igusa's constant for `χ₁₀`: `−43867 · 2^{−12} 3^{−5} 5^{−2} 7^{−1} 53^{−1}`. -/
def igusaConst10 : ℚ := -43867 / (2 ^ 12 * 3 ^ 5 * 5 ^ 2 * 7 * 53)

/-- Igusa's constant for `χ₁₂`: `131 · 593 · 2^{−13} 3^{−7} 5^{−3} 7^{−2} 337^{−1}`. -/
def igusaConst12 : ℚ := 131 * 593 / (2 ^ 13 * 3 ^ 7 * 5 ^ 3 * 7 ^ 2 * 337)

/-- `χ₁₀ := −4 c₁₀ (ψ₄ψ₆ − ψ₁₀)`, the cusp form of weight 10 normalized by `a((1,1,1)) = 1`;
the LMFDB's `C`, which is `−4` times Igusa's `χ₁₀` (6.1). -/
def chi10 : SiegelModularForm (Gamma 2) (detWeight 2 10) :=
  ((-4 * igusaConst10 : ℚ) : ℂ) •
    ((show SiegelModularForm (Gamma 2) (detWeight 2 10) from
        SiegelModularForm.mul (psi 4 (by norm_num) (by decide)) (psi 6 (by norm_num) (by decide))) -
      (show SiegelModularForm (Gamma 2) (detWeight 2 10) from psi 10 (by norm_num) (by decide)))

/-- `χ₁₂ := 12 c₁₂ (441 ψ₄³ + 250 ψ₆² − 691 ψ₁₂)`, the cusp form of weight 12 normalized by
`a((1,1,1)) = 1`; the LMFDB's `D`, which is `12` times Igusa's `χ₁₂` (6.1). -/
def chi12 : SiegelModularForm (Gamma 2) (detWeight 2 12) :=
  ((12 * igusaConst12 : ℚ) : ℂ) •
    ((441 : ℂ) • (show SiegelModularForm (Gamma 2) (detWeight 2 12) from
        SiegelModularForm.mul (SiegelModularForm.mul (psi 4 (by norm_num) (by decide))
          (psi 4 (by norm_num) (by decide))) (psi 4 (by norm_num) (by decide))) +
      (250 : ℂ) • (show SiegelModularForm (Gamma 2) (detWeight 2 12) from
        SiegelModularForm.mul (psi 6 (by norm_num) (by decide)) (psi 6 (by norm_num) (by decide))) -
      (691 : ℂ) • (show SiegelModularForm (Gamma 2) (detWeight 2 12) from
        psi 12 (by norm_num) (by decide)))

/-- `χ₁₀` is a cusp form (6.1): `Φ(ψ₄ψ₆ − ψ₁₀) = E₄E₆ − E₁₀ = 0`. -/
theorem chi10_isCuspForm : IsCuspForm chi10 := sorry

/-- `χ₁₂` is a cusp form (6.1): `Φ(441ψ₄³ + 250ψ₆² − 691ψ₁₂) = 0`. -/
theorem chi12_isCuspForm : IsCuspForm chi12 := sorry

/-- The four even generators as functions, in the order `(ψ₄, ψ₆, χ₁₀, χ₁₂)` (6.3). -/
def igusaGenerators : Fin 4 → (ℍ[2] → ℂ) :=
  ![⇑(psi 4 (by norm_num) (by decide)), ⇑(psi 6 (by norm_num) (by decide)), ⇑chi10, ⇑chi12]

/-- The weights `(4, 6, 10, 12)` of the even generators (6.3). -/
def igusaWeights : Fin 4 → ℕ := ![4, 6, 10, 12]

/-- The symmetric direction of the coordinate `τ_{ab}` of `ℍ_2`: `E_{aa}` on the diagonal and
`E_{ab} + E_{ba}` off it (6.2). -/
def symDir (a b : Fin 2) : Sym 2 :=
  ⟨Matrix.of fun i j => if (i = a ∧ j = b) ∨ (i = b ∧ j = a) then 1 else 0,
    Matrix.IsSymm.ext fun i j => by
      simp only [Matrix.of_apply]
      split_ifs <;> tauto⟩

/-- The normalized partial derivative `∂_{ab} f = (2πi)⁻¹ ∂f/∂τ_{ab}` on `ℍ_2`, which multiplies
the Fourier coefficient at `(n, r, m)` by `n`, `r`, `m` for `ab = 11, 12, 22` (6.2). -/
def normDeriv (f : ℍ[2] → ℂ) (a b : Fin 2) (τ : ℍ[2]) : ℂ :=
  (2 * π * I)⁻¹ * fderiv ℂ (extendZero f) τ.1 (symDir a b)

/-- The **Wronskian** `W` of `(ψ₄, ψ₆, χ₁₀, χ₁₂)` (6.2): first row the generators times their
weights, then their normalized derivatives `∂₁₁`, `∂₁₂`, `∂₂₂`. -/
def wronskian (τ : ℍ[2]) : ℂ :=
  Matrix.det (Matrix.of fun r i : Fin 4 =>
    match r with
    | 0 => (igusaWeights i : ℂ) * igusaGenerators i τ
    | 1 => normDeriv (igusaGenerators i) 0 0 τ
    | 2 => normDeriv (igusaGenerators i) 0 1 τ
    | 3 => normDeriv (igusaGenerators i) 1 1 τ)

/-- `W ∈ S₃₅(Γ₂)` (6.2, Aoki–Ibukiyama Theorem 4.1). -/
theorem wronskian_mem : wronskian ∈ siegelSubmodule (Gamma 2) (detWeight 2 35) := sorry

/-- `χ₃₅ := W / a(W; (2,1,3))`, the odd generator, normalized by `a((2,1,3)) = 1` (6.2). -/
def chi35 : SiegelModularForm (Gamma 2) (detWeight 2 35) :=
  (fourierCoeff 1 wronskian (ofTriple 2 1 3))⁻¹ •
    SiegelModularForm.equivSubmodule.symm ⟨wronskian, wronskian_mem⟩

/-- **Igusa's structure theorem, even part** (6.3): every form of even weight `k` on `Γ₂` is a
unique isobaric polynomial of weight `k` in `ψ₄, ψ₆, χ₁₀, χ₁₂`. -/
theorem igusa_even (k : ℕ) (hk : Even k) (f : SiegelModularForm (Gamma 2) (detWeight 2 k)) :
    ∃! P : MvPolynomial (Fin 4) ℂ, P.IsWeightedHomogeneous igusaWeights k ∧
      MvPolynomial.aeval igusaGenerators P = ⇑f := sorry

/-- `ψ₄, ψ₆, χ₁₀, χ₁₂` are algebraically independent (6.3). -/
theorem igusaGenerators_algebraicIndependent : AlgebraicIndependent ℂ igusaGenerators := sorry

/-- **Igusa's structure theorem, odd part** (6.3): every form of odd weight `k` on `Γ₂` is `χ₃₅`
times a unique isobaric polynomial of weight `k − 35` in the even generators. -/
theorem igusa_odd (k : ℕ) (hk : Odd k) (f : SiegelModularForm (Gamma 2) (detWeight 2 k)) :
    ∃! P : MvPolynomial (Fin 4) ℂ, P.IsWeightedHomogeneous igusaWeights (k - 35) ∧
      ⇑chi35 * MvPolynomial.aeval igusaGenerators P = ⇑f := sorry

/-- The coefficient of `t^k` in `(1 + t³⁵)/((1 − t⁴)(1 − t⁶)(1 − t¹⁰)(1 − t¹²))` (6.3). -/
def igusaDim (k : ℕ) : ℕ :=
  Set.ncard {x : ℕ × ℕ × ℕ × ℕ × Fin 2 |
    4 * x.1 + 6 * x.2.1 + 10 * x.2.2.1 + 12 * x.2.2.2.1 + 35 * (x.2.2.2.2 : ℕ) = k}

/-- `dim M_k(Γ₂)` is the Hilbert-series coefficient (6.3). -/
theorem finrank_eq_igusaDim (k : ℕ) :
    Module.finrank ℂ (SiegelModularForm (Gamma 2) (detWeight 2 k)) = igusaDim k := sorry

/-! ## Layer 7: Hecke operators and eigenforms -/

/-- The semigroup `O_g(m)` of integral similitudes of multiplier `m` (0.2, 7.1). -/
def integralSimilitudes (g m : ℕ) : Set (GSpPos g ℚ) :=
  {M | (∀ i j, ∃ n : ℤ, GSpPos.mat M i j = n) ∧
    GSpPos.mat M * Matrix.J (Fin g) ℚ * (GSpPos.mat M)ᵀ = (m : ℚ) • Matrix.J (Fin g) ℚ}

/-- `Γ_g` as a subgroup of `GL (Fin g ⊕ Fin g) ℚ`, for Mathlib's Hecke-triple predicate (7.1). -/
def GammaQ (g : ℕ) : Subgroup (GL (Fin g ⊕ Fin g) ℚ) :=
  ((TauCeti.GLSymplectic.map (Fin g) (Int.castRingHom ℚ)).range).map (Sp g ℚ).subtype

/-- `(Γ_g, GSp⁺_{2g}(ℚ))` is a Hecke pair in Mathlib's sense (7.1). -/
theorem isHeckeTriple_gamma : IsHeckeTriple (GSpPos g ℚ).toSubmonoid (GammaQ g) (GammaQ g) := sorry

/-- `Γ_g` inside `GSp⁺_{2g}(ℚ)`, whose right cosets index the Hecke sums (7.1). -/
def gammaGSp (g : ℕ) : Subgroup (GSpPos g ℚ) := (Sp.toGSpPos.comp Sp.intToRat).range

/-- The right cosets `Γ_g γ` meeting a subset of `GSp⁺_{2g}(ℚ)` (7.1). -/
def rightCosetsOf (S : Set (GSpPos g ℚ)) : Set (Quotient (QuotientGroup.rightRel (gammaGSp g))) :=
  Quotient.mk _ '' S

/-- `O_g(m)` is a finite union of right cosets of `Γ_g` (7.1, van der Geer Lemma 16.1). -/
theorem finite_rightCosetsOf_integralSimilitudes (g m : ℕ) :
    (rightCosetsOf (integralSimilitudes g m)).Finite := sorry

open scoped Classical in
/-- A set of representatives of `Γ_g \ O_g(m)`, one per right coset (7.1). -/
def cosetReps (g m : ℕ) : Finset (GSpPos g ℚ) :=
  (finite_rightCosetsOf_integralSimilitudes g m).toFinset.image Quotient.out

/-- `cosetReps g m` is a complete set of right-coset representatives (7.1). -/
theorem cosetReps_spec (g m : ℕ) :
    (∀ γ ∈ cosetReps g m, γ ∈ integralSimilitudes g m) ∧
    ∀ M ∈ integralSimilitudes g m, ∃! γ ∈ cosetReps g m,
      ∃ δ : Sp g ℤ, M = Sp.toGSpPos (Sp.intToRat δ) * γ := sorry

/-- The diagonal matrix `diag(1_{g−i}, p 1_i, p² 1_{g−i}, p 1_i)` of `T_i(p²)` (7.1). -/
def heckeDiag (g p i : ℕ) : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℚ :=
  Matrix.diagonal (Sum.elim (fun a => if (a : ℕ) < g - i then 1 else (p : ℚ))
    (fun a => if (a : ℕ) < g - i then (p : ℚ) ^ 2 else p))

/-- The double coset `Γ_g diag(1_{g−i}, p 1_i, p² 1_{g−i}, p 1_i) Γ_g` (7.1). -/
def heckeDoubleCoset (g p i : ℕ) : Set (GSpPos g ℚ) :=
  {M | ∃ a b : Sp g ℤ,
    GSpPos.mat M = Sp.mat (Sp.intToRat a) * heckeDiag g p i * Sp.mat (Sp.intToRat b)}

/-- The double coset of `T_i(p²)` is a finite union of right cosets of `Γ_g` (7.1). -/
theorem finite_rightCosetsOf_heckeDoubleCoset (g p i : ℕ) :
    (rightCosetsOf (heckeDoubleCoset g p i)).Finite := sorry

open scoped Classical in
/-- A set of representatives of `Γ_g \ Γ_g diag(1_{g−i}, p 1_i, p² 1_{g−i}, p 1_i) Γ_g` (7.1). -/
def cosetRepsTi (g p i : ℕ) : Finset (GSpPos g ℚ) :=
  (finite_rightCosetsOf_heckeDoubleCoset g p i).toFinset.image Quotient.out

/-- Degree-two coset counts (7.1): `(p+1)(p²+1)`, `p³(p+1)(p²+1)`, `p(p+1)(p²+1)`, `1`. -/
theorem card_cosetReps_two (p : ℕ) (hp : p.Prime) :
    (cosetReps 2 p).card = (p + 1) * (p ^ 2 + 1) ∧
    (cosetRepsTi 2 p 0).card = p ^ 3 * (p + 1) * (p ^ 2 + 1) ∧
    (cosetRepsTi 2 p 1).card = p * (p + 1) * (p ^ 2 + 1) ∧
    (cosetRepsTi 2 p 2).card = 1 := sorry

/-- `T(m) f = ∑_{γ ∈ Γ_g \ O_g(m)} f ∣_{ρ,e} γ` on functions (7.2). -/
def heckeTFun (ρ : Weight g V) (e : ℤ) (m : ℕ) (f : ℍ[g] → V) : ℍ[g] → V :=
  ∑ γ ∈ cosetReps g m, slashE ρ e γ f

/-- `T_i(p²)` on functions (7.2). -/
def heckeTiFun (ρ : Weight g V) (e : ℤ) (p i : ℕ) (f : ℍ[g] → V) : ℍ[g] → V :=
  ∑ γ ∈ cosetRepsTi g p i, slashE ρ e γ f

/-- `T(m) f` is again a modular form on `Γ_g`: the sum does not depend on the representatives
and is permuted by `Γ_g` (7.2). -/
theorem heckeTFun_mem (ρ : Weight g V) (e : ℤ) (m : ℕ) (f : SiegelModularForm (Gamma g) ρ) :
    heckeTFun ρ e m f ∈ siegelSubmodule (Gamma g) ρ := sorry

/-- The **Hecke operator** `T(m)` on `M_ρ(Γ_g)`, with the normalization exponent `e` of the
conventions table (`scalarExponent g k` for `det^k`, `vectorExponent k j` for `ρ_{k,j}`) (7.2). -/
def heckeT (ρ : Weight g V) (e : ℤ) (m : ℕ) (f : SiegelModularForm (Gamma g) ρ) :
    SiegelModularForm (Gamma g) ρ :=
  SiegelModularForm.equivSubmodule.symm ⟨heckeTFun ρ e m f, heckeTFun_mem ρ e m f⟩

/-- `T_i(p²) f` is again a modular form on `Γ_g` (7.2). -/
theorem heckeTiFun_mem (ρ : Weight g V) (e : ℤ) (p i : ℕ) (f : SiegelModularForm (Gamma g) ρ) :
    heckeTiFun ρ e p i f ∈ siegelSubmodule (Gamma g) ρ := sorry

/-- The Hecke operator `T_i(p²)` on `M_ρ(Γ_g)` (7.2). -/
def heckeTi (ρ : Weight g V) (e : ℤ) (p i : ℕ) (f : SiegelModularForm (Gamma g) ρ) :
    SiegelModularForm (Gamma g) ρ :=
  SiegelModularForm.equivSubmodule.symm ⟨heckeTiFun ρ e p i f, heckeTiFun_mem ρ e p i f⟩

/-- `T(p²) = ∑_{i=0}^{g} T_i(p²)` (7.1). -/
theorem heckeT_sq (ρ : Weight g V) (e : ℤ) (p : ℕ) (hp : p.Prime) (f : SiegelModularForm (Gamma g) ρ) :
    heckeT ρ e (p ^ 2) f = ∑ i ∈ Finset.range (g + 1), heckeTi ρ e p i f := sorry

/-- The Hecke operators commute (7.1, 7.2): the Hecke ring is commutative. -/
theorem heckeT_comm (ρ : Weight g V) (e : ℤ) (m n : ℕ) (f : SiegelModularForm (Gamma g) ρ) :
    heckeT ρ e m (heckeT ρ e n f) = heckeT ρ e n (heckeT ρ e m f) := sorry

/-- Multiplicativity `T(mn) = T(m) T(n)` for coprime `m, n` (7.5). -/
theorem heckeT_mul_of_coprime (ρ : Weight g V) (e : ℤ) (m n : ℕ) (h : Nat.Coprime m n)
    (f : SiegelModularForm (Gamma g) ρ) : heckeT ρ e (m * n) f = heckeT ρ e m (heckeT ρ e n f) := sorry

/-- Hecke operators preserve cusp forms (7.2): `Φ` of each slash is a slash of `Φ f`. -/
theorem isCuspForm_heckeT {ρ : Weight (g + 1) V} (e : ℤ) (m : ℕ)
    (f : SiegelModularForm (Gamma (g + 1)) ρ) (hf : IsCuspForm f) : IsCuspForm (heckeT ρ e m f) := sorry

/-- The `g = 1` bridge (7.2): for `ρ = det^k`, `e = k − 1`, `T(p)` is Tau Ceti's `Tₙ` at `n = p`
under the comparison of 1.3; stated as agreement of the eigenvalue on a normalized level-one
newform read through `equivUpperHalfPlane`, `λ(p) = a_p`. -/
theorem heckeT_one_eq (k : ℤ) (p : ℕ) (hp : p.Prime) (f : HeckeRing.GL2.Newform 1 k)
    (F : SiegelModularForm (Gamma 1) (detWeight 1 k))
    (hF : ⇑F = fun τ => f.toCuspForm (SiegelHalfSpace.equivUpperHalfPlane τ)) :
    heckeT _ (scalarExponent 1 k) p F = ((qExpansion 1 f.toCuspForm).coeff p) • F := sorry

/-- **Hecke eigenforms** (7.2): nonzero simultaneous eigenvectors of all `T(m)` and `T_i(p²)`. -/
def IsHeckeEigenform (ρ : Weight g V) (e : ℤ) (f : SiegelModularForm (Gamma g) ρ) : Prop :=
  f ≠ 0 ∧ (∀ m : ℕ, ∃ c : ℂ, heckeT ρ e m f = c • f) ∧
    ∀ p i : ℕ, ∃ c : ℂ, heckeTi ρ e p i f = c • f

/-- The eigenvalue `λ_f(T(m))` of an eigenform (7.2). -/
def eigenvalue {ρ : Weight g V} {e : ℤ} {f : SiegelModularForm (Gamma g) ρ} (hf : IsHeckeEigenform ρ e f)
    (m : ℕ) : ℂ := Classical.choose (hf.2.1 m)

/-- Cusp forms have a basis of eigenforms (7.2): the Hecke operators are commuting self-adjoint
operators for the Petersson product on a finite-dimensional space. -/
theorem exists_eigenform_basis (k : ℤ) :
    ∃ s : Finset (SiegelModularForm (Gamma (g + 1)) (detWeight (g + 1) k)),
      (∀ f ∈ s, IsCuspForm f ∧ IsHeckeEigenform _ (scalarExponent (g + 1) k) f) ∧
      LinearIndependent ℂ (fun f : s => (f : SiegelModularForm (Gamma (g + 1)) (detWeight (g + 1) k))) ∧
      Submodule.span ℂ (s : Set _) = cuspSubmodule (Gamma (g + 1)) (detWeight (g + 1) k) := sorry

/-- The `T(p)`-eigenvalue of `E_k^{(g)}`, `λ(T(p)) = ∏_{i=1}^{g} (1 + p^{k−i})`, from its Satake
parameters `α₀ = 1`, `α_i = p^{k−i}` (7.4). -/
theorem eigenvalue_siegelEisenstein (g k : ℕ) (hk : g + 1 < k) (hk2 : Even k) (p : ℕ) (hp : p.Prime) :
    ∃ hf : IsHeckeEigenform _ (scalarExponent g k) (siegelEisenstein g k hk hk2),
      eigenvalue hf p = ∏ i ∈ Finset.range g, (1 + (p : ℂ) ^ (k - (i + 1) : ℤ)) := sorry

/-- The coefficient of a scalar form of degree two at `(n, r, m)`, zero unless half-integral. -/
def coeffTriple {k : ℤ} (f : SiegelModularForm (Gamma 2) (detWeight 2 k)) (n r m : ℤ) : ℂ :=
  fourierCoeff 1 f (ofTriple n r m)

/-- The **degree-two coefficient formula** for `T(p)` in scalar weight `k` (7.5), with the
representatives `R_p = {[[1,0],[0,p]]} ∪ {[[p,u],[0,1]] : 0 ≤ u < p}`:
`a(T(p)F; (n,r,m)) = a(pn,pr,pm) + p^{k−2} [a(n/p, r, pm) + ∑_u a(pn, 2nu + r, (nu² + ru + m)/p)]
+ p^{2k−3} a(n/p, r/p, m/p)`, each term present only when its argument is integral. -/
theorem coeffTriple_heckeT (k : ℤ) (p : ℕ) (hp : p.Prime)
    (f : SiegelModularForm (Gamma 2) (detWeight 2 k)) (n r m : ℤ) :
    coeffTriple (heckeT _ (scalarExponent 2 k) p f) n r m =
      coeffTriple f (p * n) (p * r) (p * m) +
      (p : ℂ) ^ (k - 2) * ((if (p : ℤ) ∣ n then coeffTriple f (n / p) r (p * m) else 0) +
        ∑ u ∈ Finset.range p, if (p : ℤ) ∣ n * u ^ 2 + r * u + m then
          coeffTriple f (p * n) (2 * n * u + r) ((n * u ^ 2 + r * u + m) / p) else 0) +
      (p : ℂ) ^ (2 * k - 3) * (if (p : ℤ) ∣ n ∧ (p : ℤ) ∣ r ∧ (p : ℤ) ∣ m then
        coeffTriple f (n / p) (r / p) (m / p) else 0) := sorry

/-! ## Layer 8: spinor and standard L-functions -/

/-- The **spinor Euler factor** `Q_p(X) = ∏_{I ⊆ {1..g}} (1 − α₀ α_I X)`, of degree `2^g` (8.1). -/
def spinorEulerFactor (α : Fin (g + 1) → ℂ) : Polynomial ℂ :=
  ∏ I : Finset (Fin g), (1 - C (α 0 * ∏ i ∈ I, α i.succ) * X)

/-- The **standard Euler factor** `D_p(X) = (1 − X) ∏_{i=1}^{g} (1 − α_i X)(1 − α_i⁻¹ X)`, of
degree `2g + 1` (8.1). -/
def standardEulerFactor (α : Fin (g + 1) → ℂ) : Polynomial ℂ :=
  (1 - X) * ∏ i : Fin g, (1 - C (α i.succ) * X) * (1 - C (α i.succ)⁻¹ * X)

/-! ## Layer 9: the Maass lift, the Maass space and the Saito–Kurokawa theorem -/

/-- The Fourier coefficient of the Maass lift at `(n, r, m) ≠ 0` of the Jacobi form with
discriminant coefficients `c`: `∑_{d ∣ (n, r, m)} d^{k−1} c((4nm − r²)/d²)` (9.3). No Jacobi
carrier is declared here (9.2): an index-one Jacobi form `φ ∈ J_{k,1}` enters through its
discriminant-indexed coefficients `c(N)`, `N = 4n − r²`, with `c N = 0` for `N < 0`. -/
def maassCoeff (k : ℕ) (c : ℤ → ℂ) (n r m : ℤ) : ℂ :=
  ∑ d ∈ (Int.gcd (Int.gcd n r) m).divisors, (d : ℂ) ^ (k - 1) * c ((4 * n * m - r ^ 2) / d ^ 2)

/-- The **Maass lift** `V(φ)(τ) = ∑_{n, m ≥ 0, r} a(n,r,m) e(nτ' + rz + mτ'')` of the Jacobi form
with discriminant coefficients `c`, with the constant term `c(0) · (−B_k/(2k))` (9.3). The index
set is `ℕ × ℤ × ℕ`: the terms with `n < 0` or `m < 0` are absent (Koecher, 2.4), and the terms
with `4nm − r² < 0` vanish because `c` vanishes on negative arguments. -/
def maassLift (k : ℕ) (c : ℤ → ℂ) (τ : ℍ[2]) : ℂ :=
  ∑' T : ℕ × ℤ × ℕ,
    (if T = 0 then c 0 * (-(bernoulli k : ℂ) / (2 * k)) else maassCoeff k c T.1 T.2.1 T.2.2) *
      cexp (2 * π * I * (T.1 * τ.toMatrix 0 0 + T.2.1 * τ.toMatrix 0 1 + T.2.2 * τ.toMatrix 1 1))

/-- The **Maass relation** defining the Maass space `M_k^*(Γ₂)` (9.4):
`a(n, r, m) = ∑_{d ∣ (n, r, m)} d^{k−1} a(1, r/d, mn/d²)` for `(n, r, m) ≠ 0`. -/
def IsMaassForm {k : ℤ} (f : SiegelModularForm (Gamma 2) (detWeight 2 k)) : Prop :=
  ∀ n r m : ℤ, (n, r, m) ≠ 0 →
    coeffTriple f n r m = ∑ d ∈ (Int.gcd (Int.gcd n r) m).divisors,
      (d : ℂ) ^ (k - 1) * coeffTriple f 1 (r / d) (m * n / d ^ 2)

/-- The zero form satisfies the Maass relation; a proof obligation of `maassSubmodule`. -/
theorem isMaassForm_zero (k : ℤ) : IsMaassForm (0 : SiegelModularForm (Gamma 2) (detWeight 2 k)) :=
  sorry

/-- The Maass relation is linear in the coefficients, so the Maass forms are closed under
addition (9.4); a proof obligation of `maassSubmodule`. -/
theorem IsMaassForm.add {k : ℤ} {f h : SiegelModularForm (Gamma 2) (detWeight 2 k)}
    (hf : IsMaassForm f) (hh : IsMaassForm h) : IsMaassForm (f + h) := sorry

/-- The Maass forms are closed under scalars (9.4); a proof obligation of `maassSubmodule`. -/
theorem IsMaassForm.smul {k : ℤ} (c : ℂ) {f : SiegelModularForm (Gamma 2) (detWeight 2 k)}
    (hf : IsMaassForm f) : IsMaassForm (c • f) := sorry

/-- The **Maass space** `M_k^*(Γ₂) ⊆ M_k(Γ₂)` as a subspace (9.4). -/
def maassSubmodule (k : ℤ) : Submodule ℂ (SiegelModularForm (Gamma 2) (detWeight 2 k)) where
  carrier := {f | IsMaassForm f}
  add_mem' := IsMaassForm.add
  zero_mem' := isMaassForm_zero k
  smul_mem' := IsMaassForm.smul

/-- `dim M_k^*(Γ₂) = dim M_{2k−2}(SL₂(ℤ))` for even `k ≥ 4` (9.4): the Maass space is the image
of `J_{k,1}` under the Maass lift, and `dim J_{k,1} = dim M_{2k−2}(SL₂(ℤ))`. -/
theorem finrank_maassSubmodule (k : ℕ) (hk : Even k) (hk4 : 4 ≤ k) :
    Module.finrank ℂ (maassSubmodule k) =
      Module.finrank ℂ (ModularForm (CongruenceSubgroup.Gamma 1) (2 * (k : ℤ) - 2)) := sorry

/-- `dim S_k^*(Γ₂) = dim S_{2k−2}(SL₂(ℤ))` for even `k ≥ 4` (9.4). -/
theorem finrank_maassSubmodule_inf_cusp (k : ℕ) (hk : Even k) (hk4 : 4 ≤ k) :
    Module.finrank ℂ ↥(maassSubmodule k ⊓ cuspSubmodule (Gamma 2) (detWeight 2 k)) =
      Module.finrank ℂ (CuspForm (CongruenceSubgroup.Gamma 1) (2 * (k : ℤ) - 2)) := sorry

/-- The **Saito–Kurokawa theorem** (9.5; van der Geer, Theorem 21.1) in eigenvalue form: for even
`k ≥ 4`, every normalized eigenform `f ∈ S_{2k−2}(SL₂(ℤ))` lifts to a Hecke eigenform
`F = SK(f)` in the Maass space of cusp forms `S_k^*(Γ₂)` with
`λ_F(T(p)) = a_p(f) + p^{k−1} + p^{k−2}` for every prime `p`, that is,
`L(s, F, spin) = ζ(s − k + 1) ζ(s − k + 2) L(s, f)`; for `χ₁₀ = SK(f₁₈)`,
`λ(2) = −528 + 512 + 256 = 240`. -/
theorem saito_kurokawa (k : ℕ) (hk : Even k) (hk4 : 4 ≤ k)
    (f : HeckeRing.GL2.Newform 1 (2 * (k : ℤ) - 2)) :
    ∃ F : SiegelModularForm (Gamma 2) (detWeight 2 k), IsCuspForm F ∧ IsMaassForm F ∧
      ∃ hF : IsHeckeEigenform _ (scalarExponent 2 k) F, ∀ p : ℕ, p.Prime →
        eigenvalue hF p =
          (qExpansion 1 f.toCuspForm).coeff p + (p : ℂ) ^ (k - 1) + (p : ℂ) ^ (k - 2) := sorry

/-! ## Layer 10: paramodular forms -/

/-- `dim S_2(K(277)) = 11` (10.5; Poor–Yuen 2015, Theorem 1.3). -/
theorem finrank_cusp_277 :
    Module.finrank ℂ (cuspSubmodule (paramodularR 277) (rho 2 0)) = 11 := sorry

/-! ## Layer 11: the LMFDB invariants -/

/-- The eigenvalues of a level-one eigenform are algebraic integers (11.2): the Hecke operators
preserve the lattice of forms with integral coefficients. -/
theorem eigenvalue_isIntegral (k : ℤ) {f : SiegelModularForm (Gamma 2) (detWeight 2 k)}
    (hf : IsHeckeEigenform _ (scalarExponent 2 k) f) (m : ℕ) : _root_.IsIntegral ℤ (eigenvalue hf m) :=
  sorry

/-- The **coefficient field** `ℚ(λ_F(T(m)) : m)` of an eigenform (11.2). -/
def coefficientField (k : ℤ) {f : SiegelModularForm (Gamma 2) (detWeight 2 k)}
    (hf : IsHeckeEigenform _ (scalarExponent 2 k) f) : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ (Set.range fun m : ℕ => eigenvalue hf m)

/-- The coefficient field is a number field (11.2). -/
theorem finiteDimensional_coefficientField (k : ℤ) {f : SiegelModularForm (Gamma 2) (detWeight 2 k)}
    (hf : IsHeckeEigenform _ (scalarExponent 2 k) f) : FiniteDimensional ℚ (coefficientField k hf) := sorry

end TauCetiRoadmap.SiegelModularForms
