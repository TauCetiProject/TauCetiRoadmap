import Mathlib
import TauCetiRoadmap.ProfiniteCohomology.Suggested
import TauCeti.GroupTheory.PLowerCentralSeries
import TauCeti.NumberTheory.Padics.DyadicUnits
import TauCeti.NumberTheory.Padics.GroupAlgebraCyclicTwo
import TauCeti.NumberTheory.Padics.PowerSeries
import TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialFp
import TauCeti.Topology.Algebra.Group.FiniteQuotients
import TauCeti.Topology.Algebra.Group.LowerCentralSeries
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.Basic
import TauCeti.Topology.Algebra.Group.OpenSubgroup.TopologicallyFinitelyGenerated
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.DyadicCoordinate
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Filtration
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Map
import TauCeti.Topology.Algebra.Group.Profinite.Completion
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Abelianization
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Orientation
import TauCeti.Topology.Algebra.Group.Profinite.EmbeddingProblem.Projective
import TauCeti.Topology.Algebra.Group.Profinite.Free.Graded
import TauCeti.Topology.Algebra.Group.Profinite.Free.PadicInt
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
import TauCeti.Topology.Algebra.Group.Profinite.FiniteQuotients
import TauCeti.Topology.Algebra.Group.Profinite.Order
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Burnside
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Extension
import TauCeti.Topology.Algebra.Group.Profinite.ProP.FiniteGeneration
import TauCeti.Topology.Algebra.Group.Profinite.ProP.FixedPoints
import TauCeti.Topology.Algebra.Group.Profinite.ProP.LowerCentralSeries
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Order
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Prescription
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Rank
import TauCeti.Topology.Algebra.Group.Profinite.ProP.RelationModule
import TauCeti.Topology.Algebra.Group.Profinite.ProP.StructureTheorem
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Surjective
import TauCeti.Topology.Algebra.Group.Profinite.Rank
import TauCeti.Topology.Algebra.Group.Profinite.Section
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Conjugacy
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Functoriality
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.PadicInt
import TauCeti.Topology.Algebra.Group.TopologicalAbelianization
import TauCeti.Topology.Algebra.GroupExtension.Cohomology
import TauCeti.Topology.Algebra.Module.Compact
import TauCeti.Topology.Compactness.InverseSystem

set_option autoImplicit false

/-!
# Profinite and pro-`p` groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library: these are goals, not proofs.

This file carries the carrier types, so that the central interface of the roadmap is Lean
code and not pseudocode. The cohomology is Mathlib's `continuousCohomology`, described in low
degrees, compared, and equipped with its exact sequences, change-of-group maps and cup
products by the Profinite Cohomology roadmap; this file imports those declarations under the
namespace `TauCetiRoadmap.ProfiniteCohomology` and states the pro-`p` theory against them. The
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
trivial `𝔽_p` coefficients, the prescription property of a continuous character, the dyadic
group `D₀` with its marked generators and standard orientation, the completed group algebra
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

-- Every cohomological operation below is a declaration of `TauCetiRoadmap.ProfiniteCohomology`,
-- written `ProfiniteCohomology.foo` because this file lives inside `TauCetiRoadmap`. This
-- roadmap builds no second carrier and no second operation.

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
`Subgroup.profiniteIndex`. The definition is written for arbitrary `H`; closedness of `H` is a
hypothesis of the theorems about it, in particular of the equivalence with
`lcm {[G : U] | U open, H ≤ U}` (Layer 1), which fails without it. -/
noncomputable abbrev profiniteIndex {G : Type u} [Group G] [TopologicalSpace G]
    (H : Subgroup G) : Supernatural :=
  H.profiniteIndex

/-- The **Frattini subgroup of a pro-`p` group**, in index-`p` form: the intersection of the open
normal subgroups of index `p`. This is Tau Ceti's `TauCeti.proPFrattini`, with normality instance
`TauCeti.proPFrattini_normal`, closedness `TauCeti.isClosed_proPFrattini`, and its verbal form
`closure (Gᵖ[G,G])` in `TauCeti.proPFrattini_eq_topologicalClosure`; the definition makes sense
for any topological group. -/
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
`TauCeti.presentedProP`. -/
noncomputable abbrev presentedProP (X : Type u) (rels : Set (freeProP p X)) : Type u :=
  TauCeti.presentedProP p X rels

/-- The canonical projection onto the presented pro-`p` group, Tau Ceti's continuous
`TauCeti.presentedProP.mk`. -/
noncomputable abbrev presentedProP.mk {X : Type u} (rels : Set (freeProP p X)) :
    freeProP p X →ₜ* presentedProP p X rels :=
  TauCeti.presentedProP.mk p rels

/-- The dyadic Demushkin relator `A²S⁴(S,Y)` in the free pro-`2` group on `A, S, Y`
(`= of 0, of 1, of 2`), written out in Labute's commutator convention
`(x, y) = x⁻¹y⁻¹xy` (see the conventions in `README.md`). This is Tau Ceti's
`TauCeti.d0Relator`, whose value on the free generators is `TauCeti.d0Relator_def`. -/
noncomputable abbrev d0Relator : freeProP 2 (Fin 3) :=
  TauCeti.d0Relator

/-- **`D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y) = 1⟩`**, the standard rank-3, `q = 2` Demushkin group,
defined intrinsically as a presented pro-`2` group: Tau Ceti's `TauCeti.demushkinD0`. -/
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
`Q`, whose finiteness clause then holds automatically. -/
abbrev IsFiniteContinuousQuotient (G : Type u) [Group G] [TopologicalSpace G]
    (Q : FiniteGrp.{v}) : Prop :=
  TauCeti.IsFiniteContinuousQuotient G Q

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
    [IsTopologicalGroup G] : ProfiniteCohomology.TopRep (ZMod p) G :=
  TauCeti.trivialFp p G

/-- **`Hⁿ(G, 𝔽_p)`**, against the imported carrier: Tau Ceti's `TauCeti.cohomFp`, Mathlib's
`continuousCohomology` of `trivialFp`. Every dimension count below is about this object. -/
noncomputable abbrev cohomFp (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (n : ℕ) : TopModuleCat.{u} (ZMod p) :=
  TauCeti.cohomFp p G n

/-- **The multiplication pairing on `𝔽_p`**, as a `TopPairing` of the trivial representation
with itself. This is the coefficient input of the imported cup product: `cup (fpPairing p G) 1 1`
is the cup square `H¹(G, 𝔽_p) × H¹(G, 𝔽_p) → H²(G, 𝔽_p)` that the Demushkin predicate is
stated against, and there is no second cup product in this roadmap.
The pairing is the multiplication of `ZMod p`, which is `ZMod p`-bilinear, continuous because the
coefficients are discrete, and equivariant because the action is trivial. -/
noncomputable def fpPairing (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] :
    ProfiniteCohomology.TopPairing (trivialFp p G) (trivialFp p G) (trivialFp p G) where
  bil := sorry
  cont := sorry
  equivariant := sorry

/-- **Layer 5, the pairing is multiplication.** The defining equation of `fpPairing`, read
through the identification `TauCeti.trivialFpEquiv` of the carrier with `ZMod p`. Without it the
pairing would be an arbitrary bilinear map and every nondegeneracy statement below would be
vacuous. -/
theorem fpPairing_bil (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : (trivialFp p G).V) :
    TauCeti.trivialFpEquiv p G ((fpPairing p G).bil a b) =
      TauCeti.trivialFpEquiv p G a * TauCeti.trivialFpEquiv p G b :=
  sorry

/-- **Layer 5, the cup square on `H¹(G, 𝔽_p)`.** The bidegree-`(1,1)` product of the imported
cup at the pairing above, with the degree `1 + 1` rewritten as `2`. Every nondegeneracy clause
below is stated against this abbreviation, so all of them are about one operation. -/
noncomputable abbrev cupFp (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : cohomFp p G 1) : cohomFp p G 2 :=
  ProfiniteCohomology.degreeCast (by norm_num) (trivialFp p G)
    (ProfiniteCohomology.cup (fpPairing p G) 1 1 a b)

/-- **Layer 5, graded commutativity of the cup square**, the specialization of the imported
`cup_gradedComm` to `fpPairing`, whose opposite pairing is itself because multiplication in
`ZMod p` is commutative. With it, right nondegeneracy of a cup pairing follows from left
nondegeneracy, so the second nondegeneracy clause of `IsDemushkin` becomes a theorem and is
dropped. -/
theorem cupFp_gradedComm (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : cohomFp p G 1) : cupFp p G a b = - cupFp p G b a :=
  sorry

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
(`TauCeti.freeProP.hasPrescriptionProperty`). -/
abbrev HasPrescriptionProperty (χ : G →ₜ* ℤ_[p]ˣ) : Prop :=
  TauCeti.HasPrescriptionProperty χ

end Prescription

/-! ## Layer 7: the Demushkin predicate, its rank, and its invariants

These declarations were pseudocode while the cohomology had no carrier. They are statements
now, against the Layer 5 carrier. -/

section Demushkin

variable (p : ℕ) [Fact p.Prime]
variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]

/-- **The Demushkin predicate** (Labute p. 106). The pro-`p` hypothesis is a field, so that
no downstream theorem applies to a group that satisfies only the cohomological clauses. Both
nondegeneracy clauses are fields; if the cup product is proved graded-commutative in this
bidegree, the second becomes a theorem and the field is dropped. Nondegeneracy is stated
through `cupFp`, which is the imported cup product at the multiplication pairing on `𝔽_p`.
Finite generation is derived from `h1_fin` and the Burnside basis theorem, and is never
assumed. -/
structure IsDemushkin : Prop where
  /-- `G` is a pro-`p` group. -/
  proP : IsProP p G
  /-- `H¹(G, 𝔽_p)` is finite-dimensional, against the imported carrier. -/
  h1_fin : Module.Finite (ZMod p) (cohomFp p G 1)
  /-- `H²(G, 𝔽_p)` is one-dimensional, against the imported carrier. -/
  h2_rank : Module.finrank (ZMod p) (cohomFp p G 2) = 1
  /-- The cup pairing is nondegenerate on the left. -/
  cupLeft : ∀ a : cohomFp p G 1, a ≠ 0 → ∃ b : cohomFp p G 1, cupFp p G a b ≠ 0
  /-- The cup pairing is nondegenerate on the right. -/
  cupRight : ∀ b : cohomFp p G 1, b ≠ 0 → ∃ a : cohomFp p G 1, cupFp p G a b ≠ 0

/-- **Layer 7, a Demushkin group is topologically finitely generated.** From `h1_fin`, the
`H¹` interpretation of Layer 5, and the Burnside basis theorem of Layer 3. -/
theorem IsDemushkin.isTopologicallyFinitelyGenerated {p G} [Fact p.Prime] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (_hG : IsDemushkin p G) : IsTopologicallyFinitelyGenerated G :=
  sorry

