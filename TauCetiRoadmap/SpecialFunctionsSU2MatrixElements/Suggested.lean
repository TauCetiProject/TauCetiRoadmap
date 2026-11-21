module

public import Mathlib
public import TauCeti.RepresentationTheory.SU2.Exhaustion
public import TauCeti.RepresentationTheory.SU2.Completeness
public import TauCeti.RepresentationTheory.SU2.Weyl.Integration
public import TauCeti.RepresentationTheory.Compact.PeterWeyl
public import TauCeti.RepresentationTheory.Continuous.Transport
public import TauCeti.RepresentationTheory.Continuous.MatrixCoefficient
public import TauCeti.RepresentationTheory.Compact.Convolution
public import TauCeti.InformationTheory.Coding.Krawtchouk

/-!
# Matrix elements of SU(2) and SO(3): suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions), after Edmonds, *Angular Momentum in Quantum Mechanics*: spin
`j = d / 2` with `d : ℕ`; the index `i : Fin (d + 1)` carries the magnetic quantum number
`m = i - d / 2` (`magneticWeight`), so Edmonds's order `m = j, j - 1, …, -j` is `i = d, …, 0`;
`matrixElement d i k g = ⟪e_i, T(g) e_k⟫` is Edmonds's `D^j_{m'm}(g)` with `m' = i - d / 2`,
`m = k - d / 2`; the group element of the Euler angles `(α, β, γ)` is
`euler α β γ = torusExp (α / 2) * eulerMiddle β * torusExp (γ / 2)`, so that
`D^j_{m'm}(euler α β γ) = e^{im'α} d^j_{m'm}(β) e^{imγ}` exactly as in Edmonds (4.1.12).

Two definitions are local copies. `jacobi` is the Jacobi polynomial of the LaguerreJacobi roadmap,
§3.2, verbatim. `pauliRotation` is a local copy of `TauCeti.pauliRotation`, the matrix of Tau
Ceti's double cover `SU(2) → SO(3)` (the action on `ℝ³` by conjugation through the Pauli map), with
the same formula. The upstream declarations of the double cover consumed by the README (Exact
supplier contracts) are `TauCeti.pauliRotation`, `TauCeti.SU2.toSO3`,
`TauCeti.SU2.toSO3_surjective`, `TauCeti.SU2.toSO3_eq_one_iff` and `TauCeti.SU2.quotientKerToSO3`;
they are named here, not `#check`ed.

Six declarations are supporting steps proved here, not targets: `monomialNorm_pos`,
`continuous_unitaryModel`, `isIrreducible_unitaryModel` (needed by `irrepModel`),
`matrixElement_eq_conj_matrixCoeff`, `matrixElement_one` and `eulerLaplacian_sphere`.

Bold headlines of the README not stated here: the raising and lowering operators (§4.1), read off
the matrices; Jacobi orthogonality for integral parameters (§3.3), a consistency check; the
expansion of class functions in characters (§3.4); the Gegenbauer form (§2.6), which needs a
Gegenbauer polynomial; the comparison with the spherical harmonics of SpecialFunctionsLegendre
(§6.1), whose definition is not on the pinned main; and the irreducible pieces `H_l` and the
decomposition of `L²(S²)` (§6.3), which need the representation on a span of functions on the
sphere.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsSU2MatrixElements

open TauCeti TauCeti.SU2 Matrix MeasureTheory Polynomial Set Complex
open scoped Real ComplexConjugate InnerProductSpace

/-! ## Layer 1: coordinates and the unitary model -/

/-! ### 1.1 Euler coordinates on SU(2) -/

/-- The element `[[a, b], [-conj b, conj a]]` of `SU(2)` defined by a pair with
`|a|² + |b|² = 1`. -/
def ofPair (a b : ℂ) (h : normSq a + normSq b = 1) : SU2 :=
  ⟨!![a, b; -conj b, conj a], by
    rw [Matrix.mem_specialUnitaryGroup_iff, Matrix.mem_unitaryGroup_iff]
    have hc : a * conj a + b * conj b = 1 := by
      rw [mul_conj, mul_conj, ← ofReal_add, h, ofReal_one]
    refine ⟨?_, ?_⟩
    · ext i j
      fin_cases i <;> fin_cases j <;>
        simp [Matrix.mul_apply, Fin.sum_univ_two, Matrix.star_apply, hc] <;>
        simp_all [mul_comm, add_comm]
    · simp [Matrix.det_fin_two_of]
      linear_combination hc⟩

/-- Edmonds's middle Euler factor `exp(iβJ_y)` at spin one half (Edmonds (4.1.13)):
`[[cos(β/2), sin(β/2)], [-sin(β/2), cos(β/2)]]`. -/
def eulerMiddle (β : ℝ) : SU2 :=
  ofPair (Real.cos (β / 2)) (Real.sin (β / 2)) (by
    rw [normSq_ofReal, normSq_ofReal]
    nlinarith [Real.cos_sq_add_sin_sq (β / 2)])

/-- The entries of the middle Euler factor. -/
theorem coe_eulerMiddle (β : ℝ) :
    (eulerMiddle β : Matrix (Fin 2) (Fin 2) ℂ) =
      !![(Real.cos (β / 2) : ℂ), (Real.sin (β / 2) : ℂ);
        -(Real.sin (β / 2) : ℂ), (Real.cos (β / 2) : ℂ)] := by
  sorry

/-- **The Euler element** of Edmonds's angles `(α, β, γ)`, the spin-one-half value of
`exp(iαJ_z) exp(iβJ_y) exp(iγJ_z)`. -/
def euler (α β γ : ℝ) : SU2 :=
  torusExp (α / 2) * eulerMiddle β * torusExp (γ / 2)

/-- The parameter box `0 ≤ α < 2π`, `0 < β < π`, `-2π ≤ γ < 2π`. -/
def eulerBox : Set (ℝ × ℝ × ℝ) :=
  Ico 0 (2 * π) ×ˢ Ioo 0 π ×ˢ Ico (-(2 * π)) (2 * π)

/-- **The Euler matrix.** The entries of `euler α β γ`. -/
theorem coe_euler (α β γ : ℝ) :
    (euler α β γ : Matrix (Fin 2) (Fin 2) ℂ) =
      !![Real.cos (β / 2) * exp (I * ((α + γ) / 2)), Real.sin (β / 2) * exp (I * ((α - γ) / 2));
        -(Real.sin (β / 2) * exp (-(I * ((α - γ) / 2)))),
          Real.cos (β / 2) * exp (-(I * ((α + γ) / 2)))] := by
  sorry

/-- **Euler angles cover SU(2).** Every element is `euler α β γ` with `0 ≤ α < 2π`, `0 ≤ β ≤ π`,
`-2π ≤ γ < 2π`. -/
theorem exists_euler_eq (g : SU2) :
    ∃ α β γ, α ∈ Ico 0 (2 * π) ∧ β ∈ Icc 0 π ∧ γ ∈ Ico (-(2 * π)) (2 * π) ∧
      euler α β γ = g := by
  sorry

/-- **Euler angles are a bijection on the generic set.** On `eulerBox` the parametrization is a
bijection onto the elements whose first row has two nonzero entries. -/
theorem bijOn_euler :
    BijOn (fun p : ℝ × ℝ × ℝ ↦ euler p.1 p.2.1 p.2.2) eulerBox
      {g : SU2 | (g : Matrix (Fin 2) (Fin 2) ℂ) 0 0 * (g : Matrix (Fin 2) (Fin 2) ℂ) 0 1 ≠ 0} := by
  sorry

/-! ### 1.2 Rotations and SO(3) -/

/-- The rotation about the third axis through the angle `α`. -/
def rotationZ (α : ℝ) : Matrix (Fin 3) (Fin 3) ℝ :=
  !![Real.cos α, -Real.sin α, 0; Real.sin α, Real.cos α, 0; 0, 0, 1]

/-- The rotation about the second axis through the angle `β`. -/
def rotationY (β : ℝ) : Matrix (Fin 3) (Fin 3) ℝ :=
  !![Real.cos β, 0, Real.sin β; 0, 1, 0; -Real.sin β, 0, Real.cos β]

