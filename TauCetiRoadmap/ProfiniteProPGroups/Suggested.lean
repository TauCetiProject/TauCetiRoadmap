import Mathlib
import TauCeti.Data.ZMod.TrivialAction
import TauCeti.GroupTheory.PLowerCentralSeries
import TauCeti.GroupTheory.Torsion
import TauCeti.NumberTheory.Padics.DyadicUnits
import TauCeti.NumberTheory.Padics.GroupAlgebra.CyclicTwo
import TauCeti.NumberTheory.Padics.PowerSeries
import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.IndexNotDvd
import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.OpenSubgroup
import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.TrivialFp.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.Functoriality
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialFp
import TauCeti.Topology.Algebra.Group.FiniteQuotients
import TauCeti.Topology.Algebra.Group.LowerCentralSeries
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.Basic
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.Subgroup
import TauCeti.Topology.Algebra.Group.OpenSubgroup.TopologicallyFinitelyGenerated
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.DyadicCoordinate
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Filtration
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Map
import TauCeti.Topology.Algebra.Group.Profinite.Completion
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Abelianization
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.CohomologicalDimension
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Duality.Basic
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.LabuteModule.Relator
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.Marked
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.Uniqueness
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.OpenSubgroup
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Orientation
import TauCeti.Topology.Algebra.Group.Profinite.EmbeddingProblem.Projective
import TauCeti.Topology.Algebra.Group.Profinite.FiniteQuotients
import TauCeti.Topology.Algebra.Group.Profinite.Free.BasisModification
import TauCeti.Topology.Algebra.Group.Profinite.Free.ClosedSubgroup
import TauCeti.Topology.Algebra.Group.Profinite.Free.CohomologicalDimension
import TauCeti.Topology.Algebra.Group.Profinite.Free.Graded
import TauCeti.Topology.Algebra.Group.Profinite.Free.OpenSubgroup
import TauCeti.Topology.Algebra.Group.Profinite.Free.PadicInt
import TauCeti.Topology.Algebra.Group.Profinite.Free.Pointed.Rank
import TauCeti.Topology.Algebra.Group.Profinite.Free.Pointed.Serre
import TauCeti.Topology.Algebra.Group.Profinite.Free.Prescription
import TauCeti.Topology.Algebra.Group.Profinite.Free.ProC
import TauCeti.Topology.Algebra.Group.Profinite.Free.Rank
import TauCeti.Topology.Algebra.Group.Profinite.Free.ResiduallyP
import TauCeti.Topology.Algebra.Group.Profinite.Free.Serre
import TauCeti.Topology.Algebra.Group.Profinite.Gaschutz
import TauCeti.Topology.Algebra.Group.Profinite.Generation
import TauCeti.Topology.Algebra.Group.Profinite.Hopfian
import TauCeti.Topology.Algebra.Group.Profinite.Lagrange
import TauCeti.Topology.Algebra.Group.Profinite.MaximalProP
import TauCeti.Topology.Algebra.Group.Profinite.Order
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Burnside
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Extension
import TauCeti.Topology.Algebra.Group.Profinite.ProP.FiniteGeneration
import TauCeti.Topology.Algebra.Group.Profinite.ProP.FixedPoints
import TauCeti.Topology.Algebra.Group.Profinite.ProP.GolodShafarevich
import TauCeti.Topology.Algebra.Group.Profinite.ProP.LowerCentralSeries
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Order
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Prescription.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Rank
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Relation.Module
import TauCeti.Topology.Algebra.Group.Profinite.ProP.StructureTheorem
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Surjective
import TauCeti.Topology.Algebra.Group.Profinite.Rank
import TauCeti.Topology.Algebra.Group.Profinite.Section
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.CohomologicalDimension
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Conjugacy
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Functoriality
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.PadicInt
import TauCeti.Topology.Algebra.Group.TopologicalAbelianization
import TauCeti.Topology.Algebra.GroupExtension.Cohomology
import TauCeti.Topology.Algebra.Module.Compact
import TauCeti.Topology.Compactness.InverseSystem

/-!
# Profinite and pro-`p` groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, together with the few definitions those
statements need. Every headline is proved in Tau Ceti at the pin, so each is a closed proof whose
body is the Tau Ceti theorem, and none carries `sorry`.

The cohomology is Mathlib's `continuousCohomology`, described in low degrees, compared, and
equipped with its exact sequences, change-of-group maps and cup products by the
ProfiniteCohomology roadmap. This file imports no roadmap module: it states the pro-`p` theory
against the Tau Ceti carriers that roadmap's declarations alias (Tau Ceti's
`TauCeti.ofDiscreteModule`, `TauCeti.ContinuousCohomology.res`, `TauCeti.TopPairing`,
`TauCeti.cupFp` and `TauCeti.cohomologicalDimensionAt.{u}` for `G : Type u`, which is
ProfiniteCohomology's `cd_p`), so every statement here is about the same objects. The
coefficient object of the pro-`p` theory is `trivialFp`, the trivial `𝔽_p`-representation, with
`cohomFp` for its cohomology and `fpPairing` for the multiplication pairing that gives the cup
square. The Demushkin predicate, the rank and `q` invariants, and the prescription property that
pins a canonical character are all stated against those objects. Arithmetic identification with
local absolute Galois groups is owned by `LocalGaloisGroups`.

**One implementation.** Tau Ceti implements the foundational layers of this roadmap, and this
file consumes that implementation rather than restating it. Each carrier below that Tau Ceti
provides is a reducible alias of the Tau Ceti declaration (`abbrev IsProP p G := TauCeti.IsProP p
G`, and so on), so a statement about the roadmap name is a statement about the Tau Ceti object,
and every Tau Ceti lemma applies to it. Each milestone that Tau Ceti proves is a closed proof here
whose body is the Tau Ceti theorem. The aliased carriers are the pro-`p` predicate, the pro-`p`
kernel and maximal pro-`p` quotient, Sylow subgroups, topological generation and generator rank,
the Frattini subgroup, the lower `p`-series, classes of finite groups and the pro-`C` kernel, the
free profinite, free pro-`C` and free pro-`p` groups with their generators, the presented profinite
and pro-`p` groups, `ℤ̂`, the principal unit subgroups of `ℤ₂ˣ`, continuous finite quotients, the
trivial `𝔽_p` coefficients, the Demushkin predicate with its rank, `q`-invariant and canonical
character, the prescription property of a continuous character, Labute's relator class and the
character of a Demushkin relator, Labute's commutator, the `ℕ`-indexed generators and the
normal-form words, the dyadic group `D₀` with its marked generators and standard orientation, the completed group algebra
`ℤ_p[[Γ]]`, and the compact modules over it. The topological abelianization is Mathlib's
`TopologicalAbelianization`. The roadmap names are kept because downstream roadmaps cite them.

