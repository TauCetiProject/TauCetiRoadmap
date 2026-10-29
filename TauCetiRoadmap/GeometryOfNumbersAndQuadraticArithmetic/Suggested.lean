import Mathlib
import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic
import TauCeti.NumberTheory.HurwitzClassNumber
import TauCeti.RepresentationTheory.Continuous.Unitary.Basic

/-!
# Geometry of numbers and quadratic arithmetic: headline theorems

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These statements give Lean forms for headline milestones; discharging them
finishes neither a layer nor the roadmap. Each theorem is a proof target marked with `sorry`.

The statements cover the intrinsic covolume identities (Layer 0), atomic normal forms over DVRs
of any characteristic (Layer 2), finite hermitian embedding counts (Layer 3), Davenport's multiset
estimate, Howe–Moore and Moore ergodicity, Ratner's three theorems, Oppenheim, Duke, Gauss's
three-square formula, Siegel's three-square lower bound, Mahler compactness and critical-lattice
existence, Dani–Margulis nondivergence and Siegel's mean value theorem (Layer 4), and the LLL
short-vector approximation factor (Layer 5). The definitions below specify only reducedness,
finite counts, bounded-format multiplicities, shells, strong continuity, star bodies and lattice
transforms used in these statements. All have real bodies on native carriers; semialgebraicity,
unitarity and Hurwitz class numbers use Tau Ceti.

Four headline theorems are not statable at the pins because their statements use the real
successive minima of a lattice with respect to a convex body, the carrier `successiveMin` of
SuccessiveMinima, which is not among the pinned Mathlib and Tau Ceti declarations: the upper half
of Minkowski's second theorem `(∏ λ_i) μ(K) ≤ 2^d covol_μ L` (§1.3.3), Henk's lattice-point bound
`|L ∩ K| < 2^{d-1} ∏ (⌊2/λ_i⌋ + 1)` (§4.1.12), Banaszczyk's transference bound
`λ_i(L) λ_{n+1-i}(L*) ≤ n` (§4.4.13) and the covering transference bound
`1/2 ≤ μ(L) λ_1(L*) ≤ n` (§4.4.14). The comparison of those minima with the squared-norm minima
of IntegralLattices §2F (§1.2.14) lacks the same carrier. They are README targets.

The Cho–Yamauchi formula and Siegel-polynomial functional equation (§3.2) are deferred here:
the pins do not provide the local hermitian density, normalized Siegel polynomial or integral
overlattice construction with its dual quotient and elementary divisors. The adelic mass
identity, orthogonal Tamagawa number and maximal-lattice mass formula (§3.3) need the
number-ring genus class set, adelic orthogonal quotient measures and smooth maximal
orthogonal stabilizer models. These are substantial constructions specified in Layers 2–3.
The signed hermitian Witt classification and transfer theorems (§2.9) need their signed Witt
quotients.

Hermitian delooping (§6.7.19), derived localization (§6.9), periodicity, finite-field comparisons
and integral L-theory (§§6.10–6.11) are deferred here because the pins have no hermitian
Q/Grothendieck–Witt spaces, hermitian suspension, common spectrum category or Poincaré
structures. Exact structures and DG categories alone do not supply those objects. The
number-ring homotopy-limit comparison and the higher integer Grothendieck–Witt groups are
outside this roadmap.
-/

noncomputable section
open scoped BigOperators Pointwise Topology NNReal ENNReal
open MeasureTheory Module

namespace TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

section ReductionConvention
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}

/-- The Gram–Schmidt coefficient `μ_{ij} = ⟨b_i, b*_j⟩/‖b*_j‖²` (5.1.1). -/
def lllCoefficient (b : Fin n → E) (i j : Fin n) : ℝ :=
  inner ℝ (b i) (InnerProductSpace.gramSchmidt ℝ b j) /
    ‖InnerProductSpace.gramSchmidt ℝ b j‖ ^ 2

/-- LLL-reduced at `δ = 3/4` (5.1.2): independent, size-reduced, and Lovász. -/
def IsLLLReduced (b : Fin n → E) : Prop :=
  LinearIndependent ℝ b ∧
  (∀ i j, j < i → |lllCoefficient b i j| ≤ 1/2) ∧
  (∀ i j, j.val + 1 = i.val →
    (3/4 - (lllCoefficient b i j) ^ 2) * ‖InnerProductSpace.gramSchmidt ℝ b j‖ ^ 2 ≤
      ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2)

