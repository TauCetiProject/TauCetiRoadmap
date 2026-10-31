import Mathlib
import TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis

/-!
# Finite quadratic Arf algebra: suggested targets

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The native characteristic-two quadratic forms supply this roadmap's Seifert dictionary
and downstream geometric applications.
-/

namespace TauCetiRoadmap.GeometricTopology

section FiniteQuadraticArf


/- Under `import Mathlib`, `AddCommGroup (ZMod 2)` is first found through
`[IsSimpleAddGroup G] [AddGroup.IsNilpotent G]` (Mathlib GroupTheory/Nilpotent.lean),
whose additive monoid is not syntactically the one in `Module (ZMod 2) (ZMod 2)`;
the ring path is preferred locally. -/
attribute [local instance 2000] Ring.toAddCommGroup

variable {V : Type*} [AddCommGroup V] [Module (ZMod 2) V]

/-- The basis formula becomes invariant on symplectic bases of the polarization. -/
noncomputable def finiteQuadraticArfOfBasis (q : QuadraticForm (ZMod 2) V) {m : ℕ}
    (b : Module.Basis (Fin m ⊕ Fin m) (ZMod 2) V) : ZMod 2 :=
  ∑ i : Fin m, q (b (Sum.inl i)) * q (b (Sum.inr i))

/-- Genuine pairing equations for a native symplectic basis of the polarization. -/
def IsQuadraticSymplecticBasis (q : QuadraticForm (ZMod 2) V) {m : ℕ}
    (b : Module.Basis (Fin m ⊕ Fin m) (ZMod 2) V) : Prop :=
  (∀ i j, q.polarBilin (b (Sum.inl i)) (b (Sum.inl j)) = 0) ∧
  (∀ i j, q.polarBilin (b (Sum.inr i)) (b (Sum.inr j)) = 0) ∧
  (∀ i j, q.polarBilin (b (Sum.inl i)) (b (Sum.inr j)) = if i = j then 1 else 0)

/-- Characteristic-two polarization is alternating, without division by two. -/
theorem quadraticPolar_isAlt (q : QuadraticForm (ZMod 2) V) :
    q.polarBilin.IsAlt := by
  intro x
  simp [QuadraticMap.polarBilin_apply_apply, QuadraticMap.polar_self,
    two_smul, CharTwo.add_self_eq_zero]

/-- The finite Arf producer consumes the native symplectic basis and adapts Matrix.J in char two. -/
theorem finiteQuadraticSymplecticBasis_exists [FiniteDimensional (ZMod 2) V]
    (q : QuadraticForm (ZMod 2) V) (h : q.polarBilin.Nondegenerate) :
    ∃ (m : ℕ) (b : Module.Basis (Fin m ⊕ Fin m) (ZMod 2) V),
      IsQuadraticSymplecticBasis q b ∧ Module.finrank (ZMod 2) V = 2 * m := by
  obtain ⟨m, b, hb⟩ := LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J (quadraticPolar_isAlt q) h
  have hp (i j : Fin m ⊕ Fin m) :
      q.polarBilin (b i) (b j) = Matrix.J (Fin m) (ZMod 2) i j := by
    simpa only [LinearMap.BilinForm.toMatrix_apply] using congrFun (congrFun hb i) j
  refine ⟨m, b, ?_, ?_⟩
  · refine ⟨?_, ?_, ?_⟩
    · intro i j
      simpa [Matrix.J] using hp (Sum.inl i) (Sum.inl j)
    · intro i j
      simpa [Matrix.J] using hp (Sum.inr i) (Sum.inr j)
    · intro i j
      simpa [Matrix.J, Matrix.one_apply, CharTwo.neg_eq] using hp (Sum.inl i) (Sum.inr j)
  · rw [Module.finrank_eq_card_basis b, Fintype.card_sum, Fintype.card_fin]
    omega

/-- The finite Arf producer uses the actual basis formula on a chosen native symplectic basis.
The basis-independence theorem below makes this an invariant. -/
noncomputable def finiteQuadraticArf [FiniteDimensional (ZMod 2) V]
    (q : QuadraticForm (ZMod 2) V) (h : q.polarBilin.Nondegenerate) : ZMod 2 :=
  finiteQuadraticArfOfBasis q
    (Classical.choose (Classical.choose_spec (finiteQuadraticSymplecticBasis_exists q h)))

