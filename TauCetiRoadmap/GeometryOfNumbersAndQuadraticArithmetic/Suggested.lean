module

public import Mathlib
public import TauCeti.Algebra.Module.ZLattice.RealModel
public import TauCeti.Algebra.Module.ZLattice.SuccessiveMinima
public import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic
public import TauCeti.LinearAlgebra.IntegralLattice.PosDef.SuccessiveMinima
public import TauCeti.NumberTheory.HurwitzClassNumber
public import TauCeti.RepresentationTheory.Continuous.Unitary.Basic

/-!
# Geometry of numbers and quadratic arithmetic: target signatures

**This file is not the roadmap and is not exhaustive.** The roadmap is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti; discharging them
finishes neither a layer nor the roadmap. Each theorem is a proof target marked with `sorry`.

The statements cover the intrinsic covolume identities (Layer 0), the comparison of the real
successive minima of the real model with the squared-norm successive minima of a positive definite
integral lattice (Layer 1), atomic normal forms over DVRs of any characteristic (Layer 2), finite
hermitian embedding counts (Layer 3), Henk's lattice-point bound, Davenport's multiset estimate,
Howe–Moore and Moore ergodicity, Ratner's three theorems, Oppenheim, Duke, Gauss's three-square
formula, Siegel's three-square lower bound, Mahler compactness and critical-lattice existence,
Dani–Margulis nondivergence, Siegel's mean value theorem, Banaszczyk's transference bound, the
covering transference bound, Campbell's formula, and the uniqueness, existence and restriction
theorems for Poisson random measures of σ-finite intensity (Layer 4), the LLL short-vector
approximation factor (Layer 5), and Arf's theorems over a finite field of characteristic two
(Layer 6). The definitions below specify only the Euclidean unit ball as a convex body, finite
counts, bounded-format multiplicities, strong continuity, shells, intensity and Campbell measures,
the Poisson property, the covering radius, star bodies, lattice transforms, reducedness and the
Arf class used in these statements. All have real bodies on native
carriers; the real model, both kinds of successive minima, semialgebraicity, unitarity and Hurwitz
class numbers use Tau Ceti.

The upper half of Minkowski's second theorem is Tau Ceti's
`ZLattice.prod_successiveMin_mul_measure_le_two_pow_mul_covolume`, so it is not restated here.

The Cho–Yamauchi formula and Siegel-polynomial functional equation (§3.2) are not statable at
the pins, which do not provide the local hermitian density, normalized Siegel polynomial or
integral overlattice construction with its dual quotient and elementary divisors. The adelic mass
identity, orthogonal Tamagawa number and maximal-lattice mass formula (§3.3) need the
number-ring genus class set, adelic orthogonal quotient measures and smooth maximal
orthogonal stabilizer models, which the pins lack; Layers 2–3 specify them. The signed
hermitian Witt classification and transfer theorems (§2.9) need their signed Witt quotients,
which the pins lack.

Hermitian delooping (§6.7.19), derived localization (§6.9), periodicity, finite-field comparisons
and integral L-theory (§§6.10–6.11) are not statable at the pins, which have no hermitian
Q/Grothendieck–Witt spaces, hermitian suspension, common spectrum category or Poincaré
structures. Exact structures and DG categories alone do not supply those objects. The stable
stems of §6.1a need the reduced suspension of a pointed space, which is not at the pins; the
integral Wall form and formation groups of §6.8 and their calculations feed only the integral
L-theory above and are stated in the README with it. The number-ring homotopy-limit comparison
and the higher integer Grothendieck–Witt groups are outside this roadmap.
-/

@[expose] public section

noncomputable section
open scoped BigOperators Pointwise Topology NNReal ENNReal
open MeasureTheory Module

namespace TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

/-! ## Layer 0: Lattices, Gram determinants and covolumes -/

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

/-! ## Layer 1: Elementary volume bounds and squared-norm minima -/

/-- The closed Euclidean unit ball, as a convex body (1.2.14, 4.4.13). -/
def euclideanUnitBall {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] : ConvexBody E where
  carrier := Metric.closedBall 0 1
  convex' := convex_closedBall 0 1
  isCompact' := isCompact_closedBall 0 1
  nonempty' := ⟨0, Metric.mem_closedBall_self zero_le_one⟩

