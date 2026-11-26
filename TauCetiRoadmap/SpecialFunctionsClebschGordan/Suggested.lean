module

public import Mathlib
public import TauCeti.RepresentationTheory.Continuous.Transport
public import TauCeti.RepresentationTheory.Continuous.TensorProduct
public import TauCeti.RepresentationTheory.SU2.Exhaustion
public import TauCeti.RepresentationTheory.Compact.SchurOrthogonality

/-!
# Clebsch–Gordan and Racah theory for SU(2), Hahn and Racah polynomials: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions), after Edmonds, *Angular Momentum in Quantum Mechanics*, which
agree with DLMF Chapter 34: a spin `j = d / 2` is given by `d : ℕ`, and a magnetic quantum number
`m = i - d / 2` by its index `i : ℕ`, valid when `i ≤ d`; `clebschGordan d₁ d₂ d i₁ i₂ i` is
Edmonds's `(j₁ m₁ j₂ m₂ | j₁ j₂ j m)`, `threeJ` his 3-j symbol and `sixJ` his 6-j symbol, each `0`
outside its admissible range. The representation of spin `d / 2` is the unitary model of the
roadmap SpecialFunctionsSU2MatrixElements, §1.4, with its matrix elements `matrixElement` of §2.1.

Five definitions are local copies, verbatim: `monomialNorm`, `monomialScale`, `unitaryModel` and
`matrixElement` are those of SpecialFunctionsSU2MatrixElements, §§1.4 and 2.1, and `jacobi` is
the Jacobi polynomial of the LaguerreJacobi roadmap, §3.2. `monomialNorm_pos` is the supporting
step of SpecialFunctionsSU2MatrixElements that `monomialScale` needs, copied with its proof.

Bold headlines of the README not stated here: the decomposition of the tensor product as a
unitary equivalence (§1.3), the uniqueness of the coefficients by recursion (§1.7), the Regge
symmetries (§§2.1, 5.3), the `₃F₂` and `₄F₃` forms, the recursions and the values at `j₃ = 1` of
the 3-j symbol (§§2.4, 4.1, 6.1), the inverse Clebsch–Gordan series (§3.1), the product of two
spherical harmonics and Gaunt's integral (§3.3), which need the spherical harmonics of
SpecialFunctionsSU2MatrixElements, §6.1, the dual Hahn orthogonality (§4.2), and Racah's `W`
(§5.4). Of these, only the spherical-harmonic headlines of §3.3 need definitions from outside
this file; the others are statable with the definitions here and are left in prose by choice.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsClebschGordan

open TauCeti TauCeti.SU2 MeasureTheory Polynomial Set Complex Filter Topology
open scoped Real ComplexConjugate InnerProductSpace TensorProduct ComplexOrder

/-! ## Local copies from SpecialFunctionsSU2MatrixElements (§§1.4, 2.1) and LaguerreJacobi (§3.2) -/

/-- Local copy of `monomialNorm` of SpecialFunctionsSU2MatrixElements, §1.4, verbatim; the owner
is that roadmap. The positive scale `√(i! (d - i)!)`, the norm of the monomial `z₁^i z₂^{d-i}` for
the invariant inner product. -/
def monomialNorm (d : ℕ) (i : Fin (d + 1)) : ℝ :=
  Real.sqrt ((i : ℕ).factorial * (d - i).factorial)

/-- Local copy of the supporting step `monomialNorm_pos` of SpecialFunctionsSU2MatrixElements,
§1.4, with its proof: the scale `monomialNorm d i` is positive. -/
theorem monomialNorm_pos (d : ℕ) (i : Fin (d + 1)) : 0 < monomialNorm d i :=
  Real.sqrt_pos.2 (by positivity)