/-- The rotation attached to `g ∈ SU(2)`: column `b` is the vector of Pauli coordinates
`(Re A₁₀, Im A₁₀, Re A₀₀)` of `A = g σ(e_b) g*`, where `σ(x) = [[x₂, x₀ - i x₁], [x₀ + i x₁, -x₂]]`
is the Pauli map. This is a local copy of `TauCeti.pauliRotation`, the matrix of Tau Ceti's double
cover `SU(2) → SO(3)`, with the same formula. -/
def pauliRotation (g : SU2) : Matrix (Fin 3) (Fin 3) ℝ :=
  Matrix.of fun a b ↦
    let x : Fin 3 → ℝ := Pi.single b 1
    let A := (g : Matrix (Fin 2) (Fin 2) ℂ) *
      !![(x 2 : ℂ), x 0 - x 1 * I; x 0 + x 1 * I, -(x 2 : ℂ)] *
      star (g : Matrix (Fin 2) (Fin 2) ℂ)
    ![(A 1 0).re, (A 1 0).im, (A 0 0).re] a

/-- **Euler angles on SO(3).** The Euler element maps to `R_z(-α) R_y(-β) R_z(-γ)`. -/
theorem pauliRotation_euler (α β γ : ℝ) :
    pauliRotation (euler α β γ) = rotationZ (-α) * rotationY (-β) * rotationZ (-γ) := by
  sorry

/-- **Euler angles cover SO(3).** Every rotation is `R_z(-α) R_y(-β) R_z(-γ)` with `0 ≤ α < 2π`,
`0 ≤ β ≤ π`, `0 ≤ γ < 2π`. -/
theorem exists_eq_rotationZ_mul_rotationY_mul_rotationZ
    (R : Matrix.specialOrthogonalGroup (Fin 3) ℝ) :
    ∃ α β γ, α ∈ Ico 0 (2 * π) ∧ β ∈ Icc 0 π ∧ γ ∈ Ico 0 (2 * π) ∧
      (R : Matrix (Fin 3) (Fin 3) ℝ) = rotationZ (-α) * rotationY (-β) * rotationZ (-γ) := by
  sorry

/-! ### 1.3 Haar measure in Euler angles -/

/-- The Euler-angle probability measure `(16π²)⁻¹ sin β dα dβ dγ` on `eulerBox`. -/
def eulerMeasure : Measure (ℝ × ℝ × ℝ) :=
  ENNReal.ofReal (16 * π ^ 2)⁻¹ •
    (volume.restrict eulerBox).withDensity fun p ↦ ENNReal.ofReal (Real.sin p.2.1)

/-- **Haar measure in Euler angles.** The normalized Haar measure of `SU(2)` is the image of
`eulerMeasure` under the Euler parametrization. -/
theorem haarProb_eq_map_eulerMeasure :
    haarProb SU2 = eulerMeasure.map (fun p ↦ euler p.1 p.2.1 p.2.2) := by
  sorry

/-- **The Haar integral in Euler angles.** For every Haar-integrable `f`,
`∫ f = (16π²)⁻¹ ∫_box f(euler α β γ) sin β`. -/
theorem integral_haarProb_eq_setIntegral_eulerBox (f : SU2 → ℂ)
    (hf : Integrable f (haarProb SU2)) :
    ∫ g, f g ∂haarProb SU2 =
      ((16 * π ^ 2)⁻¹ : ℝ) * ∫ p in eulerBox, f (euler p.1 p.2.1 p.2.2) * Real.sin p.2.1 := by
  sorry

/-- **Haar measure of SO(3).** The image of the normalized Haar measure of `SU(2)` under
`pauliRotation` is the image of the normalized Haar measure of `SO(3)` in the `3 × 3` matrices. -/
theorem map_pauliRotation_haarProb :
    (haarProb SU2).map pauliRotation =
      (haarProb (Matrix.specialOrthogonalGroup (Fin 3) ℝ)).map
        (fun R : Matrix.specialOrthogonalGroup (Fin 3) ℝ ↦ (R : Matrix (Fin 3) (Fin 3) ℝ)) := by
  sorry

/-! ### 1.4 The unitary model -/

/-- The magnetic quantum number `m = i - d / 2` of the index `i` in spin `d / 2`. -/
def magneticWeight (d i : ℕ) : ℝ := i - d / 2

/-- The positive scale `√(i! (d - i)!)`, the norm of the monomial `z₁^i z₂^{d-i}` for the
invariant inner product. -/
def monomialNorm (d : ℕ) (i : Fin (d + 1)) : ℝ :=
  Real.sqrt ((i : ℕ).factorial * (d - i).factorial)

/-- Supporting step: the scale `monomialNorm d i` is positive. -/
theorem monomialNorm_pos (d : ℕ) (i : Fin (d + 1)) : 0 < monomialNorm d i :=
  Real.sqrt_pos.2 (by positivity)

