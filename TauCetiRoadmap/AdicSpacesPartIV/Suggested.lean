import Mathlib
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.StructurePresheaf.SheafyRing
import TauCeti.RingTheory.Huber.LocalizationTopology.Completion
import TauCeti.RingTheory.Huber.Pair
import TauCeti.RingTheory.Huber.PowerBounded
import TauCeti.RingTheory.Huber.TopologicallyFiniteType
import TauCeti.RingTheory.Huber.Uniform
import TauCeti.RingTheory.Huber.WeightedRestrictedSeries.Completion
import TauCeti.Topology.Algebra.Module.Compact
import TauCetiRoadmap.AdicEtaleGeometry.Suggested
import TauCetiRoadmap.PerfectoidSpaces.Suggested

/-!
# Foundations of adic spaces, Part IV: representative target signatures

This file is a set of suggested forms, not an exhaustive checklist: the README is definitive.

Huber rings and pairs, adic spectra, rational localisations, Tate algebras and the category
`TauCeti.AdicSpace` are Tau Ceti's; AdicSpacesPartII supplies affinoid charts and Huber's
morphism classes, PerfectoidSpaces the perfectoid Tate-ring predicate, AdicEtaleGeometry open subspaces, the
completed rational localisation `ratLoc`, étale morphisms by local description and fibre
products. RigidAnalyticGeometry §4.4 item 4 (W. Coram's roadmap at
`af8261a42a548ed86a11fff72c486673ef122ae7`, linked in the README supplier table)
supplies reducedness of rational affinoid subdomains;
the plus-ring comparison belongs to R5.6's `rational-integral-compatibility` in the README.
Completeness includes the Hausdorff property. This file states the parts that are a few lines
over these carriers:

* R4: strict normal crossings charts of rings, of complete affinoid algebras and of smooth schemes;
* R5: perfectoid frames and sousperfectoid rings and spaces, BHW's product of a perfectoid space
  with a smooth space, tilde-limits, profinite flat modules, small `ℤ_p`-algebras and the integral
  mixed completed tensor product;
* F1: overconvergent power series, dagger algebras and their completions, weak completions,
  algebras of Monsky–Washnitzer type and universally finite differentials.

The étale and pro-étale sites on these carriers, smooth pairs as global objects, the boundary
complement functors, coefficient sheaves, dagger spaces, their de Rham cohomology with supports
and compact supports, duality and finiteness are README targets. F1.10's
*dagger-projection-fringe-comparison* supplies the relative coherent comparison for proper
product projections and their relative differential sheaves, and constructs the dagger-valued
trace from rigid traces on larger affinoid bases over a complete discretely valued
mixed-characteristic field. Its completion and restriction compatibilities supply
*dagger-proper-projection-trace* and its supported and embedding-independence applications.
-/

set_option autoImplicit false

noncomputable section

namespace TauCetiRoadmap.AdicSpacesPartIV

open TauCeti

/-! ## Layer R4: étale sites, smooth pairs and boundary complements -/

/-! ### R4.7 Strict normal crossings charts (*smooth-pair*, *analytification-of-smooth-pair*) -/

namespace SmoothPair

open MvPolynomial

section Algebraic

variable (K : Type*) [Field K]

/-- A relative strict normal crossings chart of an ideal `I` of a `K`-algebra `R` (structure map
`σ`): integers `r ≤ n` and an étale ring map `coord : K[T₁, …, Tₙ] → R` over `K` with
`I = (coord (T₁ ⋯ T_r))`; `r = 0` gives `I = R`, the empty boundary (DLLZ-A, Ex. 2.3.17,
pp. 16–17). -/
structure AlgebraicChart {R : Type*} [CommRing R] (σ : K →+* R) (I : Ideal R) where
  /-- The dimension of the target affine space. -/
  n : ℕ
  /-- The number of coordinates cutting out the boundary. -/
  r : ℕ
  le : r ≤ n
  /-- The coordinate map `Tᵢ ↦ coord Tᵢ`. -/
  coord : MvPolynomial (Fin n) K →+* R
  coord_comp_C : coord.comp MvPolynomial.C = σ
  etale : coord.Etale
  ideal_eq : I = Ideal.span {coord (∏ i : Fin r, X (Fin.castLE le i))}

/-- The identity chart of `K[T₁, …, Tₙ]` with boundary ideal `(T₁ ⋯ T_r)`. -/
def modelAlgebraicChart (n r : ℕ) (hr : r ≤ n) :
    AlgebraicChart K (C : K →+* MvPolynomial (Fin n) K)
      (Ideal.span {∏ i : Fin r, X (Fin.castLE hr i)}) where
  n := n
  r := r
  le := hr
  coord := RingHom.id _
  coord_comp_C := rfl
  etale := RingHom.Etale.of_bijective Function.bijective_id
  ideal_eq := rfl

variable {K}

/-- In a chart the generator `coord (T₁ ⋯ T_r)` is a non-zero-divisor (étale maps are flat) and
the ideal is radical (étale over the reduced `K[T]/(T₁ ⋯ T_r)`): the boundary is a reduced
effective Cartier divisor. -/
theorem AlgebraicChart.isCartier {R : Type*} [CommRing R] {σ : K →+* R} {I : Ideal R}
    (c : AlgebraicChart K σ I) :
    c.coord (∏ i : Fin c.r, X (Fin.castLE c.le i)) ∈ nonZeroDivisors R ∧ I.IsRadical := sorry

end Algebraic

/-- The two-axis model: for `n = r = 2` the boundary generator is `T₁ T₂`. -/
example (K : Type*) [Field K] :
    (modelAlgebraicChart K 2 2 le_rfl).coord (∏ i : Fin 2, X (Fin.castLE le_rfl i)) =
      (X 0 * X 1 : MvPolynomial (Fin 2) K) := by
  change (∏ i : Fin 2, (X (Fin.castLE le_rfl i) : MvPolynomial (Fin 2) K)) = X 0 * X 1
  simp [Fin.prod_univ_two]

/-- The full boundary is impossible: over a nonzero ring the zero ideal has no chart, the
generator of a chart being a non-zero-divisor. -/
example (K : Type*) [Field K] {R : Type*} [CommRing R] [Nontrivial R] (σ : K →+* R) :
    IsEmpty (AlgebraicChart K σ ⊥) := sorry

/-- Three concurrent lines `T₁ T₂ (T₁ − T₂)` admit no chart on any Zariski neighbourhood `D(g)` of
the origin of `𝔸²_K`, in every characteristic. -/
example (K : Type*) [Field K] (g : MvPolynomial (Fin 2) K) (hg : eval 0 g ≠ 0) :
    IsEmpty (AlgebraicChart K (algebraMap K (Localization.Away g))
      (Ideal.span {(algebraMap (MvPolynomial (Fin 2) K) (Localization.Away g)
        (X 0 * X 1 * (X 0 - X 1)))})) := sorry

/-- Relative smoothness of the strata is needed: the regular prime divisor `V(T^p − a)` of `𝔸¹`
over a field of characteristic `p` has no chart near any of its points (EGA IV₄, Cor. 17.11.3). -/
example (K : Type*) [Field K] (p : ℕ) [Fact p.Prime] [CharP K p] (a : K)
    (x : PrimeSpectrum (MvPolynomial (Fin 1) K)) (hx : X 0 ^ p - C a ∈ x.asIdeal)
    (g : MvPolynomial (Fin 1) K) (hg : g ∉ x.asIdeal) :
    IsEmpty (AlgebraicChart K (algebraMap K (Localization.Away g))
      (Ideal.span {(algebraMap (MvPolynomial (Fin 1) K) (Localization.Away g)
        (X 0 ^ p - C a))})) := sorry

/-- After the Kummer substitution `S = S'²` the ideal `(T₁² − S'² T₂²)` has the chart
`(T₁ − S'T₂, T₁ + S'T₂, S')` on `D(S')`, with Jacobian `2S'`, when `2 ≠ 0` in `K`. -/
example (K : Type*) [Field K] [NeZero (2 : K)] :
    Nonempty (AlgebraicChart K
      (algebraMap K (Localization.Away (X 2 : MvPolynomial (Fin 3) K)))
      (Ideal.span {(algebraMap (MvPolynomial (Fin 3) K)
        (Localization.Away (X 2 : MvPolynomial (Fin 3) K))
        (X 0 ^ 2 - X 2 ^ 2 * X 1 ^ 2))})) := sorry

/-- In characteristic two the same substitution gives a doubled line and no chart. -/
example (K : Type*) [Field K] [CharP K 2] :
    IsEmpty (AlgebraicChart K
      (algebraMap K (Localization.Away (X 2 : MvPolynomial (Fin 3) K)))
      (Ideal.span {(algebraMap (MvPolynomial (Fin 3) K)
        (Localization.Away (X 2 : MvPolynomial (Fin 3) K))
        (X 0 ^ 2 - X 2 ^ 2 * X 1 ^ 2))})) := sorry

section SchemePair

open AlgebraicGeometry CategoryTheory

universe u

/-- An algebraic strict normal crossings pair over a field `K`: a scheme smooth over `K` with an
ideal sheaf `D` admitting a relative chart (`AlgebraicChart`) on an affine open neighbourhood of
every point, over the `K`-algebra structure induced by the structure morphism. Its local branches
and their partial intersections are smooth over `K` of the expected codimensions. For a complete
nonarchimedean `K`, dagger analytification of this pair requires the structure morphism to be
separated and of finite type. -/
structure AlgebraicSmoothPair (K : Type u) [Field K] where
  /-- The underlying scheme. -/
  X : Scheme.{u}
  /-- The structure morphism to `Spec K`. -/
  toSpec : X ⟶ Spec (CommRingCat.of K)
  smooth : Smooth toSpec
  /-- The ideal sheaf of the boundary. -/
  D : X.IdealSheafData
  exists_chart : ∀ x : X, ∃ U : X.affineOpens, x ∈ U.1 ∧
    Nonempty (AlgebraicChart K
      ((Scheme.ΓSpecIso (CommRingCat.of K)).inv ≫ toSpec.appLE ⊤ U.1 (by simp)).hom
      (D.ideal U))

/-- Every smooth `K`-scheme with the unit ideal sheaf (empty boundary) is an algebraic pair. -/
example (K : Type u) [Field K] (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of K)) [Smooth f] :
    ∃ P : AlgebraicSmoothPair K, P.X = X ∧ HEq P.toSpec f ∧ HEq P.D (⊤ : X.IdealSheafData) :=
  sorry

/-- A full boundary (`D = ⊥`) forces the scheme to be empty. -/
example (K : Type u) [Field K] (P : AlgebraicSmoothPair K) (hD : P.D = ⊥) : IsEmpty P.X := sorry

end SchemePair

section Affinoid

open TauCeti.Huber TauCetiRoadmap.AdicSpacesPartII.Huber

universe u

variable (K : Type u) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] [IsTateRing K]

/-- An affinoid strict normal crossings chart of the ideal `I` of a complete Huber pair `(A, A⁺)`
over `K`: a morphism of Huber pairs `(K⟨T₁, …, Tₙ⟩, K⟨T⟩°) → (A, A⁺)` over `K`, topologically of
finite type and étale in Huber's lifting sense (AdicSpacesPartII `Etale_affinoid`), with
`I = (h(T₁ ⋯ T_r))` as an equality of ideals (DLLZ-A, Ex. 2.3.17, pp. 16–17; Huber96,
Def. 1.6.5). -/
structure AffinoidChart {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [IsHuberRing A] [CompleteSpace A] [T2Space A] [Algebra K A]
    (S : Pair A) (I : Ideal A) where
  /-- The dimension of the polydisc. -/
  n : ℕ
  /-- The number of boundary coordinates. -/
  r : ℕ
  le : r ≤ n
  /-- The coordinate map. -/
  coord : Pair.Hom (Pair.powerBounded (restrictedMvPowerSeriesCompletion n K)) S
  scalars : coord.toRingHom.comp (algebraMap K _) = algebraMap K A
  finiteType : IsTopologicallyFiniteType coord.toRingHom
  etale : AdicSpacesPartII.AdicSpace.Etale_affinoid.{u, u, u} coord
  ideal_eq : I = Ideal.span {(coord.toRingHom
    (TateAlgebra.ofMvPolynomial K n (∏ i : Fin r, X (Fin.castLE le i))))}

variable {K}
variable {A : Type u} [CommRing A] [UniformSpace A] [IsUniformAddGroup A] [IsTopologicalRing A]
  [IsHuberRing A] [CompleteSpace A] [T2Space A] [Algebra K A] {S : Pair A} {I : Ideal A}

/-- The boundary of an affinoid chart is a reduced effective Cartier divisor. -/
theorem AffinoidChart.isCartier (c : AffinoidChart K S I) :
    c.coord.toRingHom (TateAlgebra.ofMvPolynomial K c.n
      (∏ i : Fin c.r, X (Fin.castLE c.le i))) ∈ nonZeroDivisors A ∧ I.IsRadical := sorry

/-- On a chart the boundary complement is the locus where every boundary coordinate has nonzero
valuation; for `r = 0` it is everything (Huber96, §1.1, pp. 38–39). -/
theorem AffinoidChart.mem_complement_iff (c : AffinoidChart K S I)
    (v : ValuationSpectrum.spa S.plus) :
    ¬ I ≤ v.1.supp ↔ ∀ i : Fin c.r, c.coord.toRingHom (TateAlgebra.ofMvPolynomial K c.n
      (X (Fin.castLE c.le i))) ∉ v.1.supp := sorry

end Affinoid

/-- The identity of the closed polydisc is a chart for its coordinate hyperplanes. -/
example (K : Type) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NonarchimedeanRing K] [Huber.IsTateRing K] (n r : ℕ) (hr : r ≤ n) :
    Nonempty (AffinoidChart K
      (Huber.Pair.powerBounded (Huber.restrictedMvPowerSeriesCompletion n K))
      (Ideal.span {(AdicSpacesPartII.Huber.TateAlgebra.ofMvPolynomial K n
        (∏ i : Fin r, X (Fin.castLE hr i)))})) := sorry

/-- A doubled origin `(T²)` in `K⟨T⟩` admits no chart, in every characteristic. -/
example (K : Type) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NonarchimedeanRing K] [Huber.IsTateRing K] :
    IsEmpty (AffinoidChart K
      (Huber.Pair.powerBounded (Huber.restrictedMvPowerSeriesCompletion 1 K))
      (Ideal.span {(AdicSpacesPartII.Huber.TateAlgebra.ofMvPolynomial K 1 (X 0)) ^ 2})) := sorry

end SmoothPair

/-! ## Layer R5: sousperfectoid spaces and coefficient algebras -/

namespace Huber

open TauCeti.Huber TauCetiRoadmap.PerfectoidSpaces.Perfectoid

universe u v

/-! ### R5.1–R5.3, R5.5 Sousperfectoid rings
(*sousperfectoid-ring*, *sousperfectoid-uniform*, *sousperfectoid-rational-localisation*,
*sousperfectoid-finite-etale*, *sousperfectoid-finite-etale-descent*, *sousperfectoid-rings*,
*sousperfectoid-p-adic-field*, *sousperfectoid-stably-uniform*, *sousperfectoid-sheafy*,
*perfectoid-times-polydisc*) -/

section Frame

variable (p : ℕ) (R : Type u) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/-- A *perfectoid frame* `(R̃, ι, σ)` of a topological ring `R`: a perfectoid Tate ring `R̃` for
`p` (PerfectoidSpaces' `Perfectoid.IsPerfectoidTateRing`, over its complete Hausdorff uniform
Tate structure), a continuous ring map `ι : R → R̃` and a continuous additive `σ : R̃ → R` that is
`R`-linear through `ι` with `σ ∘ ι = id`; `σ` need not be multiplicative (HK, Def. 7.1, p. 25;
Berkeley, Def. 6.3.1, p. 47). -/
structure PerfectoidFrame where
  /-- The perfectoid Tate ring `R̃`. -/
  Rt : Type u
  [commRing : CommRing Rt]
  [uniformSpace : UniformSpace Rt]
  [isUniformAddGroup : IsUniformAddGroup Rt]
  [isTopologicalRing : IsTopologicalRing Rt]
  [isTateRing : IsTateRing Rt]
  [completeSpace : CompleteSpace Rt]
  [t2Space : T2Space Rt]
  [isPerfectoidTateRing : IsPerfectoidTateRing p Rt]
  /-- The embedding `ι : R → R̃`. -/
  ι : R →+* Rt
  continuous_ι : Continuous ι
  /-- The retraction `σ : R̃ → R`. -/
  σ : Rt →+ R
  continuous_σ : Continuous σ
  σ_mul : ∀ (r : R) (x : Rt), σ (ι r * x) = r * σ x
  σ_ι : ∀ r : R, σ (ι r) = r

attribute [instance] PerfectoidFrame.commRing PerfectoidFrame.uniformSpace
  PerfectoidFrame.isUniformAddGroup PerfectoidFrame.isTopologicalRing PerfectoidFrame.isTateRing
  PerfectoidFrame.completeSpace PerfectoidFrame.t2Space PerfectoidFrame.isPerfectoidTateRing

/-- `R` is *sousperfectoid* (for `p`): a Tate ring admitting a perfectoid frame. Completeness,
the Hausdorff property and topological nilpotence of `p` are consequences. -/
class IsSousperfectoid : Prop where
  isTateRing : IsTateRing R
  nonempty_perfectoidFrame : Nonempty (PerfectoidFrame p R)

variable {p R}

/-- Power-boundedness is detected in a frame: `R° = ι⁻¹(R̃°)` (HK, Def. 7.1, p. 25). -/
theorem PerfectoidFrame.powerBoundedSubring_eq_comap [IsTateRing R] (F : PerfectoidFrame p R) :
    powerBoundedSubring R = (powerBoundedSubring F.Rt).comap F.ι := sorry

/-- Sousperfectoid rings are uniform (HK, §7, Def. 7.1 and §2, Def. 2.3, p. 3). -/
theorem IsSousperfectoid.isUniform [IsSousperfectoid p R] : IsUniform R := sorry

/-- Sousperfectoid rings are reduced, uniform Hausdorff Tate rings being reduced. -/
theorem IsSousperfectoid.isReduced [IsSousperfectoid p R] : IsReduced R := sorry

end Frame

section IdentityFrame

variable {p : ℕ} {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]

/-- The identity frame `(R, id, id)` of a perfectoid Tate ring. -/
def PerfectoidFrame.refl [IsPerfectoidTateRing p R] : PerfectoidFrame p R where
  Rt := R
  ι := RingHom.id R
  continuous_ι := continuous_id
  σ := AddMonoidHom.id R
  continuous_σ := continuous_id
  σ_mul _ _ := rfl
  σ_ι _ := rfl

/-- Perfectoid Tate rings are sousperfectoid, with the identity frame (Berkeley, Ex. 6.3.2(1)). -/
theorem IsSousperfectoid.of_isPerfectoidTateRing [IsPerfectoidTateRing p R] :
    IsSousperfectoid p R :=
  ⟨inferInstance, ⟨PerfectoidFrame.refl⟩⟩

end IdentityFrame

/-- The direction of the splitting: `σ ∘ ι = id_R`, while `ι ∘ σ` is only an idempotent of `R̃`
and, over a nonzero `R`, is not the identity for every frame. -/
example (p : ℕ) (R : Type u) [CommRing R] [Nontrivial R] [TopologicalSpace R]
    [IsTopologicalRing R] (F : PerfectoidFrame p R) :
    (∀ r, F.σ (F.ι r) = r) ∧ (∀ x, F.ι (F.σ (F.ι (F.σ x))) = F.ι (F.σ x)) ∧
      ¬ (∀ (F' : PerfectoidFrame p R) (x : F'.Rt), F'.ι (F'.σ x) = x) := sorry

/-- A sousperfectoid ring is complete and Hausdorff: `ι` is a homeomorphism onto the closed
subring `ker (id − ι ∘ σ)` of the complete Hausdorff `R̃`. So `ℚ_p(ζ_{p^∞})`, uncompleted, has no
frame. -/
example (p : ℕ) (R : Type u) [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]
    [IsSousperfectoid p R] :
    T2Space R ∧ @CompleteSpace R (IsTopologicalAddGroup.rightUniformSpace R) := sorry

section Stability

variable {p : ℕ} {R : Type u} [CommRing R] [UniformSpace R] [IsUniformAddGroup R]
  [IsTopologicalRing R] [IsTateRing R] [CompleteSpace R] [T2Space R]

open TauCetiRoadmap.AdicEtaleGeometry.Huber (ratLoc)

/-- Completed rational localisations `R⟨T/s⟩` of a sousperfectoid ring are sousperfectoid
(Berkeley, Prop. 6.3.3(1), p. 47; HK, Prop. 3.8, p. 8). -/
theorem isSousperfectoid_ratLoc [IsSousperfectoid p R] (P : PairOfDefinition R) (T : Finset R)
    (s : R) (hden : P.HasDenominatorPower T s (Localization.Away s))
    (hT : IsOpen ((Ideal.span (T : Set R) : Ideal R) : Set R)) :
    IsSousperfectoid p (ratLoc P T s hden) := sorry

/-- Sousperfectoid rings are stably uniform: every `R⟨T/s⟩` is uniform (Berkeley, Prop. 6.3.4,
p. 48). -/
theorem isUniform_ratLoc [IsSousperfectoid p R] (P : PairOfDefinition R)
    (T : Finset R) (s : R) (hden : P.HasDenominatorPower T s (Localization.Away s))
    (hT : IsOpen ((Ideal.span (T : Set R) : Ideal R) : Set R)) :
    IsUniform (ratLoc P T s hden) := sorry

/-- A finite étale `R`-algebra with its natural topology is sousperfectoid (Berkeley,
Prop. 6.3.3(2), p. 47; HK, Lem. 7.5(a), p. 25). -/
theorem IsSousperfectoid.finiteEtale [IsSousperfectoid p R] (S : Type u) [CommRing S]
    [Algebra R S] [Algebra.Etale R S] [Module.Finite R S] [TopologicalSpace S]
    [IsModuleTopology R S] :
    haveI := IsModuleTopology.isTopologicalRing R S
    IsSousperfectoid p S := sorry

/-- Descent along faithfully flat finite étale maps: compose a frame of `S` with an `R`-linear
retraction of `R → S` (HK, Lem. 7.5(b), pp. 25–26). -/
theorem IsSousperfectoid.of_finiteEtale (S : Type u) [CommRing S] [Algebra R S]
    [Algebra.Etale R S] [Module.Finite R S] [Module.FaithfullyFlat R S] [TopologicalSpace S]
    [IsModuleTopology R S]
    (hS : haveI := IsModuleTopology.isTopologicalRing R S; IsSousperfectoid p S) :
    IsSousperfectoid p R := sorry

/-- Tate algebras `R⟨T₁, …, Tₙ⟩` over sousperfectoid rings are sousperfectoid, with frame
`R̃⟨T^{1/p^∞}⟩` (Berkeley, Prop. 6.3.3(3), p. 47; HK, Lem. 7.3, p. 25). -/
theorem IsSousperfectoid.restrictedMvPowerSeries [IsSousperfectoid p R] (n : ℕ) :
    IsSousperfectoid p (restrictedMvPowerSeriesCompletion n R) := sorry

/-- Sousperfectoid rings are sheafy and strongly sheafy (BHW, Prop. 3.3, p. 1724; HK, Cor. 7.4,
p. 25). -/
theorem IsSousperfectoid.isSheafyRing [IsSousperfectoid p R] :
    IsSheafyRing R ∧ TauCetiRoadmap.AdicEtaleGeometry.Huber.IsStronglySheafy R := sorry

end Stability

/-- A complete isometric field extension of countable type over a complete discretely valued
field admits a retraction bounded by one (`countable-extension-retraction`, HK Rem. 7.8).
Compatible bounded functionals on successive finite spans extend over their dense union. -/
theorem exists_countable_extension_retraction (K : Type*) [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1)
    (hdisc : ∀ a : K, a ≠ 0 → ∃ k : ℤ, ‖a‖ = ‖π‖ ^ k)
    (L : Type*) [NormedField L] [IsUltrametricDist L] [CompleteSpace L] [NormedAlgebra K L]
    (x : ℕ → L) (hx : Dense (Submodule.span K (Set.range x) : Set L)) :
    ∃ σ : L →L[K] K, (∀ a : K, σ (algebraMap K L a) = a) ∧ ∀ z : L, ‖σ z‖ ≤ ‖z‖ := sorry

/-- Finite extensions of `ℚ_p` are sousperfectoid: `K → K^cycl` has a continuous `K`-linear
retraction supplied by `exists_countable_extension_retraction`; the finite cyclotomic levels
span a dense countable union (HK, Rem. 7.8, p. 26). -/
theorem IsSousperfectoid.of_finite_padic (p : ℕ) [Fact p.Prime] (K : Type) [Field K]
    [Algebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K] [TopologicalSpace K] [IsModuleTopology ℚ_[p] K] :
    haveI := IsModuleTopology.isTopologicalRing ℚ_[p] K
    IsSousperfectoid p K := sorry

/-- For a nonzero perfectoid Tate ring `S` and `n ≥ 1`, `S⟨T₁, …, Tₙ⟩` is not perfectoid (proved
here: `T₁` is not a `p`-th power in `S°⟨T⟩/ϖ` for nonzero `S`, as for `ℚ_p⟨T⟩` in
*sousperfectoid-ring*; Berkeley, Ex. 6.3.2(2), p. 47, for `ℚ_p⟨T⟩`). -/
theorem not_isPerfectoidTateRing_restrictedMvPowerSeries {p : ℕ} [Fact p.Prime] (S : Type u)
    [CommRing S] [UniformSpace S] [IsUniformAddGroup S] [IsTopologicalRing S] [IsTateRing S]
    [CompleteSpace S] [T2Space S] [Nontrivial S] [IsPerfectoidTateRing p S] (n : ℕ) (hn : 0 < n) :
    ¬ IsPerfectoidTateRing p (restrictedMvPowerSeriesCompletion n S) := sorry

/-- `ℚ_p` fails the perfectoid divisibility condition. -/
example (p : ℕ) [Fact p.Prime] : ¬ IsPerfectoidTateRing p ℚ_[p] := sorry

/-- A degree-`p` extension with `π^p = p` is not perfectoid: Frobenius misses
its uniformiser modulo `p`. The valuation topology is represented by the normed Tate field. -/
example (p : ℕ) [Fact p.Prime] (K : Type) [NontriviallyNormedField K]
    [IsUltrametricDist K] [CompleteSpace K] [NormedAlgebra ℚ_[p] K]
    [FiniteDimensional ℚ_[p] K] [IsTateRing K]
    (π : K) (hπ : π ^ p = algebraMap ℚ_[p] K (p : ℚ_[p]))
    (hdim : Module.finrank ℚ_[p] K = p) : ¬ IsPerfectoidTateRing p K := sorry

/-- `ℚ_p⟨T⟩` is sousperfectoid (frame `ℚ_p^cycl⟨T^{1/p^∞}⟩`) but not perfectoid. -/
example (p : ℕ) [Fact p.Prime] :
    IsSousperfectoid p (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) ∧
      ¬ IsPerfectoidTateRing p (restrictedMvPowerSeriesCompletion 1 ℚ_[p]) := sorry

/-- `ℚ_p⟨X⟩[Q]/(Q²)` is strongly noetherian and sheafy but not sousperfectoid (not reduced). -/
example (p : ℕ) [Fact p.Prime] :
    ¬ IsSousperfectoid p (DualNumber (restrictedMvPowerSeriesCompletion 1 ℚ_[p])) := sorry

/-- The zero ring is perfectoid (every condition is vacuous), hence sousperfectoid; this is why
`S ≠ 0` is assumed above. -/
example (p : ℕ) [Fact p.Prime] [IsTopologicalRing PUnit] : IsSousperfectoid p PUnit := sorry

/-- In characteristic `p`, for a uniform complete Tate ring with finite Frobenius, sousperfectoid
means that Frobenius splits `A`-linearly (HK, Lem. 7.10). -/
example (p : ℕ) [Fact p.Prime] (A : Type) [CommRing A] [UniformSpace A] [IsUniformAddGroup A]
    [IsTopologicalRing A] [IsTateRing A] [CompleteSpace A] [T2Space A] [CharP A p] [IsUniform A]
    (hF : (frobenius A p).Finite) :
    IsSousperfectoid p A ↔
      ∃ s : A →+ A, (∀ a x : A, s (a ^ p * x) = a * s x) ∧ ∀ a : A, s (a ^ p) = a := sorry

/-! ### R5.6 Coefficient algebras
(*profinite-flat-module*, *profinite-flat-pseudobasis*, *small-coefficient-algebra*,
*mixed-completed-tensor*, *mixed-completed-tensor-product-formula*,
*mixed-completed-tensor-exactness*) -/

section ProfiniteFlat

variable (O : Type u) [CommRing O] [TopologicalSpace O] (M : Type v) [AddCommGroup M] [Module O M]
  [TopologicalSpace M]

/-- A *profinite flat* `O`-module: a compact totally disconnected topological `O`-module (Tau Ceti
`IsCompactModule`, hence Hausdorff and linearly topologised over a compact `O`) that is flat
(CHJ, Def. 6.1, p. 46). -/
structure IsProfiniteFlat : Prop where
  isCompactModule : IsCompactModule O M
  flat : Module.Flat O M

variable {O} in
/-- Pseudobases: over a DVR with a compact Hausdorff ring topology, `M` is profinite flat iff it is
isomorphic to some `∏_{i ∈ I} O` as a topological module (CHJ, Prop. 6.2, p. 46). -/
theorem IsProfiniteFlat.iff_exists_pseudobasis [IsDomain O] [IsDiscreteValuationRing O]
    [IsTopologicalRing O] [CompactSpace O] [T2Space O] :
    IsProfiniteFlat O M ↔ ∃ I : Type v, Nonempty (M ≃L[O] (I → O)) := sorry

/-- A profinite flat module is `𝔪`-adically complete and separated. -/
theorem IsProfiniteFlat.isAdicComplete [IsDomain O] [IsDiscreteValuationRing O]
    [IsTopologicalRing O] [CompactSpace O] [T2Space O] (h : IsProfiniteFlat O M) :
    IsAdicComplete (IsLocalRing.maximalIdeal O) M := sorry

end ProfiniteFlat

/-- `ℤ_p` with the indiscrete topology is flat and compact but not profinite flat (not
Hausdorff, not of the form `∏_I ℤ_p`). -/
example (p : ℕ) [Fact p.Prime] : ¬ @IsProfiniteFlat ℤ_[p] _ _ ℤ_[p] _ _ ⊤ := sorry

/-- `ℤ_p⟦T₁, …, T_d⟧` with the coefficientwise topology is profinite flat over `ℤ_p`. -/
example (p : ℕ) [Fact p.Prime] (d : ℕ) :
    letI := MvPowerSeries.WithPiTopology.instTopologicalSpace (σ := Fin d) ℤ_[p]
    IsProfiniteFlat ℤ_[p] (MvPowerSeries (Fin d) ℤ_[p]) := sorry

section Small

variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] [Algebra ℤ_[p] R]

/-- A *small* `ℤ_p`-algebra: reduced, `p`-torsion-free and finite over some `ℤ_p⟦X₁, …, X_d⟧`
(CHJ, §1.4, p. 7). -/
class IsSmallZpAlgebra : Prop where
  isReduced : IsReduced R
  isSMulRegular_p : IsSMulRegular R (p : R)
  exists_finite : ∃ (d : ℕ) (φ : MvPowerSeries (Fin d) ℤ_[p] →ₐ[ℤ_[p]] R), φ.toRingHom.Finite

/-- The canonical topology of a small `ℤ_p`-algebra: the adic topology of its Jacobson radical
(an ideal of definition). -/
@[instance_reducible]
def IsSmallZpAlgebra.topology [IsSmallZpAlgebra p R] : TopologicalSpace R :=
  (⊥ : Ideal R).jacobson.adicTopology

/-- Small `ℤ_p`-algebras are noetherian. -/
theorem IsSmallZpAlgebra.isNoetherianRing [IsSmallZpAlgebra p R] : IsNoetherianRing R := sorry

/-- With its canonical topology a small `ℤ_p`-algebra is a profinite flat `ℤ_p`-module, and it is
`p`-adically complete. -/
theorem IsSmallZpAlgebra.isProfiniteFlat [IsSmallZpAlgebra p R] :
    (letI := IsSmallZpAlgebra.topology p R; IsProfiniteFlat ℤ_[p] R) ∧
      IsAdicComplete (Ideal.span {(p : R)}) R := sorry

end Small

/-- `ℤ_p` is small (`d = 0`); `ℚ_p` is not (Nakayama: `pℚ_p = ℚ_p`). -/
example (p : ℕ) [Fact p.Prime] : IsSmallZpAlgebra p ℤ_[p] ∧ ¬ IsSmallZpAlgebra p ℚ_[p] := sorry

/-- `ℤ_p⟦T⟧/(T²)` is `p`-torsion-free and finite over `ℤ_p⟦T⟧` but not reduced, hence not small. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ IsSmallZpAlgebra p
      (PowerSeries ℤ_[p] ⧸ Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p]) ^ 2}) := sorry

section MixedTensor

open TensorProduct

variable (O : Type u) [CommRing O]

/-- `V₀ ⊆ V` is an *open bounded lattice* for `ϖ`: open, bounded (every neighbourhood of `0`
contains some `ϖⁿ V₀`) and `V₀[1/ϖ] = V`. -/
def IsOpenBoundedLattice {V : Type*} [AddCommGroup V] [Module O V] [TopologicalSpace V] (ϖ : O)
    (V₀ : Submodule O V) : Prop :=
  IsOpen (V₀ : Set V) ∧ (∀ U ∈ nhds (0 : V), ∃ n : ℕ, ∀ v ∈ V₀, ϖ ^ n • v ∈ U) ∧
    ∀ v : V, ∃ n : ℕ, ϖ ^ n • v ∈ V₀

/-- The integral mixed completed tensor product `X ⊗̂ M := lim_N X ⊗_O M/N` over the open
submodules `N` of `M`, as the compatible families (CHJ, Def. 6.3, p. 46). -/
def mixedTensorInt (X : Type*) [AddCommGroup X] [Module O X] (M : Type*) [AddCommGroup M]
    [Module O M] [TopologicalSpace M] :
    Submodule O ((N : {N : Submodule O M // IsOpen (N : Set M)}) → X ⊗[O] (M ⧸ N.1)) where
  carrier := {f | ∀ (N N' : {N : Submodule O M // IsOpen (N : Set M)}) (h : N'.1 ≤ N.1),
    (Submodule.factor h).lTensor X (f N') = f N}
  add_mem' {f g} hf hg N N' h := by
    simp only [Pi.add_apply, map_add, hf N N' h, hg N N' h]
  zero_mem' N N' h := by simp
  smul_mem' c f hf N N' h := by
    simp only [Pi.smul_apply, map_smul, hf N N' h]

/-- The rational mixed completed tensor product `V ⊗̂ M := (V₀ ⊗̂ M)[1/ϖ]` for a lattice
`V₀ ⊆ V` (CHJ, Def. 6.6, p. 47). -/
abbrev mixedTensorOfLattice (ϖ : O) {V : Type*} [AddCommGroup V] [Module O V] (V₀ : Submodule O V)
    (M : Type*) [AddCommGroup M] [Module O M] [TopologicalSpace M] :=
  LocalizedModule (Submonoid.powers ϖ) (mixedTensorInt O V₀ M)

variable {O}
variable {M : Type*} [AddCommGroup M] [Module O M] [TopologicalSpace M]

/-- The pure tensor `x ⊗ m`, with component `x ⊗ (m mod N)` at every open `N`. -/
def mixedTensorInt.tmul {X : Type*} [AddCommGroup X] [Module O X] (x : X) (m : M) :
    mixedTensorInt O X M :=
  ⟨fun N ↦ x ⊗ₜ[O] (Submodule.mkQ N.1 m), by
    intro N N' h
    simp⟩

/-- The map `X ⊗̂ M → Y ⊗̂ M` induced by `f : X → Y`, acting by `f ⊗ id` on every component. -/
def mixedTensorInt.map {X Y : Type*} [AddCommGroup X] [Module O X] [AddCommGroup Y] [Module O Y]
    (f : X →ₗ[O] Y) : mixedTensorInt O X M →ₗ[O] mixedTensorInt O Y M where
  toFun z := ⟨fun N ↦ f.rTensor (M ⧸ N.1) (z.1 N), by
    intro N N' h
    change (Submodule.factor h).lTensor Y (f.rTensor _ (z.1 N')) = f.rTensor _ (z.1 N)
    rw [← z.2 N N' h, ← LinearMap.comp_apply, ← LinearMap.comp_apply,
      LinearMap.lTensor_comp_rTensor, LinearMap.rTensor_comp_lTensor]⟩
  map_add' z t := by ext N; simp
  map_smul' c z := by ext N; simp

section MixedTensorChecks

variable {X Y Z : Type*} [AddCommGroup X] [Module O X] [AddCommGroup Y] [Module O Y]
  [AddCommGroup Z] [Module O Z]

/-- A pure tensor has the prescribed component at every open quotient. -/
example (x : X) (m : M) (N : {N : Submodule O M // IsOpen (N : Set M)}) :
    (mixedTensorInt.tmul (O := O) x m).1 N = x ⊗ₜ[O] Submodule.mkQ N.1 m := rfl

/-- Zero in either factor gives the zero compatible family. -/
example (x : X) (m : M) :
    mixedTensorInt.tmul (O := O) (0 : X) m = 0 ∧ mixedTensorInt.tmul (O := O) x (0 : M) = 0 := by
  constructor <;> ext N <;> simp [mixedTensorInt.tmul]

/-- Pure tensors are additive in both variables. -/
example (x y : X) (m n : M) :
    mixedTensorInt.tmul (O := O) (x + y) m = mixedTensorInt.tmul (O := O) x m + mixedTensorInt.tmul (O := O) y m ∧
      mixedTensorInt.tmul (O := O) x (m + n) = mixedTensorInt.tmul (O := O) x m + mixedTensorInt.tmul (O := O) x n := by
  constructor <;> ext N <;> simp [mixedTensorInt.tmul, TensorProduct.add_tmul,
    TensorProduct.tmul_add]

/-- Scalar balancing holds on every quotient component. -/
example (a : O) (x : X) (m : M) :
    mixedTensorInt.tmul (O := O) (a • x) m = mixedTensorInt.tmul (O := O) x (a • m) := by
  ext N
  simp [mixedTensorInt.tmul, TensorProduct.smul_tmul, TensorProduct.tmul_smul]

/-- Functoriality acts by the given map on the first tensor factor. -/
example (f : X →ₗ[O] Y) (x : X) (m : M) :
    mixedTensorInt.map f (mixedTensorInt.tmul (O := O) x m) = mixedTensorInt.tmul (O := O) (f x) m := by
  ext N
  simp [mixedTensorInt.map, mixedTensorInt.tmul]

/-- The zero and identity linear maps act as zero and identity. -/
example : mixedTensorInt.map (M := M) (0 : X →ₗ[O] Y) = 0 ∧
    mixedTensorInt.map (M := M) (LinearMap.id : X →ₗ[O] X) = LinearMap.id := by
  constructor <;> ext z N <;> simp [mixedTensorInt.map]

/-- Componentwise maps are additive and commute with composition on arbitrary families. -/
example (f g : X →ₗ[O] Y) (h : Y →ₗ[O] Z) :
    mixedTensorInt.map (M := M) (f + g) = mixedTensorInt.map f + mixedTensorInt.map g ∧
      mixedTensorInt.map (M := M) (h.comp f) = (mixedTensorInt.map h).comp (mixedTensorInt.map f) :=
  sorry

/-- Each component of functoriality is the algebraic tensor map, including outside the pure
 tensor image. -/
example (f : X →ₗ[O] Y) (z : mixedTensorInt O X M)
    (N : {N : Submodule O M // IsOpen (N : Set M)}) :
    (mixedTensorInt.map f z).1 N = f.rTensor (M ⧸ N.1) (z.1 N) := rfl

end MixedTensorChecks

/-- The product formula: for a pseudobasis `e : M ≃ ∏_I O` over a compact Hausdorff DVR, the
mixed tensor `X ⊗̂ M` is `∏_I X̂` (`X̂` the `𝔪`-adic completion), with `x ⊗ m ↦ (e(m)ᵢ x)ᵢ`
(CHJ, Prop. 6.4, p. 46). -/
theorem mixedTensorInt.nonempty_piEquiv [IsDomain O] [IsDiscreteValuationRing O]
    [TopologicalSpace O] [IsTopologicalRing O] [CompactSpace O] [T2Space O] (X : Type*)
    [AddCommGroup X] [Module O X] {I : Type*} (e : M ≃L[O] (I → O)) :
    ∃ E : mixedTensorInt O X M ≃ₗ[O] (I → AdicCompletion (IsLocalRing.maximalIdeal O) X),
      ∀ (x : X) (m : M) (i : I),
        E (mixedTensorInt.tmul x m) i = AdicCompletion.of _ X (e m i • x) := sorry

/-- Exactness: for profinite flat `M`, `− ⊗̂ M` is exact on short exact sequences of
`𝔪`-adically complete modules (CHJ, Cor. 6.5(1), p. 47). -/
theorem mixedTensorInt.exact_of_isAdicComplete [IsDomain O] [IsDiscreteValuationRing O]
    [TopologicalSpace O] [IsTopologicalRing O] [CompactSpace O] [T2Space O]
    (hM : IsProfiniteFlat O M) {X Y Z : Type*} [AddCommGroup X] [Module O X] [AddCommGroup Y]
    [Module O Y] [AddCommGroup Z] [Module O Z]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) X]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) Y]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) Z]
    (f : X →ₗ[O] Y) (g : Y →ₗ[O] Z) (hf : Function.Injective f) (hfg : Function.Exact f g)
    (hg : Function.Surjective g) :
    Function.Injective (mixedTensorInt.map (M := M) f) ∧
      Function.Exact (mixedTensorInt.map (M := M) f) (mixedTensorInt.map (M := M) g) ∧
        Function.Surjective (mixedTensorInt.map (M := M) g) := sorry

/-- Lattice independence: two open bounded lattices of a space on which `ϖ` acts bijectively give
isomorphic `V ⊗̂ M`, compatibly with pure tensors (CHJ, Cor. 6.5(2) and after Def. 6.6, p. 47). -/
theorem mixedTensorOfLattice.nonempty_equiv [IsDomain O] [IsDiscreteValuationRing O]
    [TopologicalSpace O] [IsTopologicalRing O] [CompactSpace O] [T2Space O]
    (hM : IsProfiniteFlat O M) {ϖ : O} (hϖ : Irreducible ϖ) {V : Type*} [AddCommGroup V]
    [Module O V] [TopologicalSpace V] (hV : Function.Bijective fun v : V ↦ ϖ • v)
    (V₀ V₁ : Submodule O V) (h₀ : IsOpenBoundedLattice O ϖ V₀)
    (h₁ : IsOpenBoundedLattice O ϖ V₁) (hc : IsAdicComplete (Ideal.span {ϖ}) V₀) (hle : V₀ ≤ V₁) :
    ∃ E : mixedTensorOfLattice O ϖ V₀ M ≃ₗ[O] mixedTensorOfLattice O ϖ V₁ M,
      ∀ (x : V₀) (m : M), E (LocalizedModule.mk (mixedTensorInt.tmul x m) 1) =
        LocalizedModule.mk (mixedTensorInt.tmul (Submodule.inclusion hle x) m) 1 := sorry

end MixedTensor

/-- The array core of the counterexample to CHJ Lemma 6.19(2): for `R = ℤ_p⟦T⟧` the restriction
from `{|x/p| ≥ 1}` to `{|x/p| = 1}` has image in the bounded arrays with
`‖w (n, k)‖ ≤ C ‖p‖ᵏ = C p⁻ᵏ` (positive Laurent coefficients), and the diagonal array of
`∑ (x/p)ⁿ Tⁿ` has distance `1` from all of them, so restriction is not dense for the supremum
norm. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ z : lp (fun _ : ℕ × ℕ ↦ ℚ_[p]) ⊤,
      (∀ n k, z (n, k) = if n = k then 1 else 0) ∧ ‖z‖ = 1 ∧
      (∀ w : lp (fun _ : ℕ × ℕ ↦ ℚ_[p]) ⊤,
        (∃ C : ℝ, ∀ n k, ‖w (n, k)‖ ≤ C * ‖(p : ℚ_[p])‖ ^ k) → 1 ≤ ‖z - w‖) := sorry

/-- The core of the counterexample to CHJ Lemma 6.21: in a complete algebraically closed
extension `C` of `ℚ_p` there is a bounded sequence of units whose residues are `𝔽_p`-linearly
independent; it is not totally bounded, so `∑ zᵢ Tⁱ` lies in `𝒪_C⟦T⟧[1/p]` but not in the
completed tensor product `ℤ_p⟦T⟧[1/p] ⊗̂ C`. -/
example (p : ℕ) [Fact p.Prime] (C : Type) [NontriviallyNormedField C] [IsUltrametricDist C]
    [CompleteSpace C] [NormedAlgebra ℚ_[p] C] [IsAlgClosed C] :
    ∃ z : lp (fun _ : ℕ ↦ C) ⊤, (∀ i, ‖z i‖ = 1) ∧
      (∀ (s : Finset ℕ) (a : ℕ → ℕ), (∀ i ∈ s, a i < p) → (∃ i ∈ s, a i ≠ 0) →
        ‖∑ i ∈ s, (a i : C) * z i‖ = 1) ∧
      ¬ TotallyBounded (Set.range fun i : ℕ ↦ z i) := sorry

end Huber

/-! ### R5.4, R5.5, R5.8 Sousperfectoid spaces, products and tilde-limits
(*sousperfectoid-adic-space*, *sousperfectoid-etale-stability*, *sousperfectoid-etale-base-change*,
*perfectoid-times-smooth-fibre-product*, *tilde-limits-affinoid-criterion*,
*tilde-limit-base-change*) -/

namespace AdicSpace

open CategoryTheory CategoryTheory.Limits TopologicalSpace TauCeti.Huber
open TauCetiRoadmap.AdicSpacesPartII.AdicSpace (Affinoid Chart IsAdic IsAnalytic
  LocallyOfWeaklyFiniteType Smooth)
open TauCetiRoadmap.AdicEtaleGeometry.AdicSpace (FibreProduct IsEtaleLocalDescription
  IsLocallyNoetherianAnalytic)
open TauCetiRoadmap.PerfectoidSpaces.Perfectoid (IsPerfectoidTateRing)

/-- `X` is *sousperfectoid* if every point has an affinoid chart with sousperfectoid coordinate
ring (BHW, Def. 3.2(3), p. 1724). -/
def IsSousperfectoid (p : ℕ) (X : TauCeti.AdicSpace) : Prop :=
  ∀ x : X.obj, ∃ c : Chart X, Huber.IsSousperfectoid p c.affinoid.ring ∧ x ∈ Set.range c.ι.hom.base

/-- `Spa(R, R⁺)` is sousperfectoid for `R` sousperfectoid. -/
theorem IsSousperfectoid.spa (p : ℕ) (A : Affinoid) [Huber.IsSousperfectoid p A.ring] :
    IsSousperfectoid p A.spa := sorry

/-- Sousperfectoid spaces are analytic. -/
theorem IsSousperfectoid.isAnalytic {p : ℕ} {X : TauCeti.AdicSpace} (hX : IsSousperfectoid p X) :
    IsAnalytic X :=
  fun x ↦ (hX x).elim fun c hc ↦ ⟨c, hc.2, hc.1.isTateRing⟩

/-- Spaces étale over a sousperfectoid space are sousperfectoid (Berkeley, §19.5, p. 179; KL15,
Def. 8.2.16, p. 162). -/
theorem IsSousperfectoid.of_etale {p : ℕ} {X Y : TauCeti.AdicSpace} (f : Y ⟶ X)
    (hX : IsSousperfectoid p X) (hf : IsEtaleLocalDescription f) : IsSousperfectoid p Y := sorry

/-- Base change of an étale map to a locally noetherian analytic space along a map from a
sousperfectoid space exists, is étale and sousperfectoid (BHW, proof of Cor. 3.4, p. 1725). -/
theorem IsSousperfectoid.exists_fibreProduct_etale {p : ℕ} {X Y Z : TauCeti.AdicSpace}
    (f : Y ⟶ X) (g : Z ⟶ X) (hX : IsLocallyNoetherianAnalytic X) (hf : IsEtaleLocalDescription f)
    (hZ : IsSousperfectoid p Z) :
    ∃ P : FibreProduct f g, IsSousperfectoid p P.space ∧ IsEtaleLocalDescription P.snd := sorry

/-- A nonzero nilpotent section excludes sousperfectoidness: sections are reduced. -/
example (p : ℕ) (X : TauCeti.AdicSpace) (U : Opens X.obj)
    (a : X.obj.toRingPresheafedSpace.presheaf.obj (Opposite.op U)) (ha : IsNilpotent a)
    (hne : a ≠ 0) : ¬ IsSousperfectoid p X := sorry

/-- The empty adic space is sousperfectoid. -/
example (p : ℕ) (X : TauCeti.AdicSpace) [IsEmpty X.obj] : IsSousperfectoid p X :=
  fun x ↦ isEmptyElim x

/-- BHW's product: for perfectoid fields `L → L'` (as affinoids `Spa(L, O_L)`, `Spa(L', O_{L'})`),
a perfectoid space `X` over `L` and a smooth `Y` over `L'`, the fibre product `X ×_L Y` exists and
is sousperfectoid; it is not perfectoid in general (BHW, Cor. 3.4, pp. 1724–1725). -/
theorem perfectoidTimesSmooth_exists (p : ℕ) [Fact p.Prime] (L L' : Affinoid)
    (hL : IsField L.ring) (hL' : IsField L'.ring) [IsTateRing L.ring] [IsTateRing L'.ring]
    [IsPerfectoidTateRing p L.ring] [IsPerfectoidTateRing p L'.ring]
    (hLplus : L.pair.plus = powerBoundedSubring L.ring)
    (hLplus' : L'.pair.plus = powerBoundedSubring L'.ring) (σ : L'.spa ⟶ L.spa)
    (X Y : TauCeti.AdicSpace) (f : X ⟶ L.spa) (g : Y ⟶ L'.spa)
    (hX : ∀ x : X.obj, ∃ (c : Chart X) (_ : IsTateRing c.affinoid.ring),
      IsPerfectoidTateRing p c.affinoid.ring ∧ x ∈ Set.range c.ι.hom.base)
    (hg : Smooth g) :
    ∃ P : FibreProduct f (g ≫ σ), IsSousperfectoid p P.space := sorry

/-- Huber's *tilde-limit* `X ∼ lim Xᵢ` for a cone `c` over `F`: the point map to the compatible
families is a homeomorphism, and every point has an affinoid chart in which the images of the
coordinate rings of charts of the `Xᵢ` through which it factors are dense (Huber96, Def. 2.4.2,
p. 125). -/
def IsTildeLimit {I : Type} [SmallCategory I] (F : I ⥤ TauCeti.AdicSpace) (c : Cone F) : Prop :=
  (∃ e : c.pt.obj ≃ₜ {v : ∀ i, (F.obj i).obj //
      ∀ (i j : I) (f : i ⟶ j), (F.map f).hom.base (v i) = v j},
    ∀ x i, (e x).1 i = (c.π.app i).hom.base x) ∧
  ∀ x : c.pt.obj, ∃ d : Chart c.pt, x ∈ Set.range d.ι.hom.base ∧
    Dense {a : d.affinoid.ring | ∃ (i : I) (e : Chart (F.obj i))
      (g : d.affinoid.spa ⟶ e.affinoid.spa) (φ : Pair.Hom e.affinoid.pair d.affinoid.pair),
      Affinoid.IsInducedBy g φ ∧ d.ι ≫ c.π.app i = g ≫ e.ι ∧ a ∈ Set.range φ.toRingHom}

/-- The affinoid criterion: a cone of affinoids with induced coordinate maps whose images have
dense union, and with the point-space homeomorphism, is a tilde-limit (Scholze–Weinstein 2013,
Prop. 2.4.2; Huber96, Def. 2.4.2). -/
theorem IsTildeLimit.affinoid {I : Type} [SmallCategory I] [IsCofiltered I]
    (F : I ⥤ TauCeti.AdicSpace) (c : Cone F) (A : Affinoid) (eA : c.pt ≅ A.spa)
    (B : I → Affinoid) (eB : ∀ i, F.obj i ≅ (B i).spa) (g : ∀ i, A.spa ⟶ (B i).spa)
    (φ : ∀ i, Pair.Hom (B i).pair A.pair) (hg : ∀ i, Affinoid.IsInducedBy (g i) (φ i))
    (hc : ∀ i, eA.hom ≫ g i = c.π.app i ≫ (eB i).hom)
    (he : ∃ e : c.pt.obj ≃ₜ {v : ∀ i, (F.obj i).obj //
      ∀ (i j : I) (f : i ⟶ j), (F.map f).hom.base (v i) = v j},
      ∀ x i, (e x).1 i = (c.π.app i).hom.base x)
    (hd : Dense (⋃ i, Set.range (φ i).toRingHom)) : IsTildeLimit F c := sorry

/-- Tilde-limits of quasi-compact quasi-separated spaces with adic transition maps are stable
under base change along an adic morphism locally of weakly finite type, given the pullback
squares (Huber96, Rem. 2.4.3(ii), p. 126). -/
theorem IsTildeLimit.baseChange {I : Type} [SmallCategory I] [IsCofiltered I]
    (F D : I ⥤ TauCeti.AdicSpace) (c : Cone F) (d : Cone D) (j : I) (hj : IsTerminal j)
    (Y : TauCeti.AdicSpace) (f : Y ⟶ F.obj j) (p : D ⟶ F) (q : D ⟶ (Functor.const I).obj Y)
    (a : d.pt ⟶ c.pt) (b : d.pt ⟶ Y) (hc : IsTildeLimit F c)
    [CompactSpace c.pt.obj] [QuasiSeparatedSpace c.pt.obj]
    [CompactSpace Y.obj] [QuasiSeparatedSpace Y.obj]
    (hF : ∀ i, CompactSpace (F.obj i).obj ∧ QuasiSeparatedSpace (F.obj i).obj)
    (htrans : ∀ (i k : I) (g : i ⟶ k), IsAdic (F.map g)) (hcone : ∀ i, IsAdic (c.π.app i))
    (hf : LocallyOfWeaklyFiniteType f)
    (hs : ∀ i, IsPullback (p.app i) (q.app i) (F.map (hj.from i)) f)
    (ht : IsPullback a b (c.π.app j) f) (ha : ∀ i, d.π.app i ≫ p.app i = a ≫ c.π.app i)
    (hb : ∀ i, d.π.app i ≫ q.app i = b) : IsTildeLimit D d := sorry

/-- The constant diagram is the tilde-limit of itself. -/
example (I : Type) [SmallCategory I] [IsCofiltered I] (X : TauCeti.AdicSpace) :
    IsTildeLimit ((Functor.const I).obj X) { pt := X, π := 𝟙 _ } := sorry

/-- A cone whose projection identifies distinct points is not a tilde-limit of the constant
diagram. -/
example (I : Type) [SmallCategory I] [IsCofiltered I] (X : TauCeti.AdicSpace)
    (c : Cone ((Functor.const I).obj X)) (i : I) (hi : ¬ Function.Injective (c.π.app i).hom.base) :
    ¬ IsTildeLimit ((Functor.const I).obj X) c := sorry

end AdicSpace

/-! ## Layer F1: dagger algebras and overconvergent differentials -/

namespace Dagger

open Filter Topology

/-! ### F1.1 Overconvergent power series
(*radius-tate-algebra-affinoid*, *overconvergent-tate-algebra*,
*overconvergent-tate-algebra-properties*, *overconvergent-faithful-flatness*) -/

section Radius

variable (n : ℕ) (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]

/-- The constant-polyradius carrier of RigidAnalyticGeometry §1.5 item 1 at
`af8261a42a548ed86a11fff72c486673ef122ae7` (README supplier table).
The `K`-subalgebra of restricted series at the constant polyradius `ρ`, used to define `W_n`.
The coefficient construction does not require completeness of `K`. -/
def radiusTate (ρ : ℝ) : Subalgebra K (MvPowerSeries (Fin n) K) :=
  { MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ ρ) with
    algebraMap_mem' := fun c ↦ by
      change MvPowerSeries.IsRestricted _ _
      rw [MvPowerSeries.algebraMap_apply, Algebra.algebraMap_self, RingHom.id_apply]
      exact MvPowerSeries.isRestricted_C _ c }

/-- The constant-polyradius carrier of RigidAnalyticGeometry §1.5 item 1 at
`af8261a42a548ed86a11fff72c486673ef122ae7` (README supplier table).
The Gauss-norm function at the constant polyradius `ρ`, used at radius `1` in the unit criterion
for `W_n`; its norm interpretation applies only to series restricted at `ρ > 0`. -/
def radiusGaussNorm (ρ : ℝ) (f : MvPowerSeries (Fin n) K) : ℝ :=
  MvPowerSeries.gaussNorm (fun a : K ↦ ‖a‖) (fun _ : Fin n ↦ ρ) f

end Radius

section Washnitzer

variable (n : ℕ) (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K]

/-- The Monsky–Washnitzer algebra `W_n = K⟨X₁, …, Xₙ⟩† = ⋃_{ρ > 1} T_n(ρ)` of overconvergent
power series (GK00, §1, 1.2, p. 3). -/
def washnitzerAlgebra : Subalgebra K (MvPowerSeries (Fin n) K) :=
  ⨆ ρ : {ρ : ℝ // 1 < ρ}, radiusTate n K ρ

/-- The variable `Xᵢ ∈ W_n`. -/
def washnitzerAlgebra.X (i : Fin n) : washnitzerAlgebra n K :=
  ⟨MvPowerSeries.X i, le_iSup (fun ρ : {ρ : ℝ // 1 < ρ} ↦ radiusTate n K ρ)
    ⟨2, by norm_num⟩ (MvPowerSeries.isRestricted_monomial _ _ _)⟩

variable {n K}

/-- `f ∈ W_n` iff `|a_ν| ≤ C ρ^{-|ν|}` for some `ρ > 1` and `C`. -/
theorem mem_washnitzerAlgebra_iff {f : MvPowerSeries (Fin n) K} :
    f ∈ washnitzerAlgebra n K ↔ ∃ ρ > (1 : ℝ), ∃ C : ℝ, ∀ ν : Fin n →₀ ℕ,
      ‖MvPowerSeries.coeff ν f‖ ≤ C * (ρ ^ Finsupp.degree ν)⁻¹ := sorry

/-- An element of `W_n` is a unit iff `|f − f(0)| < |f(0)|` for the Gauss norm. -/
theorem isUnit_washnitzerAlgebra_iff (f : washnitzerAlgebra n K) :
    IsUnit f ↔ radiusGaussNorm n K 1 ((f : MvPowerSeries (Fin n) K) -
        MvPowerSeries.C (MvPowerSeries.constantCoeff (f : MvPowerSeries (Fin n) K))) <
      ‖MvPowerSeries.constantCoeff (f : MvPowerSeries (Fin n) K)‖ := sorry

/-- `W_n` lies in the restricted series at trivial weights, whose completion is Tau Ceti's Tate
algebra `K⟨X₁, …, Xₙ⟩`. -/
theorem washnitzerAlgebra_le_weightedRestrictedSubring [NonarchimedeanRing K] :
    (washnitzerAlgebra n K).toSubring ≤
      Huber.weightedRestrictedSubring (fun _ : Fin n ↦ ({1} : Set K))
        Huber.isWeightFamily_one_weight := sorry

variable (n K) in
/-- The inclusion `W_n → T_n` into Tau Ceti's Tate algebra. -/
def washnitzerAlgebra.toTate [NonarchimedeanRing K] :
    washnitzerAlgebra n K →+* Huber.restrictedMvPowerSeriesCompletion n K :=
  UniformSpace.Completion.coeRingHom.comp
    (Subring.inclusion (washnitzerAlgebra_le_weightedRestrictedSubring (n := n) (K := K)))

variable [CompleteSpace K]

/-- `W_n` is noetherian, factorial and Jacobson, with finite residue fields over `K` (GK00, §1,
1.4). -/
theorem washnitzerAlgebra.isNoetherianRing :
    IsNoetherianRing (washnitzerAlgebra n K) ∧ UniqueFactorizationMonoid (washnitzerAlgebra n K) ∧
      IsJacobsonRing (washnitzerAlgebra n K) := sorry

/-- `W_n` is regular of Krull dimension `n` (GK00, §1, Prop. 1.5). -/
theorem washnitzerAlgebra.isRegularRing :
    IsRegularRing (washnitzerAlgebra n K) ∧ ringKrullDim (washnitzerAlgebra n K) = n := sorry

/-- `W_n → T_n` is faithfully flat (GK00, §1, Prop. 1.5). -/
theorem washnitzerAlgebra.faithfullyFlat [NonarchimedeanRing K] :
    letI := (washnitzerAlgebra.toTate n K).toAlgebra
    Module.FaithfullyFlat (washnitzerAlgebra n K) (Huber.restrictedMvPowerSeriesCompletion n K) :=
  sorry

/-- Contraction `m ↦ m ∩ W_n` is a bijection from maximal ideals of `T_n` to those of `W_n`
(GK00, §1, Prop. 1.5). -/
theorem washnitzerAlgebra.existsUnique_isMaximal_comap [NonarchimedeanRing K]
    (m' : Ideal (washnitzerAlgebra n K)) (hm' : m'.IsMaximal) :
    ∃! m : Ideal (Huber.restrictedMvPowerSeriesCompletion n K),
      m.IsMaximal ∧ m.comap (washnitzerAlgebra.toTate n K) = m' := sorry

end Washnitzer

/-- `∑ pᵐ Xᵐ ∈ W_1`, while the lacunary `∑ pᵐ X^{pᵐ}` is restricted at radius `1` only. -/
example (p : ℕ) [Fact p.Prime] :
    (fun ν : Fin 1 →₀ ℕ ↦ (p : ℚ_[p]) ^ ν 0 : MvPowerSeries (Fin 1) ℚ_[p]) ∈
        washnitzerAlgebra 1 ℚ_[p] ∧
      (fun ν : Fin 1 →₀ ℕ ↦ if p ^ Nat.log p (ν 0) = ν 0 then (p : ℚ_[p]) ^ Nat.log p (ν 0)
        else 0 : MvPowerSeries (Fin 1) ℚ_[p]) ∈ radiusTate 1 ℚ_[p] 1 ∧
      (fun ν : Fin 1 →₀ ℕ ↦ if p ^ Nat.log p (ν 0) = ν 0 then (p : ℚ_[p]) ^ Nat.log p (ν 0)
        else 0 : MvPowerSeries (Fin 1) ℚ_[p]) ∉ washnitzerAlgebra 1 ℚ_[p] := sorry

/-- Radii in `|K^×|` do not suffice: `∑ pᵐ X^{2m} ∈ W_1` lies in no `T_1(pᵏ)`, `k ≥ 1`. -/
example (p : ℕ) [Fact p.Prime] :
    let h : MvPowerSeries (Fin 1) ℚ_[p] := fun ν ↦
      if Even (ν 0) then (p : ℚ_[p]) ^ (ν 0 / 2) else 0
    h ∈ washnitzerAlgebra 1 ℚ_[p] ∧ ∀ k : ℕ, 1 ≤ k → h ∉ radiusTate 1 ℚ_[p] ((p : ℝ) ^ k) := sorry

/-- The unit criterion: `1 + pX` is a unit of `W_1` over `ℚ_p`, `p + X` is not. -/
example (p : ℕ) [Fact p.Prime] :
    IsUnit (1 + (p : washnitzerAlgebra 1 ℚ_[p]) * washnitzerAlgebra.X 1 ℚ_[p] 0) ∧
      ¬ IsUnit ((p : washnitzerAlgebra 1 ℚ_[p]) + washnitzerAlgebra.X 1 ℚ_[p] 0) := sorry

/-! ### F1.2 Dagger algebras
(*dagger-algebra*, *dagger-noether-normalisation*, *dagger-completion-comparison*,
*dagger-weak-completeness*, *dagger-finite-extension*) -/

section DaggerAlgebra

/-- A `K`-*dagger algebra*: a `K`-algebra admitting a surjection `W_n ↠ A` (GK00, §1, 1.2). -/
class IsDaggerAlgebra (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] (A : Type*)
    [CommRing A] [Algebra K A] : Prop where
  exists_surjective : ∃ (n : ℕ) (φ : washnitzerAlgebra n K →ₐ[K] A), Function.Surjective φ

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
  {A : Type*} [CommRing A] [Algebra K A]

instance IsDaggerAlgebra.washnitzerAlgebra (n : ℕ) :
    IsDaggerAlgebra K (Dagger.washnitzerAlgebra n K) :=
  ⟨⟨n, AlgHom.id K _, Function.surjective_id⟩⟩

instance IsDaggerAlgebra.quotient [IsDaggerAlgebra K A] (J : Ideal A) :
    IsDaggerAlgebra K (A ⧸ J) := by
  obtain ⟨n, φ, hφ⟩ := IsDaggerAlgebra.exists_surjective (K := K) (A := A)
  exact ⟨⟨n, (Ideal.Quotient.mkₐ K J).comp φ, (Ideal.Quotient.mkₐ_surjective K J).comp hφ⟩⟩

variable (K A) [IsDaggerAlgebra K A]

/-- The least number of variables of a presentation `W_n ↠ A`. -/
def presentationDim : ℕ := by
  classical
  exact Nat.find (IsDaggerAlgebra.exists_surjective (K := K) (A := A))

/-- A chosen presentation `W_n ↠ A` with `n = presentationDim K A`. -/
def presentation : washnitzerAlgebra (presentationDim K A) K →ₐ[K] A := by
  classical
  exact (Nat.find_spec (IsDaggerAlgebra.exists_surjective (K := K) (A := A))).choose

theorem presentation_surjective : Function.Surjective (presentation K A) := by
  classical
  exact (Nat.find_spec (IsDaggerAlgebra.exists_surjective (K := K) (A := A))).choose_spec

variable [NonarchimedeanRing K]

/-- The completion `Â = T_n / I T_n` of `A = W_n / I`, a `K`-affinoid algebra independent of the
presentation up to unique isomorphism under `A` (GK00, §1, 1.2 and Thm 1.7). -/
abbrev completion : Type _ :=
  Huber.restrictedMvPowerSeriesCompletion (presentationDim K A) K ⧸
    Ideal.map (washnitzerAlgebra.toTate (presentationDim K A) K) (RingHom.ker (presentation K A))

/-- The completion map `τ : A → Â`. -/
def toCompletion : A →+* completion K A :=
  (Ideal.quotientMap _ (washnitzerAlgebra.toTate (presentationDim K A) K) Ideal.le_comap_map).comp
    ((Ideal.quotientKerAlgEquivOfSurjective (presentation_surjective K A)).symm : A →+* _)

/-- The integral subring `A^int = τ⁻¹(Â°)`: the elements of supremum norm `≤ 1`. -/
def intSubring : Subring A :=
  (Huber.powerBoundedSubring (completion K A)).comap (toCompletion K A)

variable {K A} [CompleteSpace K]

/-- Dagger algebras are noetherian and Jacobson, with residue fields finite over `K` (GK00, §1,
1.4). -/
theorem IsDaggerAlgebra.isNoetherianRing :
    IsNoetherianRing A ∧ IsJacobsonRing A ∧
      ∀ m : Ideal A, m.IsMaximal → Module.Finite K (A ⧸ m) := sorry

/-- Noether normalisation: a nonzero dagger algebra is finite over an injectively embedded `W_d`
(GK00, §1, 1.4(2)). -/
theorem exists_finite_injective_washnitzer [Nontrivial A] :
    ∃ (d : ℕ) (φ : washnitzerAlgebra d K →ₐ[K] A), Function.Injective φ ∧ φ.toRingHom.Finite :=
  sorry

/-- `Â` is `K`-affinoid and `τ : A → Â` is faithfully flat (GK00, §1, Thm 1.7(1)). -/
theorem completion_isAffinoid :
    Huber.IsStrictlyTopologicallyFiniteType (algebraMap K (completion K A)) ∧
      (letI := (toCompletion K A).toAlgebra; Module.FaithfullyFlat A (completion K A)) := sorry

/-- In characteristic zero, the completion of a reduced dagger algebra is reduced
(GK00, §1, Thm 1.7(3), using the excellence supplied by `dagger-algebra-excellent`). -/
theorem completion_isReduced [CharZero K] [IsReduced A] : IsReduced (completion K A) := sorry

/-- A reduced affinoid completion is uniform: its power-bounded subring is bounded. This is
the boundedness input for `fringe-plus-compactification` (Vezzani, Appendix A, proof of
Prop. A.14); reducedness of the completion is an explicit hypothesis in every characteristic. -/
theorem completion_isUniform [IsReduced (completion K A)] :
    Huber.IsUniform (completion K A) := sorry

/-- `a ∈ A` is a unit iff `τ a` is a unit of `Â` (GK00, §1, Thm 1.7(1): `τ` is faithfully flat,
which reflects units). -/
theorem isUnit_iff_isUnit_completion (a : A) : IsUnit a ↔ IsUnit (toCompletion K A a) := sorry

/-- Finite algebras over dagger algebras are dagger algebras (GK00, §1, Lem. 1.10). The
construction adjoins one generator at a time and rescales each generator by a scalar so that its
monic equation has power-bounded coefficients at a fringe stage; the controls below show why both
steps are needed. -/
theorem IsDaggerAlgebra.of_finite {B : Type*} [CommRing B] [Algebra K B] [Algebra A B]
    [IsScalarTower K A B] [Module.Finite A B] : IsDaggerAlgebra K B := sorry

/-- The completion of `W_n` is `T_n`, compatibly with `W_n → T_n`. -/
theorem completion_washnitzerAlgebra (n : ℕ) :
    ∃ e : completion K (washnitzerAlgebra n K) ≃+* Huber.restrictedMvPowerSeriesCompletion n K,
      ∀ f, e (toCompletion K (washnitzerAlgebra n K) f) = washnitzerAlgebra.toTate n K f := sorry

end DaggerAlgebra

/-- `K⟨X, X⁻¹⟩† = W_2/(X₁X₂ − 1)` is a dagger algebra in which `X − a` is a unit for `|a| < 1`. -/
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K] :
    IsDaggerAlgebra K (washnitzerAlgebra 2 K ⧸ Ideal.span
        {washnitzerAlgebra.X 2 K 0 * washnitzerAlgebra.X 2 K 1 - 1}) ∧
      ∀ a : K, ‖a‖ < 1 →
        IsUnit (Ideal.Quotient.mk (Ideal.span
          {washnitzerAlgebra.X 2 K 0 * washnitzerAlgebra.X 2 K 1 - 1})
          (washnitzerAlgebra.X 2 K 0 - algebraMap K _ a)) := sorry

/-- `K[X]` is not a dagger algebra (`|X|_sup = ∞`). -/
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K] :
    ¬ IsDaggerAlgebra K (Polynomial K) := sorry

/-- `[Nontrivial A]` is needed in Noether normalisation: no map `W_d → 0` is injective. -/
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] (d : ℕ)
    (φ : washnitzerAlgebra d K →ₐ[K]
      (washnitzerAlgebra 0 K ⧸ (⊤ : Ideal (washnitzerAlgebra 0 K)))) :
    ¬ Function.Injective φ := sorry

/-- The generator must be rescaled in `IsDaggerAlgebra.of_finite`: for `0 < ‖π‖ < 1`,
`K[X]/(X − π⁻¹) ≅ K`, but `X − π⁻¹ = −π⁻¹(1 − πX)` is a unit of `W₁` (the inverse `∑ πᵐXᵐ` is
restricted at every radius below `‖π‖⁻¹`), so the unscaled presentation `W₁/(X − π⁻¹)` is zero. -/
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] (π : K) (hπ : 0 < ‖π‖)
    (hπ' : ‖π‖ < 1) :
    Nonempty ((Polynomial K ⧸ Ideal.span {Polynomial.X - Polynomial.C π⁻¹}) ≃ₐ[K] K) ∧
      IsUnit (washnitzerAlgebra.X 1 K 0 - algebraMap K (washnitzerAlgebra 1 K) π⁻¹) :=
  ⟨⟨Polynomial.quotientSpanXSubCAlgEquiv π⁻¹⟩, sorry⟩

/-- Positive control: for `‖a‖ ≤ 1` the relation `X − a` needs no rescaling, and evaluation at `a`
identifies `W₁/(X − a)` with `K`; `a = 1` is the relation `Y − 1` obtained from `X − π⁻¹` by the
rescaling `Y = πX`. -/
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K] (a : K)
    (ha : ‖a‖ ≤ 1) :
    ∃ e : (washnitzerAlgebra 1 K ⧸
        Ideal.span {washnitzerAlgebra.X 1 K 0 - algebraMap K (washnitzerAlgebra 1 K) a}) ≃ₐ[K] K,
      e (Ideal.Quotient.mk _ (washnitzerAlgebra.X 1 K 0)) = a := sorry

/-- Finite algebras need not be generated by one element, which is why `IsDaggerAlgebra.of_finite`
adjoins one generator at a time: `K[ε, δ]/(ε, δ)²` has dimension `3`, while the subalgebra generated
by one element `b` is spanned by `1` and `b`. -/
example (K : Type*) [Field K] :
    ¬ ∃ b : MvPolynomial (Fin 2) K ⧸
        (Ideal.span {MvPolynomial.X 0, MvPolynomial.X 1} : Ideal (MvPolynomial (Fin 2) K)) ^ 2,
      Algebra.adjoin K {b} = ⊤ := sorry

/-! ### F1.5 Weak completions and Monsky–Washnitzer type
(*integral-overconvergent-tate-algebra*, *integral-overconvergent-noetherian*, *weak-completion*,
*weak-completion-presentation*, *weak-completion-universal-property*,
*weak-completion-generic-fibre*, *mw-type-dagger-algebra*) -/

section IntegralWashnitzer

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [NonarchimedeanRing K]

/-- The integral Monsky–Washnitzer algebra `O_K⟨X₁, …, Xₙ⟩† = W_n ∩ O_K⟦X⟧` (vdP, §2, p. 35). -/
def intWashnitzerAlgebra (n : ℕ) : Subring (MvPowerSeries (Fin n) K) :=
  (washnitzerAlgebra n K).toSubring ⊓
    (MvPowerSeries.map (Huber.powerBoundedSubring K).subtype).range

/-- For `K` discretely valued with uniformiser `π`, `O_K⟨X⟩†` is noetherian (Kedlaya06, §2.4;
vdP, (2.2), p. 36). -/
theorem intWashnitzerAlgebra.isNoetherianRing [CompleteSpace K] (n : ℕ) (π : K)
    (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1) (hdisc : ∀ x : K, x ≠ 0 → ∃ k : ℤ, ‖x‖ = ‖π‖ ^ k) :
    IsNoetherianRing (intWashnitzerAlgebra K n) := sorry

/-- Zero and one are integral overconvergent series. -/
example (n : ℕ) : (0 : MvPowerSeries (Fin n) K) ∈ intWashnitzerAlgebra K n ∧
    (1 : MvPowerSeries (Fin n) K) ∈ intWashnitzerAlgebra K n :=
  ⟨(intWashnitzerAlgebra K n).zero_mem, (intWashnitzerAlgebra K n).one_mem⟩

/-- Constants are integral exactly when they lie in the valuation unit ball. -/
example (n : ℕ) (c : K) : MvPowerSeries.C (σ := Fin n) c ∈ intWashnitzerAlgebra K n ↔
    ‖c‖ ≤ 1 := sorry

/-- A scalar of norm strictly between zero and one is integral, while its inverse is excluded. -/
example (n : ℕ) (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1) :
    MvPowerSeries.C (σ := Fin n) π ∈ intWashnitzerAlgebra K n ∧
      MvPowerSeries.C (σ := Fin n) π⁻¹ ∉ intWashnitzerAlgebra K n := sorry

/-- In zero variables every integral series is a constant in the unit ball. -/
example (f : MvPowerSeries (Fin 0) K) : f ∈ intWashnitzerAlgebra K 0 ↔
    ∃ c : K, ‖c‖ ≤ 1 ∧ f = MvPowerSeries.C c := sorry

/-- The integral geometric series has linear degree growth, while the quadratic-degree series
is restricted without being overconvergent. -/
example (π : K) (hπ : 0 < ‖π‖ ∧ ‖π‖ < 1) :
    (∃ f : MvPowerSeries (Fin 1) K, (∀ m : ℕ, f.coeff (Finsupp.single 0 m) = π ^ m) ∧
      f ∈ intWashnitzerAlgebra K 1) ∧
    ∃ g : MvPowerSeries (Fin 1) K,
      (∀ m : ℕ, g.coeff (Finsupp.single 0 m) =
        if (Nat.sqrt m) ^ 2 = m then π ^ (Nat.sqrt m) else 0) ∧
      g ∈ radiusTate 1 K 1 ∧ g ∉ intWashnitzerAlgebra K 1 := sorry

end IntegralWashnitzer

section WeakCompletion

open TensorProduct

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (π : O) (S : Type*) [CommRing S] [Algebra O S]

/-- The `π`-adic completion `Ŝ = lim_m S/πᵐS`. -/
abbrev piAdicCompletion : Type _ := AdicCompletion (Ideal.span {algebraMap O S π}) S

variable {S} in
/-- For `x : ι → S`, the elements `∑_j π^j P_j(x)` of `Ŝ` with `P_j ∈ O[X]` of total degree
`≤ c (j + 1)` for some `c` (Monsky–Washnitzer growth). -/
def weakCompletionSet {ι : Type*} [Fintype ι] (x : ι → S) : Set (piAdicCompletion π S) :=
  {z | ∃ (c : ℕ) (P : ℕ → MvPolynomial ι O), (∀ j, (P j).totalDegree ≤ c * (j + 1)) ∧
    ∀ k : ℕ, AdicCompletion.eval _ S k z = Submodule.Quotient.mk
      (∑ j ∈ Finset.range k, algebraMap O S π ^ j * MvPolynomial.aeval x (P j))}

/-- Constants belong to the degree-growth set for every finite family, including no variables. -/
example {ι : Type*} [Fintype ι] (x : ι → S) (c : O) :
    algebraMap O (piAdicCompletion π S) c ∈ weakCompletionSet π x := sorry

/-- The constant one lies in the weak-completion set of a polynomial ring. -/
example (n : ℕ) : (1 : piAdicCompletion π (MvPolynomial (Fin n) O)) ∈
    weakCompletionSet π (MvPolynomial.X : Fin n → MvPolynomial (Fin n) O) := sorry

/-- The polynomial generators have weakly overconvergent geometric inverses. -/
example (n : ℕ) (i : Fin n) :
    ∃ z ∈ weakCompletionSet π (MvPolynomial.X : Fin n → MvPolynomial (Fin n) O),
      (1 - algebraMap O (piAdicCompletion π (MvPolynomial (Fin n) O)) π *
        algebraMap (MvPolynomial (Fin n) O) _ (MvPolynomial.X i)) * z = 1 := sorry

/-- The weak completion `S† ⊆ Ŝ` of a finitely generated `O`-algebra: generated by
`weakCompletionSet` for a chosen finite generating set, which is already a subalgebra
(`coe_weakCompletion`) (Kedlaya01, §2, p. 2). -/
def weakCompletion [Algebra.FiniteType O S] : Subalgebra O (piAdicCompletion π S) :=
  Algebra.adjoin O (weakCompletionSet π
    (fun x : ((Algebra.FiniteType.out (R := O) (A := S)).choose : Set S) ↦ (x : S)))

variable {S}

/-- For every finite generating family `x`, `S†` is exactly `weakCompletionSet π x`: it is a
subalgebra and does not depend on the generators. -/
theorem coe_weakCompletion [Algebra.FiniteType O S] {n : ℕ} (x : Fin n → S)
    (hx : Algebra.adjoin O (Set.range x) = ⊤) :
    (weakCompletion π S : Set (piAdicCompletion π S)) = weakCompletionSet π x := sorry

/-- `S† ⊆ Ŝ` contains the image of `S`. -/
theorem algebraMap_mem_weakCompletion [Algebra.FiniteType O S] (s : S) :
    algebraMap S (piAdicCompletion π S) s ∈ weakCompletion π S := sorry

variable (S) in
/-- The map `S → S†`. -/
def weakCompletion.of [Algebra.FiniteType O S] : S →ₐ[O] weakCompletion π S :=
  ((Algebra.ofId S (piAdicCompletion π S)).restrictScalars O).codRestrict _
    (algebraMap_mem_weakCompletion π)

/-- With `π` a uniformiser, `S†` is noetherian and `S†/πᵐ ≅ S/πᵐ` (vdP, §2, (2.1)–(2.2),
pp. 35–36). -/
theorem weakCompletion.isNoetherianRing [Algebra.FiniteType O S] (hπ : Irreducible π) :
    IsNoetherianRing (weakCompletion π S) ∧ ∀ m : ℕ,
      Nonempty ((weakCompletion π S ⧸ Ideal.span {algebraMap O (weakCompletion π S) π ^ m}) ≃ₐ[O]
        (S ⧸ Ideal.span {algebraMap O S π ^ m})) := sorry

/-- `B` is *weakly complete finitely generated*: `B ≅ O[Y₁, …, Y_m]† / J` (vdP, §2, (2.1)). -/
def IsWeaklyCompleteFG (B : Type*) [CommRing B] [Algebra O B] : Prop :=
  ∃ (m : ℕ) (J : Ideal (weakCompletion π (MvPolynomial (Fin m) O))),
    Nonempty (B ≃ₐ[O] (weakCompletion π (MvPolynomial (Fin m) O) ⧸ J))

/-- Universal property: `S†` is weakly complete finitely generated and every `O`-algebra map
`S → B` into such a `B` extends uniquely to `S†` (MW68, §2). -/
theorem weakCompletion.existsUnique_lift [Algebra.FiniteType O S] (hπ : Irreducible π)
    {B : Type*} [CommRing B] [Algebra O B] (hB : IsWeaklyCompleteFG π B) (φ : S →ₐ[O] B) :
    IsWeaklyCompleteFG π (weakCompletion π S) ∧
      ∃! φ' : weakCompletion π S →ₐ[O] B, φ'.comp (weakCompletion.of π S) = φ := sorry

variable (S) in
/-- The generic fibre `A† = S† ⊗_O K`. -/
abbrev weakCompletion.genericFibre [Algebra.FiniteType O S] (K : Type*) [Field K] [Algebra O K] :
    Type _ :=
  K ⊗[O] weakCompletion π S

/-- `S† ⊗ K` is a `K`-dagger algebra when `O` is the unit ball of `K` (GK02, Introduction). -/
theorem weakCompletion.isDaggerAlgebra_genericFibre [Algebra.FiniteType O S] (hπ : Irreducible π)
    (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K] [Algebra O K]
    (hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x) :
    IsDaggerAlgebra K (weakCompletion.genericFibre π S K) := sorry

/-- Over the complete base DVR the weak-completion map is bijective. -/
example (hπ : Irreducible π) : Function.Bijective (weakCompletion.of π O) := sorry

/-- Inverting the parameter makes the completion zero, so the weak map kills one. -/
example : weakCompletion.of π (Localization.Away π) 1 = 0 := sorry

/-- The weak generic fibre of the residue field is the zero algebra. -/
example (hπ : Irreducible π) (K : Type*) [Field K] [Algebra O K]
    [IsFractionRing O K] :
    Subsingleton (weakCompletion.genericFibre π (IsLocalRing.ResidueField O) K) := sorry

/-- The weak-completion set does not exhaust the adic completion of the polynomial ring. -/
example (hπ : Irreducible π) :
    weakCompletionSet π (MvPolynomial.X : Fin 1 → MvPolynomial (Fin 1) O) ≠ Set.univ := sorry

/-- The unique extension of the identity is the identity on the weak completion. -/
example [Algebra.FiniteType O S] (hπ : Irreducible π)
    (f : weakCompletion π S →ₐ[O] weakCompletion π S)
    (hf : f.comp (weakCompletion.of π S) = weakCompletion.of π S) : f = AlgHom.id O _ := sorry

end WeakCompletion

/-- `O[X]` is not weakly complete: `1 − πX` would be a unit. -/
example {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (π : O) (hπ : Irreducible π) :
    ¬ IsWeaklyCompleteFG π (Polynomial O) := sorry

/-! ### F1.9 Differentials (*dagger-differentials*, *dagger-polyannulus-de-rham-cohomology*) -/

section Differentials

variable (K : Type*) [CommRing K] (A : Type*) [CommRing A] [Algebra K A]

/-- `Ω¹_{A/K}`: Mathlib's Kähler differentials modulo the intersection of the submodules with
finite quotient (the universally finite differentials; GK00, §4, 4.1, p. 19). -/
abbrev Omega : Type _ :=
  KaehlerDifferential K A ⧸
    ⨅ N : {N : Submodule A (KaehlerDifferential K A) //
      Module.Finite A (KaehlerDifferential K A ⧸ N)}, N.1

/-- The universal derivation `d : A → Ω¹_A`. -/
def Omega.d : Derivation K A (Omega K A) :=
  (Submodule.mkQ _).compDer (KaehlerDifferential.D K A)

/-- The universal differential kills base scalars, including zero and one. -/
example (c : K) : Omega.d K A (algebraMap K A c) = 0 := by
  exact (Omega.d K A).map_algebraMap c

/-- The quadratic differential obeys the Leibniz rule. -/
example (a : A) : Omega.d K A (a ^ 2) = (2 : A) • (a • Omega.d K A a) := by
  simp [pow_two, two_smul, Derivation.leibniz]

end Differentials

section DaggerDifferentials

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  {A : Type*} [CommRing A] [Algebra K A] [IsDaggerAlgebra K A]

/-- For a dagger algebra `Ω¹_A` is finite, and `d` is universal among `K`-derivations into finite
`A`-modules (Kedlaya06, §3.1, Def. 3.1.2). -/
theorem Omega.existsUnique_lift {M : Type*} [AddCommGroup M] [Module A M] [Module K M]
    [IsScalarTower K A M] [Module.Finite A M] (D : Derivation K A M) :
    Module.Finite A (Omega K A) ∧ ∃! u : Omega K A →ₗ[A] M, ∀ a, u (Omega.d K A a) = D a := sorry

/-- `Ω¹_{W_n}` is free on `dX₁, …, dXₙ`. -/
theorem Omega.washnitzerBasis (n : ℕ) :
    ∃ b : Module.Basis (Fin n) (washnitzerAlgebra n K) (Omega K (washnitzerAlgebra n K)),
      ∀ i, b i = Omega.d K _ (washnitzerAlgebra.X n K i) := sorry

/-- In characteristic zero, `Ω¹_A` is projective for regular `A` (Kedlaya06, §3.1, after
Def. 3.1.2, p. 19: regular ⇒ locally free; GK02, §1, 1.2, p. 5, for the universal property). -/
theorem Omega.projective_of_isRegularRing [CharZero K] [IsRegularRing A] :
    Module.Projective A (Omega K A) := sorry

/-- The dagger Poincaré lemma in degrees `0` and `1` on the polydisc: in characteristic zero a
function on `Sp W_n` with `d f = 0` is constant, and every `1`-form on the dagger disc `Sp W_1` is
exact (GK02, §2, Lem. 2.1(a), p. 15, by coefficientwise integration with a smaller radius).
This holds in residue characteristic zero as well: over `ℚ((t))` with the `t`-adic norm,
division by a nonzero integer preserves coefficient norms. The rigid closed disc also has
vanishing first de Rham cohomology over that field; over `ℚ_p` its first cohomology is
infinite-dimensional. -/
theorem Omega.poincare_washnitzer [CharZero K] (n : ℕ) :
    (∀ f : washnitzerAlgebra n K, Omega.d K _ f = 0 ↔ f ∈ Set.range (algebraMap K _)) ∧
      ∀ ω : Omega K (washnitzerAlgebra 1 K), ∃ f, Omega.d K _ f = ω := sorry

/-- The finite differential module of the field is zero. -/
example : Subsingleton (Omega K K) := sorry

/-- The zero derivation and the universal derivation have zero and identity factorisations. -/
example :
    (∃! u : Omega K A →ₗ[A] Omega K A, ∀ a, u (Omega.d K A a) = 0) ∧
      (∃! u : Omega K A →ₗ[A] Omega K A, ∀ a, u (Omega.d K A a) = Omega.d K A a) := sorry

/-- Any universal factorisation of a derivation evaluates the quadratic differential correctly. -/
example {M : Type*} [AddCommGroup M] [Module A M] [Module K M]
    [IsScalarTower K A M] (D : Derivation K A M) (u : Omega K A →ₗ[A] M)
    (hu : ∀ a, u (Omega.d K A a) = D a) (a : A) :
    u (Omega.d K A (a ^ 2)) = (2 : A) • (a • D a) := sorry

end DaggerDifferentials

/-- `[CharZero K]` cannot be dropped: in characteristic `p`, `X^{p−1} dX` is not exact on the
dagger disc. -/
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    (p : ℕ) [Fact p.Prime] [CharP K p] :
    ¬ ∃ f, Omega.d K (washnitzerAlgebra 1 K) f =
      washnitzerAlgebra.X 1 K 0 ^ (p - 1) • Omega.d K _ (washnitzerAlgebra.X 1 K 0) := sorry

/-- Pure dimension is not Krull dimension: `K × W₁`, the ring of the smooth space `Sp K ⨿ Sp W₁`,
is a dagger algebra of Krull dimension `1` with a factor of dimension `0`. In characteristic zero
that space has `H⁰_dR = K²`, `H⁰_{dR,c} = K` and `H²_{dR,c} = K`, so duality with a single shift
`2n` needs pure dimension. -/
example (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K] :
    IsDaggerAlgebra K (K × washnitzerAlgebra 1 K) ∧
      ringKrullDim (K × washnitzerAlgebra 1 K) = 1 ∧ ringKrullDim K = 0 := sorry

section MWType

open TensorProduct

variable (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
  [NonarchimedeanRing K] [Algebra O K]
  (A : Type*) [CommRing A] [Algebra K A] [IsDaggerAlgebra K A] [Algebra O A] [IsScalarTower O K A]

/-- `A` is of *Monsky–Washnitzer type*: `O` is the unit ball of `K`, `A` is regular and the
reduction `k ⊗_O A^int` is a smooth `k`-algebra, `k` the residue field of `O` and `A^int` taken as
an `O`-algebra (equal to `A^int`, `O` mapping into the unit ball of `K`). Regularity is part of the
definition (Kedlaya06, §3.2, Def. 3.2.1, with its errata). -/
structure IsMWType : Prop where
  /-- `O` is the unit ball of `K`. -/
  hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x
  /-- `A` is a regular ring. -/
  isRegularRing : IsRegularRing A
  /-- The reduction `k ⊗_O A^int` is smooth over the residue field `k` of `O`. -/
  smooth : Algebra.Smooth (IsLocalRing.ResidueField O)
    (IsLocalRing.ResidueField O ⊗[O] Algebra.adjoin O (intSubring K A : Set A))

variable {O K A}

/-- For `A` of MW-type, `Ω¹_A` is finite projective. -/
theorem IsMWType.projective_differentials (h : IsMWType O K A) :
    Module.Projective A (Omega K A) := sorry

/-- For `S` smooth and finitely generated over `O`, with `O` the unit ball of `K`, `S† ⊗ K` is of
MW-type with reduction `S/πS` (GK02, Introduction; Kedlaya06, §3.2). -/
theorem IsMWType.of_smooth [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (π : O) (hπ : Irreducible π) (hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x)
    (S : Type*) [CommRing S] [Algebra O S] [Algebra.FiniteType O S] [Algebra.Smooth O S] :
    haveI := weakCompletion.isDaggerAlgebra_genericFibre π hπ K hO (S := S)
    IsMWType O K (weakCompletion.genericFibre π S K) := sorry

end MWType

/-- The regularity clause is not implied by the reduction: `W_1/(X²)` has smooth reduction `k`
(the nilpotent `X` is divisible by every power of `π` in `A^int`) but is not regular. -/
example (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [NonarchimedeanRing K] [Algebra O K] (hO : ∀ x : K, ‖x‖ ≤ 1 ↔ ∃ a : O, algebraMap O K a = x)
    (A : Type*) [CommRing A] [Algebra K A] [IsDaggerAlgebra K A] [Algebra O A]
    [IsScalarTower O K A]
    (e : A ≃ₐ[K] washnitzerAlgebra 1 K ⧸ Ideal.span {washnitzerAlgebra.X 1 K 0 ^ 2}) :
    ¬ IsMWType O K A := sorry

end Dagger

end TauCetiRoadmap.AdicSpacesPartIV
