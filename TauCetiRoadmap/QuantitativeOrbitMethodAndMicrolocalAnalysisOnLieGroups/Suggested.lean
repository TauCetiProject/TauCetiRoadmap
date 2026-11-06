module

public import Mathlib
public import TauCeti.Geometry.Lie.Exponential.Basic
public import TauCeti.RepresentationTheory.Continuous.Unitary.Basic

/-!
# The quantitative orbit method and microlocal analysis on Lie groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions their statements need. Section and theorem numbers refer to the README
and to Nelson–Venkatesh, *The orbit method and analysis of automorphic forms*, Acta Math. 226
(2021).

Stated here:

* `exists_norm_quantize_le` (README §1.9; Proposition 8.7): quantization of order-zero symbol
  families with `δ < 1/2` is bounded on every strongly continuous unitary representation, with a
  bound by finitely many symbol seminorms that is independent of the representation and of `h`.
* `isStable_iff_isCoprime_orthogonal`, `isStable_iff_isCoprime_unitary` (README §5.2;
  Theorem 14.2): for the orthogonal and unitary GGP pairs over an algebraically closed field of
  characteristic zero, an element of the Lie algebra is stable for the subgroup exactly when its
  spectral polynomial and that of its restriction are coprime.
* `stableFibre_isTorsor_orthogonal`, `stableFibre_isTorsor_unitary` (README §5.3;
  Theorem 14.5): over a stable pair of invariants the joint fibre is a torsor of the subgroup.
* `jointFibre_nonempty_orthogonal`, `jointFibre_nonempty_unitary` (README §5.3; Lemma 14.6):
  over every pair of invariants, stable or not, the joint fibre is nonempty.

The GGP statements use the standard models of README Conventions, to which every GGP pair over an
algebraically closed field is isometric: `V = k^ι ⊕ k` with the dot product, `e` the last
basis vector and `H = SO(k^ι)` Mathlib's `Matrix.specialOrthogonalGroup ι k` (defined through the
trivial star, so its members are the `h` with `hᵀ * h = 1` and `det h = 1`) in the orthogonal
case, and `H = GL(k^ι)` acting on `𝔤𝔩(k^ι ⊕ k)` through `h ↦ diag(h, 1)` in the unitary case.

Headline theorems that are not statable at the pins, and what each lacks:

* The rescaled operator calculus (README §1.12; Theorems 5.6 and 5.8, Corollary 5.9) and the
  star-product expansion (README §§1.1–1.6; Theorems 4.5 and 7.4): the operator classes `Ψ^m`
  need the Sobolev scale of a unitary representation, hence the derived representation on smooth
  vectors and the closed Nelson operator, which are not at the pins; the BCH bidifferential
  coefficients `C_j` are Taylor coefficients of the Baker–Campbell–Hausdorff series, of which the
  pins have only the local logarithm, so writing them would be a long ad hoc encoding.
* Uniform Plancherel–Sobolev summability, the Plancherel formula for Ξ-integrable functions and
  the relative Plancherel disintegration (README §§4.2, 4.4, 4.6; Lemmas A.3, A.4 and 18.1): the
  pins have no tempered duals of reductive groups with their Plancherel measures, no Sobolev
  scale of the Nelson operator, no trace on trace-class operators of a Hilbert space and no local
  relative characters.
* Rossmann's character formula and the uniform orbit trace expansion (README §§3.3, 3.7, 3.9;
  Theorems 6.1, 6.3 and 12.2), and the orbit continuity theorem (README §3.5; Theorem 11.1): the
  pins have no tempered irreducible unitary representations of real reductive groups, no
  Harish-Chandra characters, no trace on trace-class operators of a Hilbert space and no
  Kirillov–Kostant–Souriau measure on coadjoint orbits.
* Volume compatibility and the stable orbital disintegration (README §§5.6, 5.9; Theorems 16.7
  and 17.2): the pins have no fibral volume forms of morphisms of varieties and no real densities
  of algebraic top forms.
* The stable relative character expansion (README §6.4; Theorem 19.3): the pins have no local
  relative characters and no tempered duals of reductive groups.
* Positive inverse branching and cuspidal allowability (README §§7.2, 7.8; Theorems 22.2 and
  24.5): the pins have no unitary duals of real or p-adic reductive groups, no relative characters
  and no Bernstein centre.
* Limit states and their equidistribution (README §§8.2, 8.3, 8.8; Theorems 26.4, 26.5 and 27.1):
  the pins have no automorphic quotients of reductive groups over number fields with their
  automorphic representations.
* The smoothly weighted period asymptotic (README §9.5; Theorem 30.1): in addition, the pins have
  no branching coefficients `L(Π, Σ)`, Tamagawa numbers or Plancherel measures.

The exponential map of a smooth Lie group is Tau Ceti's `mulInvariantExp`, which needs the `C³`
regularity supplied by the local instance `LieGroup.minSmoothnessThree`.
-/

open scoped ContDiff Manifold FourierTransform SchwartzMap Topology

open Polynomial Matrix

@[expose] public section

namespace TauCetiRoadmap.QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups

attribute [local instance] LieGroup.minSmoothnessThree

universe u

/-! ## Layer 0: Fourier conventions, Sobolev scales and the quantization map -/

/-- A cutoff on the Lie algebra `E` supported in `U`: a smooth, compactly supported, even
function with values in `[0, 1]`, supported in `U` and equal to `1` near `0` (NV21 §2.2). -/
def IsQuantizationCutoff {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (U : Set E) (χ : E → ℝ) : Prop :=
  ContDiff ℝ ∞ χ ∧ HasCompactSupport χ ∧ tsupport χ ⊆ U ∧ (∀ x, χ (-x) = χ x) ∧
    (∀ x, χ x ∈ Set.Icc (0 : ℝ) 1) ∧ ∀ᶠ x in 𝓝 (0 : E), χ x = 1

/-- The quantization `Op(a, χ : π) v = ∫ χ(x) a^∨(x) π(exp x) v dx` of NV21 (2.1), with the Lie
algebra the model space `E` of the Lie group `G` and the symbol taken in the coordinate
`ξ = 2πi⟨η, ·⟩`, in which `a^∨` is Mathlib's Fourier transform `𝓕 b` of `b(η) = a(2πi⟨η, ·⟩)`.
The formula is meant for Schwartz symbols; the rescaled operator `Op_h(a, χ)` is
`quantize π χ (fun η ↦ b (h • η))`. -/
noncomputable def quantize {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {G : Type*} [TopologicalSpace G] [ChartedSpace E G] [Group G] [LieGroup 𝓘(ℝ, E) ∞ G]
    [T2Space G] {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V] [CompleteSpace V]
    (π : ContRepresentation ℂ G V) (χ : E → ℝ) (b : E → ℂ) (v : V) : V :=
  ∫ x : E, ((χ x : ℂ) * 𝓕 b x) • π (mulInvariantExp (I := 𝓘(ℝ, E)) (G := G) x) v

/-! ## Layer 1: The uniform symbol and operator calculus -/

/-- **Uniform boundedness of order-zero quantization** (NV21 Proposition 8.7). Let `G` be a
unimodular smooth Lie group modeled on its Lie algebra `E` and `0 ≤ δ < 1/2`. There is a
neighbourhood `U` of `0` such that for every cutoff `χ` supported in `U` there are `C` and `N`
with: for every strongly continuous unitary representation `π` of `G` on a complex Hilbert space,
every `h ∈ (0, 1]` and every Schwartz symbol `b` whose derivatives of order `j ≤ N` satisfy
`h^{δ j} (1 + ‖η‖)^j ‖D^j b(η)‖ ≤ M`, the operator `Op_h(b, χ : π)` has norm at most `C M`. The
constants do not depend on `π`, `h`, `b` or `M`. -/
theorem exists_norm_quantize_le {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    {G : Type*} [TopologicalSpace G] [ChartedSpace E G] [Group G] [LieGroup 𝓘(ℝ, E) ∞ G]
    [T2Space G] [MeasurableSpace G] [BorelSpace G]
    (hG : ∃ μ : MeasureTheory.Measure G, μ.IsHaarMeasure ∧ μ.IsMulRightInvariant)
    {δ : ℝ} (hδ₀ : 0 ≤ δ) (hδ : δ < 1 / 2) :
    ∃ U ∈ 𝓝 (0 : E), ∀ χ : E → ℝ, IsQuantizationCutoff U χ →
      ∃ (C : ℝ) (N : ℕ), ∀ (V : Type u) [NormedAddCommGroup V] [InnerProductSpace ℂ V]
        [CompleteSpace V] (π : ContRepresentation ℂ G V),
        ContRepresentation.IsUnitary π → (∀ v : V, Continuous fun g : G => π g v) →
        ∀ (h : ℝ), 0 < h → h ≤ 1 → ∀ (b : 𝓢(E, ℂ)) (M : ℝ),
          (∀ j ≤ N, ∀ η : E, h ^ (δ * j) * (1 + ‖η‖) ^ j * ‖iteratedFDeriv ℝ j b η‖ ≤ M) →
          ∀ v : V, ‖quantize π χ (fun η : E => b (h • η)) v‖ ≤ C * M * ‖v‖ := by
  sorry

/-! ## Layer 5: Stable Hamiltonian reduction for GGP pairs -/

/-- A set of square matrices over `k` is Zariski closed if it is the common zero set of an ideal
of polynomials in the entries, as given by Mathlib's `MvPolynomial.zeroLocus`. -/
def IsZariskiClosedMatrixSet {k : Type*} [Field k] {n : Type*} (S : Set (Matrix n n k)) :
    Prop :=
  ∃ I : Ideal (MvPolynomial (n × n) k),
    S = (fun x : Matrix n n k => fun ij : n × n => x ij.1 ij.2) ⁻¹' MvPolynomial.zeroLocus k I

/-- The GGP embedding `h ↦ diag(h, 1)` of endomorphisms of `V_H = k^ι` into endomorphisms of
`V = k^ι ⊕ k`, fixing the last basis vector `e`. The restriction `x_H` of `x` is
`x.toBlocks₁₁`. -/
def ggpBlock {k : Type*} [Field k] {ι : Type*} [DecidableEq ι] (h : Matrix ι ι k) :
    Matrix (ι ⊕ Unit) (ι ⊕ Unit) k :=
  Matrix.fromBlocks h 0 0 1

/-- The spectral polynomial whose roots are the eigenvalue multiset `ev(x)` of NV21 §13.4.1: the
characteristic polynomial in even size and the characteristic polynomial divided by `X`, removing
the forced eigenvalue `0` of a skew-symmetric matrix, in odd size. -/
noncomputable def ggpSpectralPolynomial {k : Type*} [Field k] {n : Type*} [Fintype n]
    [DecidableEq n] (x : Matrix n n k) : k[X] :=
  if Even (Fintype.card n) then x.charpoly else x.charpoly /ₘ X

/-- `x` and `y` are invariantly equivalent for the conjugation action of `Γ` on `A` if every
polynomial in the entries whose restriction to `A` is invariant under conjugation by `Γ` takes the
same value at `x` and `y`. For `A` the skew-symmetric or all matrices and `Γ` the special
orthogonal or invertible matrices over an algebraically closed field, this is equality of the
images in the invariant-theoretic quotient. -/
def InvariantlyEquivalent {k : Type*} [Field k] {n : Type*} [Fintype n] [DecidableEq n]
    (A Γ : Set (Matrix n n k)) (x y : Matrix n n k) : Prop :=
  ∀ f : MvPolynomial (n × n) k,
    (∀ g ∈ Γ, ∀ z ∈ A, MvPolynomial.eval (fun ij : n × n => (g * z * g⁻¹) ij.1 ij.2) f =
      MvPolynomial.eval (fun ij : n × n => z ij.1 ij.2) f) →
    MvPolynomial.eval (fun ij : n × n => x ij.1 ij.2) f =
      MvPolynomial.eval (fun ij : n × n => y ij.1 ij.2) f

/-- **Disjoint-spectrum stability, orthogonal case** (NV21 Theorem 14.2). For a skew-symmetric
`x` in `𝔰𝔬(k^ι ⊕ k)` over an algebraically closed field of characteristic zero, the orbit of `x`
under `SO(k^ι) = Matrix.specialOrthogonalGroup ι k`, acting through `h ↦ diag(h, 1)`, is Zariski
closed and its stabilizer is finite exactly when the spectral polynomials of `x` and of its
restriction `x_H` are coprime. -/
theorem isStable_iff_isCoprime_orthogonal {k : Type*} [Field k] [IsAlgClosed k] [CharZero k]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (x : Matrix (ι ⊕ Unit) (ι ⊕ Unit) k)
    (hx : xᵀ = -x) :
    (IsZariskiClosedMatrixSet
        {w | ∃ h ∈ Matrix.specialOrthogonalGroup ι k, w = ggpBlock h * x * (ggpBlock h)ᵀ} ∧
      {h | h ∈ Matrix.specialOrthogonalGroup ι k ∧ ggpBlock h * x * (ggpBlock h)ᵀ = x}.Finite) ↔
    IsCoprime (ggpSpectralPolynomial x) (ggpSpectralPolynomial x.toBlocks₁₁) := by
  sorry

/-- **Disjoint-spectrum stability, unitary case** (NV21 Theorem 14.2). Over an algebraically
closed field of characteristic zero the unitary GGP pair is `GL(k^ι) ⊂ GL(k^ι ⊕ k)`. A matrix `x`
has Zariski closed `GL(k^ι)`-orbit and finite stabilizer exactly when the characteristic
polynomials of `x` and of its upper-left block `x_H` are coprime. -/
theorem isStable_iff_isCoprime_unitary {k : Type*} [Field k] [IsAlgClosed k] [CharZero k]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (x : Matrix (ι ⊕ Unit) (ι ⊕ Unit) k) :
    (IsZariskiClosedMatrixSet {w | ∃ h : GL ι k, w = ggpBlock (h : Matrix ι ι k) * x *
        ggpBlock ((h⁻¹ : GL ι k) : Matrix ι ι k)} ∧
      {h : GL ι k | ggpBlock (h : Matrix ι ι k) * x * ggpBlock ((h⁻¹ : GL ι k) : Matrix ι ι k) =
        x}.Finite) ↔
    IsCoprime x.charpoly x.toBlocks₁₁.charpoly := by
  sorry

/-- **Stable fibres are torsors, orthogonal case** (NV21 Theorem 14.5 and Lemma 14.6). Let `y` and
`z` be skew-symmetric of sizes `ι ⊕ Unit` and `ι` over an algebraically closed field of
characteristic zero, with coprime spectral polynomials, so that their invariants form a stable
pair. The joint fibre, the skew-symmetric `x` invariantly equivalent to `y` under `SO(k^ι ⊕ k)`
whose restriction `x_H` is invariantly equivalent to `z` under `SO(k^ι)`, is nonempty, stable
under `SO(k^ι)`, and `SO(k^ι)` acts simply transitively on it. Both groups are Mathlib's
transpose-defined `Matrix.specialOrthogonalGroup`. -/
theorem stableFibre_isTorsor_orthogonal {k : Type*} [Field k] [IsAlgClosed k] [CharZero k]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (y : Matrix (ι ⊕ Unit) (ι ⊕ Unit) k)
    (hy : yᵀ = -y) (z : Matrix ι ι k) (hz : zᵀ = -z)
    (hyz : IsCoprime (ggpSpectralPolynomial y) (ggpSpectralPolynomial z)) :
    let F : Set (Matrix (ι ⊕ Unit) (ι ⊕ Unit) k) :=
      {x | xᵀ = -x ∧
        InvariantlyEquivalent {w | wᵀ = -w}
          (Matrix.specialOrthogonalGroup (ι ⊕ Unit) k : Set (Matrix (ι ⊕ Unit) (ι ⊕ Unit) k)) x y ∧
        InvariantlyEquivalent {w | wᵀ = -w}
          (Matrix.specialOrthogonalGroup ι k : Set (Matrix ι ι k)) x.toBlocks₁₁ z}
    F.Nonempty ∧
      (∀ x ∈ F, ∀ h ∈ Matrix.specialOrthogonalGroup ι k, ggpBlock h * x * (ggpBlock h)ᵀ ∈ F) ∧
      ∀ x ∈ F, ∀ x' ∈ F, ∃! h, h ∈ Matrix.specialOrthogonalGroup ι k ∧
        x' = ggpBlock h * x * (ggpBlock h)ᵀ := by
  sorry

/-- **Stable fibres are torsors, unitary case** (NV21 Theorem 14.5 and Lemma 14.6). Over an
algebraically closed field of characteristic zero, for `y` of size `ι ⊕ Unit` and `z` of size `ι`
with coprime characteristic polynomials, the set of `x` with the same `GL(k^ι ⊕ k)`-invariants as
`y` whose upper-left block has the same `GL(k^ι)`-invariants as `z` is nonempty, stable under
`GL(k^ι)`, and `GL(k^ι)` acts simply transitively on it through `h ↦ diag(h, 1)`. -/
theorem stableFibre_isTorsor_unitary {k : Type*} [Field k] [IsAlgClosed k] [CharZero k]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (y : Matrix (ι ⊕ Unit) (ι ⊕ Unit) k)
    (z : Matrix ι ι k) (hyz : IsCoprime y.charpoly z.charpoly) :
    let F : Set (Matrix (ι ⊕ Unit) (ι ⊕ Unit) k) :=
      {x | InvariantlyEquivalent Set.univ {g | IsUnit g} x y ∧
        InvariantlyEquivalent Set.univ {g | IsUnit g} x.toBlocks₁₁ z}
    F.Nonempty ∧
      (∀ x ∈ F, ∀ h : GL ι k,
        ggpBlock (h : Matrix ι ι k) * x * ggpBlock ((h⁻¹ : GL ι k) : Matrix ι ι k) ∈ F) ∧
      ∀ x ∈ F, ∀ x' ∈ F, ∃! h : GL ι k,
        x' = ggpBlock (h : Matrix ι ι k) * x * ggpBlock ((h⁻¹ : GL ι k) : Matrix ι ι k) := by
  sorry

/-- **Joint fibres are nonempty, orthogonal case** (NV21 Lemma 14.6). Over an algebraically
closed field of characteristic zero, for every skew-symmetric `y` of size `ι ⊕ Unit` and every
skew-symmetric `z` of size `ι`, with no stability hypothesis, there is a skew-symmetric `x`
invariantly equivalent to `y` under `SO(k^ι ⊕ k)` whose restriction `x_H` is invariantly
equivalent to `z` under `SO(k^ι)`: the map `x ↦ ([x], [x_H])` is surjective. -/
theorem jointFibre_nonempty_orthogonal {k : Type*} [Field k] [IsAlgClosed k] [CharZero k]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (y : Matrix (ι ⊕ Unit) (ι ⊕ Unit) k)
    (hy : yᵀ = -y) (z : Matrix ι ι k) (hz : zᵀ = -z) :
    ∃ x : Matrix (ι ⊕ Unit) (ι ⊕ Unit) k, xᵀ = -x ∧
      InvariantlyEquivalent {w | wᵀ = -w}
        (Matrix.specialOrthogonalGroup (ι ⊕ Unit) k : Set (Matrix (ι ⊕ Unit) (ι ⊕ Unit) k)) x y ∧
      InvariantlyEquivalent {w | wᵀ = -w}
        (Matrix.specialOrthogonalGroup ι k : Set (Matrix ι ι k)) x.toBlocks₁₁ z := by
  sorry

/-- **Joint fibres are nonempty, unitary case** (NV21 Lemma 14.6). Over an algebraically closed
field of characteristic zero, for every `y` of size `ι ⊕ Unit` and every `z` of size `ι`, with no
stability hypothesis, there is `x` with the same `GL(k^ι ⊕ k)`-invariants as `y` whose upper-left
block has the same `GL(k^ι)`-invariants as `z`. -/
theorem jointFibre_nonempty_unitary {k : Type*} [Field k] [IsAlgClosed k] [CharZero k]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (y : Matrix (ι ⊕ Unit) (ι ⊕ Unit) k)
    (z : Matrix ι ι k) :
    ∃ x : Matrix (ι ⊕ Unit) (ι ⊕ Unit) k,
      InvariantlyEquivalent Set.univ {g | IsUnit g} x y ∧
      InvariantlyEquivalent Set.univ {g | IsUnit g} x.toBlocks₁₁ z := by
  sorry

end TauCetiRoadmap.QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups
