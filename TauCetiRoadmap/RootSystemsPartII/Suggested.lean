module

public import Mathlib
public import TauCeti.LinearAlgebra.RootSystem.Chamber
public import TauCeti.LinearAlgebra.RootSystem.DynkinType

/-!
# Integral dominance and finite diagram folding: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs.

All headline theorems are statable using native fixed submodules, dual spaces,
finite orbit-image indices and a structure bundling a native root pairing and
base with their explicit realization equations. No folded pairing is constructed
as admitted data. Component-cycle transport is a construction adapter, not a
replacement headline.
-/

public section

namespace TauCetiRoadmap.RootSystemsPartII

open scoped BigOperators
universe u v w a
variable {ι : Type u} {M : Type v} {N : Type w}
  [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]

/-! ## Layer 1: integral dominance and the Stembridge step -/

/-- Distinct dominant real weights whose difference is a natural sum of simple
roots admit a positive-root increment staying dominant and below the upper
endpoint; integrality of the endpoints is not needed. Extra central directions
are allowed. Rapoport, Lemma 2.3, (2.10)–(2.13). -/
theorem stembridge_step (P : RootPairing ι ℝ M N) [Finite ι]
    [P.IsReduced] [P.IsCrystallographic] (b : P.Base) (lam mu : M)
    (hlam : lam ∈ RootPairing.dominantChamber P b)
    (hmu : mu ∈ RootPairing.dominantChamber P b)
    (hne : lam ≠ mu) (hle : mu - lam ∈ TauCeti.posRootCone P b) :
    ∃ i : ι, b.IsPos i ∧ lam + P.root i ∈ RootPairing.dominantChamber P b ∧
      P.root i ∈ TauCeti.posRootCone P b ∧ lam ≠ lam + P.root i ∧
      mu - (lam + P.root i) ∈ TauCeti.posRootCone P b := by
  sorry

/-! ## Layer 2: orthogonal diagram folding -/

/-- Distinct iterates of a root index, independent of a chosen period. -/
noncomputable def orbitIndices (P : RootPairing ι ℝ M N) [Finite ι]
    (sigma : P.Aut) (i : ι) : Finset ι :=
  (Set.range fun k : ℕ => ((sigma.indexEquiv : ι → ι)^[k]) i).toFinite.toFinset

/-- The sum of the roots in one distinct orbit, each counted once. -/
noncomputable def orbitSum (P : RootPairing ι ℝ M N) [Finite ι]
    (sigma : P.Aut) (i : ι) : M :=
  ∑ j ∈ orbitIndices P sigma i, P.root j

/-- The distinct image of root-orbit sums, used as an index type rather than a
possibly noninjective quotient of root orbits. -/
def foldedIndices (P : RootPairing ι ℝ M N) [Finite ι] (sigma : P.Aut) : Set M :=
  Set.range (orbitSum P sigma)

/-- A realization bundles a native based root pairing on the fixed space and its
dual. Its roots are the actual distinct orbit-sum vectors, its pairing is
evaluation, and its base consists exactly of the simple-orbit sums. -/
structure OrbitSumRealization (P : RootPairing ι ℝ M N) [Finite ι]
    (b : P.Base) (sigma : P.Aut) where
  /-- The native pairing on the fixed space and its linear dual. -/
  pairing : RootPairing (foldedIndices P sigma) ℝ (LinearMap.fixedSubmodule sigma.weightMap)
    (Module.Dual ℝ (LinearMap.fixedSubmodule sigma.weightMap))
  /-- Its finite simple base. -/
  base : pairing.Base
  /-- Both root and coroot families span. -/
  rootSystem : pairing.IsRootSystem
  /-- No proportional roots except a root and its negative. -/
  reduced : pairing.IsReduced
  /-- All root-coroot pairings are integers. -/
  crystallographic : pairing.IsCrystallographic
  /-- The perfect pairing is evaluation against the fixed-space dual. -/
  evaluation : ∀ x y, pairing.toLinearMap x y = y x
  /-- Each root is its actual orbit-sum vector in the ambient space. -/
  root_eq : ∀ i, (pairing.root i : M) = (i : M)
  /-- Simple roots are exactly the original simple-orbit sums. -/
  base_eq : ∀ i, i ∈ base.support ↔
    ∃ j ∈ b.support, orbitSum P sigma j = (i : M)