/-- The diagonal change of basis `e_i ↦ √(i! (d - i)!) e_i` of the model space. -/
def monomialScale (d : ℕ) :
    EuclideanSpace ℂ (Fin (d + 1)) ≃L[ℂ] EuclideanSpace ℂ (Fin (d + 1)) :=
  LinearEquiv.toContinuousLinearEquiv <|
    (EuclideanSpace.basisFun (Fin (d + 1)) ℂ).toBasis.equiv
      ((EuclideanSpace.basisFun (Fin (d + 1)) ℂ).toBasis.unitsSMul fun i ↦
        Units.mk0 ((monomialNorm d i : ℝ) : ℂ) (ofReal_ne_zero.2 (monomialNorm_pos d i).ne'))
      (Equiv.refl _)

/-- **The unitary model of `Sym^d`.** Tau Ceti's `symPowerModel d` transported by
`monomialScale d`. The basis vector `e_i` corresponds to the normalized monomial
`z₁^i z₂^{d-i} / √(i! (d - i)!)`, Edmonds's `u(j, m)` with `j = d / 2`, `m = i - d / 2`. -/
def unitaryModel (d : ℕ) : ContRepresentation ℂ SU2 (EuclideanSpace ℂ (Fin (d + 1))) :=
  (monomialScale d).congr (symPowerModel d)

/-- Supporting step: the unitary model is continuous, by transport of continuity. -/
theorem continuous_unitaryModel (d : ℕ) : Continuous (unitaryModel d) :=
  (monomialScale d).continuous_congr (continuous_symPowerModel d)

/-- **The invariant inner product.** The unitary model is unitary. -/
theorem isUnitary_unitaryModel (d : ℕ) : ContRepresentation.IsUnitary (unitaryModel d) := by
  sorry

/-- Supporting step: the unitary model is irreducible, by transport of irreducibility. -/
theorem isIrreducible_unitaryModel (d : ℕ) :
    Representation.IsIrreducible (unitaryModel d).toRepresentation :=
  (monomialScale d).isIrreducible_congr (isIrreducible_symPowerModel d)

/-- The unitary model as a Tau Ceti `IrrepModel`. -/
def irrepModel (d : ℕ) : IrrepModel ℂ SU2 where
  dim := d + 1
  rep := unitaryModel d
  continuous_rep := continuous_unitaryModel d
  isUnitary := isUnitary_unitaryModel d
  isIrreducible := isIrreducible_unitaryModel d

/-- **The unitary dual of SU(2).** The models `irrepModel d`, `d : ℕ`, form a skeleton of the
continuous unitary irreducible representations. -/
theorem isIrrepSkeleton_irrepModel : IsIrrepSkeleton irrepModel := by
  sorry

/-! ## Layer 2: matrix elements and their closed forms -/

/-! ### 2.1 Matrix elements and the entry polynomial -/

/-- **The matrix element** `D^j_{m'm}(g) = ⟪e_{m'}, T^j(g) e_m⟫` (Edmonds (4.1.10)), with
`j = d / 2`, `m' = i - d / 2`, `m = k - d / 2`. -/
def matrixElement (d : ℕ) (i k : Fin (d + 1)) (g : SU2) : ℂ :=
  ⟪EuclideanSpace.single i (1 : ℂ), unitaryModel d g (EuclideanSpace.single k 1)⟫_ℂ

/-- Supporting step: the matrix element is the conjugate of Tau Ceti's matrix coefficient
`⟪T(g) e_k, e_i⟫`. -/
theorem matrixElement_eq_conj_matrixCoeff (d : ℕ) (i k : Fin (d + 1)) (g : SU2) :
    matrixElement d i k g =
      conj (ContRepresentation.matrixCoeff (unitaryModel d) (continuous_unitaryModel d)
        (EuclideanSpace.single k 1) (EuclideanSpace.single i 1) g) := by
  simp [matrixElement]

/-- **The basis expansion** `T(g) e_m = Σ_{m'} D_{m'm}(g) e_{m'}` (Edmonds (4.1.5)). -/
theorem unitaryModel_single (d : ℕ) (g : SU2) (k : Fin (d + 1)) :
    unitaryModel d g (EuclideanSpace.single k 1) =
      ∑ i, matrixElement d i k g • EuclideanSpace.single i 1 := by
  sorry

/-- The explicit polynomial in the entries of `A`:
`Σ_s √(i!(d-i)! j!(d-j)!) A₀₀^{s+i+j-d} A₀₁^{d-j-s} A₁₀^{d-i-s} A₁₁^s /
(s!(s+i+j-d)!(d-j-s)!(d-i-s)!)`, the sum over the `s` for which every exponent is a natural
number. -/
def entrySum (d i j : ℕ) (A : Matrix (Fin 2) (Fin 2) ℂ) : ℂ :=
  ∑ s ∈ Finset.range (d + 1),
    if d ≤ s + i + j ∧ s + i ≤ d ∧ s + j ≤ d then
      ((Real.sqrt (i.factorial * (d - i).factorial * j.factorial * (d - j).factorial) /
          (s.factorial * (s + i + j - d).factorial * (d - j - s).factorial *
            (d - i - s).factorial) : ℝ) : ℂ) *
        A 0 0 ^ (s + i + j - d) * A 0 1 ^ (d - j - s) * A 1 0 ^ (d - i - s) * A 1 1 ^ s
    else 0

/-- **The explicit polynomial formula.** -/
theorem matrixElement_eq_entrySum (d : ℕ) (i j : Fin (d + 1)) (g : SU2) :
    matrixElement d i j g = entrySum d i j (g : Matrix (Fin 2) (Fin 2) ℂ) := by
  sorry

/-- **Spin one half is the defining representation.** Edmonds's order `m = 1/2, -1/2` is
`i = 1, 0`, and in that order the matrix of `T^{1/2}(g)` is `g`. -/
theorem matrixElement_spinHalf (i j : Fin 2) (g : SU2) :
    matrixElement 1 i j g = (g : Matrix (Fin 2) (Fin 2) ℂ) (Fin.rev i) (Fin.rev j) := by
  sorry

/-! ### 2.2 The group law, unitarity and the centre -/

/-- Supporting step: the matrix elements of the identity form the identity matrix. -/
theorem matrixElement_one (d : ℕ) (i j : Fin (d + 1)) :
    matrixElement d i j 1 = if i = j then 1 else 0 := by
  simp [matrixElement, EuclideanSpace.inner_single_left]

/-- **The group law** `D(gh) = D(g) D(h)`. -/
theorem matrixElement_mul (d : ℕ) (i j : Fin (d + 1)) (g h : SU2) :
    matrixElement d i j (g * h) = ∑ k, matrixElement d i k g * matrixElement d k j h := by
  sorry

/-- **The inverse** `D_{m'm}(g⁻¹) = conj D_{mm'}(g)`. -/
theorem matrixElement_inv (d : ℕ) (i j : Fin (d + 1)) (g : SU2) :
    matrixElement d i j g⁻¹ = conj (matrixElement d j i g) := by
  sorry

/-- The columns of `D(g)` are orthonormal. -/
theorem sum_conj_matrixElement_mul_matrixElement (d : ℕ) (i j : Fin (d + 1)) (g : SU2) :
    ∑ k, conj (matrixElement d k i g) * matrixElement d k j g = if i = j then 1 else 0 := by
  sorry

/-- The rows of `D(g)` are orthonormal. -/
theorem sum_matrixElement_mul_conj_matrixElement (d : ℕ) (i j : Fin (d + 1)) (g : SU2) :
    ∑ k, matrixElement d i k g * conj (matrixElement d j k g) = if i = j then 1 else 0 := by
  sorry

/-- **The centre.** `torusExp π = -1` acts by `(-1)^d`. -/
theorem matrixElement_torusExp_pi_mul (d : ℕ) (i j : Fin (d + 1)) (g : SU2) :
    matrixElement d i j (torusExp π * g) = (-1) ^ d * matrixElement d i j g := by
  sorry

/-- **The representations of SO(3).** For even `d` the unitary model factors through the double
cover: there is a continuous unitary representation `ρ` of `SO(3)` with
`ρ (pauliRotation g) = unitaryModel d g`. -/
theorem exists_unitaryModel_eq_comp_pauliRotation (d : ℕ) (hd : Even d) :
    ∃ ρ : ContRepresentation ℂ (Matrix.specialOrthogonalGroup (Fin 3) ℝ)
        (EuclideanSpace ℂ (Fin (d + 1))),
      Continuous ρ ∧ ContRepresentation.IsUnitary ρ ∧
        ∀ (g : SU2) (hg : pauliRotation g ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ),
          ρ ⟨pauliRotation g, hg⟩ = unitaryModel d g := by
  sorry

/-! ### 2.3 Matrix elements in Euler angles -/

/-- **Edmonds's `d^j_{m'm}(β)`** by his finite sum (4.1.15), in the indices `i = j + m'`,
`k = j + m`:
`√(i!(d-i)!/(k!(d-k)!)) Σ_s C(k, d-i-s) C(d-k, s) (-1)^{d-i-s} cos(β/2)^{2s+i+k-d}
sin(β/2)^{2d-i-k-2s}`. It is `0` when an index exceeds `d`, and is defined for every real `β`. -/
def wignerSmallD (d i k : ℕ) (β : ℝ) : ℝ :=
  if i ≤ d ∧ k ≤ d then
    Real.sqrt ((i.factorial * (d - i).factorial : ℕ) / (k.factorial * (d - k).factorial : ℕ)) *
      ∑ s ∈ Finset.range (d - i + 1),
        ((k.choose (d - i - s) * (d - k).choose s : ℕ) : ℝ) * (-1) ^ (d - i - s) *
          Real.cos (β / 2) ^ (2 * s + i + k - d) * Real.sin (β / 2) ^ (2 * d - i - k - 2 * s)
  else 0

/-- **Matrix elements in Euler angles** (Edmonds (4.1.12)).
`D^j_{m'm}(euler α β γ) = e^{im'α} d^j_{m'm}(β) e^{imγ}` for all real angles. -/
theorem matrixElement_euler (d : ℕ) (i k : Fin (d + 1)) (α β γ : ℝ) :
    matrixElement d i k (euler α β γ) =
      exp (I * (magneticWeight d i * α)) * wignerSmallD d i k β *
        exp (I * (magneticWeight d k * γ)) := by
  sorry

/-! ### 2.4 Jacobi and hypergeometric forms -/

/-- Local copy of the Jacobi polynomial `P_n^{(α,β)}` of the LaguerreJacobi roadmap, §3.2
(DLMF 18.5.8), verbatim; the owner is that roadmap. -/
def jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) : R[X] :=
  ((1 : ℚ) / 2 ^ n) • ∑ k ∈ Finset.range (n + 1),
    (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      ((ascPochhammer R (n - k)).smeval (β + k + 1) *
        (ascPochhammer R k).smeval (α + (n - k : ℕ) + 1))) • ((X - 1) ^ (n - k) * (X + 1) ^ k)

/-- **The Jacobi form** (Edmonds (4.1.23), extended to all indices). With `a = |i - k| = |m' - m|`,
`b = |d - i - k| = |m' + m|` and `r = min(i, k, d - i, d - k) = j - max(|m'|, |m|)`:
`d^j_{m'm}(β) = (-1)^{max(k - i, 0)} √(r!(d-r)!/((r+a)!(r+b)!)) sin(β/2)^a cos(β/2)^b
P_r^{(a,b)}(cos β)`, for all real `β`. -/
theorem wignerSmallD_eq_jacobi (d i k : ℕ) (hi : i ≤ d) (hk : k ≤ d) (β : ℝ) :
    let a := Int.natAbs ((i : ℤ) - k)
    let b := Int.natAbs ((d : ℤ) - i - k)
    let r := min (min i k) (min (d - i) (d - k))
    wignerSmallD d i k β =
      (-1) ^ (k - i) *
        Real.sqrt ((r.factorial * (d - r).factorial : ℕ) /
          ((r + a).factorial * (r + b).factorial : ℕ)) *
        Real.sin (β / 2) ^ a * Real.cos (β / 2) ^ b *
        (jacobi (a : ℝ) (b : ℝ) r).eval (Real.cos β) := by
  sorry