/-- **The rank of a Demushkin group**, as a natural number. Every numerical statement about
Demushkin groups is about this accessor, and never about an unqualified rank. -/
noncomputable def demushkinRank {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : ℕ :=
  topologicalGeneratorRankNat G hG.isTopologicallyFinitelyGenerated

open scoped Classical in
/-- **Labute's `q`-invariant.** It is `0` when the topological abelianization is
torsion-free, which is Labute's `q = p^∞` convention, and the number of torsion elements
otherwise. For a Demushkin group the torsion subgroup is finite and cyclic by Layer 7, so
this is the `q` of `G^{ab} ≅ ℤ_p^{n-1} × ℤ/q`. `Nat.card` is `0` on an infinite type, so no
finiteness hypothesis is needed to make the definition total; the Layer 7 theorem is what
makes it correct. -/
noncomputable def demushkinQ {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (_hG : IsDemushkin p G) : ℕ :=
  if ∀ x : topAbelianization G, IsOfFinOrder x → x = 1 then 0
  else Nat.card {x : topAbelianization G // IsOfFinOrder x}

/-- **Layer 7, the `q`-invariant is an isomorphism invariant.** -/
example {p G H} [Fact p.Prime] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : IsDemushkin p G) (hH : IsDemushkin p H) (_e : G ≃ₜ* H) :
    demushkinQ hG = demushkinQ hH :=
  sorry

/-- **Layer 7, the canonical character exists and is unique.** The prescription property is
Tau Ceti's `TauCeti.HasPrescriptionProperty` of a continuous character, in the lifting form: every
class of `H¹(G, I(χ)/p)` lifts to `H¹(G, I(χ)/pⁱ)` for every `i ≥ 1`. The theorem is that a
Demushkin group has exactly one continuous `χ` with that property (Serre; Labute Thm 4). -/
theorem existsUnique_hasPrescriptionProperty {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (_hG : IsDemushkin p G) :
    ∃! χ : G →ₜ* ℤ_[p]ˣ, HasPrescriptionProperty χ :=
  sorry

/-- **The canonical character (orientation) of a Demushkin group**, the unique continuous
`χ : G → ℤ_pˣ` with the prescription property. It is data, so it is a `def`, and it is a
continuous homomorphism, the form Tau Ceti's `TauCeti.HasPrescriptionProperty` and
`TauCeti.ZModTwist` take; the theorems below are what pin it, and every statement about the
orientation is about this declaration. -/
noncomputable def demushkinCharacter {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : G →ₜ* ℤ_[p]ˣ :=
  (existsUnique_hasPrescriptionProperty hG).exists.choose

/-- **Layer 7, the canonical character is continuous**, being a continuous homomorphism. -/
theorem demushkinCharacter_continuous {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : Continuous (demushkinCharacter hG) :=
  (demushkinCharacter hG).continuous

/-- **Layer 7, the canonical character has the prescription property.** -/
theorem demushkinCharacter_hasPrescriptionProperty {p G} [Fact p.Prime] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : HasPrescriptionProperty (demushkinCharacter hG) :=
  (existsUnique_hasPrescriptionProperty hG).exists.choose_spec

/-- **Layer 7, the canonical character is the only one.** This is the uniqueness half of
Labute Thm 4 and the abstract normalization exported to downstream applications: a consumer that
exhibits a continuous character with Tau Ceti's prescription property has found the orientation. -/
theorem demushkinCharacter_unique {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) (χ : G →ₜ* ℤ_[p]ˣ) (hpres : HasPrescriptionProperty χ) :
    χ = demushkinCharacter hG :=
  (existsUnique_hasPrescriptionProperty hG).unique hpres
    (existsUnique_hasPrescriptionProperty hG).exists.choose_spec

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
    (hG : IsDemushkin p G) (hH : IsDemushkin p H) (_e : G ≃ₜ* H) :
    (demushkinCharacter hG).toMonoidHom.range = (demushkinCharacter hH).toMonoidHom.range :=
  sorry

end Demushkin

/-! ## Layer 8: the graded pieces of the lower `p`-series, consumed from Tau Ceti

`gr_k(G) = λ_k / λ_{k+1}` is Tau Ceti's `TauCeti.gradedPiece p G k`, the quotient of consecutive
terms of the lower `p`-series written additively, with its `ZMod p`-module structure
`TauCeti.instModuleZModGradedPiece`. The class of an element of `λ_k` is `TauCeti.gradedMk`; the
bracket `gr_j × gr_k → gr_{j+k+1}` induced by the group commutator is the biadditive
`TauCeti.gradedBracket`, with its `𝔽_p`-bilinear form `TauCeti.gradedBracketLinear`; the `p`-power
operator `π : gr_k → gr_{k+1}` is `TauCeti.gradedPow`; the transport between equal degrees is
`TauCeti.gradedCast`; and the graded map of a continuous homomorphism is `TauCeti.gradedMap`. This
roadmap uses them directly, and each milestone below is a closed proof whose body is the Tau Ceti
theorem. No normality hypothesis is carried: `λ_{k+1}` is normal in `G`, hence in `λ_k`. -/

section Graded

open scoped commutatorElement

variable {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 8, the graded pieces are elementary abelian.** Every element is killed by `p`, which is
what makes `gr_k(G)` an `𝔽_p`-vector space; no pro-`p` hypothesis is needed. -/
example (k : ℕ) (x : TauCeti.gradedPiece p G k) : p • x = 0 :=
  TauCeti.nsmul_gradedPiece_eq_zero x

/-- **Layer 8, finiteness is conditional.** For a prime `p` and a topologically finitely generated
profinite `G` every `gr_k(G)` is finite, because `λ_{k+1}` is open. Without finite generation the
statement is false: `∏_I C_p` with `I` infinite has `λ_1 = ⊥` and `gr_0 = G`. There is no
unconditional global `Finite` instance. -/
example [Fact p.Prime] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hfg : IsTopologicallyFinitelyGenerated G) (k : ℕ) : Finite (TauCeti.gradedPiece p G k) :=
  TauCeti.IsTopologicallyFinitelyGenerated.finite_gradedPiece hfg Fact.out k

/-- **Layer 8, commutators and `p`-th powers raise the degree**, the two membership statements that
make the bracket and the `p`-power operator well defined, and the ones every explicit computation
in Layer 9 cites. -/
example {j k : ℕ} {x y : G} (hx : x ∈ TauCeti.pLowerCentralSeries p G j)
    (hy : y ∈ TauCeti.pLowerCentralSeries p G k) :
    ⁅x, y⁆ ∈ TauCeti.pLowerCentralSeries p G (j + k + 1) ∧
      x ^ p ∈ TauCeti.pLowerCentralSeries p G (j + 1) :=
  ⟨TauCeti.commutator_mem_pLowerCentralSeries hx hy, TauCeti.pow_mem_pLowerCentralSeries hx⟩

/-- **Layer 8, the bracket and the `p`-power operator on classes.** Their defining equations: the
bracket of two classes is the class of the commutator, and `π` of a class is the class of the
`p`-th power. Without them the two operations would be arbitrary maps. -/
example {j k : ℕ} (x : TauCeti.pLowerCentralSeries p G j)
    (y : TauCeti.pLowerCentralSeries p G k) :
    TauCeti.gradedBracket p G j k (TauCeti.gradedMk p G j x) (TauCeti.gradedMk p G k y) =
        TauCeti.gradedMk p G (j + k + 1)
          ⟨⁅(x : G), (y : G)⁆, TauCeti.commutator_mem_pLowerCentralSeries x.2 y.2⟩ ∧
      TauCeti.gradedPow p G j (TauCeti.gradedMk p G j x) =
        TauCeti.gradedMk p G (j + 1) ⟨(x : G) ^ p, TauCeti.pow_mem_pLowerCentralSeries x.2⟩ :=
  ⟨TauCeti.gradedBracket_gradedMk x y, TauCeti.gradedPow_gradedMk x⟩

/-- **Layer 8, the Lie laws of the bracket.** It is biadditive by construction, being a map
`gr_j →+ gr_k →+ gr_{j+k+1}`, hence `𝔽_p`-bilinear (`TauCeti.gradedBracketLinear`); it is
alternating, `[x, x] = 0` in every degree and every characteristic; and it satisfies the Jacobi
identity, with the three terms transported into the single degree `i + j + k + 2`. -/
example {i j k : ℕ} (x : TauCeti.gradedPiece p G i) (y : TauCeti.gradedPiece p G j)
    (z : TauCeti.gradedPiece p G k) :
    TauCeti.gradedBracket p G i i x x = 0 ∧
      TauCeti.gradedCast p G (by omega)
          (TauCeti.gradedBracket p G (i + j + 1) k (TauCeti.gradedBracket p G i j x y) z) +
        TauCeti.gradedCast p G (by omega)
          (TauCeti.gradedBracket p G (j + k + 1) i (TauCeti.gradedBracket p G j k y z) x) +
        TauCeti.gradedCast p G (by omega)
          (TauCeti.gradedBracket p G (k + i + 1) j (TauCeti.gradedBracket p G k i z x) y) =
        (0 : TauCeti.gradedPiece p G (i + j + k + 2)) :=
  ⟨TauCeti.gradedBracket_self x, TauCeti.gradedBracket_jacobi x y z⟩

/-- **Layer 8, additivity of `π`, and its dyadic failure.** `π` is additive in every degree `k ≥ 1`
for every `p`, because the Hall–Petrescu corrections land in higher degree, and in degree zero for
odd `p`, because their coefficients `binom(p, i)` are divisible by `p`. At `p = 2` in degree zero the
defect is exactly the bracket: `π (x + y) = π x + π y + [x, y]` in `gr_1(G)`, the `binom(2, 2)` term
of the Hall–Petrescu expansion, and the identity that shapes every `q = 2` argument of Layer 9. -/
example {k : ℕ} (hk : 1 ≤ k) (x y : TauCeti.gradedPiece p G k)
    (x₀ y₀ : TauCeti.gradedPiece p G 0) :
    TauCeti.gradedPow p G k (x + y) = TauCeti.gradedPow p G k x + TauCeti.gradedPow p G k y ∧
      (Odd p → TauCeti.gradedPow p G 0 (x₀ + y₀) =
        TauCeti.gradedPow p G 0 x₀ + TauCeti.gradedPow p G 0 y₀) ∧
      (p = 2 → TauCeti.gradedPow p G 0 (x₀ + y₀) =
        TauCeti.gradedPow p G 0 x₀ + TauCeti.gradedPow p G 0 y₀ +
          TauCeti.gradedBracket p G 0 0 x₀ y₀) :=
  ⟨TauCeti.gradedPow_add_of_one_le hk x y, fun hp ↦ TauCeti.gradedPow_add_zero_of_odd hp x₀ y₀,
    fun hp ↦ TauCeti.gradedPow_add_zero_of_two hp x₀ y₀⟩

/-- **Layer 8, the failure is not vacuous.** In the free pro-`2` group of rank `2` the bracket of
the two basis classes is nonzero in `gr_1` (`TauCeti.gradedBracket_freeProP_two_ne_zero`), so `π`
is not additive on `gr_0`. -/
example : ¬ ∀ x y : TauCeti.gradedPiece 2 (freeProP 2 (Fin 2)) 0,
    TauCeti.gradedPow 2 (freeProP 2 (Fin 2)) 0 (x + y) =
      TauCeti.gradedPow 2 (freeProP 2 (Fin 2)) 0 x +
        TauCeti.gradedPow 2 (freeProP 2 (Fin 2)) 0 y :=
  TauCeti.gradedPow_freeProP_two_not_additive

/-- **Layer 8, `π` against the bracket**, away from degree zero: `π[x, y] = [πx, y]` for
`x ∈ gr_j` with `j ≥ 1`, and `π[x, y] = [x, πy]` for `y ∈ gr_k` with `k ≥ 1`. The correction terms
`[[x, y], x]` and `[[x, y], y]` have degrees `2j + k + 2` and `j + 2k + 2`, which vanish in
`gr_{j+k+2}` unless the corresponding argument has degree zero. -/
example {j k : ℕ} (hj : 1 ≤ j) (hk : 1 ≤ k) (x : TauCeti.gradedPiece p G j)
    (y : TauCeti.gradedPiece p G k) :
    TauCeti.gradedPow p G (j + k + 1) (TauCeti.gradedBracket p G j k x y) =
        TauCeti.gradedCast p G (by omega)
          (TauCeti.gradedBracket p G (j + 1) k (TauCeti.gradedPow p G j x) y) ∧
      TauCeti.gradedPow p G (j + k + 1) (TauCeti.gradedBracket p G j k x y) =
        TauCeti.gradedCast p G (by omega)
          (TauCeti.gradedBracket p G j (k + 1) x (TauCeti.gradedPow p G k y)) :=
  ⟨TauCeti.gradedPow_gradedBracket_left hj x y, TauCeti.gradedPow_gradedBracket_right hk x y⟩

/-- **Layer 8, the graded map of a continuous homomorphism**, `TauCeti.gradedMap p f hf k`, with
its defining equation `TauCeti.gradedMap_gradedMk`, is natural for the bracket and for `π`. -/
example {H : Type u} [Group H] [TopologicalSpace H] [IsTopologicalGroup H] (f : G →* H)
    (hf : Continuous f) {j k : ℕ} (x : TauCeti.gradedPiece p G j)
    (y : TauCeti.gradedPiece p G k) :
    TauCeti.gradedMap p f hf (j + k + 1) (TauCeti.gradedBracket p G j k x y) =
        TauCeti.gradedBracket p H j k (TauCeti.gradedMap p f hf j x)
          (TauCeti.gradedMap p f hf k y) ∧
      TauCeti.gradedMap p f hf (k + 1) (TauCeti.gradedPow p G k y) =
        TauCeti.gradedPow p H k (TauCeti.gradedMap p f hf k y) :=
  ⟨TauCeti.gradedMap_gradedBracket f hf x y, TauCeti.gradedMap_gradedPow f hf y⟩

end Graded

/-! ## Layer 9 prerequisites: the completed group algebra, consumed from Tau Ceti

The orientation image `Γ = Im χ` is procyclic in one branch and `C₂ × ℤ₂` in the other. Both
shapes are needed, and the second is one of the two even-rank families at `q = 2`. The algebra,
its projections, group elements and functoriality, the procyclic and dyadic coordinates, and
evaluation and division of power series are Tau Ceti's. This roadmap aliases the algebra under its
name, uses the rest directly, and states as targets only the dyadic kernel formula, which Tau Ceti
does not have. -/

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

section CompletedAlgebra

variable (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  [CompactSpace Γ] [TotallyDisconnectedSpace Γ]

/-- **Layer 9, `Λ` is a compact totally disconnected topological `ℤ_p`-algebra**, for profinite
`Γ`: Tau Ceti's instances. -/
example : IsTopologicalRing (completedGroupAlgebra p Γ) ∧
    CompactSpace (completedGroupAlgebra p Γ) ∧ TotallyDisconnectedSpace (completedGroupAlgebra p Γ) :=
  ⟨inferInstance, inferInstance, inferInstance⟩

/-- **Layer 9, the inverse-limit description.** Every finite-level projection is surjective, and an
element is determined by its projections: Tau Ceti's `proj_surjective` and `ext`. The targets of the
projections are pinned to the group algebras of the finite quotients, which is what makes `Λ` the
inverse limit and not an abstract ring. -/
example (U : OpenNormalSubgroup Γ) :
    Function.Surjective (TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U) ∧
      ∀ x y : completedGroupAlgebra p Γ,
        (∀ V, TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ V x =
          TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ V y) → x = y :=
  ⟨TauCeti.completedGroupAlgebra.proj_surjective ℤ_[p] Γ U,
    fun _ _ h ↦ TauCeti.completedGroupAlgebra.ext h⟩

/-- **Layer 9, the group elements inside `Λ`.** `of` is continuous and injective, and a group
element projects to its class: Tau Ceti's `continuous_of`, `of_injective` and `proj_of`. Continuity
is what lets a topological generator of `Γ` give a power-series coordinate below. -/
example (U : OpenNormalSubgroup Γ) (γ : Γ) :
    Continuous (TauCeti.completedGroupAlgebra.of ℤ_[p] Γ) ∧
      Function.Injective (TauCeti.completedGroupAlgebra.of ℤ_[p] Γ) ∧
      TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U (TauCeti.completedGroupAlgebra.of ℤ_[p] Γ γ) =
        MonoidAlgebra.single (γ : Γ ⧸ U.toSubgroup) 1 :=
  ⟨TauCeti.completedGroupAlgebra.continuous_of ℤ_[p] Γ,
    TauCeti.completedGroupAlgebra.of_injective ℤ_[p] Γ,
    TauCeti.completedGroupAlgebra.proj_of ℤ_[p] Γ U γ⟩

/-- **Layer 9, commutativity is not automatic.** `Λ` is commutative exactly when `Γ` is: Tau Ceti's
`isMulCommutative_iff`. That is the case in every use below, since `Γ = Im χ ≤ ℤ_pˣ`. -/
example : IsMulCommutative (completedGroupAlgebra p Γ) ↔ IsMulCommutative Γ :=
  TauCeti.completedGroupAlgebra.isMulCommutative_iff ℤ_[p] Γ

/-- **Layer 9, functoriality of `Λ`.** A continuous homomorphism induces an `ℤ_p`-algebra
homomorphism sending group elements to group elements, surjective when the homomorphism is: Tau
Ceti's `map`, `map_of` and `map_surjective`, with the functor laws `map_id` and `map_comp`. -/
example {Δ : Type u} [Group Δ] [TopologicalSpace Δ] (f : Γ →* Δ) (hf : Continuous f)
    (hs : Function.Surjective f) (γ : Γ) :
    TauCeti.completedGroupAlgebra.map ℤ_[p] f hf (TauCeti.completedGroupAlgebra.of ℤ_[p] Γ γ) =
        TauCeti.completedGroupAlgebra.of ℤ_[p] Δ (f γ) ∧
      Function.Surjective (TauCeti.completedGroupAlgebra.map ℤ_[p] f hf) :=
  ⟨TauCeti.completedGroupAlgebra.map_of ℤ_[p] f hf γ,
    TauCeti.completedGroupAlgebra.map_surjective ℤ_[p] f hf hs⟩

end CompletedAlgebra

/-! ### The procyclic coordinate, evaluation and division

These are the statements Labute's §4 arguments run on: the power-series coordinate with its finite
levels, the evaluation homomorphism at a point of the maximal ideal, and the division criterion
that produces the basis corrections of Layer 9. `ℤ_p[[T]]` carries the coefficientwise topology
`PowerSeries.WithPiTopology`, which is compact because `ℤ_p` is. -/

section ProcyclicCoordinate

open scoped PowerSeries.WithPiTopology

variable {p : ℕ} [Fact p.Prime] {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  [CompactSpace Γ] [TotallyDisconnectedSpace Γ] [IsMulCommutative Γ] [Infinite Γ]
  (hΓ : IsProP p Γ) {γ : Γ} (hγ : (Subgroup.closure ({γ} : Set Γ)).topologicalClosure = ⊤)

/-- **Layer 9, the procyclic coordinate.** For a topological generator `γ` of an infinite
commutative pro-`p` group `Γ`, so that `Γ ≅ ℤ_p`, the assignment `T ↦ γ - 1` is an isomorphism of
`ℤ_p`-algebras `ℤ_p[[T]] ≅ Λ` (Tau Ceti's `powerSeriesCoordinate`), and a homeomorphism for the
coefficientwise topology on `ℤ_p[[T]]` and the inverse-limit topology on `Λ`
(`continuous_powerSeriesCoordinate` and `continuous_powerSeriesCoordinate_symm`). -/
example :
    TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ PowerSeries.X =
        TauCeti.completedGroupAlgebra.of ℤ_[p] Γ γ - 1 ∧
      Continuous (TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ) ∧
      Continuous (TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ).symm :=
  ⟨TauCeti.completedGroupAlgebra.powerSeriesCoordinate_X hΓ hγ,
    TauCeti.completedGroupAlgebra.continuous_powerSeriesCoordinate hΓ hγ,
    TauCeti.completedGroupAlgebra.continuous_powerSeriesCoordinate_symm hΓ hγ⟩

/-- **Layer 9, the finite levels through the coordinate.** The kernel of the projection of `Λ` to
the level `U`, read through the coordinate, is the principal ideal of `ω_U = (1 + T)^[Γ : U] - 1`:
Tau Ceti's `ker_proj_comp_powerSeriesCoordinate`. For `Γ ≅ ℤ_p` these are the ideals
`ω_m = (1 + T)^(p^m) - 1` of Iwasawa theory. ⚠ They are not the `T`-adic filtration: `ω_m` has
`T`-order one and `ω_m / T` has constant coefficient `p^m`, so `(ω_m)` is no power of `(T)`, and at
`p^m = 1` the kernel is `(T)`, not the whole algebra. -/
example (U : OpenNormalSubgroup Γ) :
    RingHom.ker ((TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U).comp
        (TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ).toAlgHom) =
      Ideal.span {((1 + PowerSeries.X) ^ Nat.card (Γ ⧸ U.toSubgroup) - 1 : PowerSeries ℤ_[p])} :=
  TauCeti.completedGroupAlgebra.ker_proj_comp_powerSeriesCoordinate hΓ hγ U

/-- **Layer 9, the dependence on the generator.** The coordinates of two topological generators
differ by the substitution `T ↦ (1 + T)^u - 1` for a unit `u` of `ℤ_p`: Tau Ceti's
`exists_isUnit_powerSeriesCoordinate_eq_subst`. Every statement below is invariant under it. -/
example {γ' : Γ} (hγ' : (Subgroup.closure ({γ'} : Set Γ)).topologicalClosure = ⊤) :
    ∃ u : ℤ_[p], IsUnit u ∧ ∀ ψ : PowerSeries ℤ_[p],
      TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ' ψ =
        TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ
          (ψ.subst (PowerSeries.binomialSeries ℤ_[p] u - 1)) :=
  TauCeti.completedGroupAlgebra.exists_isUnit_powerSeriesCoordinate_eq_subst hΓ hγ hγ'

end ProcyclicCoordinate

section Evaluation

variable {p : ℕ} [Fact p.Prime]

/-- **Layer 9, evaluation at a point of the maximal ideal.** For `p ∣ c` the point `c` is
topologically nilpotent in `ℤ_p` (`TauCeti.Huber.PadicInt.isTopologicallyNilpotent_iff_dvd`), so
Mathlib's `PowerSeries.aeval` evaluates every `ψ ∈ ℤ_p[[T]]` at `c`, as a continuous
`ℤ_p`-algebra homomorphism, with the values `X ↦ c` and `C a ↦ a` (Tau Ceti's
`PowerSeries.aeval_X` and `PowerSeries.aeval_C`). -/
example {c : ℤ_[p]} (hc : (p : ℤ_[p]) ∣ c) (a : ℤ_[p]) :
    PowerSeries.aeval (TauCeti.Huber.PadicInt.isTopologicallyNilpotent_iff_dvd.mpr hc)
        (PowerSeries.X : PowerSeries ℤ_[p]) = c ∧
      PowerSeries.aeval (TauCeti.Huber.PadicInt.isTopologicallyNilpotent_iff_dvd.mpr hc)
        (PowerSeries.C a) = algebraMap ℤ_[p] ℤ_[p] a :=
  ⟨PowerSeries.aeval_X _, PowerSeries.aeval_C _ a⟩

/-- **Layer 9, the division criterion** `(T - c) ∣ ψ ↔ ψ(c) = 0`, for `p ∣ c`, with the explicit
quotient `PowerSeries.divXSubC`: Tau Ceti's `PadicInt.X_sub_C_dvd_iff_aeval_eq_zero`. This is the
special case of Weierstrass division that Labute uses in §4.1 (p. 122), and the step that produces
the basis correction of Layer 9; the general Weierstrass preparation theorem is not a target. -/
example {c : ℤ_[p]} (hc : (p : ℤ_[p]) ∣ c) (ψ : PowerSeries ℤ_[p]) :
    (PowerSeries.X - PowerSeries.C c) ∣ ψ ↔
      PowerSeries.aeval (TauCeti.Huber.PadicInt.isTopologicallyNilpotent_iff_dvd.mpr hc) ψ = 0 :=
  PadicInt.X_sub_C_dvd_iff_aeval_eq_zero hc ψ

end Evaluation

/-! ### The dyadic branch `Γ ≅ C₂ × ℤ₂`

The second shape of the orientation image, `V^(f) = {±1} × U^(f)` with `f < ∞`, which Layer 7
proves is not procyclic. Citing the procyclic package for it is the mistake to avoid. `C₂` is
`Multiplicative (ZMod 2)`, a genuine cyclic group of order two. ⚠ It is not `ZMod 2` read as a
multiplicative monoid, whose monoid algebra is a different ring. -/

section DyadicAlgebra

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ]
  (e : Γ ≃ₜ* Multiplicative (ZMod 2) × Multiplicative ℤ_[2])

/-- **Layer 9, the dyadic coordinate.** For `e : Γ ≃ₜ* C₂ × ℤ₂` the completed algebra is the power
series ring over the group ring `ℤ₂[C₂]`, with `T ↦ γ - 1` for the generator
`γ = e.symm (1, ofAdd 1)` of the `ℤ₂`-factor and `σ ∈ C₂` going to `e.symm (σ, 1)`: Tau Ceti's
`dyadicCoordinate e`, with the values `dyadicCoordinate_X` and `dyadicCoordinate_C_single`. -/
example (σ : Multiplicative (ZMod 2)) (a : ℤ_[2]) :
    TauCeti.completedGroupAlgebra.dyadicCoordinate e PowerSeries.X =
        TauCeti.completedGroupAlgebra.of ℤ_[2] Γ (e.symm (1, Multiplicative.ofAdd 1)) - 1 ∧
      TauCeti.completedGroupAlgebra.dyadicCoordinate e
          (PowerSeries.C (MonoidAlgebra.single σ a)) =
        algebraMap ℤ_[2] (completedGroupAlgebra 2 Γ) a *
          TauCeti.completedGroupAlgebra.of ℤ_[2] Γ (e.symm (σ, 1)) :=
  ⟨TauCeti.completedGroupAlgebra.dyadicCoordinate_X e,
    TauCeti.completedGroupAlgebra.dyadicCoordinate_C_single e σ a⟩

/-- **Layer 9, the finite levels through the dyadic coordinate.** For `m : ℕ` let `U_m` be the
open normal subgroup `e⁻¹({1} × 2^m ℤ₂)`, pinned by `hU`. The kernel of the projection of `Λ` to
`U_m`, read through the dyadic coordinate, is the principal ideal of `(1 + T)^(2^m) - 1` in
`ℤ₂[C₂][[T]]`. Route: `ℤ₂[Γ ⧸ U_m] = ℤ₂[C₂][ℤ/2^m]`, and `ℤ₂[C₂]` is free over `ℤ₂` on `1` and
`σ`, so the statement is Tau Ceti's procyclic `ker_proj_comp_powerSeriesCoordinate` at `ℤ₂`, in
each of the two coordinates. At `m = 0` the ideal is `(T)`, the kernel of
`ℤ₂[C₂][[T]] → ℤ₂[C₂]`. -/
theorem completedGroupAlgebra.dyadicCoordinate_proj_eq_zero_iff (m : ℕ)
    (U : OpenNormalSubgroup Γ)
    (hU : ∀ γ : Γ, γ ∈ U.toSubgroup ↔
      (e γ).1 = 1 ∧ (2 ^ m : ℤ_[2]) ∣ Multiplicative.toAdd (e γ).2)
    (ψ : PowerSeries (MonoidAlgebra ℤ_[2] (Multiplicative (ZMod 2)))) :
    TauCeti.completedGroupAlgebra.proj ℤ_[2] Γ U
        (TauCeti.completedGroupAlgebra.dyadicCoordinate e ψ) = 0 ↔
      ((1 + PowerSeries.X) ^ (2 ^ m) - 1 :
        PowerSeries (MonoidAlgebra ℤ_[2] (Multiplicative (ZMod 2)))) ∣ ψ :=
  sorry

/-- **Layer 9, those levels are cofinal.** Every open normal subgroup of `Γ` contains some `U_m`,
so with the kernel formula above the dyadic coordinate identifies the inverse-limit topology of `Λ`
with the topology of `ℤ₂[C₂][[T]]` defined by the ideals `((1 + T)^(2^m) - 1)`. -/
theorem completedGroupAlgebra.exists_dyadicLevel_le (V : OpenNormalSubgroup Γ) :
    ∃ m : ℕ, ∀ γ : Γ, (e γ).1 = 1 → (2 ^ m : ℤ_[2]) ∣ Multiplicative.toAdd (e γ).2 →
      γ ∈ V.toSubgroup :=
  sorry

/-- **Layer 9, the splitting after inverting `2`, and its failure over `ℤ₂`.** Over `ℚ₂` the
idempotents `(1 ± σ)/2` split the group ring into the two eigenspaces of the involution,
`ℚ₂[C₂] ≅ ℚ₂ × ℚ₂` (Tau Ceti's `monoidAlgebraRatPadicCyclicTwoEquiv`). ⚠ Over `ℤ₂` there is no
splitting: the idempotents use `1/2`, and the only idempotents of `ℤ₂[C₂]` are `0` and `1`
(`monoidAlgebraPadicIntCyclicTwo_isIdempotentElem_iff`). Claiming a direct-product decomposition
over `ℤ₂` is the error this rules out. -/
example (x : MonoidAlgebra ℤ_[2] (Multiplicative (ZMod 2))) :
    Nonempty (MonoidAlgebra ℚ_[2] (Multiplicative (ZMod 2)) ≃ₐ[ℚ_[2]] ℚ_[2] × ℚ_[2]) ∧
      (IsIdempotentElem x ↔ x = 0 ∨ x = 1) :=
  ⟨⟨TauCeti.monoidAlgebraRatPadicCyclicTwoEquiv⟩,
    TauCeti.monoidAlgebraPadicIntCyclicTwo_isIdempotentElem_iff⟩

end DyadicAlgebra

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

section CompactModules

variable (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  [CompactSpace Γ] [TotallyDisconnectedSpace Γ]
  (M : Type v) [AddCommGroup M] [Module (completedGroupAlgebra p Γ) M] [TopologicalSpace M]

/-- **Layer 9, separatedness.** In a compact `Λ`-module an element lying in every open submodule is
`0`: Tau Ceti's `IsCompactModule.eq_zero_of_forall_mem_of_isOpen`, over the compact ring `Λ`. -/
example (hM : IsCompactModule p Γ M) (x : M)
    (h : ∀ N : Submodule (completedGroupAlgebra p Γ) M, IsOpen (N : Set M) → x ∈ N) : x = 0 :=
  TauCeti.IsCompactModule.eq_zero_of_forall_mem_of_isOpen hM h

/-- **Layer 9, the inverse-limit description.** A compatible family of elements of the quotients of
a compact `Λ`-module by its open submodules comes from exactly one element: Tau Ceti's
`IsCompactModule.existsUnique_forall_mkQ_eq`. This is the form in which `Λ`-module statements are
proved level by level. -/
example (hM : IsCompactModule p Γ M)
    (x : ∀ N : {N : Submodule (completedGroupAlgebra p Γ) M // IsOpen (N : Set M)}, M ⧸ N.1)
    (hx : ∀ ⦃N N' : {N : Submodule (completedGroupAlgebra p Γ) M // IsOpen (N : Set M)}⦄
      (h : N.1 ≤ N'.1), Submodule.factor h (x N) = x N') :
    ∃! m : M, ∀ N, N.1.mkQ m = x N :=
  TauCeti.IsCompactModule.existsUnique_forall_mkQ_eq hM x hx

/-- **Layer 9, quotients stay compact**: the quotient by a closed submodule is a compact module,
Tau Ceti's `IsCompactModule.quotient`. -/
example (hM : IsCompactModule p Γ M) (N : Submodule (completedGroupAlgebra p Γ) M)
    (hN : IsClosed (N : Set M)) : IsCompactModule p Γ (M ⧸ N) :=
  TauCeti.IsCompactModule.quotient hM N hN

end CompactModules

/-- **Layer 9, exactness of sequential inverse limits of compact spaces**, the compactness
statement that lets the module statements below be checked level by level. Along a tower `A` of
compact Hausdorff spaces and a tower `B` of `T1` spaces, continuous surjections `g k : A k → B k`
commuting with the transition maps lift every compatible family downstairs to a compatible family
upstairs: Tau Ceti's `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective`. The
transition maps of `A` need not be surjective. A compact module is Hausdorff
(`TauCeti.IsCompactModule.t2Space`), so towers of compact modules satisfy the hypotheses.
⚠ The separation hypotheses are not decoration. With `A k = ℤ` indiscrete and identity transitions,
`B k = ℤ/2^k` indiscrete with the reductions, and `g k` the quotient maps, every other hypothesis
holds, but the compatible residues of `-1/3` modulo `2^k` come from no single integer, since
`2^k ∣ 3a + 1` for all `k` has no solution. -/
example {A B : ℕ → Type*} [∀ k, TopologicalSpace (A k)] [∀ k, CompactSpace (A k)]
    [∀ k, T2Space (A k)] [∀ k, TopologicalSpace (B k)] [∀ k, T1Space (B k)]
    (α : ∀ k, A (k + 1) → A k) (β : ∀ k, B (k + 1) → B k) (g : ∀ k, A k → B k)
    (hα : ∀ k, Continuous (α k)) (hg : ∀ k, Continuous (g k))
    (hsq : ∀ k (a : A (k + 1)), g k (α k a) = β k (g (k + 1) a))
    (hgs : ∀ k, Function.Surjective (g k)) (b : ∀ k, B k) (hb : ∀ k, β k (b (k + 1)) = b k) :
    ∃ a : ∀ k, A k, (∀ k, α k (a (k + 1)) = a k) ∧ ∀ k, g k (a k) = b k :=
  TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective α β g hα hg hsq hgs b hb

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

section RelationModule

variable {p : ℕ} [Fact p.Prime] {F : Type u} [Group F] [TopologicalSpace F] [IsTopologicalGroup F]
  [CompactSpace F] [TotallyDisconnectedSpace F]

/-- **Layer 9, the action is conjugation, in Labute's form**: the inverse of the class of `y` sends
the class of `x ∈ X` to the class of `y⁻¹ x y`, Tau Ceti's `TopologicalAbelianization.mk_inv_smul_mk`.
It descends to `Γ` because inner automorphisms by elements of `X` act trivially on `X/(X, X)`
(`TopologicalAbelianization.toConjAct_smul_eq_self_of_mem`), which is the content of "the action
factors through `Γ = Im χ`". ⚠ This is the **conjugation** action of `Γ`, and not multiplication by
the scalar `χ(g)`: `ℤ_p² = ⟨x, y ∣ (x, y)⟩` has trivial orientation while its conjugation action on
the relation module is not trivial, so the scalar reading is false. -/
example (χ : F →* ℤ_[p]ˣ) (y : F) (x : χ.ker) :
    (y : F ⧸ χ.ker)⁻¹ • (x : TopologicalAbelianization χ.ker) =
      ((⟨y⁻¹ * x * y, χ.normal_ker.conj_mem' x x.2 y⟩ : χ.ker) :
        TopologicalAbelianization χ.ker) :=
  TopologicalAbelianization.mk_inv_smul_mk χ.ker y x

/-- **Layer 9, the `Λ`-module structure on `E`**, Tau Ceti's `IsProP.completedGroupAlgebraModule`:
a group element of `Γ` acts as it does on `E` (`completedGroupAlgebraModule_of_smul`), and the
scalar action is continuous (`continuousSMul_completedGroupAlgebraModule`). -/
example (hF : IsProP p F) (χ : F →* ℤ_[p]ˣ) (hχ : Continuous χ) (γ : F ⧸ χ.ker)
    (ξ : Additive (TopologicalAbelianization χ.ker)) :
    haveI : IsClosed (χ.ker : Set F) := χ.coe_ker ▸ isClosed_singleton.preimage hχ
    letI := (TauCeti.IsProP.topologicalAbelianization hF χ.ker).completedGroupAlgebraModule
      (F ⧸ χ.ker)
    TauCeti.completedGroupAlgebra.of ℤ_[p] (F ⧸ χ.ker) γ • ξ = γ • ξ ∧
      ContinuousSMul (completedGroupAlgebra p (F ⧸ χ.ker))
        (Additive (TopologicalAbelianization χ.ker)) :=
  haveI : IsClosed (χ.ker : Set F) := χ.coe_ker ▸ isClosed_singleton.preimage hχ
  ⟨TauCeti.IsProP.completedGroupAlgebraModule_of_smul
      (TauCeti.IsProP.topologicalAbelianization hF χ.ker) γ ξ,
    TauCeti.IsProP.continuousSMul_completedGroupAlgebraModule (F ⧸ χ.ker)
      (TauCeti.IsProP.topologicalAbelianization hF χ.ker)⟩

/-- **Layer 9, the map from the full relation module.** For a normal subgroup `R ≤ X`, the
inclusion induces `R^{ab} → E` (`TopologicalAbelianization.map` of the inclusion), which
intertwines the actions of `F ⧸ R` and of `Γ = F ⧸ X`: Tau Ceti's
`TopologicalAbelianization.map_inclusion_quotient_smul`. Labute's proofs use only the image of the
relator under it, which is why `R^{ab}` carries no statement here. -/
example (χ : F →* ℤ_[p]ˣ) (R : Subgroup F) [R.Normal] (hR : R ≤ χ.ker) (γ : F ⧸ R)
    (x : TopologicalAbelianization R) :
    TopologicalAbelianization.map (Subgroup.inclusion hR) (Subgroup.continuous_inclusion hR)
        (γ • x) =
      QuotientGroup.map R χ.ker (MonoidHom.id F) (hR.trans (Subgroup.comap_id χ.ker).ge) γ •
        TopologicalAbelianization.map (Subgroup.inclusion hR) (Subgroup.continuous_inclusion hR)
          x :=
  TopologicalAbelianization.map_inclusion_quotient_smul hR γ x

/-- **Layer 9, `E` is finitely generated over `Λ`, by classes of elements of `X`.** For `F`
topologically finitely generated pro-`p` and `χ` continuous, the classes of some finite subset of
`X` span `E` over `Λ`: Tau Ceti's
`IsProP.exists_finite_span_completedGroupAlgebraModule_topologicalAbelianization_ker_eq_top`. The
finite subset is a normal generating set of `X`, not a set of prescribed basis elements; the
expression of the relator class in a normalized basis is part of the module statements below. -/
example (hF : IsProP p F) (hfg : IsTopologicallyFinitelyGenerated F) (χ : F →* ℤ_[p]ˣ)
    (hχ : Continuous χ) :
    haveI : IsClosed (χ.ker : Set F) := χ.coe_ker ▸ isClosed_singleton.preimage hχ
    letI := (TauCeti.IsProP.topologicalAbelianization hF χ.ker).completedGroupAlgebraModule
      (F ⧸ χ.ker)
    ∃ S : Set F, S.Finite ∧ S ⊆ χ.ker ∧
      Submodule.span (completedGroupAlgebra p (F ⧸ χ.ker))
        (Additive.ofMul '' ((QuotientGroup.mk : χ.ker → TopologicalAbelianization χ.ker) ''
          (Subtype.val ⁻¹' S))) = ⊤ :=
  TauCeti.IsProP.exists_finite_span_completedGroupAlgebraModule_topologicalAbelianization_ker_eq_top
    hF hfg χ hχ

end RelationModule

/-- **`r̄ ∈ E`**, the class of an element `r ∈ X = ker χ` in `E = X/(X, X)`, written additively. For
a relator `r ∈ R ⊆ X` this is the element every Labute computation is about. -/
noncomputable def labuteRelatorClass {F : Type u} [Group F] [TopologicalSpace F]
    [IsTopologicalGroup F] {A : Type v} [Group A] (χ : F →* A) (r : F) (hr : r ∈ χ.ker) :
    Additive (TopologicalAbelianization χ.ker) :=
  Additive.ofMul ((⟨r, hr⟩ : χ.ker) : TopologicalAbelianization χ.ker)

/-- **The character associated with a Demushkin relation** (Labute §4, `χ = χ_r`): the canonical
character of `G = F/(r)` composed with the projection `F ↠ G`, a continuous character of the free
pro-`p` group itself. Labute's `X = ker χ` is its kernel. -/
noncomputable def demushkinRelatorCharacter {p : ℕ} [Fact p.Prime] {n : ℕ}
    {r : freeProP p (Fin n)} (hr : IsDemushkin p (presentedProP p (Fin n) {r})) :
    freeProP p (Fin n) →ₜ* ℤ_[p]ˣ :=
  (demushkinCharacter hr).comp (presentedProP.mk p {r})

/-- **The relator lies in `X`**, the kernel of its associated character, so its class `r̄ ∈ E` is
defined. -/
theorem demushkinRelatorCharacter_mem_ker {p : ℕ} [Fact p.Prime] {n : ℕ}
    {r : freeProP p (Fin n)} (hr : IsDemushkin p (presentedProP p (Fin n) {r})) :
    r ∈ (demushkinRelatorCharacter hr).toMonoidHom.ker := by
  rw [MonoidHom.mem_ker]
  change demushkinCharacter hr (TauCeti.presentedProP.mk p {r} r) = 1
  rw [TauCeti.presentedProP.mk_relator r (Set.mem_singleton r), map_one]

/-! ### The module statements that the classification uses

With `E` and `Λ` as above, these are the statements Labute's Theorems 5 and 6 run on: the relator
class in a spanning family, and its normalized form in each of the two branches of the image of
`χ`. The two branch statements carry Labute's hypotheses: `F` free pro-`2` of even rank `n`,
`r ∈ F²(F, F)` a Demushkin relation with `q = 2`, `χ` its associated character, and the branch of
`Im χ`. -/

section ModuleStatements

variable {p : ℕ} [Fact p.Prime] {F : Type u} [Group F] [TopologicalSpace F] [IsTopologicalGroup F]
  [CompactSpace F] [TotallyDisconnectedSpace F]

/-- **Layer 9, the relator class in a spanning family.** If `b` spans `E` over `Λ`, then `r̄` is a
`Λ`-combination of the `b i`, by Mathlib's `Submodule.mem_span_range_iff_exists_fun`. ⚠ The
spanning hypothesis is not decoration: with `m = 0`, `F ≅ ℤ_p`, `χ` trivial and `r` a generator,
`r̄ ≠ 0` while the empty sum is `0`. Labute's content (p. 122) is the explicit coefficients in a
normalized basis: in the branch `Im χ = U^[f]`, and in his convention,
`r̄ = (1 + α + (1 + T)^a) ȳ₁ + (2^g + (1 + T)^{ab} - 1) ȳ₃`. -/
theorem labuteRelatorClass_eq_sum (hF : IsProP p F) (χ : F →* ℤ_[p]ˣ) (hχ : Continuous χ)
    (r : F) (hr : r ∈ χ.ker) {m : ℕ} (b : Fin m → Additive (TopologicalAbelianization χ.ker)) :
    haveI : IsClosed (χ.ker : Set F) := χ.coe_ker ▸ isClosed_singleton.preimage hχ
    letI := (TauCeti.IsProP.topologicalAbelianization hF χ.ker).completedGroupAlgebraModule
      (F ⧸ χ.ker)
    Submodule.span (completedGroupAlgebra p (F ⧸ χ.ker)) (Set.range b) = ⊤ →
      ∃ c : Fin m → completedGroupAlgebra p (F ⧸ χ.ker),
        labuteRelatorClass χ r hr = ∑ i, c i • b i :=
  haveI : IsClosed (χ.ker : Set F) := χ.coe_ker ▸ isClosed_singleton.preimage hχ
  letI := (TauCeti.IsProP.topologicalAbelianization hF χ.ker).completedGroupAlgebraModule
    (F ⧸ χ.ker)
  fun hb ↦ ((Submodule.mem_span_range_iff_exists_fun _).mp
    (hb ▸ Submodule.mem_top :
      labuteRelatorClass χ r hr ∈ Submodule.span _ (Set.range b))).imp fun _ hc ↦ hc.symm

end ModuleStatements

/-- **Layer 9, the module statement for Labute's Theorem 5**, the branch `Im χ = U^[f]` with
`2 ≤ f < ∞`. For `r` a Demushkin relation with `q = 2` in the free pro-`2` group `F` of even rank
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
    (hq : demushkinQ hr = 2) (hn : Even n) (hrΦ : r ∈ proPFrattini 2 (freeProP 2 (Fin n)))
    (χ : freeProP 2 (Fin n) →ₜ* ℤ_[2]ˣ) (hχ : χ = demushkinRelatorCharacter hr)
    (hrχ : r ∈ χ.toMonoidHom.ker) {f : ℕ} (hf : 2 ≤ f) {u : ℤ_[2]ˣ}
    (hu : (u : ℤ_[2]) = -1 + 2 ^ f) (hrange : χ.toMonoidHom.range = procyclicClosure u)
    (y : freeProP 2 (Fin n)) (hy : ((χ y : ℤ_[2]ˣ) : ℤ_[2]) = -(1 + 2 ^ f)) :
    haveI : IsClosed (χ.toMonoidHom.ker : Set (freeProP 2 (Fin n))) :=
      χ.toMonoidHom.coe_ker ▸ isClosed_singleton.preimage χ.continuous
    letI := (TauCeti.IsProP.topologicalAbelianization (TauCeti.isProP_freeProP 2 (Fin n))
      χ.toMonoidHom.ker).completedGroupAlgebraModule (freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)
    ∃ z : Additive (TopologicalAbelianization χ.toMonoidHom.ker),
      labuteRelatorClass χ.toMonoidHom r hrχ =
        (algebraMap ℤ_[2] (completedGroupAlgebra 2 (freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker))
            (1 + 2 ^ f) +
          TauCeti.completedGroupAlgebra.of ℤ_[2] _
            (y : freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)) • z :=
  sorry

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
    (hq : demushkinQ hr = 2) (hn : Even n) (hrΦ : r ∈ proPFrattini 2 (freeProP 2 (Fin n)))
    (χ : freeProP 2 (Fin n) →ₜ* ℤ_[2]ˣ) (hχ : χ = demushkinRelatorCharacter hr)
    (hrχ : r ∈ χ.toMonoidHom.ker) {f : ℕ} (hf : 2 ≤ f)
    (hrange : χ.toMonoidHom.range = unitsPlusMinus f) (s y : freeProP 2 (Fin n))
    (hs : χ s = -1) (hy : ((χ y : ℤ_[2]ˣ) : ℤ_[2]) = 1 - 2 ^ f) :
    haveI : IsClosed (χ.toMonoidHom.ker : Set (freeProP 2 (Fin n))) :=
      χ.toMonoidHom.coe_ker ▸ isClosed_singleton.preimage χ.continuous
    letI := (TauCeti.IsProP.topologicalAbelianization (TauCeti.isProP_freeProP 2 (Fin n))
      χ.toMonoidHom.ker).completedGroupAlgebraModule (freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)
    ∃ z₁ z₃ : Additive (TopologicalAbelianization χ.toMonoidHom.ker),
      labuteRelatorClass χ.toMonoidHom r hrχ =
        (1 + TauCeti.completedGroupAlgebra.of ℤ_[2] _
            (s : freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)) • z₁ +
          (algebraMap ℤ_[2] (completedGroupAlgebra 2 (freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker))
              (2 ^ f - 1) +
            TauCeti.completedGroupAlgebra.of ℤ_[2] _
              (y : freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)) • z₃ :=
  sorry

/-! ## Layer 9: the marked normal forms

The classification is stated in marked form: for each Labute normal-form family, an isomorphism
onto the presented pro-`p` group on that relator, carrying the canonical character to the
explicit values of the character table. The unmarked isomorphism statements are corollaries. -/

section MarkedNormalForms

/-- Labute's commutator `(x, y) = x⁻¹y⁻¹xy`, the convention the normal-form words use.
⚠ Mathlib's `⁅x, y⁆` is `xyx⁻¹y⁻¹`, the other convention; the two generate the same subgroups
because `(x, y) = ⁅x⁻¹, y⁻¹⁆`, so subgroup statements use Mathlib's bracket and relator words
use this one. -/
def labuteComm {H : Type*} [Group H] (x y : H) : H := x⁻¹ * y⁻¹ * x * y

/-- The generators of `freeProP p (Fin n)` indexed by `ℕ`, with value `1` out of range, so that
the normal-form words below carry no index-bound side conditions. -/
noncomputable def freeProPGen (p n : ℕ) (i : ℕ) : freeProP p (Fin n) :=
  if h : i < n then freeProP.of p ⟨i, h⟩ else 1

/-- The generators of a presented pro-`p` group, as the images of `freeProPGen`. -/
noncomputable def presentedProPGen (p n : ℕ) (rels : Set (freeProP p (Fin n))) (i : ℕ) :
    presentedProP p (Fin n) rels :=
  QuotientGroup.mk (freeProPGen p n i)

/-- Out-of-range generators are `1` in `F`. This is the convention that lets a normal-form word
be read at every rank, and it is also why a marking clause on the `i`-th generator says nothing
about `G` when `i ≥ n`: see `not_marked_fourth_generator_of_rank_two`. -/
theorem freeProPGen_of_le (p n i : ℕ) (h : n ≤ i) : freeProPGen p n i = 1 := by
  simp [freeProPGen, not_lt.mpr h]

/-- Out-of-range generators are `1` in every presented quotient. -/
theorem presentedProPGen_of_le (p n : ℕ) (rels : Set (freeProP p (Fin n))) (i : ℕ)
    (h : n ≤ i) : presentedProPGen p n rels i = 1 := by
  rw [presentedProPGen, freeProPGen_of_le p n i h, QuotientGroup.mk_one]

/-- The `q ≠ 2` normal-form word `x₁^q(x₁,x₂)(x₃,x₄)⋯(x_{n-1},x_n)`, on an arbitrary tuple. -/
def demushkinWordNeTwo {H : Type*} [Group H] (q n : ℕ) (x : ℕ → H) : H :=
  x 0 ^ q * ((List.range (n / 2)).map fun i => labuteComm (x (2 * i)) (x (2 * i + 1))).prod

/-- The `q = 2`, `n` odd normal-form word `x₁²x₂^{2^f}(x₂,x₃)(x₄,x₅)⋯`, on an arbitrary tuple.
The parameter `f` is finite here; the value `f = ∞` is the separate word with `x₂^{2^f}`
replaced by `1`. -/
def demushkinWordTwoOdd {H : Type*} [Group H] (f n : ℕ) (x : ℕ → H) : H :=
  x 0 ^ 2 * x 1 ^ (2 ^ f) *
    ((List.range (n / 2)).map fun i => labuteComm (x (2 * i + 1)) (x (2 * i + 2))).prod

/-- The `q = 2`, `n` even normal-form word `x₁^{2+α}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯`, on an arbitrary
tuple, with the exponent `2 + α` given as a `2`-adic exponent through the `ℤ₂`-action on the
abelianization; here it is written with the natural-number exponent `2 + a` that represents it
at each finite level. -/
def demushkinWordTwoEven {H : Type*} [Group H] (a f n : ℕ) (x : ℕ → H) : H :=
  x 0 ^ (2 + a) * labuteComm (x 0) (x 1) * x 2 ^ (2 ^ f) *
    ((List.range (n / 2 - 1)).map fun i =>
      labuteComm (x (2 * i + 2)) (x (2 * i + 3))).prod

/-- The `q = 2`, `n = 2` normal-form word `x₁^{2+α}(x₁,x₂)`, on an arbitrary tuple: the rank-two
member of the even family, which has no `x₃^{2^f}` factor and hence no level `f`. It is what
`demushkinWordTwoEven` reads as at rank `2` (`demushkinWordTwoEven_two`), and it is named
separately because the marked classification at rank two prescribes character values on two
generators only. -/
def demushkinWordTwoRankTwo {H : Type*} [Group H] (a : ℕ) (x : ℕ → H) : H :=
  x 0 ^ (2 + a) * labuteComm (x 0) (x 1)

/-- At rank `2` the even word is the rank-two word: the `x₃^{2^f}` factor is `1` because the
third generator is out of range, and the commutator product beyond `(x₁,x₂)` is empty. -/
theorem demushkinWordTwoEven_two {H : Type*} [Group H] (a f : ℕ) (x : ℕ → H) (hx : x 2 = 1) :
    demushkinWordTwoEven a f 2 x = demushkinWordTwoRankTwo a x := by
  simp [demushkinWordTwoEven, demushkinWordTwoRankTwo, hx]

variable (p : ℕ) [Fact p.Prime] (G : Type) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 9, the marked classification at `q ≠ 2`.** A Demushkin group with `q ≠ 2` and rank
`n` is isomorphic to the presented group on the normal-form relator, by an isomorphism under
which the canonical character has the tabulated values: `χ(x₂)(1 - q) = 1` and `χ(x_i) = 1` on
every other generator. The equation on `x₂` is written as a product in `ℤ_p` rather than as an
inverse, so that no unit has to be constructed to state it. -/
theorem isDemushkin_marked_of_q_ne_two (hG : IsDemushkin p G) (hq : demushkinQ hG ≠ 2)
    (hn : 2 ≤ demushkinRank hG)
    [TotallyDisconnectedSpace (presentedProP p (Fin (demushkinRank hG))
      {demushkinWordNeTwo (demushkinQ hG) (demushkinRank hG)
        (freeProPGen p (demushkinRank hG))})] :
    ∃ e : G ≃ₜ* presentedProP p (Fin (demushkinRank hG))
        {demushkinWordNeTwo (demushkinQ hG) (demushkinRank hG)
          (freeProPGen p (demushkinRank hG))},
      ((demushkinCharacter hG (e.symm (presentedProPGen p (demushkinRank hG) _ 1)) : ℤ_[p])
          * (1 - (demushkinQ hG : ℤ_[p])) = 1) ∧
        ∀ i : ℕ, i ≠ 1 → i < demushkinRank hG →
          demushkinCharacter hG (e.symm (presentedProPGen p (demushkinRank hG) _ i)) = 1 :=
  sorry

/-- **Layer 9, the marked classification at `q = 2` with `n` odd.** Here `p = 2`, the relator is
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
`Subgroup ℤ_[2]ˣ`; the value `f = ∞`, image `{±1}`, is not covered by this word.
⚠ The marking prescribes a value at the third generator, so the rank must be at least `3`:
`freeProPGen` is `1` out of range (`presentedProPGen_of_le`), and at rank `1` the clause
`χ(x₃)(1 - 2^f) = 1` would read `1 - 2^f = 1`, which is false. Rank `1` is `ℤ/2` with image
`{±1}`, which `hrange` already excludes for finite `f`; `hn` makes the exclusion explicit rather
than leaving it to a computation with the image. Compare `hn` on the even theorem, where the
corresponding rank-two family is a genuine case with its own statement. -/
theorem isDemushkin_marked_of_q_two_odd (hG : IsDemushkin 2 G)
    (hq : demushkinQ hG = 2) (hodd : Odd (demushkinRank hG)) (hn : 3 ≤ demushkinRank hG)
    (f : ℕ) (hf : 2 ≤ f)
    (hrange : (demushkinCharacter hG).toMonoidHom.range = unitsPlusMinus f)
    [TotallyDisconnectedSpace (presentedProP 2 (Fin (demushkinRank hG))
      {demushkinWordTwoOdd f (demushkinRank hG) (freeProPGen 2 (demushkinRank hG))})] :
    ∃ e : G ≃ₜ* presentedProP 2 (Fin (demushkinRank hG))
        {demushkinWordTwoOdd f (demushkinRank hG) (freeProPGen 2 (demushkinRank hG))},
      demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 0)) = -1 ∧
        ((demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 2)) : ℤ_[2])
          * (1 - 2 ^ f) = 1) ∧
        ∀ i : ℕ, i ≠ 0 → i ≠ 2 → i < demushkinRank hG →
          demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ i)) = 1 :=
  sorry

/-- **Layer 9, the marked classification at `q = 2` with `n` even and `n ≥ 4`.** The relator is
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
generator, and at rank `2` that generator is `1` (`presentedProPGen_of_le`), so the clause
`χ(x₄)(1 - 2^f) = 1` would read `1 - 2^f = 1`, which is false in `ℤ₂`; the hypotheses are
otherwise satisfiable at rank `2`, by `⟨x₁, x₂ | x₁⁶(x₁,x₂)⟩` with `a = 4`, `f = 3` and image
`U^[2]`. That is `not_marked_fourth_generator_of_rank_two`, with a closed proof. The rank-two
family is `isDemushkin_marked_of_q_two_rank_two`; it is Labute's `N ≥ 1` against the `N ≥ 2` of
the `x₃^{2^f}` form, as `README.md` records under the `q = 2` even-rank case. -/
theorem isDemushkin_marked_of_q_two_even (hG : IsDemushkin 2 G)
    (hq : demushkinQ hG = 2) (heven : Even (demushkinRank hG)) (hn : 4 ≤ demushkinRank hG)
    (a f : ℕ) (hf : 2 ≤ f) (ha : 4 ∣ a)
    (hrange : (2 ^ f ∣ a ∧ (demushkinCharacter hG).toMonoidHom.range = unitsPlusMinus f) ∨
      (padicValNat 2 a < f ∧ ∃ u : ℤ_[2]ˣ, (u : ℤ_[2]) = -1 + 2 ^ padicValNat 2 a ∧
        (demushkinCharacter hG).toMonoidHom.range = procyclicClosure u))
    [TotallyDisconnectedSpace (presentedProP 2 (Fin (demushkinRank hG))
      {demushkinWordTwoEven a f (demushkinRank hG) (freeProPGen 2 (demushkinRank hG))})] :
    ∃ e : G ≃ₜ* presentedProP 2 (Fin (demushkinRank hG))
        {demushkinWordTwoEven a f (demushkinRank hG) (freeProPGen 2 (demushkinRank hG))},
      ((demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 1)) : ℤ_[2])
          * (1 + (a : ℤ_[2])) = -1) ∧
        ((demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 3)) : ℤ_[2])
          * (1 - 2 ^ f) = 1) ∧
        ∀ i : ℕ, i ≠ 1 → i ≠ 3 → i < demushkinRank hG →
          demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ i)) = 1 :=
  sorry

/-- **Layer 9, the marked classification at `q = 2` with `n = 2`.** The rank-two member of the
even family: the relator is `x₁^{2+α}(x₁,x₂)`, with no `x₃^{2^f}` factor and hence no level `f`,
and the character values are `χ(x₁) = 1` and `χ(x₂)(1 + α) = -1`. The image is `U^[v₂(α)]`,
which pins `v₂(α)` to `G` and leaves `α` free within its valuation, exactly as in the `U^[k]`
branch of the rank `≥ 4` theorem. The other branch of that theorem does not occur here: a
rank-two image is topologically generated by `χ(x₂)`, and `{±1} × U^(f)` with `f < ∞` is not
procyclic (Layer 7), so at rank two the even family with finite parameters is this word alone,
Labute's `N ≥ 1` against `N ≥ 2`. The image `{±1}`, the word `x₁²(x₁,x₂)` with `α = 0`, is the
value `f = ∞` and is not covered here, as in the odd case; at `a = 0` the hypothesis `hrange`
demands the unit `-1 + 2^0 = 0` and is unsatisfiable, not junk-valued. -/
theorem isDemushkin_marked_of_q_two_rank_two (hG : IsDemushkin 2 G)
    (hq : demushkinQ hG = 2) (hrank : demushkinRank hG = 2) (a : ℕ) (ha : 4 ∣ a)
    (hrange : ∃ u : ℤ_[2]ˣ, (u : ℤ_[2]) = -1 + 2 ^ padicValNat 2 a ∧
      (demushkinCharacter hG).toMonoidHom.range = procyclicClosure u)
    [TotallyDisconnectedSpace (presentedProP 2 (Fin (demushkinRank hG))
      {demushkinWordTwoRankTwo a (freeProPGen 2 (demushkinRank hG))})] :
    ∃ e : G ≃ₜ* presentedProP 2 (Fin (demushkinRank hG))
        {demushkinWordTwoRankTwo a (freeProPGen 2 (demushkinRank hG))},
      demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 0)) = 1 ∧
        ((demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 1)) : ℤ_[2])
          * (1 + (a : ℤ_[2])) = -1) :=
  sorry

/-- **Layer 9, rejection test: the four-generator marking is unsatisfiable at rank two.** At
rank `2` the fourth generator `presentedProPGen 2 _ _ 3` is `1`, and every isomorphism and every
character sends `1` to `1`, so the clause `χ(x₄)(1 - 2^f) = 1` of the even marked classification
reads `1 - 2^f = 1`, which is false in `ℤ₂`, for every `f`, every relator set and every
isomorphism `e`. An earlier form of `isDemushkin_marked_of_q_two_even` asserted that clause
without the hypothesis `hn`; its other hypotheses are met at rank `2` by `⟨x₁, x₂ | x₁⁶(x₁,x₂)⟩`
with `a = 4`, `f = 3` and image `U^[2]`, so it was false there. The proof is closed, so the
marking cannot be widened back to rank `2` without breaking the build. -/
theorem not_marked_fourth_generator_of_rank_two (hG : IsDemushkin 2 G)
    (hrank : demushkinRank hG = 2) (f : ℕ) (rels : Set (freeProP 2 (Fin (demushkinRank hG))))
    (e : G ≃ₜ* presentedProP 2 (Fin (demushkinRank hG)) rels) :
    ¬ ((demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) rels 3)) : ℤ_[2])
        * (1 - 2 ^ f) = 1) := by
  rw [presentedProPGen_of_le _ _ _ _ (by omega), map_one, map_one, Units.val_one, one_mul,
    sub_eq_self]
  exact pow_ne_zero _ two_ne_zero

/-- The reviewer's witness, read against the relator the earlier statement would have produced:
`⟨x₁, x₂ | x₁⁶(x₁,x₂)⟩` is `demushkinWordTwoEven 4 3` at rank `2`, and no isomorphism onto it
satisfies the fourth-generator clause with `f = 3`. -/
example (hG : IsDemushkin 2 G) (hrank : demushkinRank hG = 2)
    (e : G ≃ₜ* presentedProP 2 (Fin (demushkinRank hG))
      {demushkinWordTwoEven 4 3 (demushkinRank hG) (freeProPGen 2 (demushkinRank hG))}) :
    ¬ ((demushkinCharacter hG (e.symm (presentedProPGen 2 (demushkinRank hG) _ 3)) : ℤ_[2])
        * (1 - 2 ^ 3) = 1) :=
  not_marked_fourth_generator_of_rank_two G hG hrank 3 _ e

/-- **Layer 9, Labute Thm 2: relators with the same invariants are equivalent under an
automorphism of `F`.** This is the statement the marked instances above rest on: it is what
turns "isomorphic" into "isomorphic by a basis change", so the marked normal form is a
normalization and not a choice. -/
theorem exists_continuousMulEquiv_map_demushkinRelator (n : ℕ) (r r' : freeProP p (Fin n))
    [TotallyDisconnectedSpace (freeProP p (Fin n))]
    [TotallyDisconnectedSpace (presentedProP p (Fin n) {r})]
    [TotallyDisconnectedSpace (presentedProP p (Fin n) {r'})]
    (hr : IsDemushkin p (presentedProP p (Fin n) {r}))
    (hr' : IsDemushkin p (presentedProP p (Fin n) {r'}))
    (hrank : demushkinRank hr = demushkinRank hr')
    (himage :
      (demushkinCharacter hr).toMonoidHom.range = (demushkinCharacter hr').toMonoidHom.range) :
    ∃ φ : freeProP p (Fin n) ≃ₜ* freeProP p (Fin n),
      (Subgroup.normalClosure {φ r}).topologicalClosure
        = (Subgroup.normalClosure {r'}).topologicalClosure :=
  sorry

end MarkedNormalForms

/-! ## Layer 0: profinite foundations

The milestones of Layers 0 to 4 about the carriers above are implemented in Tau Ceti; each is a
closed proof here whose body is the Tau Ceti theorem it names. -/

/-- **Layer 0, quotients by closed normal subgroups are profinite.** Compactness and the
topological-group property are already instances; the missing ingredient is total
disconnectedness of `G ⧸ N` for `N` closed, which is Tau Ceti's instance
`TauCeti.QuotientGroup.instTotallyDisconnectedSpace` (the clopen-basis argument). -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (N : Subgroup G) [N.Normal] (hN : IsClosed (N : Set G)) :
    TotallyDisconnectedSpace (G ⧸ N) :=
  haveI := hN
  inferInstance

/-- **Layer 0, the completion of a finite group is itself.** The unit of the profinite
completion adjunction is bijective on a finite (discrete) group: the non-vacuity check for
the completion layer, Tau Ceti's `TauCeti.ProfiniteCompletion.etaFn_bijective_of_finite`. -/
example {G : Type u} [Group G] [Finite G] :
    Function.Bijective (ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of G)) :=
  TauCeti.ProfiniteCompletion.etaFn_bijective_of_finite G

/-! ## Layer 1: the supernatural order and index -/

/-- **Layer 1, the order of a finite group.** On a finite discrete group the supernatural
order is the prime factorization of `Nat.card G`, the compatibility that keeps
`profiniteOrder` honest: Tau Ceti's `TauCeti.profiniteOrder_apply_of_finite`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [DiscreteTopology G] [Finite G]
    (p : Nat.Primes) : profiniteOrder G p = (padicValNat p (Nat.card G) : ℕ∞) :=
  TauCeti.profiniteOrder_apply_of_finite G p

/-- **Layer 1, the index of an open subgroup.** The supernatural index of an open subgroup is
the factorization of Mathlib's `Nat.card`-valued `Subgroup.index`, the compatibility that
pins `profiniteIndex` against the existing API: Tau Ceti's
`OpenSubgroup.profiniteIndex_apply_eq_padicValNat`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (U : OpenSubgroup G) (ℓ : Nat.Primes) :
    profiniteIndex U.toSubgroup ℓ = (padicValNat ℓ U.toSubgroup.index : ℕ∞) :=
  U.profiniteIndex_apply_eq_padicValNat ℓ

/-- **Layer 1, the index of a closed subgroup as an lcm.** The primewise definition agrees with
the supremum, over open subgroups above `H`, of their indices: Tau Ceti's
`Subgroup.profiniteIndex_apply_eq_iSup_openSubgroup`. This is the description the literature
uses. Both sides depend only on the closure of `H` (`Subgroup.profiniteIndex_topologicalClosure`,
and an open subgroup contains `H` exactly when it contains its closure), so the equality holds for
every `H`; closedness is what the literature assumes, and it is kept as a hypothesis here. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (H : Subgroup G) (_hH : IsClosed (H : Set G))
    (ℓ : Nat.Primes) :
    profiniteIndex H ℓ = ⨆ U : {U : OpenSubgroup G // H ≤ U.toSubgroup},
      (padicValNat ℓ U.1.toSubgroup.index : ℕ∞) :=
  H.profiniteIndex_apply_eq_iSup_openSubgroup ℓ

/-- **Layer 1, Lagrange.** The supernatural order of a profinite group is the product of the
order of a closed subgroup and its index (Ribes–Zalesskii §2.3): Tau Ceti's
`Subgroup.profiniteOrder_apply_eq_add_profiniteIndex`, whose product form is
`Subgroup.profiniteOrder_eq_mul_profiniteIndex`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (H : Subgroup G) (hH : IsClosed (H : Set G))
    (ℓ : Nat.Primes) :
    profiniteOrder G ℓ = profiniteOrder H ℓ + profiniteIndex H ℓ :=
  H.profiniteOrder_apply_eq_add_profiniteIndex hH ℓ

/-- **Layer 1 ↔ 3, pro-`p` means order a power of `p`.** A profinite group is pro-`p` iff its
supernatural order is supported at `p` alone: Tau Ceti's
`TauCeti.isProP_iff_profiniteOrder_apply_eq_zero`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] :
    IsProP p G ↔ ∀ q : Nat.Primes, (q : ℕ) ≠ p → profiniteOrder G q = 0 :=
  TauCeti.isProP_iff_profiniteOrder_apply_eq_zero

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
so that the statement keeps its interface. -/
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

/-- **Layer 2, conjugacy of `p`-Sylow subgroups.** Any two `p`-Sylow subgroups of a profinite
group are conjugate: Tau Ceti's `TauCeti.IsProPSylow.exists_map_conj_eq`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] {P Q : Subgroup G}
    (hP : IsProPSylow p P) (hQ : IsProPSylow p Q) :
    ∃ g : G, Q = P.map (MulAut.conj g).toMonoidHom :=
  (TauCeti.IsProPSylow.exists_map_conj_eq hP hQ).imp fun _ h ↦ h.symm

/-- **Layer 2, Galois-group acceptance example.** The Galois group of any Galois extension,
with its Krull topology, has a `p`-Sylow subgroup: Tau Ceti's `TauCeti.exists_isProPSylow`, at
Mathlib's compact and totally separated Krull topology on `Gal(K/k)`. This is the abstract
group-theoretic half of the fixed-field statement that maximal prime-to-`p` subextensions exist;
the fixed-field dictionary is deliberately left to a Galois-theory consumer. -/
example (p : ℕ) [Fact p.Prime] {k K : Type u} [Field k] [Field K] [Algebra k K]
    [IsGalois k K] : ∃ P : Subgroup (K ≃ₐ[k] K), IsProPSylow p P :=
  TauCeti.exists_isProPSylow p (K ≃ₐ[k] K)

/-- **Layer 2, the `p`-Sylow subgroup of `ℤ̂`.** Every `p`-Sylow subgroup of the profinite
completion of `ℤ` is isomorphic, as a topological group, to `ℤ_p`: Tau Ceti's
`TauCeti.IsProPSylow.continuousMulEquivPadicInt`, the restriction of the quotient map to the
maximal pro-`p` quotient followed by `TauCeti.zHat.maximalProPQuotientEquivPadicInt`. It is
proved through the chain of universal properties of Layer 4, and **not** through a product
decomposition `ℤ̂ ≅ ∏_ℓ ℤ_ℓ`, which is not a target of this roadmap. -/
example (p : ℕ) [Fact p.Prime] (P : Subgroup zHat) (hP : IsProPSylow p P) :
    Nonempty (P ≃ₜ* Multiplicative ℤ_[p]) :=
  ⟨TauCeti.IsProPSylow.continuousMulEquivPadicInt hP⟩

/-! ## Layer 3: pro-`p` groups, the maximal pro-`p` quotient, Frattini theory, generation -/

/-- **Layer 3, the maximal pro-`p` quotient is pro-`p`**, Tau Ceti's
`TauCeti.isProP_maximalProPQuotient`. (Compactness argument: an open normal subgroup containing
the pro-`p` kernel already contains a member of the defining family.) -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] : IsProP p (maximalProPQuotient p G) :=
  TauCeti.isProP_maximalProPQuotient

/-- **Layer 3, universal property of the maximal pro-`p` quotient.** Continuous homomorphisms
from `G` to a pro-`p` profinite group factor uniquely through `G(p)`: Tau Ceti's
`TauCeti.existsUnique_continuousMonoidHom_maximalProPQuotient`, with the factorisation
`TauCeti.maximalProPQuotient.lift`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] {P : Type v} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] (hP : IsProP p P)
    (f : G →* P) (hf : Continuous f) :
    ∃! g : maximalProPQuotient p G →* P,
      Continuous g ∧ ∀ x : G, g (QuotientGroup.mk x) = f x :=
  TauCeti.existsUnique_continuousMonoidHom_maximalProPQuotient hP f hf

/-- **Layer 3, the pro-`p` kernel is closed**: Tau Ceti's instance `TauCeti.isClosed_proPKernel`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    IsClosed ((proPKernel p G : Subgroup G) : Set G) :=
  TauCeti.isClosed_proPKernel

/-- **Layer 3, the pro-`p` kernel is topologically characteristic**: Tau Ceti's
`TauCeti.map_proPKernel_eq`. Invariance under *continuous* automorphisms is the right statement:
the subgroup is defined through open normal subgroups, and an abstract automorphism of a
profinite group need not be continuous. The same statement holds for `proPFrattini`
(`ContinuousMulEquiv.map_proPFrattini_eq`) and is wanted for every `pLowerCentralSeries` term. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (f : G ≃ₜ* G) :
    (proPKernel p G).map f.toMulEquiv.toMonoidHom = proPKernel p G :=
  TauCeti.map_proPKernel_eq f

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

/-- **Layer 3, the Frattini subgroup is closed and normal**: Tau Ceti's instances
`TauCeti.isClosed_proPFrattini` and `TauCeti.proPFrattini_normal`. Its characteristicity is
`ContinuousMulEquiv.map_proPFrattini_eq`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (_hG : IsProP p G) :
    IsClosed ((proPFrattini p G : Subgroup G) : Set G) ∧ (proPFrattini p G).Normal :=
  ⟨TauCeti.isClosed_proPFrattini, inferInstance⟩

/-- **Layer 3, the Frattini subgroup of a profinite group is `closure (Gᵖ[G,G])`**: Tau Ceti's
`TauCeti.proPFrattini_eq_topologicalClosure`, which needs no pro-`p` hypothesis. The index-`p`
form and the verbal form agree: for pro-`p` `G` the open normal subgroups of index `p` are exactly
the maximal open subgroups, and their intersection is the closure of the subgroup generated by
`p`-th powers and commutators. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (_hG : IsProP p G) :
    proPFrattini p G
      = (Subgroup.closure (Set.range fun g : G ↦ g ^ p) ⊔ commutator G).topologicalClosure :=
  TauCeti.proPFrattini_eq_topologicalClosure Fact.out

/-- **Layer 3, index-`p` detection (the Frattini generation criterion, subgroup form).** A
closed subgroup of a pro-`p` group contained in no open normal subgroup of index `p` is the
whole group: Tau Ceti's `TauCeti.IsProP.eq_top_of_forall_not_le_openNormalSubgroup_index_eq`.
This is `H · Φ(G) = G → H = G` (`TauCeti.IsProP.eq_top_of_sup_proPFrattini_eq_top`). -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    {H : Subgroup G} (hH : IsClosed (H : Set G))
    (h : ∀ U : OpenNormalSubgroup G, U.toSubgroup.index = p → ¬ H ≤ U.toSubgroup) :
    H = ⊤ :=
  TauCeti.IsProP.eq_top_of_forall_not_le_openNormalSubgroup_index_eq hG hH h

/-- **Layer 3, the Burnside basis surjectivity criterion (hom form).** A continuous
homomorphism between pro-`p` profinite groups whose composites to all index-`p` quotients of
the target are surjective is surjective: the criterion used everywhere for checking
surjectivity on generators mod Frattini, Tau Ceti's
`TauCeti.IsProP.surjective_iff_surjective_quotient_index_eq`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] {H : Type v}
    [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H]
    [TotallyDisconnectedSpace H] (hH : IsProP p H) (f : G →* H) (hf : Continuous f)
    (hsurj : ∀ U : OpenNormalSubgroup H, U.toSubgroup.index = p →
      Function.Surjective ((QuotientGroup.mk' U.toSubgroup).comp f)) :
    Function.Surjective f :=
  (TauCeti.IsProP.surjective_iff_surjective_quotient_index_eq hH f hf).mpr hsurj

/-- **Layer 3, the topological finite generation criterion.** A pro-`p` group is
topologically finitely generated iff its Frattini quotient is finite (`index ≠ 0` is
Mathlib's idiom for finiteness of the quotient), the Burnside basis theorem's counting
half: Tau Ceti's
`TauCeti.IsProP.isTopologicallyFinitelyGenerated_iff_finite_quotient_proPFrattini`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G) :
    IsTopologicallyFinitelyGenerated G ↔ (proPFrattini p G).index ≠ 0 :=
  (TauCeti.IsProP.isTopologicallyFinitelyGenerated_iff_finite_quotient_proPFrattini hG).trans
    Subgroup.index_ne_zero_iff_finite.symm

/-- **Layer 3, the two rank notions agree.** The natural-number accessor computes the
cardinal rank whenever it is available: Tau Ceti's
`TauCeti.topologicalGeneratorRankNat_eq_topologicalGeneratorRank`. Every theorem that subtracts
ranks is stated with the accessor and this equality is how it connects to the general theory. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (h : IsTopologicallyFinitelyGenerated G) :
    (topologicalGeneratorRankNat G h : Cardinal.{u}) = topologicalGeneratorRank G :=
  TauCeti.topologicalGeneratorRankNat_eq_topologicalGeneratorRank h

/-- **Layer 3, Burnside basis theorem, generation form.** A subset generates a pro-`p` group
topologically iff its image generates the Frattini quotient topologically: Tau Ceti's
`TauCeti.topologicallyGenerates_iff_frattiniQuotient`. The closure on the quotient side is not
decoration: at infinite rank the images of a generating set span only a dense subspace of
`G/Φ(G)`. This is the statement every later layer uses, and it needs no finiteness hypothesis and
no vector-space structure. The cardinal form, against the discrete dual `Hom_cont(G, 𝔽_p)`, is the
companion statement; it is *not* an identity with `Module.rank (ZMod p) (G/Φ(G))`, which is
strictly larger at infinite rank. The interface table names this theorem. -/
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
compact group: Tau Ceti's `TauCeti.topologicalGeneratorRankNat_le_of_openSubgroup`. The
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

/-- **Layer 3, every profinite group has a generating set converging to `1`**
(RZ Prop. 2.6.2): Tau Ceti's `TauCeti.exists_convergesToOne_topologicallyGenerates`. This is what
makes `topologicalGeneratorRank` an infimum over a nonempty family, so it comes before any theorem
that computes a rank. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] :
    ∃ s : Set G, ConvergesToOne s ∧ (Subgroup.closure s).topologicalClosure = ⊤ :=
  TauCeti.exists_convergesToOne_topologicallyGenerates

/-- **Layer 3, Burnside basis theorem, numerical form.** For a topologically finitely
generated pro-`p` group the Frattini quotient has order `p^{d(G)}`: the count that turns the
generation statement into the rank formula `d(G) = dim_{𝔽_p} G/Φ(G)`, Tau Ceti's
`TauCeti.IsProP.natCard_quotient_proPFrattini`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (hfg : IsTopologicallyFinitelyGenerated G) :
    Nat.card (G ⧸ proPFrattini p G) = p ^ topologicalGeneratorRankNat G hfg :=
  TauCeti.IsProP.natCard_quotient_proPFrattini hG hfg

/-- **Layer 3, the Gaschütz lifting lemma.** Along a continuous surjection of profinite
groups, a topological generating tuple of the target lifts to a topological generating tuple
of the source, provided the source is generated by that many elements: Tau Ceti's
`TauCeti.exists_comp_eq_and_topologicalClosure_closure_range_eq_top`. (Nakayama-style
generator lifting; the mechanism behind minimal presentations.) -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] {H : Type v} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H] (f : G →* H)
    (hf : Continuous f) (hfs : Function.Surjective f) {n : ℕ} (g : Fin n → G)
    (hg : (Subgroup.closure (Set.range g)).topologicalClosure = ⊤) (h : Fin n → H)
    (hh : (Subgroup.closure (Set.range h)).topologicalClosure = ⊤) :
    ∃ g' : Fin n → G, (∀ i, f (g' i) = h i) ∧
      (Subgroup.closure (Set.range g')).topologicalClosure = ⊤ := by
  obtain ⟨g', hg', hgen⟩ :=
    TauCeti.exists_comp_eq_and_topologicalClosure_closure_range_eq_top hf hfs hg hh
  exact ⟨g', fun i ↦ congrFun hg' i, hgen⟩

/-- **Layer 3, finitely generated profinite groups are Hopfian.** A continuous surjective
endomorphism of a topologically finitely generated profinite group is an isomorphism, the
last step of every two-sided comparison argument (Layer 8): Tau Ceti's
`TauCeti.IsTopologicallyFinitelyGenerated.bijective_of_surjective`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hfg : IsTopologicallyFinitelyGenerated G) (f : G →* G)
    (hc : Continuous f) (hs : Function.Surjective f) : Function.Bijective f :=
  TauCeti.IsTopologicallyFinitelyGenerated.bijective_of_surjective hfg hc hs

/-- **Layer 3, countably many open normal subgroups.** A topologically finitely generated
profinite group has finitely many open subgroups of each index, hence countably many open
normal subgroups: Tau Ceti's
`TauCeti.IsTopologicallyFinitelyGenerated.countable_openNormalSubgroup`.
This is the hypothesis later layers carry explicitly; it is **not** a Layer 0 statement, because
its proof needs the finiteness count proved here. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hfg : IsTopologicallyFinitelyGenerated G) :
    Countable (OpenNormalSubgroup G) :=
  TauCeti.IsTopologicallyFinitelyGenerated.countable_openNormalSubgroup hfg

/-- **Layer 3, a descending cofinal sequence of open normal subgroups.** The sequential form
that Layer 8's assembly arguments use, obtained from countability by intersecting finite
initial segments: Tau Ceti's
`TauCeti.IsTopologicallyFinitelyGenerated.exists_antitone_openNormalSubgroup_cofinal`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hfg : IsTopologicallyFinitelyGenerated G) :
    ∃ N : ℕ → OpenNormalSubgroup G, (∀ k, (N (k + 1)).toSubgroup ≤ (N k).toSubgroup) ∧
      ∀ U : OpenNormalSubgroup G, ∃ k, (N k).toSubgroup ≤ U.toSubgroup := by
  obtain ⟨N, hN, hcof⟩ :=
    TauCeti.IsTopologicallyFinitelyGenerated.exists_antitone_openNormalSubgroup_cofinal hfg
  exact ⟨N, fun k ↦ hN (Nat.le_succ k), hcof⟩

