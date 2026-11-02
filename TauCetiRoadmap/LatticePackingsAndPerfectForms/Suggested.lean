module

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

/-!
# Lattice packings and perfect forms: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
results against the pinned Mathlib and Tau Ceti APIs, with simple definitions needed to state
them and admitted theorem proofs.

Headlines: the sharp Hermite bounds and constants in ranks 2–8 and 24; attainment and
Mordell's inequality; Voronoi fundamental domains and deep holes; Voronoi's extreme-form
criterion, finiteness of perfect and eutactic classes, and neighbour-closure completeness;
the moment criterion, strong perfection, harmonic theta modularity and Venkov's shell theorem;
the 15 and 290 universality theorems; and the rank-one discriminant-image index formula.

The tensor minimum theorem of Kitaoka and the tensor-decomposition results are not statable
at the pins without constructing the integral-lattice tensor product of README §7.1, which
is itself library work. The explicit Leech covering-radius and deep-hole classification need
the Leech lattice carrier from Rank24LatticeConstructions Layer 6. The finite perfect-form
classifications in ranks 4–8 need their specified representative families; the sharp scalar
Hermite conclusions are stated here. All other API, local checks and examples are in README.md.

The form carrier uses native Matrix.PosDef. Metric statements use FormSpace A, whose squared
norm is xᵀAx. Harmonic polynomials evaluated in integral coordinates use the inverse-Gram
Laplacian. Norms are squared lengths, not half-norms; universality and half-norm universality
are separate predicates. Nondegeneracy is explicit on discriminant-index definitions.
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

/-- **0.1.** The right action `A ↦ UᵀAU` of `GL_n(ℤ)` on forms. -/
noncomputable def actGL (U : GL (Fin n) ℤ) (A : PosDefForm n) : PosDefForm n :=
  ⟨((U : Matrix (Fin n) (Fin n) ℤ).map (Int.cast : ℤ → ℝ))ᵀ * A.1 *
      (U : Matrix (Fin n) (Fin n) ℤ).map (Int.cast : ℤ → ℝ), by
    have hU : IsUnit ((U : Matrix (Fin n) (Fin n) ℤ).map (Int.cast : ℤ → ℝ)) :=
      U.isUnit.map (Int.castRingHom ℝ).mapMatrix
    simpa [conjTranspose_eq_transpose_of_trivial] using
      A.2.conjTranspose_mul_mul_same (mulVec_injective_iff_isUnit.mpr hU)⟩

/-- **0.1.** The positive scaling `c • A` of a form, `c > 0`. -/
def smulPos (c : ℝ) (hc : 0 < c) (A : PosDefForm n) : PosDefForm n := ⟨c • A.1, A.2.smul hc⟩

/-- **0.1.** Similarity: `B = c · UᵀAU` for some `c > 0` and `U ∈ GL_n(ℤ)`. The Hermite invariant and densities are similarity invariant; minima and radii scale. -/
def Similar (A B : PosDefForm n) : Prop :=
  ∃ (c : ℝ) (hc : 0 < c) (U : GL (Fin n) ℤ), B = smulPos c hc (actGL U A)

/-- **0.1.** An integral form is a form with integer entries; `primitive` adds that the entries
have no common factor. -/
def IsIntegralForm (A : PosDefForm n) : Prop := ∀ i j, ∃ m : ℤ, A.1 i j = m

/-! ### 0.3 `FormSpace A` and the lattice `ℤⁿ` -/

/-- **0.3.** The real vector space `Fin n → ℝ` with the inner product `⟪x, y⟫ = xᵀAy`. The type
synonym carries only the instances declared below. -/
def FormSpace (_A : PosDefForm n) : Type := Fin n → ℝ

/-- The coordinates of a point of `FormSpace A`. -/
def toCoords (A : PosDefForm n) (x : FormSpace A) : Fin n → ℝ := x

/-- **0.3.** The additive group of the coordinate space. -/
instance formSpaceAddCommGroup (A : PosDefForm n) : AddCommGroup (FormSpace A) := inferInstanceAs (AddCommGroup (Fin n → ℝ))

/-- **0.3.** The real scalar action on the coordinate space. -/
instance formSpaceModule (A : PosDefForm n) : Module ℝ (FormSpace A) := inferInstanceAs (Module ℝ (Fin n → ℝ))

