import Mathlib
import TauCeti.RepresentationTheory.Homological.ContCohomology.ExplicitFunctoriality
import TauCeti.Topology.Algebra.Group.Generation

/-!
# Euler systems, Kolyvagin systems and higher-rank descent: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file states the roadmap’s statable headline theorems against the pinned APIs;
discharging them finishes neither a layer nor the roadmap. The compact irreducible
rational vanishing and integral finite-cokernel comparison theorems (§4.2a) use native
additive continuous cohomology, the lattice quotient and its coefficient map. The latter
also identifies the image as the maximal divisible subgroup. The infinite-base
classification (§4.2b) needs the joint arithmetic extension with its quotient Galois
action, which is absent at the pins; it is not stated through a substitute carrier.

The arithmetic headline theorems require arithmetic Selmer structures with coefficient-linear
cohomology, propagated and dual local conditions, and the Euler, Kolyvagin and Stark system carriers.
Tau Ceti's continuous `H1` supplies an additive cohomology group for continuous
topological coefficient actions, but not these arithmetic
module and local-condition interfaces. Defining them requires the developments specified
in the README, rather than a few definitions on existing carriers.

The headline results requiring these objects are:

* Layers 0–1: the canonical and unramified core-rank formulas (§0.10), the finite–singular
  comparison (§1.8), and the auxiliary-prime selection theorems (§§1.15–1.16, 1.21–1.23).
  The induced sufficient criterion in §1.15 assumes restriction injectivity for the induced
  finite representation at each coefficient depth, on its joint coefficient kernel;
  restriction injectivity for the original representation alone does not supply it.
* Layers 2–3: unramifiedness of Euler classes (§2.3), Kolyvagin's congruence (§3.14), and
  the Euler-to-Kolyvagin derivative maps (§§3.16–3.17, 3.19). Representation maps of systems
  require the polynomial-intertwining identity at every edge (§1.8); the general system
  carrier does not commute with direct sums (§3.3). The integral divided-polynomial
  congruence and ordinary comparison (§§2.8, 3.14, 3.18) use nontrivial ray edges; trivial ray
  edges identify the fields and components and use the identity comparison and lift.
  The MR04 derivatives use the full cyclotomic tame fields (§3.9a), including at `p = 2`.
  Their comparison with finite-ray derivatives requires the coefficient modulus to divide
  the finite-ray degrees; local, coefficient, tame-tensor and correction maps retain this condition.
  Ring-class conductor arithmetic uses ImaginaryQuadraticClassNumber H1.4's residue-unit
  exact sequence and ClassFieldTheory Layer 13's Artin correspondence (§2.9).
* Layers 4–5: rational and integral Selmer bounds (§§4.7, 4.13, 4.17–4.21), rank-one
  freeness and dual Selmer structure (§§5.3, 5.6), and the self-dual bound and exact
  primitivity formula (§§5.10, 5.13). The partial divisibility indices (§5.1) use a
  bounded minimum with top `k` over a principal Artinian ring of length `k`, giving `k`
  on empty conductor-size levels; over a DVR the empty-level index is `∞`.
  The MR04 Artinian
  stub-sheaf results (§5.3), in every core rank, require `P ⊆ P_k` for `k = length(R)`.
  The Howard–Zanarella paired hypotheses use the
  lattice Tate dual `T† = Hom_R(T,R)(1)` and its dual local conditions (§0.2);
  compact/discrete duality retains the Cartier dual. The Howard auxiliary-prime filtration
  uses maximal-ideal depth, with finite cyclotomic congruences in prime selection
  and ambient prime sets in DVR reductions (§§5.2, 5.8, 5.10–5.12).
* Layers 6–7: Stark-system freeness and Fitting formulas (§6.6), the signed regulator
  isomorphism (§§6.7–6.8), higher derivative and determinant comparisons (§§7.2, 7.5a), and
  higher-rank Fitting and class-group bounds (§§7.4, 7.6). Mathlib's exterior powers and
  linear duals alone do not supply the arithmetic systems or their transition maps.
  The regulator uses functional-first contractions, the conductor sign and the
  ordered permutation signs of §6.7; the determinant comparison uses the same normalization.
  Its ordinary compact-support complex retains the archimedean term and the
  resulting surjection in degree one (§7.5a).
  IntegralIwasawaTheory §12.6 supplies the shared exterior-bidual and finite-CM Rubin-lattice core,
  including the rational Rubin–Brumer–Stark element and its evaluation and change-of-place API.
  Section 7.3 uses adapters to that element and owns the conjecture predicate and system applications.