/-- **Squared-norm and real successive minima** (1.2.14): for a positive definite integral
lattice `L` in a rational vector space, the `(i+1)`-st squared-norm successive minimum, a natural
number, is the square of the `(i+1)`-st successive minimum of its real model for the closed unit
ball. The index is transported along `rank L = dim_ℝ` of the real model space. -/
theorem sqSuccessiveMin_eq_sq_successiveMin {V : Type*} [AddCommGroup V] [Module ℚ V]
    (L : TauCeti.IntegralLattice V) (hL : L.IsPosDef) (i : Fin (finrank ℤ L)) :
    ((L.successiveMinimum i : ℕ) : ℝ) =
      ZLattice.successiveMin (L.realModel hL) euclideanUnitBall
        (Fin.cast (TauCeti.IntegralLattice.RealModelSpace.finrank_eq (M := L) (hM := hL)).symm
          i) ^ 2 := by
  sorry

/-! ## Layer 2: Integral quadratic and hermitian lattices -/

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

/-! ## Layer 3: Representation densities, mass and theta coefficients -/

section FiniteHermitianCounts
variable {A : Type*} [CommRing A] [StarRing A] {m n : ℕ}

/-- The number of injective solutions of `Xᴴ G X = B` over a finite ring with involution
(3.1.2). -/
def hermitianEmbeddingCount [Finite A] (G : Matrix (Fin m) (Fin m) A)
    (B : Matrix (Fin n) (Fin n) A) : ℕ :=
  Nat.card {X : Matrix (Fin m) (Fin n) A //
    X.conjTranspose * G * X = B ∧ Function.Injective X.mulVec}

/-- **The finite hermitian embedding count** (3.1.3), with the radical dimension `a` of the source
retained in the product. -/
theorem finite_hermitian_isometry_formula {F : Type*} [Field F] [StarRing F]
    [Finite F] (q : ℕ) (hq : 2 ≤ q)
    (hcard : Nat.card F = q ^ 2) (hstar : ∀ x : F, star x = x ^ q)
    (G : Matrix (Fin m) (Fin m) F) (B : Matrix (Fin n) (Fin n) F)
    (hG : G.conjTranspose = G) (hB : B.conjTranspose = B)
    (hGnd : G.det ≠ 0) (hmn : n ≤ m) :
    (hermitianEmbeddingCount G B : ℚ) = (q : ℚ) ^ (n * (2 * m - n)) *
      ∏ i ∈ Finset.range (n + finrank F (LinearMap.ker B.mulVecLin)),
        (1 - (-(q : ℚ)) ^ ((i : ℤ) - (m : ℤ))) := by sorry

end FiniteHermitianCounts

/-! ## Layer 4: Lattice points, star bodies and homogeneous dynamics -/

/-- **Henk's lattice-point bound** (4.1.12): for a discrete full lattice `L` in a real normed space
of dimension `d ≥ 2` and a centrally symmetric convex body `K` with `0` in its interior,
`|L ∩ K| < 2^(d-1) ∏ (⌊2/λ_i⌋ + 1)`, with Tau Ceti's successive minima `λ_i`. The count includes
the origin and the boundary points. -/
theorem lattice_count_lt_successive_minima {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hKs : ∀ x ∈ K, -x ∈ K) (hK : (0 : E) ∈ interior (K : Set E))
    (hd : 2 ≤ finrank ℝ E) :
    (Nat.card ↥((L : Set E) ∩ (K : Set E)) : ℝ) <
      2 ^ (finrank ℝ E - 1) * ∏ i, ((⌊2 / ZLattice.successiveMin L K i⌋₊ : ℝ) + 1) := by
  sorry

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

/-- **Howe–Moore** (4.2.1): coefficients of a strongly continuous unitary representation of
a connected noncompact simple real Lie group with finite centre vanish at infinity when
there are no nonzero invariant vectors. No separability hypothesis on the Hilbert space is
needed. -/
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

section PoissonRandomMeasures
open ProbabilityTheory
variable {Ω X T : Type*} [MeasurableSpace Ω] [MeasurableSpace X] [MeasurableSpace T]

/-- The intensity measure `A ↦ ∫ N ω A ∂P` of a random measure `N : Ω → Measure X` (4.2). -/
def intensityMeasure (P : Measure Ω) (N : Ω → Measure X) : Measure X := P.bind N

/-- The Campbell measure of a random measure `N` and a jointly observed `Y` (4.2): the mass of
`A ×ˢ B` is the `P`-integral of `N ω A` over the event `Y ω ∈ B`. -/
def campbellMeasure (P : Measure Ω) (N : Ω → Measure X) (Y : Ω → T) : Measure (X × T) :=
  P.bind fun ω => (N ω).map fun x => (x, Y ω)