/-- **0.3.** The coordinate space has finite real dimension n. -/
instance formSpaceFiniteDimensional (A : PosDefForm n) : FiniteDimensional ℝ (FormSpace A) :=
  inferInstanceAs (FiniteDimensional ℝ (Fin n → ℝ))

/-- **0.3.** The inner-product core of `FormSpace A`: the inner product is `xᵀAy`, and the
axioms are the symmetry and positivity of `A`. -/
@[instance_reducible]
noncomputable def formCore (A : PosDefForm n) : InnerProductSpace.Core ℝ (FormSpace A) where
  inner x y := A.pairing (toCoords A x) (toCoords A y)
  conj_inner_symm x y := by
    have h : A.1ᵀ = A.1 := by
      simpa [conjTranspose_eq_transpose_of_trivial] using A.2.1.eq
    simp only [conj_trivial, pairing]
    rw [dotProduct_comm, dotProduct_mulVec, ← mulVec_transpose, h]
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

/-- **0.3.** The norm induced by the positive Gram form. -/
noncomputable instance formSpaceNormedAddCommGroup (A : PosDefForm n) : NormedAddCommGroup (FormSpace A) :=
  letI : InnerProductSpace.Core ℝ (FormSpace A) := formCore A
  InnerProductSpace.Core.toNormedAddCommGroup (𝕜 := ℝ)

/-- **0.3.** The inner product induced by the Gram matrix. -/
noncomputable instance formSpaceInnerProductSpace (A : PosDefForm n) : InnerProductSpace ℝ (FormSpace A) :=
  letI : InnerProductSpace.Core ℝ (FormSpace A) := formCore A
  InnerProductSpace.ofCore (inferInstance : PreInnerProductSpace.Core ℝ (FormSpace A))

/-- **0.3.** The Borel sigma algebra of the Gram metric. -/
noncomputable instance formSpaceMeasurableSpace (A : PosDefForm n) : MeasurableSpace (FormSpace A) := borel _

/-- **0.3.** The chosen measurable structure is the Borel structure. -/
instance formSpaceBorelSpace (A : PosDefForm n) : BorelSpace (FormSpace A) := ⟨rfl⟩

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

/-- **0.3.** The integral coordinate lattice is discrete. -/
instance stdLatticeDiscreteTopology (A : PosDefForm n) : DiscreteTopology (stdLattice A) := by
  rw [stdLattice_eq_span]; infer_instance

/-- **0.3.** The integral coordinate lattice spans the real space. -/
instance stdLatticeIsZLattice (A : PosDefForm n) : IsZLattice ℝ (stdLattice A) :=
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

/-- **1.1.** The shortest-vector shell of a positive definite form is finite. -/
theorem finite_minimalVectors (A : PosDefForm n) : A.minimalVectors.Finite := sorry

/-- **1.1.** The kissing number `#S(A)`, counting `x` and `−x` separately. -/
noncomputable def kissingNumber (A : PosDefForm n) : ℕ := A.minimalVectors.ncard

/-- **1.4.** The packing radius `√(min A)/2`. -/
noncomputable def packingRadius (A : PosDefForm n) : ℝ := Real.sqrt A.min / 2

/-- **1.4.** `Vₙ = √πⁿ / Γ(n/2 + 1)`, the volume of the unit ball in dimension `n`, in the form
Mathlib's `EuclideanSpace.volume_ball` produces. -/
noncomputable def unitBallVolume (n : ℕ) : ℝ := Real.sqrt Real.pi ^ n / Real.Gamma (n / 2 + 1)

/-- **1.4.** The center density `δ(A) = ρⁿ / √(det A)`. -/
noncomputable def centerDensity (A : PosDefForm n) : ℝ := A.packingRadius ^ n / Real.sqrt A.1.det

/-- **1.4.** The density `Δ(A) = Vₙ δ(A)`: the LMFDB `density` column. -/
noncomputable def density (A : PosDefForm n) : ℝ := unitBallVolume n * A.centerDensity

/-- **1.4.** The packing balls are disjoint, so the density is at most one. -/
theorem density_le_one (A : PosDefForm n) : A.density ≤ 1 := sorry

/-- **1.5.** The Hermite invariant `γ(A) = min A / (det A)^{1/n}`: the LMFDB `hermite` column. -/
noncomputable def hermite (A : PosDefForm n) : ℝ := A.min / A.1.det ^ ((1 : ℝ) / n)

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

