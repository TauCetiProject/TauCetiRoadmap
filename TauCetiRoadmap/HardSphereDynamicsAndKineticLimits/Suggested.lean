module

import Mathlib

/-!
# Hard-sphere dynamics and kinetic limits: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test: it
states, against the pinned Mathlib, the headline theorems that the finished roadmap proves, each
with `sorry`, together with the definitions those statements need. Every definition has a real
body; the API lemmas, Checks, boundary cases and worked examples of the README are not restated.

Stated here:

* Layer 5: uniqueness of hard-sphere trajectories (`HardSphere.IsTrajectory.eqOn`);
* Layer 6: Alexander's theorem for finitely many particles on a flat position space: the
  configurations of the closed hard-core set with no global trajectory form a null set
  (`HardSphere.volume_hardCoreSet_diff_goodSet`);
* Layer 7: the hard-sphere flow is a group (`HardSphere.flow_add`), preserves Lebesgue measure on
  the phase space and on the hard-core set (`HardSphere.measurePreserving_flow`), and is reversible
  (`HardSphere.flow_reversal`);
* Layer 8: the weak Liouville equation with specular reflection (`HardSphere.weak_liouville`);
* Layer 9: invariance of the Maxwellian grand canonical measure
  (`HardSphere.grandCanonical_flow_invariant`), the defining identity of the correlation functions
  (`HardSphere.lintegral_sum_distinct_eq_correlation`) and the Boltzmann–Grad scaling of the mean
  particle number (`HardSphere.boltzmannGrad_scaling`);
* Layer 10: the law of large numbers for the empirical measure from the convergence of the first
  two correlation functions (`HardSphere.tendsto_empirical_of_correlation`), and its corollary
  under Lanford's theorem (`HardSphere.LanfordStatement.tendsto_empirical`).

Every headline theorem of the roadmap is statable at the pins. Lanford's theorem itself is not
a theorem of this roadmap: it is the proposition `HardSphere.LanfordStatement d`, defined here
for every `d`; for `d ≥ 2` it is the statement of BGSS2023 Theorem 1 (the grand canonical gas on
the torus), for `d = 0` it is false (README §10.4), and its proof (the BBGKY and Boltzmann
hierarchies) is outside this roadmap. The flat position space structure of the flat torus
`FlatTorus L` (README §1.3) is not declared here: its fields (the lift and injectivity axioms at
the injectivity radius and the local measure axiom) are theorems of §1.3, and an instance with
unproved fields is excluded. So `HardSphere.LanfordStatement` and its corollary take a structure
`[FlatPositionSpace d (UnitFlatTorus d)]` as an instance argument; every such structure gives the
same proposition (README §10.4).
-/

namespace TauCetiRoadmap.HardSphereDynamicsAndKineticLimits

open MeasureTheory Filter Topology Set
open scoped ENNReal NNReal RealInnerProductSpace BoundedContinuousFunction

/-! ## Layer 1: Flat position spaces -/

/-- A flat position space of dimension `d`: a normed additive commutative group `X`, proper as a
metric space, with its Borel σ-algebra and a measure `volume`, together with a surjective additive
homomorphism `cover : E → X` from `E = EuclideanSpace ℝ (Fin d)` and an injectivity radius
`radius ∈ (0, ∞]`, such that `cover` does not increase norms, every point of norm less than the
radius has a lift of the same norm, `cover` is injective on the open ball of that radius, `volume`
is translation invariant, and `cover` carries Lebesgue measure on measurable subsets of that ball to
`volume`. Euclidean space (with `cover = id`, radius `∞`) and the flat tori `E ⧸ L` are the two
settings of the sources (GST2013 line 833; BGSS2023 line 119). -/
class FlatPositionSpace (d : ℕ) (X : Type*) [NormedAddCommGroup X] [ProperSpace X]
    [MeasureSpace X] [BorelSpace X] where
  /-- The covering homomorphism `π : E → X`. -/
  cover : EuclideanSpace ℝ (Fin d) →+ X
  /-- The injectivity radius `ρ`. -/
  radius : ℝ≥0∞
  /-- The injectivity radius is positive. -/
  radius_pos : 0 < radius
  /-- The cover is surjective. -/
  surjective_cover : Function.Surjective cover
  /-- The cover does not increase norms. -/
  norm_cover_le (a : EuclideanSpace ℝ (Fin d)) : ‖cover a‖ ≤ ‖a‖
  /-- A point of norm less than `ρ` has a lift of the same norm. -/
  exists_lift (ξ : X) : ENNReal.ofReal ‖ξ‖ < radius → ∃ a, cover a = ξ ∧ ‖a‖ = ‖ξ‖
  /-- The cover is injective on the open ball of radius `ρ`. -/
  injOn_cover : Set.InjOn cover {a | ENNReal.ofReal ‖a‖ < radius}
  /-- The measure is translation invariant. -/
  isAddLeftInvariant_volume : (volume : Measure X).IsAddLeftInvariant
  /-- The cover carries Lebesgue measure on measurable subsets of the ball of radius `ρ` to the
  measure of `X`. -/
  volume_image_cover (A : Set (EuclideanSpace ℝ (Fin d))) (hA : MeasurableSet A)
    (hAρ : A ⊆ {a | ENNReal.ofReal ‖a‖ < radius}) : volume (cover '' A) = volume A

namespace FlatPositionSpace

variable {d : ℕ} {X : Type*} [NormedAddCommGroup X] [ProperSpace X] [MeasureSpace X]
  [BorelSpace X] [FlatPositionSpace d X]

