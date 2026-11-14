module
public import Mathlib

/-!
# Mathematical foundations of quantum systems: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
simple definitions needed to state them.

Headline theorems not statable at the pins, and what each lacks:

* the operational reconstruction (README §1.2) and the Segal/Mackey comparisons (§§1.5–1.9):
  the orthomodular-poset, operational-system and Segal-system carriers are README targets;
* the Alfsen–Shultz, Iochum–Shultz and Connes characterizations (§§5.3–5.5): JBW-algebras and
  W*-algebras with preduals and standard forms are VonNeumannAlgebras targets;
* the second-quantization domain theory and the Gaussian realization (§§6.3–6.5): the Fock
  carriers are OperatorAlgebraDynamics D8 targets;
* the Euclidean-invariant Hamiltonian classifications (§§8.3, 9.1) and the hydrogen spectral
  representation (§9.5): unbounded self-adjoint operators with their spectral measures are
  SelfAdjointSpectralTheory and UnboundedOperators targets;
* Naimark dilation on a general measurable outcome space (§2.2): the PVM carrier is a
  SelfAdjointSpectralTheory target; the finite-outcome form is stated below;
* the repeatability characterization of sharp instruments (§2.3, Ozawa): normal instruments
  on the trace class `S₁(H)`, with their normal duals, are OperatorIdeals Part B and
  VonNeumannAlgebras V4 targets.

Gleason's theorem, the Stone–von Neumann theorem and Kummer's equation for the regularized
function `ℳ(a,b,z) = Complex.regularizedHGFun {a} {b} z` are owned by VonNeumannAlgebras 12.J,
MetaplecticAutomorphicForms §1.2 and SpecialFunctionsParabolicCylinder Milestone 1.3 and are not
restated here.
-/

@[expose] public section

universe u

namespace TauCetiRoadmap.QuantumFoundations

open scoped ComplexOrder MatrixOrder LinearAlgebra.Projectivization Matrix

/-! ## Layer 0: projective geometry and Hilbertization -/

/-- A map of projective spaces preserves lines when a point lies on the projective line
through two points exactly when its image lies on the line through their images
(README §0.1). -/
def Projectivization.PreservesLines {K V W : Type*} [Field K] [AddCommGroup V] [Module K V]
    [AddCommGroup W] [Module K W] (f : ℙ K V → ℙ K W) : Prop :=
  ∀ x y z : ℙ K V,
    z.rep ∈ Submodule.span K {x.rep, y.rep} ↔ (f z).rep ∈ Submodule.span K {(f x).rep, (f y).rep}

/-- The cross-space fundamental theorem of projective geometry (README §0.1): a line-preserving
bijection between projective spaces of rank at least three is induced by a bijective
semilinear map, and its field automorphism is unique (Artin, *Geometric Algebra*, II.2.26). -/
theorem projectiveCollineation_semilinear {K V W : Type*} [Field K] [AddCommGroup V]
    [Module K V] [AddCommGroup W] [Module K W] (hV : 3 ≤ Module.rank K V)
    (f : ℙ K V ≃ ℙ K W) (hf : Projectivization.PreservesLines f) :
    ∃! σ : K ≃+* K, ∃ (S : V →ₛₗ[(σ : K →+* K)] W) (hS : Function.Bijective S),
      ∀ x, f x = Projectivization.map S hS.1 x := by
  sorry