/-- **2.1.** Mordell's inequality `γₙ^{n−2} ≤ γ_{n−1}^{n−1}`. -/
theorem hermiteConstant_pow_le (n : ℕ) (hn : 2 ≤ n) :
    hermiteConstant n ^ (n - 2) ≤ hermiteConstant (n - 1) ^ (n - 1) := sorry

/-- **2.2.** The constant is attained: there is a critical form (Mahler compactness, GoN 4.5.2). -/
theorem exists_hermite_eq_hermiteConstant (n : ℕ) (hn : 0 < n) :
    ∃ A : PosDefForm n, A.hermite = hermiteConstant n := sorry

/-- **2.3.** `γ₂² = 4/3`, attained by `A₂`. -/
theorem hermiteConstant_two_sq : hermiteConstant 2 ^ 2 = 4 / 3 := sorry

/-- **2.3.** `γ₃³ = 2`, attained by `A₃` (Gauss). -/
theorem hermiteConstant_three_pow : hermiteConstant 3 ^ 3 = 2 := sorry

/-- **4.10.** `γ₄⁴ = 4`, `γ₅⁵ = 8`, `γ₆⁶ = 64/3`, `γ₇⁷ = 64`, `γ₈⁸ = 256`, by the perfect-form
certificates (Korkine–Zolotarev; Blichfeldt). -/
theorem hermiteConstant_four_pow : hermiteConstant 4 ^ 4 = 4 := sorry

/-- **4.10.** The sharp rank-five Hermite value, attained by D₅. -/
theorem hermiteConstant_five_pow : hermiteConstant 5 ^ 5 = 8 := sorry

/-- **4.10.** The sharp rank-six Hermite value, attained by E₆. -/
theorem hermiteConstant_six_pow : hermiteConstant 6 ^ 6 = 64 / 3 := sorry

/-- **4.10.** The sharp rank-seven Hermite value, attained by E₇. -/
theorem hermiteConstant_seven_pow : hermiteConstant 7 ^ 7 = 64 := sorry

/-- **4.10.** The sharp rank-eight Hermite value, attained by E₈. -/
theorem hermiteConstant_eight_pow : hermiteConstant 8 ^ 8 = 256 := sorry

/-- **4.11.** `γ₂₄ = 4`, attained by the Leech lattice (Cohn–Kumar 2009). -/
theorem hermiteConstant_twentyFour : hermiteConstant 24 = 4 := sorry

/-! ## Layer 3: Voronoi cells and covering -/

/-- **3.1.** The Voronoi cell of the origin, `{x | ∀ v ∈ ℤⁿ, xᵀAx ≤ (x−v)ᵀA(x−v)}`. -/
def voronoiCell (A : PosDefForm n) : Set (FormSpace A) :=
  {x | ∀ v : Fin n → ℤ, A.eval (toCoords A x) ≤ A.eval (toCoords A x - intCast v)}

/-- **3.1.** The closed Voronoi cell of a full lattice is compact. -/
theorem isCompact_voronoiCell (A : PosDefForm n) : IsCompact A.voronoiCell := sorry

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

/-- **3.2.** Distance to a full lattice attains its maximum. -/
theorem exists_isDeepHole (A : PosDefForm n) : ∃ x, A.IsDeepHole x := sorry

/-- **3.2.** A deep hole is, up to a lattice translation, a vertex (extreme point) of the Voronoi
cell; the covering radius is the largest `√(A[x])` over those vertices. -/
theorem IsDeepHole.exists_sub_mem_extremePoints (A : PosDefForm n) {x : FormSpace A}
    (hx : A.IsDeepHole x) : ∃ v ∈ stdLattice A, x - v ∈ Set.extremePoints ℝ A.voronoiCell := sorry

/-- **3.2.** The covering density `Θ(A) = Vₙ μ(A)ⁿ / √(det A) ≥ 1`. -/
noncomputable def coveringDensity (A : PosDefForm n) : ℝ :=
  unitBallVolume n * A.coveringRadius ^ n / Real.sqrt A.1.det

/-- **3.2.** Covering by the balls of covering radius forces covering density at least one. -/
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