/-- **Layer 3, rank sanity check.** The minimal number of generators of the finite `2`-group
`ℤ/4 × ℤ/2` is `2`, the Burnside-basis numerology (`G/Φ(G) ≅ (ℤ/2)²`) in its abstract
finite instance. -/
example : Group.rank (Multiplicative (ZMod 4) × Multiplicative (ZMod 2)) = 2 :=
  sorry

/-! ## Layer 4: free pro-`p` groups on finite sets, and abelian pro-`p` structure -/

/-- **Layer 4, `freeProP` is the free pro-`C` object at `C = ` finite `p`-groups.** The two
constructions agree, so that no statement has to choose between them: Tau Ceti's
`TauCeti.freeProC.equivFreeProP`, which sends generators to generators. -/
example {p : ℕ} [Fact p.Prime] {X : Type u} :
    Nonempty (freeProC (finiteGroupClassP p) X ≃ₜ* freeProP p X) :=
  ⟨TauCeti.freeProC.equivFreeProP p X⟩

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

/-- **Layer 4, topological finite generation of free pro-`p` groups.** The free pro-`p`
group on a finite set is topologically finitely generated, by the images of the free
generators: Tau Ceti's `TauCeti.isTopologicallyFinitelyGenerated_freeProP`. -/
example {p : ℕ} {X : Type u} [Finite X] : IsTopologicallyFinitelyGenerated (freeProP p X) :=
  TauCeti.isTopologicallyFinitelyGenerated_freeProP p X

