module

public import Mathlib
public import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.Basic
public import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.ClassModule.Basic
public import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologyComparison
public import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.Cohomology
public import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.Functoriality
public import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.Graded.Basic
public import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.TrivialF2.Basic
public import TauCeti.RepresentationTheory.Homological.ContCohomology.Evens.DihedralPullback
public import TauCeti.RepresentationTheory.Homological.ContCohomology.FiniteQuotient.Colimit
public import TauCeti.RepresentationTheory.Homological.ContCohomology.Functoriality
public import TauCeti.RepresentationTheory.Homological.ContCohomology.InhomogeneousF2
public import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree
public import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic
public import TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialF2
public import TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialF2.Character
public import TauCeti.GroupTheory.GroupExtension.DihedralSixteen
public import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.Basic
public import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.FiniteExtension
public import TauCeti.FieldTheory.GaloisCohomology.BrauerTorsion
public import TauCeti.FieldTheory.GaloisCohomology.Character
public import TauCeti.FieldTheory.GaloisCohomology.Coefficients
public import TauCeti.FieldTheory.GaloisCohomology.Corestriction.Basic
public import TauCeti.FieldTheory.GaloisCohomology.Corestriction.Exact
public import TauCeti.FieldTheory.GaloisCohomology.EvensNorm
public import TauCeti.FieldTheory.GaloisCohomology.Kummer
public import TauCeti.FieldTheory.GaloisCohomology.Restriction

/-!
# Continuous cohomology of profinite groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that the pinned libraries do not yet prove, each
with `sorry`.

Most headline theorems of the roadmap are already proved at the Tau Ceti pin, and `README.md`
cites them by name in its supplier contracts instead of restating them here: the comparison
isomorphisms between the explicit and the canonical model, the finite-quotient colimit, the long
exact and five-term sequences, Shapiro's lemma in every degree, dimension shifting, all-degree
corestriction with `cor ∘ res`, its transitivity and the Mackey formula, Hilbert 90 and the Kummer
isomorphism, the ordinary cohomological-dimension criteria, the strict-dimension criterion
(NSW (3.3.4), `TauCeti.strictCohomologicalDimensionAt_le_iff_forall_openSubgroup`), the
class-module theorem for a group of strict `p`-cohomological dimension at most two
(NSW (3.6.4), `TauCeti.subsingleton_h1_abelianizationProP` and
`TauCeti.abelianizationProPClass_generates`), the graded cup product with associativity, graded
commutativity and the projection formula, and the index-two Evens norm: the graph construction on
continuous characters, its descent to degree-one classes (`TauCeti.ContCohomology.evensNormIndexTwo`),
its identities, the class-level `D₁₆` pullback formula, its transport to a quadratic field extension
(`TauCeti.galoisEvens`) and the index-two exact sequence.

One family of headline theorems remains, and it is stated below (Layer 11 of `README.md`): the
independence of `cd_p` and `scd_p` from the extra coefficient universe of Tau Ceti's invariants,
between the value `v = u` used by the Tau Ceti theorems on subgroups and the value `v = 0`, which
quantifies over the same coefficient universe.

One headline theorem is not statable at the pins. The general Evens norm
`H^{2q}(U, A) → H^{2lq}(G, A)` of an open subgroup `U` of index `l` with coefficients in a discrete
commutative `G`-ring `A`, its characteristic-two form in every degree, and their multiplicativity,
transitivity, double-coset, inflation and expansion laws (Layer 13) all need the norm map itself.
That map is the multiplicative transfer, built from tensor induction at the level of resolutions.
Tau Ceti has tensor induction of representations (`Subgroup.tensorInductionFunctor`) but no
cohomological norm built from it, and the map is a construction, not a short definition on native
carriers.

The comparison isomorphism between the two canonical cohomology objects that underlies the
remaining family is likewise a construction (a chain isomorphism of homogeneous cochain complexes
and its homology classes). `README.md` specifies it as a target, and only its consequence for the
invariants is stated here.

The roadmaps that import this module (Class Field Theory, Quadratic Form Invariants, and the
completed Local Galois Groups and Profinite Pro-`p` Groups) read part of this roadmap through the
names declared below besides the headline theorems; `README.md`, "Downstream consumers", lists
them. Each is the pinned Tau Ceti declaration under this roadmap's name and argument order (an
abbreviation, or a theorem proved by the Tau Ceti theorem), except for three short definitions on
the same carriers (`degreeCast`, `cup` read as a function, `galoisConj`), the coordinate table
`WreathC2.sectionTable` with the section `wreathSection` it defines, and two theorems the pinned
Tau Ceti does not prove in this form, stated with `sorry`: NSW (3.6.4) as
`abelianizationProPClass_generates`, and the restriction formula `galoisEvens_galoisRes` for the
Evens norm of a quadratic extension.
-/

@[expose] public section

universe u v