open scoped Classical in
/-- The short lift `ℓ(ξ)`: the unique lift of `ξ` in the open ball of radius `ρ` when there is one
(it exists, of norm `‖ξ‖`, when `‖ξ‖ < ρ`), and `0` otherwise. Contact normals are
`ℓ(x_i − x_j)/ε`. -/
noncomputable def shortLift (ξ : X) : EuclideanSpace ℝ (Fin d) :=
  if h : ∃ a : EuclideanSpace ℝ (Fin d), cover a = ξ ∧ ENNReal.ofReal ‖a‖ < radius d X
  then h.choose else 0

end FlatPositionSpace

/-- The flat torus `E ⧸ L` of a lattice `L` (a discrete subgroup of full rank) of
`E = EuclideanSpace ℝ (Fin d)`, the quotient of `E` by the additive subgroup underlying `L`. It
carries the quotient norm `‖x + L‖ = dist(x, L)`, the Borel σ-algebra of the quotient topology, and
the measure image of Lebesgue measure restricted to the fundamental domain of a chosen `ℤ`-basis of
`L` (BGSS2023 lines 119–142, for the unit torus). -/
noncomputable def FlatTorus {d : ℕ} (L : Submodule ℤ (EuclideanSpace ℝ (Fin d)))
    [DiscreteTopology L] [IsZLattice ℝ L] : Type :=
  EuclideanSpace ℝ (Fin d) ⧸ L.toAddSubgroup

namespace FlatTorus

variable {d : ℕ} (L : Submodule ℤ (EuclideanSpace ℝ (Fin d))) [DiscreteTopology L]
  [IsZLattice ℝ L]

/-- The quotient norm of the flat torus; the lattice is closed, being discrete. -/
noncomputable instance : NormedAddCommGroup (FlatTorus L) :=
  haveI : DiscreteTopology L.toAddSubgroup := ‹DiscreteTopology L›
  haveI : IsClosed (L.toAddSubgroup : Set (EuclideanSpace ℝ (Fin d))) :=
    AddSubgroup.isClosed_of_discreteTopology
  inferInstanceAs (NormedAddCommGroup (EuclideanSpace ℝ (Fin d) ⧸ L.toAddSubgroup))

/-- The flat torus is compact: it is the image of the closure of a bounded fundamental domain. -/
instance : CompactSpace (FlatTorus L) := by
  have : Module.Free ℤ L := ZLattice.module_free ℝ L
  let b := (Module.Free.chooseBasis ℤ L).ofZLatticeBasis ℝ L
  have hspan : Submodule.span ℤ (Set.range b) = L :=
    (Module.Free.chooseBasis ℤ L).ofZLatticeBasis_span ℝ L
  have hK : IsCompact (closure (ZSpan.fundamentalDomain b)) :=
    (ZSpan.fundamentalDomain_isBounded b).isCompact_closure
  refine ⟨?_⟩
  have himg := hK.image (QuotientAddGroup.continuous_mk (G := EuclideanSpace ℝ (Fin d))
    (N := L.toAddSubgroup))
  show IsCompact (Set.univ : Set (EuclideanSpace ℝ (Fin d) ⧸ L.toAddSubgroup))
  convert himg using 1
  symm
  rw [Set.eq_univ_iff_forall]
  intro x
  induction x using QuotientAddGroup.induction_on with
  | H x =>
    refine ⟨ZSpan.fract b x, subset_closure (ZSpan.fract_mem_fundamentalDomain b x), ?_⟩
    rw [QuotientAddGroup.eq, ZSpan.fract_apply]
    have hm : ((ZSpan.floor b x : EuclideanSpace ℝ (Fin d))) ∈ L :=
      hspan.le (ZSpan.floor b x).2
    simpa [neg_add_eq_sub, sub_sub_cancel_left] using L.neg_mem hm

/-- The quotient σ-algebra of the flat torus. -/
noncomputable instance : MeasurableSpace (FlatTorus L) :=
  inferInstanceAs (MeasurableSpace (EuclideanSpace ℝ (Fin d) ⧸ L.toAddSubgroup))

/-- The measure of the flat torus: the image under the quotient map of Lebesgue measure restricted
to the fundamental domain of a chosen `ℤ`-basis of `L`. It is the image of Lebesgue measure
restricted to every fundamental domain, and has total mass `ZLattice.covolume L` (README §1.3). -/
noncomputable instance : MeasureSpace (FlatTorus L) :=
  haveI : Module.Free ℤ L := ZLattice.module_free ℝ L
  { volume := Measure.map
      (fun x : EuclideanSpace ℝ (Fin d) =>
        (show FlatTorus L from (QuotientAddGroup.mk x : EuclideanSpace ℝ (Fin d) ⧸ L.toAddSubgroup)))
      ((volume : Measure (EuclideanSpace ℝ (Fin d))).restrict
        (ZSpan.fundamentalDomain ((Module.Free.chooseBasis ℤ L).ofZLatticeBasis ℝ L))) }

/-- The quotient σ-algebra of the flat torus is its Borel σ-algebra. -/
instance : BorelSpace (FlatTorus L) :=
  haveI : DiscreteTopology L.toAddSubgroup := ‹DiscreteTopology L›
  haveI : IsClosed (L.toAddSubgroup : Set (EuclideanSpace ℝ (Fin d))) :=
    AddSubgroup.isClosed_of_discreteTopology
  inferInstanceAs (BorelSpace (EuclideanSpace ℝ (Fin d) ⧸ L.toAddSubgroup))

end FlatTorus

/-- The unit flat torus `𝕋^d = E ⧸ ℤ^d`, for the lattice spanned by the standard basis. -/
abbrev UnitFlatTorus (d : ℕ) : Type :=
  FlatTorus (Submodule.span ℤ (Set.range (EuclideanSpace.basisFun (Fin d) ℝ).toBasis))

namespace HardSphere

variable {d : ℕ} {X : Type*} [NormedAddCommGroup X]