/-- The subgroup of the native Weyl group fixed by conjugation by the based
automorphism, expressed as the inverse image of its centralizer. -/
noncomputable def fixedWeylGroup (P : RootPairing ι ℝ M N) (sigma : P.Aut) :
    Subgroup P.weylGroup :=
  (Subgroup.centralizer ({sigma} : Set P.Aut)).comap P.weylGroup.subtype

/-- Restriction identifies the conjugation-fixed Weyl subgroup with the Weyl
group of an orthogonal orbit-sum realization. The equation specifies the
isomorphism by its actual action on fixed vectors. Stembridge, Claim 3. -/
theorem fixed_weyl_group (P : RootPairing ι ℝ M N) [Finite ι]
    [P.IsRootSystem] [P.IsReduced] [P.IsCrystallographic]
    (b : P.Base) (sigma : P.Aut)
    (hbase : ∀ i : ι, i ∈ b.support ↔ sigma.indexEquiv i ∈ b.support)
    (hsimply : b.cartanMatrix.IsSimplyLaced)
    (horth : ∀ i ∈ b.support, ∀ j ∈ orbitIndices P sigma i,
      i ≠ j → P.pairing i j = 0)
    (F : OrbitSumRealization P b sigma) :
    ∃ e : fixedWeylGroup P sigma ≃* F.pairing.weylGroup,
      ∀ (w : fixedWeylGroup P sigma) (x : LinearMap.fixedSubmodule sigma.weightMap),
        ((e w • x : LinearMap.fixedSubmodule sigma.weightMap) : M) =
          ((w : P.weylGroup) • (x : M)) := by
  sorry

/-! ## Layer 3: all finite based diagram automorphisms -/

/-- A based automorphism of a nonempty irreducible finite reduced crystallographic
real root system fixes every root index if the Cartan matrix is not simply laced. -/
theorem indexEquiv_eq_self_of_multiple_edge
    (P : RootPairing ι ℝ M N) [Finite ι] [Nonempty ι]
    [P.IsRootSystem] [P.IsReduced] [P.IsCrystallographic] [P.IsIrreducible]
    (b : P.Base) (sigma : P.Aut)
    (hbase : ∀ i : ι, i ∈ b.support ↔ sigma.indexEquiv i ∈ b.support)
    (hmultiple : ¬ b.cartanMatrix.IsSimplyLaced) :
    ∀ i : ι, sigma.indexEquiv i = i := by
  sorry

/-- Simple orbits in an irreducible simply-laced finite real system are orthogonal,
except for the reversal of even A type; the exceptional case specifies the
Cartan numbering and the reversal equation. -/
theorem simpleOrbit_pairing_eq_zero_or_typeA_even
    (P : RootPairing ι ℝ M N) [Finite ι] [Nonempty ι]
    [P.IsRootSystem] [P.IsReduced] [P.IsCrystallographic] [P.IsIrreducible]
    (b : P.Base) (sigma : P.Aut)
    (hbase : ∀ i : ι, i ∈ b.support ↔ sigma.indexEquiv i ∈ b.support)
    (hsimply : b.cartanMatrix.IsSimplyLaced) :
    (∀ i ∈ b.support, ∀ j ∈ orbitIndices P sigma i,
      i ≠ j → P.pairing i j = 0) ∨
    ∃ n : ℕ, 1 ≤ n ∧ ∃ e : b.support ≃ Fin (2 * n),
      (∀ i j : b.support, b.cartanMatrix i j =
        (TauCeti.DynkinType.A (2 * n)).cartanMatrix (e i) (e j)) ∧
      (∀ i j : b.support, sigma.indexEquiv i = j → e j = (e i).rev) := by
  sorry