namespace TauCetiRoadmap.ProfiniteCohomology

open CategoryTheory
open TauCeti.ContinuousCohomology (continuousCohomologyFunctor)

/-! ## Layer 0: discrete modules and continuous sections -/

/-- **The invariant coefficients `M^U`** of a subgroup `U` acting on `M`, as an additive subgroup:
Mathlib's `FixedPoints.addSubgroup U M`. For normal `U` Tau Ceti puts on it the descended
`G ⧸ U`-action (`TauCeti.distribMulActionQuotientFixedPointsAddSubgroup`), which is the coefficient
system of inflation and of the finite-quotient tower. -/
abbrev Invariants {G : Type*} [Group G] (U : Subgroup G) (M : Type*) [AddCommGroup M]
    [DistribMulAction G M] : AddSubgroup M :=
  FixedPoints.addSubgroup U M

/-! ## Layer 1: the canonical carrier and its functoriality -/

/-- **The carrier category**, Mathlib's `TopRep` with the coefficient modules in the universe of
the group `G : Type u`, as the Conventions bullet "Universes" of `README.md` fixes it. -/
abbrev TopRep (R : Type v) [Ring R] [TopologicalSpace R] (G : Type u) [Monoid G] :=
  _root_.TopRep.{u} R G

/-- **Coefficient maps**: the map `Hⁿ(G, X) ⟶ Hⁿ(G, Y)` induced by a morphism `f : X ⟶ Y` of
coefficient objects, Mathlib's `ContinuousCohomology.map` at the identity of `G`. It is Tau Ceti's
`TauCeti.ContinuousCohomology.coeffMap`. -/
noncomputable abbrev coeffMap (R : Type v) [CommRing R] [TopologicalSpace R] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] {X Y : TopRep R G} (f : X ⟶ Y) (n : ℕ) :
    (continuousCohomologyFunctor R G n).obj X ⟶
      (continuousCohomologyFunctor R G n).obj Y :=
  TauCeti.ContinuousCohomology.coeffMap f n

/-- **The class of a homogeneous cocycle**: for a homogeneous continuous `n`-cochain `a` of `X`
with vanishing differential, its class in `Hⁿ(G, X)`. It is Tau Ceti's `TopRep.cochainClass`, the
quotient map from cocycles to cohomology. -/
noncomputable abbrev cochainClass (R : Type v) [CommRing R] [TopologicalSpace R] {G : Type u}
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (X : TopRep R G) (n : ℕ)
    (a : (_root_.TopRep.homogeneousCochains X).X n)
    (ha : ((_root_.TopRep.homogeneousCochains X).d n (n + 1)).hom a = 0) :
    continuousCohomology n X :=
  _root_.TopRep.cochainClass X n a ha

/-- **The categorical dictionary**: a discrete `G`-module `M` with continuous action, as an object
of `TopRep ℤ G` whose underlying module is `M` and whose operator at `g` is `m ↦ g • m`. It is Tau
Ceti's `TauCeti.ofDiscreteModule ℤ G M`. -/
noncomputable abbrev ofDiscreteModule (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type u) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M]
    [ContinuousSMul G M] : TopRep ℤ G :=
  TauCeti.ofDiscreteModule ℤ G M

/-! ## Layer 2: the explicit low-degree complex -/