/-- **The hypergeometric form.** With `a, b, r` as in `wignerSmallD_eq_jacobi`,
`P_r^{(a,b)}(cos β) = (a+1)_r / r! · F(-r, r+a+b+1; a+1; sin²(β/2))`, and `r + a + b = d - r`. -/
theorem wignerSmallD_eq_hypergeometric (d i k : ℕ) (hi : i ≤ d) (hk : k ≤ d) (β : ℝ) :
    let a := Int.natAbs ((i : ℤ) - k)
    let b := Int.natAbs ((d : ℤ) - i - k)
    let r := min (min i k) (min (d - i) (d - k))
    wignerSmallD d i k β =
      (-1) ^ (k - i) *
        Real.sqrt ((r.factorial * (d - r).factorial : ℕ) /
          ((r + a).factorial * (r + b).factorial : ℕ)) *
        Real.sin (β / 2) ^ a * Real.cos (β / 2) ^ b *
        ((ascPochhammer ℝ r).eval ((a : ℝ) + 1) / r.factorial) *
        ordinaryHypergeometric (𝔸 := ℝ) (-(r : ℝ)) ((d - r + 1 : ℕ) : ℝ) ((a : ℝ) + 1)
          (Real.sin (β / 2) ^ 2) := by
  sorry

/-! ### 2.5 Symmetries and special values -/

/-- `d_{m'm} = (-1)^{m'-m} d_{mm'}` (Edmonds (4.2.6)). -/
theorem wignerSmallD_swap (d i k : ℕ) (hi : i ≤ d) (hk : k ≤ d) (β : ℝ) :
    wignerSmallD d i k β = (-1) ^ (i + k) * wignerSmallD d k i β := by
  sorry

/-- `d_{m'm} = (-1)^{m'-m} d_{-m',-m}` (Edmonds (4.2.5)). -/
theorem wignerSmallD_reflect (d i k : ℕ) (hi : i ≤ d) (hk : k ≤ d) (β : ℝ) :
    wignerSmallD d i k β = (-1) ^ (i + k) * wignerSmallD d (d - i) (d - k) β := by
  sorry

/-- `d_{m'm}(-β) = d_{mm'}(β)` (Edmonds (4.2.2)). -/
theorem wignerSmallD_neg (d i k : ℕ) (β : ℝ) :
    wignerSmallD d i k (-β) = wignerSmallD d k i β := by
  sorry

/-- `d_{m'm}(π + β) = (-1)^{j-m'} d_{-m',m}(β)` (Edmonds (4.2.3)). -/
theorem wignerSmallD_pi_add (d i k : ℕ) (hi : i ≤ d) (β : ℝ) :
    wignerSmallD d i k (π + β) = (-1) ^ (d - i) * wignerSmallD d (d - i) k β := by
  sorry

/-- `d_{m'm}(0) = δ_{m'm}`. -/
theorem wignerSmallD_zero (d i k : ℕ) (hi : i ≤ d) (hk : k ≤ d) :
    wignerSmallD d i k 0 = if i = k then 1 else 0 := by
  sorry

/-- `d_{m'm}(π) = (-1)^{j+m} δ_{m',-m}` (Edmonds (4.2.1)). -/
theorem wignerSmallD_pi (d i k : ℕ) (hi : i ≤ d) (hk : k ≤ d) :
    wignerSmallD d i k π = if i + k = d then (-1) ^ k else 0 := by
  sorry

/-! ### 2.6 Legendre, Ferrers and Gegenbauer forms -/

/-- **Legendre polynomials are the zonal matrix elements** (Edmonds (4.1.26)):
`d^l_{00}(β) = P_l(cos β)` for integral `l`, with `P_l = jacobi 0 0 l`. -/
theorem wignerSmallD_two_mul_self (l : ℕ) (β : ℝ) :
    wignerSmallD (2 * l) l l β = (jacobi (0 : ℝ) 0 l).eval (Real.cos β) := by
  sorry

/-- **Associated Legendre functions** (Edmonds (4.1.24)). For `n ≤ l` and all real `β`,
`d^l_{n0}(β) = √((l-n)!/(l+n)!) sin^n β P_l^{(n)}(cos β)`. -/
theorem wignerSmallD_eq_ferrers (l n : ℕ) (hn : n ≤ l) (β : ℝ) :
    wignerSmallD (2 * l) (l + n) l β =
      Real.sqrt ((l - n).factorial / (l + n).factorial) * Real.sin β ^ n *
        ((derivative^[n]) (jacobi (0 : ℝ) 0 l)).eval (Real.cos β) := by
  sorry

/-! ### 2.7 The convention of Vilenkin and Klimyk -/

/-- The middle factor `[[cos(θ/2), i sin(θ/2)], [i sin(θ/2), cos(θ/2)]]`, which is `exp(iθJ_x)` at
spin one half. -/
def eulerMiddleX (θ : ℝ) : SU2 :=
  ofPair (Real.cos (θ / 2)) (I * Real.sin (θ / 2)) (by
    rw [normSq_ofReal, normSq_mul, normSq_I, normSq_ofReal, one_mul]
    nlinarith [Real.cos_sq_add_sin_sq (θ / 2)])

/-- The Euler element `torusExp (φ/2) * eulerMiddleX θ * torusExp (ψ/2)` of Vilenkin and Klimyk. -/
def eulerX (φ θ ψ : ℝ) : SU2 :=
  torusExp (φ / 2) * eulerMiddleX θ * torusExp (ψ / 2)

/-- The two Euler conventions differ by a quarter turn of the outer angles. -/
theorem eulerX_eq_euler (φ θ ψ : ℝ) : eulerX φ θ ψ = euler (φ + π / 2) θ (ψ - π / 2) := by
  sorry

/-- **The conversion from Vilenkin–Klimyk.** In the Euler angles of `eulerX`,
`D_{m'm} = i^{m - m'} e^{i(m'φ + mψ)} d_{-m',-m}(θ)`. With Vilenkin and Klimyk's weights
`m_VK = -m'`, `n_VK = -m` this is their formula `i^{m_VK - n_VK} e^{-i(m_VK φ + n_VK ψ)}
P^l_{m_VK n_VK}(cos θ)` with `P^l_{m_VK n_VK}(cos θ) = d_{m_VK n_VK}(θ)`. -/
theorem matrixElement_eulerX (d : ℕ) (i k : Fin (d + 1)) (φ θ ψ : ℝ) :
    matrixElement d i k (eulerX φ θ ψ) =
      I ^ ((k : ℤ) - i) * exp (I * (magneticWeight d i * φ + magneticWeight d k * ψ)) *
        wignerSmallD d (d - i) (d - k) θ := by
  sorry

/-! ## Layer 3: identities from the group law -/

/-! ### 3.1 Addition theorems -/

/-- **The angle of a product.** If `eulerMiddle β₁ * euler α₂ β₂ 0 = euler α β γ` then
`cos β = cos β₁ cos β₂ - sin β₁ sin β₂ cos α₂`. -/
theorem cos_of_euler_mul {β₁ α₂ β₂ α β γ : ℝ}
    (h : eulerMiddle β₁ * euler α₂ β₂ 0 = euler α β γ) :
    Real.cos β = Real.cos β₁ * Real.cos β₂ - Real.sin β₁ * Real.sin β₂ * Real.cos α₂ := by
  sorry

/-- **The addition theorem for `d^j`.** If `eulerMiddle β₁ * euler α₂ β₂ 0 = euler α β γ` then
`e^{i(m'α + mγ)} d_{m'm}(β) = Σ_μ e^{iμα₂} d_{m'μ}(β₁) d_{μm}(β₂)`. -/
theorem wignerSmallD_addition (d : ℕ) (i k : Fin (d + 1)) {β₁ α₂ β₂ α β γ : ℝ}
    (h : eulerMiddle β₁ * euler α₂ β₂ 0 = euler α β γ) :
    exp (I * (magneticWeight d i * α + magneticWeight d k * γ)) * wignerSmallD d i k β =
      ∑ μ : Fin (d + 1), exp (I * (magneticWeight d μ * α₂)) *
        wignerSmallD d i μ β₁ * wignerSmallD d μ k β₂ := by
  sorry

