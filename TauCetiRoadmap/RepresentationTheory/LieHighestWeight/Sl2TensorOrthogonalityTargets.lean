import Mathlib
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import TauCeti.LinearAlgebra.SymmetricPower.Basic
import TauCeti.LinearAlgebra.SymmetricPower.Basis
import TauCeti.RepresentationTheory.SU2.SymmetricPower

/-!
# Concrete rank-one tensor strings

Illustrative, nonexhaustive target signatures. README.md is definitive. Proofs marked
`sorry` are proposed targets, not implementations. The one admitted equivalence is
an honest whole dependent family, with its actual monomial law separately required.
All operators, vectors, coefficients and forms below have specified formula bodies.
-/

namespace TauCetiRoadmap.RepresentationTheory.LieHighestWeight.ConcreteTensor

open scoped TensorProduct BigOperators
open MvPolynomial

abbrev Poly := MvPolynomial (Fin 2) ℂ
abbrev P (d : ℕ) := MvPolynomial.homogeneousSubmodule (Fin 2) ℂ d
abbrev S (d : ℕ) := SymmetricPower ℂ (Fin d) (Fin 2 → ℂ)
abbrev T (m n : ℕ) := P m ⊗[ℂ] P n

noncomputable def monomial (d i : ℕ) : Poly :=
  MvPolynomial.X 0 ^ (d - i) * MvPolynomial.X 1 ^ i

/-- Zero extension prevents negative-exponent and out-of-range conventions. -/
noncomputable def e (d i : ℕ) : P d :=
  if hi : i ≤ d then ⟨monomial d i, by sorry⟩ else 0

noncomputable def exponent (d i : ℕ) : Fin 2 →₀ ℕ :=
  Finsupp.single 0 (d - i) + Finsupp.single 1 i

noncomputable def coefficient (d i : ℕ) : P d →ₗ[ℂ] ℂ :=
  (MvPolynomial.lcoeff ℂ (exponent d i)).comp
    (MvPolynomial.homogeneousSubmodule (Fin 2) ℂ d).subtype

noncomputable def symmetricMonomial (d i : ℕ) : S d :=
  if i ≤ d then
    SymmetricPower.tprod ℂ (fun k : Fin d =>
      Pi.single (if k.val < i then (1 : Fin 2) else 0) (1 : ℂ))
  else 0

/-- The sole admitted data family, to be built from the two native monomial bases.
The entire family, including d, is inside the admitted type. -/
noncomputable def polynomialSymmetric : ∀ d : ℕ, P d ≃ₗ[ℂ] S d := by sorry

theorem polynomialSymmetric_e (d i : ℕ) :
    polynomialSymmetric d (e d i) = symmetricMonomial d i := by sorry

theorem polynomialSymmetric_inverse (d i : ℕ) :
    (polynomialSymmetric d).symm (symmetricMonomial d i) = e d i := by sorry

noncomputable def action (d : ℕ) (g : Matrix.GeneralLinearGroup (Fin 2) ℂ) :
    P d →ₗ[ℂ] P d :=
  (polynomialSymmetric d).symm.toLinearMap.comp
    ((TauCeti.symPowerRep ℂ 2 d g).comp (polynomialSymmetric d).toLinearMap)

noncomputable def tensorAction (m n : ℕ)
    (g : Matrix.GeneralLinearGroup (Fin 2) ℂ) : T m n →ₗ[ℂ] T m n :=
  TensorProduct.map (action m g) (action n g)

noncomputable def Epoly (p : Poly) : Poly :=
  MvPolynomial.X 0 * MvPolynomial.pderiv 1 p

noncomputable def Fpoly (p : Poly) : Poly :=
  MvPolynomial.X 1 * MvPolynomial.pderiv 0 p

noncomputable def E (d : ℕ) : P d →ₗ[ℂ] P d where
  toFun p := ⟨Epoly p.val, by sorry⟩
  map_add' p q := by sorry
  map_smul' a p := by sorry

noncomputable def F (d : ℕ) : P d →ₗ[ℂ] P d where
  toFun p := ⟨Fpoly p.val, by sorry⟩
  map_add' p q := by sorry
  map_smul' a p := by sorry

noncomputable def H (d : ℕ) : P d →ₗ[ℂ] P d := (E d).comp (F d) - (F d).comp (E d)