Other Tau Ceti implementations are used directly under their Tau Ceti names, with no roadmap
alias: the extension dictionary with compact kernel (`TauCeti.ProfiniteGroupExtension`, its class
`contCohomologyClass` and its pushforward `map`, against which Layer 5's lifting lemma is stated);
the finite embedding problems and projectivity of Layer 5 (`TauCeti.FiniteEmbeddingProblem`,
`TauCeti.HasPGroupSolutions`, `TauCeti.levelProblem`, `TauCeti.IsProjective`); the graded pieces of
the lower `p`-series with their bracket and `p`-power operator (`TauCeti.gradedPiece`,
`TauCeti.gradedBracket`, `TauCeti.gradedPow`); the projections, coordinates and functoriality of
the completed group algebra; the conjugation action and the module structure on Labute's relation
module (`TopologicalAbelianization.instMulDistribMulActionQuotient`,
`TauCeti.IsProP.completedGroupAlgebraModule`); and the free pro-`C` groups on pointed spaces
(`TauCeti.freeProCPointed`).

Three generic constructions are deliberately **absent**, with their own exact owner — the
successor roadmap `ProfiniteArithmetic` (README, opening section): the profinite integers as a
topological commutative *ring*, the profinite power with a `ℤ̂` exponent on an arbitrary
profinite group together with its `ℤ_ℓ` comparison, and the continuous automorphism and
outer-automorphism groups. `zHat` below is the profinite *group*, which is all this roadmap's
own milestones use.
-/

namespace TauCetiRoadmap.ProfiniteProPGroups

open CategoryTheory

-- Every cohomological operation below is the Tau Ceti declaration that the ProfiniteCohomology
-- roadmap aliases. This roadmap builds no second carrier and no second operation.

universe u v w

/-! ## The basic objects, consumed from Tau Ceti -/

section Prototypes

variable (p : ℕ)

/-- **Pro-`p`**, in quotient form: each continuous finite quotient, that is each quotient by an
open normal subgroup, is a `p`-group. This is Tau Ceti's `TauCeti.IsProP`; its defining property
is `TauCeti.isProP_iff`. The inverse-limit description is a derived milestone (Layer 3). -/
abbrev IsProP (G : Type u) [Group G] [TopologicalSpace G] : Prop :=
  TauCeti.IsProP p G

/-- **Topological finite generation**: some finite subset generates a dense subgroup. This is
Tau Ceti's `TauCeti.IsTopologicallyFinitelyGenerated`, with defining property
`TauCeti.isTopologicallyFinitelyGenerated_iff`; it is the predicate the reconstruction theorem
(Layer 8) and the downstream consumers use. -/
abbrev IsTopologicallyFinitelyGenerated (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : Prop :=
  TauCeti.IsTopologicallyFinitelyGenerated G

/-- A subset **converges to `1`**: every neighbourhood of `1` omits only finitely many of its
elements. This is Tau Ceti's `TauCeti.ConvergesToOne`. For a profinite group it is enough to test
the open normal subgroups (`TauCeti.convergesToOne_iff_openNormalSubgroup`), and it is the
condition under which a generating set has a well-behaved cardinality (Layer 3). -/
abbrev ConvergesToOne {G : Type u} [Group G] [TopologicalSpace G] (s : Set G) : Prop :=
  TauCeti.ConvergesToOne s

/-- **Topological generator rank, cardinal-valued**: the least cardinality of a subset converging
to `1` and generating a dense subgroup. This is Tau Ceti's `TauCeti.topologicalGeneratorRank`,
the form all general rank theorems take (bases, rank invariance, monotonicity, the infinite-rank
theory of Layer 10). Every profinite group has a generating set converging to `1`
(`TauCeti.exists_convergesToOne_topologicallyGenerates`), so the infimum is over a nonempty family.

⚠ Dropping `ConvergesToOne` changes the invariant: a product of continuum many copies of
`ℤ/p` has a countable dense subgroup but needs `2 ^ ℵ₀` generators converging to `1`. -/
noncomputable abbrev topologicalGeneratorRank (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : Cardinal.{u} :=
  TauCeti.topologicalGeneratorRank G

/-- **Topological generator rank, natural-number accessor**, available exactly when the group
is topologically finitely generated: Tau Ceti's `TauCeti.topologicalGeneratorRankNat`. Every
numerical rank statement (finite presentations, deficiency, the Schreier and Euler formulas,
anything involving subtraction) is about this declaration, never about `topologicalGeneratorRank`.
The two are tied together by `TauCeti.topologicalGeneratorRankNat_eq_topologicalGeneratorRank`. -/
noncomputable abbrev topologicalGeneratorRankNat (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (h : IsTopologicallyFinitelyGenerated G) : ℕ :=
  TauCeti.topologicalGeneratorRankNat G h

/-- The **pro-`p` kernel**: the intersection of the open normal subgroups with `p`-group
quotient, Tau Ceti's `TauCeti.proPKernel`, with membership criterion `TauCeti.mem_proPKernel_iff`
and normality instance `TauCeti.proPKernel_normal`. The **maximal pro-`p` quotient** is
`maximalProPQuotient p G`, below; `G(p)` is prose for it, and no other name for either object
appears in this roadmap. -/
abbrev proPKernel (G : Type u) [Group G] [TopologicalSpace G] : Subgroup G :=
  TauCeti.proPKernel p G

/-- The **maximal pro-`p` quotient** `G(p) = G ⧸ proPKernel p G`, Tau Ceti's
`TauCeti.maximalProPQuotient`, with quotient map `TauCeti.maximalProPQuotient.mk`, functoriality
`TauCeti.maximalProPQuotient.map` and universal factorisation `TauCeti.maximalProPQuotient.lift`. -/
abbrev maximalProPQuotient (G : Type u) [Group G] [TopologicalSpace G] : Type u :=
  TauCeti.maximalProPQuotient p G

/-- **`p`-Sylow subgroup of a profinite group**: a closed pro-`p` subgroup whose image in every
continuous finite quotient has index prime to `p`. This is Tau Ceti's `TauCeti.IsProPSylow`, with
defining property `TauCeti.isProPSylow_iff` and projections `TauCeti.IsProPSylow.isClosed`,
`isProP` and `not_dvd_index`; its supernatural-index form is
`TauCeti.isProPSylow_iff_isClosed_and_isProP_and_not_dvd_profiniteIndex` (Layer 1). -/
abbrev IsProPSylow {G : Type u} [Group G] [TopologicalSpace G] (P : Subgroup G) : Prop :=
  TauCeti.IsProPSylow p P

/-- **Supernatural numbers** (Steinitz orders): formal products `∏_p p^(n_p)` with
`n_p ∈ ℕ∞`, recorded as their exponent functions, with multiplication the pointwise sum of
exponents. This is Tau Ceti's `TauCeti.Supernatural`, read as a function of the prime through its
`CoeFun` instance. Divisibility, product, gcd/lcm, and the finite-embedding API are Layer 1. This is
the only use of `ℕ∞` in the roadmap; generator counts are cardinals or naturals, never `ℕ∞`. -/
abbrev Supernatural : Type := TauCeti.Supernatural

/-- The **order** of a profinite group as a supernatural number: at each prime, the supremum
of the `p`-valuations of its continuous finite quotients. This is Tau Ceti's
`TauCeti.profiniteOrder`, evaluated by `TauCeti.profiniteOrder_apply`. -/
noncomputable abbrev profiniteOrder (G : Type u) [Group G] [TopologicalSpace G] : Supernatural :=
  TauCeti.profiniteOrder G

/-- The **index of a closed subgroup**, in the pinned primewise form: at each prime `ℓ`, the
supremum over open normal `N` of `v_ℓ [G/N : HN/N]`. This is Tau Ceti's
`Subgroup.profiniteIndex`. The definition is written for arbitrary `H`, and so is the equivalence
with `lcm {[G : U] | U open, H ≤ U}` (Layer 1, Tau Ceti's
`Subgroup.profiniteIndex_eq_iSup_openSubgroup`): replacing `H` by its closure changes neither the
images `HN/N` in the finite quotients nor the set of open subgroups containing `H`
(`Subgroup.profiniteIndex_topologicalClosure`). Closedness is a hypothesis only where the index is
compared with `H` itself, as in `Subgroup.profiniteIndex_eq_one_iff`. -/
noncomputable abbrev profiniteIndex {G : Type u} [Group G] [TopologicalSpace G]
    (H : Subgroup G) : Supernatural :=
  H.profiniteIndex

/-- The **Frattini subgroup of a pro-`p` group**, in index-`p` form: the intersection of the open
normal subgroups of index `p`. This is Tau Ceti's `TauCeti.proPFrattini`, with normality instance
`TauCeti.proPFrattini_normal`, closedness `TauCeti.isClosed_proPFrattini`, and its verbal form
`closure (Gᵖ[G,G])` in `TauCeti.proPFrattini_eq_topologicalClosure`; the definition makes sense
for any topological group. For a compact pro-`p` group it is the intersection of the maximal open
subgroups (`TauCeti.IsProP.proPFrattini_eq_iInf_isCoatom`), each of which is normal
(`TauCeti.IsProP.normal_of_isCoatom`). -/
abbrev proPFrattini (G : Type u) [Group G] [TopologicalSpace G] : Subgroup G :=
  TauCeti.proPFrattini p G

/-- The topological closure of a normal subgroup is normal, wrapping Mathlib's
`Subgroup.is_normal_topologicalClosure`, which is deliberately not an instance there. We make
it a **scoped** instance rather than a global one: it fires on every `topologicalClosure`
goal, and a global instance would compete with more specific ones in downstream files. Anyone
who wants the convenience writes `open scoped TauCetiRoadmap.ProfiniteProPGroups`. -/
scoped instance normal_topologicalClosure {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (N : Subgroup G) [N.Normal] : N.topologicalClosure.Normal :=
  Subgroup.is_normal_topologicalClosure N

/-- One step of the **lower `p`-series**: `H ↦ closure (Hᵖ ⬝ [H, G])`, the topological
closure of the subgroup generated by the `p`-th powers from `H` and the commutators
`[H, G]`. This is Tau Ceti's `TauCeti.pLowerCentralStep`, characterized by
`TauCeti.pLowerCentralStep_le_iff`. -/
abbrev pLowerCentralStep {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (H : Subgroup G) : Subgroup G :=
  TauCeti.pLowerCentralStep p H

/-- The **lower `p`-series** (descending `p`-central series), 0-based to match Mathlib's
`lowerCentralSeries`: `λ₀ = G`, `λ_{k+1} = closure (λ_kᵖ [λ_k, G])`. This is Tau Ceti's
`TauCeti.pLowerCentralSeries`, whose terms are closed normal subgroups. Labute's `F_i`
(1-based) is `pLowerCentralSeries p F (i - 1)`; his `F₃` is our `λ₂`. -/
abbrev pLowerCentralSeries (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    ℕ → Subgroup G :=
  TauCeti.pLowerCentralSeries p G

end Prototypes

/-! ### The class `C` of finite groups, as a structure

Not a loose predicate: the completion, the `C`-kernel, and the free pro-`C` group are all
defined from this data, and `finiteGroupClassP` instantiates it at finite `p`-groups. The
structure, its `p`-group instance, the `C`-kernel and the pro-`C` predicate are Tau Ceti's
(`TauCeti.FiniteGroupClass`, `TauCeti.finiteGroupClassP`, `TauCeti.proCKernel`,
`TauCeti.IsProC`), and so are the comparisons `TauCeti.isProC_finiteGroupClassP_iff` and
`TauCeti.proCKernel_finiteGroupClassP_eq_proPKernel` with the pro-`p` objects. Closure under
finite products is a consequence of `mem_trivial` and `mem_extension`, so it is a theorem rather
than a field. -/

/-- A **class of finite groups** closed under isomorphism, subgroups, quotients, and
extensions: the data a pro-`C` completion needs. This is Tau Ceti's `TauCeti.FiniteGroupClass`.
Universe-polymorphic in the groups it speaks about; the resizing policy of `README.md` (transport
a higher-universe finite group through `Shrink`, which is harmless by `mem_congr`) is what
relates the instantiations at different universes, and Tau Ceti's
`TauCeti.FiniteGroupClass.MemFinite` implements it. -/
abbrev FiniteGroupClass : Type (w + 1) := TauCeti.FiniteGroupClass.{w}

/-- Finite `p`-groups, the instantiation everything in Layers 4–9 uses: Tau Ceti's
`TauCeti.finiteGroupClassP`. -/
abbrev finiteGroupClassP (p : ℕ) : FiniteGroupClass.{u} := TauCeti.finiteGroupClassP p

/-- The **`C`-kernel**: the intersection of the open normal subgroups whose quotient lies in
the class, Tau Ceti's `TauCeti.proCKernel`. `proCKernel (finiteGroupClassP p) G = proPKernel p G`
is `TauCeti.proCKernel_finiteGroupClassP_eq_proPKernel`. -/
abbrev proCKernel (C : FiniteGroupClass.{u}) (G : Type u) [Group G] [TopologicalSpace G] :
    Subgroup G :=
  TauCeti.proCKernel C G

/-- **Pro-`C`, in quotient form**, the exact analogue of `IsProP` for a class `C`: each
continuous finite quotient lies in the class. This is Tau Ceti's `TauCeti.IsProC`; `IsProP p` is
the case `C = finiteGroupClassP p` (`TauCeti.isProC_finiteGroupClassP_iff`). This is the
predicate the free pro-`C` universal property is stated against; without it that universal
property cannot say what its targets are. -/
abbrev IsProC (C : FiniteGroupClass.{u}) (G : Type u) [Group G] [TopologicalSpace G] : Prop :=
  TauCeti.IsProC C G

/-! ## Free objects, presentations, and the dyadic instance, consumed from Tau Ceti -/

section FreeObjects

variable (p : ℕ)

/-- The **free profinite group** on `X`: the profinite completion of the discrete free group.
This is Tau Ceti's `TauCeti.freeProfiniteGroup`, pinned by its universal property
`TauCeti.freeProfiniteGroup.existsUnique_lift`. -/
noncomputable abbrev freeProfiniteGroup (X : Type u) : ProfiniteGrp.{u} :=
  TauCeti.freeProfiniteGroup X

/-- The generators of the free profinite group, Tau Ceti's `TauCeti.freeProfiniteGroup.of`. -/
noncomputable abbrev freeProfiniteGroup.of {X : Type u} (x : X) : freeProfiniteGroup X :=
  TauCeti.freeProfiniteGroup.of x

/-- The **free pro-`C` group** on `X`: the `C`-completion of the free profinite group, Tau Ceti's
`TauCeti.freeProC`. -/
noncomputable abbrev freeProC (C : FiniteGroupClass.{u}) (X : Type u) : Type u :=
  TauCeti.freeProC C X

/-- The generators of the free pro-`C` group, Tau Ceti's `TauCeti.freeProC.of`. -/
noncomputable abbrev freeProC.of {C : FiniteGroupClass.{u}} {X : Type u} (x : X) :
    freeProC C X :=
  TauCeti.freeProC.of x

/-- The **free pro-`p` group** on `X`: the maximal pro-`p` quotient of the free profinite
group (equivalently, the pro-`p` completion of the discrete free group). This is Tau Ceti's
`TauCeti.freeProP`. That it agrees with `freeProC (finiteGroupClassP p) X` is Tau Ceti's
`TauCeti.freeProC.equivFreeProP`, a theorem and not a coincidence. -/
noncomputable abbrev freeProP (X : Type u) : Type u :=
  TauCeti.freeProP p X

/-- The generators of the free pro-`p` group, Tau Ceti's `TauCeti.freeProP.of`. -/
noncomputable abbrev freeProP.of {X : Type u} (x : X) : freeProP p X :=
  TauCeti.freeProP.of x

/-- The profinite group **presented** by generators `X` and relators `rels`: the free
profinite group modulo the *closed* normal closure of the relators, Tau Ceti's
`TauCeti.presentedProfiniteGroup`. This is the abstract presentation object; it is distinct from
`presentedProP` below, which first restricts to the pro-`p` category. -/
noncomputable abbrev presentedProfiniteGroup (X : Type u)
    (rels : Set (freeProfiniteGroup X)) : Type u :=
  TauCeti.presentedProfiniteGroup X rels

/-- The canonical projection onto the presented profinite group, Tau Ceti's continuous
`TauCeti.presentedProfiniteGroup.mk`. The universal property is a statement about factoring
**through it** (`TauCeti.presentedProfiniteGroup.existsUnique_lift`). -/
noncomputable abbrev presentedProfiniteGroup.mk {X : Type u} (rels : Set (freeProfiniteGroup X)) :
    freeProfiniteGroup X →ₜ* presentedProfiniteGroup X rels :=
  TauCeti.presentedProfiniteGroup.mk rels

/-- The pro-`p` group **presented** by generators `X` and relators `rels`: the free pro-`p`
group modulo the *closed* normal closure of the relators (closedness is what keeps the
quotient profinite; the algebraic normal closure need not be closed). This is Tau Ceti's
`TauCeti.presentedProP`. A topologically finitely generated pro-`p` group is a continuous image of
a free pro-`p` group of finite rank (`TauCeti.IsProP.exists_surjective_freeProP`). For a minimal
presentation with relation subgroup `R ≤ Φ(F)`, `H²(G, 𝔽_p)` has `p ^ d(R/Rᵖ[R, F])` elements
(`TauCeti.presentedProP.natCard_H2`, with `TauCeti.presentedProP.natCard_H2_le_pow_iff` and the
finiteness criterion `TauCeti.presentedProP.finite_H2_iff`), and that count is the same for any
two minimal presentations
(`TauCeti.presentedProP.topologicalGeneratorRankNat_quotient_pLowerCentralStep_eq`). -/
noncomputable abbrev presentedProP (X : Type u) (rels : Set (freeProP p X)) : Type u :=
  TauCeti.presentedProP p X rels

/-- The canonical projection onto the presented pro-`p` group, Tau Ceti's continuous
`TauCeti.presentedProP.mk`. -/
noncomputable abbrev presentedProP.mk {X : Type u} (rels : Set (freeProP p X)) :
    freeProP p X →ₜ* presentedProP p X rels :=
  TauCeti.presentedProP.mk p rels

/-- **`D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y) = 1⟩`**, the standard rank-3, `q = 2` Demushkin group,
defined intrinsically as a presented pro-`2` group on Tau Ceti's relator `TauCeti.d0Relator`, written
in Labute's commutator convention `(x, y) = x⁻¹y⁻¹xy`: Tau Ceti's `TauCeti.demushkinD0`. -/
noncomputable abbrev demushkinD0 : Type := TauCeti.demushkinD0

/-- The **topological abelianization** `G^{ab} = G ⧸ closure [G,G]`, the profinite
abelianization when `G` is profinite and the home of the `q`-invariant. This is Mathlib's
`TopologicalAbelianization`. -/
abbrev topAbelianization (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    Type u :=
  TopologicalAbelianization G

/-- `ℤ̂`, the profinite completion of `ℤ` (a stress-test object for Layers 0–2): Tau Ceti's
`TauCeti.zHat`, read as a type.
⚠ This is the profinite **group** only. The commutative ring structure on `ℤ̂`, the profinite
power `x ^ᶻ a` it makes sense of, and the `ℤ_ℓ` comparison of that power are owned by the
successor roadmap `ProfiniteArithmetic`, not by this one; no milestone here uses them. -/
noncomputable abbrev zHat : Type := TauCeti.zHat

end FreeObjects

/-! ### The closed subgroups of `ℤ₂ˣ` (Layer 7)

Named forms for the three families of Labute's trichotomy. `U^(f) = 1 + 2^f ℤ₂` is the
kernel of reduction mod `2^f`; the convention `f = ∞`, meaning `{1}`, is the subgroup `⊥` and
is not a value of these `ℕ`-indexed definitions. The two unit subgroups are Tau Ceti's, and so is
the classification of the closed subgroups of `ℤ₂ˣ`
(`TauCeti.closedSubgroup_units_two_classification`). -/

/-- `U^(f) = 1 + 2^f ℤ₂`, the principal unit subgroup of level `f`: Tau Ceti's
`TauCeti.unitsPrincipal` at `p = 2`. -/
noncomputable abbrev unitsPrincipal (f : ℕ) : Subgroup ℤ_[2]ˣ :=
  TauCeti.unitsPrincipal 2 f

/-- `{±1} × U^(f)`, the subgroup generated by `-1` together with `U^(f)`: Tau Ceti's
`TauCeti.unitsPlusMinus`. At `f = ∞` this degenerates to `{±1} = Subgroup.zpowers (-1)`, which the
trichotomy lists separately. -/
noncomputable abbrev unitsPlusMinus (f : ℕ) : Subgroup ℤ_[2]ˣ :=
  TauCeti.unitsPlusMinus f

/-- The closed subgroup topologically generated by a single unit,
`(Subgroup.zpowers u).topologicalClosure`, the form in which Tau Ceti's classification of the
closed subgroups of `ℤ₂ˣ` writes it. Labute's
`U^[f] = closure ⟨-1 + 2^f⟩` (`2 ≤ f < ∞`) is `procyclicClosure u` for the unit `u` with
`(u : ℤ_[2]) = -1 + 2 ^ f`; naming the generator rather than building it keeps the definition
free of an `IsUnit` side condition. -/
noncomputable abbrev procyclicClosure (u : ℤ_[2]ˣ) : Subgroup ℤ_[2]ˣ :=
  (Subgroup.zpowers u).topologicalClosure

/-! ### Occurring as a continuous finite quotient (Layer 8)

Phrased through the kernel rather than through a topology on `Q`: a homomorphism to a finite
*discrete* group is continuous exactly when its kernel is open. That keeps the predicate
manifestly invariant under isomorphism of `Q` and lets the reconstruction theorem quantify
over bundled finite groups instead of over arbitrary topology-bearing types. -/

/-- `Q` occurs as a continuous finite quotient of `G`: Tau Ceti's
`TauCeti.IsFiniteContinuousQuotient`, read at the underlying group of the bundled finite group
`Q`, whose finiteness clause then holds automatically. Topological finite generation passes from
`G` to a profinite `H` each of whose continuous finite quotients occurs for `G`
(`TauCeti.IsTopologicallyFinitelyGenerated.of_forall_isFiniteContinuousQuotient`), the first
step of Layer 8's two-epimorphisms theorem. -/
abbrev IsFiniteContinuousQuotient (G : Type u) [Group G] [TopologicalSpace G]
    (Q : FiniteGrp.{v}) : Prop :=
  TauCeti.IsFiniteContinuousQuotient G Q

/-- **Layer 8, finite-quotient determinacy.** If the profinite group `G` is topologically finitely
generated and the profinite group `H` has the same continuous finite quotients as `G`, then `G` and
`H` are topologically isomorphic. No finite-generation hypothesis is placed on `H`: it is derived
(`TauCeti.IsTopologicallyFinitelyGenerated.of_forall_isFiniteContinuousQuotient`). The route is the
two epimorphisms and the Hopf property of Layer 3; it is Tau Ceti's
`TauCeti.nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff`, which quantifies
over unbundled finite groups, read here on bundled ones. -/
theorem nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff
    {G H : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [TotallyDisconnectedSpace H] (hG : IsTopologicallyFinitelyGenerated G)
    (h : ∀ Q : FiniteGrp.{u}, IsFiniteContinuousQuotient G Q ↔ IsFiniteContinuousQuotient H Q) :
    Nonempty (G ≃ₜ* H) :=
  TauCeti.nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff hG
    fun Q _ _ => h (FiniteGrp.of Q)

/-! ## Layer 5: the coefficient objects, over the imported carrier

The cohomology is Mathlib's `continuousCohomology`. The Profinite Cohomology roadmap owns the
explicit low-degree descriptions, the comparison isomorphisms, the exact sequences, change of
groups, coinduction, Shapiro's lemma, corestriction and the cup products; this roadmap consumes
those declarations. What is fixed here is the coefficient object this roadmap computes with, the
trivial `𝔽_p`-representation, together with the multiplication pairing that gives its cup
square. -/

section Coefficients

/-- The trivial `G`-representation on `𝔽_p`, as an object of the category `TopRep (ZMod p) G`
that the imported cohomology is a functor out of: Tau Ceti's `TauCeti.trivialFp`. Mathlib's
construction puts the coefficients in the universe of the group, so its carrier is
`ULift (ZMod p)` (`TauCeti.trivialFp_V`), identified with `ZMod p` by `TauCeti.trivialFpEquiv`;
the action is trivial (`TauCeti.trivialFp_ρ_apply_apply`). -/
noncomputable abbrev trivialFp (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : TopRep (ZMod p) G :=
  TauCeti.trivialFp p G

/-- **`Hⁿ(G, 𝔽_p)`**, against the imported carrier: Tau Ceti's `TauCeti.cohomFp`, Mathlib's
`continuousCohomology` of `trivialFp`. Every dimension count below is about this object. -/
noncomputable abbrev cohomFp (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (n : ℕ) : TopModuleCat.{u} (ZMod p) :=
  TauCeti.cohomFp p G n

/-- **The multiplication pairing on `𝔽_p`**, as a `TopPairing` of the trivial representation
with itself: Tau Ceti's `TauCeti.fpPairing`. Its cup product in bidegree `(1, 1)`
is the cup square `H¹(G, 𝔽_p) × H¹(G, 𝔽_p) → H²(G, 𝔽_p)` that the Demushkin predicate is
stated against, and there is no second cup product in this roadmap.
The pairing is the multiplication of `ZMod p`, which is `ZMod p`-bilinear, continuous because the
coefficients are discrete, and equivariant because the action is trivial. -/
noncomputable abbrev fpPairing (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] :
    TauCeti.TopPairing (trivialFp p G) (trivialFp p G) (trivialFp p G) :=
  TauCeti.fpPairing p G

/-- **Layer 5, the pairing is multiplication.** The defining equation of `fpPairing`, read
through the identification `TauCeti.trivialFpEquiv` of the carrier with `ZMod p`: Tau Ceti's
`TauCeti.fpPairing_bil_apply`. Without it the pairing would be an arbitrary bilinear map and
every nondegeneracy statement below would be vacuous. It is kept under this name because
`LocalGaloisGroups` consumes it to compare the cup square with the Kummer cup product. -/
theorem fpPairing_bil (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : (trivialFp p G).V) :
    TauCeti.trivialFpEquiv p G ((fpPairing p G).bil a b) =
      TauCeti.trivialFpEquiv p G a * TauCeti.trivialFpEquiv p G b := by
  rw [fpPairing, TauCeti.fpPairing_bil_apply, LinearEquiv.apply_symm_apply]

/-- **Layer 5, the cup square on `H¹(G, 𝔽_p)`.** The bidegree-`(1,1)` cup product at the
pairing above: Tau Ceti's `TauCeti.cupFp`, which is `(TauCeti.fpPairing p G).cup 1 1`
(`TauCeti.cupFp_def`). Every nondegeneracy clause
below is stated against this abbreviation, so all of them are about one operation. -/
noncomputable abbrev cupFp (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : cohomFp p G 1) : cohomFp p G 2 :=
  TauCeti.cupFp p G a b

/-- **Layer 5, graded commutativity of the cup square**, Tau Ceti's `TauCeti.cupFp_gradedComm`, the
specialization of graded commutativity to `fpPairing`, whose opposite pairing is itself because multiplication in
`ZMod p` is commutative. With it, right nondegeneracy of a cup pairing follows from left
nondegeneracy, so the second nondegeneracy clause of `IsDemushkin` becomes a theorem and is
dropped. -/
theorem cupFp_gradedComm (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : cohomFp p G 1) : cupFp p G a b = - cupFp p G b a :=
  TauCeti.cupFp_gradedComm p G a b

end Coefficients

/-! ### Twisted coefficients, and the prescription property

The coefficients `I(χ)/pⁱ` are Tau Ceti's twisted modules `TauCeti.ZModTwist χ i`: the additive
group `ZMod (p ^ i)`, placed in the universe of `G`, on which `g` acts by multiplication by the
scalar `TauCeti.charScalar χ i g`, the truncation of `χ g` modulo `pⁱ`, together with the
equivariant reductions `TauCeti.ZModTwist.reduce` and the short exact sequences
`TauCeti.ZModTwist.shortExact`. A character is a **continuous** homomorphism
`χ : G →ₜ* ℤ_[p]ˣ`, bundled, because the twisted module is a type depending on it and its action
has to be continuous. No second coefficient module and no second cocycle condition is written
here. -/

section Prescription

variable {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]

/-- **The prescription property** (condition 1 of the conventions): every reduction
`H¹(G, I(χ)/pⁱ) → H¹(G, I(χ)/p)`, for `i ≥ 1`, is surjective, so that every continuous crossed
homomorphism with values in `I(χ)/p` is, modulo principal ones, the reduction of one with values
in `I(χ)/pⁱ`. This is Tau Ceti's `TauCeti.HasPrescriptionProperty`, stated on the explicit model
of continuous cohomology; its cochain criterion is `TauCeti.hasPrescriptionProperty_iff`, and the
two cohomological reformulations of Labute Prop. 6 are
`TauCeti.hasPrescriptionProperty_iff_forall_explicitDelta1_eq_zero` and
`TauCeti.hasPrescriptionProperty_iff_forall_injective_explicitCoeff2_mulPow`. It is the property
that pins Serre's canonical character: a Demushkin group has exactly one continuous `χ` with it
(Labute Thm 4), while every continuous character of a free pro-`p` group has it
(`TauCeti.freeProP.hasPrescriptionProperty`). Under the property every reduction
`H¹(G, I(χ)/pⁿ) → H¹(G, I(χ)/pʲ)`, `j ≤ n`, is surjective, not only those onto the bottom level
(`TauCeti.HasPrescriptionProperty.surjective_explicitCoeff1_reduce`). -/
abbrev HasPrescriptionProperty (χ : G →ₜ* ℤ_[p]ˣ) : Prop :=
  TauCeti.HasPrescriptionProperty χ

end Prescription

/-! ## Layer 7: the Demushkin predicate, its rank, and its invariants

The predicate, the rank and the canonical character are Tau Ceti's, stated against the Layer 5
carrier: `cohomFp` and `cupFp` above are the objects its fields mention. -/

section Demushkin

/-- **The Demushkin predicate** (Labute p. 106), Tau Ceti's `TauCeti.IsDemushkin`: `G` is
pro-`p` (field `isProP`), `H¹(G, 𝔽_p)` is finite-dimensional (`finite_cohomFp_one`),
`H²(G, 𝔽_p)` is one-dimensional (`finrank_cohomFp_two`), and the cup square `cupFp` is
nondegenerate on the left and on the right (`cup_separatingLeft`, `cup_separatingRight`). The
predicate is defined on every topological group, and its `isProP` field only constrains the
quotients by open normal subgroups: it does not give compactness or total disconnectedness (an
infinite discrete elementary abelian `2`-group satisfies it). Every theorem about Demushkin groups
therefore carries `[CompactSpace G] [TotallyDisconnectedSpace G]` separately. Finite generation is a consequence
(`TauCeti.IsDemushkin.isTopologicallyFinitelyGenerated`), never an assumption. -/
abbrev IsDemushkin (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : Prop :=
  TauCeti.IsDemushkin p G

/-- **The rank of a Demushkin group**, as a natural number: Tau Ceti's `TauCeti.demushkinRank`,
the topological generator rank. Every numerical statement about Demushkin groups is about this
accessor, and never about an unqualified rank. -/
noncomputable abbrev demushkinRank {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : ℕ :=
  TauCeti.demushkinRank hG

/-- **Labute's `q`-invariant**, Tau Ceti's `TauCeti.demushkinQ`. It is `0` when the topological
abelianization is torsion-free, which is Labute's `q = p^∞` convention, and the order of its
torsion subgroup otherwise. For a Demushkin group the torsion subgroup is finite and cyclic
(`TauCeti.IsDemushkin.nonempty_continuousMulEquiv_topologicalAbelianization`), so this is the `q`
of `G^{ab} ≅ ℤ_p^{n-1} × ℤ/q`. `Nat.card` is `0` on an infinite type, so no finiteness hypothesis
is needed to make the definition total. -/
noncomputable abbrev demushkinQ {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] (hG : IsDemushkin p G) : ℕ :=
  TauCeti.demushkinQ hG

/-- **Layer 7, Labute's Theorem 4: the canonical character exists and is unique.** The
prescription property is Tau Ceti's `TauCeti.HasPrescriptionProperty` of a continuous character,
in the lifting form: every class of `H¹(G, I(χ)/p)` lifts to `H¹(G, I(χ)/pⁱ)` for every `i ≥ 1`.
A Demushkin group has exactly one continuous `χ` with that property (Serre; Labute Thm 4): Tau
Ceti's `TauCeti.IsDemushkin.existsUnique_hasPrescriptionProperty`. -/
theorem existsUnique_hasPrescriptionProperty {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) :
    ∃! χ : G →ₜ* ℤ_[p]ˣ, HasPrescriptionProperty χ :=
  TauCeti.IsDemushkin.existsUnique_hasPrescriptionProperty hG

/-- **The canonical character (orientation) of a Demushkin group**, the unique continuous
`χ : G → ℤ_pˣ` with the prescription property: Tau Ceti's `TauCeti.demushkinCharacter`. Every
statement about the orientation is about this declaration. -/
noncomputable abbrev demushkinCharacter {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : G →ₜ* ℤ_[p]ˣ :=
  TauCeti.demushkinCharacter hG

/-- **Layer 7, the canonical character is the only one.** This is the uniqueness half of
Labute Thm 4 and the abstract normalization exported to downstream applications: a consumer that
exhibits a continuous character with Tau Ceti's prescription property has found the orientation. -/
theorem demushkinCharacter_unique {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) (χ : G →ₜ* ℤ_[p]ˣ) (hpres : HasPrescriptionProperty χ) :
    χ = demushkinCharacter hG :=
  TauCeti.HasPrescriptionProperty.eq_demushkinCharacter hG hpres

/-- **Layer 7, the orientation image is a closed subgroup**, and it is the invariant that the
`q = 2` classification uses in place of `q`. It is the continuous image of the compact `G` in the
Hausdorff group `ℤ_pˣ`. -/
theorem demushkinCharacter_range_isClosed {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) :
    IsClosed (((demushkinCharacter hG).toMonoidHom.range : Subgroup ℤ_[p]ˣ) : Set ℤ_[p]ˣ) := by
  rw [MonoidHom.coe_range, ContinuousMonoidHom.coe_toMonoidHom]
  exact (isCompact_range (demushkinCharacter hG).continuous).isClosed

/-- **Layer 7, the orientation image is an isomorphism invariant.** The transport lemma the
acceptance instances use. -/
theorem demushkinCharacter_range_congr {p G H} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] [Group H]
    [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : IsDemushkin p G) (hH : IsDemushkin p H) (e : G ≃ₜ* H) :
    (demushkinCharacter hG).toMonoidHom.range = (demushkinCharacter hH).toMonoidHom.range :=
  (TauCeti.range_demushkinCharacter_of_equiv hG hH e).symm

end Demushkin

/-! ## Layer 9 prerequisites: the completed group algebra, consumed from Tau Ceti

The orientation image `Γ = Im χ` is procyclic in one branch and `C₂ × ℤ₂` in the other. Both
shapes are needed, and the second is one of the two even-rank families at `q = 2`. The algebra,
its projections, group elements and functoriality, the procyclic and dyadic coordinates, and
evaluation and division of power series are Tau Ceti's, and so are the finite levels of the dyadic
coordinate (`TauCeti.completedGroupAlgebra.proj_dyadicCoordinate_eq_zero_iff`,
`TauCeti.completedGroupAlgebra.ker_proj_comp_dyadicCoordinate`) and their cofinality
(`TauCeti.completedGroupAlgebra.exists_dyadicLevel_le`). This roadmap aliases the algebra under its
name and uses the rest directly. -/

/-- **The completed group algebra** `Λ = ℤ_p[[Γ]] = lim_U ℤ_p[Γ/U]`, the inverse limit over the
open normal subgroups of `Γ`, with the inverse-limit topology: Tau Ceti's
`TauCeti.completedGroupAlgebra ℤ_[p] Γ`. The index set is the open *normal* subgroups, because
`Γ/U` has to be a group for `ℤ_p[Γ/U]` to be a group algebra. The projections are
`TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U : Λ →ₐ[ℤ_[p]] ℤ_[p][Γ ⧸ U]`, the group elements
`TauCeti.completedGroupAlgebra.of ℤ_[p] Γ : Γ →* Λ`, and the functoriality
`TauCeti.completedGroupAlgebra.map`. The ring, algebra, topological-ring, compactness and
total-disconnectedness structures are Tau Ceti's instances, and for commutative `Γ` so is the
commutative ring structure, which extends the ring structure rather than adding a second one. -/
abbrev completedGroupAlgebra (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ] :
    Type u :=
  TauCeti.completedGroupAlgebra ℤ_[p] Γ

/-! ### Compact modules over `Λ`

The modules that occur in Layer 9 are compact totally disconnected topological `Λ`-modules. The
predicate and its API are Tau Ceti's `TauCeti.IsCompactModule`, specialized to `Λ`. -/

/-- **Layer 9, a compact `Λ`-module**: a topological `Λ`-module that is a compact, totally
disconnected topological additive group with continuous scalar action. This is Tau Ceti's
`TauCeti.IsCompactModule` at the ring `Λ = completedGroupAlgebra p Γ`. Over the compact ring `Λ`
these are the inverse limits of finite modules with surjective transition maps. -/
abbrev IsCompactModule (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ]
    (M : Type v) [AddCommGroup M] [Module (completedGroupAlgebra p Γ) M] [TopologicalSpace M] :
    Prop :=
  TauCeti.IsCompactModule (completedGroupAlgebra p Γ) M

/-! ### Labute's relation module, on Tau Ceti's module structure

Labute's §4 arguments do **not** run on the full abelianized relation module `R^{ab}`. His object
(§4 Definition, p. 121) is `E = X/(X, X)` for `X = ker χ ≤ F`, the abelianized kernel of the
orientation *on the free group*, with `Γ = F/X ≅ Im χ` acting by conjugation and `Λ = ℤ_p[[Γ]]`
acting through that. The relator enters through its class `r̄ ∈ E`, since `r ∈ R ⊆ X`.

Every piece of that structure is an existing declaration, and this roadmap builds no second
action and no second scalar multiplication. `E` is `Additive (TopologicalAbelianization χ.ker)`,
Mathlib's topological abelianization written additively; `Γ ≅ Im χ` is Mathlib's
`QuotientGroup.quotientKerEquivRange`; the conjugation action of `Γ` on `E` is Tau Ceti's instance
`TopologicalAbelianization.instMulDistribMulActionQuotient`, jointly continuous; and the
`Λ`-module structure extending it is Tau Ceti's `IsProP.completedGroupAlgebraModule`, for the
pro-`p` group `X/(X, X)` (`IsProP.topologicalAbelianization`).

**The convention for the action.** Tau Ceti's action is Mathlib's, `[y] • [x] = [y x y⁻¹]`
(`TopologicalAbelianization.mk_smul_mk`), while Labute writes `[y] · [x] = [y⁻¹ x y]`; his action
is `[y]⁻¹ • [x]` (`TopologicalAbelianization.mk_inv_smul_mk`). Since `Γ ≅ Im χ` is commutative,
inversion is a continuous automorphism of `Γ`, which `TauCeti.completedGroupAlgebra.map` turns into
an involution `ι` of `Λ`, and Labute's scalar action is `l · ξ = ι l • ξ`. The two module
structures have the same submodules, spans and generating sets, and a coefficient that Labute
writes with `T = γ - 1` is written here with `γ⁻¹ - 1`. The module statements below are in Tau
Ceti's convention with the inversion already applied, so each one names the element of `F` whose
character value its coefficient uses. -/

/-- **`r̄ ∈ E`**, the class of an element `r ∈ X = ker χ` in `E = X/(X, X)`, written additively, for
a continuous character `χ : F → ℤ_pˣ`: Tau Ceti's `TauCeti.labuteRelatorClass`, with values in Tau
Ceti's `TauCeti.labuteE χ`, the additive topological abelianization of `ker χ`. For a relator
`r ∈ R ⊆ X` this is the element every Labute computation is about. -/
noncomputable abbrev labuteRelatorClass {p : ℕ} [Fact p.Prime] {F : Type u} [Group F]
    [TopologicalSpace F] [IsTopologicalGroup F] (χ : F →ₜ* ℤ_[p]ˣ) (r : F)
    (hr : r ∈ (χ : F →* ℤ_[p]ˣ).ker) : TauCeti.labuteE χ :=
  TauCeti.labuteRelatorClass χ r hr

/-- **The character associated with a Demushkin relation** (Labute §4, `χ = χ_r`): the canonical
character of `G = F/(r)` composed with the projection `F ↠ G`, a continuous character of the free
pro-`p` group itself: Tau Ceti's `TauCeti.demushkinRelatorCharacter`. Labute's `X = ker χ` is its
kernel. -/
noncomputable abbrev demushkinRelatorCharacter {p : ℕ} [Fact p.Prime] {n : ℕ}
    {r : freeProP p (Fin n)} (hr : IsDemushkin p (presentedProP p (Fin n) {r})) :
    freeProP p (Fin n) →ₜ* ℤ_[p]ˣ :=
  TauCeti.demushkinRelatorCharacter hr

/-- **The relator lies in `X`**, the kernel of its associated character, so its class `r̄ ∈ E` is
defined: Tau Ceti's `TauCeti.demushkinRelatorCharacter_mem_ker`. -/
theorem demushkinRelatorCharacter_mem_ker {p : ℕ} [Fact p.Prime] {n : ℕ}
    {r : freeProP p (Fin n)} (hr : IsDemushkin p (presentedProP p (Fin n) {r})) :
    r ∈ (demushkinRelatorCharacter hr).toMonoidHom.ker :=
  TauCeti.demushkinRelatorCharacter_mem_ker hr

/-! ### The module statements that the classification uses

With `E` and `Λ` as above, these are the statements Labute's Theorems 5 and 6 run on: the
normalized form of the relator class in each of the two branches of the image of `χ`. The two
branch statements carry Labute's hypotheses: `F` free pro-`2` of even rank `n`, `r ∈ F²(F, F)` a
Demushkin relation, `χ` its associated character, and the branch of `Im χ`. Labute's further
hypothesis `q = 2` is not carried: either branch puts a unit `≡ 3 mod 4` into `Im χ`, which forces
`q = 2`, since for `q ≠ 2` the image lies in `U^(f)` with `2^f = q ≥ 4`, or is trivial.
⚠ The two branch statements are about the element `r̄`: each returns some `z` with `r̄` a multiple
of it, and says nothing about whether `z` is the class of a member of a basis of `F`. That is a
separate statement, false for a general coefficient vector (the vector `(2, T)` over `ℤ₂[[T]]`
above), and it is the basis correction of `README.md`, Layer 9, that the successive approximation
consumes. -/

/-- **Layer 9, the module statement for Labute's Theorem 5**, the branch `Im χ = U^[f]` with
`2 ≤ f < ∞`. For `r` a Demushkin relation in the free pro-`2` group `F` of even rank
`n`, `χ` its associated character (`hχ`; `hrχ` then holds by `demushkinRelatorCharacter_mem_ker`),
and `y ∈ F` with `χ(y) = -(1 + 2^f)`, there is `z ∈ E` with `r̄ = ((1 + 2^f) + ȳ) z`.
This is Labute's `r̄ = (2 + 2^f + T) z̄₁` (§4.1, p. 123), with his `T = γ - 1` for the class `γ` of
the basis element `y₂`, `χ(y₂) = -(1 + 2^f)^{-1}`, rewritten in Tau Ceti's convention: `ι` sends
`(1 + 2^f) + γ` to `(1 + 2^f) + γ⁻¹`, and `γ⁻¹` is the class of any `y` with `χ(y) = -(1 + 2^f)`.
Route (Labute §4.1): a basis `w` with `r = w₁^{2+α}(w₁, w₂)w₃^{2^g}(w₃, w₄)⋯` and `f = v₂(α) < g`
(Layer 9 normal forms); the basis `y₂ = w₂^{a⁻¹}`, `y₄ = w₄ w₂^{-b}` with `(1 + 2^f)^a = 1 + α` and
`(1 + α)^b = 1 - 2^g`; the expression `r̄ = ψ₁(T) ȳ₁ + ψ₂(T) ȳ₃` with
`ψ₁ = 1 + α + (1 + T)^a` and `ψ₂ = 2^g - 1 + (1 + T)^{ab}`; both vanish at `T = -2 - 2^f`, so the
division criterion (`PadicInt.X_sub_C_dvd_iff_aeval_eq_zero`) factors `2 + 2^f + T` out of each, and
`z` is the corresponding combination of `ȳ₁` and `ȳ₃`. ⚠ The hypotheses are Labute's and are not
decoration: without them, at `F = ℤ₂`, `χ` trivial, `Γ = 1` and `r` a generator, the statement
would ask for `1 = (2 + 2^f) z`, impossible modulo `2`. -/
theorem exists_labuteRelatorClass_eq_smul_of_range_eq_procyclicClosure {n : ℕ}
    {r : freeProP 2 (Fin n)} (hr : IsDemushkin 2 (presentedProP 2 (Fin n) {r}))
    (hn : Even n) (hrΦ : r ∈ proPFrattini 2 (freeProP 2 (Fin n)))
    (χ : freeProP 2 (Fin n) →ₜ* ℤ_[2]ˣ) (hχ : χ = demushkinRelatorCharacter hr)
    (hrχ : r ∈ χ.toMonoidHom.ker) {f : ℕ} (hf : 2 ≤ f) {u : ℤ_[2]ˣ}
    (hu : (u : ℤ_[2]) = -1 + 2 ^ f) (hrange : χ.toMonoidHom.range = procyclicClosure u)
    (y : freeProP 2 (Fin n)) (hy : ((χ y : ℤ_[2]ˣ) : ℤ_[2]) = -(1 + 2 ^ f)) :
    haveI := χ.isClosed_ker
    letI := (TauCeti.IsProP.topologicalAbelianization (TauCeti.isProP_freeProP 2 (Fin n))
      χ.toMonoidHom.ker).completedGroupAlgebraModule (freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)
    ∃ z : TauCeti.labuteE χ,
      labuteRelatorClass χ r hrχ =
        (algebraMap ℤ_[2] (completedGroupAlgebra 2 (freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker))
            (1 + 2 ^ f) +
          TauCeti.completedGroupAlgebra.of ℤ_[2] _
            (y : freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)) • z := by
  subst hχ
  exact TauCeti.exists_labuteRelatorClass_eq_smul_of_range_eq_procyclicClosure hr hn hrΦ hf hu
    hrange hy

/-- **Layer 9, the module statement for Labute's Theorem 6**, the branch `Im χ = {±1} × U^(f)` with
`2 ≤ f < ∞`. With `r`, `n` and `χ` as in the previous statement, `s ∈ F` with `χ(s) = -1` and
`y ∈ F` with `χ(y) = 1 - 2^f`, there are `z₁, z₃ ∈ E` with
`r̄ = (1 + s̄) z₁ + ((2^f - 1) + ȳ) z₃`. This is Labute's `r̄ = (1 + S) z̄₁ + (2^f + T) z̄₃` (§4.2,
p. 127), over `Λ ≅ ℤ₂[S] ⊗ ℤ₂[[T]]` with `S` the class of `y₂`, `χ(y₂) = -1`, and `T = γ - 1` for the
class `γ` of `y₄`, `χ(y₄) = (1 - 2^f)^{-1}`, rewritten in Tau Ceti's convention: `ι` fixes `S`, which
has order two, and sends `2^f + T = (2^f - 1) + γ` to `(2^f - 1) + γ⁻¹`. Route (Labute §4.2): the
basis with `r = y₁^{2+α}(y₁, y₂)(y₁, y₄^b)y₃^{2^f}(y₃, y₄)((y₁, y₄^b), y₂) e₀`; the expression
`r̄ = (1 + α + S(1 + T)^b) ȳ₁ + (2^f + T) ȳ₃`; and an element `φ` of `Λ`, a multiple of `S`, with
`(1 + α + S(1 + T)^b)(1 + α)^{-1} + (2^f + T)φ = 1 + S`, produced by the division criterion at
`T = -2^f`. The image `{±1} × U^(f)` is not procyclic (Layer 7), so the procyclic statement does not
apply here, and the rank is at least `4`. -/
theorem exists_labuteRelatorClass_eq_add_smul_of_range_eq_unitsPlusMinus {n : ℕ}
    {r : freeProP 2 (Fin n)} (hr : IsDemushkin 2 (presentedProP 2 (Fin n) {r}))
    (hn : Even n) (hrΦ : r ∈ proPFrattini 2 (freeProP 2 (Fin n)))
    (χ : freeProP 2 (Fin n) →ₜ* ℤ_[2]ˣ) (hχ : χ = demushkinRelatorCharacter hr)
    (hrχ : r ∈ χ.toMonoidHom.ker) {f : ℕ} (hf : 2 ≤ f)
    (hrange : χ.toMonoidHom.range = unitsPlusMinus f) (s y : freeProP 2 (Fin n))
    (hs : χ s = -1) (hy : ((χ y : ℤ_[2]ˣ) : ℤ_[2]) = 1 - 2 ^ f) :
    haveI := χ.isClosed_ker
    letI := (TauCeti.IsProP.topologicalAbelianization (TauCeti.isProP_freeProP 2 (Fin n))
      χ.toMonoidHom.ker).completedGroupAlgebraModule (freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)
    ∃ z₁ z₃ : TauCeti.labuteE χ,
      labuteRelatorClass χ r hrχ =
        (1 + TauCeti.completedGroupAlgebra.of ℤ_[2] _
            (s : freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)) • z₁ +
          (algebraMap ℤ_[2] (completedGroupAlgebra 2 (freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker))
              (2 ^ f - 1) +
            TauCeti.completedGroupAlgebra.of ℤ_[2] _
              (y : freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)) • z₃ := by
  subst hχ
  rw [map_sub, map_pow, map_ofNat, map_one]
  exact TauCeti.exists_labuteRelatorClass_eq_add_smul_of_range_eq_unitsPlusMinus hr hn hrΦ hf
    hrange hs hy

/-! ## Layer 9: the marked normal forms

The classification is stated in marked form: for each Labute normal-form family, an isomorphism
onto the presented pro-`p` group on that relator, carrying the canonical character to the
explicit values of the character table. The unmarked isomorphism statements are corollaries. -/

section MarkedNormalForms

/-- Labute's commutator `(x, y) = x⁻¹y⁻¹xy`, the convention the normal-form words use: Tau Ceti's
`TauCeti.labuteComm`.
⚠ Mathlib's `⁅x, y⁆` is `xyx⁻¹y⁻¹`, the other convention; the two generate the same subgroups
because `(x, y) = ⁅x⁻¹, y⁻¹⁆` (`TauCeti.labuteComm_eq_commutatorElement_inv_inv`), so subgroup
statements use Mathlib's bracket and relator words use this one. -/
abbrev labuteComm {H : Type*} [Group H] (x y : H) : H := TauCeti.labuteComm x y

/-- The generators of `freeProP p (Fin n)` indexed by `ℕ`, with value `1` out of range
(`TauCeti.freeProPGen_eq_one_of_le`), so that the normal-form words below carry no index-bound side
conditions: Tau Ceti's `TauCeti.freeProPGen`. -/
noncomputable abbrev freeProPGen (p n : ℕ) (i : ℕ) : freeProP p (Fin n) :=
  TauCeti.freeProPGen p n i

/-- The generators of a presented pro-`p` group, as the images of `freeProPGen`: Tau Ceti's
`TauCeti.presentedProPGen`. Out of range they are `1` (`TauCeti.presentedProPGen_eq_one_of_le`),
which is why a marking clause on the `i`-th generator says nothing about `G` when `i ≥ n`: see the
rank hypothesis of `isDemushkin_marked_of_q_two_even`. -/
noncomputable abbrev presentedProPGen (p n : ℕ) (rels : Set (freeProP p (Fin n))) (i : ℕ) :
    presentedProP p (Fin n) rels :=
  TauCeti.presentedProPGen p n rels i

/-- The `q ≠ 2` normal-form word `x₁^q(x₁,x₂)(x₃,x₄)⋯(x_{n-1},x_n)`, on an arbitrary tuple: Tau
Ceti's `TauCeti.demushkinWordNeTwo`. -/
abbrev demushkinWordNeTwo {H : Type*} [Group H] (q n : ℕ) (x : ℕ → H) : H :=
  TauCeti.demushkinWordNeTwo q n x

/-- The `q = 2`, `n` odd normal-form word `x₁²x₂^{2^f}(x₂,x₃)(x₄,x₅)⋯`, on an arbitrary tuple: Tau
Ceti's `TauCeti.demushkinWordTwoOdd`. The parameter `f` is finite here; the level `f = ∞`, where
the factor `x₂^{2^f}` is absent, is `demushkinWordTwoOddTop`. -/
abbrev demushkinWordTwoOdd {H : Type*} [Group H] (f n : ℕ) (x : ℕ → H) : H :=
  TauCeti.demushkinWordTwoOdd f n x

/-- The `q = 2`, `n` odd normal-form word at level `f = ∞`, `x₁²(x₂,x₃)(x₄,x₅)⋯`, on an arbitrary
tuple: Tau Ceti's `TauCeti.demushkinWordTwoOddTop`. At rank `1` it is `x₁²`. -/
abbrev demushkinWordTwoOddTop {H : Type*} [Group H] (n : ℕ) (x : ℕ → H) : H :=
  TauCeti.demushkinWordTwoOddTop n x

/-- The `q = 2`, `n` even normal-form word `x₁^{2+a}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯`, on an arbitrary
tuple, with natural-number parameters `a` and `f`: Tau Ceti's `TauCeti.demushkinWordTwoEven`. These
are the values the marked classification instantiates, where the image equation pins the
parameters and natural representatives exist. The level `f = ∞` of the even family is
`x₁²(x₁,x₂)(x₃,x₄)⋯`, which is `demushkinWordNeTwo 2`. -/
abbrev demushkinWordTwoEven {H : Type*} [Group H] (a f n : ℕ) (x : ℕ → H) : H :=
  TauCeti.demushkinWordTwoEven a f n x

/-- The `q = 2`, `n = 2` normal-form word `x₁^{2+α}(x₁,x₂)`, on an arbitrary tuple: Tau Ceti's
`TauCeti.demushkinWordTwoRankTwo`, the rank-two member of the even family, which has no `x₃^{2^f}`
factor and hence no level `f`. It is what `demushkinWordTwoEven` reads as at rank `2`
(`TauCeti.demushkinWordTwoEven_two`), and it is named separately because the marked classification
at rank two prescribes character values on two generators only. -/
abbrev demushkinWordTwoRankTwo {H : Type*} [Group H] (a : ℕ) (x : ℕ → H) : H :=
  TauCeti.demushkinWordTwoRankTwo a x

variable (p : ℕ) [Fact p.Prime] (G : Type) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 9, the marked classification at `q ≠ 2`.** A Demushkin group with `q ≠ 2` and rank
`n` is isomorphic to the presented group on the normal-form relator, by an isomorphism under
which the canonical character has the tabulated values: `χ(x₂)(1 - q) = 1` and `χ(x_i) = 1` on
every other generator. The equation on `x₂` is written as a product in `ℤ_p` rather than as an
inverse, so that no unit has to be constructed to state it. In the case `q = p` with `p` odd the
span step is `TauCeti.freeProP.range_basisModificationDelta_eq_top_of_odd`: `δ_ρ` is onto
`gr_{m+1}(F)` for every `m ≥ 1`. No rank hypothesis is needed: a Demushkin group of rank `1` is
`ℤ/2` at `p = 2`, with `q = 2`, so `hq` excludes it, and the rank is even otherwise. Proved in Tau
Ceti as `TauCeti.isDemushkin_marked_of_q_ne_two`. -/
theorem isDemushkin_marked_of_q_ne_two (hG : IsDemushkin p G) (hq : demushkinQ hG ≠ 2) :
    ∃ e : G ≃ₜ* presentedProP p (Fin (demushkinRank hG))
        {demushkinWordNeTwo (demushkinQ hG) (demushkinRank hG)
          (freeProPGen p (demushkinRank hG))},
      ((demushkinCharacter hG (e.symm (presentedProPGen p (demushkinRank hG) _ 1)) : ℤ_[p])
          * (1 - (demushkinQ hG : ℤ_[p])) = 1) ∧
        ∀ i : ℕ, i ≠ 1 → i < demushkinRank hG →
          demushkinCharacter hG (e.symm (presentedProPGen p (demushkinRank hG) _ i)) = 1 :=
  TauCeti.isDemushkin_marked_of_q_ne_two hG hq

/-- **Layer 9, the marked classification at `q = 2` with `n` odd**, proved in Tau Ceti as
`TauCeti.isDemushkin_marked_of_q_two_odd`. The hypothesis `q = 2` is not written: `hrange` puts
`-1` into the image, which forces it. Here `p = 2`, the relator is
`x₁²x₂^{2^f}(x₂,x₃)⋯`, and the character values are `χ(x₁) = -1`, `χ(x₃)(1 - 2^f) = 1`, and `1`
elsewhere. The standard abstract group `D₀` is the case `n = 3`, `f = 2`.
⚠ `f` is an **invariant of `G`**, not a free parameter, and `hrange` is what says so: `f` is the
level of the orientation image, `Im χ = {±1} × U^(f)`, well defined by
`closedSubgroup_units_two_level_unique`. Only the image equation pins it. The weaker condition
that the value `(1 - 2^f)⁻¹` is attained does **not**: it is monotone in `f`, because
`(1 - 2^f)⁻¹ ∈ U^(f) ⊆ U^(f₀)` for every `f ≥ f₀`, so under it the statement would assert marked
isomorphisms onto the presented groups of every level `f ≥ f₀`, whose orientation images
`{±1} × U^(f)` are pairwise distinct isomorphism invariants (`demushkinCharacter_range_congr`),
and every instance but `f = f₀` would be false. The same trap applies to the even case below, and
to any later theorem that lets a normal-form parameter float free of the group it classifies.
The theorem is stated at the literal prime `2`, because the image equation lives in
`Subgroup ℤ_[2]ˣ`; the value `f = ∞`, image `{±1}`, is `isDemushkin_marked_of_q_two_odd_top`.
⚠ The marking prescribes a value at the third generator, so the rank must be at least `3`:
`freeProPGen` is `1` out of range (`TauCeti.presentedProPGen_eq_one_of_le`), and at rank `1` the clause
`χ(x₃)(1 - 2^f) = 1` would read `1 - 2^f = 1`, which is false. Rank `1` is `ℤ/2` with image
`{±1}`, which `hrange` already excludes for finite `f`; `hn` makes the exclusion explicit rather
than leaving it to a computation with the image. Compare `hn` on the even theorem, where the
corresponding rank-two family is a genuine case with its own statement. -/
theorem isDemushkin_marked_of_q_two_odd (hG : IsDemushkin 2 G) (hodd : Odd (demushkinRank hG)) (hn : 3 ≤ demushkinRank hG)
    (f : ℕ) (hf : 2 ≤ f)
    (hrange : (demushkinCharacter hG).toMonoidHom.range = unitsPlusMinus f) :
    ∃ e : G ≃ₜ* presentedProP 2 (Fin (demushkinRank hG))
        {demushkinWordTwoOdd f (demushkinRank hG) (freeProPGen 2 (demushkinRank hG))},
      demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 0)) = -1 ∧
        ((demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 2)) : ℤ_[2])
          * (1 - 2 ^ f) = 1) ∧
        ∀ i : ℕ, i ≠ 0 → i ≠ 2 → i < demushkinRank hG →
          demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ i)) = 1 :=
  TauCeti.isDemushkin_marked_of_q_two_odd hG hodd hn hf hrange

/-- **Layer 9, the marked classification at `q = 2` with `n` even and `n ≥ 4`**, proved in Tau
Ceti as `TauCeti.isDemushkin_marked_of_q_two_even`; `q = 2` is forced by `hrange`, whose image
contains a unit `≡ 3 mod 4`, and is not written. The relator is
`x₁^{2+α}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯`, and the character values are `χ(x₂)(1 + α) = -1`,
`χ(x₄)(1 - 2^f) = 1`, and `1` elsewhere. The image is `{±1} × U^(f)` when `v₂(α) ≥ f`, and
`U^[v₂(α)]` otherwise, which is the table of Layer 7; `hrange` is that table read as a
hypothesis, and it is what pins the parameters to `G`:
- in the branch `2^f ∣ a` with `Im χ = {±1} × U^(f)`, the level `f` is pinned by the image and
  `a` is free above it: the presented groups for the different `a` with `v₂(a) ≥ f` all have
  image `{±1} × U^(f)` and are isomorphic by Labute's classification;
- in the branch `k = v₂(a) < f` with `Im χ = U^[k] = procyclicClosure u`, `(u : ℤ₂) = -1 + 2^k`,
  the valuation `k` is pinned by the image and `f > k` is free: `(1 - 2^f)⁻¹ ∈ U^(f) ⊆ U^[k]` for
  every `f > k`, and the presented groups for the different `f > k` are all Labute's
  `x₁^{2+2^k}(x₁,x₂)(x₃,x₄)⋯`, the value `f = ∞`.
⚠ The pair of attainment conditions `∃ x, χ(x)(1 + a) = -1` and `∃ x, χ(x)(1 - 2^f) = 1` does
**not** pin the parameters: the second is monotone in `f`, so in the `{±1} × U^(f₀)` branch it
holds for every `f ≥ f₀` while the presented groups for `f > f₀` have the different orientation
image `{±1} × U^(f)`, and the statement under those conditions is false for every such `f`. The
theorem is stated at the literal prime `2`, because the image equation lives in
`Subgroup ℤ_[2]ˣ`.
⚠ The rank hypothesis `hn` is not decoration. The marking prescribes a value at the fourth
generator, and at rank `2` that generator is `1` (`TauCeti.presentedProPGen_eq_one_of_le`), so the clause
`χ(x₄)(1 - 2^f) = 1` would read `1 - 2^f = 1`, which is false in `ℤ₂`; the hypotheses are
otherwise satisfiable at rank `2`, by `⟨x₁, x₂ | x₁⁶(x₁,x₂)⟩` with `a = 4`, `f = 3` and image
`U^[2]`. The rank-two
family is `isDemushkin_marked_of_q_two_rank_two`; it is Labute's `N ≥ 1` against the `N ≥ 2` of
the `x₃^{2^f}` form, as `README.md` records under the `q = 2` even-rank case. -/
theorem isDemushkin_marked_of_q_two_even (hG : IsDemushkin 2 G) (heven : Even (demushkinRank hG)) (hn : 4 ≤ demushkinRank hG)
    (a f : ℕ) (hf : 2 ≤ f) (ha : 4 ∣ a)
    (hrange : (2 ^ f ∣ a ∧ (demushkinCharacter hG).toMonoidHom.range = unitsPlusMinus f) ∨
      (padicValNat 2 a < f ∧ ∃ u : ℤ_[2]ˣ, (u : ℤ_[2]) = -1 + 2 ^ padicValNat 2 a ∧
        (demushkinCharacter hG).toMonoidHom.range = procyclicClosure u)) :
    ∃ e : G ≃ₜ* presentedProP 2 (Fin (demushkinRank hG))
        {demushkinWordTwoEven a f (demushkinRank hG) (freeProPGen 2 (demushkinRank hG))},
      ((demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 1)) : ℤ_[2])
          * (1 + (a : ℤ_[2])) = -1) ∧
        ((demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 3)) : ℤ_[2])
          * (1 - 2 ^ f) = 1) ∧
        ∀ i : ℕ, i ≠ 1 → i ≠ 3 → i < demushkinRank hG →
          demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ i)) = 1 :=
  TauCeti.isDemushkin_marked_of_q_two_even hG heven hn hf ha hrange

