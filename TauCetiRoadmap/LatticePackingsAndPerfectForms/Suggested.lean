import Mathlib
import TauCeti.LinearAlgebra.Matrix.PosDef.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Gram
import TauCeti.LinearAlgebra.IntegralLattice.Signature
import TauCeti.LinearAlgebra.IntegralLattice.Even
import TauCeti.LinearAlgebra.IntegralLattice.Unimodular
import TauCeti.LinearAlgebra.IntegralLattice.Isometry.Group
import TauCeti.LinearAlgebra.IntegralLattice.PosDef.Minimum
import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Bilinear
import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Quadratic
import TauCeti.LinearAlgebra.IntegralLattice.RankOne
import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.TypeA.Basic
import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.TypeE

/-!
# Lattice packings and perfect forms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: every
definition below has its real body, and only theorem proofs are `sorry`. The other targets (among
them the tensor product of lattices of 7.1 and everything stated about it in 7.1–7.3) are
specified in `README.md` only, with their definitions in prose and their **Checks**. Discharging
every declaration here would finish neither a layer nor the roadmap.

Two carriers, as in `README.md`, *Two carriers*. A **form** is `PosDefForm n`, the subtype of
`Matrix (Fin n) (Fin n) ℝ` cut out by Mathlib's `Matrix.PosDef`, acting on `ℤⁿ` by `x ↦ xᵀAx`
(`PosDefForm.eval`); `GL_n(ℤ)` acts by `A ↦ UᵀAU` (`actGL`) and similarity adds a positive scalar.
A **lattice** is Tau Ceti's `TauCeti.IntegralLattice V` with `IsPosDef`, consumed from
`TauCeti.LinearAlgebra.IntegralLattice.*`; its invariants are those of the Gram matrix of a basis
(`gramForm`), and `TauCeti.IntegralLattice.minimum`/`kissingNumber` are **the** LMFDB `minimum`
and `kissing` columns, identified with the form-side definitions by `minimum_eq_min` and never
redefined. Metric statements live in `FormSpace A`, the type `Fin n → ℝ` with inner product
`xᵀAy`, in which `stdLattice A` (the image of `ℤⁿ`) is an `IsZLattice`.

Conventions visible in the signatures (`README.md`, *Pinned conventions*): norms are never halved
(`min A₂ = 2`); the kissing number counts `x` and `−x` separately; the packing radius is
`√(min A)/2`, the center density `ρⁿ/√det`, the density `Vₙ · δ` with
`Vₙ = √πⁿ/Γ(n/2+1)` as Mathlib's `InnerProductSpace.volume_ball` writes it; the Hermite invariant
is `min/det^{1/n}` and `hermiteConstant n` is a supremum of *that*, not of its `n`-th power;
eutaxy is `A⁻¹ = ∑ c_x x xᵀ` over a `Finset` equal to the minimal vectors (no `∑ᶠ` over a set
whose finiteness is a theorem); designs are defined by the normalized `toSphere` measure and
polynomials of bounded degree, with the moment criterion a theorem.

Every theorem proof below is `sorry` except the bridge checks `eval_pos`, `pairing_comm`,
`stdLattice_eq_span`, `volume_ball_eq_unitBallVolume` and `smul_actGL_similar`, which apply
Mathlib's `Matrix.posDef_iff_dotProduct_mulVec`, the symmetry of `Matrix.PosDef`,
`Pi.basisFun_apply`, `EuclideanSpace.volume_ball` and the definition of similarity as the README
promises. The proof obligations inside definitions (positivity of `UᵀAU`, `c • A` and Gram
matrices, the inner-product axioms, the `ZSpan` instances, the subgroup and hom laws of 7.4) are
discharged.
-/

open Matrix Module MeasureTheory
open scoped InnerProductSpace

namespace TauCetiRoadmap.LatticePackingsAndPerfectForms

/-! ## Layer 0: forms, lattices, and the dictionary -/