/-- The invariant equals the actual finite sum on every symplectic basis. -/
theorem finiteQuadraticArf_eq_of_symplecticBasis [FiniteDimensional (ZMod 2) V]
    (q : QuadraticForm (ZMod 2) V) (h : q.polarBilin.Nondegenerate) {m : ℕ}
    (b : Module.Basis (Fin m ⊕ Fin m) (ZMod 2) V)
    (hb : IsQuadraticSymplecticBasis q b) :
    finiteQuadraticArf q h = finiteQuadraticArfOfBasis q b := by
  sorry

/-- For a nondegenerate quadratic form over F₂ of dimension 2m, the integer Gauss sum
is 2^m or -2^m according to its Arf invariant, including m = 0. -/
theorem finiteQuadraticArf_gaussSum [FiniteDimensional (ZMod 2) V] [Fintype V]
    (q : QuadraticForm (ZMod 2) V) (h : q.polarBilin.Nondegenerate)
    (m : ℕ) (hd : Module.finrank (ZMod 2) V = 2 * m) :
    (∑ v : V, if q v = 0 then (1 : ℤ) else -1) =
      (if finiteQuadraticArf q h = 0 then (2 : ℤ) ^ m else -((2 : ℤ) ^ m)) := by
  sorry

/-- A nondegenerate quadratic form over F₂ of dimension 2m has Arf invariant zero
exactly when it vanishes on an m-dimensional subspace (a quadratic Lagrangian). -/
theorem finiteQuadraticArf_eq_zero_iff_lagrangian [FiniteDimensional (ZMod 2) V]
    (q : QuadraticForm (ZMod 2) V) (h : q.polarBilin.Nondegenerate)
    (m : ℕ) (hd : Module.finrank (ZMod 2) V = 2 * m) :
    finiteQuadraticArf q h = 0 ↔
      ∃ U : Submodule (ZMod 2) V,
        Module.finrank (ZMod 2) U = m ∧ ∀ u : U, q u = 0 := by
  sorry


/-! The remaining signatures complete the pure finite-algebra interface. -/

variable {W : Type*} [AddCommGroup W] [Module (ZMod 2) W]

/-- Arf is invariant under an actual native quadratic isometry. -/
theorem finiteQuadraticArf_isometry
    [FiniteDimensional (ZMod 2) V] [FiniteDimensional (ZMod 2) W]
    (q : QuadraticForm (ZMod 2) V) (r : QuadraticForm (ZMod 2) W)
    (hq : q.polarBilin.Nondegenerate) (hr : r.polarBilin.Nondegenerate)
    (e : q.IsometryEquiv r) :
    finiteQuadraticArf q hq = finiteQuadraticArf r hr := by
  sorry

/-- Native `prod` is the orthogonal sum, with nonsingular polar form. -/
theorem finiteQuadraticPolar_prod_nondegenerate
    (q : QuadraticForm (ZMod 2) V) (r : QuadraticForm (ZMod 2) W)
    (hq : q.polarBilin.Nondegenerate) (hr : r.polarBilin.Nondegenerate) :
    (q.prod r).polarBilin.Nondegenerate := by
  sorry

/-- Arf is additive under the native orthogonal product. -/
theorem finiteQuadraticArf_prod
    [FiniteDimensional (ZMod 2) V] [FiniteDimensional (ZMod 2) W]
    (q : QuadraticForm (ZMod 2) V) (r : QuadraticForm (ZMod 2) W)
    (hq : q.polarBilin.Nondegenerate) (hr : r.polarBilin.Nondegenerate) :
    finiteQuadraticArf (q.prod r) (finiteQuadraticPolar_prod_nondegenerate q r hq hr) =
      finiteQuadraticArf q hq + finiteQuadraticArf r hr := by
  sorry