/-! ## Layer 2: Elastic scattering -/

/-- The scattering map `σ_ν(v, w) = (v − ⟨v − w, ν⟩ν, w + ⟨v − w, ν⟩ν)`; for a unit vector `ν` it is
the elastic collision of two equal masses with line of centres `ν` (GST2013 lines 843–847; BGSS2023
lines 125–131; DengHaniMa2024 lines 157–163). -/
noncomputable def scatter (ν : EuclideanSpace ℝ (Fin d)) :
    (EuclideanSpace ℝ (Fin d) × EuclideanSpace ℝ (Fin d)) →ₗ[ℝ]
      (EuclideanSpace ℝ (Fin d) × EuclideanSpace ℝ (Fin d)) where
  toFun p := (p.1 - ⟪p.1 - p.2, ν⟫ • ν, p.2 + ⟪p.1 - p.2, ν⟫ • ν)
  map_add' p q := by
    refine Prod.ext ?_ ?_ <;>
      simp only [Prod.fst_add, Prod.snd_add, inner_add_left, inner_sub_left] <;> module
  map_smul' c p := by
    refine Prod.ext ?_ ?_ <;>
      simp only [Prod.smul_fst, Prod.smul_snd, RingHom.id_apply, inner_sub_left,
        real_inner_smul_left] <;> module

/-! ## Layer 3: Phase space, contacts and free transport -/

/-- The closed hard-core set `𝒟̄^ε_N` of configurations of `N` particles of diameter `ε` whose
centres are pairwise at distance at least `ε` (DengHaniMa2024 (1.1), lines 150–153; GST2013
lines 839–841 and BGSS2023 lines 137–142 use the open set with strict inequalities, which differs
from it by a null set for `0 < ε < ρ`). -/
def hardCoreSet (ε : ℝ) (N : ℕ) : Set (Fin N → X × EuclideanSpace ℝ (Fin d)) :=
  {Z | ∀ i j, i ≠ j → ε ≤ ‖(Z i).1 - (Z j).1‖}

variable [ProperSpace X] [MeasureSpace X] [BorelSpace X] [FlatPositionSpace d X]

open scoped Classical in
/-- The contact scattering `σ_M`: when the contact pairs `{i, j}` (`‖x_i − x_j‖ = ε`) of the
positions form a matching, it applies the scattering map with the contact normal
`ν_ij = ℓ(x_i − x_j)/ε` to the velocities of every contact pair; otherwise it is the identity.
The new velocity of `i` is `v_i + Σ_j (σ_{ν_ij}(v_i, v_j)₁ − v_i)`, the sum over the contact
partners `j` of `i`, of which the matching condition allows at most one. Positions are unchanged
(GST2013 lines 1219–1227). -/
noncomputable def contactScatter (ε : ℝ) {N : ℕ} (Z : Fin N → X × EuclideanSpace ℝ (Fin d)) :
    Fin N → X × EuclideanSpace ℝ (Fin d) :=
  if ∀ i j k, i ≠ j → i ≠ k → ‖(Z i).1 - (Z j).1‖ = ε → ‖(Z i).1 - (Z k).1‖ = ε → j = k then
    fun i => ((Z i).1, (Z i).2 +
      ∑ j ∈ Finset.univ.filter (fun j => i ≠ j ∧ ‖(Z i).1 - (Z j).1‖ = ε),
        ((scatter (ε⁻¹ • FlatPositionSpace.shortLift ((Z i).1 - (Z j).1))
          ((Z i).2, (Z j).2)).1 - (Z i).2))
  else Z

/-- The time reversal `ℛ(X, V) = (X, −σ_M V)`; it agrees with `(X, V) ↦ (X, −V)` off the contact
configurations. -/
noncomputable def reversal (ε : ℝ) {N : ℕ} (Z : Fin N → X × EuclideanSpace ℝ (Fin d)) :
    Fin N → X × EuclideanSpace ℝ (Fin d) :=
  fun i => ((Z i).1, -(contactScatter ε Z i).2)

/-- Free transport `S_t(X, V) = (X + π(t V), V)`, componentwise (GST2013 lines 836–837). -/
def freeFlow {N : ℕ} (t : ℝ) (Z : Fin N → X × EuclideanSpace ℝ (Fin d)) :
    Fin N → X × EuclideanSpace ℝ (Fin d) :=
  fun i => ((Z i).1 + FlatPositionSpace.cover (t • (Z i).2), (Z i).2)

/-! ## Layer 5: Hard-sphere trajectories -/

/-- A hard-sphere trajectory on a set of times `J` (an interval in every use): at every time of
`J` the configuration lies in the closed hard-core set; positions are the time integrals of
velocities; the velocities are constant on every subinterval of `J` avoiding a set of times that is
finite in every bounded interval; at every time the contact pairs form a matching and each of them
is outgoing; the state is right-continuous within `J`; and its left limit within `J` is the contact
scattering of the state (the incoming velocities). Only the values on `J` are constrained (GST2013
lines 836–847; BGSS2023 lines 122–131; DengHaniMa2024 lines 140–172, with left-continuous
velocities). -/
def IsTrajectory (ε : ℝ) {N : ℕ} (J : Set ℝ) (Z : ℝ → Fin N → X × EuclideanSpace ℝ (Fin d)) :
    Prop :=
  (∀ t ∈ J, Z t ∈ hardCoreSet ε N) ∧
  (∀ s ∈ J, ∀ t ∈ J, s ≤ t → ∀ i,
    (Z t i).1 = (Z s i).1 + FlatPositionSpace.cover (∫ r in s..t, (Z r i).2)) ∧
  (∃ 𝒯 ⊆ J, (∀ a b : ℝ, (𝒯 ∩ Icc a b).Finite) ∧
    ∀ I ⊆ J, I.OrdConnected → Disjoint I 𝒯 → ∀ s ∈ I, ∀ t ∈ I, ∀ i, (Z s i).2 = (Z t i).2) ∧
  (∀ t ∈ J, ∀ i j k, i ≠ j → i ≠ k → ‖(Z t i).1 - (Z t j).1‖ = ε →
    ‖(Z t i).1 - (Z t k).1‖ = ε → j = k) ∧
  (∀ t ∈ J, ∀ i j, i ≠ j → ‖(Z t i).1 - (Z t j).1‖ = ε →
    0 < ⟪(Z t i).2 - (Z t j).2, ε⁻¹ • FlatPositionSpace.shortLift ((Z t i).1 - (Z t j).1)⟫) ∧
  (∀ t ∈ J, Tendsto Z (𝓝[J ∩ Ioi t] t) (𝓝 (Z t))) ∧
  (∀ t ∈ J, Tendsto Z (𝓝[J ∩ Iio t] t) (𝓝 (contactScatter ε (Z t))))

/-- The good set `G`: the configurations through which a trajectory defined for all times passes
at time `0`. -/
def goodSet (ε : ℝ) (N : ℕ) : Set (Fin N → X × EuclideanSpace ℝ (Fin d)) :=
  {Z | ∃ γ : ℝ → Fin N → X × EuclideanSpace ℝ (Fin d), IsTrajectory ε univ γ ∧ γ 0 = Z}

/-- Uniqueness of hard-sphere trajectories: two trajectories on an interval `J` that agree at one
time of `J` agree on `J`, for every diameter `ε`. This form, at every initial state, for every real
`ε` and every interval, is proved from the definition and is stated in none of the sources;
DengHaniMa2024 Proposition 1.2 (lines 182–183) gives uniqueness only off a closed Lebesgue-null set
of initial data, on Euclidean space with `d ≥ 2`. -/
theorem IsTrajectory.eqOn {ε : ℝ} {N : ℕ} {J : Set ℝ} (hJ : J.OrdConnected)
    {Z Z' : ℝ → Fin N → X × EuclideanSpace ℝ (Fin d)} (hZ : IsTrajectory ε J Z)
    (hZ' : IsTrajectory ε J Z') {t₀ : ℝ} (ht₀ : t₀ ∈ J) (h : Z t₀ = Z' t₀) : EqOn Z Z' J := by
  sorry

/-! ## Layer 6: Alexander's theorem -/

/-- Alexander's theorem for finitely many particles: for `0 < ε < ρ`, the configurations of the
closed hard-core set through which no global trajectory passes form a Lebesgue-null set; outside it
the motion has only binary, non-grazing collisions, finitely many in bounded time (GST2013
Proposition 4.1.1, lines 862–863, proof lines 875–910; DengHaniMa2024 Proposition 1.2, lines
182–188; Alexander1976 Proposition 4.3). -/
theorem volume_hardCoreSet_diff_goodSet {ε : ℝ} (hε : 0 < ε)
    (hερ : ENNReal.ofReal ε < FlatPositionSpace.radius d X) (N : ℕ) :
    (volume : Measure (Fin N → X × EuclideanSpace ℝ (Fin d))) (hardCoreSet ε N \ goodSet ε N) =
      0 := by
  sorry

/-! ## Layer 7: The hard-sphere flow -/

open scoped Classical in
/-- The hard-sphere flow `T_t`: the value at time `t` of the trajectory through `Z` when `Z` lies in
the good set (the trajectory is unique), and `Z` itself otherwise (GST2013 line 862; BGSS2023
lines 132–139). -/
noncomputable def flow (ε : ℝ) {N : ℕ} (t : ℝ) (Z : Fin N → X × EuclideanSpace ℝ (Fin d)) :
    Fin N → X × EuclideanSpace ℝ (Fin d) :=
  if h : ∃ γ : ℝ → Fin N → X × EuclideanSpace ℝ (Fin d), IsTrajectory ε univ γ ∧ γ 0 = Z
  then h.choose t else Z

/-- The group law of the hard-sphere flow: for every real diameter `ε`, `T_{s+t} = T_s ∘ T_t` for
all real `s, t`, on the whole phase space (time translates of trajectories on `ℝ` are trajectories,
and trajectories on `ℝ` are unique). -/
theorem flow_add {ε : ℝ} {N : ℕ} (s t : ℝ) :
    (flow ε (s + t) : (Fin N → X × EuclideanSpace ℝ (Fin d)) → _) = flow ε s ∘ flow ε t := by
  sorry

/-- Liouville's theorem for hard spheres: for `0 < ε < ρ` every time-`t` map of the hard-sphere flow
preserves Lebesgue measure on the phase space and its restriction to the closed hard-core set
(GST2013 line 883; DengHaniMa2024 line 186). -/
theorem measurePreserving_flow {ε : ℝ} (hε : 0 < ε)
    (hερ : ENNReal.ofReal ε < FlatPositionSpace.radius d X) (N : ℕ) (t : ℝ) :
    MeasurePreserving (flow ε t) (volume : Measure (Fin N → X × EuclideanSpace ℝ (Fin d)))
        volume ∧
      MeasurePreserving (flow ε t)
        ((volume : Measure (Fin N → X × EuclideanSpace ℝ (Fin d))).restrict (hardCoreSet ε N))
        ((volume : Measure (Fin N → X × EuclideanSpace ℝ (Fin d))).restrict
          (hardCoreSet ε N)) := by
  sorry

/-- Reversibility of the hard-sphere flow: for every real diameter `ε`, `T_t ∘ ℛ = ℛ ∘ T_{−t}` on the
whole phase space, with `ℛ(X, V) = (X, −σ_M V)` the time reversal. -/
theorem flow_reversal {ε : ℝ} {N : ℕ} (t : ℝ) (Z : Fin N → X × EuclideanSpace ℝ (Fin d)) :
    flow ε t (reversal ε Z) = reversal ε (flow ε (-t) Z) := by
  sorry

/-! ## Layer 8: Densities, the Liouville equation and marginals -/

/-- The weak Liouville equation with specular reflection: for an integrable density `W⁰` vanishing
off the hard-core set, transported as `W(t) = W⁰ ∘ T_{−t}`, and a bounded measurable test function
`φ(t, Z)` vanishing for large `|t|`, with bounded measurable material derivative
`Lφ(t, Z) = d/dr φ(t + r, S_r Z)` at `r = 0` and invariant under the contact scattering,
`∫_0^∞ ∫ W(t) Lφ(t) dZ dt + ∫ W⁰ φ(0) dZ = 0` (GST2013 (4.2.1) and (4.3.1), lines 911–918 and
941–958; BGSS2023 (1.1.3)–(1.1.4), lines 145–157). -/
theorem weak_liouville {ε : ℝ} (hε : 0 < ε)
    (hερ : ENNReal.ofReal ε < FlatPositionSpace.radius d X) {N : ℕ}
    {W₀ : (Fin N → X × EuclideanSpace ℝ (Fin d)) → ℝ} (hW₀ : Integrable W₀)
    (hW₀D : ∀ Z ∉ hardCoreSet ε N, W₀ Z = 0)
    {φ Lφ : ℝ → (Fin N → X × EuclideanSpace ℝ (Fin d)) → ℝ}
    (hφ : Measurable (Function.uncurry φ)) (hφC : ∃ C, ∀ t Z, |φ t Z| ≤ C)
    (hφT : ∃ T, ∀ t Z, T ≤ |t| → φ t Z = 0)
    (hLφ : Measurable (Function.uncurry Lφ)) (hLφC : ∃ C, ∀ t Z, |Lφ t Z| ≤ C)
    (hderiv : ∀ t Z, HasDerivAt (fun r => φ (t + r) (freeFlow r Z)) (Lφ t Z) 0)
    (hspec : ∀ t Z, φ t (contactScatter ε Z) = φ t Z) :
    (∫ t in Ioi (0 : ℝ), ∫ Z, W₀ (flow ε (-t) Z) * Lφ t Z) + ∫ Z, W₀ Z * φ 0 Z = 0 := by
  sorry

/-! ## Layer 9: Equilibria and grand canonical ensembles -/

/-- The grand canonical partition function
`𝒵 = Σ_{N ≥ 0} (μ^N/N!) ∫_{𝒟̄_N} Π_i f⁰(z_i) dZ` (BGSS2023 (1.1.6), lines 167–181). -/
noncomputable def partitionFunction (ε : ℝ) (μ : ℝ≥0)
    (f₀ : X × EuclideanSpace ℝ (Fin d) → ℝ≥0∞) : ℝ≥0∞ :=
  ∑' N : ℕ, (μ : ℝ≥0∞) ^ N / N.factorial *
    ∫⁻ Z in (hardCoreSet ε N : Set (Fin N → X × EuclideanSpace ℝ (Fin d))), ∏ i, f₀ (Z i)

/-- The initial density of `N` particles, `W⁰_N = μ^N Π_i f⁰(z_i) 1_{𝒟̄_N} / 𝒵` (BGSS2023 (1.1.5),
lines 167–181). -/
noncomputable def grandCanonicalDensity (ε : ℝ) (μ : ℝ≥0)
    (f₀ : X × EuclideanSpace ℝ (Fin d) → ℝ≥0∞) (N : ℕ)
    (Z : Fin N → X × EuclideanSpace ℝ (Fin d)) : ℝ≥0∞ :=
  (hardCoreSet ε N).indicator (fun Z => (μ : ℝ≥0∞) ^ N * ∏ i, f₀ (Z i)) Z /
    partitionFunction ε μ f₀

/-- The grand canonical measure on `Σ N, (X × E)^N` whose `N`-th component has density
`W⁰_N / N!` with respect to Lebesgue measure (BGSS2023 (1.1.5)–(1.1.6), lines 167–181;
DengHaniMa2024 Definition 1.3, lines 199–223). -/
noncomputable def grandCanonical (ε : ℝ) (μ : ℝ≥0) (f₀ : X × EuclideanSpace ℝ (Fin d) → ℝ≥0∞) :
    Measure (Σ N : ℕ, Fin N → X × EuclideanSpace ℝ (Fin d)) :=
  Measure.sum fun N : ℕ =>
    ((volume : Measure (Fin N → X × EuclideanSpace ℝ (Fin d))).withDensity fun Z =>
      grandCanonicalDensity ε μ f₀ N Z / N.factorial).map (Sigma.mk N)

/-- Invariance of the Maxwellian grand canonical measure: on every flat position space, for
`0 < ε < ρ`, the grand canonical measure with `f⁰(x, v) = c exp(−β|v − u|²/2)`, `β > 0`, is invariant
under the componentwise hard-sphere flow; when `μ_X(X) = ∞` and `μ c > 0` the partition function is
infinite and the measure is zero. The equilibrium `f⁰ = M` and its invariant measure are named in
BGSS2023 lines 479–483; the invariance, on every flat position space and for every value of the
partition function, is proved in the roadmap from the conservation of energy and momentum (README
§9.2, §9.4) and is stated as a theorem in none of GST2013, BGSS2023 and DengHaniMa2024. -/
theorem grandCanonical_flow_invariant {ε : ℝ} (hε : 0 < ε)
    (hερ : ENNReal.ofReal ε < FlatPositionSpace.radius d X) (μ c : ℝ≥0) {β : ℝ}
    (hβ : 0 < β) (u : EuclideanSpace ℝ (Fin d)) (t : ℝ) :
    MeasurePreserving
      (fun p : Σ N : ℕ, Fin N → X × EuclideanSpace ℝ (Fin d) =>
        (⟨p.1, flow ε t p.2⟩ : Σ N : ℕ, Fin N → X × EuclideanSpace ℝ (Fin d)))
      (grandCanonical ε μ fun z => c * ENNReal.ofReal (Real.exp (-(β * ‖z.2 - u‖ ^ 2) / 2)))
      (grandCanonical ε μ fun z => c * ENNReal.ofReal (Real.exp (-(β * ‖z.2 - u‖ ^ 2) / 2))) := by
  sorry

/-- The rescaled correlation function of order `n` at time `t`,
`F_n(t)(Z_n) = μ^{−n} Σ_{p ≥ 0} (1/p!) ∫ W⁰_{n+p}(T_{−t}(Z_n, z_{n+1}, …, z_{n+p})) dz` (BGSS2023
(1.1.10), lines 267–277; DengHaniMa2024 (1.11), lines 235–244). -/
noncomputable def correlation (ε : ℝ) (μ : ℝ≥0) (f₀ : X × EuclideanSpace ℝ (Fin d) → ℝ≥0∞)
    (n : ℕ) (t : ℝ) (Z : Fin n → X × EuclideanSpace ℝ (Fin d)) : ℝ≥0∞ :=
  ((μ : ℝ≥0∞) ^ n)⁻¹ * ∑' p : ℕ, ((p.factorial : ℝ≥0∞))⁻¹ *
    ∫⁻ Z' : Fin p → X × EuclideanSpace ℝ (Fin d),
      grandCanonicalDensity ε μ f₀ (n + p) (flow ε (-t) (Fin.append Z Z'))

/-- The correlation functions compute the expected sums over ordered `n`-tuples of distinct
particles: `E[Σ_i h(z_{i_1}(t), …, z_{i_n}(t))] = μ^n ∫ F_n(t) h`, the sum over injective
`i : Fin n → Fin N` (BGSS2023 (1.1.9) and (1.1.11), lines 241–266 and 279–288). -/
theorem lintegral_sum_distinct_eq_correlation {ε : ℝ} (hε : 0 < ε)
    (hερ : ENNReal.ofReal ε < FlatPositionSpace.radius d X) (μ : ℝ≥0)
    {f₀ : X × EuclideanSpace ℝ (Fin d) → ℝ≥0∞} (hf₀ : Measurable f₀) (n : ℕ) (t : ℝ)
    {h : (Fin n → X × EuclideanSpace ℝ (Fin d)) → ℝ≥0∞} (hh : Measurable h) :
    ∫⁻ p, ∑ i : Fin n ↪ Fin p.1, h (fun k => flow ε t p.2 (i k)) ∂grandCanonical ε μ f₀ =
      (μ : ℝ≥0∞) ^ n * ∫⁻ Z, correlation ε μ f₀ n t Z * h Z := by
  sorry

/-- The Boltzmann–Grad scaling of the mean particle number: for `d ≥ 1`, `0 < ε < ρ`,
`μ_ε = ε^{−(d−1)}` and a probability density `f⁰`,
`1 − ω_d ε ‖ρ⁰‖_∞ ≤ ε^{d−1} E[N] ≤ 1`, with `ω_d` the volume of the unit ball of `E` and
`ρ⁰(x) = ∫ f⁰(x, v) dv`. The limit `ε^{d−1} E[N] → 1` is the normalisation BGSS2023 (1.1.8),
lines 211–217, and the error `O(ε)` is DengHaniMa2024 (1.12), lines 246–252; the two-sided bound
with the constant `ω_d ‖ρ⁰‖_∞` is proved in the roadmap and is stated in neither source. -/
theorem boltzmannGrad_scaling (hd : 1 ≤ d) {ε : ℝ} (hε : 0 < ε)
    (hερ : ENNReal.ofReal ε < FlatPositionSpace.radius d X)
    {f₀ : X × EuclideanSpace ℝ (Fin d) → ℝ≥0∞} (hf₀ : Measurable f₀) (hf₀1 : ∫⁻ z, f₀ z = 1) :
    1 - volume (Metric.ball (0 : EuclideanSpace ℝ (Fin d)) 1) * ENNReal.ofReal ε *
          essSup (fun x : X => ∫⁻ v, f₀ (x, v)) volume ≤
        ENNReal.ofReal (ε ^ (d - 1)) *
          ∫⁻ p, (p.1 : ℝ≥0∞) ∂grandCanonical ε (Real.toNNReal (ε⁻¹ ^ (d - 1))) f₀ ∧
      ENNReal.ofReal (ε ^ (d - 1)) *
          ∫⁻ p, (p.1 : ℝ≥0∞) ∂grandCanonical ε (Real.toNNReal (ε⁻¹ ^ (d - 1))) f₀ ≤ 1 := by
  sorry

/-! ## Layer 10: The Boltzmann–Grad limit -/

/-- The rescaled empirical measure tested against `h`:
`π_t(h)(N, Z) = μ^{−1} Σ_{i < N} h((T_t Z)_i)` (BGSS2023 (1.2.4)–(1.2.5), lines 324–334). -/
noncomputable def empirical (ε : ℝ) (μ : ℝ≥0) (t : ℝ) (h : X × EuclideanSpace ℝ (Fin d) → ℝ)
    (p : Σ N : ℕ, Fin N → X × EuclideanSpace ℝ (Fin d)) : ℝ :=
  (μ : ℝ)⁻¹ * ∑ i, h (flow ε t p.2 i)

/-- The hard-sphere Boltzmann collision operator on a velocity profile `g`,
`Q(g, g)(v) = ∫_E ∫_{S^{d−1}} ⟨w − v, ω⟩_+ (g(v') g(w') − g(v) g(w)) dσ(ω) dw` with
`(v', w') = σ_ω(v, w)` and `σ` the sphere measure of Lebesgue measure; on a function of `(x, v)` it
acts at each position `x` (BGSS2023 (1.2.1)–(1.2.3), lines 292–312; GST2013 (2.1.2),
lines 385–393). -/
noncomputable def collisionOperator (g : EuclideanSpace ℝ (Fin d) → ℝ)
    (v : EuclideanSpace ℝ (Fin d)) : ℝ :=
  ∫ w, ∫ ω, max ⟪w - v, (ω : EuclideanSpace ℝ (Fin d))⟫ 0 *
      (g (scatter (ω : EuclideanSpace ℝ (Fin d)) (v, w)).1 *
          g (scatter (ω : EuclideanSpace ℝ (Fin d)) (v, w)).2 - g v * g w)
    ∂(volume : Measure (EuclideanSpace ℝ (Fin d))).toSphere

/-- A mild solution of the Boltzmann equation on `[0, T]` with datum `f⁰`: a jointly measurable
`f` with a Gaussian bound `|f(t, x, v)| ≤ C exp(−β|v|²/2)` (`C, β > 0`) for `t ∈ [0, T]`, such that
for every `t ∈ [0, T]` and almost every `(x, v)`,
`f(t, x + π(t v), v) = f⁰(x, v) + ∫_0^t Q(f(s), f(s))(x + π(s v), v) ds` (BGSS2023 (1.2.1),
lines 292–304; GST2013 (2.1.1), lines 380–384). -/
def IsMildBoltzmannSolution (f₀ : X × EuclideanSpace ℝ (Fin d) → ℝ) (T : ℝ)
    (f : ℝ → X × EuclideanSpace ℝ (Fin d) → ℝ) : Prop :=
  Measurable (Function.uncurry f) ∧
  (∃ C β : ℝ, 0 < C ∧ 0 < β ∧ ∀ t ∈ Icc 0 T, ∀ z : X × EuclideanSpace ℝ (Fin d),
    |f t z| ≤ C * Real.exp (-(β * ‖z.2‖ ^ 2) / 2)) ∧
  ∀ t ∈ Icc 0 T, ∀ᵐ z : X × EuclideanSpace ℝ (Fin d),
    f t (z.1 + FlatPositionSpace.cover (t • z.2), z.2) =
      f₀ z + ∫ s in (0 : ℝ)..t,
        collisionOperator (fun v => f s (z.1 + FlatPositionSpace.cover (s • z.2), v)) z.2

/-- The law of large numbers from the first two correlation functions: on a flat position space,
let `f⁰` be measurable with finite integral, `μ_ε → ∞` as `ε → 0⁺`, and `f` integrable. If
`∫ F^ε_n(t) g → ∫ f^{⊗n} g` for every bounded continuous `g` on `(X × E)^n`, `n = 1, 2`, then for
every bounded continuous `h` and `δ > 0`, the grand canonical probability that the empirical measure
tested against `h` differs from `∫ f h` by at least `δ` tends to `0` (BGSS2023 Corollary 1.2.1,
lines 344–349, proof lines 352–371). -/
theorem tendsto_empirical_of_correlation {f₀ : X × EuclideanSpace ℝ (Fin d) → ℝ≥0∞}
    (hf₀ : Measurable f₀) (hf₀' : ∫⁻ z, f₀ z ≠ ∞) {μ : ℝ → ℝ≥0}
    (hμ : Tendsto μ (𝓝[>] 0) atTop) {t : ℝ} {f : X × EuclideanSpace ℝ (Fin d) → ℝ}
    (hf : Integrable f)
    (hF : ∀ n, n = 1 ∨ n = 2 → ∀ g : (Fin n → X × EuclideanSpace ℝ (Fin d)) →ᵇ ℝ,
      Tendsto (fun ε => ∫ Z, (correlation ε (μ ε) f₀ n t Z).toReal * g Z) (𝓝[>] 0)
        (𝓝 (∫ Z, (∏ i, f (Z i)) * g Z)))
    (h : X × EuclideanSpace ℝ (Fin d) →ᵇ ℝ) {δ : ℝ} (hδ : 0 < δ) :
    Tendsto (fun ε => grandCanonical ε (μ ε) f₀
        {p | δ ≤ |empirical ε (μ ε) t h p - ∫ z, f z * h z|}) (𝓝[>] 0) (𝓝 0) := by
  sorry

/-- Lanford's theorem as a proposition, on the unit torus `𝕋^d` with a flat position
space structure: for all `C₀ ≥ 1` and `β₀ > 0` there is `T₀ > 0` such that for every continuous
probability density `f⁰` on `𝕋^d × E` with `f⁰(x, v) ≤ C₀ exp(−β₀|v|²/2)` and
`|f⁰(x, v) − f⁰(y, v)| ≤ C₀ ‖x − y‖ exp(−β₀|v|²/2)` there is a mild solution `f` on `[0, T₀]` with
datum `f⁰` such that, in the scaling `μ_ε = ε^{−(d−1)}`, at every `t ∈ [0, T₀]`: the correlation
functions `F^ε_n(t)`, `n ≥ 1`, converge to `f(t)^{⊗n}` against every bounded continuous function and
almost everywhere along every sequence `ε_k → 0⁺`, and `F^ε_1(t) → f(t)` in essential supremum on
every compact set. For `d ≥ 2` it is the statement of BGSS2023 Theorem 1 (lines 316–321), the
grand canonical form on the torus of Lanford's theorem, which that source attributes to Lanford1975
and refers to other works to prove (lines 313–315 and 322), recovering only the convergence of
`F^ε_1(t)` in the sense of measures (BGSS2023 Proposition 5.4.1, lines 2874–2895). GST2013 Theorem 8
(lines 2069–2080) is the counterpart on `ℝᵈ` for a fixed number `N` of particles with
`N ε^{d−1} = 1` (GST2013 lines 672 and 833), and Lanford1975 is likewise the fixed-`N` (canonical)
statement (BGSS2023 lines 313–315). Its proof is outside this roadmap; for `d = 0` it is false
(README §10.4). -/
def LanfordStatement (d : ℕ) [FlatPositionSpace d (UnitFlatTorus d)] : Prop :=
  ∀ C₀ β₀ : ℝ, 1 ≤ C₀ → 0 < β₀ → ∃ T₀ : ℝ, 0 < T₀ ∧
    ∀ f₀ : UnitFlatTorus d × EuclideanSpace ℝ (Fin d) → ℝ, Continuous f₀ → (∀ z, 0 ≤ f₀ z) →
      ∫ z, f₀ z = 1 → (∀ z, f₀ z ≤ C₀ * Real.exp (-(β₀ * ‖z.2‖ ^ 2) / 2)) →
      (∀ x y v, |f₀ (x, v) - f₀ (y, v)| ≤ C₀ * ‖x - y‖ * Real.exp (-(β₀ * ‖v‖ ^ 2) / 2)) →
      ∃ f : ℝ → UnitFlatTorus d × EuclideanSpace ℝ (Fin d) → ℝ,
        IsMildBoltzmannSolution f₀ T₀ f ∧ ∀ t ∈ Icc 0 T₀,
          (∀ n, 1 ≤ n → ∀ g : (Fin n → UnitFlatTorus d × EuclideanSpace ℝ (Fin d)) →ᵇ ℝ,
            Tendsto (fun ε => ∫ Z, (correlation ε (Real.toNNReal (ε⁻¹ ^ (d - 1)))
                (fun z => ENNReal.ofReal (f₀ z)) n t Z).toReal * g Z) (𝓝[>] 0)
              (𝓝 (∫ Z, (∏ i, f t (Z i)) * g Z))) ∧
          (∀ n, 1 ≤ n → ∀ εs : ℕ → ℝ, Tendsto εs atTop (𝓝[>] 0) →
            ∀ᵐ Z : Fin n → UnitFlatTorus d × EuclideanSpace ℝ (Fin d),
              Tendsto (fun k => (correlation (εs k) (Real.toNNReal ((εs k)⁻¹ ^ (d - 1)))
                (fun z => ENNReal.ofReal (f₀ z)) n t Z).toReal) atTop (𝓝 (∏ i, f t (Z i)))) ∧
          (∀ K : Set (UnitFlatTorus d × EuclideanSpace ℝ (Fin d)), IsCompact K →
            Tendsto (fun ε => essSup (fun z => ENNReal.ofReal
                |(correlation ε (Real.toNNReal (ε⁻¹ ^ (d - 1))) (fun z => ENNReal.ofReal (f₀ z))
                  1 t fun _ => z).toReal - f t z|) (volume.restrict K)) (𝓝[>] 0) (𝓝 0))

/-- The law of large numbers under Lanford's theorem: for `d ≥ 2`, assuming
`HardSphere.LanfordStatement d`, for all `C₀ ≥ 1` and `β₀ > 0` there is `T₀ > 0` such that every
admissible datum `f⁰` has a mild solution `f` on `[0, T₀]` for which, in the scaling
`μ_ε = ε^{−(d−1)}`, the rescaled empirical measure at every time `t ∈ [0, T₀]` converges in
probability to `f(t)` against every bounded continuous function (BGSS2023 Corollary 1.2.1,
lines 344–349). -/
theorem LanfordStatement.tendsto_empirical {d : ℕ} (hd : 2 ≤ d)
    [FlatPositionSpace d (UnitFlatTorus d)] (hL : LanfordStatement d) (C₀ β₀ : ℝ) (hC₀ : 1 ≤ C₀)
    (hβ₀ : 0 < β₀) :
    ∃ T₀ : ℝ, 0 < T₀ ∧
    ∀ f₀ : UnitFlatTorus d × EuclideanSpace ℝ (Fin d) → ℝ, Continuous f₀ → (∀ z, 0 ≤ f₀ z) →
      ∫ z, f₀ z = 1 → (∀ z, f₀ z ≤ C₀ * Real.exp (-(β₀ * ‖z.2‖ ^ 2) / 2)) →
      (∀ x y v, |f₀ (x, v) - f₀ (y, v)| ≤ C₀ * ‖x - y‖ * Real.exp (-(β₀ * ‖v‖ ^ 2) / 2)) →
      ∃ f : ℝ → UnitFlatTorus d × EuclideanSpace ℝ (Fin d) → ℝ,
        IsMildBoltzmannSolution f₀ T₀ f ∧ ∀ t ∈ Icc 0 T₀,
          ∀ h : UnitFlatTorus d × EuclideanSpace ℝ (Fin d) →ᵇ ℝ, ∀ δ : ℝ, 0 < δ →
            Tendsto (fun ε => grandCanonical ε (Real.toNNReal (ε⁻¹ ^ (d - 1)))
                (fun z => ENNReal.ofReal (f₀ z))
                {p | δ ≤ |empirical ε (Real.toNNReal (ε⁻¹ ^ (d - 1))) t h p - ∫ z, f t z * h z|})
              (𝓝[>] 0) (𝓝 0) := by
  sorry

end HardSphere

end TauCetiRoadmap.HardSphereDynamicsAndKineticLimits