/-- **Layer 4, the rank of a free pro-`p` group on a finite set**: Tau Ceti's
`TauCeti.topologicalGeneratorRank_freeProP`, with the natural-number form
`TauCeti.topologicalGeneratorRankNat_freeProP`. Finiteness of `X` is a hypothesis, not a
convenience: `freeProP p S` for infinite discrete `S` has rank `p ^ #S`, not `#S`, which is
why the infinite-rank free objects are built on a profinite space in Layer 10. -/
example {p : ℕ} [Fact p.Prime] {X : Type u} [Finite X] :
    topologicalGeneratorRank (freeProP p X) = Cardinal.mk X :=
  TauCeti.topologicalGeneratorRank_freeProP p

/-- **Layer 4, free groups are residually `p`.** The canonical map from the discrete free
group to the free pro-`p` group is injective: the classical residual `p`-finiteness of free
groups, and the reason the generators of `freeProP` behave like free generators. This is Tau
Ceti's `TauCeti.freeProP.fromFreeGroup_injective`, for the canonical map
`TauCeti.freeProP.fromFreeGroup`, the unit of the profinite completion followed by the maximal
pro-`p` quotient map. -/
example {p : ℕ} [Fact p.Prime] {X : Type u} :
    Function.Injective (TauCeti.freeProP.fromFreeGroup p X) :=
  TauCeti.freeProP.fromFreeGroup_injective