end ReductionConvention

/-- The integer points of the sphere `x² + y² + z² = n`. -/
def ternaryShell (n : ℕ) : Set (Fin 3 → ℤ) := {v | ∑ i, v i ^ 2 = (n : ℤ)}

section Covolumes
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- The intrinsic covolume of the projection of `Δ` to `Wᗮ` is `covol Δ / covol (Δ ∩ W)` (0.3.1). -/
theorem covolume_projection
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ZLattice.covolume
      (Δ.map (Wᗮ.orthogonalProjectionOnto.toLinearMap.restrictScalars ℤ)) =
      ZLattice.covolume Δ / ZLattice.covolume (ZLattice.comap ℝ Δ W.subtype) := by sorry

/-- In a self-dual lattice the primitive intersections with `W` and `Wᗮ` have equal intrinsic
covolumes (0.3.3). -/
theorem primitive_orthogonal_covolume
    (Δ : Submodule ℤ E) [DiscreteTopology Δ] [IsZLattice ℝ Δ]
    (hΔ : LinearMap.BilinForm.dualSubmodule (innerₗ E) Δ = Δ) (W : Submodule ℝ E)
    (hW : Submodule.span ℝ (ZLattice.comap ℝ Δ W.subtype : Set W) = ⊤) :
    ZLattice.covolume (ZLattice.comap ℝ Δ Wᗮ.subtype) =
      ZLattice.covolume (ZLattice.comap ℝ Δ W.subtype) := by sorry

end Covolumes

section AtomicDVRForms
variable {R : Type*} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R] {n : ℕ}

/-- Voight's atomic integral quadratic forms over a DVR (2.6.1): a unit unary form, or, when `2`
is not a unit, a binary form `[a, b, c]` with `v(b) < v(2a) ≤ v(2c)` and `a` or `b` a unit. -/
def IsAtomicIntegralQuadraticForm (q : QuadraticForm R (Fin n → R)) : Prop :=
  (∃ (a : R) (e : (Fin n → R) ≃ₗ[R] R), IsUnit a ∧ ∀ x, q x = a * (e x) ^ 2) ∨
  (¬ IsUnit (2 : R) ∧ ∃ (a b c : R) (e : (Fin n → R) ≃ₗ[R] (Fin 2 → R)),
    IsDiscreteValuationRing.addVal R b < IsDiscreteValuationRing.addVal R (2 * a) ∧
    IsDiscreteValuationRing.addVal R (2 * a) ≤ IsDiscreteValuationRing.addVal R (2 * c) ∧
    (IsUnit a ∨ IsUnit b) ∧
    ∀ x, q x = a * (e x 0) ^ 2 + b * (e x 0) * (e x 1) + c * (e x 1) ^ 2)

/-- Every quadratic form on a finite projective module over a DVR, of any characteristic, has
an integral orthogonal decomposition into ordered uniformizer powers of atomic blocks and
a zero summand (2.6.11). The zero summand records the infinite exponents. -/
theorem atomic_normal_form {M : Type*} [AddCommGroup M] [Module R M]
    [Module.Finite R M] [Module.Projective R M] (q : QuadraticForm R M)
    (π : R) (hπ : Irreducible π) :
    ∃ (s z : ℕ) (size : Fin s → ℕ) (exponent : Fin s → ℕ)
      (blocks : (i : Fin s) → QuadraticForm R (Fin (size i) → R))
      (e : M ≃ₗ[R] (((i : Fin s) → Fin (size i) → R) × (Fin z → R))),
      Monotone exponent ∧ (∀ i, size i = 1 ∨ size i = 2) ∧
      (∀ i, IsAtomicIntegralQuadraticForm (blocks i)) ∧
      ∀ x, q x = ∑ i, π ^ exponent i * blocks i ((e x).1 i) := by sorry

end AtomicDVRForms

section FiniteHermitianCounts
variable {A : Type*} [CommRing A] [StarRing A] [Fintype A] [DecidableEq A]
  {m n : ℕ}

/-- The number of injective solutions of `Xᴴ G X = B` (3.1.2). -/
def hermitianEmbeddingCount (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) : ℕ := by
  classical
  exact Fintype.card {X : Matrix (Fin m) (Fin n) A |
    X.conjTranspose * G * X = B ∧ Function.Injective X.mulVec}