/-- The first marginal of the Campbell measure is the intensity measure (4.2). -/
theorem campbellMeasure_fst (P : Measure Ω) {N : Ω → Measure X} {Y : Ω → T}
    (hN : Measurable N) (hY : Measurable Y) [SigmaFinite (intensityMeasure P N)] :
    (campbellMeasure P N Y).fst = intensityMeasure P N := by sorry

/-- **Campbell's formula** (4.2), for a random measure of σ-finite intensity over an arbitrary
measure `P` and a jointly observed random element. -/
theorem lintegral_campbellMeasure (P : Measure Ω) {N : Ω → Measure X} {Y : Ω → T}
    (hN : Measurable N) (hY : Measurable Y) [SigmaFinite (intensityMeasure P N)]
    {g : X × T → ℝ≥0∞} (hg : Measurable g) :
    ∫⁻ p, g p ∂campbellMeasure P N Y = ∫⁻ ω, ∫⁻ x, g (x, Y ω) ∂N ω ∂P := by sorry

/-- The Poisson property with intensity `Λ` (4.2): `N` is measurable, and on every finite family
of pairwise disjoint measurable sets of finite `Λ`-measure its counts are independent with
Poisson laws of parameters `Λ (A i)`. -/
def IsPoissonRandomMeasure (P : Measure Ω) (N : Ω → Measure X) (Λ : Measure X) : Prop :=
  Measurable N ∧
    ∀ (n : ℕ) (A : Fin n → Set X), (∀ i, MeasurableSet (A i) ∧ Λ (A i) < ∞) →
      Pairwise (Function.onFun Disjoint A) →
        iIndepFun (fun i ω => N ω (A i)) P ∧
          ∀ i, HasLaw (fun ω => N ω (A i))
            ((poissonMeasure (Λ (A i)).toNNReal).map (Nat.cast : ℕ → ℝ≥0∞)) P