/-- **Layer 4, the maximal pro-`p` quotient of `ℤ̂` is `ℤ_p`.** Step (1)–(2) of the
identification chain, and the statement the Layer 2 `ℤ̂`-Sylow example rests on: Tau Ceti's
`TauCeti.zHat.maximalProPQuotientEquivPadicInt`. -/
theorem maximalProPQuotient_zHat_equiv_padicInt (p : ℕ) [Fact p.Prime] :
    Nonempty (maximalProPQuotient p zHat ≃ₜ* Multiplicative ℤ_[p]) :=
  ⟨TauCeti.zHat.maximalProPQuotientEquivPadicInt p⟩

/-- **Layer 4, the rank-one free pro-`p` group is `ℤ_p`.** Step (3): both objects represent
the same functor on pro-`p` profinite groups, so the free object's uniqueness gives the
isomorphism, Tau Ceti's `TauCeti.freeProP.equivPadicInt`. This is what every later
`ℤ_p`-coefficient argument cites. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty (freeProP p (Fin 1) ≃ₜ* Multiplicative ℤ_[p]) :=
  ⟨TauCeti.freeProP.equivPadicInt p (Fin 1)⟩

/-- **Layer 4, exponentiation by `ℤ_p` in an abelian pro-`p` group.** The continuous action
obtained as the inverse limit of exponentiation in the finite abelian `p`-quotients; it is
what makes an abelian pro-`p` group a topological `ℤ_p`-module. The exponentiation is Tau Ceti's
`TauCeti.IsProP.padicPow`, defined on every pro-`p` group, with `padicPow_one`, `padicPow_add`,
`padicPow_mul`, `padicPow_natCast` and `continuous_padicPow`, and this is a closed proof from
them. -/
example (p : ℕ) [Fact p.Prime] {A : Type u} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A] (hA : IsProP p A) :
    ∃ e : ℤ_[p] → A → A, Continuous (fun x : ℤ_[p] × A ↦ e x.1 x.2) ∧
      (∀ a, e 1 a = a) ∧ (∀ (l m : ℤ_[p]) (a : A), e (l * m) a = e l (e m a)) ∧
      (∀ (l m : ℤ_[p]) (a : A), e (l + m) a = e l a * e m a) ∧
      ∀ (n : ℕ) (a : A), e (n : ℤ_[p]) a = a ^ n :=
  ⟨fun l a ↦ TauCeti.IsProP.padicPow hA a l, TauCeti.IsProP.continuous_padicPow hA,
    TauCeti.IsProP.padicPow_one hA,
    fun l m a ↦ by rw [mul_comm]; exact TauCeti.IsProP.padicPow_mul hA a m l,
    fun l m a ↦ TauCeti.IsProP.padicPow_add hA a l m,
    fun n a ↦ TauCeti.IsProP.padicPow_natCast hA a n⟩