/-- **4.3.** Extreme: a local maximum of the Hermite invariant in the subspace topology of
`PosDefForm n ⊆ Matrix (Fin n) (Fin n) ℝ`. -/
def IsExtreme (A : PosDefForm n) : Prop := IsLocalMax hermite A

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

/-- **4.9.** A Voronoi neighbour of a perfect form is perfect, including the isolated rank-one case. -/
theorem isPerfect_voronoiNeighbour {P : PosDefForm n} (hP : P.IsPerfect)
    {N : Matrix (Fin n) (Fin n) ℝ} (hN : P.IsFacetNormal N) : (P.voronoiNeighbour N).IsPerfect :=
  sorry

/-- **4.9.** Voronoi neighbours preserve the input minimum. -/
theorem min_voronoiNeighbour {P : PosDefForm n} (hP : P.IsPerfect)
    {N : Matrix (Fin n) (Fin n) ℝ} (hN : P.IsFacetNormal N) : (P.voronoiNeighbour N).min = P.min :=
  sorry

/-- **4.10.** A nonempty finite family of perfect forms closed under neighbours up to
similarity meets every perfect similarity class. Rank one has a single class. -/
theorem perfectForms_complete (hn : 0 < n) (s : Finset (PosDefForm n))
    (hne : s.Nonempty) (hperfect : ∀ P ∈ s, P.IsPerfect)
    (hclosed : ∀ P ∈ s, ∀ N : Matrix (Fin n) (Fin n) ℝ, P.IsFacetNormal N →
      ∃ Q ∈ s, Similar (P.voronoiNeighbour N) Q)
    (A : PosDefForm n) (hA : A.IsPerfect) : ∃ Q ∈ s, Similar A Q := sorry

/-- **4.11.** The lattice Cohn–Elkies bound for a real-valued Schwartz function with
nonnegative real Fourier transform, positive Fourier value at zero and sign radius r. -/
theorem centerDensity_le_cohnElkies (A : PosDefForm n) (hn : 0 < n)
    (f : SchwartzMap (EuclideanSpace ℝ (Fin n)) ℂ) (r : ℝ) (hr : 0 < r)
    (hf : ∀ x, (f x).im = 0)
    (hfourier : ∀ x, (SchwartzMap.fourierTransformCLM ℂ f x).im = 0)
    (hpos : 0 < (SchwartzMap.fourierTransformCLM ℂ f 0).re)
    (hsign : ∀ x, r ≤ ‖x‖ → (f x).re ≤ 0)
    (hdual : ∀ x, 0 ≤ (SchwartzMap.fourierTransformCLM ℂ f x).re) :
    A.centerDensity ≤ (r / 2) ^ n * (f 0).re /
      (SchwartzMap.fourierTransformCLM ℂ f 0).re := sorry

/-- **4.11.** The dimension-24 auxiliary Schwartz function proving the sharp Leech bound. -/
theorem exists_leech_auxiliary :
    ∃ f : SchwartzMap (EuclideanSpace ℝ (Fin 24)) ℂ,
      (∀ x, (f x).im = 0) ∧
      (∀ x, (SchwartzMap.fourierTransformCLM ℂ f x).im = 0) ∧
      f 0 = 1 ∧ SchwartzMap.fourierTransformCLM ℂ f 0 = 1 ∧
      (∀ x, 2 ≤ ‖x‖ → (f x).re ≤ 0) ∧
      (∀ x, 0 ≤ (SchwartzMap.fourierTransformCLM ℂ f x).re) := sorry

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
      intro x hx
      simpa only [LinearMap.BilinMap.toQuadraticMap_apply, ← L.integralNorm_apply] using
        hL.posDef_integralNorm x hx
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

/-- **5.3.** A lattice whose minimal shell is a spherical 4-design is perfect. -/
theorem IsStronglyPerfect.isPerfect {A : PosDefForm n} (h : A.IsStronglyPerfect) : A.IsPerfect :=
  sorry

/-- **5.4.** The metric Laplacian Σᵢⱼ (A⁻¹)ᵢⱼ ∂ᵢ∂ⱼ, on Gram coordinates. -/
noncomputable def gramLaplacian (A : PosDefForm n) (P : MvPolynomial (Fin n) ℝ) :
    MvPolynomial (Fin n) ℝ :=
  ∑ i, ∑ j, A.1⁻¹ i j • MvPolynomial.pderiv i (MvPolynomial.pderiv j P)

