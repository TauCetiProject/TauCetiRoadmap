module

public import Mathlib
public import TauCeti.Topology.WedgeSum
public import TauCeti.AlgebraicTopology.Cohomology.Basic
public import TauCeti.GroupTheory.Perm.Partition
public import TauCeti.Geometry.Manifold.RegularValue

/-!
# Algebraic topology, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs.

Not statable at the pins:
* Arrangement purity lacks ℓ-adic étale cohomology of arrangement complements over the algebraic
  closure of a finite field, with its geometric Frobenius action. The compact-support forms of
  the configuration trace formula and of the stable diagonal lack compactly supported cohomology
  with its symmetric-group action; both theorems are stated below in ordinary cohomology, the form
  obtained by S_m-equivariant Poincaré duality on the complex manifold PConf_m(ℂ).
* The finite-join bouquet and the homeomorphism of the Pham skeleton with that join lack
  the topological finite-join carrier (the combinatorial simplicial join is a different carrier).
* Hilton's full basic-product decomposition lacks the basic Whitehead-product maps and indexing.
* The general rational double-loop algebra lacks the free graded-commutative algebra carrier
  and its rational H-space comparison. The native singular cup product alone does not supply them.
  The numerical bouquet Betti theorem below uses the existing singular cohomology carrier.
* Both support splittings, low-coordinate surjectivity, complement duality,
  corrected-localization self-duality, affine/Lefschetz and
  near-top cup-omega theorems lack the arbitrary-real-closed semialgebraic site, derived equivariant
  supports and their purity/trace maps.
* The gamma/Stiefel--Whitney comparison lacks supported cohomology operations and the
  characteristic-class carrier. The all-degree Wu pushforward formula is consumed from the supplier. Transverse surface representatives
  lack the class map from an embedded circle to the specified singular homology group.
* The real-empty quartic rank lacks the real-variety equivariant Betti carrier.
* The ramified double-cover triangle, corrected trace-quotient lift, circle obstruction and
  common-lift chase lack the equivariant sheaf cokernel, trace and derived comparison maps.
* The finite-index equivariant lattice image lacks the equivariant topological cohomology
  comparison map.

Finite coefficient products in the diagonal and Betti theorems are the exact coefficients of
the locally finite infinite product: for n >= 4 a factor with index r > j cannot affect degree j.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.AlgebraicTopologyPartII

open scoped Classical TensorProduct Topology.Homotopy

/-! ## Layer 2: arrangement cohomology and arithmetic traces -/