/-- **Layer 4, the structure theorem for finitely generated abelian pro-`p` groups.**
`A ≅ ℤ_p^r × T` with `T` a finite abelian `p`-group: Tau Ceti's
`TauCeti.IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod`, which also makes every
exponent positive. Uniqueness of `r` and of the elementary divisors of `T` are separate
statements. Layer 7's `q`-invariant is defined from `T`, so this theorem is what makes
`demushkinQ` well defined from `IsDemushkin` alone. -/
example (p : ℕ) [Fact p.Prime] {A : Type} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A] (hA : IsProP p A)
    (hfg : IsTopologicallyFinitelyGenerated A) :
    ∃ (r m : ℕ) (e : Fin m → ℕ),
      Nonempty (A ≃ₜ*
        Multiplicative ((Fin r → ℤ_[p]) × ((i : Fin m) → ZMod (p ^ e i)))) := by
  obtain ⟨r, m, e, -, he⟩ :=
    TauCeti.IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod hA hfg
  exact ⟨r, m, e, he⟩

/-! ## Layer 5: presentations -/

/-- **Layer 5, a continuous section along a finite kernel.** The lemma the cocycle side of
the extension dictionary runs on, in the only case it is used: `N` finite, `E ⧸ N` possibly
infinite. It is the finite case of Tau Ceti's `TauCeti.exists_continuous_section`, which gives a
continuous normalized section along any closed subgroup of a profinite group; a finite subgroup is
closed. ⚠ The corresponding statement for an arbitrary surjection of profinite *spaces* is
false, so nothing here appeals to one. -/
example {E : Type u} [Group E] [TopologicalSpace E] [IsTopologicalGroup E] [CompactSpace E]
    [TotallyDisconnectedSpace E] (N : Subgroup E) [N.Normal] (hN : Finite N) :
    ∃ s : E ⧸ N → E, Continuous s ∧ (∀ x, (QuotientGroup.mk (s x) : E ⧸ N) = x) ∧ s 1 = 1 := by
  have := hN
  exact TauCeti.exists_continuous_section N (Set.toFinite (N : Set E)).isClosed

/-- **Layer 5, the map that proves `D₀` is nontrivial.** Not "map onto some finite
`2`-group": the map is the one sending `A ↦ 1`, `S ↦` the generator of `ℤ/2`, `Y ↦ 1`, Tau Ceti's
`TauCeti.d0FreeCharacter`. The relator `A²S⁴(S,Y)` maps to `2·0 + 4·1 = 0`
(`TauCeti.d0FreeCharacter_d0Relator`), so it factors through `D₀`, and the induced map is
surjective because `S` already hits the generator (`TauCeti.d0FreeCharacter_surjective`). -/
example : ∃ φ : freeProP 2 (Fin 3) →* Multiplicative (ZMod 2),
    Continuous φ ∧ φ (freeProP.of 2 0) = 1 ∧
      φ (freeProP.of 2 1) = Multiplicative.ofAdd 1 ∧ φ (freeProP.of 2 2) = 1 ∧
      φ d0Relator = 1 ∧ Function.Surjective φ :=
  ⟨TauCeti.d0FreeCharacter.toMonoidHom, TauCeti.d0FreeCharacter.continuous,
    TauCeti.d0FreeCharacter_of 0, TauCeti.d0FreeCharacter_of 1, TauCeti.d0FreeCharacter_of 2,
    TauCeti.d0FreeCharacter_d0Relator, TauCeti.d0FreeCharacter_surjective⟩

/-- **Layer 5, the induced surjection `D₀ ↠ ℤ/2`**, Tau Ceti's `TauCeti.d0Character`. -/
example : ∃ f : demushkinD0 →* Multiplicative (ZMod 2),
    Continuous f ∧ Function.Surjective f :=
  ⟨TauCeti.d0Character.toMonoidHom, TauCeti.d0Character.continuous,
    TauCeti.d0Character_surjective⟩

/-- **Layer 5, non-vacuity of the presentation machinery.** `D₀` is nontrivial, a corollary
of the surjection above: Tau Ceti's `Nontrivial` instance on `TauCeti.demushkinD0`. -/
example : Nontrivial demushkinD0 :=
  inferInstance

/-- **Layer 5, presented groups are pro-`p`.** The presentation construction lands in
pro-`2` groups: `D₀` is pro-`2` (`TauCeti.presentedProP.isProP`), and topologically finitely
generated (`TauCeti.presentedProP.isTopologicallyFinitelyGenerated`). -/
example : IsProP 2 demushkinD0 ∧ IsTopologicallyFinitelyGenerated demushkinD0 :=
  ⟨TauCeti.presentedProP.isProP 2 (Fin 3) {TauCeti.d0Relator},
    TauCeti.presentedProP.isTopologicallyFinitelyGenerated⟩

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