/-- **The Legendre addition theorem.** For all real angles,
`P_l(cos β₁ cos β₂ - sin β₁ sin β₂ cos α) = Σ_m (-1)^m cos(mα) d^l_{m0}(β₁) d^l_{m0}(β₂)`, with
`m = i - l`. -/
theorem legendre_addition (l : ℕ) (β₁ β₂ α : ℝ) :
    (jacobi (0 : ℝ) 0 l).eval
        (Real.cos β₁ * Real.cos β₂ - Real.sin β₁ * Real.sin β₂ * Real.cos α) =
      ∑ i ∈ Finset.range (2 * l + 1), (-1) ^ (i + l) * Real.cos (((i : ℝ) - l) * α) *
        wignerSmallD (2 * l) i l β₁ * wignerSmallD (2 * l) i l β₂ := by
  sorry

/-! ### 3.2 The product formula and the functional equation -/

/-- **The product formula for Legendre polynomials.** For all real angles,
`P_l(cos θ₁) P_l(cos θ₂) = π⁻¹ ∫_0^π P_l(cos θ₁ cos θ₂ - sin θ₁ sin θ₂ cos φ) dφ`. -/
theorem legendre_product (l : ℕ) (θ₁ θ₂ : ℝ) :
    (jacobi (0 : ℝ) 0 l).eval (Real.cos θ₁) * (jacobi (0 : ℝ) 0 l).eval (Real.cos θ₂) =
      π⁻¹ * ∫ φ in (0 : ℝ)..π, (jacobi (0 : ℝ) 0 l).eval
        (Real.cos θ₁ * Real.cos θ₂ - Real.sin θ₁ * Real.sin θ₂ * Real.cos φ) := by
  sorry

/-- **The functional equation of the zonal function.**
`(2π)⁻¹ ∫_0^{2π} D^l_{00}(g · torusExp t · h) dt = D^l_{00}(g) D^l_{00}(h)`. -/
theorem integral_matrixElement_mul_torusExp_mul (l : ℕ) (g h : SU2) :
    ((2 * π)⁻¹ : ℂ) * ∫ t in (0 : ℝ)..(2 * π),
        matrixElement (2 * l) ⟨l, by omega⟩ ⟨l, by omega⟩ (g * torusExp t * h) =
      matrixElement (2 * l) ⟨l, by omega⟩ ⟨l, by omega⟩ g *
        matrixElement (2 * l) ⟨l, by omega⟩ ⟨l, by omega⟩ h := by
  sorry

/-! ### 3.3 Orthogonality -/