/-- Two bijective semilinear maps inducing the same map of projective spaces of rank at least
two have the same field automorphism and differ by a nonzero scalar (README §0.1). -/
theorem projectiveCollineation_unique_scalar {K V W : Type*} [Field K] [AddCommGroup V]
    [Module K V] [AddCommGroup W] [Module K W] (hV : 2 ≤ Module.rank K V)
    (σ σ' : K ≃+* K) (S : V →ₛₗ[(σ : K →+* K)] W) (S' : V →ₛₗ[(σ' : K →+* K)] W)
    (hS : Function.Bijective S) (hS' : Function.Bijective S')
    (h : ∀ x, Projectivization.map S hS.1 x = Projectivization.map S' hS'.1 x) :
    σ = σ' ∧ ∃ c : K, c ≠ 0 ∧ ∀ v, S' v = c • S v := by
  sorry

/-- The complex Kakutani–Mackey theorem (README §0.2; Pankov, Theorem 3.16): an order-reversing
involution of the closed-subspace lattice of an infinite-dimensional complex Banach space with
trivial intersections is the orthogonal complement of a Hilbert structure transported along a
continuous linear equivalence. -/
theorem kakutaniMackey_complex {B : Type u} [NormedAddCommGroup B] [NormedSpace ℂ B]
    [CompleteSpace B] (hB : ¬ FiniteDimensional ℂ B)
    (perp : ClosedSubmodule ℂ B → ClosedSubmodule ℂ B)
    (hanti : ∀ X Y, X ≤ Y → perp Y ≤ perp X) (hinv : ∀ X, perp (perp X) = X)
    (hdisj : ∀ X, ∀ v ∈ X, v ∈ perp X → v = 0) :
    ∃ (H : Type u) (_ : NormedAddCommGroup H) (_ : InnerProductSpace ℂ H) (_ : CompleteSpace H)
      (e : B ≃L[ℂ] H), ∀ (X : ClosedSubmodule ℂ B) (v : B),
        v ∈ perp X ↔ ∀ u ∈ X, inner ℂ (e u) (e v) = 0 := by
  sorry

/-- The real Kakutani–Mackey theorem (README §0.3; Kakutani–Mackey 1944, Theorems 1–2): the same
statement for a real Banach space of rank at least three, in any dimension. -/
theorem kakutaniMackey_real {B : Type u} [NormedAddCommGroup B] [NormedSpace ℝ B]
    [CompleteSpace B] (hB : 3 ≤ Module.rank ℝ B)
    (perp : ClosedSubmodule ℝ B → ClosedSubmodule ℝ B)
    (hanti : ∀ X Y, X ≤ Y → perp Y ≤ perp X) (hinv : ∀ X, perp (perp X) = X)
    (hdisj : ∀ X, ∀ v ∈ X, v ∈ perp X → v = 0) :
    ∃ (H : Type u) (_ : NormedAddCommGroup H) (_ : InnerProductSpace ℝ H) (_ : CompleteSpace H)
      (e : B ≃L[ℝ] H), ∀ (X : ClosedSubmodule ℝ B) (v : B),
        v ∈ perp X ↔ ∀ u ∈ X, inner ℝ (e u) (e v) = 0 := by
  sorry

/-! ## Layer 2: measurements, instruments and dilation -/

/-- A finite-outcome POVM on `ℂⁿ`: positive semidefinite effects summing to the identity
(README §2.1). -/
structure FinitePOVM (n outcomes : ℕ) where
  effect : Fin outcomes → Matrix (Fin n) (Fin n) ℂ
  positive : ∀ i, (effect i).PosSemidef
  complete : ∑ i, effect i = 1

/-- Finite Naimark dilation (README §2.2; Paulsen, Theorem 4.6): every finite POVM on `ℂⁿ` is the
compression of a finite PVM on `ℂᵐ` by an isometry, with `m ≤ n · outcomes`. -/
theorem naimark_dilation_finite {n outcomes : ℕ} (M : FinitePOVM n outcomes) :
    ∃ (m : ℕ) (V : Matrix (Fin m) (Fin n) ℂ) (Q : Fin outcomes → Matrix (Fin m) (Fin m) ℂ),
      m ≤ n * outcomes ∧ Vᴴ * V = 1 ∧ (∀ i, IsStarProjection (Q i)) ∧ ∑ i, Q i = 1 ∧
        ∀ i, M.effect i = Vᴴ * Q i * V := by
  sorry

/-! ## Layer 7: ray symmetries -/

/-- Two rays are orthogonal when their representatives are (README §7.1); this does not depend
on the representatives. -/
def Projectivization.IsOrthogonal {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
    (x y : ℙ ℂ H) : Prop :=
  inner ℂ x.rep y.rep = 0

/-- Uhlhorn's theorem (README §7.1; Uhlhorn 1963): on a complex Hilbert space of dimension at
least three, a bijection of rays preserving orthogonality in both directions is induced by a
unitary or by an antiunitary operator. -/
theorem uhlhorn {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (hH : 3 ≤ Module.rank ℂ H) (f : ℙ ℂ H ≃ ℙ ℂ H)
    (hf : ∀ x y, Projectivization.IsOrthogonal (f x) (f y) ↔ Projectivization.IsOrthogonal x y) :
    (∃ U : H ≃ₗᵢ[ℂ] H,
        ∀ x, f x = Projectivization.map U.toLinearEquiv.toLinearMap U.injective x) ∨
      (∃ A : H ≃ₗᵢ⋆[ℂ] H,
        ∀ x, f x = Projectivization.map A.toLinearEquiv.toLinearMap A.injective x) := by
  sorry

end TauCetiRoadmap.QuantumFoundations

end