/-- Harmonicity in the metric with Gram matrix A, in the given integral coordinates. -/
def IsHarmonic (A : PosDefForm n) (P : MvPolynomial (Fin n) ℝ) : Prop :=
  gramLaplacian A P = 0

open scoped FourierTransform in
/-- **5.5.** The harmonic-Gaussian Fourier identity in Gram metric, extended to a parameter
in the upper half-plane, with the principal complex power and negative Fourier phase. -/
theorem fourier_harmonic_gaussian_complex (A : PosDefForm n) (hn : 0 < n)
    (P : MvPolynomial (Fin n) ℝ) (d : ℕ) (hP : IsHarmonic A P)
    (hhom : P ∈ MvPolynomial.homogeneousSubmodule (Fin n) ℝ d)
    (τ : UpperHalfPlane) (ξ : FormSpace A) :
    (𝓕 (fun x : FormSpace A => (MvPolynomial.eval (toCoords A x) P : ℂ) *
      Complex.exp (Real.pi * Complex.I * (τ : ℂ) * (A.eval (toCoords A x) : ℂ)))) ξ =
      ((τ : ℂ) / Complex.I) ^ (-(n : ℂ) / 2) * (τ : ℂ) ^ (-(d : ℤ)) *
        (MvPolynomial.eval (toCoords A ξ) P : ℂ) *
        Complex.exp (-Real.pi * Complex.I * (A.eval (toCoords A ξ) : ℂ) / (τ : ℂ)) := sorry

/-- **5.6.** The theta series with harmonic coefficient `P`:
`Θ_{A,P}(τ) = ∑_{x ∈ ℤⁿ} P(x) e^{π i τ xᵀAx}`. -/
noncomputable def harmonicTheta (A : PosDefForm n) (P : MvPolynomial (Fin n) ℝ)
    (τ : UpperHalfPlane) : ℂ :=
  ∑' x : Fin n → ℤ, ((MvPolynomial.eval (intCast x) P : ℝ) : ℂ) *
    Complex.exp (Real.pi * Complex.I * (τ : ℂ) * (A.eval (intCast x) : ℝ))

/-- **5.6.** Every polynomially weighted positive definite theta series converges absolutely on the upper half-plane. -/
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
    (P : MvPolynomial (Fin n) ℝ) (hP : PosDefForm.IsHarmonic (gramForm hL b) P)
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

/-- **6.3. The 15 theorem** (Conway–Schneeberger; Bhargava). -/
theorem isUniversal_iff_fifteen (L : IntegralLattice V) (hL : L.IsPosDef) :
    IsUniversal L ↔ ∀ m ∈ ({1, 2, 3, 5, 6, 7, 10, 14, 15} : Finset ℕ), Represents L m := sorry

/-- **6.4. The 290 theorem** (Bhargava–Hanke), for the half-norms of an even lattice. -/
theorem isHalfUniversal_iff_twoNinety (L : IntegralLattice V) (hL : L.IsPosDef) (he : L.IsEven) :
    IsHalfUniversal L ↔ ∀ m ∈ ({1, 2, 3, 5, 6, 7, 10, 13, 14, 15, 17, 19, 21, 22, 23, 26, 29, 30,
      31, 34, 35, 37, 42, 58, 93, 110, 145, 203, 290} : Finset ℕ), Represents L (2 * m) := sorry

/-! ## Layer 7: the Festi–Veniani index

The tensor product of lattices (7.1–7.3) is specified in `README.md` only. -/

/-- Composition gives the native finite bilinear self-isometries their group structure. -/
instance bilinearIsometryGroup (D : TauCeti.FiniteBilinearModule) :
    Group (TauCeti.FiniteBilinearModule.Isometry D D) where
  mul f g := g.trans f
  one := TauCeti.FiniteBilinearModule.Isometry.refl D
  inv f := f.symm
  mul_assoc f g h := by
    apply DFunLike.ext; intro x
    change (h.trans (g.trans f)) x = ((h.trans g).trans f) x
    simp
  one_mul f := by
    apply DFunLike.ext; intro x
    change (f.trans (TauCeti.FiniteBilinearModule.Isometry.refl D)) x = f x
    simp
  mul_one f := by
    apply DFunLike.ext; intro x
    change ((TauCeti.FiniteBilinearModule.Isometry.refl D).trans f) x = f x
    simp
  inv_mul_cancel f := by
    apply DFunLike.ext; intro x
    change (f.trans f.symm) x = (TauCeti.FiniteBilinearModule.Isometry.refl D) x
    simp