/-- **Schur orthogonality in coordinates** (Edmonds (4.6.1)). -/
theorem integral_matrixElement_mul_conj (d d' : ℕ) (i j : Fin (d + 1)) (i' j' : Fin (d' + 1)) :
    ∫ g, matrixElement d i j g * conj (matrixElement d' i' j' g) ∂haarProb SU2 =
      if d = d' ∧ (i : ℕ) = i' ∧ (j : ℕ) = j' then ((d + 1 : ℕ) : ℂ)⁻¹ else 0 := by
  sorry

/-- **Orthogonality of `d^j_{m'm}` for fixed `(m', m)`.** If the weights agree,
`2i - d = 2i' - d'` and `2k - d = 2k' - d'`, then
`∫_0^π d^j_{m'm}(β) d^{j'}_{m'm}(β) sin β dβ = 2/(2j+1) δ_{jj'}`. -/
theorem integral_wignerSmallD_mul_wignerSmallD (d d' i k i' k' : ℕ) (hi : i ≤ d) (hk : k ≤ d)
    (hi' : i' ≤ d') (hk' : k' ≤ d') (hm : 2 * (i : ℤ) - d = 2 * i' - d')
    (hn : 2 * (k : ℤ) - d = 2 * k' - d') :
    ∫ β in (0 : ℝ)..π, wignerSmallD d i k β * wignerSmallD d' i' k' β * Real.sin β =
      if d = d' then 2 / (d + 1) else 0 := by
  sorry

/-! ### 3.4 Plancherel on SU(2) -/

/-- **Plancherel on SU(2).** For `f ∈ L²(SU(2))`,
`∫ |f|² = Σ_{j,m',m} (2j+1) |∫ f conj D^j_{m'm}|²`. -/
theorem hasSum_plancherel (f : SU2 → ℂ) (hf : MemLp f 2 (haarProb SU2)) :
    HasSum (fun x : Σ d : ℕ, Fin (d + 1) × Fin (d + 1) ↦
        ((x.1 + 1 : ℕ) : ℝ) *
          ‖∫ g, f g * conj (matrixElement x.1 x.2.1 x.2.2 g) ∂haarProb SU2‖ ^ 2)
      (∫ g, ‖f g‖ ^ 2 ∂haarProb SU2) := by
  sorry

/-! ## Layer 4: the Lie-algebra action -/

/-! ### 4.1 Infinitesimal operators and the Casimir -/

/-- `i J_x` in the basis `e_i`, `m = i - d/2`: the derivative of `T(eulerMiddleX t)` at `0`. -/
def lieMatrixX (d : ℕ) : Matrix (Fin (d + 1)) (Fin (d + 1)) ℂ := fun k j ↦
  if (k : ℕ) + 1 = j then I / 2 * Real.sqrt ((j : ℕ) * (d - j + 1 : ℕ))
  else if (k : ℕ) = j + 1 then I / 2 * Real.sqrt ((d - j : ℕ) * ((j : ℕ) + 1))
  else 0

/-- `i J_y` in the basis `e_i`: the derivative of `T(eulerMiddle t)` at `0`. -/
def lieMatrixY (d : ℕ) : Matrix (Fin (d + 1)) (Fin (d + 1)) ℂ := fun k j ↦
  if (k : ℕ) + 1 = j then -(1 / 2 * Real.sqrt ((j : ℕ) * (d - j + 1 : ℕ)))
  else if (k : ℕ) = j + 1 then 1 / 2 * Real.sqrt ((d - j : ℕ) * ((j : ℕ) + 1))
  else 0

/-- `i J_z` in the basis `e_i`: the diagonal `i m`, `m = j - d/2`. -/
def lieMatrixZ (d : ℕ) : Matrix (Fin (d + 1)) (Fin (d + 1)) ℂ :=
  Matrix.diagonal fun j ↦ I * magneticWeight d j

/-- **The infinitesimal operator along `eulerMiddleX t = exp(itJ_x)`.** -/
theorem hasDerivAt_matrixElement_mul_eulerMiddleX (d : ℕ) (i k : Fin (d + 1)) (g : SU2) :
    HasDerivAt (fun t ↦ matrixElement d i k (g * eulerMiddleX t))
      (∑ μ, matrixElement d i μ g * lieMatrixX d μ k) 0 := by
  sorry

/-- **The infinitesimal operator along `eulerMiddle t = exp(itJ_y)`.** -/
theorem hasDerivAt_matrixElement_mul_eulerMiddle (d : ℕ) (i k : Fin (d + 1)) (g : SU2) :
    HasDerivAt (fun t ↦ matrixElement d i k (g * eulerMiddle t))
      (∑ μ, matrixElement d i μ g * lieMatrixY d μ k) 0 := by
  sorry

/-- **The infinitesimal operator along `torusExp (t/2) = exp(itJ_z)`.** -/
theorem hasDerivAt_matrixElement_mul_torusExp (d : ℕ) (i k : Fin (d + 1)) (g : SU2) :
    HasDerivAt (fun t ↦ matrixElement d i k (g * torusExp (t / 2)))
      (∑ μ, matrixElement d i μ g * lieMatrixZ d μ k) 0 := by
  sorry

/-- `[iJ_x, iJ_y] = -iJ_z`. -/
theorem commutator_lieMatrixX_lieMatrixY (d : ℕ) :
    lieMatrixX d * lieMatrixY d - lieMatrixY d * lieMatrixX d = -lieMatrixZ d := by
  sorry

/-- `[iJ_y, iJ_z] = -iJ_x`. -/
theorem commutator_lieMatrixY_lieMatrixZ (d : ℕ) :
    lieMatrixY d * lieMatrixZ d - lieMatrixZ d * lieMatrixY d = -lieMatrixX d := by
  sorry

/-- `[iJ_z, iJ_x] = -iJ_y`. -/
theorem commutator_lieMatrixZ_lieMatrixX (d : ℕ) :
    lieMatrixZ d * lieMatrixX d - lieMatrixX d * lieMatrixZ d = -lieMatrixY d := by
  sorry

/-- **The Casimir.** `(iJ_x)² + (iJ_y)² + (iJ_z)² = -j(j+1)`. -/
theorem casimir_lieMatrix (d : ℕ) :
    lieMatrixX d * lieMatrixX d + lieMatrixY d * lieMatrixY d + lieMatrixZ d * lieMatrixZ d =
      -(((d : ℂ) / 2) * ((d : ℂ) / 2 + 1)) • (1 : Matrix (Fin (d + 1)) (Fin (d + 1)) ℂ) := by
  sorry

/-! ### 4.2 Differential equation, recurrence and generating function -/

/-- **The differential equation of `d^j_{m'm}`.** On `(0, π)`,
`d'' + cot β d' - (m'² + m² - 2m'm cos β)/sin² β · d = -j(j+1) d`. -/
theorem wignerSmallD_ode (d i k : ℕ) (hi : i ≤ d) (hk : k ≤ d) {β : ℝ} (hβ : β ∈ Ioo 0 π) :
    deriv (deriv (wignerSmallD d i k)) β + Real.cot β * deriv (wignerSmallD d i k) β -
        (magneticWeight d i ^ 2 + magneticWeight d k ^ 2 -
            2 * magneticWeight d i * magneticWeight d k * Real.cos β) /
          Real.sin β ^ 2 * wignerSmallD d i k β =
      -((d / 2 : ℝ) * (d / 2 + 1)) * wignerSmallD d i k β := by
  sorry

/-- **The first-order recurrence in the column index.** For every real `β`,
`d/dβ d_{m'm} = ½ (√((j-m)(j+m+1)) d_{m',m+1} - √((j+m)(j-m+1)) d_{m',m-1})`; with `m = k - j`
the neighbours are the columns `k + 1` and `k - 1`, and the coefficients vanish at the ends. -/
theorem hasDerivAt_wignerSmallD (d i k : ℕ) (hi : i ≤ d) (hk : k ≤ d) (β : ℝ) :
    HasDerivAt (wignerSmallD d i k)
      (1 / 2 * (Real.sqrt ((d - k : ℕ) * (k + 1)) * wignerSmallD d i (k + 1) β -
        Real.sqrt (k * (d - k + 1 : ℕ)) * wignerSmallD d i (k - 1) β)) β := by
  sorry

/-- **The generating function for a fixed column** (Edmonds (4.1.14) at `x₋ = 1`, `x₊ = w`).
`(w cos(β/2) - sin(β/2))^k (w sin(β/2) + cos(β/2))^{d-k} / √(k!(d-k)!)
= Σ_i w^i d_{ik}(β) / √(i!(d-i)!)`. -/
theorem wignerSmallD_generatingFunction (d k : ℕ) (hk : k ≤ d) (β : ℝ) (w : ℂ) :
    (w * Real.cos (β / 2) - Real.sin (β / 2)) ^ k *
        (w * Real.sin (β / 2) + Real.cos (β / 2)) ^ (d - k) /
        (Real.sqrt (k.factorial * (d - k).factorial) : ℂ) =
      ∑ i ∈ Finset.range (d + 1), w ^ i * (wignerSmallD d i k β : ℂ) /
        (Real.sqrt (i.factorial * (d - i).factorial) : ℂ) := by
  sorry

/-! ### 4.3 The Casimir in Euler angles -/

/-- The derivative of `f` at `g` along the right translates `g * Y t`. -/
def rightField (Y : ℝ → SU2) (f : SU2 → ℂ) (g : SU2) : ℂ :=
  deriv (fun t ↦ f (g * Y t)) 0

/-- The derivative of `f` at `g` along the left translates `Y t * g`. -/
def leftField (Y : ℝ → SU2) (f : SU2 → ℂ) (g : SU2) : ℂ :=
  deriv (fun t ↦ f (Y t * g)) 0

/-- **The Casimir of the right regular representation**, `Σ_k X_k²` for the one-parameter
subgroups `eulerMiddleX t = exp(itJ_x)`, `eulerMiddle t = exp(itJ_y)`,
`torusExp (t/2) = exp(itJ_z)`. -/
def rightCasimir (f : SU2 → ℂ) (g : SU2) : ℂ :=
  rightField eulerMiddleX (rightField eulerMiddleX f) g +
    rightField eulerMiddle (rightField eulerMiddle f) g +
    rightField (fun t ↦ torusExp (t / 2)) (rightField (fun t ↦ torusExp (t / 2)) f) g

/-- **The Casimir of the left regular representation**, built from left translates. -/
def leftCasimir (f : SU2 → ℂ) (g : SU2) : ℂ :=
  leftField eulerMiddleX (leftField eulerMiddleX f) g +
    leftField eulerMiddle (leftField eulerMiddle f) g +
    leftField (fun t ↦ torusExp (t / 2)) (leftField (fun t ↦ torusExp (t / 2)) f) g

/-- **The Laplacian of SU(2) in Euler angles**, on functions of `p = (α, β, γ)`:
`∂²_β + cot β ∂_β + sin⁻² β (∂²_α - 2 cos β ∂_α ∂_γ + ∂²_γ)`. The theorems use it on the chart
`0 < β < π`. -/
def eulerLaplacian (F : ℝ × ℝ × ℝ → ℂ) (p : ℝ × ℝ × ℝ) : ℂ :=
  deriv (fun b ↦ deriv (fun b' ↦ F (p.1, b', p.2.2)) b) p.2.1 +
    (Real.cot p.2.1 : ℂ) * deriv (fun b ↦ F (p.1, b, p.2.2)) p.2.1 +
    (deriv (fun a ↦ deriv (fun a' ↦ F (a', p.2.1, p.2.2)) a) p.1 -
        2 * (Real.cos p.2.1 : ℂ) * deriv (fun c ↦ deriv (fun a ↦ F (a, p.2.1, c)) p.1) p.2.2 +
        deriv (fun c ↦ deriv (fun c' ↦ F (p.1, p.2.1, c')) c) p.2.2) /
      (Real.sin p.2.1 : ℂ) ^ 2

/-- **The right Casimir in Euler angles.** On the chart `0 < β < π`, for `f` whose pullback by
`euler` is `C²` there, `rightCasimir f` is `eulerLaplacian` of the pullback. -/
theorem rightCasimir_euler (f : SU2 → ℂ)
    (hf : ContDiffOn ℝ 2 (fun p : ℝ × ℝ × ℝ ↦ f (euler p.1 p.2.1 p.2.2))
      (univ ×ˢ Ioo 0 π ×ˢ univ))
    {p : ℝ × ℝ × ℝ} (hp : p.2.1 ∈ Ioo 0 π) :
    rightCasimir f (euler p.1 p.2.1 p.2.2) =
      eulerLaplacian (fun q ↦ f (euler q.1 q.2.1 q.2.2)) p := by
  sorry

/-- **The left Casimir in Euler angles**, under the same hypotheses. -/
theorem leftCasimir_euler (f : SU2 → ℂ)
    (hf : ContDiffOn ℝ 2 (fun p : ℝ × ℝ × ℝ ↦ f (euler p.1 p.2.1 p.2.2))
      (univ ×ˢ Ioo 0 π ×ˢ univ))
    {p : ℝ × ℝ × ℝ} (hp : p.2.1 ∈ Ioo 0 π) :
    leftCasimir f (euler p.1 p.2.1 p.2.2) =
      eulerLaplacian (fun q ↦ f (euler q.1 q.2.1 q.2.2)) p := by
  sorry

/-- **Matrix elements are eigenfunctions of the right Casimir**, with eigenvalue `-j(j+1)`. -/
theorem rightCasimir_matrixElement (d : ℕ) (i k : Fin (d + 1)) (g : SU2) :
    rightCasimir (matrixElement d i k) g =
      -((d / 2 : ℂ) * (d / 2 + 1)) * matrixElement d i k g := by
  sorry