/-- Integer-valued zero count: the dimension hypothesis excludes natural subtraction at m=0. -/
theorem finiteQuadraticArf_zeroCount [FiniteDimensional (ZMod 2) V] [Fintype V]
    (q : QuadraticForm (ZMod 2) V) (hq : q.polarBilin.Nondegenerate)
    (m : ℕ) (hm : 1 ≤ m) (hd : Module.finrank (ZMod 2) V = 2 * m) :
    (Fintype.card {v : V // q v = 0} : ℤ) =
      (2 : ℤ) ^ (2 * m - 1) +
        (if finiteQuadraticArf q hq = 0 then (2 : ℤ) ^ (m - 1)
         else -((2 : ℤ) ^ (m - 1))) := by
  sorry

/-- The zero-dimensional space has Arf zero and one zero vector. -/
theorem finiteQuadraticArf_zeroDimension [FiniteDimensional (ZMod 2) V] [Fintype V]
    (q : QuadraticForm (ZMod 2) V) (hq : q.polarBilin.Nondegenerate)
    (hd : Module.finrank (ZMod 2) V = 0) :
    finiteQuadraticArf q hq = 0 ∧ Fintype.card {v : V // q v = 0} = 1 := by
  sorry

/-- This form of the Lagrangian criterion names its actual polar orthogonal complement. -/
theorem finiteQuadraticArf_eq_zero_iff_polarLagrangian
    [FiniteDimensional (ZMod 2) V]
    (q : QuadraticForm (ZMod 2) V) (hq : q.polarBilin.Nondegenerate) :
    finiteQuadraticArf q hq = 0 ↔
      ∃ L : Submodule (ZMod 2) V,
        q.restrict L = 0 ∧ LinearMap.BilinForm.orthogonal q.polarBilin L = L := by
  sorry

/-- A native paired normal form: only the first plane can be anisotropic.
For m=0 both paired statements are vacuous and the dimension-zero theorem fixes Arf. -/
theorem finiteQuadraticArf_pairedNormalForm [FiniteDimensional (ZMod 2) V]
    (q : QuadraticForm (ZMod 2) V) (hq : q.polarBilin.Nondegenerate) :
    ∃ (m : ℕ) (b : Module.Basis (Fin m ⊕ Fin m) (ZMod 2) V),
      IsQuadraticSymplecticBasis q b ∧ Module.finrank (ZMod 2) V = 2 * m ∧
      (∀ i : Fin m, q (b (Sum.inl i)) =
        if i.val = 0 then finiteQuadraticArf q hq else 0) ∧
      (∀ i : Fin m, q (b (Sum.inr i)) =
        if i.val = 0 then finiteQuadraticArf q hq else 0) := by
  sorry

/-- Nonsingular F₂ refinements are classified by dimension and Arf, not Arf alone. -/
theorem finiteQuadraticArf_classification
    [FiniteDimensional (ZMod 2) V] [FiniteDimensional (ZMod 2) W]
    (q : QuadraticForm (ZMod 2) V) (r : QuadraticForm (ZMod 2) W)
    (hq : q.polarBilin.Nondegenerate) (hr : r.polarBilin.Nondegenerate) :
    Nonempty (q.IsometryEquiv r) ↔
      Module.finrank (ZMod 2) V = Module.finrank (ZMod 2) W ∧
        finiteQuadraticArf q hq = finiteQuadraticArf r hr := by
  sorry

/-- Actual native hyperbolic plane, q(x,y)=xy; no replacement form carrier. -/
def arfHyperbolicPlane : QuadraticForm (ZMod 2) (ZMod 2 × ZMod 2) :=
  QuadraticMap.linMulLin (LinearMap.fst (ZMod 2) (ZMod 2) (ZMod 2))
    (LinearMap.snd (ZMod 2) (ZMod 2) (ZMod 2))

/-- Actual anisotropic plane, q(x,y)=xy+x²+y². -/
def arfAnisotropicPlane : QuadraticForm (ZMod 2) (ZMod 2 × ZMod 2) :=
  arfHyperbolicPlane +
    QuadraticMap.sq.comp (LinearMap.fst (ZMod 2) (ZMod 2) (ZMod 2)) +
    QuadraticMap.sq.comp (LinearMap.snd (ZMod 2) (ZMod 2) (ZMod 2))

theorem arfHyperbolicPlane_apply (x y : ZMod 2) :
    arfHyperbolicPlane (x, y) = x * y := rfl

theorem arfAnisotropicPlane_apply (x y : ZMod 2) :
    arfAnisotropicPlane (x, y) = x * y + x * x + y * y := rfl

/-- The four-vector plane conversion is stated as actual native isometry data.
In the source pair coordinates, the images are a hyperbolic paired basis of A⊥A. -/
theorem twoAnisotropicPlanes_hyperbolic_basis :
    ∃ e : (arfHyperbolicPlane.prod arfHyperbolicPlane).IsometryEquiv
        (arfAnisotropicPlane.prod arfAnisotropicPlane),
      e ((1, 0), (0, 0)) = ((1, 0), (1, 0)) ∧
      e ((0, 1), (0, 0)) = ((0, 1), (1, 0)) ∧
      e ((0, 0), (1, 0)) = ((1, 1), (0, 1)) ∧
      e ((0, 0), (0, 1)) = ((1, 1), (1, 1)) := by
  sorry

end FiniteQuadraticArf

end TauCetiRoadmap.GeometricTopology