/-- **Layer 9, the marked classification at `q = 2` with `n = 2`**, from Tau Ceti's
`TauCeti.isDemushkin_marked_of_q_two_rank_two`, stated there at the exact depth `g = v₂(α)`;
`q = 2` is forced by `hrange` and is not written. The rank-two member of the
even family: the relator is `x₁^{2+α}(x₁,x₂)`, with no `x₃^{2^f}` factor and hence no level `f`,
and the character values are `χ(x₁) = 1` and `χ(x₂)(1 + α) = -1`. The image is `U^[v₂(α)]`,
which pins `v₂(α)` to `G` and leaves `α` free within its valuation, exactly as in the `U^[k]`
branch of the rank `≥ 4` theorem. The other branch of that theorem does not occur here: a
rank-two image is topologically generated by `χ(x₂)`, and `{±1} × U^(f)` with `f < ∞` is not
procyclic (Layer 7), so at rank two the even family with finite parameters is this word alone,
Labute's `N ≥ 1` against `N ≥ 2`. The image `{±1}`, the word `x₁²(x₁,x₂)` with `α = 0`, is the
value `f = ∞` and is `isDemushkin_marked_of_q_two_even_top`; at `a = 0` the hypothesis `hrange`
here demands the unit `-1 + 2^0 = 0` and is unsatisfiable, not junk-valued. -/
theorem isDemushkin_marked_of_q_two_rank_two (hG : IsDemushkin 2 G) (hrank : demushkinRank hG = 2) (a : ℕ) (ha : 4 ∣ a)
    (hrange : ∃ u : ℤ_[2]ˣ, (u : ℤ_[2]) = -1 + 2 ^ padicValNat 2 a ∧
      (demushkinCharacter hG).toMonoidHom.range = procyclicClosure u) :
    ∃ e : G ≃ₜ* presentedProP 2 (Fin (demushkinRank hG))
        {demushkinWordTwoRankTwo a (freeProPGen 2 (demushkinRank hG))},
      demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 0)) = 1 ∧
        ((demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 1)) : ℤ_[2])
          * (1 + (a : ℤ_[2])) = -1) := by
  obtain ⟨u, hu, hr⟩ := hrange
  have ha₀ : a ≠ 0 := by
    rintro rfl
    simp at hu
  have hg : 2 ≤ padicValNat 2 a := (padicValNat_dvd_iff_le ha₀).1 (by simpa using ha)
  have h := TauCeti.isDemushkin_marked_of_q_two_rank_two hG hrank hg pow_padicValNat_dvd
    (pow_succ_padicValNat_not_dvd ha₀) hu hr
  simp only [presentedProPGen, demushkinWordTwoRankTwo]
  rw [hrank]
  exact h