/-- **Matrix elements are eigenfunctions of the left Casimir**, with eigenvalue `-j(j+1)`. -/
theorem leftCasimir_matrixElement (d : ℕ) (i k : Fin (d + 1)) (g : SU2) :
    leftCasimir (matrixElement d i k) g =
      -((d / 2 : ℂ) * (d / 2 + 1)) * matrixElement d i k g := by
  sorry

/-- **Matrix elements are eigenfunctions of `eulerLaplacian`** on the chart, with eigenvalue
`-j(j+1)`. -/
theorem eulerLaplacian_matrixElement (d : ℕ) (i k : Fin (d + 1)) {p : ℝ × ℝ × ℝ}
    (hp : p.2.1 ∈ Ioo 0 π) :
    eulerLaplacian (fun q ↦ matrixElement d i k (euler q.1 q.2.1 q.2.2)) p =
      -((d / 2 : ℂ) * (d / 2 + 1)) * matrixElement d i k (euler p.1 p.2.1 p.2.2) := by
  sorry

/-! ## Layer 5: characters and the column index -/

/-! ### 5.1 Characters -/

/-- **The trace of `D^j` is the character of `Sym^d`.** -/
theorem sum_matrixElement_self (d : ℕ) (g : SU2) :
    ∑ i, matrixElement d i i g = (symPower d).character g := by
  sorry

/-- **Characters are Chebyshev polynomials:** `χ_j(g) = U_{2j}(tr g / 2)`. -/
theorem sum_matrixElement_self_eq_chebyshevU (d : ℕ) (g : SU2) :
    ∑ i, matrixElement d i i g =
      (Chebyshev.U ℂ d).eval (Matrix.trace (g : Matrix (Fin 2) (Fin 2) ℂ) / 2) := by
  sorry

/-- **The character in Euler angles:** `χ_j = U_{2j}(cos(β/2) cos((α+γ)/2))`. -/
theorem sum_matrixElement_self_euler (d : ℕ) (α β γ : ℝ) :
    ∑ i, matrixElement d i i (euler α β γ) =
      (((Chebyshev.U ℝ d).eval (Real.cos (β / 2) * Real.cos ((α + γ) / 2)) : ℝ) : ℂ) := by
  sorry

/-! ### 5.2 Krawtchouk polynomials -/

/-- The Krawtchouk polynomial `K_s(x; p, N) = Σ_{k ≤ s} (-s)_k (-x)_k / ((-N)_k k!) p^{-k}`
(DLMF 18.20.6), as a function of `x`. The theorems use it for `s ≤ N` and `p ≠ 0`. -/
def krawtchouk (N s : ℕ) (p x : ℝ) : ℝ :=
  ∑ k ∈ Finset.range (s + 1),
    (ascPochhammer ℝ k).eval (-(s : ℝ)) * (ascPochhammer ℝ k).eval (-x) /
      ((ascPochhammer ℝ k).eval (-(N : ℝ)) * k.factorial) * (p⁻¹) ^ k

/-- **Matrix elements as Krawtchouk polynomials of the column index.** For `0 < β < π` and
`i, k ≤ d`, with `s = sin(β/2)`, `c = cos(β/2)`:
`d_{ik}(β) c^d = (-1)^k d! / √(i! k! (d-i)! (d-k)!) s^{i+k} c^{2d-i-k} K_i(k; s², d)`. -/
theorem wignerSmallD_eq_krawtchouk (d i k : ℕ) (hi : i ≤ d) (hk : k ≤ d) {β : ℝ}
    (hβ : β ∈ Ioo 0 π) :
    wignerSmallD d i k β * Real.cos (β / 2) ^ d =
      (-1) ^ k * d.factorial /
          Real.sqrt (i.factorial * k.factorial * (d - i).factorial * (d - k).factorial) *
        Real.sin (β / 2) ^ (i + k) * Real.cos (β / 2) ^ (2 * d - i - k) *
        krawtchouk d i (Real.sin (β / 2) ^ 2) k := by
  sorry

/-- **Krawtchouk orthogonality, from unitarity.** For `0 < p < 1` and `s, q ≤ N`. -/
theorem krawtchouk_orthogonal (N s q : ℕ) (hs : s ≤ N) (hq : q ≤ N) {p : ℝ}
    (hp : p ∈ Ioo 0 1) :
    ∑ x ∈ Finset.range (N + 1), (N.choose x : ℝ) * p ^ x * (1 - p) ^ (N - x) *
        krawtchouk N s p x * krawtchouk N q p x =
      if s = q then ((1 - p) / p) ^ s / N.choose s else 0 := by
  sorry

/-! ## Layer 6: the sphere and the Gel'fand pair -/

/-! ### 6.1 Spherical harmonics as matrix elements -/

/-- The point of `S²` with polar angle `θ` and azimuth `φ`. -/
def spherePoint (θ φ : ℝ) : EuclideanSpace ℝ (Fin 3) :=
  WithLp.toLp 2 ![Real.sin θ * Real.cos φ, Real.sin θ * Real.sin φ, Real.cos θ]

/-- The image `R(g) e₃` of the north pole under the rotation `pauliRotation g`. -/
def orbitPoint (g : SU2) : EuclideanSpace ℝ (Fin 3) :=
  WithLp.toLp 2 (pauliRotation g *ᵥ ![0, 0, 1])

/-- **The spherical harmonic** `Y_l^m` of DLMF 14.30.1, `m = i - l`, as a polynomial on `ℝ³`:
`N_{l|m|} w^{|m|} P_l^{(|m|)}(x₃)` with `w = -(x₁ + i x₂)` for `m ≥ 0` (the Condon–Shortley phase)
and `w = x₁ - i x₂` for `m < 0`, and `N_{lk} = √((2l+1)/(4π) (l-k)!/(l+k)!)`. -/
def sphericalHarmonic (l i : ℕ) (x : EuclideanSpace ℝ (Fin 3)) : ℂ :=
  (Real.sqrt ((2 * l + 1) / (4 * π) *
      ((l - Int.natAbs ((i : ℤ) - l)).factorial /
        (l + Int.natAbs ((i : ℤ) - l)).factorial)) : ℂ) *
    (if l ≤ i then (-(x 0 + I * x 1)) ^ (i - l) else (x 0 - I * x 1) ^ (l - i)) *
    ((((derivative^[Int.natAbs ((i : ℤ) - l)]) (jacobi (0 : ℝ) 0 l)).eval (x 2) : ℝ) : ℂ)

/-- **A column of `D^l` is a spherical harmonic** (Edmonds (4.1.25)):
`D^l_{m0}(αβγ) = (-1)^m √(4π/(2l+1)) Y_l^m(β, α)`, with `m = i - l`. -/
theorem matrixElement_euler_column (l : ℕ) (i : Fin (2 * l + 1)) (α β γ : ℝ) :
    matrixElement (2 * l) i ⟨l, by omega⟩ (euler α β γ) =
      (-1) ^ (i + l : ℕ) * Real.sqrt (4 * π / (2 * l + 1)) *
        sphericalHarmonic l i (spherePoint β α) := by
  sorry

/-- **A row of `D^l` is a spherical harmonic** (Edmonds (4.1.25)):
`D^l_{0m}(αβγ) = √(4π/(2l+1)) Y_l^m(β, γ)`, with `m = i - l`. -/
theorem matrixElement_euler_row (l : ℕ) (i : Fin (2 * l + 1)) (α β γ : ℝ) :
    matrixElement (2 * l) ⟨l, by omega⟩ i (euler α β γ) =
      Real.sqrt (4 * π / (2 * l + 1)) * sphericalHarmonic l i (spherePoint β γ) := by
  sorry

/-- **Spherical harmonics on the orbit of the north pole:**
`Y_l^m(R(g) e₃) = √((2l+1)/(4π)) conj D^l_{m0}(g)`. -/
theorem sphericalHarmonic_orbitPoint (l : ℕ) (i : Fin (2 * l + 1)) (g : SU2) :
    sphericalHarmonic l i (orbitPoint g) =
      Real.sqrt ((2 * l + 1) / (4 * π)) * conj (matrixElement (2 * l) i ⟨l, by omega⟩ g) := by
  sorry

