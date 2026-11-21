module

public import Mathlib
public import TauCeti.RepresentationTheory.Continuous.Unitary.Basic

/-!
# Euclidean motion groups and Bessel functions: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines and plain bullets
are targets of the same standing, stated in prose.

The definitions owned by other roadmaps are roadmap-local verbatim copies of the current
`Suggested.lean` of their owner, each with a docstring naming the owner and section: the motion
groups `SOn`, `rotE`, `MotionGroup`, `lorentzBoost`, `ISO11`, the sphere model `motionAction`,
`matrixElement`, `IsBiInvariant` and `IsSphericalFunction` (SpecialFunctionsGroupModels §§0.3,
2.6, 3.1, 5.1–5.2); `wignerSmallD`, `jacobi`, `spherePoint` and `sphericalHarmonic`
(SpecialFunctionsSU2MatrixElements §§2.3, 2.4, 6.1; `jacobi` is LaguerreJacobi's §3.2);
`laguerre` and `gegenbauer` (LaguerreJacobi §§1.1, 6.2). The topological-group and local
compactness instances of SpecialFunctionsGroupModels §0.3 are not copied; nothing here needs them.
The lemmas `rotE_mul`, `rotE_one`, `rotE_add` and `lorentzBoost_add` are proved supporting steps
of the copied group laws, not targets.

The representations on `L²` enter through the predicates `IsCircleRealization R U` and
`IsHyperbolaRealization R U`: `U` agrees almost everywhere with the pointwise formula and has
continuous orbit maps. The theorems about the representations take a realization `U` as an
argument, and `exists_circleRealization` and `exists_hyperbolaRealization_iff` say when one
exists. No definition depends on `sorry`. Section numbers in docstrings are those of the README.
Docstrings that start with "Sanity check of the definition:" mark pointwise identities that unfold
one definition; they test the conventions and are targets like the others.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsMotionGroupsBessel

open MeasureTheory Filter Topology Set Matrix AddCircle Complex
open scoped Real ComplexConjugate InnerProductSpace FourierTransform Laplacian

local notation "𝕋" => AddCircle (2 * π)

local instance : Fact (0 < 2 * π) := ⟨Real.two_pi_pos⟩

/-! ## Mathlib and Tau Ceti declarations named in the README -/

#check @Complex.besselJ
#check @Complex.besselJ_neg_int
#check @MeasureTheory.Measure.toSphere
#check @ContRepresentation.IsUnitary
#check @Polynomial.eval

/-! ## Local copies of definitions owned by other roadmaps -/

/-- Local copy (SpecialFunctionsGroupModels §0.3). `SO(n)` as the special orthogonal matrices of
Mathlib. -/
abbrev SOn (n : ℕ) := Matrix.specialOrthogonalGroup (Fin n) ℝ

/-- Local copy (SpecialFunctionsGroupModels §0.3). A matrix of `SO(n)` acting on `ℝⁿ`. -/
def rotE {n : ℕ} (k : SOn n) (a : EuclideanSpace ℝ (Fin n)) : EuclideanSpace ℝ (Fin n) :=
  Matrix.toEuclideanLin k.1 a

/-- A product of rotations acts by composition on Euclidean vectors. -/
theorem rotE_mul {n : ℕ} (k k' : SOn n) (a : EuclideanSpace ℝ (Fin n)) :
    rotE (k * k') a = rotE k (rotE k' a) := by
  simp only [rotE, Submonoid.coe_mul, toEuclideanLin_eq_toLin_orthonormal]
  rw [Matrix.toLin_mul _ (EuclideanSpace.basisFun (Fin n) ℝ).toBasis]
  rfl

/-- The identity rotation fixes each Euclidean vector. -/
theorem rotE_one {n : ℕ} (a : EuclideanSpace ℝ (Fin n)) : rotE (1 : SOn n) a = a := by
  simp [rotE]

/-- A rotation distributes over vector addition. -/
theorem rotE_add {n : ℕ} (k : SOn n) (a b : EuclideanSpace ℝ (Fin n)) :
    rotE k (a + b) = rotE k a + rotE k b := by
  simp [rotE]

/-- Local copy (SpecialFunctionsGroupModels §0.3). The motion group `M(n) = ℝⁿ ⋊ SO(n)`, with
`(a, k)(a', k') = (a + k a', k k')`. -/
@[ext]
structure MotionGroup (n : ℕ) where
  /-- The translation part. -/
  a : EuclideanSpace ℝ (Fin n)
  /-- The rotation part. -/
  k : SOn n

namespace MotionGroup

variable {n : ℕ}

instance : Mul (MotionGroup n) := ⟨fun g h => ⟨g.a + rotE g.k h.a, g.k * h.k⟩⟩

instance : One (MotionGroup n) := ⟨⟨0, 1⟩⟩

instance : Inv (MotionGroup n) := ⟨fun g => ⟨-rotE g.k⁻¹ g.a, g.k⁻¹⟩⟩

/-- The translation of a product in `MotionGroup`. -/
@[simp] theorem mul_a (g h : MotionGroup n) : (g * h).a = g.a + rotE g.k h.a := rfl

/-- The rotation of a product in `MotionGroup`. -/
@[simp] theorem mul_k (g h : MotionGroup n) : (g * h).k = g.k * h.k := rfl

/-- The translation of the identity in `MotionGroup`. -/
@[simp] theorem one_a : (1 : MotionGroup n).a = 0 := rfl

/-- The rotation of the identity in `MotionGroup`. -/
@[simp] theorem one_k : (1 : MotionGroup n).k = 1 := rfl

/-- The translation of the inverse in `MotionGroup`. -/
@[simp] theorem inv_a (g : MotionGroup n) : g⁻¹.a = -rotE g.k⁻¹ g.a := rfl

/-- The rotation of the inverse in `MotionGroup`. -/
@[simp] theorem inv_k (g : MotionGroup n) : g⁻¹.k = g.k⁻¹ := rfl

instance : Group (MotionGroup n) where
  mul_assoc g h l := by
    ext1
    · simp [rotE_add, rotE_mul, add_assoc]
    · simp [mul_assoc]
  one_mul g := by ext1 <;> simp [rotE_one]
  mul_one g := by ext1 <;> simp [rotE]
  inv_mul_cancel g := by
    ext1
    · simp
    · simp

/-- Local copy (SpecialFunctionsGroupModels §0.3). The topology of `ℝⁿ × SO(n)`. -/
instance : TopologicalSpace (MotionGroup n) :=
  TopologicalSpace.induced (fun g => (g.a, g.k)) inferInstance

instance : MeasurableSpace (MotionGroup n) := borel (MotionGroup n)

instance : BorelSpace (MotionGroup n) := ⟨rfl⟩

end MotionGroup

/-- Local copy (SpecialFunctionsGroupModels §0.3). The Lorentz boost
`Λ_s (x, y) = (x cosh s + y sinh s, x sinh s + y cosh s)`. -/
def lorentzBoost (s : ℝ) (p : ℝ × ℝ) : ℝ × ℝ :=
  (p.1 * Real.cosh s + p.2 * Real.sinh s, p.1 * Real.sinh s + p.2 * Real.cosh s)

/-- Boosts with added rapidities act by composition. -/
theorem lorentzBoost_add (s s' : ℝ) (p : ℝ × ℝ) :
    lorentzBoost (s + s') p = lorentzBoost s (lorentzBoost s' p) := by
  simp only [lorentzBoost, Real.cosh_add, Real.sinh_add, Prod.mk.injEq]
  constructor <;> ring

/-- Local copy (SpecialFunctionsGroupModels §0.3). The group `ISO(1,1) = ℝ² ⋊ SO₀(1,1)`, with
`(a, s)(a', s') = (a + Λ_s a', s + s')`. -/
@[ext]
structure ISO11 where
  /-- The translation part. -/
  a : ℝ × ℝ
  /-- The rapidity of the boost. -/
  s : ℝ

namespace ISO11

instance : Mul ISO11 := ⟨fun g h => ⟨g.a + lorentzBoost g.s h.a, g.s + h.s⟩⟩

instance : One ISO11 := ⟨⟨0, 0⟩⟩

instance : Inv ISO11 := ⟨fun g => ⟨-lorentzBoost (-g.s) g.a, -g.s⟩⟩

/-- The translation of a product in `ISO11`. -/
@[simp] theorem mul_a (g h : ISO11) : (g * h).a = g.a + lorentzBoost g.s h.a := rfl

/-- The rapidity of a product in `ISO11`. -/
@[simp] theorem mul_s (g h : ISO11) : (g * h).s = g.s + h.s := rfl

instance : Group ISO11 where
  mul_assoc g h l := by
    ext1
    · simp only [mul_a, mul_s, lorentzBoost_add, add_assoc]
      simp only [lorentzBoost, Prod.fst_add, Prod.snd_add, Prod.ext_iff]
      constructor <;> ring
    · simp [add_assoc]
  one_mul g := by
    ext1
    · change (0 : ℝ × ℝ) + lorentzBoost 0 g.a = g.a
      simp [lorentzBoost]
    · change (0 : ℝ) + g.s = g.s
      simp
  mul_one g := by
    ext1
    · change g.a + lorentzBoost g.s 0 = g.a
      simp [lorentzBoost]
    · change g.s + 0 = g.s
      simp
  inv_mul_cancel g := by
    ext1
    · change -lorentzBoost (-g.s) g.a + lorentzBoost (-g.s) g.a = 0
      simp
    · change -g.s + g.s = 0
      simp

/-- Local copy (SpecialFunctionsGroupModels §0.3). The topology of `ℝ² × ℝ`. -/
instance : TopologicalSpace ISO11 := TopologicalSpace.induced (fun g => (g.a, g.s)) inferInstance

instance : MeasurableSpace ISO11 := borel ISO11

instance : BorelSpace ISO11 := ⟨rfl⟩

end ISO11

/-- Local copy (SpecialFunctionsGroupModels §2.6). The sphere model of the motion group:
`(a, k)` acts by `e^{i R ⟨a, ξ⟩} f(k⁻¹ ξ)`. -/
def motionAction {n : ℕ} (R : ℝ) (g : MotionGroup n) (f : EuclideanSpace ℝ (Fin n) → ℂ)
    (ξ : EuclideanSpace ℝ (Fin n)) : ℂ :=
  Complex.exp ((R * ⟪g.a, ξ⟫_ℝ : ℝ) * Complex.I) * f (rotE g.k⁻¹ ξ)

section MatrixElements

variable {G H ι : Type*} [Group G] [NormedAddCommGroup H] [InnerProductSpace ℂ H]

/-- Local copy (SpecialFunctionsGroupModels §3.1). The matrix element `D_{mn}(g) = ⟪e_m, U(g) e_n⟫`
of a representation in a Hilbert basis, Edmonds's `⟨m|D(g)|n⟩`. -/
def matrixElement (U : ContRepresentation ℂ G H) (e : HilbertBasis ι ℂ H) (m n : ι) (g : G) : ℂ :=
  ⟪e m, U g (e n)⟫_ℂ

end MatrixElements

section Spherical

variable {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]

/-- Local copy (SpecialFunctionsGroupModels §5.1). `f` is bi-invariant under `K`:
`f(k₁ x k₂) = f(x)`. -/
def IsBiInvariant (K : Subgroup G) (f : G → ℂ) : Prop :=
  ∀ k₁ ∈ K, ∀ k₂ ∈ K, ∀ x, f (k₁ * x * k₂) = f x

/-- Local copy (SpecialFunctionsGroupModels §5.2). `φ` is a spherical function for `(G, K)` and
the measure `ν` on `K`: continuous, bi-`K`-invariant, `φ(1) = 1`, with
`∫_K φ(x k y) dν(k) = φ(x) φ(y)`. Boundedness is not required. -/
def IsSphericalFunction (K : Subgroup G) (ν : Measure K) (φ : G → ℂ) : Prop :=
  Continuous φ ∧ IsBiInvariant K φ ∧ φ 1 = 1 ∧ ∀ x y, ∫ k : K, φ (x * k * y) ∂ν = φ x * φ y

end Spherical

/-- Local copy (SpecialFunctionsSU2MatrixElements §2.3). **Edmonds's `d^j_{m'm}(β)`** by his
finite sum (4.1.15), in the indices `i = j + m'`, `k = j + m`. It is `0` when an index exceeds
`d`. -/
def wignerSmallD (d i k : ℕ) (β : ℝ) : ℝ :=
  if i ≤ d ∧ k ≤ d then
    Real.sqrt ((i.factorial * (d - i).factorial : ℕ) / (k.factorial * (d - k).factorial : ℕ)) *
      ∑ s ∈ Finset.range (d - i + 1),
        ((k.choose (d - i - s) * (d - k).choose s : ℕ) : ℝ) * (-1) ^ (d - i - s) *
          Real.cos (β / 2) ^ (2 * s + i + k - d) * Real.sin (β / 2) ^ (2 * d - i - k - 2 * s)
  else 0

open Polynomial in
/-- Local copy of the Jacobi polynomial `P_n^{(α,β)}` (DLMF 18.5.8), verbatim from
SpecialFunctionsSU2MatrixElements §2.4; the owner is LaguerreJacobi §3.2. -/
def jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) : R[X] :=
  ((1 : ℚ) / 2 ^ n) • ∑ k ∈ Finset.range (n + 1),
    (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      ((ascPochhammer R (n - k)).smeval (β + k + 1) *
        (ascPochhammer R k).smeval (α + (n - k : ℕ) + 1))) • ((X - 1) ^ (n - k) * (X + 1) ^ k)

/-- Local copy (SpecialFunctionsSU2MatrixElements §6.1). The point of `S²` with polar angle `θ`
and azimuth `φ`. -/
def spherePoint (θ φ : ℝ) : EuclideanSpace ℝ (Fin 3) :=
  WithLp.toLp 2 ![Real.sin θ * Real.cos φ, Real.sin θ * Real.sin φ, Real.cos θ]

open Polynomial in
/-- Local copy (SpecialFunctionsSU2MatrixElements §6.1). **The spherical harmonic** `Y_l^m` of
DLMF 14.30.1, `m = i - l`, as a polynomial on `ℝ³`, with the Condon–Shortley phase. -/
def sphericalHarmonic (l i : ℕ) (x : EuclideanSpace ℝ (Fin 3)) : ℂ :=
  (Real.sqrt ((2 * l + 1) / (4 * π) *
      ((l - Int.natAbs ((i : ℤ) - l)).factorial /
        (l + Int.natAbs ((i : ℤ) - l)).factorial)) : ℂ) *
    (if l ≤ i then (-(x 0 + I * x 1)) ^ (i - l) else (x 0 - I * x 1) ^ (l - i)) *
    ((((derivative^[Int.natAbs ((i : ℤ) - l)]) (jacobi (0 : ℝ) 0 l)).eval (x 2) : ℝ) : ℂ)

open Polynomial in
/-- Local copy (LaguerreJacobi §1.1), verbatim. The generalized Laguerre polynomial `Lₙ^{(α)}`
(DLMF 18.5.12). -/
noncomputable def laguerre {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) (n : ℕ) : R[X] :=
  ∑ k ∈ Finset.range (n + 1),
    ((-1 : R) ^ k * (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      (ascPochhammer R (n - k)).smeval (α + k + 1))) • X ^ k

open Polynomial in
/-- Local copy (LaguerreJacobi §6.2), verbatim. The Gegenbauer (ultraspherical) polynomial
`Cₙ^{(λ)}` (DLMF 18.5.10). It vanishes identically at `λ = 0` for `n ≥ 1`. -/
noncomputable def gegenbauer {R : Type*} [CommRing R] [Algebra ℚ R] (lam : R) (n : ℕ) : R[X] :=
  ∑ k ∈ Finset.range (n / 2 + 1),
    ((-1 : R) ^ k * (((1 : ℚ) / (k.factorial * (n - 2 * k).factorial)) •
      (ascPochhammer R (n - k)).smeval lam)) • (C 2 * X) ^ (n - 2 * k)

/-! ## Layer 0: the plane motion group in polar coordinates -/

/-- README 0.1. The rotation `k_α` of the plane by the angle `α`. -/
def rotation (α : ℝ) : SOn 2 :=
  ⟨!![Real.cos α, -Real.sin α; Real.sin α, Real.cos α], by
    rw [Matrix.mem_specialOrthogonalGroup_iff, Matrix.mem_orthogonalGroup_iff]
    refine ⟨?_, ?_⟩
    · ext i j
      fin_cases i <;> fin_cases j <;>
        simp [Matrix.mul_apply, Fin.sum_univ_two] <;> nlinarith [Real.sin_sq_add_cos_sq α]
    · simp [Matrix.det_fin_two]
      nlinarith [Real.sin_sq_add_cos_sq α]⟩

/-- README 0.1. A plane vector as a complex number, `a₁ + i a₂`. -/
def toComplex (a : EuclideanSpace ℝ (Fin 2)) : ℂ := (a 0 : ℂ) + (a 1 : ℂ) * I

/-- README 0.1. The plane vector with polar coordinates `(r, φ)`. -/
def planePoint (r φ : ℝ) : EuclideanSpace ℝ (Fin 2) :=
  WithLp.toLp 2 ![r * Real.cos φ, r * Real.sin φ]

/-- README 0.1. The unit vector `e(ψ) = (cos ψ, sin ψ)` at a point `ψ` of the circle
`ℝ/2πℤ`, through Mathlib's character `fourier 1 ψ = e^{iψ}`. -/
def unitVec (ψ : 𝕋) : EuclideanSpace ℝ (Fin 2) :=
  WithLp.toLp 2 ![(fourier 1 ψ : ℂ).re, (fourier 1 ψ : ℂ).im]

/-- README 0.1. The angle of a rotation of the plane, modulo `2π`. -/
def rotAngle (k : SOn 2) : 𝕋 := (Complex.arg ((k.1 0 0 : ℂ) + (k.1 1 0 : ℂ) * I) : 𝕋)

/-- README 0.1. The element `g(r, φ; α) = (r e(φ), k_α)` of `M(2)`. -/
def polar (r φ α : ℝ) : MotionGroup 2 := ⟨planePoint r φ, rotation α⟩

/-- Sanity check of the definition: README 0.1. **Rotations form a circle group**:
`k_{α+β} = k_α k_β`. -/
theorem rotation_add (α β : ℝ) : rotation (α + β) = rotation α * rotation β := by
  sorry

/-- README 0.1. **Every rotation of the plane is some `k_α`.** -/
theorem exists_rotation_eq (k : SOn 2) : ∃ α : ℝ, k = rotation α := by
  sorry

/-- README 0.1. **`rotAngle` recovers the angle** of `k_α` modulo `2π`. -/
theorem rotAngle_rotation (α : ℝ) : rotAngle (rotation α) = (α : 𝕋) := by
  sorry

/-- README 0.1. **`rotAngle` is a homomorphism** to `ℝ/2πℤ`. -/
theorem rotAngle_mul (k k' : SOn 2) : rotAngle (k * k') = rotAngle k + rotAngle k' := by
  sorry

/-- README 0.1. **`k_α` is multiplication by `e^{iα}`** in the complex coordinate. -/
theorem toComplex_rotE_rotation (α : ℝ) (a : EuclideanSpace ℝ (Fin 2)) :
    toComplex (rotE (rotation α) a) = Complex.exp (α * I) * toComplex a := by
  sorry

/-- Sanity check of the definition: README 0.1. **Polar product law, translation part**
(Vilenkin–Klimyk Vol. 1 §4.1.1 (4)): the translation of `g(r₁, φ₁; α₁) g(r₂, φ₂; α₂)` is
`r₁ e^{iφ₁} + r₂ e^{i(φ₂+α₁)}`. -/
theorem toComplex_polar_mul_a (r₁ φ₁ α₁ r₂ φ₂ α₂ : ℝ) :
    toComplex (polar r₁ φ₁ α₁ * polar r₂ φ₂ α₂).a =
      r₁ * Complex.exp (φ₁ * I) + r₂ * Complex.exp ((φ₂ + α₁) * I) := by
  sorry

/-- Sanity check of the definition: README 0.1. **Polar product law, rotation part**: the rotation
of `g(r₁, φ₁; α₁) g(r₂, φ₂; α₂)` is `k_{α₁+α₂}`. -/
theorem polar_mul_k (r₁ φ₁ α₁ r₂ φ₂ α₂ : ℝ) :
    (polar r₁ φ₁ α₁ * polar r₂ φ₂ α₂).k = rotation (α₁ + α₂) := by
  sorry

/-- README 0.1. **Polar form of `M(2)`**: every `g` is `g(|a|, φ; α)` for some angles. -/
theorem exists_polar (g : MotionGroup 2) : ∃ φ α : ℝ, g = polar ‖g.a‖ φ α := by
  sorry

/-! ## Layer 1: the circle models of `M(2)` -/

/-! ### 1.1 The models `T_R`, `R ∈ ℂ` -/

/-- README 1.1. The circle model `(T_R(g) f)(ψ) = e^{iR⟨a, e(ψ)⟩} f(ψ - α)` for `g = (a, k_α)`
and complex `R`. -/
def circleAction (R : ℂ) (g : MotionGroup 2) (f : 𝕋 → ℂ) (ψ : 𝕋) : ℂ :=
  Complex.exp (I * R * (⟪g.a, unitVec ψ⟫_ℝ : ℝ)) * f (ψ - rotAngle g.k)

/-- README 1.1. A representation on `L²(𝕋)` realizes `T_R` when it agrees almost everywhere with
the pointwise formula and has continuous orbit maps. -/
def IsCircleRealization (R : ℂ)
    (U : ContRepresentation ℂ (MotionGroup 2) (Lp ℂ 2 (haarAddCircle (T := 2 * π)))) : Prop :=
  (∀ g f, (U g f : 𝕋 → ℂ) =ᵐ[haarAddCircle] circleAction R g f) ∧
    ∀ f, Continuous fun g => U g f

/-- Sanity check of the definition: README 1.1. **Representation law of the circle model.** -/
theorem circleAction_mul (R : ℂ) (g h : MotionGroup 2) (f : 𝕋 → ℂ) :
    circleAction R (g * h) f = circleAction R g (circleAction R h f) := by
  sorry

/-- Sanity check of the definition: README 1.1. **The identity acts trivially** in the circle
model. -/
theorem circleAction_one (R : ℂ) (f : 𝕋 → ℂ) : circleAction R 1 f = f := by
  sorry

/-- Sanity check of the definition: README 1.1. **Agreement with the sphere model** of
SpecialFunctionsGroupModels §2.6 at `n = 2` and real `R`. -/
theorem circleAction_eq_motionAction (R : ℝ) (g : MotionGroup 2)
    (F : EuclideanSpace ℝ (Fin 2) → ℂ) (ψ : 𝕋) :
    circleAction R g (F ∘ unitVec) ψ = motionAction R g F (unitVec ψ) := by
  sorry

/-- Sanity check of the definition: README 1.1. **Size of the multiplier**:
`|e^{iR⟨a, e(ψ)⟩}| = e^{-Im R ⟨a, e(ψ)⟩}`. -/
theorem norm_circleAction (R : ℂ) (g : MotionGroup 2) (f : 𝕋 → ℂ) (ψ : 𝕋) :
    ‖circleAction R g f ψ‖ = Real.exp (-R.im * ⟪g.a, unitVec ψ⟫_ℝ) * ‖f (ψ - rotAngle g.k)‖ := by
  sorry

/-- README 1.1. **`L²` realization** of `T_R` for every complex `R`. -/
theorem exists_circleRealization (R : ℂ) : ∃ U, IsCircleRealization R U := by
  sorry

/-- README 1.1. **Unitarity range**: a realization of `T_R` is unitary exactly for real `R`. -/
theorem IsCircleRealization.isUnitary_iff {R : ℂ}
    {U : ContRepresentation ℂ (MotionGroup 2) (Lp ℂ 2 (haarAddCircle (T := 2 * π)))}
    (hU : IsCircleRealization R U) : U.IsUnitary ↔ R.im = 0 := by
  sorry

/-- Sanity check of the definition: README 1.1. **`T_{-R}` and `T_R` are equivalent** through the
half-turn `f ↦ f(· + π)`. -/
theorem circleAction_neg (R : ℂ) (g : MotionGroup 2) (f : 𝕋 → ℂ) :
    circleAction (-R) g (fun ψ => f (ψ + (π : 𝕋))) =
      fun ψ => circleAction R g f (ψ + (π : 𝕋)) := by
  sorry

/-- README 1.1. **Irreducibility of `T_R`, `R ≠ 0`**: for a realization of `T_R`, a closed
invariant subspace is `0` or everything. -/
theorem IsCircleRealization.irreducible {R : ℂ} (hR : R ≠ 0)
    {U : ContRepresentation ℂ (MotionGroup 2) (Lp ℂ 2 (haarAddCircle (T := 2 * π)))}
    (hU : IsCircleRealization R U) (V : Submodule ℂ (Lp ℂ 2 (haarAddCircle (T := 2 * π))))
    (hV : IsClosed (V : Set (Lp ℂ 2 (haarAddCircle (T := 2 * π)))))
    (hinv : ∀ g, ∀ v ∈ V, U g v ∈ V) : V = ⊥ ∨ V = ⊤ := by
  sorry

/-! ### 1.2 Matrix elements -/

/-- README 1.2. **Bessel's integral on the circle**: the `n`-th Fourier coefficient of the plane
wave is `iⁿ e^{inφ} Jₙ(R r)`. -/
theorem integral_exp_inner_fourier (R : ℂ) (r φ : ℝ) (n : ℤ) :
    ∫ ψ, Complex.exp (I * R * (⟪planePoint r φ, unitVec ψ⟫_ℝ : ℝ)) * fourier n ψ
        ∂haarAddCircle =
      I ^ n * Complex.exp (n * φ * I) * besselJ n (R * r) := by
  sorry

/-- README 1.2. **Matrix elements of `T_R`**: for a realization of `T_R`,
`D_{mn}(g(r, φ; α)) = i^{n-m} e^{i(n-m)φ} e^{-inα} J_{n-m}(R r)`. -/
theorem IsCircleRealization.matrixElement_polar {R : ℂ}
    {U : ContRepresentation ℂ (MotionGroup 2) (Lp ℂ 2 (haarAddCircle (T := 2 * π)))}
    (hU : IsCircleRealization R U) (m n : ℤ) (r φ α : ℝ) :
    matrixElement U fourierBasis m n (polar r φ α) =
      I ^ (n - m) * Complex.exp ((n - m : ℤ) * φ * I) * Complex.exp (-(n * α * I)) *
        besselJ (n - m : ℤ) (R * r) := by
  sorry

/-- README 1.2. **Weights**: for a realization of `T_R`, `T_R(k_α) eₙ = e^{-inα} eₙ`. -/
theorem IsCircleRealization.apply_rotation_fourierLp {R : ℂ}
    {U : ContRepresentation ℂ (MotionGroup 2) (Lp ℂ 2 (haarAddCircle (T := 2 * π)))}
    (hU : IsCircleRealization R U) (α : ℝ) (n : ℤ) :
    U ⟨0, rotation α⟩ (fourierLp 2 n) =
      Complex.exp (-(n * α * I)) • fourierLp 2 n := by
  sorry

/-- README 1.2. **Sign change of `R`**: for realizations of `T_R` and `T_{-R}`,
`D^{-R}_{mn} = (-1)^{m-n} D^R_{mn}`. -/
theorem IsCircleRealization.matrixElement_neg {R : ℂ}
    {U U' : ContRepresentation ℂ (MotionGroup 2) (Lp ℂ 2 (haarAddCircle (T := 2 * π)))}
    (hU : IsCircleRealization R U) (hU' : IsCircleRealization (-R) U') (m n : ℤ)
    (g : MotionGroup 2) :
    matrixElement U' fourierBasis m n g =
      (-1 : ℂ) ^ (m - n) * matrixElement U fourierBasis m n g := by
  sorry

/-! ### 1.3 Infinitesimal operators -/

/-- README 1.3. **Ladder operators**: along the translation direction `e(β)`,
`d/dt T_R(t e(β)) eₙ |₀ = (iR/2)(e^{-iβ} e_{n+1} + e^{iβ} e_{n-1})`. -/
theorem hasDerivAt_circleAction_fourier (R : ℂ) (β : ℝ) (n : ℤ) (ψ : 𝕋) :
    HasDerivAt (fun t : ℝ => circleAction R ⟨planePoint t β, 1⟩ (fourier n) ψ)
      (I * R / 2 * (Complex.exp (-(β * I)) * fourier (n + 1) ψ +
        Complex.exp (β * I) * fourier (n - 1) ψ)) 0 := by
  sorry

/-- README 1.3. **Casimir value `-R²`**: the second derivatives along the two coordinate
translations add up to `-R² f`. -/
theorem circleAction_casimir (R : ℂ) (f : 𝕋 → ℂ) (ψ : 𝕋) :
    deriv (deriv fun t : ℝ => circleAction R ⟨planePoint t 0, 1⟩ f ψ) 0 +
        deriv (deriv fun t : ℝ => circleAction R ⟨planePoint t (π / 2), 1⟩ f ψ) 0 =
      -R ^ 2 * f ψ := by
  sorry

/-- README 1.3. **Lie derivative of matrix elements**: for a realization of `T_R`,
`d/dt D_{mn}(g (t e₁, 1)) |₀ = (iR/2)(D_{m,n+1}(g) + D_{m,n-1}(g))`. -/
theorem IsCircleRealization.hasDerivAt_matrixElement_mul_translation {R : ℂ}
    {U : ContRepresentation ℂ (MotionGroup 2) (Lp ℂ 2 (haarAddCircle (T := 2 * π)))}
    (hU : IsCircleRealization R U) (m n : ℤ) (g : MotionGroup 2) :
    HasDerivAt (fun t : ℝ => matrixElement U fourierBasis m n (g * ⟨planePoint t 0, 1⟩))
      (I * R / 2 * (matrixElement U fourierBasis m (n + 1) g +
        matrixElement U fourierBasis m (n - 1) g)) 0 := by
  sorry

/-! ## Layer 2: identities from the group law -/

/-- README 2.1. **Addition theorem in polar form** (Vilenkin–Klimyk Vol. 1 §4.1.4 (2)): with
`r e^{iφ} = r₁ + r₂ e^{iφ₂}`,
`e^{i(n-m)φ} J_{n-m}(R r) = Σₖ J_{k-m}(R r₁) J_{n-k}(R r₂) e^{i(n-k)φ₂}`. -/
theorem hasSum_besselJ_polar_addition (R : ℂ) (m n : ℤ) {r₁ r₂ φ₂ r φ : ℝ}
    (h : (r : ℂ) * Complex.exp (φ * I) = r₁ + r₂ * Complex.exp (φ₂ * I)) :
    HasSum (fun k : ℤ => besselJ (k - m : ℤ) (R * r₁) * besselJ (n - k : ℤ) (R * r₂) *
        Complex.exp ((n - k : ℤ) * φ₂ * I))
      (Complex.exp ((n - m : ℤ) * φ * I) * besselJ (n - m : ℤ) (R * r)) := by
  sorry

/-- README 2.2. **Multiplication formula** (Vilenkin–Klimyk Vol. 1 §4.1.4 (7)): the mean over the
circle `w = r₁ + r₂ e^{iφ₂}` of `(w/|w|)ⁿ e^{-imφ₂} Jₙ(R|w|)` is `J_{n-m}(R r₁) J_m(R r₂)`. -/
theorem integral_besselJ_circleMean (R : ℂ) (m n : ℤ) (r₁ r₂ : ℝ) :
    ∫ φ₂ in (0 : ℝ)..2 * π,
        (let w : ℂ := r₁ + r₂ * Complex.exp (φ₂ * I)
         (w / ‖w‖) ^ n * Complex.exp (-(m * φ₂ * I)) * besselJ n (R * ‖w‖)) =
      2 * π * besselJ (n - m : ℤ) (R * r₁) * besselJ m (R * r₂) := by
  sorry

/-- README 2.2. **Radial form of the multiplication formula** (Vilenkin–Klimyk Vol. 1 §4.1.4
(8)–(9), with the cosine where the printed (8) has the exponential): for `r₁, r₂ > 0`,
`J_{n-m}(r₁) J_m(r₂) = (2/π) ∫_{|r₁-r₂|}^{r₁+r₂} cos(nφ - mφ₂) r Jₙ(r) / √Δ dr`,
`Δ = 4r₁²r₂² - (r² - r₁² - r₂²)²`, with `φ₂ = arccos((r² - r₁² - r₂²)/(2r₁r₂))` and
`φ = arg(r₁ + r₂ e^{iφ₂})`. -/
theorem besselJ_mul_besselJ_eq_integral (m n : ℤ) {r₁ r₂ : ℝ} (h₁ : 0 < r₁) (h₂ : 0 < r₂) :
    besselJ (n - m : ℤ) r₁ * besselJ m r₂ =
      2 / π * ∫ r in |r₁ - r₂|..r₁ + r₂,
        (let φ₂ := Real.arccos ((r ^ 2 - r₁ ^ 2 - r₂ ^ 2) / (2 * r₁ * r₂))
         let φ := Complex.arg (r₁ + r₂ * Complex.exp (φ₂ * I))
         (Real.cos (n * φ - m * φ₂) * r /
            Real.sqrt (4 * r₁ ^ 2 * r₂ ^ 2 - (r ^ 2 - r₁ ^ 2 - r₂ ^ 2) ^ 2) : ℝ) *
           besselJ n r) := by
  sorry

/-! ## Layer 3: Miller's complex group `T₃` -/

/-- README 3.1. Miller's local Lie group `T₃` in the coordinates `(b, c, τ)`. -/
@[ext]
structure T3 where
  /-- The coordinate of the raising direction. -/
  b : ℂ
  /-- The coordinate of the lowering direction. -/
  c : ℂ
  /-- The coordinate of the diagonal direction. -/
  τ : ℂ

namespace T3

instance : Mul T3 := ⟨fun g h => ⟨g.b + Complex.exp g.τ * h.b, g.c + Complex.exp (-g.τ) * h.c,
  g.τ + h.τ⟩⟩

instance : One T3 := ⟨⟨0, 0, 0⟩⟩

instance : Inv T3 := ⟨fun g => ⟨-(Complex.exp (-g.τ) * g.b), -(Complex.exp g.τ * g.c), -g.τ⟩⟩

/-- The raising coordinate of a product in `T3`. -/
@[simp] theorem mul_b (g h : T3) : (g * h).b = g.b + Complex.exp g.τ * h.b := rfl

/-- The lowering coordinate of a product in `T3`. -/
@[simp] theorem mul_c (g h : T3) : (g * h).c = g.c + Complex.exp (-g.τ) * h.c := rfl

/-- The diagonal coordinate of a product in `T3`. -/
@[simp] theorem mul_τ (g h : T3) : (g * h).τ = g.τ + h.τ := rfl

/-- The raising coordinate of the identity in `T3`. -/
@[simp] theorem one_b : (1 : T3).b = 0 := rfl

/-- The lowering coordinate of the identity in `T3`. -/
@[simp] theorem one_c : (1 : T3).c = 0 := rfl

/-- The diagonal coordinate of the identity in `T3`. -/
@[simp] theorem one_τ : (1 : T3).τ = 0 := rfl

instance : Group T3 where
  mul_assoc g h l := by
    ext <;> simp only [mul_b, mul_c, mul_τ, Complex.exp_add, neg_add] <;> ring
  one_mul g := by ext <;> simp
  mul_one g := by ext <;> simp
  inv_mul_cancel g := by
    ext
    · change -(Complex.exp (-g.τ) * g.b) + Complex.exp (-g.τ) * g.b = 0
      ring
    · change -(Complex.exp g.τ * g.c) + Complex.exp (-(-g.τ)) * g.c = 0
      simp
    · change -g.τ + g.τ = 0
      ring

end T3

/-- README 3.1. Miller's multiplier representation of `T₃` on functions of `z`,
`(A(g) f)(z) = exp(ω b z + ω c / z + m₀ τ) f(e^τ z)` (Miller (3.6)). -/
def millerAction (ω m₀ : ℂ) (g : T3) (f : ℂ → ℂ) (z : ℂ) : ℂ :=
  Complex.exp (ω * g.b * z + ω * g.c / z + m₀ * g.τ) * f (Complex.exp g.τ * z)

/-- README 3.1. Miller's matrix elements (3.11):
`A_{lk}(g) = e^{(k+m₀)τ} Σₛ (ωb)^{s+(l-k)⁺} (ωc)^{s+(k-l)⁺} / ((s+(l-k)⁺)! (s+(k-l)⁺)!)`. -/
def millerMatrix (ω m₀ : ℂ) (l k : ℤ) (g : T3) : ℂ :=
  Complex.exp ((k + m₀) * g.τ) *
    ∑' s : ℕ, (ω * g.b) ^ (s + (l - k).toNat) * (ω * g.c) ^ (s + (k - l).toNat) /
      (((s + (l - k).toNat).factorial : ℂ) * ((s + (k - l).toNat).factorial : ℂ))

/-- Sanity check of the definition: README 3.1. **Representation law of Miller's model** (Miller
(3.7)). -/
theorem millerAction_mul (ω m₀ : ℂ) (g h : T3) (f : ℂ → ℂ) :
    millerAction ω m₀ (g * h) f = millerAction ω m₀ g (millerAction ω m₀ h f) := by
  sorry

/-- Sanity check of the definition: README 3.1. **The identity acts trivially** in Miller's
model. -/
theorem millerAction_one (ω m₀ : ℂ) (f : ℂ → ℂ) : millerAction ω m₀ 1 f = f := by
  sorry

/-- README 3.1. **Generating function of the matrix elements** (Miller (3.9)):
`exp(ω b z + ω c / z + (k + m₀) τ) = Σ_l A_{lk}(g) z^{l-k}` for `z ≠ 0`. -/
theorem hasSum_millerMatrix (ω m₀ : ℂ) (k : ℤ) (g : T3) {z : ℂ} (hz : z ≠ 0) :
    HasSum (fun l : ℤ => millerMatrix ω m₀ l k g * z ^ (l - k))
      (Complex.exp (ω * g.b * z + ω * g.c / z + (k + m₀) * g.τ)) := by
  sorry

/-- README 3.1. **Addition theorem for the matrix elements** (Miller (3.10)). -/
theorem hasSum_millerMatrix_mul (ω m₀ : ℂ) (l k : ℤ) (g h : T3) :
    HasSum (fun j : ℤ => millerMatrix ω m₀ l j g * millerMatrix ω m₀ j k h)
      (millerMatrix ω m₀ l k (g * h)) := by
  sorry

/-- README 3.2. **Bessel form of the matrix elements** (Miller (3.13)–(3.14)): for
`b = r v / 2`, `c = -r / (2v)`,
`A_{lk} = e^{(m₀+k)τ} (-v)^{l-k} J_{l-k}(-ω r)`. -/
theorem millerMatrix_eq_besselJ (ω m₀ : ℂ) (l k : ℤ) (r v τ : ℂ) (hv : v ≠ 0) :
    millerMatrix ω m₀ l k ⟨r * v / 2, -r / (2 * v), τ⟩ =
      Complex.exp ((m₀ + k) * τ) * (-v) ^ (l - k) * besselJ (l - k : ℤ) (-ω * r) := by
  sorry

/-- README 3.3. The entire function `E_m(y) = Σₖ (-y/4)^k / (2^m k! Γ(m+k+1))`, which is
`u^{-m} J_m(u)` at `y = u²`. -/
def besselJEntire (m y : ℂ) : ℂ :=
  ∑' k : ℕ, (-y / 4) ^ k / ((2 : ℂ) ^ m * (k.factorial : ℂ) * Complex.Gamma (m + k + 1))

/-- README 3.3. **Weisner's generating function** (Miller (3.38)): for `|x t| < 2`, `t ≠ 0`,
`Σₙ Jₙ(x) tⁿ / Γ(m - n + 1) = (2 + x t)^m E_m(x² + 2x/t)`. -/
theorem hasSum_besselJ_weisner (m x t : ℂ) (ht : t ≠ 0) (hxt : ‖x * t‖ < 2) :
    HasSum (fun n : ℤ => besselJ n x * t ^ n * (Complex.Gamma (m - n + 1))⁻¹)
      ((2 + x * t) ^ m * besselJEntire m (x ^ 2 + 2 * x / t)) := by
  sorry

/-! ## Layer 4: the pseudo-Euclidean motion group `ISO(1,1)` -/

/-- README 4.1. The hyperbola model `(T_R(g) Φ)(θ) = e^{-R(a₁ cosh θ - a₂ sinh θ)} Φ(θ - s)` for
`g = (a, s)` (Vilenkin–Klimyk Vol. 1 §4.2.3 (1)–(3)). -/
def hyperbolaAction (R : ℂ) (g : ISO11) (Φ : ℝ → ℂ) (θ : ℝ) : ℂ :=
  Complex.exp (-R * (g.a.1 * Real.cosh θ - g.a.2 * Real.sinh θ : ℝ)) * Φ (θ - g.s)

/-- README 4.1. A representation on `L²(ℝ)` realizes the hyperbola model when it agrees almost
everywhere with the pointwise formula and has continuous orbit maps. -/
def IsHyperbolaRealization (R : ℂ) (U : ContRepresentation ℂ ISO11 (Lp ℂ 2 (volume : Measure ℝ))) :
    Prop :=
  (∀ g f, (U g f : ℝ → ℂ) =ᵐ[volume] hyperbolaAction R g f) ∧ ∀ f, Continuous fun g => U g f

/-- Sanity check of the definition: README 4.1. **Representation law of the hyperbola model.** -/
theorem hyperbolaAction_mul (R : ℂ) (g h : ISO11) (Φ : ℝ → ℂ) :
    hyperbolaAction R (g * h) Φ = hyperbolaAction R g (hyperbolaAction R h Φ) := by
  sorry

/-- Sanity check of the definition: README 4.1. **The identity acts trivially** in the hyperbola
model. -/
theorem hyperbolaAction_one (R : ℂ) (Φ : ℝ → ℂ) : hyperbolaAction R 1 Φ = Φ := by
  sorry

/-- README 4.1. **`L²` realization exactly on the imaginary axis.** -/
theorem exists_hyperbolaRealization_iff (R : ℂ) :
    (∃ U, IsHyperbolaRealization R U) ↔ R.re = 0 := by
  sorry

/-- README 4.1. **Unitarity of the hyperbola model**: every realization is unitary (and exists
only for `Re R = 0`). -/
theorem IsHyperbolaRealization.isUnitary {R : ℂ}
    {U : ContRepresentation ℂ ISO11 (Lp ℂ 2 (volume : Measure ℝ))}
    (hU : IsHyperbolaRealization R U) : U.IsUnitary := by
  sorry

/-- README 4.2. The two-sided Laplace transform `F(λ) = ∫ Φ(θ) e^{λθ} dθ`. -/
def fourierLaplace (Φ : ℝ → ℂ) (lam : ℂ) : ℂ := ∫ θ, Φ θ * Complex.exp (lam * θ)

/-- README 4.2. **Boosts act diagonally** in the Laplace realization (Vilenkin–Klimyk Vol. 1 §4.2.4
(3)). -/
theorem fourierLaplace_hyperbolaAction_boost (R : ℂ) (s : ℝ) (Φ : ℝ → ℂ)
    (lam : ℂ) :
    fourierLaplace (hyperbolaAction R ⟨0, s⟩ Φ) lam =
      Complex.exp (lam * s) * fourierLaplace Φ lam := by
  sorry

open scoped ContDiff in
/-- README 4.2. **Translations act by the Macdonald kernel** (Vilenkin–Klimyk Vol. 1 §4.2.4
(4)–(6)): for `Re R > 0`, `r > 0` and real `a`,
`F_g(λ) = (1/2π) ∫ (∫ e^{-R r cosh θ + (λ - a - it) θ} dθ) F(a + it) dt`, and the inner integral
is `2 K_{λ-a-it}(R r)`. -/
theorem fourierLaplace_hyperbolaAction_translation {R : ℂ} (hR : 0 < R.re) {r : ℝ} (hr : 0 < r)
    (a : ℝ) (Φ : ℝ → ℂ) (hΦ : ContDiff ℝ ∞ Φ) (hc : HasCompactSupport Φ) (lam : ℂ) :
    fourierLaplace (hyperbolaAction R ⟨(r, 0), 0⟩ Φ) lam =
      (2 * π)⁻¹ * ∫ t : ℝ,
        (∫ θ : ℝ, Complex.exp (-R * r * Real.cosh θ + (lam - (a + t * I)) * θ)) *
          fourierLaplace Φ (a + t * I) := by
  sorry

/-! ## Layer 5: the quasi-regular representation and the Hankel transform -/

/-- README 5.1. The affine action `x ↦ a + k x` of `M(n)` on `ℝⁿ`. -/
def motionApply {n : ℕ} (g : MotionGroup n) (x : EuclideanSpace ℝ (Fin n)) :
    EuclideanSpace ℝ (Fin n) :=
  g.a + rotE g.k x

/-- README 5.1. **Fourier transform of a translate-rotate**:
`𝓕(f ∘ g⁻¹)(ξ) = e^{-2πi⟨a, ξ⟩} 𝓕f(k⁻¹ ξ)`. -/
theorem fourier_comp_motionApply {n : ℕ} (g : MotionGroup n)
    (f : EuclideanSpace ℝ (Fin n) → ℂ) (ξ : EuclideanSpace ℝ (Fin n)) :
    𝓕 (fun x => f (motionApply g⁻¹ x)) ξ =
      Complex.exp (-(2 * π * ⟪g.a, ξ⟫_ℝ : ℝ) * I) * 𝓕 f (rotE g.k⁻¹ ξ) := by
  sorry

/-- README 5.1. **On the circle `|ξ| = ρ` the quasi-regular representation is `T_{-2πρ}`.** -/
theorem fourier_comp_motionApply_circle (g : MotionGroup 2)
    (f : EuclideanSpace ℝ (Fin 2) → ℂ) (ρ : ℝ) (ψ : 𝕋) :
    𝓕 (fun x => f (motionApply g⁻¹ x)) (ρ • unitVec ψ) =
      circleAction (-(2 * π * ρ)) g (fun ψ' => 𝓕 f (ρ • unitVec ψ')) ψ := by
  sorry