/-- **Layer 9, the marked classification at `q = 2`, `n` odd, image `{±1}`** (the level
`f = ∞`), proved in Tau Ceti as `TauCeti.isDemushkin_marked_of_q_two_odd_top`. A Demushkin group
at `p = 2` of odd rank whose canonical character has image `{±1}` is isomorphic to
`⟨x₁, …, xₙ ∣ x₁²(x₂,x₃)⋯(xₙ₋₁,xₙ)⟩` with `χ(x₁) = -1` and `χ = 1` on the other generators. No
rank bound is needed: at rank `1` it is `ℤ/2 = ⟨x₁ ∣ x₁²⟩` with `χ(x₁) = -1`; at rank `3` the
marking is `(-1, 1, 1)`. -/
theorem isDemushkin_marked_of_q_two_odd_top (hG : IsDemushkin 2 G)
    (hodd : Odd (demushkinRank hG))
    (hrange : (demushkinCharacter hG).toMonoidHom.range = Subgroup.zpowers (-1 : ℤ_[2]ˣ)) :
    ∃ e : G ≃ₜ* presentedProP 2 (Fin (demushkinRank hG))
        {demushkinWordTwoOddTop (demushkinRank hG) (freeProPGen 2 (demushkinRank hG))},
      demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 0)) = -1 ∧
        ∀ i : ℕ, i ≠ 0 → i < demushkinRank hG →
          demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ i)) = 1 :=
  TauCeti.isDemushkin_marked_of_q_two_odd_top hG hodd hrange