/-- **Continuous inhomogeneous 2-cocycles** `Z²(G, M)`: continuous `f : G × G → M` with
`g • f (h, k) - f (g h, k) + f (g, h k) - f (g, h) = 0`. Tau Ceti's
`TauCeti.ContCohomology.Z2`. -/
abbrev Z2 (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (M : Type*)
    [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M] [DistribMulAction G M]
    [ContinuousSMul G M] : AddSubgroup (G × G → M) :=
  TauCeti.ContCohomology.Z2 G M

/-- **The explicit `H²(G, M) = Z²/B²`**, Tau Ceti's `TauCeti.ContCohomology.H2`. -/
abbrev H2 (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (M : Type*)
    [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M] [DistribMulAction G M]
    [ContinuousSMul G M] :=
  TauCeti.ContCohomology.H2 G M

/-- **The class map `Z² → H²`**, Tau Ceti's `TauCeti.ContCohomology.H2pi`. -/
abbrev H2pi (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (M : Type*)
    [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M] [DistribMulAction G M]
    [ContinuousSMul G M] : (Z2 G M) →+ H2 G M :=
  TauCeti.ContCohomology.H2pi G M

/-- **`H²(G, M)` with the discrete topology, identified with `H²(G, M)`** as an additive group:
Tau Ceti's `TauCeti.ContCohomology.discreteH2Equiv`. -/
noncomputable abbrev discreteH2Equiv (G : Type*) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type*) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DistribMulAction G M] [ContinuousSMul G M] :
    TauCeti.ContCohomology.DiscreteH2 G M ≃+ H2 G M :=
  TauCeti.ContCohomology.discreteH2Equiv G M

/-! ## Layer 3: the comparison isomorphisms -/

/-- **The degree-two comparison** of the explicit `H²(G, M)`, with the discrete topology, and the
canonical `H²(G, M)`, for profinite `G` and a discrete `G`-module `M`, in `TopModuleCat ℤ`: Tau
Ceti's `TauCeti.ContCohomology.explicitH2IsoContinuousCohomology`. -/
noncomputable abbrev explicitH2IsoContinuousCohomology (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (M : Type u) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    [CompactSpace G] [TotallyDisconnectedSpace G] :=
  TauCeti.ContCohomology.explicitH2IsoContinuousCohomology G M

/-! ## Layer 4: the finite-quotient colimit description -/

/-- **The degree-two comparison cocone legs** `H²(G ⧸ U, M^U) → H²(G, M)`, over the open normal
subgroups `U` of the profinite `G`, each leg the explicit inflation: Tau Ceti's
`TauCeti.ContCohomology.explicitFiniteQuotientComparison2`. -/
noncomputable abbrev explicitFiniteQuotientComparison2 (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (M : Type u)
    [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M] [DiscreteTopology M]
    [DistribMulAction G M] [ContinuousSMul G M] :=
  TauCeti.ContCohomology.explicitFiniteQuotientComparison2 G M

/-- **NSW (1.2.5) in degree two**: the comparison cocone is a colimit, so
`colim_U H²(G ⧸ U, M^U) ≅ H²(G, M)`. Tau Ceti's
`TauCeti.ContCohomology.explicitFiniteQuotientColimit2`. -/
noncomputable abbrev explicitFiniteQuotientColimit2 (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (M : Type u)
    [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M] [DiscreteTopology M]
    [DistribMulAction G M] [ContinuousSMul G M] :=
  TauCeti.ContCohomology.explicitFiniteQuotientColimit2 G M

/-! ## Layer 9: the Galois interface -/

/-- **The absolute Galois group** `G_K = Gal(Kˢ/K)` of the separable closure, with the Krull
topology: Tau Ceti's `TauCeti.AbsoluteGaloisGroup`. -/
abbrev AbsoluteGaloisGroup (K : Type*) [Field K] : Type _ :=
  TauCeti.AbsoluteGaloisGroup K

/-- **The Kummer coefficient module** `μₙ(Kˢ)`, written additively, with the discrete topology:
Tau Ceti's `TauCeti.KummerCoeff`. -/
abbrev KummerCoeff (K : Type*) [Field K] (n : ℕ) : Type _ :=
  TauCeti.KummerCoeff K n

/-- **The multiplicative coefficient module** `(Kˢ)ˣ`, written additively, with the discrete
topology: Tau Ceti's `TauCeti.UnitsCoeff`. -/
abbrev UnitsCoeff (K : Type*) [Field K] : Type _ :=
  TauCeti.UnitsCoeff K

/-- **The Kummer map against the canonical object**, `Kˣ → H¹(G_K, μₙ)` for `n` invertible in
`K`, the Kummer class of a unit read in canonical continuous cohomology: Tau Ceti's
`TauCeti.kummerMapCanonical`. -/
noncomputable abbrev kummerMapCanonical (K : Type u) [Field K] (n : ℕ) (hn : IsUnit (n : K)) :=
  TauCeti.kummerMapCanonical K n hn

/-- **The map `H²(G_K, μₙ) → H²(G_K, (Kˢ)ˣ)`** induced by the inclusion `μₙ ⊆ (Kˢ)ˣ`: Tau Ceti's
`TauCeti.h2KummerToUnits`. -/
noncomputable abbrev h2KummerToUnits (K : Type u) [Field K] (n : ℕ) :=
  TauCeti.h2KummerToUnits K n

/-- **The open subgroup `G_L ≤ G_K`** cut out by a `K`-embedding `σ` of a finite extension `L`
into `Kˢ`: the subgroup fixing `σ L`, Tau Ceti's `TauCeti.galoisSubgroup`. -/
noncomputable abbrev galoisSubgroup (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (σ : L →ₐ[K] SeparableClosure K) :
    OpenSubgroup (AbsoluteGaloisGroup K) :=
  TauCeti.galoisSubgroup K L σ

/-- **The index of `G_L` in `G_K` is the degree** `[L : K]`: Tau Ceti's
`TauCeti.galoisSubgroup_index`. -/
theorem galoisSubgroup_index (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (σ : L →ₐ[K] SeparableClosure K) :
    (galoisSubgroup K L σ).toSubgroup.index = Module.finrank K L :=
  TauCeti.galoisSubgroup_index K L σ

/-! ## Layer 11: cohomological dimension -/

/-- **`cd_p G`**, the `p`-cohomological dimension in `ℕ∞` of a topological group `G : Type u`,
with coefficients in `Type u`: Tau Ceti's `TauCeti.cohomologicalDimensionAt.{u}`. -/
noncomputable abbrev cd_p (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : ℕ∞ :=
  TauCeti.cohomologicalDimensionAt.{u} p G

/-- **`scd_p G`**, the strict `p`-cohomological dimension, read like `cd_p`: Tau Ceti's
`TauCeti.strictCohomologicalDimensionAt.{u}`. -/
noncomputable abbrev scd_p (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : ℕ∞ :=
  TauCeti.strictCohomologicalDimensionAt.{u} p G

section UniverseIndependence

open TauCeti

/-- **`cd_p` does not depend on the extra coefficient universe.** For a topological group
`G : Type u`, Tau Ceti's `cohomologicalDimensionAt.{v} p G` quantifies over discrete
`p`-primary coefficient modules in `Type (max u v)`. At `v = u` and at `v = 0` these are the same
modules in `Type u`, but the two canonical cohomology objects `continuousCohomology i M` are
formed with different universe parameters and are not definitionally equal. The theorem says the
two invariants agree. Route: an isomorphism of the homogeneous cochain complexes of
`ofDiscreteModule ℤ G M` at the two parameters, the identity on `M` in resolution degree zero and
postcomposition with the previous degree's isomorphism on `C(G, -)` after that, followed by its
homology classes. -/
theorem cohomologicalDimensionAt_universe_eq (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] :
    cohomologicalDimensionAt.{u} p G = cohomologicalDimensionAt.{0} p G := by
  sorry

/-- **`scd_p` does not depend on the extra coefficient universe**, for the same reason and by
the same comparison as `cohomologicalDimensionAt_universe_eq`. The comparison isomorphisms are
additive, so they preserve `p`-primary components. -/
theorem strictCohomologicalDimensionAt_universe_eq (p : ℕ) (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] :
    strictCohomologicalDimensionAt.{u} p G = strictCohomologicalDimensionAt.{0} p G := by
  sorry

end UniverseIndependence

/-- **`V^ab(p)`**, the maximal pro-`p` quotient of the topological abelianization of a subgroup
`V`, with the conjugation action of `G ⧸ V` for normal `V`: Tau Ceti's
`TauCeti.abelianizationProP`. -/
abbrev abelianizationProP (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (V : Subgroup G) : Type u :=
  TauCeti.abelianizationProP p G V

/-- **The class `u_{G/V}(p) ∈ H²(G ⧸ V, V^ab(p))`** of the extension
`1 → V^ab(p) → G ⧸ [V, V]‾ V(p) → G ⧸ V → 1`, for an open normal `V`: the class of the factor set
of the representatives `Quotient.out`, Tau Ceti's `TauCeti.abelianizationProPClass`. -/
noncomputable abbrev abelianizationProPClass (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (V : Subgroup G) [V.Normal] (hV : IsOpen (V : Set G)) :=
  TauCeti.abelianizationProPClass p G V hV

/-- **NSW (3.6.4), degree two.** For a prime `p`, a profinite group `G` with `scd_p G ≤ 2` and an
open normal subgroup `V`, the class `u_{G/V}(p)` generates `H²(G ⧸ V, V^ab(p))`, and that group
has order `p ^ v_p(#(G ⧸ V))`, the `p`-part of the index. When `p` does not divide the index both
sides are trivial. -/
theorem abelianizationProPClass_generates (p : ℕ) [Fact p.Prime] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : scd_p p G ≤ 2) (V : Subgroup G) [V.Normal] (hV : IsOpen (V : Set G)) :
    AddSubgroup.zmultiples (abelianizationProPClass p G V hV) = ⊤ ∧
      Nat.card (H2 (G ⧸ V) (Additive (abelianizationProP p G V))) =
        p ^ padicValNat p (Nat.card (G ⧸ V)) := by
  sorry

/-! ## Layer 12: the graded cup product in all degrees -/

/-- **A coefficient pairing** `X × Y → Z`: an `R`-bilinear map of the underlying modules that is
jointly continuous and `G`-equivariant, Tau Ceti's `TauCeti.TopPairing` with its fields `bil`,
`cont` and `equivariant`. -/
abbrev TopPairing {R : Type v} [CommRing R] [TopologicalSpace R] {G : Type u} [Group G]
    (X Y Z : TopRep R G) : Type _ :=
  TauCeti.TopPairing X Y Z

/-- **Transport along an equality of degrees** `m = n`, `Hᵐ(G, X) → Hⁿ(G, X)`. The cup product
lands in degree `m + n`, and a consumer that needs the value in a numeral degree (`1 + 1` read as
`2`) reads it through this map. -/
noncomputable def degreeCast {R : Type v} [CommRing R] [TopologicalSpace R] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] {m n : ℕ} (h : m = n) (X : TopRep R G) :
    (continuousCohomologyFunctor R G m).obj X →
      (continuousCohomologyFunctor R G n).obj X :=
  fun x => h ▸ x

/-- **The cup product in bidegree `(m, n)`** for a coefficient pairing `P : X × Y → Z`, read as a
function `Hᵐ(G, X) → Hⁿ(G, Y) → H^{m+n}(G, Z)`: Tau Ceti's bilinear `TauCeti.TopPairing.cup`
applied to its two arguments.

Its laws are Tau Ceti's, as `README.md` Layer 12 lists them: the Alexander–Whitney pairing on the
resolution (`TauCeti.TopPairing.resolutionCupPairing_apply_zero`,
`TauCeti.TopPairing.resolutionCupPairing_apply_succ`,
`TauCeti.TopPairing.continuous_resolutionCupPairing`, `TauCeti.TopPairing.resolutionCupPairing_ρ`),
the Leibniz identity `TauCeti.TopPairing.cupCochain_leibniz`, the unit
(`TauCeti.TopPairing.cup_one_left`, `TauCeti.TopPairing.cup_one_right`), associativity
(`TauCeti.TopPairing.cupCochain_assoc`, `TauCeti.TopPairing.cup_assoc`), graded commutativity
through the homotopy formula `TauCeti.TopPairing.d_cupOne` (`TauCeti.TopPairing.cup_gradedComm`),
compatibility with restriction, inflation and compatible pairs (`TauCeti.TopPairing.cup_res`,
`TauCeti.TopPairing.cup_infl`, `TauCeti.TopPairing.cup_map`) and the projection formula
`TauCeti.TopPairing.cup_projection`. -/
noncomputable def cup {R : Type v} [CommRing R] [TopologicalSpace R] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] {X Y Z : TopRep R G} (P : TopPairing X Y Z)
    (m n : ℕ) :
    (continuousCohomologyFunctor R G m).obj X →
      (continuousCohomologyFunctor R G n).obj Y →
        (continuousCohomologyFunctor R G (m + n)).obj Z :=
  fun a b => TauCeti.TopPairing.cup P m n a b

/-- **The cup product is additive in its first argument**, because Tau Ceti's
`TauCeti.TopPairing.cup` is bilinear. -/
theorem cup_add_left {R : Type v} [CommRing R] [TopologicalSpace R] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] {X Y Z : TopRep R G} (P : TopPairing X Y Z)
    (m n : ℕ) (a a' : (continuousCohomologyFunctor R G m).obj X)
    (b : (continuousCohomologyFunctor R G n).obj Y) :
    cup P m n (a + a') b = cup P m n a b + cup P m n a' b :=
  LinearMap.map_add₂ (TauCeti.TopPairing.cup P m n) a a' b

/-- **Naturality of the cup product in the coefficients** (NSW (1.4.2)): for pairings
`P : X × Y → Z` and `P' : X' × Y' → Z'` and morphisms `f : X ⟶ X'`, `g : Y ⟶ Y'`, `h : Z ⟶ Z'`
with `h (P x y) = P' (f x) (g y)`, `h_* (a ⌣_P b) = f_* a ⌣_{P'} g_* b`. Tau Ceti's
`TauCeti.TopPairing.cup_coeffMap`. -/
theorem cup_coeffMap {R : Type v} [CommRing R] [TopologicalSpace R] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] {X Y Z : TopRep R G} (P : TopPairing X Y Z)
    {X' Y' Z' : TopRep R G} (P' : TopPairing X' Y' Z') (f : X ⟶ X') (g : Y ⟶ Y') (h : Z ⟶ Z')
    (hcompat : ∀ (x : X.V) (y : Y.V), h (P.bil x y) = P'.bil (f x) (g y)) (m n : ℕ)
    (a : (continuousCohomologyFunctor R G m).obj X)
    (b : (continuousCohomologyFunctor R G n).obj Y) :
    (coeffMap R h (m + n)).hom (cup P m n a b) =
      cup P' m n ((coeffMap R f m).hom a) ((coeffMap R g n).hom b) :=
  TauCeti.TopPairing.cup_coeffMap P P' f g h hcompat m n a b

/-! ## Layer 13: the Evens norm -/

/-- **The trivial `𝔽₂` coefficient object** over `G`, with carrier `ULift (ZMod 2)` in the universe
of `G` and trivial action: Tau Ceti's `TauCeti.trivialF2`. -/
noncomputable abbrev trivialF2 (G : Type u) [Group G] : TopRep ℤ G :=
  TauCeti.trivialF2 G

/-- **Multiplication on `𝔽₂`** as a coefficient pairing of the trivial `𝔽₂` object with itself:
Tau Ceti's `TauCeti.trivialF2TopPairing`. -/
noncomputable abbrev f2Pairing (G : Type u) [Group G] :
    TopPairing (trivialF2 G) (trivialF2 G) (trivialF2 G) :=
  TauCeti.trivialF2TopPairing G

/-- **The class in `H¹(H, 𝔽₂)` of a continuous homomorphism** `α : H → 𝔽₂`; with trivial `𝔽₂`
coefficients every degree-one class is of this form. Tau Ceti's
`TauCeti.ContCohomology.homClass`. -/
noncomputable abbrev homClass (H : Type u) [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (α : H →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    continuousCohomology 1 (trivialF2 H) :=
  TauCeti.ContCohomology.homClass H α hα

/-- **The homogeneous 2-cochain of an inhomogeneous one**: a continuous `f : G × G → 𝔽₂` as the
homogeneous cochain `(g₀, g₁, g₂) ↦ f (g₀⁻¹ g₁, g₁⁻¹ g₂)` of the trivial `𝔽₂` object. Tau Ceti's
`TauCeti.ContCohomology.inhomogeneousCochain2`. -/
noncomputable abbrev inhomogeneousCochain2 (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (f : G × G → ZMod 2) (hf : Continuous f) :
    (_root_.TopRep.homogeneousCochains (trivialF2 G)).X 2 :=
  TauCeti.ContCohomology.inhomogeneousCochain2 f hf

/-- **The trivial-action 2-cocycle identity makes the homogeneous cochain a cocycle**:
`f (g h, k) + f (g, h) = f (h, k) + f (g, h k)` for all `g, h, k` gives
`d (inhomogeneousCochain2 G f hf) = 0`. Tau Ceti's
`TauCeti.ContCohomology.inhomogeneousCochain2_d_eq_zero`. -/
theorem inhomogeneousCochain2_d_eq_zero (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (f : G × G → ZMod 2) (hf : Continuous f)
    (hcocycle : ∀ g h j : G, f (g * h, j) + f (g, h) = f (h, j) + f (g, h * j)) :
    ((_root_.TopRep.homogeneousCochains (trivialF2 G)).d 2 3).hom
      (inhomogeneousCochain2 G f hf) = 0 :=
  TauCeti.ContCohomology.inhomogeneousCochain2_d_eq_zero f hf hcocycle

/-- **Cohomologous inhomogeneous 2-cocycles have the same class**: if
`f (g, h) = f' (g, h) + (ψ h - ψ (g h) + ψ g)` for a continuous `ψ : G → 𝔽₂`, the classes of `f`
and `f'` in `H²(G, 𝔽₂)` agree. Tau Ceti's
`TauCeti.ContCohomology.cochainClass_inhomogeneousCochain2_eq_of_coboundary`. -/
theorem cochainClass_inhomogeneousCochain2_eq_of_coboundary (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] (f f' : G × G → ZMod 2)
    (hf : Continuous f) (hf' : Continuous f')
    (hcf : ∀ g h j : G, f (g * h, j) + f (g, h) = f (h, j) + f (g, h * j))
    (hcf' : ∀ g h j : G, f' (g * h, j) + f' (g, h) = f' (h, j) + f' (g, h * j))
    (ψ : G → ZMod 2) (hψ : Continuous ψ)
    (hfψ : ∀ g h : G, f (g, h) = f' (g, h) + (ψ h - ψ (g * h) + ψ g)) :
    cochainClass ℤ (trivialF2 G) 2 (inhomogeneousCochain2 G f hf)
        (inhomogeneousCochain2_d_eq_zero G f hf hcf) =
      cochainClass ℤ (trivialF2 G) 2 (inhomogeneousCochain2 G f' hf')
        (inhomogeneousCochain2_d_eq_zero G f' hf' hcf') :=
  TauCeti.ContCohomology.cochainClass_inhomogeneousCochain2_eq_of_coboundary f f' hf hf' ψ hψ
    hfψ _ _

/-- **The wreath product `C₂ ≀ C₂`**, the dihedral group of order 8, as Mathlib's regular wreath
product of `Multiplicative (ZMod 2)` by itself: Tau Ceti's `TauCeti.WreathC2`. -/
abbrev WreathC2 : Type :=
  TauCeti.WreathC2

namespace WreathC2

/-- The first coordinate of `g ∈ C₂ ≀ C₂`, the value of its base function at `1`: Tau Ceti's
`TauCeti.WreathC2.coordA`. -/
abbrev coordA (g : WreathC2) : ZMod 2 :=
  TauCeti.WreathC2.coordA g

/-- The second coordinate, the value of the base function at the generator: Tau Ceti's
`TauCeti.WreathC2.coordB`. -/
abbrev coordB (g : WreathC2) : ZMod 2 :=
  TauCeti.WreathC2.coordB g

/-- The third coordinate, the image in the top factor: Tau Ceti's `TauCeti.WreathC2.coordC`. -/
abbrev coordC (g : WreathC2) : ZMod 2 :=
  TauCeti.WreathC2.coordC g

/-- **The section of `D₁₆ → C₂ ≀ C₂` on coordinates**: `(a, b, c)`, the element `(us)^i s^j` of
`C₂ ≀ C₂` with `u s = (1, 0, 1)` and `s = (0, 0, 1)`, goes to `r^i f^j` in Mathlib's
`DihedralGroup 8`, with `r = r 1` and `f = sr 0`, so that `r^i f = sr (-i)`. -/
def sectionTable : ZMod 2 → ZMod 2 → ZMod 2 → DihedralGroup 8
  | 0, 0, 0 => .r 0
  | 1, 0, 1 => .r 1
  | 1, 1, 0 => .r 2
  | 0, 1, 1 => .r 3
  | 0, 0, 1 => .sr 0
  | 1, 0, 0 => .sr 7
  | 1, 1, 1 => .sr 6
  | 0, 1, 0 => .sr 5

end WreathC2

/-- **The quotient map `D₁₆ → C₂ ≀ C₂`**, `r ↦ (1, 0, 1)` and `f = sr 0 ↦ (0, 0, 1)`, with kernel
the centre `{1, r⁴}`: Tau Ceti's `TauCeti.dihedralToWreath`. -/
abbrev dihedralToWreath : DihedralGroup 8 →* WreathC2 :=
  TauCeti.dihedralToWreath

/-- **The set-theoretic section of `D₁₆ → C₂ ≀ C₂`** sending `(us)^i s^j` to `r^i f^j` for
`0 ≤ i < 4` and `0 ≤ j < 2`, read through the coordinate table. It agrees pointwise with Tau
Ceti's `TauCeti.wreathSection`. -/
def wreathSection (g : WreathC2) : DihedralGroup 8 :=
  WreathC2.sectionTable (WreathC2.coordA g) (WreathC2.coordB g) (WreathC2.coordC g)

/-- **The `D₁₆` extension cocycle** `c_{D₁₆} : (C₂ ≀ C₂)² → 𝔽₂`, the factor set of the section
`(us)^i s^j ↦ r^i f^j` with values in the centre `{1, r⁴} ≅ 𝔽₂`: Tau Ceti's
`TauCeti.wreathD16Cocycle`. -/
noncomputable abbrev wreathD16Cocycle (q : WreathC2 × WreathC2) : ZMod 2 :=
  TauCeti.wreathD16Cocycle q

/-- **`c_{D₁₆}` is a 2-cocycle** in the trivial-action form of `groupCohomology.IsCocycle₂`: Tau
Ceti's `TauCeti.wreathD16Cocycle_isCocycle`. -/
theorem wreathD16Cocycle_isCocycle (g h j : WreathC2) :
    wreathD16Cocycle (g * h, j) + wreathD16Cocycle (g, h) =
      wreathD16Cocycle (h, j) + wreathD16Cocycle (g, h * j) :=
  TauCeti.wreathD16Cocycle_isCocycle g h j

/-- **The induced homomorphism `Ind α : G → C₂ ≀ C₂`** of `α : U → 𝔽₂`, for `U` of index two and
`s ∉ U`: `γ ↦ ((b₁ γ, b_s γ), χ_U γ)`, with `b₁`, `b_s` the two Shapiro components of `α` and `χ_U`
the character with kernel `U`. Tau Ceti's `TauCeti.ContCohomology.indexTwoInd`. -/
noncomputable abbrev indexTwoInd {G : Type*} [Group G] (U : Subgroup G) (hU : U.index = 2) (s : G)
    (hs : s ∉ U) (α : U →* Multiplicative (ZMod 2)) : G →* WreathC2 :=
  TauCeti.ContCohomology.indexTwoInd U hU s hs α

/-- **The pulled-back `D₁₆` cocycle is continuous** for `U` open and `α` continuous, since
`Ind α` is then locally constant: Tau Ceti's
`TauCeti.ContCohomology.continuous_wreathD16Cocycle_indexTwoInd`. -/
theorem continuous_wreathD16Cocycle_indexTwoInd {G : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (U : OpenSubgroup G) (hU : U.toSubgroup.index = 2) (s : G)
    (hs : s ∉ U) (α : U.toSubgroup →* Multiplicative (ZMod 2)) (hα : Continuous α) :
    Continuous fun q : G × G => wreathD16Cocycle
      (indexTwoInd U.toSubgroup hU s hs α q.1, indexTwoInd U.toSubgroup hU s hs α q.2) :=
  TauCeti.ContCohomology.continuous_wreathD16Cocycle_indexTwoInd U.toSubgroup hU s hs α U.isOpen hα

/-- **The `𝔽₂`-cohomology of `G_L` and of the subgroup `galoisSubgroup K L σ`**, identified in
every degree along the isomorphism of topological groups between them: Tau Ceti's
`TauCeti.galoisF2Iso`. -/
noncomputable abbrev galoisF2Iso (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (σ : L →ₐ[K] SeparableClosure K) (n : ℕ) :=
  TauCeti.galoisF2Iso K L σ n

/-- **Restriction along `L/K`** on `𝔽₂`-cohomology, `Hⁿ(G_K, 𝔽₂) ⟶ Hⁿ(G_L, 𝔽₂)`: restriction to
`galoisSubgroup K L σ` followed by `galoisF2Iso`, Tau Ceti's `TauCeti.galoisRes`. -/
noncomputable abbrev galoisRes (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (σ : L →ₐ[K] SeparableClosure K) (n : ℕ) :
    continuousCohomology n (trivialF2 (AbsoluteGaloisGroup K)) ⟶
      continuousCohomology n (trivialF2 (AbsoluteGaloisGroup L)) :=
  TauCeti.galoisRes K L σ n

/-- **Corestriction along `L/K`** on `𝔽₂`-cohomology, `Hⁿ(G_L, 𝔽₂) ⟶ Hⁿ(G_K, 𝔽₂)`: Tau Ceti's
`TauCeti.galoisCor`. -/
noncomputable abbrev galoisCor (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (σ : L →ₐ[K] SeparableClosure K) (n : ℕ) :
    continuousCohomology n (trivialF2 (AbsoluteGaloisGroup L)) ⟶
      continuousCohomology n (trivialF2 (AbsoluteGaloisGroup K)) :=
  TauCeti.galoisCor K L σ n

/-- **The Evens norm of a quadratic extension**, `H¹(G_L, 𝔽₂) → H²(G_K, 𝔽₂)` for `[L : K] = 2`,
a function and not an additive map: Tau Ceti's `TauCeti.galoisEvens`. -/
noncomputable abbrev galoisEvens (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2) :
    continuousCohomology 1 (trivialF2 (AbsoluteGaloisGroup L)) →
      continuousCohomology 2 (trivialF2 (AbsoluteGaloisGroup K)) :=
  TauCeti.galoisEvens K L σ hdeg

/-- **The conjugate class** `y ↦ res (cor y) - y` on `Hⁿ(G_L, 𝔽₂)`, the value at `y` of Tau Ceti's
`TauCeti.galoisConj`. For Galois `L/K`, so that `G_L` is normal, the double-coset formula makes
`res ∘ cor` the sum of the conjugations by the cosets of `G_L`; for a quadratic `L/K` this is
therefore the action of the nontrivial automorphism, written without choosing an element of `G_K`
outside `G_L`. -/
noncomputable def galoisConj (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (σ : L →ₐ[K] SeparableClosure K) (n : ℕ)
    (y : continuousCohomology n (trivialF2 (AbsoluteGaloisGroup L))) :
    continuousCohomology n (trivialF2 (AbsoluteGaloisGroup L)) :=
  (galoisRes K L σ n).hom ((galoisCor K L σ n).hom y) - y

/-- **The character of a quadratic extension**, the class in `H¹(G_K, 𝔽₂)` of the character of
`G_K` with kernel `G_L`: Tau Ceti's `TauCeti.galoisCharacter`. -/
noncomputable abbrev galoisCharacter (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2) :
    continuousCohomology 1 (trivialF2 (AbsoluteGaloisGroup K)) :=
  TauCeti.galoisCharacter K L σ hdeg

/-- **The Evens norm of a restricted class** (Evens's identity 5 at a quadratic extension): for
`[L : K] = 2` and `y ∈ H¹(G_K, 𝔽₂)`, `N(res y) = y ⌣ y + χ_{L/K} ⌣ y`, where `χ_{L/K}` is
`galoisCharacter`. -/
theorem galoisEvens_galoisRes (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2)
    (y : continuousCohomology 1 (trivialF2 (AbsoluteGaloisGroup K))) :
    galoisEvens K L σ hdeg ((galoisRes K L σ 1).hom y) =
      cup (f2Pairing (AbsoluteGaloisGroup K)) 1 1 y y +
        cup (f2Pairing (AbsoluteGaloisGroup K)) 1 1 (galoisCharacter K L σ hdeg) y := by
  sorry

/-- **The kernel of restriction in degree two** for a quadratic extension:
`ker (res : H²(G_K, 𝔽₂) → H²(G_L, 𝔽₂)) = χ_{L/K} ⌣ H¹(G_K, 𝔽₂)`. Tau Ceti's
`TauCeti.galoisRes_eq_zero_iff`. -/
theorem galoisRes_eq_zero_iff (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] (σ : L →ₐ[K] SeparableClosure K) (hdeg : Module.finrank K L = 2)
    (z : continuousCohomology 2 (trivialF2 (AbsoluteGaloisGroup K))) :
    (galoisRes K L σ 2).hom z = 0 ↔
      ∃ y, z = cup (f2Pairing (AbsoluteGaloisGroup K)) 1 1 (galoisCharacter K L σ hdeg) y :=
  TauCeti.galoisRes_eq_zero_iff K L σ hdeg z

end TauCetiRoadmap.ProfiniteCohomology

end