/-- **Layer 7, `-3` is a `2`-adic unit**: Tau Ceti's `TauCeti.isUnit_neg_three`. The value
`χ(Y) = (-3)⁻¹` of the standard orientation is the inverse of this unit, so the unit is named
rather than written as a literal. -/
theorem isUnit_neg_three : IsUnit (-3 : ℤ_[2]) := TauCeti.isUnit_neg_three

/-- The `2`-adic unit with value `-3`: Tau Ceti's `TauCeti.negThreeUnit`. -/
noncomputable abbrev negThreeUnit : ℤ_[2]ˣ := TauCeti.negThreeUnit

/-- **Layer 7, the value of `negThreeUnit`.** -/
theorem negThreeUnit_coe : (negThreeUnit : ℤ_[2]) = -3 := TauCeti.negThreeUnit_coe

/-- **The standard orientation of `D₀`**, the continuous character `D₀ → ℤ₂ˣ` with values
`(-1, 1, (-3)⁻¹)` on `(A, S, Y)`: Tau Ceti's `TauCeti.standardD0Orientation`, built by
`TauCeti.d0Lift` into the pro-`2` group `ℤ₂ˣ`. It exists because those values kill the relator
`A²S⁴(S, Y)`: the relator maps to `(-1)² · 1⁴ · 1 = 1`, the commutator dying because `ℤ₂ˣ` is
abelian. It is data, so it is a `def`, and the value theorems below are what pin it. -/
noncomputable abbrev standardD0Orientation : demushkinD0 →ₜ* ℤ_[2]ˣ :=
  TauCeti.standardD0Orientation

/-- **Layer 7, `χ(A) = -1`.** -/
theorem standardD0Orientation_d0A : standardD0Orientation d0A = -1 :=
  TauCeti.standardD0Orientation_d0A

/-- **Layer 7, `χ(S) = 1`.** -/
theorem standardD0Orientation_d0S : standardD0Orientation d0S = 1 :=
  TauCeti.standardD0Orientation_d0S

/-- **Layer 7, `χ(Y) = (-3)⁻¹`.** In the notation of the Layer 9 character table this is
`(1 - 2²)⁻¹` at `f = 2` (`TauCeti.negThreeUnit_inv_mul_one_sub_two_pow_two`). -/
theorem standardD0Orientation_d0Y : standardD0Orientation d0Y = negThreeUnit⁻¹ :=
  TauCeti.standardD0Orientation_d0Y

/-- **Layer 7, the standard orientation is continuous**, being a continuous homomorphism. -/
theorem standardD0Orientation_continuous : Continuous standardD0Orientation :=
  standardD0Orientation.continuous

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

/-- **Layer 7, the standard orientation kills the relator.** The compatibility that makes the
character descend from the free pro-`2` group to `D₀`, written on the relator word itself: Tau
Ceti's `TauCeti.standardD0Orientation_relator`. Only the values on `A` and `S` matter, since the
commutator `(S, Y)` dies in the abelian group `ℤ₂ˣ`. -/
theorem standardD0Orientation_relator (φ : freeProP 2 (Fin 3) →* ℤ_[2]ˣ)
    (hA : φ (freeProP.of 2 0) = -1) (hS : φ (freeProP.of 2 1) = 1) : φ d0Relator = 1 :=
  TauCeti.standardD0Orientation_relator φ hA hS

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
  {M : Type v} [CommGroup M] [TopologicalSpace M] [IsTopologicalGroup M]
  [MulDistribMulAction G M] [ContinuousSMul G M] [CompactSpace M]
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
`σ` homeomorphically. -/
theorem ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq
    (f : M →*[G] N) (hf : Continuous f) (X : TauCeti.ProfiniteGroupExtension G M)
    (Y : TauCeti.ProfiniteGroupExtension G N)
    (h : (X.map f hf).contCohomologyClass = Y.contCohomologyClass) :
    ∃ φ : X.E →* Y.E, Continuous φ ∧
      φ.comp X.toGroupExtension.inl = Y.toGroupExtension.inl.comp (f : M →* N) ∧
      Y.toGroupExtension.rightHom.comp φ = X.toGroupExtension.rightHom :=
  sorry

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
  sorry

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

/-- **Layer 5.2, solvability with elementary abelian kernel from `H²`.** If `H²(G, M) = 0` for every
finite discrete `G`-module `M` killed by `p`, every finite embedding problem for `G` with
commutative kernel killed by `p` has a solution: Tau Ceti's
`hasElementaryAbelianSolutions_of_subsingleton_continuousCohomology_two`. This is the single step
that consumes cohomology; the obstruction is the class of the pullback extension,
`TauCeti.FiniteEmbeddingProblem.obstruction`, which vanishes exactly when the problem is solvable
(`exists_isSolution_iff_obstruction_eq_zero`). -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G]
    (h : ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M] [Finite M]
      [DistribMulAction G M] [ContinuousSMul G M], (∀ m : M, p • m = 0) →
        Subsingleton (_root_.continuousCohomology 2 (TauCeti.ofDiscreteModule ℤ G M))) :
    TauCeti.HasElementaryAbelianSolutions p G :=
  TauCeti.hasElementaryAbelianSolutions_of_subsingleton_continuousCohomology_two h

open scoped commutatorElement in
/-- **Layer 5.3, the lower `p`-central reduction.** A finite normal `p`-subgroup `N = ker α` of `E`
is filtered by `λ_0(N) = N`, `λ_{k+1}(N) = λ_k(N)^p [λ_k(N), N]`, which reaches `1` in finitely many
steps and whose factors are elementary abelian: Tau Ceti's
`Subgroup.exists_pLowerCentral_filtration_of_isPGroup`. ⚠ Each `λ_k(N)` is **characteristic** in
`N`, hence normal in `E`; that is what makes the factors `Q`-modules and the reduction work. An
arbitrary central series of `N` need not be stable under conjugation by `E`. -/
example {p : ℕ} [Fact p.Prime] {E : Type u} [Group E] (N : Subgroup E) [N.Normal] [Finite N]
    (hN : IsPGroup p N) :
    ∃ (m : ℕ) (lam : ℕ → Subgroup E), lam 0 = N ∧ lam m = ⊥ ∧
      (∀ k, lam (k + 1) ≤ lam k) ∧ (∀ k, (lam k).Normal) ∧
      (∀ k, ∀ x ∈ lam k, x ^ p ∈ lam (k + 1)) ∧
      ∀ k, ∀ x ∈ lam k, ∀ y ∈ N, ⁅x, y⁆ ∈ lam (k + 1) :=
  Subgroup.exists_pLowerCentral_filtration_of_isPGroup N hN

/-- **Layer 5.4, the induction.** Solvability for elementary abelian kernels gives solvability for
`p`-group kernels, one step of the filtration at a time: Tau Ceti's
`HasElementaryAbelianSolutions.hasPGroupSolutions`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (h : TauCeti.HasElementaryAbelianSolutions p G) : TauCeti.HasPGroupSolutions p G :=
  TauCeti.HasElementaryAbelianSolutions.hasPGroupSolutions h

/-- **Layer 5.5, the level problems and their compatible solutions.** For a continuous surjection
`α : A ↠ B` from a profinite pro-`p` group onto a Hausdorff group, a continuous `f : G → B` and an
open normal `U ≤ A`, `TauCeti.levelProblem α hα f U` is the finite embedding problem obtained by
restricting `A/U → B/α(U)` to the preimage of the image of `f`; its solutions are the lifts of `f`
modulo `U` (`TauCeti.levelSolutionEquiv`). Under `HasPGroupSolutions p G` every level is solvable
(`TauCeti.nonempty_isSolution_levelProblem`), the transition maps between levels are surjective
(`TauCeti.levelSolutionMap_surjective`), and there is a compatible family of level solutions
(`TauCeti.HasPGroupSolutions.exists_compatible_levelSolutions`, compactness being applied to the
fibres in `A`). ⚠ The level problem has to be cut down to the image of `f`: with `G = 1`,
`A = B = C_p`, `α = id`, `U = 1` and `f` trivial, the map `G → B/α(U)` is not surjective, so
`E = A/U`, `Q = B/α(U)` is not a problem at all. ⚠ The level solution sets need not be finite: for
`G` free pro-`p` on an infinite basis, `A = C_p`, `B = 1` and `U = 1` they are infinite. They are
finite when `G` is topologically finitely generated
(`TauCeti.IsTopologicallyFinitelyGenerated.finite_levelSolution`), and the general argument does not
use finiteness. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    {A : Type v} [Group A] [TopologicalSpace A] [IsTopologicalGroup A] [CompactSpace A]
    {B : Type w} [Group B] [TopologicalSpace B] [IsTopologicalGroup B] [T2Space B]
    (hG : TauCeti.HasPGroupSolutions p G) (hA : IsProP p A) (α : A →ₜ* B)
    (hα : Function.Surjective α) (f : G →ₜ* B) :
    (∀ U, Nonempty {β : G →* (TauCeti.levelProblem α hα f U).E //
      (TauCeti.levelProblem α hα f U).IsSolution β}) ∧
      ∃ β : ∀ U, TauCeti.LevelSolution α hα f U,
        ∀ ⦃V U : OpenNormalSubgroup A⦄ (hVU : V ≤ U),
          TauCeti.levelSolutionMap α hα f hVU (β V) = β U :=
  ⟨TauCeti.nonempty_isSolution_levelProblem hG hA α hα f,
    TauCeti.HasPGroupSolutions.exists_compatible_levelSolutions hG hA α hα f⟩

/-- **Layer 5.6, inverse-limit lifting: projectivity.** Solving every finite embedding problem with
`p`-group kernel makes `G` projective, with no finite-generation hypothesis: Tau Ceti's
`isProjective_of_hasPGroupSolutions`, which assembles a compatible family of level solutions by
`exists_continuous_lift_of_compatible_levelSolutions`. This is the projectivity statement Layer 6
consumes; `cd_p G ≤ 1` enters through 5.2 (`TauCeti.CohomologicalDimensionLE.isProjective`). -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (hG : TauCeti.HasPGroupSolutions p G) : TauCeti.IsProjective.{u, v, w} p G :=
  TauCeti.isProjective_of_hasPGroupSolutions hG

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

/-! ## Layer 6: cohomological dimension, and its Nielsen-Schreier consequence

`cd_p` is the imported `ProfiniteCohomology.cd_p`, which is Tau Ceti's
`TauCeti.cohomologicalDimensionAt` at coefficient universe `0` (coefficients in the universe of
the group): the infimum, in `ℕ∞`, of the `n` for which `Hⁱ(G, M)` vanishes above `n` for every
discrete `p`-primary torsion `M`, characterized by `TauCeti.cohomologicalDimensionAt_le_iff`. This
roadmap defines no second cohomological dimension. The two general reductions, to finite
coefficients and to coefficients of bounded exponent, are
`ProfiniteCohomology.cd_p_le_iff_finite_pPrimary` and
`ProfiniteCohomology.cd_p_le_iff_boundedExponent`; the pro-`p` reduction below is the third and
is owned here. The two general inputs of the Sylow statements are imported as well: the descent of
a vanishing restriction from a closed subgroup to an open one,
`ProfiniteCohomology.exists_openSubgroup_res_eq_zero_of_res_eq_zero`, and the `p`-primary torsion
of the cohomology of `p`-primary coefficients,
`ProfiniteCohomology.isPPrimaryTorsion_continuousCohomology`, which is Tau Ceti's
`TauCeti.isPPrimaryTorsion_continuousCohomology` read through the coefficient dictionary. -/

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
    ProfiniteCohomology.cd_p p G ≤ (n : ℕ∞) ↔
      ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
        [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M] [Finite M],
        (∀ m : M, p • m = 0) → (∀ (g : G) (m : M), g • m = m) →
          Limits.IsZero (_root_.continuousCohomology (n + 1)
            (ProfiniteCohomology.ofDiscreteModule G M)) :=
  sorry

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
`p`-primary `M`, restated against the imported `cd_p`. Dévissage changes the coefficients and the
degree-raising theorem changes the degree, so the proof needs both. -/
theorem cd_p_freeProP_le_one (n : ℕ) [TotallyDisconnectedSpace (freeProP p (Fin n))] :
    ProfiniteCohomology.cd_p p (freeProP p (Fin n)) ≤ 1 :=
  sorry