/-- **Uniqueness of the Poisson law** (4.2): two Poisson random measures with the same σ-finite
intensity, on possibly different spaces, have the same law. -/
theorem IsPoissonRandomMeasure.map_eq {Ω' : Type*} [MeasurableSpace Ω'] {P : Measure Ω}
    {P' : Measure Ω'} {N : Ω → Measure X} {N' : Ω' → Measure X} {Λ : Measure X} [SigmaFinite Λ]
    (h : IsPoissonRandomMeasure P N Λ) (h' : IsPoissonRandomMeasure P' N' Λ) :
    P.map N = P'.map N' := by sorry

/-- **The Poisson law** (4.2): for a σ-finite intensity on any measurable space there is exactly
one probability measure on `Measure X` under which the identity is a Poisson random measure. -/
theorem exists_unique_poissonLaw (Λ : Measure X) [SigmaFinite Λ] :
    ∃! ν : Measure (Measure X), IsProbabilityMeasure ν ∧ IsPoissonRandomMeasure ν id Λ := by
  sorry

/-- **Restriction** (4.2): the restriction of a Poisson random measure to a measurable set is a
Poisson random measure with the restricted intensity; no σ-finiteness is needed. -/
theorem IsPoissonRandomMeasure.restrict {P : Measure Ω} {N : Ω → Measure X} {Λ : Measure X}
    (h : IsPoissonRandomMeasure P N Λ) {B : Set X} (hB : MeasurableSet B) :
    IsPoissonRandomMeasure P (fun ω => (N ω).restrict B) (Λ.restrict B) := by sorry

/-- **Independent restrictions** (4.2): for a σ-finite intensity, the restrictions of a Poisson
random measure to finitely many pairwise disjoint measurable sets are independent. -/
theorem IsPoissonRandomMeasure.iIndepFun_restrict {P : Measure Ω} {N : Ω → Measure X}
    {Λ : Measure X} [SigmaFinite Λ] (h : IsPoissonRandomMeasure P N Λ) {n : ℕ}
    {B : Fin n → Set X} (hB : ∀ i, MeasurableSet (B i))
    (hd : Pairwise (Function.onFun Disjoint B)) :
    iIndepFun (fun i ω => (N ω).restrict (B i)) P := by sorry

end PoissonRandomMeasures

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

/-- The integer points of the sphere `x² + y² + z² = n`. -/
def ternaryShell (n : ℕ) : Set (Fin 3 → ℤ) := {v | ∑ i, v i ^ 2 = (n : ℤ)}

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

section Transference
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- The covering radius `μ(L) = sup_x inf_{v ∈ L} ‖x - v‖` (4.4.2), with values in `[0, ∞]`; for a
discrete `L` it is finite exactly when `L` spans `E`. -/
def latticeCoveringRadius (L : Submodule ℤ E) : ℝ≥0∞ :=
  ⨆ x : E, Metric.infEDist x (L : Set E)

/-- **Banaszczyk's transference bound** (4.4.13): for a discrete full lattice `L` in a Euclidean
space of dimension `n` and its dual `L*` under the inner product, `λ_i(L) λ_(n+1-i)(L*) ≤ n` for the
Euclidean unit ball, indexing from zero. -/
theorem euclidean_dual_transference_upper (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (i : Fin (finrank ℝ E)) :
    ZLattice.successiveMin L euclideanUnitBall i *
        ZLattice.successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L)
          euclideanUnitBall i.rev ≤ finrank ℝ E := by
  sorry

/-- **The covering transference bound** (4.4.14): for a discrete full lattice `L` in a Euclidean
space of dimension `n ≥ 1`, `1/2 ≤ μ(L) λ_1(L*) ≤ n`, with `μ` the covering radius and `λ_1(L*)`
the first minimum of the dual lattice for the Euclidean unit ball. -/
theorem covering_dual_transference (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (hn : 0 < finrank ℝ E) :
    1 / 2 ≤ (latticeCoveringRadius L).toReal *
        ZLattice.successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L)
          euclideanUnitBall ⟨0, hn⟩ ∧
      (latticeCoveringRadius L).toReal *
        ZLattice.successiveMin (LinearMap.BilinForm.dualSubmodule (innerₗ E) L)
          euclideanUnitBall ⟨0, hn⟩ ≤ finrank ℝ E := by
  sorry

end Transference

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

/-! ## Layer 5: LLL-reduced bases -/

section LLL
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

/-- **The LLL approximation factor** (5.1.4): `‖b₀‖² ≤ 2^{n-1} ‖x‖²` for nonzero `x` in the
integer span. -/
theorem lll_short_vector_factor (b : Fin n → E) (h : IsLLLReduced b) (hn : 0 < n)
    (x : E) (hx : x ∈ Submodule.span ℤ (Set.range b)) (h0 : x ≠ 0) :
    ‖b ⟨0, hn⟩‖ ^ 2 ≤ (2 : ℝ) ^ (n - 1) * ‖x‖ ^ 2 := by sorry

end LLL

/-! ## Layer 6: Hermitian K-theory of exact categories -/

section ArfInvariant

/-- The Arf class of a quadratic form over a finite field `K` of characteristic two, in `ZMod 2`
(6.8): `0` when `|K|` times the number of zeros of `q` exceeds `|V|`, and `1` otherwise. For a
nonsingular form it is the absolute trace of the Arf invariant in `K/℘(K)`; over `𝔽₂` it is the
value the form takes on more than half of the vectors. -/
def finiteArfInvariant {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (q : QuadraticMap K V K) : ZMod 2 :=
  if Nat.card V < Nat.card K * Nat.card {x : V // q x = 0} then 0 else 1

variable {K V W : Type*} [Field K] [Finite K] [CharP K 2]
  [AddCommGroup V] [Module K V] [Module.Finite K V]
  [AddCommGroup W] [Module K W] [Module.Finite K W]

/-- (6.8) Over a finite field of characteristic two, a nonsingular quadratic form has a
Lagrangian, a subspace of half the dimension on which it vanishes, exactly when its Arf class is
zero. -/
theorem finiteArfInvariant_eq_zero_iff_exists_lagrangian (q : QuadraticMap K V K)
    (hq : (QuadraticMap.polarBilin q).Nondegenerate) :
    finiteArfInvariant q = 0 ↔ ∃ L : Submodule K V,
      2 * finrank K L = finrank K V ∧ ∀ x ∈ L, q x = 0 := by
  sorry

/-- **Arf's classification over a finite field of characteristic two** (6.8): nonsingular
quadratic forms of equal dimension are isometric exactly when their Arf classes agree. -/
theorem quadraticMap_equivalent_iff_finiteArfInvariant (q : QuadraticMap K V K)
    (q' : QuadraticMap K W K) (hq : (QuadraticMap.polarBilin q).Nondegenerate)
    (hq' : (QuadraticMap.polarBilin q').Nondegenerate)
    (hdim : finrank K V = finrank K W) :
    q.Equivalent q' ↔ finiteArfInvariant q = finiteArfInvariant q' := by
  sorry

end ArfInvariant

end TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic
