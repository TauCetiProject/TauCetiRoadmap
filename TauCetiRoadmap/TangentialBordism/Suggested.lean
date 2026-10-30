import Mathlib
import TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis
import TauCeti.Geometry.Manifold.Orientation

/-!
# Tangential bordism: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, the finite quadratic classification headlines: basis independence,
the intrinsic Gauss sum and the Arf-zero Lagrangian criterion (Layer 1, B3.2(a)),
and smooth oriented three-manifold parallelization (Layer 8, B3.1).
Only the finite quadratic definitions and their symplectic-basis construction are needed;
parallelization uses native tangent bundles and a chosen native oriented atlas.

The other headline theorems are not statable at the pins:
- the geometric bordism groups `Ω^O_n(X,A)`, `Ω^SO_n(X,A)`, `Ω^Spin_n(X,A)` and their low
  tables (B2, B3.1–B3.4), Thom's ring `ΩO_* ≃ F2[x_d]` (B4.6) and Wall's presentation of
  `ΩSO_*` (B6.2): Mathlib's `SingularManifold` has no bordism relation or quotient group;
- the Pontryagin–Thom isomorphism `Ω^ξ_n(X,A) ≃ π_n(Mξ ∧ Σ∞(X/A))` (B5.4c) and the stable
  framed isomorphism (B5.5): there are no Thom spectra or stable homotopy groups of spectra;
- `H*(MO;F2)`, the Steenrod algebras and Adams convergence (B4.1–B4.8): there are no Steenrod
  operations on singular cohomology;
- the ABS genus and its Dirac comparison (B3.0), Rokhlin-type consequences (B3.4) and the
  transfer kernel `ker(ΩSpin_n → KO_n) = im(ΩSpin_(n−8)(BPSp3) → ΩSpin_n)` (B6.6): there is
  no `KO` spectrum;
- the integral realization range and its degree-seven counterexample (B6.3), and the
  unoriented/oriented projective-transfer image theorems (B6.5): there are no geometric
  bordism groups, bordism orientation maps or associated-family transfer maps;
- the Cayley-plane theorems (B3.6–B3.9): the compact Albert algebra is not at the pins.
-/

namespace TauCetiRoadmap.TangentialBordism

/-! ## Layer 1: finite quadratic classification -/

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

/-- B3.2 consumes the native symplectic basis and adapts Matrix.J in char two. -/
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

/-- B3.2 uses the actual basis formula on a chosen native symplectic basis.
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

end FiniteQuadraticArf

/-! ## Layer 8: smooth oriented three-manifold parallelization -/

open scoped Manifold ContDiff

/-- Every Hausdorff second-countable smooth oriented three-manifold, allowing boundary,
has a positive tangent frame whose associated bundle map and inverse are smooth.
Positivity is measured in every chart of the chosen oriented atlas. No compactness or
connectedness hypothesis is imposed. -/
theorem orientedThreeManifold_parallelization
    (M : Type*) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (EuclideanHalfSpace 3) M]
    [IsManifold (modelWithCornersEuclideanHalfSpace 3) ∞ M]
    (A : Set (OpenPartialHomeomorph M (EuclideanHalfSpace 3)))
    (hA : TauCeti.IsOrientedAtlas (modelWithCornersEuclideanHalfSpace 3) ∞ A) :
    ∃ b : (x : M) → Module.Basis (Fin 3) ℝ
        (TangentSpace (modelWithCornersEuclideanHalfSpace 3) x),
      (∀ e ∈ A, ∀ x ∈ e.source,
        0 < Matrix.det (fun i j : Fin 3 ↦
          WithLp.ofLp (mfderiv (modelWithCornersEuclideanHalfSpace 3)
            (modelWithCornersEuclideanHalfSpace 3) e x (b x j)) i)) ∧
      ContMDiff ((modelWithCornersEuclideanHalfSpace 3).prod 𝓘(ℝ, Fin 3 → ℝ))
        (modelWithCornersEuclideanHalfSpace 3).tangent ∞
        (fun p : M × (Fin 3 → ℝ) ↦
          (⟨p.1, (b p.1).equivFun.symm p.2⟩ :
            TangentBundle (modelWithCornersEuclideanHalfSpace 3) M)) ∧
      ContMDiff (modelWithCornersEuclideanHalfSpace 3).tangent
        ((modelWithCornersEuclideanHalfSpace 3).prod 𝓘(ℝ, Fin 3 → ℝ)) ∞
        (fun v : TangentBundle (modelWithCornersEuclideanHalfSpace 3) M ↦
          (v.proj, (b v.proj).equivFun v.2)) := by
  sorry

end TauCetiRoadmap.TangentialBordism