/-- **The rotation law** `Y_l^m(R(g)⁻¹ x) = Σ_{m'} D^l_{m'm}(g) Y_l^{m'}(x)` for unit vectors `x`.
(Off the sphere the polynomial `sphericalHarmonic l i` is not homogeneous for `l ≥ 2`, and the
law fails.) -/
theorem sphericalHarmonic_rotation (l : ℕ) (i : Fin (2 * l + 1)) (g : SU2)
    (x : EuclideanSpace ℝ (Fin 3)) (hx : ‖x‖ = 1) :
    sphericalHarmonic l i (WithLp.toLp 2 (pauliRotation g⁻¹ *ᵥ WithLp.ofLp x)) =
      ∑ j : Fin (2 * l + 1), matrixElement (2 * l) j i g * sphericalHarmonic l j x := by
  sorry

/-! ### 6.2 Laplacians -/

/-- **The Laplace–Beltrami operator of `S²` in polar coordinates** `q = (θ, φ)`:
`∂²_θ + cot θ ∂_θ + sin⁻² θ ∂²_φ`, meaningful for `0 < θ < π`. -/
def sphereLaplacian (u : ℝ × ℝ → ℂ) (q : ℝ × ℝ) : ℂ :=
  deriv (fun θ ↦ deriv (fun θ' ↦ u (θ', q.2)) θ) q.1 +
    (Real.cot q.1 : ℂ) * deriv (fun θ ↦ u (θ, q.2)) q.1 +
    deriv (fun φ ↦ deriv (fun φ' ↦ u (q.1, φ')) φ) q.2 / (Real.sin q.1 : ℂ) ^ 2

/-- Supporting step: **the Laplacian of SU(2) on functions independent of `γ`** is that of `S²`
in the polar coordinates `(θ, φ) = (β, α)`. -/
theorem eulerLaplacian_sphere (u : ℝ × ℝ → ℂ) (p : ℝ × ℝ × ℝ) :
    eulerLaplacian (fun r ↦ u (r.2.1, r.1)) p = sphereLaplacian u (p.2.1, p.1) := by
  simp [eulerLaplacian, sphereLaplacian]

/-! ### 6.3 Harmonic analysis on the sphere -/

/-- **The surface measure in polar coordinates.** For measurable `F ≥ 0` on `ℝ³`,
`∫⁻ F d(toSphere) = ∫⁻_{(0, π) × (0, 2π)} F(spherePoint θ φ) sin θ dθ dφ`. -/
theorem lintegral_toSphere_eq_setLIntegral_spherePoint
    (F : EuclideanSpace ℝ (Fin 3) → ENNReal) (hF : Measurable F) :
    ∫⁻ x, F x ∂(volume : Measure (EuclideanSpace ℝ (Fin 3))).toSphere =
      ∫⁻ p in Ioo 0 π ×ˢ Ioo 0 (2 * π),
        F (spherePoint p.1 p.2) * ENNReal.ofReal (Real.sin p.1) := by
  sorry

/-- **The surface measure in polar coordinates**, for the Bochner integral of a function
integrable on the sphere. -/
theorem integral_toSphere_eq_setIntegral_spherePoint (F : EuclideanSpace ℝ (Fin 3) → ℂ)
    (hF : Integrable (fun x : Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1 ↦ F x)
      (volume : Measure (EuclideanSpace ℝ (Fin 3))).toSphere) :
    ∫ x, F x ∂(volume : Measure (EuclideanSpace ℝ (Fin 3))).toSphere =
      ∫ p in Ioo 0 π ×ˢ Ioo 0 (2 * π), Real.sin p.1 • F (spherePoint p.1 p.2) := by
  sorry

/-! ### 6.4 The Gel'fand pair (SU(2), T) -/

/-- Convolution on `SU(2)` for the normalized Haar measure. -/
def convolution (f₁ f₂ : SU2 → ℂ) (g : SU2) : ℂ :=
  ∫ h, f₁ h * f₂ (h⁻¹ * g) ∂haarProb SU2

/-- **Gel'fand's criterion.** Every `g⁻¹` lies in `T g T` for the torus `T`. -/
theorem exists_torus_mul_mul_eq_inv (g : SU2) :
    ∃ k₁ ∈ torus, ∃ k₂ ∈ torus, k₁ * g * k₂ = g⁻¹ := by
  sorry

/-- **The bi-invariant functions commute.** Convolution of continuous bi-`T`-invariant functions
is commutative. -/
theorem convolution_comm (f₁ f₂ : SU2 → ℂ) (hf₁ : Continuous f₁) (hf₂ : Continuous f₂)
    (hT₁ : ∀ k₁ ∈ torus, ∀ k₂ ∈ torus, ∀ g, f₁ (k₁ * g * k₂) = f₁ g)
    (hT₂ : ∀ k₁ ∈ torus, ∀ k₂ ∈ torus, ∀ g, f₂ (k₁ * g * k₂) = f₂ g) :
    convolution f₁ f₂ = convolution f₂ f₁ := by
  sorry

/-- **The zonal spherical functions** of the Gel'fand pair (SU(2), T). A continuous
bi-`T`-invariant `φ` with `φ(1) = 1` is an eigenfunction of convolution by every continuous
bi-`T`-invariant function if and only if `φ = D^l_{00} = P_l(cos β)` for some `l`. -/
theorem eq_matrixElement_zonal_iff (φ : SU2 → ℂ) (hφ : Continuous φ)
    (hT : ∀ k₁ ∈ torus, ∀ k₂ ∈ torus, ∀ g, φ (k₁ * g * k₂) = φ g) (h1 : φ 1 = 1) :
    (∀ f : SU2 → ℂ, Continuous f → (∀ k₁ ∈ torus, ∀ k₂ ∈ torus, ∀ g, f (k₁ * g * k₂) = f g) →
        ∃ c : ℂ, convolution f φ = c • φ) ↔
      ∃ l : ℕ, φ = matrixElement (2 * l) ⟨l, by omega⟩ ⟨l, by omega⟩ := by
  sorry

/-- **The zonal spherical functions through the functional equation.** A continuous
bi-`T`-invariant `φ` with `φ(1) = 1` satisfies
`(2π)⁻¹ ∫_0^{2π} φ(g · torusExp t · h) dt = φ(g) φ(h)` for all `g, h` if and only if
`φ = D^l_{00}` for some `l`. -/
theorem eq_matrixElement_zonal_iff_integral_mul_torusExp_mul (φ : SU2 → ℂ) (hφ : Continuous φ)
    (hT : ∀ k₁ ∈ torus, ∀ k₂ ∈ torus, ∀ g, φ (k₁ * g * k₂) = φ g) (h1 : φ 1 = 1) :
    (∀ g h : SU2, ((2 * π)⁻¹ : ℂ) * ∫ t in (0 : ℝ)..(2 * π), φ (g * torusExp t * h) = φ g * φ h) ↔
      ∃ l : ℕ, φ = matrixElement (2 * l) ⟨l, by omega⟩ ⟨l, by omega⟩ := by
  sorry

/-! ## Supplier contracts consumed (README, Exact supplier contracts) -/

#check @TauCeti.SU2.symPowerModel
#check @TauCeti.SU2.symPower
#check @TauCeti.SU2.weightBasis
#check @TauCeti.SU2.continuous_symPowerModel
#check @TauCeti.SU2.isIrreducible_symPowerModel
#check @TauCeti.SU2.existsUnique_nonempty_equiv_symPower
#check @TauCeti.SU2.torusExp
#check @TauCeti.SU2.torus
#check @TauCeti.SU2.weyl_integration_formula
#check @TauCeti.SU2.character_symPower_eq_chebyshevU_eval
#check @TauCeti.haarProb
#check @TauCeti.IrrepModel
#check @TauCeti.IsIrrepSkeleton
#check @TauCeti.peterWeylBasis
#check @TauCeti.coe_peterWeylBasis
#check @ContRepresentation.schur_orthogonality
#check @ContinuousLinearEquiv.congr
#check @ContinuousLinearEquiv.continuous_congr
#check @ContinuousLinearEquiv.isIrreducible_congr
#check @ContRepresentation.matrixCoeff
#check @ContRepresentation.IsUnitary
#check @Polynomial.Chebyshev.U
#check @ordinaryHypergeometric
#check @MeasureTheory.Measure.toSphere
#check @MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul
#check @MeasureTheory.lintegral_image_eq_lintegral_abs_det_fderiv_mul
#check @TauCeti.krawtchouk
#check @TauCeti.convolutionCLM
#check @TauCeti.convolutionCLM_toLp_apply

end TauCetiRoadmap.SpecialFunctionsSU2MatrixElements