noncomputable def Etot (m n : ℕ) : T m n →ₗ[ℂ] T m n :=
  TensorProduct.map (E m) (LinearMap.id : P n →ₗ[ℂ] P n) +
    TensorProduct.map (LinearMap.id : P m →ₗ[ℂ] P m) (E n)

noncomputable def Ftot (m n : ℕ) : T m n →ₗ[ℂ] T m n :=
  TensorProduct.map (F m) (LinearMap.id : P n →ₗ[ℂ] P n) +
    TensorProduct.map (LinearMap.id : P m →ₗ[ℂ] P m) (F n)

noncomputable def Htot (m n : ℕ) : T m n →ₗ[ℂ] T m n :=
  (Etot m n).comp (Ftot m n) + (-1 : ℂ) • (Ftot m n).comp (Etot m n)

noncomputable def v (m n r : ℕ) : T m n :=
  ∑ j ∈ Finset.range (r + 1),
    (((-1 : ℂ) ^ j) * (r.choose j : ℂ)) • (e m j ⊗ₜ[ℂ] e n (r - j))

noncomputable def lowered (m n r k : ℕ) : T m n := (Ftot m n ^ k) (v m n r)

noncomputable def tensorCoefficient (m n i j : ℕ) : T m n →ₗ[ℂ] ℂ :=
  (TensorProduct.lid ℂ ℂ).toLinearMap.comp
    (TensorProduct.map (coefficient m i) (coefficient n j))

noncomputable def hermitian (d : ℕ) (p q : P d) : ℂ :=
  ∑ i ∈ Finset.range (d + 1),
    star (coefficient d i p) * coefficient d i q / (d.choose i : ℂ)

noncomputable def tensorHermitian (m n : ℕ) (p q : T m n) : ℂ :=
  ∑ i ∈ Finset.range (m + 1), ∑ j ∈ Finset.range (n + 1),
    star (tensorCoefficient m n i j p) * tensorCoefficient m n i j q /
      ((m.choose i : ℂ) * (n.choose j : ℂ))

noncomputable def highestNorm (m n r : ℕ) : ℂ :=
  ∑ j ∈ Finset.range (r + 1),
    (r.choose j : ℂ) ^ 2 / ((m.choose j : ℂ) * (n.choose (r-j) : ℂ))

noncomputable def averagedSymmetrization (d : ℕ) :
    S d →ₗ[ℂ] (⨂[ℂ] (_ : Fin d), (Fin 2 → ℂ)) :=
  ((d.factorial : ℂ)⁻¹) • SymmetricPower.toTensorPower ℂ (Fin d) (Fin 2 → ℂ)

theorem e_coordinate (d i j : ℕ) (hi : i ≤ d) (hj : j ≤ d) :
    coefficient d i (e d j) = if i = j then 1 else 0 := by sorry

theorem E_e (d i : ℕ) (hi : i ≤ d) :
    E d (e d i) = (i : ℂ) • e d (i-1) := by sorry

theorem F_e (d i : ℕ) (hi : i ≤ d) :
    F d (e d i) = ((d-i : ℕ) : ℂ) • e d (i+1) := by sorry

theorem H_e (d i : ℕ) (hi : i ≤ d) :
    H d (e d i) = ((d : ℂ) - 2 * i) • e d i := by sorry

theorem highest_killed (m n r : ℕ) (hr : r ≤ min m n) :
    Etot m n (v m n r) = 0 := by sorry

theorem highest_nonzero (m n r : ℕ) (hr : r ≤ min m n) : v m n r ≠ 0 := by sorry

theorem highest_H (m n r : ℕ) (hr : r ≤ min m n) :
    Htot m n (v m n r) = ((m+n-2*r : ℕ) : ℂ) • v m n r := by sorry