/-- Every finite reduced crystallographic based real root system and every
based automorphism have a reduced crystallographic orbit-sum realization.
This includes orthogonal folds, even-A reversal and component cycles. -/
theorem general_fold (P : RootPairing ι ℝ M N) [Finite ι]
    [P.IsRootSystem] [P.IsReduced] [P.IsCrystallographic]
    (b : P.Base) (sigma : P.Aut)
    (hbase : ∀ i : ι, i ∈ b.support ↔ sigma.indexEquiv i ∈ b.support) :
    Nonempty (OrbitSumRealization P b sigma) := by
  sorry

/-! ## Layer 4: invariant dominance and coroot orbit steps -/

/-- On an orbit-sum realization the original and folded closed dominant
chambers agree on fixed vectors, and original integral simple-coroot values
imply folded integral simple-coroot values. -/
theorem invariant_weight_transport (P : RootPairing ι ℝ M N) [Finite ι]
    [P.IsRootSystem] [P.IsReduced] [P.IsCrystallographic]
    (b : P.Base) (sigma : P.Aut)
    (hbase : ∀ i : ι, i ∈ b.support ↔ sigma.indexEquiv i ∈ b.support)
    (F : OrbitSumRealization P b sigma) (x : LinearMap.fixedSubmodule sigma.weightMap) :
    ((x : M) ∈ RootPairing.dominantChamber P b ↔
      x ∈ RootPairing.dominantChamber F.pairing F.base) ∧
    ((∀ i ∈ b.support, ∃ z : ℤ, P.coroot' i (x : M) = (z : ℝ)) →
      ∀ j ∈ F.base.support, ∃ z : ℤ, F.pairing.coroot' j x = (z : ℝ)) := by
  sorry

/-- The folded integral positive cone is exactly the invariant original
positive cone; the embedded folded root lattice is exactly the invariant
original root lattice. No saturation or averaging is used. -/
theorem invariant_cone_transport (P : RootPairing ι ℝ M N) [Finite ι]
    [P.IsRootSystem] [P.IsReduced] [P.IsCrystallographic]
    (b : P.Base) (sigma : P.Aut)
    (hbase : ∀ i : ι, i ∈ b.support ↔ sigma.indexEquiv i ∈ b.support)
    (F : OrbitSumRealization P b sigma) (x : LinearMap.fixedSubmodule sigma.weightMap) :
    ((x : M) ∈ TauCeti.posRootCone P b ↔
      x ∈ TauCeti.posRootCone F.pairing F.base) ∧
    ((x : M) ∈ AddSubgroup.closure (Set.range P.root) ↔
      x ∈ AddSubgroup.closure (Set.range F.pairing.root)) := by
  sorry

/-- Invariant distinct dominant real endpoints whose difference is a natural sum
of simple roots admit a positive-root orbit sum that stays dominant and within
that integral root budget. -/
theorem invariant_step (P : RootPairing ι ℝ M N) [Finite ι]
    [P.IsRootSystem] [P.IsReduced] [P.IsCrystallographic]
    (b : P.Base) (sigma : P.Aut)
    (hbase : ∀ i : ι, i ∈ b.support ↔ sigma.indexEquiv i ∈ b.support)
    (lam mu : M)
    (hfixed_lam : sigma.weightMap lam = lam)
    (hfixed_mu : sigma.weightMap mu = mu)
    (hlam : lam ∈ RootPairing.dominantChamber P b)
    (hmu : mu ∈ RootPairing.dominantChamber P b)
    (hne : lam ≠ mu) (hle : mu - lam ∈ TauCeti.posRootCone P b) :
    ∃ i : ι, b.IsPos i ∧ orbitSum P sigma i ≠ 0 ∧
      sigma.weightMap (lam + orbitSum P sigma i) = lam + orbitSum P sigma i ∧
      lam + orbitSum P sigma i ∈ RootPairing.dominantChamber P b ∧
      orbitSum P sigma i ∈ TauCeti.posRootCone P b ∧
      lam ≠ lam + orbitSum P sigma i ∧
      mu - (lam + orbitSum P sigma i) ∈ TauCeti.posRootCone P b := by
  sorry

/-- The invariant step in a finite-dimensional ambient pairing retains the central
component, without a spanning or central finite-order hypothesis; the additive
subgroup only needs to contain the roots. Apply it to the flipped pairing for
coroot increments. -/
theorem ambient_coroot_step (P : RootPairing ι ℝ M N) [Finite ι]
    [FiniteDimensional ℝ M] [FiniteDimensional ℝ N]
    [P.IsReduced] [P.IsCrystallographic]
    (b : P.Base) (sigma : P.Aut)
    (hbase : ∀ i : ι, i ∈ b.support ↔ sigma.indexEquiv i ∈ b.support)
    (L : AddSubgroup M) (hroots : ∀ i : ι, P.root i ∈ L)
    (lam mu : L)
    (hfixed_lam : sigma.weightMap (lam : M) = lam)
    (hfixed_mu : sigma.weightMap (mu : M) = mu)
    (hlam : (lam : M) ∈ RootPairing.dominantChamber P b)
    (hmu : (mu : M) ∈ RootPairing.dominantChamber P b)
    (hne : lam ≠ mu) (hle : (mu : M) - lam ∈ TauCeti.posRootCone P b) :
    ∃ i : ι, b.IsPos i ∧ orbitSum P sigma i ≠ 0 ∧
      (lam : M) + orbitSum P sigma i ∈ L ∧
      sigma.weightMap ((lam : M) + orbitSum P sigma i) =
        (lam : M) + orbitSum P sigma i ∧
      (lam : M) + orbitSum P sigma i ∈ RootPairing.dominantChamber P b ∧
      orbitSum P sigma i ∈ TauCeti.posRootCone P b ∧
      (lam : M) ≠ (lam : M) + orbitSum P sigma i ∧
      (mu : M) - ((lam : M) + orbitSum P sigma i) ∈
        TauCeti.posRootCone P b := by
  sorry

/-- Lift the ambient orbit step to an abelian group with possible torsion. The real
realization is injective on the specified root subgroup and intertwines the actual
action. Fixedness and cone comparisons hold in the original group. -/
theorem torsion_lattice_coroot_step
    (P : RootPairing ι ℝ M N) [Finite ι]
    [FiniteDimensional ℝ M] [FiniteDimensional ℝ N]
    [P.IsReduced] [P.IsCrystallographic]
    (b : P.Base) (sigma : P.Aut)
    (hbase : ∀ i : ι, i ∈ b.support ↔ sigma.indexEquiv i ∈ b.support)
    (A : Type a) [AddCommGroup A] (r : ι → A) (f : A →+ M) (tau : A ≃+ A)
    (hreal : ∀ i : ι, f (r i) = P.root i)
    (hinj : Set.InjOn f (AddSubgroup.closure (Set.range r)))
    (hequiv : ∀ x : A, f (tau x) = sigma.weightMap (f x))
    (hroot_equiv : ∀ i : ι, tau (r i) = r (sigma.indexEquiv i))
    (lam mu : A) (hfixed_lam : tau lam = lam) (hfixed_mu : tau mu = mu)
    (hlam : f lam ∈ RootPairing.dominantChamber P b)
    (hmu : f mu ∈ RootPairing.dominantChamber P b)
    (hne : lam ≠ mu)
    (hle : mu - lam ∈ AddSubmonoid.closure (r '' (b.support : Set ι))) :
    ∃ i : ι, b.IsPos i ∧
      let beta := ∑ j ∈ orbitIndices P sigma i, r j
      beta ≠ 0 ∧ tau (lam + beta) = lam + beta ∧
      f (lam + beta) ∈ RootPairing.dominantChamber P b ∧
      beta ∈ AddSubmonoid.closure (r '' (b.support : Set ι)) ∧
      mu - (lam + beta) ∈ AddSubmonoid.closure (r '' (b.support : Set ι)) := by
  sorry

end TauCetiRoadmap.RootSystemsPartII