/-- README 5.1. **Cylindrical waves**: `u(x) = Jₙ(R|x|) (x/|x|)ⁿ` (complex coordinate) satisfies
`Δu = -R² u` away from the origin. -/
theorem laplacian_cylindricalWave (R : ℂ) (n : ℤ) {x : EuclideanSpace ℝ (Fin 2)} (hx : x ≠ 0) :
    Δ (fun y : EuclideanSpace ℝ (Fin 2) => besselJ n (R * ‖y‖) * (toComplex y / ‖y‖) ^ n) x =
      -R ^ 2 * (besselJ n (R * ‖x‖) * (toComplex x / ‖x‖) ^ n) := by
  sorry

/-- README 5.2. The Hankel transform of order `ν`, `(H_ν φ)(R) = ∫₀^∞ φ(r) J_ν(R r) r dr`. -/
def hankelTransform (ν : ℂ) (φ : ℝ → ℂ) (R : ℝ) : ℂ :=
  ∫ r in Ioi (0 : ℝ), φ r * besselJ ν (R * r) * r

/-- README 5.2. **Fourier transform of an angular mode** (Vilenkin–Klimyk Vol. 1 §4.4.2 (3), in
Mathlib's normalization): `𝓕(φ(|x|) e^{inα})(ρ e(ψ)) = 2π (-i)ⁿ e^{inψ} (Hₙφ)(2πρ)`. -/
theorem fourier_angularMode (n : ℤ) (φ : ℝ → ℂ)
    (hφ : IntegrableOn (fun r => φ r * r) (Ioi 0)) (ρ : ℝ) (hρ : 0 < ρ) (ψ : 𝕋) :
    𝓕 (fun x : EuclideanSpace ℝ (Fin 2) => φ ‖x‖ * (toComplex x / ‖x‖) ^ n) (ρ • unitVec ψ) =
      2 * π * (-I) ^ n * fourier n ψ * hankelTransform n φ (2 * π * ρ) := by
  sorry

open scoped ContDiff in
/-- README 5.2. **Hankel inversion** for real `ν > -1` on smooth functions with compact support
in `(0, ∞)` (Vilenkin–Klimyk Vol. 1 §4.4.2 (4) for integer `ν`; Vol. 2 §10.2.6 (3)–(4)). -/
theorem hankelTransform_hankelTransform {ν : ℝ} (hν : -1 < ν) (φ : ℝ → ℂ)
    (hφ : ContDiff ℝ ∞ φ) (hc : HasCompactSupport φ) (hs : tsupport φ ⊆ Ioi 0)
    {r : ℝ} (hr : 0 < r) :
    hankelTransform ν (hankelTransform ν φ) r = φ r := by
  sorry

open scoped ContDiff in
/-- README 5.2. **Plancherel for the Hankel transform** (Vilenkin–Klimyk Vol. 1 §4.4.2 (5) for
integer `ν`; Vol. 2 §10.2.6 (5)). -/
theorem lintegral_hankelTransform {ν : ℝ} (hν : -1 < ν) (φ : ℝ → ℂ)
    (hφ : ContDiff ℝ ∞ φ) (hc : HasCompactSupport φ) (hs : tsupport φ ⊆ Ioi 0) :
    ∫⁻ R in Ioi (0 : ℝ), ‖hankelTransform ν φ R‖ₑ ^ 2 * ENNReal.ofReal R =
      ∫⁻ r in Ioi (0 : ℝ), ‖φ r‖ₑ ^ 2 * ENNReal.ofReal r := by
  sorry

/-- README 5.2. **Laguerre functions are eigenfunctions** (Vilenkin–Klimyk Vol. 2 §10.2.6 (16),
p. 188):
`H_ν(x^ν e^{-x²/2} L_k^ν(x²))(λ) = (-1)^k λ^ν e^{-λ²/2} L_k^ν(λ²)`. -/
theorem hankelTransform_laguerre {ν : ℝ} (hν : -1 < ν) (k : ℕ) {lam : ℝ} (hlam : 0 < lam) :
    hankelTransform ν
        (fun x => ((x ^ ν * Real.exp (-x ^ 2 / 2) * (laguerre ν k).eval (x ^ 2) : ℝ) : ℂ)) lam =
      (((-1) ^ k * lam ^ ν * Real.exp (-lam ^ 2 / 2) * (laguerre ν k).eval (lam ^ 2) : ℝ) : ℂ) := by
  sorry

/-- README 5.3. **Fourier transform of a radial function on `ℝⁿ`**:
`𝓕f(ξ) = 2π |ξ|^{1-n/2} ∫₀^∞ φ(r) J_{n/2-1}(2π|ξ| r) r^{n/2} dr` for `f(x) = φ(|x|)`, `ξ ≠ 0`. -/
theorem fourier_radial {n : ℕ} (hn : 1 ≤ n) (φ : ℝ → ℂ)
    (hφ : IntegrableOn (fun r => φ r * r ^ (n - 1)) (Ioi 0)) {ξ : EuclideanSpace ℝ (Fin n)}
    (hξ : ξ ≠ 0) :
    𝓕 (fun x : EuclideanSpace ℝ (Fin n) => φ ‖x‖) ξ =
      2 * π * ((‖ξ‖ ^ (1 - (n : ℝ) / 2) : ℝ) : ℂ) *
        ∫ r in Ioi (0 : ℝ), φ r * besselJ ((n : ℂ) / 2 - 1) (2 * π * ‖ξ‖ * r) *
          ((r ^ ((n : ℝ) / 2) : ℝ) : ℂ) := by
  sorry

/-! ## Layer 6: the Gel'fand pair `(M(n), SO(n))` -/

/-- README 6.1. The zonal Bessel function
`Ω_n(λ, r) = Γ(n/2) Σₖ (-λ²r²/4)^k / (k! Γ(k + n/2))`, entire in `λ` and `r`. -/
def besselZonal (n : ℕ) (lam : ℂ) (r : ℝ) : ℂ :=
  Complex.Gamma (n / 2) *
    ∑' k : ℕ, (-(lam ^ 2) * r ^ 2 / 4) ^ k / ((k.factorial : ℂ) * Complex.Gamma (k + n / 2))

/-- README 6.1. The spherical function `φ_λ(a, k) = Ω_n(λ, |a|)` of `(M(n), SO(n))`. -/
def motionSphericalFunction (n : ℕ) (lam : ℂ) (g : MotionGroup n) : ℂ := besselZonal n lam ‖g.a‖

/-- README 6.1. The rotation subgroup `K = {(0, k)}` of `M(n)`. -/
def rotationSubgroup (n : ℕ) : Subgroup (MotionGroup n) where
  carrier := {g | g.a = 0}
  mul_mem' := by
    intro g h hg hh
    change g.a = 0 at hg
    change h.a = 0 at hh
    change g.a + rotE g.k h.a = 0
    simp [hg, hh, rotE]
  one_mem' := rfl
  inv_mem' := by
    intro g hg
    change g.a = 0 at hg
    change -rotE g.k⁻¹ g.a = 0
    simp [hg, rotE]

/-- README 6.1. **Bessel form of the zonal function**: for `λ` in the slit plane and `r > 0`,
`Ω_n(λ, r) = Γ(n/2) (2/(λr))^{n/2-1} J_{n/2-1}(λr)`. -/
theorem besselZonal_eq_besselJ {n : ℕ} {lam : ℂ} (hlam : lam ∈ slitPlane) {r : ℝ}
    (hr : 0 < r) :
    besselZonal n lam r =
      Complex.Gamma (n / 2) * (2 / (lam * r)) ^ ((n : ℂ) / 2 - 1) *
        besselJ ((n : ℂ) / 2 - 1) (lam * r) := by
  sorry

/-- README 6.1. **Integral over the sphere**: `Ω_n(λ, |a|)` is the mean of `e^{iλ⟨a, ξ⟩}` over
the unit sphere. -/
theorem besselZonal_eq_integral_sphere {n : ℕ} (hn : 1 ≤ n) (lam : ℂ)
    (a : EuclideanSpace ℝ (Fin n)) :
    besselZonal n lam ‖a‖ =
      ((volume : Measure (EuclideanSpace ℝ (Fin n))).toSphere univ).toReal⁻¹ *
        ∫ ξ : Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1,
          Complex.exp (I * lam * (⟪a, (ξ : EuclideanSpace ℝ (Fin n))⟫_ℝ : ℝ))
          ∂(volume : Measure (EuclideanSpace ℝ (Fin n))).toSphere := by
  sorry

open scoped ContDiff in
/-- README 6.1. **Real-analyticity of the zonal function** in `r`. -/
theorem contDiff_besselZonal (n : ℕ) (lam : ℂ) : ContDiff ℝ ω (besselZonal n lam) := by
  sorry

/-- README 6.1. **Radial equation**: `Ω″ + (n-1)/r Ω′ = -λ² Ω` for `r > 0`. -/
theorem besselZonal_ode (n : ℕ) (lam : ℂ) {r : ℝ} (hr : 0 < r) :
    deriv (deriv (besselZonal n lam)) r + ((n : ℂ) - 1) / r * deriv (besselZonal n lam) r =
      -lam ^ 2 * besselZonal n lam r := by
  sorry

/-- README 6.2. **The spherical functions of `(M(n), SO(n))`**, `n ≥ 2`: for the Haar
probability measure `ν` of `K`, `φ` is spherical exactly when it is `φ_λ` for some `λ ∈ ℂ`. -/
theorem isSphericalFunction_motion_iff {n : ℕ} (hn : 2 ≤ n) (ν : Measure (rotationSubgroup n))
    [IsProbabilityMeasure ν] [ν.IsMulLeftInvariant] (φ : MotionGroup n → ℂ) :
    IsSphericalFunction (rotationSubgroup n) ν φ ↔
      ∃ lam : ℂ, φ = motionSphericalFunction n lam := by
  sorry

/-- README 6.2. **The parameter is determined up to sign**: `φ_λ = φ_μ` exactly when
`λ² = μ²`. -/
theorem motionSphericalFunction_inj {n : ℕ} (hn : 1 ≤ n) (lam μ : ℂ) :
    motionSphericalFunction n lam = motionSphericalFunction n μ ↔ lam ^ 2 = μ ^ 2 := by
  sorry

/-- README 6.2. **Bounded spherical functions**: `Ω_n(λ, ·)` is bounded on `[0, ∞)` exactly for
real `λ`. -/
theorem bounded_besselZonal_iff {n : ℕ} (hn : 1 ≤ n) (lam : ℂ) :
    (∃ C, ∀ r : ℝ, 0 ≤ r → ‖besselZonal n lam r‖ ≤ C) ↔ lam.im = 0 := by
  sorry

/-- README 6.2. **The bound is `1`** for real `λ`. -/
theorem norm_besselZonal_le_one {n : ℕ} (hn : 1 ≤ n) {lam : ℂ} (hlam : lam.im = 0) (r : ℝ) :
    ‖besselZonal n lam r‖ ≤ 1 := by
  sorry

/-- README 6.2. **The zonal matrix element of `T_R` is the spherical function** at `n = 2`: for a
realization of `T_R`, `D_{00}(g) = J₀(R|a|) = Ω₂(R, |a|)`. -/
theorem IsCircleRealization.matrixElement_zero_zero {R : ℂ}
    {U : ContRepresentation ℂ (MotionGroup 2) (Lp ℂ 2 (haarAddCircle (T := 2 * π)))}
    (hU : IsCircleRealization R U) (g : MotionGroup 2) :
    matrixElement U fourierBasis 0 0 g = motionSphericalFunction 2 R g := by
  sorry

/-- README 6.3. **Plane-wave expansion in `ℝ³`** with the spherical harmonics of
SpecialFunctionsSU2MatrixElements §6.1 (DLMF 10.60.7 with 14.30.9), at any angles, since
`sphericalHarmonic` is a polynomial on `ℝ³`:
`e^{i⟨k, x⟩} = 4π Σ_l i^l j_l(κr) Σ_m Y_l^m(k̂) conj Y_l^m(x̂)`, `j_l(z) = √(π/2z) J_{l+1/2}(z)`. -/
theorem hasSum_planeWave_sphericalHarmonic {κ r : ℝ} (hκ : 0 < κ) (hr : 0 < r)
    (θ φ θ' φ' : ℝ) :
    HasSum (fun l : ℕ => 4 * π * I ^ l *
        (Real.sqrt (π / (2 * (κ * r))) * besselJ (l + 1 / 2 : ℂ) (κ * r)) *
        ∑ i ∈ Finset.range (2 * l + 1),
          sphericalHarmonic l i (spherePoint θ φ) *
            conj (sphericalHarmonic l i (spherePoint θ' φ')))
      (Complex.exp (I * (⟪κ • spherePoint θ φ, r • spherePoint θ' φ'⟫_ℝ : ℝ))) := by
  sorry

/-! ## Layer 7: contraction to the motion groups -/

/-- README 7.1. **Contraction of Wigner's `d`-functions**: for fixed `p, q ∈ ℤ` and real `x`,
`d^l_{pq}(x/l) → J_{p-q}(x)` as `l → ∞`. -/
theorem tendsto_wignerSmallD_besselJ (p q : ℤ) (x : ℝ) :
    Tendsto (fun l : ℕ =>
        (wignerSmallD (2 * l) ((l : ℤ) + p).toNat ((l : ℤ) + q).toNat (x / l) : ℂ))
      atTop (𝓝 (besselJ (p - q : ℤ) x)) := by
  sorry

/-- README 7.2. **Contraction of Gegenbauer polynomials** (Vilenkin–Klimyk Vol. 2 §9.3.4 (3), with
`(2r)` where the printed denominator has `(2p)`): for
`Re p > 0`, `r > 0`,
`l!/Γ(2p+l) C^p_l(cos(r/l)) → √π / ((2r)^{p-1/2} Γ(p)) J_{p-1/2}(r)`. -/
theorem tendsto_gegenbauer_besselJ {p : ℂ} (hp : 0 < p.re) {r : ℝ} (hr : 0 < r) :
    Tendsto (fun l : ℕ => (l.factorial : ℂ) / Complex.Gamma (2 * p + l) *
        (gegenbauer p l).eval (Real.cos (r / l) : ℂ))
      atTop (𝓝 (Real.sqrt π / ((2 * r : ℂ) ^ (p - 1 / 2) * Complex.Gamma p) *
        besselJ (p - 1 / 2) r)) := by
  sorry

end TauCetiRoadmap.SpecialFunctionsMotionGroupsBessel