/-- **0.1.** The carrier of positive definite real forms on `ℤⁿ`: Mathlib's `Matrix.PosDef`, which
includes symmetry (`README.md`, Layer 0, 0.1). -/
abbrev PosDefForm (n : ℕ) : Type := {A : Matrix (Fin n) (Fin n) ℝ // A.PosDef}

namespace PosDefForm

variable {n : ℕ}

/-- **0.1.** The value `xᵀAx` of the form at a real vector. -/
def eval (A : PosDefForm n) (x : Fin n → ℝ) : ℝ := x ⬝ᵥ (A.1 *ᵥ x)

/-- **0.1.** The pairing `xᵀAy`. -/
def pairing (A : PosDefForm n) (x y : Fin n → ℝ) : ℝ := x ⬝ᵥ (A.1 *ᵥ y)

/-- The integer vector `x : Fin n → ℤ` read in `ℝⁿ`. -/
def intCast (x : Fin n → ℤ) : Fin n → ℝ := fun i => (x i : ℝ)

/-- **0.1, bridge check.** Positivity of the form on nonzero vectors is Mathlib's
`Matrix.posDef_iff_dotProduct_mulVec`; this is the one place `Matrix.PosDef` is unfolded. -/
theorem eval_pos (A : PosDefForm n) {x : Fin n → ℝ} (hx : x ≠ 0) : 0 < A.eval x := by
  have h := (Matrix.posDef_iff_dotProduct_mulVec.mp A.2).2 hx
  simpa [eval] using h

/-- **0.1.** The right action `A ↦ UᵀAU` of `GL_n(ℤ)` on forms. -/
noncomputable def actGL (U : GL (Fin n) ℤ) (A : PosDefForm n) : PosDefForm n :=
  ⟨((U : Matrix (Fin n) (Fin n) ℤ).map (Int.cast : ℤ → ℝ))ᵀ * A.1 *
      (U : Matrix (Fin n) (Fin n) ℤ).map (Int.cast : ℤ → ℝ), by
    have hU : IsUnit ((U : Matrix (Fin n) (Fin n) ℤ).map (Int.cast : ℤ → ℝ)) :=
      U.isUnit.map (Int.castRingHom ℝ).mapMatrix
    simpa [conjTranspose_eq_transpose_of_trivial] using
      A.2.conjTranspose_mul_mul_same (mulVec_injective_iff_isUnit.mpr hU)⟩

/-- **0.1.** `(U • A)[x] = A[Ux]`. -/
theorem eval_actGL (U : GL (Fin n) ℤ) (A : PosDefForm n) (x : Fin n → ℝ) :
    (actGL U A).eval x = A.eval (((U : Matrix (Fin n) (Fin n) ℤ).map (Int.cast : ℤ → ℝ)) *ᵥ x) :=
  sorry

/-- **0.1.** The determinant is `GL_n(ℤ)`-invariant, since `det U = ±1`. -/
theorem det_actGL (U : GL (Fin n) ℤ) (A : PosDefForm n) : (actGL U A).1.det = A.1.det := sorry

/-- **0.1.** The positive scaling `c • A` of a form, `c > 0`. -/
def smulPos (c : ℝ) (hc : 0 < c) (A : PosDefForm n) : PosDefForm n := ⟨c • A.1, A.2.smul hc⟩

/-- **0.1.** Similarity: `B = c · UᵀAU` for some `c > 0` and `U ∈ GL_n(ℤ)`. Every geometric
invariant of this roadmap is a similarity invariant. -/
def Similar (A B : PosDefForm n) : Prop :=
  ∃ (c : ℝ) (hc : 0 < c) (U : GL (Fin n) ℤ), B = smulPos c hc (actGL U A)

/-- **0.1, bridge check.** A scaled `GL_n(ℤ)`-transform is similar to the original form. -/
theorem smul_actGL_similar (A : PosDefForm n) (c : ℝ) (hc : 0 < c) (U : GL (Fin n) ℤ) :
    Similar A (smulPos c hc (actGL U A)) :=
  ⟨c, hc, U, rfl⟩

theorem similar_equivalence : Equivalence (Similar (n := n)) := sorry

/-- **0.1.** An integral form is a form with integer entries; `primitive` adds that the entries
have no common factor. -/
def IsIntegralForm (A : PosDefForm n) : Prop := ∀ i j, ∃ m : ℤ, A.1 i j = m

/-! ### 0.3 `FormSpace A` and the lattice `ℤⁿ` -/

/-- **0.3.** The real vector space `Fin n → ℝ` with the inner product `⟪x, y⟫ = xᵀAy`. The type
synonym carries only the instances declared below. -/
def FormSpace (_A : PosDefForm n) : Type := Fin n → ℝ

/-- The coordinates of a point of `FormSpace A`. -/
def toCoords (A : PosDefForm n) (x : FormSpace A) : Fin n → ℝ := x

instance (A : PosDefForm n) : AddCommGroup (FormSpace A) := inferInstanceAs (AddCommGroup (Fin n → ℝ))

instance (A : PosDefForm n) : Module ℝ (FormSpace A) := inferInstanceAs (Module ℝ (Fin n → ℝ))

instance (A : PosDefForm n) : FiniteDimensional ℝ (FormSpace A) :=
  inferInstanceAs (FiniteDimensional ℝ (Fin n → ℝ))

/-- **0.1, bridge check.** The pairing is symmetric, because `Matrix.PosDef` includes symmetry. -/
theorem pairing_comm (A : PosDefForm n) (x y : Fin n → ℝ) : A.pairing x y = A.pairing y x := by
  have h : A.1ᵀ = A.1 := by simpa [conjTranspose_eq_transpose_of_trivial] using A.2.1.eq
  rw [pairing, pairing, dotProduct_comm, dotProduct_mulVec, ← mulVec_transpose, h]

/-- **0.3.** The inner-product core of `FormSpace A`: the inner product is `xᵀAy`, and the
axioms are the symmetry and positivity of `A`. -/
@[instance_reducible]
noncomputable def formCore (A : PosDefForm n) : InnerProductSpace.Core ℝ (FormSpace A) where
  inner x y := A.pairing (toCoords A x) (toCoords A y)
  conj_inner_symm x y := by simp [pairing_comm A (toCoords A x)]
  re_inner_nonneg x := by
    simpa [pairing] using A.2.posSemidef.dotProduct_mulVec_nonneg (toCoords A x)
  add_left x y z := add_dotProduct (toCoords A x) (toCoords A y) _
  smul_left x y r := by
    rw [conj_trivial]
    exact smul_dotProduct r (toCoords A x) (A.1 *ᵥ toCoords A y)
  definite x hx := by
    by_contra h
    have := A.2.dotProduct_mulVec_pos (x := toCoords A x) h
    simp_all [pairing]

noncomputable instance (A : PosDefForm n) : NormedAddCommGroup (FormSpace A) :=
  letI : InnerProductSpace.Core ℝ (FormSpace A) := formCore A
  InnerProductSpace.Core.toNormedAddCommGroup (𝕜 := ℝ)

noncomputable instance (A : PosDefForm n) : InnerProductSpace ℝ (FormSpace A) :=
  letI : InnerProductSpace.Core ℝ (FormSpace A) := formCore A
  InnerProductSpace.ofCore (inferInstance : PreInnerProductSpace.Core ℝ (FormSpace A))

noncomputable instance (A : PosDefForm n) : MeasurableSpace (FormSpace A) := borel _

instance (A : PosDefForm n) : BorelSpace (FormSpace A) := ⟨rfl⟩

/-- **0.3.** `‖x‖² = xᵀAx` in `FormSpace A`. -/
theorem norm_sq_formSpace (A : PosDefForm n) (x : FormSpace A) : ‖x‖ ^ 2 = A.eval (toCoords A x) :=
  sorry

/-- **0.3.** The standard lattice `ℤⁿ` inside `FormSpace A`. -/
def stdLattice (A : PosDefForm n) : Submodule ℤ (FormSpace A) :=
  Submodule.span ℤ (Set.range fun i : Fin n => (Pi.single i 1 : Fin n → ℝ))

/-- **0.3.** The standard basis of `FormSpace A` (orthonormal only when `A = 1`). -/
noncomputable def stdBasis (A : PosDefForm n) : Basis (Fin n) ℝ (FormSpace A) :=
  Pi.basisFun ℝ (Fin n)

/-- **0.3, bridge check.** `stdLattice A` is the `ℤ`-span of a real basis, so Mathlib's `ZSpan`
instances apply to it. -/
theorem stdLattice_eq_span (A : PosDefForm n) :
    stdLattice A = Submodule.span ℤ (Set.range (stdBasis A)) := by
  refine congrArg _ (congrArg _ (funext fun i => ?_))
  exact (Pi.basisFun_apply ℝ (Fin n) i).symm

instance (A : PosDefForm n) : DiscreteTopology (stdLattice A) := by
  rw [stdLattice_eq_span]; infer_instance

instance (A : PosDefForm n) : IsZLattice ℝ (stdLattice A) :=
  ⟨by rw [stdLattice_eq_span]; exact ZSpan.span_top (stdBasis A)⟩

/-- **0.3.** `covolume (ℤⁿ ⊂ FormSpace A) = √(det A)`: the volume is that of the inner product
`⟪·,·⟫_A` (`MeasureSpace` of a finite-dimensional inner product space). -/
theorem covolume_stdLattice (A : PosDefForm n) :
    ZLattice.covolume (stdLattice A) volume = Real.sqrt A.1.det := sorry

/-! ## Layer 1: minimum, minimal vectors, kissing number, and density -/

/-- **1.1.** The minimum `min A = inf {xᵀAx | x ∈ ℤⁿ, x ≠ 0}`, a norm (squared length);
`sInf ∅ = 0` in rank zero. -/
noncomputable def min (A : PosDefForm n) : ℝ :=
  sInf {r : ℝ | ∃ x : Fin n → ℤ, x ≠ 0 ∧ A.eval (intCast x) = r}

/-- **1.1.** The minimal vectors `S(A)`. -/
def minimalVectors (A : PosDefForm n) : Set (Fin n → ℤ) :=
  {x | x ≠ 0 ∧ A.eval (intCast x) = A.min}

/-- **1.1.** Sets of bounded norm in `ℤⁿ` are finite (`ZSpan.setFinite_inter` through 0.3). -/
theorem finite_setOf_eval_le (A : PosDefForm n) (C : ℝ) :
    {x : Fin n → ℤ | A.eval (intCast x) ≤ C}.Finite := sorry

theorem finite_minimalVectors (A : PosDefForm n) : A.minimalVectors.Finite := sorry

/-- **1.1.** In positive rank the minimum is positive and attained. -/
theorem min_pos (A : PosDefForm n) (hn : 0 < n) : 0 < A.min := sorry

theorem minimalVectors_nonempty (A : PosDefForm n) (hn : 0 < n) : A.minimalVectors.Nonempty :=
  sorry

theorem min_le_eval (A : PosDefForm n) {x : Fin n → ℤ} (hx : x ≠ 0) : A.min ≤ A.eval (intCast x) :=
  sorry

theorem neg_mem_minimalVectors (A : PosDefForm n) {x : Fin n → ℤ} (hx : x ∈ A.minimalVectors) :
    -x ∈ A.minimalVectors := sorry

/-- **1.1.** The kissing number `#S(A)`, counting `x` and `−x` separately. -/
noncomputable def kissingNumber (A : PosDefForm n) : ℕ := A.minimalVectors.ncard

theorem min_actGL (U : GL (Fin n) ℤ) (A : PosDefForm n) : (actGL U A).min = A.min := sorry

theorem min_smulPos (c : ℝ) (hc : 0 < c) (A : PosDefForm n) : (smulPos c hc A).min = c * A.min :=
  sorry

theorem kissingNumber_of_similar {A B : PosDefForm n} (h : Similar A B) :
    A.kissingNumber = B.kissingNumber := sorry

/-- **1.1.** Well-rounded: the minimal vectors span `ℝⁿ`. -/
def IsWellRounded (A : PosDefForm n) : Prop :=
  Submodule.span ℝ (intCast '' A.minimalVectors) = ⊤

/-- **1.1.** Generated by minimal vectors: `span_ℤ S(A) = ℤⁿ`. -/
def IsGeneratedByMinimalVectors (A : PosDefForm n) : Prop :=
  Submodule.span ℤ A.minimalVectors = ⊤

/-- **1.1.** Strongly well-rounded: `S(A)` contains a `ℤ`-basis of `ℤⁿ`. -/
def IsStronglyWellRounded (A : PosDefForm n) : Prop :=
  ∃ b : Basis (Fin n) ℤ (Fin n → ℤ), ∀ i, b i ∈ A.minimalVectors

theorem IsStronglyWellRounded.isGeneratedByMinimalVectors {A : PosDefForm n}
    (h : A.IsStronglyWellRounded) : A.IsGeneratedByMinimalVectors := sorry

theorem IsGeneratedByMinimalVectors.isWellRounded {A : PosDefForm n}
    (h : A.IsGeneratedByMinimalVectors) : A.IsWellRounded := sorry

/-- **1.3.** A normalized integer vector: its first nonzero coordinate is positive. -/
def IsNormalized (x : Fin n → ℤ) : Prop :=
  ∃ i, 0 < x i ∧ ∀ j < i, x j = 0

/-- **1.3.** The normalized half `S⁺(A)` of the minimal vectors: the LMFDB `shortest` column for
the stored Gram matrix. -/
def normalizedMinimalVectors (A : PosDefForm n) : Set (Fin n → ℤ) :=
  {x ∈ A.minimalVectors | IsNormalized x}

theorem two_mul_ncard_normalizedMinimalVectors (A : PosDefForm n) :
    2 * A.normalizedMinimalVectors.ncard = A.kissingNumber := sorry

/-- **1.4.** The packing radius `√(min A)/2`. -/
noncomputable def packingRadius (A : PosDefForm n) : ℝ := Real.sqrt A.min / 2

/-- **1.4.** `Vₙ = √πⁿ / Γ(n/2 + 1)`, the volume of the unit ball in dimension `n`, in the form
Mathlib's `EuclideanSpace.volume_ball` produces. -/
noncomputable def unitBallVolume (n : ℕ) : ℝ := Real.sqrt Real.pi ^ n / Real.Gamma (n / 2 + 1)

/-- **1.4, bridge check.** `unitBallVolume` is Mathlib's volume of the unit ball of
`EuclideanSpace ℝ (Fin n)` (`EuclideanSpace.volume_ball`, which needs `n ≠ 0`). -/
theorem volume_ball_eq_unitBallVolume [Nonempty (Fin n)] :
    volume (Metric.ball (0 : EuclideanSpace ℝ (Fin n)) 1) =
      ENNReal.ofReal 1 ^ Fintype.card (Fin n) * ENNReal.ofReal (unitBallVolume (Fintype.card (Fin n))) :=
  EuclideanSpace.volume_ball (Fin n) 0 1

/-- **1.4.** The center density `δ(A) = ρⁿ / √(det A)`. -/
noncomputable def centerDensity (A : PosDefForm n) : ℝ := A.packingRadius ^ n / Real.sqrt A.1.det

/-- **1.4.** The density `Δ(A) = Vₙ δ(A)`: the LMFDB `density` column. -/
noncomputable def density (A : PosDefForm n) : ℝ := unitBallVolume n * A.centerDensity

theorem density_of_similar {A B : PosDefForm n} (h : Similar A B) : A.density = B.density := sorry

/-- **1.4.** The packing balls are disjoint, so the density is at most one. -/
theorem density_le_one (A : PosDefForm n) : A.density ≤ 1 := sorry

theorem density_pos (A : PosDefForm n) (hn : 0 < n) : 0 < A.density := sorry

/-- **1.5.** The Hermite invariant `γ(A) = min A / (det A)^{1/n}`: the LMFDB `hermite` column. -/
noncomputable def hermite (A : PosDefForm n) : ℝ := A.min / A.1.det ^ ((1 : ℝ) / n)

theorem hermite_of_similar {A B : PosDefForm n} (h : Similar A B) : A.hermite = B.hermite := sorry

/-- **1.5.** `δ(A) = (γ(A)/4)^{n/2}`. -/
theorem centerDensity_eq_hermite (A : PosDefForm n) :
    A.centerDensity = (A.hermite / 4) ^ ((n : ℝ) / 2) := sorry

/-- **1.7.** Minkowski's bound for real forms: `min A ≤ (4/π) Γ(n/2+1)^{2/n} (det A)^{1/n}`,
from Mathlib's convex body theorem applied to the ball of radius `√(min A)` in `FormSpace A`. -/
theorem hermite_le_minkowski (A : PosDefForm n) (hn : 0 < n) :
    A.hermite ≤ 4 / Real.pi * Real.Gamma (n / 2 + 1) ^ ((2 : ℝ) / n) := sorry

/-- **1.8.** Hermite's inequality for real forms: `γ(A) ≤ (4/3)^{(n−1)/2}`. -/
theorem hermite_le_pow (A : PosDefForm n) (hn : 0 < n) :
    A.hermite ≤ (4 / 3 : ℝ) ^ (((n : ℝ) - 1) / 2) := sorry

/-! ## Layer 2: the Hermite constant -/

/-- **2.1.** The Hermite constant `γₙ = sup_A γ(A)` (not its `n`-th power); `1` in rank zero. -/
noncomputable def hermiteConstant (n : ℕ) : ℝ :=
  if n = 0 then 1 else sSup (Set.range (hermite : PosDefForm n → ℝ))

theorem hermite_le_hermiteConstant (A : PosDefForm n) : A.hermite ≤ hermiteConstant n := sorry

theorem one_le_hermiteConstant (n : ℕ) : 1 ≤ hermiteConstant n := sorry

theorem hermiteConstant_le_pow (n : ℕ) (hn : 0 < n) :
    hermiteConstant n ≤ (4 / 3 : ℝ) ^ (((n : ℝ) - 1) / 2) := sorry

/-- **2.1.** Mordell's inequality `γₙ^{n−2} ≤ γ_{n−1}^{n−1}`. -/
theorem hermiteConstant_pow_le (n : ℕ) (hn : 2 ≤ n) :
    hermiteConstant n ^ (n - 2) ≤ hermiteConstant (n - 1) ^ (n - 1) := sorry

/-- **2.2.** The constant is attained: there is a critical form (Mahler compactness, GoN 4.5.2). -/
theorem exists_hermite_eq_hermiteConstant (n : ℕ) (hn : 0 < n) :
    ∃ A : PosDefForm n, A.hermite = hermiteConstant n := sorry

/-- **2.3.** `γ₁ = 1`. -/
theorem hermiteConstant_one : hermiteConstant 1 = 1 := sorry

/-- **2.3.** `γ₂² = 4/3`, attained by `A₂`. -/
theorem hermiteConstant_two_sq : hermiteConstant 2 ^ 2 = 4 / 3 := sorry

/-- **2.3.** `γ₃³ = 2`, attained by `A₃` (Gauss). -/
theorem hermiteConstant_three_pow : hermiteConstant 3 ^ 3 = 2 := sorry

/-- **4.10.** `γ₄⁴ = 4`, `γ₅⁵ = 8`, `γ₆⁶ = 64/3`, `γ₇⁷ = 64`, `γ₈⁸ = 256`, by the perfect-form
certificates (Korkine–Zolotarev; Blichfeldt). -/
theorem hermiteConstant_four_pow : hermiteConstant 4 ^ 4 = 4 := sorry

theorem hermiteConstant_eight_pow : hermiteConstant 8 ^ 8 = 256 := sorry

/-- **4.11.** `γ₂₄ = 4`, attained by the Leech lattice (Cohn–Kumar 2009). -/
theorem hermiteConstant_twentyFour : hermiteConstant 24 = 4 := sorry

/-! ## Layer 3: Voronoi cells and covering -/

/-- **3.1.** The Voronoi cell of the origin, `{x | ∀ v ∈ ℤⁿ, xᵀAx ≤ (x−v)ᵀA(x−v)}`. -/
def voronoiCell (A : PosDefForm n) : Set (FormSpace A) :=
  {x | ∀ v : Fin n → ℤ, A.eval (toCoords A x) ≤ A.eval (toCoords A x - intCast v)}

theorem isCompact_voronoiCell (A : PosDefForm n) : IsCompact A.voronoiCell := sorry

theorem convex_voronoiCell (A : PosDefForm n) : Convex ℝ A.voronoiCell := sorry

/-- **3.1.** The Voronoi cell is a fundamental domain for `ℤⁿ` in `FormSpace A`. -/
theorem isAddFundamentalDomain_voronoiCell (A : PosDefForm n) :
    IsAddFundamentalDomain (stdLattice A) A.voronoiCell volume := sorry

/-- **3.2.** The covering radius (inhomogeneous minimum) `μ(A) = sup_x dist(x, ℤⁿ)` in
`FormSpace A`: a length, not a norm. -/
noncomputable def coveringRadius (A : PosDefForm n) : ℝ :=
  sSup (Set.range fun x : FormSpace A => Metric.infDist x (stdLattice A))

/-- **3.2.** A deep hole is a point at maximal distance from the lattice. -/
def IsDeepHole (A : PosDefForm n) (x : FormSpace A) : Prop :=
  Metric.infDist x (stdLattice A) = A.coveringRadius

theorem exists_isDeepHole (A : PosDefForm n) : ∃ x, A.IsDeepHole x := sorry

/-- **3.2.** A deep hole is, up to a lattice translation, a vertex (extreme point) of the Voronoi
cell; the covering radius is the largest `√(A[x])` over those vertices. -/
theorem IsDeepHole.exists_sub_mem_extremePoints (A : PosDefForm n) {x : FormSpace A}
    (hx : A.IsDeepHole x) : ∃ v ∈ stdLattice A, x - v ∈ Set.extremePoints ℝ A.voronoiCell := sorry

theorem packingRadius_le_coveringRadius (A : PosDefForm n) : A.packingRadius ≤ A.coveringRadius :=
  sorry

/-- **3.2.** The covering density `Θ(A) = Vₙ μ(A)ⁿ / √(det A) ≥ 1`. -/
noncomputable def coveringDensity (A : PosDefForm n) : ℝ :=
  unitBallVolume n * A.coveringRadius ^ n / Real.sqrt A.1.det

theorem one_le_coveringDensity (A : PosDefForm n) (hn : 0 < n) : 1 ≤ A.coveringDensity := sorry

/-! ## Layer 4: perfect, eutactic and extreme forms -/

/-- The rank-one matrix `x xᵀ` of an integer vector, over `ℝ`. -/
def rankOneMatrix (x : Fin n → ℤ) : Matrix (Fin n) (Fin n) ℝ := vecMulVec (intCast x) (intCast x)

/-- **4.1.** Perfection: the `x xᵀ`, `x ∈ S(A)`, span the `n(n+1)/2`-dimensional space of
symmetric matrices. -/
def IsPerfect (A : PosDefForm n) : Prop :=
  finrank ℝ (Submodule.span ℝ (rankOneMatrix '' A.minimalVectors)) = n * (n + 1) / 2

/-- **4.1.** A perfect form is determined by its minimal vectors. -/
theorem IsPerfect.eq_of_minimalVectors_subset {A B : PosDefForm n} (hA : A.IsPerfect)
    (hmin : A.min = B.min) (hS : A.minimalVectors ⊆ B.minimalVectors) : A = B := sorry

theorem IsPerfect.isWellRounded {A : PosDefForm n} (hA : A.IsPerfect) : A.IsWellRounded := sorry

/-- **4.1.** Korkine–Zolotarev: a perfect form has at least `n(n+1)` minimal vectors. -/
theorem IsPerfect.le_kissingNumber {A : PosDefForm n} (hA : A.IsPerfect) :
    n * (n + 1) ≤ A.kissingNumber := sorry

/-- **4.1.** Rationality: a perfect form is similar to an integral form. -/
theorem IsPerfect.exists_similar_isIntegralForm {A : PosDefForm n} (hA : A.IsPerfect) :
    ∃ B : PosDefForm n, Similar A B ∧ B.IsIntegralForm := sorry

/-- **4.2.** Eutaxy: `A⁻¹ = ∑_{x ∈ S(A)} c_x x xᵀ` with all `c_x > 0`; the sum runs over a `Finset`
equal to the (finite) set of minimal vectors. -/
def IsEutactic (A : PosDefForm n) : Prop :=
  ∃ (s : Finset (Fin n → ℤ)) (c : (Fin n → ℤ) → ℝ), (s : Set (Fin n → ℤ)) = A.minimalVectors ∧
    (∀ x ∈ s, 0 < c x) ∧ A.1⁻¹ = ∑ x ∈ s, c x • rankOneMatrix x

/-- **4.2.** Strong eutaxy: all coefficients equal. -/
def IsStronglyEutactic (A : PosDefForm n) : Prop :=
  ∃ (s : Finset (Fin n → ℤ)) (c : ℝ), (s : Set (Fin n → ℤ)) = A.minimalVectors ∧ 0 < c ∧
    A.1⁻¹ = c • ∑ x ∈ s, rankOneMatrix x

theorem IsStronglyEutactic.isEutactic {A : PosDefForm n} (h : A.IsStronglyEutactic) :
    A.IsEutactic := sorry

theorem IsEutactic.isWellRounded {A : PosDefForm n} (h : A.IsEutactic) : A.IsWellRounded := sorry

/-- **4.2.** The trace identity: for strongly eutactic `A`, `c = n / (kiss A · min A)`. -/
theorem IsStronglyEutactic.coeff_eq {A : PosDefForm n} (hn : 0 < n) (h : A.IsStronglyEutactic)
    (s : Finset (Fin n → ℤ)) (c : ℝ) (hs : (s : Set (Fin n → ℤ)) = A.minimalVectors)
    (hc : A.1⁻¹ = c • ∑ x ∈ s, rankOneMatrix x) :
    c = n / (A.kissingNumber * A.min) := sorry

/-- **4.3.** Extreme: a local maximum of the Hermite invariant in the subspace topology of
`PosDefForm n ⊆ Matrix (Fin n) (Fin n) ℝ`. -/
def IsExtreme (A : PosDefForm n) : Prop := IsLocalMax hermite A

/-- **4.3.** A critical form is extreme. -/
theorem isExtreme_of_hermite_eq {A : PosDefForm n} (h : A.hermite = hermiteConstant n) :
    A.IsExtreme := sorry

/-- **4.5. Voronoi's theorem**: extreme iff perfect and eutactic. -/
theorem isExtreme_iff (A : PosDefForm n) : A.IsExtreme ↔ A.IsPerfect ∧ A.IsEutactic := sorry

/-- **4.6.** Finiteness of perfect forms up to similarity. -/
theorem finite_perfect_quotient (n : ℕ) :
    Set.Finite (Set.range fun A : {A : PosDefForm n // A.IsPerfect} =>
      Quot.mk (Similar (n := n)) A.1) := sorry

/-- **4.7.** Finiteness of eutactic forms up to similarity (Ash). -/
theorem finite_eutactic_quotient (n : ℕ) :
    Set.Finite (Set.range fun A : {A : PosDefForm n // A.IsEutactic} =>
      Quot.mk (Similar (n := n)) A.1) := sorry

/-- **4.9.** A facet normal of a perfect form `P`: a symmetric `N`, nonnegative on `S(P)`, whose
zero set in `S(P)` has `x xᵀ` spanning a hyperplane of `Sym_n`. These are the facets of the Voronoi
domain `cone{x xᵀ | x ∈ S(P)}`, finitely many up to positive scaling of `N`. -/
def IsFacetNormal (P : PosDefForm n) (N : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  Nᵀ = N ∧ (∀ x ∈ P.minimalVectors, 0 ≤ intCast x ⬝ᵥ (N *ᵥ intCast x)) ∧
    finrank ℝ (Submodule.span ℝ
        (rankOneMatrix '' {x ∈ P.minimalVectors | intCast x ⬝ᵥ (N *ᵥ intCast x) = 0})) =
      n * (n + 1) / 2 - 1

open scoped Classical in
/-- **4.9.** The neighbour of `P` across the facet with normal `N`: `P + ρ N` with
`ρ = sup {t ≥ 0 | min (P + tN) = min P}`, the first form on the ray at which new minimal vectors
appear; `min (P + tN)` is read only where `P + tN` is positive definite. For a facet normal of a
perfect form `P + ρN` is positive definite (4.9); otherwise the value is the junk `P`. -/
noncomputable def voronoiNeighbour (P : PosDefForm n) (N : Matrix (Fin n) (Fin n) ℝ) :
    PosDefForm n :=
  let ρ : ℝ := sSup {t : ℝ | 0 ≤ t ∧ ∃ h : (P.1 + t • N).PosDef, min ⟨P.1 + t • N, h⟩ = P.min}
  if h : (P.1 + ρ • N).PosDef then ⟨P.1 + ρ • N, h⟩ else P

theorem isPerfect_voronoiNeighbour {P : PosDefForm n} (hP : P.IsPerfect)
    {N : Matrix (Fin n) (Fin n) ℝ} (hN : P.IsFacetNormal N) : (P.voronoiNeighbour N).IsPerfect :=
  sorry

theorem min_voronoiNeighbour {P : PosDefForm n} (hP : P.IsPerfect)
    {N : Matrix (Fin n) (Fin n) ℝ} (hN : P.IsFacetNormal N) : (P.voronoiNeighbour N).min = P.min :=
  sorry

/-- **4.10.** A perfect-form certificate for rank `n`: pairwise non-equivalent perfect integral
forms such that the neighbour (4.9) of a listed form across each of its facets is similar to a
listed form. The data are finite: a listed form has finitely many facet normals up to scaling, and
nothing is quantified over perfect forms outside the list. -/
structure PerfectFormCertificate (n : ℕ) where
  /-- The listed forms. -/
  forms : Finset (PosDefForm n)
  perfect : ∀ A ∈ forms, A.IsPerfect
  integral : ∀ A ∈ forms, A.IsIntegralForm
  pairwise : ∀ A ∈ forms, ∀ B ∈ forms, Similar A B → A = B
  /-- The neighbour of a listed form across any of its facets is similar to a listed form. -/
  neighbours_mem : ∀ A ∈ forms, ∀ N : Matrix (Fin n) (Fin n) ℝ, A.IsFacetNormal N →
    ∃ C ∈ forms, Similar (A.voronoiNeighbour N) C

/-- **4.10.** Completeness: a certificate's list meets every similarity class of perfect forms. -/
theorem PerfectFormCertificate.complete {n : ℕ} (hn : 0 < n) (cert : PerfectFormCertificate n)
    (A : PosDefForm n) (hA : A.IsPerfect) : ∃ C ∈ cert.forms, Similar A C := sorry

/-- **4.10.** The Hermite constant is the maximum of `γ` over a certificate's list. -/
theorem PerfectFormCertificate.hermiteConstant_eq {n : ℕ} (hn : 0 < n)
    (cert : PerfectFormCertificate n) :
    hermiteConstant n = sSup (hermite '' (cert.forms : Set (PosDefForm n))) := sorry

end PosDefForm

/-! ## The dictionary with Tau Ceti's lattices (0.2, 1.2) -/

section Lattice

open TauCeti TauCeti.IntegralLattice

universe u

variable {V : Type u} [AddCommGroup V] [Module ℚ V]

/-- **0.2.** The Gram matrix of a `ℤ`-basis of a positive definite lattice, as a form. -/
noncomputable def gramForm {L : IntegralLattice V} (hL : L.IsPosDef) {n : ℕ}
    (b : Basis (Fin n) ℤ L) : PosDefForm n :=
  ⟨(L.gramMatrix b).map (Int.cast : ℤ → ℝ), by
    have hZ : (L.gramMatrix b).PosDef := by
      rw [gramMatrix_eq_toMatrix, ← LinearMap.BilinForm.posDef_toQuadraticMap_iff_matrix b _
        L.isSymm_integralForm]
      exact hL.posDef_integralNorm
    have hQ := TauCeti.Matrix.posDef_map_intCast hZ
    -- Semidefinite over `ℝ` by density of `ℚⁿ`; definite because the determinant is nonzero.
    have hcast : ∀ q : Fin n → ℚ, (fun i => (q i : ℝ)) ⬝ᵥ
        ((L.gramMatrix b).map (Int.cast : ℤ → ℝ) *ᵥ fun i => (q i : ℝ)) =
          ((q ⬝ᵥ ((L.gramMatrix b).map (Int.cast : ℤ → ℚ) *ᵥ q) : ℚ) : ℝ) := by
      intro q
      simp only [dotProduct, mulVec, Matrix.map_apply, Rat.cast_sum, Rat.cast_mul, Rat.cast_intCast]
    have hsemi : ((L.gramMatrix b).map (Int.cast : ℤ → ℝ)).PosSemidef := by
      refine posSemidef_iff_dotProduct_mulVec.mpr ⟨?_, fun x => ?_⟩
      · ext i j
        simpa using congrArg (fun m : ℤ => (m : ℝ)) ((L.isSymm_gramMatrix b).apply i j)
      · have hd : DenseRange (Pi.map fun (_ : Fin n) (r : ℚ) => (r : ℝ)) :=
          DenseRange.piMap fun _ => Rat.denseRange_cast
        have hc : Continuous fun x : Fin n → ℝ =>
            x ⬝ᵥ ((L.gramMatrix b).map (Int.cast : ℤ → ℝ) *ᵥ x) := by fun_prop
        rw [star_trivial]
        refine hd.induction_on (p := fun x => 0 ≤ x ⬝ᵥ ((L.gramMatrix b).map
          (Int.cast : ℤ → ℝ) *ᵥ x)) x (isClosed_le continuous_const hc) fun q => ?_
        have := hQ.posSemidef.dotProduct_mulVec_nonneg q
        rw [star_trivial] at this
        exact (hcast q).symm ▸ (by exact_mod_cast this)
    refine hsemi.posDef_iff_det_ne_zero.mpr ?_
    have h1 : ((L.gramMatrix b).map (Int.cast : ℤ → ℝ)).det = ((L.gramMatrix b).det : ℝ) :=
      ((Int.castRingHom ℝ).map_det _).symm
    have h2 : ((L.gramMatrix b).map (Int.cast : ℤ → ℚ)).det = ((L.gramMatrix b).det : ℚ) :=
      ((Int.castRingHom ℚ).map_det _).symm
    have h3 := hQ.det_pos
    rw [h2] at h3
    rw [h1]
    exact_mod_cast h3.ne'⟩

/-- **0.2.** Two bases give `GL_n(ℤ)`-equivalent forms. -/
theorem gramForm_eq_actGL {L : IntegralLattice V} (hL : L.IsPosDef) {n : ℕ}
    (b b' : Basis (Fin n) ℤ L) :
    ∃ U : GL (Fin n) ℤ, gramForm hL b' = PosDefForm.actGL U (gramForm hL b) := sorry

/-- **1.2.** Tau Ceti's `minimum` **is** the form-side minimum of any Gram matrix: the LMFDB
`minimum` column is `TauCeti.IntegralLattice.minimum`. -/
theorem minimum_eq_min {L : IntegralLattice V} (hL : L.IsPosDef) {n : ℕ}
    (b : Basis (Fin n) ℤ L) : (L.minimum : ℝ) = (gramForm hL b).min := sorry

/-- **1.2.** Tau Ceti's `kissingNumber` is the form-side kissing number. -/
theorem kissingNumber_eq_kissingNumber {L : IntegralLattice V} (hL : L.IsPosDef) {n : ℕ}
    (b : Basis (Fin n) ℤ L) : L.kissingNumber = (gramForm hL b).kissingNumber := sorry

/-- **1.5.** The lattice-side Hermite invariant `γ(L) = min L / (det L)^{1/n}`: the LMFDB `hermite`
column, stated on Tau Ceti's `minimum` and `determinant`. -/
noncomputable def latticeHermite (L : IntegralLattice V) : ℝ :=
  (L.minimum : ℝ) / (L.determinant : ℝ) ^ ((1 : ℝ) / Module.finrank ℤ L)

/-- **1.5.** `descend`: the lattice-side invariant is the form-side one of any Gram matrix. -/
theorem latticeHermite_eq_gramForm {L : IntegralLattice V} (hL : L.IsPosDef) {n : ℕ}
    (b : Basis (Fin n) ℤ L) : latticeHermite L = (gramForm hL b).hermite := sorry

/-- **1.4.** The lattice-side density `Vₙ (√(min L)/2)ⁿ / √(det L)`: the LMFDB `density` column. -/
noncomputable def latticeDensity (L : IntegralLattice V) : ℝ :=
  PosDefForm.unitBallVolume (Module.finrank ℤ L) *
    ((Real.sqrt L.minimum / 2) ^ Module.finrank ℤ L / Real.sqrt (L.determinant : ℝ))

theorem latticeDensity_eq_gramForm {L : IntegralLattice V} (hL : L.IsPosDef) {n : ℕ}
    (b : Basis (Fin n) ℤ L) : latticeDensity L = (gramForm hL b).density := sorry

/-- **1.4.** `Δ(E₈) = π⁴/384`, from `det = 1`, `min = 2` and `V₈ = π⁴/24` (IL 6C). -/
theorem latticeDensity_typeE₈RootLattice : latticeDensity typeE₈RootLattice = Real.pi ^ 4 / 384 :=
  sorry

/-- **1.8.** `γ(A₂) = 2/√3`, the equality case of Hermite's inequality (`det A₂ = 3`, `min = 2`). -/
theorem latticeHermite_typeARootLattice_two :
    latticeHermite (typeARootLattice 2) = 2 / Real.sqrt 3 := sorry

/-! ## Layer 5: spherical designs and Venkov's theorem -/

section Designs

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- **5.1.** Polynomial functions of degree `≤ t` on a real inner product space: the span of the
powers `⟪a, ·⟫^k`, `k ≤ t`. -/
def polynomialsOfDegreeLE (E : Type*) [NormedAddCommGroup E] [InnerProductSpace ℝ E] (t : ℕ) :
    Submodule ℝ (E → ℝ) :=
  Submodule.span ℝ {f | ∃ (a : E) (k : ℕ), k ≤ t ∧ f = fun x => ⟪a, x⟫_ℝ ^ k}

/-- **5.1.** A finite nonempty set on the sphere of radius `r` is a spherical `t`-design when
every polynomial of degree `≤ t` has the same average over the set and over the sphere, the latter
for the normalized `toSphere` measure transported to radius `r`. -/
def IsSphericalDesign (t : ℕ) (X : Finset E) (r : ℝ) : Prop :=
  X.Nonempty ∧ (∀ x ∈ X, ‖x‖ = r) ∧
    ∀ f ∈ polynomialsOfDegreeLE E t,
      (∑ x ∈ X, f x) / X.card =
        (∫ y, f (r • Subtype.val y) ∂((volume : Measure E).toSphere)) /
          ((volume : Measure E).toSphere).real Set.univ

theorem IsSphericalDesign.mono {t s : ℕ} {X : Finset E} {r : ℝ} (hst : s ≤ t)
    (h : IsSphericalDesign t X r) : IsSphericalDesign s X r := sorry

/-- **5.2.** The moment criterion for antipodal sets: a `(2k+1)`-design iff the even moments
`∑ ⟪a, x⟫^{2j}` equal `c_j #X r^{2j} ‖a‖^{2j}`, with
`c_j = (1·3⋯(2j−1)) / (n(n+2)⋯(n+2j−2))`. -/
theorem isSphericalDesign_iff_moments (k : ℕ) (X : Finset E) (r : ℝ) (hr : 0 < r)
    (hX : X.Nonempty) (hXr : ∀ x ∈ X, ‖x‖ = r) (hanti : ∀ x ∈ X, -x ∈ X) :
    IsSphericalDesign (2 * k + 1) X r ↔
      ∀ j ≤ k, ∀ a : E, ∑ x ∈ X, ⟪a, x⟫_ℝ ^ (2 * j) =
        ((∏ i ∈ Finset.range j, (2 * (i : ℝ) + 1)) /
          (∏ i ∈ Finset.range j, ((finrank ℝ E : ℝ) + 2 * i))) * X.card * r ^ (2 * j) *
          ‖a‖ ^ (2 * j) := sorry

end Designs

namespace PosDefForm

variable {n : ℕ}

open scoped Classical in
/-- The minimal vectors as a `Finset` in `FormSpace A` (finite by 1.1). -/
noncomputable def minimalVectorsFinset (A : PosDefForm n) : Finset (FormSpace A) :=
  (A.finite_minimalVectors.toFinset).image fun x => (intCast x : FormSpace A)

/-- **5.3.** A `t`-design form: `S(A)` is a `t`-design on the sphere of radius `√(min A)`. -/
def IsDesignForm (t : ℕ) (A : PosDefForm n) : Prop :=
  IsSphericalDesign t A.minimalVectorsFinset (Real.sqrt A.min)

/-- **5.3.** Strongly eutactic iff `2`-design form. -/
theorem isStronglyEutactic_iff_isDesignForm_two (A : PosDefForm n) (hn : 0 < n) :
    A.IsStronglyEutactic ↔ IsDesignForm 2 A := sorry

/-- **5.3.** Strongly perfect: a `4`-design form; it implies perfect and strongly eutactic. -/
def IsStronglyPerfect (A : PosDefForm n) : Prop :=
  IsDesignForm 4 A

theorem IsStronglyPerfect.isPerfect {A : PosDefForm n} (h : A.IsStronglyPerfect) : A.IsPerfect :=
  sorry

/-- **5.4.** The Laplacian on polynomials and harmonic polynomials. -/
noncomputable def laplacian (P : MvPolynomial (Fin n) ℝ) : MvPolynomial (Fin n) ℝ :=
  ∑ i, MvPolynomial.pderiv i (MvPolynomial.pderiv i P)

def IsHarmonic (P : MvPolynomial (Fin n) ℝ) : Prop := laplacian P = 0

/-- **5.6.** The theta series with harmonic coefficient `P`:
`Θ_{A,P}(τ) = ∑_{x ∈ ℤⁿ} P(x) e^{π i τ xᵀAx}`. -/
noncomputable def harmonicTheta (A : PosDefForm n) (P : MvPolynomial (Fin n) ℝ)
    (τ : UpperHalfPlane) : ℂ :=
  ∑' x : Fin n → ℤ, ((MvPolynomial.eval (intCast x) P : ℝ) : ℂ) *
    Complex.exp (Real.pi * Complex.I * (τ : ℂ) * (A.eval (intCast x) : ℝ))

theorem summable_harmonicTheta (A : PosDefForm n) (P : MvPolynomial (Fin n) ℝ)
    (τ : UpperHalfPlane) :
    Summable fun x : Fin n → ℤ => ((MvPolynomial.eval (intCast x) P : ℝ) : ℂ) *
      Complex.exp (Real.pi * Complex.I * (τ : ℂ) * (A.eval (intCast x) : ℝ)) := sorry

end PosDefForm

/-- **5.6. Hecke's theorem.** For an even unimodular lattice of rank `n = 2k` and a homogeneous
harmonic `P` of degree `d > 0`, `Θ_{L,P}` is a cusp form of weight `k + d` for `SL₂(ℤ)`; stated as
the existence of a Mathlib `CuspForm` with the same values. -/
theorem exists_cuspForm_harmonicTheta {L : IntegralLattice V} (hL : L.IsPosDef) (he : L.IsEven)
    (hu : L.IsUnimodular) {n : ℕ} (b : Basis (Fin n) ℤ L) {k d : ℕ} (hn : n = 2 * k) (hd : 0 < d)
    (P : MvPolynomial (Fin n) ℝ) (hP : PosDefForm.IsHarmonic P)
    (hhom : P ∈ MvPolynomial.homogeneousSubmodule (Fin n) ℝ d) :
    ∃ f : CuspForm (CongruenceSubgroup.Gamma 1) ((k : ℤ) + d),
      ∀ τ, f τ = PosDefForm.harmonicTheta (gramForm hL b) P τ := sorry

/-- **5.7. Venkov's theorem.** Every nonempty shell of an extremal even unimodular lattice of
rank `24m + 8r` is a spherical `t`-design, `t = 11, 7, 3` for `r = 0, 1, 2`. The shell of norm
`2j` is read in `FormSpace (gramForm hL b)`. -/
theorem venkov_shell_isSphericalDesign {L : IntegralLattice V} (hL : L.IsPosDef) (he : L.IsEven)
    (hu : L.IsUnimodular) {n : ℕ} (b : Basis (Fin n) ℤ L) (m r : ℕ) (hr : r ≤ 2)
    (hn : n = 24 * m + 8 * r) (hmin : L.minimum = 2 * m + 2) (j : ℕ) (hj : 0 < j)
    (shell : Finset (PosDefForm.FormSpace (gramForm hL b)))
    (hshell : (shell : Set (PosDefForm.FormSpace (gramForm hL b))) =
      (fun x : Fin n → ℤ => (PosDefForm.intCast x : PosDefForm.FormSpace (gramForm hL b))) ''
        {x | (gramForm hL b).eval (PosDefForm.intCast x) = 2 * j})
    (hne : shell.Nonempty) :
    IsSphericalDesign (11 - 4 * r) shell (Real.sqrt (2 * j)) := sorry

/-! ## Layer 6: universality -/

/-- **6.1.** `L` represents `m` when `m` is the norm of a lattice vector: Tau Ceti's
`representationNumber` is nonzero. -/
def Represents (L : IntegralLattice V) (m : ℕ) : Prop := L.representationNumber m ≠ 0

/-- **6.1.** Universal: every positive integer is a norm. -/
def IsUniversal (L : IntegralLattice V) : Prop := ∀ m : ℕ, 0 < m → Represents L m

/-- **6.1.** Half-norm universal (for even `L`): every positive integer is a half-norm. -/
def IsHalfUniversal (L : IntegralLattice V) : Prop := ∀ m : ℕ, 0 < m → Represents L (2 * m)

/-- **6.1.** No lattice of rank at most three is universal. -/
theorem not_isUniversal_of_finrank_le_three (L : IntegralLattice V) (hL : L.IsPosDef)
    (h : Module.finrank ℤ L ≤ 3) : ¬ IsUniversal L := sorry

/-- **6.2.** The truant: the least positive integer not represented (`0` for universal `L`). -/
noncomputable def truant (L : IntegralLattice V) : ℕ := sInf {m : ℕ | 0 < m ∧ ¬ Represents L m}

/-- **6.3. The 15 theorem** (Conway–Schneeberger; Bhargava). -/
theorem isUniversal_iff_fifteen (L : IntegralLattice V) (hL : L.IsPosDef) :
    IsUniversal L ↔ ∀ m ∈ ({1, 2, 3, 5, 6, 7, 10, 14, 15} : Finset ℕ), Represents L m := sorry

/-- **6.4. The 290 theorem** (Bhargava–Hanke), for the half-norms of an even lattice. -/
theorem isHalfUniversal_iff_twoNinety (L : IntegralLattice V) (hL : L.IsPosDef) (he : L.IsEven) :
    IsHalfUniversal L ↔ ∀ m ∈ ({1, 2, 3, 5, 6, 7, 10, 13, 14, 15, 17, 19, 21, 22, 23, 26, 29, 30,
      31, 34, 35, 37, 42, 58, 93, 110, 145, 203, 290} : Finset ℕ), Represents L (2 * m) := sorry

/-! ## Layer 7: the Festi–Veniani index

The tensor product of lattices (7.1–7.3) is specified in `README.md` only. -/

/-- **7.4.** The isometries of the discriminant bilinear module `(A_L, b_L)`, as a subgroup of the
automorphism group of `A_L`. For even `L` the quadratic refinement is a further condition
(`README.md`, 7.4). -/
def discriminantAutGroup (L : IntegralLattice V) :
    Subgroup (L.DiscriminantGroup ≃ₗ[ℤ] L.DiscriminantGroup) where
  carrier := {e | ∀ x y, L.discriminantPairing (e x) (e y) = L.discriminantPairing x y}
  mul_mem' {a b} ha hb x y := by simp only [LinearEquiv.mul_apply, ha (b x), hb x y]
  one_mem' x y := by simp
  inv_mem' {a} ha x y := by
    have := ha (a⁻¹ x) (a⁻¹ y)
    simp only [← LinearEquiv.mul_apply, mul_inv_cancel] at this
    simpa using this.symm

/-- **7.4.** The natural map `O(L) → Aut(A_L)` through `Isometry.discriminantGroupEquiv`. -/
noncomputable def discriminantHom (L : IntegralLattice V) :
    TauCeti.IntegralLattice.Isometry L L →* (L.DiscriminantGroup ≃ₗ[ℤ] L.DiscriminantGroup) where
  toFun e := TauCeti.IntegralLattice.Isometry.discriminantGroupEquiv e
  map_one' := by
    ext x
    simp [Isometry.one_def]
  map_mul' f g := by
    ext x
    simp [Isometry.mul_def]

theorem discriminantHom_range_le (L : IntegralLattice V) :
    (discriminantHom L).range ≤ discriminantAutGroup L := sorry

/-- **7.4.** For an even lattice, `O(D_L)` is the subgroup preserving the discriminant quadratic
map `q_L` (Tau Ceti's `discriminantQuadraticMap`, half-norm modulo `ℤ`); it can be strictly smaller
than the bilinear group (`⟨8⟩`: `O(ℤ/8, b)` has order `4`, `O(ℤ/8, q) = {±1}`). -/
def discriminantQuadAutGroup (L : IntegralLattice V) (he : L.IsEven) :
    Subgroup (L.DiscriminantGroup ≃ₗ[ℤ] L.DiscriminantGroup) where
  carrier := {e | ∀ x, L.discriminantQuadraticMap he (e x) = L.discriminantQuadraticMap he x}
  mul_mem' {a b} ha hb x := by simp only [LinearEquiv.mul_apply, ha (b x), hb x]
  one_mem' x := by simp
  inv_mem' {a} ha x := by
    have := ha (a⁻¹ x)
    simp only [← LinearEquiv.mul_apply, mul_inv_cancel] at this
    simpa using this.symm

theorem discriminantQuadAutGroup_le (L : IntegralLattice V) (he : L.IsEven) :
    discriminantQuadAutGroup L he ≤ discriminantAutGroup L := sorry

theorem discriminantHom_range_le_quad (L : IntegralLattice V) (he : L.IsEven) :
    (discriminantHom L).range ≤ discriminantQuadAutGroup L he := sorry

/-- **7.5.** The index of `φ_L(O(L))` in the bilinear group `O(A_L, b_L)`: the Festi–Veniani index
of an odd lattice, and an upper bound for that of an even one. -/
noncomputable def fvIndexBilinear (L : IntegralLattice V) : ℕ :=
  ((discriminantHom L).range.subgroupOf (discriminantAutGroup L)).index

open Classical in
/-- **7.5.** The Festi–Veniani index `[O(D_L) : φ_L(O(L))]`, with `O(D_L)` the quadratic group
when `L` is even and the bilinear group when `L` is odd (`README.md`, *Pinned conventions*). -/
noncomputable def fvIndex (L : IntegralLattice V) : ℕ :=
  if he : L.IsEven then
    ((discriminantHom L).range.subgroupOf (discriminantQuadAutGroup L he)).index
  else fvIndexBilinear L

/-- **7.5.** The rank-one formula: `fvIndex ⟨m⟩` is half the number of `u ∈ (ℤ/m)^×` with `u² ≡ 1`
modulo `m` (odd `m`) or modulo `2m` (even `m`), so `⟨15⟩` and `⟨12⟩` have index `2`. -/
theorem fvIndex_rankOne (m : ℕ) (hm : 3 ≤ m) :
    fvIndex (TauCeti.IntegralLattice.rankOne (m : ℤ)) =
      ((Finset.range m).filter fun u : ℕ =>
        Nat.Coprime u m ∧ u ^ 2 % (if m % 2 = 0 then 2 * m else m) = 1).card / 2 := sorry

theorem fvIndex_pos (L : IntegralLattice V) [L.IsNondegenerate] : 0 < fvIndex L := sorry

/-- **7.5.** A unimodular lattice has trivial discriminant group and index `1`. -/
theorem fvIndex_eq_one_of_isUnimodular (L : IntegralLattice V) (hu : L.IsUnimodular) :
    fvIndex L = 1 := sorry

end Lattice

end TauCetiRoadmap.LatticePackingsAndPerfectForms