/-- Ordered configurations in the complex plane, with the subspace topology. -/
abbrev orderedConfiguration (m : ℕ) := {z : Fin m → ℂ // Function.Injective z}

/-- The left permutation action on ordered configurations: coordinate i reads coordinate σ⁻¹i. -/
def configurationPermutation (m : ℕ) (σ : Equiv.Perm (Fin m)) :
    C(orderedConfiguration m, orderedConfiguration m) where
  toFun z := ⟨z.val ∘ σ.symm, z.property.comp σ.symm.injective⟩
  continuous_toFun := by
    apply Continuous.subtype_mk
    exact continuous_pi fun i => (continuous_apply (σ.symm i)).comp continuous_subtype_val

/-- The squarefree-polynomial trace formula for every rational class function, written through
full cycle type, including fixed points. The cohomology is ordinary singular cohomology;
pullback by the inverse permutation gives its left action (CEF Theorem 3.7).
Every cohomology group is finite dimensional, and the polynomial sum has finite support. -/
theorem configurationTraceFormula (F : Type) [Field F] [Finite F]
    (m : ℕ) (χ : Multiset ℕ → ℚ) :
    (∀ a : ℕ, FiniteDimensional ℚ
      ((TopCat.of (orderedConfiguration m)).singularCohomology
        (ModuleCat.of ℚ ℚ) ℚ (ModuleCat.of ℚ ℚ) a)) ∧
    (∑ᶠ f : Polynomial F,
      if f.Monic ∧ Squarefree f ∧ f.natDegree = m then
        χ ((UniqueFactorizationMonoid.normalizedFactors f).map Polynomial.natDegree) else 0) =
      ∑ a ∈ Finset.range (m + 1),
        (-1 : ℚ) ^ a * (Nat.card F : ℚ) ^ (m - a) *
          ((m.factorial : ℚ)⁻¹ * ∑ σ : Equiv.Perm (Fin m),
            χ σ.fullCycleType * LinearMap.trace ℚ _
              (TopCat.singularCohomologyMap
                (R := ModuleCat.of ℚ ℚ) (k := ℚ) (M := ModuleCat.of ℚ ℚ)
                (TopCat.ofHom (configurationPermutation m σ⁻¹)) a).hom) := by
  sorry

/-! ## Layer 3: Euler exponents and stable configuration diagonals -/

/-- The signed integral Möbius exponent, for positive r; at r = 0 it is assigned zero.
Its agreement with the integral Euler factorization is a README target (BS equation (7.2)). -/
def eulerExponent (n N r : ℕ) : ℤ :=
  -(∑ d ∈ r.divisors, ArithmeticFunction.moebius d *
    (((-1 : ℤ) ^ n * (N : ℤ)) ^ (r / d))) / (r : ℤ)

/-- The formal factor (1 - (-t)^(r*(n-2)-1))^(-e_r), with the signed exponent
interpreted by the integral binomial series. Only positive degrees enter the headline theorems. -/
def doubleLoopFactor (n N r : ℕ) (_hn : 4 ≤ n) (_hr : 0 < r) : PowerSeries ℚ :=
  PowerSeries.subst
    (PowerSeries.C ((-1 : ℚ) ^ (r * (n - 2))) *
      PowerSeries.X ^ (r * (n - 2) - 1))
    (PowerSeries.binomialSeries ℚ (-eulerExponent n N r))

/-- The stable configuration diagonal in ordinary cohomology (BS Corollary 7.5, after
S_m-equivariant Poincaré duality on PConf_m(ℂ)). For n = s + 4 and j <= d(n - 3), the sum over
m <= d of the multiplicities of V^⊗m ⊗ sgn^(ε_n), with dim V = N and ε_n = (n + 1) mod 2, in
H^(j - m(n - 3))(PConf_m(ℂ), ℚ) is the degree-j coefficient of the product of the factors
`doubleLoopFactor`. A summand with m(n - 3) > j sits in negative degree and is zero. Each
multiplicity is the character average over S_m; every cohomology group is finite dimensional. -/
theorem stableConfigurationDiagonal (s N j d : ℕ) (hd : j ≤ d * (s + 1)) :
    (∀ m a : ℕ, FiniteDimensional ℚ
      ((TopCat.of (orderedConfiguration m)).singularCohomology
        (ModuleCat.of ℚ ℚ) ℚ (ModuleCat.of ℚ ℚ) a)) ∧
    (∑ m ∈ Finset.range (d + 1),
      if m * (s + 1) ≤ j then
        (m.factorial : ℚ)⁻¹ * ∑ σ : Equiv.Perm (Fin m),
          (N : ℚ) ^ σ.fullCycleType.card * ((Equiv.Perm.sign σ : ℤ) : ℚ) ^ ((s + 5) % 2) *
            LinearMap.trace ℚ _
              (TopCat.singularCohomologyMap
                (R := ModuleCat.of ℚ ℚ) (k := ℚ) (M := ModuleCat.of ℚ ℚ)
                (TopCat.ofHom (configurationPermutation m σ⁻¹)) (j - m * (s + 1))).hom
      else 0) =
      PowerSeries.coeff j
        (∏ r ∈ Finset.range j, doubleLoopFactor (s + 4) N (r + 1) (by omega) (by omega)) := by
  sorry

/-! ## Layer 4: tame fibres and rational homotopy -/

/-- The unit s-sphere in real Euclidean space of dimension s + 1. -/
abbrev unitSphere (s : ℕ) :=
  ↥(Metric.sphere (0 : EuclideanSpace ℝ (Fin (s + 1))) 1)

/-- A bouquet of N copies of the unit s-sphere, with the specified point as each wedge point. -/
abbrev sphereBouquet (s N : ℕ) (x : unitSphere s) :=
  TauCeti.WedgeSum (fun _ : Fin N => x)

/-- Tameness means a compact set contains all critical points in its interior and the
Euclidean norm of the complex-coordinate gradient has a positive lower bound outside it. -/
def IsTame {n : ℕ} (f : MvPolynomial (Fin n) ℂ) : Prop :=
  ∃ K : Set (Fin n → ℂ), IsCompact K ∧
    (∀ z, (∀ i, MvPolynomial.eval z (MvPolynomial.pderiv i f) = 0) → z ∈ interior K) ∧
    ∃ ε : ℝ, 0 < ε ∧ ∀ z, z ∉ K →
      ε ≤ Real.sqrt (∑ i, ‖MvPolynomial.eval z (MvPolynomial.pderiv i f)‖ ^ 2)

/-- The complex polynomial algebra modulo the ideal generated by all first partial derivatives. -/
abbrev jacobianAlgebra {n : ℕ} (f : MvPolynomial (Fin n) ℂ) :=
  MvPolynomial (Fin n) ℂ ⧸ Ideal.span (Set.range fun i => MvPolynomial.pderiv i f)

/-- The total Milnor number is the dimension of the Jacobian algebra, finite for tame f. -/
def milnorNumber {n : ℕ} (f : MvPolynomial (Fin n) ℂ) : ℕ :=
  Module.finrank ℂ (jacobianAlgebra f)

/-- The fibre Milnor number at a is the dimension of the generalized a-eigenspace of
multiplication by f on its Jacobian algebra; it counts the local Milnor numbers on f⁻¹(a). -/
def fiberMilnorNumber {n : ℕ} (f : MvPolynomial (Fin n) ℂ) (a : ℂ) : ℕ :=
  Module.finrank ℂ
    ((Algebra.lmul ℂ (jacobianAlgebra f)
      (Ideal.Quotient.mk (Ideal.span (Set.range fun i => MvPolynomial.pderiv i f)) f)).maxGenEigenspace a)

/-- A complex polynomial fibre, with the subspace topology. -/
abbrev polynomialFiber {n : ℕ} (f : MvPolynomial (Fin n) ℂ) (a : ℂ) :=
  {z : Fin n → ℂ // MvPolynomial.eval z f = a}

/-- Every fibre of a tame polynomial in n >= 1 variables is a bouquet of μ - μᵃ spheres
of dimension n - 1; for n = 1 these are copies of the zero-sphere. At a regular value
μᵃ = 0 (Broughton Theorem 1.2). -/
theorem tameFibreBouquet (n : ℕ) (hn : 1 ≤ n) (f : MvPolynomial (Fin n) ℂ)
    (hf : IsTame f) (a : ℂ) (x : unitSphere (n - 1)) :
    FiniteDimensional ℂ (jacobianAlgebra f) ∧
      Nonempty (ContinuousMap.HomotopyEquiv (polynomialFiber f a)
        (sphereBouquet (n - 1) (milnorNumber f - fiberMilnorNumber f a) x)) := by
  sorry

/-- Hilton and Serre give all rational ranks of a finite bouquet of spheres of dimension
s + 2. The rank is zero off the indicated divisibility progression (BS Lemma 7.6). -/
theorem rationalBouquetRanks (s N k : ℕ) (x : unitSphere (s + 2))
    (Y : Type) [TopologicalSpace Y] (y : Y)
    (hY : Nonempty (ContinuousMap.HomotopyEquiv Y (sphereBouquet (s + 2) N x))) :
    let P := ℚ ⊗[ℤ] Additive (HomotopyGroup (Fin (k + 2)) Y y)
    FiniteDimensional ℚ P ∧ Module.finrank ℚ P =
      if s + 1 ∣ k + 1 then
        (((-1 : ℤ) ^ k * eulerExponent (s + 3) N ((k + 1) / (s + 1))).toNat)
      else 0 := by
  sorry

/-! ## Layer 5: double loops and Fermat comparisons -/

/-- The full double-loop Betti product for a finite sphere bouquet, in dimensions n >= 4.
Finite dimensionality is included, so finrank cannot hide an infinite-dimensional group.
The coefficient is taken from exactly the factors that can contribute (corrected BS Lemma 7.6). -/
theorem doubleLoopBetti (s N j : ℕ) (x : unitSphere (s + 3))
    (Y : Type) [TopologicalSpace Y] (y : Y)
    (hY : Nonempty (ContinuousMap.HomotopyEquiv Y (sphereBouquet (s + 3) N x))) :
    let H := (TopCat.of (Ω^ (Fin 2) Y y)).singularCohomology
      (ModuleCat.of ℚ ℚ) ℚ (ModuleCat.of ℚ ℚ) j
    FiniteDimensional ℚ H ∧
      (Module.finrank ℚ H : ℚ) = PowerSeries.coeff j
        (∏ r ∈ Finset.range j, doubleLoopFactor (s + 4) N (r + 1) (by omega) (by omega)) := by
  sorry

/-- The indexed Fermat level-one fibre in complex affine n-space, with its subspace topology. -/
abbrev fermatFiber {n : ℕ} (k : Fin n → ℕ) :=
  {z : Fin n → ℂ // ∑ i, z i ^ k i = 1}

/-- Pham's skeleton consists of fibre points whose coordinate powers are real and nonnegative. -/
abbrev phamSkeleton {n : ℕ} (k : Fin n → ℕ) :=
  {z : fermatFiber k // ∀ i, (z.val i ^ k i).im = 0 ∧ 0 ≤ (z.val i ^ k i).re}

/-- The continuous inclusion of the positive-power skeleton into its indexed Fermat fibre. -/
def phamInclusion {n : ℕ} (k : Fin n → ℕ) : C(phamSkeleton k, fermatFiber k) :=
  ⟨Subtype.val, continuous_subtype_val⟩

/-- Pham's equivariant strong deformation retraction for every number of coordinates and every
positive exponent family. The relative homotopy fixes the included skeleton at every time.
Equivariance is expressed coordinatewise for multiplication by any family of roots of unity
(Pham I §2, pp.337–338). -/
theorem phamStrongRetraction (n : ℕ) (k : Fin n → ℕ)
    (hk : ∀ i, 1 ≤ k i) :
    ∃ r : C(fermatFiber k, phamSkeleton k),
      r.comp (phamInclusion k) = ContinuousMap.id (phamSkeleton k) ∧
      ∃ H : ContinuousMap.HomotopyRel (ContinuousMap.id (fermatFiber k))
          ((phamInclusion k).comp r) (Set.range (phamInclusion k)),
        ∀ (u : Fin n → ℂ), (∀ i, u i ^ k i = 1) →
          ∀ (t : unitInterval) (z w : fermatFiber k),
            (∀ i, w.val i = u i * z.val i) →
              ∀ i, (H (t, w)).val i = u i * (H (t, z)).val i := by
  sorry

/-- For at least five coordinates and every positive exponent family, the generalized
double-loop space of the Fermat fibre based at any of its points is connected and simply
connected: the fibre is a bouquet of spheres of dimension n - 1 >= 4, so its second and third
homotopy groups vanish (Pham I §2, with the loop shifts π_0(Ω²X) ≃ π_2(X), π_1(Ω²X) ≃ π_3(X)). -/
theorem fermatDoubleLoopSimplyConnected (n : ℕ) (hn : 5 ≤ n) (k : Fin n → ℕ)
    (hk : ∀ i, 1 ≤ k i) (y : fermatFiber k) :
    SimplyConnectedSpace (Ω^ (Fin 2) (fermatFiber k) y) := by
  sorry

/-! ## Layer 16: equivariant transport and derived chases -/

open Filter
open scoped Topology Manifold ContDiff

/-- **Equivariant Ehresmann transport** (§16.1). Let `f : M → B` be a proper smooth map of
Hausdorff second-countable boundaryless manifolds, let `σM` and `σB` be smooth involutions with
`f ∘ σM = σB ∘ f`, and let `b` be a regular value of `f` fixed by `σB`, whose fibre carries a
smooth structure of dimension `n - k` for which its inclusion into `M` is a smooth embedding (for
instance the regular-fibre atlas `TauCeti.regularFiberChartedSpace`). Then `f` has a local
trivialization over a `σB`-invariant open neighbourhood of `b` with that fibre. The
trivialization is a diffeomorphism onto its image and intertwines `σM` with `σB` on the base and
with `σM` on the fibre. The fibre may be empty (B19 Proposition 6.6 proof; DIMCA Lemma 4). -/
theorem equivariantEhresmannTransport {n k : ℕ}
    {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (𝓡 n) ∞ M] [T2Space M] [SecondCountableTopology M]
    {B : Type*} [TopologicalSpace B] [ChartedSpace (EuclideanSpace ℝ (Fin k)) B]
    [IsManifold (𝓡 k) ∞ B] [T2Space B] [SecondCountableTopology B]
    {f : M → B} (hf : ContMDiff (𝓡 n) (𝓡 k) ∞ f) (hp : IsProperMap f)
    {σM : M → M} {σB : B → B} (hσM : ContMDiff (𝓡 n) (𝓡 n) ∞ σM)
    (hσB : ContMDiff (𝓡 k) (𝓡 k) ∞ σB) (hσM2 : ∀ x, σM (σM x) = x)
    (hσB2 : ∀ c, σB (σB c) = c) (hfσ : ∀ x, f (σM x) = σB (f x))
    (b : B) (hb : σB b = b) (hreg : TauCeti.IsRegularValue (𝓡 n) (𝓡 k) f b)
    [ChartedSpace (EuclideanSpace ℝ (Fin (n - k))) {x : M // f x = b}]
    [IsManifold (𝓡 (n - k)) ∞ {x : M // f x = b}]
    (hF : Manifold.IsSmoothEmbedding (𝓡 (n - k)) (𝓡 n) ∞ (Subtype.val : {x : M // f x = b} → M)) :
    ∃ e : Bundle.Trivialization {x : M // f x = b} f, b ∈ e.baseSet ∧
      σB ⁻¹' e.baseSet = e.baseSet ∧
      ContMDiffOn (𝓡 n) ((𝓡 k).prod (𝓡 (n - k))) ∞ e e.source ∧
      ContMDiffOn ((𝓡 k).prod (𝓡 (n - k))) (𝓡 n) ∞ e.toOpenPartialHomeomorph.symm e.target ∧
      ∀ x ∈ e.source, ((e (σM x)).2 : M) = σM (e x).2 := by
  sorry

section Stratified

variable {X : Type*} [TopologicalSpace X] {ι : Type*} {d : ι → ℕ} {S : ι → Type*}

/-- Stratum `i` lies in the closure of the distinct stratum `j`; under the frontier condition
this is the incidence order of the strata (§16.1a). -/
def StratumLT (incl : ∀ i, S i → X) (i j : ι) : Prop :=
  i ≠ j ∧ Set.range (incl i) ⊆ closure (Set.range (incl j))

variable [∀ i, TopologicalSpace (S i)] [∀ i, ChartedSpace (EuclideanSpace ℝ (Fin (d i))) (S i)]

variable (d) in
/-- A smooth stratification of `X` (§16.1a; MATHER §8, axioms (A2)–(A5)): each stratum is the
image of a topological embedding `incl i` of a nonempty smooth manifold `S i` modelled on
`EuclideanSpace ℝ (Fin (d i))`; the strata are locally closed and pairwise disjoint, cover `X`,
form a locally finite family and satisfy the frontier condition. The index type may be
infinite. -/
structure IsSmoothStratification [∀ i, IsManifold (𝓡 (d i)) ∞ (S i)] (incl : ∀ i, S i → X) :
    Prop where
  nonempty : ∀ i, Nonempty (S i)
  isEmbedding : ∀ i, Topology.IsEmbedding (incl i)
  isLocallyClosed : ∀ i, IsLocallyClosed (Set.range (incl i))
  pairwise_disjoint : Pairwise fun i j => Disjoint (Set.range (incl i)) (Set.range (incl j))
  iUnion_range : ⋃ i, Set.range (incl i) = Set.univ
  locallyFinite : LocallyFinite fun i => Set.range (incl i)
  frontier_condition : ∀ i j, (Set.range (incl i) ∩ closure (Set.range (incl j))).Nonempty →
    Set.range (incl i) ⊆ closure (Set.range (incl j))

variable (d) in
/-- Thom–Mather control data for the strata `incl` (§16.1b; MATHER §7): for each stratum an open
tube around it, a retraction of the tube onto the stratum and a nonnegative tubular function
vanishing exactly on the stratum. For incident strata `i < j` the retraction and the tubular
function of `i` are unchanged by the retraction of `j`, and together they restrict to a smooth
submersion from the part of stratum `j` in the tube of `i` to `S i × ℝ`. Values of the
retractions and tubular functions off their tubes are irrelevant. -/
structure ControlData (incl : ∀ i, S i → X) where
  tube : ι → Set X
  proj : ∀ i, X → S i
  tubularFun : ι → X → ℝ
  isOpen_tube : ∀ i, IsOpen (tube i)
  range_subset_tube : ∀ i, Set.range (incl i) ⊆ tube i
  continuousOn_proj : ∀ i, ContinuousOn (proj i) (tube i)
  proj_incl : ∀ i y, proj i (incl i y) = y
  continuousOn_tubularFun : ∀ i, ContinuousOn (tubularFun i) (tube i)
  tubularFun_nonneg : ∀ i, ∀ x ∈ tube i, 0 ≤ tubularFun i x
  tubularFun_eq_zero_iff : ∀ i, ∀ x ∈ tube i, tubularFun i x = 0 ↔ x ∈ Set.range (incl i)
  proj_proj : ∀ i j, StratumLT incl i j → ∀ x ∈ tube i ∩ tube j,
    incl j (proj j x) ∈ tube i → proj i (incl j (proj j x)) = proj i x
  tubularFun_proj : ∀ i j, StratumLT incl i j → ∀ x ∈ tube i ∩ tube j,
    incl j (proj j x) ∈ tube i → tubularFun i (incl j (proj j x)) = tubularFun i x
  contMDiffOn : ∀ i j, StratumLT incl i j →
    ContMDiffOn (𝓡 (d j)) ((𝓡 (d i)).prod 𝓘(ℝ, ℝ)) ∞
      (fun y => (proj i (incl j y), tubularFun i (incl j y))) (incl j ⁻¹' tube i)
  isSubmersionAt : ∀ i j, StratumLT incl i j → ∀ y ∈ incl j ⁻¹' tube i,
    Manifold.IsSubmersionAt (𝓡 (d j)) ((𝓡 (d i)).prod 𝓘(ℝ, ℝ)) ∞
      (fun y => (proj i (incl j y), tubularFun i (incl j y))) y

/-- A map is compatible with control data when, near each stratum, it is constant along the
retraction of that stratum (§16.1b; MATHER §7). -/
def ControlData.IsCompatible {incl : ∀ i, S i → X} (C : ControlData d incl) {Y : Type*}
    (f : X → Y) : Prop :=
  ∀ i, ∀ᶠ x in 𝓝ˢ (Set.range (incl i)), x ∈ C.tube i ∧ f (incl i (C.proj i x)) = f x

/-- Control data are invariant under `σ : X → X` when `σ` preserves every tube and commutes with
every retraction and every tubular function (§16.1b). -/
def ControlData.IsInvariant {incl : ∀ i, S i → X} (C : ControlData d incl) (σ : X → X) : Prop :=
  ∀ i, ∀ x ∈ C.tube i, σ x ∈ C.tube i ∧ incl i (C.proj i (σ x)) = σ (incl i (C.proj i x)) ∧
    C.tubularFun i (σ x) = C.tubularFun i x

/-- Normalised control data (§16.1b): a tube meets only its own stratum and strata above it, and
the tubes of two incomparable strata are disjoint (MATHER §8, conditions (A10)–(A11), PDF p.25);
moreover each tube is proper over its stratum below some positive continuous radius `ε`. The
properness clause is not one of Mather's axioms; it is the abstract form of the properness of an
admissible tubular retraction (MATHER §7, PDF p.20). -/
def ControlData.IsNormalized {incl : ∀ i, S i → X} (C : ControlData d incl) : Prop :=
  (∀ i j, (C.tube i ∩ Set.range (incl j)).Nonempty → i = j ∨ StratumLT incl i j) ∧
    (∀ i j, (C.tube i ∩ C.tube j).Nonempty →
      i = j ∨ StratumLT incl i j ∨ StratumLT incl j i) ∧
    ∀ i, ∃ ε : S i → ℝ, Continuous ε ∧ (∀ y, 0 < ε y) ∧ ∀ K : Set (S i), IsCompact K →
      IsCompact {x | x ∈ C.tube i ∧ C.tubularFun i x ≤ ε (C.proj i x) ∧ C.proj i x ∈ K}

/-- A controlled vector field (§16.1d; MATHER §9): a smooth vector field on every stratum such
that, near each stratum `i` and on every stratum `j` with `i < j`, the derivative of the
retraction of `i` carries the field on `j` to the field on `i` and the derivative of the tubular
function of `i` kills it. -/
structure ControlData.IsControlledVectorField [∀ i, IsManifold (𝓡 (d i)) ∞ (S i)]
    {incl : ∀ i, S i → X} (C : ControlData d incl)
    (ξ : ∀ i, (y : S i) → TangentSpace (𝓡 (d i)) y) : Prop where
  contMDiff : ∀ i, ContMDiff (𝓡 (d i)) (𝓡 (d i)).tangent ∞
    (fun y => (⟨y, ξ i y⟩ : TangentBundle (𝓡 (d i)) (S i)))
  control : ∀ i j, StratumLT incl i j → ∃ U ∈ 𝓝ˢ (Set.range (incl i)), U ⊆ C.tube i ∧
    ∀ y : S j, incl j y ∈ U →
      mfderiv (𝓡 (d j)) (𝓡 (d i)) (fun z => C.proj i (incl j z)) y (ξ j y) =
          ξ i (C.proj i (incl j y)) ∧
        mfderiv (𝓡 (d j)) 𝓘(ℝ, ℝ) (fun z => C.tubularFun i (incl j z)) y (ξ j y) = 0

/-- **Integration of controlled vector fields** (§16.1d; MATHER Proposition 10.1). On a smooth
stratified space with control data, the stratumwise integral curves of a controlled vector field
assemble into a continuous local flow: it is defined on an open neighbourhood of `{0} × X` whose
slices are intervals, obeys the flow law, leaves every compact set near each finite end of its
time interval, and moves each point of a stratum along an integral curve of the field on that
stratum. -/
theorem ControlData.exists_flow [∀ i, IsManifold (𝓡 (d i)) ∞ (S i)] [T2Space X]
    [LocallyCompactSpace X] [SecondCountableTopology X]
    {incl : ∀ i, S i → X} (hS : IsSmoothStratification d incl) (C : ControlData d incl)
    {ξ : ∀ i, (y : S i) → TangentSpace (𝓡 (d i)) y} (hξ : C.IsControlledVectorField ξ) :
    ∃ (D : Set (ℝ × X)) (φ : ℝ × X → X), IsOpen D ∧ (∀ x, (0, x) ∈ D) ∧
      (∀ x, Set.OrdConnected {t | (t, x) ∈ D}) ∧ ContinuousOn φ D ∧ (∀ x, φ (0, x) = x) ∧
      (∀ s t x, (s, x) ∈ D → ((t, φ (s, x)) ∈ D ↔ (s + t, x) ∈ D)) ∧
      (∀ s t x, (s + t, x) ∈ D → (s, x) ∈ D → φ (t, φ (s, x)) = φ (s + t, x)) ∧
      (∀ x (K : Set X), IsCompact K → ∃ ε > 0, ∀ t, (t, x) ∈ D →
        ((t + ε, x) ∉ D ∨ (t - ε, x) ∉ D) → φ (t, x) ∉ K) ∧
      ∀ j (y : S j), ∃ γ : ℝ → S j, γ 0 = y ∧
        (∀ t, (t, incl j y) ∈ D → incl j (γ t) = φ (t, incl j y)) ∧
        IsMIntegralCurveOn γ (ξ j) {t | (t, incl j y) ∈ D} := by
  sorry

variable {m : ℕ} {N : Type*} [TopologicalSpace N] [ChartedSpace (EuclideanSpace ℝ (Fin m)) N]

variable (m) in
/-- A controlled submersion to a manifold `N` (§16.1d; MATHER §9): a continuous map compatible
with the control data whose restriction to every stratum is a smooth submersion. -/
structure ControlData.IsControlledSubmersion {incl : ∀ i, S i → X} (C : ControlData d incl)
    (f : X → N) : Prop where
  continuous : Continuous f
  isCompatible : C.IsCompatible f
  contMDiff : ∀ j, ContMDiff (𝓡 (d j)) (𝓡 m) ∞ (fun y => f (incl j y))
  isSubmersionAt : ∀ j y, Manifold.IsSubmersionAt (𝓡 (d j)) (𝓡 m) ∞ (fun y => f (incl j y)) y

/-- **Lifting along a controlled submersion** (§16.1d; MATHER Proposition 9.1). Every smooth
vector field on the base lifts along a controlled submersion to a controlled vector field. -/
theorem ControlData.exists_isControlledVectorField_lift [∀ i, IsManifold (𝓡 (d i)) ∞ (S i)]
    [T2Space X] [LocallyCompactSpace X]
    [SecondCountableTopology X] [IsManifold (𝓡 m) ∞ N]
    {incl : ∀ i, S i → X} (hS : IsSmoothStratification d incl) (C : ControlData d incl)
    {f : X → N} (hf : C.IsControlledSubmersion m f) {η : (b : N) → TangentSpace (𝓡 m) b}
    (hη : ContMDiff (𝓡 m) (𝓡 m).tangent ∞ (fun b => (⟨b, η b⟩ : TangentBundle (𝓡 m) N))) :
    ∃ ξ : ∀ i, (y : S i) → TangentSpace (𝓡 (d i)) y, C.IsControlledVectorField ξ ∧
      ∀ j (y : S j),
        mfderiv (𝓡 (d j)) (𝓡 m) (fun z => f (incl j z)) y (ξ j y) = η (f (incl j y)) := by
  sorry

/-- **Thom's first isotopy lemma, controlled form** (§16.1e; MATHER Corollary 10.2). A proper
controlled submersion from a smooth stratified space with control data to a boundaryless
manifold is locally trivial by stratum-preserving homeomorphisms, each restricting to the
identity on the fibre over its base point. -/
theorem ControlData.exists_trivialization [∀ i, IsManifold (𝓡 (d i)) ∞ (S i)] [T2Space X]
    [LocallyCompactSpace X] [SecondCountableTopology X] [T2Space N] [SecondCountableTopology N]
    [IsManifold (𝓡 m) ∞ N]
    {incl : ∀ i, S i → X} (hS : IsSmoothStratification d incl) (C : ControlData d incl)
    {f : X → N} (hf : C.IsControlledSubmersion m f) (hp : IsProperMap f) (b : N) :
    ∃ e : Bundle.Trivialization (f ⁻¹' {b}) f, b ∈ e.baseSet ∧
      (∀ x (hx : f x = b), e x = (b, ⟨x, hx⟩)) ∧
      ∀ x ∈ e.source, ∀ j, x ∈ Set.range (incl j) ↔ ((e x).2 : X) ∈ Set.range (incl j) := by
  sorry

variable {n : ℕ} {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]

variable (d n) in
/-- Whitney's condition (b) for strata `i < j` of a subset `A` of `M` at a point `y` of stratum
`i`, read in the preferred chart `e` of `M` at `y` (§16.1a; MATHER §5): along sequences `u k` in
stratum `j` and `v k` in stratum `i` converging to `y` with distinct images, the distance from the
unit secant vector of `e (v k)` and `e (u k)` to the chart image of the tangent space of stratum
`j` at `u k` tends to zero. -/
def WhitneyB {A : Set M} (incl : ∀ i, S i → A) (i j : ι) (y : S i) : Prop :=
  ∀ (u : ℕ → S j) (v : ℕ → S i),
    Tendsto (fun k => (incl j (u k) : M)) atTop (𝓝 (incl i y : M)) →
    Tendsto (fun k => (incl i (v k) : M)) atTop (𝓝 (incl i y : M)) →
    (∀ k, (incl j (u k) : M) ≠ incl i (v k)) →
    Tendsto (fun k =>
        let e := extChartAt (𝓡 n) (incl i y : M)
        let w := e (incl j (u k)) - e (incl i (v k))
        Metric.infDist (‖w‖⁻¹ • w)
          (SetLike.coe (LinearMap.range
            (mfderiv (𝓡 (d j)) (𝓡 n) (fun z => e (incl j z)) (u k)).toLinearMap)))
      atTop (𝓝 0)

variable (d n) in
/-- A Whitney stratification of a closed subset `A` of `M`, Mather's Whitney prestratification
(§16.1a; MATHER §5): the strata are images of smooth embeddings into `M` of nonempty boundaryless
manifolds; they are pairwise disjoint, cover `A`, form a locally finite family and satisfy the
frontier condition and Whitney's condition (b) for every incident pair. -/
structure IsWhitneyStratification (A : Set M) (incl : ∀ i, S i → A) : Prop where
  isClosed : IsClosed A
  nonempty : ∀ i, Nonempty (S i)
  isSmoothEmbedding : ∀ i,
    Manifold.IsSmoothEmbedding (𝓡 (d i)) (𝓡 n) ∞ (fun y => (incl i y : M))
  pairwise_disjoint : Pairwise fun i j => Disjoint (Set.range (incl i)) (Set.range (incl j))
  iUnion_range : ⋃ i, Set.range (incl i) = Set.univ
  locallyFinite : LocallyFinite fun i => Set.range (incl i)
  frontier_condition : ∀ i j, (Set.range (incl i) ∩ closure (Set.range (incl j))).Nonempty →
    Set.range (incl i) ⊆ closure (Set.range (incl j))
  whitneyB : ∀ i j, StratumLT incl i j → ∀ y, WhitneyB d n incl i j y

/-- **Existence of control data** (§16.1c; MATHER Proposition 7.1). The strata of a Whitney
stratified closed subset `A` of a Hausdorff second-countable boundaryless manifold carry
normalised control data compatible with every smooth map `f` to a boundaryless manifold whose
restriction to each stratum is a submersion. The tubes, retractions and tubular functions are
restrictions to `A` of smooth ambient ones defined on open subsets of `M`, along which `f` is
constant. -/
theorem exists_controlData_isCompatible [∀ i, IsManifold (𝓡 (d i)) ∞ (S i)]
    [T2Space M] [SecondCountableTopology M]
    [IsManifold (𝓡 n) ∞ M] [IsManifold (𝓡 m) ∞ N]
    {A : Set M} {incl : ∀ i, S i → A} (hA : IsWhitneyStratification d n A incl)
    {f : M → N} (hf : ContMDiff (𝓡 n) (𝓡 m) ∞ f)
    (hsub : ∀ j y, Manifold.IsSubmersionAt (𝓡 (d j)) (𝓡 m) ∞ (fun z => f (incl j z)) y) :
    ∃ C : ControlData d incl, C.IsNormalized ∧ C.IsCompatible (A.domRestrict f) ∧
      ∀ i, ∃ (T : Set M) (π : M → S i) (ρ : M → ℝ), IsOpen T ∧ C.tube i = Subtype.val ⁻¹' T ∧
        (∀ x ∈ C.tube i, C.proj i x = π x ∧ C.tubularFun i x = ρ x) ∧
        ContMDiffOn (𝓡 n) (𝓡 (d i)) ∞ π T ∧ ContMDiffOn (𝓡 n) 𝓘(ℝ, ℝ) ∞ ρ T ∧
        ∀ x ∈ T, f (incl i (π x) : M) = f x := by
  sorry

/-- **Thom's first isotopy lemma, embedded form** (§16.1e; MATHER Proposition 11.1). For a
Whitney stratified closed subset `A` of `M` and a smooth map `f : M → N` that is proper on `A`
and a submersion on every stratum, the restriction of `f` to `A` is locally trivial by
stratum-preserving homeomorphisms. -/
theorem firstIsotopyLemma [∀ i, IsManifold (𝓡 (d i)) ∞ (S i)]
    [T2Space M] [SecondCountableTopology M] [IsManifold (𝓡 n) ∞ M]
    [T2Space N] [SecondCountableTopology N] [IsManifold (𝓡 m) ∞ N]
    {A : Set M} {incl : ∀ i, S i → A} (hA : IsWhitneyStratification d n A incl)
    {f : M → N} (hf : ContMDiff (𝓡 n) (𝓡 m) ∞ f)
    (hsub : ∀ j y, Manifold.IsSubmersionAt (𝓡 (d j)) (𝓡 m) ∞ (fun z => f (incl j z)) y)
    (hp : IsProperMap (A.domRestrict f)) (b : N) :
    ∃ e : Bundle.Trivialization ((A.domRestrict f) ⁻¹' {b}) (A.domRestrict f), b ∈ e.baseSet ∧
      ∀ x ∈ e.source, ∀ j, x ∈ Set.range (incl j) ↔ ((e x).2 : A) ∈ Set.range (incl j) := by
  sorry

/-- **Equivariant stratified pair transport** (§16.2). Let `σM` and `σN` be smooth involutions
with `f ∘ σM = σN ∘ f`, preserving `A` (through `σA`) and each of its strata, and let the
control data be compatible with `f` and invariant under `σA`. Then over a `σN`-invariant
neighbourhood of every `σN`-fixed point the restriction of `f` to `A` has a stratum-preserving
trivialization intertwining `σA` with `σN` on the base and `σA` on the fibre. -/
theorem equivariantStratifiedTransport [∀ i, IsManifold (𝓡 (d i)) ∞ (S i)]
    [T2Space M] [SecondCountableTopology M]
    [IsManifold (𝓡 n) ∞ M] [T2Space N] [SecondCountableTopology N] [IsManifold (𝓡 m) ∞ N]
    {A : Set M} {incl : ∀ i, S i → A} (hA : IsWhitneyStratification d n A incl)
    {f : M → N} (hf : ContMDiff (𝓡 n) (𝓡 m) ∞ f)
    (hsub : ∀ j y, Manifold.IsSubmersionAt (𝓡 (d j)) (𝓡 m) ∞ (fun z => f (incl j z)) y)
    (hp : IsProperMap (A.domRestrict f))
    {σM : M → M} {σN : N → N} (hσM : ContMDiff (𝓡 n) (𝓡 n) ∞ σM)
    (hσN : ContMDiff (𝓡 m) (𝓡 m) ∞ σN) (hσM2 : ∀ x, σM (σM x) = x)
    (hσN2 : ∀ b, σN (σN b) = b) (hfσ : ∀ x, f (σM x) = σN (f x))
    (σA : A → A) (hσA : ∀ x, (σA x : M) = σM x)
    (hstrata : ∀ i y, σA (incl i y) ∈ Set.range (incl i))
    (C : ControlData d incl) (hC : C.IsCompatible (A.domRestrict f)) (hCσ : C.IsInvariant σA)
    (b : N) (hb : σN b = b) :
    ∃ e : Bundle.Trivialization ((A.domRestrict f) ⁻¹' {b}) (A.domRestrict f), b ∈ e.baseSet ∧
      σN ⁻¹' e.baseSet = e.baseSet ∧
      (∀ x ∈ e.source, ∀ j, x ∈ Set.range (incl j) ↔ ((e x).2 : A) ∈ Set.range (incl j)) ∧
      ∀ x ∈ e.source, (e (σA x)).1 = σN (e x).1 ∧ ((e (σA x)).2 : A) = σA (e x).2 := by
  sorry

end Stratified

end TauCetiRoadmap.AlgebraicTopologyPartII