/-- **Layer 6, Serre's theorem**: `cd_p G ≤ 1` implies free pro-`p`, for topologically finitely
generated `G`. The route is projectivity (`TauCeti.CohomologicalDimensionLE.isProjective`), a
minimal presentation, a homomorphic section, and Burnside, and it is Tau Ceti's
`TauCeti.IsProP.nonempty_continuousMulEquiv_freeProP_of_cohomologicalDimensionAt_le_one`, stated
there for a generating type of cardinality `d(G)` in the universe of `G`. This statement is that
theorem read at the generating type `Fin d(G)` and at the coefficient universe of `cd_p`.
⚠ The version without finite generation is a different theorem with a different proof, and it is
Layer 10's; Tau Ceti proves it at arbitrary rank, on a pointed profinite space, in
`Topology/Algebra/Group/Profinite/Free/Pointed/Serre.lean`. -/
theorem isFree_of_cd_p_le_one (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (hfg : IsTopologicallyFinitelyGenerated G) (hcd : ProfiniteCohomology.cd_p p G ≤ 1)
    [TotallyDisconnectedSpace (freeProP p (Fin (topologicalGeneratorRankNat G hfg)))] :
    Nonempty (G ≃ₜ* freeProP p (Fin (topologicalGeneratorRankNat G hfg))) :=
  sorry

/-- **Layer 6, `cd_p` of an open subgroup.** For `U` open in pro-`p` `G` with `cd_p G` finite,
`cd_p U = cd_p G`. ⚠ The imported `cd_p_eq_of_index_not_dvd` is the prime-to-`p`-index case and
does not cover an open subgroup of index divisible by `p`, which is the case used here. -/
theorem cd_p_eq_of_isOpen (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G) (U : OpenSubgroup G)
    (hfin : ProfiniteCohomology.cd_p p G ≠ ⊤)
    [CompactSpace U.toSubgroup] [TotallyDisconnectedSpace U.toSubgroup] :
    ProfiniteCohomology.cd_p p U.toSubgroup = ProfiniteCohomology.cd_p p G :=
  sorry

/-- **Layer 6, restriction to a `p`-Sylow subgroup is injective** on the cohomology of a discrete
`p`-primary torsion module, in every degree (NSW (1.6.10)). Restriction is additive
(`injective_iff_map_eq_zero`), so let `x` restrict to zero on `P`; five steps give `x = 0`.
1. `P` is closed (`TauCeti.IsProPSylow.isClosed`), so the imported
   `ProfiniteCohomology.exists_openSubgroup_res_eq_zero_of_res_eq_zero`, at `ℤ` and the smooth
   discrete `ofDiscreteModule G M` (`ProfiniteCohomology.ofDiscreteModule_isSmoothDiscrete G M`),
   gives an open `U` with `P ≤ U.toSubgroup` and `res_U x = 0`.
2. `ProfiniteCohomology.corestriction_comp_res ℤ U`, evaluated at `x`
   (`ConcreteCategory.congr_hom`), gives
   `((U.toSubgroup.index : ℕ) : ℤ) • x = corestriction (res_U x) = 0`.
3. `ProfiniteCohomology.isPPrimaryTorsion_continuousCohomology p G M hM n x`, the closed proof from
   Tau Ceti's `TauCeti.isPPrimaryTorsion_continuousCohomology`, puts `x` in the `p`-primary
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
    (hM : ProfiniteCohomology.IsPPrimaryTorsion p M) (n : ℕ) :
    Function.Injective
      (ProfiniteCohomology.res ℤ P (ProfiniteCohomology.ofDiscreteModule G M) n).hom :=
  sorry

/-- **Layer 6, the Sylow equality** `cd_p G = cd_p G_p`, for `G` profinite and `G_p` a `p`-Sylow
subgroup from Layer 2 (NSW (3.3.6)). This is the one statement of this layer about `cd_p` of a
group that need not be pro-`p`. Both sides are Tau Ceti's `TauCeti.cohomologicalDimensionAt`,
through the alias `ProfiniteCohomology.cd_p`. `cd_p G_p ≤ cd_p G` is the imported monotonicity
`cd_p_le_of_isClosed`; `cd_p G ≤ cd_p G_p` is `res_injective_of_isProPSylow` above, applied in
each degree above `cd_p G_p` to each discrete `p`-primary torsion module, through the
characterization `TauCeti.cohomologicalDimensionAt_le_iff` of the invariant by its vanishing
predicate `TauCeti.CohomologicalDimensionLE`. A `p`-Sylow subgroup is closed and in general
**not** open, so the imported `cd_p_eq_of_index_not_dvd`, which is the open prime-to-`p`-index
case, does not cover it; the imported `exists_openSubgroup_res_eq_zero_of_res_eq_zero`, step 1 of
the injectivity above, is what does. The caller supplies no instance for `G_p`: it is closed in
the compact `G`, hence compact (`isCompact_iff_compactSpace`, `IsClosed.isCompact`), which the
statement records itself, and it is totally disconnected as a subspace
(`Subtype.totallyDisconnectedSpace`). -/
theorem cd_p_eq_of_isProPSylow (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (P : Subgroup G) (hP : IsProPSylow p P) :
    haveI : CompactSpace P :=
      isCompact_iff_compactSpace.mp (TauCeti.IsProPSylow.isClosed hP).isCompact
    ProfiniteCohomology.cd_p p P = ProfiniteCohomology.cd_p p G :=
  sorry

/-- **Layer 7, an infinite Demushkin group has `cd_p = 2`.** `≤ 2` from the one-relator
presentation and the imported five-term sequence; `≥ 2` from `dim H²(G, 𝔽_p) = 1`, which is part
of the definition. -/
theorem cd_p_eq_two_of_isDemushkin (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) (hinf : Infinite G) : ProfiniteCohomology.cd_p p G = 2 :=
  sorry

/-- **Layer 10, closed subgroups of free pro-`p` groups.** A closed subgroup of a free pro-`p`
group again has `cd_p ≤ 1`, by the imported monotonicity `cd_p_le_of_isClosed` and the free
case above; with Serre's theorem at arbitrary rank this is the full pro-`p` Nielsen-Schreier
theorem, whose free objects on a profinite space are Layer 10. -/
theorem cd_p_le_one_of_isClosed_freeProP (n : ℕ) [TotallyDisconnectedSpace (freeProP p (Fin n))]
    (H : Subgroup (freeProP p (Fin n))) (hH : IsClosed (H : Set (freeProP p (Fin n))))
    [CompactSpace H] [TotallyDisconnectedSpace H] :
    ProfiniteCohomology.cd_p p H ≤ 1 :=
  sorry

end CohomologicalDimension

/-! ## Layer 6: cohomological dimension, and its Nielsen–Schreier consequence -/

/-- **Layer 6, pro-`p` Nielsen–Schreier for open subgroups, with the index-rank formula.**
An open subgroup of index `m` in the free pro-`p` group of rank `n ≥ 1` is free pro-`p` of
rank `1 + m(n - 1)`. (Route pinned in `README.md`: via `cd ≤ 1` and the two-term Euler
formula, not a transversal argument. The natural-number subtraction `n - 1` is harmless under
`n ≠ 0`; the Euler formula itself is stated in `ℤ`.) -/
example {p : ℕ} [Fact p.Prime] {n : ℕ} (hn : n ≠ 0) (U : OpenSubgroup (freeProP p (Fin n))) :
    Nonempty (U ≃ₜ* freeProP p (Fin (1 + U.toSubgroup.index * (n - 1)))) :=
  sorry

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

/-- **Layer 7, the even part of `U^[f]`.** For `u = -1 + 2^f` with `f ≥ 2`, the square
`u² = 1 - 2^{f+1}(1 - 2^{f-1})` has principal-unit depth exactly `f + 1`, so
`U^[f] ∩ (1 + 4ℤ₂) = U^(f+1)` and hence `[ℤ₂ˣ : U^[f]] = 2^{f-1}`. Stated separately from
the trichotomy because a shift of one in this exponent reparametrizes the whole `q = 2`
classification; check it by hand at `f = 2, 3, 4`. -/
example (f : ℕ) (hf : 2 ≤ f) (u : ℤ_[2]ˣ) (hu : (u : ℤ_[2]) = -1 + 2 ^ f) :
    procyclicClosure u ⊓ unitsPrincipal 2 = unitsPrincipal (f + 1) :=
  sorry

/-- **Layer 7, procyclicity.** The closed subgroups of `ℤ₂ˣ` not containing `-1`, namely
the families `U^(f)` and `U^[f]`, are topologically generated by one element: Tau Ceti's
`TauCeti.exists_topologicalClosure_zpowers_eq_of_isClosed_of_neg_one_notMem`. `{±1} × U^(f)` is
not, for `f < ∞` (`TauCeti.not_exists_topologicalClosure_zpowers_eq_unitsPlusMinus`): its Frattini
quotient is `(ℤ/2)²`. -/
example (A : Subgroup ℤ_[2]ˣ) (hA : IsClosed (A : Set ℤ_[2]ˣ)) (h1 : (-1 : ℤ_[2]ˣ) ∉ A) :
    ∃ u : ℤ_[2]ˣ, procyclicClosure u = A :=
  TauCeti.exists_topologicalClosure_zpowers_eq_of_isClosed_of_neg_one_notMem hA h1

/-- **Layer 7, the abelianization of `D₀`.** `D₀^{ab} ≅ (ℤ₂ × ℤ₂) × ℤ/2` as topological
groups: the relator `A²S⁴(S,Y)` abelianizes to `2A + 4S`, so the topological abelianization
is `ℤ₂³/⟨(2,4,0)⟩`. This is Tau Ceti's `TauCeti.d0AbelianizationEquiv`, and it is the computation
behind `n = 3`, `q = 2`. -/
example :
    Nonempty (topAbelianization demushkinD0 ≃ₜ*
      Multiplicative ((ℤ_[2] × ℤ_[2]) × ZMod 2)) :=
  ⟨TauCeti.d0AbelianizationEquiv⟩

/-- **Layer 7, the `q`-invariant of `D₀`.** The torsion subgroup of `D₀^{ab} ≅ ℤ₂² × ℤ/2`
has two elements, so `q(D₀) = 2`: Tau Ceti's
`TauCeti.nat_card_torsion_topologicalAbelianization_demushkinD0`. This is a computation with the
presentation, and it does not use the classification. -/
example : Nat.card {x : topAbelianization demushkinD0 // IsOfFinOrder x} = 2 :=
  TauCeti.nat_card_torsion_topologicalAbelianization_demushkinD0

/-! ## Layer 8: the lower `p`-series and finite-quotient determinacy -/

/-- **Layer 8, the lower `p`-series is closed, normal, and descending**: Tau Ceti's
`TauCeti.isClosed_pLowerCentralSeries`, the instance `TauCeti.pLowerCentralSeries_normal`, and
`TauCeti.pLowerCentralSeries_succ_le`. The basic API every tower argument needs before it can
quotient by a term. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (k : ℕ) :
    IsClosed ((pLowerCentralSeries p G k : Subgroup G) : Set G) ∧
      (pLowerCentralSeries p G k).Normal ∧
      pLowerCentralSeries p G (k + 1) ≤ pLowerCentralSeries p G k :=
  ⟨TauCeti.isClosed_pLowerCentralSeries k, inferInstance, TauCeti.pLowerCentralSeries_succ_le k⟩

/-- **Layer 8, functoriality of the lower `p`-series.** Continuous homomorphisms respect it,
and continuous surjections map each term *onto* the corresponding term: Tau Ceti's
`MonoidHom.map_pLowerCentralSeries_le` and `MonoidHom.map_pLowerCentralSeries_eq_of_surjective`,
a continuous map out of a compact group into a Hausdorff one being closed. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] {H : Type u}
    [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H]
    [TotallyDisconnectedSpace H] (f : G →* H) (hf : Continuous f) (k : ℕ) :
    (pLowerCentralSeries p G k).map f ≤ pLowerCentralSeries p H k ∧
      (Function.Surjective f → (pLowerCentralSeries p G k).map f
        = pLowerCentralSeries p H k) :=
  ⟨f.map_pLowerCentralSeries_le hf k,
    fun hs ↦ f.map_pLowerCentralSeries_eq_of_surjective hf hf.isClosedMap hs k⟩

/-- **Layer 8, openness of the lower `p`-series.** In a topologically finitely generated
profinite group every term of the lower `p`-series is open: Tau Ceti's
`TauCeti.IsTopologicallyFinitelyGenerated.isOpen_pLowerCentralSeries`, which needs no pro-`p`
hypothesis. (With cofinality below, the series is then a neighborhood basis of `1` by finite
`p`-quotients: the tower the comparison method runs on.) -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (_hG : IsProP p G)
    (hfg : IsTopologicallyFinitelyGenerated G) (k : ℕ) :
    IsOpen ((pLowerCentralSeries p G k : Subgroup G) : Set G) :=
  TauCeti.IsTopologicallyFinitelyGenerated.isOpen_pLowerCentralSeries hfg Fact.out k

/-- **Layer 8, cofinality of the lower `p`-series.** In a pro-`p` group the lower `p`-series is
cofinal among open normal subgroups: Tau Ceti's `TauCeti.IsProP.exists_pLowerCentralSeries_le`,
which needs no finite generation. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (_hfg : IsTopologicallyFinitelyGenerated G) (U : OpenNormalSubgroup G) :
    ∃ k : ℕ, pLowerCentralSeries p G k ≤ U.toSubgroup :=
  TauCeti.IsProP.exists_pLowerCentralSeries_le hG Fact.out U

/-- **Layer 8, occurring as a continuous quotient is an isomorphism invariant** in the finite
group: Tau Ceti's `TauCeti.isFiniteContinuousQuotient_congr_right`, with
`TauCeti.isFiniteContinuousQuotient_congr_left` in the profinite group. These are the two
statements that let the reconstruction theorem quantify over bundled finite groups. -/
example {G : Type u} [Group G] [TopologicalSpace G] {Q Q' : FiniteGrp.{v}} (e : Q ≃* Q') :
    IsFiniteContinuousQuotient G Q ↔ IsFiniteContinuousQuotient G Q' :=
  TauCeti.isFiniteContinuousQuotient_congr_right e

/-- **Layer 8, two epimorphisms.** If `G` is topologically finitely generated and `G` and `H`
have the same continuous finite quotients, there are continuous surjections in both
directions: Tau Ceti's
`TauCeti.exists_surjective_and_exists_surjective_of_forall_isFiniteContinuousQuotient_iff`. This is
the step where the finite-generation hypotheses are used; the theorem below removes the one on
`H`. -/
example {G H : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : IsTopologicallyFinitelyGenerated G)
    (h : ∀ Q : FiniteGrp.{u},
      IsFiniteContinuousQuotient G Q ↔ IsFiniteContinuousQuotient H Q) :
    (∃ f : G →* H, Continuous f ∧ Function.Surjective f) ∧
      ∃ g : H →* G, Continuous g ∧ Function.Surjective g :=
  TauCeti.exists_surjective_and_exists_surjective_of_forall_isFiniteContinuousQuotient_iff hG
    fun Q _ _ ↦ h (FiniteGrp.of Q)

/-- **Layer 8, finite-quotient determinacy, sharp form** (Fried–Jarden; RZ Thm. 3.2.9). Two
profinite groups with the same continuous finite quotients are topologically isomorphic as
soon as **one** of them is topologically finitely generated: Tau Ceti's
`TauCeti.nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff`. Route: the two
epimorphisms above, then `ψ ∘ φ : G ↠ G` is an isomorphism by the Hopf property of Layer 3, so
`φ` is a continuous bijection of compact Hausdorff groups. Finite generation of `H` is a
conclusion, not a hypothesis. -/
example {G H : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : IsTopologicallyFinitelyGenerated G)
    (h : ∀ Q : FiniteGrp.{u},
      IsFiniteContinuousQuotient G Q ↔ IsFiniteContinuousQuotient H Q) :
    Nonempty (G ≃ₜ* H) :=
  TauCeti.nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff hG
    fun Q _ _ ↦ h (FiniteGrp.of Q)

/-! ## Layer 10: free pro-`C` groups on profinite spaces, consumed from Tau Ceti

The free pro-`C` group on a pointed topological space `(X, x₀)` is Tau Ceti's
`TauCeti.freeProCPointed C x₀`: the quotient of `freeProC C X` by the intersection of the open
normal subgroups through which `X → freeProC C X` is continuous and kills `x₀`, with the continuous
generator map `TauCeti.freeProCPointed.of`, which kills `x₀`, and the lift
`TauCeti.freeProCPointed.lift`. For a profinite space `X` it is `F_C(X, x₀)` of Ribes and
Zalesskii §3.3. This roadmap uses it directly and builds no second free object on a space; the
milestones Tau Ceti proves are closed proofs below. -/

/-- **Layer 10, the universal property.** A continuous map from `X` to a profinite pro-`C` group
that sends `x₀` to `1` extends uniquely to a continuous homomorphism out of `F_C(X, x₀)`: Tau Ceti's
`TauCeti.freeProCPointed.existsUnique_lift`. -/
example (C : FiniteGroupClass.{u}) {X : Type u} [TopologicalSpace X] (x₀ : X) {P : Type u}
    [Group P] [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P]
    [TotallyDisconnectedSpace P] (hP : IsProC C P) (f : X → P) (hf : Continuous f)
    (hf₀ : f x₀ = 1) :
    ∃! g : TauCeti.freeProCPointed C x₀ →ₜ* P,
      ∀ x : X, g (TauCeti.freeProCPointed.of C x₀ x) = f x :=
  TauCeti.freeProCPointed.existsUnique_lift hP f hf hf₀

/-- **Layer 10, the discrete case recovers Layer 4.** For a discrete `X`, `F_C(X, x₀)` is the free
pro-`C` group on `X ∖ {x₀}`: Tau Ceti's `TauCeti.freeProCPointed.equivFreeProC`. -/
example (C : FiniteGroupClass.{u}) {X : Type u} [TopologicalSpace X] [DiscreteTopology X]
    (x₀ : X) : Nonempty (TauCeti.freeProCPointed C x₀ ≃ₜ* freeProC C {x : X // x ≠ x₀}) :=
  ⟨TauCeti.freeProCPointed.equivFreeProC C x₀⟩

/-- **Layer 10, the two free objects on an infinite set.** For a discrete `S`, the inclusion of `S`
into its one-point compactification `S⁺` induces a continuous surjection
`freeProC C S ↠ F_C(S⁺, ∞)`, and the images of the points of `S` converge to `1`: Tau Ceti's
`TauCeti.freeProCPointed.fromFreeProC_surjective` and
`TauCeti.freeProCPointed.convergesToOne_range_of_coe`. -/
example (C : FiniteGroupClass.{u}) (S : Type u) [TopologicalSpace S] [DiscreteTopology S] :
    Function.Surjective (TauCeti.freeProCPointed.fromFreeProC C S) ∧
      ConvergesToOne (Set.range fun s : S ↦
        TauCeti.freeProCPointed.of C (OnePoint.infty : OnePoint S) (s : OnePoint S)) :=
  ⟨TauCeti.freeProCPointed.fromFreeProC_surjective C S,
    TauCeti.freeProCPointed.convergesToOne_range_of_coe C S⟩

/-- **Layer 10, at `C = ` finite `p`-groups the comparison map is not injective**, for an infinite
discrete `S`. The witness is a count of continuous characters, and not a description of the kernel:
those of `freeProC C S` are all maps `S → 𝔽_p`, a space of dimension `p^{#S}` by the Erdős–Kaplansky
theorem, while those of `F_C(S⁺, ∞)` are the finitely supported ones, of dimension `#S`, and a
continuous bijection of profinite groups would identify the two duals. ⚠ The statement is false for
an arbitrary class: if `C` contains only the trivial group, both objects are trivial. -/
theorem not_injective_fromFreeProC_finiteGroupClassP (p : ℕ) [Fact p.Prime] (S : Type u)
    [TopologicalSpace S] [DiscreteTopology S] [Infinite S] :
    ¬ Function.Injective (TauCeti.freeProCPointed.fromFreeProC (finiteGroupClassP.{u} p) S) :=
  sorry

/-- **Layer 10, presentations at arbitrary rank.** Every pro-`p` group has a minimal presentation
by the free pro-`p` group on a pointed profinite space: some `s ⊆ G` converging to `1` has a
surjective presentation `F_p(insert 1 s, 1) → G` whose kernel lies in the Frattini subgroup, and the
free group has the rank of `G`. This is Tau Ceti's
`IsProP.exists_convergesToOne_presentation_surjective_ker_le_proPFrattini`, the general statement
that Layer 5 does not make. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G) :
    ∃ s : Set G, ConvergesToOne s ∧ Function.Surjective (TauCeti.IsProP.presentation hG s) ∧
      (TauCeti.IsProP.presentation hG s).ker ≤ proPFrattini p (TauCeti.freeProPInsertOne p s) ∧
      topologicalGeneratorRank (TauCeti.freeProPInsertOne p s) = topologicalGeneratorRank G :=
  TauCeti.IsProP.exists_convergesToOne_presentation_surjective_ker_le_proPFrattini hG

/-- **Layer 10, Serre's theorem at arbitrary rank.** A pro-`p` group with `cd_p G ≤ 1` is free
pro-`p` on a pointed profinite space, its presentation on some subset converging to `1` being a
topological isomorphism: Tau Ceti's
`IsProP.exists_convergesToOne_continuousMulEquiv_presentation_of_cohomologicalDimensionAt_le_one`.
A free pro-`p` group on a pointed space is projective (`TauCeti.isProjective_freeProCPointed`), so
for pro-`p` groups projectivity and freeness coincide
(`IsProP.isProjective_iff_exists_convergesToOne_continuousMulEquiv_presentation`). -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (hcd : TauCeti.cohomologicalDimensionAt.{u} p G ≤ 1) :
    ∃ s : Set G, ConvergesToOne s ∧
      ∃ e : TauCeti.freeProPInsertOne p s ≃ₜ* G, ⇑e = ⇑(TauCeti.IsProP.presentation hG s) :=
  TauCeti.IsProP.exists_convergesToOne_continuousMulEquiv_presentation_of_cohomologicalDimensionAt_le_one
    hG hcd

end TauCetiRoadmap.ProfiniteProPGroups