/-- **Layer 9, the marked classification at `q = 2`, `n` even, image `{±1}`** (the level
`f = ∞`), proved in Tau Ceti as `TauCeti.isDemushkin_marked_of_q_two_even_top`. A Demushkin group
at `p = 2` of even rank whose canonical character has image `{±1}` is isomorphic to
`⟨x₁, …, xₙ ∣ x₁²(x₁,x₂)(x₃,x₄)⋯(xₙ₋₁,xₙ)⟩`, the word `demushkinWordNeTwo 2`, with
`χ(x₂) = -1` and `χ = 1` on the other generators. It covers every even rank, `2` included: for
`⟨x, y ∣ x²(x,y)⟩` the marking is `χ(x) = 1`, `χ(y) = -1`. -/
theorem isDemushkin_marked_of_q_two_even_top (hG : IsDemushkin 2 G)
    (heven : Even (demushkinRank hG))
    (hrange : (demushkinCharacter hG).toMonoidHom.range = Subgroup.zpowers (-1 : ℤ_[2]ˣ)) :
    ∃ e : G ≃ₜ* presentedProP 2 (Fin (demushkinRank hG))
        {demushkinWordNeTwo 2 (demushkinRank hG) (freeProPGen 2 (demushkinRank hG))},
      demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 1)) = -1 ∧
        ∀ i : ℕ, i ≠ 1 → i < demushkinRank hG →
          demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ i)) = 1 :=
  TauCeti.isDemushkin_marked_of_q_two_even_top hG heven hrange

/-- **Layer 9, Labute Thm 2: relators with the same invariants are equivalent under an
automorphism of `F`.** If `F/(r)` and `F/(r')` are Demushkin with the same orientation image,
some continuous automorphism of `F` sends `r` to `r'` (Labute Thm 2, p. 107). Labute's hypothesis
`r, r' ∈ F^p[F, F]` is implied: a relator outside `Φ(F)` is part of a basis by Burnside, and then
the quotient is free pro-`p` with `H² = 0`. This is the statement the marked instances above
rest on: it is what turns "isomorphic" into "isomorphic by a basis change", so the marked normal
form is a normalization and not a choice. No rank hypothesis is needed: both relators lie in
`Φ(F)` (`TauCeti.IsDemushkin.mem_proPFrattini_of_presentedProP_singleton`), so both presented groups
have rank `n`. Proved in Tau Ceti as
`TauCeti.freeProP.exists_continuousMulEquiv_apply_eq_of_range_demushkinCharacter_eq`. -/
theorem exists_continuousMulEquiv_map_demushkinRelator (n : ℕ) (r r' : freeProP p (Fin n))
    (hr : IsDemushkin p (presentedProP p (Fin n) {r}))
    (hr' : IsDemushkin p (presentedProP p (Fin n) {r'}))
    (himage :
      (demushkinCharacter hr).toMonoidHom.range = (demushkinCharacter hr').toMonoidHom.range) :
    ∃ φ : freeProP p (Fin n) ≃ₜ* freeProP p (Fin n), φ r = r' :=
  TauCeti.freeProP.exists_continuousMulEquiv_apply_eq_of_range_demushkinCharacter_eq hr hr' himage

end MarkedNormalForms

/-! ## Layer 2: profinite Sylow theory -/

/-- **Layer 2, existence of `p`-Sylow subgroups.** Every profinite group has a `p`-Sylow
subgroup (inverse limit of Sylow subgroups at the finite levels; compactness supplies the
limit point): Tau Ceti's `TauCeti.exists_isProPSylow`. The interface table names this theorem,
so it is a stable declaration. -/
theorem exists_isProPSylow (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] :
    ∃ P : Subgroup G, IsProPSylow p P :=
  TauCeti.exists_isProPSylow p G

/-- **Layer 2, every closed pro-`p` subgroup lies in a `p`-Sylow subgroup**: Tau Ceti's
`TauCeti.IsProP.exists_le_isProPSylow`, which needs no closedness of `Q`; the hypothesis is kept
so that the statement keeps its interface. A `p`-Sylow subgroup contained in a pro-`p` subgroup
equals it (`TauCeti.IsProPSylow.eq_of_le`), so a `p`-Sylow subgroup is maximal pro-`p`. -/
theorem IsProP.exists_le_isProPSylow (p : ℕ) [Fact p.Prime] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (Q : Subgroup G) (hQ : IsProP p Q) (_hQc : IsClosed (Q : Set G)) :
    ∃ P : Subgroup G, IsProPSylow p P ∧ Q ≤ P :=
  TauCeti.IsProP.exists_le_isProPSylow hQ

/-- **Layer 2, a normal `p`-Sylow subgroup is the only one**: Tau Ceti's
`TauCeti.IsProPSylow.eq_of_normal`, a consequence of conjugacy. -/
theorem IsProPSylow.eq_of_normal (p : ℕ) [Fact p.Prime] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (P Q : Subgroup G) (hP : IsProPSylow p P) (hQ : IsProPSylow p Q) (hn : P.Normal) :
    P = Q :=
  TauCeti.IsProPSylow.eq_of_normal p G P Q hP hQ hn

/-- **Layer 2, the image of a `p`-Sylow subgroup under a continuous surjection**: Tau Ceti's
`TauCeti.IsProPSylow.map_of_surjective`. -/
theorem IsProPSylow.map_of_surjective (p : ℕ) [Fact p.Prime] (G H : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H]
    [TotallyDisconnectedSpace H] (f : G →* H) (hf : Continuous f)
    (hsurj : Function.Surjective f) (P : Subgroup G) (hP : IsProPSylow p P) :
    IsProPSylow p (P.map f) :=
  TauCeti.IsProPSylow.map_of_surjective hP f hf hsurj

/-- **Layer 2, an open subgroup containing a `p`-Sylow subgroup has index prime to `p`.** For an
open normal `N ≤ U`, `[G : U] = [G ⧸ N : U ⧸ N]` divides `[G ⧸ N : P N ⧸ N]`, which is prime to `p`
by the per-quotient clause `TauCeti.IsProPSylow.not_dvd_index`. Layer 6 feeds these indices to
`cor ∘ res = [G : U]`. -/
theorem IsProPSylow.not_dvd_index_of_le (p : ℕ) [Fact p.Prime] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (P : Subgroup G) (hP : IsProPSylow p P) (U : OpenSubgroup G) (hPU : P ≤ U.toSubgroup) :
    ¬ p ∣ U.toSubgroup.index := by
  obtain ⟨N, hN⟩ :=
    IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one U.isClopen U.one_mem
  have hNU : N.toSubgroup ≤ U.toSubgroup := fun _ hx ↦ hN hx
  have hindex : (U.toSubgroup.map (QuotientGroup.mk' N.toSubgroup)).index = U.toSubgroup.index :=
    U.toSubgroup.index_map_eq (QuotientGroup.mk'_surjective _) (by rwa [QuotientGroup.ker_mk'])
  intro hdvd
  exact TauCeti.IsProPSylow.not_dvd_index hP N
    ((hindex ▸ hdvd).trans (Subgroup.index_dvd_of_le (Subgroup.map_mono hPU)))

/-! ## Layer 3: pro-`p` groups, the maximal pro-`p` quotient, Frattini theory, generation -/

/-- **Layer 3, the pro-`p` kernel has no `p`-quotient.** For profinite `G`, the kernel
`N = proPKernel p G` of the maximal pro-`p` quotient has trivial maximal pro-`p` quotient itself:
`proPKernel p N = ⊤`, equivalently `N` has no nontrivial continuous finite `p`-group quotient
(`TauCeti.proPKernel_eq_top_iff`), and in particular no continuous surjection onto `ℤ/p`. The open
normal subgroups of `N` need not come from those of `G`, so this is a theorem and not the
definition. A closed proof on Tau Ceti's API: `K = proPKernel p N` is closed in `N` and carried
into itself by conjugation by elements of `G` (`TauCeti.isClosed_proPKernel`,
`TauCeti.map_proPKernel_le`), so its image `K'` in `G` is closed and normal; `G ⧸ K'` maps onto
the pro-`p` group `G ⧸ N` (`TauCeti.isProP_maximalProPQuotient`) with kernel a continuous image of
the pro-`p` group `N ⧸ K`, so it is pro-`p` by `TauCeti.IsProP.of_surjective` and
`TauCeti.IsProP.of_ker_isProP`; and `TauCeti.proPKernel_le_ker` at `G → G ⧸ K'` gives `N ≤ K'`. -/
theorem proPKernel_proPKernel_eq_top (p : ℕ) [Fact p.Prime] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] :
    proPKernel p (proPKernel p G) = ⊤ := by
  show TauCeti.proPKernel p (TauCeti.proPKernel p G) = ⊤
  set N := TauCeti.proPKernel p G
  have : CompactSpace N :=
    isCompact_iff_compactSpace.mp (TauCeti.isClosed_proPKernel (p := p) (G := G)).isCompact
  set K := TauCeti.proPKernel p N
  -- Conjugation by `g : G` is a continuous endomorphism of `N`, so it carries `K` into itself.
  have hconj (g : G) : K.map (MulAut.conjNormal g).toMonoidHom ≤ K := by
    refine TauCeti.map_proPKernel_le _ (continuous_induced_rng.2 ?_)
    have h : ((↑) : N → G) ∘ (MulAut.conjNormal g).toMonoidHom =
        fun n : N ↦ g * (n : G) * g⁻¹ := by
      funext n
      exact MulAut.conjNormal_apply g n
    rw [h]
    exact (continuous_const.mul continuous_subtype_val).mul continuous_const
  -- The image `K'` of `K` in `G` is normal and closed.
  set K' : Subgroup G := K.map N.subtype
  have hK'N : K' ≤ N := by
    rintro _ ⟨k, -, rfl⟩
    exact k.2
  have : K'.Normal := by
    refine ⟨fun x hx g ↦ ?_⟩
    obtain ⟨k, hk, rfl⟩ := Subgroup.mem_map.mp hx
    refine ⟨MulAut.conjNormal g k, hconj g ⟨k, hk, rfl⟩, ?_⟩
    exact MulAut.conjNormal_apply g k
  have : IsClosed (K' : Set G) := by
    rw [Subgroup.coe_map]
    exact (TauCeti.isClosed_proPKernel (p := p) (G := G)).isClosedMap_subtype_val _
      (TauCeti.isClosed_proPKernel (p := p) (G := N))
  -- `G ⧸ K'` maps onto the pro-`p` group `G ⧸ N`.
  let f : G ⧸ K' →* G ⧸ N := QuotientGroup.map K' N (MonoidHom.id G) hK'N
  have hf : Continuous f := by
    rw [(QuotientGroup.isQuotientMap_mk K').continuous_iff]
    exact QuotientGroup.continuous_mk
  have hfs : Function.Surjective f := by
    intro y
    obtain ⟨g, rfl⟩ := QuotientGroup.mk_surjective y
    exact ⟨g, rfl⟩
  -- The kernel of that map is a continuous image of the pro-`p` group `N ⧸ K`.
  let ψ : N →* f.ker :=
    ((QuotientGroup.mk' K').comp N.subtype).codRestrict f.ker fun n ↦ by
      rw [MonoidHom.mem_ker]
      exact (QuotientGroup.eq_one_iff _).mpr n.2
  have hψK : K ≤ ψ.ker := by
    intro k hk
    rw [MonoidHom.mem_ker]
    apply Subtype.ext
    exact (QuotientGroup.eq_one_iff _).mpr ⟨k, hk, rfl⟩
  let φ : TauCeti.maximalProPQuotient p N →* f.ker := QuotientGroup.lift K ψ hψK
  have hφ : Continuous φ := by
    rw [(QuotientGroup.isQuotientMap_mk K).continuous_iff]
    exact (QuotientGroup.continuous_mk.comp continuous_subtype_val).subtype_mk _
  have hφs : Function.Surjective φ := by
    rintro ⟨x, hx⟩
    obtain ⟨g, rfl⟩ := QuotientGroup.mk_surjective x
    have hg : g ∈ N := (QuotientGroup.eq_one_iff g).mp hx
    exact ⟨QuotientGroup.mk ⟨g, hg⟩, rfl⟩
  have hker : TauCeti.IsProP p f.ker :=
    TauCeti.isProP_maximalProPQuotient.of_surjective φ hφ hφs
  -- So `G ⧸ K'` is pro-`p`, and the universal property puts `N` inside `K'`.
  have hpro : TauCeti.IsProP p (G ⧸ K') :=
    TauCeti.IsProP.of_ker_isProP TauCeti.isProP_maximalProPQuotient hf hfs hker
  have hle : N ≤ K' := by
    have := TauCeti.proPKernel_le_ker hpro (QuotientGroup.mk' K') QuotientGroup.continuous_mk
    rwa [QuotientGroup.ker_mk'] at this
  rw [eq_top_iff]
  intro x _
  obtain ⟨k, hk, hkx⟩ := Subgroup.mem_map.mp (hle x.2)
  rwa [show k = x from Subtype.ext hkx] at hk

/-- **Layer 3, Burnside basis theorem, generation form.** A subset generates a pro-`p` group
topologically iff its image generates the Frattini quotient topologically: Tau Ceti's
`TauCeti.topologicallyGenerates_iff_frattiniQuotient`. The closure on the quotient side is not
decoration: at infinite rank the images of a generating set span only a dense subspace of
`G/Φ(G)`. This is the statement every later layer uses, and it needs no finiteness hypothesis and
no vector-space structure. The cardinal form, against the discrete dual `Hom_cont(G, 𝔽_p)`, is the
companion statement; it is *not* an identity with `Module.rank (ZMod p) (G/Φ(G))`, which is
strictly larger at infinite rank. The interface table names this theorem. The cardinal form is
`TauCeti.IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`, and in the finitely generated
case `TauCeti.IsProP.topologicalGeneratorRankNat_eq_finrank_quotient_proPFrattini` gives
`d(G) = dim G/Φ(G)`. -/
theorem topologicallyGenerates_iff_frattiniQuotient (p : ℕ) [Fact p.Prime] (G : Type u)
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hG : IsProP p G) (s : Set G) :
    (Subgroup.closure s).topologicalClosure = ⊤ ↔
      (Subgroup.closure ((QuotientGroup.mk' (proPFrattini p G)) '' s)).topologicalClosure
        = ⊤ :=
  TauCeti.topologicallyGenerates_iff_frattiniQuotient hG s

/-- **Layer 3, the rank does not increase under a continuous surjection** out of a profinite
group: Tau Ceti's `TauCeti.topologicalGeneratorRank_le_of_surjective`. ⚠ The source must be
profinite. For a group with no generating set converging to `1` the infimum defining the rank is
empty and the rank is `0`: the identity from `ℚ` with the discrete topology onto `ℚ` with the real
topology is a continuous surjection from a group of rank `0` onto one of rank `ℵ₀`, the latter
being generated by the null sequence `1/n!` but by no finite set. -/
theorem topologicalGeneratorRank_le_of_surjective (G H : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] [Group H]
    [TopologicalSpace H] [IsTopologicalGroup H] (f : G →* H)
    (hf : Continuous f) (hsurj : Function.Surjective f) :
    topologicalGeneratorRank H ≤ topologicalGeneratorRank G :=
  TauCeti.topologicalGeneratorRank_le_of_surjective f hf hsurj

/-- **Layer 3, the Schreier bound** `d(U) ≤ 1 + [G : U](d(G) − 1)` for an open subgroup of a
compact group: Tau Ceti's `TauCeti.topologicalGeneratorRankNat_le_of_openSubgroup`, with finite
generation of `U` from `TauCeti.IsTopologicallyFinitelyGenerated.of_openSubgroup`; such a `G` has
finitely many open subgroups of each index
(`TauCeti.IsTopologicallyFinitelyGenerated.finite_openSubgroup_index_eq`). The
subtraction is harmless because `d(G) ≥ 1` whenever `U` is proper; the equality case for free
pro-`p` groups is Layer 6. The interface table names this theorem.
⚠ Compactness of `G` is what makes the index finite. Without it the natural-number index of an
open subgroup can be `0`, and the bound fails: in `ℤ³` with the discrete topology, `ℤ² × 0` is
open of infinite index and needs two generators. -/
theorem topologicalGeneratorRankNat_le_of_isOpen (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] (U : Subgroup G) (hU : IsOpen (U : Set G))
    (hG : IsTopologicallyFinitelyGenerated G) (hUfg : IsTopologicallyFinitelyGenerated U) :
    topologicalGeneratorRankNat U hUfg
      ≤ 1 + U.index * (topologicalGeneratorRankNat G hG - 1) :=
  TauCeti.topologicalGeneratorRankNat_le_of_openSubgroup hG ⟨U, hU⟩

/-! ## Layer 4: free pro-`p` groups on finite sets, and abelian pro-`p` structure -/

/-- **Layer 4, universal property of the free profinite group, on morphisms of `ProfiniteGrp`.**
A map `X → G` into a profinite group extends uniquely to a morphism of profinite groups out of
`freeProfiniteGroup X`. This adapts Tau Ceti's `TauCeti.freeProfiniteGroup.existsUnique_lift`,
the same statement for continuous homomorphisms into an unbundled profinite group, to morphisms
of the bundled category, through `ProfiniteGrp.Hom.hom`. -/
theorem freeProfiniteGroup.existsUnique_lift (X : Type u) (G : ProfiniteGrp.{u}) (f : X → G) :
    ∃! φ : freeProfiniteGroup X ⟶ G, ∀ x : X, φ (freeProfiniteGroup.of x) = f x := by
  obtain ⟨φ, hφ, huniq⟩ := TauCeti.freeProfiniteGroup.existsUnique_lift f
  exact ⟨ConcreteCategory.ofHom φ, hφ, fun ψ hψ ↦ ProfiniteGrp.hom_ext (huniq ψ.hom hψ)⟩

/-! ### The universal properties

The universal properties of the free and presented objects are Tau Ceti's, and this roadmap uses
them directly, as continuous homomorphisms `→ₜ*` into an unbundled profinite target:

* the free profinite group: `TauCeti.freeProfiniteGroup.lift`, `lift_of`, `lift_unique`,
  `existsUnique_lift` and the extensionality `hom_ext`, which needs only a Hausdorff target;
* the free pro-`C` group: `TauCeti.freeProC.lift`, `lift_of`, `lift_unique`, `existsUnique_lift`,
  `hom_ext`;
* the free pro-`p` group: `TauCeti.freeProP.lift`, `lift_of`, `lift_unique`, `existsUnique_lift`,
  `hom_ext`, and its functoriality `TauCeti.freeProP.map`;
* the presented profinite and pro-`p` groups, whose universal property is the one a quotient has —
  a continuous homomorphism out of the free object that kills the relators factors uniquely
  through the projection `mk`: `TauCeti.presentedProfiniteGroup.lift`, `lift_comp_mk`, `lift_of`,
  `hom_ext`, `hom_ext_of`, `existsUnique_lift`, and the same names in the namespace
  `TauCeti.presentedProP`.

Each object gets both forms, because consumers use both: the `existsUnique_lift` statements are
the universal property itself, and the `hom_ext` statements are the extensionality form — two
morphisms that agree on the generators are equal — which is what a proof that two constructions
coincide actually applies. The presented forms are the ones Layer 5's non-vacuity argument for
`D₀` uses, and the ones the Iwasawa presentation in `LocalFieldsRamification` Layer 4 consumes.
Tau Ceti's lifts reach targets in the universe of the generators. -/

/-- **Layer 4, the maximal pro-`p` quotient of `ℤ̂` is `ℤ_p`.** Step (1)–(2) of the
identification chain, and the statement the Layer 2 `ℤ̂`-Sylow example rests on: Tau Ceti's
`TauCeti.zHat.maximalProPQuotientEquivPadicInt`. -/
theorem maximalProPQuotient_zHat_equiv_padicInt (p : ℕ) [Fact p.Prime] :
    Nonempty (maximalProPQuotient p zHat ≃ₜ* Multiplicative ℤ_[p]) :=
  ⟨TauCeti.zHat.maximalProPQuotientEquivPadicInt p⟩

/-! ## Layer 5: presentations -/

/-! ### The marked standard presentation `D₀`

`D₀` is a *presented* group, so its three generators are named terms and its orientation is a
named character with named values. These are the abstract marked data exported to downstream
consumers. They are Tau Ceti's (`Demushkin/D0.lean`, `Demushkin/Orientation.lean`), with the
universal property `TauCeti.d0Lift` and the extensionality `TauCeti.d0_hom_ext`. -/

/-- The marked generator `A` of `D₀`, the image of the first free pro-`2` generator: Tau Ceti's
`TauCeti.d0A`. -/
noncomputable abbrev d0A : demushkinD0 := TauCeti.d0A

/-- The marked generator `S` of `D₀`, the image of the second free pro-`2` generator: Tau Ceti's
`TauCeti.d0S`. -/
noncomputable abbrev d0S : demushkinD0 := TauCeti.d0S

/-- The marked generator `Y` of `D₀`, the image of the third free pro-`2` generator: Tau Ceti's
`TauCeti.d0Y`. -/
noncomputable abbrev d0Y : demushkinD0 := TauCeti.d0Y

/-- **Layer 5, the marked generators generate.** `A`, `S` and `Y` topologically generate `D₀`,
which is what makes a continuous character determined by its values on them. They are the
canonical generators (`TauCeti.range_presentedProP_of_d0Relator`), which topologically generate
every presented group (`TauCeti.presentedProP.dense_closure_range_of`). -/
theorem d0_topologicallyGenerates :
    (Subgroup.closure ({d0A, d0S, d0Y} : Set demushkinD0)).topologicalClosure = ⊤ := by
  show (Subgroup.closure ({TauCeti.d0A, TauCeti.d0S, TauCeti.d0Y} :
    Set TauCeti.demushkinD0)).topologicalClosure = ⊤
  rw [← TauCeti.range_presentedProP_of_d0Relator]
  exact SetLike.coe_injective <| by
    rw [Subgroup.topologicalClosure_coe, TauCeti.presentedProP.dense_closure_range_of.closure_eq,
      Subgroup.coe_top]

/-- The `2`-adic unit with value `-3` (`TauCeti.negThreeUnit_coe`): Tau Ceti's
`TauCeti.negThreeUnit`. The value `χ(Y) = (-3)⁻¹` of the standard orientation is its inverse. -/
noncomputable abbrev negThreeUnit : ℤ_[2]ˣ := TauCeti.negThreeUnit

/-- **The standard orientation of `D₀`**, the continuous character `D₀ → ℤ₂ˣ` with values
`(-1, 1, (-3)⁻¹)` on `(A, S, Y)`: Tau Ceti's `TauCeti.standardD0Orientation`, built by
`TauCeti.d0Lift` into the pro-`2` group `ℤ₂ˣ`. It exists because those values kill the relator
`A²S⁴(S, Y)`: the relator maps to `(-1)² · 1⁴ · 1 = 1`, the commutator dying because `ℤ₂ˣ` is
abelian. Its values are Tau Ceti's `TauCeti.standardD0Orientation_d0A`, `TauCeti.standardD0Orientation_d0S`
and `TauCeti.standardD0Orientation_d0Y`; the uniqueness theorem below is what pins it. -/
noncomputable abbrev standardD0Orientation : demushkinD0 →ₜ* ℤ_[2]ˣ :=
  TauCeti.standardD0Orientation

/-- **Layer 7, the standard orientation is surjective**, so its image is all of `ℤ₂ˣ`: Tau
Ceti's `TauCeti.standardD0Orientation_surjective`. This is the `Im χ = ℤ₂ˣ` half of the acceptance
instance, and it is a computation with the values above: `-1` and `-3` topologically generate
`ℤ₂ˣ`. -/
theorem standardD0Orientation_surjective : Function.Surjective standardD0Orientation :=
  TauCeti.standardD0Orientation_surjective

/-- **Layer 7, the standard orientation is the only continuous character with those values**:
Tau Ceti's `TauCeti.standardD0Orientation_unique`. The marked generators topologically generate
`D₀`, so a continuous character is determined by its values on them. This is what makes the
marked acceptance instance a normalization and not a choice. -/
theorem standardD0Orientation_unique (ψ : demushkinD0 →ₜ* ℤ_[2]ˣ)
    (hA : ψ d0A = -1) (hS : ψ d0S = 1) (hY : ψ d0Y = negThreeUnit⁻¹) :
    ψ = standardD0Orientation :=
  TauCeti.standardD0Orientation_unique ψ hA hS hY

/-! ### Layer 5: lifting a coefficient map along the extension class

The dictionary with compact kernel is Tau Ceti's: `TauCeti.ProfiniteGroupExtension G M` is an
extension `1 → M → E → G → 1` with profinite total group, continuous inclusion and projection,
inducing the given action; `contCohomologyClass` is its class in the continuous `H²(G, M)`; and
`map f hf` is its pushforward along a continuous equivariant `f : M →*[G] N`, whose class is the
image of the class under the coefficient map of `f`
(`TauCeti.ProfiniteGroupExtension.contCohomologyClass_map`). Two extensions by the **same** kernel
are continuously equivalent exactly when their classes agree
(`TauCeti.ProfiniteGroupExtension.exists_equiv_continuous_iff_contCohomologyClass_eq`). The three
statements below compare extensions by **different** kernels: NSW I §5 Exercise 4(i) at
`ϕ = id`, its converse, and surjectivity of the lift. -/

section ExtensionLifting

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]
  {M : Type v} [CommGroup M] [TopologicalSpace M] [MulDistribMulAction G M] [CompactSpace M]
  {N : Type w} [CommGroup N] [TopologicalSpace N] [IsTopologicalGroup N]
  [MulDistribMulAction G N] [ContinuousSMul G N] [CompactSpace N] [TotallyDisconnectedSpace N]

/-- **Layer 5, lifting along the class** (NSW I §5 Exercise 4(i) at `ϕ = id`). A continuous
equivariant `f : M → N` that carries the class of `X` to the class of `Y` is the restriction to
the kernels of a continuous homomorphism `X.E → Y.E` over the identity of `G`. Route: the
classification gives a continuous equivalence of `X.map f hf` with `Y` that fixes `N` and covers
`G`; precompose it with the continuous homomorphism `X.E → (X.map f hf).E`,
`e ↦ (f (inl⁻¹ (e * σ (π e)⁻¹)), π e)`, for the continuous normalized section `σ` of `X` that
`X.map f hf` is built from. It is multiplicative because the factor set of the pushforward is `f`
applied to that of `σ` and `f` is equivariant, and continuous because
`TauCeti.GroupExtension.factorSetContinuousMulEquiv` identifies `X.E` with the twisted product of
`σ` homeomorphically; the class of each extension is that of the factor set of any continuous
normalized section (`GroupExtension.contCohomologyClass_eq`). -/
theorem ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq
    (f : M →*[G] N) (hf : Continuous f) (X : TauCeti.ProfiniteGroupExtension G M)
    (Y : TauCeti.ProfiniteGroupExtension G N)
    (h : (X.map f hf).contCohomologyClass = Y.contCohomologyClass) :
    ∃ φ : X.E →* Y.E, Continuous φ ∧
      φ.comp X.toGroupExtension.inl = Y.toGroupExtension.inl.comp (f : M →* N) ∧
      Y.toGroupExtension.rightHom.comp φ = X.toGroupExtension.rightHom :=
  TauCeti.ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq
    (X := X) (f := f) (hf := hf) (Y := Y) h

/-- **Layer 5, the converse of the lifting lemma.** A continuous homomorphism `X.E → Y.E` over the
identity of `G` that restricts to `f` on the kernels forces `f` to carry the class of `X` to the
class of `Y`: for a continuous normalized section `σ` of `X`, `φ ∘ σ` is a continuous normalized
section of `Y`, and its factor set is `f` applied to that of `σ`. Continuity of `φ` is what makes
`φ ∘ σ` a continuous section. -/
theorem ProfiniteGroupExtension.contCohomologyClass_map_eq_of_continuous_monoidHom
    (f : M →*[G] N) (hf : Continuous f) (X : TauCeti.ProfiniteGroupExtension G M)
    (Y : TauCeti.ProfiniteGroupExtension G N) (φ : X.E →* Y.E) (hφ : Continuous φ)
    (hinl : φ.comp X.toGroupExtension.inl = Y.toGroupExtension.inl.comp (f : M →* N))
    (hright : Y.toGroupExtension.rightHom.comp φ = X.toGroupExtension.rightHom) :
    (X.map f hf).contCohomologyClass = Y.contCohomologyClass :=
  TauCeti.ProfiniteGroupExtension.contCohomologyClass_map_eq_of_continuous_monoidHom
    (X := X) (f := f) (hf := hf) (Y := Y) φ hφ hinl hright

end ExtensionLifting

/-- **Layer 5, a morphism of extensions is surjective when it is on the kernels.** A homomorphism
over the identity of `G` whose restriction to the kernels is surjective meets every fibre of the
projection, and within a fibre every translate of the kernel. Applied to `X.toGroupExtension` and
`Y.toGroupExtension`, it makes the lift above surjective when `f` is. -/
theorem GroupExtension.surjective_of_comp_inl_eq {G M N E E' : Type*} [Group G] [Group M]
    [Group N] [Group E] [Group E'] (S : _root_.GroupExtension M E G)
    (S' : _root_.GroupExtension N E' G) (f : M →* N) (hf : Function.Surjective f) (φ : E →* E')
    (hinl : φ.comp S.inl = S'.inl.comp f) (hright : S'.rightHom.comp φ = S.rightHom) :
    Function.Surjective φ := by
  intro y
  obtain ⟨x, hx⟩ := S.rightHom_surjective (S'.rightHom y)
  have hker : (φ x)⁻¹ * y ∈ S'.rightHom.ker := by
    rw [MonoidHom.mem_ker, map_mul, map_inv, ← MonoidHom.comp_apply, hright, hx, inv_mul_cancel]
  rw [← S'.range_inl_eq_ker_rightHom] at hker
  obtain ⟨n, hn⟩ := hker
  obtain ⟨m, rfl⟩ := hf n
  refine ⟨x * S.inl m, ?_⟩
  rw [map_mul, ← MonoidHom.comp_apply φ S.inl, hinl, MonoidHom.comp_apply, hn, mul_inv_cancel_left]

/-! ### Layer 5: finite embedding problems and projectivity, consumed from Tau Ceti

The route from the extension dictionary to projectivity is Tau Ceti's, and this roadmap uses its
declarations directly: the problem `TauCeti.FiniteEmbeddingProblem G`, a continuous surjection
`π : G ↠ Q` onto a finite group together with a surjection `α : E ↠ Q` of finite groups; its
solutions `TauCeti.FiniteEmbeddingProblem.IsSolution`, the continuous `β : G → E` with
`α ∘ β = π`; the predicates `TauCeti.HasElementaryAbelianSolutions p G` and
`TauCeti.HasPGroupSolutions p G`; the level problems `TauCeti.levelProblem`; and projectivity
`TauCeti.IsProjective p G`. Continuity of a homomorphism into a **finite discrete** group is recorded
as openness of its kernel, so no field of the problem carries a topology. Each milestone below is a
closed proof whose body is the Tau Ceti theorem, except the converse of projectivity, which needs a
pro-`p` hypothesis and is proved here.

⚠ A solution cannot be made surjective in general: with `G = C_p`, `Q = 1` and `E = C_p × C_p` no
homomorphism `G → E` is surjective. Projectivity needs only the weak form. -/

/-- **Layer 5.7, the converse, for pro-`p` groups.** A projective pro-`p` group solves every finite
embedding problem with `p`-group kernel. `Q` is a continuous finite quotient of the pro-`p` group
`G`, hence a `p`-group, so `E`, an extension of `Q` by the `p`-group `ker α`, is a finite `p`-group
and hence pro-`p`, and the problem is a lifting problem against `α : E ↠ Q`.
⚠ The pro-`p` hypothesis is not decoration, and a `p`-group kernel does not make `E` and `Q`
`p`-groups. `G = PSL₂(𝔽₅)` is perfect, so every continuous map from it to a pro-`2` group is
trivial and `G` is projective at `p = 2`; but `SL₂(𝔽₅) ↠ G`, with kernel `C₂` and `π = id`, is a
finite embedding problem without solution, since the only involution of `SL₂(𝔽₅)` is `-1` while
`G` has involutions. -/
theorem hasPGroupSolutions_of_isProjective {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hGp : IsProP p G) (hG : TauCeti.IsProjective.{u, u, u} p G) :
    TauCeti.HasPGroupSolutions p G := by
  refine TauCeti.hasPGroupSolutions_iff.mpr fun P hP ↦ ?_
  let _ : TopologicalSpace P.Q := ⊥
  let _ : TopologicalSpace P.E := ⊥
  have : DiscreteTopology P.Q := ⟨rfl⟩
  have : DiscreteTopology P.E := ⟨rfl⟩
  have hπ : Continuous P.π := P.π.continuous_iff_isOpen_ker.mpr P.isOpen_ker_π
  have hQ : IsPGroup p P.Q :=
    TauCeti.isProP_iff_isPGroup.mp (TauCeti.IsProP.of_surjective hGp P.π hπ P.π_surjective)
  have hE : IsPGroup p P.E := IsPGroup.of_subgroup_of_quotient hP
    (hQ.of_equiv (QuotientGroup.quotientKerEquivOfSurjective P.α P.α_surjective).symm)
  obtain ⟨φ, hφ⟩ := TauCeti.IsProjective.exists_continuous_lift hG hE.isProP
    ⟨P.α, continuous_of_discreteTopology⟩ P.α_surjective ⟨P.π, hπ⟩
  exact ⟨φ.toMonoidHom, TauCeti.FiniteEmbeddingProblem.isSolution_iff.mpr
    ⟨φ.toMonoidHom.continuous_iff_isOpen_ker.mp φ.continuous,
      MonoidHom.ext fun g ↦ DFunLike.congr_fun hφ g⟩⟩

/-- **Layer 5.7, the equivalence with topological projectivity**, for pro-`p` groups, so that a
consumer may use whichever form is convenient and Layer 6 may quote either. ⚠ This is the step at
which an abstract finite-group argument would silently replace the required continuous profinite
one: the converse is finite-level bookkeeping, but projectivity from solvability is the
inverse-limit argument of 5.5 and 5.6 and is not formal. -/
theorem isProjective_iff_hasPGroupSolutions {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hGp : IsProP p G) :
    TauCeti.IsProjective.{u, u, u} p G ↔ TauCeti.HasPGroupSolutions p G :=
  ⟨hasPGroupSolutions_of_isProjective hGp, TauCeti.isProjective_of_hasPGroupSolutions⟩

/-- **Layer 5, the Golod–Shafarevich inequality**: a nontrivial finite `p`-group `G` satisfies
`d(G)² < 4 r(G)` over `ℕ`, where `d(G)` is the topological generator rank and
`r(G) = dim_{𝔽_p} H²(G, 𝔽_p)` the relation rank (NSW (3.9.7); Ribes–Zalesskii Thm 7.8.5). It is
Tau Ceti's `IsPGroup.sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two`. For
`G = ℤ/p` the two sides are `1 < 4`, and for `(ℤ/p)²` they are `4 < 12`. -/
theorem sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two (p : ℕ) [Fact p.Prime]
    {G : Type u} [Group G] [Finite G] [Nontrivial G] [TopologicalSpace G] [DiscreteTopology G]
    (hG : IsPGroup p G) :
    topologicalGeneratorRankNat G TauCeti.isTopologicallyFinitelyGenerated_of_fg ^ 2 <
      4 * Module.finrank (ZMod p) (cohomFp p G 2) :=
  hG.sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two

/-! ## Layer 6: cohomological dimension, and its Nielsen-Schreier consequence

`cd_p` is ProfiniteCohomology's `cd_p` (Layer 11), which for `G : Type u` is Tau Ceti's
`TauCeti.cohomologicalDimensionAt.{u}`, with coefficients in the universe of the group, written
so in the statements below (`.{0}` for the groups `freeProP p (Fin n)` and their subgroups, which
live in `Type`): the infimum, in
`ℕ∞`, of the `n` for which `Hⁱ(G, M)` vanishes above `n` for every discrete `p`-primary torsion `M`, characterized by `TauCeti.cohomologicalDimensionAt_le_iff`. This
roadmap defines no second cohomological dimension. The two general reductions, to finite
coefficients and to coefficients of bounded exponent, are ProfiniteCohomology Layer 11's, at Tau
Ceti as `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite` and
`TauCeti.cohomologicalDimensionAt_le_iff_boundedExponent`; the pro-`p` reduction below is the
third and is owned here. The two general inputs of the Sylow statements are ProfiniteCohomology
Layer 10's as well: the descent of a vanishing restriction from a closed subgroup to an open one,
Tau Ceti's `TauCeti.ContinuousCohomology.exists_openSubgroup_res_eq_zero`, and the `p`-primary
torsion of the cohomology of `p`-primary coefficients, Tau Ceti's
`TauCeti.isPPrimaryTorsion_continuousCohomology`. -/

section CohomologicalDimension

variable (p : ℕ) [Fact p.Prime]

/-- **Layer 6, the pro-`p` reduction of `cd_p`.** For a pro-`p` group it is enough to test the
single module `𝔽_p` with trivial action: the two hypotheses on `M` below say that `M` is finite,
killed by `p` and acted on trivially, which makes it a finite direct sum of copies of `𝔽_p`.
Route: the trivial-filtration theorem of this layer, which for a pro-`p` group filters any
finite discrete `p`-primary module with factors `𝔽_p`, and the long exact sequences of the
imported carrier. ⚠ This equivalence is a reduction and not the definition: writing the
elementary abelian test as the definition would make the dévissage vacuous. -/
theorem cd_p_le_iff_elementaryAbelian_of_isProP (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (n : ℕ) :
    TauCeti.cohomologicalDimensionAt.{u} p G ≤ (n : ℕ∞) ↔
      ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
        [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M] [Finite M],
        (∀ m : M, p • m = 0) → (∀ (g : G) (m : M), g • m = m) →
          Limits.IsZero (_root_.continuousCohomology (n + 1)
            (TauCeti.ofDiscreteModule ℤ G M)) := by
  rw [hG.cohomologicalDimensionAt_le_iff_forall_smul_eq_self]
  refine ⟨fun h M _ _ _ _ _ _ _ hp htriv ↦ ?_, fun h M _ _ _ _ _ _ hp htriv ↦ ?_⟩
  · have := h M hp htriv
    exact TopModuleCat.isZero_of_subsingleton _
  · have := h M hp htriv
    have hx (z : _root_.continuousCohomology (n + 1) (TauCeti.ofDiscreteModule ℤ G M)) :
        z = 0 := by
      simpa using ConcreteCategory.congr_hom (this.eq_of_src (𝟙 _) 0) z
    exact ⟨fun x y ↦ (hx x).trans (hx y).symm⟩

/-- **Layer 6, the trivial-filtration theorem.** For pro-`p` `G`, a nonzero finite discrete
`p`-primary `G`-module has nonzero invariants, because the action factors through a finite
`p`-quotient: Tau Ceti's `TauCeti.exists_ne_zero_invariant_of_isProP`. Iterating gives the
`G`-stable filtration with one-dimensional trivial factors that the dévissage above runs on, which
is Tau Ceti's `TauCeti.IsProP.forall_subsingleton_continuousCohomology_iff` in a single degree.
⚠ Do not write `dim_{𝔽_p} M` here: `ℤ/p²` is a finite `p`-primary module that is not an
`𝔽_p`-vector space. -/
theorem exists_ne_zero_invariant_of_isProP (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (M : Type u) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction G M] [ContinuousSMul G M] [Finite M] (hM : Nontrivial M)
    (htors : ∀ m : M, ∃ k : ℕ, (p ^ k) • m = 0) :
    ∃ m : M, m ≠ 0 ∧ ∀ g : G, g • m = m :=
  haveI := hM
  TauCeti.exists_ne_zero_invariant_of_isProP hG htors

/-- **Layer 6, free implies `cd_p ≤ 1`.** Layer 5's vanishing theorem `H²(F, M) = 0`, which is
Tau Ceti's `TauCeti.freeProP.subsingleton_continuousCohomology_two` for finite discrete
`p`-primary `M`, restated against `cd_p`. Dévissage changes the coefficients and the
degree-raising theorem changes the degree, so the proof needs both; together they are Tau Ceti's
`TauCeti.freeProP.cohomologicalDimensionAt_le_one`. -/
theorem cd_p_freeProP_le_one (n : ℕ) :
    TauCeti.cohomologicalDimensionAt.{0} p (freeProP p (Fin n)) ≤ 1 :=
  TauCeti.freeProP.cohomologicalDimensionAt_le_one (Fact.out : p.Prime).ne_zero

/-- **Layer 6, Serre's theorem**: `cd_p G ≤ 1` implies free pro-`p`, for topologically finitely
generated `G`. The route is projectivity (`TauCeti.CohomologicalDimensionLE.isProjective`), a
minimal presentation, a homomorphic section, and Burnside, and it is Tau Ceti's
`TauCeti.IsProP.nonempty_continuousMulEquiv_freeProP_of_cohomologicalDimensionAt_le_one`, stated
there for a generating type of cardinality `d(G)` in the universe of `G`. This statement is that
theorem read at the generating type `Fin d(G)`, which lives in `Type` rather than in the universe
of `G`.
⚠ The version without finite generation is a different theorem with a different proof, and it is
Layer 10's: `cd_p_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation`, on a
pointed profinite space. -/
theorem isFree_of_cd_p_le_one (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (hfg : IsTopologicallyFinitelyGenerated G) (hcd : TauCeti.cohomologicalDimensionAt.{u} p G ≤ 1) :
    Nonempty (G ≃ₜ* freeProP p (Fin (topologicalGeneratorRankNat G hfg))) := by
  have hX : Nat.card (ULift.{u} (Fin (topologicalGeneratorRankNat G hfg))) =
      topologicalGeneratorRankNat G hfg := by
    rw [Nat.card_ulift, Nat.card_eq_fintype_card, Fintype.card_fin]
  obtain ⟨e⟩ := hG.nonempty_continuousMulEquiv_freeProP_of_cohomologicalDimensionAt_le_one hfg hcd
    (ULift.{u} (Fin (topologicalGeneratorRankNat G hfg))) hX
  exact ⟨e.trans (TauCeti.freeProP.uliftEquiv p (Fin (topologicalGeneratorRankNat G hfg)))⟩

omit [Fact p.Prime] in
/-- **Layer 6, `cd_p` of an open subgroup.** For `U` open in pro-`p` `G` with `cd_p G` finite,
`cd_p U = cd_p G`. ⚠ The imported `cd_p_eq_of_index_not_dvd` is the prime-to-`p`-index case and
does not cover an open subgroup of index divisible by `p`, which is the case used here. Tau
Ceti's `TauCeti.cohomologicalDimensionAt_eq_of_isOpen_of_ne_top` proves it for every profinite
`G` (Serre, *Galois Cohomology* I §3.3 Prop. 14), so the pro-`p` hypothesis `_hG` is not used. -/
theorem cd_p_eq_of_isOpen (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (_hG : IsProP p G) (U : OpenSubgroup G)
    (hfin : TauCeti.cohomologicalDimensionAt.{u} p G ≠ ⊤)
    [CompactSpace U.toSubgroup] [TotallyDisconnectedSpace U.toSubgroup] :
    TauCeti.cohomologicalDimensionAt.{u} p U.toSubgroup = TauCeti.cohomologicalDimensionAt.{u} p G :=
  TauCeti.cohomologicalDimensionAt_eq_of_isOpen_of_ne_top U.isOpen hfin

/-- **Layer 6, restriction to a `p`-Sylow subgroup is injective** on the cohomology of a discrete
`p`-primary torsion module, in every degree (NSW (1.6.10)). Restriction is additive
(`injective_iff_map_eq_zero`), so let `x` restrict to zero on `P`; five steps give `x = 0`.
1. `P` is closed (`TauCeti.IsProPSylow.isClosed`), so Tau Ceti's
   `TauCeti.ContinuousCohomology.exists_openSubgroup_res_eq_zero`, at the smooth discrete
   `TauCeti.ofDiscreteModule ℤ G M` (`TauCeti.ofDiscreteModule_isSmoothDiscrete ℤ G M`), gives an
   open `U` with `P ≤ U.toSubgroup` and `res_U x = 0`.
2. `TauCeti.ContinuousCohomology.corestriction_res` gives
   `U.toSubgroup.index • x = corestriction (res_U x) = 0`, a natural-number multiple, which is
   `((U.toSubgroup.index : ℕ) : ℤ) • x = 0` by `natCast_zsmul`.
3. `TauCeti.isPPrimaryTorsion_continuousCohomology`, at `TauCeti.ofDiscreteModule ℤ G M` (whose
   underlying module is `M`, `TauCeti.ofDiscreteModule_V`), puts `x` in the `p`-primary
   component: `p ^ k • x = 0` for some `k : ℕ` (`AddCommGroup.mem_primaryComponent`), a
   natural-number multiple, which is `((p ^ k : ℕ) : ℤ) • x = 0` by `natCast_zsmul`.
4. `IsProPSylow.not_dvd_index_of_le` gives `¬ p ∣ U.toSubgroup.index`, so
   `Nat.Coprime (p ^ k) U.toSubgroup.index` (`Nat.Prime.coprime_iff_not_dvd`,
   `Nat.Coprime.pow_left`).
5. Bézout in `ℤ`: `Nat.gcd_eq_gcd_ab` and `Nat.Coprime.gcd_eq_one` give
   `1 = ((p ^ k : ℕ) : ℤ) * a + ((U.toSubgroup.index : ℕ) : ℤ) * b` with `a = Nat.gcdA _ _` and
   `b = Nat.gcdB _ _`, so
   `x = a • (((p ^ k : ℕ) : ℤ) • x) + b • (((U.toSubgroup.index : ℕ) : ℤ) • x)`
   (`one_zsmul`, `add_zsmul`, `mul_zsmul`), and both terms vanish by steps 2 and 3. -/
theorem res_injective_of_isProPSylow (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (P : Subgroup G)
    (hP : IsProPSylow p P) (M : Type u) [AddCommGroup M] [TopologicalSpace M]
    [IsTopologicalAddGroup M] [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    (hM : TauCeti.IsPPrimaryTorsion p M) (n : ℕ) :
    Function.Injective
      (TauCeti.ContinuousCohomology.res P (TauCeti.ofDiscreteModule ℤ G M) n).hom := by
  cases n with
  | zero =>
    have := TauCeti.ContinuousCohomology.mono_res_zero P (TauCeti.ofDiscreteModule ℤ G M)
    exact ConcreteCategory.injective_of_mono_of_preservesPullback
      ((forget₂ (TopModuleCat ℤ) TopCat).map
        (TauCeti.ContinuousCohomology.res P (TauCeti.ofDiscreteModule ℤ G M) 0))
  | succ n =>
    exact TauCeti.ContinuousCohomology.res_injective_of_forall_not_dvd_index Fact.out
      (TauCeti.ofDiscreteModule_isSmoothDiscrete ℤ G M) hM hP.isClosed hP.not_dvd_index_of_le n

/-- **Layer 6, the Sylow equality** `cd_p G = cd_p G_p`, for `G` profinite and `G_p` a `p`-Sylow
subgroup from Layer 2 (NSW (3.3.6)). This is the one statement of this layer about `cd_p` of a
group that need not be pro-`p`. Both sides are Tau Ceti's `TauCeti.cohomologicalDimensionAt.{u}`,
which is ProfiniteCohomology's `cd_p`. `cd_p G_p ≤ cd_p G` is ProfiniteCohomology's monotonicity
`cd_p_le_of_isClosed`; `cd_p G ≤ cd_p G_p` is `res_injective_of_isProPSylow` above, applied in
each degree above `cd_p G_p` to each discrete `p`-primary torsion module, through the
characterization `TauCeti.cohomologicalDimensionAt_le_iff` of the invariant by its vanishing
predicate `TauCeti.CohomologicalDimensionLE`. A `p`-Sylow subgroup is closed and in general
**not** open, so ProfiniteCohomology's `cd_p_eq_of_index_not_dvd`, which is the open prime-to-`p`-index
case, does not cover it; `TauCeti.ContinuousCohomology.exists_openSubgroup_res_eq_zero`, step 1 of
the injectivity above, is what does. The caller supplies no instance for `G_p`: it is closed in
the compact `G`, hence compact (`isCompact_iff_compactSpace`, `IsClosed.isCompact`), which the
statement records itself, and it is totally disconnected as a subspace
(`Subtype.totallyDisconnectedSpace`). -/
theorem cd_p_eq_of_isProPSylow (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (P : Subgroup G) (hP : IsProPSylow p P) :
    haveI : CompactSpace P :=
      isCompact_iff_compactSpace.mp (TauCeti.IsProPSylow.isClosed hP).isCompact
    TauCeti.cohomologicalDimensionAt.{u} p P = TauCeti.cohomologicalDimensionAt.{u} p G :=
  hP.cohomologicalDimensionAt_eq.symm

section NativeTateCoefficientAction

-- Match the additive parent used by the native duality API; the action below is built
-- under this same parent instead of importing an action fixed at another instance path.
attribute [local instance 2000] Ring.toAddCommGroup

/-- **Layer 7, finite-module Tate duality.** For an infinite Demushkin group the cup-evaluation
map `α₂ : H²(G, M) → Hom(H⁰(G, M^∨), H²(G, 𝔽_p))` is bijective for every finite discrete
`G`-module `M` killed by `p`. Its cup-evaluation definition, finite-module hypotheses, and
right-exactness use are specified in `README.md`; the proof is
`TauCeti.IsDemushkin.dualityMap2_bijective`. The companion maps in degrees `0` and `1` are
`TauCeti.IsDemushkin.dualityMap0_bijective` and `TauCeti.IsDemushkin.dualityMap1_bijective`; with
coefficients `I(χ)/pⁱ` the three are `TauCeti.IsDemushkin.dualityMap0_zModTwist_bijective`,
`TauCeti.IsDemushkin.dualityMap1_zModTwist_bijective` and
`TauCeti.IsDemushkin.dualityMap2_zModTwist_bijective`. -/
theorem IsDemushkin.tateAlpha2_bijective (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] [Infinite G]
    (hG : IsDemushkin p G) (M : Type u) [AddCommGroup M] [TopologicalSpace M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M] [Finite M]
    (hM : ∀ m : M, p • m = 0) :
    letI : DistribMulAction G (ZMod p) :=
      DistribMulAction.compHom (ZMod p) (1 : G →* (ZMod p)ˣ)
    letI : ContinuousSMul G (ZMod p) :=
      ⟨continuous_snd.congr fun q ↦ (one_smul (ZMod p)ˣ q.2).symm⟩
    Function.Bijective (TauCeti.ContCohomology.dualityMap2 G M (ZMod p)) := by
  let _ : DistribMulAction G (ZMod p) :=
      DistribMulAction.compHom (ZMod p) (1 : G →* (ZMod p)ˣ)
  let _ : ContinuousSMul G (ZMod p) :=
      ⟨continuous_snd.congr fun q ↦ (one_smul (ZMod p)ˣ q.2).symm⟩
  have htriv : ∀ (g : G) (m : ZMod p), g • m = m :=
    fun _ m ↦ one_smul (ZMod p)ˣ m
  exact TauCeti.IsDemushkin.dualityMap2_bijective hG htriv M hM

end NativeTateCoefficientAction

/-- **Layer 7, open subgroups of infinite Demushkin groups are Demushkin** (Serre, *Structure de
certains pro-p-groupes*, §9.2). The proof uses the finite permutation module `Coind_U^G 𝔽_p`, its
self-dual identification, Shapiro, and the cup projection formula, as specified in `README.md`;
it is Tau Ceti's `TauCeti.IsDemushkin.openSubgroup`. ⚠ The hypothesis `Infinite G` is used:
`ℤ/2` is Demushkin and finite. -/
theorem IsDemushkin.openSubgroup (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] [Infinite G]
    (hG : IsDemushkin p G) (U : OpenSubgroup G) : IsDemushkin p U.toSubgroup :=
  TauCeti.IsDemushkin.openSubgroup hG U

/-- **Layer 7, the rank formula for an open subgroup**, in `ℤ`: `n(U) - 2 = [G : U](n(G) - 2)`
for `U` open in an infinite Demushkin group `G` (Serre, *Structure de certains pro-p-groupes*,
§9.2). It is the three-term Euler formula after `cd_p G ≤ 2`, with both `H²` terms equal to `1`:
Tau Ceti's `TauCeti.IsDemushkin.demushkinRank_openSubgroup_sub_two`. ⚠ For the finite Demushkin
group `ℤ/2` and `U = 1` the numbers `0 - 2 = 2 · (1 - 2)` happen to agree, but `U` is not
Demushkin (`H²(1, 𝔽₂) = 0`), so `n(U)` is not defined; this is why `Infinite G` is assumed. -/
theorem IsDemushkin.demushkinRank_openSubgroup_sub_two (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    [Infinite G] (hG : IsDemushkin p G) (U : OpenSubgroup G) :
    (demushkinRank (IsDemushkin.openSubgroup p G hG U) : ℤ) - 2 =
      U.toSubgroup.index * ((demushkinRank hG : ℤ) - 2) :=
  TauCeti.IsDemushkin.demushkinRank_openSubgroup_sub_two hG U

/-- **Layer 7, the canonical character of an open subgroup is the restriction**: for `U` open in
an infinite Demushkin group `G`, `χ_U = χ_G ∘ (U ↪ G)`. The proof checks the prescription
property of the restriction on the coinduced modules `Coind_U^G(I(χ|_U)/pⁱ)` with the exponent
shift described in `README.md`, and concludes by uniqueness: Tau Ceti's
`TauCeti.IsDemushkin.demushkinCharacter_openSubgroup`. -/
theorem IsDemushkin.demushkinCharacter_openSubgroup (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    [Infinite G] (hG : IsDemushkin p G) (U : OpenSubgroup G) :
    demushkinCharacter (IsDemushkin.openSubgroup p G hG U) =
      (demushkinCharacter hG).comp (TauCeti.ContinuousMonoidHom.subgroupSubtype U.toSubgroup) :=
  TauCeti.IsDemushkin.demushkinCharacter_openSubgroup hG U

/-- **Layer 7, an infinite Demushkin group has `cd_p = 2`.** The lower bound is from
`dim H²(G, 𝔽_p) = 1`. For the upper bound, use `TauCeti.IsDemushkin.dualityMap2_bijective` on every
finite discrete `𝔽_p[G]`-module and apply
`TauCeti.IsProP.cohomologicalDimensionAt_le_two_of_forall_dualityMap2_bijective`; together these
are `TauCeti.IsDemushkin.cohomologicalDimensionAt_eq_two`. The five-term sequence alone is not a
producer of this bound. -/
theorem cd_p_eq_two_of_isDemushkin (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) (hinf : Infinite G) : TauCeti.cohomologicalDimensionAt.{u} p G = 2 :=
  haveI := hinf
  TauCeti.IsDemushkin.cohomologicalDimensionAt_eq_two hG

/-- **Layer 10, closed subgroups of free pro-`p` groups.** A closed subgroup of a free pro-`p`
group again has `cd_p ≤ 1`, by ProfiniteCohomology's monotonicity `cd_p_le_of_isClosed` and the free
case above; with Serre's theorem at arbitrary rank this is the full pro-`p` Nielsen-Schreier
theorem, whose free objects on a profinite space are Layer 10. -/
theorem cd_p_le_one_of_isClosed_freeProP (n : ℕ)
    (H : Subgroup (freeProP p (Fin n))) (hH : IsClosed (H : Set (freeProP p (Fin n))))
    [CompactSpace H] [TotallyDisconnectedSpace H] :
    TauCeti.cohomologicalDimensionAt.{0} p H ≤ 1 :=
  TauCeti.freeProP.cohomologicalDimensionAt_le_one_of_isClosed (Fact.out : p.Prime).ne_zero hH

end CohomologicalDimension

/-! ## Layer 6: cohomological dimension, and its Nielsen–Schreier consequence -/

/-- **Layer 6, pro-`p` Nielsen–Schreier for open subgroups, with the index-rank formula.**
An open subgroup of index `m` in the free pro-`p` group of rank `n ≥ 1` is free pro-`p` of
rank `1 + m(n - 1)`. (Route pinned in `README.md`: via `cd ≤ 1` and the two-term Euler
formula, not a transversal argument. The natural-number subtraction `n - 1` is harmless under
`n ≠ 0`; the Euler formula itself is stated in `ℤ`.) -/
theorem nonempty_continuousMulEquiv_freeProP_of_openSubgroup {p : ℕ} [Fact p.Prime] {n : ℕ}
    (hn : n ≠ 0) (U : OpenSubgroup (freeProP p (Fin n))) :
    Nonempty (U ≃ₜ* freeProP p (Fin (1 + U.toSubgroup.index * (n - 1)))) :=
  haveI : Nonempty (Fin n) := ⟨⟨0, Nat.pos_of_ne_zero hn⟩⟩
  TauCeti.freeProP.nonempty_continuousMulEquiv_freeProP_openSubgroup_index U _ (by simp)

/-! ## Layer 7: the closed subgroups of `ℤ₂ˣ`, and the abelianization-level invariants -/

/-- **Layer 7, the closed subgroups of `ℤ₂ˣ`: exhaustiveness.** Every nontrivial closed
subgroup is one of `U^(f)`, `{±1} × U^(f)`, `{±1}`, or Labute's `U^[f]`: Tau Ceti's
`TauCeti.closedSubgroup_units_two_classification`. Uniqueness of the case and of `f` is the
companion statement; the indices and the values of `(A : A²)` are the numbers Layer 9's existence
theorem quotes (`TauCeti.index_unitsPlusMinus`, `TauCeti.index_unitsPrincipal_two`,
`TauCeti.relIndex_map_powMonoidHom_two_eq_one_or_two_or_four`). -/
theorem closedSubgroup_units_two_trichotomy (A : Subgroup ℤ_[2]ˣ)
    (hA : IsClosed (A : Set ℤ_[2]ˣ)) (hA1 : A ≠ ⊥) :
    (∃ f : ℕ, 2 ≤ f ∧ A = unitsPrincipal f) ∨
      (∃ f : ℕ, 2 ≤ f ∧ A = unitsPlusMinus f) ∨
      A = Subgroup.zpowers (-1 : ℤ_[2]ˣ) ∨
      (∃ (f : ℕ) (u : ℤ_[2]ˣ),
        2 ≤ f ∧ (u : ℤ_[2]) = -1 + 2 ^ f ∧ A = procyclicClosure u) :=
  TauCeti.closedSubgroup_units_two_classification hA hA1

/-- **Layer 7, uniqueness of the case and of the level.** The four families of the trichotomy are
pairwise disjoint (`TauCeti.unitsPrincipal_ne_unitsPlusMinus` and its companions), and `f` is
determined within each; for `U^(f)` this is Tau Ceti's `TauCeti.unitsPrincipal_inj`, and for
`V^(f)` it is `TauCeti.unitsPlusMinus_inj`. ⚠ This is what a consumer needs in order to
speak of *the* level of an orientation image: `LocalGaloisGroups` computes the image of the
cyclotomic character and then reads `f` off it, which is only well defined given this. -/
theorem closedSubgroup_units_two_level_unique {f f' : ℕ} (hf : 2 ≤ f) (hf' : 2 ≤ f')
    (h : unitsPrincipal f = unitsPrincipal f') : f = f' :=
  (TauCeti.unitsPrincipal_inj (p := 2) (by omega) (by omega)).mp h

/-! ## Layer 10: free pro-`C` groups on profinite spaces, consumed from Tau Ceti

The free pro-`C` group on a pointed topological space `(X, x₀)` is Tau Ceti's
`TauCeti.freeProCPointed C x₀`: the quotient of `freeProC C X` by the intersection of the open
normal subgroups through which `X → freeProC C X` is continuous and kills `x₀`, with the continuous
generator map `TauCeti.freeProCPointed.of`, which kills `x₀`, and the lift
`TauCeti.freeProCPointed.lift`. For a profinite space `X` it is `F_C(X, x₀)` of Ribes and
Zalesskii §3.3. This roadmap uses it directly and builds no second free object on a space; the
milestones Tau Ceti proves are closed proofs below. -/

/-- **Layer 10, at `C = ` finite `p`-groups the comparison map is not injective**, for an infinite
discrete `S`. The witness is a count of continuous characters, and not a description of the kernel:
those of `freeProC C S` are all maps `S → 𝔽_p`, a space of dimension `p^{#S}` by the Erdős–Kaplansky
theorem, while those of `F_C(S⁺, ∞)` are the finitely supported ones, of dimension `#S`, and a
continuous bijection of profinite groups would identify the two duals. ⚠ The statement is false for
an arbitrary class: if `C` contains only the trivial group, both objects are trivial. -/
theorem not_injective_fromFreeProC_finiteGroupClassP (p : ℕ) [Fact p.Prime] (S : Type u)
    [TopologicalSpace S] [DiscreteTopology S] [Infinite S] :
    ¬ Function.Injective (TauCeti.freeProCPointed.fromFreeProC (finiteGroupClassP.{u} p) S) :=
  TauCeti.freeProCPointed.not_injective_fromFreeProC p S

/-- **Layer 10, Serre's theorem at arbitrary rank.** A pro-`p` group `G` has `cd_p G ≤ 1` if and
only if it is free pro-`p` on a pointed profinite space: some subset `s ⊆ G` converging to `1` has
its presentation `F_p(insert 1 s, 1) → G` (the continuous homomorphism extending the inclusion) a
topological isomorphism. No finite generation is assumed of `G`. The forward direction is
projectivity and a minimal presentation with kernel in the Frattini subgroup; the converse is
projectivity of the free object. Tau Ceti's
`TauCeti.IsProP.cohomologicalDimensionAt_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation`
(Ribes–Zalesskii Cor. 7.7.5). -/
theorem cd_p_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation
    (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G) :
    TauCeti.cohomologicalDimensionAt.{u} p G ≤ 1 ↔ ∃ s : Set G, ConvergesToOne s ∧
      ∃ e : TauCeti.freeProPInsertOne p s ≃ₜ* G, ⇑e = ⇑(TauCeti.IsProP.presentation hG s) :=
  TauCeti.IsProP.cohomologicalDimensionAt_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation
    hG

/-! ### Tau Ceti inputs named in the README

The README's supplier contracts and proof routes cite these pinned Tau Ceti declarations by name;
each `#check` fails to elaborate if the pinned library no longer provides it. -/

#check @TauCeti.IsProP.eq_top_of_forall_not_le_openNormalSubgroup_index_eq
#check @TauCeti.IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod
#check @TauCeti.IsProP.exists_convergesToOne_continuousMulEquiv_presentation_of_cohomologicalDimensionAt_le_one
#check @TauCeti.IsProP.exists_finite_span_completedGroupAlgebraModule_topologicalAbelianization_ker_eq_top
#check @TauCeti.IsProP.exists_pLowerCentralSeries_le
#check @TauCeti.IsProP.isProjective_iff_exists_convergesToOne_continuousMulEquiv_presentation
#check @TauCeti.IsProP.isTopologicallyFinitelyGenerated_iff_finite_quotient_proPFrattini
#check @TauCeti.IsProP.natCard_quotient_proPFrattini
#check @TauCeti.IsProP.padicPow
#check @TauCeti.IsProP.padicPow_natCast
#check @TauCeti.IsProP.surjective_iff_surjective_quotient_index_eq
#check @TauCeti.IsProPSylow.exists_map_conj_eq
#check @TauCeti.IsTopologicallyFinitelyGenerated.bijective_of_surjective
#check @TauCeti.IsTopologicallyFinitelyGenerated.finite_gradedPiece
#check @TauCeti.IsTopologicallyFinitelyGenerated.finite_levelSolution
#check @TauCeti.IsTopologicallyFinitelyGenerated.isOpen_pLowerCentralSeries
#check @TauCeti.completedGroupAlgebra.isMulCommutative_iff
#check @TauCeti.freeProP.basisModificationDelta_apply
#check @TauCeti.freeProP.finrank_gradedPiece_one
#check @TauCeti.freeProP.fromFreeGroup_injective
#check @TauCeti.freeProP.gradedMk_inv_mul_basisModification
#check @TauCeti.freeProCPointed.convergesToOne_range_of_coe

end TauCetiRoadmap.ProfiniteProPGroups
