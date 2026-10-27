import Mathlib
import TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis

/-!
This file suggests selected native carrier and construction signatures.
README.md is definitive, and these signatures are not an exhaustive checklist.
Native SingularManifold does not include Hausdorffness. Second countability
follows from its compact Euclidean charted source through the native theorem.
-/

open scoped ContDiff Manifold

namespace TauCetiRoadmap.TangentialBordism

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

end FiniteQuadraticArf

/-- Closed smooth cycles retain the native singular-manifold carrier and the
Hausdorff hypothesis needed by the geometric theory. -/
structure ClosedCycle.{u} (X : Type*) [TopologicalSpace X] (n : ℕ)
    extends SingularManifold.{u} X ∞ 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) where
  [t2Space : @T2Space M topSpaceM]

namespace ClosedCycle

variable {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] {n : ℕ}

/-- Compact Euclidean charted sources are second countable without another field. -/
instance secondCountable (s : ClosedCycle X n) :
    @SecondCountableTopology s.M s.topSpaceM := by
  let := s.toSingularManifold.chartedSpace
  let := s.toSingularManifold.compactSpace
  exact ChartedSpace.secondCountable_of_sigmaCompact (EuclideanSpace ℝ (Fin n)) s.M

/-- Pushforward preserves the actual source manifold, rather than selecting a new cycle. -/
noncomputable def map (s : ClosedCycle X n) (f : C(X, Y)) : ClosedCycle Y n where
  toSingularManifold := s.toSingularManifold.map f.continuous
  t2Space := s.t2Space

@[simp] theorem map_f (s : ClosedCycle X n) (f : C(X, Y)) :
    (s.map f).f = f ∘ s.f := rfl

/-- Disjoint union uses the native construction with the same real model. -/
noncomputable def sum (s t : ClosedCycle X n) : ClosedCycle X n where
  toSingularManifold := s.toSingularManifold.sum t.toSingularManifold
  t2Space := by
    let := s.t2Space
    let := t.t2Space
    exact inferInstanceAs (T2Space (s.M ⊕ t.M))

@[simp] theorem sum_f (s t : ClosedCycle X n) :
    (s.sum t).f = Sum.elim s.f t.f := rfl

end ClosedCycle

/-- A generic continuous classifier includes the actual native pullback bundle isomorphism.
The embedding-specific normal/Gauss-map data are additional B5 targets. -/
structure BundleClassifierIsoData {M B : Type*} [TopologicalSpace M] [TopologicalSpace B]
    (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F]
    (ν : M → Type*) (γ : B → Type*)
    [∀ x, NormedAddCommGroup (ν x)] [∀ x, NormedSpace ℝ (ν x)]
    [∀ b, NormedAddCommGroup (γ b)] [∀ b, NormedSpace ℝ (γ b)]
    [TopologicalSpace (Bundle.TotalSpace F ν)]
    [TopologicalSpace (Bundle.TotalSpace F γ)]
    [FiberBundle F ν] [VectorBundle ℝ F ν]
    [FiberBundle F γ] [VectorBundle ℝ F γ] where
  classifier : C(M, B)
  fibreEquiv (x : M) : ν x ≃L[ℝ] γ (classifier x)
  totalEquiv : Bundle.TotalSpace F ν ≃ₜ Bundle.TotalSpace F (classifier *ᵖ γ)
  totalEquiv_apply (x : M) (v : ν x) :
    totalEquiv ⟨x, v⟩ = ⟨x, fibreEquiv x v⟩

/-- The bilinear incidence equation uses the first m+1 coordinates of the
second vector. Its projective descent and regular-level proof are B4 targets. -/
def milnorIncidence {𝕜 : Type*} [CommRing 𝕜] (m n : ℕ) (h : m ≤ n)
    (v : Fin (m + 1) → 𝕜) (w : Fin (n + 1) → 𝕜) : 𝕜 :=
  ∑ i, v i * w (Fin.castLE (Nat.add_le_add_right h 1) i)

/-- A concrete real (1,1) Milnor hypersurface carrier, independent of representatives.
Its smooth projective structure comes from the designated AT real atlases. -/
def MilnorHypersurface (m n : ℕ) (h : m ≤ n) :=
  {p : Projectivization ℝ (Fin (m + 1) → ℝ) ×
      Projectivization ℝ (Fin (n + 1) → ℝ) //
    ∀ v ∈ p.1.submodule, ∀ w ∈ p.2.submodule, milnorIncidence m n h v w = 0}

/-- The complex (1,1) incidence carrier uses a complex-bilinear equation,
not a Hermitian pairing. Its holomorphic regularity and normal line are B6 targets. -/
def ComplexMilnorHypersurface (m n : ℕ) (h : m ≤ n) :=
  {p : Projectivization ℂ (Fin (m + 1) → ℂ) ×
      Projectivization ℂ (Fin (n + 1) → ℂ) //
    ∀ v ∈ p.1.submodule, ∀ w ∈ p.2.submodule, milnorIncidence m n h v w = 0}

/-- Actual native spectral-sequence page carrier; Adams d_r raises (s,t) by (r,r-1). -/
abbrev AdamsSpectralSequenceAt (p : ℕ) :=
  CategoryTheory.SpectralSequence (ModuleCat (ZMod p))
    (fun r => ComplexShape.up' (⟨r, r - 1⟩ : ℤ × ℤ)) 2

/-- The mod2 specialization; Adams convergence requires primality and the B4 hypotheses. -/
abbrev AdamsSpectralSequence := AdamsSpectralSequenceAt 2

/-- Parameters for the odd indecomposable family; positivity is a theorem hypothesis. -/
def moOddGeneratorDimension (r s : ℕ) : ℕ :=
  2 ^ r + 2 ^ (r + 1) * s - 1

end TauCetiRoadmap.TangentialBordism