/-- **The finite hermitian embedding count** (3.1.3), with the radical dimension `a` of the source
retained in the product. -/
theorem finite_hermitian_isometry_formula {F : Type*} [Field F] [StarRing F]
    [Fintype F] [DecidableEq F] (q : ℕ) (hq : 2 ≤ q)
    (hcard : Fintype.card F = q ^ 2) (hstar : ∀ x : F, star x = x ^ q)
    (G : Matrix (Fin m) (Fin m) F) (B : Matrix (Fin n) (Fin n) F)
    (hG : G.conjTranspose = G) (hB : B.conjTranspose = B)
    (hGnd : G.det ≠ 0) (hmn : n ≤ m) :
    (hermitianEmbeddingCount G B : ℚ) = (q : ℚ) ^ (n * (2 * m - n)) *
      ∏ i ∈ Finset.range (n + finrank F (LinearMap.ker B.mulVecLin)),
        (1 - (-(q : ℚ)) ^ ((i : ℤ) - (m : ℤ))) := by sorry

end FiniteHermitianCounts

/-- A bounded multiplicity function whose positive superlevels have uniformly bounded
polynomial sign descriptions (4.1.13). The field `semialgebraic` follows from `format`; it records
the superlevels in Tau Ceti's semialgebraic predicate for consumers of that API. -/
structure SemialgebraicMultiset (n m k ell : ℕ) where
  multiplicity : (Fin n → ℝ) → ℕ
  bounded_support : Bornology.IsBounded (Function.support multiplicity)
  multiplicity_le : ∀ x, multiplicity x ≤ m
  semialgebraic : ∀ j, 1 ≤ j → j ≤ m →
    TauCeti.IsSemialgebraic {x | j ≤ multiplicity x}
  format : ∀ j, 1 ≤ j → j ≤ m →
    ∃ p : Fin k → MvPolynomial (Fin n) ℝ, (∀ i, (p i).totalDegree ≤ ell) ∧
      ∃ signs : Set (Fin k → SignType),
        {x | j ≤ multiplicity x} =
          {x | (fun i => SignType.sign (MvPolynomial.eval x (p i))) ∈ signs}

/-- The lattice count of a multiplicity function (4.1.13). -/
def multisetLatticeCount {n : ℕ} (μ : (Fin n → ℝ) → ℕ) : ℝ :=
  ∑' z : Fin n → ℤ, (μ (fun i => (z i : ℝ)) : ℝ)

/-- The volume of a multiplicity function, retaining multiplicities (4.1.13). -/
def multisetVolume {n : ℕ} (μ : (Fin n → ℝ) → ℕ) : ℝ := ∫ x, (μ x : ℝ)

/-- **Davenport's multiset estimate** (4.1.13): the error is bounded uniformly over triangular
unipotent changes of coordinates by the proper projection volumes of the original support. -/
theorem davenport_multiset_estimate (n m k ell : ℕ) (hn : 1 ≤ n) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ M : SemialgebraicMultiset n m k ell,
      ∀ A : Matrix.GeneralLinearGroup (Fin n) ℝ,
        ((A : Matrix (Fin n) (Fin n) ℝ).IsUpperTriangular ∨
          (A : Matrix (Fin n) (Fin n) ℝ).IsLowerTriangular) →
        (∀ i, (A : Matrix (Fin n) (Fin n) ℝ) i i = 1) →
        |multisetLatticeCount (fun x =>
            M.multiplicity ((A⁻¹ : Matrix.GeneralLinearGroup (Fin n) ℝ).val.mulVec x)) -
          multisetVolume M.multiplicity| ≤ C * max 1
            (sSup {r : ℝ | ∃ s : Finset (Fin n), s.Nonempty ∧ s.card < n ∧
              r = volume.real ((fun x : Fin n → ℝ => fun i : s => x i) ''
                Function.support M.multiplicity)}) := by sorry

section HilbertDynamics
variable {G H : Type*} [Group G] [TopologicalSpace G]
  [NormedAddCommGroup H] [InnerProductSpace ℂ H]

/-- Strong continuity: every orbit map `g ↦ π(g) v` is continuous (4.2). Mathlib's
`ContRepresentation` bundles continuity of each operator, not continuity in `g`. -/
def StronglyContinuous (π : ContRepresentation ℂ G H) : Prop :=
  ∀ v : H, Continuous (fun g : G => π g v)

end HilbertDynamics