/-- Local copy of `monomialScale` of SpecialFunctionsSU2MatrixElements, §1.4, verbatim; the owner
is that roadmap. The diagonal change of basis `e_i ↦ √(i! (d - i)!) e_i` of the model space. -/
def monomialScale (d : ℕ) :
    EuclideanSpace ℂ (Fin (d + 1)) ≃L[ℂ] EuclideanSpace ℂ (Fin (d + 1)) :=
  LinearEquiv.toContinuousLinearEquiv <|
    (EuclideanSpace.basisFun (Fin (d + 1)) ℂ).toBasis.equiv
      ((EuclideanSpace.basisFun (Fin (d + 1)) ℂ).toBasis.unitsSMul fun i ↦
        Units.mk0 ((monomialNorm d i : ℝ) : ℂ) (ofReal_ne_zero.2 (monomialNorm_pos d i).ne'))
      (Equiv.refl _)

/-- Local copy of `unitaryModel` of SpecialFunctionsSU2MatrixElements, §1.4, verbatim; the owner
is that roadmap. Tau Ceti's `symPowerModel d` transported by `monomialScale d`; the basis vector
`e_i` is the normalized monomial `z₁^i z₂^{d-i} / √(i! (d - i)!)`, Edmonds's `u(j, m)` with
`j = d / 2`, `m = i - d / 2`. -/
def unitaryModel (d : ℕ) : ContRepresentation ℂ SU2 (EuclideanSpace ℂ (Fin (d + 1))) :=
  (monomialScale d).congr (symPowerModel d)

/-- Local copy of `matrixElement` of SpecialFunctionsSU2MatrixElements, §2.1, verbatim; the owner
is that roadmap. The matrix element `D^j_{m'm}(g) = ⟪e_{m'}, T^j(g) e_m⟫` (Edmonds (4.1.10)), with
`j = d / 2`, `m' = i - d / 2`, `m = k - d / 2`. -/
def matrixElement (d : ℕ) (i k : Fin (d + 1)) (g : SU2) : ℂ :=
  ⟪EuclideanSpace.single i (1 : ℂ), unitaryModel d g (EuclideanSpace.single k 1)⟫_ℂ

/-- Local copy of the Jacobi polynomial `P_n^{(α,β)}` of the LaguerreJacobi roadmap, §3.2
(DLMF 18.5.8), verbatim; the owner is that roadmap. `P_l = jacobi 0 0 l` is the Legendre
polynomial. -/
def jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) : R[X] :=
  ((1 : ℚ) / 2 ^ n) • ∑ k ∈ Finset.range (n + 1),
    (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      ((ascPochhammer R (n - k)).smeval (β + k + 1) *
        (ascPochhammer R k).smeval (α + (n - k : ℕ) + 1))) • ((X - 1) ^ (n - k) * (X + 1) ^ k)

/-! ## Layer 1: the coupling of two spins -/

/-! ### 1.1 Admissible triples -/

/-- **Admissible triple** (Edmonds (3.1.5); DLMF §34.2): the spins `d₁ / 2`, `d₂ / 2`, `d / 2`
satisfy the triangle conditions and `j₁ + j₂ + j` is an integer. -/
def IsTriad (d₁ d₂ d : ℕ) : Prop :=
  d ≤ d₁ + d₂ ∧ d₁ ≤ d₂ + d ∧ d₂ ≤ d₁ + d ∧ Even (d₁ + d₂ + d)

instance (d₁ d₂ d : ℕ) : Decidable (IsTriad d₁ d₂ d) := by
  unfold IsTriad; infer_instance

/-- Sanity check of the definition: admissibility is symmetric in the first two spins. -/
theorem isTriad_comm (d₁ d₂ d : ℕ) : IsTriad d₁ d₂ d ↔ IsTriad d₂ d₁ d := by
  sorry

/-- **The dimension count** `Σ_j (2j + 1) = (2j₁ + 1)(2j₂ + 1)`, over the admissible `j`. -/
theorem sum_isTriad_succ (d₁ d₂ : ℕ) :
    ∑ d ∈ (Finset.range (d₁ + d₂ + 1)).filter (IsTriad d₁ d₂), (d + 1) = (d₁ + 1) * (d₂ + 1) := by
  sorry

/-! ### 1.2 The Clebsch–Gordan coefficients -/

/-- The summand of Racah's formula (Edmonds (3.6.11)) at the summation index `z`, with
`L = j₁ + j₂ - j`:
`(-1)^z / (z! (L - z)! (j₁ - m₁ - z)! (j₂ + m₂ - z)! (j - j₂ + m₁ + z)! (j - j₁ - m₂ + z)!)`.
It is `0` unless every factorial argument is nonnegative. -/
def clebschGordanTerm (d₁ d₂ d i₁ i₂ z : ℕ) : ℝ :=
  if (d₁ + d₂ - d) / 2 ≤ z + i₁ ∧ (d₁ + d₂ - d) / 2 ≤ z + (d₂ - i₂) ∧ z ≤ d₁ - i₁ ∧
      z ≤ i₂ then
    (-1) ^ z / ((z.factorial * ((d₁ + d₂ - d) / 2 - z).factorial *
      (d₁ - i₁ - z).factorial * (i₂ - z).factorial *
      (z + i₁ - (d₁ + d₂ - d) / 2).factorial *
      (z + (d₂ - i₂) - (d₁ + d₂ - d) / 2).factorial : ℕ) : ℝ)
  else 0

/-- The factor under the square root in Racah's formula (Edmonds (3.6.11)):
`(2j+1) (j₁+j₂-j)! (j₁-j₂+j)! (-j₁+j₂+j)!/(j₁+j₂+j+1)! · Π_r (j_r + m_r)! (j_r - m_r)!`. -/
def clebschGordanPrefactor (d₁ d₂ d i₁ i₂ i : ℕ) : ℝ :=
  (((d + 1) * ((d₁ + d₂ - d) / 2).factorial * ((d₁ + d - d₂) / 2).factorial *
      ((d₂ + d - d₁) / 2).factorial * i₁.factorial * (d₁ - i₁).factorial * i₂.factorial *
      (d₂ - i₂).factorial * i.factorial * (d - i).factorial : ℕ) : ℝ) /
    (((d₁ + d₂ + d) / 2 + 1).factorial : ℕ)

/-- **The Clebsch–Gordan coefficient** `(j₁ m₁ j₂ m₂ | j₁ j₂ j m)` by Racah's formula
(Edmonds (3.6.11)), with `j_r = d_r / 2`, `m₁ = i₁ - d₁ / 2`, `m₂ = i₂ - d₂ / 2`, `m = i - d / 2`.
It is `0` unless the triple is admissible, the indices are in range and `m = m₁ + m₂`. -/
def clebschGordan (d₁ d₂ d i₁ i₂ i : ℕ) : ℝ :=
  if IsTriad d₁ d₂ d ∧ i₁ ≤ d₁ ∧ i₂ ≤ d₂ ∧ i ≤ d ∧ 2 * i + d₁ + d₂ = 2 * i₁ + 2 * i₂ + d then
    Real.sqrt (clebschGordanPrefactor d₁ d₂ d i₁ i₂ i) *
      ∑ z ∈ Finset.range ((d₁ + d₂ - d) / 2 + 1), clebschGordanTerm d₁ d₂ d i₁ i₂ z
  else 0

/-- The triangle coefficient `Δ(j₁ j₂ j₃) = √((j₁+j₂-j₃)! (j₁-j₂+j₃)! (-j₁+j₂+j₃)!/(j₁+j₂+j₃+1)!)`
(DLMF 34.2.5), for doubled spins. -/
def triangleCoefficient (d₁ d₂ d₃ : ℕ) : ℝ :=
  Real.sqrt ((((d₁ + d₂ - d₃) / 2).factorial * ((d₁ + d₃ - d₂) / 2).factorial *
    ((d₂ + d₃ - d₁) / 2).factorial : ℕ) / (((d₁ + d₂ + d₃) / 2 + 1).factorial : ℕ))

/-- Sanity check of the definition (**selection rule**): the coefficient vanishes for an
inadmissible triple. -/
theorem clebschGordan_eq_zero_of_not_isTriad {d₁ d₂ d : ℕ} (h : ¬ IsTriad d₁ d₂ d)
    (i₁ i₂ i : ℕ) : clebschGordan d₁ d₂ d i₁ i₂ i = 0 := by
  sorry

/-- Sanity check of the definition (**selection rule**): the coefficient vanishes unless
`m = m₁ + m₂`. -/
theorem clebschGordan_eq_zero_of_ne {d₁ d₂ d i₁ i₂ i : ℕ}
    (h : 2 * i + d₁ + d₂ ≠ 2 * i₁ + 2 * i₂ + d) : clebschGordan d₁ d₂ d i₁ i₂ i = 0 := by
  sorry

/-! ### 1.3 The coupled basis -/

/-- **The coupled vector** `Σ_{m₁ m₂} (j₁ m₁ j₂ m₂ | j₁ j₂ j m) e_{m₁} ⊗ e_{m₂}` of the tensor
product of the unitary models (Edmonds (3.5.1)). -/
def coupledVector (d₁ d₂ d : ℕ) (i : Fin (d + 1)) :
    EuclideanSpace ℂ (Fin (d₁ + 1)) ⊗[ℂ] EuclideanSpace ℂ (Fin (d₂ + 1)) :=
  ∑ i₁ : Fin (d₁ + 1), ∑ i₂ : Fin (d₂ + 1),
    (clebschGordan d₁ d₂ d i₁ i₂ i : ℂ) •
      (EuclideanSpace.single i₁ (1 : ℂ) ⊗ₜ[ℂ] EuclideanSpace.single i₂ (1 : ℂ))

/-- **The coupled vectors transform as the standard basis of spin `j`:**
`(T^{j₁} ⊗ T^{j₂})(g) w_{jm} = Σ_{m'} D^j_{m'm}(g) w_{jm'}`. -/
theorem tprod_coupledVector {d₁ d₂ d : ℕ} (h : IsTriad d₁ d₂ d) (g : SU2) (i : Fin (d + 1)) :
    ContRepresentation.tprod (unitaryModel d₁) (unitaryModel d₂) g (coupledVector d₁ d₂ d i) =
      ∑ k : Fin (d + 1), matrixElement d k i g • coupledVector d₁ d₂ d k := by
  sorry

/-- **The coupled vectors are orthonormal** (Edmonds (3.5.4)). -/
theorem inner_coupledVector {d₁ d₂ d d' : ℕ} (h : IsTriad d₁ d₂ d) (h' : IsTriad d₁ d₂ d')
    (i : Fin (d + 1)) (i' : Fin (d' + 1)) :
    ⟪coupledVector d₁ d₂ d i, coupledVector d₁ d₂ d' i'⟫_ℂ =
      if d = d' ∧ (i : ℕ) = i' then 1 else 0 := by
  sorry

/-- **The coupled vectors span the tensor product** (Edmonds (3.5.2)). -/
theorem span_coupledVector (d₁ d₂ : ℕ) :
    Submodule.span ℂ {v | ∃ (d : ℕ) (i : Fin (d + 1)), IsTriad d₁ d₂ d ∧
      v = coupledVector d₁ d₂ d i} = ⊤ := by
  sorry

/-- **The Condon–Shortley phase** (Edmonds (3.5.11)):
`(j₁ j₁ j₂ (j - j₁) | j₁ j₂ j j) > 0`. -/
theorem clebschGordan_pos {d₁ d₂ d : ℕ} (h : IsTriad d₁ d₂ d) :
    0 < clebschGordan d₁ d₂ d d₁ ((d + d₂ - d₁) / 2) d := by
  sorry

/-- **Uniqueness of the coupled basis.** A family transforming as the standard basis of spin `j`,
whose top vector has norm `1` and a positive component along `e_{j₁} ⊗ e_{j - j₁}`, is the coupled
basis (the conventions (3.4.1)–(3.4.2) of Edmonds). -/
theorem eq_coupledVector_of_tprod {d₁ d₂ d : ℕ} (h : IsTriad d₁ d₂ d)
    (v : Fin (d + 1) → EuclideanSpace ℂ (Fin (d₁ + 1)) ⊗[ℂ] EuclideanSpace ℂ (Fin (d₂ + 1)))
    (hv : ∀ (g : SU2) (k : Fin (d + 1)),
      ContRepresentation.tprod (unitaryModel d₁) (unitaryModel d₂) g (v k) =
        ∑ k' : Fin (d + 1), matrixElement d k' k g • v k')
    (hn : ‖v (Fin.last d)‖ = 1)
    (hp : 0 < ⟪EuclideanSpace.single (Fin.last d₁) (1 : ℂ) ⊗ₜ[ℂ]
        EuclideanSpace.single (⟨(d + d₂ - d₁) / 2, by have := h.1; omega⟩ : Fin (d₂ + 1)) 1,
      v (Fin.last d)⟫_ℂ) (k : Fin (d + 1)) :
    v k = coupledVector d₁ d₂ d k := by
  sorry

/-! ### 1.4 Orthogonality -/

/-- **Orthogonality in the coupled indices** (Edmonds (3.5.4)). -/
theorem sum_clebschGordan_mul_clebschGordan {d₁ d₂ d d' i i' : ℕ} (h : IsTriad d₁ d₂ d)
    (hi : i ≤ d) :
    ∑ i₁ ∈ Finset.range (d₁ + 1), ∑ i₂ ∈ Finset.range (d₂ + 1),
        clebschGordan d₁ d₂ d i₁ i₂ i * clebschGordan d₁ d₂ d' i₁ i₂ i' =
      if d = d' ∧ i = i' then 1 else 0 := by
  sorry

/-- **Orthogonality in the product indices** (Edmonds (3.5.3)). -/
theorem sum_clebschGordan_mul_clebschGordan_right {d₁ d₂ i₁ i₂ i₁' i₂' : ℕ} (h₁ : i₁ ≤ d₁)
    (h₂ : i₂ ≤ d₂) (h₁' : i₁' ≤ d₁) (h₂' : i₂' ≤ d₂) :
    ∑ d ∈ Finset.range (d₁ + d₂ + 1), ∑ i ∈ Finset.range (d + 1),
        clebschGordan d₁ d₂ d i₁ i₂ i * clebschGordan d₁ d₂ d i₁' i₂' i =
      if i₁ = i₁' ∧ i₂ = i₂' then 1 else 0 := by
  sorry

/-! ### 1.5 Symmetries -/

/-- **Exchange of the two spins** (Edmonds (3.5.14)):
`(j₁ m₁ j₂ m₂ | j m) = (-1)^{j₁ + j₂ - j} (j₂ m₂ j₁ m₁ | j m)`. -/
theorem clebschGordan_swap (d₁ d₂ d i₁ i₂ i : ℕ) :
    clebschGordan d₁ d₂ d i₁ i₂ i =
      (-1) ^ ((d₁ + d₂ - d) / 2) * clebschGordan d₂ d₁ d i₂ i₁ i := by
  sorry

/-- **Reversal of the magnetic quantum numbers** (Edmonds (3.5.17)):
`(j₁ m₁ j₂ m₂ | j m) = (-1)^{j₁ + j₂ - j} (j₁ -m₁ j₂ -m₂ | j -m)`. -/
theorem clebschGordan_reflect {d₁ d₂ d i₁ i₂ i : ℕ} (h₁ : i₁ ≤ d₁) (h₂ : i₂ ≤ d₂) (h : i ≤ d) :
    clebschGordan d₁ d₂ d i₁ i₂ i =
      (-1) ^ ((d₁ + d₂ - d) / 2) * clebschGordan d₁ d₂ d (d₁ - i₁) (d₂ - i₂) (d - i) := by
  sorry

/-- **Exchange of the second and the coupled spin** (Edmonds (3.5.15)):
`(j₁ m₁ j₂ m₂ | j₃ m₃) = (-1)^{j₁ - m₁} √((2j₃ + 1)/(2j₂ + 1)) (j₁ m₁ j₃ -m₃ | j₂ -m₂)`. -/
theorem clebschGordan_rotate {d₁ d₂ d i₁ i₂ i : ℕ} (h₁ : i₁ ≤ d₁) (h₂ : i₂ ≤ d₂) (h : i ≤ d) :
    clebschGordan d₁ d₂ d i₁ i₂ i =
      (-1) ^ (d₁ - i₁) * Real.sqrt ((d + 1) / (d₂ + 1)) *
        clebschGordan d₁ d d₂ i₁ (d - i) (d₂ - i₂) := by
  sorry

/-! ### 1.6 Special values -/

/-- **Coupling with spin zero** (Edmonds (3.5.12)): `(j m 0 0 | j 0 j m) = 1`. -/
theorem clebschGordan_zero_right {d i : ℕ} (h : i ≤ d) : clebschGordan d 0 d i 0 i = 1 := by
  sorry

/-- **Coupling to spin zero** (Edmonds (3.5.13)):
`(j m j -m | j j 0 0) = (-1)^{j - m} / √(2j + 1)`. -/
theorem clebschGordan_spin_zero {d i : ℕ} (h : i ≤ d) :
    clebschGordan d d 0 i (d - i) 0 = (-1) ^ (d - i) / Real.sqrt (d + 1) := by
  sorry

/-- **The stretched coefficient** `j = j₁ + j₂` (Edmonds, p. 45):
`√((2j₁)! (2j₂)! (j + m)! (j - m)! / ((2j)! (j₁ + m₁)! (j₁ - m₁)! (j₂ + m₂)! (j₂ - m₂)!))`. -/
theorem clebschGordan_stretched {d₁ d₂ i₁ i₂ : ℕ} (h₁ : i₁ ≤ d₁) (h₂ : i₂ ≤ d₂) :
    clebschGordan d₁ d₂ (d₁ + d₂) i₁ i₂ (i₁ + i₂) =
      Real.sqrt (((d₁.factorial * d₂.factorial * (i₁ + i₂).factorial *
          (d₁ + d₂ - i₁ - i₂).factorial : ℕ) : ℝ) /
        (((d₁ + d₂).factorial * i₁.factorial * (d₁ - i₁).factorial * i₂.factorial *
          (d₂ - i₂).factorial : ℕ) : ℝ)) := by
  sorry

/-- **Coupling with spin one half, `j = j₁ + 1/2`, `m₂ = 1/2`:**
`(j₁ m₁ ½ ½ | j₁ + ½, m) = √((j₁ + m + ½)/(2j₁ + 1))`. -/
theorem clebschGordan_spinHalf {d i : ℕ} (h : i ≤ d) :
    clebschGordan d 1 (d + 1) i 1 (i + 1) = Real.sqrt ((i + 1) / (d + 1)) := by
  sorry

/-! ### 1.7 Recursion relations -/

/-- **The lowering recursion** (Edmonds (3.5.9)), with `m` shifted by one:
`√((j + m + 1)(j - m)) (m₁ m₂ | j m) = √((j₁ + m₁ + 1)(j₁ - m₁)) (m₁ + 1, m₂ | j, m + 1)
+ √((j₂ + m₂ + 1)(j₂ - m₂)) (m₁, m₂ + 1 | j, m + 1)`. -/
theorem clebschGordan_lowering (d₁ d₂ d i₁ i₂ i : ℕ) :
    Real.sqrt (((i + 1) * (d - i) : ℕ) : ℝ) * clebschGordan d₁ d₂ d i₁ i₂ i =
      Real.sqrt (((i₁ + 1) * (d₁ - i₁) : ℕ) : ℝ) * clebschGordan d₁ d₂ d (i₁ + 1) i₂ (i + 1) +
        Real.sqrt (((i₂ + 1) * (d₂ - i₂) : ℕ) : ℝ) * clebschGordan d₁ d₂ d i₁ (i₂ + 1) (i + 1) := by
  sorry

/-- **The raising recursion** (Edmonds (3.5.10)), with `m` shifted by one:
`√((j + m + 1)(j - m)) (m₁ + 1, m₂ + 1 | j, m + 1)
= √((j₁ + m₁ + 1)(j₁ - m₁)) (m₁, m₂ + 1 | j m) + √((j₂ + m₂ + 1)(j₂ - m₂)) (m₁ + 1, m₂ | j m)`. -/
theorem clebschGordan_raising (d₁ d₂ d i₁ i₂ i : ℕ) :
    Real.sqrt (((i + 1) * (d - i) : ℕ) : ℝ) * clebschGordan d₁ d₂ d (i₁ + 1) (i₂ + 1) (i + 1) =
      Real.sqrt (((i₁ + 1) * (d₁ - i₁) : ℕ) : ℝ) * clebschGordan d₁ d₂ d i₁ (i₂ + 1) i +
        Real.sqrt (((i₂ + 1) * (d₂ - i₂) : ℕ) : ℝ) * clebschGordan d₁ d₂ d (i₁ + 1) i₂ i := by
  sorry

/-! ## Layer 2: the 3-j symbol -/

/-! ### 2.1 Definition, the conversions of DLMF §34.2, and symmetries -/

/-- **The 3-j symbol** (Edmonds (3.7.3)):
`(j₁ j₂ j₃; m₁ m₂ m₃) = (-1)^{j₁ - j₂ - m₃} (2j₃ + 1)^{-1/2} (j₁ m₁ j₂ m₂ | j₁ j₂ j₃, -m₃)`,
with `m_r = i_r - d_r / 2`; the index of `-m₃` is `d₃ - i₃`, and `2d₃` is added to the exponent
to keep it a natural number. It is `0` for `i₃ > d₃`. -/
def threeJ (d₁ d₂ d₃ i₁ i₂ i₃ : ℕ) : ℝ :=
  if i₃ ≤ d₃ then
    (-1) ^ ((d₁ + d₃ - d₂) / 2 + 2 * d₃ - i₃) / Real.sqrt (d₃ + 1) *
      clebschGordan d₁ d₂ d₃ i₁ i₂ (d₃ - i₃)
  else 0

/-- **DLMF 34.1.1:** `(j₁ m₁ j₂ m₂ | j₁ j₂ j m) = (-1)^{j₁ - j₂ + m} √(2j + 1) (j₁ j₂ j; m₁ m₂ -m)`.
On the support the exponent `j₁ - j₂ + m` has the parity of `(d₁ + d₂ - d)/2 + i + d₂`. -/
theorem clebschGordan_eq_threeJ (d₁ d₂ d i₁ i₂ : ℕ) {i : ℕ} (hi : i ≤ d) :
    clebschGordan d₁ d₂ d i₁ i₂ i =
      (-1) ^ ((d₁ + d₂ - d) / 2 + i + d₂) * Real.sqrt (d + 1) * threeJ d₁ d₂ d i₁ i₂ (d - i) := by
  sorry

/-- **Racah's single-sum form of the 3-j symbol** (DLMF 34.2.4): on the support,
`(j₁ j₂ j₃; m₁ m₂ m₃) = (-1)^{j₁ - j₂ - m₃} Δ(j₁ j₂ j₃) √(Π_r (j_r + m_r)! (j_r - m_r)!) Σ_s …`,
with the summand of Racah's formula for the Clebsch–Gordan coefficient (`clebschGordanTerm`). -/
theorem threeJ_eq_racahSum {d₁ d₂ d₃ i₁ i₂ i₃ : ℕ} (h : IsTriad d₁ d₂ d₃) (h₁ : i₁ ≤ d₁)
    (h₂ : i₂ ≤ d₂) (h₃ : i₃ ≤ d₃) (hm : 2 * (i₁ + i₂ + i₃) = d₁ + d₂ + d₃) :
    threeJ d₁ d₂ d₃ i₁ i₂ i₃ =
      (-1) ^ ((d₁ + d₃ - d₂) / 2 + 2 * d₃ - i₃) * triangleCoefficient d₁ d₂ d₃ *
        Real.sqrt ((i₁.factorial * (d₁ - i₁).factorial * i₂.factorial * (d₂ - i₂).factorial *
          i₃.factorial * (d₃ - i₃).factorial : ℕ) : ℝ) *
        ∑ s ∈ Finset.range ((d₁ + d₂ - d₃) / 2 + 1), clebschGordanTerm d₁ d₂ d₃ i₁ i₂ s := by
  sorry

/-- **Even permutations** (Edmonds (3.7.4); DLMF 34.3.8). -/
theorem threeJ_cycle (d₁ d₂ d₃ i₁ i₂ i₃ : ℕ) :
    threeJ d₁ d₂ d₃ i₁ i₂ i₃ = threeJ d₂ d₃ d₁ i₂ i₃ i₁ := by
  sorry

/-- **Odd permutations** (Edmonds (3.7.5); DLMF 34.3.9): a factor `(-1)^{j₁ + j₂ + j₃}`. For an
odd sum of the doubled spins both sides are `0`. -/
theorem threeJ_swap (d₁ d₂ d₃ i₁ i₂ i₃ : ℕ) :
    threeJ d₁ d₂ d₃ i₁ i₂ i₃ = (-1) ^ ((d₁ + d₂ + d₃) / 2) * threeJ d₂ d₁ d₃ i₂ i₁ i₃ := by
  sorry

/-- **Reversal of the magnetic quantum numbers** (Edmonds (3.7.6); DLMF 34.3.10). For an odd sum
of the doubled spins both sides are `0`. -/
theorem threeJ_reflect {d₁ d₂ d₃ i₁ i₂ i₃ : ℕ} (h₁ : i₁ ≤ d₁) (h₂ : i₂ ≤ d₂) (h₃ : i₃ ≤ d₃) :
    threeJ d₁ d₂ d₃ i₁ i₂ i₃ =
      (-1) ^ ((d₁ + d₂ + d₃) / 2) * threeJ d₁ d₂ d₃ (d₁ - i₁) (d₂ - i₂) (d₃ - i₃) := by
  sorry

/-! ### 2.2 Orthogonality -/

/-- **Orthogonality in `(j₃, m₃)`** (Edmonds (3.7.8); DLMF 34.3.16). -/
theorem sum_threeJ_mul_threeJ {d₁ d₂ d₃ d₃' i₃ i₃' : ℕ} (h₃ : i₃ ≤ d₃) (h₃' : i₃' ≤ d₃') :
    ((d₃ + 1 : ℕ) : ℝ) * ∑ i₁ ∈ Finset.range (d₁ + 1), ∑ i₂ ∈ Finset.range (d₂ + 1),
        threeJ d₁ d₂ d₃ i₁ i₂ i₃ * threeJ d₁ d₂ d₃' i₁ i₂ i₃' =
      if d₃ = d₃' ∧ i₃ = i₃' ∧ IsTriad d₁ d₂ d₃ then 1 else 0 := by
  sorry

/-- **Orthogonality in `(m₁, m₂)`** (Edmonds (3.7.7); DLMF 34.3.17). -/
theorem sum_threeJ_mul_threeJ_right {d₁ d₂ i₁ i₂ i₁' i₂' : ℕ} (h₁ : i₁ ≤ d₁) (h₂ : i₂ ≤ d₂)
    (h₁' : i₁' ≤ d₁) (h₂' : i₂' ≤ d₂) :
    ∑ d₃ ∈ Finset.range (d₁ + d₂ + 1), ∑ i₃ ∈ Finset.range (d₃ + 1),
        ((d₃ + 1 : ℕ) : ℝ) * threeJ d₁ d₂ d₃ i₁ i₂ i₃ * threeJ d₁ d₂ d₃ i₁' i₂' i₃ =
      if i₁ = i₁' ∧ i₂ = i₂' then 1 else 0 := by
  sorry

/-! ### 2.3 Special values -/

/-- Sanity check of the definition (**spin zero**, DLMF 34.3.1):
`(j j 0; m -m 0) = (-1)^{j - m} / √(2j + 1)`; it is `clebschGordan_spin_zero` through the
definition of `threeJ`. -/
theorem threeJ_spin_zero {d i : ℕ} (h : i ≤ d) :
    threeJ d d 0 i (d - i) 0 = (-1) ^ (d - i) / Real.sqrt (d + 1) := by
  sorry

/-- **Vanishing magnetic numbers, odd sum** (Edmonds (3.7.14); DLMF 34.3.5). -/
theorem threeJ_zero_zero_zero_of_odd {l₁ l₂ l₃ : ℕ} (h : Odd (l₁ + l₂ + l₃)) :
    threeJ (2 * l₁) (2 * l₂) (2 * l₃) l₁ l₂ l₃ = 0 := by
  sorry

/-- **Vanishing magnetic numbers, even sum** (Edmonds (3.7.17); DLMF 34.3.5). With
`J = l₁ + l₂ + l₃ = 2g`:
`(l₁ l₂ l₃; 0 0 0) = (-1)^g √((J - 2l₁)! (J - 2l₂)! (J - 2l₃)!/(J + 1)!) g!/((g - l₁)! (g - l₂)!
(g - l₃)!)`. -/
theorem threeJ_zero_zero_zero_of_even {l₁ l₂ l₃ g : ℕ} (h : IsTriad (2 * l₁) (2 * l₂) (2 * l₃))
    (hg : l₁ + l₂ + l₃ = 2 * g) :
    threeJ (2 * l₁) (2 * l₂) (2 * l₃) l₁ l₂ l₃ =
      (-1) ^ g * Real.sqrt ((((2 * g - 2 * l₁).factorial * (2 * g - 2 * l₂).factorial *
          (2 * g - 2 * l₃).factorial : ℕ) : ℝ) / ((2 * g + 1).factorial : ℕ)) *
        (g.factorial / ((g - l₁).factorial * (g - l₂).factorial * (g - l₃).factorial : ℕ)) := by
  sorry

/-! ## Layer 3: products of matrix elements -/

/-! ### 3.1 The Clebsch–Gordan series -/

/-- **The product of two matrix elements** (Edmonds (4.3.1); Wawrzyńczyk (8.7.7)):
`D^{j₁}_{m₁'m₁} D^{j₂}_{m₂'m₂} = Σ_{j} (j₁ m₁' j₂ m₂' | j m') D^j_{m'm} (j₁ m₁ j₂ m₂ | j m)`. -/
theorem matrixElement_mul_matrixElement (d₁ d₂ : ℕ) (a₁ b₁ : Fin (d₁ + 1))
    (a₂ b₂ : Fin (d₂ + 1)) (g : SU2) :
    matrixElement d₁ a₁ b₁ g * matrixElement d₂ a₂ b₂ g =
      ∑ d ∈ Finset.range (d₁ + d₂ + 1), ∑ k : Fin (d + 1), ∑ l : Fin (d + 1),
        (clebschGordan d₁ d₂ d a₁ a₂ k * clebschGordan d₁ d₂ d b₁ b₂ l : ℝ) *
          matrixElement d k l g := by
  sorry

/-- **The Clebsch–Gordan series of characters** (Wawrzyńczyk (8.7.2)):
`χ_{j₁} χ_{j₂} = Σ_j χ_j` over the admissible `j`. -/
theorem character_mul_character (d₁ d₂ : ℕ) (g : SU2) :
    (∑ i, matrixElement d₁ i i g) * (∑ i, matrixElement d₂ i i g) =
      ∑ d ∈ (Finset.range (d₁ + d₂ + 1)).filter (IsTriad d₁ d₂), ∑ i : Fin (d + 1),
        matrixElement d i i g := by
  sorry

/-! ### 3.2 Integrals of three matrix elements -/

/-- **The integral of three matrix elements** (Edmonds (4.6.2)):
`∫_{SU(2)} D^{j₁}_{m₁'m₁} D^{j₂}_{m₂'m₂} D^{j₃}_{m₃'m₃}` is
`(j₁ j₂ j₃; m₁' m₂' m₃') (j₁ j₂ j₃; m₁ m₂ m₃)`, for the Haar probability measure. -/
theorem integral_matrixElement_mul_mul (d₁ d₂ d₃ : ℕ) (a₁ b₁ : Fin (d₁ + 1))
    (a₂ b₂ : Fin (d₂ + 1)) (a₃ b₃ : Fin (d₃ + 1)) :
    ∫ g, matrixElement d₁ a₁ b₁ g * matrixElement d₂ a₂ b₂ g * matrixElement d₃ a₃ b₃ g
        ∂haarProb SU2 =
      ((threeJ d₁ d₂ d₃ a₁ a₂ a₃ * threeJ d₁ d₂ d₃ b₁ b₂ b₃ : ℝ) : ℂ) := by
  sorry

/-! ### 3.3 Legendre polynomials -/

/-- **Linearization of products of Legendre polynomials** (DLMF 34.3.19):
`P_{l₁} P_{l₂} = Σ_l (2l + 1) (l₁ l₂ l; 0 0 0)² P_l`. -/
theorem jacobi_mul_jacobi (l₁ l₂ : ℕ) :
    jacobi (0 : ℝ) 0 l₁ * jacobi (0 : ℝ) 0 l₂ =
      ∑ l ∈ Finset.range (l₁ + l₂ + 1),
        ((2 * l + 1 : ℝ) * threeJ (2 * l₁) (2 * l₂) (2 * l) l₁ l₂ l ^ 2) • jacobi (0 : ℝ) 0 l := by
  sorry

/-- **The integral of three Legendre polynomials** (Edmonds (4.6.4); DLMF 34.3.21):
`∫_{-1}^{1} P_{l₁} P_{l₂} P_{l₃} = 2 (l₁ l₂ l₃; 0 0 0)²`; DLMF writes it with `x = cos θ`. -/
theorem integral_jacobi_mul_mul (l₁ l₂ l₃ : ℕ) :
    ∫ x in (-1 : ℝ)..1, (jacobi (0 : ℝ) 0 l₁).eval x * (jacobi (0 : ℝ) 0 l₂).eval x *
        (jacobi (0 : ℝ) 0 l₃).eval x =
      2 * threeJ (2 * l₁) (2 * l₂) (2 * l₃) l₁ l₂ l₃ ^ 2 := by
  sorry

/-! ## Layer 4: Hahn polynomials -/

/-! ### 4.1 Definition and the Clebsch–Gordan coefficients -/

/-- **The Hahn polynomial** `Q_n(x; α, β, N) = ₃F₂(-n, n + α + β + 1, -x; α + 1, -N; 1)`
(DLMF 18.20.5), as the terminating sum. The theorems use it for `n ≤ N` and `(α + 1)_n ≠ 0`. -/
def hahn (N n : ℕ) (α β x : ℝ) : ℝ :=
  ∑ k ∈ Finset.range (n + 1),
    (ascPochhammer ℝ k).eval (-(n : ℝ)) * (ascPochhammer ℝ k).eval (n + α + β + 1) *
        (ascPochhammer ℝ k).eval (-x) /
      ((ascPochhammer ℝ k).eval (α + 1) * (ascPochhammer ℝ k).eval (-(N : ℝ)) * k.factorial)

/-- **Clebsch–Gordan coefficients are Hahn polynomials** (Vilenkin–Klimyk §8.5.1, (2)–(3);
Klimyk–Vilenkin §2.2). With `j₁ = N/2`, `j₂ = (N + a + b)/2`, `j = n + (a + b)/2`,
`m₁ = N/2 - x`, `m = (a - b)/2`:
`(j₁ m₁ j₂ m₂ | j m) = (-1)^x N!/a! √((2n + a + b + 1)(a + x)! (N + b - x)! (n + a)! (n + a + b)!
/ (x! (N - x)! (n + b)! (N - n)! (N + n + a + b + 1)! n!)) Q_n(x; a, b, N)`. -/
theorem clebschGordan_eq_hahn {N n x : ℕ} (a b : ℕ) (hn : n ≤ N) (hx : x ≤ N) :
    clebschGordan N (N + a + b) (2 * n + a + b) (N - x) (x + a) (n + a) =
      (-1) ^ x * (N.factorial / a.factorial : ℝ) *
        Real.sqrt ((((2 * n + a + b + 1) * (a + x).factorial * (N + b - x).factorial *
            (n + a).factorial * (n + a + b).factorial : ℕ) : ℝ) /
          ((x.factorial * (N - x).factorial * (n + b).factorial * (N - n).factorial *
            (N + n + a + b + 1).factorial * n.factorial : ℕ) : ℝ)) *
        hahn N n a b x := by
  sorry

/-! ### 4.2 Orthogonality and reflection -/

/-- **Hahn orthogonality** (DLMF Table 18.19.1), multiplied by `2n + α + β + 1`, for real `α, β`
with `(α + 1)_n ≠ 0` and `(α + 1)_m ≠ 0`; DLMF's first range `α, β > -1` is one case. With
`w_x = (α + 1)_x (β + 1)_{N-x}/(x! (N - x)!)`,
`(2n + α + β + 1) Σ_x w_x Q_n Q_m = δ_{nm} (-1)^n (n + α + β + 1)_{N+1} (β + 1)_n n! /
((α + 1)_n (-N)_n N!)`. -/
theorem sum_hahn_mul_hahn {N n m : ℕ} (hn : n ≤ N) (hm : m ≤ N) {α β : ℝ}
    (hα : (ascPochhammer ℝ n).eval (α + 1) ≠ 0) (hα' : (ascPochhammer ℝ m).eval (α + 1) ≠ 0) :
    (2 * n + α + β + 1) * ∑ x ∈ Finset.range (N + 1),
        (ascPochhammer ℝ x).eval (α + 1) * (ascPochhammer ℝ (N - x)).eval (β + 1) /
          (x.factorial * (N - x).factorial) * hahn N n α β x * hahn N m α β x =
      if n = m then
        (-1) ^ n * (ascPochhammer ℝ (N + 1)).eval (n + α + β + 1) *
            (ascPochhammer ℝ n).eval (β + 1) * n.factorial /
          ((ascPochhammer ℝ n).eval (α + 1) * (ascPochhammer ℝ n).eval (-(N : ℝ)) * N.factorial)
      else 0 := by
  sorry

/-- **The reflection `x ↦ N - x`** (Vilenkin–Klimyk §8.5.1, (9)):
`(α + 1)_n Q_n(x; α, β, N) = (-1)^n (β + 1)_n Q_n(N - x; β, α, N)`. -/
theorem hahn_reflect {N n : ℕ} (hn : n ≤ N) {α β : ℝ}
    (hα : (ascPochhammer ℝ n).eval (α + 1) ≠ 0) (hβ : (ascPochhammer ℝ n).eval (β + 1) ≠ 0)
    (x : ℝ) :
    (ascPochhammer ℝ n).eval (α + 1) * hahn N n α β x =
      (-1) ^ n * (ascPochhammer ℝ n).eval (β + 1) * hahn N n β α (N - x) := by
  sorry

/-! ## Layer 5: recoupling and the 6-j symbol -/

/-! ### 5.1 Definitions -/

/-- The summand of Racah's formula for the 6-j symbol (Edmonds (6.3.7); DLMF 34.4.2) at the
summation index `z`; `0` unless every factorial argument is nonnegative. -/
def sixJTerm (a b c d e f z : ℕ) : ℝ :=
  if (a + b + c) / 2 ≤ z ∧ (a + e + f) / 2 ≤ z ∧ (d + b + f) / 2 ≤ z ∧
      (d + e + c) / 2 ≤ z ∧ z ≤ (b + c + e + f) / 2 ∧ z ≤ (c + a + f + d) / 2 then
    (-1) ^ z * ((z + 1).factorial : ℝ) /
      (((z - (a + b + c) / 2).factorial * (z - (a + e + f) / 2).factorial *
        (z - (d + b + f) / 2).factorial * (z - (d + e + c) / 2).factorial *
        ((a + b + d + e) / 2 - z).factorial * ((b + c + e + f) / 2 - z).factorial *
        ((c + a + f + d) / 2 - z).factorial : ℕ) : ℝ)
  else 0

/-- **The 6-j symbol** `{j₁ j₂ j₃; l₁ l₂ l₃}` by Racah's formula (Edmonds (6.3.7);
DLMF 34.4.2), for doubled spins `(a, b, c, d, e, f) = 2(j₁, j₂, j₃, l₁, l₂, l₃)`. It is `0`
unless the four triples `(j₁ j₂ j₃)`, `(j₁ l₂ l₃)`, `(l₁ j₂ l₃)`, `(l₁ l₂ j₃)` are admissible. -/
def sixJ (a b c d e f : ℕ) : ℝ :=
  if IsTriad a b c ∧ IsTriad a e f ∧ IsTriad d b f ∧ IsTriad d e c then
    triangleCoefficient a b c * triangleCoefficient a e f * triangleCoefficient d b f *
      triangleCoefficient d e c *
      ∑ z ∈ Finset.range ((a + b + d + e) / 2 + 1), sixJTerm a b c d e f z
  else 0

/-- **The recoupling coefficient** `((j₁ j₂) j₁₂, j₃; J M | j₁, (j₂ j₃) j₂₃; J M)` of three spins
(Edmonds (6.1.4)): the inner product of the two coupled vectors of `V₁ ⊗ V₂ ⊗ V₃`, written in the
product basis, with `M = I - D/2`. -/
def recouplingCoefficient (d₁ d₂ d₃ d₁₂ d₂₃ D I : ℕ) : ℝ :=
  ∑ i₁ ∈ Finset.range (d₁ + 1), ∑ i₂ ∈ Finset.range (d₂ + 1), ∑ i₃ ∈ Finset.range (d₃ + 1),
    ∑ i₁₂ ∈ Finset.range (d₁₂ + 1), ∑ i₂₃ ∈ Finset.range (d₂₃ + 1),
      clebschGordan d₁ d₂ d₁₂ i₁ i₂ i₁₂ * clebschGordan d₁₂ d₃ D i₁₂ i₃ I *
        clebschGordan d₂ d₃ d₂₃ i₂ i₃ i₂₃ * clebschGordan d₁ d₂₃ D i₁ i₂₃ I

/-! ### 5.2 The recoupling theorem -/

/-- **The recoupling theorem** (Edmonds (6.1.5)). For admissible couplings and every `M`,
`((j₁ j₂) j₁₂, j₃; J | j₁, (j₂ j₃) j₂₃; J) = (-1)^{j₁+j₂+j₃+J} √((2j₁₂+1)(2j₂₃+1))
{j₁ j₂ j₁₂; j₃ J j₂₃}`; in particular it does not depend on `M`. -/
theorem recouplingCoefficient_eq_sixJ {d₁ d₂ d₃ d₁₂ d₂₃ D I : ℕ} (h₁₂ : IsTriad d₁ d₂ d₁₂)
    (h₁₂₃ : IsTriad d₁₂ d₃ D) (h₂₃ : IsTriad d₂ d₃ d₂₃) (h₁₂₃' : IsTriad d₁ d₂₃ D)
    (hI : I ≤ D) :
    recouplingCoefficient d₁ d₂ d₃ d₁₂ d₂₃ D I =
      (-1) ^ ((d₁ + d₂ + d₃ + D) / 2) * Real.sqrt ((d₁₂ + 1) * (d₂₃ + 1)) *
        sixJ d₁ d₂ d₁₂ d₃ D d₂₃ := by
  sorry

/-- **The 6-j symbol from four 3-j symbols** (DLMF 34.4.1), with `m_r = i_r - j_r`,
`m'_r = k_r - l_r` and the sign `(-1)^{Σ (l_r + m'_r)} = (-1)^{k₁ + k₂ + k₃}`. -/
theorem sixJ_eq_sum_threeJ (a b c d e f : ℕ) :
    sixJ a b c d e f =
      ∑ i₁ ∈ Finset.range (a + 1), ∑ i₂ ∈ Finset.range (b + 1), ∑ i₃ ∈ Finset.range (c + 1),
        ∑ k₁ ∈ Finset.range (d + 1), ∑ k₂ ∈ Finset.range (e + 1), ∑ k₃ ∈ Finset.range (f + 1),
          (-1) ^ (k₁ + k₂ + k₃) * threeJ a b c i₁ i₂ i₃ * threeJ a e f i₁ k₂ (f - k₃) *
            threeJ d b f (d - k₁) i₂ k₃ * threeJ d e c k₁ (e - k₂) i₃ := by
  sorry

/-- **A 3-j symbol times a 6-j symbol** (Edmonds (6.2.8); DLMF 34.5.23). -/
theorem threeJ_mul_sixJ (a b c d e f i₁ i₂ i₃ : ℕ) :
    threeJ a b c i₁ i₂ i₃ * sixJ a b c d e f =
      ∑ k₁ ∈ Finset.range (d + 1), ∑ k₂ ∈ Finset.range (e + 1), ∑ k₃ ∈ Finset.range (f + 1),
        (-1) ^ (k₁ + k₂ + k₃) * threeJ a e f i₁ k₂ (f - k₃) * threeJ d b f (d - k₁) i₂ k₃ *
          threeJ d e c k₁ (e - k₂) i₃ := by
  sorry

/-! ### 5.3 Symmetries -/

/-- **Exchange of two columns** (Edmonds (6.2.4); DLMF 34.5.8). -/
theorem sixJ_swap_columns (a b c d e f : ℕ) : sixJ a b c d e f = sixJ b a c e d f := by
  sorry

/-- **Cyclic permutation of the columns** (Edmonds (6.2.4)). -/
theorem sixJ_cycle_columns (a b c d e f : ℕ) : sixJ a b c d e f = sixJ b c a e f d := by
  sorry

/-- **Interchange of upper and lower entries in two columns** (Edmonds (6.2.5);
DLMF 34.5.8). -/
theorem sixJ_swap_rows (a b c d e f : ℕ) : sixJ a b c d e f = sixJ d e c a b f := by
  sorry

/-! ### 5.4 Sum rules and special values -/

/-- **Orthogonality** (Edmonds (6.2.9); DLMF 34.5.14). -/
theorem sum_sixJ_mul_sixJ (a b d e f f' : ℕ)
    (h : ∃ c, IsTriad a b c ∧ IsTriad a e f ∧ IsTriad d b f ∧ IsTriad d e c) :
    ∑ c ∈ Finset.range (a + b + 1),
        ((c + 1) * (f + 1) : ℝ) * sixJ a b c d e f * sixJ a b c d e f' =
      if f = f' then 1 else 0 := by
  sorry

/-- **The Racah sum rule** (Edmonds (6.2.11); DLMF 34.5.15), for doubled spins
`(a, b, c, d) = 2(j₁, j₂, j₃, j₄)` and `j' = e/2`, `j'' = f/2`:
`Σ_j (-1)^{j + j' + j''} (2j + 1) {j₁ j₂ j; j₃ j₄ j'} {j₁ j₂ j; j₄ j₃ j''} = {j₁ j₄ j'; j₂ j₃ j''}`;
the sign is written `(-1)^{(x + e + f)/2}`, which is the stated sign wherever a term is nonzero. -/
theorem sum_sixJ_racah (a b c d e f : ℕ) :
    ∑ x ∈ Finset.range (a + b + 1),
        (-1) ^ ((x + e + f) / 2) * ((x + 1 : ℕ) : ℝ) * sixJ a b x c d e * sixJ a b x d c f =
      sixJ a d e b c f := by
  sorry

/-- **The Biedenharn–Elliott identity** (Edmonds (6.2.12); DLMF 34.5.16), for doubled spins:
`(-1)^Φ {j₁ j₂ j₃; l₁ l₂ l₃} {j₁' j₂' j₃; l₁ l₂ l₃'} = Σ_j (-1)^{l₃ + l₃' + j} (2j + 1)
{j₁ j₁' j; j₂' j₂ j₃} {l₃ l₃' j; j₁' j₁ l₂} {l₃ l₃' j; j₂' j₂ l₁}`, with
`Φ = j₁ + j₂ + j₃ + j₁' + j₂' + l₁ + l₂`. -/
theorem sixJ_mul_sixJ_biedenharnElliott (j₁ j₂ j₃ l₁ l₂ l₃ j₁' j₂' l₃' : ℕ)
    (hΦ : Even (j₁ + j₂ + j₃ + j₁' + j₂' + l₁ + l₂)) :
    (-1) ^ ((j₁ + j₂ + j₃ + j₁' + j₂' + l₁ + l₂) / 2) * sixJ j₁ j₂ j₃ l₁ l₂ l₃ *
        sixJ j₁' j₂' j₃ l₁ l₂ l₃' =
      ∑ x ∈ Finset.range (j₁ + j₁' + 1),
        (-1) ^ ((l₃ + l₃' + x) / 2) * ((x + 1 : ℕ) : ℝ) * sixJ j₁ j₁' x j₂' j₂ j₃ *
          sixJ l₃ l₃' x j₁' j₁ l₂ * sixJ l₃ l₃' x j₂' j₂ l₁ := by
  sorry

/-- **A vanishing entry** (Edmonds (6.3.2); DLMF 34.5.1):
`{j₁ j₂ j₃; 0 j₃ j₂} = (-1)^{j₁ + j₂ + j₃} / √((2j₂ + 1)(2j₃ + 1))`. -/
theorem sixJ_zero {a b c : ℕ} (h : IsTriad a b c) :
    sixJ a b c 0 c b = (-1) ^ ((a + b + c) / 2) / Real.sqrt ((b + 1) * (c + 1)) := by
  sorry

/-! ## Layer 6: Racah polynomials -/

/-! ### 6.1 Definition and the 6-j symbol -/

/-- **The Racah polynomial** `R_n(λ(y); α, β, γ, δ) = ₄F₃(-n, n + α + β + 1, -y, y + γ + δ + 1;
α + 1, β + δ + 1, γ + 1; 1)` with `λ(y) = y (y + γ + δ + 1)` (DLMF 18.26.3), as a function of
`y`, by the terminating sum. -/
def racahPolynomial (n : ℕ) (α β γ δ y : ℝ) : ℝ :=
  ∑ k ∈ Finset.range (n + 1),
    (ascPochhammer ℝ k).eval (-(n : ℝ)) * (ascPochhammer ℝ k).eval (n + α + β + 1) *
        (ascPochhammer ℝ k).eval (-y) * (ascPochhammer ℝ k).eval (y + γ + δ + 1) /
      ((ascPochhammer ℝ k).eval (α + 1) * (ascPochhammer ℝ k).eval (β + δ + 1) *
        (ascPochhammer ℝ k).eval (γ + 1) * k.factorial)

/-- **6-j symbols are Racah polynomials** (Vilenkin–Klimyk §8.5.4, (2)–(5), with the constant `C`
of (2) corrected: `(2l₃)!` for the printed `(2l₂)!`, and the sign `(-1)^{l₁+l₂+l₃+l}`, which is
missing). For doubled spins `(e₁, e₂, e₃, e) = 2(l₁, l₂, l₃, l)` and `x, n` with all factorial
arguments below nonnegative,
`{l₁ l₂ l + l₃ - x; l₃ l l₂ + l₃ - n} = C_n W_x R_n(λ(x); α, β, γ, δ)` with
`α = -2l₃ - 1`, `β = -2l₂ - 1`, `γ = -l₁ - l₂ - l₃ - l - 2`, `δ = l₁ + l₂ - l₃ - l`,
`C_n = (-1)^{l₁+l₂+l₃+l} Δ(l₁, l, l₂+l₃-n) Δ(l₂, l₃, l₂+l₃-n) (l₂-l₁+l₃+l)! (l₁+l₂+l₃+l+1)!
(2l₃)! / ((l₁-l₂-l₃+l+n)! (l-l₁+l₂+l₃-n)! (2l₃-n)! n!)` and
`W_x = Δ(l₃, l, l+l₃-x) Δ(l₁, l₂, l+l₃-x) / ((2l₃-x)! x! (l₁+l₂-l₃-l+x)! (l₂-l₁+l₃+l-x)!)`. -/
theorem sixJ_eq_racahPolynomial {e₁ e₂ e₃ e x n : ℕ} (hpar : Even (e₁ + e₂ + e₃ + e))
    (hx : x ≤ e₃) (hn : n ≤ e₃) (hx₁ : e₃ + e ≤ e₁ + e₂ + 2 * x)
    (hx₂ : e₁ + 2 * x ≤ e₂ + e₃ + e) (hn₁ : e₂ + e₃ ≤ e₁ + e + 2 * n)
    (hn₂ : e₁ + 2 * n ≤ e + e₂ + e₃) (hx₃ : 2 * x ≤ e + e₃) (hn₃ : 2 * n ≤ e₂ + e₃) :
    sixJ e₁ e₂ (e + e₃ - 2 * x) e₃ e (e₂ + e₃ - 2 * n) =
      (-1) ^ ((e₁ + e₂ + e₃ + e) / 2) *
        triangleCoefficient e₁ e (e₂ + e₃ - 2 * n) * triangleCoefficient e₂ e₃ (e₂ + e₃ - 2 * n) *
        (((e₂ + e₃ + e - e₁) / 2).factorial * ((e₁ + e₂ + e₃ + e) / 2 + 1).factorial *
          e₃.factorial : ℕ) /
        (((e₁ + e + 2 * n - e₂ - e₃) / 2).factorial * ((e + e₂ + e₃ - e₁ - 2 * n) / 2).factorial *
          (e₃ - n).factorial * n.factorial : ℕ) *
      (triangleCoefficient e₃ e (e + e₃ - 2 * x) * triangleCoefficient e₁ e₂ (e + e₃ - 2 * x) /
        (((e₃ - x).factorial * x.factorial * ((e₁ + e₂ + 2 * x - e₃ - e) / 2).factorial *
          ((e₂ + e₃ + e - e₁ - 2 * x) / 2).factorial : ℕ) : ℝ)) *
      racahPolynomial n (-(e₃ : ℝ) - 1) (-(e₂ : ℝ) - 1) (-((e₁ + e₂ + e₃ + e : ℕ) : ℝ) / 2 - 2)
        (((e₁ + e₂ : ℕ) : ℝ) / 2 - ((e₃ + e : ℕ) : ℝ) / 2) x := by
  sorry

/-! ### 6.2 Orthogonality -/

/-- **Racah orthogonality** (DLMF 18.25.9, 18.25.11–18.25.12), in the case `α + 1 = -N`, for real
`β, γ, δ` keeping every Pochhammer symbol in a denominator nonzero. -/
theorem sum_racahPolynomial_mul {N n m : ℕ} (hn : n ≤ N) (hm : m ≤ N) {β γ δ : ℝ}
    (hpar : ∀ k : ℕ, k ≤ 2 * N + 1 → β + δ + 1 + k ≠ 0 ∧ γ + 1 + k ≠ 0 ∧ γ + δ + 1 + k ≠ 0 ∧
      N + γ + δ + 2 + k ≠ 0 ∧ γ - β + 1 + k ≠ 0 ∧ δ + 1 + k ≠ 0 ∧ β - N + 1 + k ≠ 0) :
    ∑ y ∈ Finset.range (N + 1),
        racahPolynomial n (-(N : ℝ) - 1) β γ δ y * racahPolynomial m (-(N : ℝ) - 1) β γ δ y *
          ((γ + δ + 1 + 2 * y) / (γ + δ + 1 + y)) *
          ((ascPochhammer ℝ y).eval (-(N : ℝ)) * (ascPochhammer ℝ y).eval (β + δ + 1) *
              (ascPochhammer ℝ y).eval (γ + 1) * (ascPochhammer ℝ y).eval (γ + δ + 2) /
            ((ascPochhammer ℝ y).eval (N + γ + δ + 2) * (ascPochhammer ℝ y).eval (γ - β + 1) *
              (ascPochhammer ℝ y).eval (δ + 1) * y.factorial)) =
      if n = m then
        (ascPochhammer ℝ N).eval (-β) * (ascPochhammer ℝ N).eval (γ + δ + 2) /
            ((ascPochhammer ℝ N).eval (γ - β + 1) * (ascPochhammer ℝ N).eval (δ + 1)) *
          ((ascPochhammer ℝ n).eval (n + β - N) * n.factorial /
            (ascPochhammer ℝ (2 * n)).eval (β - N + 1)) *
          ((ascPochhammer ℝ n).eval (β - N - γ) * (ascPochhammer ℝ n).eval (-(N : ℝ) - δ) *
              (ascPochhammer ℝ n).eval (β + 1) /
            ((ascPochhammer ℝ n).eval (-(N : ℝ)) * (ascPochhammer ℝ n).eval (β + δ + 1) *
              (ascPochhammer ℝ n).eval (γ + 1)))
      else 0 := by
  sorry

/-! ### 6.3 Limit to the Hahn polynomials -/

/-- **Hahn polynomials as limits of Racah polynomials** (DLMF 18.26.10):
`R_n(x(x + γ + δ + 1); α, β, -N - 1, δ) → Q_n(x; α, β, N)` as `δ → ∞`. -/
theorem tendsto_racahPolynomial_hahn {N n : ℕ} {α : ℝ} (β x : ℝ) :
    Tendsto (fun δ ↦ racahPolynomial n α β (-(N : ℝ) - 1) δ x) atTop
      (𝓝 (hahn N n α β x)) := by
  sorry

#check @ContRepresentation.tprod
#check @ContRepresentation.matrixCoeff_tprod
#check @ContRepresentation.IsUnitary.tprod
#check @TensorProduct.inner_tmul
#check @Orthonormal.tmul
#check @OrthonormalBasis.tensorProduct
#check @TauCeti.SU2.symPower
#check @TauCeti.SU2.symPowerModel
#check @TauCeti.SU2.torusExp
#check @TauCeti.SU2.existsUnique_nonempty_equiv_symPower
#check @TauCeti.haarProb
#check @ContRepresentation.schur_orthogonality
#check @ascPochhammer
#check @Finset.sum
#check @Nat.factorial
#check @Real.sqrt
#check @intervalIntegral
#check @Filter.Tendsto

end TauCetiRoadmap.SpecialFunctionsClebschGordan