* Layer 8: the Euler-to-Kolyvagin map over the finite coefficient rings `O/J_n`
  (§8.17), weak Leopoldt (§§8.25, 8.27), Iwasawa bounds and primitivity equalities
  (§§8.28–8.33), and integral divisibilities (§§8.34–8.39). These also require the
  compact-coefficient Iwasawa Selmer modules, specialization maps and characteristic
  ideals specified in that layer and its suppliers. The local-condition input at `p`
  includes Galois equivariance and compatible tower actions (§8.8). Restriction control
  uses fixed-vector conditions and determinants on the finite free lattices
  `T` and `T†`; twisting `T` by `ρ` twists `T†` by `ρ⁻¹` (§8.15). Its Selmer and error terms
  retain discrete coefficients, with the coefficient trace comparison of §0.2.
  Specialized exact-length hypotheses use lattice Tate duals (§8.32); the local discrete dual
  at the coefficient prime is `U† ⊗_O F/O`, with its coefficient trace comparison (§8.35).
  The finite-quotient derivative construction uses the full cyclotomic branch over `O/J_n`,
  a local stabilization index and a separate deeper auxiliary-prime index (§8.17).
  Generalized reduction, specialization and blind spots
  retain the ambient auxiliary-prime filtration (§§3.3, 8.12, 8.24). Intrinsic targets
  use the inverse of the restriction comparison under its prime-set and residual
  hypotheses (§8.18); generalized extensionality is levelwise equality in the direct limits.
  Cyclotomic-unit freeness, generation, residual and Lambda primitivity, and equality
  use the shared application contract of §8.12: an odd prime, the canonical Selmer
  structure and the specified Frobenius filtration, or compatible finite-level restriction
  isomorphisms including residual reduction and augmentation. The general relative
  implication from residual to Lambda primitivity (§8.26) applies to every fixed filtration.
  The coefficient prime in §8.30 is generated by a uniformizer of `O`; horizontal
  perturbations use its powers and vertical perturbations are Eisenstein over `O`.
  Relative ramification indices and residue degrees convert specialized DVR lengths
  to `O`-lengths, and the residue degree of `O` converts these to `ℤ_p`-lengths.

These arithmetic statements are README targets on the specified Selmer and system carriers.
-/

namespace TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

/-! ## Layer 4: Rational vanishing and Selmer bounds -/

/-- A faithful irreducible continuous action of a compact group on a finite-dimensional
vector space over a finite extension of `ℚ_p` has vanishing first continuous cohomology.
Rubin, Appendix C, Theorem 1.1 and its application in Theorem 2.1. -/
theorem compactIrreducible_h1_vanish
    (p : ℕ) [Fact p.Prime]
    (Φ : Type*) [NormedField Φ] [NormedAlgebra ℚ_[p] Φ] [FiniteDimensional ℚ_[p] Φ]
    (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [T2Space G]
    (V : Type*) [NormedAddCommGroup V] [NormedSpace Φ V] [FiniteDimensional Φ V]
    [DistribMulAction G V] [SMulCommClass G Φ V] [ContinuousSMul G V]
    [FaithfulSMul G V]
    [Representation.IsIrreducible (Representation.ofDistribMulAction Φ G V)] :
    Subsingleton (TauCeti.ContCohomology.H1 G V) := by
  sorry

/-- For a topologically finitely generated profinite group acting continuously and linearly
on a finite-dimensional space over a finite extension of `ℚ_p`, quotienting by a stable
finite free full lattice induces a map on continuous `H¹` with finite cokernel. Its image
is divisible and contains every divisible subgroup of the target.
Rubin, Appendix C, proof of Corollary 2.2, with the lattice-cohomology comparison of
Appendix B, Proposition 2.4. The quotient action is fixed by equivariance of `L.mkQ`. -/
theorem integralComparison_finiteCokernel_maximalDivisible
    (p : ℕ) [Fact p.Prime]
    (Φ : Type*) [NormedField Φ] [NormedAlgebra ℚ_[p] Φ] [FiniteDimensional ℚ_[p] Φ]
    (O : Subring Φ) (hO : ∀ x : Φ, x ∈ O ↔ ‖x‖ ≤ 1)
    (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsTopologicallyFinitelyGenerated G)
    (V : Type*) [NormedAddCommGroup V] [NormedSpace Φ V] [FiniteDimensional Φ V]
    [DistribMulAction G V] [SMulCommClass G Φ V] [ContinuousSMul G V]
    (L : Submodule O V) [Module.Finite O L] [Module.Free O L]
    (hfull : Submodule.span Φ (L : Set V) = ⊤)
    [DistribMulAction G (V ⧸ L)] [ContinuousSMul G (V ⧸ L)]
    (hq : ∀ (g : G) (v : V), L.mkQ (g • v) = g • L.mkQ v) :
    let q : V →+[G] (V ⧸ L) :=
      { L.mkQ.toAddMonoidHom with map_smul' := hq }
    let I := (TauCeti.ContCohomology.explicitCoeff1 G V q L.continuous_mkQ).range
    Finite ((TauCeti.ContCohomology.H1 G (V ⧸ L)) ⧸ I) ∧
      (∀ (n : ℕ), n ≠ 0 → Function.Surjective (fun x : I => n • x)) ∧
      (∀ D : AddSubgroup (TauCeti.ContCohomology.H1 G (V ⧸ L)),
        (∀ (n : ℕ), n ≠ 0 → Function.Surjective (fun x : D => n • x)) → D ≤ I) := by
  sorry

end TauCetiRoadmap.EulerSystemsAndKolyvaginSystems
