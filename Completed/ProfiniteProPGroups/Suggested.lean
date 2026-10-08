import Mathlib
import TauCeti.Algebra.Category.ModuleCat.Topology.Zero
import TauCeti.GroupTheory.FiniteGroupClass
import TauCeti.GroupTheory.PLowerCentralSeries
import TauCeti.LinearAlgebra.BilinearForm.Basic
import TauCeti.LinearAlgebra.BilinearForm.Diagonalization
import TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis
import TauCeti.NumberTheory.LocalField.AbsoluteRamificationIndex
import TauCeti.NumberTheory.LocalField.DeepUnits.Basic
import TauCeti.NumberTheory.Padics.DyadicUnits
import TauCeti.NumberTheory.Padics.GroupAlgebra.CyclicTwo
import TauCeti.NumberTheory.Padics.InverseLimit
import TauCeti.NumberTheory.Padics.Module
import TauCeti.NumberTheory.Padics.PowerSeries
import TauCeti.NumberTheory.Padics.PrincipalUnits
import TauCeti.NumberTheory.Padics.ProcyclicSubgroups
import TauCeti.NumberTheory.Padics.TwistedUnits
import TauCeti.NumberTheory.Padics.UnitsDecomposition
import TauCeti.NumberTheory.Supernatural
import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.IndexNotDvd
import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.OpenSubgroup
import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.SingleDegree
import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.Duality.OpenSubgroup
import TauCeti.RepresentationTheory.Homological.ContCohomology.Cup.TrivialFp.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.DegreeZero
import TauCeti.RepresentationTheory.Homological.ContCohomology.FiniteCoefficients
import TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialFp
import TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialFp.Character
import TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialFp.Zero
import TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialGroup
import TauCeti.RingTheory.Huber.Padic.Basic
import TauCeti.Topology.Algebra.Group.FiniteQuotients
import TauCeti.Topology.Algebra.Group.LowerCentralSeries
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Closed
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.Basic
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.Pow
import TauCeti.Topology.Algebra.Group.OpenSubgroup.TopologicallyFinitelyGenerated
import TauCeti.Topology.Algebra.Group.Profinite.Basic
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Discrete
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.DyadicCoordinate
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Filtration
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Map
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Module
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.PowerSeries
import TauCeti.Topology.Algebra.Group.Profinite.Completion
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Basic
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Character.Basic
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Character.Image
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.CohomologicalDimension
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Criterion
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.CupForm
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.CyclicTwo
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.D0.Basic
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.D0.Invariants
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Duality.Twisted
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Equiv
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Finite
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Labute.RelationModule
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Labute.RelatorCharacter
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.Criterion
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.DegreeOneForm
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.Kernel.Span
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.LabuteModule.Relator
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.Marked
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.OddPrime
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.Orientation
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.Two.Even.Image
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.Two.Even.KernelSpan
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.Two.Odd.Image
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.NormalForm.Uniqueness
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.OpenSubgroup
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Orientation
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.PadicIntProd
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.QInvariant
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.RankOne
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.RankParity
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Recognition
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.Trace
import TauCeti.Topology.Algebra.Group.Profinite.Demushkin.TwistedCoefficients
import TauCeti.Topology.Algebra.Group.Profinite.EmbeddingProblem.Cohomology
import TauCeti.Topology.Algebra.Group.Profinite.EmbeddingProblem.Compatible
import TauCeti.Topology.Algebra.Group.Profinite.EmbeddingProblem.PGroupKernel
import TauCeti.Topology.Algebra.Group.Profinite.EmbeddingProblem.Projective
import TauCeti.Topology.Algebra.Group.Profinite.FiniteQuotients
import TauCeti.Topology.Algebra.Group.Profinite.Free.Basic
import TauCeti.Topology.Algebra.Group.Profinite.Free.BasisModification.LevelZero
import TauCeti.Topology.Algebra.Group.Profinite.Free.ClosedSubgroup
import TauCeti.Topology.Algebra.Group.Profinite.Free.Cohomology
import TauCeti.Topology.Algebra.Group.Profinite.Free.DegreeOneForm
import TauCeti.Topology.Algebra.Group.Profinite.Free.EmbeddingProblem
import TauCeti.Topology.Algebra.Group.Profinite.Free.Empty
import TauCeti.Topology.Algebra.Group.Profinite.Free.Graded
import TauCeti.Topology.Algebra.Group.Profinite.Free.OpenSubgroup
import TauCeti.Topology.Algebra.Group.Profinite.Free.PadicInt
import TauCeti.Topology.Algebra.Group.Profinite.Free.Pointed.CohomologicalDimension
import TauCeti.Topology.Algebra.Group.Profinite.Free.Pointed.EmbeddingProblem
import TauCeti.Topology.Algebra.Group.Profinite.Free.Pointed.Presentation
import TauCeti.Topology.Algebra.Group.Profinite.Free.Pointed.Rank
import TauCeti.Topology.Algebra.Group.Profinite.Free.Pointed.Serre
import TauCeti.Topology.Algebra.Group.Profinite.Free.Prescription
import TauCeti.Topology.Algebra.Group.Profinite.Free.ProC
import TauCeti.Topology.Algebra.Group.Profinite.Free.ProP
import TauCeti.Topology.Algebra.Group.Profinite.Free.Rank
import TauCeti.Topology.Algebra.Group.Profinite.Free.RelatorFunctional
import TauCeti.Topology.Algebra.Group.Profinite.Free.ResiduallyP
import TauCeti.Topology.Algebra.Group.Profinite.Free.ULift
import TauCeti.Topology.Algebra.Group.Profinite.Gaschutz
import TauCeti.Topology.Algebra.Group.Profinite.Generation
import TauCeti.Topology.Algebra.Group.Profinite.Hopfian
import TauCeti.Topology.Algebra.Group.Profinite.Index.Basic
import TauCeti.Topology.Algebra.Group.Profinite.Index.Functoriality
import TauCeti.Topology.Algebra.Group.Profinite.Index.PadicUnits
import TauCeti.Topology.Algebra.Group.Profinite.Index.Transitivity
import TauCeti.Topology.Algebra.Group.Profinite.Lagrange
import TauCeti.Topology.Algebra.Group.Profinite.Limit
import TauCeti.Topology.Algebra.Group.Profinite.MaximalProP
import TauCeti.Topology.Algebra.Group.Profinite.Order
import TauCeti.Topology.Algebra.Group.Profinite.Presentation.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ProC
import TauCeti.Topology.Algebra.Group.Profinite.ProP.AdditiveInvariant
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Burnside
import TauCeti.Topology.Algebra.Group.Profinite.ProP.ClosedSubmodule
import TauCeti.Topology.Algebra.Group.Profinite.ProP.CohomFp
import TauCeti.Topology.Algebra.Group.Profinite.ProP.CohomologicalDimension
import TauCeti.Topology.Algebra.Group.Profinite.ProP.CompactModule
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Comparison
import TauCeti.Topology.Algebra.Group.Profinite.ProP.CompletedGroupAlgebraModule
import TauCeti.Topology.Algebra.Group.Profinite.ProP.ContinuousDual
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Deficiency
import TauCeti.Topology.Algebra.Group.Profinite.ProP.DualRank
import TauCeti.Topology.Algebra.Group.Profinite.ProP.ElementaryAbelian
import TauCeti.Topology.Algebra.Group.Profinite.ProP.EulerCharacteristic.ThreeTerm
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Extension
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Filtration
import TauCeti.Topology.Algebra.Group.Profinite.ProP.FiniteGeneration
import TauCeti.Topology.Algebra.Group.Profinite.ProP.FinitePresentation
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Frattini.Functoriality
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Frattini.Series
import TauCeti.Topology.Algebra.Group.Profinite.ProP.GolodShafarevich
import TauCeti.Topology.Algebra.Group.Profinite.ProP.H1Dual
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Limit
import TauCeti.Topology.Algebra.Group.Profinite.ProP.LowerCentralSeries
import TauCeti.Topology.Algebra.Group.Profinite.ProP.MaximalSubgroup
import TauCeti.Topology.Algebra.Group.Profinite.ProP.MinimalPresentation
import TauCeti.Topology.Algebra.Group.Profinite.ProP.ModuleRank
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Order
import TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicInt.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicInt.Frattini
import TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicPow
import TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicUnits
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Prescription.CompatibleSystem
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Product
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Rank
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Relation.Module
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Relation.Rank
import TauCeti.Topology.Algebra.Group.Profinite.ProP.StructureTheorem
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Subgroup
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Surjective
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Torsion
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Transgression
import TauCeti.Topology.Algebra.Group.Profinite.Rank
import TauCeti.Topology.Algebra.Group.Profinite.Section
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Basic
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.CohomologicalDimension
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Commutative
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Conjugacy
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Containment
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Existence
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Functoriality
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Limit
import TauCeti.Topology.Algebra.Group.Profinite.Sylow.Order
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.PadicInt
import TauCeti.Topology.Algebra.Group.Quotient.Basic
import TauCeti.Topology.Algebra.Group.TopologicalAbelianization
import TauCeti.Topology.Algebra.GroupExtension.Cohomology
import TauCeti.Topology.Algebra.GroupExtension.ZModFour
import TauCeti.Topology.Algebra.Module.Compact
import TauCeti.Topology.Compactness.InverseSystem

set_option autoImplicit false

/-!
# Profinite and pro-`p` groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

Every milestone of `README.md` has a statement here, in the form the roadmap asks for, closed by
the Tau Ceti (or Mathlib) declaration that realizes it, so the correspondence is checked by the
Lean kernel rather than asserted in prose. No statement is left as `sorry`. That is evidence for
completion, not its criterion: completion is judged by a milestone-by-milestone audit against
`README.md`, which a `sorry`-free file of suggested forms cannot replace.

The file imports only Mathlib and Tau Ceti. The roadmap names that downstream roadmaps import
(`IsProP`, `proPKernel`, `freeProP`, `presentedProP`, `trivialFp`, `cohomFp`, `fpPairing`,
`cupFp`, `IsDemushkin`, `demushkinRank`, `demushkinQ`, `demushkinCharacter`, the normal-form words
and the marked classification, among others) are kept, as reducible aliases of the Tau Ceti
declarations or as theorems closed by them, in the namespace `TauCetiRoadmap.ProfiniteProPGroups`.
Most other statements are `example`s stated directly with the Tau Ceti names.

The earlier version of this file imported `TauCetiRoadmap.ProfiniteCohomology.Suggested`, defined
its own `fpPairing` (with `sorry` fields), `cupFp`, `IsDemushkin`, `demushkinRank`, `demushkinQ`,
`demushkinCharacter`, `labuteRelatorClass`, `demushkinRelatorCharacter` and normal-form words, and
had 32 `sorry` placeholders. Those definitions are now Tau Ceti's: `TauCeti.demushkinQ` agrees
with the earlier definition (proved in Layer 7 below), `TauCeti.demushkinCharacter` is the same
choice, and the words are Tau Ceti's with the same bodies. The earlier `sorry` example
`Group.rank (Multiplicative (ZMod 4) × Multiplicative (ZMod 2)) = 2` is not carried over: it is not
a README target, and the README's comparison of the rank with `Group.rank` on a finite discrete
group is certified in general (`TauCeti.topologicalGeneratorRankNat_eq_rank`).

Four differences from the README's descriptions are deliberate.

* The multiplication pairing and the cup square are Tau Ceti's: `fpPairing p G` is
  `TauCeti.fpPairing p G`, a `TauCeti.TopPairing`, and `cupFp p G a b` is `TauCeti.cupFp p G a b`,
  the degree-`(1, 1)` cup product `(fpPairing p G).cup 1 1`. The README describes them through
  `ProfiniteCohomology.TopPairing` and `ProfiniteCohomology.cup`, and the latter has no body at
  the pin. `IsDemushkin` is `TauCeti.IsDemushkin`, whose two cup clauses are about `TauCeti.cupFp`.
* `cd_p G` is `TauCeti.cohomologicalDimensionAt.{u} p G`, at the coefficient universe of
  `G : Type u`, rather than the README's `ProfiniteCohomology.cd_p p G`, which is the same invariant
  at coefficient universe `0`. The two agree for `G : Type`. Tau Ceti states its theorems about the
  invariant at the universe of the group and has no comparison between coefficient universes.
* `labuteRelatorClass` takes a continuous character `χ : F →ₜ* ℤ_[p]ˣ`, as Tau Ceti's does, rather
  than an arbitrary homomorphism `F →* A`; Labute's character is continuous.
* The universal properties, presentations, embedding problems and the Labute module statements are
  Tau Ceti's and keep Tau Ceti's hypotheses where those are weaker; where a named roadmap theorem
  kept a hypothesis that Tau Ceti does not need, the hypothesis stays in the signature, unused.

Five statements of `README.md` are corrected in its "Errata, corrected at archiving" section. One
is an edge-case remark: the abstract Frattini subgroup only *can* differ from `proPFrattini`
without finite generation (Layer 3). For the other four this file certifies the corrected forms:
the deficiency inequality reads `#S - #R ≤ d - r` (Layer 5), `δ_1` and its polarization carry the
commutator terms (Layer 8), the span statement `gr_j(F) = Im δ_j` needs a nonzero `p`-power part,
with a constrained form otherwise (Layer 9), and the even-rank nonalternating normal form is
`x₁²(x₁,x₂)(x₃,x₄)⋯` (Layer 9).
-/

namespace TauCetiRoadmap.ProfiniteProPGroups

universe u v w


open CategoryTheory


/-! ## The basic objects, consumed from Tau Ceti -/

section Prototypes

variable (p : ℕ)

/-- **Pro-`p`**, in quotient form: each continuous finite quotient, that is each quotient by an
open normal subgroup, is a `p`-group. This is Tau Ceti's `TauCeti.IsProP`; its defining property
is `TauCeti.isProP_iff`. -/
abbrev IsProP (G : Type u) [Group G] [TopologicalSpace G] : Prop :=
  TauCeti.IsProP p G

/-- **Topological finite generation**: some finite subset generates a dense subgroup. This is
Tau Ceti's `TauCeti.IsTopologicallyFinitelyGenerated`. -/
abbrev IsTopologicallyFinitelyGenerated (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : Prop :=
  TauCeti.IsTopologicallyFinitelyGenerated G

/-- A subset **converges to `1`**: every neighbourhood of `1` omits only finitely many of its
elements. This is Tau Ceti's `TauCeti.ConvergesToOne`. -/
abbrev ConvergesToOne {G : Type u} [Group G] [TopologicalSpace G] (s : Set G) : Prop :=
  TauCeti.ConvergesToOne s

/-- **Topological generator rank, cardinal-valued**: the least cardinality of a subset converging
to `1` and generating a dense subgroup. This is Tau Ceti's `TauCeti.topologicalGeneratorRank`. -/
noncomputable abbrev topologicalGeneratorRank (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : Cardinal.{u} :=
  TauCeti.topologicalGeneratorRank G

/-- **Topological generator rank, natural-number accessor**, available exactly when the group
is topologically finitely generated: Tau Ceti's `TauCeti.topologicalGeneratorRankNat`. -/
noncomputable abbrev topologicalGeneratorRankNat (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (h : IsTopologicallyFinitelyGenerated G) : ℕ :=
  TauCeti.topologicalGeneratorRankNat G h

/-- The **pro-`p` kernel**: the intersection of the open normal subgroups with `p`-group
quotient, Tau Ceti's `TauCeti.proPKernel`. -/
abbrev proPKernel (G : Type u) [Group G] [TopologicalSpace G] : Subgroup G :=
  TauCeti.proPKernel p G

/-- The **maximal pro-`p` quotient** `G(p) = G ⧸ proPKernel p G`, Tau Ceti's
`TauCeti.maximalProPQuotient`. -/
abbrev maximalProPQuotient (G : Type u) [Group G] [TopologicalSpace G] : Type u :=
  TauCeti.maximalProPQuotient p G

/-- **`p`-Sylow subgroup of a profinite group**: a closed pro-`p` subgroup whose image in every
continuous finite quotient has index prime to `p`. This is Tau Ceti's `TauCeti.IsProPSylow`. -/
abbrev IsProPSylow {G : Type u} [Group G] [TopologicalSpace G] (P : Subgroup G) : Prop :=
  TauCeti.IsProPSylow p P

/-- **Supernatural numbers**, recorded as their exponent functions `Nat.Primes → ℕ∞`: Tau Ceti's
`TauCeti.Supernatural`. -/
abbrev Supernatural : Type := TauCeti.Supernatural

/-- The **order** of a profinite group as a supernatural number: Tau Ceti's
`TauCeti.profiniteOrder`. -/
noncomputable abbrev profiniteOrder (G : Type u) [Group G] [TopologicalSpace G] : Supernatural :=
  TauCeti.profiniteOrder G

/-- The **index of a subgroup**, in the primewise form: Tau Ceti's `Subgroup.profiniteIndex`. -/
noncomputable abbrev profiniteIndex {G : Type u} [Group G] [TopologicalSpace G]
    (H : Subgroup G) : Supernatural :=
  H.profiniteIndex

/-- The **Frattini subgroup of a pro-`p` group**, in index-`p` form: Tau Ceti's
`TauCeti.proPFrattini`. -/
abbrev proPFrattini (G : Type u) [Group G] [TopologicalSpace G] : Subgroup G :=
  TauCeti.proPFrattini p G

/-- The topological closure of a normal subgroup is normal, wrapping Mathlib's
`Subgroup.is_normal_topologicalClosure`, as a **scoped** instance. -/
scoped instance normal_topologicalClosure {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (N : Subgroup G) [N.Normal] : N.topologicalClosure.Normal :=
  Subgroup.is_normal_topologicalClosure N

/-- One step of the **lower `p`-series**, `H ↦ closure (Hᵖ ⬝ [H, G])`: Tau Ceti's
`TauCeti.pLowerCentralStep`. -/
abbrev pLowerCentralStep {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (H : Subgroup G) : Subgroup G :=
  TauCeti.pLowerCentralStep p H

/-- The **lower `p`-series**, 0-based: Tau Ceti's `TauCeti.pLowerCentralSeries`. -/
abbrev pLowerCentralSeries (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    ℕ → Subgroup G :=
  TauCeti.pLowerCentralSeries p G

end Prototypes

/-- A **class of finite groups** closed under isomorphism, subgroups, quotients, and
extensions: Tau Ceti's `TauCeti.FiniteGroupClass`. -/
abbrev FiniteGroupClass : Type (w + 1) := TauCeti.FiniteGroupClass.{w}

/-- Finite `p`-groups: Tau Ceti's `TauCeti.finiteGroupClassP`. -/
abbrev finiteGroupClassP (p : ℕ) : FiniteGroupClass.{u} := TauCeti.finiteGroupClassP p

/-- The **`C`-kernel**: Tau Ceti's `TauCeti.proCKernel`. -/
abbrev proCKernel (C : FiniteGroupClass.{u}) (G : Type u) [Group G] [TopologicalSpace G] :
    Subgroup G :=
  TauCeti.proCKernel C G

/-- **Pro-`C`, in quotient form**: Tau Ceti's `TauCeti.IsProC`. -/
abbrev IsProC (C : FiniteGroupClass.{u}) (G : Type u) [Group G] [TopologicalSpace G] : Prop :=
  TauCeti.IsProC C G

/-! ## Free objects, presentations, and the dyadic instance, consumed from Tau Ceti -/

section FreeObjects

variable (p : ℕ)

/-- The **free profinite group** on `X`: Tau Ceti's `TauCeti.freeProfiniteGroup`. -/
noncomputable abbrev freeProfiniteGroup (X : Type u) : ProfiniteGrp.{u} :=
  TauCeti.freeProfiniteGroup X

/-- The generators of the free profinite group, Tau Ceti's `TauCeti.freeProfiniteGroup.of`. -/
noncomputable abbrev freeProfiniteGroup.of {X : Type u} (x : X) : freeProfiniteGroup X :=
  TauCeti.freeProfiniteGroup.of x

/-- The **free pro-`C` group** on `X`: Tau Ceti's `TauCeti.freeProC`. -/
noncomputable abbrev freeProC (C : FiniteGroupClass.{u}) (X : Type u) : Type u :=
  TauCeti.freeProC C X

/-- The generators of the free pro-`C` group, Tau Ceti's `TauCeti.freeProC.of`. -/
noncomputable abbrev freeProC.of {C : FiniteGroupClass.{u}} {X : Type u} (x : X) :
    freeProC C X :=
  TauCeti.freeProC.of x

/-- The **free pro-`p` group** on `X`: Tau Ceti's `TauCeti.freeProP`. -/
noncomputable abbrev freeProP (X : Type u) : Type u :=
  TauCeti.freeProP p X

/-- The generators of the free pro-`p` group, Tau Ceti's `TauCeti.freeProP.of`. -/
noncomputable abbrev freeProP.of {X : Type u} (x : X) : freeProP p X :=
  TauCeti.freeProP.of x

/-- The profinite group **presented** by generators `X` and relators `rels`: Tau Ceti's
`TauCeti.presentedProfiniteGroup`. -/
noncomputable abbrev presentedProfiniteGroup (X : Type u)
    (rels : Set (freeProfiniteGroup X)) : Type u :=
  TauCeti.presentedProfiniteGroup X rels

/-- The canonical projection onto the presented profinite group, Tau Ceti's continuous
`TauCeti.presentedProfiniteGroup.mk`. -/
noncomputable abbrev presentedProfiniteGroup.mk {X : Type u} (rels : Set (freeProfiniteGroup X)) :
    freeProfiniteGroup X →ₜ* presentedProfiniteGroup X rels :=
  TauCeti.presentedProfiniteGroup.mk rels

/-- The pro-`p` group **presented** by generators `X` and relators `rels`: Tau Ceti's
`TauCeti.presentedProP`. -/
noncomputable abbrev presentedProP (X : Type u) (rels : Set (freeProP p X)) : Type u :=
  TauCeti.presentedProP p X rels

/-- The canonical projection onto the presented pro-`p` group, Tau Ceti's continuous
`TauCeti.presentedProP.mk`. -/
noncomputable abbrev presentedProP.mk {X : Type u} (rels : Set (freeProP p X)) :
    freeProP p X →ₜ* presentedProP p X rels :=
  TauCeti.presentedProP.mk p rels

/-- The dyadic Demushkin relator `A²S⁴(S,Y)`: Tau Ceti's `TauCeti.d0Relator`. -/
noncomputable abbrev d0Relator : freeProP 2 (Fin 3) :=
  TauCeti.d0Relator

/-- **`D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y) = 1⟩`**: Tau Ceti's `TauCeti.demushkinD0`. -/
noncomputable abbrev demushkinD0 : Type := TauCeti.demushkinD0

/-- The **topological abelianization** `G^{ab} = G ⧸ closure [G,G]`: Mathlib's
`TopologicalAbelianization`. -/
abbrev topAbelianization (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    Type u :=
  TopologicalAbelianization G

/-- `ℤ̂`, the profinite completion of `ℤ`, as a profinite **group**: Tau Ceti's `TauCeti.zHat`. -/
noncomputable abbrev zHat : Type := TauCeti.zHat

end FreeObjects

/-- `U^(f) = 1 + 2^f ℤ₂`: Tau Ceti's `TauCeti.unitsPrincipal` at `p = 2`. -/
noncomputable abbrev unitsPrincipal (f : ℕ) : Subgroup ℤ_[2]ˣ :=
  TauCeti.unitsPrincipal 2 f

/-- `{±1} × U^(f)`: Tau Ceti's `TauCeti.unitsPlusMinus`. -/
noncomputable abbrev unitsPlusMinus (f : ℕ) : Subgroup ℤ_[2]ˣ :=
  TauCeti.unitsPlusMinus f

/-- The closed subgroup topologically generated by a single unit. Labute's `U^[f]` is
`procyclicClosure u` for `(u : ℤ_[2]) = -1 + 2 ^ f`. -/
noncomputable abbrev procyclicClosure (u : ℤ_[2]ˣ) : Subgroup ℤ_[2]ˣ :=
  (Subgroup.zpowers u).topologicalClosure

/-- `Q` occurs as a continuous finite quotient of `G`: Tau Ceti's
`TauCeti.IsFiniteContinuousQuotient`, read at the underlying group of the bundled finite group. -/
abbrev IsFiniteContinuousQuotient (G : Type u) [Group G] [TopologicalSpace G]
    (Q : FiniteGrp.{v}) : Prop :=
  TauCeti.IsFiniteContinuousQuotient G Q

/-! ## Layer 5: the coefficient objects -/

section Coefficients

/-- The trivial `G`-representation on `𝔽_p`: Tau Ceti's `TauCeti.trivialFp`. -/
noncomputable abbrev trivialFp (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : TopRep (ZMod p) G :=
  TauCeti.trivialFp p G

/-- **`Hⁿ(G, 𝔽_p)`**: Tau Ceti's `TauCeti.cohomFp`, Mathlib's `continuousCohomology` of
`trivialFp`. -/
noncomputable abbrev cohomFp (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (n : ℕ) : TopModuleCat.{u} (ZMod p) :=
  TauCeti.cohomFp p G n

/-- **The multiplication pairing on `𝔽_p`**: Tau Ceti's `TauCeti.fpPairing`, a
`TauCeti.TopPairing` of the trivial representation with itself. -/
noncomputable abbrev fpPairing (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] :
    TauCeti.TopPairing (trivialFp p G) (trivialFp p G) (trivialFp p G) :=
  TauCeti.fpPairing p G

/-- **Layer 5, the pairing is multiplication**, read through `TauCeti.trivialFpEquiv`: Tau Ceti's
`TauCeti.fpPairing_bil_apply`. -/
theorem fpPairing_bil (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : (trivialFp p G).V) :
    TauCeti.trivialFpEquiv p G ((fpPairing p G).bil a b) =
      TauCeti.trivialFpEquiv p G a * TauCeti.trivialFpEquiv p G b := by
  rw [fpPairing, TauCeti.fpPairing_bil_apply, LinearEquiv.apply_symm_apply]

/-- **Layer 5, the cup square on `H¹(G, 𝔽_p)`**: Tau Ceti's `TauCeti.cupFp`, the degree-`(1, 1)`
cup product `(fpPairing p G).cup 1 1` of Tau Ceti's continuous cohomology. -/
noncomputable abbrev cupFp (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : cohomFp p G 1) : cohomFp p G 2 :=
  TauCeti.cupFp p G a b

/-- **Layer 5, the cup square is the cup product of the multiplication pairing**: Tau Ceti's
`TauCeti.cupFp_def`. -/
theorem cupFp_eq_cup (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : cohomFp p G 1) :
    cupFp p G a b = (fpPairing p G).cup 1 1 a b := by
  rw [cupFp, TauCeti.cupFp_def]

/-- **Layer 5, graded commutativity of the cup square**: Tau Ceti's `TauCeti.cupFp_gradedComm`. -/
theorem cupFp_gradedComm (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : cohomFp p G 1) : cupFp p G a b = - cupFp p G b a :=
  TauCeti.cupFp_gradedComm p G a b

end Coefficients

/-- **The prescription property** of a continuous character: Tau Ceti's
`TauCeti.HasPrescriptionProperty`. -/
abbrev HasPrescriptionProperty {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] (χ : G →ₜ* ℤ_[p]ˣ) : Prop :=
  TauCeti.HasPrescriptionProperty χ

/-! ## Layer 7: the Demushkin predicate and its invariants -/

section Demushkin

/-- **The Demushkin predicate** (Labute p. 106): Tau Ceti's `TauCeti.IsDemushkin`, with fields
`isProP`, `finite_cohomFp_one`, `finrank_cohomFp_two`, `cup_separatingLeft` and
`cup_separatingRight`. -/
abbrev IsDemushkin (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : Prop :=
  TauCeti.IsDemushkin p G

/-- **The rank of a Demushkin group**: Tau Ceti's `TauCeti.demushkinRank`. -/
noncomputable abbrev demushkinRank {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : ℕ :=
  TauCeti.demushkinRank hG

/-- **Labute's `q`-invariant**: Tau Ceti's `TauCeti.demushkinQ`, `0` when the topological
abelianization is torsion-free and the order of its torsion subgroup otherwise. -/
noncomputable abbrev demushkinQ {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] (hG : IsDemushkin p G) : ℕ :=
  TauCeti.demushkinQ hG

/-- **The canonical character of a Demushkin group**, the unique continuous `χ : G → ℤ_pˣ` with
the prescription property: Tau Ceti's `TauCeti.demushkinCharacter`. -/
noncomputable abbrev demushkinCharacter {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : G →ₜ* ℤ_[p]ˣ :=
  TauCeti.demushkinCharacter hG

end Demushkin

/-- **The completed group algebra** `Λ = ℤ_p[[Γ]]`: Tau Ceti's
`TauCeti.completedGroupAlgebra ℤ_[p] Γ`. -/
abbrev completedGroupAlgebra (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ] :
    Type u :=
  TauCeti.completedGroupAlgebra ℤ_[p] Γ

/-- **A compact `Λ`-module**: Tau Ceti's `TauCeti.IsCompactModule` at the ring `Λ`. -/
abbrev IsCompactModule (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ]
    (M : Type v) [AddCommGroup M] [Module (completedGroupAlgebra p Γ) M] [TopologicalSpace M] :
    Prop :=
  TauCeti.IsCompactModule (completedGroupAlgebra p Γ) M

/-- **`r̄ ∈ E`**, the class of `r ∈ ker χ` in Labute's module `E = ker χ / (ker χ, ker χ)`: Tau
Ceti's `TauCeti.labuteRelatorClass`. -/
noncomputable abbrev labuteRelatorClass {p : ℕ} [Fact p.Prime] {F : Type u} [Group F]
    [TopologicalSpace F] [IsTopologicalGroup F] (χ : F →ₜ* ℤ_[p]ˣ) (r : F)
    (hr : r ∈ (χ : F →* ℤ_[p]ˣ).ker) : TauCeti.labuteE χ :=
  TauCeti.labuteRelatorClass χ r hr

/-- **The character associated with a Demushkin relation** (Labute §4, `χ = χ_r`): Tau Ceti's
`TauCeti.demushkinRelatorCharacter`. -/
noncomputable abbrev demushkinRelatorCharacter {p : ℕ} [Fact p.Prime] {n : ℕ}
    {r : freeProP p (Fin n)} (hr : IsDemushkin p (presentedProP p (Fin n) {r})) :
    freeProP p (Fin n) →ₜ* ℤ_[p]ˣ :=
  TauCeti.demushkinRelatorCharacter hr

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

section Layers0To2



/-! ## Conventions -/

/-- **Conventions, pro-`p`.** Pro-`p` means that every continuous finite quotient, that is
every quotient by an open normal subgroup, is a `p`-group: Tau Ceti's `TauCeti.isProP_iff`. -/
example (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] :
    TauCeti.IsProP p G ↔ ∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U.toSubgroup) :=
  TauCeti.isProP_iff

/-! ## Layer 0: profinite foundations -/

section Layer0

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 0, the instance chain, `T1`.** A totally disconnected topological group is `T1`,
with no further hypothesis: a Mathlib instance. -/
example [TotallyDisconnectedSpace G] : T1Space G := inferInstance

/-- **Layer 0, the instance chain, `T2`.** A totally disconnected topological group is `T2`:
Mathlib instances (`T1` plus the topological-group upgrade). -/
example [TotallyDisconnectedSpace G] : T2Space G := inferInstance

/-- **Layer 0, the instance chain, `T3`.** A totally disconnected topological group is `T3`:
Mathlib instances. -/
example [TotallyDisconnectedSpace G] : T3Space G := inferInstance

/-- **Layer 0, quotients by closed normal subgroups are profinite.** Compactness and the
topological-group property are Mathlib instances; total disconnectedness of `G ⧸ N` for closed
`N` is Tau Ceti's instance `TauCeti.QuotientGroup.instTotallyDisconnectedSpace`. -/
example [CompactSpace G] [TotallyDisconnectedSpace G] (N : Subgroup G) [N.Normal]
    (hN : IsClosed (N : Set G)) :
    CompactSpace (G ⧸ N) ∧ IsTopologicalGroup (G ⧸ N) ∧ TotallyDisconnectedSpace (G ⧸ N) :=
  haveI := hN
  ⟨inferInstance, inferInstance, inferInstance⟩

/-- **Layer 0, a closed subgroup of a profinite group is profinite.** Compactness from
closedness (Mathlib's `isCompact_iff_compactSpace`); the topological-group property and total
disconnectedness of the subspace are Mathlib instances. -/
example [CompactSpace G] [TotallyDisconnectedSpace G] (H : Subgroup G)
    (hH : IsClosed (H : Set G)) :
    CompactSpace H ∧ IsTopologicalGroup H ∧ TotallyDisconnectedSpace H :=
  ⟨isCompact_iff_compactSpace.mp hH.isCompact, inferInstance, inferInstance⟩

/-- **Layer 0, an element in every open normal subgroup is `1`**: Tau Ceti's
`Subgroup.eq_one_of_mem_iInf_openNormalSubgroup`. -/
example [CompactSpace G] [TotallyDisconnectedSpace G] {x : G}
    (hx : ∀ U : OpenNormalSubgroup G, x ∈ U.toSubgroup) : x = 1 :=
  Subgroup.eq_one_of_mem_iInf_openNormalSubgroup hx

/-- **Layer 0, open means closed of finite index.** In a compact group a subgroup is open if and
only if it is closed of finite index: Mathlib's `Subgroup.isClosed_of_isOpen`,
`Subgroup.isOpen_of_isClosed_of_finiteIndex`, and `Subgroup.quotient_finite_of_isOpen`. -/
example [CompactSpace G] (H : Subgroup G) :
    IsOpen (H : Set G) ↔ IsClosed (H : Set G) ∧ H.FiniteIndex := by
  refine ⟨fun h ↦ ⟨H.isClosed_of_isOpen h, ?_⟩,
    fun ⟨hc, _⟩ ↦ H.isOpen_of_isClosed_of_finiteIndex hc⟩
  have := Subgroup.quotient_finite_of_isOpen H h
  exact Subgroup.finiteIndex_of_finite_quotient

/-- **Layer 0, open normal subgroups of a quotient.** The open normal subgroups of `G ⧸ N`
correspond, as an order isomorphism, to the open normal subgroups of `G` above `N`, by preimage:
Tau Ceti's `TauCeti.QuotientGroup.comapMk'OpenNormalOrderIso`. -/
example (N : Subgroup G) [N.Normal] :
    ∃ e : OpenNormalSubgroup (G ⧸ N) ≃o {U : OpenNormalSubgroup G // N ≤ U.toSubgroup},
      ∀ U, (e U).1.toSubgroup = U.toSubgroup.comap (QuotientGroup.mk' N) :=
  ⟨TauCeti.QuotientGroup.comapMk'OpenNormalOrderIso N,
    TauCeti.QuotientGroup.comapMk'OpenNormalOrderIso_apply_toSubgroup⟩

/-- **Layer 0, inverse limits, unbundled.** A compatible family of elements of the finite
quotients of a profinite group comes from a unique element: Tau Ceti's
`TauCeti.existsUnique_forall_mk_eq`. -/
example [CompactSpace G] [TotallyDisconnectedSpace G]
    (x : ∀ U : OpenNormalSubgroup G, G ⧸ U.toSubgroup)
    (hcompat : ∀ (U V : OpenNormalSubgroup G) (_ : U.toSubgroup ≤ V.toSubgroup) (g : G),
      QuotientGroup.mk' U.toSubgroup g = x U → QuotientGroup.mk' V.toSubgroup g = x V) :
    ∃! g : G, ∀ U : OpenNormalSubgroup G, QuotientGroup.mk' U.toSubgroup g = x U :=
  TauCeti.existsUnique_forall_mk_eq x hcompat

end Layer0

/-- **Layer 0, the compactness lemma.** A directed family of nonempty closed subsets of a
profinite (indeed of any compact) space has nonempty intersection: Mathlib's
`IsCompact.nonempty_iInter_of_directed_nonempty_isCompact_isClosed`. -/
example {X : Type u} [TopologicalSpace X] [CompactSpace X] {ι : Type v} [Nonempty ι]
    (t : ι → Set X) (hd : Directed (· ⊇ ·) t) (hn : ∀ i, (t i).Nonempty)
    (hc : ∀ i, IsClosed (t i)) : (⋂ i, t i).Nonempty :=
  IsCompact.nonempty_iInter_of_directed_nonempty_isCompact_isClosed t hd hn
    (fun i ↦ (hc i).isCompact) hc

/-- **Layer 0, compatible families in an inverse system of compact Hausdorff spaces**, general
directed indexing: Tau Ceti's `TauCeti.exists_forall_map_eq_of_compact_t2`. -/
example {ι : Type u} [Preorder ι] [IsDirectedOrder ι] {X : ι → Type v}
    [∀ i, TopologicalSpace (X i)] [∀ i, CompactSpace (X i)] [∀ i, T2Space (X i)]
    [∀ i, Nonempty (X i)] (f : ⦃i j : ι⦄ → i ≤ j → X j → X i) [InverseSystem f]
    (hf : ∀ ⦃i j : ι⦄ (h : i ≤ j), Continuous (f h)) :
    ∃ x : ∀ i, X i, ∀ ⦃i j : ι⦄ (h : i ≤ j), f h (x j) = x i :=
  TauCeti.exists_forall_map_eq_of_compact_t2 f hf

/-- **Layer 0, compatible families in an inverse system of nonempty finite sets**, general
directed indexing: Tau Ceti's `TauCeti.exists_forall_map_eq_of_finite`. -/
example {ι : Type u} [Preorder ι] [IsDirectedOrder ι] {X : ι → Type v}
    [∀ i, Finite (X i)] [∀ i, Nonempty (X i)] (f : ⦃i j : ι⦄ → i ≤ j → X j → X i)
    [InverseSystem f] :
    ∃ x : ∀ i, X i, ∀ ⦃i j : ι⦄ (h : i ≤ j), f h (x j) = x i :=
  TauCeti.exists_forall_map_eq_of_finite f

/-- **Layer 0, compatible families in a tower of compact Hausdorff spaces**, sequential
indexing: Tau Ceti's `TauCeti.exists_forall_map_succ_eq_of_compact_t2`. -/
example {S : ℕ → Type u} (β : ∀ k, S (k + 1) → S k) [∀ k, TopologicalSpace (S k)]
    [∀ k, CompactSpace (S k)] [∀ k, T2Space (S k)] [∀ k, Nonempty (S k)]
    (hβ : ∀ k, Continuous (β k)) : ∃ s : ∀ k, S k, ∀ k, β k (s (k + 1)) = s k :=
  TauCeti.exists_forall_map_succ_eq_of_compact_t2 β hβ

/-- **Layer 0, compatible families in a tower of nonempty finite sets**, sequential indexing:
Tau Ceti's `TauCeti.exists_forall_map_succ_eq_of_finite`. -/
example {S : ℕ → Type u} (β : ∀ k, S (k + 1) → S k) [∀ k, Finite (S k)]
    [∀ k, Nonempty (S k)] : ∃ s : ∀ k, S k, ∀ k, β k (s (k + 1)) = s k :=
  TauCeti.exists_forall_map_succ_eq_of_finite β

/-- **Layer 0, lifting a compatible family.** A compatible family in a tower of `T1` spaces lifts
along a levelwise surjective continuous map from a tower of compact Hausdorff spaces, with no
surjectivity asked of the transition maps: Tau Ceti's
`TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective`. -/
example {A : ℕ → Type u} {B : ℕ → Type v} [∀ k, TopologicalSpace (A k)]
    [∀ k, CompactSpace (A k)] [∀ k, T2Space (A k)] [∀ k, TopologicalSpace (B k)]
    [∀ k, T1Space (B k)] (α : ∀ k, A (k + 1) → A k) (β : ∀ k, B (k + 1) → B k)
    (g : ∀ k, A k → B k) (hα : ∀ k, Continuous (α k)) (hg : ∀ k, Continuous (g k))
    (hcomm : ∀ k a, g k (α k a) = β k (g (k + 1) a)) (hsurj : ∀ k, Function.Surjective (g k))
    (b : ∀ k, B k) (hb : ∀ k, β k (b (k + 1)) = b k) :
    ∃ a : ∀ k, A k, (∀ k, α k (a (k + 1)) = a k) ∧ ∀ k, g k (a k) = b k :=
  TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective α β g hα hg hcomm hsurj b hb

/-- **Layer 0, the unbundled universal property of the profinite completion.** Continuous
homomorphisms from the completion of `G` to a profinite group `P` correspond to abstract
homomorphisms from `G`, by restriction along the unit: Tau Ceti's
`TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv` and its `_apply` lemma. -/
example (G : Type u) [Group G] (P : Type v) [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] :
    ∃ e : (ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of G) →ₜ* P) ≃ (G →* P),
      ∀ f g, e f g = f (ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of G) g) :=
  ⟨TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv G P,
    TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv_apply G P⟩

/-- **Layer 0, the completion of a finite group is itself.** The unit of the profinite
completion is bijective on a finite group: Tau Ceti's
`TauCeti.ProfiniteCompletion.etaFn_bijective_of_finite`. -/
example (G : Type u) [Group G] [Finite G] :
    Function.Bijective (ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of G)) :=
  TauCeti.ProfiniteCompletion.etaFn_bijective_of_finite G

/-! ## Layer 1: supernatural order and index -/

section Supernatural

open TauCeti.Supernatural

/-- **Layer 1, `Supernatural` is the type of exponent functions.** Tau Ceti's
`TauCeti.Supernatural` is a separate type whose elements are determined by their exponents
(`TauCeti.Supernatural.ext`), and every exponent function arises (`ofFun`). -/
example : (∀ m n : TauCeti.Supernatural, (∀ p, m p = n p) → m = n) ∧
    ∀ f : Nat.Primes → ℕ∞, ∃ n : TauCeti.Supernatural, ∀ p, n p = f p :=
  ⟨fun _ _ ↦ TauCeti.Supernatural.ext, fun f ↦ ⟨ofFun f, ofFun_apply f⟩⟩

/-- **Layer 1, multiplication is pointwise `+`**: Tau Ceti's `TauCeti.Supernatural.mul_apply`. -/
example (m n : TauCeti.Supernatural) (p : Nat.Primes) : (m * n) p = m p + n p :=
  mul_apply m n p

/-- **Layer 1, divisibility is pointwise `≤`**: Tau Ceti's `TauCeti.Supernatural.dvd_iff`. -/
example (m n : TauCeti.Supernatural) : m ∣ n ↔ ∀ p, m p ≤ n p :=
  dvd_iff

/-- **Layer 1, the lattice operations are pointwise**: Tau Ceti's
`TauCeti.Supernatural.inf_apply` and `TauCeti.Supernatural.sup_apply`. -/
example (m n : TauCeti.Supernatural) (p : Nat.Primes) :
    (m ⊓ n) p = m p ⊓ n p ∧ (m ⊔ n) p = m p ⊔ n p :=
  ⟨inf_apply m n p, sup_apply m n p⟩

/-- **Layer 1, constructors: `ofNat`.** The embedding of `ℕ+` by prime factorization: Tau Ceti's
`TauCeti.Supernatural.ofNat_apply`. -/
example (n : ℕ+) (p : Nat.Primes) : ofNat n p = (padicValNat p n : ℕ∞) :=
  ofNat_apply n p

/-- **Layer 1, constructors: `1`.** The constant `1` has all exponents `0`, and is `ofNat 1`:
Tau Ceti's `TauCeti.Supernatural.one_apply` and `TauCeti.Supernatural.ofNat_one`. -/
example (p : Nat.Primes) : (1 : TauCeti.Supernatural) p = 0 ∧ ofNat 1 = 1 :=
  ⟨one_apply p, ofNat_one⟩

/-- **Layer 1, constructors: `p ^ ∞`.** `primePower p ⊤` has exponent `∞` at `p` and `0`
elsewhere: Tau Ceti's `TauCeti.Supernatural.primePower_apply_self` and
`TauCeti.Supernatural.primePower_apply_of_ne`. -/
example (p q : Nat.Primes) (hq : q ≠ p) : primePower p ⊤ p = ⊤ ∧ primePower p ⊤ q = 0 :=
  ⟨primePower_apply_self p ⊤, primePower_apply_of_ne hq ⊤⟩

/-- **Layer 1, morphisms: `ofNat` is order-preserving for divisibility**, an order embedding:
Tau Ceti's `TauCeti.Supernatural.ofNat_le_ofNat_iff`. -/
example (m n : ℕ+) : ofNat m ≤ ofNat n ↔ m ∣ n :=
  ofNat_le_ofNat_iff

/-- **Layer 1, morphisms: the projection to the `ℓ`-adic exponent**, a monotone map: Tau Ceti's
`TauCeti.Supernatural.exponent`. -/
example (ℓ : Nat.Primes) : ∃ e : TauCeti.Supernatural →o ℕ∞, ∀ m, e m = m ℓ :=
  ⟨exponent ℓ, exponent_apply ℓ⟩

/-- **Layer 1, `ofNat` is multiplicative**: Tau Ceti's `TauCeti.Supernatural.ofNat_mul`, bundled
as `TauCeti.Supernatural.ofNatMonoidHom`. -/
example (m n : ℕ+) : ofNat (m * n) = ofNat m * ofNat n :=
  ofNat_mul m n

/-- **Layer 1, `ofNat` is injective**: Tau Ceti's `TauCeti.Supernatural.ofNat_injective`. -/
example : Function.Injective ofNat :=
  ofNat_injective

/-- **Layer 1, `ofNat` takes `gcd` and `lcm` to `⊓` and `⊔`**: Tau Ceti's
`TauCeti.Supernatural.ofNat_gcd` and `TauCeti.Supernatural.ofNat_lcm`. -/
example (m n : ℕ+) :
    ofNat (PNat.gcd m n) = ofNat m ⊓ ofNat n ∧ ofNat (PNat.lcm m n) = ofNat m ⊔ ofNat n :=
  ⟨ofNat_gcd m n, ofNat_lcm m n⟩

/-- **Layer 1, naturality of divisibility under `ofNat`**: Tau Ceti's
`TauCeti.Supernatural.ofNat_dvd_ofNat_iff`. -/
example (m n : ℕ+) : ofNat m ∣ ofNat n ↔ m ∣ n :=
  ofNat_dvd_ofNat_iff

/-- **Layer 1, the predicate "is a natural number"**: Tau Ceti's
`TauCeti.Supernatural.isNatural_def`. -/
example (n : TauCeti.Supernatural) : IsNatural n ↔ ∃ m : ℕ+, ofNat m = n :=
  isNatural_def

/-- **Layer 1, edge cases: natural iff finite support and finite values**: Tau Ceti's
`TauCeti.Supernatural.isNatural_iff`. -/
example (n : TauCeti.Supernatural) :
    IsNatural n ↔ (support n).Finite ∧ ∀ p, n p ≠ ⊤ :=
  isNatural_iff

/-- **Layer 1, edge cases: the values `0` and `∞` at a prime.** Exponent `0` gives `1`
(`TauCeti.Supernatural.primePower_zero`), and an infinite exponent is never natural
(`TauCeti.Supernatural.not_isNatural_primePower_top`). -/
example (p : Nat.Primes) : primePower p 0 = 1 ∧ ¬ IsNatural (primePower p ⊤) :=
  ⟨primePower_zero p, not_isNatural_primePower_top p⟩

/-- **Layer 1, the `p`-primary and prime-to-`p` parts.** The `p`-primary part keeps the exponent
at `p` and kills the others, the prime-to-`p` part does the reverse, and their product is the
original number: Tau Ceti's `TauCeti.Supernatural.primaryPart` and
`TauCeti.Supernatural.primeToPart` with their `_apply` lemmas and
`TauCeti.Supernatural.primaryPart_mul_primeToPart`. -/
example (p q : Nat.Primes) (hq : q ≠ p) (n : TauCeti.Supernatural) :
    primaryPart p n p = n p ∧ primaryPart p n q = 0 ∧ primeToPart p n p = 0 ∧
      primeToPart p n q = n q ∧ primaryPart p n * primeToPart p n = n :=
  ⟨primaryPart_apply_self p n, primaryPart_apply_of_ne hq n, primeToPart_apply_self p n,
    primeToPart_apply_of_ne hq n, primaryPart_mul_primeToPart p n⟩

/-- **Layer 1, example: the order of `ℤ_p` is `p ^ ∞`**: Tau Ceti's
`TauCeti.profiniteOrder_multiplicative_padicInt`. -/
example (p : ℕ) [hp : Fact p.Prime] :
    TauCeti.profiniteOrder (Multiplicative ℤ_[p]) = primePower ⟨p, hp.out⟩ ⊤ :=
  TauCeti.profiniteOrder_multiplicative_padicInt p

/-- **Layer 1, example: the order of `ℤ̂` is `∏_ℓ ℓ ^ ∞`**, the supernatural number with every
exponent infinite: Tau Ceti's `TauCeti.zHat.profiniteOrder_eq_top`. -/
example (ℓ : Nat.Primes) : TauCeti.profiniteOrder TauCeti.zHat ℓ = ⊤ := by
  rw [TauCeti.zHat.profiniteOrder_eq_top, top_apply]

end Supernatural

section Order

variable {G : Type u} [Group G] [TopologicalSpace G]

/-- **Layer 1, the order of a profinite group.** At each prime, the supremum of the valuations
of the orders of the continuous finite quotients: Tau Ceti's `TauCeti.profiniteOrder_apply`. -/
example (p : Nat.Primes) :
    TauCeti.profiniteOrder G p =
      ⨆ U : OpenNormalSubgroup G, (padicValNat p (Nat.card (G ⧸ U.toSubgroup)) : ℕ∞) :=
  TauCeti.profiniteOrder_apply G p

/-- **Layer 1, the order of a finite group** is the factorization of `Nat.card G`: Tau Ceti's
`TauCeti.profiniteOrder_apply_of_finite`. -/
example [DiscreteTopology G] [Finite G] (p : Nat.Primes) :
    TauCeti.profiniteOrder G p = (padicValNat p (Nat.card G) : ℕ∞) :=
  TauCeti.profiniteOrder_apply_of_finite G p

/-- **Layer 1, the index of a subgroup**, in the pinned primewise form
`profiniteIndex H G ℓ = ⨆_N v_ℓ [G/N : HN/N]`: Tau Ceti's `Subgroup.profiniteIndex_apply`. -/
example (H : Subgroup G) (ℓ : Nat.Primes) :
    H.profiniteIndex ℓ = ⨆ N : OpenNormalSubgroup G,
      (padicValNat ℓ (H.map (QuotientGroup.mk' N.toSubgroup)).index : ℕ∞) :=
  H.profiniteIndex_apply ℓ

variable [IsTopologicalGroup G] [CompactSpace G]

/-- **Layer 1, the index of a closed subgroup as an lcm.** `profiniteIndex H G` is the supremum
in the supernatural lattice of the indices of the open subgroups above `H`: Tau Ceti's
`Subgroup.profiniteIndex_eq_iSup_openSubgroup`, which needs no closedness of `H`. -/
example (H : Subgroup G) (_hH : IsClosed (H : Set G)) :
    H.profiniteIndex = ⨆ U : {U : OpenSubgroup G // H ≤ U.toSubgroup},
      TauCeti.Supernatural.ofNat
        ⟨U.1.toSubgroup.index, Nat.pos_of_ne_zero Subgroup.index_ne_zero_of_finite⟩ :=
  H.profiniteIndex_eq_iSup_openSubgroup

/-- **Layer 1, the index depends only on the closure**: Tau Ceti's
`Subgroup.profiniteIndex_topologicalClosure`. -/
example (H : Subgroup G) : H.topologicalClosure.profiniteIndex = H.profiniteIndex :=
  H.profiniteIndex_topologicalClosure

/-- **Layer 1, index one means dense**: Tau Ceti's
`Subgroup.profiniteIndex_eq_one_iff_topologicalClosure_eq_top`. -/
example [TotallyDisconnectedSpace G] (H : Subgroup G) :
    H.profiniteIndex = 1 ↔ H.topologicalClosure = ⊤ :=
  H.profiniteIndex_eq_one_iff_topologicalClosure_eq_top

/-- **Layer 1, index API: index one means `⊤`, for closed `H`**: Tau Ceti's
`Subgroup.profiniteIndex_eq_one_iff`. -/
example [TotallyDisconnectedSpace G] (H : Subgroup G) (hH : IsClosed (H : Set G)) :
    H.profiniteIndex = 1 ↔ H = ⊤ :=
  H.profiniteIndex_eq_one_iff hH

/-- **Layer 1, index API: invariance under a topological isomorphism of the pair**: Tau Ceti's
`Subgroup.profiniteIndex_map_equiv`. -/
example {K : Type v} [Group K] [TopologicalSpace K] [IsTopologicalGroup K] [T2Space K]
    (H : Subgroup G) (e : G ≃ₜ* K) :
    (H.map (e : G →* K)).profiniteIndex = H.profiniteIndex :=
  H.profiniteIndex_map_equiv e

/-- **Layer 1, index API: multiplicativity in a tower** `H ≤ K ≤ G` with `K` closed: Tau Ceti's
`Subgroup.profiniteIndex_mul_profiniteIndex`. -/
example [TotallyDisconnectedSpace G] {H K : Subgroup G} (hHK : H ≤ K)
    (hK : IsClosed (K : Set G)) :
    (H.subgroupOf K).profiniteIndex * K.profiniteIndex = H.profiniteIndex :=
  Subgroup.profiniteIndex_mul_profiniteIndex hHK hK

/-- **Layer 1, index API: the image formula under a continuous surjection**
`[H : f K] = [G : K ⊔ ker f]`: Tau Ceti's `Subgroup.profiniteIndex_map_of_surjective`; when
`ker f ≤ K` the index is preserved (`Subgroup.profiniteIndex_map_eq`). -/
example {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [T2Space H]
    (K : Subgroup G) (f : G →* H) (hf : Continuous f) (hsurj : Function.Surjective f) :
    (K.map f).profiniteIndex = (K ⊔ f.ker).profiniteIndex :=
  K.profiniteIndex_map_of_surjective f hf hsurj

/-- **Layer 1, index API: Lagrange** `profiniteOrder G = profiniteOrder H * profiniteIndex H G`
for closed `H`: Tau Ceti's `Subgroup.profiniteOrder_eq_mul_profiniteIndex`. -/
example [TotallyDisconnectedSpace G] (H : Subgroup G) (hH : IsClosed (H : Set G)) :
    TauCeti.profiniteOrder G = TauCeti.profiniteOrder H * H.profiniteIndex :=
  H.profiniteOrder_eq_mul_profiniteIndex hH

/-- **Layer 1, index API: agreement with `Subgroup.index` for open `H`**, as
`profiniteIndex H G = ofNat H.index`: Tau Ceti's `OpenSubgroup.profiniteIndex_eq_ofNat_index`. -/
example (U : OpenSubgroup G) :
    U.toSubgroup.profiniteIndex = TauCeti.Supernatural.ofNat
      ⟨U.toSubgroup.index, Nat.pos_of_ne_zero Subgroup.index_ne_zero_of_finite⟩ :=
  U.profiniteIndex_eq_ofNat_index

/-- **Layer 1, pro-`p` in supernatural terms.** `G` is pro-`p` iff `profiniteOrder G` is
supported at `p`: Tau Ceti's `TauCeti.isProP_iff_profiniteOrder_apply_eq_zero`. -/
example (p : ℕ) [Fact p.Prime] :
    TauCeti.IsProP p G ↔ ∀ q : Nat.Primes, (q : ℕ) ≠ p → TauCeti.profiniteOrder G q = 0 :=
  TauCeti.isProP_iff_profiniteOrder_apply_eq_zero

/-- **Layer 1, open means closed of natural-number index**: Tau Ceti's
`Subgroup.isOpen_iff_isClosed_and_isNatural_profiniteIndex`. -/
example [TotallyDisconnectedSpace G] (H : Subgroup G) :
    IsOpen (H : Set G) ↔ IsClosed (H : Set G) ∧ H.profiniteIndex.IsNatural :=
  H.isOpen_iff_isClosed_and_isNatural_profiniteIndex

end Order

/-! ## Layer 2: profinite Sylow theory -/

section Sylow

variable {G : Type u} [Group G] [TopologicalSpace G]

/-- **Layer 2, definition.** `P` is `p`-Sylow iff it is closed, pro-`p`, and its image in every
continuous finite quotient has index prime to `p`: Tau Ceti's `TauCeti.isProPSylow_iff`. -/
example (p : ℕ) (P : Subgroup G) :
    TauCeti.IsProPSylow p P ↔ IsClosed (P : Set G) ∧ TauCeti.IsProP p P ∧
      ∀ U : OpenNormalSubgroup G, ¬ p ∣ (P.map (QuotientGroup.mk' U.toSubgroup)).index :=
  TauCeti.isProPSylow_iff

/-- **Layer 2, the supernatural form of the definition**, `¬ p ∣ profiniteIndex P G`: Tau Ceti's
`TauCeti.isProPSylow_iff_isClosed_and_isProP_and_not_dvd_profiniteIndex`. -/
example [IsTopologicalGroup G] [CompactSpace G] (q : Nat.Primes) (P : Subgroup G) :
    TauCeti.IsProPSylow q P ↔ IsClosed (P : Set G) ∧ TauCeti.IsProP q P ∧
      ¬ (q : TauCeti.Supernatural) ∣ P.profiniteIndex :=
  TauCeti.isProPSylow_iff_isClosed_and_isProP_and_not_dvd_profiniteIndex q

/-- **Layer 2, comparison with Mathlib's `Sylow` on a finite group**: Tau Ceti's
`TauCeti.isProPSylow_iff_exists_sylow_eq`. -/
example [DiscreteTopology G] [Finite G] (p : ℕ) [Fact p.Prime] (P : Subgroup G) :
    TauCeti.IsProPSylow p P ↔ ∃ Q : Sylow p G, (Q : Subgroup G) = P :=
  TauCeti.isProPSylow_iff_exists_sylow_eq

/-- **Layer 2, constructor from a compatible family of Sylow subgroups of the finite
quotients.** The `p`-Sylow subgroups are exactly the limits of compatible families of Sylow
subgroups of the finite quotients: Tau Ceti's `TauCeti.SylowFamily.equivIsProPSylow`, whose
forward map is the limit subgroup (`TauCeti.SylowFamily.coe_equivIsProPSylow_apply`). This is
also the statement that the `p`-Sylow subgroup of an inverse limit is the inverse limit of
`p`-Sylow subgroups. -/
example [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (p : ℕ)
    [Fact p.Prime] :
    ∃ e : TauCeti.SylowFamily p G ≃ {P : Subgroup G // TauCeti.IsProPSylow p P},
      ∀ S, (e S : Subgroup G) = S.subgroup :=
  ⟨TauCeti.SylowFamily.equivIsProPSylow, TauCeti.SylowFamily.coe_equivIsProPSylow_apply⟩

/-- **Layer 2, constructor from a maximal closed pro-`p` subgroup**, and conversely: a subgroup
is `p`-Sylow iff it is closed, pro-`p`, and maximal among closed pro-`p` subgroups. Tau Ceti's
`TauCeti.isProPSylow_iff_isProP_and_maximal` (maximality among all pro-`p` subgroups) and
`TauCeti.isProPSylow_of_maximal`, with `TauCeti.IsProP.topologicalClosure` to pass between the
two maximality conditions. -/
example [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (p : ℕ)
    [Fact p.Prime] (P : Subgroup G) :
    TauCeti.IsProPSylow p P ↔ IsClosed (P : Set G) ∧ TauCeti.IsProP p P ∧
      ∀ R : Subgroup G, IsClosed (R : Set G) → TauCeti.IsProP p R → P ≤ R → R ≤ P := by
  refine ⟨fun hP ↦ ⟨hP.isClosed, hP.isProP, fun R _ hR hPR ↦
    (TauCeti.isProPSylow_iff_isProP_and_maximal.mp hP).2 R hR hPR⟩, fun ⟨_, hP, hmax⟩ ↦ ?_⟩
  refine TauCeti.isProPSylow_of_maximal hP fun R hR hPR ↦ ?_
  exact R.le_topologicalClosure.trans (hmax _ R.isClosed_topologicalClosure
    hR.topologicalClosure (hPR.trans R.le_topologicalClosure))

/-- **Layer 2, example: `P = ⊤` when `G` is pro-`p`**: Tau Ceti's
`TauCeti.IsProP.isProPSylow_top` and `TauCeti.IsProPSylow.eq_top`. -/
example [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (p : ℕ)
    [Fact p.Prime] (hG : TauCeti.IsProP p G) (P : Subgroup G) :
    TauCeti.IsProPSylow p P ↔ P = ⊤ :=
  ⟨fun hP ↦ hP.eq_top hG, fun h ↦ h ▸ hG.isProPSylow_top⟩

/-- **Layer 2, morphisms: the inclusion `P ≤ G` is a closed embedding**: Tau Ceti's
`TauCeti.IsProPSylow.isClosed` and Mathlib's `IsClosed.isClosedEmbedding_subtypeVal`. -/
example (p : ℕ) {P : Subgroup G} (hP : TauCeti.IsProPSylow p P) :
    Topology.IsClosedEmbedding (Subtype.val : P → G) :=
  hP.isClosed.isClosedEmbedding_subtypeVal

/-- **Layer 2, naturality: conjugation preserves `p`-Sylow subgroups**: Tau Ceti's
`TauCeti.IsProPSylow.map_conj`. -/
example [IsTopologicalGroup G] (p : ℕ) {P : Subgroup G} (hP : TauCeti.IsProPSylow p P) (g : G) :
    TauCeti.IsProPSylow p (P.map (MulAut.conj g).toMonoidHom) :=
  hP.map_conj g

/-- **Layer 2, naturality: transport along a topological isomorphism**: Tau Ceti's
`TauCeti.IsProPSylow.map_continuousMulEquiv`. -/
example {H : Type v} [Group H] [TopologicalSpace H] (p : ℕ) {P : Subgroup G}
    (hP : TauCeti.IsProPSylow p P) (e : G ≃ₜ* H) :
    TauCeti.IsProPSylow p (P.map (e : G →* H)) :=
  hP.map_continuousMulEquiv e

/-- **Layer 2, edge case: `p` not dividing the order.** A `p`-Sylow subgroup is trivial exactly
when the exponent of `p` in `profiniteOrder G` is `0`: Tau Ceti's `TauCeti.IsProPSylow.eq_bot_iff`.
Its order is the `p`-primary part of the order of `G` (`TauCeti.IsProPSylow.profiniteOrder_eq`). -/
example [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (q : Nat.Primes)
    {P : Subgroup G} (hP : TauCeti.IsProPSylow q P) :
    (P = ⊥ ↔ TauCeti.profiniteOrder G q = 0) ∧
      TauCeti.profiniteOrder P = TauCeti.Supernatural.primaryPart q (TauCeti.profiniteOrder G) :=
  ⟨hP.eq_bot_iff, hP.profiniteOrder_eq⟩

/-- **Layer 2, edge case: the trivial group.** In a trivial profinite group the trivial subgroup
is `p`-Sylow for every `p`: Tau Ceti's `TauCeti.isProPSylow_bot_iff` and
`TauCeti.profiniteOrder_eq_bot_iff`. -/
example [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] [Subsingleton G]
    (q : Nat.Primes) : TauCeti.IsProPSylow q (⊥ : Subgroup G) := by
  rw [TauCeti.isProPSylow_bot_iff, (TauCeti.profiniteOrder_eq_bot_iff G).mpr inferInstance,
    TauCeti.Supernatural.bot_apply]

/-- **Layer 2, existence of `p`-Sylow subgroups.** Every profinite group has a `p`-Sylow
subgroup: Tau Ceti's `TauCeti.exists_isProPSylow`. -/
theorem exists_isProPSylow (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] :
    ∃ P : Subgroup G, TauCeti.IsProPSylow p P :=
  TauCeti.exists_isProPSylow p G

/-- **Layer 2, conjugacy of `p`-Sylow subgroups**: Tau Ceti's
`TauCeti.IsProPSylow.exists_map_conj_eq`. -/
example [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (p : ℕ)
    [Fact p.Prime] {P Q : Subgroup G} (hP : TauCeti.IsProPSylow p P)
    (hQ : TauCeti.IsProPSylow p Q) : ∃ g : G, P.map (MulAut.conj g).toMonoidHom = Q :=
  hP.exists_map_conj_eq hQ

/-- **Layer 2, every closed pro-`p` subgroup lies in a `p`-Sylow subgroup**: Tau Ceti's
`TauCeti.IsProP.exists_le_isProPSylow`, which needs no closedness of `Q`; the hypothesis is kept
so that the statement keeps its interface. -/
theorem IsProP.exists_le_isProPSylow (p : ℕ) [Fact p.Prime] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (Q : Subgroup G) (hQ : TauCeti.IsProP p Q) (_hQc : IsClosed (Q : Set G)) :
    ∃ P : Subgroup G, TauCeti.IsProPSylow p P ∧ Q ≤ P :=
  TauCeti.IsProP.exists_le_isProPSylow hQ

/-- **Layer 2, a pro-`p` subgroup of index prime to `p` is maximal pro-`p`**: Tau Ceti's
`TauCeti.IsProPSylow.eq_of_le`. -/
example [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (p : ℕ)
    [Fact p.Prime] {P Q : Subgroup G} (hP : TauCeti.IsProPSylow p P) (hQ : TauCeti.IsProP p Q)
    (hPQ : P ≤ Q) : P = Q :=
  hP.eq_of_le hQ hPQ

/-- **Layer 2, a normal `p`-Sylow subgroup is the only one**: Tau Ceti's
`TauCeti.IsProPSylow.eq_of_normal`. -/
theorem IsProPSylow.eq_of_normal (p : ℕ) [Fact p.Prime] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (P Q : Subgroup G) (hP : TauCeti.IsProPSylow p P) (hQ : TauCeti.IsProPSylow p Q)
    (hn : P.Normal) : P = Q :=
  TauCeti.IsProPSylow.eq_of_normal p G P Q hP hQ hn

/-- **Layer 2, the image of a `p`-Sylow subgroup under a continuous surjection**: Tau Ceti's
`TauCeti.IsProPSylow.map_of_surjective`. -/
theorem IsProPSylow.map_of_surjective (p : ℕ) [Fact p.Prime] (G H : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H]
    [TotallyDisconnectedSpace H] (f : G →* H) (hf : Continuous f)
    (hsurj : Function.Surjective f) (P : Subgroup G) (hP : TauCeti.IsProPSylow p P) :
    TauCeti.IsProPSylow p (P.map f) :=
  TauCeti.IsProPSylow.map_of_surjective hP f hf hsurj

/-- **Layer 2, an open subgroup containing a `p`-Sylow subgroup has index prime to `p`**: Tau
Ceti's `TauCeti.IsProPSylow.not_dvd_index_of_le`. -/
theorem IsProPSylow.not_dvd_index_of_le (p : ℕ) [Fact p.Prime] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (P : Subgroup G) (hP : TauCeti.IsProPSylow p P) (U : OpenSubgroup G)
    (hPU : P ≤ U.toSubgroup) : ¬ p ∣ U.toSubgroup.index :=
  TauCeti.IsProPSylow.not_dvd_index_of_le hP U hPU

end Sylow

/-- **Layer 2, worked instance: the `p`-Sylow subgroup of `ℤ̂` is `ℤ_p`.** `ℤ̂` has a `p`-Sylow
subgroup, and every one is topologically isomorphic to `ℤ_p`: Tau Ceti's
`TauCeti.exists_isProPSylow` and `TauCeti.IsProPSylow.continuousMulEquivPadicInt`. -/
example (p : ℕ) [Fact p.Prime] :
    (∃ P : Subgroup TauCeti.zHat, TauCeti.IsProPSylow p P) ∧
      ∀ P : Subgroup TauCeti.zHat, TauCeti.IsProPSylow p P →
        Nonempty (P ≃ₜ* Multiplicative ℤ_[p]) :=
  ⟨TauCeti.exists_isProPSylow p _, fun _ hP ↦ ⟨hP.continuousMulEquivPadicInt⟩⟩

end Layers0To2

section Layer3


open CategoryTheory Cardinal


/-! ## Layer 3: pro-`p` groups, the maximal pro-`p` quotient, Frattini theory, generation -/

section IsProP

/-- **Layer 3, `IsProP` in quotient form.** A topological group is pro-`p` exactly when each
quotient by an open normal subgroup is a `p`-group: Tau Ceti's `TauCeti.isProP_iff`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] :
    TauCeti.IsProP p G ↔ ∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U.toSubgroup) :=
  TauCeti.isProP_iff

/-- **Layer 3, a finite discrete `p`-group is pro-`p`.** The constructor from `IsPGroup`,
Tau Ceti's `IsPGroup.isProP`, and on a discrete group the two notions agree, Tau Ceti's
`TauCeti.isProP_iff_isPGroup`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [DiscreteTopology G] :
    (IsPGroup p G → TauCeti.IsProP p G) ∧ (TauCeti.IsProP p G ↔ IsPGroup p G) :=
  ⟨IsPGroup.isProP, TauCeti.isProP_iff_isPGroup⟩

/-- **Layer 3, the equivalence milestone.** A profinite group is pro-`p` if and only if it is
continuously isomorphic to a limit of finite `p`-groups: Tau Ceti's
`TauCeti.isProP_iff_exists_continuousMulEquiv_limit`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    TauCeti.IsProP p G ↔ ∃ (J : Type u) (_ : SmallCategory J) (F : J ⥤ FiniteGrp.{u}),
      (∀ j, IsPGroup p (F.obj j)) ∧
        Nonempty (G ≃ₜ* ProfiniteGrp.limit (F ⋙ forget₂ FiniteGrp ProfiniteGrp)) :=
  TauCeti.isProP_iff_exists_continuousMulEquiv_limit

/-- **Layer 3, pro-`p` is stable under inverse limits**: Tau Ceti's `TauCeti.IsProP.limit`. -/
example {p : ℕ} {J : Type v} [SmallCategory J] (F : J ⥤ ProfiniteGrp.{max v u})
    (hF : ∀ j, TauCeti.IsProP p (F.obj j)) : TauCeti.IsProP p (ProfiniteGrp.limit F) :=
  TauCeti.IsProP.limit F hF

/-- **Layer 3, pro-`p` passes to closed subgroups.** Tau Ceti's `TauCeti.IsProP.subgroup` holds
for every subgroup, closed or not, in the subspace topology. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) (H : Subgroup G)
    (_hH : IsClosed (H : Set G)) : TauCeti.IsProP p H :=
  hG.subgroup H

/-- **Layer 3, pro-`p` passes to quotients by closed normal subgroups.** Tau Ceti's
`TauCeti.IsProP.quotient` needs no closedness; continuous surjective images are
`TauCeti.IsProP.of_surjective`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] (hG : TauCeti.IsProP p G)
    (N : Subgroup G) [N.Normal] (_hN : IsClosed (N : Set G)) : TauCeti.IsProP p (G ⧸ N) :=
  hG.quotient N

/-- **Layer 3, pro-`p` passes to continuous surjective images**: Tau Ceti's
`TauCeti.IsProP.of_surjective`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] {H : Type v} [Group H]
    [TopologicalSpace H] (hG : TauCeti.IsProP p G) (f : G →* H) (hf : Continuous f)
    (hs : Function.Surjective f) : TauCeti.IsProP p H :=
  hG.of_surjective f hf hs

/-- **Layer 3, pro-`p` passes to finite products**: Tau Ceti's `TauCeti.IsProP.prod`, and
`TauCeti.IsProP.pi` for products over an arbitrary index type. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] {H : Type v} [Group H]
    [TopologicalSpace H] (hG : TauCeti.IsProP p G) (hH : TauCeti.IsProP p H) :
    TauCeti.IsProP p (G × H) :=
  hG.prod hH

/-- **Layer 3, pro-`p` passes to products**, over any index type: Tau Ceti's
`TauCeti.IsProP.pi`. -/
example {p : ℕ} {ι : Type u} {G : ι → Type v} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
    (hG : ∀ i, TauCeti.IsProP p (G i)) : TauCeti.IsProP p (∀ i, G i) :=
  TauCeti.IsProP.pi hG

/-- **Layer 3, pro-`p` is closed under extensions.** A compact group mapping onto a Hausdorff
pro-`p` group by a continuous surjection with pro-`p` kernel is pro-`p`: Tau Ceti's
`TauCeti.IsProP.of_ker_isProP`. -/
example {p : ℕ} {E : Type u} [Group E] [TopologicalSpace E] [IsTopologicalGroup E]
    [CompactSpace E] {G : Type v} [Group G] [TopologicalSpace G] [T2Space G]
    (hG : TauCeti.IsProP p G) {f : E →* G} (hf : Continuous f) (hs : Function.Surjective f)
    (hker : TauCeti.IsProP p f.ker) : TauCeti.IsProP p E :=
  hG.of_ker_isProP hf hs hker

/-- **Layer 3, `IsProP` example `ℤ_p`**: Tau Ceti's `TauCeti.isProP_multiplicative_padicInt`. -/
example (p : ℕ) [Fact p.Prime] : TauCeti.IsProP p (Multiplicative ℤ_[p]) :=
  TauCeti.isProP_multiplicative_padicInt p

/-- **Layer 3, `IsProP` example `ℤ/p^n`**: Tau Ceti's `TauCeti.isProP_multiplicative_zmod_pow`. -/
example (p n : ℕ) : TauCeti.IsProP p (Multiplicative (ZMod (p ^ n))) :=
  TauCeti.isProP_multiplicative_zmod_pow p n

/-- **Layer 3, `IsProP` example `freeProP p (Fin n)`**: Tau Ceti's `TauCeti.isProP_freeProP`. -/
example (p n : ℕ) : TauCeti.IsProP p (TauCeti.freeProP p (Fin n)) :=
  TauCeti.isProP_freeProP p (Fin n)

/-- **Layer 3, `IsProP` example `D₀` of Layer 6**, a pro-`2` group: Tau Ceti's
`TauCeti.isProP_demushkinD0`. -/
example : TauCeti.IsProP 2 TauCeti.demushkinD0 :=
  TauCeti.isProP_demushkinD0

/-- **Layer 3, pro-`p` via the supernatural order** (Layer 1). A profinite group is pro-`p`
exactly when its supernatural order is a power of `p`: Tau Ceti's
`TauCeti.isProP_iff_profiniteOrder_le_primePower`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] :
    TauCeti.IsProP p G ↔
      TauCeti.profiniteOrder G ≤ TauCeti.Supernatural.primePower ⟨p, Fact.out⟩ ⊤ :=
  TauCeti.isProP_iff_profiniteOrder_le_primePower

/-- **Layer 3, pro-`p` via the pro-`p` kernel.** A profinite group is pro-`p` exactly when
`proPKernel p G = ⊥`: Tau Ceti's `TauCeti.proPKernel_eq_bot_iff`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    TauCeti.proPKernel p G = ⊥ ↔ TauCeti.IsProP p G :=
  TauCeti.proPKernel_eq_bot_iff

/-- **Layer 3, `IsProP` is invariant under topological isomorphism**: Tau Ceti's
`TauCeti.isProP_congr`. -/
example {p : ℕ} {G : Type u} {H : Type v} [Group G] [TopologicalSpace G] [Group H]
    [TopologicalSpace H] (e : G ≃ₜ* H) : TauCeti.IsProP p G ↔ TauCeti.IsProP p H :=
  TauCeti.isProP_congr e

/-- **Layer 3, edge case: the trivial group is pro-`p` for every `p`**, as a `p`-group
(`IsPGroup.isProP`). -/
example (p : ℕ) {G : Type u} [Group G] [TopologicalSpace G] [Subsingleton G] :
    TauCeti.IsProP p G :=
  IsPGroup.isProP (IsPGroup.of_subsingleton p G)

/-- **Layer 3, edge case: a group pro-`p` for two different primes is trivial**: Tau Ceti's
`TauCeti.IsProP.subsingleton_of_ne`. -/
example {p q : ℕ} [Fact p.Prime] [Fact q.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hp : TauCeti.IsProP p G) (hq : TauCeti.IsProP q G) (hpq : p ≠ q) : Subsingleton G :=
  hp.subsingleton_of_ne hq hpq

end IsProP

section MaximalProPQuotient

/-- **Layer 3, the pro-`p` kernel.** `proPKernel p G` is the intersection of the open normal
subgroups with `p`-group quotient: Tau Ceti's `TauCeti.mem_proPKernel_iff`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] (x : G) :
    x ∈ TauCeti.proPKernel p G ↔
      ∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U.toSubgroup) → x ∈ U.toSubgroup :=
  TauCeti.mem_proPKernel_iff

/-- **Layer 3, the pro-`p` kernel is closed and normal**: Tau Ceti's instances
`TauCeti.isClosed_proPKernel` and `TauCeti.proPKernel_normal`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    IsClosed ((TauCeti.proPKernel p G : Subgroup G) : Set G) ∧ (TauCeti.proPKernel p G).Normal :=
  ⟨TauCeti.isClosed_proPKernel, inferInstance⟩

/-- **Layer 3, the pro-`p` kernel is characteristic for continuous automorphisms**, and more
generally transported by topological isomorphisms: Tau Ceti's `TauCeti.map_proPKernel_eq`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] {H : Type v} [Group H]
    [TopologicalSpace H] (e : G ≃ₜ* H) :
    (TauCeti.proPKernel p G).map e.toMonoidHom = TauCeti.proPKernel p H :=
  TauCeti.map_proPKernel_eq e

/-- **Layer 3, the pro-`p` kernel is preserved by continuous homomorphisms**: Tau Ceti's
`TauCeti.map_proPKernel_le`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] {H : Type v} [Group H]
    [TopologicalSpace H] (f : G →* H) (hf : Continuous f) :
    (TauCeti.proPKernel p G).map f ≤ TauCeti.proPKernel p H :=
  TauCeti.map_proPKernel_le f hf

/-- **Layer 3, the maximal pro-`p` quotient** is `G ⧸ proPKernel p G` (Tau Ceti's
`TauCeti.maximalProPQuotient`, an `abbrev`), and it is pro-`p`: Tau Ceti's
`TauCeti.isProP_maximalProPQuotient`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    TauCeti.maximalProPQuotient p G = (G ⧸ TauCeti.proPKernel p G) ∧
      TauCeti.IsProP p (TauCeti.maximalProPQuotient p G) :=
  ⟨rfl, TauCeti.isProP_maximalProPQuotient⟩

/-- **Layer 3, the quotient map `G ↠ G(p)`** is a continuous surjective homomorphism: Tau Ceti's
`TauCeti.maximalProPQuotient.mk` with `continuous_mk` and `mk_surjective`. -/
example (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] :
    Continuous (TauCeti.maximalProPQuotient.mk p G) ∧
      Function.Surjective (TauCeti.maximalProPQuotient.mk p G) :=
  ⟨TauCeti.maximalProPQuotient.continuous_mk p G, TauCeti.maximalProPQuotient.mk_surjective p G⟩

/-- **Layer 3, universal property of the maximal pro-`p` quotient.** Continuous homomorphisms
from `G` to a pro-`p` profinite group factor uniquely through `G(p)`: Tau Ceti's
`TauCeti.existsUnique_continuousMonoidHom_maximalProPQuotient`, with the factorisation
`TauCeti.maximalProPQuotient.lift`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] {P : Type v} [Group P]
    [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P]
    (hP : TauCeti.IsProP p P) (f : G →* P) (hf : Continuous f) :
    ∃! g : TauCeti.maximalProPQuotient p G →* P,
      Continuous g ∧ ∀ x : G, g (TauCeti.maximalProPQuotient.mk p G x) = f x :=
  TauCeti.existsUnique_continuousMonoidHom_maximalProPQuotient hP f hf

/-- **Layer 3, the factorisation through `G(p)`**: Tau Ceti's `TauCeti.maximalProPQuotient.lift`,
continuous (`continuous_lift`) and extending `f` (`lift_mk`). -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] {P : Type v} [Group P]
    [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P]
    (hP : TauCeti.IsProP p P) (f : G →* P) (hf : Continuous f) :
    Continuous (TauCeti.maximalProPQuotient.lift hP f hf) ∧
      ∀ x : G, TauCeti.maximalProPQuotient.lift hP f hf (x : TauCeti.maximalProPQuotient p G)
        = f x :=
  ⟨TauCeti.maximalProPQuotient.continuous_lift hP f hf,
    TauCeti.maximalProPQuotient.lift_mk hP f hf⟩

/-- **Layer 3, `G(p) = G` for pro-`p` `G`.** The quotient map is a topological isomorphism:
Tau Ceti's `TauCeti.maximalProPQuotient.equivOfIsProP`, inverse to the quotient map
(`equivOfIsProP_mk`). -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) :
    ∃ e : TauCeti.maximalProPQuotient p G ≃ₜ* G,
      ∀ x : G, e (x : TauCeti.maximalProPQuotient p G) = x :=
  ⟨TauCeti.maximalProPQuotient.equivOfIsProP hG,
    TauCeti.maximalProPQuotient.equivOfIsProP_mk hG⟩

/-- **Layer 3, idempotence of the maximal pro-`p` quotient**, `G(p)(p) ≅ G(p)` through the
quotient map: Tau Ceti's `TauCeti.maximalProPQuotient.idempotentEquiv`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    ∃ e : TauCeti.maximalProPQuotient p (TauCeti.maximalProPQuotient p G) ≃ₜ*
        TauCeti.maximalProPQuotient p G,
      ∀ x : TauCeti.maximalProPQuotient p G,
        e (x : TauCeti.maximalProPQuotient p (TauCeti.maximalProPQuotient p G)) = x :=
  ⟨TauCeti.maximalProPQuotient.idempotentEquiv, TauCeti.maximalProPQuotient.idempotentEquiv_mk⟩

/-- **Layer 3, the induced map on maximal pro-`p` quotients** of a continuous homomorphism,
continuous and compatible with the quotient maps: Tau Ceti's `TauCeti.maximalProPQuotient.map`
with `continuous_map` and `map_mk`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] {H : Type v} [Group H]
    [TopologicalSpace H] (f : G →* H) (hf : Continuous f) :
    Continuous (TauCeti.maximalProPQuotient.map (p := p) f hf) ∧
      ∀ x : G, TauCeti.maximalProPQuotient.map (p := p) f hf (x : _) =
        TauCeti.maximalProPQuotient.mk p H (f x) :=
  ⟨TauCeti.maximalProPQuotient.continuous_map f hf, TauCeti.maximalProPQuotient.map_mk f hf⟩

/-- **Layer 3, functoriality of the maximal pro-`p` quotient**: Tau Ceti's
`TauCeti.maximalProPQuotient.map_id` and `TauCeti.maximalProPQuotient.map_comp`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] {H : Type v} [Group H]
    [TopologicalSpace H] {K : Type u} [Group K] [TopologicalSpace K] (f : G →* H)
    (hf : Continuous f) (g : H →* K) (hg : Continuous g) :
    TauCeti.maximalProPQuotient.map (p := p) (MonoidHom.id G) continuous_id =
        MonoidHom.id (TauCeti.maximalProPQuotient p G) ∧
      TauCeti.maximalProPQuotient.map (p := p) (g.comp f) (hg.comp hf) =
        (TauCeti.maximalProPQuotient.map g hg).comp (TauCeti.maximalProPQuotient.map f hf) :=
  ⟨TauCeti.maximalProPQuotient.map_id, TauCeti.maximalProPQuotient.map_comp f hf g hg⟩

/-- **Layer 3, naturality of the factorisation in the source**: Tau Ceti's
`TauCeti.maximalProPQuotient.lift_comp_map`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] {P : Type v} [Group P]
    [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P]
    {G' : Type u} [Group G'] [TopologicalSpace G'] (hP : TauCeti.IsProP p P) (f : G →* P)
    (hf : Continuous f) (w : G' →* G) (hw : Continuous w) :
    (TauCeti.maximalProPQuotient.lift hP f hf).comp (TauCeti.maximalProPQuotient.map w hw) =
      TauCeti.maximalProPQuotient.lift hP (f.comp w) (hf.comp hw) :=
  TauCeti.maximalProPQuotient.lift_comp_map hP f hf w hw

/-- **Layer 3, naturality of the factorisation in the target**: Tau Ceti's
`TauCeti.maximalProPQuotient.comp_lift`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] {P : Type v} [Group P]
    [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P]
    {Q : Type v} [Group Q] [TopologicalSpace Q] [IsTopologicalGroup Q] [CompactSpace Q]
    [TotallyDisconnectedSpace Q] (hP : TauCeti.IsProP p P) (hQ : TauCeti.IsProP p Q)
    (f : G →* P) (hf : Continuous f) (w : P →* Q) (hw : Continuous w) :
    w.comp (TauCeti.maximalProPQuotient.lift hP f hf) =
      TauCeti.maximalProPQuotient.lift hQ (w.comp f) (hw.comp hf) :=
  TauCeti.maximalProPQuotient.comp_lift hP hQ f hf w hw

/-- **Layer 3, example: `maximalProPQuotient p ℤ̂ ≅ ℤ_p`** (Layer 4): Tau Ceti's
`TauCeti.zHat.maximalProPQuotientEquivPadicInt`. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty (TauCeti.maximalProPQuotient p TauCeti.zHat ≃ₜ* Multiplicative ℤ_[p]) :=
  ⟨TauCeti.zHat.maximalProPQuotientEquivPadicInt p⟩

/-- **Layer 3, comparison with the pro-`C` kernel** (Layer 4):
`proCKernel (finiteGroupClassP p) G = proPKernel p G`, Tau Ceti's
`TauCeti.proCKernel_finiteGroupClassP_eq_proPKernel`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] :
    TauCeti.proCKernel (TauCeti.finiteGroupClassP.{u} p) G = TauCeti.proPKernel p G :=
  TauCeti.proCKernel_finiteGroupClassP_eq_proPKernel

/-- **Layer 3, edge case: `proPKernel p G = ⊤`** exactly when `G` has no nontrivial continuous
`p`-group quotient, and then `G(p)` is trivial: Tau Ceti's `TauCeti.proPKernel_eq_top_iff` and
`TauCeti.maximalProPQuotient.subsingleton_iff`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] :
    (TauCeti.proPKernel p G = ⊤ ↔
      ∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U.toSubgroup) → U.toSubgroup = ⊤) ∧
    (Subsingleton (TauCeti.maximalProPQuotient p G) ↔ TauCeti.proPKernel p G = ⊤) :=
  ⟨TauCeti.proPKernel_eq_top_iff, TauCeti.maximalProPQuotient.subsingleton_iff⟩

/-- **Layer 3, edge case: a prime that does not divide the order** of a finite group has
trivial maximal pro-`p` quotient: Tau Ceti's
`TauCeti.maximalProPQuotient.subsingleton_of_not_dvd_card`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    (h : ¬ p ∣ Nat.card G) : Subsingleton (TauCeti.maximalProPQuotient p G) :=
  TauCeti.maximalProPQuotient.subsingleton_of_not_dvd_card h

/-- **Layer 3, edge case: a prime that does not divide the supernatural order.** If the
`p`-exponent of the supernatural order of a compact group is `0`, its maximal pro-`p` quotient
is trivial: a bridge from `TauCeti.proPKernel_eq_top_iff` and the definition of
`TauCeti.profiniteOrder` (`TauCeti.profiniteOrder_apply`). -/
example {p : ℕ} [hp : Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G]
    (h : TauCeti.profiniteOrder G (⟨p, hp.out⟩ : Nat.Primes) = 0) :
    Subsingleton (TauCeti.maximalProPQuotient p G) := by
  refine TauCeti.maximalProPQuotient.subsingleton_iff.mpr
    (TauCeti.proPKernel_eq_top_iff.mpr fun U hU ↦ ?_)
  have : Finite (G ⧸ U.toSubgroup) :=
    Subgroup.quotient_finite_of_isOpen _ U.toOpenSubgroup.isOpen
  obtain ⟨n, hn⟩ := IsPGroup.iff_card.mp hU
  have hle : (padicValNat p (Nat.card (G ⧸ U.toSubgroup)) : ℕ∞) ≤
      TauCeti.profiniteOrder G (⟨p, hp.out⟩ : Nat.Primes) := by
    refine le_of_le_of_eq ?_ (TauCeti.profiniteOrder_apply G _).symm
    exact le_iSup (fun V : OpenNormalSubgroup G ↦
      (padicValNat p (Nat.card (G ⧸ V.toSubgroup)) : ℕ∞)) U
  rw [h, hn, padicValNat.prime_pow] at hle
  have hn0 : n = 0 := by exact_mod_cast le_antisymm hle bot_le
  rw [hn0, pow_zero] at hn
  exact Subgroup.index_eq_one.mp (by rw [Subgroup.index_eq_card, hn])

/-- **Layer 3, the pro-`p` kernel has no `p`-quotient.** For profinite `G`, the kernel
`N = proPKernel p G` of the maximal pro-`p` quotient has trivial maximal pro-`p` quotient itself:
`proPKernel p N = ⊤`. The open normal subgroups of `N` need not come from those of `G`, so this
is a theorem and not the definition: Tau Ceti's `TauCeti.proPKernel_proPKernel_eq_top`. -/
theorem proPKernel_proPKernel_eq_top (p : ℕ) [Fact p.Prime] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] :
    proPKernel p (proPKernel p G) = ⊤ :=
  TauCeti.proPKernel_proPKernel_eq_top

/-- **Layer 3, the pro-`p` kernel admits no continuous surjection onto `ℤ/p`**, the "in
particular" of the kernel theorem: from `proPKernel_proPKernel_eq_top` and Tau Ceti's
`TauCeti.eq_one_of_proPKernel_eq_top`. -/
example (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (f : TauCeti.proPKernel p G →* Multiplicative (ZMod p)) (hf : Continuous f) :
    ¬ Function.Surjective f := by
  intro hs
  have h1 : f = 1 := TauCeti.eq_one_of_proPKernel_eq_top (proPKernel_proPKernel_eq_top p G)
    (TauCeti.isProP_iff_isPGroup.mpr (IsPGroup.of_card (n := 1) (by simp))) f hf
  obtain ⟨x, hx⟩ := hs (Multiplicative.ofAdd 1)
  rw [h1, MonoidHom.one_apply] at hx
  exact one_ne_zero (congrArg Multiplicative.toAdd hx).symm

end MaximalProPQuotient

section Generation

/-- **Layer 3, topological finite generation**: some finite subset generates a dense subgroup,
Tau Ceti's `TauCeti.isTopologicallyFinitelyGenerated_iff`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    TauCeti.IsTopologicallyFinitelyGenerated G ↔
      ∃ s : Finset G, (Subgroup.closure (s : Set G)).topologicalClosure = ⊤ :=
  TauCeti.isTopologicallyFinitelyGenerated_iff

/-- **Layer 3, generation passes along continuous surjections**: Tau Ceti's
`TauCeti.IsTopologicallyFinitelyGenerated.of_surjective`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] {H : Type v}
    [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (hG : TauCeti.IsTopologicallyFinitelyGenerated G) {f : G →* H} (hf : Continuous f)
    (hs : Function.Surjective f) : TauCeti.IsTopologicallyFinitelyGenerated H :=
  hG.of_surjective hf hs

/-- **Layer 3, convergence to `1`.** A subset converges to `1` when its members tend to `1`
along the cofinite filter: the definition of Tau Ceti's `TauCeti.ConvergesToOne`. -/
example {G : Type u} [TopologicalSpace G] [One G] (s : Set G) :
    TauCeti.ConvergesToOne s ↔
      Filter.Tendsto (Subtype.val : s → G) Filter.cofinite (nhds 1) :=
  Iff.rfl

/-- **Layer 3, finite sets converge to `1`**: Tau Ceti's `Set.Finite.convergesToOne`. -/
example {G : Type u} [TopologicalSpace G] [One G] {s : Set G} (hs : s.Finite) :
    TauCeti.ConvergesToOne s :=
  hs.convergesToOne

/-- **Layer 3, a subset of a converging set converges to `1`**: Tau Ceti's
`TauCeti.ConvergesToOne.mono`. -/
example {G : Type u} [TopologicalSpace G] [One G] {s t : Set G} (hs : TauCeti.ConvergesToOne s)
    (hts : t ⊆ s) : TauCeti.ConvergesToOne t :=
  hs.mono hts

/-- **Layer 3, a continuous image of a converging set converges to `1`**: Tau Ceti's
`TauCeti.ConvergesToOne.image`. -/
example {G : Type u} [Group G] [TopologicalSpace G] {H : Type v} [Group H] [TopologicalSpace H]
    {s : Set G} (hs : TauCeti.ConvergesToOne s) (f : G →* H) (hf : Continuous f) :
    TauCeti.ConvergesToOne (f '' s) :=
  hs.image f hf

/-- **Layer 3, every profinite group has a generating set converging to `1`**
(RZ Prop. 2.6.2): Tau Ceti's `TauCeti.exists_convergesToOne_topologicallyGenerates`. This is what
makes `topologicalGeneratorRank` an infimum over a nonempty family. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] :
    ∃ s : Set G, TauCeti.ConvergesToOne s ∧ (Subgroup.closure s).topologicalClosure = ⊤ :=
  TauCeti.exists_convergesToOne_topologicallyGenerates

/-- **Layer 3, the topological generator rank** is the infimum of the cardinalities of the
generating sets converging to `1`: Tau Ceti's `TauCeti.topologicalGeneratorRank_def`. -/
example (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    TauCeti.topologicalGeneratorRank G =
      ⨅ s : {s : Set G // TauCeti.ConvergesToOne s ∧
        (Subgroup.closure s).topologicalClosure = ⊤}, #(s.1 : Set G) :=
  TauCeti.topologicalGeneratorRank_def G

/-- **Layer 3, rank constructor from a converging generating set**: the rank is at most its
cardinality, Tau Ceti's `TauCeti.topologicalGeneratorRank_le`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] {s : Set G}
    (hs : TauCeti.ConvergesToOne s) (hgen : (Subgroup.closure s).topologicalClosure = ⊤) :
    TauCeti.topologicalGeneratorRank G ≤ #s :=
  TauCeti.topologicalGeneratorRank_le hs hgen

/-- **Layer 3, the rank does not increase under a continuous surjection** out of a profinite
group: Tau Ceti's `TauCeti.topologicalGeneratorRank_le_of_surjective`. ⚠ The source must be
profinite. For a group with no generating set converging to `1` the infimum defining the rank is
empty and the rank is `0`: the identity from `ℚ` with the discrete topology onto `ℚ` with the real
topology is a continuous surjection from a group of rank `0` onto one of rank `ℵ₀`. -/
theorem topologicalGeneratorRank_le_of_surjective (G H : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] [Group H]
    [TopologicalSpace H] [IsTopologicalGroup H] (f : G →* H)
    (hf : Continuous f) (hsurj : Function.Surjective f) :
    TauCeti.topologicalGeneratorRank H ≤ TauCeti.topologicalGeneratorRank G :=
  TauCeti.topologicalGeneratorRank_le_of_surjective f hf hsurj

/-- **Layer 3, the rank of a quotient is at most the rank of the group**: Tau Ceti's
`TauCeti.topologicalGeneratorRank_quotient_le`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (N : Subgroup G) [N.Normal] :
    TauCeti.topologicalGeneratorRank (G ⧸ N) ≤ TauCeti.topologicalGeneratorRank G :=
  TauCeti.topologicalGeneratorRank_quotient_le N

/-- **Layer 3, the rank is invariant under topological isomorphism**: Tau Ceti's
`TauCeti.topologicalGeneratorRank_congr`. -/
example {G H : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [Group H]
    [TopologicalSpace H] [IsTopologicalGroup H] (e : G ≃ₜ* H) :
    TauCeti.topologicalGeneratorRank G = TauCeti.topologicalGeneratorRank H :=
  TauCeti.topologicalGeneratorRank_congr e

/-- **Layer 3, the rank is finite exactly under topological finite generation**: Tau Ceti's
`TauCeti.topologicalGeneratorRank_lt_aleph0_iff`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] :
    TauCeti.topologicalGeneratorRank G < ℵ₀ ↔ TauCeti.IsTopologicallyFinitelyGenerated G :=
  TauCeti.topologicalGeneratorRank_lt_aleph0_iff

/-- **Layer 3, the two rank notions agree.** The natural-number accessor computes the
cardinal rank whenever it is available: Tau Ceti's
`TauCeti.topologicalGeneratorRankNat_eq_topologicalGeneratorRank`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (h : TauCeti.IsTopologicallyFinitelyGenerated G) :
    (TauCeti.topologicalGeneratorRankNat G h : Cardinal.{u}) = TauCeti.topologicalGeneratorRank G :=
  TauCeti.topologicalGeneratorRankNat_eq_topologicalGeneratorRank h

/-- **Layer 3, proof irrelevance of the accessor** in the finite-generation witness: Tau Ceti's
`TauCeti.topologicalGeneratorRankNat` takes a proof argument. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (h h' : TauCeti.IsTopologicallyFinitelyGenerated G) :
    TauCeti.topologicalGeneratorRankNat G h = TauCeti.topologicalGeneratorRankNat G h' :=
  rfl

/-- **Layer 3, example `d(ℤ_p) = 1`**: Tau Ceti's
`TauCeti.topologicalGeneratorRank_multiplicative_padicInt`. -/
example (p : ℕ) [Fact p.Prime] :
    TauCeti.topologicalGeneratorRank (Multiplicative ℤ_[p]) = 1 :=
  TauCeti.topologicalGeneratorRank_multiplicative_padicInt p

/-- **Layer 3, example `d(freeProP p (Fin n)) = n`**, in natural-number form: Tau Ceti's
`TauCeti.topologicalGeneratorRankNat_freeProP`. -/
example (p n : ℕ) [Fact p.Prime]
    (h : TauCeti.IsTopologicallyFinitelyGenerated (TauCeti.freeProP p (Fin n))) :
    TauCeti.topologicalGeneratorRankNat (TauCeti.freeProP p (Fin n)) h = n := by
  rw [TauCeti.topologicalGeneratorRankNat_freeProP, Nat.card_eq_fintype_card, Fintype.card_fin]

/-- **Layer 3, example `d(freeProP p (Fin n)) = n`**, in cardinal form: Tau Ceti's
`TauCeti.topologicalGeneratorRank_freeProP`. -/
example (p n : ℕ) [Fact p.Prime] :
    TauCeti.topologicalGeneratorRank (TauCeti.freeProP p (Fin n)) = n := by
  rw [TauCeti.topologicalGeneratorRank_freeProP, Cardinal.mk_fin]

/-- **Layer 3, example `d(∏_{i ∈ ℕ} ℤ/p) = ℵ₀`**: Tau Ceti's
`TauCeti.topologicalGeneratorRank_nat_pi_multiplicative_zmod`. -/
example (p : ℕ) [Fact p.Prime] :
    TauCeti.topologicalGeneratorRank (ℕ → Multiplicative (ZMod p)) = ℵ₀ :=
  TauCeti.topologicalGeneratorRank_nat_pi_multiplicative_zmod p

/-- **Layer 3, agreement with `Group.rank` on a finite discrete group**: Tau Ceti's
`TauCeti.topologicalGeneratorRankNat_eq_rank`, stated for any discrete finitely generated
group. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [DiscreteTopology G]
    [Finite G] (h : TauCeti.IsTopologicallyFinitelyGenerated G) :
    TauCeti.topologicalGeneratorRankNat G h = Group.rank G :=
  TauCeti.topologicalGeneratorRankNat_eq_rank h

/-- **Layer 3, the rank against the continuous `𝔽_p`-dual.** For pro-`p` `G`,
`d(G) = dim_{𝔽_p} Hom_cont(G, 𝔽_p)` as cardinals: Tau Ceti's
`TauCeti.IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) :
    TauCeti.topologicalGeneratorRank G =
      Module.rank (ZMod p) (Additive (G →ₜ* Multiplicative (ZMod p))) :=
  hG.topologicalGeneratorRank_eq_rank_continuousZModDual

/-- **Layer 3, edge case: the trivial group has rank `0`**, and among profinite groups only the
trivial group does: Tau Ceti's `TauCeti.topologicalGeneratorRank_eq_zero_iff`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] :
    TauCeti.topologicalGeneratorRank G = 0 ↔ Subsingleton G :=
  TauCeti.topologicalGeneratorRank_eq_zero_iff

/-- **Layer 3, edge case: an infinite-rank group, where the accessor is unavailable.**
`∏_{i ∈ ℕ} ℤ/p` is not topologically finitely generated: Tau Ceti's
`TauCeti.isTopologicallyFinitelyGenerated_pi_multiplicative_zmod_iff`. -/
example (p : ℕ) [Fact p.Prime] :
    ¬ TauCeti.IsTopologicallyFinitelyGenerated (ℕ → Multiplicative (ZMod p)) := by
  rw [TauCeti.isTopologicallyFinitelyGenerated_pi_multiplicative_zmod_iff]
  exact not_finite_iff_infinite.mpr inferInstance

end Generation

section OpenSubgroups

/-- **Layer 3, finitely many open subgroups of each index** in a topologically finitely
generated compact group: Tau Ceti's
`TauCeti.IsTopologicallyFinitelyGenerated.finite_openSubgroup_index_eq`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    (hG : TauCeti.IsTopologicallyFinitelyGenerated G) (n : ℕ) :
    Finite {U : OpenSubgroup G // (U : Subgroup G).index = n} :=
  hG.finite_openSubgroup_index_eq n

/-- **Layer 3, countably many open subgroups**: Tau Ceti's
`TauCeti.IsTopologicallyFinitelyGenerated.countable_openSubgroup`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    (hG : TauCeti.IsTopologicallyFinitelyGenerated G) : Countable (OpenSubgroup G) :=
  hG.countable_openSubgroup

/-- **Layer 3, countably many open normal subgroups**: Tau Ceti's
`TauCeti.IsTopologicallyFinitelyGenerated.countable_openNormalSubgroup`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    (hG : TauCeti.IsTopologicallyFinitelyGenerated G) : Countable (OpenNormalSubgroup G) :=
  hG.countable_openNormalSubgroup

/-- **Layer 3, a descending cofinal sequence of open normal subgroups**: Tau Ceti's
`TauCeti.IsTopologicallyFinitelyGenerated.exists_antitone_openNormalSubgroup_cofinal`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    (hG : TauCeti.IsTopologicallyFinitelyGenerated G) :
    ∃ N : ℕ → OpenNormalSubgroup G, Antitone N ∧ ∀ U : OpenNormalSubgroup G, ∃ k, N k ≤ U :=
  hG.exists_antitone_openNormalSubgroup_cofinal

/-- **Layer 3, the sequential form of the compactness lemma.** A topologically finitely
generated profinite group has a descending sequence of open normal subgroups along which every
compatible sequence of cosets comes from a unique element: a bridge combining Tau Ceti's
`TauCeti.IsTopologicallyFinitelyGenerated.exists_antitone_openNormalSubgroup_cofinal`,
`Subgroup.eq_one_of_mem_iInf_openNormalSubgroup` and
`TauCeti.existsUnique_forall_mk_eq_of_iInf_eq_bot`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hG : TauCeti.IsTopologicallyFinitelyGenerated G) :
    ∃ N : ℕ → OpenNormalSubgroup G, Antitone N ∧
      ∀ x : ∀ k, G ⧸ (N k).toSubgroup,
        (∀ (k : ℕ) (g : G), (g : G ⧸ (N (k + 1)).toSubgroup) = x (k + 1) →
          (g : G ⧸ (N k).toSubgroup) = x k) →
        ∃! g : G, ∀ k, (g : G ⧸ (N k).toSubgroup) = x k := by
  obtain ⟨N, hN, hcof⟩ := hG.exists_antitone_openNormalSubgroup_cofinal
  have hbot : ⨅ k, (N k).toSubgroup = ⊥ := by
    refine eq_bot_iff.mpr fun x hx ↦ Subgroup.mem_bot.mpr <|
      Subgroup.eq_one_of_mem_iInf_openNormalSubgroup fun U ↦ ?_
    obtain ⟨k, hk⟩ := hcof U
    exact hk (Subgroup.mem_iInf.mp hx k)
  exact ⟨N, hN, TauCeti.existsUnique_forall_mk_eq_of_iInf_eq_bot
    (fun k ↦ (N k).toOpenSubgroup.isClosed) hbot⟩

/-- **Layer 3, an open subgroup of a topologically finitely generated compact group is
topologically finitely generated**: Tau Ceti's
`TauCeti.IsTopologicallyFinitelyGenerated.of_openSubgroup`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    (hG : TauCeti.IsTopologicallyFinitelyGenerated G) (U : OpenSubgroup G) :
    TauCeti.IsTopologicallyFinitelyGenerated (U : Subgroup G) :=
  hG.of_openSubgroup U

/-- **Layer 3, the Schreier bound** `d(U) ≤ 1 + [G : U](d(G) − 1)` for an open subgroup of a
compact group: Tau Ceti's `TauCeti.topologicalGeneratorRankNat_le_of_openSubgroup`.
⚠ Compactness of `G` is what makes the index finite: in `ℤ³` with the discrete topology,
`ℤ² × 0` is open of infinite index and needs two generators. -/
theorem topologicalGeneratorRankNat_le_of_isOpen (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] (U : Subgroup G) (hU : IsOpen (U : Set G))
    (hG : TauCeti.IsTopologicallyFinitelyGenerated G)
    (hUfg : TauCeti.IsTopologicallyFinitelyGenerated U) :
    TauCeti.topologicalGeneratorRankNat U hUfg
      ≤ 1 + U.index * (TauCeti.topologicalGeneratorRankNat G hG - 1) :=
  TauCeti.topologicalGeneratorRankNat_le_of_openSubgroup hG ⟨U, hU⟩

/-- **Layer 3, finitely generated profinite groups are Hopfian.** A continuous surjective
endomorphism of a topologically finitely generated profinite group is an isomorphism: Tau
Ceti's `TauCeti.IsTopologicallyFinitelyGenerated.bijective_of_surjective`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
    (f : G →* G) (hc : Continuous f) (hs : Function.Surjective f) : Function.Bijective f :=
  TauCeti.IsTopologicallyFinitelyGenerated.bijective_of_surjective hfg hc hs

/-- **Layer 3, the Gaschütz lifting lemma.** Along a continuous surjection of profinite
groups, a topological generating `n`-tuple of the target lifts to a topological generating
`n`-tuple of the source, provided the source is generated by `n` elements: Tau Ceti's
`TauCeti.exists_comp_eq_and_topologicalClosure_closure_range_eq_top`. -/
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

/-- **Layer 3, Gaschütz corollary: generators lift along a Frattini quotient map.** For a
continuous surjection `f` of a pro-`p` group onto a Hausdorff group with kernel in `Φ(G)`, every
set whose image topologically generates the target topologically generates `G`: a bridge from
Tau Ceti's `TauCeti.IsProP.eq_top_of_sup_proPFrattini_eq_top`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsProP p G) {H : Type v} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [T2Space H]
    (f : G →* H) (hf : Continuous f) (hker : f.ker ≤ TauCeti.proPFrattini p G) (s : Set G)
    (hs : (Subgroup.closure (f '' s)).topologicalClosure = ⊤) :
    (Subgroup.closure s).topologicalClosure = ⊤ := by
  set K := (Subgroup.closure s).topologicalClosure
  have hKc : IsClosed (K : Set G) := Subgroup.isClosed_topologicalClosure _
  -- The image of `K` is closed and contains `f '' s`, so it is all of `H`.
  have hfK : ∀ y : H, y ∈ K.map f := by
    have hcl : IsClosed ((K.map f : Subgroup H) : Set H) := by
      rw [Subgroup.coe_map]
      exact (hKc.isCompact.image hf).isClosed
    have hle : Subgroup.closure (f '' s) ≤ K.map f := by
      rw [← MonoidHom.map_closure]
      exact Subgroup.map_mono (Subgroup.le_topologicalClosure _)
    intro y
    have : (Subgroup.closure (f '' s)).topologicalClosure ≤ K.map f :=
      Subgroup.topologicalClosure_minimal _ hle hcl
    exact this (hs ▸ Subgroup.mem_top y)
  refine hG.eq_top_of_sup_proPFrattini_eq_top hKc (top_unique fun x _ ↦ ?_)
  obtain ⟨k, hk, hkx⟩ := Subgroup.mem_map.mp (hfK (f x))
  have hmem : k⁻¹ * x ∈ TauCeti.proPFrattini p G :=
    hker (by rw [MonoidHom.mem_ker, map_mul, map_inv, hkx, inv_mul_cancel])
  simpa using Subgroup.mul_mem_sup hk hmem

end OpenSubgroups

section Frattini

/-- **Layer 3, maximal open subgroups of a pro-`p` group are normal of index `p`**: Tau Ceti's
`TauCeti.IsProP.normal_of_isCoatom` and `TauCeti.IsProP.index_eq_of_isCoatom`. An open subgroup
is maximal among open subgroups exactly when it is a coatom, since every subgroup containing an
open subgroup is open. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] (hG : TauCeti.IsProP p G) {M : Subgroup G} (hMo : IsOpen (M : Set G))
    (hM : IsCoatom M) : M.Normal ∧ M.index = p :=
  ⟨hG.normal_of_isCoatom hMo hM, hG.index_eq_of_isCoatom hMo hM⟩

/-- **Layer 3, `proPFrattini` in the index-`p` form**: the intersection of the open normal
subgroups of index `p`, Tau Ceti's `TauCeti.mem_proPFrattini_iff`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] (x : G) :
    x ∈ TauCeti.proPFrattini p G ↔
      ∀ U : OpenNormalSubgroup G, U.toSubgroup.index = p → x ∈ U.toSubgroup :=
  TauCeti.mem_proPFrattini_iff

/-- **Layer 3, the Frattini subgroup is closed and normal**: Tau Ceti's instances
`TauCeti.isClosed_proPFrattini` and `TauCeti.proPFrattini_normal`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    IsClosed ((TauCeti.proPFrattini p G : Subgroup G) : Set G) ∧
      (TauCeti.proPFrattini p G).Normal :=
  ⟨TauCeti.isClosed_proPFrattini, inferInstance⟩

/-- **Layer 3, the Frattini subgroup is characteristic** for continuous automorphisms, and
transported by topological isomorphisms: Tau Ceti's `ContinuousMulEquiv.map_proPFrattini_eq`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] {H : Type v} [Group H]
    [TopologicalSpace H] (e : G ≃ₜ* H) :
    (TauCeti.proPFrattini p G).map e.toMonoidHom = TauCeti.proPFrattini p H :=
  e.map_proPFrattini_eq

/-- **Layer 3, `Φ(G)` is the intersection of the maximal open subgroups** of a pro-`p` group:
Tau Ceti's `TauCeti.IsProP.proPFrattini_eq_iInf_isCoatom`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] (hG : TauCeti.IsProP p G) :
    TauCeti.proPFrattini p G = ⨅ (M : Subgroup G) (_ : IsOpen (M : Set G)) (_ : IsCoatom M), M :=
  hG.proPFrattini_eq_iInf_isCoatom

/-- **Layer 3, `Φ(G) = closure (Gᵖ[G,G])`**: Tau Ceti's
`TauCeti.proPFrattini_eq_topologicalClosure`, which needs no pro-`p` hypothesis. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] :
    TauCeti.proPFrattini p G
      = (Subgroup.closure (Set.range fun g : G ↦ g ^ p) ⊔ commutator G).topologicalClosure :=
  TauCeti.proPFrattini_eq_topologicalClosure Fact.out

/-- **Layer 3, the Frattini quotient is elementary abelian**: commutative, Tau Ceti's
`TauCeti.isMulCommutative_quotient_proPFrattini`, of exponent dividing `p`, Tau Ceti's
`TauCeti.exponent_quotient_proPFrattini_dvd`. Its `𝔽_p`-vector space structure is the instance
`TauCeti.instModuleQuotientProPFrattini` on `Additive (G ⧸ proPFrattini p G)`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] :
    IsMulCommutative (G ⧸ TauCeti.proPFrattini p G) ∧
      Monoid.exponent (G ⧸ TauCeti.proPFrattini p G) ∣ p :=
  ⟨TauCeti.isMulCommutative_quotient_proPFrattini Fact.out,
    TauCeti.exponent_quotient_proPFrattini_dvd⟩

/-- **Layer 3, example `Φ(ℤ_p) = pℤ_p`**: Tau Ceti's
`TauCeti.proPFrattini_multiplicative_padicInt`. -/
example (p : ℕ) [Fact p.Prime] :
    TauCeti.proPFrattini p (Multiplicative ℤ_[p]) =
      AddSubgroup.toSubgroup (Ideal.span {(p : ℤ_[p])}).toAddSubgroup :=
  TauCeti.proPFrattini_multiplicative_padicInt p

/-- **Layer 3, example: the Frattini quotient of `freeProP p (Fin n)` is `(ℤ/p)^n`**, as
`𝔽_p`-vector spaces, with basis the images of the generators: Tau Ceti's
`TauCeti.freeProP.frattiniQuotientBasis` and `TauCeti.freeProP.frattiniQuotientBasis_apply`. -/
example (p n : ℕ) [Fact p.Prime] :
    ∃ e : Additive (TauCeti.freeProP p (Fin n) ⧸ TauCeti.proPFrattini p
        (TauCeti.freeProP p (Fin n))) ≃ₗ[ZMod p] (Fin n → ZMod p),
      ∀ i, e.symm (Pi.single i 1) =
        Additive.ofMul (QuotientGroup.mk' _ (TauCeti.freeProP.of i)) :=
  ⟨(TauCeti.freeProP.frattiniQuotientBasis p (Fin n)).equivFun, fun i ↦ by
    simp⟩

/-- **Layer 3, example `Φ((ℤ/p)^n) = 1`**: Tau Ceti's
`TauCeti.proPFrattini_pi_multiplicative_zmod_eq_bot`, for any index type. -/
example (p n : ℕ) [Fact p.Prime] :
    TauCeti.proPFrattini p (Fin n → Multiplicative (ZMod p)) = ⊥ :=
  TauCeti.proPFrattini_pi_multiplicative_zmod_eq_bot p (Fin n)

/-- **Layer 3, the map on Frattini quotients as a map of `𝔽_p`-vector spaces**: Tau Ceti's
`TauCeti.frattiniQuotientLinearMap`, with `frattiniQuotientLinearMap_mk`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] {H : Type v} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] (f : G →ₜ* H) (g : G) :
    TauCeti.frattiniQuotientLinearMap (p := p) f (Additive.ofMul (g : G ⧸ _)) =
      Additive.ofMul (f g : H ⧸ TauCeti.proPFrattini p H) :=
  TauCeti.frattiniQuotientLinearMap_mk f g

/-- **Layer 3, a continuous surjection sends `Φ(G)` onto `Φ(H)`**: Tau Ceti's
`TauCeti.map_proPFrattini_eq_of_surjective`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [TotallyDisconnectedSpace H] (f : G →* H) (hf : Continuous f)
    (hs : Function.Surjective f) :
    (TauCeti.proPFrattini p G).map f = TauCeti.proPFrattini p H :=
  TauCeti.map_proPFrattini_eq_of_surjective Fact.out f hf hs

/-- **Layer 3, every continuous endomorphism preserves `Φ(G)`**: Tau Ceti's
`MonoidHom.map_proPFrattini_le_of_prime`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (f : G →* G) (hf : Continuous f) :
    (TauCeti.proPFrattini p G).map f ≤ TauCeti.proPFrattini p G :=
  f.map_proPFrattini_le_of_prime Fact.out hf

/-- **Layer 3, on a finite `p`-group `proPFrattini` is Mathlib's `frattini`**: Tau Ceti's
`IsPGroup.proPFrattini_eq_frattini`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [DiscreteTopology G]
    [Finite G] (hG : IsPGroup p G) : TauCeti.proPFrattini p G = frattini G :=
  hG.proPFrattini_eq_frattini

/-- **Layer 3, the Frattini quotient functor commutes with continuous surjections**: the
induced map is functorial, Tau Ceti's `TauCeti.frattiniQuotientMap_comp`, and surjective,
Tau Ceti's `TauCeti.frattiniQuotientMap_surjective`. -/
example {p : ℕ} (hp : p.Prime) {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] {H : Type v} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H] {K : Type u} [Group K]
    [TopologicalSpace K] [IsTopologicalGroup K] (f : G →ₜ* H) (g : H →ₜ* K)
    (hf : Function.Surjective f) :
    TauCeti.frattiniQuotientMap hp (g.comp f) =
        (TauCeti.frattiniQuotientMap hp g).comp (TauCeti.frattiniQuotientMap hp f) ∧
      Function.Surjective (TauCeti.frattiniQuotientMap hp f) :=
  ⟨TauCeti.frattiniQuotientMap_comp hp g f, TauCeti.frattiniQuotientMap_surjective hp f hf⟩

/-- **Layer 3, edge case: `Φ(G) = G` is impossible for nontrivial pro-`p` `G`**: Tau Ceti's
`TauCeti.IsProP.proPFrattini_ne_top`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] [Nontrivial G] (hG : TauCeti.IsProP p G) :
    TauCeti.proPFrattini p G ≠ ⊤ :=
  hG.proPFrattini_ne_top

end Frattini

section Burnside

/-- **Layer 3, Burnside basis theorem, generation form.** A subset generates a pro-`p` group
topologically iff its image generates the Frattini quotient topologically: Tau Ceti's
`TauCeti.topologicallyGenerates_iff_frattiniQuotient`. The closure on the quotient side is
needed: at infinite rank the images of a generating set span only a dense subspace. -/
theorem topologicallyGenerates_iff_frattiniQuotient (p : ℕ) [Fact p.Prime] (G : Type u)
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) (s : Set G) :
    (Subgroup.closure s).topologicalClosure = ⊤ ↔
      (Subgroup.closure ((QuotientGroup.mk' (TauCeti.proPFrattini p G)) '' s)).topologicalClosure
        = ⊤ :=
  TauCeti.topologicallyGenerates_iff_frattiniQuotient hG s

/-- **Layer 3, Burnside, subgroup form.** A closed subgroup of a pro-`p` group contained in no
open normal subgroup of index `p` is the whole group: Tau Ceti's
`TauCeti.IsProP.eq_top_of_forall_not_le_openNormalSubgroup_index_eq`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsProP p G) {H : Subgroup G} (hH : IsClosed (H : Set G))
    (h : ∀ U : OpenNormalSubgroup G, U.toSubgroup.index = p → ¬ H ≤ U.toSubgroup) :
    H = ⊤ :=
  TauCeti.IsProP.eq_top_of_forall_not_le_openNormalSubgroup_index_eq hG hH h

/-- **Layer 3, Burnside, homomorphism form.** A continuous homomorphism to a pro-`p` group
that is surjective onto every index-`p` quotient is surjective: Tau Ceti's
`TauCeti.IsProP.surjective_iff_surjective_quotient_index_eq`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [CompactSpace G]
    {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H]
    [TotallyDisconnectedSpace H] (hH : TauCeti.IsProP p H) (f : G →* H) (hf : Continuous f) :
    Function.Surjective f ↔ ∀ U : OpenNormalSubgroup H, U.toSubgroup.index = p →
      Function.Surjective ((QuotientGroup.mk' U.toSubgroup).comp f) :=
  TauCeti.IsProP.surjective_iff_surjective_quotient_index_eq hH f hf

/-- **Layer 3, Burnside, the cardinal rank identity.** With no finiteness hypothesis,
`d(G) = dim_{𝔽_p} Hom_cont(G/Φ(G), 𝔽_p)` against the discrete dual: Tau Ceti's
`TauCeti.IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`, transported along
`Hom_cont(G/Φ(G), 𝔽_p) ≃ Hom_cont(G, 𝔽_p)`, Tau Ceti's `TauCeti.frattiniQuotientDualEquiv`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) :
    TauCeti.topologicalGeneratorRank G =
      Module.rank (ZMod p)
        (Additive ((G ⧸ TauCeti.proPFrattini p G) →ₜ* Multiplicative (ZMod p))) :=
  hG.topologicalGeneratorRank_eq_rank_continuousZModDual.trans
    TauCeti.frattiniQuotientDualEquiv.rank_eq.symm

/-- **Layer 3, the dual of the Frattini quotient is the dual of the group**:
`Hom_cont(G/Φ(G), 𝔽_p) ≃ₗ Hom_cont(G, 𝔽_p)` by precomposition with the quotient map, Tau Ceti's
`TauCeti.frattiniQuotientDualEquiv` with `TauCeti.frattiniQuotientDualEquiv_apply`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (x : TauCeti.continuousZModDual p (G ⧸ TauCeti.proPFrattini p G)) (g : G) :
    (TauCeti.frattiniQuotientDualEquiv x).toMul g = x.toMul (g : G ⧸ _) :=
  TauCeti.frattiniQuotientDualEquiv_apply x g

/-- **Layer 3, Burnside, finite generation.** A pro-`p` group is topologically finitely
generated iff its Frattini quotient is finite: Tau Ceti's
`TauCeti.IsProP.isTopologicallyFinitelyGenerated_iff_finite_quotient_proPFrattini`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsProP p G) :
    TauCeti.IsTopologicallyFinitelyGenerated G ↔ Finite (G ⧸ TauCeti.proPFrattini p G) :=
  hG.isTopologicallyFinitelyGenerated_iff_finite_quotient_proPFrattini

/-- **Layer 3, Burnside, the finite rank formula**
`topologicalGeneratorRankNat G h = Module.finrank (ZMod p) (G/Φ(G))`: Tau Ceti's
`TauCeti.IsProP.topologicalGeneratorRankNat_eq_finrank_quotient_proPFrattini`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsProP p G) (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    TauCeti.topologicalGeneratorRankNat G hfg =
      Module.finrank (ZMod p) (Additive (G ⧸ TauCeti.proPFrattini p G)) :=
  hG.topologicalGeneratorRankNat_eq_finrank_quotient_proPFrattini hfg

end Burnside

end Layer3

section Layer4


open CategoryTheory


/-! ## Layer 4: the class `C` as a structure -/

section FiniteGroupClass

/-- **Layer 4, the fields of `FiniteGroupClass`.** A class of finite groups is a membership
predicate on finite groups of one universe that is invariant under isomorphism, contains the
trivial group, and is closed under subgroups, quotients and extensions: the fields of Tau Ceti's
`TauCeti.FiniteGroupClass`. -/
example (C : TauCeti.FiniteGroupClass.{w}) :
    (∀ {H K : Type w} [Group H] [Finite H] [Group K] [Finite K],
      (H ≃* K) → (C.mem H ↔ C.mem K)) ∧
    C.mem PUnit ∧
    (∀ {H : Type w} [Group H] [Finite H], C.mem H → ∀ K : Subgroup H, C.mem K) ∧
    (∀ {H : Type w} [Group H] [Finite H], C.mem H → ∀ (N : Subgroup H) [N.Normal],
      C.mem (H ⧸ N)) ∧
    (∀ {H : Type w} [Group H] [Finite H] (N : Subgroup H) [N.Normal],
      C.mem N → C.mem (H ⧸ N) → C.mem H) :=
  ⟨C.mem_congr, C.mem_trivial, C.mem_subgroup, C.mem_quotient, C.mem_extension⟩

/-- **Layer 4, the `Shrink` resizing policy.** For a group in any universe, membership in the
class means being finite with the `Shrink` of the group in the class: Tau Ceti's
`TauCeti.FiniteGroupClass.MemFinite`, through `MemFinite.finite` and `memFinite_iff_shrink`. -/
example (C : TauCeti.FiniteGroupClass.{w}) (H : Type v) [Group H] :
    (C.MemFinite H → Finite H) ∧
      ∀ _ : Finite H,
        letI : Finite (Shrink.{w} H) := Finite.of_equiv H (equivShrink.{w} H)
        (C.MemFinite H ↔ C.mem (Shrink.{w} H)) :=
  ⟨fun h ↦ h.finite, fun _ ↦ TauCeti.FiniteGroupClass.memFinite_iff_shrink⟩

/-- **Layer 4, comparison lemmas for `FiniteGroupClass`.** Membership is transported along a group
isomorphism between any two universes, and through `Shrink`: Tau Ceti's
`TauCeti.FiniteGroupClass.memFinite_congr` and `TauCeti.FiniteGroupClass.memFinite_shrink`. -/
example (C : TauCeti.FiniteGroupClass.{w}) {H : Type v} {K : Type u} [Group H] [Group K]
    (e : H ≃* K) [Finite H] :
    (C.MemFinite H ↔ C.MemFinite K) ∧ (C.MemFinite (Shrink.{u} H) ↔ C.MemFinite H) :=
  ⟨TauCeti.FiniteGroupClass.memFinite_congr e, TauCeti.FiniteGroupClass.memFinite_shrink⟩

/-- **Layer 4, the derived theorem on finite products.** A class of finite groups is closed under
binary products, Tau Ceti's `TauCeti.FiniteGroupClass.MemFinite.prod` (a consequence of closure
under extensions); the finite-product form below follows by induction on the index type. -/
example (C : TauCeti.FiniteGroupClass.{w}) {H : Type v} {K : Type u} [Group H] [Group K]
    (hH : C.MemFinite H) (hK : C.MemFinite K) : C.MemFinite (H × K) :=
  hH.prod hK

/-- **Layer 4, closure under finite products.** The product of a finite family of members is a
member, by induction from Tau Ceti's binary `TauCeti.FiniteGroupClass.MemFinite.prod`. -/
example (C : TauCeti.FiniteGroupClass.{w}) {ι : Type u} [Finite ι] (H : ι → Type v)
    [∀ i, Group (H i)] (hH : ∀ i, C.MemFinite (H i)) : C.MemFinite (∀ i, H i) := by
  revert H
  refine Finite.induction_empty_option
    (P := fun (ι : Type u) ↦ ∀ (H : ι → Type v) [∀ i, Group (H i)],
      (∀ i, C.MemFinite (H i)) → C.MemFinite (∀ i, H i)) ?_ ?_ ?_ ι
  · intro α β e hα H _ hH
    refine (hα (fun a ↦ H (e a)) fun a ↦ hH (e a)).of_injective
      (MonoidHom.pi fun a ↦ Pi.evalMonoidHom H (e a)) fun x y hxy ↦ funext fun b ↦ ?_
    have h := congrFun hxy (e.symm b)
    simp only [MonoidHom.pi_apply, Pi.evalMonoidHom_apply] at h
    rwa [e.apply_symm_apply] at h
  · intro H _ _
    exact TauCeti.FiniteGroupClass.memFinite_of_subsingleton
  · intro α _ hα H _ hH
    refine ((hH none).prod (hα (fun a ↦ H (some a)) fun a ↦ hH (some a))).of_injective
      ((Pi.evalMonoidHom H none).prod (MonoidHom.pi fun a ↦ Pi.evalMonoidHom H (some a)))
      fun x y hxy ↦ funext fun o ↦ ?_
    cases o with
    | none => exact congrArg Prod.fst hxy
    | some a => exact congrFun (congrArg Prod.snd hxy) a

/-- **Layer 4, constructor: finite `p`-groups.** Membership in `finiteGroupClassP p` is being a
finite `p`-group: Tau Ceti's `TauCeti.finiteGroupClassP_memFinite_iff`. -/
example (p : ℕ) (H : Type v) [Group H] :
    (TauCeti.finiteGroupClassP.{w} p).MemFinite H ↔ Finite H ∧ IsPGroup p H :=
  TauCeti.finiteGroupClassP_memFinite_iff p H

/-- **Layer 4, constructor: all finite groups.** Tau Ceti's `TauCeti.finiteGroupClassAll`, with
`TauCeti.finiteGroupClassAll_memFinite_iff`. -/
example (H : Type v) [Group H] : TauCeti.finiteGroupClassAll.{w}.MemFinite H ↔ Finite H :=
  TauCeti.finiteGroupClassAll_memFinite_iff H

/-- **Layer 4, constructor: finite solvable groups.** Tau Ceti's
`TauCeti.finiteGroupClassSolvable`, with `TauCeti.finiteGroupClassSolvable_memFinite_iff`. -/
example (H : Type v) [Group H] :
    TauCeti.finiteGroupClassSolvable.{w}.MemFinite H ↔ Finite H ∧ Group.IsSolvable H :=
  TauCeti.finiteGroupClassSolvable_memFinite_iff H

/-- **Layer 4, the pro-`C` predicate.** `G` is pro-`C` when every quotient by an open normal
subgroup lies in `C`: Tau Ceti's `TauCeti.isProC_iff`. -/
example (C : TauCeti.FiniteGroupClass.{w}) (G : Type v) [Group G] [TopologicalSpace G] :
    TauCeti.IsProC C G ↔ ∀ U : OpenNormalSubgroup G, C.MemFinite (G ⧸ U.toSubgroup) :=
  TauCeti.isProC_iff

/-- **Layer 4, `proCKernel C G` is the intersection of the defining family.** Membership in Tau
Ceti's `TauCeti.proCKernel`: `TauCeti.mem_proCKernel_iff`. -/
example (C : TauCeti.FiniteGroupClass.{w}) {G : Type v} [Group G] [TopologicalSpace G] (x : G) :
    x ∈ TauCeti.proCKernel C G ↔
      ∀ U : OpenNormalSubgroup G, C.MemFinite (G ⧸ U.toSubgroup) → x ∈ U.toSubgroup :=
  TauCeti.mem_proCKernel_iff

/-- **Layer 4, `proCKernel C G` is closed, normal and characteristic.** Normality is the instance
`TauCeti.proCKernel_normal`, closedness `TauCeti.isClosed_proCKernel`, and invariance under
continuous automorphisms (`TauCeti.IsTopCharacteristic`) follows from
`TauCeti.map_proCKernel_eq`. -/
example (C : TauCeti.FiniteGroupClass.{w}) (G : Type v) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] :
    (TauCeti.proCKernel C G).Normal ∧ IsClosed (TauCeti.proCKernel C G : Set G) ∧
      TauCeti.IsTopCharacteristic G (TauCeti.proCKernel C G) :=
  ⟨TauCeti.proCKernel_normal C G, TauCeti.isClosed_proCKernel,
    TauCeti.isTopCharacteristic_iff_map_eq.mpr fun φ ↦ TauCeti.map_proCKernel_eq φ⟩

/-- **Layer 4, the pro-`C` completion.** `proCCompletion C G` is `G ⧸ proCKernel C G`, and it is
pro-`C` for compact `G`: Tau Ceti's `TauCeti.proCCompletion` and
`TauCeti.isProC_proCCompletion`. -/
example (C : TauCeti.FiniteGroupClass.{w}) (G : Type v) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] :
    TauCeti.proCCompletion C G = (G ⧸ TauCeti.proCKernel C G) ∧
      TauCeti.IsProC C (TauCeti.proCCompletion C G) :=
  ⟨rfl, TauCeti.isProC_proCCompletion⟩

/-- **Layer 4, universal property of the pro-`C` completion.** A continuous homomorphism to a
profinite pro-`C` group factors uniquely and continuously through the quotient map: Tau Ceti's
`TauCeti.existsUnique_continuousMonoidHom_proCCompletion`. -/
example (C : TauCeti.FiniteGroupClass.{w}) {G : Type v} [Group G] [TopologicalSpace G]
    {P : Type u} [Group P] [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P]
    [TotallyDisconnectedSpace P] (hP : TauCeti.IsProC C P) (f : G →* P) (hf : Continuous f) :
    ∃! g : TauCeti.proCCompletion C G →* P,
      Continuous g ∧ ∀ x : G, g (TauCeti.proCCompletion.mk C G x) = f x :=
  TauCeti.existsUnique_continuousMonoidHom_proCCompletion hP f hf

/-- **Layer 4, the instantiation at finite `p`-groups.** Pro-`C` for `finiteGroupClassP p` is
pro-`p`, and the `C`-kernel is the pro-`p` kernel: Tau Ceti's
`TauCeti.isProC_finiteGroupClassP_iff` and
`TauCeti.proCKernel_finiteGroupClassP_eq_proPKernel`. -/
example (p : ℕ) (G : Type v) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] :
    (TauCeti.IsProC (TauCeti.finiteGroupClassP.{v} p) G ↔ TauCeti.IsProP p G) ∧
      TauCeti.proCKernel (TauCeti.finiteGroupClassP.{v} p) G = TauCeti.proPKernel p G :=
  ⟨TauCeti.isProC_finiteGroupClassP_iff, TauCeti.proCKernel_finiteGroupClassP_eq_proPKernel⟩

/-- **Layer 4, example: finite `p`-groups, where `proCCompletion` is `maximalProPQuotient`.**
Tau Ceti's `TauCeti.proCCompletion.equivMaximalProPQuotient`, which sends a class to the class of
the same element. -/
example (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] :
    ∃ e : TauCeti.proCCompletion (TauCeti.finiteGroupClassP.{u} p) G ≃ₜ*
        TauCeti.maximalProPQuotient p G,
      ∀ x : G, e (x : TauCeti.proCCompletion (TauCeti.finiteGroupClassP.{u} p) G) =
        (x : TauCeti.maximalProPQuotient p G) :=
  ⟨TauCeti.proCCompletion.equivMaximalProPQuotient p G,
    TauCeti.proCCompletion.equivMaximalProPQuotient_mk⟩

/-- **Layer 4, functoriality of `proCKernel`.** A continuous homomorphism carries the `C`-kernel
into the `C`-kernel: Tau Ceti's `TauCeti.map_proCKernel_le`. -/
example (C : TauCeti.FiniteGroupClass.{w}) {G : Type v} {H : Type u} [Group G]
    [TopologicalSpace G] [Group H] [TopologicalSpace H] (f : G →* H) (hf : Continuous f) :
    (TauCeti.proCKernel C G).map f ≤ TauCeti.proCKernel C H :=
  TauCeti.map_proCKernel_le f hf

/-- **Layer 4, functoriality of `proCCompletion`.** The induced maps
`TauCeti.proCCompletion.map` are continuous and preserve identities and composition:
`TauCeti.proCCompletion.continuous_map`, `map_id`, `map_comp`. -/
example (C : TauCeti.FiniteGroupClass.{w}) {G H K : Type v} [Group G] [TopologicalSpace G]
    [Group H] [TopologicalSpace H] [Group K] [TopologicalSpace K] (f : G →* H)
    (hf : Continuous f) (g : H →* K) (hg : Continuous g) :
    Continuous (TauCeti.proCCompletion.map (C := C) f hf) ∧
      TauCeti.proCCompletion.map (C := C) (MonoidHom.id G) continuous_id = MonoidHom.id _ ∧
      TauCeti.proCCompletion.map (C := C) (g.comp f) (hg.comp hf) =
        (TauCeti.proCCompletion.map g hg).comp (TauCeti.proCCompletion.map f hf) :=
  ⟨TauCeti.proCCompletion.continuous_map f hf, TauCeti.proCCompletion.map_id,
    TauCeti.proCCompletion.map_comp f hf g hg⟩

/-- **Layer 4, idempotence of `proCCompletion`.** The completion of the completion is the
completion, by the canonical map: Tau Ceti's `TauCeti.proCCompletion.idempotentEquiv` and
`TauCeti.proCKernel_proCCompletion_eq_bot`. -/
example (C : TauCeti.FiniteGroupClass.{w}) (G : Type v) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] :
    TauCeti.proCKernel C (TauCeti.proCCompletion C G) = ⊥ ∧
      ∃ e : TauCeti.proCCompletion C (TauCeti.proCCompletion C G) ≃ₜ*
          TauCeti.proCCompletion C G,
        ∀ x : TauCeti.proCCompletion C G,
          e (x : TauCeti.proCCompletion C (TauCeti.proCCompletion C G)) = x :=
  ⟨TauCeti.proCKernel_proCCompletion_eq_bot, TauCeti.proCCompletion.idempotentEquiv,
    TauCeti.proCCompletion.idempotentEquiv_mk⟩

/-- **Layer 4, naturality of the universal property of `proCCompletion`.** Naturality in the
source and in the target: Tau Ceti's `TauCeti.proCCompletion.lift_comp_map` and
`TauCeti.proCCompletion.comp_lift`. -/
example (C : TauCeti.FiniteGroupClass.{w}) {G G' : Type v} [Group G] [TopologicalSpace G]
    [Group G'] [TopologicalSpace G'] {P Q : Type u} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] [Group Q]
    [TopologicalSpace Q] [IsTopologicalGroup Q] [CompactSpace Q] [TotallyDisconnectedSpace Q]
    (hP : TauCeti.IsProC C P) (hQ : TauCeti.IsProC C Q) (f : G →* P) (hf : Continuous f)
    (k : G' →* G) (hk : Continuous k) (v : P →* Q) (hv : Continuous v) :
    (TauCeti.proCCompletion.lift hP f hf).comp (TauCeti.proCCompletion.map (C := C) k hk) =
        TauCeti.proCCompletion.lift hP (f.comp k) (hf.comp hk) ∧
      v.comp (TauCeti.proCCompletion.lift hP f hf) =
        TauCeti.proCCompletion.lift hQ (v.comp f) (hv.comp hf) :=
  ⟨TauCeti.proCCompletion.lift_comp_map hP f hf k hk,
    TauCeti.proCCompletion.comp_lift hP hQ f hf v hv⟩

/-- **Layer 4, edge case: the class containing only the trivial group.** Its completion is
trivial: Tau Ceti's `TauCeti.finiteGroupClassTrivial`, with
`TauCeti.finiteGroupClassTrivial_memFinite_iff` and
`TauCeti.proCCompletion.subsingleton_finiteGroupClassTrivial`. -/
example (G : Type v) [Group G] [TopologicalSpace G] :
    (∀ (H : Type v) [Group H],
      TauCeti.finiteGroupClassTrivial.{w}.MemFinite H ↔ Subsingleton H) ∧
      Subsingleton (TauCeti.proCCompletion TauCeti.finiteGroupClassTrivial.{v} G) :=
  ⟨fun H _ ↦ TauCeti.finiteGroupClassTrivial_memFinite_iff H,
    TauCeti.proCCompletion.subsingleton_finiteGroupClassTrivial⟩

end FiniteGroupClass

/-! ## Layer 4: construction of the free objects -/

section Construction

/-- **Layer 4, the free profinite group** is the profinite completion of the discrete free
group, Tau Ceti's `TauCeti.freeProfiniteGroup`; its generators are the images of the free
generators under the unit `TauCeti.freeProfiniteGroup.fromFreeGroup`. -/
example (X : Type u) :
    TauCeti.freeProfiniteGroup X =
        ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of (FreeGroup X)) ∧
      ∀ x : X, TauCeti.freeProfiniteGroup.fromFreeGroup X (FreeGroup.of x) =
        TauCeti.freeProfiniteGroup.of x :=
  ⟨rfl, TauCeti.freeProfiniteGroup.fromFreeGroup_of⟩

/-- **Layer 4, the presented profinite group** is the quotient of the free profinite group by the
closed normal closure of the relators: Tau Ceti's `TauCeti.presentedProfiniteGroup`. -/
example (X : Type u) (rels : Set (TauCeti.freeProfiniteGroup X)) :
    TauCeti.presentedProfiniteGroup X rels =
      (TauCeti.freeProfiniteGroup X ⧸ (Subgroup.normalClosure rels).topologicalClosure) :=
  rfl

/-- **Layer 4, the free pro-`C` group** is the pro-`C` completion of the free profinite group:
Tau Ceti's `TauCeti.freeProC`. -/
example (C : TauCeti.FiniteGroupClass.{w}) (X : Type u) :
    TauCeti.freeProC C X = TauCeti.proCCompletion C (TauCeti.freeProfiniteGroup X) :=
  rfl

/-- **Layer 4, the free pro-`p` group** is the maximal pro-`p` quotient of the free profinite
group: Tau Ceti's `TauCeti.freeProP`. -/
example (p : ℕ) (X : Type u) :
    TauCeti.freeProP p X = TauCeti.maximalProPQuotient p (TauCeti.freeProfiniteGroup X) :=
  rfl

/-- **Layer 4, `freeProP` is the free pro-`C` object at `C = ` finite `p`-groups.** The two
constructions agree, so that no statement has to choose between them: Tau Ceti's
`TauCeti.freeProC.equivFreeProP`, which sends generators to generators. -/
example (p : ℕ) [Fact p.Prime] (X : Type u) :
    ∃ e : TauCeti.freeProC (TauCeti.finiteGroupClassP.{u} p) X ≃ₜ* TauCeti.freeProP p X,
      ∀ x : X, e (TauCeti.freeProC.of x) = TauCeti.freeProP.of x :=
  ⟨TauCeti.freeProC.equivFreeProP p X, TauCeti.freeProC.equivFreeProP_of p⟩

end Construction

/-! ## Layer 4: the `freeProP` checklist -/

section FreeProPChecklist

/-- **Layer 4, constructors of `freeProP`.** The generators `TauCeti.freeProP.of` and the lift
`TauCeti.freeProP.lift` of a map into a pro-`p` group, with `TauCeti.freeProP.lift_of`. -/
example (p : ℕ) {X : Type u} {P : Type u} [Group P] [TopologicalSpace P] [IsTopologicalGroup P]
    [CompactSpace P] [TotallyDisconnectedSpace P] (hP : TauCeti.IsProP p P) (f : X → P)
    (x : X) : TauCeti.freeProP.lift hP f (TauCeti.freeProP.of x) = f x :=
  TauCeti.freeProP.lift_of hP f x

/-- **Layer 4, `freeProP p (Fin 0) ≅ 1`.** Tau Ceti's
`TauCeti.freeProP.equivPUnitOfIsEmpty`. -/
example (p : ℕ) : Nonempty (TauCeti.freeProP p (Fin 0) ≃ₜ* PUnit.{1}) :=
  ⟨TauCeti.freeProP.equivPUnitOfIsEmpty p (Fin 0)⟩

/-- **Layer 4, `freeProP p (Fin 1) ≅ ℤ_p`.** Tau Ceti's `TauCeti.freeProP.equivPadicInt`, which
sends the generator to `1`. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ e : TauCeti.freeProP p (Fin 1) ≃ₜ* Multiplicative ℤ_[p],
      e (TauCeti.freeProP.of 0) = Multiplicative.ofAdd 1 :=
  ⟨TauCeti.freeProP.equivPadicInt p (Fin 1), TauCeti.freeProP.equivPadicInt_of p (Fin 1) 0⟩

/-- **Layer 4, `freeProP 2 (Fin 3)`, the source of the relator `A²S⁴(S,Y)`.** Tau Ceti's
`TauCeti.d0Relator`, in Labute's commutator convention: `TauCeti.d0Relator_def`. -/
example :
    TauCeti.d0Relator = TauCeti.freeProP.of 0 ^ 2 * TauCeti.freeProP.of 1 ^ 4 *
      ((TauCeti.freeProP.of 1)⁻¹ * (TauCeti.freeProP.of 2)⁻¹ * TauCeti.freeProP.of 1 *
        TauCeti.freeProP.of 2 : TauCeti.freeProP 2 (Fin 3)) :=
  TauCeti.d0Relator_def

/-- **Layer 4, morphisms out of `freeProP` are exactly maps on generators.** Restriction to the
generators is a bijection onto `X → P` for a pro-`p` target `P`: injective by
`TauCeti.freeProP.hom_ext` and surjective by `TauCeti.freeProP.lift_of`. -/
example (p : ℕ) {X : Type u} {P : Type u} [Group P] [TopologicalSpace P] [IsTopologicalGroup P]
    [CompactSpace P] [TotallyDisconnectedSpace P] (hP : TauCeti.IsProP p P) :
    Function.Bijective
      fun (φ : TauCeti.freeProP p X →ₜ* P) (x : X) ↦ φ (TauCeti.freeProP.of x) :=
  ⟨fun _ _ h ↦ TauCeti.freeProP.hom_ext fun x ↦ congrFun h x,
    fun f ↦ ⟨TauCeti.freeProP.lift hP f, funext (TauCeti.freeProP.lift_of hP f)⟩⟩

/-- **Layer 4, the quotient maps to presented groups.** The continuous projection
`TauCeti.presentedProP.mk` is surjective and kills the relators: `mk_surjective` and
`mk_relator`. -/
example (p : ℕ) {X : Type u} (rels : Set (TauCeti.freeProP p X)) :
    Function.Surjective (TauCeti.presentedProP.mk p rels) ∧
      ∀ r ∈ rels, TauCeti.presentedProP.mk p rels r = 1 :=
  ⟨TauCeti.presentedProP.mk_surjective p rels, TauCeti.presentedProP.mk_relator⟩

/-- **Layer 4, functoriality of `freeProP` in the generators.** `TauCeti.freeProP.map` sends
generators to generators and preserves identities and composition, and a surjection of generating
sets gives a surjection of groups: `map_of`, `map_id`, `map_comp`, `map_surjective`. -/
example (p : ℕ) {X Y Z : Type u} (f : X → Y) (g : Y → Z) (hf : Function.Surjective f) :
    (∀ x, TauCeti.freeProP.map (p := p) f (TauCeti.freeProP.of x) =
        TauCeti.freeProP.of (f x)) ∧
      TauCeti.freeProP.map (p := p) (id : X → X) =
        ContinuousMonoidHom.id (TauCeti.freeProP p X) ∧
      TauCeti.freeProP.map (p := p) (g ∘ f) =
        (TauCeti.freeProP.map g).comp (TauCeti.freeProP.map f) ∧
      Function.Surjective (TauCeti.freeProP.map (p := p) f) :=
  ⟨TauCeti.freeProP.map_of f, TauCeti.freeProP.map_id, TauCeti.freeProP.map_comp f g,
    TauCeti.freeProP.map_surjective hf⟩

/-- **Layer 4, agreement with the pro-`p` completion of the discrete free group.**
`TauCeti.freeProP.fromFreeGroup` has the universal property of the pro-`p` completion of
`FreeGroup X`: every homomorphism from the discrete free group to a pro-`p` group factors
uniquely through it by a continuous homomorphism. Assembled from `TauCeti.freeProP.lift_of`,
`TauCeti.freeProP.hom_ext` and `TauCeti.freeProP.fromFreeGroup_of`. -/
example (p : ℕ) {X : Type u} {P : Type u} [Group P] [TopologicalSpace P] [IsTopologicalGroup P]
    [CompactSpace P] [TotallyDisconnectedSpace P] (hP : TauCeti.IsProP p P)
    (f : FreeGroup X →* P) :
    ∃! φ : TauCeti.freeProP p X →ₜ* P,
      φ.toMonoidHom.comp (TauCeti.freeProP.fromFreeGroup p X) = f := by
  refine ⟨TauCeti.freeProP.lift hP (f ∘ FreeGroup.of), FreeGroup.ext_hom _ _ fun x ↦ ?_,
    fun ψ hψ ↦ TauCeti.freeProP.hom_ext fun x ↦ ?_⟩
  · simp
  · have h := DFunLike.congr_fun hψ (FreeGroup.of x)
    simp only [MonoidHom.coe_comp, Function.comp_apply, TauCeti.freeProP.fromFreeGroup_of]
      at h
    rw [TauCeti.freeProP.lift_of]
    exact h

/-- **Layer 4, `FreeGroup X → freeProP p X` is injective**: free groups are residually `p`.
Tau Ceti's `TauCeti.freeProP.fromFreeGroup_injective`. -/
example (p : ℕ) [Fact p.Prime] (X : Type u) :
    Function.Injective (TauCeti.freeProP.fromFreeGroup p X) :=
  TauCeti.freeProP.fromFreeGroup_injective

/-- **Layer 4, naturality of the universal property of `freeProP`.** In the target,
`TauCeti.freeProP.comp_lift`; in `X`, `TauCeti.freeProP.lift_comp_map`. -/
example (p : ℕ) {X Y : Type u} {P Q : Type u} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] [Group Q]
    [TopologicalSpace Q] [IsTopologicalGroup Q] [CompactSpace Q] [TotallyDisconnectedSpace Q]
    (hP : TauCeti.IsProP p P) (hQ : TauCeti.IsProP p Q) (g : P →ₜ* Q) (f : Y → P)
    (u : X → Y) :
    g.comp (TauCeti.freeProP.lift hP f) = TauCeti.freeProP.lift hQ (⇑g ∘ f) ∧
      (TauCeti.freeProP.lift hP f).comp (TauCeti.freeProP.map u) =
        TauCeti.freeProP.lift hP (f ∘ u) :=
  ⟨TauCeti.freeProP.comp_lift hP hQ g f,
    TauCeti.freeProP.hom_ext fun x ↦ by simp⟩

/-- **Layer 4, edge case: an infinite generating set.** The rank of `freeProP p X` is `p ^ #X`,
strictly larger than `#X`: Tau Ceti's `TauCeti.topologicalGeneratorRank_freeProP_of_infinite`
and `TauCeti.mk_lt_topologicalGeneratorRank_freeProP`. -/
example (p : ℕ) [Fact p.Prime] (X : Type u) [Infinite X] :
    TauCeti.topologicalGeneratorRank (TauCeti.freeProP p X) = (p : Cardinal.{u}) ^ Cardinal.mk X ∧
      Cardinal.mk X < TauCeti.topologicalGeneratorRank (TauCeti.freeProP p X) :=
  ⟨TauCeti.topologicalGeneratorRank_freeProP_of_infinite p,
    TauCeti.mk_lt_topologicalGeneratorRank_freeProP p⟩

end FreeProPChecklist

/-! ## Layer 4: universal properties -/

section UniversalProperty

/-- **Layer 4, universal property of the free profinite group, on morphisms of `ProfiniteGrp`.**
A map `X → G` into a profinite group extends uniquely to a morphism of profinite groups out of
`freeProfiniteGroup X`. This adapts Tau Ceti's `TauCeti.freeProfiniteGroup.existsUnique_lift`,
the same statement for continuous homomorphisms into an unbundled profinite group, to morphisms
of the bundled category, through `ProfiniteGrp.Hom.hom`. -/
theorem freeProfiniteGroup.existsUnique_lift (X : Type u) (G : ProfiniteGrp.{u}) (f : X → G) :
    ∃! φ : TauCeti.freeProfiniteGroup X ⟶ G,
      ∀ x : X, φ (TauCeti.freeProfiniteGroup.of x) = f x := by
  obtain ⟨φ, hφ, huniq⟩ := TauCeti.freeProfiniteGroup.existsUnique_lift f
  exact ⟨ConcreteCategory.ofHom φ, hφ, fun ψ hψ ↦ ProfiniteGrp.hom_ext (huniq ψ.hom hψ)⟩

/-- **Layer 4, universal property of the free pro-`C` group.** A map `X → P` into a profinite
pro-`C` group extends uniquely to a continuous homomorphism: Tau Ceti's
`TauCeti.freeProC.existsUnique_lift`. -/
example (C : TauCeti.FiniteGroupClass.{w}) {X : Type u} {P : Type u} [Group P]
    [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P]
    (hP : TauCeti.IsProC C P) (f : X → P) :
    ∃! g : TauCeti.freeProC C X →ₜ* P, ∀ x : X, g (TauCeti.freeProC.of x) = f x :=
  TauCeti.freeProC.existsUnique_lift hP f

/-- **Layer 4, universal property of the free pro-`p` group**: Tau Ceti's
`TauCeti.freeProP.existsUnique_lift`. -/
example (p : ℕ) {X : Type u} {P : Type u} [Group P] [TopologicalSpace P] [IsTopologicalGroup P]
    [CompactSpace P] [TotallyDisconnectedSpace P] (hP : TauCeti.IsProP p P) (f : X → P) :
    ∃! g : TauCeti.freeProP p X →ₜ* P, ∀ x : X, g (TauCeti.freeProP.of x) = f x :=
  TauCeti.freeProP.existsUnique_lift hP f

/-- **Layer 4, the free profinite group is unique up to unique isomorphism**: Tau Ceti's
`TauCeti.freeProfiniteGroup.existsUnique_continuousMulEquiv`. -/
example {X : Type u} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (ι : X → G)
    (h : ∀ (P : Type u) [Group P] [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P]
      [TotallyDisconnectedSpace P] (f : X → P), ∃! φ : G →ₜ* P, ∀ x : X, φ (ι x) = f x) :
    ∃! e : TauCeti.freeProfiniteGroup X ≃ₜ* G,
      ∀ x : X, e (TauCeti.freeProfiniteGroup.of x) = ι x :=
  TauCeti.freeProfiniteGroup.existsUnique_continuousMulEquiv ι h

/-- **Layer 4, the free pro-`C` group is unique up to unique isomorphism**: Tau Ceti's
`TauCeti.freeProC.existsUnique_continuousMulEquiv`. -/
example (C : TauCeti.FiniteGroupClass.{w}) {X : Type u} {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsProC C G) (ι : X → G)
    (h : ∀ (P : Type u) [Group P] [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P]
      [TotallyDisconnectedSpace P] (_hP : TauCeti.IsProC C P) (f : X → P),
        ∃! φ : G →ₜ* P, ∀ x : X, φ (ι x) = f x) :
    ∃! e : TauCeti.freeProC C X ≃ₜ* G, ∀ x : X, e (TauCeti.freeProC.of x) = ι x :=
  TauCeti.freeProC.existsUnique_continuousMulEquiv hG ι h

/-- **Layer 4, the free pro-`p` group is unique up to unique isomorphism**: Tau Ceti's
`TauCeti.freeProP.existsUnique_continuousMulEquiv`. -/
example (p : ℕ) {X : Type u} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) (ι : X → G)
    (h : ∀ (P : Type u) [Group P] [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P]
      [TotallyDisconnectedSpace P] (_hP : TauCeti.IsProP p P) (f : X → P),
        ∃! φ : G →ₜ* P, ∀ x : X, φ (ι x) = f x) :
    ∃! e : TauCeti.freeProP p X ≃ₜ* G, ∀ x : X, e (TauCeti.freeProP.of x) = ι x :=
  TauCeti.freeProP.existsUnique_continuousMulEquiv hG ι h

/-- **Layer 4, functoriality of the free profinite and free pro-`C` groups in `X`**:
`TauCeti.freeProfiniteGroup.map` and `TauCeti.freeProC.map` with `map_id` and `map_comp`
(the pro-`p` case is in the `freeProP` checklist above). -/
example (C : TauCeti.FiniteGroupClass.{w}) {X Y Z : Type u} (f : X → Y) (g : Y → Z) :
    TauCeti.freeProfiniteGroup.map (id : X → X) =
        ContinuousMonoidHom.id (TauCeti.freeProfiniteGroup X) ∧
      TauCeti.freeProfiniteGroup.map (g ∘ f) =
        (TauCeti.freeProfiniteGroup.map g).comp (TauCeti.freeProfiniteGroup.map f) ∧
      TauCeti.freeProC.map (C := C) (id : X → X) =
        ContinuousMonoidHom.id (TauCeti.freeProC C X) ∧
      TauCeti.freeProC.map (C := C) (g ∘ f) =
        (TauCeti.freeProC.map g).comp (TauCeti.freeProC.map f) :=
  ⟨TauCeti.freeProfiniteGroup.map_id, TauCeti.freeProfiniteGroup.map_comp f g,
    TauCeti.freeProC.map_id, TauCeti.freeProC.map_comp f g⟩

end UniversalProperty

/-! ## Layer 4: basics and rank -/

section Basics

/-- **Layer 4, `freeProP p X` is pro-`p`**: Tau Ceti's `TauCeti.isProP_freeProP`. -/
example (p : ℕ) (X : Type u) : TauCeti.IsProP p (TauCeti.freeProP p X) :=
  TauCeti.isProP_freeProP p X

/-- **Layer 4, topological finite generation of free pro-`p` groups.** The free pro-`p`
group on a finite set is topologically finitely generated, by the images of the free
generators: Tau Ceti's `TauCeti.isTopologicallyFinitelyGenerated_freeProP`. -/
example (p : ℕ) (X : Type u) [Finite X] :
    TauCeti.IsTopologicallyFinitelyGenerated (TauCeti.freeProP p X) :=
  TauCeti.isTopologicallyFinitelyGenerated_freeProP p X

/-- **Layer 4, the Frattini quotient of `freeProP p X` is `(ℤ/p)^X`**: the classes of the
generators form a basis, Tau Ceti's `TauCeti.freeProP.frattiniQuotientBasis`. -/
example (p : ℕ) [Fact p.Prime] (X : Type u) [Finite X] :
    ∃ b : Module.Basis X (ZMod p)
        (Additive (TauCeti.freeProP p X ⧸
          TauCeti.proPFrattini p (TauCeti.freeProP p X))),
      ∀ x : X, b x = Additive.ofMul (QuotientGroup.mk' (TauCeti.proPFrattini p
        (TauCeti.freeProP p X)) (TauCeti.freeProP.of x)) :=
  ⟨TauCeti.freeProP.frattiniQuotientBasis p X, TauCeti.freeProP.frattiniQuotientBasis_apply p X⟩

/-- **Layer 4, the rank of a free pro-`p` group on a finite set** is `#X`: Tau Ceti's
`TauCeti.topologicalGeneratorRank_freeProP`. -/
example (p : ℕ) [Fact p.Prime] (X : Type u) [Finite X] :
    TauCeti.topologicalGeneratorRank (TauCeti.freeProP p X) = Cardinal.mk X :=
  TauCeti.topologicalGeneratorRank_freeProP p

/-- **Layer 4, the natural-number form**
`topologicalGeneratorRankNat (freeProP p (Fin n)) h = n`: Tau Ceti's
`TauCeti.topologicalGeneratorRankNat_freeProP`. -/
example (p : ℕ) [Fact p.Prime] (n : ℕ)
    (h : TauCeti.IsTopologicallyFinitelyGenerated (TauCeti.freeProP p (Fin n))) :
    TauCeti.topologicalGeneratorRankNat (TauCeti.freeProP p (Fin n)) h = n := by
  rw [TauCeti.topologicalGeneratorRankNat_freeProP, Nat.card_eq_fintype_card, Fintype.card_fin]

end Basics

/-! ## Layer 4: rank one and `ℤ_p` -/

section RankOne

/-- **Layer 4, rank one, step 1.** The maximal pro-`p` quotient of `ℤ̂` is the inverse limit of
the `ℤ/p^nℤ`, the class of the generator going to the family of ones: Tau Ceti's
`TauCeti.zHat.maximalProPQuotientEquivZModPowLimit`, with
`maximalProPQuotientEquivZModPowLimit_mk_gen_proj`. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ e : TauCeti.maximalProPQuotient p TauCeti.zHat.{u} ≃ₜ*
        Multiplicative (PadicInt.inverseLimit p),
      ∀ n : ℕ, PadicInt.inverseLimit.proj p n
        (e (TauCeti.zHat.gen : TauCeti.maximalProPQuotient p TauCeti.zHat.{u})).toAdd = 1 :=
  ⟨TauCeti.zHat.maximalProPQuotientEquivZModPowLimit p,
    TauCeti.zHat.maximalProPQuotientEquivZModPowLimit_mk_gen_proj p⟩

/-- **Layer 4, rank one, step 2.** `ℤ_[p]`, with its `toZModPow` system, is the inverse limit of
the `ℤ/p^nℤ` as a topological ring: Tau Ceti's `PadicInt.inverseLimitRingEquiv`, a homeomorphism
by `PadicInt.inverseLimitHomeomorph`; the group form is
`PadicInt.inverseLimitContinuousMulEquiv`. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ e : ℤ_[p] ≃+* PadicInt.inverseLimit p, Continuous e ∧ Continuous e.symm ∧
      ∀ (x : ℤ_[p]) (n : ℕ), (e x).1 n = PadicInt.toZModPow n x :=
  ⟨PadicInt.inverseLimitRingEquiv p, (PadicInt.inverseLimitHomeomorph p).continuous,
    (PadicInt.inverseLimitHomeomorph p).symm.continuous,
    fun x n ↦ by rw [PadicInt.inverseLimitRingEquiv_apply, PadicInt.toInverseLimit_apply]⟩

/-- **Layer 4, the maximal pro-`p` quotient of `ℤ̂` is `ℤ_p`.** Steps 1 and 2 of the
identification chain, and the statement the Layer 2 `ℤ̂`-Sylow example rests on: Tau Ceti's
`TauCeti.zHat.maximalProPQuotientEquivPadicInt`. -/
theorem maximalProPQuotient_zHat_equiv_padicInt (p : ℕ) [Fact p.Prime] :
    Nonempty (TauCeti.maximalProPQuotient p TauCeti.zHat.{u} ≃ₜ* Multiplicative ℤ_[p]) :=
  ⟨TauCeti.zHat.maximalProPQuotientEquivPadicInt p⟩

/-- **Layer 4, rank one, step 3: the rank-one free pro-`p` group is `ℤ_p`.** Both objects
represent the same functor on pro-`p` profinite groups, so the free object's uniqueness gives the
isomorphism, Tau Ceti's `TauCeti.freeProP.equivPadicInt`, which sends the generator to `1`. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ e : TauCeti.freeProP p (Fin 1) ≃ₜ* Multiplicative ℤ_[p],
      e (TauCeti.freeProP.of 0) = Multiplicative.ofAdd 1 :=
  ⟨TauCeti.freeProP.equivPadicInt p (Fin 1), TauCeti.freeProP.equivPadicInt_of p (Fin 1) 0⟩

/-- **Layer 4, rank one, step 4.** A closed subgroup of `ℤ̂` is `p`-Sylow exactly when it maps
bijectively, hence (compact to Hausdorff) homeomorphically, onto the maximal pro-`p` quotient:
Tau Ceti's
`TauCeti.isProPSylow_iff_isClosed_and_bijective_domRestrict_maximalProPQuotient_mk`; with steps 1
and 2 this is `TauCeti.IsProPSylow.continuousMulEquivPadicInt`. -/
example (p : ℕ) [Fact p.Prime] (P : Subgroup TauCeti.zHat.{u})
    (hP : IsClosed (P : Set TauCeti.zHat.{u})) :
    TauCeti.IsProPSylow p P ↔
      Function.Bijective ((TauCeti.maximalProPQuotient.mk p TauCeti.zHat.{u}).domRestrict P) :=
  TauCeti.isProPSylow_iff_isClosed_and_bijective_domRestrict_maximalProPQuotient_mk.trans
    (and_iff_right hP)

/-- **Layer 4, rank one, the Layer 2 instance.** Every `p`-Sylow subgroup of `ℤ̂` is
topologically isomorphic to `ℤ_p`: Tau Ceti's `TauCeti.IsProPSylow.continuousMulEquivPadicInt`. -/
example (p : ℕ) [Fact p.Prime] (P : Subgroup TauCeti.zHat.{u}) (hP : TauCeti.IsProPSylow p P) :
    Nonempty (P ≃ₜ* Multiplicative ℤ_[p]) :=
  ⟨hP.continuousMulEquivPadicInt⟩

end RankOne

/-! ## Layer 4: finitely generated abelian pro-`p` groups -/

section Abelian

/-- **Layer 4, exponentiation by `ℤ_p` in an abelian pro-`p` group.** The continuous action
obtained as the inverse limit of exponentiation in the finite abelian `p`-quotients; it is
what makes an abelian pro-`p` group a topological `ℤ_p`-module. The exponentiation is Tau Ceti's
`TauCeti.IsProP.padicPow`, defined on every pro-`p` group, with `padicPow_one`, `padicPow_add`,
`padicPow_mul`, `padicPow_natCast` and `continuous_padicPow`, and the truncation property
`TauCeti.IsProP.mk_padicPow`. -/
example (p : ℕ) [Fact p.Prime] {A : Type u} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A]
    (hA : TauCeti.IsProP p A) :
    ∃ e : ℤ_[p] → A → A, Continuous (fun x : ℤ_[p] × A ↦ e x.1 x.2) ∧
      (∀ a, e 1 a = a) ∧ (∀ (l m : ℤ_[p]) (a : A), e (l * m) a = e l (e m a)) ∧
      (∀ (l m : ℤ_[p]) (a : A), e (l + m) a = e l a * e m a) ∧
      ∀ (n : ℕ) (a : A), e (n : ℤ_[p]) a = a ^ n :=
  ⟨fun l a ↦ hA.padicPow a l, hA.continuous_padicPow, hA.padicPow_one,
    fun l m a ↦ by rw [mul_comm]; exact hA.padicPow_mul a m l,
    fun l m a ↦ hA.padicPow_add a l m, fun n a ↦ hA.padicPow_natCast a n⟩

/-- **Layer 4, the `ℤ_p`-module structure.** An abelian pro-`p` group is a topological
`ℤ_p`-module, with `l` acting as the `p`-adic power: Tau Ceti's `TauCeti.IsProP.module`, with
`TauCeti.IsProP.module_smul` and `TauCeti.IsProP.continuousSMul_module`. -/
example (p : ℕ) [Fact p.Prime] {A : Type u} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A]
    (hA : TauCeti.IsProP p A) :
    letI := hA.module
    ContinuousSMul ℤ_[p] (Additive A) ∧
      ∀ (l : ℤ_[p]) (x : Additive A), l • x = Additive.ofMul (hA.padicPow x.toMul l) :=
  letI := hA.module
  ⟨hA.continuousSMul_module, hA.module_smul⟩

/-- **Layer 4, continuous homomorphisms are automatically `ℤ_p`-linear.** A continuous group
homomorphism between abelian pro-`p` groups is a continuous `ℤ_p`-linear map of the canonical
modules, so the module structure is functorial: Tau Ceti's
`AddMonoidHom.toPadicIntLinearMap`, or directly `TauCeti.IsProP.map_padicPow`. -/
example (p : ℕ) [Fact p.Prime] {A B : Type u} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A] [CommGroup B]
    [TopologicalSpace B] [IsTopologicalGroup B] [CompactSpace B] [TotallyDisconnectedSpace B]
    (hA : TauCeti.IsProP p A) (hB : TauCeti.IsProP p B) (f : A →* B) (hf : Continuous f) :
    letI := hA.module
    letI := hB.module
    ∃ g : Additive A →L[ℤ_[p]] Additive B, ∀ x : Additive A,
      g x = Additive.ofMul (f x.toMul) :=
  letI := hA.module
  letI := hB.module
  haveI := hA.continuousSMul_module
  haveI := hB.continuousSMul_module
  ⟨(MonoidHom.toAdditive f).toPadicIntLinearMap p hf, fun _ ↦ rfl⟩

/-- **Layer 4, closed subgroups are submodules.** The closed subgroups of an abelian pro-`p`
group are exactly the closed submodules of its canonical module, and the canonical module of a
closed subgroup is that submodule: Tau Ceti's `TauCeti.IsProP.closedSubgroupSubmoduleOrderIso`,
`mem_closedSubgroupSubmoduleOrderIso` and `subgroupContinuousLinearEquivModule`. -/
example (p : ℕ) [Fact p.Prime] {A : Type u} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A]
    (hA : TauCeti.IsProP p A) (H : ClosedSubgroup A) :
    letI := hA.module
    letI : IsClosed (H.toSubgroup : Set A) := H.isClosed'
    letI := (hA.subgroup H.toSubgroup).module
    (∀ x : Additive A, x ∈ hA.closedSubgroupSubmoduleOrderIso H ↔ x.toMul ∈ H) ∧
      Nonempty (Additive H.toSubgroup ≃L[ℤ_[p]]
        (hA.closedSubgroupSubmoduleOrderIso H).toSubmodule) :=
  ⟨hA.mem_closedSubgroupSubmoduleOrderIso H, ⟨hA.subgroupContinuousLinearEquivModule H⟩⟩

/-- **Layer 4, quotients are quotient modules.** The module quotient by the submodule of a
closed subgroup is the canonical module of the group quotient, as topological `ℤ_p`-modules:
Tau Ceti's `TauCeti.IsProP.quotientContinuousLinearEquivModule` with
`quotientContinuousLinearEquivModule_mk`. -/
example (p : ℕ) [Fact p.Prime] {A : Type u} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A]
    (hA : TauCeti.IsProP p A) (H : ClosedSubgroup A) :
    letI := hA.module
    letI : IsClosed (H.toSubgroup : Set A) := H.isClosed'
    letI := (hA.quotient H.toSubgroup).module
    ∃ e : (Additive A ⧸ (hA.closedSubgroupSubmoduleOrderIso H).toSubmodule) ≃L[ℤ_[p]]
        Additive (A ⧸ H.toSubgroup),
      ∀ x : Additive A,
        e (Submodule.Quotient.mk x) = Additive.ofMul (x.toMul : A ⧸ H.toSubgroup) :=
  ⟨hA.quotientContinuousLinearEquivModule H, hA.quotientContinuousLinearEquivModule_mk H⟩

/-- **Layer 4, compact `ℤ_p`-modules.** An abelian pro-`p` group is a compact `ℤ_p`-module; it is
topologically finitely generated exactly when it is a finitely generated `ℤ_p`-module; and a
finite subset generates topologically exactly when it spans: Tau Ceti's
`TauCeti.IsProP.isCompactModule`, `isTopologicallyFinitelyGenerated_iff_module_finite` and
`topologicalClosure_closure_eq_top_iff_span_eq_top`. -/
example (p : ℕ) [Fact p.Prime] {A : Type u} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A]
    (hA : TauCeti.IsProP p A) :
    letI := hA.module
    TauCeti.IsCompactModule ℤ_[p] (Additive A) ∧
      (TauCeti.IsTopologicallyFinitelyGenerated A ↔ Module.Finite ℤ_[p] (Additive A)) ∧
      ∀ s : Set A, s.Finite →
        ((Subgroup.closure s).topologicalClosure = ⊤ ↔
          Submodule.span ℤ_[p] (Additive.toMul ⁻¹' s) = ⊤) :=
  letI := hA.module
  ⟨hA.isCompactModule, hA.isTopologicallyFinitelyGenerated_iff_module_finite,
    fun _ hs ↦ hA.topologicalClosure_closure_eq_top_iff_span_eq_top hs⟩

/-- **Layer 4, the structure theorem for finitely generated abelian pro-`p` groups.**
`A ≅ ℤ_p^r × T` with `T` a finite abelian `p`-group, a product of cyclic groups of order `p ^ e i`
with every `e i` positive: Tau Ceti's
`TauCeti.IsProP.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod`. -/
example (p : ℕ) [Fact p.Prime] {A : Type u} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A]
    (hA : TauCeti.IsProP p A) (hfg : TauCeti.IsTopologicallyFinitelyGenerated A) :
    ∃ (r m : ℕ) (e : Fin m → ℕ), (∀ i, 0 < e i) ∧
      Nonempty (A ≃ₜ*
        Multiplicative ((Fin r → ℤ_[p]) × ((i : Fin m) → ZMod (p ^ e i)))) :=
  hA.exists_continuousMulEquiv_pi_padicInt_prod_pi_zmod hfg

/-- **Layer 4, the structure theorem as topological `ℤ_p`-modules, with `T` the torsion.** The
canonical module is continuously linearly isomorphic to `ℤ_p^r × T` with `T` its torsion
submodule, which is finite and is the torsion subgroup of `A`: Tau Ceti's
`TauCeti.IsProP.exists_continuousLinearEquiv_pi_padicInt_prod_torsion`,
`finite_torsion_module` and `mem_torsion_module_iff`. -/
example (p : ℕ) [Fact p.Prime] {A : Type u} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A]
    (hA : TauCeti.IsProP p A) (hfg : TauCeti.IsTopologicallyFinitelyGenerated A) :
    letI := hA.module
    (∃ r : ℕ, Nonempty
      (Additive A ≃L[ℤ_[p]] (Fin r → ℤ_[p]) × Submodule.torsion ℤ_[p] (Additive A))) ∧
      Finite (Submodule.torsion ℤ_[p] (Additive A)) ∧
      ∀ x : Additive A, x ∈ Submodule.torsion ℤ_[p] (Additive A) ↔ x.toMul ∈ CommGroup.torsion A :=
  letI := hA.module
  ⟨hA.exists_continuousLinearEquiv_pi_padicInt_prod_torsion hfg, hA.finite_torsion_module hfg,
    hA.mem_torsion_module_iff⟩

/-- **Layer 4, uniqueness of `r` and of the elementary divisors.** Two decompositions have the same
free rank and the same exponents up to reindexing: Tau Ceti's
`TauCeti.eq_of_continuousMulEquiv_pi_padicInt_prod` and
`TauCeti.exists_equiv_exponents_of_continuousMulEquiv_pi_padicInt_prod_pi_zmod`. -/
example (p : ℕ) [Fact p.Prime] {A : Type u} [CommGroup A] [TopologicalSpace A] {r r' m m' : ℕ}
    (e : Fin m → ℕ) (e' : Fin m' → ℕ) (he : ∀ i, 0 < e i) (he' : ∀ j, 0 < e' j)
    (f : A ≃ₜ* Multiplicative ((Fin r → ℤ_[p]) × ((i : Fin m) → ZMod (p ^ e i))))
    (f' : A ≃ₜ* Multiplicative ((Fin r' → ℤ_[p]) × ((j : Fin m') → ZMod (p ^ e' j)))) :
    r = r' ∧ ∃ σ : Fin m ≃ Fin m', ∀ i, e i = e' (σ i) := by
  have : NeZero p := ⟨(Fact.out : p.Prime).ne_zero⟩
  exact ⟨TauCeti.eq_of_continuousMulEquiv_pi_padicInt_prod isAddTorsion_of_finite
      isAddTorsion_of_finite f f',
    TauCeti.exists_equiv_exponents_of_continuousMulEquiv_pi_padicInt_prod_pi_zmod e e' he he'
      f f'⟩

/-- **Layer 4, the torsion subgroup is closed, and open when `r = 0`.** Tau Ceti's
`TauCeti.IsProP.isClosed_torsion` and `TauCeti.IsProP.isOpen_torsion_iff_finite`; a
decomposition with `r = 0` makes `A` finite. -/
example (p : ℕ) [Fact p.Prime] {A : Type u} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A]
    (hA : TauCeti.IsProP p A) (hfg : TauCeti.IsTopologicallyFinitelyGenerated A) :
    IsClosed ((CommGroup.torsion A : Subgroup A) : Set A) ∧
      ∀ (m : ℕ) (e : Fin m → ℕ),
        Nonempty (A ≃ₜ* Multiplicative ((Fin 0 → ℤ_[p]) × ((i : Fin m) → ZMod (p ^ e i)))) →
        IsOpen ((CommGroup.torsion A : Subgroup A) : Set A) := by
  refine ⟨hA.isClosed_torsion hfg, fun m e ⟨f⟩ ↦ (hA.isOpen_torsion_iff_finite hfg).mpr ?_⟩
  have : NeZero p := ⟨(Fact.out : p.Prime).ne_zero⟩
  exact Finite.of_equiv _ f.toEquiv.symm

/-- **Layer 4, `ℤ_p` is the free `ℤ_p`-module of rank one**, for the canonical module structure
on the abelian pro-`p` group `Multiplicative ℤ_[p]`: Tau Ceti's
`TauCeti.additiveMultiplicativePadicIntEquiv`, `free_module_multiplicative_padicInt` and
`finrank_module_multiplicative_padicInt`. -/
example (p : ℕ) [Fact p.Prime] :
    letI := (TauCeti.isProP_multiplicative_padicInt p).module
    Nonempty (Additive (Multiplicative ℤ_[p]) ≃L[ℤ_[p]] ℤ_[p]) ∧
      Module.Free ℤ_[p] (Additive (Multiplicative ℤ_[p])) ∧
      Module.finrank ℤ_[p] (Additive (Multiplicative ℤ_[p])) = 1 :=
  letI := (TauCeti.isProP_multiplicative_padicInt p).module
  ⟨⟨TauCeti.additiveMultiplicativePadicIntEquiv p⟩,
    TauCeti.free_module_multiplicative_padicInt p,
    TauCeti.finrank_module_multiplicative_padicInt p⟩

/-- **Layer 4, the two notions of rank agree.** For a topologically finitely generated abelian
pro-`p` group the topological generator rank is the minimal number of module generators, and in
the torsion-free case the free rank: Tau Ceti's
`TauCeti.IsProP.topologicalGeneratorRankNat_eq_spanFinrank` and
`TauCeti.IsProP.topologicalGeneratorRankNat_eq_finrank`. -/
example (p : ℕ) [Fact p.Prime] {A : Type u} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A]
    (hA : TauCeti.IsProP p A) (hfg : TauCeti.IsTopologicallyFinitelyGenerated A) :
    letI := hA.module
    TauCeti.topologicalGeneratorRankNat A hfg =
        (⊤ : Submodule ℤ_[p] (Additive A)).spanFinrank ∧
      (IsMulTorsionFree A →
        TauCeti.topologicalGeneratorRankNat A hfg = Module.finrank ℤ_[p] (Additive A)) :=
  letI := hA.module
  ⟨hA.topologicalGeneratorRankNat_eq_spanFinrank hfg,
    fun _ ↦ hA.topologicalGeneratorRankNat_eq_finrank hfg⟩

end Abelian

end Layer4

section Layer5


open CategoryTheory


/-! ## Layer 5: the coefficient objects, over the imported carrier -/

section Coefficients

/-- **Layer 5, the coefficient object.** `trivialFp p G` is the trivial `𝔽_p`-representation of
`G`, an object of `TopRep (ZMod p) G` whose carrier is `ULift (ZMod p)`, on which every element of
`G` acts trivially: Tau Ceti's `TauCeti.trivialFp`, with `TauCeti.trivialFp_V` and
`TauCeti.trivialFp_ρ_apply_apply`. -/
example (p : ℕ) (G : Type u) [Monoid G] :
    (TauCeti.trivialFp p G).V = ULift.{u} (ZMod p) ∧
      ∀ (g : G) (x : (TauCeti.trivialFp p G).V), (TauCeti.trivialFp p G).ρ g x = x :=
  ⟨TauCeti.trivialFp_V p G, TauCeti.trivialFp_ρ_apply_apply p G⟩

/-- **Layer 5, the identification of the carrier with `ZMod p`**, a `ZMod p`-linear equivalence
`TauCeti.trivialFpEquiv` that undoes the universe lift (`TauCeti.trivialFpEquiv_apply`); the
carrier is discrete and smooth (`TauCeti.isSmoothDiscrete_trivialFp`). -/
example (p : ℕ) (G : Type u) [Monoid G] [TopologicalSpace G] (x : ULift.{u} (ZMod p)) :
    TauCeti.trivialFpEquiv p G x = x.down ∧
      TauCeti.IsSmoothDiscrete (ZMod p) (TauCeti.trivialFp p G) :=
  ⟨TauCeti.trivialFpEquiv_apply p G x, TauCeti.isSmoothDiscrete_trivialFp p G⟩

/-- **Layer 5, `Hⁿ(G, 𝔽_p)`.** `cohomFp p G n` is Mathlib's continuous cohomology of
`trivialFp p G`, and so the value at `trivialFp p G` of the coefficient functor
`TauCeti.ContinuousCohomology.continuousCohomologyFunctor`: Tau Ceti's `TauCeti.cohomFp`. -/
example (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (n : ℕ) :
    TauCeti.cohomFp p G n = continuousCohomology n (TauCeti.trivialFp p G) ∧
      TauCeti.cohomFp p G n =
        (TauCeti.ContinuousCohomology.continuousCohomologyFunctor (ZMod p) G n).obj
          (TauCeti.trivialFp p G) :=
  ⟨rfl, rfl⟩

/-- **Layer 5, the pairing is multiplication** (`fpPairing_bil` of the README). The defining
equation of the multiplication pairing, read through `TauCeti.trivialFpEquiv`: Tau Ceti's
`TauCeti.fpPairing_bil_apply`. -/
example (p : ℕ) (G : Type u) [Monoid G] (a b : (TauCeti.trivialFp p G).V) :
    TauCeti.trivialFpEquiv p G ((TauCeti.fpPairing p G).bil a b) =
      TauCeti.trivialFpEquiv p G a * TauCeti.trivialFpEquiv p G b := by
  rw [TauCeti.fpPairing_bil_apply, LinearEquiv.apply_symm_apply]

/-- **Layer 5, the opposite pairing of `fpPairing` is itself**, because multiplication in `ZMod p`
is commutative: Tau Ceti's `TauCeti.fpPairing_flip`. -/
example (p : ℕ) (G : Type u) [Monoid G] : (TauCeti.fpPairing p G).flip = TauCeti.fpPairing p G :=
  TauCeti.fpPairing_flip p G

/-- **Layer 5, the cup square on `H¹(G, 𝔽_p)`** is the bidegree-`(1, 1)` cup product of the
imported cup at the multiplication pairing: Tau Ceti's `TauCeti.cupFp`, by `TauCeti.cupFp_def`.
On classes of cocycles it is the class of the cochain cup product (`TauCeti.cupFp_π`). -/
example (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (a b : TauCeti.cohomFp p G 1) :
    TauCeti.cupFp p G a b = (TauCeti.fpPairing p G).cup 1 1 a b := by
  rw [TauCeti.cupFp_def]

/-- **Layer 5, graded commutativity of the cup square**, `cupFp a b = - cupFp b a`, the
specialization of `TauCeti.TopPairing.cup_gradedComm` at `fpPairing`: Tau Ceti's
`TauCeti.cupFp_gradedComm`. -/
example (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (a b : TauCeti.cohomFp p G 1) : TauCeti.cupFp p G a b = -TauCeti.cupFp p G b a :=
  TauCeti.cupFp_gradedComm p G a b

/-- **Layer 5, the general graded commutativity the cup square specializes**:
`a ⌣_P b = (-1)^(m n) (b ⌣_{P.flip} a)`, transported from degree `n + m` to `m + n`, Tau Ceti's
`TauCeti.TopPairing.cup_gradedComm` (the README's `cup_gradedComm`). -/
example (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (m n : ℕ)
    (a : TauCeti.cohomFp p G m) (b : TauCeti.cohomFp p G n) :
    (TauCeti.fpPairing p G).cup m n a b =
      (TauCeti.ContinuousCohomology.degreeCast (TauCeti.trivialFp p G) (Nat.add_comm n m)).hom
        ((-1 : ZMod p) ^ (m * n) • (TauCeti.fpPairing p G).flip.cup n m b a) :=
  (TauCeti.fpPairing p G).cup_gradedComm m n a b

/-- **Layer 5, naturality of the cup square**: a continuous homomorphism `φ : H → G` preserves
`cupFp`, Tau Ceti's `TauCeti.cupFp_map`, and so does restriction to a subgroup
(`TauCeti.cupFp_res`). -/
example (p : ℕ) {G H : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [Group H]
    [TopologicalSpace H] [IsTopologicalGroup H] (φ : H →ₜ* G) (a b : TauCeti.cohomFp p G 1) :
    TauCeti.cohomFpMap p φ 2 (TauCeti.cupFp p G a b) =
      TauCeti.cupFp p H (TauCeti.cohomFpMap p φ 1 a) (TauCeti.cohomFpMap p φ 1 b) :=
  TauCeti.cupFp_map p G φ a b

/-- **Layer 5, contravariant functoriality of `Hⁿ(G, 𝔽_p)` in the group**: Tau Ceti's
`TauCeti.cohomFpMap_comp` and `TauCeti.cohomFpMap_id`. -/
example (p : ℕ) {G H K : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [Group H]
    [TopologicalSpace H] [IsTopologicalGroup H] [Group K] [TopologicalSpace K]
    [IsTopologicalGroup K] (φ : H →ₜ* G) (ψ : K →ₜ* H) (n : ℕ) :
    TauCeti.cohomFpMap p (φ.comp ψ) n = TauCeti.cohomFpMap p φ n ≫ TauCeti.cohomFpMap p ψ n :=
  TauCeti.cohomFpMap_comp p φ ψ n

/-- **Layer 5, example: `H¹(G, 𝔽_p) ≅ Hom_cont(G, 𝔽_p)`.** The classes of `H¹(G, 𝔽_p)` are the
continuous characters `G → 𝔽_p`, by a `ZMod p`-linear equivalence that sends the class of the
homogeneous cocycle `(g₀, g₁) ↦ χ (g₀⁻¹ g₁)` of a character `χ` to `χ`: Tau Ceti's
`TauCeti.cohomFpLinearEquivContinuousZModDual`, with
`TauCeti.cohomFpLinearEquivContinuousZModDual_π_characterCocycle`. -/
example (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    ∃ e : TauCeti.cohomFp p G 1 ≃ₗ[ZMod p] TauCeti.continuousZModDual p G,
      ∀ χ : TauCeti.continuousZModDual p G,
        e (_root_.ContinuousCohomology.π (TauCeti.trivialFp p G) 1
          (TauCeti.characterCocycle p χ)) = χ :=
  ⟨TauCeti.cohomFpLinearEquivContinuousZModDual p G,
    TauCeti.cohomFpLinearEquivContinuousZModDual_π_characterCocycle p⟩

/-- **Layer 5, example: `H²(ℤ/2, 𝔽₂)` is one-dimensional, generated by the class of the extension
`ℤ/4`.** The class `TauCeti.zmodFourExtensionClass` of the profinite extension
`1 → ℤ/2 → ℤ/4 → ℤ/2 → 1` (`TauCeti.zmodFourExtensionClass_def`) is nonzero
(`TauCeti.zmodFourExtensionClass_ne_zero`), and `H²(ℤ/2, 𝔽₂)` has dimension `1`
(`TauCeti.finrank_cohomFp_two_multiplicative_zmod`), so it spans. -/
example :
    Module.finrank (ZMod 2) (TauCeti.cohomFp 2 (Multiplicative (ZMod 2)) 2) = 1 ∧
      Submodule.span (ZMod 2) {TauCeti.zmodFourExtensionClass} = ⊤ := by
  have : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩
  have h := TauCeti.finrank_cohomFp_two_multiplicative_zmod 2
  exact ⟨h, (finrank_eq_one_iff_of_nonzero _ TauCeti.zmodFourExtensionClass_ne_zero).mp h⟩

/-- **Layer 5, example: `H²(F, 𝔽_p) = 0` for `F` free pro-`p`**, on any basis, finite or not.
Tau Ceti's `TauCeti.freeProP.subsingleton_H2_zmod`, on the explicit model, read on `cohomFp` through
`TauCeti.cohomFpAddEquivH2`. -/
example (p : ℕ) [Fact p.Prime] (X : Type u) :
    Subsingleton (TauCeti.cohomFp p (TauCeti.freeProP p X) 2) := by
  let _ := TauCeti.trivialZModAction p (TauCeti.freeProP p X)
  have : ContinuousSMul (TauCeti.freeProP p X) (ZMod p) := ⟨continuous_snd⟩
  have := TauCeti.freeProP.subsingleton_H2_zmod (p := p) (X := X)
  exact (TauCeti.cohomFpAddEquivH2 p (TauCeti.freeProP p X) fun _ _ ↦ rfl).toEquiv.subsingleton

/-- **Layer 5, edge case: the trivial group.** For a group with at most one element, `Hⁿ` vanishes
for `n ≥ 1`, for every coefficient representation: Tau Ceti's
`TauCeti.ContinuousCohomology.subsingleton_continuousCohomology_succ_of_subsingleton`. -/
example (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [Subsingleton G] (n : ℕ) : Subsingleton (TauCeti.cohomFp p G (n + 1)) :=
  TauCeti.ContinuousCohomology.subsingleton_continuousCohomology_succ_of_subsingleton _ n

end Coefficients

/-! ## Layer 5: presentations -/

section Presentations

/-- **Layer 5, presented pro-`p` groups.** `presentedProP p X rels` is the free pro-`p` group
modulo the closed normal closure of the relators: the canonical map from `freeProP p X` is
surjective and kills exactly that closed normal closure. Tau Ceti's `TauCeti.presentedProP`, with
`TauCeti.presentedProP.mk_surjective` and `TauCeti.presentedProP.mk_eq_one_iff`. -/
example (p : ℕ) (X : Type u) (rels : Set (TauCeti.freeProP p X)) :
    Function.Surjective (TauCeti.presentedProP.mk p rels) ∧
      ∀ r : TauCeti.freeProP p X, TauCeti.presentedProP.mk p rels r = 1 ↔
        r ∈ (Subgroup.normalClosure rels).topologicalClosure :=
  ⟨TauCeti.presentedProP.mk_surjective p rels, TauCeti.presentedProP.mk_eq_one_iff⟩

/-- **Layer 5, comparison: agreement with `freeProP p X ⧸ R`**, `R` the closed normal closure of
the relators. `TauCeti.presentedProP` is an abbreviation of that quotient. ⚠ The closure is
topological: the algebraic normal closure of the relators need not be closed. -/
example (p : ℕ) (X : Type u) (rels : Set (TauCeti.freeProP p X)) :
    TauCeti.presentedProP p X rels =
      (TauCeti.freeProP p X ⧸ (Subgroup.normalClosure rels).topologicalClosure) :=
  rfl

/-- **Layer 5, every topologically finitely generated pro-`p` group has a presentation by a free
pro-`p` group of finite rank**, on any finite type with at least `d(G)` elements: Tau Ceti's
`TauCeti.IsProP.exists_continuousMulEquiv_presentedProP`, from the surjection
`TauCeti.IsProP.exists_surjective_freeProP`. -/
example (p : ℕ) {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G)
    (h : TauCeti.IsTopologicallyFinitelyGenerated G) (X : Type u) [Finite X]
    (hX : TauCeti.topologicalGeneratorRankNat G h ≤ Nat.card X) :
    ∃ rels : Set (TauCeti.freeProP p X), Nonempty (TauCeti.presentedProP p X rels ≃ₜ* G) :=
  hG.exists_continuousMulEquiv_presentedProP h X hX

/-- **Layer 5, minimal presentations.** A topologically finitely generated pro-`p` group has a
presentation on `d(G)` generators whose relators lie in the Frattini subgroup `Φ(F)` of the free
pro-`p` group (`TauCeti.IsProP.exists_subset_proPFrattini_continuousMulEquiv_presentedProP`). -/
example (p : ℕ) [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G)
    (h : TauCeti.IsTopologicallyFinitelyGenerated G) (X : Type u) [Finite X]
    (hX : Nat.card X = TauCeti.topologicalGeneratorRankNat G h) :
    ∃ rels ⊆ (TauCeti.proPFrattini p (TauCeti.freeProP p X) : Set (TauCeti.freeProP p X)),
      Nonempty (TauCeti.presentedProP p X rels ≃ₜ* G) :=
  hG.exists_subset_proPFrattini_continuousMulEquiv_presentedProP h X hX

/-- **Layer 5, minimality is `R ≤ Φ(F)`.** A presentation `G ≅ ⟨X ∣ rels⟩` on a finite type `X`
has `#X = d(G)` exactly when the relators lie in the Frattini subgroup of the free pro-`p` group:
Tau Ceti's `TauCeti.presentedProP.subset_proPFrattini_iff_card_eq`. Since `#X = d(F)` for the free
pro-`p` group `F` on `X`, this is the README's `d(F) = d(G)`. -/
example (p : ℕ) [Fact p.Prime] {X : Type u} [Finite X] (rels : Set (TauCeti.freeProP p X))
    {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (e : TauCeti.presentedProP p X rels ≃ₜ* G) (h : TauCeti.IsTopologicallyFinitelyGenerated G) :
    rels ⊆ (TauCeti.proPFrattini p (TauCeti.freeProP p X) : Set (TauCeti.freeProP p X)) ↔
      Nat.card X = TauCeti.topologicalGeneratorRankNat G h :=
  TauCeti.presentedProP.subset_proPFrattini_iff_card_eq rels e h

/-- **Layer 5, the universal property.** A continuous homomorphism out of the free pro-`p` group
into a `T₁` group that kills the relators factors uniquely through the presented group: Tau Ceti's
`TauCeti.presentedProP.lift`, `TauCeti.presentedProP.lift_mk` and
`TauCeti.presentedProP.existsUnique_lift`. -/
example (p : ℕ) {X : Type u} {rels : Set (TauCeti.freeProP p X)} {P : Type v} [Group P]
    [TopologicalSpace P] [T1Space P] (ψ : TauCeti.freeProP p X →ₜ* P) (hψ : ∀ r ∈ rels, ψ r = 1) :
    ∃! φ : TauCeti.presentedProP p X rels →ₜ* P, φ.comp (TauCeti.presentedProP.mk p rels) = ψ :=
  TauCeti.presentedProP.existsUnique_lift ψ hψ

/-- **Layer 5, morphisms out of a presented group are determined by the generators**: Tau Ceti's
`TauCeti.presentedProP.hom_ext_of`. -/
example (p : ℕ) {X : Type u} {rels : Set (TauCeti.freeProP p X)} {P : Type v} [Group P]
    [TopologicalSpace P] [T2Space P] {φ ψ : TauCeti.presentedProP p X rels →ₜ* P}
    (h : ∀ x : X, φ (TauCeti.presentedProP.of p rels x) = ψ (TauCeti.presentedProP.of p rels x)) :
    φ = ψ :=
  TauCeti.presentedProP.hom_ext_of h

/-- **Layer 5, naturality of the universal property in the target**: Tau Ceti's
`TauCeti.presentedProP.comp_lift`. -/
example (p : ℕ) {X : Type u} {rels : Set (TauCeti.freeProP p X)} {P : Type v} [Group P]
    [TopologicalSpace P] [T1Space P] {Q : Type w} [Group Q] [TopologicalSpace Q] [T1Space Q]
    (g : P →ₜ* Q) (ψ : TauCeti.freeProP p X →ₜ* P) (hψ : ∀ r ∈ rels, ψ r = 1) :
    g.comp (TauCeti.presentedProP.lift ψ hψ) =
      TauCeti.presentedProP.lift (g.comp ψ) (fun r hr ↦ by simp [hψ r hr]) :=
  TauCeti.presentedProP.comp_lift g ψ hψ

/-- **Layer 5, functoriality: a map of presentations induces a continuous homomorphism**, the
map on generator sets sending relators into the relation subgroup of the target: Tau Ceti's
`TauCeti.presentedProP.map`, with `TauCeti.presentedProP.map_mk`, `TauCeti.presentedProP.map_id`
and `TauCeti.presentedProP.map_comp`. -/
example (p : ℕ) {X : Type u} {Y : Type v} {rels : Set (TauCeti.freeProP p X)}
    {rels' : Set (TauCeti.freeProP p Y)} (φ : TauCeti.freeProP p X →ₜ* TauCeti.freeProP p Y)
    (hφ : ∀ r ∈ rels, TauCeti.presentedProP.mk p rels' (φ r) = 1) (x : TauCeti.freeProP p X) :
    TauCeti.presentedProP.map φ hφ (TauCeti.presentedProP.mk p rels x) =
      TauCeti.presentedProP.mk p rels' (φ x) :=
  TauCeti.presentedProP.map_mk φ hφ x

/-- **Layer 5, example: `presentedProP p X ∅ ≅ freeProP p X`**, by a continuous isomorphism that
is the identity on classes: Tau Ceti's `TauCeti.presentedProP.equivFreeProP`, with
`TauCeti.presentedProP.equivFreeProP_mk`. -/
example (p : ℕ) (X : Type u) :
    ∃ e : TauCeti.presentedProP p X (∅ : Set (TauCeti.freeProP p X)) ≃ₜ* TauCeti.freeProP p X,
      ∀ x, e (TauCeti.presentedProP.mk p ∅ x) = x :=
  ⟨TauCeti.presentedProP.equivFreeProP, TauCeti.presentedProP.equivFreeProP_mk⟩

/-- **Layer 5, edge case: relators whose closed normal closure is everything** present the trivial
group. A bridge from `TauCeti.presentedProP.mk_eq_one_iff` and
`TauCeti.presentedProP.mk_surjective`. -/
example (p : ℕ) (X : Type u) (rels : Set (TauCeti.freeProP p X))
    (h : (Subgroup.normalClosure rels).topologicalClosure = ⊤) :
    Subsingleton (TauCeti.presentedProP p X rels) := by
  refine subsingleton_of_forall_eq 1 fun y ↦ ?_
  obtain ⟨x, rfl⟩ := TauCeti.presentedProP.mk_surjective p rels y
  rw [TauCeti.presentedProP.mk_eq_one_iff, h]
  exact Subgroup.mem_top x

/-- **Layer 5, comparison: the profinite presentation maps onto the pro-`p` one.** The presented
profinite group on `X` maps onto the pro-`p` group presented by the images of its relators in the
free pro-`p` group: Tau Ceti's `TauCeti.presentedProfiniteGroup.toPresentedProP_surjective`. -/
example (p : ℕ) (X : Type u) (rels : Set (TauCeti.freeProfiniteGroup X)) :
    Function.Surjective (TauCeti.presentedProfiniteGroup.toPresentedProP p rels) :=
  TauCeti.presentedProfiniteGroup.toPresentedProP_surjective p rels

/-- **Layer 5, example: `D₀` at `p = 2`** is the presented pro-`2` group
`⟨A, S, Y ∣ A²S⁴(S, Y)⟩`: Tau Ceti's `TauCeti.demushkinD0` and `TauCeti.d0Relator`. -/
example : TauCeti.demushkinD0 = TauCeti.presentedProP 2 (Fin 3) {TauCeti.d0Relator} ∧
    TauCeti.d0Relator = TauCeti.freeProP.of 0 ^ 2 * TauCeti.freeProP.of 1 ^ 4 *
      ((TauCeti.freeProP.of 1)⁻¹ * (TauCeti.freeProP.of 2)⁻¹ * TauCeti.freeProP.of 1 *
        TauCeti.freeProP.of 2) :=
  ⟨rfl, rfl⟩

end Presentations

/-! ### Non-vacuity of the presentation machinery, with the map named -/

section D0

/-- **Layer 5, the map that proves `D₀` is nontrivial.** Not "map onto some finite `2`-group":
the map is the one sending `A ↦ 0`, `S ↦` the generator of `ℤ/2`, `Y ↦ 0`, Tau Ceti's
`TauCeti.d0FreeCharacter`. The relator `A²S⁴(S, Y)` maps to `0`
(`TauCeti.d0FreeCharacter_d0Relator`),
so it factors through `D₀`, and the map is surjective because `S` already hits the generator
(`TauCeti.d0FreeCharacter_surjective`). -/
example : ∃ φ : TauCeti.freeProP 2 (Fin 3) →* Multiplicative (ZMod 2),
    Continuous φ ∧ φ (TauCeti.freeProP.of 0) = 1 ∧
      φ (TauCeti.freeProP.of 1) = Multiplicative.ofAdd 1 ∧ φ (TauCeti.freeProP.of 2) = 1 ∧
      φ TauCeti.d0Relator = 1 ∧ Function.Surjective φ :=
  ⟨TauCeti.d0FreeCharacter.toMonoidHom, TauCeti.d0FreeCharacter.continuous,
    TauCeti.d0FreeCharacter_of 0, TauCeti.d0FreeCharacter_of 1, TauCeti.d0FreeCharacter_of 2,
    TauCeti.d0FreeCharacter_d0Relator, TauCeti.d0FreeCharacter_surjective⟩

/-- **Layer 5, the induced surjection `D₀ ↠ ℤ/2`**, Tau Ceti's `TauCeti.d0Character`, which is
`TauCeti.d0FreeCharacter` on classes (`TauCeti.d0Character_comp_mk`). -/
example : ∃ f : TauCeti.demushkinD0 →* Multiplicative (ZMod 2),
    Continuous f ∧ Function.Surjective f :=
  ⟨TauCeti.d0Character.toMonoidHom, TauCeti.d0Character.continuous,
    TauCeti.d0Character_surjective⟩

/-- **Layer 5, non-vacuity of the presentation machinery.** `D₀` is nontrivial, a corollary of the
surjection above: Tau Ceti's `Nontrivial` instance on `TauCeti.demushkinD0`. -/
example : Nontrivial TauCeti.demushkinD0 :=
  inferInstance

/-- **Layer 5, presented groups are pro-`p`.** `D₀` is pro-`2`
(`TauCeti.presentedProP.isProP`) and topologically finitely generated
(`TauCeti.presentedProP.isTopologicallyFinitelyGenerated`). -/
example : TauCeti.IsProP 2 TauCeti.demushkinD0 ∧
    TauCeti.IsTopologicallyFinitelyGenerated TauCeti.demushkinD0 :=
  ⟨TauCeti.presentedProP.isProP 2 (Fin 3) {TauCeti.d0Relator},
    TauCeti.presentedProP.isTopologicallyFinitelyGenerated⟩

/-- **Layer 5, the marked generators generate.** `A`, `S` and `Y` topologically generate `D₀`,
which is what makes a continuous character determined by its values on them: Tau Ceti's
`TauCeti.d0_topologicallyGenerates`. -/
theorem d0_topologicallyGenerates :
    (Subgroup.closure ({TauCeti.d0A, TauCeti.d0S, TauCeti.d0Y} :
      Set TauCeti.demushkinD0)).topologicalClosure = ⊤ :=
  TauCeti.d0_topologicallyGenerates

end D0

/-! ## Layer 5: continuous extensions

The dictionary is Tau Ceti's, and it is stated for a **compact** kernel, of which the README's
finite discrete `p`-primary kernel is a special case: `TauCeti.ProfiniteGroupExtension G M` is an
extension `1 → M → E → G → 1` with profinite total group, continuous inclusion and projection,
inducing the given action. Its class lies in the explicit continuous `H²(G, M)` of the Profinite
Cohomology roadmap, `TauCeti.ContCohomology.H2 G (Additive M)`. -/

section Extensions

/-- **Layer 5, the extension object.** For a profinite extension `X` of `G` by a compact `M`: the
total group is profinite; `M → E` is injective onto the kernel of `E → G`, which is a **closed**
normal subgroup (`TauCeti.GroupExtension.isClosed_ker_rightHom`); `E → G` is a continuous
surjection; and conjugation of `E` on `M` is the given action (`X.inducesAction`). The kernel is
not asked to be open. -/
example {G : Type u} {M : Type v} [Group G] [TopologicalSpace G] [CommGroup M]
    [TopologicalSpace M] [MulDistribMulAction G M] [CompactSpace M]
    (X : TauCeti.ProfiniteGroupExtension G M) :
    CompactSpace X.E ∧ TotallyDisconnectedSpace X.E ∧
      Function.Injective X.toGroupExtension.inl ∧
      X.toGroupExtension.inl.range = X.toGroupExtension.rightHom.ker ∧
      IsClosed (X.toGroupExtension.rightHom.ker : Set X.E) ∧
      Continuous X.toGroupExtension.inl ∧ Continuous X.toGroupExtension.rightHom ∧
      Function.Surjective X.toGroupExtension.rightHom ∧
      ∀ (e : X.E) (m : M),
        X.toGroupExtension.conjAct e m = X.toGroupExtension.rightHom e • m :=
  ⟨inferInstance, inferInstance, X.toGroupExtension.inl_injective,
    X.toGroupExtension.range_inl_eq_ker_rightHom,
    TauCeti.GroupExtension.isClosed_ker_rightHom X.continuous_inl, X.continuous_inl,
    X.continuous_rightHom, X.toGroupExtension.rightHom_surjective, X.inducesAction⟩

/-- **Layer 5, every morphism of extensions is an isomorphism.** A continuous homomorphism of
profinite extensions that fixes `M` and covers the identity of `G` is a multiplicative
equivalence and a homeomorphism: Tau Ceti's `TauCeti.GroupExtension.continuousMulEquivOfMonoidHom`.
-/
example {G : Type u} {M : Type v} [Group G] [TopologicalSpace G] [CommGroup M]
    [TopologicalSpace M] [MulDistribMulAction G M] (X Y : TauCeti.ProfiniteGroupExtension G M)
    (f : X.E →* Y.E) (hf : Continuous f)
    (hinl : f.comp X.toGroupExtension.inl = Y.toGroupExtension.inl)
    (hright : Y.toGroupExtension.rightHom.comp f = X.toGroupExtension.rightHom) :
    ∃ e : X.E ≃ₜ* Y.E, ∀ x, e x = f x :=
  ⟨TauCeti.GroupExtension.continuousMulEquivOfMonoidHom f hf hinl hright,
    TauCeti.GroupExtension.continuousMulEquivOfMonoidHom_apply f hf hinl hright⟩

/-- **Layer 5, a continuous section along a finite kernel.** The lemma the cocycle side of the
extension dictionary runs on, in the case the README uses: `N` finite, `E ⧸ N` possibly infinite.
It is the finite case of Tau Ceti's `TauCeti.exists_continuous_section`, which gives a continuous
normalized section along any closed subgroup of a profinite group; a finite subgroup is closed.
⚠ The corresponding statement for an arbitrary surjection of profinite *spaces* is false. -/
example {E : Type u} [Group E] [TopologicalSpace E] [IsTopologicalGroup E] [CompactSpace E]
    [TotallyDisconnectedSpace E] (N : Subgroup E) [N.Normal] (hN : Finite N) :
    ∃ s : E ⧸ N → E, Continuous s ∧ (∀ x, (QuotientGroup.mk (s x) : E ⧸ N) = x) ∧ s 1 = 1 := by
  have := hN
  exact TauCeti.exists_continuous_section N (Set.toFinite (N : Set E)).isClosed

section Dictionary

variable {G : Type u} {M : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G] [CommGroup M] [TopologicalSpace M]
  [IsTopologicalGroup M] [MulDistribMulAction G M] [ContinuousSMul G M] [CompactSpace M]
  [TotallyDisconnectedSpace M]

/-- **Layer 5, from a cocycle to an extension.** A continuous normalized `2`-cocycle `α` (a
continuous `TauCeti.FactorSet`) builds the twisted product on `M × G`, which is a profinite
extension (`TauCeti.ProfiniteGroupExtension.ofFactorSet`) whose topology is the product topology
(`TauCeti.FactorSet.Extension.homeomorphProd`) and whose class is the class of `α`
(`TauCeti.ProfiniteGroupExtension.contCohomologyClass_ofFactorSet`). -/
example (α : TauCeti.FactorSet G M) (hα : Continuous ⇑α) :
    Nonempty ((TauCeti.ProfiniteGroupExtension.ofFactorSet α hα).E ≃ₜ M × G) ∧
      (TauCeti.ProfiniteGroupExtension.ofFactorSet α hα).contCohomologyClass =
        α.contCohomologyClass hα :=
  ⟨⟨TauCeti.FactorSet.Extension.homeomorphProd α⟩,
    TauCeti.ProfiniteGroupExtension.contCohomologyClass_ofFactorSet α hα⟩

/-- **Layer 5, from an extension to a cocycle, and back.** A continuous normalized section `σ` of
a profinite extension has a continuous factor set (`TauCeti.GroupExtension.continuous_factorSet`),
and the extension is the twisted product of that factor set by a multiplicative equivalence that
is a homeomorphism (`TauCeti.GroupExtension.factorSetContinuousMulEquiv`); conversely the factor
set read off the twisted product of `α` through its canonical section is `α`
(`TauCeti.GroupExtension.factorSet_canonicalSection`). -/
example (X : TauCeti.ProfiniteGroupExtension G M) (σ : X.toGroupExtension.Section)
    (hσc : Continuous ⇑σ) (hσ : σ 1 = 1) (α : TauCeti.FactorSet G M) :
    Continuous ⇑(TauCeti.GroupExtension.factorSet σ hσ X.inducesAction) ∧
      Nonempty ((TauCeti.GroupExtension.factorSet σ hσ X.inducesAction).Extension ≃ₜ* X.E) ∧
      TauCeti.GroupExtension.factorSet α.canonicalSection α.canonicalSection_one
        (TauCeti.GroupExtension.inducesAction_groupExtension α) = α :=
  ⟨TauCeti.GroupExtension.continuous_factorSet
      (X.continuous_inl.isClosedEmbedding X.toGroupExtension.inl_injective).isEmbedding hσc hσ
      X.inducesAction,
    ⟨TauCeti.GroupExtension.factorSetContinuousMulEquiv X.continuous_inl hσc hσ X.inducesAction⟩,
    TauCeti.GroupExtension.factorSet_canonicalSection α⟩

/-- **Layer 5, the bijection.** The class descends to a bijection from profinite extensions of `G`
by `M` modulo continuous equivalence onto `H²(G, M)`: Tau Ceti's
`TauCeti.ProfiniteGroupExtension.contCohomologyClassEquiv`, where two extensions are related
exactly when a continuous equivalence of extensions exists
(`TauCeti.ProfiniteGroupExtension.continuousEquivSetoid_apply`). -/
example : ∃ e : Quotient (TauCeti.ProfiniteGroupExtension.continuousEquivSetoid G M) ≃
      TauCeti.ContCohomology.H2 G (Additive M),
    (∀ X, e (Quotient.mk _ X) = X.contCohomologyClass) ∧
      ∀ X Y : TauCeti.ProfiniteGroupExtension G M,
        TauCeti.ProfiniteGroupExtension.continuousEquivSetoid G M X Y ↔
          ∃ e : X.toGroupExtension.Equiv Y.toGroupExtension, Continuous ⇑e :=
  ⟨TauCeti.ProfiniteGroupExtension.contCohomologyClassEquiv G M,
    TauCeti.ProfiniteGroupExtension.contCohomologyClassEquiv_apply_mk,
    TauCeti.ProfiniteGroupExtension.continuousEquivSetoid_apply⟩

/-- **Layer 5, the bijection on Mathlib's carrier.** For a finite discrete kernel in the universe of
`G`, the classification composed with Tau Ceti's comparison
`TauCeti.ContCohomology.explicitH2AddEquivContinuousCohomology` of the explicit `H²` with Mathlib's
`continuousCohomology 2` is a bijection onto the carrier the README names. -/
example {G M : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] [CommGroup M] [TopologicalSpace M] [DiscreteTopology M]
    [Finite M] [MulDistribMulAction G M] [ContinuousSMul G M] :
    Nonempty (Quotient (TauCeti.ProfiniteGroupExtension.continuousEquivSetoid G M) ≃
      continuousCohomology 2 (TauCeti.ofDiscreteModule ℤ G (Additive M))) :=
  ⟨(TauCeti.ProfiniteGroupExtension.contCohomologyClassEquiv G M).trans
    (TauCeti.ContCohomology.explicitH2AddEquivContinuousCohomology G (Additive M)).toEquiv⟩

/-- **Layer 5, the trivial class is the semidirect product.** The twisted product of the trivial
factor set is `M ⋊ G` (`TauCeti.FactorSet.trivialMulEquiv`) and has class `0`
(`TauCeti.FactorSet.contCohomologyClass_trivial`). -/
example :
    Nonempty ((TauCeti.FactorSet.trivial G M).Extension ≃*
        M ⋊[MulDistribMulAction.toMulAut G M] G) ∧
      (TauCeti.ProfiniteGroupExtension.ofFactorSet (TauCeti.FactorSet.trivial G M)
        TauCeti.FactorSet.continuous_trivial).contCohomologyClass = 0 := by
  refine ⟨⟨TauCeti.FactorSet.trivialMulEquiv G M⟩, ?_⟩
  rw [TauCeti.ProfiniteGroupExtension.contCohomologyClass_ofFactorSet,
    TauCeti.FactorSet.contCohomologyClass_trivial]

/-- **Layer 5, the bijection is natural in `M`**: it commutes with pushforward along a continuous
equivariant `f : M → N` and the coefficient map of `f` on `H²`. Tau Ceti's
`TauCeti.ProfiniteGroupExtension.contCohomologyClassEquiv_map`. -/
example {N : Type w} [CommGroup N] [TopologicalSpace N] [IsTopologicalGroup N]
    [MulDistribMulAction G N] [ContinuousSMul G N] [CompactSpace N] [TotallyDisconnectedSpace N]
    (f : M →*[G] N) (hf : Continuous f)
    (q : Quotient (TauCeti.ProfiniteGroupExtension.continuousEquivSetoid G M)) :
    TauCeti.ProfiniteGroupExtension.contCohomologyClassEquiv G N
        (Quotient.map' (TauCeti.ProfiniteGroupExtension.map f hf)
          (fun _ _ ↦ TauCeti.ProfiniteGroupExtension.continuousEquivSetoid_map f hf) q) =
      TauCeti.ContCohomology.explicitCoeff2 G (Additive M) f.toAdditive
        (f.continuous_toAdditive hf)
        (TauCeti.ProfiniteGroupExtension.contCohomologyClassEquiv G M q) :=
  TauCeti.ProfiniteGroupExtension.contCohomologyClassEquiv_map f hf q

/-- **Layer 5, splitting.** A profinite extension has a continuous homomorphic section exactly
when its class in `H²(G, M)` is zero: Tau Ceti's
`GroupExtension.exists_splitting_continuous_iff_contCohomologyClass_eq_zero`. -/
example (X : TauCeti.ProfiniteGroupExtension G M) :
    (∃ s : X.toGroupExtension.Splitting, Continuous ⇑s) ↔ X.contCohomologyClass = 0 :=
  X.toGroupExtension.exists_splitting_continuous_iff_contCohomologyClass_eq_zero X.continuous_inl
    X.continuous_rightHom X.inducesAction

end Dictionary

end Extensions

/-! ### Layer 5: lifting a coefficient map along the extension class -/

section ExtensionLifting

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]
  {M : Type v} [CommGroup M] [TopologicalSpace M] [IsTopologicalGroup M]
  [MulDistribMulAction G M] [ContinuousSMul G M] [CompactSpace M]
  {N : Type w} [CommGroup N] [TopologicalSpace N] [IsTopologicalGroup N]
  [MulDistribMulAction G N] [ContinuousSMul G N] [CompactSpace N] [TotallyDisconnectedSpace N]

-- The old signature carries `[IsTopologicalGroup M] [ContinuousSMul G M]`, which the Tau Ceti
-- statement does not need; they are kept so that the signature is unchanged.
set_option linter.unusedSectionVars false in
/-- **Layer 5, lifting along the class** (NSW I §5 Exercise 4(i) at `ϕ = id`). A continuous
equivariant `f : M → N` that carries the class of `X` to the class of `Y` is the restriction to
the kernels of a continuous homomorphism `X.E → Y.E` over the identity of `G`: Tau Ceti's
`TauCeti.ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq`. -/
theorem ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq
    (f : M →*[G] N) (hf : Continuous f) (X : TauCeti.ProfiniteGroupExtension G M)
    (Y : TauCeti.ProfiniteGroupExtension G N)
    (h : (X.map f hf).contCohomologyClass = Y.contCohomologyClass) :
    ∃ φ : X.E →* Y.E, Continuous φ ∧
      φ.comp X.toGroupExtension.inl = Y.toGroupExtension.inl.comp (f : M →* N) ∧
      Y.toGroupExtension.rightHom.comp φ = X.toGroupExtension.rightHom :=
  TauCeti.ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq
    f hf X Y h

-- The old signature carries `[IsTopologicalGroup M] [ContinuousSMul G M]`, which the Tau Ceti
-- statement does not need; they are kept so that the signature is unchanged.
set_option linter.unusedSectionVars false in
/-- **Layer 5, the converse of the lifting lemma.** A continuous homomorphism `X.E → Y.E` over the
identity of `G` that restricts to `f` on the kernels forces `f` to carry the class of `X` to the
class of `Y`: Tau Ceti's
`TauCeti.ProfiniteGroupExtension.contCohomologyClass_map_eq_of_continuous_monoidHom`. -/
theorem ProfiniteGroupExtension.contCohomologyClass_map_eq_of_continuous_monoidHom
    (f : M →*[G] N) (hf : Continuous f) (X : TauCeti.ProfiniteGroupExtension G M)
    (Y : TauCeti.ProfiniteGroupExtension G N) (φ : X.E →* Y.E) (hφ : Continuous φ)
    (hinl : φ.comp X.toGroupExtension.inl = Y.toGroupExtension.inl.comp (f : M →* N))
    (hright : Y.toGroupExtension.rightHom.comp φ = X.toGroupExtension.rightHom) :
    (X.map f hf).contCohomologyClass = Y.contCohomologyClass :=
  TauCeti.ProfiniteGroupExtension.contCohomologyClass_map_eq_of_continuous_monoidHom
    f hf X Y φ hφ hinl hright

end ExtensionLifting

/-- **Layer 5, a morphism of extensions is surjective when it is on the kernels.** A homomorphism
over the identity of `G` whose restriction to the kernels is surjective meets every fibre of the
projection, and within a fibre every translate of the kernel: Tau Ceti's
`GroupExtension.surjective_of_comp_inl_eq` (in `TauCeti/GroupTheory/GroupExtension/Basic.lean`). -/
theorem GroupExtension.surjective_of_comp_inl_eq {G M N E E' : Type*} [Group G] [Group M]
    [Group N] [Group E] [Group E'] (S : _root_.GroupExtension M E G)
    (S' : _root_.GroupExtension N E' G) (f : M →* N) (hf : Function.Surjective f) (φ : E →* E')
    (hinl : φ.comp S.inl = S'.inl.comp f) (hright : S'.rightHom.comp φ = S.rightHom) :
    Function.Surjective φ :=
  _root_.GroupExtension.surjective_of_comp_inl_eq f hf φ hinl hright

/-! ### Layer 5: finite embedding problems and projectivity, consumed from Tau Ceti -/

section EmbeddingProblems

/-- **Layer 5.1, the finite embedding problem.** A solution of a finite embedding problem
`(π : G ↠ Q, α : E ↠ Q)` is a homomorphism `β : G → E` with open kernel and `α ∘ β = π`; continuity
into a finite discrete group is written as openness of the kernel. Tau Ceti's
`TauCeti.FiniteEmbeddingProblem` with `TauCeti.FiniteEmbeddingProblem.isSolution_iff`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (P : TauCeti.FiniteEmbeddingProblem.{u, v, w} G) (β : G →* P.E) :
    P.IsSolution β ↔ IsOpen (β.ker : Set G) ∧ P.α.comp β = P.π :=
  TauCeti.FiniteEmbeddingProblem.isSolution_iff

/-- **Layer 5.1, the problem cut out by a surjection.** A surjection `φ : E ↠ F` of finite groups
and `β : G → F` with open kernel give the problem whose solutions are the lifts of `β` through
`φ`: Tau Ceti's `TauCeti.FiniteEmbeddingProblem.ofSurjective` with
`TauCeti.FiniteEmbeddingProblem.isSolution_ofSurjective_iff`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] {E : Type w}
    {F : Type v} [Group E] [Finite E] [Group F] (φ : E →* F) (hφ : Function.Surjective φ)
    (β : G →* F) (hβ : IsOpen (β.ker : Set G)) (β' : G →* Subgroup.comap φ β.range) :
    (TauCeti.FiniteEmbeddingProblem.ofSurjective φ hφ β hβ).IsSolution β' ↔
      IsOpen (β'.ker : Set G) ∧ φ.comp ((Subgroup.comap φ β.range).subtype.comp β') = β :=
  TauCeti.FiniteEmbeddingProblem.isSolution_ofSurjective_iff

/-- **Layer 5.2, the predicate `HasElementaryAbelianSolutions p G`**: every finite embedding
problem whose kernel is commutative and killed by `p` has a solution. Tau Ceti's
`TauCeti.HasElementaryAbelianSolutions`, by `TauCeti.hasElementaryAbelianSolutions_iff`. -/
example (p : ℕ) {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    TauCeti.HasElementaryAbelianSolutions p G ↔
      ∀ P : TauCeti.FiniteEmbeddingProblem.{u, u, u} G, (∀ x ∈ P.α.ker, x ^ p = 1) →
        (∀ x ∈ P.α.ker, ∀ y ∈ P.α.ker, x * y = y * x) → ∃ β : G →* P.E, P.IsSolution β :=
  TauCeti.hasElementaryAbelianSolutions_iff

/-- **Layer 5.2, the obstruction.** For a profinite `G` and a problem with commutative kernel, the
class `TauCeti.FiniteEmbeddingProblem.obstruction` of the pullback extension vanishes exactly when
the problem is solvable: Tau Ceti's
`TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero`. The obstruction lives in
Mathlib's continuous cohomology, which needs the kernel, hence `E`, in the universe of `G`. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (P : TauCeti.FiniteEmbeddingProblem.{u, v, u} G)
    [TopologicalSpace P.E] [DiscreteTopology P.E] [TopologicalSpace P.Q] [DiscreteTopology P.Q]
    (hcomm : ∀ x ∈ P.α.ker, ∀ y ∈ P.α.ker, x * y = y * x) :
    (∃ β, P.IsSolution β) ↔ P.obstruction hcomm = 0 :=
  P.exists_isSolution_iff_obstruction_eq_zero hcomm

/-- **Layer 5.2, solvability with elementary abelian kernel from `H²`.** If `H²(G, M) = 0` for every
finite discrete `G`-module `M` killed by `p`, every finite embedding problem for `G` with
commutative kernel killed by `p` has a solution: Tau Ceti's
`TauCeti.hasElementaryAbelianSolutions_of_subsingleton_continuousCohomology_two`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G]
    (h : ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M] [Finite M]
      [DistribMulAction G M] [ContinuousSMul G M], (∀ m : M, p • m = 0) →
        Subsingleton (continuousCohomology 2 (TauCeti.ofDiscreteModule ℤ G M))) :
    TauCeti.HasElementaryAbelianSolutions p G :=
  TauCeti.hasElementaryAbelianSolutions_of_subsingleton_continuousCohomology_two h

open scoped commutatorElement in
/-- **Layer 5.3, the lower `p`-central reduction.** A finite normal `p`-subgroup `N = ker α` of `E`
is filtered by `λ_0(N) = N`, `λ_{k+1}(N) = λ_k(N)^p [λ_k(N), N]`, which reaches `1` in finitely
many steps, with each term normal in `E` and elementary abelian factors: Tau Ceti's
`Subgroup.exists_pLowerCentral_filtration_of_isPGroup`. -/
example {p : ℕ} [Fact p.Prime] {E : Type u} [Group E] (N : Subgroup E) [N.Normal] [Finite N]
    (hN : IsPGroup p N) :
    ∃ (m : ℕ) (lam : ℕ → Subgroup E), lam 0 = N ∧ lam m = ⊥ ∧
      (∀ k, lam (k + 1) ≤ lam k) ∧ (∀ k, (lam k).Normal) ∧
      (∀ k, ∀ x ∈ lam k, x ^ p ∈ lam (k + 1)) ∧
      ∀ k, ∀ x ∈ lam k, ∀ y ∈ N, ⁅x, y⁆ ∈ lam (k + 1) :=
  Subgroup.exists_pLowerCentral_filtration_of_isPGroup N hN

/-- **Layer 5.4, the predicate `HasPGroupSolutions p G`**: every finite embedding problem with
`p`-group kernel has a solution (`TauCeti.hasPGroupSolutions_iff`). -/
example (p : ℕ) {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    TauCeti.HasPGroupSolutions p G ↔
      ∀ P : TauCeti.FiniteEmbeddingProblem.{u, u, u} G, IsPGroup p P.α.ker →
        ∃ β : G →* P.E, P.IsSolution β :=
  TauCeti.hasPGroupSolutions_iff

/-- **Layer 5.4, the induction.** Solvability for elementary abelian kernels gives solvability for
`p`-group kernels, one step of the filtration at a time: Tau Ceti's
`TauCeti.HasElementaryAbelianSolutions.hasPGroupSolutions`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (h : TauCeti.HasElementaryAbelianSolutions p G) : TauCeti.HasPGroupSolutions p G :=
  TauCeti.HasElementaryAbelianSolutions.hasPGroupSolutions h

/-- **Layer 5.5, the level problems and their compatible solutions.** For a continuous surjection
`α : A ↠ B` from a profinite pro-`p` group onto a Hausdorff group, a continuous `f : G → B` and an
open normal `U ≤ A`, the solutions of `TauCeti.levelProblem α hα f U` are the level solutions
(`TauCeti.levelSolutionEquiv`). Under `HasPGroupSolutions p G` every level is solvable
(`TauCeti.nonempty_isSolution_levelProblem`), the transition maps are surjective
(`TauCeti.levelSolutionMap_surjective`), and there is a compatible family of level solutions
(`TauCeti.HasPGroupSolutions.exists_compatible_levelSolutions`). -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    {A : Type v} [Group A] [TopologicalSpace A] [IsTopologicalGroup A] [CompactSpace A]
    {B : Type w} [Group B] [TopologicalSpace B] [IsTopologicalGroup B] [T2Space B]
    (hG : TauCeti.HasPGroupSolutions p G) (hA : TauCeti.IsProP p A) (α : A →ₜ* B)
    (hα : Function.Surjective α) (f : G →ₜ* B) :
    (∀ U, Nonempty ({β : G →* (TauCeti.levelProblem α hα f U).E //
      (TauCeti.levelProblem α hα f U).IsSolution β} ≃ TauCeti.LevelSolution α hα f U)) ∧
    (∀ U, Nonempty {β : G →* (TauCeti.levelProblem α hα f U).E //
      (TauCeti.levelProblem α hα f U).IsSolution β}) ∧
    (∀ ⦃V U : OpenNormalSubgroup A⦄ (hVU : V ≤ U),
      Function.Surjective (TauCeti.levelSolutionMap α hα f hVU)) ∧
      ∃ β : ∀ U, TauCeti.LevelSolution α hα f U,
        ∀ ⦃V U : OpenNormalSubgroup A⦄ (hVU : V ≤ U),
          TauCeti.levelSolutionMap α hα f hVU (β V) = β U :=
  ⟨fun U ↦ ⟨TauCeti.levelSolutionEquiv α hα f U⟩,
    TauCeti.nonempty_isSolution_levelProblem hG hA α hα f,
    fun _ _ hVU ↦ TauCeti.levelSolutionMap_surjective hG hA α hα f hVU,
    TauCeti.HasPGroupSolutions.exists_compatible_levelSolutions hG hA α hα f⟩

/-- **Layer 5.5, the level solution sets are finite for topologically finitely generated `G`**:
Tau Ceti's `TauCeti.IsTopologicallyFinitelyGenerated.finite_levelSolution`. They need not be
finite in general, and the compactness argument does not use finiteness. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    {A : Type v} [Group A] [TopologicalSpace A] [IsTopologicalGroup A] [CompactSpace A]
    {B : Type w} [Group B] [TopologicalSpace B] [IsTopologicalGroup B] [T2Space B]
    (hG : TauCeti.IsTopologicallyFinitelyGenerated G) (α : A →ₜ* B)
    (hα : Function.Surjective α) (f : G →ₜ* B) (U : OpenNormalSubgroup A) :
    Finite (TauCeti.LevelSolution α hα f U) :=
  hG.finite_levelSolution α hα f U

/-- **Layer 5.6, the predicate `IsProjective p G`**: every continuous homomorphism into a quotient
of a profinite pro-`p` group lifts continuously. Tau Ceti's `TauCeti.IsProjective`, whose
definition is this statement. -/
example (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] :
    TauCeti.IsProjective.{u, v, w} p G ↔
      ∀ (A : Type v) [Group A] [TopologicalSpace A] [IsTopologicalGroup A]
        [CompactSpace A] [TotallyDisconnectedSpace A]
        (B : Type w) [Group B] [TopologicalSpace B] [IsTopologicalGroup B] [T2Space B],
        TauCeti.IsProP p A → ∀ (α : A →ₜ* B), Function.Surjective α →
          ∀ f : G →ₜ* B, ∃ φ : G →ₜ* A, α.comp φ = f :=
  Iff.rfl

/-- **Layer 5.6, inverse-limit lifting.** A compatible family of level solutions assembles into a
continuous lift: Tau Ceti's `TauCeti.exists_continuous_lift_of_compatible_levelSolutions`. -/
example {G : Type u} [Group G] [TopologicalSpace G]
    {A : Type v} [Group A] [TopologicalSpace A] [IsTopologicalGroup A] [CompactSpace A]
    [TotallyDisconnectedSpace A]
    {B : Type w} [Group B] [TopologicalSpace B] [IsTopologicalGroup B] [T2Space B]
    (α : A →ₜ* B) (hα : Function.Surjective α) (f : G →ₜ* B)
    (β : ∀ U, TauCeti.LevelSolution α hα f U)
    (hβ : ∀ ⦃V U : OpenNormalSubgroup A⦄ (hVU : V ≤ U),
      TauCeti.levelSolutionMap α hα f hVU (β V) = β U) :
    ∃ φ : G →ₜ* A, α.comp φ = f :=
  let ⟨φ, hφ, _⟩ := TauCeti.exists_continuous_lift_of_compatible_levelSolutions α hα f β hβ
  ⟨φ, hφ⟩

/-- **Layer 5.6, projectivity.** Solving every finite embedding problem with `p`-group kernel
makes `G` projective, with no finite-generation hypothesis: Tau Ceti's
`TauCeti.isProjective_of_hasPGroupSolutions`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (hG : TauCeti.HasPGroupSolutions p G) : TauCeti.IsProjective.{u, v, w} p G :=
  TauCeti.isProjective_of_hasPGroupSolutions hG

/-- **Layer 5.7, the converse, for pro-`p` groups.** A projective pro-`p` group solves every finite
embedding problem with `p`-group kernel: Tau Ceti's `TauCeti.hasPGroupSolutions_of_isProjective`,
which needs neither primality of `p` nor profiniteness of `G`, and allows arbitrary universes in
the projectivity hypothesis. ⚠ The pro-`p` hypothesis is needed: `PSL₂(𝔽₅)` is projective at
`p = 2` but `SL₂(𝔽₅) ↠ PSL₂(𝔽₅)` has no solution. -/
theorem hasPGroupSolutions_of_isProjective {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hGp : TauCeti.IsProP p G) (hG : TauCeti.IsProjective.{u, u, u} p G) :
    TauCeti.HasPGroupSolutions p G :=
  TauCeti.hasPGroupSolutions_of_isProjective hGp hG

/-- **Layer 5.7, the equivalence with topological projectivity**, for pro-`p` groups: Tau Ceti's
`TauCeti.isProjective_iff_hasPGroupSolutions`. -/
theorem isProjective_iff_hasPGroupSolutions {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hGp : TauCeti.IsProP p G) :
    TauCeti.IsProjective.{u, u, u} p G ↔ TauCeti.HasPGroupSolutions p G :=
  TauCeti.isProjective_iff_hasPGroupSolutions hGp

/-- **Layer 5, `H²` of a free pro-`p` group vanishes.** For `F` free pro-`p` (on any basis) and `M`
finite discrete `p`-primary, `H²(F, M) = 0` in Mathlib's continuous cohomology: Tau Ceti's
`TauCeti.freeProP.subsingleton_continuousCohomology_two`; the same lifting argument read as 5.4 is
`TauCeti.hasPGroupSolutions_freeProP`. -/
example {p : ℕ} {X M : Type u} [CommGroup M] [TopologicalSpace M] [DiscreteTopology M] [Finite M]
    [MulDistribMulAction (TauCeti.freeProP p X) M] [ContinuousSMul (TauCeti.freeProP p X) M]
    (hM : IsPGroup p M) :
    Subsingleton (continuousCohomology 2
      (TauCeti.ofDiscreteModule ℤ (TauCeti.freeProP p X) (Additive M))) ∧
      TauCeti.HasPGroupSolutions p (TauCeti.freeProP p X) :=
  ⟨TauCeti.freeProP.subsingleton_continuousCohomology_two hM,
    TauCeti.hasPGroupSolutions_freeProP p X⟩

end EmbeddingProblems

/-! ## Layer 5: the rank interpretations -/

section Ranks

attribute [local instance 2000] Ring.toAddCommGroup

/-- **Layer 5, the `H¹` interpretation.** For a topologically finitely generated profinite pro-`p`
group, `dim_{𝔽_p} H¹(G, 𝔽_p) = d(G)` (`TauCeti.IsProP.finrank_cohomFp_one`), and
`H¹(G, 𝔽_p)` is the continuous `𝔽_p`-dual of the Frattini quotient `G ⧸ Φ(G)`
(`TauCeti.cohomFpEquivFrattiniQuotientDual`). The cardinal form with no finiteness hypothesis is
`TauCeti.IsProP.rank_cohomFp_one`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G)
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    Module.finrank (ZMod p) (TauCeti.cohomFp p G 1) = TauCeti.topologicalGeneratorRankNat G hfg ∧
      Module.rank (ZMod p) (TauCeti.cohomFp p G 1) = TauCeti.topologicalGeneratorRank G ∧
      Nonempty (TauCeti.cohomFp p G 1 ≃ₗ[ZMod p]
        TauCeti.continuousZModDual p (G ⧸ TauCeti.proPFrattini p G)) :=
  ⟨hG.finrank_cohomFp_one hfg, hG.rank_cohomFp_one, ⟨TauCeti.cohomFpEquivFrattiniQuotientDual⟩⟩

/-- **Layer 5, the `H²` interpretation: transgression.** For `R` a closed normal subgroup of a free
pro-`p` group `F` contained in its Frattini subgroup, as in a minimal presentation, transgression
`H¹(R, 𝔽_p)^F → H²(F ⧸ R, 𝔽_p)` is bijective, because `H²(F, 𝔽_p) = 0`
(`TauCeti.freeProP.subsingleton_H2_zmod`): Tau Ceti's
`TauCeti.transgression_bijective_of_le_proPFrattini`. -/
example {p : ℕ} [Fact p.Prime] {X : Type u}
    [DistribMulAction (TauCeti.freeProP p X) (ZMod p)]
    [ContinuousSMul (TauCeti.freeProP p X) (ZMod p)]
    (htriv : ∀ (g : TauCeti.freeProP p X) (m : ZMod p), g • m = m)
    (R : Subgroup (TauCeti.freeProP p X)) [R.Normal]
    (hRc : IsClosed (R : Set (TauCeti.freeProP p X)))
    (hR : R ≤ TauCeti.proPFrattini p (TauCeti.freeProP p X)) :
    Function.Bijective
      (TauCeti.ContCohomology.transgression (TauCeti.freeProP p X) (ZMod p) R hRc) :=
  have := TauCeti.freeProP.subsingleton_H2_zmod (p := p) (X := X)
  TauCeti.transgression_bijective_of_le_proPFrattini hRc hR htriv
    fun m ↦ by rw [nsmul_eq_mul, ZMod.natCast_self, zero_mul]

/-- **Layer 5, `r(G) = dim H²(G, 𝔽_p)` counts relations.** For a minimal presentation
`G ≅ ⟨X ∣ rels⟩` (relators in `Φ(F)`) with relation subgroup `R`, `H²(G, 𝔽_p)` is finite exactly
when `R ⧸ Rᵖ[R, F]` is topologically finitely generated (`TauCeti.presentedProP.finite_H2_iff`), and
then its dimension is `d(R ⧸ Rᵖ[R, F])`, the least number of generators of `R` as a closed normal
subgroup (`TauCeti.presentedProP.finrank_H2`), equivalently `#H²(G, 𝔽_p) = p ^ d(R ⧸ Rᵖ[R, F])`
(`TauCeti.presentedProP.natCard_H2`). -/
example {p : ℕ} [Fact p.Prime] {X : Type u} (rels : Set (TauCeti.freeProP p X))
    (hrels : rels ⊆ TauCeti.proPFrattini p (TauCeti.freeProP p X)) {G : Type v} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [DistribMulAction G (ZMod p)]
    [ContinuousSMul G (ZMod p)] (e : TauCeti.presentedProP p X rels ≃ₜ* G)
    (htriv : ∀ (g : G) (m : ZMod p), g • m = m)
    (h : TauCeti.IsTopologicallyFinitelyGenerated
      ((Subgroup.normalClosure rels).topologicalClosure ⧸
        (TauCeti.pLowerCentralStep p (Subgroup.normalClosure rels).topologicalClosure).subgroupOf
          (Subgroup.normalClosure rels).topologicalClosure)) :
    Finite (TauCeti.ContCohomology.H2 G (ZMod p)) ∧
      Module.finrank (ZMod p) (TauCeti.ContCohomology.H2 G (ZMod p)) =
        TauCeti.topologicalGeneratorRankNat ((Subgroup.normalClosure rels).topologicalClosure ⧸
          (TauCeti.pLowerCentralStep p (Subgroup.normalClosure rels).topologicalClosure).subgroupOf
            (Subgroup.normalClosure rels).topologicalClosure) h ∧
      Nat.card (TauCeti.ContCohomology.H2 G (ZMod p)) =
        p ^ TauCeti.topologicalGeneratorRankNat ((Subgroup.normalClosure rels).topologicalClosure ⧸
          (TauCeti.pLowerCentralStep p (Subgroup.normalClosure rels).topologicalClosure).subgroupOf
            (Subgroup.normalClosure rels).topologicalClosure) h :=
  ⟨(TauCeti.presentedProP.finite_H2_iff rels hrels e htriv).mpr h,
    TauCeti.presentedProP.finrank_H2 rels hrels e htriv h,
    TauCeti.presentedProP.natCard_H2 rels hrels e htriv h⟩

/-- **Layer 5, presentation independence of the relation count.** Two minimal presentations of the
same group have the same `d(R ⧸ Rᵖ[R, F])`: Tau Ceti's
`TauCeti.presentedProP.topologicalGeneratorRankNat_quotient_pLowerCentralStep_eq`. -/
example {p : ℕ} [Fact p.Prime] {X : Type u} {Y : Type w} (rels : Set (TauCeti.freeProP p X))
    (rels' : Set (TauCeti.freeProP p Y)) {G : Type v} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (hrels : rels ⊆ TauCeti.proPFrattini p (TauCeti.freeProP p X))
    (hrels' : rels' ⊆ TauCeti.proPFrattini p (TauCeti.freeProP p Y))
    (e : TauCeti.presentedProP p X rels ≃ₜ* G) (e' : TauCeti.presentedProP p Y rels' ≃ₜ* G)
    (h : TauCeti.IsTopologicallyFinitelyGenerated
      ((Subgroup.normalClosure rels).topologicalClosure ⧸
        (TauCeti.pLowerCentralStep p (Subgroup.normalClosure rels).topologicalClosure).subgroupOf
          (Subgroup.normalClosure rels).topologicalClosure)) :
    TauCeti.topologicalGeneratorRankNat ((Subgroup.normalClosure rels).topologicalClosure ⧸
        (TauCeti.pLowerCentralStep p (Subgroup.normalClosure rels).topologicalClosure).subgroupOf
          (Subgroup.normalClosure rels).topologicalClosure) h =
      TauCeti.topologicalGeneratorRankNat ((Subgroup.normalClosure rels').topologicalClosure ⧸
        (TauCeti.pLowerCentralStep p (Subgroup.normalClosure rels').topologicalClosure).subgroupOf
          (Subgroup.normalClosure rels').topologicalClosure)
        ((TauCeti.presentedProP.isTopologicallyFinitelyGenerated_quotient_pLowerCentralStep_iff
          rels rels' hrels hrels' e e').mp h) :=
  TauCeti.presentedProP.topologicalGeneratorRankNat_quotient_pLowerCentralStep_eq rels rels'
    hrels hrels' e e' h

/-- **Layer 5, the deficiency.** For `G` topologically finitely generated with `H²(G, 𝔽_p)`
finite-dimensional, `def(G) : ℤ` satisfies `d(G) = def(G) + r(G)`, with no truncated subtraction:
Tau Ceti's `TauCeti.deficiency` and `TauCeti.deficiency_add_finrank_cohomFp_two`. -/
example (p : ℕ) (G : Type v) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
    (hfin : Module.Finite (ZMod p) (TauCeti.cohomFp p G 2)) :
    (TauCeti.topologicalGeneratorRankNat G hfg : ℤ) =
      TauCeti.deficiency p G hfg hfin + Module.finrank (ZMod p) (TauCeti.cohomFp p G 2) :=
  (TauCeti.deficiency_add_finrank_cohomFp_two p G hfg hfin).symm

/-- **Layer 5, a finite relation system exists if and only if `H²` is finite.** A topologically
finitely generated pro-`p` group has a minimal presentation with finitely many relators exactly
when `H²(G, 𝔽_p)` is finite: Tau Ceti's
`TauCeti.IsProP.finite_H2_iff_exists_finite_minimal_presentation`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] [DistribMulAction G (ZMod p)]
    [ContinuousSMul G (ZMod p)] (hG : TauCeti.IsProP p G)
    (h : TauCeti.IsTopologicallyFinitelyGenerated G) (htriv : ∀ (g : G) (m : ZMod p), g • m = m)
    (X : Type u) [Finite X] (hX : Nat.card X = TauCeti.topologicalGeneratorRankNat G h) :
    Finite (TauCeti.ContCohomology.H2 G (ZMod p)) ↔
      ∃ s : Finset (TauCeti.freeProP p X),
        (s : Set (TauCeti.freeProP p X)) ⊆ TauCeti.proPFrattini p (TauCeti.freeProP p X) ∧
        Nonempty (TauCeti.presentedProP p X (s : Set (TauCeti.freeProP p X)) ≃ₜ* G) :=
  hG.finite_H2_iff_exists_finite_minimal_presentation h htriv X hX

/-- **Layer 5, the deficiency inequality**, `#X - #rels ≤ def(G) = d(G) - r(G)` in `ℤ` for every
finite presentation `G ≅ ⟨X ∣ rels⟩`: Tau Ceti's
`TauCeti.presentedProP.card_sub_card_le_deficiency`.
⚠ The README writes `#S - #R ≥ d - r`; the inequality goes the other way. -/
example {p : ℕ} [Fact p.Prime] {X : Type u} [Finite X] {rels : Set (TauCeti.freeProP p X)}
    {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (e : TauCeti.presentedProP p X rels ≃ₜ* G) (hrels : rels.Finite) :
    (Nat.card X : ℤ) - Nat.card rels ≤
      TauCeti.deficiency p G
        ((TauCeti.isTopologicallyFinitelyGenerated_congr e).mp
          TauCeti.presentedProP.isTopologicallyFinitelyGenerated)
        (TauCeti.presentedProP.module_finite_cohomFp_two_of_finite e hrels) :=
  TauCeti.presentedProP.card_sub_card_le_deficiency e hrels

/-- **Layer 5, equality in the deficiency inequality**, exactly when the number of relators is
`d(R ⧸ Rᵖ[R, F])`, the least number of normal generators of the relation subgroup: Tau Ceti's
`TauCeti.presentedProP.card_sub_card_eq_deficiency_iff`. -/
example {p : ℕ} [Fact p.Prime] {X : Type u} [Finite X] {rels : Set (TauCeti.freeProP p X)}
    {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (e : TauCeti.presentedProP p X rels ≃ₜ* G) (hrels : rels.Finite) :
    (Nat.card X : ℤ) - Nat.card rels =
        TauCeti.deficiency p G
          ((TauCeti.isTopologicallyFinitelyGenerated_congr e).mp
            TauCeti.presentedProP.isTopologicallyFinitelyGenerated)
          (TauCeti.presentedProP.module_finite_cohomFp_two_of_finite e hrels) ↔
      Nat.card rels = TauCeti.topologicalGeneratorRankNat
        ((Subgroup.normalClosure rels).topologicalClosure ⧸
          (TauCeti.pLowerCentralStep p (Subgroup.normalClosure rels).topologicalClosure).subgroupOf
            (Subgroup.normalClosure rels).topologicalClosure)
        (TauCeti.presentedProP.isTopologicallyFinitelyGenerated_quotient_pLowerCentralStep_of_finite
          hrels) :=
  TauCeti.presentedProP.card_sub_card_eq_deficiency_iff e hrels

/-- **Layer 5, a Demushkin group is a one-relator pro-`p` group with relator in `Fᵖ[F, F]`**: on
any finite type with `d(G)` elements it is presented by one relator lying in the closed subgroup
generated by the `p`-th powers and commutators of the free pro-`p` group. Tau Ceti's
`TauCeti.IsDemushkin.exists_mem_proPFrattini_continuousMulEquiv_presentedProP`, with
`TauCeti.proPFrattini_eq_topologicalClosure`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsDemushkin p G) (X : Type u)
    [Finite X]
    (hX : Nat.card X = TauCeti.demushkinRank hG) :
    ∃ r ∈ (Subgroup.closure (Set.range fun g : TauCeti.freeProP p X ↦ g ^ p) ⊔
        commutator (TauCeti.freeProP p X)).topologicalClosure,
      Nonempty (TauCeti.presentedProP p X {r} ≃ₜ* G) := by
  rw [← TauCeti.proPFrattini_eq_topologicalClosure Fact.out]
  exact hG.exists_mem_proPFrattini_continuousMulEquiv_presentedProP X hX

/-- **Layer 5, the Golod-Shafarevich inequality** `4 r(G) > d(G)²` over `ℕ`, for a nontrivial
finite `p`-group with the discrete topology: Tau Ceti's
`IsPGroup.sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [Finite G] [Nontrivial G]
    [TopologicalSpace G] [DiscreteTopology G] (hG : IsPGroup p G) :
    4 * Module.finrank (ZMod p) (TauCeti.cohomFp p G 2) >
      TauCeti.topologicalGeneratorRankNat G TauCeti.isTopologicallyFinitelyGenerated_of_fg ^ 2 :=
  hG.sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two

/-- **Layer 5, sanity example: `d((ℤ/p)ⁿ) = n` and `r((ℤ/p)ⁿ) = n(n+1)/2`.** Tau Ceti's
`TauCeti.topologicalGeneratorRankNat_pi_multiplicative_zmod` and
`TauCeti.finrank_cohomFp_two_of_proPFrattini_eq_bot`, the Frattini subgroup of `(ℤ/p)ⁿ` being
trivial (`TauCeti.proPFrattini_pi_multiplicative_zmod_eq_bot`). -/
example (p : ℕ) [Fact p.Prime] (n : ℕ)
    (h : TauCeti.IsTopologicallyFinitelyGenerated (Fin n → Multiplicative (ZMod p))) :
    TauCeti.topologicalGeneratorRankNat (Fin n → Multiplicative (ZMod p)) h = n ∧
      Module.finrank (ZMod p) (TauCeti.cohomFp p (Fin n → Multiplicative (ZMod p)) 2) =
        n * (n + 1) / 2 := by
  have hd : TauCeti.topologicalGeneratorRankNat (Fin n → Multiplicative (ZMod p)) h = n := by
    rw [TauCeti.topologicalGeneratorRankNat_pi_multiplicative_zmod, Nat.card_fin]
  refine ⟨hd, ?_⟩
  rw [TauCeti.finrank_cohomFp_two_of_proPFrattini_eq_bot h
    (TauCeti.proPFrattini_pi_multiplicative_zmod_eq_bot p (Fin n)), hd]

end Ranks

end Layer5

section Layers6And7


open CategoryTheory TauCeti.ContCohomology


-- Preferring the ring path keeps a single additive structure on `ZMod p`, as in Tau Ceti.
attribute [local instance 2000] Ring.toAddCommGroup

/-! ## Layer 6: cohomological dimension of pro-`p` groups -/

section CohomologicalDimension

variable (p : ℕ) [Fact p.Prime]

/-- **Layer 6, the pro-`p` reduction of `cd_p`.** For a pro-`p` group it is enough to test the
finite modules killed by `p` with trivial action, which are the finite sums of copies of `𝔽_p`:
Tau Ceti's `TauCeti.IsProP.cohomologicalDimensionAt_le_iff_forall_smul_eq_self`, stated there
with `Subsingleton` in place of `IsZero`. -/
theorem cd_p_le_iff_elementaryAbelian_of_isProP (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G)
    (n : ℕ) :
    TauCeti.cohomologicalDimensionAt.{u} p G ≤ (n : ℕ∞) ↔
      ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
        [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M] [Finite M],
        (∀ m : M, p • m = 0) → (∀ (g : G) (m : M), g • m = m) →
          Limits.IsZero (continuousCohomology (n + 1) (TauCeti.ofDiscreteModule ℤ G M)) := by
  rw [hG.cohomologicalDimensionAt_le_iff_forall_smul_eq_self]
  refine ⟨fun h M _ _ _ _ _ _ _ hp htriv ↦ ?_, fun h M _ _ _ _ _ _ hp htriv ↦ ?_⟩
  · have := h M hp htriv
    exact TopModuleCat.isZero_of_subsingleton _
  · have := h M hp htriv
    have hx (z : continuousCohomology (n + 1) (TauCeti.ofDiscreteModule ℤ G M)) : z = 0 := by
      simpa using ConcreteCategory.congr_hom (this.eq_of_src (𝟙 _) 0) z
    exact ⟨fun x y ↦ (hx x).trans (hx y).symm⟩

/-- **Layer 6, the trivial-filtration theorem.** For pro-`p` `G`, a nonzero finite discrete
`p`-primary `G`-module has nonzero invariants: Tau Ceti's
`TauCeti.exists_ne_zero_invariant_of_isProP`. -/
theorem exists_ne_zero_invariant_of_isProP (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G)
    (M : Type u) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction G M] [ContinuousSMul G M] [Finite M] (hM : Nontrivial M)
    (htors : ∀ m : M, ∃ k : ℕ, (p ^ k) • m = 0) :
    ∃ m : M, m ≠ 0 ∧ ∀ g : G, g • m = m :=
  haveI := hM
  TauCeti.exists_ne_zero_invariant_of_isProP hG htors

/-- **Layer 6, free implies `cd_p ≤ 1`.** Tau Ceti's
`TauCeti.freeProP.cohomologicalDimensionAt_le_one`, which holds on any type of generators. -/
theorem cd_p_freeProP_le_one (n : ℕ) [TotallyDisconnectedSpace (TauCeti.freeProP p (Fin n))] :
    TauCeti.cohomologicalDimensionAt.{0} p (TauCeti.freeProP p (Fin n)) ≤ 1 :=
  TauCeti.freeProP.cohomologicalDimensionAt_le_one (Fact.out : p.Prime).ne_zero

/-- **Layer 6, Serre's theorem**: `cd_p G ≤ 1` implies free pro-`p`, for topologically finitely
generated `G`. Tau Ceti's
`TauCeti.IsProP.nonempty_continuousMulEquiv_freeProP_of_cohomologicalDimensionAt_le_one`, read at
the generating type `Fin d(G)` through `TauCeti.freeProP.uliftEquiv`. -/
theorem isFree_of_cd_p_le_one (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G)
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
    (hcd : TauCeti.cohomologicalDimensionAt.{u} p G ≤ 1)
    [TotallyDisconnectedSpace
      (TauCeti.freeProP p (Fin (TauCeti.topologicalGeneratorRankNat G hfg)))] :
    Nonempty (G ≃ₜ* TauCeti.freeProP p (Fin (TauCeti.topologicalGeneratorRankNat G hfg))) := by
  have hX : Nat.card (ULift.{u} (Fin (TauCeti.topologicalGeneratorRankNat G hfg))) =
      TauCeti.topologicalGeneratorRankNat G hfg := by
    rw [Nat.card_ulift, Nat.card_eq_fintype_card, Fintype.card_fin]
  obtain ⟨e⟩ := hG.nonempty_continuousMulEquiv_freeProP_of_cohomologicalDimensionAt_le_one hfg hcd
    (ULift.{u} (Fin (TauCeti.topologicalGeneratorRankNat G hfg))) hX
  exact ⟨e.trans (TauCeti.freeProP.uliftEquiv p (Fin (TauCeti.topologicalGeneratorRankNat G hfg)))⟩

omit [Fact p.Prime] in
/-- **Layer 6, `cd_p` of an open subgroup.** For `U` open in `G` with `cd_p G` finite,
`cd_p U = cd_p G`: Tau Ceti's `TauCeti.cohomologicalDimensionAt_eq_of_isOpen_of_ne_top`, which
holds for every profinite `G`, so the pro-`p` hypothesis is not used. -/
theorem cd_p_eq_of_isOpen (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (_hG : TauCeti.IsProP p G) (U : OpenSubgroup G)
    (hfin : TauCeti.cohomologicalDimensionAt.{u} p G ≠ ⊤)
    [CompactSpace U.toSubgroup] [TotallyDisconnectedSpace U.toSubgroup] :
    TauCeti.cohomologicalDimensionAt.{u} p U.toSubgroup =
      TauCeti.cohomologicalDimensionAt.{u} p G :=
  TauCeti.cohomologicalDimensionAt_eq_of_isOpen_of_ne_top U.isOpen hfin

/-- **Layer 6, restriction to a `p`-Sylow subgroup is injective** in every degree. In positive
degree this is Tau Ceti's `TauCeti.ContinuousCohomology.res_injective_of_forall_not_dvd_index`,
whose hypotheses are `TauCeti.IsProPSylow.isClosed` and `TauCeti.IsProPSylow.not_dvd_index_of_le`;
in degree zero it is `TauCeti.ContinuousCohomology.mono_res_zero`. -/
theorem res_injective_of_isProPSylow (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (P : Subgroup G)
    (hP : TauCeti.IsProPSylow p P) (M : Type u) [AddCommGroup M] [TopologicalSpace M]
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

/-- **Layer 6, the Sylow equality** `cd_p G = cd_p G_p`: Tau Ceti's
`TauCeti.IsProPSylow.cohomologicalDimensionAt_eq`. -/
theorem cd_p_eq_of_isProPSylow (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (P : Subgroup G)
    (hP : TauCeti.IsProPSylow p P) :
    haveI : CompactSpace P :=
      isCompact_iff_compactSpace.mp (TauCeti.IsProPSylow.isClosed hP).isCompact
    TauCeti.cohomologicalDimensionAt.{u} p P = TauCeti.cohomologicalDimensionAt.{u} p G :=
  hP.cohomologicalDimensionAt_eq.symm

/-- **Layer 7, an infinite Demushkin group has `cd_p = 2`**: Tau Ceti's
`TauCeti.IsDemushkin.cohomologicalDimensionAt_eq_two`. -/
theorem cd_p_eq_two_of_isDemushkin (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsDemushkin p G) (hinf : Infinite G) :
    TauCeti.cohomologicalDimensionAt.{u} p G = 2 :=
  have := hinf
  hG.cohomologicalDimensionAt_eq_two

end CohomologicalDimension

section CohomologicalDimensionExamples

variable {p : ℕ} [hp : Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 6, the trivial filtration.** Iterating the invariant theorem, a finite discrete
`p`-primary module over a pro-`p` group has a `G`-stable filtration of length
`padicValNat p (Nat.card M)` whose factors have order `p` with trivial action: Tau Ceti's
`TauCeti.exists_filtration_of_isProP`. -/
example (hG : TauCeti.IsProP p G) {M : Type u} [AddCommGroup M] [TopologicalSpace M]
    [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M] [Finite M]
    (htors : ∀ m : M, ∃ k : ℕ, p ^ k • m = 0) :
    ∃ N : ℕ → AddSubgroup M, N 0 = ⊥ ∧ Monotone N ∧
      (∀ i, padicValNat p (Nat.card M) ≤ i → N i = ⊤) ∧
      (∀ i, ∀ g : G, ∀ x ∈ N i, g • x ∈ N i) ∧
      (∀ i ≤ padicValNat p (Nat.card M), Nat.card (N i) = p ^ i) ∧
      ∀ i < padicValNat p (Nat.card M), ∃ x : M, N (i + 1) = N i ⊔ AddSubgroup.zmultiples x ∧
        x ∉ N i ∧ p • x ∈ N i ∧ ∀ g : G, g • x - x ∈ N i :=
  TauCeti.exists_filtration_of_isProP hG htors

/-- **Layer 6, additive invariants and composition length.** A `ℤ`-valued function of the finite
discrete `p`-primary modules that is additive along short exact sequences takes the value
`padicValNat p (Nat.card M)` times its value at a trivial module of order `p`: Tau Ceti's
`TauCeti.invariant_eq_padicValNat_mul_of_isProP`. -/
example
    (I : ∀ (A : Type u) [AddCommGroup A] [TopologicalSpace A]
      [DiscreteTopology A] [DistribMulAction G A] [ContinuousSMul G A] [Finite A],
      (∀ a : A, ∃ k : ℕ, p ^ k • a = 0) → ℤ)
    (hExact : ∀ {A B C : Type u}
      [AddCommGroup A] [TopologicalSpace A] [DiscreteTopology A]
      [DistribMulAction G A] [ContinuousSMul G A] [Finite A]
      [AddCommGroup B] [TopologicalSpace B] [DiscreteTopology B]
      [DistribMulAction G B] [ContinuousSMul G B] [Finite B]
      [AddCommGroup C] [TopologicalSpace C] [DiscreteTopology C]
      [DistribMulAction G C] [ContinuousSMul G C] [Finite C]
      (hA : ∀ a : A, ∃ k : ℕ, p ^ k • a = 0)
      (hB : ∀ b : B, ∃ k : ℕ, p ^ k • b = 0)
      (hC : ∀ c : C, ∃ k : ℕ, p ^ k • c = 0)
      (f : A →+ B) (q : B →+ C),
      (∀ (g : G) (a : A), f (g • a) = g • f a) →
      (∀ (g : G) (b : B), q (g • b) = g • q b) →
      Function.Injective f → Function.Surjective q →
      f.range = q.ker → I B hB = I A hA + I C hC)
    {M P : Type u} [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction G M] [ContinuousSMul G M] [Finite M]
    [AddCommGroup P] [TopologicalSpace P] [DiscreteTopology P] [DistribMulAction G P]
    (hG : TauCeti.IsProP p G) (hM : ∀ m : M, ∃ k : ℕ, p ^ k • m = 0) (eP : P ≃+ ZMod p)
    (hPsmul : ∀ (g : G) (x : P), g • x = x) :
    haveI : Finite P := Finite.of_equiv _ eP.symm.toEquiv
    haveI : ContinuousSMul G P := ⟨continuous_snd.congr fun z ↦ (hPsmul z.1 z.2).symm⟩
    I M hM = (padicValNat p (Nat.card M) : ℤ) *
      I P (TauCeti.forall_exists_nsmul_eq_zero_of_addEquiv_zmod eP) :=
  TauCeti.invariant_eq_padicValNat_mul_of_isProP I hExact hG hM eP hPsmul

/-- **Layer 6, dévissage.** For a pro-`p` group, vanishing in one degree on the finite elementary
abelian modules with trivial action gives vanishing in that degree on all finite discrete
`p`-primary modules: Tau Ceti's `TauCeti.IsProP.forall_subsingleton_continuousCohomology_iff`. -/
example (hG : TauCeti.IsProP p G) (n : ℕ) :
    (∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
      [DistribMulAction G M] [ContinuousSMul G M] [Finite M], TauCeti.IsPPrimaryTorsion p M →
      Subsingleton (continuousCohomology n (TauCeti.ofDiscreteModule ℤ G M))) ↔
    ∀ (A : Type u) [AddCommGroup A] [TopologicalSpace A] [DiscreteTopology A]
      [DistribMulAction G A] [ContinuousSMul G A] [Finite A], (∀ a : A, p • a = 0) →
      (∀ (g : G) (a : A), g • a = a) →
      Subsingleton (continuousCohomology n (TauCeti.ofDiscreteModule ℤ G A)) :=
  hG.forall_subsingleton_continuousCohomology_iff n

/-- **Layer 6, vanishing in one degree gives vanishing above it.** If `H²(G, M) = 0` for every
finite discrete `p`-primary `M`, then `Hⁿ(G, M) = 0` for every `n ≥ 2` and every such `M`. This
combines Tau Ceti's `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ` with
`TauCeti.cohomologicalDimensionAt_le_iff_forall_finite`; it holds for every profinite `G`. -/
example
    (h2 : ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
      [DistribMulAction G M] [ContinuousSMul G M] [Finite M], TauCeti.IsPPrimaryTorsion p M →
      Subsingleton (continuousCohomology 2 (TauCeti.ofDiscreteModule ℤ G M)))
    (n : ℕ) (hn : 2 ≤ n) (M : Type u) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction G M] [ContinuousSMul G M] [Finite M] (hM : TauCeti.IsPPrimaryTorsion p M) :
    Subsingleton (continuousCohomology n (TauCeti.ofDiscreteModule ℤ G M)) := by
  have hcd := (TauCeti.cohomologicalDimensionAt_le_iff_forall_finite_subsingleton_succ p G
    hp.out.ne_zero 1).2 h2
  exact (TauCeti.cohomologicalDimensionAt_le_iff_forall_finite hp.out.ne_zero 1).1 hcd M hM n
    (by exact_mod_cast hn)

/-- **Layer 6, the two-term Euler formula.** For `G` topologically finitely generated pro-`p` with
`cd_p G ≤ 1` and `U` open, the four spaces `Hⁱ(G, 𝔽_p)`, `Hⁱ(U, 𝔽_p)`, `i = 0, 1`, are
finite-dimensional, and
`dim H⁰(U) - dim H¹(U) = [G : U] (dim H⁰(G) - dim H¹(G))` in `ℤ`. Tau Ceti's
`TauCeti.CohomologicalDimensionLE.one_sub_topologicalGeneratorRankNat_eq`, stated with
`dim H⁰ = 1` and `dim H¹ = d`, read through `TauCeti.IsProP.finite_cohomFp_one_iff`,
`TauCeti.IsProP.finrank_cohomFp_one` and `TauCeti.cohomFpZeroLinearEquiv`. -/
example (hG : TauCeti.IsProP p G) (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
    (hcd : TauCeti.cohomologicalDimensionAt.{u} p G ≤ 1) (U : OpenSubgroup G) :
    Module.Finite (ZMod p) (TauCeti.cohomFp p G 0) ∧
      Module.Finite (ZMod p) (TauCeti.cohomFp p G 1) ∧
      Module.Finite (ZMod p) (TauCeti.cohomFp p U.toSubgroup 0) ∧
      Module.Finite (ZMod p) (TauCeti.cohomFp p U.toSubgroup 1) ∧
      (Module.finrank (ZMod p) (TauCeti.cohomFp p U.toSubgroup 0) : ℤ) -
          Module.finrank (ZMod p) (TauCeti.cohomFp p U.toSubgroup 1) =
        U.toSubgroup.index * ((Module.finrank (ZMod p) (TauCeti.cohomFp p G 0) : ℤ) -
          Module.finrank (ZMod p) (TauCeti.cohomFp p G 1)) := by
  have : CompactSpace U.toSubgroup := isCompact_iff_compactSpace.mp U.isClosed.isCompact
  have hU : TauCeti.IsProP p U.toSubgroup := hG.subgroup _
  have hUfg := hfg.of_openSubgroup U
  have hcd' : TauCeti.CohomologicalDimensionLE.{u} p G 1 :=
    (TauCeti.cohomologicalDimensionAt_le_iff p G 1).1 (by exact_mod_cast hcd)
  have h := TauCeti.CohomologicalDimensionLE.one_sub_topologicalGeneratorRankNat_eq hG hfg hcd' U
  refine ⟨inferInstance, hG.finite_cohomFp_one_iff.2 hfg, inferInstance,
    hU.finite_cohomFp_one_iff.2 hUfg, ?_⟩
  rw [(TauCeti.cohomFpZeroLinearEquiv p G).finrank_eq,
    (TauCeti.cohomFpZeroLinearEquiv p U.toSubgroup).finrank_eq, Module.finrank_self,
    hG.finrank_cohomFp_one hfg, hU.finrank_cohomFp_one hUfg]
  exact_mod_cast h

/-- **Layer 6, pro-`p` Nielsen-Schreier for open subgroups.** An open subgroup of index `m` in the
free pro-`p` group of rank `n ≥ 1` is free pro-`p` of rank `1 + m(n - 1)`: Tau Ceti's
`TauCeti.freeProP.nonempty_continuousMulEquiv_freeProP_openSubgroup_index`. -/
example {n : ℕ} (hn : n ≠ 0) (U : OpenSubgroup (TauCeti.freeProP p (Fin n))) :
    Nonempty (U ≃ₜ* TauCeti.freeProP p (Fin (1 + U.toSubgroup.index * (n - 1)))) := by
  have : Nonempty (Fin n) := ⟨⟨0, Nat.pos_of_ne_zero hn⟩⟩
  exact TauCeti.freeProP.nonempty_continuousMulEquiv_freeProP_openSubgroup_index U _
    (by simp)

/-- **Layer 6, the rank of an open subgroup of a free pro-`p` group, in `ℤ`.** The two-term Euler
formula with `dim H¹(F) = n`, `dim H¹(U) = d(U)`: `1 - d(U) = m(1 - n)`. Tau Ceti's
`TauCeti.IsProP.one_sub_topologicalGeneratorRankNat_eq` at `TauCeti.freeProP`, with
`TauCeti.topologicalGeneratorRankNat_freeProP`. -/
example {n : ℕ} (U : OpenSubgroup (TauCeti.freeProP p (Fin n))) :
    (1 : ℤ) - TauCeti.topologicalGeneratorRankNat U.toSubgroup
        ((TauCeti.isTopologicallyFinitelyGenerated_freeProP p (Fin n)).of_openSubgroup U) =
      U.toSubgroup.index * (1 - n) := by
  have h := (TauCeti.isProP_freeProP p (Fin n)).one_sub_topologicalGeneratorRankNat_eq
    (TauCeti.isTopologicallyFinitelyGenerated_freeProP p (Fin n))
    (fun A _ _ _ _ _ _ hA _ ↦ TauCeti.freeProP.subsingleton_H2_of_isPPrimaryTorsion
      (TauCeti.isPPrimaryTorsion_of_natCard_eq_pow (hA.trans (pow_one p).symm))) U
  rwa [TauCeti.topologicalGeneratorRankNat_freeProP, Nat.card_fin] at h

/-- **Layer 6, the natural-number rank formula** `d(U) = 1 + m(n - 1)`, the small rearrangement
lemma: Tau Ceti's `TauCeti.freeProP.topologicalGeneratorRankNat_openSubgroup`. -/
example {n : ℕ} [NeZero n] (U : OpenSubgroup (TauCeti.freeProP p (Fin n))) :
    TauCeti.topologicalGeneratorRankNat U.toSubgroup
        ((TauCeti.isTopologicallyFinitelyGenerated_freeProP p (Fin n)).of_openSubgroup U) =
      1 + U.toSubgroup.index * (n - 1) := by
  rw [TauCeti.freeProP.topologicalGeneratorRankNat_openSubgroup U, Nat.card_fin]

end CohomologicalDimensionExamples

/-! ## Layer 7: Demushkin groups, their invariants, and the orientation -/

section Demushkin

variable {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 7, the Demushkin predicate.** Tau Ceti's `TauCeti.IsDemushkin` has exactly the fields
of the conventions: pro-`p`, `H¹(G, 𝔽_p)` finite-dimensional, `dim H²(G, 𝔽_p) = 1`, and the cup
product `TauCeti.cupFp` nondegenerate on each side. -/
example : TauCeti.IsDemushkin p G ↔
    TauCeti.IsProP p G ∧ Module.Finite (ZMod p) (TauCeti.cohomFp p G 1) ∧
      Module.finrank (ZMod p) (TauCeti.cohomFp p G 2) = 1 ∧
      (∀ a : TauCeti.cohomFp p G 1, a ≠ 0 → ∃ b, TauCeti.cupFp p G a b ≠ 0) ∧
      (∀ b : TauCeti.cohomFp p G 1, b ≠ 0 → ∃ a, TauCeti.cupFp p G a b ≠ 0) :=
  ⟨fun h ↦ ⟨h.1, h.2, h.3, h.4, h.5⟩, fun ⟨h1, h2, h3, h4, h5⟩ ↦ ⟨h1, h2, h3, h4, h5⟩⟩

/-- **Layer 7, a Demushkin group is topologically finitely generated**: Tau Ceti's
`TauCeti.IsDemushkin.isTopologicallyFinitelyGenerated`. -/
theorem IsDemushkin.isTopologicallyFinitelyGenerated {p G} [Fact p.Prime] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsDemushkin p G) : TauCeti.IsTopologicallyFinitelyGenerated G :=
  TauCeti.IsDemushkin.isTopologicallyFinitelyGenerated hG

/-- **Layer 7, the rank** `n(G) := topologicalGeneratorRankNat G h`: Tau Ceti's
`TauCeti.demushkinRank`, by `TauCeti.demushkinRank_def`. -/
example (hG : TauCeti.IsDemushkin p G) :
    TauCeti.demushkinRank hG =
      TauCeti.topologicalGeneratorRankNat G hG.isTopologicallyFinitelyGenerated :=
  TauCeti.demushkinRank_def hG

/-- **Layer 7, `n(G) = dim H¹(G, 𝔽_p)`**: Tau Ceti's `TauCeti.IsDemushkin.finrank_cohomFp_one`. -/
example (hG : TauCeti.IsDemushkin p G) :
    Module.finrank (ZMod p) (TauCeti.cohomFp p G 1) = TauCeti.demushkinRank hG :=
  hG.finrank_cohomFp_one

/-- **Layer 7, a Demushkin group is a one-relator pro-`p` group with relator in `Fᵖ[F, F]`**, on
`n(G)` generators: Tau Ceti's
`TauCeti.IsDemushkin.exists_mem_proPFrattini_continuousMulEquiv_presentedProP_fin`. -/
example (hG : TauCeti.IsDemushkin p G) :
    ∃ r ∈ TauCeti.proPFrattini p (TauCeti.freeProP p (Fin (TauCeti.demushkinRank hG))),
      Nonempty (TauCeti.presentedProP p (Fin (TauCeti.demushkinRank hG)) {r} ≃ₜ* G) :=
  hG.exists_mem_proPFrattini_continuousMulEquiv_presentedProP_fin

/-- **Layer 7, invariance under topological isomorphism**: Tau Ceti's
`TauCeti.isDemushkin_congr`. -/
example {H : Type u} [Group H] [TopologicalSpace H] [IsTopologicalGroup H] (e : G ≃ₜ* H) :
    TauCeti.IsDemushkin p G ↔ TauCeti.IsDemushkin p H :=
  TauCeti.isDemushkin_congr p e

/-- **Layer 7, the rank is an isomorphism invariant**: Tau Ceti's `TauCeti.demushkinRank_congr`. -/
example {H : Type u} [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H]
    [TotallyDisconnectedSpace H] (hG : TauCeti.IsDemushkin p G) (hH : TauCeti.IsDemushkin p H)
    (e : G ≃ₜ* H) : TauCeti.demushkinRank hG = TauCeti.demushkinRank hH :=
  TauCeti.demushkinRank_congr hG hH e

/-- **Layer 7, comparison with NSW (3.9.9).** `G` is Demushkin exactly when it is pro-`p` with
`H¹(G, 𝔽_p)` finite-dimensional and the cup product is a nondegenerate bilinear form for some
isomorphism `H²(G, 𝔽_p) ≅ 𝔽_p`: Tau Ceti's `TauCeti.isDemushkin_iff_nondegenerate_cupForm`. -/
example : TauCeti.IsDemushkin p G ↔ TauCeti.IsProP p G ∧
      Module.Finite (ZMod p) (TauCeti.cohomFp p G 1) ∧
      ∃ e : TauCeti.cohomFp p G 2 ≃ₗ[ZMod p] ZMod p, e.toLinearMap.cupForm.Nondegenerate :=
  TauCeti.isDemushkin_iff_nondegenerate_cupForm

end Demushkin

section Examples

/-- **Layer 7, `ℤ/2` is Demushkin at `p = 2`, of rank `1`**: Tau Ceti's
`TauCeti.isDemushkin_multiplicative_zmod_two` and
`TauCeti.demushkinRank_multiplicative_zmod_two`. -/
example : ∃ h : TauCeti.IsDemushkin 2 (Multiplicative (ZMod 2)), TauCeti.demushkinRank h = 1 :=
  ⟨TauCeti.isDemushkin_multiplicative_zmod_two, TauCeti.demushkinRank_multiplicative_zmod_two⟩

/-- **Layer 7, `q(ℤ/2) = 2`**: Tau Ceti's `TauCeti.demushkinQ_multiplicative_zmod_two`. -/
example : TauCeti.demushkinQ TauCeti.isDemushkin_multiplicative_zmod_two = 2 :=
  TauCeti.demushkinQ_multiplicative_zmod_two

/-- **Layer 7, the cup square of the generator of `H¹(ℤ/2, 𝔽₂)` is the class of `ℤ/4`**: Tau
Ceti's `TauCeti.cupFp_cyclicTwoClass_self_eq_zmodFourExtensionClass`, where
`TauCeti.cyclicTwoClass` is the nonzero class (`TauCeti.cyclicTwoClass_ne_zero`). -/
example : TauCeti.cyclicTwoClass ≠ 0 ∧
    TauCeti.cupFp 2 (Multiplicative (ZMod 2)) TauCeti.cyclicTwoClass TauCeti.cyclicTwoClass =
      TauCeti.zmodFourExtensionClass :=
  ⟨TauCeti.cyclicTwoClass_ne_zero, TauCeti.cupFp_cyclicTwoClass_self_eq_zmodFourExtensionClass⟩

variable {p : ℕ} [Fact p.Prime]

/-- **Layer 7, `ℤ_p × ℤ_p` is Demushkin of rank `2` with `q = 0`**, presented by the surface
relation `(x₁, x₂)` (`TauCeti.presentedProPEquivPiPadicInt`): Tau Ceti's
`TauCeti.isDemushkin_multiplicative_pi_padicInt_fin_two`,
`TauCeti.demushkinRank_multiplicative_pi_padicInt_fin_two` and
`TauCeti.demushkinQ_multiplicative_pi_padicInt_fin_two`, on the model `Fin 2 → ℤ_p`. -/
example : ∃ h : TauCeti.IsDemushkin p (Multiplicative (Fin 2 → ℤ_[p])),
    TauCeti.demushkinRank h = 2 ∧ TauCeti.demushkinQ h = 0 :=
  ⟨TauCeti.isDemushkin_multiplicative_pi_padicInt_fin_two p,
    TauCeti.demushkinRank_multiplicative_pi_padicInt_fin_two p,
    TauCeti.demushkinQ_multiplicative_pi_padicInt_fin_two p _⟩

/-- **Layer 7, the surface presentation of `ℤ_p × ℤ_p`**: Tau Ceti's
`TauCeti.presentedProPEquivPiPadicInt`, for the relator `TauCeti.demushkinWordNeTwo 0 2`. -/
example : Nonempty (TauCeti.presentedProP p (Fin 2)
      {TauCeti.demushkinWordNeTwo 0 2 (TauCeti.freeProPGen p 2)} ≃ₜ*
    Multiplicative (Fin 2 → ℤ_[p])) :=
  ⟨TauCeti.presentedProPEquivPiPadicInt p⟩

/-- **Layer 7, `D₀` is Demushkin at `p = 2` with `n = 3` and `q = 2`**: Tau Ceti's
`TauCeti.isDemushkin_demushkinD0`, `TauCeti.demushkinRank_demushkinD0` and
`TauCeti.demushkinQ_demushkinD0`. -/
example : ∃ h : TauCeti.IsDemushkin 2 TauCeti.demushkinD0,
    TauCeti.demushkinRank h = 3 ∧ TauCeti.demushkinQ h = 2 :=
  ⟨TauCeti.isDemushkin_demushkinD0, TauCeti.demushkinRank_demushkinD0 _,
    TauCeti.demushkinQ_demushkinD0 _⟩

/-- **Layer 7, a free pro-`p` group is not Demushkin**, its `H²` vanishing: Tau Ceti's
`TauCeti.not_isDemushkin_freeProP`. -/
example (X : Type u) : ¬ TauCeti.IsDemushkin p (TauCeti.freeProP p X) :=
  TauCeti.not_isDemushkin_freeProP X

/-- **Layer 7, the trivial group is not Demushkin**: it is the free pro-`p` group on the empty type
(`TauCeti.freeProP.equivPUnitOfIsEmpty`). -/
example : ¬ TauCeti.IsDemushkin p PUnit.{u + 1} := fun h ↦
  TauCeti.not_isDemushkin_freeProP PEmpty.{u + 1}
    ((TauCeti.isDemushkin_congr p (TauCeti.freeProP.equivPUnitOfIsEmpty p PEmpty)).2 h)

/-- **Layer 7, `ℤ_p` is not Demushkin**: it is the free pro-`p` group on one generator
(`TauCeti.freeProP.equivPadicInt`). -/
example : ¬ TauCeti.IsDemushkin p (Multiplicative ℤ_[p]) := fun h ↦
  TauCeti.not_isDemushkin_freeProP Unit
    ((TauCeti.isDemushkin_congr p (TauCeti.freeProP.equivPadicInt p Unit)).2 h)

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]

/-- **Layer 7, `ℤ/2` is the unique finite Demushkin group**: Tau Ceti's
`TauCeti.IsDemushkin.finite_iff_nonempty_continuousMulEquiv_multiplicative_zmod_two`. -/
example (hG : TauCeti.IsDemushkin p G) :
    Finite G ↔ Nonempty (G ≃ₜ* Multiplicative (ZMod 2)) :=
  hG.finite_iff_nonempty_continuousMulEquiv_multiplicative_zmod_two

/-- **Layer 7, `ℤ/2` is the unique Demushkin group of rank `1`**: Tau Ceti's
`TauCeti.IsDemushkin.demushkinRank_eq_one_iff`. -/
example (hG : TauCeti.IsDemushkin p G) :
    TauCeti.demushkinRank hG = 1 ↔ Nonempty (G ≃ₜ* Multiplicative (ZMod 2)) :=
  hG.demushkinRank_eq_one_iff

/-- **Layer 7, for odd `p` there is no Demushkin group of rank `1`**: Tau Ceti's
`TauCeti.IsDemushkin.demushkinRank_ne_one_of_ne_two`. -/
example (hG : TauCeti.IsDemushkin p G) (hp : p ≠ 2) : TauCeti.demushkinRank hG ≠ 1 :=
  hG.demushkinRank_ne_one_of_ne_two hp

end Examples

section Abelianization

variable {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 7, the abelianization structure theorem.** `G^{ab} ≅ ℤ_p^{n-1} × ℤ_p/qℤ_p` as
topological groups: Tau Ceti's
`TauCeti.IsDemushkin.nonempty_continuousMulEquiv_topologicalAbelianization`. -/
example (hG : TauCeti.IsDemushkin p G) :
    Nonempty (TopologicalAbelianization G ≃ₜ*
      Multiplicative ((Fin (TauCeti.demushkinRank hG - 1) → ℤ_[p]) ×
        (ℤ_[p] ⧸ Ideal.span {(TauCeti.demushkinQ hG : ℤ_[p])}))) :=
  hG.nonempty_continuousMulEquiv_topologicalAbelianization

/-- **Layer 7, the torsion of `G^{ab}` is finite and cyclic**: Tau Ceti's
`TauCeti.IsDemushkin.finite_torsion_topologicalAbelianization` and
`TauCeti.IsDemushkin.isCyclic_torsion_topologicalAbelianization`. -/
example (hG : TauCeti.IsDemushkin p G) :
    Finite (CommGroup.torsion (TopologicalAbelianization G)) ∧
      IsCyclic (CommGroup.torsion (TopologicalAbelianization G)) :=
  ⟨hG.finite_torsion_topologicalAbelianization, hG.isCyclic_torsion_topologicalAbelianization⟩

/-- **Layer 7, `q` is `0` exactly when the torsion is trivial**: Tau Ceti's
`TauCeti.demushkinQ_eq_zero_iff`. -/
example (hG : TauCeti.IsDemushkin p G) :
    TauCeti.demushkinQ hG = 0 ↔ IsMulTorsionFree (TopologicalAbelianization G) :=
  TauCeti.demushkinQ_eq_zero_iff hG

open scoped Classical in
/-- **Layer 7, `TauCeti.demushkinQ` agrees with the roadmap's definition**: `0` when every element
of finite order of `G^{ab}` is trivial, and the number of elements of finite order otherwise. -/
example (hG : TauCeti.IsDemushkin p G) :
    TauCeti.demushkinQ hG =
      if ∀ x : TopologicalAbelianization G, IsOfFinOrder x → x = 1 then 0
      else Nat.card {x : TopologicalAbelianization G // IsOfFinOrder x} := by
  have h : CommGroup.torsion (TopologicalAbelianization G) = ⊥ ↔
      ∀ x : TopologicalAbelianization G, IsOfFinOrder x → x = 1 := by
    simp [Subgroup.eq_bot_iff_forall, CommGroup.mem_torsion]
  unfold TauCeti.demushkinQ
  split_ifs with h1 h2 h2
  · rfl
  · exact absurd (h.1 h1) h2
  · exact absurd (h.2 h2) h1
  · rfl

/-- **Layer 7, the `q`-invariant is an isomorphism invariant**: Tau Ceti's
`TauCeti.demushkinQ_congr`. -/
example {H : Type u} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (hG : TauCeti.IsDemushkin p G) (hH : TauCeti.IsDemushkin p H) (e : G ≃ₜ* H) :
    TauCeti.demushkinQ hG = TauCeti.demushkinQ hH :=
  TauCeti.demushkinQ_congr hG hH e

/-- **Layer 7, the abelianization of `D₀`.** `D₀^{ab} ≅ (ℤ₂ × ℤ₂) × ℤ/2`: Tau Ceti's
`TauCeti.d0AbelianizationEquiv`. -/
example :
    Nonempty (TopologicalAbelianization TauCeti.demushkinD0 ≃ₜ*
      Multiplicative ((ℤ_[2] × ℤ_[2]) × ZMod 2)) :=
  ⟨TauCeti.d0AbelianizationEquiv⟩

/-- **Layer 7, the torsion of `D₀^{ab}` has two elements**: Tau Ceti's
`TauCeti.nat_card_torsion_topologicalAbelianization_demushkinD0`. -/
example :
    Nat.card {x : TopologicalAbelianization TauCeti.demushkinD0 // IsOfFinOrder x} = 2 :=
  TauCeti.nat_card_torsion_topologicalAbelianization_demushkinD0

end Abelianization

section Prescription

variable {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]

/-- **Layer 7, the prescription property** (condition 1 of Labute Prop. 6): every reduction
`H¹(G, I(χ)/pⁱ) → H¹(G, I(χ)/p)`, `i ≥ 1`, is surjective. Tau Ceti's
`TauCeti.HasPrescriptionProperty`, by `TauCeti.hasPrescriptionProperty_iff`; `I(χ)/pⁱ` is
`TauCeti.ZModTwist χ i`. -/
example (χ : G →ₜ* ℤ_[p]ˣ) :
    TauCeti.HasPrescriptionProperty χ ↔ ∀ (i : ℕ) (hi : 1 ≤ i),
      Function.Surjective
        (explicitCoeff1 G (TauCeti.ZModTwist χ i) (TauCeti.ZModTwist.reduce χ hi)
          continuous_of_discreteTopology) :=
  TauCeti.hasPrescriptionProperty_iff χ

/-- **Layer 7, the twisted action** `g · x = χ(g) x` on `I(χ)/pⁱ`: Tau Ceti's
`TauCeti.ZModTwist.val_smul`, with `TauCeti.charScalar χ i g = χ(g) mod pⁱ`
(`TauCeti.charScalar_apply`). -/
example (χ : G →ₜ* ℤ_[p]ˣ) (i : ℕ) (g : G) (x : TauCeti.ZModTwist χ i) :
    (g • x).val = PadicInt.toZModPow i (χ g : ℤ_[p]) * x.val := by
  rw [TauCeti.ZModTwist.val_smul, TauCeti.charScalar_apply]

/-- **Layer 7, lifting through every level.** Under the prescription property every reduction
`H¹(G, I(χ)/pⁿ) → H¹(G, I(χ)/pʲ)`, `j ≤ n`, is surjective: Tau Ceti's
`TauCeti.HasPrescriptionProperty.surjective_explicitCoeff1_reduce`. -/
example {χ : G →ₜ* ℤ_[p]ˣ} (hχ : TauCeti.HasPrescriptionProperty χ) {j n : ℕ} (h : j ≤ n) :
    Function.Surjective
      (explicitCoeff1 G (TauCeti.ZModTwist χ n) (TauCeti.ZModTwist.reduce χ h)
        continuous_of_discreteTopology) :=
  hχ.surjective_explicitCoeff1_reduce h

variable [IsTopologicalGroup G]

/-- **Layer 7, Labute Prop. 6, conditions 1 and 2, connecting-map form**: the prescription property
holds exactly when every connecting map `H¹(G, I(χ)/pⁱ) → H²(G, I(χ)/p)` of
`0 → I(χ)/p → I(χ)/pⁱ⁺¹ → I(χ)/pⁱ → 0` vanishes. Tau Ceti's
`TauCeti.hasPrescriptionProperty_iff_forall_explicitDelta1_eq_zero`. -/
example (χ : G →ₜ* ℤ_[p]ˣ) :
    TauCeti.HasPrescriptionProperty χ ↔
      ∀ (i n : ℕ) (h : i + 1 = n), (TauCeti.ZModTwist.shortExact χ h).explicitDelta1 = 0 :=
  TauCeti.hasPrescriptionProperty_iff_forall_explicitDelta1_eq_zero χ

/-- **Layer 7, Labute Prop. 6, conditions 1 and 2, injectivity form**: the prescription property
holds exactly when every map `H²(G, I(χ)/pⁱ) → H²(G, I(χ)/pⁱ⁺¹)` induced by multiplication by `p`
is injective. Tau Ceti's
`TauCeti.hasPrescriptionProperty_iff_forall_injective_explicitCoeff2_mulPow`. -/
example (χ : G →ₜ* ℤ_[p]ˣ) :
    TauCeti.HasPrescriptionProperty χ ↔ ∀ (i n : ℕ) (h : i + 1 = n),
      Function.Injective (explicitCoeff2 G (TauCeti.ZModTwist χ i)
        (TauCeti.ZModTwist.mulPow χ h) continuous_of_discreteTopology) :=
  TauCeti.hasPrescriptionProperty_iff_forall_injective_explicitCoeff2_mulPow χ

/-- **Layer 7, Labute Prop. 6, conditions 1 and 3.** For a topologically finitely generated
pro-`p` group and a family `g` lifting a basis of `G/Φ(G)` (a minimal generating tuple), the
prescription property holds exactly when for every `(c_k) ∈ ℤ_p^ι` there is a compatible system of
continuous crossed homomorphisms `G → I(χ)/pⁱ` taking `g_k` to `c_k mod pⁱ`. Tau Ceti's
`TauCeti.IsProP.hasPrescriptionProperty_iff_forall_exists_forall_reduce_eq_and_val_eq`. -/
example [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G)
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) {ι : Type}
    (b : Module.Basis ι (ZMod p) (Additive (G ⧸ TauCeti.proPFrattini p G))) {g : ι → G}
    (hgb : ∀ k, Additive.ofMul ((QuotientGroup.mk' (TauCeti.proPFrattini p G)) (g k)) = b k)
    (χ : G →ₜ* ℤ_[p]ˣ) :
    TauCeti.HasPrescriptionProperty χ ↔ ∀ c : ι → ℤ_[p],
      ∃ f : ∀ i : ℕ, Z1 G (TauCeti.ZModTwist χ i),
      (∀ ⦃i j : ℕ⦄ (h : j ≤ i) (x : G),
        TauCeti.ZModTwist.reduce χ h ((f i : G → TauCeti.ZModTwist χ i) x) =
          (f j : G → TauCeti.ZModTwist χ j) x) ∧
      ∀ (i : ℕ) (k : ι),
        ((f i : G → TauCeti.ZModTwist χ i) (g k)).val = PadicInt.toZModPow i (c k) :=
  hG.hasPrescriptionProperty_iff_forall_exists_forall_reduce_eq_and_val_eq hfg b hgb χ

/-- **Layer 7, a free pro-`p` group has the prescription property for every character**: Tau
Ceti's `TauCeti.freeProP.hasPrescriptionProperty`. -/
example {X : Type u} [Finite X] (χ : TauCeti.freeProP p X →ₜ* ℤ_[p]ˣ) :
    TauCeti.HasPrescriptionProperty χ :=
  TauCeti.freeProP.hasPrescriptionProperty χ

end Prescription

section Character

/-- **Layer 7, the canonical character exists and is unique** (Labute Thm 4): Tau Ceti's
`TauCeti.IsDemushkin.existsUnique_hasPrescriptionProperty`. -/
theorem existsUnique_hasPrescriptionProperty {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsDemushkin p G) :
    ∃! χ : G →ₜ* ℤ_[p]ˣ, TauCeti.HasPrescriptionProperty χ :=
  hG.existsUnique_hasPrescriptionProperty

/-- **Layer 7, `TauCeti.demushkinCharacter` agrees with the roadmap's definition**, the chosen
witness of `existsUnique_hasPrescriptionProperty`. -/
example {p G} [Fact p.Prime] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsDemushkin p G) :
    TauCeti.demushkinCharacter hG = (existsUnique_hasPrescriptionProperty hG).exists.choose :=
  rfl

/-- **Layer 7, the canonical character is continuous**, being a continuous homomorphism. -/
theorem demushkinCharacter_continuous {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsDemushkin p G) : Continuous (TauCeti.demushkinCharacter hG) :=
  (TauCeti.demushkinCharacter hG).continuous

/-- **Layer 7, the canonical character has the prescription property**: Tau Ceti's
`TauCeti.hasPrescriptionProperty_demushkinCharacter`. -/
theorem demushkinCharacter_hasPrescriptionProperty {p G} [Fact p.Prime] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsDemushkin p G) :
    TauCeti.HasPrescriptionProperty (TauCeti.demushkinCharacter hG) :=
  TauCeti.hasPrescriptionProperty_demushkinCharacter hG

/-- **Layer 7, the canonical character is the only one**: Tau Ceti's
`TauCeti.HasPrescriptionProperty.eq_demushkinCharacter`. -/
theorem demushkinCharacter_unique {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsDemushkin p G) (χ : G →ₜ* ℤ_[p]ˣ) (hpres : TauCeti.HasPrescriptionProperty χ) :
    χ = TauCeti.demushkinCharacter hG :=
  hpres.eq_demushkinCharacter hG

/-- **Layer 7, the orientation image is a closed subgroup**: Tau Ceti's
`TauCeti.isClosed_range_demushkinCharacter`. -/
theorem demushkinCharacter_range_isClosed {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : TauCeti.IsDemushkin p G) :
    IsClosed (((TauCeti.demushkinCharacter hG).toMonoidHom.range : Subgroup ℤ_[p]ˣ) :
      Set ℤ_[p]ˣ) :=
  TauCeti.isClosed_range_demushkinCharacter hG

/-- **Layer 7, the orientation image is an isomorphism invariant**: Tau Ceti's
`TauCeti.range_demushkinCharacter_of_equiv`. -/
theorem demushkinCharacter_range_congr {p G H} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] [Group H]
    [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : TauCeti.IsDemushkin p G) (hH : TauCeti.IsDemushkin p H) (e : G ≃ₜ* H) :
    (TauCeti.demushkinCharacter hG).toMonoidHom.range =
      (TauCeti.demushkinCharacter hH).toMonoidHom.range :=
  (TauCeti.range_demushkinCharacter_of_equiv hG hH e).symm

variable {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 7, the canonical character is invariant under topological isomorphism**: Tau Ceti's
`TauCeti.demushkinCharacter_of_equiv`. -/
example {H : Type u} [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H]
    [TotallyDisconnectedSpace H] (hG : TauCeti.IsDemushkin p G) (hH : TauCeti.IsDemushkin p H)
    (e : G ≃ₜ* H) :
    TauCeti.demushkinCharacter hH = (TauCeti.demushkinCharacter hG).comp (e.symm : H →ₜ* G) :=
  TauCeti.demushkinCharacter_of_equiv hG hH e

/-- **Layer 7, `Im χ = 1 + qℤ_p` for `q ≠ 2`.** For `q = p^s ≠ 2` the image is the principal-unit
group `1 + p^s ℤ_p` (`TauCeti.range_demushkinCharacter_eq_unitsPrincipal`), and for `q = 0` it is
trivial (`TauCeti.range_demushkinCharacter_eq_bot_iff`). -/
example (hG : TauCeti.IsDemushkin p G) {s : ℕ} (hs : TauCeti.demushkinQ hG = p ^ s)
    (h2 : TauCeti.demushkinQ hG ≠ 2) :
    (TauCeti.demushkinCharacter hG).toMonoidHom.range = TauCeti.unitsPrincipal p s :=
  TauCeti.range_demushkinCharacter_eq_unitsPrincipal hG hs h2

/-- **Layer 7, `Im χ = 1 + 0 ℤ_p = 1` exactly when `q = 0`**: Tau Ceti's
`TauCeti.range_demushkinCharacter_eq_bot_iff`. -/
example (hG : TauCeti.IsDemushkin p G) :
    ((TauCeti.demushkinCharacter hG : G →* ℤ_[p]ˣ)).range = ⊥ ↔ TauCeti.demushkinQ hG = 0 :=
  TauCeti.range_demushkinCharacter_eq_bot_iff hG

/-- **Layer 7, for `q = 2` the image is one of three kinds**: `{±1}`, `V^(f)`, or `U^[f]`: Tau
Ceti's `TauCeti.IsDemushkin.range_demushkinCharacter_trichotomy_of_demushkinQ_eq_two`. -/
example (hG : TauCeti.IsDemushkin 2 G) (hq : TauCeti.demushkinQ hG = 2) :
    (TauCeti.demushkinCharacter hG).toMonoidHom.range = Subgroup.zpowers (-1 : ℤ_[2]ˣ) ∨
      (∃ f : ℕ, 2 ≤ f ∧
        (TauCeti.demushkinCharacter hG).toMonoidHom.range = TauCeti.unitsPlusMinus f) ∨
      ∃ (f : ℕ) (u : ℤ_[2]ˣ), 2 ≤ f ∧ (u : ℤ_[2]) = -1 + (2 : ℤ_[2]) ^ f ∧
        (TauCeti.demushkinCharacter hG).toMonoidHom.range =
          (Subgroup.zpowers u).topologicalClosure :=
  hG.range_demushkinCharacter_trichotomy_of_demushkinQ_eq_two hq

end Character

section UnitsTwo

/-- **Layer 7, the closed subgroups of `ℤ₂ˣ`: exhaustiveness.** Every nontrivial closed subgroup is
`U^(f)`, `V^(f)` (`f < ∞`), `V^(∞) = {±1}`, or `U^[f]`: Tau Ceti's
`TauCeti.closedSubgroup_units_two_classification`. -/
theorem closedSubgroup_units_two_trichotomy (A : Subgroup ℤ_[2]ˣ)
    (hA : IsClosed (A : Set ℤ_[2]ˣ)) (hA1 : A ≠ ⊥) :
    (∃ f : ℕ, 2 ≤ f ∧ A = TauCeti.unitsPrincipal 2 f) ∨
      (∃ f : ℕ, 2 ≤ f ∧ A = TauCeti.unitsPlusMinus f) ∨
      A = Subgroup.zpowers (-1 : ℤ_[2]ˣ) ∨
      (∃ (f : ℕ) (u : ℤ_[2]ˣ),
        2 ≤ f ∧ (u : ℤ_[2]) = -1 + 2 ^ f ∧ A = (Subgroup.zpowers u).topologicalClosure) :=
  TauCeti.closedSubgroup_units_two_classification hA hA1

/-- **Layer 7, uniqueness of the level of `U^(f)`**: Tau Ceti's `TauCeti.unitsPrincipal_inj`. -/
theorem closedSubgroup_units_two_level_unique {f f' : ℕ} (hf : 2 ≤ f) (hf' : 2 ≤ f')
    (h : TauCeti.unitsPrincipal 2 f = TauCeti.unitsPrincipal 2 f') : f = f' :=
  (TauCeti.unitsPrincipal_inj (p := 2) (by omega) (by omega)).mp h

/-- **Layer 7, uniqueness of the level of `V^(f)`**: Tau Ceti's `TauCeti.unitsPlusMinus_inj`. -/
example {f f' : ℕ} (hf : 2 ≤ f) (hf' : 2 ≤ f') :
    TauCeti.unitsPlusMinus f = TauCeti.unitsPlusMinus f' ↔ f = f' :=
  TauCeti.unitsPlusMinus_inj hf hf'

/-- **Layer 7, uniqueness of the level of `U^[f]`**: Tau Ceti's
`TauCeti.topologicalClosure_zpowers_two_eq_iff`, read at the generators `-1 + 2^f`
(`TauCeti.neg_mem_unitsPrincipal_two_of_val_eq`,
`TauCeti.neg_notMem_unitsPrincipal_two_succ_of_val_eq`). -/
example {f f' : ℕ} (hf : 2 ≤ f) (hf' : 2 ≤ f') {u v : ℤ_[2]ˣ}
    (hu : (u : ℤ_[2]) = -1 + 2 ^ f) (hv : (v : ℤ_[2]) = -1 + 2 ^ f') :
    (Subgroup.zpowers u).topologicalClosure = (Subgroup.zpowers v).topologicalClosure ↔
      f = f' :=
  TauCeti.topologicalClosure_zpowers_two_eq_iff hf hf'
    (TauCeti.neg_mem_unitsPrincipal_two_of_val_eq hu)
    (TauCeti.neg_notMem_unitsPrincipal_two_succ_of_val_eq hu)
    (TauCeti.neg_mem_unitsPrincipal_two_of_val_eq hv)
    (TauCeti.neg_notMem_unitsPrincipal_two_succ_of_val_eq hv)

/-- **Layer 7, the families are pairwise distinct**: Tau Ceti's
`TauCeti.unitsPrincipal_ne_unitsPlusMinus`, `TauCeti.unitsPrincipal_ne_zpowers_neg_one`,
`TauCeti.unitsPlusMinus_ne_zpowers_neg_one`, `TauCeti.unitsPrincipal_ne_topologicalClosure_zpowers`,
`TauCeti.unitsPlusMinus_ne_topologicalClosure_zpowers` and
`TauCeti.zpowers_neg_one_ne_topologicalClosure_zpowers`. -/
example {f g : ℕ} (hf : 2 ≤ f) (hg : 2 ≤ g) {u : ℤ_[2]ˣ} (hu : (u : ℤ_[2]) = -1 + 2 ^ g) :
    TauCeti.unitsPrincipal 2 f ≠ TauCeti.unitsPlusMinus g ∧
      TauCeti.unitsPrincipal 2 f ≠ Subgroup.zpowers (-1) ∧
      TauCeti.unitsPlusMinus f ≠ Subgroup.zpowers (-1) ∧
      TauCeti.unitsPrincipal 2 f ≠ (Subgroup.zpowers u).topologicalClosure ∧
      TauCeti.unitsPlusMinus f ≠ (Subgroup.zpowers u).topologicalClosure ∧
      Subgroup.zpowers (-1 : ℤ_[2]ˣ) ≠ (Subgroup.zpowers u).topologicalClosure := by
  have h1 := TauCeti.neg_mem_unitsPrincipal_two_of_val_eq hu
  have h2 := TauCeti.neg_notMem_unitsPrincipal_two_succ_of_val_eq hu
  exact ⟨TauCeti.unitsPrincipal_ne_unitsPlusMinus hf g,
    TauCeti.unitsPrincipal_ne_zpowers_neg_one hf,
    TauCeti.unitsPlusMinus_ne_zpowers_neg_one f,
    TauCeti.unitsPrincipal_ne_topologicalClosure_zpowers hf
      (TauCeti.unitsPrincipal_antitone 2 hg h1),
    TauCeti.unitsPlusMinus_ne_topologicalClosure_zpowers f hg h1 h2,
    TauCeti.zpowers_neg_one_ne_topologicalClosure_zpowers hg h1 h2⟩

/-- **Layer 7, procyclicity.** A closed subgroup of `ℤ₂ˣ` is procyclic exactly when it does not
contain `-1` together with a nontrivial element of `1 + 4ℤ₂`: Tau Ceti's
`TauCeti.exists_topologicalClosure_zpowers_eq_iff_of_isClosed`. -/
example (A : Subgroup ℤ_[2]ˣ) (hA : IsClosed (A : Set ℤ_[2]ˣ)) :
    (∃ u : ℤ_[2]ˣ, (Subgroup.zpowers u).topologicalClosure = A) ↔
      (-1 : ℤ_[2]ˣ) ∉ A ∨ A ⊓ TauCeti.unitsPrincipal 2 2 = ⊥ :=
  TauCeti.exists_topologicalClosure_zpowers_eq_iff_of_isClosed hA

/-- **Layer 7, `V^(f)` is not procyclic** for `f < ∞`: Tau Ceti's
`TauCeti.not_exists_topologicalClosure_zpowers_eq_unitsPlusMinus`. -/
example {f : ℕ} (hf : 2 ≤ f) :
    ¬ ∃ u : ℤ_[2]ˣ, (Subgroup.zpowers u).topologicalClosure = TauCeti.unitsPlusMinus f :=
  TauCeti.not_exists_topologicalClosure_zpowers_eq_unitsPlusMinus hf

/-- **Layer 7, the indices.** `profiniteIndex U^(f) = 2^{f-1}`, `profiniteIndex V^(f) = 2^{f-2}`
and `profiniteIndex U^[f] = 2^{f-1}`: Tau Ceti's `TauCeti.profiniteIndex_unitsPrincipal_two`,
`TauCeti.profiniteIndex_unitsPlusMinus` and `TauCeti.profiniteIndex_topologicalClosure_zpowers_two`.
-/
example {f : ℕ} (hf : 2 ≤ f) {u : ℤ_[2]ˣ} (hu : (u : ℤ_[2]) = -1 + 2 ^ f) :
    Subgroup.profiniteIndex (TauCeti.unitsPrincipal 2 f) =
        TauCeti.Supernatural.primePower (⟨2, Nat.prime_two⟩ : Nat.Primes) ((f - 1 : ℕ) : ℕ∞) ∧
      Subgroup.profiniteIndex (TauCeti.unitsPlusMinus f) =
        TauCeti.Supernatural.primePower (⟨2, Nat.prime_two⟩ : Nat.Primes) ((f - 2 : ℕ) : ℕ∞) ∧
      Subgroup.profiniteIndex (Subgroup.zpowers u).topologicalClosure =
        TauCeti.Supernatural.primePower (⟨2, Nat.prime_two⟩ : Nat.Primes) ((f - 1 : ℕ) : ℕ∞) :=
  ⟨TauCeti.profiniteIndex_unitsPrincipal_two f, TauCeti.profiniteIndex_unitsPlusMinus hf,
    TauCeti.profiniteIndex_topologicalClosure_zpowers_two hf
      (TauCeti.neg_mem_unitsPrincipal_two_of_val_eq hu)
      (TauCeti.neg_notMem_unitsPrincipal_two_succ_of_val_eq hu)⟩

/-- **Layer 7, the even part of `U^[f]`.** `U^[f] ∩ (1 + 4ℤ₂) = U^(f+1)`: Tau Ceti's
`TauCeti.topologicalClosure_zpowers_inf_unitsPrincipal_two_of_val_eq`. -/
example (f : ℕ) (hf : 2 ≤ f) (u : ℤ_[2]ˣ) (hu : (u : ℤ_[2]) = -1 + 2 ^ f) :
    (Subgroup.zpowers u).topologicalClosure ⊓ TauCeti.unitsPrincipal 2 2 =
      TauCeti.unitsPrincipal 2 (f + 1) :=
  TauCeti.topologicalClosure_zpowers_inf_unitsPrincipal_two_of_val_eq hf hu

/-- **Layer 7, `(A : A²)`.** It is `2` for `U^(f)` and for `U^[f]`, and `4` for `V^(f)`: Tau Ceti's
`TauCeti.relIndex_map_powMonoidHom_unitsPrincipal`,
`TauCeti.relIndex_map_powMonoidHom_two_topologicalClosure_zpowers_two` and
`TauCeti.relIndex_map_powMonoidHom_two_unitsPlusMinus`. -/
example {f : ℕ} (hf : 2 ≤ f) {u : ℤ_[2]ˣ} (hu : (u : ℤ_[2]) = -1 + 2 ^ f) :
    ((TauCeti.unitsPrincipal 2 f).map (powMonoidHom 2)).relIndex (TauCeti.unitsPrincipal 2 f) =
        2 ∧
      ((Subgroup.zpowers u).topologicalClosure.map (powMonoidHom 2)).relIndex
          (Subgroup.zpowers u).topologicalClosure = 2 ∧
      ((TauCeti.unitsPlusMinus f).map (powMonoidHom 2)).relIndex (TauCeti.unitsPlusMinus f) =
        4 :=
  ⟨TauCeti.relIndex_map_powMonoidHom_unitsPrincipal (by omega) fun _ ↦ hf,
    TauCeti.relIndex_map_powMonoidHom_two_topologicalClosure_zpowers_two hf
      (TauCeti.neg_mem_unitsPrincipal_two_of_val_eq hu)
      (TauCeti.neg_notMem_unitsPrincipal_two_succ_of_val_eq hu),
    TauCeti.relIndex_map_powMonoidHom_two_unitsPlusMinus hf⟩

variable {p : ℕ} [Fact p.Prime]

/-- **Layer 7, odd `p`: `ℤ_pˣ ≅ μ_{p-1} × (1 + pℤ_p)`**: Tau Ceti's
`TauCeti.padicIntUnitsEquivProd`. -/
example : Nonempty (ℤ_[p]ˣ ≃ₜ*
    (rootsOfUnity (p - 1) ℤ_[p]) × TauCeti.unitsPrincipal p 1) :=
  ⟨TauCeti.padicIntUnitsEquivProd p⟩

/-- **Layer 7, odd `p`: the nontrivial closed subgroups of `1 + pℤ_p` are the `1 + p^fℤ_p`**: Tau
Ceti's `TauCeti.exists_eq_unitsPrincipal_of_isClosed`. -/
example (hp : p ≠ 2) {A : Subgroup ℤ_[p]ˣ} (hA : IsClosed (A : Set ℤ_[p]ˣ))
    (hle : A ≤ TauCeti.unitsPrincipal p 1) (hA' : A ≠ ⊥) :
    ∃ f, 1 ≤ f ∧ A = TauCeti.unitsPrincipal p f :=
  TauCeti.exists_eq_unitsPrincipal_of_isClosed one_pos (fun h ↦ absurd h hp) hA hle hA'

open ValuativeRel IsNonarchimedeanLocalField in
/-- **Layer 7, odd `p`: the logarithm on `1 + pℤ_p`.** For odd `p` the logarithm series,
restricted to the principal units `U(ℚ_p, 1) = 1 + pℤ_p`, is an isomorphism of topological groups
onto the additive group `pℤ_p = 𝓂^1`, with the exponential as inverse: Tau Ceti's
`TauCeti.deepUnitExpLogEquiv` at `K = ℚ_p`, `i = 1`, whose depth condition `e < (p - 1) i` reads
`1 < p - 1`. The restriction of the domain is in the type. -/
example (hp : p ≠ 2) :
    ∃ e : TauCeti.unitFiltration ℚ_[p] 1 ≃ₜ*
        Multiplicative (𝓂[ℚ_[p]] ^ 1 : Ideal 𝒪[ℚ_[p]]),
      ∀ u, (((e u).toAdd : 𝒪[ℚ_[p]]) : ℚ_[p]) = NormedSpace.log ((u : ℚ_[p]ˣ) : ℚ_[p]) := by
  have hi : TauCeti.absoluteRamificationIndex ℚ_[p] p < (p - 1) * 1 := by
    rw [TauCeti.absoluteRamificationIndex_padic]
    have := (Fact.out : p.Prime).two_le
    omega
  exact ⟨TauCeti.deepUnitExpLogEquiv ℚ_[p] hi, TauCeti.coe_deepUnitExpLogEquiv_apply hi⟩

/-- **Layer 7, odd `p`: `1 + pℤ_p` inside `ℤ_pˣ` is a copy of `ℤ_p`**, by the `p`-adic power map
`l ↦ w ^ l` of a unit `w` of exact level `1`: Tau Ceti's `TauCeti.principalUnitsEquiv`. -/
example (hp : p ≠ 2) : Nonempty (Multiplicative ℤ_[p] ≃ₜ* TauCeti.unitsPrincipal p 1) := by
  obtain ⟨w, hw, hw'⟩ := TauCeti.exists_mem_unitsPrincipal_and_notMem_succ_of_pos p one_pos
  exact ⟨TauCeti.principalUnitsEquiv one_pos (fun h ↦ absurd h hp) hw hw'⟩

/-- **Layer 7, the image table, `q ≠ 2`**: the orientation of the normal form
`x₁^q (x₁, x₂) ⋯ (x_{n-1}, x_n)` with `χ(x₂) = (1 - q)⁻¹` has image `1 + qℤ_p`: Tau Ceti's
`TauCeti.range_orientationNeTwo_eq_unitsPrincipal`. -/
example (q n : ℕ) (u : ℤ_[p]ˣ) (hu : u ∈ TauCeti.unitsPrincipal p 1) (hn : 1 < n) {f : ℕ}
    (hq : q = p ^ f) (hf : 0 < f) (hf₂ : p = 2 → 2 ≤ f)
    (hu' : (u : ℤ_[p]) * (1 - (q : ℤ_[p])) = 1) :
    (TauCeti.orientationNeTwo q n u hu).toMonoidHom.range = TauCeti.unitsPrincipal p f :=
  TauCeti.range_orientationNeTwo_eq_unitsPrincipal q n u hu hn hq hf hf₂ hu'

/-- **Layer 7, the image table, `q = 2`, `n` odd**: images `V^(f)` and `{±1}`: Tau Ceti's
`TauCeti.range_orientationTwoOdd_eq_unitsPlusMinus` and `TauCeti.range_orientationTwoOddTop`. -/
example (f n : ℕ) (u : ℤ_[2]ˣ) (hn : 2 < n) (hf : 2 ≤ f)
    (hu : (u : ℤ_[2]) * (1 - (2 : ℤ_[2]) ^ f) = 1) :
    (TauCeti.orientationTwoOdd f n u).toMonoidHom.range = TauCeti.unitsPlusMinus f ∧
      (TauCeti.orientationTwoOddTop n).toMonoidHom.range = Subgroup.zpowers (-1 : ℤ_[2]ˣ) :=
  ⟨TauCeti.range_orientationTwoOdd_eq_unitsPlusMinus f n u hn hf hu,
    TauCeti.range_orientationTwoOddTop n (by omega)⟩

/-- **Layer 7, the image table, `q = 2`, `n` even**: the image is the closed subgroup generated by
the two marked values, which is `V^(f)` when `2^f ∣ a`: Tau Ceti's
`TauCeti.range_orientationTwoEven` and `TauCeti.range_orientationTwoEven_eq_unitsPlusMinus_of_dvd`.
-/
example (a f n : ℕ) (v u : ℤ_[2]ˣ) (hn : 3 < n) (hf : 2 ≤ f)
    (hv : (v : ℤ_[2]) * (1 + (a : ℤ_[2])) = -1) (hu : (u : ℤ_[2]) * (1 - (2 : ℤ_[2]) ^ f) = 1)
    (ha : (2 : ℤ_[2]) ^ f ∣ (a : ℤ_[2])) :
    (TauCeti.orientationTwoEven a f n v u).toMonoidHom.range =
        (Subgroup.zpowers v ⊔ Subgroup.zpowers u).topologicalClosure ∧
      (TauCeti.orientationTwoEven a f n v u).toMonoidHom.range = TauCeti.unitsPlusMinus f :=
  ⟨TauCeti.range_orientationTwoEven a f n v u hn,
    TauCeti.range_orientationTwoEven_eq_unitsPlusMinus_of_dvd a f n v u hn hf hv hu ha⟩

/-- **Layer 7, the image table, `q = 2`, rank `2`**: Tau Ceti's
`TauCeti.range_orientationTwoRankTwo`. -/
example (a : ℕ) (v : ℤ_[2]ˣ) :
    (TauCeti.orientationTwoRankTwo a v).toMonoidHom.range =
      (Subgroup.zpowers v).topologicalClosure :=
  TauCeti.range_orientationTwoRankTwo a v

end UnitsTwo

section Duality

variable {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 7, the trace isomorphism.** A nonzero `ω ∈ H²(G, 𝔽_p)` determines
`tr : H²(G, 𝔽_p) ≅ 𝔽_p` with `tr ω = 1`, uniquely, and rescaling `ω` by `a ∈ 𝔽_pˣ` rescales `tr`
by `a⁻¹`: Tau Ceti's `TauCeti.IsDemushkin.traceEquiv`, `traceEquiv_apply_self`, `traceEquiv_unique`
and `traceEquiv_smul`. -/
example (hG : TauCeti.IsDemushkin p G) (ω : TauCeti.cohomFp p G 2) (hω : ω ≠ 0) :
    hG.traceEquiv ω hω ω = 1 ∧
      (∀ φ : TauCeti.cohomFp p G 2 →ₗ[ZMod p] ZMod p, φ ω = 1 →
        φ = (hG.traceEquiv ω hω).toLinearMap) ∧
      ∀ a : (ZMod p)ˣ, hG.traceEquiv ((a : ZMod p) • ω) (smul_ne_zero a.ne_zero hω) =
        (hG.traceEquiv ω hω).trans ((a⁻¹).mulLeftLinearEquiv (ZMod p) (ZMod p)) :=
  ⟨hG.traceEquiv_apply_self ω hω, hG.traceEquiv_unique ω hω, hG.traceEquiv_smul ω hω⟩

/-- **Layer 7, `H²(G, I(χ)/pⁱ) ≅ ℤ/pⁱ`** for the canonical character of an infinite Demushkin
group: Tau Ceti's `TauCeti.IsDemushkin.nonempty_addEquiv_H2_zModTwist_demushkinCharacter_zmod`. -/
example [Infinite G] (hG : TauCeti.IsDemushkin p G) (i : ℕ) :
    Nonempty (H2 G (TauCeti.ZModTwist (TauCeti.demushkinCharacter hG) i) ≃+ ZMod (p ^ i)) :=
  hG.nonempty_addEquiv_H2_zModTwist_demushkinCharacter_zmod i

/-- **Layer 7, the perfect pairings.** For an infinite Demushkin group, `i ≥ 0`, and a finite
discrete module `M` killed by `pⁱ`, the cup pairings
`Hʲ(G, M) × H²⁻ʲ(G, Hom(M, I(χ)/pⁱ)) → H²(G, I(χ)/pⁱ)` are perfect for `j = 0, 1, 2`, in the form
that each duality map `Hʲ(G, M) → Hom(H²⁻ʲ(G, M^∨(χ)), H²(G, I(χ)/pⁱ))` is bijective: Tau Ceti's
`TauCeti.IsDemushkin.dualityMap0_zModTwist_bijective`, `dualityMap1_zModTwist_bijective` and
`dualityMap2_zModTwist_bijective`. -/
example [Infinite G] (hG : TauCeti.IsDemushkin p G) (i : ℕ) (M : Type u) [AddCommGroup M]
    [TopologicalSpace M] [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M]
    [Finite M] (hM : ∀ x : M, p ^ i • x = 0) :
    Function.Bijective
        (dualityMap0 G M (TauCeti.ZModTwist (TauCeti.demushkinCharacter hG) i)) ∧
      Function.Bijective
        (dualityMap1 G M (TauCeti.ZModTwist (TauCeti.demushkinCharacter hG) i)) ∧
      Function.Bijective
        (dualityMap2 G M (TauCeti.ZModTwist (TauCeti.demushkinCharacter hG) i)) :=
  ⟨hG.dualityMap0_zModTwist_bijective i M hM, hG.dualityMap1_zModTwist_bijective i M hM,
    hG.dualityMap2_zModTwist_bijective i M hM⟩

/-- **Layer 7, the role of the character.** The transition maps of `(I(χ)/pⁱ)ᵢ` are
`G`-equivariant, being `TauCeti.ZModTwist.reduce χ h : I(χ)/pⁱ →+[G] I(χ)/pʲ`, and on
`Hom(M, I(χ)/pⁱ)` for a trivial module `M`, such as `𝔽_p`, `G` acts by `χ` modulo `pⁱ`. This
combines `TauCeti.InternalHom.toAddMonoidHom_smul`, `TauCeti.homAction_apply` and
`TauCeti.ZModTwist.val_smul`. -/
example (χ : G →ₜ* ℤ_[p]ˣ) (i : ℕ) (M : Type u) [AddCommGroup M] [DistribMulAction G M]
    (htriv : ∀ (g : G) (m : M), g • m = m)
    (φ : TauCeti.InternalHom G M (TauCeti.ZModTwist χ i)) (g : G) (m : M) :
    ((g • φ).toAddMonoidHom m).val =
      PadicInt.toZModPow i (χ g : ℤ_[p]) * (φ.toAddMonoidHom m).val := by
  rw [TauCeti.InternalHom.toAddMonoidHom_smul, TauCeti.homAction_apply, htriv,
    TauCeti.ZModTwist.val_smul, TauCeti.charScalar_apply]

end Duality

section Naturality

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (M : Type u) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction G M] [ContinuousSMul G M] [Finite M]
  (N : Type u) [AddCommGroup N] [TopologicalSpace N] [DiscreteTopology N]
    [DistribMulAction G N] [ContinuousSMul G N]
  (U : Subgroup G)

/-- **Layer 7, naturality of the pairing with restriction**:
`res ⟨a, b⟩_G = ⟨res a, res b⟩_U`. Tau Ceti's
`TauCeti.ContCohomology.explicitRes2_explicitDualityPairing11`. -/
example (a : H1 G (TauCeti.InternalHom G M N)) (b : H1 G M) :
    explicitRes2 G N U (explicitDualityPairing11 G M N a b) =
      explicitDualityPairing11 U M N
        (explicitCoeff1 U (TauCeti.InternalHom G M N) (TauCeti.InternalHom.restrict U)
          continuous_of_discreteTopology (explicitRes1 G (TauCeti.InternalHom G M N) U a))
        (explicitRes1 G M U b) :=
  explicitRes2_explicitDualityPairing11 G M N U a b

/-- **Layer 7, naturality of the pairing with corestriction**, the projection formula
`cor ⟨res a, b⟩_U = ⟨a, cor b⟩_G` for an open subgroup: Tau Ceti's
`TauCeti.ContCohomology.explicitDualityPairing11_projection`; the degree `(0, 2)` and `(2, 0)` forms
are `explicitDualityPairing02_projection` and `explicitDualityPairing20_projection`. -/
example [U.FiniteIndex] (hU : IsOpen (U : Set G)) (a : H1 G (TauCeti.InternalHom G M N))
    (b : H1 U M) :
    explicitCor2 G N U hU
        (explicitDualityPairing11 U M N
          (explicitCoeff1 U (TauCeti.InternalHom G M N) (TauCeti.InternalHom.restrict U)
            continuous_of_discreteTopology (explicitRes1 G (TauCeti.InternalHom G M N) U a)) b) =
      explicitDualityPairing11 G M N a (explicitCor1 G M U hU b) :=
  explicitDualityPairing11_projection G M N U hU a b

end Naturality

section OpenSubgroup

variable {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 7, the three-term Euler formula.** For `G` topologically finitely generated pro-`p`
with `cd_p G ≤ 2`, `H²(G, 𝔽_p)` finite-dimensional, and `U` open, the three spaces `Hⁱ(U, 𝔽_p)` are
finite-dimensional and `Σᵢ (-1)ⁱ dim Hⁱ(U, 𝔽_p) = [G : U] Σᵢ (-1)ⁱ dim Hⁱ(G, 𝔽_p)` in `ℤ`. Tau
Ceti's `TauCeti.CohomologicalDimensionLE.one_sub_topologicalGeneratorRankNat_add_finrank_H2`, read
through `TauCeti.cohomFpLinearEquivH2`, `TauCeti.IsProP.finrank_cohomFp_one` and
`TauCeti.cohomFpZeroLinearEquiv`; finiteness for `U` is
`TauCeti.IsProP.finite_cohomFp_openSubgroup`.
`H⁰` and `H¹` of `G` are finite-dimensional by `TauCeti.IsProP.finite_cohomFp_one_iff`, so only
`H²` is a hypothesis. -/
example (hG : TauCeti.IsProP p G) (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
    (hcd : TauCeti.cohomologicalDimensionAt.{u} p G ≤ 2)
    (h2 : Module.Finite (ZMod p) (TauCeti.cohomFp p G 2)) (U : OpenSubgroup G) :
    Module.Finite (ZMod p) (TauCeti.cohomFp p U.toSubgroup 0) ∧
      Module.Finite (ZMod p) (TauCeti.cohomFp p U.toSubgroup 1) ∧
      Module.Finite (ZMod p) (TauCeti.cohomFp p U.toSubgroup 2) ∧
      (Module.finrank (ZMod p) (TauCeti.cohomFp p U.toSubgroup 0) : ℤ) -
          Module.finrank (ZMod p) (TauCeti.cohomFp p U.toSubgroup 1) +
          Module.finrank (ZMod p) (TauCeti.cohomFp p U.toSubgroup 2) =
        U.toSubgroup.index * ((Module.finrank (ZMod p) (TauCeti.cohomFp p G 0) : ℤ) -
          Module.finrank (ZMod p) (TauCeti.cohomFp p G 1) +
          Module.finrank (ZMod p) (TauCeti.cohomFp p G 2)) := by
  let := TauCeti.trivialZModAction p G
  have : ContinuousSMul G (ZMod p) := ⟨continuous_snd⟩
  have htriv : ∀ (g : G) (x : ZMod p), g • x = x := fun _ _ ↦ rfl
  have : CompactSpace U.toSubgroup := isCompact_iff_compactSpace.mp U.isClosed.isCompact
  have hU : TauCeti.IsProP p U.toSubgroup := hG.subgroup _
  have hUfg := hfg.of_openSubgroup U
  have : Finite (TauCeti.cohomFp p G 2) := Module.finite_of_finite (ZMod p)
  have : Finite (H2 G (ZMod p)) :=
    Finite.of_equiv _ (TauCeti.cohomFpAddEquivH2 p G htriv).toEquiv
  have hU2 : Finite (TauCeti.cohomFp p U.toSubgroup 2) := hG.finite_cohomFp_openSubgroup U
  have hcd' : TauCeti.CohomologicalDimensionLE.{u} p G 2 :=
    (TauCeti.cohomologicalDimensionAt_le_iff p G 2).1 (by exact_mod_cast hcd)
  have h := TauCeti.CohomologicalDimensionLE.one_sub_topologicalGeneratorRankNat_add_finrank_H2
    hG hfg htriv hcd' U
  refine ⟨inferInstance, hU.finite_cohomFp_one_iff.2 hUfg, Module.Finite.of_finite, ?_⟩
  rw [(TauCeti.cohomFpZeroLinearEquiv p G).finrank_eq,
    (TauCeti.cohomFpZeroLinearEquiv p U.toSubgroup).finrank_eq, Module.finrank_self,
    hG.finrank_cohomFp_one hfg, hU.finrank_cohomFp_one hUfg,
    (TauCeti.cohomFpLinearEquivH2 p G htriv).finrank_eq,
    (TauCeti.cohomFpLinearEquivH2 p U.toSubgroup fun u x ↦ htriv u x).finrank_eq]
  exact_mod_cast h

variable [Infinite G]

/-- **Layer 7, the open-subgroup theorem.** An open subgroup of an infinite Demushkin group is
Demushkin, `n(U) - 2 = [G : U](n(G) - 2)` in `ℤ`, and the canonical character of `U` is the
restriction of that of `G`: Tau Ceti's `TauCeti.IsDemushkin.openSubgroup`,
`TauCeti.IsDemushkin.demushkinRank_openSubgroup_sub_two` and
`TauCeti.IsDemushkin.demushkinCharacter_openSubgroup`. -/
example (hG : TauCeti.IsDemushkin p G) (U : OpenSubgroup G) :
    ∃ hU : TauCeti.IsDemushkin p U.toSubgroup,
      (TauCeti.demushkinRank hU : ℤ) - 2 =
          U.toSubgroup.index * ((TauCeti.demushkinRank hG : ℤ) - 2) ∧
        TauCeti.demushkinCharacter hU =
          (TauCeti.demushkinCharacter hG).comp
            (TauCeti.ContinuousMonoidHom.subgroupSubtype U.toSubgroup) :=
  ⟨hG.openSubgroup U, hG.demushkinRank_openSubgroup_sub_two U,
    hG.demushkinCharacter_openSubgroup U⟩

end OpenSubgroup

section Recognition

variable {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
  (hG : TauCeti.IsProP p G) (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
  (hn : 1 < TauCeti.topologicalGeneratorRankNat G hfg)

include hG hn in
/-- **Layer 7, recognition through `dim H²`.** For a topologically finitely generated pro-`p` group
with `n(G) > 1`, `G` is Demushkin exactly when `cd_p G = 2` and `dim H²(N, 𝔽_p) = 1` for every open
normal `N`: Tau Ceti's `TauCeti.isDemushkin_iff_finrank_cohomFp_two_openSubgroup`, which does not
assume the one-relator hypothesis. -/
example : TauCeti.IsDemushkin p G ↔ TauCeti.cohomologicalDimensionAt.{u} p G = 2 ∧
    ∀ N : OpenSubgroup G, (N : Subgroup G).Normal →
      Module.finrank (ZMod p) (TauCeti.cohomFp p (N : Subgroup G) 2) = 1 :=
  TauCeti.isDemushkin_iff_finrank_cohomFp_two_openSubgroup hG hfg hn

include hG hn in
/-- **Layer 7, recognition through the ranks.** For a topologically finitely generated pro-`p`
group with `n(G) > 1`, `G` is Demushkin exactly when `cd_p G = 2` and
`n(N) - 2 = [G : N](n(G) - 2)` for every open normal `N`: Tau Ceti's
`TauCeti.isDemushkin_iff_topologicalGeneratorRankNat_openSubgroup`. -/
example (h2 : Module.finrank (ZMod p) (TauCeti.cohomFp p G 2) = 1) :
    TauCeti.IsDemushkin p G ↔ TauCeti.cohomologicalDimensionAt.{u} p G = 2 ∧
      ∀ N : OpenSubgroup G, (N : Subgroup G).Normal →
        (TauCeti.topologicalGeneratorRankNat (N : Subgroup G) (hfg.of_openSubgroup N) : ℤ) - 2 =
          (N : Subgroup G).index * ((TauCeti.topologicalGeneratorRankNat G hfg : ℤ) - 2) :=
  TauCeti.isDemushkin_iff_topologicalGeneratorRankNat_openSubgroup hG hfg h2 hn

include hG hn in
/-- **Layer 7, recognition through `dim H²`, sharpened to index `p`**: Tau Ceti's
`TauCeti.isDemushkin_iff_finrank_cohomFp_two_openSubgroup_index_eq`. -/
example (h2 : Module.finrank (ZMod p) (TauCeti.cohomFp p G 2) = 1) :
    TauCeti.IsDemushkin p G ↔ TauCeti.cohomologicalDimensionAt.{u} p G = 2 ∧
      ∀ N : OpenSubgroup G, (N : Subgroup G).Normal → (N : Subgroup G).index = p →
        Module.finrank (ZMod p) (TauCeti.cohomFp p (N : Subgroup G) 2) = 1 :=
  TauCeti.isDemushkin_iff_finrank_cohomFp_two_openSubgroup_index_eq hG hfg h2 hn

include hG hn in
/-- **Layer 7, recognition through the ranks, sharpened to index `p`**: Tau Ceti's
`TauCeti.isDemushkin_iff_topologicalGeneratorRankNat_openSubgroup_index_eq`. -/
example (h2 : Module.finrank (ZMod p) (TauCeti.cohomFp p G 2) = 1) :
    TauCeti.IsDemushkin p G ↔ TauCeti.cohomologicalDimensionAt.{u} p G = 2 ∧
      ∀ N : OpenSubgroup G, (N : Subgroup G).Normal → (N : Subgroup G).index = p →
        (TauCeti.topologicalGeneratorRankNat (N : Subgroup G) (hfg.of_openSubgroup N) : ℤ) - 2 =
          p * ((TauCeti.topologicalGeneratorRankNat G hfg : ℤ) - 2) :=
  TauCeti.isDemushkin_iff_topologicalGeneratorRankNat_openSubgroup_index_eq hG hfg h2 hn

end Recognition

end Layers6And7

section Layer8AndPrerequisites



/-! ## Layer 8: the graded pieces of the lower `p`-series

`gr_k(G) = λ_k / λ_{k+1}` is Tau Ceti's `TauCeti.gradedPiece p G k`, the quotient of consecutive
terms of the lower `p`-series written additively, with its `ZMod p`-module structure
`TauCeti.instModuleZModGradedPiece`. The class of an element of `λ_k` is `TauCeti.gradedMk`; the
bracket `gr_j × gr_k → gr_{j+k+1}` is the biadditive `TauCeti.gradedBracket`, with its
`𝔽_p`-bilinear form `TauCeti.gradedBracketLinear`; the `p`-power operator `π : gr_k → gr_{k+1}` is
`TauCeti.gradedPow`; the transport between equal degrees is `TauCeti.gradedCast`; and the graded
map of a continuous homomorphism is `TauCeti.gradedMap`. -/

section Graded

open scoped commutatorElement

variable {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 8, the graded pieces are elementary abelian.** Every element is killed by `p`, which
is what makes `gr_k(G)` an `𝔽_p`-vector space; no pro-`p` hypothesis is needed. -/
example (k : ℕ) (x : TauCeti.gradedPiece p G k) : p • x = 0 :=
  TauCeti.nsmul_gradedPiece_eq_zero x

/-- **Layer 8, finiteness is conditional.** For a prime `p` and a topologically finitely
generated profinite `G` every `gr_k(G)` is finite, because `λ_{k+1}` is open:
`TauCeti.IsTopologicallyFinitelyGenerated.finite_gradedPiece`. -/
example [Fact p.Prime] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) (k : ℕ) :
    Finite (TauCeti.gradedPiece p G k) :=
  TauCeti.IsTopologicallyFinitelyGenerated.finite_gradedPiece hfg Fact.out k

/-- **Layer 8, commutators and `p`-th powers raise the degree**, the two membership statements
that make the bracket and `π` well defined: `TauCeti.commutator_mem_pLowerCentralSeries` and
`TauCeti.pow_mem_pLowerCentralSeries`. -/
example {j k : ℕ} {x y : G} (hx : x ∈ TauCeti.pLowerCentralSeries p G j)
    (hy : y ∈ TauCeti.pLowerCentralSeries p G k) :
    ⁅x, y⁆ ∈ TauCeti.pLowerCentralSeries p G (j + k + 1) ∧
      x ^ p ∈ TauCeti.pLowerCentralSeries p G (j + 1) :=
  ⟨TauCeti.commutator_mem_pLowerCentralSeries hx hy, TauCeti.pow_mem_pLowerCentralSeries hx⟩

/-- **Layer 8, the bracket and `π` on classes.** The bracket of two classes is the class of the
commutator, and `π` of a class is the class of the `p`-th power: Tau Ceti's
`TauCeti.gradedBracket_gradedMk` and `TauCeti.gradedPow_gradedMk`. -/
example {j k : ℕ} (x : TauCeti.pLowerCentralSeries p G j)
    (y : TauCeti.pLowerCentralSeries p G k) :
    TauCeti.gradedBracket p G j k (TauCeti.gradedMk p G j x) (TauCeti.gradedMk p G k y) =
        TauCeti.gradedMk p G (j + k + 1)
          ⟨⁅(x : G), (y : G)⁆, TauCeti.commutator_mem_pLowerCentralSeries x.2 y.2⟩ ∧
      TauCeti.gradedPow p G j (TauCeti.gradedMk p G j x) =
        TauCeti.gradedMk p G (j + 1) ⟨(x : G) ^ p, TauCeti.pow_mem_pLowerCentralSeries x.2⟩ :=
  ⟨TauCeti.gradedBracket_gradedMk x y, TauCeti.gradedPow_gradedMk x⟩

/-- **Layer 8, the Lie laws of the bracket.** It is alternating, `[x, x] = 0`
(`TauCeti.gradedBracket_self`), and satisfies the Jacobi identity with the three terms
transported into the degree `i + j + k + 2` (`TauCeti.gradedBracket_jacobi`). -/
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

/-- **Layer 8, additivity of `π`, and its dyadic failure.** `π` is additive in every degree
`k ≥ 1` (`TauCeti.gradedPow_add_of_one_le`) and in degree zero for odd `p`
(`TauCeti.gradedPow_add_zero_of_odd`). At `p = 2` in degree zero the defect is exactly the
bracket, `π (x + y) = π x + π y + [x, y]` (`TauCeti.gradedPow_add_zero_of_two`), the case `p = 2`
of the general degree-zero formula `TauCeti.gradedPow_add_zero`. -/
example {k : ℕ} (hk : 1 ≤ k) (x y : TauCeti.gradedPiece p G k)
    (x₀ y₀ : TauCeti.gradedPiece p G 0) :
    TauCeti.gradedPow p G k (x + y) = TauCeti.gradedPow p G k x + TauCeti.gradedPow p G k y ∧
      (Odd p → TauCeti.gradedPow p G 0 (x₀ + y₀) =
        TauCeti.gradedPow p G 0 x₀ + TauCeti.gradedPow p G 0 y₀) ∧
      (p = 2 → TauCeti.gradedPow p G 0 (x₀ + y₀) =
        TauCeti.gradedPow p G 0 x₀ + TauCeti.gradedPow p G 0 y₀ +
          TauCeti.gradedBracket p G 0 0 x₀ y₀) ∧
      TauCeti.gradedPow p G 0 (x₀ + y₀) = TauCeti.gradedPow p G 0 x₀ +
        TauCeti.gradedPow p G 0 y₀ + p.choose 2 • TauCeti.gradedBracket p G 0 0 y₀ x₀ :=
  ⟨TauCeti.gradedPow_add_of_one_le hk x y, fun hp ↦ TauCeti.gradedPow_add_zero_of_odd hp x₀ y₀,
    fun hp ↦ TauCeti.gradedPow_add_zero_of_two hp x₀ y₀, TauCeti.gradedPow_add_zero x₀ y₀⟩

/-- **Layer 8, `π` commutes with scalars in degree zero**: `TauCeti.gradedPow_smul_zero`. -/
example [NeZero p] (c : ZMod p) (x : TauCeti.gradedPiece p G 0) :
    TauCeti.gradedPow p G 0 (c • x) = c • TauCeti.gradedPow p G 0 x :=
  TauCeti.gradedPow_smul_zero c x

/-- **Layer 8, the failure is not vacuous.** In the free pro-`2` group of rank `2` the bracket
of the two basis classes is nonzero in `gr_1` (`TauCeti.gradedBracket_freeProP_two_ne_zero`),
so `π` is not additive on `gr_0` (`TauCeti.gradedPow_freeProP_two_not_additive`). -/
example : (TauCeti.gradedBracket 2 (TauCeti.freeProP 2 (Fin 2)) 0 0
      (TauCeti.gradedMkZero 2 _ (TauCeti.freeProP.of 0))
      (TauCeti.gradedMkZero 2 _ (TauCeti.freeProP.of 1)) ≠ 0) ∧
    ¬ ∀ x y : TauCeti.gradedPiece 2 (TauCeti.freeProP 2 (Fin 2)) 0,
      TauCeti.gradedPow 2 (TauCeti.freeProP 2 (Fin 2)) 0 (x + y) =
        TauCeti.gradedPow 2 (TauCeti.freeProP 2 (Fin 2)) 0 x +
          TauCeti.gradedPow 2 (TauCeti.freeProP 2 (Fin 2)) 0 y :=
  ⟨TauCeti.gradedBracket_freeProP_two_ne_zero _ _ rfl rfl,
    TauCeti.gradedPow_freeProP_two_not_additive⟩

/-- **Layer 8, `π` against the bracket**, away from degree zero and for every `p`:
`π[x, y] = [πx, y]` for `x ∈ gr_j` with `j ≥ 1`, and `π[x, y] = [x, πy]` for `y ∈ gr_k` with
`k ≥ 1` (`TauCeti.gradedPow_gradedBracket_left`, `TauCeti.gradedPow_gradedBracket_right`). -/
example {j k : ℕ} (hj : 1 ≤ j) (hk : 1 ≤ k) (x : TauCeti.gradedPiece p G j)
    (y : TauCeti.gradedPiece p G k) :
    TauCeti.gradedPow p G (j + k + 1) (TauCeti.gradedBracket p G j k x y) =
        TauCeti.gradedCast p G (by omega)
          (TauCeti.gradedBracket p G (j + 1) k (TauCeti.gradedPow p G j x) y) ∧
      TauCeti.gradedPow p G (j + k + 1) (TauCeti.gradedBracket p G j k x y) =
        TauCeti.gradedCast p G (by omega)
          (TauCeti.gradedBracket p G j (k + 1) x (TauCeti.gradedPow p G k y)) :=
  ⟨TauCeti.gradedPow_gradedBracket_left hj x y, TauCeti.gradedPow_gradedBracket_right hk x y⟩

/-- **Layer 8, `π` against the bracket for odd `p`, in every degree including zero**:
`TauCeti.gradedPow_gradedBracket_left_of_odd` and its mirror image
`TauCeti.gradedPow_gradedBracket_right_of_odd`, which make `gr(G)` a graded Lie algebra over
`𝔽_p[π]`. -/
example (hp : Odd p) {j k : ℕ} (x : TauCeti.gradedPiece p G j)
    (y : TauCeti.gradedPiece p G k) :
    TauCeti.gradedPow p G (j + k + 1) (TauCeti.gradedBracket p G j k x y) =
        TauCeti.gradedCast p G (by omega)
          (TauCeti.gradedBracket p G (j + 1) k (TauCeti.gradedPow p G j x) y) ∧
      TauCeti.gradedPow p G (j + k + 1) (TauCeti.gradedBracket p G j k x y) =
        TauCeti.gradedCast p G (by omega)
          (TauCeti.gradedBracket p G j (k + 1) x (TauCeti.gradedPow p G k y)) :=
  ⟨TauCeti.gradedPow_gradedBracket_left_of_odd hp x y,
    TauCeti.gradedPow_gradedBracket_right_of_odd hp x y⟩

/-- **Layer 8, the degree-zero corrections at `p = 2`**: `[πx, y] = π[x, y] + [[x, y], x]` for
`x ∈ gr_0` (`TauCeti.gradedBracket_gradedPow_zero_left_of_two`), and its mirror image
(`TauCeti.gradedBracket_gradedPow_zero_right_of_two`). -/
example (hp : p = 2) {j k : ℕ} (x₀ : TauCeti.gradedPiece p G 0) (y : TauCeti.gradedPiece p G k)
    (x : TauCeti.gradedPiece p G j) (y₀ : TauCeti.gradedPiece p G 0) :
    TauCeti.gradedCast p G (by omega)
        (TauCeti.gradedBracket p G 1 k (TauCeti.gradedPow p G 0 x₀) y) =
      TauCeti.gradedPow p G (0 + k + 1) (TauCeti.gradedBracket p G 0 k x₀ y) +
        TauCeti.gradedCast p G (by omega) (TauCeti.gradedBracket p G (0 + k + 1) 0
          (TauCeti.gradedBracket p G 0 k x₀ y) x₀) ∧
    TauCeti.gradedCast p G (by omega)
        (TauCeti.gradedBracket p G j 1 x (TauCeti.gradedPow p G 0 y₀)) =
      TauCeti.gradedPow p G (j + 0 + 1) (TauCeti.gradedBracket p G j 0 x y₀) +
        TauCeti.gradedCast p G (by omega) (TauCeti.gradedBracket p G (j + 0 + 1) 0
          (TauCeti.gradedBracket p G j 0 x y₀) y₀) :=
  ⟨TauCeti.gradedBracket_gradedPow_zero_left_of_two hp x₀ y,
    TauCeti.gradedBracket_gradedPow_zero_right_of_two hp x y₀⟩

/-- **Layer 8, the graded map of a continuous homomorphism**, `TauCeti.gradedMap p f hf k`, with
its defining equation `TauCeti.gradedMap_gradedMk`, is natural for the bracket and for `π`
(`TauCeti.gradedMap_gradedBracket`, `TauCeti.gradedMap_gradedPow`). -/
example {H : Type u} [Group H] [TopologicalSpace H] [IsTopologicalGroup H] (f : G →* H)
    (hf : Continuous f) {j k : ℕ} (x : TauCeti.gradedPiece p G j)
    (y : TauCeti.gradedPiece p G k) (z : TauCeti.pLowerCentralSeries p G k) :
    TauCeti.gradedMap p f hf k (TauCeti.gradedMk p G k z) =
        TauCeti.gradedMk p H k ⟨f z, f.map_pLowerCentralSeries_le hf k ⟨z, z.2, rfl⟩⟩ ∧
      TauCeti.gradedMap p f hf (j + k + 1) (TauCeti.gradedBracket p G j k x y) =
        TauCeti.gradedBracket p H j k (TauCeti.gradedMap p f hf j x)
          (TauCeti.gradedMap p f hf k y) ∧
      TauCeti.gradedMap p f hf (k + 1) (TauCeti.gradedPow p G k y) =
        TauCeti.gradedPow p H k (TauCeti.gradedMap p f hf k y) :=
  ⟨TauCeti.gradedMap_gradedMk f hf z, TauCeti.gradedMap_gradedBracket f hf x y,
    TauCeti.gradedMap_gradedPow f hf y⟩

/-- **Layer 8, a continuous surjection induces a surjection in each degree**:
`TauCeti.gradedMap_surjective`, for a closed map, which a continuous map out of a compact group
into a Hausdorff group is. -/
example {H : Type u} [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace G]
    [T2Space H] (f : G →* H) (hf : Continuous f) (hs : Function.Surjective f) (k : ℕ) :
    Function.Surjective (TauCeti.gradedMap p f hf k) :=
  TauCeti.gradedMap_surjective f hf hf.isClosedMap hs k

/-- **Layer 8 checklist, `gr_0(G) = G/Φ(G)`**: `TauCeti.gradedPieceZeroEquiv`, an additive
isomorphism `gr_0(G) ≃ Additive (G ⧸ λ_1)` sending the class of `x` to the class of `x`
(`TauCeti.gradedPieceZeroEquiv_gradedMk`), with `λ_1 = Φ(G)` below. -/
example (x : TauCeti.pLowerCentralSeries p G 0) :
    TauCeti.gradedPieceZeroEquiv p G (TauCeti.gradedMk p G 0 x) =
      Additive.ofMul ((x : G) : G ⧸ TauCeti.pLowerCentralSeries p G 1) :=
  TauCeti.gradedPieceZeroEquiv_gradedMk x

end Graded

/-! ## Layer 8: openness, cofinality and functoriality of the lower `p`-series -/

section Series

variable {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 8, the lower `p`-series is closed, normal, characteristic and descending**:
`TauCeti.isClosed_pLowerCentralSeries`, the instance `TauCeti.pLowerCentralSeries_normal`,
`TauCeti.isTopCharacteristic_pLowerCentralSeries` and `TauCeti.pLowerCentralSeries_antitone`. -/
example (k : ℕ) :
    IsClosed ((TauCeti.pLowerCentralSeries p G k : Subgroup G) : Set G) ∧
      (TauCeti.pLowerCentralSeries p G k).Normal ∧
      TauCeti.IsTopCharacteristic G (TauCeti.pLowerCentralSeries p G k) ∧
      Antitone (TauCeti.pLowerCentralSeries p G) :=
  ⟨TauCeti.isClosed_pLowerCentralSeries k, inferInstance,
    TauCeti.isTopCharacteristic_pLowerCentralSeries p k, TauCeti.pLowerCentralSeries_antitone⟩

/-- **Layer 8, functoriality of the lower `p`-series.** `f(λ_k(G)) ≤ λ_k(H)` for a continuous
homomorphism, with equality for a continuous surjection out of a compact group into a Hausdorff
one, and for a topological isomorphism: `MonoidHom.map_pLowerCentralSeries_le`,
`MonoidHom.map_pLowerCentralSeries_eq_of_surjective`,
`ContinuousMulEquiv.map_pLowerCentralSeries_eq`. -/
example {H : Type u} [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace G]
    [T2Space H] (f : G →* H) (hf : Continuous f) (e : G ≃ₜ* H) (k : ℕ) :
    (TauCeti.pLowerCentralSeries p G k).map f ≤ TauCeti.pLowerCentralSeries p H k ∧
      (Function.Surjective f →
        (TauCeti.pLowerCentralSeries p G k).map f = TauCeti.pLowerCentralSeries p H k) ∧
      (TauCeti.pLowerCentralSeries p G k).map e.toMonoidHom =
        TauCeti.pLowerCentralSeries p H k :=
  ⟨f.map_pLowerCentralSeries_le hf k,
    fun hs ↦ f.map_pLowerCentralSeries_eq_of_surjective hf hf.isClosedMap hs k,
    e.map_pLowerCentralSeries_eq k⟩

variable [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 8, openness and cofinality.** In a topologically finitely generated pro-`p` group
every `λ_k` is open (`TauCeti.IsTopologicallyFinitelyGenerated.isOpen_pLowerCentralSeries`),
every open normal subgroup contains some `λ_k` (`TauCeti.IsProP.exists_pLowerCentralSeries_le`),
and the series is a neighbourhood basis of `1`
(`TauCeti.IsProP.hasAntitoneBasis_nhds_one_pLowerCentralSeries`). -/
example [Fact p.Prime] (hG : TauCeti.IsProP p G) (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
    (k : ℕ) (U : OpenNormalSubgroup G) :
    IsOpen ((TauCeti.pLowerCentralSeries p G k : Subgroup G) : Set G) ∧
      (∃ j, TauCeti.pLowerCentralSeries p G j ≤ U.toSubgroup) ∧
      (nhds (1 : G)).HasAntitoneBasis fun j ↦ (TauCeti.pLowerCentralSeries p G j : Set G) :=
  ⟨hfg.isOpen_pLowerCentralSeries Fact.out k, hG.exists_pLowerCentralSeries_le Fact.out U,
    hG.hasAntitoneBasis_nhds_one_pLowerCentralSeries hfg Fact.out⟩

/-- **Layer 8, `G ≅ lim_k G/λ_k` with finite `p`-group levels.** Each level is a finite `p`-group
(`TauCeti.IsTopologicallyFinitelyGenerated.finite_quotient_pLowerCentralSeries`,
`TauCeti.IsProP.isPGroup_quotient_pLowerCentralSeries`), and a compatible family of cosets comes
from a unique element (`TauCeti.IsProP.existsUnique_forall_mk_eq_pLowerCentralSeries`). -/
example [Fact p.Prime] (hG : TauCeti.IsProP p G) (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
    (k : ℕ) (x : ∀ k, G ⧸ TauCeti.pLowerCentralSeries p G k)
    (hx : ∀ (k : ℕ) (g : G), (g : G ⧸ TauCeti.pLowerCentralSeries p G (k + 1)) = x (k + 1) →
      (g : G ⧸ TauCeti.pLowerCentralSeries p G k) = x k) :
    Finite (G ⧸ TauCeti.pLowerCentralSeries p G k) ∧
      IsPGroup p (G ⧸ TauCeti.pLowerCentralSeries p G k) ∧
      ∃! g : G, ∀ k, (g : G ⧸ TauCeti.pLowerCentralSeries p G k) = x k :=
  ⟨hfg.finite_quotient_pLowerCentralSeries Fact.out k,
    hG.isPGroup_quotient_pLowerCentralSeries hfg Fact.out k,
    hG.existsUnique_forall_mk_eq_pLowerCentralSeries Fact.out x hx⟩

/-- **Layer 8 checklist, `λ_1(G) = Φ(G)`**: `TauCeti.pLowerCentralSeries_one_eq_proPFrattini`. -/
example [Fact p.Prime] : TauCeti.pLowerCentralSeries p G 1 = TauCeti.proPFrattini p G :=
  TauCeti.pLowerCentralSeries_one_eq_proPFrattini Fact.out

/-- **Layer 8, the same for the iterated Frattini series, and the interleaving.** The iterated
Frattini series `Φ_k` (`TauCeti.proPFrattiniSeries`, `Φ_{k+1} = closure (Φ_kᵖ [Φ_k, Φ_k])`) lies
below the lower `p`-series term by term (`TauCeti.proPFrattiniSeries_le_pLowerCentralSeries`),
contains a term of it (`TauCeti.IsProP.exists_pLowerCentralSeries_le_proPFrattiniSeries`), is
open (`TauCeti.IsTopologicallyFinitelyGenerated.isOpen_proPFrattiniSeries`) and is a
neighbourhood basis of `1` (`TauCeti.IsProP.hasAntitoneBasis_nhds_one_proPFrattiniSeries`). -/
example [Fact p.Prime] (hG : TauCeti.IsProP p G) (hfg : TauCeti.IsTopologicallyFinitelyGenerated G)
    (k : ℕ) :
    TauCeti.proPFrattiniSeries p G (k + 1) =
        (Subgroup.closure ((fun x ↦ x ^ p) '' (TauCeti.proPFrattiniSeries p G k : Set G)) ⊔
          ⁅TauCeti.proPFrattiniSeries p G k, TauCeti.proPFrattiniSeries p G k⁆).topologicalClosure ∧
      TauCeti.proPFrattiniSeries p G k ≤ TauCeti.pLowerCentralSeries p G k ∧
      (∃ j, TauCeti.pLowerCentralSeries p G j ≤ TauCeti.proPFrattiniSeries p G k) ∧
      IsOpen ((TauCeti.proPFrattiniSeries p G k : Subgroup G) : Set G) ∧
      (nhds (1 : G)).HasAntitoneBasis fun j ↦ (TauCeti.proPFrattiniSeries p G j : Set G) :=
  ⟨(TauCeti.proPFrattiniSeries_succ p G k).trans (TauCeti.proPFrattiniStep_def p _),
    TauCeti.proPFrattiniSeries_le_pLowerCentralSeries k,
    hG.exists_pLowerCentralSeries_le_proPFrattiniSeries hfg Fact.out k,
    hfg.isOpen_proPFrattiniSeries Fact.out k,
    hG.hasAntitoneBasis_nhds_one_proPFrattiniSeries hfg Fact.out⟩

end Series

/-- **Layer 8 checklist, edge case: without finite generation `λ_k` need not be open.** For
`G = ∏_ℕ C_p` (here `ℕ → Multiplicative (ZMod p)` with `C_p` discrete) `λ_1(G) = 1`, by
`MonoidHom.pLowerCentralSeries_one_le_ker`, and `{1}` is not open in the product topology. -/
example (p : ℕ) [Fact p.Prime] [TopologicalSpace (Multiplicative (ZMod p))]
    [DiscreteTopology (Multiplicative (ZMod p))] :
    TauCeti.pLowerCentralSeries p (ℕ → Multiplicative (ZMod p)) 1 = ⊥ ∧
      ¬ IsOpen ((TauCeti.pLowerCentralSeries p (ℕ → Multiplicative (ZMod p)) 1 :
        Subgroup (ℕ → Multiplicative (ZMod p))) : Set (ℕ → Multiplicative (ZMod p))) := by
  have hbot : TauCeti.pLowerCentralSeries p (ℕ → Multiplicative (ZMod p)) 1 = ⊥ := by
    refine le_bot_iff.mp ?_
    have hk : ((MonoidHom.id (ℕ → Multiplicative (ZMod p))).ker :
        Set (ℕ → Multiplicative (ZMod p))) = {1} := by
      ext x; simp
    have := (MonoidHom.id (ℕ → Multiplicative (ZMod p))).pLowerCentralSeries_one_le_ker
      (p := p) (hk ▸ isClosed_singleton) fun g ↦ ?_
    · intro x hx
      exact (Subgroup.mem_bot).mpr (MonoidHom.mem_ker.mp (this hx))
    · funext i
      change (g i) ^ p = 1
      rw [← ofAdd_toAdd (g i), ← ofAdd_nsmul, nsmul_eq_mul, ZMod.natCast_self, zero_mul,
        ofAdd_zero]
  refine ⟨hbot, fun h ↦ ?_⟩
  rw [hbot, Subgroup.coe_bot, isOpen_pi_iff] at h
  obtain ⟨I, u, hu, hsub⟩ := h 1 rfl
  obtain ⟨n, hn⟩ := Infinite.exists_notMem_finset I
  have hmem : (Pi.mulSingle n (Multiplicative.ofAdd 1) : ℕ → Multiplicative (ZMod p)) ∈
      (I : Set ℕ).pi u := by
    intro i hi
    have : i ≠ n := fun h ↦ hn (h ▸ hi)
    simpa [Pi.mulSingle_eq_of_ne this] using (hu i hi).2
  have := hsub hmem
  have h1 := congrFun this n
  simp only [Pi.mulSingle_eq_same, Pi.one_apply, ofAdd_eq_one] at h1
  exact one_ne_zero h1

/-- **Layer 8 checklist, agreement with Mathlib's `lowerCentralSeries` on the commutator part.**
The closed lower central series `TauCeti.closedLowerCentralSeries` is the lower `p`-series at
`p = 0` (`TauCeti.closedLowerCentralSeries_def`), each term is the closure of the corresponding
term of Mathlib's `lowerCentralSeries` (`TauCeti.closedLowerCentralSeries_eq_topologicalClosure`),
and it lies in the lower `p`-series for every `p`
(`TauCeti.closedLowerCentralSeries_le_pLowerCentralSeries`). -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (p n : ℕ) :
    TauCeti.closedLowerCentralSeries G n = TauCeti.pLowerCentralSeries 0 G n ∧
      TauCeti.closedLowerCentralSeries G n =
        ((⊤ : Subgroup G).lowerCentralSeries n).topologicalClosure ∧
      TauCeti.closedLowerCentralSeries G n ≤ TauCeti.pLowerCentralSeries p G n :=
  ⟨TauCeti.closedLowerCentralSeries_def G n,
    TauCeti.closedLowerCentralSeries_eq_topologicalClosure n,
    TauCeti.closedLowerCentralSeries_le_pLowerCentralSeries p n⟩

/-! ## Layer 8: `gr(F)` for a free pro-`p` group, the maps `δ_j` and the tails `T_j` -/

section Free

variable {p : ℕ} [Fact p.Prime] {n : ℕ}

/-- **Layer 8 checklist, `gr_0(F)` and `gr_1(F)` for `F` free pro-`p` of rank `n`.** `gr_0(F)`
has the basis of the generator classes `x̄_i` (`TauCeti.freeProP.degreeZeroBasis`), and `gr_1(F)`
has the basis `π x̄_i`, `[x̄_i, x̄_k]` for `i < k` (`TauCeti.freeProP.degreeOneBasis`, indexed by
`Fin n ⊕ {(i, k) // i < k}`), so its dimension is `n + binom(n, 2)`
(`TauCeti.freeProP.finrank_gradedPiece_one`), the dimension of `Λ²(𝔽_p^n) ⊕ 𝔽_p^n`. -/
example (i : Fin n) (j k : Fin n) (hjk : j < k) :
    TauCeti.freeProP.degreeZeroBasis p (Fin n) i =
        TauCeti.gradedMkZero p (TauCeti.freeProP p (Fin n)) (TauCeti.freeProP.of i) ∧
      TauCeti.freeProP.degreeOneBasis p (Fin n) (Sum.inl i) =
        TauCeti.gradedPow p (TauCeti.freeProP p (Fin n)) 0
          (TauCeti.gradedMkZero p _ (TauCeti.freeProP.of i)) ∧
      TauCeti.freeProP.degreeOneBasis p (Fin n) (Sum.inr ⟨(j, k), hjk⟩) =
        TauCeti.gradedBracket p (TauCeti.freeProP p (Fin n)) 0 0
          (TauCeti.gradedMkZero p _ (TauCeti.freeProP.of j))
          (TauCeti.gradedMkZero p _ (TauCeti.freeProP.of k)) ∧
      Module.finrank (ZMod p) (TauCeti.gradedPiece p (TauCeti.freeProP p (Fin n)) 1) =
        n + n.choose 2 := by
  refine ⟨TauCeti.freeProP.degreeZeroBasis_apply p (Fin n) i, ?_, ?_, ?_⟩
  · rw [TauCeti.freeProP.degreeOneBasis_apply]
    rfl
  · rw [TauCeti.freeProP.degreeOneBasis_apply]
    rfl
  · rw [TauCeti.freeProP.finrank_gradedPiece_one, Fintype.card_fin]

/-- **Layer 8, `δ_j` for `j ≥ 2`: well-definedness, the formula, and linearity.** In Tau Ceti's
indexing `δ_{m+1}` with `m = j - 1 ≥ 1` is `TauCeti.freeProP.basisModificationDelta p X hm`, an
`𝔽_p`-bilinear map `gr_1(F) → gr_m(F)^n → gr_{m+1}(F)`. Modifying the basis by `x_i ↦ x_i w_i`
with `w_i ∈ λ_m(F)` (`TauCeti.freeProP.basisModification`) moves `r ∈ λ_1(F)` by
`r⁻¹ θ_w(r) ∈ λ_{m+1}(F)`, whose class is `δ(r̄)(w̄)`, so it depends only on the classes `w̄_i`
(`TauCeti.freeProP.gradedMk_inv_mul_basisModification`). Its value is the formula
`Σ_i c_i (π w̄_i + binom(p, 2) [w̄_i, x̄_i]) + Σ_{i<k} a_{ik} ([w̄_i, x̄_k] - [w̄_k, x̄_i])`
(`TauCeti.freeProP.basisModificationDelta_apply`), and it is additive in `w̄`. -/
example {m : ℕ} (hm : 1 ≤ m)
    (w : Fin n → TauCeti.pLowerCentralSeries p (TauCeti.freeProP p (Fin n)) m)
    (r : TauCeti.pLowerCentralSeries p (TauCeti.freeProP p (Fin n)) 1)
    (ρ : TauCeti.gradedPiece p (TauCeti.freeProP p (Fin n)) 1)
    (v v' : Fin n → TauCeti.gradedPiece p (TauCeti.freeProP p (Fin n)) m) :
    TauCeti.gradedMk p (TauCeti.freeProP p (Fin n)) (m + 1)
        ⟨(r : TauCeti.freeProP p (Fin n))⁻¹ * TauCeti.freeProP.basisModification w r,
          TauCeti.inv_mul_apply_mem_pLowerCentralSeries
            (TauCeti.freeProP.basisModification w).toMonoidHom
            (TauCeti.freeProP.basisModification w).continuous
            (TauCeti.freeProP.inv_mul_basisModification_mem_pLowerCentralSeries w) r.2⟩ =
        TauCeti.freeProP.basisModificationDelta p (Fin n) hm
          (TauCeti.gradedMk p (TauCeti.freeProP p (Fin n)) 1 r)
          (fun i ↦ TauCeti.gradedMk p (TauCeti.freeProP p (Fin n)) m (w i)) ∧
      TauCeti.freeProP.basisModificationDelta p (Fin n) hm ρ v =
        ∑ i, (TauCeti.freeProP.degreeOneBasis p (Fin n)).repr ρ (Sum.inl i) •
            (TauCeti.gradedPow p (TauCeti.freeProP p (Fin n)) m (v i) +
              p.choose 2 • TauCeti.gradedBracket p (TauCeti.freeProP p (Fin n)) m 0 (v i)
                (TauCeti.gradedMkZero p _ (TauCeti.freeProP.of i))) +
          ∑ ij : {ij : Fin n × Fin n // ij.1 < ij.2},
            (TauCeti.freeProP.degreeOneBasis p (Fin n)).repr ρ (Sum.inr ij) •
              (TauCeti.gradedBracket p (TauCeti.freeProP p (Fin n)) m 0 (v ij.1.1)
                  (TauCeti.gradedMkZero p _ (TauCeti.freeProP.of ij.1.2)) -
                TauCeti.gradedBracket p (TauCeti.freeProP p (Fin n)) m 0 (v ij.1.2)
                  (TauCeti.gradedMkZero p _ (TauCeti.freeProP.of ij.1.1))) ∧
      TauCeti.freeProP.basisModificationDelta p (Fin n) hm ρ (v + v') =
        TauCeti.freeProP.basisModificationDelta p (Fin n) hm ρ v +
          TauCeti.freeProP.basisModificationDelta p (Fin n) hm ρ v' :=
  ⟨TauCeti.freeProP.gradedMk_inv_mul_basisModification hm w r,
    TauCeti.freeProP.basisModificationDelta_apply hm ρ v, map_add _ v v'⟩

/-- **Layer 8, `δ_1`: well-definedness and its value.** At level zero the modification
`x_i ↦ x_i w_i` with arbitrary `w_i ∈ F` moves `r ∈ λ_1(F)` by an element whose class in
`gr_1(F)` depends only on the classes `w̄_i ∈ gr_0(F)`: it is
`TauCeti.freeProP.basisModificationDeltaZero` evaluated at `r̄`
(`TauCeti.freeProP.gradedMk_inv_mul_basisModification_zero`), whose value
(`TauCeti.freeProP.basisModificationDeltaZero_apply`) has, besides the README's terms, the
quadratic terms `a_{ik} [w̄_i, w̄_k]` of the commutator part of `r̄`. -/
example (w : Fin n → TauCeti.pLowerCentralSeries p (TauCeti.freeProP p (Fin n)) 0)
    (r : TauCeti.pLowerCentralSeries p (TauCeti.freeProP p (Fin n)) 1)
    (ω : Fin n → TauCeti.gradedPiece p (TauCeti.freeProP p (Fin n)) 0)
    (ρ : TauCeti.gradedPiece p (TauCeti.freeProP p (Fin n)) 1) :
    TauCeti.gradedMk p (TauCeti.freeProP p (Fin n)) 1
        ⟨(r : TauCeti.freeProP p (Fin n))⁻¹ * TauCeti.freeProP.basisModification w r,
          TauCeti.inv_mul_apply_mem_pLowerCentralSeries
            (TauCeti.freeProP.basisModification w).toMonoidHom
            (TauCeti.freeProP.basisModification w).continuous
            (TauCeti.freeProP.inv_mul_basisModification_mem_pLowerCentralSeries w) r.2⟩ =
        TauCeti.freeProP.basisModificationDeltaZero p (Fin n)
          (fun i ↦ TauCeti.gradedMkZero p (TauCeti.freeProP p (Fin n)) (w i))
          (TauCeti.gradedMk p (TauCeti.freeProP p (Fin n)) 1 r) ∧
      TauCeti.freeProP.basisModificationDeltaZero p (Fin n) ω ρ =
        ∑ i, (TauCeti.freeProP.degreeOneBasis p (Fin n)).repr ρ (Sum.inl i) •
            (TauCeti.gradedPow p (TauCeti.freeProP p (Fin n)) 0 (ω i) +
              p.choose 2 • TauCeti.gradedBracket p (TauCeti.freeProP p (Fin n)) 0 0 (ω i)
                (TauCeti.gradedMkZero p _ (TauCeti.freeProP.of i))) +
          ∑ ij : {ij : Fin n × Fin n // ij.1 < ij.2},
            (TauCeti.freeProP.degreeOneBasis p (Fin n)).repr ρ (Sum.inr ij) •
              (TauCeti.gradedBracket p (TauCeti.freeProP p (Fin n)) 0 0 (ω ij.1.1)
                  (TauCeti.gradedMkZero p _ (TauCeti.freeProP.of ij.1.2)) -
                TauCeti.gradedBracket p (TauCeti.freeProP p (Fin n)) 0 0 (ω ij.1.2)
                  (TauCeti.gradedMkZero p _ (TauCeti.freeProP.of ij.1.1)) +
                TauCeti.gradedBracket p (TauCeti.freeProP p (Fin n)) 0 0 (ω ij.1.1)
                  (ω ij.1.2)) :=
  ⟨TauCeti.freeProP.gradedMk_inv_mul_basisModification_zero w r,
    TauCeti.freeProP.basisModificationDeltaZero_apply ω ρ⟩

/-- **Layer 8, the polarization identity for `δ_1` at `p = 2`**, in Tau Ceti's complete form:
`δ_1(v + w) - δ_1(v) - δ_1(w) = Σ_i c_i [v_i, w_i] + Σ_{i<k} a_{ik} ([v_i, w_k] + [w_i, v_k])`
(`TauCeti.freeProP.basisModificationDeltaZero_add_of_two`). The second sum is the polarization
of the quadratic terms `a_{ik} [w̄_i, w̄_k]`, which the README's formula for `δ_1` omits. -/
example (v w : Fin n → TauCeti.gradedPiece 2 (TauCeti.freeProP 2 (Fin n)) 0)
    (ρ : TauCeti.gradedPiece 2 (TauCeti.freeProP 2 (Fin n)) 1) :
    TauCeti.freeProP.basisModificationDeltaZero 2 (Fin n) (v + w) ρ -
        TauCeti.freeProP.basisModificationDeltaZero 2 (Fin n) v ρ -
        TauCeti.freeProP.basisModificationDeltaZero 2 (Fin n) w ρ =
      ∑ i, (TauCeti.freeProP.degreeOneBasis 2 (Fin n)).repr ρ (Sum.inl i) •
          TauCeti.gradedBracket 2 (TauCeti.freeProP 2 (Fin n)) 0 0 (v i) (w i) +
        ∑ ij : {ij : Fin n × Fin n // ij.1 < ij.2},
          (TauCeti.freeProP.degreeOneBasis 2 (Fin n)).repr ρ (Sum.inr ij) •
            (TauCeti.gradedBracket 2 (TauCeti.freeProP 2 (Fin n)) 0 0 (v ij.1.1) (w ij.1.2) +
              TauCeti.gradedBracket 2 (TauCeti.freeProP 2 (Fin n)) 0 0 (w ij.1.1) (v ij.1.2)) := by
  rw [TauCeti.freeProP.basisModificationDeltaZero_add_of_two rfl]
  abel

/-- **Layer 8, the polarization identity for `δ_1` at `p = 2`, in the README's form**
`δ_1(v + w) - δ_1(v) - δ_1(w) = Σ_i c_i [v_i, w_i]`. It holds exactly when the bracket part of
the polarization vanishes, for instance for a class `r̄` without commutator part; it is the
special case of `TauCeti.freeProP.basisModificationDeltaZero_add_of_two` stated here. -/
example (v w : Fin n → TauCeti.gradedPiece 2 (TauCeti.freeProP 2 (Fin n)) 0)
    (ρ : TauCeti.gradedPiece 2 (TauCeti.freeProP 2 (Fin n)) 1)
    (hρ : ∀ ij, (TauCeti.freeProP.degreeOneBasis 2 (Fin n)).repr ρ (Sum.inr ij) = 0) :
    TauCeti.freeProP.basisModificationDeltaZero 2 (Fin n) (v + w) ρ -
        TauCeti.freeProP.basisModificationDeltaZero 2 (Fin n) v ρ -
        TauCeti.freeProP.basisModificationDeltaZero 2 (Fin n) w ρ =
      ∑ i, (TauCeti.freeProP.degreeOneBasis 2 (Fin n)).repr ρ (Sum.inl i) •
          TauCeti.gradedBracket 2 (TauCeti.freeProP 2 (Fin n)) 0 0 (v i) (w i) := by
  rw [TauCeti.freeProP.basisModificationDeltaZero_add_of_two rfl]
  simp only [hρ, zero_smul, Finset.sum_const_zero, add_zero]
  abel

/-- **Layer 8, the tails `T_j`.** `T_j(r̄)` is the span in `gr_j(F)` of the iterated powers
`π^j x̄_i` over the indices with `c_i = 0` (`TauCeti.freeProP.basisModificationTail`, defining
equation `TauCeti.freeProP.basisModificationTail_def`), of dimension the number of such indices
(`TauCeti.freeProP.finrank_basisModificationTail`). -/
example (ρ : TauCeti.gradedPiece p (TauCeti.freeProP p (Fin n)) 1) (j : ℕ) :
    TauCeti.freeProP.basisModificationTail p (Fin n) ρ j =
        Submodule.span (ZMod p)
          ((fun i ↦ TauCeti.gradedPowIter p (TauCeti.freeProP p (Fin n)) j
              (TauCeti.gradedMkZero p (TauCeti.freeProP p (Fin n)) (TauCeti.freeProP.of i))) ''
            {i | (TauCeti.freeProP.degreeOneBasis p (Fin n)).repr ρ (Sum.inl i) = 0}) ∧
      Module.finrank (ZMod p) (TauCeti.freeProP.basisModificationTail p (Fin n) ρ j) =
        Nat.card {i // (TauCeti.freeProP.degreeOneBasis p (Fin n)).repr ρ (Sum.inl i) = 0} :=
  ⟨(TauCeti.freeProP.basisModificationTail_def ρ j).trans
      (TauCeti.freeProP.gradedPowIterSpan_def _ j),
    TauCeti.freeProP.finrank_basisModificationTail ρ j⟩

/-- **Layer 8, the tails, worked example.** For `r = x₁² x₂^{2^f} (x₂, x₃) ⋯` with `f ≥ 2`
(`TauCeti.demushkinWordTwoOdd f n`, with `x₁` the generator of index `0`), the indices with
`c_i = 0` are exactly `x₂, …, x_n`:
`TauCeti.freeProP.degreeOneBasis_repr_gradedMk_demushkinWordTwoOdd_inl_eq_zero_iff`. -/
example {f : ℕ} (hf : 2 ≤ f) (k : Fin n) :
    (TauCeti.freeProP.degreeOneBasis 2 (Fin n)).repr
        (TauCeti.gradedMk 2 (TauCeti.freeProP 2 (Fin n)) 1
          ⟨TauCeti.demushkinWordTwoOdd f n (TauCeti.freeProPGen 2 n),
            TauCeti.demushkinWordTwoOdd_mem_pLowerCentralSeries_one
              (zero_lt_two.trans_le hf) n _⟩)
        (Sum.inl k) = 0 ↔ (k : ℕ) ≠ 0 :=
  TauCeti.freeProP.degreeOneBasis_repr_gradedMk_demushkinWordTwoOdd_inl_eq_zero_iff hf k

end Free

/-- **Layer 8, `(A : A²)` is `1`, `2` or `4`** for every closed subgroup `A ≤ ℤ₂ˣ`, as the
supernatural index `profiniteIndex A² A`
(`TauCeti.profiniteIndex_subgroupOf_map_powMonoidHom_two_eq_one_or_two_or_four`); the value `1`
occurs exactly for `A = 1` and `4` exactly for `A = {±1} × U^(f)`
(`..._eq_one_iff`, `..._eq_primePower_two_iff`). -/
example {A : Subgroup ℤ_[2]ˣ} (hA : IsClosed (A : Set ℤ_[2]ˣ)) :
    (((A.map (powMonoidHom 2)).subgroupOf A).profiniteIndex = 1 ∨
      ((A.map (powMonoidHom 2)).subgroupOf A).profiniteIndex =
        TauCeti.Supernatural.primePower ⟨2, Nat.prime_two⟩ 1 ∨
      ((A.map (powMonoidHom 2)).subgroupOf A).profiniteIndex =
        TauCeti.Supernatural.primePower ⟨2, Nat.prime_two⟩ 2) ∧
      (((A.map (powMonoidHom 2)).subgroupOf A).profiniteIndex = 1 ↔ A = ⊥) ∧
      (((A.map (powMonoidHom 2)).subgroupOf A).profiniteIndex =
          TauCeti.Supernatural.primePower ⟨2, Nat.prime_two⟩ 2 ↔
        ∃ f, 2 ≤ f ∧ A = TauCeti.unitsPlusMinus f) :=
  ⟨TauCeti.profiniteIndex_subgroupOf_map_powMonoidHom_two_eq_one_or_two_or_four hA,
    TauCeti.profiniteIndex_subgroupOf_map_powMonoidHom_two_eq_one_iff hA,
    TauCeti.profiniteIndex_subgroupOf_map_powMonoidHom_two_eq_primePower_two_iff hA⟩

/-! ## Layer 8: finite-quotient determinacy -/

section FiniteQuotients

/-- **Layer 8, occurring as a quotient**, by its content: `Q` is finite and there is a
surjection `G →* Q` with open kernel (`TauCeti.isFiniteContinuousQuotient_iff`). For a finite
discrete `Q` this is the existence of a continuous surjection
(`TauCeti.isFiniteContinuousQuotient_iff_exists_continuous`). -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (Q : Type v) [Group Q]
    [Finite Q] [TopologicalSpace Q] [DiscreteTopology Q] :
    (TauCeti.IsFiniteContinuousQuotient G Q ↔
      Finite Q ∧ ∃ f : G →* Q, Function.Surjective f ∧ IsOpen (f.ker : Set G)) ∧
    (TauCeti.IsFiniteContinuousQuotient G Q ↔
      ∃ f : G →* Q, Function.Surjective f ∧ Continuous f) :=
  ⟨TauCeti.isFiniteContinuousQuotient_iff, TauCeti.isFiniteContinuousQuotient_iff_exists_continuous⟩

/-- **Layer 8, the predicate is an isomorphism invariant** in `Q`
(`TauCeti.isFiniteContinuousQuotient_congr_right`) and a topological-isomorphism invariant in `G`
(`TauCeti.isFiniteContinuousQuotient_congr_left`). -/
example {G G' : Type u} [Group G] [TopologicalSpace G] [Group G'] [TopologicalSpace G']
    {Q Q' : Type v} [Group Q] [Group Q'] (e : Q ≃* Q') (e' : G ≃ₜ* G') :
    (TauCeti.IsFiniteContinuousQuotient G Q ↔ TauCeti.IsFiniteContinuousQuotient G Q') ∧
      (TauCeti.IsFiniteContinuousQuotient G Q ↔ TauCeti.IsFiniteContinuousQuotient G' Q) :=
  ⟨TauCeti.isFiniteContinuousQuotient_congr_right e,
    TauCeti.isFiniteContinuousQuotient_congr_left e'⟩

variable {G H : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G] [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
  [CompactSpace H] [TotallyDisconnectedSpace H]

/-- **Layer 8, two epimorphisms, step 1.** A profinite group all of whose continuous finite
quotients are quotients of a topologically finitely generated `G` is topologically finitely
generated: `TauCeti.IsTopologicallyFinitelyGenerated.of_forall_isFiniteContinuousQuotient`. -/
example (hG : TauCeti.IsTopologicallyFinitelyGenerated G)
    (h : ∀ (Q : Type u) [Group Q] [Finite Q],
      TauCeti.IsFiniteContinuousQuotient H Q → TauCeti.IsFiniteContinuousQuotient G Q) :
    TauCeti.IsTopologicallyFinitelyGenerated H :=
  hG.of_forall_isFiniteContinuousQuotient h

/-- **Layer 8, two epimorphisms.** If `G` is topologically finitely generated and `G` and `H`
have the same continuous finite quotients, there are continuous surjections in both directions:
`TauCeti.exists_surjective_and_exists_surjective_of_forall_isFiniteContinuousQuotient_iff`. -/
example (hG : TauCeti.IsTopologicallyFinitelyGenerated G)
    (h : ∀ (Q : Type u) [Group Q] [Finite Q],
      TauCeti.IsFiniteContinuousQuotient G Q ↔ TauCeti.IsFiniteContinuousQuotient H Q) :
    (∃ f : G →* H, Continuous f ∧ Function.Surjective f) ∧
      ∃ g : H →* G, Continuous g ∧ Function.Surjective g :=
  TauCeti.exists_surjective_and_exists_surjective_of_forall_isFiniteContinuousQuotient_iff hG h

/-- **Layer 8, finite-quotient determinacy, sharp form.** With no finite-generation hypothesis on
`H`, `G ≅ H` as topological groups:
`TauCeti.nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff`. -/
example (hG : TauCeti.IsTopologicallyFinitelyGenerated G)
    (h : ∀ (Q : Type u) [Group Q] [Finite Q],
      TauCeti.IsFiniteContinuousQuotient G Q ↔ TauCeti.IsFiniteContinuousQuotient H Q) :
    Nonempty (G ≃ₜ* H) :=
  TauCeti.nonempty_continuousMulEquiv_of_forall_isFiniteContinuousQuotient_iff hG h

end FiniteQuotients

/-- **Layer 8, corollary** (Dixon–Formanek–Poland–Ribes). Finitely generated abstract groups with
the same finite quotients have topologically isomorphic profinite completions:
`TauCeti.ProfiniteCompletion.nonempty_continuousMulEquiv_of_forall_exists_surjective_iff`. -/
example {G H : Type u} [Group G] [Group H] [Group.FG G]
    (h : ∀ (Q : Type u) [Group Q] [Finite Q],
      (∃ f : G →* Q, Function.Surjective f) ↔ ∃ f : H →* Q, Function.Surjective f) :
    Nonempty (ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of G) ≃ₜ*
      ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of H)) :=
  TauCeti.ProfiniteCompletion.nonempty_continuousMulEquiv_of_forall_exists_surjective_iff h

/-! ## Layer 8: the levelwise comparison schema

The data are Tau Ceti's structure `TauCeti.PLowerCentralSeriesComparison p G H S`: realization
maps `map k s : G/λ_k →ₜ* H/λ_k`, each surjective (`map_surjective`), bonding maps
`bond k : S (k + 1) → S k`, and the compatibility square (`commutes`). Tau Ceti does not need
surjectivity of the bonding maps, nor finite generation of `G` or `H` for the one-sided form. -/

section Comparison

variable {p : ℕ} {G H : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G] [Group H] [TopologicalSpace H]
  [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H] {S : ℕ → Type v}
  [∀ k, Finite (S k)] [∀ k, Nonempty (S k)]

/-- **Layer 8, the levelwise comparison theorem.** There are a compatible element `s∞` of
`lim_k S k` and a continuous surjection `Φ : G ↠ H` inducing `ρ_k (s∞)_k` on every level:
`TauCeti.PLowerCentralSeriesComparison.exists_continuous_surjective`. -/
example [Fact p.Prime] (C : TauCeti.PLowerCentralSeriesComparison p G H S)
    (hH : TauCeti.IsProP p H) :
    ∃ (s : ∀ k, S k) (Φ : G →ₜ* H), (∀ k, C.bond k (s (k + 1)) = s k) ∧
      Function.Surjective Φ ∧ ∀ k g, (Φ g : H ⧸ TauCeti.pLowerCentralSeries p H k) =
        C.map k (s k) (g : G ⧸ TauCeti.pLowerCentralSeries p G k) :=
  C.exists_continuous_surjective hH Fact.out

/-- **Layer 8, the two-sided corollary.** Data in both directions, with the Hopf property, give
`G ≅ H` realizing the forward data:
`TauCeti.PLowerCentralSeriesComparison.exists_continuousMulEquiv`. -/
example [Fact p.Prime] {T : ℕ → Type v} [∀ k, Finite (T k)] [∀ k, Nonempty (T k)]
    (C : TauCeti.PLowerCentralSeriesComparison p G H S)
    (D : TauCeti.PLowerCentralSeriesComparison p H G T) (hG : TauCeti.IsProP p G)
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) (hH : TauCeti.IsProP p H) :
    ∃ (s : ∀ k, S k) (e : G ≃ₜ* H), (∀ k, C.bond k (s (k + 1)) = s k) ∧
      ∀ k g, (e g : H ⧸ TauCeti.pLowerCentralSeries p H k) =
        C.map k (s k) (g : G ⧸ TauCeti.pLowerCentralSeries p G k) :=
  C.exists_continuousMulEquiv D hG hfg hH Fact.out

/-- **Layer 8, the specialization used in Layer 9.** Self-comparison data whose level maps carry
marked elements `a` to `b` (one relator to another) and respect a character at finite level are
realized by an automorphism carrying `a` to `b` and intertwining the characters:
`TauCeti.PLowerCentralSeriesComparison.exists_continuousMulEquiv_preserving`. -/
example [Fact p.Prime] {ι K : Type v} [Group K] [TopologicalSpace K] [IsTopologicalGroup K]
    [CompactSpace K] [TotallyDisconnectedSpace K]
    (C : TauCeti.PLowerCentralSeriesComparison p G G S) (hG : TauCeti.IsProP p G)
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) (a b : ι → G) (χ ψ : G →ₜ* K)
    (hmark : ∀ k s i, C.map k s (a i : G ⧸ TauCeti.pLowerCentralSeries p G k) =
      (b i : G ⧸ TauCeti.pLowerCentralSeries p G k))
    (hchar : ∀ U : OpenNormalSubgroup K, ∃ k, ∀ (s : S k) (x y : G),
      C.map k s (x : G ⧸ TauCeti.pLowerCentralSeries p G k) =
          (y : G ⧸ TauCeti.pLowerCentralSeries p G k) →
        (ψ y : K ⧸ U.toSubgroup) = (χ x : K ⧸ U.toSubgroup)) :
    ∃ (s : ∀ k, S k) (e : G ≃ₜ* G), (∀ k, C.bond k (s (k + 1)) = s k) ∧
      (∀ k g, (e g : G ⧸ TauCeti.pLowerCentralSeries p G k) =
        C.map k (s k) (g : G ⧸ TauCeti.pLowerCentralSeries p G k)) ∧
      (∀ i, e (a i) = b i) ∧ ψ.comp (e : G →ₜ* G) = χ :=
  C.exists_continuousMulEquiv_preserving hG hfg Fact.out a b χ ψ hmark hchar

end Comparison


/-! ## Layer 9 prerequisites: bilinear forms over `𝔽_p` -/

section Bilinear

open LinearMap (BilinForm)

/-- **Layer 9, basics: left and right nondegeneracy agree** for a finite-dimensional space, and
nondegeneracy is the vanishing of the left radical `ker b`
(`LinearMap.BilinForm.nondegenerate_iff_ker_eq_bot`); the agreement is read off a matrix of `b`
(`LinearMap.BilinForm.separatingLeft_toMatrix_iff`, `Matrix.separatingLeft_iff_separatingRight`). -/
example {K V : Type u} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (b : BilinForm K V) :
    (b.SeparatingLeft ↔ b.SeparatingRight) ∧ (b.Nondegenerate ↔ LinearMap.ker b = ⊥) :=
  ⟨(LinearMap.BilinForm.separatingLeft_toMatrix_iff (Module.finBasis K V)).symm.trans
      (Matrix.separatingLeft_iff_separatingRight.trans
        (LinearMap.BilinForm.separatingRight_toMatrix_iff (Module.finBasis K V))),
    LinearMap.BilinForm.nondegenerate_iff_ker_eq_bot⟩

/-- **Layer 9, basics: transport and equivalence.** A linear equivalence `e` transports a form
by `(e_* b) x y = b (e⁻¹ x) (e⁻¹ y)` (`LinearMap.BilinForm.congr_apply`), and two forms are
equivalent when an isometric linear equivalence exists (`LinearMap.BilinForm.Equivalent`). -/
example {K V V' : Type u} [Field K] [AddCommGroup V] [Module K V] [AddCommGroup V']
    [Module K V'] (e : V ≃ₗ[K] V') (b : BilinForm K V) (b' : BilinForm K V') (x y : V') :
    LinearMap.BilinForm.congr e b x y = b (e.symm x) (e.symm y) ∧
      (b.Equivalent b' ↔ Nonempty (b.IsometryEquiv b')) :=
  ⟨LinearMap.BilinForm.congr_apply e b x y, Iff.rfl⟩

/-- **Layer 9, alternating, skew-symmetric, symmetric.** `IsAlt b` is `∀ x, b x x = 0`; it
implies skew-symmetry in every characteristic (`LinearMap.BilinForm.IsAlt.neg_eq`); and for odd
`p` a form that is both symmetric and alternating is zero
(`TauCeti.BilinForm.eq_zero_of_isSymm_of_isAlt`). -/
example {p : ℕ} [Fact p.Prime] {V : Type u} [AddCommGroup V] [Module (ZMod p) V]
    (b : BilinForm (ZMod p) V) :
    (b.IsAlt ↔ ∀ x, b x x = 0) ∧ (b.IsAlt → ∀ x y, b y x = -b x y) ∧
      (p ≠ 2 → b.IsSymm → b.IsAlt → b = 0) := by
  refine ⟨Iff.rfl, fun h x y ↦ (h.neg_eq x y).symm, fun hp hs ha ↦ ?_⟩
  have h2 : (2 : ZMod p) ≠ 0 := by
    intro h
    have h' : ((2 : ℕ) : ZMod p) = 0 := by exact_mod_cast h
    rw [ZMod.natCast_eq_zero_iff] at h'
    exact hp ((Nat.prime_dvd_prime_iff_eq Fact.out Nat.prime_two).mp h')
  exact TauCeti.BilinForm.eq_zero_of_isSymm_of_isAlt (mul_right_injective₀ h2) hs ha

/-- **Layer 9, characteristic two.** Over `𝔽_2` symmetric and skew-symmetric are the same
condition, and for a symmetric form the diagonal `x ↦ b x x` is additive, with
`b (c x) (c x) = c² b x x`. -/
example {V : Type u} [AddCommGroup V] [Module (ZMod 2) V] (b : BilinForm (ZMod 2) V) :
    (b.IsSymm ↔ ∀ x y, b y x = -b x y) ∧
      (b.IsSymm → ∀ x y, b (x + y) (x + y) = b x x + b y y) ∧
      ∀ (c : ZMod 2) x, b (c • x) (c • x) = c ^ 2 * b x x := by
  refine ⟨?_, fun hs x y ↦ ?_, fun c x ↦ ?_⟩
  · have hneg : ∀ z : ZMod 2, -z = z := by decide
    rw [LinearMap.BilinForm.isSymm_def]
    exact ⟨fun h x y ↦ by rw [hneg, h], fun h x y ↦ by rw [h, hneg]⟩
  · have h2 : ∀ z : ZMod 2, z + z = 0 := by decide
    simp only [map_add, LinearMap.add_apply, hs.eq y x]
    linear_combination h2 (b x y)
  · simp only [map_smul, LinearMap.smul_apply, smul_eq_mul]
    ring

/-- **Layer 9, symplectic normal form**, for every `p`: a nondegenerate alternating form has a
basis indexed by `Fin m ⊕ Fin m` in which its matrix is the standard symplectic matrix
`Matrix.J` (`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`), so `dim V` is even
(`LinearMap.BilinForm.IsAlt.even_finrank`). `Matrix.J` is `[[0, -1], [1, 0]]` in blocks of size
`m`, which is the README's block-diagonal form after reordering the basis. -/
example {p : ℕ} [Fact p.Prime] {V : Type u} [AddCommGroup V] [Module (ZMod p) V]
    [FiniteDimensional (ZMod p) V] (b : BilinForm (ZMod p) V) (ha : b.IsAlt)
    (hnd : b.Nondegenerate) :
    (∃ (m : ℕ) (e : Module.Basis (Fin m ⊕ Fin m) (ZMod p) V),
      LinearMap.BilinForm.toMatrix e b = Matrix.J (Fin m) (ZMod p)) ∧
      Even (Module.finrank (ZMod p) V) :=
  ⟨ha.exists_basis_toMatrix_eq_J hnd, ha.even_finrank hnd⟩

/-- **Layer 9, characteristic two, nonalternating.** A symmetric, nondegenerate, nonalternating
form over `𝔽_2` has a basis in which its matrix is the identity
(`LinearMap.BilinForm.IsSymm.exists_basis_toMatrix_eq_one`), and any two of the same dimension
are equivalent (`LinearMap.BilinForm.IsSymm.equivalent_of_finrank_eq`). -/
example {V V' : Type u} [AddCommGroup V] [Module (ZMod 2) V] [FiniteDimensional (ZMod 2) V]
    [AddCommGroup V'] [Module (ZMod 2) V'] [FiniteDimensional (ZMod 2) V']
    (b : BilinForm (ZMod 2) V) (hs : b.IsSymm) (hnd : b.Nondegenerate) (ha : ¬ b.IsAlt)
    (b' : BilinForm (ZMod 2) V') (hs' : b'.IsSymm) (hnd' : b'.Nondegenerate) (ha' : ¬ b'.IsAlt)
    (hdim : Module.finrank (ZMod 2) V = Module.finrank (ZMod 2) V') :
    (∃ e : Module.Basis (Fin (Module.finrank (ZMod 2) V)) (ZMod 2) V,
      LinearMap.BilinForm.toMatrix e b = 1) ∧ b.Equivalent b' :=
  ⟨hs.exists_basis_toMatrix_eq_one isSquare_of_charTwo' hnd fun h ↦ (ha h).elim,
    hs.equivalent_of_finrank_eq isSquare_of_charTwo' hnd (fun h ↦ (ha h).elim) hs' hnd'
      (fun h ↦ (ha' h).elim) hdim⟩

/-- **Layer 9, such forms exist in every dimension `n ≥ 1`**, odd and even: the standard form
`Σ x_i y_i` on `𝔽_2^n`, `Matrix.toBilin' 1`, is symmetric, nondegenerate and not alternating. -/
example (n : ℕ) (hn : 0 < n) :
    (Matrix.toBilin' (1 : Matrix (Fin n) (Fin n) (ZMod 2))).IsSymm ∧
      (Matrix.toBilin' (1 : Matrix (Fin n) (Fin n) (ZMod 2))).Nondegenerate ∧
      ¬ (Matrix.toBilin' (1 : Matrix (Fin n) (Fin n) (ZMod 2))).IsAlt := by
  refine ⟨LinearMap.BilinForm.isSymm_def.mpr fun x y ↦ ?_,
    LinearMap.BilinForm.nondegenerate_toBilin'_iff_det_ne_zero.mpr (by simp), fun h ↦ ?_⟩
  · simp only [Matrix.toBilin'_apply', Matrix.one_mulVec, dotProduct_comm]
  · have := h (Pi.single ⟨0, hn⟩ 1)
    simp [Matrix.toBilin'_apply'] at this

/-- **Layer 9, the change-of-basis theorem that Layer 9 uses.** A nondegenerate form that is
alternating, for any `p`, has the symplectic normal form and even dimension; at `p = 2` a
nondegenerate symmetric form has either the symplectic form (alternating) or the identity (not
alternating): `LinearMap.BilinForm.Nondegenerate.exists_basis_toMatrix_eq_J_or_toMatrix_eq_one`. -/
example {V : Type u} [AddCommGroup V] [Module (ZMod 2) V] [FiniteDimensional (ZMod 2) V]
    (b : BilinForm (ZMod 2) V) (hnd : b.Nondegenerate) (hs : b.IsSymm) :
    (b.IsAlt ∧ (∃ (m : ℕ) (e : Module.Basis (Fin m ⊕ Fin m) (ZMod 2) V),
        LinearMap.BilinForm.toMatrix e b = Matrix.J (Fin m) (ZMod 2)) ∧
        Even (Module.finrank (ZMod 2) V)) ∨
      (¬ b.IsAlt ∧ ∃ e : Module.Basis (Fin (Module.finrank (ZMod 2) V)) (ZMod 2) V,
        LinearMap.BilinForm.toMatrix e b = 1) := by
  rcases hnd.exists_basis_toMatrix_eq_J_or_toMatrix_eq_one isSquare_of_charTwo' (Or.inr hs) with
    ⟨ha, h⟩ | h
  · exact Or.inl ⟨ha, h, ha.even_finrank hnd⟩
  · exact Or.inr h

end Bilinear

/-! ### From the cup matrix to the relator

For a relator `r ∈ λ_1(F)`, `F = freeProP p X`, Tau Ceti attaches to `r̄ ∈ gr_1(F)` the
degree-one form `TauCeti.freeProP.degreeOneForm r̄`, a bilinear form on the continuous dual of
`F`, which is `H¹(G, 𝔽_p)` for `G = F/(r)`. -/

section CupMatrix

variable {p : ℕ} [Fact p.Prime] {X : Type u} [Finite X] [LinearOrder X]

/-- **Layer 9, the coefficients of `r̄` are the entries of the form matrix.** In the dual basis of
the generators, the entry at `i < j` is the commutator coefficient `a_{ij}` of `r̄`
(`TauCeti.freeProP.degreeOneForm_dualBasis_of_lt`) and the diagonal entry is `binom(p, 2) c_i`
(`TauCeti.freeProP.degreeOneForm_dualBasis_self`). -/
example (ρ : TauCeti.gradedPiece p (TauCeti.freeProP p X) 1) {i j : X} (hij : i < j) :
    TauCeti.freeProP.degreeOneForm ρ (TauCeti.freeProP.dualBasis p X i)
        (TauCeti.freeProP.dualBasis p X j) =
      (TauCeti.freeProP.degreeOneBasis p X).repr ρ (Sum.inr ⟨(i, j), hij⟩) ∧
    TauCeti.freeProP.degreeOneForm ρ (TauCeti.freeProP.dualBasis p X i)
        (TauCeti.freeProP.dualBasis p X i) =
      p.choose 2 • (TauCeti.freeProP.degreeOneBasis p X).repr ρ (Sum.inl i) :=
  ⟨TauCeti.freeProP.degreeOneForm_dualBasis_of_lt ρ hij,
    TauCeti.freeProP.degreeOneForm_dualBasis_self ρ i⟩

/-- **Layer 9, the form is the cup product** (Labute Prop. 3): through the injective relator
functional `H²(G, 𝔽_p) → 𝔽_p` of `r`, the cup product `a ∪ b` is minus the degree-one form of `r̄`
at the characters of `F` attached to `a` and `b`: `TauCeti.freeProP.relatorFunctional_cupFp`. -/
example {R : Subgroup (TauCeti.freeProP p X)} [R.Normal] {G : Type v} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [LocallyCompactSpace G]
    (hRc : IsClosed (R : Set (TauCeti.freeProP p X)))
    (hR : R ≤ TauCeti.proPFrattini p (TauCeti.freeProP p X))
    (e : TauCeti.freeProP p X ⧸ R ≃ₜ* G) (r : R) (a b : TauCeti.cohomFp p G 1) :
    TauCeti.freeProP.relatorFunctional hRc hR e r (TauCeti.cupFp p G a b) =
      -TauCeti.freeProP.degreeOneForm
          (TauCeti.gradedMk p (TauCeti.freeProP p X) 1 ⟨r, by
            rw [TauCeti.pLowerCentralSeries_one_eq_proPFrattini Fact.out]; exact hR r.2⟩)
          (((e : TauCeti.freeProP p X ⧸ R →ₜ* G).comp
            (TauCeti.ContinuousMonoidHom.quotientMk R)).continuousZModDualMap
              (TauCeti.cohomFpLinearEquivContinuousZModDual p G a))
          (((e : TauCeti.freeProP p X ⧸ R →ₜ* G).comp
            (TauCeti.ContinuousMonoidHom.quotientMk R)).continuousZModDualMap
              (TauCeti.cohomFpLinearEquivContinuousZModDual p G b)) :=
  TauCeti.freeProP.relatorFunctional_cupFp hRc hR e r a b

/-- **Layer 9, a change of basis acts by `B ↦ PᵀBP`.** A continuous homomorphism `φ` of free
pro-`p` groups transforms the form of `r̄` by pulling back along `φ` on the duals
(`TauCeti.freeProP.degreeOneForm_gradedMap`), and every matrix of the form in some basis of the
dual is realized in the standard dual basis after a continuous automorphism of `F`
(`TauCeti.freeProP.exists_continuousMulEquiv_toMatrix_degreeOneForm_gradedMap`), so a normal form
for `B` gives a relator congruent modulo `λ_2(F)` to the normal-form word. -/
example [Fintype X] [DecidableEq X] (φ : TauCeti.freeProP p X →ₜ* TauCeti.freeProP p X)
    (ρ : TauCeti.gradedPiece p (TauCeti.freeProP p X) 1)
    (η : Module.Basis X (ZMod p) (TauCeti.continuousZModDual p (TauCeti.freeProP p X))) :
    TauCeti.freeProP.degreeOneForm (TauCeti.gradedMap p φ.toMonoidHom φ.continuous 1 ρ) =
        (TauCeti.freeProP.degreeOneForm ρ).compl₁₂ φ.continuousZModDualMap
          φ.continuousZModDualMap ∧
      ∃ e : TauCeti.freeProP p X ≃ₜ* TauCeti.freeProP p X,
        LinearMap.BilinForm.toMatrix (TauCeti.freeProP.dualBasis p X)
            (TauCeti.freeProP.degreeOneForm (TauCeti.gradedMap p
              (e : TauCeti.freeProP p X →ₜ* TauCeti.freeProP p X).toMonoidHom
              (e : TauCeti.freeProP p X →ₜ* TauCeti.freeProP p X).continuous 1 ρ)) =
          LinearMap.BilinForm.toMatrix η (TauCeti.freeProP.degreeOneForm ρ) :=
  ⟨TauCeti.freeProP.degreeOneForm_gradedMap φ ρ,
    TauCeti.freeProP.exists_continuousMulEquiv_toMatrix_degreeOneForm_gradedMap ρ η⟩

/-- **Layer 9, which case occurs.** The form of `r̄` is alternating for odd `p`
(`TauCeti.freeProP.isAlt_degreeOneForm_of_ne_two`) and symmetric at `p = 2`
(`TauCeti.freeProP.isSymm_degreeOneForm_of_two`); it is alternating exactly when every cup square
vanishes (`TauCeti.freeProP.isAlt_degreeOneForm_iff_forall_cupFp_self_eq_zero`). -/
example {r : TauCeti.freeProP p X} (hr : r ∈ TauCeti.proPFrattini p (TauCeti.freeProP p X))
    {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    (e : TauCeti.presentedProP p X {r} ≃ₜ* G)
    (ρ : TauCeti.gradedPiece p (TauCeti.freeProP p X) 1) :
    (p ≠ 2 → (TauCeti.freeProP.degreeOneForm ρ).IsAlt) ∧
      (p = 2 → (TauCeti.freeProP.degreeOneForm ρ).IsSymm) ∧
      ((TauCeti.freeProP.degreeOneForm (TauCeti.gradedMk p (TauCeti.freeProP p X) 1 ⟨r, by
          rw [TauCeti.pLowerCentralSeries_one_eq_proPFrattini Fact.out]; exact hr⟩)).IsAlt ↔
        ∀ a : TauCeti.cohomFp p G 1, TauCeti.cupFp p G a a = 0) :=
  ⟨fun hp ↦ TauCeti.freeProP.isAlt_degreeOneForm_of_ne_two hp ρ,
    fun hp ↦ TauCeti.freeProP.isSymm_degreeOneForm_of_two hp ρ,
    TauCeti.freeProP.isAlt_degreeOneForm_iff_forall_cupFp_self_eq_zero hr e⟩

/-- **Layer 9, at `p = 2` the form is alternating exactly when `q ≠ 2`.** At `p = 2` the diagonal
entries are the `2`-power coordinates `c_i`, so the form of `r̄` is alternating exactly when all
`c_i` vanish, and by
`TauCeti.demushkinQ_presentedProP_eq_iff_exists_degreeOneBasis_repr_inl_ne_zero` that is
`q ≠ 2`. -/
example {r : TauCeti.freeProP 2 X} (hr : r ∈ TauCeti.proPFrattini 2 (TauCeti.freeProP 2 X))
    (hG : TauCeti.IsDemushkin 2 (TauCeti.presentedProP 2 X {r})) :
    (TauCeti.freeProP.degreeOneForm (TauCeti.gradedMk 2 (TauCeti.freeProP 2 X) 1 ⟨r, by
        rw [TauCeti.pLowerCentralSeries_one_eq_proPFrattini Fact.out]; exact hr⟩)).IsAlt ↔
      TauCeti.demushkinQ hG ≠ 2 := by
  rw [Ne, TauCeti.demushkinQ_presentedProP_eq_iff_exists_degreeOneBasis_repr_inl_ne_zero hr hG]
  simp only [ne_eq, not_exists, not_not]
  refine ⟨fun h i ↦ ?_, TauCeti.freeProP.isAlt_degreeOneForm_of_repr_inl_eq_zero _⟩
  have := TauCeti.freeProP.degreeOneForm_dualBasis_self
    (TauCeti.gradedMk 2 (TauCeti.freeProP 2 X) 1 ⟨r, by
      rw [TauCeti.pLowerCentralSeries_one_eq_proPFrattini Fact.out]; exact hr⟩) i
  rwa [h, Nat.choose_self, one_nsmul, eq_comm] at this

end CupMatrix

/-! ## Layer 9 prerequisites: the completed group algebra `Λ = ℤ_p[[Γ]]`

The algebra is Tau Ceti's `TauCeti.completedGroupAlgebra ℤ_[p] Γ`, the inverse limit of the group
algebras `ℤ_p[Γ/U]` over the open normal subgroups `U`, with the inverse-limit topology. -/

section CompletedAlgebra

variable (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  [CompactSpace Γ] [TotallyDisconnectedSpace Γ]

/-- **Layer 9, `Λ` is a compact totally disconnected topological `ℤ_p`-algebra**, and a
commutative ring for commutative `Γ`: Tau Ceti's instances. -/
example : IsTopologicalRing (TauCeti.completedGroupAlgebra ℤ_[p] Γ) ∧
    CompactSpace (TauCeti.completedGroupAlgebra ℤ_[p] Γ) ∧
    TotallyDisconnectedSpace (TauCeti.completedGroupAlgebra ℤ_[p] Γ) ∧
    (IsMulCommutative Γ → Nonempty (CommRing (TauCeti.completedGroupAlgebra ℤ_[p] Γ))) :=
  ⟨inferInstance, inferInstance, inferInstance, fun _ ↦ ⟨inferInstance⟩⟩

/-- **Layer 9, the inverse-limit description.** Every finite-level projection is surjective, an
element is determined by its projections, and a compatible family of algebra maps into the
levels lifts uniquely: Tau Ceti's `proj_surjective`, `ext`, `lift`, `proj_lift` and
`algHom_ext`. -/
example (U : OpenNormalSubgroup Γ) {A : Type v} [Semiring A] [Algebra ℤ_[p] A]
    (f : ∀ U : OpenNormalSubgroup Γ, A →ₐ[ℤ_[p]] MonoidAlgebra ℤ_[p] (Γ ⧸ U.toSubgroup))
    (hf : ∀ ⦃U V : OpenNormalSubgroup Γ⦄ (hUV : U ≤ V) (a : A),
      MonoidAlgebra.mapDomain (TauCeti.QuotientGroup.mapOfLE hUV) (f U a) = f V a) (a : A) :
    Function.Surjective (TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U) ∧
      (∀ x y : TauCeti.completedGroupAlgebra ℤ_[p] Γ,
        (∀ V, TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ V x =
          TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ V y) → x = y) ∧
      TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U
          (TauCeti.completedGroupAlgebra.lift ℤ_[p] Γ f hf a) = f U a ∧
      ∀ g₁ g₂ : A →ₐ[ℤ_[p]] TauCeti.completedGroupAlgebra ℤ_[p] Γ,
        (∀ V, (TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ V).comp g₁ =
          (TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ V).comp g₂) → g₁ = g₂ :=
  ⟨TauCeti.completedGroupAlgebra.proj_surjective ℤ_[p] Γ U,
    fun _ _ h ↦ TauCeti.completedGroupAlgebra.ext h,
    TauCeti.completedGroupAlgebra.proj_lift ℤ_[p] Γ f hf U a,
    fun _ _ h ↦ TauCeti.completedGroupAlgebra.algHom_ext h⟩

/-- **Layer 9, the group elements inside `Λ`.** `of` is continuous and injective, and a group
element projects to its class: Tau Ceti's `continuous_of`, `of_injective` and `proj_of`. -/
example (U : OpenNormalSubgroup Γ) (γ : Γ) :
    Continuous (TauCeti.completedGroupAlgebra.of ℤ_[p] Γ) ∧
      Function.Injective (TauCeti.completedGroupAlgebra.of ℤ_[p] Γ) ∧
      TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U (TauCeti.completedGroupAlgebra.of ℤ_[p] Γ γ) =
        MonoidAlgebra.single (γ : Γ ⧸ U.toSubgroup) 1 :=
  ⟨TauCeti.completedGroupAlgebra.continuous_of ℤ_[p] Γ,
    TauCeti.completedGroupAlgebra.of_injective ℤ_[p] Γ,
    TauCeti.completedGroupAlgebra.proj_of ℤ_[p] Γ U γ⟩

/-- **Layer 9, commutativity is not automatic.** `Λ` is commutative exactly when `Γ` is: Tau
Ceti's `isMulCommutative_iff`. -/
example : IsMulCommutative (TauCeti.completedGroupAlgebra ℤ_[p] Γ) ↔ IsMulCommutative Γ :=
  TauCeti.completedGroupAlgebra.isMulCommutative_iff ℤ_[p] Γ

/-- **Layer 9, functoriality of `Λ`.** A continuous homomorphism induces an algebra homomorphism
sending group elements to group elements, surjective for a surjection, with the functor laws:
Tau Ceti's `map`, `map_of`, `map_surjective`, `map_id` and `map_comp`; a topological isomorphism
induces `domCongr` (`domCongr_of`). -/
example {Δ E : Type u} [Group Δ] [TopologicalSpace Δ] [Group E] [TopologicalSpace E]
    (f : Γ →* Δ) (hf : Continuous f) (hs : Function.Surjective f) (g : Δ →* E) (hg : Continuous g)
    (e : Γ ≃ₜ* Δ) (γ : Γ) :
    TauCeti.completedGroupAlgebra.map ℤ_[p] f hf (TauCeti.completedGroupAlgebra.of ℤ_[p] Γ γ) =
        TauCeti.completedGroupAlgebra.of ℤ_[p] Δ (f γ) ∧
      Function.Surjective (TauCeti.completedGroupAlgebra.map ℤ_[p] f hf) ∧
      TauCeti.completedGroupAlgebra.map ℤ_[p] (MonoidHom.id Γ) continuous_id =
        AlgHom.id ℤ_[p] (TauCeti.completedGroupAlgebra ℤ_[p] Γ) ∧
      TauCeti.completedGroupAlgebra.map ℤ_[p] (g.comp f) (hg.comp hf) =
        (TauCeti.completedGroupAlgebra.map ℤ_[p] g hg).comp
          (TauCeti.completedGroupAlgebra.map ℤ_[p] f hf) ∧
      TauCeti.completedGroupAlgebra.domCongr ℤ_[p] e
          (TauCeti.completedGroupAlgebra.of ℤ_[p] Γ γ) =
        TauCeti.completedGroupAlgebra.of ℤ_[p] Δ (e γ) :=
  ⟨TauCeti.completedGroupAlgebra.map_of ℤ_[p] f hf γ,
    TauCeti.completedGroupAlgebra.map_surjective ℤ_[p] f hf hs,
    TauCeti.completedGroupAlgebra.map_id ℤ_[p],
    TauCeti.completedGroupAlgebra.map_comp ℤ_[p] f hf g hg,
    TauCeti.completedGroupAlgebra.domCongr_of ℤ_[p] e γ⟩

end CompletedAlgebra

/-- **Layer 9 checklist, examples.** For a finite (discrete) `Γ` the projection at `U = 1` is an
isomorphism onto the finite group algebra
(`TauCeti.completedGroupAlgebra.proj_openNormalSubgroupBot_bijective`, with
`TauCeti.completedGroupAlgebra.equivMonoidAlgebra`); for the trivial group `Λ = ℤ_p`
(`TauCeti.completedGroupAlgebra.algebraMap_bijective_of_subsingleton`); and for `Γ = ℤ_p`
evaluation at `T ↦ γ - 1` is an isomorphism `ℤ_p[[T]] ≅ Λ`
(`TauCeti.completedGroupAlgebra.aeval_bijective_multiplicative_padicInt`). -/
example (p : ℕ) [Fact p.Prime] (Γ Γ₁ : Type u) [Group Γ] [TopologicalSpace Γ] [DiscreteTopology Γ]
    [Group Γ₁] [TopologicalSpace Γ₁] [Subsingleton Γ₁] (γ : Γ) :
    Function.Bijective
        (TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ (TauCeti.openNormalSubgroupBot Γ)) ∧
      TauCeti.completedGroupAlgebra.equivMonoidAlgebra ℤ_[p] Γ
          (TauCeti.completedGroupAlgebra.of ℤ_[p] Γ γ) = MonoidAlgebra.single γ 1 ∧
      Function.Bijective (algebraMap ℤ_[p] (TauCeti.completedGroupAlgebra ℤ_[p] Γ₁)) ∧
      Function.Bijective (PowerSeries.aeval (R := ℤ_[p])
        (TauCeti.completedGroupAlgebra.isTopologicallyNilpotent_of_sub_one
          (TauCeti.isProP_multiplicative_padicInt p) (Multiplicative.ofAdd (1 : ℤ_[p])))) :=
  ⟨TauCeti.completedGroupAlgebra.proj_openNormalSubgroupBot_bijective ℤ_[p] Γ,
    TauCeti.completedGroupAlgebra.equivMonoidAlgebra_of γ,
    TauCeti.completedGroupAlgebra.algebraMap_bijective_of_subsingleton ℤ_[p] Γ₁,
    TauCeti.completedGroupAlgebra.aeval_bijective_multiplicative_padicInt p⟩

/-! ### Compact modules over `Λ` -/

section CompactModules

variable (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  [CompactSpace Γ] [TotallyDisconnectedSpace Γ]
  (M : Type v) [AddCommGroup M] [Module (TauCeti.completedGroupAlgebra ℤ_[p] Γ) M]
  [TopologicalSpace M]

/-- **Layer 9, a compact `Λ`-module**, by its content: Tau Ceti's `TauCeti.IsCompactModule` at
`Λ` says that `M` is a topological additive group with continuous scalar action, compact and
totally disconnected. -/
example : TauCeti.IsCompactModule (TauCeti.completedGroupAlgebra ℤ_[p] Γ) M ↔
    IsTopologicalAddGroup M ∧ ContinuousSMul (TauCeti.completedGroupAlgebra ℤ_[p] Γ) M ∧
      CompactSpace M ∧ TotallyDisconnectedSpace M :=
  ⟨fun h ↦ ⟨h.1, h.2, h.3, h.4⟩, fun ⟨h₁, h₂, h₃, h₄⟩ ↦ ⟨h₁, h₂, h₃, h₄⟩⟩

/-- **Layer 9, the structure of a compact `Λ`-module.** Its open submodules form a basis at `0`
(`IsCompactModule.isLinearTopology`), it is Hausdorff (`IsCompactModule.t2Space`) and separated
by its open submodules (`IsCompactModule.eq_zero_of_forall_mem_of_isOpen`), and a compatible
family in its quotients by the open submodules comes from exactly one element
(`IsCompactModule.existsUnique_forall_mkQ_eq`). -/
example (hM : TauCeti.IsCompactModule (TauCeti.completedGroupAlgebra ℤ_[p] Γ) M)
    (x : M) (h : ∀ N : Submodule (TauCeti.completedGroupAlgebra ℤ_[p] Γ) M,
      IsOpen (N : Set M) → x ∈ N)
    (y : ∀ N : {N : Submodule (TauCeti.completedGroupAlgebra ℤ_[p] Γ) M // IsOpen (N : Set M)},
      M ⧸ N.1)
    (hy : ∀ ⦃N N' : {N : Submodule (TauCeti.completedGroupAlgebra ℤ_[p] Γ) M //
      IsOpen (N : Set M)}⦄ (h : N.1 ≤ N'.1), Submodule.factor h (y N) = y N') :
    IsLinearTopology (TauCeti.completedGroupAlgebra ℤ_[p] Γ) M ∧ T2Space M ∧ x = 0 ∧
      ∃! m : M, ∀ N, N.1.mkQ m = y N :=
  ⟨hM.isLinearTopology, hM.t2Space, hM.eq_zero_of_forall_mem_of_isOpen h,
    hM.existsUnique_forall_mkQ_eq y hy⟩

/-- **Layer 9, quotients stay compact**: the quotient by a closed submodule is a compact module,
Tau Ceti's `IsCompactModule.quotient`. -/
example (hM : TauCeti.IsCompactModule (TauCeti.completedGroupAlgebra ℤ_[p] Γ) M)
    (N : Submodule (TauCeti.completedGroupAlgebra ℤ_[p] Γ) M) (hN : IsClosed (N : Set M)) :
    TauCeti.IsCompactModule (TauCeti.completedGroupAlgebra ℤ_[p] Γ) (M ⧸ N) :=
  hM.quotient N hN

end CompactModules

/-- **Layer 9, a compact `ℤ_p`-module with a continuous `Γ`-action is a `Λ`-module** in which a
group element acts as it does: `TauCeti.IsCompactModule.completedGroupAlgebraModule` with
`completedSMul_of`. -/
example (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CompactSpace Γ] {M : Type v} [AddCommGroup M] [Module ℤ_[p] M] [DistribMulAction Γ M]
    [SMulCommClass Γ ℤ_[p] M] [TopologicalSpace M] [ContinuousSMul Γ M]
    (hM : TauCeti.IsCompactModule ℤ_[p] M) (γ : Γ) (m : M) :
    letI := hM.completedGroupAlgebraModule Γ
    TauCeti.completedGroupAlgebra.of ℤ_[p] Γ γ • m = γ • m :=
  hM.completedSMul_of γ m

/-- **Layer 9, the lifting lemma for towers**: along a tower of compact Hausdorff spaces and a
tower of `T1` spaces, continuous levelwise surjections commuting with the transition maps lift
every compatible family downstairs: Tau Ceti's
`TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective`. -/
example {A B : ℕ → Type u} [∀ k, TopologicalSpace (A k)] [∀ k, CompactSpace (A k)]
    [∀ k, T2Space (A k)] [∀ k, TopologicalSpace (B k)] [∀ k, T1Space (B k)]
    (α : ∀ k, A (k + 1) → A k) (β : ∀ k, B (k + 1) → B k) (g : ∀ k, A k → B k)
    (hα : ∀ k, Continuous (α k)) (hg : ∀ k, Continuous (g k))
    (hsq : ∀ k (a : A (k + 1)), g k (α k a) = β k (g (k + 1) a))
    (hgs : ∀ k, Function.Surjective (g k)) (b : ∀ k, B k) (hb : ∀ k, β k (b (k + 1)) = b k) :
    ∃ a : ∀ k, A k, (∀ k, α k (a (k + 1)) = a k) ∧ ∀ k, g k (a k) = b k :=
  TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective α β g hα hg hsq hgs b hb

/-! ### The procyclic coordinate, evaluation and division -/

section ProcyclicCoordinate

open scoped PowerSeries.WithPiTopology

variable {p : ℕ} [Fact p.Prime] {Γ : Type u} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
  [CompactSpace Γ] [TotallyDisconnectedSpace Γ] [IsMulCommutative Γ] [Infinite Γ]
  (hΓ : TauCeti.IsProP p Γ) {γ : Γ} (hγ : (Subgroup.closure ({γ} : Set Γ)).topologicalClosure = ⊤)

/-- **Layer 9, the procyclic coordinate.** `T ↦ γ - 1` is an isomorphism of `ℤ_p`-algebras
`ℤ_p[[T]] ≅ Λ` and a homeomorphism for the coefficientwise topology: Tau Ceti's
`powerSeriesCoordinate`, with `powerSeriesCoordinate_X`, `powerSeriesCoordinate_one_add_X`,
`continuous_powerSeriesCoordinate`, `continuous_powerSeriesCoordinate_symm` and
`powerSeriesCoordinate_binomialSeries`. -/
example (u : ℤ_[p]) :
    TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ PowerSeries.X =
        TauCeti.completedGroupAlgebra.of ℤ_[p] Γ γ - 1 ∧
      TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ (1 + PowerSeries.X) =
        TauCeti.completedGroupAlgebra.of ℤ_[p] Γ γ ∧
      Continuous (TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ) ∧
      Continuous (TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ).symm ∧
      TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ
          (PowerSeries.binomialSeries ℤ_[p] u) =
        TauCeti.completedGroupAlgebra.of ℤ_[p] Γ (hΓ.padicPow γ u) :=
  ⟨TauCeti.completedGroupAlgebra.powerSeriesCoordinate_X hΓ hγ,
    TauCeti.completedGroupAlgebra.powerSeriesCoordinate_one_add_X hΓ hγ,
    TauCeti.completedGroupAlgebra.continuous_powerSeriesCoordinate hΓ hγ,
    TauCeti.completedGroupAlgebra.continuous_powerSeriesCoordinate_symm hΓ hγ,
    TauCeti.completedGroupAlgebra.powerSeriesCoordinate_binomialSeries hΓ hγ u⟩

/-- **Layer 9, the finite levels through the coordinate are principal**, generated by
`ω_U = (1 + T)^[Γ : U] - 1`: Tau Ceti's `proj_powerSeriesCoordinate_eq_zero_iff`,
`ker_proj_comp_powerSeriesCoordinate`, and, inside `Λ`, `ker_proj`. -/
example (U : OpenNormalSubgroup Γ) (ψ : PowerSeries ℤ_[p]) :
    (TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U
        (TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ ψ) = 0 ↔
      (1 + PowerSeries.X) ^ Nat.card (Γ ⧸ U.toSubgroup) - 1 ∣ ψ) ∧
    RingHom.ker ((TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U).comp
        (TauCeti.completedGroupAlgebra.powerSeriesCoordinate hΓ hγ).toAlgHom) =
      Ideal.span {((1 + PowerSeries.X) ^ Nat.card (Γ ⧸ U.toSubgroup) - 1 :
        PowerSeries ℤ_[p])} ∧
    RingHom.ker (TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U) =
      Ideal.span {TauCeti.completedGroupAlgebra.of ℤ_[p] Γ γ ^ Nat.card (Γ ⧸ U.toSubgroup) - 1} :=
  ⟨TauCeti.completedGroupAlgebra.proj_powerSeriesCoordinate_eq_zero_iff hΓ hγ U ψ,
    TauCeti.completedGroupAlgebra.ker_proj_comp_powerSeriesCoordinate hΓ hγ U,
    TauCeti.completedGroupAlgebra.ker_proj hΓ hγ U⟩

/-- **Layer 9, the dependence on the generator.** The coordinates of two topological generators
differ by the substitution `T ↦ (1 + T)^u - 1` for a unit `u` of `ℤ_p`: Tau Ceti's
`exists_isUnit_powerSeriesCoordinate_eq_subst`. -/
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
topologically nilpotent (`TauCeti.Huber.PadicInt.isTopologicallyNilpotent_iff_dvd`), so
`PowerSeries.aeval` evaluates at `c`, with `X ↦ c` and `C a ↦ a`. -/
example {c : ℤ_[p]} (hc : (p : ℤ_[p]) ∣ c) (a : ℤ_[p]) :
    PowerSeries.aeval (TauCeti.Huber.PadicInt.isTopologicallyNilpotent_iff_dvd.mpr hc)
        (PowerSeries.X : PowerSeries ℤ_[p]) = c ∧
      PowerSeries.aeval (TauCeti.Huber.PadicInt.isTopologicallyNilpotent_iff_dvd.mpr hc)
        (PowerSeries.C a) = algebraMap ℤ_[p] ℤ_[p] a :=
  ⟨PowerSeries.aeval_X _, PowerSeries.aeval_C _ a⟩

/-- **Layer 9, the division criterion** `(T - c) ∣ ψ ↔ ψ(c) = 0` for `p ∣ c`, with the explicit
quotient `PowerSeries.divXSubC`: `PadicInt.X_sub_C_dvd_iff_aeval_eq_zero` and
`PadicInt.X_sub_C_mul_divXSubC`. -/
example {c : ℤ_[p]} (hc : (p : ℤ_[p]) ∣ c) (ψ : PowerSeries ℤ_[p]) :
    ((PowerSeries.X - PowerSeries.C c) ∣ ψ ↔
      PowerSeries.aeval (TauCeti.Huber.PadicInt.isTopologicallyNilpotent_iff_dvd.mpr hc) ψ = 0) ∧
    (PowerSeries.aeval (TauCeti.Huber.PadicInt.isTopologicallyNilpotent_iff_dvd.mpr hc) ψ = 0 →
      (PowerSeries.X - PowerSeries.C c) *
        PowerSeries.divXSubC (TauCeti.Huber.PadicInt.isTopologicallyNilpotent_iff_dvd.mpr hc) ψ =
      ψ) :=
  ⟨PadicInt.X_sub_C_dvd_iff_aeval_eq_zero hc ψ, PadicInt.X_sub_C_mul_divXSubC hc⟩

end Evaluation

/-! ### The dyadic branch `Γ ≅ C₂ × ℤ₂` -/

section DyadicAlgebra

variable {Γ : Type u} [Group Γ] [TopologicalSpace Γ]
  (e : Γ ≃ₜ* Multiplicative (ZMod 2) × Multiplicative ℤ_[2])

/-- **Layer 9, the dyadic coordinate** `ℤ₂[C₂][[T]] ≅ ℤ₂[[Γ]]`, `T ↦ γ - 1` for
`γ = e⁻¹(1, ofAdd 1)` and `σ ↦ e⁻¹(σ, 1)`: Tau Ceti's `dyadicCoordinate e`, with
`dyadicCoordinate_X`, `dyadicCoordinate_C_single` and the inverse values
`dyadicCoordinate_symm_of_inl`, `dyadicCoordinate_symm_of_inr`. -/
example (σ : Multiplicative (ZMod 2)) (a : ℤ_[2]) :
    TauCeti.completedGroupAlgebra.dyadicCoordinate e PowerSeries.X =
        TauCeti.completedGroupAlgebra.of ℤ_[2] Γ (e.symm (1, Multiplicative.ofAdd 1)) - 1 ∧
      TauCeti.completedGroupAlgebra.dyadicCoordinate e
          (PowerSeries.C (MonoidAlgebra.single σ a)) =
        algebraMap ℤ_[2] (TauCeti.completedGroupAlgebra ℤ_[2] Γ) a *
          TauCeti.completedGroupAlgebra.of ℤ_[2] Γ (e.symm (σ, 1)) ∧
      (TauCeti.completedGroupAlgebra.dyadicCoordinate e).symm
          (TauCeti.completedGroupAlgebra.of ℤ_[2] Γ (e.symm (σ, 1))) =
        PowerSeries.C (MonoidAlgebra.single σ 1) ∧
      (TauCeti.completedGroupAlgebra.dyadicCoordinate e).symm
          (TauCeti.completedGroupAlgebra.of ℤ_[2] Γ (e.symm (1, Multiplicative.ofAdd 1))) =
        1 + PowerSeries.X :=
  ⟨TauCeti.completedGroupAlgebra.dyadicCoordinate_X e,
    TauCeti.completedGroupAlgebra.dyadicCoordinate_C_single e σ a,
    TauCeti.completedGroupAlgebra.dyadicCoordinate_symm_of_inl e σ,
    TauCeti.completedGroupAlgebra.dyadicCoordinate_symm_of_inr e⟩

/-- **Layer 9, the finite levels through the dyadic coordinate.** For the open normal subgroup
`U_m = e⁻¹({1} × 2^m ℤ₂)`, pinned by `hU`, the kernel of the projection to `U_m` read through
the dyadic coordinate is generated by `(1 + T)^(2^m) - 1`: Tau Ceti's
`TauCeti.completedGroupAlgebra.proj_dyadicCoordinate_eq_zero_iff` at the level
`TauCeti.completedGroupAlgebra.dyadicLevel e m`, which is `U` by `mem_dyadicLevel_iff`. -/
theorem completedGroupAlgebra.dyadicCoordinate_proj_eq_zero_iff (m : ℕ)
    (U : OpenNormalSubgroup Γ)
    (hU : ∀ γ : Γ, γ ∈ U.toSubgroup ↔
      (e γ).1 = 1 ∧ (2 ^ m : ℤ_[2]) ∣ Multiplicative.toAdd (e γ).2)
    (ψ : PowerSeries (MonoidAlgebra ℤ_[2] (Multiplicative (ZMod 2)))) :
    TauCeti.completedGroupAlgebra.proj ℤ_[2] Γ U
        (TauCeti.completedGroupAlgebra.dyadicCoordinate e ψ) = 0 ↔
      ((1 + PowerSeries.X) ^ (2 ^ m) - 1 :
        PowerSeries (MonoidAlgebra ℤ_[2] (Multiplicative (ZMod 2)))) ∣ ψ := by
  have hUm : U = TauCeti.completedGroupAlgebra.dyadicLevel e m := by
    ext γ
    exact (hU γ).trans (TauCeti.completedGroupAlgebra.mem_dyadicLevel_iff e m).symm
  subst hUm
  exact TauCeti.completedGroupAlgebra.proj_dyadicCoordinate_eq_zero_iff e m ψ

/-- **Layer 9, those levels are cofinal.** Every open normal subgroup of `Γ` contains some
`U_m`: Tau Ceti's `TauCeti.completedGroupAlgebra.exists_dyadicLevel_le` with
`mem_dyadicLevel_iff`. -/
theorem completedGroupAlgebra.exists_dyadicLevel_le (V : OpenNormalSubgroup Γ) :
    ∃ m : ℕ, ∀ γ : Γ, (e γ).1 = 1 → (2 ^ m : ℤ_[2]) ∣ Multiplicative.toAdd (e γ).2 →
      γ ∈ V.toSubgroup := by
  obtain ⟨m, hm⟩ := TauCeti.completedGroupAlgebra.exists_dyadicLevel_le e V
  exact ⟨m, fun γ h₁ h₂ ↦
    hm ((TauCeti.completedGroupAlgebra.mem_dyadicLevel_iff e m).mpr ⟨h₁, h₂⟩)⟩

/-- **Layer 9, the splitting after inverting `2`, and its failure over `ℤ₂`.**
`ℚ₂[C₂] ≅ ℚ₂ × ℚ₂` (`TauCeti.monoidAlgebraRatPadicCyclicTwoEquiv`), while the only idempotents of
`ℤ₂[C₂]` are `0` and `1` (`TauCeti.monoidAlgebraPadicIntCyclicTwo_isIdempotentElem_iff`). -/
example (x : MonoidAlgebra ℤ_[2] (Multiplicative (ZMod 2))) :
    Nonempty (MonoidAlgebra ℚ_[2] (Multiplicative (ZMod 2)) ≃ₐ[ℚ_[2]] ℚ_[2] × ℚ_[2]) ∧
      (IsIdempotentElem x ↔ x = 0 ∨ x = 1) :=
  ⟨⟨TauCeti.monoidAlgebraRatPadicCyclicTwoEquiv⟩,
    TauCeti.monoidAlgebraPadicIntCyclicTwo_isIdempotentElem_iff⟩

end DyadicAlgebra

/-! ## Layer 9 prerequisites: Labute's relation module

`E = X/(X, X)` for `X = ker χ` is `TauCeti.labuteE χ`, that is
`Additive (TopologicalAbelianization χ.ker)`; `Γ = F/X` acts by conjugation through Tau Ceti's
`TopologicalAbelianization.instMulDistribMulActionQuotient`, and the `Λ`-module structure is
`TauCeti.IsProP.completedGroupAlgebraModule`. -/

section RelationModule

variable {p : ℕ} [Fact p.Prime] {F : Type u} [Group F] [TopologicalSpace F] [IsTopologicalGroup F]
  [CompactSpace F] [TotallyDisconnectedSpace F]

/-- **Layer 9, points 1 and 2: the object.** `E` is pro-`p` when `F` is
(`TauCeti.IsProP.topologicalAbelianization`), and `Γ = F/ker χ ≅ Im χ`
(`QuotientGroup.quotientKerEquivRange`, which sends the class of `g` to `χ g` by definition,
`TauCeti.QuotientGroup.quotientKerEquivRange_apply_mk`). -/
example (hF : TauCeti.IsProP p F) (χ : F →* ℤ_[p]ˣ) (g : F) :
    TauCeti.IsProP p (TopologicalAbelianization χ.ker) ∧
      (QuotientGroup.quotientKerEquivRange χ (g : F ⧸ χ.ker) : ℤ_[p]ˣ) = χ g :=
  ⟨hF.topologicalAbelianization χ.ker, rfl⟩

/-- **Layer 9, points 6 and 7: the action is conjugation, in Labute's form.** Inner automorphisms
by elements of `X` act trivially on `E` (`TopologicalAbelianization.toConjAct_smul_eq_self_of_mem`),
so the action factors through `Γ`; Mathlib's convention is `ȳ • x̄ = [y x y⁻¹]`
(`TopologicalAbelianization.mk_smul_mk`), and Labute's `[y⁻¹ x y]` is `ȳ⁻¹ • x̄`
(`TopologicalAbelianization.mk_inv_smul_mk`). -/
example (χ : F →* ℤ_[p]ˣ) (y : F) (x : χ.ker) (g : F) (hg : g ∈ χ.ker)
    (ξ : TopologicalAbelianization χ.ker) :
    ConjAct.toConjAct g • ξ = ξ ∧
      (y : F ⧸ χ.ker) • (x : TopologicalAbelianization χ.ker) =
        ((MulAut.conjNormal y x : χ.ker) : TopologicalAbelianization χ.ker) ∧
      (y : F ⧸ χ.ker)⁻¹ • (x : TopologicalAbelianization χ.ker) =
        ((⟨y⁻¹ * x * y, χ.normal_ker.conj_mem' x x.2 y⟩ : χ.ker) :
          TopologicalAbelianization χ.ker) :=
  ⟨TopologicalAbelianization.toConjAct_smul_eq_self_of_mem χ.ker hg ξ,
    TopologicalAbelianization.mk_smul_mk χ.ker y x,
    TopologicalAbelianization.mk_inv_smul_mk χ.ker y x⟩

/-- **Layer 9, point 6: the `Λ`-module structure on `E`**, Tau Ceti's
`IsProP.completedGroupAlgebraModule`: a group element of `Γ` acts as it does on `E`
(`completedGroupAlgebraModule_of_smul`), and the scalar action is continuous
(`continuousSMul_completedGroupAlgebraModule`). -/
example (hF : TauCeti.IsProP p F) (χ : F →ₜ* ℤ_[p]ˣ) (γ : F ⧸ (χ : F →* ℤ_[p]ˣ).ker)
    (ξ : TauCeti.labuteE χ) :
    haveI := χ.isClosed_ker
    letI := (hF.topologicalAbelianization (χ : F →* ℤ_[p]ˣ).ker).completedGroupAlgebraModule
      (F ⧸ (χ : F →* ℤ_[p]ˣ).ker)
    TauCeti.completedGroupAlgebra.of ℤ_[p] (F ⧸ (χ : F →* ℤ_[p]ˣ).ker) γ • ξ = γ • ξ ∧
      ContinuousSMul (TauCeti.completedGroupAlgebra ℤ_[p] (F ⧸ (χ : F →* ℤ_[p]ˣ).ker))
        (TauCeti.labuteE χ) :=
  haveI := χ.isClosed_ker
  ⟨TauCeti.IsProP.completedGroupAlgebraModule_of_smul (hF.topologicalAbelianization _) γ ξ,
    TauCeti.IsProP.continuousSMul_completedGroupAlgebraModule _
      (hF.topologicalAbelianization _)⟩

/-- **Layer 9, point 4: the map from the full relation module.** For a normal `R ≤ X`, the
inclusion induces `R^{ab} → E` intertwining the actions of `F ⧸ R` and `Γ`
(`TopologicalAbelianization.map_inclusion_quotient_smul`), and it sends the class of `r ∈ R` to
`r̄` (`TauCeti.relationModuleToLabuteE_mk`). -/
example (χ : F →ₜ* ℤ_[p]ˣ) (R : Subgroup F) [R.Normal] (hR : R ≤ (χ : F →* ℤ_[p]ˣ).ker)
    (γ : F ⧸ R) (x : TopologicalAbelianization R) (r : R) :
    TopologicalAbelianization.map (Subgroup.inclusion hR) (Subgroup.continuous_inclusion hR)
        (γ • x) =
      QuotientGroup.map R (χ : F →* ℤ_[p]ˣ).ker (MonoidHom.id F)
          (hR.trans (Subgroup.comap_id _).ge) γ •
        TopologicalAbelianization.map (Subgroup.inclusion hR) (Subgroup.continuous_inclusion hR)
          x ∧
    TauCeti.relationModuleToLabuteE χ R hR (Additive.ofMul (r : TopologicalAbelianization R)) =
      TauCeti.labuteRelatorClass χ r (hR r.2) :=
  ⟨TopologicalAbelianization.map_inclusion_quotient_smul hR γ x,
    TauCeti.relationModuleToLabuteE_mk χ R hR r⟩

/-- **Layer 9, `E` is finitely generated over `Λ`, by classes of elements of `X`**, for `F`
topologically finitely generated pro-`p` and `χ` continuous:
`IsProP.exists_finite_span_completedGroupAlgebraModule_topologicalAbelianization_ker_eq_top` and
`IsProP.module_finite_completedGroupAlgebraModule_topologicalAbelianization_ker`. -/
example (hF : TauCeti.IsProP p F) (hfg : TauCeti.IsTopologicallyFinitelyGenerated F)
    (χ : F →* ℤ_[p]ˣ) (hχ : Continuous χ) :
    haveI : IsClosed (χ.ker : Set F) := χ.coe_ker ▸ isClosed_singleton.preimage hχ
    letI := (hF.topologicalAbelianization χ.ker).completedGroupAlgebraModule (F ⧸ χ.ker)
    (∃ S : Set F, S.Finite ∧ S ⊆ χ.ker ∧
      Submodule.span (TauCeti.completedGroupAlgebra ℤ_[p] (F ⧸ χ.ker))
        (Additive.ofMul '' ((QuotientGroup.mk : χ.ker → TopologicalAbelianization χ.ker) ''
          (Subtype.val ⁻¹' S))) = ⊤) ∧
      Module.Finite (TauCeti.completedGroupAlgebra ℤ_[p] (F ⧸ χ.ker))
        (Additive (TopologicalAbelianization χ.ker)) :=
  ⟨hF.exists_finite_span_completedGroupAlgebraModule_topologicalAbelianization_ker_eq_top hfg χ hχ,
    hF.module_finite_completedGroupAlgebraModule_topologicalAbelianization_ker hfg χ hχ⟩

end RelationModule

/-- **Layer 9, point 3: `r̄ ∈ E`**, the class of `r ∈ X = ker χ` in `E = X/(X, X)`, written
additively: Tau Ceti's `TauCeti.labuteRelatorClass`, with defining equation
`TauCeti.labuteRelatorClass_def`. -/
example {p : ℕ} [Fact p.Prime] {F : Type u} [Group F] [TopologicalSpace F] [IsTopologicalGroup F]
    (χ : F →ₜ* ℤ_[p]ˣ) (r : F) (hr : r ∈ (χ : F →* ℤ_[p]ˣ).ker) :
    TauCeti.labuteRelatorClass χ r hr =
      Additive.ofMul ((⟨r, hr⟩ : (χ : F →* ℤ_[p]ˣ).ker) :
        TopologicalAbelianization (χ : F →* ℤ_[p]ˣ).ker) :=
  TauCeti.labuteRelatorClass_def χ r hr

/-- **Layer 9, point 2: the character of a Demushkin relation** (Labute §4, `χ = χ_r`): the
canonical character of `G = F/(r)` composed with `F ↠ G`, Tau Ceti's
`TauCeti.demushkinRelatorCharacter`, with defining equation
`TauCeti.demushkinRelatorCharacter_apply`. -/
example {p : ℕ} [Fact p.Prime] {n : ℕ} {r : TauCeti.freeProP p (Fin n)}
    (hr : TauCeti.IsDemushkin p (TauCeti.presentedProP p (Fin n) {r}))
    (x : TauCeti.freeProP p (Fin n)) :
    TauCeti.demushkinRelatorCharacter hr x =
      TauCeti.demushkinCharacter hr (TauCeti.presentedProP.mk p {r} x) :=
  TauCeti.demushkinRelatorCharacter_apply hr x

/-- **The relator lies in `X`**, the kernel of its associated character, so its class `r̄ ∈ E`
is defined: Tau Ceti's `TauCeti.demushkinRelatorCharacter_mem_ker`. -/
theorem demushkinRelatorCharacter_mem_ker {p : ℕ} [Fact p.Prime] {n : ℕ}
    {r : TauCeti.freeProP p (Fin n)}
    (hr : TauCeti.IsDemushkin p (TauCeti.presentedProP p (Fin n) {r})) :
    r ∈ (TauCeti.demushkinRelatorCharacter hr).toMonoidHom.ker :=
  TauCeti.demushkinRelatorCharacter_mem_ker hr

/-! ### The module statements that the classification uses -/

/-- **Layer 9, the relator class in a spanning family.** If `b` spans `E` over `Λ`, then `r̄` is
a `Λ`-combination of the `b i`, by Mathlib's `Submodule.mem_span_range_iff_exists_fun`. -/
theorem labuteRelatorClass_eq_sum {p : ℕ} [Fact p.Prime] {F : Type u} [Group F]
    [TopologicalSpace F] [IsTopologicalGroup F] [CompactSpace F] [TotallyDisconnectedSpace F]
    (hF : TauCeti.IsProP p F) (χ : F →ₜ* ℤ_[p]ˣ) (r : F) (hr : r ∈ (χ : F →* ℤ_[p]ˣ).ker)
    {m : ℕ} (b : Fin m → TauCeti.labuteE χ) :
    haveI := χ.isClosed_ker
    letI := (hF.topologicalAbelianization (χ : F →* ℤ_[p]ˣ).ker).completedGroupAlgebraModule
      (F ⧸ (χ : F →* ℤ_[p]ˣ).ker)
    Submodule.span (TauCeti.completedGroupAlgebra ℤ_[p] (F ⧸ (χ : F →* ℤ_[p]ˣ).ker))
        (Set.range b) = ⊤ →
      ∃ c : Fin m → TauCeti.completedGroupAlgebra ℤ_[p] (F ⧸ (χ : F →* ℤ_[p]ˣ).ker),
        TauCeti.labuteRelatorClass χ r hr = ∑ i, c i • b i :=
  haveI := χ.isClosed_ker
  letI := (hF.topologicalAbelianization (χ : F →* ℤ_[p]ˣ).ker).completedGroupAlgebraModule
    (F ⧸ (χ : F →* ℤ_[p]ˣ).ker)
  fun hb ↦ ((Submodule.mem_span_range_iff_exists_fun _).mp
    (hb ▸ Submodule.mem_top :
      TauCeti.labuteRelatorClass χ r hr ∈ Submodule.span _ (Set.range b))).imp fun _ hc ↦ hc.symm

/-- **Layer 9, the module statement for Labute's Theorem 5**, the branch `Im χ = U^[f]` with
`2 ≤ f < ∞`: there is `z ∈ E` with `r̄ = ((1 + 2^f) + ȳ) z` for every `y ∈ F` with
`χ(y) = -(1 + 2^f)`. Closed by Tau Ceti's
`TauCeti.exists_labuteRelatorClass_eq_smul_of_range_eq_procyclicClosure`, which does not need the
hypothesis `q = 2` (here `_hq`) and takes `χ = demushkinRelatorCharacter hr` directly. -/
theorem exists_labuteRelatorClass_eq_smul_of_range_eq_procyclicClosure {n : ℕ}
    {r : TauCeti.freeProP 2 (Fin n)}
    (hr : TauCeti.IsDemushkin 2 (TauCeti.presentedProP 2 (Fin n) {r}))
    (_hq : TauCeti.demushkinQ hr = 2) (hn : Even n)
    (hrΦ : r ∈ TauCeti.proPFrattini 2 (TauCeti.freeProP 2 (Fin n)))
    (χ : TauCeti.freeProP 2 (Fin n) →ₜ* ℤ_[2]ˣ) (hχ : χ = TauCeti.demushkinRelatorCharacter hr)
    (hrχ : r ∈ χ.toMonoidHom.ker) {f : ℕ} (hf : 2 ≤ f) {u : ℤ_[2]ˣ}
    (hu : (u : ℤ_[2]) = -1 + 2 ^ f)
    (hrange : χ.toMonoidHom.range = (Subgroup.zpowers u).topologicalClosure)
    (y : TauCeti.freeProP 2 (Fin n)) (hy : ((χ y : ℤ_[2]ˣ) : ℤ_[2]) = -(1 + 2 ^ f)) :
    haveI := χ.isClosed_ker
    letI := ((TauCeti.isProP_freeProP 2 (Fin n)).topologicalAbelianization
      χ.toMonoidHom.ker).completedGroupAlgebraModule
        (TauCeti.freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)
    ∃ z : TauCeti.labuteE χ,
      TauCeti.labuteRelatorClass χ r hrχ =
        (algebraMap ℤ_[2]
            (TauCeti.completedGroupAlgebra ℤ_[2] (TauCeti.freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker))
            (1 + 2 ^ f) +
          TauCeti.completedGroupAlgebra.of ℤ_[2] _
            (y : TauCeti.freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)) • z := by
  subst hχ
  exact TauCeti.exists_labuteRelatorClass_eq_smul_of_range_eq_procyclicClosure hr hn hrΦ hf hu
    hrange hy

/-- **Layer 9, the module statement for Labute's Theorem 6**, the branch `Im χ = {±1} × U^(f)`
with `2 ≤ f < ∞`: there are `z₁, z₃ ∈ E` with `r̄ = (1 + s̄) z₁ + ((2^f - 1) + ȳ) z₃` for every
`s, y ∈ F` with `χ(s) = -1` and `χ(y) = 1 - 2^f`. Closed by Tau Ceti's
`TauCeti.exists_labuteRelatorClass_eq_add_smul_of_range_eq_unitsPlusMinus`, which does not need
`q = 2` (here `_hq`) and writes the scalar `2^f - 1` in `Λ` rather than through `algebraMap`. -/
theorem exists_labuteRelatorClass_eq_add_smul_of_range_eq_unitsPlusMinus {n : ℕ}
    {r : TauCeti.freeProP 2 (Fin n)}
    (hr : TauCeti.IsDemushkin 2 (TauCeti.presentedProP 2 (Fin n) {r}))
    (_hq : TauCeti.demushkinQ hr = 2) (hn : Even n)
    (hrΦ : r ∈ TauCeti.proPFrattini 2 (TauCeti.freeProP 2 (Fin n)))
    (χ : TauCeti.freeProP 2 (Fin n) →ₜ* ℤ_[2]ˣ) (hχ : χ = TauCeti.demushkinRelatorCharacter hr)
    (hrχ : r ∈ χ.toMonoidHom.ker) {f : ℕ} (hf : 2 ≤ f)
    (hrange : χ.toMonoidHom.range = TauCeti.unitsPlusMinus f) (s y : TauCeti.freeProP 2 (Fin n))
    (hs : χ s = -1) (hy : ((χ y : ℤ_[2]ˣ) : ℤ_[2]) = 1 - 2 ^ f) :
    haveI := χ.isClosed_ker
    letI := ((TauCeti.isProP_freeProP 2 (Fin n)).topologicalAbelianization
      χ.toMonoidHom.ker).completedGroupAlgebraModule
        (TauCeti.freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)
    ∃ z₁ z₃ : TauCeti.labuteE χ,
      TauCeti.labuteRelatorClass χ r hrχ =
        (1 + TauCeti.completedGroupAlgebra.of ℤ_[2] _
            (s : TauCeti.freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)) • z₁ +
          (algebraMap ℤ_[2]
              (TauCeti.completedGroupAlgebra ℤ_[2] (TauCeti.freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker))
              (2 ^ f - 1) +
            TauCeti.completedGroupAlgebra.of ℤ_[2] _
              (y : TauCeti.freeProP 2 (Fin n) ⧸ χ.toMonoidHom.ker)) • z₃ := by
  subst hχ
  rw [map_sub, map_pow, map_ofNat, map_one]
  exact TauCeti.exists_labuteRelatorClass_eq_add_smul_of_range_eq_unitsPlusMinus hr hn hrΦ hf
    hrange hs hy

end Layer8AndPrerequisites

section Layers9And10



/-! ## Layer 9: the normal-form words

Tau Ceti defines the same words, on the same `ℕ`-indexed tuples, in
`TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Basic.lean`; the roadmap names are
reducible abbreviations of them, and each agreement lemma states the old roadmap formula and is
closed by `rfl`. -/

section MarkedNormalForms

/-- Labute's commutator `(x, y) = x⁻¹y⁻¹xy`: Tau Ceti's `TauCeti.labuteComm`. -/
abbrev labuteComm {H : Type*} [Group H] (x y : H) : H := TauCeti.labuteComm x y

/-- The old roadmap formula for `labuteComm`. -/
theorem labuteComm_eq {H : Type*} [Group H] (x y : H) : labuteComm x y = x⁻¹ * y⁻¹ * x * y :=
  rfl

/-- The generators of `freeProP p (Fin n)` indexed by `ℕ`, with value `1` out of range:
Tau Ceti's `TauCeti.freeProPGen`. -/
noncomputable abbrev freeProPGen (p n : ℕ) (i : ℕ) : TauCeti.freeProP p (Fin n) :=
  TauCeti.freeProPGen p n i

/-- The old roadmap formula for `freeProPGen`. -/
theorem freeProPGen_eq (p n i : ℕ) :
    freeProPGen p n i = if h : i < n then TauCeti.freeProP.of ⟨i, h⟩ else 1 :=
  rfl

/-- The generators of a presented pro-`p` group, as the images of `freeProPGen`:
Tau Ceti's `TauCeti.presentedProPGen`. -/
noncomputable abbrev presentedProPGen (p n : ℕ) (rels : Set (TauCeti.freeProP p (Fin n)))
    (i : ℕ) : TauCeti.presentedProP p (Fin n) rels :=
  TauCeti.presentedProPGen p n rels i

/-- The old roadmap formula for `presentedProPGen`. -/
theorem presentedProPGen_eq (p n : ℕ) (rels : Set (TauCeti.freeProP p (Fin n))) (i : ℕ) :
    presentedProPGen p n rels i = QuotientGroup.mk (freeProPGen p n i) :=
  rfl

/-- Out-of-range generators are `1` in `F`: Tau Ceti's `TauCeti.freeProPGen_eq_one_of_le`. -/
theorem freeProPGen_of_le (p n i : ℕ) (h : n ≤ i) : freeProPGen p n i = 1 :=
  TauCeti.freeProPGen_eq_one_of_le p h

/-- Out-of-range generators are `1` in every presented quotient: Tau Ceti's
`TauCeti.presentedProPGen_eq_one_of_le`. -/
theorem presentedProPGen_of_le (p n : ℕ) (rels : Set (TauCeti.freeProP p (Fin n))) (i : ℕ)
    (h : n ≤ i) : presentedProPGen p n rels i = 1 :=
  TauCeti.presentedProPGen_eq_one_of_le p n rels h

/-- The `q ≠ 2` normal-form word `x₁^q(x₁,x₂)(x₃,x₄)⋯(x_{n-1},x_n)`:
Tau Ceti's `TauCeti.demushkinWordNeTwo`. -/
abbrev demushkinWordNeTwo {H : Type*} [Group H] (q n : ℕ) (x : ℕ → H) : H :=
  TauCeti.demushkinWordNeTwo q n x

/-- The old roadmap formula for `demushkinWordNeTwo`. -/
theorem demushkinWordNeTwo_eq {H : Type*} [Group H] (q n : ℕ) (x : ℕ → H) :
    demushkinWordNeTwo q n x =
      x 0 ^ q * ((List.range (n / 2)).map fun i => labuteComm (x (2 * i)) (x (2 * i + 1))).prod :=
  rfl

/-- The `q = 2`, `n` odd normal-form word `x₁²x₂^{2^f}(x₂,x₃)(x₄,x₅)⋯`:
Tau Ceti's `TauCeti.demushkinWordTwoOdd`. -/
abbrev demushkinWordTwoOdd {H : Type*} [Group H] (f n : ℕ) (x : ℕ → H) : H :=
  TauCeti.demushkinWordTwoOdd f n x

/-- The old roadmap formula for `demushkinWordTwoOdd`. -/
theorem demushkinWordTwoOdd_eq {H : Type*} [Group H] (f n : ℕ) (x : ℕ → H) :
    demushkinWordTwoOdd f n x =
      x 0 ^ 2 * x 1 ^ (2 ^ f) *
        ((List.range (n / 2)).map fun i => labuteComm (x (2 * i + 1)) (x (2 * i + 2))).prod :=
  rfl

/-- The `q = 2`, `n` even normal-form word `x₁^{2+α}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯`, with a natural
exponent `2 + a`: Tau Ceti's `TauCeti.demushkinWordTwoEven`. -/
abbrev demushkinWordTwoEven {H : Type*} [Group H] (a f n : ℕ) (x : ℕ → H) : H :=
  TauCeti.demushkinWordTwoEven a f n x

/-- The old roadmap formula for `demushkinWordTwoEven`. -/
theorem demushkinWordTwoEven_eq {H : Type*} [Group H] (a f n : ℕ) (x : ℕ → H) :
    demushkinWordTwoEven a f n x =
      x 0 ^ (2 + a) * labuteComm (x 0) (x 1) * x 2 ^ (2 ^ f) *
        ((List.range (n / 2 - 1)).map fun i =>
          labuteComm (x (2 * i + 2)) (x (2 * i + 3))).prod :=
  rfl

/-- The `q = 2`, `n = 2` normal-form word `x₁^{2+α}(x₁,x₂)`:
Tau Ceti's `TauCeti.demushkinWordTwoRankTwo`. -/
abbrev demushkinWordTwoRankTwo {H : Type*} [Group H] (a : ℕ) (x : ℕ → H) : H :=
  TauCeti.demushkinWordTwoRankTwo a x

/-- The old roadmap formula for `demushkinWordTwoRankTwo`. -/
theorem demushkinWordTwoRankTwo_eq {H : Type*} [Group H] (a : ℕ) (x : ℕ → H) :
    demushkinWordTwoRankTwo a x = x 0 ^ (2 + a) * labuteComm (x 0) (x 1) :=
  rfl

/-- At rank `2` the even word is the rank-two word: Tau Ceti's `TauCeti.demushkinWordTwoEven_two`.
-/
theorem demushkinWordTwoEven_two {H : Type*} [Group H] (a f : ℕ) (x : ℕ → H) (hx : x 2 = 1) :
    demushkinWordTwoEven a f 2 x = demushkinWordTwoRankTwo a x :=
  TauCeti.demushkinWordTwoEven_two a f x hx

/-! ## Layer 9: the marked classification -/

variable (p : ℕ) [Fact p.Prime] (G : Type) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 9, the marked classification at `q ≠ 2`.** A Demushkin group with `q ≠ 2` and rank
`n` is isomorphic to the presented group on the normal-form relator, with `χ(x₂)(1 - q) = 1` and
`χ(x_i) = 1` on every other generator: Tau Ceti's `TauCeti.isDemushkin_marked_of_q_ne_two`, which
needs neither `hn` nor the instance argument. -/
theorem isDemushkin_marked_of_q_ne_two (hG : TauCeti.IsDemushkin p G)
    (hq : TauCeti.demushkinQ hG ≠ 2) (_hn : 2 ≤ TauCeti.demushkinRank hG)
    [TotallyDisconnectedSpace (TauCeti.presentedProP p (Fin (TauCeti.demushkinRank hG))
      {demushkinWordNeTwo (TauCeti.demushkinQ hG) (TauCeti.demushkinRank hG)
        (freeProPGen p (TauCeti.demushkinRank hG))})] :
    ∃ e : G ≃ₜ* TauCeti.presentedProP p (Fin (TauCeti.demushkinRank hG))
        {demushkinWordNeTwo (TauCeti.demushkinQ hG) (TauCeti.demushkinRank hG)
          (freeProPGen p (TauCeti.demushkinRank hG))},
      ((TauCeti.demushkinCharacter hG
          (e.symm (presentedProPGen p (TauCeti.demushkinRank hG) _ 1)) : ℤ_[p])
          * (1 - (TauCeti.demushkinQ hG : ℤ_[p])) = 1) ∧
        ∀ i : ℕ, i ≠ 1 → i < TauCeti.demushkinRank hG →
          TauCeti.demushkinCharacter hG
            (e.symm (presentedProPGen p (TauCeti.demushkinRank hG) _ i)) = 1 :=
  TauCeti.isDemushkin_marked_of_q_ne_two hG hq

/-- **Layer 9, the marked classification at `q = 2` with `n` odd.** Here `p = 2`, the relator is
`x₁²x₂^{2^f}(x₂,x₃)⋯`, the image `{±1} × U^(f)` pins `f`, and the character values are
`χ(x₁) = -1`, `χ(x₃)(1 - 2^f) = 1`, and `1` elsewhere: Tau Ceti's
`TauCeti.isDemushkin_marked_of_q_two_odd`, which does not need `hq`. -/
theorem isDemushkin_marked_of_q_two_odd (hG : TauCeti.IsDemushkin 2 G)
    (_hq : TauCeti.demushkinQ hG = 2) (hodd : Odd (TauCeti.demushkinRank hG))
    (hn : 3 ≤ TauCeti.demushkinRank hG) (f : ℕ) (hf : 2 ≤ f)
    (hrange : (TauCeti.demushkinCharacter hG).toMonoidHom.range = TauCeti.unitsPlusMinus f)
    [TotallyDisconnectedSpace (TauCeti.presentedProP 2 (Fin (TauCeti.demushkinRank hG))
      {demushkinWordTwoOdd f (TauCeti.demushkinRank hG)
        (freeProPGen 2 (TauCeti.demushkinRank hG))})] :
    ∃ e : G ≃ₜ* TauCeti.presentedProP 2 (Fin (TauCeti.demushkinRank hG))
        {demushkinWordTwoOdd f (TauCeti.demushkinRank hG)
          (freeProPGen 2 (TauCeti.demushkinRank hG))},
      TauCeti.demushkinCharacter hG
          (e.symm (presentedProPGen 2 (TauCeti.demushkinRank hG) _ 0)) = -1 ∧
        ((TauCeti.demushkinCharacter hG
            (e.symm (presentedProPGen 2 (TauCeti.demushkinRank hG) _ 2)) : ℤ_[2])
          * (1 - 2 ^ f) = 1) ∧
        ∀ i : ℕ, i ≠ 0 → i ≠ 2 → i < TauCeti.demushkinRank hG →
          TauCeti.demushkinCharacter hG
            (e.symm (presentedProPGen 2 (TauCeti.demushkinRank hG) _ i)) = 1 :=
  TauCeti.isDemushkin_marked_of_q_two_odd hG hodd hn hf hrange

/-- **Layer 9, the marked classification at `q = 2` with `n` even and `n ≥ 4`.** The relator is
`x₁^{2+α}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯`, the character values are `χ(x₂)(1 + α) = -1`,
`χ(x₄)(1 - 2^f) = 1` and `1` elsewhere, and the image table read as the hypothesis `hrange` pins
the parameters: Tau Ceti's `TauCeti.isDemushkin_marked_of_q_two_even`, which does not need `hq`.
The twisted image `U^[v₂(α)]` is written `(Subgroup.zpowers u).topologicalClosure`, Tau Ceti's
spelling of the old `procyclicClosure u`. -/
theorem isDemushkin_marked_of_q_two_even (hG : TauCeti.IsDemushkin 2 G)
    (_hq : TauCeti.demushkinQ hG = 2) (heven : Even (TauCeti.demushkinRank hG))
    (hn : 4 ≤ TauCeti.demushkinRank hG) (a f : ℕ) (hf : 2 ≤ f) (ha : 4 ∣ a)
    (hrange : (2 ^ f ∣ a ∧
        (TauCeti.demushkinCharacter hG).toMonoidHom.range = TauCeti.unitsPlusMinus f) ∨
      (padicValNat 2 a < f ∧ ∃ u : ℤ_[2]ˣ, (u : ℤ_[2]) = -1 + 2 ^ padicValNat 2 a ∧
        (TauCeti.demushkinCharacter hG).toMonoidHom.range =
          (Subgroup.zpowers u).topologicalClosure))
    [TotallyDisconnectedSpace (TauCeti.presentedProP 2 (Fin (TauCeti.demushkinRank hG))
      {demushkinWordTwoEven a f (TauCeti.demushkinRank hG)
        (freeProPGen 2 (TauCeti.demushkinRank hG))})] :
    ∃ e : G ≃ₜ* TauCeti.presentedProP 2 (Fin (TauCeti.demushkinRank hG))
        {demushkinWordTwoEven a f (TauCeti.demushkinRank hG)
          (freeProPGen 2 (TauCeti.demushkinRank hG))},
      ((TauCeti.demushkinCharacter hG
          (e.symm (presentedProPGen 2 (TauCeti.demushkinRank hG) _ 1)) : ℤ_[2])
          * (1 + (a : ℤ_[2])) = -1) ∧
        ((TauCeti.demushkinCharacter hG
            (e.symm (presentedProPGen 2 (TauCeti.demushkinRank hG) _ 3)) : ℤ_[2])
          * (1 - 2 ^ f) = 1) ∧
        ∀ i : ℕ, i ≠ 1 → i ≠ 3 → i < TauCeti.demushkinRank hG →
          TauCeti.demushkinCharacter hG
            (e.symm (presentedProPGen 2 (TauCeti.demushkinRank hG) _ i)) = 1 :=
  TauCeti.isDemushkin_marked_of_q_two_even hG heven hn hf ha hrange

/-- **Layer 9, the marked classification at `q = 2` with `n = 2`.** The relator is
`x₁^{2+α}(x₁,x₂)`, with no level `f`, the character values are `χ(x₁) = 1` and
`χ(x₂)(1 + α) = -1`, and the image `U^[v₂(α)]` pins `v₂(α)`: Tau Ceti's
`TauCeti.isDemushkin_marked_of_q_two_rank_two`, stated there on `Fin 2` with the exact depth
`g = v₂(α)` as parameter; the bridge rewrites the rank and computes `g ≥ 2` from `4 ∣ a`. -/
theorem isDemushkin_marked_of_q_two_rank_two (hG : TauCeti.IsDemushkin 2 G)
    (_hq : TauCeti.demushkinQ hG = 2) (hrank : TauCeti.demushkinRank hG = 2) (a : ℕ)
    (ha : 4 ∣ a)
    (hrange : ∃ u : ℤ_[2]ˣ, (u : ℤ_[2]) = -1 + 2 ^ padicValNat 2 a ∧
      (TauCeti.demushkinCharacter hG).toMonoidHom.range =
        (Subgroup.zpowers u).topologicalClosure)
    [TotallyDisconnectedSpace (TauCeti.presentedProP 2 (Fin (TauCeti.demushkinRank hG))
      {demushkinWordTwoRankTwo a (freeProPGen 2 (TauCeti.demushkinRank hG))})] :
    ∃ e : G ≃ₜ* TauCeti.presentedProP 2 (Fin (TauCeti.demushkinRank hG))
        {demushkinWordTwoRankTwo a (freeProPGen 2 (TauCeti.demushkinRank hG))},
      TauCeti.demushkinCharacter hG
          (e.symm (presentedProPGen 2 (TauCeti.demushkinRank hG) _ 0)) = 1 ∧
        ((TauCeti.demushkinCharacter hG
            (e.symm (presentedProPGen 2 (TauCeti.demushkinRank hG) _ 1)) : ℤ_[2])
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

/-- **Layer 9, rejection test: the four-generator marking is unsatisfiable at rank two.** At rank
`2` the fourth generator is `1`, so the clause `χ(x₄)(1 - 2^f) = 1` reads `1 - 2^f = 1`, false in
`ℤ₂`: Tau Ceti's `TauCeti.not_marked_of_demushkinRank_le`. -/
theorem not_marked_fourth_generator_of_rank_two (hG : TauCeti.IsDemushkin 2 G)
    (hrank : TauCeti.demushkinRank hG = 2) (f : ℕ)
    (rels : Set (TauCeti.freeProP 2 (Fin (TauCeti.demushkinRank hG))))
    (e : G ≃ₜ* TauCeti.presentedProP 2 (Fin (TauCeti.demushkinRank hG)) rels) :
    ¬ ((TauCeti.demushkinCharacter hG
        (e.symm (presentedProPGen 2 (TauCeti.demushkinRank hG) rels 3)) : ℤ_[2])
        * (1 - 2 ^ f) = 1) :=
  TauCeti.not_marked_of_demushkinRank_le hG (by omega) f rels e

/-- **Layer 9, the reviewer's witness**: `⟨x₁, x₂ | x₁⁶(x₁,x₂)⟩` is `demushkinWordTwoEven 4 3` at
rank `2`, and no isomorphism onto it satisfies the fourth-generator clause with `f = 3`. -/
example (hG : TauCeti.IsDemushkin 2 G) (hrank : TauCeti.demushkinRank hG = 2)
    (e : G ≃ₜ* TauCeti.presentedProP 2 (Fin (TauCeti.demushkinRank hG))
      {demushkinWordTwoEven 4 3 (TauCeti.demushkinRank hG)
        (freeProPGen 2 (TauCeti.demushkinRank hG))}) :
    ¬ ((TauCeti.demushkinCharacter hG
        (e.symm (presentedProPGen 2 (TauCeti.demushkinRank hG) _ 3)) : ℤ_[2])
        * (1 - 2 ^ 3) = 1) :=
  not_marked_fourth_generator_of_rank_two G hG hrank 3 _ e

/-- **Layer 9, Labute Thm 2: relators with the same invariants are equivalent under an
automorphism of `F`**, stated as the equality of the two closed normal closures: Tau Ceti's
`TauCeti.freeProP.exists_continuousMulEquiv_apply_eq_of_range_demushkinCharacter_eq`, which gives
the stronger `φ r = r'` and does not need `hrank` (both ranks are `n`). -/
theorem exists_continuousMulEquiv_map_demushkinRelator (n : ℕ) (r r' : TauCeti.freeProP p (Fin n))
    [TotallyDisconnectedSpace (TauCeti.freeProP p (Fin n))]
    [TotallyDisconnectedSpace (TauCeti.presentedProP p (Fin n) {r})]
    [TotallyDisconnectedSpace (TauCeti.presentedProP p (Fin n) {r'})]
    (hr : TauCeti.IsDemushkin p (TauCeti.presentedProP p (Fin n) {r}))
    (hr' : TauCeti.IsDemushkin p (TauCeti.presentedProP p (Fin n) {r'}))
    (_hrank : TauCeti.demushkinRank hr = TauCeti.demushkinRank hr')
    (himage : (TauCeti.demushkinCharacter hr).toMonoidHom.range =
      (TauCeti.demushkinCharacter hr').toMonoidHom.range) :
    ∃ φ : TauCeti.freeProP p (Fin n) ≃ₜ* TauCeti.freeProP p (Fin n),
      (Subgroup.normalClosure {φ r}).topologicalClosure
        = (Subgroup.normalClosure {r'}).topologicalClosure := by
  obtain ⟨φ, hφ⟩ :=
    TauCeti.freeProP.exists_continuousMulEquiv_apply_eq_of_range_demushkinCharacter_eq hr hr'
      himage
  exact ⟨φ, by rw [hφ]⟩

end MarkedNormalForms

/-! ## Layer 9: cup-form normal forms and the successive approximation -/

section CupForm

/-- **Layer 9, the relator computes the cup product (Labute Prop. 3).** For `G ≅ F ⧸ R` with
`R ≤ Φ(F)` closed and `r ∈ R`, the relator functional of `r` on `H²(G, 𝔽_p)` sends `a ∪ b` to minus
the degree-one form of the class `r̄ ∈ gr_1(F)` at the attached characters of `F`:
Tau Ceti's `TauCeti.freeProP.relatorFunctional_cupFp`. -/
example {p : ℕ} [Fact p.Prime] {X : Type} [Finite X] {R : Subgroup (TauCeti.freeProP p X)}
    [R.Normal] {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [LocallyCompactSpace G] (hRc : IsClosed (R : Set (TauCeti.freeProP p X)))
    (hR : R ≤ TauCeti.proPFrattini p (TauCeti.freeProP p X))
    (e : TauCeti.freeProP p X ⧸ R ≃ₜ* G) (r : R) (a b : TauCeti.cohomFp p G 1) :
    TauCeti.freeProP.relatorFunctional hRc hR e r (TauCeti.cupFp p G a b) =
      -TauCeti.freeProP.degreeOneForm (TauCeti.gradedMk p (TauCeti.freeProP p X) 1
          ⟨r, (TauCeti.pLowerCentralSeries_one_eq_proPFrattini Fact.out).symm.le (hR r.2)⟩)
        (((e : TauCeti.freeProP p X ⧸ R →ₜ* G).comp
          (TauCeti.ContinuousMonoidHom.quotientMk R)).continuousZModDualMap
            (TauCeti.cohomFpLinearEquivContinuousZModDual p G a))
        (((e : TauCeti.freeProP p X ⧸ R →ₜ* G).comp
          (TauCeti.ContinuousMonoidHom.quotientMk R)).continuousZModDualMap
            (TauCeti.cohomFpLinearEquivContinuousZModDual p G b)) :=
  TauCeti.freeProP.relatorFunctional_cupFp hRc hR e r a b

/-- **Layer 9, the matrix of the degree-one form.** In the dual basis of the generators, the
form of `ρ ∈ gr_1(F)` has the commutator coordinate `a_{ij}` off the diagonal and
`(p choose 2)` times the `p`-power coordinate `a_i` on it: Tau Ceti's
`TauCeti.freeProP.degreeOneForm_dualBasis_of_lt` and
`TauCeti.freeProP.degreeOneForm_dualBasis_self`. -/
example {p : ℕ} [Fact p.Prime] {X : Type} [Finite X] [LinearOrder X]
    (ρ : TauCeti.gradedPiece p (TauCeti.freeProP p X) 1) (i j : X) (hij : i < j) :
    TauCeti.freeProP.degreeOneForm ρ (TauCeti.freeProP.dualBasis p X i)
        (TauCeti.freeProP.dualBasis p X j) =
      (TauCeti.freeProP.degreeOneBasis p X).repr ρ (Sum.inr ⟨(i, j), hij⟩) ∧
    TauCeti.freeProP.degreeOneForm ρ (TauCeti.freeProP.dualBasis p X i)
        (TauCeti.freeProP.dualBasis p X i) =
      p.choose 2 • (TauCeti.freeProP.degreeOneBasis p X).repr ρ (Sum.inl i) :=
  ⟨TauCeti.freeProP.degreeOneForm_dualBasis_of_lt ρ hij,
    TauCeti.freeProP.degreeOneForm_dualBasis_self ρ i⟩

/-- **Layer 9, cup-form normal form modulo `λ_2(F)`, alternating case.** For a Demushkin
`G ≅ ⟨x₁, …, x_n ∣ r⟩` with `r ∈ Φ(F)` and alternating cup form, `n` is even and after a change of
basis `r ≡ x₁^q(x₁,x₂)⋯(x_{n-1},x_n)` modulo `λ_2(F)` with `q ∈ {0, p}`: Tau Ceti's
`TauCeti.IsDemushkin.exists_continuousMulEquiv_gradedMap_eq_gradedMk_demushkinWordNeTwo`. -/
example {p : ℕ} [Fact p.Prime] {n : ℕ} {r : TauCeti.freeProP p (Fin n)} {G : Type}
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G]
    (hr : r ∈ TauCeti.proPFrattini p (TauCeti.freeProP p (Fin n)))
    (e : TauCeti.presentedProP p (Fin n) {r} ≃ₜ* G) (hG : TauCeti.IsDemushkin p G)
    (halt : ∀ a : TauCeti.cohomFp p G 1, TauCeti.cupFp p G a a = 0) :
    Even n ∧ ∃ e' : TauCeti.freeProP p (Fin n) ≃ₜ* TauCeti.freeProP p (Fin n),
      TauCeti.gradedMap p
          (e' : TauCeti.freeProP p (Fin n) →ₜ* TauCeti.freeProP p (Fin n)).toMonoidHom
          (e' : TauCeti.freeProP p (Fin n) →ₜ* TauCeti.freeProP p (Fin n)).continuous 1
          (TauCeti.gradedMk p (TauCeti.freeProP p (Fin n)) 1
            ⟨r, (TauCeti.pLowerCentralSeries_one_eq_proPFrattini Fact.out).symm.le hr⟩) =
        TauCeti.gradedMk p (TauCeti.freeProP p (Fin n)) 1
          ⟨demushkinWordNeTwo 0 n (freeProPGen p n),
            TauCeti.demushkinWordNeTwo_mem_pLowerCentralSeries_one (dvd_zero p) n _⟩ ∨
      TauCeti.gradedMap p
          (e' : TauCeti.freeProP p (Fin n) →ₜ* TauCeti.freeProP p (Fin n)).toMonoidHom
          (e' : TauCeti.freeProP p (Fin n) →ₜ* TauCeti.freeProP p (Fin n)).continuous 1
          (TauCeti.gradedMk p (TauCeti.freeProP p (Fin n)) 1
            ⟨r, (TauCeti.pLowerCentralSeries_one_eq_proPFrattini Fact.out).symm.le hr⟩) =
        TauCeti.gradedMk p (TauCeti.freeProP p (Fin n)) 1
          ⟨demushkinWordNeTwo p n (freeProPGen p n),
            TauCeti.demushkinWordNeTwo_mem_pLowerCentralSeries_one dvd_rfl n _⟩ :=
  hG.exists_continuousMulEquiv_gradedMap_eq_gradedMk_demushkinWordNeTwo hr e halt

/-- **Layer 9, cup-form normal form modulo `λ_2(F)`, nonalternating case, `n` odd.** At `p = 2`
with some `a ∪ a ≠ 0` and `n` odd, after a change of basis `r ≡ x₁²(x₂,x₃)⋯(x_{n-1},x_n)` modulo
`λ_2(F)`: Tau Ceti's
`TauCeti.IsDemushkin.exists_continuousMulEquiv_gradedMap_eq_gradedMk_demushkinWordTwoOddTop`. -/
example {n : ℕ} {r : TauCeti.freeProP 2 (Fin n)} {G : Type}
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G]
    (hr : r ∈ TauCeti.proPFrattini 2 (TauCeti.freeProP 2 (Fin n)))
    (e : TauCeti.presentedProP 2 (Fin n) {r} ≃ₜ* G) (hG : TauCeti.IsDemushkin 2 G)
    (hnalt : ∃ a : TauCeti.cohomFp 2 G 1, TauCeti.cupFp 2 G a a ≠ 0) (hn : Odd n) :
    ∃ e' : TauCeti.freeProP 2 (Fin n) ≃ₜ* TauCeti.freeProP 2 (Fin n),
      TauCeti.gradedMap 2
          (e' : TauCeti.freeProP 2 (Fin n) →ₜ* TauCeti.freeProP 2 (Fin n)).toMonoidHom
          (e' : TauCeti.freeProP 2 (Fin n) →ₜ* TauCeti.freeProP 2 (Fin n)).continuous 1
          (TauCeti.gradedMk 2 (TauCeti.freeProP 2 (Fin n)) 1
            ⟨r, (TauCeti.pLowerCentralSeries_one_eq_proPFrattini Nat.prime_two).symm.le hr⟩) =
        TauCeti.gradedMk 2 (TauCeti.freeProP 2 (Fin n)) 1
          ⟨TauCeti.demushkinWordTwoOddTop n (freeProPGen 2 n),
            TauCeti.demushkinWordTwoOddTop_mem_pLowerCentralSeries_one n _⟩ :=
  hG.exists_continuousMulEquiv_gradedMap_eq_gradedMk_demushkinWordTwoOddTop hr e hnalt hn

/-- **Layer 9, cup-form normal form modulo `λ_2(F)`, nonalternating case, `n` even.** At `p = 2`
with some `a ∪ a ≠ 0` and `n` even, after a change of basis `r ≡ x₁^{2+a}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯`
modulo `λ_2(F)`, for every `4 ∣ a` and `f ≥ 2` (all these words have the class of
`x₁²(x₁,x₂)(x₃,x₄)⋯`): Tau Ceti's
`TauCeti.IsDemushkin.exists_continuousMulEquiv_gradedMap_eq_gradedMk_demushkinWordTwoEven`. -/
example {n : ℕ} {r : TauCeti.freeProP 2 (Fin n)} {G : Type}
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G]
    (hr : r ∈ TauCeti.proPFrattini 2 (TauCeti.freeProP 2 (Fin n)))
    (e : TauCeti.presentedProP 2 (Fin n) {r} ≃ₜ* G) (hG : TauCeti.IsDemushkin 2 G)
    (hnalt : ∃ a : TauCeti.cohomFp 2 G 1, TauCeti.cupFp 2 G a a ≠ 0) (hn : Even n)
    {a f : ℕ} (ha : 4 ∣ a) (hf : 2 ≤ f) :
    ∃ e' : TauCeti.freeProP 2 (Fin n) ≃ₜ* TauCeti.freeProP 2 (Fin n),
      TauCeti.gradedMap 2
          (e' : TauCeti.freeProP 2 (Fin n) →ₜ* TauCeti.freeProP 2 (Fin n)).toMonoidHom
          (e' : TauCeti.freeProP 2 (Fin n) →ₜ* TauCeti.freeProP 2 (Fin n)).continuous 1
          (TauCeti.gradedMk 2 (TauCeti.freeProP 2 (Fin n)) 1
            ⟨r, (TauCeti.pLowerCentralSeries_one_eq_proPFrattini Nat.prime_two).symm.le hr⟩) =
        TauCeti.gradedMk 2 (TauCeti.freeProP 2 (Fin n)) 1
          ⟨demushkinWordTwoEven a f n (freeProPGen 2 n),
            TauCeti.demushkinWordTwoEven_mem_pLowerCentralSeries_one
              (dvd_trans (Dvd.intro 2 rfl) ha) (zero_lt_two.trans_le hf) n _⟩ :=
  hG.exists_continuousMulEquiv_gradedMap_eq_gradedMk_demushkinWordTwoEven hr e hnalt hn ha hf

/-- **Layer 9, the span statement at an odd prime.** For `p` odd and a class `ρ ∈ gr_1(F)` whose
derivatives span `gr_0(F)` (the nondegeneracy of the form) and which has a nonzero `p`-power part,
`δ_ρ` is onto `gr_{m+1}(F)` for every `m ≥ 1`: Tau Ceti's
`TauCeti.freeProP.range_basisModificationDelta_eq_top_of_odd`. -/
example {p : ℕ} [Fact p.Prime] {X : Type} [Finite X] [LinearOrder X] {m : ℕ} (hp : Odd p)
    (hm : 1 ≤ m) {ρ : TauCeti.gradedPiece p (TauCeti.freeProP p X) 1}
    (hspan : Submodule.span (ZMod p)
      (Set.range fun i => TauCeti.freeProP.degreeOneDeriv p X i ρ) = ⊤)
    (hc : ∃ i, (TauCeti.freeProP.degreeOneBasis p X).repr ρ (Sum.inl i) ≠ 0) :
    LinearMap.range (TauCeti.freeProP.basisModificationDelta p X hm ρ) = ⊤ :=
  TauCeti.freeProP.range_basisModificationDelta_eq_top_of_odd hp hm hspan hc

/-- **Layer 9, the span statement at `x₁^q(x₁,x₂)⋯`, constrained form.** For `n` even, `p ∣ q` and
`X` the kernel of the exponent sum at `x₂`, `gr_{m+1}(X) = δ_ρ(gr_m(X)^n) + T_{m+1}`, the tail
spanned by the `π^{m+1}` of the generator classes: Tau Ceti's
`freeProP.gradedPieceOf_exponentSumKer_demushkinWordNeTwo_eq_map_basisModificationDelta_sup`. -/
example {p : ℕ} [Fact p.Prime] {n : ℕ} (hn : Even n) (hn1 : 1 < n) {q : ℕ} (hq : p ∣ q) {m : ℕ}
    (hm : 1 ≤ m) :
    TauCeti.gradedPieceOf p (TauCeti.freeProP.exponentSumKer p (Fin n) ⟨1, hn1⟩) (m + 1) =
      Submodule.map
          (TauCeti.freeProP.basisModificationDelta p (Fin n) hm
            (TauCeti.gradedMk p (TauCeti.freeProP p (Fin n)) 1
              ⟨demushkinWordNeTwo q n (freeProPGen p n),
                TauCeti.demushkinWordNeTwo_mem_pLowerCentralSeries_one hq n _⟩))
          (Submodule.pi Set.univ fun _ =>
            TauCeti.gradedPieceOf p (TauCeti.freeProP.exponentSumKer p (Fin n) ⟨1, hn1⟩) m) ⊔
        Submodule.span (ZMod p)
          (Set.range fun a : {a : Fin n // a ≠ ⟨1, hn1⟩} =>
            TauCeti.gradedPowIter p (TauCeti.freeProP p (Fin n)) (m + 1)
            (TauCeti.gradedMkZero p (TauCeti.freeProP p (Fin n)) (TauCeti.freeProP.of ↑a))) :=
  TauCeti.freeProP.gradedPieceOf_exponentSumKer_demushkinWordNeTwo_eq_map_basisModificationDelta_sup
    hn hn1 hq hm

end CupForm

/-! ## Layer 9: the three normal forms, character values and the image table -/

section NormalForms

variable {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]

/-- **Layer 9, the normal form for `q ≠ 2` (Labute Thm 3).** A Demushkin group with `q ≠ 2` is
`⟨x₁, …, x_n ∣ x₁^q(x₁,x₂)⋯(x_{n-1},x_n)⟩`: Tau Ceti's
`IsDemushkin.exists_continuousMulEquiv_presentedProP_demushkinWordNeTwo_of_demushkinQ_ne_two`. -/
example {p : ℕ} [Fact p.Prime] (hG : TauCeti.IsDemushkin p G) (hq : TauCeti.demushkinQ hG ≠ 2) :
    Nonempty (G ≃ₜ* TauCeti.presentedProP p (Fin (TauCeti.demushkinRank hG))
      {demushkinWordNeTwo (TauCeti.demushkinQ hG) (TauCeti.demushkinRank hG)
        (freeProPGen p (TauCeti.demushkinRank hG))}) :=
  hG.exists_continuousMulEquiv_presentedProP_demushkinWordNeTwo_of_demushkinQ_ne_two hq

/-- **Layer 9, the normal form for `q = 2` and `n` odd (Labute Thm 3).** A Demushkin group at
`p = 2` of odd rank is `⟨x₁, …, x_n ∣ x₁²x₂^{2^f}(x₂,x₃)⋯⟩` with `2 ≤ f < ∞`, or the same word
without `x₂^{2^f}`, the value `f = ∞`: Tau Ceti's
`IsDemushkin.exists_continuousMulEquiv_presentedProP_demushkinWordTwoOdd_of_odd_demushkinRank`.
-/
example (hG : TauCeti.IsDemushkin 2 G) (hodd : Odd (TauCeti.demushkinRank hG)) :
    Nonempty (G ≃ₜ* TauCeti.presentedProP 2 (Fin (TauCeti.demushkinRank hG))
        {TauCeti.demushkinWordTwoOddTop (TauCeti.demushkinRank hG)
          (freeProPGen 2 (TauCeti.demushkinRank hG))}) ∨
      ∃ f, 2 ≤ f ∧ Nonempty (G ≃ₜ* TauCeti.presentedProP 2 (Fin (TauCeti.demushkinRank hG))
        {demushkinWordTwoOdd f (TauCeti.demushkinRank hG)
          (freeProPGen 2 (TauCeti.demushkinRank hG))}) :=
  hG.exists_continuousMulEquiv_presentedProP_demushkinWordTwoOdd_of_odd_demushkinRank hodd

/-- **Layer 9, the normal form for `q = 2` and `n` even (Labute Thm 3).** A Demushkin group at
`p = 2` of even rank with `q = 2` is `⟨x₁, …, x_n ∣ x₁^{2+α}(x₁,x₂)x₃^{q'}(x₃,x₄)⋯⟩` with
`α ∈ 4ℤ₂` and `q' = 0` (the value `f = ∞`) or `q' = 2^f`, `f ≥ 2`: Tau Ceti's
`IsDemushkin.exists_continuousMulEquiv_presentedProP_padicPow_mul_labuteComm_mul_demushkinWordNeTwo`
(in namespace `TauCeti`),
with the `2`-adic power `TauCeti.IsProP.padicPow`. -/
example (hG : TauCeti.IsDemushkin 2 G) (heven : Even (TauCeti.demushkinRank hG))
    (hq : TauCeti.demushkinQ hG = 2) :
    ∃ (α : ℤ_[2]) (q : ℕ), 4 ∣ α ∧ (q = 0 ∨ ∃ f, 2 ≤ f ∧ q = 2 ^ f) ∧
      Nonempty (G ≃ₜ* TauCeti.presentedProP 2 (Fin (TauCeti.demushkinRank hG))
        {(TauCeti.isProP_freeProP 2 (Fin (TauCeti.demushkinRank hG))).padicPow
            (freeProPGen 2 (TauCeti.demushkinRank hG) 0) (2 + α) *
          labuteComm (freeProPGen 2 (TauCeti.demushkinRank hG) 0)
            (freeProPGen 2 (TauCeti.demushkinRank hG) 1) *
          demushkinWordNeTwo q (TauCeti.demushkinRank hG - 2)
            fun i => freeProPGen 2 (TauCeti.demushkinRank hG) (i + 2)}) :=
  hG.exists_continuousMulEquiv_presentedProP_padicPow_mul_labuteComm_mul_demushkinWordNeTwo heven hq

/-- **Layer 9, character values and uniqueness of `χ`.** The canonical character is the unique
continuous character with the prescription property: Tau Ceti's
`TauCeti.IsDemushkin.existsUnique_hasPrescriptionProperty` and
`TauCeti.hasPrescriptionProperty_demushkinCharacter`. -/
example {p : ℕ} [Fact p.Prime] (hG : TauCeti.IsDemushkin p G) (χ : G →ₜ* ℤ_[p]ˣ)
    (hχ : TauCeti.HasPrescriptionProperty χ) : χ = TauCeti.demushkinCharacter hG :=
  hG.existsUnique_hasPrescriptionProperty.unique hχ
    (TauCeti.hasPrescriptionProperty_demushkinCharacter hG)

/-- **Layer 9, character values, `q ≠ 2`.** Along an isomorphism onto the normal form,
`χ(x₂)(1 - q) = 1` and `χ = 1` on the other generators: Tau Ceti's
`TauCeti.demushkinCharacter_apply_equiv_symm_of_equiv_demushkinWordNeTwo`. -/
example {p : ℕ} [Fact p.Prime] {n q : ℕ} (hG : TauCeti.IsDemushkin p G) (hq : p ∣ q)
    (hn : Even n) (hn1 : 1 < n)
    (e : G ≃ₜ* TauCeti.presentedProP p (Fin n) {demushkinWordNeTwo q n (freeProPGen p n)}) :
    (TauCeti.demushkinCharacter hG (e.symm (presentedProPGen p n _ 1)) : ℤ_[p]) * (1 - q) = 1 ∧
      ∀ i : ℕ, i ≠ 1 → TauCeti.demushkinCharacter hG (e.symm (presentedProPGen p n _ i)) = 1 :=
  TauCeti.demushkinCharacter_apply_equiv_symm_of_equiv_demushkinWordNeTwo hG hq hn hn1 e

/-- **Layer 9, character values, `q = 2` with `n` odd.** `χ(x₁) = -1`, `χ(x₃)(1 - 2^f) = 1`,
and `1` otherwise: Tau Ceti's
`TauCeti.demushkinCharacter_apply_equiv_symm_of_equiv_demushkinWordTwoOdd`. -/
example {n f : ℕ} (hG : TauCeti.IsDemushkin 2 G) (hf : 0 < f) (hn : Odd n) (hn2 : 2 < n)
    (e : G ≃ₜ* TauCeti.presentedProP 2 (Fin n) {demushkinWordTwoOdd f n (freeProPGen 2 n)}) :
    TauCeti.demushkinCharacter hG (e.symm (presentedProPGen 2 n _ 0)) = -1 ∧
      (TauCeti.demushkinCharacter hG (e.symm (presentedProPGen 2 n _ 2)) : ℤ_[2]) *
        (1 - 2 ^ f) = 1 ∧
      ∀ i : ℕ, i ≠ 0 → i ≠ 2 →
        TauCeti.demushkinCharacter hG (e.symm (presentedProPGen 2 n _ i)) = 1 :=
  TauCeti.demushkinCharacter_apply_equiv_symm_of_equiv_demushkinWordTwoOdd hG hf hn hn2 e

/-- **Layer 9, character values, `q = 2` with `n` even, `2`-adic exponent.** For the word
`x₁^{2+α}(x₁,x₂)x₃^{q}(x₃,x₄)⋯` with `α ∈ 2ℤ₂`: `χ(x₂)(1 + α) = -1`, `χ(x₄)(1 - q) = 1` when
`n > 2`, and `1` otherwise: Tau Ceti's
`TauCeti.demushkinCharacter_apply_equiv_symm_of_equiv_demushkinWordTwoEvenPadic`. -/
example {α : ℤ_[2]} {q n : ℕ} (hG : TauCeti.IsDemushkin 2 G) (hα : 2 ∣ α)
    (hq : 2 < n → 2 ∣ q) (hn : Even n) (hn1 : 1 < n)
    (e : G ≃ₜ* TauCeti.presentedProP 2 (Fin n)
      {TauCeti.demushkinWordTwoEvenPadic (TauCeti.isProP_freeProP 2 (Fin n)) α q n
        (freeProPGen 2 n)}) :
    (TauCeti.demushkinCharacter hG (e.symm (presentedProPGen 2 n _ 1)) : ℤ_[2]) * (1 + α) = -1 ∧
      (2 < n → (TauCeti.demushkinCharacter hG (e.symm (presentedProPGen 2 n _ 3)) : ℤ_[2]) *
        (1 - q) = 1) ∧
      ∀ i : ℕ, i ≠ 1 → i ≠ 3 →
        TauCeti.demushkinCharacter hG (e.symm (presentedProPGen 2 n _ i)) = 1 :=
  TauCeti.demushkinCharacter_apply_equiv_symm_of_equiv_demushkinWordTwoEvenPadic hG hα hq hn hn1 e

/-- **Layer 9, the image table, `q ≠ 2`.** For `q(G) = p^s ≠ 2` the image is `1 + qℤ_p`:
Tau Ceti's `TauCeti.range_demushkinCharacter_eq_unitsPrincipal`. -/
example {p : ℕ} [Fact p.Prime] (hG : TauCeti.IsDemushkin p G) {s : ℕ}
    (hs : TauCeti.demushkinQ hG = p ^ s) (hq : TauCeti.demushkinQ hG ≠ 2) :
    (TauCeti.demushkinCharacter hG).toMonoidHom.range = TauCeti.unitsPrincipal p s :=
  TauCeti.range_demushkinCharacter_eq_unitsPrincipal hG hs hq

/-- **Layer 9, the image table, `q = 2` with `n` odd.** The image is `{±1} × U^(f)`: Tau Ceti's
`TauCeti.range_demushkinCharacter_eq_unitsPlusMinus_of_equiv_demushkinWordTwoOdd`. -/
example {n f : ℕ} (hG : TauCeti.IsDemushkin 2 G) (hf : 2 ≤ f) (hn : Odd n) (hn2 : 2 < n)
    (e : G ≃ₜ* TauCeti.presentedProP 2 (Fin n) {demushkinWordTwoOdd f n (freeProPGen 2 n)}) :
    (TauCeti.demushkinCharacter hG).toMonoidHom.range = TauCeti.unitsPlusMinus f :=
  TauCeti.range_demushkinCharacter_eq_unitsPlusMinus_of_equiv_demushkinWordTwoOdd hG hf hn hn2 e

/-- **Layer 9, the image table, `q = 2` with `n` even, `v₂(α) ≥ f`.** The image is
`{±1} × U^(f)`: Tau Ceti's
`TauCeti.range_demushkinCharacter_eq_unitsPlusMinus_of_equiv_demushkinWordTwoEvenPadic`. -/
example {α : ℤ_[2]} {n f : ℕ} (hG : TauCeti.IsDemushkin 2 G) (hf : 2 ≤ f) (hn : Even n)
    (hn3 : 3 < n) (hα : 2 ^ f ∣ α)
    (e : G ≃ₜ* TauCeti.presentedProP 2 (Fin n)
      {TauCeti.demushkinWordTwoEvenPadic (TauCeti.isProP_freeProP 2 (Fin n)) α (2 ^ f) n
        (freeProPGen 2 n)}) :
    (TauCeti.demushkinCharacter hG).toMonoidHom.range = TauCeti.unitsPlusMinus f :=
  TauCeti.range_demushkinCharacter_eq_unitsPlusMinus_of_equiv_demushkinWordTwoEvenPadic hG hf rfl
    hn hn3 hα e

/-- **Layer 9, the image table, `q = 2` with `n` even, `f' = v₂(α) < f`.** The image is
`U^[f']`, the closed subgroup generated by `-1 + 2^{f'}`: Tau Ceti's
`TauCeti.range_demushkinCharacter_eq_of_equiv_demushkinWordTwoEvenPadic_of_not_dvd`. -/
example {α : ℤ_[2]} {n f g : ℕ} (hG : TauCeti.IsDemushkin 2 G) (hg : 2 ≤ g) (hgα : 2 ^ g ∣ α)
    (hgα' : ¬ 2 ^ (g + 1) ∣ α) (hgf : g < f) (hn : Even n) (hn3 : 3 < n) {w : ℤ_[2]ˣ}
    (hw : (w : ℤ_[2]) = -1 + 2 ^ g)
    (e : G ≃ₜ* TauCeti.presentedProP 2 (Fin n)
      {TauCeti.demushkinWordTwoEvenPadic (TauCeti.isProP_freeProP 2 (Fin n)) α (2 ^ f) n
        (freeProPGen 2 n)}) :
    (TauCeti.demushkinCharacter hG).toMonoidHom.range = (Subgroup.zpowers w).topologicalClosure :=
  TauCeti.range_demushkinCharacter_eq_of_equiv_demushkinWordTwoEvenPadic_of_not_dvd hG hg hgα hgα'
    (by push_cast; exact pow_dvd_pow 2 hgf) hn hn3 hw e

end NormalForms

/-! ## Layer 9: the `q = 2` even-rank families -/

section EvenRank

/-- **Layer 9, the family `x₁^{2+2^f}(x₁,x₂)(x₃,x₄)⋯` realizes `U^[f]`**, for `N = n/2 ≥ 1` and
`2 ≤ f < ∞`, and `(U^[f] : U^[f]²) = 2`: Tau Ceti's
`TauCeti.exists_isDemushkin_range_eq_topologicalClosure_zpowers_of_even`, transported to this word
by `TauCeti.IsDemushkin.exists_continuousMulEquiv_presentedProP_demushkinWordNeTwo_of_range_eq`, and
`TauCeti.profiniteIndex_subgroupOf_map_powMonoidHom_two_topologicalClosure_zpowers_two`. -/
example {n f : ℕ} (hn : Even n) (hn0 : n ≠ 0) (hf : 2 ≤ f) {w : ℤ_[2]ˣ}
    (hw : (w : ℤ_[2]) = -1 + 2 ^ f) :
    (∃ hG : TauCeti.IsDemushkin 2
        (TauCeti.presentedProP 2 (Fin n) {demushkinWordNeTwo (2 + 2 ^ f) n (freeProPGen 2 n)}),
      TauCeti.demushkinRank hG = n ∧
        (TauCeti.demushkinCharacter hG).toMonoidHom.range =
          (Subgroup.zpowers w).topologicalClosure) ∧
      (((Subgroup.zpowers w).topologicalClosure.map (powMonoidHom 2)).subgroupOf
        (Subgroup.zpowers w).topologicalClosure).profiniteIndex =
          TauCeti.Supernatural.primePower ⟨2, Nat.prime_two⟩ 1 := by
  refine ⟨?_, TauCeti.profiniteIndex_subgroupOf_map_powMonoidHom_two_topologicalClosure_zpowers_two
    hf (TauCeti.neg_mem_unitsPrincipal_two_of_val_eq hw)
    (TauCeti.neg_notMem_unitsPrincipal_two_succ_of_val_eq hw)⟩
  obtain ⟨r, hG, hrank, -, hrange⟩ :=
    TauCeti.exists_isDemushkin_range_eq_topologicalClosure_zpowers_of_even hn hn0 hf hw
  obtain ⟨e⟩ := hG.exists_continuousMulEquiv_presentedProP_demushkinWordNeTwo_of_range_eq
    (by rw [hrank]; exact hn) hf hw
    (hrange _ (TauCeti.hasPrescriptionProperty_demushkinCharacter hG))
  rw [hrank] at e
  have hq : 2 ∣ 2 + 2 ^ f := dvd_add dvd_rfl (dvd_pow_self 2 (by omega))
  have hH := TauCeti.isDemushkin_presentedProP_demushkinWordNeTwo hn hn0 hq
  refine ⟨hH, TauCeti.demushkinRank_presentedProP_demushkinWordNeTwo hq hH, ?_⟩
  rw [TauCeti.range_demushkinCharacter_of_equiv hG hH e]
  exact hrange _ (TauCeti.hasPrescriptionProperty_demushkinCharacter hG)

/-- **Layer 9, the endpoint `f = ∞` of the first family.** `x₁²(x₁,x₂)(x₃,x₄)⋯` presents a
Demushkin group of rank `n` with image `{±1}`, and `({±1} : {±1}²) = 2`: Tau Ceti's
`TauCeti.isDemushkin_presentedProP_demushkinWordNeTwo`,
`TauCeti.range_demushkinCharacter_eq_zpowers_neg_one_of_equiv_demushkinWordNeTwo` and
`TauCeti.profiniteIndex_subgroupOf_map_powMonoidHom_two_zpowers_neg_one`. -/
example {n : ℕ} (hn : Even n) (hn0 : n ≠ 0) :
    (∃ hG : TauCeti.IsDemushkin 2
        (TauCeti.presentedProP 2 (Fin n) {demushkinWordNeTwo 2 n (freeProPGen 2 n)}),
      TauCeti.demushkinRank hG = n ∧
        (TauCeti.demushkinCharacter hG).toMonoidHom.range = Subgroup.zpowers (-1)) ∧
      (((Subgroup.zpowers (-1 : ℤ_[2]ˣ)).map (powMonoidHom 2)).subgroupOf
        (Subgroup.zpowers (-1 : ℤ_[2]ˣ))).profiniteIndex =
          TauCeti.Supernatural.primePower ⟨2, Nat.prime_two⟩ 1 := by
  have hH := TauCeti.isDemushkin_presentedProP_demushkinWordNeTwo hn hn0 (dvd_refl 2)
  have hn1 : 1 < n := by
    obtain ⟨k, hk⟩ := hn
    omega
  exact ⟨⟨hH, TauCeti.demushkinRank_presentedProP_demushkinWordNeTwo (dvd_refl 2) hH,
    TauCeti.range_demushkinCharacter_eq_zpowers_neg_one_of_equiv_demushkinWordNeTwo hH hn hn1
      (ContinuousMulEquiv.refl _)⟩,
    TauCeti.profiniteIndex_subgroupOf_map_powMonoidHom_two_zpowers_neg_one⟩

/-- **Layer 9, the family `x₁²(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯` realizes `{±1} × U^(f)`**, for `N ≥ 2`
and `2 ≤ f < ∞`, and `({±1} × U^(f) : ({±1} × U^(f))²) = 4`: Tau Ceti's
`TauCeti.isDemushkin_presentedProP_demushkinWordTwoEven`,
`TauCeti.range_demushkinCharacter_eq_unitsPlusMinus_of_equiv_demushkinWordTwoEven` and
`TauCeti.profiniteIndex_subgroupOf_map_powMonoidHom_two_unitsPlusMinus`. -/
example {n f : ℕ} (hn : Even n) (hn4 : 4 ≤ n) (hf : 2 ≤ f) :
    (∃ hG : TauCeti.IsDemushkin 2
        (TauCeti.presentedProP 2 (Fin n) {demushkinWordTwoEven 0 f n (freeProPGen 2 n)}),
      TauCeti.demushkinRank hG = n ∧
        (TauCeti.demushkinCharacter hG).toMonoidHom.range = TauCeti.unitsPlusMinus f) ∧
      (((TauCeti.unitsPlusMinus f).map (powMonoidHom 2)).subgroupOf
        (TauCeti.unitsPlusMinus f)).profiniteIndex =
          TauCeti.Supernatural.primePower ⟨2, Nat.prime_two⟩ 2 := by
  have hH := TauCeti.isDemushkin_presentedProP_demushkinWordTwoEven hn (by omega) (dvd_zero 2)
    (by omega : 0 < f)
  exact ⟨⟨hH, TauCeti.demushkinRank_presentedProP_demushkinWordTwoEven (dvd_zero 2) (by omega) hH,
    TauCeti.range_demushkinCharacter_eq_unitsPlusMinus_of_equiv_demushkinWordTwoEven hH hf hn
      (by omega) (by simp) (ContinuousMulEquiv.refl _)⟩,
    TauCeti.profiniteIndex_subgroupOf_map_powMonoidHom_two_unitsPlusMinus hf⟩

end EvenRank

/-! ## Layer 9: the classification theorems -/

section Classification

/-- **Layer 9, uniqueness.** Two Demushkin groups with the same `n` and the same `Im χ` are
isomorphic: Tau Ceti's
`TauCeti.IsDemushkin.nonempty_continuousMulEquiv_of_range_demushkinCharacter_eq`. -/
example {p : ℕ} [Fact p.Prime] {G H : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : TauCeti.IsDemushkin p G) (hH : TauCeti.IsDemushkin p H)
    (hrank : TauCeti.demushkinRank hG = TauCeti.demushkinRank hH)
    (himage : (TauCeti.demushkinCharacter hG).toMonoidHom.range =
      (TauCeti.demushkinCharacter hH).toMonoidHom.range) :
    Nonempty (G ≃ₜ* H) :=
  hG.nonempty_continuousMulEquiv_of_range_demushkinCharacter_eq hH himage hrank

/-- **Layer 9, existence, situation 1.** For `n` even and `A ≤ ℤ_pˣ` closed and pro-`p`, `(n, A)`
is realized exactly when `p^n > (A : A^p)`: Tau Ceti's
`TauCeti.exists_isDemushkin_range_demushkinCharacter_eq_iff_of_even`. -/
example {p : ℕ} [hp : Fact p.Prime] {n : ℕ} (hn : Even n) {A : Subgroup ℤ_[p]ˣ}
    (hA : IsClosed (A : Set ℤ_[p]ˣ)) (hAp : TauCeti.IsProP p A) :
    (∃ r : TauCeti.freeProP p (Fin n),
      ∃ hG : TauCeti.IsDemushkin p (TauCeti.presentedProP p (Fin n) {r}),
        TauCeti.demushkinRank hG = n ∧ (TauCeti.demushkinCharacter hG).toMonoidHom.range = A) ↔
      Subgroup.profiniteIndex ((A.map (powMonoidHom p)).subgroupOf A) <
        TauCeti.Supernatural.primePower ⟨p, hp.out⟩ n :=
  TauCeti.exists_isDemushkin_range_demushkinCharacter_eq_iff_of_even hn hA hAp

/-- **Layer 9, existence, odd rank needs `p = 2`.** At an odd prime no Demushkin group has odd
rank: Tau Ceti's `TauCeti.IsDemushkin.even_demushkinRank_of_ne_two`. -/
example {p : ℕ} [Fact p.Prime] (hp : p ≠ 2) {n : ℕ} (hn : Odd n) :
    ¬ ∃ r : TauCeti.freeProP p (Fin n),
      ∃ hG : TauCeti.IsDemushkin p (TauCeti.presentedProP p (Fin n) {r}),
        TauCeti.demushkinRank hG = n := by
  rintro ⟨r, hG, hrank⟩
  have h := hG.even_demushkinRank_of_ne_two hp
  rw [hrank] at h
  exact (Nat.not_even_iff_odd.mpr hn) h

/-- **Layer 9, existence, situations 2 and 3.** At `p = 2` and `n` odd, `(n, A)` is realized
exactly when `n ≥ 3` and `A = {±1} × U^(f)` with `f ≥ 2` or `f = ∞` (`A = {±1}`), or `n = 1` and
`A = {±1}`; no hypothesis on `A` is needed: Tau Ceti's
`TauCeti.exists_isDemushkin_range_demushkinCharacter_eq_iff_of_odd`. -/
example {n : ℕ} (hn : Odd n) {A : Subgroup ℤ_[2]ˣ} :
    (∃ r : TauCeti.freeProP 2 (Fin n),
      ∃ hG : TauCeti.IsDemushkin 2 (TauCeti.presentedProP 2 (Fin n) {r}),
        TauCeti.demushkinRank hG = n ∧ (TauCeti.demushkinCharacter hG).toMonoidHom.range = A) ↔
      (3 ≤ n ∧ ((∃ f, 2 ≤ f ∧ A = TauCeti.unitsPlusMinus f) ∨ A = Subgroup.zpowers (-1))) ∨
        (n = 1 ∧ A = Subgroup.zpowers (-1)) := by
  rw [TauCeti.exists_isDemushkin_range_demushkinCharacter_eq_iff_of_odd hn]
  obtain ⟨k, rfl⟩ := hn
  rcases k with _ | k
  · simp
  · constructor
    · rintro (h | ⟨h3, h⟩)
      · exact Or.inl ⟨by omega, Or.inr h⟩
      · exact Or.inl ⟨h3, Or.inl h⟩
    · rintro (⟨-, h | h⟩ | ⟨h, -⟩)
      · exact Or.inr ⟨by omega, h⟩
      · exact Or.inl h
      · omega

/-- **Layer 9, small rank.** A Demushkin group has rank one exactly when it is `ℤ/2`
(NSW (3.9.10)), and `(1, {±1})` is realized: Tau Ceti's
`TauCeti.IsDemushkin.demushkinRank_eq_one_iff`
and `TauCeti.exists_isDemushkin_one_range_eq_zpowers_neg_one`. -/
example {p : ℕ} [Fact p.Prime] {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsDemushkin p G) :
    (TauCeti.demushkinRank hG = 1 ↔ Nonempty (G ≃ₜ* Multiplicative (ZMod 2))) ∧
      ∃ r : TauCeti.freeProP 2 (Fin 1),
        ∃ hH : TauCeti.IsDemushkin 2 (TauCeti.presentedProP 2 (Fin 1) {r}),
          TauCeti.demushkinRank hH = 1 ∧
            (TauCeti.demushkinCharacter hH).toMonoidHom.range = Subgroup.zpowers (-1) := by
  refine ⟨hG.demushkinRank_eq_one_iff, ?_⟩
  obtain ⟨r, hH, hrank, -, hrange⟩ := TauCeti.exists_isDemushkin_one_range_eq_zpowers_neg_one
  exact ⟨r, hH, hrank, hrange _ (TauCeti.hasPrescriptionProperty_demushkinCharacter hH)⟩

/-- **Layer 9, consequences for open subgroups.** For `U` open in an infinite Demushkin `G`,
`n(U) = 2 + [G : U](n(G) - 2)` and `Im(χ_U) = χ(U)`, so the classification identifies `U` with any
Demushkin group with these invariants: Tau Ceti's `TauCeti.IsDemushkin.openSubgroup`,
`TauCeti.IsDemushkin.demushkinRank_openSubgroup`,
`TauCeti.IsDemushkin.range_demushkinCharacter_openSubgroup`, and the uniqueness theorem. -/
example {p : ℕ} [Fact p.Prime] {G H : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] [Infinite G] [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : TauCeti.IsDemushkin p G) (U : OpenSubgroup G) :
    ∃ hU : TauCeti.IsDemushkin p (U : Subgroup G),
      TauCeti.demushkinRank hU = 2 + (U : Subgroup G).index * (TauCeti.demushkinRank hG - 2) ∧
      (TauCeti.demushkinCharacter hU).toMonoidHom.range =
        (U : Subgroup G).map (TauCeti.demushkinCharacter hG).toMonoidHom ∧
      ∀ hH : TauCeti.IsDemushkin p H,
        TauCeti.demushkinRank hH = 2 + (U : Subgroup G).index * (TauCeti.demushkinRank hG - 2) →
        (TauCeti.demushkinCharacter hH).toMonoidHom.range =
          (U : Subgroup G).map (TauCeti.demushkinCharacter hG).toMonoidHom →
        Nonempty ((U : Subgroup G) ≃ₜ* H) := by
  refine ⟨hG.openSubgroup U, hG.demushkinRank_openSubgroup U,
    hG.range_demushkinCharacter_openSubgroup U, fun hH hrank himage => ?_⟩
  exact (hG.openSubgroup U).nonempty_continuousMulEquiv_of_range_demushkinCharacter_eq hH
    ((hG.range_demushkinCharacter_openSubgroup U).trans himage.symm)
    ((hG.demushkinRank_openSubgroup U).trans hrank.symm)

end Classification

/-! ## Layer 10: free pro-`C` groups on profinite spaces

The free object is Tau Ceti's `TauCeti.freeProCPointed C x₀`, used under that name. -/

section Layer10

/-- **Layer 10, construction.** `F_C(X, x₀)` is pro-`C`, its generator map is continuous and
kills `x₀`, and the image of `X` generates it topologically: Tau Ceti's
`TauCeti.isProC_freeProCPointed`, `TauCeti.freeProCPointed.continuous_of`,
`TauCeti.freeProCPointed.of_basePoint` and
`TauCeti.freeProCPointed.topologicalClosure_closure_range_of_eq_top`. -/
example (C : TauCeti.FiniteGroupClass.{u}) {X : Type u} [TopologicalSpace X] (x₀ : X) :
    TauCeti.IsProC C (TauCeti.freeProCPointed C x₀) ∧
      Continuous (TauCeti.freeProCPointed.of C x₀) ∧ TauCeti.freeProCPointed.of C x₀ x₀ = 1 ∧
      (Subgroup.closure (Set.range (TauCeti.freeProCPointed.of C x₀))).topologicalClosure = ⊤ :=
  ⟨TauCeti.isProC_freeProCPointed C x₀, TauCeti.freeProCPointed.continuous_of C x₀,
    TauCeti.freeProCPointed.of_basePoint C x₀,
    TauCeti.freeProCPointed.topologicalClosure_closure_range_of_eq_top C x₀⟩

/-- **Layer 10, the universal property.** A continuous map from `X` to a profinite pro-`C` group
that sends `x₀` to `1` extends uniquely to a continuous homomorphism out of `F_C(X, x₀)`: Tau Ceti's
`TauCeti.freeProCPointed.existsUnique_lift`. -/
example (C : TauCeti.FiniteGroupClass.{u}) {X : Type u} [TopologicalSpace X] (x₀ : X) {P : Type u}
    [Group P] [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P]
    [TotallyDisconnectedSpace P] (hP : TauCeti.IsProC C P) (f : X → P) (hf : Continuous f)
    (hf₀ : f x₀ = 1) :
    ∃! g : TauCeti.freeProCPointed C x₀ →ₜ* P,
      ∀ x : X, g (TauCeti.freeProCPointed.of C x₀ x) = f x :=
  TauCeti.freeProCPointed.existsUnique_lift hP f hf hf₀

/-- **Layer 10, the discrete case recovers Layer 4.** For a discrete `X`, `F_C(X, x₀)` is the free
pro-`C` group on `X ∖ {x₀}`: Tau Ceti's `TauCeti.freeProCPointed.equivFreeProC`. -/
example (C : TauCeti.FiniteGroupClass.{u}) {X : Type u} [TopologicalSpace X] [DiscreteTopology X]
    (x₀ : X) :
    Nonempty (TauCeti.freeProCPointed C x₀ ≃ₜ* TauCeti.freeProC C {x : X // x ≠ x₀}) :=
  ⟨TauCeti.freeProCPointed.equivFreeProC C x₀⟩

/-- **Layer 10, the two free objects on an infinite set.** For a discrete `S`, the inclusion
`S → S⁺` induces a continuous surjection `freeProC C S ↠ F_C(S⁺, ∞)`, and the images of the points
of `S` converge to `1`: Tau Ceti's `TauCeti.freeProCPointed.fromFreeProC_surjective` and
`TauCeti.freeProCPointed.convergesToOne_range_of_coe`. -/
example (C : TauCeti.FiniteGroupClass.{u}) (S : Type u) [TopologicalSpace S]
    [DiscreteTopology S] :
    Function.Surjective (TauCeti.freeProCPointed.fromFreeProC C S) ∧
      TauCeti.ConvergesToOne (Set.range fun s : S ↦
        TauCeti.freeProCPointed.of C (OnePoint.infty : OnePoint S) (s : OnePoint S)) :=
  ⟨TauCeti.freeProCPointed.fromFreeProC_surjective C S,
    TauCeti.freeProCPointed.convergesToOne_range_of_coe C S⟩

/-- **Layer 10, at `C = ` finite `p`-groups the comparison map is not injective**, for an infinite
discrete `S`: the ranks `p ^ #S` of the source and `#S` of the target differ. Tau Ceti's
`TauCeti.freeProCPointed.not_injective_fromFreeProC`. -/
theorem not_injective_fromFreeProC_finiteGroupClassP (p : ℕ) [Fact p.Prime] (S : Type u)
    [TopologicalSpace S] [DiscreteTopology S] [Infinite S] :
    ¬ Function.Injective
      (TauCeti.freeProCPointed.fromFreeProC (TauCeti.finiteGroupClassP.{u} p) S) :=
  TauCeti.freeProCPointed.not_injective_fromFreeProC p S

/-- **Layer 10, existence of bases converging to `1`.** The free pro-`p` group on a pointed space
has a subset `s` converging to `1` on which it is free, its presentation on `s` being a topological
isomorphism: Tau Ceti's `TauCeti.freeProCPointed.cohomologicalDimensionAt_le_one` and
`IsProP.exists_convergesToOne_continuousMulEquiv_presentation_of_cohomologicalDimensionAt_le_one`.
-/
example (p : ℕ) [Fact p.Prime] {X : Type u} [TopologicalSpace X] (x₀ : X) :
    ∃ s : Set (TauCeti.freeProCPointed (TauCeti.finiteGroupClassP.{u} p) x₀),
      TauCeti.ConvergesToOne s ∧
      ∃ e : TauCeti.freeProPInsertOne p s ≃ₜ* TauCeti.freeProCPointed
          (TauCeti.finiteGroupClassP.{u} p) x₀,
        ⇑e = ⇑((TauCeti.freeProCPointed.isProP_finiteGroupClassP x₀ p).presentation s) :=
  have hF := TauCeti.freeProCPointed.isProP_finiteGroupClassP x₀ p
  hF.exists_convergesToOne_continuousMulEquiv_presentation_of_cohomologicalDimensionAt_le_one
    (TauCeti.freeProCPointed.cohomologicalDimensionAt_le_one p x₀ (Fact.out : p.Prime).ne_zero)

/-- **Layer 10, uniqueness of the cardinality of a basis converging to `1`.** Two sets converging
to `1` on whose pointed spaces one group is free pro-`p` have the same cardinality once `1` is
removed: Tau Ceti's `TauCeti.ConvergesToOne.mk_diff_singleton_eq_of_continuousMulEquiv`. -/
example {p : ℕ} [Fact p.Prime] {G G' H : Type u} [Group G] [TopologicalSpace G] [T2Space G]
    [Group G'] [TopologicalSpace G'] [T2Space G'] [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] {s : Set G} {t : Set G'} (hs : TauCeti.ConvergesToOne s)
    (ht : TauCeti.ConvergesToOne t) (e : TauCeti.freeProPInsertOne p s ≃ₜ* H)
    (e' : TauCeti.freeProPInsertOne p t ≃ₜ* H) :
    Cardinal.mk ↥(s \ {1}) = Cardinal.mk ↥(t \ {1}) :=
  hs.mk_diff_singleton_eq_of_continuousMulEquiv ht e e'

/-- **Layer 10, invariance of the rank** under topological isomorphism, as a cardinal and with no
finiteness hypothesis: Tau Ceti's `TauCeti.topologicalGeneratorRank_congr`. -/
example {G H : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [Group H]
    [TopologicalSpace H] [IsTopologicalGroup H] (e : G ≃ₜ* H) :
    TauCeti.topologicalGeneratorRank G = TauCeti.topologicalGeneratorRank H :=
  TauCeti.topologicalGeneratorRank_congr e

/-- **Layer 10, the infinite-rank Frattini argument.** For a pro-`p` group,
`topologicalGeneratorRank G = dim_{𝔽_p} Hom_cont(G, 𝔽_p)`: Tau Ceti's
`TauCeti.IsProP.topologicalGeneratorRank_eq_rank_continuousZModDual`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) :
    TauCeti.topologicalGeneratorRank G =
      Module.rank (ZMod p) (TauCeti.continuousZModDual p G) :=
  hG.topologicalGeneratorRank_eq_rank_continuousZModDual

/-- **Layer 10, the rank of `F_p(X, ∗)`** is the `𝔽_p`-dimension of the continuous maps
`X → 𝔽_p` vanishing at `∗`, which for `X = S⁺` is `#S`: Tau Ceti's
`TauCeti.freeProCPointed.topologicalGeneratorRank_eq_rank` and
`TauCeti.freeProCPointed.topologicalGeneratorRank_onePoint`. -/
example (p : ℕ) [Fact p.Prime] {X : Type u} [TopologicalSpace X] (x₀ : X) (S : Type u)
    [TopologicalSpace S] [DiscreteTopology S] :
    TauCeti.topologicalGeneratorRank
        (TauCeti.freeProCPointed (TauCeti.finiteGroupClassP.{u} p) x₀) =
      Module.rank (ZMod p)
        (ContinuousMap.evalCLM (ZMod p) x₀ : C(X, ZMod p) →L[ZMod p] ZMod p).ker ∧
    TauCeti.topologicalGeneratorRank
        (TauCeti.freeProCPointed (TauCeti.finiteGroupClassP.{u} p) (OnePoint.infty : OnePoint S)) =
      Cardinal.mk S :=
  ⟨TauCeti.freeProCPointed.topologicalGeneratorRank_eq_rank p x₀,
    TauCeti.freeProCPointed.topologicalGeneratorRank_onePoint p S⟩

/-- **Layer 10, presentations at arbitrary rank.** The presentation `F_p(insert 1 s, 1) → G` on a
subset `s` is surjective exactly when `s` generates `G` topologically: Tau Ceti's
`TauCeti.IsProP.presentation_surjective_iff`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) (s : Set G) :
    Function.Surjective (hG.presentation s) ↔ (Subgroup.closure s).topologicalClosure = ⊤ :=
  hG.presentation_surjective_iff s

/-- **Layer 10, minimal presentations at arbitrary rank.** Every pro-`p` group has a presentation
by the free pro-`p` group on a pointed profinite space whose kernel lies in the Frattini subgroup
and which preserves the rank: Tau Ceti's
`TauCeti.IsProP.exists_convergesToOne_presentation_surjective_ker_le_proPFrattini`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) :
    ∃ s : Set G, TauCeti.ConvergesToOne s ∧ Function.Surjective (hG.presentation s) ∧
      (hG.presentation s).ker ≤ TauCeti.proPFrattini p (TauCeti.freeProPInsertOne p s) ∧
      TauCeti.topologicalGeneratorRank (TauCeti.freeProPInsertOne p s) =
        TauCeti.topologicalGeneratorRank G :=
  hG.exists_convergesToOne_presentation_surjective_ker_le_proPFrattini

/-- **Layer 10, Serre's theorem in full generality.** A pro-`p` group has `cd_p G ≤ 1` if and only
if it is free pro-`p` on a pointed profinite space, its presentation on some subset converging to
`1` being a topological isomorphism; no finite generation is assumed: Tau Ceti's
`IsProP.cohomologicalDimensionAt_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation`.
-/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) :
    TauCeti.cohomologicalDimensionAt.{u} p G ≤ 1 ↔
      ∃ s : Set G, TauCeti.ConvergesToOne s ∧
        ∃ e : TauCeti.freeProPInsertOne p s ≃ₜ* G, ⇑e = ⇑(hG.presentation s) :=
  hG.cohomologicalDimensionAt_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation

/-- **Layer 10, projectivity is freeness for pro-`p` groups**, and free pro-`p` groups on pointed
spaces are projective and solve every finite `p`-group embedding problem: Tau Ceti's
`TauCeti.IsProP.isProjective_iff_exists_convergesToOne_continuousMulEquiv_presentation`,
`TauCeti.isProjective_freeProCPointed` and `TauCeti.hasPGroupSolutions_freeProCPointed`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) {X : Type u}
    [TopologicalSpace X] (x₀ : X) :
    (TauCeti.IsProjective.{u, u, u} p G ↔ ∃ s : Set G, TauCeti.ConvergesToOne s ∧
      ∃ e : TauCeti.freeProPInsertOne p s ≃ₜ* G, ⇑e = ⇑(hG.presentation s)) ∧
    TauCeti.IsProjective.{u, u, u} p
      (TauCeti.freeProCPointed (TauCeti.finiteGroupClassP.{u} p) x₀) ∧
    TauCeti.HasPGroupSolutions.{u} p
      (TauCeti.freeProCPointed (TauCeti.finiteGroupClassP.{u} p) x₀) :=
  ⟨hG.isProjective_iff_exists_convergesToOne_continuousMulEquiv_presentation,
    TauCeti.isProjective_freeProCPointed p x₀, TauCeti.hasPGroupSolutions_freeProCPointed p x₀⟩

/-- **Layer 10, closed subgroups of free pro-`p` groups are free pro-`p`** (the pro-`p`
Nielsen-Schreier theorem), on a basis converging to `1`: Tau Ceti's
`TauCeti.freeProP.exists_convergesToOne_continuousMulEquiv_of_isClosed`. -/
example {p : ℕ} [Fact p.Prime] {X : Type u} {U : Subgroup (TauCeti.freeProP p X)}
    (hU : IsClosed (U : Set (TauCeti.freeProP p X))) :
    ∃ s : Set U, TauCeti.ConvergesToOne s ∧ ∃ e : TauCeti.freeProPInsertOne p s ≃ₜ* U,
      ∀ x : ↥(insert (1 : U) s),
        e (TauCeti.freeProCPointed.of (TauCeti.finiteGroupClassP.{u} p) _ x) = x :=
  TauCeti.freeProP.exists_convergesToOne_continuousMulEquiv_of_isClosed hU

/-- **Layer 10, closed subgroups of free pro-`p` groups.** A closed subgroup of a free pro-`p`
group on `Fin n` has `cd_p ≤ 1`: Tau Ceti's
`TauCeti.freeProP.cohomologicalDimensionAt_le_one_of_isClosed`,
which holds on any type of generators. The instance arguments of the old statement are kept;
Tau Ceti does not need them. -/
theorem cd_p_le_one_of_isClosed_freeProP (p : ℕ) [Fact p.Prime] (n : ℕ)
    [TotallyDisconnectedSpace (TauCeti.freeProP p (Fin n))]
    (H : Subgroup (TauCeti.freeProP p (Fin n)))
    (hH : IsClosed (H : Set (TauCeti.freeProP p (Fin n))))
    [CompactSpace H] [TotallyDisconnectedSpace H] :
    TauCeti.cohomologicalDimensionAt.{0} p H ≤ 1 :=
  TauCeti.freeProP.cohomologicalDimensionAt_le_one_of_isClosed (Fact.out : p.Prime).ne_zero hH

end Layer10

/-! ## Worked examples -/

section WorkedExamples

/-- **Worked example, free pro-`p` groups at finite rank.** The free pro-`p` group on a finite
type `X` has rank `#X`: Tau Ceti's `TauCeti.topologicalGeneratorRank_freeProP`. -/
example (p : ℕ) [Fact p.Prime] (X : Type) [Finite X] :
    TauCeti.topologicalGeneratorRank (TauCeti.freeProP p X) = Cardinal.mk X :=
  TauCeti.topologicalGeneratorRank_freeProP p

/-- **Worked example, finite cyclic pro-`p` groups.** `ℤ/p^k` is pro-`p`: Tau Ceti's
`TauCeti.isProP_multiplicative_zmod_pow`. -/
example (p k : ℕ) : TauCeti.IsProP p (Multiplicative (ZMod (p ^ k))) :=
  TauCeti.isProP_multiplicative_zmod_pow p k

/-- **Worked example, the standard one-relator presentations.** For `n ≥ 2` even and `p ∣ q`, the
group `⟨x₁, …, x_n ∣ x₁^q(x₁,x₂)⋯(x_{n-1},x_n)⟩` is Demushkin of rank `n`: Tau Ceti's
`TauCeti.isDemushkin_presentedProP_demushkinWordNeTwo` and
`TauCeti.demushkinRank_presentedProP_demushkinWordNeTwo`. -/
example {p : ℕ} [Fact p.Prime] {n q : ℕ} (hn : Even n) (hn0 : n ≠ 0) (hq : p ∣ q) :
    ∃ hG : TauCeti.IsDemushkin p
        (TauCeti.presentedProP p (Fin n) {demushkinWordNeTwo q n (freeProPGen p n)}),
      TauCeti.demushkinRank hG = n :=
  ⟨TauCeti.isDemushkin_presentedProP_demushkinWordNeTwo hn hn0 hq,
    TauCeti.demushkinRank_presentedProP_demushkinWordNeTwo hq _⟩

/-- **Worked example, the dyadic group `D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y)⟩`.** Its relator is the odd
normal-form word at `n = 3`, `f = 2`, and it is Demushkin with `n = 3` and `q = 2`: Tau Ceti's
`TauCeti.d0Relator_eq_demushkinWordTwoOdd`, `TauCeti.isDemushkin_demushkinD0`,
`TauCeti.demushkinRank_demushkinD0` and `TauCeti.demushkinQ_demushkinD0`. -/
example :
    TauCeti.d0Relator = demushkinWordTwoOdd 2 3 (freeProPGen 2 3) ∧
      ∃ hG : TauCeti.IsDemushkin 2 TauCeti.demushkinD0,
        TauCeti.demushkinRank hG = 3 ∧ TauCeti.demushkinQ hG = 2 :=
  ⟨TauCeti.d0Relator_eq_demushkinWordTwoOdd, TauCeti.isDemushkin_demushkinD0,
    TauCeti.demushkinRank_demushkinD0 _, TauCeti.demushkinQ_demushkinD0 _⟩

end WorkedExamples

end Layers9And10

end TauCetiRoadmap.ProfiniteProPGroups