theorem raising_lowered (m n r k : ℕ) (hr : r ≤ min m n)
    (hk : 1 ≤ k) (hk' : k ≤ m+n-2*r+1) :
    Etot m n (lowered m n r k) =
      ((k : ℂ) * (((m+n-2*r : ℕ) : ℂ) + 1 - (k : ℂ))) • lowered m n r (k-1) := by sorry

theorem lowered_endpoint (m n r : ℕ) (hr : r ≤ min m n) :
    lowered m n r (m+n-2*r+1) = 0 := by sorry

theorem adjoint_E_F (d : ℕ) (p q : P d) :
    hermitian d (E d p) q = hermitian d p (F d q) := by sorry

theorem tensor_hermitian_tmul (m n : ℕ) (a c : P m) (b d : P n) :
    tensorHermitian m n (a ⊗ₜ[ℂ] b) (c ⊗ₜ[ℂ] d) =
      hermitian m a c * hermitian n b d := by sorry

theorem hermitian_positive (d : ℕ) (p : P d) (hp : p ≠ 0) :
    0 < (hermitian d p p).re ∧ (hermitian d p p).im = 0 := by sorry

theorem SU2_invariance (d : ℕ) (g : TauCeti.SU2) (p q : P d) :
    hermitian d (action d (TauCeti.SU2.toGL g) p)
      (action d (TauCeti.SU2.toGL g) q) = hermitian d p q := by sorry

theorem strings_orthogonal (m n r s k l : ℕ)
    (hr : r ≤ min m n) (hs : s ≤ min m n) (hrs : r ≠ s) :
    tensorHermitian m n (lowered m n r k) (lowered m n s l) = 0 := by sorry

theorem highest_norm (m n r : ℕ) (hr : r ≤ min m n) :
    tensorHermitian m n (v m n r) (v m n r) = highestNorm m n r := by sorry

theorem highestNorm_factorials (m n r : ℕ) (hr : r ≤ min m n) :
    highestNorm m n r =
      ((r.factorial : ℂ) * (m-r).factorial * (n-r).factorial *
        (m+n-r+1).factorial) /
      ((m.factorial : ℂ) * n.factorial * (m+n-2*r+1).factorial) := by sorry

theorem lowered_norm (m n r k : ℕ) (hr : r ≤ min m n) (hk : k ≤ m+n-2*r) :
    tensorHermitian m n (lowered m n r k) (lowered m n r k) =
      ((k.factorial : ℂ) * (m+n-2*r).factorial / (m+n-2*r-k).factorial) *
        highestNorm m n r := by sorry

abbrev StringIndex (m n : ℕ) :=
  Σ r : Fin (min m n + 1), Fin (m+n-2*r.val+1)

noncomputable def stringVector (m n : ℕ) (i : StringIndex m n) : T m n :=
  lowered m n i.1.val i.2.val

theorem strings_independent (m n : ℕ) :
    LinearIndependent ℂ (stringVector m n) := by sorry

theorem strings_span (m n : ℕ) :
    Submodule.span ℂ (Set.range (stringVector m n)) = ⊤ := by sorry

noncomputable def sourceV1 (n : ℕ) : T 2 n := v 2 n 0
noncomputable def sourceV2 (n : ℕ) : T 2 n := -v 2 n 1
noncomputable def sourceV3 (n : ℕ) : T 2 n := v 2 n 2

theorem source_F2 (n : ℕ) :
    (Ftot 2 n ^ 2) (sourceV1 n) =
      (2 : ℂ) • (e 2 2 ⊗ₜ[ℂ] e n 0) +
      (4 * (n : ℂ)) • (e 2 1 ⊗ₜ[ℂ] e n 1) +
      ((n : ℂ) * ((n : ℂ)-1)) • (e 2 0 ⊗ₜ[ℂ] e n 2) := by sorry

theorem source_F1 (n : ℕ) (hn : 1 ≤ n) :
    Ftot 2 n (sourceV2 n) =
      (e 2 2 ⊗ₜ[ℂ] e n 0) +
      ((n : ℂ)-2) • (e 2 1 ⊗ₜ[ℂ] e n 1) -
      ((n : ℂ)-1) • (e 2 0 ⊗ₜ[ℂ] e n 2) := by sorry

theorem source_three_cross_products (n : ℕ) (hn : 2 ≤ n) :
    tensorHermitian 2 n ((Ftot 2 n ^ 2) (sourceV1 n))
      (Ftot 2 n (sourceV2 n)) = 0 ∧
    tensorHermitian 2 n ((Ftot 2 n ^ 2) (sourceV1 n)) (sourceV3 n) = 0 ∧
    tensorHermitian 2 n (Ftot 2 n (sourceV2 n)) (sourceV3 n) = 0 := by sorry

end TauCetiRoadmap.RepresentationTheory.LieHighestWeight.ConcreteTensor
