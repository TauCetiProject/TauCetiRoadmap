module

public import Mathlib
public import TauCeti.Topology.WedgeSum
public import TauCeti.AlgebraicTopology.Cohomology.Basic
public import TauCeti.GroupTheory.Perm.Partition

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
* Equivariant Ehresmann lacks the suppliers' regular-level smooth-fibre carrier and its smooth
  local trivialization data; stratified pair transport lacks invariant control-data interfaces; the finite-index image lacks the
  equivariant topological cohomology comparison map.

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
theorem configurationTraceFormula (F : Type) [Field F] [Fintype F]
    (m : ℕ) (χ : Multiset ℕ → ℚ) :
    (∀ a : ℕ, FiniteDimensional ℚ
      ((TopCat.of (orderedConfiguration m)).singularCohomology
        (ModuleCat.of ℚ ℚ) ℚ (ModuleCat.of ℚ ℚ) a)) ∧
    (∑ᶠ f : Polynomial F,
      if f.Monic ∧ Squarefree f ∧ f.natDegree = m then
        χ ((UniqueFactorizationMonoid.normalizedFactors f).map Polynomial.natDegree) else 0) =
      ∑ a ∈ Finset.range (m + 1),
        (-1 : ℚ) ^ a * (Fintype.card F : ℚ) ^ (m - a) *
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

/-! ## Layer 4: tame bouquets and rational homotopy -/

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

end TauCetiRoadmap.AlgebraicTopologyPartII