/-- Composition gives the native finite quadratic self-isometries their group structure. -/
instance quadraticIsometryGroup (D : TauCeti.FiniteQuadraticModule) :
    Group (TauCeti.FiniteQuadraticModule.Isometry D D) where
  mul f g := g.trans f
  one := QuadraticMap.IsometryEquiv.refl D.quadratic
  inv f := f.symm
  mul_assoc f g h := by apply DFunLike.ext; intro x; rfl
  one_mul f := by apply DFunLike.ext; intro x; rfl
  mul_one f := by apply DFunLike.ext; intro x; rfl
  inv_mul_cancel f := by apply DFunLike.ext; intro x; exact f.toLinearEquiv.symm_apply_apply x

/-- **7.4.** The induced action on the native discriminant bilinear module. -/
noncomputable def discriminantHom (L : IntegralLattice V) [L.IsNondegenerate] :
    TauCeti.IntegralLattice.Isometry L L →*
      TauCeti.FiniteBilinearModule.Isometry L.discriminantBilinearModule
        L.discriminantBilinearModule where
  toFun e := e.discriminantBilinearIsometry
  map_one' := by
    apply DFunLike.ext; intro x
    change (Isometry.discriminantBilinearIsometry (1 : Isometry L L)) x =
      (TauCeti.FiniteBilinearModule.Isometry.refl _) x
    simp [Isometry.one_def]
  map_mul' f g := by
    apply DFunLike.ext; intro x
    change (Isometry.discriminantBilinearIsometry (f * g)) x =
      (g.discriminantBilinearIsometry.trans f.discriminantBilinearIsometry) x
    simp [Isometry.mul_def]

/-- **7.4.** The induced action on the native discriminant quadratic module of an even lattice. -/
noncomputable def discriminantQuadraticHom (L : IntegralLattice V) [L.IsNondegenerate]
    (he : L.IsEven) :
    TauCeti.IntegralLattice.Isometry L L →*
      TauCeti.FiniteQuadraticModule.Isometry (L.discriminantQuadraticModule he)
        (L.discriminantQuadraticModule he) where
  toFun e := e.discriminantQuadraticIsometry he
  map_one' := by
    apply DFunLike.ext; intro x
    change (Isometry.discriminantQuadraticIsometry (1 : Isometry L L) he).toAddEquiv x = x
    rw [Isometry.discriminantQuadraticIsometry_toAddEquiv]
    simp [Isometry.one_def]
    rfl
  map_mul' f g := by
    apply DFunLike.ext; intro x
    change (Isometry.discriminantQuadraticIsometry (f * g) he).toAddEquiv x =
      (f.discriminantQuadraticIsometry he).toAddEquiv ((g.discriminantQuadraticIsometry he).toAddEquiv x)
    simp only [Isometry.discriminantQuadraticIsometry_toAddEquiv]
    simp [Isometry.mul_def]
    rfl

open Classical in
/-- **7.5.** The index of the lattice-isometry image in the quadratic discriminant group for
an even lattice, and in the bilinear discriminant group for an odd lattice. -/
noncomputable def fvIndex (L : IntegralLattice V) [L.IsNondegenerate] : ℕ :=
  if he : L.IsEven then (discriminantQuadraticHom L he).range.index
  else (discriminantHom L).range.index

/-- **7.5.** For a singleton integral basis of norm m ≥ 3 the index counts the roots of unity
modulo m, with the stronger modulus 2m for even m, divided by the image order two. -/
theorem fvIndex_rankOne (L : IntegralLattice V) [L.IsNondegenerate]
    (b : Basis (Fin 1) ℤ L) (m : ℕ) (hm : 3 ≤ m)
    (hb : L.gramMatrix b = fun _ _ => (m : ℤ)) :
    fvIndex L =
      ((Finset.range m).filter fun u : ℕ =>
        Nat.Coprime u m ∧ u ^ 2 % (if m % 2 = 0 then 2 * m else m) = 1).card / 2 := sorry

end Lattice

end TauCetiRoadmap.LatticePackingsAndPerfectForms