section HoweMoore
open scoped Manifold ContDiff
variable {E G H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [hdim : FiniteDimensional ℝ E] [CompleteSpace E] [TopologicalSpace G] [ChartedSpace E G]
  [Group G] [LieGroup 𝓘(ℝ, E) (minSmoothness ℝ 3) G] [IsTopologicalGroup G]
  [hmanifold : IsManifold 𝓘(ℝ, E) ∞ G]
  [T2Space G] [SecondCountableTopology G] [hconn : ConnectedSpace G]
  [hcenter : Finite (Subgroup.center G)]
  [hsimple : LieAlgebra.IsSimple ℝ (GroupLieAlgebra 𝓘(ℝ, E) G)]
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

include hdim hmanifold hconn hcenter hsimple

open TauCeti in
/-- **Howe–Moore** (4.2.1): coefficients of a strongly continuous unitary representation of
a connected noncompact simple real Lie group with finite centre vanish at infinity when
there are no nonzero invariant vectors. No separability hypothesis on the Hilbert space is needed. -/
theorem howe_moore (hG : ¬ IsCompact (Set.univ : Set G))
    (π : ContRepresentation ℂ G H) (hs : StronglyContinuous π)
    (hu : ContRepresentation.IsUnitary π) (hi : π.invariants = ⊥) (v w : H) :
    Filter.Tendsto (fun g : G => inner (𝕜 := ℂ) (π g v) w)
      (Filter.cocompact G) (nhds 0) := by sorry

/-- **Moore ergodicity** (4.2.2): every closed noncompact subgroup of a connected simple
real Lie group with finite centre acts ergodically on each finite-volume lattice quotient. -/
theorem moore_ergodicity (Γ : Subgroup G) [DiscreteTopology Γ]
    [MeasurableSpace (G ⧸ Γ)] [BorelSpace (G ⧸ Γ)]
    (μ : Measure (G ⧸ Γ)) [IsProbabilityMeasure μ]
    (hμ : ∀ g : G, MeasurePreserving (fun x : G ⧸ Γ => g • x) μ μ)
    (K : Subgroup G) (hK : IsClosed (K : Set G)) (hnc : ¬ IsCompact (K : Set G)) :
    ErgodicSMul K (G ⧸ Γ) μ := by sorry

end HoweMoore

section Ratner
open scoped Manifold ContDiff
variable {E G : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [hdim : FiniteDimensional ℝ E] [CompleteSpace E] [TopologicalSpace G] [ChartedSpace E G]
  [Group G] [LieGroup 𝓘(ℝ, E) (minSmoothness ℝ 3) G] [IsTopologicalGroup G]
  [hmanifold : IsManifold 𝓘(ℝ, E) ∞ G]
  [T2Space G] [SecondCountableTopology G] [hconn : ConnectedSpace G]
  [hsemisimple : LieAlgebra.IsSemisimple ℝ (GroupLieAlgebra 𝓘(ℝ, E) G)]
  {d : ℕ} (ρ : G →* Matrix.GeneralLinearGroup (Fin d) ℝ)
  (hρ : Topology.IsClosedEmbedding ρ)
  (Γ : Subgroup G) [DiscreteTopology Γ]
  [MeasurableSpace (G ⧸ Γ)] [BorelSpace (G ⧸ Γ)]
  (μ : Measure (G ⧸ Γ)) [IsProbabilityMeasure μ]
  (hμ : ∀ g : G, MeasurePreserving (fun x : G ⧸ Γ => g • x) μ μ)
  (U : Subgroup G) [ConnectedSpace U]
  (hU : U = Subgroup.closure {g : G | ∃ u : ℝ → G,
    Continuous u ∧ u 0 = 1 ∧ (∀ s t, u (s + t) = u s * u t) ∧
    (∀ t, u t ∈ U ∧ IsNilpotent ((ρ (u t) : Matrix (Fin d) (Fin d) ℝ) - 1)) ∧
    g ∈ Set.range u})

include ρ hρ μ hμ hU hdim hmanifold hconn hsemisimple

/-- **Ratner's orbit-closure theorem** (4.2.4): an orbit of a connected subgroup generated
by one-parameter unipotents has a closed homogeneous closure supporting an invariant
probability. This probability expresses finite volume of the homogeneous orbit. -/
theorem ratner_orbit_closure (x : G ⧸ Γ) :
    ∃ L : Subgroup G, U ≤ L ∧ IsClosed (L : Set G) ∧ ConnectedSpace L ∧
      closure (Set.range (fun u : U => u • x)) = Set.range (fun l : L => l • x) ∧
      ∃ ν : Measure (G ⧸ Γ), IsProbabilityMeasure ν ∧
        ν (Set.range (fun l : L => l • x))ᶜ = 0 ∧
        ∀ l : L, MeasurePreserving (fun y : G ⧸ Γ => l • y) ν ν := by sorry

/-- **Ratner's measure-classification theorem** (4.2.5): every ergodic invariant probability
for the unipotent-generated subgroup is the homogeneous probability of a closed orbit. -/
theorem ratner_measure_classification (ν : Measure (G ⧸ Γ)) [IsProbabilityMeasure ν]
    (hν : ErgodicSMul U (G ⧸ Γ) ν) :
    ∃ (L : Subgroup G) (x : G ⧸ Γ), U ≤ L ∧ IsClosed (L : Set G) ∧
      ConnectedSpace L ∧ IsClosed (Set.range (fun l : L => l • x)) ∧
      ν (Set.range (fun l : L => l • x))ᶜ = 0 ∧
      ∀ l : L, MeasurePreserving (fun y : G ⧸ Γ => l • y) ν ν := by sorry

omit [ConnectedSpace U] hU in
/-- **Ratner's equidistribution theorem** (4.2.6): each one-parameter unipotent trajectory
equidistributes in a closed finite-volume homogeneous orbit against compactly supported
continuous observables. -/
theorem ratner_equidistribution (u : ℝ → G) (hu : Continuous u) (hu0 : u 0 = 1)
    (humul : ∀ s t, u (s + t) = u s * u t)
    (hunip : ∀ t, IsNilpotent ((ρ (u t) : Matrix (Fin d) (Fin d) ℝ) - 1))
    (x : G ⧸ Γ) :
    ∃ L : Subgroup G, IsClosed (L : Set G) ∧ ConnectedSpace L ∧
      (∀ t, u t ∈ L) ∧ IsClosed (Set.range (fun l : L => l • x)) ∧
      closure (Set.range (fun t : ℝ => u t • x)) = Set.range (fun l : L => l • x) ∧
      ∃ ν : Measure (G ⧸ Γ), IsProbabilityMeasure ν ∧
        ν (Set.range (fun l : L => l • x))ᶜ = 0 ∧
        (∀ l : L, MeasurePreserving (fun y : G ⧸ Γ => l • y) ν ν) ∧
        ∀ f : G ⧸ Γ → ℝ, Continuous f → HasCompactSupport f →
          Filter.Tendsto (fun T : ℝ => (∫ t in (0 : ℝ)..T, f (u t • x)) / T)
            Filter.atTop (nhds (∫ y, f y ∂ν)) := by sorry

end Ratner

section Oppenheim

/-- **Margulis's theorem** (Oppenheim conjecture, 4.3.1): a nondegenerate indefinite form in at
least three variables that is not proportional to a rational form has dense values on `ℤⁿ`. -/
theorem oppenheim_values {n : ℕ} (hn : 3 ≤ n) (q : QuadraticForm ℝ (Fin n → ℝ))
    (hnd : (QuadraticMap.associated q).SeparatingLeft)
    (hind : (∃ x, q x > 0) ∧ (∃ x, q x < 0))
    (hirr : ¬ ∃ c : ℝ, c ≠ 0 ∧ ∀ z : Fin n → ℤ,
      ∃ r : ℚ, q (fun i => (z i : ℝ)) = c * (r : ℝ)) :
    Dense (Set.range (fun z : Fin n → ℤ => q (fun i => (z i : ℝ)))) := by sorry

end Oppenheim

/-- **Duke's equidistribution theorem** (4.3.2): normalized shell averages converge to the
normalized rotation-invariant surface integral along admissible squarefree radii. -/
theorem duke_sphere_equidistribution
    (f : EuclideanSpace ℝ (Fin 3) → ℝ) (hf : ContinuousOn f (Metric.sphere 0 1)) :
    Filter.Tendsto
      (fun n : ℕ => (∑' v : ternaryShell n,
        f ((Real.sqrt n)⁻¹ • WithLp.toLp 2 (fun i => (v.1 i : ℝ)))) /
          (Nat.card (ternaryShell n) : ℝ))
      (Filter.atTop ⊓ Filter.principal {n : ℕ | 0 < n ∧ Squarefree n ∧ n % 8 ≠ 7})
      (nhds ((∫ x : Metric.sphere (0 : EuclideanSpace ℝ (Fin 3)) 1,
        f x ∂(volume : Measure (EuclideanSpace ℝ (Fin 3))).toSphere) /
          (volume : Measure (EuclideanSpace ℝ (Fin 3))).toSphere.real Set.univ)) := by sorry

/-- **Gauss's three-square theorem** in Hurwitz form: `r₃(n) = 12 (H(4n) - 2 H(n))`, with Tau Ceti's
Hurwitz class number, including imprimitive classes and their stabilizer weights. -/
theorem three_square_hurwitz {n : ℕ} (hn : 0 < n) :
    (Nat.card (ternaryShell n) : ℚ) =
      12 * (TauCeti.hurwitzClassNumber (4 * n) - 2 * TauCeti.hurwitzClassNumber n) := by sorry

/-- The ineffective lower bound for three-square representations on the positive squarefree
sequence excluding `7 mod 8` (4.3), including the small discriminants with extra units. -/
theorem siegel_three_square_lower_bound (ε : ℝ) (hε : 0 < ε) :
    ∃ c : ℝ, 0 < c ∧ ∀ n : ℕ, 0 < n → Squarefree n → n % 8 ≠ 7 →
      c * Real.rpow (n : ℝ) (1 / 2 - ε) ≤ (Nat.card (ternaryShell n) : ℝ) := by sorry

section StarBodies
variable (E : Type*) [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- A star body, given by its continuous nonnegative positively homogeneous gauge (4.5.1);
convexity, boundedness and definiteness are not assumed. -/
structure StarBody where
  gauge : E → ℝ
  continuous : Continuous gauge
  nonneg : ∀ x, 0 ≤ gauge x
  homogeneous : ∀ (a : ℝ), 0 ≤ a → ∀ x, gauge (a • x) = a * gauge x

variable {E}

/-- A lattice is admissible when the open sublevel `gauge < 1` contains no nonzero lattice point
(4.5.1). -/
def StarBody.admissible (K : StarBody E) (L : Submodule ℤ E) : Prop :=
  ∀ x ∈ L, x ≠ 0 → 1 ≤ K.gauge x

/-- A star body is of finite type when some full discrete lattice is admissible (4.5.1). -/
def StarBody.IsFiniteType (K : StarBody E) : Prop :=
  ∃ (L : Submodule ℤ E) (_ : DiscreteTopology L) (_ : IsZLattice ℝ L), K.admissible L

end StarBodies

section CriticalDeterminants
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- The critical determinant `Δ(K)`: the infimum of covolumes of admissible full lattices
(4.5.2); it is `0` for a body that is not of finite type. -/
def criticalDeterminant (K : StarBody E) : ℝ :=
  sInf {d | ∃ (L : Submodule ℤ E) (_ : DiscreteTopology L) (_ : IsZLattice ℝ L),
    K.admissible L ∧ d = ZLattice.covolume L}

/-- **Mahler's theorem** (4.5.9): every star body of finite type, bounded or not, has a critical
lattice. -/
theorem critical_lattice_exists (K : StarBody E) (hK : K.IsFiniteType) :
    ∃ (L : Submodule ℤ E) (_ : DiscreteTopology L) (_ : IsZLattice ℝ L),
      K.admissible L ∧ ZLattice.covolume L = criticalDeterminant K := by sorry

end CriticalDeterminants

section SiegelTransform
variable {E : Type*} [AddCommGroup E] [Module ℤ E]

/-- The Siegel transform `Σ_{v ∈ L ∖ 0} f(v)` (4.6). -/
def siegelTransform (L : Submodule ℤ E) (f : E → ℝ) : ℝ :=
  ∑' v : {v : L // (v : E) ≠ 0}, f (v.val : E)

/-- The nonnegative lattice transform, allowing infinite sums (4.6.1). -/
def siegelTransformNonneg (L : Submodule ℤ E) (f : E → ℝ≥0∞) : ℝ≥0∞ :=
  ∑' v : {v : L // (v : E) ≠ 0}, f (v.val : E)

end SiegelTransform

section UnimodularLattices
variable {n : ℕ} (Γ : Subgroup (Matrix.SpecialLinearGroup (Fin n) ℝ))
  (hΓ : ∀ g : Matrix.SpecialLinearGroup (Fin n) ℝ,
    g ∈ Γ ↔ ∀ i j, ∃ z : ℤ, (z : ℝ) = (g : Matrix (Fin n) (Fin n) ℝ) i j)

include hΓ

/-- A family of unimodular lattices is relatively compact exactly when its shortest nonzero
vectors have a common positive lower bound (4.5.8). -/
theorem mahler_relativelyCompact_iff (hn : 2 ≤ n)
    (A : Set (Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ)) :
    IsCompact (closure A) ↔ ∃ ε : ℝ, 0 < ε ∧
      ∀ x ∈ A, ∀ z : Fin n → ℤ, z ≠ 0 → ε ≤
        ‖WithLp.toLp 2 (fun i => ∑ j,
          (x.out : Matrix (Fin n) (Fin n) ℝ) i j * (z j : ℝ))‖ := by sorry

/-- **Dani–Margulis nondivergence** (4.2.3): every trajectory of a one-parameter unipotent
in the space of unimodular lattices spends uniformly almost all of each initial time interval
in one compact set. -/
theorem dani_margulis_nondivergence (hn : 2 ≤ n)
    (u : ℝ → Matrix.SpecialLinearGroup (Fin n) ℝ) (hu : Continuous u) (hu0 : u 0 = 1)
    (humul : ∀ s t, u (s + t) = u s * u t)
    (hunip : ∀ t, IsNilpotent ((u t : Matrix (Fin n) (Fin n) ℝ) - 1))
    (x : Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : Set (Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ), IsCompact C ∧
      ∀ T : ℝ, 0 < T → (1 - ε) * T ≤
        volume.real {t : ℝ | t ∈ Set.Icc 0 T ∧ u t • x ∈ C} := by sorry

/-- **Siegel's mean value theorem** (4.6.1): the nonzero-vector lattice transform is
integrable and has the same integral as the original integrable function on `ℝⁿ`.
The quotient measure is the invariant probability, and `n ≥ 2`. -/
theorem siegel_mean_value (hn : 2 ≤ n)
    [MeasurableSpace (Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ)]
    [BorelSpace (Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ)]
    (μ : Measure (Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ)) [IsProbabilityMeasure μ]
    (hμ : ∀ g : Matrix.SpecialLinearGroup (Fin n) ℝ,
      MeasurePreserving (fun x : Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ => g • x) μ μ)
    (f : EuclideanSpace ℝ (Fin n) → ℝ) (hf : Integrable f) :
    let F := fun x : Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ =>
      siegelTransform (Submodule.span ℤ (Set.range (fun j : Fin n =>
        WithLp.toLp 2 (fun i => (x.out : Matrix (Fin n) (Fin n) ℝ) i j)))) f
    Integrable F μ ∧ ∫ x, F x ∂μ = ∫ y, f y := by sorry

/-- The Tonelli form of Siegel's mean value theorem (4.6.1), including infinite values. -/
theorem siegel_mean_value_nonneg (hn : 2 ≤ n)
    [MeasurableSpace (Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ)]
    [BorelSpace (Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ)]
    (μ : Measure (Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ)) [IsProbabilityMeasure μ]
    (hμ : ∀ g : Matrix.SpecialLinearGroup (Fin n) ℝ,
      MeasurePreserving (fun x : Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ => g • x) μ μ)
    (f : EuclideanSpace ℝ (Fin n) → ℝ≥0∞) (hf : Measurable f) :
    let F := fun x : Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ Γ =>
      siegelTransformNonneg (Submodule.span ℤ (Set.range (fun j : Fin n =>
        WithLp.toLp 2 (fun i => (x.out : Matrix (Fin n) (Fin n) ℝ) i j)))) f
    Measurable F ∧ ∫⁻ x, F x ∂μ = ∫⁻ y, f y := by sorry

end UnimodularLattices

section LLLApproximation
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}

/-- **The LLL approximation factor** (5.1.4): `‖b₀‖² ≤ 2^{n-1} ‖x‖²` for nonzero `x` in the
integer span. -/
theorem lll_short_vector_factor (b : Fin n → E) (h : IsLLLReduced b) (hn : 0 < n)
    (x : E) (hx : x ∈ Submodule.span ℤ (Set.range b)) (h0 : x ≠ 0) :
    ‖b ⟨0, hn⟩‖ ^ 2 ≤ (2 : ℝ) ^ (n - 1) * ‖x‖ ^ 2 := by sorry

end LLLApproximation

end TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic
