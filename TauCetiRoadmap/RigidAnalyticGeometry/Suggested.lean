module

public import Mathlib
public import TauCeti.Analysis.Normed.Field.WeaklyStable
public import TauCeti.RingTheory.MvPowerSeries.TateAlgebra.FractionField
public import TauCeti.RingTheory.Affinoid.PowerBounded
public import TauCeti.RingTheory.Affinoid.TopologicallyFiniteType
public import TauCeti.RingTheory.Japanese
public import TauCeti.RingTheory.RegularLocalRing.GRing
public import TauCeti.RingTheory.RegularLocalRing.Locus
public import TauCeti.RingTheory.UniversallyCatenary
public import TauCeti.AlgebraicGeometry.Rigid.Affinoid.Site
public import TauCeti.Topology.GTopology.Points
public import TauCeti.AlgebraicGeometry.AdicSpace.Spa.MaximalIdealPoint

/-!
# Rigid analytic geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, on the pinned carriers: the
weak-stability predicate `TauCeti.IsWeaklyStable` and the Gauss-normed fraction field
`TauCeti.MvPowerSeries.GaussFractionField`, the affinoid predicate `TauCeti.IsAffinoidAlgebra`, the
supremum seminorm `TauCeti.supSeminorm`, the Japanese-ring predicate `TauCeti.Ring.IsJapanese`,
the G-ring predicate `TauCeti.Excellence.IsGRing`, the regular locus
`TauCeti.Excellence.regularLocus` and universal catenarity `TauCeti.Excellence.IsUniversallyCatenary`,
the poset `TauCeti.AffinoidSubdomain` of affinoid subdomains of `Sp A` with its presheaf of
coordinate algebras `TauCeti.AffinoidSubdomain.presheaf`, its weak G-topology
`TauCeti.AffinoidSubdomain.weakGTopology` and the site points `TauCeti.GTopology.point` of a
G-topology with Mathlib's fibers `CategoryTheory.GrothendieckTopology.Point.presheafFiber`, Mathlib's
Čech complex `CategoryTheory.cechComplexFunctor`, and the classical points
`TauCeti.ValuationSpectrum.maximalSpectrumToSpa` of `Spa(A,A°)` inside the valuation spectrum
`TauCeti.ValuationSpectrum A` with Mathlib's `constructibleTopology`. No definition is made here.

Stated below, because the pinned libraries do not prove them: weak stability of the Gauss
fraction field of `Tₙ` in every characteristic (Layer 0); finiteness of normalisation for affinoid
domains (§1.2: an affinoid domain is Japanese, in every characteristic); Kiehl's excellence of
affinoid algebras in its two non-pinned halves (§1.2: every affinoid algebra is a G-ring, and every
algebra of finite type over it has open regular locus; universal catenarity is pinned); the
Banach function algebra theorem of §2.2 (on a reduced affinoid algebra every complete ultrametric
algebra norm is bounded by a multiple of the supremum seminorm; the reverse bound is the pinned
`TauCeti.IsAffinoidAlgebra.supSeminorm_le_norm`); Tate's acyclicity theorem (§5.1: the presheaf of
coordinate algebras is a sheaf for the weak affinoid G-topology, and its Čech complex for a finite
affinoid cover is exact in positive degrees); excellence of the analytic local rings (§5.3: the
stalk of the structure presheaf at a classical point is a G-ring and universally catenary); and
Huber's theorems on classical points (§8.2: their closure in the constructible
topology of `Spv A` is the set `L_A`, and they are dense in the constructible topology of
`Spa(A,A°)`).

Proved by the pinned Tau Ceti, so not restated: the algebraic theorems of Layers 0–2 that the
README cites by their pinned names, the injectivity and image of the classical-point map of §8.2,
and the numerical slope predicates, decomposition and projector of §7.2.

Not statable at the pins, so stated nowhere in this file: the category of rigid spaces with its
gluing and the classical properness predicates (§§6.2–6.3), which need a rigid-space carrier; the
identity principle (§7.3), which needs rigid spaces and their analytic subsets; rigid
analytification (§8.1), which needs the rigid category; the rigid–adic equivalence (§8.3), which
needs the rigid category and the functor to adic spaces; and quantifier elimination for
algebraically closed valued fields (§8.2), which needs their first-order theory in the language
of rings with a divisibility relation: neither library defines it, and writing out its axiom
schemes here would be a long ad hoc encoding. These are README targets with their intended
signatures.
-/

namespace TauCetiRoadmap.RigidAnalyticGeometry

noncomputable section

@[expose] public section

open Topology

universe u

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-! ## Layer 0: shared Tate inputs and weak stability -/

/-- Weak stability of the Gauss fraction field (Layer 0; BGR 5.3.1/1 with 3.5.3/1–2): the
fraction field of `Tₙ = K⟨X₁,…,Xₙ⟩`, with the extended Gauss norm and not completed, is weakly
stable, in the bounded-functional form of `TauCeti.IsWeaklyStable`: every linear functional on a
finite extension is bounded by a multiple of its spectral norm. In characteristic zero the field
is perfect and this is the pinned `TauCeti.isWeaklyStable_of_perfectField`; in characteristic `p`
the field is imperfect and incomplete, and purely inseparable extensions such as
`Frac(T₁)(T^(1/p))` are included. -/
theorem isWeaklyStable_gaussFractionField (n : ℕ) :
    TauCeti.IsWeaklyStable (TauCeti.MvPowerSeries.GaussFractionField (Fin n) K (fun _ ↦ 1)) := by
  sorry

/-! ## Layer 1: affinoid algebras and their topology -/

section Normalisation

variable {A : Type*} [CommRing A] [IsDomain A] [Algebra K A]

/-- Finiteness of normalisation (§§0.2 and 1.2; BGR 6.1.2 through 5.3.1 and 3.5.3): an
affinoid domain is Japanese, that is, its integral closure in every finite extension of its
fraction field is a finite module, inseparable extensions included. An affinoid domain is finite
over a Tate algebra, and the Tate algebra is Japanese by the weak stability of its Gauss fraction
field; `TauCeti.Ring.IsJapanese.of_finite` transfers the property. The zero-variable case is a
finite extension of `K`, a field, which is Japanese trivially. -/
theorem isJapanese_of_isAffinoidAlgebra (hA : TauCeti.IsAffinoidAlgebra K A) :
    TauCeti.Ring.IsJapanese A := by
  sorry

end Normalisation

section Excellence

/-- Affinoid algebras are G-rings (§1.2; Kiehl's excellence theorem as explained in Conrad,
*Irreducible components of rigid spaces*, §1.1, pp. 3–5): every affinoid algebra is noetherian
and the completion of each of its local rings has geometrically regular formal fibres. No
finiteness of the imperfection degree `[K : K^p]` is assumed; in characteristic `p` the proof
uses Kiehl's differential regularity criterion (Conrad, Theorem 1.1.1). The algebra need not be
a domain: `K⟨T⟩ × K` is a G-ring. -/
theorem isGRing_of_isAffinoidAlgebra {A : Type*} [CommRing A] [Algebra K A]
    (hA : TauCeti.IsAffinoidAlgebra K A) : TauCeti.Excellence.IsGRing A := by
  sorry

/-- Affinoid algebras are J-2 (§1.2; Kiehl's excellence theorem, Conrad §1.1, pp. 3–5): for an
affinoid algebra `A` and every `A`-algebra `B` of finite type, the regular locus of `B` is open in
`Spec B`. For the cusp `K⟨X,Y⟩/(Y² − X³)` it is the complement of the origin. A nonempty regular
locus alone would say nothing, since the generic point of a domain is always regular. -/
theorem isOpen_regularLocus_of_finiteType {A : Type*} [CommRing A] [Algebra K A]
    (hA : TauCeti.IsAffinoidAlgebra K A) (B : Type*) [CommRing B] [Algebra A B]
    [Algebra.FiniteType A B] : IsOpen (TauCeti.Excellence.regularLocus B) := by
  sorry

end Excellence

/-! ## Layer 2: supremum seminorm, reduction and integral models -/

section BanachFunctionAlgebra

variable {A : Type*} [NormedCommRing A] [NormedAlgebra K A] [IsUltrametricDist A] [CompleteSpace A]

/-- Banach function algebra theorem (§2.2; BGR §6.2.4): on a reduced affinoid algebra, every
complete ultrametric algebra norm is bounded by a constant multiple of the supremum seminorm, so
the two are equivalent. The reverse inequality `|f|sup ≤ ‖f‖` holds for every affinoid algebra and
is the pinned `TauCeti.IsAffinoidAlgebra.supSeminorm_le_norm`. Reducedness is necessary: in
`K⟨T⟩/(T²)` with its quotient norm, `T` has norm one and supremum seminorm zero. -/
theorem exists_norm_le_mul_supSeminorm [IsReduced A] (hA : TauCeti.IsAffinoidAlgebra K A) :
    ∃ C : ℝ, 0 < C ∧ ∀ f : A, ‖f‖ ≤ C * TauCeti.supSeminorm K f := by
  sorry

end BanachFunctionAlgebra

/-! ## Layer 5: Čech comparison and acyclicity -/

section Acyclicity

open CategoryTheory in
/-- Tate's acyclicity theorem, sheaf form (§5.1; BGR 8.2.1/1; Tate's theorem as recorded in
Kiehl-AB §1, p. 258, whose Hilfssatz 1.3, p. 260, refines a covering by special subdomains to a
Laurent covering on each member of which the induced covering is formal): the presheaf of
coordinate algebras on the affinoid subdomains of `Sp A` is a sheaf for the Grothendieck topology
of the weak affinoid G-topology, whose covers are the families of affinoid subdomains with a
finite affinoid subcover. For the Laurent cover of the unit disc this is the exactness of
`0 → K⟨T⟩ → K⟨T/ϖ⟩ × K⟨ϖ/T⟩ → K⟨T/ϖ, ϖ/T⟩`; for `A = 0` the empty cover of the empty subdomain
forces its coordinate algebra to be the zero ring. -/
theorem isSheaf_affinoidSubdomain_presheaf (A : Type*) [CommRing A] [Algebra K A]
    [Fact (TauCeti.IsAffinoidAlgebra K A)] :
    Presheaf.IsSheaf
      (TauCeti.AffinoidSubdomain.weakGTopology (K := K) (A := A)).grothendieckTopology
      (TauCeti.AffinoidSubdomain.presheaf (K := K) (A := A)) := by
  sorry

open CategoryTheory in
/-- Tate's acyclicity theorem in positive degrees (§5.1; BGR 8.2.1/1): for a finite family `U`
of affinoid subdomains covering `Sp A`, Mathlib's Čech complex of the presheaf of coordinate
algebras, as `K`-modules, is exact in every degree `n ≥ 1`. The complex runs over all ordered
tuples of indices. Degree zero is excluded: there the cohomology is `A`, by the sheaf condition.
For the one-member cover by `Sp A` the complex is `A` in every degree, with differentials
alternately zero and the identity. -/
theorem exactAt_cechComplex_of_cover (A : Type*) [CommRing A] [Algebra K A]
    [Fact (TauCeti.IsAffinoidAlgebra K A)] {ι : Type} [Finite ι]
    (U : ι → TauCeti.AffinoidSubdomain K A) (hU : ∀ x : MaximalSpectrum A, ∃ i, x ∈ U i)
    (n : ℕ) (hn : 0 < n) :
    ((cechComplexFunctor U).obj
      (TauCeti.AffinoidSubdomain.presheaf (K := K) (A := A) ⋙
        forget₂ (CommAlgCat K) (AlgCat K) ⋙ forget₂ (AlgCat K) (ModuleCat K))).ExactAt n := by
  sorry

end Acyclicity

section AnalyticLocalRings

open CategoryTheory

/-- The analytic local rings are G-rings (§5.3; Conrad, *Irreducible components of rigid
spaces*, Theorem 1.1.3, p. 5): the stalk of the structure presheaf of `Sp A` at a classical point
`x`, the fiber of the presheaf of coordinate algebras at the site point of `x` for the weak affinoid
G-topology, which is the colimit of the coordinate algebras of the affinoid subdomains containing
`x`, is noetherian with geometrically regular formal fibres. Conrad's proof reduces the formal
fibres to the generic formal fibre of an affinoid domain, regular by Kiehl's excellence of affinoid
algebras, through finite maps of affinoids, using Kisin's lemma and the sheaf condition for
disjoint affinoid coverings. The stalk need not be regular: at the origin of the cusp
`K⟨X,Y⟩/(Y² − X³)` its completion is `K⟦t², t³⟧`, and its generic formal fibre is the field
`K((t))`. -/
theorem isGRing_stalk (A : Type u) [CommRing A] [Algebra K A]
    [Fact (TauCeti.IsAffinoidAlgebra K A)] (x : MaximalSpectrum A) :
    TauCeti.Excellence.IsGRing
      (((TauCeti.AffinoidSubdomain.weakGTopology (K := K) (A := A)).point x).presheafFiber
        (A := CommRingCat.{u}) |>.obj
        (TauCeti.AffinoidSubdomain.presheaf (K := K) (A := A) ⋙
          forget₂ (CommAlgCat K) CommRingCat)) := by
  sorry

/-- The analytic local rings are universally catenary (§5.3; Conrad, proof of Theorem 1.1.3,
p. 5): the stalk at a classical point is a quotient of the stalk at a point of a unit ball, which
is a regular local ring. With `isGRing_stalk` this is excellence of the noetherian local ring,
by the criterion Conrad's proof applies on p. 5. -/
theorem isUniversallyCatenary_stalk (A : Type u) [CommRing A] [Algebra K A]
    [Fact (TauCeti.IsAffinoidAlgebra K A)] (x : MaximalSpectrum A) :
    TauCeti.Excellence.IsUniversallyCatenary
      (((TauCeti.AffinoidSubdomain.weakGTopology (K := K) (A := A)).point x).presheafFiber
        (A := CommRingCat.{u}) |>.obj
        (TauCeti.AffinoidSubdomain.presheaf (K := K) (A := A) ⋙
          forget₂ (CommAlgCat K) CommRingCat)) := by
  sorry

end AnalyticLocalRings

/-! ## Layer 8: analytification and rigid–adic comparison -/

section ConstructibleDensity

/-- Huber's constructible closure of the classical points (§8.2; Huber, *Continuous valuations*,
Theorem 4.1, p. 472): for a complete ultrametric normed affinoid algebra `A`, the closure of the
classical points in the constructible topology of the valuation spectrum `Spv A` is the set `L_A`
of valuations at most one on `A°` and less than one on `A°°`. The proof uses quantifier
elimination for algebraically closed valued fields (README §8.2). `L_A` contains discontinuous
valuations, so this is a statement about `Spv A` and not only `Spa(A, A°)`; for `A = K` both sides
are the single point `|·|`. -/
theorem closure_range_maximalSpectrumToSpa {A : Type*} [NormedCommRing A] [NormedAlgebra K A]
    [IsUltrametricDist A] [CompleteSpace A] (hA : TauCeti.IsAffinoidAlgebra K A) :
    @closure (TauCeti.ValuationSpectrum A) (constructibleTopology (TauCeti.ValuationSpectrum A))
      (Set.range fun x ↦
        ((TauCeti.ValuationSpectrum.maximalSpectrumToSpa K hA.isTopologicallyFiniteType x :
          TauCeti.ValuationSpectrum.spa (TauCeti.Huber.powerBoundedSubring A)) :
            TauCeti.ValuationSpectrum A)) =
      {v : TauCeti.ValuationSpectrum A |
        (∀ a ∈ TauCeti.Huber.powerBoundedSubring A, v.toValuativeRel.vle a 1) ∧
          ∀ a ∈ TauCeti.Huber.topologicallyNilpotentIdeal A, ¬ v.toValuativeRel.vle 1 (a : A)} := by
  sorry

/-- Constructible density of classical points (§8.2; Huber, *Continuous valuations*,
Corollary 4.2, p. 473, proved without Theorem 4.1 by the route of Remark 4.7, pp. 474–476): for a
complete ultrametric normed affinoid algebra `A`, the classical points `Max A → Spa(A, A°)` are
dense in the constructible topology of `Spa(A, A°)`, so every nonempty constructible subset
contains a classical point. They are not dense in the stronger sense of meeting every
proconstructible set: the singleton of a rank-two point of the disc contains none. -/
theorem dense_range_maximalSpectrumToSpa {A : Type*} [NormedCommRing A] [NormedAlgebra K A]
    [IsUltrametricDist A] [CompleteSpace A] (hA : TauCeti.IsAffinoidAlgebra K A) :
    @Dense _ (constructibleTopology _)
      (Set.range
        (TauCeti.ValuationSpectrum.maximalSpectrumToSpa K hA.isTopologicallyFiniteType)) := by
  sorry

end ConstructibleDensity

end

end

end TauCetiRoadmap.RigidAnalyticGeometry
